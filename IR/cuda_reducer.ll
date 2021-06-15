; ModuleID = 'cuda_reducer.cu'
source_filename = "cuda_reducer.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.tms = type { i64, i64, i64, i64 }

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [18 x i8] c"\0AStarting clock.\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Stopped clock.\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"\0AElapsed time = %g ms.\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Checksum: %u\0A\00", align 1

; Function Attrs: noinline norecurse optnone uwtable
define dso_local void @_Z25__device_stub__reduce_GPUPj(i32* %d) #0 {
entry:
  %d.addr = alloca i32*, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca i8*, align 8
  %grid_dim.coerce = alloca { i64, i32 }, align 8
  %block_dim.coerce = alloca { i64, i32 }, align 8
  store i32* %d, i32** %d.addr, align 8
  %kernel_args = alloca i8*, i64 1, align 16
  %0 = bitcast i32** %d.addr to i8*
  %1 = getelementptr i8*, i8** %kernel_args, i32 0
  store i8* %0, i8** %1, align 8
  %2 = call i32 @__cudaPopCallConfiguration(%struct.dim3* %grid_dim, %struct.dim3* %block_dim, i64* %shmem_size, i8** %stream)
  %3 = load i64, i64* %shmem_size, align 8
  %4 = load i8*, i8** %stream, align 8
  %5 = bitcast { i64, i32 }* %grid_dim.coerce to i8*
  %6 = bitcast %struct.dim3* %grid_dim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 8 %6, i64 12, i1 false)
  %7 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %grid_dim.coerce, i32 0, i32 0
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %grid_dim.coerce, i32 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = bitcast { i64, i32 }* %block_dim.coerce to i8*
  %12 = bitcast %struct.dim3* %block_dim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %11, i8* align 8 %12, i64 12, i1 false)
  %13 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %block_dim.coerce, i32 0, i32 0
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %block_dim.coerce, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = bitcast i8* %4 to %struct.CUstream_st*
  %call = call i32 @cudaLaunchKernel(i8* bitcast (void (i32*)* @_Z25__device_stub__reduce_GPUPj to i8*), i64 %8, i32 %10, i64 %14, i32 %16, i8** %kernel_args, i64 %3, %struct.CUstream_st* %17)
  br label %setup.end

setup.end:                                        ; preds = %entry
  ret void
}

declare dso_local i32 @__cudaPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**)

declare dso_local i32 @cudaLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.CUstream_st*)

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable mustprogress
define dso_local void @_Z5densePj(i32* %h) #2 {
entry:
  %h.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %h, i32** %h.addr, align 8
  call void @srand(i32 0) #9
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %0, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand() #9
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
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

; Function Attrs: noinline norecurse optnone uwtable mustprogress
define dso_local i32 @main(i32 %argc, i8** %argv) #4 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %h = alloca i32*, align 8
  %d = alloca i32*, align 8
  %result = alloca i32*, align 8
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
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp10 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp10.coerce = alloca { i64, i32 }, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 4000, i32* %nBytes, align 4
  %0 = load i32, i32* %nBytes, align 4
  %conv = zext i32 %0 to i64
  %call = call noalias align 16 i8* @malloc(i64 %conv) #9
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %h, align 8
  %2 = load i32, i32* %nBytes, align 4
  %conv1 = zext i32 %2 to i64
  %call2 = call noalias align 16 i8* @malloc(i64 %conv1) #9
  %3 = bitcast i8* %call2 to i32*
  store i32* %3, i32** %result, align 8
  %4 = load i32*, i32** %h, align 8
  call void @_Z5densePj(i32* %4)
  %5 = load i32, i32* %nBytes, align 4
  %conv3 = zext i32 %5 to i64
  %call4 = call i32 @_ZL10cudaMallocIjE9cudaErrorPPT_m(i32** %d, i64 %conv3)
  %6 = load i32*, i32** %d, align 8
  %7 = bitcast i32* %6 to i8*
  %8 = load i32*, i32** %h, align 8
  %9 = bitcast i32* %8 to i8*
  %10 = load i32, i32* %nBytes, align 4
  %conv5 = zext i32 %10 to i64
  %call6 = call i32 @cudaMemcpy(i8* %7, i8* %9, i64 %conv5, i32 1)
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0))
  %call8 = call i32 @gettimeofday(%struct.timeval* %etstart, %struct.timezone* %tzdummy) #9
  %call9 = call i64 @times(%struct.tms* %cputstart) #9
  store i64 %call9, i64* %etstart2, align 8
  call void @_ZN4dim3C2Ejjj(%struct.dim3* nonnull align 4 dereferenceable(12) %agg.tmp, i32 1, i32 1, i32 1)
  call void @_ZN4dim3C2Ejjj(%struct.dim3* nonnull align 4 dereferenceable(12) %agg.tmp10, i32 1024, i32 1, i32 1)
  %11 = load i32, i32* %nBytes, align 4
  %conv11 = zext i32 %11 to i64
  %12 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*
  %13 = bitcast %struct.dim3* %agg.tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 4 %13, i64 12, i1 false)
  %14 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0
  %15 = load i64, i64* %14, align 4
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = bitcast { i64, i32 }* %agg.tmp10.coerce to i8*
  %19 = bitcast %struct.dim3* %agg.tmp10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %18, i8* align 4 %19, i64 12, i1 false)
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp10.coerce, i32 0, i32 0
  %21 = load i64, i64* %20, align 4
  %22 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp10.coerce, i32 0, i32 1
  %23 = load i32, i32* %22, align 4
  %call12 = call i32 @__cudaPushCallConfiguration(i64 %15, i32 %17, i64 %21, i32 %23, i64 %conv11, i8* null)
  %tobool = icmp ne i32 %call12, 0
  br i1 %tobool, label %kcall.end, label %kcall.configok

kcall.configok:                                   ; preds = %entry
  %24 = load i32*, i32** %d, align 8
  call void @_Z25__device_stub__reduce_GPUPj(i32* %24)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %entry
  %call13 = call i32 @gettimeofday(%struct.timeval* %etstop, %struct.timezone* %tzdummy) #9
  %call14 = call i64 @times(%struct.tms* %cputstop) #9
  store i64 %call14, i64* %etstop2, align 8
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0))
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %etstart, i32 0, i32 0
  %25 = load i64, i64* %tv_sec, align 8
  %mul = mul i64 %25, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %etstart, i32 0, i32 1
  %26 = load i64, i64* %tv_usec, align 8
  %add = add i64 %mul, %26
  store i64 %add, i64* %usecstart, align 8
  %tv_sec16 = getelementptr inbounds %struct.timeval, %struct.timeval* %etstop, i32 0, i32 0
  %27 = load i64, i64* %tv_sec16, align 8
  %mul17 = mul i64 %27, 1000000
  %tv_usec18 = getelementptr inbounds %struct.timeval, %struct.timeval* %etstop, i32 0, i32 1
  %28 = load i64, i64* %tv_usec18, align 8
  %add19 = add i64 %mul17, %28
  store i64 %add19, i64* %usecstop, align 8
  %29 = load i64, i64* %usecstop, align 8
  %30 = load i64, i64* %usecstart, align 8
  %sub = sub i64 %29, %30
  %conv20 = uitofp i64 %sub to float
  %div = fdiv contract float %conv20, 1.000000e+03
  %conv21 = fpext float %div to double
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), double %conv21)
  %31 = load i32*, i32** %result, align 8
  %32 = bitcast i32* %31 to i8*
  %33 = load i32*, i32** %d, align 8
  %34 = bitcast i32* %33 to i8*
  %35 = load i32, i32* %nBytes, align 4
  %conv23 = zext i32 %35 to i64
  %call24 = call i32 @cudaMemcpy(i8* %32, i8* %34, i64 %conv23, i32 2)
  %36 = load i32*, i32** %result, align 8
  %arrayidx = getelementptr inbounds i32, i32* %36, i64 0
  %37 = load i32, i32* %arrayidx, align 4
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 %37)
  call void @exit(i32 0) #10
  unreachable
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noinline optnone uwtable mustprogress
define internal i32 @_ZL10cudaMallocIjE9cudaErrorPPT_m(i32** %devPtr, i64 %size) #5 {
entry:
  %devPtr.addr = alloca i32**, align 8
  %size.addr = alloca i64, align 8
  store i32** %devPtr, i32*** %devPtr.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  %0 = load i32**, i32*** %devPtr.addr, align 8
  %1 = bitcast i32** %0 to i8*
  %2 = bitcast i8* %1 to i8**
  %3 = load i64, i64* %size.addr, align 8
  %call = call i32 @cudaMalloc(i8** %2, i64 %3)
  ret i32 %call
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #6

declare dso_local i32 @printf(i8*, ...) #6

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #3

; Function Attrs: nounwind
declare dso_local i64 @times(%struct.tms*) #3

declare dso_local i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64, i8*) #6

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* nonnull align 4 dereferenceable(12) %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #7 comdat align 2 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  store i32 %vx, i32* %vx.addr, align 4
  store i32 %vy, i32* %vy.addr, align 4
  store i32 %vz, i32* %vz.addr, align 4
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0
  %0 = load i32, i32* %vx.addr, align 4
  store i32 %0, i32* %x, align 4
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1
  %1 = load i32, i32* %vy.addr, align 4
  store i32 %1, i32* %y, align 4
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2
  %2 = load i32, i32* %vz.addr, align 4
  store i32 %2, i32* %z, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #8

declare dso_local i32 @cudaMalloc(i8**, i64) #6

attributes #0 = { noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { noinline nounwind optnone uwtable mustprogress "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline norecurse optnone uwtable mustprogress "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline optnone uwtable mustprogress "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 0]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d8c5a4d6b6efad405c71ead8997276d8d3a7c5ad)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
