; ModuleID = '../data/hip_kernels/18239/4/main.cu'
source_filename = "../data/hip_kernels/18239/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf = internal unnamed_addr addrspace(3) global [1536 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16NmDistanceKerneliiPKfiS0_PfPi(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = icmp slt i32 %8, %0
  br i1 %9, label %10, label %41

10:                                               ; preds = %7
  %11 = icmp sgt i32 %3, 0
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %13 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 16
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !4
  %24 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %23, %25
  %27 = mul i32 %26, %25
  %28 = icmp ugt i32 %23, %27
  %29 = zext i1 %28 to i32
  %30 = zext i16 %24 to i32
  %31 = mul i32 %16, %30
  %32 = add i32 %31, %12
  %33 = icmp slt i32 %32, %1
  br label %34

34:                                               ; preds = %10, %42
  %35 = phi i32 [ %8, %10 ], [ %44, %42 ]
  br i1 %11, label %36, label %42

36:                                               ; preds = %34
  %37 = mul nsw i32 %35, %3
  %38 = mul nsw i32 %35, %1
  %39 = load i16, i16 addrspace(4)* %20, align 2
  %40 = zext i16 %39 to i32
  br label %46

41:                                               ; preds = %42, %7
  ret void

42:                                               ; preds = %80, %34
  %43 = add i32 %26, %35
  %44 = add i32 %43, %29
  %45 = icmp slt i32 %44, %0
  br i1 %45, label %34, label %41, !llvm.loop !15

46:                                               ; preds = %36, %80
  %47 = phi i32 [ 0, %36 ], [ %48, %80 ]
  %48 = add nuw nsw i32 %47, 512
  %49 = tail call i32 @llvm.smin.i32(i32 %3, i32 %48)
  %50 = sub nsw i32 %49, %47
  %51 = mul nsw i32 %50, 3
  %52 = icmp slt i32 %12, %51
  br i1 %52, label %53, label %56

53:                                               ; preds = %46
  %54 = add nsw i32 %47, %37
  %55 = mul nsw i32 %54, 3
  br label %71

56:                                               ; preds = %71, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %33, label %57, label %80

57:                                               ; preds = %56
  %58 = and i32 %49, 3
  %59 = sub nsw i32 %50, %58
  %60 = icmp eq i32 %59, 512
  %61 = icmp sgt i32 %59, 0
  %62 = icmp eq i32 %58, 0
  %63 = icmp eq i32 %47, 0
  %64 = load i32, i32 addrspace(4)* %18, align 8, !tbaa !17
  %65 = udiv i32 %64, %40
  %66 = mul i32 %65, %40
  %67 = icmp ugt i32 %64, %66
  %68 = zext i1 %67 to i32
  %69 = add i32 %65, %68
  %70 = mul i32 %69, %30
  br label %82

71:                                               ; preds = %53, %71
  %72 = phi i32 [ %12, %53 ], [ %78, %71 ]
  %73 = add nsw i32 %72, %55
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %4, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !18
  %77 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %72
  store float %76, float addrspace(3)* %77, align 4, !tbaa !18
  %78 = add i32 %72, %25
  %79 = icmp slt i32 %78, %51
  br i1 %79, label %71, label %56, !llvm.loop !22

80:                                               ; preds = %325, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp slt i32 %48, %3
  br i1 %81, label %46, label %42, !llvm.loop !23

82:                                               ; preds = %57, %325
  %83 = phi i32 [ %32, %57 ], [ %326, %325 ]
  %84 = add nsw i32 %83, %38
  %85 = mul nsw i32 %84, 3
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !18
  %89 = add nsw i32 %85, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !18
  %93 = add nsw i32 %85, 2
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !18
  br i1 %60, label %98, label %97

97:                                               ; preds = %82
  br i1 %61, label %190, label %282

98:                                               ; preds = %82, %98
  %99 = phi i32 [ %187, %98 ], [ 0, %82 ]
  %100 = phi float [ %186, %98 ], [ 0.000000e+00, %82 ]
  %101 = phi i32 [ %188, %98 ], [ 0, %82 ]
  %102 = mul nuw nsw i32 %101, 3
  %103 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %102
  %104 = load float, float addrspace(3)* %103, align 16, !tbaa !18
  %105 = fsub contract float %104, %88
  %106 = or i32 %102, 1
  %107 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %106
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !18
  %109 = fsub contract float %108, %92
  %110 = or i32 %102, 2
  %111 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %110
  %112 = load float, float addrspace(3)* %111, align 8, !tbaa !18
  %113 = fsub contract float %112, %96
  %114 = fmul contract float %105, %105
  %115 = fmul contract float %109, %109
  %116 = fadd contract float %114, %115
  %117 = fmul contract float %113, %113
  %118 = fadd contract float %116, %117
  %119 = icmp eq i32 %101, 0
  %120 = fcmp contract olt float %118, %100
  %121 = select i1 %119, i1 true, i1 %120
  %122 = add nuw nsw i32 %101, %47
  %123 = select i1 %121, float %118, float %100
  %124 = select i1 %121, i32 %122, i32 %99
  %125 = or i32 %102, 3
  %126 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %125
  %127 = load float, float addrspace(3)* %126, align 4, !tbaa !18
  %128 = fsub contract float %127, %88
  %129 = add nuw nsw i32 %102, 4
  %130 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %129
  %131 = load float, float addrspace(3)* %130, align 16, !tbaa !18
  %132 = fsub contract float %131, %92
  %133 = add nuw nsw i32 %102, 5
  %134 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !18
  %136 = fsub contract float %135, %96
  %137 = fmul contract float %128, %128
  %138 = fmul contract float %132, %132
  %139 = fadd contract float %137, %138
  %140 = fmul contract float %136, %136
  %141 = fadd contract float %139, %140
  %142 = fcmp contract olt float %141, %123
  %143 = or i32 %122, 1
  %144 = select i1 %142, float %141, float %123
  %145 = select i1 %142, i32 %143, i32 %124
  %146 = add nuw nsw i32 %102, 6
  %147 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %146
  %148 = load float, float addrspace(3)* %147, align 8, !tbaa !18
  %149 = fsub contract float %148, %88
  %150 = add nuw nsw i32 %102, 7
  %151 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %150
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !18
  %153 = fsub contract float %152, %92
  %154 = add nuw nsw i32 %102, 8
  %155 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %154
  %156 = load float, float addrspace(3)* %155, align 16, !tbaa !18
  %157 = fsub contract float %156, %96
  %158 = fmul contract float %149, %149
  %159 = fmul contract float %153, %153
  %160 = fadd contract float %158, %159
  %161 = fmul contract float %157, %157
  %162 = fadd contract float %160, %161
  %163 = fcmp contract olt float %162, %144
  %164 = or i32 %122, 2
  %165 = select i1 %163, float %162, float %144
  %166 = select i1 %163, i32 %164, i32 %145
  %167 = add nuw nsw i32 %102, 9
  %168 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %167
  %169 = load float, float addrspace(3)* %168, align 4, !tbaa !18
  %170 = fsub contract float %169, %88
  %171 = add nuw nsw i32 %102, 10
  %172 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %171
  %173 = load float, float addrspace(3)* %172, align 8, !tbaa !18
  %174 = fsub contract float %173, %92
  %175 = add nuw nsw i32 %102, 11
  %176 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %175
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !18
  %178 = fsub contract float %177, %96
  %179 = fmul contract float %170, %170
  %180 = fmul contract float %174, %174
  %181 = fadd contract float %179, %180
  %182 = fmul contract float %178, %178
  %183 = fadd contract float %181, %182
  %184 = fcmp contract olt float %183, %165
  %185 = or i32 %122, 3
  %186 = select i1 %184, float %183, float %165
  %187 = select i1 %184, i32 %185, i32 %166
  %188 = add nuw nsw i32 %101, 4
  %189 = icmp ult i32 %101, 508
  br i1 %189, label %98, label %282, !llvm.loop !24

190:                                              ; preds = %97, %190
  %191 = phi i32 [ %279, %190 ], [ 0, %97 ]
  %192 = phi float [ %278, %190 ], [ 0.000000e+00, %97 ]
  %193 = phi i32 [ %280, %190 ], [ 0, %97 ]
  %194 = mul nuw nsw i32 %193, 3
  %195 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %194
  %196 = load float, float addrspace(3)* %195, align 16, !tbaa !18
  %197 = fsub contract float %196, %88
  %198 = or i32 %194, 1
  %199 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !18
  %201 = fsub contract float %200, %92
  %202 = or i32 %194, 2
  %203 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %202
  %204 = load float, float addrspace(3)* %203, align 8, !tbaa !18
  %205 = fsub contract float %204, %96
  %206 = fmul contract float %197, %197
  %207 = fmul contract float %201, %201
  %208 = fadd contract float %206, %207
  %209 = fmul contract float %205, %205
  %210 = fadd contract float %208, %209
  %211 = icmp eq i32 %193, 0
  %212 = fcmp contract olt float %210, %192
  %213 = select i1 %211, i1 true, i1 %212
  %214 = add nuw nsw i32 %193, %47
  %215 = select i1 %213, float %210, float %192
  %216 = select i1 %213, i32 %214, i32 %191
  %217 = or i32 %194, 3
  %218 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %217
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !18
  %220 = fsub contract float %219, %88
  %221 = add nuw nsw i32 %194, 4
  %222 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %221
  %223 = load float, float addrspace(3)* %222, align 16, !tbaa !18
  %224 = fsub contract float %223, %92
  %225 = add nuw nsw i32 %194, 5
  %226 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %225
  %227 = load float, float addrspace(3)* %226, align 4, !tbaa !18
  %228 = fsub contract float %227, %96
  %229 = fmul contract float %220, %220
  %230 = fmul contract float %224, %224
  %231 = fadd contract float %229, %230
  %232 = fmul contract float %228, %228
  %233 = fadd contract float %231, %232
  %234 = fcmp contract olt float %233, %215
  %235 = or i32 %214, 1
  %236 = select i1 %234, float %233, float %215
  %237 = select i1 %234, i32 %235, i32 %216
  %238 = add nuw nsw i32 %194, 6
  %239 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %238
  %240 = load float, float addrspace(3)* %239, align 8, !tbaa !18
  %241 = fsub contract float %240, %88
  %242 = add nuw nsw i32 %194, 7
  %243 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %242
  %244 = load float, float addrspace(3)* %243, align 4, !tbaa !18
  %245 = fsub contract float %244, %92
  %246 = add nuw nsw i32 %194, 8
  %247 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %246
  %248 = load float, float addrspace(3)* %247, align 16, !tbaa !18
  %249 = fsub contract float %248, %96
  %250 = fmul contract float %241, %241
  %251 = fmul contract float %245, %245
  %252 = fadd contract float %250, %251
  %253 = fmul contract float %249, %249
  %254 = fadd contract float %252, %253
  %255 = fcmp contract olt float %254, %236
  %256 = or i32 %214, 2
  %257 = select i1 %255, float %254, float %236
  %258 = select i1 %255, i32 %256, i32 %237
  %259 = add nuw nsw i32 %194, 9
  %260 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %259
  %261 = load float, float addrspace(3)* %260, align 4, !tbaa !18
  %262 = fsub contract float %261, %88
  %263 = add nuw nsw i32 %194, 10
  %264 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %263
  %265 = load float, float addrspace(3)* %264, align 8, !tbaa !18
  %266 = fsub contract float %265, %92
  %267 = add nuw nsw i32 %194, 11
  %268 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %267
  %269 = load float, float addrspace(3)* %268, align 4, !tbaa !18
  %270 = fsub contract float %269, %96
  %271 = fmul contract float %262, %262
  %272 = fmul contract float %266, %266
  %273 = fadd contract float %271, %272
  %274 = fmul contract float %270, %270
  %275 = fadd contract float %273, %274
  %276 = fcmp contract olt float %275, %257
  %277 = or i32 %214, 3
  %278 = select i1 %276, float %275, float %257
  %279 = select i1 %276, i32 %277, i32 %258
  %280 = add nuw nsw i32 %193, 4
  %281 = icmp slt i32 %280, %59
  br i1 %281, label %190, label %282, !llvm.loop !25

282:                                              ; preds = %190, %98, %97
  %283 = phi float [ 0.000000e+00, %97 ], [ %186, %98 ], [ %278, %190 ]
  %284 = phi i32 [ 0, %97 ], [ %187, %98 ], [ %279, %190 ]
  br i1 %62, label %285, label %289

285:                                              ; preds = %289, %282
  %286 = phi float [ %283, %282 ], [ %314, %289 ]
  %287 = phi i32 [ %284, %282 ], [ %315, %289 ]
  %288 = sext i32 %84 to i64
  br i1 %63, label %322, label %318

289:                                              ; preds = %282, %289
  %290 = phi i32 [ %316, %289 ], [ %59, %282 ]
  %291 = phi i32 [ %315, %289 ], [ %284, %282 ]
  %292 = phi float [ %314, %289 ], [ %283, %282 ]
  %293 = mul nsw i32 %290, 3
  %294 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %293
  %295 = load float, float addrspace(3)* %294, align 4, !tbaa !18
  %296 = fsub contract float %295, %88
  %297 = add nsw i32 %293, 1
  %298 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %297
  %299 = load float, float addrspace(3)* %298, align 4, !tbaa !18
  %300 = fsub contract float %299, %92
  %301 = add nsw i32 %293, 2
  %302 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %301
  %303 = load float, float addrspace(3)* %302, align 4, !tbaa !18
  %304 = fsub contract float %303, %96
  %305 = fmul contract float %296, %296
  %306 = fmul contract float %300, %300
  %307 = fadd contract float %305, %306
  %308 = fmul contract float %304, %304
  %309 = fadd contract float %307, %308
  %310 = icmp eq i32 %290, 0
  %311 = fcmp contract olt float %309, %292
  %312 = select i1 %310, i1 true, i1 %311
  %313 = add nsw i32 %290, %47
  %314 = select i1 %312, float %309, float %292
  %315 = select i1 %312, i32 %313, i32 %291
  %316 = add nsw i32 %290, 1
  %317 = icmp slt i32 %316, %50
  br i1 %317, label %289, label %285, !llvm.loop !26

318:                                              ; preds = %285
  %319 = getelementptr inbounds float, float addrspace(1)* %5, i64 %288
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !18
  %321 = fcmp contract ogt float %320, %286
  br i1 %321, label %322, label %325

322:                                              ; preds = %285, %318
  %323 = getelementptr inbounds float, float addrspace(1)* %5, i64 %288
  store float %286, float addrspace(1)* %323, align 4, !tbaa !18
  %324 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %288
  store i32 %287, i32 addrspace(1)* %324, align 4, !tbaa !27
  br label %325

325:                                              ; preds = %322, %318
  %326 = add i32 %70, %83
  %327 = icmp slt i32 %326, %1
  br i1 %327, label %82, label %80, !llvm.loop !29
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!5, !9, i64 16}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !16}
!23 = distinct !{!23, !16}
!24 = distinct !{!24, !16}
!25 = distinct !{!25, !16}
!26 = distinct !{!26, !16}
!27 = !{!28, !28, i64 0}
!28 = !{!"int", !20, i64 0}
!29 = distinct !{!29, !16}
