; ModuleID = '../data/hip_kernels/1088/25/main.cu'
source_filename = "../data/hip_kernels/1088/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@memory = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10kernel2DYpPdS_S_S_PKdiiiiiiii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = mul nsw i32 %9, %8
  %15 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %14
  %16 = icmp sgt i32 %5, 0
  br i1 %16, label %17, label %35

17:                                               ; preds = %13
  %18 = and i32 %5, 7
  %19 = icmp ult i32 %5, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = and i32 %5, -8
  br label %55

22:                                               ; preds = %55, %17
  %23 = phi i32 [ 0, %17 ], [ %97, %55 ]
  %24 = icmp eq i32 %18, 0
  br i1 %24, label %35, label %25

25:                                               ; preds = %22, %25
  %26 = phi i32 [ %32, %25 ], [ %23, %22 ]
  %27 = phi i32 [ %33, %25 ], [ 0, %22 ]
  %28 = zext i32 %26 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %4, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !4, !amdgpu.noclobber !8
  %31 = getelementptr inbounds double, double addrspace(3)* %15, i32 %26
  store double %30, double addrspace(3)* %31, align 8, !tbaa !4
  %32 = add nuw nsw i32 %26, 1
  %33 = add nuw nsw i32 %27, 1
  %34 = icmp eq i32 %33, %18
  br i1 %34, label %35, label %25, !llvm.loop !9

35:                                               ; preds = %25, %22, %13
  %36 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %37 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %38 = getelementptr i8, i8 addrspace(4)* %36, i64 4
  %39 = bitcast i8 addrspace(4)* %38 to i16 addrspace(4)*
  %40 = load i16, i16 addrspace(4)* %39, align 4, !range !11, !invariant.load !8
  %41 = zext i16 %40 to i32
  %42 = mul i32 %37, %41
  %43 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %44 = add i32 %42, %43
  %45 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %46 = getelementptr i8, i8 addrspace(4)* %36, i64 6
  %47 = bitcast i8 addrspace(4)* %46 to i16 addrspace(4)*
  %48 = load i16, i16 addrspace(4)* %47, align 2, !range !11, !invariant.load !8
  %49 = zext i16 %48 to i32
  %50 = mul i32 %45, %49
  %51 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  %52 = add i32 %50, %51
  %53 = add i32 %51, %6
  %54 = icmp eq i32 %45, 0
  br i1 %54, label %253, label %100

55:                                               ; preds = %55, %20
  %56 = phi i32 [ 0, %20 ], [ %97, %55 ]
  %57 = phi i32 [ 0, %20 ], [ %98, %55 ]
  %58 = zext i32 %56 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %4, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !4, !amdgpu.noclobber !8
  %61 = getelementptr inbounds double, double addrspace(3)* %15, i32 %56
  store double %60, double addrspace(3)* %61, align 8, !tbaa !4
  %62 = or i32 %56, 1
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %4, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !4, !amdgpu.noclobber !8
  %66 = getelementptr inbounds double, double addrspace(3)* %15, i32 %62
  store double %65, double addrspace(3)* %66, align 8, !tbaa !4
  %67 = or i32 %56, 2
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %4, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !4, !amdgpu.noclobber !8
  %71 = getelementptr inbounds double, double addrspace(3)* %15, i32 %67
  store double %70, double addrspace(3)* %71, align 8, !tbaa !4
  %72 = or i32 %56, 3
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %4, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !4, !amdgpu.noclobber !8
  %76 = getelementptr inbounds double, double addrspace(3)* %15, i32 %72
  store double %75, double addrspace(3)* %76, align 8, !tbaa !4
  %77 = or i32 %56, 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %4, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !4, !amdgpu.noclobber !8
  %81 = getelementptr inbounds double, double addrspace(3)* %15, i32 %77
  store double %80, double addrspace(3)* %81, align 8, !tbaa !4
  %82 = or i32 %56, 5
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %4, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !4, !amdgpu.noclobber !8
  %86 = getelementptr inbounds double, double addrspace(3)* %15, i32 %82
  store double %85, double addrspace(3)* %86, align 8, !tbaa !4
  %87 = or i32 %56, 6
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %4, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !4, !amdgpu.noclobber !8
  %91 = getelementptr inbounds double, double addrspace(3)* %15, i32 %87
  store double %90, double addrspace(3)* %91, align 8, !tbaa !4
  %92 = or i32 %56, 7
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %4, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !4, !amdgpu.noclobber !8
  %96 = getelementptr inbounds double, double addrspace(3)* %15, i32 %92
  store double %95, double addrspace(3)* %96, align 8, !tbaa !4
  %97 = add nuw nsw i32 %56, 8
  %98 = add nuw i32 %57, 8
  %99 = icmp eq i32 %98, %21
  br i1 %99, label %22, label %55, !llvm.loop !13

100:                                              ; preds = %35
  %101 = sdiv i32 %12, %10
  %102 = add nsw i32 %101, -1
  %103 = icmp eq i32 %45, %102
  br i1 %103, label %253, label %104

104:                                              ; preds = %100
  %105 = mul nsw i32 %52, %11
  %106 = add nsw i32 %105, %44
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %1, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !4, !amdgpu.noclobber !8
  %110 = mul nsw i32 %53, %8
  %111 = add nsw i32 %110, %43
  %112 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %111
  store double %109, double addrspace(3)* %112, align 8, !tbaa !4
  %113 = icmp ult i32 %51, %6
  br i1 %113, label %114, label %124

114:                                              ; preds = %104
  %115 = sub nsw i32 %52, %6
  %116 = mul nsw i32 %115, %11
  %117 = add nsw i32 %116, %44
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %1, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !4, !amdgpu.noclobber !8
  %121 = mul i32 %51, %8
  %122 = add i32 %121, %43
  %123 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %122
  store double %120, double addrspace(3)* %123, align 8, !tbaa !4
  br label %124

124:                                              ; preds = %114, %104
  %125 = icmp ult i32 %51, %7
  br i1 %125, label %126, label %137

126:                                              ; preds = %124
  %127 = add nsw i32 %52, %10
  %128 = mul nsw i32 %127, %11
  %129 = add nsw i32 %128, %44
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %1, i64 %130
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !4, !amdgpu.noclobber !8
  %133 = add nsw i32 %53, %10
  %134 = mul nsw i32 %133, %8
  %135 = add nsw i32 %134, %43
  %136 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %135
  store double %132, double addrspace(3)* %136, align 8, !tbaa !4
  br label %137

137:                                              ; preds = %126, %124
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %16, label %138, label %164

138:                                              ; preds = %137
  %139 = and i32 %5, 7
  %140 = icmp ult i32 %5, 8
  br i1 %140, label %143, label %141

141:                                              ; preds = %138
  %142 = and i32 %5, -8
  br label %167

143:                                              ; preds = %167, %138
  %144 = phi double [ undef, %138 ], [ %249, %167 ]
  %145 = phi i32 [ 0, %138 ], [ %250, %167 ]
  %146 = phi double [ 0.000000e+00, %138 ], [ %249, %167 ]
  %147 = icmp eq i32 %139, 0
  br i1 %147, label %164, label %148

148:                                              ; preds = %143, %148
  %149 = phi i32 [ %161, %148 ], [ %145, %143 ]
  %150 = phi double [ %160, %148 ], [ %146, %143 ]
  %151 = phi i32 [ %162, %148 ], [ 0, %143 ]
  %152 = getelementptr inbounds double, double addrspace(3)* %15, i32 %149
  %153 = load double, double addrspace(3)* %152, align 8, !tbaa !4
  %154 = add nuw i32 %149, %51
  %155 = mul i32 %154, %8
  %156 = add i32 %155, %43
  %157 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %156
  %158 = load double, double addrspace(3)* %157, align 8, !tbaa !4
  %159 = fmul contract double %153, %158
  %160 = fadd contract double %150, %159
  %161 = add nuw nsw i32 %149, 1
  %162 = add nuw nsw i32 %151, 1
  %163 = icmp eq i32 %162, %139
  br i1 %163, label %164, label %148, !llvm.loop !15

164:                                              ; preds = %148, %143, %137
  %165 = phi double [ 0.000000e+00, %137 ], [ %144, %143 ], [ %160, %148 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %166 = getelementptr inbounds double, double addrspace(1)* %0, i64 %107
  store double %165, double addrspace(1)* %166, align 8, !tbaa !4
  br label %253

167:                                              ; preds = %167, %141
  %168 = phi i32 [ 0, %141 ], [ %250, %167 ]
  %169 = phi double [ 0.000000e+00, %141 ], [ %249, %167 ]
  %170 = phi i32 [ 0, %141 ], [ %251, %167 ]
  %171 = getelementptr inbounds double, double addrspace(3)* %15, i32 %168
  %172 = load double, double addrspace(3)* %171, align 8, !tbaa !4
  %173 = add nuw i32 %168, %51
  %174 = mul i32 %173, %8
  %175 = add i32 %174, %43
  %176 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %175
  %177 = load double, double addrspace(3)* %176, align 8, !tbaa !4
  %178 = fmul contract double %172, %177
  %179 = fadd contract double %169, %178
  %180 = or i32 %168, 1
  %181 = getelementptr inbounds double, double addrspace(3)* %15, i32 %180
  %182 = load double, double addrspace(3)* %181, align 8, !tbaa !4
  %183 = add nuw i32 %180, %51
  %184 = mul i32 %183, %8
  %185 = add i32 %184, %43
  %186 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %185
  %187 = load double, double addrspace(3)* %186, align 8, !tbaa !4
  %188 = fmul contract double %182, %187
  %189 = fadd contract double %179, %188
  %190 = or i32 %168, 2
  %191 = getelementptr inbounds double, double addrspace(3)* %15, i32 %190
  %192 = load double, double addrspace(3)* %191, align 8, !tbaa !4
  %193 = add nuw i32 %190, %51
  %194 = mul i32 %193, %8
  %195 = add i32 %194, %43
  %196 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %195
  %197 = load double, double addrspace(3)* %196, align 8, !tbaa !4
  %198 = fmul contract double %192, %197
  %199 = fadd contract double %189, %198
  %200 = or i32 %168, 3
  %201 = getelementptr inbounds double, double addrspace(3)* %15, i32 %200
  %202 = load double, double addrspace(3)* %201, align 8, !tbaa !4
  %203 = add nuw i32 %200, %51
  %204 = mul i32 %203, %8
  %205 = add i32 %204, %43
  %206 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %205
  %207 = load double, double addrspace(3)* %206, align 8, !tbaa !4
  %208 = fmul contract double %202, %207
  %209 = fadd contract double %199, %208
  %210 = or i32 %168, 4
  %211 = getelementptr inbounds double, double addrspace(3)* %15, i32 %210
  %212 = load double, double addrspace(3)* %211, align 8, !tbaa !4
  %213 = add nuw i32 %210, %51
  %214 = mul i32 %213, %8
  %215 = add i32 %214, %43
  %216 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %215
  %217 = load double, double addrspace(3)* %216, align 8, !tbaa !4
  %218 = fmul contract double %212, %217
  %219 = fadd contract double %209, %218
  %220 = or i32 %168, 5
  %221 = getelementptr inbounds double, double addrspace(3)* %15, i32 %220
  %222 = load double, double addrspace(3)* %221, align 8, !tbaa !4
  %223 = add nuw i32 %220, %51
  %224 = mul i32 %223, %8
  %225 = add i32 %224, %43
  %226 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %225
  %227 = load double, double addrspace(3)* %226, align 8, !tbaa !4
  %228 = fmul contract double %222, %227
  %229 = fadd contract double %219, %228
  %230 = or i32 %168, 6
  %231 = getelementptr inbounds double, double addrspace(3)* %15, i32 %230
  %232 = load double, double addrspace(3)* %231, align 8, !tbaa !4
  %233 = add nuw i32 %230, %51
  %234 = mul i32 %233, %8
  %235 = add i32 %234, %43
  %236 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %235
  %237 = load double, double addrspace(3)* %236, align 8, !tbaa !4
  %238 = fmul contract double %232, %237
  %239 = fadd contract double %229, %238
  %240 = or i32 %168, 7
  %241 = getelementptr inbounds double, double addrspace(3)* %15, i32 %240
  %242 = load double, double addrspace(3)* %241, align 8, !tbaa !4
  %243 = add nuw i32 %240, %51
  %244 = mul i32 %243, %8
  %245 = add i32 %244, %43
  %246 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %245
  %247 = load double, double addrspace(3)* %246, align 8, !tbaa !4
  %248 = fmul contract double %242, %247
  %249 = fadd contract double %239, %248
  %250 = add nuw nsw i32 %168, 8
  %251 = add nuw i32 %170, 8
  %252 = icmp eq i32 %251, %142
  br i1 %252, label %143, label %167, !llvm.loop !16

253:                                              ; preds = %164, %100, %35
  %254 = phi double [ %165, %164 ], [ 0.000000e+00, %100 ], [ 0.000000e+00, %35 ]
  br i1 %54, label %255, label %403

255:                                              ; preds = %253
  %256 = mul nsw i32 %52, %11
  %257 = add nsw i32 %256, %44
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds double, double addrspace(1)* %1, i64 %258
  %260 = load double, double addrspace(1)* %259, align 8, !tbaa !4
  %261 = mul nsw i32 %53, %8
  %262 = add nsw i32 %261, %43
  %263 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %262
  store double %260, double addrspace(3)* %263, align 8, !tbaa !4
  %264 = icmp ult i32 %51, %6
  br i1 %264, label %265, label %274

265:                                              ; preds = %255
  %266 = mul i32 %51, %11
  %267 = add i32 %44, %266
  %268 = zext i32 %267 to i64
  %269 = getelementptr inbounds double, double addrspace(1)* %2, i64 %268
  %270 = load double, double addrspace(1)* %269, align 8, !tbaa !4
  %271 = mul i32 %51, %8
  %272 = add i32 %271, %43
  %273 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %272
  store double %270, double addrspace(3)* %273, align 8, !tbaa !4
  br label %274

274:                                              ; preds = %265, %255
  %275 = icmp ult i32 %51, %7
  br i1 %275, label %276, label %287

276:                                              ; preds = %274
  %277 = add nsw i32 %52, %10
  %278 = mul nsw i32 %277, %11
  %279 = add nsw i32 %278, %44
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds double, double addrspace(1)* %1, i64 %280
  %282 = load double, double addrspace(1)* %281, align 8, !tbaa !4
  %283 = add nsw i32 %53, %10
  %284 = mul nsw i32 %283, %8
  %285 = add nsw i32 %284, %43
  %286 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %285
  store double %282, double addrspace(3)* %286, align 8, !tbaa !4
  br label %287

287:                                              ; preds = %276, %274
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %16, label %288, label %314

288:                                              ; preds = %287
  %289 = and i32 %5, 7
  %290 = icmp ult i32 %5, 8
  br i1 %290, label %293, label %291

291:                                              ; preds = %288
  %292 = and i32 %5, -8
  br label %317

293:                                              ; preds = %317, %288
  %294 = phi double [ undef, %288 ], [ %399, %317 ]
  %295 = phi i32 [ 0, %288 ], [ %400, %317 ]
  %296 = phi double [ %254, %288 ], [ %399, %317 ]
  %297 = icmp eq i32 %289, 0
  br i1 %297, label %314, label %298

298:                                              ; preds = %293, %298
  %299 = phi i32 [ %311, %298 ], [ %295, %293 ]
  %300 = phi double [ %310, %298 ], [ %296, %293 ]
  %301 = phi i32 [ %312, %298 ], [ 0, %293 ]
  %302 = getelementptr inbounds double, double addrspace(3)* %15, i32 %299
  %303 = load double, double addrspace(3)* %302, align 8, !tbaa !4
  %304 = add nuw i32 %299, %51
  %305 = mul i32 %304, %8
  %306 = add i32 %305, %43
  %307 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %306
  %308 = load double, double addrspace(3)* %307, align 8, !tbaa !4
  %309 = fmul contract double %303, %308
  %310 = fadd contract double %300, %309
  %311 = add nuw nsw i32 %299, 1
  %312 = add nuw nsw i32 %301, 1
  %313 = icmp eq i32 %312, %289
  br i1 %313, label %314, label %298, !llvm.loop !17

314:                                              ; preds = %298, %293, %287
  %315 = phi double [ %254, %287 ], [ %294, %293 ], [ %310, %298 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %316 = getelementptr inbounds double, double addrspace(1)* %0, i64 %258
  store double %315, double addrspace(1)* %316, align 8, !tbaa !4
  br label %403

317:                                              ; preds = %317, %291
  %318 = phi i32 [ 0, %291 ], [ %400, %317 ]
  %319 = phi double [ %254, %291 ], [ %399, %317 ]
  %320 = phi i32 [ 0, %291 ], [ %401, %317 ]
  %321 = getelementptr inbounds double, double addrspace(3)* %15, i32 %318
  %322 = load double, double addrspace(3)* %321, align 8, !tbaa !4
  %323 = add nuw i32 %318, %51
  %324 = mul i32 %323, %8
  %325 = add i32 %324, %43
  %326 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %325
  %327 = load double, double addrspace(3)* %326, align 8, !tbaa !4
  %328 = fmul contract double %322, %327
  %329 = fadd contract double %319, %328
  %330 = or i32 %318, 1
  %331 = getelementptr inbounds double, double addrspace(3)* %15, i32 %330
  %332 = load double, double addrspace(3)* %331, align 8, !tbaa !4
  %333 = add nuw i32 %330, %51
  %334 = mul i32 %333, %8
  %335 = add i32 %334, %43
  %336 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %335
  %337 = load double, double addrspace(3)* %336, align 8, !tbaa !4
  %338 = fmul contract double %332, %337
  %339 = fadd contract double %329, %338
  %340 = or i32 %318, 2
  %341 = getelementptr inbounds double, double addrspace(3)* %15, i32 %340
  %342 = load double, double addrspace(3)* %341, align 8, !tbaa !4
  %343 = add nuw i32 %340, %51
  %344 = mul i32 %343, %8
  %345 = add i32 %344, %43
  %346 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %345
  %347 = load double, double addrspace(3)* %346, align 8, !tbaa !4
  %348 = fmul contract double %342, %347
  %349 = fadd contract double %339, %348
  %350 = or i32 %318, 3
  %351 = getelementptr inbounds double, double addrspace(3)* %15, i32 %350
  %352 = load double, double addrspace(3)* %351, align 8, !tbaa !4
  %353 = add nuw i32 %350, %51
  %354 = mul i32 %353, %8
  %355 = add i32 %354, %43
  %356 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %355
  %357 = load double, double addrspace(3)* %356, align 8, !tbaa !4
  %358 = fmul contract double %352, %357
  %359 = fadd contract double %349, %358
  %360 = or i32 %318, 4
  %361 = getelementptr inbounds double, double addrspace(3)* %15, i32 %360
  %362 = load double, double addrspace(3)* %361, align 8, !tbaa !4
  %363 = add nuw i32 %360, %51
  %364 = mul i32 %363, %8
  %365 = add i32 %364, %43
  %366 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %365
  %367 = load double, double addrspace(3)* %366, align 8, !tbaa !4
  %368 = fmul contract double %362, %367
  %369 = fadd contract double %359, %368
  %370 = or i32 %318, 5
  %371 = getelementptr inbounds double, double addrspace(3)* %15, i32 %370
  %372 = load double, double addrspace(3)* %371, align 8, !tbaa !4
  %373 = add nuw i32 %370, %51
  %374 = mul i32 %373, %8
  %375 = add i32 %374, %43
  %376 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %375
  %377 = load double, double addrspace(3)* %376, align 8, !tbaa !4
  %378 = fmul contract double %372, %377
  %379 = fadd contract double %369, %378
  %380 = or i32 %318, 6
  %381 = getelementptr inbounds double, double addrspace(3)* %15, i32 %380
  %382 = load double, double addrspace(3)* %381, align 8, !tbaa !4
  %383 = add nuw i32 %380, %51
  %384 = mul i32 %383, %8
  %385 = add i32 %384, %43
  %386 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %385
  %387 = load double, double addrspace(3)* %386, align 8, !tbaa !4
  %388 = fmul contract double %382, %387
  %389 = fadd contract double %379, %388
  %390 = or i32 %318, 7
  %391 = getelementptr inbounds double, double addrspace(3)* %15, i32 %390
  %392 = load double, double addrspace(3)* %391, align 8, !tbaa !4
  %393 = add nuw i32 %390, %51
  %394 = mul i32 %393, %8
  %395 = add i32 %394, %43
  %396 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %395
  %397 = load double, double addrspace(3)* %396, align 8, !tbaa !4
  %398 = fmul contract double %392, %397
  %399 = fadd contract double %389, %398
  %400 = add nuw nsw i32 %318, 8
  %401 = add nuw i32 %320, 8
  %402 = icmp eq i32 %401, %292
  br i1 %402, label %293, label %317, !llvm.loop !18

403:                                              ; preds = %314, %253
  %404 = phi double [ %315, %314 ], [ %254, %253 ]
  %405 = sdiv i32 %12, %10
  %406 = add nsw i32 %405, -1
  %407 = icmp eq i32 %45, %406
  br i1 %407, label %408, label %556

408:                                              ; preds = %403
  %409 = mul nsw i32 %52, %11
  %410 = add nsw i32 %409, %44
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds double, double addrspace(1)* %1, i64 %411
  %413 = load double, double addrspace(1)* %412, align 8, !tbaa !4
  %414 = mul nsw i32 %53, %8
  %415 = add nsw i32 %414, %43
  %416 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %415
  store double %413, double addrspace(3)* %416, align 8, !tbaa !4
  %417 = icmp ult i32 %51, %6
  br i1 %417, label %418, label %428

418:                                              ; preds = %408
  %419 = sub nsw i32 %52, %6
  %420 = mul nsw i32 %419, %11
  %421 = add nsw i32 %420, %44
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds double, double addrspace(1)* %1, i64 %422
  %424 = load double, double addrspace(1)* %423, align 8, !tbaa !4
  %425 = mul i32 %51, %8
  %426 = add i32 %425, %43
  %427 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %426
  store double %424, double addrspace(3)* %427, align 8, !tbaa !4
  br label %428

428:                                              ; preds = %418, %408
  %429 = icmp ult i32 %51, %7
  br i1 %429, label %430, label %440

430:                                              ; preds = %428
  %431 = mul i32 %51, %11
  %432 = add i32 %44, %431
  %433 = zext i32 %432 to i64
  %434 = getelementptr inbounds double, double addrspace(1)* %3, i64 %433
  %435 = load double, double addrspace(1)* %434, align 8, !tbaa !4
  %436 = add nsw i32 %53, %10
  %437 = mul nsw i32 %436, %8
  %438 = add nsw i32 %437, %43
  %439 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %438
  store double %435, double addrspace(3)* %439, align 8, !tbaa !4
  br label %440

440:                                              ; preds = %430, %428
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %16, label %441, label %467

441:                                              ; preds = %440
  %442 = and i32 %5, 7
  %443 = icmp ult i32 %5, 8
  br i1 %443, label %446, label %444

444:                                              ; preds = %441
  %445 = and i32 %5, -8
  br label %470

446:                                              ; preds = %470, %441
  %447 = phi double [ undef, %441 ], [ %552, %470 ]
  %448 = phi i32 [ 0, %441 ], [ %553, %470 ]
  %449 = phi double [ %404, %441 ], [ %552, %470 ]
  %450 = icmp eq i32 %442, 0
  br i1 %450, label %467, label %451

451:                                              ; preds = %446, %451
  %452 = phi i32 [ %464, %451 ], [ %448, %446 ]
  %453 = phi double [ %463, %451 ], [ %449, %446 ]
  %454 = phi i32 [ %465, %451 ], [ 0, %446 ]
  %455 = getelementptr inbounds double, double addrspace(3)* %15, i32 %452
  %456 = load double, double addrspace(3)* %455, align 8, !tbaa !4
  %457 = add nuw i32 %452, %51
  %458 = mul i32 %457, %8
  %459 = add i32 %458, %43
  %460 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %459
  %461 = load double, double addrspace(3)* %460, align 8, !tbaa !4
  %462 = fmul contract double %456, %461
  %463 = fadd contract double %453, %462
  %464 = add nuw nsw i32 %452, 1
  %465 = add nuw nsw i32 %454, 1
  %466 = icmp eq i32 %465, %442
  br i1 %466, label %467, label %451, !llvm.loop !19

467:                                              ; preds = %451, %446, %440
  %468 = phi double [ %404, %440 ], [ %447, %446 ], [ %463, %451 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %469 = getelementptr inbounds double, double addrspace(1)* %0, i64 %411
  store double %468, double addrspace(1)* %469, align 8, !tbaa !4
  br label %556

470:                                              ; preds = %470, %444
  %471 = phi i32 [ 0, %444 ], [ %553, %470 ]
  %472 = phi double [ %404, %444 ], [ %552, %470 ]
  %473 = phi i32 [ 0, %444 ], [ %554, %470 ]
  %474 = getelementptr inbounds double, double addrspace(3)* %15, i32 %471
  %475 = load double, double addrspace(3)* %474, align 8, !tbaa !4
  %476 = add nuw i32 %471, %51
  %477 = mul i32 %476, %8
  %478 = add i32 %477, %43
  %479 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %478
  %480 = load double, double addrspace(3)* %479, align 8, !tbaa !4
  %481 = fmul contract double %475, %480
  %482 = fadd contract double %472, %481
  %483 = or i32 %471, 1
  %484 = getelementptr inbounds double, double addrspace(3)* %15, i32 %483
  %485 = load double, double addrspace(3)* %484, align 8, !tbaa !4
  %486 = add nuw i32 %483, %51
  %487 = mul i32 %486, %8
  %488 = add i32 %487, %43
  %489 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %488
  %490 = load double, double addrspace(3)* %489, align 8, !tbaa !4
  %491 = fmul contract double %485, %490
  %492 = fadd contract double %482, %491
  %493 = or i32 %471, 2
  %494 = getelementptr inbounds double, double addrspace(3)* %15, i32 %493
  %495 = load double, double addrspace(3)* %494, align 8, !tbaa !4
  %496 = add nuw i32 %493, %51
  %497 = mul i32 %496, %8
  %498 = add i32 %497, %43
  %499 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %498
  %500 = load double, double addrspace(3)* %499, align 8, !tbaa !4
  %501 = fmul contract double %495, %500
  %502 = fadd contract double %492, %501
  %503 = or i32 %471, 3
  %504 = getelementptr inbounds double, double addrspace(3)* %15, i32 %503
  %505 = load double, double addrspace(3)* %504, align 8, !tbaa !4
  %506 = add nuw i32 %503, %51
  %507 = mul i32 %506, %8
  %508 = add i32 %507, %43
  %509 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %508
  %510 = load double, double addrspace(3)* %509, align 8, !tbaa !4
  %511 = fmul contract double %505, %510
  %512 = fadd contract double %502, %511
  %513 = or i32 %471, 4
  %514 = getelementptr inbounds double, double addrspace(3)* %15, i32 %513
  %515 = load double, double addrspace(3)* %514, align 8, !tbaa !4
  %516 = add nuw i32 %513, %51
  %517 = mul i32 %516, %8
  %518 = add i32 %517, %43
  %519 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %518
  %520 = load double, double addrspace(3)* %519, align 8, !tbaa !4
  %521 = fmul contract double %515, %520
  %522 = fadd contract double %512, %521
  %523 = or i32 %471, 5
  %524 = getelementptr inbounds double, double addrspace(3)* %15, i32 %523
  %525 = load double, double addrspace(3)* %524, align 8, !tbaa !4
  %526 = add nuw i32 %523, %51
  %527 = mul i32 %526, %8
  %528 = add i32 %527, %43
  %529 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %528
  %530 = load double, double addrspace(3)* %529, align 8, !tbaa !4
  %531 = fmul contract double %525, %530
  %532 = fadd contract double %522, %531
  %533 = or i32 %471, 6
  %534 = getelementptr inbounds double, double addrspace(3)* %15, i32 %533
  %535 = load double, double addrspace(3)* %534, align 8, !tbaa !4
  %536 = add nuw i32 %533, %51
  %537 = mul i32 %536, %8
  %538 = add i32 %537, %43
  %539 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %538
  %540 = load double, double addrspace(3)* %539, align 8, !tbaa !4
  %541 = fmul contract double %535, %540
  %542 = fadd contract double %532, %541
  %543 = or i32 %471, 7
  %544 = getelementptr inbounds double, double addrspace(3)* %15, i32 %543
  %545 = load double, double addrspace(3)* %544, align 8, !tbaa !4
  %546 = add nuw i32 %543, %51
  %547 = mul i32 %546, %8
  %548 = add i32 %547, %43
  %549 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %548
  %550 = load double, double addrspace(3)* %549, align 8, !tbaa !4
  %551 = fmul contract double %545, %550
  %552 = fadd contract double %542, %551
  %553 = add nuw nsw i32 %471, 8
  %554 = add nuw i32 %473, 8
  %555 = icmp eq i32 %554, %445
  br i1 %555, label %446, label %470, !llvm.loop !20

556:                                              ; preds = %467, %403
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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{i16 1, i16 1025}
!12 = !{i32 0, i32 1024}
!13 = distinct !{!13, !14, !10}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !14, !10}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !14, !10}
!19 = distinct !{!19, !10}
!20 = distinct !{!20, !14, !10}
