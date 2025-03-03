; ModuleID = '../data/hip_kernels/6203/1/main.cu'
source_filename = "../data/hip_kernels/6203/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL20find_nearest_clusteriiiPfS_PiS0_ = comdat any

@sharedMem = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL20find_nearest_clusteriiiPfS_PiS0_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 comdat {
  %8 = mul nsw i32 %2, 3
  %9 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %8
  %10 = mul nsw i32 %2, %0
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %30

12:                                               ; preds = %7
  %13 = and i32 %10, 7
  %14 = icmp ult i32 %10, 8
  br i1 %14, label %17, label %15

15:                                               ; preds = %12
  %16 = and i32 %10, -8
  br label %66

17:                                               ; preds = %66, %12
  %18 = phi i32 [ 0, %12 ], [ %108, %66 ]
  %19 = icmp eq i32 %13, 0
  br i1 %19, label %30, label %20

20:                                               ; preds = %17, %20
  %21 = phi i32 [ %27, %20 ], [ %18, %17 ]
  %22 = phi i32 [ %28, %20 ], [ 0, %17 ]
  %23 = zext i32 %21 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %4, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !4, !amdgpu.noclobber !8
  %26 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %21
  store float %25, float addrspace(3)* %26, align 4, !tbaa !4
  %27 = add nuw nsw i32 %21, 1
  %28 = add i32 %22, 1
  %29 = icmp eq i32 %28, %13
  br i1 %29, label %30, label %20, !llvm.loop !9

30:                                               ; preds = %17, %20, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !11
  %32 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %33 = getelementptr i8, i8 addrspace(4)* %32, i64 4
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4, !range !12, !invariant.load !8
  %36 = zext i16 %35 to i32
  %37 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 12
  %38 = bitcast i8 addrspace(4)* %37 to i32 addrspace(4)*
  %39 = load i32, i32 addrspace(4)* %38, align 4, !tbaa !13
  %40 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %41 = mul i32 %40, %36
  %42 = add i32 %41, %31
  %43 = icmp slt i32 %42, %1
  br i1 %43, label %44, label %421

44:                                               ; preds = %30
  %45 = icmp sgt i32 %0, 0
  %46 = mul nuw nsw i32 %31, 3
  %47 = icmp sgt i32 %2, 1
  %48 = udiv i32 %39, %36
  %49 = mul i32 %48, %36
  %50 = icmp ugt i32 %39, %49
  %51 = zext i1 %50 to i32
  %52 = add i32 %48, %51
  %53 = mul i32 %52, %36
  %54 = and i32 %0, 7
  %55 = icmp ult i32 %0, 8
  %56 = and i32 %0, -8
  %57 = icmp eq i32 %54, 0
  %58 = and i32 %0, 7
  %59 = icmp ult i32 %0, 8
  %60 = and i32 %0, -8
  %61 = icmp eq i32 %58, 0
  %62 = and i32 %0, 7
  %63 = icmp ult i32 %0, 8
  %64 = and i32 %0, -8
  %65 = icmp eq i32 %62, 0
  br label %111

66:                                               ; preds = %66, %15
  %67 = phi i32 [ 0, %15 ], [ %108, %66 ]
  %68 = phi i32 [ 0, %15 ], [ %109, %66 ]
  %69 = zext i32 %67 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %4, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !4, !amdgpu.noclobber !8
  %72 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %67
  store float %71, float addrspace(3)* %72, align 4, !tbaa !4
  %73 = or i32 %67, 1
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %4, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !4, !amdgpu.noclobber !8
  %77 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %73
  store float %76, float addrspace(3)* %77, align 4, !tbaa !4
  %78 = or i32 %67, 2
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %4, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !4, !amdgpu.noclobber !8
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %78
  store float %81, float addrspace(3)* %82, align 4, !tbaa !4
  %83 = or i32 %67, 3
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %4, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !4, !amdgpu.noclobber !8
  %87 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %83
  store float %86, float addrspace(3)* %87, align 4, !tbaa !4
  %88 = or i32 %67, 4
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %4, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !4, !amdgpu.noclobber !8
  %92 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %88
  store float %91, float addrspace(3)* %92, align 4, !tbaa !4
  %93 = or i32 %67, 5
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %4, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !4, !amdgpu.noclobber !8
  %97 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %93
  store float %96, float addrspace(3)* %97, align 4, !tbaa !4
  %98 = or i32 %67, 6
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %4, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !4, !amdgpu.noclobber !8
  %102 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %98
  store float %101, float addrspace(3)* %102, align 4, !tbaa !4
  %103 = or i32 %67, 7
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %4, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !4, !amdgpu.noclobber !8
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %103
  store float %106, float addrspace(3)* %107, align 4, !tbaa !4
  %108 = add nuw nsw i32 %67, 8
  %109 = add i32 %68, 8
  %110 = icmp eq i32 %109, %16
  br i1 %110, label %17, label %66, !llvm.loop !22

111:                                              ; preds = %44, %418
  %112 = phi i32 [ %42, %44 ], [ %419, %418 ]
  br i1 %45, label %113, label %228

113:                                              ; preds = %111
  %114 = mul nsw i32 %112, 3
  br i1 %55, label %115, label %230

115:                                              ; preds = %230, %113
  %116 = phi i32 [ 0, %113 ], [ %288, %230 ]
  br i1 %57, label %129, label %117

117:                                              ; preds = %115, %117
  %118 = phi i32 [ %126, %117 ], [ %116, %115 ]
  %119 = phi i32 [ %127, %117 ], [ 0, %115 ]
  %120 = add nsw i32 %118, %114
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %3, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !4, !amdgpu.noclobber !8
  %124 = add nuw i32 %118, %46
  %125 = getelementptr inbounds float, float addrspace(3)* %9, i32 %124
  store float %123, float addrspace(3)* %125, align 4, !tbaa !4
  %126 = add nuw nsw i32 %118, 1
  %127 = add i32 %119, 1
  %128 = icmp eq i32 %127, %54
  br i1 %128, label %129, label %117, !llvm.loop !24

129:                                              ; preds = %117, %115
  br i1 %45, label %130, label %228

130:                                              ; preds = %129
  br i1 %59, label %209, label %131

131:                                              ; preds = %130, %131
  %132 = phi i32 [ %206, %131 ], [ 0, %130 ]
  %133 = phi float [ %205, %131 ], [ 0.000000e+00, %130 ]
  %134 = phi i32 [ %207, %131 ], [ 0, %130 ]
  %135 = add nuw nsw i32 %132, %46
  %136 = getelementptr inbounds float, float addrspace(3)* %9, i32 %135
  %137 = load float, float addrspace(3)* %136, align 4, !tbaa !4
  %138 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %132
  %139 = load float, float addrspace(3)* %138, align 4, !tbaa !4
  %140 = fsub contract float %137, %139
  %141 = fmul contract float %140, %140
  %142 = fadd contract float %133, %141
  %143 = or i32 %132, 1
  %144 = add nuw nsw i32 %143, %46
  %145 = getelementptr inbounds float, float addrspace(3)* %9, i32 %144
  %146 = load float, float addrspace(3)* %145, align 4, !tbaa !4
  %147 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %143
  %148 = load float, float addrspace(3)* %147, align 4, !tbaa !4
  %149 = fsub contract float %146, %148
  %150 = fmul contract float %149, %149
  %151 = fadd contract float %142, %150
  %152 = or i32 %132, 2
  %153 = add nuw nsw i32 %152, %46
  %154 = getelementptr inbounds float, float addrspace(3)* %9, i32 %153
  %155 = load float, float addrspace(3)* %154, align 4, !tbaa !4
  %156 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %152
  %157 = load float, float addrspace(3)* %156, align 4, !tbaa !4
  %158 = fsub contract float %155, %157
  %159 = fmul contract float %158, %158
  %160 = fadd contract float %151, %159
  %161 = or i32 %132, 3
  %162 = add nuw nsw i32 %161, %46
  %163 = getelementptr inbounds float, float addrspace(3)* %9, i32 %162
  %164 = load float, float addrspace(3)* %163, align 4, !tbaa !4
  %165 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %161
  %166 = load float, float addrspace(3)* %165, align 4, !tbaa !4
  %167 = fsub contract float %164, %166
  %168 = fmul contract float %167, %167
  %169 = fadd contract float %160, %168
  %170 = or i32 %132, 4
  %171 = add nuw nsw i32 %170, %46
  %172 = getelementptr inbounds float, float addrspace(3)* %9, i32 %171
  %173 = load float, float addrspace(3)* %172, align 4, !tbaa !4
  %174 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %170
  %175 = load float, float addrspace(3)* %174, align 4, !tbaa !4
  %176 = fsub contract float %173, %175
  %177 = fmul contract float %176, %176
  %178 = fadd contract float %169, %177
  %179 = or i32 %132, 5
  %180 = add nuw nsw i32 %179, %46
  %181 = getelementptr inbounds float, float addrspace(3)* %9, i32 %180
  %182 = load float, float addrspace(3)* %181, align 4, !tbaa !4
  %183 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %179
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !4
  %185 = fsub contract float %182, %184
  %186 = fmul contract float %185, %185
  %187 = fadd contract float %178, %186
  %188 = or i32 %132, 6
  %189 = add nuw nsw i32 %188, %46
  %190 = getelementptr inbounds float, float addrspace(3)* %9, i32 %189
  %191 = load float, float addrspace(3)* %190, align 4, !tbaa !4
  %192 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %188
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !4
  %194 = fsub contract float %191, %193
  %195 = fmul contract float %194, %194
  %196 = fadd contract float %187, %195
  %197 = or i32 %132, 7
  %198 = add nuw nsw i32 %197, %46
  %199 = getelementptr inbounds float, float addrspace(3)* %9, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !4
  %201 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %197
  %202 = load float, float addrspace(3)* %201, align 4, !tbaa !4
  %203 = fsub contract float %200, %202
  %204 = fmul contract float %203, %203
  %205 = fadd contract float %196, %204
  %206 = add nuw nsw i32 %132, 8
  %207 = add i32 %134, 8
  %208 = icmp eq i32 %207, %60
  br i1 %208, label %209, label %131, !llvm.loop !25

209:                                              ; preds = %131, %130
  %210 = phi float [ undef, %130 ], [ %205, %131 ]
  %211 = phi i32 [ 0, %130 ], [ %206, %131 ]
  %212 = phi float [ 0.000000e+00, %130 ], [ %205, %131 ]
  br i1 %61, label %228, label %213

213:                                              ; preds = %209, %213
  %214 = phi i32 [ %225, %213 ], [ %211, %209 ]
  %215 = phi float [ %224, %213 ], [ %212, %209 ]
  %216 = phi i32 [ %226, %213 ], [ 0, %209 ]
  %217 = add nuw nsw i32 %214, %46
  %218 = getelementptr inbounds float, float addrspace(3)* %9, i32 %217
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !4
  %220 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %214
  %221 = load float, float addrspace(3)* %220, align 4, !tbaa !4
  %222 = fsub contract float %219, %221
  %223 = fmul contract float %222, %222
  %224 = fadd contract float %215, %223
  %225 = add nuw nsw i32 %214, 1
  %226 = add i32 %216, 1
  %227 = icmp eq i32 %226, %58
  br i1 %227, label %228, label %213, !llvm.loop !26

228:                                              ; preds = %209, %213, %111, %129
  %229 = phi float [ 0.000000e+00, %129 ], [ 0.000000e+00, %111 ], [ %210, %209 ], [ %224, %213 ]
  br i1 %47, label %291, label %410

230:                                              ; preds = %113, %230
  %231 = phi i32 [ %288, %230 ], [ 0, %113 ]
  %232 = phi i32 [ %289, %230 ], [ 0, %113 ]
  %233 = add nsw i32 %231, %114
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %3, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !4, !amdgpu.noclobber !8
  %237 = add nuw i32 %231, %46
  %238 = getelementptr inbounds float, float addrspace(3)* %9, i32 %237
  store float %236, float addrspace(3)* %238, align 4, !tbaa !4
  %239 = or i32 %231, 1
  %240 = add nsw i32 %239, %114
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %3, i64 %241
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !4, !amdgpu.noclobber !8
  %244 = add nuw i32 %239, %46
  %245 = getelementptr inbounds float, float addrspace(3)* %9, i32 %244
  store float %243, float addrspace(3)* %245, align 4, !tbaa !4
  %246 = or i32 %231, 2
  %247 = add nsw i32 %246, %114
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %3, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !4, !amdgpu.noclobber !8
  %251 = add nuw i32 %246, %46
  %252 = getelementptr inbounds float, float addrspace(3)* %9, i32 %251
  store float %250, float addrspace(3)* %252, align 4, !tbaa !4
  %253 = or i32 %231, 3
  %254 = add nsw i32 %253, %114
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %3, i64 %255
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !4, !amdgpu.noclobber !8
  %258 = add nuw i32 %253, %46
  %259 = getelementptr inbounds float, float addrspace(3)* %9, i32 %258
  store float %257, float addrspace(3)* %259, align 4, !tbaa !4
  %260 = or i32 %231, 4
  %261 = add nsw i32 %260, %114
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %3, i64 %262
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !4, !amdgpu.noclobber !8
  %265 = add nuw i32 %260, %46
  %266 = getelementptr inbounds float, float addrspace(3)* %9, i32 %265
  store float %264, float addrspace(3)* %266, align 4, !tbaa !4
  %267 = or i32 %231, 5
  %268 = add nsw i32 %267, %114
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %3, i64 %269
  %271 = load float, float addrspace(1)* %270, align 4, !tbaa !4, !amdgpu.noclobber !8
  %272 = add nuw i32 %267, %46
  %273 = getelementptr inbounds float, float addrspace(3)* %9, i32 %272
  store float %271, float addrspace(3)* %273, align 4, !tbaa !4
  %274 = or i32 %231, 6
  %275 = add nsw i32 %274, %114
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds float, float addrspace(1)* %3, i64 %276
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !4, !amdgpu.noclobber !8
  %279 = add nuw i32 %274, %46
  %280 = getelementptr inbounds float, float addrspace(3)* %9, i32 %279
  store float %278, float addrspace(3)* %280, align 4, !tbaa !4
  %281 = or i32 %231, 7
  %282 = add nsw i32 %281, %114
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %3, i64 %283
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !4, !amdgpu.noclobber !8
  %286 = add nuw i32 %281, %46
  %287 = getelementptr inbounds float, float addrspace(3)* %9, i32 %286
  store float %285, float addrspace(3)* %287, align 4, !tbaa !4
  %288 = add nuw nsw i32 %231, 8
  %289 = add i32 %232, 8
  %290 = icmp eq i32 %289, %56
  br i1 %290, label %115, label %230, !llvm.loop !27

291:                                              ; preds = %228, %403
  %292 = phi float [ %407, %403 ], [ %229, %228 ]
  %293 = phi i32 [ %408, %403 ], [ 1, %228 ]
  %294 = phi i32 [ %406, %403 ], [ 0, %228 ]
  br i1 %45, label %295, label %403

295:                                              ; preds = %291
  %296 = mul nsw i32 %293, 3
  br i1 %63, label %383, label %297

297:                                              ; preds = %295, %297
  %298 = phi i32 [ %380, %297 ], [ 0, %295 ]
  %299 = phi float [ %379, %297 ], [ 0.000000e+00, %295 ]
  %300 = phi i32 [ %381, %297 ], [ 0, %295 ]
  %301 = add nuw nsw i32 %298, %46
  %302 = getelementptr inbounds float, float addrspace(3)* %9, i32 %301
  %303 = load float, float addrspace(3)* %302, align 4, !tbaa !4
  %304 = add nuw nsw i32 %298, %296
  %305 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %304
  %306 = load float, float addrspace(3)* %305, align 4, !tbaa !4
  %307 = fsub contract float %303, %306
  %308 = fmul contract float %307, %307
  %309 = fadd contract float %299, %308
  %310 = or i32 %298, 1
  %311 = add nuw nsw i32 %310, %46
  %312 = getelementptr inbounds float, float addrspace(3)* %9, i32 %311
  %313 = load float, float addrspace(3)* %312, align 4, !tbaa !4
  %314 = add nuw nsw i32 %310, %296
  %315 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %314
  %316 = load float, float addrspace(3)* %315, align 4, !tbaa !4
  %317 = fsub contract float %313, %316
  %318 = fmul contract float %317, %317
  %319 = fadd contract float %309, %318
  %320 = or i32 %298, 2
  %321 = add nuw nsw i32 %320, %46
  %322 = getelementptr inbounds float, float addrspace(3)* %9, i32 %321
  %323 = load float, float addrspace(3)* %322, align 4, !tbaa !4
  %324 = add nuw nsw i32 %320, %296
  %325 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %324
  %326 = load float, float addrspace(3)* %325, align 4, !tbaa !4
  %327 = fsub contract float %323, %326
  %328 = fmul contract float %327, %327
  %329 = fadd contract float %319, %328
  %330 = or i32 %298, 3
  %331 = add nuw nsw i32 %330, %46
  %332 = getelementptr inbounds float, float addrspace(3)* %9, i32 %331
  %333 = load float, float addrspace(3)* %332, align 4, !tbaa !4
  %334 = add nuw nsw i32 %330, %296
  %335 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %334
  %336 = load float, float addrspace(3)* %335, align 4, !tbaa !4
  %337 = fsub contract float %333, %336
  %338 = fmul contract float %337, %337
  %339 = fadd contract float %329, %338
  %340 = or i32 %298, 4
  %341 = add nuw nsw i32 %340, %46
  %342 = getelementptr inbounds float, float addrspace(3)* %9, i32 %341
  %343 = load float, float addrspace(3)* %342, align 4, !tbaa !4
  %344 = add nuw nsw i32 %340, %296
  %345 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %344
  %346 = load float, float addrspace(3)* %345, align 4, !tbaa !4
  %347 = fsub contract float %343, %346
  %348 = fmul contract float %347, %347
  %349 = fadd contract float %339, %348
  %350 = or i32 %298, 5
  %351 = add nuw nsw i32 %350, %46
  %352 = getelementptr inbounds float, float addrspace(3)* %9, i32 %351
  %353 = load float, float addrspace(3)* %352, align 4, !tbaa !4
  %354 = add nuw nsw i32 %350, %296
  %355 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %354
  %356 = load float, float addrspace(3)* %355, align 4, !tbaa !4
  %357 = fsub contract float %353, %356
  %358 = fmul contract float %357, %357
  %359 = fadd contract float %349, %358
  %360 = or i32 %298, 6
  %361 = add nuw nsw i32 %360, %46
  %362 = getelementptr inbounds float, float addrspace(3)* %9, i32 %361
  %363 = load float, float addrspace(3)* %362, align 4, !tbaa !4
  %364 = add nuw nsw i32 %360, %296
  %365 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %364
  %366 = load float, float addrspace(3)* %365, align 4, !tbaa !4
  %367 = fsub contract float %363, %366
  %368 = fmul contract float %367, %367
  %369 = fadd contract float %359, %368
  %370 = or i32 %298, 7
  %371 = add nuw nsw i32 %370, %46
  %372 = getelementptr inbounds float, float addrspace(3)* %9, i32 %371
  %373 = load float, float addrspace(3)* %372, align 4, !tbaa !4
  %374 = add nuw nsw i32 %370, %296
  %375 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %374
  %376 = load float, float addrspace(3)* %375, align 4, !tbaa !4
  %377 = fsub contract float %373, %376
  %378 = fmul contract float %377, %377
  %379 = fadd contract float %369, %378
  %380 = add nuw nsw i32 %298, 8
  %381 = add i32 %300, 8
  %382 = icmp eq i32 %381, %64
  br i1 %382, label %383, label %297, !llvm.loop !25

383:                                              ; preds = %297, %295
  %384 = phi float [ undef, %295 ], [ %379, %297 ]
  %385 = phi i32 [ 0, %295 ], [ %380, %297 ]
  %386 = phi float [ 0.000000e+00, %295 ], [ %379, %297 ]
  br i1 %65, label %403, label %387

387:                                              ; preds = %383, %387
  %388 = phi i32 [ %400, %387 ], [ %385, %383 ]
  %389 = phi float [ %399, %387 ], [ %386, %383 ]
  %390 = phi i32 [ %401, %387 ], [ 0, %383 ]
  %391 = add nuw nsw i32 %388, %46
  %392 = getelementptr inbounds float, float addrspace(3)* %9, i32 %391
  %393 = load float, float addrspace(3)* %392, align 4, !tbaa !4
  %394 = add nuw nsw i32 %388, %296
  %395 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 %394
  %396 = load float, float addrspace(3)* %395, align 4, !tbaa !4
  %397 = fsub contract float %393, %396
  %398 = fmul contract float %397, %397
  %399 = fadd contract float %389, %398
  %400 = add nuw nsw i32 %388, 1
  %401 = add i32 %390, 1
  %402 = icmp eq i32 %401, %62
  br i1 %402, label %403, label %387, !llvm.loop !28

403:                                              ; preds = %383, %387, %291
  %404 = phi float [ 0.000000e+00, %291 ], [ %384, %383 ], [ %399, %387 ]
  %405 = fcmp contract olt float %404, %292
  %406 = select i1 %405, i32 %293, i32 %294
  %407 = select i1 %405, float %404, float %292
  %408 = add nuw nsw i32 %293, 1
  %409 = icmp eq i32 %408, %2
  br i1 %409, label %410, label %291, !llvm.loop !29

410:                                              ; preds = %403, %228
  %411 = phi i32 [ 0, %228 ], [ %406, %403 ]
  %412 = sext i32 %112 to i64
  %413 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %412
  %414 = load i32, i32 addrspace(1)* %413, align 4, !tbaa !30
  %415 = icmp eq i32 %414, %411
  br i1 %415, label %418, label %416

416:                                              ; preds = %410
  %417 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %412
  store i32 1, i32 addrspace(1)* %417, align 4, !tbaa !30
  store i32 %411, i32 addrspace(1)* %413, align 4, !tbaa !30
  br label %418

418:                                              ; preds = %416, %410
  %419 = add i32 %53, %112
  %420 = icmp slt i32 %419, %1
  br i1 %420, label %111, label %421, !llvm.loop !32

421:                                              ; preds = %418, %30
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{i32 0, i32 1024}
!12 = !{i16 1, i16 1025}
!13 = !{!14, !18, i64 12}
!14 = !{!"hsa_kernel_dispatch_packet_s", !15, i64 0, !15, i64 2, !15, i64 4, !15, i64 6, !15, i64 8, !15, i64 10, !18, i64 12, !18, i64 16, !18, i64 20, !18, i64 24, !18, i64 28, !19, i64 32, !20, i64 40, !19, i64 48, !21, i64 56}
!15 = !{!"short", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !{!"int", !16, i64 0}
!19 = !{!"long", !16, i64 0}
!20 = !{!"any pointer", !16, i64 0}
!21 = !{!"hsa_signal_s", !19, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !10}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !10}
!27 = distinct !{!27, !23}
!28 = distinct !{!28, !10}
!29 = distinct !{!29, !23}
!30 = !{!31, !31, i64 0}
!31 = !{!"int", !6, i64 0}
!32 = distinct !{!32, !23}
