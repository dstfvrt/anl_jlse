
; __CLANG_OFFLOAD_BUNDLE____START__ openmp-nvptx64
; ModuleID = 'openmp_gpu_dummy.c'
source_filename = "openmp_gpu_dummy.c"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64"

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d8c5a4d6b6efad405c71ead8997276d8d3a7c5ad)"}

; __CLANG_OFFLOAD_BUNDLE____END__ openmp-nvptx64

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = '/tmp/openmp_gpu_dummy-28a637.bc'
source_filename = "openmp_gpu_dummy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.tms = type { i64, i64, i64, i64 }

@.str = private unnamed_addr constant [18 x i8] c"\0AStarting clock.\0A\00", align 1
@.offload_sizes = private unnamed_addr constant [2 x i64] [i64 4000, i64 4]
@.offload_maptypes = private unnamed_addr constant [2 x i64] [i64 1, i64 3]
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Stopped clock.\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"Checksum: %u\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"\0AElapsed time = %g ms.\0A\00", align 1

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
  br label %for.cond, !llvm.loop !4

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
  %17 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_baseptrs, i32 0, i32 0
  %18 = getelementptr inbounds [2 x i8*], [2 x i8*]* %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_end_mapper(%struct.ident_t* @1, i64 -1, i32 2, i8** %17, i8** %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_sizes, i32 0, i32 0), i64* getelementptr inbounds ([2 x i64], [2 x i64]* @.offload_maptypes, i32 0, i32 0), i8** null, i8** null)
  %call4 = call i32 @gettimeofday(%struct.timeval* %etstop, %struct.timezone* %tzdummy) #3
  %call5 = call i64 @times(%struct.tms* %cputstop) #3
  store i64 %call5, i64* %etstop2, align 8
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0))
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %etstart, i32 0, i32 0
  %19 = load i64, i64* %tv_sec, align 8
  %mul = mul i64 %19, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %etstart, i32 0, i32 1
  %20 = load i64, i64* %tv_usec, align 8
  %add = add i64 %mul, %20
  store i64 %add, i64* %usecstart, align 8
  %tv_sec7 = getelementptr inbounds %struct.timeval, %struct.timeval* %etstop, i32 0, i32 0
  %21 = load i64, i64* %tv_sec7, align 8
  %mul8 = mul i64 %21, 1000000
  %tv_usec9 = getelementptr inbounds %struct.timeval, %struct.timeval* %etstop, i32 0, i32 1
  %22 = load i64, i64* %tv_usec9, align 8
  %add10 = add i64 %mul8, %22
  store i64 %add10, i64* %usecstop, align 8
  %23 = load i32, i32* %result, align 4
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i32 %23)
  %24 = load i64, i64* %usecstop, align 8
  %25 = load i64, i64* %usecstart, align 8
  %sub = sub i64 %24, %25
  %conv12 = uitofp i64 %sub to float
  %div = fdiv float %conv12, 1.000000e+03
  %conv13 = fpext float %div to double
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i64 0, i64 0), double %conv13)
  call void @exit(i32 0) #5
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

; Function Attrs: nounwind
declare void @__tgt_target_data_end_mapper(%struct.ident_t*, i64, i32, i8**, i8**, i64*, i64*, i8**, i8**) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d8c5a4d6b6efad405c71ead8997276d8d3a7c5ad)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
