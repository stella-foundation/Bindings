mod bind.sdl.renderer;
import "./sdl.sl";
import "./window.sl";
import "./surface.sl";

#[abi("C"), link_name]
extern fn SDL_CreateRenderer(window: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn SDL_DestroyRenderer(renderer: *void) -> void;
#[abi("C"), link_name]
extern fn SDL_GetRenderer(window: *void) -> *void;
#[abi("C"), link_name]
extern fn SDL_GetRenderWindow(renderer: *void) -> *void;
#[abi("C"), link_name]
extern fn SDL_GetRendererName(renderer: *void) -> *u8;
#[abi("C"), link_name]
extern fn SDL_CreateTexture(renderer: *void, format: bind.sdl.PixelFormat, access: bind.sdl.TextureAccess, width: i32, height: i32) -> *void;
#[abi("C"), link_name]
extern fn SDL_CreateTextureFromSurface(renderer: *void, surface: *void) -> *void;
#[abi("C"), link_name]
extern fn SDL_DestroyTexture(texture: *void) -> void;
#[abi("C"), link_name]
extern fn SDL_GetTextureSize(texture: *void, width: *mut f32, height: *mut f32) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetTextureColorMod(texture: *void, r: u8, g: u8, b: u8) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetTextureAlphaMod(texture: *void, alpha: u8) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetTextureBlendMode(texture: *void, mode: bind.sdl.BlendMode) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetTextureScaleMode(texture: *void, mode: bind.sdl.ScaleMode) -> bool;
#[abi("C"), link_name]
extern fn SDL_UpdateTexture(texture: *void, rect: *bind.sdl.Rect, pixels: *void, pitch: i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_LockTexture(texture: *void, rect: *bind.sdl.Rect, pixels: **u8, pitch: *mut i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_UnlockTexture(texture: *void) -> void;
#[abi("C"), link_name]
extern fn SDL_SetRenderTarget(renderer: *void, texture: *void) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetRenderLogicalPresentation(renderer: *void, width: i32, height: i32, mode: i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetRenderViewport(renderer: *void, rect: *bind.sdl.Rect) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetRenderScale(renderer: *void, scale_x: f32, scale_y: f32) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetRenderDrawColor(renderer: *void, r: u8, g: u8, b: u8, a: u8) -> bool;
#[abi("C"), link_name]
extern fn SDL_SetRenderDrawBlendMode(renderer: *void, mode: bind.sdl.BlendMode) -> bool;
#[abi("C"), link_name]
extern fn SDL_RenderClear(renderer: *void) -> bool;
#[abi("C"), link_name]
extern fn SDL_RenderPoint(renderer: *void, x: f32, y: f32) -> bool;
#[abi("C"), link_name]
extern fn SDL_RenderLine(renderer: *void, x1: f32, y1: f32, x2: f32, y2: f32) -> bool;
#[abi("C"), link_name]
extern fn SDL_RenderRect(renderer: *void, rect: *bind.sdl.FRect) -> bool;
#[abi("C"), link_name]
extern fn SDL_RenderFillRect(renderer: *void, rect: *bind.sdl.FRect) -> bool;
#[abi("C"), link_name]
extern fn SDL_RenderTexture(renderer: *void, texture: *void, source: *bind.sdl.FRect, destination: *bind.sdl.FRect) -> bool;
#[abi("C"), link_name]
extern fn SDL_RenderTextureRotated(renderer: *void, texture: *void, source: *bind.sdl.FRect, destination: *bind.sdl.FRect, angle: f64, center: *bind.sdl.FPoint, flip: bind.sdl.FlipMode) -> bool;
#[abi("C"), link_name]
extern fn SDL_RenderGeometry(renderer: *void, texture: *void, vertices: *bind.sdl.Vertex, vertex_count: i32, indices: *i32, index_count: i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_RenderPresent(renderer: *void) -> bool;

/// Managed handle wrapping an SDL_Renderer pointer.
pub struct Renderer {
	pub handle: *void,
}

/// Managed handle wrapping an SDL_Texture pointer.
pub struct Texture {
	pub handle: *void,
}

impl bind.sdl.Disposable for Renderer {
	fn destroy(self: *Self) -> void {
		SDL_DestroyRenderer(self.handle);
	}
}

impl bind.sdl.Disposable for Texture {
	fn destroy(self: *Self) -> void {
		SDL_DestroyTexture(self.handle);
	}
}

/// Creates the default renderer for a window.
pub fn create(win: *bind.sdl.window.Window) -> Renderer {
	let mut r: Renderer;
	r.handle = SDL_CreateRenderer(win.handle, null);
	return r;
}

/// Creates a renderer for a window using a named backend.
pub fn create_named(win: *bind.sdl.window.Window, name: *u8) -> Renderer {
	let mut r: Renderer;
	r.handle = SDL_CreateRenderer(win.handle, name);
	return r;
}

/// Wraps a raw SDL_Renderer pointer in a Renderer handle.
pub fn wrap(raw: *void) -> Renderer {
	let mut r: Renderer;
	r.handle = raw;
	return r;
}

/// Wraps a raw SDL_Texture pointer in a Texture handle.
pub fn wrap_texture(raw: *void) -> Texture {
	let mut t: Texture;
	t.handle = raw;
	return t;
}

/// Returns the renderer associated with a window.
pub fn get(win: *bind.sdl.window.Window) -> Renderer {
	return wrap(SDL_GetRenderer(win.handle));
}

/// Returns the window associated with a renderer.
pub fn window(ren: *Renderer) -> bind.sdl.window.Window {
	return bind.sdl.window.wrap(SDL_GetRenderWindow(ren.handle));
}

/// Returns the backend name of a renderer.
pub fn name(ren: *Renderer) -> *u8 {
	return SDL_GetRendererName(ren.handle);
}

/// Creates a texture with the requested format, access mode, and dimensions.
pub fn create_texture(ren: *Renderer, format: bind.sdl.PixelFormat, access: bind.sdl.TextureAccess, width: i32, height: i32) -> Texture {
	return wrap_texture(SDL_CreateTexture(ren.handle, format, access, width, height));
}

/// Creates a texture from a surface.
pub fn texture_from_surface(ren: *Renderer, surf: *bind.sdl.surface.Surface) -> Texture {
	return wrap_texture(SDL_CreateTextureFromSurface(ren.handle, surf.handle));
}

/// Sets the texture used as the renderer's target.
pub fn set_target(ren: *Renderer, tex: *Texture) -> bool {
	return SDL_SetRenderTarget(ren.handle, tex == null ? null : tex.handle);
}

/// Configures logical presentation dimensions and scaling mode.
pub fn set_logical_presentation(ren: *Renderer, width: i32, height: i32, mode: i32) -> bool {
	return SDL_SetRenderLogicalPresentation(ren.handle, width, height, mode);
}

/// Sets the renderer's viewport rectangle.
pub fn set_viewport(ren: *Renderer, rect: *bind.sdl.Rect) -> bool {
	return SDL_SetRenderViewport(ren.handle, rect);
}

/// Sets horizontal and vertical renderer scaling.
pub fn set_scale(ren: *Renderer, scale_x: f32, scale_y: f32) -> bool {
	return SDL_SetRenderScale(ren.handle, scale_x, scale_y);
}

/// Sets the renderer's draw color.
pub fn draw_color(ren: *Renderer, r: u8, g: u8, b: u8, a: u8) -> bool {
	return SDL_SetRenderDrawColor(ren.handle, r, g, b, a);
}

/// Sets the renderer's draw blend mode.
pub fn draw_blend(ren: *Renderer, mode: bind.sdl.BlendMode) -> bool {
	return SDL_SetRenderDrawBlendMode(ren.handle, mode);
}

/// Clears the current render target.
pub fn clear(ren: *Renderer) -> bool {
	return SDL_RenderClear(ren.handle);
}

/// Draws a point.
pub fn point(ren: *Renderer, x: f32, y: f32) -> bool {
	return SDL_RenderPoint(ren.handle, x, y);
}

/// Draws a line segment.
pub fn line(ren: *Renderer, x1: f32, y1: f32, x2: f32, y2: f32) -> bool {
	return SDL_RenderLine(ren.handle, x1, y1, x2, y2);
}

/// Draws the outline of a rectangle.
pub fn rect(ren: *Renderer, area: *bind.sdl.FRect) -> bool {
	return SDL_RenderRect(ren.handle, area);
}

/// Draws a filled rectangle.
pub fn fill_rect(ren: *Renderer, area: *bind.sdl.FRect) -> bool {
	return SDL_RenderFillRect(ren.handle, area);
}

/// Draws a texture in the destination rectangle.
pub fn texture(ren: *Renderer, tex: *Texture, source: *bind.sdl.FRect, destination: *bind.sdl.FRect) -> bool {
	return SDL_RenderTexture(ren.handle, tex.handle, source, destination);
}

/// Draws a texture with rotation and optional flipping.
pub fn texture_rotated(ren: *Renderer, tex: *Texture, source: *bind.sdl.FRect, destination: *bind.sdl.FRect, angle: f64, center: *bind.sdl.FPoint, flip: bind.sdl.FlipMode) -> bool {
	return SDL_RenderTextureRotated(ren.handle, tex.handle, source, destination, angle, center, flip);
}

/// Draws indexed or non-indexed vertex geometry.
pub fn geometry(ren: *Renderer, tex: *Texture, vertices: *bind.sdl.Vertex, vertex_count: i32, indices: *i32, index_count: i32) -> bool {
	return SDL_RenderGeometry(ren.handle, tex == null ? null : tex.handle, vertices, vertex_count, indices, index_count);
}

/// Presents the rendered backbuffer.
pub fn present(ren: *Renderer) -> bool {
	return SDL_RenderPresent(ren.handle);
}

// --- Texture methods ---

/// Retrieves a texture's dimensions.
pub fn size(tex: *Texture, width: *mut f32, height: *mut f32) -> bool {
	return SDL_GetTextureSize(tex.handle, width, height);
}

/// Sets a texture's RGB color modulation.
pub fn set_color(tex: *Texture, r: u8, g: u8, b: u8) -> bool {
	return SDL_SetTextureColorMod(tex.handle, r, g, b);
}

/// Sets a texture's alpha modulation.
pub fn set_alpha(tex: *Texture, alpha: u8) -> bool {
	return SDL_SetTextureAlphaMod(tex.handle, alpha);
}

/// Sets a texture's blend mode.
pub fn set_blend(tex: *Texture, mode: bind.sdl.BlendMode) -> bool {
	return SDL_SetTextureBlendMode(tex.handle, mode);
}

/// Sets a texture's scale mode.
pub fn set_scale(tex: *Texture, mode: bind.sdl.ScaleMode) -> bool {
	return SDL_SetTextureScaleMode(tex.handle, mode);
}

/// Updates a texture with pixel data.
pub fn update(tex: *Texture, rect: *bind.sdl.Rect, pixels: *void, pitch: i32) -> bool {
	return SDL_UpdateTexture(tex.handle, rect, pixels, pitch);
}

/// Locks a texture for direct pixel access.
pub fn lock(tex: *Texture, rect: *bind.sdl.Rect, pixels: **u8, pitch: *mut i32) -> bool {
	return SDL_LockTexture(tex.handle, rect, pixels, pitch);
}

/// Unlocks a previously locked texture.
pub fn unlock(tex: *Texture) -> void {
	SDL_UnlockTexture(tex.handle);
}
