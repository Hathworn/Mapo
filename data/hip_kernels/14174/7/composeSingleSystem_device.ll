; ModuleID = '../data/hip_kernels/14174/7/main.cu'
source_filename = "../data/hip_kernels/14174/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_priorF = protected local_unnamed_addr addrspace(1) externally_initialized global float 0.000000e+00, align 4

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3addPfS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load float, float addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %4 = load float, float addrspace(1)* %0, align 4, !tbaa !4, !amdgpu.noclobber !8
  %5 = fadd contract float %3, %4
  store float %5, float addrspace(1)* %0, align 4, !tbaa !4
  ret void
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19composeSingleSystemmPKfmmmmfiPfPiS2_(i64 %0, float addrspace(1)* nocapture readonly %1, i64 %2, i64 %3, i64 %4, i64 %5, float %6, i32 %7, float addrspace(1)* nocapture %8, i32 addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture writeonly %10) local_unnamed_addr #1 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !9, !invariant.load !8
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %20 = add i32 %18, %19
  %21 = zext i32 %20 to i64
  %22 = mul i64 %3, %2
  %23 = icmp ugt i64 %22, %21
  br i1 %23, label %24, label %319

24:                                               ; preds = %11
  %25 = freeze i64 %21
  %26 = freeze i64 %2
  %27 = udiv i64 %25, %26
  %28 = mul i64 %27, %26
  %29 = sub i64 %25, %28
  %30 = add i64 %21, %0
  %31 = uitofp i64 %4 to float
  %32 = uitofp i64 %2 to float
  %33 = fdiv contract float %31, %32
  %34 = load float, float addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %35 = uitofp i64 %29 to float
  %36 = fmul contract float %34, %35
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !4, !amdgpu.noclobber !8
  %39 = uitofp i64 %27 to float
  %40 = fmul contract float %38, %39
  %41 = fadd contract float %36, %40
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !4, !amdgpu.noclobber !8
  %44 = fadd contract float %43, %41
  %45 = fmul contract float %33, %44
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 3
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !4, !amdgpu.noclobber !8
  %48 = fmul contract float %47, %35
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 4
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !4, !amdgpu.noclobber !8
  %51 = fmul contract float %50, %39
  %52 = fadd contract float %48, %51
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 5
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !4, !amdgpu.noclobber !8
  %55 = fadd contract float %54, %52
  %56 = fmul contract float %33, %55
  %57 = shl nsw i32 %7, 1
  %58 = add nuw nsw i32 %57, 1
  %59 = mul nsw i32 %58, %58
  %60 = zext i32 %59 to i64
  %61 = mul i64 %30, %60
  %62 = sub i32 0, %7
  %63 = icmp slt i32 %7, 0
  br i1 %63, label %70, label %64

64:                                               ; preds = %24
  %65 = fmul contract float %33, 2.000000e+00
  %66 = fmul contract float %33, %65
  %67 = fmul contract float %66, %6
  %68 = fmul contract float %67, %6
  %69 = trunc i64 %4 to i32
  br label %81

70:                                               ; preds = %159, %24
  %71 = phi i64 [ 0, %24 ], [ %160, %159 ]
  %72 = phi float [ 0.000000e+00, %24 ], [ %161, %159 ]
  %73 = fcmp contract ogt float %72, 0.000000e+00
  %74 = icmp ne i64 %71, 0
  %75 = select i1 %73, i1 %74, i1 false
  br i1 %75, label %76, label %202

76:                                               ; preds = %70
  %77 = and i64 %71, 3
  %78 = icmp ult i64 %71, 4
  br i1 %78, label %189, label %79

79:                                               ; preds = %76
  %80 = and i64 %71, -4
  br label %164

81:                                               ; preds = %64, %159
  %82 = phi float [ 0.000000e+00, %64 ], [ %161, %159 ]
  %83 = phi i64 [ 0, %64 ], [ %160, %159 ]
  %84 = phi i32 [ %62, %64 ], [ %162, %159 ]
  %85 = sitofp i32 %84 to float
  %86 = fadd contract float %56, %85
  %87 = fadd contract float %86, 5.000000e-01
  %88 = tail call float @llvm.floor.f32(float %87)
  %89 = fptosi float %88 to i32
  %90 = icmp slt i32 %89, 0
  %91 = zext i32 %89 to i64
  %92 = icmp uge i64 %91, %5
  %93 = select i1 %90, i1 true, i1 %92
  br i1 %93, label %159, label %94

94:                                               ; preds = %81
  %95 = sitofp i32 %89 to float
  %96 = fsub contract float %56, %95
  %97 = fmul contract float %96, %96
  %98 = mul i32 %89, %69
  br label %99

99:                                               ; preds = %94, %154
  %100 = phi float [ %82, %94 ], [ %156, %154 ]
  %101 = phi i64 [ %83, %94 ], [ %155, %154 ]
  %102 = phi i32 [ %62, %94 ], [ %157, %154 ]
  %103 = sitofp i32 %102 to float
  %104 = fadd contract float %45, %103
  %105 = fadd contract float %104, 5.000000e-01
  %106 = tail call float @llvm.floor.f32(float %105)
  %107 = fptosi float %106 to i32
  %108 = icmp sgt i32 %107, -1
  %109 = zext i32 %107 to i64
  %110 = icmp ult i64 %109, %4
  %111 = select i1 %108, i1 %110, i1 false
  br i1 %111, label %112, label %154

112:                                              ; preds = %99
  %113 = sitofp i32 %107 to float
  %114 = fsub contract float %45, %113
  %115 = fmul contract float %114, %114
  %116 = load float, float addrspace(1)* %1, align 4, !tbaa !4
  %117 = fmul contract float %115, %116
  %118 = fmul contract float %116, %117
  %119 = load float, float addrspace(1)* %49, align 4, !tbaa !4
  %120 = fmul contract float %97, %119
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = fmul contract float %96, %114
  %124 = fmul contract float %123, %116
  %125 = load float, float addrspace(1)* %46, align 4, !tbaa !4
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %126, %122
  %128 = load float, float addrspace(1)* %37, align 4, !tbaa !4
  %129 = fmul contract float %123, %128
  %130 = fmul contract float %119, %129
  %131 = fadd contract float %127, %130
  %132 = fneg contract float %131
  %133 = fdiv contract float %132, %68
  %134 = fmul float %133, 0x3FF7154760000000
  %135 = tail call float @llvm.rint.f32(float %134)
  %136 = fcmp ogt float %133, 0x40562E4300000000
  %137 = fcmp olt float %133, 0xC059D1DA00000000
  %138 = fneg float %134
  %139 = tail call float @llvm.fma.f32(float %133, float 0x3FF7154760000000, float %138)
  %140 = tail call float @llvm.fma.f32(float %133, float 0x3E54AE0BE0000000, float %139)
  %141 = fsub float %134, %135
  %142 = fadd float %140, %141
  %143 = tail call float @llvm.exp2.f32(float %142)
  %144 = fptosi float %135 to i32
  %145 = tail call float @llvm.amdgcn.ldexp.f32(float %143, i32 %144)
  %146 = select i1 %137, float 0.000000e+00, float %145
  %147 = select i1 %136, float 0x7FF0000000000000, float %146
  %148 = add i64 %101, %61
  %149 = getelementptr inbounds float, float addrspace(1)* %8, i64 %148
  store float %147, float addrspace(1)* %149, align 4, !tbaa !4
  %150 = add i32 %98, %107
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %148
  store i32 %150, i32 addrspace(1)* %151, align 4, !tbaa !11
  %152 = fadd contract float %100, %147
  %153 = add i64 %101, 1
  br label %154

154:                                              ; preds = %99, %112
  %155 = phi i64 [ %153, %112 ], [ %101, %99 ]
  %156 = phi float [ %152, %112 ], [ %100, %99 ]
  %157 = add i32 %102, 1
  %158 = icmp eq i32 %102, %7
  br i1 %158, label %159, label %99, !llvm.loop !13

159:                                              ; preds = %154, %81
  %160 = phi i64 [ %83, %81 ], [ %155, %154 ]
  %161 = phi float [ %82, %81 ], [ %156, %154 ]
  %162 = add i32 %84, 1
  %163 = icmp eq i32 %84, %7
  br i1 %163, label %70, label %81, !llvm.loop !15

164:                                              ; preds = %164, %79
  %165 = phi i64 [ 0, %79 ], [ %186, %164 ]
  %166 = phi i64 [ 0, %79 ], [ %187, %164 ]
  %167 = add i64 %165, %61
  %168 = getelementptr inbounds float, float addrspace(1)* %8, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !4
  %170 = fdiv contract float %169, %72
  store float %170, float addrspace(1)* %168, align 4, !tbaa !4
  %171 = or i64 %165, 1
  %172 = add i64 %171, %61
  %173 = getelementptr inbounds float, float addrspace(1)* %8, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !4
  %175 = fdiv contract float %174, %72
  store float %175, float addrspace(1)* %173, align 4, !tbaa !4
  %176 = or i64 %165, 2
  %177 = add i64 %176, %61
  %178 = getelementptr inbounds float, float addrspace(1)* %8, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !4
  %180 = fdiv contract float %179, %72
  store float %180, float addrspace(1)* %178, align 4, !tbaa !4
  %181 = or i64 %165, 3
  %182 = add i64 %181, %61
  %183 = getelementptr inbounds float, float addrspace(1)* %8, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !4
  %185 = fdiv contract float %184, %72
  store float %185, float addrspace(1)* %183, align 4, !tbaa !4
  %186 = add nuw i64 %165, 4
  %187 = add i64 %166, 4
  %188 = icmp eq i64 %187, %80
  br i1 %188, label %189, label %164, !llvm.loop !16

189:                                              ; preds = %164, %76
  %190 = phi i64 [ 0, %76 ], [ %186, %164 ]
  %191 = icmp eq i64 %77, 0
  br i1 %191, label %202, label %192

192:                                              ; preds = %189, %192
  %193 = phi i64 [ %199, %192 ], [ %190, %189 ]
  %194 = phi i64 [ %200, %192 ], [ 0, %189 ]
  %195 = add i64 %193, %61
  %196 = getelementptr inbounds float, float addrspace(1)* %8, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !4
  %198 = fdiv contract float %197, %72
  store float %198, float addrspace(1)* %196, align 4, !tbaa !4
  %199 = add nuw i64 %193, 1
  %200 = add i64 %194, 1
  %201 = icmp eq i64 %200, %77
  br i1 %201, label %202, label %192, !llvm.loop !17

202:                                              ; preds = %189, %192, %70
  %203 = icmp eq i64 %71, 0
  br i1 %203, label %204, label %207

204:                                              ; preds = %202
  %205 = getelementptr inbounds float, float addrspace(1)* %8, i64 %61
  store float 0.000000e+00, float addrspace(1)* %205, align 4, !tbaa !4
  %206 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %61
  store i32 0, i32 addrspace(1)* %206, align 4, !tbaa !11
  br label %207

207:                                              ; preds = %204, %202
  %208 = phi i64 [ 1, %204 ], [ %71, %202 ]
  %209 = mul i64 %5, %4
  br label %210

210:                                              ; preds = %221, %207
  %211 = phi i64 [ %208, %207 ], [ %224, %221 ]
  %212 = icmp ult i64 %211, %60
  br i1 %212, label %213, label %316

213:                                              ; preds = %210
  %214 = add i64 %211, %61
  %215 = add i64 %214, -1
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %215
  %217 = load i32, i32 addrspace(1)* %216, align 4, !tbaa !11
  %218 = add nsw i32 %217, 1
  %219 = sext i32 %218 to i64
  %220 = icmp ugt i64 %209, %219
  br i1 %220, label %221, label %225

221:                                              ; preds = %213
  %222 = getelementptr inbounds float, float addrspace(1)* %8, i64 %214
  store float 0.000000e+00, float addrspace(1)* %222, align 4, !tbaa !4
  %223 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %214
  store i32 %218, i32 addrspace(1)* %223, align 4, !tbaa !11
  %224 = add nuw i64 %211, 1
  br label %210

225:                                              ; preds = %213
  br i1 %212, label %226, label %316

226:                                              ; preds = %225
  %227 = trunc i64 %211 to i32
  %228 = add i32 %227, -1
  %229 = icmp sgt i32 %228, -1
  br i1 %229, label %230, label %253

230:                                              ; preds = %226
  %231 = add i64 %61, %60
  %232 = and i32 %227, 3
  %233 = icmp eq i32 %232, 0
  br i1 %233, label %250, label %234

234:                                              ; preds = %230, %234
  %235 = phi i32 [ %247, %234 ], [ %228, %230 ]
  %236 = phi i32 [ %248, %234 ], [ 0, %230 ]
  %237 = zext i32 %235 to i64
  %238 = add i64 %61, %237
  %239 = getelementptr inbounds float, float addrspace(1)* %8, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !4
  %241 = sub i64 %237, %211
  %242 = add i64 %231, %241
  %243 = getelementptr inbounds float, float addrspace(1)* %8, i64 %242
  store float %240, float addrspace(1)* %243, align 4, !tbaa !4
  %244 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %238
  %245 = load i32, i32 addrspace(1)* %244, align 4, !tbaa !11
  %246 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %242
  store i32 %245, i32 addrspace(1)* %246, align 4, !tbaa !11
  %247 = add nsw i32 %235, -1
  %248 = add i32 %236, 1
  %249 = icmp eq i32 %248, %232
  br i1 %249, label %250, label %234, !llvm.loop !19

250:                                              ; preds = %234, %230
  %251 = phi i32 [ %228, %230 ], [ %247, %234 ]
  %252 = icmp ult i32 %228, 3
  br i1 %252, label %253, label %257

253:                                              ; preds = %250, %257, %226
  %254 = sub i32 %59, %227
  %255 = add i32 %254, -1
  %256 = icmp sgt i32 %255, -1
  br i1 %256, label %304, label %316

257:                                              ; preds = %250, %257
  %258 = phi i32 [ %302, %257 ], [ %251, %250 ]
  %259 = zext i32 %258 to i64
  %260 = add i64 %61, %259
  %261 = getelementptr inbounds float, float addrspace(1)* %8, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !4
  %263 = sub i64 %259, %211
  %264 = add i64 %231, %263
  %265 = getelementptr inbounds float, float addrspace(1)* %8, i64 %264
  store float %262, float addrspace(1)* %265, align 4, !tbaa !4
  %266 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %260
  %267 = load i32, i32 addrspace(1)* %266, align 4, !tbaa !11
  %268 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %264
  store i32 %267, i32 addrspace(1)* %268, align 4, !tbaa !11
  %269 = add nsw i32 %258, -1
  %270 = zext i32 %269 to i64
  %271 = add i64 %61, %270
  %272 = getelementptr inbounds float, float addrspace(1)* %8, i64 %271
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !4
  %274 = sub i64 %270, %211
  %275 = add i64 %231, %274
  %276 = getelementptr inbounds float, float addrspace(1)* %8, i64 %275
  store float %273, float addrspace(1)* %276, align 4, !tbaa !4
  %277 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %271
  %278 = load i32, i32 addrspace(1)* %277, align 4, !tbaa !11
  %279 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %275
  store i32 %278, i32 addrspace(1)* %279, align 4, !tbaa !11
  %280 = add nsw i32 %258, -2
  %281 = zext i32 %280 to i64
  %282 = add i64 %61, %281
  %283 = getelementptr inbounds float, float addrspace(1)* %8, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !4
  %285 = sub i64 %281, %211
  %286 = add i64 %231, %285
  %287 = getelementptr inbounds float, float addrspace(1)* %8, i64 %286
  store float %284, float addrspace(1)* %287, align 4, !tbaa !4
  %288 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %282
  %289 = load i32, i32 addrspace(1)* %288, align 4, !tbaa !11
  %290 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %286
  store i32 %289, i32 addrspace(1)* %290, align 4, !tbaa !11
  %291 = add nsw i32 %258, -3
  %292 = zext i32 %291 to i64
  %293 = add i64 %61, %292
  %294 = getelementptr inbounds float, float addrspace(1)* %8, i64 %293
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !4
  %296 = sub i64 %292, %211
  %297 = add i64 %231, %296
  %298 = getelementptr inbounds float, float addrspace(1)* %8, i64 %297
  store float %295, float addrspace(1)* %298, align 4, !tbaa !4
  %299 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %293
  %300 = load i32, i32 addrspace(1)* %299, align 4, !tbaa !11
  %301 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %297
  store i32 %300, i32 addrspace(1)* %301, align 4, !tbaa !11
  %302 = add nsw i32 %258, -4
  %303 = icmp sgt i32 %258, 3
  br i1 %303, label %257, label %253, !llvm.loop !20

304:                                              ; preds = %253, %304
  %305 = phi i32 [ %314, %304 ], [ %255, %253 ]
  %306 = zext i32 %305 to i64
  %307 = add i64 %61, %306
  %308 = getelementptr inbounds float, float addrspace(1)* %8, i64 %307
  store float 0.000000e+00, float addrspace(1)* %308, align 4, !tbaa !4
  %309 = add i64 %307, 1
  %310 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %309
  %311 = load i32, i32 addrspace(1)* %310, align 4, !tbaa !11
  %312 = add nsw i32 %311, -1
  %313 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %307
  store i32 %312, i32 addrspace(1)* %313, align 4, !tbaa !11
  %314 = add nsw i32 %305, -1
  %315 = icmp sgt i32 %305, 0
  br i1 %315, label %304, label %316, !llvm.loop !21

316:                                              ; preds = %210, %304, %253, %225
  %317 = trunc i64 %61 to i32
  %318 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %30
  store i32 %317, i32 addrspace(1)* %318, align 4, !tbaa !11
  br label %319

319:                                              ; preds = %11, %316
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
