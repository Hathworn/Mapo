; ModuleID = '../data/hip_kernels/13201/5/main.cu'
source_filename = "../data/hip_kernels/13201/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z22computeVertices_kernelP15HIP_vector_typeIfLj4EEjjf(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = uitofp i32 %13 to float
  %23 = uitofp i32 %1 to float
  %24 = fdiv contract float %22, %23
  %25 = uitofp i32 %21 to float
  %26 = uitofp i32 %2 to float
  %27 = fdiv contract float %25, %26
  %28 = fpext float %24 to double
  %29 = fmul contract double %28, 2.000000e+00
  %30 = fadd contract double %29, -1.000000e+00
  %31 = fptrunc double %30 to float
  %32 = fpext float %27 to double
  %33 = fmul contract double %32, 2.000000e+00
  %34 = fadd contract double %33, -1.000000e+00
  %35 = fptrunc double %34 to float
  %36 = fmul contract float %31, 4.000000e+00
  %37 = fadd contract float %36, %3
  %38 = tail call float @llvm.fabs.f32(float %37)
  %39 = fcmp olt float %38, 1.310720e+05
  br i1 %39, label %40, label %48

40:                                               ; preds = %4
  %41 = fmul float %38, 0x3FE45F3060000000
  %42 = tail call float @llvm.rint.f32(float %41)
  %43 = tail call float @llvm.fma.f32(float %42, float 0xBFF921FB40000000, float %38)
  %44 = tail call float @llvm.fma.f32(float %42, float 0xBE74442D00000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %42, float 0xBCF8469880000000, float %44)
  %46 = fptosi float %42 to i32
  %47 = bitcast float %38 to i32
  br label %154

48:                                               ; preds = %4
  %49 = bitcast float %38 to i32
  %50 = lshr i32 %49, 23
  %51 = and i32 %49, 8388607
  %52 = or i32 %51, 8388608
  %53 = zext i32 %52 to i64
  %54 = mul nuw nsw i64 %53, 4266746795
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %54, 32
  %57 = mul nuw nsw i64 %53, 1011060801
  %58 = add nuw nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = mul nuw nsw i64 %53, 3680671129
  %62 = add nuw nsw i64 %60, %61
  %63 = trunc i64 %62 to i32
  %64 = lshr i64 %62, 32
  %65 = mul nuw nsw i64 %53, 4113882560
  %66 = add nuw nsw i64 %64, %65
  %67 = trunc i64 %66 to i32
  %68 = lshr i64 %66, 32
  %69 = mul nuw nsw i64 %53, 4230436817
  %70 = add nuw nsw i64 %68, %69
  %71 = trunc i64 %70 to i32
  %72 = lshr i64 %70, 32
  %73 = mul nuw nsw i64 %53, 1313084713
  %74 = add nuw nsw i64 %72, %73
  %75 = trunc i64 %74 to i32
  %76 = lshr i64 %74, 32
  %77 = mul nuw nsw i64 %53, 2734261102
  %78 = add nuw nsw i64 %76, %77
  %79 = trunc i64 %78 to i32
  %80 = lshr i64 %78, 32
  %81 = trunc i64 %80 to i32
  %82 = add nsw i32 %50, -120
  %83 = icmp ugt i32 %82, 63
  %84 = select i1 %83, i32 %75, i32 %81
  %85 = select i1 %83, i32 %71, i32 %79
  %86 = select i1 %83, i32 %67, i32 %75
  %87 = select i1 %83, i32 %63, i32 %71
  %88 = select i1 %83, i32 %59, i32 %67
  %89 = select i1 %83, i32 %55, i32 %63
  %90 = select i1 %83, i32 -64, i32 0
  %91 = add nsw i32 %90, %82
  %92 = icmp ugt i32 %91, 31
  %93 = select i1 %92, i32 %85, i32 %84
  %94 = select i1 %92, i32 %86, i32 %85
  %95 = select i1 %92, i32 %87, i32 %86
  %96 = select i1 %92, i32 %88, i32 %87
  %97 = select i1 %92, i32 %89, i32 %88
  %98 = select i1 %92, i32 -32, i32 0
  %99 = add nsw i32 %98, %91
  %100 = icmp ugt i32 %99, 31
  %101 = select i1 %100, i32 %94, i32 %93
  %102 = select i1 %100, i32 %95, i32 %94
  %103 = select i1 %100, i32 %96, i32 %95
  %104 = select i1 %100, i32 %97, i32 %96
  %105 = select i1 %100, i32 -32, i32 0
  %106 = add nsw i32 %105, %99
  %107 = icmp eq i32 %106, 0
  %108 = sub nsw i32 32, %106
  %109 = tail call i32 @llvm.fshr.i32(i32 %101, i32 %102, i32 %108)
  %110 = tail call i32 @llvm.fshr.i32(i32 %102, i32 %103, i32 %108)
  %111 = tail call i32 @llvm.fshr.i32(i32 %103, i32 %104, i32 %108)
  %112 = select i1 %107, i32 %101, i32 %109
  %113 = select i1 %107, i32 %102, i32 %110
  %114 = select i1 %107, i32 %103, i32 %111
  %115 = lshr i32 %112, 29
  %116 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %113, i32 2)
  %117 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %114, i32 2)
  %118 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %104, i32 2)
  %119 = and i32 %115, 1
  %120 = sub nsw i32 0, %119
  %121 = shl i32 %115, 31
  %122 = xor i32 %116, %120
  %123 = xor i32 %117, %120
  %124 = xor i32 %118, %120
  %125 = tail call i32 @llvm.ctlz.i32(i32 %122, i1 false), !range !7
  %126 = sub nsw i32 31, %125
  %127 = tail call i32 @llvm.fshr.i32(i32 %122, i32 %123, i32 %126)
  %128 = tail call i32 @llvm.fshr.i32(i32 %123, i32 %124, i32 %126)
  %129 = shl nuw nsw i32 %125, 23
  %130 = sub nuw nsw i32 1056964608, %129
  %131 = lshr i32 %127, 9
  %132 = or i32 %131, %130
  %133 = or i32 %132, %121
  %134 = bitcast i32 %133 to float
  %135 = tail call i32 @llvm.fshl.i32(i32 %127, i32 %128, i32 23)
  %136 = tail call i32 @llvm.ctlz.i32(i32 %135, i1 false), !range !7
  %137 = fmul float %134, 0x3FF921FB40000000
  %138 = add nuw nsw i32 %136, %125
  %139 = shl nuw nsw i32 %138, 23
  %140 = sub nuw nsw i32 855638016, %139
  %141 = sub nsw i32 31, %136
  %142 = tail call i32 @llvm.fshr.i32(i32 %135, i32 %128, i32 %141)
  %143 = lshr i32 %142, 9
  %144 = or i32 %140, %143
  %145 = or i32 %144, %121
  %146 = bitcast i32 %145 to float
  %147 = fneg float %137
  %148 = tail call float @llvm.fma.f32(float %134, float 0x3FF921FB40000000, float %147)
  %149 = tail call float @llvm.fma.f32(float %134, float 0x3E74442D00000000, float %148)
  %150 = tail call float @llvm.fma.f32(float %146, float 0x3FF921FB40000000, float %149)
  %151 = fadd float %137, %150
  %152 = lshr i32 %112, 30
  %153 = add nuw nsw i32 %119, %152
  br label %154

154:                                              ; preds = %40, %48
  %155 = phi i32 [ %47, %40 ], [ %49, %48 ]
  %156 = phi float [ %45, %40 ], [ %151, %48 ]
  %157 = phi i32 [ %46, %40 ], [ %153, %48 ]
  %158 = fmul float %156, %156
  %159 = fmul contract float %35, 4.000000e+00
  %160 = fadd contract float %159, %3
  %161 = tail call float @llvm.fabs.f32(float %160)
  %162 = fcmp olt float %161, 1.310720e+05
  br i1 %162, label %163, label %170

163:                                              ; preds = %154
  %164 = fmul float %161, 0x3FE45F3060000000
  %165 = tail call float @llvm.rint.f32(float %164)
  %166 = tail call float @llvm.fma.f32(float %165, float 0xBFF921FB40000000, float %161)
  %167 = tail call float @llvm.fma.f32(float %165, float 0xBE74442D00000000, float %166)
  %168 = tail call float @llvm.fma.f32(float %165, float 0xBCF8469880000000, float %167)
  %169 = fptosi float %165 to i32
  br label %276

170:                                              ; preds = %154
  %171 = bitcast float %161 to i32
  %172 = lshr i32 %171, 23
  %173 = and i32 %171, 8388607
  %174 = or i32 %173, 8388608
  %175 = zext i32 %174 to i64
  %176 = mul nuw nsw i64 %175, 4266746795
  %177 = trunc i64 %176 to i32
  %178 = lshr i64 %176, 32
  %179 = mul nuw nsw i64 %175, 1011060801
  %180 = add nuw nsw i64 %178, %179
  %181 = trunc i64 %180 to i32
  %182 = lshr i64 %180, 32
  %183 = mul nuw nsw i64 %175, 3680671129
  %184 = add nuw nsw i64 %182, %183
  %185 = trunc i64 %184 to i32
  %186 = lshr i64 %184, 32
  %187 = mul nuw nsw i64 %175, 4113882560
  %188 = add nuw nsw i64 %186, %187
  %189 = trunc i64 %188 to i32
  %190 = lshr i64 %188, 32
  %191 = mul nuw nsw i64 %175, 4230436817
  %192 = add nuw nsw i64 %190, %191
  %193 = trunc i64 %192 to i32
  %194 = lshr i64 %192, 32
  %195 = mul nuw nsw i64 %175, 1313084713
  %196 = add nuw nsw i64 %194, %195
  %197 = trunc i64 %196 to i32
  %198 = lshr i64 %196, 32
  %199 = mul nuw nsw i64 %175, 2734261102
  %200 = add nuw nsw i64 %198, %199
  %201 = trunc i64 %200 to i32
  %202 = lshr i64 %200, 32
  %203 = trunc i64 %202 to i32
  %204 = add nsw i32 %172, -120
  %205 = icmp ugt i32 %204, 63
  %206 = select i1 %205, i32 %197, i32 %203
  %207 = select i1 %205, i32 %193, i32 %201
  %208 = select i1 %205, i32 %189, i32 %197
  %209 = select i1 %205, i32 %185, i32 %193
  %210 = select i1 %205, i32 %181, i32 %189
  %211 = select i1 %205, i32 %177, i32 %185
  %212 = select i1 %205, i32 -64, i32 0
  %213 = add nsw i32 %212, %204
  %214 = icmp ugt i32 %213, 31
  %215 = select i1 %214, i32 %207, i32 %206
  %216 = select i1 %214, i32 %208, i32 %207
  %217 = select i1 %214, i32 %209, i32 %208
  %218 = select i1 %214, i32 %210, i32 %209
  %219 = select i1 %214, i32 %211, i32 %210
  %220 = select i1 %214, i32 -32, i32 0
  %221 = add nsw i32 %220, %213
  %222 = icmp ugt i32 %221, 31
  %223 = select i1 %222, i32 %216, i32 %215
  %224 = select i1 %222, i32 %217, i32 %216
  %225 = select i1 %222, i32 %218, i32 %217
  %226 = select i1 %222, i32 %219, i32 %218
  %227 = select i1 %222, i32 -32, i32 0
  %228 = add nsw i32 %227, %221
  %229 = icmp eq i32 %228, 0
  %230 = sub nsw i32 32, %228
  %231 = tail call i32 @llvm.fshr.i32(i32 %223, i32 %224, i32 %230)
  %232 = tail call i32 @llvm.fshr.i32(i32 %224, i32 %225, i32 %230)
  %233 = tail call i32 @llvm.fshr.i32(i32 %225, i32 %226, i32 %230)
  %234 = select i1 %229, i32 %223, i32 %231
  %235 = select i1 %229, i32 %224, i32 %232
  %236 = select i1 %229, i32 %225, i32 %233
  %237 = lshr i32 %234, 29
  %238 = tail call i32 @llvm.fshl.i32(i32 %234, i32 %235, i32 2)
  %239 = tail call i32 @llvm.fshl.i32(i32 %235, i32 %236, i32 2)
  %240 = tail call i32 @llvm.fshl.i32(i32 %236, i32 %226, i32 2)
  %241 = and i32 %237, 1
  %242 = sub nsw i32 0, %241
  %243 = shl i32 %237, 31
  %244 = xor i32 %238, %242
  %245 = xor i32 %239, %242
  %246 = xor i32 %240, %242
  %247 = tail call i32 @llvm.ctlz.i32(i32 %244, i1 false), !range !7
  %248 = sub nsw i32 31, %247
  %249 = tail call i32 @llvm.fshr.i32(i32 %244, i32 %245, i32 %248)
  %250 = tail call i32 @llvm.fshr.i32(i32 %245, i32 %246, i32 %248)
  %251 = shl nuw nsw i32 %247, 23
  %252 = sub nuw nsw i32 1056964608, %251
  %253 = lshr i32 %249, 9
  %254 = or i32 %253, %252
  %255 = or i32 %254, %243
  %256 = bitcast i32 %255 to float
  %257 = tail call i32 @llvm.fshl.i32(i32 %249, i32 %250, i32 23)
  %258 = tail call i32 @llvm.ctlz.i32(i32 %257, i1 false), !range !7
  %259 = fmul float %256, 0x3FF921FB40000000
  %260 = add nuw nsw i32 %258, %247
  %261 = shl nuw nsw i32 %260, 23
  %262 = sub nuw nsw i32 855638016, %261
  %263 = sub nsw i32 31, %258
  %264 = tail call i32 @llvm.fshr.i32(i32 %257, i32 %250, i32 %263)
  %265 = lshr i32 %264, 9
  %266 = or i32 %262, %265
  %267 = or i32 %266, %243
  %268 = bitcast i32 %267 to float
  %269 = fneg float %259
  %270 = tail call float @llvm.fma.f32(float %256, float 0x3FF921FB40000000, float %269)
  %271 = tail call float @llvm.fma.f32(float %256, float 0x3E74442D00000000, float %270)
  %272 = tail call float @llvm.fma.f32(float %268, float 0x3FF921FB40000000, float %271)
  %273 = fadd float %259, %272
  %274 = lshr i32 %234, 30
  %275 = add nuw nsw i32 %241, %274
  br label %276

276:                                              ; preds = %163, %170
  %277 = phi float [ %168, %163 ], [ %273, %170 ]
  %278 = phi i32 [ %169, %163 ], [ %275, %170 ]
  %279 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 504)
  %280 = bitcast float %37 to i32
  %281 = xor i32 %155, %280
  %282 = shl i32 %157, 30
  %283 = and i32 %282, -2147483648
  %284 = xor i32 %281, %283
  %285 = and i32 %157, 1
  %286 = icmp eq i32 %285, 0
  %287 = tail call float @llvm.fmuladd.f32(float %158, float 0xBF29833040000000, float 0x3F81103880000000)
  %288 = tail call float @llvm.fmuladd.f32(float %158, float %287, float 0xBFC55553A0000000)
  %289 = fmul float %158, %288
  %290 = tail call float @llvm.fmuladd.f32(float %156, float %289, float %156)
  %291 = tail call float @llvm.fmuladd.f32(float %158, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %292 = tail call float @llvm.fmuladd.f32(float %158, float %291, float 0x3FA5557EE0000000)
  %293 = tail call float @llvm.fmuladd.f32(float %158, float %292, float 0xBFE0000080000000)
  %294 = tail call float @llvm.fmuladd.f32(float %158, float %293, float 1.000000e+00)
  %295 = select i1 %286, float %290, float %294
  %296 = bitcast float %295 to i32
  %297 = xor i32 %284, %296
  %298 = bitcast i32 %297 to float
  %299 = select i1 %279, float %298, float 0x7FF8000000000000
  %300 = fmul float %277, %277
  %301 = tail call float @llvm.fmuladd.f32(float %300, float 0xBF29833040000000, float 0x3F81103880000000)
  %302 = tail call float @llvm.fmuladd.f32(float %300, float %301, float 0xBFC55553A0000000)
  %303 = fmul float %300, %302
  %304 = tail call float @llvm.fmuladd.f32(float %277, float %303, float %277)
  %305 = tail call float @llvm.fmuladd.f32(float %300, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %306 = tail call float @llvm.fmuladd.f32(float %300, float %305, float 0x3FA5557EE0000000)
  %307 = tail call float @llvm.fmuladd.f32(float %300, float %306, float 0xBFE0000080000000)
  %308 = tail call float @llvm.fmuladd.f32(float %300, float %307, float 1.000000e+00)
  %309 = fneg float %304
  %310 = and i32 %278, 1
  %311 = icmp eq i32 %310, 0
  %312 = select i1 %311, float %308, float %309
  %313 = bitcast float %312 to i32
  %314 = shl i32 %278, 30
  %315 = and i32 %314, -2147483648
  %316 = xor i32 %315, %313
  %317 = bitcast i32 %316 to float
  %318 = tail call i1 @llvm.amdgcn.class.f32(float %161, i32 504)
  %319 = select i1 %318, float %317, float 0x7FF8000000000000
  %320 = fmul contract float %299, %319
  %321 = fmul contract float %320, 5.000000e-01
  %322 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %31, i64 0
  %323 = insertelement <4 x float> %322, float %321, i64 1
  %324 = insertelement <4 x float> %323, float %35, i64 2
  %325 = mul i32 %21, %1
  %326 = add i32 %325, %13
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %327, i32 0, i32 0, i32 0
  store <4 x float> %324, <4 x float> addrspace(1)* %328, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{i32 0, i32 33}
