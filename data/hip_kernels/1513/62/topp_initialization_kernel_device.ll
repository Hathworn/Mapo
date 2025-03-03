; ModuleID = '../data/hip_kernels/1513/62/main.cu'
source_filename = "../data/hip_kernels/1513/62/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z26topp_initialization_kernelPbPiS0_S0_S0_iii(i8 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %43

12:                                               ; preds = %8
  %13 = icmp sgt i32 %9, %5
  br i1 %13, label %20, label %14

14:                                               ; preds = %12
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  br label %28

20:                                               ; preds = %28, %12
  %21 = icmp slt i32 %9, %5
  br i1 %21, label %22, label %43

22:                                               ; preds = %20
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  br label %35

28:                                               ; preds = %14, %28
  %29 = phi i32 [ %9, %14 ], [ %33, %28 ]
  %30 = mul nsw i32 %29, %6
  %31 = sext i32 %29 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %31
  store i32 %30, i32 addrspace(1)* %32, align 4, !tbaa !7
  %33 = add i32 %29, %19
  %34 = icmp sgt i32 %33, %5
  br i1 %34, label %20, label %28, !llvm.loop !11

35:                                               ; preds = %22, %35
  %36 = phi i32 [ %9, %22 ], [ %41, %35 ]
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %37
  store i8 0, i8 addrspace(1)* %38, align 1, !tbaa !13
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  store i32 0, i32 addrspace(1)* %39, align 4, !tbaa !7
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  store i32 %7, i32 addrspace(1)* %40, align 4, !tbaa !7
  %41 = add i32 %36, %27
  %42 = icmp slt i32 %41, %5
  br i1 %42, label %35, label %43, !llvm.loop !15

43:                                               ; preds = %35, %20, %8
  %44 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %45 = getelementptr i8, i8 addrspace(4)* %44, i64 4
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 4, !range !5, !invariant.load !6
  %48 = zext i16 %47 to i32
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 12
  %50 = bitcast i8 addrspace(4)* %49 to i32 addrspace(4)*
  %51 = load i32, i32 addrspace(4)* %50, align 4, !tbaa !16
  %52 = mul i32 %10, %48
  %53 = add i32 %52, %9
  %54 = mul nsw i32 %6, %5
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %70

56:                                               ; preds = %43
  %57 = udiv i32 %51, %48
  %58 = mul i32 %57, %48
  %59 = icmp ugt i32 %51, %58
  %60 = zext i1 %59 to i32
  %61 = add i32 %57, %60
  %62 = mul i32 %61, %48
  br label %63

63:                                               ; preds = %56, %63
  %64 = phi i32 [ %53, %56 ], [ %68, %63 ]
  %65 = srem i32 %64, %6
  %66 = sext i32 %64 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %66
  store i32 %65, i32 addrspace(1)* %67, align 4, !tbaa !7
  %68 = add i32 %62, %64
  %69 = icmp slt i32 %68, %54
  br i1 %69, label %63, label %70, !llvm.loop !25

70:                                               ; preds = %63, %43
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"bool", !9, i64 0}
!15 = distinct !{!15, !12}
!16 = !{!17, !21, i64 12}
!17 = !{!"hsa_kernel_dispatch_packet_s", !18, i64 0, !18, i64 2, !18, i64 4, !18, i64 6, !18, i64 8, !18, i64 10, !21, i64 12, !21, i64 16, !21, i64 20, !21, i64 24, !21, i64 28, !22, i64 32, !23, i64 40, !22, i64 48, !24, i64 56}
!18 = !{!"short", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C/C++ TBAA"}
!21 = !{!"int", !19, i64 0}
!22 = !{!"long", !19, i64 0}
!23 = !{!"any pointer", !19, i64 0}
!24 = !{!"hsa_signal_s", !22, i64 0}
!25 = distinct !{!25, !12}
