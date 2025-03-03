; ModuleID = '../data/hip_kernels/8192/204/main.cu'
source_filename = "../data/hip_kernels/8192/204/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25RemoveNodeByUtilityKernelPiS_S_PffS0_S_S0_S_fi(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float %4, float addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8, float %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = udiv i32 %19, %16
  %23 = mul i32 %22, %16
  %24 = icmp ugt i32 %19, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %20
  %30 = mul i32 %29, %16
  %31 = add i32 %30, %28
  %32 = icmp slt i32 %31, %10
  br i1 %32, label %33, label %120

33:                                               ; preds = %11
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !16, !amdgpu.noclobber !5
  %37 = icmp eq i32 %36, 1
  br i1 %37, label %38, label %120

38:                                               ; preds = %33
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %34
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !20, !amdgpu.noclobber !5
  %41 = fcmp contract ogt float %40, 0.000000e+00
  %42 = fdiv contract float %9, %40
  %43 = fcmp contract ogt float %42, %4
  %44 = select i1 %41, i1 %43, i1 false
  br i1 %44, label %45, label %120

45:                                               ; preds = %38
  store i32 0, i32 addrspace(1)* %35, align 4, !tbaa !16
  %46 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  store float 0.000000e+00, float addrspace(1)* %46, align 4, !tbaa !20
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %34
  store i32 0, i32 addrspace(1)* %47, align 4, !tbaa !16
  %48 = getelementptr inbounds float, float addrspace(1)* %7, i64 %34
  store float 0.000000e+00, float addrspace(1)* %48, align 4, !tbaa !20
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %34
  store i32 0, i32 addrspace(1)* %49, align 4, !tbaa !16
  store float 0.000000e+00, float addrspace(1)* %39, align 4, !tbaa !20
  %50 = icmp sgt i32 %10, 0
  br i1 %50, label %51, label %120

51:                                               ; preds = %45
  %52 = mul nsw i32 %31, %10
  %53 = and i32 %10, 3
  %54 = icmp ult i32 %10, 4
  br i1 %54, label %102, label %55

55:                                               ; preds = %51
  %56 = and i32 %10, -4
  br label %57

57:                                               ; preds = %57, %55
  %58 = phi i32 [ 0, %55 ], [ %99, %57 ]
  %59 = phi i32 [ 0, %55 ], [ %100, %57 ]
  %60 = add nsw i32 %58, %52
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  store i32 0, i32 addrspace(1)* %62, align 4, !tbaa !16
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %61
  store i32 0, i32 addrspace(1)* %63, align 4, !tbaa !16
  %64 = mul nsw i32 %58, %10
  %65 = add nsw i32 %64, %31
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %66
  store i32 0, i32 addrspace(1)* %67, align 4, !tbaa !16
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %66
  store i32 0, i32 addrspace(1)* %68, align 4, !tbaa !16
  %69 = or i32 %58, 1
  %70 = add nsw i32 %69, %52
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  store i32 0, i32 addrspace(1)* %72, align 4, !tbaa !16
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  store i32 0, i32 addrspace(1)* %73, align 4, !tbaa !16
  %74 = mul nsw i32 %69, %10
  %75 = add nsw i32 %74, %31
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  store i32 0, i32 addrspace(1)* %77, align 4, !tbaa !16
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %76
  store i32 0, i32 addrspace(1)* %78, align 4, !tbaa !16
  %79 = or i32 %58, 2
  %80 = add nsw i32 %79, %52
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  store i32 0, i32 addrspace(1)* %82, align 4, !tbaa !16
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %81
  store i32 0, i32 addrspace(1)* %83, align 4, !tbaa !16
  %84 = mul nsw i32 %79, %10
  %85 = add nsw i32 %84, %31
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  store i32 0, i32 addrspace(1)* %87, align 4, !tbaa !16
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %86
  store i32 0, i32 addrspace(1)* %88, align 4, !tbaa !16
  %89 = or i32 %58, 3
  %90 = add nsw i32 %89, %52
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %91
  store i32 0, i32 addrspace(1)* %92, align 4, !tbaa !16
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  store i32 0, i32 addrspace(1)* %93, align 4, !tbaa !16
  %94 = mul nsw i32 %89, %10
  %95 = add nsw i32 %94, %31
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %96
  store i32 0, i32 addrspace(1)* %97, align 4, !tbaa !16
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %96
  store i32 0, i32 addrspace(1)* %98, align 4, !tbaa !16
  %99 = add nuw nsw i32 %58, 4
  %100 = add i32 %59, 4
  %101 = icmp eq i32 %100, %56
  br i1 %101, label %102, label %57, !llvm.loop !22

102:                                              ; preds = %57, %51
  %103 = phi i32 [ 0, %51 ], [ %99, %57 ]
  %104 = icmp eq i32 %53, 0
  br i1 %104, label %120, label %105

105:                                              ; preds = %102, %105
  %106 = phi i32 [ %117, %105 ], [ %103, %102 ]
  %107 = phi i32 [ %118, %105 ], [ 0, %102 ]
  %108 = add nsw i32 %106, %52
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %109
  store i32 0, i32 addrspace(1)* %110, align 4, !tbaa !16
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  store i32 0, i32 addrspace(1)* %111, align 4, !tbaa !16
  %112 = mul nsw i32 %106, %10
  %113 = add nsw i32 %112, %31
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %114
  store i32 0, i32 addrspace(1)* %115, align 4, !tbaa !16
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %114
  store i32 0, i32 addrspace(1)* %116, align 4, !tbaa !16
  %117 = add nuw nsw i32 %106, 1
  %118 = add i32 %107, 1
  %119 = icmp eq i32 %118, %53
  br i1 %119, label %120, label %105, !llvm.loop !24

120:                                              ; preds = %102, %105, %45, %33, %38, %11
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
