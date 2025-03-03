; ModuleID = '../data/hip_kernels/2904/12/main.cu'
source_filename = "../data/hip_kernels/2904/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10init_groupPammPKmS1_(i8 addrspace(1)* nocapture writeonly %0, i64 %1, i64 %2, i64 addrspace(1)* nocapture readonly %3, i64 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !7
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = udiv i32 %15, %12
  %18 = mul i32 %17, %12
  %19 = icmp ugt i32 %15, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %16
  %23 = add i32 %22, %7
  %24 = mul i32 %23, %12
  %25 = add i32 %24, %6
  %26 = zext i32 %25 to i64
  %27 = icmp ult i64 %26, %1
  %28 = icmp ne i64 %2, 0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %94

30:                                               ; preds = %5
  %31 = and i64 %2, 1
  %32 = icmp eq i64 %2, 1
  br i1 %32, label %77, label %33

33:                                               ; preds = %30
  %34 = and i64 %2, -2
  br label %35

35:                                               ; preds = %70, %33
  %36 = phi i64 [ 0, %33 ], [ %72, %70 ]
  %37 = phi i8 addrspace(1)* [ %0, %33 ], [ %74, %70 ]
  %38 = phi i64 [ 0, %33 ], [ %75, %70 ]
  %39 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %36
  %40 = load i64, i64 addrspace(1)* %39, align 8, !tbaa !16
  switch i64 %40, label %52 [
    i64 4, label %41
    i64 8, label %46
  ]

41:                                               ; preds = %35
  %42 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %36
  %43 = bitcast i64 addrspace(1)* %42 to i32 addrspace(1)*
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !20
  %45 = bitcast i8 addrspace(1)* %37 to i32 addrspace(1)*
  store i32 %44, i32 addrspace(1)* %45, align 4, !tbaa !20
  br label %52

46:                                               ; preds = %35
  %47 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %36
  %48 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !16
  %49 = bitcast i8 addrspace(1)* %37 to i64 addrspace(1)*
  %50 = getelementptr inbounds i64, i64 addrspace(1)* %49, i64 %26
  store i64 %48, i64 addrspace(1)* %50, align 8, !tbaa !16
  %51 = load i64, i64 addrspace(1)* %39, align 8, !tbaa !16
  br label %52

52:                                               ; preds = %41, %46, %35
  %53 = phi i64 [ 4, %41 ], [ %51, %46 ], [ %40, %35 ]
  %54 = or i64 %36, 1
  %55 = mul i64 %53, %1
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %37, i64 %55
  %57 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %54
  %58 = load i64, i64 addrspace(1)* %57, align 8, !tbaa !16
  switch i64 %58, label %70 [
    i64 4, label %65
    i64 8, label %59
  ]

59:                                               ; preds = %52
  %60 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %54
  %61 = load i64, i64 addrspace(1)* %60, align 8, !tbaa !16
  %62 = bitcast i8 addrspace(1)* %56 to i64 addrspace(1)*
  %63 = getelementptr inbounds i64, i64 addrspace(1)* %62, i64 %26
  store i64 %61, i64 addrspace(1)* %63, align 8, !tbaa !16
  %64 = load i64, i64 addrspace(1)* %57, align 8, !tbaa !16
  br label %70

65:                                               ; preds = %52
  %66 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %54
  %67 = bitcast i64 addrspace(1)* %66 to i32 addrspace(1)*
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !20
  %69 = bitcast i8 addrspace(1)* %56 to i32 addrspace(1)*
  store i32 %68, i32 addrspace(1)* %69, align 4, !tbaa !20
  br label %70

70:                                               ; preds = %65, %59, %52
  %71 = phi i64 [ 4, %65 ], [ %64, %59 ], [ %58, %52 ]
  %72 = add nuw i64 %36, 2
  %73 = mul i64 %71, %1
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %56, i64 %73
  %75 = add i64 %38, 2
  %76 = icmp eq i64 %75, %34
  br i1 %76, label %77, label %35, !llvm.loop !22

77:                                               ; preds = %70, %30
  %78 = phi i64 [ 0, %30 ], [ %72, %70 ]
  %79 = phi i8 addrspace(1)* [ %0, %30 ], [ %74, %70 ]
  %80 = icmp eq i64 %31, 0
  br i1 %80, label %94, label %81

81:                                               ; preds = %77
  %82 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %78
  %83 = load i64, i64 addrspace(1)* %82, align 8, !tbaa !16
  switch i64 %83, label %94 [
    i64 4, label %89
    i64 8, label %84
  ]

84:                                               ; preds = %81
  %85 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %78
  %86 = load i64, i64 addrspace(1)* %85, align 8, !tbaa !16
  %87 = bitcast i8 addrspace(1)* %79 to i64 addrspace(1)*
  %88 = getelementptr inbounds i64, i64 addrspace(1)* %87, i64 %26
  store i64 %86, i64 addrspace(1)* %88, align 8, !tbaa !16
  br label %94

89:                                               ; preds = %81
  %90 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %78
  %91 = bitcast i64 addrspace(1)* %90 to i32 addrspace(1)*
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !20
  %93 = bitcast i8 addrspace(1)* %79 to i32 addrspace(1)*
  store i32 %92, i32 addrspace(1)* %93, align 4, !tbaa !20
  br label %94

94:                                               ; preds = %77, %89, %84, %81, %5
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
