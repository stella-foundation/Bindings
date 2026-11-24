mod bind.llvm.ir;
import "./llvm.sl";
import "./core.sl";

#[abi("C"), link_name]
extern fn LLVMCreateBuilderInContext(context: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMDisposeBuilder(builder: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMPositionBuilderAtEnd(builder: *void, block: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMGetInsertBlock(builder: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildRetVoid(builder: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildRet(builder: *void, value: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildBr(builder: *void, destination: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildCondBr(builder: *void, condition: *void, then_block: *void, else_block: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildAdd(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildSub(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildMul(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildAlloca(builder: *void, ty: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildLoad2(builder: *void, ty: *void, pointer: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildStore(builder: *void, value: *void, pointer: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildGEP2(builder: *void, ty: *void, pointer: *void, indices: **void, index_count: u32, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildGlobalStringPtr(builder: *void, value: *u8, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildBitCast(builder: *void, value: *void, destination: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildICmp(builder: *void, predicate: bind.llvm.IntPredicate, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildPhi(builder: *void, ty: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMAddIncoming(phi_node: *void, values: **void, blocks: **void, count: u32) -> void;
#[abi("C"), link_name]
extern fn LLVMPositionBuilderBefore(builder: *void, instr: *void) -> void;
#[abi("C"), link_name]
extern fn LLVMBuildUnreachable(builder: *void) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildSDiv(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildUDiv(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildSRem(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildURem(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFAdd(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFSub(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFMul(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFDiv(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFRem(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFNeg(builder: *void, val: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildNeg(builder: *void, val: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildNot(builder: *void, val: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildShl(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildLShr(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildAShr(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildAnd(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildOr(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildXor(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFCmp(builder: *void, predicate: bind.llvm.RealPredicate, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildTrunc(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildZExt(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildSExt(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFPToUI(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFPToSI(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildUIToFP(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildSIToFP(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFPTrunc(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildFPExt(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildPtrToInt(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildIntToPtr(builder: *void, val: *void, dest: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildSelect(builder: *void, cond: *void, then_val: *void, else_val: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildStructGEP2(builder: *void, ty: *void, pointer: *void, index: u32, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildExtractValue(builder: *void, agg: *void, index: u32, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildInsertValue(builder: *void, agg: *void, elt: *void, index: u32, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildCall2(builder: *void, function_type: *void, function: *void, arguments: **void, argument_count: u32, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildNUWAdd(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildNUWSub(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildNUWMul(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildNSWAdd(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildNSWSub(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildNSWMul(builder: *void, lhs: *void, rhs: *void, name: *u8) -> *void;
#[abi("C"), link_name]
extern fn LLVMBuildSwitch(builder: *void, val: *void, else_block: *void, num_cases: u32) -> *void;
#[abi("C"), link_name]
extern fn LLVMAddCase(switch_val: *void, on_val: *void, dest: *void) -> void;

/// Managed handle wrapping an LLVMBuilderRef.
pub struct Builder {
	pub handle: *void,
}

impl bind.llvm.Disposable for Builder {
	fn dispose(self: *Self) -> void {
		LLVMDisposeBuilder(self.handle);
	}
}

pub mod builder {
	pub fn create(ctx: *bind.llvm.core.Context) -> Builder {
		let mut b: Builder;
		b.handle = LLVMCreateBuilderInContext(ctx.handle);
		return b;
	}

	pub fn wrap(raw: *void) -> Builder {
		let mut b: Builder;
		b.handle = raw;
		return b;
	}
}

pub fn position_at_end(b: *Builder, block: *void) -> void {
	LLVMPositionBuilderAtEnd(b.handle, block);
}

pub fn insert_block(b: *Builder) -> *void {
	return LLVMGetInsertBlock(b.handle);
}

pub fn ret_void(b: *Builder) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildRetVoid(b.handle));
}

pub fn ret(b: *Builder, val: bind.llvm.core.Value) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildRet(b.handle, val.handle));
}

pub fn branch(b: *Builder, dest: *void) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildBr(b.handle, dest));
}

pub fn cond_branch(b: *Builder, cond: bind.llvm.core.Value, then_block: *void, else_block: *void) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildCondBr(b.handle, cond.handle, then_block, else_block));
}

pub fn add(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildAdd(b.handle, lhs.handle, rhs.handle, name));
}

pub fn sub(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildSub(b.handle, lhs.handle, rhs.handle, name));
}

pub fn mul(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildMul(b.handle, lhs.handle, rhs.handle, name));
}

pub fn alloca(b: *Builder, ty: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildAlloca(b.handle, ty.handle, name));
}

pub fn load(b: *Builder, ty: bind.llvm.core.Type, pointer: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildLoad2(b.handle, ty.handle, pointer.handle, name));
}

pub fn store(b: *Builder, val: bind.llvm.core.Value, pointer: bind.llvm.core.Value) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildStore(b.handle, val.handle, pointer.handle));
}

pub fn gep(b: *Builder, ty: bind.llvm.core.Type, pointer: bind.llvm.core.Value, indices: **void, index_count: u32, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildGEP2(b.handle, ty.handle, pointer.handle, indices, index_count, name));
}

pub fn global_string_pointer(b: *Builder, val: *u8, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildGlobalStringPtr(b.handle, val, name));
}

pub fn bit_cast(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildBitCast(b.handle, val.handle, dest.handle, name));
}

pub fn integer_compare(b: *Builder, pred: bind.llvm.IntPredicate, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildICmp(b.handle, pred, lhs.handle, rhs.handle, name));
}

pub fn phi(b: *Builder, ty: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildPhi(b.handle, ty.handle, name));
}

pub fn add_incoming(phi_node: bind.llvm.core.Value, values: **void, blocks: **void, count: u32) -> void {
	LLVMAddIncoming(phi_node.handle, values, blocks, count);
}

pub fn call(b: *Builder, fn_type: bind.llvm.core.Type, fn_val: bind.llvm.core.Value, args: **void, arg_count: u32, name: *u8) -> bind.llvm.core.Value {
	return bind.llvm.core.wrap_value(LLVMBuildCall2(b.handle, fn_type.handle, fn_val.handle, args, arg_count, name));
}

pub fn position_before(b: *Builder, instr: *void) -> void { LLVMPositionBuilderBefore(b.handle, instr); }
pub fn unreachable_inst(b: *Builder) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildUnreachable(b.handle)); }
pub fn sdiv(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildSDiv(b.handle, lhs.handle, rhs.handle, name)); }
pub fn udiv(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildUDiv(b.handle, lhs.handle, rhs.handle, name)); }
pub fn srem(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildSRem(b.handle, lhs.handle, rhs.handle, name)); }
pub fn urem(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildURem(b.handle, lhs.handle, rhs.handle, name)); }
pub fn fadd(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFAdd(b.handle, lhs.handle, rhs.handle, name)); }
pub fn fsub(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFSub(b.handle, lhs.handle, rhs.handle, name)); }
pub fn fmul(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFMul(b.handle, lhs.handle, rhs.handle, name)); }
pub fn fdiv(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFDiv(b.handle, lhs.handle, rhs.handle, name)); }
pub fn frem(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFRem(b.handle, lhs.handle, rhs.handle, name)); }
pub fn fneg(b: *Builder, val: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFNeg(b.handle, val.handle, name)); }
pub fn neg(b: *Builder, val: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildNeg(b.handle, val.handle, name)); }
pub fn not_val(b: *Builder, val: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildNot(b.handle, val.handle, name)); }
pub fn shl(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildShl(b.handle, lhs.handle, rhs.handle, name)); }
pub fn lshr(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildLShr(b.handle, lhs.handle, rhs.handle, name)); }
pub fn ashr(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildAShr(b.handle, lhs.handle, rhs.handle, name)); }
pub fn bit_and(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildAnd(b.handle, lhs.handle, rhs.handle, name)); }
pub fn bit_or(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildOr(b.handle, lhs.handle, rhs.handle, name)); }
pub fn bit_xor(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildXor(b.handle, lhs.handle, rhs.handle, name)); }
pub fn real_compare(b: *Builder, pred: bind.llvm.RealPredicate, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFCmp(b.handle, pred, lhs.handle, rhs.handle, name)); }
pub fn trunc(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildTrunc(b.handle, val.handle, dest.handle, name)); }
pub fn zext(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildZExt(b.handle, val.handle, dest.handle, name)); }
pub fn sext(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildSExt(b.handle, val.handle, dest.handle, name)); }
pub fn fptoui(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFPToUI(b.handle, val.handle, dest.handle, name)); }
pub fn fptosi(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFPToSI(b.handle, val.handle, dest.handle, name)); }
pub fn uitofp(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildUIToFP(b.handle, val.handle, dest.handle, name)); }
pub fn sitofp(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildSIToFP(b.handle, val.handle, dest.handle, name)); }
pub fn fptrunc(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFPTrunc(b.handle, val.handle, dest.handle, name)); }
pub fn fpext(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildFPExt(b.handle, val.handle, dest.handle, name)); }
pub fn ptrtoint(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildPtrToInt(b.handle, val.handle, dest.handle, name)); }
pub fn inttoptr(b: *Builder, val: bind.llvm.core.Value, dest: bind.llvm.core.Type, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildIntToPtr(b.handle, val.handle, dest.handle, name)); }
pub fn select(b: *Builder, cond: bind.llvm.core.Value, then_val: bind.llvm.core.Value, else_val: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildSelect(b.handle, cond.handle, then_val.handle, else_val.handle, name)); }
pub fn struct_gep(b: *Builder, ty: bind.llvm.core.Type, pointer: bind.llvm.core.Value, index: u32, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildStructGEP2(b.handle, ty.handle, pointer.handle, index, name)); }
pub fn extract_value(b: *Builder, agg: bind.llvm.core.Value, index: u32, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildExtractValue(b.handle, agg.handle, index, name)); }
pub fn insert_value(b: *Builder, agg: bind.llvm.core.Value, elt: bind.llvm.core.Value, index: u32, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildInsertValue(b.handle, agg.handle, elt.handle, index, name)); }
pub fn nuw_add(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildNUWAdd(b.handle, lhs.handle, rhs.handle, name)); }
pub fn nuw_sub(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildNUWSub(b.handle, lhs.handle, rhs.handle, name)); }
pub fn nuw_mul(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildNUWMul(b.handle, lhs.handle, rhs.handle, name)); }
pub fn nsw_add(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildNSWAdd(b.handle, lhs.handle, rhs.handle, name)); }
pub fn nsw_sub(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildNSWSub(b.handle, lhs.handle, rhs.handle, name)); }
pub fn nsw_mul(b: *Builder, lhs: bind.llvm.core.Value, rhs: bind.llvm.core.Value, name: *u8) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildNSWMul(b.handle, lhs.handle, rhs.handle, name)); }
pub fn switch_inst(b: *Builder, val: bind.llvm.core.Value, else_block: *void, num_cases: u32) -> bind.llvm.core.Value { return bind.llvm.core.wrap_value(LLVMBuildSwitch(b.handle, val.handle, else_block, num_cases)); }
pub fn add_case(switch_val: bind.llvm.core.Value, on_val: bind.llvm.core.Value, dest: *void) -> void { LLVMAddCase(switch_val.handle, on_val.handle, dest); }
