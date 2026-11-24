mod bind.sdl.surface;
import "./sdl.sl";
import "std/err.sl";

#[abi("C"), link_name]
extern fn SDL_CreateSurface(width: i32, height: i32, format: bind.sdl.PixelFormat) -> *void;
#[abi("C"), link_name]
extern fn SDL_DestroySurface(surface: *void) -> void;
#[abi("C"), link_name]
extern fn SDL_LoadBMP(file: *u8) -> *void;
#[abi("C"), link_name]
extern fn SDL_SaveBMP(surface: *void, file: *u8) -> bool;
#[abi("C"), link_name]
extern fn SDL_LockSurface(surface: *void) -> bool;
#[abi("C"), link_name]
extern fn SDL_UnlockSurface(surface: *void) -> void;
#[abi("C"), link_name]
extern fn SDL_FillSurfaceRect(surface: *void, rect: *bind.sdl.Rect, color: u32) -> bool;
#[abi("C"), link_name]
extern fn SDL_BlitSurface(source: *void, source_rect: *bind.sdl.Rect, destination: *void, destination_rect: *bind.sdl.Rect) -> bool;

/// Managed handle wrapping an SDL_Surface pointer.
pub struct Surface {
	pub handle: *void,
}

impl bind.sdl.Disposable for Surface {
	fn destroy(self: *Self) -> void {
		SDL_DestroySurface(self.handle);
	}
}

/// Creates an SDL surface with the requested dimensions and pixel format.
pub fn create(width: i32, height: i32, format: bind.sdl.PixelFormat) -> std.err.Option<Surface> {
	let raw: *void = SDL_CreateSurface(width, height, format);
	if raw == null {
		return .None;
	}
	return .Some(wrap(raw));
}

/// Loads a BMP image from a file into a managed Surface.
pub fn load_bmp(file: *u8) -> std.err.Option<Surface> {
	let raw: *void = SDL_LoadBMP(file);
	if raw == null {
		return .None;
	}
	return .Some(wrap(raw));
}

/// Wraps a raw SDL_Surface pointer in a Surface handle.
pub fn wrap(raw: *void) -> Surface {
	let mut s: Surface;
	s.handle = raw;
	return s;
}

/// Locks a surface for direct pixel access.
pub fn lock(surf: *Surface) -> bool {
	return SDL_LockSurface(surf.handle);
}

/// Unlocks a previously locked surface.
pub fn unlock(surf: *Surface) -> void {
	SDL_UnlockSurface(surf.handle);
}

/// Saves a surface as a BMP image.
pub fn save_bmp(surf: *Surface, file: *u8) -> bool {
	return SDL_SaveBMP(surf.handle, file);
}

/// Fills a surface rectangle with a pixel value.
pub fn fill_rect(surf: *Surface, rect: *bind.sdl.Rect, color: u32) -> bool {
	return SDL_FillSurfaceRect(surf.handle, rect, color);
}

/// Copies pixels from one surface to another.
pub fn blit(src: *Surface, src_rect: *bind.sdl.Rect, dst: *Surface, dst_rect: *bind.sdl.Rect) -> bool {
	return SDL_BlitSurface(src.handle, src_rect, dst.handle, dst_rect);
}
