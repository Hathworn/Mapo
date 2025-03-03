; ModuleID = '../data/hip_kernels/5182/321/main.cu'
source_filename = "../data/hip_kernels/5182/321/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28DrawMaskedColorKernel2DBlockPfiiiiS_iifff(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, float %8, float %9, float %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !6
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %20, %17
  %27 = mul i32 %26, %17
  %28 = icmp ugt i32 %20, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %21
  %32 = add i32 %31, %13
  %33 = mul i32 %32, %25
  %34 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %35 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %36 = mul nsw i32 %7, %6
  %37 = mul i32 %13, %25
  %38 = icmp slt i32 %21, 3
  br i1 %38, label %39, label %72

39:                                               ; preds = %11
  %40 = add nsw i32 %35, %3
  %41 = icmp slt i32 %40, %1
  %42 = icmp sgt i32 %40, -1
  %43 = and i1 %41, %42
  br i1 %43, label %44, label %72

44:                                               ; preds = %39
  %45 = add i32 %34, %4
  %46 = add i32 %45, %37
  %47 = icmp slt i32 %46, %2
  %48 = icmp sgt i32 %46, -1
  %49 = and i1 %47, %48
  br i1 %49, label %50, label %72

50:                                               ; preds = %44
  %51 = mul i32 %21, %2
  %52 = add i32 %46, %51
  %53 = mul i32 %52, %1
  %54 = add i32 %53, %40
  %55 = add i32 %33, %34
  %56 = mul i32 %55, %17
  %57 = sub i32 3, %21
  %58 = mul i32 %36, %57
  %59 = add i32 %56, %35
  %60 = add i32 %59, %58
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %5, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16, !amdgpu.noclobber !5
  %64 = fcmp contract ogt float %63, 0.000000e+00
  br i1 %64, label %65, label %72

65:                                               ; preds = %50
  switch i32 %21, label %67 [
    i32 0, label %68
    i32 1, label %66
  ]

66:                                               ; preds = %65
  br label %68

67:                                               ; preds = %65
  br label %68

68:                                               ; preds = %65, %66, %67
  %69 = phi float [ %10, %67 ], [ %9, %66 ], [ %8, %65 ]
  %70 = sext i32 %54 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  store float %69, float addrspace(1)* %71, align 4, !tbaa !16
  br label %72

72:                                               ; preds = %68, %50, %39, %44, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
