; ModuleID = '../data/hip_kernels/810/219/main.cu'
source_filename = "../data/hip_kernels/810/219/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12transposeRowPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %22 = add i32 %20, %21
  %23 = udiv i32 %13, %10
  %24 = mul i32 %23, %10
  %25 = icmp ugt i32 %13, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %22
  %29 = add i32 %28, %6
  %30 = mul i32 %29, %10
  %31 = add i32 %30, %14
  %32 = icmp ult i32 %31, %3
  br i1 %32, label %33, label %119

33:                                               ; preds = %4
  %34 = mul i32 %31, %2
  %35 = add nuw i32 %31, 1
  %36 = mul i32 %35, %2
  %37 = icmp slt i32 %34, %36
  br i1 %37, label %38, label %119

38:                                               ; preds = %33
  %39 = add i32 %2, -1
  %40 = and i32 %2, 7
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %55, label %42

42:                                               ; preds = %38, %42
  %43 = phi i32 [ %52, %42 ], [ %34, %38 ]
  %44 = phi i32 [ %51, %42 ], [ %31, %38 ]
  %45 = phi i32 [ %53, %42 ], [ 0, %38 ]
  %46 = sext i32 %43 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16
  %49 = sext i32 %44 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  store float %48, float addrspace(1)* %50, align 4, !tbaa !16
  %51 = add nsw i32 %44, %2
  %52 = add nsw i32 %43, 1
  %53 = add i32 %45, 1
  %54 = icmp eq i32 %53, %40
  br i1 %54, label %55, label %42, !llvm.loop !20

55:                                               ; preds = %42, %38
  %56 = phi i32 [ %34, %38 ], [ %52, %42 ]
  %57 = phi i32 [ %31, %38 ], [ %51, %42 ]
  %58 = icmp ult i32 %39, 7
  br i1 %58, label %119, label %59

59:                                               ; preds = %55, %59
  %60 = phi i32 [ %117, %59 ], [ %56, %55 ]
  %61 = phi i32 [ %116, %59 ], [ %57, %55 ]
  %62 = sext i32 %60 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = sext i32 %61 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  store float %64, float addrspace(1)* %66, align 4, !tbaa !16
  %67 = add nsw i32 %61, %2
  %68 = add nsw i32 %60, 1
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16
  %72 = sext i32 %67 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  store float %71, float addrspace(1)* %73, align 4, !tbaa !16
  %74 = add nsw i32 %67, %2
  %75 = add nsw i32 %60, 2
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = sext i32 %74 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  store float %78, float addrspace(1)* %80, align 4, !tbaa !16
  %81 = add nsw i32 %74, %2
  %82 = add nsw i32 %60, 3
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = sext i32 %81 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  store float %85, float addrspace(1)* %87, align 4, !tbaa !16
  %88 = add nsw i32 %81, %2
  %89 = add nsw i32 %60, 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16
  %93 = sext i32 %88 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  store float %92, float addrspace(1)* %94, align 4, !tbaa !16
  %95 = add nsw i32 %88, %2
  %96 = add nsw i32 %60, 5
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16
  %100 = sext i32 %95 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  store float %99, float addrspace(1)* %101, align 4, !tbaa !16
  %102 = add nsw i32 %95, %2
  %103 = add nsw i32 %60, 6
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = sext i32 %102 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  store float %106, float addrspace(1)* %108, align 4, !tbaa !16
  %109 = add nsw i32 %102, %2
  %110 = add nsw i32 %60, 7
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !16
  %114 = sext i32 %109 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  store float %113, float addrspace(1)* %115, align 4, !tbaa !16
  %116 = add nsw i32 %109, %2
  %117 = add nsw i32 %60, 8
  %118 = icmp eq i32 %117, %36
  br i1 %118, label %119, label %59, !llvm.loop !22

119:                                              ; preds = %55, %59, %33, %4
  ret void
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
