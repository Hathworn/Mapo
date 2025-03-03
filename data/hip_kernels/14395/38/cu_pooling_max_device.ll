; ModuleID = '../data/hip_kernels/14395/38/main.cu'
source_filename = "../data/hip_kernels/14395/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14cu_pooling_maxPKfPfS1_iiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
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
  br i1 %29, label %30, label %75

30:                                               ; preds = %10, %56
  %31 = phi i32 [ %57, %56 ], [ %22, %10 ]
  %32 = freeze i32 %31
  %33 = freeze i32 %6
  %34 = sdiv i32 %32, %33
  %35 = mul i32 %34, %33
  %36 = sub i32 %32, %35
  %37 = mul nsw i32 %34, %8
  %38 = mul nsw i32 %36, %7
  %39 = add nsw i32 %38, %7
  %40 = tail call i32 @llvm.smin.i32(i32 %39, i32 %4)
  %41 = add nsw i32 %37, %8
  %42 = tail call i32 @llvm.smin.i32(i32 %41, i32 %3)
  %43 = mul nsw i32 %37, %4
  %44 = add nsw i32 %43, %38
  %45 = sitofp i32 %44 to float
  %46 = sext i32 %31 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  store float %45, float addrspace(1)* %47, align 4, !tbaa !16
  %48 = icmp slt i32 %37, %42
  br i1 %48, label %49, label %56

49:                                               ; preds = %30
  %50 = icmp slt i32 %38, %40
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  br label %52

52:                                               ; preds = %49, %59
  %53 = phi i32 [ %37, %49 ], [ %60, %59 ]
  br i1 %50, label %54, label %59

54:                                               ; preds = %52
  %55 = mul nsw i32 %53, %4
  br label %62

56:                                               ; preds = %59, %30
  %57 = add nsw i32 %31, %28
  %58 = icmp slt i32 %57, %9
  br i1 %58, label %30, label %75, !llvm.loop !20

59:                                               ; preds = %72, %52
  %60 = add nsw i32 %53, 1
  %61 = icmp slt i32 %60, %42
  br i1 %61, label %52, label %56, !llvm.loop !22

62:                                               ; preds = %54, %72
  %63 = phi i32 [ %38, %54 ], [ %73, %72 ]
  %64 = add nsw i32 %63, %55
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  %69 = fcmp contract ogt float %67, %68
  br i1 %69, label %70, label %72

70:                                               ; preds = %62
  store float %67, float addrspace(1)* %51, align 4, !tbaa !16
  %71 = sitofp i32 %64 to float
  store float %71, float addrspace(1)* %47, align 4, !tbaa !16
  br label %72

72:                                               ; preds = %62, %70
  %73 = add nsw i32 %63, 1
  %74 = icmp slt i32 %73, %40
  br i1 %74, label %62, label %59, !llvm.loop !23

75:                                               ; preds = %56, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
