; ModuleID = '../data/hip_kernels/9206/12/main.cu'
source_filename = "../data/hip_kernels/9206/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13convolution2DPKfS0_Pfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = freeze i32 %5
  %7 = freeze i32 %3
  %8 = udiv i32 %6, %7
  %9 = mul i32 %8, %7
  %10 = sub i32 %6, %9
  %11 = mul nsw i32 %8, %3
  %12 = add nsw i32 %11, %10
  %13 = icmp slt i32 %8, %3
  %14 = icmp slt i32 %10, %3
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %137

16:                                               ; preds = %4
  %17 = add nsw i32 %8, -1
  %18 = add nsw i32 %10, -1
  %19 = icmp uge i32 %5, %3
  %20 = mul nsw i32 %17, %3
  %21 = icmp ne i32 %10, 0
  %22 = and i1 %21, %19
  br i1 %22, label %99, label %107

23:                                               ; preds = %132
  %24 = add nsw i32 %18, %11
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 3
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = fmul contract float %27, %29
  %31 = fadd contract float %133, %30
  br label %32

32:                                               ; preds = %132, %23
  %33 = phi float [ %31, %23 ], [ %133, %132 ]
  %34 = sext i32 %12 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 4
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = fmul contract float %36, %38
  %40 = fadd contract float %33, %39
  %41 = add nuw nsw i32 %10, 1
  %42 = icmp slt i32 %41, %3
  br i1 %42, label %43, label %52

43:                                               ; preds = %32
  %44 = add nsw i32 %41, %11
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 5
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = fmul contract float %47, %49
  %51 = fadd contract float %40, %50
  br label %52

52:                                               ; preds = %32, %43
  %53 = phi float [ %51, %43 ], [ %40, %32 ]
  %54 = add nuw nsw i32 %8, 1
  %55 = icmp slt i32 %54, %3
  %56 = mul nsw i32 %54, %3
  %57 = icmp ne i32 %10, 0
  %58 = select i1 %55, i1 %57, i1 false
  %59 = icmp sle i32 %10, %3
  %60 = select i1 %58, i1 %59, i1 false
  br i1 %60, label %61, label %70

61:                                               ; preds = %52
  %62 = add nsw i32 %18, %56
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 6
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = fmul contract float %65, %67
  %69 = fadd contract float %53, %68
  br label %70

70:                                               ; preds = %61, %52
  %71 = phi float [ %69, %61 ], [ %53, %52 ]
  br i1 %55, label %72, label %81

72:                                               ; preds = %70
  %73 = add nsw i32 %10, %56
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 7
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  %79 = fmul contract float %76, %78
  %80 = fadd contract float %71, %79
  br label %81

81:                                               ; preds = %72, %70
  %82 = phi float [ %80, %72 ], [ %71, %70 ]
  %83 = add nuw nsw i32 %10, 1
  %84 = icmp slt i32 %83, %3
  %85 = select i1 %55, i1 %84, i1 false
  br i1 %85, label %86, label %95

86:                                               ; preds = %81
  %87 = add nsw i32 %83, %56
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5, !amdgpu.noclobber !9
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 8
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = fmul contract float %90, %92
  %94 = fadd contract float %82, %93
  br label %95

95:                                               ; preds = %81, %86
  %96 = phi float [ %94, %86 ], [ %82, %81 ]
  %97 = sext i32 %12 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %97
  store float %96, float addrspace(1)* %98, align 4, !tbaa !5
  br label %137

99:                                               ; preds = %16
  %100 = add nsw i32 %18, %20
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = load float, float addrspace(1)* %1, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %105, 0.000000e+00
  br label %107

107:                                              ; preds = %16, %99
  %108 = phi float [ %106, %99 ], [ 0.000000e+00, %16 ]
  br i1 %19, label %109, label %118

109:                                              ; preds = %107
  %110 = add nsw i32 %10, %20
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5, !amdgpu.noclobber !9
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5, !amdgpu.noclobber !9
  %116 = fmul contract float %113, %115
  %117 = fadd contract float %108, %116
  br label %118

118:                                              ; preds = %109, %107
  %119 = phi float [ %117, %109 ], [ %108, %107 ]
  %120 = add nuw nsw i32 %10, 1
  %121 = icmp ult i32 %120, %3
  %122 = select i1 %19, i1 %121, i1 false
  br i1 %122, label %123, label %132

123:                                              ; preds = %118
  %124 = add nsw i32 %120, %20
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !5, !amdgpu.noclobber !9
  %130 = fmul contract float %127, %129
  %131 = fadd contract float %119, %130
  br label %132

132:                                              ; preds = %123, %118
  %133 = phi float [ %131, %123 ], [ %119, %118 ]
  %134 = icmp ne i32 %10, 0
  %135 = icmp sle i32 %10, %3
  %136 = and i1 %134, %135
  br i1 %136, label %23, label %32

137:                                              ; preds = %95, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!9 = !{}
