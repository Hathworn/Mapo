; ModuleID = '../data/hip_kernels/15524/18/main.cu'
source_filename = "../data/hip_kernels/15524/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_lpd = protected addrspace(4) externally_initialized global float* null, align 8
@c_hpd = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_hpd to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_lpd to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11dwt_per_Y_OPfiiiiiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 3
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = shl i32 %13, 7
  %15 = shl i32 %5, 4
  %16 = sub i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = add i32 %16, %17
  %19 = shl i32 %13, 6
  %20 = add i32 %19, %17
  %21 = icmp slt i32 %12, %2
  br i1 %21, label %22, label %832

22:                                               ; preds = %8
  %23 = mul nsw i32 %18, %2
  %24 = add nsw i32 %23, %12
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = mul nsw i32 %20, %2
  %28 = add nsw i32 %27, %12
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %6, i64 %29
  %31 = getelementptr inbounds float, float addrspace(1)* %7, i64 %29
  %32 = icmp sgt i32 %5, 0
  br i1 %32, label %36, label %33

33:                                               ; preds = %22
  %34 = shl i32 %5, 1
  %35 = add i32 %34, 8
  br label %70

36:                                               ; preds = %22
  %37 = add nsw i32 %1, 1
  %38 = shl nuw i32 %5, 1
  %39 = add i32 %38, 8
  %40 = shl nuw nsw i32 %11, 4
  %41 = mul i32 %40, %39
  %42 = add nsw i32 %1, -1
  %43 = mul nsw i32 %42, %2
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %26, i64 %44
  %46 = and i32 %5, 1
  %47 = icmp eq i32 %5, 1
  br i1 %47, label %50, label %48

48:                                               ; preds = %36
  %49 = and i32 %5, -2
  br label %105

50:                                               ; preds = %135, %36
  %51 = phi i32 [ 0, %36 ], [ %141, %135 ]
  %52 = icmp eq i32 %46, 0
  br i1 %52, label %70, label %53

53:                                               ; preds = %50
  %54 = shl nsw i32 %51, 4
  %55 = add nsw i32 %54, %18
  %56 = icmp eq i32 %55, -1
  br i1 %56, label %64, label %57

57:                                               ; preds = %53
  %58 = icmp slt i32 %55, 0
  %59 = select i1 %58, i32 %37, i32 0
  %60 = add i32 %59, %54
  %61 = mul i32 %60, %2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %26, i64 %62
  br label %64

64:                                               ; preds = %53, %57
  %65 = phi float addrspace(1)* [ %63, %57 ], [ %45, %53 ]
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = add nuw i32 %54, %17
  %68 = add i32 %67, %41
  %69 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %68
  store float %66, float addrspace(3)* %69, align 4, !tbaa !5
  br label %70

70:                                               ; preds = %64, %50, %33
  %71 = phi i32 [ %35, %33 ], [ %39, %50 ], [ %39, %64 ]
  %72 = icmp sgt i32 %71, %5
  br i1 %72, label %76, label %73

73:                                               ; preds = %70
  %74 = mul i32 %71, %11
  %75 = shl i32 %74, 4
  br label %144

76:                                               ; preds = %70
  %77 = xor i32 %1, -1
  %78 = mul i32 %71, %11
  %79 = shl i32 %78, 4
  %80 = add nsw i32 %2, -1
  %81 = and i32 %5, 1
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %102, label %83

83:                                               ; preds = %76
  %84 = add i32 %14, %17
  %85 = icmp eq i32 %84, %1
  br i1 %85, label %91, label %86

86:                                               ; preds = %83
  %87 = icmp slt i32 %84, %1
  %88 = select i1 %87, i32 0, i32 %77
  %89 = add i32 %88, %15
  %90 = mul i32 %89, %2
  br label %93

91:                                               ; preds = %83
  %92 = mul nsw i32 %15, %80
  br label %93

93:                                               ; preds = %91, %86
  %94 = phi i32 [ %92, %91 ], [ %90, %86 ]
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %26, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  %98 = add i32 %15, %17
  %99 = add i32 %98, %79
  %100 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %99
  store float %97, float addrspace(3)* %100, align 4, !tbaa !5
  %101 = add nsw i32 %5, 1
  br label %102

102:                                              ; preds = %93, %76
  %103 = phi i32 [ %5, %76 ], [ %101, %93 ]
  %104 = icmp eq i32 %5, -7
  br i1 %104, label %144, label %155

105:                                              ; preds = %135, %48
  %106 = phi i32 [ 0, %48 ], [ %141, %135 ]
  %107 = phi i32 [ 0, %48 ], [ %142, %135 ]
  %108 = shl nsw i32 %106, 4
  %109 = add nsw i32 %108, %18
  %110 = icmp eq i32 %109, -1
  br i1 %110, label %118, label %111

111:                                              ; preds = %105
  %112 = icmp slt i32 %109, 0
  %113 = select i1 %112, i32 %37, i32 0
  %114 = add i32 %113, %108
  %115 = mul i32 %114, %2
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %26, i64 %116
  br label %118

118:                                              ; preds = %105, %111
  %119 = phi float addrspace(1)* [ %117, %111 ], [ %45, %105 ]
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5
  %121 = add nuw i32 %108, %17
  %122 = add i32 %121, %41
  %123 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %122
  store float %120, float addrspace(3)* %123, align 4, !tbaa !5
  %124 = shl i32 %106, 4
  %125 = or i32 %124, 16
  %126 = add nsw i32 %125, %18
  %127 = icmp eq i32 %126, -1
  br i1 %127, label %135, label %128

128:                                              ; preds = %118
  %129 = icmp slt i32 %126, 0
  %130 = select i1 %129, i32 %37, i32 0
  %131 = add i32 %130, %125
  %132 = mul i32 %131, %2
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %26, i64 %133
  br label %135

135:                                              ; preds = %118, %128
  %136 = phi float addrspace(1)* [ %134, %128 ], [ %45, %118 ]
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5
  %138 = add nuw i32 %125, %17
  %139 = add i32 %138, %41
  %140 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %139
  store float %137, float addrspace(3)* %140, align 4, !tbaa !5
  %141 = add nuw nsw i32 %106, 2
  %142 = add i32 %107, 2
  %143 = icmp eq i32 %142, %49
  br i1 %143, label %50, label %105, !llvm.loop !9

144:                                              ; preds = %186, %102, %73
  %145 = phi i32 [ %75, %73 ], [ %79, %102 ], [ %79, %186 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %146 = sdiv i32 %4, 2
  %147 = icmp sgt i32 %4, 0
  %148 = load float*, float* addrspace(4)* @c_lpd, align 8
  %149 = shl nuw nsw i32 %17, 1
  %150 = add nsw i32 %146, %149
  %151 = add i32 %150, %15
  %152 = add i32 %151, %145
  %153 = load float*, float* addrspace(4)* @c_hpd, align 8
  %154 = icmp slt i32 %20, %3
  br i1 %154, label %196, label %343

155:                                              ; preds = %102, %186
  %156 = phi i32 [ %194, %186 ], [ %103, %102 ]
  %157 = shl nsw i32 %156, 4
  %158 = add nsw i32 %157, %18
  %159 = icmp eq i32 %158, %1
  br i1 %159, label %160, label %162

160:                                              ; preds = %155
  %161 = mul nsw i32 %157, %80
  br label %167

162:                                              ; preds = %155
  %163 = icmp slt i32 %158, %1
  %164 = select i1 %163, i32 0, i32 %77
  %165 = add i32 %164, %157
  %166 = mul i32 %165, %2
  br label %167

167:                                              ; preds = %160, %162
  %168 = phi i32 [ %161, %160 ], [ %166, %162 ]
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %26, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !5
  %172 = add i32 %157, %17
  %173 = add i32 %172, %79
  %174 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %173
  store float %171, float addrspace(3)* %174, align 4, !tbaa !5
  %175 = shl i32 %156, 4
  %176 = add i32 %175, 16
  %177 = add nsw i32 %176, %18
  %178 = icmp eq i32 %177, %1
  br i1 %178, label %184, label %179

179:                                              ; preds = %167
  %180 = icmp slt i32 %177, %1
  %181 = select i1 %180, i32 0, i32 %77
  %182 = add i32 %181, %176
  %183 = mul i32 %182, %2
  br label %186

184:                                              ; preds = %167
  %185 = mul nsw i32 %176, %80
  br label %186

186:                                              ; preds = %184, %179
  %187 = phi i32 [ %185, %184 ], [ %183, %179 ]
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %26, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !5
  %191 = add i32 %176, %17
  %192 = add i32 %191, %79
  %193 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %192
  store float %190, float addrspace(3)* %193, align 4, !tbaa !5
  %194 = add nsw i32 %156, 2
  %195 = icmp eq i32 %194, %71
  br i1 %195, label %144, label %155, !llvm.loop !12

196:                                              ; preds = %144
  br i1 %147, label %197, label %229

197:                                              ; preds = %196
  %198 = and i32 %4, 7
  %199 = icmp ult i32 %4, 8
  br i1 %199, label %202, label %200

200:                                              ; preds = %197
  %201 = and i32 %4, -8
  br label %232

202:                                              ; preds = %232, %197
  %203 = phi float [ undef, %197 ], [ %335, %232 ]
  %204 = phi float [ undef, %197 ], [ %339, %232 ]
  %205 = phi i32 [ 0, %197 ], [ %340, %232 ]
  %206 = phi float [ 0.000000e+00, %197 ], [ %339, %232 ]
  %207 = phi float [ 0.000000e+00, %197 ], [ %335, %232 ]
  %208 = icmp eq i32 %198, 0
  br i1 %208, label %229, label %209

209:                                              ; preds = %202, %209
  %210 = phi i32 [ %226, %209 ], [ %205, %202 ]
  %211 = phi float [ %225, %209 ], [ %206, %202 ]
  %212 = phi float [ %221, %209 ], [ %207, %202 ]
  %213 = phi i32 [ %227, %209 ], [ 0, %202 ]
  %214 = zext i32 %210 to i64
  %215 = getelementptr inbounds float, float* %148, i64 %214
  %216 = load float, float* %215, align 4, !tbaa !5
  %217 = sub i32 %152, %210
  %218 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %217
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !5
  %220 = fmul contract float %216, %219
  %221 = fadd contract float %212, %220
  %222 = getelementptr inbounds float, float* %153, i64 %214
  %223 = load float, float* %222, align 4, !tbaa !5
  %224 = fmul contract float %219, %223
  %225 = fadd contract float %211, %224
  %226 = add nuw nsw i32 %210, 1
  %227 = add i32 %213, 1
  %228 = icmp eq i32 %227, %198
  br i1 %228, label %229, label %209, !llvm.loop !13

229:                                              ; preds = %202, %209, %196
  %230 = phi float [ 0.000000e+00, %196 ], [ %203, %202 ], [ %221, %209 ]
  %231 = phi float [ 0.000000e+00, %196 ], [ %204, %202 ], [ %225, %209 ]
  store float %230, float addrspace(1)* %30, align 4, !tbaa !5
  store float %231, float addrspace(1)* %31, align 4, !tbaa !5
  br label %343

232:                                              ; preds = %232, %200
  %233 = phi i32 [ 0, %200 ], [ %340, %232 ]
  %234 = phi float [ 0.000000e+00, %200 ], [ %339, %232 ]
  %235 = phi float [ 0.000000e+00, %200 ], [ %335, %232 ]
  %236 = phi i32 [ 0, %200 ], [ %341, %232 ]
  %237 = zext i32 %233 to i64
  %238 = getelementptr inbounds float, float* %148, i64 %237
  %239 = load float, float* %238, align 4, !tbaa !5
  %240 = sub i32 %152, %233
  %241 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %240
  %242 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %243 = fmul contract float %239, %242
  %244 = fadd contract float %235, %243
  %245 = getelementptr inbounds float, float* %153, i64 %237
  %246 = load float, float* %245, align 4, !tbaa !5
  %247 = fmul contract float %242, %246
  %248 = fadd contract float %234, %247
  %249 = or i32 %233, 1
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, float* %148, i64 %250
  %252 = load float, float* %251, align 4, !tbaa !5
  %253 = sub i32 %152, %249
  %254 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %253
  %255 = load float, float addrspace(3)* %254, align 4, !tbaa !5
  %256 = fmul contract float %252, %255
  %257 = fadd contract float %244, %256
  %258 = getelementptr inbounds float, float* %153, i64 %250
  %259 = load float, float* %258, align 4, !tbaa !5
  %260 = fmul contract float %255, %259
  %261 = fadd contract float %248, %260
  %262 = or i32 %233, 2
  %263 = zext i32 %262 to i64
  %264 = getelementptr inbounds float, float* %148, i64 %263
  %265 = load float, float* %264, align 4, !tbaa !5
  %266 = sub i32 %152, %262
  %267 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %266
  %268 = load float, float addrspace(3)* %267, align 4, !tbaa !5
  %269 = fmul contract float %265, %268
  %270 = fadd contract float %257, %269
  %271 = getelementptr inbounds float, float* %153, i64 %263
  %272 = load float, float* %271, align 4, !tbaa !5
  %273 = fmul contract float %268, %272
  %274 = fadd contract float %261, %273
  %275 = or i32 %233, 3
  %276 = zext i32 %275 to i64
  %277 = getelementptr inbounds float, float* %148, i64 %276
  %278 = load float, float* %277, align 4, !tbaa !5
  %279 = sub i32 %152, %275
  %280 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %279
  %281 = load float, float addrspace(3)* %280, align 4, !tbaa !5
  %282 = fmul contract float %278, %281
  %283 = fadd contract float %270, %282
  %284 = getelementptr inbounds float, float* %153, i64 %276
  %285 = load float, float* %284, align 4, !tbaa !5
  %286 = fmul contract float %281, %285
  %287 = fadd contract float %274, %286
  %288 = or i32 %233, 4
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds float, float* %148, i64 %289
  %291 = load float, float* %290, align 4, !tbaa !5
  %292 = sub i32 %152, %288
  %293 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %292
  %294 = load float, float addrspace(3)* %293, align 4, !tbaa !5
  %295 = fmul contract float %291, %294
  %296 = fadd contract float %283, %295
  %297 = getelementptr inbounds float, float* %153, i64 %289
  %298 = load float, float* %297, align 4, !tbaa !5
  %299 = fmul contract float %294, %298
  %300 = fadd contract float %287, %299
  %301 = or i32 %233, 5
  %302 = zext i32 %301 to i64
  %303 = getelementptr inbounds float, float* %148, i64 %302
  %304 = load float, float* %303, align 4, !tbaa !5
  %305 = sub i32 %152, %301
  %306 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %305
  %307 = load float, float addrspace(3)* %306, align 4, !tbaa !5
  %308 = fmul contract float %304, %307
  %309 = fadd contract float %296, %308
  %310 = getelementptr inbounds float, float* %153, i64 %302
  %311 = load float, float* %310, align 4, !tbaa !5
  %312 = fmul contract float %307, %311
  %313 = fadd contract float %300, %312
  %314 = or i32 %233, 6
  %315 = zext i32 %314 to i64
  %316 = getelementptr inbounds float, float* %148, i64 %315
  %317 = load float, float* %316, align 4, !tbaa !5
  %318 = sub i32 %152, %314
  %319 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %318
  %320 = load float, float addrspace(3)* %319, align 4, !tbaa !5
  %321 = fmul contract float %317, %320
  %322 = fadd contract float %309, %321
  %323 = getelementptr inbounds float, float* %153, i64 %315
  %324 = load float, float* %323, align 4, !tbaa !5
  %325 = fmul contract float %320, %324
  %326 = fadd contract float %313, %325
  %327 = or i32 %233, 7
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, float* %148, i64 %328
  %330 = load float, float* %329, align 4, !tbaa !5
  %331 = sub i32 %152, %327
  %332 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %331
  %333 = load float, float addrspace(3)* %332, align 4, !tbaa !5
  %334 = fmul contract float %330, %333
  %335 = fadd contract float %322, %334
  %336 = getelementptr inbounds float, float* %153, i64 %328
  %337 = load float, float* %336, align 4, !tbaa !5
  %338 = fmul contract float %333, %337
  %339 = fadd contract float %326, %338
  %340 = add nuw nsw i32 %233, 8
  %341 = add i32 %236, 8
  %342 = icmp eq i32 %341, %201
  br i1 %342, label %202, label %232, !llvm.loop !14

343:                                              ; preds = %144, %229
  %344 = add nsw i32 %20, 16
  %345 = icmp slt i32 %344, %3
  br i1 %345, label %346, label %506

346:                                              ; preds = %343
  br i1 %147, label %347, label %499

347:                                              ; preds = %346
  %348 = and i32 %4, 7
  %349 = icmp ult i32 %4, 8
  br i1 %349, label %471, label %350

350:                                              ; preds = %347
  %351 = and i32 %4, -8
  br label %352

352:                                              ; preds = %352, %350
  %353 = phi i32 [ 0, %350 ], [ %468, %352 ]
  %354 = phi float [ 0.000000e+00, %350 ], [ %467, %352 ]
  %355 = phi float [ 0.000000e+00, %350 ], [ %463, %352 ]
  %356 = phi i32 [ 0, %350 ], [ %469, %352 ]
  %357 = zext i32 %353 to i64
  %358 = getelementptr inbounds float, float* %148, i64 %357
  %359 = load float, float* %358, align 4, !tbaa !5
  %360 = sub i32 %152, %353
  %361 = add i32 %360, 32
  %362 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %361
  %363 = load float, float addrspace(3)* %362, align 4, !tbaa !5
  %364 = fmul contract float %359, %363
  %365 = fadd contract float %355, %364
  %366 = getelementptr inbounds float, float* %153, i64 %357
  %367 = load float, float* %366, align 4, !tbaa !5
  %368 = fmul contract float %363, %367
  %369 = fadd contract float %354, %368
  %370 = or i32 %353, 1
  %371 = zext i32 %370 to i64
  %372 = getelementptr inbounds float, float* %148, i64 %371
  %373 = load float, float* %372, align 4, !tbaa !5
  %374 = sub i32 %152, %370
  %375 = add i32 %374, 32
  %376 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %375
  %377 = load float, float addrspace(3)* %376, align 4, !tbaa !5
  %378 = fmul contract float %373, %377
  %379 = fadd contract float %365, %378
  %380 = getelementptr inbounds float, float* %153, i64 %371
  %381 = load float, float* %380, align 4, !tbaa !5
  %382 = fmul contract float %377, %381
  %383 = fadd contract float %369, %382
  %384 = or i32 %353, 2
  %385 = zext i32 %384 to i64
  %386 = getelementptr inbounds float, float* %148, i64 %385
  %387 = load float, float* %386, align 4, !tbaa !5
  %388 = sub i32 %152, %384
  %389 = add i32 %388, 32
  %390 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %389
  %391 = load float, float addrspace(3)* %390, align 4, !tbaa !5
  %392 = fmul contract float %387, %391
  %393 = fadd contract float %379, %392
  %394 = getelementptr inbounds float, float* %153, i64 %385
  %395 = load float, float* %394, align 4, !tbaa !5
  %396 = fmul contract float %391, %395
  %397 = fadd contract float %383, %396
  %398 = or i32 %353, 3
  %399 = zext i32 %398 to i64
  %400 = getelementptr inbounds float, float* %148, i64 %399
  %401 = load float, float* %400, align 4, !tbaa !5
  %402 = sub i32 %152, %398
  %403 = add i32 %402, 32
  %404 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %403
  %405 = load float, float addrspace(3)* %404, align 4, !tbaa !5
  %406 = fmul contract float %401, %405
  %407 = fadd contract float %393, %406
  %408 = getelementptr inbounds float, float* %153, i64 %399
  %409 = load float, float* %408, align 4, !tbaa !5
  %410 = fmul contract float %405, %409
  %411 = fadd contract float %397, %410
  %412 = or i32 %353, 4
  %413 = zext i32 %412 to i64
  %414 = getelementptr inbounds float, float* %148, i64 %413
  %415 = load float, float* %414, align 4, !tbaa !5
  %416 = sub i32 %152, %412
  %417 = add i32 %416, 32
  %418 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %417
  %419 = load float, float addrspace(3)* %418, align 4, !tbaa !5
  %420 = fmul contract float %415, %419
  %421 = fadd contract float %407, %420
  %422 = getelementptr inbounds float, float* %153, i64 %413
  %423 = load float, float* %422, align 4, !tbaa !5
  %424 = fmul contract float %419, %423
  %425 = fadd contract float %411, %424
  %426 = or i32 %353, 5
  %427 = zext i32 %426 to i64
  %428 = getelementptr inbounds float, float* %148, i64 %427
  %429 = load float, float* %428, align 4, !tbaa !5
  %430 = sub i32 %152, %426
  %431 = add i32 %430, 32
  %432 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %431
  %433 = load float, float addrspace(3)* %432, align 4, !tbaa !5
  %434 = fmul contract float %429, %433
  %435 = fadd contract float %421, %434
  %436 = getelementptr inbounds float, float* %153, i64 %427
  %437 = load float, float* %436, align 4, !tbaa !5
  %438 = fmul contract float %433, %437
  %439 = fadd contract float %425, %438
  %440 = or i32 %353, 6
  %441 = zext i32 %440 to i64
  %442 = getelementptr inbounds float, float* %148, i64 %441
  %443 = load float, float* %442, align 4, !tbaa !5
  %444 = sub i32 %152, %440
  %445 = add i32 %444, 32
  %446 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %445
  %447 = load float, float addrspace(3)* %446, align 4, !tbaa !5
  %448 = fmul contract float %443, %447
  %449 = fadd contract float %435, %448
  %450 = getelementptr inbounds float, float* %153, i64 %441
  %451 = load float, float* %450, align 4, !tbaa !5
  %452 = fmul contract float %447, %451
  %453 = fadd contract float %439, %452
  %454 = or i32 %353, 7
  %455 = zext i32 %454 to i64
  %456 = getelementptr inbounds float, float* %148, i64 %455
  %457 = load float, float* %456, align 4, !tbaa !5
  %458 = sub i32 %152, %454
  %459 = add i32 %458, 32
  %460 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %459
  %461 = load float, float addrspace(3)* %460, align 4, !tbaa !5
  %462 = fmul contract float %457, %461
  %463 = fadd contract float %449, %462
  %464 = getelementptr inbounds float, float* %153, i64 %455
  %465 = load float, float* %464, align 4, !tbaa !5
  %466 = fmul contract float %461, %465
  %467 = fadd contract float %453, %466
  %468 = add nuw nsw i32 %353, 8
  %469 = add i32 %356, 8
  %470 = icmp eq i32 %469, %351
  br i1 %470, label %471, label %352, !llvm.loop !14

471:                                              ; preds = %352, %347
  %472 = phi float [ undef, %347 ], [ %463, %352 ]
  %473 = phi float [ undef, %347 ], [ %467, %352 ]
  %474 = phi i32 [ 0, %347 ], [ %468, %352 ]
  %475 = phi float [ 0.000000e+00, %347 ], [ %467, %352 ]
  %476 = phi float [ 0.000000e+00, %347 ], [ %463, %352 ]
  %477 = icmp eq i32 %348, 0
  br i1 %477, label %499, label %478

478:                                              ; preds = %471, %478
  %479 = phi i32 [ %496, %478 ], [ %474, %471 ]
  %480 = phi float [ %495, %478 ], [ %475, %471 ]
  %481 = phi float [ %491, %478 ], [ %476, %471 ]
  %482 = phi i32 [ %497, %478 ], [ 0, %471 ]
  %483 = zext i32 %479 to i64
  %484 = getelementptr inbounds float, float* %148, i64 %483
  %485 = load float, float* %484, align 4, !tbaa !5
  %486 = sub i32 %152, %479
  %487 = add i32 %486, 32
  %488 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %487
  %489 = load float, float addrspace(3)* %488, align 4, !tbaa !5
  %490 = fmul contract float %485, %489
  %491 = fadd contract float %481, %490
  %492 = getelementptr inbounds float, float* %153, i64 %483
  %493 = load float, float* %492, align 4, !tbaa !5
  %494 = fmul contract float %489, %493
  %495 = fadd contract float %480, %494
  %496 = add nuw nsw i32 %479, 1
  %497 = add i32 %482, 1
  %498 = icmp eq i32 %497, %348
  br i1 %498, label %499, label %478, !llvm.loop !15

499:                                              ; preds = %471, %478, %346
  %500 = phi float [ 0.000000e+00, %346 ], [ %472, %471 ], [ %491, %478 ]
  %501 = phi float [ 0.000000e+00, %346 ], [ %473, %471 ], [ %495, %478 ]
  %502 = shl nsw i32 %2, 4
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds float, float addrspace(1)* %30, i64 %503
  store float %500, float addrspace(1)* %504, align 4, !tbaa !5
  %505 = getelementptr inbounds float, float addrspace(1)* %31, i64 %503
  store float %501, float addrspace(1)* %505, align 4, !tbaa !5
  br label %506

506:                                              ; preds = %499, %343
  %507 = add nsw i32 %20, 32
  %508 = icmp slt i32 %507, %3
  br i1 %508, label %509, label %669

509:                                              ; preds = %506
  br i1 %147, label %510, label %662

510:                                              ; preds = %509
  %511 = and i32 %4, 7
  %512 = icmp ult i32 %4, 8
  br i1 %512, label %634, label %513

513:                                              ; preds = %510
  %514 = and i32 %4, -8
  br label %515

515:                                              ; preds = %515, %513
  %516 = phi i32 [ 0, %513 ], [ %631, %515 ]
  %517 = phi float [ 0.000000e+00, %513 ], [ %630, %515 ]
  %518 = phi float [ 0.000000e+00, %513 ], [ %626, %515 ]
  %519 = phi i32 [ 0, %513 ], [ %632, %515 ]
  %520 = zext i32 %516 to i64
  %521 = getelementptr inbounds float, float* %148, i64 %520
  %522 = load float, float* %521, align 4, !tbaa !5
  %523 = sub i32 %152, %516
  %524 = add i32 %523, 64
  %525 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %524
  %526 = load float, float addrspace(3)* %525, align 4, !tbaa !5
  %527 = fmul contract float %522, %526
  %528 = fadd contract float %518, %527
  %529 = getelementptr inbounds float, float* %153, i64 %520
  %530 = load float, float* %529, align 4, !tbaa !5
  %531 = fmul contract float %526, %530
  %532 = fadd contract float %517, %531
  %533 = or i32 %516, 1
  %534 = zext i32 %533 to i64
  %535 = getelementptr inbounds float, float* %148, i64 %534
  %536 = load float, float* %535, align 4, !tbaa !5
  %537 = sub i32 %152, %533
  %538 = add i32 %537, 64
  %539 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %538
  %540 = load float, float addrspace(3)* %539, align 4, !tbaa !5
  %541 = fmul contract float %536, %540
  %542 = fadd contract float %528, %541
  %543 = getelementptr inbounds float, float* %153, i64 %534
  %544 = load float, float* %543, align 4, !tbaa !5
  %545 = fmul contract float %540, %544
  %546 = fadd contract float %532, %545
  %547 = or i32 %516, 2
  %548 = zext i32 %547 to i64
  %549 = getelementptr inbounds float, float* %148, i64 %548
  %550 = load float, float* %549, align 4, !tbaa !5
  %551 = sub i32 %152, %547
  %552 = add i32 %551, 64
  %553 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %552
  %554 = load float, float addrspace(3)* %553, align 4, !tbaa !5
  %555 = fmul contract float %550, %554
  %556 = fadd contract float %542, %555
  %557 = getelementptr inbounds float, float* %153, i64 %548
  %558 = load float, float* %557, align 4, !tbaa !5
  %559 = fmul contract float %554, %558
  %560 = fadd contract float %546, %559
  %561 = or i32 %516, 3
  %562 = zext i32 %561 to i64
  %563 = getelementptr inbounds float, float* %148, i64 %562
  %564 = load float, float* %563, align 4, !tbaa !5
  %565 = sub i32 %152, %561
  %566 = add i32 %565, 64
  %567 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %566
  %568 = load float, float addrspace(3)* %567, align 4, !tbaa !5
  %569 = fmul contract float %564, %568
  %570 = fadd contract float %556, %569
  %571 = getelementptr inbounds float, float* %153, i64 %562
  %572 = load float, float* %571, align 4, !tbaa !5
  %573 = fmul contract float %568, %572
  %574 = fadd contract float %560, %573
  %575 = or i32 %516, 4
  %576 = zext i32 %575 to i64
  %577 = getelementptr inbounds float, float* %148, i64 %576
  %578 = load float, float* %577, align 4, !tbaa !5
  %579 = sub i32 %152, %575
  %580 = add i32 %579, 64
  %581 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %580
  %582 = load float, float addrspace(3)* %581, align 4, !tbaa !5
  %583 = fmul contract float %578, %582
  %584 = fadd contract float %570, %583
  %585 = getelementptr inbounds float, float* %153, i64 %576
  %586 = load float, float* %585, align 4, !tbaa !5
  %587 = fmul contract float %582, %586
  %588 = fadd contract float %574, %587
  %589 = or i32 %516, 5
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds float, float* %148, i64 %590
  %592 = load float, float* %591, align 4, !tbaa !5
  %593 = sub i32 %152, %589
  %594 = add i32 %593, 64
  %595 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %594
  %596 = load float, float addrspace(3)* %595, align 4, !tbaa !5
  %597 = fmul contract float %592, %596
  %598 = fadd contract float %584, %597
  %599 = getelementptr inbounds float, float* %153, i64 %590
  %600 = load float, float* %599, align 4, !tbaa !5
  %601 = fmul contract float %596, %600
  %602 = fadd contract float %588, %601
  %603 = or i32 %516, 6
  %604 = zext i32 %603 to i64
  %605 = getelementptr inbounds float, float* %148, i64 %604
  %606 = load float, float* %605, align 4, !tbaa !5
  %607 = sub i32 %152, %603
  %608 = add i32 %607, 64
  %609 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %608
  %610 = load float, float addrspace(3)* %609, align 4, !tbaa !5
  %611 = fmul contract float %606, %610
  %612 = fadd contract float %598, %611
  %613 = getelementptr inbounds float, float* %153, i64 %604
  %614 = load float, float* %613, align 4, !tbaa !5
  %615 = fmul contract float %610, %614
  %616 = fadd contract float %602, %615
  %617 = or i32 %516, 7
  %618 = zext i32 %617 to i64
  %619 = getelementptr inbounds float, float* %148, i64 %618
  %620 = load float, float* %619, align 4, !tbaa !5
  %621 = sub i32 %152, %617
  %622 = add i32 %621, 64
  %623 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %622
  %624 = load float, float addrspace(3)* %623, align 4, !tbaa !5
  %625 = fmul contract float %620, %624
  %626 = fadd contract float %612, %625
  %627 = getelementptr inbounds float, float* %153, i64 %618
  %628 = load float, float* %627, align 4, !tbaa !5
  %629 = fmul contract float %624, %628
  %630 = fadd contract float %616, %629
  %631 = add nuw nsw i32 %516, 8
  %632 = add i32 %519, 8
  %633 = icmp eq i32 %632, %514
  br i1 %633, label %634, label %515, !llvm.loop !14

634:                                              ; preds = %515, %510
  %635 = phi float [ undef, %510 ], [ %626, %515 ]
  %636 = phi float [ undef, %510 ], [ %630, %515 ]
  %637 = phi i32 [ 0, %510 ], [ %631, %515 ]
  %638 = phi float [ 0.000000e+00, %510 ], [ %630, %515 ]
  %639 = phi float [ 0.000000e+00, %510 ], [ %626, %515 ]
  %640 = icmp eq i32 %511, 0
  br i1 %640, label %662, label %641

641:                                              ; preds = %634, %641
  %642 = phi i32 [ %659, %641 ], [ %637, %634 ]
  %643 = phi float [ %658, %641 ], [ %638, %634 ]
  %644 = phi float [ %654, %641 ], [ %639, %634 ]
  %645 = phi i32 [ %660, %641 ], [ 0, %634 ]
  %646 = zext i32 %642 to i64
  %647 = getelementptr inbounds float, float* %148, i64 %646
  %648 = load float, float* %647, align 4, !tbaa !5
  %649 = sub i32 %152, %642
  %650 = add i32 %649, 64
  %651 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %650
  %652 = load float, float addrspace(3)* %651, align 4, !tbaa !5
  %653 = fmul contract float %648, %652
  %654 = fadd contract float %644, %653
  %655 = getelementptr inbounds float, float* %153, i64 %646
  %656 = load float, float* %655, align 4, !tbaa !5
  %657 = fmul contract float %652, %656
  %658 = fadd contract float %643, %657
  %659 = add nuw nsw i32 %642, 1
  %660 = add i32 %645, 1
  %661 = icmp eq i32 %660, %511
  br i1 %661, label %662, label %641, !llvm.loop !16

662:                                              ; preds = %634, %641, %509
  %663 = phi float [ 0.000000e+00, %509 ], [ %635, %634 ], [ %654, %641 ]
  %664 = phi float [ 0.000000e+00, %509 ], [ %636, %634 ], [ %658, %641 ]
  %665 = shl nsw i32 %2, 5
  %666 = sext i32 %665 to i64
  %667 = getelementptr inbounds float, float addrspace(1)* %30, i64 %666
  store float %663, float addrspace(1)* %667, align 4, !tbaa !5
  %668 = getelementptr inbounds float, float addrspace(1)* %31, i64 %666
  store float %664, float addrspace(1)* %668, align 4, !tbaa !5
  br label %669

669:                                              ; preds = %662, %506
  %670 = add nsw i32 %20, 48
  %671 = icmp slt i32 %670, %3
  br i1 %671, label %672, label %832

672:                                              ; preds = %669
  br i1 %147, label %673, label %825

673:                                              ; preds = %672
  %674 = and i32 %4, 7
  %675 = icmp ult i32 %4, 8
  br i1 %675, label %797, label %676

676:                                              ; preds = %673
  %677 = and i32 %4, -8
  br label %678

678:                                              ; preds = %678, %676
  %679 = phi i32 [ 0, %676 ], [ %794, %678 ]
  %680 = phi float [ 0.000000e+00, %676 ], [ %793, %678 ]
  %681 = phi float [ 0.000000e+00, %676 ], [ %789, %678 ]
  %682 = phi i32 [ 0, %676 ], [ %795, %678 ]
  %683 = zext i32 %679 to i64
  %684 = getelementptr inbounds float, float* %148, i64 %683
  %685 = load float, float* %684, align 4, !tbaa !5
  %686 = sub i32 %152, %679
  %687 = add i32 %686, 96
  %688 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %687
  %689 = load float, float addrspace(3)* %688, align 4, !tbaa !5
  %690 = fmul contract float %685, %689
  %691 = fadd contract float %681, %690
  %692 = getelementptr inbounds float, float* %153, i64 %683
  %693 = load float, float* %692, align 4, !tbaa !5
  %694 = fmul contract float %689, %693
  %695 = fadd contract float %680, %694
  %696 = or i32 %679, 1
  %697 = zext i32 %696 to i64
  %698 = getelementptr inbounds float, float* %148, i64 %697
  %699 = load float, float* %698, align 4, !tbaa !5
  %700 = sub i32 %152, %696
  %701 = add i32 %700, 96
  %702 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %701
  %703 = load float, float addrspace(3)* %702, align 4, !tbaa !5
  %704 = fmul contract float %699, %703
  %705 = fadd contract float %691, %704
  %706 = getelementptr inbounds float, float* %153, i64 %697
  %707 = load float, float* %706, align 4, !tbaa !5
  %708 = fmul contract float %703, %707
  %709 = fadd contract float %695, %708
  %710 = or i32 %679, 2
  %711 = zext i32 %710 to i64
  %712 = getelementptr inbounds float, float* %148, i64 %711
  %713 = load float, float* %712, align 4, !tbaa !5
  %714 = sub i32 %152, %710
  %715 = add i32 %714, 96
  %716 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %715
  %717 = load float, float addrspace(3)* %716, align 4, !tbaa !5
  %718 = fmul contract float %713, %717
  %719 = fadd contract float %705, %718
  %720 = getelementptr inbounds float, float* %153, i64 %711
  %721 = load float, float* %720, align 4, !tbaa !5
  %722 = fmul contract float %717, %721
  %723 = fadd contract float %709, %722
  %724 = or i32 %679, 3
  %725 = zext i32 %724 to i64
  %726 = getelementptr inbounds float, float* %148, i64 %725
  %727 = load float, float* %726, align 4, !tbaa !5
  %728 = sub i32 %152, %724
  %729 = add i32 %728, 96
  %730 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %729
  %731 = load float, float addrspace(3)* %730, align 4, !tbaa !5
  %732 = fmul contract float %727, %731
  %733 = fadd contract float %719, %732
  %734 = getelementptr inbounds float, float* %153, i64 %725
  %735 = load float, float* %734, align 4, !tbaa !5
  %736 = fmul contract float %731, %735
  %737 = fadd contract float %723, %736
  %738 = or i32 %679, 4
  %739 = zext i32 %738 to i64
  %740 = getelementptr inbounds float, float* %148, i64 %739
  %741 = load float, float* %740, align 4, !tbaa !5
  %742 = sub i32 %152, %738
  %743 = add i32 %742, 96
  %744 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %743
  %745 = load float, float addrspace(3)* %744, align 4, !tbaa !5
  %746 = fmul contract float %741, %745
  %747 = fadd contract float %733, %746
  %748 = getelementptr inbounds float, float* %153, i64 %739
  %749 = load float, float* %748, align 4, !tbaa !5
  %750 = fmul contract float %745, %749
  %751 = fadd contract float %737, %750
  %752 = or i32 %679, 5
  %753 = zext i32 %752 to i64
  %754 = getelementptr inbounds float, float* %148, i64 %753
  %755 = load float, float* %754, align 4, !tbaa !5
  %756 = sub i32 %152, %752
  %757 = add i32 %756, 96
  %758 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %757
  %759 = load float, float addrspace(3)* %758, align 4, !tbaa !5
  %760 = fmul contract float %755, %759
  %761 = fadd contract float %747, %760
  %762 = getelementptr inbounds float, float* %153, i64 %753
  %763 = load float, float* %762, align 4, !tbaa !5
  %764 = fmul contract float %759, %763
  %765 = fadd contract float %751, %764
  %766 = or i32 %679, 6
  %767 = zext i32 %766 to i64
  %768 = getelementptr inbounds float, float* %148, i64 %767
  %769 = load float, float* %768, align 4, !tbaa !5
  %770 = sub i32 %152, %766
  %771 = add i32 %770, 96
  %772 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %771
  %773 = load float, float addrspace(3)* %772, align 4, !tbaa !5
  %774 = fmul contract float %769, %773
  %775 = fadd contract float %761, %774
  %776 = getelementptr inbounds float, float* %153, i64 %767
  %777 = load float, float* %776, align 4, !tbaa !5
  %778 = fmul contract float %773, %777
  %779 = fadd contract float %765, %778
  %780 = or i32 %679, 7
  %781 = zext i32 %780 to i64
  %782 = getelementptr inbounds float, float* %148, i64 %781
  %783 = load float, float* %782, align 4, !tbaa !5
  %784 = sub i32 %152, %780
  %785 = add i32 %784, 96
  %786 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %785
  %787 = load float, float addrspace(3)* %786, align 4, !tbaa !5
  %788 = fmul contract float %783, %787
  %789 = fadd contract float %775, %788
  %790 = getelementptr inbounds float, float* %153, i64 %781
  %791 = load float, float* %790, align 4, !tbaa !5
  %792 = fmul contract float %787, %791
  %793 = fadd contract float %779, %792
  %794 = add nuw nsw i32 %679, 8
  %795 = add i32 %682, 8
  %796 = icmp eq i32 %795, %677
  br i1 %796, label %797, label %678, !llvm.loop !14

797:                                              ; preds = %678, %673
  %798 = phi float [ undef, %673 ], [ %789, %678 ]
  %799 = phi float [ undef, %673 ], [ %793, %678 ]
  %800 = phi i32 [ 0, %673 ], [ %794, %678 ]
  %801 = phi float [ 0.000000e+00, %673 ], [ %793, %678 ]
  %802 = phi float [ 0.000000e+00, %673 ], [ %789, %678 ]
  %803 = icmp eq i32 %674, 0
  br i1 %803, label %825, label %804

804:                                              ; preds = %797, %804
  %805 = phi i32 [ %822, %804 ], [ %800, %797 ]
  %806 = phi float [ %821, %804 ], [ %801, %797 ]
  %807 = phi float [ %817, %804 ], [ %802, %797 ]
  %808 = phi i32 [ %823, %804 ], [ 0, %797 ]
  %809 = zext i32 %805 to i64
  %810 = getelementptr inbounds float, float* %148, i64 %809
  %811 = load float, float* %810, align 4, !tbaa !5
  %812 = sub i32 %152, %805
  %813 = add i32 %812, 96
  %814 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %813
  %815 = load float, float addrspace(3)* %814, align 4, !tbaa !5
  %816 = fmul contract float %811, %815
  %817 = fadd contract float %807, %816
  %818 = getelementptr inbounds float, float* %153, i64 %809
  %819 = load float, float* %818, align 4, !tbaa !5
  %820 = fmul contract float %815, %819
  %821 = fadd contract float %806, %820
  %822 = add nuw nsw i32 %805, 1
  %823 = add i32 %808, 1
  %824 = icmp eq i32 %823, %674
  br i1 %824, label %825, label %804, !llvm.loop !17

825:                                              ; preds = %797, %804, %672
  %826 = phi float [ 0.000000e+00, %672 ], [ %798, %797 ], [ %817, %804 ]
  %827 = phi float [ 0.000000e+00, %672 ], [ %799, %797 ], [ %821, %804 ]
  %828 = mul nsw i32 %2, 48
  %829 = sext i32 %828 to i64
  %830 = getelementptr inbounds float, float addrspace(1)* %30, i64 %829
  store float %826, float addrspace(1)* %830, align 4, !tbaa !5
  %831 = getelementptr inbounds float, float addrspace(1)* %31, i64 %829
  store float %827, float addrspace(1)* %831, align 4, !tbaa !5
  br label %832

832:                                              ; preds = %669, %825, %8
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11}
