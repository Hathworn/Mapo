; ModuleID = '../data/hip_kernels/16057/13/main.cu'
source_filename = "../data/hip_kernels/16057/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }

@.str = private unnamed_addr addrspace(4) constant [16 x i8] c"correlation %f\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [13 x i8] c"variance %f\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [24 x i8] c"difference variance %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z21calculate_correlationPfS_S_S_S_S_PiS_ifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture %6, float addrspace(1)* nocapture %7, i32 %8, float %9, i32 %10) local_unnamed_addr #1 {
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
  %29 = mul nsw i32 %28, %8
  %30 = add nsw i32 %20, %29
  %31 = icmp sgt i32 %8, 0
  br i1 %31, label %32, label %434

32:                                               ; preds = %11
  %33 = zext i32 %30 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %36 = add i32 %8, -1
  %37 = and i32 %8, 3
  %38 = icmp ult i32 %36, 3
  br i1 %38, label %41, label %39

39:                                               ; preds = %32
  %40 = and i32 %8, -4
  br label %68

41:                                               ; preds = %114, %32
  %42 = phi i32 [ 0, %32 ], [ %106, %114 ]
  %43 = icmp eq i32 %37, 0
  br i1 %43, label %60, label %44

44:                                               ; preds = %41, %57
  %45 = phi i32 [ %49, %57 ], [ %42, %41 ]
  %46 = phi i32 [ %58, %57 ], [ 0, %41 ]
  %47 = mul nsw i32 %45, %8
  %48 = icmp uge i32 %30, %47
  %49 = add nuw nsw i32 %45, 1
  %50 = mul nsw i32 %49, %8
  %51 = icmp ult i32 %30, %50
  %52 = select i1 %48, i1 %51, i1 false
  br i1 %52, label %53, label %57

53:                                               ; preds = %44
  %54 = sitofp i32 %45 to float
  %55 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %56 = fmul contract float %55, %54
  store float %56, float addrspace(1)* %35, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %53, %44
  %58 = add i32 %46, 1
  %59 = icmp eq i32 %58, %37
  br i1 %59, label %60, label %44, !llvm.loop !11

60:                                               ; preds = %57, %41
  br i1 %31, label %61, label %434

61:                                               ; preds = %60
  %62 = icmp ult i32 %30, %8
  %63 = mul i32 %30, %8
  %64 = and i32 %8, 3
  %65 = icmp ult i32 %36, 3
  br i1 %65, label %117, label %66

66:                                               ; preds = %61
  %67 = and i32 %8, -4
  br label %153

68:                                               ; preds = %114, %39
  %69 = phi i32 [ 0, %39 ], [ %106, %114 ]
  %70 = phi i32 [ 0, %39 ], [ %115, %114 ]
  %71 = mul nsw i32 %69, %8
  %72 = icmp uge i32 %30, %71
  %73 = or i32 %69, 1
  %74 = mul nsw i32 %73, %8
  %75 = icmp ult i32 %30, %74
  %76 = select i1 %72, i1 %75, i1 false
  br i1 %76, label %77, label %81

77:                                               ; preds = %68
  %78 = sitofp i32 %69 to float
  %79 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %80 = fmul contract float %79, %78
  store float %80, float addrspace(1)* %35, align 4, !tbaa !7
  br label %81

81:                                               ; preds = %68, %77
  %82 = mul nsw i32 %73, %8
  %83 = icmp uge i32 %30, %82
  %84 = or i32 %69, 2
  %85 = mul nsw i32 %84, %8
  %86 = icmp ult i32 %30, %85
  %87 = select i1 %83, i1 %86, i1 false
  br i1 %87, label %88, label %92

88:                                               ; preds = %81
  %89 = sitofp i32 %73 to float
  %90 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %91 = fmul contract float %90, %89
  store float %91, float addrspace(1)* %35, align 4, !tbaa !7
  br label %92

92:                                               ; preds = %88, %81
  %93 = mul nsw i32 %84, %8
  %94 = icmp uge i32 %30, %93
  %95 = or i32 %69, 3
  %96 = mul nsw i32 %95, %8
  %97 = icmp ult i32 %30, %96
  %98 = select i1 %94, i1 %97, i1 false
  br i1 %98, label %99, label %103

99:                                               ; preds = %92
  %100 = sitofp i32 %84 to float
  %101 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %102 = fmul contract float %101, %100
  store float %102, float addrspace(1)* %35, align 4, !tbaa !7
  br label %103

103:                                              ; preds = %99, %92
  %104 = mul nsw i32 %95, %8
  %105 = icmp uge i32 %30, %104
  %106 = add nuw nsw i32 %69, 4
  %107 = mul nsw i32 %106, %8
  %108 = icmp ult i32 %30, %107
  %109 = select i1 %105, i1 %108, i1 false
  br i1 %109, label %110, label %114

110:                                              ; preds = %103
  %111 = sitofp i32 %95 to float
  %112 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %113 = fmul contract float %112, %111
  store float %113, float addrspace(1)* %35, align 4, !tbaa !7
  br label %114

114:                                              ; preds = %110, %103
  %115 = add i32 %70, 4
  %116 = icmp eq i32 %115, %40
  br i1 %116, label %41, label %68, !llvm.loop !13

117:                                              ; preds = %222, %61
  %118 = phi i32 [ 0, %61 ], [ %223, %222 ]
  %119 = phi i32 [ 0, %61 ], [ %224, %222 ]
  %120 = icmp eq i32 %64, 0
  br i1 %120, label %144, label %121

121:                                              ; preds = %117, %139
  %122 = phi i32 [ %140, %139 ], [ %118, %117 ]
  %123 = phi i32 [ %141, %139 ], [ %119, %117 ]
  %124 = phi i32 [ %142, %139 ], [ 0, %117 ]
  %125 = icmp eq i32 %122, %123
  %126 = select i1 %125, i1 %62, i1 false
  br i1 %126, label %127, label %139

127:                                              ; preds = %121
  %128 = sitofp i32 %122 to float
  %129 = add i32 %122, %63
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = fmul contract float %132, %128
  %134 = mul nsw i32 %122, %8
  %135 = add i32 %134, %30
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %3, i64 %136
  store float %133, float addrspace(1)* %137, align 4, !tbaa !7
  %138 = add nsw i32 %122, 1
  br label %139

139:                                              ; preds = %127, %121
  %140 = phi i32 [ %138, %127 ], [ %122, %121 ]
  %141 = add nuw nsw i32 %123, 1
  %142 = add i32 %124, 1
  %143 = icmp eq i32 %142, %64
  br i1 %143, label %144, label %121, !llvm.loop !15

144:                                              ; preds = %139, %117
  br i1 %31, label %145, label %434

145:                                              ; preds = %144
  %146 = zext i32 %30 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = getelementptr inbounds float, float addrspace(1)* %4, i64 %146
  %149 = and i32 %8, 3
  %150 = icmp ult i32 %36, 3
  br i1 %150, label %227, label %151

151:                                              ; preds = %145
  %152 = and i32 %8, -4
  br label %257

153:                                              ; preds = %222, %66
  %154 = phi i32 [ 0, %66 ], [ %223, %222 ]
  %155 = phi i32 [ 0, %66 ], [ %224, %222 ]
  %156 = phi i32 [ 0, %66 ], [ %225, %222 ]
  %157 = icmp eq i32 %154, %155
  %158 = select i1 %157, i1 %62, i1 false
  br i1 %158, label %159, label %171

159:                                              ; preds = %153
  %160 = sitofp i32 %154 to float
  %161 = add i32 %154, %63
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %165 = fmul contract float %164, %160
  %166 = mul nsw i32 %154, %8
  %167 = add i32 %166, %30
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %3, i64 %168
  store float %165, float addrspace(1)* %169, align 4, !tbaa !7
  %170 = add nsw i32 %154, 1
  br label %171

171:                                              ; preds = %153, %159
  %172 = phi i32 [ %170, %159 ], [ %154, %153 ]
  %173 = or i32 %155, 1
  %174 = icmp eq i32 %172, %173
  %175 = select i1 %174, i1 %62, i1 false
  br i1 %175, label %176, label %188

176:                                              ; preds = %171
  %177 = sitofp i32 %172 to float
  %178 = add i32 %172, %63
  %179 = zext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7
  %182 = fmul contract float %181, %177
  %183 = mul nsw i32 %172, %8
  %184 = add i32 %183, %30
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %3, i64 %185
  store float %182, float addrspace(1)* %186, align 4, !tbaa !7
  %187 = add nsw i32 %172, 1
  br label %188

188:                                              ; preds = %176, %171
  %189 = phi i32 [ %187, %176 ], [ %172, %171 ]
  %190 = or i32 %155, 2
  %191 = icmp eq i32 %189, %190
  %192 = select i1 %191, i1 %62, i1 false
  br i1 %192, label %193, label %205

193:                                              ; preds = %188
  %194 = sitofp i32 %189 to float
  %195 = add i32 %189, %63
  %196 = zext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %0, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !7
  %199 = fmul contract float %198, %194
  %200 = mul nsw i32 %189, %8
  %201 = add i32 %200, %30
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %3, i64 %202
  store float %199, float addrspace(1)* %203, align 4, !tbaa !7
  %204 = add nsw i32 %189, 1
  br label %205

205:                                              ; preds = %193, %188
  %206 = phi i32 [ %204, %193 ], [ %189, %188 ]
  %207 = or i32 %155, 3
  %208 = icmp eq i32 %206, %207
  %209 = select i1 %208, i1 %62, i1 false
  br i1 %209, label %210, label %222

210:                                              ; preds = %205
  %211 = sitofp i32 %206 to float
  %212 = add i32 %206, %63
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds float, float addrspace(1)* %0, i64 %213
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !7
  %216 = fmul contract float %215, %211
  %217 = mul nsw i32 %206, %8
  %218 = add i32 %217, %30
  %219 = zext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %3, i64 %219
  store float %216, float addrspace(1)* %220, align 4, !tbaa !7
  %221 = add nsw i32 %206, 1
  br label %222

222:                                              ; preds = %210, %205
  %223 = phi i32 [ %221, %210 ], [ %206, %205 ]
  %224 = add nuw nsw i32 %155, 4
  %225 = add i32 %156, 4
  %226 = icmp eq i32 %225, %67
  br i1 %226, label %117, label %153, !llvm.loop !16

227:                                              ; preds = %315, %145
  %228 = phi i32 [ 0, %145 ], [ %304, %315 ]
  %229 = icmp eq i32 %149, 0
  br i1 %229, label %249, label %230

230:                                              ; preds = %227, %246
  %231 = phi i32 [ %235, %246 ], [ %228, %227 ]
  %232 = phi i32 [ %247, %246 ], [ 0, %227 ]
  %233 = mul nsw i32 %231, %8
  %234 = icmp uge i32 %30, %233
  %235 = add nuw nsw i32 %231, 1
  %236 = mul nsw i32 %235, %8
  %237 = icmp ult i32 %30, %236
  %238 = select i1 %234, i1 %237, i1 false
  br i1 %238, label %239, label %246

239:                                              ; preds = %230
  %240 = sitofp i32 %231 to float
  %241 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %242 = fsub contract float %240, %241
  %243 = fmul contract float %242, %242
  %244 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %245 = fmul contract float %244, %243
  store float %245, float addrspace(1)* %148, align 4, !tbaa !7
  br label %246

246:                                              ; preds = %239, %230
  %247 = add i32 %232, 1
  %248 = icmp eq i32 %247, %149
  br i1 %248, label %249, label %230, !llvm.loop !17

249:                                              ; preds = %246, %227
  br i1 %31, label %250, label %434

250:                                              ; preds = %249
  %251 = icmp ult i32 %30, %8
  %252 = mul i32 %30, %8
  %253 = and i32 %8, 3
  %254 = icmp ult i32 %36, 3
  br i1 %254, label %404, label %255

255:                                              ; preds = %250
  %256 = and i32 %8, -4
  br label %318

257:                                              ; preds = %315, %151
  %258 = phi i32 [ 0, %151 ], [ %304, %315 ]
  %259 = phi i32 [ 0, %151 ], [ %316, %315 ]
  %260 = mul nsw i32 %258, %8
  %261 = icmp uge i32 %30, %260
  %262 = or i32 %258, 1
  %263 = mul nsw i32 %262, %8
  %264 = icmp ult i32 %30, %263
  %265 = select i1 %261, i1 %264, i1 false
  br i1 %265, label %266, label %273

266:                                              ; preds = %257
  %267 = sitofp i32 %258 to float
  %268 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %269 = fsub contract float %267, %268
  %270 = fmul contract float %269, %269
  %271 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %272 = fmul contract float %271, %270
  store float %272, float addrspace(1)* %148, align 4, !tbaa !7
  br label %273

273:                                              ; preds = %257, %266
  %274 = mul nsw i32 %262, %8
  %275 = icmp uge i32 %30, %274
  %276 = or i32 %258, 2
  %277 = mul nsw i32 %276, %8
  %278 = icmp ult i32 %30, %277
  %279 = select i1 %275, i1 %278, i1 false
  br i1 %279, label %280, label %287

280:                                              ; preds = %273
  %281 = sitofp i32 %262 to float
  %282 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %283 = fsub contract float %281, %282
  %284 = fmul contract float %283, %283
  %285 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %286 = fmul contract float %285, %284
  store float %286, float addrspace(1)* %148, align 4, !tbaa !7
  br label %287

287:                                              ; preds = %280, %273
  %288 = mul nsw i32 %276, %8
  %289 = icmp uge i32 %30, %288
  %290 = or i32 %258, 3
  %291 = mul nsw i32 %290, %8
  %292 = icmp ult i32 %30, %291
  %293 = select i1 %289, i1 %292, i1 false
  br i1 %293, label %294, label %301

294:                                              ; preds = %287
  %295 = sitofp i32 %276 to float
  %296 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %297 = fsub contract float %295, %296
  %298 = fmul contract float %297, %297
  %299 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %300 = fmul contract float %299, %298
  store float %300, float addrspace(1)* %148, align 4, !tbaa !7
  br label %301

301:                                              ; preds = %294, %287
  %302 = mul nsw i32 %290, %8
  %303 = icmp uge i32 %30, %302
  %304 = add nuw nsw i32 %258, 4
  %305 = mul nsw i32 %304, %8
  %306 = icmp ult i32 %30, %305
  %307 = select i1 %303, i1 %306, i1 false
  br i1 %307, label %308, label %315

308:                                              ; preds = %301
  %309 = sitofp i32 %290 to float
  %310 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %311 = fsub contract float %309, %310
  %312 = fmul contract float %311, %311
  %313 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %314 = fmul contract float %313, %312
  store float %314, float addrspace(1)* %148, align 4, !tbaa !7
  br label %315

315:                                              ; preds = %308, %301
  %316 = add i32 %259, 4
  %317 = icmp eq i32 %316, %152
  br i1 %317, label %227, label %257, !llvm.loop !18

318:                                              ; preds = %399, %255
  %319 = phi i32 [ 0, %255 ], [ %400, %399 ]
  %320 = phi i32 [ 0, %255 ], [ %401, %399 ]
  %321 = phi i32 [ 0, %255 ], [ %402, %399 ]
  %322 = icmp eq i32 %319, %320
  %323 = select i1 %322, i1 %251, i1 false
  br i1 %323, label %324, label %339

324:                                              ; preds = %318
  %325 = sitofp i32 %319 to float
  %326 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %327 = fsub contract float %325, %326
  %328 = fmul contract float %327, %327
  %329 = add i32 %319, %252
  %330 = zext i32 %329 to i64
  %331 = getelementptr inbounds float, float addrspace(1)* %0, i64 %330
  %332 = load float, float addrspace(1)* %331, align 4, !tbaa !7
  %333 = fmul contract float %332, %328
  %334 = mul nsw i32 %319, %8
  %335 = add i32 %334, %30
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %5, i64 %336
  store float %333, float addrspace(1)* %337, align 4, !tbaa !7
  %338 = add nsw i32 %319, 1
  br label %339

339:                                              ; preds = %318, %324
  %340 = phi i32 [ %338, %324 ], [ %319, %318 ]
  %341 = or i32 %320, 1
  %342 = icmp eq i32 %340, %341
  %343 = select i1 %342, i1 %251, i1 false
  br i1 %343, label %344, label %359

344:                                              ; preds = %339
  %345 = sitofp i32 %340 to float
  %346 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %347 = fsub contract float %345, %346
  %348 = fmul contract float %347, %347
  %349 = add i32 %340, %252
  %350 = zext i32 %349 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %0, i64 %350
  %352 = load float, float addrspace(1)* %351, align 4, !tbaa !7
  %353 = fmul contract float %352, %348
  %354 = mul nsw i32 %340, %8
  %355 = add i32 %354, %30
  %356 = zext i32 %355 to i64
  %357 = getelementptr inbounds float, float addrspace(1)* %5, i64 %356
  store float %353, float addrspace(1)* %357, align 4, !tbaa !7
  %358 = add nsw i32 %340, 1
  br label %359

359:                                              ; preds = %344, %339
  %360 = phi i32 [ %358, %344 ], [ %340, %339 ]
  %361 = or i32 %320, 2
  %362 = icmp eq i32 %360, %361
  %363 = select i1 %362, i1 %251, i1 false
  br i1 %363, label %364, label %379

364:                                              ; preds = %359
  %365 = sitofp i32 %360 to float
  %366 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %367 = fsub contract float %365, %366
  %368 = fmul contract float %367, %367
  %369 = add i32 %360, %252
  %370 = zext i32 %369 to i64
  %371 = getelementptr inbounds float, float addrspace(1)* %0, i64 %370
  %372 = load float, float addrspace(1)* %371, align 4, !tbaa !7
  %373 = fmul contract float %372, %368
  %374 = mul nsw i32 %360, %8
  %375 = add i32 %374, %30
  %376 = zext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %5, i64 %376
  store float %373, float addrspace(1)* %377, align 4, !tbaa !7
  %378 = add nsw i32 %360, 1
  br label %379

379:                                              ; preds = %364, %359
  %380 = phi i32 [ %378, %364 ], [ %360, %359 ]
  %381 = or i32 %320, 3
  %382 = icmp eq i32 %380, %381
  %383 = select i1 %382, i1 %251, i1 false
  br i1 %383, label %384, label %399

384:                                              ; preds = %379
  %385 = sitofp i32 %380 to float
  %386 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %387 = fsub contract float %385, %386
  %388 = fmul contract float %387, %387
  %389 = add i32 %380, %252
  %390 = zext i32 %389 to i64
  %391 = getelementptr inbounds float, float addrspace(1)* %0, i64 %390
  %392 = load float, float addrspace(1)* %391, align 4, !tbaa !7
  %393 = fmul contract float %392, %388
  %394 = mul nsw i32 %380, %8
  %395 = add i32 %394, %30
  %396 = zext i32 %395 to i64
  %397 = getelementptr inbounds float, float addrspace(1)* %5, i64 %396
  store float %393, float addrspace(1)* %397, align 4, !tbaa !7
  %398 = add nsw i32 %380, 1
  br label %399

399:                                              ; preds = %384, %379
  %400 = phi i32 [ %398, %384 ], [ %380, %379 ]
  %401 = add nuw nsw i32 %320, 4
  %402 = add i32 %321, 4
  %403 = icmp eq i32 %402, %256
  br i1 %403, label %404, label %318, !llvm.loop !19

404:                                              ; preds = %399, %250
  %405 = phi i32 [ 0, %250 ], [ %400, %399 ]
  %406 = phi i32 [ 0, %250 ], [ %401, %399 ]
  %407 = icmp eq i32 %253, 0
  br i1 %407, label %434, label %408

408:                                              ; preds = %404, %429
  %409 = phi i32 [ %430, %429 ], [ %405, %404 ]
  %410 = phi i32 [ %431, %429 ], [ %406, %404 ]
  %411 = phi i32 [ %432, %429 ], [ 0, %404 ]
  %412 = icmp eq i32 %409, %410
  %413 = select i1 %412, i1 %251, i1 false
  br i1 %413, label %414, label %429

414:                                              ; preds = %408
  %415 = sitofp i32 %409 to float
  %416 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %417 = fsub contract float %415, %416
  %418 = fmul contract float %417, %417
  %419 = add i32 %409, %252
  %420 = zext i32 %419 to i64
  %421 = getelementptr inbounds float, float addrspace(1)* %0, i64 %420
  %422 = load float, float addrspace(1)* %421, align 4, !tbaa !7
  %423 = fmul contract float %422, %418
  %424 = mul nsw i32 %409, %8
  %425 = add i32 %424, %30
  %426 = zext i32 %425 to i64
  %427 = getelementptr inbounds float, float addrspace(1)* %5, i64 %426
  store float %423, float addrspace(1)* %427, align 4, !tbaa !7
  %428 = add nsw i32 %409, 1
  br label %429

429:                                              ; preds = %414, %408
  %430 = phi i32 [ %428, %414 ], [ %409, %408 ]
  %431 = add nuw nsw i32 %410, 1
  %432 = add i32 %411, 1
  %433 = icmp eq i32 %432, %253
  br i1 %433, label %434, label %408, !llvm.loop !20

434:                                              ; preds = %404, %429, %11, %60, %144, %249
  %435 = icmp eq i32 %30, 0
  %436 = select i1 %435, i1 %31, i1 false
  br i1 %436, label %437, label %506

437:                                              ; preds = %434
  %438 = add i32 %8, -1
  %439 = and i32 %8, 7
  %440 = icmp ult i32 %438, 7
  %441 = and i32 %8, -8
  %442 = icmp eq i32 %439, 0
  br label %443

443:                                              ; preds = %437, %458
  %444 = phi i32 [ %459, %458 ], [ 0, %437 ]
  %445 = mul nsw i32 %444, %8
  br i1 %440, label %446, label %461

446:                                              ; preds = %461, %443
  %447 = phi i32 [ 0, %443 ], [ %503, %461 ]
  br i1 %442, label %458, label %448

448:                                              ; preds = %446, %448
  %449 = phi i32 [ %455, %448 ], [ %447, %446 ]
  %450 = phi i32 [ %456, %448 ], [ 0, %446 ]
  %451 = mul nsw i32 %449, %444
  %452 = add nsw i32 %449, %445
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %453
  store i32 %451, i32 addrspace(1)* %454, align 4, !tbaa !21
  %455 = add nuw nsw i32 %449, 1
  %456 = add i32 %450, 1
  %457 = icmp eq i32 %456, %439
  br i1 %457, label %458, label %448, !llvm.loop !23

458:                                              ; preds = %448, %446
  %459 = add nuw nsw i32 %444, 1
  %460 = icmp eq i32 %459, %8
  br i1 %460, label %506, label %443, !llvm.loop !24

461:                                              ; preds = %443, %461
  %462 = phi i32 [ %503, %461 ], [ 0, %443 ]
  %463 = phi i32 [ %504, %461 ], [ 0, %443 ]
  %464 = mul nsw i32 %462, %444
  %465 = add nsw i32 %462, %445
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %466
  store i32 %464, i32 addrspace(1)* %467, align 4, !tbaa !21
  %468 = or i32 %462, 1
  %469 = mul nsw i32 %468, %444
  %470 = add nsw i32 %468, %445
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %471
  store i32 %469, i32 addrspace(1)* %472, align 4, !tbaa !21
  %473 = or i32 %462, 2
  %474 = mul nsw i32 %473, %444
  %475 = add nsw i32 %473, %445
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %476
  store i32 %474, i32 addrspace(1)* %477, align 4, !tbaa !21
  %478 = or i32 %462, 3
  %479 = mul nsw i32 %478, %444
  %480 = add nsw i32 %478, %445
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %481
  store i32 %479, i32 addrspace(1)* %482, align 4, !tbaa !21
  %483 = or i32 %462, 4
  %484 = mul nsw i32 %483, %444
  %485 = add nsw i32 %483, %445
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %486
  store i32 %484, i32 addrspace(1)* %487, align 4, !tbaa !21
  %488 = or i32 %462, 5
  %489 = mul nsw i32 %488, %444
  %490 = add nsw i32 %488, %445
  %491 = sext i32 %490 to i64
  %492 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %491
  store i32 %489, i32 addrspace(1)* %492, align 4, !tbaa !21
  %493 = or i32 %462, 6
  %494 = mul nsw i32 %493, %444
  %495 = add nsw i32 %493, %445
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %496
  store i32 %494, i32 addrspace(1)* %497, align 4, !tbaa !21
  %498 = or i32 %462, 7
  %499 = mul nsw i32 %498, %444
  %500 = add nsw i32 %498, %445
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %501
  store i32 %499, i32 addrspace(1)* %502, align 4, !tbaa !21
  %503 = add nuw nsw i32 %462, 8
  %504 = add i32 %463, 8
  %505 = icmp eq i32 %504, %441
  br i1 %505, label %446, label %461, !llvm.loop !25

506:                                              ; preds = %458, %434
  %507 = icmp ult i32 %30, %10
  br i1 %507, label %508, label %517

508:                                              ; preds = %506
  %509 = zext i32 %30 to i64
  %510 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %509
  %511 = load i32, i32 addrspace(1)* %510, align 4, !tbaa !21
  %512 = sitofp i32 %511 to float
  %513 = getelementptr inbounds float, float addrspace(1)* %0, i64 %509
  %514 = load float, float addrspace(1)* %513, align 4, !tbaa !7
  %515 = fmul contract float %514, %512
  %516 = getelementptr inbounds float, float addrspace(1)* %1, i64 %509
  store float %515, float addrspace(1)* %516, align 4, !tbaa !7
  br label %517

517:                                              ; preds = %508, %506
  %518 = icmp sgt i32 %10, 1
  br i1 %518, label %519, label %544

519:                                              ; preds = %517
  %520 = zext i32 %30 to i64
  %521 = getelementptr inbounds float, float addrspace(1)* %1, i64 %520
  br label %529

522:                                              ; preds = %542
  br i1 %518, label %523, label %544

523:                                              ; preds = %522
  %524 = zext i32 %30 to i64
  %525 = getelementptr inbounds float, float addrspace(1)* %2, i64 %524
  %526 = getelementptr inbounds float, float addrspace(1)* %5, i64 %524
  %527 = getelementptr inbounds float, float addrspace(1)* %3, i64 %524
  %528 = getelementptr inbounds float, float addrspace(1)* %4, i64 %524
  br label %555

529:                                              ; preds = %519, %542
  %530 = phi i32 [ 1, %519 ], [ %531, %542 ]
  %531 = shl nsw i32 %530, 1
  %532 = add i32 %531, 1023
  %533 = and i32 %532, %12
  %534 = icmp eq i32 %533, 0
  br i1 %534, label %535, label %542

535:                                              ; preds = %529
  %536 = add i32 %530, %30
  %537 = zext i32 %536 to i64
  %538 = getelementptr inbounds float, float addrspace(1)* %1, i64 %537
  %539 = load float, float addrspace(1)* %538, align 4, !tbaa !7
  %540 = load float, float addrspace(1)* %521, align 4, !tbaa !7
  %541 = fadd contract float %539, %540
  store float %541, float addrspace(1)* %521, align 4, !tbaa !7
  br label %542

542:                                              ; preds = %535, %529
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %543 = icmp slt i32 %531, %10
  br i1 %543, label %529, label %522, !llvm.loop !26

544:                                              ; preds = %580, %517, %522
  br i1 %436, label %545, label %776

545:                                              ; preds = %544
  %546 = add i32 %8, -1
  %547 = and i32 %8, 3
  %548 = icmp ult i32 %546, 3
  %549 = and i32 %8, -4
  %550 = icmp eq i32 %547, 0
  %551 = and i32 %8, 3
  %552 = icmp ult i32 %546, 3
  %553 = and i32 %8, -4
  %554 = icmp eq i32 %551, 0
  br label %582

555:                                              ; preds = %523, %580
  %556 = phi i32 [ 1, %523 ], [ %557, %580 ]
  %557 = shl nsw i32 %556, 1
  %558 = add i32 %557, 1023
  %559 = and i32 %558, %12
  %560 = icmp eq i32 %559, 0
  br i1 %560, label %561, label %580

561:                                              ; preds = %555
  %562 = add i32 %556, %30
  %563 = zext i32 %562 to i64
  %564 = getelementptr inbounds float, float addrspace(1)* %2, i64 %563
  %565 = load float, float addrspace(1)* %564, align 4, !tbaa !7
  %566 = load float, float addrspace(1)* %525, align 4, !tbaa !7
  %567 = fadd contract float %565, %566
  store float %567, float addrspace(1)* %525, align 4, !tbaa !7
  %568 = getelementptr inbounds float, float addrspace(1)* %5, i64 %563
  %569 = load float, float addrspace(1)* %568, align 4, !tbaa !7
  %570 = load float, float addrspace(1)* %526, align 4, !tbaa !7
  %571 = fadd contract float %569, %570
  store float %571, float addrspace(1)* %526, align 4, !tbaa !7
  %572 = getelementptr inbounds float, float addrspace(1)* %3, i64 %563
  %573 = load float, float addrspace(1)* %572, align 4, !tbaa !7
  %574 = load float, float addrspace(1)* %527, align 4, !tbaa !7
  %575 = fadd contract float %573, %574
  store float %575, float addrspace(1)* %527, align 4, !tbaa !7
  %576 = getelementptr inbounds float, float addrspace(1)* %4, i64 %563
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !7
  %578 = load float, float addrspace(1)* %528, align 4, !tbaa !7
  %579 = fadd contract float %577, %578
  store float %579, float addrspace(1)* %528, align 4, !tbaa !7
  br label %580

580:                                              ; preds = %561, %555
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %581 = icmp slt i32 %557, %10
  br i1 %581, label %555, label %544, !llvm.loop !27

582:                                              ; preds = %545, %635
  %583 = phi i32 [ %636, %635 ], [ 0, %545 ]
  %584 = icmp eq i32 %583, 0
  %585 = zext i32 %583 to i64
  %586 = getelementptr inbounds float, float addrspace(1)* %7, i64 %585
  br i1 %584, label %588, label %587

587:                                              ; preds = %582
  br i1 %548, label %611, label %703

588:                                              ; preds = %582
  br i1 %552, label %589, label %638

589:                                              ; preds = %638, %588
  %590 = phi i32 [ 0, %588 ], [ %700, %638 ]
  br i1 %554, label %635, label %591

591:                                              ; preds = %589, %591
  %592 = phi i32 [ %608, %591 ], [ %590, %589 ]
  %593 = phi i32 [ %609, %591 ], [ 0, %589 ]
  %594 = sub nsw i32 %583, %592
  %595 = tail call i32 @llvm.abs.i32(i32 %594, i1 true)
  %596 = sitofp i32 %595 to float
  %597 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %598 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %599 = fadd contract float %597, %598
  %600 = fmul contract float %599, 5.000000e-01
  %601 = fsub contract float %596, %600
  %602 = fmul contract float %601, %601
  %603 = zext i32 %595 to i64
  %604 = getelementptr inbounds float, float addrspace(1)* %0, i64 %603
  %605 = load float, float addrspace(1)* %604, align 4, !tbaa !7
  %606 = fmul contract float %605, %602
  %607 = getelementptr inbounds float, float addrspace(1)* %7, i64 %603
  store float %606, float addrspace(1)* %607, align 4, !tbaa !7
  %608 = add nuw nsw i32 %592, 1
  %609 = add i32 %593, 1
  %610 = icmp eq i32 %609, %551
  br i1 %610, label %635, label %591, !llvm.loop !28

611:                                              ; preds = %703, %587
  %612 = phi i32 [ 0, %587 ], [ %773, %703 ]
  br i1 %550, label %635, label %613

613:                                              ; preds = %611, %613
  %614 = phi i32 [ %632, %613 ], [ %612, %611 ]
  %615 = phi i32 [ %633, %613 ], [ 0, %611 ]
  %616 = sub nsw i32 %583, %614
  %617 = tail call i32 @llvm.abs.i32(i32 %616, i1 true)
  %618 = sitofp i32 %617 to float
  %619 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %620 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %621 = fadd contract float %619, %620
  %622 = fmul contract float %621, 5.000000e-01
  %623 = fsub contract float %618, %622
  %624 = fmul contract float %623, %623
  %625 = zext i32 %617 to i64
  %626 = getelementptr inbounds float, float addrspace(1)* %0, i64 %625
  %627 = load float, float addrspace(1)* %626, align 4, !tbaa !7
  %628 = fmul contract float %627, %624
  %629 = getelementptr inbounds float, float addrspace(1)* %7, i64 %625
  store float %628, float addrspace(1)* %629, align 4, !tbaa !7
  %630 = load float, float addrspace(1)* %586, align 4, !tbaa !7
  %631 = fadd contract float %630, %630
  store float %631, float addrspace(1)* %586, align 4, !tbaa !7
  %632 = add nuw nsw i32 %614, 1
  %633 = add i32 %615, 1
  %634 = icmp eq i32 %633, %547
  br i1 %634, label %635, label %613, !llvm.loop !29

635:                                              ; preds = %611, %613, %589, %591
  %636 = add nuw nsw i32 %583, 1
  %637 = icmp eq i32 %636, %8
  br i1 %637, label %776, label %582, !llvm.loop !30

638:                                              ; preds = %588, %638
  %639 = phi i32 [ %700, %638 ], [ 0, %588 ]
  %640 = phi i32 [ %701, %638 ], [ 0, %588 ]
  %641 = sub nsw i32 %583, %639
  %642 = tail call i32 @llvm.abs.i32(i32 %641, i1 true)
  %643 = sitofp i32 %642 to float
  %644 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %645 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %646 = fadd contract float %644, %645
  %647 = fmul contract float %646, 5.000000e-01
  %648 = fsub contract float %643, %647
  %649 = fmul contract float %648, %648
  %650 = zext i32 %642 to i64
  %651 = getelementptr inbounds float, float addrspace(1)* %0, i64 %650
  %652 = load float, float addrspace(1)* %651, align 4, !tbaa !7
  %653 = fmul contract float %652, %649
  %654 = getelementptr inbounds float, float addrspace(1)* %7, i64 %650
  store float %653, float addrspace(1)* %654, align 4, !tbaa !7
  %655 = xor i32 %639, -1
  %656 = add nsw i32 %583, %655
  %657 = tail call i32 @llvm.abs.i32(i32 %656, i1 true)
  %658 = sitofp i32 %657 to float
  %659 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %660 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %661 = fadd contract float %659, %660
  %662 = fmul contract float %661, 5.000000e-01
  %663 = fsub contract float %658, %662
  %664 = fmul contract float %663, %663
  %665 = zext i32 %657 to i64
  %666 = getelementptr inbounds float, float addrspace(1)* %0, i64 %665
  %667 = load float, float addrspace(1)* %666, align 4, !tbaa !7
  %668 = fmul contract float %667, %664
  %669 = getelementptr inbounds float, float addrspace(1)* %7, i64 %665
  store float %668, float addrspace(1)* %669, align 4, !tbaa !7
  %670 = or i32 %639, 2
  %671 = sub nsw i32 %583, %670
  %672 = tail call i32 @llvm.abs.i32(i32 %671, i1 true)
  %673 = sitofp i32 %672 to float
  %674 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %675 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %676 = fadd contract float %674, %675
  %677 = fmul contract float %676, 5.000000e-01
  %678 = fsub contract float %673, %677
  %679 = fmul contract float %678, %678
  %680 = zext i32 %672 to i64
  %681 = getelementptr inbounds float, float addrspace(1)* %0, i64 %680
  %682 = load float, float addrspace(1)* %681, align 4, !tbaa !7
  %683 = fmul contract float %682, %679
  %684 = getelementptr inbounds float, float addrspace(1)* %7, i64 %680
  store float %683, float addrspace(1)* %684, align 4, !tbaa !7
  %685 = or i32 %639, 3
  %686 = sub nsw i32 %583, %685
  %687 = tail call i32 @llvm.abs.i32(i32 %686, i1 true)
  %688 = sitofp i32 %687 to float
  %689 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %690 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %691 = fadd contract float %689, %690
  %692 = fmul contract float %691, 5.000000e-01
  %693 = fsub contract float %688, %692
  %694 = fmul contract float %693, %693
  %695 = zext i32 %687 to i64
  %696 = getelementptr inbounds float, float addrspace(1)* %0, i64 %695
  %697 = load float, float addrspace(1)* %696, align 4, !tbaa !7
  %698 = fmul contract float %697, %694
  %699 = getelementptr inbounds float, float addrspace(1)* %7, i64 %695
  store float %698, float addrspace(1)* %699, align 4, !tbaa !7
  %700 = add nuw nsw i32 %639, 4
  %701 = add i32 %640, 4
  %702 = icmp eq i32 %701, %553
  br i1 %702, label %589, label %638, !llvm.loop !31

703:                                              ; preds = %587, %703
  %704 = phi i32 [ %773, %703 ], [ 0, %587 ]
  %705 = phi i32 [ %774, %703 ], [ 0, %587 ]
  %706 = sub nsw i32 %583, %704
  %707 = tail call i32 @llvm.abs.i32(i32 %706, i1 true)
  %708 = sitofp i32 %707 to float
  %709 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %710 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %711 = fadd contract float %709, %710
  %712 = fmul contract float %711, 5.000000e-01
  %713 = fsub contract float %708, %712
  %714 = fmul contract float %713, %713
  %715 = zext i32 %707 to i64
  %716 = getelementptr inbounds float, float addrspace(1)* %0, i64 %715
  %717 = load float, float addrspace(1)* %716, align 4, !tbaa !7
  %718 = fmul contract float %717, %714
  %719 = getelementptr inbounds float, float addrspace(1)* %7, i64 %715
  store float %718, float addrspace(1)* %719, align 4, !tbaa !7
  %720 = load float, float addrspace(1)* %586, align 4, !tbaa !7
  %721 = fadd contract float %720, %720
  store float %721, float addrspace(1)* %586, align 4, !tbaa !7
  %722 = xor i32 %704, -1
  %723 = add nsw i32 %583, %722
  %724 = tail call i32 @llvm.abs.i32(i32 %723, i1 true)
  %725 = sitofp i32 %724 to float
  %726 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %727 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %728 = fadd contract float %726, %727
  %729 = fmul contract float %728, 5.000000e-01
  %730 = fsub contract float %725, %729
  %731 = fmul contract float %730, %730
  %732 = zext i32 %724 to i64
  %733 = getelementptr inbounds float, float addrspace(1)* %0, i64 %732
  %734 = load float, float addrspace(1)* %733, align 4, !tbaa !7
  %735 = fmul contract float %734, %731
  %736 = getelementptr inbounds float, float addrspace(1)* %7, i64 %732
  store float %735, float addrspace(1)* %736, align 4, !tbaa !7
  %737 = load float, float addrspace(1)* %586, align 4, !tbaa !7
  %738 = fadd contract float %737, %737
  store float %738, float addrspace(1)* %586, align 4, !tbaa !7
  %739 = or i32 %704, 2
  %740 = sub nsw i32 %583, %739
  %741 = tail call i32 @llvm.abs.i32(i32 %740, i1 true)
  %742 = sitofp i32 %741 to float
  %743 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %744 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %745 = fadd contract float %743, %744
  %746 = fmul contract float %745, 5.000000e-01
  %747 = fsub contract float %742, %746
  %748 = fmul contract float %747, %747
  %749 = zext i32 %741 to i64
  %750 = getelementptr inbounds float, float addrspace(1)* %0, i64 %749
  %751 = load float, float addrspace(1)* %750, align 4, !tbaa !7
  %752 = fmul contract float %751, %748
  %753 = getelementptr inbounds float, float addrspace(1)* %7, i64 %749
  store float %752, float addrspace(1)* %753, align 4, !tbaa !7
  %754 = load float, float addrspace(1)* %586, align 4, !tbaa !7
  %755 = fadd contract float %754, %754
  store float %755, float addrspace(1)* %586, align 4, !tbaa !7
  %756 = or i32 %704, 3
  %757 = sub nsw i32 %583, %756
  %758 = tail call i32 @llvm.abs.i32(i32 %757, i1 true)
  %759 = sitofp i32 %758 to float
  %760 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %761 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %762 = fadd contract float %760, %761
  %763 = fmul contract float %762, 5.000000e-01
  %764 = fsub contract float %759, %763
  %765 = fmul contract float %764, %764
  %766 = zext i32 %758 to i64
  %767 = getelementptr inbounds float, float addrspace(1)* %0, i64 %766
  %768 = load float, float addrspace(1)* %767, align 4, !tbaa !7
  %769 = fmul contract float %768, %765
  %770 = getelementptr inbounds float, float addrspace(1)* %7, i64 %766
  store float %769, float addrspace(1)* %770, align 4, !tbaa !7
  %771 = load float, float addrspace(1)* %586, align 4, !tbaa !7
  %772 = fadd contract float %771, %771
  store float %772, float addrspace(1)* %586, align 4, !tbaa !7
  %773 = add nuw nsw i32 %704, 4
  %774 = add i32 %705, 4
  %775 = icmp eq i32 %774, %549
  br i1 %775, label %611, label %703, !llvm.loop !31

776:                                              ; preds = %635, %544
  br i1 %518, label %777, label %780

777:                                              ; preds = %776
  %778 = zext i32 %30 to i64
  %779 = getelementptr inbounds float, float addrspace(1)* %7, i64 %778
  br label %781

780:                                              ; preds = %794, %776
  br i1 %435, label %796, label %2180

781:                                              ; preds = %777, %794
  %782 = phi i32 [ 1, %777 ], [ %783, %794 ]
  %783 = shl nsw i32 %782, 1
  %784 = add i32 %783, 1023
  %785 = and i32 %784, %12
  %786 = icmp eq i32 %785, 0
  br i1 %786, label %787, label %794

787:                                              ; preds = %781
  %788 = add i32 %782, %30
  %789 = zext i32 %788 to i64
  %790 = getelementptr inbounds float, float addrspace(1)* %7, i64 %789
  %791 = load float, float addrspace(1)* %790, align 4, !tbaa !7
  %792 = load float, float addrspace(1)* %779, align 4, !tbaa !7
  %793 = fadd contract float %791, %792
  store float %793, float addrspace(1)* %779, align 4, !tbaa !7
  br label %794

794:                                              ; preds = %787, %781
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %795 = icmp slt i32 %783, %10
  br i1 %795, label %781, label %780, !llvm.loop !32

796:                                              ; preds = %780
  %797 = load float, float addrspace(1)* %1, align 4, !tbaa !7
  %798 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %799 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %800 = fmul contract float %798, %799
  %801 = fsub contract float %797, %800
  %802 = tail call float @llvm.fabs.f32(float %801)
  %803 = load float, float addrspace(1)* %4, align 4, !tbaa !7
  %804 = fdiv contract float %802, %803
  %805 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %806 = fmul contract float %805, %804
  %807 = fpext float %806 to double
  %808 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %809 = getelementptr inbounds i8, i8 addrspace(4)* %808, i64 24
  %810 = bitcast i8 addrspace(4)* %809 to i64 addrspace(4)*
  %811 = load i64, i64 addrspace(4)* %810, align 8, !tbaa !33
  %812 = inttoptr i64 %811 to i8 addrspace(1)*
  %813 = addrspacecast i8 addrspace(1)* %812 to i8*
  %814 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %815 = extractelement <2 x i64> %814, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %816, label %820

816:                                              ; preds = %796
  %817 = and i64 %815, -225
  %818 = or i64 %817, 32
  %819 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef %818, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %1261

820:                                              ; preds = %796
  %821 = and i64 %815, 2
  %822 = and i64 %815, -3
  %823 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %822, i64 0
  br label %824

824:                                              ; preds = %1250, %820
  %825 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str to [16 x i8]*) to i64)), i64 1))), %820 ], [ %1258, %1250 ]
  %826 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0), %820 ], [ %1259, %1250 ]
  %827 = phi <2 x i64> [ %823, %820 ], [ %1257, %1250 ]
  %828 = icmp ugt i64 %825, 56
  %829 = extractelement <2 x i64> %827, i64 0
  %830 = or i64 %829, %821
  %831 = insertelement <2 x i64> poison, i64 %830, i64 0
  %832 = select i1 %828, <2 x i64> %827, <2 x i64> %831
  %833 = tail call i64 @llvm.umin.i64(i64 %825, i64 56)
  %834 = trunc i64 %833 to i32
  %835 = extractelement <2 x i64> %832, i64 0
  %836 = icmp ugt i32 %834, 7
  br i1 %836, label %839, label %837

837:                                              ; preds = %824
  %838 = icmp eq i32 %834, 0
  br i1 %838, label %892, label %879

839:                                              ; preds = %824
  %840 = load i8, i8 addrspace(4)* %826, align 1, !tbaa !37
  %841 = zext i8 %840 to i64
  %842 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 1
  %843 = load i8, i8 addrspace(4)* %842, align 1, !tbaa !37
  %844 = zext i8 %843 to i64
  %845 = shl nuw nsw i64 %844, 8
  %846 = or i64 %845, %841
  %847 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 2
  %848 = load i8, i8 addrspace(4)* %847, align 1, !tbaa !37
  %849 = zext i8 %848 to i64
  %850 = shl nuw nsw i64 %849, 16
  %851 = or i64 %846, %850
  %852 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 3
  %853 = load i8, i8 addrspace(4)* %852, align 1, !tbaa !37
  %854 = zext i8 %853 to i64
  %855 = shl nuw nsw i64 %854, 24
  %856 = or i64 %851, %855
  %857 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 4
  %858 = load i8, i8 addrspace(4)* %857, align 1, !tbaa !37
  %859 = zext i8 %858 to i64
  %860 = shl nuw nsw i64 %859, 32
  %861 = or i64 %856, %860
  %862 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 5
  %863 = load i8, i8 addrspace(4)* %862, align 1, !tbaa !37
  %864 = zext i8 %863 to i64
  %865 = shl nuw nsw i64 %864, 40
  %866 = or i64 %861, %865
  %867 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 6
  %868 = load i8, i8 addrspace(4)* %867, align 1, !tbaa !37
  %869 = zext i8 %868 to i64
  %870 = shl nuw nsw i64 %869, 48
  %871 = or i64 %866, %870
  %872 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 7
  %873 = load i8, i8 addrspace(4)* %872, align 1, !tbaa !37
  %874 = zext i8 %873 to i64
  %875 = shl nuw i64 %874, 56
  %876 = or i64 %871, %875
  %877 = add nsw i32 %834, -8
  %878 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 8
  br label %892

879:                                              ; preds = %837, %879
  %880 = phi i32 [ %890, %879 ], [ 0, %837 ]
  %881 = phi i64 [ %889, %879 ], [ 0, %837 ]
  %882 = zext i32 %880 to i64
  %883 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 %882
  %884 = load i8, i8 addrspace(4)* %883, align 1, !tbaa !37
  %885 = zext i8 %884 to i64
  %886 = shl i32 %880, 3
  %887 = zext i32 %886 to i64
  %888 = shl nuw i64 %885, %887
  %889 = or i64 %888, %881
  %890 = add nuw nsw i32 %880, 1
  %891 = icmp eq i32 %890, %834
  br i1 %891, label %892, label %879, !llvm.loop !38

892:                                              ; preds = %879, %839, %837
  %893 = phi i8 addrspace(4)* [ %878, %839 ], [ %826, %837 ], [ %826, %879 ]
  %894 = phi i32 [ %877, %839 ], [ 0, %837 ], [ 0, %879 ]
  %895 = phi i64 [ %876, %839 ], [ 0, %837 ], [ %889, %879 ]
  %896 = icmp ugt i32 %894, 7
  br i1 %896, label %899, label %897

897:                                              ; preds = %892
  %898 = icmp eq i32 %894, 0
  br i1 %898, label %952, label %939

899:                                              ; preds = %892
  %900 = load i8, i8 addrspace(4)* %893, align 1, !tbaa !37
  %901 = zext i8 %900 to i64
  %902 = getelementptr inbounds i8, i8 addrspace(4)* %893, i64 1
  %903 = load i8, i8 addrspace(4)* %902, align 1, !tbaa !37
  %904 = zext i8 %903 to i64
  %905 = shl nuw nsw i64 %904, 8
  %906 = or i64 %905, %901
  %907 = getelementptr inbounds i8, i8 addrspace(4)* %893, i64 2
  %908 = load i8, i8 addrspace(4)* %907, align 1, !tbaa !37
  %909 = zext i8 %908 to i64
  %910 = shl nuw nsw i64 %909, 16
  %911 = or i64 %906, %910
  %912 = getelementptr inbounds i8, i8 addrspace(4)* %893, i64 3
  %913 = load i8, i8 addrspace(4)* %912, align 1, !tbaa !37
  %914 = zext i8 %913 to i64
  %915 = shl nuw nsw i64 %914, 24
  %916 = or i64 %911, %915
  %917 = getelementptr inbounds i8, i8 addrspace(4)* %893, i64 4
  %918 = load i8, i8 addrspace(4)* %917, align 1, !tbaa !37
  %919 = zext i8 %918 to i64
  %920 = shl nuw nsw i64 %919, 32
  %921 = or i64 %916, %920
  %922 = getelementptr inbounds i8, i8 addrspace(4)* %893, i64 5
  %923 = load i8, i8 addrspace(4)* %922, align 1, !tbaa !37
  %924 = zext i8 %923 to i64
  %925 = shl nuw nsw i64 %924, 40
  %926 = or i64 %921, %925
  %927 = getelementptr inbounds i8, i8 addrspace(4)* %893, i64 6
  %928 = load i8, i8 addrspace(4)* %927, align 1, !tbaa !37
  %929 = zext i8 %928 to i64
  %930 = shl nuw nsw i64 %929, 48
  %931 = or i64 %926, %930
  %932 = getelementptr inbounds i8, i8 addrspace(4)* %893, i64 7
  %933 = load i8, i8 addrspace(4)* %932, align 1, !tbaa !37
  %934 = zext i8 %933 to i64
  %935 = shl nuw i64 %934, 56
  %936 = or i64 %931, %935
  %937 = add nsw i32 %894, -8
  %938 = getelementptr inbounds i8, i8 addrspace(4)* %893, i64 8
  br label %952

939:                                              ; preds = %897, %939
  %940 = phi i32 [ %950, %939 ], [ 0, %897 ]
  %941 = phi i64 [ %949, %939 ], [ 0, %897 ]
  %942 = zext i32 %940 to i64
  %943 = getelementptr inbounds i8, i8 addrspace(4)* %893, i64 %942
  %944 = load i8, i8 addrspace(4)* %943, align 1, !tbaa !37
  %945 = zext i8 %944 to i64
  %946 = shl i32 %940, 3
  %947 = zext i32 %946 to i64
  %948 = shl nuw i64 %945, %947
  %949 = or i64 %948, %941
  %950 = add nuw nsw i32 %940, 1
  %951 = icmp eq i32 %950, %894
  br i1 %951, label %952, label %939

952:                                              ; preds = %939, %899, %897
  %953 = phi i8 addrspace(4)* [ %938, %899 ], [ %893, %897 ], [ %893, %939 ]
  %954 = phi i32 [ %937, %899 ], [ 0, %897 ], [ 0, %939 ]
  %955 = phi i64 [ %936, %899 ], [ 0, %897 ], [ %949, %939 ]
  %956 = icmp ugt i32 %954, 7
  br i1 %956, label %959, label %957

957:                                              ; preds = %952
  %958 = icmp eq i32 %954, 0
  br i1 %958, label %1012, label %999

959:                                              ; preds = %952
  %960 = load i8, i8 addrspace(4)* %953, align 1, !tbaa !37
  %961 = zext i8 %960 to i64
  %962 = getelementptr inbounds i8, i8 addrspace(4)* %953, i64 1
  %963 = load i8, i8 addrspace(4)* %962, align 1, !tbaa !37
  %964 = zext i8 %963 to i64
  %965 = shl nuw nsw i64 %964, 8
  %966 = or i64 %965, %961
  %967 = getelementptr inbounds i8, i8 addrspace(4)* %953, i64 2
  %968 = load i8, i8 addrspace(4)* %967, align 1, !tbaa !37
  %969 = zext i8 %968 to i64
  %970 = shl nuw nsw i64 %969, 16
  %971 = or i64 %966, %970
  %972 = getelementptr inbounds i8, i8 addrspace(4)* %953, i64 3
  %973 = load i8, i8 addrspace(4)* %972, align 1, !tbaa !37
  %974 = zext i8 %973 to i64
  %975 = shl nuw nsw i64 %974, 24
  %976 = or i64 %971, %975
  %977 = getelementptr inbounds i8, i8 addrspace(4)* %953, i64 4
  %978 = load i8, i8 addrspace(4)* %977, align 1, !tbaa !37
  %979 = zext i8 %978 to i64
  %980 = shl nuw nsw i64 %979, 32
  %981 = or i64 %976, %980
  %982 = getelementptr inbounds i8, i8 addrspace(4)* %953, i64 5
  %983 = load i8, i8 addrspace(4)* %982, align 1, !tbaa !37
  %984 = zext i8 %983 to i64
  %985 = shl nuw nsw i64 %984, 40
  %986 = or i64 %981, %985
  %987 = getelementptr inbounds i8, i8 addrspace(4)* %953, i64 6
  %988 = load i8, i8 addrspace(4)* %987, align 1, !tbaa !37
  %989 = zext i8 %988 to i64
  %990 = shl nuw nsw i64 %989, 48
  %991 = or i64 %986, %990
  %992 = getelementptr inbounds i8, i8 addrspace(4)* %953, i64 7
  %993 = load i8, i8 addrspace(4)* %992, align 1, !tbaa !37
  %994 = zext i8 %993 to i64
  %995 = shl nuw i64 %994, 56
  %996 = or i64 %991, %995
  %997 = add nsw i32 %954, -8
  %998 = getelementptr inbounds i8, i8 addrspace(4)* %953, i64 8
  br label %1012

999:                                              ; preds = %957, %999
  %1000 = phi i32 [ %1010, %999 ], [ 0, %957 ]
  %1001 = phi i64 [ %1009, %999 ], [ 0, %957 ]
  %1002 = zext i32 %1000 to i64
  %1003 = getelementptr inbounds i8, i8 addrspace(4)* %953, i64 %1002
  %1004 = load i8, i8 addrspace(4)* %1003, align 1, !tbaa !37
  %1005 = zext i8 %1004 to i64
  %1006 = shl i32 %1000, 3
  %1007 = zext i32 %1006 to i64
  %1008 = shl nuw i64 %1005, %1007
  %1009 = or i64 %1008, %1001
  %1010 = add nuw nsw i32 %1000, 1
  %1011 = icmp eq i32 %1010, %954
  br i1 %1011, label %1012, label %999

1012:                                             ; preds = %999, %959, %957
  %1013 = phi i8 addrspace(4)* [ %998, %959 ], [ %953, %957 ], [ %953, %999 ]
  %1014 = phi i32 [ %997, %959 ], [ 0, %957 ], [ 0, %999 ]
  %1015 = phi i64 [ %996, %959 ], [ 0, %957 ], [ %1009, %999 ]
  %1016 = icmp ugt i32 %1014, 7
  br i1 %1016, label %1019, label %1017

1017:                                             ; preds = %1012
  %1018 = icmp eq i32 %1014, 0
  br i1 %1018, label %1072, label %1059

1019:                                             ; preds = %1012
  %1020 = load i8, i8 addrspace(4)* %1013, align 1, !tbaa !37
  %1021 = zext i8 %1020 to i64
  %1022 = getelementptr inbounds i8, i8 addrspace(4)* %1013, i64 1
  %1023 = load i8, i8 addrspace(4)* %1022, align 1, !tbaa !37
  %1024 = zext i8 %1023 to i64
  %1025 = shl nuw nsw i64 %1024, 8
  %1026 = or i64 %1025, %1021
  %1027 = getelementptr inbounds i8, i8 addrspace(4)* %1013, i64 2
  %1028 = load i8, i8 addrspace(4)* %1027, align 1, !tbaa !37
  %1029 = zext i8 %1028 to i64
  %1030 = shl nuw nsw i64 %1029, 16
  %1031 = or i64 %1026, %1030
  %1032 = getelementptr inbounds i8, i8 addrspace(4)* %1013, i64 3
  %1033 = load i8, i8 addrspace(4)* %1032, align 1, !tbaa !37
  %1034 = zext i8 %1033 to i64
  %1035 = shl nuw nsw i64 %1034, 24
  %1036 = or i64 %1031, %1035
  %1037 = getelementptr inbounds i8, i8 addrspace(4)* %1013, i64 4
  %1038 = load i8, i8 addrspace(4)* %1037, align 1, !tbaa !37
  %1039 = zext i8 %1038 to i64
  %1040 = shl nuw nsw i64 %1039, 32
  %1041 = or i64 %1036, %1040
  %1042 = getelementptr inbounds i8, i8 addrspace(4)* %1013, i64 5
  %1043 = load i8, i8 addrspace(4)* %1042, align 1, !tbaa !37
  %1044 = zext i8 %1043 to i64
  %1045 = shl nuw nsw i64 %1044, 40
  %1046 = or i64 %1041, %1045
  %1047 = getelementptr inbounds i8, i8 addrspace(4)* %1013, i64 6
  %1048 = load i8, i8 addrspace(4)* %1047, align 1, !tbaa !37
  %1049 = zext i8 %1048 to i64
  %1050 = shl nuw nsw i64 %1049, 48
  %1051 = or i64 %1046, %1050
  %1052 = getelementptr inbounds i8, i8 addrspace(4)* %1013, i64 7
  %1053 = load i8, i8 addrspace(4)* %1052, align 1, !tbaa !37
  %1054 = zext i8 %1053 to i64
  %1055 = shl nuw i64 %1054, 56
  %1056 = or i64 %1051, %1055
  %1057 = add nsw i32 %1014, -8
  %1058 = getelementptr inbounds i8, i8 addrspace(4)* %1013, i64 8
  br label %1072

1059:                                             ; preds = %1017, %1059
  %1060 = phi i32 [ %1070, %1059 ], [ 0, %1017 ]
  %1061 = phi i64 [ %1069, %1059 ], [ 0, %1017 ]
  %1062 = zext i32 %1060 to i64
  %1063 = getelementptr inbounds i8, i8 addrspace(4)* %1013, i64 %1062
  %1064 = load i8, i8 addrspace(4)* %1063, align 1, !tbaa !37
  %1065 = zext i8 %1064 to i64
  %1066 = shl i32 %1060, 3
  %1067 = zext i32 %1066 to i64
  %1068 = shl nuw i64 %1065, %1067
  %1069 = or i64 %1068, %1061
  %1070 = add nuw nsw i32 %1060, 1
  %1071 = icmp eq i32 %1070, %1014
  br i1 %1071, label %1072, label %1059

1072:                                             ; preds = %1059, %1019, %1017
  %1073 = phi i8 addrspace(4)* [ %1058, %1019 ], [ %1013, %1017 ], [ %1013, %1059 ]
  %1074 = phi i32 [ %1057, %1019 ], [ 0, %1017 ], [ 0, %1059 ]
  %1075 = phi i64 [ %1056, %1019 ], [ 0, %1017 ], [ %1069, %1059 ]
  %1076 = icmp ugt i32 %1074, 7
  br i1 %1076, label %1079, label %1077

1077:                                             ; preds = %1072
  %1078 = icmp eq i32 %1074, 0
  br i1 %1078, label %1132, label %1119

1079:                                             ; preds = %1072
  %1080 = load i8, i8 addrspace(4)* %1073, align 1, !tbaa !37
  %1081 = zext i8 %1080 to i64
  %1082 = getelementptr inbounds i8, i8 addrspace(4)* %1073, i64 1
  %1083 = load i8, i8 addrspace(4)* %1082, align 1, !tbaa !37
  %1084 = zext i8 %1083 to i64
  %1085 = shl nuw nsw i64 %1084, 8
  %1086 = or i64 %1085, %1081
  %1087 = getelementptr inbounds i8, i8 addrspace(4)* %1073, i64 2
  %1088 = load i8, i8 addrspace(4)* %1087, align 1, !tbaa !37
  %1089 = zext i8 %1088 to i64
  %1090 = shl nuw nsw i64 %1089, 16
  %1091 = or i64 %1086, %1090
  %1092 = getelementptr inbounds i8, i8 addrspace(4)* %1073, i64 3
  %1093 = load i8, i8 addrspace(4)* %1092, align 1, !tbaa !37
  %1094 = zext i8 %1093 to i64
  %1095 = shl nuw nsw i64 %1094, 24
  %1096 = or i64 %1091, %1095
  %1097 = getelementptr inbounds i8, i8 addrspace(4)* %1073, i64 4
  %1098 = load i8, i8 addrspace(4)* %1097, align 1, !tbaa !37
  %1099 = zext i8 %1098 to i64
  %1100 = shl nuw nsw i64 %1099, 32
  %1101 = or i64 %1096, %1100
  %1102 = getelementptr inbounds i8, i8 addrspace(4)* %1073, i64 5
  %1103 = load i8, i8 addrspace(4)* %1102, align 1, !tbaa !37
  %1104 = zext i8 %1103 to i64
  %1105 = shl nuw nsw i64 %1104, 40
  %1106 = or i64 %1101, %1105
  %1107 = getelementptr inbounds i8, i8 addrspace(4)* %1073, i64 6
  %1108 = load i8, i8 addrspace(4)* %1107, align 1, !tbaa !37
  %1109 = zext i8 %1108 to i64
  %1110 = shl nuw nsw i64 %1109, 48
  %1111 = or i64 %1106, %1110
  %1112 = getelementptr inbounds i8, i8 addrspace(4)* %1073, i64 7
  %1113 = load i8, i8 addrspace(4)* %1112, align 1, !tbaa !37
  %1114 = zext i8 %1113 to i64
  %1115 = shl nuw i64 %1114, 56
  %1116 = or i64 %1111, %1115
  %1117 = add nsw i32 %1074, -8
  %1118 = getelementptr inbounds i8, i8 addrspace(4)* %1073, i64 8
  br label %1132

1119:                                             ; preds = %1077, %1119
  %1120 = phi i32 [ %1130, %1119 ], [ 0, %1077 ]
  %1121 = phi i64 [ %1129, %1119 ], [ 0, %1077 ]
  %1122 = zext i32 %1120 to i64
  %1123 = getelementptr inbounds i8, i8 addrspace(4)* %1073, i64 %1122
  %1124 = load i8, i8 addrspace(4)* %1123, align 1, !tbaa !37
  %1125 = zext i8 %1124 to i64
  %1126 = shl i32 %1120, 3
  %1127 = zext i32 %1126 to i64
  %1128 = shl nuw i64 %1125, %1127
  %1129 = or i64 %1128, %1121
  %1130 = add nuw nsw i32 %1120, 1
  %1131 = icmp eq i32 %1130, %1074
  br i1 %1131, label %1132, label %1119

1132:                                             ; preds = %1119, %1079, %1077
  %1133 = phi i8 addrspace(4)* [ %1118, %1079 ], [ %1073, %1077 ], [ %1073, %1119 ]
  %1134 = phi i32 [ %1117, %1079 ], [ 0, %1077 ], [ 0, %1119 ]
  %1135 = phi i64 [ %1116, %1079 ], [ 0, %1077 ], [ %1129, %1119 ]
  %1136 = icmp ugt i32 %1134, 7
  br i1 %1136, label %1139, label %1137

1137:                                             ; preds = %1132
  %1138 = icmp eq i32 %1134, 0
  br i1 %1138, label %1192, label %1179

1139:                                             ; preds = %1132
  %1140 = load i8, i8 addrspace(4)* %1133, align 1, !tbaa !37
  %1141 = zext i8 %1140 to i64
  %1142 = getelementptr inbounds i8, i8 addrspace(4)* %1133, i64 1
  %1143 = load i8, i8 addrspace(4)* %1142, align 1, !tbaa !37
  %1144 = zext i8 %1143 to i64
  %1145 = shl nuw nsw i64 %1144, 8
  %1146 = or i64 %1145, %1141
  %1147 = getelementptr inbounds i8, i8 addrspace(4)* %1133, i64 2
  %1148 = load i8, i8 addrspace(4)* %1147, align 1, !tbaa !37
  %1149 = zext i8 %1148 to i64
  %1150 = shl nuw nsw i64 %1149, 16
  %1151 = or i64 %1146, %1150
  %1152 = getelementptr inbounds i8, i8 addrspace(4)* %1133, i64 3
  %1153 = load i8, i8 addrspace(4)* %1152, align 1, !tbaa !37
  %1154 = zext i8 %1153 to i64
  %1155 = shl nuw nsw i64 %1154, 24
  %1156 = or i64 %1151, %1155
  %1157 = getelementptr inbounds i8, i8 addrspace(4)* %1133, i64 4
  %1158 = load i8, i8 addrspace(4)* %1157, align 1, !tbaa !37
  %1159 = zext i8 %1158 to i64
  %1160 = shl nuw nsw i64 %1159, 32
  %1161 = or i64 %1156, %1160
  %1162 = getelementptr inbounds i8, i8 addrspace(4)* %1133, i64 5
  %1163 = load i8, i8 addrspace(4)* %1162, align 1, !tbaa !37
  %1164 = zext i8 %1163 to i64
  %1165 = shl nuw nsw i64 %1164, 40
  %1166 = or i64 %1161, %1165
  %1167 = getelementptr inbounds i8, i8 addrspace(4)* %1133, i64 6
  %1168 = load i8, i8 addrspace(4)* %1167, align 1, !tbaa !37
  %1169 = zext i8 %1168 to i64
  %1170 = shl nuw nsw i64 %1169, 48
  %1171 = or i64 %1166, %1170
  %1172 = getelementptr inbounds i8, i8 addrspace(4)* %1133, i64 7
  %1173 = load i8, i8 addrspace(4)* %1172, align 1, !tbaa !37
  %1174 = zext i8 %1173 to i64
  %1175 = shl nuw i64 %1174, 56
  %1176 = or i64 %1171, %1175
  %1177 = add nsw i32 %1134, -8
  %1178 = getelementptr inbounds i8, i8 addrspace(4)* %1133, i64 8
  br label %1192

1179:                                             ; preds = %1137, %1179
  %1180 = phi i32 [ %1190, %1179 ], [ 0, %1137 ]
  %1181 = phi i64 [ %1189, %1179 ], [ 0, %1137 ]
  %1182 = zext i32 %1180 to i64
  %1183 = getelementptr inbounds i8, i8 addrspace(4)* %1133, i64 %1182
  %1184 = load i8, i8 addrspace(4)* %1183, align 1, !tbaa !37
  %1185 = zext i8 %1184 to i64
  %1186 = shl i32 %1180, 3
  %1187 = zext i32 %1186 to i64
  %1188 = shl nuw i64 %1185, %1187
  %1189 = or i64 %1188, %1181
  %1190 = add nuw nsw i32 %1180, 1
  %1191 = icmp eq i32 %1190, %1134
  br i1 %1191, label %1192, label %1179

1192:                                             ; preds = %1179, %1139, %1137
  %1193 = phi i8 addrspace(4)* [ %1178, %1139 ], [ %1133, %1137 ], [ %1133, %1179 ]
  %1194 = phi i32 [ %1177, %1139 ], [ 0, %1137 ], [ 0, %1179 ]
  %1195 = phi i64 [ %1176, %1139 ], [ 0, %1137 ], [ %1189, %1179 ]
  %1196 = icmp ugt i32 %1194, 7
  br i1 %1196, label %1199, label %1197

1197:                                             ; preds = %1192
  %1198 = icmp eq i32 %1194, 0
  br i1 %1198, label %1250, label %1237

1199:                                             ; preds = %1192
  %1200 = load i8, i8 addrspace(4)* %1193, align 1, !tbaa !37
  %1201 = zext i8 %1200 to i64
  %1202 = getelementptr inbounds i8, i8 addrspace(4)* %1193, i64 1
  %1203 = load i8, i8 addrspace(4)* %1202, align 1, !tbaa !37
  %1204 = zext i8 %1203 to i64
  %1205 = shl nuw nsw i64 %1204, 8
  %1206 = or i64 %1205, %1201
  %1207 = getelementptr inbounds i8, i8 addrspace(4)* %1193, i64 2
  %1208 = load i8, i8 addrspace(4)* %1207, align 1, !tbaa !37
  %1209 = zext i8 %1208 to i64
  %1210 = shl nuw nsw i64 %1209, 16
  %1211 = or i64 %1206, %1210
  %1212 = getelementptr inbounds i8, i8 addrspace(4)* %1193, i64 3
  %1213 = load i8, i8 addrspace(4)* %1212, align 1, !tbaa !37
  %1214 = zext i8 %1213 to i64
  %1215 = shl nuw nsw i64 %1214, 24
  %1216 = or i64 %1211, %1215
  %1217 = getelementptr inbounds i8, i8 addrspace(4)* %1193, i64 4
  %1218 = load i8, i8 addrspace(4)* %1217, align 1, !tbaa !37
  %1219 = zext i8 %1218 to i64
  %1220 = shl nuw nsw i64 %1219, 32
  %1221 = or i64 %1216, %1220
  %1222 = getelementptr inbounds i8, i8 addrspace(4)* %1193, i64 5
  %1223 = load i8, i8 addrspace(4)* %1222, align 1, !tbaa !37
  %1224 = zext i8 %1223 to i64
  %1225 = shl nuw nsw i64 %1224, 40
  %1226 = or i64 %1221, %1225
  %1227 = getelementptr inbounds i8, i8 addrspace(4)* %1193, i64 6
  %1228 = load i8, i8 addrspace(4)* %1227, align 1, !tbaa !37
  %1229 = zext i8 %1228 to i64
  %1230 = shl nuw nsw i64 %1229, 48
  %1231 = or i64 %1226, %1230
  %1232 = getelementptr inbounds i8, i8 addrspace(4)* %1193, i64 7
  %1233 = load i8, i8 addrspace(4)* %1232, align 1, !tbaa !37
  %1234 = zext i8 %1233 to i64
  %1235 = shl nuw i64 %1234, 56
  %1236 = or i64 %1231, %1235
  br label %1250

1237:                                             ; preds = %1197, %1237
  %1238 = phi i32 [ %1248, %1237 ], [ 0, %1197 ]
  %1239 = phi i64 [ %1247, %1237 ], [ 0, %1197 ]
  %1240 = zext i32 %1238 to i64
  %1241 = getelementptr inbounds i8, i8 addrspace(4)* %1193, i64 %1240
  %1242 = load i8, i8 addrspace(4)* %1241, align 1, !tbaa !37
  %1243 = zext i8 %1242 to i64
  %1244 = shl i32 %1238, 3
  %1245 = zext i32 %1244 to i64
  %1246 = shl nuw i64 %1243, %1245
  %1247 = or i64 %1246, %1239
  %1248 = add nuw nsw i32 %1238, 1
  %1249 = icmp eq i32 %1248, %1194
  br i1 %1249, label %1250, label %1237

1250:                                             ; preds = %1237, %1199, %1197
  %1251 = phi i64 [ %1236, %1199 ], [ 0, %1197 ], [ %1247, %1237 ]
  %1252 = shl nuw nsw i64 %833, 2
  %1253 = add nuw nsw i64 %1252, 28
  %1254 = and i64 %1253, 480
  %1255 = and i64 %835, -225
  %1256 = or i64 %1255, %1254
  %1257 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef %1256, i64 noundef %895, i64 noundef %955, i64 noundef %1015, i64 noundef %1075, i64 noundef %1135, i64 noundef %1195, i64 noundef %1251) #12
  %1258 = sub i64 %825, %833
  %1259 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 %833
  %1260 = icmp eq i64 %1258, 0
  br i1 %1260, label %1261, label %824

1261:                                             ; preds = %1250, %816
  %1262 = phi <2 x i64> [ %819, %816 ], [ %1257, %1250 ]
  %1263 = extractelement <2 x i64> %1262, i64 0
  %1264 = bitcast double %807 to i64
  %1265 = and i64 %1263, -227
  %1266 = or i64 %1265, 34
  %1267 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef %1266, i64 noundef %1264, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1268 = load float, float addrspace(1)* %4, align 4, !tbaa !7
  %1269 = fpext float %1268 to double
  %1270 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1271 = extractelement <2 x i64> %1270, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %1272, label %1276

1272:                                             ; preds = %1261
  %1273 = and i64 %1271, -225
  %1274 = or i64 %1273, 32
  %1275 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef %1274, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %1717

1276:                                             ; preds = %1261
  %1277 = and i64 %1271, 2
  %1278 = and i64 %1271, -3
  %1279 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1278, i64 0
  br label %1280

1280:                                             ; preds = %1706, %1276
  %1281 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.1, i64 0, i64 12) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([13 x i8]* addrspacecast ([13 x i8] addrspace(4)* @.str.1 to [13 x i8]*) to i64)), i64 1))), %1276 ], [ %1714, %1706 ]
  %1282 = phi i8 addrspace(4)* [ getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %1276 ], [ %1715, %1706 ]
  %1283 = phi <2 x i64> [ %1279, %1276 ], [ %1713, %1706 ]
  %1284 = icmp ugt i64 %1281, 56
  %1285 = extractelement <2 x i64> %1283, i64 0
  %1286 = or i64 %1285, %1277
  %1287 = insertelement <2 x i64> poison, i64 %1286, i64 0
  %1288 = select i1 %1284, <2 x i64> %1283, <2 x i64> %1287
  %1289 = tail call i64 @llvm.umin.i64(i64 %1281, i64 56)
  %1290 = trunc i64 %1289 to i32
  %1291 = extractelement <2 x i64> %1288, i64 0
  %1292 = icmp ugt i32 %1290, 7
  br i1 %1292, label %1295, label %1293

1293:                                             ; preds = %1280
  %1294 = icmp eq i32 %1290, 0
  br i1 %1294, label %1348, label %1335

1295:                                             ; preds = %1280
  %1296 = load i8, i8 addrspace(4)* %1282, align 1, !tbaa !37
  %1297 = zext i8 %1296 to i64
  %1298 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 1
  %1299 = load i8, i8 addrspace(4)* %1298, align 1, !tbaa !37
  %1300 = zext i8 %1299 to i64
  %1301 = shl nuw nsw i64 %1300, 8
  %1302 = or i64 %1301, %1297
  %1303 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 2
  %1304 = load i8, i8 addrspace(4)* %1303, align 1, !tbaa !37
  %1305 = zext i8 %1304 to i64
  %1306 = shl nuw nsw i64 %1305, 16
  %1307 = or i64 %1302, %1306
  %1308 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 3
  %1309 = load i8, i8 addrspace(4)* %1308, align 1, !tbaa !37
  %1310 = zext i8 %1309 to i64
  %1311 = shl nuw nsw i64 %1310, 24
  %1312 = or i64 %1307, %1311
  %1313 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 4
  %1314 = load i8, i8 addrspace(4)* %1313, align 1, !tbaa !37
  %1315 = zext i8 %1314 to i64
  %1316 = shl nuw nsw i64 %1315, 32
  %1317 = or i64 %1312, %1316
  %1318 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 5
  %1319 = load i8, i8 addrspace(4)* %1318, align 1, !tbaa !37
  %1320 = zext i8 %1319 to i64
  %1321 = shl nuw nsw i64 %1320, 40
  %1322 = or i64 %1317, %1321
  %1323 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 6
  %1324 = load i8, i8 addrspace(4)* %1323, align 1, !tbaa !37
  %1325 = zext i8 %1324 to i64
  %1326 = shl nuw nsw i64 %1325, 48
  %1327 = or i64 %1322, %1326
  %1328 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 7
  %1329 = load i8, i8 addrspace(4)* %1328, align 1, !tbaa !37
  %1330 = zext i8 %1329 to i64
  %1331 = shl nuw i64 %1330, 56
  %1332 = or i64 %1327, %1331
  %1333 = add nsw i32 %1290, -8
  %1334 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 8
  br label %1348

1335:                                             ; preds = %1293, %1335
  %1336 = phi i32 [ %1346, %1335 ], [ 0, %1293 ]
  %1337 = phi i64 [ %1345, %1335 ], [ 0, %1293 ]
  %1338 = zext i32 %1336 to i64
  %1339 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 %1338
  %1340 = load i8, i8 addrspace(4)* %1339, align 1, !tbaa !37
  %1341 = zext i8 %1340 to i64
  %1342 = shl i32 %1336, 3
  %1343 = zext i32 %1342 to i64
  %1344 = shl nuw i64 %1341, %1343
  %1345 = or i64 %1344, %1337
  %1346 = add nuw nsw i32 %1336, 1
  %1347 = icmp eq i32 %1346, %1290
  br i1 %1347, label %1348, label %1335, !llvm.loop !38

1348:                                             ; preds = %1335, %1295, %1293
  %1349 = phi i8 addrspace(4)* [ %1334, %1295 ], [ %1282, %1293 ], [ %1282, %1335 ]
  %1350 = phi i32 [ %1333, %1295 ], [ 0, %1293 ], [ 0, %1335 ]
  %1351 = phi i64 [ %1332, %1295 ], [ 0, %1293 ], [ %1345, %1335 ]
  %1352 = icmp ugt i32 %1350, 7
  br i1 %1352, label %1355, label %1353

1353:                                             ; preds = %1348
  %1354 = icmp eq i32 %1350, 0
  br i1 %1354, label %1408, label %1395

1355:                                             ; preds = %1348
  %1356 = load i8, i8 addrspace(4)* %1349, align 1, !tbaa !37
  %1357 = zext i8 %1356 to i64
  %1358 = getelementptr inbounds i8, i8 addrspace(4)* %1349, i64 1
  %1359 = load i8, i8 addrspace(4)* %1358, align 1, !tbaa !37
  %1360 = zext i8 %1359 to i64
  %1361 = shl nuw nsw i64 %1360, 8
  %1362 = or i64 %1361, %1357
  %1363 = getelementptr inbounds i8, i8 addrspace(4)* %1349, i64 2
  %1364 = load i8, i8 addrspace(4)* %1363, align 1, !tbaa !37
  %1365 = zext i8 %1364 to i64
  %1366 = shl nuw nsw i64 %1365, 16
  %1367 = or i64 %1362, %1366
  %1368 = getelementptr inbounds i8, i8 addrspace(4)* %1349, i64 3
  %1369 = load i8, i8 addrspace(4)* %1368, align 1, !tbaa !37
  %1370 = zext i8 %1369 to i64
  %1371 = shl nuw nsw i64 %1370, 24
  %1372 = or i64 %1367, %1371
  %1373 = getelementptr inbounds i8, i8 addrspace(4)* %1349, i64 4
  %1374 = load i8, i8 addrspace(4)* %1373, align 1, !tbaa !37
  %1375 = zext i8 %1374 to i64
  %1376 = shl nuw nsw i64 %1375, 32
  %1377 = or i64 %1372, %1376
  %1378 = getelementptr inbounds i8, i8 addrspace(4)* %1349, i64 5
  %1379 = load i8, i8 addrspace(4)* %1378, align 1, !tbaa !37
  %1380 = zext i8 %1379 to i64
  %1381 = shl nuw nsw i64 %1380, 40
  %1382 = or i64 %1377, %1381
  %1383 = getelementptr inbounds i8, i8 addrspace(4)* %1349, i64 6
  %1384 = load i8, i8 addrspace(4)* %1383, align 1, !tbaa !37
  %1385 = zext i8 %1384 to i64
  %1386 = shl nuw nsw i64 %1385, 48
  %1387 = or i64 %1382, %1386
  %1388 = getelementptr inbounds i8, i8 addrspace(4)* %1349, i64 7
  %1389 = load i8, i8 addrspace(4)* %1388, align 1, !tbaa !37
  %1390 = zext i8 %1389 to i64
  %1391 = shl nuw i64 %1390, 56
  %1392 = or i64 %1387, %1391
  %1393 = add nsw i32 %1350, -8
  %1394 = getelementptr inbounds i8, i8 addrspace(4)* %1349, i64 8
  br label %1408

1395:                                             ; preds = %1353, %1395
  %1396 = phi i32 [ %1406, %1395 ], [ 0, %1353 ]
  %1397 = phi i64 [ %1405, %1395 ], [ 0, %1353 ]
  %1398 = zext i32 %1396 to i64
  %1399 = getelementptr inbounds i8, i8 addrspace(4)* %1349, i64 %1398
  %1400 = load i8, i8 addrspace(4)* %1399, align 1, !tbaa !37
  %1401 = zext i8 %1400 to i64
  %1402 = shl i32 %1396, 3
  %1403 = zext i32 %1402 to i64
  %1404 = shl nuw i64 %1401, %1403
  %1405 = or i64 %1404, %1397
  %1406 = add nuw nsw i32 %1396, 1
  %1407 = icmp eq i32 %1406, %1350
  br i1 %1407, label %1408, label %1395

1408:                                             ; preds = %1395, %1355, %1353
  %1409 = phi i8 addrspace(4)* [ %1394, %1355 ], [ %1349, %1353 ], [ %1349, %1395 ]
  %1410 = phi i32 [ %1393, %1355 ], [ 0, %1353 ], [ 0, %1395 ]
  %1411 = phi i64 [ %1392, %1355 ], [ 0, %1353 ], [ %1405, %1395 ]
  %1412 = icmp ugt i32 %1410, 7
  br i1 %1412, label %1415, label %1413

1413:                                             ; preds = %1408
  %1414 = icmp eq i32 %1410, 0
  br i1 %1414, label %1468, label %1455

1415:                                             ; preds = %1408
  %1416 = load i8, i8 addrspace(4)* %1409, align 1, !tbaa !37
  %1417 = zext i8 %1416 to i64
  %1418 = getelementptr inbounds i8, i8 addrspace(4)* %1409, i64 1
  %1419 = load i8, i8 addrspace(4)* %1418, align 1, !tbaa !37
  %1420 = zext i8 %1419 to i64
  %1421 = shl nuw nsw i64 %1420, 8
  %1422 = or i64 %1421, %1417
  %1423 = getelementptr inbounds i8, i8 addrspace(4)* %1409, i64 2
  %1424 = load i8, i8 addrspace(4)* %1423, align 1, !tbaa !37
  %1425 = zext i8 %1424 to i64
  %1426 = shl nuw nsw i64 %1425, 16
  %1427 = or i64 %1422, %1426
  %1428 = getelementptr inbounds i8, i8 addrspace(4)* %1409, i64 3
  %1429 = load i8, i8 addrspace(4)* %1428, align 1, !tbaa !37
  %1430 = zext i8 %1429 to i64
  %1431 = shl nuw nsw i64 %1430, 24
  %1432 = or i64 %1427, %1431
  %1433 = getelementptr inbounds i8, i8 addrspace(4)* %1409, i64 4
  %1434 = load i8, i8 addrspace(4)* %1433, align 1, !tbaa !37
  %1435 = zext i8 %1434 to i64
  %1436 = shl nuw nsw i64 %1435, 32
  %1437 = or i64 %1432, %1436
  %1438 = getelementptr inbounds i8, i8 addrspace(4)* %1409, i64 5
  %1439 = load i8, i8 addrspace(4)* %1438, align 1, !tbaa !37
  %1440 = zext i8 %1439 to i64
  %1441 = shl nuw nsw i64 %1440, 40
  %1442 = or i64 %1437, %1441
  %1443 = getelementptr inbounds i8, i8 addrspace(4)* %1409, i64 6
  %1444 = load i8, i8 addrspace(4)* %1443, align 1, !tbaa !37
  %1445 = zext i8 %1444 to i64
  %1446 = shl nuw nsw i64 %1445, 48
  %1447 = or i64 %1442, %1446
  %1448 = getelementptr inbounds i8, i8 addrspace(4)* %1409, i64 7
  %1449 = load i8, i8 addrspace(4)* %1448, align 1, !tbaa !37
  %1450 = zext i8 %1449 to i64
  %1451 = shl nuw i64 %1450, 56
  %1452 = or i64 %1447, %1451
  %1453 = add nsw i32 %1410, -8
  %1454 = getelementptr inbounds i8, i8 addrspace(4)* %1409, i64 8
  br label %1468

1455:                                             ; preds = %1413, %1455
  %1456 = phi i32 [ %1466, %1455 ], [ 0, %1413 ]
  %1457 = phi i64 [ %1465, %1455 ], [ 0, %1413 ]
  %1458 = zext i32 %1456 to i64
  %1459 = getelementptr inbounds i8, i8 addrspace(4)* %1409, i64 %1458
  %1460 = load i8, i8 addrspace(4)* %1459, align 1, !tbaa !37
  %1461 = zext i8 %1460 to i64
  %1462 = shl i32 %1456, 3
  %1463 = zext i32 %1462 to i64
  %1464 = shl nuw i64 %1461, %1463
  %1465 = or i64 %1464, %1457
  %1466 = add nuw nsw i32 %1456, 1
  %1467 = icmp eq i32 %1466, %1410
  br i1 %1467, label %1468, label %1455

1468:                                             ; preds = %1455, %1415, %1413
  %1469 = phi i8 addrspace(4)* [ %1454, %1415 ], [ %1409, %1413 ], [ %1409, %1455 ]
  %1470 = phi i32 [ %1453, %1415 ], [ 0, %1413 ], [ 0, %1455 ]
  %1471 = phi i64 [ %1452, %1415 ], [ 0, %1413 ], [ %1465, %1455 ]
  %1472 = icmp ugt i32 %1470, 7
  br i1 %1472, label %1475, label %1473

1473:                                             ; preds = %1468
  %1474 = icmp eq i32 %1470, 0
  br i1 %1474, label %1528, label %1515

1475:                                             ; preds = %1468
  %1476 = load i8, i8 addrspace(4)* %1469, align 1, !tbaa !37
  %1477 = zext i8 %1476 to i64
  %1478 = getelementptr inbounds i8, i8 addrspace(4)* %1469, i64 1
  %1479 = load i8, i8 addrspace(4)* %1478, align 1, !tbaa !37
  %1480 = zext i8 %1479 to i64
  %1481 = shl nuw nsw i64 %1480, 8
  %1482 = or i64 %1481, %1477
  %1483 = getelementptr inbounds i8, i8 addrspace(4)* %1469, i64 2
  %1484 = load i8, i8 addrspace(4)* %1483, align 1, !tbaa !37
  %1485 = zext i8 %1484 to i64
  %1486 = shl nuw nsw i64 %1485, 16
  %1487 = or i64 %1482, %1486
  %1488 = getelementptr inbounds i8, i8 addrspace(4)* %1469, i64 3
  %1489 = load i8, i8 addrspace(4)* %1488, align 1, !tbaa !37
  %1490 = zext i8 %1489 to i64
  %1491 = shl nuw nsw i64 %1490, 24
  %1492 = or i64 %1487, %1491
  %1493 = getelementptr inbounds i8, i8 addrspace(4)* %1469, i64 4
  %1494 = load i8, i8 addrspace(4)* %1493, align 1, !tbaa !37
  %1495 = zext i8 %1494 to i64
  %1496 = shl nuw nsw i64 %1495, 32
  %1497 = or i64 %1492, %1496
  %1498 = getelementptr inbounds i8, i8 addrspace(4)* %1469, i64 5
  %1499 = load i8, i8 addrspace(4)* %1498, align 1, !tbaa !37
  %1500 = zext i8 %1499 to i64
  %1501 = shl nuw nsw i64 %1500, 40
  %1502 = or i64 %1497, %1501
  %1503 = getelementptr inbounds i8, i8 addrspace(4)* %1469, i64 6
  %1504 = load i8, i8 addrspace(4)* %1503, align 1, !tbaa !37
  %1505 = zext i8 %1504 to i64
  %1506 = shl nuw nsw i64 %1505, 48
  %1507 = or i64 %1502, %1506
  %1508 = getelementptr inbounds i8, i8 addrspace(4)* %1469, i64 7
  %1509 = load i8, i8 addrspace(4)* %1508, align 1, !tbaa !37
  %1510 = zext i8 %1509 to i64
  %1511 = shl nuw i64 %1510, 56
  %1512 = or i64 %1507, %1511
  %1513 = add nsw i32 %1470, -8
  %1514 = getelementptr inbounds i8, i8 addrspace(4)* %1469, i64 8
  br label %1528

1515:                                             ; preds = %1473, %1515
  %1516 = phi i32 [ %1526, %1515 ], [ 0, %1473 ]
  %1517 = phi i64 [ %1525, %1515 ], [ 0, %1473 ]
  %1518 = zext i32 %1516 to i64
  %1519 = getelementptr inbounds i8, i8 addrspace(4)* %1469, i64 %1518
  %1520 = load i8, i8 addrspace(4)* %1519, align 1, !tbaa !37
  %1521 = zext i8 %1520 to i64
  %1522 = shl i32 %1516, 3
  %1523 = zext i32 %1522 to i64
  %1524 = shl nuw i64 %1521, %1523
  %1525 = or i64 %1524, %1517
  %1526 = add nuw nsw i32 %1516, 1
  %1527 = icmp eq i32 %1526, %1470
  br i1 %1527, label %1528, label %1515

1528:                                             ; preds = %1515, %1475, %1473
  %1529 = phi i8 addrspace(4)* [ %1514, %1475 ], [ %1469, %1473 ], [ %1469, %1515 ]
  %1530 = phi i32 [ %1513, %1475 ], [ 0, %1473 ], [ 0, %1515 ]
  %1531 = phi i64 [ %1512, %1475 ], [ 0, %1473 ], [ %1525, %1515 ]
  %1532 = icmp ugt i32 %1530, 7
  br i1 %1532, label %1535, label %1533

1533:                                             ; preds = %1528
  %1534 = icmp eq i32 %1530, 0
  br i1 %1534, label %1588, label %1575

1535:                                             ; preds = %1528
  %1536 = load i8, i8 addrspace(4)* %1529, align 1, !tbaa !37
  %1537 = zext i8 %1536 to i64
  %1538 = getelementptr inbounds i8, i8 addrspace(4)* %1529, i64 1
  %1539 = load i8, i8 addrspace(4)* %1538, align 1, !tbaa !37
  %1540 = zext i8 %1539 to i64
  %1541 = shl nuw nsw i64 %1540, 8
  %1542 = or i64 %1541, %1537
  %1543 = getelementptr inbounds i8, i8 addrspace(4)* %1529, i64 2
  %1544 = load i8, i8 addrspace(4)* %1543, align 1, !tbaa !37
  %1545 = zext i8 %1544 to i64
  %1546 = shl nuw nsw i64 %1545, 16
  %1547 = or i64 %1542, %1546
  %1548 = getelementptr inbounds i8, i8 addrspace(4)* %1529, i64 3
  %1549 = load i8, i8 addrspace(4)* %1548, align 1, !tbaa !37
  %1550 = zext i8 %1549 to i64
  %1551 = shl nuw nsw i64 %1550, 24
  %1552 = or i64 %1547, %1551
  %1553 = getelementptr inbounds i8, i8 addrspace(4)* %1529, i64 4
  %1554 = load i8, i8 addrspace(4)* %1553, align 1, !tbaa !37
  %1555 = zext i8 %1554 to i64
  %1556 = shl nuw nsw i64 %1555, 32
  %1557 = or i64 %1552, %1556
  %1558 = getelementptr inbounds i8, i8 addrspace(4)* %1529, i64 5
  %1559 = load i8, i8 addrspace(4)* %1558, align 1, !tbaa !37
  %1560 = zext i8 %1559 to i64
  %1561 = shl nuw nsw i64 %1560, 40
  %1562 = or i64 %1557, %1561
  %1563 = getelementptr inbounds i8, i8 addrspace(4)* %1529, i64 6
  %1564 = load i8, i8 addrspace(4)* %1563, align 1, !tbaa !37
  %1565 = zext i8 %1564 to i64
  %1566 = shl nuw nsw i64 %1565, 48
  %1567 = or i64 %1562, %1566
  %1568 = getelementptr inbounds i8, i8 addrspace(4)* %1529, i64 7
  %1569 = load i8, i8 addrspace(4)* %1568, align 1, !tbaa !37
  %1570 = zext i8 %1569 to i64
  %1571 = shl nuw i64 %1570, 56
  %1572 = or i64 %1567, %1571
  %1573 = add nsw i32 %1530, -8
  %1574 = getelementptr inbounds i8, i8 addrspace(4)* %1529, i64 8
  br label %1588

1575:                                             ; preds = %1533, %1575
  %1576 = phi i32 [ %1586, %1575 ], [ 0, %1533 ]
  %1577 = phi i64 [ %1585, %1575 ], [ 0, %1533 ]
  %1578 = zext i32 %1576 to i64
  %1579 = getelementptr inbounds i8, i8 addrspace(4)* %1529, i64 %1578
  %1580 = load i8, i8 addrspace(4)* %1579, align 1, !tbaa !37
  %1581 = zext i8 %1580 to i64
  %1582 = shl i32 %1576, 3
  %1583 = zext i32 %1582 to i64
  %1584 = shl nuw i64 %1581, %1583
  %1585 = or i64 %1584, %1577
  %1586 = add nuw nsw i32 %1576, 1
  %1587 = icmp eq i32 %1586, %1530
  br i1 %1587, label %1588, label %1575

1588:                                             ; preds = %1575, %1535, %1533
  %1589 = phi i8 addrspace(4)* [ %1574, %1535 ], [ %1529, %1533 ], [ %1529, %1575 ]
  %1590 = phi i32 [ %1573, %1535 ], [ 0, %1533 ], [ 0, %1575 ]
  %1591 = phi i64 [ %1572, %1535 ], [ 0, %1533 ], [ %1585, %1575 ]
  %1592 = icmp ugt i32 %1590, 7
  br i1 %1592, label %1595, label %1593

1593:                                             ; preds = %1588
  %1594 = icmp eq i32 %1590, 0
  br i1 %1594, label %1648, label %1635

1595:                                             ; preds = %1588
  %1596 = load i8, i8 addrspace(4)* %1589, align 1, !tbaa !37
  %1597 = zext i8 %1596 to i64
  %1598 = getelementptr inbounds i8, i8 addrspace(4)* %1589, i64 1
  %1599 = load i8, i8 addrspace(4)* %1598, align 1, !tbaa !37
  %1600 = zext i8 %1599 to i64
  %1601 = shl nuw nsw i64 %1600, 8
  %1602 = or i64 %1601, %1597
  %1603 = getelementptr inbounds i8, i8 addrspace(4)* %1589, i64 2
  %1604 = load i8, i8 addrspace(4)* %1603, align 1, !tbaa !37
  %1605 = zext i8 %1604 to i64
  %1606 = shl nuw nsw i64 %1605, 16
  %1607 = or i64 %1602, %1606
  %1608 = getelementptr inbounds i8, i8 addrspace(4)* %1589, i64 3
  %1609 = load i8, i8 addrspace(4)* %1608, align 1, !tbaa !37
  %1610 = zext i8 %1609 to i64
  %1611 = shl nuw nsw i64 %1610, 24
  %1612 = or i64 %1607, %1611
  %1613 = getelementptr inbounds i8, i8 addrspace(4)* %1589, i64 4
  %1614 = load i8, i8 addrspace(4)* %1613, align 1, !tbaa !37
  %1615 = zext i8 %1614 to i64
  %1616 = shl nuw nsw i64 %1615, 32
  %1617 = or i64 %1612, %1616
  %1618 = getelementptr inbounds i8, i8 addrspace(4)* %1589, i64 5
  %1619 = load i8, i8 addrspace(4)* %1618, align 1, !tbaa !37
  %1620 = zext i8 %1619 to i64
  %1621 = shl nuw nsw i64 %1620, 40
  %1622 = or i64 %1617, %1621
  %1623 = getelementptr inbounds i8, i8 addrspace(4)* %1589, i64 6
  %1624 = load i8, i8 addrspace(4)* %1623, align 1, !tbaa !37
  %1625 = zext i8 %1624 to i64
  %1626 = shl nuw nsw i64 %1625, 48
  %1627 = or i64 %1622, %1626
  %1628 = getelementptr inbounds i8, i8 addrspace(4)* %1589, i64 7
  %1629 = load i8, i8 addrspace(4)* %1628, align 1, !tbaa !37
  %1630 = zext i8 %1629 to i64
  %1631 = shl nuw i64 %1630, 56
  %1632 = or i64 %1627, %1631
  %1633 = add nsw i32 %1590, -8
  %1634 = getelementptr inbounds i8, i8 addrspace(4)* %1589, i64 8
  br label %1648

1635:                                             ; preds = %1593, %1635
  %1636 = phi i32 [ %1646, %1635 ], [ 0, %1593 ]
  %1637 = phi i64 [ %1645, %1635 ], [ 0, %1593 ]
  %1638 = zext i32 %1636 to i64
  %1639 = getelementptr inbounds i8, i8 addrspace(4)* %1589, i64 %1638
  %1640 = load i8, i8 addrspace(4)* %1639, align 1, !tbaa !37
  %1641 = zext i8 %1640 to i64
  %1642 = shl i32 %1636, 3
  %1643 = zext i32 %1642 to i64
  %1644 = shl nuw i64 %1641, %1643
  %1645 = or i64 %1644, %1637
  %1646 = add nuw nsw i32 %1636, 1
  %1647 = icmp eq i32 %1646, %1590
  br i1 %1647, label %1648, label %1635

1648:                                             ; preds = %1635, %1595, %1593
  %1649 = phi i8 addrspace(4)* [ %1634, %1595 ], [ %1589, %1593 ], [ %1589, %1635 ]
  %1650 = phi i32 [ %1633, %1595 ], [ 0, %1593 ], [ 0, %1635 ]
  %1651 = phi i64 [ %1632, %1595 ], [ 0, %1593 ], [ %1645, %1635 ]
  %1652 = icmp ugt i32 %1650, 7
  br i1 %1652, label %1655, label %1653

1653:                                             ; preds = %1648
  %1654 = icmp eq i32 %1650, 0
  br i1 %1654, label %1706, label %1693

1655:                                             ; preds = %1648
  %1656 = load i8, i8 addrspace(4)* %1649, align 1, !tbaa !37
  %1657 = zext i8 %1656 to i64
  %1658 = getelementptr inbounds i8, i8 addrspace(4)* %1649, i64 1
  %1659 = load i8, i8 addrspace(4)* %1658, align 1, !tbaa !37
  %1660 = zext i8 %1659 to i64
  %1661 = shl nuw nsw i64 %1660, 8
  %1662 = or i64 %1661, %1657
  %1663 = getelementptr inbounds i8, i8 addrspace(4)* %1649, i64 2
  %1664 = load i8, i8 addrspace(4)* %1663, align 1, !tbaa !37
  %1665 = zext i8 %1664 to i64
  %1666 = shl nuw nsw i64 %1665, 16
  %1667 = or i64 %1662, %1666
  %1668 = getelementptr inbounds i8, i8 addrspace(4)* %1649, i64 3
  %1669 = load i8, i8 addrspace(4)* %1668, align 1, !tbaa !37
  %1670 = zext i8 %1669 to i64
  %1671 = shl nuw nsw i64 %1670, 24
  %1672 = or i64 %1667, %1671
  %1673 = getelementptr inbounds i8, i8 addrspace(4)* %1649, i64 4
  %1674 = load i8, i8 addrspace(4)* %1673, align 1, !tbaa !37
  %1675 = zext i8 %1674 to i64
  %1676 = shl nuw nsw i64 %1675, 32
  %1677 = or i64 %1672, %1676
  %1678 = getelementptr inbounds i8, i8 addrspace(4)* %1649, i64 5
  %1679 = load i8, i8 addrspace(4)* %1678, align 1, !tbaa !37
  %1680 = zext i8 %1679 to i64
  %1681 = shl nuw nsw i64 %1680, 40
  %1682 = or i64 %1677, %1681
  %1683 = getelementptr inbounds i8, i8 addrspace(4)* %1649, i64 6
  %1684 = load i8, i8 addrspace(4)* %1683, align 1, !tbaa !37
  %1685 = zext i8 %1684 to i64
  %1686 = shl nuw nsw i64 %1685, 48
  %1687 = or i64 %1682, %1686
  %1688 = getelementptr inbounds i8, i8 addrspace(4)* %1649, i64 7
  %1689 = load i8, i8 addrspace(4)* %1688, align 1, !tbaa !37
  %1690 = zext i8 %1689 to i64
  %1691 = shl nuw i64 %1690, 56
  %1692 = or i64 %1687, %1691
  br label %1706

1693:                                             ; preds = %1653, %1693
  %1694 = phi i32 [ %1704, %1693 ], [ 0, %1653 ]
  %1695 = phi i64 [ %1703, %1693 ], [ 0, %1653 ]
  %1696 = zext i32 %1694 to i64
  %1697 = getelementptr inbounds i8, i8 addrspace(4)* %1649, i64 %1696
  %1698 = load i8, i8 addrspace(4)* %1697, align 1, !tbaa !37
  %1699 = zext i8 %1698 to i64
  %1700 = shl i32 %1694, 3
  %1701 = zext i32 %1700 to i64
  %1702 = shl nuw i64 %1699, %1701
  %1703 = or i64 %1702, %1695
  %1704 = add nuw nsw i32 %1694, 1
  %1705 = icmp eq i32 %1704, %1650
  br i1 %1705, label %1706, label %1693

1706:                                             ; preds = %1693, %1655, %1653
  %1707 = phi i64 [ %1692, %1655 ], [ 0, %1653 ], [ %1703, %1693 ]
  %1708 = shl nuw nsw i64 %1289, 2
  %1709 = add nuw nsw i64 %1708, 28
  %1710 = and i64 %1709, 480
  %1711 = and i64 %1291, -225
  %1712 = or i64 %1711, %1710
  %1713 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef %1712, i64 noundef %1351, i64 noundef %1411, i64 noundef %1471, i64 noundef %1531, i64 noundef %1591, i64 noundef %1651, i64 noundef %1707) #12
  %1714 = sub i64 %1281, %1289
  %1715 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 %1289
  %1716 = icmp eq i64 %1714, 0
  br i1 %1716, label %1717, label %1280

1717:                                             ; preds = %1706, %1272
  %1718 = phi <2 x i64> [ %1275, %1272 ], [ %1713, %1706 ]
  %1719 = extractelement <2 x i64> %1718, i64 0
  %1720 = bitcast double %1269 to i64
  %1721 = and i64 %1719, -227
  %1722 = or i64 %1721, 34
  %1723 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef %1722, i64 noundef %1720, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1724 = load float, float addrspace(1)* %7, align 4, !tbaa !7
  %1725 = fpext float %1724 to double
  %1726 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1727 = extractelement <2 x i64> %1726, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %1728, label %1732

1728:                                             ; preds = %1717
  %1729 = and i64 %1727, -225
  %1730 = or i64 %1729, 32
  %1731 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef %1730, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %2173

1732:                                             ; preds = %1717
  %1733 = and i64 %1727, 2
  %1734 = and i64 %1727, -3
  %1735 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1734, i64 0
  br label %1736

1736:                                             ; preds = %2162, %1732
  %1737 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str.2, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str.2 to [24 x i8]*) to i64)), i64 1))), %1732 ], [ %2170, %2162 ]
  %1738 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %1732 ], [ %2171, %2162 ]
  %1739 = phi <2 x i64> [ %1735, %1732 ], [ %2169, %2162 ]
  %1740 = icmp ugt i64 %1737, 56
  %1741 = extractelement <2 x i64> %1739, i64 0
  %1742 = or i64 %1741, %1733
  %1743 = insertelement <2 x i64> poison, i64 %1742, i64 0
  %1744 = select i1 %1740, <2 x i64> %1739, <2 x i64> %1743
  %1745 = tail call i64 @llvm.umin.i64(i64 %1737, i64 56)
  %1746 = trunc i64 %1745 to i32
  %1747 = extractelement <2 x i64> %1744, i64 0
  %1748 = icmp ugt i32 %1746, 7
  br i1 %1748, label %1751, label %1749

1749:                                             ; preds = %1736
  %1750 = icmp eq i32 %1746, 0
  br i1 %1750, label %1804, label %1791

1751:                                             ; preds = %1736
  %1752 = load i8, i8 addrspace(4)* %1738, align 1, !tbaa !37
  %1753 = zext i8 %1752 to i64
  %1754 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 1
  %1755 = load i8, i8 addrspace(4)* %1754, align 1, !tbaa !37
  %1756 = zext i8 %1755 to i64
  %1757 = shl nuw nsw i64 %1756, 8
  %1758 = or i64 %1757, %1753
  %1759 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 2
  %1760 = load i8, i8 addrspace(4)* %1759, align 1, !tbaa !37
  %1761 = zext i8 %1760 to i64
  %1762 = shl nuw nsw i64 %1761, 16
  %1763 = or i64 %1758, %1762
  %1764 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 3
  %1765 = load i8, i8 addrspace(4)* %1764, align 1, !tbaa !37
  %1766 = zext i8 %1765 to i64
  %1767 = shl nuw nsw i64 %1766, 24
  %1768 = or i64 %1763, %1767
  %1769 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 4
  %1770 = load i8, i8 addrspace(4)* %1769, align 1, !tbaa !37
  %1771 = zext i8 %1770 to i64
  %1772 = shl nuw nsw i64 %1771, 32
  %1773 = or i64 %1768, %1772
  %1774 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 5
  %1775 = load i8, i8 addrspace(4)* %1774, align 1, !tbaa !37
  %1776 = zext i8 %1775 to i64
  %1777 = shl nuw nsw i64 %1776, 40
  %1778 = or i64 %1773, %1777
  %1779 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 6
  %1780 = load i8, i8 addrspace(4)* %1779, align 1, !tbaa !37
  %1781 = zext i8 %1780 to i64
  %1782 = shl nuw nsw i64 %1781, 48
  %1783 = or i64 %1778, %1782
  %1784 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 7
  %1785 = load i8, i8 addrspace(4)* %1784, align 1, !tbaa !37
  %1786 = zext i8 %1785 to i64
  %1787 = shl nuw i64 %1786, 56
  %1788 = or i64 %1783, %1787
  %1789 = add nsw i32 %1746, -8
  %1790 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 8
  br label %1804

1791:                                             ; preds = %1749, %1791
  %1792 = phi i32 [ %1802, %1791 ], [ 0, %1749 ]
  %1793 = phi i64 [ %1801, %1791 ], [ 0, %1749 ]
  %1794 = zext i32 %1792 to i64
  %1795 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 %1794
  %1796 = load i8, i8 addrspace(4)* %1795, align 1, !tbaa !37
  %1797 = zext i8 %1796 to i64
  %1798 = shl i32 %1792, 3
  %1799 = zext i32 %1798 to i64
  %1800 = shl nuw i64 %1797, %1799
  %1801 = or i64 %1800, %1793
  %1802 = add nuw nsw i32 %1792, 1
  %1803 = icmp eq i32 %1802, %1746
  br i1 %1803, label %1804, label %1791, !llvm.loop !38

1804:                                             ; preds = %1791, %1751, %1749
  %1805 = phi i8 addrspace(4)* [ %1790, %1751 ], [ %1738, %1749 ], [ %1738, %1791 ]
  %1806 = phi i32 [ %1789, %1751 ], [ 0, %1749 ], [ 0, %1791 ]
  %1807 = phi i64 [ %1788, %1751 ], [ 0, %1749 ], [ %1801, %1791 ]
  %1808 = icmp ugt i32 %1806, 7
  br i1 %1808, label %1811, label %1809

1809:                                             ; preds = %1804
  %1810 = icmp eq i32 %1806, 0
  br i1 %1810, label %1864, label %1851

1811:                                             ; preds = %1804
  %1812 = load i8, i8 addrspace(4)* %1805, align 1, !tbaa !37
  %1813 = zext i8 %1812 to i64
  %1814 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 1
  %1815 = load i8, i8 addrspace(4)* %1814, align 1, !tbaa !37
  %1816 = zext i8 %1815 to i64
  %1817 = shl nuw nsw i64 %1816, 8
  %1818 = or i64 %1817, %1813
  %1819 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 2
  %1820 = load i8, i8 addrspace(4)* %1819, align 1, !tbaa !37
  %1821 = zext i8 %1820 to i64
  %1822 = shl nuw nsw i64 %1821, 16
  %1823 = or i64 %1818, %1822
  %1824 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 3
  %1825 = load i8, i8 addrspace(4)* %1824, align 1, !tbaa !37
  %1826 = zext i8 %1825 to i64
  %1827 = shl nuw nsw i64 %1826, 24
  %1828 = or i64 %1823, %1827
  %1829 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 4
  %1830 = load i8, i8 addrspace(4)* %1829, align 1, !tbaa !37
  %1831 = zext i8 %1830 to i64
  %1832 = shl nuw nsw i64 %1831, 32
  %1833 = or i64 %1828, %1832
  %1834 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 5
  %1835 = load i8, i8 addrspace(4)* %1834, align 1, !tbaa !37
  %1836 = zext i8 %1835 to i64
  %1837 = shl nuw nsw i64 %1836, 40
  %1838 = or i64 %1833, %1837
  %1839 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 6
  %1840 = load i8, i8 addrspace(4)* %1839, align 1, !tbaa !37
  %1841 = zext i8 %1840 to i64
  %1842 = shl nuw nsw i64 %1841, 48
  %1843 = or i64 %1838, %1842
  %1844 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 7
  %1845 = load i8, i8 addrspace(4)* %1844, align 1, !tbaa !37
  %1846 = zext i8 %1845 to i64
  %1847 = shl nuw i64 %1846, 56
  %1848 = or i64 %1843, %1847
  %1849 = add nsw i32 %1806, -8
  %1850 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 8
  br label %1864

1851:                                             ; preds = %1809, %1851
  %1852 = phi i32 [ %1862, %1851 ], [ 0, %1809 ]
  %1853 = phi i64 [ %1861, %1851 ], [ 0, %1809 ]
  %1854 = zext i32 %1852 to i64
  %1855 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 %1854
  %1856 = load i8, i8 addrspace(4)* %1855, align 1, !tbaa !37
  %1857 = zext i8 %1856 to i64
  %1858 = shl i32 %1852, 3
  %1859 = zext i32 %1858 to i64
  %1860 = shl nuw i64 %1857, %1859
  %1861 = or i64 %1860, %1853
  %1862 = add nuw nsw i32 %1852, 1
  %1863 = icmp eq i32 %1862, %1806
  br i1 %1863, label %1864, label %1851

1864:                                             ; preds = %1851, %1811, %1809
  %1865 = phi i8 addrspace(4)* [ %1850, %1811 ], [ %1805, %1809 ], [ %1805, %1851 ]
  %1866 = phi i32 [ %1849, %1811 ], [ 0, %1809 ], [ 0, %1851 ]
  %1867 = phi i64 [ %1848, %1811 ], [ 0, %1809 ], [ %1861, %1851 ]
  %1868 = icmp ugt i32 %1866, 7
  br i1 %1868, label %1871, label %1869

1869:                                             ; preds = %1864
  %1870 = icmp eq i32 %1866, 0
  br i1 %1870, label %1924, label %1911

1871:                                             ; preds = %1864
  %1872 = load i8, i8 addrspace(4)* %1865, align 1, !tbaa !37
  %1873 = zext i8 %1872 to i64
  %1874 = getelementptr inbounds i8, i8 addrspace(4)* %1865, i64 1
  %1875 = load i8, i8 addrspace(4)* %1874, align 1, !tbaa !37
  %1876 = zext i8 %1875 to i64
  %1877 = shl nuw nsw i64 %1876, 8
  %1878 = or i64 %1877, %1873
  %1879 = getelementptr inbounds i8, i8 addrspace(4)* %1865, i64 2
  %1880 = load i8, i8 addrspace(4)* %1879, align 1, !tbaa !37
  %1881 = zext i8 %1880 to i64
  %1882 = shl nuw nsw i64 %1881, 16
  %1883 = or i64 %1878, %1882
  %1884 = getelementptr inbounds i8, i8 addrspace(4)* %1865, i64 3
  %1885 = load i8, i8 addrspace(4)* %1884, align 1, !tbaa !37
  %1886 = zext i8 %1885 to i64
  %1887 = shl nuw nsw i64 %1886, 24
  %1888 = or i64 %1883, %1887
  %1889 = getelementptr inbounds i8, i8 addrspace(4)* %1865, i64 4
  %1890 = load i8, i8 addrspace(4)* %1889, align 1, !tbaa !37
  %1891 = zext i8 %1890 to i64
  %1892 = shl nuw nsw i64 %1891, 32
  %1893 = or i64 %1888, %1892
  %1894 = getelementptr inbounds i8, i8 addrspace(4)* %1865, i64 5
  %1895 = load i8, i8 addrspace(4)* %1894, align 1, !tbaa !37
  %1896 = zext i8 %1895 to i64
  %1897 = shl nuw nsw i64 %1896, 40
  %1898 = or i64 %1893, %1897
  %1899 = getelementptr inbounds i8, i8 addrspace(4)* %1865, i64 6
  %1900 = load i8, i8 addrspace(4)* %1899, align 1, !tbaa !37
  %1901 = zext i8 %1900 to i64
  %1902 = shl nuw nsw i64 %1901, 48
  %1903 = or i64 %1898, %1902
  %1904 = getelementptr inbounds i8, i8 addrspace(4)* %1865, i64 7
  %1905 = load i8, i8 addrspace(4)* %1904, align 1, !tbaa !37
  %1906 = zext i8 %1905 to i64
  %1907 = shl nuw i64 %1906, 56
  %1908 = or i64 %1903, %1907
  %1909 = add nsw i32 %1866, -8
  %1910 = getelementptr inbounds i8, i8 addrspace(4)* %1865, i64 8
  br label %1924

1911:                                             ; preds = %1869, %1911
  %1912 = phi i32 [ %1922, %1911 ], [ 0, %1869 ]
  %1913 = phi i64 [ %1921, %1911 ], [ 0, %1869 ]
  %1914 = zext i32 %1912 to i64
  %1915 = getelementptr inbounds i8, i8 addrspace(4)* %1865, i64 %1914
  %1916 = load i8, i8 addrspace(4)* %1915, align 1, !tbaa !37
  %1917 = zext i8 %1916 to i64
  %1918 = shl i32 %1912, 3
  %1919 = zext i32 %1918 to i64
  %1920 = shl nuw i64 %1917, %1919
  %1921 = or i64 %1920, %1913
  %1922 = add nuw nsw i32 %1912, 1
  %1923 = icmp eq i32 %1922, %1866
  br i1 %1923, label %1924, label %1911

1924:                                             ; preds = %1911, %1871, %1869
  %1925 = phi i8 addrspace(4)* [ %1910, %1871 ], [ %1865, %1869 ], [ %1865, %1911 ]
  %1926 = phi i32 [ %1909, %1871 ], [ 0, %1869 ], [ 0, %1911 ]
  %1927 = phi i64 [ %1908, %1871 ], [ 0, %1869 ], [ %1921, %1911 ]
  %1928 = icmp ugt i32 %1926, 7
  br i1 %1928, label %1931, label %1929

1929:                                             ; preds = %1924
  %1930 = icmp eq i32 %1926, 0
  br i1 %1930, label %1984, label %1971

1931:                                             ; preds = %1924
  %1932 = load i8, i8 addrspace(4)* %1925, align 1, !tbaa !37
  %1933 = zext i8 %1932 to i64
  %1934 = getelementptr inbounds i8, i8 addrspace(4)* %1925, i64 1
  %1935 = load i8, i8 addrspace(4)* %1934, align 1, !tbaa !37
  %1936 = zext i8 %1935 to i64
  %1937 = shl nuw nsw i64 %1936, 8
  %1938 = or i64 %1937, %1933
  %1939 = getelementptr inbounds i8, i8 addrspace(4)* %1925, i64 2
  %1940 = load i8, i8 addrspace(4)* %1939, align 1, !tbaa !37
  %1941 = zext i8 %1940 to i64
  %1942 = shl nuw nsw i64 %1941, 16
  %1943 = or i64 %1938, %1942
  %1944 = getelementptr inbounds i8, i8 addrspace(4)* %1925, i64 3
  %1945 = load i8, i8 addrspace(4)* %1944, align 1, !tbaa !37
  %1946 = zext i8 %1945 to i64
  %1947 = shl nuw nsw i64 %1946, 24
  %1948 = or i64 %1943, %1947
  %1949 = getelementptr inbounds i8, i8 addrspace(4)* %1925, i64 4
  %1950 = load i8, i8 addrspace(4)* %1949, align 1, !tbaa !37
  %1951 = zext i8 %1950 to i64
  %1952 = shl nuw nsw i64 %1951, 32
  %1953 = or i64 %1948, %1952
  %1954 = getelementptr inbounds i8, i8 addrspace(4)* %1925, i64 5
  %1955 = load i8, i8 addrspace(4)* %1954, align 1, !tbaa !37
  %1956 = zext i8 %1955 to i64
  %1957 = shl nuw nsw i64 %1956, 40
  %1958 = or i64 %1953, %1957
  %1959 = getelementptr inbounds i8, i8 addrspace(4)* %1925, i64 6
  %1960 = load i8, i8 addrspace(4)* %1959, align 1, !tbaa !37
  %1961 = zext i8 %1960 to i64
  %1962 = shl nuw nsw i64 %1961, 48
  %1963 = or i64 %1958, %1962
  %1964 = getelementptr inbounds i8, i8 addrspace(4)* %1925, i64 7
  %1965 = load i8, i8 addrspace(4)* %1964, align 1, !tbaa !37
  %1966 = zext i8 %1965 to i64
  %1967 = shl nuw i64 %1966, 56
  %1968 = or i64 %1963, %1967
  %1969 = add nsw i32 %1926, -8
  %1970 = getelementptr inbounds i8, i8 addrspace(4)* %1925, i64 8
  br label %1984

1971:                                             ; preds = %1929, %1971
  %1972 = phi i32 [ %1982, %1971 ], [ 0, %1929 ]
  %1973 = phi i64 [ %1981, %1971 ], [ 0, %1929 ]
  %1974 = zext i32 %1972 to i64
  %1975 = getelementptr inbounds i8, i8 addrspace(4)* %1925, i64 %1974
  %1976 = load i8, i8 addrspace(4)* %1975, align 1, !tbaa !37
  %1977 = zext i8 %1976 to i64
  %1978 = shl i32 %1972, 3
  %1979 = zext i32 %1978 to i64
  %1980 = shl nuw i64 %1977, %1979
  %1981 = or i64 %1980, %1973
  %1982 = add nuw nsw i32 %1972, 1
  %1983 = icmp eq i32 %1982, %1926
  br i1 %1983, label %1984, label %1971

1984:                                             ; preds = %1971, %1931, %1929
  %1985 = phi i8 addrspace(4)* [ %1970, %1931 ], [ %1925, %1929 ], [ %1925, %1971 ]
  %1986 = phi i32 [ %1969, %1931 ], [ 0, %1929 ], [ 0, %1971 ]
  %1987 = phi i64 [ %1968, %1931 ], [ 0, %1929 ], [ %1981, %1971 ]
  %1988 = icmp ugt i32 %1986, 7
  br i1 %1988, label %1991, label %1989

1989:                                             ; preds = %1984
  %1990 = icmp eq i32 %1986, 0
  br i1 %1990, label %2044, label %2031

1991:                                             ; preds = %1984
  %1992 = load i8, i8 addrspace(4)* %1985, align 1, !tbaa !37
  %1993 = zext i8 %1992 to i64
  %1994 = getelementptr inbounds i8, i8 addrspace(4)* %1985, i64 1
  %1995 = load i8, i8 addrspace(4)* %1994, align 1, !tbaa !37
  %1996 = zext i8 %1995 to i64
  %1997 = shl nuw nsw i64 %1996, 8
  %1998 = or i64 %1997, %1993
  %1999 = getelementptr inbounds i8, i8 addrspace(4)* %1985, i64 2
  %2000 = load i8, i8 addrspace(4)* %1999, align 1, !tbaa !37
  %2001 = zext i8 %2000 to i64
  %2002 = shl nuw nsw i64 %2001, 16
  %2003 = or i64 %1998, %2002
  %2004 = getelementptr inbounds i8, i8 addrspace(4)* %1985, i64 3
  %2005 = load i8, i8 addrspace(4)* %2004, align 1, !tbaa !37
  %2006 = zext i8 %2005 to i64
  %2007 = shl nuw nsw i64 %2006, 24
  %2008 = or i64 %2003, %2007
  %2009 = getelementptr inbounds i8, i8 addrspace(4)* %1985, i64 4
  %2010 = load i8, i8 addrspace(4)* %2009, align 1, !tbaa !37
  %2011 = zext i8 %2010 to i64
  %2012 = shl nuw nsw i64 %2011, 32
  %2013 = or i64 %2008, %2012
  %2014 = getelementptr inbounds i8, i8 addrspace(4)* %1985, i64 5
  %2015 = load i8, i8 addrspace(4)* %2014, align 1, !tbaa !37
  %2016 = zext i8 %2015 to i64
  %2017 = shl nuw nsw i64 %2016, 40
  %2018 = or i64 %2013, %2017
  %2019 = getelementptr inbounds i8, i8 addrspace(4)* %1985, i64 6
  %2020 = load i8, i8 addrspace(4)* %2019, align 1, !tbaa !37
  %2021 = zext i8 %2020 to i64
  %2022 = shl nuw nsw i64 %2021, 48
  %2023 = or i64 %2018, %2022
  %2024 = getelementptr inbounds i8, i8 addrspace(4)* %1985, i64 7
  %2025 = load i8, i8 addrspace(4)* %2024, align 1, !tbaa !37
  %2026 = zext i8 %2025 to i64
  %2027 = shl nuw i64 %2026, 56
  %2028 = or i64 %2023, %2027
  %2029 = add nsw i32 %1986, -8
  %2030 = getelementptr inbounds i8, i8 addrspace(4)* %1985, i64 8
  br label %2044

2031:                                             ; preds = %1989, %2031
  %2032 = phi i32 [ %2042, %2031 ], [ 0, %1989 ]
  %2033 = phi i64 [ %2041, %2031 ], [ 0, %1989 ]
  %2034 = zext i32 %2032 to i64
  %2035 = getelementptr inbounds i8, i8 addrspace(4)* %1985, i64 %2034
  %2036 = load i8, i8 addrspace(4)* %2035, align 1, !tbaa !37
  %2037 = zext i8 %2036 to i64
  %2038 = shl i32 %2032, 3
  %2039 = zext i32 %2038 to i64
  %2040 = shl nuw i64 %2037, %2039
  %2041 = or i64 %2040, %2033
  %2042 = add nuw nsw i32 %2032, 1
  %2043 = icmp eq i32 %2042, %1986
  br i1 %2043, label %2044, label %2031

2044:                                             ; preds = %2031, %1991, %1989
  %2045 = phi i8 addrspace(4)* [ %2030, %1991 ], [ %1985, %1989 ], [ %1985, %2031 ]
  %2046 = phi i32 [ %2029, %1991 ], [ 0, %1989 ], [ 0, %2031 ]
  %2047 = phi i64 [ %2028, %1991 ], [ 0, %1989 ], [ %2041, %2031 ]
  %2048 = icmp ugt i32 %2046, 7
  br i1 %2048, label %2051, label %2049

2049:                                             ; preds = %2044
  %2050 = icmp eq i32 %2046, 0
  br i1 %2050, label %2104, label %2091

2051:                                             ; preds = %2044
  %2052 = load i8, i8 addrspace(4)* %2045, align 1, !tbaa !37
  %2053 = zext i8 %2052 to i64
  %2054 = getelementptr inbounds i8, i8 addrspace(4)* %2045, i64 1
  %2055 = load i8, i8 addrspace(4)* %2054, align 1, !tbaa !37
  %2056 = zext i8 %2055 to i64
  %2057 = shl nuw nsw i64 %2056, 8
  %2058 = or i64 %2057, %2053
  %2059 = getelementptr inbounds i8, i8 addrspace(4)* %2045, i64 2
  %2060 = load i8, i8 addrspace(4)* %2059, align 1, !tbaa !37
  %2061 = zext i8 %2060 to i64
  %2062 = shl nuw nsw i64 %2061, 16
  %2063 = or i64 %2058, %2062
  %2064 = getelementptr inbounds i8, i8 addrspace(4)* %2045, i64 3
  %2065 = load i8, i8 addrspace(4)* %2064, align 1, !tbaa !37
  %2066 = zext i8 %2065 to i64
  %2067 = shl nuw nsw i64 %2066, 24
  %2068 = or i64 %2063, %2067
  %2069 = getelementptr inbounds i8, i8 addrspace(4)* %2045, i64 4
  %2070 = load i8, i8 addrspace(4)* %2069, align 1, !tbaa !37
  %2071 = zext i8 %2070 to i64
  %2072 = shl nuw nsw i64 %2071, 32
  %2073 = or i64 %2068, %2072
  %2074 = getelementptr inbounds i8, i8 addrspace(4)* %2045, i64 5
  %2075 = load i8, i8 addrspace(4)* %2074, align 1, !tbaa !37
  %2076 = zext i8 %2075 to i64
  %2077 = shl nuw nsw i64 %2076, 40
  %2078 = or i64 %2073, %2077
  %2079 = getelementptr inbounds i8, i8 addrspace(4)* %2045, i64 6
  %2080 = load i8, i8 addrspace(4)* %2079, align 1, !tbaa !37
  %2081 = zext i8 %2080 to i64
  %2082 = shl nuw nsw i64 %2081, 48
  %2083 = or i64 %2078, %2082
  %2084 = getelementptr inbounds i8, i8 addrspace(4)* %2045, i64 7
  %2085 = load i8, i8 addrspace(4)* %2084, align 1, !tbaa !37
  %2086 = zext i8 %2085 to i64
  %2087 = shl nuw i64 %2086, 56
  %2088 = or i64 %2083, %2087
  %2089 = add nsw i32 %2046, -8
  %2090 = getelementptr inbounds i8, i8 addrspace(4)* %2045, i64 8
  br label %2104

2091:                                             ; preds = %2049, %2091
  %2092 = phi i32 [ %2102, %2091 ], [ 0, %2049 ]
  %2093 = phi i64 [ %2101, %2091 ], [ 0, %2049 ]
  %2094 = zext i32 %2092 to i64
  %2095 = getelementptr inbounds i8, i8 addrspace(4)* %2045, i64 %2094
  %2096 = load i8, i8 addrspace(4)* %2095, align 1, !tbaa !37
  %2097 = zext i8 %2096 to i64
  %2098 = shl i32 %2092, 3
  %2099 = zext i32 %2098 to i64
  %2100 = shl nuw i64 %2097, %2099
  %2101 = or i64 %2100, %2093
  %2102 = add nuw nsw i32 %2092, 1
  %2103 = icmp eq i32 %2102, %2046
  br i1 %2103, label %2104, label %2091

2104:                                             ; preds = %2091, %2051, %2049
  %2105 = phi i8 addrspace(4)* [ %2090, %2051 ], [ %2045, %2049 ], [ %2045, %2091 ]
  %2106 = phi i32 [ %2089, %2051 ], [ 0, %2049 ], [ 0, %2091 ]
  %2107 = phi i64 [ %2088, %2051 ], [ 0, %2049 ], [ %2101, %2091 ]
  %2108 = icmp ugt i32 %2106, 7
  br i1 %2108, label %2111, label %2109

2109:                                             ; preds = %2104
  %2110 = icmp eq i32 %2106, 0
  br i1 %2110, label %2162, label %2149

2111:                                             ; preds = %2104
  %2112 = load i8, i8 addrspace(4)* %2105, align 1, !tbaa !37
  %2113 = zext i8 %2112 to i64
  %2114 = getelementptr inbounds i8, i8 addrspace(4)* %2105, i64 1
  %2115 = load i8, i8 addrspace(4)* %2114, align 1, !tbaa !37
  %2116 = zext i8 %2115 to i64
  %2117 = shl nuw nsw i64 %2116, 8
  %2118 = or i64 %2117, %2113
  %2119 = getelementptr inbounds i8, i8 addrspace(4)* %2105, i64 2
  %2120 = load i8, i8 addrspace(4)* %2119, align 1, !tbaa !37
  %2121 = zext i8 %2120 to i64
  %2122 = shl nuw nsw i64 %2121, 16
  %2123 = or i64 %2118, %2122
  %2124 = getelementptr inbounds i8, i8 addrspace(4)* %2105, i64 3
  %2125 = load i8, i8 addrspace(4)* %2124, align 1, !tbaa !37
  %2126 = zext i8 %2125 to i64
  %2127 = shl nuw nsw i64 %2126, 24
  %2128 = or i64 %2123, %2127
  %2129 = getelementptr inbounds i8, i8 addrspace(4)* %2105, i64 4
  %2130 = load i8, i8 addrspace(4)* %2129, align 1, !tbaa !37
  %2131 = zext i8 %2130 to i64
  %2132 = shl nuw nsw i64 %2131, 32
  %2133 = or i64 %2128, %2132
  %2134 = getelementptr inbounds i8, i8 addrspace(4)* %2105, i64 5
  %2135 = load i8, i8 addrspace(4)* %2134, align 1, !tbaa !37
  %2136 = zext i8 %2135 to i64
  %2137 = shl nuw nsw i64 %2136, 40
  %2138 = or i64 %2133, %2137
  %2139 = getelementptr inbounds i8, i8 addrspace(4)* %2105, i64 6
  %2140 = load i8, i8 addrspace(4)* %2139, align 1, !tbaa !37
  %2141 = zext i8 %2140 to i64
  %2142 = shl nuw nsw i64 %2141, 48
  %2143 = or i64 %2138, %2142
  %2144 = getelementptr inbounds i8, i8 addrspace(4)* %2105, i64 7
  %2145 = load i8, i8 addrspace(4)* %2144, align 1, !tbaa !37
  %2146 = zext i8 %2145 to i64
  %2147 = shl nuw i64 %2146, 56
  %2148 = or i64 %2143, %2147
  br label %2162

2149:                                             ; preds = %2109, %2149
  %2150 = phi i32 [ %2160, %2149 ], [ 0, %2109 ]
  %2151 = phi i64 [ %2159, %2149 ], [ 0, %2109 ]
  %2152 = zext i32 %2150 to i64
  %2153 = getelementptr inbounds i8, i8 addrspace(4)* %2105, i64 %2152
  %2154 = load i8, i8 addrspace(4)* %2153, align 1, !tbaa !37
  %2155 = zext i8 %2154 to i64
  %2156 = shl i32 %2150, 3
  %2157 = zext i32 %2156 to i64
  %2158 = shl nuw i64 %2155, %2157
  %2159 = or i64 %2158, %2151
  %2160 = add nuw nsw i32 %2150, 1
  %2161 = icmp eq i32 %2160, %2106
  br i1 %2161, label %2162, label %2149

2162:                                             ; preds = %2149, %2111, %2109
  %2163 = phi i64 [ %2148, %2111 ], [ 0, %2109 ], [ %2159, %2149 ]
  %2164 = shl nuw nsw i64 %1745, 2
  %2165 = add nuw nsw i64 %2164, 28
  %2166 = and i64 %2165, 480
  %2167 = and i64 %1747, -225
  %2168 = or i64 %2167, %2166
  %2169 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef %2168, i64 noundef %1807, i64 noundef %1867, i64 noundef %1927, i64 noundef %1987, i64 noundef %2047, i64 noundef %2107, i64 noundef %2163) #12
  %2170 = sub i64 %1737, %1745
  %2171 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 %1745
  %2172 = icmp eq i64 %2170, 0
  br i1 %2172, label %2173, label %1736

2173:                                             ; preds = %2162, %1728
  %2174 = phi <2 x i64> [ %1731, %1728 ], [ %2169, %2162 ]
  %2175 = extractelement <2 x i64> %2174, i64 0
  %2176 = bitcast double %1725 to i64
  %2177 = and i64 %2175, -227
  %2178 = or i64 %2177, 34
  %2179 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %813, i64 noundef %2178, i64 noundef %2176, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %2180

2180:                                             ; preds = %2173, %780
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #4

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #5 {
  %10 = alloca i8*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %25 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !39
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !41
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !33
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !33
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !33
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !33
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !33
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !33
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !33
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !33
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #8
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !41
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !41
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #12, !srcloc !43
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !41
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #8
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !41
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !41
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #8
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !39
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !39
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #8
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !39
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !41
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !41
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !44
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !47
  %50 = and i64 %49, %45
  %51 = getelementptr inbounds %1, %1 addrspace(1)* %48, i64 %50, i32 0
  %52 = load atomic i64, i64 addrspace(1)* %51 syncscope("one-as") monotonic, align 8
  %53 = cmpxchg i64 addrspace(1)* %44, i64 %45, i64 %52 syncscope("one-as") acquire monotonic, align 8
  %54 = extractvalue { i64, i1 } %53, 1
  br i1 %54, label %65, label %55

55:                                               ; preds = %55, %43
  %56 = phi { i64, i1 } [ %63, %55 ], [ %53, %43 ]
  %57 = extractvalue { i64, i1 } %56, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !44
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !47
  %60 = and i64 %59, %57
  %61 = getelementptr inbounds %1, %1 addrspace(1)* %58, i64 %60, i32 0
  %62 = load atomic i64, i64 addrspace(1)* %61 syncscope("one-as") monotonic, align 8
  %63 = cmpxchg i64 addrspace(1)* %44, i64 %57, i64 %62 syncscope("one-as") acquire monotonic, align 8
  %64 = extractvalue { i64, i1 } %63, 1
  br i1 %64, label %65, label %55

65:                                               ; preds = %55, %43
  %66 = phi { i64, i1 } [ %53, %43 ], [ %63, %55 ]
  %67 = extractvalue { i64, i1 } %66, 0
  br label %68

68:                                               ; preds = %9, %65
  %69 = phi i64 [ %67, %65 ], [ 0, %9 ]
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = call i32 @llvm.amdgcn.readfirstlane(i32 %70)
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %72)
  %75 = zext i32 %74 to i64
  %76 = shl nuw i64 %75, 32
  %77 = zext i32 %73 to i64
  %78 = or i64 %76, %77
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !33
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #8
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !39
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !33
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !44
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !47
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !39
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #8
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !39
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !33
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !48
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !47
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !39
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !39
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !39
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !41
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !33
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !33
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !33
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !33
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !33
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !33
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !33
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !33
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !41
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !41
  %110 = call i64 @llvm.read_register.i64(metadata !49) #13
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !50
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !52
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !53
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !33
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !33
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !33
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !33
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !33
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !33
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !33
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !33
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !39
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !33
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !41
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !41
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !44
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !47
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !54
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !54
  %145 = cmpxchg i64 addrspace(1)* %132, i64 %144, i64 %127 syncscope("one-as") release monotonic, align 8
  %146 = extractvalue { i64, i1 } %145, 1
  br i1 %146, label %147, label %142

147:                                              ; preds = %142, %131
  %148 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 2, i32 0
  %149 = load i64, i64 addrspace(1)* %148, align 8
  %150 = inttoptr i64 %149 to %4 addrspace(1)*
  %151 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 1, i32 0
  %152 = atomicrmw add i64 addrspace(1)* %151, i64 1 syncscope("one-as") release, align 8
  %153 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 2
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !55
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !57
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #8
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !39
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !39
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !41
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !41
  %169 = icmp eq i32 %167, %168
  %170 = getelementptr inbounds %1, %1 addrspace(1)* %165, i64 0, i32 3
  br label %171

171:                                              ; preds = %179, %163
  br i1 %169, label %172, label %175

172:                                              ; preds = %171
  %173 = load atomic i32, i32 addrspace(1)* %170 syncscope("one-as") acquire, align 4
  %174 = and i32 %173, 1
  br label %175

175:                                              ; preds = %172, %171
  %176 = phi i32 [ %174, %172 ], [ 1, %171 ]
  %177 = call i32 @llvm.amdgcn.readfirstlane(i32 %176)
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %180, label %179

179:                                              ; preds = %175
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %171

180:                                              ; preds = %175
  %181 = zext i32 %167 to i64
  %182 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 0
  %183 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 1
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !33
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !33
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !37
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !39
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !33
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !41
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !41
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !47
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !44
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !54
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !54
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !37
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #8
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #8
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #8
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #8
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #8
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #8
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #8
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #6

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #7

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #8

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #10

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #11

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #6 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #7 = { mustprogress nounwind willreturn }
attributes #8 = { nounwind }
attributes #9 = { nofree nounwind readonly }
attributes #10 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #11 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #12 = { convergent nounwind }
attributes #13 = { convergent }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !12}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !9, i64 0}
!23 = distinct !{!23, !12}
!24 = distinct !{!24, !14}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !14}
!27 = distinct !{!27, !14}
!28 = distinct !{!28, !12}
!29 = distinct !{!29, !12}
!30 = distinct !{!30, !14}
!31 = distinct !{!31, !14}
!32 = distinct !{!32, !14}
!33 = !{!34, !34, i64 0}
!34 = !{!"long", !35, i64 0}
!35 = !{!"omnipotent char", !36, i64 0}
!36 = !{!"Simple C/C++ TBAA"}
!37 = !{!35, !35, i64 0}
!38 = distinct !{!38, !12}
!39 = !{!40, !40, i64 0}
!40 = !{!"any pointer", !35, i64 0}
!41 = !{!42, !42, i64 0}
!42 = !{!"int", !35, i64 0}
!43 = !{i64 2662}
!44 = !{!45, !40, i64 0}
!45 = !{!"", !40, i64 0, !40, i64 8, !46, i64 16, !34, i64 24, !34, i64 32, !34, i64 40}
!46 = !{!"hsa_signal_s", !34, i64 0}
!47 = !{!45, !34, i64 40}
!48 = !{!45, !40, i64 8}
!49 = !{!"exec"}
!50 = !{!51, !42, i64 16}
!51 = !{!"", !34, i64 0, !34, i64 8, !42, i64 16, !42, i64 20}
!52 = !{!51, !34, i64 8}
!53 = !{!51, !42, i64 20}
!54 = !{!51, !34, i64 0}
!55 = !{!56, !34, i64 16}
!56 = !{!"amd_signal_s", !34, i64 0, !35, i64 8, !34, i64 16, !42, i64 24, !42, i64 28, !34, i64 32, !34, i64 40, !35, i64 48, !35, i64 56}
!57 = !{!56, !42, i64 24}
