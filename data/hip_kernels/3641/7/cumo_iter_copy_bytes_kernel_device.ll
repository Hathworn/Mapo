; ModuleID = '../data/hip_kernels/3641/7/main.cu'
source_filename = "../data/hip_kernels/3641/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27cumo_iter_copy_bytes_kernelPcS_llPmS0_ml(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i64 %2, i64 %3, i64 addrspace(1)* readonly %4, i64 addrspace(1)* readonly %5, i64 %6, i64 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = mul i32 %9, %14
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %20 = add i32 %18, %19
  %21 = zext i32 %20 to i64
  %22 = icmp ult i64 %21, %6
  br i1 %22, label %23, label %34

23:                                               ; preds = %8
  %24 = icmp eq i64 addrspace(1)* %4, addrspacecast (i64* null to i64 addrspace(1)*)
  %25 = icmp eq i64 addrspace(1)* %5, addrspacecast (i64* null to i64 addrspace(1)*)
  %26 = icmp ugt i64 %7, 3
  %27 = udiv i32 %17, %14
  %28 = mul i32 %27, %14
  %29 = icmp ugt i32 %17, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %14
  %33 = zext i32 %32 to i64
  br label %35

34:                                               ; preds = %85, %8
  ret void

35:                                               ; preds = %23, %85
  %36 = phi i64 [ %21, %23 ], [ %86, %85 ]
  br i1 %24, label %40, label %37

37:                                               ; preds = %35
  %38 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %36
  %39 = load i64, i64 addrspace(1)* %38, align 8, !tbaa !16
  br label %42

40:                                               ; preds = %35
  %41 = mul i64 %36, %2
  br label %42

42:                                               ; preds = %40, %37
  %43 = phi i64 [ %39, %37 ], [ %41, %40 ]
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  br i1 %25, label %48, label %45

45:                                               ; preds = %42
  %46 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %36
  %47 = load i64, i64 addrspace(1)* %46, align 8, !tbaa !16
  br label %50

48:                                               ; preds = %42
  %49 = mul i64 %36, %3
  br label %50

50:                                               ; preds = %48, %45
  %51 = phi i64 [ %47, %45 ], [ %49, %48 ]
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %51
  br i1 %26, label %53, label %71

53:                                               ; preds = %50, %53
  %54 = phi i8 addrspace(1)* [ %68, %53 ], [ %44, %50 ]
  %55 = phi i8 addrspace(1)* [ %69, %53 ], [ %52, %50 ]
  %56 = phi i64 [ %67, %53 ], [ %7, %50 ]
  %57 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !20
  store i8 %57, i8 addrspace(1)* %55, align 1, !tbaa !20
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %54, i64 1
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !20
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %55, i64 1
  store i8 %59, i8 addrspace(1)* %60, align 1, !tbaa !20
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %54, i64 2
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !20
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %55, i64 2
  store i8 %62, i8 addrspace(1)* %63, align 1, !tbaa !20
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %54, i64 3
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !20
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %55, i64 3
  store i8 %65, i8 addrspace(1)* %66, align 1, !tbaa !20
  %67 = add i64 %56, -4
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %54, i64 4
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %55, i64 4
  %70 = icmp ugt i64 %67, 3
  br i1 %70, label %53, label %71, !llvm.loop !21

71:                                               ; preds = %53, %50
  %72 = phi i64 [ %7, %50 ], [ %67, %53 ]
  %73 = phi i8 addrspace(1)* [ %52, %50 ], [ %69, %53 ]
  %74 = phi i8 addrspace(1)* [ %44, %50 ], [ %68, %53 ]
  switch i64 %72, label %85 [
    i64 3, label %75
    i64 2, label %79
    i64 1, label %83
  ]

75:                                               ; preds = %71
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %74, i64 2
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !20
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %73, i64 2
  store i8 %77, i8 addrspace(1)* %78, align 1, !tbaa !20
  br label %79

79:                                               ; preds = %75, %71
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %74, i64 1
  %81 = load i8, i8 addrspace(1)* %80, align 1, !tbaa !20
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %73, i64 1
  store i8 %81, i8 addrspace(1)* %82, align 1, !tbaa !20
  br label %83

83:                                               ; preds = %79, %71
  %84 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !20
  store i8 %84, i8 addrspace(1)* %73, align 1, !tbaa !20
  br label %85

85:                                               ; preds = %71, %83
  %86 = add i64 %36, %33
  %87 = icmp ult i64 %86, %6
  br i1 %87, label %35, label %34, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"long", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!18, !18, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
