; ModuleID = '../data/hip_kernels/8007/14/main.cu'
source_filename = "../data/hip_kernels/8007/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10dot_kernelPffiiiS_(float addrspace(1)* nocapture readonly %0, float %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %7
  %24 = mul i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = freeze i32 %26
  %28 = freeze i32 %3
  %29 = sdiv i32 %27, %28
  %30 = mul i32 %29, %28
  %31 = sub i32 %27, %30
  %32 = icmp sgt i32 %31, %29
  br i1 %32, label %33, label %310

33:                                               ; preds = %6
  %34 = icmp sgt i32 %2, 0
  br i1 %34, label %35, label %225

35:                                               ; preds = %33
  %36 = icmp sgt i32 %4, 0
  %37 = mul i32 %4, %3
  %38 = mul nsw i32 %29, %4
  %39 = mul nsw i32 %31, %4
  %40 = and i32 %4, 7
  %41 = icmp ult i32 %4, 8
  %42 = and i32 %4, -8
  %43 = icmp eq i32 %40, 0
  br label %44

44:                                               ; preds = %35, %219
  %45 = phi float [ 0.000000e+00, %35 ], [ %222, %219 ]
  %46 = phi float [ 0.000000e+00, %35 ], [ %221, %219 ]
  %47 = phi float [ 0.000000e+00, %35 ], [ %220, %219 ]
  %48 = phi i32 [ 0, %35 ], [ %223, %219 ]
  br i1 %36, label %49, label %219

49:                                               ; preds = %44
  %50 = mul i32 %37, %48
  br i1 %41, label %187, label %51

51:                                               ; preds = %49, %51
  %52 = phi float [ %179, %51 ], [ %45, %49 ]
  %53 = phi float [ %181, %51 ], [ %46, %49 ]
  %54 = phi float [ %183, %51 ], [ %47, %49 ]
  %55 = phi i32 [ %184, %51 ], [ 0, %49 ]
  %56 = phi i32 [ %185, %51 ], [ 0, %49 ]
  %57 = add i32 %55, %50
  %58 = add i32 %57, %38
  %59 = add i32 %57, %39
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !14
  %63 = sext i32 %59 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !14
  %66 = fmul contract float %62, %65
  %67 = fadd contract float %52, %66
  %68 = fmul contract float %62, %62
  %69 = fadd contract float %53, %68
  %70 = fmul contract float %65, %65
  %71 = fadd contract float %54, %70
  %72 = or i32 %55, 1
  %73 = add i32 %72, %50
  %74 = add i32 %73, %38
  %75 = add i32 %73, %39
  %76 = sext i32 %74 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16, !amdgpu.noclobber !14
  %79 = sext i32 %75 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16, !amdgpu.noclobber !14
  %82 = fmul contract float %78, %81
  %83 = fadd contract float %67, %82
  %84 = fmul contract float %78, %78
  %85 = fadd contract float %69, %84
  %86 = fmul contract float %81, %81
  %87 = fadd contract float %71, %86
  %88 = or i32 %55, 2
  %89 = add i32 %88, %50
  %90 = add i32 %89, %38
  %91 = add i32 %89, %39
  %92 = sext i32 %90 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !16, !amdgpu.noclobber !14
  %95 = sext i32 %91 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16, !amdgpu.noclobber !14
  %98 = fmul contract float %94, %97
  %99 = fadd contract float %83, %98
  %100 = fmul contract float %94, %94
  %101 = fadd contract float %85, %100
  %102 = fmul contract float %97, %97
  %103 = fadd contract float %87, %102
  %104 = or i32 %55, 3
  %105 = add i32 %104, %50
  %106 = add i32 %105, %38
  %107 = add i32 %105, %39
  %108 = sext i32 %106 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16, !amdgpu.noclobber !14
  %111 = sext i32 %107 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !16, !amdgpu.noclobber !14
  %114 = fmul contract float %110, %113
  %115 = fadd contract float %99, %114
  %116 = fmul contract float %110, %110
  %117 = fadd contract float %101, %116
  %118 = fmul contract float %113, %113
  %119 = fadd contract float %103, %118
  %120 = or i32 %55, 4
  %121 = add i32 %120, %50
  %122 = add i32 %121, %38
  %123 = add i32 %121, %39
  %124 = sext i32 %122 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16, !amdgpu.noclobber !14
  %127 = sext i32 %123 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !16, !amdgpu.noclobber !14
  %130 = fmul contract float %126, %129
  %131 = fadd contract float %115, %130
  %132 = fmul contract float %126, %126
  %133 = fadd contract float %117, %132
  %134 = fmul contract float %129, %129
  %135 = fadd contract float %119, %134
  %136 = or i32 %55, 5
  %137 = add i32 %136, %50
  %138 = add i32 %137, %38
  %139 = add i32 %137, %39
  %140 = sext i32 %138 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !16, !amdgpu.noclobber !14
  %143 = sext i32 %139 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !16, !amdgpu.noclobber !14
  %146 = fmul contract float %142, %145
  %147 = fadd contract float %131, %146
  %148 = fmul contract float %142, %142
  %149 = fadd contract float %133, %148
  %150 = fmul contract float %145, %145
  %151 = fadd contract float %135, %150
  %152 = or i32 %55, 6
  %153 = add i32 %152, %50
  %154 = add i32 %153, %38
  %155 = add i32 %153, %39
  %156 = sext i32 %154 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !16, !amdgpu.noclobber !14
  %159 = sext i32 %155 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !16, !amdgpu.noclobber !14
  %162 = fmul contract float %158, %161
  %163 = fadd contract float %147, %162
  %164 = fmul contract float %158, %158
  %165 = fadd contract float %149, %164
  %166 = fmul contract float %161, %161
  %167 = fadd contract float %151, %166
  %168 = or i32 %55, 7
  %169 = add i32 %168, %50
  %170 = add i32 %169, %38
  %171 = add i32 %169, %39
  %172 = sext i32 %170 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16, !amdgpu.noclobber !14
  %175 = sext i32 %171 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %0, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !16, !amdgpu.noclobber !14
  %178 = fmul contract float %174, %177
  %179 = fadd contract float %163, %178
  %180 = fmul contract float %174, %174
  %181 = fadd contract float %165, %180
  %182 = fmul contract float %177, %177
  %183 = fadd contract float %167, %182
  %184 = add nuw nsw i32 %55, 8
  %185 = add i32 %56, 8
  %186 = icmp eq i32 %185, %42
  br i1 %186, label %187, label %51, !llvm.loop !20

187:                                              ; preds = %51, %49
  %188 = phi float [ undef, %49 ], [ %179, %51 ]
  %189 = phi float [ undef, %49 ], [ %181, %51 ]
  %190 = phi float [ undef, %49 ], [ %183, %51 ]
  %191 = phi float [ %45, %49 ], [ %179, %51 ]
  %192 = phi float [ %46, %49 ], [ %181, %51 ]
  %193 = phi float [ %47, %49 ], [ %183, %51 ]
  %194 = phi i32 [ 0, %49 ], [ %184, %51 ]
  br i1 %43, label %219, label %195

195:                                              ; preds = %187, %195
  %196 = phi float [ %211, %195 ], [ %191, %187 ]
  %197 = phi float [ %213, %195 ], [ %192, %187 ]
  %198 = phi float [ %215, %195 ], [ %193, %187 ]
  %199 = phi i32 [ %216, %195 ], [ %194, %187 ]
  %200 = phi i32 [ %217, %195 ], [ 0, %187 ]
  %201 = add i32 %199, %50
  %202 = add i32 %201, %38
  %203 = add i32 %201, %39
  %204 = sext i32 %202 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !16, !amdgpu.noclobber !14
  %207 = sext i32 %203 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %0, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !16, !amdgpu.noclobber !14
  %210 = fmul contract float %206, %209
  %211 = fadd contract float %196, %210
  %212 = fmul contract float %206, %206
  %213 = fadd contract float %197, %212
  %214 = fmul contract float %209, %209
  %215 = fadd contract float %198, %214
  %216 = add nuw nsw i32 %199, 1
  %217 = add i32 %200, 1
  %218 = icmp eq i32 %217, %40
  br i1 %218, label %219, label %195, !llvm.loop !22

219:                                              ; preds = %187, %195, %44
  %220 = phi float [ %47, %44 ], [ %190, %187 ], [ %215, %195 ]
  %221 = phi float [ %46, %44 ], [ %189, %187 ], [ %213, %195 ]
  %222 = phi float [ %45, %44 ], [ %188, %187 ], [ %211, %195 ]
  %223 = add nuw nsw i32 %48, 1
  %224 = icmp eq i32 %223, %2
  br i1 %224, label %225, label %44, !llvm.loop !24

225:                                              ; preds = %219, %33
  %226 = phi float [ 0.000000e+00, %33 ], [ %220, %219 ]
  %227 = phi float [ 0.000000e+00, %33 ], [ %221, %219 ]
  %228 = phi float [ 0.000000e+00, %33 ], [ %222, %219 ]
  %229 = fcmp olt float %227, 0x39F0000000000000
  %230 = select i1 %229, float 0x41F0000000000000, float 1.000000e+00
  %231 = fmul float %227, %230
  %232 = tail call float @llvm.sqrt.f32(float %231)
  %233 = bitcast float %232 to i32
  %234 = add nsw i32 %233, -1
  %235 = bitcast i32 %234 to float
  %236 = add nsw i32 %233, 1
  %237 = bitcast i32 %236 to float
  %238 = tail call i1 @llvm.amdgcn.class.f32(float %231, i32 608)
  %239 = select i1 %229, float 0x3EF0000000000000, float 1.000000e+00
  %240 = fneg float %237
  %241 = tail call float @llvm.fma.f32(float %240, float %232, float %231)
  %242 = fcmp ogt float %241, 0.000000e+00
  %243 = fneg float %235
  %244 = tail call float @llvm.fma.f32(float %243, float %232, float %231)
  %245 = fcmp ole float %244, 0.000000e+00
  %246 = select i1 %245, float %235, float %232
  %247 = select i1 %242, float %237, float %246
  %248 = fmul float %239, %247
  %249 = select i1 %238, float %231, float %248
  %250 = fcmp olt float %226, 0x39F0000000000000
  %251 = select i1 %250, float 0x41F0000000000000, float 1.000000e+00
  %252 = fmul float %226, %251
  %253 = tail call float @llvm.sqrt.f32(float %252)
  %254 = bitcast float %253 to i32
  %255 = add nsw i32 %254, -1
  %256 = bitcast i32 %255 to float
  %257 = add nsw i32 %254, 1
  %258 = bitcast i32 %257 to float
  %259 = tail call i1 @llvm.amdgcn.class.f32(float %252, i32 608)
  %260 = select i1 %250, float 0x3EF0000000000000, float 1.000000e+00
  %261 = fneg float %258
  %262 = tail call float @llvm.fma.f32(float %261, float %253, float %252)
  %263 = fcmp ogt float %262, 0.000000e+00
  %264 = fneg float %256
  %265 = tail call float @llvm.fma.f32(float %264, float %253, float %252)
  %266 = fcmp ole float %265, 0.000000e+00
  %267 = select i1 %266, float %256, float %253
  %268 = select i1 %263, float %258, float %267
  %269 = fmul float %260, %268
  %270 = select i1 %259, float %252, float %269
  %271 = fmul contract float %270, %249
  br i1 %34, label %272, label %310

272:                                              ; preds = %225
  %273 = fdiv contract float %228, %271
  %274 = icmp sgt i32 %4, 0
  %275 = mul i32 %4, %3
  %276 = mul nsw i32 %29, %4
  %277 = mul nsw i32 %31, %4
  %278 = fneg contract float %1
  %279 = fmul contract float %273, %278
  br label %280

280:                                              ; preds = %272, %307
  %281 = phi i32 [ 0, %272 ], [ %308, %307 ]
  br i1 %274, label %282, label %307

282:                                              ; preds = %280
  %283 = mul i32 %275, %281
  br label %284

284:                                              ; preds = %282, %284
  %285 = phi i32 [ 0, %282 ], [ %305, %284 ]
  %286 = add i32 %285, %283
  %287 = add i32 %286, %276
  %288 = add i32 %286, %277
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %0, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !16
  %292 = fmul contract float %279, %291
  %293 = fdiv contract float %292, %271
  %294 = sext i32 %287 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %5, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !16
  %297 = fadd contract float %296, %293
  store float %297, float addrspace(1)* %295, align 4, !tbaa !16
  %298 = getelementptr inbounds float, float addrspace(1)* %0, i64 %294
  %299 = load float, float addrspace(1)* %298, align 4, !tbaa !16
  %300 = fmul contract float %279, %299
  %301 = fdiv contract float %300, %271
  %302 = getelementptr inbounds float, float addrspace(1)* %5, i64 %289
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !16
  %304 = fadd contract float %303, %301
  store float %304, float addrspace(1)* %302, align 4, !tbaa !16
  %305 = add nuw nsw i32 %285, 1
  %306 = icmp eq i32 %305, %4
  br i1 %306, label %307, label %284, !llvm.loop !25

307:                                              ; preds = %284, %280
  %308 = add nuw nsw i32 %281, 1
  %309 = icmp eq i32 %308, %2
  br i1 %309, label %310, label %280, !llvm.loop !26

310:                                              ; preds = %307, %225, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

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
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !21}
