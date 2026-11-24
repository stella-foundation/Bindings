mod bind.llvm.analysis.verify;
import "./llvm.sl";
import "./core.sl";

#[abi("C"), link_name]
extern fn LLVMVerifyModule(module: *void, action: bind.llvm.VerifierFailureAction, error_message: **u8) -> i32;
#[abi("C"), link_name]
extern fn LLVMVerifyFunction(function: *void, action: bind.llvm.VerifierFailureAction) -> i32;

pub fn module(m: *bind.llvm.core.Module, action: bind.llvm.VerifierFailureAction, error_message: **u8) -> i32 {
	return LLVMVerifyModule(m.handle, action, error_message);
}

pub fn function(fn_val: bind.llvm.core.Value, action: bind.llvm.VerifierFailureAction) -> i32 {
	return LLVMVerifyFunction(fn_val.handle, action);
}
