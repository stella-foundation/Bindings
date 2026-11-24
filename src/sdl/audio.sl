mod bind.sdl.audio;
import "./sdl.sl";

#[abi("C"), link_name]
extern fn SDL_OpenAudioDevice(device: u32, spec: *bind.sdl.AudioSpec) -> u32;
#[abi("C"), link_name]
extern fn SDL_PauseAudioDevice(device: u32) -> bool;
#[abi("C"), link_name]
extern fn SDL_ResumeAudioDevice(device: u32) -> bool;
#[abi("C"), link_name]
extern fn SDL_CloseAudioDevice(device: u32) -> void;
#[abi("C"), link_name]
extern fn SDL_CreateAudioStream(source: *bind.sdl.AudioSpec, destination: *bind.sdl.AudioSpec) -> *void;
#[abi("C"), link_name]
extern fn SDL_DestroyAudioStream(stream: *void) -> void;
#[abi("C"), link_name]
extern fn SDL_PutAudioStreamData(stream: *void, buffer: *void, length: i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_GetAudioStreamData(stream: *void, buffer: *void, length: i32) -> i32;
#[abi("C"), link_name]
extern fn SDL_GetAudioStreamAvailable(stream: *void) -> i32;
#[abi("C"), link_name]
extern fn SDL_ClearAudioStream(stream: *void) -> bool;

/// Managed handle wrapping an SDL_AudioStream pointer.
pub struct AudioStream {
	pub handle: *void,
}

impl bind.sdl.Disposable for AudioStream {
	fn destroy(self: *Self) -> void {
		SDL_DestroyAudioStream(self.handle);
	}
}

/// Opens an SDL audio device with the requested specification.
pub fn open_device(device: u32, spec: *bind.sdl.AudioSpec) -> u32 {
	return SDL_OpenAudioDevice(device, spec);
}

/// Pauses an open audio device.
pub fn pause_device(device: u32) -> bool {
	return SDL_PauseAudioDevice(device);
}

/// Resumes a paused audio device.
pub fn resume_device(device: u32) -> bool {
	return SDL_ResumeAudioDevice(device);
}

/// Closes an open audio device.
pub fn close_device(device: u32) -> void {
	SDL_CloseAudioDevice(device);
}

/// Creates an audio stream converting from one specification to another.
pub fn create_stream(source: *bind.sdl.AudioSpec, destination: *bind.sdl.AudioSpec) -> AudioStream {
	let mut s: AudioStream;
	s.handle = SDL_CreateAudioStream(source, destination);
	return s;
}

/// Wraps a raw audio stream pointer in an AudioStream handle.
pub fn wrap_stream(raw: *void) -> AudioStream {
	let mut s: AudioStream;
	s.handle = raw;
	return s;
}

/// Queues audio samples in an audio stream.
pub fn put(stream: *AudioStream, buffer: *void, length: i32) -> bool {
	return SDL_PutAudioStreamData(stream.handle, buffer, length);
}

/// Retrieves converted audio samples from an audio stream.
pub fn get(stream: *AudioStream, buffer: *void, length: i32) -> i32 {
	return SDL_GetAudioStreamData(stream.handle, buffer, length);
}

/// Returns the number of bytes currently available in an audio stream.
pub fn available(stream: *AudioStream) -> i32 {
	return SDL_GetAudioStreamAvailable(stream.handle);
}

/// Clears queued data from an audio stream.
pub fn clear(stream: *AudioStream) -> bool {
	return SDL_ClearAudioStream(stream.handle);
}
