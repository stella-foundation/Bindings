mod bind.libc.str;
import "./types.sl";

#[abi("C"), link_name]
pub extern fn strlen(s: *c_char) -> size_t;
#[abi("C"), link_name]
pub extern fn strcmp(s1: *c_char, s2: *c_char) -> c_int;
#[abi("C"), link_name]
pub extern fn strcpy(#[!alias] dst: *mut c_char, #[!alias] src: *mut c_char) -> *mut c_char;
