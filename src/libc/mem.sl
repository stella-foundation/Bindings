mod bind.libc.mem;
import "./types.sl";

#[abi("C"), link_name]
pub extern fn malloc(size: size_t) -> *mut void;
#[abi("C"), link_name]
pub extern fn free(p: *mut void) -> void;
#[abi("C"), link_name]
pub extern fn calloc(n: size_t, size: size_t) -> *mut void;
#[abi("C"), link_name]
pub extern fn realloc(p: *mut void, size: size_t) -> *mut void;
#[abi("C"), link_name]
pub extern fn reallocarray(p: *mut void, n: size_t, size: size_t) -> *mut void;
