; ModuleID = '../data/hip_kernels/7136/8/main.cu'
source_filename = "../data/hip_kernels/7136/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17convolutionRowGPUPfS_S_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %14, %5
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %23, %5
  %25 = add i32 %24, %22
  %26 = shl i32 %5, 1
  %27 = add nsw i32 %26, %3
  %28 = icmp slt i32 %5, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %6
  %30 = mul nsw i32 %16, %27
  %31 = add nsw i32 %30, %25
  br label %149

32:                                               ; preds = %6
  %33 = sub nsw i32 0, %5
  %34 = mul nsw i32 %16, %27
  %35 = add i32 %34, %25
  %36 = add nuw nsw i32 %26, 1
  %37 = and i32 %36, 7
  br label %38

38:                                               ; preds = %38, %32
  %39 = phi i32 [ %33, %32 ], [ %52, %38 ]
  %40 = phi float [ 0.000000e+00, %32 ], [ %51, %38 ]
  %41 = phi i32 [ 0, %32 ], [ %53, %38 ]
  %42 = add i32 %35, %39
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = sub nsw i32 %5, %39
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = fmul contract float %45, %49
  %51 = fadd contract float %40, %50
  %52 = add i32 %39, 1
  %53 = add i32 %41, 1
  %54 = icmp eq i32 %53, %37
  br i1 %54, label %55, label %38, !llvm.loop !11

55:                                               ; preds = %38
  %56 = icmp ult i32 %26, 7
  br i1 %56, label %149, label %57

57:                                               ; preds = %55, %57
  %58 = phi i32 [ %147, %57 ], [ %52, %55 ]
  %59 = phi float [ %146, %57 ], [ %51, %55 ]
  %60 = add i32 %35, %58
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = sub nsw i32 %5, %58
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fmul contract float %63, %67
  %69 = fadd contract float %59, %68
  %70 = add i32 %58, 1
  %71 = add i32 %35, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = sub nsw i32 %5, %70
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fmul contract float %74, %78
  %80 = fadd contract float %69, %79
  %81 = add i32 %58, 2
  %82 = add i32 %35, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = sub nsw i32 %5, %81
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fmul contract float %85, %89
  %91 = fadd contract float %80, %90
  %92 = add i32 %58, 3
  %93 = add i32 %35, %92
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = sub nsw i32 %5, %92
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = fmul contract float %96, %100
  %102 = fadd contract float %91, %101
  %103 = add i32 %58, 4
  %104 = add i32 %35, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = sub nsw i32 %5, %103
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = fmul contract float %107, %111
  %113 = fadd contract float %102, %112
  %114 = add i32 %58, 5
  %115 = add i32 %35, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = sub nsw i32 %5, %114
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = fmul contract float %118, %122
  %124 = fadd contract float %113, %123
  %125 = add i32 %58, 6
  %126 = add i32 %35, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = sub nsw i32 %5, %125
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %2, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = fmul contract float %129, %133
  %135 = fadd contract float %124, %134
  %136 = add i32 %58, 7
  %137 = add i32 %35, %136
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = sub nsw i32 %5, %136
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = fmul contract float %140, %144
  %146 = fadd contract float %135, %145
  %147 = add i32 %58, 8
  %148 = icmp eq i32 %136, %5
  br i1 %148, label %149, label %57, !llvm.loop !13

149:                                              ; preds = %55, %57, %29
  %150 = phi i32 [ %31, %29 ], [ %35, %57 ], [ %35, %55 ]
  %151 = phi float [ 0.000000e+00, %29 ], [ %51, %55 ], [ %146, %57 ]
  %152 = sext i32 %150 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  store float %151, float addrspace(1)* %153, align 4, !tbaa !7
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
