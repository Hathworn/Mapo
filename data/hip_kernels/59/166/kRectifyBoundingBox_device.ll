; ModuleID = '../data/hip_kernels/59/166/main.cu'
source_filename = "../data/hip_kernels/59/166/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19kRectifyBoundingBoxPfS_S_S_iiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = icmp slt i32 %9, %7
  br i1 %10, label %11, label %32

11:                                               ; preds = %8
  %12 = shl nsw i32 %7, 1
  %13 = mul nsw i32 %7, 3
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = icmp slt i32 %14, %4
  %16 = sitofp i32 %5 to double
  %17 = fdiv contract double 2.560000e+02, %16
  %18 = sitofp i32 %5 to float
  %19 = sitofp i32 %6 to float
  %20 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 12
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !5
  %26 = load i16, i16 addrspace(4)* %22, align 4, !range !14, !invariant.load !15
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %25, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %25, %29
  %31 = zext i1 %30 to i32
  br label %33

32:                                               ; preds = %50, %8
  ret void

33:                                               ; preds = %11, %50
  %34 = phi i32 [ %9, %11 ], [ %52, %50 ]
  %35 = mul nsw i32 %34, %4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = add nsw i32 %34, %7
  %39 = mul nsw i32 %38, %4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = add nsw i32 %34, %12
  %43 = mul nsw i32 %42, %4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = add nsw i32 %34, %13
  %47 = mul nsw i32 %46, %4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  br i1 %15, label %54, label %50

50:                                               ; preds = %76, %33
  %51 = add i32 %28, %34
  %52 = add i32 %51, %31
  %53 = icmp slt i32 %52, %7
  br i1 %53, label %33, label %32, !llvm.loop !16

54:                                               ; preds = %33, %76
  %55 = phi i32 [ %96, %76 ], [ %14, %33 ]
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !18
  %59 = fcmp contract ogt float %58, 5.000000e-01
  br i1 %59, label %60, label %70

60:                                               ; preds = %54
  %61 = getelementptr inbounds float, float addrspace(1)* %45, i64 %56
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !18
  %63 = fpext float %62 to double
  %64 = fsub contract double %17, %63
  %65 = fptrunc double %64 to float
  %66 = getelementptr inbounds float, float addrspace(1)* %37, i64 %56
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !18
  %68 = fpext float %67 to double
  %69 = fsub contract double %17, %68
  br label %76

70:                                               ; preds = %54
  %71 = getelementptr inbounds float, float addrspace(1)* %37, i64 %56
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !18
  %73 = getelementptr inbounds float, float addrspace(1)* %45, i64 %56
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !18
  %75 = fpext float %74 to double
  br label %76

76:                                               ; preds = %70, %60
  %77 = phi float [ %65, %60 ], [ %72, %70 ]
  %78 = phi contract double [ %69, %60 ], [ %75, %70 ]
  %79 = fptrunc double %78 to float
  %80 = getelementptr inbounds float, float addrspace(1)* %41, i64 %56
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !18
  %82 = getelementptr inbounds float, float addrspace(1)* %49, i64 %56
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !18
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !18
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !18
  %88 = fdiv contract float %85, %18
  %89 = fsub contract float %77, %88
  %90 = getelementptr inbounds float, float addrspace(1)* %37, i64 %56
  store float %89, float addrspace(1)* %90, align 4, !tbaa !18
  %91 = fsub contract float %79, %88
  %92 = getelementptr inbounds float, float addrspace(1)* %45, i64 %56
  store float %91, float addrspace(1)* %92, align 4, !tbaa !18
  %93 = fdiv contract float %87, %19
  %94 = fsub contract float %81, %93
  store float %94, float addrspace(1)* %80, align 4, !tbaa !18
  %95 = fsub contract float %83, %93
  store float %95, float addrspace(1)* %82, align 4, !tbaa !18
  %96 = add i32 %55, %27
  %97 = icmp slt i32 %96, %4
  br i1 %97, label %54, label %50, !llvm.loop !22
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
