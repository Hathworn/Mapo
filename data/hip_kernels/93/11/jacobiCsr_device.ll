; ModuleID = '../data/hip_kernels/93/11/main.cu'
source_filename = "../data/hip_kernels/93/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9jacobiCsrPfPKfS1_PKiS3_S1_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %6
  br i1 %17, label %18, label %660

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = add nsw i32 %16, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = icmp slt i32 %21, %25
  %27 = getelementptr inbounds float, float addrspace(1)* %5, i64 %19
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  br i1 %26, label %645, label %30

30:                                               ; preds = %645, %18
  %31 = phi float [ 0.000000e+00, %18 ], [ %657, %645 ]
  %32 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %33 = fsub contract float %32, %31
  %34 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %35 = fdiv contract float %33, %34
  store float %35, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %36, label %51

36:                                               ; preds = %30, %36
  %37 = phi i32 [ %49, %36 ], [ %21, %30 ]
  %38 = phi float [ %48, %36 ], [ 0.000000e+00, %30 ]
  %39 = sext i32 %37 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !11
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %39
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !11
  %47 = fmul contract float %41, %46
  %48 = fadd contract float %38, %47
  %49 = add nsw i32 %37, 1
  %50 = icmp slt i32 %49, %25
  br i1 %50, label %36, label %51, !llvm.loop !13

51:                                               ; preds = %36, %30
  %52 = phi float [ 0.000000e+00, %30 ], [ %48, %36 ]
  %53 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %54 = fsub contract float %53, %52
  %55 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %56 = fdiv contract float %54, %55
  store float %56, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %57, label %72

57:                                               ; preds = %51, %57
  %58 = phi i32 [ %70, %57 ], [ %21, %51 ]
  %59 = phi float [ %69, %57 ], [ 0.000000e+00, %51 ]
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !11
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !11
  %68 = fmul contract float %62, %67
  %69 = fadd contract float %59, %68
  %70 = add nsw i32 %58, 1
  %71 = icmp slt i32 %70, %25
  br i1 %71, label %57, label %72, !llvm.loop !13

72:                                               ; preds = %57, %51
  %73 = phi float [ 0.000000e+00, %51 ], [ %69, %57 ]
  %74 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %75 = fsub contract float %74, %73
  %76 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %77 = fdiv contract float %75, %76
  store float %77, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %78, label %93

78:                                               ; preds = %72, %78
  %79 = phi i32 [ %91, %78 ], [ %21, %72 ]
  %80 = phi float [ %90, %78 ], [ 0.000000e+00, %72 ]
  %81 = sext i32 %79 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !11
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %81
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !11
  %89 = fmul contract float %83, %88
  %90 = fadd contract float %80, %89
  %91 = add nsw i32 %79, 1
  %92 = icmp slt i32 %91, %25
  br i1 %92, label %78, label %93, !llvm.loop !13

93:                                               ; preds = %78, %72
  %94 = phi float [ 0.000000e+00, %72 ], [ %90, %78 ]
  %95 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %96 = fsub contract float %95, %94
  %97 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %98 = fdiv contract float %96, %97
  store float %98, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %99, label %114

99:                                               ; preds = %93, %99
  %100 = phi i32 [ %112, %99 ], [ %21, %93 ]
  %101 = phi float [ %111, %99 ], [ 0.000000e+00, %93 ]
  %102 = sext i32 %100 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !11
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %102
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !11
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %101, %110
  %112 = add nsw i32 %100, 1
  %113 = icmp slt i32 %112, %25
  br i1 %113, label %99, label %114, !llvm.loop !13

114:                                              ; preds = %99, %93
  %115 = phi float [ 0.000000e+00, %93 ], [ %111, %99 ]
  %116 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %117 = fsub contract float %116, %115
  %118 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %119 = fdiv contract float %117, %118
  store float %119, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %120, label %135

120:                                              ; preds = %114, %120
  %121 = phi i32 [ %133, %120 ], [ %21, %114 ]
  %122 = phi float [ %132, %120 ], [ 0.000000e+00, %114 ]
  %123 = sext i32 %121 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !11
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %123
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !11
  %131 = fmul contract float %125, %130
  %132 = fadd contract float %122, %131
  %133 = add nsw i32 %121, 1
  %134 = icmp slt i32 %133, %25
  br i1 %134, label %120, label %135, !llvm.loop !13

135:                                              ; preds = %120, %114
  %136 = phi float [ 0.000000e+00, %114 ], [ %132, %120 ]
  %137 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %138 = fsub contract float %137, %136
  %139 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %140 = fdiv contract float %138, %139
  store float %140, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %141, label %156

141:                                              ; preds = %135, %141
  %142 = phi i32 [ %154, %141 ], [ %21, %135 ]
  %143 = phi float [ %153, %141 ], [ 0.000000e+00, %135 ]
  %144 = sext i32 %142 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !11
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %144
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !11
  %152 = fmul contract float %146, %151
  %153 = fadd contract float %143, %152
  %154 = add nsw i32 %142, 1
  %155 = icmp slt i32 %154, %25
  br i1 %155, label %141, label %156, !llvm.loop !13

156:                                              ; preds = %141, %135
  %157 = phi float [ 0.000000e+00, %135 ], [ %153, %141 ]
  %158 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %159 = fsub contract float %158, %157
  %160 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %161 = fdiv contract float %159, %160
  store float %161, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %162, label %177

162:                                              ; preds = %156, %162
  %163 = phi i32 [ %175, %162 ], [ %21, %156 ]
  %164 = phi float [ %174, %162 ], [ 0.000000e+00, %156 ]
  %165 = sext i32 %163 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !11
  %168 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %165
  %169 = load i32, i32 addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !5
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !11
  %173 = fmul contract float %167, %172
  %174 = fadd contract float %164, %173
  %175 = add nsw i32 %163, 1
  %176 = icmp slt i32 %175, %25
  br i1 %176, label %162, label %177, !llvm.loop !13

177:                                              ; preds = %162, %156
  %178 = phi float [ 0.000000e+00, %156 ], [ %174, %162 ]
  %179 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %180 = fsub contract float %179, %178
  %181 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %182 = fdiv contract float %180, %181
  store float %182, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %183, label %198

183:                                              ; preds = %177, %183
  %184 = phi i32 [ %196, %183 ], [ %21, %177 ]
  %185 = phi float [ %195, %183 ], [ 0.000000e+00, %177 ]
  %186 = sext i32 %184 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %2, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !11
  %189 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %186
  %190 = load i32, i32 addrspace(1)* %189, align 4, !tbaa !7, !amdgpu.noclobber !5
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %0, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !11
  %194 = fmul contract float %188, %193
  %195 = fadd contract float %185, %194
  %196 = add nsw i32 %184, 1
  %197 = icmp slt i32 %196, %25
  br i1 %197, label %183, label %198, !llvm.loop !13

198:                                              ; preds = %183, %177
  %199 = phi float [ 0.000000e+00, %177 ], [ %195, %183 ]
  %200 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %201 = fsub contract float %200, %199
  %202 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %203 = fdiv contract float %201, %202
  store float %203, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %204, label %219

204:                                              ; preds = %198, %204
  %205 = phi i32 [ %217, %204 ], [ %21, %198 ]
  %206 = phi float [ %216, %204 ], [ 0.000000e+00, %198 ]
  %207 = sext i32 %205 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %2, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !11
  %210 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %207
  %211 = load i32, i32 addrspace(1)* %210, align 4, !tbaa !7, !amdgpu.noclobber !5
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %0, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !11
  %215 = fmul contract float %209, %214
  %216 = fadd contract float %206, %215
  %217 = add nsw i32 %205, 1
  %218 = icmp slt i32 %217, %25
  br i1 %218, label %204, label %219, !llvm.loop !13

219:                                              ; preds = %204, %198
  %220 = phi float [ 0.000000e+00, %198 ], [ %216, %204 ]
  %221 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %222 = fsub contract float %221, %220
  %223 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %224 = fdiv contract float %222, %223
  store float %224, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %225, label %240

225:                                              ; preds = %219, %225
  %226 = phi i32 [ %238, %225 ], [ %21, %219 ]
  %227 = phi float [ %237, %225 ], [ 0.000000e+00, %219 ]
  %228 = sext i32 %226 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %2, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !11
  %231 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %228
  %232 = load i32, i32 addrspace(1)* %231, align 4, !tbaa !7, !amdgpu.noclobber !5
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !11
  %236 = fmul contract float %230, %235
  %237 = fadd contract float %227, %236
  %238 = add nsw i32 %226, 1
  %239 = icmp slt i32 %238, %25
  br i1 %239, label %225, label %240, !llvm.loop !13

240:                                              ; preds = %225, %219
  %241 = phi float [ 0.000000e+00, %219 ], [ %237, %225 ]
  %242 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %243 = fsub contract float %242, %241
  %244 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %245 = fdiv contract float %243, %244
  store float %245, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %246, label %261

246:                                              ; preds = %240, %246
  %247 = phi i32 [ %259, %246 ], [ %21, %240 ]
  %248 = phi float [ %258, %246 ], [ 0.000000e+00, %240 ]
  %249 = sext i32 %247 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %2, i64 %249
  %251 = load float, float addrspace(1)* %250, align 4, !tbaa !11
  %252 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %249
  %253 = load i32, i32 addrspace(1)* %252, align 4, !tbaa !7, !amdgpu.noclobber !5
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %0, i64 %254
  %256 = load float, float addrspace(1)* %255, align 4, !tbaa !11
  %257 = fmul contract float %251, %256
  %258 = fadd contract float %248, %257
  %259 = add nsw i32 %247, 1
  %260 = icmp slt i32 %259, %25
  br i1 %260, label %246, label %261, !llvm.loop !13

261:                                              ; preds = %246, %240
  %262 = phi float [ 0.000000e+00, %240 ], [ %258, %246 ]
  %263 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %264 = fsub contract float %263, %262
  %265 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %266 = fdiv contract float %264, %265
  store float %266, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %267, label %282

267:                                              ; preds = %261, %267
  %268 = phi i32 [ %280, %267 ], [ %21, %261 ]
  %269 = phi float [ %279, %267 ], [ 0.000000e+00, %261 ]
  %270 = sext i32 %268 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %2, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !11
  %273 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %270
  %274 = load i32, i32 addrspace(1)* %273, align 4, !tbaa !7, !amdgpu.noclobber !5
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds float, float addrspace(1)* %0, i64 %275
  %277 = load float, float addrspace(1)* %276, align 4, !tbaa !11
  %278 = fmul contract float %272, %277
  %279 = fadd contract float %269, %278
  %280 = add nsw i32 %268, 1
  %281 = icmp slt i32 %280, %25
  br i1 %281, label %267, label %282, !llvm.loop !13

282:                                              ; preds = %267, %261
  %283 = phi float [ 0.000000e+00, %261 ], [ %279, %267 ]
  %284 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %285 = fsub contract float %284, %283
  %286 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %287 = fdiv contract float %285, %286
  store float %287, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %288, label %303

288:                                              ; preds = %282, %288
  %289 = phi i32 [ %301, %288 ], [ %21, %282 ]
  %290 = phi float [ %300, %288 ], [ 0.000000e+00, %282 ]
  %291 = sext i32 %289 to i64
  %292 = getelementptr inbounds float, float addrspace(1)* %2, i64 %291
  %293 = load float, float addrspace(1)* %292, align 4, !tbaa !11
  %294 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %291
  %295 = load i32, i32 addrspace(1)* %294, align 4, !tbaa !7, !amdgpu.noclobber !5
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds float, float addrspace(1)* %0, i64 %296
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !11
  %299 = fmul contract float %293, %298
  %300 = fadd contract float %290, %299
  %301 = add nsw i32 %289, 1
  %302 = icmp slt i32 %301, %25
  br i1 %302, label %288, label %303, !llvm.loop !13

303:                                              ; preds = %288, %282
  %304 = phi float [ 0.000000e+00, %282 ], [ %300, %288 ]
  %305 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %306 = fsub contract float %305, %304
  %307 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %308 = fdiv contract float %306, %307
  store float %308, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %309, label %324

309:                                              ; preds = %303, %309
  %310 = phi i32 [ %322, %309 ], [ %21, %303 ]
  %311 = phi float [ %321, %309 ], [ 0.000000e+00, %303 ]
  %312 = sext i32 %310 to i64
  %313 = getelementptr inbounds float, float addrspace(1)* %2, i64 %312
  %314 = load float, float addrspace(1)* %313, align 4, !tbaa !11
  %315 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %312
  %316 = load i32, i32 addrspace(1)* %315, align 4, !tbaa !7, !amdgpu.noclobber !5
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds float, float addrspace(1)* %0, i64 %317
  %319 = load float, float addrspace(1)* %318, align 4, !tbaa !11
  %320 = fmul contract float %314, %319
  %321 = fadd contract float %311, %320
  %322 = add nsw i32 %310, 1
  %323 = icmp slt i32 %322, %25
  br i1 %323, label %309, label %324, !llvm.loop !13

324:                                              ; preds = %309, %303
  %325 = phi float [ 0.000000e+00, %303 ], [ %321, %309 ]
  %326 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %327 = fsub contract float %326, %325
  %328 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %329 = fdiv contract float %327, %328
  store float %329, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %330, label %345

330:                                              ; preds = %324, %330
  %331 = phi i32 [ %343, %330 ], [ %21, %324 ]
  %332 = phi float [ %342, %330 ], [ 0.000000e+00, %324 ]
  %333 = sext i32 %331 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %2, i64 %333
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !11
  %336 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %333
  %337 = load i32, i32 addrspace(1)* %336, align 4, !tbaa !7, !amdgpu.noclobber !5
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds float, float addrspace(1)* %0, i64 %338
  %340 = load float, float addrspace(1)* %339, align 4, !tbaa !11
  %341 = fmul contract float %335, %340
  %342 = fadd contract float %332, %341
  %343 = add nsw i32 %331, 1
  %344 = icmp slt i32 %343, %25
  br i1 %344, label %330, label %345, !llvm.loop !13

345:                                              ; preds = %330, %324
  %346 = phi float [ 0.000000e+00, %324 ], [ %342, %330 ]
  %347 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %348 = fsub contract float %347, %346
  %349 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %350 = fdiv contract float %348, %349
  store float %350, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %351, label %366

351:                                              ; preds = %345, %351
  %352 = phi i32 [ %364, %351 ], [ %21, %345 ]
  %353 = phi float [ %363, %351 ], [ 0.000000e+00, %345 ]
  %354 = sext i32 %352 to i64
  %355 = getelementptr inbounds float, float addrspace(1)* %2, i64 %354
  %356 = load float, float addrspace(1)* %355, align 4, !tbaa !11
  %357 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %354
  %358 = load i32, i32 addrspace(1)* %357, align 4, !tbaa !7, !amdgpu.noclobber !5
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds float, float addrspace(1)* %0, i64 %359
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !11
  %362 = fmul contract float %356, %361
  %363 = fadd contract float %353, %362
  %364 = add nsw i32 %352, 1
  %365 = icmp slt i32 %364, %25
  br i1 %365, label %351, label %366, !llvm.loop !13

366:                                              ; preds = %351, %345
  %367 = phi float [ 0.000000e+00, %345 ], [ %363, %351 ]
  %368 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %369 = fsub contract float %368, %367
  %370 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %371 = fdiv contract float %369, %370
  store float %371, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %372, label %387

372:                                              ; preds = %366, %372
  %373 = phi i32 [ %385, %372 ], [ %21, %366 ]
  %374 = phi float [ %384, %372 ], [ 0.000000e+00, %366 ]
  %375 = sext i32 %373 to i64
  %376 = getelementptr inbounds float, float addrspace(1)* %2, i64 %375
  %377 = load float, float addrspace(1)* %376, align 4, !tbaa !11
  %378 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %375
  %379 = load i32, i32 addrspace(1)* %378, align 4, !tbaa !7, !amdgpu.noclobber !5
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds float, float addrspace(1)* %0, i64 %380
  %382 = load float, float addrspace(1)* %381, align 4, !tbaa !11
  %383 = fmul contract float %377, %382
  %384 = fadd contract float %374, %383
  %385 = add nsw i32 %373, 1
  %386 = icmp slt i32 %385, %25
  br i1 %386, label %372, label %387, !llvm.loop !13

387:                                              ; preds = %372, %366
  %388 = phi float [ 0.000000e+00, %366 ], [ %384, %372 ]
  %389 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %390 = fsub contract float %389, %388
  %391 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %392 = fdiv contract float %390, %391
  store float %392, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %393, label %408

393:                                              ; preds = %387, %393
  %394 = phi i32 [ %406, %393 ], [ %21, %387 ]
  %395 = phi float [ %405, %393 ], [ 0.000000e+00, %387 ]
  %396 = sext i32 %394 to i64
  %397 = getelementptr inbounds float, float addrspace(1)* %2, i64 %396
  %398 = load float, float addrspace(1)* %397, align 4, !tbaa !11
  %399 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %396
  %400 = load i32, i32 addrspace(1)* %399, align 4, !tbaa !7, !amdgpu.noclobber !5
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds float, float addrspace(1)* %0, i64 %401
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !11
  %404 = fmul contract float %398, %403
  %405 = fadd contract float %395, %404
  %406 = add nsw i32 %394, 1
  %407 = icmp slt i32 %406, %25
  br i1 %407, label %393, label %408, !llvm.loop !13

408:                                              ; preds = %393, %387
  %409 = phi float [ 0.000000e+00, %387 ], [ %405, %393 ]
  %410 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %411 = fsub contract float %410, %409
  %412 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %413 = fdiv contract float %411, %412
  store float %413, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %414, label %429

414:                                              ; preds = %408, %414
  %415 = phi i32 [ %427, %414 ], [ %21, %408 ]
  %416 = phi float [ %426, %414 ], [ 0.000000e+00, %408 ]
  %417 = sext i32 %415 to i64
  %418 = getelementptr inbounds float, float addrspace(1)* %2, i64 %417
  %419 = load float, float addrspace(1)* %418, align 4, !tbaa !11
  %420 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %417
  %421 = load i32, i32 addrspace(1)* %420, align 4, !tbaa !7, !amdgpu.noclobber !5
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds float, float addrspace(1)* %0, i64 %422
  %424 = load float, float addrspace(1)* %423, align 4, !tbaa !11
  %425 = fmul contract float %419, %424
  %426 = fadd contract float %416, %425
  %427 = add nsw i32 %415, 1
  %428 = icmp slt i32 %427, %25
  br i1 %428, label %414, label %429, !llvm.loop !13

429:                                              ; preds = %414, %408
  %430 = phi float [ 0.000000e+00, %408 ], [ %426, %414 ]
  %431 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %432 = fsub contract float %431, %430
  %433 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %434 = fdiv contract float %432, %433
  store float %434, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %435, label %450

435:                                              ; preds = %429, %435
  %436 = phi i32 [ %448, %435 ], [ %21, %429 ]
  %437 = phi float [ %447, %435 ], [ 0.000000e+00, %429 ]
  %438 = sext i32 %436 to i64
  %439 = getelementptr inbounds float, float addrspace(1)* %2, i64 %438
  %440 = load float, float addrspace(1)* %439, align 4, !tbaa !11
  %441 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %438
  %442 = load i32, i32 addrspace(1)* %441, align 4, !tbaa !7, !amdgpu.noclobber !5
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds float, float addrspace(1)* %0, i64 %443
  %445 = load float, float addrspace(1)* %444, align 4, !tbaa !11
  %446 = fmul contract float %440, %445
  %447 = fadd contract float %437, %446
  %448 = add nsw i32 %436, 1
  %449 = icmp slt i32 %448, %25
  br i1 %449, label %435, label %450, !llvm.loop !13

450:                                              ; preds = %435, %429
  %451 = phi float [ 0.000000e+00, %429 ], [ %447, %435 ]
  %452 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %453 = fsub contract float %452, %451
  %454 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %455 = fdiv contract float %453, %454
  store float %455, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %456, label %471

456:                                              ; preds = %450, %456
  %457 = phi i32 [ %469, %456 ], [ %21, %450 ]
  %458 = phi float [ %468, %456 ], [ 0.000000e+00, %450 ]
  %459 = sext i32 %457 to i64
  %460 = getelementptr inbounds float, float addrspace(1)* %2, i64 %459
  %461 = load float, float addrspace(1)* %460, align 4, !tbaa !11
  %462 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %459
  %463 = load i32, i32 addrspace(1)* %462, align 4, !tbaa !7, !amdgpu.noclobber !5
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds float, float addrspace(1)* %0, i64 %464
  %466 = load float, float addrspace(1)* %465, align 4, !tbaa !11
  %467 = fmul contract float %461, %466
  %468 = fadd contract float %458, %467
  %469 = add nsw i32 %457, 1
  %470 = icmp slt i32 %469, %25
  br i1 %470, label %456, label %471, !llvm.loop !13

471:                                              ; preds = %456, %450
  %472 = phi float [ 0.000000e+00, %450 ], [ %468, %456 ]
  %473 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %474 = fsub contract float %473, %472
  %475 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %476 = fdiv contract float %474, %475
  store float %476, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %477, label %492

477:                                              ; preds = %471, %477
  %478 = phi i32 [ %490, %477 ], [ %21, %471 ]
  %479 = phi float [ %489, %477 ], [ 0.000000e+00, %471 ]
  %480 = sext i32 %478 to i64
  %481 = getelementptr inbounds float, float addrspace(1)* %2, i64 %480
  %482 = load float, float addrspace(1)* %481, align 4, !tbaa !11
  %483 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %480
  %484 = load i32, i32 addrspace(1)* %483, align 4, !tbaa !7, !amdgpu.noclobber !5
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds float, float addrspace(1)* %0, i64 %485
  %487 = load float, float addrspace(1)* %486, align 4, !tbaa !11
  %488 = fmul contract float %482, %487
  %489 = fadd contract float %479, %488
  %490 = add nsw i32 %478, 1
  %491 = icmp slt i32 %490, %25
  br i1 %491, label %477, label %492, !llvm.loop !13

492:                                              ; preds = %477, %471
  %493 = phi float [ 0.000000e+00, %471 ], [ %489, %477 ]
  %494 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %495 = fsub contract float %494, %493
  %496 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %497 = fdiv contract float %495, %496
  store float %497, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %498, label %513

498:                                              ; preds = %492, %498
  %499 = phi i32 [ %511, %498 ], [ %21, %492 ]
  %500 = phi float [ %510, %498 ], [ 0.000000e+00, %492 ]
  %501 = sext i32 %499 to i64
  %502 = getelementptr inbounds float, float addrspace(1)* %2, i64 %501
  %503 = load float, float addrspace(1)* %502, align 4, !tbaa !11
  %504 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %501
  %505 = load i32, i32 addrspace(1)* %504, align 4, !tbaa !7, !amdgpu.noclobber !5
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds float, float addrspace(1)* %0, i64 %506
  %508 = load float, float addrspace(1)* %507, align 4, !tbaa !11
  %509 = fmul contract float %503, %508
  %510 = fadd contract float %500, %509
  %511 = add nsw i32 %499, 1
  %512 = icmp slt i32 %511, %25
  br i1 %512, label %498, label %513, !llvm.loop !13

513:                                              ; preds = %498, %492
  %514 = phi float [ 0.000000e+00, %492 ], [ %510, %498 ]
  %515 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %516 = fsub contract float %515, %514
  %517 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %518 = fdiv contract float %516, %517
  store float %518, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %519, label %534

519:                                              ; preds = %513, %519
  %520 = phi i32 [ %532, %519 ], [ %21, %513 ]
  %521 = phi float [ %531, %519 ], [ 0.000000e+00, %513 ]
  %522 = sext i32 %520 to i64
  %523 = getelementptr inbounds float, float addrspace(1)* %2, i64 %522
  %524 = load float, float addrspace(1)* %523, align 4, !tbaa !11
  %525 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %522
  %526 = load i32, i32 addrspace(1)* %525, align 4, !tbaa !7, !amdgpu.noclobber !5
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds float, float addrspace(1)* %0, i64 %527
  %529 = load float, float addrspace(1)* %528, align 4, !tbaa !11
  %530 = fmul contract float %524, %529
  %531 = fadd contract float %521, %530
  %532 = add nsw i32 %520, 1
  %533 = icmp slt i32 %532, %25
  br i1 %533, label %519, label %534, !llvm.loop !13

534:                                              ; preds = %519, %513
  %535 = phi float [ 0.000000e+00, %513 ], [ %531, %519 ]
  %536 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %537 = fsub contract float %536, %535
  %538 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %539 = fdiv contract float %537, %538
  store float %539, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %540, label %555

540:                                              ; preds = %534, %540
  %541 = phi i32 [ %553, %540 ], [ %21, %534 ]
  %542 = phi float [ %552, %540 ], [ 0.000000e+00, %534 ]
  %543 = sext i32 %541 to i64
  %544 = getelementptr inbounds float, float addrspace(1)* %2, i64 %543
  %545 = load float, float addrspace(1)* %544, align 4, !tbaa !11
  %546 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %543
  %547 = load i32, i32 addrspace(1)* %546, align 4, !tbaa !7, !amdgpu.noclobber !5
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds float, float addrspace(1)* %0, i64 %548
  %550 = load float, float addrspace(1)* %549, align 4, !tbaa !11
  %551 = fmul contract float %545, %550
  %552 = fadd contract float %542, %551
  %553 = add nsw i32 %541, 1
  %554 = icmp slt i32 %553, %25
  br i1 %554, label %540, label %555, !llvm.loop !13

555:                                              ; preds = %540, %534
  %556 = phi float [ 0.000000e+00, %534 ], [ %552, %540 ]
  %557 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %558 = fsub contract float %557, %556
  %559 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %560 = fdiv contract float %558, %559
  store float %560, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %561, label %576

561:                                              ; preds = %555, %561
  %562 = phi i32 [ %574, %561 ], [ %21, %555 ]
  %563 = phi float [ %573, %561 ], [ 0.000000e+00, %555 ]
  %564 = sext i32 %562 to i64
  %565 = getelementptr inbounds float, float addrspace(1)* %2, i64 %564
  %566 = load float, float addrspace(1)* %565, align 4, !tbaa !11
  %567 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %564
  %568 = load i32, i32 addrspace(1)* %567, align 4, !tbaa !7, !amdgpu.noclobber !5
  %569 = sext i32 %568 to i64
  %570 = getelementptr inbounds float, float addrspace(1)* %0, i64 %569
  %571 = load float, float addrspace(1)* %570, align 4, !tbaa !11
  %572 = fmul contract float %566, %571
  %573 = fadd contract float %563, %572
  %574 = add nsw i32 %562, 1
  %575 = icmp slt i32 %574, %25
  br i1 %575, label %561, label %576, !llvm.loop !13

576:                                              ; preds = %561, %555
  %577 = phi float [ 0.000000e+00, %555 ], [ %573, %561 ]
  %578 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %579 = fsub contract float %578, %577
  %580 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %581 = fdiv contract float %579, %580
  store float %581, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %582, label %597

582:                                              ; preds = %576, %582
  %583 = phi i32 [ %595, %582 ], [ %21, %576 ]
  %584 = phi float [ %594, %582 ], [ 0.000000e+00, %576 ]
  %585 = sext i32 %583 to i64
  %586 = getelementptr inbounds float, float addrspace(1)* %2, i64 %585
  %587 = load float, float addrspace(1)* %586, align 4, !tbaa !11
  %588 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %585
  %589 = load i32, i32 addrspace(1)* %588, align 4, !tbaa !7, !amdgpu.noclobber !5
  %590 = sext i32 %589 to i64
  %591 = getelementptr inbounds float, float addrspace(1)* %0, i64 %590
  %592 = load float, float addrspace(1)* %591, align 4, !tbaa !11
  %593 = fmul contract float %587, %592
  %594 = fadd contract float %584, %593
  %595 = add nsw i32 %583, 1
  %596 = icmp slt i32 %595, %25
  br i1 %596, label %582, label %597, !llvm.loop !13

597:                                              ; preds = %582, %576
  %598 = phi float [ 0.000000e+00, %576 ], [ %594, %582 ]
  %599 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %600 = fsub contract float %599, %598
  %601 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %602 = fdiv contract float %600, %601
  store float %602, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %603, label %618

603:                                              ; preds = %597, %603
  %604 = phi i32 [ %616, %603 ], [ %21, %597 ]
  %605 = phi float [ %615, %603 ], [ 0.000000e+00, %597 ]
  %606 = sext i32 %604 to i64
  %607 = getelementptr inbounds float, float addrspace(1)* %2, i64 %606
  %608 = load float, float addrspace(1)* %607, align 4, !tbaa !11
  %609 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %606
  %610 = load i32, i32 addrspace(1)* %609, align 4, !tbaa !7, !amdgpu.noclobber !5
  %611 = sext i32 %610 to i64
  %612 = getelementptr inbounds float, float addrspace(1)* %0, i64 %611
  %613 = load float, float addrspace(1)* %612, align 4, !tbaa !11
  %614 = fmul contract float %608, %613
  %615 = fadd contract float %605, %614
  %616 = add nsw i32 %604, 1
  %617 = icmp slt i32 %616, %25
  br i1 %617, label %603, label %618, !llvm.loop !13

618:                                              ; preds = %603, %597
  %619 = phi float [ 0.000000e+00, %597 ], [ %615, %603 ]
  %620 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %621 = fsub contract float %620, %619
  %622 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %623 = fdiv contract float %621, %622
  store float %623, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %624, label %639

624:                                              ; preds = %618, %624
  %625 = phi i32 [ %637, %624 ], [ %21, %618 ]
  %626 = phi float [ %636, %624 ], [ 0.000000e+00, %618 ]
  %627 = sext i32 %625 to i64
  %628 = getelementptr inbounds float, float addrspace(1)* %2, i64 %627
  %629 = load float, float addrspace(1)* %628, align 4, !tbaa !11
  %630 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %627
  %631 = load i32, i32 addrspace(1)* %630, align 4, !tbaa !7, !amdgpu.noclobber !5
  %632 = sext i32 %631 to i64
  %633 = getelementptr inbounds float, float addrspace(1)* %0, i64 %632
  %634 = load float, float addrspace(1)* %633, align 4, !tbaa !11
  %635 = fmul contract float %629, %634
  %636 = fadd contract float %626, %635
  %637 = add nsw i32 %625, 1
  %638 = icmp slt i32 %637, %25
  br i1 %638, label %624, label %639, !llvm.loop !13

639:                                              ; preds = %624, %618
  %640 = phi float [ 0.000000e+00, %618 ], [ %636, %624 ]
  %641 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %642 = fsub contract float %641, %640
  %643 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %644 = fdiv contract float %642, %643
  store float %644, float addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %660

645:                                              ; preds = %18, %645
  %646 = phi i32 [ %658, %645 ], [ %21, %18 ]
  %647 = phi float [ %657, %645 ], [ 0.000000e+00, %18 ]
  %648 = sext i32 %646 to i64
  %649 = getelementptr inbounds float, float addrspace(1)* %2, i64 %648
  %650 = load float, float addrspace(1)* %649, align 4, !tbaa !11
  %651 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %648
  %652 = load i32, i32 addrspace(1)* %651, align 4, !tbaa !7, !amdgpu.noclobber !5
  %653 = sext i32 %652 to i64
  %654 = getelementptr inbounds float, float addrspace(1)* %0, i64 %653
  %655 = load float, float addrspace(1)* %654, align 4, !tbaa !11
  %656 = fmul contract float %650, %655
  %657 = fadd contract float %647, %656
  %658 = add nsw i32 %646, 1
  %659 = icmp slt i32 %658, %25
  br i1 %659, label %645, label %30, !llvm.loop !13

660:                                              ; preds = %639, %7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
