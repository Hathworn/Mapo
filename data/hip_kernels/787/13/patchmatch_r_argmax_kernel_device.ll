; ModuleID = '../data/hip_kernels/787/13/main.cu'
source_filename = "../data/hip_kernels/787/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26patchmatch_r_argmax_kernelPfS_S_Piiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = mul nsw i32 %6, %5
  %20 = mul nsw i32 %8, %7
  %21 = icmp slt i32 %18, %19
  %22 = icmp sgt i32 %7, 0
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %125

24:                                               ; preds = %9
  %25 = icmp sgt i32 %8, 0
  %26 = mul nsw i32 %18, %20
  %27 = shl nsw i32 %18, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %30 = add nuw nsw i32 %27, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %31
  %33 = icmp sgt i32 %4, 0
  %34 = and i32 %4, 3
  %35 = icmp ult i32 %4, 4
  %36 = and i32 %4, -4
  %37 = icmp eq i32 %34, 0
  br label %38

38:                                               ; preds = %24, %43
  %39 = phi double [ -1.000000e+20, %24 ], [ %44, %43 ]
  %40 = phi i32 [ 0, %24 ], [ %45, %43 ]
  br i1 %25, label %41, label %43

41:                                               ; preds = %38
  %42 = mul nsw i32 %40, %8
  br label %47

43:                                               ; preds = %121, %38
  %44 = phi double [ %39, %38 ], [ %122, %121 ]
  %45 = add nuw nsw i32 %40, 1
  %46 = icmp eq i32 %45, %7
  br i1 %46, label %125, label %38, !llvm.loop !7

47:                                               ; preds = %41, %121
  %48 = phi double [ %39, %41 ], [ %122, %121 ]
  %49 = phi i32 [ 0, %41 ], [ %123, %121 ]
  %50 = add nsw i32 %49, %42
  %51 = add nsw i32 %50, %26
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !9
  %55 = fpext float %54 to double
  %56 = fcmp contract olt double %48, %55
  br i1 %56, label %57, label %121

57:                                               ; preds = %47
  store i32 %49, i32 addrspace(1)* %29, align 4, !tbaa !13
  store i32 %40, i32 addrspace(1)* %32, align 4, !tbaa !13
  br i1 %33, label %58, label %121

58:                                               ; preds = %57
  br i1 %35, label %104, label %59

59:                                               ; preds = %58, %59
  %60 = phi i32 [ %101, %59 ], [ 0, %58 ]
  %61 = phi i32 [ %102, %59 ], [ 0, %58 ]
  %62 = mul nsw i32 %60, %20
  %63 = add nsw i32 %62, %50
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !9
  %67 = mul nsw i32 %60, %19
  %68 = add nsw i32 %67, %18
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  store float %66, float addrspace(1)* %70, align 4, !tbaa !9
  %71 = or i32 %60, 1
  %72 = mul nsw i32 %71, %20
  %73 = add nsw i32 %72, %50
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !9
  %77 = mul nsw i32 %71, %19
  %78 = add nsw i32 %77, %18
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  store float %76, float addrspace(1)* %80, align 4, !tbaa !9
  %81 = or i32 %60, 2
  %82 = mul nsw i32 %81, %20
  %83 = add nsw i32 %82, %50
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !9
  %87 = mul nsw i32 %81, %19
  %88 = add nsw i32 %87, %18
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  store float %86, float addrspace(1)* %90, align 4, !tbaa !9
  %91 = or i32 %60, 3
  %92 = mul nsw i32 %91, %20
  %93 = add nsw i32 %92, %50
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !9
  %97 = mul nsw i32 %91, %19
  %98 = add nsw i32 %97, %18
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  store float %96, float addrspace(1)* %100, align 4, !tbaa !9
  %101 = add nuw nsw i32 %60, 4
  %102 = add i32 %61, 4
  %103 = icmp eq i32 %102, %36
  br i1 %103, label %104, label %59, !llvm.loop !15

104:                                              ; preds = %59, %58
  %105 = phi i32 [ 0, %58 ], [ %101, %59 ]
  br i1 %37, label %121, label %106

106:                                              ; preds = %104, %106
  %107 = phi i32 [ %118, %106 ], [ %105, %104 ]
  %108 = phi i32 [ %119, %106 ], [ 0, %104 ]
  %109 = mul nsw i32 %107, %20
  %110 = add nsw i32 %109, %50
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !9
  %114 = mul nsw i32 %107, %19
  %115 = add nsw i32 %114, %18
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  store float %113, float addrspace(1)* %117, align 4, !tbaa !9
  %118 = add nuw nsw i32 %107, 1
  %119 = add i32 %108, 1
  %120 = icmp eq i32 %119, %34
  br i1 %120, label %121, label %106, !llvm.loop !16

121:                                              ; preds = %104, %106, %57, %47
  %122 = phi double [ %48, %47 ], [ %55, %57 ], [ %55, %106 ], [ %55, %104 ]
  %123 = add nuw nsw i32 %49, 1
  %124 = icmp eq i32 %123, %8
  br i1 %124, label %43, label %47, !llvm.loop !18

125:                                              ; preds = %43, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !11, i64 0}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !8}
