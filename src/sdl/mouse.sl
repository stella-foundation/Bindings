mod bind.sdl.mouse;
import "./sdl.sl";
import "./window.sl";

#[abi("C"), link_name]
extern fn SDL_GetMouseState(x: *mut f32, y: *mut f32) -> bind.sdl.MouseButtonMask;
#[abi("C"), link_name]
extern fn SDL_GetGlobalMouseState(x: *mut f32, y: *mut f32) -> bind.sdl.MouseButtonMask;
#[abi("C"), link_name]
extern fn SDL_GetRelativeMouseState(x: *mut f32, y: *mut f32) -> bind.sdl.MouseButtonMask;
#[abi("C"), link_name]
extern fn SDL_WarpMouseInWindow(window: *void, x: f32, y: f32) -> void;
#[abi("C"), link_name]
extern fn SDL_SetWindowRelativeMouseMode(window: *void, enabled: bool) -> bool;
#[abi("C"), link_name]
extern fn SDL_GetWindowRelativeMouseMode(window: *void) -> bool;
#[abi("C"), link_name]
extern fn SDL_CaptureMouse(enabled: bool) -> bool;
#[abi("C"), link_name]
extern fn SDL_ShowCursor() -> bool;
#[abi("C"), link_name]
extern fn SDL_HideCursor() -> bool;
#[abi("C"), link_name]
extern fn SDL_CursorVisible() -> bool;

/// Returns mouse coordinates relative to the focused window and button state.
pub fn state(x: *mut f32, y: *mut f32) -> bind.sdl.MouseButtonMask { return SDL_GetMouseState(x, y); }
/// Returns global mouse coordinates and button state.
pub fn global_state(x: *mut f32, y: *mut f32) -> bind.sdl.MouseButtonMask { return SDL_GetGlobalMouseState(x, y); }
/// Returns relative mouse movement and button state since the previous query.
pub fn relative_state(x: *mut f32, y: *mut f32) -> bind.sdl.MouseButtonMask { return SDL_GetRelativeMouseState(x, y); }
/// Moves the mouse pointer within a window.
pub fn warp(win: *bind.sdl.window.Window, x: f32, y: f32) -> void { SDL_WarpMouseInWindow(win.handle, x, y); }
/// Enables or disables relative mouse mode for a window.
pub fn set_relative_mode(win: *bind.sdl.window.Window, enabled: bool) -> bool { return SDL_SetWindowRelativeMouseMode(win.handle, enabled); }
/// Reports whether relative mouse mode is enabled for a window.
pub fn relative_mode(win: *bind.sdl.window.Window) -> bool { return SDL_GetWindowRelativeMouseMode(win.handle); }
/// Enables or disables mouse capture.
pub fn capture(enabled: bool) -> bool { return SDL_CaptureMouse(enabled); }
/// Shows the mouse cursor.
pub fn show_cursor() -> bool { return SDL_ShowCursor(); }
/// Hides the mouse cursor.
pub fn hide_cursor() -> bool { return SDL_HideCursor(); }
/// Reports whether the mouse cursor is visible.
pub fn cursor_visible() -> bool { return SDL_CursorVisible(); }
