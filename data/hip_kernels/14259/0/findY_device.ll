; ModuleID = '../data/hip_kernels/14259/0/main.cu'
source_filename = "../data/hip_kernels/14259/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5findYPfS_iffiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, float %3, float %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %9, label %43

9:                                                ; preds = %7
  %10 = and i32 %2, 7
  %11 = icmp ult i32 %2, 8
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  %13 = and i32 %2, -8
  br label %48

14:                                               ; preds = %169, %9
  %15 = phi float [ undef, %9 ], [ %170, %169 ]
  %16 = phi i32 [ undef, %9 ], [ %171, %169 ]
  %17 = phi i32 [ 0, %9 ], [ %172, %169 ]
  %18 = phi i32 [ 0, %9 ], [ %171, %169 ]
  %19 = phi float [ 0.000000e+00, %9 ], [ %170, %169 ]
  %20 = icmp eq i32 %10, 0
  br i1 %20, label %43, label %21

21:                                               ; preds = %14, %37
  %22 = phi i32 [ %40, %37 ], [ %17, %14 ]
  %23 = phi i32 [ %39, %37 ], [ %18, %14 ]
  %24 = phi float [ %38, %37 ], [ %19, %14 ]
  %25 = phi i32 [ %41, %37 ], [ 0, %14 ]
  %26 = zext i32 %22 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !4, !amdgpu.noclobber !8
  %29 = fsub contract float %28, %4
  %30 = tail call float @llvm.fabs.f32(float %29)
  %31 = fcmp contract olt float %30, %3
  br i1 %31, label %32, label %37

32:                                               ; preds = %21
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !4, !amdgpu.noclobber !8
  %35 = fadd contract float %34, %24
  %36 = add nsw i32 %23, 1
  br label %37

37:                                               ; preds = %32, %21
  %38 = phi float [ %35, %32 ], [ %24, %21 ]
  %39 = phi i32 [ %36, %32 ], [ %23, %21 ]
  %40 = add nuw nsw i32 %22, 1
  %41 = add i32 %25, 1
  %42 = icmp eq i32 %41, %10
  br i1 %42, label %43, label %21, !llvm.loop !9

43:                                               ; preds = %14, %37, %7
  %44 = phi float [ 0.000000e+00, %7 ], [ %15, %14 ], [ %38, %37 ]
  %45 = phi i32 [ 0, %7 ], [ %16, %14 ], [ %39, %37 ]
  %46 = sitofp i32 %45 to float
  %47 = fdiv contract float %44, %46
  store float %47, float addrspace(1)* %6, align 4, !tbaa !4
  ret void

48:                                               ; preds = %169, %12
  %49 = phi i32 [ 0, %12 ], [ %172, %169 ]
  %50 = phi i32 [ 0, %12 ], [ %171, %169 ]
  %51 = phi float [ 0.000000e+00, %12 ], [ %170, %169 ]
  %52 = phi i32 [ 0, %12 ], [ %173, %169 ]
  %53 = zext i32 %49 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !4, !amdgpu.noclobber !8
  %56 = fsub contract float %55, %4
  %57 = tail call float @llvm.fabs.f32(float %56)
  %58 = fcmp contract olt float %57, %3
  br i1 %58, label %59, label %64

59:                                               ; preds = %48
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !4, !amdgpu.noclobber !8
  %62 = fadd contract float %61, %51
  %63 = add nsw i32 %50, 1
  br label %64

64:                                               ; preds = %48, %59
  %65 = phi float [ %62, %59 ], [ %51, %48 ]
  %66 = phi i32 [ %63, %59 ], [ %50, %48 ]
  %67 = or i32 %49, 1
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !4, !amdgpu.noclobber !8
  %71 = fsub contract float %70, %4
  %72 = tail call float @llvm.fabs.f32(float %71)
  %73 = fcmp contract olt float %72, %3
  br i1 %73, label %74, label %79

74:                                               ; preds = %64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !4, !amdgpu.noclobber !8
  %77 = fadd contract float %76, %65
  %78 = add nsw i32 %66, 1
  br label %79

79:                                               ; preds = %74, %64
  %80 = phi float [ %77, %74 ], [ %65, %64 ]
  %81 = phi i32 [ %78, %74 ], [ %66, %64 ]
  %82 = or i32 %49, 2
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !4, !amdgpu.noclobber !8
  %86 = fsub contract float %85, %4
  %87 = tail call float @llvm.fabs.f32(float %86)
  %88 = fcmp contract olt float %87, %3
  br i1 %88, label %89, label %94

89:                                               ; preds = %79
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !4, !amdgpu.noclobber !8
  %92 = fadd contract float %91, %80
  %93 = add nsw i32 %81, 1
  br label %94

94:                                               ; preds = %89, %79
  %95 = phi float [ %92, %89 ], [ %80, %79 ]
  %96 = phi i32 [ %93, %89 ], [ %81, %79 ]
  %97 = or i32 %49, 3
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !4, !amdgpu.noclobber !8
  %101 = fsub contract float %100, %4
  %102 = tail call float @llvm.fabs.f32(float %101)
  %103 = fcmp contract olt float %102, %3
  br i1 %103, label %104, label %109

104:                                              ; preds = %94
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !4, !amdgpu.noclobber !8
  %107 = fadd contract float %106, %95
  %108 = add nsw i32 %96, 1
  br label %109

109:                                              ; preds = %104, %94
  %110 = phi float [ %107, %104 ], [ %95, %94 ]
  %111 = phi i32 [ %108, %104 ], [ %96, %94 ]
  %112 = or i32 %49, 4
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !4, !amdgpu.noclobber !8
  %116 = fsub contract float %115, %4
  %117 = tail call float @llvm.fabs.f32(float %116)
  %118 = fcmp contract olt float %117, %3
  br i1 %118, label %119, label %124

119:                                              ; preds = %109
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !4, !amdgpu.noclobber !8
  %122 = fadd contract float %121, %110
  %123 = add nsw i32 %111, 1
  br label %124

124:                                              ; preds = %119, %109
  %125 = phi float [ %122, %119 ], [ %110, %109 ]
  %126 = phi i32 [ %123, %119 ], [ %111, %109 ]
  %127 = or i32 %49, 5
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !4, !amdgpu.noclobber !8
  %131 = fsub contract float %130, %4
  %132 = tail call float @llvm.fabs.f32(float %131)
  %133 = fcmp contract olt float %132, %3
  br i1 %133, label %134, label %139

134:                                              ; preds = %124
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !4, !amdgpu.noclobber !8
  %137 = fadd contract float %136, %125
  %138 = add nsw i32 %126, 1
  br label %139

139:                                              ; preds = %134, %124
  %140 = phi float [ %137, %134 ], [ %125, %124 ]
  %141 = phi i32 [ %138, %134 ], [ %126, %124 ]
  %142 = or i32 %49, 6
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !4, !amdgpu.noclobber !8
  %146 = fsub contract float %145, %4
  %147 = tail call float @llvm.fabs.f32(float %146)
  %148 = fcmp contract olt float %147, %3
  br i1 %148, label %149, label %154

149:                                              ; preds = %139
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !4, !amdgpu.noclobber !8
  %152 = fadd contract float %151, %140
  %153 = add nsw i32 %141, 1
  br label %154

154:                                              ; preds = %149, %139
  %155 = phi float [ %152, %149 ], [ %140, %139 ]
  %156 = phi i32 [ %153, %149 ], [ %141, %139 ]
  %157 = or i32 %49, 7
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !4, !amdgpu.noclobber !8
  %161 = fsub contract float %160, %4
  %162 = tail call float @llvm.fabs.f32(float %161)
  %163 = fcmp contract olt float %162, %3
  br i1 %163, label %164, label %169

164:                                              ; preds = %154
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !4, !amdgpu.noclobber !8
  %167 = fadd contract float %166, %155
  %168 = add nsw i32 %156, 1
  br label %169

169:                                              ; preds = %164, %154
  %170 = phi float [ %167, %164 ], [ %155, %154 ]
  %171 = phi i32 [ %168, %164 ], [ %156, %154 ]
  %172 = add nuw nsw i32 %49, 8
  %173 = add i32 %52, 8
  %174 = icmp eq i32 %173, %13
  br i1 %174, label %14, label %48, !llvm.loop !11
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
