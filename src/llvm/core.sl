mod bind.llvm.core;
import "./llvm.sl";

#[abi("C"), link_name]
extern fn LLVMContextCreate() -> *void;
#[abi("C"), link_name]
extern fn LLVMContextDispose(context: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMModuleCreateWithNameInContext(name: *u8, context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMDisposeModule(module: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMSetSourceFileName(module: *void, name: *u8, length: usize) -> void;
#[abi("C"), link_name]
extern fn LLVMSetDataLayout(module: *void, layout: *u8) -> void;
#[abi("C"), link_name]
extern fn LLVMSetTarget(module: *void, triple: *u8) -> void;
#[abi("C"), link_name]
extern fn LLVMPrintModuleToFile(module: *void, filename: *u8, error_message: **u8) -> i32;
#[abi("C"), link_name]
extern fn LLVMPrintModuleToString(module: *void) -> *u8;
#[abi("C"), link_name]
extern fn LLVMDisposeMessage(message: *u8) -> void;

#[abi("C"), link_name]
extern fn LLVMVoidTypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMInt1TypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMInt8TypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMInt16TypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMInt32TypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMInt64TypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMIntTypeInContext(context: *void, bits: u32) -> *void;
#[abi("C"), link_name]
extern fn LLVMFloatTypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMDoubleTypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMFunctionType(return_type: *void, parameters: **void, parameter_count: u32, variadic: i32) -> *void;
#[abi("C"), link_name]
extern fn LLVMStructCreateNamed(context: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMStructSetBody(structure: *void, elements: **void, element_count: u32, packed: i32) -> void;
#[abi("C"), link_name]
extern fn LLVMStructTypeInContext(context: *void, elements: **void, element_count: u32, packed: i32) -> *void;
#[abi("C"), link_name]
extern fn LLVMArrayType2(element: *void, element_count: u64) -> *void;
#[abi("C"), link_name]
extern fn LLVMPointerTypeInContext(context: *void, address_space: u32) -> *void;
#[abi("C"), link_name]
extern fn LLVMVectorType(element: *void, element_count: u32) -> *void;
#[abi("C"), link_name]
extern fn LLVMScalableVectorType(element: *void, element_count: u32) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetTypeKind(ty: *void) -> bind.llvm.TypeKind;
#[abi("C"), link_name]
extern fn LLVMGetIntTypeWidth(ty: *void) -> u32;
#[abi("C"), link_name]
extern fn LLVMGetPointerAddressSpace(ty: *void) -> u32;

#[abi("C"), link_name]
extern fn LLVMAddFunction(module: *void, name: *u8, function_type: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMAddGlobal(module: *void, ty: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMSetInitializer(global_var: *void, constant_val: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMSetGlobalConstant(global_var: *void, is_constant: i32) -> void;
#[abi("C"), link_name]
extern fn LLVMSetSection(global_obj: *void, section: *u8) -> void;
#[abi("C"), link_name]
extern fn LLVMSetAlignment(value: *void, bytes: u32) -> void;
#[abi("C"), link_name]
extern fn LLVMGetBasicBlockTerminator(block: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetFirstInstruction(block: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMHalfTypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMFP128TypeInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMConstStringInContext2(context: *void, str: *u8, length: usize, dont_null_terminate: i32) -> *void;
#[abi("C"), link_name]
extern fn LLVMConstStructInContext(context: *void, vals: **void, count: u32, packed: i32) -> *void;
#[abi("C"), link_name]
extern fn LLVMConstArray2(elem_ty: *void, vals: **void, length: u64) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetUndef(ty: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetNamedFunction(module: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetNamedFunctionWithLength(module: *void, name: *u8, length: usize) -> *void;
#[abi("C"), link_name]
extern fn LLVMTypeOf(value: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetValueName2(value: *void, length: *usize) -> *u8;
#[abi("C"), link_name]
extern fn LLVMSetValueName2(value: *void, name: *u8, length: usize) -> void;
#[abi("C"), link_name]
extern fn LLVMGetLinkage(value: *void) -> bind.llvm.Linkage;
#[abi("C"), link_name]
extern fn LLVMSetLinkage(value: *void, linkage: bind.llvm.Linkage) -> void;
#[abi("C"), link_name]
extern fn LLVMIsDeclaration(value: *void) -> i32;
#[abi("C"), link_name]
extern fn LLVMCountParams(function: *void) -> u32;
#[abi("C"), link_name]
extern fn LLVMGetParam(function: *void, index: u32) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetFirstBasicBlock(function: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetNextBasicBlock(block: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetEntryBasicBlock(function: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMAppendBasicBlockInContext(context: *void, function: *void, name: *u8) -> *void;

#[abi("C"), link_name]
extern fn LLVMConstNull(ty: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMConstInt(ty: *void, value: u64, sign_extend: i32) -> *void;
#[abi("C"), link_name]
extern fn LLVMConstReal(ty: *void, value: f64) -> *void;
#[abi("C"), link_name]
extern fn LLVMConstIntGetZExtValue(value: *void) -> u64;
#[abi("C"), link_name]
extern fn LLVMConstIntGetSExtValue(value: *void) -> i64;
#[abi("C"), link_name]
extern fn LLVMIsAConstantInt(value: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetTypeByName2(context: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetFirstFunction(module: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMGetNextFunction(fn_val: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMAddTargetDependentFunctionAttr(fn_val: *void, attr: *u8, val: *u8) -> void;
#[abi("C"), link_name]
extern fn LLVMSetFunctionCallConv(fn_val: *void, cc: u32) -> void;
#[abi("C"), link_name]
extern fn LLVMSetInstructionCallConv(instr: *void, cc: u32) -> void;
#[abi("C"), link_name]
extern fn LLVMGetEnumAttributeKindForName(name: *u8, slen: usize) -> u32;
#[abi("C"), link_name]
extern fn LLVMCreateEnumAttribute(context: *void, kind_id: u32, val: u64) -> *void;
#[abi("C"), link_name]
extern fn LLVMCreateTypeAttribute(context: *void, kind_id: u32, type_ref: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMAddAttributeAtIndex(fn_val: *void, idx: u32, attr: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMAddCallSiteAttribute(call_val: *void, idx: u32, attr: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMGetInlineAsm(
	ty: *void,
	asm_str: *u8,
	asm_len: usize,
	constraints: *u8,
	constraints_len: usize,
	has_side_effects: i32,
	is_align_stack: i32,
	dialect: i32,
	can_throw: i32
) -> *void;

/// Managed handle wrapping an LLVMContextRef.
pub struct Context {
	pub handle: *void,
}

/// Managed handle wrapping an LLVMModuleRef.
pub struct Module {
	pub handle: *void,
}

/// Managed handle wrapping an LLVMTypeRef.
pub struct Type {
	pub handle: *void,
}

/// Managed handle wrapping an LLVMValueRef.
pub struct Value {
	pub handle: *void,
}

impl bind.llvm.Disposable for Context {
	fn dispose(self: *Self) -> void {
		LLVMContextDispose(self.handle);
	}
}

impl bind.llvm.Disposable for Module {
	fn dispose(self: *Self) -> void {
		LLVMDisposeModule(self.handle);
	}
}

pub fn wrap_context(raw: *void) -> Context {
	let mut c: Context;
	c.handle = raw;
	return c;
}

pub fn wrap_module(raw: *void) -> Module {
	let mut m: Module;
	m.handle = raw;
	return m;
}

pub fn wrap_type(raw: *void) -> Type {
	let mut t: Type;
	t.handle = raw;
	return t;
}

pub fn wrap_value(raw: *void) -> Value {
	let mut v: Value;
	v.handle = raw;
	return v;
}

pub mod context {
	pub fn create() -> Context {
		return wrap_context(LLVMContextCreate());
	}
}

pub mod module {
	pub fn create(name: *u8, ctx: *Context) -> Module {
		return wrap_module(LLVMModuleCreateWithNameInContext(name, ctx.handle));
	}
	pub fn dispose_message(message: *u8) -> void {
		LLVMDisposeMessage(message);
	}
}

// Module methods
pub fn set_source_file_name(m: *Module, name: *u8, length: usize) -> void {
	LLVMSetSourceFileName(m.handle, name, length);
}
pub fn set_data_layout(m: *Module, layout: *u8) -> void {
	LLVMSetDataLayout(m.handle, layout);
}
pub fn set_target(m: *Module, triple: *u8) -> void {
	LLVMSetTarget(m.handle, triple);
}
pub fn print_to_file(m: *Module, filename: *u8, error_message: **u8) -> i32 {
	return LLVMPrintModuleToFile(m.handle, filename, error_message);
}
pub fn print_to_string(m: *Module) -> *u8 {
	return LLVMPrintModuleToString(m.handle);
}
pub fn add_function(m: *Module, name: *u8, function_type: Type) -> Value {
	return wrap_value(LLVMAddFunction(m.handle, name, function_type.handle));
}
pub fn add_global(m: *Module, ty: Type, name: *u8) -> Value {
	return wrap_value(LLVMAddGlobal(m.handle, ty.handle, name));
}
pub fn set_initializer(global_var: *Value, val: Value) -> void {
	LLVMSetInitializer(global_var.handle, val.handle);
}
pub fn set_global_constant(global_var: *Value, is_const: bool) -> void {
	LLVMSetGlobalConstant(global_var.handle, is_const ? (1 cast i32) : (0 cast i32));
}
pub fn set_section(val: *Value, section: *u8) -> void {
	LLVMSetSection(val.handle, section);
}
pub fn set_alignment(val: *Value, bytes: u32) -> void {
	LLVMSetAlignment(val.handle, bytes);
}
pub fn block_terminator(block: *void) -> *void {
	return LLVMGetBasicBlockTerminator(block);
}
pub fn first_instruction(block: *void) -> *void {
	return LLVMGetFirstInstruction(block);
}
pub fn entry_basic_block(fn_val: Value) -> *void {
	return LLVMGetEntryBasicBlock(fn_val.handle);
}
pub fn named_function(m: *Module, name: *u8) -> Value {
	return wrap_value(LLVMGetNamedFunction(m.handle, name));
}
pub fn first_function(m: *Module) -> Value {
	return wrap_value(LLVMGetFirstFunction(m.handle));
}
pub fn next_function(fn_val: Value) -> Value {
	return wrap_value(LLVMGetNextFunction(fn_val.handle));
}
pub fn add_target_dependent_fn_attr(fn_val: Value, attr: *u8, val: *u8) -> void {
	LLVMAddTargetDependentFunctionAttr(fn_val.handle, attr, val);
}
pub fn set_function_call_conv(fn_val: Value, cc: u32) -> void {
	LLVMSetFunctionCallConv(fn_val.handle, cc);
}
pub fn set_instr_call_conv(instr: Value, cc: u32) -> void {
	LLVMSetInstructionCallConv(instr.handle, cc);
}
pub fn enum_attr_kind(name: *u8, slen: usize) -> u32 {
	return LLVMGetEnumAttributeKindForName(name, slen);
}
pub fn create_enum_attr(ctx: *Context, kind_id: u32, val: u64) -> *void {
	return LLVMCreateEnumAttribute(ctx.handle, kind_id, val);
}
pub fn create_type_attr(ctx: *Context, kind_id: u32, ty: Type) -> *void {
	return LLVMCreateTypeAttribute(ctx.handle, kind_id, ty.handle);
}
pub fn add_fn_attr_at_index(fn_val: Value, idx: u32, attr: *void) -> void {
	LLVMAddAttributeAtIndex(fn_val.handle, idx, attr);
}
pub fn add_call_site_attr(call_val: Value, idx: u32, attr: *void) -> void {
	LLVMAddCallSiteAttribute(call_val.handle, idx, attr);
}
pub fn inline_asm(
	ty: Type,
	asm_str: *u8,
	asm_len: usize,
	constraints: *u8,
	constraints_len: usize,
	has_side_effects: bool,
	is_align_stack: bool,
	dialect: i32,
	can_throw: bool
) -> Value {
	return wrap_value(LLVMGetInlineAsm(
		ty.handle,
		asm_str,
		asm_len,
		constraints,
		constraints_len,
		has_side_effects ? (1 cast i32) : (0 cast i32),
		is_align_stack ? (1 cast i32) : (0 cast i32),
		dialect,
		can_throw ? (1 cast i32) : (0 cast i32)
	));
}

// Type constructors
pub mod type {
	pub fn void_type(ctx: *Context) -> Type { return wrap_type(LLVMVoidTypeInContext(ctx.handle)); }
	pub fn int1(ctx: *Context) -> Type { return wrap_type(LLVMInt1TypeInContext(ctx.handle)); }
	pub fn int8(ctx: *Context) -> Type { return wrap_type(LLVMInt8TypeInContext(ctx.handle)); }
	pub fn int16(ctx: *Context) -> Type { return wrap_type(LLVMInt16TypeInContext(ctx.handle)); }
	pub fn int32(ctx: *Context) -> Type { return wrap_type(LLVMInt32TypeInContext(ctx.handle)); }
	pub fn int64(ctx: *Context) -> Type { return wrap_type(LLVMInt64TypeInContext(ctx.handle)); }
	pub fn integer(ctx: *Context, bits: u32) -> Type { return wrap_type(LLVMIntTypeInContext(ctx.handle, bits)); }
	pub fn half(ctx: *Context) -> Type { return wrap_type(LLVMHalfTypeInContext(ctx.handle)); }
	pub fn float(ctx: *Context) -> Type { return wrap_type(LLVMFloatTypeInContext(ctx.handle)); }
	pub fn double(ctx: *Context) -> Type { return wrap_type(LLVMDoubleTypeInContext(ctx.handle)); }
	pub fn fp128(ctx: *Context) -> Type { return wrap_type(LLVMFP128TypeInContext(ctx.handle)); }
	pub fn struct_type(ctx: *Context, elements: **void, count: u32, packed: bool) -> Type {
		return wrap_type(LLVMStructTypeInContext(ctx.handle, elements, count, packed ? (1 cast i32) : (0 cast i32)));
	}
	pub fn struct_create_named(ctx: *Context, name: *u8) -> Type {
		return wrap_type(LLVMStructCreateNamed(ctx.handle, name));
	}
	pub fn struct_set_body(st: Type, elements: **void, count: u32, packed: bool) -> void {
		LLVMStructSetBody(st.handle, elements, count, packed ? (1 cast i32) : (0 cast i32));
	}
	pub fn by_name(ctx: *Context, name: *u8) -> Type {
		return wrap_type(LLVMGetTypeByName2(ctx.handle, name));
	}
	pub fn pointer(ctx: *Context, address_space: u32) -> Type { return wrap_type(LLVMPointerTypeInContext(ctx.handle, address_space)); }
	pub fn function(return_type: Type, parameters: **void, parameter_count: u32, variadic: bool) -> Type {
		let v: i32 = variadic ? (1 cast i32) : (0 cast i32);
		return wrap_type(LLVMFunctionType(return_type.handle, parameters, parameter_count, v));
	}
	pub fn array(element: Type, element_count: u64) -> Type { return wrap_type(LLVMArrayType2(element.handle, element_count)); }
	pub fn vector(element: Type, element_count: u32) -> Type { return wrap_type(LLVMVectorType(element.handle, element_count)); }
}

// Type methods
pub fn kind(ty: *Type) -> bind.llvm.TypeKind { return LLVMGetTypeKind(ty.handle); }
pub fn width(ty: *Type) -> u32 { return LLVMGetIntTypeWidth(ty.handle); }
pub fn pointer_address_space(ty: *Type) -> u32 { return LLVMGetPointerAddressSpace(ty.handle); }

// Value methods
pub fn type_of(val: *Value) -> Type { return wrap_type(LLVMTypeOf(val.handle)); }
pub fn linkage(val: *Value) -> bind.llvm.Linkage { return LLVMGetLinkage(val.handle); }
pub fn set_linkage(val: *Value, l: bind.llvm.Linkage) -> void { LLVMSetLinkage(val.handle, l); }
pub fn is_declaration(val: *Value) -> bool { return LLVMIsDeclaration(val.handle) != 0; }
pub fn param_count(val: *Value) -> u32 { return LLVMCountParams(val.handle); }
pub fn param(val: *Value, index: u32) -> Value { return wrap_value(LLVMGetParam(val.handle, index)); }
pub fn append_basic_block(ctx: *Context, function: Value, name: *u8) -> *void {
	return LLVMAppendBasicBlockInContext(ctx.handle, function.handle, name);
}

// Constants
pub mod constant {
	pub fn null_value(ty: Type) -> Value { return wrap_value(LLVMConstNull(ty.handle)); }
	pub fn integer(ty: Type, value: u64, sign_extend: bool) -> Value {
		let s: i32 = sign_extend ? (1 cast i32) : (0 cast i32);
		return wrap_value(LLVMConstInt(ty.handle, value, s));
	}
	pub fn real(ty: Type, value: f64) -> Value { return wrap_value(LLVMConstReal(ty.handle, value)); }
	pub fn undef(ty: Type) -> Value { return wrap_value(LLVMGetUndef(ty.handle)); }
	pub fn string(ctx: *Context, str: *u8, length: usize, dont_null_terminate: bool) -> Value {
		return wrap_value(LLVMConstStringInContext2(ctx.handle, str, length, dont_null_terminate ? (1 cast i32) : (0 cast i32)));
	}
	pub fn struct_val(ctx: *Context, vals: **void, count: u32, packed: bool) -> Value {
		return wrap_value(LLVMConstStructInContext(ctx.handle, vals, count, packed ? (1 cast i32) : (0 cast i32)));
	}
	pub fn array_val(elem_ty: Type, vals: **void, length: u64) -> Value {
		return wrap_value(LLVMConstArray2(elem_ty.handle, vals, length));
	}
	pub fn is_constant_int(val: Value) -> bool { return LLVMIsAConstantInt(val.handle) != null; }
	pub fn integer_unsigned_value(val: Value) -> u64 { return LLVMConstIntGetZExtValue(val.handle); }
	pub fn integer_signed_value(val: Value) -> i64 { return LLVMConstIntGetSExtValue(val.handle); }
}
