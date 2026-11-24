mod bind.sdl;
import "std/err.sl";

/// Flags selecting SDL subsystems during initialization.
pub enum InitFlags: u32 {
	Timer = 0x00000001,
	Audio = 0x00000010,
	Video = 0x00000020,
	Joystick = 0x00000200,
	Haptic = 0x00001000,
	Gamepad = 0x00002000,
	Events = 0x00004000,
	Sensor = 0x00008000,
	Camera = 0x00010000,
	Everything = 0x0001f231,
}
/// Flags describing window creation and current window state.
pub enum WindowFlags: u64 {
	None = 0,
	Fullscreen = 0x0000000000000001,
	OpenGL = 0x0000000000000002,
	Hidden = 0x0000000000000008,
	Borderless = 0x0000000000000010,
	Resizable = 0x0000000000000020,
	Minimized = 0x0000000000000040,
	Maximized = 0x0000000000000080,
	HighPixelDensity = 0x0000000000002000,
	MouseCapture = 0x0000000000004000,
	RelativeMouseMode = 0x0000000000008000,
	AlwaysOnTop = 0x0000000000010000,
	Utility = 0x0000000000020000,
	Tooltip = 0x0000000000040000,
	PopupMenu = 0x0000000000080000,
	KeyboardGrabbed = 0x0000000000100000,
	Vulkan = 0x0000000010000000,
	Metal = 0x0000000020000000,
	Transparent = 0x0000000040000000,
	NotFocusable = 0x0000000080000000,
}
/// Pixel formats supported by SDL surfaces and textures.
pub enum PixelFormat: i32 {
	Unknown = 0,
	Index8 = 0x13000801,
	RGB24 = 0x17101803,
	BGR24 = 0x17401803,
	RGBA8888 = 0x16462004,
	BGRA8888 = 0x16862004,
	ARGB8888 = 0x16362004,
	ABGR8888 = 0x16762004,
	RGB565 = 0x15151002,
}
/// Blend modes used when compositing rendered pixels.
pub enum BlendMode: u32 {
	None = 0x00000000,
	Blend = 0x00000001,
	Add = 0x00000002,
	Mod = 0x00000004,
	Mul = 0x00000008,
}
/// Access patterns supported by SDL textures.
pub enum TextureAccess: i32 {
	Static = 0,
	Streaming = 1,
	Target = 2,
}
/// Texture scaling algorithms.
pub enum ScaleMode: i32 {
	Nearest = 0,
	Linear = 1,
}
/// Horizontal and vertical texture flip modes.
pub enum FlipMode: i32 {
	None = 0,
	Horizontal = 1,
	Vertical = 2,
	HorizontalAndVertical = 3,
}
/// Event type identifiers produced by SDL's event queue.
pub enum EventType: u32 {
	First = 0x00000000,
	Quit = 0x00000100,
	WindowShown = 0x00000202,
	WindowHidden = 0x00000203,
	WindowExposed = 0x00000204,
	WindowMoved = 0x00000205,
	WindowResized = 0x00000206,
	WindowPixelSizeChanged = 0x00000207,
	WindowMinimized = 0x00000208,
	WindowMaximized = 0x00000209,
	WindowRestored = 0x0000020a,
	WindowMouseEnter = 0x0000020c,
	WindowMouseLeave = 0x0000020d,
	WindowFocusGained = 0x0000020e,
	WindowFocusLost = 0x0000020f,
	WindowCloseRequested = 0x00000210,
	WindowDisplayChanged = 0x00000214,
	KeyDown = 0x00000300,
	KeyUp = 0x00000301,
	TextEditing = 0x00000302,
	TextInput = 0x00000303,
	MouseMotion = 0x00000400,
	MouseButtonDown = 0x00000401,
	MouseButtonUp = 0x00000402,
	MouseWheel = 0x00000403,
	JoystickAxisMotion = 0x00000600,
	JoystickButtonDown = 0x00000603,
	JoystickButtonUp = 0x00000604,
	JoystickAdded = 0x00000605,
	JoystickRemoved = 0x00000606,
	GamepadAxisMotion = 0x00000650,
	GamepadButtonDown = 0x00000651,
	GamepadButtonUp = 0x00000652,
	GamepadAdded = 0x00000653,
	GamepadRemoved = 0x00000654,
	FingerDown = 0x00000700,
	FingerUp = 0x00000701,
	FingerMotion = 0x00000702,
	ClipboardUpdate = 0x00000900,
}
/// Individual mouse buttons.
pub enum MouseButton: u8 {
	Left = 1,
	Middle = 2,
	Right = 3,
	X1 = 4,
	X2 = 5,
}
/// Bitmask values for currently pressed mouse buttons.
pub enum MouseButtonMask: u32 {
	Left = 1,
	Middle = 2,
	Right = 4,
	X1 = 8,
	X2 = 16,
}
/// Physical keyboard scancodes recognized by SDL.
pub enum Scancode: i32 {
	Unknown = 0,
	A = 4, B = 5, C = 6, D = 7, E = 8, F = 9, G = 10, H = 11,
	I = 12, J = 13, K = 14, L = 15, M = 16, N = 17, O = 18, P = 19,
	Q = 20, R = 21, S = 22, T = 23, U = 24, V = 25, W = 26, X = 27,
	Y = 28, Z = 29,
	Num1 = 30, Num2 = 31, Num3 = 32, Num4 = 33, Num5 = 34,
	Num6 = 35, Num7 = 36, Num8 = 37, Num9 = 38, Num0 = 39,
	ReturnKey = 40, Escape = 41, Backspace = 42, Tab = 43, Space = 44,
	Minus = 45, Equals = 46, LeftBracket = 47, RightBracket = 48,
	Backslash = 49, NonUSHash = 50, Semicolon = 51, Apostrophe = 52,
	Grave = 53, Comma = 54, Period = 55, Slash = 56, CapsLock = 57,
	F1 = 58, F2 = 59, F3 = 60, F4 = 61, F5 = 62, F6 = 63,
	F7 = 64, F8 = 65, F9 = 66, F10 = 67, F11 = 68, F12 = 69,
	PrintScreen = 70, ScrollLock = 71, Pause = 72, Insert = 73,
	Home = 74, PageUp = 75, Delete = 76, End = 77, PageDown = 78,
	Right = 79, Left = 80, Down = 81, Up = 82, NumLockClear = 83,
	KeypadDivide = 84, KeypadMultiply = 85, KeypadMinus = 86,
	KeypadPlus = 87, KeypadEnter = 88, Keypad1 = 89, Keypad2 = 90,
	Keypad3 = 91, Keypad4 = 92, Keypad5 = 93, Keypad6 = 94,
	Keypad7 = 95, Keypad8 = 96, Keypad9 = 97, Keypad0 = 98,
	KeypadPeriod = 99, NonUSBackslash = 100, Application = 101,
	Power = 102, KeypadEquals = 103, F13 = 104, F14 = 105, F15 = 106,
	F16 = 107, F17 = 108, F18 = 109, F19 = 110, F20 = 111,
	F21 = 112, F22 = 113, F23 = 114, F24 = 115, Execute = 116,
	Help = 117, Menu = 118, Select = 119, Stop = 120, Again = 121,
	Undo = 122, Cut = 123, Copy = 124, Paste = 125, Find = 126,
	Mute = 127, VolumeUp = 128, VolumeDown = 129, KeypadComma = 133,
	KeypadEqualsAS400 = 134,
	International1 = 135, International2 = 136, International3 = 137,
	International4 = 138, International5 = 139, International6 = 140,
	International7 = 141, International8 = 142, International9 = 143,
	Lang1 = 144, Lang2 = 145, Lang3 = 146, Lang4 = 147, Lang5 = 148,
	Lang6 = 149, Lang7 = 150, Lang8 = 151, Lang9 = 152,
	AltErase = 153, SysReq = 154, Cancel = 155, Clear = 156,
	Prior = 157, Return2 = 158, Separator = 159, Out = 160, Oper = 161,
	ClearAgain = 162, CrSel = 163, ExSel = 164,
	Keypad00 = 176, Keypad000 = 177, ThousandsSeparator = 178,
	DecimalSeparator = 179, CurrencyUnit = 180, CurrencySubunit = 181,
	KeypadLeftParen = 182, KeypadRightParen = 183, KeypadLeftBrace = 184,
	KeypadRightBrace = 185, KeypadTab = 186, KeypadBackspace = 187,
	KeypadA = 188, KeypadB = 189, KeypadC = 190, KeypadD = 191,
	KeypadE = 192, KeypadF = 193, KeypadXor = 194, KeypadPower = 195,
	KeypadPercent = 196, KeypadLess = 197, KeypadGreater = 198,
	KeypadAmpersand = 199, KeypadDoubleAmpersand = 200,
	KeypadVerticalBar = 201, KeypadDoubleVerticalBar = 202,
	KeypadColon = 203, KeypadHash = 204, KeypadSpace = 205,
	KeypadAt = 206, KeypadExclaim = 207, KeypadMemStore = 208,
	KeypadMemRecall = 209, KeypadMemClear = 210, KeypadMemAdd = 211,
	KeypadMemSubtract = 212, KeypadMemMultiply = 213,
	KeypadMemDivide = 214, KeypadPlusMinus = 215, KeypadClear = 216,
	KeypadClearEntry = 217, KeypadBinary = 218, KeypadOctal = 219,
	KeypadDecimal = 220, KeypadHexadecimal = 221,
	LeftCtrl = 224, LeftShift = 225, LeftAlt = 226, LeftGUI = 227,
	RightCtrl = 228, RightShift = 229, RightAlt = 230, RightGUI = 231,
	Mode = 257, Sleep = 258, Wake = 259, ChannelIncrement = 260,
	ChannelDecrement = 261, MediaPlay = 262, MediaPause = 263,
	MediaRecord = 264, MediaFastForward = 265, MediaRewind = 266,
	MediaNextTrack = 267, MediaPreviousTrack = 268, MediaStop = 269,
	MediaEject = 270, MediaPlayPause = 271, MediaSelect = 272,
	ACNew = 273, ACOpen = 274, ACClose = 275, ACExit = 276,
	ACSave = 277, ACPrint = 278, ACProperties = 279, ACSearch = 280,
	ACHome = 281, ACBack = 282, ACForward = 283, ACStop = 284,
	ACRefresh = 285, ACBookmarks = 286, SoftLeft = 287, SoftRight = 288,
	Call = 289, EndCall = 290, Reserved = 400, Count = 512,
}
/// The integer type used for SDL keycodes.
pub const Keycode: type = u32;
/// Modifier-key bit flags returned with keyboard input.
pub enum Keymod: u16 {
	None = 0x0000,
	Shift = 0x0003,
	Ctrl = 0x00c0,
	Alt = 0x0300,
	Gui = 0x0c00,
	Num = 0x1000,
	Caps = 0x2000,
}
/// Sample formats supported by the audio API.
pub enum AudioFormat: i32 {
	Unknown = 0x0000,
	U8 = 0x0008,
	S16 = 0x8010,
	S32 = 0x8020,
	F32 = 0x8120,
}
/// The integer type used for SDL audio device identifiers.
pub const AudioDeviceId: type = u32;
/// Special identifiers selecting the default playback or recording device.
pub enum AudioDeviceDefault: u32 {
	Playback = 0xffffffff,
	Recording = 0xfffffffe,
}
/// The integer type used for SDL property sets.
pub const PropertiesId: type = u32;

/// A point with signed integer coordinates.
#[repr("C")]
pub struct Point {
	pub x: i32,
	pub y: i32,
}

/// A point with single-precision floating-point coordinates.
#[repr("C")]
pub struct FPoint {
	pub x: f32,
	pub y: f32,
}

/// An integer-coordinate rectangle.
#[repr("C")]
pub struct Rect {
	pub x: i32,
	pub y: i32,
	pub w: i32,
	pub h: i32,
}

/// A floating-point rectangle.
#[repr("C")]
pub struct FRect {
	pub x: f32,
	pub y: f32,
	pub w: f32,
	pub h: f32,
}

/// An 8-bit-per-channel RGBA color.
#[repr("C")]
pub struct Color {
	pub r: u8,
	pub g: u8,
	pub b: u8,
	pub a: u8,
}

/// A floating-point RGBA color.
#[repr("C")]
pub struct FColor {
	pub r: f32,
	pub g: f32,
	pub b: f32,
	pub a: f32,
}

/// A vertex containing position, color, and texture coordinates.
#[repr("C")]
pub struct Vertex {
	pub position: FPoint,
	pub color: FColor,
	pub tex_coord: FPoint,
}

/// Audio format and channel configuration.
#[repr("C")]
pub struct AudioSpec {
	pub format: AudioFormat,
	pub channels: i32,
	pub freq: i32,
}

/// Fields shared by all SDL events.
#[repr("C")]
pub struct CommonEvent {
	pub event_type: EventType,
	pub reserved: u32,
	pub timestamp: u64,
}

/// Event data associated with a window.
#[repr("C")]
pub struct WindowEvent {
	pub event_type: EventType,
	pub reserved: u32,
	pub timestamp: u64,
	pub window_id: u32,
	pub data1: i32,
	pub data2: i32,
}

/// Event data for keyboard key presses and releases.
#[repr("C")]
pub struct KeyboardEvent {
	pub event_type: EventType,
	pub reserved: u32,
	pub timestamp: u64,
	pub window_id: u32,
	pub which: u32,
	pub scancode: Scancode,
	pub key: Keycode,
	pub mod_state: Keymod,
	pub raw: u16,
	pub is_down: bool,
	pub is_repeat: bool,
}

/// Event data for mouse movement.
#[repr("C")]
pub struct MouseMotionEvent {
	pub event_type: EventType,
	pub reserved: u32,
	pub timestamp: u64,
	pub window_id: u32,
	pub which: u32,
	pub state: MouseButtonMask,
	pub x: f32,
	pub y: f32,
	pub xrel: f32,
	pub yrel: f32,
}

/// Event data for mouse button presses and releases.
#[repr("C")]
pub struct MouseButtonEvent {
	pub event_type: EventType,
	pub reserved: u32,
	pub timestamp: u64,
	pub window_id: u32,
	pub which: u32,
	pub button: MouseButton,
	pub down: bool,
	pub clicks: u8,
	pub padding: u8,
	pub x: f32,
	pub y: f32,
}

/// Tagged union containing the common, window, keyboard, and mouse event views.
#[repr("C")]
pub union Event {
	event_type: EventType,
	common: CommonEvent,
	window: WindowEvent,
	key: KeyboardEvent,
	motion: MouseMotionEvent,
	button: MouseButtonEvent,
	padding: [16]u64,
}

#[abi("C"), link_name]
extern fn SDL_Init(flags: InitFlags) -> bool;
#[abi("C"), link_name]
extern fn SDL_InitSubSystem(flags: InitFlags) -> bool;
#[abi("C"), link_name]
extern fn SDL_QuitSubSystem(flags: InitFlags) -> void;
#[abi("C"), link_name]
extern fn SDL_WasInit(flags: InitFlags) -> InitFlags;
#[abi("C"), link_name]
extern fn SDL_Quit() -> void;
#[abi("C"), link_name]
extern fn SDL_GetVersion() -> u32;
#[abi("C"), link_name]
extern fn SDL_GetError() -> *u8;
#[abi("C"), link_name]
extern fn SDL_SetAppMetadata(appname: *u8, appversion: *u8, appidentifier: *u8) -> bool;
#[abi("C"), link_name]
extern fn SDL_IsMainThread() -> bool;

#[abi("C"), link_name]
extern fn SDL_PollEvent(event: *mut Event) -> bool;
#[abi("C"), link_name]
extern fn SDL_WaitEvent(event: *mut Event) -> bool;
#[abi("C"), link_name]
extern fn SDL_WaitEventTimeout(event: *mut Event, timeout_milliseconds: i32) -> bool;
#[abi("C"), link_name]
extern fn SDL_PushEvent(event: *Event) -> bool;
#[abi("C"), link_name]
extern fn SDL_PumpEvents() -> void;
#[abi("C"), link_name]
extern fn SDL_HasEvent(event_type: EventType) -> bool;
#[abi("C"), link_name]
extern fn SDL_FlushEvent(event_type: EventType) -> void;
#[abi("C"), link_name]
extern fn SDL_SetEventEnabled(event_type: EventType, enabled: bool) -> void;
#[abi("C"), link_name]
extern fn SDL_EventEnabled(event_type: EventType) -> bool;

#[abi("C"), link_name]
extern fn SDL_GetTicks() -> u64;
#[abi("C"), link_name]
extern fn SDL_GetTicksNS() -> u64;
#[abi("C"), link_name]
extern fn SDL_GetPerformanceCounter() -> u64;
#[abi("C"), link_name]
extern fn SDL_GetPerformanceFrequency() -> u64;
#[abi("C"), link_name]
extern fn SDL_Delay(milliseconds: u32) -> void;
#[abi("C"), link_name]
extern fn SDL_DelayNS(nanoseconds: u64) -> void;

/// Initializes the requested SDL subsystems.
pub fn init(flags: InitFlags) -> bool { return SDL_Init(flags); }
mod subsystem {
	/// Initializes the requested SDL subsystems without affecting others.
	pub fn init(flags: InitFlags) -> bool { return SDL_InitSubSystem(flags); }
	/// Shuts down the requested SDL subsystems.
	pub fn quit(flags: InitFlags) -> void { SDL_QuitSubSystem(flags); }
}
/// Returns the currently initialized SDL subsystem flags.
pub fn was_init(flags: InitFlags) -> InitFlags { return SDL_WasInit(flags); }
/// Shuts down all initialized SDL subsystems.
pub fn quit() -> void { SDL_Quit(); }
/// Returns the compiled SDL version as an integer.
pub fn version() -> u32 { return SDL_GetVersion(); }
/// Returns SDL's current error message as a NUL-terminated string.
pub fn get_error() -> *u8 { return SDL_GetError(); }
/// Sets application metadata used by SDL and platform integrations.
pub fn set_app_metadata(appname: *u8, appversion: *u8, appidentifier: *u8) -> bool {
	return SDL_SetAppMetadata(appname, appversion, appidentifier);
}
/// Reports whether the caller is running on SDL's main thread.
pub fn is_main_thread() -> bool { return SDL_IsMainThread(); }

/// Polls the next event without blocking.
pub fn poll_event() -> std.err.Option<Event> {
	let mut ev: Event;
	if SDL_PollEvent(&ev) {
		return .Some(ev);
	}
	return .None;
}
/// Waits for the next event.
pub fn wait_event() -> std.err.Option<Event> {
	let mut ev: Event;
	if SDL_WaitEvent(&ev) {
		return .Some(ev);
	}
	return .None;
}
/// Waits for an event for up to `timeout_milliseconds`.
pub fn wait_event_timeout(timeout_milliseconds: i32) -> std.err.Option<Event> {
	let mut ev: Event;
	if SDL_WaitEventTimeout(&ev, timeout_milliseconds) {
		return .Some(ev);
	}
	return .None;
}
/// Pushes an event onto SDL's event queue.
pub fn push_event(event: *Event) -> bool { return SDL_PushEvent(event); }
/// Pumps platform events into SDL's event queue.
pub fn pump_events() -> void { SDL_PumpEvents(); }
/// Reports whether the event queue contains an event of `event_type`.
pub fn has_event(event_type: EventType) -> bool { return SDL_HasEvent(event_type); }
/// Removes queued events of `event_type`.
pub fn flush_event(event_type: EventType) -> void { SDL_FlushEvent(event_type); }
/// Enables or disables delivery of an event type.
pub fn set_event_enabled(event_type: EventType, enabled: bool) -> void { SDL_SetEventEnabled(event_type, enabled); }
/// Reports whether delivery of an event type is enabled.
pub fn event_enabled(event_type: EventType) -> bool { return SDL_EventEnabled(event_type); }

/// Returns elapsed SDL ticks in milliseconds.
pub fn ticks() -> u64 { return SDL_GetTicks(); }
/// Returns elapsed SDL ticks in nanoseconds.
pub fn ticks_nanoseconds() -> u64 { return SDL_GetTicksNS(); }
/// Returns the high-resolution performance counter.
pub fn performance_counter() -> u64 { return SDL_GetPerformanceCounter(); }
/// Returns the performance counter frequency.
pub fn performance_frequency() -> u64 { return SDL_GetPerformanceFrequency(); }
/// Delays execution for the requested number of milliseconds.
pub fn delay(milliseconds: u32) -> void { SDL_Delay(milliseconds); }
/// Delays execution for the requested number of nanoseconds.
pub fn delay_nanoseconds(nanoseconds: u64) -> void { SDL_DelayNS(nanoseconds); }

/// Interface for SDL entities with manual resource cleanup.
pub trait Disposable {
	fn destroy(self: *Self) -> void;
}

pub fn dispose<D: Disposable>(resource: *D) -> void {
	resource.destroy();
}
