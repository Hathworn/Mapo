; ModuleID = '../data/hip_kernels/16911/7/main.cu'
source_filename = "../data/hip_kernels/16911/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13sec_min_cuda_iiPfPiS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = icmp slt i32 %6, %0
  br i1 %7, label %8, label %23

8:                                                ; preds = %5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = icmp slt i32 %9, %1
  %11 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !5
  %17 = load i16, i16 addrspace(4)* %13, align 4, !range !14, !invariant.load !15
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %16, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  br label %24

23:                                               ; preds = %38, %5
  ret void

24:                                               ; preds = %8, %38
  %25 = phi i32 [ %6, %8 ], [ %40, %38 ]
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !16, !amdgpu.noclobber !15
  %29 = add nsw i32 %25, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !15
  br i1 %10, label %33, label %38

33:                                               ; preds = %24
  %34 = icmp slt i32 %28, %32
  %35 = mul nsw i32 %25, %1
  br label %36

36:                                               ; preds = %33, %42
  %37 = phi i32 [ %9, %33 ], [ %47, %42 ]
  br i1 %34, label %49, label %42

38:                                               ; preds = %42, %24
  %39 = add i32 %19, %25
  %40 = add i32 %39, %22
  %41 = icmp slt i32 %40, %0
  br i1 %41, label %24, label %23, !llvm.loop !20

42:                                               ; preds = %49, %36
  %43 = phi float [ 0x7FF0000000000000, %36 ], [ %58, %49 ]
  %44 = add nsw i32 %37, %35
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  store float %43, float addrspace(1)* %46, align 4, !tbaa !22
  %47 = add i32 %37, %18
  %48 = icmp slt i32 %47, %1
  br i1 %48, label %36, label %38, !llvm.loop !24

49:                                               ; preds = %36, %49
  %50 = phi i32 [ %59, %49 ], [ %28, %36 ]
  %51 = phi float [ %58, %49 ], [ 0x7FF0000000000000, %36 ]
  %52 = mul nsw i32 %50, %1
  %53 = add nsw i32 %52, %37
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !22
  %57 = fcmp contract olt float %56, %51
  %58 = select i1 %57, float %56, float %51
  %59 = add nsw i32 %50, 1
  %60 = icmp slt i32 %59, %32
  br i1 %60, label %49, label %42, !llvm.loop !25
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
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !18, i64 0}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
