; ModuleID = '../data/hip_kernels/399/4/main.cu'
source_filename = "../data/hip_kernels/399/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4nmfhPdiiiS_S_S_(double addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
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
  %25 = icmp slt i32 %16, %3
  %26 = icmp slt i32 %24, %2
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %333

28:                                               ; preds = %7
  %29 = icmp sgt i32 %1, 0
  br i1 %29, label %30, label %59

30:                                               ; preds = %28
  %31 = and i32 %1, 7
  %32 = icmp ult i32 %1, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %30
  %34 = and i32 %1, -8
  br label %73

35:                                               ; preds = %73, %30
  %36 = phi double [ undef, %30 ], [ %179, %73 ]
  %37 = phi i32 [ 0, %30 ], [ %180, %73 ]
  %38 = phi double [ 0.000000e+00, %30 ], [ %179, %73 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %59, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %56, %40 ], [ %37, %35 ]
  %42 = phi double [ %55, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %57, %40 ], [ 0, %35 ]
  %44 = mul nsw i32 %41, %3
  %45 = add nsw i32 %44, %16
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %4, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7, !amdgpu.noclobber !5
  %49 = mul nsw i32 %41, %2
  %50 = add nsw i32 %49, %24
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %0, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !5
  %54 = fmul contract double %48, %53
  %55 = fadd contract double %42, %54
  %56 = add nuw nsw i32 %41, 1
  %57 = add i32 %43, 1
  %58 = icmp eq i32 %57, %31
  br i1 %58, label %59, label %40, !llvm.loop !11

59:                                               ; preds = %35, %40, %28
  %60 = phi double [ 0.000000e+00, %28 ], [ %36, %35 ], [ %55, %40 ]
  %61 = mul nsw i32 %16, %2
  %62 = add nsw i32 %61, %24
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %5, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7, !amdgpu.noclobber !5
  %66 = fmul contract double %60, %65
  %67 = icmp sgt i32 %3, 0
  br i1 %67, label %68, label %192

68:                                               ; preds = %59
  %69 = and i32 %1, 7
  %70 = icmp ult i32 %1, 8
  %71 = and i32 %1, -8
  %72 = icmp eq i32 %69, 0
  br label %183

73:                                               ; preds = %73, %33
  %74 = phi i32 [ 0, %33 ], [ %180, %73 ]
  %75 = phi double [ 0.000000e+00, %33 ], [ %179, %73 ]
  %76 = phi i32 [ 0, %33 ], [ %181, %73 ]
  %77 = mul nsw i32 %74, %3
  %78 = add nsw i32 %77, %16
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %4, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7, !amdgpu.noclobber !5
  %82 = mul nsw i32 %74, %2
  %83 = add nsw i32 %82, %24
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7, !amdgpu.noclobber !5
  %87 = fmul contract double %81, %86
  %88 = fadd contract double %75, %87
  %89 = or i32 %74, 1
  %90 = mul nsw i32 %89, %3
  %91 = add nsw i32 %90, %16
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %4, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7, !amdgpu.noclobber !5
  %95 = mul nsw i32 %89, %2
  %96 = add nsw i32 %95, %24
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %0, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7, !amdgpu.noclobber !5
  %100 = fmul contract double %94, %99
  %101 = fadd contract double %88, %100
  %102 = or i32 %74, 2
  %103 = mul nsw i32 %102, %3
  %104 = add nsw i32 %103, %16
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %4, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !7, !amdgpu.noclobber !5
  %108 = mul nsw i32 %102, %2
  %109 = add nsw i32 %108, %24
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %0, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !7, !amdgpu.noclobber !5
  %113 = fmul contract double %107, %112
  %114 = fadd contract double %101, %113
  %115 = or i32 %74, 3
  %116 = mul nsw i32 %115, %3
  %117 = add nsw i32 %116, %16
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %4, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !7, !amdgpu.noclobber !5
  %121 = mul nsw i32 %115, %2
  %122 = add nsw i32 %121, %24
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %0, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7, !amdgpu.noclobber !5
  %126 = fmul contract double %120, %125
  %127 = fadd contract double %114, %126
  %128 = or i32 %74, 4
  %129 = mul nsw i32 %128, %3
  %130 = add nsw i32 %129, %16
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds double, double addrspace(1)* %4, i64 %131
  %133 = load double, double addrspace(1)* %132, align 8, !tbaa !7, !amdgpu.noclobber !5
  %134 = mul nsw i32 %128, %2
  %135 = add nsw i32 %134, %24
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds double, double addrspace(1)* %0, i64 %136
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !7, !amdgpu.noclobber !5
  %139 = fmul contract double %133, %138
  %140 = fadd contract double %127, %139
  %141 = or i32 %74, 5
  %142 = mul nsw i32 %141, %3
  %143 = add nsw i32 %142, %16
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double, double addrspace(1)* %4, i64 %144
  %146 = load double, double addrspace(1)* %145, align 8, !tbaa !7, !amdgpu.noclobber !5
  %147 = mul nsw i32 %141, %2
  %148 = add nsw i32 %147, %24
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds double, double addrspace(1)* %0, i64 %149
  %151 = load double, double addrspace(1)* %150, align 8, !tbaa !7, !amdgpu.noclobber !5
  %152 = fmul contract double %146, %151
  %153 = fadd contract double %140, %152
  %154 = or i32 %74, 6
  %155 = mul nsw i32 %154, %3
  %156 = add nsw i32 %155, %16
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds double, double addrspace(1)* %4, i64 %157
  %159 = load double, double addrspace(1)* %158, align 8, !tbaa !7, !amdgpu.noclobber !5
  %160 = mul nsw i32 %154, %2
  %161 = add nsw i32 %160, %24
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds double, double addrspace(1)* %0, i64 %162
  %164 = load double, double addrspace(1)* %163, align 8, !tbaa !7, !amdgpu.noclobber !5
  %165 = fmul contract double %159, %164
  %166 = fadd contract double %153, %165
  %167 = or i32 %74, 7
  %168 = mul nsw i32 %167, %3
  %169 = add nsw i32 %168, %16
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds double, double addrspace(1)* %4, i64 %170
  %172 = load double, double addrspace(1)* %171, align 8, !tbaa !7, !amdgpu.noclobber !5
  %173 = mul nsw i32 %167, %2
  %174 = add nsw i32 %173, %24
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds double, double addrspace(1)* %0, i64 %175
  %177 = load double, double addrspace(1)* %176, align 8, !tbaa !7, !amdgpu.noclobber !5
  %178 = fmul contract double %172, %177
  %179 = fadd contract double %166, %178
  %180 = add nuw nsw i32 %74, 8
  %181 = add i32 %76, 8
  %182 = icmp eq i32 %181, %34
  br i1 %182, label %35, label %73, !llvm.loop !13

183:                                              ; preds = %68, %219
  %184 = phi i32 [ %221, %219 ], [ 0, %68 ]
  %185 = phi double [ %220, %219 ], [ 0.000000e+00, %68 ]
  br i1 %29, label %186, label %219

186:                                              ; preds = %183
  %187 = mul nsw i32 %184, %2
  %188 = add nsw i32 %187, %24
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds double, double addrspace(1)* %5, i64 %189
  %191 = load double, double addrspace(1)* %190, align 8, !tbaa !7, !amdgpu.noclobber !5
  br i1 %70, label %196, label %223

192:                                              ; preds = %219, %59
  %193 = phi double [ 0.000000e+00, %59 ], [ %220, %219 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %194 = fdiv contract double %66, %193
  %195 = getelementptr inbounds double, double addrspace(1)* %6, i64 %63
  store double %194, double addrspace(1)* %195, align 8, !tbaa !7
  br label %333

196:                                              ; preds = %223, %186
  %197 = phi double [ undef, %186 ], [ %329, %223 ]
  %198 = phi i32 [ 0, %186 ], [ %330, %223 ]
  %199 = phi double [ %185, %186 ], [ %329, %223 ]
  br i1 %72, label %219, label %200

200:                                              ; preds = %196, %200
  %201 = phi i32 [ %216, %200 ], [ %198, %196 ]
  %202 = phi double [ %215, %200 ], [ %199, %196 ]
  %203 = phi i32 [ %217, %200 ], [ 0, %196 ]
  %204 = mul nsw i32 %201, %3
  %205 = add nsw i32 %204, %16
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds double, double addrspace(1)* %4, i64 %206
  %208 = load double, double addrspace(1)* %207, align 8, !tbaa !7, !amdgpu.noclobber !5
  %209 = add nsw i32 %204, %184
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds double, double addrspace(1)* %4, i64 %210
  %212 = load double, double addrspace(1)* %211, align 8, !tbaa !7, !amdgpu.noclobber !5
  %213 = fmul contract double %208, %212
  %214 = fmul contract double %213, %191
  %215 = fadd contract double %202, %214
  %216 = add nuw nsw i32 %201, 1
  %217 = add i32 %203, 1
  %218 = icmp eq i32 %217, %69
  br i1 %218, label %219, label %200, !llvm.loop !15

219:                                              ; preds = %196, %200, %183
  %220 = phi double [ %185, %183 ], [ %197, %196 ], [ %215, %200 ]
  %221 = add nuw nsw i32 %184, 1
  %222 = icmp eq i32 %221, %3
  br i1 %222, label %192, label %183, !llvm.loop !16

223:                                              ; preds = %186, %223
  %224 = phi i32 [ %330, %223 ], [ 0, %186 ]
  %225 = phi double [ %329, %223 ], [ %185, %186 ]
  %226 = phi i32 [ %331, %223 ], [ 0, %186 ]
  %227 = mul nsw i32 %224, %3
  %228 = add nsw i32 %227, %16
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds double, double addrspace(1)* %4, i64 %229
  %231 = load double, double addrspace(1)* %230, align 8, !tbaa !7, !amdgpu.noclobber !5
  %232 = add nsw i32 %227, %184
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds double, double addrspace(1)* %4, i64 %233
  %235 = load double, double addrspace(1)* %234, align 8, !tbaa !7, !amdgpu.noclobber !5
  %236 = fmul contract double %231, %235
  %237 = fmul contract double %236, %191
  %238 = fadd contract double %225, %237
  %239 = or i32 %224, 1
  %240 = mul nsw i32 %239, %3
  %241 = add nsw i32 %240, %16
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds double, double addrspace(1)* %4, i64 %242
  %244 = load double, double addrspace(1)* %243, align 8, !tbaa !7, !amdgpu.noclobber !5
  %245 = add nsw i32 %240, %184
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds double, double addrspace(1)* %4, i64 %246
  %248 = load double, double addrspace(1)* %247, align 8, !tbaa !7, !amdgpu.noclobber !5
  %249 = fmul contract double %244, %248
  %250 = fmul contract double %249, %191
  %251 = fadd contract double %238, %250
  %252 = or i32 %224, 2
  %253 = mul nsw i32 %252, %3
  %254 = add nsw i32 %253, %16
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds double, double addrspace(1)* %4, i64 %255
  %257 = load double, double addrspace(1)* %256, align 8, !tbaa !7, !amdgpu.noclobber !5
  %258 = add nsw i32 %253, %184
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds double, double addrspace(1)* %4, i64 %259
  %261 = load double, double addrspace(1)* %260, align 8, !tbaa !7, !amdgpu.noclobber !5
  %262 = fmul contract double %257, %261
  %263 = fmul contract double %262, %191
  %264 = fadd contract double %251, %263
  %265 = or i32 %224, 3
  %266 = mul nsw i32 %265, %3
  %267 = add nsw i32 %266, %16
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds double, double addrspace(1)* %4, i64 %268
  %270 = load double, double addrspace(1)* %269, align 8, !tbaa !7, !amdgpu.noclobber !5
  %271 = add nsw i32 %266, %184
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds double, double addrspace(1)* %4, i64 %272
  %274 = load double, double addrspace(1)* %273, align 8, !tbaa !7, !amdgpu.noclobber !5
  %275 = fmul contract double %270, %274
  %276 = fmul contract double %275, %191
  %277 = fadd contract double %264, %276
  %278 = or i32 %224, 4
  %279 = mul nsw i32 %278, %3
  %280 = add nsw i32 %279, %16
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds double, double addrspace(1)* %4, i64 %281
  %283 = load double, double addrspace(1)* %282, align 8, !tbaa !7, !amdgpu.noclobber !5
  %284 = add nsw i32 %279, %184
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds double, double addrspace(1)* %4, i64 %285
  %287 = load double, double addrspace(1)* %286, align 8, !tbaa !7, !amdgpu.noclobber !5
  %288 = fmul contract double %283, %287
  %289 = fmul contract double %288, %191
  %290 = fadd contract double %277, %289
  %291 = or i32 %224, 5
  %292 = mul nsw i32 %291, %3
  %293 = add nsw i32 %292, %16
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds double, double addrspace(1)* %4, i64 %294
  %296 = load double, double addrspace(1)* %295, align 8, !tbaa !7, !amdgpu.noclobber !5
  %297 = add nsw i32 %292, %184
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds double, double addrspace(1)* %4, i64 %298
  %300 = load double, double addrspace(1)* %299, align 8, !tbaa !7, !amdgpu.noclobber !5
  %301 = fmul contract double %296, %300
  %302 = fmul contract double %301, %191
  %303 = fadd contract double %290, %302
  %304 = or i32 %224, 6
  %305 = mul nsw i32 %304, %3
  %306 = add nsw i32 %305, %16
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds double, double addrspace(1)* %4, i64 %307
  %309 = load double, double addrspace(1)* %308, align 8, !tbaa !7, !amdgpu.noclobber !5
  %310 = add nsw i32 %305, %184
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds double, double addrspace(1)* %4, i64 %311
  %313 = load double, double addrspace(1)* %312, align 8, !tbaa !7, !amdgpu.noclobber !5
  %314 = fmul contract double %309, %313
  %315 = fmul contract double %314, %191
  %316 = fadd contract double %303, %315
  %317 = or i32 %224, 7
  %318 = mul nsw i32 %317, %3
  %319 = add nsw i32 %318, %16
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds double, double addrspace(1)* %4, i64 %320
  %322 = load double, double addrspace(1)* %321, align 8, !tbaa !7, !amdgpu.noclobber !5
  %323 = add nsw i32 %318, %184
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds double, double addrspace(1)* %4, i64 %324
  %326 = load double, double addrspace(1)* %325, align 8, !tbaa !7, !amdgpu.noclobber !5
  %327 = fmul contract double %322, %326
  %328 = fmul contract double %327, %191
  %329 = fadd contract double %316, %328
  %330 = add nuw nsw i32 %224, 8
  %331 = add i32 %226, 8
  %332 = icmp eq i32 %331, %71
  br i1 %332, label %196, label %223, !llvm.loop !17

333:                                              ; preds = %192, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
