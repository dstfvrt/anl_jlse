
; __CLANG_OFFLOAD_BUNDLE____START__ openmp-nvptx64
; ModuleID = 'src/debug.c'
source_filename = "src/debug.c"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@0 = private unnamed_addr constant [29 x i8] c";src/debug.c;gemm_OMP;60;1;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant [30 x i8] c";src/debug.c;gemm_OMP;60;51;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @2, i32 0, i32 0) }, align 8
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @2, i32 0, i32 0) }, align 8
@__openmp_nvptx_data_transfer_temporary_storage = weak addrspace(3) global [32 x i32] undef
@5 = private unnamed_addr constant [22 x i8] c";src/debug.c;;60;51;;\00", align 1
@6 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @5, i32 0, i32 0) }, align 8
@7 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @5, i32 0, i32 0) }, align 8
@8 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @0, i32 0, i32 0) }, align 8
@9 = private unnamed_addr constant [29 x i8] c";src/debug.c;gemm_OMP;56;3;;\00", align 1
@10 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @9, i32 0, i32 0) }, align 8
@11 = private unnamed_addr constant [21 x i8] c";src/debug.c;;56;3;;\00", align 1
@12 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @11, i32 0, i32 0) }, align 8
@__omp_offloading_32_82eb324_gemm_OMP_l56_exec_mode = weak constant i8 1
@llvm.compiler.used = appending global [2 x i8*] [i8* addrspacecast (i8 addrspace(3)* bitcast ([32 x i32] addrspace(3)* @__openmp_nvptx_data_transfer_temporary_storage to i8 addrspace(3)*) to i8*), i8* @__omp_offloading_32_82eb324_gemm_OMP_l56_exec_mode], section "llvm.metadata"

; Function Attrs: convergent noinline norecurse nounwind
define internal void @__omp_offloading_32_82eb324_gemm_OMP_l56_worker() #0 !dbg !13 {
entry:
  %work_fn = alloca i8*, align 8
  %exec_status = alloca i8, align 1
  store i8* null, i8** %work_fn, align 8
  store i8 0, i8* %exec_status, align 1
  br label %.await.work, !dbg !15

.await.work:                                      ; preds = %.barrier.parallel, %entry
  call void @__kmpc_barrier_simple_spmd(%struct.ident_t* null, i32 0), !dbg !15
  %0 = call i1 @__kmpc_kernel_parallel(i8** %work_fn), !dbg !15
  %1 = zext i1 %0 to i8, !dbg !15
  store i8 %1, i8* %exec_status, align 1, !dbg !15
  %2 = load i8*, i8** %work_fn, align 8, !dbg !15
  %should_terminate = icmp eq i8* %2, null, !dbg !15
  br i1 %should_terminate, label %.exit, label %.select.workers, !dbg !15

.select.workers:                                  ; preds = %.await.work
  %3 = load i8, i8* %exec_status, align 1, !dbg !15
  %is_active = icmp ne i8 %3, 0, !dbg !15
  br i1 %is_active, label %.execute.parallel, label %.barrier.parallel, !dbg !15

.execute.parallel:                                ; preds = %.select.workers
  %4 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @12)
  %5 = load i8*, i8** %work_fn, align 8, !dbg !15
  %work_match = icmp eq i8* %5, bitcast (void (i16, i32)* @__omp_outlined___wrapper to i8*), !dbg !15
  br i1 %work_match, label %.execute.fn, label %.check.next, !dbg !15

.execute.fn:                                      ; preds = %.execute.parallel
  call void @__omp_outlined___wrapper(i16 0, i32 %4) #4, !dbg !15
  br label %.terminate.parallel, !dbg !15

.check.next:                                      ; preds = %.execute.parallel
  %6 = bitcast i8* %2 to void (i16, i32)*, !dbg !15
  call void %6(i16 0, i32 %4), !dbg !15
  br label %.terminate.parallel, !dbg !15

.terminate.parallel:                              ; preds = %.check.next, %.execute.fn
  call void @__kmpc_kernel_end_parallel(), !dbg !15
  br label %.barrier.parallel, !dbg !15

.barrier.parallel:                                ; preds = %.terminate.parallel, %.select.workers
  call void @__kmpc_barrier_simple_spmd(%struct.ident_t* null, i32 0), !dbg !15
  br label %.await.work, !dbg !15

.exit:                                            ; preds = %.await.work
  ret void, !dbg !15
}

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_offloading_32_82eb324_gemm_OMP_l56_debug__(float* %C, float* %Cinit, float* %A, float* %B) #1 !dbg !16 {
entry:
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  %.zero.addr = alloca i32, align 4
  %.threadid_temp. = alloca i32, align 4
  store i32 0, i32* %.zero.addr, align 4
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !24, metadata !DIExpression()), !dbg !25
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !30, metadata !DIExpression()), !dbg !31
  %nvptx_tid = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !32
  %nvptx_num_threads = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !dbg !32
  %nvptx_warp_size = call i32 @llvm.nvvm.read.ptx.sreg.warpsize(), !dbg !32
  %thread_limit = sub nuw i32 %nvptx_num_threads, %nvptx_warp_size, !dbg !32
  %0 = icmp ult i32 %nvptx_tid, %thread_limit, !dbg !32
  br i1 %0, label %.worker, label %.mastercheck, !dbg !32

.worker:                                          ; preds = %entry
  call void @__omp_offloading_32_82eb324_gemm_OMP_l56_worker() #4, !dbg !33
  br label %.exit, !dbg !32

.mastercheck:                                     ; preds = %entry
  %nvptx_tid1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !32
  %nvptx_num_threads2 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !dbg !32
  %nvptx_warp_size3 = call i32 @llvm.nvvm.read.ptx.sreg.warpsize(), !dbg !32
  %1 = sub nuw i32 %nvptx_warp_size3, 1, !dbg !32
  %2 = sub nuw i32 %nvptx_num_threads2, 1, !dbg !32
  %3 = xor i32 %1, -1, !dbg !32
  %master_tid = and i32 %2, %3, !dbg !32
  %4 = icmp eq i32 %nvptx_tid1, %master_tid, !dbg !32
  br i1 %4, label %.master, label %.exit, !dbg !32

.master:                                          ; preds = %.mastercheck
  %nvptx_num_threads4 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !dbg !32
  %nvptx_warp_size5 = call i32 @llvm.nvvm.read.ptx.sreg.warpsize(), !dbg !32
  %thread_limit6 = sub nuw i32 %nvptx_num_threads4, %nvptx_warp_size5, !dbg !32
  call void @__kmpc_kernel_init(i32 %thread_limit6, i16 1), !dbg !32
  %5 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @10)
  %6 = load float*, float** %C.addr, align 8, !dbg !33
  %7 = load float*, float** %Cinit.addr, align 8, !dbg !33
  %8 = load float*, float** %A.addr, align 8, !dbg !33
  %9 = load float*, float** %B.addr, align 8, !dbg !33
  store i32 %5, i32* %.threadid_temp., align 4, !dbg !33
  call void @__omp_outlined__2(i32* %.threadid_temp., i32* %.zero.addr, float* %6, float* %7, float* %8, float* %9) #4, !dbg !34
  br label %.termination.notifier, !dbg !36

.termination.notifier:                            ; preds = %.master
  call void @__kmpc_kernel_deinit(i16 1), !dbg !36
  call void @__kmpc_barrier_simple_spmd(%struct.ident_t* null, i32 0), !dbg !36
  br label %.exit, !dbg !36

.exit:                                            ; preds = %.termination.notifier, %.mastercheck, %.worker
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.warpsize() #3

declare void @__kmpc_kernel_init(i32, i16)

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined___debug__(i32* noalias %.global_tid., i32* noalias %.bound_tid., float* %C, float* %Cinit, float* %A, float* %B) #1 !dbg !38 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  %captured_vars_addrs = alloca [5 x i8*], align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !48, metadata !DIExpression()), !dbg !47
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %i = call i8* @__kmpc_alloc_shared(i64 4), !dbg !57
  %i_on_stack = bitcast i8* %i to i32*, !dbg !58
  %j = call i8* @__kmpc_alloc_shared(i64 4), !dbg !59
  %j_on_stack = bitcast i8* %j to i32*, !dbg !58
  %0 = load float*, float** %A.addr, align 8, !dbg !58
  %A1 = call i8* @__kmpc_alloc_shared(i64 8), !dbg !54
  %A_on_stack = bitcast i8* %A1 to float**, !dbg !58
  store float* %0, float** %A_on_stack, align 8, !dbg !58
  %1 = load float*, float** %B.addr, align 8, !dbg !58
  %B2 = call i8* @__kmpc_alloc_shared(i64 8), !dbg !56
  %B_on_stack = bitcast i8* %B2 to float**, !dbg !58
  store float* %1, float** %B_on_stack, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i32* %i_on_stack, metadata !60, metadata !DIExpression()), !dbg !62
  store i32 0, i32* %i_on_stack, align 4, !dbg !62
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc11, %entry
  %2 = load i32, i32* %i_on_stack, align 4, !dbg !64
  %cmp = icmp slt i32 %2, 100, !dbg !66
  br i1 %cmp, label %for.body, label %for.end13, !dbg !67

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j_on_stack, metadata !68, metadata !DIExpression()), !dbg !71
  store i32 0, i32* %j_on_stack, align 4, !dbg !71
  br label %for.cond3, !dbg !72

for.cond3:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %j_on_stack, align 4, !dbg !73
  %cmp4 = icmp slt i32 %3, 100, !dbg !75
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !76

for.body5:                                        ; preds = %for.cond3
  %4 = load float*, float** %Cinit.addr, align 8, !dbg !77
  %5 = load i32, i32* %i_on_stack, align 4, !dbg !79
  %mul = mul nsw i32 %5, 100, !dbg !80
  %6 = load i32, i32* %j_on_stack, align 4, !dbg !81
  %add = add nsw i32 %mul, %6, !dbg !82
  %idxprom = sext i32 %add to i64, !dbg !77
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !77
  %7 = load volatile float, float* %arrayidx, align 4, !dbg !77
  %mul6 = fmul float %7, 2.123000e+03, !dbg !83
  %8 = load float*, float** %C.addr, align 8, !dbg !84
  %9 = load i32, i32* %i_on_stack, align 4, !dbg !85
  %mul7 = mul nsw i32 %9, 100, !dbg !86
  %10 = load i32, i32* %j_on_stack, align 4, !dbg !87
  %add8 = add nsw i32 %mul7, %10, !dbg !88
  %idxprom9 = sext i32 %add8 to i64, !dbg !84
  %arrayidx10 = getelementptr inbounds float, float* %8, i64 %idxprom9, !dbg !84
  store float %mul6, float* %arrayidx10, align 4, !dbg !89
  %11 = load float*, float** %C.addr, align 8, !dbg !90
  %12 = getelementptr inbounds [5 x i8*], [5 x i8*]* %captured_vars_addrs, i64 0, i64 0, !dbg !90
  %13 = bitcast float* %11 to i8*, !dbg !90
  store i8* %13, i8** %12, align 8, !dbg !90
  %14 = getelementptr inbounds [5 x i8*], [5 x i8*]* %captured_vars_addrs, i64 0, i64 1, !dbg !90
  %15 = bitcast i32* %i_on_stack to i8*, !dbg !90
  store i8* %15, i8** %14, align 8, !dbg !90
  %16 = getelementptr inbounds [5 x i8*], [5 x i8*]* %captured_vars_addrs, i64 0, i64 2, !dbg !90
  %17 = bitcast i32* %j_on_stack to i8*, !dbg !90
  store i8* %17, i8** %16, align 8, !dbg !90
  %18 = getelementptr inbounds [5 x i8*], [5 x i8*]* %captured_vars_addrs, i64 0, i64 3, !dbg !90
  %19 = bitcast float** %A_on_stack to i8*, !dbg !90
  store i8* %19, i8** %18, align 8, !dbg !90
  %20 = getelementptr inbounds [5 x i8*], [5 x i8*]* %captured_vars_addrs, i64 0, i64 4, !dbg !90
  %21 = bitcast float** %B_on_stack to i8*, !dbg !90
  store i8* %21, i8** %20, align 8, !dbg !90
  %22 = load i32*, i32** %.global_tid..addr, align 8, !dbg !90
  %23 = load i32, i32* %22, align 4, !dbg !90
  %24 = bitcast [5 x i8*]* %captured_vars_addrs to i8**, !dbg !90
  call void @__kmpc_parallel_51(%struct.ident_t* @8, i32 %23, i32 1, i32 -1, i32 -1, i8* bitcast (void (i32*, i32*, float*, i32*, i32*, float**, float**)* @__omp_outlined__ to i8*), i8* bitcast (void (i16, i32)* @__omp_outlined___wrapper to i8*), i8** %24, i64 5), !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body5
  %25 = load i32, i32* %j_on_stack, align 4, !dbg !92
  %inc = add nsw i32 %25, 1, !dbg !92
  store i32 %inc, i32* %j_on_stack, align 4, !dbg !92
  br label %for.cond3, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond3
  br label %for.inc11, !dbg !97

for.inc11:                                        ; preds = %for.end
  %26 = load i32, i32* %i_on_stack, align 4, !dbg !98
  %inc12 = add nsw i32 %26, 1, !dbg !98
  store i32 %inc12, i32* %i_on_stack, align 4, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end13:                                        ; preds = %for.cond
  call void @__kmpc_free_shared(i8* %B2), !dbg !101
  call void @__kmpc_free_shared(i8* %A1), !dbg !101
  call void @__kmpc_free_shared(i8* %j), !dbg !101
  call void @__kmpc_free_shared(i8* %i), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: nounwind
declare i8* @__kmpc_alloc_shared(i64) #4

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined___debug__1(i32* noalias %.global_tid., i32* noalias %.bound_tid., float* %C, i32* noalias %i, i32* noalias %j, float** noalias %A, float** noalias %B) #1 !dbg !103 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float*, align 8
  %i.addr = alloca i32*, align 8
  %j.addr = alloca i32*, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  %tmp = alloca i32*, align 8
  %tmp1 = alloca i32*, align 8
  %tmp2 = alloca float**, align 8
  %tmp3 = alloca float**, align 8
  %.omp.iv = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %C6 = alloca [10000 x float], align 4
  %tmp7 = alloca float*, align 8
  %k = alloca i32, align 4
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !112, metadata !DIExpression()), !dbg !111
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i32* %j, i32** %j.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %j.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !119, metadata !DIExpression()), !dbg !120
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = load i32*, i32** %i.addr, align 8, !dbg !123
  store i32* %0, i32** %tmp, align 8, !dbg !123
  %1 = load i32*, i32** %tmp, align 8, !dbg !123
  %2 = load i32*, i32** %j.addr, align 8, !dbg !123
  store i32* %2, i32** %tmp1, align 8, !dbg !123
  %3 = load i32*, i32** %tmp1, align 8, !dbg !123
  %4 = load float**, float*** %A.addr, align 8, !dbg !123
  store float** %4, float*** %tmp2, align 8, !dbg !123
  %5 = load float**, float*** %tmp2, align 8, !dbg !123
  %6 = load float**, float*** %B.addr, align 8, !dbg !123
  store float** %6, float*** %tmp3, align 8, !dbg !123
  %7 = load float**, float*** %tmp3, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !124, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !125, metadata !DIExpression()), !dbg !111
  store i32 0, i32* %.omp.lb, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !127, metadata !DIExpression()), !dbg !111
  store i32 99, i32* %.omp.ub, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !128, metadata !DIExpression()), !dbg !111
  store i32 1, i32* %.omp.stride, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !129, metadata !DIExpression()), !dbg !111
  store i32 0, i32* %.omp.is_last, align 4, !dbg !126
  %8 = load float*, float** %C.addr, align 8, !dbg !130
  %arrayidx = getelementptr inbounds float, float* %8, i64 0, !dbg !130
  %9 = load float*, float** %C.addr, align 8, !dbg !130
  %arrayidx5 = getelementptr inbounds float, float* %9, i64 9999, !dbg !123
  call void @llvm.dbg.declare(metadata [10000 x float]* %C6, metadata !131, metadata !DIExpression()), !dbg !111
  %array.begin = getelementptr inbounds [10000 x float], [10000 x float]* %C6, i32 0, i32 0, !dbg !123
  %10 = getelementptr float, float* %array.begin, i64 10000, !dbg !123
  %omp.arrayinit.isempty = icmp eq float* %array.begin, %10, !dbg !123
  br i1 %omp.arrayinit.isempty, label %omp.arrayinit.done, label %omp.arrayinit.body, !dbg !123

omp.arrayinit.body:                               ; preds = %omp.arrayinit.body, %entry
  %omp.arraycpy.destElementPast = phi float* [ %array.begin, %entry ], [ %omp.arraycpy.dest.element, %omp.arrayinit.body ], !dbg !123
  store float 0.000000e+00, float* %omp.arraycpy.destElementPast, align 4, !dbg !123
  %omp.arraycpy.dest.element = getelementptr float, float* %omp.arraycpy.destElementPast, i32 1, !dbg !123
  %omp.arraycpy.done = icmp eq float* %omp.arraycpy.dest.element, %10, !dbg !123
  br i1 %omp.arraycpy.done, label %omp.arrayinit.done, label %omp.arrayinit.body, !dbg !123

omp.arrayinit.done:                               ; preds = %omp.arrayinit.body, %entry
  %11 = load float*, float** %C.addr, align 8, !dbg !123
  %12 = ptrtoint float* %11 to i64, !dbg !123
  %13 = ptrtoint float* %arrayidx to i64, !dbg !123
  %14 = sub i64 %12, %13, !dbg !123
  %15 = sdiv exact i64 %14, ptrtoint (float* getelementptr (float, float* null, i32 1) to i64), !dbg !123
  %16 = bitcast [10000 x float]* %C6 to float*, !dbg !123
  %17 = getelementptr float, float* %16, i64 %15, !dbg !123
  store float* %17, float** %tmp7, align 8, !dbg !123
  %rhs.begin = bitcast [10000 x float]* %C6 to float*, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %k, metadata !135, metadata !DIExpression()), !dbg !111
  %18 = load i32*, i32** %.global_tid..addr, align 8, !dbg !123
  %19 = load i32, i32* %18, align 4, !dbg !123
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %19, i32 33, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !136
  br label %omp.dispatch.cond, !dbg !123

omp.dispatch.cond:                                ; preds = %omp.dispatch.inc, %omp.arrayinit.done
  %20 = load i32, i32* %.omp.ub, align 4, !dbg !126
  %cmp = icmp sgt i32 %20, 99, !dbg !126
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !126

cond.true:                                        ; preds = %omp.dispatch.cond
  br label %cond.end, !dbg !126

cond.false:                                       ; preds = %omp.dispatch.cond
  %21 = load i32, i32* %.omp.ub, align 4, !dbg !126
  br label %cond.end, !dbg !126

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 99, %cond.true ], [ %21, %cond.false ], !dbg !126
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !126
  %22 = load i32, i32* %.omp.lb, align 4, !dbg !126
  store i32 %22, i32* %.omp.iv, align 4, !dbg !126
  %23 = load i32, i32* %.omp.iv, align 4, !dbg !126
  %24 = load i32, i32* %.omp.ub, align 4, !dbg !126
  %cmp8 = icmp sle i32 %23, %24, !dbg !123
  br i1 %cmp8, label %omp.dispatch.body, label %omp.dispatch.end, !dbg !123

omp.dispatch.body:                                ; preds = %cond.end
  br label %omp.inner.for.cond, !dbg !123

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %omp.dispatch.body
  %25 = load i32, i32* %.omp.iv, align 4, !dbg !126
  %26 = load i32, i32* %.omp.ub, align 4, !dbg !126
  %cmp9 = icmp sle i32 %25, %26, !dbg !123
  br i1 %cmp9, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !123

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %27 = load i32, i32* %.omp.iv, align 4, !dbg !126
  %mul = mul nsw i32 %27, 1, !dbg !137
  %add = add nsw i32 0, %mul, !dbg !137
  store i32 %add, i32* %k, align 4, !dbg !137
  %28 = load float*, float** %5, align 8, !dbg !138
  %29 = load i32, i32* %1, align 4, !dbg !140
  %mul10 = mul nsw i32 %29, 100, !dbg !141
  %30 = load i32, i32* %k, align 4, !dbg !142
  %add11 = add nsw i32 %mul10, %30, !dbg !143
  %idxprom = sext i32 %add11 to i64, !dbg !138
  %arrayidx12 = getelementptr inbounds float, float* %28, i64 %idxprom, !dbg !138
  %31 = load float, float* %arrayidx12, align 4, !dbg !138
  %mul13 = fmul float 3.241200e+04, %31, !dbg !144
  %32 = load float*, float** %7, align 8, !dbg !145
  %33 = load i32, i32* %k, align 4, !dbg !146
  %mul14 = mul nsw i32 %33, 100, !dbg !147
  %34 = load i32, i32* %3, align 4, !dbg !148
  %add15 = add nsw i32 %mul14, %34, !dbg !149
  %idxprom16 = sext i32 %add15 to i64, !dbg !145
  %arrayidx17 = getelementptr inbounds float, float* %32, i64 %idxprom16, !dbg !145
  %35 = load float, float* %arrayidx17, align 4, !dbg !145
  %mul18 = fmul float %mul13, %35, !dbg !150
  %36 = load float*, float** %tmp7, align 8, !dbg !151
  %37 = load i32, i32* %1, align 4, !dbg !152
  %mul19 = mul nsw i32 %37, 100, !dbg !153
  %38 = load i32, i32* %3, align 4, !dbg !154
  %add20 = add nsw i32 %mul19, %38, !dbg !155
  %idxprom21 = sext i32 %add20 to i64, !dbg !151
  %arrayidx22 = getelementptr inbounds float, float* %36, i64 %idxprom21, !dbg !151
  %39 = load float, float* %arrayidx22, align 4, !dbg !156
  %add23 = fadd float %39, %mul18, !dbg !156
  store float %add23, float* %arrayidx22, align 4, !dbg !156
  br label %omp.body.continue, !dbg !157

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !136

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %40 = load i32, i32* %.omp.iv, align 4, !dbg !126
  %add24 = add nsw i32 %40, 1, !dbg !123
  store i32 %add24, i32* %.omp.iv, align 4, !dbg !123
  br label %omp.inner.for.cond, !dbg !136, !llvm.loop !158

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.dispatch.inc, !dbg !136

omp.dispatch.inc:                                 ; preds = %omp.inner.for.end
  %41 = load i32, i32* %.omp.lb, align 4, !dbg !126
  %42 = load i32, i32* %.omp.stride, align 4, !dbg !126
  %add25 = add nsw i32 %41, %42, !dbg !123
  store i32 %add25, i32* %.omp.lb, align 4, !dbg !123
  %43 = load i32, i32* %.omp.ub, align 4, !dbg !126
  %44 = load i32, i32* %.omp.stride, align 4, !dbg !126
  %add26 = add nsw i32 %43, %44, !dbg !123
  store i32 %add26, i32* %.omp.ub, align 4, !dbg !123
  br label %omp.dispatch.cond, !dbg !136, !llvm.loop !160

omp.dispatch.end:                                 ; preds = %cond.end
  %45 = load i32*, i32** %.global_tid..addr, align 8, !dbg !136
  %46 = load i32, i32* %45, align 4, !dbg !136
  call void @__kmpc_for_static_fini(%struct.ident_t* @3, i32 %46), !dbg !159
  %47 = load i32*, i32** %.global_tid..addr, align 8, !dbg !136
  %48 = load i32, i32* %47, align 4, !dbg !136
  %49 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0, !dbg !136
  %50 = bitcast float* %rhs.begin to i8*, !dbg !136
  store i8* %50, i8** %49, align 8, !dbg !136
  %51 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*, !dbg !136
  %52 = call i32 @__kmpc_nvptx_parallel_reduce_nowait_v2(%struct.ident_t* @4, i32 %48, i32 1, i64 8, i8* %51, void (i8*, i16, i16, i16)* @_omp_reduction_shuffle_and_reduce_func, void (i8*, i32)* @_omp_reduction_inter_warp_copy_func), !dbg !136
  %53 = icmp eq i32 %52, 1, !dbg !136
  br i1 %53, label %.omp.reduction.then, label %.omp.reduction.done, !dbg !136

.omp.reduction.then:                              ; preds = %omp.dispatch.end
  %54 = getelementptr float, float* %arrayidx, i64 10000, !dbg !136
  %omp.arraycpy.isempty = icmp eq float* %arrayidx, %54, !dbg !136
  br i1 %omp.arraycpy.isempty, label %omp.arraycpy.done31, label %omp.arraycpy.body, !dbg !136

omp.arraycpy.body:                                ; preds = %omp.arraycpy.body, %.omp.reduction.then
  %omp.arraycpy.srcElementPast = phi float* [ %rhs.begin, %.omp.reduction.then ], [ %omp.arraycpy.src.element, %omp.arraycpy.body ], !dbg !136
  %omp.arraycpy.destElementPast27 = phi float* [ %arrayidx, %.omp.reduction.then ], [ %omp.arraycpy.dest.element29, %omp.arraycpy.body ], !dbg !136
  %55 = load float, float* %omp.arraycpy.destElementPast27, align 4, !dbg !130
  %56 = load float, float* %omp.arraycpy.srcElementPast, align 4, !dbg !130
  %add28 = fadd float %55, %56, !dbg !161
  store float %add28, float* %omp.arraycpy.destElementPast27, align 4, !dbg !161
  %omp.arraycpy.dest.element29 = getelementptr float, float* %omp.arraycpy.destElementPast27, i32 1, !dbg !136
  %omp.arraycpy.src.element = getelementptr float, float* %omp.arraycpy.srcElementPast, i32 1, !dbg !136
  %omp.arraycpy.done30 = icmp eq float* %omp.arraycpy.dest.element29, %54, !dbg !136
  br i1 %omp.arraycpy.done30, label %omp.arraycpy.done31, label %omp.arraycpy.body, !dbg !136

omp.arraycpy.done31:                              ; preds = %omp.arraycpy.body, %.omp.reduction.then
  call void @__kmpc_nvptx_end_reduce_nowait(i32 %48), !dbg !136
  br label %.omp.reduction.done, !dbg !136

.omp.reduction.done:                              ; preds = %omp.arraycpy.done31, %omp.dispatch.end
  ret void, !dbg !162
}

declare void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) #4

; Function Attrs: convergent noinline norecurse nounwind
define internal void @"_omp$reduction$reduction_func"(i8* %0, i8* %1) #0 !dbg !163 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !164, metadata !DIExpression()), !dbg !166
  store i8* %1, i8** %.addr1, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr1, metadata !167, metadata !DIExpression()), !dbg !166
  %2 = load i8*, i8** %.addr, align 8, !dbg !168
  %3 = bitcast i8* %2 to [1 x i8*]*, !dbg !168
  %4 = load i8*, i8** %.addr1, align 8, !dbg !168
  %5 = bitcast i8* %4 to [1 x i8*]*, !dbg !168
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0, !dbg !168
  %7 = load i8*, i8** %6, align 8, !dbg !168
  %8 = bitcast i8* %7 to float*, !dbg !168
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0, !dbg !168
  %10 = load i8*, i8** %9, align 8, !dbg !168
  %11 = bitcast i8* %10 to float*, !dbg !168
  %12 = getelementptr float, float* %11, i64 10000, !dbg !168
  %omp.arraycpy.isempty = icmp eq float* %11, %12, !dbg !168
  br i1 %omp.arraycpy.isempty, label %omp.arraycpy.done2, label %omp.arraycpy.body, !dbg !168

omp.arraycpy.body:                                ; preds = %omp.arraycpy.body, %entry
  %omp.arraycpy.srcElementPast = phi float* [ %8, %entry ], [ %omp.arraycpy.src.element, %omp.arraycpy.body ], !dbg !168
  %omp.arraycpy.destElementPast = phi float* [ %11, %entry ], [ %omp.arraycpy.dest.element, %omp.arraycpy.body ], !dbg !168
  %13 = load float, float* %omp.arraycpy.destElementPast, align 4, !dbg !169
  %14 = load float, float* %omp.arraycpy.srcElementPast, align 4, !dbg !169
  %add = fadd float %13, %14, !dbg !170
  store float %add, float* %omp.arraycpy.destElementPast, align 4, !dbg !170
  %omp.arraycpy.dest.element = getelementptr float, float* %omp.arraycpy.destElementPast, i32 1, !dbg !168
  %omp.arraycpy.src.element = getelementptr float, float* %omp.arraycpy.srcElementPast, i32 1, !dbg !168
  %omp.arraycpy.done = icmp eq float* %omp.arraycpy.dest.element, %12, !dbg !168
  br i1 %omp.arraycpy.done, label %omp.arraycpy.done2, label %omp.arraycpy.body, !dbg !168

omp.arraycpy.done2:                               ; preds = %omp.arraycpy.body, %entry
  ret void, !dbg !169
}

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_shuffle_and_reduce_func(i8* %0, i16 signext %1, i16 signext %2, i16 signext %3) #0 !dbg !171 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i16, align 2
  %.addr2 = alloca i16, align 2
  %.addr3 = alloca i16, align 2
  %.omp.reduction.remote_reduce_list = alloca [1 x i8*], align 8
  %.omp.reduction.element = alloca [10000 x float], align 4
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !172, metadata !DIExpression()), !dbg !173
  store i16 %1, i16* %.addr1, align 2
  call void @llvm.dbg.declare(metadata i16* %.addr1, metadata !174, metadata !DIExpression()), !dbg !173
  store i16 %2, i16* %.addr2, align 2
  call void @llvm.dbg.declare(metadata i16* %.addr2, metadata !176, metadata !DIExpression()), !dbg !173
  store i16 %3, i16* %.addr3, align 2
  call void @llvm.dbg.declare(metadata i16* %.addr3, metadata !177, metadata !DIExpression()), !dbg !173
  %4 = load i8*, i8** %.addr, align 8, !dbg !178
  %5 = bitcast i8* %4 to [1 x i8*]*, !dbg !178
  %6 = load i16, i16* %.addr1, align 2, !dbg !178
  %7 = load i16, i16* %.addr2, align 2, !dbg !178
  %8 = load i16, i16* %.addr3, align 2, !dbg !178
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0, !dbg !178
  %10 = load i8*, i8** %9, align 8, !dbg !178
  %11 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.remote_reduce_list, i64 0, i64 0, !dbg !178
  %12 = bitcast i8* %10 to [10000 x float]*, !dbg !178
  %13 = getelementptr [10000 x float], [10000 x float]* %12, i64 1, !dbg !178
  %14 = bitcast [10000 x float]* %13 to i8*, !dbg !178
  %15 = bitcast [10000 x float]* %12 to i64*, !dbg !178
  %16 = bitcast [10000 x float]* %.omp.reduction.element to i64*, !dbg !178
  br label %.shuffle.pre_cond, !dbg !178

.shuffle.pre_cond:                                ; preds = %.shuffle.then, %entry
  %17 = phi i64* [ %15, %entry ], [ %28, %.shuffle.then ], !dbg !178
  %18 = phi i64* [ %16, %entry ], [ %29, %.shuffle.then ], !dbg !178
  %19 = bitcast i64* %17 to i8*, !dbg !178
  %20 = ptrtoint i8* %14 to i64, !dbg !178
  %21 = ptrtoint i8* %19 to i64, !dbg !178
  %22 = sub i64 %20, %21, !dbg !178
  %23 = sdiv exact i64 %22, ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i64), !dbg !178
  %24 = icmp sgt i64 %23, 7, !dbg !178
  br i1 %24, label %.shuffle.then, label %.shuffle.exit, !dbg !178

.shuffle.then:                                    ; preds = %.shuffle.pre_cond
  %25 = load i64, i64* %17, align 4, !dbg !178
  %nvptx_warp_size = call i32 @llvm.nvvm.read.ptx.sreg.warpsize(), !dbg !178
  %26 = trunc i32 %nvptx_warp_size to i16, !dbg !178
  %27 = call i64 @__kmpc_shuffle_int64(i64 %25, i16 %7, i16 %26), !dbg !178
  store i64 %27, i64* %18, align 4, !dbg !178
  %28 = getelementptr i64, i64* %17, i64 1, !dbg !178
  %29 = getelementptr i64, i64* %18, i64 1, !dbg !178
  br label %.shuffle.pre_cond, !dbg !178

.shuffle.exit:                                    ; preds = %.shuffle.pre_cond
  %30 = bitcast [10000 x float]* %.omp.reduction.element to i8*, !dbg !178
  store i8* %30, i8** %11, align 8, !dbg !178
  %31 = icmp eq i16 %8, 0, !dbg !178
  %32 = icmp eq i16 %8, 1, !dbg !178
  %33 = icmp ult i16 %6, %7, !dbg !178
  %34 = and i1 %32, %33, !dbg !178
  %35 = icmp eq i16 %8, 2, !dbg !178
  %36 = and i16 %6, 1, !dbg !178
  %37 = icmp eq i16 %36, 0, !dbg !178
  %38 = and i1 %35, %37, !dbg !178
  %39 = icmp sgt i16 %7, 0, !dbg !178
  %40 = and i1 %38, %39, !dbg !178
  %41 = or i1 %31, %34, !dbg !178
  %42 = or i1 %41, %40, !dbg !178
  br i1 %42, label %then, label %else, !dbg !178

then:                                             ; preds = %.shuffle.exit
  %43 = bitcast [1 x i8*]* %5 to i8*, !dbg !178
  %44 = bitcast [1 x i8*]* %.omp.reduction.remote_reduce_list to i8*, !dbg !178
  call void @"_omp$reduction$reduction_func"(i8* %43, i8* %44) #4, !dbg !178
  br label %ifcont, !dbg !178

else:                                             ; preds = %.shuffle.exit
  br label %ifcont, !dbg !178

ifcont:                                           ; preds = %else, %then
  %45 = icmp eq i16 %8, 1, !dbg !178
  %46 = icmp uge i16 %6, %7, !dbg !178
  %47 = and i1 %45, %46, !dbg !178
  br i1 %47, label %then4, label %else5, !dbg !178

then4:                                            ; preds = %ifcont
  %48 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.remote_reduce_list, i64 0, i64 0, !dbg !178
  %49 = load i8*, i8** %48, align 8, !dbg !178
  %50 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0, !dbg !178
  %51 = load i8*, i8** %50, align 8, !dbg !178
  %52 = bitcast i8* %49 to [10000 x float]*, !dbg !178
  %53 = bitcast i8* %51 to [10000 x float]*, !dbg !178
  %54 = bitcast [10000 x float]* %53 to i8*, !dbg !178
  %55 = bitcast [10000 x float]* %52 to i8*, !dbg !178
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %54, i8* align 4 %55, i64 40000, i1 false), !dbg !178
  br label %ifcont6, !dbg !178

else5:                                            ; preds = %ifcont
  br label %ifcont6, !dbg !178

ifcont6:                                          ; preds = %else5, %then4
  ret void, !dbg !178
}

declare i64 @__kmpc_shuffle_int64(i64, i16, i16)

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_inter_warp_copy_func(i8* %0, i32 %1) #0 !dbg !179 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i32, align 4
  %.cnt.addr = alloca i32, align 4
  %2 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @7)
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !180, metadata !DIExpression()), !dbg !181
  store i32 %1, i32* %.addr1, align 4
  call void @llvm.dbg.declare(metadata i32* %.addr1, metadata !182, metadata !DIExpression()), !dbg !181
  %nvptx_tid = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !183
  %nvptx_tid2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !183
  %nvptx_lane_id = and i32 %nvptx_tid2, 31, !dbg !183
  %nvptx_tid3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !183
  %nvptx_warp_id = ashr i32 %nvptx_tid3, 5, !dbg !183
  %3 = load i8*, i8** %.addr, align 8, !dbg !183
  %4 = bitcast i8* %3 to [1 x i8*]*, !dbg !183
  store i32 0, i32* %.cnt.addr, align 4, !dbg !183
  br label %precond, !dbg !183

precond:                                          ; preds = %ifcont6, %entry
  %5 = load i32, i32* %.cnt.addr, align 4, !dbg !183
  %6 = icmp ult i32 %5, 10000, !dbg !183
  br i1 %6, label %body, label %exit, !dbg !183

body:                                             ; preds = %precond
  call void @__kmpc_barrier(%struct.ident_t* @6, i32 %2), !dbg !183
  %warp_master = icmp eq i32 %nvptx_lane_id, 0, !dbg !183
  br i1 %warp_master, label %then, label %else, !dbg !183

then:                                             ; preds = %body
  %7 = getelementptr inbounds [1 x i8*], [1 x i8*]* %4, i64 0, i64 0, !dbg !183
  %8 = load i8*, i8** %7, align 8, !dbg !183
  %9 = bitcast i8* %8 to i32*, !dbg !183
  %10 = getelementptr i32, i32* %9, i32 %5, !dbg !183
  %11 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @__openmp_nvptx_data_transfer_temporary_storage, i64 0, i32 %nvptx_warp_id, !dbg !183
  %12 = load i32, i32* %10, align 4, !dbg !183
  store volatile i32 %12, i32 addrspace(3)* %11, align 4, !dbg !183
  br label %ifcont, !dbg !183

else:                                             ; preds = %body
  br label %ifcont, !dbg !183

ifcont:                                           ; preds = %else, %then
  call void @__kmpc_barrier(%struct.ident_t* @6, i32 %2), !dbg !183
  %13 = load i32, i32* %.addr1, align 4, !dbg !183
  %is_active_thread = icmp ult i32 %nvptx_tid, %13, !dbg !183
  br i1 %is_active_thread, label %then4, label %else5, !dbg !183

then4:                                            ; preds = %ifcont
  %14 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @__openmp_nvptx_data_transfer_temporary_storage, i64 0, i32 %nvptx_tid, !dbg !183
  %15 = getelementptr inbounds [1 x i8*], [1 x i8*]* %4, i64 0, i64 0, !dbg !183
  %16 = load i8*, i8** %15, align 8, !dbg !183
  %17 = bitcast i8* %16 to i32*, !dbg !183
  %18 = getelementptr i32, i32* %17, i32 %5, !dbg !183
  %19 = load volatile i32, i32 addrspace(3)* %14, align 4, !dbg !183
  store i32 %19, i32* %18, align 4, !dbg !183
  br label %ifcont6, !dbg !183

else5:                                            ; preds = %ifcont
  br label %ifcont6, !dbg !183

ifcont6:                                          ; preds = %else5, %then4
  %20 = add nsw i32 %5, 1, !dbg !183
  store i32 %20, i32* %.cnt.addr, align 4, !dbg !183
  br label %precond, !dbg !183

exit:                                             ; preds = %precond
  ret void, !dbg !183
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(%struct.ident_t*) #4

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(%struct.ident_t*, i32) #6

declare i32 @__kmpc_nvptx_parallel_reduce_nowait_v2(%struct.ident_t*, i32, i32, i64, i8*, void (i8*, i16, i16, i16)*, void (i8*, i32)*)

declare void @__kmpc_nvptx_end_reduce_nowait(i32)

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined__(i32* noalias %.global_tid., i32* noalias %.bound_tid., float* %C, i32* nonnull align 4 dereferenceable(4) %i, i32* nonnull align 4 dereferenceable(4) %j, float** nonnull align 8 dereferenceable(8) %A, float** nonnull align 8 dereferenceable(8) %B) #1 !dbg !184 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float*, align 8
  %i.addr = alloca i32*, align 8
  %j.addr = alloca i32*, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !189, metadata !DIExpression()), !dbg !190
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !191, metadata !DIExpression()), !dbg !190
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !192, metadata !DIExpression()), !dbg !190
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !193, metadata !DIExpression()), !dbg !190
  store i32* %j, i32** %j.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %j.addr, metadata !194, metadata !DIExpression()), !dbg !190
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !195, metadata !DIExpression()), !dbg !190
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !196, metadata !DIExpression()), !dbg !190
  %0 = load i32*, i32** %i.addr, align 8, !dbg !197
  %1 = load i32*, i32** %j.addr, align 8, !dbg !197
  %2 = load float**, float*** %A.addr, align 8, !dbg !197
  %3 = load float**, float*** %B.addr, align 8, !dbg !197
  %4 = load i32*, i32** %.global_tid..addr, align 8, !dbg !197
  %5 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !197
  %6 = load float*, float** %C.addr, align 8, !dbg !197
  %7 = load i32*, i32** %i.addr, align 8, !dbg !197
  %8 = load i32*, i32** %j.addr, align 8, !dbg !197
  %9 = load float**, float*** %A.addr, align 8, !dbg !197
  %10 = load float**, float*** %B.addr, align 8, !dbg !197
  call void @__omp_outlined___debug__1(i32* %4, i32* %5, float* %6, i32* %7, i32* %8, float** %9, float** %10) #4, !dbg !197
  ret void, !dbg !197
}

; Function Attrs: convergent noinline norecurse nounwind
define internal void @__omp_outlined___wrapper(i16 zeroext %0, i32 %1) #0 !dbg !198 {
entry:
  %.addr = alloca i16, align 2
  %.addr1 = alloca i32, align 4
  %.zero.addr = alloca i32, align 4
  %global_args = alloca i8**, align 8
  store i32 0, i32* %.zero.addr, align 4
  store i16 %0, i16* %.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %.addr, metadata !199, metadata !DIExpression()), !dbg !201
  store i32 %1, i32* %.addr1, align 4
  call void @llvm.dbg.declare(metadata i32* %.addr1, metadata !202, metadata !DIExpression()), !dbg !201
  call void @__kmpc_get_shared_variables(i8*** %global_args), !dbg !204
  %2 = load i8**, i8*** %global_args, align 8, !dbg !204
  %3 = getelementptr inbounds i8*, i8** %2, i64 0, !dbg !204
  %4 = bitcast i8** %3 to float**, !dbg !204
  %5 = load float*, float** %4, align 8, !dbg !204
  %6 = getelementptr inbounds i8*, i8** %2, i64 1, !dbg !204
  %7 = bitcast i8** %6 to i32**, !dbg !204
  %8 = load i32*, i32** %7, align 8, !dbg !204
  %9 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !204
  %10 = bitcast i8** %9 to i32**, !dbg !204
  %11 = load i32*, i32** %10, align 8, !dbg !204
  %12 = getelementptr inbounds i8*, i8** %2, i64 3, !dbg !204
  %13 = bitcast i8** %12 to float***, !dbg !204
  %14 = load float**, float*** %13, align 8, !dbg !204
  %15 = getelementptr inbounds i8*, i8** %2, i64 4, !dbg !204
  %16 = bitcast i8** %15 to float***, !dbg !204
  %17 = load float**, float*** %16, align 8, !dbg !204
  call void @__omp_outlined__(i32* %.addr1, i32* %.zero.addr, float* %5, i32* %8, i32* %11, float** %14, float** %17) #4, !dbg !204
  ret void, !dbg !204
}

declare void @__kmpc_get_shared_variables(i8***)

declare void @__kmpc_parallel_51(%struct.ident_t*, i32, i32, i32, i32, i8*, i8*, i8**, i64)

; Function Attrs: nounwind
declare void @__kmpc_free_shared(i8* nocapture) #4

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined__2(i32* noalias %.global_tid., i32* noalias %.bound_tid., float* %C, float* %Cinit, float* %A, float* %B) #1 !dbg !205 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !206, metadata !DIExpression()), !dbg !207
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !208, metadata !DIExpression()), !dbg !207
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !209, metadata !DIExpression()), !dbg !207
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !210, metadata !DIExpression()), !dbg !207
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !211, metadata !DIExpression()), !dbg !207
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !212, metadata !DIExpression()), !dbg !207
  %0 = load i32*, i32** %.global_tid..addr, align 8, !dbg !213
  %1 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !213
  %2 = load float*, float** %C.addr, align 8, !dbg !213
  %3 = load float*, float** %Cinit.addr, align 8, !dbg !213
  %4 = load float*, float** %A.addr, align 8, !dbg !213
  %5 = load float*, float** %B.addr, align 8, !dbg !213
  call void @__omp_outlined___debug__(i32* %0, i32* %1, float* %2, float* %3, float* %4, float* %5) #4, !dbg !213
  ret void, !dbg !213
}

declare void @__kmpc_kernel_deinit(i16)

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier_simple_spmd(%struct.ident_t*, i32) #6

; Function Attrs: convergent noinline norecurse nounwind optnone
define weak void @__omp_offloading_32_82eb324_gemm_OMP_l56(float* %C, float* %Cinit, float* %A, float* %B) #1 !dbg !214 {
entry:
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !215, metadata !DIExpression()), !dbg !216
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !217, metadata !DIExpression()), !dbg !216
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !218, metadata !DIExpression()), !dbg !216
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !219, metadata !DIExpression()), !dbg !216
  %0 = load float*, float** %C.addr, align 8, !dbg !220
  %1 = load float*, float** %Cinit.addr, align 8, !dbg !220
  %2 = load float*, float** %A.addr, align 8, !dbg !220
  %3 = load float*, float** %B.addr, align 8, !dbg !220
  call void @__omp_offloading_32_82eb324_gemm_OMP_l56_debug__(float* %0, float* %1, float* %2, float* %3) #4, !dbg !220
  ret void, !dbg !220
}

declare i1 @__kmpc_kernel_parallel(i8**)

declare void @__kmpc_kernel_end_parallel()

attributes #0 = { convergent noinline norecurse nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_70" "target-features"="+ptx32,+sm_70" }
attributes #1 = { convergent noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_70" "target-features"="+ptx32,+sm_70" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { convergent nounwind }

!llvm.dbg.cu = !{!0}
!omp_offload.info = !{!3}
!nvvm.annotations = !{!4}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "src/debug.c", directory: "/gpfs/jlse-fs0/users/dstfvrt/anl_jlse/gemm")
!2 = !{}
!3 = !{i32 0, i32 50, i32 137278244, !"gemm_OMP", i32 56, i32 0}
!4 = !{void (float*, float*, float*, float*)* @__omp_offloading_32_82eb324_gemm_OMP_l56, !"kernel", i32 1}
!5 = !{i32 7, !"Dwarf Version", i32 2}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"openmp", i32 50}
!9 = !{i32 7, !"openmp-device", i32 50}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(linkageName: "__omp_offloading_32_82eb324_gemm_OMP_l56_worker", scope: !1, file: !1, line: 56, type: !14, scopeLine: 56, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DISubroutineType(types: !2)
!15 = !DILocation(line: 56, column: 3, scope: !13)
!16 = distinct !DISubprogram(name: "__omp_offloading_32_82eb324_gemm_OMP_l56_debug__", scope: !1, file: !1, line: 57, type: !17, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19, !22, !19, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "DATA_TYPE", file: !1, line: 36, baseType: !21)
!21 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !20)
!24 = !DILocalVariable(name: "C", arg: 1, scope: !16, file: !1, line: 53, type: !19)
!25 = !DILocation(line: 53, column: 25, scope: !16)
!26 = !DILocalVariable(name: "Cinit", arg: 2, scope: !16, file: !1, line: 53, type: !22)
!27 = !DILocation(line: 53, column: 56, scope: !16)
!28 = !DILocalVariable(name: "A", arg: 3, scope: !16, file: !1, line: 52, type: !19)
!29 = !DILocation(line: 52, column: 25, scope: !16)
!30 = !DILocalVariable(name: "B", arg: 4, scope: !16, file: !1, line: 52, type: !19)
!31 = !DILocation(line: 52, column: 47, scope: !16)
!32 = !DILocation(line: 57, column: 3, scope: !16)
!33 = !DILocation(line: 56, column: 3, scope: !16)
!34 = !DILocation(line: 56, column: 3, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !1, line: 56, column: 3)
!36 = !DILocation(line: 56, column: 107, scope: !35)
!37 = !DILocation(line: 65, column: 3, scope: !16)
!38 = distinct !DISubprogram(name: "__omp_outlined___debug__", scope: !1, file: !1, line: 57, type: !39, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !41, !41, !19, !22, !19, !19}
!41 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!42 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !38, type: !41, flags: DIFlagArtificial)
!47 = !DILocation(line: 0, scope: !38)
!48 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !38, type: !41, flags: DIFlagArtificial)
!49 = !DILocalVariable(name: "C", arg: 3, scope: !38, file: !1, line: 53, type: !19)
!50 = !DILocation(line: 53, column: 25, scope: !38)
!51 = !DILocalVariable(name: "Cinit", arg: 4, scope: !38, file: !1, line: 53, type: !22)
!52 = !DILocation(line: 53, column: 56, scope: !38)
!53 = !DILocalVariable(name: "A", arg: 5, scope: !38, file: !1, line: 52, type: !19)
!54 = !DILocation(line: 52, column: 25, scope: !38)
!55 = !DILocalVariable(name: "B", arg: 6, scope: !38, file: !1, line: 52, type: !19)
!56 = !DILocation(line: 52, column: 47, scope: !38)
!57 = !DILocation(line: 57, column: 12, scope: !38)
!58 = !DILocation(line: 57, column: 3, scope: !38)
!59 = !DILocation(line: 58, column: 14, scope: !38)
!60 = !DILocalVariable(name: "i", scope: !61, file: !1, line: 57, type: !45)
!61 = distinct !DILexicalBlock(scope: !38, file: !1, line: 57, column: 3)
!62 = !DILocation(line: 57, column: 12, scope: !61)
!63 = !DILocation(line: 57, column: 8, scope: !61)
!64 = !DILocation(line: 57, column: 19, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 57, column: 3)
!66 = !DILocation(line: 57, column: 21, scope: !65)
!67 = !DILocation(line: 57, column: 3, scope: !61)
!68 = !DILocalVariable(name: "j", scope: !69, file: !1, line: 58, type: !45)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 58, column: 5)
!70 = distinct !DILexicalBlock(scope: !65, file: !1, line: 57, column: 32)
!71 = !DILocation(line: 58, column: 14, scope: !69)
!72 = !DILocation(line: 58, column: 10, scope: !69)
!73 = !DILocation(line: 58, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 58, column: 5)
!75 = !DILocation(line: 58, column: 23, scope: !74)
!76 = !DILocation(line: 58, column: 5, scope: !69)
!77 = !DILocation(line: 59, column: 23, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 58, column: 34)
!79 = !DILocation(line: 59, column: 29, scope: !78)
!80 = !DILocation(line: 59, column: 31, scope: !78)
!81 = !DILocation(line: 59, column: 38, scope: !78)
!82 = !DILocation(line: 59, column: 36, scope: !78)
!83 = !DILocation(line: 59, column: 41, scope: !78)
!84 = !DILocation(line: 59, column: 7, scope: !78)
!85 = !DILocation(line: 59, column: 9, scope: !78)
!86 = !DILocation(line: 59, column: 11, scope: !78)
!87 = !DILocation(line: 59, column: 18, scope: !78)
!88 = !DILocation(line: 59, column: 16, scope: !78)
!89 = !DILocation(line: 59, column: 21, scope: !78)
!90 = !DILocation(line: 60, column: 1, scope: !78)
!91 = !DILocation(line: 64, column: 5, scope: !78)
!92 = !DILocation(line: 58, column: 30, scope: !74)
!93 = !DILocation(line: 58, column: 5, scope: !74)
!94 = distinct !{!94, !76, !95, !96}
!95 = !DILocation(line: 64, column: 5, scope: !69)
!96 = !{!"llvm.loop.mustprogress"}
!97 = !DILocation(line: 65, column: 3, scope: !70)
!98 = !DILocation(line: 57, column: 28, scope: !65)
!99 = !DILocation(line: 57, column: 3, scope: !65)
!100 = distinct !{!100, !67, !101, !96}
!101 = !DILocation(line: 65, column: 3, scope: !61)
!102 = !DILocation(line: 65, column: 3, scope: !38)
!103 = distinct !DISubprogram(name: "__omp_outlined___debug__1", scope: !1, file: !1, line: 61, type: !104, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{null, !41, !41, !19, !106, !106, !108, !108}
!106 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !107)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !109)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!110 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !103, type: !41, flags: DIFlagArtificial)
!111 = !DILocation(line: 0, scope: !103)
!112 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !103, type: !41, flags: DIFlagArtificial)
!113 = !DILocalVariable(name: "C", arg: 3, scope: !103, file: !1, line: 53, type: !19)
!114 = !DILocation(line: 53, column: 25, scope: !103)
!115 = !DILocalVariable(name: "i", arg: 4, scope: !103, file: !1, line: 57, type: !106)
!116 = !DILocation(line: 57, column: 12, scope: !103)
!117 = !DILocalVariable(name: "j", arg: 5, scope: !103, file: !1, line: 58, type: !106)
!118 = !DILocation(line: 58, column: 14, scope: !103)
!119 = !DILocalVariable(name: "A", arg: 6, scope: !103, file: !1, line: 52, type: !108)
!120 = !DILocation(line: 52, column: 25, scope: !103)
!121 = !DILocalVariable(name: "B", arg: 7, scope: !103, file: !1, line: 52, type: !108)
!122 = !DILocation(line: 52, column: 47, scope: !103)
!123 = !DILocation(line: 61, column: 7, scope: !103)
!124 = !DILocalVariable(name: ".omp.iv", scope: !103, type: !45, flags: DIFlagArtificial)
!125 = !DILocalVariable(name: ".omp.lb", scope: !103, type: !45, flags: DIFlagArtificial)
!126 = !DILocation(line: 61, column: 12, scope: !103)
!127 = !DILocalVariable(name: ".omp.ub", scope: !103, type: !45, flags: DIFlagArtificial)
!128 = !DILocalVariable(name: ".omp.stride", scope: !103, type: !45, flags: DIFlagArtificial)
!129 = !DILocalVariable(name: ".omp.is_last", scope: !103, type: !45, flags: DIFlagArtificial)
!130 = !DILocation(line: 60, column: 38, scope: !103)
!131 = !DILocalVariable(name: "C", scope: !103, type: !132, flags: DIFlagArtificial)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 320000, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 10000)
!135 = !DILocalVariable(name: "k", scope: !103, type: !45, flags: DIFlagArtificial)
!136 = !DILocation(line: 60, column: 1, scope: !103)
!137 = !DILocation(line: 61, column: 31, scope: !103)
!138 = !DILocation(line: 62, column: 34, scope: !139)
!139 = distinct !DILexicalBlock(scope: !103, file: !1, line: 61, column: 36)
!140 = !DILocation(line: 62, column: 36, scope: !139)
!141 = !DILocation(line: 62, column: 38, scope: !139)
!142 = !DILocation(line: 62, column: 45, scope: !139)
!143 = !DILocation(line: 62, column: 43, scope: !139)
!144 = !DILocation(line: 62, column: 32, scope: !139)
!145 = !DILocation(line: 62, column: 50, scope: !139)
!146 = !DILocation(line: 62, column: 52, scope: !139)
!147 = !DILocation(line: 62, column: 54, scope: !139)
!148 = !DILocation(line: 62, column: 61, scope: !139)
!149 = !DILocation(line: 62, column: 59, scope: !139)
!150 = !DILocation(line: 62, column: 48, scope: !139)
!151 = !DILocation(line: 62, column: 9, scope: !139)
!152 = !DILocation(line: 62, column: 11, scope: !139)
!153 = !DILocation(line: 62, column: 13, scope: !139)
!154 = !DILocation(line: 62, column: 20, scope: !139)
!155 = !DILocation(line: 62, column: 18, scope: !139)
!156 = !DILocation(line: 62, column: 23, scope: !139)
!157 = !DILocation(line: 63, column: 7, scope: !139)
!158 = distinct !{!158, !136, !159}
!159 = !DILocation(line: 60, column: 51, scope: !103)
!160 = distinct !{!160, !136, !159}
!161 = !DILocation(line: 60, column: 36, scope: !103)
!162 = !DILocation(line: 63, column: 7, scope: !103)
!163 = distinct !DISubprogram(linkageName: "_omp$reduction$reduction_func", scope: !1, file: !1, line: 60, type: !14, scopeLine: 60, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!164 = !DILocalVariable(arg: 1, scope: !163, type: !165, flags: DIFlagArtificial)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!166 = !DILocation(line: 0, scope: !163)
!167 = !DILocalVariable(arg: 2, scope: !163, type: !165, flags: DIFlagArtificial)
!168 = !DILocation(line: 60, column: 51, scope: !163)
!169 = !DILocation(line: 60, column: 38, scope: !163)
!170 = !DILocation(line: 60, column: 36, scope: !163)
!171 = distinct !DISubprogram(linkageName: "_omp_reduction_shuffle_and_reduce_func", scope: !1, file: !1, line: 60, type: !14, scopeLine: 60, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!172 = !DILocalVariable(arg: 1, scope: !171, type: !165, flags: DIFlagArtificial)
!173 = !DILocation(line: 0, scope: !171)
!174 = !DILocalVariable(arg: 2, scope: !171, type: !175, flags: DIFlagArtificial)
!175 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!176 = !DILocalVariable(arg: 3, scope: !171, type: !175, flags: DIFlagArtificial)
!177 = !DILocalVariable(arg: 4, scope: !171, type: !175, flags: DIFlagArtificial)
!178 = !DILocation(line: 60, column: 51, scope: !171)
!179 = distinct !DISubprogram(linkageName: "_omp_reduction_inter_warp_copy_func", scope: !1, file: !1, line: 60, type: !14, scopeLine: 60, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!180 = !DILocalVariable(arg: 1, scope: !179, type: !165, flags: DIFlagArtificial)
!181 = !DILocation(line: 0, scope: !179)
!182 = !DILocalVariable(arg: 2, scope: !179, type: !45, flags: DIFlagArtificial)
!183 = !DILocation(line: 60, column: 51, scope: !179)
!184 = distinct !DISubprogram(name: "__omp_outlined__", scope: !1, file: !1, line: 60, type: !185, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!185 = !DISubroutineType(types: !186)
!186 = !{null, !41, !41, !19, !187, !187, !188, !188}
!187 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !45, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !19, size: 64)
!189 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !184, type: !41, flags: DIFlagArtificial)
!190 = !DILocation(line: 0, scope: !184)
!191 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !184, type: !41, flags: DIFlagArtificial)
!192 = !DILocalVariable(name: "C", arg: 3, scope: !184, type: !19, flags: DIFlagArtificial)
!193 = !DILocalVariable(name: "i", arg: 4, scope: !184, type: !187, flags: DIFlagArtificial)
!194 = !DILocalVariable(name: "j", arg: 5, scope: !184, type: !187, flags: DIFlagArtificial)
!195 = !DILocalVariable(name: "A", arg: 6, scope: !184, type: !188, flags: DIFlagArtificial)
!196 = !DILocalVariable(name: "B", arg: 7, scope: !184, type: !188, flags: DIFlagArtificial)
!197 = !DILocation(line: 60, column: 1, scope: !184)
!198 = distinct !DISubprogram(linkageName: "__omp_outlined___wrapper", scope: !1, file: !1, line: 60, type: !14, scopeLine: 60, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!199 = !DILocalVariable(arg: 1, scope: !198, type: !200, flags: DIFlagArtificial)
!200 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!201 = !DILocation(line: 0, scope: !198)
!202 = !DILocalVariable(arg: 2, scope: !198, type: !203, flags: DIFlagArtificial)
!203 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!204 = !DILocation(line: 60, column: 1, scope: !198)
!205 = distinct !DISubprogram(name: "__omp_outlined__2", scope: !1, file: !1, line: 56, type: !39, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!206 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !205, type: !41, flags: DIFlagArtificial)
!207 = !DILocation(line: 0, scope: !205)
!208 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !205, type: !41, flags: DIFlagArtificial)
!209 = !DILocalVariable(name: "C", arg: 3, scope: !205, type: !19, flags: DIFlagArtificial)
!210 = !DILocalVariable(name: "Cinit", arg: 4, scope: !205, type: !22, flags: DIFlagArtificial)
!211 = !DILocalVariable(name: "A", arg: 5, scope: !205, type: !19, flags: DIFlagArtificial)
!212 = !DILocalVariable(name: "B", arg: 6, scope: !205, type: !19, flags: DIFlagArtificial)
!213 = !DILocation(line: 56, column: 3, scope: !205)
!214 = distinct !DISubprogram(name: "__omp_offloading_32_82eb324_gemm_OMP_l56", scope: !1, file: !1, line: 56, type: !17, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!215 = !DILocalVariable(name: "C", arg: 1, scope: !214, type: !19, flags: DIFlagArtificial)
!216 = !DILocation(line: 0, scope: !214)
!217 = !DILocalVariable(name: "Cinit", arg: 2, scope: !214, type: !22, flags: DIFlagArtificial)
!218 = !DILocalVariable(name: "A", arg: 3, scope: !214, type: !19, flags: DIFlagArtificial)
!219 = !DILocalVariable(name: "B", arg: 4, scope: !214, type: !19, flags: DIFlagArtificial)
!220 = !DILocation(line: 56, column: 3, scope: !214)

; __CLANG_OFFLOAD_BUNDLE____END__ openmp-nvptx64

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = '/tmp/debug-030b76.bc'
source_filename = "src/debug.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__tgt_offload_entry = type { i8*, i8*, i64, i32, i32 }
%struct.timezone = type { i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@0 = private unnamed_addr constant [29 x i8] c";src/debug.c;gemm_OMP;60;1;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant [30 x i8] c";src/debug.c;gemm_OMP;60;51;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @2, i32 0, i32 0) }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 18, i32 0, i32 0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @2, i32 0, i32 0) }, align 8
@5 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @0, i32 0, i32 0) }, align 8
@6 = private unnamed_addr constant [29 x i8] c";src/debug.c;gemm_OMP;56;3;;\00", align 1
@7 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @6, i32 0, i32 0) }, align 8
@.__omp_offloading_32_82eb324_gemm_OMP_l56.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [4 x i64] [i64 40000, i64 40000, i64 40000, i64 40000]
@.offload_maptypes = private unnamed_addr constant [4 x i64] [i64 34, i64 33, i64 33, i64 33]
@8 = private unnamed_addr constant [35 x i8] c";C[:100 * 100];src/debug.c;53;25;;\00", align 1
@9 = private unnamed_addr constant [39 x i8] c";Cinit[:100 * 100];src/debug.c;53;56;;\00", align 1
@10 = private unnamed_addr constant [35 x i8] c";A[:100 * 100];src/debug.c;52;25;;\00", align 1
@11 = private unnamed_addr constant [35 x i8] c";B[:100 * 100];src/debug.c;52;47;;\00", align 1
@.offload_mapnames = private constant [4 x i8*] [i8* getelementptr inbounds ([35 x i8], [35 x i8]* @8, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @9, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @10, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @11, i32 0, i32 0)]
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [11 x i8] c"%f != %f \0A\00", align 1
@.str.4 = private unnamed_addr constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@.omp_offloading.entry_name = internal unnamed_addr constant [41 x i8] c"__omp_offloading_32_82eb324_gemm_OMP_l56\00"
@.omp_offloading.entry.__omp_offloading_32_82eb324_gemm_OMP_l56 = weak constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_32_82eb324_gemm_OMP_l56.region_id, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.omp_offloading.entry_name, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
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
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !189, metadata !DIExpression()), !dbg !190
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !191, metadata !DIExpression()), !dbg !192
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !193, metadata !DIExpression()), !dbg !194
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !195, metadata !DIExpression()), !dbg !196
  %0 = load float*, float** %C.addr, align 8, !dbg !197
  %1 = load float*, float** %Cinit.addr, align 8, !dbg !197
  %2 = load float*, float** %A.addr, align 8, !dbg !197
  %3 = load float*, float** %B.addr, align 8, !dbg !197
  %4 = load float*, float** %C.addr, align 8, !dbg !197
  %5 = load float*, float** %C.addr, align 8, !dbg !198
  %arrayidx = getelementptr inbounds float, float* %5, i64 0, !dbg !198
  %6 = load float*, float** %Cinit.addr, align 8, !dbg !197
  %7 = load float*, float** %Cinit.addr, align 8, !dbg !200
  %arrayidx1 = getelementptr inbounds float, float* %7, i64 0, !dbg !200
  %8 = load float*, float** %A.addr, align 8, !dbg !197
  %9 = load float*, float** %A.addr, align 8, !dbg !201
  %arrayidx2 = getelementptr inbounds float, float* %9, i64 0, !dbg !201
  %10 = load float*, float** %B.addr, align 8, !dbg !197
  %11 = load float*, float** %B.addr, align 8, !dbg !202
  %arrayidx3 = getelementptr inbounds float, float* %11, i64 0, !dbg !202
  %12 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 0, !dbg !197
  %13 = bitcast i8** %12 to float**, !dbg !197
  store float* %4, float** %13, align 8, !dbg !197
  %14 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 0, !dbg !197
  %15 = bitcast i8** %14 to float**, !dbg !197
  store float* %arrayidx, float** %15, align 8, !dbg !197
  %16 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_mappers, i64 0, i64 0, !dbg !197
  store i8* null, i8** %16, align 8, !dbg !197
  %17 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 1, !dbg !197
  %18 = bitcast i8** %17 to float**, !dbg !197
  store float* %6, float** %18, align 8, !dbg !197
  %19 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 1, !dbg !197
  %20 = bitcast i8** %19 to float**, !dbg !197
  store float* %arrayidx1, float** %20, align 8, !dbg !197
  %21 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_mappers, i64 0, i64 1, !dbg !197
  store i8* null, i8** %21, align 8, !dbg !197
  %22 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 2, !dbg !197
  %23 = bitcast i8** %22 to float**, !dbg !197
  store float* %8, float** %23, align 8, !dbg !197
  %24 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 2, !dbg !197
  %25 = bitcast i8** %24 to float**, !dbg !197
  store float* %arrayidx2, float** %25, align 8, !dbg !197
  %26 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_mappers, i64 0, i64 2, !dbg !197
  store i8* null, i8** %26, align 8, !dbg !197
  %27 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 3, !dbg !197
  %28 = bitcast i8** %27 to float**, !dbg !197
  store float* %10, float** %28, align 8, !dbg !197
  %29 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 3, !dbg !197
  %30 = bitcast i8** %29 to float**, !dbg !197
  store float* %arrayidx3, float** %30, align 8, !dbg !197
  %31 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_mappers, i64 0, i64 3, !dbg !197
  store i8* null, i8** %31, align 8, !dbg !197
  %32 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_baseptrs, i32 0, i32 0, !dbg !197
  %33 = getelementptr inbounds [4 x i8*], [4 x i8*]* %.offload_ptrs, i32 0, i32 0, !dbg !197
  %34 = call i32 @__tgt_target_teams_mapper(%struct.ident_t* @7, i64 -1, i8* @.__omp_offloading_32_82eb324_gemm_OMP_l56.region_id, i32 4, i8** %32, i8** %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @.offload_sizes, i32 0, i32 0), i64* getelementptr inbounds ([4 x i64], [4 x i64]* @.offload_maptypes, i32 0, i32 0), i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @.offload_mapnames, i32 0, i32 0), i8** null, i32 0, i32 0), !dbg !197
  %35 = icmp ne i32 %34, 0, !dbg !197
  br i1 %35, label %omp_offload.failed, label %omp_offload.cont, !dbg !197

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_32_82eb324_gemm_OMP_l56(float* %0, float* %1, float* %2, float* %3) #5, !dbg !203
  br label %omp_offload.cont, !dbg !197

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void, !dbg !204
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @__omp_offloading_32_82eb324_gemm_OMP_l56_debug__(float* %C, float* %Cinit, float* %A, float* %B) #4 !dbg !205 {
entry:
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !208, metadata !DIExpression()), !dbg !209
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !210, metadata !DIExpression()), !dbg !211
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !212, metadata !DIExpression()), !dbg !213
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !214, metadata !DIExpression()), !dbg !215
  %0 = load float*, float** %C.addr, align 8, !dbg !216
  %1 = load float*, float** %Cinit.addr, align 8, !dbg !216
  %2 = load float*, float** %A.addr, align 8, !dbg !216
  %3 = load float*, float** %B.addr, align 8, !dbg !216
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_teams(%struct.ident_t* @7, i32 4, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, float*, float*, float*, float*)* @.omp_outlined..2 to void (i32*, i32*, ...)*), float* %0, float* %1, float* %2, float* %3), !dbg !216
  ret void, !dbg !217
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined._debug__(i32* noalias %.global_tid., i32* noalias %.bound_tid., float* %C, float* %Cinit, float* %A, float* %B) #4 !dbg !218 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !225, metadata !DIExpression()), !dbg !226
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !227, metadata !DIExpression()), !dbg !226
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !228, metadata !DIExpression()), !dbg !229
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !230, metadata !DIExpression()), !dbg !231
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !232, metadata !DIExpression()), !dbg !233
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !234, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata i32* %i, metadata !236, metadata !DIExpression()), !dbg !238
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond, !dbg !239

for.cond:                                         ; preds = %for.inc9, %entry
  %0 = load i32, i32* %i, align 4, !dbg !240
  %cmp = icmp slt i32 %0, 100, !dbg !242
  br i1 %cmp, label %for.body, label %for.end11, !dbg !243

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !244, metadata !DIExpression()), !dbg !247
  store i32 0, i32* %j, align 4, !dbg !247
  br label %for.cond1, !dbg !248

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !249
  %cmp2 = icmp slt i32 %1, 100, !dbg !251
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !252

for.body3:                                        ; preds = %for.cond1
  %2 = load float*, float** %Cinit.addr, align 8, !dbg !253
  %3 = load i32, i32* %i, align 4, !dbg !255
  %mul = mul nsw i32 %3, 100, !dbg !256
  %4 = load i32, i32* %j, align 4, !dbg !257
  %add = add nsw i32 %mul, %4, !dbg !258
  %idxprom = sext i32 %add to i64, !dbg !253
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom, !dbg !253
  %5 = load volatile float, float* %arrayidx, align 4, !dbg !253
  %mul4 = fmul float %5, 2.123000e+03, !dbg !259
  %6 = load float*, float** %C.addr, align 8, !dbg !260
  %7 = load i32, i32* %i, align 4, !dbg !261
  %mul5 = mul nsw i32 %7, 100, !dbg !262
  %8 = load i32, i32* %j, align 4, !dbg !263
  %add6 = add nsw i32 %mul5, %8, !dbg !264
  %idxprom7 = sext i32 %add6 to i64, !dbg !260
  %arrayidx8 = getelementptr inbounds float, float* %6, i64 %idxprom7, !dbg !260
  store float %mul4, float* %arrayidx8, align 4, !dbg !265
  %9 = load float*, float** %C.addr, align 8, !dbg !266
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @5, i32 5, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, float*, i32*, i32*, float**, float**)* @.omp_outlined. to void (i32*, i32*, ...)*), float* %9, i32* %i, i32* %j, float** %A.addr, float** %B.addr), !dbg !266
  br label %for.inc, !dbg !267

for.inc:                                          ; preds = %for.body3
  %10 = load i32, i32* %j, align 4, !dbg !268
  %inc = add nsw i32 %10, 1, !dbg !268
  store i32 %inc, i32* %j, align 4, !dbg !268
  br label %for.cond1, !dbg !269, !llvm.loop !270

for.end:                                          ; preds = %for.cond1
  br label %for.inc9, !dbg !272

for.inc9:                                         ; preds = %for.end
  %11 = load i32, i32* %i, align 4, !dbg !273
  %inc10 = add nsw i32 %11, 1, !dbg !273
  store i32 %inc10, i32* %i, align 4, !dbg !273
  br label %for.cond, !dbg !274, !llvm.loop !275

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !277
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined._debug__.1(i32* noalias %.global_tid., i32* noalias %.bound_tid., float* %C, i32* nonnull align 4 dereferenceable(4) %i, i32* nonnull align 4 dereferenceable(4) %j, float** nonnull align 8 dereferenceable(8) %A, float** nonnull align 8 dereferenceable(8) %B) #4 !dbg !278 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float*, align 8
  %i.addr = alloca i32*, align 8
  %j.addr = alloca i32*, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %C2 = alloca [10000 x float], align 16
  %tmp3 = alloca float*, align 8
  %k = alloca i32, align 4
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  %atomic-temp = alloca float, align 4
  %tmp29 = alloca float, align 4
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !283, metadata !DIExpression()), !dbg !284
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !285, metadata !DIExpression()), !dbg !284
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !286, metadata !DIExpression()), !dbg !287
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !288, metadata !DIExpression()), !dbg !289
  store i32* %j, i32** %j.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %j.addr, metadata !290, metadata !DIExpression()), !dbg !291
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !292, metadata !DIExpression()), !dbg !293
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !294, metadata !DIExpression()), !dbg !295
  %0 = load i32*, i32** %i.addr, align 8, !dbg !296
  %1 = load i32*, i32** %j.addr, align 8, !dbg !296
  %2 = load float**, float*** %A.addr, align 8, !dbg !296
  %3 = load float**, float*** %B.addr, align 8, !dbg !296
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !297, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !298, metadata !DIExpression()), !dbg !284
  store i32 0, i32* %.omp.lb, align 4, !dbg !299
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !300, metadata !DIExpression()), !dbg !284
  store i32 99, i32* %.omp.ub, align 4, !dbg !299
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !301, metadata !DIExpression()), !dbg !284
  store i32 1, i32* %.omp.stride, align 4, !dbg !299
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !302, metadata !DIExpression()), !dbg !284
  store i32 0, i32* %.omp.is_last, align 4, !dbg !299
  %4 = load float*, float** %C.addr, align 8, !dbg !303
  %arrayidx = getelementptr inbounds float, float* %4, i64 0, !dbg !303
  %5 = load float*, float** %C.addr, align 8, !dbg !303
  %arrayidx1 = getelementptr inbounds float, float* %5, i64 9999, !dbg !296
  call void @llvm.dbg.declare(metadata [10000 x float]* %C2, metadata !304, metadata !DIExpression()), !dbg !284
  %array.begin = getelementptr inbounds [10000 x float], [10000 x float]* %C2, i32 0, i32 0, !dbg !296
  %6 = getelementptr float, float* %array.begin, i64 10000, !dbg !296
  %omp.arrayinit.isempty = icmp eq float* %array.begin, %6, !dbg !296
  br i1 %omp.arrayinit.isempty, label %omp.arrayinit.done, label %omp.arrayinit.body, !dbg !296

omp.arrayinit.body:                               ; preds = %omp.arrayinit.body, %entry
  %omp.arraycpy.destElementPast = phi float* [ %array.begin, %entry ], [ %omp.arraycpy.dest.element, %omp.arrayinit.body ], !dbg !296
  store float 0.000000e+00, float* %omp.arraycpy.destElementPast, align 4, !dbg !296
  %omp.arraycpy.dest.element = getelementptr float, float* %omp.arraycpy.destElementPast, i32 1, !dbg !296
  %omp.arraycpy.done = icmp eq float* %omp.arraycpy.dest.element, %6, !dbg !296
  br i1 %omp.arraycpy.done, label %omp.arrayinit.done, label %omp.arrayinit.body, !dbg !296

omp.arrayinit.done:                               ; preds = %omp.arrayinit.body, %entry
  %7 = load float*, float** %C.addr, align 8, !dbg !296
  %8 = ptrtoint float* %7 to i64, !dbg !296
  %9 = ptrtoint float* %arrayidx to i64, !dbg !296
  %10 = sub i64 %8, %9, !dbg !296
  %11 = sdiv exact i64 %10, ptrtoint (float* getelementptr (float, float* null, i32 1) to i64), !dbg !296
  %12 = bitcast [10000 x float]* %C2 to float*, !dbg !296
  %13 = getelementptr float, float* %12, i64 %11, !dbg !296
  store float* %13, float** %tmp3, align 8, !dbg !296
  %rhs.begin = bitcast [10000 x float]* %C2 to float*, !dbg !296
  call void @llvm.dbg.declare(metadata i32* %k, metadata !308, metadata !DIExpression()), !dbg !284
  %14 = load i32*, i32** %.global_tid..addr, align 8, !dbg !296
  %15 = load i32, i32* %14, align 4, !dbg !296
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %15, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !309
  %16 = load i32, i32* %.omp.ub, align 4, !dbg !299
  %cmp = icmp sgt i32 %16, 99, !dbg !299
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !299

cond.true:                                        ; preds = %omp.arrayinit.done
  br label %cond.end, !dbg !299

cond.false:                                       ; preds = %omp.arrayinit.done
  %17 = load i32, i32* %.omp.ub, align 4, !dbg !299
  br label %cond.end, !dbg !299

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 99, %cond.true ], [ %17, %cond.false ], !dbg !299
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !299
  %18 = load i32, i32* %.omp.lb, align 4, !dbg !299
  store i32 %18, i32* %.omp.iv, align 4, !dbg !299
  br label %omp.inner.for.cond, !dbg !296

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %19 = load i32, i32* %.omp.iv, align 4, !dbg !299
  %20 = load i32, i32* %.omp.ub, align 4, !dbg !299
  %cmp4 = icmp sle i32 %19, %20, !dbg !296
  br i1 %cmp4, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !296

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %21 = load i32, i32* %.omp.iv, align 4, !dbg !299
  %mul = mul nsw i32 %21, 1, !dbg !310
  %add = add nsw i32 0, %mul, !dbg !310
  store i32 %add, i32* %k, align 4, !dbg !310
  %22 = load float*, float** %2, align 8, !dbg !311
  %23 = load i32, i32* %0, align 4, !dbg !313
  %mul5 = mul nsw i32 %23, 100, !dbg !314
  %24 = load i32, i32* %k, align 4, !dbg !315
  %add6 = add nsw i32 %mul5, %24, !dbg !316
  %idxprom = sext i32 %add6 to i64, !dbg !311
  %arrayidx7 = getelementptr inbounds float, float* %22, i64 %idxprom, !dbg !311
  %25 = load float, float* %arrayidx7, align 4, !dbg !311
  %mul8 = fmul float 3.241200e+04, %25, !dbg !317
  %26 = load float*, float** %3, align 8, !dbg !318
  %27 = load i32, i32* %k, align 4, !dbg !319
  %mul9 = mul nsw i32 %27, 100, !dbg !320
  %28 = load i32, i32* %1, align 4, !dbg !321
  %add10 = add nsw i32 %mul9, %28, !dbg !322
  %idxprom11 = sext i32 %add10 to i64, !dbg !318
  %arrayidx12 = getelementptr inbounds float, float* %26, i64 %idxprom11, !dbg !318
  %29 = load float, float* %arrayidx12, align 4, !dbg !318
  %mul13 = fmul float %mul8, %29, !dbg !323
  %30 = load float*, float** %tmp3, align 8, !dbg !324
  %31 = load i32, i32* %0, align 4, !dbg !325
  %mul14 = mul nsw i32 %31, 100, !dbg !326
  %32 = load i32, i32* %1, align 4, !dbg !327
  %add15 = add nsw i32 %mul14, %32, !dbg !328
  %idxprom16 = sext i32 %add15 to i64, !dbg !324
  %arrayidx17 = getelementptr inbounds float, float* %30, i64 %idxprom16, !dbg !324
  %33 = load float, float* %arrayidx17, align 4, !dbg !329
  %add18 = fadd float %33, %mul13, !dbg !329
  store float %add18, float* %arrayidx17, align 4, !dbg !329
  br label %omp.body.continue, !dbg !330

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !309

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %34 = load i32, i32* %.omp.iv, align 4, !dbg !299
  %add19 = add nsw i32 %34, 1, !dbg !296
  store i32 %add19, i32* %.omp.iv, align 4, !dbg !296
  br label %omp.inner.for.cond, !dbg !309, !llvm.loop !331

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !309

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %35 = load i32*, i32** %.global_tid..addr, align 8, !dbg !309
  %36 = load i32, i32* %35, align 4, !dbg !309
  call void @__kmpc_for_static_fini(%struct.ident_t* @3, i32 %36), !dbg !332
  %37 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0, !dbg !309
  %38 = bitcast float* %rhs.begin to i8*, !dbg !309
  store i8* %38, i8** %37, align 8, !dbg !309
  %39 = load i32*, i32** %.global_tid..addr, align 8, !dbg !309
  %40 = load i32, i32* %39, align 4, !dbg !309
  %41 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*, !dbg !309
  %42 = call i32 @__kmpc_reduce_nowait(%struct.ident_t* @4, i32 %40, i32 1, i64 8, i8* %41, void (i8*, i8*)* @.omp.reduction.reduction_func, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !309
  switch i32 %42, label %.omp.reduction.default [
    i32 1, label %.omp.reduction.case1
    i32 2, label %.omp.reduction.case2
  ], !dbg !309

.omp.reduction.case1:                             ; preds = %omp.loop.exit
  %43 = getelementptr float, float* %arrayidx, i64 10000, !dbg !309
  %omp.arraycpy.isempty = icmp eq float* %arrayidx, %43, !dbg !309
  br i1 %omp.arraycpy.isempty, label %omp.arraycpy.done24, label %omp.arraycpy.body, !dbg !309

omp.arraycpy.body:                                ; preds = %omp.arraycpy.body, %.omp.reduction.case1
  %omp.arraycpy.srcElementPast = phi float* [ %rhs.begin, %.omp.reduction.case1 ], [ %omp.arraycpy.src.element, %omp.arraycpy.body ], !dbg !309
  %omp.arraycpy.destElementPast20 = phi float* [ %arrayidx, %.omp.reduction.case1 ], [ %omp.arraycpy.dest.element22, %omp.arraycpy.body ], !dbg !309
  %44 = load float, float* %omp.arraycpy.destElementPast20, align 4, !dbg !303
  %45 = load float, float* %omp.arraycpy.srcElementPast, align 4, !dbg !303
  %add21 = fadd float %44, %45, !dbg !333
  store float %add21, float* %omp.arraycpy.destElementPast20, align 4, !dbg !333
  %omp.arraycpy.dest.element22 = getelementptr float, float* %omp.arraycpy.destElementPast20, i32 1, !dbg !309
  %omp.arraycpy.src.element = getelementptr float, float* %omp.arraycpy.srcElementPast, i32 1, !dbg !309
  %omp.arraycpy.done23 = icmp eq float* %omp.arraycpy.dest.element22, %43, !dbg !309
  br i1 %omp.arraycpy.done23, label %omp.arraycpy.done24, label %omp.arraycpy.body, !dbg !309

omp.arraycpy.done24:                              ; preds = %omp.arraycpy.body, %.omp.reduction.case1
  call void @__kmpc_end_reduce_nowait(%struct.ident_t* @4, i32 %40, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !309
  br label %.omp.reduction.default, !dbg !309

.omp.reduction.case2:                             ; preds = %omp.loop.exit
  %46 = getelementptr float, float* %arrayidx, i64 10000, !dbg !309
  %omp.arraycpy.isempty25 = icmp eq float* %arrayidx, %46, !dbg !309
  br i1 %omp.arraycpy.isempty25, label %omp.arraycpy.done34, label %omp.arraycpy.body26, !dbg !309

omp.arraycpy.body26:                              ; preds = %atomic_exit, %.omp.reduction.case2
  %omp.arraycpy.srcElementPast27 = phi float* [ %rhs.begin, %.omp.reduction.case2 ], [ %omp.arraycpy.src.element32, %atomic_exit ], !dbg !309
  %omp.arraycpy.destElementPast28 = phi float* [ %arrayidx, %.omp.reduction.case2 ], [ %omp.arraycpy.dest.element31, %atomic_exit ], !dbg !309
  %47 = load float, float* %omp.arraycpy.srcElementPast27, align 4, !dbg !303
  %48 = bitcast float* %omp.arraycpy.destElementPast28 to i32*, !dbg !309
  %atomic-load = load atomic i32, i32* %48 monotonic, align 4, !dbg !309
  br label %atomic_cont, !dbg !309

atomic_cont:                                      ; preds = %atomic_cont, %omp.arraycpy.body26
  %49 = phi i32 [ %atomic-load, %omp.arraycpy.body26 ], [ %57, %atomic_cont ], !dbg !309
  %50 = bitcast float* %atomic-temp to i32*, !dbg !309
  %51 = bitcast i32 %49 to float, !dbg !309
  store float %51, float* %tmp29, align 4, !dbg !309
  %52 = load float, float* %tmp29, align 4, !dbg !303
  %53 = load float, float* %omp.arraycpy.srcElementPast27, align 4, !dbg !303
  %add30 = fadd float %52, %53, !dbg !333
  store float %add30, float* %atomic-temp, align 4, !dbg !309
  %54 = load i32, i32* %50, align 4, !dbg !309
  %55 = bitcast float* %omp.arraycpy.destElementPast28 to i32*, !dbg !309
  %56 = cmpxchg i32* %55, i32 %49, i32 %54 monotonic monotonic, align 4, !dbg !309
  %57 = extractvalue { i32, i1 } %56, 0, !dbg !309
  %58 = extractvalue { i32, i1 } %56, 1, !dbg !309
  br i1 %58, label %atomic_exit, label %atomic_cont, !dbg !309

atomic_exit:                                      ; preds = %atomic_cont
  %omp.arraycpy.dest.element31 = getelementptr float, float* %omp.arraycpy.destElementPast28, i32 1, !dbg !309
  %omp.arraycpy.src.element32 = getelementptr float, float* %omp.arraycpy.srcElementPast27, i32 1, !dbg !309
  %omp.arraycpy.done33 = icmp eq float* %omp.arraycpy.dest.element31, %46, !dbg !309
  br i1 %omp.arraycpy.done33, label %omp.arraycpy.done34, label %omp.arraycpy.body26, !dbg !309

omp.arraycpy.done34:                              ; preds = %atomic_exit, %.omp.reduction.case2
  br label %.omp.reduction.default, !dbg !309

.omp.reduction.default:                           ; preds = %omp.arraycpy.done34, %omp.arraycpy.done24, %omp.loop.exit
  ret void, !dbg !334
}

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) #5

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @.omp.reduction.reduction_func(i8* %0, i8* %1) #6 !dbg !335 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !337, metadata !DIExpression()), !dbg !339
  store i8* %1, i8** %.addr1, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr1, metadata !340, metadata !DIExpression()), !dbg !339
  %2 = load i8*, i8** %.addr, align 8, !dbg !341
  %3 = bitcast i8* %2 to [1 x i8*]*, !dbg !341
  %4 = load i8*, i8** %.addr1, align 8, !dbg !341
  %5 = bitcast i8* %4 to [1 x i8*]*, !dbg !341
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0, !dbg !341
  %7 = load i8*, i8** %6, align 8, !dbg !341
  %8 = bitcast i8* %7 to float*, !dbg !341
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0, !dbg !341
  %10 = load i8*, i8** %9, align 8, !dbg !341
  %11 = bitcast i8* %10 to float*, !dbg !341
  %12 = getelementptr float, float* %11, i64 10000, !dbg !341
  %omp.arraycpy.isempty = icmp eq float* %11, %12, !dbg !341
  br i1 %omp.arraycpy.isempty, label %omp.arraycpy.done2, label %omp.arraycpy.body, !dbg !341

omp.arraycpy.body:                                ; preds = %omp.arraycpy.body, %entry
  %omp.arraycpy.srcElementPast = phi float* [ %8, %entry ], [ %omp.arraycpy.src.element, %omp.arraycpy.body ], !dbg !341
  %omp.arraycpy.destElementPast = phi float* [ %11, %entry ], [ %omp.arraycpy.dest.element, %omp.arraycpy.body ], !dbg !341
  %13 = load float, float* %omp.arraycpy.destElementPast, align 4, !dbg !342
  %14 = load float, float* %omp.arraycpy.srcElementPast, align 4, !dbg !342
  %add = fadd float %13, %14, !dbg !343
  store float %add, float* %omp.arraycpy.destElementPast, align 4, !dbg !343
  %omp.arraycpy.dest.element = getelementptr float, float* %omp.arraycpy.destElementPast, i32 1, !dbg !341
  %omp.arraycpy.src.element = getelementptr float, float* %omp.arraycpy.srcElementPast, i32 1, !dbg !341
  %omp.arraycpy.done = icmp eq float* %omp.arraycpy.dest.element, %12, !dbg !341
  br i1 %omp.arraycpy.done, label %omp.arraycpy.done2, label %omp.arraycpy.body, !dbg !341

omp.arraycpy.done2:                               ; preds = %omp.arraycpy.body, %entry
  ret void, !dbg !342
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce_nowait(%struct.ident_t*, i32, i32, i64, i8*, void (i8*, i8*)*, [8 x i32]*) #7

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce_nowait(%struct.ident_t*, i32, [8 x i32]*) #7

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., float* %C, i32* nonnull align 4 dereferenceable(4) %i, i32* nonnull align 4 dereferenceable(4) %j, float** nonnull align 8 dereferenceable(8) %A, float** nonnull align 8 dereferenceable(8) %B) #4 !dbg !344 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float*, align 8
  %i.addr = alloca i32*, align 8
  %j.addr = alloca i32*, align 8
  %A.addr = alloca float**, align 8
  %B.addr = alloca float**, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !345, metadata !DIExpression()), !dbg !346
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !347, metadata !DIExpression()), !dbg !346
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !348, metadata !DIExpression()), !dbg !346
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !349, metadata !DIExpression()), !dbg !346
  store i32* %j, i32** %j.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %j.addr, metadata !350, metadata !DIExpression()), !dbg !346
  store float** %A, float*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %A.addr, metadata !351, metadata !DIExpression()), !dbg !346
  store float** %B, float*** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %B.addr, metadata !352, metadata !DIExpression()), !dbg !346
  %0 = load i32*, i32** %i.addr, align 8, !dbg !353
  %1 = load i32*, i32** %j.addr, align 8, !dbg !353
  %2 = load float**, float*** %A.addr, align 8, !dbg !353
  %3 = load float**, float*** %B.addr, align 8, !dbg !353
  %4 = load i32*, i32** %.global_tid..addr, align 8, !dbg !353
  %5 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !353
  %6 = load float*, float** %C.addr, align 8, !dbg !353
  %7 = load i32*, i32** %i.addr, align 8, !dbg !353
  %8 = load i32*, i32** %j.addr, align 8, !dbg !353
  %9 = load float**, float*** %A.addr, align 8, !dbg !353
  %10 = load float**, float*** %B.addr, align 8, !dbg !353
  call void @.omp_outlined._debug__.1(i32* %4, i32* %5, float* %6, i32* %7, i32* %8, float** %9, float** %10) #5, !dbg !353
  ret void, !dbg !353
}

; Function Attrs: nounwind
declare !callback !354 void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) #5

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined..2(i32* noalias %.global_tid., i32* noalias %.bound_tid., float* %C, float* %Cinit, float* %A, float* %B) #4 !dbg !356 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !357, metadata !DIExpression()), !dbg !358
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !359, metadata !DIExpression()), !dbg !358
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !360, metadata !DIExpression()), !dbg !358
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !361, metadata !DIExpression()), !dbg !358
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !362, metadata !DIExpression()), !dbg !358
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !363, metadata !DIExpression()), !dbg !358
  %0 = load i32*, i32** %.global_tid..addr, align 8, !dbg !364
  %1 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !364
  %2 = load float*, float** %C.addr, align 8, !dbg !364
  %3 = load float*, float** %Cinit.addr, align 8, !dbg !364
  %4 = load float*, float** %A.addr, align 8, !dbg !364
  %5 = load float*, float** %B.addr, align 8, !dbg !364
  call void @.omp_outlined._debug__(i32* %0, i32* %1, float* %2, float* %3, float* %4, float* %5) #5, !dbg !364
  ret void, !dbg !364
}

; Function Attrs: nounwind
declare !callback !354 void @__kmpc_fork_teams(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) #5

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @__omp_offloading_32_82eb324_gemm_OMP_l56(float* %C, float* %Cinit, float* %A, float* %B) #4 !dbg !365 {
entry:
  %C.addr = alloca float*, align 8
  %Cinit.addr = alloca float*, align 8
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !366, metadata !DIExpression()), !dbg !367
  store float* %Cinit, float** %Cinit.addr, align 8
  call void @llvm.dbg.declare(metadata float** %Cinit.addr, metadata !368, metadata !DIExpression()), !dbg !367
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !369, metadata !DIExpression()), !dbg !367
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !370, metadata !DIExpression()), !dbg !367
  %0 = load float*, float** %C.addr, align 8, !dbg !371
  %1 = load float*, float** %Cinit.addr, align 8, !dbg !371
  %2 = load float*, float** %A.addr, align 8, !dbg !371
  %3 = load float*, float** %B.addr, align 8, !dbg !371
  call void @__omp_offloading_32_82eb324_gemm_OMP_l56_debug__(float* %0, float* %1, float* %2, float* %3) #5, !dbg !371
  ret void, !dbg !371
}

; Function Attrs: nounwind
declare i32 @__tgt_target_teams_mapper(%struct.ident_t*, i64, i8*, i32, i8**, i8**, i64*, i64*, i8**, i8**, i32, i32) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @init(float* %A, float* %B, float* %C, float* %C_OMP) #0 !dbg !372 {
entry:
  %A.addr = alloca float*, align 8
  %B.addr = alloca float*, align 8
  %C.addr = alloca float*, align 8
  %C_OMP.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float* %A, float** %A.addr, align 8
  call void @llvm.dbg.declare(metadata float** %A.addr, metadata !375, metadata !DIExpression()), !dbg !376
  store float* %B, float** %B.addr, align 8
  call void @llvm.dbg.declare(metadata float** %B.addr, metadata !377, metadata !DIExpression()), !dbg !378
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !379, metadata !DIExpression()), !dbg !380
  store float* %C_OMP, float** %C_OMP.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C_OMP.addr, metadata !381, metadata !DIExpression()), !dbg !382
  call void @llvm.dbg.declare(metadata i32* %i, metadata !383, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.declare(metadata i32* %j, metadata !385, metadata !DIExpression()), !dbg !386
  store i32 0, i32* %i, align 4, !dbg !387
  br label %for.cond, !dbg !389

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !390
  %cmp = icmp slt i32 %0, 100, !dbg !392
  br i1 %cmp, label %for.body, label %for.end8, !dbg !393

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !394
  br label %for.cond1, !dbg !397

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !398
  %cmp2 = icmp slt i32 %1, 100, !dbg !400
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !401

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4, !dbg !402
  %conv = sitofp i32 %2 to float, !dbg !404
  %3 = load i32, i32* %j, align 4, !dbg !405
  %conv4 = sitofp i32 %3 to float, !dbg !405
  %mul = fmul float %conv, %conv4, !dbg !406
  %div = fdiv float %mul, 1.000000e+02, !dbg !407
  %4 = load float*, float** %A.addr, align 8, !dbg !408
  %5 = load i32, i32* %i, align 4, !dbg !409
  %mul5 = mul nsw i32 %5, 100, !dbg !410
  %6 = load i32, i32* %j, align 4, !dbg !411
  %add = add nsw i32 %mul5, %6, !dbg !412
  %idxprom = sext i32 %add to i64, !dbg !408
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !408
  store float %div, float* %arrayidx, align 4, !dbg !413
  br label %for.inc, !dbg !414

for.inc:                                          ; preds = %for.body3
  %7 = load i32, i32* %j, align 4, !dbg !415
  %inc = add nsw i32 %7, 1, !dbg !415
  store i32 %inc, i32* %j, align 4, !dbg !415
  br label %for.cond1, !dbg !416, !llvm.loop !417

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !419

for.inc6:                                         ; preds = %for.end
  %8 = load i32, i32* %i, align 4, !dbg !420
  %inc7 = add nsw i32 %8, 1, !dbg !420
  store i32 %inc7, i32* %i, align 4, !dbg !420
  br label %for.cond, !dbg !421, !llvm.loop !422

for.end8:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !424
  br label %for.cond9, !dbg !426

for.cond9:                                        ; preds = %for.inc29, %for.end8
  %9 = load i32, i32* %i, align 4, !dbg !427
  %cmp10 = icmp slt i32 %9, 100, !dbg !429
  br i1 %cmp10, label %for.body12, label %for.end31, !dbg !430

for.body12:                                       ; preds = %for.cond9
  store i32 0, i32* %j, align 4, !dbg !431
  br label %for.cond13, !dbg !434

for.cond13:                                       ; preds = %for.inc26, %for.body12
  %10 = load i32, i32* %j, align 4, !dbg !435
  %cmp14 = icmp slt i32 %10, 100, !dbg !437
  br i1 %cmp14, label %for.body16, label %for.end28, !dbg !438

for.body16:                                       ; preds = %for.cond13
  %11 = load i32, i32* %i, align 4, !dbg !439
  %conv17 = sitofp i32 %11 to float, !dbg !441
  %12 = load i32, i32* %j, align 4, !dbg !442
  %conv18 = sitofp i32 %12 to float, !dbg !442
  %mul19 = fmul float %conv17, %conv18, !dbg !443
  %add20 = fadd float %mul19, 1.000000e+00, !dbg !444
  %div21 = fdiv float %add20, 1.000000e+02, !dbg !445
  %13 = load float*, float** %B.addr, align 8, !dbg !446
  %14 = load i32, i32* %i, align 4, !dbg !447
  %mul22 = mul nsw i32 %14, 100, !dbg !448
  %15 = load i32, i32* %j, align 4, !dbg !449
  %add23 = add nsw i32 %mul22, %15, !dbg !450
  %idxprom24 = sext i32 %add23 to i64, !dbg !446
  %arrayidx25 = getelementptr inbounds float, float* %13, i64 %idxprom24, !dbg !446
  store float %div21, float* %arrayidx25, align 4, !dbg !451
  br label %for.inc26, !dbg !452

for.inc26:                                        ; preds = %for.body16
  %16 = load i32, i32* %j, align 4, !dbg !453
  %inc27 = add nsw i32 %16, 1, !dbg !453
  store i32 %inc27, i32* %j, align 4, !dbg !453
  br label %for.cond13, !dbg !454, !llvm.loop !455

for.end28:                                        ; preds = %for.cond13
  br label %for.inc29, !dbg !457

for.inc29:                                        ; preds = %for.end28
  %17 = load i32, i32* %i, align 4, !dbg !458
  %inc30 = add nsw i32 %17, 1, !dbg !458
  store i32 %inc30, i32* %i, align 4, !dbg !458
  br label %for.cond9, !dbg !459, !llvm.loop !460

for.end31:                                        ; preds = %for.cond9
  store i32 0, i32* %i, align 4, !dbg !462
  br label %for.cond32, !dbg !464

for.cond32:                                       ; preds = %for.inc61, %for.end31
  %18 = load i32, i32* %i, align 4, !dbg !465
  %cmp33 = icmp slt i32 %18, 100, !dbg !467
  br i1 %cmp33, label %for.body35, label %for.end63, !dbg !468

for.body35:                                       ; preds = %for.cond32
  store i32 0, i32* %j, align 4, !dbg !469
  br label %for.cond36, !dbg !472

for.cond36:                                       ; preds = %for.inc58, %for.body35
  %19 = load i32, i32* %j, align 4, !dbg !473
  %cmp37 = icmp slt i32 %19, 100, !dbg !475
  br i1 %cmp37, label %for.body39, label %for.end60, !dbg !476

for.body39:                                       ; preds = %for.cond36
  %20 = load i32, i32* %i, align 4, !dbg !477
  %conv40 = sitofp i32 %20 to float, !dbg !479
  %21 = load i32, i32* %j, align 4, !dbg !480
  %conv41 = sitofp i32 %21 to float, !dbg !480
  %mul42 = fmul float %conv40, %conv41, !dbg !481
  %add43 = fadd float %mul42, 2.000000e+00, !dbg !482
  %div44 = fdiv float %add43, 1.000000e+02, !dbg !483
  %22 = load float*, float** %C.addr, align 8, !dbg !484
  %23 = load i32, i32* %i, align 4, !dbg !485
  %mul45 = mul nsw i32 %23, 100, !dbg !486
  %24 = load i32, i32* %j, align 4, !dbg !487
  %add46 = add nsw i32 %mul45, %24, !dbg !488
  %idxprom47 = sext i32 %add46 to i64, !dbg !484
  %arrayidx48 = getelementptr inbounds float, float* %22, i64 %idxprom47, !dbg !484
  store float %div44, float* %arrayidx48, align 4, !dbg !489
  %25 = load i32, i32* %i, align 4, !dbg !490
  %conv49 = sitofp i32 %25 to float, !dbg !491
  %26 = load i32, i32* %j, align 4, !dbg !492
  %conv50 = sitofp i32 %26 to float, !dbg !492
  %mul51 = fmul float %conv49, %conv50, !dbg !493
  %add52 = fadd float %mul51, 2.000000e+00, !dbg !494
  %div53 = fdiv float %add52, 1.000000e+02, !dbg !495
  %27 = load float*, float** %C_OMP.addr, align 8, !dbg !496
  %28 = load i32, i32* %i, align 4, !dbg !497
  %mul54 = mul nsw i32 %28, 100, !dbg !498
  %29 = load i32, i32* %j, align 4, !dbg !499
  %add55 = add nsw i32 %mul54, %29, !dbg !500
  %idxprom56 = sext i32 %add55 to i64, !dbg !496
  %arrayidx57 = getelementptr inbounds float, float* %27, i64 %idxprom56, !dbg !496
  store float %div53, float* %arrayidx57, align 4, !dbg !501
  br label %for.inc58, !dbg !502

for.inc58:                                        ; preds = %for.body39
  %30 = load i32, i32* %j, align 4, !dbg !503
  %inc59 = add nsw i32 %30, 1, !dbg !503
  store i32 %inc59, i32* %j, align 4, !dbg !503
  br label %for.cond36, !dbg !504, !llvm.loop !505

for.end60:                                        ; preds = %for.cond36
  br label %for.inc61, !dbg !507

for.inc61:                                        ; preds = %for.end60
  %31 = load i32, i32* %i, align 4, !dbg !508
  %inc62 = add nsw i32 %31, 1, !dbg !508
  store i32 %inc62, i32* %i, align 4, !dbg !508
  br label %for.cond32, !dbg !509, !llvm.loop !510

for.end63:                                        ; preds = %for.cond32
  ret void, !dbg !512
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @compareResults(float* %C, float* %C_outputFromGpu) #0 !dbg !513 {
entry:
  %C.addr = alloca float*, align 8
  %C_outputFromGpu.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %fail = alloca i32, align 4
  store float* %C, float** %C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C.addr, metadata !516, metadata !DIExpression()), !dbg !517
  store float* %C_outputFromGpu, float** %C_outputFromGpu.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C_outputFromGpu.addr, metadata !518, metadata !DIExpression()), !dbg !519
  call void @llvm.dbg.declare(metadata i32* %i, metadata !520, metadata !DIExpression()), !dbg !521
  call void @llvm.dbg.declare(metadata i32* %j, metadata !522, metadata !DIExpression()), !dbg !523
  call void @llvm.dbg.declare(metadata i32* %fail, metadata !524, metadata !DIExpression()), !dbg !525
  store i32 0, i32* %fail, align 4, !dbg !526
  store i32 0, i32* %i, align 4, !dbg !527
  br label %for.cond, !dbg !529

for.cond:                                         ; preds = %for.inc24, %entry
  %0 = load i32, i32* %i, align 4, !dbg !530
  %cmp = icmp slt i32 %0, 100, !dbg !532
  br i1 %cmp, label %for.body, label %for.end26, !dbg !533

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !534
  br label %for.cond1, !dbg !537

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !538
  %cmp2 = icmp slt i32 %1, 100, !dbg !540
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !541

for.body3:                                        ; preds = %for.cond1
  %2 = load float*, float** %C.addr, align 8, !dbg !542
  %3 = load i32, i32* %i, align 4, !dbg !545
  %mul = mul nsw i32 %3, 100, !dbg !546
  %4 = load i32, i32* %j, align 4, !dbg !547
  %add = add nsw i32 %mul, %4, !dbg !548
  %idxprom = sext i32 %add to i64, !dbg !542
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom, !dbg !542
  %5 = load float, float* %arrayidx, align 4, !dbg !542
  %conv = fpext float %5 to double, !dbg !542
  %6 = load float*, float** %C_outputFromGpu.addr, align 8, !dbg !549
  %7 = load i32, i32* %i, align 4, !dbg !550
  %mul4 = mul nsw i32 %7, 100, !dbg !551
  %8 = load i32, i32* %j, align 4, !dbg !552
  %add5 = add nsw i32 %mul4, %8, !dbg !553
  %idxprom6 = sext i32 %add5 to i64, !dbg !549
  %arrayidx7 = getelementptr inbounds float, float* %6, i64 %idxprom6, !dbg !549
  %9 = load float, float* %arrayidx7, align 4, !dbg !549
  %conv8 = fpext float %9 to double, !dbg !549
  %call = call float @percentDiff(double %conv, double %conv8), !dbg !554
  %conv9 = fpext float %call to double, !dbg !554
  %cmp10 = fcmp ogt double %conv9, 5.000000e-02, !dbg !555
  br i1 %cmp10, label %if.then, label %if.end, !dbg !556

if.then:                                          ; preds = %for.body3
  %10 = load i32, i32* %fail, align 4, !dbg !557
  %inc = add nsw i32 %10, 1, !dbg !557
  store i32 %inc, i32* %fail, align 4, !dbg !557
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !559
  %12 = load float*, float** %C.addr, align 8, !dbg !560
  %13 = load i32, i32* %i, align 4, !dbg !561
  %mul12 = mul nsw i32 %13, 100, !dbg !562
  %14 = load i32, i32* %j, align 4, !dbg !563
  %add13 = add nsw i32 %mul12, %14, !dbg !564
  %idxprom14 = sext i32 %add13 to i64, !dbg !560
  %arrayidx15 = getelementptr inbounds float, float* %12, i64 %idxprom14, !dbg !560
  %15 = load float, float* %arrayidx15, align 4, !dbg !560
  %conv16 = fpext float %15 to double, !dbg !560
  %16 = load float*, float** %C_outputFromGpu.addr, align 8, !dbg !565
  %17 = load i32, i32* %i, align 4, !dbg !566
  %mul17 = mul nsw i32 %17, 100, !dbg !567
  %18 = load i32, i32* %j, align 4, !dbg !568
  %add18 = add nsw i32 %mul17, %18, !dbg !569
  %idxprom19 = sext i32 %add18 to i64, !dbg !565
  %arrayidx20 = getelementptr inbounds float, float* %16, i64 %idxprom19, !dbg !565
  %19 = load float, float* %arrayidx20, align 4, !dbg !565
  %conv21 = fpext float %19 to double, !dbg !565
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), double %conv16, double %conv21), !dbg !570
  br label %if.end, !dbg !571

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !572

for.inc:                                          ; preds = %if.end
  %20 = load i32, i32* %j, align 4, !dbg !573
  %inc23 = add nsw i32 %20, 1, !dbg !573
  store i32 %inc23, i32* %j, align 4, !dbg !573
  br label %for.cond1, !dbg !574, !llvm.loop !575

for.end:                                          ; preds = %for.cond1
  br label %for.inc24, !dbg !577

for.inc24:                                        ; preds = %for.end
  %21 = load i32, i32* %i, align 4, !dbg !578
  %inc25 = add nsw i32 %21, 1, !dbg !578
  store i32 %inc25, i32* %i, align 4, !dbg !578
  br label %for.cond, !dbg !579, !llvm.loop !580

for.end26:                                        ; preds = %for.cond
  %22 = load i32, i32* %fail, align 4, !dbg !582
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.4, i64 0, i64 0), double 5.000000e-02, i32 %22), !dbg !583
  %23 = load i32, i32* %fail, align 4, !dbg !584
  ret i32 %23, !dbg !585
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !586 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !592, metadata !DIExpression()), !dbg !593
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !594, metadata !DIExpression()), !dbg !595
  call void @llvm.dbg.declare(metadata double* %t_start, metadata !596, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.declare(metadata double* %t_end, metadata !598, metadata !DIExpression()), !dbg !599
  call void @llvm.dbg.declare(metadata i32* %fail, metadata !600, metadata !DIExpression()), !dbg !601
  store i32 0, i32* %fail, align 4, !dbg !601
  call void @llvm.dbg.declare(metadata [10000 x float]* %A, metadata !602, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.declare(metadata [10000 x float]* %B, metadata !604, metadata !DIExpression()), !dbg !605
  call void @llvm.dbg.declare(metadata [10000 x float]* %C, metadata !606, metadata !DIExpression()), !dbg !607
  call void @llvm.dbg.declare(metadata [10000 x float]* %C_outputFromGpu, metadata !608, metadata !DIExpression()), !dbg !609
  call void @llvm.dbg.declare(metadata [10000 x float]* %Cinit_outputFromGpu, metadata !610, metadata !DIExpression()), !dbg !611
  %arraydecay = getelementptr inbounds [10000 x float], [10000 x float]* %A, i64 0, i64 0, !dbg !612
  %arraydecay1 = getelementptr inbounds [10000 x float], [10000 x float]* %B, i64 0, i64 0, !dbg !613
  %arraydecay2 = getelementptr inbounds [10000 x float], [10000 x float]* %C, i64 0, i64 0, !dbg !614
  %arraydecay3 = getelementptr inbounds [10000 x float], [10000 x float]* %Cinit_outputFromGpu, i64 0, i64 0, !dbg !615
  call void @init(float* %arraydecay, float* %arraydecay1, float* %arraydecay2, float* %arraydecay3), !dbg !616
  %arraydecay4 = getelementptr inbounds [10000 x float], [10000 x float]* %A, i64 0, i64 0, !dbg !617
  %arraydecay5 = getelementptr inbounds [10000 x float], [10000 x float]* %B, i64 0, i64 0, !dbg !618
  %arraydecay6 = getelementptr inbounds [10000 x float], [10000 x float]* %C_outputFromGpu, i64 0, i64 0, !dbg !619
  %arraydecay7 = getelementptr inbounds [10000 x float], [10000 x float]* %Cinit_outputFromGpu, i64 0, i64 0, !dbg !620
  call void @gemm_OMP(float* %arraydecay4, float* %arraydecay5, float* %arraydecay6, float* %arraydecay7), !dbg !621
  %0 = load i32, i32* %fail, align 4, !dbg !622
  ret i32 %0, !dbg !623
}

; Function Attrs: noinline nounwind uwtable
define internal void @.omp_offloading.requires_reg() #8 section ".text.startup" !dbg !624 {
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
attributes #6 = { noinline norecurse nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { convergent nounwind }
attributes #8 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!omp_offload.info = !{!6}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "src/debug.c", directory: "/gpfs/jlse-fs0/users/dstfvrt/anl_jlse/gemm")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "DATA_TYPE", file: !1, line: 36, baseType: !5)
!5 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!6 = !{i32 0, i32 50, i32 137278244, !"gemm_OMP", i32 56, i32 0}
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
!186 = !{null, !106, !106, !106, !187}
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !4)
!189 = !DILocalVariable(name: "A", arg: 1, scope: !184, file: !1, line: 52, type: !106)
!190 = !DILocation(line: 52, column: 25, scope: !184)
!191 = !DILocalVariable(name: "B", arg: 2, scope: !184, file: !1, line: 52, type: !106)
!192 = !DILocation(line: 52, column: 47, scope: !184)
!193 = !DILocalVariable(name: "C", arg: 3, scope: !184, file: !1, line: 53, type: !106)
!194 = !DILocation(line: 53, column: 25, scope: !184)
!195 = !DILocalVariable(name: "Cinit", arg: 4, scope: !184, file: !1, line: 53, type: !187)
!196 = !DILocation(line: 53, column: 56, scope: !184)
!197 = !DILocation(line: 56, column: 3, scope: !184)
!198 = !DILocation(line: 56, column: 94, scope: !199)
!199 = distinct !DILexicalBlock(scope: !184, file: !1, line: 56, column: 3)
!200 = !DILocation(line: 56, column: 65, scope: !199)
!201 = !DILocation(line: 56, column: 37, scope: !199)
!202 = !DILocation(line: 56, column: 51, scope: !199)
!203 = !DILocation(line: 56, column: 3, scope: !199)
!204 = !DILocation(line: 66, column: 1, scope: !184)
!205 = distinct !DISubprogram(name: "__omp_offloading_32_82eb324_gemm_OMP_l56_debug__", scope: !1, file: !1, line: 57, type: !206, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!206 = !DISubroutineType(types: !207)
!207 = !{null, !106, !187, !106, !106}
!208 = !DILocalVariable(name: "C", arg: 1, scope: !205, file: !1, line: 53, type: !106)
!209 = !DILocation(line: 53, column: 25, scope: !205)
!210 = !DILocalVariable(name: "Cinit", arg: 2, scope: !205, file: !1, line: 53, type: !187)
!211 = !DILocation(line: 53, column: 56, scope: !205)
!212 = !DILocalVariable(name: "A", arg: 3, scope: !205, file: !1, line: 52, type: !106)
!213 = !DILocation(line: 52, column: 25, scope: !205)
!214 = !DILocalVariable(name: "B", arg: 4, scope: !205, file: !1, line: 52, type: !106)
!215 = !DILocation(line: 52, column: 47, scope: !205)
!216 = !DILocation(line: 56, column: 3, scope: !205)
!217 = !DILocation(line: 65, column: 3, scope: !205)
!218 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !1, file: !1, line: 57, type: !219, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!219 = !DISubroutineType(types: !220)
!220 = !{null, !221, !221, !106, !187, !106, !106}
!221 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !222)
!222 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !223)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !224, size: 64)
!224 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !24)
!225 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !218, type: !221, flags: DIFlagArtificial)
!226 = !DILocation(line: 0, scope: !218)
!227 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !218, type: !221, flags: DIFlagArtificial)
!228 = !DILocalVariable(name: "C", arg: 3, scope: !218, file: !1, line: 53, type: !106)
!229 = !DILocation(line: 53, column: 25, scope: !218)
!230 = !DILocalVariable(name: "Cinit", arg: 4, scope: !218, file: !1, line: 53, type: !187)
!231 = !DILocation(line: 53, column: 56, scope: !218)
!232 = !DILocalVariable(name: "A", arg: 5, scope: !218, file: !1, line: 52, type: !106)
!233 = !DILocation(line: 52, column: 25, scope: !218)
!234 = !DILocalVariable(name: "B", arg: 6, scope: !218, file: !1, line: 52, type: !106)
!235 = !DILocation(line: 52, column: 47, scope: !218)
!236 = !DILocalVariable(name: "i", scope: !237, file: !1, line: 57, type: !24)
!237 = distinct !DILexicalBlock(scope: !218, file: !1, line: 57, column: 3)
!238 = !DILocation(line: 57, column: 12, scope: !237)
!239 = !DILocation(line: 57, column: 8, scope: !237)
!240 = !DILocation(line: 57, column: 19, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !1, line: 57, column: 3)
!242 = !DILocation(line: 57, column: 21, scope: !241)
!243 = !DILocation(line: 57, column: 3, scope: !237)
!244 = !DILocalVariable(name: "j", scope: !245, file: !1, line: 58, type: !24)
!245 = distinct !DILexicalBlock(scope: !246, file: !1, line: 58, column: 5)
!246 = distinct !DILexicalBlock(scope: !241, file: !1, line: 57, column: 32)
!247 = !DILocation(line: 58, column: 14, scope: !245)
!248 = !DILocation(line: 58, column: 10, scope: !245)
!249 = !DILocation(line: 58, column: 21, scope: !250)
!250 = distinct !DILexicalBlock(scope: !245, file: !1, line: 58, column: 5)
!251 = !DILocation(line: 58, column: 23, scope: !250)
!252 = !DILocation(line: 58, column: 5, scope: !245)
!253 = !DILocation(line: 59, column: 23, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !1, line: 58, column: 34)
!255 = !DILocation(line: 59, column: 29, scope: !254)
!256 = !DILocation(line: 59, column: 31, scope: !254)
!257 = !DILocation(line: 59, column: 38, scope: !254)
!258 = !DILocation(line: 59, column: 36, scope: !254)
!259 = !DILocation(line: 59, column: 41, scope: !254)
!260 = !DILocation(line: 59, column: 7, scope: !254)
!261 = !DILocation(line: 59, column: 9, scope: !254)
!262 = !DILocation(line: 59, column: 11, scope: !254)
!263 = !DILocation(line: 59, column: 18, scope: !254)
!264 = !DILocation(line: 59, column: 16, scope: !254)
!265 = !DILocation(line: 59, column: 21, scope: !254)
!266 = !DILocation(line: 60, column: 1, scope: !254)
!267 = !DILocation(line: 64, column: 5, scope: !254)
!268 = !DILocation(line: 58, column: 30, scope: !250)
!269 = !DILocation(line: 58, column: 5, scope: !250)
!270 = distinct !{!270, !252, !271, !172}
!271 = !DILocation(line: 64, column: 5, scope: !245)
!272 = !DILocation(line: 65, column: 3, scope: !246)
!273 = !DILocation(line: 57, column: 28, scope: !241)
!274 = !DILocation(line: 57, column: 3, scope: !241)
!275 = distinct !{!275, !243, !276, !172}
!276 = !DILocation(line: 65, column: 3, scope: !237)
!277 = !DILocation(line: 65, column: 3, scope: !218)
!278 = distinct !DISubprogram(name: ".omp_outlined._debug__.1", scope: !1, file: !1, line: 61, type: !279, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!279 = !DISubroutineType(types: !280)
!280 = !{null, !221, !221, !106, !281, !281, !282, !282}
!281 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !24, size: 64)
!282 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !106, size: 64)
!283 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !278, type: !221, flags: DIFlagArtificial)
!284 = !DILocation(line: 0, scope: !278)
!285 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !278, type: !221, flags: DIFlagArtificial)
!286 = !DILocalVariable(name: "C", arg: 3, scope: !278, file: !1, line: 53, type: !106)
!287 = !DILocation(line: 53, column: 25, scope: !278)
!288 = !DILocalVariable(name: "i", arg: 4, scope: !278, file: !1, line: 57, type: !281)
!289 = !DILocation(line: 57, column: 12, scope: !278)
!290 = !DILocalVariable(name: "j", arg: 5, scope: !278, file: !1, line: 58, type: !281)
!291 = !DILocation(line: 58, column: 14, scope: !278)
!292 = !DILocalVariable(name: "A", arg: 6, scope: !278, file: !1, line: 52, type: !282)
!293 = !DILocation(line: 52, column: 25, scope: !278)
!294 = !DILocalVariable(name: "B", arg: 7, scope: !278, file: !1, line: 52, type: !282)
!295 = !DILocation(line: 52, column: 47, scope: !278)
!296 = !DILocation(line: 61, column: 7, scope: !278)
!297 = !DILocalVariable(name: ".omp.iv", scope: !278, type: !24, flags: DIFlagArtificial)
!298 = !DILocalVariable(name: ".omp.lb", scope: !278, type: !24, flags: DIFlagArtificial)
!299 = !DILocation(line: 61, column: 12, scope: !278)
!300 = !DILocalVariable(name: ".omp.ub", scope: !278, type: !24, flags: DIFlagArtificial)
!301 = !DILocalVariable(name: ".omp.stride", scope: !278, type: !24, flags: DIFlagArtificial)
!302 = !DILocalVariable(name: ".omp.is_last", scope: !278, type: !24, flags: DIFlagArtificial)
!303 = !DILocation(line: 60, column: 38, scope: !278)
!304 = !DILocalVariable(name: "C", scope: !278, type: !305, flags: DIFlagArtificial)
!305 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320000, elements: !306)
!306 = !{!307}
!307 = !DISubrange(count: 10000)
!308 = !DILocalVariable(name: "k", scope: !278, type: !24, flags: DIFlagArtificial)
!309 = !DILocation(line: 60, column: 1, scope: !278)
!310 = !DILocation(line: 61, column: 31, scope: !278)
!311 = !DILocation(line: 62, column: 34, scope: !312)
!312 = distinct !DILexicalBlock(scope: !278, file: !1, line: 61, column: 36)
!313 = !DILocation(line: 62, column: 36, scope: !312)
!314 = !DILocation(line: 62, column: 38, scope: !312)
!315 = !DILocation(line: 62, column: 45, scope: !312)
!316 = !DILocation(line: 62, column: 43, scope: !312)
!317 = !DILocation(line: 62, column: 32, scope: !312)
!318 = !DILocation(line: 62, column: 50, scope: !312)
!319 = !DILocation(line: 62, column: 52, scope: !312)
!320 = !DILocation(line: 62, column: 54, scope: !312)
!321 = !DILocation(line: 62, column: 61, scope: !312)
!322 = !DILocation(line: 62, column: 59, scope: !312)
!323 = !DILocation(line: 62, column: 48, scope: !312)
!324 = !DILocation(line: 62, column: 9, scope: !312)
!325 = !DILocation(line: 62, column: 11, scope: !312)
!326 = !DILocation(line: 62, column: 13, scope: !312)
!327 = !DILocation(line: 62, column: 20, scope: !312)
!328 = !DILocation(line: 62, column: 18, scope: !312)
!329 = !DILocation(line: 62, column: 23, scope: !312)
!330 = !DILocation(line: 63, column: 7, scope: !312)
!331 = distinct !{!331, !309, !332}
!332 = !DILocation(line: 60, column: 51, scope: !278)
!333 = !DILocation(line: 60, column: 36, scope: !278)
!334 = !DILocation(line: 63, column: 7, scope: !278)
!335 = distinct !DISubprogram(linkageName: ".omp.reduction.reduction_func", scope: !1, file: !1, line: 60, type: !336, scopeLine: 60, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!336 = !DISubroutineType(types: !2)
!337 = !DILocalVariable(arg: 1, scope: !335, type: !338, flags: DIFlagArtificial)
!338 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!339 = !DILocation(line: 0, scope: !335)
!340 = !DILocalVariable(arg: 2, scope: !335, type: !338, flags: DIFlagArtificial)
!341 = !DILocation(line: 60, column: 51, scope: !335)
!342 = !DILocation(line: 60, column: 38, scope: !335)
!343 = !DILocation(line: 60, column: 36, scope: !335)
!344 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 60, type: !279, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!345 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !344, type: !221, flags: DIFlagArtificial)
!346 = !DILocation(line: 0, scope: !344)
!347 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !344, type: !221, flags: DIFlagArtificial)
!348 = !DILocalVariable(name: "C", arg: 3, scope: !344, type: !106, flags: DIFlagArtificial)
!349 = !DILocalVariable(name: "i", arg: 4, scope: !344, type: !281, flags: DIFlagArtificial)
!350 = !DILocalVariable(name: "j", arg: 5, scope: !344, type: !281, flags: DIFlagArtificial)
!351 = !DILocalVariable(name: "A", arg: 6, scope: !344, type: !282, flags: DIFlagArtificial)
!352 = !DILocalVariable(name: "B", arg: 7, scope: !344, type: !282, flags: DIFlagArtificial)
!353 = !DILocation(line: 60, column: 1, scope: !344)
!354 = !{!355}
!355 = !{i64 2, i64 -1, i64 -1, i1 true}
!356 = distinct !DISubprogram(name: ".omp_outlined..2", scope: !1, file: !1, line: 56, type: !219, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!357 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !356, type: !221, flags: DIFlagArtificial)
!358 = !DILocation(line: 0, scope: !356)
!359 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !356, type: !221, flags: DIFlagArtificial)
!360 = !DILocalVariable(name: "C", arg: 3, scope: !356, type: !106, flags: DIFlagArtificial)
!361 = !DILocalVariable(name: "Cinit", arg: 4, scope: !356, type: !187, flags: DIFlagArtificial)
!362 = !DILocalVariable(name: "A", arg: 5, scope: !356, type: !106, flags: DIFlagArtificial)
!363 = !DILocalVariable(name: "B", arg: 6, scope: !356, type: !106, flags: DIFlagArtificial)
!364 = !DILocation(line: 56, column: 3, scope: !356)
!365 = distinct !DISubprogram(name: "__omp_offloading_32_82eb324_gemm_OMP_l56", scope: !1, file: !1, line: 56, type: !206, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!366 = !DILocalVariable(name: "C", arg: 1, scope: !365, type: !106, flags: DIFlagArtificial)
!367 = !DILocation(line: 0, scope: !365)
!368 = !DILocalVariable(name: "Cinit", arg: 2, scope: !365, type: !187, flags: DIFlagArtificial)
!369 = !DILocalVariable(name: "A", arg: 3, scope: !365, type: !106, flags: DIFlagArtificial)
!370 = !DILocalVariable(name: "B", arg: 4, scope: !365, type: !106, flags: DIFlagArtificial)
!371 = !DILocation(line: 56, column: 3, scope: !365)
!372 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 68, type: !373, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!373 = !DISubroutineType(types: !374)
!374 = !{null, !106, !106, !106, !106}
!375 = !DILocalVariable(name: "A", arg: 1, scope: !372, file: !1, line: 68, type: !106)
!376 = !DILocation(line: 68, column: 21, scope: !372)
!377 = !DILocalVariable(name: "B", arg: 2, scope: !372, file: !1, line: 68, type: !106)
!378 = !DILocation(line: 68, column: 43, scope: !372)
!379 = !DILocalVariable(name: "C", arg: 3, scope: !372, file: !1, line: 69, type: !106)
!380 = !DILocation(line: 69, column: 14, scope: !372)
!381 = !DILocalVariable(name: "C_OMP", arg: 4, scope: !372, file: !1, line: 69, type: !106)
!382 = !DILocation(line: 69, column: 36, scope: !372)
!383 = !DILocalVariable(name: "i", scope: !372, file: !1, line: 70, type: !24)
!384 = !DILocation(line: 70, column: 7, scope: !372)
!385 = !DILocalVariable(name: "j", scope: !372, file: !1, line: 70, type: !24)
!386 = !DILocation(line: 70, column: 10, scope: !372)
!387 = !DILocation(line: 72, column: 10, scope: !388)
!388 = distinct !DILexicalBlock(scope: !372, file: !1, line: 72, column: 3)
!389 = !DILocation(line: 72, column: 8, scope: !388)
!390 = !DILocation(line: 72, column: 15, scope: !391)
!391 = distinct !DILexicalBlock(scope: !388, file: !1, line: 72, column: 3)
!392 = !DILocation(line: 72, column: 17, scope: !391)
!393 = !DILocation(line: 72, column: 3, scope: !388)
!394 = !DILocation(line: 73, column: 12, scope: !395)
!395 = distinct !DILexicalBlock(scope: !396, file: !1, line: 73, column: 5)
!396 = distinct !DILexicalBlock(scope: !391, file: !1, line: 72, column: 28)
!397 = !DILocation(line: 73, column: 10, scope: !395)
!398 = !DILocation(line: 73, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !1, line: 73, column: 5)
!400 = !DILocation(line: 73, column: 19, scope: !399)
!401 = !DILocation(line: 73, column: 5, scope: !395)
!402 = !DILocation(line: 74, column: 35, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !1, line: 73, column: 30)
!404 = !DILocation(line: 74, column: 24, scope: !403)
!405 = !DILocation(line: 74, column: 39, scope: !403)
!406 = !DILocation(line: 74, column: 37, scope: !403)
!407 = !DILocation(line: 74, column: 42, scope: !403)
!408 = !DILocation(line: 74, column: 7, scope: !403)
!409 = !DILocation(line: 74, column: 9, scope: !403)
!410 = !DILocation(line: 74, column: 11, scope: !403)
!411 = !DILocation(line: 74, column: 18, scope: !403)
!412 = !DILocation(line: 74, column: 16, scope: !403)
!413 = !DILocation(line: 74, column: 21, scope: !403)
!414 = !DILocation(line: 75, column: 5, scope: !403)
!415 = !DILocation(line: 73, column: 26, scope: !399)
!416 = !DILocation(line: 73, column: 5, scope: !399)
!417 = distinct !{!417, !401, !418, !172}
!418 = !DILocation(line: 75, column: 5, scope: !395)
!419 = !DILocation(line: 76, column: 3, scope: !396)
!420 = !DILocation(line: 72, column: 24, scope: !391)
!421 = !DILocation(line: 72, column: 3, scope: !391)
!422 = distinct !{!422, !393, !423, !172}
!423 = !DILocation(line: 76, column: 3, scope: !388)
!424 = !DILocation(line: 78, column: 10, scope: !425)
!425 = distinct !DILexicalBlock(scope: !372, file: !1, line: 78, column: 3)
!426 = !DILocation(line: 78, column: 8, scope: !425)
!427 = !DILocation(line: 78, column: 15, scope: !428)
!428 = distinct !DILexicalBlock(scope: !425, file: !1, line: 78, column: 3)
!429 = !DILocation(line: 78, column: 17, scope: !428)
!430 = !DILocation(line: 78, column: 3, scope: !425)
!431 = !DILocation(line: 79, column: 12, scope: !432)
!432 = distinct !DILexicalBlock(scope: !433, file: !1, line: 79, column: 5)
!433 = distinct !DILexicalBlock(scope: !428, file: !1, line: 78, column: 28)
!434 = !DILocation(line: 79, column: 10, scope: !432)
!435 = !DILocation(line: 79, column: 17, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !1, line: 79, column: 5)
!437 = !DILocation(line: 79, column: 19, scope: !436)
!438 = !DILocation(line: 79, column: 5, scope: !432)
!439 = !DILocation(line: 80, column: 35, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !1, line: 79, column: 30)
!441 = !DILocation(line: 80, column: 24, scope: !440)
!442 = !DILocation(line: 80, column: 39, scope: !440)
!443 = !DILocation(line: 80, column: 37, scope: !440)
!444 = !DILocation(line: 80, column: 41, scope: !440)
!445 = !DILocation(line: 80, column: 46, scope: !440)
!446 = !DILocation(line: 80, column: 7, scope: !440)
!447 = !DILocation(line: 80, column: 9, scope: !440)
!448 = !DILocation(line: 80, column: 11, scope: !440)
!449 = !DILocation(line: 80, column: 18, scope: !440)
!450 = !DILocation(line: 80, column: 16, scope: !440)
!451 = !DILocation(line: 80, column: 21, scope: !440)
!452 = !DILocation(line: 81, column: 5, scope: !440)
!453 = !DILocation(line: 79, column: 26, scope: !436)
!454 = !DILocation(line: 79, column: 5, scope: !436)
!455 = distinct !{!455, !438, !456, !172}
!456 = !DILocation(line: 81, column: 5, scope: !432)
!457 = !DILocation(line: 82, column: 3, scope: !433)
!458 = !DILocation(line: 78, column: 24, scope: !428)
!459 = !DILocation(line: 78, column: 3, scope: !428)
!460 = distinct !{!460, !430, !461, !172}
!461 = !DILocation(line: 82, column: 3, scope: !425)
!462 = !DILocation(line: 84, column: 10, scope: !463)
!463 = distinct !DILexicalBlock(scope: !372, file: !1, line: 84, column: 3)
!464 = !DILocation(line: 84, column: 8, scope: !463)
!465 = !DILocation(line: 84, column: 15, scope: !466)
!466 = distinct !DILexicalBlock(scope: !463, file: !1, line: 84, column: 3)
!467 = !DILocation(line: 84, column: 17, scope: !466)
!468 = !DILocation(line: 84, column: 3, scope: !463)
!469 = !DILocation(line: 85, column: 12, scope: !470)
!470 = distinct !DILexicalBlock(scope: !471, file: !1, line: 85, column: 5)
!471 = distinct !DILexicalBlock(scope: !466, file: !1, line: 84, column: 28)
!472 = !DILocation(line: 85, column: 10, scope: !470)
!473 = !DILocation(line: 85, column: 17, scope: !474)
!474 = distinct !DILexicalBlock(scope: !470, file: !1, line: 85, column: 5)
!475 = !DILocation(line: 85, column: 19, scope: !474)
!476 = !DILocation(line: 85, column: 5, scope: !470)
!477 = !DILocation(line: 86, column: 35, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !1, line: 85, column: 30)
!479 = !DILocation(line: 86, column: 24, scope: !478)
!480 = !DILocation(line: 86, column: 39, scope: !478)
!481 = !DILocation(line: 86, column: 37, scope: !478)
!482 = !DILocation(line: 86, column: 41, scope: !478)
!483 = !DILocation(line: 86, column: 46, scope: !478)
!484 = !DILocation(line: 86, column: 7, scope: !478)
!485 = !DILocation(line: 86, column: 9, scope: !478)
!486 = !DILocation(line: 86, column: 11, scope: !478)
!487 = !DILocation(line: 86, column: 18, scope: !478)
!488 = !DILocation(line: 86, column: 16, scope: !478)
!489 = !DILocation(line: 86, column: 21, scope: !478)
!490 = !DILocation(line: 87, column: 39, scope: !478)
!491 = !DILocation(line: 87, column: 28, scope: !478)
!492 = !DILocation(line: 87, column: 43, scope: !478)
!493 = !DILocation(line: 87, column: 41, scope: !478)
!494 = !DILocation(line: 87, column: 45, scope: !478)
!495 = !DILocation(line: 87, column: 50, scope: !478)
!496 = !DILocation(line: 87, column: 7, scope: !478)
!497 = !DILocation(line: 87, column: 13, scope: !478)
!498 = !DILocation(line: 87, column: 15, scope: !478)
!499 = !DILocation(line: 87, column: 22, scope: !478)
!500 = !DILocation(line: 87, column: 20, scope: !478)
!501 = !DILocation(line: 87, column: 25, scope: !478)
!502 = !DILocation(line: 88, column: 5, scope: !478)
!503 = !DILocation(line: 85, column: 26, scope: !474)
!504 = !DILocation(line: 85, column: 5, scope: !474)
!505 = distinct !{!505, !476, !506, !172}
!506 = !DILocation(line: 88, column: 5, scope: !470)
!507 = !DILocation(line: 89, column: 3, scope: !471)
!508 = !DILocation(line: 84, column: 24, scope: !466)
!509 = !DILocation(line: 84, column: 3, scope: !466)
!510 = distinct !{!510, !468, !511, !172}
!511 = !DILocation(line: 89, column: 3, scope: !463)
!512 = !DILocation(line: 90, column: 1, scope: !372)
!513 = distinct !DISubprogram(name: "compareResults", scope: !1, file: !1, line: 92, type: !514, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!514 = !DISubroutineType(types: !515)
!515 = !{!24, !106, !106}
!516 = !DILocalVariable(name: "C", arg: 1, scope: !513, file: !1, line: 92, type: !106)
!517 = !DILocation(line: 92, column: 31, scope: !513)
!518 = !DILocalVariable(name: "C_outputFromGpu", arg: 2, scope: !513, file: !1, line: 92, type: !106)
!519 = !DILocation(line: 92, column: 45, scope: !513)
!520 = !DILocalVariable(name: "i", scope: !513, file: !1, line: 93, type: !24)
!521 = !DILocation(line: 93, column: 7, scope: !513)
!522 = !DILocalVariable(name: "j", scope: !513, file: !1, line: 93, type: !24)
!523 = !DILocation(line: 93, column: 10, scope: !513)
!524 = !DILocalVariable(name: "fail", scope: !513, file: !1, line: 93, type: !24)
!525 = !DILocation(line: 93, column: 13, scope: !513)
!526 = !DILocation(line: 94, column: 8, scope: !513)
!527 = !DILocation(line: 97, column: 10, scope: !528)
!528 = distinct !DILexicalBlock(scope: !513, file: !1, line: 97, column: 3)
!529 = !DILocation(line: 97, column: 8, scope: !528)
!530 = !DILocation(line: 97, column: 15, scope: !531)
!531 = distinct !DILexicalBlock(scope: !528, file: !1, line: 97, column: 3)
!532 = !DILocation(line: 97, column: 17, scope: !531)
!533 = !DILocation(line: 97, column: 3, scope: !528)
!534 = !DILocation(line: 98, column: 12, scope: !535)
!535 = distinct !DILexicalBlock(scope: !536, file: !1, line: 98, column: 5)
!536 = distinct !DILexicalBlock(scope: !531, file: !1, line: 97, column: 28)
!537 = !DILocation(line: 98, column: 10, scope: !535)
!538 = !DILocation(line: 98, column: 17, scope: !539)
!539 = distinct !DILexicalBlock(scope: !535, file: !1, line: 98, column: 5)
!540 = !DILocation(line: 98, column: 19, scope: !539)
!541 = !DILocation(line: 98, column: 5, scope: !535)
!542 = !DILocation(line: 99, column: 23, scope: !543)
!543 = distinct !DILexicalBlock(scope: !544, file: !1, line: 99, column: 11)
!544 = distinct !DILexicalBlock(scope: !539, file: !1, line: 98, column: 30)
!545 = !DILocation(line: 99, column: 25, scope: !543)
!546 = !DILocation(line: 99, column: 27, scope: !543)
!547 = !DILocation(line: 99, column: 34, scope: !543)
!548 = !DILocation(line: 99, column: 32, scope: !543)
!549 = !DILocation(line: 99, column: 38, scope: !543)
!550 = !DILocation(line: 99, column: 54, scope: !543)
!551 = !DILocation(line: 99, column: 56, scope: !543)
!552 = !DILocation(line: 99, column: 63, scope: !543)
!553 = !DILocation(line: 99, column: 61, scope: !543)
!554 = !DILocation(line: 99, column: 11, scope: !543)
!555 = !DILocation(line: 99, column: 67, scope: !543)
!556 = !DILocation(line: 99, column: 11, scope: !544)
!557 = !DILocation(line: 101, column: 13, scope: !558)
!558 = distinct !DILexicalBlock(scope: !543, file: !1, line: 100, column: 41)
!559 = !DILocation(line: 102, column: 17, scope: !558)
!560 = !DILocation(line: 102, column: 40, scope: !558)
!561 = !DILocation(line: 102, column: 42, scope: !558)
!562 = !DILocation(line: 102, column: 44, scope: !558)
!563 = !DILocation(line: 102, column: 51, scope: !558)
!564 = !DILocation(line: 102, column: 49, scope: !558)
!565 = !DILocation(line: 103, column: 17, scope: !558)
!566 = !DILocation(line: 103, column: 33, scope: !558)
!567 = !DILocation(line: 103, column: 35, scope: !558)
!568 = !DILocation(line: 103, column: 42, scope: !558)
!569 = !DILocation(line: 103, column: 40, scope: !558)
!570 = !DILocation(line: 102, column: 9, scope: !558)
!571 = !DILocation(line: 104, column: 7, scope: !558)
!572 = !DILocation(line: 105, column: 5, scope: !544)
!573 = !DILocation(line: 98, column: 26, scope: !539)
!574 = !DILocation(line: 98, column: 5, scope: !539)
!575 = distinct !{!575, !541, !576, !172}
!576 = !DILocation(line: 105, column: 5, scope: !535)
!577 = !DILocation(line: 106, column: 3, scope: !536)
!578 = !DILocation(line: 97, column: 24, scope: !531)
!579 = !DILocation(line: 97, column: 3, scope: !531)
!580 = distinct !{!580, !533, !581, !172}
!581 = !DILocation(line: 106, column: 3, scope: !528)
!582 = !DILocation(line: 111, column: 40, scope: !513)
!583 = !DILocation(line: 109, column: 3, scope: !513)
!584 = !DILocation(line: 113, column: 10, scope: !513)
!585 = !DILocation(line: 113, column: 3, scope: !513)
!586 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 116, type: !587, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!587 = !DISubroutineType(types: !588)
!588 = !{!24, !24, !589}
!589 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !590, size: 64)
!590 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !591, size: 64)
!591 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!592 = !DILocalVariable(name: "argc", arg: 1, scope: !586, file: !1, line: 116, type: !24)
!593 = !DILocation(line: 116, column: 14, scope: !586)
!594 = !DILocalVariable(name: "argv", arg: 2, scope: !586, file: !1, line: 116, type: !589)
!595 = !DILocation(line: 116, column: 26, scope: !586)
!596 = !DILocalVariable(name: "t_start", scope: !586, file: !1, line: 117, type: !18)
!597 = !DILocation(line: 117, column: 10, scope: !586)
!598 = !DILocalVariable(name: "t_end", scope: !586, file: !1, line: 117, type: !18)
!599 = !DILocation(line: 117, column: 19, scope: !586)
!600 = !DILocalVariable(name: "fail", scope: !586, file: !1, line: 118, type: !24)
!601 = !DILocation(line: 118, column: 7, scope: !586)
!602 = !DILocalVariable(name: "A", scope: !586, file: !1, line: 120, type: !305)
!603 = !DILocation(line: 120, column: 13, scope: !586)
!604 = !DILocalVariable(name: "B", scope: !586, file: !1, line: 121, type: !305)
!605 = !DILocation(line: 121, column: 13, scope: !586)
!606 = !DILocalVariable(name: "C", scope: !586, file: !1, line: 122, type: !305)
!607 = !DILocation(line: 122, column: 13, scope: !586)
!608 = !DILocalVariable(name: "C_outputFromGpu", scope: !586, file: !1, line: 123, type: !305)
!609 = !DILocation(line: 123, column: 13, scope: !586)
!610 = !DILocalVariable(name: "Cinit_outputFromGpu", scope: !586, file: !1, line: 124, type: !305)
!611 = !DILocation(line: 124, column: 13, scope: !586)
!612 = !DILocation(line: 126, column: 8, scope: !586)
!613 = !DILocation(line: 126, column: 11, scope: !586)
!614 = !DILocation(line: 126, column: 14, scope: !586)
!615 = !DILocation(line: 126, column: 17, scope: !586)
!616 = !DILocation(line: 126, column: 3, scope: !586)
!617 = !DILocation(line: 128, column: 12, scope: !586)
!618 = !DILocation(line: 128, column: 15, scope: !586)
!619 = !DILocation(line: 128, column: 18, scope: !586)
!620 = !DILocation(line: 128, column: 35, scope: !586)
!621 = !DILocation(line: 128, column: 3, scope: !586)
!622 = !DILocation(line: 146, column: 10, scope: !586)
!623 = !DILocation(line: 146, column: 3, scope: !586)
!624 = distinct !DISubprogram(linkageName: ".omp_offloading.requires_reg", scope: !1, file: !1, type: !336, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
