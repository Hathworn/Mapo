; ModuleID = '../data/hip_kernels/15524/16/main.cu'
source_filename = "../data/hip_kernels/15524/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_lpd = protected addrspace(4) externally_initialized global float* null, align 8
@c_hpd = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_hpd to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_lpd to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9dwt_per_YPfiiiiiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
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
  br i1 %21, label %22, label %1091

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
  %32 = and i32 %1, -2147483647
  %33 = icmp eq i32 %32, 1
  %34 = icmp sgt i32 %5, 0
  br i1 %33, label %46, label %35

35:                                               ; preds = %22
  %36 = shl i32 %5, 1
  %37 = add i32 %36, 8
  br i1 %34, label %38, label %221

38:                                               ; preds = %35
  %39 = shl nuw nsw i32 %11, 4
  %40 = mul i32 %39, %37
  %41 = add i32 %40, %17
  %42 = and i32 %5, 7
  %43 = icmp ult i32 %5, 8
  br i1 %43, label %201, label %44

44:                                               ; preds = %38
  %45 = and i32 %5, -8
  br label %249

46:                                               ; preds = %22
  br i1 %34, label %50, label %47

47:                                               ; preds = %46
  %48 = shl i32 %5, 1
  %49 = add i32 %48, 8
  br label %85

50:                                               ; preds = %46
  %51 = add nuw nsw i32 %1, 1
  %52 = shl nuw i32 %5, 1
  %53 = add i32 %52, 8
  %54 = shl nuw nsw i32 %11, 4
  %55 = mul i32 %54, %53
  %56 = add nsw i32 %1, -1
  %57 = mul nsw i32 %56, %2
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %26, i64 %58
  %60 = and i32 %5, 1
  %61 = icmp eq i32 %5, 1
  br i1 %61, label %64, label %62

62:                                               ; preds = %50
  %63 = and i32 %5, -2
  br label %118

64:                                               ; preds = %150, %50
  %65 = phi i32 [ 0, %50 ], [ %156, %150 ]
  %66 = icmp eq i32 %60, 0
  br i1 %66, label %85, label %67

67:                                               ; preds = %64
  %68 = shl nsw i32 %65, 4
  %69 = add nsw i32 %68, %18
  %70 = icmp eq i32 %69, -1
  br i1 %70, label %79, label %71

71:                                               ; preds = %67
  %72 = mul i32 %65, -16
  %73 = icmp slt i32 %18, %72
  %74 = select i1 %73, i32 %51, i32 0
  %75 = add i32 %74, %68
  %76 = mul i32 %75, %2
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %26, i64 %77
  br label %79

79:                                               ; preds = %67, %71
  %80 = phi float addrspace(1)* [ %78, %71 ], [ %59, %67 ]
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = add nuw i32 %68, %17
  %83 = add i32 %82, %55
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %83
  store float %81, float addrspace(3)* %84, align 4, !tbaa !5
  br label %85

85:                                               ; preds = %79, %64, %47
  %86 = phi i32 [ %49, %47 ], [ %53, %64 ], [ %53, %79 ]
  %87 = icmp sgt i32 %86, %5
  br i1 %87, label %88, label %159

88:                                               ; preds = %85
  %89 = sub nsw i32 %1, %18
  %90 = xor i32 %1, -1
  %91 = mul i32 %86, %11
  %92 = shl i32 %91, 4
  %93 = add nsw i32 %2, -1
  %94 = and i32 %5, 1
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %115, label %96

96:                                               ; preds = %88
  %97 = add i32 %14, %17
  %98 = icmp eq i32 %97, %1
  br i1 %98, label %104, label %99

99:                                               ; preds = %96
  %100 = icmp sgt i32 %89, %15
  %101 = select i1 %100, i32 0, i32 %90
  %102 = add i32 %101, %15
  %103 = mul i32 %102, %2
  br label %106

104:                                              ; preds = %96
  %105 = mul nsw i32 %15, %93
  br label %106

106:                                              ; preds = %104, %99
  %107 = phi i32 [ %105, %104 ], [ %103, %99 ]
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %26, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5
  %111 = add i32 %15, %17
  %112 = add i32 %111, %92
  %113 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %112
  store float %110, float addrspace(3)* %113, align 4, !tbaa !5
  %114 = add nsw i32 %5, 1
  br label %115

115:                                              ; preds = %106, %88
  %116 = phi i32 [ %5, %88 ], [ %114, %106 ]
  %117 = icmp eq i32 %5, -7
  br i1 %117, label %159, label %160

118:                                              ; preds = %150, %62
  %119 = phi i32 [ 0, %62 ], [ %156, %150 ]
  %120 = phi i32 [ 0, %62 ], [ %157, %150 ]
  %121 = shl nsw i32 %119, 4
  %122 = add nsw i32 %121, %18
  %123 = icmp eq i32 %122, -1
  br i1 %123, label %132, label %124

124:                                              ; preds = %118
  %125 = mul i32 %119, -16
  %126 = icmp slt i32 %18, %125
  %127 = select i1 %126, i32 %51, i32 0
  %128 = add i32 %127, %121
  %129 = mul i32 %128, %2
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %26, i64 %130
  br label %132

132:                                              ; preds = %118, %124
  %133 = phi float addrspace(1)* [ %131, %124 ], [ %59, %118 ]
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5
  %135 = add nuw i32 %121, %17
  %136 = add i32 %135, %55
  %137 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %136
  store float %134, float addrspace(3)* %137, align 4, !tbaa !5
  %138 = or i32 %119, 1
  %139 = shl nsw i32 %138, 4
  %140 = add nsw i32 %139, %18
  %141 = icmp eq i32 %140, -1
  br i1 %141, label %150, label %142

142:                                              ; preds = %132
  %143 = mul i32 %138, -16
  %144 = icmp slt i32 %18, %143
  %145 = select i1 %144, i32 %51, i32 0
  %146 = add i32 %145, %139
  %147 = mul i32 %146, %2
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %26, i64 %148
  br label %150

150:                                              ; preds = %132, %142
  %151 = phi float addrspace(1)* [ %149, %142 ], [ %59, %132 ]
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !5
  %153 = add nuw i32 %139, %17
  %154 = add i32 %153, %55
  %155 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %154
  store float %152, float addrspace(3)* %155, align 4, !tbaa !5
  %156 = add nuw nsw i32 %119, 2
  %157 = add i32 %120, 2
  %158 = icmp eq i32 %157, %63
  br i1 %158, label %64, label %118, !llvm.loop !9

159:                                              ; preds = %191, %115, %85
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %442

160:                                              ; preds = %115, %191
  %161 = phi i32 [ %199, %191 ], [ %116, %115 ]
  %162 = shl nsw i32 %161, 4
  %163 = add nsw i32 %162, %18
  %164 = icmp eq i32 %163, %1
  br i1 %164, label %165, label %167

165:                                              ; preds = %160
  %166 = mul nsw i32 %162, %93
  br label %172

167:                                              ; preds = %160
  %168 = icmp sgt i32 %89, %162
  %169 = select i1 %168, i32 0, i32 %90
  %170 = add i32 %169, %162
  %171 = mul i32 %170, %2
  br label %172

172:                                              ; preds = %165, %167
  %173 = phi i32 [ %166, %165 ], [ %171, %167 ]
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %26, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !5
  %177 = add i32 %162, %17
  %178 = add i32 %177, %92
  %179 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %178
  store float %176, float addrspace(3)* %179, align 4, !tbaa !5
  %180 = shl i32 %161, 4
  %181 = add i32 %180, 16
  %182 = add nsw i32 %181, %18
  %183 = icmp eq i32 %182, %1
  br i1 %183, label %189, label %184

184:                                              ; preds = %172
  %185 = icmp sgt i32 %89, %181
  %186 = select i1 %185, i32 0, i32 %90
  %187 = add i32 %186, %181
  %188 = mul i32 %187, %2
  br label %191

189:                                              ; preds = %172
  %190 = mul nsw i32 %181, %93
  br label %191

191:                                              ; preds = %189, %184
  %192 = phi i32 [ %190, %189 ], [ %188, %184 ]
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %26, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !5
  %196 = add i32 %181, %17
  %197 = add i32 %196, %92
  %198 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %197
  store float %195, float addrspace(3)* %198, align 4, !tbaa !5
  %199 = add nsw i32 %161, 2
  %200 = icmp eq i32 %199, %86
  br i1 %200, label %159, label %160, !llvm.loop !12

201:                                              ; preds = %249, %38
  %202 = phi i32 [ 0, %38 ], [ %347, %249 ]
  %203 = icmp eq i32 %42, 0
  br i1 %203, label %221, label %204

204:                                              ; preds = %201, %204
  %205 = phi i32 [ %218, %204 ], [ %202, %201 ]
  %206 = phi i32 [ %219, %204 ], [ 0, %201 ]
  %207 = mul i32 %205, -16
  %208 = icmp slt i32 %18, %207
  %209 = shl nsw i32 %205, 4
  %210 = select i1 %208, i32 %1, i32 0
  %211 = add i32 %210, %209
  %212 = mul i32 %211, %2
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds float, float addrspace(1)* %26, i64 %213
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !5, !amdgpu.noclobber !13
  %216 = add i32 %41, %209
  %217 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %216
  store float %215, float addrspace(3)* %217, align 4, !tbaa !5
  %218 = add nuw nsw i32 %205, 1
  %219 = add nuw nsw i32 %206, 1
  %220 = icmp eq i32 %219, %42
  br i1 %220, label %221, label %204, !llvm.loop !14

221:                                              ; preds = %204, %201, %35
  %222 = icmp sgt i32 %37, %5
  br i1 %222, label %223, label %350

223:                                              ; preds = %221
  %224 = sub nsw i32 %1, %18
  %225 = shl nuw nsw i32 %11, 4
  %226 = mul i32 %225, %37
  %227 = add i32 %226, %17
  %228 = and i32 %5, 7
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %246, label %230

230:                                              ; preds = %223, %230
  %231 = phi i32 [ %243, %230 ], [ %5, %223 ]
  %232 = phi i32 [ %244, %230 ], [ 0, %223 ]
  %233 = shl nsw i32 %231, 4
  %234 = icmp sgt i32 %224, %233
  %235 = select i1 %234, i32 0, i32 %1
  %236 = sub i32 %233, %235
  %237 = mul i32 %236, %2
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %26, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !5, !amdgpu.noclobber !13
  %241 = add i32 %227, %233
  %242 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %241
  store float %240, float addrspace(3)* %242, align 4, !tbaa !5
  %243 = add nsw i32 %231, 1
  %244 = add nuw nsw i32 %232, 1
  %245 = icmp eq i32 %244, %228
  br i1 %245, label %246, label %230, !llvm.loop !15

246:                                              ; preds = %230, %223
  %247 = phi i32 [ %5, %223 ], [ %243, %230 ]
  %248 = icmp ugt i32 %5, -8
  br i1 %248, label %350, label %351

249:                                              ; preds = %249, %44
  %250 = phi i32 [ 0, %44 ], [ %347, %249 ]
  %251 = phi i32 [ 0, %44 ], [ %348, %249 ]
  %252 = mul i32 %250, -16
  %253 = icmp slt i32 %18, %252
  %254 = shl nsw i32 %250, 4
  %255 = select i1 %253, i32 %1, i32 0
  %256 = add i32 %255, %254
  %257 = mul i32 %256, %2
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %26, i64 %258
  %260 = load float, float addrspace(1)* %259, align 4, !tbaa !5, !amdgpu.noclobber !13
  %261 = add i32 %41, %254
  %262 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %261
  store float %260, float addrspace(3)* %262, align 4, !tbaa !5
  %263 = or i32 %250, 1
  %264 = mul i32 %263, -16
  %265 = icmp slt i32 %18, %264
  %266 = shl nsw i32 %263, 4
  %267 = select i1 %265, i32 %1, i32 0
  %268 = add i32 %267, %266
  %269 = mul i32 %268, %2
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %26, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !5, !amdgpu.noclobber !13
  %273 = add i32 %41, %266
  %274 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %273
  store float %272, float addrspace(3)* %274, align 4, !tbaa !5
  %275 = or i32 %250, 2
  %276 = mul i32 %275, -16
  %277 = icmp slt i32 %18, %276
  %278 = shl nsw i32 %275, 4
  %279 = select i1 %277, i32 %1, i32 0
  %280 = add i32 %279, %278
  %281 = mul i32 %280, %2
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %26, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !5, !amdgpu.noclobber !13
  %285 = add i32 %41, %278
  %286 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %285
  store float %284, float addrspace(3)* %286, align 4, !tbaa !5
  %287 = or i32 %250, 3
  %288 = mul i32 %287, -16
  %289 = icmp slt i32 %18, %288
  %290 = shl nsw i32 %287, 4
  %291 = select i1 %289, i32 %1, i32 0
  %292 = add i32 %291, %290
  %293 = mul i32 %292, %2
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %26, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !5, !amdgpu.noclobber !13
  %297 = add i32 %41, %290
  %298 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %297
  store float %296, float addrspace(3)* %298, align 4, !tbaa !5
  %299 = or i32 %250, 4
  %300 = mul i32 %299, -16
  %301 = icmp slt i32 %18, %300
  %302 = shl nsw i32 %299, 4
  %303 = select i1 %301, i32 %1, i32 0
  %304 = add i32 %303, %302
  %305 = mul i32 %304, %2
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %26, i64 %306
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !5, !amdgpu.noclobber !13
  %309 = add i32 %41, %302
  %310 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %309
  store float %308, float addrspace(3)* %310, align 4, !tbaa !5
  %311 = or i32 %250, 5
  %312 = mul i32 %311, -16
  %313 = icmp slt i32 %18, %312
  %314 = shl nsw i32 %311, 4
  %315 = select i1 %313, i32 %1, i32 0
  %316 = add i32 %315, %314
  %317 = mul i32 %316, %2
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds float, float addrspace(1)* %26, i64 %318
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !5, !amdgpu.noclobber !13
  %321 = add i32 %41, %314
  %322 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %321
  store float %320, float addrspace(3)* %322, align 4, !tbaa !5
  %323 = or i32 %250, 6
  %324 = mul i32 %323, -16
  %325 = icmp slt i32 %18, %324
  %326 = shl nsw i32 %323, 4
  %327 = select i1 %325, i32 %1, i32 0
  %328 = add i32 %327, %326
  %329 = mul i32 %328, %2
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, float addrspace(1)* %26, i64 %330
  %332 = load float, float addrspace(1)* %331, align 4, !tbaa !5, !amdgpu.noclobber !13
  %333 = add i32 %41, %326
  %334 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %333
  store float %332, float addrspace(3)* %334, align 4, !tbaa !5
  %335 = or i32 %250, 7
  %336 = mul i32 %335, -16
  %337 = icmp slt i32 %18, %336
  %338 = shl nsw i32 %335, 4
  %339 = select i1 %337, i32 %1, i32 0
  %340 = add i32 %339, %338
  %341 = mul i32 %340, %2
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds float, float addrspace(1)* %26, i64 %342
  %344 = load float, float addrspace(1)* %343, align 4, !tbaa !5, !amdgpu.noclobber !13
  %345 = add i32 %41, %338
  %346 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %345
  store float %344, float addrspace(3)* %346, align 4, !tbaa !5
  %347 = add nuw nsw i32 %250, 8
  %348 = add i32 %251, 8
  %349 = icmp eq i32 %348, %45
  br i1 %349, label %201, label %249, !llvm.loop !16

350:                                              ; preds = %351, %246, %221
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %442

351:                                              ; preds = %246, %351
  %352 = phi i32 [ %440, %351 ], [ %247, %246 ]
  %353 = shl nsw i32 %352, 4
  %354 = icmp sgt i32 %224, %353
  %355 = select i1 %354, i32 0, i32 %1
  %356 = sub i32 %353, %355
  %357 = mul i32 %356, %2
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %26, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !5, !amdgpu.noclobber !13
  %361 = add i32 %227, %353
  %362 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %361
  store float %360, float addrspace(3)* %362, align 4, !tbaa !5
  %363 = shl i32 %352, 4
  %364 = add i32 %363, 16
  %365 = icmp sgt i32 %224, %364
  %366 = select i1 %365, i32 0, i32 %1
  %367 = sub i32 %364, %366
  %368 = mul i32 %367, %2
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds float, float addrspace(1)* %26, i64 %369
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !5, !amdgpu.noclobber !13
  %372 = add i32 %227, %364
  %373 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %372
  store float %371, float addrspace(3)* %373, align 4, !tbaa !5
  %374 = shl i32 %352, 4
  %375 = add i32 %374, 32
  %376 = icmp sgt i32 %224, %375
  %377 = select i1 %376, i32 0, i32 %1
  %378 = sub i32 %375, %377
  %379 = mul i32 %378, %2
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds float, float addrspace(1)* %26, i64 %380
  %382 = load float, float addrspace(1)* %381, align 4, !tbaa !5, !amdgpu.noclobber !13
  %383 = add i32 %227, %375
  %384 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %383
  store float %382, float addrspace(3)* %384, align 4, !tbaa !5
  %385 = shl i32 %352, 4
  %386 = add i32 %385, 48
  %387 = icmp sgt i32 %224, %386
  %388 = select i1 %387, i32 0, i32 %1
  %389 = sub i32 %386, %388
  %390 = mul i32 %389, %2
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %26, i64 %391
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !5, !amdgpu.noclobber !13
  %394 = add i32 %227, %386
  %395 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %394
  store float %393, float addrspace(3)* %395, align 4, !tbaa !5
  %396 = shl i32 %352, 4
  %397 = add i32 %396, 64
  %398 = icmp sgt i32 %224, %397
  %399 = select i1 %398, i32 0, i32 %1
  %400 = sub i32 %397, %399
  %401 = mul i32 %400, %2
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds float, float addrspace(1)* %26, i64 %402
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !5, !amdgpu.noclobber !13
  %405 = add i32 %227, %397
  %406 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %405
  store float %404, float addrspace(3)* %406, align 4, !tbaa !5
  %407 = shl i32 %352, 4
  %408 = add i32 %407, 80
  %409 = icmp sgt i32 %224, %408
  %410 = select i1 %409, i32 0, i32 %1
  %411 = sub i32 %408, %410
  %412 = mul i32 %411, %2
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds float, float addrspace(1)* %26, i64 %413
  %415 = load float, float addrspace(1)* %414, align 4, !tbaa !5, !amdgpu.noclobber !13
  %416 = add i32 %227, %408
  %417 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %416
  store float %415, float addrspace(3)* %417, align 4, !tbaa !5
  %418 = shl i32 %352, 4
  %419 = add i32 %418, 96
  %420 = icmp sgt i32 %224, %419
  %421 = select i1 %420, i32 0, i32 %1
  %422 = sub i32 %419, %421
  %423 = mul i32 %422, %2
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds float, float addrspace(1)* %26, i64 %424
  %426 = load float, float addrspace(1)* %425, align 4, !tbaa !5, !amdgpu.noclobber !13
  %427 = add i32 %227, %419
  %428 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %427
  store float %426, float addrspace(3)* %428, align 4, !tbaa !5
  %429 = shl i32 %352, 4
  %430 = add i32 %429, 112
  %431 = icmp sgt i32 %224, %430
  %432 = select i1 %431, i32 0, i32 %1
  %433 = sub i32 %430, %432
  %434 = mul i32 %433, %2
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds float, float addrspace(1)* %26, i64 %435
  %437 = load float, float addrspace(1)* %436, align 4, !tbaa !5, !amdgpu.noclobber !13
  %438 = add i32 %227, %430
  %439 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %438
  store float %437, float addrspace(3)* %439, align 4, !tbaa !5
  %440 = add nsw i32 %352, 8
  %441 = icmp eq i32 %352, %36
  br i1 %441, label %350, label %351, !llvm.loop !17

442:                                              ; preds = %350, %159
  %443 = phi i32 [ %37, %350 ], [ %86, %159 ]
  fence syncscope("workgroup") acquire
  %444 = sdiv i32 %4, 2
  %445 = icmp sgt i32 %4, 0
  %446 = load float*, float* addrspace(4)* @c_lpd, align 8
  %447 = shl nuw nsw i32 %11, 4
  %448 = mul i32 %447, %443
  %449 = shl nuw nsw i32 %17, 1
  %450 = add nsw i32 %444, %449
  %451 = add i32 %450, %15
  %452 = add i32 %451, %448
  %453 = load float*, float* addrspace(4)* @c_hpd, align 8
  %454 = icmp slt i32 %20, %3
  br i1 %454, label %455, label %602

455:                                              ; preds = %442
  br i1 %445, label %456, label %488

456:                                              ; preds = %455
  %457 = and i32 %4, 7
  %458 = icmp ult i32 %4, 8
  br i1 %458, label %461, label %459

459:                                              ; preds = %456
  %460 = and i32 %4, -8
  br label %491

461:                                              ; preds = %491, %456
  %462 = phi float [ undef, %456 ], [ %594, %491 ]
  %463 = phi float [ undef, %456 ], [ %598, %491 ]
  %464 = phi i32 [ 0, %456 ], [ %599, %491 ]
  %465 = phi float [ 0.000000e+00, %456 ], [ %598, %491 ]
  %466 = phi float [ 0.000000e+00, %456 ], [ %594, %491 ]
  %467 = icmp eq i32 %457, 0
  br i1 %467, label %488, label %468

468:                                              ; preds = %461, %468
  %469 = phi i32 [ %485, %468 ], [ %464, %461 ]
  %470 = phi float [ %484, %468 ], [ %465, %461 ]
  %471 = phi float [ %480, %468 ], [ %466, %461 ]
  %472 = phi i32 [ %486, %468 ], [ 0, %461 ]
  %473 = zext i32 %469 to i64
  %474 = getelementptr inbounds float, float* %446, i64 %473
  %475 = load float, float* %474, align 4, !tbaa !5
  %476 = sub i32 %452, %469
  %477 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %476
  %478 = load float, float addrspace(3)* %477, align 4, !tbaa !5
  %479 = fmul contract float %475, %478
  %480 = fadd contract float %471, %479
  %481 = getelementptr inbounds float, float* %453, i64 %473
  %482 = load float, float* %481, align 4, !tbaa !5
  %483 = fmul contract float %478, %482
  %484 = fadd contract float %470, %483
  %485 = add nuw nsw i32 %469, 1
  %486 = add i32 %472, 1
  %487 = icmp eq i32 %486, %457
  br i1 %487, label %488, label %468, !llvm.loop !18

488:                                              ; preds = %461, %468, %455
  %489 = phi float [ 0.000000e+00, %455 ], [ %462, %461 ], [ %480, %468 ]
  %490 = phi float [ 0.000000e+00, %455 ], [ %463, %461 ], [ %484, %468 ]
  store float %489, float addrspace(1)* %30, align 4, !tbaa !5
  store float %490, float addrspace(1)* %31, align 4, !tbaa !5
  br label %602

491:                                              ; preds = %491, %459
  %492 = phi i32 [ 0, %459 ], [ %599, %491 ]
  %493 = phi float [ 0.000000e+00, %459 ], [ %598, %491 ]
  %494 = phi float [ 0.000000e+00, %459 ], [ %594, %491 ]
  %495 = phi i32 [ 0, %459 ], [ %600, %491 ]
  %496 = zext i32 %492 to i64
  %497 = getelementptr inbounds float, float* %446, i64 %496
  %498 = load float, float* %497, align 4, !tbaa !5
  %499 = sub i32 %452, %492
  %500 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %499
  %501 = load float, float addrspace(3)* %500, align 4, !tbaa !5
  %502 = fmul contract float %498, %501
  %503 = fadd contract float %494, %502
  %504 = getelementptr inbounds float, float* %453, i64 %496
  %505 = load float, float* %504, align 4, !tbaa !5
  %506 = fmul contract float %501, %505
  %507 = fadd contract float %493, %506
  %508 = or i32 %492, 1
  %509 = zext i32 %508 to i64
  %510 = getelementptr inbounds float, float* %446, i64 %509
  %511 = load float, float* %510, align 4, !tbaa !5
  %512 = sub i32 %452, %508
  %513 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %512
  %514 = load float, float addrspace(3)* %513, align 4, !tbaa !5
  %515 = fmul contract float %511, %514
  %516 = fadd contract float %503, %515
  %517 = getelementptr inbounds float, float* %453, i64 %509
  %518 = load float, float* %517, align 4, !tbaa !5
  %519 = fmul contract float %514, %518
  %520 = fadd contract float %507, %519
  %521 = or i32 %492, 2
  %522 = zext i32 %521 to i64
  %523 = getelementptr inbounds float, float* %446, i64 %522
  %524 = load float, float* %523, align 4, !tbaa !5
  %525 = sub i32 %452, %521
  %526 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %525
  %527 = load float, float addrspace(3)* %526, align 4, !tbaa !5
  %528 = fmul contract float %524, %527
  %529 = fadd contract float %516, %528
  %530 = getelementptr inbounds float, float* %453, i64 %522
  %531 = load float, float* %530, align 4, !tbaa !5
  %532 = fmul contract float %527, %531
  %533 = fadd contract float %520, %532
  %534 = or i32 %492, 3
  %535 = zext i32 %534 to i64
  %536 = getelementptr inbounds float, float* %446, i64 %535
  %537 = load float, float* %536, align 4, !tbaa !5
  %538 = sub i32 %452, %534
  %539 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %538
  %540 = load float, float addrspace(3)* %539, align 4, !tbaa !5
  %541 = fmul contract float %537, %540
  %542 = fadd contract float %529, %541
  %543 = getelementptr inbounds float, float* %453, i64 %535
  %544 = load float, float* %543, align 4, !tbaa !5
  %545 = fmul contract float %540, %544
  %546 = fadd contract float %533, %545
  %547 = or i32 %492, 4
  %548 = zext i32 %547 to i64
  %549 = getelementptr inbounds float, float* %446, i64 %548
  %550 = load float, float* %549, align 4, !tbaa !5
  %551 = sub i32 %452, %547
  %552 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %551
  %553 = load float, float addrspace(3)* %552, align 4, !tbaa !5
  %554 = fmul contract float %550, %553
  %555 = fadd contract float %542, %554
  %556 = getelementptr inbounds float, float* %453, i64 %548
  %557 = load float, float* %556, align 4, !tbaa !5
  %558 = fmul contract float %553, %557
  %559 = fadd contract float %546, %558
  %560 = or i32 %492, 5
  %561 = zext i32 %560 to i64
  %562 = getelementptr inbounds float, float* %446, i64 %561
  %563 = load float, float* %562, align 4, !tbaa !5
  %564 = sub i32 %452, %560
  %565 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %564
  %566 = load float, float addrspace(3)* %565, align 4, !tbaa !5
  %567 = fmul contract float %563, %566
  %568 = fadd contract float %555, %567
  %569 = getelementptr inbounds float, float* %453, i64 %561
  %570 = load float, float* %569, align 4, !tbaa !5
  %571 = fmul contract float %566, %570
  %572 = fadd contract float %559, %571
  %573 = or i32 %492, 6
  %574 = zext i32 %573 to i64
  %575 = getelementptr inbounds float, float* %446, i64 %574
  %576 = load float, float* %575, align 4, !tbaa !5
  %577 = sub i32 %452, %573
  %578 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %577
  %579 = load float, float addrspace(3)* %578, align 4, !tbaa !5
  %580 = fmul contract float %576, %579
  %581 = fadd contract float %568, %580
  %582 = getelementptr inbounds float, float* %453, i64 %574
  %583 = load float, float* %582, align 4, !tbaa !5
  %584 = fmul contract float %579, %583
  %585 = fadd contract float %572, %584
  %586 = or i32 %492, 7
  %587 = zext i32 %586 to i64
  %588 = getelementptr inbounds float, float* %446, i64 %587
  %589 = load float, float* %588, align 4, !tbaa !5
  %590 = sub i32 %452, %586
  %591 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %590
  %592 = load float, float addrspace(3)* %591, align 4, !tbaa !5
  %593 = fmul contract float %589, %592
  %594 = fadd contract float %581, %593
  %595 = getelementptr inbounds float, float* %453, i64 %587
  %596 = load float, float* %595, align 4, !tbaa !5
  %597 = fmul contract float %592, %596
  %598 = fadd contract float %585, %597
  %599 = add nuw nsw i32 %492, 8
  %600 = add i32 %495, 8
  %601 = icmp eq i32 %600, %460
  br i1 %601, label %461, label %491, !llvm.loop !19

602:                                              ; preds = %442, %488
  %603 = add nsw i32 %20, 16
  %604 = icmp slt i32 %603, %3
  br i1 %604, label %605, label %765

605:                                              ; preds = %602
  br i1 %445, label %606, label %758

606:                                              ; preds = %605
  %607 = and i32 %4, 7
  %608 = icmp ult i32 %4, 8
  br i1 %608, label %730, label %609

609:                                              ; preds = %606
  %610 = and i32 %4, -8
  br label %611

611:                                              ; preds = %611, %609
  %612 = phi i32 [ 0, %609 ], [ %727, %611 ]
  %613 = phi float [ 0.000000e+00, %609 ], [ %726, %611 ]
  %614 = phi float [ 0.000000e+00, %609 ], [ %722, %611 ]
  %615 = phi i32 [ 0, %609 ], [ %728, %611 ]
  %616 = zext i32 %612 to i64
  %617 = getelementptr inbounds float, float* %446, i64 %616
  %618 = load float, float* %617, align 4, !tbaa !5
  %619 = sub i32 %452, %612
  %620 = add i32 %619, 32
  %621 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %620
  %622 = load float, float addrspace(3)* %621, align 4, !tbaa !5
  %623 = fmul contract float %618, %622
  %624 = fadd contract float %614, %623
  %625 = getelementptr inbounds float, float* %453, i64 %616
  %626 = load float, float* %625, align 4, !tbaa !5
  %627 = fmul contract float %622, %626
  %628 = fadd contract float %613, %627
  %629 = or i32 %612, 1
  %630 = zext i32 %629 to i64
  %631 = getelementptr inbounds float, float* %446, i64 %630
  %632 = load float, float* %631, align 4, !tbaa !5
  %633 = sub i32 %452, %629
  %634 = add i32 %633, 32
  %635 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %634
  %636 = load float, float addrspace(3)* %635, align 4, !tbaa !5
  %637 = fmul contract float %632, %636
  %638 = fadd contract float %624, %637
  %639 = getelementptr inbounds float, float* %453, i64 %630
  %640 = load float, float* %639, align 4, !tbaa !5
  %641 = fmul contract float %636, %640
  %642 = fadd contract float %628, %641
  %643 = or i32 %612, 2
  %644 = zext i32 %643 to i64
  %645 = getelementptr inbounds float, float* %446, i64 %644
  %646 = load float, float* %645, align 4, !tbaa !5
  %647 = sub i32 %452, %643
  %648 = add i32 %647, 32
  %649 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %648
  %650 = load float, float addrspace(3)* %649, align 4, !tbaa !5
  %651 = fmul contract float %646, %650
  %652 = fadd contract float %638, %651
  %653 = getelementptr inbounds float, float* %453, i64 %644
  %654 = load float, float* %653, align 4, !tbaa !5
  %655 = fmul contract float %650, %654
  %656 = fadd contract float %642, %655
  %657 = or i32 %612, 3
  %658 = zext i32 %657 to i64
  %659 = getelementptr inbounds float, float* %446, i64 %658
  %660 = load float, float* %659, align 4, !tbaa !5
  %661 = sub i32 %452, %657
  %662 = add i32 %661, 32
  %663 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %662
  %664 = load float, float addrspace(3)* %663, align 4, !tbaa !5
  %665 = fmul contract float %660, %664
  %666 = fadd contract float %652, %665
  %667 = getelementptr inbounds float, float* %453, i64 %658
  %668 = load float, float* %667, align 4, !tbaa !5
  %669 = fmul contract float %664, %668
  %670 = fadd contract float %656, %669
  %671 = or i32 %612, 4
  %672 = zext i32 %671 to i64
  %673 = getelementptr inbounds float, float* %446, i64 %672
  %674 = load float, float* %673, align 4, !tbaa !5
  %675 = sub i32 %452, %671
  %676 = add i32 %675, 32
  %677 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %676
  %678 = load float, float addrspace(3)* %677, align 4, !tbaa !5
  %679 = fmul contract float %674, %678
  %680 = fadd contract float %666, %679
  %681 = getelementptr inbounds float, float* %453, i64 %672
  %682 = load float, float* %681, align 4, !tbaa !5
  %683 = fmul contract float %678, %682
  %684 = fadd contract float %670, %683
  %685 = or i32 %612, 5
  %686 = zext i32 %685 to i64
  %687 = getelementptr inbounds float, float* %446, i64 %686
  %688 = load float, float* %687, align 4, !tbaa !5
  %689 = sub i32 %452, %685
  %690 = add i32 %689, 32
  %691 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %690
  %692 = load float, float addrspace(3)* %691, align 4, !tbaa !5
  %693 = fmul contract float %688, %692
  %694 = fadd contract float %680, %693
  %695 = getelementptr inbounds float, float* %453, i64 %686
  %696 = load float, float* %695, align 4, !tbaa !5
  %697 = fmul contract float %692, %696
  %698 = fadd contract float %684, %697
  %699 = or i32 %612, 6
  %700 = zext i32 %699 to i64
  %701 = getelementptr inbounds float, float* %446, i64 %700
  %702 = load float, float* %701, align 4, !tbaa !5
  %703 = sub i32 %452, %699
  %704 = add i32 %703, 32
  %705 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %704
  %706 = load float, float addrspace(3)* %705, align 4, !tbaa !5
  %707 = fmul contract float %702, %706
  %708 = fadd contract float %694, %707
  %709 = getelementptr inbounds float, float* %453, i64 %700
  %710 = load float, float* %709, align 4, !tbaa !5
  %711 = fmul contract float %706, %710
  %712 = fadd contract float %698, %711
  %713 = or i32 %612, 7
  %714 = zext i32 %713 to i64
  %715 = getelementptr inbounds float, float* %446, i64 %714
  %716 = load float, float* %715, align 4, !tbaa !5
  %717 = sub i32 %452, %713
  %718 = add i32 %717, 32
  %719 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %718
  %720 = load float, float addrspace(3)* %719, align 4, !tbaa !5
  %721 = fmul contract float %716, %720
  %722 = fadd contract float %708, %721
  %723 = getelementptr inbounds float, float* %453, i64 %714
  %724 = load float, float* %723, align 4, !tbaa !5
  %725 = fmul contract float %720, %724
  %726 = fadd contract float %712, %725
  %727 = add nuw nsw i32 %612, 8
  %728 = add i32 %615, 8
  %729 = icmp eq i32 %728, %610
  br i1 %729, label %730, label %611, !llvm.loop !19

730:                                              ; preds = %611, %606
  %731 = phi float [ undef, %606 ], [ %722, %611 ]
  %732 = phi float [ undef, %606 ], [ %726, %611 ]
  %733 = phi i32 [ 0, %606 ], [ %727, %611 ]
  %734 = phi float [ 0.000000e+00, %606 ], [ %726, %611 ]
  %735 = phi float [ 0.000000e+00, %606 ], [ %722, %611 ]
  %736 = icmp eq i32 %607, 0
  br i1 %736, label %758, label %737

737:                                              ; preds = %730, %737
  %738 = phi i32 [ %755, %737 ], [ %733, %730 ]
  %739 = phi float [ %754, %737 ], [ %734, %730 ]
  %740 = phi float [ %750, %737 ], [ %735, %730 ]
  %741 = phi i32 [ %756, %737 ], [ 0, %730 ]
  %742 = zext i32 %738 to i64
  %743 = getelementptr inbounds float, float* %446, i64 %742
  %744 = load float, float* %743, align 4, !tbaa !5
  %745 = sub i32 %452, %738
  %746 = add i32 %745, 32
  %747 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %746
  %748 = load float, float addrspace(3)* %747, align 4, !tbaa !5
  %749 = fmul contract float %744, %748
  %750 = fadd contract float %740, %749
  %751 = getelementptr inbounds float, float* %453, i64 %742
  %752 = load float, float* %751, align 4, !tbaa !5
  %753 = fmul contract float %748, %752
  %754 = fadd contract float %739, %753
  %755 = add nuw nsw i32 %738, 1
  %756 = add i32 %741, 1
  %757 = icmp eq i32 %756, %607
  br i1 %757, label %758, label %737, !llvm.loop !20

758:                                              ; preds = %730, %737, %605
  %759 = phi float [ 0.000000e+00, %605 ], [ %731, %730 ], [ %750, %737 ]
  %760 = phi float [ 0.000000e+00, %605 ], [ %732, %730 ], [ %754, %737 ]
  %761 = shl nsw i32 %2, 4
  %762 = sext i32 %761 to i64
  %763 = getelementptr inbounds float, float addrspace(1)* %30, i64 %762
  store float %759, float addrspace(1)* %763, align 4, !tbaa !5
  %764 = getelementptr inbounds float, float addrspace(1)* %31, i64 %762
  store float %760, float addrspace(1)* %764, align 4, !tbaa !5
  br label %765

765:                                              ; preds = %758, %602
  %766 = add nsw i32 %20, 32
  %767 = icmp slt i32 %766, %3
  br i1 %767, label %768, label %928

768:                                              ; preds = %765
  br i1 %445, label %769, label %921

769:                                              ; preds = %768
  %770 = and i32 %4, 7
  %771 = icmp ult i32 %4, 8
  br i1 %771, label %893, label %772

772:                                              ; preds = %769
  %773 = and i32 %4, -8
  br label %774

774:                                              ; preds = %774, %772
  %775 = phi i32 [ 0, %772 ], [ %890, %774 ]
  %776 = phi float [ 0.000000e+00, %772 ], [ %889, %774 ]
  %777 = phi float [ 0.000000e+00, %772 ], [ %885, %774 ]
  %778 = phi i32 [ 0, %772 ], [ %891, %774 ]
  %779 = zext i32 %775 to i64
  %780 = getelementptr inbounds float, float* %446, i64 %779
  %781 = load float, float* %780, align 4, !tbaa !5
  %782 = sub i32 %452, %775
  %783 = add i32 %782, 64
  %784 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %783
  %785 = load float, float addrspace(3)* %784, align 4, !tbaa !5
  %786 = fmul contract float %781, %785
  %787 = fadd contract float %777, %786
  %788 = getelementptr inbounds float, float* %453, i64 %779
  %789 = load float, float* %788, align 4, !tbaa !5
  %790 = fmul contract float %785, %789
  %791 = fadd contract float %776, %790
  %792 = or i32 %775, 1
  %793 = zext i32 %792 to i64
  %794 = getelementptr inbounds float, float* %446, i64 %793
  %795 = load float, float* %794, align 4, !tbaa !5
  %796 = sub i32 %452, %792
  %797 = add i32 %796, 64
  %798 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %797
  %799 = load float, float addrspace(3)* %798, align 4, !tbaa !5
  %800 = fmul contract float %795, %799
  %801 = fadd contract float %787, %800
  %802 = getelementptr inbounds float, float* %453, i64 %793
  %803 = load float, float* %802, align 4, !tbaa !5
  %804 = fmul contract float %799, %803
  %805 = fadd contract float %791, %804
  %806 = or i32 %775, 2
  %807 = zext i32 %806 to i64
  %808 = getelementptr inbounds float, float* %446, i64 %807
  %809 = load float, float* %808, align 4, !tbaa !5
  %810 = sub i32 %452, %806
  %811 = add i32 %810, 64
  %812 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %811
  %813 = load float, float addrspace(3)* %812, align 4, !tbaa !5
  %814 = fmul contract float %809, %813
  %815 = fadd contract float %801, %814
  %816 = getelementptr inbounds float, float* %453, i64 %807
  %817 = load float, float* %816, align 4, !tbaa !5
  %818 = fmul contract float %813, %817
  %819 = fadd contract float %805, %818
  %820 = or i32 %775, 3
  %821 = zext i32 %820 to i64
  %822 = getelementptr inbounds float, float* %446, i64 %821
  %823 = load float, float* %822, align 4, !tbaa !5
  %824 = sub i32 %452, %820
  %825 = add i32 %824, 64
  %826 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %825
  %827 = load float, float addrspace(3)* %826, align 4, !tbaa !5
  %828 = fmul contract float %823, %827
  %829 = fadd contract float %815, %828
  %830 = getelementptr inbounds float, float* %453, i64 %821
  %831 = load float, float* %830, align 4, !tbaa !5
  %832 = fmul contract float %827, %831
  %833 = fadd contract float %819, %832
  %834 = or i32 %775, 4
  %835 = zext i32 %834 to i64
  %836 = getelementptr inbounds float, float* %446, i64 %835
  %837 = load float, float* %836, align 4, !tbaa !5
  %838 = sub i32 %452, %834
  %839 = add i32 %838, 64
  %840 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %839
  %841 = load float, float addrspace(3)* %840, align 4, !tbaa !5
  %842 = fmul contract float %837, %841
  %843 = fadd contract float %829, %842
  %844 = getelementptr inbounds float, float* %453, i64 %835
  %845 = load float, float* %844, align 4, !tbaa !5
  %846 = fmul contract float %841, %845
  %847 = fadd contract float %833, %846
  %848 = or i32 %775, 5
  %849 = zext i32 %848 to i64
  %850 = getelementptr inbounds float, float* %446, i64 %849
  %851 = load float, float* %850, align 4, !tbaa !5
  %852 = sub i32 %452, %848
  %853 = add i32 %852, 64
  %854 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %853
  %855 = load float, float addrspace(3)* %854, align 4, !tbaa !5
  %856 = fmul contract float %851, %855
  %857 = fadd contract float %843, %856
  %858 = getelementptr inbounds float, float* %453, i64 %849
  %859 = load float, float* %858, align 4, !tbaa !5
  %860 = fmul contract float %855, %859
  %861 = fadd contract float %847, %860
  %862 = or i32 %775, 6
  %863 = zext i32 %862 to i64
  %864 = getelementptr inbounds float, float* %446, i64 %863
  %865 = load float, float* %864, align 4, !tbaa !5
  %866 = sub i32 %452, %862
  %867 = add i32 %866, 64
  %868 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %867
  %869 = load float, float addrspace(3)* %868, align 4, !tbaa !5
  %870 = fmul contract float %865, %869
  %871 = fadd contract float %857, %870
  %872 = getelementptr inbounds float, float* %453, i64 %863
  %873 = load float, float* %872, align 4, !tbaa !5
  %874 = fmul contract float %869, %873
  %875 = fadd contract float %861, %874
  %876 = or i32 %775, 7
  %877 = zext i32 %876 to i64
  %878 = getelementptr inbounds float, float* %446, i64 %877
  %879 = load float, float* %878, align 4, !tbaa !5
  %880 = sub i32 %452, %876
  %881 = add i32 %880, 64
  %882 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %881
  %883 = load float, float addrspace(3)* %882, align 4, !tbaa !5
  %884 = fmul contract float %879, %883
  %885 = fadd contract float %871, %884
  %886 = getelementptr inbounds float, float* %453, i64 %877
  %887 = load float, float* %886, align 4, !tbaa !5
  %888 = fmul contract float %883, %887
  %889 = fadd contract float %875, %888
  %890 = add nuw nsw i32 %775, 8
  %891 = add i32 %778, 8
  %892 = icmp eq i32 %891, %773
  br i1 %892, label %893, label %774, !llvm.loop !19

893:                                              ; preds = %774, %769
  %894 = phi float [ undef, %769 ], [ %885, %774 ]
  %895 = phi float [ undef, %769 ], [ %889, %774 ]
  %896 = phi i32 [ 0, %769 ], [ %890, %774 ]
  %897 = phi float [ 0.000000e+00, %769 ], [ %889, %774 ]
  %898 = phi float [ 0.000000e+00, %769 ], [ %885, %774 ]
  %899 = icmp eq i32 %770, 0
  br i1 %899, label %921, label %900

900:                                              ; preds = %893, %900
  %901 = phi i32 [ %918, %900 ], [ %896, %893 ]
  %902 = phi float [ %917, %900 ], [ %897, %893 ]
  %903 = phi float [ %913, %900 ], [ %898, %893 ]
  %904 = phi i32 [ %919, %900 ], [ 0, %893 ]
  %905 = zext i32 %901 to i64
  %906 = getelementptr inbounds float, float* %446, i64 %905
  %907 = load float, float* %906, align 4, !tbaa !5
  %908 = sub i32 %452, %901
  %909 = add i32 %908, 64
  %910 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %909
  %911 = load float, float addrspace(3)* %910, align 4, !tbaa !5
  %912 = fmul contract float %907, %911
  %913 = fadd contract float %903, %912
  %914 = getelementptr inbounds float, float* %453, i64 %905
  %915 = load float, float* %914, align 4, !tbaa !5
  %916 = fmul contract float %911, %915
  %917 = fadd contract float %902, %916
  %918 = add nuw nsw i32 %901, 1
  %919 = add i32 %904, 1
  %920 = icmp eq i32 %919, %770
  br i1 %920, label %921, label %900, !llvm.loop !21

921:                                              ; preds = %893, %900, %768
  %922 = phi float [ 0.000000e+00, %768 ], [ %894, %893 ], [ %913, %900 ]
  %923 = phi float [ 0.000000e+00, %768 ], [ %895, %893 ], [ %917, %900 ]
  %924 = shl nsw i32 %2, 5
  %925 = sext i32 %924 to i64
  %926 = getelementptr inbounds float, float addrspace(1)* %30, i64 %925
  store float %922, float addrspace(1)* %926, align 4, !tbaa !5
  %927 = getelementptr inbounds float, float addrspace(1)* %31, i64 %925
  store float %923, float addrspace(1)* %927, align 4, !tbaa !5
  br label %928

928:                                              ; preds = %921, %765
  %929 = add nsw i32 %20, 48
  %930 = icmp slt i32 %929, %3
  br i1 %930, label %931, label %1091

931:                                              ; preds = %928
  br i1 %445, label %932, label %1084

932:                                              ; preds = %931
  %933 = and i32 %4, 7
  %934 = icmp ult i32 %4, 8
  br i1 %934, label %1056, label %935

935:                                              ; preds = %932
  %936 = and i32 %4, -8
  br label %937

937:                                              ; preds = %937, %935
  %938 = phi i32 [ 0, %935 ], [ %1053, %937 ]
  %939 = phi float [ 0.000000e+00, %935 ], [ %1052, %937 ]
  %940 = phi float [ 0.000000e+00, %935 ], [ %1048, %937 ]
  %941 = phi i32 [ 0, %935 ], [ %1054, %937 ]
  %942 = zext i32 %938 to i64
  %943 = getelementptr inbounds float, float* %446, i64 %942
  %944 = load float, float* %943, align 4, !tbaa !5
  %945 = sub i32 %452, %938
  %946 = add i32 %945, 96
  %947 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %946
  %948 = load float, float addrspace(3)* %947, align 4, !tbaa !5
  %949 = fmul contract float %944, %948
  %950 = fadd contract float %940, %949
  %951 = getelementptr inbounds float, float* %453, i64 %942
  %952 = load float, float* %951, align 4, !tbaa !5
  %953 = fmul contract float %948, %952
  %954 = fadd contract float %939, %953
  %955 = or i32 %938, 1
  %956 = zext i32 %955 to i64
  %957 = getelementptr inbounds float, float* %446, i64 %956
  %958 = load float, float* %957, align 4, !tbaa !5
  %959 = sub i32 %452, %955
  %960 = add i32 %959, 96
  %961 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %960
  %962 = load float, float addrspace(3)* %961, align 4, !tbaa !5
  %963 = fmul contract float %958, %962
  %964 = fadd contract float %950, %963
  %965 = getelementptr inbounds float, float* %453, i64 %956
  %966 = load float, float* %965, align 4, !tbaa !5
  %967 = fmul contract float %962, %966
  %968 = fadd contract float %954, %967
  %969 = or i32 %938, 2
  %970 = zext i32 %969 to i64
  %971 = getelementptr inbounds float, float* %446, i64 %970
  %972 = load float, float* %971, align 4, !tbaa !5
  %973 = sub i32 %452, %969
  %974 = add i32 %973, 96
  %975 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %974
  %976 = load float, float addrspace(3)* %975, align 4, !tbaa !5
  %977 = fmul contract float %972, %976
  %978 = fadd contract float %964, %977
  %979 = getelementptr inbounds float, float* %453, i64 %970
  %980 = load float, float* %979, align 4, !tbaa !5
  %981 = fmul contract float %976, %980
  %982 = fadd contract float %968, %981
  %983 = or i32 %938, 3
  %984 = zext i32 %983 to i64
  %985 = getelementptr inbounds float, float* %446, i64 %984
  %986 = load float, float* %985, align 4, !tbaa !5
  %987 = sub i32 %452, %983
  %988 = add i32 %987, 96
  %989 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %988
  %990 = load float, float addrspace(3)* %989, align 4, !tbaa !5
  %991 = fmul contract float %986, %990
  %992 = fadd contract float %978, %991
  %993 = getelementptr inbounds float, float* %453, i64 %984
  %994 = load float, float* %993, align 4, !tbaa !5
  %995 = fmul contract float %990, %994
  %996 = fadd contract float %982, %995
  %997 = or i32 %938, 4
  %998 = zext i32 %997 to i64
  %999 = getelementptr inbounds float, float* %446, i64 %998
  %1000 = load float, float* %999, align 4, !tbaa !5
  %1001 = sub i32 %452, %997
  %1002 = add i32 %1001, 96
  %1003 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1002
  %1004 = load float, float addrspace(3)* %1003, align 4, !tbaa !5
  %1005 = fmul contract float %1000, %1004
  %1006 = fadd contract float %992, %1005
  %1007 = getelementptr inbounds float, float* %453, i64 %998
  %1008 = load float, float* %1007, align 4, !tbaa !5
  %1009 = fmul contract float %1004, %1008
  %1010 = fadd contract float %996, %1009
  %1011 = or i32 %938, 5
  %1012 = zext i32 %1011 to i64
  %1013 = getelementptr inbounds float, float* %446, i64 %1012
  %1014 = load float, float* %1013, align 4, !tbaa !5
  %1015 = sub i32 %452, %1011
  %1016 = add i32 %1015, 96
  %1017 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1016
  %1018 = load float, float addrspace(3)* %1017, align 4, !tbaa !5
  %1019 = fmul contract float %1014, %1018
  %1020 = fadd contract float %1006, %1019
  %1021 = getelementptr inbounds float, float* %453, i64 %1012
  %1022 = load float, float* %1021, align 4, !tbaa !5
  %1023 = fmul contract float %1018, %1022
  %1024 = fadd contract float %1010, %1023
  %1025 = or i32 %938, 6
  %1026 = zext i32 %1025 to i64
  %1027 = getelementptr inbounds float, float* %446, i64 %1026
  %1028 = load float, float* %1027, align 4, !tbaa !5
  %1029 = sub i32 %452, %1025
  %1030 = add i32 %1029, 96
  %1031 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1030
  %1032 = load float, float addrspace(3)* %1031, align 4, !tbaa !5
  %1033 = fmul contract float %1028, %1032
  %1034 = fadd contract float %1020, %1033
  %1035 = getelementptr inbounds float, float* %453, i64 %1026
  %1036 = load float, float* %1035, align 4, !tbaa !5
  %1037 = fmul contract float %1032, %1036
  %1038 = fadd contract float %1024, %1037
  %1039 = or i32 %938, 7
  %1040 = zext i32 %1039 to i64
  %1041 = getelementptr inbounds float, float* %446, i64 %1040
  %1042 = load float, float* %1041, align 4, !tbaa !5
  %1043 = sub i32 %452, %1039
  %1044 = add i32 %1043, 96
  %1045 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1044
  %1046 = load float, float addrspace(3)* %1045, align 4, !tbaa !5
  %1047 = fmul contract float %1042, %1046
  %1048 = fadd contract float %1034, %1047
  %1049 = getelementptr inbounds float, float* %453, i64 %1040
  %1050 = load float, float* %1049, align 4, !tbaa !5
  %1051 = fmul contract float %1046, %1050
  %1052 = fadd contract float %1038, %1051
  %1053 = add nuw nsw i32 %938, 8
  %1054 = add i32 %941, 8
  %1055 = icmp eq i32 %1054, %936
  br i1 %1055, label %1056, label %937, !llvm.loop !19

1056:                                             ; preds = %937, %932
  %1057 = phi float [ undef, %932 ], [ %1048, %937 ]
  %1058 = phi float [ undef, %932 ], [ %1052, %937 ]
  %1059 = phi i32 [ 0, %932 ], [ %1053, %937 ]
  %1060 = phi float [ 0.000000e+00, %932 ], [ %1052, %937 ]
  %1061 = phi float [ 0.000000e+00, %932 ], [ %1048, %937 ]
  %1062 = icmp eq i32 %933, 0
  br i1 %1062, label %1084, label %1063

1063:                                             ; preds = %1056, %1063
  %1064 = phi i32 [ %1081, %1063 ], [ %1059, %1056 ]
  %1065 = phi float [ %1080, %1063 ], [ %1060, %1056 ]
  %1066 = phi float [ %1076, %1063 ], [ %1061, %1056 ]
  %1067 = phi i32 [ %1082, %1063 ], [ 0, %1056 ]
  %1068 = zext i32 %1064 to i64
  %1069 = getelementptr inbounds float, float* %446, i64 %1068
  %1070 = load float, float* %1069, align 4, !tbaa !5
  %1071 = sub i32 %452, %1064
  %1072 = add i32 %1071, 96
  %1073 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1072
  %1074 = load float, float addrspace(3)* %1073, align 4, !tbaa !5
  %1075 = fmul contract float %1070, %1074
  %1076 = fadd contract float %1066, %1075
  %1077 = getelementptr inbounds float, float* %453, i64 %1068
  %1078 = load float, float* %1077, align 4, !tbaa !5
  %1079 = fmul contract float %1074, %1078
  %1080 = fadd contract float %1065, %1079
  %1081 = add nuw nsw i32 %1064, 1
  %1082 = add i32 %1067, 1
  %1083 = icmp eq i32 %1082, %933
  br i1 %1083, label %1084, label %1063, !llvm.loop !22

1084:                                             ; preds = %1056, %1063, %931
  %1085 = phi float [ 0.000000e+00, %931 ], [ %1057, %1056 ], [ %1076, %1063 ]
  %1086 = phi float [ 0.000000e+00, %931 ], [ %1058, %1056 ], [ %1080, %1063 ]
  %1087 = mul nsw i32 %2, 48
  %1088 = sext i32 %1087 to i64
  %1089 = getelementptr inbounds float, float addrspace(1)* %30, i64 %1088
  store float %1085, float addrspace(1)* %1089, align 4, !tbaa !5
  %1090 = getelementptr inbounds float, float addrspace(1)* %31, i64 %1088
  store float %1086, float addrspace(1)* %1090, align 4, !tbaa !5
  br label %1091

1091:                                             ; preds = %928, %1084, %8
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
!13 = !{}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !10, !11}
!17 = distinct !{!17, !10, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !10}
!20 = distinct !{!20, !11}
!21 = distinct !{!21, !11}
!22 = distinct !{!22, !11}
