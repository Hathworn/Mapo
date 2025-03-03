; ModuleID = '../data/hip_kernels/1138/4/main.cu'
source_filename = "../data/hip_kernels/1138/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

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
  %51 = shl nsw i32 %50, 1
  %52 = icmp slt i32 %12, %51
  br i1 %52, label %53, label %56

53:                                               ; preds = %46
  %54 = add nsw i32 %47, %37
  %55 = shl nsw i32 %54, 1
  br label %71

56:                                               ; preds = %71, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %33, label %57, label %80

57:                                               ; preds = %56
  %58 = and i32 %49, 2
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
  %77 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %72
  store float %76, float addrspace(3)* %77, align 4, !tbaa !18
  %78 = add i32 %72, %25
  %79 = icmp slt i32 %78, %51
  br i1 %79, label %71, label %56, !llvm.loop !22

80:                                               ; preds = %328, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp slt i32 %48, %3
  br i1 %81, label %46, label %42, !llvm.loop !23

82:                                               ; preds = %57, %328
  %83 = phi i32 [ %32, %57 ], [ %329, %328 ]
  %84 = add nsw i32 %83, %38
  %85 = shl nsw i32 %84, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !18
  %89 = add nuw nsw i32 %85, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !18
  br i1 %60, label %94, label %93

93:                                               ; preds = %82
  br i1 %61, label %223, label %291

94:                                               ; preds = %82, %94
  %95 = phi i32 [ %220, %94 ], [ 0, %82 ]
  %96 = phi float [ %219, %94 ], [ 0.000000e+00, %82 ]
  %97 = phi i32 [ %221, %94 ], [ 0, %82 ]
  %98 = shl nuw nsw i32 %97, 1
  %99 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %98
  %100 = load float, float addrspace(3)* %99, align 16, !tbaa !18
  %101 = fsub contract float %100, %88
  %102 = add nuw nsw i32 %98, 1
  %103 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %102
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !18
  %105 = fsub contract float %104, %92
  %106 = fmul contract float %101, %101
  %107 = fmul contract float %105, %105
  %108 = fadd contract float %106, %107
  %109 = icmp eq i32 %97, 0
  %110 = fcmp contract olt float %108, %96
  %111 = select i1 %109, i1 true, i1 %110
  %112 = add nuw nsw i32 %97, %47
  %113 = select i1 %111, float %108, float %96
  %114 = select i1 %111, i32 %112, i32 %95
  %115 = add nuw nsw i32 %98, 2
  %116 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %115
  %117 = load float, float addrspace(3)* %116, align 8, !tbaa !18
  %118 = fsub contract float %117, %88
  %119 = add nuw nsw i32 %98, 3
  %120 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %119
  %121 = load float, float addrspace(3)* %120, align 4, !tbaa !18
  %122 = fsub contract float %121, %92
  %123 = fmul contract float %118, %118
  %124 = fmul contract float %122, %122
  %125 = fadd contract float %123, %124
  %126 = fcmp contract olt float %125, %113
  %127 = or i32 %112, 1
  %128 = select i1 %126, float %125, float %113
  %129 = select i1 %126, i32 %127, i32 %114
  %130 = add nuw nsw i32 %98, 4
  %131 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %130
  %132 = load float, float addrspace(3)* %131, align 16, !tbaa !18
  %133 = fsub contract float %132, %88
  %134 = add nuw nsw i32 %98, 5
  %135 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %134
  %136 = load float, float addrspace(3)* %135, align 4, !tbaa !18
  %137 = fsub contract float %136, %92
  %138 = fmul contract float %133, %133
  %139 = fmul contract float %137, %137
  %140 = fadd contract float %138, %139
  %141 = fcmp contract olt float %140, %128
  %142 = or i32 %112, 2
  %143 = select i1 %141, float %140, float %128
  %144 = select i1 %141, i32 %142, i32 %129
  %145 = add nuw nsw i32 %98, 6
  %146 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %145
  %147 = load float, float addrspace(3)* %146, align 8, !tbaa !18
  %148 = fsub contract float %147, %88
  %149 = add nuw nsw i32 %98, 7
  %150 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %149
  %151 = load float, float addrspace(3)* %150, align 4, !tbaa !18
  %152 = fsub contract float %151, %92
  %153 = fmul contract float %148, %148
  %154 = fmul contract float %152, %152
  %155 = fadd contract float %153, %154
  %156 = fcmp contract olt float %155, %143
  %157 = or i32 %112, 3
  %158 = select i1 %156, float %155, float %143
  %159 = select i1 %156, i32 %157, i32 %144
  %160 = or i32 %97, 4
  %161 = shl nuw nsw i32 %160, 1
  %162 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %161
  %163 = load float, float addrspace(3)* %162, align 16, !tbaa !18
  %164 = fsub contract float %163, %88
  %165 = add nuw nsw i32 %161, 1
  %166 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %165
  %167 = load float, float addrspace(3)* %166, align 4, !tbaa !18
  %168 = fsub contract float %167, %92
  %169 = fmul contract float %164, %164
  %170 = fmul contract float %168, %168
  %171 = fadd contract float %169, %170
  %172 = fcmp contract olt float %171, %158
  %173 = add nuw nsw i32 %160, %47
  %174 = select i1 %172, float %171, float %158
  %175 = select i1 %172, i32 %173, i32 %159
  %176 = add nuw nsw i32 %161, 2
  %177 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %176
  %178 = load float, float addrspace(3)* %177, align 8, !tbaa !18
  %179 = fsub contract float %178, %88
  %180 = add nuw nsw i32 %161, 3
  %181 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %180
  %182 = load float, float addrspace(3)* %181, align 4, !tbaa !18
  %183 = fsub contract float %182, %92
  %184 = fmul contract float %179, %179
  %185 = fmul contract float %183, %183
  %186 = fadd contract float %184, %185
  %187 = fcmp contract olt float %186, %174
  %188 = or i32 %173, 1
  %189 = select i1 %187, float %186, float %174
  %190 = select i1 %187, i32 %188, i32 %175
  %191 = add nuw nsw i32 %161, 4
  %192 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %191
  %193 = load float, float addrspace(3)* %192, align 16, !tbaa !18
  %194 = fsub contract float %193, %88
  %195 = add nuw nsw i32 %161, 5
  %196 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %195
  %197 = load float, float addrspace(3)* %196, align 4, !tbaa !18
  %198 = fsub contract float %197, %92
  %199 = fmul contract float %194, %194
  %200 = fmul contract float %198, %198
  %201 = fadd contract float %199, %200
  %202 = fcmp contract olt float %201, %189
  %203 = or i32 %173, 2
  %204 = select i1 %202, float %201, float %189
  %205 = select i1 %202, i32 %203, i32 %190
  %206 = add nuw nsw i32 %161, 6
  %207 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %206
  %208 = load float, float addrspace(3)* %207, align 8, !tbaa !18
  %209 = fsub contract float %208, %88
  %210 = add nuw nsw i32 %161, 7
  %211 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %210
  %212 = load float, float addrspace(3)* %211, align 4, !tbaa !18
  %213 = fsub contract float %212, %92
  %214 = fmul contract float %209, %209
  %215 = fmul contract float %213, %213
  %216 = fadd contract float %214, %215
  %217 = fcmp contract olt float %216, %204
  %218 = or i32 %173, 3
  %219 = select i1 %217, float %216, float %204
  %220 = select i1 %217, i32 %218, i32 %205
  %221 = add nuw nsw i32 %97, 8
  %222 = icmp ult i32 %160, 508
  br i1 %222, label %94, label %291, !llvm.loop !24

223:                                              ; preds = %93, %223
  %224 = phi i32 [ %288, %223 ], [ 0, %93 ]
  %225 = phi float [ %287, %223 ], [ 0.000000e+00, %93 ]
  %226 = phi i32 [ %289, %223 ], [ 0, %93 ]
  %227 = shl nuw nsw i32 %226, 1
  %228 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %227
  %229 = load float, float addrspace(3)* %228, align 16, !tbaa !18
  %230 = fsub contract float %229, %88
  %231 = add nuw nsw i32 %227, 1
  %232 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %231
  %233 = load float, float addrspace(3)* %232, align 4, !tbaa !18
  %234 = fsub contract float %233, %92
  %235 = fmul contract float %230, %230
  %236 = fmul contract float %234, %234
  %237 = fadd contract float %235, %236
  %238 = icmp eq i32 %226, 0
  %239 = fcmp contract olt float %237, %225
  %240 = select i1 %238, i1 true, i1 %239
  %241 = add nuw nsw i32 %226, %47
  %242 = select i1 %240, float %237, float %225
  %243 = select i1 %240, i32 %241, i32 %224
  %244 = add nuw nsw i32 %227, 2
  %245 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %244
  %246 = load float, float addrspace(3)* %245, align 8, !tbaa !18
  %247 = fsub contract float %246, %88
  %248 = add nuw nsw i32 %227, 3
  %249 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %248
  %250 = load float, float addrspace(3)* %249, align 4, !tbaa !18
  %251 = fsub contract float %250, %92
  %252 = fmul contract float %247, %247
  %253 = fmul contract float %251, %251
  %254 = fadd contract float %252, %253
  %255 = fcmp contract olt float %254, %242
  %256 = or i32 %241, 1
  %257 = select i1 %255, float %254, float %242
  %258 = select i1 %255, i32 %256, i32 %243
  %259 = add nuw nsw i32 %227, 4
  %260 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %259
  %261 = load float, float addrspace(3)* %260, align 16, !tbaa !18
  %262 = fsub contract float %261, %88
  %263 = add nuw nsw i32 %227, 5
  %264 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %263
  %265 = load float, float addrspace(3)* %264, align 4, !tbaa !18
  %266 = fsub contract float %265, %92
  %267 = fmul contract float %262, %262
  %268 = fmul contract float %266, %266
  %269 = fadd contract float %267, %268
  %270 = fcmp contract olt float %269, %257
  %271 = or i32 %241, 2
  %272 = select i1 %270, float %269, float %257
  %273 = select i1 %270, i32 %271, i32 %258
  %274 = add nuw nsw i32 %227, 6
  %275 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %274
  %276 = load float, float addrspace(3)* %275, align 8, !tbaa !18
  %277 = fsub contract float %276, %88
  %278 = add nuw nsw i32 %227, 7
  %279 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %278
  %280 = load float, float addrspace(3)* %279, align 4, !tbaa !18
  %281 = fsub contract float %280, %92
  %282 = fmul contract float %277, %277
  %283 = fmul contract float %281, %281
  %284 = fadd contract float %282, %283
  %285 = fcmp contract olt float %284, %272
  %286 = or i32 %241, 3
  %287 = select i1 %285, float %284, float %272
  %288 = select i1 %285, i32 %286, i32 %273
  %289 = add nuw nsw i32 %226, 4
  %290 = icmp slt i32 %289, %59
  br i1 %290, label %223, label %291, !llvm.loop !25

291:                                              ; preds = %223, %94, %93
  %292 = phi float [ 0.000000e+00, %93 ], [ %219, %94 ], [ %287, %223 ]
  %293 = phi i32 [ 0, %93 ], [ %220, %94 ], [ %288, %223 ]
  br i1 %62, label %294, label %298

294:                                              ; preds = %298, %291
  %295 = phi float [ %292, %291 ], [ %317, %298 ]
  %296 = phi i32 [ %293, %291 ], [ %318, %298 ]
  %297 = sext i32 %84 to i64
  br i1 %63, label %325, label %321

298:                                              ; preds = %291, %298
  %299 = phi i32 [ %319, %298 ], [ %59, %291 ]
  %300 = phi i32 [ %318, %298 ], [ %293, %291 ]
  %301 = phi float [ %317, %298 ], [ %292, %291 ]
  %302 = shl nsw i32 %299, 1
  %303 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %302
  %304 = load float, float addrspace(3)* %303, align 8, !tbaa !18
  %305 = fsub contract float %304, %88
  %306 = add nuw nsw i32 %302, 1
  %307 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %306
  %308 = load float, float addrspace(3)* %307, align 4, !tbaa !18
  %309 = fsub contract float %308, %92
  %310 = fmul contract float %305, %305
  %311 = fmul contract float %309, %309
  %312 = fadd contract float %310, %311
  %313 = icmp eq i32 %299, 0
  %314 = fcmp contract olt float %312, %301
  %315 = select i1 %313, i1 true, i1 %314
  %316 = add nsw i32 %299, %47
  %317 = select i1 %315, float %312, float %301
  %318 = select i1 %315, i32 %316, i32 %300
  %319 = add nsw i32 %299, 1
  %320 = icmp slt i32 %319, %50
  br i1 %320, label %298, label %294, !llvm.loop !26

321:                                              ; preds = %294
  %322 = getelementptr inbounds float, float addrspace(1)* %5, i64 %297
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !18
  %324 = fcmp contract ogt float %323, %295
  br i1 %324, label %325, label %328

325:                                              ; preds = %294, %321
  %326 = getelementptr inbounds float, float addrspace(1)* %5, i64 %297
  store float %295, float addrspace(1)* %326, align 4, !tbaa !18
  %327 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %297
  store i32 %296, i32 addrspace(1)* %327, align 4, !tbaa !27
  br label %328

328:                                              ; preds = %325, %321
  %329 = add i32 %70, %83
  %330 = icmp slt i32 %329, %1
  br i1 %330, label %82, label %80, !llvm.loop !29
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
