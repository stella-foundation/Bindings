mod bind.libc.io;
import "./types.sl";

struct FILE;

#[abi("C"), link_name]
pub extern fn putchar(c: c_int) -> c_int;

#[abi("C"), link_name]
pub extern fn puts(s: *c_char) -> c_int;
#[abi("C"), link_name]
pub extern fn fputs(#[!alias] s: *c_char, #[!alias] stream: *FILE) -> c_int;

#[abi("C"), link_name]
pub extern fn printf(#[!alias] format: *c_char, ...) -> c_int;
#[abi("C"), link_name]
pub extern fn fprintf(#[!alias] stream: *FILE, #[!alias] format: *c_char, ...) -> c_int;
