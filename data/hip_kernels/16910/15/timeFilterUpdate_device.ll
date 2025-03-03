; ModuleID = '../data/hip_kernels/16910/15/main.cu'
source_filename = "../data/hip_kernels/16910/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW = internal addrspace(3) global [243 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !5, !amdgpu.noclobber !9
  %15 = fptosi double %14 to i32
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !5, !amdgpu.noclobber !9
  %18 = fptosi double %17 to i32
  %19 = freeze i32 %18
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !5, !amdgpu.noclobber !9
  %22 = fptosi double %21 to i32
  %23 = icmp slt i32 %9, %22
  %24 = icmp sgt i32 %19, 0
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %104

26:                                               ; preds = %8
  %27 = and i32 %19, 3
  %28 = icmp ult i32 %19, 4
  br i1 %28, label %84, label %29

29:                                               ; preds = %26
  %30 = and i32 %19, -4
  br label %31

31:                                               ; preds = %31, %29
  %32 = phi i32 [ 0, %29 ], [ %81, %31 ]
  %33 = phi i32 [ 0, %29 ], [ %82, %31 ]
  %34 = mul i32 %32, %15
  %35 = add i32 %34, %10
  %36 = mul i32 %35, %22
  %37 = add i32 %36, %9
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !10, !amdgpu.noclobber !9
  %41 = mul nsw i32 %32, %22
  %42 = add nsw i32 %41, %9
  %43 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %42
  %44 = addrspacecast float addrspace(3)* %43 to float*
  store volatile float %40, float* %44, align 4, !tbaa !10
  %45 = or i32 %32, 1
  %46 = mul i32 %45, %15
  %47 = add i32 %46, %10
  %48 = mul i32 %47, %22
  %49 = add i32 %48, %9
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !10, !amdgpu.noclobber !9
  %53 = mul nsw i32 %45, %22
  %54 = add nsw i32 %53, %9
  %55 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %54
  %56 = addrspacecast float addrspace(3)* %55 to float*
  store volatile float %52, float* %56, align 4, !tbaa !10
  %57 = or i32 %32, 2
  %58 = mul i32 %57, %15
  %59 = add i32 %58, %10
  %60 = mul i32 %59, %22
  %61 = add i32 %60, %9
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !10, !amdgpu.noclobber !9
  %65 = mul nsw i32 %57, %22
  %66 = add nsw i32 %65, %9
  %67 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %66
  %68 = addrspacecast float addrspace(3)* %67 to float*
  store volatile float %64, float* %68, align 4, !tbaa !10
  %69 = or i32 %32, 3
  %70 = mul i32 %69, %15
  %71 = add i32 %70, %10
  %72 = mul i32 %71, %22
  %73 = add i32 %72, %9
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !10, !amdgpu.noclobber !9
  %77 = mul nsw i32 %69, %22
  %78 = add nsw i32 %77, %9
  %79 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %78
  %80 = addrspacecast float addrspace(3)* %79 to float*
  store volatile float %76, float* %80, align 4, !tbaa !10
  %81 = add nuw nsw i32 %32, 4
  %82 = add i32 %33, 4
  %83 = icmp eq i32 %82, %30
  br i1 %83, label %84, label %31, !llvm.loop !12

84:                                               ; preds = %31, %26
  %85 = phi i32 [ 0, %26 ], [ %81, %31 ]
  %86 = icmp eq i32 %27, 0
  br i1 %86, label %104, label %87

87:                                               ; preds = %84, %87
  %88 = phi i32 [ %101, %87 ], [ %85, %84 ]
  %89 = phi i32 [ %102, %87 ], [ 0, %84 ]
  %90 = mul i32 %88, %15
  %91 = add i32 %90, %10
  %92 = mul i32 %91, %22
  %93 = add i32 %92, %9
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !10, !amdgpu.noclobber !9
  %97 = mul nsw i32 %88, %22
  %98 = add nsw i32 %97, %9
  %99 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %98
  %100 = addrspacecast float addrspace(3)* %99 to float*
  store volatile float %96, float* %100, align 4, !tbaa !10
  %101 = add nuw nsw i32 %88, 1
  %102 = add i32 %89, 1
  %103 = icmp eq i32 %102, %27
  br i1 %103, label %104, label %87, !llvm.loop !14

104:                                              ; preds = %84, %87, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %105 = bitcast i32 addrspace(1)* %7 to <2 x i32> addrspace(1)*
  %106 = load <2 x i32>, <2 x i32> addrspace(1)* %105, align 4, !tbaa !16
  %107 = extractelement <2 x i32> %106, i64 0
  %108 = extractelement <2 x i32> %106, i64 1
  %109 = icmp slt i32 %108, %107
  br i1 %109, label %110, label %274

110:                                              ; preds = %104
  %111 = mul nsw i32 %10, %15
  %112 = sub nsw i32 %12, %22
  %113 = icmp sgt i32 %22, 0
  %114 = mul nsw i32 %10, %12
  %115 = and i32 %22, 7
  %116 = icmp ult i32 %22, 8
  %117 = and i32 %22, -8
  %118 = icmp eq i32 %115, 0
  br label %119

119:                                              ; preds = %110, %271
  %120 = phi i32 [ %108, %110 ], [ %272, %271 ]
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !16, !amdgpu.noclobber !9
  %124 = add nsw i32 %123, %111
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %125
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !18, !range !20, !amdgpu.noclobber !9
  %128 = icmp eq i8 %127, 0
  br i1 %128, label %271, label %129

129:                                              ; preds = %119
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %121
  %131 = load i32, i32 addrspace(1)* %130, align 4, !tbaa !16, !amdgpu.noclobber !9
  %132 = sub nsw i32 %131, %22
  %133 = add nsw i32 %132, %9
  %134 = icmp sgt i32 %133, -1
  %135 = icmp slt i32 %133, %112
  %136 = select i1 %134, i1 %135, i1 false
  br i1 %136, label %137, label %271

137:                                              ; preds = %129
  br i1 %24, label %138, label %266

138:                                              ; preds = %137, %262
  %139 = phi float [ %263, %262 ], [ 0.000000e+00, %137 ]
  %140 = phi i32 [ %264, %262 ], [ 0, %137 ]
  br i1 %113, label %141, label %262

141:                                              ; preds = %138
  %142 = mul nsw i32 %140, %22
  %143 = mul i32 %140, %15
  %144 = add i32 %143, %10
  %145 = mul i32 %144, %12
  %146 = add i32 %145, %133
  br i1 %116, label %241, label %147

147:                                              ; preds = %141, %147
  %148 = phi float [ %237, %147 ], [ %139, %141 ]
  %149 = phi i32 [ %238, %147 ], [ 0, %141 ]
  %150 = phi i32 [ %239, %147 ], [ 0, %141 ]
  %151 = add nsw i32 %149, %142
  %152 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %151
  %153 = addrspacecast float addrspace(3)* %152 to float*
  %154 = load volatile float, float* %153, align 4, !tbaa !10
  %155 = add i32 %146, %149
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !10
  %159 = fmul contract float %154, %158
  %160 = fadd contract float %148, %159
  %161 = or i32 %149, 1
  %162 = add nsw i32 %161, %142
  %163 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %162
  %164 = addrspacecast float addrspace(3)* %163 to float*
  %165 = load volatile float, float* %164, align 4, !tbaa !10
  %166 = add i32 %146, %161
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !10
  %170 = fmul contract float %165, %169
  %171 = fadd contract float %160, %170
  %172 = or i32 %149, 2
  %173 = add nsw i32 %172, %142
  %174 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %173
  %175 = addrspacecast float addrspace(3)* %174 to float*
  %176 = load volatile float, float* %175, align 4, !tbaa !10
  %177 = add i32 %146, %172
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %1, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !10
  %181 = fmul contract float %176, %180
  %182 = fadd contract float %171, %181
  %183 = or i32 %149, 3
  %184 = add nsw i32 %183, %142
  %185 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %184
  %186 = addrspacecast float addrspace(3)* %185 to float*
  %187 = load volatile float, float* %186, align 4, !tbaa !10
  %188 = add i32 %146, %183
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %1, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !10
  %192 = fmul contract float %187, %191
  %193 = fadd contract float %182, %192
  %194 = or i32 %149, 4
  %195 = add nsw i32 %194, %142
  %196 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %195
  %197 = addrspacecast float addrspace(3)* %196 to float*
  %198 = load volatile float, float* %197, align 4, !tbaa !10
  %199 = add i32 %146, %194
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %1, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !10
  %203 = fmul contract float %198, %202
  %204 = fadd contract float %193, %203
  %205 = or i32 %149, 5
  %206 = add nsw i32 %205, %142
  %207 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %206
  %208 = addrspacecast float addrspace(3)* %207 to float*
  %209 = load volatile float, float* %208, align 4, !tbaa !10
  %210 = add i32 %146, %205
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %1, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !10
  %214 = fmul contract float %209, %213
  %215 = fadd contract float %204, %214
  %216 = or i32 %149, 6
  %217 = add nsw i32 %216, %142
  %218 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %217
  %219 = addrspacecast float addrspace(3)* %218 to float*
  %220 = load volatile float, float* %219, align 4, !tbaa !10
  %221 = add i32 %146, %216
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %1, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !10
  %225 = fmul contract float %220, %224
  %226 = fadd contract float %215, %225
  %227 = or i32 %149, 7
  %228 = add nsw i32 %227, %142
  %229 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %228
  %230 = addrspacecast float addrspace(3)* %229 to float*
  %231 = load volatile float, float* %230, align 4, !tbaa !10
  %232 = add i32 %146, %227
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %1, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !10
  %236 = fmul contract float %231, %235
  %237 = fadd contract float %226, %236
  %238 = add nuw nsw i32 %149, 8
  %239 = add i32 %150, 8
  %240 = icmp eq i32 %239, %117
  br i1 %240, label %241, label %147, !llvm.loop !21

241:                                              ; preds = %147, %141
  %242 = phi float [ undef, %141 ], [ %237, %147 ]
  %243 = phi float [ %139, %141 ], [ %237, %147 ]
  %244 = phi i32 [ 0, %141 ], [ %238, %147 ]
  br i1 %118, label %262, label %245

245:                                              ; preds = %241, %245
  %246 = phi float [ %258, %245 ], [ %243, %241 ]
  %247 = phi i32 [ %259, %245 ], [ %244, %241 ]
  %248 = phi i32 [ %260, %245 ], [ 0, %241 ]
  %249 = add nsw i32 %247, %142
  %250 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ16timeFilterUpdatePKdPKfS2_PKbPfPKiS7_S7_E2sW, i32 0, i32 %249
  %251 = addrspacecast float addrspace(3)* %250 to float*
  %252 = load volatile float, float* %251, align 4, !tbaa !10
  %253 = add i32 %146, %247
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %1, i64 %254
  %256 = load float, float addrspace(1)* %255, align 4, !tbaa !10
  %257 = fmul contract float %252, %256
  %258 = fadd contract float %246, %257
  %259 = add nuw nsw i32 %247, 1
  %260 = add i32 %248, 1
  %261 = icmp eq i32 %260, %115
  br i1 %261, label %262, label %245, !llvm.loop !22

262:                                              ; preds = %241, %245, %138
  %263 = phi float [ %139, %138 ], [ %242, %241 ], [ %258, %245 ]
  %264 = add nuw nsw i32 %140, 1
  %265 = icmp eq i32 %264, %19
  br i1 %265, label %266, label %138, !llvm.loop !23

266:                                              ; preds = %262, %137
  %267 = phi float [ 0.000000e+00, %137 ], [ %263, %262 ]
  %268 = add nsw i32 %133, %114
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %4, i64 %269
  store float %267, float addrspace(1)* %270, align 4, !tbaa !10
  br label %271

271:                                              ; preds = %119, %266, %129
  %272 = add nsw i32 %120, 1
  %273 = icmp slt i32 %272, %107
  br i1 %273, label %119, label %274, !llvm.loop !24

274:                                              ; preds = %271, %104
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !7, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"bool", !7, i64 0}
!20 = !{i8 0, i8 2}
!21 = distinct !{!21, !13}
!22 = distinct !{!22, !15}
!23 = distinct !{!23, !13}
!24 = distinct !{!24, !13}
