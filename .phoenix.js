'use strict';

var keys = [];
var controlShift = ['ctrl', 'shift'];
var controlAltShift = ['ctrl', 'alt', 'shift'];
var controlCommandShift = ['ctrl', 'cmd', 'shift'];
var margin = 0;
var increment = 0.05;

/* Position */

var Position = {
  
  central: function(frame, window) {

    return {

      x: frame.x + ((frame.width - window.width) / 2),
      y: frame.y + ((frame.height - window.height) / 2)

    };
  },

  top: function(frame, window) {

    return {

      x: window.x,
      y: frame.y

    };
  },

  bottom: function(frame, window) {

    return {

      x: window.x,
      y: (frame.y + frame.height) - window.height

    };
  },

  left: function(frame, window) {

    return {

      x: frame.x,
      y: window.y

    };
  },

  right: function(frame, window) {

    return {

      x: (frame.x + frame.width) - window.width,
      y: window.y

    };
  },

  topLeft: function(frame, window, margin) {

    return {

      x: Position.left(frame, window).x + margin,
      y: Position.top(frame, window).y + margin

    };
  },

  topRight: function(frame, window, margin) {

    return {

      x: Position.right(frame, window).x - margin,
      y: Position.top(frame, window).y + margin

    };
  },

  bottomLeft: function(frame, window, margin) {

    return {

      x: Position.left(frame, window).x + margin,
      y: Position.bottom(frame, window).y - margin

    };
  },

  bottomRight: function(frame, window, margin) {

    return {

      x: Position.right(frame, window).x - margin,
      y: Position.bottom(frame, window).y - margin

    };
  }
};

/* Grid */

var Frame = {

  width: 1,
  height: 1,

  half: {

    width: 0.5,
    height: 0.5

  }
};

/* Window Functions */

Window.prototype.to = function(position) {

  this.setTopLeft(position(this.screen().visibleFrameInRectangle(), this.frame(), margin));
}

Window.prototype.grid = function(x, y, reverse) {

  var frame = this.screen().visibleFrameInRectangle();

  var newWindowFrame = _(this.frame()).extend({

    width: (frame.width * x) - (2 * margin),
    height: (frame.height * y) - (2 * margin)

  });

  var position = reverse ? Position.topRight(frame, newWindowFrame, margin) :
    Position.topLeft(frame, newWindowFrame, margin);

  this.setFrame(_(newWindowFrame).extend(position));
}

Window.prototype.snapSize = function(axis) {
Phoenix.log(axis);
var modalmessage = new Modal();
modalmessage.message = 'test';
modal.duration = 2;
modal.show();
  var frame = this.screen().visibleFrameInRectangle();

  if (axis === 'x') {
   var newWindowFrame = _(this.frame()).extend({
     width: (frame.width)
   });
  } else {
   var newWindowFrame = _(this.frame()).extend({
     height: (frame.height)
   }); 
  }

  var position = reverse ? Position.topRight(frame, newWindowFrame, margin) :
    Position.topLeft(frame, newWindowFrame, margin);

  this.setFrame(_(newWindowFrame).extend(position));
}

Window.prototype.reverseGrid = function(x, y) {

  this.grid(x, y, true);
}

Window.prototype.resize = function(multiplier) {

  var frame = this.screen().visibleFrameInRectangle();
  var newSize = this.size();

  if (multiplier.x) {
    newSize.width += frame.width * multiplier.x;
  }

  if (multiplier.y) {
    newSize.height += frame.height * multiplier.y;
  }

  this.setSize(newSize);
}

Window.prototype.increaseWidth = function() {

  this.resize({
    x: increment
  });
}

Window.prototype.decreaseWidth = function() {

  this.resize({
    x: -increment
  });
}

Window.prototype.increaseHeight = function() {

  this.resize({
    y: increment
  });
}

Window.prototype.decreaseHeight = function() {

  this.resize({
    y: -increment
  });
}

/* Position Bindings */

keys.push(new Key('q', controlShift, function() {

  Window.focused() && Window.focused().to(Position.topLeft);
}));

keys.push(new Key('w', controlShift, function() {

  Window.focused() && Window.focused().to(Position.topRight);
}));

keys.push(new Key('a', controlShift, function() {

  Window.focused() && Window.focused().to(Position.bottomLeft);
}));

keys.push(new Key('s', controlShift, function() {

  Window.focused() && Window.focused().to(Position.bottomRight);
}));

keys.push(new Key('z', controlShift, function() {

  Window.focused() && Window.focused().to(Position.central);
}));

/* Grid Bindings */

keys.push(new Key('p', controlShift, function() {

  Window.focused() && Window.focused().grid(Frame.half.width, Frame.half.height);
}));

keys.push(new Key('o', controlShift, function() {

  Window.focused() && Window.focused().grid(Frame.width, Frame.half.height);
}));

keys.push(new Key('k', controlShift, function() {

  Window.focused() && Window.focused().grid(Frame.half.width, Frame.height);
}));

keys.push(new Key('l', controlShift, function() {

  Window.focused() && Window.focused().grid(Frame.width, Frame.height);
}));

/* Reverse Grid Bindings */

keys.push(new Key('å', controlAltShift, function() {

  Window.focused() && Window.focused().reverseGrid(Frame.half.width, Frame.half.height);
}));

keys.push(new Key('p', controlAltShift, function() {

  Window.focused() && Window.focused().reverseGrid(Frame.width, Frame.half.height);
}));

keys.push(new Key('ä', controlAltShift, function() {

  Window.focused() && Window.focused().reverseGrid(Frame.half.width, Frame.height);
}));

keys.push(new Key('ö', controlAltShift, function() {

  Window.focused() && Window.focused().reverseGrid(Frame.width, Frame.height);
}));

/* Resize Bindings */

keys.push(new Key(',', controlShift, function() {

  Window.focused() && Window.focused().increaseWidth();
}));

keys.push(new Key('.', controlShift, function() {

  Window.focused() && Window.focused().increaseHeight();
}));

keys.push(new Key(',', controlAltShift, function() {

  Window.focused() && Window.focused().decreaseWidth();
}));

keys.push(new Key('.', controlAltShift, function() {

  Window.focused() && Window.focused().decreaseHeight();
}));

// make full width but same height
keys.push(new Key('z', controlCommandShift, function() {
var modalmessage = new Modal();
modalmessage.message = 'test';
modal.duration = 2;
modal.show();

  Window.focused() && Window.focused().snapSize('x');
}));

function focusApp(name) {
  Phoenix.log('About to focus ' + name);
  App.runningApps().forEach(function(app) {
    if (app.name() === name) {
      Phoenix.log('Found and focusing ' + name);
      Phoenix.log(app.focus());
      Phoenix.log('Done focusing ' + name);
    }
  });
}

keys.push(new Key('g', controlCommandShift, function () {
  focusApp('Google Chrome');
}));
keys.push(new Key('a', controlCommandShift, function () {
  focusApp('Atom');
}));
keys.push(new Key('s', controlCommandShift, function () {
  focusApp('Slack');
}));
keys.push(new Key('t', controlCommandShift, function () {
  focusApp('iTerm');
}));
keys.push(new Key('m', controlCommandShift, function () {
  focusApp('Messages');
}));

