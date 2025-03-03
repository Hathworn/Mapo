; ModuleID = '../data/hip_kernels/8292/12/main.cu'
source_filename = "../data/hip_kernels/8292/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15group_point_gpuiiiiiPKfPKiPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %2
  %11 = mul i32 %10, %1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %5, i64 %12
  %14 = mul nsw i32 %4, %3
  %15 = mul nsw i32 %14, %9
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %16
  %18 = mul i32 %10, %14
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %7, i64 %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = icmp slt i32 %21, %3
  br i1 %27, label %28, label %39

28:                                               ; preds = %8
  %29 = icmp sgt i32 %4, 0
  %30 = icmp sgt i32 %2, 0
  %31 = and i32 %2, 7
  %32 = icmp ult i32 %2, 8
  %33 = and i32 %2, -8
  %34 = icmp eq i32 %31, 0
  br label %35

35:                                               ; preds = %28, %40
  %36 = phi i32 [ %21, %28 ], [ %41, %40 ]
  br i1 %29, label %37, label %40

37:                                               ; preds = %35
  %38 = mul nsw i32 %36, %4
  br label %43

39:                                               ; preds = %40, %8
  ret void

40:                                               ; preds = %67, %35
  %41 = add nuw nsw i32 %36, %26
  %42 = icmp slt i32 %41, %3
  br i1 %42, label %35, label %39, !llvm.loop !7

43:                                               ; preds = %37, %67
  %44 = phi i32 [ 0, %37 ], [ %68, %67 ]
  %45 = add nsw i32 %44, %38
  br i1 %30, label %46, label %67

46:                                               ; preds = %43
  %47 = sext i32 %45 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !9, !amdgpu.noclobber !6
  %50 = mul nsw i32 %49, %2
  %51 = mul i32 %45, %2
  br i1 %32, label %52, label %70

52:                                               ; preds = %70, %46
  %53 = phi i32 [ 0, %46 ], [ %136, %70 ]
  br i1 %34, label %67, label %54

54:                                               ; preds = %52, %54
  %55 = phi i32 [ %64, %54 ], [ %53, %52 ]
  %56 = phi i32 [ %65, %54 ], [ 0, %52 ]
  %57 = add nsw i32 %55, %50
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %13, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !13
  %61 = add nsw i32 %55, %51
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %20, i64 %62
  store float %60, float addrspace(1)* %63, align 4, !tbaa !13
  %64 = add nuw nsw i32 %55, 1
  %65 = add i32 %56, 1
  %66 = icmp eq i32 %65, %31
  br i1 %66, label %67, label %54, !llvm.loop !15

67:                                               ; preds = %52, %54, %43
  %68 = add nuw nsw i32 %44, 1
  %69 = icmp eq i32 %68, %4
  br i1 %69, label %40, label %43, !llvm.loop !17

70:                                               ; preds = %46, %70
  %71 = phi i32 [ %136, %70 ], [ 0, %46 ]
  %72 = phi i32 [ %137, %70 ], [ 0, %46 ]
  %73 = add nsw i32 %71, %50
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %13, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !13
  %77 = add nsw i32 %71, %51
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %20, i64 %78
  store float %76, float addrspace(1)* %79, align 4, !tbaa !13
  %80 = or i32 %71, 1
  %81 = add nsw i32 %80, %50
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %13, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !13
  %85 = add nsw i32 %80, %51
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %20, i64 %86
  store float %84, float addrspace(1)* %87, align 4, !tbaa !13
  %88 = or i32 %71, 2
  %89 = add nsw i32 %88, %50
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %13, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !13
  %93 = add nsw i32 %88, %51
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %20, i64 %94
  store float %92, float addrspace(1)* %95, align 4, !tbaa !13
  %96 = or i32 %71, 3
  %97 = add nsw i32 %96, %50
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %13, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !13
  %101 = add nsw i32 %96, %51
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %20, i64 %102
  store float %100, float addrspace(1)* %103, align 4, !tbaa !13
  %104 = or i32 %71, 4
  %105 = add nsw i32 %104, %50
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %13, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !13
  %109 = add nsw i32 %104, %51
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %20, i64 %110
  store float %108, float addrspace(1)* %111, align 4, !tbaa !13
  %112 = or i32 %71, 5
  %113 = add nsw i32 %112, %50
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %13, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !13
  %117 = add nsw i32 %112, %51
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %20, i64 %118
  store float %116, float addrspace(1)* %119, align 4, !tbaa !13
  %120 = or i32 %71, 6
  %121 = add nsw i32 %120, %50
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %13, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !13
  %125 = add nsw i32 %120, %51
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %20, i64 %126
  store float %124, float addrspace(1)* %127, align 4, !tbaa !13
  %128 = or i32 %71, 7
  %129 = add nsw i32 %128, %50
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %13, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !13
  %133 = add nsw i32 %128, %51
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %20, i64 %134
  store float %132, float addrspace(1)* %135, align 4, !tbaa !13
  %136 = add nuw nsw i32 %71, 8
  %137 = add i32 %72, 8
  %138 = icmp eq i32 %137, %33
  br i1 %138, label %52, label %70, !llvm.loop !18
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !11, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !8}
!18 = distinct !{!18, !8}
