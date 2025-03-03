; ModuleID = '../data/hip_kernels/1187/22/main.cu'
source_filename = "../data/hip_kernels/1187/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21lga_filtering_forwardiPKfS0_iiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %342

19:                                               ; preds = %8
  %20 = mul nsw i32 %4, %3
  %21 = shl nsw i32 %6, 1
  %22 = add nuw nsw i32 %21, 1
  %23 = mul nsw i32 %20, %5
  %24 = sdiv i32 %17, %23
  %25 = mul i32 %24, 3
  %26 = freeze i32 %17
  %27 = freeze i32 %20
  %28 = sdiv i32 %26, %27
  %29 = mul i32 %28, %27
  %30 = sub i32 %26, %29
  %31 = sdiv i32 %30, %4
  %32 = srem i32 %17, %4
  %33 = srem i32 %28, %5
  %34 = sub i32 0, %6
  %35 = icmp slt i32 %6, 0
  %36 = sext i32 %17 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %7, i64 %36
  %38 = tail call i32 @llvm.abs.i32(i32 %6, i1 false)
  br i1 %35, label %342, label %39

39:                                               ; preds = %19
  %40 = icmp sgt i32 %33, 0
  %41 = icmp sgt i32 %5, -1
  %42 = mul i32 %25, %22
  %43 = add i32 %38, %6
  %44 = add i32 %43, 1
  %45 = and i32 %44, 1
  %46 = icmp eq i32 %45, 0
  %47 = sub i32 %32, %6
  %48 = icmp sgt i32 %47, -1
  %49 = icmp slt i32 %47, %4
  %50 = sub i32 1, %6
  %51 = icmp eq i32 %43, 0
  br label %52

52:                                               ; preds = %39, %287
  %53 = phi i32 [ %34, %39 ], [ %288, %287 ]
  %54 = add nsw i32 %53, %31
  %55 = icmp sgt i32 %54, -1
  %56 = icmp slt i32 %54, %3
  %57 = mul nsw i32 %53, %4
  %58 = sub i32 %57, %20
  %59 = add i32 %53, %6
  %60 = add i32 %59, %42
  %61 = mul i32 %60, %22
  %62 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  br i1 %46, label %82, label %63

63:                                               ; preds = %52
  %64 = select i1 %55, i1 %48, i1 false
  %65 = select i1 %64, i1 %40, i1 false
  %66 = select i1 %65, i1 %56, i1 false
  %67 = select i1 %66, i1 %49, i1 false
  %68 = select i1 %67, i1 %41, i1 false
  %69 = sub i32 %58, %6
  %70 = select i1 %68, i32 %69, i32 0
  %71 = add nsw i32 %70, %17
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = mul i32 %61, %20
  %76 = add i32 %75, %30
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fmul contract float %74, %79
  %81 = fadd contract float %62, %80
  store float %81, float addrspace(1)* %37, align 4, !tbaa !7
  br label %82

82:                                               ; preds = %63, %52
  %83 = phi float [ %62, %52 ], [ %81, %63 ]
  %84 = phi i32 [ %34, %52 ], [ %50, %63 ]
  br i1 %51, label %287, label %290

85:                                               ; preds = %287
  br i1 %35, label %342, label %86

86:                                               ; preds = %85
  %87 = icmp sgt i32 %33, -1
  %88 = icmp sgt i32 %5, -1
  %89 = add i32 %25, 1
  %90 = mul i32 %89, %22
  %91 = and i32 %44, 1
  %92 = icmp eq i32 %91, 0
  %93 = sub i32 %32, %6
  %94 = icmp sgt i32 %93, -1
  %95 = icmp slt i32 %93, %4
  %96 = sub i32 1, %6
  %97 = icmp eq i32 %43, 0
  br label %98

98:                                               ; preds = %182, %86
  %99 = phi i32 [ %34, %86 ], [ %183, %182 ]
  %100 = add nsw i32 %99, %31
  %101 = icmp sgt i32 %100, -1
  %102 = icmp slt i32 %100, %3
  %103 = mul nsw i32 %99, %4
  %104 = add i32 %99, %6
  %105 = add i32 %104, %90
  %106 = mul i32 %105, %22
  %107 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  br i1 %92, label %127, label %108

108:                                              ; preds = %98
  %109 = select i1 %101, i1 %94, i1 false
  %110 = select i1 %109, i1 %87, i1 false
  %111 = select i1 %110, i1 %102, i1 false
  %112 = select i1 %111, i1 %95, i1 false
  %113 = select i1 %112, i1 %88, i1 false
  %114 = sub i32 %103, %6
  %115 = select i1 %113, i32 %114, i32 0
  %116 = add nsw i32 %115, %17
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = mul i32 %106, %20
  %121 = add i32 %120, %30
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %2, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %125 = fmul contract float %119, %124
  %126 = fadd contract float %107, %125
  store float %126, float addrspace(1)* %37, align 4, !tbaa !7
  br label %127

127:                                              ; preds = %108, %98
  %128 = phi float [ %107, %98 ], [ %126, %108 ]
  %129 = phi i32 [ %34, %98 ], [ %96, %108 ]
  br i1 %97, label %182, label %130

130:                                              ; preds = %127, %130
  %131 = phi float [ %179, %130 ], [ %128, %127 ]
  %132 = phi i32 [ %180, %130 ], [ %129, %127 ]
  %133 = add nsw i32 %132, %32
  %134 = icmp sgt i32 %133, -1
  %135 = select i1 %101, i1 %134, i1 false
  %136 = select i1 %135, i1 %87, i1 false
  %137 = select i1 %136, i1 %102, i1 false
  %138 = icmp slt i32 %133, %4
  %139 = select i1 %137, i1 %138, i1 false
  %140 = select i1 %139, i1 %88, i1 false
  %141 = add i32 %103, %132
  %142 = select i1 %140, i32 %141, i32 0
  %143 = add nsw i32 %142, %17
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = add i32 %132, %6
  %148 = add i32 %147, %106
  %149 = mul i32 %148, %20
  %150 = add i32 %149, %30
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %2, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %154 = fmul contract float %146, %153
  %155 = fadd contract float %131, %154
  store float %155, float addrspace(1)* %37, align 4, !tbaa !7
  %156 = add i32 %132, 1
  %157 = add nsw i32 %156, %32
  %158 = icmp sgt i32 %157, -1
  %159 = select i1 %101, i1 %158, i1 false
  %160 = select i1 %159, i1 %87, i1 false
  %161 = select i1 %160, i1 %102, i1 false
  %162 = icmp slt i32 %157, %4
  %163 = select i1 %161, i1 %162, i1 false
  %164 = select i1 %163, i1 %88, i1 false
  %165 = add i32 %103, %156
  %166 = select i1 %164, i32 %165, i32 0
  %167 = add nsw i32 %166, %17
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %1, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = add i32 %156, %6
  %172 = add i32 %171, %106
  %173 = mul i32 %172, %20
  %174 = add i32 %173, %30
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %2, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !7
  %178 = fmul contract float %170, %177
  %179 = fadd contract float %155, %178
  store float %179, float addrspace(1)* %37, align 4, !tbaa !7
  %180 = add i32 %132, 2
  %181 = icmp eq i32 %156, %38
  br i1 %181, label %182, label %130, !llvm.loop !11

182:                                              ; preds = %130, %127
  %183 = add i32 %99, 1
  %184 = icmp eq i32 %99, %38
  br i1 %184, label %185, label %98, !llvm.loop !13

185:                                              ; preds = %182
  br i1 %35, label %342, label %186

186:                                              ; preds = %185
  %187 = add nsw i32 %33, 1
  %188 = icmp sgt i32 %33, -2
  %189 = icmp slt i32 %187, %5
  %190 = add i32 %25, 2
  %191 = mul i32 %190, %22
  %192 = and i32 %44, 1
  %193 = icmp eq i32 %192, 0
  %194 = sub i32 %32, %6
  %195 = icmp sgt i32 %194, -1
  %196 = icmp slt i32 %194, %4
  %197 = sub i32 1, %6
  %198 = icmp eq i32 %43, 0
  br label %199

199:                                              ; preds = %284, %186
  %200 = phi i32 [ %34, %186 ], [ %285, %284 ]
  %201 = add nsw i32 %200, %31
  %202 = icmp sgt i32 %201, -1
  %203 = icmp slt i32 %201, %3
  %204 = mul nsw i32 %200, %4
  %205 = add i32 %204, %20
  %206 = add i32 %200, %6
  %207 = add i32 %206, %191
  %208 = mul i32 %207, %22
  %209 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  br i1 %193, label %229, label %210

210:                                              ; preds = %199
  %211 = select i1 %202, i1 %195, i1 false
  %212 = select i1 %211, i1 %188, i1 false
  %213 = select i1 %212, i1 %203, i1 false
  %214 = select i1 %213, i1 %196, i1 false
  %215 = select i1 %214, i1 %189, i1 false
  %216 = sub i32 %205, %6
  %217 = select i1 %215, i32 %216, i32 0
  %218 = add nsw i32 %217, %17
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !7
  %222 = mul i32 %208, %20
  %223 = add i32 %222, %30
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %2, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = fmul contract float %221, %226
  %228 = fadd contract float %209, %227
  store float %228, float addrspace(1)* %37, align 4, !tbaa !7
  br label %229

229:                                              ; preds = %210, %199
  %230 = phi float [ %209, %199 ], [ %228, %210 ]
  %231 = phi i32 [ %34, %199 ], [ %197, %210 ]
  br i1 %198, label %284, label %232

232:                                              ; preds = %229, %232
  %233 = phi float [ %281, %232 ], [ %230, %229 ]
  %234 = phi i32 [ %282, %232 ], [ %231, %229 ]
  %235 = add nsw i32 %234, %32
  %236 = icmp sgt i32 %235, -1
  %237 = select i1 %202, i1 %236, i1 false
  %238 = select i1 %237, i1 %188, i1 false
  %239 = select i1 %238, i1 %203, i1 false
  %240 = icmp slt i32 %235, %4
  %241 = select i1 %239, i1 %240, i1 false
  %242 = select i1 %241, i1 %189, i1 false
  %243 = add i32 %205, %234
  %244 = select i1 %242, i32 %243, i32 0
  %245 = add nsw i32 %244, %17
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %1, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !7
  %249 = add i32 %234, %6
  %250 = add i32 %249, %208
  %251 = mul i32 %250, %20
  %252 = add i32 %251, %30
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds float, float addrspace(1)* %2, i64 %253
  %255 = load float, float addrspace(1)* %254, align 4, !tbaa !7
  %256 = fmul contract float %248, %255
  %257 = fadd contract float %233, %256
  store float %257, float addrspace(1)* %37, align 4, !tbaa !7
  %258 = add i32 %234, 1
  %259 = add nsw i32 %258, %32
  %260 = icmp sgt i32 %259, -1
  %261 = select i1 %202, i1 %260, i1 false
  %262 = select i1 %261, i1 %188, i1 false
  %263 = select i1 %262, i1 %203, i1 false
  %264 = icmp slt i32 %259, %4
  %265 = select i1 %263, i1 %264, i1 false
  %266 = select i1 %265, i1 %189, i1 false
  %267 = add i32 %205, %258
  %268 = select i1 %266, i32 %267, i32 0
  %269 = add nsw i32 %268, %17
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %1, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %273 = add i32 %258, %6
  %274 = add i32 %273, %208
  %275 = mul i32 %274, %20
  %276 = add i32 %275, %30
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %2, i64 %277
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %280 = fmul contract float %272, %279
  %281 = fadd contract float %257, %280
  store float %281, float addrspace(1)* %37, align 4, !tbaa !7
  %282 = add i32 %234, 2
  %283 = icmp eq i32 %258, %38
  br i1 %283, label %284, label %232, !llvm.loop !11

284:                                              ; preds = %232, %229
  %285 = add i32 %200, 1
  %286 = icmp eq i32 %200, %38
  br i1 %286, label %342, label %199, !llvm.loop !13

287:                                              ; preds = %290, %82
  %288 = add i32 %53, 1
  %289 = icmp eq i32 %53, %38
  br i1 %289, label %85, label %52, !llvm.loop !13

290:                                              ; preds = %82, %290
  %291 = phi float [ %339, %290 ], [ %83, %82 ]
  %292 = phi i32 [ %340, %290 ], [ %84, %82 ]
  %293 = add nsw i32 %292, %32
  %294 = icmp sgt i32 %293, -1
  %295 = select i1 %55, i1 %294, i1 false
  %296 = select i1 %295, i1 %40, i1 false
  %297 = select i1 %296, i1 %56, i1 false
  %298 = icmp slt i32 %293, %4
  %299 = select i1 %297, i1 %298, i1 false
  %300 = select i1 %299, i1 %41, i1 false
  %301 = add i32 %58, %292
  %302 = select i1 %300, i32 %301, i32 0
  %303 = add nsw i32 %302, %17
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds float, float addrspace(1)* %1, i64 %304
  %306 = load float, float addrspace(1)* %305, align 4, !tbaa !7
  %307 = add i32 %292, %6
  %308 = add i32 %307, %61
  %309 = mul i32 %308, %20
  %310 = add i32 %309, %30
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds float, float addrspace(1)* %2, i64 %311
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !7
  %314 = fmul contract float %306, %313
  %315 = fadd contract float %291, %314
  store float %315, float addrspace(1)* %37, align 4, !tbaa !7
  %316 = add i32 %292, 1
  %317 = add nsw i32 %316, %32
  %318 = icmp sgt i32 %317, -1
  %319 = select i1 %55, i1 %318, i1 false
  %320 = select i1 %319, i1 %40, i1 false
  %321 = select i1 %320, i1 %56, i1 false
  %322 = icmp slt i32 %317, %4
  %323 = select i1 %321, i1 %322, i1 false
  %324 = select i1 %323, i1 %41, i1 false
  %325 = add i32 %58, %316
  %326 = select i1 %324, i32 %325, i32 0
  %327 = add nsw i32 %326, %17
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds float, float addrspace(1)* %1, i64 %328
  %330 = load float, float addrspace(1)* %329, align 4, !tbaa !7
  %331 = add i32 %316, %6
  %332 = add i32 %331, %61
  %333 = mul i32 %332, %20
  %334 = add i32 %333, %30
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(1)* %2, i64 %335
  %337 = load float, float addrspace(1)* %336, align 4, !tbaa !7
  %338 = fmul contract float %330, %337
  %339 = fadd contract float %315, %338
  store float %339, float addrspace(1)* %37, align 4, !tbaa !7
  %340 = add i32 %292, 2
  %341 = icmp eq i32 %316, %38
  br i1 %341, label %287, label %290, !llvm.loop !11

342:                                              ; preds = %284, %185, %85, %19, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
