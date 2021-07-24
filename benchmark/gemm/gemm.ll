
; __CLANG_OFFLOAD_BUNDLE____START__ openmp-nvptx64
; ModuleID = 'src/gemm.c'
source_filename = "src/gemm.c"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@0 = private unnamed_addr constant [28 x i8] c";src/gemm.c;gemm_OMP;57;3;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2050, i32 3, i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 3, i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0) }, align 8
@3 = private unnamed_addr constant [29 x i8] c";src/gemm.c;gemm_OMP;57;44;;\00", align 1
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2050, i32 3, i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @3, i32 0, i32 0) }, align 8
@5 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 3, i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0) }, align 8
@__omp_offloading_32_84dffef_gemm_OMP_l56_exec_mode = weak constant i8 0
@llvm.compiler.used = appending global [1 x i8*] [i8* @__omp_offloading_32_84dffef_gemm_OMP_l56_exec_mode], section "llvm.metadata"

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_offloading_32_84dffef_gemm_OMP_l56_debug__(float* %C, float* %Cinit, float* %A, float* %B) #0 !dbg !13 {
entry:
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  %.zero.addr = alloca i32, align 4
  %.threadid_temp. = alloca i32, align 4
  store i32 0, i32* %.zero.addr, align 4
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !23, metadata !DIExpression()), !dbg !24
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !25, metadata !DIExpression()), !dbg !26
  %nvptx_num_threads = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !dbg !27
  call void @__kmpc_spmd_kernel_init(i32 %nvptx_num_threads, i16 0), !dbg !27
  br label %.execute, !dbg !27

.execute:                                         ; preds = %entry
  %0 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @5)
  store i32 %0, i32* %.threadid_temp., align 4, !dbg !27
  call void @__omp_outlined__2(i32* %.threadid_temp., i32* %.zero.addr, float** %C.addr, float** %Cinit.addr, float** %A.addr, float** %B.addr) #3, !dbg !28
  br label %.omp.deinit, !dbg !30

.omp.deinit:                                      ; preds = %.execute
  call void @__kmpc_spmd_kernel_deinit_v2(i16 0), !dbg !30
  br label %.exit, !dbg !30

.exit:                                            ; preds = %.omp.deinit
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

declare void @__kmpc_spmd_kernel_init(i32, i16)

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined___debug__(i32* noalias %.global_tid., i32* noalias %.bound_tid., float** noalias %C, float** noalias %Cinit, float** noalias %A, float** noalias %B) #0 !dbg !32 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float**, align 8
  %Cinit.addr = alloca float**, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  %tmp = alloca float**, align 8
  %tmp1 = alloca float**, align 8
  %tmp2 = alloca float**, align 8
  %tmp3 = alloca float**, align 8
  %.omp.iv = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %.omp.comb.lb = alloca i32, align 4
  %.omp.comb.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  %captured_vars_addrs = alloca [6 x i8*], align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !44, metadata !DIExpression()), !dbg !43
  store float** %C, float*** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %C.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store float** %Cinit, float*** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %Cinit.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load float**, float*** %C.addr, align 8, !dbg !53
  store float** %0, float*** %tmp, align 8, !dbg !53
  %1 = load float**, float*** %tmp, align 8, !dbg !53
  %2 = load float**, float*** %Cinit.addr, align 8, !dbg !53
  store float** %2, float*** %tmp1, align 8, !dbg !53
  %3 = load float**, float*** %tmp1, align 8, !dbg !53
  %4 = load float**, float*** %A.addr, align 8, !dbg !53
  store float** %4, float*** %tmp2, align 8, !dbg !53
  %5 = load float**, float*** %tmp2, align 8, !dbg !53
  %6 = load float**, float*** %B.addr, align 8, !dbg !53
  store float** %6, float*** %tmp3, align 8, !dbg !53
  %7 = load float**, float*** %tmp3, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !54, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %.omp.comb.lb, metadata !55, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %.omp.comb.lb, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %.omp.comb.ub, metadata !57, metadata !DIExpression()), !dbg !43
  store i32 99, i32* %.omp.comb.ub, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !58, metadata !DIExpression()), !dbg !43
  store i32 1, i32* %.omp.stride, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !59, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %.omp.is_last, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %i, metadata !60, metadata !DIExpression()), !dbg !43
  %nvptx_num_threads = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !dbg !53
  %8 = load i32*, i32** %.global_tid..addr, align 8, !dbg !53
  %9 = load i32, i32* %8, align 4, !dbg !53
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %9, i32 91, i32* %.omp.is_last, i32* %.omp.comb.lb, i32* %.omp.comb.ub, i32* %.omp.stride, i32 1, i32 %nvptx_num_threads), !dbg !53
  %10 = load i32, i32* %.omp.comb.ub, align 4, !dbg !56
  %cmp = icmp sgt i32 %10, 99, !dbg !56
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !56

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !56

cond.false:                                       ; preds = %entry
  %11 = load i32, i32* %.omp.comb.ub, align 4, !dbg !56
  br label %cond.end, !dbg !56

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 99, %cond.true ], [ %11, %cond.false ], !dbg !56
  store i32 %cond, i32* %.omp.comb.ub, align 4, !dbg !56
  %12 = load i32, i32* %.omp.comb.lb, align 4, !dbg !56
  store i32 %12, i32* %.omp.iv, align 4, !dbg !56
  br label %omp.inner.for.cond, !dbg !53

omp.inner.for.cond:                               ; preds = %cond.end11, %cond.end
  %13 = load i32, i32* %.omp.iv, align 4, !dbg !56
  %cmp5 = icmp slt i32 %13, 100, !dbg !53
  br i1 %cmp5, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !53

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %14 = load i32, i32* %.omp.comb.lb, align 4, !dbg !61
  %15 = zext i32 %14 to i64, !dbg !61
  %16 = load i32, i32* %.omp.comb.ub, align 4, !dbg !61
  %17 = zext i32 %16 to i64, !dbg !61
  %18 = getelementptr inbounds [6 x i8*], [6 x i8*]* %captured_vars_addrs, i64 0, i64 0, !dbg !61
  %19 = inttoptr i64 %15 to i8*, !dbg !61
  store i8* %19, i8** %18, align 8, !dbg !61
  %20 = getelementptr inbounds [6 x i8*], [6 x i8*]* %captured_vars_addrs, i64 0, i64 1, !dbg !61
  %21 = inttoptr i64 %17 to i8*, !dbg !61
  store i8* %21, i8** %20, align 8, !dbg !61
  %22 = getelementptr inbounds [6 x i8*], [6 x i8*]* %captured_vars_addrs, i64 0, i64 2, !dbg !61
  %23 = bitcast float** %1 to i8*, !dbg !61
  store i8* %23, i8** %22, align 8, !dbg !61
  %24 = getelementptr inbounds [6 x i8*], [6 x i8*]* %captured_vars_addrs, i64 0, i64 3, !dbg !61
  %25 = bitcast float** %3 to i8*, !dbg !61
  store i8* %25, i8** %24, align 8, !dbg !61
  %26 = getelementptr inbounds [6 x i8*], [6 x i8*]* %captured_vars_addrs, i64 0, i64 4, !dbg !61
  %27 = bitcast float** %5 to i8*, !dbg !61
  store i8* %27, i8** %26, align 8, !dbg !61
  %28 = getelementptr inbounds [6 x i8*], [6 x i8*]* %captured_vars_addrs, i64 0, i64 5, !dbg !61
  %29 = bitcast float** %7 to i8*, !dbg !61
  store i8* %29, i8** %28, align 8, !dbg !61
  %30 = bitcast [6 x i8*]* %captured_vars_addrs to i8**, !dbg !61
  call void @__kmpc_parallel_51(%struct.ident_t* @5, i32 %9, i32 1, i32 -1, i32 -1, i8* bitcast (void (i32*, i32*, i64, i64, float**, float**, float**, float**)* @__omp_outlined__ to i8*), i8* null, i8** %30, i64 6), !dbg !61
  br label %omp.inner.for.inc, !dbg !62

omp.inner.for.inc:                                ; preds = %omp.inner.for.body
  %31 = load i32, i32* %.omp.iv, align 4, !dbg !56
  %32 = load i32, i32* %.omp.stride, align 4, !dbg !56
  %add = add nsw i32 %31, %32, !dbg !53
  store i32 %add, i32* %.omp.iv, align 4, !dbg !53
  %33 = load i32, i32* %.omp.comb.lb, align 4, !dbg !56
  %34 = load i32, i32* %.omp.stride, align 4, !dbg !56
  %add6 = add nsw i32 %33, %34, !dbg !53
  store i32 %add6, i32* %.omp.comb.lb, align 4, !dbg !53
  %35 = load i32, i32* %.omp.comb.ub, align 4, !dbg !56
  %36 = load i32, i32* %.omp.stride, align 4, !dbg !56
  %add7 = add nsw i32 %35, %36, !dbg !53
  store i32 %add7, i32* %.omp.comb.ub, align 4, !dbg !53
  %37 = load i32, i32* %.omp.comb.ub, align 4, !dbg !56
  %cmp8 = icmp sgt i32 %37, 99, !dbg !56
  br i1 %cmp8, label %cond.true9, label %cond.false10, !dbg !56

cond.true9:                                       ; preds = %omp.inner.for.inc
  br label %cond.end11, !dbg !56

cond.false10:                                     ; preds = %omp.inner.for.inc
  %38 = load i32, i32* %.omp.comb.ub, align 4, !dbg !56
  br label %cond.end11, !dbg !56

cond.end11:                                       ; preds = %cond.false10, %cond.true9
  %cond12 = phi i32 [ 99, %cond.true9 ], [ %38, %cond.false10 ], !dbg !56
  store i32 %cond12, i32* %.omp.comb.ub, align 4, !dbg !56
  %39 = load i32, i32* %.omp.comb.lb, align 4, !dbg !56
  store i32 %39, i32* %.omp.iv, align 4, !dbg !56
  br label %omp.inner.for.cond, !dbg !62, !llvm.loop !64

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !62

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @4, i32 %9), !dbg !65
  ret void, !dbg !66
}

declare void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined___debug__1(i32* noalias %.global_tid., i32* noalias %.bound_tid., i64 %.previous.lb., i64 %.previous.ub., float** noalias %C, float** noalias %Cinit, float** noalias %A, float** noalias %B) #0 !dbg !67 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %.previous.lb..addr = alloca i64, align 8
  %.previous.ub..addr = alloca i64, align 8
  %C.addr = alloca float**, align 8
  %Cinit.addr = alloca float**, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  %tmp = alloca float**, align 8
  %tmp1 = alloca float**, align 8
  %tmp2 = alloca float**, align 8
  %tmp3 = alloca float**, align 8
  %.omp.iv = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !74, metadata !DIExpression()), !dbg !73
  store i64 %.previous.lb., i64* %.previous.lb..addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.previous.lb..addr, metadata !75, metadata !DIExpression()), !dbg !73
  store i64 %.previous.ub., i64* %.previous.ub..addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.previous.ub..addr, metadata !76, metadata !DIExpression()), !dbg !73
  store float** %C, float*** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %C.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store float** %Cinit, float*** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %Cinit.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load float**, float*** %C.addr, align 8, !dbg !85
  store float** %0, float*** %tmp, align 8, !dbg !85
  %1 = load float**, float*** %tmp, align 8, !dbg !85
  %2 = load float**, float*** %Cinit.addr, align 8, !dbg !85
  store float** %2, float*** %tmp1, align 8, !dbg !85
  %3 = load float**, float*** %tmp1, align 8, !dbg !85
  %4 = load float**, float*** %A.addr, align 8, !dbg !85
  store float** %4, float*** %tmp2, align 8, !dbg !85
  %5 = load float**, float*** %tmp2, align 8, !dbg !85
  %6 = load float**, float*** %B.addr, align 8, !dbg !85
  store float** %6, float*** %tmp3, align 8, !dbg !85
  %7 = load float**, float*** %tmp3, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !86, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !87, metadata !DIExpression()), !dbg !73
  store i32 0, i32* %.omp.lb, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !89, metadata !DIExpression()), !dbg !73
  store i32 99, i32* %.omp.ub, align 4, !dbg !88
  %8 = load i64, i64* %.previous.lb..addr, align 8, !dbg !85
  %conv = trunc i64 %8 to i32, !dbg !85
  %9 = load i64, i64* %.previous.ub..addr, align 8, !dbg !85
  %conv5 = trunc i64 %9 to i32, !dbg !85
  store i32 %conv, i32* %.omp.lb, align 4, !dbg !85
  store i32 %conv5, i32* %.omp.ub, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !90, metadata !DIExpression()), !dbg !73
  store i32 1, i32* %.omp.stride, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !91, metadata !DIExpression()), !dbg !73
  store i32 0, i32* %.omp.is_last, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata i32* %i, metadata !92, metadata !DIExpression()), !dbg !73
  %10 = load i32*, i32** %.global_tid..addr, align 8, !dbg !85
  %11 = load i32, i32* %10, align 4, !dbg !85
  call void @__kmpc_for_static_init_4(%struct.ident_t* @2, i32 %11, i32 33, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !93
  %12 = load i32, i32* %.omp.lb, align 4, !dbg !88
  store i32 %12, i32* %.omp.iv, align 4, !dbg !88
  br label %omp.inner.for.cond, !dbg !85

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %entry
  %13 = load i32, i32* %.omp.iv, align 4, !dbg !88
  %conv6 = sext i32 %13 to i64, !dbg !88
  %14 = load i64, i64* %.previous.ub..addr, align 8, !dbg !88
  %cmp = icmp ule i64 %conv6, %14, !dbg !85
  br i1 %cmp, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !85

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %15 = load i32, i32* %.omp.iv, align 4, !dbg !88
  %mul = mul nsw i32 %15, 1, !dbg !94
  %add = add nsw i32 0, %mul, !dbg !94
  store i32 %add, i32* %i, align 4, !dbg !94
  call void @llvm.dbg.declare(metadata i32* %j, metadata !95, metadata !DIExpression()), !dbg !98
  store i32 0, i32* %j, align 4, !dbg !98
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc36, %omp.inner.for.body
  %16 = load i32, i32* %j, align 4, !dbg !100
  %cmp8 = icmp slt i32 %16, 100, !dbg !102
  br i1 %cmp8, label %for.body, label %for.end38, !dbg !103

for.body:                                         ; preds = %for.cond
  %17 = load float*, float** %3, align 8, !dbg !104
  %18 = load i32, i32* %i, align 4, !dbg !106
  %mul10 = mul nsw i32 %18, 100, !dbg !107
  %19 = load i32, i32* %j, align 4, !dbg !108
  %add11 = add nsw i32 %mul10, %19, !dbg !109
  %idxprom = sext i32 %add11 to i64, !dbg !104
  %arrayidx = getelementptr inbounds float, float* %17, i64 %idxprom, !dbg !104
  %20 = load float, float* %arrayidx, align 4, !dbg !104
  %mul12 = fmul float %20, 2.123000e+03, !dbg !110
  %21 = load float*, float** %1, align 8, !dbg !111
  %22 = load i32, i32* %i, align 4, !dbg !112
  %mul13 = mul nsw i32 %22, 100, !dbg !113
  %23 = load i32, i32* %j, align 4, !dbg !114
  %add14 = add nsw i32 %mul13, %23, !dbg !115
  %idxprom15 = sext i32 %add14 to i64, !dbg !111
  %arrayidx16 = getelementptr inbounds float, float* %21, i64 %idxprom15, !dbg !111
  store float %mul12, float* %arrayidx16, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %k, metadata !117, metadata !DIExpression()), !dbg !119
  store i32 0, i32* %k, align 4, !dbg !119
  br label %for.cond17, !dbg !120

for.cond17:                                       ; preds = %for.inc, %for.body
  %24 = load i32, i32* %k, align 4, !dbg !121
  %cmp18 = icmp slt i32 %24, 100, !dbg !123
  br i1 %cmp18, label %for.body20, label %for.end, !dbg !124

for.body20:                                       ; preds = %for.cond17
  %25 = load float*, float** %5, align 8, !dbg !125
  %26 = load i32, i32* %i, align 4, !dbg !127
  %mul21 = mul nsw i32 %26, 100, !dbg !128
  %27 = load i32, i32* %k, align 4, !dbg !129
  %add22 = add nsw i32 %mul21, %27, !dbg !130
  %idxprom23 = sext i32 %add22 to i64, !dbg !125
  %arrayidx24 = getelementptr inbounds float, float* %25, i64 %idxprom23, !dbg !125
  %28 = load float, float* %arrayidx24, align 4, !dbg !125
  %mul25 = fmul float 3.241200e+04, %28, !dbg !131
  %29 = load float*, float** %7, align 8, !dbg !132
  %30 = load i32, i32* %k, align 4, !dbg !133
  %mul26 = mul nsw i32 %30, 100, !dbg !134
  %31 = load i32, i32* %j, align 4, !dbg !135
  %add27 = add nsw i32 %mul26, %31, !dbg !136
  %idxprom28 = sext i32 %add27 to i64, !dbg !132
  %arrayidx29 = getelementptr inbounds float, float* %29, i64 %idxprom28, !dbg !132
  %32 = load float, float* %arrayidx29, align 4, !dbg !132
  %mul30 = fmul float %mul25, %32, !dbg !137
  %33 = load float*, float** %1, align 8, !dbg !138
  %34 = load i32, i32* %i, align 4, !dbg !139
  %mul31 = mul nsw i32 %34, 100, !dbg !140
  %35 = load i32, i32* %j, align 4, !dbg !141
  %add32 = add nsw i32 %mul31, %35, !dbg !142
  %idxprom33 = sext i32 %add32 to i64, !dbg !138
  %arrayidx34 = getelementptr inbounds float, float* %33, i64 %idxprom33, !dbg !138
  %36 = load float, float* %arrayidx34, align 4, !dbg !143
  %add35 = fadd float %36, %mul30, !dbg !143
  store float %add35, float* %arrayidx34, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body20
  %37 = load i32, i32* %k, align 4, !dbg !145
  %inc = add nsw i32 %37, 1, !dbg !145
  store i32 %inc, i32* %k, align 4, !dbg !145
  br label %for.cond17, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond17
  br label %for.inc36, !dbg !150

for.inc36:                                        ; preds = %for.end
  %38 = load i32, i32* %j, align 4, !dbg !151
  %inc37 = add nsw i32 %38, 1, !dbg !151
  store i32 %inc37, i32* %j, align 4, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end38:                                        ; preds = %for.cond
  br label %omp.body.continue, !dbg !155

omp.body.continue:                                ; preds = %for.end38
  br label %omp.inner.for.inc, !dbg !93

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %39 = load i32, i32* %.omp.iv, align 4, !dbg !88
  %40 = load i32, i32* %.omp.stride, align 4, !dbg !88
  %add39 = add nsw i32 %39, %40, !dbg !85
  store i32 %add39, i32* %.omp.iv, align 4, !dbg !85
  br label %omp.inner.for.cond, !dbg !93, !llvm.loop !156

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !93

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @4, i32 %11), !dbg !157
  ret void, !dbg !158
}

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined__(i32* noalias %.global_tid., i32* noalias %.bound_tid., i64 %.previous.lb., i64 %.previous.ub., float** nonnull align 8 dereferenceable(8) %C, float** nonnull align 8 dereferenceable(8) %Cinit, float** nonnull align 8 dereferenceable(8) %A, float** nonnull align 8 dereferenceable(8) %B) #0 !dbg !159 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %.previous.lb..addr = alloca i64, align 8
  %.previous.ub..addr = alloca i64, align 8
  %C.addr = alloca float**, align 8
  %Cinit.addr = alloca float**, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !163, metadata !DIExpression()), !dbg !164
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !165, metadata !DIExpression()), !dbg !164
  store i64 %.previous.lb., i64* %.previous.lb..addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.previous.lb..addr, metadata !166, metadata !DIExpression()), !dbg !164
  store i64 %.previous.ub., i64* %.previous.ub..addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.previous.ub..addr, metadata !167, metadata !DIExpression()), !dbg !164
  store float** %C, float*** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %C.addr, metadata !168, metadata !DIExpression()), !dbg !164
  store float** %Cinit, float*** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %Cinit.addr, metadata !169, metadata !DIExpression()), !dbg !164
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !170, metadata !DIExpression()), !dbg !164
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !171, metadata !DIExpression()), !dbg !164
  %0 = load float**, float*** %C.addr, align 8, !dbg !172
  %1 = load float**, float*** %Cinit.addr, align 8, !dbg !172
  %2 = load float**, float*** %A.addr, align 8, !dbg !172
  %3 = load float**, float*** %B.addr, align 8, !dbg !172
  %4 = load i32*, i32** %.global_tid..addr, align 8, !dbg !172
  %5 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !172
  %6 = load i64, i64* %.previous.lb..addr, align 8, !dbg !172
  %7 = load i64, i64* %.previous.ub..addr, align 8, !dbg !172
  %8 = load float**, float*** %C.addr, align 8, !dbg !172
  %9 = load float**, float*** %Cinit.addr, align 8, !dbg !172
  %10 = load float**, float*** %A.addr, align 8, !dbg !172
  %11 = load float**, float*** %B.addr, align 8, !dbg !172
  call void @__omp_outlined___debug__1(i32* %4, i32* %5, i64 %6, i64 %7, float** %8, float** %9, float** %10, float** %11) #3, !dbg !172
  ret void, !dbg !172
}

declare void @__kmpc_parallel_51(%struct.ident_t*, i32, i32, i32, i32, i8*, i8*, i8**, i64)

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined__2(i32* noalias %.global_tid., i32* noalias %.bound_tid., float** nonnull align 8 dereferenceable(8) %C, float** nonnull align 8 dereferenceable(8) %Cinit, float** nonnull align 8 dereferenceable(8) %A, float** nonnull align 8 dereferenceable(8) %B) #0 !dbg !173 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float**, align 8
  %Cinit.addr = alloca float**, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !176, metadata !DIExpression()), !dbg !177
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !178, metadata !DIExpression()), !dbg !177
  store float** %C, float*** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %C.addr, metadata !179, metadata !DIExpression()), !dbg !177
  store float** %Cinit, float*** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %Cinit.addr, metadata !180, metadata !DIExpression()), !dbg !177
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !181, metadata !DIExpression()), !dbg !177
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !182, metadata !DIExpression()), !dbg !177
  %0 = load float**, float*** %C.addr, align 8, !dbg !183
  %1 = load float**, float*** %Cinit.addr, align 8, !dbg !183
  %2 = load float**, float*** %A.addr, align 8, !dbg !183
  %3 = load float**, float*** %B.addr, align 8, !dbg !183
  %4 = load i32*, i32** %.global_tid..addr, align 8, !dbg !183
  %5 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !183
  %6 = load float**, float*** %C.addr, align 8, !dbg !183
  %7 = load float**, float*** %Cinit.addr, align 8, !dbg !183
  %8 = load float**, float*** %A.addr, align 8, !dbg !183
  %9 = load float**, float*** %B.addr, align 8, !dbg !183
  call void @__omp_outlined___debug__(i32* %4, i32* %5, float** %6, float** %7, float** %8, float** %9) #3, !dbg !183
  ret void, !dbg !183
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(%struct.ident_t*) #3

declare void @__kmpc_spmd_kernel_deinit_v2(i16)

; Function Attrs: convergent noinline norecurse nounwind optnone
define weak void @__omp_offloading_32_84dffef_gemm_OMP_l56(float* %C, float* %Cinit, float* %A, float* %B) #0 !dbg !184 {
entry:
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !185, metadata !DIExpression()), !dbg !186
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !187, metadata !DIExpression()), !dbg !186
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !188, metadata !DIExpression()), !dbg !186
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !189, metadata !DIExpression()), !dbg !186
  %0 = load float*, float** %C.addr, align 8, !dbg !190
  %1 = load float*, float** %Cinit.addr, align 8, !dbg !190
  %2 = load float*, float** %A.addr, align 8, !dbg !190
  %3 = load float*, float** %B.addr, align 8, !dbg !190
  call void @__omp_offloading_32_84dffef_gemm_OMP_l56_debug__(float* %0, float* %1, float* %2, float* %3) #3, !dbg !190
  ret void, !dbg !190
}

attributes #0 = { convergent noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_70" "target-features"="+ptx32,+sm_70" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!omp_offload.info = !{!3}
!nvvm.annotations = !{!4}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "src/gemm.c", directory: "/gpfs/jlse-fs0/users/dstfvrt/anl_jlse/gemm")
!2 = !{}
!3 = !{i32 0, i32 50, i32 139329519, !"gemm_OMP", i32 56, i32 0}
!4 = !{void (float*, float*, float*, float*)* @__omp_offloading_32_84dffef_gemm_OMP_l56, !"kernel", i32 1}
!5 = !{i32 7, !"Dwarf Version", i32 2}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"openmp", i32 50}
!9 = !{i32 7, !"openmp-device", i32 50}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "__omp_offloading_32_84dffef_gemm_OMP_l56_debug__", scope: !1, file: !1, line: 57, type: !14, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16, !16, !16, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "DATA_TYPE", file: !1, line: 36, baseType: !18)
!18 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!19 = !DILocalVariable(name: "C", arg: 1, scope: !13, file: !1, line: 53, type: !16)
!20 = !DILocation(line: 53, column: 25, scope: !13)
!21 = !DILocalVariable(name: "Cinit", arg: 2, scope: !13, file: !1, line: 53, type: !16)
!22 = !DILocation(line: 53, column: 47, scope: !13)
!23 = !DILocalVariable(name: "A", arg: 3, scope: !13, file: !1, line: 52, type: !16)
!24 = !DILocation(line: 52, column: 25, scope: !13)
!25 = !DILocalVariable(name: "B", arg: 4, scope: !13, file: !1, line: 52, type: !16)
!26 = !DILocation(line: 52, column: 47, scope: !13)
!27 = !DILocation(line: 57, column: 3, scope: !13)
!28 = !DILocation(line: 57, column: 3, scope: !29)
!29 = distinct !DILexicalBlock(scope: !13, file: !1, line: 57, column: 3)
!30 = !DILocation(line: 57, column: 44, scope: !29)
!31 = !DILocation(line: 57, column: 44, scope: !13)
!32 = distinct !DISubprogram(name: "__omp_outlined___debug__", scope: !1, file: !1, line: 58, type: !33, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35, !35, !40, !40, !40, !40}
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !39)
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !41)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!42 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !32, type: !35, flags: DIFlagArtificial)
!43 = !DILocation(line: 0, scope: !32)
!44 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !32, type: !35, flags: DIFlagArtificial)
!45 = !DILocalVariable(name: "C", arg: 3, scope: !32, file: !1, line: 53, type: !40)
!46 = !DILocation(line: 53, column: 25, scope: !32)
!47 = !DILocalVariable(name: "Cinit", arg: 4, scope: !32, file: !1, line: 53, type: !40)
!48 = !DILocation(line: 53, column: 47, scope: !32)
!49 = !DILocalVariable(name: "A", arg: 5, scope: !32, file: !1, line: 52, type: !40)
!50 = !DILocation(line: 52, column: 25, scope: !32)
!51 = !DILocalVariable(name: "B", arg: 6, scope: !32, file: !1, line: 52, type: !40)
!52 = !DILocation(line: 52, column: 47, scope: !32)
!53 = !DILocation(line: 58, column: 3, scope: !32)
!54 = !DILocalVariable(name: ".omp.iv", scope: !32, type: !39, flags: DIFlagArtificial)
!55 = !DILocalVariable(name: ".omp.comb.lb", scope: !32, type: !39, flags: DIFlagArtificial)
!56 = !DILocation(line: 58, column: 8, scope: !32)
!57 = !DILocalVariable(name: ".omp.comb.ub", scope: !32, type: !39, flags: DIFlagArtificial)
!58 = !DILocalVariable(name: ".omp.stride", scope: !32, type: !39, flags: DIFlagArtificial)
!59 = !DILocalVariable(name: ".omp.is_last", scope: !32, type: !39, flags: DIFlagArtificial)
!60 = !DILocalVariable(name: "i", scope: !32, type: !39, flags: DIFlagArtificial)
!61 = !DILocation(line: 57, column: 3, scope: !32)
!62 = !DILocation(line: 57, column: 44, scope: !63)
!63 = distinct !DILexicalBlock(scope: !32, file: !1, line: 57, column: 3)
!64 = distinct !{!64, !61, !65}
!65 = !DILocation(line: 57, column: 44, scope: !32)
!66 = !DILocation(line: 65, column: 3, scope: !32)
!67 = distinct !DISubprogram(name: "__omp_outlined___debug__1", scope: !1, file: !1, line: 58, type: !68, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{null, !35, !35, !70, !70, !40, !40, !40, !40}
!70 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !71)
!71 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!72 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !67, type: !35, flags: DIFlagArtificial)
!73 = !DILocation(line: 0, scope: !67)
!74 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !67, type: !35, flags: DIFlagArtificial)
!75 = !DILocalVariable(name: ".previous.lb.", arg: 3, scope: !67, type: !70, flags: DIFlagArtificial)
!76 = !DILocalVariable(name: ".previous.ub.", arg: 4, scope: !67, type: !70, flags: DIFlagArtificial)
!77 = !DILocalVariable(name: "C", arg: 5, scope: !67, file: !1, line: 53, type: !40)
!78 = !DILocation(line: 53, column: 25, scope: !67)
!79 = !DILocalVariable(name: "Cinit", arg: 6, scope: !67, file: !1, line: 53, type: !40)
!80 = !DILocation(line: 53, column: 47, scope: !67)
!81 = !DILocalVariable(name: "A", arg: 7, scope: !67, file: !1, line: 52, type: !40)
!82 = !DILocation(line: 52, column: 25, scope: !67)
!83 = !DILocalVariable(name: "B", arg: 8, scope: !67, file: !1, line: 52, type: !40)
!84 = !DILocation(line: 52, column: 47, scope: !67)
!85 = !DILocation(line: 58, column: 3, scope: !67)
!86 = !DILocalVariable(name: ".omp.iv", scope: !67, type: !39, flags: DIFlagArtificial)
!87 = !DILocalVariable(name: ".omp.lb", scope: !67, type: !39, flags: DIFlagArtificial)
!88 = !DILocation(line: 58, column: 8, scope: !67)
!89 = !DILocalVariable(name: ".omp.ub", scope: !67, type: !39, flags: DIFlagArtificial)
!90 = !DILocalVariable(name: ".omp.stride", scope: !67, type: !39, flags: DIFlagArtificial)
!91 = !DILocalVariable(name: ".omp.is_last", scope: !67, type: !39, flags: DIFlagArtificial)
!92 = !DILocalVariable(name: "i", scope: !67, type: !39, flags: DIFlagArtificial)
!93 = !DILocation(line: 57, column: 3, scope: !67)
!94 = !DILocation(line: 58, column: 27, scope: !67)
!95 = !DILocalVariable(name: "j", scope: !96, file: !1, line: 59, type: !39)
!96 = distinct !DILexicalBlock(scope: !97, file: !1, line: 59, column: 5)
!97 = distinct !DILexicalBlock(scope: !67, file: !1, line: 58, column: 32)
!98 = !DILocation(line: 59, column: 14, scope: !96)
!99 = !DILocation(line: 59, column: 10, scope: !96)
!100 = !DILocation(line: 59, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !1, line: 59, column: 5)
!102 = !DILocation(line: 59, column: 23, scope: !101)
!103 = !DILocation(line: 59, column: 5, scope: !96)
!104 = !DILocation(line: 60, column: 23, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !1, line: 59, column: 34)
!106 = !DILocation(line: 60, column: 29, scope: !105)
!107 = !DILocation(line: 60, column: 31, scope: !105)
!108 = !DILocation(line: 60, column: 38, scope: !105)
!109 = !DILocation(line: 60, column: 36, scope: !105)
!110 = !DILocation(line: 60, column: 41, scope: !105)
!111 = !DILocation(line: 60, column: 7, scope: !105)
!112 = !DILocation(line: 60, column: 9, scope: !105)
!113 = !DILocation(line: 60, column: 11, scope: !105)
!114 = !DILocation(line: 60, column: 18, scope: !105)
!115 = !DILocation(line: 60, column: 16, scope: !105)
!116 = !DILocation(line: 60, column: 21, scope: !105)
!117 = !DILocalVariable(name: "k", scope: !118, file: !1, line: 61, type: !39)
!118 = distinct !DILexicalBlock(scope: !105, file: !1, line: 61, column: 7)
!119 = !DILocation(line: 61, column: 16, scope: !118)
!120 = !DILocation(line: 61, column: 12, scope: !118)
!121 = !DILocation(line: 61, column: 23, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !1, line: 61, column: 7)
!123 = !DILocation(line: 61, column: 25, scope: !122)
!124 = !DILocation(line: 61, column: 7, scope: !118)
!125 = !DILocation(line: 62, column: 34, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !1, line: 61, column: 36)
!127 = !DILocation(line: 62, column: 36, scope: !126)
!128 = !DILocation(line: 62, column: 38, scope: !126)
!129 = !DILocation(line: 62, column: 45, scope: !126)
!130 = !DILocation(line: 62, column: 43, scope: !126)
!131 = !DILocation(line: 62, column: 32, scope: !126)
!132 = !DILocation(line: 62, column: 50, scope: !126)
!133 = !DILocation(line: 62, column: 52, scope: !126)
!134 = !DILocation(line: 62, column: 54, scope: !126)
!135 = !DILocation(line: 62, column: 61, scope: !126)
!136 = !DILocation(line: 62, column: 59, scope: !126)
!137 = !DILocation(line: 62, column: 48, scope: !126)
!138 = !DILocation(line: 62, column: 9, scope: !126)
!139 = !DILocation(line: 62, column: 11, scope: !126)
!140 = !DILocation(line: 62, column: 13, scope: !126)
!141 = !DILocation(line: 62, column: 20, scope: !126)
!142 = !DILocation(line: 62, column: 18, scope: !126)
!143 = !DILocation(line: 62, column: 23, scope: !126)
!144 = !DILocation(line: 63, column: 7, scope: !126)
!145 = !DILocation(line: 61, column: 31, scope: !122)
!146 = !DILocation(line: 61, column: 7, scope: !122)
!147 = distinct !{!147, !124, !148, !149}
!148 = !DILocation(line: 63, column: 7, scope: !118)
!149 = !{!"llvm.loop.mustprogress"}
!150 = !DILocation(line: 64, column: 5, scope: !105)
!151 = !DILocation(line: 59, column: 30, scope: !101)
!152 = !DILocation(line: 59, column: 5, scope: !101)
!153 = distinct !{!153, !103, !154, !149}
!154 = !DILocation(line: 64, column: 5, scope: !96)
!155 = !DILocation(line: 65, column: 3, scope: !97)
!156 = distinct !{!156, !93, !157}
!157 = !DILocation(line: 57, column: 44, scope: !67)
!158 = !DILocation(line: 65, column: 3, scope: !67)
!159 = distinct !DISubprogram(name: "__omp_outlined__", scope: !1, file: !1, line: 57, type: !160, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!160 = !DISubroutineType(types: !161)
!161 = !{null, !35, !35, !70, !70, !162, !162, !162, !162}
!162 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !16, size: 64)
!163 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !159, type: !35, flags: DIFlagArtificial)
!164 = !DILocation(line: 0, scope: !159)
!165 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !159, type: !35, flags: DIFlagArtificial)
!166 = !DILocalVariable(name: ".previous.lb.", arg: 3, scope: !159, type: !70, flags: DIFlagArtificial)
!167 = !DILocalVariable(name: ".previous.ub.", arg: 4, scope: !159, type: !70, flags: DIFlagArtificial)
!168 = !DILocalVariable(name: "C", arg: 5, scope: !159, type: !162, flags: DIFlagArtificial)
!169 = !DILocalVariable(name: "Cinit", arg: 6, scope: !159, type: !162, flags: DIFlagArtificial)
!170 = !DILocalVariable(name: "A", arg: 7, scope: !159, type: !162, flags: DIFlagArtificial)
!171 = !DILocalVariable(name: "B", arg: 8, scope: !159, type: !162, flags: DIFlagArtificial)
!172 = !DILocation(line: 57, column: 3, scope: !159)
!173 = distinct !DISubprogram(name: "__omp_outlined__2", scope: !1, file: !1, line: 57, type: !174, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!174 = !DISubroutineType(types: !175)
!175 = !{null, !35, !35, !162, !162, !162, !162}
!176 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !173, type: !35, flags: DIFlagArtificial)
!177 = !DILocation(line: 0, scope: !173)
!178 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !173, type: !35, flags: DIFlagArtificial)
!179 = !DILocalVariable(name: "C", arg: 3, scope: !173, type: !162, flags: DIFlagArtificial)
!180 = !DILocalVariable(name: "Cinit", arg: 4, scope: !173, type: !162, flags: DIFlagArtificial)
!181 = !DILocalVariable(name: "A", arg: 5, scope: !173, type: !162, flags: DIFlagArtificial)
!182 = !DILocalVariable(name: "B", arg: 6, scope: !173, type: !162, flags: DIFlagArtificial)
!183 = !DILocation(line: 57, column: 3, scope: !173)
!184 = distinct !DISubprogram(name: "__omp_offloading_32_84dffef_gemm_OMP_l56", scope: !1, file: !1, line: 56, type: !14, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!185 = !DILocalVariable(name: "C", arg: 1, scope: !184, type: !16, flags: DIFlagArtificial)
!186 = !DILocation(line: 0, scope: !184)
!187 = !DILocalVariable(name: "Cinit", arg: 2, scope: !184, type: !16, flags: DIFlagArtificial)
!188 = !DILocalVariable(name: "A", arg: 3, scope: !184, type: !16, flags: DIFlagArtificial)
!189 = !DILocalVariable(name: "B", arg: 4, scope: !184, type: !16, flags: DIFlagArtificial)
!190 = !DILocation(line: 56, column: 3, scope: !184)

; __CLANG_OFFLOAD_BUNDLE____END__ openmp-nvptx64

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = '/tmp/gemm-a3fafd.bc'
source_filename = "src/gemm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__tgt_offload_entry = type { i8*, i8*, i64, i32, i32 }
%struct.timezone = type { i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@0 = private unnamed_addr constant [28 x i8] c";src/gemm.c;gemm_OMP;57;3;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2050, i32 0, i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0) }, align 8
@3 = private unnamed_addr constant [29 x i8] c";src/gemm.c;gemm_OMP;57;44;;\00", align 1
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2050, i32 0, i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @3, i32 0, i32 0) }, align 8
@5 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0) }, align 8
@.__omp_offloading_32_84dffef_gemm_OMP_l56.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [4 x i64] [i64 40000, i64 40000, i64 40000, i64 40000]
@.offload_maptypes = private unnamed_addr constant [4 x i64] [i64 34, i64 33, i64 33, i64 33]
@6 = private unnamed_addr constant [35 x i8] c";C[0:100 * 100];src/gemm.c;53;25;;\00", align 1
@7 = private unnamed_addr constant [39 x i8] c";Cinit[0:100 * 100];src/gemm.c;53;47;;\00", align 1
@8 = private unnamed_addr constant [35 x i8] c";A[0:100 * 100];src/gemm.c;52;25;;\00", align 1
@9 = private unnamed_addr constant [35 x i8] c";B[0:100 * 100];src/gemm.c;52;47;;\00", align 1
@.offload_mapnames = private constant [4 x i8*] [i8* getelementptr inbounds ([35 x i8], [35 x i8]* @6, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @7, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @8, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @9, i32 0, i32 0)]
@10 = private unnamed_addr constant [28 x i8] c";src/gemm.c;gemm_OMP;56;3;;\00", align 1
@11 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @10, i32 0, i32 0) }, align 8
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [11 x i8] c"%f != %f \0A\00", align 1
@.str.4 = private unnamed_addr constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@.omp_offloading.entry_name = internal unnamed_addr constant [41 x i8] c"__omp_offloading_32_84dffef_gemm_OMP_l56\00"
@.omp_offloading.entry.__omp_offloading_32_84dffef_gemm_OMP_l56 = weak constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_32_84dffef_gemm_OMP_l56.region_id, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.omp_offloading.entry_name, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @.omp_offloading.requires_reg, i8* null }]

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @rtclock() #0 !dbg !14 {
entry:
  %Tzp = alloca %struct.timezone, align 4
  %Tp = alloca %struct.timeval, align 8
  %stat = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.timezone* %Tzp, metadata !19, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct.timeval* %Tp, metadata !27, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %stat, metadata !38, metadata !DIExpression()), !dbg !39
  %call = call i32 @gettimeofday(%struct.timeval* %Tp, %struct.timezone* %Tzp) #5, !dbg !40
  store i32 %call, i32* %stat, align 4, !dbg !41
  %0 = load i32, i32* %stat, align 4, !dbg !42
  %cmp = icmp ne i32 %0, 0, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %stat, align 4, !dbg !46
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !47
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i32 0, i32 0, !dbg !48
  %2 = load i64, i64* %tv_sec, align 8, !dbg !48
  %conv = sitofp i64 %2 to double, !dbg !49
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i32 0, i32 1, !dbg !50
  %3 = load i64, i64* %tv_usec, align 8, !dbg !50
  %conv2 = sitofp i64 %3 to double, !dbg !51
  %mul = fmul double %conv2, 0x3EB0C6F7A0B5ED8D, !dbg !52
  %add = fadd double %conv, %mul, !dbg !53
  ret double %add, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @absVal(float %a) #0 !dbg !55 {
entry:
  %retval = alloca float, align 4
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  call void @llvm.dbg.declare(metadata float* %a.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = load float, float* %a.addr, align 4, !dbg !60
  %cmp = fcmp olt float %0, 0.000000e+00, !dbg !62
  br i1 %cmp, label %if.then, label %if.else, !dbg !63

if.then:                                          ; preds = %entry
  %1 = load float, float* %a.addr, align 4, !dbg !64
  %mul = fmul float %1, -1.000000e+00, !dbg !66
  store float %mul, float* %retval, align 4, !dbg !67
  br label %return, !dbg !67

if.else:                                          ; preds = %entry
  %2 = load float, float* %a.addr, align 4, !dbg !68
  store float %2, float* %retval, align 4, !dbg !70
  br label %return, !dbg !70

return:                                           ; preds = %if.else, %if.then
  %3 = load float, float* %retval, align 4, !dbg !71
  ret float %3, !dbg !71
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @percentDiff(double %val1, double %val2) #0 !dbg !72 {
entry:
  %retval = alloca float, align 4
  %val1.addr = alloca double, align 8
  %val2.addr = alloca double, align 8
  store double %val1, double* %val1.addr, align 8
  call void @llvm.dbg.declare(metadata double* %val1.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store double %val2, double* %val2.addr, align 8
  call void @llvm.dbg.declare(metadata double* %val2.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load double, double* %val1.addr, align 8, !dbg !79
  %conv = fptrunc double %0 to float, !dbg !79
  %call = call float @absVal(float %conv), !dbg !81
  %conv1 = fpext float %call to double, !dbg !81
  %cmp = fcmp olt double %conv1, 1.000000e-02, !dbg !82
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !83

land.lhs.true:                                    ; preds = %entry
  %1 = load double, double* %val2.addr, align 8, !dbg !84
  %conv3 = fptrunc double %1 to float, !dbg !84
  %call4 = call float @absVal(float %conv3), !dbg !85
  %conv5 = fpext float %call4 to double, !dbg !85
  %cmp6 = fcmp olt double %conv5, 1.000000e-02, !dbg !86
  br i1 %cmp6, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %land.lhs.true
  store float 0.000000e+00, float* %retval, align 4, !dbg !88
  br label %return, !dbg !88

if.else:                                          ; preds = %land.lhs.true, %entry
  %2 = load double, double* %val1.addr, align 8, !dbg !90
  %3 = load double, double* %val2.addr, align 8, !dbg !92
  %sub = fsub double %2, %3, !dbg !93
  %conv8 = fptrunc double %sub to float, !dbg !90
  %call9 = call float @absVal(float %conv8), !dbg !94
  %4 = load double, double* %val1.addr, align 8, !dbg !95
  %add = fadd double %4, 0x3E45798EE0000000, !dbg !96
  %conv10 = fptrunc double %add to float, !dbg !95
  %call11 = call float @absVal(float %conv10), !dbg !97
  %div = fdiv float %call9, %call11, !dbg !98
  %call12 = call float @absVal(float %div), !dbg !99
  %mul = fmul float 1.000000e+02, %call12, !dbg !100
  store float %mul, float* %retval, align 4, !dbg !101
  br label %return, !dbg !101

return:                                           ; preds = %if.else, %if.then
  %5 = load float, float* %retval, align 4, !dbg !102
  ret float %5, !dbg !102
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @gemm(float* %A, float* %B, float* %C) #0 !dbg !103 {
entry:
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  %C.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %j, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %k, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 0, i32* %i, align 4, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc26, %entry
  %0 = load i32, i32* %i, align 4, !dbg !122
  %cmp = icmp slt i32 %0, 100, !dbg !124
  br i1 %cmp, label %for.body, label %for.end28, !dbg !125

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !126
  br label %for.cond1, !dbg !129

for.cond1:                                        ; preds = %for.inc23, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !130
  %cmp2 = icmp slt i32 %1, 100, !dbg !132
  br i1 %cmp2, label %for.body3, label %for.end25, !dbg !133

for.body3:                                        ; preds = %for.cond1
  %2 = load float*, float** %C.addr, align 8, !dbg !134
  %3 = load i32, i32* %i, align 4, !dbg !136
  %mul = mul nsw i32 %3, 100, !dbg !137
  %4 = load i32, i32* %j, align 4, !dbg !138
  %add = add nsw i32 %mul, %4, !dbg !139
  %idxprom = sext i32 %add to i64, !dbg !134
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom, !dbg !134
  %5 = load float, float* %arrayidx, align 4, !dbg !140
  %mul4 = fmul float %5, 2.123000e+03, !dbg !140
  store float %mul4, float* %arrayidx, align 4, !dbg !140
  store i32 0, i32* %k, align 4, !dbg !141
  br label %for.cond5, !dbg !143

for.cond5:                                        ; preds = %for.inc, %for.body3
  %6 = load i32, i32* %k, align 4, !dbg !144
  %cmp6 = icmp slt i32 %6, 100, !dbg !146
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !147

for.body7:                                        ; preds = %for.cond5
  %7 = load float*, float** %A.addr, align 8, !dbg !148
  %8 = load i32, i32* %i, align 4, !dbg !150
  %mul8 = mul nsw i32 %8, 100, !dbg !151
  %9 = load i32, i32* %k, align 4, !dbg !152
  %add9 = add nsw i32 %mul8, %9, !dbg !153
  %idxprom10 = sext i32 %add9 to i64, !dbg !148
  %arrayidx11 = getelementptr inbounds float, float* %7, i64 %idxprom10, !dbg !148
  %10 = load float, float* %arrayidx11, align 4, !dbg !148
  %mul12 = fmul float 3.241200e+04, %10, !dbg !154
  %11 = load float*, float** %B.addr, align 8, !dbg !155
  %12 = load i32, i32* %k, align 4, !dbg !156
  %mul13 = mul nsw i32 %12, 100, !dbg !157
  %13 = load i32, i32* %j, align 4, !dbg !158
  %add14 = add nsw i32 %mul13, %13, !dbg !159
  %idxprom15 = sext i32 %add14 to i64, !dbg !155
  %arrayidx16 = getelementptr inbounds float, float* %11, i64 %idxprom15, !dbg !155
  %14 = load float, float* %arrayidx16, align 4, !dbg !155
  %mul17 = fmul float %mul12, %14, !dbg !160
  %15 = load float*, float** %C.addr, align 8, !dbg !161
  %16 = load i32, i32* %i, align 4, !dbg !162
  %mul18 = mul nsw i32 %16, 100, !dbg !163
  %17 = load i32, i32* %j, align 4, !dbg !164
  %add19 = add nsw i32 %mul18, %17, !dbg !165
  %idxprom20 = sext i32 %add19 to i64, !dbg !161
  %arrayidx21 = getelementptr inbounds float, float* %15, i64 %idxprom20, !dbg !161
  %18 = load float, float* %arrayidx21, align 4, !dbg !166
  %add22 = fadd float %18, %mul17, !dbg !166
  store float %add22, float* %arrayidx21, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body7
  %19 = load i32, i32* %k, align 4, !dbg !168
  %inc = add nsw i32 %19, 1, !dbg !168
  store i32 %inc, i32* %k, align 4, !dbg !168
  br label %for.cond5, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond5
  br label %for.inc23, !dbg !173

for.inc23:                                        ; preds = %for.end
  %20 = load i32, i32* %j, align 4, !dbg !174
  %inc24 = add nsw i32 %20, 1, !dbg !174
  store i32 %inc24, i32* %j, align 4, !dbg !174
  br label %for.cond1, !dbg !175, !llvm.loop !176

for.end25:                                        ; preds = %for.cond1
  br label %for.inc26, !dbg !178

for.inc26:                                        ; preds = %for.end25
  %21 = load i32, i32* %i, align 4, !dbg !179
  %inc27 = add nsw i32 %21, 1, !dbg !179
  store i32 %inc27, i32* %i, align 4, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end28:                                        ; preds = %for.cond
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @gemm_OMP(float* %A, float* %B, float* %C, float* %Cinit) #0 !dbg !184 {
entry:
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %.offload_baseptrs = alloca [4 x i8*], align 8
  %.offload_ptrs = alloca [4 x i8*], align 8
  %.offload_mappers = alloca [4 x i8*], align 8
  %tmp = alloca i32, align 4
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !187, metadata !DIExpression()), !dbg !188
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !189, metadata !DIExpression()), !dbg !190
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !191, metadata !DIExpression()), !dbg !192
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !193, metadata !DIExpression()), !dbg !194
  %0 = load float*, float** %C.addr, align 8, !dbg !195
  %1 = load float*, float** %Cinit.addr, align 8, !dbg !195
  %2 = load float*, float** %A.addr, align 8, !dbg !195
  %3 = load float*, float** %B.addr, align 8, !dbg !195
  %4 = load float*, float** %C.addr, align 8, !dbg !195
  %5 = load float*, float** %C.addr, align 8, !dbg !196
  %arrayidx = getelementptr inbounds float, float* %5, i64 0, !dbg !196
  %6 = load float*, float** %Cinit.addr, align 8, !dbg !195
  %7 = load float*, float** %Cinit.addr, align 8, !dbg !198
  %arrayidx1 = getelementptr inbounds float, float* %7, i64 0, !dbg !198
  %8 = load float*, float** %A.addr, align 8, !dbg !195
  %9 = load float*, float** %A.addr, align 8, !dbg !199
  %arrayidx2 = getelementptr inbounds float, float* %9, i64 0, !dbg !199
  %10 = load float*, float** %B.addr, align 8, !dbg !195
  %11 = load float*, float** %B.addr, align 8, !dbg !200
  %arrayidx3 = getelementptr inbounds float, float* %11, i64 0, !dbg !200
  %12 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 0, !dbg !195
  %13 = bitcast i8** %12 to float**, !dbg !195
  store float* %4, float** %13, align 8, !dbg !195
  %14 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 0, !dbg !195
  %15 = bitcast i8** %14 to float**, !dbg !195
  store float* %arrayidx, float** %15, align 8, !dbg !195
  %16 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_mappers, i64 0, i64 0, !dbg !195
  store i8* null, i8** %16, align 8, !dbg !195
  %17 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 1, !dbg !195
  %18 = bitcast i8** %17 to float**, !dbg !195
  store float* %6, float** %18, align 8, !dbg !195
  %19 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 1, !dbg !195
  %20 = bitcast i8** %19 to float**, !dbg !195
  store float* %arrayidx1, float** %20, align 8, !dbg !195
  %21 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_mappers, i64 0, i64 1, !dbg !195
  store i8* null, i8** %21, align 8, !dbg !195
  %22 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 2, !dbg !195
  %23 = bitcast i8** %22 to float**, !dbg !195
  store float* %8, float** %23, align 8, !dbg !195
  %24 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 2, !dbg !195
  %25 = bitcast i8** %24 to float**, !dbg !195
  store float* %arrayidx2, float** %25, align 8, !dbg !195
  %26 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_mappers, i64 0, i64 2, !dbg !195
  store i8* null, i8** %26, align 8, !dbg !195
  %27 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 3, !dbg !195
  %28 = bitcast i8** %27 to float**, !dbg !195
  store float* %10, float** %28, align 8, !dbg !195
  %29 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 3, !dbg !195
  %30 = bitcast i8** %29 to float**, !dbg !195
  store float* %arrayidx3, float** %30, align 8, !dbg !195
  %31 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_mappers, i64 0, i64 3, !dbg !195
  store i8* null, i8** %31, align 8, !dbg !195
  %32 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 0, !dbg !195
  %33 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 0, !dbg !195
  call void @__kmpc_push_target_tripcount_mapper(%struct.ident_t* @11, i64 -1, i64 100), !dbg !195
  %34 = call i32 @__tgt_target_teams_mapper(%struct.ident_t* @11, i64 -1, i8* @.__omp_offloading_32_84dffef_gemm_OMP_l56.region_id, i32 4, i8** %32, i8** %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @.offload_sizes, i32 0, i32 0), i64* getelementptr inbounds ([4 x i64], [4 x i64]* @.offload_maptypes, i32 0, i32 0), i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @.offload_mapnames, i32 0, i32 0), i8** null, i32 0, i32 0), !dbg !195
  %35 = icmp ne i32 %34, 0, !dbg !195
  br i1 %35, label %omp_offload.failed, label %omp_offload.cont, !dbg !195

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_32_84dffef_gemm_OMP_l56(float* %0, float* %1, float* %2, float* %3) #5, !dbg !201
  br label %omp_offload.cont, !dbg !195

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void, !dbg !202
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @__omp_offloading_32_84dffef_gemm_OMP_l56_debug__(float* %C, float* %Cinit, float* %A, float* %B) #4 !dbg !203 {
entry:
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !204, metadata !DIExpression()), !dbg !205
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !206, metadata !DIExpression()), !dbg !207
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !208, metadata !DIExpression()), !dbg !209
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !210, metadata !DIExpression()), !dbg !211
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_teams(%struct.ident_t* @5, i32 4, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, float**, float**, float**, float**)* @.omp_outlined..2 to void (i32*, i32*, ...)*), float** %C.addr, float** %Cinit.addr, float** %A.addr, float** %B.addr), !dbg !212
  ret void, !dbg !213
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined._debug__(i32* noalias %.global_tid., i32* noalias %.bound_tid., float** nonnull align 8 dereferenceable(8) %C, float** nonnull align 8 dereferenceable(8) %Cinit, float** nonnull align 8 dereferenceable(8) %A, float** nonnull align 8 dereferenceable(8) %B) #4 !dbg !214 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float**, align 8
  %Cinit.addr = alloca float**, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.comb.lb = alloca i32, align 4
  %.omp.comb.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !222, metadata !DIExpression()), !dbg !223
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !224, metadata !DIExpression()), !dbg !223
  store float** %C, float*** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %C.addr, metadata !225, metadata !DIExpression()), !dbg !226
  store float** %Cinit, float*** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %Cinit.addr, metadata !227, metadata !DIExpression()), !dbg !228
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !229, metadata !DIExpression()), !dbg !230
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !231, metadata !DIExpression()), !dbg !232
  %0 = load float**, float*** %C.addr, align 8, !dbg !233
  %1 = load float**, float*** %Cinit.addr, align 8, !dbg !233
  %2 = load float**, float*** %A.addr, align 8, !dbg !233
  %3 = load float**, float*** %B.addr, align 8, !dbg !233
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !234, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata i32* %.omp.comb.lb, metadata !235, metadata !DIExpression()), !dbg !223
  store i32 0, i32* %.omp.comb.lb, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata i32* %.omp.comb.ub, metadata !237, metadata !DIExpression()), !dbg !223
  store i32 99, i32* %.omp.comb.ub, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !238, metadata !DIExpression()), !dbg !223
  store i32 1, i32* %.omp.stride, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !239, metadata !DIExpression()), !dbg !223
  store i32 0, i32* %.omp.is_last, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata i32* %i, metadata !240, metadata !DIExpression()), !dbg !223
  %4 = load i32*, i32** %.global_tid..addr, align 8, !dbg !233
  %5 = load i32, i32* %4, align 4, !dbg !233
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %5, i32 92, i32* %.omp.is_last, i32* %.omp.comb.lb, i32* %.omp.comb.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !233
  %6 = load i32, i32* %.omp.comb.ub, align 4, !dbg !236
  %cmp = icmp sgt i32 %6, 99, !dbg !236
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !236

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !236

cond.false:                                       ; preds = %entry
  %7 = load i32, i32* %.omp.comb.ub, align 4, !dbg !236
  br label %cond.end, !dbg !236

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 99, %cond.true ], [ %7, %cond.false ], !dbg !236
  store i32 %cond, i32* %.omp.comb.ub, align 4, !dbg !236
  %8 = load i32, i32* %.omp.comb.lb, align 4, !dbg !236
  store i32 %8, i32* %.omp.iv, align 4, !dbg !236
  br label %omp.inner.for.cond, !dbg !233

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %9 = load i32, i32* %.omp.iv, align 4, !dbg !236
  %10 = load i32, i32* %.omp.comb.ub, align 4, !dbg !236
  %cmp1 = icmp sle i32 %9, %10, !dbg !233
  br i1 %cmp1, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !233

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %11 = load i32, i32* %.omp.comb.lb, align 4, !dbg !241
  %12 = zext i32 %11 to i64, !dbg !241
  %13 = load i32, i32* %.omp.comb.ub, align 4, !dbg !241
  %14 = zext i32 %13 to i64, !dbg !241
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @5, i32 6, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i64, i64, float**, float**, float**, float**)* @.omp_outlined. to void (i32*, i32*, ...)*), i64 %12, i64 %14, float** %0, float** %1, float** %2, float** %3), !dbg !241
  br label %omp.inner.for.inc, !dbg !242

omp.inner.for.inc:                                ; preds = %omp.inner.for.body
  %15 = load i32, i32* %.omp.iv, align 4, !dbg !236
  %16 = load i32, i32* %.omp.stride, align 4, !dbg !236
  %add = add nsw i32 %15, %16, !dbg !233
  store i32 %add, i32* %.omp.iv, align 4, !dbg !233
  br label %omp.inner.for.cond, !dbg !242, !llvm.loop !244

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !242

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @4, i32 %5), !dbg !245
  ret void, !dbg !246
}

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined._debug__.1(i32* noalias %.global_tid., i32* noalias %.bound_tid., i64 %.previous.lb., i64 %.previous.ub., float** nonnull align 8 dereferenceable(8) %C, float** nonnull align 8 dereferenceable(8) %Cinit, float** nonnull align 8 dereferenceable(8) %A, float** nonnull align 8 dereferenceable(8) %B) #4 !dbg !247 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %.previous.lb..addr = alloca i64, align 8
  %.previous.ub..addr = alloca i64, align 8
  %C.addr = alloca float**, align 8
  %Cinit.addr = alloca float**, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !252, metadata !DIExpression()), !dbg !253
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !254, metadata !DIExpression()), !dbg !253
  store i64 %.previous.lb., i64* %.previous.lb..addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.previous.lb..addr, metadata !255, metadata !DIExpression()), !dbg !253
  store i64 %.previous.ub., i64* %.previous.ub..addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.previous.ub..addr, metadata !256, metadata !DIExpression()), !dbg !253
  store float** %C, float*** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %C.addr, metadata !257, metadata !DIExpression()), !dbg !258
  store float** %Cinit, float*** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %Cinit.addr, metadata !259, metadata !DIExpression()), !dbg !260
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !261, metadata !DIExpression()), !dbg !262
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !263, metadata !DIExpression()), !dbg !264
  %0 = load float**, float*** %C.addr, align 8, !dbg !265
  %1 = load float**, float*** %Cinit.addr, align 8, !dbg !265
  %2 = load float**, float*** %A.addr, align 8, !dbg !265
  %3 = load float**, float*** %B.addr, align 8, !dbg !265
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !266, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !267, metadata !DIExpression()), !dbg !253
  store i32 0, i32* %.omp.lb, align 4, !dbg !268
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !269, metadata !DIExpression()), !dbg !253
  store i32 99, i32* %.omp.ub, align 4, !dbg !268
  %4 = load i64, i64* %.previous.lb..addr, align 8, !dbg !265
  %conv = trunc i64 %4 to i32, !dbg !265
  %5 = load i64, i64* %.previous.ub..addr, align 8, !dbg !265
  %conv1 = trunc i64 %5 to i32, !dbg !265
  store i32 %conv, i32* %.omp.lb, align 4, !dbg !265
  store i32 %conv1, i32* %.omp.ub, align 4, !dbg !265
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !270, metadata !DIExpression()), !dbg !253
  store i32 1, i32* %.omp.stride, align 4, !dbg !268
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !271, metadata !DIExpression()), !dbg !253
  store i32 0, i32* %.omp.is_last, align 4, !dbg !268
  call void @llvm.dbg.declare(metadata i32* %i, metadata !272, metadata !DIExpression()), !dbg !253
  %6 = load i32*, i32** %.global_tid..addr, align 8, !dbg !265
  %7 = load i32, i32* %6, align 4, !dbg !265
  call void @__kmpc_for_static_init_4(%struct.ident_t* @2, i32 %7, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !273
  %8 = load i32, i32* %.omp.ub, align 4, !dbg !268
  %cmp = icmp sgt i32 %8, 99, !dbg !268
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !268

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !268

cond.false:                                       ; preds = %entry
  %9 = load i32, i32* %.omp.ub, align 4, !dbg !268
  br label %cond.end, !dbg !268

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 99, %cond.true ], [ %9, %cond.false ], !dbg !268
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !268
  %10 = load i32, i32* %.omp.lb, align 4, !dbg !268
  store i32 %10, i32* %.omp.iv, align 4, !dbg !268
  br label %omp.inner.for.cond, !dbg !265

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %11 = load i32, i32* %.omp.iv, align 4, !dbg !268
  %12 = load i32, i32* %.omp.ub, align 4, !dbg !268
  %cmp3 = icmp sle i32 %11, %12, !dbg !265
  br i1 %cmp3, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !265

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %13 = load i32, i32* %.omp.iv, align 4, !dbg !268
  %mul = mul nsw i32 %13, 1, !dbg !274
  %add = add nsw i32 0, %mul, !dbg !274
  store i32 %add, i32* %i, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i32* %j, metadata !275, metadata !DIExpression()), !dbg !278
  store i32 0, i32* %j, align 4, !dbg !278
  br label %for.cond, !dbg !279

for.cond:                                         ; preds = %for.inc33, %omp.inner.for.body
  %14 = load i32, i32* %j, align 4, !dbg !280
  %cmp5 = icmp slt i32 %14, 100, !dbg !282
  br i1 %cmp5, label %for.body, label %for.end35, !dbg !283

for.body:                                         ; preds = %for.cond
  %15 = load float*, float** %1, align 8, !dbg !284
  %16 = load i32, i32* %i, align 4, !dbg !286
  %mul7 = mul nsw i32 %16, 100, !dbg !287
  %17 = load i32, i32* %j, align 4, !dbg !288
  %add8 = add nsw i32 %mul7, %17, !dbg !289
  %idxprom = sext i32 %add8 to i64, !dbg !284
  %arrayidx = getelementptr inbounds float, float* %15, i64 %idxprom, !dbg !284
  %18 = load float, float* %arrayidx, align 4, !dbg !284
  %mul9 = fmul float %18, 2.123000e+03, !dbg !290
  %19 = load float*, float** %0, align 8, !dbg !291
  %20 = load i32, i32* %i, align 4, !dbg !292
  %mul10 = mul nsw i32 %20, 100, !dbg !293
  %21 = load i32, i32* %j, align 4, !dbg !294
  %add11 = add nsw i32 %mul10, %21, !dbg !295
  %idxprom12 = sext i32 %add11 to i64, !dbg !291
  %arrayidx13 = getelementptr inbounds float, float* %19, i64 %idxprom12, !dbg !291
  store float %mul9, float* %arrayidx13, align 4, !dbg !296
  call void @llvm.dbg.declare(metadata i32* %k, metadata !297, metadata !DIExpression()), !dbg !299
  store i32 0, i32* %k, align 4, !dbg !299
  br label %for.cond14, !dbg !300

for.cond14:                                       ; preds = %for.inc, %for.body
  %22 = load i32, i32* %k, align 4, !dbg !301
  %cmp15 = icmp slt i32 %22, 100, !dbg !303
  br i1 %cmp15, label %for.body17, label %for.end, !dbg !304

for.body17:                                       ; preds = %for.cond14
  %23 = load float*, float** %2, align 8, !dbg !305
  %24 = load i32, i32* %i, align 4, !dbg !307
  %mul18 = mul nsw i32 %24, 100, !dbg !308
  %25 = load i32, i32* %k, align 4, !dbg !309
  %add19 = add nsw i32 %mul18, %25, !dbg !310
  %idxprom20 = sext i32 %add19 to i64, !dbg !305
  %arrayidx21 = getelementptr inbounds float, float* %23, i64 %idxprom20, !dbg !305
  %26 = load float, float* %arrayidx21, align 4, !dbg !305
  %mul22 = fmul float 3.241200e+04, %26, !dbg !311
  %27 = load float*, float** %3, align 8, !dbg !312
  %28 = load i32, i32* %k, align 4, !dbg !313
  %mul23 = mul nsw i32 %28, 100, !dbg !314
  %29 = load i32, i32* %j, align 4, !dbg !315
  %add24 = add nsw i32 %mul23, %29, !dbg !316
  %idxprom25 = sext i32 %add24 to i64, !dbg !312
  %arrayidx26 = getelementptr inbounds float, float* %27, i64 %idxprom25, !dbg !312
  %30 = load float, float* %arrayidx26, align 4, !dbg !312
  %mul27 = fmul float %mul22, %30, !dbg !317
  %31 = load float*, float** %0, align 8, !dbg !318
  %32 = load i32, i32* %i, align 4, !dbg !319
  %mul28 = mul nsw i32 %32, 100, !dbg !320
  %33 = load i32, i32* %j, align 4, !dbg !321
  %add29 = add nsw i32 %mul28, %33, !dbg !322
  %idxprom30 = sext i32 %add29 to i64, !dbg !318
  %arrayidx31 = getelementptr inbounds float, float* %31, i64 %idxprom30, !dbg !318
  %34 = load float, float* %arrayidx31, align 4, !dbg !323
  %add32 = fadd float %34, %mul27, !dbg !323
  store float %add32, float* %arrayidx31, align 4, !dbg !323
  br label %for.inc, !dbg !324

for.inc:                                          ; preds = %for.body17
  %35 = load i32, i32* %k, align 4, !dbg !325
  %inc = add nsw i32 %35, 1, !dbg !325
  store i32 %inc, i32* %k, align 4, !dbg !325
  br label %for.cond14, !dbg !326, !llvm.loop !327

for.end:                                          ; preds = %for.cond14
  br label %for.inc33, !dbg !329

for.inc33:                                        ; preds = %for.end
  %36 = load i32, i32* %j, align 4, !dbg !330
  %inc34 = add nsw i32 %36, 1, !dbg !330
  store i32 %inc34, i32* %j, align 4, !dbg !330
  br label %for.cond, !dbg !331, !llvm.loop !332

for.end35:                                        ; preds = %for.cond
  br label %omp.body.continue, !dbg !334

omp.body.continue:                                ; preds = %for.end35
  br label %omp.inner.for.inc, !dbg !273

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %37 = load i32, i32* %.omp.iv, align 4, !dbg !268
  %add36 = add nsw i32 %37, 1, !dbg !265
  store i32 %add36, i32* %.omp.iv, align 4, !dbg !265
  br label %omp.inner.for.cond, !dbg !273, !llvm.loop !335

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !273

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @4, i32 %7), !dbg !336
  ret void, !dbg !337
}

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) #5

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i64 %.previous.lb., i64 %.previous.ub., float** nonnull align 8 dereferenceable(8) %C, float** nonnull align 8 dereferenceable(8) %Cinit, float** nonnull align 8 dereferenceable(8) %A, float** nonnull align 8 dereferenceable(8) %B) #4 !dbg !338 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %.previous.lb..addr = alloca i64, align 8
  %.previous.ub..addr = alloca i64, align 8
  %C.addr = alloca float**, align 8
  %Cinit.addr = alloca float**, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !339, metadata !DIExpression()), !dbg !340
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !341, metadata !DIExpression()), !dbg !340
  store i64 %.previous.lb., i64* %.previous.lb..addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.previous.lb..addr, metadata !342, metadata !DIExpression()), !dbg !340
  store i64 %.previous.ub., i64* %.previous.ub..addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.previous.ub..addr, metadata !343, metadata !DIExpression()), !dbg !340
  store float** %C, float*** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %C.addr, metadata !344, metadata !DIExpression()), !dbg !340
  store float** %Cinit, float*** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %Cinit.addr, metadata !345, metadata !DIExpression()), !dbg !340
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !346, metadata !DIExpression()), !dbg !340
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !347, metadata !DIExpression()), !dbg !340
  %0 = load float**, float*** %C.addr, align 8, !dbg !348
  %1 = load float**, float*** %Cinit.addr, align 8, !dbg !348
  %2 = load float**, float*** %A.addr, align 8, !dbg !348
  %3 = load float**, float*** %B.addr, align 8, !dbg !348
  %4 = load i32*, i32** %.global_tid..addr, align 8, !dbg !348
  %5 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !348
  %6 = load i64, i64* %.previous.lb..addr, align 8, !dbg !348
  %7 = load i64, i64* %.previous.ub..addr, align 8, !dbg !348
  %8 = load float**, float*** %C.addr, align 8, !dbg !348
  %9 = load float**, float*** %Cinit.addr, align 8, !dbg !348
  %10 = load float**, float*** %A.addr, align 8, !dbg !348
  %11 = load float**, float*** %B.addr, align 8, !dbg !348
  call void @.omp_outlined._debug__.1(i32* %4, i32* %5, i64 %6, i64 %7, float** %8, float** %9, float** %10, float** %11) #5, !dbg !348
  ret void, !dbg !348
}

; Function Attrs: nounwind
declare !callback !349 void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) #5

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined..2(i32* noalias %.global_tid., i32* noalias %.bound_tid., float** nonnull align 8 dereferenceable(8) %C, float** nonnull align 8 dereferenceable(8) %Cinit, float** nonnull align 8 dereferenceable(8) %A, float** nonnull align 8 dereferenceable(8) %B) #4 !dbg !351 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float**, align 8
  %Cinit.addr = alloca float**, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !352, metadata !DIExpression()), !dbg !353
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !354, metadata !DIExpression()), !dbg !353
  store float** %C, float*** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %C.addr, metadata !355, metadata !DIExpression()), !dbg !353
  store float** %Cinit, float*** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %Cinit.addr, metadata !356, metadata !DIExpression()), !dbg !353
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !357, metadata !DIExpression()), !dbg !353
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !358, metadata !DIExpression()), !dbg !353
  %0 = load float**, float*** %C.addr, align 8, !dbg !359
  %1 = load float**, float*** %Cinit.addr, align 8, !dbg !359
  %2 = load float**, float*** %A.addr, align 8, !dbg !359
  %3 = load float**, float*** %B.addr, align 8, !dbg !359
  %4 = load i32*, i32** %.global_tid..addr, align 8, !dbg !359
  %5 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !359
  %6 = load float**, float*** %C.addr, align 8, !dbg !359
  %7 = load float**, float*** %Cinit.addr, align 8, !dbg !359
  %8 = load float**, float*** %A.addr, align 8, !dbg !359
  %9 = load float**, float*** %B.addr, align 8, !dbg !359
  call void @.omp_outlined._debug__(i32* %4, i32* %5, float** %6, float** %7, float** %8, float** %9) #5, !dbg !359
  ret void, !dbg !359
}

; Function Attrs: nounwind
declare !callback !349 void @__kmpc_fork_teams(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) #5

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @__omp_offloading_32_84dffef_gemm_OMP_l56(float* %C, float* %Cinit, float* %A, float* %B) #4 !dbg !360 {
entry:
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !361, metadata !DIExpression()), !dbg !362
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !363, metadata !DIExpression()), !dbg !362
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !364, metadata !DIExpression()), !dbg !362
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !365, metadata !DIExpression()), !dbg !362
  %0 = load float*, float** %C.addr, align 8, !dbg !366
  %1 = load float*, float** %Cinit.addr, align 8, !dbg !366
  %2 = load float*, float** %A.addr, align 8, !dbg !366
  %3 = load float*, float** %B.addr, align 8, !dbg !366
  call void @__omp_offloading_32_84dffef_gemm_OMP_l56_debug__(float* %0, float* %1, float* %2, float* %3) #5, !dbg !366
  ret void, !dbg !366
}

; Function Attrs: nounwind
declare void @__kmpc_push_target_tripcount_mapper(%struct.ident_t*, i64, i64) #5

; Function Attrs: nounwind
declare i32 @__tgt_target_teams_mapper(%struct.ident_t*, i64, i8*, i32, i8**, i8**, i64*, i64*, i8**, i8**, i32, i32) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @init(float* %A, float* %B, float* %C, float* %C_OMP) #0 !dbg !367 {
entry:
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  %C.addr = alloca float*, align 8
  %C_OMP.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !368, metadata !DIExpression()), !dbg !369
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !370, metadata !DIExpression()), !dbg !371
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !372, metadata !DIExpression()), !dbg !373
  store float* %C_OMP, float** %C_OMP.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C_OMP.addr, metadata !374, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.declare(metadata i32* %i, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata i32* %j, metadata !378, metadata !DIExpression()), !dbg !379
  store i32 0, i32* %i, align 4, !dbg !380
  br label %for.cond, !dbg !382

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !383
  %cmp = icmp slt i32 %0, 100, !dbg !385
  br i1 %cmp, label %for.body, label %for.end8, !dbg !386

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !387
  br label %for.cond1, !dbg !390

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !391
  %cmp2 = icmp slt i32 %1, 100, !dbg !393
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !394

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4, !dbg !395
  %conv = sitofp i32 %2 to float, !dbg !397
  %3 = load i32, i32* %j, align 4, !dbg !398
  %conv4 = sitofp i32 %3 to float, !dbg !398
  %mul = fmul float %conv, %conv4, !dbg !399
  %div = fdiv float %mul, 1.000000e+02, !dbg !400
  %4 = load float*, float** %A.addr, align 8, !dbg !401
  %5 = load i32, i32* %i, align 4, !dbg !402
  %mul5 = mul nsw i32 %5, 100, !dbg !403
  %6 = load i32, i32* %j, align 4, !dbg !404
  %add = add nsw i32 %mul5, %6, !dbg !405
  %idxprom = sext i32 %add to i64, !dbg !401
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !401
  store float %div, float* %arrayidx, align 4, !dbg !406
  br label %for.inc, !dbg !407

for.inc:                                          ; preds = %for.body3
  %7 = load i32, i32* %j, align 4, !dbg !408
  %inc = add nsw i32 %7, 1, !dbg !408
  store i32 %inc, i32* %j, align 4, !dbg !408
  br label %for.cond1, !dbg !409, !llvm.loop !410

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !412

for.inc6:                                         ; preds = %for.end
  %8 = load i32, i32* %i, align 4, !dbg !413
  %inc7 = add nsw i32 %8, 1, !dbg !413
  store i32 %inc7, i32* %i, align 4, !dbg !413
  br label %for.cond, !dbg !414, !llvm.loop !415

for.end8:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !417
  br label %for.cond9, !dbg !419

for.cond9:                                        ; preds = %for.inc29, %for.end8
  %9 = load i32, i32* %i, align 4, !dbg !420
  %cmp10 = icmp slt i32 %9, 100, !dbg !422
  br i1 %cmp10, label %for.body12, label %for.end31, !dbg !423

for.body12:                                       ; preds = %for.cond9
  store i32 0, i32* %j, align 4, !dbg !424
  br label %for.cond13, !dbg !427

for.cond13:                                       ; preds = %for.inc26, %for.body12
  %10 = load i32, i32* %j, align 4, !dbg !428
  %cmp14 = icmp slt i32 %10, 100, !dbg !430
  br i1 %cmp14, label %for.body16, label %for.end28, !dbg !431

for.body16:                                       ; preds = %for.cond13
  %11 = load i32, i32* %i, align 4, !dbg !432
  %conv17 = sitofp i32 %11 to float, !dbg !434
  %12 = load i32, i32* %j, align 4, !dbg !435
  %conv18 = sitofp i32 %12 to float, !dbg !435
  %mul19 = fmul float %conv17, %conv18, !dbg !436
  %add20 = fadd float %mul19, 1.000000e+00, !dbg !437
  %div21 = fdiv float %add20, 1.000000e+02, !dbg !438
  %13 = load float*, float** %B.addr, align 8, !dbg !439
  %14 = load i32, i32* %i, align 4, !dbg !440
  %mul22 = mul nsw i32 %14, 100, !dbg !441
  %15 = load i32, i32* %j, align 4, !dbg !442
  %add23 = add nsw i32 %mul22, %15, !dbg !443
  %idxprom24 = sext i32 %add23 to i64, !dbg !439
  %arrayidx25 = getelementptr inbounds float, float* %13, i64 %idxprom24, !dbg !439
  store float %div21, float* %arrayidx25, align 4, !dbg !444
  br label %for.inc26, !dbg !445

for.inc26:                                        ; preds = %for.body16
  %16 = load i32, i32* %j, align 4, !dbg !446
  %inc27 = add nsw i32 %16, 1, !dbg !446
  store i32 %inc27, i32* %j, align 4, !dbg !446
  br label %for.cond13, !dbg !447, !llvm.loop !448

for.end28:                                        ; preds = %for.cond13
  br label %for.inc29, !dbg !450

for.inc29:                                        ; preds = %for.end28
  %17 = load i32, i32* %i, align 4, !dbg !451
  %inc30 = add nsw i32 %17, 1, !dbg !451
  store i32 %inc30, i32* %i, align 4, !dbg !451
  br label %for.cond9, !dbg !452, !llvm.loop !453

for.end31:                                        ; preds = %for.cond9
  store i32 0, i32* %i, align 4, !dbg !455
  br label %for.cond32, !dbg !457

for.cond32:                                       ; preds = %for.inc61, %for.end31
  %18 = load i32, i32* %i, align 4, !dbg !458
  %cmp33 = icmp slt i32 %18, 100, !dbg !460
  br i1 %cmp33, label %for.body35, label %for.end63, !dbg !461

for.body35:                                       ; preds = %for.cond32
  store i32 0, i32* %j, align 4, !dbg !462
  br label %for.cond36, !dbg !465

for.cond36:                                       ; preds = %for.inc58, %for.body35
  %19 = load i32, i32* %j, align 4, !dbg !466
  %cmp37 = icmp slt i32 %19, 100, !dbg !468
  br i1 %cmp37, label %for.body39, label %for.end60, !dbg !469

for.body39:                                       ; preds = %for.cond36
  %20 = load i32, i32* %i, align 4, !dbg !470
  %conv40 = sitofp i32 %20 to float, !dbg !472
  %21 = load i32, i32* %j, align 4, !dbg !473
  %conv41 = sitofp i32 %21 to float, !dbg !473
  %mul42 = fmul float %conv40, %conv41, !dbg !474
  %add43 = fadd float %mul42, 2.000000e+00, !dbg !475
  %div44 = fdiv float %add43, 1.000000e+02, !dbg !476
  %22 = load float*, float** %C.addr, align 8, !dbg !477
  %23 = load i32, i32* %i, align 4, !dbg !478
  %mul45 = mul nsw i32 %23, 100, !dbg !479
  %24 = load i32, i32* %j, align 4, !dbg !480
  %add46 = add nsw i32 %mul45, %24, !dbg !481
  %idxprom47 = sext i32 %add46 to i64, !dbg !477
  %arrayidx48 = getelementptr inbounds float, float* %22, i64 %idxprom47, !dbg !477
  store float %div44, float* %arrayidx48, align 4, !dbg !482
  %25 = load i32, i32* %i, align 4, !dbg !483
  %conv49 = sitofp i32 %25 to float, !dbg !484
  %26 = load i32, i32* %j, align 4, !dbg !485
  %conv50 = sitofp i32 %26 to float, !dbg !485
  %mul51 = fmul float %conv49, %conv50, !dbg !486
  %add52 = fadd float %mul51, 2.000000e+00, !dbg !487
  %div53 = fdiv float %add52, 1.000000e+02, !dbg !488
  %27 = load float*, float** %C_OMP.addr, align 8, !dbg !489
  %28 = load i32, i32* %i, align 4, !dbg !490
  %mul54 = mul nsw i32 %28, 100, !dbg !491
  %29 = load i32, i32* %j, align 4, !dbg !492
  %add55 = add nsw i32 %mul54, %29, !dbg !493
  %idxprom56 = sext i32 %add55 to i64, !dbg !489
  %arrayidx57 = getelementptr inbounds float, float* %27, i64 %idxprom56, !dbg !489
  store float %div53, float* %arrayidx57, align 4, !dbg !494
  br label %for.inc58, !dbg !495

for.inc58:                                        ; preds = %for.body39
  %30 = load i32, i32* %j, align 4, !dbg !496
  %inc59 = add nsw i32 %30, 1, !dbg !496
  store i32 %inc59, i32* %j, align 4, !dbg !496
  br label %for.cond36, !dbg !497, !llvm.loop !498

for.end60:                                        ; preds = %for.cond36
  br label %for.inc61, !dbg !500

for.inc61:                                        ; preds = %for.end60
  %31 = load i32, i32* %i, align 4, !dbg !501
  %inc62 = add nsw i32 %31, 1, !dbg !501
  store i32 %inc62, i32* %i, align 4, !dbg !501
  br label %for.cond32, !dbg !502, !llvm.loop !503

for.end63:                                        ; preds = %for.cond32
  ret void, !dbg !505
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @compareResults(float* %C, float* %C_outputFromGpu) #0 !dbg !506 {
entry:
  %C.addr = alloca float*, align 8
  %C_outputFromGpu.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %fail = alloca i32, align 4
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !509, metadata !DIExpression()), !dbg !510
  store float* %C_outputFromGpu, float** %C_outputFromGpu.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C_outputFromGpu.addr, metadata !511, metadata !DIExpression()), !dbg !512
  call void @llvm.dbg.declare(metadata i32* %i, metadata !513, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.declare(metadata i32* %j, metadata !515, metadata !DIExpression()), !dbg !516
  call void @llvm.dbg.declare(metadata i32* %fail, metadata !517, metadata !DIExpression()), !dbg !518
  store i32 0, i32* %fail, align 4, !dbg !519
  store i32 0, i32* %i, align 4, !dbg !520
  br label %for.cond, !dbg !522

for.cond:                                         ; preds = %for.inc24, %entry
  %0 = load i32, i32* %i, align 4, !dbg !523
  %cmp = icmp slt i32 %0, 100, !dbg !525
  br i1 %cmp, label %for.body, label %for.end26, !dbg !526

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !527
  br label %for.cond1, !dbg !530

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !531
  %cmp2 = icmp slt i32 %1, 100, !dbg !533
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !534

for.body3:                                        ; preds = %for.cond1
  %2 = load float*, float** %C.addr, align 8, !dbg !535
  %3 = load i32, i32* %i, align 4, !dbg !538
  %mul = mul nsw i32 %3, 100, !dbg !539
  %4 = load i32, i32* %j, align 4, !dbg !540
  %add = add nsw i32 %mul, %4, !dbg !541
  %idxprom = sext i32 %add to i64, !dbg !535
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom, !dbg !535
  %5 = load float, float* %arrayidx, align 4, !dbg !535
  %conv = fpext float %5 to double, !dbg !535
  %6 = load float*, float** %C_outputFromGpu.addr, align 8, !dbg !542
  %7 = load i32, i32* %i, align 4, !dbg !543
  %mul4 = mul nsw i32 %7, 100, !dbg !544
  %8 = load i32, i32* %j, align 4, !dbg !545
  %add5 = add nsw i32 %mul4, %8, !dbg !546
  %idxprom6 = sext i32 %add5 to i64, !dbg !542
  %arrayidx7 = getelementptr inbounds float, float* %6, i64 %idxprom6, !dbg !542
  %9 = load float, float* %arrayidx7, align 4, !dbg !542
  %conv8 = fpext float %9 to double, !dbg !542
  %call = call float @percentDiff(double %conv, double %conv8), !dbg !547
  %conv9 = fpext float %call to double, !dbg !547
  %cmp10 = fcmp ogt double %conv9, 5.000000e-02, !dbg !548
  br i1 %cmp10, label %if.then, label %if.end, !dbg !549

if.then:                                          ; preds = %for.body3
  %10 = load i32, i32* %fail, align 4, !dbg !550
  %inc = add nsw i32 %10, 1, !dbg !550
  store i32 %inc, i32* %fail, align 4, !dbg !550
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !552
  %12 = load float*, float** %C.addr, align 8, !dbg !553
  %13 = load i32, i32* %i, align 4, !dbg !554
  %mul12 = mul nsw i32 %13, 100, !dbg !555
  %14 = load i32, i32* %j, align 4, !dbg !556
  %add13 = add nsw i32 %mul12, %14, !dbg !557
  %idxprom14 = sext i32 %add13 to i64, !dbg !553
  %arrayidx15 = getelementptr inbounds float, float* %12, i64 %idxprom14, !dbg !553
  %15 = load float, float* %arrayidx15, align 4, !dbg !553
  %conv16 = fpext float %15 to double, !dbg !553
  %16 = load float*, float** %C_outputFromGpu.addr, align 8, !dbg !558
  %17 = load i32, i32* %i, align 4, !dbg !559
  %mul17 = mul nsw i32 %17, 100, !dbg !560
  %18 = load i32, i32* %j, align 4, !dbg !561
  %add18 = add nsw i32 %mul17, %18, !dbg !562
  %idxprom19 = sext i32 %add18 to i64, !dbg !558
  %arrayidx20 = getelementptr inbounds float, float* %16, i64 %idxprom19, !dbg !558
  %19 = load float, float* %arrayidx20, align 4, !dbg !558
  %conv21 = fpext float %19 to double, !dbg !558
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), double %conv16, double %conv21), !dbg !563
  br label %if.end, !dbg !564

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !565

for.inc:                                          ; preds = %if.end
  %20 = load i32, i32* %j, align 4, !dbg !566
  %inc23 = add nsw i32 %20, 1, !dbg !566
  store i32 %inc23, i32* %j, align 4, !dbg !566
  br label %for.cond1, !dbg !567, !llvm.loop !568

for.end:                                          ; preds = %for.cond1
  br label %for.inc24, !dbg !570

for.inc24:                                        ; preds = %for.end
  %21 = load i32, i32* %i, align 4, !dbg !571
  %inc25 = add nsw i32 %21, 1, !dbg !571
  store i32 %inc25, i32* %i, align 4, !dbg !571
  br label %for.cond, !dbg !572, !llvm.loop !573

for.end26:                                        ; preds = %for.cond
  %22 = load i32, i32* %fail, align 4, !dbg !575
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.4, i64 0, i64 0), double 5.000000e-02, i32 %22), !dbg !576
  %23 = load i32, i32* %fail, align 4, !dbg !577
  ret i32 %23, !dbg !578
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !579 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %t_start = alloca double, align 8
  %t_end = alloca double, align 8
  %fail = alloca i32, align 4
  %A = alloca [10000 x float], align 16
  %B = alloca [10000 x float], align 16
  %C = alloca [10000 x float], align 16
  %C_outputFromGpu = alloca [10000 x float], align 16
  %Cinit_outputFromGpu = alloca [10000 x float], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !585, metadata !DIExpression()), !dbg !586
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !587, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.declare(metadata double* %t_start, metadata !589, metadata !DIExpression()), !dbg !590
  call void @llvm.dbg.declare(metadata double* %t_end, metadata !591, metadata !DIExpression()), !dbg !592
  call void @llvm.dbg.declare(metadata i32* %fail, metadata !593, metadata !DIExpression()), !dbg !594
  store i32 0, i32* %fail, align 4, !dbg !594
  call void @llvm.dbg.declare(metadata [10000 x float]* %A, metadata !595, metadata !DIExpression()), !dbg !599
  call void @llvm.dbg.declare(metadata [10000 x float]* %B, metadata !600, metadata !DIExpression()), !dbg !601
  call void @llvm.dbg.declare(metadata [10000 x float]* %C, metadata !602, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.declare(metadata [10000 x float]* %C_outputFromGpu, metadata !604, metadata !DIExpression()), !dbg !605
  call void @llvm.dbg.declare(metadata [10000 x float]* %Cinit_outputFromGpu, metadata !606, metadata !DIExpression()), !dbg !607
  %arraydecay = getelementptr inbounds [10000 x float], [10000 x float]* %A, i64 0, i64 0, !dbg !608
  %arraydecay1 = getelementptr inbounds [10000 x float], [10000 x float]* %B, i64 0, i64 0, !dbg !609
  %arraydecay2 = getelementptr inbounds [10000 x float], [10000 x float]* %C, i64 0, i64 0, !dbg !610
  %arraydecay3 = getelementptr inbounds [10000 x float], [10000 x float]* %Cinit_outputFromGpu, i64 0, i64 0, !dbg !611
  call void @init(float* %arraydecay, float* %arraydecay1, float* %arraydecay2, float* %arraydecay3), !dbg !612
  %arraydecay4 = getelementptr inbounds [10000 x float], [10000 x float]* %A, i64 0, i64 0, !dbg !613
  %arraydecay5 = getelementptr inbounds [10000 x float], [10000 x float]* %B, i64 0, i64 0, !dbg !614
  %arraydecay6 = getelementptr inbounds [10000 x float], [10000 x float]* %C_outputFromGpu, i64 0, i64 0, !dbg !615
  %arraydecay7 = getelementptr inbounds [10000 x float], [10000 x float]* %Cinit_outputFromGpu, i64 0, i64 0, !dbg !616
  call void @gemm_OMP(float* %arraydecay4, float* %arraydecay5, float* %arraydecay6, float* %arraydecay7), !dbg !617
  %0 = load i32, i32* %fail, align 4, !dbg !618
  ret i32 %0, !dbg !619
}

; Function Attrs: noinline nounwind uwtable
define internal void @.omp_offloading.requires_reg() #6 section ".text.startup" !dbg !620 {
entry:
  call void @__tgt_register_requires(i64 1)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_register_requires(i64) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!omp_offload.info = !{!6}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "src/gemm.c", directory: "/gpfs/jlse-fs0/users/dstfvrt/anl_jlse/gemm")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "DATA_TYPE", file: !1, line: 36, baseType: !5)
!5 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!6 = !{i32 0, i32 50, i32 139329519, !"gemm_OMP", i32 56, i32 0}
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"openmp", i32 50}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "rtclock", scope: !15, file: !15, line: 17, type: !16, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "include/BenchmarksUtil.h", directory: "/gpfs/jlse-fs0/users/dstfvrt/anl_jlse/gemm")
!16 = !DISubroutineType(types: !17)
!17 = !{!18}
!18 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!19 = !DILocalVariable(name: "Tzp", scope: !14, file: !15, line: 18, type: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !21, line: 52, size: 64, elements: !22)
!21 = !DIFile(filename: "/usr/include/sys/time.h", directory: "")
!22 = !{!23, !25}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !20, file: !21, line: 54, baseType: !24, size: 32)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !20, file: !21, line: 55, baseType: !24, size: 32, offset: 32)
!26 = !DILocation(line: 18, column: 19, scope: !14)
!27 = !DILocalVariable(name: "Tp", scope: !14, file: !15, line: 19, type: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !29, line: 8, size: 128, elements: !30)
!29 = !DIFile(filename: "/usr/include/bits/types/struct_timeval.h", directory: "")
!30 = !{!31, !35}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !28, file: !29, line: 10, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !33, line: 148, baseType: !34)
!33 = !DIFile(filename: "/usr/include/bits/types.h", directory: "")
!34 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !28, file: !29, line: 11, baseType: !36, size: 64, offset: 64)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !33, line: 150, baseType: !34)
!37 = !DILocation(line: 19, column: 18, scope: !14)
!38 = !DILocalVariable(name: "stat", scope: !14, file: !15, line: 20, type: !24)
!39 = !DILocation(line: 20, column: 7, scope: !14)
!40 = !DILocation(line: 21, column: 10, scope: !14)
!41 = !DILocation(line: 21, column: 8, scope: !14)
!42 = !DILocation(line: 22, column: 7, scope: !43)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 22, column: 7)
!44 = !DILocation(line: 22, column: 12, scope: !43)
!45 = !DILocation(line: 22, column: 7, scope: !14)
!46 = !DILocation(line: 23, column: 50, scope: !43)
!47 = !DILocation(line: 23, column: 5, scope: !43)
!48 = !DILocation(line: 24, column: 14, scope: !14)
!49 = !DILocation(line: 24, column: 11, scope: !14)
!50 = !DILocation(line: 24, column: 26, scope: !14)
!51 = !DILocation(line: 24, column: 23, scope: !14)
!52 = !DILocation(line: 24, column: 34, scope: !14)
!53 = !DILocation(line: 24, column: 21, scope: !14)
!54 = !DILocation(line: 24, column: 3, scope: !14)
!55 = distinct !DISubprogram(name: "absVal", scope: !15, file: !15, line: 27, type: !56, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!5, !5}
!58 = !DILocalVariable(name: "a", arg: 1, scope: !55, file: !15, line: 27, type: !5)
!59 = !DILocation(line: 27, column: 20, scope: !55)
!60 = !DILocation(line: 28, column: 7, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !15, line: 28, column: 7)
!62 = !DILocation(line: 28, column: 9, scope: !61)
!63 = !DILocation(line: 28, column: 7, scope: !55)
!64 = !DILocation(line: 29, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 28, column: 14)
!66 = !DILocation(line: 29, column: 15, scope: !65)
!67 = !DILocation(line: 29, column: 5, scope: !65)
!68 = !DILocation(line: 31, column: 12, scope: !69)
!69 = distinct !DILexicalBlock(scope: !61, file: !15, line: 30, column: 10)
!70 = !DILocation(line: 31, column: 5, scope: !69)
!71 = !DILocation(line: 33, column: 1, scope: !55)
!72 = distinct !DISubprogram(name: "percentDiff", scope: !15, file: !15, line: 35, type: !73, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!5, !18, !18}
!75 = !DILocalVariable(name: "val1", arg: 1, scope: !72, file: !15, line: 35, type: !18)
!76 = !DILocation(line: 35, column: 26, scope: !72)
!77 = !DILocalVariable(name: "val2", arg: 2, scope: !72, file: !15, line: 35, type: !18)
!78 = !DILocation(line: 35, column: 39, scope: !72)
!79 = !DILocation(line: 36, column: 15, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !15, line: 36, column: 7)
!81 = !DILocation(line: 36, column: 8, scope: !80)
!82 = !DILocation(line: 36, column: 21, scope: !80)
!83 = !DILocation(line: 36, column: 29, scope: !80)
!84 = !DILocation(line: 36, column: 40, scope: !80)
!85 = !DILocation(line: 36, column: 33, scope: !80)
!86 = !DILocation(line: 36, column: 46, scope: !80)
!87 = !DILocation(line: 36, column: 7, scope: !72)
!88 = !DILocation(line: 37, column: 5, scope: !89)
!89 = distinct !DILexicalBlock(scope: !80, file: !15, line: 36, column: 55)
!90 = !DILocation(line: 42, column: 27, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !15, line: 40, column: 8)
!92 = !DILocation(line: 42, column: 34, scope: !91)
!93 = !DILocation(line: 42, column: 32, scope: !91)
!94 = !DILocation(line: 42, column: 20, scope: !91)
!95 = !DILocation(line: 42, column: 49, scope: !91)
!96 = !DILocation(line: 42, column: 54, scope: !91)
!97 = !DILocation(line: 42, column: 42, scope: !91)
!98 = !DILocation(line: 42, column: 40, scope: !91)
!99 = !DILocation(line: 42, column: 13, scope: !91)
!100 = !DILocation(line: 41, column: 19, scope: !91)
!101 = !DILocation(line: 41, column: 5, scope: !91)
!102 = !DILocation(line: 44, column: 1, scope: !72)
!103 = distinct !DISubprogram(name: "gemm", scope: !1, file: !1, line: 38, type: !104, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{null, !106, !106, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!107 = !DILocalVariable(name: "A", arg: 1, scope: !103, file: !1, line: 38, type: !106)
!108 = !DILocation(line: 38, column: 21, scope: !103)
!109 = !DILocalVariable(name: "B", arg: 2, scope: !103, file: !1, line: 38, type: !106)
!110 = !DILocation(line: 38, column: 43, scope: !103)
!111 = !DILocalVariable(name: "C", arg: 3, scope: !103, file: !1, line: 38, type: !106)
!112 = !DILocation(line: 38, column: 65, scope: !103)
!113 = !DILocalVariable(name: "i", scope: !103, file: !1, line: 39, type: !24)
!114 = !DILocation(line: 39, column: 7, scope: !103)
!115 = !DILocalVariable(name: "j", scope: !103, file: !1, line: 39, type: !24)
!116 = !DILocation(line: 39, column: 10, scope: !103)
!117 = !DILocalVariable(name: "k", scope: !103, file: !1, line: 39, type: !24)
!118 = !DILocation(line: 39, column: 13, scope: !103)
!119 = !DILocation(line: 41, column: 10, scope: !120)
!120 = distinct !DILexicalBlock(scope: !103, file: !1, line: 41, column: 3)
!121 = !DILocation(line: 41, column: 8, scope: !120)
!122 = !DILocation(line: 41, column: 15, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !1, line: 41, column: 3)
!124 = !DILocation(line: 41, column: 17, scope: !123)
!125 = !DILocation(line: 41, column: 3, scope: !120)
!126 = !DILocation(line: 42, column: 12, scope: !127)
!127 = distinct !DILexicalBlock(scope: !128, file: !1, line: 42, column: 5)
!128 = distinct !DILexicalBlock(scope: !123, file: !1, line: 41, column: 28)
!129 = !DILocation(line: 42, column: 10, scope: !127)
!130 = !DILocation(line: 42, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !1, line: 42, column: 5)
!132 = !DILocation(line: 42, column: 19, scope: !131)
!133 = !DILocation(line: 42, column: 5, scope: !127)
!134 = !DILocation(line: 43, column: 7, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !1, line: 42, column: 30)
!136 = !DILocation(line: 43, column: 9, scope: !135)
!137 = !DILocation(line: 43, column: 11, scope: !135)
!138 = !DILocation(line: 43, column: 18, scope: !135)
!139 = !DILocation(line: 43, column: 16, scope: !135)
!140 = !DILocation(line: 43, column: 21, scope: !135)
!141 = !DILocation(line: 45, column: 14, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !1, line: 45, column: 7)
!143 = !DILocation(line: 45, column: 12, scope: !142)
!144 = !DILocation(line: 45, column: 19, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !1, line: 45, column: 7)
!146 = !DILocation(line: 45, column: 21, scope: !145)
!147 = !DILocation(line: 45, column: 7, scope: !142)
!148 = !DILocation(line: 46, column: 34, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !1, line: 45, column: 32)
!150 = !DILocation(line: 46, column: 36, scope: !149)
!151 = !DILocation(line: 46, column: 38, scope: !149)
!152 = !DILocation(line: 46, column: 45, scope: !149)
!153 = !DILocation(line: 46, column: 43, scope: !149)
!154 = !DILocation(line: 46, column: 32, scope: !149)
!155 = !DILocation(line: 46, column: 50, scope: !149)
!156 = !DILocation(line: 46, column: 52, scope: !149)
!157 = !DILocation(line: 46, column: 54, scope: !149)
!158 = !DILocation(line: 46, column: 61, scope: !149)
!159 = !DILocation(line: 46, column: 59, scope: !149)
!160 = !DILocation(line: 46, column: 48, scope: !149)
!161 = !DILocation(line: 46, column: 9, scope: !149)
!162 = !DILocation(line: 46, column: 11, scope: !149)
!163 = !DILocation(line: 46, column: 13, scope: !149)
!164 = !DILocation(line: 46, column: 20, scope: !149)
!165 = !DILocation(line: 46, column: 18, scope: !149)
!166 = !DILocation(line: 46, column: 23, scope: !149)
!167 = !DILocation(line: 47, column: 7, scope: !149)
!168 = !DILocation(line: 45, column: 27, scope: !145)
!169 = !DILocation(line: 45, column: 7, scope: !145)
!170 = distinct !{!170, !147, !171, !172}
!171 = !DILocation(line: 47, column: 7, scope: !142)
!172 = !{!"llvm.loop.mustprogress"}
!173 = !DILocation(line: 48, column: 5, scope: !135)
!174 = !DILocation(line: 42, column: 26, scope: !131)
!175 = !DILocation(line: 42, column: 5, scope: !131)
!176 = distinct !{!176, !133, !177, !172}
!177 = !DILocation(line: 48, column: 5, scope: !127)
!178 = !DILocation(line: 49, column: 3, scope: !128)
!179 = !DILocation(line: 41, column: 24, scope: !123)
!180 = !DILocation(line: 41, column: 3, scope: !123)
!181 = distinct !{!181, !125, !182, !172}
!182 = !DILocation(line: 49, column: 3, scope: !120)
!183 = !DILocation(line: 50, column: 1, scope: !103)
!184 = distinct !DISubprogram(name: "gemm_OMP", scope: !1, file: !1, line: 52, type: !185, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!185 = !DISubroutineType(types: !186)
!186 = !{null, !106, !106, !106, !106}
!187 = !DILocalVariable(name: "A", arg: 1, scope: !184, file: !1, line: 52, type: !106)
!188 = !DILocation(line: 52, column: 25, scope: !184)
!189 = !DILocalVariable(name: "B", arg: 2, scope: !184, file: !1, line: 52, type: !106)
!190 = !DILocation(line: 52, column: 47, scope: !184)
!191 = !DILocalVariable(name: "C", arg: 3, scope: !184, file: !1, line: 53, type: !106)
!192 = !DILocation(line: 53, column: 25, scope: !184)
!193 = !DILocalVariable(name: "Cinit", arg: 4, scope: !184, file: !1, line: 53, type: !106)
!194 = !DILocation(line: 53, column: 47, scope: !184)
!195 = !DILocation(line: 56, column: 3, scope: !184)
!196 = !DILocation(line: 56, column: 78, scope: !197)
!197 = distinct !DILexicalBlock(scope: !184, file: !1, line: 56, column: 3)
!198 = !DILocation(line: 56, column: 53, scope: !197)
!199 = !DILocation(line: 56, column: 29, scope: !197)
!200 = !DILocation(line: 56, column: 41, scope: !197)
!201 = !DILocation(line: 56, column: 3, scope: !197)
!202 = !DILocation(line: 66, column: 1, scope: !184)
!203 = distinct !DISubprogram(name: "__omp_offloading_32_84dffef_gemm_OMP_l56_debug__", scope: !1, file: !1, line: 57, type: !185, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!204 = !DILocalVariable(name: "C", arg: 1, scope: !203, file: !1, line: 53, type: !106)
!205 = !DILocation(line: 53, column: 25, scope: !203)
!206 = !DILocalVariable(name: "Cinit", arg: 2, scope: !203, file: !1, line: 53, type: !106)
!207 = !DILocation(line: 53, column: 47, scope: !203)
!208 = !DILocalVariable(name: "A", arg: 3, scope: !203, file: !1, line: 52, type: !106)
!209 = !DILocation(line: 52, column: 25, scope: !203)
!210 = !DILocalVariable(name: "B", arg: 4, scope: !203, file: !1, line: 52, type: !106)
!211 = !DILocation(line: 52, column: 47, scope: !203)
!212 = !DILocation(line: 57, column: 3, scope: !203)
!213 = !DILocation(line: 57, column: 44, scope: !203)
!214 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !1, file: !1, line: 58, type: !215, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!215 = !DISubroutineType(types: !216)
!216 = !{null, !217, !217, !221, !221, !221, !221}
!217 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !218)
!218 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !219)
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !220, size: 64)
!220 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !24)
!221 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !106, size: 64)
!222 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !214, type: !217, flags: DIFlagArtificial)
!223 = !DILocation(line: 0, scope: !214)
!224 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !214, type: !217, flags: DIFlagArtificial)
!225 = !DILocalVariable(name: "C", arg: 3, scope: !214, file: !1, line: 53, type: !221)
!226 = !DILocation(line: 53, column: 25, scope: !214)
!227 = !DILocalVariable(name: "Cinit", arg: 4, scope: !214, file: !1, line: 53, type: !221)
!228 = !DILocation(line: 53, column: 47, scope: !214)
!229 = !DILocalVariable(name: "A", arg: 5, scope: !214, file: !1, line: 52, type: !221)
!230 = !DILocation(line: 52, column: 25, scope: !214)
!231 = !DILocalVariable(name: "B", arg: 6, scope: !214, file: !1, line: 52, type: !221)
!232 = !DILocation(line: 52, column: 47, scope: !214)
!233 = !DILocation(line: 58, column: 3, scope: !214)
!234 = !DILocalVariable(name: ".omp.iv", scope: !214, type: !24, flags: DIFlagArtificial)
!235 = !DILocalVariable(name: ".omp.comb.lb", scope: !214, type: !24, flags: DIFlagArtificial)
!236 = !DILocation(line: 58, column: 8, scope: !214)
!237 = !DILocalVariable(name: ".omp.comb.ub", scope: !214, type: !24, flags: DIFlagArtificial)
!238 = !DILocalVariable(name: ".omp.stride", scope: !214, type: !24, flags: DIFlagArtificial)
!239 = !DILocalVariable(name: ".omp.is_last", scope: !214, type: !24, flags: DIFlagArtificial)
!240 = !DILocalVariable(name: "i", scope: !214, type: !24, flags: DIFlagArtificial)
!241 = !DILocation(line: 57, column: 3, scope: !214)
!242 = !DILocation(line: 57, column: 44, scope: !243)
!243 = distinct !DILexicalBlock(scope: !214, file: !1, line: 57, column: 3)
!244 = distinct !{!244, !241, !245}
!245 = !DILocation(line: 57, column: 44, scope: !214)
!246 = !DILocation(line: 65, column: 3, scope: !214)
!247 = distinct !DISubprogram(name: ".omp_outlined._debug__.1", scope: !1, file: !1, line: 58, type: !248, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!248 = !DISubroutineType(types: !249)
!249 = !{null, !217, !217, !250, !250, !221, !221, !221, !221}
!250 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !251)
!251 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!252 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !247, type: !217, flags: DIFlagArtificial)
!253 = !DILocation(line: 0, scope: !247)
!254 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !247, type: !217, flags: DIFlagArtificial)
!255 = !DILocalVariable(name: ".previous.lb.", arg: 3, scope: !247, type: !250, flags: DIFlagArtificial)
!256 = !DILocalVariable(name: ".previous.ub.", arg: 4, scope: !247, type: !250, flags: DIFlagArtificial)
!257 = !DILocalVariable(name: "C", arg: 5, scope: !247, file: !1, line: 53, type: !221)
!258 = !DILocation(line: 53, column: 25, scope: !247)
!259 = !DILocalVariable(name: "Cinit", arg: 6, scope: !247, file: !1, line: 53, type: !221)
!260 = !DILocation(line: 53, column: 47, scope: !247)
!261 = !DILocalVariable(name: "A", arg: 7, scope: !247, file: !1, line: 52, type: !221)
!262 = !DILocation(line: 52, column: 25, scope: !247)
!263 = !DILocalVariable(name: "B", arg: 8, scope: !247, file: !1, line: 52, type: !221)
!264 = !DILocation(line: 52, column: 47, scope: !247)
!265 = !DILocation(line: 58, column: 3, scope: !247)
!266 = !DILocalVariable(name: ".omp.iv", scope: !247, type: !24, flags: DIFlagArtificial)
!267 = !DILocalVariable(name: ".omp.lb", scope: !247, type: !24, flags: DIFlagArtificial)
!268 = !DILocation(line: 58, column: 8, scope: !247)
!269 = !DILocalVariable(name: ".omp.ub", scope: !247, type: !24, flags: DIFlagArtificial)
!270 = !DILocalVariable(name: ".omp.stride", scope: !247, type: !24, flags: DIFlagArtificial)
!271 = !DILocalVariable(name: ".omp.is_last", scope: !247, type: !24, flags: DIFlagArtificial)
!272 = !DILocalVariable(name: "i", scope: !247, type: !24, flags: DIFlagArtificial)
!273 = !DILocation(line: 57, column: 3, scope: !247)
!274 = !DILocation(line: 58, column: 27, scope: !247)
!275 = !DILocalVariable(name: "j", scope: !276, file: !1, line: 59, type: !24)
!276 = distinct !DILexicalBlock(scope: !277, file: !1, line: 59, column: 5)
!277 = distinct !DILexicalBlock(scope: !247, file: !1, line: 58, column: 32)
!278 = !DILocation(line: 59, column: 14, scope: !276)
!279 = !DILocation(line: 59, column: 10, scope: !276)
!280 = !DILocation(line: 59, column: 21, scope: !281)
!281 = distinct !DILexicalBlock(scope: !276, file: !1, line: 59, column: 5)
!282 = !DILocation(line: 59, column: 23, scope: !281)
!283 = !DILocation(line: 59, column: 5, scope: !276)
!284 = !DILocation(line: 60, column: 23, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !1, line: 59, column: 34)
!286 = !DILocation(line: 60, column: 29, scope: !285)
!287 = !DILocation(line: 60, column: 31, scope: !285)
!288 = !DILocation(line: 60, column: 38, scope: !285)
!289 = !DILocation(line: 60, column: 36, scope: !285)
!290 = !DILocation(line: 60, column: 41, scope: !285)
!291 = !DILocation(line: 60, column: 7, scope: !285)
!292 = !DILocation(line: 60, column: 9, scope: !285)
!293 = !DILocation(line: 60, column: 11, scope: !285)
!294 = !DILocation(line: 60, column: 18, scope: !285)
!295 = !DILocation(line: 60, column: 16, scope: !285)
!296 = !DILocation(line: 60, column: 21, scope: !285)
!297 = !DILocalVariable(name: "k", scope: !298, file: !1, line: 61, type: !24)
!298 = distinct !DILexicalBlock(scope: !285, file: !1, line: 61, column: 7)
!299 = !DILocation(line: 61, column: 16, scope: !298)
!300 = !DILocation(line: 61, column: 12, scope: !298)
!301 = !DILocation(line: 61, column: 23, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !1, line: 61, column: 7)
!303 = !DILocation(line: 61, column: 25, scope: !302)
!304 = !DILocation(line: 61, column: 7, scope: !298)
!305 = !DILocation(line: 62, column: 34, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !1, line: 61, column: 36)
!307 = !DILocation(line: 62, column: 36, scope: !306)
!308 = !DILocation(line: 62, column: 38, scope: !306)
!309 = !DILocation(line: 62, column: 45, scope: !306)
!310 = !DILocation(line: 62, column: 43, scope: !306)
!311 = !DILocation(line: 62, column: 32, scope: !306)
!312 = !DILocation(line: 62, column: 50, scope: !306)
!313 = !DILocation(line: 62, column: 52, scope: !306)
!314 = !DILocation(line: 62, column: 54, scope: !306)
!315 = !DILocation(line: 62, column: 61, scope: !306)
!316 = !DILocation(line: 62, column: 59, scope: !306)
!317 = !DILocation(line: 62, column: 48, scope: !306)
!318 = !DILocation(line: 62, column: 9, scope: !306)
!319 = !DILocation(line: 62, column: 11, scope: !306)
!320 = !DILocation(line: 62, column: 13, scope: !306)
!321 = !DILocation(line: 62, column: 20, scope: !306)
!322 = !DILocation(line: 62, column: 18, scope: !306)
!323 = !DILocation(line: 62, column: 23, scope: !306)
!324 = !DILocation(line: 63, column: 7, scope: !306)
!325 = !DILocation(line: 61, column: 31, scope: !302)
!326 = !DILocation(line: 61, column: 7, scope: !302)
!327 = distinct !{!327, !304, !328, !172}
!328 = !DILocation(line: 63, column: 7, scope: !298)
!329 = !DILocation(line: 64, column: 5, scope: !285)
!330 = !DILocation(line: 59, column: 30, scope: !281)
!331 = !DILocation(line: 59, column: 5, scope: !281)
!332 = distinct !{!332, !283, !333, !172}
!333 = !DILocation(line: 64, column: 5, scope: !276)
!334 = !DILocation(line: 65, column: 3, scope: !277)
!335 = distinct !{!335, !273, !336}
!336 = !DILocation(line: 57, column: 44, scope: !247)
!337 = !DILocation(line: 65, column: 3, scope: !247)
!338 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 57, type: !248, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!339 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !338, type: !217, flags: DIFlagArtificial)
!340 = !DILocation(line: 0, scope: !338)
!341 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !338, type: !217, flags: DIFlagArtificial)
!342 = !DILocalVariable(name: ".previous.lb.", arg: 3, scope: !338, type: !250, flags: DIFlagArtificial)
!343 = !DILocalVariable(name: ".previous.ub.", arg: 4, scope: !338, type: !250, flags: DIFlagArtificial)
!344 = !DILocalVariable(name: "C", arg: 5, scope: !338, type: !221, flags: DIFlagArtificial)
!345 = !DILocalVariable(name: "Cinit", arg: 6, scope: !338, type: !221, flags: DIFlagArtificial)
!346 = !DILocalVariable(name: "A", arg: 7, scope: !338, type: !221, flags: DIFlagArtificial)
!347 = !DILocalVariable(name: "B", arg: 8, scope: !338, type: !221, flags: DIFlagArtificial)
!348 = !DILocation(line: 57, column: 3, scope: !338)
!349 = !{!350}
!350 = !{i64 2, i64 -1, i64 -1, i1 true}
!351 = distinct !DISubprogram(name: ".omp_outlined..2", scope: !1, file: !1, line: 57, type: !215, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!352 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !351, type: !217, flags: DIFlagArtificial)
!353 = !DILocation(line: 0, scope: !351)
!354 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !351, type: !217, flags: DIFlagArtificial)
!355 = !DILocalVariable(name: "C", arg: 3, scope: !351, type: !221, flags: DIFlagArtificial)
!356 = !DILocalVariable(name: "Cinit", arg: 4, scope: !351, type: !221, flags: DIFlagArtificial)
!357 = !DILocalVariable(name: "A", arg: 5, scope: !351, type: !221, flags: DIFlagArtificial)
!358 = !DILocalVariable(name: "B", arg: 6, scope: !351, type: !221, flags: DIFlagArtificial)
!359 = !DILocation(line: 57, column: 3, scope: !351)
!360 = distinct !DISubprogram(name: "__omp_offloading_32_84dffef_gemm_OMP_l56", scope: !1, file: !1, line: 56, type: !185, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!361 = !DILocalVariable(name: "C", arg: 1, scope: !360, type: !106, flags: DIFlagArtificial)
!362 = !DILocation(line: 0, scope: !360)
!363 = !DILocalVariable(name: "Cinit", arg: 2, scope: !360, type: !106, flags: DIFlagArtificial)
!364 = !DILocalVariable(name: "A", arg: 3, scope: !360, type: !106, flags: DIFlagArtificial)
!365 = !DILocalVariable(name: "B", arg: 4, scope: !360, type: !106, flags: DIFlagArtificial)
!366 = !DILocation(line: 56, column: 3, scope: !360)
!367 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 68, type: !185, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!368 = !DILocalVariable(name: "A", arg: 1, scope: !367, file: !1, line: 68, type: !106)
!369 = !DILocation(line: 68, column: 21, scope: !367)
!370 = !DILocalVariable(name: "B", arg: 2, scope: !367, file: !1, line: 68, type: !106)
!371 = !DILocation(line: 68, column: 43, scope: !367)
!372 = !DILocalVariable(name: "C", arg: 3, scope: !367, file: !1, line: 69, type: !106)
!373 = !DILocation(line: 69, column: 14, scope: !367)
!374 = !DILocalVariable(name: "C_OMP", arg: 4, scope: !367, file: !1, line: 69, type: !106)
!375 = !DILocation(line: 69, column: 36, scope: !367)
!376 = !DILocalVariable(name: "i", scope: !367, file: !1, line: 70, type: !24)
!377 = !DILocation(line: 70, column: 7, scope: !367)
!378 = !DILocalVariable(name: "j", scope: !367, file: !1, line: 70, type: !24)
!379 = !DILocation(line: 70, column: 10, scope: !367)
!380 = !DILocation(line: 72, column: 10, scope: !381)
!381 = distinct !DILexicalBlock(scope: !367, file: !1, line: 72, column: 3)
!382 = !DILocation(line: 72, column: 8, scope: !381)
!383 = !DILocation(line: 72, column: 15, scope: !384)
!384 = distinct !DILexicalBlock(scope: !381, file: !1, line: 72, column: 3)
!385 = !DILocation(line: 72, column: 17, scope: !384)
!386 = !DILocation(line: 72, column: 3, scope: !381)
!387 = !DILocation(line: 73, column: 12, scope: !388)
!388 = distinct !DILexicalBlock(scope: !389, file: !1, line: 73, column: 5)
!389 = distinct !DILexicalBlock(scope: !384, file: !1, line: 72, column: 28)
!390 = !DILocation(line: 73, column: 10, scope: !388)
!391 = !DILocation(line: 73, column: 17, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !1, line: 73, column: 5)
!393 = !DILocation(line: 73, column: 19, scope: !392)
!394 = !DILocation(line: 73, column: 5, scope: !388)
!395 = !DILocation(line: 74, column: 35, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !1, line: 73, column: 30)
!397 = !DILocation(line: 74, column: 24, scope: !396)
!398 = !DILocation(line: 74, column: 39, scope: !396)
!399 = !DILocation(line: 74, column: 37, scope: !396)
!400 = !DILocation(line: 74, column: 42, scope: !396)
!401 = !DILocation(line: 74, column: 7, scope: !396)
!402 = !DILocation(line: 74, column: 9, scope: !396)
!403 = !DILocation(line: 74, column: 11, scope: !396)
!404 = !DILocation(line: 74, column: 18, scope: !396)
!405 = !DILocation(line: 74, column: 16, scope: !396)
!406 = !DILocation(line: 74, column: 21, scope: !396)
!407 = !DILocation(line: 75, column: 5, scope: !396)
!408 = !DILocation(line: 73, column: 26, scope: !392)
!409 = !DILocation(line: 73, column: 5, scope: !392)
!410 = distinct !{!410, !394, !411, !172}
!411 = !DILocation(line: 75, column: 5, scope: !388)
!412 = !DILocation(line: 76, column: 3, scope: !389)
!413 = !DILocation(line: 72, column: 24, scope: !384)
!414 = !DILocation(line: 72, column: 3, scope: !384)
!415 = distinct !{!415, !386, !416, !172}
!416 = !DILocation(line: 76, column: 3, scope: !381)
!417 = !DILocation(line: 78, column: 10, scope: !418)
!418 = distinct !DILexicalBlock(scope: !367, file: !1, line: 78, column: 3)
!419 = !DILocation(line: 78, column: 8, scope: !418)
!420 = !DILocation(line: 78, column: 15, scope: !421)
!421 = distinct !DILexicalBlock(scope: !418, file: !1, line: 78, column: 3)
!422 = !DILocation(line: 78, column: 17, scope: !421)
!423 = !DILocation(line: 78, column: 3, scope: !418)
!424 = !DILocation(line: 79, column: 12, scope: !425)
!425 = distinct !DILexicalBlock(scope: !426, file: !1, line: 79, column: 5)
!426 = distinct !DILexicalBlock(scope: !421, file: !1, line: 78, column: 28)
!427 = !DILocation(line: 79, column: 10, scope: !425)
!428 = !DILocation(line: 79, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !1, line: 79, column: 5)
!430 = !DILocation(line: 79, column: 19, scope: !429)
!431 = !DILocation(line: 79, column: 5, scope: !425)
!432 = !DILocation(line: 80, column: 35, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !1, line: 79, column: 30)
!434 = !DILocation(line: 80, column: 24, scope: !433)
!435 = !DILocation(line: 80, column: 39, scope: !433)
!436 = !DILocation(line: 80, column: 37, scope: !433)
!437 = !DILocation(line: 80, column: 41, scope: !433)
!438 = !DILocation(line: 80, column: 46, scope: !433)
!439 = !DILocation(line: 80, column: 7, scope: !433)
!440 = !DILocation(line: 80, column: 9, scope: !433)
!441 = !DILocation(line: 80, column: 11, scope: !433)
!442 = !DILocation(line: 80, column: 18, scope: !433)
!443 = !DILocation(line: 80, column: 16, scope: !433)
!444 = !DILocation(line: 80, column: 21, scope: !433)
!445 = !DILocation(line: 81, column: 5, scope: !433)
!446 = !DILocation(line: 79, column: 26, scope: !429)
!447 = !DILocation(line: 79, column: 5, scope: !429)
!448 = distinct !{!448, !431, !449, !172}
!449 = !DILocation(line: 81, column: 5, scope: !425)
!450 = !DILocation(line: 82, column: 3, scope: !426)
!451 = !DILocation(line: 78, column: 24, scope: !421)
!452 = !DILocation(line: 78, column: 3, scope: !421)
!453 = distinct !{!453, !423, !454, !172}
!454 = !DILocation(line: 82, column: 3, scope: !418)
!455 = !DILocation(line: 84, column: 10, scope: !456)
!456 = distinct !DILexicalBlock(scope: !367, file: !1, line: 84, column: 3)
!457 = !DILocation(line: 84, column: 8, scope: !456)
!458 = !DILocation(line: 84, column: 15, scope: !459)
!459 = distinct !DILexicalBlock(scope: !456, file: !1, line: 84, column: 3)
!460 = !DILocation(line: 84, column: 17, scope: !459)
!461 = !DILocation(line: 84, column: 3, scope: !456)
!462 = !DILocation(line: 85, column: 12, scope: !463)
!463 = distinct !DILexicalBlock(scope: !464, file: !1, line: 85, column: 5)
!464 = distinct !DILexicalBlock(scope: !459, file: !1, line: 84, column: 28)
!465 = !DILocation(line: 85, column: 10, scope: !463)
!466 = !DILocation(line: 85, column: 17, scope: !467)
!467 = distinct !DILexicalBlock(scope: !463, file: !1, line: 85, column: 5)
!468 = !DILocation(line: 85, column: 19, scope: !467)
!469 = !DILocation(line: 85, column: 5, scope: !463)
!470 = !DILocation(line: 86, column: 35, scope: !471)
!471 = distinct !DILexicalBlock(scope: !467, file: !1, line: 85, column: 30)
!472 = !DILocation(line: 86, column: 24, scope: !471)
!473 = !DILocation(line: 86, column: 39, scope: !471)
!474 = !DILocation(line: 86, column: 37, scope: !471)
!475 = !DILocation(line: 86, column: 41, scope: !471)
!476 = !DILocation(line: 86, column: 46, scope: !471)
!477 = !DILocation(line: 86, column: 7, scope: !471)
!478 = !DILocation(line: 86, column: 9, scope: !471)
!479 = !DILocation(line: 86, column: 11, scope: !471)
!480 = !DILocation(line: 86, column: 18, scope: !471)
!481 = !DILocation(line: 86, column: 16, scope: !471)
!482 = !DILocation(line: 86, column: 21, scope: !471)
!483 = !DILocation(line: 87, column: 39, scope: !471)
!484 = !DILocation(line: 87, column: 28, scope: !471)
!485 = !DILocation(line: 87, column: 43, scope: !471)
!486 = !DILocation(line: 87, column: 41, scope: !471)
!487 = !DILocation(line: 87, column: 45, scope: !471)
!488 = !DILocation(line: 87, column: 50, scope: !471)
!489 = !DILocation(line: 87, column: 7, scope: !471)
!490 = !DILocation(line: 87, column: 13, scope: !471)
!491 = !DILocation(line: 87, column: 15, scope: !471)
!492 = !DILocation(line: 87, column: 22, scope: !471)
!493 = !DILocation(line: 87, column: 20, scope: !471)
!494 = !DILocation(line: 87, column: 25, scope: !471)
!495 = !DILocation(line: 88, column: 5, scope: !471)
!496 = !DILocation(line: 85, column: 26, scope: !467)
!497 = !DILocation(line: 85, column: 5, scope: !467)
!498 = distinct !{!498, !469, !499, !172}
!499 = !DILocation(line: 88, column: 5, scope: !463)
!500 = !DILocation(line: 89, column: 3, scope: !464)
!501 = !DILocation(line: 84, column: 24, scope: !459)
!502 = !DILocation(line: 84, column: 3, scope: !459)
!503 = distinct !{!503, !461, !504, !172}
!504 = !DILocation(line: 89, column: 3, scope: !456)
!505 = !DILocation(line: 90, column: 1, scope: !367)
!506 = distinct !DISubprogram(name: "compareResults", scope: !1, file: !1, line: 92, type: !507, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!507 = !DISubroutineType(types: !508)
!508 = !{!24, !106, !106}
!509 = !DILocalVariable(name: "C", arg: 1, scope: !506, file: !1, line: 92, type: !106)
!510 = !DILocation(line: 92, column: 31, scope: !506)
!511 = !DILocalVariable(name: "C_outputFromGpu", arg: 2, scope: !506, file: !1, line: 92, type: !106)
!512 = !DILocation(line: 92, column: 45, scope: !506)
!513 = !DILocalVariable(name: "i", scope: !506, file: !1, line: 93, type: !24)
!514 = !DILocation(line: 93, column: 7, scope: !506)
!515 = !DILocalVariable(name: "j", scope: !506, file: !1, line: 93, type: !24)
!516 = !DILocation(line: 93, column: 10, scope: !506)
!517 = !DILocalVariable(name: "fail", scope: !506, file: !1, line: 93, type: !24)
!518 = !DILocation(line: 93, column: 13, scope: !506)
!519 = !DILocation(line: 94, column: 8, scope: !506)
!520 = !DILocation(line: 97, column: 10, scope: !521)
!521 = distinct !DILexicalBlock(scope: !506, file: !1, line: 97, column: 3)
!522 = !DILocation(line: 97, column: 8, scope: !521)
!523 = !DILocation(line: 97, column: 15, scope: !524)
!524 = distinct !DILexicalBlock(scope: !521, file: !1, line: 97, column: 3)
!525 = !DILocation(line: 97, column: 17, scope: !524)
!526 = !DILocation(line: 97, column: 3, scope: !521)
!527 = !DILocation(line: 98, column: 12, scope: !528)
!528 = distinct !DILexicalBlock(scope: !529, file: !1, line: 98, column: 5)
!529 = distinct !DILexicalBlock(scope: !524, file: !1, line: 97, column: 28)
!530 = !DILocation(line: 98, column: 10, scope: !528)
!531 = !DILocation(line: 98, column: 17, scope: !532)
!532 = distinct !DILexicalBlock(scope: !528, file: !1, line: 98, column: 5)
!533 = !DILocation(line: 98, column: 19, scope: !532)
!534 = !DILocation(line: 98, column: 5, scope: !528)
!535 = !DILocation(line: 99, column: 23, scope: !536)
!536 = distinct !DILexicalBlock(scope: !537, file: !1, line: 99, column: 11)
!537 = distinct !DILexicalBlock(scope: !532, file: !1, line: 98, column: 30)
!538 = !DILocation(line: 99, column: 25, scope: !536)
!539 = !DILocation(line: 99, column: 27, scope: !536)
!540 = !DILocation(line: 99, column: 34, scope: !536)
!541 = !DILocation(line: 99, column: 32, scope: !536)
!542 = !DILocation(line: 99, column: 38, scope: !536)
!543 = !DILocation(line: 99, column: 54, scope: !536)
!544 = !DILocation(line: 99, column: 56, scope: !536)
!545 = !DILocation(line: 99, column: 63, scope: !536)
!546 = !DILocation(line: 99, column: 61, scope: !536)
!547 = !DILocation(line: 99, column: 11, scope: !536)
!548 = !DILocation(line: 99, column: 67, scope: !536)
!549 = !DILocation(line: 99, column: 11, scope: !537)
!550 = !DILocation(line: 101, column: 13, scope: !551)
!551 = distinct !DILexicalBlock(scope: !536, file: !1, line: 100, column: 41)
!552 = !DILocation(line: 102, column: 17, scope: !551)
!553 = !DILocation(line: 102, column: 40, scope: !551)
!554 = !DILocation(line: 102, column: 42, scope: !551)
!555 = !DILocation(line: 102, column: 44, scope: !551)
!556 = !DILocation(line: 102, column: 51, scope: !551)
!557 = !DILocation(line: 102, column: 49, scope: !551)
!558 = !DILocation(line: 103, column: 17, scope: !551)
!559 = !DILocation(line: 103, column: 33, scope: !551)
!560 = !DILocation(line: 103, column: 35, scope: !551)
!561 = !DILocation(line: 103, column: 42, scope: !551)
!562 = !DILocation(line: 103, column: 40, scope: !551)
!563 = !DILocation(line: 102, column: 9, scope: !551)
!564 = !DILocation(line: 104, column: 7, scope: !551)
!565 = !DILocation(line: 105, column: 5, scope: !537)
!566 = !DILocation(line: 98, column: 26, scope: !532)
!567 = !DILocation(line: 98, column: 5, scope: !532)
!568 = distinct !{!568, !534, !569, !172}
!569 = !DILocation(line: 105, column: 5, scope: !528)
!570 = !DILocation(line: 106, column: 3, scope: !529)
!571 = !DILocation(line: 97, column: 24, scope: !524)
!572 = !DILocation(line: 97, column: 3, scope: !524)
!573 = distinct !{!573, !526, !574, !172}
!574 = !DILocation(line: 106, column: 3, scope: !521)
!575 = !DILocation(line: 111, column: 40, scope: !506)
!576 = !DILocation(line: 109, column: 3, scope: !506)
!577 = !DILocation(line: 113, column: 10, scope: !506)
!578 = !DILocation(line: 113, column: 3, scope: !506)
!579 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 116, type: !580, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!580 = !DISubroutineType(types: !581)
!581 = !{!24, !24, !582}
!582 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !583, size: 64)
!583 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !584, size: 64)
!584 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!585 = !DILocalVariable(name: "argc", arg: 1, scope: !579, file: !1, line: 116, type: !24)
!586 = !DILocation(line: 116, column: 14, scope: !579)
!587 = !DILocalVariable(name: "argv", arg: 2, scope: !579, file: !1, line: 116, type: !582)
!588 = !DILocation(line: 116, column: 26, scope: !579)
!589 = !DILocalVariable(name: "t_start", scope: !579, file: !1, line: 117, type: !18)
!590 = !DILocation(line: 117, column: 10, scope: !579)
!591 = !DILocalVariable(name: "t_end", scope: !579, file: !1, line: 117, type: !18)
!592 = !DILocation(line: 117, column: 19, scope: !579)
!593 = !DILocalVariable(name: "fail", scope: !579, file: !1, line: 118, type: !24)
!594 = !DILocation(line: 118, column: 7, scope: !579)
!595 = !DILocalVariable(name: "A", scope: !579, file: !1, line: 120, type: !596)
!596 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320000, elements: !597)
!597 = !{!598}
!598 = !DISubrange(count: 10000)
!599 = !DILocation(line: 120, column: 13, scope: !579)
!600 = !DILocalVariable(name: "B", scope: !579, file: !1, line: 121, type: !596)
!601 = !DILocation(line: 121, column: 13, scope: !579)
!602 = !DILocalVariable(name: "C", scope: !579, file: !1, line: 122, type: !596)
!603 = !DILocation(line: 122, column: 13, scope: !579)
!604 = !DILocalVariable(name: "C_outputFromGpu", scope: !579, file: !1, line: 123, type: !596)
!605 = !DILocation(line: 123, column: 13, scope: !579)
!606 = !DILocalVariable(name: "Cinit_outputFromGpu", scope: !579, file: !1, line: 124, type: !596)
!607 = !DILocation(line: 124, column: 13, scope: !579)
!608 = !DILocation(line: 126, column: 8, scope: !579)
!609 = !DILocation(line: 126, column: 11, scope: !579)
!610 = !DILocation(line: 126, column: 14, scope: !579)
!611 = !DILocation(line: 126, column: 17, scope: !579)
!612 = !DILocation(line: 126, column: 3, scope: !579)
!613 = !DILocation(line: 128, column: 12, scope: !579)
!614 = !DILocation(line: 128, column: 15, scope: !579)
!615 = !DILocation(line: 128, column: 18, scope: !579)
!616 = !DILocation(line: 128, column: 35, scope: !579)
!617 = !DILocation(line: 128, column: 3, scope: !579)
!618 = !DILocation(line: 146, column: 10, scope: !579)
!619 = !DILocation(line: 146, column: 3, scope: !579)
!620 = distinct !DISubprogram(linkageName: ".omp_offloading.requires_reg", scope: !1, file: !1, type: !621, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!621 = !DISubroutineType(types: !2)

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
