; ModuleID = '../data/hip_kernels/1291/0/main.cu'
source_filename = "../data/hip_kernels/1291/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13computeMomentPaS_Pfii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = icmp sgt i32 %4, 0
  br i1 %7, label %8, label %61

8:                                                ; preds = %5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = mul i32 %14, %13
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = mul i32 %21, %20
  %23 = add i32 %22, %16
  %24 = mul i32 %23, %4
  %25 = add i32 %15, %9
  %26 = mul i32 %25, %4
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 -12
  %28 = getelementptr inbounds float, float addrspace(1)* %2, i64 -11
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 -10
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 -9
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 -8
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 -7
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 -6
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 -5
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 -4
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 -3
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 -2
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 -1
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 3
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 4
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 5
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 6
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 7
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 8
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 9
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 10
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 11
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 12
  br label %51

51:                                               ; preds = %8, %62
  %52 = phi i32 [ 0, %8 ], [ %63, %62 ]
  %53 = add i32 %24, %52
  %54 = icmp slt i32 %53, %3
  %55 = add i32 %53, %3
  %56 = mul nsw i32 %53, %3
  %57 = add i32 %55, -2
  %58 = add i32 %55, -1
  %59 = add i32 %55, 1
  %60 = add i32 %55, 2
  br label %65

61:                                               ; preds = %62, %5
  ret void

62:                                               ; preds = %302
  %63 = add nuw nsw i32 %52, 1
  %64 = icmp eq i32 %63, %4
  br i1 %64, label %61, label %51, !llvm.loop !7

65:                                               ; preds = %51, %302
  %66 = phi i32 [ 0, %51 ], [ %303, %302 ]
  %67 = add i32 %26, %66
  %68 = icmp slt i32 %67, %3
  %69 = select i1 %54, i1 %68, i1 false
  br i1 %69, label %70, label %302

70:                                               ; preds = %65
  %71 = add i32 %67, %3
  %72 = add i32 %71, -2
  %73 = srem i32 %57, %3
  %74 = mul nsw i32 %73, %3
  %75 = srem i32 %72, %3
  %76 = load float, float addrspace(1)* %27, align 4, !tbaa !9
  %77 = add nsw i32 %74, %75
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !13
  %81 = sitofp i8 %80 to float
  %82 = fmul contract float %76, %81
  %83 = fadd contract float %82, 0.000000e+00
  %84 = add i32 %71, -1
  %85 = srem i32 %84, %3
  %86 = load float, float addrspace(1)* %28, align 4, !tbaa !9
  %87 = add nsw i32 %74, %85
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %88
  %90 = load i8, i8 addrspace(1)* %89, align 1, !tbaa !13
  %91 = sitofp i8 %90 to float
  %92 = fmul contract float %86, %91
  %93 = fadd contract float %83, %92
  %94 = srem i32 %71, %3
  %95 = load float, float addrspace(1)* %29, align 4, !tbaa !9
  %96 = add nsw i32 %74, %94
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %97
  %99 = load i8, i8 addrspace(1)* %98, align 1, !tbaa !13
  %100 = sitofp i8 %99 to float
  %101 = fmul contract float %95, %100
  %102 = fadd contract float %93, %101
  %103 = add i32 %71, 1
  %104 = srem i32 %103, %3
  %105 = load float, float addrspace(1)* %30, align 4, !tbaa !9
  %106 = add nsw i32 %74, %104
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %107
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !13
  %110 = sitofp i8 %109 to float
  %111 = fmul contract float %105, %110
  %112 = fadd contract float %102, %111
  %113 = add i32 %71, 2
  %114 = srem i32 %113, %3
  %115 = load float, float addrspace(1)* %31, align 4, !tbaa !9
  %116 = add nsw i32 %74, %114
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %117
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !13
  %120 = sitofp i8 %119 to float
  %121 = fmul contract float %115, %120
  %122 = fadd contract float %112, %121
  %123 = srem i32 %58, %3
  %124 = mul nsw i32 %123, %3
  %125 = load float, float addrspace(1)* %32, align 4, !tbaa !9
  %126 = add nsw i32 %124, %75
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %127
  %129 = load i8, i8 addrspace(1)* %128, align 1, !tbaa !13
  %130 = sitofp i8 %129 to float
  %131 = fmul contract float %125, %130
  %132 = fadd contract float %122, %131
  %133 = load float, float addrspace(1)* %33, align 4, !tbaa !9
  %134 = add nsw i32 %124, %85
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %135
  %137 = load i8, i8 addrspace(1)* %136, align 1, !tbaa !13
  %138 = sitofp i8 %137 to float
  %139 = fmul contract float %133, %138
  %140 = fadd contract float %132, %139
  %141 = load float, float addrspace(1)* %34, align 4, !tbaa !9
  %142 = add nsw i32 %124, %94
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %143
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !13
  %146 = sitofp i8 %145 to float
  %147 = fmul contract float %141, %146
  %148 = fadd contract float %140, %147
  %149 = load float, float addrspace(1)* %35, align 4, !tbaa !9
  %150 = add nsw i32 %124, %104
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %151
  %153 = load i8, i8 addrspace(1)* %152, align 1, !tbaa !13
  %154 = sitofp i8 %153 to float
  %155 = fmul contract float %149, %154
  %156 = fadd contract float %148, %155
  %157 = load float, float addrspace(1)* %36, align 4, !tbaa !9
  %158 = add nsw i32 %124, %114
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %159
  %161 = load i8, i8 addrspace(1)* %160, align 1, !tbaa !13
  %162 = sitofp i8 %161 to float
  %163 = fmul contract float %157, %162
  %164 = fadd contract float %156, %163
  %165 = srem i32 %55, %3
  %166 = mul nsw i32 %165, %3
  %167 = load float, float addrspace(1)* %37, align 4, !tbaa !9
  %168 = add nsw i32 %166, %75
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %169
  %171 = load i8, i8 addrspace(1)* %170, align 1, !tbaa !13
  %172 = sitofp i8 %171 to float
  %173 = fmul contract float %167, %172
  %174 = fadd contract float %164, %173
  %175 = load float, float addrspace(1)* %38, align 4, !tbaa !9
  %176 = add nsw i32 %166, %85
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %177
  %179 = load i8, i8 addrspace(1)* %178, align 1, !tbaa !13
  %180 = sitofp i8 %179 to float
  %181 = fmul contract float %175, %180
  %182 = fadd contract float %174, %181
  %183 = load float, float addrspace(1)* %2, align 4, !tbaa !9
  %184 = add nsw i32 %166, %94
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %185
  %187 = load i8, i8 addrspace(1)* %186, align 1, !tbaa !13
  %188 = sitofp i8 %187 to float
  %189 = fmul contract float %183, %188
  %190 = fadd contract float %182, %189
  %191 = load float, float addrspace(1)* %39, align 4, !tbaa !9
  %192 = add nsw i32 %166, %104
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %193
  %195 = load i8, i8 addrspace(1)* %194, align 1, !tbaa !13
  %196 = sitofp i8 %195 to float
  %197 = fmul contract float %191, %196
  %198 = fadd contract float %190, %197
  %199 = load float, float addrspace(1)* %40, align 4, !tbaa !9
  %200 = add nsw i32 %166, %114
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %201
  %203 = load i8, i8 addrspace(1)* %202, align 1, !tbaa !13
  %204 = sitofp i8 %203 to float
  %205 = fmul contract float %199, %204
  %206 = fadd contract float %198, %205
  %207 = srem i32 %59, %3
  %208 = mul nsw i32 %207, %3
  %209 = load float, float addrspace(1)* %41, align 4, !tbaa !9
  %210 = add nsw i32 %208, %75
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %211
  %213 = load i8, i8 addrspace(1)* %212, align 1, !tbaa !13
  %214 = sitofp i8 %213 to float
  %215 = fmul contract float %209, %214
  %216 = fadd contract float %206, %215
  %217 = load float, float addrspace(1)* %42, align 4, !tbaa !9
  %218 = add nsw i32 %208, %85
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %219
  %221 = load i8, i8 addrspace(1)* %220, align 1, !tbaa !13
  %222 = sitofp i8 %221 to float
  %223 = fmul contract float %217, %222
  %224 = fadd contract float %216, %223
  %225 = load float, float addrspace(1)* %43, align 4, !tbaa !9
  %226 = add nsw i32 %208, %94
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %227
  %229 = load i8, i8 addrspace(1)* %228, align 1, !tbaa !13
  %230 = sitofp i8 %229 to float
  %231 = fmul contract float %225, %230
  %232 = fadd contract float %224, %231
  %233 = load float, float addrspace(1)* %44, align 4, !tbaa !9
  %234 = add nsw i32 %208, %104
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %235
  %237 = load i8, i8 addrspace(1)* %236, align 1, !tbaa !13
  %238 = sitofp i8 %237 to float
  %239 = fmul contract float %233, %238
  %240 = fadd contract float %232, %239
  %241 = load float, float addrspace(1)* %45, align 4, !tbaa !9
  %242 = add nsw i32 %208, %114
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %243
  %245 = load i8, i8 addrspace(1)* %244, align 1, !tbaa !13
  %246 = sitofp i8 %245 to float
  %247 = fmul contract float %241, %246
  %248 = fadd contract float %240, %247
  %249 = srem i32 %60, %3
  %250 = mul nsw i32 %249, %3
  %251 = load float, float addrspace(1)* %46, align 4, !tbaa !9
  %252 = add nsw i32 %250, %75
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %253
  %255 = load i8, i8 addrspace(1)* %254, align 1, !tbaa !13
  %256 = sitofp i8 %255 to float
  %257 = fmul contract float %251, %256
  %258 = fadd contract float %248, %257
  %259 = load float, float addrspace(1)* %47, align 4, !tbaa !9
  %260 = add nsw i32 %250, %85
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %261
  %263 = load i8, i8 addrspace(1)* %262, align 1, !tbaa !13
  %264 = sitofp i8 %263 to float
  %265 = fmul contract float %259, %264
  %266 = fadd contract float %258, %265
  %267 = load float, float addrspace(1)* %48, align 4, !tbaa !9
  %268 = add nsw i32 %250, %94
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %269
  %271 = load i8, i8 addrspace(1)* %270, align 1, !tbaa !13
  %272 = sitofp i8 %271 to float
  %273 = fmul contract float %267, %272
  %274 = fadd contract float %266, %273
  %275 = load float, float addrspace(1)* %49, align 4, !tbaa !9
  %276 = add nsw i32 %250, %104
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %277
  %279 = load i8, i8 addrspace(1)* %278, align 1, !tbaa !13
  %280 = sitofp i8 %279 to float
  %281 = fmul contract float %275, %280
  %282 = fadd contract float %274, %281
  %283 = load float, float addrspace(1)* %50, align 4, !tbaa !9
  %284 = add nsw i32 %250, %114
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %285
  %287 = load i8, i8 addrspace(1)* %286, align 1, !tbaa !13
  %288 = sitofp i8 %287 to float
  %289 = fmul contract float %283, %288
  %290 = fadd contract float %282, %289
  %291 = add nsw i32 %67, %56
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %292
  %294 = load i8, i8 addrspace(1)* %293, align 1, !tbaa !13
  %295 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %292
  store i8 %294, i8 addrspace(1)* %295, align 1, !tbaa !13
  %296 = fcmp contract olt float %290, 0xBEB0C6F7A0000000
  br i1 %296, label %299, label %297

297:                                              ; preds = %70
  %298 = fcmp contract ogt float %290, 0x3EB0C6F7A0000000
  br i1 %298, label %299, label %301

299:                                              ; preds = %297, %70
  %300 = phi i8 [ -1, %70 ], [ 1, %297 ]
  store i8 %300, i8 addrspace(1)* %295, align 1, !tbaa !13
  br label %301

301:                                              ; preds = %299, %297
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %302

302:                                              ; preds = %301, %65
  %303 = add nuw nsw i32 %66, 1
  %304 = icmp eq i32 %303, %4
  br i1 %304, label %62, label %65, !llvm.loop !14
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = !{!11, !11, i64 0}
!14 = distinct !{!14, !8}
