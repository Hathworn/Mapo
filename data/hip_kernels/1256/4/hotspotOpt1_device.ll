; ModuleID = '../data/hip_kernels/1256/4/main.cu'
source_filename = "../data/hip_kernels/1256/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11hotspotOpt1PfS_S_fiiifffffff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float %3, i32 %4, i32 %5, i32 %6, float %7, float %8, float %9, float %10, float %11, float %12, float %13) local_unnamed_addr #0 {
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %31 = add i32 %29, %30
  %32 = mul nsw i32 %31, %4
  %33 = add nsw i32 %32, %23
  %34 = mul nsw i32 %5, %4
  %35 = icmp eq i32 %23, 0
  %36 = add nsw i32 %33, -1
  %37 = select i1 %35, i32 %32, i32 %36
  %38 = add nsw i32 %4, -1
  %39 = icmp ne i32 %23, %38
  %40 = zext i1 %39 to i32
  %41 = add nsw i32 %33, %40
  %42 = icmp eq i32 %31, 0
  %43 = select i1 %42, i32 0, i32 %4
  %44 = sub nsw i32 %33, %43
  %45 = add nsw i32 %5, -1
  %46 = icmp eq i32 %31, %45
  %47 = select i1 %46, i32 0, i32 %4
  %48 = add nsw i32 %33, %47
  %49 = sext i32 %33 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = add nsw i32 %33, %34
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = fmul contract float %51, %13
  %57 = sext i32 %37 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fmul contract float %59, %8
  %61 = fadd contract float %56, %60
  %62 = sext i32 %41 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = fmul contract float %64, %7
  %66 = fadd contract float %61, %65
  %67 = sext i32 %48 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = fmul contract float %69, %10
  %71 = fadd contract float %66, %70
  %72 = sext i32 %44 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fmul contract float %74, %9
  %76 = fadd contract float %71, %75
  %77 = fmul contract float %51, %12
  %78 = fadd contract float %77, %76
  %79 = fmul contract float %55, %11
  %80 = fadd contract float %79, %78
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fmul contract float %82, %3
  %84 = fadd contract float %83, %80
  %85 = fmul contract float %11, 8.000000e+01
  %86 = fadd contract float %85, %84
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  store float %86, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = add nsw i32 %48, %34
  %89 = add nsw i32 %44, %34
  %90 = add nsw i32 %41, %34
  %91 = add nsw i32 %37, %34
  %92 = icmp sgt i32 %6, 2
  br i1 %92, label %93, label %167

93:                                               ; preds = %14
  %94 = and i32 %6, 1
  %95 = icmp eq i32 %6, 3
  br i1 %95, label %99, label %96

96:                                               ; preds = %93
  %97 = and i32 %6, -2
  %98 = add i32 %97, -4
  br label %205

99:                                               ; preds = %205, %93
  %100 = phi float [ undef, %93 ], [ %217, %205 ]
  %101 = phi i64 [ undef, %93 ], [ %255, %205 ]
  %102 = phi float [ undef, %93 ], [ %257, %205 ]
  %103 = phi float [ undef, %93 ], [ %281, %205 ]
  %104 = phi i32 [ undef, %93 ], [ %290, %205 ]
  %105 = phi i32 [ undef, %93 ], [ %291, %205 ]
  %106 = phi i32 [ undef, %93 ], [ %292, %205 ]
  %107 = phi i32 [ undef, %93 ], [ %293, %205 ]
  %108 = phi i32 [ %91, %93 ], [ %293, %205 ]
  %109 = phi i32 [ %90, %93 ], [ %292, %205 ]
  %110 = phi i32 [ %89, %93 ], [ %291, %205 ]
  %111 = phi i32 [ %88, %93 ], [ %290, %205 ]
  %112 = phi float [ %55, %93 ], [ %257, %205 ]
  %113 = phi float [ %51, %93 ], [ %217, %205 ]
  %114 = phi i32 [ %52, %93 ], [ %254, %205 ]
  %115 = icmp eq i32 %94, 0
  br i1 %115, label %157, label %116

116:                                              ; preds = %99
  %117 = add nsw i32 %114, %34
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = fmul contract float %112, %13
  %122 = sext i32 %108 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %125 = fmul contract float %124, %8
  %126 = fadd contract float %121, %125
  %127 = sext i32 %109 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = fmul contract float %129, %7
  %131 = fadd contract float %126, %130
  %132 = sext i32 %111 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = fmul contract float %134, %10
  %136 = fadd contract float %131, %135
  %137 = sext i32 %110 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = fmul contract float %139, %9
  %141 = fadd contract float %136, %140
  %142 = fmul contract float %113, %12
  %143 = fadd contract float %142, %141
  %144 = fmul contract float %120, %11
  %145 = fadd contract float %144, %143
  %146 = sext i32 %114 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %149 = fmul contract float %148, %3
  %150 = fadd contract float %149, %145
  %151 = fadd contract float %85, %150
  %152 = getelementptr inbounds float, float addrspace(1)* %2, i64 %146
  store float %151, float addrspace(1)* %152, align 4, !tbaa !7
  %153 = add nsw i32 %111, %34
  %154 = add nsw i32 %110, %34
  %155 = add nsw i32 %109, %34
  %156 = add nsw i32 %108, %34
  br label %157

157:                                              ; preds = %99, %116
  %158 = phi float [ %100, %99 ], [ %112, %116 ]
  %159 = phi i64 [ %101, %99 ], [ %118, %116 ]
  %160 = phi float [ %102, %99 ], [ %120, %116 ]
  %161 = phi float [ %103, %99 ], [ %144, %116 ]
  %162 = phi i32 [ %104, %99 ], [ %153, %116 ]
  %163 = phi i32 [ %105, %99 ], [ %154, %116 ]
  %164 = phi i32 [ %106, %99 ], [ %155, %116 ]
  %165 = phi i32 [ %107, %99 ], [ %156, %116 ]
  %166 = fmul contract float %158, %12
  br label %167

167:                                              ; preds = %157, %14
  %168 = phi float [ %161, %157 ], [ %79, %14 ]
  %169 = phi float [ %166, %157 ], [ %77, %14 ]
  %170 = phi i64 [ %159, %157 ], [ %53, %14 ]
  %171 = phi float [ %160, %157 ], [ %55, %14 ]
  %172 = phi i32 [ %162, %157 ], [ %88, %14 ]
  %173 = phi i32 [ %163, %157 ], [ %89, %14 ]
  %174 = phi i32 [ %164, %157 ], [ %90, %14 ]
  %175 = phi i32 [ %165, %157 ], [ %91, %14 ]
  %176 = fmul contract float %171, %13
  %177 = sext i32 %175 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7
  %180 = fmul contract float %179, %8
  %181 = fadd contract float %176, %180
  %182 = sext i32 %174 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7
  %185 = fmul contract float %184, %7
  %186 = fadd contract float %181, %185
  %187 = sext i32 %172 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %1, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7
  %190 = fmul contract float %189, %10
  %191 = fadd contract float %186, %190
  %192 = sext i32 %173 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %1, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = fmul contract float %194, %9
  %196 = fadd contract float %191, %195
  %197 = fadd contract float %169, %196
  %198 = fadd contract float %168, %197
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !7
  %201 = fmul contract float %200, %3
  %202 = fadd contract float %201, %198
  %203 = fadd contract float %85, %202
  %204 = getelementptr inbounds float, float addrspace(1)* %2, i64 %170
  store float %203, float addrspace(1)* %204, align 4, !tbaa !7
  ret void

205:                                              ; preds = %205, %96
  %206 = phi i32 [ %91, %96 ], [ %293, %205 ]
  %207 = phi i32 [ %90, %96 ], [ %292, %205 ]
  %208 = phi i32 [ %89, %96 ], [ %291, %205 ]
  %209 = phi i32 [ %88, %96 ], [ %290, %205 ]
  %210 = phi float [ %55, %96 ], [ %257, %205 ]
  %211 = phi float [ %51, %96 ], [ %217, %205 ]
  %212 = phi i32 [ %52, %96 ], [ %254, %205 ]
  %213 = phi i32 [ 0, %96 ], [ %294, %205 ]
  %214 = add nsw i32 %212, %34
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %1, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !7
  %218 = fmul contract float %210, %13
  %219 = sext i32 %206 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !7
  %222 = fmul contract float %221, %8
  %223 = fadd contract float %218, %222
  %224 = sext i32 %207 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %1, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = fmul contract float %226, %7
  %228 = fadd contract float %223, %227
  %229 = sext i32 %209 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %1, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !7
  %232 = fmul contract float %231, %10
  %233 = fadd contract float %228, %232
  %234 = sext i32 %208 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %1, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !7
  %237 = fmul contract float %236, %9
  %238 = fadd contract float %233, %237
  %239 = fmul contract float %211, %12
  %240 = fadd contract float %239, %238
  %241 = fmul contract float %217, %11
  %242 = fadd contract float %241, %240
  %243 = sext i32 %212 to i64
  %244 = getelementptr inbounds float, float addrspace(1)* %0, i64 %243
  %245 = load float, float addrspace(1)* %244, align 4, !tbaa !7
  %246 = fmul contract float %245, %3
  %247 = fadd contract float %246, %242
  %248 = fadd contract float %85, %247
  %249 = getelementptr inbounds float, float addrspace(1)* %2, i64 %243
  store float %248, float addrspace(1)* %249, align 4, !tbaa !7
  %250 = add nsw i32 %209, %34
  %251 = add nsw i32 %208, %34
  %252 = add nsw i32 %207, %34
  %253 = add nsw i32 %206, %34
  %254 = add nsw i32 %214, %34
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %1, i64 %255
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !7
  %258 = fmul contract float %217, %13
  %259 = sext i32 %253 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %1, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !7
  %262 = fmul contract float %261, %8
  %263 = fadd contract float %258, %262
  %264 = sext i32 %252 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %1, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !7
  %267 = fmul contract float %266, %7
  %268 = fadd contract float %263, %267
  %269 = sext i32 %250 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %1, i64 %269
  %271 = load float, float addrspace(1)* %270, align 4, !tbaa !7
  %272 = fmul contract float %271, %10
  %273 = fadd contract float %268, %272
  %274 = sext i32 %251 to i64
  %275 = getelementptr inbounds float, float addrspace(1)* %1, i64 %274
  %276 = load float, float addrspace(1)* %275, align 4, !tbaa !7
  %277 = fmul contract float %276, %9
  %278 = fadd contract float %273, %277
  %279 = fmul contract float %210, %12
  %280 = fadd contract float %279, %278
  %281 = fmul contract float %257, %11
  %282 = fadd contract float %281, %280
  %283 = sext i32 %214 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %0, i64 %283
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !7
  %286 = fmul contract float %285, %3
  %287 = fadd contract float %286, %282
  %288 = fadd contract float %85, %287
  %289 = getelementptr inbounds float, float addrspace(1)* %2, i64 %283
  store float %288, float addrspace(1)* %289, align 4, !tbaa !7
  %290 = add nsw i32 %250, %34
  %291 = add nsw i32 %251, %34
  %292 = add nsw i32 %252, %34
  %293 = add nsw i32 %253, %34
  %294 = add i32 %213, 2
  %295 = icmp eq i32 %213, %98
  br i1 %295, label %99, label %205, !llvm.loop !11
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
