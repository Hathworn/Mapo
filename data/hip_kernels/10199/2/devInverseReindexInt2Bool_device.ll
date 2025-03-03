; ModuleID = '../data/hip_kernels/10199/2/main.cu'
source_filename = "../data/hip_kernels/10199/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25devInverseReindexInt2BooliP15HIP_vector_typeIiLj2EES1_Pjiiib(i32 %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i1 %7) local_unnamed_addr #0 {
  %9 = icmp eq i32 %5, 0
  br i1 %9, label %24, label %10

10:                                               ; preds = %8
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %0
  br label %25

24:                                               ; preds = %105, %8
  ret void

25:                                               ; preds = %10, %105
  %26 = phi i32 [ 0, %10 ], [ %106, %105 ]
  br i1 %23, label %27, label %105

27:                                               ; preds = %25
  %28 = mul i32 %26, %4
  %29 = udiv i32 %19, %16
  %30 = mul i32 %29, %16
  %31 = icmp ugt i32 %19, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %33, %16
  br label %35

35:                                               ; preds = %27, %100
  %36 = phi i32 [ %22, %27 ], [ %103, %100 ]
  %37 = add i32 %36, %28
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %38, i32 0, i32 0, i32 0, i64 0
  %40 = load i32, i32 addrspace(1)* %39, align 8, !tbaa !16
  %41 = icmp eq i32 %40, -1
  %42 = select i1 %41, i1 %7, i1 false
  br i1 %42, label %68, label %43

43:                                               ; preds = %35
  %44 = icmp slt i32 %40, %6
  br i1 %44, label %45, label %49

45:                                               ; preds = %49, %43
  %46 = phi i32 [ %40, %43 ], [ %52, %49 ]
  %47 = phi i32 [ 0, %43 ], [ %53, %49 ]
  %48 = icmp slt i32 %46, 0
  br i1 %48, label %55, label %61

49:                                               ; preds = %43, %49
  %50 = phi i32 [ %53, %49 ], [ 0, %43 ]
  %51 = phi i32 [ %52, %49 ], [ %40, %43 ]
  %52 = sub nsw i32 %51, %6
  %53 = add nsw i32 %50, %6
  %54 = icmp slt i32 %52, %6
  br i1 %54, label %45, label %49, !llvm.loop !19

55:                                               ; preds = %45, %55
  %56 = phi i32 [ %59, %55 ], [ %47, %45 ]
  %57 = phi i32 [ %58, %55 ], [ %46, %45 ]
  %58 = add nsw i32 %57, %6
  %59 = sub nsw i32 %56, %6
  %60 = icmp slt i32 %58, 0
  br i1 %60, label %55, label %61, !llvm.loop !21

61:                                               ; preds = %55, %45
  %62 = phi i32 [ %46, %45 ], [ %58, %55 ]
  %63 = phi i32 [ %47, %45 ], [ %59, %55 ]
  %64 = zext i32 %62 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !22
  %67 = add nsw i32 %66, %63
  br label %68

68:                                               ; preds = %35, %61
  %69 = phi i32 [ %67, %61 ], [ -1, %35 ]
  %70 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %38, i32 0, i32 0, i32 0, i64 0
  store i32 %69, i32 addrspace(1)* %70, align 8, !tbaa !16
  %71 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %38, i32 0, i32 0, i32 0, i64 1
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !16
  %73 = icmp eq i32 %72, -1
  %74 = select i1 %73, i1 %7, i1 false
  br i1 %74, label %100, label %75

75:                                               ; preds = %68
  %76 = icmp slt i32 %72, %6
  br i1 %76, label %77, label %81

77:                                               ; preds = %81, %75
  %78 = phi i32 [ %72, %75 ], [ %84, %81 ]
  %79 = phi i32 [ 0, %75 ], [ %85, %81 ]
  %80 = icmp slt i32 %78, 0
  br i1 %80, label %87, label %93

81:                                               ; preds = %75, %81
  %82 = phi i32 [ %85, %81 ], [ 0, %75 ]
  %83 = phi i32 [ %84, %81 ], [ %72, %75 ]
  %84 = sub nsw i32 %83, %6
  %85 = add nsw i32 %82, %6
  %86 = icmp slt i32 %84, %6
  br i1 %86, label %77, label %81, !llvm.loop !24

87:                                               ; preds = %77, %87
  %88 = phi i32 [ %91, %87 ], [ %79, %77 ]
  %89 = phi i32 [ %90, %87 ], [ %78, %77 ]
  %90 = add nsw i32 %89, %6
  %91 = sub nsw i32 %88, %6
  %92 = icmp slt i32 %90, 0
  br i1 %92, label %87, label %93, !llvm.loop !25

93:                                               ; preds = %87, %77
  %94 = phi i32 [ %78, %77 ], [ %90, %87 ]
  %95 = phi i32 [ %79, %77 ], [ %91, %87 ]
  %96 = zext i32 %94 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !22
  %99 = add nsw i32 %98, %95
  br label %100

100:                                              ; preds = %68, %93
  %101 = phi i32 [ %99, %93 ], [ -1, %68 ]
  %102 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %38, i32 0, i32 0, i32 0, i64 1
  store i32 %101, i32 addrspace(1)* %102, align 4, !tbaa !16
  %103 = add i32 %34, %36
  %104 = icmp slt i32 %103, %0
  br i1 %104, label %35, label %105, !llvm.loop !26

105:                                              ; preds = %100, %25
  %106 = add nuw i32 %26, 1
  %107 = icmp eq i32 %106, %5
  br i1 %107, label %24, label %25, !llvm.loop !27
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
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !17, i64 0}
!24 = distinct !{!24, !20}
!25 = distinct !{!25, !20}
!26 = distinct !{!26, !20}
!27 = distinct !{!27, !20}
