; ModuleID = '../data/hip_kernels/14395/40/main.cu'
source_filename = "../data/hip_kernels/14395/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22cu_pooling_overlap_maxPKfPfS1_iiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = mul i32 %12, %17
  %22 = add i32 %21, %11
  %23 = udiv i32 %20, %17
  %24 = mul i32 %23, %17
  %25 = icmp ugt i32 %20, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %17
  %29 = icmp slt i32 %22, %9
  br i1 %29, label %30, label %72

30:                                               ; preds = %10
  %31 = icmp sgt i32 %8, 0
  %32 = icmp sgt i32 %7, 0
  br label %33

33:                                               ; preds = %30, %53
  %34 = phi i32 [ %54, %53 ], [ %22, %30 ]
  %35 = freeze i32 %34
  %36 = freeze i32 %6
  %37 = sdiv i32 %35, %36
  %38 = mul i32 %37, %36
  %39 = sub i32 %35, %38
  %40 = add nsw i32 %39, %7
  %41 = add nsw i32 %37, %8
  %42 = mul nsw i32 %37, %4
  %43 = add nsw i32 %42, %39
  %44 = sitofp i32 %43 to float
  %45 = sext i32 %34 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  store float %44, float addrspace(1)* %46, align 4, !tbaa !16
  br i1 %31, label %47, label %53

47:                                               ; preds = %33
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  br label %49

49:                                               ; preds = %47, %56
  %50 = phi i32 [ %37, %47 ], [ %57, %56 ]
  br i1 %32, label %51, label %56

51:                                               ; preds = %49
  %52 = mul nsw i32 %50, %4
  br label %59

53:                                               ; preds = %56, %33
  %54 = add nsw i32 %34, %28
  %55 = icmp slt i32 %54, %9
  br i1 %55, label %33, label %72, !llvm.loop !20

56:                                               ; preds = %69, %49
  %57 = add nsw i32 %50, 1
  %58 = icmp slt i32 %57, %41
  br i1 %58, label %49, label %53, !llvm.loop !22

59:                                               ; preds = %51, %69
  %60 = phi i32 [ %39, %51 ], [ %70, %69 ]
  %61 = add nsw i32 %60, %52
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  %66 = fcmp contract ogt float %64, %65
  br i1 %66, label %67, label %69

67:                                               ; preds = %59
  store float %64, float addrspace(1)* %48, align 4, !tbaa !16
  %68 = sitofp i32 %61 to float
  store float %68, float addrspace(1)* %46, align 4, !tbaa !16
  br label %69

69:                                               ; preds = %59, %67
  %70 = add nsw i32 %60, 1
  %71 = icmp slt i32 %70, %40
  br i1 %71, label %59, label %56, !llvm.loop !23

72:                                               ; preds = %53, %10
  ret void
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
