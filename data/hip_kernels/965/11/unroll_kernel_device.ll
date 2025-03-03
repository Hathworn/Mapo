; ModuleID = '../data/hip_kernels/965/11/main.cu'
source_filename = "../data/hip_kernels/965/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13unroll_kerneliiiPfS_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 10
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = or i32 %7, %8
  %10 = sub nsw i32 %1, %2
  %11 = add nsw i32 %10, 1
  %12 = mul nsw i32 %11, %11
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %124

14:                                               ; preds = %5
  %15 = freeze i32 %9
  %16 = freeze i32 %11
  %17 = sdiv i32 %15, %16
  %18 = mul i32 %17, %16
  %19 = sub i32 %15, %18
  %20 = mul nsw i32 %17, %11
  %21 = add nsw i32 %20, %19
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %23, label %124

23:                                               ; preds = %14
  %24 = and i32 %2, 3
  %25 = icmp ult i32 %2, 4
  %26 = and i32 %2, -4
  %27 = icmp eq i32 %24, 0
  br label %28

28:                                               ; preds = %23, %121
  %29 = phi i32 [ %122, %121 ], [ 0, %23 ]
  %30 = add nsw i32 %29, %17
  %31 = icmp slt i32 %30, %0
  %32 = mul nsw i32 %29, %2
  %33 = mul nsw i32 %30, %1
  br i1 %25, label %99, label %34

34:                                               ; preds = %28, %95
  %35 = phi i32 [ %96, %95 ], [ 0, %28 ]
  %36 = phi i32 [ %97, %95 ], [ 0, %28 ]
  %37 = add i32 %35, %19
  %38 = icmp slt i32 %37, %1
  %39 = select i1 %31, i1 %38, i1 false
  br i1 %39, label %40, label %50

40:                                               ; preds = %34
  %41 = add nsw i32 %35, %32
  %42 = add i32 %37, %33
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5
  %46 = mul nsw i32 %41, %12
  %47 = add nsw i32 %21, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  store float %45, float addrspace(1)* %49, align 4, !tbaa !5
  br label %50

50:                                               ; preds = %34, %40
  %51 = or i32 %35, 1
  %52 = add i32 %51, %19
  %53 = icmp slt i32 %52, %1
  %54 = select i1 %31, i1 %53, i1 false
  br i1 %54, label %55, label %65

55:                                               ; preds = %50
  %56 = add nsw i32 %51, %32
  %57 = add i32 %52, %33
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = mul nsw i32 %56, %12
  %62 = add nsw i32 %21, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  store float %60, float addrspace(1)* %64, align 4, !tbaa !5
  br label %65

65:                                               ; preds = %55, %50
  %66 = or i32 %35, 2
  %67 = add i32 %66, %19
  %68 = icmp slt i32 %67, %1
  %69 = select i1 %31, i1 %68, i1 false
  br i1 %69, label %70, label %80

70:                                               ; preds = %65
  %71 = add nsw i32 %66, %32
  %72 = add i32 %67, %33
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %3, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5
  %76 = mul nsw i32 %71, %12
  %77 = add nsw i32 %21, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %4, i64 %78
  store float %75, float addrspace(1)* %79, align 4, !tbaa !5
  br label %80

80:                                               ; preds = %70, %65
  %81 = or i32 %35, 3
  %82 = add i32 %81, %19
  %83 = icmp slt i32 %82, %1
  %84 = select i1 %31, i1 %83, i1 false
  br i1 %84, label %85, label %95

85:                                               ; preds = %80
  %86 = add nsw i32 %81, %32
  %87 = add i32 %82, %33
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %3, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5
  %91 = mul nsw i32 %86, %12
  %92 = add nsw i32 %21, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %4, i64 %93
  store float %90, float addrspace(1)* %94, align 4, !tbaa !5
  br label %95

95:                                               ; preds = %85, %80
  %96 = add nuw nsw i32 %35, 4
  %97 = add i32 %36, 4
  %98 = icmp eq i32 %97, %26
  br i1 %98, label %99, label %34, !llvm.loop !9

99:                                               ; preds = %95, %28
  %100 = phi i32 [ 0, %28 ], [ %96, %95 ]
  br i1 %27, label %121, label %101

101:                                              ; preds = %99, %117
  %102 = phi i32 [ %118, %117 ], [ %100, %99 ]
  %103 = phi i32 [ %119, %117 ], [ 0, %99 ]
  %104 = add i32 %102, %19
  %105 = icmp slt i32 %104, %1
  %106 = select i1 %31, i1 %105, i1 false
  br i1 %106, label %107, label %117

107:                                              ; preds = %101
  %108 = add nsw i32 %102, %32
  %109 = add i32 %104, %33
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %3, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5
  %113 = mul nsw i32 %108, %12
  %114 = add nsw i32 %21, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %4, i64 %115
  store float %112, float addrspace(1)* %116, align 4, !tbaa !5
  br label %117

117:                                              ; preds = %107, %101
  %118 = add nuw nsw i32 %102, 1
  %119 = add i32 %103, 1
  %120 = icmp eq i32 %119, %24
  br i1 %120, label %121, label %101, !llvm.loop !11

121:                                              ; preds = %117, %99
  %122 = add nuw nsw i32 %29, 1
  %123 = icmp eq i32 %122, %2
  br i1 %123, label %124, label %28, !llvm.loop !13

124:                                              ; preds = %121, %14, %5
  ret void
}

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !10}
