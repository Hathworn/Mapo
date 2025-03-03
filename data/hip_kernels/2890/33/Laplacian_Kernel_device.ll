; ModuleID = '../data/hip_kernels/2890/33/main.cu'
source_filename = "../data/hip_kernels/2890/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16Laplacian_KernelPfPKfiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %132

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %2
  %28 = add nsw i32 %27, %14
  %29 = icmp sgt i32 %4, 0
  br i1 %29, label %30, label %132

30:                                               ; preds = %26
  %31 = icmp eq i32 %14, 0
  %32 = add nsw i32 %2, -1
  %33 = icmp eq i32 %14, %32
  %34 = add nsw i32 %28, 1
  %35 = mul nsw i32 %34, %4
  %36 = add nsw i32 %28, -1
  %37 = mul nsw i32 %36, %4
  %38 = mul nsw i32 %28, %4
  %39 = icmp eq i32 %22, 0
  %40 = add nsw i32 %3, -1
  %41 = icmp eq i32 %22, %40
  %42 = add nsw i32 %28, %2
  %43 = mul nsw i32 %42, %4
  %44 = sub nsw i32 %28, %2
  %45 = mul nsw i32 %44, %4
  br label %46

46:                                               ; preds = %30, %125
  %47 = phi i32 [ 0, %30 ], [ %130, %125 ]
  br i1 %31, label %48, label %58

48:                                               ; preds = %46
  %49 = add nsw i32 %47, %35
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = add nsw i32 %47, %38
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = fsub contract float %52, %56
  br label %85

58:                                               ; preds = %46
  br i1 %33, label %59, label %69

59:                                               ; preds = %58
  %60 = add nsw i32 %47, %37
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = add nsw i32 %47, %38
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = fsub contract float %63, %67
  br label %85

69:                                               ; preds = %58
  %70 = add nsw i32 %47, %35
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = add nsw i32 %47, %37
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = fadd contract float %73, %77
  %79 = add nsw i32 %47, %38
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fmul contract float %82, 2.000000e+00
  %84 = fsub contract float %78, %83
  br label %85

85:                                               ; preds = %59, %69, %48
  %86 = phi float [ %57, %48 ], [ %68, %59 ], [ %84, %69 ]
  %87 = fadd contract float %86, 0.000000e+00
  br i1 %39, label %88, label %98

88:                                               ; preds = %85
  %89 = add nsw i32 %47, %43
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = add nsw i32 %47, %38
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fsub contract float %92, %96
  br label %125

98:                                               ; preds = %85
  br i1 %41, label %99, label %109

99:                                               ; preds = %98
  %100 = add nsw i32 %47, %45
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = add nsw i32 %47, %38
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = fsub contract float %103, %107
  br label %125

109:                                              ; preds = %98
  %110 = add nsw i32 %47, %43
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = add nsw i32 %47, %45
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fadd contract float %113, %117
  %119 = add nsw i32 %47, %38
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fmul contract float %122, 2.000000e+00
  %124 = fsub contract float %118, %123
  br label %125

125:                                              ; preds = %99, %109, %88
  %126 = phi i64 [ %105, %99 ], [ %120, %109 ], [ %94, %88 ]
  %127 = phi float [ %108, %99 ], [ %124, %109 ], [ %97, %88 ]
  %128 = fadd contract float %87, %127
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  store float %128, float addrspace(1)* %129, align 4, !tbaa !7
  %130 = add nuw nsw i32 %47, 1
  %131 = icmp eq i32 %130, %4
  br i1 %131, label %132, label %46, !llvm.loop !11

132:                                              ; preds = %125, %26, %5
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
