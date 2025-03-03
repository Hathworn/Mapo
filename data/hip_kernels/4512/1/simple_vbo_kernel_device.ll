; ModuleID = '../data/hip_kernels/4512/1/main.cu'
source_filename = "../data/hip_kernels/4512/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @simple_vbo_kernel(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = uitofp i32 %13 to float
  %23 = uitofp i32 %1 to float
  %24 = fdiv contract float %22, %23
  %25 = uitofp i32 %21 to float
  %26 = uitofp i32 %2 to float
  %27 = fdiv contract float %25, %26
  %28 = fmul contract float %24, 2.000000e+00
  %29 = fadd contract float %28, -1.000000e+00
  %30 = fmul contract float %27, 2.000000e+00
  %31 = fadd contract float %30, -1.000000e+00
  %32 = fmul contract float %29, 4.000000e+00
  %33 = fadd contract float %32, %3
  %34 = tail call float @llvm.fabs.f32(float %33)
  %35 = fcmp olt float %34, 1.310720e+05
  br i1 %35, label %36, label %44

36:                                               ; preds = %4
  %37 = fmul float %34, 0x3FE45F3060000000
  %38 = tail call float @llvm.rint.f32(float %37)
  %39 = tail call float @llvm.fma.f32(float %38, float 0xBFF921FB40000000, float %34)
  %40 = tail call float @llvm.fma.f32(float %38, float 0xBE74442D00000000, float %39)
  %41 = tail call float @llvm.fma.f32(float %38, float 0xBCF8469880000000, float %40)
  %42 = fptosi float %38 to i32
  %43 = bitcast float %34 to i32
  br label %150

44:                                               ; preds = %4
  %45 = bitcast float %34 to i32
  %46 = lshr i32 %45, 23
  %47 = and i32 %45, 8388607
  %48 = or i32 %47, 8388608
  %49 = zext i32 %48 to i64
  %50 = mul nuw nsw i64 %49, 4266746795
  %51 = trunc i64 %50 to i32
  %52 = lshr i64 %50, 32
  %53 = mul nuw nsw i64 %49, 1011060801
  %54 = add nuw nsw i64 %52, %53
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %54, 32
  %57 = mul nuw nsw i64 %49, 3680671129
  %58 = add nuw nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = mul nuw nsw i64 %49, 4113882560
  %62 = add nuw nsw i64 %60, %61
  %63 = trunc i64 %62 to i32
  %64 = lshr i64 %62, 32
  %65 = mul nuw nsw i64 %49, 4230436817
  %66 = add nuw nsw i64 %64, %65
  %67 = trunc i64 %66 to i32
  %68 = lshr i64 %66, 32
  %69 = mul nuw nsw i64 %49, 1313084713
  %70 = add nuw nsw i64 %68, %69
  %71 = trunc i64 %70 to i32
  %72 = lshr i64 %70, 32
  %73 = mul nuw nsw i64 %49, 2734261102
  %74 = add nuw nsw i64 %72, %73
  %75 = trunc i64 %74 to i32
  %76 = lshr i64 %74, 32
  %77 = trunc i64 %76 to i32
  %78 = add nsw i32 %46, -120
  %79 = icmp ugt i32 %78, 63
  %80 = select i1 %79, i32 %71, i32 %77
  %81 = select i1 %79, i32 %67, i32 %75
  %82 = select i1 %79, i32 %63, i32 %71
  %83 = select i1 %79, i32 %59, i32 %67
  %84 = select i1 %79, i32 %55, i32 %63
  %85 = select i1 %79, i32 %51, i32 %59
  %86 = select i1 %79, i32 -64, i32 0
  %87 = add nsw i32 %86, %78
  %88 = icmp ugt i32 %87, 31
  %89 = select i1 %88, i32 %81, i32 %80
  %90 = select i1 %88, i32 %82, i32 %81
  %91 = select i1 %88, i32 %83, i32 %82
  %92 = select i1 %88, i32 %84, i32 %83
  %93 = select i1 %88, i32 %85, i32 %84
  %94 = select i1 %88, i32 -32, i32 0
  %95 = add nsw i32 %94, %87
  %96 = icmp ugt i32 %95, 31
  %97 = select i1 %96, i32 %90, i32 %89
  %98 = select i1 %96, i32 %91, i32 %90
  %99 = select i1 %96, i32 %92, i32 %91
  %100 = select i1 %96, i32 %93, i32 %92
  %101 = select i1 %96, i32 -32, i32 0
  %102 = add nsw i32 %101, %95
  %103 = icmp eq i32 %102, 0
  %104 = sub nsw i32 32, %102
  %105 = tail call i32 @llvm.fshr.i32(i32 %97, i32 %98, i32 %104)
  %106 = tail call i32 @llvm.fshr.i32(i32 %98, i32 %99, i32 %104)
  %107 = tail call i32 @llvm.fshr.i32(i32 %99, i32 %100, i32 %104)
  %108 = select i1 %103, i32 %97, i32 %105
  %109 = select i1 %103, i32 %98, i32 %106
  %110 = select i1 %103, i32 %99, i32 %107
  %111 = lshr i32 %108, 29
  %112 = tail call i32 @llvm.fshl.i32(i32 %108, i32 %109, i32 2)
  %113 = tail call i32 @llvm.fshl.i32(i32 %109, i32 %110, i32 2)
  %114 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %100, i32 2)
  %115 = and i32 %111, 1
  %116 = sub nsw i32 0, %115
  %117 = shl i32 %111, 31
  %118 = xor i32 %112, %116
  %119 = xor i32 %113, %116
  %120 = xor i32 %114, %116
  %121 = tail call i32 @llvm.ctlz.i32(i32 %118, i1 false), !range !7
  %122 = sub nsw i32 31, %121
  %123 = tail call i32 @llvm.fshr.i32(i32 %118, i32 %119, i32 %122)
  %124 = tail call i32 @llvm.fshr.i32(i32 %119, i32 %120, i32 %122)
  %125 = shl nuw nsw i32 %121, 23
  %126 = sub nuw nsw i32 1056964608, %125
  %127 = lshr i32 %123, 9
  %128 = or i32 %127, %126
  %129 = or i32 %128, %117
  %130 = bitcast i32 %129 to float
  %131 = tail call i32 @llvm.fshl.i32(i32 %123, i32 %124, i32 23)
  %132 = tail call i32 @llvm.ctlz.i32(i32 %131, i1 false), !range !7
  %133 = fmul float %130, 0x3FF921FB40000000
  %134 = add nuw nsw i32 %132, %121
  %135 = shl nuw nsw i32 %134, 23
  %136 = sub nuw nsw i32 855638016, %135
  %137 = sub nsw i32 31, %132
  %138 = tail call i32 @llvm.fshr.i32(i32 %131, i32 %124, i32 %137)
  %139 = lshr i32 %138, 9
  %140 = or i32 %136, %139
  %141 = or i32 %140, %117
  %142 = bitcast i32 %141 to float
  %143 = fneg float %133
  %144 = tail call float @llvm.fma.f32(float %130, float 0x3FF921FB40000000, float %143)
  %145 = tail call float @llvm.fma.f32(float %130, float 0x3E74442D00000000, float %144)
  %146 = tail call float @llvm.fma.f32(float %142, float 0x3FF921FB40000000, float %145)
  %147 = fadd float %133, %146
  %148 = lshr i32 %108, 30
  %149 = add nuw nsw i32 %115, %148
  br label %150

150:                                              ; preds = %36, %44
  %151 = phi i32 [ %43, %36 ], [ %45, %44 ]
  %152 = phi float [ %41, %36 ], [ %147, %44 ]
  %153 = phi i32 [ %42, %36 ], [ %149, %44 ]
  %154 = fmul float %152, %152
  %155 = fmul contract float %31, 4.000000e+00
  %156 = fadd contract float %155, %3
  %157 = tail call float @llvm.fabs.f32(float %156)
  %158 = fcmp olt float %157, 1.310720e+05
  br i1 %158, label %159, label %166

159:                                              ; preds = %150
  %160 = fmul float %157, 0x3FE45F3060000000
  %161 = tail call float @llvm.rint.f32(float %160)
  %162 = tail call float @llvm.fma.f32(float %161, float 0xBFF921FB40000000, float %157)
  %163 = tail call float @llvm.fma.f32(float %161, float 0xBE74442D00000000, float %162)
  %164 = tail call float @llvm.fma.f32(float %161, float 0xBCF8469880000000, float %163)
  %165 = fptosi float %161 to i32
  br label %272

166:                                              ; preds = %150
  %167 = bitcast float %157 to i32
  %168 = lshr i32 %167, 23
  %169 = and i32 %167, 8388607
  %170 = or i32 %169, 8388608
  %171 = zext i32 %170 to i64
  %172 = mul nuw nsw i64 %171, 4266746795
  %173 = trunc i64 %172 to i32
  %174 = lshr i64 %172, 32
  %175 = mul nuw nsw i64 %171, 1011060801
  %176 = add nuw nsw i64 %174, %175
  %177 = trunc i64 %176 to i32
  %178 = lshr i64 %176, 32
  %179 = mul nuw nsw i64 %171, 3680671129
  %180 = add nuw nsw i64 %178, %179
  %181 = trunc i64 %180 to i32
  %182 = lshr i64 %180, 32
  %183 = mul nuw nsw i64 %171, 4113882560
  %184 = add nuw nsw i64 %182, %183
  %185 = trunc i64 %184 to i32
  %186 = lshr i64 %184, 32
  %187 = mul nuw nsw i64 %171, 4230436817
  %188 = add nuw nsw i64 %186, %187
  %189 = trunc i64 %188 to i32
  %190 = lshr i64 %188, 32
  %191 = mul nuw nsw i64 %171, 1313084713
  %192 = add nuw nsw i64 %190, %191
  %193 = trunc i64 %192 to i32
  %194 = lshr i64 %192, 32
  %195 = mul nuw nsw i64 %171, 2734261102
  %196 = add nuw nsw i64 %194, %195
  %197 = trunc i64 %196 to i32
  %198 = lshr i64 %196, 32
  %199 = trunc i64 %198 to i32
  %200 = add nsw i32 %168, -120
  %201 = icmp ugt i32 %200, 63
  %202 = select i1 %201, i32 %193, i32 %199
  %203 = select i1 %201, i32 %189, i32 %197
  %204 = select i1 %201, i32 %185, i32 %193
  %205 = select i1 %201, i32 %181, i32 %189
  %206 = select i1 %201, i32 %177, i32 %185
  %207 = select i1 %201, i32 %173, i32 %181
  %208 = select i1 %201, i32 -64, i32 0
  %209 = add nsw i32 %208, %200
  %210 = icmp ugt i32 %209, 31
  %211 = select i1 %210, i32 %203, i32 %202
  %212 = select i1 %210, i32 %204, i32 %203
  %213 = select i1 %210, i32 %205, i32 %204
  %214 = select i1 %210, i32 %206, i32 %205
  %215 = select i1 %210, i32 %207, i32 %206
  %216 = select i1 %210, i32 -32, i32 0
  %217 = add nsw i32 %216, %209
  %218 = icmp ugt i32 %217, 31
  %219 = select i1 %218, i32 %212, i32 %211
  %220 = select i1 %218, i32 %213, i32 %212
  %221 = select i1 %218, i32 %214, i32 %213
  %222 = select i1 %218, i32 %215, i32 %214
  %223 = select i1 %218, i32 -32, i32 0
  %224 = add nsw i32 %223, %217
  %225 = icmp eq i32 %224, 0
  %226 = sub nsw i32 32, %224
  %227 = tail call i32 @llvm.fshr.i32(i32 %219, i32 %220, i32 %226)
  %228 = tail call i32 @llvm.fshr.i32(i32 %220, i32 %221, i32 %226)
  %229 = tail call i32 @llvm.fshr.i32(i32 %221, i32 %222, i32 %226)
  %230 = select i1 %225, i32 %219, i32 %227
  %231 = select i1 %225, i32 %220, i32 %228
  %232 = select i1 %225, i32 %221, i32 %229
  %233 = lshr i32 %230, 29
  %234 = tail call i32 @llvm.fshl.i32(i32 %230, i32 %231, i32 2)
  %235 = tail call i32 @llvm.fshl.i32(i32 %231, i32 %232, i32 2)
  %236 = tail call i32 @llvm.fshl.i32(i32 %232, i32 %222, i32 2)
  %237 = and i32 %233, 1
  %238 = sub nsw i32 0, %237
  %239 = shl i32 %233, 31
  %240 = xor i32 %234, %238
  %241 = xor i32 %235, %238
  %242 = xor i32 %236, %238
  %243 = tail call i32 @llvm.ctlz.i32(i32 %240, i1 false), !range !7
  %244 = sub nsw i32 31, %243
  %245 = tail call i32 @llvm.fshr.i32(i32 %240, i32 %241, i32 %244)
  %246 = tail call i32 @llvm.fshr.i32(i32 %241, i32 %242, i32 %244)
  %247 = shl nuw nsw i32 %243, 23
  %248 = sub nuw nsw i32 1056964608, %247
  %249 = lshr i32 %245, 9
  %250 = or i32 %249, %248
  %251 = or i32 %250, %239
  %252 = bitcast i32 %251 to float
  %253 = tail call i32 @llvm.fshl.i32(i32 %245, i32 %246, i32 23)
  %254 = tail call i32 @llvm.ctlz.i32(i32 %253, i1 false), !range !7
  %255 = fmul float %252, 0x3FF921FB40000000
  %256 = add nuw nsw i32 %254, %243
  %257 = shl nuw nsw i32 %256, 23
  %258 = sub nuw nsw i32 855638016, %257
  %259 = sub nsw i32 31, %254
  %260 = tail call i32 @llvm.fshr.i32(i32 %253, i32 %246, i32 %259)
  %261 = lshr i32 %260, 9
  %262 = or i32 %258, %261
  %263 = or i32 %262, %239
  %264 = bitcast i32 %263 to float
  %265 = fneg float %255
  %266 = tail call float @llvm.fma.f32(float %252, float 0x3FF921FB40000000, float %265)
  %267 = tail call float @llvm.fma.f32(float %252, float 0x3E74442D00000000, float %266)
  %268 = tail call float @llvm.fma.f32(float %264, float 0x3FF921FB40000000, float %267)
  %269 = fadd float %255, %268
  %270 = lshr i32 %230, 30
  %271 = add nuw nsw i32 %237, %270
  br label %272

272:                                              ; preds = %159, %166
  %273 = phi float [ %164, %159 ], [ %269, %166 ]
  %274 = phi i32 [ %165, %159 ], [ %271, %166 ]
  %275 = tail call i1 @llvm.amdgcn.class.f32(float %34, i32 504)
  %276 = bitcast float %33 to i32
  %277 = xor i32 %151, %276
  %278 = shl i32 %153, 30
  %279 = and i32 %278, -2147483648
  %280 = xor i32 %277, %279
  %281 = and i32 %153, 1
  %282 = icmp eq i32 %281, 0
  %283 = tail call float @llvm.fmuladd.f32(float %154, float 0xBF29833040000000, float 0x3F81103880000000)
  %284 = tail call float @llvm.fmuladd.f32(float %154, float %283, float 0xBFC55553A0000000)
  %285 = fmul float %154, %284
  %286 = tail call float @llvm.fmuladd.f32(float %152, float %285, float %152)
  %287 = tail call float @llvm.fmuladd.f32(float %154, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %288 = tail call float @llvm.fmuladd.f32(float %154, float %287, float 0x3FA5557EE0000000)
  %289 = tail call float @llvm.fmuladd.f32(float %154, float %288, float 0xBFE0000080000000)
  %290 = tail call float @llvm.fmuladd.f32(float %154, float %289, float 1.000000e+00)
  %291 = select i1 %282, float %286, float %290
  %292 = bitcast float %291 to i32
  %293 = xor i32 %280, %292
  %294 = bitcast i32 %293 to float
  %295 = select i1 %275, float %294, float 0x7FF8000000000000
  %296 = fmul float %273, %273
  %297 = tail call float @llvm.fmuladd.f32(float %296, float 0xBF29833040000000, float 0x3F81103880000000)
  %298 = tail call float @llvm.fmuladd.f32(float %296, float %297, float 0xBFC55553A0000000)
  %299 = fmul float %296, %298
  %300 = tail call float @llvm.fmuladd.f32(float %273, float %299, float %273)
  %301 = tail call float @llvm.fmuladd.f32(float %296, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %302 = tail call float @llvm.fmuladd.f32(float %296, float %301, float 0x3FA5557EE0000000)
  %303 = tail call float @llvm.fmuladd.f32(float %296, float %302, float 0xBFE0000080000000)
  %304 = tail call float @llvm.fmuladd.f32(float %296, float %303, float 1.000000e+00)
  %305 = fneg float %300
  %306 = and i32 %274, 1
  %307 = icmp eq i32 %306, 0
  %308 = select i1 %307, float %304, float %305
  %309 = bitcast float %308 to i32
  %310 = shl i32 %274, 30
  %311 = and i32 %310, -2147483648
  %312 = xor i32 %311, %309
  %313 = bitcast i32 %312 to float
  %314 = tail call i1 @llvm.amdgcn.class.f32(float %157, i32 504)
  %315 = select i1 %314, float %313, float 0x7FF8000000000000
  %316 = fmul contract float %295, %315
  %317 = fmul contract float %316, 5.000000e-01
  %318 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %29, i64 0
  %319 = insertelement <4 x float> %318, float %317, i64 1
  %320 = insertelement <4 x float> %319, float %31, i64 2
  %321 = mul i32 %21, %1
  %322 = add i32 %321, %13
  %323 = zext i32 %322 to i64
  %324 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %323, i32 0, i32 0, i32 0
  store <4 x float> %320, <4 x float> addrspace(1)* %324, align 16
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
