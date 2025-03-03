; ModuleID = '../data/hip_kernels/7581/4/main.cu'
source_filename = "../data/hip_kernels/7581/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14matMulKernel25PfS_S_iE5Mds25 = internal unnamed_addr addrspace(3) global [25 x [25 x float]] undef, align 16
@_ZZ14matMulKernel25PfS_S_iE5Nds25 = internal unnamed_addr addrspace(3) global [25 x [25 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14matMulKernel25PfS_S_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = mul nsw i32 %6, 25
  %10 = add nsw i32 %9, %8
  %11 = mul nsw i32 %5, 25
  %12 = add nsw i32 %11, %7
  %13 = sdiv i32 %3, 25
  %14 = icmp sgt i32 %3, 24
  %15 = mul nsw i32 %10, %3
  br i1 %14, label %16, label %70

16:                                               ; preds = %4
  %17 = add i32 %15, %7
  %18 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 %7
  %19 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 %8, i32 %7
  %20 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 0
  %21 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 0, i32 %7
  %22 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 1
  %23 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 1, i32 %7
  %24 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 2
  %25 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 2, i32 %7
  %26 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 3
  %27 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 3, i32 %7
  %28 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 4
  %29 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 4, i32 %7
  %30 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 5
  %31 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 5, i32 %7
  %32 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 6
  %33 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 6, i32 %7
  %34 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 7
  %35 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 7, i32 %7
  %36 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 8
  %37 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 8, i32 %7
  %38 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 9
  %39 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 9, i32 %7
  %40 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 10
  %41 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 10, i32 %7
  %42 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 11
  %43 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 11, i32 %7
  %44 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 12
  %45 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 12, i32 %7
  %46 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 13
  %47 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 13, i32 %7
  %48 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 14
  %49 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 14, i32 %7
  %50 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 15
  %51 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 15, i32 %7
  %52 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 16
  %53 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 16, i32 %7
  %54 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 17
  %55 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 17, i32 %7
  %56 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 18
  %57 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 18, i32 %7
  %58 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 19
  %59 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 19, i32 %7
  %60 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 20
  %61 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 20, i32 %7
  %62 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 21
  %63 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 21, i32 %7
  %64 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 22
  %65 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 22, i32 %7
  %66 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 23
  %67 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 23, i32 %7
  %68 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Mds25, i32 0, i32 %8, i32 24
  %69 = getelementptr inbounds [25 x [25 x float]], [25 x [25 x float]] addrspace(3)* @_ZZ14matMulKernel25PfS_S_iE5Nds25, i32 0, i32 24, i32 %7
  br label %75

70:                                               ; preds = %75, %4
  %71 = phi float [ 0.000000e+00, %4 ], [ %188, %75 ]
  %72 = add nsw i32 %15, %12
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  store float %71, float addrspace(1)* %74, align 4, !tbaa !5
  ret void

75:                                               ; preds = %16, %75
  %76 = phi i32 [ 0, %16 ], [ %189, %75 ]
  %77 = phi float [ 0.000000e+00, %16 ], [ %188, %75 ]
  %78 = mul nuw nsw i32 %76, 25
  %79 = add i32 %17, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %82, float addrspace(3)* %18, align 4, !tbaa !5
  %83 = add nuw nsw i32 %78, %8
  %84 = mul nsw i32 %83, %3
  %85 = add nsw i32 %84, %12
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %88, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %90 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %91 = fmul contract float %89, %90
  %92 = fadd contract float %77, %91
  %93 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %94 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %95 = fmul contract float %93, %94
  %96 = fadd contract float %92, %95
  %97 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %98 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %99 = fmul contract float %97, %98
  %100 = fadd contract float %96, %99
  %101 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %102 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %100, %103
  %105 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %106 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %107 = fmul contract float %105, %106
  %108 = fadd contract float %104, %107
  %109 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %110 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %111 = fmul contract float %109, %110
  %112 = fadd contract float %108, %111
  %113 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %114 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %115 = fmul contract float %113, %114
  %116 = fadd contract float %112, %115
  %117 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %118 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %116, %119
  %121 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %122 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %123 = fmul contract float %121, %122
  %124 = fadd contract float %120, %123
  %125 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %126 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %127 = fmul contract float %125, %126
  %128 = fadd contract float %124, %127
  %129 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %130 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %128, %131
  %133 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %134 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %135 = fmul contract float %133, %134
  %136 = fadd contract float %132, %135
  %137 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %138 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %139 = fmul contract float %137, %138
  %140 = fadd contract float %136, %139
  %141 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %142 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %143 = fmul contract float %141, %142
  %144 = fadd contract float %140, %143
  %145 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %146 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %147 = fmul contract float %145, %146
  %148 = fadd contract float %144, %147
  %149 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %150 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %151 = fmul contract float %149, %150
  %152 = fadd contract float %148, %151
  %153 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %154 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %155 = fmul contract float %153, %154
  %156 = fadd contract float %152, %155
  %157 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %158 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %159 = fmul contract float %157, %158
  %160 = fadd contract float %156, %159
  %161 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %162 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %163 = fmul contract float %161, %162
  %164 = fadd contract float %160, %163
  %165 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %166 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %167 = fmul contract float %165, %166
  %168 = fadd contract float %164, %167
  %169 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %170 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %171 = fmul contract float %169, %170
  %172 = fadd contract float %168, %171
  %173 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %174 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %175 = fmul contract float %173, %174
  %176 = fadd contract float %172, %175
  %177 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %178 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %179 = fmul contract float %177, %178
  %180 = fadd contract float %176, %179
  %181 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %182 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %183 = fmul contract float %181, %182
  %184 = fadd contract float %180, %183
  %185 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %186 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %187 = fmul contract float %185, %186
  %188 = fadd contract float %184, %187
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %189 = add nuw nsw i32 %76, 1
  %190 = icmp eq i32 %189, %13
  br i1 %190, label %70, label %75, !llvm.loop !10
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
