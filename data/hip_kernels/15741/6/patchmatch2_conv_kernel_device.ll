; ModuleID = '../data/hip_kernels/15741/6/main.cu'
source_filename = "../data/hip_kernels/15741/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23patchmatch2_conv_kernelPfS_S_S_S_Piiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = mul nsw i32 %10, %9
  %22 = shl nsw i32 %7, 1
  %23 = add nuw nsw i32 %22, 1
  %24 = mul nsw i32 %23, %23
  %25 = mul nsw i32 %21, %24
  %26 = icmp slt i32 %20, %25
  br i1 %26, label %27, label %301

27:                                               ; preds = %11
  %28 = sext i32 %20 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %4, i64 %28
  store float -1.000000e+00, float addrspace(1)* %29, align 4, !tbaa !7
  %30 = freeze i32 %20
  %31 = freeze i32 %24
  %32 = sdiv i32 %30, %31
  %33 = mul i32 %32, %31
  %34 = sub i32 %30, %33
  %35 = freeze i32 %10
  %36 = sdiv i32 %32, %35
  %37 = mul i32 %36, %35
  %38 = sub i32 %32, %37
  %39 = freeze i32 %23
  %40 = sdiv i32 %34, %39
  %41 = sub nsw i32 %40, %7
  %42 = mul i32 %40, %39
  %43 = sub i32 %34, %42
  %44 = sub nsw i32 %43, %7
  %45 = shl nsw i32 %32, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !11, !amdgpu.noclobber !5
  %49 = add nuw nsw i32 %45, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !11, !amdgpu.noclobber !5
  %53 = add nsw i32 %52, %41
  %54 = add nsw i32 %48, %44
  %55 = icmp sgt i32 %54, -1
  br i1 %55, label %56, label %301

56:                                               ; preds = %27
  %57 = icmp slt i32 %54, %10
  %58 = icmp sgt i32 %53, -1
  %59 = select i1 %57, i1 %58, i1 false
  %60 = icmp slt i32 %53, %9
  %61 = select i1 %59, i1 %60, i1 false
  br i1 %61, label %62, label %301

62:                                               ; preds = %56
  %63 = add nsw i32 %6, -1
  %64 = sdiv i32 %63, 2
  %65 = sub nsw i32 0, %64
  %66 = icmp slt i32 %6, 0
  br i1 %66, label %86, label %67

67:                                               ; preds = %62
  %68 = icmp sgt i32 %8, 0
  %69 = tail call i32 @llvm.abs.i32(i32 %64, i1 true)
  %70 = and i32 %8, 7
  %71 = icmp ult i32 %8, 8
  %72 = and i32 %8, -8
  %73 = icmp eq i32 %70, 0
  br label %74

74:                                               ; preds = %67, %91
  %75 = phi float [ 0.000000e+00, %67 ], [ %298, %91 ]
  %76 = phi i32 [ 0, %67 ], [ %297, %91 ]
  %77 = phi i32 [ %65, %67 ], [ %92, %91 ]
  %78 = add nsw i32 %77, %36
  %79 = add nsw i32 %77, %53
  %80 = icmp sgt i32 %78, -1
  %81 = icmp slt i32 %78, %9
  %82 = icmp sgt i32 %79, -1
  %83 = icmp slt i32 %79, %9
  %84 = mul nsw i32 %78, %10
  %85 = mul nsw i32 %79, %10
  br label %94

86:                                               ; preds = %91, %62
  %87 = phi i32 [ 0, %62 ], [ %297, %91 ]
  %88 = phi float [ 0.000000e+00, %62 ], [ %298, %91 ]
  %89 = sitofp i32 %87 to float
  %90 = fdiv contract float %88, %89
  store float %90, float addrspace(1)* %29, align 4, !tbaa !7
  br label %301

91:                                               ; preds = %296
  %92 = add i32 %77, 1
  %93 = icmp eq i32 %77, %69
  br i1 %93, label %86, label %74, !llvm.loop !13

94:                                               ; preds = %74, %296
  %95 = phi float [ %75, %74 ], [ %298, %296 ]
  %96 = phi i32 [ %76, %74 ], [ %297, %296 ]
  %97 = phi i32 [ %65, %74 ], [ %299, %296 ]
  %98 = add nsw i32 %97, %38
  %99 = add nsw i32 %97, %54
  %100 = icmp sgt i32 %98, -1
  %101 = icmp slt i32 %98, %10
  %102 = select i1 %100, i1 %101, i1 false
  %103 = select i1 %102, i1 %80, i1 false
  %104 = icmp sgt i32 %99, -1
  %105 = select i1 %103, i1 %81, i1 false
  %106 = select i1 %105, i1 %104, i1 false
  br i1 %106, label %107, label %296

107:                                              ; preds = %94
  %108 = icmp slt i32 %99, %10
  %109 = select i1 %108, i1 %82, i1 false
  %110 = select i1 %109, i1 %83, i1 false
  br i1 %110, label %111, label %296

111:                                              ; preds = %107
  %112 = add nsw i32 %98, %84
  %113 = add nsw i32 %99, %85
  br i1 %68, label %114, label %143

114:                                              ; preds = %111
  br i1 %71, label %115, label %146

115:                                              ; preds = %146, %114
  %116 = phi float [ undef, %114 ], [ %292, %146 ]
  %117 = phi float [ %95, %114 ], [ %292, %146 ]
  %118 = phi i32 [ 0, %114 ], [ %293, %146 ]
  br i1 %73, label %143, label %119

119:                                              ; preds = %115, %119
  %120 = phi float [ %139, %119 ], [ %117, %115 ]
  %121 = phi i32 [ %140, %119 ], [ %118, %115 ]
  %122 = phi i32 [ %141, %119 ], [ 0, %115 ]
  %123 = mul nsw i32 %121, %21
  %124 = add nsw i32 %112, %123
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = add nsw i32 %113, %123
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fmul contract float %127, %131
  %133 = fadd contract float %120, %132
  %134 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = getelementptr inbounds float, float addrspace(1)* %3, i64 %129
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7
  %138 = fmul contract float %135, %137
  %139 = fadd contract float %133, %138
  %140 = add nuw nsw i32 %121, 1
  %141 = add i32 %122, 1
  %142 = icmp eq i32 %141, %70
  br i1 %142, label %143, label %119, !llvm.loop !15

143:                                              ; preds = %115, %119, %111
  %144 = phi float [ %95, %111 ], [ %116, %115 ], [ %139, %119 ]
  %145 = add nsw i32 %96, 1
  br label %296

146:                                              ; preds = %114, %146
  %147 = phi float [ %292, %146 ], [ %95, %114 ]
  %148 = phi i32 [ %293, %146 ], [ 0, %114 ]
  %149 = phi i32 [ %294, %146 ], [ 0, %114 ]
  %150 = mul nsw i32 %148, %21
  %151 = add nsw i32 %112, %150
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7
  %155 = add nsw i32 %113, %150
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %159 = fmul contract float %154, %158
  %160 = fadd contract float %147, %159
  %161 = getelementptr inbounds float, float addrspace(1)* %2, i64 %152
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7
  %163 = getelementptr inbounds float, float addrspace(1)* %3, i64 %156
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %165 = fmul contract float %162, %164
  %166 = fadd contract float %160, %165
  %167 = or i32 %148, 1
  %168 = mul nsw i32 %167, %21
  %169 = add nsw i32 %112, %168
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7
  %173 = add nsw i32 %113, %168
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %1, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !7
  %177 = fmul contract float %172, %176
  %178 = fadd contract float %166, %177
  %179 = getelementptr inbounds float, float addrspace(1)* %2, i64 %170
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !7
  %181 = getelementptr inbounds float, float addrspace(1)* %3, i64 %174
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7
  %183 = fmul contract float %180, %182
  %184 = fadd contract float %178, %183
  %185 = or i32 %148, 2
  %186 = mul nsw i32 %185, %21
  %187 = add nsw i32 %112, %186
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %0, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !7
  %191 = add nsw i32 %113, %186
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %1, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = fmul contract float %190, %194
  %196 = fadd contract float %184, %195
  %197 = getelementptr inbounds float, float addrspace(1)* %2, i64 %188
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !7
  %199 = getelementptr inbounds float, float addrspace(1)* %3, i64 %192
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !7
  %201 = fmul contract float %198, %200
  %202 = fadd contract float %196, %201
  %203 = or i32 %148, 3
  %204 = mul nsw i32 %203, %21
  %205 = add nsw i32 %112, %204
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %0, i64 %206
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !7
  %209 = add nsw i32 %113, %204
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %1, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !7
  %213 = fmul contract float %208, %212
  %214 = fadd contract float %202, %213
  %215 = getelementptr inbounds float, float addrspace(1)* %2, i64 %206
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !7
  %217 = getelementptr inbounds float, float addrspace(1)* %3, i64 %210
  %218 = load float, float addrspace(1)* %217, align 4, !tbaa !7
  %219 = fmul contract float %216, %218
  %220 = fadd contract float %214, %219
  %221 = or i32 %148, 4
  %222 = mul nsw i32 %221, %21
  %223 = add nsw i32 %112, %222
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %0, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = add nsw i32 %113, %222
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %1, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !7
  %231 = fmul contract float %226, %230
  %232 = fadd contract float %220, %231
  %233 = getelementptr inbounds float, float addrspace(1)* %2, i64 %224
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !7
  %235 = getelementptr inbounds float, float addrspace(1)* %3, i64 %228
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !7
  %237 = fmul contract float %234, %236
  %238 = fadd contract float %232, %237
  %239 = or i32 %148, 5
  %240 = mul nsw i32 %239, %21
  %241 = add nsw i32 %112, %240
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %0, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7
  %245 = add nsw i32 %113, %240
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %1, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !7
  %249 = fmul contract float %244, %248
  %250 = fadd contract float %238, %249
  %251 = getelementptr inbounds float, float addrspace(1)* %2, i64 %242
  %252 = load float, float addrspace(1)* %251, align 4, !tbaa !7
  %253 = getelementptr inbounds float, float addrspace(1)* %3, i64 %246
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !7
  %255 = fmul contract float %252, %254
  %256 = fadd contract float %250, %255
  %257 = or i32 %148, 6
  %258 = mul nsw i32 %257, %21
  %259 = add nsw i32 %112, %258
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %0, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !7
  %263 = add nsw i32 %113, %258
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %1, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !7
  %267 = fmul contract float %262, %266
  %268 = fadd contract float %256, %267
  %269 = getelementptr inbounds float, float addrspace(1)* %2, i64 %260
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !7
  %271 = getelementptr inbounds float, float addrspace(1)* %3, i64 %264
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %273 = fmul contract float %270, %272
  %274 = fadd contract float %268, %273
  %275 = or i32 %148, 7
  %276 = mul nsw i32 %275, %21
  %277 = add nsw i32 %112, %276
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %0, i64 %278
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !7
  %281 = add nsw i32 %113, %276
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %1, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %285 = fmul contract float %280, %284
  %286 = fadd contract float %274, %285
  %287 = getelementptr inbounds float, float addrspace(1)* %2, i64 %278
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !7
  %289 = getelementptr inbounds float, float addrspace(1)* %3, i64 %282
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !7
  %291 = fmul contract float %288, %290
  %292 = fadd contract float %286, %291
  %293 = add nuw nsw i32 %148, 8
  %294 = add i32 %149, 8
  %295 = icmp eq i32 %294, %72
  br i1 %295, label %115, label %146, !llvm.loop !17

296:                                              ; preds = %143, %107, %94
  %297 = phi i32 [ %145, %143 ], [ %96, %107 ], [ %96, %94 ]
  %298 = phi float [ %144, %143 ], [ %95, %107 ], [ %95, %94 ]
  %299 = add i32 %97, 1
  %300 = icmp eq i32 %97, %69
  br i1 %300, label %91, label %94, !llvm.loop !18

301:                                              ; preds = %11, %86, %56, %27
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
