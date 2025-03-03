; ModuleID = '../data/hip_kernels/553/21/main.cu'
source_filename = "../data/hip_kernels/553/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20CalculateTransSamplePKfPfiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = mul nsw i32 %16, %6
  %26 = mul nsw i32 %24, %6
  %27 = icmp slt i32 %16, %5
  %28 = icmp slt i32 %24, %4
  %29 = select i1 %27, i1 %28, i1 false
  %30 = icmp sgt i32 %6, 0
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %120

32:                                               ; preds = %7
  %33 = mul nsw i32 %16, %4
  %34 = add nsw i32 %33, %24
  %35 = mul nsw i32 %34, 3
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = add nsw i32 %35, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = add nsw i32 %35, 2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = and i32 %6, 1
  %45 = icmp eq i32 %6, 1
  %46 = and i32 %6, -2
  %47 = icmp eq i32 %44, 0
  br label %48

48:                                               ; preds = %32, %74
  %49 = phi i32 [ 0, %32 ], [ %75, %74 ]
  %50 = add nsw i32 %49, %25
  %51 = icmp slt i32 %50, %3
  %52 = mul nsw i32 %50, %2
  br i1 %45, label %53, label %77

53:                                               ; preds = %116, %48
  %54 = phi i32 [ 0, %48 ], [ %117, %116 ]
  %55 = xor i1 %51, true
  %56 = select i1 %47, i1 true, i1 %55
  br i1 %56, label %74, label %57

57:                                               ; preds = %53
  %58 = add nsw i32 %54, %26
  %59 = icmp slt i32 %58, %2
  br i1 %59, label %60, label %74

60:                                               ; preds = %57
  %61 = add nsw i32 %58, %52
  %62 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %63 = mul nsw i32 %61, 3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  store float %62, float addrspace(1)* %65, align 4, !tbaa !7
  %66 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %67 = add nsw i32 %63, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  store float %66, float addrspace(1)* %69, align 4, !tbaa !7
  %70 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %71 = add nsw i32 %63, 2
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  store float %70, float addrspace(1)* %73, align 4, !tbaa !7
  br label %74

74:                                               ; preds = %53, %57, %60
  %75 = add nuw nsw i32 %49, 1
  %76 = icmp eq i32 %75, %6
  br i1 %76, label %120, label %48, !llvm.loop !11

77:                                               ; preds = %48, %116
  %78 = phi i32 [ %117, %116 ], [ 0, %48 ]
  %79 = phi i32 [ %118, %116 ], [ 0, %48 ]
  br i1 %51, label %80, label %116

80:                                               ; preds = %77
  %81 = add nsw i32 %78, %26
  %82 = icmp slt i32 %81, %2
  br i1 %82, label %83, label %97

83:                                               ; preds = %80
  %84 = add nsw i32 %81, %52
  %85 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %86 = mul nsw i32 %84, 3
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  store float %85, float addrspace(1)* %88, align 4, !tbaa !7
  %89 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %90 = add nsw i32 %86, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  store float %89, float addrspace(1)* %92, align 4, !tbaa !7
  %93 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %94 = add nsw i32 %86, 2
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  store float %93, float addrspace(1)* %96, align 4, !tbaa !7
  br label %97

97:                                               ; preds = %80, %83
  br i1 %51, label %98, label %116

98:                                               ; preds = %97
  %99 = or i32 %78, 1
  %100 = add nsw i32 %99, %26
  %101 = icmp slt i32 %100, %2
  br i1 %101, label %102, label %116

102:                                              ; preds = %98
  %103 = add nsw i32 %100, %52
  %104 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %105 = mul nsw i32 %103, 3
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  store float %104, float addrspace(1)* %107, align 4, !tbaa !7
  %108 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %109 = add nsw i32 %105, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  store float %108, float addrspace(1)* %111, align 4, !tbaa !7
  %112 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %113 = add nsw i32 %105, 2
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  store float %112, float addrspace(1)* %115, align 4, !tbaa !7
  br label %116

116:                                              ; preds = %77, %102, %98, %97
  %117 = add nuw nsw i32 %78, 2
  %118 = add i32 %79, 2
  %119 = icmp eq i32 %118, %46
  br i1 %119, label %53, label %77, !llvm.loop !13

120:                                              ; preds = %74, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
