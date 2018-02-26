#include "ergodox_ez.h"
#include "debug.h"
#include "action_layer.h"
#include "version.h"


#include "keymap_german.h"

#include "keymap_nordic.h"



enum custom_keycodes {
  PLACEHOLDER = SAFE_RANGE, // can always be here
  EPRM,
  VRSN,
  RGB_SLD,
  
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [0] = KEYMAP(KC_TILD,KC_AMPR,KC_LBRACKET,KC_LCBR,KC_RCBR,KC_LPRN,KC_PERC,KC_TAB,KC_SCOLON,KC_COMMA,KC_DOT,KC_P,KC_Y,KC_CIRC,KC_ESCAPE,KC_A,KC_O,KC_E,KC_U,KC_I,KC_LSHIFT,KC_QUOTE,KC_Q,KC_J,KC_K,KC_X,TT(1),KC_GRAVE,KC_TILD,KC_HASH,MO(1),CTL_T(KC_NO),KC_LGUI,KC_LALT,KC_LEFT,KC_TAB,KC_BSPACE,KC_RIGHT,KC_AT,KC_EQUAL,KC_ASTR,KC_RPRN,KC_PLUS,KC_RBRACKET,KC_EXLM,KC_DLR,KC_F,KC_G,KC_C,KC_R,KC_L,KC_QUES,KC_D,KC_H,KC_T,KC_N,KC_S,KC_MINUS,TO(2),KC_B,KC_M,KC_W,KC_V,KC_Z,KC_RSHIFT,RCTL_T(KC_NO),KC_TRANSPARENT,KC_BSLASH,KC_PIPE,KC_KP_SLASH,KC_RALT,KC_LGUI,KC_UP,KC_DOWN,KC_ENTER,KC_SPACE),

  [1] = KEYMAP(KC_ESCAPE,KC_F1,KC_F2,KC_F3,KC_F4,KC_F5,KC_F6,KC_TAB,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_ESCAPE,LCTL(LSFT(KC_I)),KC_TRANSPARENT,KC_MEDIA_PREV_TRACK,KC_MEDIA_NEXT_TRACK,KC_MEDIA_PLAY_PAUSE,KC_LSHIFT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,TO(0),KC_TRANSPARENT,LALT(RGUI(KC_S)),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_LGUI,KC_LALT,KC_AUDIO_MUTE,KC_TAB,KC_BSPACE,KC_AUDIO_VOL_DOWN,KC_F7,KC_F8,KC_F9,KC_F10,KC_F11,KC_F12,KC_F13,KC_TRANSPARENT,KC_TRANSPARENT,KC_7,KC_8,KC_9,KC_KP_ASTERISK,KC_TRANSPARENT,KC_TRANSPARENT,KC_4,KC_5,KC_6,KC_KP_PLUS,KC_TRANSPARENT,KC_TRANSPARENT,KC_DOT,KC_1,KC_2,KC_3,KC_KP_SLASH,KC_RSHIFT,KC_TRANSPARENT,KC_TRANSPARENT,KC_0,KC_EQUAL,KC_TRANSPARENT,KC_RALT,KC_LGUI,KC_TRANSPARENT,KC_AUDIO_VOL_UP,KC_ENTER,KC_SPACE),

  [2] = KEYMAP(KC_TRANSPARENT,KC_1,KC_2,KC_3,KC_4,KC_5,KC_TRANSPARENT,KC_TAB,KC_Q,KC_W,KC_E,KC_R,KC_T,KC_TRANSPARENT,KC_ESCAPE,KC_A,KC_S,KC_D,KC_F,KC_G,KC_LSHIFT,KC_Z,KC_X,KC_C,KC_V,KC_B,TO(1),KC_GRAVE,KC_QUOTE,KC_TRANSPARENT,KC_TRANSPARENT,CTL_T(KC_NO),KC_LGUI,KC_LALT,KC_LEFT,KC_TAB,KC_BSPACE,KC_RIGHT,KC_TRANSPARENT,KC_6,KC_7,KC_8,KC_9,KC_0,KC_MINUS,KC_TRANSPARENT,KC_Y,KC_U,KC_I,KC_O,KC_P,KC_BSLASH,KC_H,KC_J,KC_K,KC_L,KC_SCOLON,KC_QUOTE,TO(0),KC_N,KC_M,KC_COMMA,KC_DOT,KC_SLASH,KC_RSHIFT,RCTL_T(KC_NO),KC_TRANSPARENT,KC_LBRACKET,KC_RBRACKET,KC_TRANSPARENT,KC_RALT,KC_LGUI,KC_UP,KC_DOWN,KC_ENTER,KC_SPACE),

};

const uint16_t PROGMEM fn_actions[] = {
  [1] = ACTION_LAYER_TAP_TOGGLE(1)
};

// leaving this in place for compatibilty with old keymaps cloned and re-compiled.
const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt)
{
      switch(id) {
        case 0:
        if (record->event.pressed) {
          SEND_STRING (QMK_KEYBOARD "/" QMK_KEYMAP " @ " QMK_VERSION);
        }
        break;
      }
    return MACRO_NONE;
};

void matrix_init_user(void) {
#ifdef RGBLIGHT_COLOR_LAYER_0
  rgblight_setrgb(RGBLIGHT_COLOR_LAYER_0);
#endif
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    // dynamically generate these.
    case EPRM:
      if (record->event.pressed) {
        eeconfig_init();
      }
      return false;
      break;
    case VRSN:
      if (record->event.pressed) {
        SEND_STRING (QMK_KEYBOARD "/" QMK_KEYMAP " @ " QMK_VERSION);
      }
      return false;
      break;
    case RGB_SLD:
      if (record->event.pressed) {
        rgblight_mode(1);
      }
      return false;
      break;
    
  }
  return true;
}

uint32_t layer_state_set_user(uint32_t state) {

    uint8_t layer = biton32(state);

    ergodox_board_led_off();
    ergodox_right_led_1_off();
    ergodox_right_led_2_off();
    ergodox_right_led_3_off();
    switch (layer) {
      case 0:
        #ifdef RGBLIGHT_COLOR_LAYER_0
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_0);
        #endif
        break;
      case 1:
        ergodox_right_led_1_on();
        #ifdef RGBLIGHT_COLOR_LAYER_1
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_1);
        #endif
        break;
      case 2:
        ergodox_right_led_2_on();
        #ifdef RGBLIGHT_COLOR_LAYER_2
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_2);
        #endif
        break;
      case 3:
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_3
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_3);
        #endif
        break;
      case 4:
        ergodox_right_led_1_on();
        ergodox_right_led_2_on();
        #ifdef RGBLIGHT_COLOR_LAYER_4
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_4);
        #endif
        break;
      case 5:
        ergodox_right_led_1_on();
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_5
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_5);
        #endif
        break;
      case 6:
        ergodox_right_led_2_on();
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_6
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_6);
        #endif
        break;
      case 7:
        ergodox_right_led_1_on();
        ergodox_right_led_2_on();
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_7
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_6);
        #endif
        break;
      default:
        break;
    }
    return state;

};
