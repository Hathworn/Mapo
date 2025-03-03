; ModuleID = '../data/hip_kernels/178/11/main.cu'
source_filename = "../data/hip_kernels/178/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z14_kernelpp_cudaifiiiPfS_S_S_S_S_S_(i32 %0, float %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11) local_unnamed_addr #1 {
  %13 = alloca [256 x float], align 16, addrspace(5)
  %14 = alloca [256 x float], align 16, addrspace(5)
  %15 = alloca [256 x float], align 16, addrspace(5)
  %16 = alloca [256 x float], align 16, addrspace(5)
  %17 = alloca [256 x float], align 16, addrspace(5)
  %18 = alloca [256 x float], align 16, addrspace(5)
  %19 = alloca [512 x float], align 16, addrspace(5)
  %20 = alloca [512 x float], align 16, addrspace(5)
  %21 = alloca [512 x float], align 16, addrspace(5)
  %22 = alloca [512 x i32], align 16, addrspace(5)
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = mul i32 %23, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %31 = add i32 %29, %30
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %33 = getelementptr i8, i8 addrspace(4)* %24, i64 6
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 2, !range !4, !invariant.load !5
  %36 = zext i16 %35 to i32
  %37 = mul i32 %32, %36
  %38 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %39 = add i32 %37, %38
  %40 = bitcast [256 x float] addrspace(5)* %13 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 1024, i8 addrspace(5)* %40) #4
  %41 = bitcast [256 x float] addrspace(5)* %14 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 1024, i8 addrspace(5)* %41) #4
  %42 = bitcast [256 x float] addrspace(5)* %15 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 1024, i8 addrspace(5)* %42) #4
  %43 = bitcast [256 x float] addrspace(5)* %16 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 1024, i8 addrspace(5)* %43) #4
  %44 = bitcast [256 x float] addrspace(5)* %17 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 1024, i8 addrspace(5)* %44) #4
  %45 = bitcast [256 x float] addrspace(5)* %18 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 1024, i8 addrspace(5)* %45) #4
  %46 = bitcast [512 x float] addrspace(5)* %19 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 2048, i8 addrspace(5)* %46) #4
  %47 = bitcast [512 x float] addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 2048, i8 addrspace(5)* %47) #4
  %48 = bitcast [512 x float] addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 2048, i8 addrspace(5)* %48) #4
  %49 = bitcast [512 x i32] addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 2048, i8 addrspace(5)* %49) #4
  %50 = icmp ult i32 %39, %2
  %51 = icmp ult i32 %31, %0
  %52 = select i1 %50, i1 %51, i1 false
  br i1 %52, label %53, label %1027

53:                                               ; preds = %12
  %54 = zext i32 %31 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %11, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = tail call float @llvm.fabs.f32(float %56)
  %58 = fcmp olt float %57, 1.310720e+05
  br i1 %58, label %59, label %89

59:                                               ; preds = %53
  %60 = fmul float %57, 0x3FE45F3060000000
  %61 = tail call float @llvm.rint.f32(float %60)
  %62 = tail call float @llvm.fma.f32(float %61, float 0xBFF921FB40000000, float %57)
  %63 = tail call float @llvm.fma.f32(float %61, float 0xBE74442D00000000, float %62)
  %64 = tail call float @llvm.fma.f32(float %61, float 0xBCF8469880000000, float %63)
  %65 = fptosi float %61 to i32
  %66 = bitcast float %57 to i32
  %67 = fmul float %64, %64
  %68 = tail call float @llvm.fmuladd.f32(float %67, float 0xBF29833040000000, float 0x3F81103880000000)
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float 0xBFC55553A0000000)
  %70 = fmul float %67, %69
  %71 = tail call float @llvm.fmuladd.f32(float %64, float %70, float %64)
  %72 = tail call float @llvm.fmuladd.f32(float %67, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %73 = tail call float @llvm.fmuladd.f32(float %67, float %72, float 0x3FA5557EE0000000)
  %74 = tail call float @llvm.fmuladd.f32(float %67, float %73, float 0xBFE0000080000000)
  %75 = tail call float @llvm.fmuladd.f32(float %67, float %74, float 1.000000e+00)
  %76 = and i32 %65, 1
  %77 = icmp eq i32 %76, 0
  %78 = select i1 %77, float %71, float %75
  %79 = bitcast float %78 to i32
  %80 = shl i32 %65, 30
  %81 = and i32 %80, -2147483648
  %82 = bitcast float %56 to i32
  %83 = xor i32 %66, %82
  %84 = xor i32 %83, %79
  %85 = xor i32 %84, %81
  %86 = bitcast i32 %85 to float
  %87 = tail call i1 @llvm.amdgcn.class.f32(float %57, i32 504)
  %88 = select i1 %87, float %86, float 0x7FF8000000000000
  br label %217

89:                                               ; preds = %53
  %90 = bitcast float %57 to i32
  %91 = lshr i32 %90, 23
  %92 = and i32 %90, 8388607
  %93 = or i32 %92, 8388608
  %94 = zext i32 %93 to i64
  %95 = mul nuw nsw i64 %94, 4266746795
  %96 = trunc i64 %95 to i32
  %97 = lshr i64 %95, 32
  %98 = mul nuw nsw i64 %94, 1011060801
  %99 = add nuw nsw i64 %97, %98
  %100 = trunc i64 %99 to i32
  %101 = lshr i64 %99, 32
  %102 = mul nuw nsw i64 %94, 3680671129
  %103 = add nuw nsw i64 %101, %102
  %104 = trunc i64 %103 to i32
  %105 = lshr i64 %103, 32
  %106 = mul nuw nsw i64 %94, 4113882560
  %107 = add nuw nsw i64 %105, %106
  %108 = trunc i64 %107 to i32
  %109 = lshr i64 %107, 32
  %110 = mul nuw nsw i64 %94, 4230436817
  %111 = add nuw nsw i64 %109, %110
  %112 = trunc i64 %111 to i32
  %113 = lshr i64 %111, 32
  %114 = mul nuw nsw i64 %94, 1313084713
  %115 = add nuw nsw i64 %113, %114
  %116 = trunc i64 %115 to i32
  %117 = lshr i64 %115, 32
  %118 = mul nuw nsw i64 %94, 2734261102
  %119 = add nuw nsw i64 %117, %118
  %120 = trunc i64 %119 to i32
  %121 = lshr i64 %119, 32
  %122 = trunc i64 %121 to i32
  %123 = add nsw i32 %91, -120
  %124 = icmp ugt i32 %123, 63
  %125 = select i1 %124, i32 %116, i32 %122
  %126 = select i1 %124, i32 %112, i32 %120
  %127 = select i1 %124, i32 %108, i32 %116
  %128 = select i1 %124, i32 %104, i32 %112
  %129 = select i1 %124, i32 %100, i32 %108
  %130 = select i1 %124, i32 %96, i32 %104
  %131 = select i1 %124, i32 -64, i32 0
  %132 = add nsw i32 %131, %123
  %133 = icmp ugt i32 %132, 31
  %134 = select i1 %133, i32 %126, i32 %125
  %135 = select i1 %133, i32 %127, i32 %126
  %136 = select i1 %133, i32 %128, i32 %127
  %137 = select i1 %133, i32 %129, i32 %128
  %138 = select i1 %133, i32 %130, i32 %129
  %139 = select i1 %133, i32 -32, i32 0
  %140 = add nsw i32 %139, %132
  %141 = icmp ugt i32 %140, 31
  %142 = select i1 %141, i32 %135, i32 %134
  %143 = select i1 %141, i32 %136, i32 %135
  %144 = select i1 %141, i32 %137, i32 %136
  %145 = select i1 %141, i32 %138, i32 %137
  %146 = select i1 %141, i32 -32, i32 0
  %147 = add nsw i32 %146, %140
  %148 = icmp eq i32 %147, 0
  %149 = sub nsw i32 32, %147
  %150 = tail call i32 @llvm.fshr.i32(i32 %142, i32 %143, i32 %149)
  %151 = tail call i32 @llvm.fshr.i32(i32 %143, i32 %144, i32 %149)
  %152 = tail call i32 @llvm.fshr.i32(i32 %144, i32 %145, i32 %149)
  %153 = select i1 %148, i32 %142, i32 %150
  %154 = select i1 %148, i32 %143, i32 %151
  %155 = select i1 %148, i32 %144, i32 %152
  %156 = lshr i32 %153, 29
  %157 = tail call i32 @llvm.fshl.i32(i32 %153, i32 %154, i32 2)
  %158 = tail call i32 @llvm.fshl.i32(i32 %154, i32 %155, i32 2)
  %159 = tail call i32 @llvm.fshl.i32(i32 %155, i32 %145, i32 2)
  %160 = and i32 %156, 1
  %161 = sub nsw i32 0, %160
  %162 = shl i32 %156, 31
  %163 = xor i32 %157, %161
  %164 = xor i32 %158, %161
  %165 = xor i32 %159, %161
  %166 = tail call i32 @llvm.ctlz.i32(i32 %163, i1 false), !range !11
  %167 = sub nsw i32 31, %166
  %168 = tail call i32 @llvm.fshr.i32(i32 %163, i32 %164, i32 %167)
  %169 = tail call i32 @llvm.fshr.i32(i32 %164, i32 %165, i32 %167)
  %170 = shl nuw nsw i32 %166, 23
  %171 = sub nuw nsw i32 1056964608, %170
  %172 = lshr i32 %168, 9
  %173 = or i32 %172, %171
  %174 = or i32 %173, %162
  %175 = bitcast i32 %174 to float
  %176 = tail call i32 @llvm.fshl.i32(i32 %168, i32 %169, i32 23)
  %177 = tail call i32 @llvm.ctlz.i32(i32 %176, i1 false), !range !11
  %178 = fmul float %175, 0x3FF921FB40000000
  %179 = add nuw nsw i32 %177, %166
  %180 = shl nuw nsw i32 %179, 23
  %181 = sub nuw nsw i32 855638016, %180
  %182 = sub nsw i32 31, %177
  %183 = tail call i32 @llvm.fshr.i32(i32 %176, i32 %169, i32 %182)
  %184 = lshr i32 %183, 9
  %185 = or i32 %181, %184
  %186 = or i32 %185, %162
  %187 = bitcast i32 %186 to float
  %188 = fneg float %178
  %189 = tail call float @llvm.fma.f32(float %175, float 0x3FF921FB40000000, float %188)
  %190 = tail call float @llvm.fma.f32(float %175, float 0x3E74442D00000000, float %189)
  %191 = tail call float @llvm.fma.f32(float %187, float 0x3FF921FB40000000, float %190)
  %192 = fadd float %178, %191
  %193 = lshr i32 %153, 30
  %194 = add nuw nsw i32 %160, %193
  %195 = fmul float %192, %192
  %196 = tail call float @llvm.fmuladd.f32(float %195, float 0xBF29833040000000, float 0x3F81103880000000)
  %197 = tail call float @llvm.fmuladd.f32(float %195, float %196, float 0xBFC55553A0000000)
  %198 = fmul float %195, %197
  %199 = tail call float @llvm.fmuladd.f32(float %192, float %198, float %192)
  %200 = tail call float @llvm.fmuladd.f32(float %195, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %201 = tail call float @llvm.fmuladd.f32(float %195, float %200, float 0x3FA5557EE0000000)
  %202 = tail call float @llvm.fmuladd.f32(float %195, float %201, float 0xBFE0000080000000)
  %203 = tail call float @llvm.fmuladd.f32(float %195, float %202, float 1.000000e+00)
  %204 = and i32 %194, 1
  %205 = icmp eq i32 %204, 0
  %206 = select i1 %205, float %199, float %203
  %207 = bitcast float %206 to i32
  %208 = shl i32 %194, 30
  %209 = and i32 %208, -2147483648
  %210 = bitcast float %56 to i32
  %211 = xor i32 %210, %207
  %212 = xor i32 %211, %209
  %213 = xor i32 %212, %90
  %214 = bitcast i32 %213 to float
  %215 = tail call i1 @llvm.amdgcn.class.f32(float %57, i32 504)
  %216 = select i1 %215, float %214, float 0x7FF8000000000000
  br label %217

217:                                              ; preds = %59, %89
  %218 = phi i32 [ %81, %59 ], [ %209, %89 ]
  %219 = phi i32 [ %76, %59 ], [ %204, %89 ]
  %220 = phi float [ %75, %59 ], [ %203, %89 ]
  %221 = phi float [ %71, %59 ], [ %199, %89 ]
  %222 = phi float [ %88, %59 ], [ %216, %89 ]
  %223 = phi i1 [ %87, %59 ], [ %215, %89 ]
  %224 = fneg float %221
  %225 = icmp eq i32 %219, 0
  %226 = select i1 %225, float %220, float %224
  %227 = bitcast float %226 to i32
  %228 = xor i32 %218, %227
  %229 = bitcast i32 %228 to float
  %230 = select i1 %223, float %229, float 0x7FF8000000000000
  %231 = fcmp contract oge float %56, 0.000000e+00
  %232 = fpext float %56 to double
  %233 = fcmp contract olt double %232, 0x3FF921FB54442D18
  %234 = and i1 %231, %233
  %235 = fcmp contract oge double %232, 0x400921FB54442D18
  %236 = fcmp contract olt double %232, 0x4012D97C7F3321D2
  %237 = and i1 %235, %236
  %238 = or i1 %234, %237
  %239 = sub i32 1, %2
  %240 = sitofp i32 %239 to double
  %241 = fmul contract double %240, 5.000000e-01
  %242 = uitofp i32 %39 to double
  %243 = fadd contract double %241, %242
  %244 = fpext float %1 to double
  %245 = fadd contract double %243, %244
  %246 = fptrunc double %245 to float
  %247 = fmul contract float %230, -1.000000e+06
  %248 = fmul contract float %222, %246
  %249 = fsub contract float %247, %248
  %250 = fmul contract float %222, 1.000000e+06
  %251 = fmul contract float %230, %246
  %252 = fsub contract float %251, %250
  %253 = fmul contract float %230, 1.000000e+06
  %254 = fsub contract float %253, %248
  %255 = fadd contract float %250, %251
  %256 = fsub contract float %252, %255
  %257 = fsub contract float %249, %254
  %258 = fdiv contract float %256, %257
  %259 = fdiv contract float 1.000000e+00, %258
  %260 = icmp slt i32 %3, 0
  br i1 %260, label %448, label %261

261:                                              ; preds = %217
  %262 = add i32 %3, 1
  %263 = and i32 %262, 7
  %264 = icmp ult i32 %3, 7
  br i1 %264, label %267, label %265

265:                                              ; preds = %261
  %266 = and i32 %262, -8
  br label %296

267:                                              ; preds = %296, %261
  %268 = phi i32 [ 0, %261 ], [ %410, %296 ]
  %269 = icmp eq i32 %263, 0
  br i1 %269, label %289, label %270

270:                                              ; preds = %267, %270
  %271 = phi i32 [ %286, %270 ], [ %268, %267 ]
  %272 = phi i32 [ %287, %270 ], [ 0, %267 ]
  %273 = zext i32 %271 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %6, i64 %273
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !7, !amdgpu.noclobber !5
  %276 = fsub contract float %275, %252
  %277 = fmul contract float %259, %276
  %278 = fadd contract float %249, %277
  %279 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %271
  store float %278, float addrspace(5)* %279, align 4, !tbaa !7
  %280 = getelementptr inbounds float, float addrspace(1)* %5, i64 %273
  %281 = load float, float addrspace(1)* %280, align 4, !tbaa !7, !amdgpu.noclobber !5
  %282 = fsub contract float %281, %249
  %283 = fmul contract float %258, %282
  %284 = fadd contract float %252, %283
  %285 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %271
  store float %284, float addrspace(5)* %285, align 4, !tbaa !7
  %286 = add nuw i32 %271, 1
  %287 = add i32 %272, 1
  %288 = icmp eq i32 %287, %263
  br i1 %288, label %289, label %270, !llvm.loop !12

289:                                              ; preds = %270, %267
  br i1 %260, label %448, label %290

290:                                              ; preds = %289
  %291 = load float, float addrspace(1)* %5, align 4, !tbaa !7, !amdgpu.noclobber !5
  %292 = zext i32 %3 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %5, i64 %292
  %294 = load float, float addrspace(1)* %6, align 4, !tbaa !7, !amdgpu.noclobber !5
  %295 = getelementptr inbounds float, float addrspace(1)* %6, i64 %292
  br label %413

296:                                              ; preds = %296, %265
  %297 = phi i32 [ 0, %265 ], [ %410, %296 ]
  %298 = phi i32 [ 0, %265 ], [ %411, %296 ]
  %299 = zext i32 %297 to i64
  %300 = getelementptr inbounds float, float addrspace(1)* %6, i64 %299
  %301 = load float, float addrspace(1)* %300, align 4, !tbaa !7, !amdgpu.noclobber !5
  %302 = fsub contract float %301, %252
  %303 = fmul contract float %259, %302
  %304 = fadd contract float %249, %303
  %305 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %297
  store float %304, float addrspace(5)* %305, align 16, !tbaa !7
  %306 = getelementptr inbounds float, float addrspace(1)* %5, i64 %299
  %307 = load float, float addrspace(1)* %306, align 4, !tbaa !7, !amdgpu.noclobber !5
  %308 = fsub contract float %307, %249
  %309 = fmul contract float %258, %308
  %310 = fadd contract float %252, %309
  %311 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %297
  store float %310, float addrspace(5)* %311, align 16, !tbaa !7
  %312 = or i32 %297, 1
  %313 = zext i32 %312 to i64
  %314 = getelementptr inbounds float, float addrspace(1)* %6, i64 %313
  %315 = load float, float addrspace(1)* %314, align 4, !tbaa !7, !amdgpu.noclobber !5
  %316 = fsub contract float %315, %252
  %317 = fmul contract float %259, %316
  %318 = fadd contract float %249, %317
  %319 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %312
  store float %318, float addrspace(5)* %319, align 4, !tbaa !7
  %320 = getelementptr inbounds float, float addrspace(1)* %5, i64 %313
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !7, !amdgpu.noclobber !5
  %322 = fsub contract float %321, %249
  %323 = fmul contract float %258, %322
  %324 = fadd contract float %252, %323
  %325 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %312
  store float %324, float addrspace(5)* %325, align 4, !tbaa !7
  %326 = or i32 %297, 2
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %6, i64 %327
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !7, !amdgpu.noclobber !5
  %330 = fsub contract float %329, %252
  %331 = fmul contract float %259, %330
  %332 = fadd contract float %249, %331
  %333 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %326
  store float %332, float addrspace(5)* %333, align 8, !tbaa !7
  %334 = getelementptr inbounds float, float addrspace(1)* %5, i64 %327
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !7, !amdgpu.noclobber !5
  %336 = fsub contract float %335, %249
  %337 = fmul contract float %258, %336
  %338 = fadd contract float %252, %337
  %339 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %326
  store float %338, float addrspace(5)* %339, align 8, !tbaa !7
  %340 = or i32 %297, 3
  %341 = zext i32 %340 to i64
  %342 = getelementptr inbounds float, float addrspace(1)* %6, i64 %341
  %343 = load float, float addrspace(1)* %342, align 4, !tbaa !7, !amdgpu.noclobber !5
  %344 = fsub contract float %343, %252
  %345 = fmul contract float %259, %344
  %346 = fadd contract float %249, %345
  %347 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %340
  store float %346, float addrspace(5)* %347, align 4, !tbaa !7
  %348 = getelementptr inbounds float, float addrspace(1)* %5, i64 %341
  %349 = load float, float addrspace(1)* %348, align 4, !tbaa !7, !amdgpu.noclobber !5
  %350 = fsub contract float %349, %249
  %351 = fmul contract float %258, %350
  %352 = fadd contract float %252, %351
  %353 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %340
  store float %352, float addrspace(5)* %353, align 4, !tbaa !7
  %354 = or i32 %297, 4
  %355 = zext i32 %354 to i64
  %356 = getelementptr inbounds float, float addrspace(1)* %6, i64 %355
  %357 = load float, float addrspace(1)* %356, align 4, !tbaa !7, !amdgpu.noclobber !5
  %358 = fsub contract float %357, %252
  %359 = fmul contract float %259, %358
  %360 = fadd contract float %249, %359
  %361 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %354
  store float %360, float addrspace(5)* %361, align 16, !tbaa !7
  %362 = getelementptr inbounds float, float addrspace(1)* %5, i64 %355
  %363 = load float, float addrspace(1)* %362, align 4, !tbaa !7, !amdgpu.noclobber !5
  %364 = fsub contract float %363, %249
  %365 = fmul contract float %258, %364
  %366 = fadd contract float %252, %365
  %367 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %354
  store float %366, float addrspace(5)* %367, align 16, !tbaa !7
  %368 = or i32 %297, 5
  %369 = zext i32 %368 to i64
  %370 = getelementptr inbounds float, float addrspace(1)* %6, i64 %369
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !7, !amdgpu.noclobber !5
  %372 = fsub contract float %371, %252
  %373 = fmul contract float %259, %372
  %374 = fadd contract float %249, %373
  %375 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %368
  store float %374, float addrspace(5)* %375, align 4, !tbaa !7
  %376 = getelementptr inbounds float, float addrspace(1)* %5, i64 %369
  %377 = load float, float addrspace(1)* %376, align 4, !tbaa !7, !amdgpu.noclobber !5
  %378 = fsub contract float %377, %249
  %379 = fmul contract float %258, %378
  %380 = fadd contract float %252, %379
  %381 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %368
  store float %380, float addrspace(5)* %381, align 4, !tbaa !7
  %382 = or i32 %297, 6
  %383 = zext i32 %382 to i64
  %384 = getelementptr inbounds float, float addrspace(1)* %6, i64 %383
  %385 = load float, float addrspace(1)* %384, align 4, !tbaa !7, !amdgpu.noclobber !5
  %386 = fsub contract float %385, %252
  %387 = fmul contract float %259, %386
  %388 = fadd contract float %249, %387
  %389 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %382
  store float %388, float addrspace(5)* %389, align 8, !tbaa !7
  %390 = getelementptr inbounds float, float addrspace(1)* %5, i64 %383
  %391 = load float, float addrspace(1)* %390, align 4, !tbaa !7, !amdgpu.noclobber !5
  %392 = fsub contract float %391, %249
  %393 = fmul contract float %258, %392
  %394 = fadd contract float %252, %393
  %395 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %382
  store float %394, float addrspace(5)* %395, align 8, !tbaa !7
  %396 = or i32 %297, 7
  %397 = zext i32 %396 to i64
  %398 = getelementptr inbounds float, float addrspace(1)* %6, i64 %397
  %399 = load float, float addrspace(1)* %398, align 4, !tbaa !7, !amdgpu.noclobber !5
  %400 = fsub contract float %399, %252
  %401 = fmul contract float %259, %400
  %402 = fadd contract float %249, %401
  %403 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %396
  store float %402, float addrspace(5)* %403, align 4, !tbaa !7
  %404 = getelementptr inbounds float, float addrspace(1)* %5, i64 %397
  %405 = load float, float addrspace(1)* %404, align 4, !tbaa !7, !amdgpu.noclobber !5
  %406 = fsub contract float %405, %249
  %407 = fmul contract float %258, %406
  %408 = fadd contract float %252, %407
  %409 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %396
  store float %408, float addrspace(5)* %409, align 4, !tbaa !7
  %410 = add nuw i32 %297, 8
  %411 = add i32 %298, 8
  %412 = icmp eq i32 %411, %266
  br i1 %412, label %267, label %296, !llvm.loop !14

413:                                              ; preds = %290, %444
  %414 = phi i32 [ 0, %290 ], [ %446, %444 ]
  %415 = phi i32 [ 0, %290 ], [ %431, %444 ]
  %416 = phi i32 [ 0, %290 ], [ %445, %444 ]
  %417 = zext i32 %414 to i64
  %418 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %13, i32 0, i32 %414
  %419 = load float, float addrspace(5)* %418, align 4, !tbaa !7
  %420 = fcmp contract ogt float %419, %291
  br i1 %420, label %421, label %430

421:                                              ; preds = %413
  %422 = load float, float addrspace(1)* %293, align 4, !tbaa !7, !amdgpu.noclobber !5
  %423 = fcmp contract olt float %419, %422
  br i1 %423, label %424, label %430

424:                                              ; preds = %421
  %425 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %15, i32 0, i32 %415
  store float %419, float addrspace(5)* %425, align 4, !tbaa !7
  %426 = getelementptr inbounds float, float addrspace(1)* %6, i64 %417
  %427 = load float, float addrspace(1)* %426, align 4, !tbaa !7, !amdgpu.noclobber !5
  %428 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %16, i32 0, i32 %415
  store float %427, float addrspace(5)* %428, align 4, !tbaa !7
  %429 = add nsw i32 %415, 1
  br label %430

430:                                              ; preds = %421, %424, %413
  %431 = phi i32 [ %429, %424 ], [ %415, %421 ], [ %415, %413 ]
  %432 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %14, i32 0, i32 %414
  %433 = load float, float addrspace(5)* %432, align 4, !tbaa !7
  %434 = fcmp contract ogt float %433, %294
  br i1 %434, label %435, label %444

435:                                              ; preds = %430
  %436 = load float, float addrspace(1)* %295, align 4, !tbaa !7, !amdgpu.noclobber !5
  %437 = fcmp contract olt float %433, %436
  br i1 %437, label %438, label %444

438:                                              ; preds = %435
  %439 = getelementptr inbounds float, float addrspace(1)* %5, i64 %417
  %440 = load float, float addrspace(1)* %439, align 4, !tbaa !7, !amdgpu.noclobber !5
  %441 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %17, i32 0, i32 %416
  store float %440, float addrspace(5)* %441, align 4, !tbaa !7
  %442 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %18, i32 0, i32 %416
  store float %433, float addrspace(5)* %442, align 4, !tbaa !7
  %443 = add nsw i32 %416, 1
  br label %444

444:                                              ; preds = %430, %438, %435
  %445 = phi i32 [ %443, %438 ], [ %416, %435 ], [ %416, %430 ]
  %446 = add nuw i32 %414, 1
  %447 = icmp eq i32 %414, %3
  br i1 %447, label %448, label %413, !llvm.loop !16

448:                                              ; preds = %444, %217, %289
  %449 = phi i32 [ 0, %289 ], [ 0, %217 ], [ %445, %444 ]
  %450 = phi i32 [ 0, %289 ], [ 0, %217 ], [ %431, %444 ]
  %451 = icmp sgt i32 %450, 0
  %452 = icmp sgt i32 %449, 0
  %453 = select i1 %451, i1 %452, i1 false
  br i1 %238, label %455, label %454

454:                                              ; preds = %448
  br i1 %453, label %520, label %515

455:                                              ; preds = %448
  br i1 %453, label %461, label %456

456:                                              ; preds = %476, %455
  %457 = phi i32 [ 0, %455 ], [ %484, %476 ]
  %458 = phi i32 [ 0, %455 ], [ %479, %476 ]
  %459 = phi i32 [ 0, %455 ], [ %480, %476 ]
  %460 = icmp slt i32 %459, %450
  br i1 %460, label %491, label %488

461:                                              ; preds = %455, %476
  %462 = phi i32 [ %480, %476 ], [ 0, %455 ]
  %463 = phi i32 [ %479, %476 ], [ 0, %455 ]
  %464 = phi i32 [ %484, %476 ], [ 0, %455 ]
  %465 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %15, i32 0, i32 %462
  %466 = load float, float addrspace(5)* %465, align 4, !tbaa !7
  %467 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %17, i32 0, i32 %463
  %468 = load float, float addrspace(5)* %467, align 4, !tbaa !7
  %469 = fcmp contract olt float %466, %468
  br i1 %469, label %470, label %473

470:                                              ; preds = %461
  %471 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %16, i32 0, i32 %462
  %472 = add nsw i32 %462, 1
  br label %476

473:                                              ; preds = %461
  %474 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %18, i32 0, i32 %463
  %475 = add nsw i32 %463, 1
  br label %476

476:                                              ; preds = %473, %470
  %477 = phi float [ %466, %470 ], [ %468, %473 ]
  %478 = phi float addrspace(5)* [ %471, %470 ], [ %474, %473 ]
  %479 = phi i32 [ %463, %470 ], [ %475, %473 ]
  %480 = phi i32 [ %472, %470 ], [ %462, %473 ]
  %481 = load float, float addrspace(5)* %478, align 4, !tbaa !7
  %482 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %19, i32 0, i32 %464
  store float %477, float addrspace(5)* %482, align 4
  %483 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %20, i32 0, i32 %464
  store float %481, float addrspace(5)* %483, align 4
  %484 = add nuw nsw i32 %464, 1
  %485 = icmp slt i32 %480, %450
  %486 = icmp slt i32 %479, %449
  %487 = select i1 %485, i1 %486, i1 false
  br i1 %487, label %461, label %456, !llvm.loop !17

488:                                              ; preds = %491, %456
  %489 = phi i32 [ %457, %456 ], [ %501, %491 ]
  %490 = icmp slt i32 %458, %449
  br i1 %490, label %503, label %578

491:                                              ; preds = %456, %491
  %492 = phi i32 [ %500, %491 ], [ %459, %456 ]
  %493 = phi i32 [ %501, %491 ], [ %457, %456 ]
  %494 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %15, i32 0, i32 %492
  %495 = load float, float addrspace(5)* %494, align 4, !tbaa !7
  %496 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %19, i32 0, i32 %493
  store float %495, float addrspace(5)* %496, align 4, !tbaa !7
  %497 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %16, i32 0, i32 %492
  %498 = load float, float addrspace(5)* %497, align 4, !tbaa !7
  %499 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %20, i32 0, i32 %493
  store float %498, float addrspace(5)* %499, align 4, !tbaa !7
  %500 = add nsw i32 %492, 1
  %501 = add nuw nsw i32 %493, 1
  %502 = icmp slt i32 %500, %450
  br i1 %502, label %491, label %488, !llvm.loop !18

503:                                              ; preds = %488, %503
  %504 = phi i32 [ %512, %503 ], [ %458, %488 ]
  %505 = phi i32 [ %513, %503 ], [ %489, %488 ]
  %506 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %17, i32 0, i32 %504
  %507 = load float, float addrspace(5)* %506, align 4, !tbaa !7
  %508 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %19, i32 0, i32 %505
  store float %507, float addrspace(5)* %508, align 4, !tbaa !7
  %509 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %18, i32 0, i32 %504
  %510 = load float, float addrspace(5)* %509, align 4, !tbaa !7
  %511 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %20, i32 0, i32 %505
  store float %510, float addrspace(5)* %511, align 4, !tbaa !7
  %512 = add nsw i32 %504, 1
  %513 = add nuw nsw i32 %505, 1
  %514 = icmp slt i32 %512, %449
  br i1 %514, label %503, label %578, !llvm.loop !19

515:                                              ; preds = %537, %454
  %516 = phi i32 [ 0, %454 ], [ %545, %537 ]
  %517 = phi i32 [ 0, %454 ], [ %540, %537 ]
  %518 = phi i32 [ 0, %454 ], [ %541, %537 ]
  %519 = icmp slt i32 %518, %450
  br i1 %519, label %552, label %549

520:                                              ; preds = %454, %537
  %521 = phi i32 [ %541, %537 ], [ 0, %454 ]
  %522 = phi i32 [ %540, %537 ], [ 0, %454 ]
  %523 = phi i32 [ %545, %537 ], [ 0, %454 ]
  %524 = xor i32 %521, -1
  %525 = add i32 %450, %524
  %526 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %15, i32 0, i32 %525
  %527 = load float, float addrspace(5)* %526, align 4, !tbaa !7
  %528 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %17, i32 0, i32 %522
  %529 = load float, float addrspace(5)* %528, align 4, !tbaa !7
  %530 = fcmp contract olt float %527, %529
  br i1 %530, label %531, label %534

531:                                              ; preds = %520
  %532 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %16, i32 0, i32 %525
  %533 = add nsw i32 %521, 1
  br label %537

534:                                              ; preds = %520
  %535 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %18, i32 0, i32 %522
  %536 = add nsw i32 %522, 1
  br label %537

537:                                              ; preds = %534, %531
  %538 = phi float [ %527, %531 ], [ %529, %534 ]
  %539 = phi float addrspace(5)* [ %532, %531 ], [ %535, %534 ]
  %540 = phi i32 [ %522, %531 ], [ %536, %534 ]
  %541 = phi i32 [ %533, %531 ], [ %521, %534 ]
  %542 = load float, float addrspace(5)* %539, align 4, !tbaa !7
  %543 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %19, i32 0, i32 %523
  store float %538, float addrspace(5)* %543, align 4
  %544 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %20, i32 0, i32 %523
  store float %542, float addrspace(5)* %544, align 4
  %545 = add nuw nsw i32 %523, 1
  %546 = icmp slt i32 %541, %450
  %547 = icmp slt i32 %540, %449
  %548 = select i1 %546, i1 %547, i1 false
  br i1 %548, label %520, label %515, !llvm.loop !20

549:                                              ; preds = %552, %515
  %550 = phi i32 [ %516, %515 ], [ %564, %552 ]
  %551 = icmp slt i32 %517, %449
  br i1 %551, label %566, label %578

552:                                              ; preds = %515, %552
  %553 = phi i32 [ %563, %552 ], [ %518, %515 ]
  %554 = phi i32 [ %564, %552 ], [ %516, %515 ]
  %555 = xor i32 %553, -1
  %556 = add i32 %450, %555
  %557 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %15, i32 0, i32 %556
  %558 = load float, float addrspace(5)* %557, align 4, !tbaa !7
  %559 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %19, i32 0, i32 %554
  store float %558, float addrspace(5)* %559, align 4, !tbaa !7
  %560 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %16, i32 0, i32 %556
  %561 = load float, float addrspace(5)* %560, align 4, !tbaa !7
  %562 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %20, i32 0, i32 %554
  store float %561, float addrspace(5)* %562, align 4, !tbaa !7
  %563 = add nsw i32 %553, 1
  %564 = add nuw nsw i32 %554, 1
  %565 = icmp slt i32 %563, %450
  br i1 %565, label %552, label %549, !llvm.loop !21

566:                                              ; preds = %549, %566
  %567 = phi i32 [ %575, %566 ], [ %517, %549 ]
  %568 = phi i32 [ %576, %566 ], [ %550, %549 ]
  %569 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %17, i32 0, i32 %567
  %570 = load float, float addrspace(5)* %569, align 4, !tbaa !7
  %571 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %19, i32 0, i32 %568
  store float %570, float addrspace(5)* %571, align 4, !tbaa !7
  %572 = getelementptr inbounds [256 x float], [256 x float] addrspace(5)* %18, i32 0, i32 %567
  %573 = load float, float addrspace(5)* %572, align 4, !tbaa !7
  %574 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %20, i32 0, i32 %568
  store float %573, float addrspace(5)* %574, align 4, !tbaa !7
  %575 = add nsw i32 %567, 1
  %576 = add nuw nsw i32 %568, 1
  %577 = icmp slt i32 %575, %449
  br i1 %577, label %566, label %578, !llvm.loop !22

578:                                              ; preds = %566, %503, %549, %488
  %579 = add nsw i32 %449, -1
  %580 = add i32 %579, %450
  %581 = icmp sgt i32 %580, 0
  br i1 %581, label %582, label %673

582:                                              ; preds = %578
  %583 = sitofp i32 %3 to double
  %584 = fmul contract double %583, 5.000000e-01
  %585 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %19, i32 0, i32 0
  %586 = load float, float addrspace(5)* %585, align 16, !tbaa !7
  %587 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %20, i32 0, i32 0
  %588 = load float, float addrspace(5)* %587, align 16, !tbaa !7
  br label %597

589:                                              ; preds = %597
  br i1 %581, label %590, label %673

590:                                              ; preds = %589
  %591 = add i32 %449, %450
  %592 = add i32 %591, -2
  %593 = and i32 %580, 7
  %594 = icmp ult i32 %592, 7
  br i1 %594, label %657, label %595

595:                                              ; preds = %590
  %596 = and i32 %580, -8
  br label %688

597:                                              ; preds = %582, %597
  %598 = phi float [ %588, %582 ], [ %606, %597 ]
  %599 = phi float [ %586, %582 ], [ %603, %597 ]
  %600 = phi i32 [ 0, %582 ], [ %601, %597 ]
  %601 = add nuw nsw i32 %600, 1
  %602 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %19, i32 0, i32 %601
  %603 = load float, float addrspace(5)* %602, align 4, !tbaa !7
  %604 = fsub contract float %603, %599
  %605 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %20, i32 0, i32 %601
  %606 = load float, float addrspace(5)* %605, align 4, !tbaa !7
  %607 = fsub contract float %606, %598
  %608 = fmul contract float %604, %604
  %609 = fmul contract float %607, %607
  %610 = fadd contract float %608, %609
  %611 = fcmp olt float %610, 0x39F0000000000000
  %612 = select i1 %611, float 0x41F0000000000000, float 1.000000e+00
  %613 = fmul float %610, %612
  %614 = tail call float @llvm.sqrt.f32(float %613)
  %615 = bitcast float %614 to i32
  %616 = add nsw i32 %615, -1
  %617 = bitcast i32 %616 to float
  %618 = add nsw i32 %615, 1
  %619 = bitcast i32 %618 to float
  %620 = tail call i1 @llvm.amdgcn.class.f32(float %613, i32 608)
  %621 = select i1 %611, float 0x3EF0000000000000, float 1.000000e+00
  %622 = fneg float %619
  %623 = tail call float @llvm.fma.f32(float %622, float %614, float %613)
  %624 = fcmp ogt float %623, 0.000000e+00
  %625 = fneg float %617
  %626 = tail call float @llvm.fma.f32(float %625, float %614, float %613)
  %627 = fcmp ole float %626, 0.000000e+00
  %628 = select i1 %627, float %617, float %614
  %629 = select i1 %624, float %619, float %628
  %630 = fmul float %621, %629
  %631 = select i1 %620, float %613, float %630
  %632 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %600
  store float %631, float addrspace(5)* %632, align 4, !tbaa !7
  %633 = fadd contract float %603, %599
  %634 = fmul contract float %633, 5.000000e-01
  %635 = fadd contract float %606, %598
  %636 = fmul contract float %635, 5.000000e-01
  %637 = fpext float %634 to double
  %638 = fadd contract double %584, %637
  %639 = fptrunc double %638 to float
  %640 = fpext float %636 to double
  %641 = fadd contract double %584, %640
  %642 = fptrunc double %641 to float
  %643 = fptosi double %638 to i32
  %644 = fptosi double %641 to i32
  %645 = sitofp i32 %643 to float
  %646 = fcmp contract ogt float %645, %639
  %647 = sext i1 %646 to i32
  %648 = add i32 %647, %643
  %649 = sitofp i32 %644 to float
  %650 = fcmp contract ogt float %649, %642
  %651 = sext i1 %650 to i32
  %652 = add i32 %651, %644
  %653 = mul nsw i32 %652, %3
  %654 = add nsw i32 %648, %653
  %655 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %600
  store i32 %654, i32 addrspace(5)* %655, align 4, !tbaa !23
  %656 = icmp eq i32 %601, %580
  br i1 %656, label %589, label %597, !llvm.loop !25

657:                                              ; preds = %688, %590
  %658 = phi i32 [ 0, %590 ], [ %754, %688 ]
  %659 = icmp eq i32 %593, 0
  br i1 %659, label %673, label %660

660:                                              ; preds = %657, %660
  %661 = phi i32 [ %670, %660 ], [ %658, %657 ]
  %662 = phi i32 [ %671, %660 ], [ 0, %657 ]
  %663 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %661
  %664 = load i32, i32 addrspace(5)* %663, align 4, !tbaa !23
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds float, float addrspace(1)* %7, i64 %665
  %667 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %661
  %668 = load float, float addrspace(5)* %667, align 4, !tbaa !7
  %669 = atomicrmw fadd float addrspace(1)* %666, float %668 syncscope("agent-one-as") monotonic, align 4
  %670 = add nuw nsw i32 %661, 1
  %671 = add i32 %662, 1
  %672 = icmp eq i32 %671, %593
  br i1 %672, label %673, label %660, !llvm.loop !26

673:                                              ; preds = %657, %660, %578, %589
  %674 = icmp sgt i32 %4, 0
  br i1 %674, label %675, label %1027

675:                                              ; preds = %673
  %676 = mul i32 %3, %3
  %677 = mul i32 %31, %4
  %678 = add i32 %449, %450
  %679 = add i32 %678, -2
  %680 = and i32 %580, 7
  %681 = icmp ult i32 %679, 7
  %682 = and i32 %580, -8
  %683 = icmp eq i32 %680, 0
  %684 = and i32 %580, 7
  %685 = icmp ult i32 %679, 7
  %686 = and i32 %580, -8
  %687 = icmp eq i32 %684, 0
  br label %757

688:                                              ; preds = %688, %595
  %689 = phi i32 [ 0, %595 ], [ %754, %688 ]
  %690 = phi i32 [ 0, %595 ], [ %755, %688 ]
  %691 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %689
  %692 = load i32, i32 addrspace(5)* %691, align 16, !tbaa !23
  %693 = sext i32 %692 to i64
  %694 = getelementptr inbounds float, float addrspace(1)* %7, i64 %693
  %695 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %689
  %696 = load float, float addrspace(5)* %695, align 16, !tbaa !7
  %697 = atomicrmw fadd float addrspace(1)* %694, float %696 syncscope("agent-one-as") monotonic, align 4
  %698 = or i32 %689, 1
  %699 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %698
  %700 = load i32, i32 addrspace(5)* %699, align 4, !tbaa !23
  %701 = sext i32 %700 to i64
  %702 = getelementptr inbounds float, float addrspace(1)* %7, i64 %701
  %703 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %698
  %704 = load float, float addrspace(5)* %703, align 4, !tbaa !7
  %705 = atomicrmw fadd float addrspace(1)* %702, float %704 syncscope("agent-one-as") monotonic, align 4
  %706 = or i32 %689, 2
  %707 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %706
  %708 = load i32, i32 addrspace(5)* %707, align 8, !tbaa !23
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds float, float addrspace(1)* %7, i64 %709
  %711 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %706
  %712 = load float, float addrspace(5)* %711, align 8, !tbaa !7
  %713 = atomicrmw fadd float addrspace(1)* %710, float %712 syncscope("agent-one-as") monotonic, align 4
  %714 = or i32 %689, 3
  %715 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %714
  %716 = load i32, i32 addrspace(5)* %715, align 4, !tbaa !23
  %717 = sext i32 %716 to i64
  %718 = getelementptr inbounds float, float addrspace(1)* %7, i64 %717
  %719 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %714
  %720 = load float, float addrspace(5)* %719, align 4, !tbaa !7
  %721 = atomicrmw fadd float addrspace(1)* %718, float %720 syncscope("agent-one-as") monotonic, align 4
  %722 = or i32 %689, 4
  %723 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %722
  %724 = load i32, i32 addrspace(5)* %723, align 16, !tbaa !23
  %725 = sext i32 %724 to i64
  %726 = getelementptr inbounds float, float addrspace(1)* %7, i64 %725
  %727 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %722
  %728 = load float, float addrspace(5)* %727, align 16, !tbaa !7
  %729 = atomicrmw fadd float addrspace(1)* %726, float %728 syncscope("agent-one-as") monotonic, align 4
  %730 = or i32 %689, 5
  %731 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %730
  %732 = load i32, i32 addrspace(5)* %731, align 4, !tbaa !23
  %733 = sext i32 %732 to i64
  %734 = getelementptr inbounds float, float addrspace(1)* %7, i64 %733
  %735 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %730
  %736 = load float, float addrspace(5)* %735, align 4, !tbaa !7
  %737 = atomicrmw fadd float addrspace(1)* %734, float %736 syncscope("agent-one-as") monotonic, align 4
  %738 = or i32 %689, 6
  %739 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %738
  %740 = load i32, i32 addrspace(5)* %739, align 8, !tbaa !23
  %741 = sext i32 %740 to i64
  %742 = getelementptr inbounds float, float addrspace(1)* %7, i64 %741
  %743 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %738
  %744 = load float, float addrspace(5)* %743, align 8, !tbaa !7
  %745 = atomicrmw fadd float addrspace(1)* %742, float %744 syncscope("agent-one-as") monotonic, align 4
  %746 = or i32 %689, 7
  %747 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %746
  %748 = load i32, i32 addrspace(5)* %747, align 4, !tbaa !23
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds float, float addrspace(1)* %7, i64 %749
  %751 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %746
  %752 = load float, float addrspace(5)* %751, align 4, !tbaa !7
  %753 = atomicrmw fadd float addrspace(1)* %750, float %752 syncscope("agent-one-as") monotonic, align 4
  %754 = add nuw nsw i32 %689, 8
  %755 = add i32 %690, 8
  %756 = icmp eq i32 %755, %596
  br i1 %756, label %657, label %688, !llvm.loop !27

757:                                              ; preds = %675, %1024
  %758 = phi i32 [ 0, %675 ], [ %1025, %1024 ]
  %759 = mul i32 %676, %758
  %760 = add i32 %758, %677
  %761 = mul i32 %760, %2
  %762 = add i32 %761, %39
  br i1 %581, label %763, label %879

763:                                              ; preds = %757
  br i1 %681, label %858, label %764

764:                                              ; preds = %763, %764
  %765 = phi float [ %854, %764 ], [ 0.000000e+00, %763 ]
  %766 = phi i32 [ %855, %764 ], [ 0, %763 ]
  %767 = phi i32 [ %856, %764 ], [ 0, %763 ]
  %768 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %766
  %769 = load i32, i32 addrspace(5)* %768, align 16, !tbaa !23
  %770 = add nsw i32 %769, %759
  %771 = sext i32 %770 to i64
  %772 = getelementptr inbounds float, float addrspace(1)* %10, i64 %771
  %773 = load float, float addrspace(1)* %772, align 4, !tbaa !7
  %774 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %766
  %775 = load float, float addrspace(5)* %774, align 16, !tbaa !7
  %776 = fmul contract float %773, %775
  %777 = fadd contract float %765, %776
  %778 = or i32 %766, 1
  %779 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %778
  %780 = load i32, i32 addrspace(5)* %779, align 4, !tbaa !23
  %781 = add nsw i32 %780, %759
  %782 = sext i32 %781 to i64
  %783 = getelementptr inbounds float, float addrspace(1)* %10, i64 %782
  %784 = load float, float addrspace(1)* %783, align 4, !tbaa !7
  %785 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %778
  %786 = load float, float addrspace(5)* %785, align 4, !tbaa !7
  %787 = fmul contract float %784, %786
  %788 = fadd contract float %777, %787
  %789 = or i32 %766, 2
  %790 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %789
  %791 = load i32, i32 addrspace(5)* %790, align 8, !tbaa !23
  %792 = add nsw i32 %791, %759
  %793 = sext i32 %792 to i64
  %794 = getelementptr inbounds float, float addrspace(1)* %10, i64 %793
  %795 = load float, float addrspace(1)* %794, align 4, !tbaa !7
  %796 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %789
  %797 = load float, float addrspace(5)* %796, align 8, !tbaa !7
  %798 = fmul contract float %795, %797
  %799 = fadd contract float %788, %798
  %800 = or i32 %766, 3
  %801 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %800
  %802 = load i32, i32 addrspace(5)* %801, align 4, !tbaa !23
  %803 = add nsw i32 %802, %759
  %804 = sext i32 %803 to i64
  %805 = getelementptr inbounds float, float addrspace(1)* %10, i64 %804
  %806 = load float, float addrspace(1)* %805, align 4, !tbaa !7
  %807 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %800
  %808 = load float, float addrspace(5)* %807, align 4, !tbaa !7
  %809 = fmul contract float %806, %808
  %810 = fadd contract float %799, %809
  %811 = or i32 %766, 4
  %812 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %811
  %813 = load i32, i32 addrspace(5)* %812, align 16, !tbaa !23
  %814 = add nsw i32 %813, %759
  %815 = sext i32 %814 to i64
  %816 = getelementptr inbounds float, float addrspace(1)* %10, i64 %815
  %817 = load float, float addrspace(1)* %816, align 4, !tbaa !7
  %818 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %811
  %819 = load float, float addrspace(5)* %818, align 16, !tbaa !7
  %820 = fmul contract float %817, %819
  %821 = fadd contract float %810, %820
  %822 = or i32 %766, 5
  %823 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %822
  %824 = load i32, i32 addrspace(5)* %823, align 4, !tbaa !23
  %825 = add nsw i32 %824, %759
  %826 = sext i32 %825 to i64
  %827 = getelementptr inbounds float, float addrspace(1)* %10, i64 %826
  %828 = load float, float addrspace(1)* %827, align 4, !tbaa !7
  %829 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %822
  %830 = load float, float addrspace(5)* %829, align 4, !tbaa !7
  %831 = fmul contract float %828, %830
  %832 = fadd contract float %821, %831
  %833 = or i32 %766, 6
  %834 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %833
  %835 = load i32, i32 addrspace(5)* %834, align 8, !tbaa !23
  %836 = add nsw i32 %835, %759
  %837 = sext i32 %836 to i64
  %838 = getelementptr inbounds float, float addrspace(1)* %10, i64 %837
  %839 = load float, float addrspace(1)* %838, align 4, !tbaa !7
  %840 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %833
  %841 = load float, float addrspace(5)* %840, align 8, !tbaa !7
  %842 = fmul contract float %839, %841
  %843 = fadd contract float %832, %842
  %844 = or i32 %766, 7
  %845 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %844
  %846 = load i32, i32 addrspace(5)* %845, align 4, !tbaa !23
  %847 = add nsw i32 %846, %759
  %848 = sext i32 %847 to i64
  %849 = getelementptr inbounds float, float addrspace(1)* %10, i64 %848
  %850 = load float, float addrspace(1)* %849, align 4, !tbaa !7
  %851 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %844
  %852 = load float, float addrspace(5)* %851, align 4, !tbaa !7
  %853 = fmul contract float %850, %852
  %854 = fadd contract float %843, %853
  %855 = add nuw nsw i32 %766, 8
  %856 = add i32 %767, 8
  %857 = icmp eq i32 %856, %682
  br i1 %857, label %858, label %764, !llvm.loop !28

858:                                              ; preds = %764, %763
  %859 = phi float [ undef, %763 ], [ %854, %764 ]
  %860 = phi float [ 0.000000e+00, %763 ], [ %854, %764 ]
  %861 = phi i32 [ 0, %763 ], [ %855, %764 ]
  br i1 %683, label %879, label %862

862:                                              ; preds = %858, %862
  %863 = phi float [ %875, %862 ], [ %860, %858 ]
  %864 = phi i32 [ %876, %862 ], [ %861, %858 ]
  %865 = phi i32 [ %877, %862 ], [ 0, %858 ]
  %866 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %864
  %867 = load i32, i32 addrspace(5)* %866, align 4, !tbaa !23
  %868 = add nsw i32 %867, %759
  %869 = sext i32 %868 to i64
  %870 = getelementptr inbounds float, float addrspace(1)* %10, i64 %869
  %871 = load float, float addrspace(1)* %870, align 4, !tbaa !7
  %872 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %864
  %873 = load float, float addrspace(5)* %872, align 4, !tbaa !7
  %874 = fmul contract float %871, %873
  %875 = fadd contract float %863, %874
  %876 = add nuw nsw i32 %864, 1
  %877 = add i32 %865, 1
  %878 = icmp eq i32 %877, %680
  br i1 %878, label %879, label %862, !llvm.loop !29

879:                                              ; preds = %858, %862, %757
  %880 = phi float [ 0.000000e+00, %757 ], [ %859, %858 ], [ %875, %862 ]
  %881 = sext i32 %762 to i64
  %882 = getelementptr inbounds float, float addrspace(1)* %9, i64 %881
  %883 = load float, float addrspace(1)* %882, align 4, !tbaa !7
  %884 = fdiv contract float %883, %880
  br i1 %581, label %885, label %1024

885:                                              ; preds = %879
  br i1 %685, label %1003, label %886

886:                                              ; preds = %885, %886
  %887 = phi i32 [ %1000, %886 ], [ 0, %885 ]
  %888 = phi i32 [ %1001, %886 ], [ 0, %885 ]
  %889 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %887
  %890 = load i32, i32 addrspace(5)* %889, align 16, !tbaa !23
  %891 = add nsw i32 %890, %759
  %892 = sext i32 %891 to i64
  %893 = getelementptr inbounds float, float addrspace(1)* %8, i64 %892
  %894 = getelementptr inbounds float, float addrspace(1)* %10, i64 %892
  %895 = load float, float addrspace(1)* %894, align 4, !tbaa !7
  %896 = fneg contract float %895
  %897 = fmul contract float %884, %896
  %898 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %887
  %899 = load float, float addrspace(5)* %898, align 16, !tbaa !7
  %900 = fmul contract float %897, %899
  %901 = atomicrmw fadd float addrspace(1)* %893, float %900 syncscope("agent-one-as") monotonic, align 4
  %902 = or i32 %887, 1
  %903 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %902
  %904 = load i32, i32 addrspace(5)* %903, align 4, !tbaa !23
  %905 = add nsw i32 %904, %759
  %906 = sext i32 %905 to i64
  %907 = getelementptr inbounds float, float addrspace(1)* %8, i64 %906
  %908 = getelementptr inbounds float, float addrspace(1)* %10, i64 %906
  %909 = load float, float addrspace(1)* %908, align 4, !tbaa !7
  %910 = fneg contract float %909
  %911 = fmul contract float %884, %910
  %912 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %902
  %913 = load float, float addrspace(5)* %912, align 4, !tbaa !7
  %914 = fmul contract float %911, %913
  %915 = atomicrmw fadd float addrspace(1)* %907, float %914 syncscope("agent-one-as") monotonic, align 4
  %916 = or i32 %887, 2
  %917 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %916
  %918 = load i32, i32 addrspace(5)* %917, align 8, !tbaa !23
  %919 = add nsw i32 %918, %759
  %920 = sext i32 %919 to i64
  %921 = getelementptr inbounds float, float addrspace(1)* %8, i64 %920
  %922 = getelementptr inbounds float, float addrspace(1)* %10, i64 %920
  %923 = load float, float addrspace(1)* %922, align 4, !tbaa !7
  %924 = fneg contract float %923
  %925 = fmul contract float %884, %924
  %926 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %916
  %927 = load float, float addrspace(5)* %926, align 8, !tbaa !7
  %928 = fmul contract float %925, %927
  %929 = atomicrmw fadd float addrspace(1)* %921, float %928 syncscope("agent-one-as") monotonic, align 4
  %930 = or i32 %887, 3
  %931 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %930
  %932 = load i32, i32 addrspace(5)* %931, align 4, !tbaa !23
  %933 = add nsw i32 %932, %759
  %934 = sext i32 %933 to i64
  %935 = getelementptr inbounds float, float addrspace(1)* %8, i64 %934
  %936 = getelementptr inbounds float, float addrspace(1)* %10, i64 %934
  %937 = load float, float addrspace(1)* %936, align 4, !tbaa !7
  %938 = fneg contract float %937
  %939 = fmul contract float %884, %938
  %940 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %930
  %941 = load float, float addrspace(5)* %940, align 4, !tbaa !7
  %942 = fmul contract float %939, %941
  %943 = atomicrmw fadd float addrspace(1)* %935, float %942 syncscope("agent-one-as") monotonic, align 4
  %944 = or i32 %887, 4
  %945 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %944
  %946 = load i32, i32 addrspace(5)* %945, align 16, !tbaa !23
  %947 = add nsw i32 %946, %759
  %948 = sext i32 %947 to i64
  %949 = getelementptr inbounds float, float addrspace(1)* %8, i64 %948
  %950 = getelementptr inbounds float, float addrspace(1)* %10, i64 %948
  %951 = load float, float addrspace(1)* %950, align 4, !tbaa !7
  %952 = fneg contract float %951
  %953 = fmul contract float %884, %952
  %954 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %944
  %955 = load float, float addrspace(5)* %954, align 16, !tbaa !7
  %956 = fmul contract float %953, %955
  %957 = atomicrmw fadd float addrspace(1)* %949, float %956 syncscope("agent-one-as") monotonic, align 4
  %958 = or i32 %887, 5
  %959 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %958
  %960 = load i32, i32 addrspace(5)* %959, align 4, !tbaa !23
  %961 = add nsw i32 %960, %759
  %962 = sext i32 %961 to i64
  %963 = getelementptr inbounds float, float addrspace(1)* %8, i64 %962
  %964 = getelementptr inbounds float, float addrspace(1)* %10, i64 %962
  %965 = load float, float addrspace(1)* %964, align 4, !tbaa !7
  %966 = fneg contract float %965
  %967 = fmul contract float %884, %966
  %968 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %958
  %969 = load float, float addrspace(5)* %968, align 4, !tbaa !7
  %970 = fmul contract float %967, %969
  %971 = atomicrmw fadd float addrspace(1)* %963, float %970 syncscope("agent-one-as") monotonic, align 4
  %972 = or i32 %887, 6
  %973 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %972
  %974 = load i32, i32 addrspace(5)* %973, align 8, !tbaa !23
  %975 = add nsw i32 %974, %759
  %976 = sext i32 %975 to i64
  %977 = getelementptr inbounds float, float addrspace(1)* %8, i64 %976
  %978 = getelementptr inbounds float, float addrspace(1)* %10, i64 %976
  %979 = load float, float addrspace(1)* %978, align 4, !tbaa !7
  %980 = fneg contract float %979
  %981 = fmul contract float %884, %980
  %982 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %972
  %983 = load float, float addrspace(5)* %982, align 8, !tbaa !7
  %984 = fmul contract float %981, %983
  %985 = atomicrmw fadd float addrspace(1)* %977, float %984 syncscope("agent-one-as") monotonic, align 4
  %986 = or i32 %887, 7
  %987 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %986
  %988 = load i32, i32 addrspace(5)* %987, align 4, !tbaa !23
  %989 = add nsw i32 %988, %759
  %990 = sext i32 %989 to i64
  %991 = getelementptr inbounds float, float addrspace(1)* %8, i64 %990
  %992 = getelementptr inbounds float, float addrspace(1)* %10, i64 %990
  %993 = load float, float addrspace(1)* %992, align 4, !tbaa !7
  %994 = fneg contract float %993
  %995 = fmul contract float %884, %994
  %996 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %986
  %997 = load float, float addrspace(5)* %996, align 4, !tbaa !7
  %998 = fmul contract float %995, %997
  %999 = atomicrmw fadd float addrspace(1)* %991, float %998 syncscope("agent-one-as") monotonic, align 4
  %1000 = add nuw nsw i32 %887, 8
  %1001 = add i32 %888, 8
  %1002 = icmp eq i32 %1001, %686
  br i1 %1002, label %1003, label %886, !llvm.loop !30

1003:                                             ; preds = %886, %885
  %1004 = phi i32 [ 0, %885 ], [ %1000, %886 ]
  br i1 %687, label %1024, label %1005

1005:                                             ; preds = %1003, %1005
  %1006 = phi i32 [ %1021, %1005 ], [ %1004, %1003 ]
  %1007 = phi i32 [ %1022, %1005 ], [ 0, %1003 ]
  %1008 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(5)* %22, i32 0, i32 %1006
  %1009 = load i32, i32 addrspace(5)* %1008, align 4, !tbaa !23
  %1010 = add nsw i32 %1009, %759
  %1011 = sext i32 %1010 to i64
  %1012 = getelementptr inbounds float, float addrspace(1)* %8, i64 %1011
  %1013 = getelementptr inbounds float, float addrspace(1)* %10, i64 %1011
  %1014 = load float, float addrspace(1)* %1013, align 4, !tbaa !7
  %1015 = fneg contract float %1014
  %1016 = fmul contract float %884, %1015
  %1017 = getelementptr inbounds [512 x float], [512 x float] addrspace(5)* %21, i32 0, i32 %1006
  %1018 = load float, float addrspace(5)* %1017, align 4, !tbaa !7
  %1019 = fmul contract float %1016, %1018
  %1020 = atomicrmw fadd float addrspace(1)* %1012, float %1019 syncscope("agent-one-as") monotonic, align 4
  %1021 = add nuw nsw i32 %1006, 1
  %1022 = add i32 %1007, 1
  %1023 = icmp eq i32 %1022, %684
  br i1 %1023, label %1024, label %1005, !llvm.loop !31

1024:                                             ; preds = %1003, %1005, %879
  %1025 = add nuw nsw i32 %758, 1
  %1026 = icmp eq i32 %1025, %4
  br i1 %1026, label %1027, label %757, !llvm.loop !32

1027:                                             ; preds = %1024, %673, %12
  call void @llvm.lifetime.end.p5i8(i64 2048, i8 addrspace(5)* %49) #4
  call void @llvm.lifetime.end.p5i8(i64 2048, i8 addrspace(5)* %48) #4
  call void @llvm.lifetime.end.p5i8(i64 2048, i8 addrspace(5)* %47) #4
  call void @llvm.lifetime.end.p5i8(i64 2048, i8 addrspace(5)* %46) #4
  call void @llvm.lifetime.end.p5i8(i64 1024, i8 addrspace(5)* %45) #4
  call void @llvm.lifetime.end.p5i8(i64 1024, i8 addrspace(5)* %44) #4
  call void @llvm.lifetime.end.p5i8(i64 1024, i8 addrspace(5)* %43) #4
  call void @llvm.lifetime.end.p5i8(i64 1024, i8 addrspace(5)* %42) #4
  call void @llvm.lifetime.end.p5i8(i64 1024, i8 addrspace(5)* %41) #4
  call void @llvm.lifetime.end.p5i8(i64 1024, i8 addrspace(5)* %40) #4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

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
attributes #1 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i32 0, i32 33}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !15}
!19 = distinct !{!19, !15}
!20 = distinct !{!20, !15}
!21 = distinct !{!21, !15}
!22 = distinct !{!22, !15}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !9, i64 0}
!25 = distinct !{!25, !15}
!26 = distinct !{!26, !13}
!27 = distinct !{!27, !15}
!28 = distinct !{!28, !15}
!29 = distinct !{!29, !13}
!30 = distinct !{!30, !15}
!31 = distinct !{!31, !13}
!32 = distinct !{!32, !15}
