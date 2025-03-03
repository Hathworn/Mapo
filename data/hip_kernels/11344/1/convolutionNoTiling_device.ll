; ModuleID = '../data/hip_kernels/11344/1/main.cu'
source_filename = "../data/hip_kernels/11344/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@deviceMaskData = protected addrspace(4) externally_initialized global [25 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([25 x float] addrspace(4)* @deviceMaskData to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19convolutionNoTilingPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %24 = icmp slt i32 %14, %3
  %25 = icmp slt i32 %22, %4
  %26 = select i1 %24, i1 %25, i1 false
  %27 = icmp slt i32 %23, %2
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %467

29:                                               ; preds = %5
  %30 = add nsw i32 %22, -2
  %31 = add nsw i32 %14, -2
  %32 = icmp sgt i32 %22, 1
  %33 = icmp slt i32 %30, %4
  %34 = mul nsw i32 %30, %3
  br i1 %32, label %35, label %47

35:                                               ; preds = %29
  %36 = icmp sgt i32 %14, 1
  %37 = select i1 %33, i1 %36, i1 false
  %38 = icmp slt i32 %31, %3
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %40, label %47

40:                                               ; preds = %35
  %41 = add nsw i32 %31, %34
  %42 = mul nsw i32 %41, %2
  %43 = add nsw i32 %42, %23
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %47

47:                                               ; preds = %29, %35, %40
  %48 = phi float [ %46, %40 ], [ 0.000000e+00, %35 ], [ 0.000000e+00, %29 ]
  %49 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 0), align 16, !tbaa !7
  %50 = fmul contract float %48, %49
  %51 = fadd contract float %50, 0.000000e+00
  %52 = add nsw i32 %14, -1
  br i1 %32, label %53, label %65

53:                                               ; preds = %47
  %54 = icmp sgt i32 %14, 0
  %55 = select i1 %33, i1 %54, i1 false
  %56 = icmp sle i32 %14, %3
  %57 = select i1 %55, i1 %56, i1 false
  br i1 %57, label %58, label %65

58:                                               ; preds = %53
  %59 = add nsw i32 %52, %34
  %60 = mul nsw i32 %59, %2
  %61 = add nsw i32 %60, %23
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %65

65:                                               ; preds = %58, %53, %47
  %66 = phi i1 [ %33, %58 ], [ %33, %53 ], [ false, %47 ]
  %67 = phi float [ %64, %58 ], [ 0.000000e+00, %53 ], [ 0.000000e+00, %47 ]
  %68 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 1), align 4, !tbaa !7
  %69 = fmul contract float %67, %68
  %70 = fadd contract float %51, %69
  %71 = icmp sgt i32 %14, -1
  %72 = select i1 %66, i1 %71, i1 false
  br i1 %72, label %73, label %80

73:                                               ; preds = %65
  %74 = add nsw i32 %14, %34
  %75 = mul nsw i32 %74, %2
  %76 = add nsw i32 %75, %23
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %80

80:                                               ; preds = %73, %65
  %81 = phi float [ %79, %73 ], [ 0.000000e+00, %65 ]
  %82 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 2), align 8, !tbaa !7
  %83 = fmul contract float %81, %82
  %84 = fadd contract float %70, %83
  %85 = add nsw i32 %14, 1
  br i1 %32, label %86, label %98

86:                                               ; preds = %80
  %87 = icmp sgt i32 %14, -2
  %88 = select i1 %33, i1 %87, i1 false
  %89 = icmp slt i32 %85, %3
  %90 = select i1 %88, i1 %89, i1 false
  br i1 %90, label %91, label %98

91:                                               ; preds = %86
  %92 = add nsw i32 %85, %34
  %93 = mul nsw i32 %92, %2
  %94 = add nsw i32 %93, %23
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %98

98:                                               ; preds = %91, %86, %80
  %99 = phi float [ %97, %91 ], [ 0.000000e+00, %86 ], [ 0.000000e+00, %80 ]
  %100 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 3), align 4, !tbaa !7
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %84, %101
  %103 = add nsw i32 %14, 2
  br i1 %32, label %104, label %116

104:                                              ; preds = %98
  %105 = icmp sgt i32 %14, -3
  %106 = select i1 %33, i1 %105, i1 false
  %107 = icmp slt i32 %103, %3
  %108 = select i1 %106, i1 %107, i1 false
  br i1 %108, label %109, label %116

109:                                              ; preds = %104
  %110 = add nsw i32 %103, %34
  %111 = mul nsw i32 %110, %2
  %112 = add nsw i32 %111, %23
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %116

116:                                              ; preds = %109, %104, %98
  %117 = phi float [ %115, %109 ], [ 0.000000e+00, %104 ], [ 0.000000e+00, %98 ]
  %118 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 4), align 16, !tbaa !7
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %102, %119
  %121 = add nsw i32 %22, -1
  %122 = icmp sgt i32 %22, 0
  %123 = icmp sle i32 %22, %4
  %124 = mul nsw i32 %121, %3
  br i1 %122, label %125, label %137

125:                                              ; preds = %116
  %126 = icmp sgt i32 %14, 1
  %127 = select i1 %123, i1 %126, i1 false
  %128 = icmp slt i32 %31, %3
  %129 = select i1 %127, i1 %128, i1 false
  br i1 %129, label %130, label %137

130:                                              ; preds = %125
  %131 = add nsw i32 %31, %124
  %132 = mul nsw i32 %131, %2
  %133 = add nsw i32 %132, %23
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %137

137:                                              ; preds = %130, %125, %116
  %138 = phi float [ %136, %130 ], [ 0.000000e+00, %125 ], [ 0.000000e+00, %116 ]
  %139 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 5), align 4, !tbaa !7
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %120, %140
  br i1 %122, label %142, label %154

142:                                              ; preds = %137
  %143 = icmp sgt i32 %14, 0
  %144 = select i1 %123, i1 %143, i1 false
  %145 = icmp sle i32 %14, %3
  %146 = select i1 %144, i1 %145, i1 false
  br i1 %146, label %147, label %154

147:                                              ; preds = %142
  %148 = add nsw i32 %52, %124
  %149 = mul nsw i32 %148, %2
  %150 = add nsw i32 %149, %23
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %154

154:                                              ; preds = %147, %142, %137
  %155 = phi i1 [ %123, %147 ], [ %123, %142 ], [ false, %137 ]
  %156 = phi float [ %153, %147 ], [ 0.000000e+00, %142 ], [ 0.000000e+00, %137 ]
  %157 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 6), align 8, !tbaa !7
  %158 = fmul contract float %156, %157
  %159 = fadd contract float %141, %158
  %160 = icmp sgt i32 %14, -1
  %161 = select i1 %155, i1 %160, i1 false
  br i1 %161, label %162, label %169

162:                                              ; preds = %154
  %163 = add nsw i32 %14, %124
  %164 = mul nsw i32 %163, %2
  %165 = add nsw i32 %164, %23
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %169

169:                                              ; preds = %162, %154
  %170 = phi float [ %168, %162 ], [ 0.000000e+00, %154 ]
  %171 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 7), align 4, !tbaa !7
  %172 = fmul contract float %170, %171
  %173 = fadd contract float %159, %172
  br i1 %122, label %174, label %186

174:                                              ; preds = %169
  %175 = icmp sgt i32 %14, -2
  %176 = select i1 %123, i1 %175, i1 false
  %177 = icmp slt i32 %85, %3
  %178 = select i1 %176, i1 %177, i1 false
  br i1 %178, label %179, label %186

179:                                              ; preds = %174
  %180 = add nsw i32 %85, %124
  %181 = mul nsw i32 %180, %2
  %182 = add nsw i32 %181, %23
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %0, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %186

186:                                              ; preds = %179, %174, %169
  %187 = phi float [ %185, %179 ], [ 0.000000e+00, %174 ], [ 0.000000e+00, %169 ]
  %188 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 8), align 16, !tbaa !7
  %189 = fmul contract float %187, %188
  %190 = fadd contract float %173, %189
  br i1 %122, label %191, label %203

191:                                              ; preds = %186
  %192 = icmp sgt i32 %14, -3
  %193 = select i1 %123, i1 %192, i1 false
  %194 = icmp slt i32 %103, %3
  %195 = select i1 %193, i1 %194, i1 false
  br i1 %195, label %196, label %203

196:                                              ; preds = %191
  %197 = add nsw i32 %103, %124
  %198 = mul nsw i32 %197, %2
  %199 = add nsw i32 %198, %23
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %0, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %203

203:                                              ; preds = %196, %191, %186
  %204 = phi float [ %202, %196 ], [ 0.000000e+00, %191 ], [ 0.000000e+00, %186 ]
  %205 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 9), align 4, !tbaa !7
  %206 = fmul contract float %204, %205
  %207 = fadd contract float %190, %206
  %208 = icmp sgt i32 %22, -1
  %209 = mul nsw i32 %22, %3
  br i1 %208, label %210, label %221

210:                                              ; preds = %203
  %211 = icmp sgt i32 %14, 1
  %212 = icmp slt i32 %31, %3
  %213 = select i1 %211, i1 %212, i1 false
  br i1 %213, label %214, label %221

214:                                              ; preds = %210
  %215 = add nsw i32 %31, %209
  %216 = mul nsw i32 %215, %2
  %217 = add nsw i32 %216, %23
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %0, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %221

221:                                              ; preds = %214, %210, %203
  %222 = phi float [ %220, %214 ], [ 0.000000e+00, %210 ], [ 0.000000e+00, %203 ]
  %223 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 10), align 8, !tbaa !7
  %224 = fmul contract float %222, %223
  %225 = fadd contract float %207, %224
  br i1 %208, label %226, label %237

226:                                              ; preds = %221
  %227 = icmp sgt i32 %14, 0
  %228 = icmp sle i32 %14, %3
  %229 = select i1 %227, i1 %228, i1 false
  br i1 %229, label %230, label %237

230:                                              ; preds = %226
  %231 = add nsw i32 %52, %209
  %232 = mul nsw i32 %231, %2
  %233 = add nsw i32 %232, %23
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %0, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %237

237:                                              ; preds = %230, %226, %221
  %238 = phi float [ %236, %230 ], [ 0.000000e+00, %226 ], [ 0.000000e+00, %221 ]
  %239 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 11), align 4, !tbaa !7
  %240 = fmul contract float %238, %239
  %241 = fadd contract float %225, %240
  %242 = icmp sgt i32 %14, -1
  %243 = select i1 %208, i1 %242, i1 false
  br i1 %243, label %244, label %251

244:                                              ; preds = %237
  %245 = add nsw i32 %14, %209
  %246 = mul nsw i32 %245, %2
  %247 = add nsw i32 %246, %23
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %0, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %251

251:                                              ; preds = %244, %237
  %252 = phi float [ %250, %244 ], [ 0.000000e+00, %237 ]
  %253 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 12), align 16, !tbaa !7
  %254 = fmul contract float %252, %253
  %255 = fadd contract float %241, %254
  br i1 %208, label %256, label %267

256:                                              ; preds = %251
  %257 = icmp sgt i32 %14, -2
  %258 = icmp slt i32 %85, %3
  %259 = select i1 %257, i1 %258, i1 false
  br i1 %259, label %260, label %267

260:                                              ; preds = %256
  %261 = add nsw i32 %85, %209
  %262 = mul nsw i32 %261, %2
  %263 = add nsw i32 %262, %23
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %0, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %267

267:                                              ; preds = %260, %256, %251
  %268 = phi float [ %266, %260 ], [ 0.000000e+00, %256 ], [ 0.000000e+00, %251 ]
  %269 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 13), align 4, !tbaa !7
  %270 = fmul contract float %268, %269
  %271 = fadd contract float %255, %270
  br i1 %208, label %272, label %283

272:                                              ; preds = %267
  %273 = icmp sgt i32 %14, -3
  %274 = icmp slt i32 %103, %3
  %275 = select i1 %273, i1 %274, i1 false
  br i1 %275, label %276, label %283

276:                                              ; preds = %272
  %277 = add nsw i32 %103, %209
  %278 = mul nsw i32 %277, %2
  %279 = add nsw i32 %278, %23
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float addrspace(1)* %0, i64 %280
  %282 = load float, float addrspace(1)* %281, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %283

283:                                              ; preds = %276, %272, %267
  %284 = phi float [ %282, %276 ], [ 0.000000e+00, %272 ], [ 0.000000e+00, %267 ]
  %285 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 14), align 8, !tbaa !7
  %286 = fmul contract float %284, %285
  %287 = fadd contract float %271, %286
  %288 = add nsw i32 %22, 1
  %289 = icmp sgt i32 %22, -2
  %290 = icmp slt i32 %288, %4
  %291 = mul nsw i32 %288, %3
  br i1 %289, label %292, label %304

292:                                              ; preds = %283
  %293 = icmp sgt i32 %14, 1
  %294 = select i1 %290, i1 %293, i1 false
  %295 = icmp slt i32 %31, %3
  %296 = select i1 %294, i1 %295, i1 false
  br i1 %296, label %297, label %304

297:                                              ; preds = %292
  %298 = add nsw i32 %31, %291
  %299 = mul nsw i32 %298, %2
  %300 = add nsw i32 %299, %23
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds float, float addrspace(1)* %0, i64 %301
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %304

304:                                              ; preds = %297, %292, %283
  %305 = phi float [ %303, %297 ], [ 0.000000e+00, %292 ], [ 0.000000e+00, %283 ]
  %306 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 15), align 4, !tbaa !7
  %307 = fmul contract float %305, %306
  %308 = fadd contract float %287, %307
  br i1 %289, label %309, label %321

309:                                              ; preds = %304
  %310 = icmp sgt i32 %14, 0
  %311 = select i1 %290, i1 %310, i1 false
  %312 = icmp sle i32 %14, %3
  %313 = select i1 %311, i1 %312, i1 false
  br i1 %313, label %314, label %321

314:                                              ; preds = %309
  %315 = add nsw i32 %52, %291
  %316 = mul nsw i32 %315, %2
  %317 = add nsw i32 %316, %23
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds float, float addrspace(1)* %0, i64 %318
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %321

321:                                              ; preds = %314, %309, %304
  %322 = phi i1 [ %290, %314 ], [ %290, %309 ], [ false, %304 ]
  %323 = phi float [ %320, %314 ], [ 0.000000e+00, %309 ], [ 0.000000e+00, %304 ]
  %324 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 16), align 16, !tbaa !7
  %325 = fmul contract float %323, %324
  %326 = fadd contract float %308, %325
  %327 = icmp sgt i32 %14, -1
  %328 = select i1 %322, i1 %327, i1 false
  br i1 %328, label %329, label %336

329:                                              ; preds = %321
  %330 = add nsw i32 %14, %291
  %331 = mul nsw i32 %330, %2
  %332 = add nsw i32 %331, %23
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %0, i64 %333
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %336

336:                                              ; preds = %329, %321
  %337 = phi float [ %335, %329 ], [ 0.000000e+00, %321 ]
  %338 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 17), align 4, !tbaa !7
  %339 = fmul contract float %337, %338
  %340 = fadd contract float %326, %339
  br i1 %289, label %341, label %353

341:                                              ; preds = %336
  %342 = icmp sgt i32 %14, -2
  %343 = select i1 %290, i1 %342, i1 false
  %344 = icmp slt i32 %85, %3
  %345 = select i1 %343, i1 %344, i1 false
  br i1 %345, label %346, label %353

346:                                              ; preds = %341
  %347 = add nsw i32 %85, %291
  %348 = mul nsw i32 %347, %2
  %349 = add nsw i32 %348, %23
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %0, i64 %350
  %352 = load float, float addrspace(1)* %351, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %353

353:                                              ; preds = %346, %341, %336
  %354 = phi float [ %352, %346 ], [ 0.000000e+00, %341 ], [ 0.000000e+00, %336 ]
  %355 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 18), align 8, !tbaa !7
  %356 = fmul contract float %354, %355
  %357 = fadd contract float %340, %356
  br i1 %289, label %358, label %370

358:                                              ; preds = %353
  %359 = icmp sgt i32 %14, -3
  %360 = select i1 %290, i1 %359, i1 false
  %361 = icmp slt i32 %103, %3
  %362 = select i1 %360, i1 %361, i1 false
  br i1 %362, label %363, label %370

363:                                              ; preds = %358
  %364 = add nsw i32 %103, %291
  %365 = mul nsw i32 %364, %2
  %366 = add nsw i32 %365, %23
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds float, float addrspace(1)* %0, i64 %367
  %369 = load float, float addrspace(1)* %368, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %370

370:                                              ; preds = %363, %358, %353
  %371 = phi float [ %369, %363 ], [ 0.000000e+00, %358 ], [ 0.000000e+00, %353 ]
  %372 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 19), align 4, !tbaa !7
  %373 = fmul contract float %371, %372
  %374 = fadd contract float %357, %373
  %375 = add nsw i32 %22, 2
  %376 = icmp sgt i32 %22, -3
  %377 = icmp slt i32 %375, %4
  %378 = mul nsw i32 %375, %3
  br i1 %376, label %379, label %391

379:                                              ; preds = %370
  %380 = icmp sgt i32 %14, 1
  %381 = select i1 %377, i1 %380, i1 false
  %382 = icmp slt i32 %31, %3
  %383 = select i1 %381, i1 %382, i1 false
  br i1 %383, label %384, label %391

384:                                              ; preds = %379
  %385 = add nsw i32 %31, %378
  %386 = mul nsw i32 %385, %2
  %387 = add nsw i32 %386, %23
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds float, float addrspace(1)* %0, i64 %388
  %390 = load float, float addrspace(1)* %389, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %391

391:                                              ; preds = %384, %379, %370
  %392 = phi float [ %390, %384 ], [ 0.000000e+00, %379 ], [ 0.000000e+00, %370 ]
  %393 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 20), align 16, !tbaa !7
  %394 = fmul contract float %392, %393
  %395 = fadd contract float %374, %394
  br i1 %376, label %396, label %408

396:                                              ; preds = %391
  %397 = icmp sgt i32 %14, 0
  %398 = select i1 %377, i1 %397, i1 false
  %399 = icmp sle i32 %14, %3
  %400 = select i1 %398, i1 %399, i1 false
  br i1 %400, label %401, label %408

401:                                              ; preds = %396
  %402 = add nsw i32 %52, %378
  %403 = mul nsw i32 %402, %2
  %404 = add nsw i32 %403, %23
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds float, float addrspace(1)* %0, i64 %405
  %407 = load float, float addrspace(1)* %406, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %408

408:                                              ; preds = %401, %396, %391
  %409 = phi i1 [ %377, %401 ], [ %377, %396 ], [ false, %391 ]
  %410 = phi float [ %407, %401 ], [ 0.000000e+00, %396 ], [ 0.000000e+00, %391 ]
  %411 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 21), align 4, !tbaa !7
  %412 = fmul contract float %410, %411
  %413 = fadd contract float %395, %412
  %414 = icmp sgt i32 %14, -1
  %415 = select i1 %409, i1 %414, i1 false
  br i1 %415, label %416, label %423

416:                                              ; preds = %408
  %417 = add nsw i32 %14, %378
  %418 = mul nsw i32 %417, %2
  %419 = add nsw i32 %418, %23
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds float, float addrspace(1)* %0, i64 %420
  %422 = load float, float addrspace(1)* %421, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %423

423:                                              ; preds = %416, %408
  %424 = phi float [ %422, %416 ], [ 0.000000e+00, %408 ]
  %425 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 22), align 8, !tbaa !7
  %426 = fmul contract float %424, %425
  %427 = fadd contract float %413, %426
  br i1 %376, label %428, label %440

428:                                              ; preds = %423
  %429 = icmp sgt i32 %14, -2
  %430 = select i1 %377, i1 %429, i1 false
  %431 = icmp slt i32 %85, %3
  %432 = select i1 %430, i1 %431, i1 false
  br i1 %432, label %433, label %440

433:                                              ; preds = %428
  %434 = add nsw i32 %85, %378
  %435 = mul nsw i32 %434, %2
  %436 = add nsw i32 %435, %23
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds float, float addrspace(1)* %0, i64 %437
  %439 = load float, float addrspace(1)* %438, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %440

440:                                              ; preds = %433, %428, %423
  %441 = phi float [ %439, %433 ], [ 0.000000e+00, %428 ], [ 0.000000e+00, %423 ]
  %442 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 23), align 4, !tbaa !7
  %443 = fmul contract float %441, %442
  %444 = fadd contract float %427, %443
  br i1 %376, label %445, label %457

445:                                              ; preds = %440
  %446 = icmp sgt i32 %14, -3
  %447 = select i1 %377, i1 %446, i1 false
  %448 = icmp slt i32 %103, %3
  %449 = select i1 %447, i1 %448, i1 false
  br i1 %449, label %450, label %457

450:                                              ; preds = %445
  %451 = add nsw i32 %103, %378
  %452 = mul nsw i32 %451, %2
  %453 = add nsw i32 %452, %23
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds float, float addrspace(1)* %0, i64 %454
  %456 = load float, float addrspace(1)* %455, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %457

457:                                              ; preds = %450, %445, %440
  %458 = phi float [ %456, %450 ], [ 0.000000e+00, %445 ], [ 0.000000e+00, %440 ]
  %459 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @deviceMaskData, i64 0, i64 24), align 16, !tbaa !7
  %460 = fmul contract float %458, %459
  %461 = fadd contract float %444, %460
  %462 = add nsw i32 %209, %14
  %463 = mul nsw i32 %462, %2
  %464 = add nsw i32 %463, %23
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds float, float addrspace(1)* %1, i64 %465
  store float %461, float addrspace(1)* %466, align 4, !tbaa !7
  br label %467

467:                                              ; preds = %457, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

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
