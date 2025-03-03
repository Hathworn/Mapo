; ModuleID = '../data/hip_kernels/151/5/main.cu'
source_filename = "../data/hip_kernels/151/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E7begin_A = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E7begin_B = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E6step_A = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E6step_B = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E5end_A = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23cuComputeDistanceGlobalPfiiS_iiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = shl i32 %11, 4
  store i32 %12, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E7begin_A, align 4, !tbaa !5
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = shl i32 %13, 4
  store i32 %14, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E7begin_B, align 4, !tbaa !5
  %15 = shl nsw i32 %2, 4
  store i32 %15, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E6step_A, align 4, !tbaa !5
  %16 = shl nsw i32 %5, 4
  store i32 %16, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E6step_B, align 4, !tbaa !5
  %17 = add nsw i32 %6, -1
  %18 = mul nsw i32 %17, %2
  %19 = add nsw i32 %18, %12
  store i32 %19, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E5end_A, align 4, !tbaa !5
  %20 = add nsw i32 %12, %9
  %21 = icmp slt i32 %20, %1
  %22 = add nsw i32 %14, %9
  %23 = icmp slt i32 %22, %4
  %24 = add nsw i32 %12, %10
  %25 = icmp slt i32 %24, %1
  %26 = icmp slt i32 %18, 0
  br i1 %26, label %27, label %29

27:                                               ; preds = %8
  %28 = select i1 %25, i1 %23, i1 false
  br label %69

29:                                               ; preds = %8
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 %10, i32 %9
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 %10, i32 %9
  %32 = mul nsw i32 %10, %2
  %33 = add i32 %32, %9
  %34 = mul nsw i32 %10, %5
  %35 = add i32 %34, %9
  %36 = select i1 %25, i1 %23, i1 false
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 0, i32 %10
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 0, i32 %9
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 1, i32 %10
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 1, i32 %9
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 2, i32 %10
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 2, i32 %9
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 3, i32 %10
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 3, i32 %9
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 4, i32 %10
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 4, i32 %9
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 5, i32 %10
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 5, i32 %9
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 6, i32 %10
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 6, i32 %9
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 7, i32 %10
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 7, i32 %9
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 8, i32 %10
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 8, i32 %9
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 9, i32 %10
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 9, i32 %9
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 10, i32 %10
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 10, i32 %9
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 11, i32 %10
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 11, i32 %9
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 12, i32 %10
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 12, i32 %9
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 13, i32 %10
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 13, i32 %9
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 14, i32 %10
  %66 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 14, i32 %9
  %67 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_A, i32 0, i32 15, i32 %10
  %68 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E8shared_B, i32 0, i32 15, i32 %9
  br label %72

69:                                               ; preds = %176, %27
  %70 = phi i1 [ %28, %27 ], [ %36, %176 ]
  %71 = phi float [ 0.000000e+00, %27 ], [ %177, %176 ]
  br i1 %70, label %184, label %193

72:                                               ; preds = %29, %176
  %73 = phi i32 [ %14, %29 ], [ %181, %176 ]
  %74 = phi i32 [ %12, %29 ], [ %179, %176 ]
  %75 = phi float [ 0.000000e+00, %29 ], [ %177, %176 ]
  %76 = sdiv i32 %74, %2
  %77 = add nsw i32 %76, %10
  %78 = icmp slt i32 %77, %6
  br i1 %78, label %79, label %92

79:                                               ; preds = %72
  br i1 %21, label %80, label %85

80:                                               ; preds = %79
  %81 = add i32 %33, %74
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !9
  br label %85

85:                                               ; preds = %79, %80
  %86 = phi contract float [ %84, %80 ], [ 0.000000e+00, %79 ]
  store float %86, float addrspace(3)* %30, align 4, !tbaa !9
  br i1 %23, label %87, label %93

87:                                               ; preds = %85
  %88 = add i32 %35, %73
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %3, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !9
  br label %93

92:                                               ; preds = %72
  store float 0.000000e+00, float addrspace(3)* %30, align 4, !tbaa !9
  br label %93

93:                                               ; preds = %87, %85, %92
  %94 = phi float [ 0.000000e+00, %92 ], [ %91, %87 ], [ 0.000000e+00, %85 ]
  store float %94, float addrspace(3)* %31, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %36, label %95, label %176

95:                                               ; preds = %93
  %96 = load float, float addrspace(3)* %37, align 4, !tbaa !9
  %97 = load float, float addrspace(3)* %38, align 4, !tbaa !9
  %98 = fsub contract float %96, %97
  %99 = fmul contract float %98, %98
  %100 = fadd contract float %75, %99
  %101 = load float, float addrspace(3)* %39, align 4, !tbaa !9
  %102 = load float, float addrspace(3)* %40, align 4, !tbaa !9
  %103 = fsub contract float %101, %102
  %104 = fmul contract float %103, %103
  %105 = fadd contract float %100, %104
  %106 = load float, float addrspace(3)* %41, align 4, !tbaa !9
  %107 = load float, float addrspace(3)* %42, align 4, !tbaa !9
  %108 = fsub contract float %106, %107
  %109 = fmul contract float %108, %108
  %110 = fadd contract float %105, %109
  %111 = load float, float addrspace(3)* %43, align 4, !tbaa !9
  %112 = load float, float addrspace(3)* %44, align 4, !tbaa !9
  %113 = fsub contract float %111, %112
  %114 = fmul contract float %113, %113
  %115 = fadd contract float %110, %114
  %116 = load float, float addrspace(3)* %45, align 4, !tbaa !9
  %117 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %118 = fsub contract float %116, %117
  %119 = fmul contract float %118, %118
  %120 = fadd contract float %115, %119
  %121 = load float, float addrspace(3)* %47, align 4, !tbaa !9
  %122 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %123 = fsub contract float %121, %122
  %124 = fmul contract float %123, %123
  %125 = fadd contract float %120, %124
  %126 = load float, float addrspace(3)* %49, align 4, !tbaa !9
  %127 = load float, float addrspace(3)* %50, align 4, !tbaa !9
  %128 = fsub contract float %126, %127
  %129 = fmul contract float %128, %128
  %130 = fadd contract float %125, %129
  %131 = load float, float addrspace(3)* %51, align 4, !tbaa !9
  %132 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %133 = fsub contract float %131, %132
  %134 = fmul contract float %133, %133
  %135 = fadd contract float %130, %134
  %136 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %137 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %138 = fsub contract float %136, %137
  %139 = fmul contract float %138, %138
  %140 = fadd contract float %135, %139
  %141 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %142 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %143 = fsub contract float %141, %142
  %144 = fmul contract float %143, %143
  %145 = fadd contract float %140, %144
  %146 = load float, float addrspace(3)* %57, align 4, !tbaa !9
  %147 = load float, float addrspace(3)* %58, align 4, !tbaa !9
  %148 = fsub contract float %146, %147
  %149 = fmul contract float %148, %148
  %150 = fadd contract float %145, %149
  %151 = load float, float addrspace(3)* %59, align 4, !tbaa !9
  %152 = load float, float addrspace(3)* %60, align 4, !tbaa !9
  %153 = fsub contract float %151, %152
  %154 = fmul contract float %153, %153
  %155 = fadd contract float %150, %154
  %156 = load float, float addrspace(3)* %61, align 4, !tbaa !9
  %157 = load float, float addrspace(3)* %62, align 4, !tbaa !9
  %158 = fsub contract float %156, %157
  %159 = fmul contract float %158, %158
  %160 = fadd contract float %155, %159
  %161 = load float, float addrspace(3)* %63, align 4, !tbaa !9
  %162 = load float, float addrspace(3)* %64, align 4, !tbaa !9
  %163 = fsub contract float %161, %162
  %164 = fmul contract float %163, %163
  %165 = fadd contract float %160, %164
  %166 = load float, float addrspace(3)* %65, align 4, !tbaa !9
  %167 = load float, float addrspace(3)* %66, align 4, !tbaa !9
  %168 = fsub contract float %166, %167
  %169 = fmul contract float %168, %168
  %170 = fadd contract float %165, %169
  %171 = load float, float addrspace(3)* %67, align 4, !tbaa !9
  %172 = load float, float addrspace(3)* %68, align 4, !tbaa !9
  %173 = fsub contract float %171, %172
  %174 = fmul contract float %173, %173
  %175 = fadd contract float %170, %174
  br label %176

176:                                              ; preds = %95, %93
  %177 = phi float [ %75, %93 ], [ %175, %95 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %178 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E6step_A, align 4, !tbaa !5
  %179 = add nsw i32 %178, %74
  %180 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E6step_B, align 4, !tbaa !5
  %181 = add nsw i32 %180, %73
  %182 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E5end_A, align 4, !tbaa !5
  %183 = icmp sgt i32 %179, %182
  br i1 %183, label %69, label %72, !llvm.loop !11

184:                                              ; preds = %69
  %185 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E7begin_A, align 4, !tbaa !5
  %186 = add nsw i32 %185, %10
  %187 = mul nsw i32 %186, %5
  %188 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiiS_iiiS_E7begin_B, align 4, !tbaa !5
  %189 = add i32 %188, %9
  %190 = add i32 %189, %187
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %7, i64 %191
  store float %71, float addrspace(1)* %192, align 4, !tbaa !9
  br label %193

193:                                              ; preds = %184, %69
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
