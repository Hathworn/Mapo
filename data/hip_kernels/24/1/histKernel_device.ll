; ModuleID = '../data/hip_kernels/24/1/main.cu'
source_filename = "../data/hip_kernels/24/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10histKernelPclPjE4temp = internal unnamed_addr addrspace(3) global [64 x [64 x i32]] undef, align 16
@_ZZ10histKernelPclPjE8blockSum = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10histKernelPclPj(i8 addrspace(1)* nocapture readonly %0, i64 %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %5, align 4, !tbaa !5
  %6 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 1, i32 %4
  store i32 0, i32 addrspace(3)* %6, align 4, !tbaa !5
  %7 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 2, i32 %4
  store i32 0, i32 addrspace(3)* %7, align 4, !tbaa !5
  %8 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 3, i32 %4
  store i32 0, i32 addrspace(3)* %8, align 4, !tbaa !5
  %9 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 4, i32 %4
  store i32 0, i32 addrspace(3)* %9, align 4, !tbaa !5
  %10 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 5, i32 %4
  store i32 0, i32 addrspace(3)* %10, align 4, !tbaa !5
  %11 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 6, i32 %4
  store i32 0, i32 addrspace(3)* %11, align 4, !tbaa !5
  %12 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 7, i32 %4
  store i32 0, i32 addrspace(3)* %12, align 4, !tbaa !5
  %13 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 8, i32 %4
  store i32 0, i32 addrspace(3)* %13, align 4, !tbaa !5
  %14 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 9, i32 %4
  store i32 0, i32 addrspace(3)* %14, align 4, !tbaa !5
  %15 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 10, i32 %4
  store i32 0, i32 addrspace(3)* %15, align 4, !tbaa !5
  %16 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 11, i32 %4
  store i32 0, i32 addrspace(3)* %16, align 4, !tbaa !5
  %17 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 12, i32 %4
  store i32 0, i32 addrspace(3)* %17, align 4, !tbaa !5
  %18 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 13, i32 %4
  store i32 0, i32 addrspace(3)* %18, align 4, !tbaa !5
  %19 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 14, i32 %4
  store i32 0, i32 addrspace(3)* %19, align 4, !tbaa !5
  %20 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 15, i32 %4
  store i32 0, i32 addrspace(3)* %20, align 4, !tbaa !5
  %21 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 16, i32 %4
  store i32 0, i32 addrspace(3)* %21, align 4, !tbaa !5
  %22 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 17, i32 %4
  store i32 0, i32 addrspace(3)* %22, align 4, !tbaa !5
  %23 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 18, i32 %4
  store i32 0, i32 addrspace(3)* %23, align 4, !tbaa !5
  %24 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 19, i32 %4
  store i32 0, i32 addrspace(3)* %24, align 4, !tbaa !5
  %25 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 20, i32 %4
  store i32 0, i32 addrspace(3)* %25, align 4, !tbaa !5
  %26 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 21, i32 %4
  store i32 0, i32 addrspace(3)* %26, align 4, !tbaa !5
  %27 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 22, i32 %4
  store i32 0, i32 addrspace(3)* %27, align 4, !tbaa !5
  %28 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 23, i32 %4
  store i32 0, i32 addrspace(3)* %28, align 4, !tbaa !5
  %29 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 24, i32 %4
  store i32 0, i32 addrspace(3)* %29, align 4, !tbaa !5
  %30 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 25, i32 %4
  store i32 0, i32 addrspace(3)* %30, align 4, !tbaa !5
  %31 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 26, i32 %4
  store i32 0, i32 addrspace(3)* %31, align 4, !tbaa !5
  %32 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 27, i32 %4
  store i32 0, i32 addrspace(3)* %32, align 4, !tbaa !5
  %33 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 28, i32 %4
  store i32 0, i32 addrspace(3)* %33, align 4, !tbaa !5
  %34 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 29, i32 %4
  store i32 0, i32 addrspace(3)* %34, align 4, !tbaa !5
  %35 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 30, i32 %4
  store i32 0, i32 addrspace(3)* %35, align 4, !tbaa !5
  %36 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 31, i32 %4
  store i32 0, i32 addrspace(3)* %36, align 4, !tbaa !5
  %37 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 32, i32 %4
  store i32 0, i32 addrspace(3)* %37, align 4, !tbaa !5
  %38 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 33, i32 %4
  store i32 0, i32 addrspace(3)* %38, align 4, !tbaa !5
  %39 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 34, i32 %4
  store i32 0, i32 addrspace(3)* %39, align 4, !tbaa !5
  %40 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 35, i32 %4
  store i32 0, i32 addrspace(3)* %40, align 4, !tbaa !5
  %41 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 36, i32 %4
  store i32 0, i32 addrspace(3)* %41, align 4, !tbaa !5
  %42 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 37, i32 %4
  store i32 0, i32 addrspace(3)* %42, align 4, !tbaa !5
  %43 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 38, i32 %4
  store i32 0, i32 addrspace(3)* %43, align 4, !tbaa !5
  %44 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 39, i32 %4
  store i32 0, i32 addrspace(3)* %44, align 4, !tbaa !5
  %45 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 40, i32 %4
  store i32 0, i32 addrspace(3)* %45, align 4, !tbaa !5
  %46 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 41, i32 %4
  store i32 0, i32 addrspace(3)* %46, align 4, !tbaa !5
  %47 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 42, i32 %4
  store i32 0, i32 addrspace(3)* %47, align 4, !tbaa !5
  %48 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 43, i32 %4
  store i32 0, i32 addrspace(3)* %48, align 4, !tbaa !5
  %49 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 44, i32 %4
  store i32 0, i32 addrspace(3)* %49, align 4, !tbaa !5
  %50 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 45, i32 %4
  store i32 0, i32 addrspace(3)* %50, align 4, !tbaa !5
  %51 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 46, i32 %4
  store i32 0, i32 addrspace(3)* %51, align 4, !tbaa !5
  %52 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 47, i32 %4
  store i32 0, i32 addrspace(3)* %52, align 4, !tbaa !5
  %53 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 48, i32 %4
  store i32 0, i32 addrspace(3)* %53, align 4, !tbaa !5
  %54 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 49, i32 %4
  store i32 0, i32 addrspace(3)* %54, align 4, !tbaa !5
  %55 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 50, i32 %4
  store i32 0, i32 addrspace(3)* %55, align 4, !tbaa !5
  %56 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 51, i32 %4
  store i32 0, i32 addrspace(3)* %56, align 4, !tbaa !5
  %57 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 52, i32 %4
  store i32 0, i32 addrspace(3)* %57, align 4, !tbaa !5
  %58 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 53, i32 %4
  store i32 0, i32 addrspace(3)* %58, align 4, !tbaa !5
  %59 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 54, i32 %4
  store i32 0, i32 addrspace(3)* %59, align 4, !tbaa !5
  %60 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 55, i32 %4
  store i32 0, i32 addrspace(3)* %60, align 4, !tbaa !5
  %61 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 56, i32 %4
  store i32 0, i32 addrspace(3)* %61, align 4, !tbaa !5
  %62 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 57, i32 %4
  store i32 0, i32 addrspace(3)* %62, align 4, !tbaa !5
  %63 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 58, i32 %4
  store i32 0, i32 addrspace(3)* %63, align 4, !tbaa !5
  %64 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 59, i32 %4
  store i32 0, i32 addrspace(3)* %64, align 4, !tbaa !5
  %65 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 60, i32 %4
  store i32 0, i32 addrspace(3)* %65, align 4, !tbaa !5
  %66 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 61, i32 %4
  store i32 0, i32 addrspace(3)* %66, align 4, !tbaa !5
  %67 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 62, i32 %4
  store i32 0, i32 addrspace(3)* %67, align 4, !tbaa !5
  %68 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 63, i32 %4
  store i32 0, i32 addrspace(3)* %68, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %70 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %71 = getelementptr i8, i8 addrspace(4)* %70, i64 4
  %72 = bitcast i8 addrspace(4)* %71 to i16 addrspace(4)*
  %73 = load i16, i16 addrspace(4)* %72, align 4, !range !9, !invariant.load !10
  %74 = zext i16 %73 to i32
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %70, i64 12
  %76 = bitcast i8 addrspace(4)* %75 to i32 addrspace(4)*
  %77 = load i32, i32 addrspace(4)* %76, align 4, !tbaa !11
  %78 = mul i32 %69, %74
  %79 = add i32 %78, %4
  %80 = udiv i32 %77, %74
  %81 = mul i32 %80, %74
  %82 = icmp ugt i32 %77, %81
  %83 = zext i1 %82 to i32
  %84 = add i32 %80, %83
  %85 = mul i32 %84, %74
  %86 = sext i32 %79 to i64
  %87 = icmp slt i64 %86, %1
  br i1 %87, label %88, label %100

88:                                               ; preds = %3, %88
  %89 = phi i64 [ %98, %88 ], [ %86, %3 ]
  %90 = phi i32 [ %97, %88 ], [ %79, %3 ]
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %89
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !20, !amdgpu.noclobber !10
  %93 = sext i8 %92 to i32
  %94 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %93, i32 %4
  %95 = load i32, i32 addrspace(3)* %94, align 4, !tbaa !5
  %96 = add i32 %95, 1
  store i32 %96, i32 addrspace(3)* %94, align 4, !tbaa !5
  %97 = add nsw i32 %90, %85
  %98 = sext i32 %97 to i64
  %99 = icmp slt i64 %98, %1
  br i1 %99, label %88, label %100, !llvm.loop !21

100:                                              ; preds = %88, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %101 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10histKernelPclPjE8blockSum, i32 0, i32 %4
  %102 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !5
  %103 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 0
  %104 = load i32, i32 addrspace(3)* %103, align 16, !tbaa !5
  %105 = add i32 %102, %104
  %106 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 1
  %107 = load i32, i32 addrspace(3)* %106, align 4, !tbaa !5
  %108 = add i32 %105, %107
  %109 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 2
  %110 = load i32, i32 addrspace(3)* %109, align 8, !tbaa !5
  %111 = add i32 %108, %110
  %112 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 3
  %113 = load i32, i32 addrspace(3)* %112, align 4, !tbaa !5
  %114 = add i32 %111, %113
  %115 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 4
  %116 = load i32, i32 addrspace(3)* %115, align 16, !tbaa !5
  %117 = add i32 %114, %116
  %118 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 5
  %119 = load i32, i32 addrspace(3)* %118, align 4, !tbaa !5
  %120 = add i32 %117, %119
  %121 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 6
  %122 = load i32, i32 addrspace(3)* %121, align 8, !tbaa !5
  %123 = add i32 %120, %122
  %124 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 7
  %125 = load i32, i32 addrspace(3)* %124, align 4, !tbaa !5
  %126 = add i32 %123, %125
  %127 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 8
  %128 = load i32, i32 addrspace(3)* %127, align 16, !tbaa !5
  %129 = add i32 %126, %128
  %130 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 9
  %131 = load i32, i32 addrspace(3)* %130, align 4, !tbaa !5
  %132 = add i32 %129, %131
  %133 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 10
  %134 = load i32, i32 addrspace(3)* %133, align 8, !tbaa !5
  %135 = add i32 %132, %134
  %136 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 11
  %137 = load i32, i32 addrspace(3)* %136, align 4, !tbaa !5
  %138 = add i32 %135, %137
  %139 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 12
  %140 = load i32, i32 addrspace(3)* %139, align 16, !tbaa !5
  %141 = add i32 %138, %140
  %142 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 13
  %143 = load i32, i32 addrspace(3)* %142, align 4, !tbaa !5
  %144 = add i32 %141, %143
  %145 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 14
  %146 = load i32, i32 addrspace(3)* %145, align 8, !tbaa !5
  %147 = add i32 %144, %146
  %148 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 15
  %149 = load i32, i32 addrspace(3)* %148, align 4, !tbaa !5
  %150 = add i32 %147, %149
  %151 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 16
  %152 = load i32, i32 addrspace(3)* %151, align 16, !tbaa !5
  %153 = add i32 %150, %152
  %154 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 17
  %155 = load i32, i32 addrspace(3)* %154, align 4, !tbaa !5
  %156 = add i32 %153, %155
  %157 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 18
  %158 = load i32, i32 addrspace(3)* %157, align 8, !tbaa !5
  %159 = add i32 %156, %158
  %160 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 19
  %161 = load i32, i32 addrspace(3)* %160, align 4, !tbaa !5
  %162 = add i32 %159, %161
  %163 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 20
  %164 = load i32, i32 addrspace(3)* %163, align 16, !tbaa !5
  %165 = add i32 %162, %164
  %166 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 21
  %167 = load i32, i32 addrspace(3)* %166, align 4, !tbaa !5
  %168 = add i32 %165, %167
  %169 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 22
  %170 = load i32, i32 addrspace(3)* %169, align 8, !tbaa !5
  %171 = add i32 %168, %170
  %172 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 23
  %173 = load i32, i32 addrspace(3)* %172, align 4, !tbaa !5
  %174 = add i32 %171, %173
  %175 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 24
  %176 = load i32, i32 addrspace(3)* %175, align 16, !tbaa !5
  %177 = add i32 %174, %176
  %178 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 25
  %179 = load i32, i32 addrspace(3)* %178, align 4, !tbaa !5
  %180 = add i32 %177, %179
  %181 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 26
  %182 = load i32, i32 addrspace(3)* %181, align 8, !tbaa !5
  %183 = add i32 %180, %182
  %184 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 27
  %185 = load i32, i32 addrspace(3)* %184, align 4, !tbaa !5
  %186 = add i32 %183, %185
  %187 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 28
  %188 = load i32, i32 addrspace(3)* %187, align 16, !tbaa !5
  %189 = add i32 %186, %188
  %190 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 29
  %191 = load i32, i32 addrspace(3)* %190, align 4, !tbaa !5
  %192 = add i32 %189, %191
  %193 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 30
  %194 = load i32, i32 addrspace(3)* %193, align 8, !tbaa !5
  %195 = add i32 %192, %194
  %196 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 31
  %197 = load i32, i32 addrspace(3)* %196, align 4, !tbaa !5
  %198 = add i32 %195, %197
  %199 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 32
  %200 = load i32, i32 addrspace(3)* %199, align 16, !tbaa !5
  %201 = add i32 %198, %200
  %202 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 33
  %203 = load i32, i32 addrspace(3)* %202, align 4, !tbaa !5
  %204 = add i32 %201, %203
  %205 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 34
  %206 = load i32, i32 addrspace(3)* %205, align 8, !tbaa !5
  %207 = add i32 %204, %206
  %208 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 35
  %209 = load i32, i32 addrspace(3)* %208, align 4, !tbaa !5
  %210 = add i32 %207, %209
  %211 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 36
  %212 = load i32, i32 addrspace(3)* %211, align 16, !tbaa !5
  %213 = add i32 %210, %212
  %214 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 37
  %215 = load i32, i32 addrspace(3)* %214, align 4, !tbaa !5
  %216 = add i32 %213, %215
  %217 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 38
  %218 = load i32, i32 addrspace(3)* %217, align 8, !tbaa !5
  %219 = add i32 %216, %218
  %220 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 39
  %221 = load i32, i32 addrspace(3)* %220, align 4, !tbaa !5
  %222 = add i32 %219, %221
  %223 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 40
  %224 = load i32, i32 addrspace(3)* %223, align 16, !tbaa !5
  %225 = add i32 %222, %224
  %226 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 41
  %227 = load i32, i32 addrspace(3)* %226, align 4, !tbaa !5
  %228 = add i32 %225, %227
  %229 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 42
  %230 = load i32, i32 addrspace(3)* %229, align 8, !tbaa !5
  %231 = add i32 %228, %230
  %232 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 43
  %233 = load i32, i32 addrspace(3)* %232, align 4, !tbaa !5
  %234 = add i32 %231, %233
  %235 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 44
  %236 = load i32, i32 addrspace(3)* %235, align 16, !tbaa !5
  %237 = add i32 %234, %236
  %238 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 45
  %239 = load i32, i32 addrspace(3)* %238, align 4, !tbaa !5
  %240 = add i32 %237, %239
  %241 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 46
  %242 = load i32, i32 addrspace(3)* %241, align 8, !tbaa !5
  %243 = add i32 %240, %242
  %244 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 47
  %245 = load i32, i32 addrspace(3)* %244, align 4, !tbaa !5
  %246 = add i32 %243, %245
  %247 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 48
  %248 = load i32, i32 addrspace(3)* %247, align 16, !tbaa !5
  %249 = add i32 %246, %248
  %250 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 49
  %251 = load i32, i32 addrspace(3)* %250, align 4, !tbaa !5
  %252 = add i32 %249, %251
  %253 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 50
  %254 = load i32, i32 addrspace(3)* %253, align 8, !tbaa !5
  %255 = add i32 %252, %254
  %256 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 51
  %257 = load i32, i32 addrspace(3)* %256, align 4, !tbaa !5
  %258 = add i32 %255, %257
  %259 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 52
  %260 = load i32, i32 addrspace(3)* %259, align 16, !tbaa !5
  %261 = add i32 %258, %260
  %262 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 53
  %263 = load i32, i32 addrspace(3)* %262, align 4, !tbaa !5
  %264 = add i32 %261, %263
  %265 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 54
  %266 = load i32, i32 addrspace(3)* %265, align 8, !tbaa !5
  %267 = add i32 %264, %266
  %268 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 55
  %269 = load i32, i32 addrspace(3)* %268, align 4, !tbaa !5
  %270 = add i32 %267, %269
  %271 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 56
  %272 = load i32, i32 addrspace(3)* %271, align 16, !tbaa !5
  %273 = add i32 %270, %272
  %274 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 57
  %275 = load i32, i32 addrspace(3)* %274, align 4, !tbaa !5
  %276 = add i32 %273, %275
  %277 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 58
  %278 = load i32, i32 addrspace(3)* %277, align 8, !tbaa !5
  %279 = add i32 %276, %278
  %280 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 59
  %281 = load i32, i32 addrspace(3)* %280, align 4, !tbaa !5
  %282 = add i32 %279, %281
  %283 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 60
  %284 = load i32, i32 addrspace(3)* %283, align 16, !tbaa !5
  %285 = add i32 %282, %284
  %286 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 61
  %287 = load i32, i32 addrspace(3)* %286, align 4, !tbaa !5
  %288 = add i32 %285, %287
  %289 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 62
  %290 = load i32, i32 addrspace(3)* %289, align 8, !tbaa !5
  %291 = add i32 %288, %290
  %292 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]] addrspace(3)* @_ZZ10histKernelPclPjE4temp, i32 0, i32 %4, i32 63
  %293 = load i32, i32 addrspace(3)* %292, align 4, !tbaa !5
  %294 = add i32 %291, %293
  store i32 %294, i32 addrspace(3)* %101, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %295 = zext i32 %4 to i64
  %296 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %295
  %297 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !5
  %298 = atomicrmw add i32 addrspace(1)* %296, i32 %297 syncscope("agent-one-as") monotonic, align 4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!7, !7, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
