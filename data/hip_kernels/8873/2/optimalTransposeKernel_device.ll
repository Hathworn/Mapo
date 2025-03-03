; ModuleID = '../data/hip_kernels/8873/2/main.cu'
source_filename = "../data/hip_kernels/8873/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22optimalTransposeKernelPKfPfiE4tile = internal unnamed_addr addrspace(3) global [64 x [65 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z22optimalTransposeKernelPKfPfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 6
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = shl i32 %8, 6
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = add i32 %9, %10
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !5
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !14, !invariant.load !15
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = shl i32 %24, 6
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 16
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 8, !tbaa !16
  %29 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 2, !range !14, !invariant.load !15
  %32 = zext i16 %31 to i32
  %33 = udiv i32 %28, %32
  %34 = mul i32 %33, %32
  %35 = icmp ugt i32 %28, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = shl i32 %37, 6
  %39 = icmp slt i32 %7, %25
  %40 = icmp slt i32 %11, %38
  %41 = select i1 %39, i1 %40, i1 false
  br i1 %41, label %42, label %73

42:                                               ; preds = %3
  %43 = mul nsw i32 %25, %11
  %44 = add nsw i32 %43, %7
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !17, !amdgpu.noclobber !15
  %48 = getelementptr inbounds [64 x [65 x float]], [64 x [65 x float]] addrspace(3)* @_ZZ22optimalTransposeKernelPKfPfiE4tile, i32 0, i32 %10, i32 %6
  store float %47, float addrspace(3)* %48, align 4, !tbaa !17
  %49 = add nsw i32 %11, 16
  %50 = mul nsw i32 %25, %49
  %51 = add nsw i32 %50, %7
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !17, !amdgpu.noclobber !15
  %55 = add nuw nsw i32 %10, 16
  %56 = getelementptr inbounds [64 x [65 x float]], [64 x [65 x float]] addrspace(3)* @_ZZ22optimalTransposeKernelPKfPfiE4tile, i32 0, i32 %55, i32 %6
  store float %54, float addrspace(3)* %56, align 4, !tbaa !17
  %57 = add nsw i32 %11, 32
  %58 = mul nsw i32 %25, %57
  %59 = add nsw i32 %58, %7
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !17, !amdgpu.noclobber !15
  %63 = add nuw nsw i32 %10, 32
  %64 = getelementptr inbounds [64 x [65 x float]], [64 x [65 x float]] addrspace(3)* @_ZZ22optimalTransposeKernelPKfPfiE4tile, i32 0, i32 %63, i32 %6
  store float %62, float addrspace(3)* %64, align 4, !tbaa !17
  %65 = add nsw i32 %11, 48
  %66 = mul nsw i32 %25, %65
  %67 = add nsw i32 %66, %7
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !17, !amdgpu.noclobber !15
  %71 = add nuw nsw i32 %10, 48
  %72 = getelementptr inbounds [64 x [65 x float]], [64 x [65 x float]] addrspace(3)* @_ZZ22optimalTransposeKernelPKfPfiE4tile, i32 0, i32 %71, i32 %6
  store float %70, float addrspace(3)* %72, align 4, !tbaa !17
  br label %73

73:                                               ; preds = %42, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = add i32 %9, %6
  %75 = add i32 %5, %10
  %76 = icmp slt i32 %75, %25
  %77 = icmp slt i32 %74, %38
  %78 = select i1 %76, i1 %77, i1 false
  br i1 %78, label %79, label %110

79:                                               ; preds = %73
  %80 = getelementptr inbounds [64 x [65 x float]], [64 x [65 x float]] addrspace(3)* @_ZZ22optimalTransposeKernelPKfPfiE4tile, i32 0, i32 %6, i32 %10
  %81 = load float, float addrspace(3)* %80, align 4, !tbaa !17
  %82 = mul nsw i32 %38, %75
  %83 = add nsw i32 %82, %74
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  store float %81, float addrspace(1)* %85, align 4, !tbaa !17
  %86 = add nuw nsw i32 %10, 16
  %87 = getelementptr inbounds [64 x [65 x float]], [64 x [65 x float]] addrspace(3)* @_ZZ22optimalTransposeKernelPKfPfiE4tile, i32 0, i32 %6, i32 %86
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !17
  %89 = add nsw i32 %75, 16
  %90 = mul nsw i32 %38, %89
  %91 = add nsw i32 %90, %74
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  store float %88, float addrspace(1)* %93, align 4, !tbaa !17
  %94 = add nuw nsw i32 %10, 32
  %95 = getelementptr inbounds [64 x [65 x float]], [64 x [65 x float]] addrspace(3)* @_ZZ22optimalTransposeKernelPKfPfiE4tile, i32 0, i32 %6, i32 %94
  %96 = load float, float addrspace(3)* %95, align 4, !tbaa !17
  %97 = add nsw i32 %75, 32
  %98 = mul nsw i32 %38, %97
  %99 = add nsw i32 %98, %74
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  store float %96, float addrspace(1)* %101, align 4, !tbaa !17
  %102 = add nuw nsw i32 %10, 48
  %103 = getelementptr inbounds [64 x [65 x float]], [64 x [65 x float]] addrspace(3)* @_ZZ22optimalTransposeKernelPKfPfiE4tile, i32 0, i32 %6, i32 %102
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !17
  %105 = add nsw i32 %75, 48
  %106 = mul nsw i32 %38, %105
  %107 = add nsw i32 %106, %74
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  store float %104, float addrspace(1)* %109, align 4, !tbaa !17
  br label %110

110:                                              ; preds = %79, %73
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!6, !10, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
