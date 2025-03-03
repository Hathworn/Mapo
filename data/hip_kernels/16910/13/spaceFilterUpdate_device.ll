; ModuleID = '../data/hip_kernels/16910/13/main.cu'
source_filename = "../data/hip_kernels/16910/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU = internal addrspace(3) global [96 x float] undef, align 16
@_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU = internal addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %14 = fptosi double %13 to i32
  %15 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !5, !amdgpu.noclobber !9
  %17 = fptosi double %16 to i32
  %18 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %19 = load double, double addrspace(1)* %18, align 8, !tbaa !5, !amdgpu.noclobber !9
  %20 = fptosi double %19 to i32
  %21 = freeze i32 %20
  %22 = getelementptr inbounds double, double addrspace(1)* %0, i64 10
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !5, !amdgpu.noclobber !9
  %24 = fptosi double %23 to i32
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !5, !amdgpu.noclobber !9
  %27 = fptosi double %26 to i32
  %28 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !5, !amdgpu.noclobber !9
  %30 = fptosi double %29 to i32
  %31 = icmp slt i32 %11, %24
  br i1 %31, label %32, label %43

32:                                               ; preds = %10
  %33 = sext i32 %12 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !10, !amdgpu.noclobber !9
  %36 = mul nsw i32 %35, %24
  %37 = add nsw i32 %36, %11
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !10, !amdgpu.noclobber !9
  %41 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %11
  %42 = addrspacecast i32 addrspace(3)* %41 to i32*
  store volatile i32 %40, i32* %42, align 4, !tbaa !10
  br label %43

43:                                               ; preds = %32, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = icmp sgt i32 %21, 0
  %45 = and i1 %31, %44
  br i1 %45, label %46, label %131

46:                                               ; preds = %43
  %47 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %11
  %48 = addrspacecast i32 addrspace(3)* %47 to i32*
  %49 = and i32 %21, 3
  %50 = icmp ult i32 %21, 4
  br i1 %50, label %110, label %51

51:                                               ; preds = %46
  %52 = and i32 %21, -4
  br label %53

53:                                               ; preds = %53, %51
  %54 = phi i32 [ 0, %51 ], [ %107, %53 ]
  %55 = phi i32 [ 0, %51 ], [ %108, %53 ]
  %56 = load volatile i32, i32* %48, align 4, !tbaa !10
  %57 = mul i32 %54, %17
  %58 = add i32 %57, %12
  %59 = mul i32 %58, %30
  %60 = add i32 %56, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !12, !amdgpu.noclobber !9
  %64 = mul nsw i32 %54, %24
  %65 = add nsw i32 %64, %11
  %66 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %65
  %67 = addrspacecast float addrspace(3)* %66 to float*
  store volatile float %63, float* %67, align 4, !tbaa !12
  %68 = or i32 %54, 1
  %69 = load volatile i32, i32* %48, align 4, !tbaa !10
  %70 = mul i32 %68, %17
  %71 = add i32 %70, %12
  %72 = mul i32 %71, %30
  %73 = add i32 %69, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !12, !amdgpu.noclobber !9
  %77 = mul nsw i32 %68, %24
  %78 = add nsw i32 %77, %11
  %79 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %78
  %80 = addrspacecast float addrspace(3)* %79 to float*
  store volatile float %76, float* %80, align 4, !tbaa !12
  %81 = or i32 %54, 2
  %82 = load volatile i32, i32* %48, align 4, !tbaa !10
  %83 = mul i32 %81, %17
  %84 = add i32 %83, %12
  %85 = mul i32 %84, %30
  %86 = add i32 %82, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !12, !amdgpu.noclobber !9
  %90 = mul nsw i32 %81, %24
  %91 = add nsw i32 %90, %11
  %92 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %91
  %93 = addrspacecast float addrspace(3)* %92 to float*
  store volatile float %89, float* %93, align 4, !tbaa !12
  %94 = or i32 %54, 3
  %95 = load volatile i32, i32* %48, align 4, !tbaa !10
  %96 = mul i32 %94, %17
  %97 = add i32 %96, %12
  %98 = mul i32 %97, %30
  %99 = add i32 %95, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !12, !amdgpu.noclobber !9
  %103 = mul nsw i32 %94, %24
  %104 = add nsw i32 %103, %11
  %105 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %104
  %106 = addrspacecast float addrspace(3)* %105 to float*
  store volatile float %102, float* %106, align 4, !tbaa !12
  %107 = add nuw nsw i32 %54, 4
  %108 = add i32 %55, 4
  %109 = icmp eq i32 %108, %52
  br i1 %109, label %110, label %53, !llvm.loop !14

110:                                              ; preds = %53, %46
  %111 = phi i32 [ 0, %46 ], [ %107, %53 ]
  %112 = icmp eq i32 %49, 0
  br i1 %112, label %131, label %113

113:                                              ; preds = %110, %113
  %114 = phi i32 [ %128, %113 ], [ %111, %110 ]
  %115 = phi i32 [ %129, %113 ], [ 0, %110 ]
  %116 = load volatile i32, i32* %48, align 4, !tbaa !10
  %117 = mul i32 %114, %17
  %118 = add i32 %117, %12
  %119 = mul i32 %118, %30
  %120 = add i32 %116, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !12, !amdgpu.noclobber !9
  %124 = mul nsw i32 %114, %24
  %125 = add nsw i32 %124, %11
  %126 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %125
  %127 = addrspacecast float addrspace(3)* %126 to float*
  store volatile float %123, float* %127, align 4, !tbaa !12
  %128 = add nuw nsw i32 %114, 1
  %129 = add i32 %115, 1
  %130 = icmp eq i32 %129, %49
  br i1 %130, label %131, label %113, !llvm.loop !16

131:                                              ; preds = %110, %113, %43
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %132 = bitcast i32 addrspace(1)* %9 to <2 x i32> addrspace(1)*
  %133 = load <2 x i32>, <2 x i32> addrspace(1)* %132, align 4, !tbaa !10
  %134 = extractelement <2 x i32> %133, i64 0
  %135 = extractelement <2 x i32> %133, i64 1
  %136 = icmp slt i32 %135, %134
  br i1 %136, label %137, label %332

137:                                              ; preds = %131
  %138 = mul nsw i32 %12, %17
  %139 = sub i32 %11, %27
  %140 = icmp slt i32 %21, 1
  %141 = icmp sgt i32 %24, 0
  %142 = and i32 %24, 7
  %143 = icmp ult i32 %24, 8
  %144 = and i32 %24, -8
  %145 = icmp eq i32 %142, 0
  br label %146

146:                                              ; preds = %137, %329
  %147 = phi i32 [ %135, %137 ], [ %330, %329 ]
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %148
  %150 = load i32, i32 addrspace(1)* %149, align 4, !tbaa !10, !amdgpu.noclobber !9
  %151 = add nsw i32 %150, %138
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %152
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !18, !range !20, !amdgpu.noclobber !9
  %155 = icmp eq i8 %154, 0
  br i1 %155, label %329, label %156

156:                                              ; preds = %146
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %148
  %158 = load i32, i32 addrspace(1)* %157, align 4, !tbaa !10, !amdgpu.noclobber !9
  %159 = add i32 %139, %158
  %160 = icmp slt i32 %159, 0
  %161 = icmp sge i32 %159, %14
  %162 = or i1 %160, %161
  %163 = or i1 %162, %140
  br i1 %163, label %329, label %164

164:                                              ; preds = %156, %319
  %165 = phi i32 [ %327, %319 ], [ 0, %156 ]
  br i1 %141, label %166, label %319

166:                                              ; preds = %164
  %167 = mul nsw i32 %165, %24
  br i1 %143, label %294, label %168

168:                                              ; preds = %166, %168
  %169 = phi float [ %290, %168 ], [ 0.000000e+00, %166 ]
  %170 = phi i32 [ %291, %168 ], [ 0, %166 ]
  %171 = phi i32 [ %292, %168 ], [ 0, %166 ]
  %172 = add nsw i32 %170, %167
  %173 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %172
  %174 = addrspacecast float addrspace(3)* %173 to float*
  %175 = load volatile float, float* %174, align 4, !tbaa !12
  %176 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %170
  %177 = addrspacecast i32 addrspace(3)* %176 to i32*
  %178 = load volatile i32, i32* %177, align 4, !tbaa !10
  %179 = mul nsw i32 %178, %14
  %180 = add nsw i32 %179, %159
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %1, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !12
  %184 = fmul contract float %175, %183
  %185 = fadd contract float %169, %184
  %186 = or i32 %170, 1
  %187 = add nsw i32 %186, %167
  %188 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %187
  %189 = addrspacecast float addrspace(3)* %188 to float*
  %190 = load volatile float, float* %189, align 4, !tbaa !12
  %191 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %186
  %192 = addrspacecast i32 addrspace(3)* %191 to i32*
  %193 = load volatile i32, i32* %192, align 4, !tbaa !10
  %194 = mul nsw i32 %193, %14
  %195 = add nsw i32 %194, %159
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %1, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !12
  %199 = fmul contract float %190, %198
  %200 = fadd contract float %185, %199
  %201 = or i32 %170, 2
  %202 = add nsw i32 %201, %167
  %203 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %202
  %204 = addrspacecast float addrspace(3)* %203 to float*
  %205 = load volatile float, float* %204, align 4, !tbaa !12
  %206 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %201
  %207 = addrspacecast i32 addrspace(3)* %206 to i32*
  %208 = load volatile i32, i32* %207, align 4, !tbaa !10
  %209 = mul nsw i32 %208, %14
  %210 = add nsw i32 %209, %159
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %1, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !12
  %214 = fmul contract float %205, %213
  %215 = fadd contract float %200, %214
  %216 = or i32 %170, 3
  %217 = add nsw i32 %216, %167
  %218 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %217
  %219 = addrspacecast float addrspace(3)* %218 to float*
  %220 = load volatile float, float* %219, align 4, !tbaa !12
  %221 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %216
  %222 = addrspacecast i32 addrspace(3)* %221 to i32*
  %223 = load volatile i32, i32* %222, align 4, !tbaa !10
  %224 = mul nsw i32 %223, %14
  %225 = add nsw i32 %224, %159
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds float, float addrspace(1)* %1, i64 %226
  %228 = load float, float addrspace(1)* %227, align 4, !tbaa !12
  %229 = fmul contract float %220, %228
  %230 = fadd contract float %215, %229
  %231 = or i32 %170, 4
  %232 = add nsw i32 %231, %167
  %233 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %232
  %234 = addrspacecast float addrspace(3)* %233 to float*
  %235 = load volatile float, float* %234, align 4, !tbaa !12
  %236 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %231
  %237 = addrspacecast i32 addrspace(3)* %236 to i32*
  %238 = load volatile i32, i32* %237, align 4, !tbaa !10
  %239 = mul nsw i32 %238, %14
  %240 = add nsw i32 %239, %159
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %1, i64 %241
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !12
  %244 = fmul contract float %235, %243
  %245 = fadd contract float %230, %244
  %246 = or i32 %170, 5
  %247 = add nsw i32 %246, %167
  %248 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %247
  %249 = addrspacecast float addrspace(3)* %248 to float*
  %250 = load volatile float, float* %249, align 4, !tbaa !12
  %251 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %246
  %252 = addrspacecast i32 addrspace(3)* %251 to i32*
  %253 = load volatile i32, i32* %252, align 4, !tbaa !10
  %254 = mul nsw i32 %253, %14
  %255 = add nsw i32 %254, %159
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %1, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !12
  %259 = fmul contract float %250, %258
  %260 = fadd contract float %245, %259
  %261 = or i32 %170, 6
  %262 = add nsw i32 %261, %167
  %263 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %262
  %264 = addrspacecast float addrspace(3)* %263 to float*
  %265 = load volatile float, float* %264, align 4, !tbaa !12
  %266 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %261
  %267 = addrspacecast i32 addrspace(3)* %266 to i32*
  %268 = load volatile i32, i32* %267, align 4, !tbaa !10
  %269 = mul nsw i32 %268, %14
  %270 = add nsw i32 %269, %159
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %1, i64 %271
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !12
  %274 = fmul contract float %265, %273
  %275 = fadd contract float %260, %274
  %276 = or i32 %170, 7
  %277 = add nsw i32 %276, %167
  %278 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %277
  %279 = addrspacecast float addrspace(3)* %278 to float*
  %280 = load volatile float, float* %279, align 4, !tbaa !12
  %281 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %276
  %282 = addrspacecast i32 addrspace(3)* %281 to i32*
  %283 = load volatile i32, i32* %282, align 4, !tbaa !10
  %284 = mul nsw i32 %283, %14
  %285 = add nsw i32 %284, %159
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %1, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !12
  %289 = fmul contract float %280, %288
  %290 = fadd contract float %275, %289
  %291 = add nuw nsw i32 %170, 8
  %292 = add i32 %171, 8
  %293 = icmp eq i32 %292, %144
  br i1 %293, label %294, label %168, !llvm.loop !21

294:                                              ; preds = %168, %166
  %295 = phi float [ undef, %166 ], [ %290, %168 ]
  %296 = phi float [ 0.000000e+00, %166 ], [ %290, %168 ]
  %297 = phi i32 [ 0, %166 ], [ %291, %168 ]
  br i1 %145, label %319, label %298

298:                                              ; preds = %294, %298
  %299 = phi float [ %315, %298 ], [ %296, %294 ]
  %300 = phi i32 [ %316, %298 ], [ %297, %294 ]
  %301 = phi i32 [ %317, %298 ], [ 0, %294 ]
  %302 = add nsw i32 %300, %167
  %303 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2sU, i32 0, i32 %302
  %304 = addrspacecast float addrspace(3)* %303 to float*
  %305 = load volatile float, float* %304, align 4, !tbaa !12
  %306 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17spaceFilterUpdatePKdPKfS2_PKbPKiS6_PfS6_S6_S6_E2iU, i32 0, i32 %300
  %307 = addrspacecast i32 addrspace(3)* %306 to i32*
  %308 = load volatile i32, i32* %307, align 4, !tbaa !10
  %309 = mul nsw i32 %308, %14
  %310 = add nsw i32 %309, %159
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds float, float addrspace(1)* %1, i64 %311
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !12
  %314 = fmul contract float %305, %313
  %315 = fadd contract float %299, %314
  %316 = add nuw nsw i32 %300, 1
  %317 = add i32 %301, 1
  %318 = icmp eq i32 %317, %142
  br i1 %318, label %319, label %298, !llvm.loop !22

319:                                              ; preds = %294, %298, %164
  %320 = phi float [ 0.000000e+00, %164 ], [ %295, %294 ], [ %315, %298 ]
  %321 = mul i32 %165, %17
  %322 = add i32 %321, %12
  %323 = mul i32 %322, %14
  %324 = add i32 %323, %159
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds float, float addrspace(1)* %6, i64 %325
  store float %320, float addrspace(1)* %326, align 4, !tbaa !12
  %327 = add nuw nsw i32 %165, 1
  %328 = icmp eq i32 %327, %21
  br i1 %328, label %329, label %164, !llvm.loop !23

329:                                              ; preds = %319, %156, %146
  %330 = add nsw i32 %147, 1
  %331 = icmp slt i32 %330, %134
  br i1 %331, label %146, label %332, !llvm.loop !24

332:                                              ; preds = %329, %131
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !7, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = !{!19, !19, i64 0}
!19 = !{!"bool", !7, i64 0}
!20 = !{i8 0, i8 2}
!21 = distinct !{!21, !15}
!22 = distinct !{!22, !17}
!23 = distinct !{!23, !15}
!24 = distinct !{!24, !15}
