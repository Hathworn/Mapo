; ModuleID = '../data/hip_kernels/10483/12/main.cu'
source_filename = "../data/hip_kernels/10483/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9mteKerneliiifPfS_S_S_S_S_S_S_PiS0_S_S_(i32 %0, i32 %1, i32 %2, float %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, i32 addrspace(1)* nocapture readonly %12, i32 addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture %14, float addrspace(1)* nocapture %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %17, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %0
  br i1 %26, label %27, label %690

27:                                               ; preds = %16
  %28 = icmp sgt i32 %2, 0
  br i1 %28, label %29, label %51

29:                                               ; preds = %27
  %30 = shl nuw i32 %2, 1
  %31 = mul i32 %30, %25
  %32 = and i32 %2, 7
  %33 = icmp ult i32 %2, 8
  br i1 %33, label %36, label %34

34:                                               ; preds = %29
  %35 = and i32 %2, -8
  br label %74

36:                                               ; preds = %74, %29
  %37 = phi i32 [ 0, %29 ], [ %132, %74 ]
  %38 = icmp eq i32 %32, 0
  br i1 %38, label %51, label %39

39:                                               ; preds = %36, %39
  %40 = phi i32 [ %48, %39 ], [ %37, %36 ]
  %41 = phi i32 [ %49, %39 ], [ 0, %36 ]
  %42 = zext i32 %40 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %9, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = add nsw i32 %40, %31
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %14, i64 %46
  store float %44, float addrspace(1)* %47, align 4, !tbaa !7
  %48 = add nuw nsw i32 %40, 1
  %49 = add i32 %41, 1
  %50 = icmp eq i32 %49, %32
  br i1 %50, label %51, label %39, !llvm.loop !11

51:                                               ; preds = %36, %39, %27
  %52 = icmp sgt i32 %1, 0
  br i1 %52, label %53, label %139

53:                                               ; preds = %51
  %54 = load float, float addrspace(1)* %8, align 4, !tbaa !7
  %55 = shl nsw i32 %25, 1
  %56 = add nuw nsw i32 %55, 1
  %57 = mul nsw i32 %56, %2
  %58 = mul nsw i32 %55, %2
  %59 = mul i32 %25, %1
  %60 = getelementptr inbounds float, float addrspace(1)* %8, i64 6
  %61 = getelementptr inbounds float, float addrspace(1)* %8, i64 1
  %62 = getelementptr inbounds float, float addrspace(1)* %8, i64 4
  %63 = getelementptr inbounds float, float addrspace(1)* %8, i64 2
  %64 = getelementptr inbounds float, float addrspace(1)* %8, i64 5
  %65 = getelementptr inbounds float, float addrspace(1)* %8, i64 7
  %66 = and i32 %2, 7
  %67 = icmp ult i32 %2, 8
  %68 = and i32 %2, -8
  %69 = icmp eq i32 %66, 0
  %70 = and i32 %2, 1
  %71 = icmp eq i32 %2, 1
  %72 = and i32 %2, -2
  %73 = icmp eq i32 %70, 0
  br label %135

74:                                               ; preds = %74, %34
  %75 = phi i32 [ 0, %34 ], [ %132, %74 ]
  %76 = phi i32 [ 0, %34 ], [ %133, %74 ]
  %77 = zext i32 %75 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %9, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = add nsw i32 %75, %31
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %14, i64 %81
  store float %79, float addrspace(1)* %82, align 4, !tbaa !7
  %83 = or i32 %75, 1
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %9, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = add nsw i32 %83, %31
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %14, i64 %88
  store float %86, float addrspace(1)* %89, align 4, !tbaa !7
  %90 = or i32 %75, 2
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %9, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7
  %94 = add nsw i32 %90, %31
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %14, i64 %95
  store float %93, float addrspace(1)* %96, align 4, !tbaa !7
  %97 = or i32 %75, 3
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %9, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = add nsw i32 %97, %31
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %14, i64 %102
  store float %100, float addrspace(1)* %103, align 4, !tbaa !7
  %104 = or i32 %75, 4
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %9, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = add nsw i32 %104, %31
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %14, i64 %109
  store float %107, float addrspace(1)* %110, align 4, !tbaa !7
  %111 = or i32 %75, 5
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %9, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = add nsw i32 %111, %31
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %14, i64 %116
  store float %114, float addrspace(1)* %117, align 4, !tbaa !7
  %118 = or i32 %75, 6
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %9, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = add nsw i32 %118, %31
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %14, i64 %123
  store float %121, float addrspace(1)* %124, align 4, !tbaa !7
  %125 = or i32 %75, 7
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %9, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = add nsw i32 %125, %31
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %14, i64 %130
  store float %128, float addrspace(1)* %131, align 4, !tbaa !7
  %132 = add nuw nsw i32 %75, 8
  %133 = add i32 %76, 8
  %134 = icmp eq i32 %133, %35
  br i1 %134, label %36, label %74, !llvm.loop !13

135:                                              ; preds = %53, %564
  %136 = phi float [ %54, %53 ], [ %431, %564 ]
  %137 = phi i32 [ 0, %53 ], [ %565, %564 ]
  br i1 %28, label %138, label %236

138:                                              ; preds = %135
  br i1 %67, label %150, label %162

139:                                              ; preds = %564, %51
  %140 = sext i32 %25 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %15, i64 %140
  store float 0.000000e+00, float addrspace(1)* %141, align 4, !tbaa !7
  br i1 %28, label %142, label %690

142:                                              ; preds = %139
  %143 = shl nsw i32 %25, 1
  %144 = add nuw nsw i32 %143, 1
  %145 = mul nsw i32 %144, %2
  %146 = and i32 %2, 7
  %147 = icmp ult i32 %2, 8
  br i1 %147, label %674, label %148

148:                                              ; preds = %142
  %149 = and i32 %2, -8
  br label %620

150:                                              ; preds = %162, %138
  %151 = phi i32 [ 0, %138 ], [ %196, %162 ]
  br i1 %69, label %161, label %152

152:                                              ; preds = %150, %152
  %153 = phi i32 [ %158, %152 ], [ %151, %150 ]
  %154 = phi i32 [ %159, %152 ], [ 0, %150 ]
  %155 = add nsw i32 %153, %57
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %14, i64 %156
  store float 0.000000e+00, float addrspace(1)* %157, align 4, !tbaa !7
  %158 = add nuw nsw i32 %153, 1
  %159 = add i32 %154, 1
  %160 = icmp eq i32 %159, %66
  br i1 %160, label %161, label %152, !llvm.loop !15

161:                                              ; preds = %152, %150
  br i1 %28, label %199, label %236

162:                                              ; preds = %138, %162
  %163 = phi i32 [ %196, %162 ], [ 0, %138 ]
  %164 = phi i32 [ %197, %162 ], [ 0, %138 ]
  %165 = add nsw i32 %163, %57
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %14, i64 %166
  store float 0.000000e+00, float addrspace(1)* %167, align 4, !tbaa !7
  %168 = or i32 %163, 1
  %169 = add nsw i32 %168, %57
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %14, i64 %170
  store float 0.000000e+00, float addrspace(1)* %171, align 4, !tbaa !7
  %172 = or i32 %163, 2
  %173 = add nsw i32 %172, %57
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %14, i64 %174
  store float 0.000000e+00, float addrspace(1)* %175, align 4, !tbaa !7
  %176 = or i32 %163, 3
  %177 = add nsw i32 %176, %57
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %14, i64 %178
  store float 0.000000e+00, float addrspace(1)* %179, align 4, !tbaa !7
  %180 = or i32 %163, 4
  %181 = add nsw i32 %180, %57
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %14, i64 %182
  store float 0.000000e+00, float addrspace(1)* %183, align 4, !tbaa !7
  %184 = or i32 %163, 5
  %185 = add nsw i32 %184, %57
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %14, i64 %186
  store float 0.000000e+00, float addrspace(1)* %187, align 4, !tbaa !7
  %188 = or i32 %163, 6
  %189 = add nsw i32 %188, %57
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %14, i64 %190
  store float 0.000000e+00, float addrspace(1)* %191, align 4, !tbaa !7
  %192 = or i32 %163, 7
  %193 = add nsw i32 %192, %57
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %14, i64 %194
  store float 0.000000e+00, float addrspace(1)* %195, align 4, !tbaa !7
  %196 = add nuw nsw i32 %163, 8
  %197 = add i32 %164, 8
  %198 = icmp eq i32 %197, %68
  br i1 %198, label %150, label %162, !llvm.loop !16

199:                                              ; preds = %161, %434
  %200 = phi i32 [ %435, %434 ], [ 0, %161 ]
  %201 = phi i32 [ %436, %434 ], [ 0, %161 ]
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %202
  %204 = load i32, i32 addrspace(1)* %203, align 4, !tbaa !17, !amdgpu.noclobber !5
  %205 = icmp sgt i32 %204, 0
  br i1 %205, label %206, label %434

206:                                              ; preds = %199
  %207 = add nsw i32 %201, %57
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %14, i64 %208
  %210 = add i32 %200, %204
  %211 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  %212 = and i32 %204, 7
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %232, label %214

214:                                              ; preds = %206, %214
  %215 = phi float [ %228, %214 ], [ %211, %206 ]
  %216 = phi i32 [ %229, %214 ], [ %200, %206 ]
  %217 = phi i32 [ %230, %214 ], [ 0, %206 ]
  %218 = sext i32 %216 to i64
  %219 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %218
  %220 = load i32, i32 addrspace(1)* %219, align 4, !tbaa !17, !amdgpu.noclobber !5
  %221 = add nsw i32 %220, %58
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %14, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !7
  %225 = getelementptr inbounds float, float addrspace(1)* %11, i64 %218
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = fmul contract float %224, %226
  %228 = fadd contract float %215, %227
  store float %228, float addrspace(1)* %209, align 4, !tbaa !7
  %229 = add i32 %216, 1
  %230 = add i32 %217, 1
  %231 = icmp eq i32 %230, %212
  br i1 %231, label %232, label %214, !llvm.loop !19

232:                                              ; preds = %214, %206
  %233 = phi float [ %211, %206 ], [ %228, %214 ]
  %234 = phi i32 [ %200, %206 ], [ %229, %214 ]
  %235 = icmp ult i32 %204, 8
  br i1 %235, label %434, label %438

236:                                              ; preds = %434, %135, %161
  %237 = add i32 %137, %59
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %7, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !7
  %241 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %242 = fcmp contract olt float %240, %241
  %243 = select contract i1 %242, float 1.000000e+00, float 0.000000e+00
  %244 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %245 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %246 = getelementptr inbounds float, float addrspace(1)* %5, i64 %238
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7
  %248 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %249 = fmul contract float %247, %248
  %250 = getelementptr inbounds float, float addrspace(1)* %6, i64 %238
  %251 = load float, float addrspace(1)* %250, align 4, !tbaa !7
  %252 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %253 = tail call float @llvm.fabs.f32(float %252)
  %254 = tail call float @llvm.amdgcn.frexp.mant.f32(float %253)
  %255 = fcmp olt float %254, 0x3FE5555560000000
  %256 = zext i1 %255 to i32
  %257 = tail call float @llvm.amdgcn.ldexp.f32(float %254, i32 %256)
  %258 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %253)
  %259 = sub nsw i32 %258, %256
  %260 = fadd float %257, -1.000000e+00
  %261 = fadd float %257, 1.000000e+00
  %262 = fadd float %261, -1.000000e+00
  %263 = fsub float %257, %262
  %264 = tail call float @llvm.amdgcn.rcp.f32(float %261)
  %265 = fmul float %260, %264
  %266 = fmul float %261, %265
  %267 = fneg float %266
  %268 = tail call float @llvm.fma.f32(float %265, float %261, float %267)
  %269 = tail call float @llvm.fma.f32(float %265, float %263, float %268)
  %270 = fadd float %266, %269
  %271 = fsub float %270, %266
  %272 = fsub float %269, %271
  %273 = fsub float %260, %270
  %274 = fsub float %260, %273
  %275 = fsub float %274, %270
  %276 = fsub float %275, %272
  %277 = fadd float %273, %276
  %278 = fmul float %264, %277
  %279 = fadd float %265, %278
  %280 = fsub float %279, %265
  %281 = fsub float %278, %280
  %282 = fmul float %279, %279
  %283 = fneg float %282
  %284 = tail call float @llvm.fma.f32(float %279, float %279, float %283)
  %285 = fmul float %281, 2.000000e+00
  %286 = tail call float @llvm.fma.f32(float %279, float %285, float %284)
  %287 = fadd float %282, %286
  %288 = fsub float %287, %282
  %289 = fsub float %286, %288
  %290 = tail call float @llvm.fmuladd.f32(float %287, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %291 = tail call float @llvm.fmuladd.f32(float %287, float %290, float 0x3FD999BDE0000000)
  %292 = sitofp i32 %259 to float
  %293 = fmul float %292, 0x3FE62E4300000000
  %294 = fneg float %293
  %295 = tail call float @llvm.fma.f32(float %292, float 0x3FE62E4300000000, float %294)
  %296 = tail call float @llvm.fma.f32(float %292, float 0xBE205C6100000000, float %295)
  %297 = fadd float %293, %296
  %298 = fsub float %297, %293
  %299 = fsub float %296, %298
  %300 = tail call float @llvm.amdgcn.ldexp.f32(float %279, i32 1)
  %301 = fmul float %279, %287
  %302 = fneg float %301
  %303 = tail call float @llvm.fma.f32(float %287, float %279, float %302)
  %304 = tail call float @llvm.fma.f32(float %287, float %281, float %303)
  %305 = tail call float @llvm.fma.f32(float %289, float %279, float %304)
  %306 = fadd float %301, %305
  %307 = fsub float %306, %301
  %308 = fsub float %305, %307
  %309 = fmul float %287, %291
  %310 = fneg float %309
  %311 = tail call float @llvm.fma.f32(float %287, float %291, float %310)
  %312 = tail call float @llvm.fma.f32(float %289, float %291, float %311)
  %313 = fadd float %309, %312
  %314 = fsub float %313, %309
  %315 = fsub float %312, %314
  %316 = fadd float %313, 0x3FE5555540000000
  %317 = fadd float %316, 0xBFE5555540000000
  %318 = fsub float %313, %317
  %319 = fadd float %315, 0x3E2E720200000000
  %320 = fadd float %319, %318
  %321 = fadd float %316, %320
  %322 = fsub float %321, %316
  %323 = fsub float %320, %322
  %324 = fmul float %306, %321
  %325 = fneg float %324
  %326 = tail call float @llvm.fma.f32(float %306, float %321, float %325)
  %327 = tail call float @llvm.fma.f32(float %306, float %323, float %326)
  %328 = tail call float @llvm.fma.f32(float %308, float %321, float %327)
  %329 = tail call float @llvm.amdgcn.ldexp.f32(float %281, i32 1)
  %330 = fadd float %324, %328
  %331 = fsub float %330, %324
  %332 = fsub float %328, %331
  %333 = fadd float %300, %330
  %334 = fsub float %333, %300
  %335 = fsub float %330, %334
  %336 = fadd float %329, %332
  %337 = fadd float %336, %335
  %338 = fadd float %333, %337
  %339 = fsub float %338, %333
  %340 = fsub float %337, %339
  %341 = fadd float %297, %338
  %342 = fsub float %341, %297
  %343 = fsub float %341, %342
  %344 = fsub float %297, %343
  %345 = fsub float %338, %342
  %346 = fadd float %345, %344
  %347 = fadd float %299, %340
  %348 = fsub float %347, %299
  %349 = fsub float %347, %348
  %350 = fsub float %299, %349
  %351 = fsub float %340, %348
  %352 = fadd float %351, %350
  %353 = fadd float %347, %346
  %354 = fadd float %341, %353
  %355 = fsub float %354, %341
  %356 = fsub float %353, %355
  %357 = fadd float %352, %356
  %358 = fadd float %354, %357
  %359 = fsub float %358, %354
  %360 = fsub float %357, %359
  %361 = fmul float %358, 2.000000e+00
  %362 = fneg float %361
  %363 = tail call float @llvm.fma.f32(float %358, float 2.000000e+00, float %362)
  %364 = fmul float %358, 0.000000e+00
  %365 = tail call float @llvm.fma.f32(float %360, float 2.000000e+00, float %364)
  %366 = fadd float %363, %365
  %367 = fadd float %361, %366
  %368 = fsub float %367, %361
  %369 = fsub float %366, %368
  %370 = tail call float @llvm.fabs.f32(float %361) #3
  %371 = fcmp oeq float %370, 0x7FF0000000000000
  %372 = select i1 %371, float %361, float %367
  %373 = tail call float @llvm.fabs.f32(float %372) #3
  %374 = fcmp oeq float %373, 0x7FF0000000000000
  %375 = select i1 %374, float 0.000000e+00, float %369
  %376 = fcmp oeq float %372, 0x40562E4300000000
  %377 = select i1 %376, float 0x3EE0000000000000, float 0.000000e+00
  %378 = fsub float %372, %377
  %379 = fadd float %377, %375
  %380 = fmul float %378, 0x3FF7154760000000
  %381 = tail call float @llvm.rint.f32(float %380)
  %382 = fcmp ogt float %378, 0x40562E4300000000
  %383 = fcmp olt float %378, 0xC059D1DA00000000
  %384 = fneg float %380
  %385 = tail call float @llvm.fma.f32(float %378, float 0x3FF7154760000000, float %384)
  %386 = tail call float @llvm.fma.f32(float %378, float 0x3E54AE0BE0000000, float %385)
  %387 = fsub float %380, %381
  %388 = fadd float %386, %387
  %389 = tail call float @llvm.exp2.f32(float %388)
  %390 = fptosi float %381 to i32
  %391 = tail call float @llvm.amdgcn.ldexp.f32(float %389, i32 %390)
  %392 = select i1 %383, float 0.000000e+00, float %391
  %393 = select i1 %382, float 0x7FF0000000000000, float %392
  %394 = tail call float @llvm.fma.f32(float %393, float %379, float %393)
  %395 = tail call float @llvm.fabs.f32(float %393) #3
  %396 = fcmp oeq float %395, 0x7FF0000000000000
  %397 = select i1 %396, float %393, float %394
  %398 = tail call float @llvm.fabs.f32(float %397)
  %399 = fcmp oeq float %253, 0x7FF0000000000000
  %400 = fcmp oeq float %252, 0.000000e+00
  %401 = select i1 %399, float 0x7FF0000000000000, float %398
  %402 = select i1 %400, float 0.000000e+00, float %401
  %403 = fcmp uno float %252, 0.000000e+00
  %404 = select i1 %403, float 0x7FF8000000000000, float %402
  %405 = fmul contract float %251, %404
  %406 = fmul contract float %404, 5.000000e-01
  %407 = fsub contract float %405, %406
  %408 = fsub contract float %244, %136
  %409 = fmul contract float %245, %408
  %410 = fmul contract float %409, %3
  %411 = fadd contract float %136, %410
  %412 = fmul contract float %136, %249
  %413 = fadd contract float %411, %412
  %414 = fmul float %407, 0x3FF7154760000000
  %415 = tail call float @llvm.rint.f32(float %414)
  %416 = fcmp ogt float %407, 0x40562E4300000000
  %417 = fcmp olt float %407, 0xC059D1DA00000000
  %418 = fneg float %414
  %419 = tail call float @llvm.fma.f32(float %407, float 0x3FF7154760000000, float %418)
  %420 = tail call float @llvm.fma.f32(float %407, float 0x3E54AE0BE0000000, float %419)
  %421 = fsub float %414, %415
  %422 = fadd float %420, %421
  %423 = tail call float @llvm.exp2.f32(float %422)
  %424 = fptosi float %415 to i32
  %425 = tail call float @llvm.amdgcn.ldexp.f32(float %423, i32 %424)
  %426 = fadd contract float %425, -1.000000e+00
  %427 = select i1 %417, float -1.000000e+00, float %426
  %428 = select i1 %416, float 0x7FF0000000000000, float %427
  %429 = fmul contract float %136, %428
  %430 = fmul contract float %243, %429
  %431 = fadd contract float %413, %430
  br i1 %28, label %432, label %564

432:                                              ; preds = %236
  %433 = mul i32 %237, %2
  br i1 %71, label %538, label %567

434:                                              ; preds = %232, %438, %199
  %435 = phi i32 [ %200, %199 ], [ %210, %438 ], [ %210, %232 ]
  %436 = add nuw nsw i32 %201, 1
  %437 = icmp eq i32 %436, %2
  br i1 %437, label %236, label %199, !llvm.loop !20

438:                                              ; preds = %232, %438
  %439 = phi float [ %535, %438 ], [ %233, %232 ]
  %440 = phi i32 [ %536, %438 ], [ %234, %232 ]
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %441
  %443 = load i32, i32 addrspace(1)* %442, align 4, !tbaa !17, !amdgpu.noclobber !5
  %444 = add nsw i32 %443, %58
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds float, float addrspace(1)* %14, i64 %445
  %447 = load float, float addrspace(1)* %446, align 4, !tbaa !7
  %448 = getelementptr inbounds float, float addrspace(1)* %11, i64 %441
  %449 = load float, float addrspace(1)* %448, align 4, !tbaa !7
  %450 = fmul contract float %447, %449
  %451 = fadd contract float %439, %450
  store float %451, float addrspace(1)* %209, align 4, !tbaa !7
  %452 = add i32 %440, 1
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %453
  %455 = load i32, i32 addrspace(1)* %454, align 4, !tbaa !17, !amdgpu.noclobber !5
  %456 = add nsw i32 %455, %58
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds float, float addrspace(1)* %14, i64 %457
  %459 = load float, float addrspace(1)* %458, align 4, !tbaa !7
  %460 = getelementptr inbounds float, float addrspace(1)* %11, i64 %453
  %461 = load float, float addrspace(1)* %460, align 4, !tbaa !7
  %462 = fmul contract float %459, %461
  %463 = fadd contract float %451, %462
  store float %463, float addrspace(1)* %209, align 4, !tbaa !7
  %464 = add i32 %440, 2
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %465
  %467 = load i32, i32 addrspace(1)* %466, align 4, !tbaa !17, !amdgpu.noclobber !5
  %468 = add nsw i32 %467, %58
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds float, float addrspace(1)* %14, i64 %469
  %471 = load float, float addrspace(1)* %470, align 4, !tbaa !7
  %472 = getelementptr inbounds float, float addrspace(1)* %11, i64 %465
  %473 = load float, float addrspace(1)* %472, align 4, !tbaa !7
  %474 = fmul contract float %471, %473
  %475 = fadd contract float %463, %474
  store float %475, float addrspace(1)* %209, align 4, !tbaa !7
  %476 = add i32 %440, 3
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %477
  %479 = load i32, i32 addrspace(1)* %478, align 4, !tbaa !17, !amdgpu.noclobber !5
  %480 = add nsw i32 %479, %58
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds float, float addrspace(1)* %14, i64 %481
  %483 = load float, float addrspace(1)* %482, align 4, !tbaa !7
  %484 = getelementptr inbounds float, float addrspace(1)* %11, i64 %477
  %485 = load float, float addrspace(1)* %484, align 4, !tbaa !7
  %486 = fmul contract float %483, %485
  %487 = fadd contract float %475, %486
  store float %487, float addrspace(1)* %209, align 4, !tbaa !7
  %488 = add i32 %440, 4
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %489
  %491 = load i32, i32 addrspace(1)* %490, align 4, !tbaa !17, !amdgpu.noclobber !5
  %492 = add nsw i32 %491, %58
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds float, float addrspace(1)* %14, i64 %493
  %495 = load float, float addrspace(1)* %494, align 4, !tbaa !7
  %496 = getelementptr inbounds float, float addrspace(1)* %11, i64 %489
  %497 = load float, float addrspace(1)* %496, align 4, !tbaa !7
  %498 = fmul contract float %495, %497
  %499 = fadd contract float %487, %498
  store float %499, float addrspace(1)* %209, align 4, !tbaa !7
  %500 = add i32 %440, 5
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %501
  %503 = load i32, i32 addrspace(1)* %502, align 4, !tbaa !17, !amdgpu.noclobber !5
  %504 = add nsw i32 %503, %58
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds float, float addrspace(1)* %14, i64 %505
  %507 = load float, float addrspace(1)* %506, align 4, !tbaa !7
  %508 = getelementptr inbounds float, float addrspace(1)* %11, i64 %501
  %509 = load float, float addrspace(1)* %508, align 4, !tbaa !7
  %510 = fmul contract float %507, %509
  %511 = fadd contract float %499, %510
  store float %511, float addrspace(1)* %209, align 4, !tbaa !7
  %512 = add i32 %440, 6
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %513
  %515 = load i32, i32 addrspace(1)* %514, align 4, !tbaa !17, !amdgpu.noclobber !5
  %516 = add nsw i32 %515, %58
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds float, float addrspace(1)* %14, i64 %517
  %519 = load float, float addrspace(1)* %518, align 4, !tbaa !7
  %520 = getelementptr inbounds float, float addrspace(1)* %11, i64 %513
  %521 = load float, float addrspace(1)* %520, align 4, !tbaa !7
  %522 = fmul contract float %519, %521
  %523 = fadd contract float %511, %522
  store float %523, float addrspace(1)* %209, align 4, !tbaa !7
  %524 = add i32 %440, 7
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %525
  %527 = load i32, i32 addrspace(1)* %526, align 4, !tbaa !17, !amdgpu.noclobber !5
  %528 = add nsw i32 %527, %58
  %529 = sext i32 %528 to i64
  %530 = getelementptr inbounds float, float addrspace(1)* %14, i64 %529
  %531 = load float, float addrspace(1)* %530, align 4, !tbaa !7
  %532 = getelementptr inbounds float, float addrspace(1)* %11, i64 %525
  %533 = load float, float addrspace(1)* %532, align 4, !tbaa !7
  %534 = fmul contract float %531, %533
  %535 = fadd contract float %523, %534
  store float %535, float addrspace(1)* %209, align 4, !tbaa !7
  %536 = add i32 %440, 8
  %537 = icmp eq i32 %536, %210
  br i1 %537, label %434, label %438, !llvm.loop !21

538:                                              ; preds = %567, %432
  %539 = phi i32 [ 0, %432 ], [ %617, %567 ]
  br i1 %73, label %564, label %540

540:                                              ; preds = %538
  %541 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %542 = add i32 %539, %433
  %543 = sext i32 %542 to i64
  %544 = getelementptr inbounds float, float addrspace(1)* %4, i64 %543
  %545 = load float, float addrspace(1)* %544, align 4, !tbaa !7
  %546 = fmul contract float %541, %545
  %547 = fmul contract float %431, %546
  %548 = fadd contract float %431, %547
  %549 = add nsw i32 %539, %57
  %550 = sext i32 %549 to i64
  %551 = getelementptr inbounds float, float addrspace(1)* %14, i64 %550
  %552 = load float, float addrspace(1)* %551, align 4, !tbaa !7
  %553 = zext i32 %539 to i64
  %554 = getelementptr inbounds float, float addrspace(1)* %10, i64 %553
  %555 = load float, float addrspace(1)* %554, align 4, !tbaa !7
  %556 = fsub contract float %555, %552
  %557 = fmul contract float %548, %556
  %558 = fdiv contract float %557, %555
  %559 = fadd contract float %558, 1.000000e+00
  %560 = fmul contract float %552, %559
  %561 = add nsw i32 %539, %58
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds float, float addrspace(1)* %14, i64 %562
  store float %560, float addrspace(1)* %563, align 4, !tbaa !7
  br label %564

564:                                              ; preds = %540, %538, %236
  %565 = add nuw nsw i32 %137, 1
  %566 = icmp eq i32 %565, %1
  br i1 %566, label %139, label %135, !llvm.loop !22

567:                                              ; preds = %432, %567
  %568 = phi i32 [ %617, %567 ], [ 0, %432 ]
  %569 = phi i32 [ %618, %567 ], [ 0, %432 ]
  %570 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %571 = add i32 %568, %433
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds float, float addrspace(1)* %4, i64 %572
  %574 = load float, float addrspace(1)* %573, align 4, !tbaa !7
  %575 = fmul contract float %570, %574
  %576 = fmul contract float %431, %575
  %577 = fadd contract float %431, %576
  %578 = add nsw i32 %568, %57
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds float, float addrspace(1)* %14, i64 %579
  %581 = load float, float addrspace(1)* %580, align 4, !tbaa !7
  %582 = zext i32 %568 to i64
  %583 = getelementptr inbounds float, float addrspace(1)* %10, i64 %582
  %584 = load float, float addrspace(1)* %583, align 4, !tbaa !7
  %585 = fsub contract float %584, %581
  %586 = fmul contract float %577, %585
  %587 = fdiv contract float %586, %584
  %588 = fadd contract float %587, 1.000000e+00
  %589 = fmul contract float %581, %588
  %590 = add nsw i32 %568, %58
  %591 = sext i32 %590 to i64
  %592 = getelementptr inbounds float, float addrspace(1)* %14, i64 %591
  store float %589, float addrspace(1)* %592, align 4, !tbaa !7
  %593 = or i32 %568, 1
  %594 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %595 = add i32 %593, %433
  %596 = sext i32 %595 to i64
  %597 = getelementptr inbounds float, float addrspace(1)* %4, i64 %596
  %598 = load float, float addrspace(1)* %597, align 4, !tbaa !7
  %599 = fmul contract float %594, %598
  %600 = fmul contract float %431, %599
  %601 = fadd contract float %431, %600
  %602 = add nsw i32 %593, %57
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds float, float addrspace(1)* %14, i64 %603
  %605 = load float, float addrspace(1)* %604, align 4, !tbaa !7
  %606 = zext i32 %593 to i64
  %607 = getelementptr inbounds float, float addrspace(1)* %10, i64 %606
  %608 = load float, float addrspace(1)* %607, align 4, !tbaa !7
  %609 = fsub contract float %608, %605
  %610 = fmul contract float %601, %609
  %611 = fdiv contract float %610, %608
  %612 = fadd contract float %611, 1.000000e+00
  %613 = fmul contract float %605, %612
  %614 = add nsw i32 %593, %58
  %615 = sext i32 %614 to i64
  %616 = getelementptr inbounds float, float addrspace(1)* %14, i64 %615
  store float %613, float addrspace(1)* %616, align 4, !tbaa !7
  %617 = add nuw nsw i32 %568, 2
  %618 = add i32 %569, 2
  %619 = icmp eq i32 %618, %72
  br i1 %619, label %538, label %567, !llvm.loop !23

620:                                              ; preds = %620, %148
  %621 = phi float [ 0.000000e+00, %148 ], [ %670, %620 ]
  %622 = phi i32 [ 0, %148 ], [ %671, %620 ]
  %623 = phi i32 [ 0, %148 ], [ %672, %620 ]
  %624 = add nsw i32 %622, %145
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds float, float addrspace(1)* %14, i64 %625
  %627 = load float, float addrspace(1)* %626, align 4, !tbaa !7
  %628 = fadd contract float %627, %621
  store float %628, float addrspace(1)* %141, align 4, !tbaa !7
  %629 = or i32 %622, 1
  %630 = add nsw i32 %629, %145
  %631 = sext i32 %630 to i64
  %632 = getelementptr inbounds float, float addrspace(1)* %14, i64 %631
  %633 = load float, float addrspace(1)* %632, align 4, !tbaa !7
  %634 = fadd contract float %633, %628
  store float %634, float addrspace(1)* %141, align 4, !tbaa !7
  %635 = or i32 %622, 2
  %636 = add nsw i32 %635, %145
  %637 = sext i32 %636 to i64
  %638 = getelementptr inbounds float, float addrspace(1)* %14, i64 %637
  %639 = load float, float addrspace(1)* %638, align 4, !tbaa !7
  %640 = fadd contract float %639, %634
  store float %640, float addrspace(1)* %141, align 4, !tbaa !7
  %641 = or i32 %622, 3
  %642 = add nsw i32 %641, %145
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds float, float addrspace(1)* %14, i64 %643
  %645 = load float, float addrspace(1)* %644, align 4, !tbaa !7
  %646 = fadd contract float %645, %640
  store float %646, float addrspace(1)* %141, align 4, !tbaa !7
  %647 = or i32 %622, 4
  %648 = add nsw i32 %647, %145
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds float, float addrspace(1)* %14, i64 %649
  %651 = load float, float addrspace(1)* %650, align 4, !tbaa !7
  %652 = fadd contract float %651, %646
  store float %652, float addrspace(1)* %141, align 4, !tbaa !7
  %653 = or i32 %622, 5
  %654 = add nsw i32 %653, %145
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds float, float addrspace(1)* %14, i64 %655
  %657 = load float, float addrspace(1)* %656, align 4, !tbaa !7
  %658 = fadd contract float %657, %652
  store float %658, float addrspace(1)* %141, align 4, !tbaa !7
  %659 = or i32 %622, 6
  %660 = add nsw i32 %659, %145
  %661 = sext i32 %660 to i64
  %662 = getelementptr inbounds float, float addrspace(1)* %14, i64 %661
  %663 = load float, float addrspace(1)* %662, align 4, !tbaa !7
  %664 = fadd contract float %663, %658
  store float %664, float addrspace(1)* %141, align 4, !tbaa !7
  %665 = or i32 %622, 7
  %666 = add nsw i32 %665, %145
  %667 = sext i32 %666 to i64
  %668 = getelementptr inbounds float, float addrspace(1)* %14, i64 %667
  %669 = load float, float addrspace(1)* %668, align 4, !tbaa !7
  %670 = fadd contract float %669, %664
  store float %670, float addrspace(1)* %141, align 4, !tbaa !7
  %671 = add nuw nsw i32 %622, 8
  %672 = add i32 %623, 8
  %673 = icmp eq i32 %672, %149
  br i1 %673, label %674, label %620, !llvm.loop !24

674:                                              ; preds = %620, %142
  %675 = phi float [ 0.000000e+00, %142 ], [ %670, %620 ]
  %676 = phi i32 [ 0, %142 ], [ %671, %620 ]
  %677 = icmp eq i32 %146, 0
  br i1 %677, label %690, label %678

678:                                              ; preds = %674, %678
  %679 = phi float [ %686, %678 ], [ %675, %674 ]
  %680 = phi i32 [ %687, %678 ], [ %676, %674 ]
  %681 = phi i32 [ %688, %678 ], [ 0, %674 ]
  %682 = add nsw i32 %680, %145
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds float, float addrspace(1)* %14, i64 %683
  %685 = load float, float addrspace(1)* %684, align 4, !tbaa !7
  %686 = fadd contract float %685, %679
  store float %686, float addrspace(1)* %141, align 4, !tbaa !7
  %687 = add nuw nsw i32 %680, 1
  %688 = add i32 %681, 1
  %689 = icmp eq i32 %688, %146
  br i1 %689, label %690, label %678, !llvm.loop !25

690:                                              ; preds = %674, %678, %139, %16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !9, i64 0}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !14}
!25 = distinct !{!25, !12}
