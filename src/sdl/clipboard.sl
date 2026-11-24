mod bind.sdl.clipboard;

#[abi("C"), link_name]
extern fn SDL_SetClipboardText(text: *u8) -> bool;
#[abi("C"), link_name]
extern fn SDL_GetClipboardText() -> *u8;
#[abi("C"), link_name]
extern fn SDL_HasClipboardText() -> bool;

/// Replaces the system clipboard text.
pub fn set_text(text: *u8) -> bool { return SDL_SetClipboardText(text); }
/// Returns a newly allocated copy of the system clipboard text.
pub fn get_text() -> *u8 { return SDL_GetClipboardText(); }
/// Reports whether the system clipboard contains text.
pub fn has_text() -> bool { return SDL_HasClipboardText(); }
