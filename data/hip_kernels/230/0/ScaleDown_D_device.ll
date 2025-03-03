; ModuleID = '../data/hip_kernels/230/0/main.cu'
source_filename = "../data/hip_kernels/230/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_Threshold = protected local_unnamed_addr addrspace(4) externally_initialized global [2 x float] zeroinitializer, align 4
@d_Scales = protected local_unnamed_addr addrspace(4) externally_initialized global [8 x float] zeroinitializer, align 16
@d_Factor = protected local_unnamed_addr addrspace(4) externally_initialized global float 0.000000e+00, align 4
@d_EdgeLimit = protected local_unnamed_addr addrspace(4) externally_initialized global float 0.000000e+00, align 4
@d_MaxNumPoints = protected local_unnamed_addr addrspace(4) externally_initialized global i32 0, align 4
@d_PointCounter = protected local_unnamed_addr addrspace(1) externally_initialized global [1 x i32] zeroinitializer, align 4
@d_Kernel1 = protected addrspace(4) externally_initialized global [5 x float] zeroinitializer, align 16
@d_Kernel2 = protected local_unnamed_addr addrspace(4) externally_initialized global [192 x float] zeroinitializer, align 16
@_ZZ11ScaleDown_DPfS_iiiiE5inrow = internal unnamed_addr addrspace(3) global [164 x float] undef, align 16
@_ZZ11ScaleDown_DPfS_iiiiE4brow = internal unnamed_addr addrspace(3) global [400 x float] undef, align 16
@_ZZ11ScaleDown_DPfS_iiiiE5yRead = internal unnamed_addr addrspace(3) global [20 x i32] undef, align 16
@_ZZ11ScaleDown_DPfS_iiiiE6yWrite = internal unnamed_addr addrspace(3) global [20 x i32] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([5 x float] addrspace(4)* @d_Kernel1 to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11ScaleDown_DPfS_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add nuw nsw i32 %7, 80
  %9 = add nuw nsw i32 %7, 160
  %10 = add nuw nsw i32 %7, 240
  %11 = add nuw nsw i32 %7, 320
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, 160
  %14 = ashr exact i32 %13, 1
  %15 = add nsw i32 %14, %7
  %16 = add nsw i32 %13, %7
  %17 = tail call i32 @llvm.smax.i32(i32 %16, i32 2)
  %18 = add nsw i32 %17, -2
  %19 = icmp slt i32 %18, %2
  %20 = add nsw i32 %2, -1
  %21 = select i1 %19, i32 %18, i32 %20
  %22 = icmp ult i32 %7, 20
  br i1 %22, label %23, label %36

23:                                               ; preds = %6
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = shl i32 %24, 4
  %26 = add nsw i32 %25, %7
  %27 = tail call i32 @llvm.smax.i32(i32 %26, i32 1)
  %28 = tail call i32 @llvm.smin.i32(i32 %27, i32 %4)
  %29 = add nsw i32 %28, -1
  %30 = mul nsw i32 %29, %3
  %31 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 %7
  store i32 %30, i32 addrspace(3)* %31, align 4, !tbaa !5
  %32 = add nsw i32 %26, -4
  %33 = sdiv i32 %32, 2
  %34 = mul nsw i32 %33, %5
  %35 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE6yWrite, i32 0, i32 %7
  store i32 %34, i32 addrspace(3)* %35, align 4, !tbaa !5
  br label %36

36:                                               ; preds = %23, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = getelementptr inbounds [164 x float], [164 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5inrow, i32 0, i32 %7
  %38 = icmp ult i32 %7, 80
  %39 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @d_Kernel1, i64 0, i64 0), align 16
  %40 = shl nuw nsw i32 %7, 1
  %41 = getelementptr inbounds [164 x float], [164 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5inrow, i32 0, i32 %40
  %42 = add nuw nsw i32 %40, 4
  %43 = getelementptr inbounds [164 x float], [164 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5inrow, i32 0, i32 %42
  %44 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @d_Kernel1, i64 0, i64 1), align 4
  %45 = add nuw nsw i32 %40, 1
  %46 = getelementptr inbounds [164 x float], [164 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5inrow, i32 0, i32 %45
  %47 = add nuw nsw i32 %40, 3
  %48 = getelementptr inbounds [164 x float], [164 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5inrow, i32 0, i32 %47
  %49 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @d_Kernel1, i64 0, i64 2), align 8
  %50 = add nuw nsw i32 %40, 2
  %51 = getelementptr inbounds [164 x float], [164 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5inrow, i32 0, i32 %50
  %52 = getelementptr inbounds [400 x float], [400 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE4brow, i32 0, i32 %7
  %53 = getelementptr inbounds [400 x float], [400 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE4brow, i32 0, i32 %9
  %54 = getelementptr inbounds [400 x float], [400 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE4brow, i32 0, i32 %11
  %55 = getelementptr inbounds [400 x float], [400 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE4brow, i32 0, i32 %8
  %56 = getelementptr inbounds [400 x float], [400 x float] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE4brow, i32 0, i32 %10
  %57 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 0), align 16, !tbaa !5
  %58 = add nsw i32 %57, %21
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !9
  store float %61, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %62, label %75

62:                                               ; preds = %36
  %63 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %64 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %65 = fadd contract float %63, %64
  %66 = fmul contract float %39, %65
  %67 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %68 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %69 = fadd contract float %67, %68
  %70 = fmul contract float %44, %69
  %71 = fadd contract float %66, %70
  %72 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %73 = fmul contract float %49, %72
  %74 = fadd contract float %71, %73
  store float %74, float addrspace(3)* %52, align 4, !tbaa !9
  br label %75

75:                                               ; preds = %62, %36
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 1), align 4, !tbaa !5
  %77 = add nsw i32 %76, %21
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !9
  store float %80, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %81, label %94

81:                                               ; preds = %75
  %82 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %83 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %84 = fadd contract float %82, %83
  %85 = fmul contract float %39, %84
  %86 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %87 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %88 = fadd contract float %86, %87
  %89 = fmul contract float %44, %88
  %90 = fadd contract float %85, %89
  %91 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %92 = fmul contract float %49, %91
  %93 = fadd contract float %90, %92
  store float %93, float addrspace(3)* %55, align 4, !tbaa !9
  br label %94

94:                                               ; preds = %81, %75
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 2), align 8, !tbaa !5
  %96 = add nsw i32 %95, %21
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !9
  store float %99, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %100, label %113

100:                                              ; preds = %94
  %101 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %102 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %103 = fadd contract float %101, %102
  %104 = fmul contract float %39, %103
  %105 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %106 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %107 = fadd contract float %105, %106
  %108 = fmul contract float %44, %107
  %109 = fadd contract float %104, %108
  %110 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %111 = fmul contract float %49, %110
  %112 = fadd contract float %109, %111
  store float %112, float addrspace(3)* %53, align 4, !tbaa !9
  br label %113

113:                                              ; preds = %100, %94
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 3), align 4, !tbaa !5
  %115 = add nsw i32 %114, %21
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !9
  store float %118, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %119, label %132

119:                                              ; preds = %113
  %120 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %121 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %122 = fadd contract float %120, %121
  %123 = fmul contract float %39, %122
  %124 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %125 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %126 = fadd contract float %124, %125
  %127 = fmul contract float %44, %126
  %128 = fadd contract float %123, %127
  %129 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %130 = fmul contract float %49, %129
  %131 = fadd contract float %128, %130
  store float %131, float addrspace(3)* %56, align 4, !tbaa !9
  br label %132

132:                                              ; preds = %119, %113
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %133 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 4), align 16, !tbaa !5
  %134 = add nsw i32 %133, %21
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !9
  store float %137, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %138, label %151

138:                                              ; preds = %132
  %139 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %140 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %141 = fadd contract float %139, %140
  %142 = fmul contract float %39, %141
  %143 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %144 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %145 = fadd contract float %143, %144
  %146 = fmul contract float %44, %145
  %147 = fadd contract float %142, %146
  %148 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %149 = fmul contract float %49, %148
  %150 = fadd contract float %147, %149
  store float %150, float addrspace(3)* %54, align 4, !tbaa !9
  br label %151

151:                                              ; preds = %138, %132
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %152, label %169

152:                                              ; preds = %151
  %153 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %154 = fmul contract float %49, %153
  %155 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %156 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %157 = fadd contract float %155, %156
  %158 = fmul contract float %39, %157
  %159 = fadd contract float %154, %158
  %160 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %161 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %162 = fadd contract float %160, %161
  %163 = fmul contract float %44, %162
  %164 = fadd contract float %159, %163
  %165 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE6yWrite, i32 0, i32 4), align 16, !tbaa !5
  %166 = add nsw i32 %165, %15
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  store float %164, float addrspace(1)* %168, align 4, !tbaa !9
  br label %169

169:                                              ; preds = %151, %152
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %170 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 5), align 4, !tbaa !5
  %171 = add nsw i32 %170, %21
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !9
  store float %174, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %175, label %188

175:                                              ; preds = %169
  %176 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %177 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %178 = fadd contract float %176, %177
  %179 = fmul contract float %39, %178
  %180 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %181 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %182 = fadd contract float %180, %181
  %183 = fmul contract float %44, %182
  %184 = fadd contract float %179, %183
  %185 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %186 = fmul contract float %49, %185
  %187 = fadd contract float %184, %186
  store float %187, float addrspace(3)* %52, align 4, !tbaa !9
  br label %188

188:                                              ; preds = %175, %169
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %189 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 6), align 8, !tbaa !5
  %190 = add nsw i32 %189, %21
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %1, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !9
  store float %193, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %194, label %207

194:                                              ; preds = %188
  %195 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %196 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %197 = fadd contract float %195, %196
  %198 = fmul contract float %39, %197
  %199 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %200 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %201 = fadd contract float %199, %200
  %202 = fmul contract float %44, %201
  %203 = fadd contract float %198, %202
  %204 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %205 = fmul contract float %49, %204
  %206 = fadd contract float %203, %205
  store float %206, float addrspace(3)* %55, align 4, !tbaa !9
  br label %207

207:                                              ; preds = %194, %188
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %208, label %225

208:                                              ; preds = %207
  %209 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %210 = fmul contract float %49, %209
  %211 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %212 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %213 = fadd contract float %211, %212
  %214 = fmul contract float %39, %213
  %215 = fadd contract float %210, %214
  %216 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %217 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %218 = fadd contract float %216, %217
  %219 = fmul contract float %44, %218
  %220 = fadd contract float %215, %219
  %221 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE6yWrite, i32 0, i32 6), align 8, !tbaa !5
  %222 = add nsw i32 %221, %15
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %0, i64 %223
  store float %220, float addrspace(1)* %224, align 4, !tbaa !9
  br label %225

225:                                              ; preds = %207, %208
  %226 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 7), align 4, !tbaa !5
  %227 = add nsw i32 %226, %21
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %1, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !9
  store float %230, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %231, label %244

231:                                              ; preds = %225
  %232 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %233 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %234 = fadd contract float %232, %233
  %235 = fmul contract float %39, %234
  %236 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %237 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %238 = fadd contract float %236, %237
  %239 = fmul contract float %44, %238
  %240 = fadd contract float %235, %239
  %241 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %242 = fmul contract float %49, %241
  %243 = fadd contract float %240, %242
  store float %243, float addrspace(3)* %53, align 4, !tbaa !9
  br label %244

244:                                              ; preds = %231, %225
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %245 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 8), align 16, !tbaa !5
  %246 = add nsw i32 %245, %21
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds float, float addrspace(1)* %1, i64 %247
  %249 = load float, float addrspace(1)* %248, align 4, !tbaa !9
  store float %249, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %250, label %263

250:                                              ; preds = %244
  %251 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %252 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %253 = fadd contract float %251, %252
  %254 = fmul contract float %39, %253
  %255 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %256 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %257 = fadd contract float %255, %256
  %258 = fmul contract float %44, %257
  %259 = fadd contract float %254, %258
  %260 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %261 = fmul contract float %49, %260
  %262 = fadd contract float %259, %261
  store float %262, float addrspace(3)* %56, align 4, !tbaa !9
  br label %263

263:                                              ; preds = %250, %244
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %264, label %281

264:                                              ; preds = %263
  %265 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %266 = fmul contract float %49, %265
  %267 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %268 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %269 = fadd contract float %267, %268
  %270 = fmul contract float %39, %269
  %271 = fadd contract float %266, %270
  %272 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %273 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %274 = fadd contract float %272, %273
  %275 = fmul contract float %44, %274
  %276 = fadd contract float %271, %275
  %277 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE6yWrite, i32 0, i32 8), align 16, !tbaa !5
  %278 = add nsw i32 %277, %15
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds float, float addrspace(1)* %0, i64 %279
  store float %276, float addrspace(1)* %280, align 4, !tbaa !9
  br label %281

281:                                              ; preds = %263, %264
  %282 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 9), align 4, !tbaa !5
  %283 = add nsw i32 %282, %21
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds float, float addrspace(1)* %1, i64 %284
  %286 = load float, float addrspace(1)* %285, align 4, !tbaa !9
  store float %286, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %287, label %300

287:                                              ; preds = %281
  %288 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %289 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %290 = fadd contract float %288, %289
  %291 = fmul contract float %39, %290
  %292 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %293 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %294 = fadd contract float %292, %293
  %295 = fmul contract float %44, %294
  %296 = fadd contract float %291, %295
  %297 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %298 = fmul contract float %49, %297
  %299 = fadd contract float %296, %298
  store float %299, float addrspace(3)* %54, align 4, !tbaa !9
  br label %300

300:                                              ; preds = %287, %281
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %301 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 10), align 8, !tbaa !5
  %302 = add nsw i32 %301, %21
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %1, i64 %303
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !9
  store float %305, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %306, label %319

306:                                              ; preds = %300
  %307 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %308 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %309 = fadd contract float %307, %308
  %310 = fmul contract float %39, %309
  %311 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %312 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %313 = fadd contract float %311, %312
  %314 = fmul contract float %44, %313
  %315 = fadd contract float %310, %314
  %316 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %317 = fmul contract float %49, %316
  %318 = fadd contract float %315, %317
  store float %318, float addrspace(3)* %52, align 4, !tbaa !9
  br label %319

319:                                              ; preds = %306, %300
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %320, label %337

320:                                              ; preds = %319
  %321 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %322 = fmul contract float %49, %321
  %323 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %324 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %325 = fadd contract float %323, %324
  %326 = fmul contract float %39, %325
  %327 = fadd contract float %322, %326
  %328 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %329 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %330 = fadd contract float %328, %329
  %331 = fmul contract float %44, %330
  %332 = fadd contract float %327, %331
  %333 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE6yWrite, i32 0, i32 10), align 8, !tbaa !5
  %334 = add nsw i32 %333, %15
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(1)* %0, i64 %335
  store float %332, float addrspace(1)* %336, align 4, !tbaa !9
  br label %337

337:                                              ; preds = %319, %320
  %338 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 11), align 4, !tbaa !5
  %339 = add nsw i32 %338, %21
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds float, float addrspace(1)* %1, i64 %340
  %342 = load float, float addrspace(1)* %341, align 4, !tbaa !9
  store float %342, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %343, label %356

343:                                              ; preds = %337
  %344 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %345 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %346 = fadd contract float %344, %345
  %347 = fmul contract float %39, %346
  %348 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %349 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %350 = fadd contract float %348, %349
  %351 = fmul contract float %44, %350
  %352 = fadd contract float %347, %351
  %353 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %354 = fmul contract float %49, %353
  %355 = fadd contract float %352, %354
  store float %355, float addrspace(3)* %55, align 4, !tbaa !9
  br label %356

356:                                              ; preds = %343, %337
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %357 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 12), align 16, !tbaa !5
  %358 = add nsw i32 %357, %21
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds float, float addrspace(1)* %1, i64 %359
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !9
  store float %361, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %362, label %375

362:                                              ; preds = %356
  %363 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %364 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %365 = fadd contract float %363, %364
  %366 = fmul contract float %39, %365
  %367 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %368 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %369 = fadd contract float %367, %368
  %370 = fmul contract float %44, %369
  %371 = fadd contract float %366, %370
  %372 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %373 = fmul contract float %49, %372
  %374 = fadd contract float %371, %373
  store float %374, float addrspace(3)* %53, align 4, !tbaa !9
  br label %375

375:                                              ; preds = %362, %356
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %376, label %393

376:                                              ; preds = %375
  %377 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %378 = fmul contract float %49, %377
  %379 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %380 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %381 = fadd contract float %379, %380
  %382 = fmul contract float %39, %381
  %383 = fadd contract float %378, %382
  %384 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %385 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %386 = fadd contract float %384, %385
  %387 = fmul contract float %44, %386
  %388 = fadd contract float %383, %387
  %389 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE6yWrite, i32 0, i32 12), align 16, !tbaa !5
  %390 = add nsw i32 %389, %15
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %0, i64 %391
  store float %388, float addrspace(1)* %392, align 4, !tbaa !9
  br label %393

393:                                              ; preds = %375, %376
  %394 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 13), align 4, !tbaa !5
  %395 = add nsw i32 %394, %21
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds float, float addrspace(1)* %1, i64 %396
  %398 = load float, float addrspace(1)* %397, align 4, !tbaa !9
  store float %398, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %399, label %412

399:                                              ; preds = %393
  %400 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %401 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %402 = fadd contract float %400, %401
  %403 = fmul contract float %39, %402
  %404 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %405 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %406 = fadd contract float %404, %405
  %407 = fmul contract float %44, %406
  %408 = fadd contract float %403, %407
  %409 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %410 = fmul contract float %49, %409
  %411 = fadd contract float %408, %410
  store float %411, float addrspace(3)* %56, align 4, !tbaa !9
  br label %412

412:                                              ; preds = %399, %393
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %413 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 14), align 8, !tbaa !5
  %414 = add nsw i32 %413, %21
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %1, i64 %415
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !9
  store float %417, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %418, label %431

418:                                              ; preds = %412
  %419 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %420 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %421 = fadd contract float %419, %420
  %422 = fmul contract float %39, %421
  %423 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %424 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %425 = fadd contract float %423, %424
  %426 = fmul contract float %44, %425
  %427 = fadd contract float %422, %426
  %428 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %429 = fmul contract float %49, %428
  %430 = fadd contract float %427, %429
  store float %430, float addrspace(3)* %54, align 4, !tbaa !9
  br label %431

431:                                              ; preds = %418, %412
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %432, label %449

432:                                              ; preds = %431
  %433 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %434 = fmul contract float %49, %433
  %435 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %436 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %437 = fadd contract float %435, %436
  %438 = fmul contract float %39, %437
  %439 = fadd contract float %434, %438
  %440 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %441 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %442 = fadd contract float %440, %441
  %443 = fmul contract float %44, %442
  %444 = fadd contract float %439, %443
  %445 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE6yWrite, i32 0, i32 14), align 8, !tbaa !5
  %446 = add nsw i32 %445, %15
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds float, float addrspace(1)* %0, i64 %447
  store float %444, float addrspace(1)* %448, align 4, !tbaa !9
  br label %449

449:                                              ; preds = %432, %431
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %450 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 15), align 4, !tbaa !5
  %451 = add nsw i32 %450, %21
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds float, float addrspace(1)* %1, i64 %452
  %454 = load float, float addrspace(1)* %453, align 4, !tbaa !9
  store float %454, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %455, label %468

455:                                              ; preds = %449
  %456 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %457 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %458 = fadd contract float %456, %457
  %459 = fmul contract float %39, %458
  %460 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %461 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %462 = fadd contract float %460, %461
  %463 = fmul contract float %44, %462
  %464 = fadd contract float %459, %463
  %465 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %466 = fmul contract float %49, %465
  %467 = fadd contract float %464, %466
  store float %467, float addrspace(3)* %52, align 4, !tbaa !9
  br label %468

468:                                              ; preds = %455, %449
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %469 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 16), align 16, !tbaa !5
  %470 = add nsw i32 %469, %21
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds float, float addrspace(1)* %1, i64 %471
  %473 = load float, float addrspace(1)* %472, align 4, !tbaa !9
  store float %473, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %474, label %487

474:                                              ; preds = %468
  %475 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %476 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %477 = fadd contract float %475, %476
  %478 = fmul contract float %39, %477
  %479 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %480 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %481 = fadd contract float %479, %480
  %482 = fmul contract float %44, %481
  %483 = fadd contract float %478, %482
  %484 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %485 = fmul contract float %49, %484
  %486 = fadd contract float %483, %485
  store float %486, float addrspace(3)* %55, align 4, !tbaa !9
  br label %487

487:                                              ; preds = %474, %468
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %488, label %505

488:                                              ; preds = %487
  %489 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %490 = fmul contract float %49, %489
  %491 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %492 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %493 = fadd contract float %491, %492
  %494 = fmul contract float %39, %493
  %495 = fadd contract float %490, %494
  %496 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %497 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %498 = fadd contract float %496, %497
  %499 = fmul contract float %44, %498
  %500 = fadd contract float %495, %499
  %501 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE6yWrite, i32 0, i32 16), align 16, !tbaa !5
  %502 = add nsw i32 %501, %15
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds float, float addrspace(1)* %0, i64 %503
  store float %500, float addrspace(1)* %504, align 4, !tbaa !9
  br label %505

505:                                              ; preds = %487, %488
  %506 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 17), align 4, !tbaa !5
  %507 = add nsw i32 %506, %21
  %508 = sext i32 %507 to i64
  %509 = getelementptr inbounds float, float addrspace(1)* %1, i64 %508
  %510 = load float, float addrspace(1)* %509, align 4, !tbaa !9
  store float %510, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %511, label %524

511:                                              ; preds = %505
  %512 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %513 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %514 = fadd contract float %512, %513
  %515 = fmul contract float %39, %514
  %516 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %517 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %518 = fadd contract float %516, %517
  %519 = fmul contract float %44, %518
  %520 = fadd contract float %515, %519
  %521 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %522 = fmul contract float %49, %521
  %523 = fadd contract float %520, %522
  store float %523, float addrspace(3)* %53, align 4, !tbaa !9
  br label %524

524:                                              ; preds = %511, %505
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %525 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 18), align 8, !tbaa !5
  %526 = add nsw i32 %525, %21
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds float, float addrspace(1)* %1, i64 %527
  %529 = load float, float addrspace(1)* %528, align 4, !tbaa !9
  store float %529, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %530, label %543

530:                                              ; preds = %524
  %531 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %532 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %533 = fadd contract float %531, %532
  %534 = fmul contract float %39, %533
  %535 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %536 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %537 = fadd contract float %535, %536
  %538 = fmul contract float %44, %537
  %539 = fadd contract float %534, %538
  %540 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %541 = fmul contract float %49, %540
  %542 = fadd contract float %539, %541
  store float %542, float addrspace(3)* %56, align 4, !tbaa !9
  br label %543

543:                                              ; preds = %530, %524
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %544, label %561

544:                                              ; preds = %543
  %545 = load float, float addrspace(3)* %52, align 4, !tbaa !9
  %546 = fmul contract float %49, %545
  %547 = load float, float addrspace(3)* %56, align 4, !tbaa !9
  %548 = load float, float addrspace(3)* %53, align 4, !tbaa !9
  %549 = fadd contract float %547, %548
  %550 = fmul contract float %39, %549
  %551 = fadd contract float %546, %550
  %552 = load float, float addrspace(3)* %54, align 4, !tbaa !9
  %553 = load float, float addrspace(3)* %55, align 4, !tbaa !9
  %554 = fadd contract float %552, %553
  %555 = fmul contract float %44, %554
  %556 = fadd contract float %551, %555
  %557 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE6yWrite, i32 0, i32 18), align 8, !tbaa !5
  %558 = add nsw i32 %557, %15
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds float, float addrspace(1)* %0, i64 %559
  store float %556, float addrspace(1)* %560, align 4, !tbaa !9
  br label %561

561:                                              ; preds = %543, %544
  %562 = load i32, i32 addrspace(3)* getelementptr inbounds ([20 x i32], [20 x i32] addrspace(3)* @_ZZ11ScaleDown_DPfS_iiiiE5yRead, i32 0, i32 19), align 4, !tbaa !5
  %563 = add nsw i32 %562, %21
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds float, float addrspace(1)* %1, i64 %564
  %566 = load float, float addrspace(1)* %565, align 4, !tbaa !9
  store float %566, float addrspace(3)* %37, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %567, label %580

567:                                              ; preds = %561
  %568 = load float, float addrspace(3)* %41, align 8, !tbaa !9
  %569 = load float, float addrspace(3)* %43, align 8, !tbaa !9
  %570 = fadd contract float %568, %569
  %571 = fmul contract float %39, %570
  %572 = load float, float addrspace(3)* %46, align 4, !tbaa !9
  %573 = load float, float addrspace(3)* %48, align 4, !tbaa !9
  %574 = fadd contract float %572, %573
  %575 = fmul contract float %44, %574
  %576 = fadd contract float %571, %575
  %577 = load float, float addrspace(3)* %51, align 8, !tbaa !9
  %578 = fmul contract float %49, %577
  %579 = fadd contract float %576, %578
  store float %579, float addrspace(3)* %54, align 4, !tbaa !9
  br label %580

580:                                              ; preds = %567, %561
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
