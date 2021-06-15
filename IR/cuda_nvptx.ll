; ModuleID = 'cuda_reducer.cu'
source_filename = "cuda_reducer.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.cudaFuncAttributes = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32 }

@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@sdata = external dso_local addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent noinline nounwind optnone mustprogress
define weak dso_local i32 @cudaMalloc(i8** %p, i64 %s) #0 {
entry:
  %p.addr = alloca i8**, align 8
  %s.addr = alloca i64, align 8
  store i8** %p, i8*** %p.addr, align 8
  store i64 %s, i64* %s.addr, align 8
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone mustprogress
define weak dso_local i32 @cudaFuncGetAttributes(%struct.cudaFuncAttributes* %p, i8* %c) #0 {
entry:
  %p.addr = alloca %struct.cudaFuncAttributes*, align 8
  %c.addr = alloca i8*, align 8
  store %struct.cudaFuncAttributes* %p, %struct.cudaFuncAttributes** %p.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone mustprogress
define weak dso_local i32 @cudaDeviceGetAttribute(i32* %value, i32 %attr, i32 %device) #0 {
entry:
  %value.addr = alloca i32*, align 8
  %attr.addr = alloca i32, align 4
  %device.addr = alloca i32, align 4
  store i32* %value, i32** %value.addr, align 8
  store i32 %attr, i32* %attr.addr, align 4
  store i32 %device, i32* %device.addr, align 4
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone mustprogress
define weak dso_local i32 @cudaGetDevice(i32* %device) #0 {
entry:
  %device.addr = alloca i32*, align 8
  store i32* %device, i32** %device.addr, align 8
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone mustprogress
define weak dso_local i32 @cudaOccupancyMaxActiveBlocksPerMultiprocessor(i32* %numBlocks, i8* %func, i32 %blockSize, i64 %dynamicSmemSize) #0 {
entry:
  %numBlocks.addr = alloca i32*, align 8
  %func.addr = alloca i8*, align 8
  %blockSize.addr = alloca i32, align 4
  %dynamicSmemSize.addr = alloca i64, align 8
  store i32* %numBlocks, i32** %numBlocks.addr, align 8
  store i8* %func, i8** %func.addr, align 8
  store i32 %blockSize, i32* %blockSize.addr, align 4
  store i64 %dynamicSmemSize, i64* %dynamicSmemSize.addr, align 8
  ret i32 999
}

; Function Attrs: convergent noinline nounwind optnone mustprogress
define weak dso_local i32 @cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags(i32* %numBlocks, i8* %func, i32 %blockSize, i64 %dynamicSmemSize, i32 %flags) #0 {
entry:
  %numBlocks.addr = alloca i32*, align 8
  %func.addr = alloca i8*, align 8
  %blockSize.addr = alloca i32, align 4
  %dynamicSmemSize.addr = alloca i64, align 8
  %flags.addr = alloca i32, align 4
  store i32* %numBlocks, i32** %numBlocks.addr, align 8
  store i8* %func, i8** %func.addr, align 8
  store i32 %blockSize, i32* %blockSize.addr, align 4
  store i64 %dynamicSmemSize, i64* %dynamicSmemSize.addr, align 8
  store i32 %flags, i32* %flags.addr, align 4
  ret i32 999
}

; Function Attrs: convergent noinline norecurse nounwind optnone mustprogress
define dso_local void @_Z10reduce_GPUPj(i32* %d) #1 {
entry:
  %d.addr = alloca i32*, align 8
  %tid = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  store i32* %d, i32** %d.addr, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #4
  store i32 %0, i32* %tid, align 4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #4
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4
  %mul = mul i32 %1, %2
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #4
  %add = add i32 %mul, %3
  store i32 %add, i32* %i, align 4
  %4 = load i32*, i32** %d.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = zext i32 %5 to i64
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom
  %6 = load i32, i32* %arrayidx, align 4
  %7 = load i32, i32* %tid, align 4
  %idxprom4 = zext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds [0 x i32], [0 x i32]* addrspacecast ([0 x i32] addrspace(3)* @sdata to [0 x i32]*), i64 0, i64 %idxprom4
  store i32 %6, i32* %arrayidx5, align 4
  call void @llvm.nvvm.barrier0()
  store i32 1, i32* %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %s, align 4
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4
  %cmp = icmp ult i32 %8, %9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %tid, align 4
  %11 = load i32, i32* %s, align 4
  %mul7 = mul i32 2, %11
  %rem = urem i32 %10, %mul7
  %cmp8 = icmp eq i32 %rem, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %12 = load i32, i32* %tid, align 4
  %13 = load i32, i32* %s, align 4
  %add9 = add i32 %12, %13
  %idxprom10 = zext i32 %add9 to i64
  %arrayidx11 = getelementptr inbounds [0 x i32], [0 x i32]* addrspacecast ([0 x i32] addrspace(3)* @sdata to [0 x i32]*), i64 0, i64 %idxprom10
  %14 = load i32, i32* %arrayidx11, align 4
  %15 = load i32, i32* %tid, align 4
  %idxprom12 = zext i32 %15 to i64
  %arrayidx13 = getelementptr inbounds [0 x i32], [0 x i32]* addrspacecast ([0 x i32] addrspace(3)* @sdata to [0 x i32]*), i64 0, i64 %idxprom12
  %16 = load i32, i32* %arrayidx13, align 4
  %add14 = add i32 %16, %14
  store i32 %add14, i32* %arrayidx13, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  call void @llvm.nvvm.barrier0()
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %17 = load i32, i32* %s, align 4
  %mul15 = mul i32 %17, 2
  store i32 %mul15, i32* %s, align 4
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %tid, align 4
  %cmp16 = icmp eq i32 %18, 0
  br i1 %cmp16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %for.end
  %19 = load i32, i32* getelementptr inbounds ([0 x i32], [0 x i32]* addrspacecast ([0 x i32] addrspace(3)* @sdata to [0 x i32]*), i64 0, i64 0), align 4
  %20 = load i32*, i32** %d.addr, align 8
  %arrayidx18 = getelementptr inbounds i32, i32* %20, i64 0
  store i32 %19, i32* %arrayidx18, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %for.end
  ret void
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3

attributes #0 = { convergent noinline nounwind optnone mustprogress "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "target-features"="+ptx70,+sm_80" }
attributes #1 = { convergent noinline norecurse nounwind optnone mustprogress "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "target-features"="+ptx70,+sm_80" }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5, !6, !5, !7, !7, !7, !7, !8, !8, !7}
!llvm.ident = !{!9}
!nvvmir.version = !{!10}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 0]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{void (i32*)* @_Z10reduce_GPUPj, !"kernel", i32 1}
!5 = !{null, !"align", i32 8}
!6 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!7 = !{null, !"align", i32 16}
!8 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!9 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d8c5a4d6b6efad405c71ead8997276d8d3a7c5ad)"}
!10 = !{i32 1, i32 4}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
