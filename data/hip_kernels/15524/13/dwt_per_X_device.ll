; ModuleID = '../data/hip_kernels/15524/13/main.cu'
source_filename = "../data/hip_kernels/15524/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_lpd = protected addrspace(4) externally_initialized global float* null, align 8
@c_hpd = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_hpd to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_lpd to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9dwt_per_XPfiiiiiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
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
  br i1 %21, label %22, label %1103

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
  %32 = and i32 %2, -2147483647
  %33 = icmp eq i32 %32, 1
  %34 = icmp sgt i32 %5, 0
  br i1 %33, label %46, label %35

35:                                               ; preds = %22
  %36 = shl i32 %5, 1
  %37 = add i32 %36, 8
  br i1 %34, label %38, label %240

38:                                               ; preds = %35
  %39 = shl nuw nsw i32 %19, 4
  %40 = mul i32 %39, %37
  %41 = add i32 %40, %13
  %42 = and i32 %5, 7
  %43 = icmp ult i32 %5, 8
  br i1 %43, label %220, label %44

44:                                               ; preds = %38
  %45 = and i32 %5, -8
  br label %267

46:                                               ; preds = %22
  br i1 %34, label %50, label %47

47:                                               ; preds = %46
  %48 = shl i32 %5, 1
  %49 = add i32 %48, 8
  br label %88

50:                                               ; preds = %46
  %51 = add nuw i32 %2, 1
  %52 = shl nuw i32 %5, 1
  %53 = add i32 %52, 8
  %54 = shl nuw nsw i32 %19, 4
  %55 = mul i32 %54, %53
  %56 = add nsw i32 %2, -1
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %26, i64 %57
  %59 = and i32 %5, 3
  %60 = icmp ult i32 %5, 4
  br i1 %60, label %63, label %61

61:                                               ; preds = %50
  %62 = and i32 %5, -4
  br label %114

63:                                               ; preds = %178, %50
  %64 = phi i32 [ 0, %50 ], [ %184, %178 ]
  %65 = icmp eq i32 %59, 0
  br i1 %65, label %88, label %66

66:                                               ; preds = %63, %79
  %67 = phi i32 [ %85, %79 ], [ %64, %63 ]
  %68 = phi i32 [ %86, %79 ], [ 0, %63 ]
  %69 = shl nsw i32 %67, 4
  %70 = add nsw i32 %69, %14
  %71 = icmp eq i32 %70, -1
  br i1 %71, label %79, label %72

72:                                               ; preds = %66
  %73 = zext i32 %69 to i64
  %74 = add i32 %51, %69
  %75 = sext i32 %74 to i64
  %76 = icmp slt i32 %70, 0
  %77 = select i1 %76, i64 %75, i64 %73
  %78 = getelementptr inbounds float, float addrspace(1)* %26, i64 %77
  br label %79

79:                                               ; preds = %66, %72
  %80 = phi float addrspace(1)* [ %78, %72 ], [ %58, %66 ]
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = add nuw i32 %69, %13
  %83 = add i32 %82, %55
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %83
  store float %81, float addrspace(3)* %84, align 4, !tbaa !5
  %85 = add nuw nsw i32 %67, 1
  %86 = add nuw nsw i32 %68, 1
  %87 = icmp eq i32 %86, %59
  br i1 %87, label %88, label %66, !llvm.loop !9

88:                                               ; preds = %79, %63, %47
  %89 = phi i32 [ %49, %47 ], [ %53, %63 ], [ %53, %79 ]
  %90 = icmp sgt i32 %89, %5
  br i1 %90, label %91, label %187

91:                                               ; preds = %88
  %92 = xor i32 %2, -1
  %93 = mul i32 %89, %19
  %94 = shl i32 %93, 4
  %95 = and i32 %5, 1
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %111, label %97

97:                                               ; preds = %91
  %98 = add i32 %10, %13
  %99 = icmp eq i32 %98, %2
  %100 = icmp slt i32 %98, %2
  %101 = select i1 %100, i32 0, i32 %92
  %102 = select i1 %99, i32 -1, i32 %101
  %103 = add i32 %11, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %26, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = add i32 %11, %13
  %108 = add i32 %107, %94
  %109 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %108
  store float %106, float addrspace(3)* %109, align 4, !tbaa !5
  %110 = add nsw i32 %5, 1
  br label %111

111:                                              ; preds = %97, %91
  %112 = phi i32 [ %5, %91 ], [ %110, %97 ]
  %113 = icmp eq i32 %5, -7
  br i1 %113, label %187, label %188

114:                                              ; preds = %178, %61
  %115 = phi i32 [ 0, %61 ], [ %184, %178 ]
  %116 = phi i32 [ 0, %61 ], [ %185, %178 ]
  %117 = shl nsw i32 %115, 4
  %118 = add nsw i32 %117, %14
  %119 = icmp eq i32 %118, -1
  br i1 %119, label %127, label %120

120:                                              ; preds = %114
  %121 = zext i32 %117 to i64
  %122 = add i32 %51, %117
  %123 = sext i32 %122 to i64
  %124 = icmp slt i32 %118, 0
  %125 = select i1 %124, i64 %123, i64 %121
  %126 = getelementptr inbounds float, float addrspace(1)* %26, i64 %125
  br label %127

127:                                              ; preds = %114, %120
  %128 = phi float addrspace(1)* [ %126, %120 ], [ %58, %114 ]
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !5
  %130 = add nuw i32 %117, %13
  %131 = add i32 %130, %55
  %132 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %131
  store float %129, float addrspace(3)* %132, align 4, !tbaa !5
  %133 = shl i32 %115, 4
  %134 = or i32 %133, 16
  %135 = add nsw i32 %134, %14
  %136 = icmp eq i32 %135, -1
  br i1 %136, label %144, label %137

137:                                              ; preds = %127
  %138 = zext i32 %134 to i64
  %139 = add i32 %51, %134
  %140 = sext i32 %139 to i64
  %141 = icmp slt i32 %135, 0
  %142 = select i1 %141, i64 %140, i64 %138
  %143 = getelementptr inbounds float, float addrspace(1)* %26, i64 %142
  br label %144

144:                                              ; preds = %127, %137
  %145 = phi float addrspace(1)* [ %143, %137 ], [ %58, %127 ]
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5
  %147 = add nuw i32 %134, %13
  %148 = add i32 %147, %55
  %149 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %148
  store float %146, float addrspace(3)* %149, align 4, !tbaa !5
  %150 = shl i32 %115, 4
  %151 = or i32 %150, 32
  %152 = add nsw i32 %151, %14
  %153 = icmp eq i32 %152, -1
  br i1 %153, label %161, label %154

154:                                              ; preds = %144
  %155 = zext i32 %151 to i64
  %156 = add i32 %51, %151
  %157 = sext i32 %156 to i64
  %158 = icmp slt i32 %152, 0
  %159 = select i1 %158, i64 %157, i64 %155
  %160 = getelementptr inbounds float, float addrspace(1)* %26, i64 %159
  br label %161

161:                                              ; preds = %144, %154
  %162 = phi float addrspace(1)* [ %160, %154 ], [ %58, %144 ]
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !5
  %164 = add nuw i32 %151, %13
  %165 = add i32 %164, %55
  %166 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %165
  store float %163, float addrspace(3)* %166, align 4, !tbaa !5
  %167 = shl i32 %115, 4
  %168 = or i32 %167, 48
  %169 = add nsw i32 %168, %14
  %170 = icmp eq i32 %169, -1
  br i1 %170, label %178, label %171

171:                                              ; preds = %161
  %172 = zext i32 %168 to i64
  %173 = add i32 %51, %168
  %174 = sext i32 %173 to i64
  %175 = icmp slt i32 %169, 0
  %176 = select i1 %175, i64 %174, i64 %172
  %177 = getelementptr inbounds float, float addrspace(1)* %26, i64 %176
  br label %178

178:                                              ; preds = %161, %171
  %179 = phi float addrspace(1)* [ %177, %171 ], [ %58, %161 ]
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !5
  %181 = add nuw i32 %168, %13
  %182 = add i32 %181, %55
  %183 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %182
  store float %180, float addrspace(3)* %183, align 4, !tbaa !5
  %184 = add nuw nsw i32 %115, 4
  %185 = add i32 %116, 4
  %186 = icmp eq i32 %185, %62
  br i1 %186, label %63, label %114, !llvm.loop !11

187:                                              ; preds = %188, %111, %88
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %460

188:                                              ; preds = %111, %188
  %189 = phi i32 [ %218, %188 ], [ %112, %111 ]
  %190 = shl nsw i32 %189, 4
  %191 = add nsw i32 %190, %14
  %192 = icmp eq i32 %191, %2
  %193 = icmp slt i32 %191, %2
  %194 = select i1 %193, i32 0, i32 %92
  %195 = select i1 %192, i32 -1, i32 %194
  %196 = add i32 %190, %195
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %26, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !5
  %200 = add i32 %190, %13
  %201 = add i32 %200, %94
  %202 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %201
  store float %199, float addrspace(3)* %202, align 4, !tbaa !5
  %203 = shl i32 %189, 4
  %204 = add i32 %203, 16
  %205 = add nsw i32 %204, %14
  %206 = icmp eq i32 %205, %2
  %207 = add nuw nsw i32 %203, 15
  %208 = icmp slt i32 %205, %2
  %209 = select i1 %208, i32 0, i32 %92
  %210 = add i32 %204, %209
  %211 = select i1 %206, i32 %207, i32 %210
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %26, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !5
  %215 = add i32 %204, %13
  %216 = add i32 %215, %94
  %217 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %216
  store float %214, float addrspace(3)* %217, align 4, !tbaa !5
  %218 = add nsw i32 %189, 2
  %219 = icmp eq i32 %218, %89
  br i1 %219, label %187, label %188, !llvm.loop !13

220:                                              ; preds = %267, %38
  %221 = phi i32 [ 0, %38 ], [ %365, %267 ]
  %222 = icmp eq i32 %42, 0
  br i1 %222, label %240, label %223

223:                                              ; preds = %220, %223
  %224 = phi i32 [ %237, %223 ], [ %221, %220 ]
  %225 = phi i32 [ %238, %223 ], [ 0, %220 ]
  %226 = shl nsw i32 %224, 4
  %227 = add nsw i32 %226, %14
  %228 = zext i32 %226 to i64
  %229 = add nsw i32 %226, %2
  %230 = sext i32 %229 to i64
  %231 = icmp slt i32 %227, 0
  %232 = select i1 %231, i64 %230, i64 %228
  %233 = getelementptr inbounds float, float addrspace(1)* %26, i64 %232
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !5, !amdgpu.noclobber !14
  %235 = add i32 %41, %226
  %236 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %235
  store float %234, float addrspace(3)* %236, align 4, !tbaa !5
  %237 = add nuw nsw i32 %224, 1
  %238 = add nuw nsw i32 %225, 1
  %239 = icmp eq i32 %238, %42
  br i1 %239, label %240, label %223, !llvm.loop !15

240:                                              ; preds = %223, %220, %35
  %241 = icmp sgt i32 %37, %5
  br i1 %241, label %242, label %368

242:                                              ; preds = %240
  %243 = shl nuw nsw i32 %19, 4
  %244 = mul i32 %243, %37
  %245 = add i32 %244, %13
  %246 = and i32 %5, 7
  %247 = icmp eq i32 %246, 0
  br i1 %247, label %264, label %248

248:                                              ; preds = %242, %248
  %249 = phi i32 [ %261, %248 ], [ %5, %242 ]
  %250 = phi i32 [ %262, %248 ], [ 0, %242 ]
  %251 = shl nsw i32 %249, 4
  %252 = add nsw i32 %251, %14
  %253 = icmp slt i32 %252, %2
  %254 = select i1 %253, i32 0, i32 %2
  %255 = sub nsw i32 %251, %254
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %26, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !5, !amdgpu.noclobber !14
  %259 = add i32 %245, %251
  %260 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %259
  store float %258, float addrspace(3)* %260, align 4, !tbaa !5
  %261 = add nsw i32 %249, 1
  %262 = add nuw nsw i32 %250, 1
  %263 = icmp eq i32 %262, %246
  br i1 %263, label %264, label %248, !llvm.loop !16

264:                                              ; preds = %248, %242
  %265 = phi i32 [ %5, %242 ], [ %261, %248 ]
  %266 = icmp ugt i32 %5, -8
  br i1 %266, label %368, label %369

267:                                              ; preds = %267, %44
  %268 = phi i32 [ 0, %44 ], [ %365, %267 ]
  %269 = phi i32 [ 0, %44 ], [ %366, %267 ]
  %270 = shl nsw i32 %268, 4
  %271 = add nsw i32 %270, %14
  %272 = zext i32 %270 to i64
  %273 = add nsw i32 %270, %2
  %274 = sext i32 %273 to i64
  %275 = icmp slt i32 %271, 0
  %276 = select i1 %275, i64 %274, i64 %272
  %277 = getelementptr inbounds float, float addrspace(1)* %26, i64 %276
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !5, !amdgpu.noclobber !14
  %279 = add i32 %41, %270
  %280 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %279
  store float %278, float addrspace(3)* %280, align 4, !tbaa !5
  %281 = shl i32 %268, 4
  %282 = or i32 %281, 16
  %283 = add nsw i32 %282, %14
  %284 = zext i32 %282 to i64
  %285 = add nsw i32 %282, %2
  %286 = sext i32 %285 to i64
  %287 = icmp slt i32 %283, 0
  %288 = select i1 %287, i64 %286, i64 %284
  %289 = getelementptr inbounds float, float addrspace(1)* %26, i64 %288
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !5, !amdgpu.noclobber !14
  %291 = add i32 %41, %282
  %292 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %291
  store float %290, float addrspace(3)* %292, align 4, !tbaa !5
  %293 = shl i32 %268, 4
  %294 = or i32 %293, 32
  %295 = add nsw i32 %294, %14
  %296 = zext i32 %294 to i64
  %297 = add nsw i32 %294, %2
  %298 = sext i32 %297 to i64
  %299 = icmp slt i32 %295, 0
  %300 = select i1 %299, i64 %298, i64 %296
  %301 = getelementptr inbounds float, float addrspace(1)* %26, i64 %300
  %302 = load float, float addrspace(1)* %301, align 4, !tbaa !5, !amdgpu.noclobber !14
  %303 = add i32 %41, %294
  %304 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %303
  store float %302, float addrspace(3)* %304, align 4, !tbaa !5
  %305 = shl i32 %268, 4
  %306 = or i32 %305, 48
  %307 = add nsw i32 %306, %14
  %308 = zext i32 %306 to i64
  %309 = add nsw i32 %306, %2
  %310 = sext i32 %309 to i64
  %311 = icmp slt i32 %307, 0
  %312 = select i1 %311, i64 %310, i64 %308
  %313 = getelementptr inbounds float, float addrspace(1)* %26, i64 %312
  %314 = load float, float addrspace(1)* %313, align 4, !tbaa !5, !amdgpu.noclobber !14
  %315 = add i32 %41, %306
  %316 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %315
  store float %314, float addrspace(3)* %316, align 4, !tbaa !5
  %317 = shl i32 %268, 4
  %318 = or i32 %317, 64
  %319 = add nsw i32 %318, %14
  %320 = zext i32 %318 to i64
  %321 = add nsw i32 %318, %2
  %322 = sext i32 %321 to i64
  %323 = icmp slt i32 %319, 0
  %324 = select i1 %323, i64 %322, i64 %320
  %325 = getelementptr inbounds float, float addrspace(1)* %26, i64 %324
  %326 = load float, float addrspace(1)* %325, align 4, !tbaa !5, !amdgpu.noclobber !14
  %327 = add i32 %41, %318
  %328 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %327
  store float %326, float addrspace(3)* %328, align 4, !tbaa !5
  %329 = shl i32 %268, 4
  %330 = or i32 %329, 80
  %331 = add nsw i32 %330, %14
  %332 = zext i32 %330 to i64
  %333 = add nsw i32 %330, %2
  %334 = sext i32 %333 to i64
  %335 = icmp slt i32 %331, 0
  %336 = select i1 %335, i64 %334, i64 %332
  %337 = getelementptr inbounds float, float addrspace(1)* %26, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !5, !amdgpu.noclobber !14
  %339 = add i32 %41, %330
  %340 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %339
  store float %338, float addrspace(3)* %340, align 4, !tbaa !5
  %341 = shl i32 %268, 4
  %342 = or i32 %341, 96
  %343 = add nsw i32 %342, %14
  %344 = zext i32 %342 to i64
  %345 = add nsw i32 %342, %2
  %346 = sext i32 %345 to i64
  %347 = icmp slt i32 %343, 0
  %348 = select i1 %347, i64 %346, i64 %344
  %349 = getelementptr inbounds float, float addrspace(1)* %26, i64 %348
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !5, !amdgpu.noclobber !14
  %351 = add i32 %41, %342
  %352 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %351
  store float %350, float addrspace(3)* %352, align 4, !tbaa !5
  %353 = shl i32 %268, 4
  %354 = or i32 %353, 112
  %355 = add nsw i32 %354, %14
  %356 = zext i32 %354 to i64
  %357 = add nsw i32 %354, %2
  %358 = sext i32 %357 to i64
  %359 = icmp slt i32 %355, 0
  %360 = select i1 %359, i64 %358, i64 %356
  %361 = getelementptr inbounds float, float addrspace(1)* %26, i64 %360
  %362 = load float, float addrspace(1)* %361, align 4, !tbaa !5, !amdgpu.noclobber !14
  %363 = add i32 %41, %354
  %364 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %363
  store float %362, float addrspace(3)* %364, align 4, !tbaa !5
  %365 = add nuw nsw i32 %268, 8
  %366 = add i32 %269, 8
  %367 = icmp eq i32 %366, %45
  br i1 %367, label %220, label %267, !llvm.loop !17

368:                                              ; preds = %369, %264, %240
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %460

369:                                              ; preds = %264, %369
  %370 = phi i32 [ %458, %369 ], [ %265, %264 ]
  %371 = shl nsw i32 %370, 4
  %372 = add nsw i32 %371, %14
  %373 = icmp slt i32 %372, %2
  %374 = select i1 %373, i32 0, i32 %2
  %375 = sub nsw i32 %371, %374
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %26, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !5, !amdgpu.noclobber !14
  %379 = add i32 %245, %371
  %380 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %379
  store float %378, float addrspace(3)* %380, align 4, !tbaa !5
  %381 = shl i32 %370, 4
  %382 = add i32 %381, 16
  %383 = add nsw i32 %382, %14
  %384 = icmp slt i32 %383, %2
  %385 = select i1 %384, i32 0, i32 %2
  %386 = sub nsw i32 %382, %385
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds float, float addrspace(1)* %26, i64 %387
  %389 = load float, float addrspace(1)* %388, align 4, !tbaa !5, !amdgpu.noclobber !14
  %390 = add i32 %245, %382
  %391 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %390
  store float %389, float addrspace(3)* %391, align 4, !tbaa !5
  %392 = shl i32 %370, 4
  %393 = add i32 %392, 32
  %394 = add nsw i32 %393, %14
  %395 = icmp slt i32 %394, %2
  %396 = select i1 %395, i32 0, i32 %2
  %397 = sub nsw i32 %393, %396
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds float, float addrspace(1)* %26, i64 %398
  %400 = load float, float addrspace(1)* %399, align 4, !tbaa !5, !amdgpu.noclobber !14
  %401 = add i32 %245, %393
  %402 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %401
  store float %400, float addrspace(3)* %402, align 4, !tbaa !5
  %403 = shl i32 %370, 4
  %404 = add i32 %403, 48
  %405 = add nsw i32 %404, %14
  %406 = icmp slt i32 %405, %2
  %407 = select i1 %406, i32 0, i32 %2
  %408 = sub nsw i32 %404, %407
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds float, float addrspace(1)* %26, i64 %409
  %411 = load float, float addrspace(1)* %410, align 4, !tbaa !5, !amdgpu.noclobber !14
  %412 = add i32 %245, %404
  %413 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %412
  store float %411, float addrspace(3)* %413, align 4, !tbaa !5
  %414 = shl i32 %370, 4
  %415 = add i32 %414, 64
  %416 = add nsw i32 %415, %14
  %417 = icmp slt i32 %416, %2
  %418 = select i1 %417, i32 0, i32 %2
  %419 = sub nsw i32 %415, %418
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds float, float addrspace(1)* %26, i64 %420
  %422 = load float, float addrspace(1)* %421, align 4, !tbaa !5, !amdgpu.noclobber !14
  %423 = add i32 %245, %415
  %424 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %423
  store float %422, float addrspace(3)* %424, align 4, !tbaa !5
  %425 = shl i32 %370, 4
  %426 = add i32 %425, 80
  %427 = add nsw i32 %426, %14
  %428 = icmp slt i32 %427, %2
  %429 = select i1 %428, i32 0, i32 %2
  %430 = sub nsw i32 %426, %429
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds float, float addrspace(1)* %26, i64 %431
  %433 = load float, float addrspace(1)* %432, align 4, !tbaa !5, !amdgpu.noclobber !14
  %434 = add i32 %245, %426
  %435 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %434
  store float %433, float addrspace(3)* %435, align 4, !tbaa !5
  %436 = shl i32 %370, 4
  %437 = add i32 %436, 96
  %438 = add nsw i32 %437, %14
  %439 = icmp slt i32 %438, %2
  %440 = select i1 %439, i32 0, i32 %2
  %441 = sub nsw i32 %437, %440
  %442 = sext i32 %441 to i64
  %443 = getelementptr inbounds float, float addrspace(1)* %26, i64 %442
  %444 = load float, float addrspace(1)* %443, align 4, !tbaa !5, !amdgpu.noclobber !14
  %445 = add i32 %245, %437
  %446 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %445
  store float %444, float addrspace(3)* %446, align 4, !tbaa !5
  %447 = shl i32 %370, 4
  %448 = add i32 %447, 112
  %449 = add nsw i32 %448, %14
  %450 = icmp slt i32 %449, %2
  %451 = select i1 %450, i32 0, i32 %2
  %452 = sub nsw i32 %448, %451
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds float, float addrspace(1)* %26, i64 %453
  %455 = load float, float addrspace(1)* %454, align 4, !tbaa !5, !amdgpu.noclobber !14
  %456 = add i32 %245, %448
  %457 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %456
  store float %455, float addrspace(3)* %457, align 4, !tbaa !5
  %458 = add nsw i32 %370, 8
  %459 = icmp eq i32 %370, %36
  br i1 %459, label %368, label %369, !llvm.loop !18

460:                                              ; preds = %368, %187
  %461 = phi i32 [ %37, %368 ], [ %89, %187 ]
  fence syncscope("workgroup") acquire
  %462 = sdiv i32 %4, 2
  %463 = icmp sgt i32 %4, 0
  %464 = load float*, float* addrspace(4)* @c_lpd, align 8
  %465 = shl nuw nsw i32 %19, 4
  %466 = mul i32 %465, %461
  %467 = shl nuw nsw i32 %13, 1
  %468 = add nsw i32 %462, %467
  %469 = add i32 %468, %11
  %470 = add i32 %469, %466
  %471 = load float*, float* addrspace(4)* @c_hpd, align 8
  %472 = icmp slt i32 %16, %3
  br i1 %472, label %473, label %620

473:                                              ; preds = %460
  br i1 %463, label %474, label %506

474:                                              ; preds = %473
  %475 = and i32 %4, 7
  %476 = icmp ult i32 %4, 8
  br i1 %476, label %479, label %477

477:                                              ; preds = %474
  %478 = and i32 %4, -8
  br label %509

479:                                              ; preds = %509, %474
  %480 = phi float [ undef, %474 ], [ %612, %509 ]
  %481 = phi float [ undef, %474 ], [ %616, %509 ]
  %482 = phi i32 [ 0, %474 ], [ %617, %509 ]
  %483 = phi float [ 0.000000e+00, %474 ], [ %616, %509 ]
  %484 = phi float [ 0.000000e+00, %474 ], [ %612, %509 ]
  %485 = icmp eq i32 %475, 0
  br i1 %485, label %506, label %486

486:                                              ; preds = %479, %486
  %487 = phi i32 [ %503, %486 ], [ %482, %479 ]
  %488 = phi float [ %502, %486 ], [ %483, %479 ]
  %489 = phi float [ %498, %486 ], [ %484, %479 ]
  %490 = phi i32 [ %504, %486 ], [ 0, %479 ]
  %491 = zext i32 %487 to i64
  %492 = getelementptr inbounds float, float* %464, i64 %491
  %493 = load float, float* %492, align 4, !tbaa !5
  %494 = sub i32 %470, %487
  %495 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %494
  %496 = load float, float addrspace(3)* %495, align 4, !tbaa !5
  %497 = fmul contract float %493, %496
  %498 = fadd contract float %489, %497
  %499 = getelementptr inbounds float, float* %471, i64 %491
  %500 = load float, float* %499, align 4, !tbaa !5
  %501 = fmul contract float %496, %500
  %502 = fadd contract float %488, %501
  %503 = add nuw nsw i32 %487, 1
  %504 = add i32 %490, 1
  %505 = icmp eq i32 %504, %475
  br i1 %505, label %506, label %486, !llvm.loop !19

506:                                              ; preds = %479, %486, %473
  %507 = phi float [ 0.000000e+00, %473 ], [ %480, %479 ], [ %498, %486 ]
  %508 = phi float [ 0.000000e+00, %473 ], [ %481, %479 ], [ %502, %486 ]
  store float %507, float addrspace(1)* %30, align 4, !tbaa !5
  store float %508, float addrspace(1)* %31, align 4, !tbaa !5
  br label %620

509:                                              ; preds = %509, %477
  %510 = phi i32 [ 0, %477 ], [ %617, %509 ]
  %511 = phi float [ 0.000000e+00, %477 ], [ %616, %509 ]
  %512 = phi float [ 0.000000e+00, %477 ], [ %612, %509 ]
  %513 = phi i32 [ 0, %477 ], [ %618, %509 ]
  %514 = zext i32 %510 to i64
  %515 = getelementptr inbounds float, float* %464, i64 %514
  %516 = load float, float* %515, align 4, !tbaa !5
  %517 = sub i32 %470, %510
  %518 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %517
  %519 = load float, float addrspace(3)* %518, align 4, !tbaa !5
  %520 = fmul contract float %516, %519
  %521 = fadd contract float %512, %520
  %522 = getelementptr inbounds float, float* %471, i64 %514
  %523 = load float, float* %522, align 4, !tbaa !5
  %524 = fmul contract float %519, %523
  %525 = fadd contract float %511, %524
  %526 = or i32 %510, 1
  %527 = zext i32 %526 to i64
  %528 = getelementptr inbounds float, float* %464, i64 %527
  %529 = load float, float* %528, align 4, !tbaa !5
  %530 = sub i32 %470, %526
  %531 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %530
  %532 = load float, float addrspace(3)* %531, align 4, !tbaa !5
  %533 = fmul contract float %529, %532
  %534 = fadd contract float %521, %533
  %535 = getelementptr inbounds float, float* %471, i64 %527
  %536 = load float, float* %535, align 4, !tbaa !5
  %537 = fmul contract float %532, %536
  %538 = fadd contract float %525, %537
  %539 = or i32 %510, 2
  %540 = zext i32 %539 to i64
  %541 = getelementptr inbounds float, float* %464, i64 %540
  %542 = load float, float* %541, align 4, !tbaa !5
  %543 = sub i32 %470, %539
  %544 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %543
  %545 = load float, float addrspace(3)* %544, align 4, !tbaa !5
  %546 = fmul contract float %542, %545
  %547 = fadd contract float %534, %546
  %548 = getelementptr inbounds float, float* %471, i64 %540
  %549 = load float, float* %548, align 4, !tbaa !5
  %550 = fmul contract float %545, %549
  %551 = fadd contract float %538, %550
  %552 = or i32 %510, 3
  %553 = zext i32 %552 to i64
  %554 = getelementptr inbounds float, float* %464, i64 %553
  %555 = load float, float* %554, align 4, !tbaa !5
  %556 = sub i32 %470, %552
  %557 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %556
  %558 = load float, float addrspace(3)* %557, align 4, !tbaa !5
  %559 = fmul contract float %555, %558
  %560 = fadd contract float %547, %559
  %561 = getelementptr inbounds float, float* %471, i64 %553
  %562 = load float, float* %561, align 4, !tbaa !5
  %563 = fmul contract float %558, %562
  %564 = fadd contract float %551, %563
  %565 = or i32 %510, 4
  %566 = zext i32 %565 to i64
  %567 = getelementptr inbounds float, float* %464, i64 %566
  %568 = load float, float* %567, align 4, !tbaa !5
  %569 = sub i32 %470, %565
  %570 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %569
  %571 = load float, float addrspace(3)* %570, align 4, !tbaa !5
  %572 = fmul contract float %568, %571
  %573 = fadd contract float %560, %572
  %574 = getelementptr inbounds float, float* %471, i64 %566
  %575 = load float, float* %574, align 4, !tbaa !5
  %576 = fmul contract float %571, %575
  %577 = fadd contract float %564, %576
  %578 = or i32 %510, 5
  %579 = zext i32 %578 to i64
  %580 = getelementptr inbounds float, float* %464, i64 %579
  %581 = load float, float* %580, align 4, !tbaa !5
  %582 = sub i32 %470, %578
  %583 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %582
  %584 = load float, float addrspace(3)* %583, align 4, !tbaa !5
  %585 = fmul contract float %581, %584
  %586 = fadd contract float %573, %585
  %587 = getelementptr inbounds float, float* %471, i64 %579
  %588 = load float, float* %587, align 4, !tbaa !5
  %589 = fmul contract float %584, %588
  %590 = fadd contract float %577, %589
  %591 = or i32 %510, 6
  %592 = zext i32 %591 to i64
  %593 = getelementptr inbounds float, float* %464, i64 %592
  %594 = load float, float* %593, align 4, !tbaa !5
  %595 = sub i32 %470, %591
  %596 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %595
  %597 = load float, float addrspace(3)* %596, align 4, !tbaa !5
  %598 = fmul contract float %594, %597
  %599 = fadd contract float %586, %598
  %600 = getelementptr inbounds float, float* %471, i64 %592
  %601 = load float, float* %600, align 4, !tbaa !5
  %602 = fmul contract float %597, %601
  %603 = fadd contract float %590, %602
  %604 = or i32 %510, 7
  %605 = zext i32 %604 to i64
  %606 = getelementptr inbounds float, float* %464, i64 %605
  %607 = load float, float* %606, align 4, !tbaa !5
  %608 = sub i32 %470, %604
  %609 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %608
  %610 = load float, float addrspace(3)* %609, align 4, !tbaa !5
  %611 = fmul contract float %607, %610
  %612 = fadd contract float %599, %611
  %613 = getelementptr inbounds float, float* %471, i64 %605
  %614 = load float, float* %613, align 4, !tbaa !5
  %615 = fmul contract float %610, %614
  %616 = fadd contract float %603, %615
  %617 = add nuw nsw i32 %510, 8
  %618 = add i32 %513, 8
  %619 = icmp eq i32 %618, %478
  br i1 %619, label %479, label %509, !llvm.loop !20

620:                                              ; preds = %460, %506
  %621 = add nsw i32 %16, 16
  %622 = icmp slt i32 %621, %3
  br i1 %622, label %623, label %781

623:                                              ; preds = %620
  br i1 %463, label %624, label %776

624:                                              ; preds = %623
  %625 = and i32 %4, 7
  %626 = icmp ult i32 %4, 8
  br i1 %626, label %748, label %627

627:                                              ; preds = %624
  %628 = and i32 %4, -8
  br label %629

629:                                              ; preds = %629, %627
  %630 = phi i32 [ 0, %627 ], [ %745, %629 ]
  %631 = phi float [ 0.000000e+00, %627 ], [ %744, %629 ]
  %632 = phi float [ 0.000000e+00, %627 ], [ %740, %629 ]
  %633 = phi i32 [ 0, %627 ], [ %746, %629 ]
  %634 = zext i32 %630 to i64
  %635 = getelementptr inbounds float, float* %464, i64 %634
  %636 = load float, float* %635, align 4, !tbaa !5
  %637 = sub i32 %470, %630
  %638 = add i32 %637, 32
  %639 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %638
  %640 = load float, float addrspace(3)* %639, align 4, !tbaa !5
  %641 = fmul contract float %636, %640
  %642 = fadd contract float %632, %641
  %643 = getelementptr inbounds float, float* %471, i64 %634
  %644 = load float, float* %643, align 4, !tbaa !5
  %645 = fmul contract float %640, %644
  %646 = fadd contract float %631, %645
  %647 = or i32 %630, 1
  %648 = zext i32 %647 to i64
  %649 = getelementptr inbounds float, float* %464, i64 %648
  %650 = load float, float* %649, align 4, !tbaa !5
  %651 = sub i32 %470, %647
  %652 = add i32 %651, 32
  %653 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %652
  %654 = load float, float addrspace(3)* %653, align 4, !tbaa !5
  %655 = fmul contract float %650, %654
  %656 = fadd contract float %642, %655
  %657 = getelementptr inbounds float, float* %471, i64 %648
  %658 = load float, float* %657, align 4, !tbaa !5
  %659 = fmul contract float %654, %658
  %660 = fadd contract float %646, %659
  %661 = or i32 %630, 2
  %662 = zext i32 %661 to i64
  %663 = getelementptr inbounds float, float* %464, i64 %662
  %664 = load float, float* %663, align 4, !tbaa !5
  %665 = sub i32 %470, %661
  %666 = add i32 %665, 32
  %667 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %666
  %668 = load float, float addrspace(3)* %667, align 4, !tbaa !5
  %669 = fmul contract float %664, %668
  %670 = fadd contract float %656, %669
  %671 = getelementptr inbounds float, float* %471, i64 %662
  %672 = load float, float* %671, align 4, !tbaa !5
  %673 = fmul contract float %668, %672
  %674 = fadd contract float %660, %673
  %675 = or i32 %630, 3
  %676 = zext i32 %675 to i64
  %677 = getelementptr inbounds float, float* %464, i64 %676
  %678 = load float, float* %677, align 4, !tbaa !5
  %679 = sub i32 %470, %675
  %680 = add i32 %679, 32
  %681 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %680
  %682 = load float, float addrspace(3)* %681, align 4, !tbaa !5
  %683 = fmul contract float %678, %682
  %684 = fadd contract float %670, %683
  %685 = getelementptr inbounds float, float* %471, i64 %676
  %686 = load float, float* %685, align 4, !tbaa !5
  %687 = fmul contract float %682, %686
  %688 = fadd contract float %674, %687
  %689 = or i32 %630, 4
  %690 = zext i32 %689 to i64
  %691 = getelementptr inbounds float, float* %464, i64 %690
  %692 = load float, float* %691, align 4, !tbaa !5
  %693 = sub i32 %470, %689
  %694 = add i32 %693, 32
  %695 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %694
  %696 = load float, float addrspace(3)* %695, align 4, !tbaa !5
  %697 = fmul contract float %692, %696
  %698 = fadd contract float %684, %697
  %699 = getelementptr inbounds float, float* %471, i64 %690
  %700 = load float, float* %699, align 4, !tbaa !5
  %701 = fmul contract float %696, %700
  %702 = fadd contract float %688, %701
  %703 = or i32 %630, 5
  %704 = zext i32 %703 to i64
  %705 = getelementptr inbounds float, float* %464, i64 %704
  %706 = load float, float* %705, align 4, !tbaa !5
  %707 = sub i32 %470, %703
  %708 = add i32 %707, 32
  %709 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %708
  %710 = load float, float addrspace(3)* %709, align 4, !tbaa !5
  %711 = fmul contract float %706, %710
  %712 = fadd contract float %698, %711
  %713 = getelementptr inbounds float, float* %471, i64 %704
  %714 = load float, float* %713, align 4, !tbaa !5
  %715 = fmul contract float %710, %714
  %716 = fadd contract float %702, %715
  %717 = or i32 %630, 6
  %718 = zext i32 %717 to i64
  %719 = getelementptr inbounds float, float* %464, i64 %718
  %720 = load float, float* %719, align 4, !tbaa !5
  %721 = sub i32 %470, %717
  %722 = add i32 %721, 32
  %723 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %722
  %724 = load float, float addrspace(3)* %723, align 4, !tbaa !5
  %725 = fmul contract float %720, %724
  %726 = fadd contract float %712, %725
  %727 = getelementptr inbounds float, float* %471, i64 %718
  %728 = load float, float* %727, align 4, !tbaa !5
  %729 = fmul contract float %724, %728
  %730 = fadd contract float %716, %729
  %731 = or i32 %630, 7
  %732 = zext i32 %731 to i64
  %733 = getelementptr inbounds float, float* %464, i64 %732
  %734 = load float, float* %733, align 4, !tbaa !5
  %735 = sub i32 %470, %731
  %736 = add i32 %735, 32
  %737 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %736
  %738 = load float, float addrspace(3)* %737, align 4, !tbaa !5
  %739 = fmul contract float %734, %738
  %740 = fadd contract float %726, %739
  %741 = getelementptr inbounds float, float* %471, i64 %732
  %742 = load float, float* %741, align 4, !tbaa !5
  %743 = fmul contract float %738, %742
  %744 = fadd contract float %730, %743
  %745 = add nuw nsw i32 %630, 8
  %746 = add i32 %633, 8
  %747 = icmp eq i32 %746, %628
  br i1 %747, label %748, label %629, !llvm.loop !20

748:                                              ; preds = %629, %624
  %749 = phi float [ undef, %624 ], [ %740, %629 ]
  %750 = phi float [ undef, %624 ], [ %744, %629 ]
  %751 = phi i32 [ 0, %624 ], [ %745, %629 ]
  %752 = phi float [ 0.000000e+00, %624 ], [ %744, %629 ]
  %753 = phi float [ 0.000000e+00, %624 ], [ %740, %629 ]
  %754 = icmp eq i32 %625, 0
  br i1 %754, label %776, label %755

755:                                              ; preds = %748, %755
  %756 = phi i32 [ %773, %755 ], [ %751, %748 ]
  %757 = phi float [ %772, %755 ], [ %752, %748 ]
  %758 = phi float [ %768, %755 ], [ %753, %748 ]
  %759 = phi i32 [ %774, %755 ], [ 0, %748 ]
  %760 = zext i32 %756 to i64
  %761 = getelementptr inbounds float, float* %464, i64 %760
  %762 = load float, float* %761, align 4, !tbaa !5
  %763 = sub i32 %470, %756
  %764 = add i32 %763, 32
  %765 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %764
  %766 = load float, float addrspace(3)* %765, align 4, !tbaa !5
  %767 = fmul contract float %762, %766
  %768 = fadd contract float %758, %767
  %769 = getelementptr inbounds float, float* %471, i64 %760
  %770 = load float, float* %769, align 4, !tbaa !5
  %771 = fmul contract float %766, %770
  %772 = fadd contract float %757, %771
  %773 = add nuw nsw i32 %756, 1
  %774 = add i32 %759, 1
  %775 = icmp eq i32 %774, %625
  br i1 %775, label %776, label %755, !llvm.loop !21

776:                                              ; preds = %748, %755, %623
  %777 = phi float [ 0.000000e+00, %623 ], [ %749, %748 ], [ %768, %755 ]
  %778 = phi float [ 0.000000e+00, %623 ], [ %750, %748 ], [ %772, %755 ]
  %779 = getelementptr inbounds float, float addrspace(1)* %30, i64 16
  store float %777, float addrspace(1)* %779, align 4, !tbaa !5
  %780 = getelementptr inbounds float, float addrspace(1)* %31, i64 16
  store float %778, float addrspace(1)* %780, align 4, !tbaa !5
  br label %781

781:                                              ; preds = %776, %620
  %782 = add nsw i32 %16, 32
  %783 = icmp slt i32 %782, %3
  br i1 %783, label %784, label %942

784:                                              ; preds = %781
  br i1 %463, label %785, label %937

785:                                              ; preds = %784
  %786 = and i32 %4, 7
  %787 = icmp ult i32 %4, 8
  br i1 %787, label %909, label %788

788:                                              ; preds = %785
  %789 = and i32 %4, -8
  br label %790

790:                                              ; preds = %790, %788
  %791 = phi i32 [ 0, %788 ], [ %906, %790 ]
  %792 = phi float [ 0.000000e+00, %788 ], [ %905, %790 ]
  %793 = phi float [ 0.000000e+00, %788 ], [ %901, %790 ]
  %794 = phi i32 [ 0, %788 ], [ %907, %790 ]
  %795 = zext i32 %791 to i64
  %796 = getelementptr inbounds float, float* %464, i64 %795
  %797 = load float, float* %796, align 4, !tbaa !5
  %798 = sub i32 %470, %791
  %799 = add i32 %798, 64
  %800 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %799
  %801 = load float, float addrspace(3)* %800, align 4, !tbaa !5
  %802 = fmul contract float %797, %801
  %803 = fadd contract float %793, %802
  %804 = getelementptr inbounds float, float* %471, i64 %795
  %805 = load float, float* %804, align 4, !tbaa !5
  %806 = fmul contract float %801, %805
  %807 = fadd contract float %792, %806
  %808 = or i32 %791, 1
  %809 = zext i32 %808 to i64
  %810 = getelementptr inbounds float, float* %464, i64 %809
  %811 = load float, float* %810, align 4, !tbaa !5
  %812 = sub i32 %470, %808
  %813 = add i32 %812, 64
  %814 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %813
  %815 = load float, float addrspace(3)* %814, align 4, !tbaa !5
  %816 = fmul contract float %811, %815
  %817 = fadd contract float %803, %816
  %818 = getelementptr inbounds float, float* %471, i64 %809
  %819 = load float, float* %818, align 4, !tbaa !5
  %820 = fmul contract float %815, %819
  %821 = fadd contract float %807, %820
  %822 = or i32 %791, 2
  %823 = zext i32 %822 to i64
  %824 = getelementptr inbounds float, float* %464, i64 %823
  %825 = load float, float* %824, align 4, !tbaa !5
  %826 = sub i32 %470, %822
  %827 = add i32 %826, 64
  %828 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %827
  %829 = load float, float addrspace(3)* %828, align 4, !tbaa !5
  %830 = fmul contract float %825, %829
  %831 = fadd contract float %817, %830
  %832 = getelementptr inbounds float, float* %471, i64 %823
  %833 = load float, float* %832, align 4, !tbaa !5
  %834 = fmul contract float %829, %833
  %835 = fadd contract float %821, %834
  %836 = or i32 %791, 3
  %837 = zext i32 %836 to i64
  %838 = getelementptr inbounds float, float* %464, i64 %837
  %839 = load float, float* %838, align 4, !tbaa !5
  %840 = sub i32 %470, %836
  %841 = add i32 %840, 64
  %842 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %841
  %843 = load float, float addrspace(3)* %842, align 4, !tbaa !5
  %844 = fmul contract float %839, %843
  %845 = fadd contract float %831, %844
  %846 = getelementptr inbounds float, float* %471, i64 %837
  %847 = load float, float* %846, align 4, !tbaa !5
  %848 = fmul contract float %843, %847
  %849 = fadd contract float %835, %848
  %850 = or i32 %791, 4
  %851 = zext i32 %850 to i64
  %852 = getelementptr inbounds float, float* %464, i64 %851
  %853 = load float, float* %852, align 4, !tbaa !5
  %854 = sub i32 %470, %850
  %855 = add i32 %854, 64
  %856 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %855
  %857 = load float, float addrspace(3)* %856, align 4, !tbaa !5
  %858 = fmul contract float %853, %857
  %859 = fadd contract float %845, %858
  %860 = getelementptr inbounds float, float* %471, i64 %851
  %861 = load float, float* %860, align 4, !tbaa !5
  %862 = fmul contract float %857, %861
  %863 = fadd contract float %849, %862
  %864 = or i32 %791, 5
  %865 = zext i32 %864 to i64
  %866 = getelementptr inbounds float, float* %464, i64 %865
  %867 = load float, float* %866, align 4, !tbaa !5
  %868 = sub i32 %470, %864
  %869 = add i32 %868, 64
  %870 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %869
  %871 = load float, float addrspace(3)* %870, align 4, !tbaa !5
  %872 = fmul contract float %867, %871
  %873 = fadd contract float %859, %872
  %874 = getelementptr inbounds float, float* %471, i64 %865
  %875 = load float, float* %874, align 4, !tbaa !5
  %876 = fmul contract float %871, %875
  %877 = fadd contract float %863, %876
  %878 = or i32 %791, 6
  %879 = zext i32 %878 to i64
  %880 = getelementptr inbounds float, float* %464, i64 %879
  %881 = load float, float* %880, align 4, !tbaa !5
  %882 = sub i32 %470, %878
  %883 = add i32 %882, 64
  %884 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %883
  %885 = load float, float addrspace(3)* %884, align 4, !tbaa !5
  %886 = fmul contract float %881, %885
  %887 = fadd contract float %873, %886
  %888 = getelementptr inbounds float, float* %471, i64 %879
  %889 = load float, float* %888, align 4, !tbaa !5
  %890 = fmul contract float %885, %889
  %891 = fadd contract float %877, %890
  %892 = or i32 %791, 7
  %893 = zext i32 %892 to i64
  %894 = getelementptr inbounds float, float* %464, i64 %893
  %895 = load float, float* %894, align 4, !tbaa !5
  %896 = sub i32 %470, %892
  %897 = add i32 %896, 64
  %898 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %897
  %899 = load float, float addrspace(3)* %898, align 4, !tbaa !5
  %900 = fmul contract float %895, %899
  %901 = fadd contract float %887, %900
  %902 = getelementptr inbounds float, float* %471, i64 %893
  %903 = load float, float* %902, align 4, !tbaa !5
  %904 = fmul contract float %899, %903
  %905 = fadd contract float %891, %904
  %906 = add nuw nsw i32 %791, 8
  %907 = add i32 %794, 8
  %908 = icmp eq i32 %907, %789
  br i1 %908, label %909, label %790, !llvm.loop !20

909:                                              ; preds = %790, %785
  %910 = phi float [ undef, %785 ], [ %901, %790 ]
  %911 = phi float [ undef, %785 ], [ %905, %790 ]
  %912 = phi i32 [ 0, %785 ], [ %906, %790 ]
  %913 = phi float [ 0.000000e+00, %785 ], [ %905, %790 ]
  %914 = phi float [ 0.000000e+00, %785 ], [ %901, %790 ]
  %915 = icmp eq i32 %786, 0
  br i1 %915, label %937, label %916

916:                                              ; preds = %909, %916
  %917 = phi i32 [ %934, %916 ], [ %912, %909 ]
  %918 = phi float [ %933, %916 ], [ %913, %909 ]
  %919 = phi float [ %929, %916 ], [ %914, %909 ]
  %920 = phi i32 [ %935, %916 ], [ 0, %909 ]
  %921 = zext i32 %917 to i64
  %922 = getelementptr inbounds float, float* %464, i64 %921
  %923 = load float, float* %922, align 4, !tbaa !5
  %924 = sub i32 %470, %917
  %925 = add i32 %924, 64
  %926 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %925
  %927 = load float, float addrspace(3)* %926, align 4, !tbaa !5
  %928 = fmul contract float %923, %927
  %929 = fadd contract float %919, %928
  %930 = getelementptr inbounds float, float* %471, i64 %921
  %931 = load float, float* %930, align 4, !tbaa !5
  %932 = fmul contract float %927, %931
  %933 = fadd contract float %918, %932
  %934 = add nuw nsw i32 %917, 1
  %935 = add i32 %920, 1
  %936 = icmp eq i32 %935, %786
  br i1 %936, label %937, label %916, !llvm.loop !22

937:                                              ; preds = %909, %916, %784
  %938 = phi float [ 0.000000e+00, %784 ], [ %910, %909 ], [ %929, %916 ]
  %939 = phi float [ 0.000000e+00, %784 ], [ %911, %909 ], [ %933, %916 ]
  %940 = getelementptr inbounds float, float addrspace(1)* %30, i64 32
  store float %938, float addrspace(1)* %940, align 4, !tbaa !5
  %941 = getelementptr inbounds float, float addrspace(1)* %31, i64 32
  store float %939, float addrspace(1)* %941, align 4, !tbaa !5
  br label %942

942:                                              ; preds = %937, %781
  %943 = add nsw i32 %16, 48
  %944 = icmp slt i32 %943, %3
  br i1 %944, label %945, label %1103

945:                                              ; preds = %942
  br i1 %463, label %946, label %1098

946:                                              ; preds = %945
  %947 = and i32 %4, 7
  %948 = icmp ult i32 %4, 8
  br i1 %948, label %1070, label %949

949:                                              ; preds = %946
  %950 = and i32 %4, -8
  br label %951

951:                                              ; preds = %951, %949
  %952 = phi i32 [ 0, %949 ], [ %1067, %951 ]
  %953 = phi float [ 0.000000e+00, %949 ], [ %1066, %951 ]
  %954 = phi float [ 0.000000e+00, %949 ], [ %1062, %951 ]
  %955 = phi i32 [ 0, %949 ], [ %1068, %951 ]
  %956 = zext i32 %952 to i64
  %957 = getelementptr inbounds float, float* %464, i64 %956
  %958 = load float, float* %957, align 4, !tbaa !5
  %959 = sub i32 %470, %952
  %960 = add i32 %959, 96
  %961 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %960
  %962 = load float, float addrspace(3)* %961, align 4, !tbaa !5
  %963 = fmul contract float %958, %962
  %964 = fadd contract float %954, %963
  %965 = getelementptr inbounds float, float* %471, i64 %956
  %966 = load float, float* %965, align 4, !tbaa !5
  %967 = fmul contract float %962, %966
  %968 = fadd contract float %953, %967
  %969 = or i32 %952, 1
  %970 = zext i32 %969 to i64
  %971 = getelementptr inbounds float, float* %464, i64 %970
  %972 = load float, float* %971, align 4, !tbaa !5
  %973 = sub i32 %470, %969
  %974 = add i32 %973, 96
  %975 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %974
  %976 = load float, float addrspace(3)* %975, align 4, !tbaa !5
  %977 = fmul contract float %972, %976
  %978 = fadd contract float %964, %977
  %979 = getelementptr inbounds float, float* %471, i64 %970
  %980 = load float, float* %979, align 4, !tbaa !5
  %981 = fmul contract float %976, %980
  %982 = fadd contract float %968, %981
  %983 = or i32 %952, 2
  %984 = zext i32 %983 to i64
  %985 = getelementptr inbounds float, float* %464, i64 %984
  %986 = load float, float* %985, align 4, !tbaa !5
  %987 = sub i32 %470, %983
  %988 = add i32 %987, 96
  %989 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %988
  %990 = load float, float addrspace(3)* %989, align 4, !tbaa !5
  %991 = fmul contract float %986, %990
  %992 = fadd contract float %978, %991
  %993 = getelementptr inbounds float, float* %471, i64 %984
  %994 = load float, float* %993, align 4, !tbaa !5
  %995 = fmul contract float %990, %994
  %996 = fadd contract float %982, %995
  %997 = or i32 %952, 3
  %998 = zext i32 %997 to i64
  %999 = getelementptr inbounds float, float* %464, i64 %998
  %1000 = load float, float* %999, align 4, !tbaa !5
  %1001 = sub i32 %470, %997
  %1002 = add i32 %1001, 96
  %1003 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1002
  %1004 = load float, float addrspace(3)* %1003, align 4, !tbaa !5
  %1005 = fmul contract float %1000, %1004
  %1006 = fadd contract float %992, %1005
  %1007 = getelementptr inbounds float, float* %471, i64 %998
  %1008 = load float, float* %1007, align 4, !tbaa !5
  %1009 = fmul contract float %1004, %1008
  %1010 = fadd contract float %996, %1009
  %1011 = or i32 %952, 4
  %1012 = zext i32 %1011 to i64
  %1013 = getelementptr inbounds float, float* %464, i64 %1012
  %1014 = load float, float* %1013, align 4, !tbaa !5
  %1015 = sub i32 %470, %1011
  %1016 = add i32 %1015, 96
  %1017 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1016
  %1018 = load float, float addrspace(3)* %1017, align 4, !tbaa !5
  %1019 = fmul contract float %1014, %1018
  %1020 = fadd contract float %1006, %1019
  %1021 = getelementptr inbounds float, float* %471, i64 %1012
  %1022 = load float, float* %1021, align 4, !tbaa !5
  %1023 = fmul contract float %1018, %1022
  %1024 = fadd contract float %1010, %1023
  %1025 = or i32 %952, 5
  %1026 = zext i32 %1025 to i64
  %1027 = getelementptr inbounds float, float* %464, i64 %1026
  %1028 = load float, float* %1027, align 4, !tbaa !5
  %1029 = sub i32 %470, %1025
  %1030 = add i32 %1029, 96
  %1031 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1030
  %1032 = load float, float addrspace(3)* %1031, align 4, !tbaa !5
  %1033 = fmul contract float %1028, %1032
  %1034 = fadd contract float %1020, %1033
  %1035 = getelementptr inbounds float, float* %471, i64 %1026
  %1036 = load float, float* %1035, align 4, !tbaa !5
  %1037 = fmul contract float %1032, %1036
  %1038 = fadd contract float %1024, %1037
  %1039 = or i32 %952, 6
  %1040 = zext i32 %1039 to i64
  %1041 = getelementptr inbounds float, float* %464, i64 %1040
  %1042 = load float, float* %1041, align 4, !tbaa !5
  %1043 = sub i32 %470, %1039
  %1044 = add i32 %1043, 96
  %1045 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1044
  %1046 = load float, float addrspace(3)* %1045, align 4, !tbaa !5
  %1047 = fmul contract float %1042, %1046
  %1048 = fadd contract float %1034, %1047
  %1049 = getelementptr inbounds float, float* %471, i64 %1040
  %1050 = load float, float* %1049, align 4, !tbaa !5
  %1051 = fmul contract float %1046, %1050
  %1052 = fadd contract float %1038, %1051
  %1053 = or i32 %952, 7
  %1054 = zext i32 %1053 to i64
  %1055 = getelementptr inbounds float, float* %464, i64 %1054
  %1056 = load float, float* %1055, align 4, !tbaa !5
  %1057 = sub i32 %470, %1053
  %1058 = add i32 %1057, 96
  %1059 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1058
  %1060 = load float, float addrspace(3)* %1059, align 4, !tbaa !5
  %1061 = fmul contract float %1056, %1060
  %1062 = fadd contract float %1048, %1061
  %1063 = getelementptr inbounds float, float* %471, i64 %1054
  %1064 = load float, float* %1063, align 4, !tbaa !5
  %1065 = fmul contract float %1060, %1064
  %1066 = fadd contract float %1052, %1065
  %1067 = add nuw nsw i32 %952, 8
  %1068 = add i32 %955, 8
  %1069 = icmp eq i32 %1068, %950
  br i1 %1069, label %1070, label %951, !llvm.loop !20

1070:                                             ; preds = %951, %946
  %1071 = phi float [ undef, %946 ], [ %1062, %951 ]
  %1072 = phi float [ undef, %946 ], [ %1066, %951 ]
  %1073 = phi i32 [ 0, %946 ], [ %1067, %951 ]
  %1074 = phi float [ 0.000000e+00, %946 ], [ %1066, %951 ]
  %1075 = phi float [ 0.000000e+00, %946 ], [ %1062, %951 ]
  %1076 = icmp eq i32 %947, 0
  br i1 %1076, label %1098, label %1077

1077:                                             ; preds = %1070, %1077
  %1078 = phi i32 [ %1095, %1077 ], [ %1073, %1070 ]
  %1079 = phi float [ %1094, %1077 ], [ %1074, %1070 ]
  %1080 = phi float [ %1090, %1077 ], [ %1075, %1070 ]
  %1081 = phi i32 [ %1096, %1077 ], [ 0, %1070 ]
  %1082 = zext i32 %1078 to i64
  %1083 = getelementptr inbounds float, float* %464, i64 %1082
  %1084 = load float, float* %1083, align 4, !tbaa !5
  %1085 = sub i32 %470, %1078
  %1086 = add i32 %1085, 96
  %1087 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1086
  %1088 = load float, float addrspace(3)* %1087, align 4, !tbaa !5
  %1089 = fmul contract float %1084, %1088
  %1090 = fadd contract float %1080, %1089
  %1091 = getelementptr inbounds float, float* %471, i64 %1082
  %1092 = load float, float* %1091, align 4, !tbaa !5
  %1093 = fmul contract float %1088, %1092
  %1094 = fadd contract float %1079, %1093
  %1095 = add nuw nsw i32 %1078, 1
  %1096 = add i32 %1081, 1
  %1097 = icmp eq i32 %1096, %947
  br i1 %1097, label %1098, label %1077, !llvm.loop !23

1098:                                             ; preds = %1070, %1077, %945
  %1099 = phi float [ 0.000000e+00, %945 ], [ %1071, %1070 ], [ %1090, %1077 ]
  %1100 = phi float [ 0.000000e+00, %945 ], [ %1072, %1070 ], [ %1094, %1077 ]
  %1101 = getelementptr inbounds float, float addrspace(1)* %30, i64 48
  store float %1099, float addrspace(1)* %1101, align 4, !tbaa !5
  %1102 = getelementptr inbounds float, float addrspace(1)* %31, i64 48
  store float %1100, float addrspace(1)* %1102, align 4, !tbaa !5
  br label %1103

1103:                                             ; preds = %942, %1098, %8
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
!14 = !{}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !12, !10}
!18 = distinct !{!18, !12, !10}
!19 = distinct !{!19, !10}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !10}
!22 = distinct !{!22, !10}
!23 = distinct !{!23, !10}
