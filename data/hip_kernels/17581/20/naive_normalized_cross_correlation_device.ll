; ModuleID = '../data/hip_kernels/17581/20/main.cu'
source_filename = "../data/hip_kernels/17581/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z34naive_normalized_cross_correlationPfPhS0_iiiiiiif(float addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = mul nsw i32 %28, %4
  %30 = add nsw i32 %29, %20
  %31 = icmp slt i32 %20, %4
  %32 = icmp slt i32 %28, %3
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %312

34:                                               ; preds = %11
  %35 = sub i32 0, %5
  %36 = icmp slt i32 %5, 0
  br i1 %36, label %48, label %37

37:                                               ; preds = %34
  %38 = sub i32 0, %7
  %39 = icmp slt i32 %7, 0
  %40 = add nsw i32 %4, -1
  %41 = add nsw i32 %3, -1
  %42 = tail call i32 @llvm.abs.i32(i32 %7, i1 false)
  %43 = add i32 %42, %7
  %44 = add i32 %43, 1
  %45 = and i32 %44, 7
  %46 = icmp eq i32 %45, 0
  %47 = icmp ult i32 %43, 7
  br label %64

48:                                               ; preds = %92, %34
  %49 = phi float [ 0.000000e+00, %34 ], [ %93, %92 ]
  %50 = sitofp i32 %9 to float
  %51 = fdiv contract float %49, %50
  br i1 %36, label %180, label %52

52:                                               ; preds = %48
  %53 = icmp slt i32 %7, 0
  %54 = add nsw i32 %4, -1
  %55 = add nsw i32 %3, -1
  %56 = tail call i32 @llvm.abs.i32(i32 %7, i1 false)
  %57 = add i32 %56, %7
  %58 = and i32 %57, 1
  %59 = icmp eq i32 %58, 0
  %60 = sub i32 %20, %7
  %61 = tail call i32 @llvm.smax.i32(i32 %60, i32 0)
  %62 = tail call i32 @llvm.smin.i32(i32 %54, i32 %61)
  %63 = icmp eq i32 %57, 0
  br label %187

64:                                               ; preds = %37, %92
  %65 = phi float [ 0.000000e+00, %37 ], [ %93, %92 ]
  %66 = phi i32 [ %35, %37 ], [ %94, %92 ]
  br i1 %39, label %92, label %67

67:                                               ; preds = %64
  %68 = add nsw i32 %66, %28
  %69 = tail call i32 @llvm.smax.i32(i32 %68, i32 0)
  %70 = tail call i32 @llvm.smin.i32(i32 %41, i32 %69)
  %71 = mul nsw i32 %70, %4
  br i1 %46, label %88, label %72

72:                                               ; preds = %67, %72
  %73 = phi float [ %84, %72 ], [ %65, %67 ]
  %74 = phi i32 [ %85, %72 ], [ %38, %67 ]
  %75 = phi i32 [ %86, %72 ], [ 0, %67 ]
  %76 = add nsw i32 %74, %20
  %77 = tail call i32 @llvm.smax.i32(i32 %76, i32 0)
  %78 = tail call i32 @llvm.smin.i32(i32 %40, i32 %77)
  %79 = add nsw i32 %78, %71
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !5
  %83 = uitofp i8 %82 to float
  %84 = fadd contract float %73, %83
  %85 = add i32 %74, 1
  %86 = add i32 %75, 1
  %87 = icmp eq i32 %86, %45
  br i1 %87, label %88, label %72, !llvm.loop !10

88:                                               ; preds = %72, %67
  %89 = phi float [ undef, %67 ], [ %84, %72 ]
  %90 = phi float [ %65, %67 ], [ %84, %72 ]
  %91 = phi i32 [ %38, %67 ], [ %85, %72 ]
  br i1 %47, label %92, label %96

92:                                               ; preds = %88, %96, %64
  %93 = phi float [ %65, %64 ], [ %89, %88 ], [ %177, %96 ]
  %94 = add i32 %66, 1
  %95 = icmp eq i32 %66, %5
  br i1 %95, label %48, label %64, !llvm.loop !12

96:                                               ; preds = %88, %96
  %97 = phi float [ %177, %96 ], [ %90, %88 ]
  %98 = phi i32 [ %178, %96 ], [ %91, %88 ]
  %99 = add nsw i32 %98, %20
  %100 = tail call i32 @llvm.smax.i32(i32 %99, i32 0)
  %101 = tail call i32 @llvm.smin.i32(i32 %40, i32 %100)
  %102 = add nsw i32 %101, %71
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %103
  %105 = load i8, i8 addrspace(1)* %104, align 1, !tbaa !7, !amdgpu.noclobber !5
  %106 = uitofp i8 %105 to float
  %107 = fadd contract float %97, %106
  %108 = add i32 %98, 1
  %109 = add nsw i32 %108, %20
  %110 = tail call i32 @llvm.smax.i32(i32 %109, i32 0)
  %111 = tail call i32 @llvm.smin.i32(i32 %40, i32 %110)
  %112 = add nsw i32 %111, %71
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %113
  %115 = load i8, i8 addrspace(1)* %114, align 1, !tbaa !7, !amdgpu.noclobber !5
  %116 = uitofp i8 %115 to float
  %117 = fadd contract float %107, %116
  %118 = add i32 %98, 2
  %119 = add nsw i32 %118, %20
  %120 = tail call i32 @llvm.smax.i32(i32 %119, i32 0)
  %121 = tail call i32 @llvm.smin.i32(i32 %40, i32 %120)
  %122 = add nsw i32 %121, %71
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %123
  %125 = load i8, i8 addrspace(1)* %124, align 1, !tbaa !7, !amdgpu.noclobber !5
  %126 = uitofp i8 %125 to float
  %127 = fadd contract float %117, %126
  %128 = add i32 %98, 3
  %129 = add nsw i32 %128, %20
  %130 = tail call i32 @llvm.smax.i32(i32 %129, i32 0)
  %131 = tail call i32 @llvm.smin.i32(i32 %40, i32 %130)
  %132 = add nsw i32 %131, %71
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %133
  %135 = load i8, i8 addrspace(1)* %134, align 1, !tbaa !7, !amdgpu.noclobber !5
  %136 = uitofp i8 %135 to float
  %137 = fadd contract float %127, %136
  %138 = add i32 %98, 4
  %139 = add nsw i32 %138, %20
  %140 = tail call i32 @llvm.smax.i32(i32 %139, i32 0)
  %141 = tail call i32 @llvm.smin.i32(i32 %40, i32 %140)
  %142 = add nsw i32 %141, %71
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %143
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !7, !amdgpu.noclobber !5
  %146 = uitofp i8 %145 to float
  %147 = fadd contract float %137, %146
  %148 = add i32 %98, 5
  %149 = add nsw i32 %148, %20
  %150 = tail call i32 @llvm.smax.i32(i32 %149, i32 0)
  %151 = tail call i32 @llvm.smin.i32(i32 %40, i32 %150)
  %152 = add nsw i32 %151, %71
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %153
  %155 = load i8, i8 addrspace(1)* %154, align 1, !tbaa !7, !amdgpu.noclobber !5
  %156 = uitofp i8 %155 to float
  %157 = fadd contract float %147, %156
  %158 = add i32 %98, 6
  %159 = add nsw i32 %158, %20
  %160 = tail call i32 @llvm.smax.i32(i32 %159, i32 0)
  %161 = tail call i32 @llvm.smin.i32(i32 %40, i32 %160)
  %162 = add nsw i32 %161, %71
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %163
  %165 = load i8, i8 addrspace(1)* %164, align 1, !tbaa !7, !amdgpu.noclobber !5
  %166 = uitofp i8 %165 to float
  %167 = fadd contract float %157, %166
  %168 = add i32 %98, 7
  %169 = add nsw i32 %168, %20
  %170 = tail call i32 @llvm.smax.i32(i32 %169, i32 0)
  %171 = tail call i32 @llvm.smin.i32(i32 %40, i32 %170)
  %172 = add nsw i32 %171, %71
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %173
  %175 = load i8, i8 addrspace(1)* %174, align 1, !tbaa !7, !amdgpu.noclobber !5
  %176 = uitofp i8 %175 to float
  %177 = fadd contract float %167, %176
  %178 = add i32 %98, 8
  %179 = icmp eq i32 %168, %42
  br i1 %179, label %92, label %96, !llvm.loop !14

180:                                              ; preds = %228, %48
  %181 = phi float [ 0.000000e+00, %48 ], [ %229, %228 ]
  %182 = phi float [ 0.000000e+00, %48 ], [ %230, %228 ]
  %183 = phi float [ 0.000000e+00, %48 ], [ %231, %228 ]
  %184 = fcmp contract une float %182, 0.000000e+00
  %185 = fcmp contract une float %181, 0.000000e+00
  %186 = select i1 %184, i1 %185, i1 false
  br i1 %186, label %284, label %308

187:                                              ; preds = %52, %228
  %188 = phi float [ 0.000000e+00, %52 ], [ %231, %228 ]
  %189 = phi float [ 0.000000e+00, %52 ], [ %230, %228 ]
  %190 = phi float [ 0.000000e+00, %52 ], [ %229, %228 ]
  %191 = phi i32 [ %35, %52 ], [ %232, %228 ]
  br i1 %53, label %228, label %192

192:                                              ; preds = %187
  %193 = add nsw i32 %191, %28
  %194 = tail call i32 @llvm.smax.i32(i32 %193, i32 0)
  %195 = tail call i32 @llvm.smin.i32(i32 %55, i32 %194)
  %196 = mul nsw i32 %195, %4
  %197 = add nsw i32 %191, %5
  %198 = mul nsw i32 %197, %8
  %199 = add i32 %198, %7
  br i1 %59, label %200, label %218

200:                                              ; preds = %192
  %201 = add nsw i32 %62, %196
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %202
  %204 = load i8, i8 addrspace(1)* %203, align 1, !tbaa !7, !amdgpu.noclobber !5
  %205 = uitofp i8 %204 to float
  %206 = fsub contract float %205, %51
  %207 = sext i32 %198 to i64
  %208 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %207
  %209 = load i8, i8 addrspace(1)* %208, align 1, !tbaa !7, !amdgpu.noclobber !5
  %210 = uitofp i8 %209 to float
  %211 = fsub contract float %210, %10
  %212 = fmul contract float %211, %205
  %213 = fmul contract float %206, %206
  %214 = fmul contract float %211, %211
  %215 = fadd contract float %188, %212
  %216 = fadd contract float %189, %213
  %217 = fadd contract float %190, %214
  br label %218

218:                                              ; preds = %200, %192
  %219 = phi float [ undef, %192 ], [ %215, %200 ]
  %220 = phi float [ undef, %192 ], [ %216, %200 ]
  %221 = phi float [ undef, %192 ], [ %217, %200 ]
  %222 = phi float [ %188, %192 ], [ %215, %200 ]
  %223 = phi float [ %189, %192 ], [ %216, %200 ]
  %224 = phi float [ %190, %192 ], [ %217, %200 ]
  %225 = phi i32 [ 0, %192 ], [ 1, %200 ]
  br i1 %63, label %228, label %226

226:                                              ; preds = %218
  %227 = sub i32 %225, %7
  br label %234

228:                                              ; preds = %218, %234, %187
  %229 = phi float [ %190, %187 ], [ %221, %218 ], [ %281, %234 ]
  %230 = phi float [ %189, %187 ], [ %220, %218 ], [ %280, %234 ]
  %231 = phi float [ %188, %187 ], [ %219, %218 ], [ %279, %234 ]
  %232 = add i32 %191, 1
  %233 = icmp eq i32 %191, %5
  br i1 %233, label %180, label %187, !llvm.loop !15

234:                                              ; preds = %234, %226
  %235 = phi float [ %222, %226 ], [ %279, %234 ]
  %236 = phi float [ %223, %226 ], [ %280, %234 ]
  %237 = phi float [ %224, %226 ], [ %281, %234 ]
  %238 = phi i32 [ %227, %226 ], [ %282, %234 ]
  %239 = add nsw i32 %238, %20
  %240 = tail call i32 @llvm.smax.i32(i32 %239, i32 0)
  %241 = tail call i32 @llvm.smin.i32(i32 %54, i32 %240)
  %242 = add nsw i32 %241, %196
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %243
  %245 = load i8, i8 addrspace(1)* %244, align 1, !tbaa !7, !amdgpu.noclobber !5
  %246 = uitofp i8 %245 to float
  %247 = fsub contract float %246, %51
  %248 = add i32 %199, %238
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %249
  %251 = load i8, i8 addrspace(1)* %250, align 1, !tbaa !7, !amdgpu.noclobber !5
  %252 = uitofp i8 %251 to float
  %253 = fsub contract float %252, %10
  %254 = fmul contract float %253, %246
  %255 = fmul contract float %247, %247
  %256 = fmul contract float %253, %253
  %257 = fadd contract float %235, %254
  %258 = fadd contract float %236, %255
  %259 = fadd contract float %237, %256
  %260 = add i32 %238, 1
  %261 = add nsw i32 %260, %20
  %262 = tail call i32 @llvm.smax.i32(i32 %261, i32 0)
  %263 = tail call i32 @llvm.smin.i32(i32 %54, i32 %262)
  %264 = add nsw i32 %263, %196
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %265
  %267 = load i8, i8 addrspace(1)* %266, align 1, !tbaa !7, !amdgpu.noclobber !5
  %268 = uitofp i8 %267 to float
  %269 = fsub contract float %268, %51
  %270 = add i32 %199, %260
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %271
  %273 = load i8, i8 addrspace(1)* %272, align 1, !tbaa !7, !amdgpu.noclobber !5
  %274 = uitofp i8 %273 to float
  %275 = fsub contract float %274, %10
  %276 = fmul contract float %275, %268
  %277 = fmul contract float %269, %269
  %278 = fmul contract float %275, %275
  %279 = fadd contract float %257, %276
  %280 = fadd contract float %258, %277
  %281 = fadd contract float %259, %278
  %282 = add i32 %238, 2
  %283 = icmp eq i32 %260, %56
  br i1 %283, label %228, label %234, !llvm.loop !16

284:                                              ; preds = %180
  %285 = fmul contract float %181, %182
  %286 = fcmp olt float %285, 0x39F0000000000000
  %287 = select i1 %286, float 0x41F0000000000000, float 1.000000e+00
  %288 = fmul float %285, %287
  %289 = tail call float @llvm.sqrt.f32(float %288)
  %290 = bitcast float %289 to i32
  %291 = add nsw i32 %290, -1
  %292 = bitcast i32 %291 to float
  %293 = add nsw i32 %290, 1
  %294 = bitcast i32 %293 to float
  %295 = tail call i1 @llvm.amdgcn.class.f32(float %288, i32 608)
  %296 = select i1 %286, float 0x3EF0000000000000, float 1.000000e+00
  %297 = fneg float %294
  %298 = tail call float @llvm.fma.f32(float %297, float %289, float %288)
  %299 = fcmp ogt float %298, 0.000000e+00
  %300 = fneg float %292
  %301 = tail call float @llvm.fma.f32(float %300, float %289, float %288)
  %302 = fcmp ole float %301, 0.000000e+00
  %303 = select i1 %302, float %292, float %289
  %304 = select i1 %299, float %294, float %303
  %305 = fmul float %296, %304
  %306 = select i1 %295, float %288, float %305
  %307 = fdiv contract float %183, %306
  br label %308

308:                                              ; preds = %284, %180
  %309 = phi float [ %307, %284 ], [ 0.000000e+00, %180 ]
  %310 = sext i32 %30 to i64
  %311 = getelementptr inbounds float, float addrspace(1)* %0, i64 %310
  store float %309, float addrspace(1)* %311, align 4, !tbaa !17
  br label %312

312:                                              ; preds = %308, %11
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !13}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !8, i64 0}
