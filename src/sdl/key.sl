mod bind.sdl.key;
import "./sdl.sl";

#[abi("C"), link_name]
extern fn SDL_GetKeyboardState(numkeys: *mut i32) -> *bool;
#[abi("C"), link_name]
extern fn SDL_GetModState() -> bind.sdl.Keymod;
#[abi("C"), link_name]
extern fn SDL_SetModState(modstate: bind.sdl.Keymod) -> void;
#[abi("C"), link_name]
extern fn SDL_GetKeyFromScancode(scancode: bind.sdl.Scancode, modstate: bind.sdl.Keymod, key_event: bool) -> u32;
#[abi("C"), link_name]
extern fn SDL_GetScancodeFromKey(key: u32, modstate: *mut bind.sdl.Keymod) -> bind.sdl.Scancode;
#[abi("C"), link_name]
extern fn SDL_GetScancodeFromName(name: *u8) -> bind.sdl.Scancode;
#[abi("C"), link_name]
extern fn SDL_GetScancodeName(scancode: bind.sdl.Scancode) -> *u8;
#[abi("C"), link_name]
extern fn SDL_GetKeyName(key: u32) -> *u8;
#[abi("C"), link_name]
extern fn SDL_GetKeyFromName(name: *u8) -> u32;
#[abi("C"), link_name]
extern fn SDL_StartTextInput(window: *void) -> bool;
#[abi("C"), link_name]
extern fn SDL_StopTextInput(window: *void) -> bool;
#[abi("C"), link_name]
extern fn SDL_TextInputActive(window: *void) -> bool;

/// Reports whether a physical key is currently held down.
pub fn down(scancode: bind.sdl.Scancode) -> bool {
	let mut numkeys: i32;
	let state: *bool = SDL_GetKeyboardState(&numkeys);
	let code: i32 = scancode cast i32;
	if state == null || numkeys <= 0 || code < 0 || code >= numkeys { return false; }
	return state[code cast u32];
}
/// Reports whether the key identified by name is currently held down.
pub fn down_name(name: *u8) -> bool {
	let resolved: bind.sdl.Scancode = SDL_GetScancodeFromName(name);
	if resolved cast i32 <= 0 { return false; }
	return down(resolved);
}
/// Converts a key name to an SDL scancode.
pub fn from_name(name: *u8) -> bind.sdl.Scancode { return SDL_GetScancodeFromName(name); }
/// Returns the name associated with an SDL scancode.
pub fn name(scancode: bind.sdl.Scancode) -> *u8 { return SDL_GetScancodeName(scancode); }
/// Converts a keycode and modifiers to an SDL scancode.
pub fn from_key(key: u32, modstate: *mut bind.sdl.Keymod) -> bind.sdl.Scancode { return SDL_GetScancodeFromKey(key, modstate); }
/// Converts a scancode and modifiers to a keycode.
pub fn key_from_scancode(scancode: bind.sdl.Scancode, modstate: bind.sdl.Keymod, key_event: bool) -> u32 {
	return SDL_GetKeyFromScancode(scancode, modstate, key_event);
}
/// Converts a key name to a keycode.
pub fn key_from_name(name: *u8) -> u32 { return SDL_GetKeyFromName(name); }
/// Returns the name associated with a keycode.
pub fn key_name(key: u32) -> *u8 { return SDL_GetKeyName(key); }
/// Returns the current keyboard modifier state.
pub fn modifiers() -> bind.sdl.Keymod { return SDL_GetModState(); }
/// Sets the current keyboard modifier state.
pub fn set_modifiers(modstate: bind.sdl.Keymod) -> void { SDL_SetModState(modstate); }
/// Begins text input for a window.
pub fn start_text_input(window: *void) -> bool { return SDL_StartTextInput(window); }
/// Stops text input for a window.
pub fn stop_text_input(window: *void) -> bool { return SDL_StopTextInput(window); }
/// Reports whether text input is active for a window.
pub fn text_input_active(window: *void) -> bool { return SDL_TextInputActive(window); }
