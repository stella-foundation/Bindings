pub const c_char: type = i8;
pub const c_uchar: type = u8;
pub const c_short: type = i16;
pub const c_ushort: type = u16;
pub const c_int: type = i32;
pub const c_uint: type = u32;
pub const c_longlong: type = i64;
pub const c_ulonglong: type = u64;
pub const size_t: type = usize;
pub const ssize_t: type = isize;

if #os_windows {
	pub const c_long: type = i32;
	pub const c_ulong: type = u32;
} else {
	pub const c_long: type = i64;
	pub const c_ulong: type = u64;
}
