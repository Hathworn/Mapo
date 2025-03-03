; ModuleID = '../data/hip_kernels/3328/7/main.cu'
source_filename = "../data/hip_kernels/3328/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15MatrixTransposePKfPfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 8, !tbaa !6
  %14 = mul i32 %6, %10
  %15 = udiv i32 %13, %10
  %16 = mul i32 %15, %10
  %17 = icmp ugt i32 %13, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %10
  %21 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 4, !tbaa !15
  %28 = udiv i32 %27, %24
  %29 = mul i32 %28, %24
  %30 = icmp ugt i32 %27, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %24
  %34 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %35 = add i32 %14, %34
  %36 = icmp slt i32 %35, %2
  br i1 %36, label %37, label %43

37:                                               ; preds = %4
  %38 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %39 = mul i32 %38, %24
  %40 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %41 = add i32 %39, %40
  %42 = icmp slt i32 %41, %3
  br label %44

43:                                               ; preds = %48, %4
  ret void

44:                                               ; preds = %37, %48
  %45 = phi i32 [ %35, %37 ], [ %49, %48 ]
  br i1 %42, label %46, label %48

46:                                               ; preds = %44
  %47 = mul nsw i32 %45, %3
  br label %51

48:                                               ; preds = %51, %44
  %49 = add nsw i32 %45, %20
  %50 = icmp slt i32 %49, %2
  br i1 %50, label %44, label %43, !llvm.loop !17

51:                                               ; preds = %46, %51
  %52 = phi i32 [ %41, %46 ], [ %61, %51 ]
  %53 = mul nsw i32 %52, %2
  %54 = add nsw i32 %53, %45
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !19
  %58 = add nsw i32 %52, %47
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  store float %57, float addrspace(1)* %60, align 4, !tbaa !19
  %61 = add nsw i32 %52, %33
  %62 = icmp slt i32 %61, %3
  br i1 %62, label %51, label %48, !llvm.loop !23
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 16}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{!7, !11, i64 12}
!16 = !{i32 0, i32 1024}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !18}
