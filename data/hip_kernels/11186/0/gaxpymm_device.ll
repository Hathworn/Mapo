; ModuleID = '../data/hip_kernels/11186/0/main.cu'
source_filename = "../data/hip_kernels/11186/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@dots_s = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7gaxpymmPdS_S_iii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = icmp slt i32 %7, %3
  %10 = icmp slt i32 %8, %4
  %11 = select i1 %9, i1 %10, i1 false
  br i1 %11, label %12, label %290

12:                                               ; preds = %6
  %13 = icmp slt i32 %5, 1
  br i1 %13, label %42, label %14

14:                                               ; preds = %12
  %15 = mul nsw i32 %7, %4
  %16 = add nsw i32 %15, %8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds double, double addrspace(1)* %1, i64 %17
  %19 = load double, double addrspace(1)* %18, align 8, !tbaa !5, !amdgpu.noclobber !9
  %20 = mul nsw i32 %8, %5
  %21 = mul nsw i32 %15, %5
  %22 = and i32 %5, 7
  %23 = icmp ult i32 %5, 8
  br i1 %23, label %26, label %24

24:                                               ; preds = %14
  %25 = and i32 %5, -8
  br label %55

26:                                               ; preds = %55, %14
  %27 = phi i32 [ 0, %14 ], [ %121, %55 ]
  %28 = icmp eq i32 %22, 0
  br i1 %28, label %42, label %29

29:                                               ; preds = %26, %29
  %30 = phi i32 [ %39, %29 ], [ %27, %26 ]
  %31 = phi i32 [ %40, %29 ], [ 0, %26 ]
  %32 = add i32 %30, %20
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !5, !amdgpu.noclobber !9
  %36 = fmul contract double %19, %35
  %37 = add i32 %32, %21
  %38 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %37
  store double %36, double addrspace(3)* %38, align 8, !tbaa !5
  %39 = add nuw nsw i32 %30, 1
  %40 = add i32 %31, 1
  %41 = icmp eq i32 %40, %22
  br i1 %41, label %42, label %29, !llvm.loop !10

42:                                               ; preds = %26, %29, %12
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp ne i32 %8, 0
  %44 = select i1 %43, i1 true, i1 %13
  br i1 %44, label %290, label %45

45:                                               ; preds = %42
  %46 = icmp sgt i32 %4, 1
  %47 = mul nsw i32 %7, %4
  %48 = mul nsw i32 %47, %5
  %49 = add i32 %4, -1
  %50 = add i32 %4, -2
  %51 = and i32 %49, 7
  %52 = icmp ult i32 %50, 7
  %53 = and i32 %49, -8
  %54 = icmp eq i32 %51, 0
  br label %124

55:                                               ; preds = %55, %24
  %56 = phi i32 [ 0, %24 ], [ %121, %55 ]
  %57 = phi i32 [ 0, %24 ], [ %122, %55 ]
  %58 = add i32 %56, %20
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %2, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !5, !amdgpu.noclobber !9
  %62 = fmul contract double %19, %61
  %63 = add i32 %58, %21
  %64 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %63
  store double %62, double addrspace(3)* %64, align 8, !tbaa !5
  %65 = or i32 %56, 1
  %66 = add i32 %65, %20
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %2, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !5, !amdgpu.noclobber !9
  %70 = fmul contract double %19, %69
  %71 = add i32 %66, %21
  %72 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %71
  store double %70, double addrspace(3)* %72, align 8, !tbaa !5
  %73 = or i32 %56, 2
  %74 = add i32 %73, %20
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %2, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !5, !amdgpu.noclobber !9
  %78 = fmul contract double %19, %77
  %79 = add i32 %74, %21
  %80 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %79
  store double %78, double addrspace(3)* %80, align 8, !tbaa !5
  %81 = or i32 %56, 3
  %82 = add i32 %81, %20
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %2, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !5, !amdgpu.noclobber !9
  %86 = fmul contract double %19, %85
  %87 = add i32 %82, %21
  %88 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %87
  store double %86, double addrspace(3)* %88, align 8, !tbaa !5
  %89 = or i32 %56, 4
  %90 = add i32 %89, %20
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %2, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !5, !amdgpu.noclobber !9
  %94 = fmul contract double %19, %93
  %95 = add i32 %90, %21
  %96 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %95
  store double %94, double addrspace(3)* %96, align 8, !tbaa !5
  %97 = or i32 %56, 5
  %98 = add i32 %97, %20
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %2, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !5, !amdgpu.noclobber !9
  %102 = fmul contract double %19, %101
  %103 = add i32 %98, %21
  %104 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %103
  store double %102, double addrspace(3)* %104, align 8, !tbaa !5
  %105 = or i32 %56, 6
  %106 = add i32 %105, %20
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %2, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !5, !amdgpu.noclobber !9
  %110 = fmul contract double %19, %109
  %111 = add i32 %106, %21
  %112 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %111
  store double %110, double addrspace(3)* %112, align 8, !tbaa !5
  %113 = or i32 %56, 7
  %114 = add i32 %113, %20
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double addrspace(1)* %2, i64 %115
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !5, !amdgpu.noclobber !9
  %118 = fmul contract double %19, %117
  %119 = add i32 %114, %21
  %120 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %119
  store double %118, double addrspace(3)* %120, align 8, !tbaa !5
  %121 = add nuw nsw i32 %56, 8
  %122 = add i32 %57, 8
  %123 = icmp eq i32 %122, %25
  br i1 %123, label %26, label %55, !llvm.loop !12

124:                                              ; preds = %45, %157
  %125 = phi i32 [ 0, %45 ], [ %158, %157 ]
  br i1 %46, label %126, label %157

126:                                              ; preds = %124
  %127 = add i32 %125, %48
  %128 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %127
  %129 = load double, double addrspace(3)* %128, align 8, !tbaa !5
  br i1 %52, label %139, label %160

130:                                              ; preds = %157
  br i1 %13, label %290, label %131

131:                                              ; preds = %130
  %132 = mul nsw i32 %7, %4
  %133 = mul nsw i32 %132, %5
  %134 = mul nsw i32 %7, %5
  %135 = and i32 %5, 7
  %136 = icmp ult i32 %5, 8
  br i1 %136, label %275, label %137

137:                                              ; preds = %131
  %138 = and i32 %5, -8
  br label %214

139:                                              ; preds = %160, %126
  %140 = phi double [ undef, %126 ], [ %210, %160 ]
  %141 = phi double [ %129, %126 ], [ %210, %160 ]
  %142 = phi i32 [ 1, %126 ], [ %211, %160 ]
  br i1 %54, label %155, label %143

143:                                              ; preds = %139, %143
  %144 = phi double [ %151, %143 ], [ %141, %139 ]
  %145 = phi i32 [ %152, %143 ], [ %142, %139 ]
  %146 = phi i32 [ %153, %143 ], [ 0, %139 ]
  %147 = mul nsw i32 %145, %5
  %148 = add i32 %127, %147
  %149 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %148
  %150 = load double, double addrspace(3)* %149, align 8, !tbaa !5
  %151 = fadd contract double %150, %144
  %152 = add nuw nsw i32 %145, 1
  %153 = add i32 %146, 1
  %154 = icmp eq i32 %153, %51
  br i1 %154, label %155, label %143, !llvm.loop !14

155:                                              ; preds = %143, %139
  %156 = phi double [ %140, %139 ], [ %151, %143 ]
  store double %156, double addrspace(3)* %128, align 8, !tbaa !5
  br label %157

157:                                              ; preds = %155, %124
  %158 = add nuw nsw i32 %125, 1
  %159 = icmp eq i32 %158, %5
  br i1 %159, label %130, label %124, !llvm.loop !15

160:                                              ; preds = %126, %160
  %161 = phi double [ %210, %160 ], [ %129, %126 ]
  %162 = phi i32 [ %211, %160 ], [ 1, %126 ]
  %163 = phi i32 [ %212, %160 ], [ 0, %126 ]
  %164 = mul nsw i32 %162, %5
  %165 = add i32 %127, %164
  %166 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %165
  %167 = load double, double addrspace(3)* %166, align 8, !tbaa !5
  %168 = fadd contract double %167, %161
  %169 = add nuw nsw i32 %162, 1
  %170 = mul nsw i32 %169, %5
  %171 = add i32 %127, %170
  %172 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %171
  %173 = load double, double addrspace(3)* %172, align 8, !tbaa !5
  %174 = fadd contract double %173, %168
  %175 = add nuw nsw i32 %162, 2
  %176 = mul nsw i32 %175, %5
  %177 = add i32 %127, %176
  %178 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %177
  %179 = load double, double addrspace(3)* %178, align 8, !tbaa !5
  %180 = fadd contract double %179, %174
  %181 = add nuw nsw i32 %162, 3
  %182 = mul nsw i32 %181, %5
  %183 = add i32 %127, %182
  %184 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %183
  %185 = load double, double addrspace(3)* %184, align 8, !tbaa !5
  %186 = fadd contract double %185, %180
  %187 = add nuw nsw i32 %162, 4
  %188 = mul nsw i32 %187, %5
  %189 = add i32 %127, %188
  %190 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %189
  %191 = load double, double addrspace(3)* %190, align 8, !tbaa !5
  %192 = fadd contract double %191, %186
  %193 = add nuw nsw i32 %162, 5
  %194 = mul nsw i32 %193, %5
  %195 = add i32 %127, %194
  %196 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %195
  %197 = load double, double addrspace(3)* %196, align 8, !tbaa !5
  %198 = fadd contract double %197, %192
  %199 = add nuw nsw i32 %162, 6
  %200 = mul nsw i32 %199, %5
  %201 = add i32 %127, %200
  %202 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %201
  %203 = load double, double addrspace(3)* %202, align 8, !tbaa !5
  %204 = fadd contract double %203, %198
  %205 = add nuw nsw i32 %162, 7
  %206 = mul nsw i32 %205, %5
  %207 = add i32 %127, %206
  %208 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %207
  %209 = load double, double addrspace(3)* %208, align 8, !tbaa !5
  %210 = fadd contract double %209, %204
  %211 = add nuw nsw i32 %162, 8
  %212 = add i32 %163, 8
  %213 = icmp eq i32 %212, %53
  br i1 %213, label %139, label %160, !llvm.loop !16

214:                                              ; preds = %214, %137
  %215 = phi i32 [ 0, %137 ], [ %272, %214 ]
  %216 = phi i32 [ 0, %137 ], [ %273, %214 ]
  %217 = add nsw i32 %215, %133
  %218 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %217
  %219 = load double, double addrspace(3)* %218, align 8, !tbaa !5
  %220 = add nsw i32 %215, %134
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds double, double addrspace(1)* %0, i64 %221
  store double %219, double addrspace(1)* %222, align 8, !tbaa !5
  %223 = or i32 %215, 1
  %224 = add nsw i32 %223, %133
  %225 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %224
  %226 = load double, double addrspace(3)* %225, align 8, !tbaa !5
  %227 = add nsw i32 %223, %134
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds double, double addrspace(1)* %0, i64 %228
  store double %226, double addrspace(1)* %229, align 8, !tbaa !5
  %230 = or i32 %215, 2
  %231 = add nsw i32 %230, %133
  %232 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %231
  %233 = load double, double addrspace(3)* %232, align 8, !tbaa !5
  %234 = add nsw i32 %230, %134
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds double, double addrspace(1)* %0, i64 %235
  store double %233, double addrspace(1)* %236, align 8, !tbaa !5
  %237 = or i32 %215, 3
  %238 = add nsw i32 %237, %133
  %239 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %238
  %240 = load double, double addrspace(3)* %239, align 8, !tbaa !5
  %241 = add nsw i32 %237, %134
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds double, double addrspace(1)* %0, i64 %242
  store double %240, double addrspace(1)* %243, align 8, !tbaa !5
  %244 = or i32 %215, 4
  %245 = add nsw i32 %244, %133
  %246 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %245
  %247 = load double, double addrspace(3)* %246, align 8, !tbaa !5
  %248 = add nsw i32 %244, %134
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds double, double addrspace(1)* %0, i64 %249
  store double %247, double addrspace(1)* %250, align 8, !tbaa !5
  %251 = or i32 %215, 5
  %252 = add nsw i32 %251, %133
  %253 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %252
  %254 = load double, double addrspace(3)* %253, align 8, !tbaa !5
  %255 = add nsw i32 %251, %134
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds double, double addrspace(1)* %0, i64 %256
  store double %254, double addrspace(1)* %257, align 8, !tbaa !5
  %258 = or i32 %215, 6
  %259 = add nsw i32 %258, %133
  %260 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %259
  %261 = load double, double addrspace(3)* %260, align 8, !tbaa !5
  %262 = add nsw i32 %258, %134
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds double, double addrspace(1)* %0, i64 %263
  store double %261, double addrspace(1)* %264, align 8, !tbaa !5
  %265 = or i32 %215, 7
  %266 = add nsw i32 %265, %133
  %267 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %266
  %268 = load double, double addrspace(3)* %267, align 8, !tbaa !5
  %269 = add nsw i32 %265, %134
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds double, double addrspace(1)* %0, i64 %270
  store double %268, double addrspace(1)* %271, align 8, !tbaa !5
  %272 = add nuw nsw i32 %215, 8
  %273 = add i32 %216, 8
  %274 = icmp eq i32 %273, %138
  br i1 %274, label %275, label %214, !llvm.loop !17

275:                                              ; preds = %214, %131
  %276 = phi i32 [ 0, %131 ], [ %272, %214 ]
  %277 = icmp eq i32 %135, 0
  br i1 %277, label %290, label %278

278:                                              ; preds = %275, %278
  %279 = phi i32 [ %287, %278 ], [ %276, %275 ]
  %280 = phi i32 [ %288, %278 ], [ 0, %275 ]
  %281 = add nsw i32 %279, %133
  %282 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %281
  %283 = load double, double addrspace(3)* %282, align 8, !tbaa !5
  %284 = add nsw i32 %279, %134
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds double, double addrspace(1)* %0, i64 %285
  store double %283, double addrspace(1)* %286, align 8, !tbaa !5
  %287 = add nuw nsw i32 %279, 1
  %288 = add i32 %280, 1
  %289 = icmp eq i32 %288, %135
  br i1 %289, label %290, label %278, !llvm.loop !18

290:                                              ; preds = %275, %278, %42, %130, %6
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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !11}
