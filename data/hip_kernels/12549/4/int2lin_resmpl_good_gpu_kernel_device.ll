; ModuleID = '../data/hip_kernels/12549/4/main.cu'
source_filename = "../data/hip_kernels/12549/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@lTable_const = protected local_unnamed_addr addrspace(4) externally_initialized global [1064 x float] zeroinitializer, align 16
@mr_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mg_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mb_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z30int2lin_resmpl_good_gpu_kernelPfS_S_S_S_iiiiifPiS0_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float %10, i32 addrspace(1)* nocapture readonly %11, i32 addrspace(1)* nocapture readonly %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %14
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = add i32 %29, %23
  %31 = icmp ult i32 %22, %7
  %32 = icmp ult i32 %30, %8
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %308

34:                                               ; preds = %13
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  %36 = mul nsw i32 %8, %7
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  %40 = shl nsw i32 %8, 1
  %41 = mul nsw i32 %40, %7
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %44 = icmp eq i32 %6, %8
  %45 = icmp eq i32 %5, %7
  %46 = select i1 %44, i1 %45, i1 false
  br i1 %46, label %47, label %62

47:                                               ; preds = %34
  %48 = mul i32 %22, %7
  %49 = add i32 %30, %48
  %50 = mul nsw i32 %49, %9
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = sext i32 %49 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  store float %53, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = getelementptr inbounds float, float addrspace(1)* %35, i64 %51
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = getelementptr inbounds float, float addrspace(1)* %38, i64 %54
  store float %57, float addrspace(1)* %58, align 4, !tbaa !7
  %59 = getelementptr inbounds float, float addrspace(1)* %39, i64 %51
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %43, i64 %54
  store float %60, float addrspace(1)* %61, align 4, !tbaa !7
  br label %308

62:                                               ; preds = %34
  %63 = icmp eq i32 %40, %6
  br i1 %63, label %64, label %66

64:                                               ; preds = %62
  %65 = shl i32 %30, 1
  br label %76

66:                                               ; preds = %62
  %67 = mul nsw i32 %8, 3
  %68 = icmp eq i32 %67, %6
  br i1 %68, label %69, label %71

69:                                               ; preds = %66
  %70 = mul i32 %30, 3
  br label %76

71:                                               ; preds = %66
  %72 = shl nsw i32 %8, 2
  %73 = icmp eq i32 %72, %6
  %74 = shl i32 %30, 2
  %75 = select i1 %73, i32 %74, i32 0
  br label %76

76:                                               ; preds = %71, %69, %64
  %77 = phi i32 [ %65, %64 ], [ %70, %69 ], [ %75, %71 ]
  %78 = icmp eq i32 %30, 0
  %79 = select i1 %78, i32 0, i32 %77
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !11, !amdgpu.noclobber !6
  %83 = mul i32 %9, %5
  %84 = mul i32 %83, %82
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = sext i32 %83 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %86, i64 %87
  %89 = getelementptr inbounds float, float addrspace(1)* %88, i64 %87
  %90 = getelementptr inbounds float, float addrspace(1)* %89, i64 %87
  %91 = getelementptr inbounds float, float addrspace(1)* %35, i64 %85
  %92 = getelementptr inbounds float, float addrspace(1)* %39, i64 %85
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %80
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !11, !amdgpu.noclobber !6
  %95 = mul nsw i32 %94, %7
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = getelementptr inbounds float, float addrspace(1)* %38, i64 %96
  %99 = getelementptr inbounds float, float addrspace(1)* %43, i64 %96
  br i1 %63, label %100, label %117

100:                                              ; preds = %76
  %101 = mul i32 %22, %9
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %86, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !6
  %105 = getelementptr inbounds float, float addrspace(1)* %88, i64 %102
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = fadd contract float %104, %106
  %108 = zext i32 %22 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %2, i64 %108
  store float %107, float addrspace(1)* %109, align 4, !tbaa !7
  %110 = getelementptr inbounds float, float addrspace(1)* %91, i64 %102
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %113 = fadd contract float %111, %112
  %114 = getelementptr inbounds float, float addrspace(1)* %3, i64 %108
  store float %113, float addrspace(1)* %114, align 4, !tbaa !7
  %115 = getelementptr inbounds float, float addrspace(1)* %92, i64 %102
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  br label %178

117:                                              ; preds = %76
  %118 = mul nsw i32 %8, 3
  %119 = icmp eq i32 %118, %6
  br i1 %119, label %120, label %144

120:                                              ; preds = %117
  %121 = mul i32 %22, %9
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %86, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !6
  %125 = getelementptr inbounds float, float addrspace(1)* %88, i64 %122
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = fadd contract float %124, %126
  %128 = getelementptr inbounds float, float addrspace(1)* %89, i64 %122
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !6
  %130 = fadd contract float %127, %129
  %131 = zext i32 %22 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %2, i64 %131
  store float %130, float addrspace(1)* %132, align 4, !tbaa !7
  %133 = getelementptr inbounds float, float addrspace(1)* %91, i64 %122
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %136 = fadd contract float %134, %135
  %137 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %138 = fadd contract float %136, %137
  %139 = getelementptr inbounds float, float addrspace(1)* %3, i64 %131
  store float %138, float addrspace(1)* %139, align 4, !tbaa !7
  %140 = getelementptr inbounds float, float addrspace(1)* %92, i64 %122
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %143 = fadd contract float %141, %142
  br label %178

144:                                              ; preds = %117
  %145 = shl nsw i32 %8, 2
  %146 = icmp eq i32 %145, %6
  br i1 %146, label %147, label %185

147:                                              ; preds = %144
  %148 = mul i32 %22, %9
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %86, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !6
  %152 = getelementptr inbounds float, float addrspace(1)* %88, i64 %149
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !6
  %154 = fadd contract float %151, %153
  %155 = getelementptr inbounds float, float addrspace(1)* %89, i64 %149
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !6
  %157 = fadd contract float %154, %156
  %158 = getelementptr inbounds float, float addrspace(1)* %90, i64 %149
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !6
  %160 = fadd contract float %157, %159
  %161 = zext i32 %22 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %2, i64 %161
  store float %160, float addrspace(1)* %162, align 4, !tbaa !7
  %163 = getelementptr inbounds float, float addrspace(1)* %91, i64 %149
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %165 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %166 = fadd contract float %164, %165
  %167 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %168 = fadd contract float %166, %167
  %169 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %170 = fadd contract float %168, %169
  %171 = getelementptr inbounds float, float addrspace(1)* %3, i64 %161
  store float %170, float addrspace(1)* %171, align 4, !tbaa !7
  %172 = getelementptr inbounds float, float addrspace(1)* %92, i64 %149
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7
  %174 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %175 = fadd contract float %173, %174
  %176 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %177 = fadd contract float %175, %176
  br label %178

178:                                              ; preds = %100, %147, %120
  %179 = phi float addrspace(1)* [ %128, %120 ], [ %158, %147 ], [ %105, %100 ]
  %180 = phi float [ %143, %120 ], [ %177, %147 ], [ %116, %100 ]
  %181 = phi i64 [ %131, %120 ], [ %161, %147 ], [ %108, %100 ]
  %182 = load float, float addrspace(1)* %179, align 4, !tbaa !7
  %183 = fadd contract float %180, %182
  %184 = getelementptr inbounds float, float addrspace(1)* %4, i64 %181
  store float %183, float addrspace(1)* %184, align 4, !tbaa !7
  br label %185

185:                                              ; preds = %178, %144
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %186 = shl nsw i32 %7, 1
  %187 = icmp eq i32 %186, %5
  br i1 %187, label %188, label %211

188:                                              ; preds = %185
  %189 = shl i32 %22, 1
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %2, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !7
  %193 = add nuw nsw i32 %189, 1
  %194 = zext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %2, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7
  %197 = fadd contract float %192, %196
  %198 = fmul contract float %10, 5.000000e-01
  %199 = fmul contract float %198, %197
  %200 = zext i32 %22 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %97, i64 %200
  store float %199, float addrspace(1)* %201, align 4, !tbaa !7
  %202 = getelementptr inbounds float, float addrspace(1)* %3, i64 %190
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %204 = getelementptr inbounds float, float addrspace(1)* %3, i64 %194
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !7
  %206 = fadd contract float %203, %205
  %207 = fmul contract float %198, %206
  %208 = getelementptr inbounds float, float addrspace(1)* %98, i64 %200
  store float %207, float addrspace(1)* %208, align 4, !tbaa !7
  %209 = getelementptr inbounds float, float addrspace(1)* %4, i64 %190
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  br label %297

211:                                              ; preds = %185
  %212 = mul nsw i32 %7, 3
  %213 = icmp eq i32 %212, %5
  br i1 %213, label %214, label %248

214:                                              ; preds = %211
  %215 = mul i32 %22, 3
  %216 = zext i32 %215 to i64
  %217 = getelementptr inbounds float, float addrspace(1)* %2, i64 %216
  %218 = load float, float addrspace(1)* %217, align 4, !tbaa !7
  %219 = add i32 %215, 1
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, float addrspace(1)* %2, i64 %220
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !7
  %223 = fadd contract float %218, %222
  %224 = add i32 %215, 2
  %225 = zext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %2, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !7
  %228 = fadd contract float %223, %227
  %229 = fdiv contract float %10, 3.000000e+00
  %230 = fmul contract float %229, %228
  %231 = zext i32 %22 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %97, i64 %231
  store float %230, float addrspace(1)* %232, align 4, !tbaa !7
  %233 = getelementptr inbounds float, float addrspace(1)* %3, i64 %216
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !7
  %235 = getelementptr inbounds float, float addrspace(1)* %3, i64 %220
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !7
  %237 = fadd contract float %234, %236
  %238 = getelementptr inbounds float, float addrspace(1)* %3, i64 %225
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !7
  %240 = fadd contract float %237, %239
  %241 = fmul contract float %229, %240
  %242 = getelementptr inbounds float, float addrspace(1)* %98, i64 %231
  store float %241, float addrspace(1)* %242, align 4, !tbaa !7
  %243 = getelementptr inbounds float, float addrspace(1)* %4, i64 %216
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7
  %245 = getelementptr inbounds float, float addrspace(1)* %4, i64 %220
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !7
  %247 = fadd contract float %244, %246
  br label %297

248:                                              ; preds = %211
  %249 = shl nsw i32 %7, 2
  %250 = icmp eq i32 %249, %5
  br i1 %250, label %251, label %307

251:                                              ; preds = %248
  %252 = shl i32 %22, 2
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds float, float addrspace(1)* %2, i64 %253
  %255 = load float, float addrspace(1)* %254, align 4, !tbaa !7
  %256 = add nuw nsw i32 %252, 1
  %257 = zext i32 %256 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %2, i64 %257
  %259 = load float, float addrspace(1)* %258, align 4, !tbaa !7
  %260 = fadd contract float %255, %259
  %261 = add nuw nsw i32 %252, 2
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %2, i64 %262
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !7
  %265 = fadd contract float %260, %264
  %266 = add nuw nsw i32 %252, 3
  %267 = zext i32 %266 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %2, i64 %267
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !7
  %270 = fadd contract float %265, %269
  %271 = fmul contract float %10, 2.500000e-01
  %272 = fmul contract float %271, %270
  %273 = zext i32 %22 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %97, i64 %273
  store float %272, float addrspace(1)* %274, align 4, !tbaa !7
  %275 = getelementptr inbounds float, float addrspace(1)* %3, i64 %253
  %276 = load float, float addrspace(1)* %275, align 4, !tbaa !7
  %277 = getelementptr inbounds float, float addrspace(1)* %3, i64 %257
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !7
  %279 = fadd contract float %276, %278
  %280 = getelementptr inbounds float, float addrspace(1)* %3, i64 %262
  %281 = load float, float addrspace(1)* %280, align 4, !tbaa !7
  %282 = fadd contract float %279, %281
  %283 = getelementptr inbounds float, float addrspace(1)* %3, i64 %267
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %285 = fadd contract float %282, %284
  %286 = fmul contract float %271, %285
  %287 = getelementptr inbounds float, float addrspace(1)* %98, i64 %273
  store float %286, float addrspace(1)* %287, align 4, !tbaa !7
  %288 = getelementptr inbounds float, float addrspace(1)* %4, i64 %253
  %289 = bitcast float addrspace(1)* %288 to <2 x float> addrspace(1)*
  %290 = load <2 x float>, <2 x float> addrspace(1)* %289, align 4, !tbaa !7
  %291 = extractelement <2 x float> %290, i64 0
  %292 = extractelement <2 x float> %290, i64 1
  %293 = fadd contract float %291, %292
  %294 = getelementptr inbounds float, float addrspace(1)* %4, i64 %262
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !7
  %296 = fadd contract float %293, %295
  br label %297

297:                                              ; preds = %188, %251, %214
  %298 = phi i64 [ %225, %214 ], [ %267, %251 ], [ %194, %188 ]
  %299 = phi float [ %247, %214 ], [ %296, %251 ], [ %210, %188 ]
  %300 = phi float [ %229, %214 ], [ %271, %251 ], [ %198, %188 ]
  %301 = phi i64 [ %231, %214 ], [ %273, %251 ], [ %200, %188 ]
  %302 = getelementptr inbounds float, float addrspace(1)* %4, i64 %298
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !7
  %304 = fadd contract float %299, %303
  %305 = fmul contract float %300, %304
  %306 = getelementptr inbounds float, float addrspace(1)* %99, i64 %301
  store float %305, float addrspace(1)* %306, align 4, !tbaa !7
  br label %307

307:                                              ; preds = %297, %248
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %308

308:                                              ; preds = %13, %307, %47
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
