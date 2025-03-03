; ModuleID = '../data/hip_kernels/15112/1/main.cu'
source_filename = "../data/hip_kernels/15112/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18convolution_kernelPhS_E2As = internal unnamed_addr addrspace(3) global [32 x [32 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z18convolution_kernelPhS_(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %18 = shl i32 %3, 1
  %19 = xor i32 %18, -1
  %20 = add i32 %10, %19
  %21 = add i32 %20, %9
  %22 = shl i32 %11, 1
  %23 = xor i32 %22, -1
  %24 = add i32 %17, %23
  %25 = add i32 %24, %16
  %26 = icmp slt i32 %21, 0
  %27 = icmp eq i32 %21, 1920
  %28 = select i1 %27, i32 1919, i32 %21
  %29 = select i1 %26, i32 0, i32 %28
  %30 = icmp slt i32 %25, 0
  %31 = icmp eq i32 %25, 2520
  %32 = mul nsw i32 %25, 1920
  %33 = select i1 %31, i32 4836480, i32 %32
  %34 = select i1 %30, i32 0, i32 %33
  %35 = add nsw i32 %34, %29
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !5
  %39 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_E2As, i32 0, i32 %10, i32 %17
  store i8 %38, i8 addrspace(3)* %39, align 1, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %10, label %40 [
    i32 0, label %85
    i32 31, label %85
  ]

40:                                               ; preds = %2
  switch i32 %17, label %41 [
    i32 0, label %85
    i32 31, label %85
  ]

41:                                               ; preds = %40
  %42 = add nsw i32 %10, -1
  %43 = add nsw i32 %17, -1
  %44 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_E2As, i32 0, i32 %42, i32 %43
  %45 = load i8, i8 addrspace(3)* %44, align 1, !tbaa !7
  %46 = zext i8 %45 to i16
  %47 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_E2As, i32 0, i32 %10, i32 %43
  %48 = load i8, i8 addrspace(3)* %47, align 1, !tbaa !7
  %49 = zext i8 %48 to i16
  %50 = add nuw nsw i32 %10, 1
  %51 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_E2As, i32 0, i32 %50, i32 %43
  %52 = load i8, i8 addrspace(3)* %51, align 1, !tbaa !7
  %53 = zext i8 %52 to i16
  %54 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_E2As, i32 0, i32 %42, i32 %17
  %55 = load i8, i8 addrspace(3)* %54, align 1, !tbaa !7
  %56 = zext i8 %55 to i16
  %57 = load i8, i8 addrspace(3)* %39, align 1, !tbaa !7
  %58 = zext i8 %57 to i16
  %59 = shl nuw nsw i16 %58, 2
  %60 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_E2As, i32 0, i32 %50, i32 %17
  %61 = load i8, i8 addrspace(3)* %60, align 1, !tbaa !7
  %62 = zext i8 %61 to i16
  %63 = add nuw nsw i32 %17, 1
  %64 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_E2As, i32 0, i32 %42, i32 %63
  %65 = load i8, i8 addrspace(3)* %64, align 1, !tbaa !7
  %66 = zext i8 %65 to i16
  %67 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_E2As, i32 0, i32 %10, i32 %63
  %68 = load i8, i8 addrspace(3)* %67, align 1, !tbaa !7
  %69 = zext i8 %68 to i16
  %70 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_E2As, i32 0, i32 %50, i32 %63
  %71 = load i8, i8 addrspace(3)* %70, align 1, !tbaa !7
  %72 = zext i8 %71 to i16
  %73 = add nuw nsw i16 %56, %49
  %74 = add nuw nsw i16 %73, %62
  %75 = add nuw nsw i16 %74, %69
  %76 = shl nuw nsw i16 %75, 1
  %77 = add nuw nsw i16 %53, %46
  %78 = add nuw nsw i16 %77, %59
  %79 = add nuw nsw i16 %78, %66
  %80 = add nuw nsw i16 %79, %72
  %81 = add nuw nsw i16 %80, %76
  %82 = lshr i16 %81, 4
  %83 = trunc i16 %82 to i8
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %36
  store i8 %83, i8 addrspace(1)* %84, align 1, !tbaa !7
  br label %85

85:                                               ; preds = %40, %40, %2, %2, %41
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
