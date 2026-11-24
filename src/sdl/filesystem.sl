mod bind.sdl.filesystem;

#[abi("C"), link_name]
extern fn SDL_GetBasePath() -> *u8;
#[abi("C"), link_name]
extern fn SDL_GetPrefPath(organization: *u8, application: *u8) -> *u8;

/// Returns the directory containing the application executable.
pub fn base_path() -> *u8 { return SDL_GetBasePath(); }
/// Returns the per-user preference directory for an application.
pub fn pref_path(organization: *u8, application: *u8) -> *u8 { return SDL_GetPrefPath(organization, application); }
