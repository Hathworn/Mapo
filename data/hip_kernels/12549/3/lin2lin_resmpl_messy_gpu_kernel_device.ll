; ModuleID = '../data/hip_kernels/12549/3/main.cu'
source_filename = "../data/hip_kernels/12549/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@lTable_const = protected local_unnamed_addr addrspace(4) externally_initialized global [1064 x float] zeroinitializer, align 16
@mr_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mg_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mb_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z31lin2lin_resmpl_messy_gpu_kernelPfS_S_S_S_iiiiifiiiiiiPiS0_S_S0_S0_S_(float addrspace(1)* readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 addrspace(1)* nocapture readonly %17, i32 addrspace(1)* nocapture readonly %18, float addrspace(1)* nocapture readonly %19, i32 addrspace(1)* nocapture readonly %20, i32 addrspace(1)* nocapture readonly %21, float addrspace(1)* nocapture readonly %22) local_unnamed_addr #0 {
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
  br i1 %43, label %44, label %929

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
  %81 = icmp ugt i32 %32, %5
  br i1 %81, label %82, label %438

82:                                               ; preds = %44
  br i1 %54, label %83, label %371

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
  switch i32 %98, label %196 [
    i32 1, label %99
    i32 2, label %116
    i32 3, label %148
  ]

99:                                               ; preds = %97
  %100 = zext i32 %32 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %67, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !6
  %103 = getelementptr inbounds float, float addrspace(1)* %22, i64 %61
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !6
  %105 = fmul contract float %102, %104
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  store float %105, float addrspace(1)* %106, align 4, !tbaa !7
  %107 = getelementptr inbounds float, float addrspace(1)* %72, i64 %100
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %110 = fmul contract float %108, %109
  %111 = getelementptr inbounds float, float addrspace(1)* %3, i64 %100
  store float %110, float addrspace(1)* %111, align 4, !tbaa !7
  %112 = getelementptr inbounds float, float addrspace(1)* %73, i64 %100
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %115 = fmul contract float %113, %114
  br label %262

116:                                              ; preds = %97
  %117 = zext i32 %32 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %67, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !6
  %120 = getelementptr inbounds float, float addrspace(1)* %22, i64 %61
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = fmul contract float %119, %121
  %123 = getelementptr inbounds float, float addrspace(1)* %69, i64 %117
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !6
  %125 = sext i32 %84 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %22, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !6
  %128 = fmul contract float %124, %127
  %129 = fadd contract float %122, %128
  %130 = getelementptr inbounds float, float addrspace(1)* %2, i64 %117
  store float %129, float addrspace(1)* %130, align 4, !tbaa !7
  %131 = getelementptr inbounds float, float addrspace(1)* %72, i64 %117
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %134 = fmul contract float %132, %133
  %135 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %136 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = getelementptr inbounds float, float addrspace(1)* %3, i64 %117
  store float %138, float addrspace(1)* %139, align 4, !tbaa !7
  %140 = getelementptr inbounds float, float addrspace(1)* %73, i64 %117
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %143 = fmul contract float %141, %142
  %144 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %145 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %143, %146
  br label %262

148:                                              ; preds = %97
  %149 = zext i32 %32 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %67, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !6
  %152 = getelementptr inbounds float, float addrspace(1)* %22, i64 %61
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !6
  %154 = fmul contract float %151, %153
  %155 = getelementptr inbounds float, float addrspace(1)* %69, i64 %149
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !6
  %157 = sext i32 %84 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %22, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !6
  %160 = fmul contract float %156, %159
  %161 = fadd contract float %154, %160
  %162 = getelementptr inbounds float, float addrspace(1)* %70, i64 %149
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !6
  %164 = add nsw i32 %40, 2
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %22, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !6
  %168 = fmul contract float %163, %167
  %169 = fadd contract float %161, %168
  %170 = getelementptr inbounds float, float addrspace(1)* %2, i64 %149
  store float %169, float addrspace(1)* %170, align 4, !tbaa !7
  %171 = getelementptr inbounds float, float addrspace(1)* %72, i64 %149
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7
  %173 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %174 = fmul contract float %172, %173
  %175 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %176 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %177 = fmul contract float %175, %176
  %178 = fadd contract float %174, %177
  %179 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %180 = load float, float addrspace(1)* %166, align 4, !tbaa !7
  %181 = fmul contract float %179, %180
  %182 = fadd contract float %178, %181
  %183 = getelementptr inbounds float, float addrspace(1)* %3, i64 %149
  store float %182, float addrspace(1)* %183, align 4, !tbaa !7
  %184 = getelementptr inbounds float, float addrspace(1)* %73, i64 %149
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7
  %186 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %187 = fmul contract float %185, %186
  %188 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %189 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %190 = fmul contract float %188, %189
  %191 = fadd contract float %187, %190
  %192 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %193 = load float, float addrspace(1)* %166, align 4, !tbaa !7
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %191, %194
  br label %262

196:                                              ; preds = %97
  %197 = icmp ugt i32 %98, 3
  br i1 %197, label %198, label %266

198:                                              ; preds = %196
  %199 = zext i32 %32 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %67, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !7, !amdgpu.noclobber !6
  %202 = getelementptr inbounds float, float addrspace(1)* %22, i64 %61
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7, !amdgpu.noclobber !6
  %204 = fmul contract float %201, %203
  %205 = getelementptr inbounds float, float addrspace(1)* %69, i64 %199
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !7, !amdgpu.noclobber !6
  %207 = sext i32 %84 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %22, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !7, !amdgpu.noclobber !6
  %210 = fmul contract float %206, %209
  %211 = fadd contract float %204, %210
  %212 = getelementptr inbounds float, float addrspace(1)* %70, i64 %199
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !7, !amdgpu.noclobber !6
  %214 = add nsw i32 %40, 2
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %22, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !7, !amdgpu.noclobber !6
  %218 = fmul contract float %213, %217
  %219 = fadd contract float %211, %218
  %220 = getelementptr inbounds float, float addrspace(1)* %71, i64 %199
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !7, !amdgpu.noclobber !6
  %222 = add nsw i32 %40, 3
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %22, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7, !amdgpu.noclobber !6
  %226 = fmul contract float %221, %225
  %227 = fadd contract float %219, %226
  %228 = getelementptr inbounds float, float addrspace(1)* %2, i64 %199
  store float %227, float addrspace(1)* %228, align 4, !tbaa !7
  %229 = getelementptr inbounds float, float addrspace(1)* %72, i64 %199
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !7
  %231 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %232 = fmul contract float %230, %231
  %233 = load float, float addrspace(1)* %205, align 4, !tbaa !7
  %234 = load float, float addrspace(1)* %208, align 4, !tbaa !7
  %235 = fmul contract float %233, %234
  %236 = fadd contract float %232, %235
  %237 = load float, float addrspace(1)* %212, align 4, !tbaa !7
  %238 = load float, float addrspace(1)* %216, align 4, !tbaa !7
  %239 = fmul contract float %237, %238
  %240 = fadd contract float %236, %239
  %241 = load float, float addrspace(1)* %220, align 4, !tbaa !7
  %242 = load float, float addrspace(1)* %224, align 4, !tbaa !7
  %243 = fmul contract float %241, %242
  %244 = fadd contract float %240, %243
  %245 = getelementptr inbounds float, float addrspace(1)* %3, i64 %199
  store float %244, float addrspace(1)* %245, align 4, !tbaa !7
  %246 = getelementptr inbounds float, float addrspace(1)* %73, i64 %199
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7
  %248 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %249 = fmul contract float %247, %248
  %250 = load float, float addrspace(1)* %205, align 4, !tbaa !7
  %251 = load float, float addrspace(1)* %208, align 4, !tbaa !7
  %252 = fmul contract float %250, %251
  %253 = fadd contract float %249, %252
  %254 = load float, float addrspace(1)* %212, align 4, !tbaa !7
  %255 = load float, float addrspace(1)* %216, align 4, !tbaa !7
  %256 = fmul contract float %254, %255
  %257 = fadd contract float %253, %256
  %258 = load float, float addrspace(1)* %220, align 4, !tbaa !7
  %259 = load float, float addrspace(1)* %224, align 4, !tbaa !7
  %260 = fmul contract float %258, %259
  %261 = fadd contract float %257, %260
  br label %262

262:                                              ; preds = %99, %148, %198, %116
  %263 = phi i64 [ %117, %116 ], [ %199, %198 ], [ %149, %148 ], [ %100, %99 ]
  %264 = phi float [ %147, %116 ], [ %261, %198 ], [ %195, %148 ], [ %115, %99 ]
  %265 = getelementptr inbounds float, float addrspace(1)* %4, i64 %263
  store float %264, float addrspace(1)* %265, align 4, !tbaa !7
  br label %266

266:                                              ; preds = %262, %196
  %267 = icmp ugt i32 %98, 4
  br i1 %267, label %268, label %438

268:                                              ; preds = %266
  %269 = zext i32 %32 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %2, i64 %269
  %271 = getelementptr inbounds float, float addrspace(1)* %3, i64 %269
  %272 = getelementptr inbounds float, float addrspace(1)* %4, i64 %269
  %273 = getelementptr inbounds float, float addrspace(1)* %69, i64 %269
  %274 = getelementptr float, float addrspace(1)* %67, i64 %269
  %275 = getelementptr float, float addrspace(1)* %72, i64 %269
  %276 = add i32 %98, -5
  %277 = and i32 %98, 3
  %278 = icmp ult i32 %276, 3
  br i1 %278, label %409, label %279

279:                                              ; preds = %268
  %280 = and i32 %98, -4
  %281 = add i32 %280, -8
  br label %282

282:                                              ; preds = %282, %279
  %283 = phi i32 [ 4, %279 ], [ %368, %282 ]
  %284 = phi i32 [ 0, %279 ], [ %369, %282 ]
  %285 = mul nsw i32 %283, %5
  %286 = sext i32 %285 to i64
  %287 = add nsw i32 %283, %40
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds float, float addrspace(1)* %22, i64 %288
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !7
  %291 = load float, float addrspace(1)* %270, align 4, !tbaa !7
  %292 = getelementptr float, float addrspace(1)* %274, i64 %286
  %293 = load float, float addrspace(1)* %292, align 4, !tbaa !7
  %294 = fmul contract float %290, %293
  %295 = fadd contract float %291, %294
  store float %295, float addrspace(1)* %270, align 4, !tbaa !7
  %296 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %297 = getelementptr float, float addrspace(1)* %275, i64 %286
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !7
  %299 = fmul contract float %290, %298
  %300 = fadd contract float %296, %299
  store float %300, float addrspace(1)* %271, align 4, !tbaa !7
  %301 = load float, float addrspace(1)* %272, align 4, !tbaa !7
  %302 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %303 = fmul contract float %290, %302
  %304 = fadd contract float %301, %303
  store float %304, float addrspace(1)* %272, align 4, !tbaa !7
  %305 = or i32 %283, 1
  %306 = mul nsw i32 %305, %5
  %307 = sext i32 %306 to i64
  %308 = add nsw i32 %305, %40
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds float, float addrspace(1)* %22, i64 %309
  %311 = load float, float addrspace(1)* %310, align 4, !tbaa !7
  %312 = load float, float addrspace(1)* %270, align 4, !tbaa !7
  %313 = getelementptr float, float addrspace(1)* %274, i64 %307
  %314 = load float, float addrspace(1)* %313, align 4, !tbaa !7
  %315 = fmul contract float %311, %314
  %316 = fadd contract float %312, %315
  store float %316, float addrspace(1)* %270, align 4, !tbaa !7
  %317 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %318 = getelementptr float, float addrspace(1)* %275, i64 %307
  %319 = load float, float addrspace(1)* %318, align 4, !tbaa !7
  %320 = fmul contract float %311, %319
  %321 = fadd contract float %317, %320
  store float %321, float addrspace(1)* %271, align 4, !tbaa !7
  %322 = load float, float addrspace(1)* %272, align 4, !tbaa !7
  %323 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %324 = fmul contract float %311, %323
  %325 = fadd contract float %322, %324
  store float %325, float addrspace(1)* %272, align 4, !tbaa !7
  %326 = or i32 %283, 2
  %327 = mul nsw i32 %326, %5
  %328 = sext i32 %327 to i64
  %329 = add nsw i32 %326, %40
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, float addrspace(1)* %22, i64 %330
  %332 = load float, float addrspace(1)* %331, align 4, !tbaa !7
  %333 = load float, float addrspace(1)* %270, align 4, !tbaa !7
  %334 = getelementptr float, float addrspace(1)* %274, i64 %328
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !7
  %336 = fmul contract float %332, %335
  %337 = fadd contract float %333, %336
  store float %337, float addrspace(1)* %270, align 4, !tbaa !7
  %338 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %339 = getelementptr float, float addrspace(1)* %275, i64 %328
  %340 = load float, float addrspace(1)* %339, align 4, !tbaa !7
  %341 = fmul contract float %332, %340
  %342 = fadd contract float %338, %341
  store float %342, float addrspace(1)* %271, align 4, !tbaa !7
  %343 = load float, float addrspace(1)* %272, align 4, !tbaa !7
  %344 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %345 = fmul contract float %332, %344
  %346 = fadd contract float %343, %345
  store float %346, float addrspace(1)* %272, align 4, !tbaa !7
  %347 = or i32 %283, 3
  %348 = mul nsw i32 %347, %5
  %349 = sext i32 %348 to i64
  %350 = add nsw i32 %347, %40
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds float, float addrspace(1)* %22, i64 %351
  %353 = load float, float addrspace(1)* %352, align 4, !tbaa !7
  %354 = load float, float addrspace(1)* %270, align 4, !tbaa !7
  %355 = getelementptr float, float addrspace(1)* %274, i64 %349
  %356 = load float, float addrspace(1)* %355, align 4, !tbaa !7
  %357 = fmul contract float %353, %356
  %358 = fadd contract float %354, %357
  store float %358, float addrspace(1)* %270, align 4, !tbaa !7
  %359 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %360 = getelementptr float, float addrspace(1)* %275, i64 %349
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !7
  %362 = fmul contract float %353, %361
  %363 = fadd contract float %359, %362
  store float %363, float addrspace(1)* %271, align 4, !tbaa !7
  %364 = load float, float addrspace(1)* %272, align 4, !tbaa !7
  %365 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %366 = fmul contract float %353, %365
  %367 = fadd contract float %364, %366
  store float %367, float addrspace(1)* %272, align 4, !tbaa !7
  %368 = add nuw nsw i32 %283, 4
  %369 = add i32 %284, 4
  %370 = icmp eq i32 %284, %281
  br i1 %370, label %409, label %282, !llvm.loop !15

371:                                              ; preds = %82
  %372 = icmp ult i32 %40, %15
  %373 = sub nsw i32 %8, %16
  %374 = icmp uge i32 %40, %373
  %375 = select i1 %372, i1 true, i1 %374
  %376 = zext i32 %32 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %67, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !7
  br i1 %375, label %379, label %386

379:                                              ; preds = %371
  %380 = getelementptr inbounds float, float addrspace(1)* %2, i64 %376
  store float %378, float addrspace(1)* %380, align 4, !tbaa !7
  %381 = getelementptr inbounds float, float addrspace(1)* %72, i64 %376
  %382 = load float, float addrspace(1)* %381, align 4, !tbaa !7
  %383 = getelementptr inbounds float, float addrspace(1)* %3, i64 %376
  store float %382, float addrspace(1)* %383, align 4, !tbaa !7
  %384 = getelementptr inbounds float, float addrspace(1)* %73, i64 %376
  %385 = load float, float addrspace(1)* %384, align 4, !tbaa !7
  br label %406

386:                                              ; preds = %371
  %387 = fmul contract float %59, %378
  %388 = getelementptr inbounds float, float addrspace(1)* %69, i64 %376
  %389 = load float, float addrspace(1)* %388, align 4, !tbaa !7, !amdgpu.noclobber !6
  %390 = fmul contract float %60, %389
  %391 = fadd contract float %387, %390
  %392 = getelementptr inbounds float, float addrspace(1)* %2, i64 %376
  store float %391, float addrspace(1)* %392, align 4, !tbaa !7
  %393 = getelementptr inbounds float, float addrspace(1)* %72, i64 %376
  %394 = load float, float addrspace(1)* %393, align 4, !tbaa !7
  %395 = fmul contract float %59, %394
  %396 = load float, float addrspace(1)* %388, align 4, !tbaa !7
  %397 = fmul contract float %60, %396
  %398 = fadd contract float %395, %397
  %399 = getelementptr inbounds float, float addrspace(1)* %3, i64 %376
  store float %398, float addrspace(1)* %399, align 4, !tbaa !7
  %400 = getelementptr inbounds float, float addrspace(1)* %73, i64 %376
  %401 = load float, float addrspace(1)* %400, align 4, !tbaa !7
  %402 = fmul contract float %59, %401
  %403 = load float, float addrspace(1)* %388, align 4, !tbaa !7
  %404 = fmul contract float %60, %403
  %405 = fadd contract float %402, %404
  br label %406

406:                                              ; preds = %386, %379
  %407 = phi float [ %385, %379 ], [ %405, %386 ]
  %408 = getelementptr inbounds float, float addrspace(1)* %4, i64 %376
  store float %407, float addrspace(1)* %408, align 4, !tbaa !7
  br label %438

409:                                              ; preds = %282, %268
  %410 = phi i32 [ 4, %268 ], [ %368, %282 ]
  %411 = icmp eq i32 %277, 0
  br i1 %411, label %438, label %412

412:                                              ; preds = %409, %412
  %413 = phi i32 [ %435, %412 ], [ %410, %409 ]
  %414 = phi i32 [ %436, %412 ], [ 0, %409 ]
  %415 = mul nsw i32 %413, %5
  %416 = sext i32 %415 to i64
  %417 = add nsw i32 %413, %40
  %418 = sext i32 %417 to i64
  %419 = getelementptr inbounds float, float addrspace(1)* %22, i64 %418
  %420 = load float, float addrspace(1)* %419, align 4, !tbaa !7
  %421 = load float, float addrspace(1)* %270, align 4, !tbaa !7
  %422 = getelementptr float, float addrspace(1)* %274, i64 %416
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !7
  %424 = fmul contract float %420, %423
  %425 = fadd contract float %421, %424
  store float %425, float addrspace(1)* %270, align 4, !tbaa !7
  %426 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %427 = getelementptr float, float addrspace(1)* %275, i64 %416
  %428 = load float, float addrspace(1)* %427, align 4, !tbaa !7
  %429 = fmul contract float %420, %428
  %430 = fadd contract float %426, %429
  store float %430, float addrspace(1)* %271, align 4, !tbaa !7
  %431 = load float, float addrspace(1)* %272, align 4, !tbaa !7
  %432 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %433 = fmul contract float %420, %432
  %434 = fadd contract float %431, %433
  store float %434, float addrspace(1)* %272, align 4, !tbaa !7
  %435 = add nuw nsw i32 %413, 1
  %436 = add i32 %414, 1
  %437 = icmp eq i32 %436, %277
  br i1 %437, label %438, label %412, !llvm.loop !16

438:                                              ; preds = %409, %412, %406, %266, %44
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %439 = icmp sgt i32 %5, %7
  br i1 %439, label %447, label %440

440:                                              ; preds = %438
  %441 = icmp sgt i32 %13, 0
  br i1 %441, label %442, label %722

442:                                              ; preds = %440
  %443 = and i32 %13, 3
  %444 = icmp ult i32 %13, 4
  br i1 %444, label %693, label %445

445:                                              ; preds = %442
  %446 = and i32 %13, -4
  br label %726

447:                                              ; preds = %438
  switch i32 %13, label %619 [
    i32 2, label %448
    i32 3, label %485
    i32 4, label %542
  ]

448:                                              ; preds = %447
  %449 = shl i32 %32, 2
  %450 = zext i32 %449 to i64
  %451 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %450
  %452 = load i32, i32 addrspace(1)* %451, align 4, !tbaa !11, !amdgpu.noclobber !6
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds float, float addrspace(1)* %2, i64 %453
  %455 = load float, float addrspace(1)* %454, align 4, !tbaa !7
  %456 = getelementptr inbounds float, float addrspace(1)* %19, i64 %450
  %457 = load float, float addrspace(1)* %456, align 4, !tbaa !7
  %458 = fmul contract float %455, %457
  %459 = add nsw i32 %452, 1
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds float, float addrspace(1)* %2, i64 %460
  %462 = load float, float addrspace(1)* %461, align 4, !tbaa !7
  %463 = add nuw nsw i32 %449, 1
  %464 = zext i32 %463 to i64
  %465 = getelementptr inbounds float, float addrspace(1)* %19, i64 %464
  %466 = load float, float addrspace(1)* %465, align 4, !tbaa !7
  %467 = fmul contract float %462, %466
  %468 = fadd contract float %458, %467
  %469 = zext i32 %32 to i64
  %470 = getelementptr inbounds float, float addrspace(1)* %78, i64 %469
  store float %468, float addrspace(1)* %470, align 4, !tbaa !7
  %471 = getelementptr inbounds float, float addrspace(1)* %3, i64 %453
  %472 = load float, float addrspace(1)* %471, align 4, !tbaa !7
  %473 = load float, float addrspace(1)* %456, align 4, !tbaa !7
  %474 = fmul contract float %472, %473
  %475 = getelementptr inbounds float, float addrspace(1)* %3, i64 %460
  %476 = load float, float addrspace(1)* %475, align 4, !tbaa !7
  %477 = load float, float addrspace(1)* %465, align 4, !tbaa !7
  %478 = fmul contract float %476, %477
  %479 = fadd contract float %474, %478
  %480 = getelementptr inbounds float, float addrspace(1)* %79, i64 %469
  store float %479, float addrspace(1)* %480, align 4, !tbaa !7
  %481 = getelementptr inbounds float, float addrspace(1)* %4, i64 %453
  %482 = load float, float addrspace(1)* %481, align 4, !tbaa !7
  %483 = load float, float addrspace(1)* %456, align 4, !tbaa !7
  %484 = fmul contract float %482, %483
  br label %883

485:                                              ; preds = %447
  %486 = shl i32 %32, 2
  %487 = zext i32 %486 to i64
  %488 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %487
  %489 = load i32, i32 addrspace(1)* %488, align 4, !tbaa !11, !amdgpu.noclobber !6
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds float, float addrspace(1)* %2, i64 %490
  %492 = load float, float addrspace(1)* %491, align 4, !tbaa !7
  %493 = getelementptr inbounds float, float addrspace(1)* %19, i64 %487
  %494 = load float, float addrspace(1)* %493, align 4, !tbaa !7
  %495 = fmul contract float %492, %494
  %496 = add nsw i32 %489, 1
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds float, float addrspace(1)* %2, i64 %497
  %499 = load float, float addrspace(1)* %498, align 4, !tbaa !7
  %500 = add nuw nsw i32 %486, 1
  %501 = zext i32 %500 to i64
  %502 = getelementptr inbounds float, float addrspace(1)* %19, i64 %501
  %503 = load float, float addrspace(1)* %502, align 4, !tbaa !7
  %504 = fmul contract float %499, %503
  %505 = fadd contract float %495, %504
  %506 = add nsw i32 %489, 2
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds float, float addrspace(1)* %2, i64 %507
  %509 = load float, float addrspace(1)* %508, align 4, !tbaa !7
  %510 = add nuw nsw i32 %486, 2
  %511 = zext i32 %510 to i64
  %512 = getelementptr inbounds float, float addrspace(1)* %19, i64 %511
  %513 = load float, float addrspace(1)* %512, align 4, !tbaa !7
  %514 = fmul contract float %509, %513
  %515 = fadd contract float %505, %514
  %516 = zext i32 %32 to i64
  %517 = getelementptr inbounds float, float addrspace(1)* %78, i64 %516
  store float %515, float addrspace(1)* %517, align 4, !tbaa !7
  %518 = getelementptr inbounds float, float addrspace(1)* %3, i64 %490
  %519 = load float, float addrspace(1)* %518, align 4, !tbaa !7
  %520 = load float, float addrspace(1)* %493, align 4, !tbaa !7
  %521 = fmul contract float %519, %520
  %522 = getelementptr inbounds float, float addrspace(1)* %3, i64 %497
  %523 = load float, float addrspace(1)* %522, align 4, !tbaa !7
  %524 = load float, float addrspace(1)* %502, align 4, !tbaa !7
  %525 = fmul contract float %523, %524
  %526 = fadd contract float %521, %525
  %527 = getelementptr inbounds float, float addrspace(1)* %3, i64 %507
  %528 = load float, float addrspace(1)* %527, align 4, !tbaa !7
  %529 = load float, float addrspace(1)* %512, align 4, !tbaa !7
  %530 = fmul contract float %528, %529
  %531 = fadd contract float %526, %530
  %532 = getelementptr inbounds float, float addrspace(1)* %79, i64 %516
  store float %531, float addrspace(1)* %532, align 4, !tbaa !7
  %533 = getelementptr inbounds float, float addrspace(1)* %4, i64 %490
  %534 = load float, float addrspace(1)* %533, align 4, !tbaa !7
  %535 = load float, float addrspace(1)* %493, align 4, !tbaa !7
  %536 = fmul contract float %534, %535
  %537 = getelementptr inbounds float, float addrspace(1)* %4, i64 %497
  %538 = load float, float addrspace(1)* %537, align 4, !tbaa !7
  %539 = load float, float addrspace(1)* %502, align 4, !tbaa !7
  %540 = fmul contract float %538, %539
  %541 = fadd contract float %536, %540
  br label %883

542:                                              ; preds = %447
  %543 = shl i32 %32, 2
  %544 = zext i32 %543 to i64
  %545 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %544
  %546 = load i32, i32 addrspace(1)* %545, align 4, !tbaa !11, !amdgpu.noclobber !6
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds float, float addrspace(1)* %2, i64 %547
  %549 = load float, float addrspace(1)* %548, align 4, !tbaa !7
  %550 = getelementptr inbounds float, float addrspace(1)* %19, i64 %544
  %551 = load float, float addrspace(1)* %550, align 4, !tbaa !7
  %552 = fmul contract float %549, %551
  %553 = add nsw i32 %546, 1
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds float, float addrspace(1)* %2, i64 %554
  %556 = load float, float addrspace(1)* %555, align 4, !tbaa !7
  %557 = add nuw nsw i32 %543, 1
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds float, float addrspace(1)* %19, i64 %558
  %560 = load float, float addrspace(1)* %559, align 4, !tbaa !7
  %561 = fmul contract float %556, %560
  %562 = fadd contract float %552, %561
  %563 = add nsw i32 %546, 2
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds float, float addrspace(1)* %2, i64 %564
  %566 = load float, float addrspace(1)* %565, align 4, !tbaa !7
  %567 = add nuw nsw i32 %543, 2
  %568 = zext i32 %567 to i64
  %569 = getelementptr inbounds float, float addrspace(1)* %19, i64 %568
  %570 = load float, float addrspace(1)* %569, align 4, !tbaa !7
  %571 = fmul contract float %566, %570
  %572 = fadd contract float %562, %571
  %573 = add nsw i32 %546, 3
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds float, float addrspace(1)* %2, i64 %574
  %576 = load float, float addrspace(1)* %575, align 4, !tbaa !7
  %577 = add nuw nsw i32 %543, 3
  %578 = zext i32 %577 to i64
  %579 = getelementptr inbounds float, float addrspace(1)* %19, i64 %578
  %580 = load float, float addrspace(1)* %579, align 4, !tbaa !7
  %581 = fmul contract float %576, %580
  %582 = fadd contract float %572, %581
  %583 = zext i32 %32 to i64
  %584 = getelementptr inbounds float, float addrspace(1)* %78, i64 %583
  store float %582, float addrspace(1)* %584, align 4, !tbaa !7
  %585 = getelementptr inbounds float, float addrspace(1)* %3, i64 %547
  %586 = load float, float addrspace(1)* %585, align 4, !tbaa !7
  %587 = load float, float addrspace(1)* %550, align 4, !tbaa !7
  %588 = fmul contract float %586, %587
  %589 = getelementptr inbounds float, float addrspace(1)* %3, i64 %554
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !7
  %591 = load float, float addrspace(1)* %559, align 4, !tbaa !7
  %592 = fmul contract float %590, %591
  %593 = fadd contract float %588, %592
  %594 = getelementptr inbounds float, float addrspace(1)* %3, i64 %564
  %595 = load float, float addrspace(1)* %594, align 4, !tbaa !7
  %596 = load float, float addrspace(1)* %569, align 4, !tbaa !7
  %597 = fmul contract float %595, %596
  %598 = fadd contract float %593, %597
  %599 = getelementptr inbounds float, float addrspace(1)* %3, i64 %574
  %600 = load float, float addrspace(1)* %599, align 4, !tbaa !7
  %601 = load float, float addrspace(1)* %579, align 4, !tbaa !7
  %602 = fmul contract float %600, %601
  %603 = fadd contract float %598, %602
  %604 = getelementptr inbounds float, float addrspace(1)* %79, i64 %583
  store float %603, float addrspace(1)* %604, align 4, !tbaa !7
  %605 = getelementptr inbounds float, float addrspace(1)* %4, i64 %547
  %606 = load float, float addrspace(1)* %605, align 4, !tbaa !7
  %607 = load float, float addrspace(1)* %550, align 4, !tbaa !7
  %608 = fmul contract float %606, %607
  %609 = getelementptr inbounds float, float addrspace(1)* %4, i64 %554
  %610 = load float, float addrspace(1)* %609, align 4, !tbaa !7
  %611 = load float, float addrspace(1)* %559, align 4, !tbaa !7
  %612 = fmul contract float %610, %611
  %613 = fadd contract float %608, %612
  %614 = getelementptr inbounds float, float addrspace(1)* %4, i64 %564
  %615 = load float, float addrspace(1)* %614, align 4, !tbaa !7
  %616 = load float, float addrspace(1)* %569, align 4, !tbaa !7
  %617 = fmul contract float %615, %616
  %618 = fadd contract float %613, %617
  br label %883

619:                                              ; preds = %447
  %620 = icmp sgt i32 %13, 4
  %621 = icmp sgt i32 %12, 0
  %622 = select i1 %620, i1 %621, i1 false
  br i1 %622, label %623, label %928

623:                                              ; preds = %619
  %624 = and i32 %12, 1
  %625 = icmp eq i32 %12, 1
  br i1 %625, label %896, label %626

626:                                              ; preds = %623
  %627 = and i32 %12, -2
  br label %628

628:                                              ; preds = %628, %626
  %629 = phi i32 [ 0, %626 ], [ %690, %628 ]
  %630 = phi i32 [ 0, %626 ], [ %691, %628 ]
  %631 = zext i32 %629 to i64
  %632 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %631
  %633 = load i32, i32 addrspace(1)* %632, align 4, !tbaa !11, !amdgpu.noclobber !6
  %634 = sext i32 %633 to i64
  %635 = getelementptr inbounds float, float addrspace(1)* %2, i64 %634
  %636 = load float, float addrspace(1)* %635, align 4, !tbaa !7
  %637 = getelementptr inbounds float, float addrspace(1)* %19, i64 %631
  %638 = load float, float addrspace(1)* %637, align 4, !tbaa !7
  %639 = fmul contract float %636, %638
  %640 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %631
  %641 = load i32, i32 addrspace(1)* %640, align 4, !tbaa !11, !amdgpu.noclobber !6
  %642 = sext i32 %641 to i64
  %643 = getelementptr inbounds float, float addrspace(1)* %78, i64 %642
  %644 = load float, float addrspace(1)* %643, align 4, !tbaa !7
  %645 = fadd contract float %639, %644
  store float %645, float addrspace(1)* %643, align 4, !tbaa !7
  %646 = getelementptr inbounds float, float addrspace(1)* %3, i64 %634
  %647 = load float, float addrspace(1)* %646, align 4, !tbaa !7
  %648 = load float, float addrspace(1)* %637, align 4, !tbaa !7
  %649 = fmul contract float %647, %648
  %650 = getelementptr inbounds float, float addrspace(1)* %79, i64 %642
  %651 = load float, float addrspace(1)* %650, align 4, !tbaa !7
  %652 = fadd contract float %651, %649
  store float %652, float addrspace(1)* %650, align 4, !tbaa !7
  %653 = getelementptr inbounds float, float addrspace(1)* %4, i64 %634
  %654 = load float, float addrspace(1)* %653, align 4, !tbaa !7
  %655 = load float, float addrspace(1)* %637, align 4, !tbaa !7
  %656 = fmul contract float %654, %655
  %657 = getelementptr inbounds float, float addrspace(1)* %80, i64 %642
  %658 = load float, float addrspace(1)* %657, align 4, !tbaa !7
  %659 = fadd contract float %658, %656
  store float %659, float addrspace(1)* %657, align 4, !tbaa !7
  %660 = or i32 %629, 1
  %661 = zext i32 %660 to i64
  %662 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %661
  %663 = load i32, i32 addrspace(1)* %662, align 4, !tbaa !11, !amdgpu.noclobber !6
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds float, float addrspace(1)* %2, i64 %664
  %666 = load float, float addrspace(1)* %665, align 4, !tbaa !7
  %667 = getelementptr inbounds float, float addrspace(1)* %19, i64 %661
  %668 = load float, float addrspace(1)* %667, align 4, !tbaa !7
  %669 = fmul contract float %666, %668
  %670 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %661
  %671 = load i32, i32 addrspace(1)* %670, align 4, !tbaa !11, !amdgpu.noclobber !6
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds float, float addrspace(1)* %78, i64 %672
  %674 = load float, float addrspace(1)* %673, align 4, !tbaa !7
  %675 = fadd contract float %669, %674
  store float %675, float addrspace(1)* %673, align 4, !tbaa !7
  %676 = getelementptr inbounds float, float addrspace(1)* %3, i64 %664
  %677 = load float, float addrspace(1)* %676, align 4, !tbaa !7
  %678 = load float, float addrspace(1)* %667, align 4, !tbaa !7
  %679 = fmul contract float %677, %678
  %680 = getelementptr inbounds float, float addrspace(1)* %79, i64 %672
  %681 = load float, float addrspace(1)* %680, align 4, !tbaa !7
  %682 = fadd contract float %681, %679
  store float %682, float addrspace(1)* %680, align 4, !tbaa !7
  %683 = getelementptr inbounds float, float addrspace(1)* %4, i64 %664
  %684 = load float, float addrspace(1)* %683, align 4, !tbaa !7
  %685 = load float, float addrspace(1)* %667, align 4, !tbaa !7
  %686 = fmul contract float %684, %685
  %687 = getelementptr inbounds float, float addrspace(1)* %80, i64 %672
  %688 = load float, float addrspace(1)* %687, align 4, !tbaa !7
  %689 = fadd contract float %688, %686
  store float %689, float addrspace(1)* %687, align 4, !tbaa !7
  %690 = add nuw nsw i32 %629, 2
  %691 = add i32 %630, 2
  %692 = icmp eq i32 %691, %627
  br i1 %692, label %894, label %628, !llvm.loop !18

693:                                              ; preds = %726, %442
  %694 = phi i32 [ 0, %442 ], [ %812, %726 ]
  %695 = icmp eq i32 %443, 0
  br i1 %695, label %722, label %696

696:                                              ; preds = %693, %696
  %697 = phi i32 [ %719, %696 ], [ %694, %693 ]
  %698 = phi i32 [ %720, %696 ], [ 0, %693 ]
  %699 = zext i32 %697 to i64
  %700 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %699
  %701 = load i32, i32 addrspace(1)* %700, align 4, !tbaa !11, !amdgpu.noclobber !6
  %702 = sext i32 %701 to i64
  %703 = getelementptr inbounds float, float addrspace(1)* %2, i64 %702
  %704 = load float, float addrspace(1)* %703, align 4, !tbaa !7
  %705 = getelementptr inbounds float, float addrspace(1)* %19, i64 %699
  %706 = load float, float addrspace(1)* %705, align 4, !tbaa !7
  %707 = fmul contract float %704, %706
  %708 = getelementptr inbounds float, float addrspace(1)* %78, i64 %699
  store float %707, float addrspace(1)* %708, align 4, !tbaa !7
  %709 = getelementptr inbounds float, float addrspace(1)* %3, i64 %702
  %710 = load float, float addrspace(1)* %709, align 4, !tbaa !7
  %711 = load float, float addrspace(1)* %705, align 4, !tbaa !7
  %712 = fmul contract float %710, %711
  %713 = getelementptr inbounds float, float addrspace(1)* %79, i64 %699
  store float %712, float addrspace(1)* %713, align 4, !tbaa !7
  %714 = getelementptr inbounds float, float addrspace(1)* %4, i64 %702
  %715 = load float, float addrspace(1)* %714, align 4, !tbaa !7
  %716 = load float, float addrspace(1)* %705, align 4, !tbaa !7
  %717 = fmul contract float %715, %716
  %718 = getelementptr inbounds float, float addrspace(1)* %80, i64 %699
  store float %717, float addrspace(1)* %718, align 4, !tbaa !7
  %719 = add nuw nsw i32 %697, 1
  %720 = add i32 %698, 1
  %721 = icmp eq i32 %720, %443
  br i1 %721, label %722, label %696, !llvm.loop !19

722:                                              ; preds = %693, %696, %440
  %723 = phi i32 [ 0, %440 ], [ %13, %696 ], [ %13, %693 ]
  %724 = sub nsw i32 %7, %14
  %725 = icmp slt i32 %723, %724
  br i1 %725, label %818, label %815

726:                                              ; preds = %726, %445
  %727 = phi i32 [ 0, %445 ], [ %812, %726 ]
  %728 = phi i32 [ 0, %445 ], [ %813, %726 ]
  %729 = zext i32 %727 to i64
  %730 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %729
  %731 = load i32, i32 addrspace(1)* %730, align 4, !tbaa !11, !amdgpu.noclobber !6
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds float, float addrspace(1)* %2, i64 %732
  %734 = load float, float addrspace(1)* %733, align 4, !tbaa !7
  %735 = getelementptr inbounds float, float addrspace(1)* %19, i64 %729
  %736 = load float, float addrspace(1)* %735, align 4, !tbaa !7
  %737 = fmul contract float %734, %736
  %738 = getelementptr inbounds float, float addrspace(1)* %78, i64 %729
  store float %737, float addrspace(1)* %738, align 4, !tbaa !7
  %739 = getelementptr inbounds float, float addrspace(1)* %3, i64 %732
  %740 = load float, float addrspace(1)* %739, align 4, !tbaa !7
  %741 = load float, float addrspace(1)* %735, align 4, !tbaa !7
  %742 = fmul contract float %740, %741
  %743 = getelementptr inbounds float, float addrspace(1)* %79, i64 %729
  store float %742, float addrspace(1)* %743, align 4, !tbaa !7
  %744 = getelementptr inbounds float, float addrspace(1)* %4, i64 %732
  %745 = load float, float addrspace(1)* %744, align 4, !tbaa !7
  %746 = load float, float addrspace(1)* %735, align 4, !tbaa !7
  %747 = fmul contract float %745, %746
  %748 = getelementptr inbounds float, float addrspace(1)* %80, i64 %729
  store float %747, float addrspace(1)* %748, align 4, !tbaa !7
  %749 = or i32 %727, 1
  %750 = zext i32 %749 to i64
  %751 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %750
  %752 = load i32, i32 addrspace(1)* %751, align 4, !tbaa !11, !amdgpu.noclobber !6
  %753 = sext i32 %752 to i64
  %754 = getelementptr inbounds float, float addrspace(1)* %2, i64 %753
  %755 = load float, float addrspace(1)* %754, align 4, !tbaa !7
  %756 = getelementptr inbounds float, float addrspace(1)* %19, i64 %750
  %757 = load float, float addrspace(1)* %756, align 4, !tbaa !7
  %758 = fmul contract float %755, %757
  %759 = getelementptr inbounds float, float addrspace(1)* %78, i64 %750
  store float %758, float addrspace(1)* %759, align 4, !tbaa !7
  %760 = getelementptr inbounds float, float addrspace(1)* %3, i64 %753
  %761 = load float, float addrspace(1)* %760, align 4, !tbaa !7
  %762 = load float, float addrspace(1)* %756, align 4, !tbaa !7
  %763 = fmul contract float %761, %762
  %764 = getelementptr inbounds float, float addrspace(1)* %79, i64 %750
  store float %763, float addrspace(1)* %764, align 4, !tbaa !7
  %765 = getelementptr inbounds float, float addrspace(1)* %4, i64 %753
  %766 = load float, float addrspace(1)* %765, align 4, !tbaa !7
  %767 = load float, float addrspace(1)* %756, align 4, !tbaa !7
  %768 = fmul contract float %766, %767
  %769 = getelementptr inbounds float, float addrspace(1)* %80, i64 %750
  store float %768, float addrspace(1)* %769, align 4, !tbaa !7
  %770 = or i32 %727, 2
  %771 = zext i32 %770 to i64
  %772 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %771
  %773 = load i32, i32 addrspace(1)* %772, align 4, !tbaa !11, !amdgpu.noclobber !6
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds float, float addrspace(1)* %2, i64 %774
  %776 = load float, float addrspace(1)* %775, align 4, !tbaa !7
  %777 = getelementptr inbounds float, float addrspace(1)* %19, i64 %771
  %778 = load float, float addrspace(1)* %777, align 4, !tbaa !7
  %779 = fmul contract float %776, %778
  %780 = getelementptr inbounds float, float addrspace(1)* %78, i64 %771
  store float %779, float addrspace(1)* %780, align 4, !tbaa !7
  %781 = getelementptr inbounds float, float addrspace(1)* %3, i64 %774
  %782 = load float, float addrspace(1)* %781, align 4, !tbaa !7
  %783 = load float, float addrspace(1)* %777, align 4, !tbaa !7
  %784 = fmul contract float %782, %783
  %785 = getelementptr inbounds float, float addrspace(1)* %79, i64 %771
  store float %784, float addrspace(1)* %785, align 4, !tbaa !7
  %786 = getelementptr inbounds float, float addrspace(1)* %4, i64 %774
  %787 = load float, float addrspace(1)* %786, align 4, !tbaa !7
  %788 = load float, float addrspace(1)* %777, align 4, !tbaa !7
  %789 = fmul contract float %787, %788
  %790 = getelementptr inbounds float, float addrspace(1)* %80, i64 %771
  store float %789, float addrspace(1)* %790, align 4, !tbaa !7
  %791 = or i32 %727, 3
  %792 = zext i32 %791 to i64
  %793 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %792
  %794 = load i32, i32 addrspace(1)* %793, align 4, !tbaa !11, !amdgpu.noclobber !6
  %795 = sext i32 %794 to i64
  %796 = getelementptr inbounds float, float addrspace(1)* %2, i64 %795
  %797 = load float, float addrspace(1)* %796, align 4, !tbaa !7
  %798 = getelementptr inbounds float, float addrspace(1)* %19, i64 %792
  %799 = load float, float addrspace(1)* %798, align 4, !tbaa !7
  %800 = fmul contract float %797, %799
  %801 = getelementptr inbounds float, float addrspace(1)* %78, i64 %792
  store float %800, float addrspace(1)* %801, align 4, !tbaa !7
  %802 = getelementptr inbounds float, float addrspace(1)* %3, i64 %795
  %803 = load float, float addrspace(1)* %802, align 4, !tbaa !7
  %804 = load float, float addrspace(1)* %798, align 4, !tbaa !7
  %805 = fmul contract float %803, %804
  %806 = getelementptr inbounds float, float addrspace(1)* %79, i64 %792
  store float %805, float addrspace(1)* %806, align 4, !tbaa !7
  %807 = getelementptr inbounds float, float addrspace(1)* %4, i64 %795
  %808 = load float, float addrspace(1)* %807, align 4, !tbaa !7
  %809 = load float, float addrspace(1)* %798, align 4, !tbaa !7
  %810 = fmul contract float %808, %809
  %811 = getelementptr inbounds float, float addrspace(1)* %80, i64 %792
  store float %810, float addrspace(1)* %811, align 4, !tbaa !7
  %812 = add nuw nsw i32 %727, 4
  %813 = add i32 %728, 4
  %814 = icmp eq i32 %813, %446
  br i1 %814, label %693, label %726, !llvm.loop !20

815:                                              ; preds = %818, %722
  %816 = phi i32 [ %723, %722 ], [ %857, %818 ]
  %817 = icmp slt i32 %816, %7
  br i1 %817, label %859, label %928

818:                                              ; preds = %722, %818
  %819 = phi i32 [ %857, %818 ], [ %723, %722 ]
  %820 = zext i32 %819 to i64
  %821 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %820
  %822 = load i32, i32 addrspace(1)* %821, align 4, !tbaa !11, !amdgpu.noclobber !6
  %823 = sext i32 %822 to i64
  %824 = getelementptr inbounds float, float addrspace(1)* %2, i64 %823
  %825 = load float, float addrspace(1)* %824, align 4, !tbaa !7
  %826 = getelementptr inbounds float, float addrspace(1)* %19, i64 %820
  %827 = load float, float addrspace(1)* %826, align 4, !tbaa !7
  %828 = fmul contract float %825, %827
  %829 = add nsw i32 %822, 1
  %830 = sext i32 %829 to i64
  %831 = getelementptr inbounds float, float addrspace(1)* %2, i64 %830
  %832 = load float, float addrspace(1)* %831, align 4, !tbaa !7
  %833 = fsub contract float %10, %827
  %834 = fmul contract float %832, %833
  %835 = fadd contract float %828, %834
  %836 = getelementptr inbounds float, float addrspace(1)* %78, i64 %820
  store float %835, float addrspace(1)* %836, align 4, !tbaa !7
  %837 = getelementptr inbounds float, float addrspace(1)* %3, i64 %823
  %838 = load float, float addrspace(1)* %837, align 4, !tbaa !7
  %839 = load float, float addrspace(1)* %826, align 4, !tbaa !7
  %840 = fmul contract float %838, %839
  %841 = getelementptr inbounds float, float addrspace(1)* %3, i64 %830
  %842 = load float, float addrspace(1)* %841, align 4, !tbaa !7
  %843 = fsub contract float %10, %839
  %844 = fmul contract float %842, %843
  %845 = fadd contract float %840, %844
  %846 = getelementptr inbounds float, float addrspace(1)* %79, i64 %820
  store float %845, float addrspace(1)* %846, align 4, !tbaa !7
  %847 = getelementptr inbounds float, float addrspace(1)* %4, i64 %823
  %848 = load float, float addrspace(1)* %847, align 4, !tbaa !7
  %849 = load float, float addrspace(1)* %826, align 4, !tbaa !7
  %850 = fmul contract float %848, %849
  %851 = getelementptr inbounds float, float addrspace(1)* %4, i64 %830
  %852 = load float, float addrspace(1)* %851, align 4, !tbaa !7
  %853 = fsub contract float %10, %849
  %854 = fmul contract float %852, %853
  %855 = fadd contract float %850, %854
  %856 = getelementptr inbounds float, float addrspace(1)* %80, i64 %820
  store float %855, float addrspace(1)* %856, align 4, !tbaa !7
  %857 = add nuw nsw i32 %819, 1
  %858 = icmp slt i32 %857, %724
  br i1 %858, label %818, label %815, !llvm.loop !21

859:                                              ; preds = %815, %859
  %860 = phi i32 [ %881, %859 ], [ %816, %815 ]
  %861 = zext i32 %860 to i64
  %862 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %861
  %863 = load i32, i32 addrspace(1)* %862, align 4, !tbaa !11, !amdgpu.noclobber !6
  %864 = sext i32 %863 to i64
  %865 = getelementptr inbounds float, float addrspace(1)* %2, i64 %864
  %866 = load float, float addrspace(1)* %865, align 4, !tbaa !7
  %867 = getelementptr inbounds float, float addrspace(1)* %19, i64 %861
  %868 = load float, float addrspace(1)* %867, align 4, !tbaa !7
  %869 = fmul contract float %866, %868
  %870 = getelementptr inbounds float, float addrspace(1)* %78, i64 %861
  store float %869, float addrspace(1)* %870, align 4, !tbaa !7
  %871 = getelementptr inbounds float, float addrspace(1)* %3, i64 %864
  %872 = load float, float addrspace(1)* %871, align 4, !tbaa !7
  %873 = load float, float addrspace(1)* %867, align 4, !tbaa !7
  %874 = fmul contract float %872, %873
  %875 = getelementptr inbounds float, float addrspace(1)* %79, i64 %861
  store float %874, float addrspace(1)* %875, align 4, !tbaa !7
  %876 = getelementptr inbounds float, float addrspace(1)* %4, i64 %864
  %877 = load float, float addrspace(1)* %876, align 4, !tbaa !7
  %878 = load float, float addrspace(1)* %867, align 4, !tbaa !7
  %879 = fmul contract float %877, %878
  %880 = getelementptr inbounds float, float addrspace(1)* %80, i64 %861
  store float %879, float addrspace(1)* %880, align 4, !tbaa !7
  %881 = add nuw nsw i32 %860, 1
  %882 = icmp slt i32 %881, %7
  br i1 %882, label %859, label %928, !llvm.loop !22

883:                                              ; preds = %448, %542, %485
  %884 = phi i64 [ %507, %485 ], [ %574, %542 ], [ %460, %448 ]
  %885 = phi float addrspace(1)* [ %512, %485 ], [ %579, %542 ], [ %465, %448 ]
  %886 = phi float [ %541, %485 ], [ %618, %542 ], [ %484, %448 ]
  %887 = phi i64 [ %516, %485 ], [ %583, %542 ], [ %469, %448 ]
  %888 = getelementptr inbounds float, float addrspace(1)* %4, i64 %884
  %889 = load float, float addrspace(1)* %888, align 4, !tbaa !7
  %890 = load float, float addrspace(1)* %885, align 4, !tbaa !7
  %891 = fmul contract float %889, %890
  %892 = fadd contract float %886, %891
  %893 = getelementptr inbounds float, float addrspace(1)* %80, i64 %887
  store float %892, float addrspace(1)* %893, align 4, !tbaa !7
  br label %928

894:                                              ; preds = %628
  %895 = zext i32 %690 to i64
  br label %896

896:                                              ; preds = %894, %623
  %897 = phi i64 [ 0, %623 ], [ %895, %894 ]
  %898 = icmp eq i32 %624, 0
  br i1 %898, label %928, label %899

899:                                              ; preds = %896
  %900 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %897
  %901 = load i32, i32 addrspace(1)* %900, align 4, !tbaa !11, !amdgpu.noclobber !6
  %902 = sext i32 %901 to i64
  %903 = getelementptr inbounds float, float addrspace(1)* %2, i64 %902
  %904 = load float, float addrspace(1)* %903, align 4, !tbaa !7
  %905 = getelementptr inbounds float, float addrspace(1)* %19, i64 %897
  %906 = load float, float addrspace(1)* %905, align 4, !tbaa !7
  %907 = fmul contract float %904, %906
  %908 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %897
  %909 = load i32, i32 addrspace(1)* %908, align 4, !tbaa !11, !amdgpu.noclobber !6
  %910 = sext i32 %909 to i64
  %911 = getelementptr inbounds float, float addrspace(1)* %78, i64 %910
  %912 = load float, float addrspace(1)* %911, align 4, !tbaa !7
  %913 = fadd contract float %907, %912
  store float %913, float addrspace(1)* %911, align 4, !tbaa !7
  %914 = getelementptr inbounds float, float addrspace(1)* %3, i64 %902
  %915 = load float, float addrspace(1)* %914, align 4, !tbaa !7
  %916 = load float, float addrspace(1)* %905, align 4, !tbaa !7
  %917 = fmul contract float %915, %916
  %918 = getelementptr inbounds float, float addrspace(1)* %79, i64 %910
  %919 = load float, float addrspace(1)* %918, align 4, !tbaa !7
  %920 = fadd contract float %919, %917
  store float %920, float addrspace(1)* %918, align 4, !tbaa !7
  %921 = getelementptr inbounds float, float addrspace(1)* %4, i64 %902
  %922 = load float, float addrspace(1)* %921, align 4, !tbaa !7
  %923 = load float, float addrspace(1)* %905, align 4, !tbaa !7
  %924 = fmul contract float %922, %923
  %925 = getelementptr inbounds float, float addrspace(1)* %80, i64 %910
  %926 = load float, float addrspace(1)* %925, align 4, !tbaa !7
  %927 = fadd contract float %926, %924
  store float %927, float addrspace(1)* %925, align 4, !tbaa !7
  br label %928

928:                                              ; preds = %859, %899, %896, %883, %815, %619
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %929

929:                                              ; preds = %928, %23
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
