; ModuleID = '../data/hip_kernels/12549/5/main.cu'
source_filename = "../data/hip_kernels/12549/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@lTable_const = protected local_unnamed_addr addrspace(4) externally_initialized global [1064 x float] zeroinitializer, align 16
@mr_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mg_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mb_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z31int2lin_resmpl_messy_gpu_kernelPfS_S_S_S_iiiiifiiiiiiPiS0_S_S0_S0_S_(float addrspace(1)* readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 addrspace(1)* nocapture readonly %17, i32 addrspace(1)* nocapture readonly %18, float addrspace(1)* nocapture readonly %19, i32 addrspace(1)* nocapture readonly %20, i32 addrspace(1)* nocapture readonly %21, float addrspace(1)* nocapture readonly %22) local_unnamed_addr #0 {
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !5, !invariant.load !6
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = add i32 %31, %24
  %33 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %35 = getelementptr i8, i8 addrspace(4)* %25, i64 6
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 2, !range !5, !invariant.load !6
  %38 = zext i16 %37 to i32
  %39 = mul i32 %34, %38
  %40 = add i32 %39, %33
  %41 = icmp ult i32 %32, %7
  %42 = icmp ult i32 %40, %8
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %44, label %943

44:                                               ; preds = %23
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  %46 = mul nsw i32 %8, %7
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  %50 = shl i32 %7, 1
  %51 = mul i32 %50, %8
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = icmp sgt i32 %6, %8
  %55 = zext i32 %40 to i64
  %56 = sext i32 %40 to i64
  %57 = select i1 %54, i64 %55, i64 %56
  %58 = getelementptr inbounds float, float addrspace(1)* %22, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = fsub contract float 1.000000e+00, %59
  %61 = sext i32 %40 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !11, !amdgpu.noclobber !6
  %64 = mul i32 %9, %5
  %65 = mul i32 %64, %63
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = sext i32 %64 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %67, i64 %68
  %70 = getelementptr inbounds float, float addrspace(1)* %69, i64 %68
  %71 = getelementptr inbounds float, float addrspace(1)* %70, i64 %68
  %72 = getelementptr inbounds float, float addrspace(1)* %45, i64 %66
  %73 = getelementptr inbounds float, float addrspace(1)* %49, i64 %66
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %61
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !11, !amdgpu.noclobber !6
  %76 = mul nsw i32 %75, %7
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = getelementptr inbounds float, float addrspace(1)* %48, i64 %77
  %80 = getelementptr inbounds float, float addrspace(1)* %53, i64 %77
  %81 = icmp ult i32 %32, %5
  br i1 %81, label %82, label %452

82:                                               ; preds = %44
  br i1 %54, label %83, label %381

83:                                               ; preds = %82
  %84 = add nsw i32 %40, 1
  %85 = icmp slt i32 %84, %11
  br i1 %85, label %86, label %97

86:                                               ; preds = %83, %93
  %87 = phi i32 [ %95, %93 ], [ %84, %83 ]
  %88 = phi i32 [ %94, %93 ], [ 1, %83 ]
  %89 = sext i32 %87 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !11, !amdgpu.noclobber !6
  %92 = icmp eq i32 %75, %91
  br i1 %92, label %93, label %97

93:                                               ; preds = %86
  %94 = add nuw nsw i32 %88, 1
  %95 = add nsw i32 %94, %40
  %96 = icmp slt i32 %95, %11
  br i1 %96, label %86, label %97, !llvm.loop !13

97:                                               ; preds = %86, %93, %83
  %98 = phi i32 [ 1, %83 ], [ %88, %86 ], [ %94, %93 ]
  switch i32 %98, label %202 [
    i32 1, label %99
    i32 2, label %118
    i32 3, label %152
  ]

99:                                               ; preds = %97
  %100 = mul i32 %32, %9
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %67, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !6
  %104 = getelementptr inbounds float, float addrspace(1)* %22, i64 %61
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = fmul contract float %103, %105
  %107 = zext i32 %32 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  store float %106, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = getelementptr inbounds float, float addrspace(1)* %72, i64 %101
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %112 = fmul contract float %110, %111
  %113 = getelementptr inbounds float, float addrspace(1)* %3, i64 %107
  store float %112, float addrspace(1)* %113, align 4, !tbaa !7
  %114 = getelementptr inbounds float, float addrspace(1)* %73, i64 %101
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %117 = fmul contract float %115, %116
  br label %270

118:                                              ; preds = %97
  %119 = mul i32 %32, %9
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %67, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !6
  %123 = getelementptr inbounds float, float addrspace(1)* %22, i64 %61
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !6
  %125 = fmul contract float %122, %124
  %126 = getelementptr inbounds float, float addrspace(1)* %69, i64 %120
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !6
  %128 = sext i32 %84 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %22, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !6
  %131 = fmul contract float %127, %130
  %132 = fadd contract float %125, %131
  %133 = zext i32 %32 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %2, i64 %133
  store float %132, float addrspace(1)* %134, align 4, !tbaa !7
  %135 = getelementptr inbounds float, float addrspace(1)* %72, i64 %120
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %138 = fmul contract float %136, %137
  %139 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %140 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = getelementptr inbounds float, float addrspace(1)* %3, i64 %133
  store float %142, float addrspace(1)* %143, align 4, !tbaa !7
  %144 = getelementptr inbounds float, float addrspace(1)* %73, i64 %120
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7
  %146 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %147 = fmul contract float %145, %146
  %148 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %149 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %150 = fmul contract float %148, %149
  %151 = fadd contract float %147, %150
  br label %270

152:                                              ; preds = %97
  %153 = mul i32 %32, %9
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %67, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !6
  %157 = getelementptr inbounds float, float addrspace(1)* %22, i64 %61
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !6
  %159 = fmul contract float %156, %158
  %160 = getelementptr inbounds float, float addrspace(1)* %69, i64 %154
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !6
  %162 = sext i32 %84 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %22, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7, !amdgpu.noclobber !6
  %165 = fmul contract float %161, %164
  %166 = fadd contract float %159, %165
  %167 = getelementptr inbounds float, float addrspace(1)* %70, i64 %154
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7, !amdgpu.noclobber !6
  %169 = add nsw i32 %40, 2
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %22, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7, !amdgpu.noclobber !6
  %173 = fmul contract float %168, %172
  %174 = fadd contract float %166, %173
  %175 = zext i32 %32 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %2, i64 %175
  store float %174, float addrspace(1)* %176, align 4, !tbaa !7
  %177 = getelementptr inbounds float, float addrspace(1)* %72, i64 %154
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !7
  %179 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %180 = fmul contract float %178, %179
  %181 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %182 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %183 = fmul contract float %181, %182
  %184 = fadd contract float %180, %183
  %185 = load float, float addrspace(1)* %167, align 4, !tbaa !7
  %186 = load float, float addrspace(1)* %171, align 4, !tbaa !7
  %187 = fmul contract float %185, %186
  %188 = fadd contract float %184, %187
  %189 = getelementptr inbounds float, float addrspace(1)* %3, i64 %175
  store float %188, float addrspace(1)* %189, align 4, !tbaa !7
  %190 = getelementptr inbounds float, float addrspace(1)* %73, i64 %154
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7
  %192 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %193 = fmul contract float %191, %192
  %194 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %195 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %196 = fmul contract float %194, %195
  %197 = fadd contract float %193, %196
  %198 = load float, float addrspace(1)* %167, align 4, !tbaa !7
  %199 = load float, float addrspace(1)* %171, align 4, !tbaa !7
  %200 = fmul contract float %198, %199
  %201 = fadd contract float %197, %200
  br label %270

202:                                              ; preds = %97
  %203 = icmp ugt i32 %98, 3
  br i1 %203, label %204, label %274

204:                                              ; preds = %202
  %205 = mul i32 %32, %9
  %206 = zext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %67, i64 %206
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !7, !amdgpu.noclobber !6
  %209 = getelementptr inbounds float, float addrspace(1)* %22, i64 %61
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !7, !amdgpu.noclobber !6
  %211 = fmul contract float %208, %210
  %212 = getelementptr inbounds float, float addrspace(1)* %69, i64 %206
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !7, !amdgpu.noclobber !6
  %214 = sext i32 %84 to i64
  %215 = getelementptr inbounds float, float addrspace(1)* %22, i64 %214
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !7, !amdgpu.noclobber !6
  %217 = fmul contract float %213, %216
  %218 = fadd contract float %211, %217
  %219 = getelementptr inbounds float, float addrspace(1)* %70, i64 %206
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7, !amdgpu.noclobber !6
  %221 = add nsw i32 %40, 2
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %22, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !7, !amdgpu.noclobber !6
  %225 = fmul contract float %220, %224
  %226 = fadd contract float %218, %225
  %227 = getelementptr inbounds float, float addrspace(1)* %71, i64 %206
  %228 = load float, float addrspace(1)* %227, align 4, !tbaa !7, !amdgpu.noclobber !6
  %229 = add nsw i32 %40, 3
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %22, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7, !amdgpu.noclobber !6
  %233 = fmul contract float %228, %232
  %234 = fadd contract float %226, %233
  %235 = zext i32 %32 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %2, i64 %235
  store float %234, float addrspace(1)* %236, align 4, !tbaa !7
  %237 = getelementptr inbounds float, float addrspace(1)* %72, i64 %206
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !7
  %239 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  %240 = fmul contract float %238, %239
  %241 = load float, float addrspace(1)* %212, align 4, !tbaa !7
  %242 = load float, float addrspace(1)* %215, align 4, !tbaa !7
  %243 = fmul contract float %241, %242
  %244 = fadd contract float %240, %243
  %245 = load float, float addrspace(1)* %219, align 4, !tbaa !7
  %246 = load float, float addrspace(1)* %223, align 4, !tbaa !7
  %247 = fmul contract float %245, %246
  %248 = fadd contract float %244, %247
  %249 = load float, float addrspace(1)* %227, align 4, !tbaa !7
  %250 = load float, float addrspace(1)* %231, align 4, !tbaa !7
  %251 = fmul contract float %249, %250
  %252 = fadd contract float %248, %251
  %253 = getelementptr inbounds float, float addrspace(1)* %3, i64 %235
  store float %252, float addrspace(1)* %253, align 4, !tbaa !7
  %254 = getelementptr inbounds float, float addrspace(1)* %73, i64 %206
  %255 = load float, float addrspace(1)* %254, align 4, !tbaa !7
  %256 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  %257 = fmul contract float %255, %256
  %258 = load float, float addrspace(1)* %212, align 4, !tbaa !7
  %259 = load float, float addrspace(1)* %215, align 4, !tbaa !7
  %260 = fmul contract float %258, %259
  %261 = fadd contract float %257, %260
  %262 = load float, float addrspace(1)* %219, align 4, !tbaa !7
  %263 = load float, float addrspace(1)* %223, align 4, !tbaa !7
  %264 = fmul contract float %262, %263
  %265 = fadd contract float %261, %264
  %266 = load float, float addrspace(1)* %227, align 4, !tbaa !7
  %267 = load float, float addrspace(1)* %231, align 4, !tbaa !7
  %268 = fmul contract float %266, %267
  %269 = fadd contract float %265, %268
  br label %270

270:                                              ; preds = %99, %152, %204, %118
  %271 = phi i64 [ %133, %118 ], [ %235, %204 ], [ %175, %152 ], [ %107, %99 ]
  %272 = phi float [ %151, %118 ], [ %269, %204 ], [ %201, %152 ], [ %117, %99 ]
  %273 = getelementptr inbounds float, float addrspace(1)* %4, i64 %271
  store float %272, float addrspace(1)* %273, align 4, !tbaa !7
  br label %274

274:                                              ; preds = %270, %202
  %275 = icmp ugt i32 %98, 4
  br i1 %275, label %276, label %452

276:                                              ; preds = %274
  %277 = zext i32 %32 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %2, i64 %277
  %279 = mul i32 %32, %9
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds float, float addrspace(1)* %3, i64 %277
  %282 = getelementptr inbounds float, float addrspace(1)* %4, i64 %277
  %283 = getelementptr inbounds float, float addrspace(1)* %69, i64 %280
  %284 = getelementptr float, float addrspace(1)* %67, i64 %280
  %285 = getelementptr float, float addrspace(1)* %72, i64 %280
  %286 = add i32 %98, -5
  %287 = and i32 %98, 3
  %288 = icmp ult i32 %286, 3
  br i1 %288, label %423, label %289

289:                                              ; preds = %276
  %290 = and i32 %98, -4
  %291 = add i32 %290, -8
  br label %292

292:                                              ; preds = %292, %289
  %293 = phi i32 [ 4, %289 ], [ %378, %292 ]
  %294 = phi i32 [ 0, %289 ], [ %379, %292 ]
  %295 = mul i32 %64, %293
  %296 = sext i32 %295 to i64
  %297 = add nsw i32 %293, %40
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %22, i64 %298
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !7
  %301 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %302 = getelementptr float, float addrspace(1)* %284, i64 %296
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !7
  %304 = fmul contract float %300, %303
  %305 = fadd contract float %301, %304
  store float %305, float addrspace(1)* %278, align 4, !tbaa !7
  %306 = load float, float addrspace(1)* %281, align 4, !tbaa !7
  %307 = getelementptr float, float addrspace(1)* %285, i64 %296
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !7
  %309 = fmul contract float %300, %308
  %310 = fadd contract float %306, %309
  store float %310, float addrspace(1)* %281, align 4, !tbaa !7
  %311 = load float, float addrspace(1)* %282, align 4, !tbaa !7
  %312 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %313 = fmul contract float %300, %312
  %314 = fadd contract float %311, %313
  store float %314, float addrspace(1)* %282, align 4, !tbaa !7
  %315 = or i32 %293, 1
  %316 = mul i32 %64, %315
  %317 = sext i32 %316 to i64
  %318 = add nsw i32 %315, %40
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %22, i64 %319
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !7
  %322 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %323 = getelementptr float, float addrspace(1)* %284, i64 %317
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !7
  %325 = fmul contract float %321, %324
  %326 = fadd contract float %322, %325
  store float %326, float addrspace(1)* %278, align 4, !tbaa !7
  %327 = load float, float addrspace(1)* %281, align 4, !tbaa !7
  %328 = getelementptr float, float addrspace(1)* %285, i64 %317
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !7
  %330 = fmul contract float %321, %329
  %331 = fadd contract float %327, %330
  store float %331, float addrspace(1)* %281, align 4, !tbaa !7
  %332 = load float, float addrspace(1)* %282, align 4, !tbaa !7
  %333 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %334 = fmul contract float %321, %333
  %335 = fadd contract float %332, %334
  store float %335, float addrspace(1)* %282, align 4, !tbaa !7
  %336 = or i32 %293, 2
  %337 = mul i32 %64, %336
  %338 = sext i32 %337 to i64
  %339 = add nsw i32 %336, %40
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds float, float addrspace(1)* %22, i64 %340
  %342 = load float, float addrspace(1)* %341, align 4, !tbaa !7
  %343 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %344 = getelementptr float, float addrspace(1)* %284, i64 %338
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !7
  %346 = fmul contract float %342, %345
  %347 = fadd contract float %343, %346
  store float %347, float addrspace(1)* %278, align 4, !tbaa !7
  %348 = load float, float addrspace(1)* %281, align 4, !tbaa !7
  %349 = getelementptr float, float addrspace(1)* %285, i64 %338
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !7
  %351 = fmul contract float %342, %350
  %352 = fadd contract float %348, %351
  store float %352, float addrspace(1)* %281, align 4, !tbaa !7
  %353 = load float, float addrspace(1)* %282, align 4, !tbaa !7
  %354 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %355 = fmul contract float %342, %354
  %356 = fadd contract float %353, %355
  store float %356, float addrspace(1)* %282, align 4, !tbaa !7
  %357 = or i32 %293, 3
  %358 = mul i32 %64, %357
  %359 = sext i32 %358 to i64
  %360 = add nsw i32 %357, %40
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds float, float addrspace(1)* %22, i64 %361
  %363 = load float, float addrspace(1)* %362, align 4, !tbaa !7
  %364 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %365 = getelementptr float, float addrspace(1)* %284, i64 %359
  %366 = load float, float addrspace(1)* %365, align 4, !tbaa !7
  %367 = fmul contract float %363, %366
  %368 = fadd contract float %364, %367
  store float %368, float addrspace(1)* %278, align 4, !tbaa !7
  %369 = load float, float addrspace(1)* %281, align 4, !tbaa !7
  %370 = getelementptr float, float addrspace(1)* %285, i64 %359
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !7
  %372 = fmul contract float %363, %371
  %373 = fadd contract float %369, %372
  store float %373, float addrspace(1)* %281, align 4, !tbaa !7
  %374 = load float, float addrspace(1)* %282, align 4, !tbaa !7
  %375 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %376 = fmul contract float %363, %375
  %377 = fadd contract float %374, %376
  store float %377, float addrspace(1)* %282, align 4, !tbaa !7
  %378 = add nuw nsw i32 %293, 4
  %379 = add i32 %294, 4
  %380 = icmp eq i32 %294, %291
  br i1 %380, label %423, label %292, !llvm.loop !15

381:                                              ; preds = %82
  %382 = icmp ult i32 %40, %15
  %383 = sub nsw i32 %8, %16
  %384 = icmp uge i32 %40, %383
  %385 = select i1 %382, i1 true, i1 %384
  %386 = mul i32 %32, %9
  %387 = zext i32 %386 to i64
  %388 = getelementptr inbounds float, float addrspace(1)* %67, i64 %387
  %389 = load float, float addrspace(1)* %388, align 4, !tbaa !7
  br i1 %385, label %390, label %398

390:                                              ; preds = %381
  %391 = zext i32 %32 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %2, i64 %391
  store float %389, float addrspace(1)* %392, align 4, !tbaa !7
  %393 = getelementptr inbounds float, float addrspace(1)* %72, i64 %387
  %394 = load float, float addrspace(1)* %393, align 4, !tbaa !7
  %395 = getelementptr inbounds float, float addrspace(1)* %3, i64 %391
  store float %394, float addrspace(1)* %395, align 4, !tbaa !7
  %396 = getelementptr inbounds float, float addrspace(1)* %73, i64 %387
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !7
  br label %419

398:                                              ; preds = %381
  %399 = fmul contract float %59, %389
  %400 = getelementptr inbounds float, float addrspace(1)* %69, i64 %387
  %401 = load float, float addrspace(1)* %400, align 4, !tbaa !7, !amdgpu.noclobber !6
  %402 = fmul contract float %60, %401
  %403 = fadd contract float %399, %402
  %404 = zext i32 %32 to i64
  %405 = getelementptr inbounds float, float addrspace(1)* %2, i64 %404
  store float %403, float addrspace(1)* %405, align 4, !tbaa !7
  %406 = getelementptr inbounds float, float addrspace(1)* %72, i64 %387
  %407 = load float, float addrspace(1)* %406, align 4, !tbaa !7
  %408 = fmul contract float %59, %407
  %409 = load float, float addrspace(1)* %400, align 4, !tbaa !7
  %410 = fmul contract float %60, %409
  %411 = fadd contract float %408, %410
  %412 = getelementptr inbounds float, float addrspace(1)* %3, i64 %404
  store float %411, float addrspace(1)* %412, align 4, !tbaa !7
  %413 = getelementptr inbounds float, float addrspace(1)* %73, i64 %387
  %414 = load float, float addrspace(1)* %413, align 4, !tbaa !7
  %415 = fmul contract float %59, %414
  %416 = load float, float addrspace(1)* %400, align 4, !tbaa !7
  %417 = fmul contract float %60, %416
  %418 = fadd contract float %415, %417
  br label %419

419:                                              ; preds = %398, %390
  %420 = phi i64 [ %391, %390 ], [ %404, %398 ]
  %421 = phi float [ %397, %390 ], [ %418, %398 ]
  %422 = getelementptr inbounds float, float addrspace(1)* %4, i64 %420
  store float %421, float addrspace(1)* %422, align 4, !tbaa !7
  br label %452

423:                                              ; preds = %292, %276
  %424 = phi i32 [ 4, %276 ], [ %378, %292 ]
  %425 = icmp eq i32 %287, 0
  br i1 %425, label %452, label %426

426:                                              ; preds = %423, %426
  %427 = phi i32 [ %449, %426 ], [ %424, %423 ]
  %428 = phi i32 [ %450, %426 ], [ 0, %423 ]
  %429 = mul i32 %64, %427
  %430 = sext i32 %429 to i64
  %431 = add nsw i32 %427, %40
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds float, float addrspace(1)* %22, i64 %432
  %434 = load float, float addrspace(1)* %433, align 4, !tbaa !7
  %435 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %436 = getelementptr float, float addrspace(1)* %284, i64 %430
  %437 = load float, float addrspace(1)* %436, align 4, !tbaa !7
  %438 = fmul contract float %434, %437
  %439 = fadd contract float %435, %438
  store float %439, float addrspace(1)* %278, align 4, !tbaa !7
  %440 = load float, float addrspace(1)* %281, align 4, !tbaa !7
  %441 = getelementptr float, float addrspace(1)* %285, i64 %430
  %442 = load float, float addrspace(1)* %441, align 4, !tbaa !7
  %443 = fmul contract float %434, %442
  %444 = fadd contract float %440, %443
  store float %444, float addrspace(1)* %281, align 4, !tbaa !7
  %445 = load float, float addrspace(1)* %282, align 4, !tbaa !7
  %446 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %447 = fmul contract float %434, %446
  %448 = fadd contract float %445, %447
  store float %448, float addrspace(1)* %282, align 4, !tbaa !7
  %449 = add nuw nsw i32 %427, 1
  %450 = add i32 %428, 1
  %451 = icmp eq i32 %450, %287
  br i1 %451, label %452, label %426, !llvm.loop !16

452:                                              ; preds = %423, %426, %419, %274, %44
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %453 = icmp sgt i32 %5, %7
  br i1 %453, label %461, label %454

454:                                              ; preds = %452
  %455 = icmp sgt i32 %13, 0
  br i1 %455, label %456, label %736

456:                                              ; preds = %454
  %457 = and i32 %13, 3
  %458 = icmp ult i32 %13, 4
  br i1 %458, label %707, label %459

459:                                              ; preds = %456
  %460 = and i32 %13, -4
  br label %740

461:                                              ; preds = %452
  switch i32 %13, label %633 [
    i32 2, label %462
    i32 3, label %499
    i32 4, label %556
  ]

462:                                              ; preds = %461
  %463 = shl i32 %32, 2
  %464 = zext i32 %463 to i64
  %465 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %464
  %466 = load i32, i32 addrspace(1)* %465, align 4, !tbaa !11, !amdgpu.noclobber !6
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds float, float addrspace(1)* %2, i64 %467
  %469 = load float, float addrspace(1)* %468, align 4, !tbaa !7
  %470 = getelementptr inbounds float, float addrspace(1)* %19, i64 %464
  %471 = load float, float addrspace(1)* %470, align 4, !tbaa !7
  %472 = fmul contract float %469, %471
  %473 = add nsw i32 %466, 1
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds float, float addrspace(1)* %2, i64 %474
  %476 = load float, float addrspace(1)* %475, align 4, !tbaa !7
  %477 = add nuw nsw i32 %463, 1
  %478 = zext i32 %477 to i64
  %479 = getelementptr inbounds float, float addrspace(1)* %19, i64 %478
  %480 = load float, float addrspace(1)* %479, align 4, !tbaa !7
  %481 = fmul contract float %476, %480
  %482 = fadd contract float %472, %481
  %483 = zext i32 %32 to i64
  %484 = getelementptr inbounds float, float addrspace(1)* %78, i64 %483
  store float %482, float addrspace(1)* %484, align 4, !tbaa !7
  %485 = getelementptr inbounds float, float addrspace(1)* %3, i64 %467
  %486 = load float, float addrspace(1)* %485, align 4, !tbaa !7
  %487 = load float, float addrspace(1)* %470, align 4, !tbaa !7
  %488 = fmul contract float %486, %487
  %489 = getelementptr inbounds float, float addrspace(1)* %3, i64 %474
  %490 = load float, float addrspace(1)* %489, align 4, !tbaa !7
  %491 = load float, float addrspace(1)* %479, align 4, !tbaa !7
  %492 = fmul contract float %490, %491
  %493 = fadd contract float %488, %492
  %494 = getelementptr inbounds float, float addrspace(1)* %79, i64 %483
  store float %493, float addrspace(1)* %494, align 4, !tbaa !7
  %495 = getelementptr inbounds float, float addrspace(1)* %4, i64 %467
  %496 = load float, float addrspace(1)* %495, align 4, !tbaa !7
  %497 = load float, float addrspace(1)* %470, align 4, !tbaa !7
  %498 = fmul contract float %496, %497
  br label %897

499:                                              ; preds = %461
  %500 = shl i32 %32, 2
  %501 = zext i32 %500 to i64
  %502 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %501
  %503 = load i32, i32 addrspace(1)* %502, align 4, !tbaa !11, !amdgpu.noclobber !6
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds float, float addrspace(1)* %2, i64 %504
  %506 = load float, float addrspace(1)* %505, align 4, !tbaa !7
  %507 = getelementptr inbounds float, float addrspace(1)* %19, i64 %501
  %508 = load float, float addrspace(1)* %507, align 4, !tbaa !7
  %509 = fmul contract float %506, %508
  %510 = add nsw i32 %503, 1
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds float, float addrspace(1)* %2, i64 %511
  %513 = load float, float addrspace(1)* %512, align 4, !tbaa !7
  %514 = add nuw nsw i32 %500, 1
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, float addrspace(1)* %19, i64 %515
  %517 = load float, float addrspace(1)* %516, align 4, !tbaa !7
  %518 = fmul contract float %513, %517
  %519 = fadd contract float %509, %518
  %520 = add nsw i32 %503, 2
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds float, float addrspace(1)* %2, i64 %521
  %523 = load float, float addrspace(1)* %522, align 4, !tbaa !7
  %524 = add nuw nsw i32 %500, 2
  %525 = zext i32 %524 to i64
  %526 = getelementptr inbounds float, float addrspace(1)* %19, i64 %525
  %527 = load float, float addrspace(1)* %526, align 4, !tbaa !7
  %528 = fmul contract float %523, %527
  %529 = fadd contract float %519, %528
  %530 = zext i32 %32 to i64
  %531 = getelementptr inbounds float, float addrspace(1)* %78, i64 %530
  store float %529, float addrspace(1)* %531, align 4, !tbaa !7
  %532 = getelementptr inbounds float, float addrspace(1)* %3, i64 %504
  %533 = load float, float addrspace(1)* %532, align 4, !tbaa !7
  %534 = load float, float addrspace(1)* %507, align 4, !tbaa !7
  %535 = fmul contract float %533, %534
  %536 = getelementptr inbounds float, float addrspace(1)* %3, i64 %511
  %537 = load float, float addrspace(1)* %536, align 4, !tbaa !7
  %538 = load float, float addrspace(1)* %516, align 4, !tbaa !7
  %539 = fmul contract float %537, %538
  %540 = fadd contract float %535, %539
  %541 = getelementptr inbounds float, float addrspace(1)* %3, i64 %521
  %542 = load float, float addrspace(1)* %541, align 4, !tbaa !7
  %543 = load float, float addrspace(1)* %526, align 4, !tbaa !7
  %544 = fmul contract float %542, %543
  %545 = fadd contract float %540, %544
  %546 = getelementptr inbounds float, float addrspace(1)* %79, i64 %530
  store float %545, float addrspace(1)* %546, align 4, !tbaa !7
  %547 = getelementptr inbounds float, float addrspace(1)* %4, i64 %504
  %548 = load float, float addrspace(1)* %547, align 4, !tbaa !7
  %549 = load float, float addrspace(1)* %507, align 4, !tbaa !7
  %550 = fmul contract float %548, %549
  %551 = getelementptr inbounds float, float addrspace(1)* %4, i64 %511
  %552 = load float, float addrspace(1)* %551, align 4, !tbaa !7
  %553 = load float, float addrspace(1)* %516, align 4, !tbaa !7
  %554 = fmul contract float %552, %553
  %555 = fadd contract float %550, %554
  br label %897

556:                                              ; preds = %461
  %557 = shl i32 %32, 2
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %558
  %560 = load i32, i32 addrspace(1)* %559, align 4, !tbaa !11, !amdgpu.noclobber !6
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds float, float addrspace(1)* %2, i64 %561
  %563 = load float, float addrspace(1)* %562, align 4, !tbaa !7
  %564 = getelementptr inbounds float, float addrspace(1)* %19, i64 %558
  %565 = load float, float addrspace(1)* %564, align 4, !tbaa !7
  %566 = fmul contract float %563, %565
  %567 = add nsw i32 %560, 1
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds float, float addrspace(1)* %2, i64 %568
  %570 = load float, float addrspace(1)* %569, align 4, !tbaa !7
  %571 = add nuw nsw i32 %557, 1
  %572 = zext i32 %571 to i64
  %573 = getelementptr inbounds float, float addrspace(1)* %19, i64 %572
  %574 = load float, float addrspace(1)* %573, align 4, !tbaa !7
  %575 = fmul contract float %570, %574
  %576 = fadd contract float %566, %575
  %577 = add nsw i32 %560, 2
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds float, float addrspace(1)* %2, i64 %578
  %580 = load float, float addrspace(1)* %579, align 4, !tbaa !7
  %581 = add nuw nsw i32 %557, 2
  %582 = zext i32 %581 to i64
  %583 = getelementptr inbounds float, float addrspace(1)* %19, i64 %582
  %584 = load float, float addrspace(1)* %583, align 4, !tbaa !7
  %585 = fmul contract float %580, %584
  %586 = fadd contract float %576, %585
  %587 = add nsw i32 %560, 3
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds float, float addrspace(1)* %2, i64 %588
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !7
  %591 = add nuw nsw i32 %557, 3
  %592 = zext i32 %591 to i64
  %593 = getelementptr inbounds float, float addrspace(1)* %19, i64 %592
  %594 = load float, float addrspace(1)* %593, align 4, !tbaa !7
  %595 = fmul contract float %590, %594
  %596 = fadd contract float %586, %595
  %597 = zext i32 %32 to i64
  %598 = getelementptr inbounds float, float addrspace(1)* %78, i64 %597
  store float %596, float addrspace(1)* %598, align 4, !tbaa !7
  %599 = getelementptr inbounds float, float addrspace(1)* %3, i64 %561
  %600 = load float, float addrspace(1)* %599, align 4, !tbaa !7
  %601 = load float, float addrspace(1)* %564, align 4, !tbaa !7
  %602 = fmul contract float %600, %601
  %603 = getelementptr inbounds float, float addrspace(1)* %3, i64 %568
  %604 = load float, float addrspace(1)* %603, align 4, !tbaa !7
  %605 = load float, float addrspace(1)* %573, align 4, !tbaa !7
  %606 = fmul contract float %604, %605
  %607 = fadd contract float %602, %606
  %608 = getelementptr inbounds float, float addrspace(1)* %3, i64 %578
  %609 = load float, float addrspace(1)* %608, align 4, !tbaa !7
  %610 = load float, float addrspace(1)* %583, align 4, !tbaa !7
  %611 = fmul contract float %609, %610
  %612 = fadd contract float %607, %611
  %613 = getelementptr inbounds float, float addrspace(1)* %3, i64 %588
  %614 = load float, float addrspace(1)* %613, align 4, !tbaa !7
  %615 = load float, float addrspace(1)* %593, align 4, !tbaa !7
  %616 = fmul contract float %614, %615
  %617 = fadd contract float %612, %616
  %618 = getelementptr inbounds float, float addrspace(1)* %79, i64 %597
  store float %617, float addrspace(1)* %618, align 4, !tbaa !7
  %619 = getelementptr inbounds float, float addrspace(1)* %4, i64 %561
  %620 = load float, float addrspace(1)* %619, align 4, !tbaa !7
  %621 = load float, float addrspace(1)* %564, align 4, !tbaa !7
  %622 = fmul contract float %620, %621
  %623 = getelementptr inbounds float, float addrspace(1)* %4, i64 %568
  %624 = load float, float addrspace(1)* %623, align 4, !tbaa !7
  %625 = load float, float addrspace(1)* %573, align 4, !tbaa !7
  %626 = fmul contract float %624, %625
  %627 = fadd contract float %622, %626
  %628 = getelementptr inbounds float, float addrspace(1)* %4, i64 %578
  %629 = load float, float addrspace(1)* %628, align 4, !tbaa !7
  %630 = load float, float addrspace(1)* %583, align 4, !tbaa !7
  %631 = fmul contract float %629, %630
  %632 = fadd contract float %627, %631
  br label %897

633:                                              ; preds = %461
  %634 = icmp sgt i32 %13, 4
  %635 = icmp sgt i32 %12, 0
  %636 = select i1 %634, i1 %635, i1 false
  br i1 %636, label %637, label %942

637:                                              ; preds = %633
  %638 = and i32 %12, 1
  %639 = icmp eq i32 %12, 1
  br i1 %639, label %910, label %640

640:                                              ; preds = %637
  %641 = and i32 %12, -2
  br label %642

642:                                              ; preds = %642, %640
  %643 = phi i32 [ 0, %640 ], [ %704, %642 ]
  %644 = phi i32 [ 0, %640 ], [ %705, %642 ]
  %645 = zext i32 %643 to i64
  %646 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %645
  %647 = load i32, i32 addrspace(1)* %646, align 4, !tbaa !11, !amdgpu.noclobber !6
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds float, float addrspace(1)* %2, i64 %648
  %650 = load float, float addrspace(1)* %649, align 4, !tbaa !7
  %651 = getelementptr inbounds float, float addrspace(1)* %19, i64 %645
  %652 = load float, float addrspace(1)* %651, align 4, !tbaa !7
  %653 = fmul contract float %650, %652
  %654 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %645
  %655 = load i32, i32 addrspace(1)* %654, align 4, !tbaa !11, !amdgpu.noclobber !6
  %656 = sext i32 %655 to i64
  %657 = getelementptr inbounds float, float addrspace(1)* %78, i64 %656
  %658 = load float, float addrspace(1)* %657, align 4, !tbaa !7
  %659 = fadd contract float %653, %658
  store float %659, float addrspace(1)* %657, align 4, !tbaa !7
  %660 = getelementptr inbounds float, float addrspace(1)* %3, i64 %648
  %661 = load float, float addrspace(1)* %660, align 4, !tbaa !7
  %662 = load float, float addrspace(1)* %651, align 4, !tbaa !7
  %663 = fmul contract float %661, %662
  %664 = getelementptr inbounds float, float addrspace(1)* %79, i64 %656
  %665 = load float, float addrspace(1)* %664, align 4, !tbaa !7
  %666 = fadd contract float %665, %663
  store float %666, float addrspace(1)* %664, align 4, !tbaa !7
  %667 = getelementptr inbounds float, float addrspace(1)* %4, i64 %648
  %668 = load float, float addrspace(1)* %667, align 4, !tbaa !7
  %669 = load float, float addrspace(1)* %651, align 4, !tbaa !7
  %670 = fmul contract float %668, %669
  %671 = getelementptr inbounds float, float addrspace(1)* %80, i64 %656
  %672 = load float, float addrspace(1)* %671, align 4, !tbaa !7
  %673 = fadd contract float %672, %670
  store float %673, float addrspace(1)* %671, align 4, !tbaa !7
  %674 = or i32 %643, 1
  %675 = zext i32 %674 to i64
  %676 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %675
  %677 = load i32, i32 addrspace(1)* %676, align 4, !tbaa !11, !amdgpu.noclobber !6
  %678 = sext i32 %677 to i64
  %679 = getelementptr inbounds float, float addrspace(1)* %2, i64 %678
  %680 = load float, float addrspace(1)* %679, align 4, !tbaa !7
  %681 = getelementptr inbounds float, float addrspace(1)* %19, i64 %675
  %682 = load float, float addrspace(1)* %681, align 4, !tbaa !7
  %683 = fmul contract float %680, %682
  %684 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %675
  %685 = load i32, i32 addrspace(1)* %684, align 4, !tbaa !11, !amdgpu.noclobber !6
  %686 = sext i32 %685 to i64
  %687 = getelementptr inbounds float, float addrspace(1)* %78, i64 %686
  %688 = load float, float addrspace(1)* %687, align 4, !tbaa !7
  %689 = fadd contract float %683, %688
  store float %689, float addrspace(1)* %687, align 4, !tbaa !7
  %690 = getelementptr inbounds float, float addrspace(1)* %3, i64 %678
  %691 = load float, float addrspace(1)* %690, align 4, !tbaa !7
  %692 = load float, float addrspace(1)* %681, align 4, !tbaa !7
  %693 = fmul contract float %691, %692
  %694 = getelementptr inbounds float, float addrspace(1)* %79, i64 %686
  %695 = load float, float addrspace(1)* %694, align 4, !tbaa !7
  %696 = fadd contract float %695, %693
  store float %696, float addrspace(1)* %694, align 4, !tbaa !7
  %697 = getelementptr inbounds float, float addrspace(1)* %4, i64 %678
  %698 = load float, float addrspace(1)* %697, align 4, !tbaa !7
  %699 = load float, float addrspace(1)* %681, align 4, !tbaa !7
  %700 = fmul contract float %698, %699
  %701 = getelementptr inbounds float, float addrspace(1)* %80, i64 %686
  %702 = load float, float addrspace(1)* %701, align 4, !tbaa !7
  %703 = fadd contract float %702, %700
  store float %703, float addrspace(1)* %701, align 4, !tbaa !7
  %704 = add nuw nsw i32 %643, 2
  %705 = add i32 %644, 2
  %706 = icmp eq i32 %705, %641
  br i1 %706, label %908, label %642, !llvm.loop !18

707:                                              ; preds = %740, %456
  %708 = phi i32 [ 0, %456 ], [ %826, %740 ]
  %709 = icmp eq i32 %457, 0
  br i1 %709, label %736, label %710

710:                                              ; preds = %707, %710
  %711 = phi i32 [ %733, %710 ], [ %708, %707 ]
  %712 = phi i32 [ %734, %710 ], [ 0, %707 ]
  %713 = zext i32 %711 to i64
  %714 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %713
  %715 = load i32, i32 addrspace(1)* %714, align 4, !tbaa !11, !amdgpu.noclobber !6
  %716 = sext i32 %715 to i64
  %717 = getelementptr inbounds float, float addrspace(1)* %2, i64 %716
  %718 = load float, float addrspace(1)* %717, align 4, !tbaa !7
  %719 = getelementptr inbounds float, float addrspace(1)* %19, i64 %713
  %720 = load float, float addrspace(1)* %719, align 4, !tbaa !7
  %721 = fmul contract float %718, %720
  %722 = getelementptr inbounds float, float addrspace(1)* %78, i64 %713
  store float %721, float addrspace(1)* %722, align 4, !tbaa !7
  %723 = getelementptr inbounds float, float addrspace(1)* %3, i64 %716
  %724 = load float, float addrspace(1)* %723, align 4, !tbaa !7
  %725 = load float, float addrspace(1)* %719, align 4, !tbaa !7
  %726 = fmul contract float %724, %725
  %727 = getelementptr inbounds float, float addrspace(1)* %79, i64 %713
  store float %726, float addrspace(1)* %727, align 4, !tbaa !7
  %728 = getelementptr inbounds float, float addrspace(1)* %4, i64 %716
  %729 = load float, float addrspace(1)* %728, align 4, !tbaa !7
  %730 = load float, float addrspace(1)* %719, align 4, !tbaa !7
  %731 = fmul contract float %729, %730
  %732 = getelementptr inbounds float, float addrspace(1)* %80, i64 %713
  store float %731, float addrspace(1)* %732, align 4, !tbaa !7
  %733 = add nuw nsw i32 %711, 1
  %734 = add i32 %712, 1
  %735 = icmp eq i32 %734, %457
  br i1 %735, label %736, label %710, !llvm.loop !19

736:                                              ; preds = %707, %710, %454
  %737 = phi i32 [ 0, %454 ], [ %13, %710 ], [ %13, %707 ]
  %738 = sub nsw i32 %7, %14
  %739 = icmp slt i32 %737, %738
  br i1 %739, label %832, label %829

740:                                              ; preds = %740, %459
  %741 = phi i32 [ 0, %459 ], [ %826, %740 ]
  %742 = phi i32 [ 0, %459 ], [ %827, %740 ]
  %743 = zext i32 %741 to i64
  %744 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %743
  %745 = load i32, i32 addrspace(1)* %744, align 4, !tbaa !11, !amdgpu.noclobber !6
  %746 = sext i32 %745 to i64
  %747 = getelementptr inbounds float, float addrspace(1)* %2, i64 %746
  %748 = load float, float addrspace(1)* %747, align 4, !tbaa !7
  %749 = getelementptr inbounds float, float addrspace(1)* %19, i64 %743
  %750 = load float, float addrspace(1)* %749, align 4, !tbaa !7
  %751 = fmul contract float %748, %750
  %752 = getelementptr inbounds float, float addrspace(1)* %78, i64 %743
  store float %751, float addrspace(1)* %752, align 4, !tbaa !7
  %753 = getelementptr inbounds float, float addrspace(1)* %3, i64 %746
  %754 = load float, float addrspace(1)* %753, align 4, !tbaa !7
  %755 = load float, float addrspace(1)* %749, align 4, !tbaa !7
  %756 = fmul contract float %754, %755
  %757 = getelementptr inbounds float, float addrspace(1)* %79, i64 %743
  store float %756, float addrspace(1)* %757, align 4, !tbaa !7
  %758 = getelementptr inbounds float, float addrspace(1)* %4, i64 %746
  %759 = load float, float addrspace(1)* %758, align 4, !tbaa !7
  %760 = load float, float addrspace(1)* %749, align 4, !tbaa !7
  %761 = fmul contract float %759, %760
  %762 = getelementptr inbounds float, float addrspace(1)* %80, i64 %743
  store float %761, float addrspace(1)* %762, align 4, !tbaa !7
  %763 = or i32 %741, 1
  %764 = zext i32 %763 to i64
  %765 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %764
  %766 = load i32, i32 addrspace(1)* %765, align 4, !tbaa !11, !amdgpu.noclobber !6
  %767 = sext i32 %766 to i64
  %768 = getelementptr inbounds float, float addrspace(1)* %2, i64 %767
  %769 = load float, float addrspace(1)* %768, align 4, !tbaa !7
  %770 = getelementptr inbounds float, float addrspace(1)* %19, i64 %764
  %771 = load float, float addrspace(1)* %770, align 4, !tbaa !7
  %772 = fmul contract float %769, %771
  %773 = getelementptr inbounds float, float addrspace(1)* %78, i64 %764
  store float %772, float addrspace(1)* %773, align 4, !tbaa !7
  %774 = getelementptr inbounds float, float addrspace(1)* %3, i64 %767
  %775 = load float, float addrspace(1)* %774, align 4, !tbaa !7
  %776 = load float, float addrspace(1)* %770, align 4, !tbaa !7
  %777 = fmul contract float %775, %776
  %778 = getelementptr inbounds float, float addrspace(1)* %79, i64 %764
  store float %777, float addrspace(1)* %778, align 4, !tbaa !7
  %779 = getelementptr inbounds float, float addrspace(1)* %4, i64 %767
  %780 = load float, float addrspace(1)* %779, align 4, !tbaa !7
  %781 = load float, float addrspace(1)* %770, align 4, !tbaa !7
  %782 = fmul contract float %780, %781
  %783 = getelementptr inbounds float, float addrspace(1)* %80, i64 %764
  store float %782, float addrspace(1)* %783, align 4, !tbaa !7
  %784 = or i32 %741, 2
  %785 = zext i32 %784 to i64
  %786 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %785
  %787 = load i32, i32 addrspace(1)* %786, align 4, !tbaa !11, !amdgpu.noclobber !6
  %788 = sext i32 %787 to i64
  %789 = getelementptr inbounds float, float addrspace(1)* %2, i64 %788
  %790 = load float, float addrspace(1)* %789, align 4, !tbaa !7
  %791 = getelementptr inbounds float, float addrspace(1)* %19, i64 %785
  %792 = load float, float addrspace(1)* %791, align 4, !tbaa !7
  %793 = fmul contract float %790, %792
  %794 = getelementptr inbounds float, float addrspace(1)* %78, i64 %785
  store float %793, float addrspace(1)* %794, align 4, !tbaa !7
  %795 = getelementptr inbounds float, float addrspace(1)* %3, i64 %788
  %796 = load float, float addrspace(1)* %795, align 4, !tbaa !7
  %797 = load float, float addrspace(1)* %791, align 4, !tbaa !7
  %798 = fmul contract float %796, %797
  %799 = getelementptr inbounds float, float addrspace(1)* %79, i64 %785
  store float %798, float addrspace(1)* %799, align 4, !tbaa !7
  %800 = getelementptr inbounds float, float addrspace(1)* %4, i64 %788
  %801 = load float, float addrspace(1)* %800, align 4, !tbaa !7
  %802 = load float, float addrspace(1)* %791, align 4, !tbaa !7
  %803 = fmul contract float %801, %802
  %804 = getelementptr inbounds float, float addrspace(1)* %80, i64 %785
  store float %803, float addrspace(1)* %804, align 4, !tbaa !7
  %805 = or i32 %741, 3
  %806 = zext i32 %805 to i64
  %807 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %806
  %808 = load i32, i32 addrspace(1)* %807, align 4, !tbaa !11, !amdgpu.noclobber !6
  %809 = sext i32 %808 to i64
  %810 = getelementptr inbounds float, float addrspace(1)* %2, i64 %809
  %811 = load float, float addrspace(1)* %810, align 4, !tbaa !7
  %812 = getelementptr inbounds float, float addrspace(1)* %19, i64 %806
  %813 = load float, float addrspace(1)* %812, align 4, !tbaa !7
  %814 = fmul contract float %811, %813
  %815 = getelementptr inbounds float, float addrspace(1)* %78, i64 %806
  store float %814, float addrspace(1)* %815, align 4, !tbaa !7
  %816 = getelementptr inbounds float, float addrspace(1)* %3, i64 %809
  %817 = load float, float addrspace(1)* %816, align 4, !tbaa !7
  %818 = load float, float addrspace(1)* %812, align 4, !tbaa !7
  %819 = fmul contract float %817, %818
  %820 = getelementptr inbounds float, float addrspace(1)* %79, i64 %806
  store float %819, float addrspace(1)* %820, align 4, !tbaa !7
  %821 = getelementptr inbounds float, float addrspace(1)* %4, i64 %809
  %822 = load float, float addrspace(1)* %821, align 4, !tbaa !7
  %823 = load float, float addrspace(1)* %812, align 4, !tbaa !7
  %824 = fmul contract float %822, %823
  %825 = getelementptr inbounds float, float addrspace(1)* %80, i64 %806
  store float %824, float addrspace(1)* %825, align 4, !tbaa !7
  %826 = add nuw nsw i32 %741, 4
  %827 = add i32 %742, 4
  %828 = icmp eq i32 %827, %460
  br i1 %828, label %707, label %740, !llvm.loop !20

829:                                              ; preds = %832, %736
  %830 = phi i32 [ %737, %736 ], [ %871, %832 ]
  %831 = icmp slt i32 %830, %7
  br i1 %831, label %873, label %942

832:                                              ; preds = %736, %832
  %833 = phi i32 [ %871, %832 ], [ %737, %736 ]
  %834 = zext i32 %833 to i64
  %835 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %834
  %836 = load i32, i32 addrspace(1)* %835, align 4, !tbaa !11, !amdgpu.noclobber !6
  %837 = sext i32 %836 to i64
  %838 = getelementptr inbounds float, float addrspace(1)* %2, i64 %837
  %839 = load float, float addrspace(1)* %838, align 4, !tbaa !7
  %840 = getelementptr inbounds float, float addrspace(1)* %19, i64 %834
  %841 = load float, float addrspace(1)* %840, align 4, !tbaa !7
  %842 = fmul contract float %839, %841
  %843 = add nsw i32 %836, 1
  %844 = sext i32 %843 to i64
  %845 = getelementptr inbounds float, float addrspace(1)* %2, i64 %844
  %846 = load float, float addrspace(1)* %845, align 4, !tbaa !7
  %847 = fsub contract float %10, %841
  %848 = fmul contract float %846, %847
  %849 = fadd contract float %842, %848
  %850 = getelementptr inbounds float, float addrspace(1)* %78, i64 %834
  store float %849, float addrspace(1)* %850, align 4, !tbaa !7
  %851 = getelementptr inbounds float, float addrspace(1)* %3, i64 %837
  %852 = load float, float addrspace(1)* %851, align 4, !tbaa !7
  %853 = load float, float addrspace(1)* %840, align 4, !tbaa !7
  %854 = fmul contract float %852, %853
  %855 = getelementptr inbounds float, float addrspace(1)* %3, i64 %844
  %856 = load float, float addrspace(1)* %855, align 4, !tbaa !7
  %857 = fsub contract float %10, %853
  %858 = fmul contract float %856, %857
  %859 = fadd contract float %854, %858
  %860 = getelementptr inbounds float, float addrspace(1)* %79, i64 %834
  store float %859, float addrspace(1)* %860, align 4, !tbaa !7
  %861 = getelementptr inbounds float, float addrspace(1)* %4, i64 %837
  %862 = load float, float addrspace(1)* %861, align 4, !tbaa !7
  %863 = load float, float addrspace(1)* %840, align 4, !tbaa !7
  %864 = fmul contract float %862, %863
  %865 = getelementptr inbounds float, float addrspace(1)* %4, i64 %844
  %866 = load float, float addrspace(1)* %865, align 4, !tbaa !7
  %867 = fsub contract float %10, %863
  %868 = fmul contract float %866, %867
  %869 = fadd contract float %864, %868
  %870 = getelementptr inbounds float, float addrspace(1)* %80, i64 %834
  store float %869, float addrspace(1)* %870, align 4, !tbaa !7
  %871 = add nuw nsw i32 %833, 1
  %872 = icmp slt i32 %871, %738
  br i1 %872, label %832, label %829, !llvm.loop !21

873:                                              ; preds = %829, %873
  %874 = phi i32 [ %895, %873 ], [ %830, %829 ]
  %875 = zext i32 %874 to i64
  %876 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %875
  %877 = load i32, i32 addrspace(1)* %876, align 4, !tbaa !11, !amdgpu.noclobber !6
  %878 = sext i32 %877 to i64
  %879 = getelementptr inbounds float, float addrspace(1)* %2, i64 %878
  %880 = load float, float addrspace(1)* %879, align 4, !tbaa !7
  %881 = getelementptr inbounds float, float addrspace(1)* %19, i64 %875
  %882 = load float, float addrspace(1)* %881, align 4, !tbaa !7
  %883 = fmul contract float %880, %882
  %884 = getelementptr inbounds float, float addrspace(1)* %78, i64 %875
  store float %883, float addrspace(1)* %884, align 4, !tbaa !7
  %885 = getelementptr inbounds float, float addrspace(1)* %3, i64 %878
  %886 = load float, float addrspace(1)* %885, align 4, !tbaa !7
  %887 = load float, float addrspace(1)* %881, align 4, !tbaa !7
  %888 = fmul contract float %886, %887
  %889 = getelementptr inbounds float, float addrspace(1)* %79, i64 %875
  store float %888, float addrspace(1)* %889, align 4, !tbaa !7
  %890 = getelementptr inbounds float, float addrspace(1)* %4, i64 %878
  %891 = load float, float addrspace(1)* %890, align 4, !tbaa !7
  %892 = load float, float addrspace(1)* %881, align 4, !tbaa !7
  %893 = fmul contract float %891, %892
  %894 = getelementptr inbounds float, float addrspace(1)* %80, i64 %875
  store float %893, float addrspace(1)* %894, align 4, !tbaa !7
  %895 = add nuw nsw i32 %874, 1
  %896 = icmp slt i32 %895, %7
  br i1 %896, label %873, label %942, !llvm.loop !22

897:                                              ; preds = %462, %556, %499
  %898 = phi i64 [ %521, %499 ], [ %588, %556 ], [ %474, %462 ]
  %899 = phi float addrspace(1)* [ %526, %499 ], [ %593, %556 ], [ %479, %462 ]
  %900 = phi float [ %555, %499 ], [ %632, %556 ], [ %498, %462 ]
  %901 = phi i64 [ %530, %499 ], [ %597, %556 ], [ %483, %462 ]
  %902 = getelementptr inbounds float, float addrspace(1)* %4, i64 %898
  %903 = load float, float addrspace(1)* %902, align 4, !tbaa !7
  %904 = load float, float addrspace(1)* %899, align 4, !tbaa !7
  %905 = fmul contract float %903, %904
  %906 = fadd contract float %900, %905
  %907 = getelementptr inbounds float, float addrspace(1)* %80, i64 %901
  store float %906, float addrspace(1)* %907, align 4, !tbaa !7
  br label %942

908:                                              ; preds = %642
  %909 = zext i32 %704 to i64
  br label %910

910:                                              ; preds = %908, %637
  %911 = phi i64 [ 0, %637 ], [ %909, %908 ]
  %912 = icmp eq i32 %638, 0
  br i1 %912, label %942, label %913

913:                                              ; preds = %910
  %914 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %911
  %915 = load i32, i32 addrspace(1)* %914, align 4, !tbaa !11, !amdgpu.noclobber !6
  %916 = sext i32 %915 to i64
  %917 = getelementptr inbounds float, float addrspace(1)* %2, i64 %916
  %918 = load float, float addrspace(1)* %917, align 4, !tbaa !7
  %919 = getelementptr inbounds float, float addrspace(1)* %19, i64 %911
  %920 = load float, float addrspace(1)* %919, align 4, !tbaa !7
  %921 = fmul contract float %918, %920
  %922 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %911
  %923 = load i32, i32 addrspace(1)* %922, align 4, !tbaa !11, !amdgpu.noclobber !6
  %924 = sext i32 %923 to i64
  %925 = getelementptr inbounds float, float addrspace(1)* %78, i64 %924
  %926 = load float, float addrspace(1)* %925, align 4, !tbaa !7
  %927 = fadd contract float %921, %926
  store float %927, float addrspace(1)* %925, align 4, !tbaa !7
  %928 = getelementptr inbounds float, float addrspace(1)* %3, i64 %916
  %929 = load float, float addrspace(1)* %928, align 4, !tbaa !7
  %930 = load float, float addrspace(1)* %919, align 4, !tbaa !7
  %931 = fmul contract float %929, %930
  %932 = getelementptr inbounds float, float addrspace(1)* %79, i64 %924
  %933 = load float, float addrspace(1)* %932, align 4, !tbaa !7
  %934 = fadd contract float %933, %931
  store float %934, float addrspace(1)* %932, align 4, !tbaa !7
  %935 = getelementptr inbounds float, float addrspace(1)* %4, i64 %916
  %936 = load float, float addrspace(1)* %935, align 4, !tbaa !7
  %937 = load float, float addrspace(1)* %919, align 4, !tbaa !7
  %938 = fmul contract float %936, %937
  %939 = getelementptr inbounds float, float addrspace(1)* %80, i64 %924
  %940 = load float, float addrspace(1)* %939, align 4, !tbaa !7
  %941 = fadd contract float %940, %938
  store float %941, float addrspace(1)* %939, align 4, !tbaa !7
  br label %942

942:                                              ; preds = %873, %913, %910, %897, %829, %633
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %943

943:                                              ; preds = %942, %23
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
