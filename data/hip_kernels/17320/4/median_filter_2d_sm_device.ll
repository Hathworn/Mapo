; ModuleID = '../data/hip_kernels/17320/4/main.cu'
source_filename = "../data/hip_kernels/17320/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19median_filter_2d_smPhS_iiE12sharedPixels = internal unnamed_addr addrspace(3) global [41 x [41 x i32]] undef, align 16

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19median_filter_2d_smPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #1 {
  %5 = alloca [121 x float], align 16, addrspace(5)
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
  %23 = add nsw i32 %11, -5
  %24 = add nsw i32 %19, -5
  %25 = icmp ugt i32 %13, %23
  %26 = icmp ugt i32 %21, %24
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %50

28:                                               ; preds = %4
  %29 = add nsw i32 %14, 4
  %30 = icmp slt i32 %14, -4
  %31 = icmp slt i32 %29, %2
  %32 = add nsw i32 %2, -1
  %33 = select i1 %31, i32 %29, i32 %32
  %34 = select i1 %30, i32 1, i32 %33
  %35 = add nsw i32 %22, 4
  %36 = icmp slt i32 %22, -4
  %37 = icmp slt i32 %35, %3
  %38 = add nsw i32 %3, -1
  %39 = select i1 %37, i32 %35, i32 %38
  %40 = select i1 %36, i32 1, i32 %39
  %41 = mul nsw i32 %40, %2
  %42 = add nsw i32 %41, %34
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !7, !amdgpu.noclobber !5
  %46 = zext i8 %45 to i32
  %47 = add nuw nsw i32 %13, 8
  %48 = add nuw nsw i32 %21, 8
  %49 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %47, i32 %48
  store i32 %46, i32 addrspace(3)* %49, align 4, !tbaa !10
  br label %50

50:                                               ; preds = %28, %4
  %51 = icmp ult i32 %21, 4
  %52 = select i1 %25, i1 %51, i1 false
  br i1 %52, label %53, label %74

53:                                               ; preds = %50
  %54 = add nsw i32 %14, 4
  %55 = icmp slt i32 %14, -4
  %56 = icmp slt i32 %54, %2
  %57 = add nsw i32 %2, -1
  %58 = select i1 %56, i32 %54, i32 %57
  %59 = select i1 %55, i32 1, i32 %58
  %60 = add nsw i32 %22, -4
  %61 = icmp slt i32 %22, 4
  %62 = icmp slt i32 %60, %3
  %63 = add nsw i32 %3, -1
  %64 = select i1 %62, i32 %60, i32 %63
  %65 = select i1 %61, i32 1, i32 %64
  %66 = mul nsw i32 %65, %2
  %67 = add nsw i32 %66, %59
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %68
  %70 = load i8, i8 addrspace(1)* %69, align 1, !tbaa !7, !amdgpu.noclobber !5
  %71 = zext i8 %70 to i32
  %72 = add nuw nsw i32 %13, 8
  %73 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %72, i32 %21
  store i32 %71, i32 addrspace(3)* %73, align 4, !tbaa !10
  br label %74

74:                                               ; preds = %53, %50
  %75 = icmp ult i32 %13, 4
  %76 = select i1 %75, i1 %26, i1 false
  br i1 %76, label %77, label %98

77:                                               ; preds = %74
  %78 = add nsw i32 %14, -4
  %79 = icmp slt i32 %14, 4
  %80 = icmp slt i32 %78, %2
  %81 = add nsw i32 %2, -1
  %82 = select i1 %80, i32 %78, i32 %81
  %83 = select i1 %79, i32 1, i32 %82
  %84 = add nsw i32 %22, 4
  %85 = icmp slt i32 %22, -4
  %86 = icmp slt i32 %84, %3
  %87 = add nsw i32 %3, -1
  %88 = select i1 %86, i32 %84, i32 %87
  %89 = select i1 %85, i32 1, i32 %88
  %90 = mul nsw i32 %89, %2
  %91 = add nsw i32 %90, %83
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %92
  %94 = load i8, i8 addrspace(1)* %93, align 1, !tbaa !7, !amdgpu.noclobber !5
  %95 = zext i8 %94 to i32
  %96 = add nuw nsw i32 %21, 8
  %97 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %96
  store i32 %95, i32 addrspace(3)* %97, align 4, !tbaa !10
  br label %98

98:                                               ; preds = %77, %74
  %99 = select i1 %75, i1 %51, i1 false
  br i1 %99, label %100, label %120

100:                                              ; preds = %98
  %101 = add nsw i32 %14, -4
  %102 = icmp slt i32 %14, 4
  %103 = icmp slt i32 %101, %2
  %104 = add nsw i32 %2, -1
  %105 = select i1 %103, i32 %101, i32 %104
  %106 = select i1 %102, i32 1, i32 %105
  %107 = add nsw i32 %22, -4
  %108 = icmp slt i32 %22, 4
  %109 = icmp slt i32 %107, %3
  %110 = add nsw i32 %3, -1
  %111 = select i1 %109, i32 %107, i32 %110
  %112 = select i1 %108, i32 1, i32 %111
  %113 = mul nsw i32 %112, %2
  %114 = add nsw i32 %113, %106
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %115
  %117 = load i8, i8 addrspace(1)* %116, align 1, !tbaa !7, !amdgpu.noclobber !5
  %118 = zext i8 %117 to i32
  %119 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %21
  store i32 %118, i32 addrspace(3)* %119, align 4, !tbaa !10
  br label %120

120:                                              ; preds = %100, %98
  br i1 %75, label %121, label %141

121:                                              ; preds = %120
  %122 = add nsw i32 %14, -4
  %123 = icmp slt i32 %14, 4
  %124 = icmp slt i32 %122, %2
  %125 = add nsw i32 %2, -1
  %126 = select i1 %124, i32 %122, i32 %125
  %127 = select i1 %123, i32 1, i32 %126
  %128 = icmp slt i32 %22, 0
  %129 = icmp slt i32 %22, %3
  %130 = add nsw i32 %3, -1
  %131 = select i1 %129, i32 %22, i32 %130
  %132 = select i1 %128, i32 1, i32 %131
  %133 = mul nsw i32 %132, %2
  %134 = add nsw i32 %133, %127
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %135
  %137 = load i8, i8 addrspace(1)* %136, align 1, !tbaa !7, !amdgpu.noclobber !5
  %138 = zext i8 %137 to i32
  %139 = add nuw nsw i32 %21, 4
  %140 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %139
  store i32 %138, i32 addrspace(3)* %140, align 4, !tbaa !10
  br label %141

141:                                              ; preds = %121, %120
  br i1 %25, label %142, label %163

142:                                              ; preds = %141
  %143 = add nsw i32 %14, 4
  %144 = icmp slt i32 %14, -4
  %145 = icmp slt i32 %143, %2
  %146 = add nsw i32 %2, -1
  %147 = select i1 %145, i32 %143, i32 %146
  %148 = select i1 %144, i32 1, i32 %147
  %149 = icmp slt i32 %22, 0
  %150 = icmp slt i32 %22, %3
  %151 = add nsw i32 %3, -1
  %152 = select i1 %150, i32 %22, i32 %151
  %153 = select i1 %149, i32 1, i32 %152
  %154 = mul nsw i32 %153, %2
  %155 = add nsw i32 %154, %148
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %156
  %158 = load i8, i8 addrspace(1)* %157, align 1, !tbaa !7, !amdgpu.noclobber !5
  %159 = zext i8 %158 to i32
  %160 = add nuw nsw i32 %13, 8
  %161 = add nuw nsw i32 %21, 4
  %162 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %160, i32 %161
  store i32 %159, i32 addrspace(3)* %162, align 4, !tbaa !10
  br label %163

163:                                              ; preds = %142, %141
  br i1 %51, label %164, label %184

164:                                              ; preds = %163
  %165 = icmp slt i32 %14, 0
  %166 = icmp slt i32 %14, %2
  %167 = add nsw i32 %2, -1
  %168 = select i1 %166, i32 %14, i32 %167
  %169 = select i1 %165, i32 1, i32 %168
  %170 = add nsw i32 %22, -4
  %171 = icmp slt i32 %22, 4
  %172 = icmp slt i32 %170, %3
  %173 = add nsw i32 %3, -1
  %174 = select i1 %172, i32 %170, i32 %173
  %175 = select i1 %171, i32 1, i32 %174
  %176 = mul nsw i32 %175, %2
  %177 = add nsw i32 %176, %169
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %178
  %180 = load i8, i8 addrspace(1)* %179, align 1, !tbaa !7, !amdgpu.noclobber !5
  %181 = zext i8 %180 to i32
  %182 = add nuw nsw i32 %13, 4
  %183 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %182, i32 %21
  store i32 %181, i32 addrspace(3)* %183, align 4, !tbaa !10
  br label %184

184:                                              ; preds = %164, %163
  br i1 %26, label %187, label %185

185:                                              ; preds = %184
  %186 = add nuw nsw i32 %13, 4
  br label %208

187:                                              ; preds = %184
  %188 = icmp slt i32 %14, 0
  %189 = icmp slt i32 %14, %2
  %190 = add nsw i32 %2, -1
  %191 = select i1 %189, i32 %14, i32 %190
  %192 = select i1 %188, i32 1, i32 %191
  %193 = add nsw i32 %22, 4
  %194 = icmp slt i32 %22, -4
  %195 = icmp slt i32 %193, %3
  %196 = add nsw i32 %3, -1
  %197 = select i1 %195, i32 %193, i32 %196
  %198 = select i1 %194, i32 1, i32 %197
  %199 = mul nsw i32 %198, %2
  %200 = add nsw i32 %199, %192
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %201
  %203 = load i8, i8 addrspace(1)* %202, align 1, !tbaa !7, !amdgpu.noclobber !5
  %204 = zext i8 %203 to i32
  %205 = add nuw nsw i32 %13, 4
  %206 = add nuw nsw i32 %21, 8
  %207 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %205, i32 %206
  store i32 %204, i32 addrspace(3)* %207, align 4, !tbaa !10
  br label %208

208:                                              ; preds = %185, %187
  %209 = phi i32 [ %186, %185 ], [ %205, %187 ]
  %210 = mul nsw i32 %22, %2
  %211 = add nsw i32 %210, %14
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %212
  %214 = load i8, i8 addrspace(1)* %213, align 1, !tbaa !7, !amdgpu.noclobber !5
  %215 = zext i8 %214 to i32
  %216 = add nuw nsw i32 %21, 4
  %217 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %209, i32 %216
  store i32 %215, i32 addrspace(3)* %217, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %218 = icmp slt i32 %14, %2
  %219 = icmp slt i32 %22, %3
  %220 = select i1 %218, i1 %219, i1 false
  br i1 %220, label %221, label %1153

221:                                              ; preds = %208
  %222 = bitcast [121 x float] addrspace(5)* %5 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 484, i8 addrspace(5)* %222) #4
  %223 = icmp sgt i32 %2, 0
  %224 = icmp sgt i32 %3, 0
  %225 = select i1 %223, i1 %224, i1 false
  br i1 %225, label %339, label %344

226:                                              ; preds = %1149
  %227 = add i32 %1150, -2
  br label %228

228:                                              ; preds = %260, %226
  %229 = phi i32 [ 0, %226 ], [ %261, %260 ]
  %230 = xor i32 %229, -1
  %231 = add i32 %1150, %230
  %232 = xor i32 %229, -1
  %233 = add nsw i32 %1150, %232
  %234 = icmp sgt i32 %233, 0
  br i1 %234, label %235, label %260

235:                                              ; preds = %228
  %236 = sub i32 %227, %229
  %237 = load float, float addrspace(5)* %1151, align 16, !tbaa !12
  %238 = and i32 %231, 7
  %239 = icmp ult i32 %236, 7
  br i1 %239, label %242, label %240

240:                                              ; preds = %235
  %241 = and i32 %231, -8
  br label %263

242:                                              ; preds = %329, %235
  %243 = phi float [ %237, %235 ], [ %330, %329 ]
  %244 = phi i32 [ 0, %235 ], [ %323, %329 ]
  %245 = icmp eq i32 %238, 0
  br i1 %245, label %260, label %246

246:                                              ; preds = %242, %256
  %247 = phi float [ %257, %256 ], [ %243, %242 ]
  %248 = phi i32 [ %250, %256 ], [ %244, %242 ]
  %249 = phi i32 [ %258, %256 ], [ 0, %242 ]
  %250 = add nuw nsw i32 %248, 1
  %251 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %250
  %252 = load float, float addrspace(5)* %251, align 4, !tbaa !12
  %253 = fcmp contract ogt float %247, %252
  br i1 %253, label %254, label %256

254:                                              ; preds = %246
  %255 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %248
  store float %252, float addrspace(5)* %255, align 4, !tbaa !12
  store float %247, float addrspace(5)* %251, align 4, !tbaa !12
  br label %256

256:                                              ; preds = %254, %246
  %257 = phi float [ %252, %246 ], [ %247, %254 ]
  %258 = add i32 %249, 1
  %259 = icmp eq i32 %258, %238
  br i1 %259, label %260, label %246, !llvm.loop !14

260:                                              ; preds = %242, %256, %228
  %261 = add nuw nsw i32 %229, 1
  %262 = icmp eq i32 %227, %229
  br i1 %262, label %333, label %228, !llvm.loop !16

263:                                              ; preds = %329, %240
  %264 = phi float [ %237, %240 ], [ %330, %329 ]
  %265 = phi i32 [ 0, %240 ], [ %323, %329 ]
  %266 = phi i32 [ 0, %240 ], [ %331, %329 ]
  %267 = or i32 %265, 1
  %268 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %267
  %269 = load float, float addrspace(5)* %268, align 4, !tbaa !12
  %270 = fcmp contract ogt float %264, %269
  br i1 %270, label %271, label %273

271:                                              ; preds = %263
  %272 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %265
  store float %269, float addrspace(5)* %272, align 16, !tbaa !12
  store float %264, float addrspace(5)* %268, align 4, !tbaa !12
  br label %273

273:                                              ; preds = %271, %263
  %274 = phi float [ %269, %263 ], [ %264, %271 ]
  %275 = or i32 %265, 2
  %276 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %275
  %277 = load float, float addrspace(5)* %276, align 8, !tbaa !12
  %278 = fcmp contract ogt float %274, %277
  br i1 %278, label %279, label %281

279:                                              ; preds = %273
  %280 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %267
  store float %277, float addrspace(5)* %280, align 4, !tbaa !12
  store float %274, float addrspace(5)* %276, align 8, !tbaa !12
  br label %281

281:                                              ; preds = %279, %273
  %282 = phi float [ %277, %273 ], [ %274, %279 ]
  %283 = or i32 %265, 3
  %284 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %283
  %285 = load float, float addrspace(5)* %284, align 4, !tbaa !12
  %286 = fcmp contract ogt float %282, %285
  br i1 %286, label %287, label %289

287:                                              ; preds = %281
  %288 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %275
  store float %285, float addrspace(5)* %288, align 8, !tbaa !12
  store float %282, float addrspace(5)* %284, align 4, !tbaa !12
  br label %289

289:                                              ; preds = %287, %281
  %290 = phi float [ %285, %281 ], [ %282, %287 ]
  %291 = or i32 %265, 4
  %292 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %291
  %293 = load float, float addrspace(5)* %292, align 16, !tbaa !12
  %294 = fcmp contract ogt float %290, %293
  br i1 %294, label %295, label %297

295:                                              ; preds = %289
  %296 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %283
  store float %293, float addrspace(5)* %296, align 4, !tbaa !12
  store float %290, float addrspace(5)* %292, align 16, !tbaa !12
  br label %297

297:                                              ; preds = %295, %289
  %298 = phi float [ %293, %289 ], [ %290, %295 ]
  %299 = or i32 %265, 5
  %300 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %299
  %301 = load float, float addrspace(5)* %300, align 4, !tbaa !12
  %302 = fcmp contract ogt float %298, %301
  br i1 %302, label %303, label %305

303:                                              ; preds = %297
  %304 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %291
  store float %301, float addrspace(5)* %304, align 16, !tbaa !12
  store float %298, float addrspace(5)* %300, align 4, !tbaa !12
  br label %305

305:                                              ; preds = %303, %297
  %306 = phi float [ %301, %297 ], [ %298, %303 ]
  %307 = or i32 %265, 6
  %308 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %307
  %309 = load float, float addrspace(5)* %308, align 8, !tbaa !12
  %310 = fcmp contract ogt float %306, %309
  br i1 %310, label %311, label %313

311:                                              ; preds = %305
  %312 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %299
  store float %309, float addrspace(5)* %312, align 4, !tbaa !12
  store float %306, float addrspace(5)* %308, align 8, !tbaa !12
  br label %313

313:                                              ; preds = %311, %305
  %314 = phi float [ %309, %305 ], [ %306, %311 ]
  %315 = or i32 %265, 7
  %316 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %315
  %317 = load float, float addrspace(5)* %316, align 4, !tbaa !12
  %318 = fcmp contract ogt float %314, %317
  br i1 %318, label %319, label %321

319:                                              ; preds = %313
  %320 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %307
  store float %317, float addrspace(5)* %320, align 8, !tbaa !12
  store float %314, float addrspace(5)* %316, align 4, !tbaa !12
  br label %321

321:                                              ; preds = %319, %313
  %322 = phi float [ %317, %313 ], [ %314, %319 ]
  %323 = add nuw nsw i32 %265, 8
  %324 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %323
  %325 = load float, float addrspace(5)* %324, align 16, !tbaa !12
  %326 = fcmp contract ogt float %322, %325
  br i1 %326, label %327, label %329

327:                                              ; preds = %321
  %328 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %315
  store float %325, float addrspace(5)* %328, align 4, !tbaa !12
  store float %322, float addrspace(5)* %324, align 16, !tbaa !12
  br label %329

329:                                              ; preds = %327, %321
  %330 = phi float [ %325, %321 ], [ %322, %327 ]
  %331 = add i32 %266, 8
  %332 = icmp eq i32 %331, %241
  br i1 %332, label %242, label %263, !llvm.loop !18

333:                                              ; preds = %260, %1149
  %334 = sdiv i32 %1150, 2
  %335 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %334
  %336 = load float, float addrspace(5)* %335, align 4, !tbaa !12
  %337 = fptoui float %336 to i8
  %338 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %212
  store i8 %337, i8 addrspace(1)* %338, align 1, !tbaa !7
  call void @llvm.lifetime.end.p5i8(i64 484, i8 addrspace(5)* %222) #4
  br label %1153

339:                                              ; preds = %221
  %340 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %21
  %341 = load i32, i32 addrspace(3)* %340, align 4, !tbaa !10
  %342 = sitofp i32 %341 to float
  %343 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 0
  store float %342, float addrspace(5)* %343, align 16, !tbaa !12
  br label %344

344:                                              ; preds = %221, %339
  %345 = phi i32 [ 1, %339 ], [ 0, %221 ]
  %346 = icmp sgt i32 %3, 1
  %347 = select i1 %223, i1 %346, i1 false
  br i1 %347, label %348, label %355

348:                                              ; preds = %344
  %349 = add nuw nsw i32 %21, 1
  %350 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %349
  %351 = load i32, i32 addrspace(3)* %350, align 4, !tbaa !10
  %352 = sitofp i32 %351 to float
  %353 = add nuw nsw i32 %345, 1
  %354 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %345
  store float %352, float addrspace(5)* %354, align 4, !tbaa !12
  br label %355

355:                                              ; preds = %348, %344
  %356 = phi i32 [ %353, %348 ], [ %345, %344 ]
  %357 = icmp sgt i32 %3, 2
  %358 = select i1 %223, i1 %357, i1 false
  br i1 %358, label %359, label %366

359:                                              ; preds = %355
  %360 = add nuw nsw i32 %21, 2
  %361 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %360
  %362 = load i32, i32 addrspace(3)* %361, align 4, !tbaa !10
  %363 = sitofp i32 %362 to float
  %364 = add nuw nsw i32 %356, 1
  %365 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %356
  store float %363, float addrspace(5)* %365, align 4, !tbaa !12
  br label %366

366:                                              ; preds = %359, %355
  %367 = phi i32 [ %364, %359 ], [ %356, %355 ]
  %368 = icmp sgt i32 %3, 3
  %369 = select i1 %223, i1 %368, i1 false
  br i1 %369, label %370, label %377

370:                                              ; preds = %366
  %371 = add nuw nsw i32 %21, 3
  %372 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %371
  %373 = load i32, i32 addrspace(3)* %372, align 4, !tbaa !10
  %374 = sitofp i32 %373 to float
  %375 = add nuw nsw i32 %367, 1
  %376 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %367
  store float %374, float addrspace(5)* %376, align 4, !tbaa !12
  br label %377

377:                                              ; preds = %370, %366
  %378 = phi i32 [ %375, %370 ], [ %367, %366 ]
  %379 = icmp sgt i32 %3, 4
  %380 = select i1 %223, i1 %379, i1 false
  br i1 %380, label %381, label %387

381:                                              ; preds = %377
  %382 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %216
  %383 = load i32, i32 addrspace(3)* %382, align 4, !tbaa !10
  %384 = sitofp i32 %383 to float
  %385 = add nuw nsw i32 %378, 1
  %386 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %378
  store float %384, float addrspace(5)* %386, align 4, !tbaa !12
  br label %387

387:                                              ; preds = %381, %377
  %388 = phi i32 [ %385, %381 ], [ %378, %377 ]
  %389 = icmp sgt i32 %3, 5
  %390 = select i1 %223, i1 %389, i1 false
  br i1 %390, label %391, label %398

391:                                              ; preds = %387
  %392 = add nuw nsw i32 %21, 5
  %393 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %392
  %394 = load i32, i32 addrspace(3)* %393, align 4, !tbaa !10
  %395 = sitofp i32 %394 to float
  %396 = add nuw nsw i32 %388, 1
  %397 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %388
  store float %395, float addrspace(5)* %397, align 4, !tbaa !12
  br label %398

398:                                              ; preds = %391, %387
  %399 = phi i32 [ %396, %391 ], [ %388, %387 ]
  %400 = icmp sgt i32 %3, 6
  %401 = select i1 %223, i1 %400, i1 false
  br i1 %401, label %402, label %409

402:                                              ; preds = %398
  %403 = add nuw nsw i32 %21, 6
  %404 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %403
  %405 = load i32, i32 addrspace(3)* %404, align 4, !tbaa !10
  %406 = sitofp i32 %405 to float
  %407 = add nuw nsw i32 %399, 1
  %408 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %399
  store float %406, float addrspace(5)* %408, align 4, !tbaa !12
  br label %409

409:                                              ; preds = %402, %398
  %410 = phi i32 [ %407, %402 ], [ %399, %398 ]
  %411 = icmp sgt i32 %3, 7
  %412 = select i1 %223, i1 %411, i1 false
  br i1 %412, label %413, label %420

413:                                              ; preds = %409
  %414 = add nuw nsw i32 %21, 7
  %415 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %414
  %416 = load i32, i32 addrspace(3)* %415, align 4, !tbaa !10
  %417 = sitofp i32 %416 to float
  %418 = add nuw nsw i32 %410, 1
  %419 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %410
  store float %417, float addrspace(5)* %419, align 4, !tbaa !12
  br label %420

420:                                              ; preds = %413, %409
  %421 = phi i32 [ %418, %413 ], [ %410, %409 ]
  %422 = icmp sgt i32 %3, 8
  %423 = select i1 %223, i1 %422, i1 false
  br i1 %423, label %424, label %431

424:                                              ; preds = %420
  %425 = add nuw nsw i32 %21, 8
  %426 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %13, i32 %425
  %427 = load i32, i32 addrspace(3)* %426, align 4, !tbaa !10
  %428 = sitofp i32 %427 to float
  %429 = add nuw nsw i32 %421, 1
  %430 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %421
  store float %428, float addrspace(5)* %430, align 4, !tbaa !12
  br label %431

431:                                              ; preds = %424, %420
  %432 = phi i32 [ %429, %424 ], [ %421, %420 ]
  %433 = icmp sgt i32 %2, 1
  %434 = add nuw nsw i32 %13, 1
  %435 = select i1 %433, i1 %224, i1 false
  br i1 %435, label %436, label %442

436:                                              ; preds = %431
  %437 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %434, i32 %21
  %438 = load i32, i32 addrspace(3)* %437, align 4, !tbaa !10
  %439 = sitofp i32 %438 to float
  %440 = add nuw nsw i32 %432, 1
  %441 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %432
  store float %439, float addrspace(5)* %441, align 4, !tbaa !12
  br label %442

442:                                              ; preds = %436, %431
  %443 = phi i32 [ %440, %436 ], [ %432, %431 ]
  %444 = select i1 %433, i1 %346, i1 false
  br i1 %444, label %445, label %452

445:                                              ; preds = %442
  %446 = add nuw nsw i32 %21, 1
  %447 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %434, i32 %446
  %448 = load i32, i32 addrspace(3)* %447, align 4, !tbaa !10
  %449 = sitofp i32 %448 to float
  %450 = add nuw nsw i32 %443, 1
  %451 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %443
  store float %449, float addrspace(5)* %451, align 4, !tbaa !12
  br label %452

452:                                              ; preds = %445, %442
  %453 = phi i32 [ %450, %445 ], [ %443, %442 ]
  %454 = select i1 %433, i1 %357, i1 false
  br i1 %454, label %455, label %462

455:                                              ; preds = %452
  %456 = add nuw nsw i32 %21, 2
  %457 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %434, i32 %456
  %458 = load i32, i32 addrspace(3)* %457, align 4, !tbaa !10
  %459 = sitofp i32 %458 to float
  %460 = add nuw nsw i32 %453, 1
  %461 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %453
  store float %459, float addrspace(5)* %461, align 4, !tbaa !12
  br label %462

462:                                              ; preds = %455, %452
  %463 = phi i32 [ %460, %455 ], [ %453, %452 ]
  %464 = select i1 %433, i1 %368, i1 false
  br i1 %464, label %465, label %472

465:                                              ; preds = %462
  %466 = add nuw nsw i32 %21, 3
  %467 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %434, i32 %466
  %468 = load i32, i32 addrspace(3)* %467, align 4, !tbaa !10
  %469 = sitofp i32 %468 to float
  %470 = add nuw nsw i32 %463, 1
  %471 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %463
  store float %469, float addrspace(5)* %471, align 4, !tbaa !12
  br label %472

472:                                              ; preds = %465, %462
  %473 = phi i32 [ %470, %465 ], [ %463, %462 ]
  %474 = select i1 %433, i1 %379, i1 false
  br i1 %474, label %475, label %481

475:                                              ; preds = %472
  %476 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %434, i32 %216
  %477 = load i32, i32 addrspace(3)* %476, align 4, !tbaa !10
  %478 = sitofp i32 %477 to float
  %479 = add nuw nsw i32 %473, 1
  %480 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %473
  store float %478, float addrspace(5)* %480, align 4, !tbaa !12
  br label %481

481:                                              ; preds = %475, %472
  %482 = phi i32 [ %479, %475 ], [ %473, %472 ]
  %483 = select i1 %433, i1 %389, i1 false
  br i1 %483, label %484, label %491

484:                                              ; preds = %481
  %485 = add nuw nsw i32 %21, 5
  %486 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %434, i32 %485
  %487 = load i32, i32 addrspace(3)* %486, align 4, !tbaa !10
  %488 = sitofp i32 %487 to float
  %489 = add nuw nsw i32 %482, 1
  %490 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %482
  store float %488, float addrspace(5)* %490, align 4, !tbaa !12
  br label %491

491:                                              ; preds = %484, %481
  %492 = phi i32 [ %489, %484 ], [ %482, %481 ]
  %493 = select i1 %433, i1 %400, i1 false
  br i1 %493, label %494, label %501

494:                                              ; preds = %491
  %495 = add nuw nsw i32 %21, 6
  %496 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %434, i32 %495
  %497 = load i32, i32 addrspace(3)* %496, align 4, !tbaa !10
  %498 = sitofp i32 %497 to float
  %499 = add nuw nsw i32 %492, 1
  %500 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %492
  store float %498, float addrspace(5)* %500, align 4, !tbaa !12
  br label %501

501:                                              ; preds = %494, %491
  %502 = phi i32 [ %499, %494 ], [ %492, %491 ]
  %503 = select i1 %433, i1 %411, i1 false
  br i1 %503, label %504, label %511

504:                                              ; preds = %501
  %505 = add nuw nsw i32 %21, 7
  %506 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %434, i32 %505
  %507 = load i32, i32 addrspace(3)* %506, align 4, !tbaa !10
  %508 = sitofp i32 %507 to float
  %509 = add nuw nsw i32 %502, 1
  %510 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %502
  store float %508, float addrspace(5)* %510, align 4, !tbaa !12
  br label %511

511:                                              ; preds = %504, %501
  %512 = phi i32 [ %509, %504 ], [ %502, %501 ]
  %513 = select i1 %433, i1 %422, i1 false
  br i1 %513, label %514, label %521

514:                                              ; preds = %511
  %515 = add nuw nsw i32 %21, 8
  %516 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %434, i32 %515
  %517 = load i32, i32 addrspace(3)* %516, align 4, !tbaa !10
  %518 = sitofp i32 %517 to float
  %519 = add nuw nsw i32 %512, 1
  %520 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %512
  store float %518, float addrspace(5)* %520, align 4, !tbaa !12
  br label %521

521:                                              ; preds = %514, %511
  %522 = phi i32 [ %519, %514 ], [ %512, %511 ]
  %523 = icmp sgt i32 %2, 2
  %524 = add nuw nsw i32 %13, 2
  %525 = select i1 %523, i1 %224, i1 false
  br i1 %525, label %526, label %532

526:                                              ; preds = %521
  %527 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %524, i32 %21
  %528 = load i32, i32 addrspace(3)* %527, align 4, !tbaa !10
  %529 = sitofp i32 %528 to float
  %530 = add nuw nsw i32 %522, 1
  %531 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %522
  store float %529, float addrspace(5)* %531, align 4, !tbaa !12
  br label %532

532:                                              ; preds = %526, %521
  %533 = phi i32 [ %530, %526 ], [ %522, %521 ]
  %534 = select i1 %523, i1 %346, i1 false
  br i1 %534, label %535, label %542

535:                                              ; preds = %532
  %536 = add nuw nsw i32 %21, 1
  %537 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %524, i32 %536
  %538 = load i32, i32 addrspace(3)* %537, align 4, !tbaa !10
  %539 = sitofp i32 %538 to float
  %540 = add nuw nsw i32 %533, 1
  %541 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %533
  store float %539, float addrspace(5)* %541, align 4, !tbaa !12
  br label %542

542:                                              ; preds = %535, %532
  %543 = phi i32 [ %540, %535 ], [ %533, %532 ]
  %544 = select i1 %523, i1 %357, i1 false
  br i1 %544, label %545, label %552

545:                                              ; preds = %542
  %546 = add nuw nsw i32 %21, 2
  %547 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %524, i32 %546
  %548 = load i32, i32 addrspace(3)* %547, align 4, !tbaa !10
  %549 = sitofp i32 %548 to float
  %550 = add nuw nsw i32 %543, 1
  %551 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %543
  store float %549, float addrspace(5)* %551, align 4, !tbaa !12
  br label %552

552:                                              ; preds = %545, %542
  %553 = phi i32 [ %550, %545 ], [ %543, %542 ]
  %554 = select i1 %523, i1 %368, i1 false
  br i1 %554, label %555, label %562

555:                                              ; preds = %552
  %556 = add nuw nsw i32 %21, 3
  %557 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %524, i32 %556
  %558 = load i32, i32 addrspace(3)* %557, align 4, !tbaa !10
  %559 = sitofp i32 %558 to float
  %560 = add nuw nsw i32 %553, 1
  %561 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %553
  store float %559, float addrspace(5)* %561, align 4, !tbaa !12
  br label %562

562:                                              ; preds = %555, %552
  %563 = phi i32 [ %560, %555 ], [ %553, %552 ]
  %564 = select i1 %523, i1 %379, i1 false
  br i1 %564, label %565, label %571

565:                                              ; preds = %562
  %566 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %524, i32 %216
  %567 = load i32, i32 addrspace(3)* %566, align 4, !tbaa !10
  %568 = sitofp i32 %567 to float
  %569 = add nuw nsw i32 %563, 1
  %570 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %563
  store float %568, float addrspace(5)* %570, align 4, !tbaa !12
  br label %571

571:                                              ; preds = %565, %562
  %572 = phi i32 [ %569, %565 ], [ %563, %562 ]
  %573 = select i1 %523, i1 %389, i1 false
  br i1 %573, label %574, label %581

574:                                              ; preds = %571
  %575 = add nuw nsw i32 %21, 5
  %576 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %524, i32 %575
  %577 = load i32, i32 addrspace(3)* %576, align 4, !tbaa !10
  %578 = sitofp i32 %577 to float
  %579 = add nuw nsw i32 %572, 1
  %580 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %572
  store float %578, float addrspace(5)* %580, align 4, !tbaa !12
  br label %581

581:                                              ; preds = %574, %571
  %582 = phi i32 [ %579, %574 ], [ %572, %571 ]
  %583 = select i1 %523, i1 %400, i1 false
  br i1 %583, label %584, label %591

584:                                              ; preds = %581
  %585 = add nuw nsw i32 %21, 6
  %586 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %524, i32 %585
  %587 = load i32, i32 addrspace(3)* %586, align 4, !tbaa !10
  %588 = sitofp i32 %587 to float
  %589 = add nuw nsw i32 %582, 1
  %590 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %582
  store float %588, float addrspace(5)* %590, align 4, !tbaa !12
  br label %591

591:                                              ; preds = %584, %581
  %592 = phi i32 [ %589, %584 ], [ %582, %581 ]
  %593 = select i1 %523, i1 %411, i1 false
  br i1 %593, label %594, label %601

594:                                              ; preds = %591
  %595 = add nuw nsw i32 %21, 7
  %596 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %524, i32 %595
  %597 = load i32, i32 addrspace(3)* %596, align 4, !tbaa !10
  %598 = sitofp i32 %597 to float
  %599 = add nuw nsw i32 %592, 1
  %600 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %592
  store float %598, float addrspace(5)* %600, align 4, !tbaa !12
  br label %601

601:                                              ; preds = %594, %591
  %602 = phi i32 [ %599, %594 ], [ %592, %591 ]
  %603 = select i1 %523, i1 %422, i1 false
  br i1 %603, label %604, label %611

604:                                              ; preds = %601
  %605 = add nuw nsw i32 %21, 8
  %606 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %524, i32 %605
  %607 = load i32, i32 addrspace(3)* %606, align 4, !tbaa !10
  %608 = sitofp i32 %607 to float
  %609 = add nuw nsw i32 %602, 1
  %610 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %602
  store float %608, float addrspace(5)* %610, align 4, !tbaa !12
  br label %611

611:                                              ; preds = %604, %601
  %612 = phi i32 [ %609, %604 ], [ %602, %601 ]
  %613 = icmp sgt i32 %2, 3
  %614 = add nuw nsw i32 %13, 3
  %615 = select i1 %613, i1 %224, i1 false
  br i1 %615, label %616, label %622

616:                                              ; preds = %611
  %617 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %614, i32 %21
  %618 = load i32, i32 addrspace(3)* %617, align 4, !tbaa !10
  %619 = sitofp i32 %618 to float
  %620 = add nuw nsw i32 %612, 1
  %621 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %612
  store float %619, float addrspace(5)* %621, align 4, !tbaa !12
  br label %622

622:                                              ; preds = %616, %611
  %623 = phi i32 [ %620, %616 ], [ %612, %611 ]
  %624 = select i1 %613, i1 %346, i1 false
  br i1 %624, label %625, label %632

625:                                              ; preds = %622
  %626 = add nuw nsw i32 %21, 1
  %627 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %614, i32 %626
  %628 = load i32, i32 addrspace(3)* %627, align 4, !tbaa !10
  %629 = sitofp i32 %628 to float
  %630 = add nuw nsw i32 %623, 1
  %631 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %623
  store float %629, float addrspace(5)* %631, align 4, !tbaa !12
  br label %632

632:                                              ; preds = %625, %622
  %633 = phi i32 [ %630, %625 ], [ %623, %622 ]
  %634 = select i1 %613, i1 %357, i1 false
  br i1 %634, label %635, label %642

635:                                              ; preds = %632
  %636 = add nuw nsw i32 %21, 2
  %637 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %614, i32 %636
  %638 = load i32, i32 addrspace(3)* %637, align 4, !tbaa !10
  %639 = sitofp i32 %638 to float
  %640 = add nuw nsw i32 %633, 1
  %641 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %633
  store float %639, float addrspace(5)* %641, align 4, !tbaa !12
  br label %642

642:                                              ; preds = %635, %632
  %643 = phi i32 [ %640, %635 ], [ %633, %632 ]
  %644 = select i1 %613, i1 %368, i1 false
  br i1 %644, label %645, label %652

645:                                              ; preds = %642
  %646 = add nuw nsw i32 %21, 3
  %647 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %614, i32 %646
  %648 = load i32, i32 addrspace(3)* %647, align 4, !tbaa !10
  %649 = sitofp i32 %648 to float
  %650 = add nuw nsw i32 %643, 1
  %651 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %643
  store float %649, float addrspace(5)* %651, align 4, !tbaa !12
  br label %652

652:                                              ; preds = %645, %642
  %653 = phi i32 [ %650, %645 ], [ %643, %642 ]
  %654 = select i1 %613, i1 %379, i1 false
  br i1 %654, label %655, label %661

655:                                              ; preds = %652
  %656 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %614, i32 %216
  %657 = load i32, i32 addrspace(3)* %656, align 4, !tbaa !10
  %658 = sitofp i32 %657 to float
  %659 = add nuw nsw i32 %653, 1
  %660 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %653
  store float %658, float addrspace(5)* %660, align 4, !tbaa !12
  br label %661

661:                                              ; preds = %655, %652
  %662 = phi i32 [ %659, %655 ], [ %653, %652 ]
  %663 = select i1 %613, i1 %389, i1 false
  br i1 %663, label %664, label %671

664:                                              ; preds = %661
  %665 = add nuw nsw i32 %21, 5
  %666 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %614, i32 %665
  %667 = load i32, i32 addrspace(3)* %666, align 4, !tbaa !10
  %668 = sitofp i32 %667 to float
  %669 = add nuw nsw i32 %662, 1
  %670 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %662
  store float %668, float addrspace(5)* %670, align 4, !tbaa !12
  br label %671

671:                                              ; preds = %664, %661
  %672 = phi i32 [ %669, %664 ], [ %662, %661 ]
  %673 = select i1 %613, i1 %400, i1 false
  br i1 %673, label %674, label %681

674:                                              ; preds = %671
  %675 = add nuw nsw i32 %21, 6
  %676 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %614, i32 %675
  %677 = load i32, i32 addrspace(3)* %676, align 4, !tbaa !10
  %678 = sitofp i32 %677 to float
  %679 = add nuw nsw i32 %672, 1
  %680 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %672
  store float %678, float addrspace(5)* %680, align 4, !tbaa !12
  br label %681

681:                                              ; preds = %674, %671
  %682 = phi i32 [ %679, %674 ], [ %672, %671 ]
  %683 = select i1 %613, i1 %411, i1 false
  br i1 %683, label %684, label %691

684:                                              ; preds = %681
  %685 = add nuw nsw i32 %21, 7
  %686 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %614, i32 %685
  %687 = load i32, i32 addrspace(3)* %686, align 4, !tbaa !10
  %688 = sitofp i32 %687 to float
  %689 = add nuw nsw i32 %682, 1
  %690 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %682
  store float %688, float addrspace(5)* %690, align 4, !tbaa !12
  br label %691

691:                                              ; preds = %684, %681
  %692 = phi i32 [ %689, %684 ], [ %682, %681 ]
  %693 = select i1 %613, i1 %422, i1 false
  br i1 %693, label %694, label %701

694:                                              ; preds = %691
  %695 = add nuw nsw i32 %21, 8
  %696 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %614, i32 %695
  %697 = load i32, i32 addrspace(3)* %696, align 4, !tbaa !10
  %698 = sitofp i32 %697 to float
  %699 = add nuw nsw i32 %692, 1
  %700 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %692
  store float %698, float addrspace(5)* %700, align 4, !tbaa !12
  br label %701

701:                                              ; preds = %694, %691
  %702 = phi i32 [ %699, %694 ], [ %692, %691 ]
  %703 = icmp sgt i32 %2, 4
  %704 = select i1 %703, i1 %224, i1 false
  br i1 %704, label %705, label %711

705:                                              ; preds = %701
  %706 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %209, i32 %21
  %707 = load i32, i32 addrspace(3)* %706, align 4, !tbaa !10
  %708 = sitofp i32 %707 to float
  %709 = add nuw nsw i32 %702, 1
  %710 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %702
  store float %708, float addrspace(5)* %710, align 4, !tbaa !12
  br label %711

711:                                              ; preds = %705, %701
  %712 = phi i32 [ %709, %705 ], [ %702, %701 ]
  %713 = select i1 %703, i1 %346, i1 false
  br i1 %713, label %714, label %721

714:                                              ; preds = %711
  %715 = add nuw nsw i32 %21, 1
  %716 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %209, i32 %715
  %717 = load i32, i32 addrspace(3)* %716, align 4, !tbaa !10
  %718 = sitofp i32 %717 to float
  %719 = add nuw nsw i32 %712, 1
  %720 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %712
  store float %718, float addrspace(5)* %720, align 4, !tbaa !12
  br label %721

721:                                              ; preds = %714, %711
  %722 = phi i32 [ %719, %714 ], [ %712, %711 ]
  %723 = select i1 %703, i1 %357, i1 false
  br i1 %723, label %724, label %731

724:                                              ; preds = %721
  %725 = add nuw nsw i32 %21, 2
  %726 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %209, i32 %725
  %727 = load i32, i32 addrspace(3)* %726, align 4, !tbaa !10
  %728 = sitofp i32 %727 to float
  %729 = add nuw nsw i32 %722, 1
  %730 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %722
  store float %728, float addrspace(5)* %730, align 4, !tbaa !12
  br label %731

731:                                              ; preds = %724, %721
  %732 = phi i32 [ %729, %724 ], [ %722, %721 ]
  %733 = select i1 %703, i1 %368, i1 false
  br i1 %733, label %734, label %741

734:                                              ; preds = %731
  %735 = add nuw nsw i32 %21, 3
  %736 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %209, i32 %735
  %737 = load i32, i32 addrspace(3)* %736, align 4, !tbaa !10
  %738 = sitofp i32 %737 to float
  %739 = add nuw nsw i32 %732, 1
  %740 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %732
  store float %738, float addrspace(5)* %740, align 4, !tbaa !12
  br label %741

741:                                              ; preds = %734, %731
  %742 = phi i32 [ %739, %734 ], [ %732, %731 ]
  %743 = select i1 %703, i1 %379, i1 false
  br i1 %743, label %744, label %749

744:                                              ; preds = %741
  %745 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !10
  %746 = sitofp i32 %745 to float
  %747 = add nuw nsw i32 %742, 1
  %748 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %742
  store float %746, float addrspace(5)* %748, align 4, !tbaa !12
  br label %749

749:                                              ; preds = %744, %741
  %750 = phi i32 [ %747, %744 ], [ %742, %741 ]
  %751 = select i1 %703, i1 %389, i1 false
  br i1 %751, label %752, label %759

752:                                              ; preds = %749
  %753 = add nuw nsw i32 %21, 5
  %754 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %209, i32 %753
  %755 = load i32, i32 addrspace(3)* %754, align 4, !tbaa !10
  %756 = sitofp i32 %755 to float
  %757 = add nuw nsw i32 %750, 1
  %758 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %750
  store float %756, float addrspace(5)* %758, align 4, !tbaa !12
  br label %759

759:                                              ; preds = %752, %749
  %760 = phi i32 [ %757, %752 ], [ %750, %749 ]
  %761 = select i1 %703, i1 %400, i1 false
  br i1 %761, label %762, label %769

762:                                              ; preds = %759
  %763 = add nuw nsw i32 %21, 6
  %764 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %209, i32 %763
  %765 = load i32, i32 addrspace(3)* %764, align 4, !tbaa !10
  %766 = sitofp i32 %765 to float
  %767 = add nuw nsw i32 %760, 1
  %768 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %760
  store float %766, float addrspace(5)* %768, align 4, !tbaa !12
  br label %769

769:                                              ; preds = %762, %759
  %770 = phi i32 [ %767, %762 ], [ %760, %759 ]
  %771 = select i1 %703, i1 %411, i1 false
  br i1 %771, label %772, label %779

772:                                              ; preds = %769
  %773 = add nuw nsw i32 %21, 7
  %774 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %209, i32 %773
  %775 = load i32, i32 addrspace(3)* %774, align 4, !tbaa !10
  %776 = sitofp i32 %775 to float
  %777 = add nuw nsw i32 %770, 1
  %778 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %770
  store float %776, float addrspace(5)* %778, align 4, !tbaa !12
  br label %779

779:                                              ; preds = %772, %769
  %780 = phi i32 [ %777, %772 ], [ %770, %769 ]
  %781 = select i1 %703, i1 %422, i1 false
  br i1 %781, label %782, label %789

782:                                              ; preds = %779
  %783 = add nuw nsw i32 %21, 8
  %784 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %209, i32 %783
  %785 = load i32, i32 addrspace(3)* %784, align 4, !tbaa !10
  %786 = sitofp i32 %785 to float
  %787 = add nuw nsw i32 %780, 1
  %788 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %780
  store float %786, float addrspace(5)* %788, align 4, !tbaa !12
  br label %789

789:                                              ; preds = %782, %779
  %790 = phi i32 [ %787, %782 ], [ %780, %779 ]
  %791 = icmp sgt i32 %2, 5
  %792 = add nuw nsw i32 %13, 5
  %793 = select i1 %791, i1 %224, i1 false
  br i1 %793, label %794, label %800

794:                                              ; preds = %789
  %795 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %792, i32 %21
  %796 = load i32, i32 addrspace(3)* %795, align 4, !tbaa !10
  %797 = sitofp i32 %796 to float
  %798 = add nuw nsw i32 %790, 1
  %799 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %790
  store float %797, float addrspace(5)* %799, align 4, !tbaa !12
  br label %800

800:                                              ; preds = %794, %789
  %801 = phi i32 [ %798, %794 ], [ %790, %789 ]
  %802 = select i1 %791, i1 %346, i1 false
  br i1 %802, label %803, label %810

803:                                              ; preds = %800
  %804 = add nuw nsw i32 %21, 1
  %805 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %792, i32 %804
  %806 = load i32, i32 addrspace(3)* %805, align 4, !tbaa !10
  %807 = sitofp i32 %806 to float
  %808 = add nuw nsw i32 %801, 1
  %809 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %801
  store float %807, float addrspace(5)* %809, align 4, !tbaa !12
  br label %810

810:                                              ; preds = %803, %800
  %811 = phi i32 [ %808, %803 ], [ %801, %800 ]
  %812 = select i1 %791, i1 %357, i1 false
  br i1 %812, label %813, label %820

813:                                              ; preds = %810
  %814 = add nuw nsw i32 %21, 2
  %815 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %792, i32 %814
  %816 = load i32, i32 addrspace(3)* %815, align 4, !tbaa !10
  %817 = sitofp i32 %816 to float
  %818 = add nuw nsw i32 %811, 1
  %819 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %811
  store float %817, float addrspace(5)* %819, align 4, !tbaa !12
  br label %820

820:                                              ; preds = %813, %810
  %821 = phi i32 [ %818, %813 ], [ %811, %810 ]
  %822 = select i1 %791, i1 %368, i1 false
  br i1 %822, label %823, label %830

823:                                              ; preds = %820
  %824 = add nuw nsw i32 %21, 3
  %825 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %792, i32 %824
  %826 = load i32, i32 addrspace(3)* %825, align 4, !tbaa !10
  %827 = sitofp i32 %826 to float
  %828 = add nuw nsw i32 %821, 1
  %829 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %821
  store float %827, float addrspace(5)* %829, align 4, !tbaa !12
  br label %830

830:                                              ; preds = %823, %820
  %831 = phi i32 [ %828, %823 ], [ %821, %820 ]
  %832 = select i1 %791, i1 %379, i1 false
  br i1 %832, label %833, label %839

833:                                              ; preds = %830
  %834 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %792, i32 %216
  %835 = load i32, i32 addrspace(3)* %834, align 4, !tbaa !10
  %836 = sitofp i32 %835 to float
  %837 = add nuw nsw i32 %831, 1
  %838 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %831
  store float %836, float addrspace(5)* %838, align 4, !tbaa !12
  br label %839

839:                                              ; preds = %833, %830
  %840 = phi i32 [ %837, %833 ], [ %831, %830 ]
  %841 = select i1 %791, i1 %389, i1 false
  br i1 %841, label %842, label %849

842:                                              ; preds = %839
  %843 = add nuw nsw i32 %21, 5
  %844 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %792, i32 %843
  %845 = load i32, i32 addrspace(3)* %844, align 4, !tbaa !10
  %846 = sitofp i32 %845 to float
  %847 = add nuw nsw i32 %840, 1
  %848 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %840
  store float %846, float addrspace(5)* %848, align 4, !tbaa !12
  br label %849

849:                                              ; preds = %842, %839
  %850 = phi i32 [ %847, %842 ], [ %840, %839 ]
  %851 = select i1 %791, i1 %400, i1 false
  br i1 %851, label %852, label %859

852:                                              ; preds = %849
  %853 = add nuw nsw i32 %21, 6
  %854 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %792, i32 %853
  %855 = load i32, i32 addrspace(3)* %854, align 4, !tbaa !10
  %856 = sitofp i32 %855 to float
  %857 = add nuw nsw i32 %850, 1
  %858 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %850
  store float %856, float addrspace(5)* %858, align 4, !tbaa !12
  br label %859

859:                                              ; preds = %852, %849
  %860 = phi i32 [ %857, %852 ], [ %850, %849 ]
  %861 = select i1 %791, i1 %411, i1 false
  br i1 %861, label %862, label %869

862:                                              ; preds = %859
  %863 = add nuw nsw i32 %21, 7
  %864 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %792, i32 %863
  %865 = load i32, i32 addrspace(3)* %864, align 4, !tbaa !10
  %866 = sitofp i32 %865 to float
  %867 = add nuw nsw i32 %860, 1
  %868 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %860
  store float %866, float addrspace(5)* %868, align 4, !tbaa !12
  br label %869

869:                                              ; preds = %862, %859
  %870 = phi i32 [ %867, %862 ], [ %860, %859 ]
  %871 = select i1 %791, i1 %422, i1 false
  br i1 %871, label %872, label %879

872:                                              ; preds = %869
  %873 = add nuw nsw i32 %21, 8
  %874 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %792, i32 %873
  %875 = load i32, i32 addrspace(3)* %874, align 4, !tbaa !10
  %876 = sitofp i32 %875 to float
  %877 = add nuw nsw i32 %870, 1
  %878 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %870
  store float %876, float addrspace(5)* %878, align 4, !tbaa !12
  br label %879

879:                                              ; preds = %872, %869
  %880 = phi i32 [ %877, %872 ], [ %870, %869 ]
  %881 = icmp sgt i32 %2, 6
  %882 = add nuw nsw i32 %13, 6
  %883 = select i1 %881, i1 %224, i1 false
  br i1 %883, label %884, label %890

884:                                              ; preds = %879
  %885 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %882, i32 %21
  %886 = load i32, i32 addrspace(3)* %885, align 4, !tbaa !10
  %887 = sitofp i32 %886 to float
  %888 = add nuw nsw i32 %880, 1
  %889 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %880
  store float %887, float addrspace(5)* %889, align 4, !tbaa !12
  br label %890

890:                                              ; preds = %884, %879
  %891 = phi i32 [ %888, %884 ], [ %880, %879 ]
  %892 = select i1 %881, i1 %346, i1 false
  br i1 %892, label %893, label %900

893:                                              ; preds = %890
  %894 = add nuw nsw i32 %21, 1
  %895 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %882, i32 %894
  %896 = load i32, i32 addrspace(3)* %895, align 4, !tbaa !10
  %897 = sitofp i32 %896 to float
  %898 = add nuw nsw i32 %891, 1
  %899 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %891
  store float %897, float addrspace(5)* %899, align 4, !tbaa !12
  br label %900

900:                                              ; preds = %893, %890
  %901 = phi i32 [ %898, %893 ], [ %891, %890 ]
  %902 = select i1 %881, i1 %357, i1 false
  br i1 %902, label %903, label %910

903:                                              ; preds = %900
  %904 = add nuw nsw i32 %21, 2
  %905 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %882, i32 %904
  %906 = load i32, i32 addrspace(3)* %905, align 4, !tbaa !10
  %907 = sitofp i32 %906 to float
  %908 = add nuw nsw i32 %901, 1
  %909 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %901
  store float %907, float addrspace(5)* %909, align 4, !tbaa !12
  br label %910

910:                                              ; preds = %903, %900
  %911 = phi i32 [ %908, %903 ], [ %901, %900 ]
  %912 = select i1 %881, i1 %368, i1 false
  br i1 %912, label %913, label %920

913:                                              ; preds = %910
  %914 = add nuw nsw i32 %21, 3
  %915 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %882, i32 %914
  %916 = load i32, i32 addrspace(3)* %915, align 4, !tbaa !10
  %917 = sitofp i32 %916 to float
  %918 = add nuw nsw i32 %911, 1
  %919 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %911
  store float %917, float addrspace(5)* %919, align 4, !tbaa !12
  br label %920

920:                                              ; preds = %913, %910
  %921 = phi i32 [ %918, %913 ], [ %911, %910 ]
  %922 = select i1 %881, i1 %379, i1 false
  br i1 %922, label %923, label %929

923:                                              ; preds = %920
  %924 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %882, i32 %216
  %925 = load i32, i32 addrspace(3)* %924, align 4, !tbaa !10
  %926 = sitofp i32 %925 to float
  %927 = add nuw nsw i32 %921, 1
  %928 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %921
  store float %926, float addrspace(5)* %928, align 4, !tbaa !12
  br label %929

929:                                              ; preds = %923, %920
  %930 = phi i32 [ %927, %923 ], [ %921, %920 ]
  %931 = select i1 %881, i1 %389, i1 false
  br i1 %931, label %932, label %939

932:                                              ; preds = %929
  %933 = add nuw nsw i32 %21, 5
  %934 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %882, i32 %933
  %935 = load i32, i32 addrspace(3)* %934, align 4, !tbaa !10
  %936 = sitofp i32 %935 to float
  %937 = add nuw nsw i32 %930, 1
  %938 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %930
  store float %936, float addrspace(5)* %938, align 4, !tbaa !12
  br label %939

939:                                              ; preds = %932, %929
  %940 = phi i32 [ %937, %932 ], [ %930, %929 ]
  %941 = select i1 %881, i1 %400, i1 false
  br i1 %941, label %942, label %949

942:                                              ; preds = %939
  %943 = add nuw nsw i32 %21, 6
  %944 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %882, i32 %943
  %945 = load i32, i32 addrspace(3)* %944, align 4, !tbaa !10
  %946 = sitofp i32 %945 to float
  %947 = add nuw nsw i32 %940, 1
  %948 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %940
  store float %946, float addrspace(5)* %948, align 4, !tbaa !12
  br label %949

949:                                              ; preds = %942, %939
  %950 = phi i32 [ %947, %942 ], [ %940, %939 ]
  %951 = select i1 %881, i1 %411, i1 false
  br i1 %951, label %952, label %959

952:                                              ; preds = %949
  %953 = add nuw nsw i32 %21, 7
  %954 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %882, i32 %953
  %955 = load i32, i32 addrspace(3)* %954, align 4, !tbaa !10
  %956 = sitofp i32 %955 to float
  %957 = add nuw nsw i32 %950, 1
  %958 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %950
  store float %956, float addrspace(5)* %958, align 4, !tbaa !12
  br label %959

959:                                              ; preds = %952, %949
  %960 = phi i32 [ %957, %952 ], [ %950, %949 ]
  %961 = select i1 %881, i1 %422, i1 false
  br i1 %961, label %962, label %969

962:                                              ; preds = %959
  %963 = add nuw nsw i32 %21, 8
  %964 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %882, i32 %963
  %965 = load i32, i32 addrspace(3)* %964, align 4, !tbaa !10
  %966 = sitofp i32 %965 to float
  %967 = add nuw nsw i32 %960, 1
  %968 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %960
  store float %966, float addrspace(5)* %968, align 4, !tbaa !12
  br label %969

969:                                              ; preds = %962, %959
  %970 = phi i32 [ %967, %962 ], [ %960, %959 ]
  %971 = icmp sgt i32 %2, 7
  %972 = add nuw nsw i32 %13, 7
  %973 = select i1 %971, i1 %224, i1 false
  br i1 %973, label %974, label %980

974:                                              ; preds = %969
  %975 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %972, i32 %21
  %976 = load i32, i32 addrspace(3)* %975, align 4, !tbaa !10
  %977 = sitofp i32 %976 to float
  %978 = add nuw nsw i32 %970, 1
  %979 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %970
  store float %977, float addrspace(5)* %979, align 4, !tbaa !12
  br label %980

980:                                              ; preds = %974, %969
  %981 = phi i32 [ %978, %974 ], [ %970, %969 ]
  %982 = select i1 %971, i1 %346, i1 false
  br i1 %982, label %983, label %990

983:                                              ; preds = %980
  %984 = add nuw nsw i32 %21, 1
  %985 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %972, i32 %984
  %986 = load i32, i32 addrspace(3)* %985, align 4, !tbaa !10
  %987 = sitofp i32 %986 to float
  %988 = add nuw nsw i32 %981, 1
  %989 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %981
  store float %987, float addrspace(5)* %989, align 4, !tbaa !12
  br label %990

990:                                              ; preds = %983, %980
  %991 = phi i32 [ %988, %983 ], [ %981, %980 ]
  %992 = select i1 %971, i1 %357, i1 false
  br i1 %992, label %993, label %1000

993:                                              ; preds = %990
  %994 = add nuw nsw i32 %21, 2
  %995 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %972, i32 %994
  %996 = load i32, i32 addrspace(3)* %995, align 4, !tbaa !10
  %997 = sitofp i32 %996 to float
  %998 = add nuw nsw i32 %991, 1
  %999 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %991
  store float %997, float addrspace(5)* %999, align 4, !tbaa !12
  br label %1000

1000:                                             ; preds = %993, %990
  %1001 = phi i32 [ %998, %993 ], [ %991, %990 ]
  %1002 = select i1 %971, i1 %368, i1 false
  br i1 %1002, label %1003, label %1010

1003:                                             ; preds = %1000
  %1004 = add nuw nsw i32 %21, 3
  %1005 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %972, i32 %1004
  %1006 = load i32, i32 addrspace(3)* %1005, align 4, !tbaa !10
  %1007 = sitofp i32 %1006 to float
  %1008 = add nuw nsw i32 %1001, 1
  %1009 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1001
  store float %1007, float addrspace(5)* %1009, align 4, !tbaa !12
  br label %1010

1010:                                             ; preds = %1003, %1000
  %1011 = phi i32 [ %1008, %1003 ], [ %1001, %1000 ]
  %1012 = select i1 %971, i1 %379, i1 false
  br i1 %1012, label %1013, label %1019

1013:                                             ; preds = %1010
  %1014 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %972, i32 %216
  %1015 = load i32, i32 addrspace(3)* %1014, align 4, !tbaa !10
  %1016 = sitofp i32 %1015 to float
  %1017 = add nuw nsw i32 %1011, 1
  %1018 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1011
  store float %1016, float addrspace(5)* %1018, align 4, !tbaa !12
  br label %1019

1019:                                             ; preds = %1013, %1010
  %1020 = phi i32 [ %1017, %1013 ], [ %1011, %1010 ]
  %1021 = select i1 %971, i1 %389, i1 false
  br i1 %1021, label %1022, label %1029

1022:                                             ; preds = %1019
  %1023 = add nuw nsw i32 %21, 5
  %1024 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %972, i32 %1023
  %1025 = load i32, i32 addrspace(3)* %1024, align 4, !tbaa !10
  %1026 = sitofp i32 %1025 to float
  %1027 = add nuw nsw i32 %1020, 1
  %1028 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1020
  store float %1026, float addrspace(5)* %1028, align 4, !tbaa !12
  br label %1029

1029:                                             ; preds = %1022, %1019
  %1030 = phi i32 [ %1027, %1022 ], [ %1020, %1019 ]
  %1031 = select i1 %971, i1 %400, i1 false
  br i1 %1031, label %1032, label %1039

1032:                                             ; preds = %1029
  %1033 = add nuw nsw i32 %21, 6
  %1034 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %972, i32 %1033
  %1035 = load i32, i32 addrspace(3)* %1034, align 4, !tbaa !10
  %1036 = sitofp i32 %1035 to float
  %1037 = add nuw nsw i32 %1030, 1
  %1038 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1030
  store float %1036, float addrspace(5)* %1038, align 4, !tbaa !12
  br label %1039

1039:                                             ; preds = %1032, %1029
  %1040 = phi i32 [ %1037, %1032 ], [ %1030, %1029 ]
  %1041 = select i1 %971, i1 %411, i1 false
  br i1 %1041, label %1042, label %1049

1042:                                             ; preds = %1039
  %1043 = add nuw nsw i32 %21, 7
  %1044 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %972, i32 %1043
  %1045 = load i32, i32 addrspace(3)* %1044, align 4, !tbaa !10
  %1046 = sitofp i32 %1045 to float
  %1047 = add nuw nsw i32 %1040, 1
  %1048 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1040
  store float %1046, float addrspace(5)* %1048, align 4, !tbaa !12
  br label %1049

1049:                                             ; preds = %1042, %1039
  %1050 = phi i32 [ %1047, %1042 ], [ %1040, %1039 ]
  %1051 = select i1 %971, i1 %422, i1 false
  br i1 %1051, label %1052, label %1059

1052:                                             ; preds = %1049
  %1053 = add nuw nsw i32 %21, 8
  %1054 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %972, i32 %1053
  %1055 = load i32, i32 addrspace(3)* %1054, align 4, !tbaa !10
  %1056 = sitofp i32 %1055 to float
  %1057 = add nuw nsw i32 %1050, 1
  %1058 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1050
  store float %1056, float addrspace(5)* %1058, align 4, !tbaa !12
  br label %1059

1059:                                             ; preds = %1052, %1049
  %1060 = phi i32 [ %1057, %1052 ], [ %1050, %1049 ]
  %1061 = icmp sgt i32 %2, 8
  %1062 = add nuw nsw i32 %13, 8
  %1063 = select i1 %1061, i1 %224, i1 false
  br i1 %1063, label %1064, label %1070

1064:                                             ; preds = %1059
  %1065 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %1062, i32 %21
  %1066 = load i32, i32 addrspace(3)* %1065, align 4, !tbaa !10
  %1067 = sitofp i32 %1066 to float
  %1068 = add nuw nsw i32 %1060, 1
  %1069 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1060
  store float %1067, float addrspace(5)* %1069, align 4, !tbaa !12
  br label %1070

1070:                                             ; preds = %1064, %1059
  %1071 = phi i32 [ %1068, %1064 ], [ %1060, %1059 ]
  %1072 = select i1 %1061, i1 %346, i1 false
  br i1 %1072, label %1073, label %1080

1073:                                             ; preds = %1070
  %1074 = add nuw nsw i32 %21, 1
  %1075 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %1062, i32 %1074
  %1076 = load i32, i32 addrspace(3)* %1075, align 4, !tbaa !10
  %1077 = sitofp i32 %1076 to float
  %1078 = add nuw nsw i32 %1071, 1
  %1079 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1071
  store float %1077, float addrspace(5)* %1079, align 4, !tbaa !12
  br label %1080

1080:                                             ; preds = %1073, %1070
  %1081 = phi i32 [ %1078, %1073 ], [ %1071, %1070 ]
  %1082 = select i1 %1061, i1 %357, i1 false
  br i1 %1082, label %1083, label %1090

1083:                                             ; preds = %1080
  %1084 = add nuw nsw i32 %21, 2
  %1085 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %1062, i32 %1084
  %1086 = load i32, i32 addrspace(3)* %1085, align 4, !tbaa !10
  %1087 = sitofp i32 %1086 to float
  %1088 = add nuw nsw i32 %1081, 1
  %1089 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1081
  store float %1087, float addrspace(5)* %1089, align 4, !tbaa !12
  br label %1090

1090:                                             ; preds = %1083, %1080
  %1091 = phi i32 [ %1088, %1083 ], [ %1081, %1080 ]
  %1092 = select i1 %1061, i1 %368, i1 false
  br i1 %1092, label %1093, label %1100

1093:                                             ; preds = %1090
  %1094 = add nuw nsw i32 %21, 3
  %1095 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %1062, i32 %1094
  %1096 = load i32, i32 addrspace(3)* %1095, align 4, !tbaa !10
  %1097 = sitofp i32 %1096 to float
  %1098 = add nuw nsw i32 %1091, 1
  %1099 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1091
  store float %1097, float addrspace(5)* %1099, align 4, !tbaa !12
  br label %1100

1100:                                             ; preds = %1093, %1090
  %1101 = phi i32 [ %1098, %1093 ], [ %1091, %1090 ]
  %1102 = select i1 %1061, i1 %379, i1 false
  br i1 %1102, label %1103, label %1109

1103:                                             ; preds = %1100
  %1104 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %1062, i32 %216
  %1105 = load i32, i32 addrspace(3)* %1104, align 4, !tbaa !10
  %1106 = sitofp i32 %1105 to float
  %1107 = add nuw nsw i32 %1101, 1
  %1108 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1101
  store float %1106, float addrspace(5)* %1108, align 4, !tbaa !12
  br label %1109

1109:                                             ; preds = %1103, %1100
  %1110 = phi i32 [ %1107, %1103 ], [ %1101, %1100 ]
  %1111 = select i1 %1061, i1 %389, i1 false
  br i1 %1111, label %1112, label %1119

1112:                                             ; preds = %1109
  %1113 = add nuw nsw i32 %21, 5
  %1114 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %1062, i32 %1113
  %1115 = load i32, i32 addrspace(3)* %1114, align 4, !tbaa !10
  %1116 = sitofp i32 %1115 to float
  %1117 = add nuw nsw i32 %1110, 1
  %1118 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1110
  store float %1116, float addrspace(5)* %1118, align 4, !tbaa !12
  br label %1119

1119:                                             ; preds = %1112, %1109
  %1120 = phi i32 [ %1117, %1112 ], [ %1110, %1109 ]
  %1121 = select i1 %1061, i1 %400, i1 false
  br i1 %1121, label %1122, label %1129

1122:                                             ; preds = %1119
  %1123 = add nuw nsw i32 %21, 6
  %1124 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %1062, i32 %1123
  %1125 = load i32, i32 addrspace(3)* %1124, align 4, !tbaa !10
  %1126 = sitofp i32 %1125 to float
  %1127 = add nuw nsw i32 %1120, 1
  %1128 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1120
  store float %1126, float addrspace(5)* %1128, align 4, !tbaa !12
  br label %1129

1129:                                             ; preds = %1122, %1119
  %1130 = phi i32 [ %1127, %1122 ], [ %1120, %1119 ]
  %1131 = select i1 %1061, i1 %411, i1 false
  br i1 %1131, label %1132, label %1139

1132:                                             ; preds = %1129
  %1133 = add nuw nsw i32 %21, 7
  %1134 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %1062, i32 %1133
  %1135 = load i32, i32 addrspace(3)* %1134, align 4, !tbaa !10
  %1136 = sitofp i32 %1135 to float
  %1137 = add nuw nsw i32 %1130, 1
  %1138 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1130
  store float %1136, float addrspace(5)* %1138, align 4, !tbaa !12
  br label %1139

1139:                                             ; preds = %1132, %1129
  %1140 = phi i32 [ %1137, %1132 ], [ %1130, %1129 ]
  %1141 = select i1 %1061, i1 %422, i1 false
  br i1 %1141, label %1142, label %1149

1142:                                             ; preds = %1139
  %1143 = add nuw nsw i32 %21, 8
  %1144 = getelementptr inbounds [41 x [41 x i32]], [41 x [41 x i32]] addrspace(3)* @_ZZ19median_filter_2d_smPhS_iiE12sharedPixels, i32 0, i32 %1062, i32 %1143
  %1145 = load i32, i32 addrspace(3)* %1144, align 4, !tbaa !10
  %1146 = sitofp i32 %1145 to float
  %1147 = add nuw nsw i32 %1140, 1
  %1148 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %1140
  store float %1146, float addrspace(5)* %1148, align 4, !tbaa !12
  br label %1149

1149:                                             ; preds = %1142, %1139
  %1150 = phi i32 [ %1147, %1142 ], [ %1140, %1139 ]
  %1151 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 0
  %1152 = icmp ugt i32 %1150, 1
  br i1 %1152, label %226, label %333

1153:                                             ; preds = %333, %208
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !8, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
