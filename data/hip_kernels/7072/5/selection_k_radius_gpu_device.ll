; ModuleID = '../data/hip_kernels/7072/5/main.cu'
source_filename = "../data/hip_kernels/7072/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22selection_k_radius_gpuiiifPKiPKfPiPf(i32 %0, i32 %1, i32 %2, float %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul nsw i32 %9, %1
  %11 = mul nsw i32 %10, %2
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %12
  %14 = getelementptr inbounds float, float addrspace(1)* %5, i64 %12
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %12
  %16 = getelementptr inbounds float, float addrspace(1)* %7, i64 %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = icmp slt i32 %17, %1
  br i1 %18, label %19, label %36

19:                                               ; preds = %8
  %20 = icmp sgt i32 %2, 0
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = and i32 %2, 3
  %27 = icmp ult i32 %2, 4
  %28 = and i32 %2, -4
  %29 = icmp eq i32 %26, 0
  br label %30

30:                                               ; preds = %19, %59
  %31 = phi i32 [ %17, %19 ], [ %60, %59 ]
  br i1 %20, label %32, label %59

32:                                               ; preds = %30
  %33 = mul nsw i32 %31, %2
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %14, i64 %34
  br i1 %27, label %37, label %62

36:                                               ; preds = %59, %8
  ret void

37:                                               ; preds = %117, %32
  %38 = phi i32 [ 0, %32 ], [ %124, %117 ]
  br i1 %29, label %59, label %39

39:                                               ; preds = %37, %49
  %40 = phi i32 [ %56, %49 ], [ %38, %37 ]
  %41 = phi i32 [ %57, %49 ], [ 0, %37 ]
  %42 = add nsw i32 %40, %33
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %14, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = fcmp contract olt float %45, %3
  br i1 %46, label %49, label %47

47:                                               ; preds = %39
  %48 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %47, %39
  %50 = phi i64 [ %34, %47 ], [ %43, %39 ]
  %51 = phi float [ %48, %47 ], [ %45, %39 ]
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %50
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !11
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %43
  store i32 %53, i32 addrspace(1)* %54, align 4
  %55 = getelementptr inbounds float, float addrspace(1)* %16, i64 %43
  store float %51, float addrspace(1)* %55, align 4
  %56 = add nuw nsw i32 %40, 1
  %57 = add i32 %41, 1
  %58 = icmp eq i32 %57, %26
  br i1 %58, label %59, label %39, !llvm.loop !13

59:                                               ; preds = %37, %49, %30
  %60 = add i32 %31, %25
  %61 = icmp slt i32 %60, %1
  br i1 %61, label %30, label %36, !llvm.loop !15

62:                                               ; preds = %32, %117
  %63 = phi i32 [ %124, %117 ], [ 0, %32 ]
  %64 = phi i32 [ %125, %117 ], [ 0, %32 ]
  %65 = add nsw i32 %63, %33
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %14, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fcmp contract olt float %68, %3
  br i1 %69, label %72, label %70

70:                                               ; preds = %62
  %71 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  br label %72

72:                                               ; preds = %62, %70
  %73 = phi i64 [ %34, %70 ], [ %66, %62 ]
  %74 = phi float [ %71, %70 ], [ %68, %62 ]
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %73
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !11
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %66
  store i32 %76, i32 addrspace(1)* %77, align 4
  %78 = getelementptr inbounds float, float addrspace(1)* %16, i64 %66
  store float %74, float addrspace(1)* %78, align 4
  %79 = or i32 %63, 1
  %80 = add nsw i32 %79, %33
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %14, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = fcmp contract olt float %83, %3
  br i1 %84, label %87, label %85

85:                                               ; preds = %72
  %86 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  br label %87

87:                                               ; preds = %85, %72
  %88 = phi i64 [ %34, %85 ], [ %81, %72 ]
  %89 = phi float [ %86, %85 ], [ %83, %72 ]
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %88
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !11
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %81
  store i32 %91, i32 addrspace(1)* %92, align 4
  %93 = getelementptr inbounds float, float addrspace(1)* %16, i64 %81
  store float %89, float addrspace(1)* %93, align 4
  %94 = or i32 %63, 2
  %95 = add nsw i32 %94, %33
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %14, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = fcmp contract olt float %98, %3
  br i1 %99, label %102, label %100

100:                                              ; preds = %87
  %101 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  br label %102

102:                                              ; preds = %100, %87
  %103 = phi i64 [ %34, %100 ], [ %96, %87 ]
  %104 = phi float [ %101, %100 ], [ %98, %87 ]
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %103
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !11
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %96
  store i32 %106, i32 addrspace(1)* %107, align 4
  %108 = getelementptr inbounds float, float addrspace(1)* %16, i64 %96
  store float %104, float addrspace(1)* %108, align 4
  %109 = or i32 %63, 3
  %110 = add nsw i32 %109, %33
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %14, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = fcmp contract olt float %113, %3
  br i1 %114, label %117, label %115

115:                                              ; preds = %102
  %116 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  br label %117

117:                                              ; preds = %115, %102
  %118 = phi i64 [ %34, %115 ], [ %111, %102 ]
  %119 = phi float [ %116, %115 ], [ %113, %102 ]
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %118
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !11
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %111
  store i32 %121, i32 addrspace(1)* %122, align 4
  %123 = getelementptr inbounds float, float addrspace(1)* %16, i64 %111
  store float %119, float addrspace(1)* %123, align 4
  %124 = add nuw nsw i32 %63, 4
  %125 = add i32 %64, 4
  %126 = icmp eq i32 %125, %28
  br i1 %126, label %37, label %62, !llvm.loop !17
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
