; ModuleID = '../data/hip_kernels/553/14/main.cu'
source_filename = "../data/hip_kernels/553/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28PossionImageCloningIterationPKfS0_PfS1_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = mul nsw i32 %16, %4
  %26 = add nsw i32 %25, %24
  %27 = icmp slt i32 %16, %5
  %28 = icmp slt i32 %24, %4
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %594

30:                                               ; preds = %7
  %31 = sext i32 %26 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fcmp contract ogt float %33, 1.270000e+02
  br i1 %34, label %35, label %594

35:                                               ; preds = %30
  %36 = add nsw i32 %24, -2
  %37 = add nsw i32 %16, -2
  %38 = mul nsw i32 %37, %4
  %39 = add nsw i32 %38, %36
  %40 = icmp sgt i32 %24, 1
  br i1 %40, label %41, label %68

41:                                               ; preds = %35
  %42 = icmp slt i32 %36, %4
  %43 = icmp sgt i32 %16, 1
  %44 = select i1 %42, i1 %43, i1 false
  %45 = icmp slt i32 %37, %5
  %46 = select i1 %44, i1 %45, i1 false
  br i1 %46, label %47, label %68

47:                                               ; preds = %41
  %48 = sext i32 %39 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fcmp contract ogt float %50, 1.270000e+02
  br i1 %51, label %52, label %68

52:                                               ; preds = %47
  %53 = mul nsw i32 %39, 3
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = fadd contract float %56, 0.000000e+00
  %58 = add nsw i32 %53, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = fadd contract float %61, 0.000000e+00
  %63 = add nsw i32 %53, 2
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fadd contract float %66, 0.000000e+00
  br label %68

68:                                               ; preds = %52, %47, %41, %35
  %69 = phi float [ %67, %52 ], [ 0.000000e+00, %47 ], [ 0.000000e+00, %41 ], [ 0.000000e+00, %35 ]
  %70 = phi float [ %62, %52 ], [ 0.000000e+00, %47 ], [ 0.000000e+00, %41 ], [ 0.000000e+00, %35 ]
  %71 = phi float [ %57, %52 ], [ 0.000000e+00, %47 ], [ 0.000000e+00, %41 ], [ 0.000000e+00, %35 ]
  %72 = add nsw i32 %38, %24
  %73 = icmp sgt i32 %24, -1
  br i1 %73, label %74, label %99

74:                                               ; preds = %68
  %75 = icmp sgt i32 %16, 1
  %76 = icmp slt i32 %37, %5
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %78, label %99

78:                                               ; preds = %74
  %79 = sext i32 %72 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = fcmp contract ogt float %81, 1.270000e+02
  br i1 %82, label %83, label %99

83:                                               ; preds = %78
  %84 = mul nsw i32 %72, 3
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fadd contract float %71, %87
  %89 = add nsw i32 %84, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = fadd contract float %70, %92
  %94 = add nsw i32 %84, 2
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = fadd contract float %69, %97
  br label %99

99:                                               ; preds = %83, %78, %74, %68
  %100 = phi float [ %98, %83 ], [ %69, %78 ], [ %69, %74 ], [ %69, %68 ]
  %101 = phi float [ %93, %83 ], [ %70, %78 ], [ %70, %74 ], [ %70, %68 ]
  %102 = phi float [ %88, %83 ], [ %71, %78 ], [ %71, %74 ], [ %71, %68 ]
  %103 = add nsw i32 %24, 2
  %104 = add nsw i32 %38, %103
  %105 = icmp sgt i32 %24, -3
  br i1 %105, label %106, label %133

106:                                              ; preds = %99
  %107 = icmp slt i32 %103, %4
  %108 = icmp sgt i32 %16, 1
  %109 = select i1 %107, i1 %108, i1 false
  %110 = icmp slt i32 %37, %5
  %111 = select i1 %109, i1 %110, i1 false
  br i1 %111, label %112, label %133

112:                                              ; preds = %106
  %113 = sext i32 %104 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fcmp contract ogt float %115, 1.270000e+02
  br i1 %116, label %117, label %133

117:                                              ; preds = %112
  %118 = mul nsw i32 %104, 3
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = fadd contract float %102, %121
  %123 = add nsw i32 %118, 1
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %2, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fadd contract float %101, %126
  %128 = add nsw i32 %118, 2
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %2, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = fadd contract float %100, %131
  br label %133

133:                                              ; preds = %117, %112, %106, %99
  %134 = phi float [ %132, %117 ], [ %100, %112 ], [ %100, %106 ], [ %100, %99 ]
  %135 = phi float [ %127, %117 ], [ %101, %112 ], [ %101, %106 ], [ %101, %99 ]
  %136 = phi float [ %122, %117 ], [ %102, %112 ], [ %102, %106 ], [ %102, %99 ]
  %137 = add nsw i32 %24, -1
  %138 = add nsw i32 %16, -1
  %139 = mul nsw i32 %138, %4
  %140 = add nsw i32 %139, %137
  %141 = icmp sgt i32 %24, 0
  br i1 %141, label %142, label %172

142:                                              ; preds = %133
  %143 = icmp sle i32 %24, %4
  %144 = icmp sgt i32 %16, 0
  %145 = select i1 %143, i1 %144, i1 false
  %146 = icmp sle i32 %16, %5
  %147 = select i1 %145, i1 %146, i1 false
  br i1 %147, label %148, label %172

148:                                              ; preds = %142
  %149 = sext i32 %140 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = fcmp contract ogt float %151, 1.270000e+02
  br i1 %152, label %153, label %172

153:                                              ; preds = %148
  %154 = mul nsw i32 %140, 3
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %2, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = fmul contract float %157, 2.000000e+00
  %159 = fadd contract float %136, %158
  %160 = add nsw i32 %154, 1
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %2, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !5
  %164 = fmul contract float %163, 2.000000e+00
  %165 = fadd contract float %135, %164
  %166 = add nsw i32 %154, 2
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %2, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !5
  %170 = fmul contract float %169, 2.000000e+00
  %171 = fadd contract float %134, %170
  br label %172

172:                                              ; preds = %153, %148, %142, %133
  %173 = phi float [ %171, %153 ], [ %134, %148 ], [ %134, %142 ], [ %134, %133 ]
  %174 = phi float [ %165, %153 ], [ %135, %148 ], [ %135, %142 ], [ %135, %133 ]
  %175 = phi float [ %159, %153 ], [ %136, %148 ], [ %136, %142 ], [ %136, %133 ]
  %176 = add nsw i32 %139, %24
  br i1 %73, label %177, label %205

177:                                              ; preds = %172
  %178 = icmp sgt i32 %16, 0
  %179 = icmp sle i32 %16, %5
  %180 = select i1 %178, i1 %179, i1 false
  br i1 %180, label %181, label %205

181:                                              ; preds = %177
  %182 = sext i32 %176 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7, !amdgpu.noclobber !5
  %185 = fcmp contract ogt float %184, 1.270000e+02
  br i1 %185, label %186, label %205

186:                                              ; preds = %181
  %187 = mul nsw i32 %176, 3
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %2, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !7, !amdgpu.noclobber !5
  %191 = fmul contract float %190, 2.000000e+00
  %192 = fadd contract float %175, %191
  %193 = add nsw i32 %187, 1
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %2, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7, !amdgpu.noclobber !5
  %197 = fmul contract float %196, 2.000000e+00
  %198 = fadd contract float %174, %197
  %199 = add nsw i32 %187, 2
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %2, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !7, !amdgpu.noclobber !5
  %203 = fmul contract float %202, 2.000000e+00
  %204 = fadd contract float %173, %203
  br label %205

205:                                              ; preds = %186, %181, %177, %172
  %206 = phi float [ %204, %186 ], [ %173, %181 ], [ %173, %177 ], [ %173, %172 ]
  %207 = phi float [ %198, %186 ], [ %174, %181 ], [ %174, %177 ], [ %174, %172 ]
  %208 = phi float [ %192, %186 ], [ %175, %181 ], [ %175, %177 ], [ %175, %172 ]
  %209 = add nsw i32 %24, 1
  %210 = add nsw i32 %139, %209
  %211 = icmp sgt i32 %24, -2
  br i1 %211, label %212, label %242

212:                                              ; preds = %205
  %213 = icmp slt i32 %209, %4
  %214 = icmp sgt i32 %16, 0
  %215 = select i1 %213, i1 %214, i1 false
  %216 = icmp sle i32 %16, %5
  %217 = select i1 %215, i1 %216, i1 false
  br i1 %217, label %218, label %242

218:                                              ; preds = %212
  %219 = sext i32 %210 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !7, !amdgpu.noclobber !5
  %222 = fcmp contract ogt float %221, 1.270000e+02
  br i1 %222, label %223, label %242

223:                                              ; preds = %218
  %224 = mul nsw i32 %210, 3
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %2, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !7, !amdgpu.noclobber !5
  %228 = fmul contract float %227, 2.000000e+00
  %229 = fadd contract float %208, %228
  %230 = add nsw i32 %224, 1
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %2, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !7, !amdgpu.noclobber !5
  %234 = fmul contract float %233, 2.000000e+00
  %235 = fadd contract float %207, %234
  %236 = add nsw i32 %224, 2
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %2, i64 %237
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !7, !amdgpu.noclobber !5
  %240 = fmul contract float %239, 2.000000e+00
  %241 = fadd contract float %206, %240
  br label %242

242:                                              ; preds = %223, %218, %212, %205
  %243 = phi float [ %241, %223 ], [ %206, %218 ], [ %206, %212 ], [ %206, %205 ]
  %244 = phi float [ %235, %223 ], [ %207, %218 ], [ %207, %212 ], [ %207, %205 ]
  %245 = phi float [ %229, %223 ], [ %208, %218 ], [ %208, %212 ], [ %208, %205 ]
  %246 = add nsw i32 %25, %36
  br i1 %40, label %247, label %272

247:                                              ; preds = %242
  %248 = icmp slt i32 %36, %4
  %249 = icmp sgt i32 %16, -1
  %250 = select i1 %248, i1 %249, i1 false
  br i1 %250, label %251, label %272

251:                                              ; preds = %247
  %252 = sext i32 %246 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %1, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !7, !amdgpu.noclobber !5
  %255 = fcmp contract ogt float %254, 1.270000e+02
  br i1 %255, label %256, label %272

256:                                              ; preds = %251
  %257 = mul nsw i32 %246, 3
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %2, i64 %258
  %260 = load float, float addrspace(1)* %259, align 4, !tbaa !7, !amdgpu.noclobber !5
  %261 = fadd contract float %245, %260
  %262 = add nsw i32 %257, 1
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %2, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !7, !amdgpu.noclobber !5
  %266 = fadd contract float %244, %265
  %267 = add nsw i32 %257, 2
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds float, float addrspace(1)* %2, i64 %268
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !7, !amdgpu.noclobber !5
  %271 = fadd contract float %243, %270
  br label %272

272:                                              ; preds = %256, %251, %247, %242
  %273 = phi float [ %271, %256 ], [ %243, %251 ], [ %243, %247 ], [ %243, %242 ]
  %274 = phi float [ %266, %256 ], [ %244, %251 ], [ %244, %247 ], [ %244, %242 ]
  %275 = phi float [ %261, %256 ], [ %245, %251 ], [ %245, %247 ], [ %245, %242 ]
  %276 = add nsw i32 %25, %137
  br i1 %141, label %277, label %305

277:                                              ; preds = %272
  %278 = icmp sle i32 %24, %4
  %279 = icmp sgt i32 %16, -1
  %280 = select i1 %278, i1 %279, i1 false
  br i1 %280, label %281, label %305

281:                                              ; preds = %277
  %282 = sext i32 %276 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %1, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !7, !amdgpu.noclobber !5
  %285 = fcmp contract ogt float %284, 1.270000e+02
  br i1 %285, label %286, label %305

286:                                              ; preds = %281
  %287 = mul nsw i32 %276, 3
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds float, float addrspace(1)* %2, i64 %288
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !7, !amdgpu.noclobber !5
  %291 = fmul contract float %290, 2.000000e+00
  %292 = fadd contract float %275, %291
  %293 = add nsw i32 %287, 1
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %2, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !7, !amdgpu.noclobber !5
  %297 = fmul contract float %296, 2.000000e+00
  %298 = fadd contract float %274, %297
  %299 = add nsw i32 %287, 2
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds float, float addrspace(1)* %2, i64 %300
  %302 = load float, float addrspace(1)* %301, align 4, !tbaa !7, !amdgpu.noclobber !5
  %303 = fmul contract float %302, 2.000000e+00
  %304 = fadd contract float %273, %303
  br label %305

305:                                              ; preds = %286, %281, %277, %272
  %306 = phi float [ %304, %286 ], [ %273, %281 ], [ %273, %277 ], [ %273, %272 ]
  %307 = phi float [ %298, %286 ], [ %274, %281 ], [ %274, %277 ], [ %274, %272 ]
  %308 = phi float [ %292, %286 ], [ %275, %281 ], [ %275, %277 ], [ %275, %272 ]
  %309 = add nsw i32 %25, %209
  br i1 %211, label %310, label %338

310:                                              ; preds = %305
  %311 = icmp slt i32 %209, %4
  %312 = icmp sgt i32 %16, -1
  %313 = select i1 %311, i1 %312, i1 false
  br i1 %313, label %314, label %338

314:                                              ; preds = %310
  %315 = sext i32 %309 to i64
  %316 = getelementptr inbounds float, float addrspace(1)* %1, i64 %315
  %317 = load float, float addrspace(1)* %316, align 4, !tbaa !7, !amdgpu.noclobber !5
  %318 = fcmp contract ogt float %317, 1.270000e+02
  br i1 %318, label %319, label %338

319:                                              ; preds = %314
  %320 = mul nsw i32 %309, 3
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds float, float addrspace(1)* %2, i64 %321
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !7, !amdgpu.noclobber !5
  %324 = fmul contract float %323, 2.000000e+00
  %325 = fadd contract float %308, %324
  %326 = add nsw i32 %320, 1
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %2, i64 %327
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !7, !amdgpu.noclobber !5
  %330 = fmul contract float %329, 2.000000e+00
  %331 = fadd contract float %307, %330
  %332 = add nsw i32 %320, 2
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %2, i64 %333
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !7, !amdgpu.noclobber !5
  %336 = fmul contract float %335, 2.000000e+00
  %337 = fadd contract float %306, %336
  br label %338

338:                                              ; preds = %319, %314, %310, %305
  %339 = phi float [ %337, %319 ], [ %306, %314 ], [ %306, %310 ], [ %306, %305 ]
  %340 = phi float [ %331, %319 ], [ %307, %314 ], [ %307, %310 ], [ %307, %305 ]
  %341 = phi float [ %325, %319 ], [ %308, %314 ], [ %308, %310 ], [ %308, %305 ]
  %342 = add nsw i32 %25, %103
  br i1 %105, label %343, label %368

343:                                              ; preds = %338
  %344 = icmp slt i32 %103, %4
  %345 = icmp sgt i32 %16, -1
  %346 = select i1 %344, i1 %345, i1 false
  br i1 %346, label %347, label %368

347:                                              ; preds = %343
  %348 = sext i32 %342 to i64
  %349 = getelementptr inbounds float, float addrspace(1)* %1, i64 %348
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !7, !amdgpu.noclobber !5
  %351 = fcmp contract ogt float %350, 1.270000e+02
  br i1 %351, label %352, label %368

352:                                              ; preds = %347
  %353 = mul nsw i32 %342, 3
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds float, float addrspace(1)* %2, i64 %354
  %356 = load float, float addrspace(1)* %355, align 4, !tbaa !7, !amdgpu.noclobber !5
  %357 = fadd contract float %341, %356
  %358 = add nsw i32 %353, 1
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds float, float addrspace(1)* %2, i64 %359
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !7, !amdgpu.noclobber !5
  %362 = fadd contract float %340, %361
  %363 = add nsw i32 %353, 2
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds float, float addrspace(1)* %2, i64 %364
  %366 = load float, float addrspace(1)* %365, align 4, !tbaa !7, !amdgpu.noclobber !5
  %367 = fadd contract float %339, %366
  br label %368

368:                                              ; preds = %352, %347, %343, %338
  %369 = phi float [ %367, %352 ], [ %339, %347 ], [ %339, %343 ], [ %339, %338 ]
  %370 = phi float [ %362, %352 ], [ %340, %347 ], [ %340, %343 ], [ %340, %338 ]
  %371 = phi float [ %357, %352 ], [ %341, %347 ], [ %341, %343 ], [ %341, %338 ]
  %372 = add nsw i32 %16, 1
  %373 = mul nsw i32 %372, %4
  %374 = add nsw i32 %373, %137
  br i1 %141, label %375, label %405

375:                                              ; preds = %368
  %376 = icmp sle i32 %24, %4
  %377 = icmp sgt i32 %16, -2
  %378 = select i1 %376, i1 %377, i1 false
  %379 = icmp slt i32 %372, %5
  %380 = select i1 %378, i1 %379, i1 false
  br i1 %380, label %381, label %405

381:                                              ; preds = %375
  %382 = sext i32 %374 to i64
  %383 = getelementptr inbounds float, float addrspace(1)* %1, i64 %382
  %384 = load float, float addrspace(1)* %383, align 4, !tbaa !7, !amdgpu.noclobber !5
  %385 = fcmp contract ogt float %384, 1.270000e+02
  br i1 %385, label %386, label %405

386:                                              ; preds = %381
  %387 = mul nsw i32 %374, 3
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds float, float addrspace(1)* %2, i64 %388
  %390 = load float, float addrspace(1)* %389, align 4, !tbaa !7, !amdgpu.noclobber !5
  %391 = fmul contract float %390, 2.000000e+00
  %392 = fadd contract float %371, %391
  %393 = add nsw i32 %387, 1
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds float, float addrspace(1)* %2, i64 %394
  %396 = load float, float addrspace(1)* %395, align 4, !tbaa !7, !amdgpu.noclobber !5
  %397 = fmul contract float %396, 2.000000e+00
  %398 = fadd contract float %370, %397
  %399 = add nsw i32 %387, 2
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds float, float addrspace(1)* %2, i64 %400
  %402 = load float, float addrspace(1)* %401, align 4, !tbaa !7, !amdgpu.noclobber !5
  %403 = fmul contract float %402, 2.000000e+00
  %404 = fadd contract float %369, %403
  br label %405

405:                                              ; preds = %386, %381, %375, %368
  %406 = phi float [ %404, %386 ], [ %369, %381 ], [ %369, %375 ], [ %369, %368 ]
  %407 = phi float [ %398, %386 ], [ %370, %381 ], [ %370, %375 ], [ %370, %368 ]
  %408 = phi float [ %392, %386 ], [ %371, %381 ], [ %371, %375 ], [ %371, %368 ]
  %409 = add nsw i32 %373, %24
  br i1 %73, label %410, label %438

410:                                              ; preds = %405
  %411 = icmp sgt i32 %16, -2
  %412 = icmp slt i32 %372, %5
  %413 = select i1 %411, i1 %412, i1 false
  br i1 %413, label %414, label %438

414:                                              ; preds = %410
  %415 = sext i32 %409 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %1, i64 %415
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !7, !amdgpu.noclobber !5
  %418 = fcmp contract ogt float %417, 1.270000e+02
  br i1 %418, label %419, label %438

419:                                              ; preds = %414
  %420 = mul nsw i32 %409, 3
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds float, float addrspace(1)* %2, i64 %421
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !7, !amdgpu.noclobber !5
  %424 = fmul contract float %423, 2.000000e+00
  %425 = fadd contract float %408, %424
  %426 = add nsw i32 %420, 1
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds float, float addrspace(1)* %2, i64 %427
  %429 = load float, float addrspace(1)* %428, align 4, !tbaa !7, !amdgpu.noclobber !5
  %430 = fmul contract float %429, 2.000000e+00
  %431 = fadd contract float %407, %430
  %432 = add nsw i32 %420, 2
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds float, float addrspace(1)* %2, i64 %433
  %435 = load float, float addrspace(1)* %434, align 4, !tbaa !7, !amdgpu.noclobber !5
  %436 = fmul contract float %435, 2.000000e+00
  %437 = fadd contract float %406, %436
  br label %438

438:                                              ; preds = %419, %414, %410, %405
  %439 = phi float [ %437, %419 ], [ %406, %414 ], [ %406, %410 ], [ %406, %405 ]
  %440 = phi float [ %431, %419 ], [ %407, %414 ], [ %407, %410 ], [ %407, %405 ]
  %441 = phi float [ %425, %419 ], [ %408, %414 ], [ %408, %410 ], [ %408, %405 ]
  %442 = add nsw i32 %373, %209
  br i1 %211, label %443, label %473

443:                                              ; preds = %438
  %444 = icmp slt i32 %209, %4
  %445 = icmp sgt i32 %16, -2
  %446 = select i1 %444, i1 %445, i1 false
  %447 = icmp slt i32 %372, %5
  %448 = select i1 %446, i1 %447, i1 false
  br i1 %448, label %449, label %473

449:                                              ; preds = %443
  %450 = sext i32 %442 to i64
  %451 = getelementptr inbounds float, float addrspace(1)* %1, i64 %450
  %452 = load float, float addrspace(1)* %451, align 4, !tbaa !7, !amdgpu.noclobber !5
  %453 = fcmp contract ogt float %452, 1.270000e+02
  br i1 %453, label %454, label %473

454:                                              ; preds = %449
  %455 = mul nsw i32 %442, 3
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds float, float addrspace(1)* %2, i64 %456
  %458 = load float, float addrspace(1)* %457, align 4, !tbaa !7, !amdgpu.noclobber !5
  %459 = fmul contract float %458, 2.000000e+00
  %460 = fadd contract float %441, %459
  %461 = add nsw i32 %455, 1
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds float, float addrspace(1)* %2, i64 %462
  %464 = load float, float addrspace(1)* %463, align 4, !tbaa !7, !amdgpu.noclobber !5
  %465 = fmul contract float %464, 2.000000e+00
  %466 = fadd contract float %440, %465
  %467 = add nsw i32 %455, 2
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds float, float addrspace(1)* %2, i64 %468
  %470 = load float, float addrspace(1)* %469, align 4, !tbaa !7, !amdgpu.noclobber !5
  %471 = fmul contract float %470, 2.000000e+00
  %472 = fadd contract float %439, %471
  br label %473

473:                                              ; preds = %454, %449, %443, %438
  %474 = phi float [ %472, %454 ], [ %439, %449 ], [ %439, %443 ], [ %439, %438 ]
  %475 = phi float [ %466, %454 ], [ %440, %449 ], [ %440, %443 ], [ %440, %438 ]
  %476 = phi float [ %460, %454 ], [ %441, %449 ], [ %441, %443 ], [ %441, %438 ]
  %477 = add nsw i32 %16, 2
  %478 = mul nsw i32 %477, %4
  %479 = add nsw i32 %478, %36
  br i1 %40, label %480, label %507

480:                                              ; preds = %473
  %481 = icmp slt i32 %36, %4
  %482 = icmp sgt i32 %16, -3
  %483 = select i1 %481, i1 %482, i1 false
  %484 = icmp slt i32 %477, %5
  %485 = select i1 %483, i1 %484, i1 false
  br i1 %485, label %486, label %507

486:                                              ; preds = %480
  %487 = sext i32 %479 to i64
  %488 = getelementptr inbounds float, float addrspace(1)* %1, i64 %487
  %489 = load float, float addrspace(1)* %488, align 4, !tbaa !7, !amdgpu.noclobber !5
  %490 = fcmp contract ogt float %489, 1.270000e+02
  br i1 %490, label %491, label %507

491:                                              ; preds = %486
  %492 = mul nsw i32 %479, 3
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds float, float addrspace(1)* %2, i64 %493
  %495 = load float, float addrspace(1)* %494, align 4, !tbaa !7, !amdgpu.noclobber !5
  %496 = fadd contract float %476, %495
  %497 = add nsw i32 %492, 1
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds float, float addrspace(1)* %2, i64 %498
  %500 = load float, float addrspace(1)* %499, align 4, !tbaa !7, !amdgpu.noclobber !5
  %501 = fadd contract float %475, %500
  %502 = add nsw i32 %492, 2
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds float, float addrspace(1)* %2, i64 %503
  %505 = load float, float addrspace(1)* %504, align 4, !tbaa !7, !amdgpu.noclobber !5
  %506 = fadd contract float %474, %505
  br label %507

507:                                              ; preds = %491, %486, %480, %473
  %508 = phi float [ %506, %491 ], [ %474, %486 ], [ %474, %480 ], [ %474, %473 ]
  %509 = phi float [ %501, %491 ], [ %475, %486 ], [ %475, %480 ], [ %475, %473 ]
  %510 = phi float [ %496, %491 ], [ %476, %486 ], [ %476, %480 ], [ %476, %473 ]
  %511 = add nsw i32 %478, %24
  br i1 %73, label %512, label %537

512:                                              ; preds = %507
  %513 = icmp sgt i32 %16, -3
  %514 = icmp slt i32 %477, %5
  %515 = select i1 %513, i1 %514, i1 false
  br i1 %515, label %516, label %537

516:                                              ; preds = %512
  %517 = sext i32 %511 to i64
  %518 = getelementptr inbounds float, float addrspace(1)* %1, i64 %517
  %519 = load float, float addrspace(1)* %518, align 4, !tbaa !7, !amdgpu.noclobber !5
  %520 = fcmp contract ogt float %519, 1.270000e+02
  br i1 %520, label %521, label %537

521:                                              ; preds = %516
  %522 = mul nsw i32 %511, 3
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds float, float addrspace(1)* %2, i64 %523
  %525 = load float, float addrspace(1)* %524, align 4, !tbaa !7, !amdgpu.noclobber !5
  %526 = fadd contract float %510, %525
  %527 = add nsw i32 %522, 1
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds float, float addrspace(1)* %2, i64 %528
  %530 = load float, float addrspace(1)* %529, align 4, !tbaa !7, !amdgpu.noclobber !5
  %531 = fadd contract float %509, %530
  %532 = add nsw i32 %522, 2
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds float, float addrspace(1)* %2, i64 %533
  %535 = load float, float addrspace(1)* %534, align 4, !tbaa !7, !amdgpu.noclobber !5
  %536 = fadd contract float %508, %535
  br label %537

537:                                              ; preds = %521, %516, %512, %507
  %538 = phi float [ %536, %521 ], [ %508, %516 ], [ %508, %512 ], [ %508, %507 ]
  %539 = phi float [ %531, %521 ], [ %509, %516 ], [ %509, %512 ], [ %509, %507 ]
  %540 = phi float [ %526, %521 ], [ %510, %516 ], [ %510, %512 ], [ %510, %507 ]
  %541 = add nsw i32 %478, %103
  br i1 %105, label %542, label %569

542:                                              ; preds = %537
  %543 = icmp slt i32 %103, %4
  %544 = icmp sgt i32 %16, -3
  %545 = select i1 %543, i1 %544, i1 false
  %546 = icmp slt i32 %477, %5
  %547 = select i1 %545, i1 %546, i1 false
  br i1 %547, label %548, label %569

548:                                              ; preds = %542
  %549 = sext i32 %541 to i64
  %550 = getelementptr inbounds float, float addrspace(1)* %1, i64 %549
  %551 = load float, float addrspace(1)* %550, align 4, !tbaa !7, !amdgpu.noclobber !5
  %552 = fcmp contract ogt float %551, 1.270000e+02
  br i1 %552, label %553, label %569

553:                                              ; preds = %548
  %554 = mul nsw i32 %541, 3
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds float, float addrspace(1)* %2, i64 %555
  %557 = load float, float addrspace(1)* %556, align 4, !tbaa !7, !amdgpu.noclobber !5
  %558 = fadd contract float %540, %557
  %559 = add nsw i32 %554, 1
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds float, float addrspace(1)* %2, i64 %560
  %562 = load float, float addrspace(1)* %561, align 4, !tbaa !7, !amdgpu.noclobber !5
  %563 = fadd contract float %539, %562
  %564 = add nsw i32 %554, 2
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds float, float addrspace(1)* %2, i64 %565
  %567 = load float, float addrspace(1)* %566, align 4, !tbaa !7, !amdgpu.noclobber !5
  %568 = fadd contract float %538, %567
  br label %569

569:                                              ; preds = %553, %548, %542, %537
  %570 = phi float [ %568, %553 ], [ %538, %548 ], [ %538, %542 ], [ %538, %537 ]
  %571 = phi float [ %563, %553 ], [ %539, %548 ], [ %539, %542 ], [ %539, %537 ]
  %572 = phi float [ %558, %553 ], [ %540, %548 ], [ %540, %542 ], [ %540, %537 ]
  %573 = mul nsw i32 %26, 3
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds float, float addrspace(1)* %0, i64 %574
  %576 = load float, float addrspace(1)* %575, align 4, !tbaa !7, !amdgpu.noclobber !5
  %577 = fdiv contract float %572, 2.400000e+01
  %578 = fadd contract float %577, %576
  %579 = getelementptr inbounds float, float addrspace(1)* %3, i64 %574
  store float %578, float addrspace(1)* %579, align 4, !tbaa !7
  %580 = add nsw i32 %573, 1
  %581 = sext i32 %580 to i64
  %582 = getelementptr inbounds float, float addrspace(1)* %0, i64 %581
  %583 = load float, float addrspace(1)* %582, align 4, !tbaa !7
  %584 = fdiv contract float %571, 2.400000e+01
  %585 = fadd contract float %584, %583
  %586 = getelementptr inbounds float, float addrspace(1)* %3, i64 %581
  store float %585, float addrspace(1)* %586, align 4, !tbaa !7
  %587 = add nsw i32 %573, 2
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds float, float addrspace(1)* %0, i64 %588
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !7
  %591 = fdiv contract float %570, 2.400000e+01
  %592 = fadd contract float %591, %590
  %593 = getelementptr inbounds float, float addrspace(1)* %3, i64 %588
  store float %592, float addrspace(1)* %593, align 4, !tbaa !7
  br label %594

594:                                              ; preds = %569, %30, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
