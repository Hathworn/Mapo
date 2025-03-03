; ModuleID = '../data/hip_kernels/6375/45/main.cu'
source_filename = "../data/hip_kernels/6375/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28forward_softmax_layer_kerneliiPffS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = add i32 %21, %6
  %23 = mul i32 %22, %15
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %1
  br i1 %26, label %27, label %322

27:                                               ; preds = %5
  %28 = icmp sgt i32 %0, 0
  br i1 %28, label %29, label %55

29:                                               ; preds = %27
  %30 = mul nsw i32 %25, %0
  %31 = and i32 %0, 7
  %32 = icmp ult i32 %0, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = and i32 %0, -8
  br label %64

35:                                               ; preds = %64, %29
  %36 = phi float [ undef, %29 ], [ %138, %64 ]
  %37 = phi float [ 0xFFF0000000000000, %29 ], [ %138, %64 ]
  %38 = phi i32 [ 0, %29 ], [ %139, %64 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %55, label %40

40:                                               ; preds = %35, %40
  %41 = phi float [ %51, %40 ], [ %37, %35 ]
  %42 = phi i32 [ %52, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %53, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %42, %30
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !14
  %48 = fptosi float %47 to i32
  %49 = sitofp i32 %48 to float
  %50 = fcmp contract olt float %41, %49
  %51 = select contract i1 %50, float %49, float %41
  %52 = add nuw nsw i32 %42, 1
  %53 = add i32 %43, 1
  %54 = icmp eq i32 %53, %31
  br i1 %54, label %55, label %40, !llvm.loop !20

55:                                               ; preds = %35, %40, %27
  %56 = phi float [ 0xFFF0000000000000, %27 ], [ %36, %35 ], [ %51, %40 ]
  br i1 %28, label %57, label %219

57:                                               ; preds = %55
  %58 = mul nsw i32 %25, %0
  %59 = fdiv contract float %56, %3
  %60 = and i32 %0, 1
  %61 = icmp eq i32 %0, 1
  br i1 %61, label %192, label %62

62:                                               ; preds = %57
  %63 = and i32 %0, -2
  br label %142

64:                                               ; preds = %64, %33
  %65 = phi float [ 0xFFF0000000000000, %33 ], [ %138, %64 ]
  %66 = phi i32 [ 0, %33 ], [ %139, %64 ]
  %67 = phi i32 [ 0, %33 ], [ %140, %64 ]
  %68 = add nsw i32 %66, %30
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16, !amdgpu.noclobber !14
  %72 = fptosi float %71 to i32
  %73 = sitofp i32 %72 to float
  %74 = fcmp contract olt float %65, %73
  %75 = select contract i1 %74, float %73, float %65
  %76 = or i32 %66, 1
  %77 = add nsw i32 %76, %30
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16, !amdgpu.noclobber !14
  %81 = fptosi float %80 to i32
  %82 = sitofp i32 %81 to float
  %83 = fcmp contract olt float %75, %82
  %84 = select contract i1 %83, float %82, float %75
  %85 = or i32 %66, 2
  %86 = add nsw i32 %85, %30
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16, !amdgpu.noclobber !14
  %90 = fptosi float %89 to i32
  %91 = sitofp i32 %90 to float
  %92 = fcmp contract olt float %84, %91
  %93 = select contract i1 %92, float %91, float %84
  %94 = or i32 %66, 3
  %95 = add nsw i32 %94, %30
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16, !amdgpu.noclobber !14
  %99 = fptosi float %98 to i32
  %100 = sitofp i32 %99 to float
  %101 = fcmp contract olt float %93, %100
  %102 = select contract i1 %101, float %100, float %93
  %103 = or i32 %66, 4
  %104 = add nsw i32 %103, %30
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16, !amdgpu.noclobber !14
  %108 = fptosi float %107 to i32
  %109 = sitofp i32 %108 to float
  %110 = fcmp contract olt float %102, %109
  %111 = select contract i1 %110, float %109, float %102
  %112 = or i32 %66, 5
  %113 = add nsw i32 %112, %30
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16, !amdgpu.noclobber !14
  %117 = fptosi float %116 to i32
  %118 = sitofp i32 %117 to float
  %119 = fcmp contract olt float %111, %118
  %120 = select contract i1 %119, float %118, float %111
  %121 = or i32 %66, 6
  %122 = add nsw i32 %121, %30
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16, !amdgpu.noclobber !14
  %126 = fptosi float %125 to i32
  %127 = sitofp i32 %126 to float
  %128 = fcmp contract olt float %120, %127
  %129 = select contract i1 %128, float %127, float %120
  %130 = or i32 %66, 7
  %131 = add nsw i32 %130, %30
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %2, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16, !amdgpu.noclobber !14
  %135 = fptosi float %134 to i32
  %136 = sitofp i32 %135 to float
  %137 = fcmp contract olt float %129, %136
  %138 = select contract i1 %137, float %136, float %129
  %139 = add nuw nsw i32 %66, 8
  %140 = add i32 %67, 8
  %141 = icmp eq i32 %140, %34
  br i1 %141, label %35, label %64, !llvm.loop !22

142:                                              ; preds = %142, %62
  %143 = phi float [ 0.000000e+00, %62 ], [ %188, %142 ]
  %144 = phi i32 [ 0, %62 ], [ %189, %142 ]
  %145 = phi i32 [ 0, %62 ], [ %190, %142 ]
  %146 = add nsw i32 %144, %58
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %2, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !16, !amdgpu.noclobber !14
  %150 = fdiv contract float %149, %3
  %151 = fsub contract float %150, %59
  %152 = fmul float %151, 0x3FF7154760000000
  %153 = tail call float @llvm.rint.f32(float %152)
  %154 = fcmp ogt float %151, 0x40562E4300000000
  %155 = fcmp olt float %151, 0xC059D1DA00000000
  %156 = fneg float %152
  %157 = tail call float @llvm.fma.f32(float %151, float 0x3FF7154760000000, float %156)
  %158 = tail call float @llvm.fma.f32(float %151, float 0x3E54AE0BE0000000, float %157)
  %159 = fsub float %152, %153
  %160 = fadd float %158, %159
  %161 = tail call float @llvm.exp2.f32(float %160)
  %162 = fptosi float %153 to i32
  %163 = tail call float @llvm.amdgcn.ldexp.f32(float %161, i32 %162)
  %164 = select i1 %155, float 0.000000e+00, float %163
  %165 = select i1 %154, float 0x7FF0000000000000, float %164
  %166 = fadd contract float %143, %165
  %167 = or i32 %144, 1
  %168 = add nsw i32 %167, %58
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %2, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !16, !amdgpu.noclobber !14
  %172 = fdiv contract float %171, %3
  %173 = fsub contract float %172, %59
  %174 = fmul float %173, 0x3FF7154760000000
  %175 = tail call float @llvm.rint.f32(float %174)
  %176 = fcmp ogt float %173, 0x40562E4300000000
  %177 = fcmp olt float %173, 0xC059D1DA00000000
  %178 = fneg float %174
  %179 = tail call float @llvm.fma.f32(float %173, float 0x3FF7154760000000, float %178)
  %180 = tail call float @llvm.fma.f32(float %173, float 0x3E54AE0BE0000000, float %179)
  %181 = fsub float %174, %175
  %182 = fadd float %180, %181
  %183 = tail call float @llvm.exp2.f32(float %182)
  %184 = fptosi float %175 to i32
  %185 = tail call float @llvm.amdgcn.ldexp.f32(float %183, i32 %184)
  %186 = select i1 %177, float 0.000000e+00, float %185
  %187 = select i1 %176, float 0x7FF0000000000000, float %186
  %188 = fadd contract float %166, %187
  %189 = add nuw nsw i32 %144, 2
  %190 = add i32 %145, 2
  %191 = icmp eq i32 %190, %63
  br i1 %191, label %192, label %142, !llvm.loop !24

192:                                              ; preds = %142, %57
  %193 = phi float [ undef, %57 ], [ %188, %142 ]
  %194 = phi float [ 0.000000e+00, %57 ], [ %188, %142 ]
  %195 = phi i32 [ 0, %57 ], [ %189, %142 ]
  %196 = icmp eq i32 %60, 0
  br i1 %196, label %219, label %197

197:                                              ; preds = %192
  %198 = add nsw i32 %195, %58
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %2, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !16, !amdgpu.noclobber !14
  %202 = fdiv contract float %201, %3
  %203 = fsub contract float %202, %59
  %204 = fmul float %203, 0x3FF7154760000000
  %205 = tail call float @llvm.rint.f32(float %204)
  %206 = fcmp ogt float %203, 0x40562E4300000000
  %207 = fcmp olt float %203, 0xC059D1DA00000000
  %208 = fneg float %204
  %209 = tail call float @llvm.fma.f32(float %203, float 0x3FF7154760000000, float %208)
  %210 = tail call float @llvm.fma.f32(float %203, float 0x3E54AE0BE0000000, float %209)
  %211 = fsub float %204, %205
  %212 = fadd float %210, %211
  %213 = tail call float @llvm.exp2.f32(float %212)
  %214 = fptosi float %205 to i32
  %215 = tail call float @llvm.amdgcn.ldexp.f32(float %213, i32 %214)
  %216 = select i1 %207, float 0.000000e+00, float %215
  %217 = select i1 %206, float 0x7FF0000000000000, float %216
  %218 = fadd contract float %194, %217
  br label %219

219:                                              ; preds = %197, %192, %55
  %220 = phi float [ 0.000000e+00, %55 ], [ %193, %192 ], [ %218, %197 ]
  %221 = fcmp contract une float %220, 0.000000e+00
  br i1 %221, label %222, label %238

222:                                              ; preds = %219
  %223 = fdiv contract float %56, %3
  %224 = tail call i1 @llvm.amdgcn.class.f32(float %220, i32 144)
  %225 = select i1 %224, float 0x41F0000000000000, float 1.000000e+00
  %226 = fmul float %220, %225
  %227 = tail call float @llvm.log2.f32(float %226)
  %228 = fmul float %227, 0x3FE62E42E0000000
  %229 = tail call i1 @llvm.amdgcn.class.f32(float %227, i32 519)
  %230 = fneg float %228
  %231 = tail call float @llvm.fma.f32(float %227, float 0x3FE62E42E0000000, float %230)
  %232 = tail call float @llvm.fma.f32(float %227, float 0x3E6EFA39E0000000, float %231)
  %233 = fadd float %228, %232
  %234 = select i1 %229, float %227, float %233
  %235 = select i1 %224, float 0x40362E4300000000, float 0.000000e+00
  %236 = fsub float %234, %235
  %237 = fadd contract float %223, %236
  br label %240

238:                                              ; preds = %219
  %239 = fadd contract float %56, -1.000000e+02
  br label %240

240:                                              ; preds = %238, %222
  %241 = phi contract float [ %237, %222 ], [ %239, %238 ]
  br i1 %28, label %242, label %322

242:                                              ; preds = %240
  %243 = mul nsw i32 %25, %0
  %244 = and i32 %0, 1
  %245 = icmp eq i32 %0, 1
  br i1 %245, label %297, label %246

246:                                              ; preds = %242
  %247 = and i32 %0, -2
  br label %248

248:                                              ; preds = %248, %246
  %249 = phi i32 [ 0, %246 ], [ %294, %248 ]
  %250 = phi i32 [ 0, %246 ], [ %295, %248 ]
  %251 = add nsw i32 %249, %243
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %2, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !16
  %255 = fdiv contract float %254, %3
  %256 = fsub contract float %255, %241
  %257 = fmul float %256, 0x3FF7154760000000
  %258 = tail call float @llvm.rint.f32(float %257)
  %259 = fcmp ogt float %256, 0x40562E4300000000
  %260 = fcmp olt float %256, 0xC059D1DA00000000
  %261 = fneg float %257
  %262 = tail call float @llvm.fma.f32(float %256, float 0x3FF7154760000000, float %261)
  %263 = tail call float @llvm.fma.f32(float %256, float 0x3E54AE0BE0000000, float %262)
  %264 = fsub float %257, %258
  %265 = fadd float %263, %264
  %266 = tail call float @llvm.exp2.f32(float %265)
  %267 = fptosi float %258 to i32
  %268 = tail call float @llvm.amdgcn.ldexp.f32(float %266, i32 %267)
  %269 = select i1 %260, float 0.000000e+00, float %268
  %270 = select i1 %259, float 0x7FF0000000000000, float %269
  %271 = getelementptr inbounds float, float addrspace(1)* %4, i64 %252
  store float %270, float addrspace(1)* %271, align 4, !tbaa !16
  %272 = or i32 %249, 1
  %273 = add nsw i32 %272, %243
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds float, float addrspace(1)* %2, i64 %274
  %276 = load float, float addrspace(1)* %275, align 4, !tbaa !16
  %277 = fdiv contract float %276, %3
  %278 = fsub contract float %277, %241
  %279 = fmul float %278, 0x3FF7154760000000
  %280 = tail call float @llvm.rint.f32(float %279)
  %281 = fcmp ogt float %278, 0x40562E4300000000
  %282 = fcmp olt float %278, 0xC059D1DA00000000
  %283 = fneg float %279
  %284 = tail call float @llvm.fma.f32(float %278, float 0x3FF7154760000000, float %283)
  %285 = tail call float @llvm.fma.f32(float %278, float 0x3E54AE0BE0000000, float %284)
  %286 = fsub float %279, %280
  %287 = fadd float %285, %286
  %288 = tail call float @llvm.exp2.f32(float %287)
  %289 = fptosi float %280 to i32
  %290 = tail call float @llvm.amdgcn.ldexp.f32(float %288, i32 %289)
  %291 = select i1 %282, float 0.000000e+00, float %290
  %292 = select i1 %281, float 0x7FF0000000000000, float %291
  %293 = getelementptr inbounds float, float addrspace(1)* %4, i64 %274
  store float %292, float addrspace(1)* %293, align 4, !tbaa !16
  %294 = add nuw nsw i32 %249, 2
  %295 = add i32 %250, 2
  %296 = icmp eq i32 %295, %247
  br i1 %296, label %297, label %248, !llvm.loop !25

297:                                              ; preds = %248, %242
  %298 = phi i32 [ 0, %242 ], [ %294, %248 ]
  %299 = icmp eq i32 %244, 0
  br i1 %299, label %322, label %300

300:                                              ; preds = %297
  %301 = add nsw i32 %298, %243
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %2, i64 %302
  %304 = load float, float addrspace(1)* %303, align 4, !tbaa !16
  %305 = fdiv contract float %304, %3
  %306 = fsub contract float %305, %241
  %307 = fmul float %306, 0x3FF7154760000000
  %308 = tail call float @llvm.rint.f32(float %307)
  %309 = fcmp ogt float %306, 0x40562E4300000000
  %310 = fcmp olt float %306, 0xC059D1DA00000000
  %311 = fneg float %307
  %312 = tail call float @llvm.fma.f32(float %306, float 0x3FF7154760000000, float %311)
  %313 = tail call float @llvm.fma.f32(float %306, float 0x3E54AE0BE0000000, float %312)
  %314 = fsub float %307, %308
  %315 = fadd float %313, %314
  %316 = tail call float @llvm.exp2.f32(float %315)
  %317 = fptosi float %308 to i32
  %318 = tail call float @llvm.amdgcn.ldexp.f32(float %316, i32 %317)
  %319 = select i1 %310, float 0.000000e+00, float %318
  %320 = select i1 %309, float 0x7FF0000000000000, float %319
  %321 = getelementptr inbounds float, float addrspace(1)* %4, i64 %302
  store float %320, float addrspace(1)* %321, align 4, !tbaa !16
  br label %322

322:                                              ; preds = %300, %297, %240, %5
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
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
