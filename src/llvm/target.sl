mod bind.llvm.target;
import "./llvm.sl";
import "./core.sl";

/// Managed handle wrapping an LLVMTargetRef.
pub struct Target {
	pub handle: *void,
}

/// Managed handle wrapping an LLVMTargetMachineRef.
pub struct TargetMachine {
	pub handle: *void,
}

/// Managed handle wrapping an LLVMTargetDataRef.
pub struct TargetData {
	pub handle: *void,
}

impl bind.llvm.Disposable for TargetMachine {
	fn dispose(self: *Self) -> void {
		LLVMDisposeTargetMachine(self.handle);
	}
}

impl bind.llvm.Disposable for TargetData {
	fn dispose(self: *Self) -> void {
		LLVMDisposeTargetData(self.handle);
	}
}

pub fn wrap_target(raw: *void) -> Target {
	let mut t: Target;
	t.handle = raw;
	return t;
}

pub fn wrap_machine(raw: *void) -> TargetMachine {
	let mut tm: TargetMachine;
	tm.handle = raw;
	return tm;
}

pub fn wrap_data(raw: *void) -> TargetData {
	let mut td: TargetData;
	td.handle = raw;
	return td;
}

#[abi("C"), link_name]
extern fn LLVMGetTargetFromTriple(triple: *u8, target: **void, error_message: **u8) -> i32;
#[abi("C"), link_name]
extern fn LLVMGetTargetName(target: *void) -> *u8;
#[abi("C"), link_name]
extern fn LLVMGetTargetDescription(target: *void) -> *u8;
#[abi("C"), link_name]
extern fn LLVMTargetHasJIT(target: *void) -> i32;
#[abi("C"), link_name]
extern fn LLVMTargetHasTargetMachine(target: *void) -> i32;
#[abi("C"), link_name]
extern fn LLVMTargetHasAsmBackend(target: *void) -> i32;

#[abi("C"), link_name]
extern fn LLVMCreateTargetMachine(target: *void, triple: *u8, cpu: *u8, features: *u8, level: bind.llvm.CodeGenOptLevel, relocation: bind.llvm.RelocMode, code_model: bind.llvm.CodeModel) -> *void;
#[abi("C"), link_name]
extern fn LLVMDisposeTargetMachine(machine: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMCreateTargetDataLayout(machine: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMTargetMachineEmitToFile(machine: *void, module: *void, filename: *u8, file_type: bind.llvm.CodeGenFileType, error_message: **u8) -> i32;
#[abi("C"), link_name]
extern fn LLVMGetTargetMachineCPU(machine: *void) -> *u8;
#[abi("C"), link_name]
extern fn LLVMGetTargetMachineFeatureString(machine: *void) -> *u8;

#[abi("C"), link_name]
extern fn LLVMCreateTargetData(layout: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMDisposeTargetData(data: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMSetModuleDataLayout(module: *void, data: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMGetModuleDataLayout(module: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMPointerSize(data: *void) -> u32;
#[abi("C"), link_name]
extern fn LLVMABISizeOfType(data: *void, ty: *void) -> u64;
#[abi("C"), link_name]
extern fn LLVMABIAlignmentOfType(data: *void, ty: *void) -> u32;
#[abi("C"), link_name]
extern fn LLVMOffsetOfElement(data: *void, struct_ty: *void, element: u32) -> u64;

#[abi("C"), link_name]
extern fn LLVMCreatePassBuilderOptions() -> *void;
#[abi("C"), link_name]
extern fn LLVMDisposePassBuilderOptions(opts: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMRunPasses(m: *void, passes: *u8, tm: *void, opts: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetErrorMessage(err: *void) -> *mut u8;
#[abi("C"), link_name]
extern fn LLVMDisposeErrorMessage(msg: *mut u8) -> void;

#[abi("C"), link_name]
extern fn LLVMGetDefaultTargetTriple() -> *u8;
#[abi("C"), link_name]
extern fn LLVMGetHostCPUName() -> *u8;
#[abi("C"), link_name]
extern fn LLVMGetHostCPUFeatures() -> *u8;
#[abi("C"), link_name]
extern fn LLVMInitializeX86TargetInfo() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeX86Target() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeX86TargetMC() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeX86AsmPrinter() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeX86AsmParser() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeAArch64TargetInfo() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeAArch64Target() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeAArch64TargetMC() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeAArch64AsmPrinter() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeAArch64AsmParser() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeRISCVTargetInfo() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeRISCVTarget() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeRISCVTargetMC() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeRISCVAsmPrinter() -> void;
#[abi("C"), link_name]
extern fn LLVMInitializeRISCVAsmParser() -> void;

pub mod discover {
	pub fn from_triple(triple: *u8, target_out: *mut Target, error_message: **u8) -> i32 {
		let mut raw: *void = null;
		let res: i32 = LLVMGetTargetFromTriple(triple, &raw, error_message);
		if target_out != null {
			target_out.handle = raw;
		}
		return res;
	}
	pub fn name(t: *Target) -> *u8 { return LLVMGetTargetName(t.handle); }
	pub fn description(t: *Target) -> *u8 { return LLVMGetTargetDescription(t.handle); }
	pub fn has_jit(t: *Target) -> bool { return LLVMTargetHasJIT(t.handle) != 0; }
	pub fn has_machine(t: *Target) -> bool { return LLVMTargetHasTargetMachine(t.handle) != 0; }
	pub fn has_asm_backend(t: *Target) -> bool { return LLVMTargetHasAsmBackend(t.handle) != 0; }
}

pub mod machine {
	pub fn create(t: *Target, triple: *u8, cpu: *u8, features: *u8, level: bind.llvm.CodeGenOptLevel, relocation: bind.llvm.RelocMode, code_model: bind.llvm.CodeModel) -> TargetMachine {
		return wrap_machine(LLVMCreateTargetMachine(t.handle, triple, cpu, features, level, relocation, code_model));
	}
	pub fn data_layout(tm: *TargetMachine) -> TargetData {
		return wrap_data(LLVMCreateTargetDataLayout(tm.handle));
	}
	pub fn emit_to_file(tm: *TargetMachine, m: *bind.llvm.core.Module, filename: *u8, file_type: bind.llvm.CodeGenFileType, error_message: **u8) -> i32 {
		return LLVMTargetMachineEmitToFile(tm.handle, m.handle, filename, file_type, error_message);
	}
	pub fn cpu(tm: *TargetMachine) -> *u8 {
		return LLVMGetTargetMachineCPU(tm.handle);
	}
	pub fn feature_string(tm: *TargetMachine) -> *u8 {
		return LLVMGetTargetMachineFeatureString(tm.handle);
	}
}

pub mod data {
	pub fn create(layout: *u8) -> TargetData { return wrap_data(LLVMCreateTargetData(layout)); }
	pub fn from_module(m: *bind.llvm.core.Module) -> TargetData { return wrap_data(LLVMGetModuleDataLayout(m.handle)); }
	pub fn set_module(m: *bind.llvm.core.Module, td: *TargetData) -> void { LLVMSetModuleDataLayout(m.handle, td.handle); }
	pub fn pointer_size(td: *TargetData) -> u32 { return LLVMPointerSize(td.handle); }
	pub fn abi_size_of(td: *TargetData, ty: bind.llvm.core.Type) -> u64 { return LLVMABISizeOfType(td.handle, ty.handle); }
	pub fn abi_alignment_of(td: *TargetData, ty: bind.llvm.core.Type) -> u32 { return LLVMABIAlignmentOfType(td.handle, ty.handle); }
	pub fn offset_of_element(td: *TargetData, struct_ty: bind.llvm.core.Type, element: u32) -> u64 { return LLVMOffsetOfElement(td.handle, struct_ty.handle, element); }
}

pub mod passes {
	pub fn run(m: *bind.llvm.core.Module, passes_str: *u8, tm: *TargetMachine, error_message: *mut *mut u8) -> i32 {
		let pb_opts: *void = LLVMCreatePassBuilderOptions();
		let err: *void = LLVMRunPasses(m.handle, passes_str, tm.handle, pb_opts);
		LLVMDisposePassBuilderOptions(pb_opts);
		if err != null {
			if error_message != null {
				*error_message = LLVMGetErrorMessage(err);
			}
			return 1;
		}
		return 0;
	}
	pub fn dispose_error_message(msg: *mut u8) -> void {
		LLVMDisposeErrorMessage(msg);
	}
}

pub mod host {
	pub fn default_triple() -> *u8 { return LLVMGetDefaultTargetTriple(); }
	pub fn cpu_name() -> *u8 { return LLVMGetHostCPUName(); }
	pub fn cpu_features() -> *u8 { return LLVMGetHostCPUFeatures(); }
	pub fn init_all() -> void {
		LLVMInitializeX86TargetInfo();
		LLVMInitializeX86Target();
		LLVMInitializeX86TargetMC();
		LLVMInitializeX86AsmPrinter();
		LLVMInitializeX86AsmParser();
		LLVMInitializeAArch64TargetInfo();
		LLVMInitializeAArch64Target();
		LLVMInitializeAArch64TargetMC();
		LLVMInitializeAArch64AsmPrinter();
		LLVMInitializeAArch64AsmParser();
		LLVMInitializeRISCVTargetInfo();
		LLVMInitializeRISCVTarget();
		LLVMInitializeRISCVTargetMC();
		LLVMInitializeRISCVAsmPrinter();
		LLVMInitializeRISCVAsmParser();
	}
}
