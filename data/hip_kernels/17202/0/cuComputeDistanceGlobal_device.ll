; ModuleID = '../data/hip_kernels/17202/0/main.cu'
source_filename = "../data/hip_kernels/17202/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ23cuComputeDistanceGlobalPfiS_iiS_E7begin_A = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ23cuComputeDistanceGlobalPfiS_iiS_E7begin_B = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ23cuComputeDistanceGlobalPfiS_iiS_E6step_A = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ23cuComputeDistanceGlobalPfiS_iiS_E6step_B = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ23cuComputeDistanceGlobalPfiS_iiS_E5end_A = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23cuComputeDistanceGlobalPfiS_iiS_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 4
  store i32 %10, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E7begin_A, align 4, !tbaa !5
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = shl i32 %11, 4
  store i32 %12, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E7begin_B, align 4, !tbaa !5
  %13 = shl nsw i32 %1, 4
  store i32 %13, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E6step_A, align 4, !tbaa !5
  %14 = shl nsw i32 %3, 4
  store i32 %14, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E6step_B, align 4, !tbaa !5
  %15 = add nsw i32 %4, -1
  %16 = mul nsw i32 %15, %1
  %17 = add nsw i32 %16, %10
  store i32 %17, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E5end_A, align 4, !tbaa !5
  %18 = add nsw i32 %10, %7
  %19 = icmp slt i32 %18, %1
  %20 = add nsw i32 %12, %7
  %21 = icmp slt i32 %20, %3
  %22 = add nsw i32 %10, %8
  %23 = icmp slt i32 %22, %1
  %24 = icmp slt i32 %16, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %6
  %26 = select i1 %23, i1 %21, i1 false
  br label %67

27:                                               ; preds = %6
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 %8, i32 %7
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 %8, i32 %7
  %30 = mul nsw i32 %8, %1
  %31 = add i32 %30, %7
  %32 = mul nsw i32 %8, %3
  %33 = add i32 %32, %7
  %34 = select i1 %23, i1 %21, i1 false
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 0, i32 %8
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 0, i32 %7
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 1, i32 %8
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 1, i32 %7
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 2, i32 %8
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 2, i32 %7
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 3, i32 %8
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 3, i32 %7
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 4, i32 %8
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 4, i32 %7
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 5, i32 %8
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 5, i32 %7
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 6, i32 %8
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 6, i32 %7
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 7, i32 %8
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 7, i32 %7
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 8, i32 %8
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 8, i32 %7
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 9, i32 %8
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 9, i32 %7
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 10, i32 %8
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 10, i32 %7
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 11, i32 %8
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 11, i32 %7
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 12, i32 %8
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 12, i32 %7
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 13, i32 %8
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 13, i32 %7
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 14, i32 %8
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 14, i32 %7
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_A, i32 0, i32 15, i32 %8
  %66 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E8shared_B, i32 0, i32 15, i32 %7
  br label %70

67:                                               ; preds = %174, %25
  %68 = phi i1 [ %26, %25 ], [ %34, %174 ]
  %69 = phi float [ 0.000000e+00, %25 ], [ %175, %174 ]
  br i1 %68, label %182, label %191

70:                                               ; preds = %27, %174
  %71 = phi i32 [ %12, %27 ], [ %179, %174 ]
  %72 = phi i32 [ %10, %27 ], [ %177, %174 ]
  %73 = phi float [ 0.000000e+00, %27 ], [ %175, %174 ]
  %74 = sdiv i32 %72, %1
  %75 = add nsw i32 %74, %8
  %76 = icmp slt i32 %75, %4
  br i1 %76, label %77, label %90

77:                                               ; preds = %70
  br i1 %19, label %78, label %83

78:                                               ; preds = %77
  %79 = add i32 %31, %72
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !9
  br label %83

83:                                               ; preds = %77, %78
  %84 = phi contract float [ %82, %78 ], [ 0.000000e+00, %77 ]
  store float %84, float addrspace(3)* %28, align 4, !tbaa !9
  br i1 %21, label %85, label %91

85:                                               ; preds = %83
  %86 = add i32 %33, %71
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !9
  br label %91

90:                                               ; preds = %70
  store float 0.000000e+00, float addrspace(3)* %28, align 4, !tbaa !9
  br label %91

91:                                               ; preds = %85, %83, %90
  %92 = phi float [ 0.000000e+00, %90 ], [ %89, %85 ], [ 0.000000e+00, %83 ]
  store float %92, float addrspace(3)* %29, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %93, label %174

93:                                               ; preds = %91
  %94 = load float, float addrspace(3)* %35, align 4, !tbaa !9
  %95 = load float, float addrspace(3)* %36, align 4, !tbaa !9
  %96 = fsub contract float %94, %95
  %97 = fmul contract float %96, %96
  %98 = fadd contract float %73, %97
  %99 = load float, float addrspace(3)* %37, align 4, !tbaa !9
  %100 = load float, float addrspace(3)* %38, align 4, !tbaa !9
  %101 = fsub contract float %99, %100
  %102 = fmul contract float %101, %101
  %103 = fadd contract float %98, %102
  %104 = load float, float addrspace(3)* %39, align 4, !tbaa !9
  %105 = load float, float addrspace(3)* %40, align 4, !tbaa !9
  %106 = fsub contract float %104, %105
  %107 = fmul contract float %106, %106
  %108 = fadd contract float %103, %107
  %109 = load float, float addrspace(3)* %41, align 4, !tbaa !9
  %110 = load float, float addrspace(3)* %42, align 4, !tbaa !9
  %111 = fsub contract float %109, %110
  %112 = fmul contract float %111, %111
  %113 = fadd contract float %108, %112
  %114 = load float, float addrspace(3)* %43, align 4, !tbaa !9
  %115 = load float, float addrspace(3)* %44, align 4, !tbaa !9
  %116 = fsub contract float %114, %115
  %117 = fmul contract float %116, %116
  %118 = fadd contract float %113, %117
  %119 = load float, float addrspace(3)* %45, align 4, !tbaa !9
  %120 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %121 = fsub contract float %119, %120
  %122 = fmul contract float %121, %121
  %123 = fadd contract float %118, %122
  %124 = load float, float addrspace(3)* %47, align 4, !tbaa !9
  %125 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %126 = fsub contract float %124, %125
  %127 = fmul contract float %126, %126
  %128 = fadd contract float %123, %127
  %129 = load float, float addrspace(3)* %49, align 4, !tbaa !9
  %130 = load float, float addrspace(3)* %50, align 4, !tbaa !9
  %131 = fsub contract float %129, %130
  %132 = fmul contract float %131, %131
  %133 = fadd contract float %128, %132
  %134 = load float, float addrspace(3)* %51, align 4, !tbaa !9
  %135 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %136 = fsub contract float %134, %135
  %137 = fmul contract float %136, %136
  %138 = fadd contract float %133, %137
  %139 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %140 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %141 = fsub contract float %139, %140
  %142 = fmul contract float %141, %141
  %143 = fadd contract float %138, %142
  %144 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %145 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %146 = fsub contract float %144, %145
  %147 = fmul contract float %146, %146
  %148 = fadd contract float %143, %147
  %149 = load float, float addrspace(3)* %57, align 4, !tbaa !9
  %150 = load float, float addrspace(3)* %58, align 4, !tbaa !9
  %151 = fsub contract float %149, %150
  %152 = fmul contract float %151, %151
  %153 = fadd contract float %148, %152
  %154 = load float, float addrspace(3)* %59, align 4, !tbaa !9
  %155 = load float, float addrspace(3)* %60, align 4, !tbaa !9
  %156 = fsub contract float %154, %155
  %157 = fmul contract float %156, %156
  %158 = fadd contract float %153, %157
  %159 = load float, float addrspace(3)* %61, align 4, !tbaa !9
  %160 = load float, float addrspace(3)* %62, align 4, !tbaa !9
  %161 = fsub contract float %159, %160
  %162 = fmul contract float %161, %161
  %163 = fadd contract float %158, %162
  %164 = load float, float addrspace(3)* %63, align 4, !tbaa !9
  %165 = load float, float addrspace(3)* %64, align 4, !tbaa !9
  %166 = fsub contract float %164, %165
  %167 = fmul contract float %166, %166
  %168 = fadd contract float %163, %167
  %169 = load float, float addrspace(3)* %65, align 4, !tbaa !9
  %170 = load float, float addrspace(3)* %66, align 4, !tbaa !9
  %171 = fsub contract float %169, %170
  %172 = fmul contract float %171, %171
  %173 = fadd contract float %168, %172
  br label %174

174:                                              ; preds = %93, %91
  %175 = phi float [ %73, %91 ], [ %173, %93 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %176 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E6step_A, align 4, !tbaa !5
  %177 = add nsw i32 %176, %72
  %178 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E6step_B, align 4, !tbaa !5
  %179 = add nsw i32 %178, %71
  %180 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E5end_A, align 4, !tbaa !5
  %181 = icmp sgt i32 %177, %180
  br i1 %181, label %67, label %70, !llvm.loop !11

182:                                              ; preds = %67
  %183 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E7begin_A, align 4, !tbaa !5
  %184 = add nsw i32 %183, %8
  %185 = mul nsw i32 %184, %3
  %186 = load i32, i32 addrspace(3)* @_ZZ23cuComputeDistanceGlobalPfiS_iiS_E7begin_B, align 4, !tbaa !5
  %187 = add i32 %186, %7
  %188 = add i32 %187, %185
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %5, i64 %189
  store float %69, float addrspace(1)* %190, align 4, !tbaa !9
  br label %191

191:                                              ; preds = %182, %67
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
