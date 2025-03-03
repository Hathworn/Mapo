; ModuleID = '../data/hip_kernels/5182/320/main.cu'
source_filename = "../data/hip_kernels/5182/320/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21DrawMaskedColorKernelPfiiiiS_iifff(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, float %8, float %9, float %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = udiv i32 %19, %16
  %23 = mul i32 %22, %16
  %24 = icmp ugt i32 %19, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %20
  %30 = mul i32 %29, %16
  %31 = add i32 %30, %28
  %32 = mul nsw i32 %7, %6
  %33 = sdiv i32 %31, %32
  %34 = mul nsw i32 %33, %32
  %35 = sub nsw i32 %31, %34
  %36 = sdiv i32 %35, %6
  %37 = icmp slt i32 %33, 3
  br i1 %37, label %38, label %68

38:                                               ; preds = %11
  %39 = mul nsw i32 %36, %6
  %40 = sub nsw i32 %35, %39
  %41 = add nsw i32 %40, %3
  %42 = icmp slt i32 %41, %1
  %43 = icmp sgt i32 %41, -1
  %44 = and i1 %42, %43
  br i1 %44, label %45, label %68

45:                                               ; preds = %38
  %46 = add nsw i32 %36, %4
  %47 = icmp slt i32 %46, %2
  %48 = icmp sgt i32 %46, -1
  %49 = and i1 %47, %48
  br i1 %49, label %50, label %68

50:                                               ; preds = %45
  %51 = mul i32 %33, %2
  %52 = add i32 %46, %51
  %53 = mul i32 %52, %1
  %54 = add i32 %41, %53
  %55 = mul nsw i32 %32, 3
  %56 = add nsw i32 %35, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %5, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16, !amdgpu.noclobber !5
  %60 = fcmp contract ogt float %59, 0.000000e+00
  br i1 %60, label %61, label %68

61:                                               ; preds = %50
  switch i32 %33, label %63 [
    i32 0, label %64
    i32 1, label %62
  ]

62:                                               ; preds = %61
  br label %64

63:                                               ; preds = %61
  br label %64

64:                                               ; preds = %61, %62, %63
  %65 = phi float [ %10, %63 ], [ %9, %62 ], [ %8, %61 ]
  %66 = sext i32 %54 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  store float %65, float addrspace(1)* %67, align 4, !tbaa !16
  br label %68

68:                                               ; preds = %64, %50, %38, %45, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
