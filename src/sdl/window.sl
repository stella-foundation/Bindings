mod bind.sdl.window;
import "./sdl.sl";
import "std/err.sl";

#[abi("C"), link_name]
extern fn SDL_CreateWindow(title: *u8, width: i32, height: i32, flags: bind.sdl.WindowFlags) -> *void;
#[abi("C"), link_name]
extern fn SDL_DestroyWindow(window: *void) -> void;
#[abi("C"), link_name]
extern fn SDL_GetWindowID(window: *void) -> u32;
#[abi("C"), link_name]
extern fn SDL_GetWindowFromID(id: u32) -> *void;
#[abi("C"), link_name]
extern fn SDL_GetWindowFlags(window: *void) -> bind.sdl.WindowFlags;
#[abi("C"), link_name]
extern fn SDL_SetWindowTitle(window: *void, title: *u8) -> bool;
#[abi("C"), link_name]
extern fn SDL_GetWindowTitle(window: *void) -> *u8;
#[abi("C"), link_name]
extern fn SDL_SetWindowPosition(window: *void, x: i32, y: i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_GetWindowPosition(window: *void, x: *mut i32, y: *mut i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetWindowSize(window: *void, width: i32, height: i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_GetWindowSize(window: *void, width: *mut i32, height: *mut i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_GetWindowSizeInPixels(window: *void, width: *mut i32, height: *mut i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetWindowResizable(window: *void, resizable: bool) -> bool;
#[abi("C"), link_name]
extern fn SDL_ShowWindow(window: *void) -> bool;
#[abi("C"), link_name]
extern fn SDL_HideWindow(window: *void) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetWindowFullscreen(window: *void, fullscreen: bool) -> bool;

/// Managed handle wrapping an SDL_Window pointer.
pub struct Window {
	pub handle: *void,
}

impl bind.sdl.Disposable for Window {
	fn destroy(self: *Self) -> void {
		SDL_DestroyWindow(self.handle);
	}
}

/// Creates a window with the requested title, size, and flags.
pub fn create(title: *u8, width: i32, height: i32, flags: bind.sdl.WindowFlags) -> std.err.Option<Window> {
	let raw: *void = SDL_CreateWindow(title, width, height, flags);
	if raw == null {
		return .None;
	}
	return .Some(wrap(raw));
}

/// Wraps a raw SDL_Window pointer in a Window handle.
pub fn wrap(raw: *void) -> Window {
	let mut w: Window;
	w.handle = raw;
	return w;
}

/// Returns a window's SDL identifier.
pub fn id(win: *Window) -> u32 { return SDL_GetWindowID(win.handle); }
/// Looks up a window by its SDL identifier.
pub fn from_id(id: u32) -> std.err.Option<Window> {
	let raw: *void = SDL_GetWindowFromID(id);
	if raw == null {
		return .None;
	}
	return .Some(wrap(raw));
}
/// Returns a window's current flags.
pub fn flags(win: *Window) -> bind.sdl.WindowFlags { return SDL_GetWindowFlags(win.handle); }
/// Sets a window's title.
pub fn set_title(win: *Window, title: *u8) -> bool { return SDL_SetWindowTitle(win.handle, title); }
/// Returns a window's title.
pub fn title(win: *Window) -> *u8 { return SDL_GetWindowTitle(win.handle); }
/// Sets a window's position.
pub fn set_position(win: *Window, x: i32, y: i32) -> bool { return SDL_SetWindowPosition(win.handle, x, y); }
/// Retrieves a window's position.
pub fn position(win: *Window, x: *mut i32, y: *mut i32) -> bool { return SDL_GetWindowPosition(win.handle, x, y); }
/// Sets a window's size.
pub fn set_size(win: *Window, width: i32, height: i32) -> bool { return SDL_SetWindowSize(win.handle, width, height); }
/// Retrieves a window's size in screen coordinates.
pub fn size(win: *Window, width: *mut i32, height: *mut i32) -> bool { return SDL_GetWindowSize(win.handle, width, height); }
/// Retrieves a window's drawable size in pixels.
pub fn size_in_pixels(win: *Window, width: *mut i32, height: *mut i32) -> bool { return SDL_GetWindowSizeInPixels(win.handle, width, height); }
/// Enables or disables window resizing.
pub fn set_resizable(win: *Window, resizable: bool) -> bool { return SDL_SetWindowResizable(win.handle, resizable); }
/// Shows a window.
pub fn show(win: *Window) -> bool { return SDL_ShowWindow(win.handle); }
/// Hides a window.
pub fn hide(win: *Window) -> bool { return SDL_HideWindow(win.handle); }
/// Enables or disables fullscreen mode.
pub fn set_fullscreen(win: *Window, fullscreen: bool) -> bool { return SDL_SetWindowFullscreen(win.handle, fullscreen); }
