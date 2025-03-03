; ModuleID = '../data/hip_kernels/2107/3/main.cu'
source_filename = "../data/hip_kernels/2107/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32SolveSmoothGaussianGlobalKernel5PfS_S_S_iiiS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8, float addrspace(1)* nocapture writeonly %9, float addrspace(1)* nocapture writeonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %21
  %29 = mul nsw i32 %28, %6
  %30 = add nsw i32 %29, %20
  %31 = icmp slt i32 %20, %4
  %32 = icmp slt i32 %28, %5
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %512

34:                                               ; preds = %11
  %35 = add nsw i32 %28, -2
  %36 = icmp sgt i32 %28, 1
  %37 = icmp slt i32 %35, %5
  %38 = mul nsw i32 %35, %6
  %39 = add nsw i32 %20, -2
  %40 = icmp sgt i32 %20, 1
  br i1 %40, label %41, label %56

41:                                               ; preds = %34
  %42 = icmp slt i32 %39, %4
  %43 = select i1 %42, i1 %36, i1 false
  %44 = select i1 %43, i1 %37, i1 false
  br i1 %44, label %45, label %56

45:                                               ; preds = %41
  %46 = add nsw i32 %39, %38
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = fmul contract float %49, 0x3F6E4F7660000000
  %51 = fadd contract float %50, 0.000000e+00
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = fmul contract float %53, 0x3F6E4F7660000000
  %55 = fadd contract float %54, 0.000000e+00
  br label %56

56:                                               ; preds = %45, %41, %34
  %57 = phi float [ %55, %45 ], [ 0.000000e+00, %41 ], [ 0.000000e+00, %34 ]
  %58 = phi float [ %51, %45 ], [ 0.000000e+00, %41 ], [ 0.000000e+00, %34 ]
  %59 = add nsw i32 %20, -1
  %60 = icmp sgt i32 %20, 0
  br i1 %60, label %61, label %76

61:                                               ; preds = %56
  %62 = icmp sle i32 %20, %4
  %63 = select i1 %62, i1 %36, i1 false
  %64 = select i1 %63, i1 %37, i1 false
  br i1 %64, label %65, label %76

65:                                               ; preds = %61
  %66 = add nsw i32 %59, %38
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = fmul contract float %69, 0x3F8E1B08A0000000
  %71 = fadd contract float %58, %70
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  %74 = fmul contract float %73, 0x3F8E1B08A0000000
  %75 = fadd contract float %57, %74
  br label %76

76:                                               ; preds = %65, %61, %56
  %77 = phi float [ %75, %65 ], [ %57, %61 ], [ %57, %56 ]
  %78 = phi float [ %71, %65 ], [ %58, %61 ], [ %58, %56 ]
  %79 = icmp sgt i32 %20, -1
  %80 = select i1 %79, i1 %36, i1 false
  %81 = select i1 %80, i1 %37, i1 false
  br i1 %81, label %82, label %93

82:                                               ; preds = %76
  %83 = add nsw i32 %20, %38
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = fmul contract float %86, 0x3F9A36E2E0000000
  %88 = fadd contract float %78, %87
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !6
  %91 = fmul contract float %90, 0x3F9A36E2E0000000
  %92 = fadd contract float %77, %91
  br label %93

93:                                               ; preds = %82, %76
  %94 = phi float [ %92, %82 ], [ %77, %76 ]
  %95 = phi float [ %88, %82 ], [ %78, %76 ]
  %96 = add nsw i32 %20, 1
  %97 = icmp sgt i32 %20, -2
  br i1 %97, label %98, label %113

98:                                               ; preds = %93
  %99 = icmp slt i32 %96, %4
  %100 = select i1 %99, i1 %36, i1 false
  %101 = select i1 %100, i1 %37, i1 false
  br i1 %101, label %102, label %113

102:                                              ; preds = %98
  %103 = add nsw i32 %96, %38
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = fmul contract float %106, 0x3F8E1B08A0000000
  %108 = fadd contract float %95, %107
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !6
  %111 = fmul contract float %110, 0x3F8E1B08A0000000
  %112 = fadd contract float %94, %111
  br label %113

113:                                              ; preds = %102, %98, %93
  %114 = phi float [ %112, %102 ], [ %94, %98 ], [ %94, %93 ]
  %115 = phi float [ %108, %102 ], [ %95, %98 ], [ %95, %93 ]
  %116 = add nsw i32 %20, 2
  %117 = icmp sgt i32 %20, -3
  br i1 %117, label %118, label %133

118:                                              ; preds = %113
  %119 = icmp slt i32 %116, %4
  %120 = select i1 %119, i1 %36, i1 false
  %121 = select i1 %120, i1 %37, i1 false
  br i1 %121, label %122, label %133

122:                                              ; preds = %118
  %123 = add nsw i32 %116, %38
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = fmul contract float %126, 0x3F6E4F7660000000
  %128 = fadd contract float %115, %127
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !6
  %131 = fmul contract float %130, 0x3F6E4F7660000000
  %132 = fadd contract float %114, %131
  br label %133

133:                                              ; preds = %122, %118, %113
  %134 = phi float [ %132, %122 ], [ %114, %118 ], [ %114, %113 ]
  %135 = phi float [ %128, %122 ], [ %115, %118 ], [ %115, %113 ]
  %136 = add nsw i32 %28, -1
  %137 = icmp sgt i32 %28, 0
  %138 = icmp sle i32 %28, %5
  %139 = mul nsw i32 %136, %6
  br i1 %40, label %140, label %155

140:                                              ; preds = %133
  %141 = icmp slt i32 %39, %4
  %142 = select i1 %141, i1 %137, i1 false
  %143 = select i1 %142, i1 %138, i1 false
  br i1 %143, label %144, label %155

144:                                              ; preds = %140
  %145 = add nsw i32 %39, %139
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !6
  %149 = fmul contract float %148, 0x3F8E1B08A0000000
  %150 = fadd contract float %135, %149
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !6
  %153 = fmul contract float %152, 0x3F8E1B08A0000000
  %154 = fadd contract float %134, %153
  br label %155

155:                                              ; preds = %144, %140, %133
  %156 = phi float [ %154, %144 ], [ %134, %140 ], [ %134, %133 ]
  %157 = phi float [ %150, %144 ], [ %135, %140 ], [ %135, %133 ]
  br i1 %60, label %158, label %173

158:                                              ; preds = %155
  %159 = icmp sle i32 %20, %4
  %160 = select i1 %159, i1 %137, i1 false
  %161 = select i1 %160, i1 %138, i1 false
  br i1 %161, label %162, label %173

162:                                              ; preds = %158
  %163 = add nsw i32 %59, %139
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !6
  %167 = fmul contract float %166, 0x3FAE00D1C0000000
  %168 = fadd contract float %157, %167
  %169 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7, !amdgpu.noclobber !6
  %171 = fmul contract float %170, 0x3FAE00D1C0000000
  %172 = fadd contract float %156, %171
  br label %173

173:                                              ; preds = %162, %158, %155
  %174 = phi float [ %172, %162 ], [ %156, %158 ], [ %156, %155 ]
  %175 = phi float [ %168, %162 ], [ %157, %158 ], [ %157, %155 ]
  %176 = select i1 %79, i1 %137, i1 false
  %177 = select i1 %176, i1 %138, i1 false
  br i1 %177, label %178, label %189

178:                                              ; preds = %173
  %179 = add nsw i32 %20, %139
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7, !amdgpu.noclobber !6
  %183 = fmul contract float %182, 0x3FB85F0700000000
  %184 = fadd contract float %175, %183
  %185 = getelementptr inbounds float, float addrspace(1)* %1, i64 %180
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !7, !amdgpu.noclobber !6
  %187 = fmul contract float %186, 0x3FB85F0700000000
  %188 = fadd contract float %174, %187
  br label %189

189:                                              ; preds = %178, %173
  %190 = phi float [ %188, %178 ], [ %174, %173 ]
  %191 = phi float [ %184, %178 ], [ %175, %173 ]
  br i1 %97, label %192, label %207

192:                                              ; preds = %189
  %193 = icmp slt i32 %96, %4
  %194 = select i1 %193, i1 %137, i1 false
  %195 = select i1 %194, i1 %138, i1 false
  br i1 %195, label %196, label %207

196:                                              ; preds = %192
  %197 = add nsw i32 %96, %139
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !7, !amdgpu.noclobber !6
  %201 = fmul contract float %200, 0x3FAE00D1C0000000
  %202 = fadd contract float %191, %201
  %203 = getelementptr inbounds float, float addrspace(1)* %1, i64 %198
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !7, !amdgpu.noclobber !6
  %205 = fmul contract float %204, 0x3FAE00D1C0000000
  %206 = fadd contract float %190, %205
  br label %207

207:                                              ; preds = %196, %192, %189
  %208 = phi float [ %206, %196 ], [ %190, %192 ], [ %190, %189 ]
  %209 = phi float [ %202, %196 ], [ %191, %192 ], [ %191, %189 ]
  br i1 %117, label %210, label %225

210:                                              ; preds = %207
  %211 = icmp slt i32 %116, %4
  %212 = select i1 %211, i1 %137, i1 false
  %213 = select i1 %212, i1 %138, i1 false
  br i1 %213, label %214, label %225

214:                                              ; preds = %210
  %215 = add nsw i32 %116, %139
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds float, float addrspace(1)* %0, i64 %216
  %218 = load float, float addrspace(1)* %217, align 4, !tbaa !7, !amdgpu.noclobber !6
  %219 = fmul contract float %218, 0x3F8E1B08A0000000
  %220 = fadd contract float %209, %219
  %221 = getelementptr inbounds float, float addrspace(1)* %1, i64 %216
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !7, !amdgpu.noclobber !6
  %223 = fmul contract float %222, 0x3F8E1B08A0000000
  %224 = fadd contract float %208, %223
  br label %225

225:                                              ; preds = %214, %210, %207
  %226 = phi float [ %224, %214 ], [ %208, %210 ], [ %208, %207 ]
  %227 = phi float [ %220, %214 ], [ %209, %210 ], [ %209, %207 ]
  %228 = icmp sgt i32 %28, -1
  %229 = icmp slt i32 %39, %4
  %230 = select i1 %40, i1 %229, i1 false
  %231 = select i1 %230, i1 %228, i1 false
  br i1 %231, label %232, label %243

232:                                              ; preds = %225
  %233 = add nsw i32 %39, %29
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %0, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !7, !amdgpu.noclobber !6
  %237 = fmul contract float %236, 0x3F9A36E2E0000000
  %238 = fadd contract float %227, %237
  %239 = getelementptr inbounds float, float addrspace(1)* %1, i64 %234
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !7, !amdgpu.noclobber !6
  %241 = fmul contract float %240, 0x3F9A36E2E0000000
  %242 = fadd contract float %226, %241
  br label %243

243:                                              ; preds = %232, %225
  %244 = phi float [ %242, %232 ], [ %226, %225 ]
  %245 = phi float [ %238, %232 ], [ %227, %225 ]
  %246 = icmp sle i32 %20, %4
  %247 = select i1 %60, i1 %246, i1 false
  %248 = select i1 %247, i1 %228, i1 false
  br i1 %248, label %249, label %260

249:                                              ; preds = %243
  %250 = add nsw i32 %59, %29
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %0, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !7, !amdgpu.noclobber !6
  %254 = fmul contract float %253, 0x3FB85F0700000000
  %255 = fadd contract float %245, %254
  %256 = getelementptr inbounds float, float addrspace(1)* %1, i64 %251
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !7, !amdgpu.noclobber !6
  %258 = fmul contract float %257, 0x3FB85F0700000000
  %259 = fadd contract float %244, %258
  br label %260

260:                                              ; preds = %249, %243
  %261 = phi float [ %259, %249 ], [ %244, %243 ]
  %262 = phi float [ %255, %249 ], [ %245, %243 ]
  %263 = select i1 %79, i1 %228, i1 false
  br i1 %263, label %264, label %274

264:                                              ; preds = %260
  %265 = sext i32 %30 to i64
  %266 = getelementptr inbounds float, float addrspace(1)* %0, i64 %265
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !7, !amdgpu.noclobber !6
  %268 = fmul contract float %267, 0x3FC339C0E0000000
  %269 = fadd contract float %262, %268
  %270 = getelementptr inbounds float, float addrspace(1)* %1, i64 %265
  %271 = load float, float addrspace(1)* %270, align 4, !tbaa !7, !amdgpu.noclobber !6
  %272 = fmul contract float %271, 0x3FC339C0E0000000
  %273 = fadd contract float %261, %272
  br label %274

274:                                              ; preds = %260, %264
  %275 = phi float [ %273, %264 ], [ %261, %260 ]
  %276 = phi float [ %269, %264 ], [ %262, %260 ]
  %277 = icmp slt i32 %96, %4
  %278 = select i1 %97, i1 %277, i1 false
  %279 = select i1 %278, i1 %228, i1 false
  br i1 %279, label %280, label %291

280:                                              ; preds = %274
  %281 = add nsw i32 %96, %29
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %0, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !7, !amdgpu.noclobber !6
  %285 = fmul contract float %284, 0x3FB85F0700000000
  %286 = fadd contract float %276, %285
  %287 = getelementptr inbounds float, float addrspace(1)* %1, i64 %282
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !7, !amdgpu.noclobber !6
  %289 = fmul contract float %288, 0x3FB85F0700000000
  %290 = fadd contract float %275, %289
  br label %291

291:                                              ; preds = %280, %274
  %292 = phi float [ %290, %280 ], [ %275, %274 ]
  %293 = phi float [ %286, %280 ], [ %276, %274 ]
  %294 = icmp slt i32 %116, %4
  %295 = select i1 %117, i1 %294, i1 false
  %296 = select i1 %295, i1 %228, i1 false
  br i1 %296, label %297, label %308

297:                                              ; preds = %291
  %298 = add nsw i32 %116, %29
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds float, float addrspace(1)* %0, i64 %299
  %301 = load float, float addrspace(1)* %300, align 4, !tbaa !7, !amdgpu.noclobber !6
  %302 = fmul contract float %301, 0x3F9A36E2E0000000
  %303 = fadd contract float %293, %302
  %304 = getelementptr inbounds float, float addrspace(1)* %1, i64 %299
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !7, !amdgpu.noclobber !6
  %306 = fmul contract float %305, 0x3F9A36E2E0000000
  %307 = fadd contract float %292, %306
  br label %308

308:                                              ; preds = %297, %291
  %309 = phi float [ %307, %297 ], [ %292, %291 ]
  %310 = phi float [ %303, %297 ], [ %293, %291 ]
  %311 = add nsw i32 %28, 1
  %312 = icmp sgt i32 %28, -2
  %313 = icmp slt i32 %311, %5
  %314 = mul nsw i32 %311, %6
  br i1 %40, label %315, label %330

315:                                              ; preds = %308
  %316 = icmp slt i32 %39, %4
  %317 = select i1 %316, i1 %312, i1 false
  %318 = select i1 %317, i1 %313, i1 false
  br i1 %318, label %319, label %330

319:                                              ; preds = %315
  %320 = add nsw i32 %39, %314
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds float, float addrspace(1)* %0, i64 %321
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !7, !amdgpu.noclobber !6
  %324 = fmul contract float %323, 0x3F8E1B08A0000000
  %325 = fadd contract float %310, %324
  %326 = getelementptr inbounds float, float addrspace(1)* %1, i64 %321
  %327 = load float, float addrspace(1)* %326, align 4, !tbaa !7, !amdgpu.noclobber !6
  %328 = fmul contract float %327, 0x3F8E1B08A0000000
  %329 = fadd contract float %309, %328
  br label %330

330:                                              ; preds = %319, %315, %308
  %331 = phi float [ %329, %319 ], [ %309, %315 ], [ %309, %308 ]
  %332 = phi float [ %325, %319 ], [ %310, %315 ], [ %310, %308 ]
  br i1 %60, label %333, label %348

333:                                              ; preds = %330
  %334 = icmp sle i32 %20, %4
  %335 = select i1 %334, i1 %312, i1 false
  %336 = select i1 %335, i1 %313, i1 false
  br i1 %336, label %337, label %348

337:                                              ; preds = %333
  %338 = add nsw i32 %59, %314
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds float, float addrspace(1)* %0, i64 %339
  %341 = load float, float addrspace(1)* %340, align 4, !tbaa !7, !amdgpu.noclobber !6
  %342 = fmul contract float %341, 0x3FAE00D1C0000000
  %343 = fadd contract float %332, %342
  %344 = getelementptr inbounds float, float addrspace(1)* %1, i64 %339
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !7, !amdgpu.noclobber !6
  %346 = fmul contract float %345, 0x3FAE00D1C0000000
  %347 = fadd contract float %331, %346
  br label %348

348:                                              ; preds = %337, %333, %330
  %349 = phi float [ %347, %337 ], [ %331, %333 ], [ %331, %330 ]
  %350 = phi float [ %343, %337 ], [ %332, %333 ], [ %332, %330 ]
  %351 = select i1 %79, i1 %312, i1 false
  %352 = select i1 %351, i1 %313, i1 false
  br i1 %352, label %353, label %364

353:                                              ; preds = %348
  %354 = add nsw i32 %20, %314
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds float, float addrspace(1)* %0, i64 %355
  %357 = load float, float addrspace(1)* %356, align 4, !tbaa !7, !amdgpu.noclobber !6
  %358 = fmul contract float %357, 0x3FB85F0700000000
  %359 = fadd contract float %350, %358
  %360 = getelementptr inbounds float, float addrspace(1)* %1, i64 %355
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !7, !amdgpu.noclobber !6
  %362 = fmul contract float %361, 0x3FB85F0700000000
  %363 = fadd contract float %349, %362
  br label %364

364:                                              ; preds = %353, %348
  %365 = phi float [ %363, %353 ], [ %349, %348 ]
  %366 = phi float [ %359, %353 ], [ %350, %348 ]
  br i1 %97, label %367, label %382

367:                                              ; preds = %364
  %368 = icmp slt i32 %96, %4
  %369 = select i1 %368, i1 %312, i1 false
  %370 = select i1 %369, i1 %313, i1 false
  br i1 %370, label %371, label %382

371:                                              ; preds = %367
  %372 = add nsw i32 %96, %314
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds float, float addrspace(1)* %0, i64 %373
  %375 = load float, float addrspace(1)* %374, align 4, !tbaa !7, !amdgpu.noclobber !6
  %376 = fmul contract float %375, 0x3FAE00D1C0000000
  %377 = fadd contract float %366, %376
  %378 = getelementptr inbounds float, float addrspace(1)* %1, i64 %373
  %379 = load float, float addrspace(1)* %378, align 4, !tbaa !7, !amdgpu.noclobber !6
  %380 = fmul contract float %379, 0x3FAE00D1C0000000
  %381 = fadd contract float %365, %380
  br label %382

382:                                              ; preds = %371, %367, %364
  %383 = phi float [ %381, %371 ], [ %365, %367 ], [ %365, %364 ]
  %384 = phi float [ %377, %371 ], [ %366, %367 ], [ %366, %364 ]
  br i1 %117, label %385, label %400

385:                                              ; preds = %382
  %386 = icmp slt i32 %116, %4
  %387 = select i1 %386, i1 %312, i1 false
  %388 = select i1 %387, i1 %313, i1 false
  br i1 %388, label %389, label %400

389:                                              ; preds = %385
  %390 = add nsw i32 %116, %314
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %0, i64 %391
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !7, !amdgpu.noclobber !6
  %394 = fmul contract float %393, 0x3F8E1B08A0000000
  %395 = fadd contract float %384, %394
  %396 = getelementptr inbounds float, float addrspace(1)* %1, i64 %391
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !7, !amdgpu.noclobber !6
  %398 = fmul contract float %397, 0x3F8E1B08A0000000
  %399 = fadd contract float %383, %398
  br label %400

400:                                              ; preds = %389, %385, %382
  %401 = phi float [ %399, %389 ], [ %383, %385 ], [ %383, %382 ]
  %402 = phi float [ %395, %389 ], [ %384, %385 ], [ %384, %382 ]
  %403 = add nsw i32 %28, 2
  %404 = icmp sgt i32 %28, -3
  %405 = icmp slt i32 %403, %5
  %406 = mul nsw i32 %403, %6
  br i1 %40, label %407, label %422

407:                                              ; preds = %400
  %408 = icmp slt i32 %39, %4
  %409 = select i1 %408, i1 %404, i1 false
  %410 = select i1 %409, i1 %405, i1 false
  br i1 %410, label %411, label %422

411:                                              ; preds = %407
  %412 = add nsw i32 %39, %406
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds float, float addrspace(1)* %0, i64 %413
  %415 = load float, float addrspace(1)* %414, align 4, !tbaa !7, !amdgpu.noclobber !6
  %416 = fmul contract float %415, 0x3F6E4F7660000000
  %417 = fadd contract float %402, %416
  %418 = getelementptr inbounds float, float addrspace(1)* %1, i64 %413
  %419 = load float, float addrspace(1)* %418, align 4, !tbaa !7, !amdgpu.noclobber !6
  %420 = fmul contract float %419, 0x3F6E4F7660000000
  %421 = fadd contract float %401, %420
  br label %422

422:                                              ; preds = %411, %407, %400
  %423 = phi float [ %421, %411 ], [ %401, %407 ], [ %401, %400 ]
  %424 = phi float [ %417, %411 ], [ %402, %407 ], [ %402, %400 ]
  br i1 %60, label %425, label %440

425:                                              ; preds = %422
  %426 = icmp sle i32 %20, %4
  %427 = select i1 %426, i1 %404, i1 false
  %428 = select i1 %427, i1 %405, i1 false
  br i1 %428, label %429, label %440

429:                                              ; preds = %425
  %430 = add nsw i32 %59, %406
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds float, float addrspace(1)* %0, i64 %431
  %433 = load float, float addrspace(1)* %432, align 4, !tbaa !7, !amdgpu.noclobber !6
  %434 = fmul contract float %433, 0x3F8E1B08A0000000
  %435 = fadd contract float %424, %434
  %436 = getelementptr inbounds float, float addrspace(1)* %1, i64 %431
  %437 = load float, float addrspace(1)* %436, align 4, !tbaa !7, !amdgpu.noclobber !6
  %438 = fmul contract float %437, 0x3F8E1B08A0000000
  %439 = fadd contract float %423, %438
  br label %440

440:                                              ; preds = %429, %425, %422
  %441 = phi float [ %439, %429 ], [ %423, %425 ], [ %423, %422 ]
  %442 = phi float [ %435, %429 ], [ %424, %425 ], [ %424, %422 ]
  %443 = select i1 %79, i1 %404, i1 false
  %444 = select i1 %443, i1 %405, i1 false
  br i1 %444, label %445, label %456

445:                                              ; preds = %440
  %446 = add nsw i32 %20, %406
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds float, float addrspace(1)* %0, i64 %447
  %449 = load float, float addrspace(1)* %448, align 4, !tbaa !7, !amdgpu.noclobber !6
  %450 = fmul contract float %449, 0x3F9A36E2E0000000
  %451 = fadd contract float %442, %450
  %452 = getelementptr inbounds float, float addrspace(1)* %1, i64 %447
  %453 = load float, float addrspace(1)* %452, align 4, !tbaa !7, !amdgpu.noclobber !6
  %454 = fmul contract float %453, 0x3F9A36E2E0000000
  %455 = fadd contract float %441, %454
  br label %456

456:                                              ; preds = %445, %440
  %457 = phi float [ %455, %445 ], [ %441, %440 ]
  %458 = phi float [ %451, %445 ], [ %442, %440 ]
  br i1 %97, label %459, label %474

459:                                              ; preds = %456
  %460 = icmp slt i32 %96, %4
  %461 = select i1 %460, i1 %404, i1 false
  %462 = select i1 %461, i1 %405, i1 false
  br i1 %462, label %463, label %474

463:                                              ; preds = %459
  %464 = add nsw i32 %96, %406
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds float, float addrspace(1)* %0, i64 %465
  %467 = load float, float addrspace(1)* %466, align 4, !tbaa !7, !amdgpu.noclobber !6
  %468 = fmul contract float %467, 0x3F8E1B08A0000000
  %469 = fadd contract float %458, %468
  %470 = getelementptr inbounds float, float addrspace(1)* %1, i64 %465
  %471 = load float, float addrspace(1)* %470, align 4, !tbaa !7, !amdgpu.noclobber !6
  %472 = fmul contract float %471, 0x3F8E1B08A0000000
  %473 = fadd contract float %457, %472
  br label %474

474:                                              ; preds = %463, %459, %456
  %475 = phi float [ %473, %463 ], [ %457, %459 ], [ %457, %456 ]
  %476 = phi float [ %469, %463 ], [ %458, %459 ], [ %458, %456 ]
  br i1 %117, label %477, label %492

477:                                              ; preds = %474
  %478 = icmp slt i32 %116, %4
  %479 = select i1 %478, i1 %404, i1 false
  %480 = select i1 %479, i1 %405, i1 false
  br i1 %480, label %481, label %492

481:                                              ; preds = %477
  %482 = add nsw i32 %116, %406
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds float, float addrspace(1)* %0, i64 %483
  %485 = load float, float addrspace(1)* %484, align 4, !tbaa !7, !amdgpu.noclobber !6
  %486 = fmul contract float %485, 0x3F6E4F7660000000
  %487 = fadd contract float %476, %486
  %488 = getelementptr inbounds float, float addrspace(1)* %1, i64 %483
  %489 = load float, float addrspace(1)* %488, align 4, !tbaa !7, !amdgpu.noclobber !6
  %490 = fmul contract float %489, 0x3F6E4F7660000000
  %491 = fadd contract float %475, %490
  br label %492

492:                                              ; preds = %481, %477, %474
  %493 = phi float [ %491, %481 ], [ %475, %477 ], [ %475, %474 ]
  %494 = phi float [ %487, %481 ], [ %476, %477 ], [ %476, %474 ]
  %495 = sext i32 %30 to i64
  %496 = getelementptr inbounds float, float addrspace(1)* %7, i64 %495
  store float %494, float addrspace(1)* %496, align 4, !tbaa !7
  %497 = getelementptr inbounds float, float addrspace(1)* %8, i64 %495
  store float %493, float addrspace(1)* %497, align 4, !tbaa !7
  %498 = getelementptr inbounds float, float addrspace(1)* %2, i64 %495
  %499 = load float, float addrspace(1)* %498, align 4, !tbaa !7
  %500 = getelementptr inbounds float, float addrspace(1)* %0, i64 %495
  %501 = load float, float addrspace(1)* %500, align 4, !tbaa !7
  %502 = fadd contract float %499, %501
  %503 = fsub contract float %502, %494
  %504 = getelementptr inbounds float, float addrspace(1)* %9, i64 %495
  store float %503, float addrspace(1)* %504, align 4, !tbaa !7
  %505 = getelementptr inbounds float, float addrspace(1)* %3, i64 %495
  %506 = load float, float addrspace(1)* %505, align 4, !tbaa !7
  %507 = getelementptr inbounds float, float addrspace(1)* %1, i64 %495
  %508 = load float, float addrspace(1)* %507, align 4, !tbaa !7
  %509 = fadd contract float %506, %508
  %510 = fsub contract float %509, %493
  %511 = getelementptr inbounds float, float addrspace(1)* %10, i64 %495
  store float %510, float addrspace(1)* %511, align 4, !tbaa !7
  br label %512

512:                                              ; preds = %11, %492
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
