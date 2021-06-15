
; __CLANG_OFFLOAD_BUNDLE____START__ openmp-nvptx64
; ModuleID = 'openmp_reducer_gpu.c'
source_filename = "openmp_reducer_gpu.c"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%"union._openmp_teams_reduction_type_$_" = type { %struct._globalized_locals_ty }
%struct._globalized_locals_ty = type { [1024 x i32] }
%printf_args = type { i32 }

@"_openmp_kernel_static_glob_rd$ptr" = internal addrspace(3) global i8* undef
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2050, i32 3, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 3, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@.str = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 3, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@__openmp_nvptx_data_transfer_temporary_storage = weak addrspace(3) global [32 x i32] undef
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 3, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@"_openmp_teams_reductions_buffer_$_$ptr" = internal constant i8* bitcast (%"union._openmp_teams_reduction_type_$_"* @"_openmp_teams_reductions_buffer_$_" to i8*)
@__omp_offloading_34_b4bf2f7_main_l50_exec_mode = weak constant i8 0
@"_openmp_teams_reductions_buffer_$_" = internal global %"union._openmp_teams_reduction_type_$_" zeroinitializer
@llvm.compiler.used = appending global [2 x i8*] [i8* addrspacecast (i8 addrspace(3)* bitcast ([32 x i32] addrspace(3)* @__openmp_nvptx_data_transfer_temporary_storage to i8 addrspace(3)*) to i8*), i8* @__omp_offloading_34_b4bf2f7_main_l50_exec_mode], section "llvm.metadata"

; Function Attrs: convergent noinline norecurse nounwind optnone
define weak void @__omp_offloading_34_b4bf2f7_main_l50(i32* nonnull align 4 dereferenceable(4) %result, i32* %h) #0 {
entry:
  %result.addr = alloca i32*, align 8
  %h.addr = alloca i32*, align 8
  %.zero.addr = alloca i32, align 4
  %.threadid_temp. = alloca i32, align 4
  store i32 0, i32* %.zero.addr, align 4
  store i32* %result, i32** %result.addr, align 8
  store i32* %h, i32** %h.addr, align 8
  %0 = load i32*, i32** %result.addr, align 8
  %nvptx_num_threads = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  call void @__kmpc_spmd_kernel_init(i32 %nvptx_num_threads, i16 0)
  br label %.execute

.execute:                                         ; preds = %entry
  %1 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @3)
  %2 = load i32*, i32** %h.addr, align 8
  store i32 %1, i32* %.threadid_temp., align 4
  call void @__omp_outlined__(i32* %.threadid_temp., i32* %.zero.addr, i32* %0, i32* %2) #2
  br label %.omp.deinit

.omp.deinit:                                      ; preds = %.execute
  call void @__kmpc_spmd_kernel_deinit_v2(i16 0)
  br label %.exit

.exit:                                            ; preds = %.omp.deinit
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

declare void @__kmpc_spmd_kernel_init(i32, i16)

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined__(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* nonnull align 4 dereferenceable(4) %result, i32* %h) #0 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %result.addr = alloca i32*, align 8
  %h.addr = alloca i32*, align 8
  %result1 = alloca i32, align 4
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.comb.lb = alloca i32, align 4
  %.omp.comb.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  %captured_vars_addrs = alloca [4 x i8*], align 8
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  store i32* %result, i32** %result.addr, align 8
  store i32* %h, i32** %h.addr, align 8
  %0 = load i32*, i32** %result.addr, align 8
  store i32 0, i32* %result1, align 4
  store i32 0, i32* %.omp.comb.lb, align 4
  store i32 999, i32* %.omp.comb.ub, align 4
  store i32 1, i32* %.omp.stride, align 4
  store i32 0, i32* %.omp.is_last, align 4
  %nvptx_num_threads = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %1 = load i32*, i32** %.global_tid..addr, align 8
  %2 = load i32, i32* %1, align 4
  call void @__kmpc_for_static_init_4u(%struct.ident_t* @1, i32 %2, i32 91, i32* %.omp.is_last, i32* %.omp.comb.lb, i32* %.omp.comb.ub, i32* %.omp.stride, i32 1, i32 %nvptx_num_threads)
  %3 = load i32, i32* %.omp.comb.ub, align 4
  %cmp = icmp ugt i32 %3, 999
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32, i32* %.omp.comb.ub, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 999, %cond.true ], [ %4, %cond.false ]
  store i32 %cond, i32* %.omp.comb.ub, align 4
  %5 = load i32, i32* %.omp.comb.lb, align 4
  store i32 %5, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %cond.end8, %cond.end
  %6 = load i32, i32* %.omp.iv, align 4
  %cmp2 = icmp ult i32 %6, 1000
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %7 = load i32, i32* %.omp.comb.lb, align 4
  %8 = zext i32 %7 to i64
  %9 = load i32, i32* %.omp.comb.ub, align 4
  %10 = zext i32 %9 to i64
  %11 = load i32*, i32** %h.addr, align 8
  %12 = getelementptr inbounds [4 x i8*], [4 x i8*]* %captured_vars_addrs, i64 0, i64 0
  %13 = inttoptr i64 %8 to i8*
  store i8* %13, i8** %12, align 8
  %14 = getelementptr inbounds [4 x i8*], [4 x i8*]* %captured_vars_addrs, i64 0, i64 1
  %15 = inttoptr i64 %10 to i8*
  store i8* %15, i8** %14, align 8
  %16 = getelementptr inbounds [4 x i8*], [4 x i8*]* %captured_vars_addrs, i64 0, i64 2
  %17 = bitcast i32* %result1 to i8*
  store i8* %17, i8** %16, align 8
  %18 = getelementptr inbounds [4 x i8*], [4 x i8*]* %captured_vars_addrs, i64 0, i64 3
  %19 = bitcast i32* %11 to i8*
  store i8* %19, i8** %18, align 8
  %20 = bitcast [4 x i8*]* %captured_vars_addrs to i8**
  call void @__kmpc_parallel_51(%struct.ident_t* @3, i32 %2, i32 1, i32 -1, i32 -1, i8* bitcast (void (i32*, i32*, i64, i64, i32*, i32*)* @__omp_outlined__1 to i8*), i8* null, i8** %20, i64 4)
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.inner.for.body
  %21 = load i32, i32* %.omp.iv, align 4
  %22 = load i32, i32* %.omp.stride, align 4
  %add = add i32 %21, %22
  store i32 %add, i32* %.omp.iv, align 4
  %23 = load i32, i32* %.omp.comb.lb, align 4
  %24 = load i32, i32* %.omp.stride, align 4
  %add3 = add i32 %23, %24
  store i32 %add3, i32* %.omp.comb.lb, align 4
  %25 = load i32, i32* %.omp.comb.ub, align 4
  %26 = load i32, i32* %.omp.stride, align 4
  %add4 = add i32 %25, %26
  store i32 %add4, i32* %.omp.comb.ub, align 4
  %27 = load i32, i32* %.omp.comb.ub, align 4
  %cmp5 = icmp ugt i32 %27, 999
  br i1 %cmp5, label %cond.true6, label %cond.false7

cond.true6:                                       ; preds = %omp.inner.for.inc
  br label %cond.end8

cond.false7:                                      ; preds = %omp.inner.for.inc
  %28 = load i32, i32* %.omp.comb.ub, align 4
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false7, %cond.true6
  %cond9 = phi i32 [ 999, %cond.true6 ], [ %28, %cond.false7 ]
  store i32 %cond9, i32* %.omp.comb.ub, align 4
  %29 = load i32, i32* %.omp.comb.lb, align 4
  store i32 %29, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %2)
  %30 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0
  %31 = bitcast i32* %result1 to i8*
  store i8* %31, i8** %30, align 8
  %32 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*
  %33 = load i8*, i8** @"_openmp_teams_reductions_buffer_$_$ptr", align 8
  %34 = call i32 @__kmpc_nvptx_teams_reduce_nowait_v2(%struct.ident_t* @3, i32 %2, i8* %33, i32 1024, i8* %32, void (i8*, i16, i16, i16)* @_omp_reduction_shuffle_and_reduce_func3, void (i8*, i32)* @_omp_reduction_inter_warp_copy_func4, void (i8*, i32, i8*)* @_omp_reduction_list_to_global_copy_func, void (i8*, i32, i8*)* @_omp_reduction_list_to_global_reduce_func, void (i8*, i32, i8*)* @_omp_reduction_global_to_list_copy_func, void (i8*, i32, i8*)* @_omp_reduction_global_to_list_reduce_func)
  %35 = icmp eq i32 %34, 1
  br i1 %35, label %.omp.reduction.then, label %.omp.reduction.done

.omp.reduction.then:                              ; preds = %omp.loop.exit
  %36 = load i32, i32* %0, align 4
  %37 = load i32, i32* %result1, align 4
  %cmp10 = icmp ugt i32 %36, %37
  br i1 %cmp10, label %cond.true11, label %cond.false12

cond.true11:                                      ; preds = %.omp.reduction.then
  %38 = load i32, i32* %0, align 4
  br label %cond.end13

cond.false12:                                     ; preds = %.omp.reduction.then
  %39 = load i32, i32* %result1, align 4
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true11
  %cond14 = phi i32 [ %38, %cond.true11 ], [ %39, %cond.false12 ]
  store i32 %cond14, i32* %0, align 4
  call void @__kmpc_nvptx_end_reduce_nowait(i32 %2)
  br label %.omp.reduction.done

.omp.reduction.done:                              ; preds = %cond.end13, %omp.loop.exit
  ret void
}

declare void @__kmpc_for_static_init_4u(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal void @__omp_outlined__1(i32* noalias %.global_tid., i32* noalias %.bound_tid., i64 %.previous.lb., i64 %.previous.ub., i32* nonnull align 4 dereferenceable(4) %result, i32* %h) #0 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %.previous.lb..addr = alloca i64, align 8
  %.previous.ub..addr = alloca i64, align 8
  %result.addr = alloca i32*, align 8
  %h.addr = alloca i32*, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %result2 = alloca i32, align 4
  %i = alloca i32, align 4
  %tmp7 = alloca %printf_args, align 8
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  store i64 %.previous.lb., i64* %.previous.lb..addr, align 8
  store i64 %.previous.ub., i64* %.previous.ub..addr, align 8
  store i32* %result, i32** %result.addr, align 8
  store i32* %h, i32** %h.addr, align 8
  %0 = load i32*, i32** %result.addr, align 8
  store i32 0, i32* %.omp.lb, align 4
  store i32 999, i32* %.omp.ub, align 4
  %1 = load i64, i64* %.previous.lb..addr, align 8
  %conv = trunc i64 %1 to i32
  %2 = load i64, i64* %.previous.ub..addr, align 8
  %conv1 = trunc i64 %2 to i32
  store i32 %conv, i32* %.omp.lb, align 4
  store i32 %conv1, i32* %.omp.ub, align 4
  store i32 1, i32* %.omp.stride, align 4
  store i32 0, i32* %.omp.is_last, align 4
  store i32 0, i32* %result2, align 4
  %3 = load i32*, i32** %.global_tid..addr, align 8
  %4 = load i32, i32* %3, align 4
  call void @__kmpc_for_static_init_4u(%struct.ident_t* @2, i32 %4, i32 33, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1)
  %5 = load i32, i32* %.omp.lb, align 4
  store i32 %5, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %entry
  %6 = load i32, i32* %.omp.iv, align 4
  %conv3 = zext i32 %6 to i64
  %7 = load i64, i64* %.previous.ub..addr, align 8
  %add = add i64 %7, 1
  %cmp = icmp ult i64 %conv3, %add
  br i1 %cmp, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %8 = load i32, i32* %.omp.iv, align 4
  %mul = mul i32 %8, 1
  %add5 = add i32 0, %mul
  store i32 %add5, i32* %i, align 4
  %9 = load i32*, i32** %h.addr, align 8
  %10 = load i32, i32* %i, align 4
  %idxprom = zext i32 %10 to i64
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom
  %11 = load i32, i32* %arrayidx, align 4
  %12 = load i32, i32* %result2, align 4
  %add6 = add i32 %12, %11
  store i32 %add6, i32* %result2, align 4
  %13 = load i32, i32* %result2, align 4
  %14 = getelementptr inbounds %printf_args, %printf_args* %tmp7, i32 0, i32 0
  store i32 %13, i32* %14, align 4
  %15 = bitcast %printf_args* %tmp7 to i8*
  %16 = call i32 @vprintf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %15)
  br label %omp.body.continue

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %17 = load i32, i32* %.omp.iv, align 4
  %18 = load i32, i32* %.omp.stride, align 4
  %add8 = add i32 %17, %18
  store i32 %add8, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %4)
  %19 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0
  %20 = bitcast i32* %result2 to i8*
  store i8* %20, i8** %19, align 8
  %21 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*
  %22 = call i32 @__kmpc_nvptx_parallel_reduce_nowait_v2(%struct.ident_t* @3, i32 %4, i32 1, i64 8, i8* %21, void (i8*, i16, i16, i16)* @_omp_reduction_shuffle_and_reduce_func, void (i8*, i32)* @_omp_reduction_inter_warp_copy_func)
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %.omp.reduction.then, label %.omp.reduction.done

.omp.reduction.then:                              ; preds = %omp.loop.exit
  %24 = load i32, i32* %0, align 4
  %25 = load i32, i32* %result2, align 4
  %cmp9 = icmp ugt i32 %24, %25
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %.omp.reduction.then
  %26 = load i32, i32* %0, align 4
  br label %cond.end

cond.false:                                       ; preds = %.omp.reduction.then
  %27 = load i32, i32* %result2, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %26, %cond.true ], [ %27, %cond.false ]
  store i32 %cond, i32* %0, align 4
  call void @__kmpc_nvptx_end_reduce_nowait(i32 %4)
  br label %.omp.reduction.done

.omp.reduction.done:                              ; preds = %cond.end, %omp.loop.exit
  ret void
}

declare i32 @vprintf(i8*, i8*)

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) #2

; Function Attrs: convergent noinline norecurse nounwind
define internal void @"_omp$reduction$reduction_func"(i8* %0, i8* %1) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  store i8* %1, i8** %.addr1, align 8
  %2 = load i8*, i8** %.addr, align 8
  %3 = bitcast i8* %2 to [1 x i8*]*
  %4 = load i8*, i8** %.addr1, align 8
  %5 = bitcast i8* %4 to [1 x i8*]*
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %8, align 4
  %cmp = icmp ugt i32 %12, %13
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %14 = load i32, i32* %11, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %15 = load i32, i32* %8, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %14, %cond.true ], [ %15, %cond.false ]
  store i32 %cond, i32* %11, align 4
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_shuffle_and_reduce_func(i8* %0, i16 signext %1, i16 signext %2, i16 signext %3) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i16, align 2
  %.addr2 = alloca i16, align 2
  %.addr3 = alloca i16, align 2
  %.omp.reduction.remote_reduce_list = alloca [1 x i8*], align 8
  %.omp.reduction.element = alloca i32, align 4
  store i8* %0, i8** %.addr, align 8
  store i16 %1, i16* %.addr1, align 2
  store i16 %2, i16* %.addr2, align 2
  store i16 %3, i16* %.addr3, align 2
  %4 = load i8*, i8** %.addr, align 8
  %5 = bitcast i8* %4 to [1 x i8*]*
  %6 = load i16, i16* %.addr1, align 2
  %7 = load i16, i16* %.addr2, align 2
  %8 = load i16, i16* %.addr3, align 2
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.remote_reduce_list, i64 0, i64 0
  %12 = bitcast i8* %10 to i32*
  %13 = getelementptr i32, i32* %12, i64 1
  %14 = bitcast i32* %13 to i8*
  %15 = load i32, i32* %12, align 4
  %nvptx_warp_size = call i32 @llvm.nvvm.read.ptx.sreg.warpsize()
  %16 = trunc i32 %nvptx_warp_size to i16
  %17 = call i32 @__kmpc_shuffle_int32(i32 %15, i16 %7, i16 %16)
  store i32 %17, i32* %.omp.reduction.element, align 4
  %18 = getelementptr i32, i32* %12, i64 1
  %19 = getelementptr i32, i32* %.omp.reduction.element, i64 1
  %20 = bitcast i32* %.omp.reduction.element to i8*
  store i8* %20, i8** %11, align 8
  %21 = icmp eq i16 %8, 0
  %22 = icmp eq i16 %8, 1
  %23 = icmp ult i16 %6, %7
  %24 = and i1 %22, %23
  %25 = icmp eq i16 %8, 2
  %26 = and i16 %6, 1
  %27 = icmp eq i16 %26, 0
  %28 = and i1 %25, %27
  %29 = icmp sgt i16 %7, 0
  %30 = and i1 %28, %29
  %31 = or i1 %21, %24
  %32 = or i1 %31, %30
  br i1 %32, label %then, label %else

then:                                             ; preds = %entry
  %33 = bitcast [1 x i8*]* %5 to i8*
  %34 = bitcast [1 x i8*]* %.omp.reduction.remote_reduce_list to i8*
  call void @"_omp$reduction$reduction_func"(i8* %33, i8* %34) #2
  br label %ifcont

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %35 = icmp eq i16 %8, 1
  %36 = icmp uge i16 %6, %7
  %37 = and i1 %35, %36
  br i1 %37, label %then4, label %else5

then4:                                            ; preds = %ifcont
  %38 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.remote_reduce_list, i64 0, i64 0
  %39 = load i8*, i8** %38, align 8
  %40 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0
  %41 = load i8*, i8** %40, align 8
  %42 = bitcast i8* %39 to i32*
  %43 = bitcast i8* %41 to i32*
  %44 = load i32, i32* %42, align 4
  store i32 %44, i32* %43, align 4
  br label %ifcont6

else5:                                            ; preds = %ifcont
  br label %ifcont6

ifcont6:                                          ; preds = %else5, %then4
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.warpsize() #1

declare i32 @__kmpc_shuffle_int32(i32, i16, i16)

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_inter_warp_copy_func(i8* %0, i32 %1) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i32, align 4
  %2 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @3)
  store i8* %0, i8** %.addr, align 8
  store i32 %1, i32* %.addr1, align 4
  %nvptx_tid = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %nvptx_tid2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %nvptx_lane_id = and i32 %nvptx_tid2, 31
  %nvptx_tid3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %nvptx_warp_id = ashr i32 %nvptx_tid3, 5
  %3 = load i8*, i8** %.addr, align 8
  %4 = bitcast i8* %3 to [1 x i8*]*
  call void @__kmpc_barrier(%struct.ident_t* @4, i32 %2)
  %warp_master = icmp eq i32 %nvptx_lane_id, 0
  br i1 %warp_master, label %then, label %else

then:                                             ; preds = %entry
  %5 = getelementptr inbounds [1 x i8*], [1 x i8*]* %4, i64 0, i64 0
  %6 = load i8*, i8** %5, align 8
  %7 = bitcast i8* %6 to i32*
  %8 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @__openmp_nvptx_data_transfer_temporary_storage, i64 0, i32 %nvptx_warp_id
  %9 = load i32, i32* %7, align 4
  store volatile i32 %9, i32 addrspace(3)* %8, align 4
  br label %ifcont

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  call void @__kmpc_barrier(%struct.ident_t* @4, i32 %2)
  %10 = load i32, i32* %.addr1, align 4
  %is_active_thread = icmp ult i32 %nvptx_tid, %10
  br i1 %is_active_thread, label %then4, label %else5

then4:                                            ; preds = %ifcont
  %11 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @__openmp_nvptx_data_transfer_temporary_storage, i64 0, i32 %nvptx_tid
  %12 = getelementptr inbounds [1 x i8*], [1 x i8*]* %4, i64 0, i64 0
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to i32*
  %15 = load volatile i32, i32 addrspace(3)* %11, align 4
  store i32 %15, i32* %14, align 4
  br label %ifcont6

else5:                                            ; preds = %ifcont
  br label %ifcont6

ifcont6:                                          ; preds = %else5, %then4
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(%struct.ident_t*) #2

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(%struct.ident_t*, i32) #4

declare i32 @__kmpc_nvptx_parallel_reduce_nowait_v2(%struct.ident_t*, i32, i32, i64, i8*, void (i8*, i16, i16, i16)*, void (i8*, i32)*)

declare void @__kmpc_nvptx_end_reduce_nowait(i32)

declare void @__kmpc_parallel_51(%struct.ident_t*, i32, i32, i32, i32, i8*, i8*, i8**, i64)

; Function Attrs: convergent noinline norecurse nounwind
define internal void @"_omp$reduction$reduction_func2"(i8* %0, i8* %1) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  store i8* %1, i8** %.addr1, align 8
  %2 = load i8*, i8** %.addr, align 8
  %3 = bitcast i8* %2 to [1 x i8*]*
  %4 = load i8*, i8** %.addr1, align 8
  %5 = bitcast i8* %4 to [1 x i8*]*
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %8, align 4
  %cmp = icmp ugt i32 %12, %13
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %14 = load i32, i32* %11, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %15 = load i32, i32* %8, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %14, %cond.true ], [ %15, %cond.false ]
  store i32 %cond, i32* %11, align 4
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_shuffle_and_reduce_func3(i8* %0, i16 signext %1, i16 signext %2, i16 signext %3) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i16, align 2
  %.addr2 = alloca i16, align 2
  %.addr3 = alloca i16, align 2
  %.omp.reduction.remote_reduce_list = alloca [1 x i8*], align 8
  %.omp.reduction.element = alloca i32, align 4
  store i8* %0, i8** %.addr, align 8
  store i16 %1, i16* %.addr1, align 2
  store i16 %2, i16* %.addr2, align 2
  store i16 %3, i16* %.addr3, align 2
  %4 = load i8*, i8** %.addr, align 8
  %5 = bitcast i8* %4 to [1 x i8*]*
  %6 = load i16, i16* %.addr1, align 2
  %7 = load i16, i16* %.addr2, align 2
  %8 = load i16, i16* %.addr3, align 2
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.remote_reduce_list, i64 0, i64 0
  %12 = bitcast i8* %10 to i32*
  %13 = getelementptr i32, i32* %12, i64 1
  %14 = bitcast i32* %13 to i8*
  %15 = load i32, i32* %12, align 4
  %nvptx_warp_size = call i32 @llvm.nvvm.read.ptx.sreg.warpsize()
  %16 = trunc i32 %nvptx_warp_size to i16
  %17 = call i32 @__kmpc_shuffle_int32(i32 %15, i16 %7, i16 %16)
  store i32 %17, i32* %.omp.reduction.element, align 4
  %18 = getelementptr i32, i32* %12, i64 1
  %19 = getelementptr i32, i32* %.omp.reduction.element, i64 1
  %20 = bitcast i32* %.omp.reduction.element to i8*
  store i8* %20, i8** %11, align 8
  %21 = icmp eq i16 %8, 0
  %22 = icmp eq i16 %8, 1
  %23 = icmp ult i16 %6, %7
  %24 = and i1 %22, %23
  %25 = icmp eq i16 %8, 2
  %26 = and i16 %6, 1
  %27 = icmp eq i16 %26, 0
  %28 = and i1 %25, %27
  %29 = icmp sgt i16 %7, 0
  %30 = and i1 %28, %29
  %31 = or i1 %21, %24
  %32 = or i1 %31, %30
  br i1 %32, label %then, label %else

then:                                             ; preds = %entry
  %33 = bitcast [1 x i8*]* %5 to i8*
  %34 = bitcast [1 x i8*]* %.omp.reduction.remote_reduce_list to i8*
  call void @"_omp$reduction$reduction_func2"(i8* %33, i8* %34) #2
  br label %ifcont

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %35 = icmp eq i16 %8, 1
  %36 = icmp uge i16 %6, %7
  %37 = and i1 %35, %36
  br i1 %37, label %then4, label %else5

then4:                                            ; preds = %ifcont
  %38 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.remote_reduce_list, i64 0, i64 0
  %39 = load i8*, i8** %38, align 8
  %40 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0
  %41 = load i8*, i8** %40, align 8
  %42 = bitcast i8* %39 to i32*
  %43 = bitcast i8* %41 to i32*
  %44 = load i32, i32* %42, align 4
  store i32 %44, i32* %43, align 4
  br label %ifcont6

else5:                                            ; preds = %ifcont
  br label %ifcont6

ifcont6:                                          ; preds = %else5, %then4
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_inter_warp_copy_func4(i8* %0, i32 %1) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i32, align 4
  %2 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @3)
  store i8* %0, i8** %.addr, align 8
  store i32 %1, i32* %.addr1, align 4
  %nvptx_tid = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %nvptx_tid2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %nvptx_lane_id = and i32 %nvptx_tid2, 31
  %nvptx_tid3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %nvptx_warp_id = ashr i32 %nvptx_tid3, 5
  %3 = load i8*, i8** %.addr, align 8
  %4 = bitcast i8* %3 to [1 x i8*]*
  call void @__kmpc_barrier(%struct.ident_t* @4, i32 %2)
  %warp_master = icmp eq i32 %nvptx_lane_id, 0
  br i1 %warp_master, label %then, label %else

then:                                             ; preds = %entry
  %5 = getelementptr inbounds [1 x i8*], [1 x i8*]* %4, i64 0, i64 0
  %6 = load i8*, i8** %5, align 8
  %7 = bitcast i8* %6 to i32*
  %8 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @__openmp_nvptx_data_transfer_temporary_storage, i64 0, i32 %nvptx_warp_id
  %9 = load i32, i32* %7, align 4
  store volatile i32 %9, i32 addrspace(3)* %8, align 4
  br label %ifcont

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  call void @__kmpc_barrier(%struct.ident_t* @4, i32 %2)
  %10 = load i32, i32* %.addr1, align 4
  %is_active_thread = icmp ult i32 %nvptx_tid, %10
  br i1 %is_active_thread, label %then4, label %else5

then4:                                            ; preds = %ifcont
  %11 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @__openmp_nvptx_data_transfer_temporary_storage, i64 0, i32 %nvptx_tid
  %12 = getelementptr inbounds [1 x i8*], [1 x i8*]* %4, i64 0, i64 0
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to i32*
  %15 = load volatile i32, i32 addrspace(3)* %11, align 4
  store i32 %15, i32* %14, align 4
  br label %ifcont6

else5:                                            ; preds = %ifcont
  br label %ifcont6

ifcont6:                                          ; preds = %else5, %then4
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_list_to_global_copy_func(i8* %0, i32 %1, i8* %2) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i32, align 4
  %.addr2 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  store i32 %1, i32* %.addr1, align 4
  store i8* %2, i8** %.addr2, align 8
  %3 = load i8*, i8** %.addr2, align 8
  %4 = bitcast i8* %3 to [1 x i8*]*
  %5 = load i8*, i8** %.addr, align 8
  %6 = bitcast i8* %5 to %struct._globalized_locals_ty*
  %7 = load i32, i32* %.addr1, align 4
  %8 = getelementptr inbounds [1 x i8*], [1 x i8*]* %4, i64 0, i64 0
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast i8* %9 to i32*
  %result = getelementptr inbounds %struct._globalized_locals_ty, %struct._globalized_locals_ty* %6, i32 0, i32 0
  %11 = getelementptr inbounds [1024 x i32], [1024 x i32]* %result, i32 0, i32 %7
  %12 = load i32, i32* %10, align 4
  store i32 %12, i32* %11, align 128
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_list_to_global_reduce_func(i8* %0, i32 %1, i8* %2) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i32, align 4
  %.addr2 = alloca i8*, align 8
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  store i8* %0, i8** %.addr, align 8
  store i32 %1, i32* %.addr1, align 4
  store i8* %2, i8** %.addr2, align 8
  %3 = load i8*, i8** %.addr, align 8
  %4 = bitcast i8* %3 to %struct._globalized_locals_ty*
  %5 = load i32, i32* %.addr1, align 4
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0
  %result = getelementptr inbounds %struct._globalized_locals_ty, %struct._globalized_locals_ty* %4, i32 0, i32 0
  %7 = getelementptr inbounds [1024 x i32], [1024 x i32]* %result, i32 0, i32 %5
  %8 = bitcast i32* %7 to i8*
  store i8* %8, i8** %6, align 8
  %9 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*
  %10 = load i8*, i8** %.addr2, align 8
  call void @"_omp$reduction$reduction_func2"(i8* %9, i8* %10) #2
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_global_to_list_copy_func(i8* %0, i32 %1, i8* %2) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i32, align 4
  %.addr2 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  store i32 %1, i32* %.addr1, align 4
  store i8* %2, i8** %.addr2, align 8
  %3 = load i8*, i8** %.addr2, align 8
  %4 = bitcast i8* %3 to [1 x i8*]*
  %5 = load i8*, i8** %.addr, align 8
  %6 = bitcast i8* %5 to %struct._globalized_locals_ty*
  %7 = load i32, i32* %.addr1, align 4
  %8 = getelementptr inbounds [1 x i8*], [1 x i8*]* %4, i64 0, i64 0
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast i8* %9 to i32*
  %result = getelementptr inbounds %struct._globalized_locals_ty, %struct._globalized_locals_ty* %6, i32 0, i32 0
  %11 = getelementptr inbounds [1024 x i32], [1024 x i32]* %result, i32 0, i32 %7
  %12 = load i32, i32* %11, align 128
  store i32 %12, i32* %10, align 4
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define internal void @_omp_reduction_global_to_list_reduce_func(i8* %0, i32 %1, i8* %2) #3 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i32, align 4
  %.addr2 = alloca i8*, align 8
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  store i8* %0, i8** %.addr, align 8
  store i32 %1, i32* %.addr1, align 4
  store i8* %2, i8** %.addr2, align 8
  %3 = load i8*, i8** %.addr, align 8
  %4 = bitcast i8* %3 to %struct._globalized_locals_ty*
  %5 = load i32, i32* %.addr1, align 4
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0
  %result = getelementptr inbounds %struct._globalized_locals_ty, %struct._globalized_locals_ty* %4, i32 0, i32 0
  %7 = getelementptr inbounds [1024 x i32], [1024 x i32]* %result, i32 0, i32 %5
  %8 = bitcast i32* %7 to i8*
  store i8* %8, i8** %6, align 8
  %9 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*
  %10 = load i8*, i8** %.addr2, align 8
  call void @"_omp$reduction$reduction_func2"(i8* %10, i8* %9) #2
  ret void
}

declare i32 @__kmpc_nvptx_teams_reduce_nowait_v2(%struct.ident_t*, i32, i8*, i32, i8*, void (i8*, i16, i16, i16)*, void (i8*, i32)*, void (i8*, i32, i8*)*, void (i8*, i32, i8*)*, void (i8*, i32, i8*)*, void (i8*, i32, i8*)*)

declare void @__kmpc_spmd_kernel_deinit_v2(i16)

attributes #0 = { convergent noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "target-features"="+ptx32,+sm_80" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { convergent noinline norecurse nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "target-features"="+ptx32,+sm_80" }
attributes #4 = { convergent nounwind }

!omp_offload.info = !{!0}
!nvvm.annotations = !{!1}
!llvm.module.flags = !{!2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 0, i32 52, i32 189526775, !"main", i32 50, i32 0}
!1 = !{void (i32*, i32*)* @__omp_offloading_34_b4bf2f7_main_l50, !"kernel", i32 1}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"PIC Level", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d8c5a4d6b6efad405c71ead8997276d8d3a7c5ad)"}

; __CLANG_OFFLOAD_BUNDLE____END__ openmp-nvptx64

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = '/tmp/openmp_reducer_gpu-ff6f8f.bc'
source_filename = "openmp_reducer_gpu.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct.__tgt_offload_entry = type { i8*, i8*, i64, i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.tms = type { i64, i64, i64, i64 }

@.str = private unnamed_addr constant [18 x i8] c"\0AStarting clock.\0A\00", align 1
@.offload_sizes = private unnamed_addr constant [2 x i64] [i64 4000, i64 4]
@.offload_maptypes = private unnamed_addr constant [2 x i64] [i64 1, i64 3]
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2050, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@.str.2 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 18, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@.__omp_offloading_34_b4bf2f7_main_l50.region_id = weak constant i8 0
@.offload_sizes.4 = private unnamed_addr constant [2 x i64] [i64 4, i64 0]
@.offload_maptypes.5 = private unnamed_addr constant [2 x i64] [i64 35, i64 544]
@.str.6 = private unnamed_addr constant [16 x i8] c"Stopped clock.\0A\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"Checksum: %u\0A\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"\0AElapsed time = %g ms.\0A\00", align 1
@.omp_offloading.entry_name = internal unnamed_addr constant [37 x i8] c"__omp_offloading_34_b4bf2f7_main_l50\00"
@.omp_offloading.entry.__omp_offloading_34_b4bf2f7_main_l50 = weak constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_34_b4bf2f7_main_l50.region_id, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.omp_offloading.entry_name, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @.omp_offloading.requires_reg, i8* null }]

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dense(i32* %h) #0 {
entry:
  %h.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %h, i32** %h.addr, align 8
  call void @srand(i32 0) #3
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %0, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand() #3
  %rem = urem i32 %call, 1000
  %1 = load i32*, i32** %h.addr, align 8
  %2 = load i32, i32* %i, align 4
  %idxprom = zext i32 %2 to i64
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom
  store i32 %rem, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !5

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %h = alloca i32*, align 8
  %result = alloca i32, align 4
  %nBytes = alloca i32, align 4
  %etstart = alloca %struct.timeval, align 8
  %etstop = alloca %struct.timeval, align 8
  %tzdummy = alloca %struct.timezone, align 4
  %etstart2 = alloca i64, align 8
  %etstop2 = alloca i64, align 8
  %usecstart = alloca i64, align 8
  %usecstop = alloca i64, align 8
  %cputstart = alloca %struct.tms, align 8
  %cputstop = alloca %struct.tms, align 8
  %.offload_baseptrs = alloca [2 x i8*], align 8
  %.offload_ptrs = alloca [2 x i8*], align 8
  %.offload_mappers = alloca [2 x i8*], align 8
  %.offload_baseptrs4 = alloca [2 x i8*], align 8
  %.offload_ptrs5 = alloca [2 x i8*], align 8
  %.offload_mappers6 = alloca [2 x i8*], align 8
  %tmp = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %result, align 4
  store i32 4000, i32* %nBytes, align 4
  %0 = load i32, i32* %nBytes, align 4
  %conv = sext i32 %0 to i64
  %call = call noalias align 16 i8* @malloc(i64 %conv) #3
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %h, align 8
  %2 = load i32*, i32** %h, align 8
  call void @dense(i32* %2)
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0))
  %call2 = call i32 @gettimeofday(%struct.timeval* %etstart, %struct.timezone* %tzdummy) #3
  %call3 = call i64 @times(%struct.tms* %cputstart) #3
  store i64 %call3, i64* %etstart2, align 8
  %3 = load i32*, i32** %h, align 8
  %4 = load i32*, i32** %h, align 8
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0
  %5 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs, i32 0, i32 0
  %6 = bitcast i8** %5 to i32**
  store i32* %3, i32** %6, align 8
  %7 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs, i32 0, i32 0
  %8 = bitcast i8** %7 to i32**
  store i32* %arrayidx, i32** %8, align 8
  %9 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_mappers, i64 0, i64 0
  store i8* null, i8** %9, align 8
  %10 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs, i32 0, i32 1
  %11 = bitcast i8** %10 to i32**
  store i32* %result, i32** %11, align 8
  %12 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs, i32 0, i32 1
  %13 = bitcast i8** %12 to i32**
  store i32* %result, i32** %13, align 8
  %14 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_mappers, i64 0, i64 1
  store i8* null, i8** %14, align 8
  %15 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs, i32 0, i32 0
  %16 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_begin_mapper(%struct.ident_t* @1, i64 -1, i32 2, i8** %15, i8** %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_sizes, i32 0, i32 0), i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes, i32 0, i32 0), i8** null, i8** null)
  %17 = load i32*, i32** %h, align 8
  %18 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs4, i32 0, i32 0
  %19 = bitcast i8** %18 to i32**
  store i32* %result, i32** %19, align 8
  %20 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs5, i32 0, i32 0
  %21 = bitcast i8** %20 to i32**
  store i32* %result, i32** %21, align 8
  %22 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_mappers6, i64 0, i64 0
  store i8* null, i8** %22, align 8
  %23 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs4, i32 0, i32 1
  %24 = bitcast i8** %23 to i32**
  store i32* %17, i32** %24, align 8
  %25 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs5, i32 0, i32 1
  %26 = bitcast i8** %25 to i32**
  store i32* %17, i32** %26, align 8
  %27 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_mappers6, i64 0, i64 1
  store i8* null, i8** %27, align 8
  %28 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs4, i32 0, i32 0
  %29 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs5, i32 0, i32 0
  call void @__kmpc_push_target_tripcount_mapper(%struct.ident_t* @1, i64 -1, i64 1000)
  %30 = call i32 @__tgt_target_teams_mapper(%struct.ident_t* @1, i64 -1, i8* @.__omp_offloading_34_b4bf2f7_main_l50.region_id, i32 2, i8** %28, i8** %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_sizes.4, i32 0, i32 0), i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes.5, i32 0, i32 0), i8** null, i8** null, i32 0, i32 0)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_34_b4bf2f7_main_l50(i32* %result, i32* %17) #3
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  %32 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs, i32 0, i32 0
  %33 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_end_mapper(%struct.ident_t* @1, i64 -1, i32 2, i8** %32, i8** %33, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_sizes, i32 0, i32 0), i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes, i32 0, i32 0), i8** null, i8** null)
  %call7 = call i32 @gettimeofday(%struct.timeval* %etstop, %struct.timezone* %tzdummy) #3
  %call8 = call i64 @times(%struct.tms* %cputstop) #3
  store i64 %call8, i64* %etstop2, align 8
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0))
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %etstart, i32 0, i32 0
  %34 = load i64, i64* %tv_sec, align 8
  %mul = mul i64 %34, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %etstart, i32 0, i32 1
  %35 = load i64, i64* %tv_usec, align 8
  %add = add i64 %mul, %35
  store i64 %add, i64* %usecstart, align 8
  %tv_sec10 = getelementptr inbounds %struct.timeval, %struct.timeval* %etstop, i32 0, i32 0
  %36 = load i64, i64* %tv_sec10, align 8
  %mul11 = mul i64 %36, 1000000
  %tv_usec12 = getelementptr inbounds %struct.timeval, %struct.timeval* %etstop, i32 0, i32 1
  %37 = load i64, i64* %tv_usec12, align 8
  %add13 = add i64 %mul11, %37
  store i64 %add13, i64* %usecstop, align 8
  %38 = load i32, i32* %result, align 4
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i32 %38)
  %39 = load i64, i64* %usecstop, align 8
  %40 = load i64, i64* %usecstart, align 8
  %sub = sub i64 %39, %40
  %conv15 = uitofp i64 %sub to float
  %div = fdiv float %conv15, 1.000000e+03
  %conv16 = fpext float %div to double
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i64 0, i64 0), double %conv16)
  call void @exit(i32 0) #9
  unreachable
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

; Function Attrs: nounwind
declare dso_local i64 @times(%struct.tms*) #1

; Function Attrs: nounwind
declare void @__tgt_target_data_begin_mapper(%struct.ident_t*, i64, i32, i8**, i8**, i64*, i64*, i8**, i8**) #3

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @__omp_offloading_34_b4bf2f7_main_l50(i32* nonnull align 4 dereferenceable(4) %result, i32* %h) #4 {
entry:
  %result.addr = alloca i32*, align 8
  %h.addr = alloca i32*, align 8
  store i32* %result, i32** %result.addr, align 8
  store i32* %h, i32** %h.addr, align 8
  %0 = load i32*, i32** %result.addr, align 8
  %1 = load i32*, i32** %h.addr, align 8
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_teams(%struct.ident_t* @1, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %0, i32* %1)
  ret void
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* nonnull align 4 dereferenceable(4) %result, i32* %h) #4 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %result.addr = alloca i32*, align 8
  %h.addr = alloca i32*, align 8
  %result1 = alloca i32, align 4
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.comb.lb = alloca i32, align 4
  %.omp.comb.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  store i32* %result, i32** %result.addr, align 8
  store i32* %h, i32** %h.addr, align 8
  %0 = load i32*, i32** %result.addr, align 8
  store i32 0, i32* %result1, align 4
  store i32 0, i32* %.omp.comb.lb, align 4
  store i32 999, i32* %.omp.comb.ub, align 4
  store i32 1, i32* %.omp.stride, align 4
  store i32 0, i32* %.omp.is_last, align 4
  %1 = load i32*, i32** %.global_tid..addr, align 8
  %2 = load i32, i32* %1, align 4
  call void @__kmpc_for_static_init_4u(%struct.ident_t* @2, i32 %2, i32 92, i32* %.omp.is_last, i32* %.omp.comb.lb, i32* %.omp.comb.ub, i32* %.omp.stride, i32 1, i32 1)
  %3 = load i32, i32* %.omp.comb.ub, align 4
  %cmp = icmp ugt i32 %3, 999
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32, i32* %.omp.comb.ub, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 999, %cond.true ], [ %4, %cond.false ]
  store i32 %cond, i32* %.omp.comb.ub, align 4
  %5 = load i32, i32* %.omp.comb.lb, align 4
  store i32 %5, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %6 = load i32, i32* %.omp.iv, align 4
  %7 = load i32, i32* %.omp.comb.ub, align 4
  %add = add i32 %7, 1
  %cmp2 = icmp ult i32 %6, %add
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %8 = load i32, i32* %.omp.comb.lb, align 4
  %9 = zext i32 %8 to i64
  %10 = load i32, i32* %.omp.comb.ub, align 4
  %11 = zext i32 %10 to i64
  %12 = load i32*, i32** %h.addr, align 8
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @1, i32 4, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i64, i64, i32*, i32*)* @.omp_outlined..1 to void (i32*, i32*, ...)*), i64 %9, i64 %11, i32* %result1, i32* %12)
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.inner.for.body
  %13 = load i32, i32* %.omp.iv, align 4
  %14 = load i32, i32* %.omp.stride, align 4
  %add3 = add i32 %13, %14
  store i32 %add3, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @2, i32 %2)
  %15 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0
  %16 = bitcast i32* %result1 to i8*
  store i8* %16, i8** %15, align 8
  %17 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*
  %18 = call i32 @__kmpc_reduce_nowait(%struct.ident_t* @4, i32 %2, i32 1, i64 8, i8* %17, void (i8*, i8*)* @.omp.reduction.reduction_func.3, [8 x i32]* @.gomp_critical_user_.reduction.var)
  switch i32 %18, label %.omp.reduction.default [
    i32 1, label %.omp.reduction.case1
    i32 2, label %.omp.reduction.case2
  ]

.omp.reduction.case1:                             ; preds = %omp.loop.exit
  %19 = load i32, i32* %0, align 4
  %20 = load i32, i32* %result1, align 4
  %cmp4 = icmp ugt i32 %19, %20
  br i1 %cmp4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %.omp.reduction.case1
  %21 = load i32, i32* %0, align 4
  br label %cond.end7

cond.false6:                                      ; preds = %.omp.reduction.case1
  %22 = load i32, i32* %result1, align 4
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false6, %cond.true5
  %cond8 = phi i32 [ %21, %cond.true5 ], [ %22, %cond.false6 ]
  store i32 %cond8, i32* %0, align 4
  call void @__kmpc_end_reduce_nowait(%struct.ident_t* @4, i32 %2, [8 x i32]* @.gomp_critical_user_.reduction.var)
  br label %.omp.reduction.default

.omp.reduction.case2:                             ; preds = %omp.loop.exit
  %23 = load i32, i32* %result1, align 4
  %24 = atomicrmw umax i32* %0, i32 %23 monotonic, align 4
  br label %.omp.reduction.default

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %cond.end7, %omp.loop.exit
  ret void
}

declare dso_local void @__kmpc_for_static_init_4u(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined..1(i32* noalias %.global_tid., i32* noalias %.bound_tid., i64 %.previous.lb., i64 %.previous.ub., i32* nonnull align 4 dereferenceable(4) %result, i32* %h) #4 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %.previous.lb..addr = alloca i64, align 8
  %.previous.ub..addr = alloca i64, align 8
  %result.addr = alloca i32*, align 8
  %h.addr = alloca i32*, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %result2 = alloca i32, align 4
  %i = alloca i32, align 4
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  store i64 %.previous.lb., i64* %.previous.lb..addr, align 8
  store i64 %.previous.ub., i64* %.previous.ub..addr, align 8
  store i32* %result, i32** %result.addr, align 8
  store i32* %h, i32** %h.addr, align 8
  %0 = load i32*, i32** %result.addr, align 8
  store i32 0, i32* %.omp.lb, align 4
  store i32 999, i32* %.omp.ub, align 4
  %1 = load i64, i64* %.previous.lb..addr, align 8
  %conv = trunc i64 %1 to i32
  %2 = load i64, i64* %.previous.ub..addr, align 8
  %conv1 = trunc i64 %2 to i32
  store i32 %conv, i32* %.omp.lb, align 4
  store i32 %conv1, i32* %.omp.ub, align 4
  store i32 1, i32* %.omp.stride, align 4
  store i32 0, i32* %.omp.is_last, align 4
  store i32 0, i32* %result2, align 4
  %3 = load i32*, i32** %.global_tid..addr, align 8
  %4 = load i32, i32* %3, align 4
  call void @__kmpc_for_static_init_4u(%struct.ident_t* @3, i32 %4, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1)
  %5 = load i32, i32* %.omp.ub, align 4
  %cmp = icmp ugt i32 %5, 999
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %6 = load i32, i32* %.omp.ub, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 999, %cond.true ], [ %6, %cond.false ]
  store i32 %cond, i32* %.omp.ub, align 4
  %7 = load i32, i32* %.omp.lb, align 4
  store i32 %7, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %8 = load i32, i32* %.omp.iv, align 4
  %9 = load i32, i32* %.omp.ub, align 4
  %add = add i32 %9, 1
  %cmp4 = icmp ult i32 %8, %add
  br i1 %cmp4, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %10 = load i32, i32* %.omp.iv, align 4
  %mul = mul i32 %10, 1
  %add6 = add i32 0, %mul
  store i32 %add6, i32* %i, align 4
  %11 = load i32*, i32** %h.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom = zext i32 %12 to i64
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 %idxprom
  %13 = load i32, i32* %arrayidx, align 4
  %14 = load i32, i32* %result2, align 4
  %add7 = add i32 %14, %13
  store i32 %add7, i32* %result2, align 4
  %15 = load i32, i32* %result2, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %15)
  br label %omp.body.continue

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %16 = load i32, i32* %.omp.iv, align 4
  %add8 = add i32 %16, 1
  store i32 %add8, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @2, i32 %4)
  %17 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0
  %18 = bitcast i32* %result2 to i8*
  store i8* %18, i8** %17, align 8
  %19 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*
  %20 = call i32 @__kmpc_reduce_nowait(%struct.ident_t* @4, i32 %4, i32 1, i64 8, i8* %19, void (i8*, i8*)* @.omp.reduction.reduction_func, [8 x i32]* @.gomp_critical_user_.reduction.var)
  switch i32 %20, label %.omp.reduction.default [
    i32 1, label %.omp.reduction.case1
    i32 2, label %.omp.reduction.case2
  ]

.omp.reduction.case1:                             ; preds = %omp.loop.exit
  %21 = load i32, i32* %0, align 4
  %22 = load i32, i32* %result2, align 4
  %cmp9 = icmp ugt i32 %21, %22
  br i1 %cmp9, label %cond.true11, label %cond.false12

cond.true11:                                      ; preds = %.omp.reduction.case1
  %23 = load i32, i32* %0, align 4
  br label %cond.end13

cond.false12:                                     ; preds = %.omp.reduction.case1
  %24 = load i32, i32* %result2, align 4
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true11
  %cond14 = phi i32 [ %23, %cond.true11 ], [ %24, %cond.false12 ]
  store i32 %cond14, i32* %0, align 4
  call void @__kmpc_end_reduce_nowait(%struct.ident_t* @4, i32 %4, [8 x i32]* @.gomp_critical_user_.reduction.var)
  br label %.omp.reduction.default

.omp.reduction.case2:                             ; preds = %omp.loop.exit
  %25 = load i32, i32* %result2, align 4
  %26 = atomicrmw umax i32* %0, i32 %25 monotonic, align 4
  br label %.omp.reduction.default

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %cond.end13, %omp.loop.exit
  ret void
}

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) #3

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @.omp.reduction.reduction_func(i8* %0, i8* %1) #5 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  store i8* %1, i8** %.addr1, align 8
  %2 = load i8*, i8** %.addr, align 8
  %3 = bitcast i8* %2 to [1 x i8*]*
  %4 = load i8*, i8** %.addr1, align 8
  %5 = bitcast i8* %4 to [1 x i8*]*
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %8, align 4
  %cmp = icmp ugt i32 %12, %13
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %14 = load i32, i32* %11, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %15 = load i32, i32* %8, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %14, %cond.true ], [ %15, %cond.false ]
  store i32 %cond, i32* %11, align 4
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce_nowait(%struct.ident_t*, i32, i32, i64, i8*, void (i8*, i8*)*, [8 x i32]*) #6

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce_nowait(%struct.ident_t*, i32, [8 x i32]*) #6

; Function Attrs: nounwind
declare !callback !7 void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) #3

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @.omp.reduction.reduction_func.3(i8* %0, i8* %1) #5 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  store i8* %1, i8** %.addr1, align 8
  %2 = load i8*, i8** %.addr, align 8
  %3 = bitcast i8* %2 to [1 x i8*]*
  %4 = load i8*, i8** %.addr1, align 8
  %5 = bitcast i8* %4 to [1 x i8*]*
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %8, align 4
  %cmp = icmp ugt i32 %12, %13
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %14 = load i32, i32* %11, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %15 = load i32, i32* %8, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %14, %cond.true ], [ %15, %cond.false ]
  store i32 %cond, i32* %11, align 4
  ret void
}

; Function Attrs: nounwind
declare !callback !7 void @__kmpc_fork_teams(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) #3

; Function Attrs: nounwind
declare void @__kmpc_push_target_tripcount_mapper(%struct.ident_t*, i64, i64) #3

; Function Attrs: nounwind
declare i32 @__tgt_target_teams_mapper(%struct.ident_t*, i64, i8*, i32, i8**, i8**, i64*, i64*, i8**, i8**, i32, i32) #3

; Function Attrs: nounwind
declare void @__tgt_target_data_end_mapper(%struct.ident_t*, i64, i32, i8**, i8**, i64*, i64*, i8**, i8**) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

; Function Attrs: noinline nounwind uwtable
define internal void @.omp_offloading.requires_reg() #8 section ".text.startup" {
entry:
  call void @__tgt_register_requires(i64 1)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_register_requires(i64) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }
attributes #4 = { noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline norecurse nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { convergent nounwind }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { noreturn nounwind }

!omp_offload.info = !{!0}
!llvm.module.flags = !{!1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 0, i32 52, i32 189526775, !"main", i32 50, i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d8c5a4d6b6efad405c71ead8997276d8d3a7c5ad)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8}
!8 = !{i64 2, i64 -1, i64 -1, i1 true}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
