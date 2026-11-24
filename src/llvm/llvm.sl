mod bind.llvm;

pub enum TypeKind: u32 {
	Void = 0,
	Half = 1,
	Float = 2,
	Double = 3,
	X86FP80 = 4,
	FP128 = 5,
	PPCFP128 = 6,
	Label = 7,
	Integer = 8,
	Function = 9,
	Struct = 10,
	Array = 11,
	Pointer = 12,
	Vector = 13,
	Metadata = 14,
	Token = 16,
	ScalableVector = 17,
	BFloat = 18,
	X86AMX = 19,
	TargetExt = 20,
}

pub enum Linkage: u32 {
	External = 0,
	AvailableExternally = 1,
	LinkOnceAny = 2,
	LinkOnceODR = 3,
	LinkOnceODRAutoHide = 4,
	WeakAny = 5,
	WeakODR = 6,
	Appending = 7,
	Internal = 8,
	Private = 9,
	DLLImport = 10,
	DLLExport = 11,
	ExternalWeak = 12,
	Ghost = 13,
	Common = 14,
	LinkerPrivate = 15,
	LinkerPrivateWeak = 16,
}

pub enum Opcode: u32 {
	Ret = 1,
	Br = 2,
	Switch = 3,
	Unreachable = 7,
	FNeg = 66,
	Add = 8,
	FAdd = 9,
	Sub = 10,
	FSub = 11,
	Mul = 12,
	FMul = 13,
	UDiv = 14,
	SDiv = 15,
	FDiv = 16,
	URem = 17,
	SRem = 18,
	FRem = 19,
	Shl = 20,
	LShr = 21,
	AShr = 22,
	And = 23,
	Or = 24,
	Xor = 25,
	Alloca = 26,
	Load = 27,
	Store = 28,
	GetElementPtr = 29,
	Trunc = 30,
	ZExt = 31,
	SExt = 32,
	FPToUI = 33,
	FPToSI = 34,
	UIToFP = 35,
	SIToFP = 36,
	FPTrunc = 37,
	FPExt = 38,
	PtrToInt = 39,
	IntToPtr = 40,
	BitCast = 41,
	ICmp = 42,
	FCmp = 43,
	Phi = 44,
	Call = 45,
	Select = 46,
	VAArg = 49,
	ExtractElement = 50,
	InsertElement = 51,
	ShuffleVector = 52,
	ExtractValue = 53,
	InsertValue = 54,
	Freeze = 68,
	Fence = 55,
	AtomicCmpXchg = 56,
	AtomicRMW = 57,
}

pub enum IntPredicate: u32 {
	Equal = 32,
	NotEqual = 33,
	UnsignedGreaterThan = 34,
	UnsignedGreaterOrEqual = 35,
	UnsignedLessThan = 36,
	UnsignedLessOrEqual = 37,
	SignedGreaterThan = 38,
	SignedGreaterOrEqual = 39,
	SignedLessThan = 40,
	SignedLessOrEqual = 41,
}

pub enum RealPredicate: u32 {
	PredicateFalse = 0,
	OEQ = 1,
	OGT = 2,
	OGE = 3,
	OLT = 4,
	OLE = 5,
	ONE = 6,
	ORD = 7,
	UNO = 8,
	UEQ = 9,
	UGT = 10,
	UGE = 11,
	ULT = 12,
	ULE = 13,
	UNE = 14,
	PredicateTrue = 15,
}

pub enum VerifierFailureAction: u32 {
	AbortProcess = 0,
	PrintMessage = 1,
	ReturnStatus = 2,
}

pub enum CodeGenOptLevel: u32 {
	None = 0,
	Less = 1,
	Default = 2,
	Aggressive = 3,
}

pub enum RelocMode: u32 {
	Default = 0,
	Static = 1,
	PIC = 2,
	DynamicNoPIC = 3,
	ROPI = 4,
	RWPI = 5,
	ROPIAndRWPI = 6,
}

pub enum CodeModel: u32 {
	Default = 0,
	JITDefault = 1,
	Tiny = 2,
	Small = 3,
	Kernel = 4,
	Medium = 5,
	Large = 6,
}

pub enum CodeGenFileType: u32 {
	Assembly = 0,
	Object = 1,
}

/// Interface for LLVM entities requiring explicit disposal.
pub trait Disposable {
	fn dispose(self: *Self) -> void;
}

pub fn dispose<D: Disposable>(resource: *D) -> void {
	resource.dispose();
}
