; ModuleID = '../data/hip_kernels/13913/17/main.cu'
source_filename = "../data/hip_kernels/13913/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14__extractmat2dPfPxii(float addrspace(1)* nocapture writeonly %0, i64 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = udiv i32 %13, %10
  %16 = mul i32 %15, %10
  %17 = icmp ugt i32 %13, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = mul i32 %19, %20
  %22 = add i32 %21, %14
  %23 = mul i32 %22, %10
  %24 = add i32 %23, %5
  %25 = mul nsw i32 %3, %2
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %42

27:                                               ; preds = %4
  %28 = mul i32 %19, %10
  %29 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 16
  %30 = bitcast i8 addrspace(4)* %29 to i32 addrspace(4)*
  %31 = load i32, i32 addrspace(4)* %30, align 8, !tbaa !16
  %32 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 2, !range !5, !invariant.load !6
  %35 = zext i16 %34 to i32
  %36 = udiv i32 %31, %35
  %37 = mul i32 %36, %35
  %38 = icmp ugt i32 %31, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %36, %39
  %41 = mul i32 %28, %40
  br label %43

42:                                               ; preds = %43, %4
  ret void

43:                                               ; preds = %27, %43
  %44 = phi i32 [ %24, %27 ], [ %55, %43 ]
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %45
  %47 = bitcast i64 addrspace(1)* %46 to i32 addrspace(1)*
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !17, !amdgpu.noclobber !6
  %49 = and i32 %48, 2147483647
  %50 = sub nsw i32 0, %49
  %51 = icmp slt i32 %48, 0
  %52 = select i1 %51, i32 %50, i32 %48
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %54 = bitcast float addrspace(1)* %53 to i32 addrspace(1)*
  store i32 %52, i32 addrspace(1)* %54, align 4, !tbaa !21
  %55 = add i32 %41, %44
  %56 = icmp slt i32 %55, %25
  br i1 %56, label %43, label %42, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !19, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
