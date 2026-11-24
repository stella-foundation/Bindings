mod bind.llvm.bitcode;
import "./llvm.sl";
import "./core.sl";

/// Managed handle wrapping an LLVMMemoryBufferRef.
pub struct MemoryBuffer {
	pub handle: *void,
}

impl bind.llvm.Disposable for MemoryBuffer {
	fn dispose(self: *Self) -> void {
		LLVMDisposeMemoryBuffer(self.handle);
	}
}

pub fn wrap_buffer(raw: *void) -> MemoryBuffer {
	let mut mb: MemoryBuffer;
	mb.handle = raw;
	return mb;
}

pub fn start(mb: *MemoryBuffer) -> *u8 {
	return LLVMGetBufferStart(mb.handle);
}

pub fn size(mb: *MemoryBuffer) -> usize {
	return LLVMGetBufferSize(mb.handle);
}

#[abi("C"), link_name]
extern fn LLVMWriteBitcodeToFile(module: *void, path: *u8) -> i32;
#[abi("C"), link_name]
extern fn LLVMWriteBitcodeToMemoryBuffer(module: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMParseBitcodeInContext2(context: *void, buffer: *void, module: **void) -> i32;
#[abi("C"), link_name]
extern fn LLVMCreateMemoryBufferWithContentsOfFile(path: *u8, buffer: **void, error_message: **u8) -> i32;
#[abi("C"), link_name]
extern fn LLVMGetBufferStart(buffer: *void) -> *u8;
#[abi("C"), link_name]
extern fn LLVMGetBufferSize(buffer: *void) -> usize;
#[abi("C"), link_name]
extern fn LLVMDisposeMemoryBuffer(buffer: *void) -> void;

pub mod write {
	pub fn to_file(m: *bind.llvm.core.Module, path: *u8) -> i32 {
		return LLVMWriteBitcodeToFile(m.handle, path);
	}
	pub fn to_memory(m: *bind.llvm.core.Module) -> MemoryBuffer {
		return wrap_buffer(LLVMWriteBitcodeToMemoryBuffer(m.handle));
	}
}

pub mod read {
	pub fn in_context(ctx: *bind.llvm.core.Context, buffer: *MemoryBuffer, module_out: *mut bind.llvm.core.Module) -> i32 {
		let mut raw_mod: *void = null;
		let res: i32 = LLVMParseBitcodeInContext2(ctx.handle, buffer.handle, &raw_mod);
		if module_out != null {
			module_out.handle = raw_mod;
		}
		return res;
	}
}

pub mod memory {
	pub fn from_file(path: *u8, buffer_out: *mut MemoryBuffer, error_message: **u8) -> i32 {
		let mut raw_buf: *void = null;
		let res: i32 = LLVMCreateMemoryBufferWithContentsOfFile(path, &raw_buf, error_message);
		if buffer_out != null {
			buffer_out.handle = raw_buf;
		}
		return res;
	}
}
