; ModuleID = '../data/hip_kernels/15524/14/main.cu'
source_filename = "../data/hip_kernels/15524/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_lpd = protected addrspace(4) externally_initialized global float* null, align 8
@c_hpd = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_hpd to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_lpd to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11dwt_per_X_OPfiiiiiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 7
  %11 = shl i32 %5, 4
  %12 = sub i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add i32 %12, %13
  %15 = shl i32 %9, 6
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = shl i32 %17, 2
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %1
  br i1 %21, label %22, label %849

22:                                               ; preds = %8
  %23 = mul nsw i32 %20, %2
  %24 = add nsw i32 %14, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = mul nsw i32 %20, %3
  %28 = add nsw i32 %27, %16
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %6, i64 %29
  %31 = getelementptr inbounds float, float addrspace(1)* %7, i64 %29
  %32 = icmp sgt i32 %5, 0
  br i1 %32, label %36, label %33

33:                                               ; preds = %22
  %34 = shl i32 %5, 1
  %35 = add i32 %34, 8
  br label %74

36:                                               ; preds = %22
  %37 = add i32 %2, 1
  %38 = shl nuw i32 %5, 1
  %39 = add i32 %38, 8
  %40 = shl nuw nsw i32 %19, 4
  %41 = mul i32 %40, %39
  %42 = add nsw i32 %2, -1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %26, i64 %43
  %45 = and i32 %5, 3
  %46 = icmp ult i32 %5, 4
  br i1 %46, label %49, label %47

47:                                               ; preds = %36
  %48 = and i32 %5, -4
  br label %103

49:                                               ; preds = %167, %36
  %50 = phi i32 [ 0, %36 ], [ %173, %167 ]
  %51 = icmp eq i32 %45, 0
  br i1 %51, label %74, label %52

52:                                               ; preds = %49, %65
  %53 = phi i32 [ %71, %65 ], [ %50, %49 ]
  %54 = phi i32 [ %72, %65 ], [ 0, %49 ]
  %55 = shl nsw i32 %53, 4
  %56 = add nsw i32 %55, %14
  %57 = icmp eq i32 %56, -1
  br i1 %57, label %65, label %58

58:                                               ; preds = %52
  %59 = zext i32 %55 to i64
  %60 = add i32 %37, %55
  %61 = sext i32 %60 to i64
  %62 = icmp slt i32 %56, 0
  %63 = select i1 %62, i64 %61, i64 %59
  %64 = getelementptr inbounds float, float addrspace(1)* %26, i64 %63
  br label %65

65:                                               ; preds = %52, %58
  %66 = phi float addrspace(1)* [ %64, %58 ], [ %44, %52 ]
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5
  %68 = add nuw i32 %55, %13
  %69 = add i32 %68, %41
  %70 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %69
  store float %67, float addrspace(3)* %70, align 4, !tbaa !5
  %71 = add nuw nsw i32 %53, 1
  %72 = add nuw nsw i32 %54, 1
  %73 = icmp eq i32 %72, %45
  br i1 %73, label %74, label %52, !llvm.loop !9

74:                                               ; preds = %65, %49, %33
  %75 = phi i32 [ %35, %33 ], [ %39, %49 ], [ %39, %65 ]
  %76 = icmp sgt i32 %75, %5
  br i1 %76, label %80, label %77

77:                                               ; preds = %74
  %78 = mul i32 %75, %19
  %79 = shl i32 %78, 4
  br label %176

80:                                               ; preds = %74
  %81 = xor i32 %2, -1
  %82 = mul i32 %75, %19
  %83 = shl i32 %82, 4
  %84 = and i32 %5, 1
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %100, label %86

86:                                               ; preds = %80
  %87 = add i32 %10, %13
  %88 = icmp eq i32 %87, %2
  %89 = icmp slt i32 %87, %2
  %90 = select i1 %89, i32 0, i32 %81
  %91 = select i1 %88, i32 -1, i32 %90
  %92 = add i32 %11, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %26, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5
  %96 = add i32 %11, %13
  %97 = add i32 %96, %83
  %98 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %97
  store float %95, float addrspace(3)* %98, align 4, !tbaa !5
  %99 = add nsw i32 %5, 1
  br label %100

100:                                              ; preds = %86, %80
  %101 = phi i32 [ %5, %80 ], [ %99, %86 ]
  %102 = icmp eq i32 %5, -7
  br i1 %102, label %176, label %187

103:                                              ; preds = %167, %47
  %104 = phi i32 [ 0, %47 ], [ %173, %167 ]
  %105 = phi i32 [ 0, %47 ], [ %174, %167 ]
  %106 = shl nsw i32 %104, 4
  %107 = add nsw i32 %106, %14
  %108 = icmp eq i32 %107, -1
  br i1 %108, label %116, label %109

109:                                              ; preds = %103
  %110 = zext i32 %106 to i64
  %111 = add i32 %37, %106
  %112 = sext i32 %111 to i64
  %113 = icmp slt i32 %107, 0
  %114 = select i1 %113, i64 %112, i64 %110
  %115 = getelementptr inbounds float, float addrspace(1)* %26, i64 %114
  br label %116

116:                                              ; preds = %103, %109
  %117 = phi float addrspace(1)* [ %115, %109 ], [ %44, %103 ]
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5
  %119 = add nuw i32 %106, %13
  %120 = add i32 %119, %41
  %121 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %120
  store float %118, float addrspace(3)* %121, align 4, !tbaa !5
  %122 = shl i32 %104, 4
  %123 = or i32 %122, 16
  %124 = add nsw i32 %123, %14
  %125 = icmp eq i32 %124, -1
  br i1 %125, label %133, label %126

126:                                              ; preds = %116
  %127 = zext i32 %123 to i64
  %128 = add i32 %37, %123
  %129 = sext i32 %128 to i64
  %130 = icmp slt i32 %124, 0
  %131 = select i1 %130, i64 %129, i64 %127
  %132 = getelementptr inbounds float, float addrspace(1)* %26, i64 %131
  br label %133

133:                                              ; preds = %116, %126
  %134 = phi float addrspace(1)* [ %132, %126 ], [ %44, %116 ]
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5
  %136 = add nuw i32 %123, %13
  %137 = add i32 %136, %41
  %138 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %137
  store float %135, float addrspace(3)* %138, align 4, !tbaa !5
  %139 = shl i32 %104, 4
  %140 = or i32 %139, 32
  %141 = add nsw i32 %140, %14
  %142 = icmp eq i32 %141, -1
  br i1 %142, label %150, label %143

143:                                              ; preds = %133
  %144 = zext i32 %140 to i64
  %145 = add i32 %37, %140
  %146 = sext i32 %145 to i64
  %147 = icmp slt i32 %141, 0
  %148 = select i1 %147, i64 %146, i64 %144
  %149 = getelementptr inbounds float, float addrspace(1)* %26, i64 %148
  br label %150

150:                                              ; preds = %133, %143
  %151 = phi float addrspace(1)* [ %149, %143 ], [ %44, %133 ]
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !5
  %153 = add nuw i32 %140, %13
  %154 = add i32 %153, %41
  %155 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %154
  store float %152, float addrspace(3)* %155, align 4, !tbaa !5
  %156 = shl i32 %104, 4
  %157 = or i32 %156, 48
  %158 = add nsw i32 %157, %14
  %159 = icmp eq i32 %158, -1
  br i1 %159, label %167, label %160

160:                                              ; preds = %150
  %161 = zext i32 %157 to i64
  %162 = add i32 %37, %157
  %163 = sext i32 %162 to i64
  %164 = icmp slt i32 %158, 0
  %165 = select i1 %164, i64 %163, i64 %161
  %166 = getelementptr inbounds float, float addrspace(1)* %26, i64 %165
  br label %167

167:                                              ; preds = %150, %160
  %168 = phi float addrspace(1)* [ %166, %160 ], [ %44, %150 ]
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !5
  %170 = add nuw i32 %157, %13
  %171 = add i32 %170, %41
  %172 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %171
  store float %169, float addrspace(3)* %172, align 4, !tbaa !5
  %173 = add nuw nsw i32 %104, 4
  %174 = add i32 %105, 4
  %175 = icmp eq i32 %174, %48
  br i1 %175, label %49, label %103, !llvm.loop !11

176:                                              ; preds = %187, %100, %77
  %177 = phi i32 [ %79, %77 ], [ %83, %100 ], [ %83, %187 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %178 = sdiv i32 %4, 2
  %179 = icmp sgt i32 %4, 0
  %180 = load float*, float* addrspace(4)* @c_lpd, align 8
  %181 = shl nuw nsw i32 %13, 1
  %182 = add nsw i32 %178, %181
  %183 = add i32 %182, %11
  %184 = add i32 %183, %177
  %185 = load float*, float* addrspace(4)* @c_hpd, align 8
  %186 = icmp slt i32 %16, %3
  br i1 %186, label %219, label %366

187:                                              ; preds = %100, %187
  %188 = phi i32 [ %217, %187 ], [ %101, %100 ]
  %189 = shl nsw i32 %188, 4
  %190 = add nsw i32 %189, %14
  %191 = icmp eq i32 %190, %2
  %192 = icmp slt i32 %190, %2
  %193 = select i1 %192, i32 0, i32 %81
  %194 = select i1 %191, i32 -1, i32 %193
  %195 = add i32 %189, %194
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %26, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !5
  %199 = add i32 %189, %13
  %200 = add i32 %199, %83
  %201 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %200
  store float %198, float addrspace(3)* %201, align 4, !tbaa !5
  %202 = shl i32 %188, 4
  %203 = add i32 %202, 16
  %204 = add nsw i32 %203, %14
  %205 = icmp eq i32 %204, %2
  %206 = add nuw nsw i32 %202, 15
  %207 = icmp slt i32 %204, %2
  %208 = select i1 %207, i32 0, i32 %81
  %209 = add i32 %203, %208
  %210 = select i1 %205, i32 %206, i32 %209
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %26, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !5
  %214 = add i32 %203, %13
  %215 = add i32 %214, %83
  %216 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %215
  store float %213, float addrspace(3)* %216, align 4, !tbaa !5
  %217 = add nsw i32 %188, 2
  %218 = icmp eq i32 %217, %75
  br i1 %218, label %176, label %187, !llvm.loop !13

219:                                              ; preds = %176
  br i1 %179, label %220, label %252

220:                                              ; preds = %219
  %221 = and i32 %4, 7
  %222 = icmp ult i32 %4, 8
  br i1 %222, label %225, label %223

223:                                              ; preds = %220
  %224 = and i32 %4, -8
  br label %255

225:                                              ; preds = %255, %220
  %226 = phi float [ undef, %220 ], [ %358, %255 ]
  %227 = phi float [ undef, %220 ], [ %362, %255 ]
  %228 = phi i32 [ 0, %220 ], [ %363, %255 ]
  %229 = phi float [ 0.000000e+00, %220 ], [ %362, %255 ]
  %230 = phi float [ 0.000000e+00, %220 ], [ %358, %255 ]
  %231 = icmp eq i32 %221, 0
  br i1 %231, label %252, label %232

232:                                              ; preds = %225, %232
  %233 = phi i32 [ %249, %232 ], [ %228, %225 ]
  %234 = phi float [ %248, %232 ], [ %229, %225 ]
  %235 = phi float [ %244, %232 ], [ %230, %225 ]
  %236 = phi i32 [ %250, %232 ], [ 0, %225 ]
  %237 = zext i32 %233 to i64
  %238 = getelementptr inbounds float, float* %180, i64 %237
  %239 = load float, float* %238, align 4, !tbaa !5
  %240 = sub i32 %184, %233
  %241 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %240
  %242 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %243 = fmul contract float %239, %242
  %244 = fadd contract float %235, %243
  %245 = getelementptr inbounds float, float* %185, i64 %237
  %246 = load float, float* %245, align 4, !tbaa !5
  %247 = fmul contract float %242, %246
  %248 = fadd contract float %234, %247
  %249 = add nuw nsw i32 %233, 1
  %250 = add i32 %236, 1
  %251 = icmp eq i32 %250, %221
  br i1 %251, label %252, label %232, !llvm.loop !14

252:                                              ; preds = %225, %232, %219
  %253 = phi float [ 0.000000e+00, %219 ], [ %226, %225 ], [ %244, %232 ]
  %254 = phi float [ 0.000000e+00, %219 ], [ %227, %225 ], [ %248, %232 ]
  store float %253, float addrspace(1)* %30, align 4, !tbaa !5
  store float %254, float addrspace(1)* %31, align 4, !tbaa !5
  br label %366

255:                                              ; preds = %255, %223
  %256 = phi i32 [ 0, %223 ], [ %363, %255 ]
  %257 = phi float [ 0.000000e+00, %223 ], [ %362, %255 ]
  %258 = phi float [ 0.000000e+00, %223 ], [ %358, %255 ]
  %259 = phi i32 [ 0, %223 ], [ %364, %255 ]
  %260 = zext i32 %256 to i64
  %261 = getelementptr inbounds float, float* %180, i64 %260
  %262 = load float, float* %261, align 4, !tbaa !5
  %263 = sub i32 %184, %256
  %264 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %263
  %265 = load float, float addrspace(3)* %264, align 4, !tbaa !5
  %266 = fmul contract float %262, %265
  %267 = fadd contract float %258, %266
  %268 = getelementptr inbounds float, float* %185, i64 %260
  %269 = load float, float* %268, align 4, !tbaa !5
  %270 = fmul contract float %265, %269
  %271 = fadd contract float %257, %270
  %272 = or i32 %256, 1
  %273 = zext i32 %272 to i64
  %274 = getelementptr inbounds float, float* %180, i64 %273
  %275 = load float, float* %274, align 4, !tbaa !5
  %276 = sub i32 %184, %272
  %277 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %276
  %278 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %279 = fmul contract float %275, %278
  %280 = fadd contract float %267, %279
  %281 = getelementptr inbounds float, float* %185, i64 %273
  %282 = load float, float* %281, align 4, !tbaa !5
  %283 = fmul contract float %278, %282
  %284 = fadd contract float %271, %283
  %285 = or i32 %256, 2
  %286 = zext i32 %285 to i64
  %287 = getelementptr inbounds float, float* %180, i64 %286
  %288 = load float, float* %287, align 4, !tbaa !5
  %289 = sub i32 %184, %285
  %290 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %289
  %291 = load float, float addrspace(3)* %290, align 4, !tbaa !5
  %292 = fmul contract float %288, %291
  %293 = fadd contract float %280, %292
  %294 = getelementptr inbounds float, float* %185, i64 %286
  %295 = load float, float* %294, align 4, !tbaa !5
  %296 = fmul contract float %291, %295
  %297 = fadd contract float %284, %296
  %298 = or i32 %256, 3
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds float, float* %180, i64 %299
  %301 = load float, float* %300, align 4, !tbaa !5
  %302 = sub i32 %184, %298
  %303 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %302
  %304 = load float, float addrspace(3)* %303, align 4, !tbaa !5
  %305 = fmul contract float %301, %304
  %306 = fadd contract float %293, %305
  %307 = getelementptr inbounds float, float* %185, i64 %299
  %308 = load float, float* %307, align 4, !tbaa !5
  %309 = fmul contract float %304, %308
  %310 = fadd contract float %297, %309
  %311 = or i32 %256, 4
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds float, float* %180, i64 %312
  %314 = load float, float* %313, align 4, !tbaa !5
  %315 = sub i32 %184, %311
  %316 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %315
  %317 = load float, float addrspace(3)* %316, align 4, !tbaa !5
  %318 = fmul contract float %314, %317
  %319 = fadd contract float %306, %318
  %320 = getelementptr inbounds float, float* %185, i64 %312
  %321 = load float, float* %320, align 4, !tbaa !5
  %322 = fmul contract float %317, %321
  %323 = fadd contract float %310, %322
  %324 = or i32 %256, 5
  %325 = zext i32 %324 to i64
  %326 = getelementptr inbounds float, float* %180, i64 %325
  %327 = load float, float* %326, align 4, !tbaa !5
  %328 = sub i32 %184, %324
  %329 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %328
  %330 = load float, float addrspace(3)* %329, align 4, !tbaa !5
  %331 = fmul contract float %327, %330
  %332 = fadd contract float %319, %331
  %333 = getelementptr inbounds float, float* %185, i64 %325
  %334 = load float, float* %333, align 4, !tbaa !5
  %335 = fmul contract float %330, %334
  %336 = fadd contract float %323, %335
  %337 = or i32 %256, 6
  %338 = zext i32 %337 to i64
  %339 = getelementptr inbounds float, float* %180, i64 %338
  %340 = load float, float* %339, align 4, !tbaa !5
  %341 = sub i32 %184, %337
  %342 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %341
  %343 = load float, float addrspace(3)* %342, align 4, !tbaa !5
  %344 = fmul contract float %340, %343
  %345 = fadd contract float %332, %344
  %346 = getelementptr inbounds float, float* %185, i64 %338
  %347 = load float, float* %346, align 4, !tbaa !5
  %348 = fmul contract float %343, %347
  %349 = fadd contract float %336, %348
  %350 = or i32 %256, 7
  %351 = zext i32 %350 to i64
  %352 = getelementptr inbounds float, float* %180, i64 %351
  %353 = load float, float* %352, align 4, !tbaa !5
  %354 = sub i32 %184, %350
  %355 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %354
  %356 = load float, float addrspace(3)* %355, align 4, !tbaa !5
  %357 = fmul contract float %353, %356
  %358 = fadd contract float %345, %357
  %359 = getelementptr inbounds float, float* %185, i64 %351
  %360 = load float, float* %359, align 4, !tbaa !5
  %361 = fmul contract float %356, %360
  %362 = fadd contract float %349, %361
  %363 = add nuw nsw i32 %256, 8
  %364 = add i32 %259, 8
  %365 = icmp eq i32 %364, %224
  br i1 %365, label %225, label %255, !llvm.loop !15

366:                                              ; preds = %176, %252
  %367 = add nsw i32 %16, 16
  %368 = icmp slt i32 %367, %3
  br i1 %368, label %369, label %527

369:                                              ; preds = %366
  br i1 %179, label %370, label %522

370:                                              ; preds = %369
  %371 = and i32 %4, 7
  %372 = icmp ult i32 %4, 8
  br i1 %372, label %494, label %373

373:                                              ; preds = %370
  %374 = and i32 %4, -8
  br label %375

375:                                              ; preds = %375, %373
  %376 = phi i32 [ 0, %373 ], [ %491, %375 ]
  %377 = phi float [ 0.000000e+00, %373 ], [ %490, %375 ]
  %378 = phi float [ 0.000000e+00, %373 ], [ %486, %375 ]
  %379 = phi i32 [ 0, %373 ], [ %492, %375 ]
  %380 = zext i32 %376 to i64
  %381 = getelementptr inbounds float, float* %180, i64 %380
  %382 = load float, float* %381, align 4, !tbaa !5
  %383 = sub i32 %184, %376
  %384 = add i32 %383, 32
  %385 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %384
  %386 = load float, float addrspace(3)* %385, align 4, !tbaa !5
  %387 = fmul contract float %382, %386
  %388 = fadd contract float %378, %387
  %389 = getelementptr inbounds float, float* %185, i64 %380
  %390 = load float, float* %389, align 4, !tbaa !5
  %391 = fmul contract float %386, %390
  %392 = fadd contract float %377, %391
  %393 = or i32 %376, 1
  %394 = zext i32 %393 to i64
  %395 = getelementptr inbounds float, float* %180, i64 %394
  %396 = load float, float* %395, align 4, !tbaa !5
  %397 = sub i32 %184, %393
  %398 = add i32 %397, 32
  %399 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %398
  %400 = load float, float addrspace(3)* %399, align 4, !tbaa !5
  %401 = fmul contract float %396, %400
  %402 = fadd contract float %388, %401
  %403 = getelementptr inbounds float, float* %185, i64 %394
  %404 = load float, float* %403, align 4, !tbaa !5
  %405 = fmul contract float %400, %404
  %406 = fadd contract float %392, %405
  %407 = or i32 %376, 2
  %408 = zext i32 %407 to i64
  %409 = getelementptr inbounds float, float* %180, i64 %408
  %410 = load float, float* %409, align 4, !tbaa !5
  %411 = sub i32 %184, %407
  %412 = add i32 %411, 32
  %413 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %412
  %414 = load float, float addrspace(3)* %413, align 4, !tbaa !5
  %415 = fmul contract float %410, %414
  %416 = fadd contract float %402, %415
  %417 = getelementptr inbounds float, float* %185, i64 %408
  %418 = load float, float* %417, align 4, !tbaa !5
  %419 = fmul contract float %414, %418
  %420 = fadd contract float %406, %419
  %421 = or i32 %376, 3
  %422 = zext i32 %421 to i64
  %423 = getelementptr inbounds float, float* %180, i64 %422
  %424 = load float, float* %423, align 4, !tbaa !5
  %425 = sub i32 %184, %421
  %426 = add i32 %425, 32
  %427 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %426
  %428 = load float, float addrspace(3)* %427, align 4, !tbaa !5
  %429 = fmul contract float %424, %428
  %430 = fadd contract float %416, %429
  %431 = getelementptr inbounds float, float* %185, i64 %422
  %432 = load float, float* %431, align 4, !tbaa !5
  %433 = fmul contract float %428, %432
  %434 = fadd contract float %420, %433
  %435 = or i32 %376, 4
  %436 = zext i32 %435 to i64
  %437 = getelementptr inbounds float, float* %180, i64 %436
  %438 = load float, float* %437, align 4, !tbaa !5
  %439 = sub i32 %184, %435
  %440 = add i32 %439, 32
  %441 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %440
  %442 = load float, float addrspace(3)* %441, align 4, !tbaa !5
  %443 = fmul contract float %438, %442
  %444 = fadd contract float %430, %443
  %445 = getelementptr inbounds float, float* %185, i64 %436
  %446 = load float, float* %445, align 4, !tbaa !5
  %447 = fmul contract float %442, %446
  %448 = fadd contract float %434, %447
  %449 = or i32 %376, 5
  %450 = zext i32 %449 to i64
  %451 = getelementptr inbounds float, float* %180, i64 %450
  %452 = load float, float* %451, align 4, !tbaa !5
  %453 = sub i32 %184, %449
  %454 = add i32 %453, 32
  %455 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %454
  %456 = load float, float addrspace(3)* %455, align 4, !tbaa !5
  %457 = fmul contract float %452, %456
  %458 = fadd contract float %444, %457
  %459 = getelementptr inbounds float, float* %185, i64 %450
  %460 = load float, float* %459, align 4, !tbaa !5
  %461 = fmul contract float %456, %460
  %462 = fadd contract float %448, %461
  %463 = or i32 %376, 6
  %464 = zext i32 %463 to i64
  %465 = getelementptr inbounds float, float* %180, i64 %464
  %466 = load float, float* %465, align 4, !tbaa !5
  %467 = sub i32 %184, %463
  %468 = add i32 %467, 32
  %469 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %468
  %470 = load float, float addrspace(3)* %469, align 4, !tbaa !5
  %471 = fmul contract float %466, %470
  %472 = fadd contract float %458, %471
  %473 = getelementptr inbounds float, float* %185, i64 %464
  %474 = load float, float* %473, align 4, !tbaa !5
  %475 = fmul contract float %470, %474
  %476 = fadd contract float %462, %475
  %477 = or i32 %376, 7
  %478 = zext i32 %477 to i64
  %479 = getelementptr inbounds float, float* %180, i64 %478
  %480 = load float, float* %479, align 4, !tbaa !5
  %481 = sub i32 %184, %477
  %482 = add i32 %481, 32
  %483 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %482
  %484 = load float, float addrspace(3)* %483, align 4, !tbaa !5
  %485 = fmul contract float %480, %484
  %486 = fadd contract float %472, %485
  %487 = getelementptr inbounds float, float* %185, i64 %478
  %488 = load float, float* %487, align 4, !tbaa !5
  %489 = fmul contract float %484, %488
  %490 = fadd contract float %476, %489
  %491 = add nuw nsw i32 %376, 8
  %492 = add i32 %379, 8
  %493 = icmp eq i32 %492, %374
  br i1 %493, label %494, label %375, !llvm.loop !15

494:                                              ; preds = %375, %370
  %495 = phi float [ undef, %370 ], [ %486, %375 ]
  %496 = phi float [ undef, %370 ], [ %490, %375 ]
  %497 = phi i32 [ 0, %370 ], [ %491, %375 ]
  %498 = phi float [ 0.000000e+00, %370 ], [ %490, %375 ]
  %499 = phi float [ 0.000000e+00, %370 ], [ %486, %375 ]
  %500 = icmp eq i32 %371, 0
  br i1 %500, label %522, label %501

501:                                              ; preds = %494, %501
  %502 = phi i32 [ %519, %501 ], [ %497, %494 ]
  %503 = phi float [ %518, %501 ], [ %498, %494 ]
  %504 = phi float [ %514, %501 ], [ %499, %494 ]
  %505 = phi i32 [ %520, %501 ], [ 0, %494 ]
  %506 = zext i32 %502 to i64
  %507 = getelementptr inbounds float, float* %180, i64 %506
  %508 = load float, float* %507, align 4, !tbaa !5
  %509 = sub i32 %184, %502
  %510 = add i32 %509, 32
  %511 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %510
  %512 = load float, float addrspace(3)* %511, align 4, !tbaa !5
  %513 = fmul contract float %508, %512
  %514 = fadd contract float %504, %513
  %515 = getelementptr inbounds float, float* %185, i64 %506
  %516 = load float, float* %515, align 4, !tbaa !5
  %517 = fmul contract float %512, %516
  %518 = fadd contract float %503, %517
  %519 = add nuw nsw i32 %502, 1
  %520 = add i32 %505, 1
  %521 = icmp eq i32 %520, %371
  br i1 %521, label %522, label %501, !llvm.loop !16

522:                                              ; preds = %494, %501, %369
  %523 = phi float [ 0.000000e+00, %369 ], [ %495, %494 ], [ %514, %501 ]
  %524 = phi float [ 0.000000e+00, %369 ], [ %496, %494 ], [ %518, %501 ]
  %525 = getelementptr inbounds float, float addrspace(1)* %30, i64 16
  store float %523, float addrspace(1)* %525, align 4, !tbaa !5
  %526 = getelementptr inbounds float, float addrspace(1)* %31, i64 16
  store float %524, float addrspace(1)* %526, align 4, !tbaa !5
  br label %527

527:                                              ; preds = %522, %366
  %528 = add nsw i32 %16, 32
  %529 = icmp slt i32 %528, %3
  br i1 %529, label %530, label %688

530:                                              ; preds = %527
  br i1 %179, label %531, label %683

531:                                              ; preds = %530
  %532 = and i32 %4, 7
  %533 = icmp ult i32 %4, 8
  br i1 %533, label %655, label %534

534:                                              ; preds = %531
  %535 = and i32 %4, -8
  br label %536

536:                                              ; preds = %536, %534
  %537 = phi i32 [ 0, %534 ], [ %652, %536 ]
  %538 = phi float [ 0.000000e+00, %534 ], [ %651, %536 ]
  %539 = phi float [ 0.000000e+00, %534 ], [ %647, %536 ]
  %540 = phi i32 [ 0, %534 ], [ %653, %536 ]
  %541 = zext i32 %537 to i64
  %542 = getelementptr inbounds float, float* %180, i64 %541
  %543 = load float, float* %542, align 4, !tbaa !5
  %544 = sub i32 %184, %537
  %545 = add i32 %544, 64
  %546 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %545
  %547 = load float, float addrspace(3)* %546, align 4, !tbaa !5
  %548 = fmul contract float %543, %547
  %549 = fadd contract float %539, %548
  %550 = getelementptr inbounds float, float* %185, i64 %541
  %551 = load float, float* %550, align 4, !tbaa !5
  %552 = fmul contract float %547, %551
  %553 = fadd contract float %538, %552
  %554 = or i32 %537, 1
  %555 = zext i32 %554 to i64
  %556 = getelementptr inbounds float, float* %180, i64 %555
  %557 = load float, float* %556, align 4, !tbaa !5
  %558 = sub i32 %184, %554
  %559 = add i32 %558, 64
  %560 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %559
  %561 = load float, float addrspace(3)* %560, align 4, !tbaa !5
  %562 = fmul contract float %557, %561
  %563 = fadd contract float %549, %562
  %564 = getelementptr inbounds float, float* %185, i64 %555
  %565 = load float, float* %564, align 4, !tbaa !5
  %566 = fmul contract float %561, %565
  %567 = fadd contract float %553, %566
  %568 = or i32 %537, 2
  %569 = zext i32 %568 to i64
  %570 = getelementptr inbounds float, float* %180, i64 %569
  %571 = load float, float* %570, align 4, !tbaa !5
  %572 = sub i32 %184, %568
  %573 = add i32 %572, 64
  %574 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %573
  %575 = load float, float addrspace(3)* %574, align 4, !tbaa !5
  %576 = fmul contract float %571, %575
  %577 = fadd contract float %563, %576
  %578 = getelementptr inbounds float, float* %185, i64 %569
  %579 = load float, float* %578, align 4, !tbaa !5
  %580 = fmul contract float %575, %579
  %581 = fadd contract float %567, %580
  %582 = or i32 %537, 3
  %583 = zext i32 %582 to i64
  %584 = getelementptr inbounds float, float* %180, i64 %583
  %585 = load float, float* %584, align 4, !tbaa !5
  %586 = sub i32 %184, %582
  %587 = add i32 %586, 64
  %588 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %587
  %589 = load float, float addrspace(3)* %588, align 4, !tbaa !5
  %590 = fmul contract float %585, %589
  %591 = fadd contract float %577, %590
  %592 = getelementptr inbounds float, float* %185, i64 %583
  %593 = load float, float* %592, align 4, !tbaa !5
  %594 = fmul contract float %589, %593
  %595 = fadd contract float %581, %594
  %596 = or i32 %537, 4
  %597 = zext i32 %596 to i64
  %598 = getelementptr inbounds float, float* %180, i64 %597
  %599 = load float, float* %598, align 4, !tbaa !5
  %600 = sub i32 %184, %596
  %601 = add i32 %600, 64
  %602 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %601
  %603 = load float, float addrspace(3)* %602, align 4, !tbaa !5
  %604 = fmul contract float %599, %603
  %605 = fadd contract float %591, %604
  %606 = getelementptr inbounds float, float* %185, i64 %597
  %607 = load float, float* %606, align 4, !tbaa !5
  %608 = fmul contract float %603, %607
  %609 = fadd contract float %595, %608
  %610 = or i32 %537, 5
  %611 = zext i32 %610 to i64
  %612 = getelementptr inbounds float, float* %180, i64 %611
  %613 = load float, float* %612, align 4, !tbaa !5
  %614 = sub i32 %184, %610
  %615 = add i32 %614, 64
  %616 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %615
  %617 = load float, float addrspace(3)* %616, align 4, !tbaa !5
  %618 = fmul contract float %613, %617
  %619 = fadd contract float %605, %618
  %620 = getelementptr inbounds float, float* %185, i64 %611
  %621 = load float, float* %620, align 4, !tbaa !5
  %622 = fmul contract float %617, %621
  %623 = fadd contract float %609, %622
  %624 = or i32 %537, 6
  %625 = zext i32 %624 to i64
  %626 = getelementptr inbounds float, float* %180, i64 %625
  %627 = load float, float* %626, align 4, !tbaa !5
  %628 = sub i32 %184, %624
  %629 = add i32 %628, 64
  %630 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %629
  %631 = load float, float addrspace(3)* %630, align 4, !tbaa !5
  %632 = fmul contract float %627, %631
  %633 = fadd contract float %619, %632
  %634 = getelementptr inbounds float, float* %185, i64 %625
  %635 = load float, float* %634, align 4, !tbaa !5
  %636 = fmul contract float %631, %635
  %637 = fadd contract float %623, %636
  %638 = or i32 %537, 7
  %639 = zext i32 %638 to i64
  %640 = getelementptr inbounds float, float* %180, i64 %639
  %641 = load float, float* %640, align 4, !tbaa !5
  %642 = sub i32 %184, %638
  %643 = add i32 %642, 64
  %644 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %643
  %645 = load float, float addrspace(3)* %644, align 4, !tbaa !5
  %646 = fmul contract float %641, %645
  %647 = fadd contract float %633, %646
  %648 = getelementptr inbounds float, float* %185, i64 %639
  %649 = load float, float* %648, align 4, !tbaa !5
  %650 = fmul contract float %645, %649
  %651 = fadd contract float %637, %650
  %652 = add nuw nsw i32 %537, 8
  %653 = add i32 %540, 8
  %654 = icmp eq i32 %653, %535
  br i1 %654, label %655, label %536, !llvm.loop !15

655:                                              ; preds = %536, %531
  %656 = phi float [ undef, %531 ], [ %647, %536 ]
  %657 = phi float [ undef, %531 ], [ %651, %536 ]
  %658 = phi i32 [ 0, %531 ], [ %652, %536 ]
  %659 = phi float [ 0.000000e+00, %531 ], [ %651, %536 ]
  %660 = phi float [ 0.000000e+00, %531 ], [ %647, %536 ]
  %661 = icmp eq i32 %532, 0
  br i1 %661, label %683, label %662

662:                                              ; preds = %655, %662
  %663 = phi i32 [ %680, %662 ], [ %658, %655 ]
  %664 = phi float [ %679, %662 ], [ %659, %655 ]
  %665 = phi float [ %675, %662 ], [ %660, %655 ]
  %666 = phi i32 [ %681, %662 ], [ 0, %655 ]
  %667 = zext i32 %663 to i64
  %668 = getelementptr inbounds float, float* %180, i64 %667
  %669 = load float, float* %668, align 4, !tbaa !5
  %670 = sub i32 %184, %663
  %671 = add i32 %670, 64
  %672 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %671
  %673 = load float, float addrspace(3)* %672, align 4, !tbaa !5
  %674 = fmul contract float %669, %673
  %675 = fadd contract float %665, %674
  %676 = getelementptr inbounds float, float* %185, i64 %667
  %677 = load float, float* %676, align 4, !tbaa !5
  %678 = fmul contract float %673, %677
  %679 = fadd contract float %664, %678
  %680 = add nuw nsw i32 %663, 1
  %681 = add i32 %666, 1
  %682 = icmp eq i32 %681, %532
  br i1 %682, label %683, label %662, !llvm.loop !17

683:                                              ; preds = %655, %662, %530
  %684 = phi float [ 0.000000e+00, %530 ], [ %656, %655 ], [ %675, %662 ]
  %685 = phi float [ 0.000000e+00, %530 ], [ %657, %655 ], [ %679, %662 ]
  %686 = getelementptr inbounds float, float addrspace(1)* %30, i64 32
  store float %684, float addrspace(1)* %686, align 4, !tbaa !5
  %687 = getelementptr inbounds float, float addrspace(1)* %31, i64 32
  store float %685, float addrspace(1)* %687, align 4, !tbaa !5
  br label %688

688:                                              ; preds = %683, %527
  %689 = add nsw i32 %16, 48
  %690 = icmp slt i32 %689, %3
  br i1 %690, label %691, label %849

691:                                              ; preds = %688
  br i1 %179, label %692, label %844

692:                                              ; preds = %691
  %693 = and i32 %4, 7
  %694 = icmp ult i32 %4, 8
  br i1 %694, label %816, label %695

695:                                              ; preds = %692
  %696 = and i32 %4, -8
  br label %697

697:                                              ; preds = %697, %695
  %698 = phi i32 [ 0, %695 ], [ %813, %697 ]
  %699 = phi float [ 0.000000e+00, %695 ], [ %812, %697 ]
  %700 = phi float [ 0.000000e+00, %695 ], [ %808, %697 ]
  %701 = phi i32 [ 0, %695 ], [ %814, %697 ]
  %702 = zext i32 %698 to i64
  %703 = getelementptr inbounds float, float* %180, i64 %702
  %704 = load float, float* %703, align 4, !tbaa !5
  %705 = sub i32 %184, %698
  %706 = add i32 %705, 96
  %707 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %706
  %708 = load float, float addrspace(3)* %707, align 4, !tbaa !5
  %709 = fmul contract float %704, %708
  %710 = fadd contract float %700, %709
  %711 = getelementptr inbounds float, float* %185, i64 %702
  %712 = load float, float* %711, align 4, !tbaa !5
  %713 = fmul contract float %708, %712
  %714 = fadd contract float %699, %713
  %715 = or i32 %698, 1
  %716 = zext i32 %715 to i64
  %717 = getelementptr inbounds float, float* %180, i64 %716
  %718 = load float, float* %717, align 4, !tbaa !5
  %719 = sub i32 %184, %715
  %720 = add i32 %719, 96
  %721 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %720
  %722 = load float, float addrspace(3)* %721, align 4, !tbaa !5
  %723 = fmul contract float %718, %722
  %724 = fadd contract float %710, %723
  %725 = getelementptr inbounds float, float* %185, i64 %716
  %726 = load float, float* %725, align 4, !tbaa !5
  %727 = fmul contract float %722, %726
  %728 = fadd contract float %714, %727
  %729 = or i32 %698, 2
  %730 = zext i32 %729 to i64
  %731 = getelementptr inbounds float, float* %180, i64 %730
  %732 = load float, float* %731, align 4, !tbaa !5
  %733 = sub i32 %184, %729
  %734 = add i32 %733, 96
  %735 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %734
  %736 = load float, float addrspace(3)* %735, align 4, !tbaa !5
  %737 = fmul contract float %732, %736
  %738 = fadd contract float %724, %737
  %739 = getelementptr inbounds float, float* %185, i64 %730
  %740 = load float, float* %739, align 4, !tbaa !5
  %741 = fmul contract float %736, %740
  %742 = fadd contract float %728, %741
  %743 = or i32 %698, 3
  %744 = zext i32 %743 to i64
  %745 = getelementptr inbounds float, float* %180, i64 %744
  %746 = load float, float* %745, align 4, !tbaa !5
  %747 = sub i32 %184, %743
  %748 = add i32 %747, 96
  %749 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %748
  %750 = load float, float addrspace(3)* %749, align 4, !tbaa !5
  %751 = fmul contract float %746, %750
  %752 = fadd contract float %738, %751
  %753 = getelementptr inbounds float, float* %185, i64 %744
  %754 = load float, float* %753, align 4, !tbaa !5
  %755 = fmul contract float %750, %754
  %756 = fadd contract float %742, %755
  %757 = or i32 %698, 4
  %758 = zext i32 %757 to i64
  %759 = getelementptr inbounds float, float* %180, i64 %758
  %760 = load float, float* %759, align 4, !tbaa !5
  %761 = sub i32 %184, %757
  %762 = add i32 %761, 96
  %763 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %762
  %764 = load float, float addrspace(3)* %763, align 4, !tbaa !5
  %765 = fmul contract float %760, %764
  %766 = fadd contract float %752, %765
  %767 = getelementptr inbounds float, float* %185, i64 %758
  %768 = load float, float* %767, align 4, !tbaa !5
  %769 = fmul contract float %764, %768
  %770 = fadd contract float %756, %769
  %771 = or i32 %698, 5
  %772 = zext i32 %771 to i64
  %773 = getelementptr inbounds float, float* %180, i64 %772
  %774 = load float, float* %773, align 4, !tbaa !5
  %775 = sub i32 %184, %771
  %776 = add i32 %775, 96
  %777 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %776
  %778 = load float, float addrspace(3)* %777, align 4, !tbaa !5
  %779 = fmul contract float %774, %778
  %780 = fadd contract float %766, %779
  %781 = getelementptr inbounds float, float* %185, i64 %772
  %782 = load float, float* %781, align 4, !tbaa !5
  %783 = fmul contract float %778, %782
  %784 = fadd contract float %770, %783
  %785 = or i32 %698, 6
  %786 = zext i32 %785 to i64
  %787 = getelementptr inbounds float, float* %180, i64 %786
  %788 = load float, float* %787, align 4, !tbaa !5
  %789 = sub i32 %184, %785
  %790 = add i32 %789, 96
  %791 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %790
  %792 = load float, float addrspace(3)* %791, align 4, !tbaa !5
  %793 = fmul contract float %788, %792
  %794 = fadd contract float %780, %793
  %795 = getelementptr inbounds float, float* %185, i64 %786
  %796 = load float, float* %795, align 4, !tbaa !5
  %797 = fmul contract float %792, %796
  %798 = fadd contract float %784, %797
  %799 = or i32 %698, 7
  %800 = zext i32 %799 to i64
  %801 = getelementptr inbounds float, float* %180, i64 %800
  %802 = load float, float* %801, align 4, !tbaa !5
  %803 = sub i32 %184, %799
  %804 = add i32 %803, 96
  %805 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %804
  %806 = load float, float addrspace(3)* %805, align 4, !tbaa !5
  %807 = fmul contract float %802, %806
  %808 = fadd contract float %794, %807
  %809 = getelementptr inbounds float, float* %185, i64 %800
  %810 = load float, float* %809, align 4, !tbaa !5
  %811 = fmul contract float %806, %810
  %812 = fadd contract float %798, %811
  %813 = add nuw nsw i32 %698, 8
  %814 = add i32 %701, 8
  %815 = icmp eq i32 %814, %696
  br i1 %815, label %816, label %697, !llvm.loop !15

816:                                              ; preds = %697, %692
  %817 = phi float [ undef, %692 ], [ %808, %697 ]
  %818 = phi float [ undef, %692 ], [ %812, %697 ]
  %819 = phi i32 [ 0, %692 ], [ %813, %697 ]
  %820 = phi float [ 0.000000e+00, %692 ], [ %812, %697 ]
  %821 = phi float [ 0.000000e+00, %692 ], [ %808, %697 ]
  %822 = icmp eq i32 %693, 0
  br i1 %822, label %844, label %823

823:                                              ; preds = %816, %823
  %824 = phi i32 [ %841, %823 ], [ %819, %816 ]
  %825 = phi float [ %840, %823 ], [ %820, %816 ]
  %826 = phi float [ %836, %823 ], [ %821, %816 ]
  %827 = phi i32 [ %842, %823 ], [ 0, %816 ]
  %828 = zext i32 %824 to i64
  %829 = getelementptr inbounds float, float* %180, i64 %828
  %830 = load float, float* %829, align 4, !tbaa !5
  %831 = sub i32 %184, %824
  %832 = add i32 %831, 96
  %833 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %832
  %834 = load float, float addrspace(3)* %833, align 4, !tbaa !5
  %835 = fmul contract float %830, %834
  %836 = fadd contract float %826, %835
  %837 = getelementptr inbounds float, float* %185, i64 %828
  %838 = load float, float* %837, align 4, !tbaa !5
  %839 = fmul contract float %834, %838
  %840 = fadd contract float %825, %839
  %841 = add nuw nsw i32 %824, 1
  %842 = add i32 %827, 1
  %843 = icmp eq i32 %842, %693
  br i1 %843, label %844, label %823, !llvm.loop !18

844:                                              ; preds = %816, %823, %691
  %845 = phi float [ 0.000000e+00, %691 ], [ %817, %816 ], [ %836, %823 ]
  %846 = phi float [ 0.000000e+00, %691 ], [ %818, %816 ], [ %840, %823 ]
  %847 = getelementptr inbounds float, float addrspace(1)* %30, i64 48
  store float %845, float addrspace(1)* %847, align 4, !tbaa !5
  %848 = getelementptr inbounds float, float addrspace(1)* %31, i64 48
  store float %846, float addrspace(1)* %848, align 4, !tbaa !5
  br label %849

849:                                              ; preds = %688, %844, %8
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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12, !10}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !10}
