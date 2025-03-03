; ModuleID = '../data/hip_kernels/15412/106/main.cu'
source_filename = "../data/hip_kernels/15412/106/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22stretch_weights_kernelPKfPfiiifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, float %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = mul nsw i32 %4, %4
  %18 = mul nsw i32 %16, %17
  %19 = sdiv i32 %2, %17
  %20 = sdiv i32 %19, 4
  %21 = sdiv i32 %16, %20
  %22 = icmp slt i32 %18, %2
  br i1 %22, label %23, label %295

23:                                               ; preds = %7
  %24 = icmp eq i32 %21, 0
  br i1 %24, label %25, label %113

25:                                               ; preds = %23
  %26 = icmp sgt i32 %4, 0
  br i1 %26, label %27, label %295

27:                                               ; preds = %25
  %28 = and i32 %4, 7
  %29 = icmp ult i32 %4, 8
  %30 = and i32 %4, -8
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %27, %49
  %33 = phi i32 [ %50, %49 ], [ 0, %27 ]
  %34 = add i32 %33, %18
  br i1 %29, label %35, label %52

35:                                               ; preds = %52, %32
  %36 = phi i32 [ 0, %32 ], [ %110, %52 ]
  br i1 %31, label %49, label %37

37:                                               ; preds = %35, %37
  %38 = phi i32 [ %46, %37 ], [ %36, %35 ]
  %39 = phi i32 [ %47, %37 ], [ 0, %35 ]
  %40 = mul nsw i32 %38, %4
  %41 = add i32 %34, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  store float %44, float addrspace(1)* %45, align 4, !tbaa !7
  %46 = add nuw nsw i32 %38, 1
  %47 = add i32 %39, 1
  %48 = icmp eq i32 %47, %28
  br i1 %48, label %49, label %37, !llvm.loop !11

49:                                               ; preds = %37, %35
  %50 = add nuw nsw i32 %33, 1
  %51 = icmp eq i32 %50, %4
  br i1 %51, label %295, label %32, !llvm.loop !13

52:                                               ; preds = %32, %52
  %53 = phi i32 [ %110, %52 ], [ 0, %32 ]
  %54 = phi i32 [ %111, %52 ], [ 0, %32 ]
  %55 = mul nsw i32 %53, %4
  %56 = add i32 %34, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  store float %59, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = or i32 %53, 1
  %62 = mul nsw i32 %61, %4
  %63 = add i32 %34, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  store float %66, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = or i32 %53, 2
  %69 = mul nsw i32 %68, %4
  %70 = add i32 %34, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  store float %73, float addrspace(1)* %74, align 4, !tbaa !7
  %75 = or i32 %53, 3
  %76 = mul nsw i32 %75, %4
  %77 = add i32 %34, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  store float %80, float addrspace(1)* %81, align 4, !tbaa !7
  %82 = or i32 %53, 4
  %83 = mul nsw i32 %82, %4
  %84 = add i32 %34, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  store float %87, float addrspace(1)* %88, align 4, !tbaa !7
  %89 = or i32 %53, 5
  %90 = mul nsw i32 %89, %4
  %91 = add i32 %34, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  store float %94, float addrspace(1)* %95, align 4, !tbaa !7
  %96 = or i32 %53, 6
  %97 = mul nsw i32 %96, %4
  %98 = add i32 %34, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  store float %101, float addrspace(1)* %102, align 4, !tbaa !7
  %103 = or i32 %53, 7
  %104 = mul nsw i32 %103, %4
  %105 = add i32 %34, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  store float %108, float addrspace(1)* %109, align 4, !tbaa !7
  %110 = add nuw nsw i32 %53, 8
  %111 = add i32 %54, 8
  %112 = icmp eq i32 %111, %30
  br i1 %112, label %35, label %52, !llvm.loop !15

113:                                              ; preds = %23
  %114 = icmp sgt i32 %21, 0
  br i1 %114, label %115, label %295

115:                                              ; preds = %113
  switch i32 %21, label %118 [
    i32 1, label %119
    i32 2, label %116
    i32 3, label %117
  ]

116:                                              ; preds = %115
  br label %119

117:                                              ; preds = %115
  br label %119

118:                                              ; preds = %115
  br label %119

119:                                              ; preds = %115, %118, %116, %117
  %120 = phi float [ 0x3FE99999A0000000, %116 ], [ 0x3FF4CCCCC0000000, %117 ], [ 0x3FE4CCCCC0000000, %115 ], [ %5, %118 ]
  %121 = icmp eq i32 %6, 0
  %122 = fdiv contract float 1.000000e+00, %120
  %123 = select i1 %121, float %120, float %122
  %124 = sdiv i32 %4, 2
  %125 = icmp sgt i32 %4, 0
  br i1 %125, label %126, label %295

126:                                              ; preds = %119
  %127 = sitofp i32 %124 to float
  br label %128

128:                                              ; preds = %126, %159
  %129 = phi i32 [ 0, %126 ], [ %160, %159 ]
  %130 = sub nsw i32 %129, %124
  %131 = sitofp i32 %130 to float
  %132 = fdiv contract float %131, %123
  %133 = fadd contract float %132, %127
  %134 = tail call float @llvm.floor.f32(float %133)
  %135 = fptosi float %134 to i32
  %136 = tail call float @llvm.ceil.f32(float %133)
  %137 = fptosi float %136 to i32
  %138 = icmp eq i32 %135, %137
  %139 = add nsw i32 %135, 1
  %140 = select i1 %138, i32 %139, i32 %137
  %141 = sitofp i32 %140 to float
  %142 = fsub contract float %141, %133
  %143 = sitofp i32 %135 to float
  %144 = fsub contract float %133, %143
  %145 = icmp sgt i32 %135, -1
  %146 = icmp slt i32 %135, %4
  %147 = mul nsw i32 %135, %4
  %148 = icmp sgt i32 %140, -1
  %149 = icmp slt i32 %140, %4
  %150 = mul nsw i32 %140, %4
  %151 = mul nsw i32 %129, %4
  %152 = add i32 %151, %18
  br label %162

153:                                              ; preds = %159
  br i1 %125, label %154, label %295

154:                                              ; preds = %153
  %155 = and i32 %4, 3
  %156 = icmp ult i32 %4, 4
  %157 = and i32 %4, -4
  %158 = icmp eq i32 %155, 0
  br label %246

159:                                              ; preds = %239
  %160 = add nuw nsw i32 %129, 1
  %161 = icmp eq i32 %160, %4
  br i1 %161, label %153, label %128, !llvm.loop !16

162:                                              ; preds = %128, %239
  %163 = phi i32 [ 0, %128 ], [ %244, %239 ]
  %164 = sub nsw i32 %163, %124
  %165 = sitofp i32 %164 to float
  %166 = fdiv contract float %165, %123
  %167 = fadd contract float %166, %127
  %168 = tail call float @llvm.floor.f32(float %167)
  %169 = fptosi float %168 to i32
  %170 = tail call float @llvm.ceil.f32(float %167)
  %171 = fptosi float %170 to i32
  %172 = icmp eq i32 %169, %171
  %173 = add nsw i32 %169, 1
  %174 = select i1 %172, i32 %173, i32 %171
  %175 = sitofp i32 %174 to float
  %176 = fsub contract float %175, %167
  %177 = sitofp i32 %169 to float
  %178 = fsub contract float %167, %177
  %179 = icmp sgt i32 %169, -1
  br i1 %179, label %180, label %193

180:                                              ; preds = %162
  %181 = icmp slt i32 %169, %4
  %182 = select i1 %181, i1 %145, i1 false
  %183 = select i1 %182, i1 %146, i1 false
  br i1 %183, label %184, label %193

184:                                              ; preds = %180
  %185 = add i32 %18, %169
  %186 = add i32 %185, %147
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7
  %190 = fmul contract float %176, %189
  %191 = fmul contract float %142, %190
  %192 = fadd contract float %191, 0.000000e+00
  br label %193

193:                                              ; preds = %162, %180, %184
  %194 = phi float [ %192, %184 ], [ 0.000000e+00, %180 ], [ 0.000000e+00, %162 ]
  %195 = icmp sgt i32 %174, -1
  br i1 %195, label %196, label %209

196:                                              ; preds = %193
  %197 = icmp slt i32 %174, %4
  %198 = select i1 %197, i1 %145, i1 false
  %199 = select i1 %198, i1 %146, i1 false
  br i1 %199, label %200, label %209

200:                                              ; preds = %196
  %201 = add i32 %174, %18
  %202 = add i32 %201, %147
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %0, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !7
  %206 = fmul contract float %178, %205
  %207 = fmul contract float %142, %206
  %208 = fadd contract float %194, %207
  br label %209

209:                                              ; preds = %193, %196, %200
  %210 = phi float [ %208, %200 ], [ %194, %196 ], [ %194, %193 ]
  br i1 %179, label %211, label %224

211:                                              ; preds = %209
  %212 = icmp slt i32 %169, %4
  %213 = select i1 %212, i1 %148, i1 false
  %214 = select i1 %213, i1 %149, i1 false
  br i1 %214, label %215, label %224

215:                                              ; preds = %211
  %216 = add i32 %18, %169
  %217 = add i32 %216, %150
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %0, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7
  %221 = fmul contract float %176, %220
  %222 = fmul contract float %144, %221
  %223 = fadd contract float %210, %222
  br label %224

224:                                              ; preds = %209, %211, %215
  %225 = phi float [ %223, %215 ], [ %210, %211 ], [ %210, %209 ]
  br i1 %195, label %226, label %239

226:                                              ; preds = %224
  %227 = icmp slt i32 %174, %4
  %228 = select i1 %227, i1 %148, i1 false
  %229 = select i1 %228, i1 %149, i1 false
  br i1 %229, label %230, label %239

230:                                              ; preds = %226
  %231 = add i32 %174, %18
  %232 = add i32 %231, %150
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !7
  %236 = fmul contract float %178, %235
  %237 = fmul contract float %144, %236
  %238 = fadd contract float %225, %237
  br label %239

239:                                              ; preds = %224, %226, %230
  %240 = phi float [ %238, %230 ], [ %225, %226 ], [ %225, %224 ]
  %241 = add i32 %152, %163
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %1, i64 %242
  store float %240, float addrspace(1)* %243, align 4, !tbaa !7
  %244 = add nuw nsw i32 %163, 1
  %245 = icmp eq i32 %244, %4
  br i1 %245, label %159, label %162, !llvm.loop !17

246:                                              ; preds = %154, %263
  %247 = phi i32 [ %264, %263 ], [ 0, %154 ]
  %248 = mul nsw i32 %247, %4
  %249 = add i32 %248, %18
  br i1 %156, label %250, label %266

250:                                              ; preds = %266, %246
  %251 = phi i32 [ 0, %246 ], [ %292, %266 ]
  br i1 %158, label %263, label %252

252:                                              ; preds = %250, %252
  %253 = phi i32 [ %260, %252 ], [ %251, %250 ]
  %254 = phi i32 [ %261, %252 ], [ 0, %250 ]
  %255 = add i32 %249, %253
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %1, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !7
  %259 = fdiv contract float %258, %123
  store float %259, float addrspace(1)* %257, align 4, !tbaa !7
  %260 = add nuw nsw i32 %253, 1
  %261 = add i32 %254, 1
  %262 = icmp eq i32 %261, %155
  br i1 %262, label %263, label %252, !llvm.loop !18

263:                                              ; preds = %252, %250
  %264 = add nuw nsw i32 %247, 1
  %265 = icmp eq i32 %264, %4
  br i1 %265, label %295, label %246, !llvm.loop !19

266:                                              ; preds = %246, %266
  %267 = phi i32 [ %292, %266 ], [ 0, %246 ]
  %268 = phi i32 [ %293, %266 ], [ 0, %246 ]
  %269 = add i32 %249, %267
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %1, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %273 = fdiv contract float %272, %123
  store float %273, float addrspace(1)* %271, align 4, !tbaa !7
  %274 = or i32 %267, 1
  %275 = add i32 %249, %274
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds float, float addrspace(1)* %1, i64 %276
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !7
  %279 = fdiv contract float %278, %123
  store float %279, float addrspace(1)* %277, align 4, !tbaa !7
  %280 = or i32 %267, 2
  %281 = add i32 %249, %280
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %1, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %285 = fdiv contract float %284, %123
  store float %285, float addrspace(1)* %283, align 4, !tbaa !7
  %286 = or i32 %267, 3
  %287 = add i32 %249, %286
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds float, float addrspace(1)* %1, i64 %288
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !7
  %291 = fdiv contract float %290, %123
  store float %291, float addrspace(1)* %289, align 4, !tbaa !7
  %292 = add nuw nsw i32 %267, 4
  %293 = add i32 %268, 4
  %294 = icmp eq i32 %293, %157
  br i1 %294, label %250, label %266, !llvm.loop !20

295:                                              ; preds = %263, %49, %119, %153, %25, %113, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !14}
