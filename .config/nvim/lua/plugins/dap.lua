return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      -- Set leader key early
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "
      
      local dap = require("dap")

      -- Load telescope DAP extension if available
      local ok, _ = pcall(require, "telescope")
      if ok then
        pcall(require("telescope").load_extension, "dap")
      end

      -- Enhanced PHP Xdebug configuration
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/Code/vscode-php-debug/out/phpDebug.js" },
        -- Add connection timeout and retry settings
        options = {
          cwd = vim.fn.getcwd(),
          env = {
            NODE_ENV = "development"
          }
        }
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          pathMappings = {
            ["/var/www/html"] = vim.fn.getcwd()
          },
          -- Connection and evaluation settings
          stopOnEntry = false,
          serverReadyTimeout = 20000,
          -- Enhanced scope and variable configuration
          showAsyncStacks = true,
          showGlobalVariables = true,
          showLocalVariables = true,
          showStaticVariables = true,
          -- Force variable evaluation
          evaluateExpressions = true,
          -- Better error handling
          ignore = {},
          -- Additional Xdebug settings for better variable inspection
          xdebugSettings = {
            max_children = 128,
            max_data = 1024,
            max_depth = 3,
            show_hidden = 1,
          },
          -- Ensure proper connection
          log = true,
          -- Force scope refresh
          supportsVariableType = true,
          supportsVariablePaging = true,
          supportsRunInTerminalRequest = true,
        }
      }

      -- DAP UI setup
      require("dapui").setup({
        layouts = {
          {
            elements = {
              "scopes",
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 10,
            position = "bottom",
          },
        },
        floating = {
          border = "rounded",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        -- Enhanced scope configuration
        controls = {
          enabled = true,
          element = "repl",
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏭",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "⏮",
            run_last = "🔄",
            terminate = "⏹",
          },
        },
        -- Force refresh scopes when stopped
        force_buffers = true,
      })

      -- DAP Virtual Text setup (optional - shows variable values inline)
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        show_stop_reason = true,
        virt_text_pos = "eol",
      })

      -- DAP event handlers
      local dapui = require("dapui")

      -- Auto-open DAP UI when debugging starts
      dap.listeners.after.event_initialized["dapui_config"] = function()
        pcall(dapui.open)
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        pcall(dapui.close)
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        pcall(dapui.close)
      end

      -- Add error handling for stopped events
      dap.listeners.after.event_stopped["dapui_config"] = function()
        pcall(dapui.open)
        print("🔍 Debugger stopped at breakpoint")
        
        -- Force refresh scopes and variables
        vim.defer_fn(function()
          local session = dap.session()
          if session and session.current_frame then
            print("📍 Current frame:", session.current_frame.source.name, "line", session.current_frame.line)
            print("🔗 Session connected:", session.connected and "Yes" or "No")
            print("🆔 Thread ID:", session.stopped_thread_id or "None")
            
            -- Force scope refresh
            pcall(function()
              dapui.refresh()
            end)
            
            -- Try to manually request scopes
            if session.current_frame.id then
              pcall(function()
                session:request_scopes(session.current_frame.id, function(err, scopes)
                  if err then
                    print("❌ Error requesting scopes:", err.message or err)
                  else
                    print("✅ Scopes requested successfully, count:", scopes and #scopes or 0)
                    if scopes then
                      for i, scope in ipairs(scopes) do
                        print("  Scope", i, ":", scope.name, "variables:", scope.variablesReference)
                      end
                    end
                  end
                end)
              end)
            end
          end
        end, 200)
      end

      -- Add connection event handlers
      dap.listeners.after.event_initialized["connection_debug"] = function()
        print("🔗 DAP connection initialized")
        local session = dap.session()
        if session then
          print("Session ID:", session.id)
          print("Connected:", session.connected)
        end
      end

      dap.listeners.after.event_terminated["connection_debug"] = function()
        print("🔌 DAP connection terminated")
      end

      dap.listeners.after.event_exited["connection_debug"] = function()
        print("🚪 DAP connection exited")
      end

      -- Basic keybindings
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "Continue" })
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>b", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Set Breakpoint" })
      vim.keymap.set("n", "<leader>dr", function()
        dap.repl.open()
      end, { desc = "Open REPL" })
      vim.keymap.set("n", "<leader>dl", function()
        dap.run_last()
      end, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>dp", function()
        local config = dap.configurations.php[1]
        if not config then
          print("❌ No PHP debug configuration found")
          return
        end
        
        print("🚀 Starting PHP debugger...")
        print("Configuration:", config.name)
        print("Port:", config.port)
        print("Path mapping: /var/www/html -> " .. config.pathMappings["/var/www/html"])
        print("Waiting for Xdebug connection...")
        
        -- Use pcall to handle errors
        local ok, err = pcall(function()
          dap.run(config)
        end)
        
        if not ok then
          print("❌ Error starting debugger:", err)
          print("Try :DapTest to check your setup")
        end
      end, { desc = "Start PHP Debug" })
      vim.keymap.set("n", "<leader>dt", function()
        require("dapui").toggle()
      end, { desc = "Toggle DAP UI" })

      -- Simple commands
      vim.api.nvim_create_user_command("DapSetPath", function(opts)
        local project_path = opts.args ~= "" and opts.args or vim.fn.getcwd()
        project_path = vim.fn.fnamemodify(project_path, ":p")
        
        print("Setting debug path to:", project_path)
        
        dap.configurations.php[1].pathMappings = {
          ["/var/www/html"] = project_path
        }
        
        print("Path mapping updated: /var/www/html -> " .. project_path)
      end, { nargs = "?", complete = "dir" })

      vim.api.nvim_create_user_command("DapStatus", function()
        local session = dap.session()
        if session then
          print("Debug session active - ID:", session.id)
          print("Status:", session.stopped_thread_id and "Stopped" or "Running")
          if session.current_frame then
            print("Current file:", session.current_frame.source.path)
            print("Current line:", session.current_frame.line)
          end
        else
          print("No active debug session")
        end
      end, {})

      vim.api.nvim_create_user_command("DapStart", function()
        local config = dap.configurations.php[1]
        if not config then
          print("❌ No PHP debug configuration found")
          return
        end
        
        print("🚀 Starting PHP debugger...")
        print("Configuration:", config.name)
        print("Port:", config.port)
        print("Path mapping: /var/www/html -> " .. config.pathMappings["/var/www/html"])
        print("Waiting for Xdebug connection...")
        
        dap.run(config)
      end, {})

      vim.api.nvim_create_user_command("DapTest", function()
        print("=== Testing DAP Setup ===")
        
        -- Check if DAP is loaded
        local dap_ok, dap = pcall(require, "dap")
        if not dap_ok then
          print("❌ DAP not loaded")
          return
        end
        print("✅ DAP loaded")
        
        -- Check if PHP adapter exists
        if dap.adapters.php then
          print("✅ PHP adapter configured")
          print("  Command:", dap.adapters.php.command)
          print("  Args:", table.concat(dap.adapters.php.args, " "))
        else
          print("❌ PHP adapter not configured")
        end
        
        -- Check if PHP configuration exists
        if dap.configurations.php and #dap.configurations.php > 0 then
          print("✅ PHP configuration found")
          local config = dap.configurations.php[1]
          print("  Name:", config.name)
          print("  Port:", config.port)
          print("  Path mappings:", vim.inspect(config.pathMappings))
        else
          print("❌ PHP configuration not found")
        end
        
        -- Check if adapter file exists
        local adapter_path = os.getenv("HOME") .. "/Code/vscode-php-debug/out/phpDebug.js"
        if vim.fn.filereadable(adapter_path) == 1 then
          print("✅ Adapter file exists:", adapter_path)
        else
          print("❌ Adapter file not found:", adapter_path)
        end
        
        -- Check leader key
        print("Leader key:", vim.g.mapleader or "not set")
        print("Local leader key:", vim.g.maplocalleader or "not set")
        
        print("")
        print("If everything looks good, try <leader>dp or :DapStart to start debugging")
      end, {})

      vim.api.nvim_create_user_command("DapScopes", function()
        local session = dap.session()
        if not session then
          print("❌ No active debug session")
          return
        end
        
        print("=== Current Debug Session ===")
        print("Session ID:", session.id)
        print("Status:", session.stopped_thread_id and "Stopped" or "Running")
        
        if session.current_frame then
          print("Current frame:")
          print("  File:", session.current_frame.source.path or "unknown")
          print("  Line:", session.current_frame.line)
          print("  Function:", session.current_frame.name or "unknown")
          
          -- Try to get scopes
          if session.current_frame.id then
            print("Frame ID:", session.current_frame.id)
            print("Attempting to fetch scopes...")
            
            -- This is a bit of a hack to trigger scope refresh
            vim.defer_fn(function()
              pcall(function()
                local dapui = require("dapui")
                dapui.refresh()
                print("✅ DAP UI refreshed - check the scopes panel")
              end)
            end, 100)
          end
        else
          print("❌ No current frame")
        end
      end, {})

      vim.api.nvim_create_user_command("DapRefresh", function()
        local dapui = require("dapui")
        pcall(function()
          dapui.refresh()
          print("✅ DAP UI refreshed")
        end)
      end, {})

      vim.api.nvim_create_user_command("DapLogs", function()
        print("=== DAP Logs ===")
        local session = dap.session()
        if session then
          print("Session ID:", session.id)
          print("Connected:", session.connected and "Yes" or "No")
          print("Stopped Thread ID:", session.stopped_thread_id or "None")
          if session.current_frame then
            print("Current Frame ID:", session.current_frame.id or "None")
            print("Current Frame Name:", session.current_frame.name or "None")
            print("Current File:", session.current_frame.source.path or "None")
            print("Current Line:", session.current_frame.line or "None")
          end
        else
          print("No active session")
        end
        
        -- Try to show DAP logs
        pcall(function()
          dap.show_log()
        end)
      end, {})

      vim.api.nvim_create_user_command("DapForceScopes", function()
        local session = dap.session()
        if not session then
          print("❌ No active debug session")
          return
        end
        
        if not session.current_frame or not session.current_frame.id then
          print("❌ No current frame or frame ID")
          return
        end
        
        print("🔄 Force requesting scopes for frame:", session.current_frame.id)
        pcall(function()
          session:request_scopes(session.current_frame.id, function(err, scopes)
            if err then
              print("❌ Error requesting scopes:", err.message or err)
            else
              print("✅ Scopes received, count:", scopes and #scopes or 0)
              if scopes then
                for i, scope in ipairs(scopes) do
                  print("  Scope", i, ":", scope.name, "variables:", scope.variablesReference)
                  
                  -- Try to get variables for each scope
                  if scope.variablesReference > 0 then
                    session:request_variables(scope.variablesReference, function(var_err, variables)
                      if var_err then
                        print("    ❌ Error getting variables:", var_err.message or var_err)
                      else
                        print("    ✅ Variables count:", variables and #variables or 0)
                        if variables then
                          for j, variable in ipairs(variables) do
                            print("      Variable", j, ":", variable.name, "=", variable.value or "nil")
                          end
                        end
                      end
                    end)
                  end
                end
              end
            end
          end)
        end)
      end, {})
    end,
  },
}