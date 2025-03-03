; ModuleID = '../data/hip_kernels/2961/14/main.cu'
source_filename = "../data/hip_kernels/2961/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18columnarize_groupsPaPKammPKmm(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i64 %2, i64 %3, i64 addrspace(1)* nocapture readonly %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %16, %13
  %19 = mul i32 %18, %13
  %20 = icmp ugt i32 %16, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = add i32 %23, %8
  %25 = mul i32 %24, %13
  %26 = add i32 %25, %7
  %27 = zext i32 %26 to i64
  %28 = icmp uge i64 %27, %2
  %29 = icmp eq i64 %3, 0
  %30 = select i1 %28, i1 true, i1 %29
  br i1 %30, label %101, label %31

31:                                               ; preds = %6
  %32 = mul i64 %27, %5
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %32
  %34 = and i64 %3, 1
  %35 = icmp eq i64 %3, 1
  br i1 %35, label %83, label %36

36:                                               ; preds = %31
  %37 = and i64 %3, -2
  br label %38

38:                                               ; preds = %75, %36
  %39 = phi i8 addrspace(1)* [ %33, %36 ], [ %79, %75 ]
  %40 = phi i64 [ 0, %36 ], [ %80, %75 ]
  %41 = phi i8 addrspace(1)* [ %0, %36 ], [ %78, %75 ]
  %42 = phi i64 [ 0, %36 ], [ %81, %75 ]
  %43 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %40
  %44 = load i64, i64 addrspace(1)* %43, align 8, !tbaa !16
  switch i64 %44, label %56 [
    i64 8, label %45
    i64 4, label %51
  ]

45:                                               ; preds = %38
  %46 = bitcast i8 addrspace(1)* %41 to i64 addrspace(1)*
  %47 = getelementptr inbounds i64, i64 addrspace(1)* %46, i64 %27
  %48 = bitcast i8 addrspace(1)* %39 to i64 addrspace(1)*
  %49 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !16
  store i64 %49, i64 addrspace(1)* %47, align 8, !tbaa !16
  %50 = load i64, i64 addrspace(1)* %43, align 8, !tbaa !16
  br label %56

51:                                               ; preds = %38
  %52 = bitcast i8 addrspace(1)* %41 to i32 addrspace(1)*
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %52, i64 %27
  %54 = bitcast i8 addrspace(1)* %39 to i32 addrspace(1)*
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !20
  store i32 %55, i32 addrspace(1)* %53, align 4, !tbaa !20
  br label %56

56:                                               ; preds = %38, %51, %45
  %57 = phi i64 [ %44, %38 ], [ 4, %51 ], [ %50, %45 ]
  %58 = mul i64 %57, %2
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %41, i64 %58
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %39, i64 %57
  %61 = or i64 %40, 1
  %62 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %61
  %63 = load i64, i64 addrspace(1)* %62, align 8, !tbaa !16
  switch i64 %63, label %75 [
    i64 8, label %69
    i64 4, label %64
  ]

64:                                               ; preds = %56
  %65 = bitcast i8 addrspace(1)* %59 to i32 addrspace(1)*
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %27
  %67 = bitcast i8 addrspace(1)* %60 to i32 addrspace(1)*
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !20
  store i32 %68, i32 addrspace(1)* %66, align 4, !tbaa !20
  br label %75

69:                                               ; preds = %56
  %70 = bitcast i8 addrspace(1)* %59 to i64 addrspace(1)*
  %71 = getelementptr inbounds i64, i64 addrspace(1)* %70, i64 %27
  %72 = bitcast i8 addrspace(1)* %60 to i64 addrspace(1)*
  %73 = load i64, i64 addrspace(1)* %72, align 8, !tbaa !16
  store i64 %73, i64 addrspace(1)* %71, align 8, !tbaa !16
  %74 = load i64, i64 addrspace(1)* %62, align 8, !tbaa !16
  br label %75

75:                                               ; preds = %69, %64, %56
  %76 = phi i64 [ %63, %56 ], [ 4, %64 ], [ %74, %69 ]
  %77 = mul i64 %76, %2
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %59, i64 %77
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %60, i64 %76
  %80 = add nuw i64 %40, 2
  %81 = add i64 %42, 2
  %82 = icmp eq i64 %81, %37
  br i1 %82, label %83, label %38, !llvm.loop !22

83:                                               ; preds = %75, %31
  %84 = phi i8 addrspace(1)* [ %33, %31 ], [ %79, %75 ]
  %85 = phi i64 [ 0, %31 ], [ %80, %75 ]
  %86 = phi i8 addrspace(1)* [ %0, %31 ], [ %78, %75 ]
  %87 = icmp eq i64 %34, 0
  br i1 %87, label %101, label %88

88:                                               ; preds = %83
  %89 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %85
  %90 = load i64, i64 addrspace(1)* %89, align 8, !tbaa !16
  switch i64 %90, label %101 [
    i64 8, label %96
    i64 4, label %91
  ]

91:                                               ; preds = %88
  %92 = bitcast i8 addrspace(1)* %86 to i32 addrspace(1)*
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %27
  %94 = bitcast i8 addrspace(1)* %84 to i32 addrspace(1)*
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !20
  store i32 %95, i32 addrspace(1)* %93, align 4, !tbaa !20
  br label %101

96:                                               ; preds = %88
  %97 = bitcast i8 addrspace(1)* %86 to i64 addrspace(1)*
  %98 = getelementptr inbounds i64, i64 addrspace(1)* %97, i64 %27
  %99 = bitcast i8 addrspace(1)* %84 to i64 addrspace(1)*
  %100 = load i64, i64 addrspace(1)* %99, align 8, !tbaa !16
  store i64 %100, i64 addrspace(1)* %98, align 8, !tbaa !16
  br label %101

101:                                              ; preds = %83, %96, %91, %88, %6
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"long", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
