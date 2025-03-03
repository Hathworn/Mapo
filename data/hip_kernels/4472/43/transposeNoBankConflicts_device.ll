; ModuleID = '../data/hip_kernels/4472/43/main.cu'
source_filename = "../data/hip_kernels/4472/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24transposeNoBankConflictsPfPKfE4tile = internal unnamed_addr addrspace(3) global [32 x [33 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24transposeNoBankConflictsPfPKf(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = shl i32 %3, 5
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !5
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !14, !invariant.load !15
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = shl i32 %22, 5
  %24 = add i32 %9, %8
  %25 = mul nsw i32 %23, %24
  %26 = add nsw i32 %6, %25
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !15
  %30 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ24transposeNoBankConflictsPfPKfE4tile, i32 0, i32 %9, i32 %5
  store float %29, float addrspace(3)* %30, align 4, !tbaa !16
  %31 = add nuw nsw i32 %9, 8
  %32 = add i32 %31, %8
  %33 = mul nsw i32 %23, %32
  %34 = add nsw i32 %6, %33
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !15
  %38 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ24transposeNoBankConflictsPfPKfE4tile, i32 0, i32 %31, i32 %5
  store float %37, float addrspace(3)* %38, align 4, !tbaa !16
  %39 = add nuw nsw i32 %9, 16
  %40 = add i32 %39, %8
  %41 = mul nsw i32 %23, %40
  %42 = add nsw i32 %6, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !15
  %46 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ24transposeNoBankConflictsPfPKfE4tile, i32 0, i32 %39, i32 %5
  store float %45, float addrspace(3)* %46, align 4, !tbaa !16
  %47 = add nuw nsw i32 %9, 24
  %48 = add i32 %47, %8
  %49 = mul nsw i32 %23, %48
  %50 = add nsw i32 %6, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !15
  %54 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ24transposeNoBankConflictsPfPKfE4tile, i32 0, i32 %47, i32 %5
  store float %53, float addrspace(3)* %54, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = add i32 %8, %5
  %56 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ24transposeNoBankConflictsPfPKfE4tile, i32 0, i32 %5, i32 %9
  %57 = load float, float addrspace(3)* %56, align 4, !tbaa !16
  %58 = add i32 %9, %4
  %59 = mul nsw i32 %23, %58
  %60 = add nsw i32 %55, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  store float %57, float addrspace(1)* %62, align 4, !tbaa !16
  %63 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ24transposeNoBankConflictsPfPKfE4tile, i32 0, i32 %5, i32 %31
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !16
  %65 = add i32 %31, %4
  %66 = mul nsw i32 %23, %65
  %67 = add nsw i32 %55, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  store float %64, float addrspace(1)* %69, align 4, !tbaa !16
  %70 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ24transposeNoBankConflictsPfPKfE4tile, i32 0, i32 %5, i32 %39
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !16
  %72 = add i32 %39, %4
  %73 = mul nsw i32 %23, %72
  %74 = add nsw i32 %55, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  store float %71, float addrspace(1)* %76, align 4, !tbaa !16
  %77 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ24transposeNoBankConflictsPfPKfE4tile, i32 0, i32 %5, i32 %47
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !16
  %79 = add i32 %47, %4
  %80 = mul nsw i32 %23, %79
  %81 = add nsw i32 %55, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  store float %78, float addrspace(1)* %83, align 4, !tbaa !16
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
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
