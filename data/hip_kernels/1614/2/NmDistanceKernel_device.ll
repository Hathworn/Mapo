; ModuleID = '../data/hip_kernels/1614/2/main.cu'
source_filename = "../data/hip_kernels/1614/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf = internal unnamed_addr addrspace(3) global [10240 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16NmDistanceKerneliiPKfiS0_PfPi(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = icmp slt i32 %8, %0
  br i1 %9, label %10, label %42

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
  br label %30

30:                                               ; preds = %10, %43
  %31 = phi i32 [ %8, %10 ], [ %45, %43 ]
  br i1 %11, label %32, label %43

32:                                               ; preds = %30
  %33 = mul nsw i32 %31, %3
  %34 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %35 = zext i16 %34 to i32
  %36 = mul i32 %16, %35
  %37 = add i32 %36, %12
  %38 = icmp slt i32 %37, %1
  %39 = mul nsw i32 %31, %1
  %40 = load i16, i16 addrspace(4)* %20, align 2
  %41 = zext i16 %40 to i32
  br label %47

42:                                               ; preds = %43, %7
  ret void

43:                                               ; preds = %83, %30
  %44 = add i32 %26, %31
  %45 = add i32 %44, %29
  %46 = icmp slt i32 %45, %0
  br i1 %46, label %30, label %42, !llvm.loop !15

47:                                               ; preds = %32, %83
  %48 = phi i32 [ 0, %32 ], [ %49, %83 ]
  %49 = add nuw nsw i32 %48, 2048
  %50 = tail call i32 @llvm.smin.i32(i32 %3, i32 %49)
  %51 = sub nsw i32 %50, %48
  %52 = mul nsw i32 %51, 5
  %53 = icmp slt i32 %12, %52
  br i1 %53, label %54, label %59

54:                                               ; preds = %47
  %55 = add nsw i32 %48, %33
  %56 = mul nsw i32 %55, 5
  %57 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %58 = zext i16 %57 to i32
  br label %74

59:                                               ; preds = %74, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %60, label %83

60:                                               ; preds = %59
  %61 = and i32 %50, 5
  %62 = sub nsw i32 %51, %61
  %63 = icmp eq i32 %62, 2048
  %64 = icmp sgt i32 %62, 0
  %65 = icmp eq i32 %61, 0
  %66 = icmp eq i32 %48, 0
  %67 = load i32, i32 addrspace(4)* %18, align 8, !tbaa !17
  %68 = udiv i32 %67, %41
  %69 = mul i32 %68, %41
  %70 = icmp ugt i32 %67, %69
  %71 = zext i1 %70 to i32
  %72 = add i32 %68, %71
  %73 = mul i32 %72, %35
  br label %85

74:                                               ; preds = %54, %74
  %75 = phi i32 [ %12, %54 ], [ %81, %74 ]
  %76 = add nsw i32 %75, %56
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %4, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !18
  %80 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %75
  store float %79, float addrspace(3)* %80, align 4, !tbaa !18
  %81 = add i32 %75, %58
  %82 = icmp slt i32 %81, %52
  br i1 %82, label %74, label %59, !llvm.loop !22

83:                                               ; preds = %444, %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = icmp slt i32 %49, %3
  br i1 %84, label %47, label %43, !llvm.loop !23

85:                                               ; preds = %60, %444
  %86 = phi i32 [ %37, %60 ], [ %445, %444 ]
  %87 = add nsw i32 %86, %39
  %88 = mul nsw i32 %87, 5
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !18
  %92 = add nsw i32 %88, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !18
  %96 = add nsw i32 %88, 2
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !18
  %100 = add nsw i32 %88, 3
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !18
  %104 = add nsw i32 %88, 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !18
  br i1 %63, label %109, label %108

108:                                              ; preds = %85
  br i1 %64, label %249, label %389

109:                                              ; preds = %85, %109
  %110 = phi i32 [ %246, %109 ], [ 0, %85 ]
  %111 = phi float [ %245, %109 ], [ 0.000000e+00, %85 ]
  %112 = phi i32 [ %247, %109 ], [ 0, %85 ]
  %113 = mul nuw nsw i32 %112, 5
  %114 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %113
  %115 = load float, float addrspace(3)* %114, align 16, !tbaa !18
  %116 = fsub contract float %115, %91
  %117 = or i32 %113, 1
  %118 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %117
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !18
  %120 = fsub contract float %119, %95
  %121 = or i32 %113, 2
  %122 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %121
  %123 = load float, float addrspace(3)* %122, align 8, !tbaa !18
  %124 = fsub contract float %123, %99
  %125 = or i32 %113, 3
  %126 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %125
  %127 = load float, float addrspace(3)* %126, align 4, !tbaa !18
  %128 = fsub contract float %127, %103
  %129 = add nuw nsw i32 %113, 4
  %130 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %129
  %131 = load float, float addrspace(3)* %130, align 16, !tbaa !18
  %132 = fsub contract float %131, %107
  %133 = fmul contract float %116, %116
  %134 = fmul contract float %120, %120
  %135 = fadd contract float %133, %134
  %136 = fmul contract float %124, %124
  %137 = fadd contract float %135, %136
  %138 = fmul contract float %128, %128
  %139 = fadd contract float %137, %138
  %140 = fmul contract float %132, %132
  %141 = fadd contract float %139, %140
  %142 = icmp eq i32 %112, 0
  %143 = fcmp contract olt float %141, %111
  %144 = select i1 %142, i1 true, i1 %143
  %145 = add nuw nsw i32 %112, %48
  %146 = select i1 %144, float %141, float %111
  %147 = select i1 %144, i32 %145, i32 %110
  %148 = add nuw nsw i32 %113, 5
  %149 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %148
  %150 = load float, float addrspace(3)* %149, align 4, !tbaa !18
  %151 = fsub contract float %150, %91
  %152 = add nuw nsw i32 %113, 6
  %153 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %152
  %154 = load float, float addrspace(3)* %153, align 8, !tbaa !18
  %155 = fsub contract float %154, %95
  %156 = add nuw nsw i32 %113, 7
  %157 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %156
  %158 = load float, float addrspace(3)* %157, align 4, !tbaa !18
  %159 = fsub contract float %158, %99
  %160 = add nuw nsw i32 %113, 8
  %161 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %160
  %162 = load float, float addrspace(3)* %161, align 16, !tbaa !18
  %163 = fsub contract float %162, %103
  %164 = add nuw nsw i32 %113, 9
  %165 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %164
  %166 = load float, float addrspace(3)* %165, align 4, !tbaa !18
  %167 = fsub contract float %166, %107
  %168 = fmul contract float %151, %151
  %169 = fmul contract float %155, %155
  %170 = fadd contract float %168, %169
  %171 = fmul contract float %159, %159
  %172 = fadd contract float %170, %171
  %173 = fmul contract float %163, %163
  %174 = fadd contract float %172, %173
  %175 = fmul contract float %167, %167
  %176 = fadd contract float %174, %175
  %177 = fcmp contract olt float %176, %146
  %178 = or i32 %145, 1
  %179 = select i1 %177, float %176, float %146
  %180 = select i1 %177, i32 %178, i32 %147
  %181 = add nuw nsw i32 %113, 10
  %182 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %181
  %183 = load float, float addrspace(3)* %182, align 8, !tbaa !18
  %184 = fsub contract float %183, %91
  %185 = add nuw nsw i32 %113, 11
  %186 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %185
  %187 = load float, float addrspace(3)* %186, align 4, !tbaa !18
  %188 = fsub contract float %187, %95
  %189 = add nuw nsw i32 %113, 12
  %190 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %189
  %191 = load float, float addrspace(3)* %190, align 16, !tbaa !18
  %192 = fsub contract float %191, %99
  %193 = add nuw nsw i32 %113, 13
  %194 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %193
  %195 = load float, float addrspace(3)* %194, align 4, !tbaa !18
  %196 = fsub contract float %195, %103
  %197 = add nuw nsw i32 %113, 14
  %198 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %197
  %199 = load float, float addrspace(3)* %198, align 8, !tbaa !18
  %200 = fsub contract float %199, %107
  %201 = fmul contract float %184, %184
  %202 = fmul contract float %188, %188
  %203 = fadd contract float %201, %202
  %204 = fmul contract float %192, %192
  %205 = fadd contract float %203, %204
  %206 = fmul contract float %196, %196
  %207 = fadd contract float %205, %206
  %208 = fmul contract float %200, %200
  %209 = fadd contract float %207, %208
  %210 = fcmp contract olt float %209, %179
  %211 = or i32 %145, 2
  %212 = select i1 %210, float %209, float %179
  %213 = select i1 %210, i32 %211, i32 %180
  %214 = add nuw nsw i32 %113, 15
  %215 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %214
  %216 = load float, float addrspace(3)* %215, align 4, !tbaa !18
  %217 = fsub contract float %216, %91
  %218 = add nuw nsw i32 %113, 16
  %219 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %218
  %220 = load float, float addrspace(3)* %219, align 16, !tbaa !18
  %221 = fsub contract float %220, %95
  %222 = add nuw nsw i32 %113, 17
  %223 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %222
  %224 = load float, float addrspace(3)* %223, align 4, !tbaa !18
  %225 = fsub contract float %224, %99
  %226 = add nuw nsw i32 %113, 18
  %227 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %226
  %228 = load float, float addrspace(3)* %227, align 8, !tbaa !18
  %229 = fsub contract float %228, %103
  %230 = add nuw nsw i32 %113, 19
  %231 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %230
  %232 = load float, float addrspace(3)* %231, align 4, !tbaa !18
  %233 = fsub contract float %232, %107
  %234 = fmul contract float %217, %217
  %235 = fmul contract float %221, %221
  %236 = fadd contract float %234, %235
  %237 = fmul contract float %225, %225
  %238 = fadd contract float %236, %237
  %239 = fmul contract float %229, %229
  %240 = fadd contract float %238, %239
  %241 = fmul contract float %233, %233
  %242 = fadd contract float %240, %241
  %243 = fcmp contract olt float %242, %212
  %244 = or i32 %145, 3
  %245 = select i1 %243, float %242, float %212
  %246 = select i1 %243, i32 %244, i32 %213
  %247 = add nuw nsw i32 %112, 4
  %248 = icmp ult i32 %112, 2044
  br i1 %248, label %109, label %389, !llvm.loop !24

249:                                              ; preds = %108, %249
  %250 = phi i32 [ %386, %249 ], [ 0, %108 ]
  %251 = phi float [ %385, %249 ], [ 0.000000e+00, %108 ]
  %252 = phi i32 [ %387, %249 ], [ 0, %108 ]
  %253 = mul nuw nsw i32 %252, 5
  %254 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %253
  %255 = load float, float addrspace(3)* %254, align 16, !tbaa !18
  %256 = fsub contract float %255, %91
  %257 = or i32 %253, 1
  %258 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %257
  %259 = load float, float addrspace(3)* %258, align 4, !tbaa !18
  %260 = fsub contract float %259, %95
  %261 = or i32 %253, 2
  %262 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %261
  %263 = load float, float addrspace(3)* %262, align 8, !tbaa !18
  %264 = fsub contract float %263, %99
  %265 = or i32 %253, 3
  %266 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %265
  %267 = load float, float addrspace(3)* %266, align 4, !tbaa !18
  %268 = fsub contract float %267, %103
  %269 = add nuw nsw i32 %253, 4
  %270 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %269
  %271 = load float, float addrspace(3)* %270, align 16, !tbaa !18
  %272 = fsub contract float %271, %107
  %273 = fmul contract float %256, %256
  %274 = fmul contract float %260, %260
  %275 = fadd contract float %273, %274
  %276 = fmul contract float %264, %264
  %277 = fadd contract float %275, %276
  %278 = fmul contract float %268, %268
  %279 = fadd contract float %277, %278
  %280 = fmul contract float %272, %272
  %281 = fadd contract float %279, %280
  %282 = icmp eq i32 %252, 0
  %283 = fcmp contract olt float %281, %251
  %284 = select i1 %282, i1 true, i1 %283
  %285 = add nuw nsw i32 %252, %48
  %286 = select i1 %284, float %281, float %251
  %287 = select i1 %284, i32 %285, i32 %250
  %288 = add nuw nsw i32 %253, 5
  %289 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %288
  %290 = load float, float addrspace(3)* %289, align 4, !tbaa !18
  %291 = fsub contract float %290, %91
  %292 = add nuw nsw i32 %253, 6
  %293 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %292
  %294 = load float, float addrspace(3)* %293, align 8, !tbaa !18
  %295 = fsub contract float %294, %95
  %296 = add nuw nsw i32 %253, 7
  %297 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %296
  %298 = load float, float addrspace(3)* %297, align 4, !tbaa !18
  %299 = fsub contract float %298, %99
  %300 = add nuw nsw i32 %253, 8
  %301 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %300
  %302 = load float, float addrspace(3)* %301, align 16, !tbaa !18
  %303 = fsub contract float %302, %103
  %304 = add nuw nsw i32 %253, 9
  %305 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %304
  %306 = load float, float addrspace(3)* %305, align 4, !tbaa !18
  %307 = fsub contract float %306, %107
  %308 = fmul contract float %291, %291
  %309 = fmul contract float %295, %295
  %310 = fadd contract float %308, %309
  %311 = fmul contract float %299, %299
  %312 = fadd contract float %310, %311
  %313 = fmul contract float %303, %303
  %314 = fadd contract float %312, %313
  %315 = fmul contract float %307, %307
  %316 = fadd contract float %314, %315
  %317 = fcmp contract olt float %316, %286
  %318 = or i32 %285, 1
  %319 = select i1 %317, float %316, float %286
  %320 = select i1 %317, i32 %318, i32 %287
  %321 = add nuw nsw i32 %253, 10
  %322 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %321
  %323 = load float, float addrspace(3)* %322, align 8, !tbaa !18
  %324 = fsub contract float %323, %91
  %325 = add nuw nsw i32 %253, 11
  %326 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %325
  %327 = load float, float addrspace(3)* %326, align 4, !tbaa !18
  %328 = fsub contract float %327, %95
  %329 = add nuw nsw i32 %253, 12
  %330 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %329
  %331 = load float, float addrspace(3)* %330, align 16, !tbaa !18
  %332 = fsub contract float %331, %99
  %333 = add nuw nsw i32 %253, 13
  %334 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %333
  %335 = load float, float addrspace(3)* %334, align 4, !tbaa !18
  %336 = fsub contract float %335, %103
  %337 = add nuw nsw i32 %253, 14
  %338 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %337
  %339 = load float, float addrspace(3)* %338, align 8, !tbaa !18
  %340 = fsub contract float %339, %107
  %341 = fmul contract float %324, %324
  %342 = fmul contract float %328, %328
  %343 = fadd contract float %341, %342
  %344 = fmul contract float %332, %332
  %345 = fadd contract float %343, %344
  %346 = fmul contract float %336, %336
  %347 = fadd contract float %345, %346
  %348 = fmul contract float %340, %340
  %349 = fadd contract float %347, %348
  %350 = fcmp contract olt float %349, %319
  %351 = or i32 %285, 2
  %352 = select i1 %350, float %349, float %319
  %353 = select i1 %350, i32 %351, i32 %320
  %354 = add nuw nsw i32 %253, 15
  %355 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %354
  %356 = load float, float addrspace(3)* %355, align 4, !tbaa !18
  %357 = fsub contract float %356, %91
  %358 = add nuw nsw i32 %253, 16
  %359 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %358
  %360 = load float, float addrspace(3)* %359, align 16, !tbaa !18
  %361 = fsub contract float %360, %95
  %362 = add nuw nsw i32 %253, 17
  %363 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %362
  %364 = load float, float addrspace(3)* %363, align 4, !tbaa !18
  %365 = fsub contract float %364, %99
  %366 = add nuw nsw i32 %253, 18
  %367 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %366
  %368 = load float, float addrspace(3)* %367, align 8, !tbaa !18
  %369 = fsub contract float %368, %103
  %370 = add nuw nsw i32 %253, 19
  %371 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %370
  %372 = load float, float addrspace(3)* %371, align 4, !tbaa !18
  %373 = fsub contract float %372, %107
  %374 = fmul contract float %357, %357
  %375 = fmul contract float %361, %361
  %376 = fadd contract float %374, %375
  %377 = fmul contract float %365, %365
  %378 = fadd contract float %376, %377
  %379 = fmul contract float %369, %369
  %380 = fadd contract float %378, %379
  %381 = fmul contract float %373, %373
  %382 = fadd contract float %380, %381
  %383 = fcmp contract olt float %382, %352
  %384 = or i32 %285, 3
  %385 = select i1 %383, float %382, float %352
  %386 = select i1 %383, i32 %384, i32 %353
  %387 = add nuw nsw i32 %252, 4
  %388 = icmp slt i32 %387, %62
  br i1 %388, label %249, label %389, !llvm.loop !25

389:                                              ; preds = %249, %109, %108
  %390 = phi float [ 0.000000e+00, %108 ], [ %245, %109 ], [ %385, %249 ]
  %391 = phi i32 [ 0, %108 ], [ %246, %109 ], [ %386, %249 ]
  br i1 %65, label %392, label %396

392:                                              ; preds = %396, %389
  %393 = phi float [ %390, %389 ], [ %433, %396 ]
  %394 = phi i32 [ %391, %389 ], [ %434, %396 ]
  %395 = sext i32 %87 to i64
  br i1 %66, label %441, label %437

396:                                              ; preds = %389, %396
  %397 = phi i32 [ %434, %396 ], [ %391, %389 ]
  %398 = phi i32 [ %435, %396 ], [ %62, %389 ]
  %399 = phi float [ %433, %396 ], [ %390, %389 ]
  %400 = mul nsw i32 %398, 5
  %401 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %400
  %402 = load float, float addrspace(3)* %401, align 4, !tbaa !18
  %403 = fsub contract float %402, %91
  %404 = add nsw i32 %400, 1
  %405 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %404
  %406 = load float, float addrspace(3)* %405, align 4, !tbaa !18
  %407 = fsub contract float %406, %95
  %408 = add nsw i32 %400, 2
  %409 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %408
  %410 = load float, float addrspace(3)* %409, align 4, !tbaa !18
  %411 = fsub contract float %410, %99
  %412 = add nsw i32 %400, 3
  %413 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %412
  %414 = load float, float addrspace(3)* %413, align 4, !tbaa !18
  %415 = fsub contract float %414, %103
  %416 = add nsw i32 %400, 4
  %417 = getelementptr inbounds [10240 x float], [10240 x float] addrspace(3)* @_ZZ16NmDistanceKerneliiPKfiS0_PfPiE3buf, i32 0, i32 %416
  %418 = load float, float addrspace(3)* %417, align 4, !tbaa !18
  %419 = fsub contract float %418, %107
  %420 = fmul contract float %403, %403
  %421 = fmul contract float %407, %407
  %422 = fadd contract float %420, %421
  %423 = fmul contract float %411, %411
  %424 = fadd contract float %422, %423
  %425 = fmul contract float %415, %415
  %426 = fadd contract float %424, %425
  %427 = fmul contract float %419, %419
  %428 = fadd contract float %426, %427
  %429 = icmp eq i32 %398, 0
  %430 = fcmp contract olt float %428, %399
  %431 = select i1 %429, i1 true, i1 %430
  %432 = add nsw i32 %398, %48
  %433 = select i1 %431, float %428, float %399
  %434 = select i1 %431, i32 %432, i32 %397
  %435 = add nsw i32 %398, 1
  %436 = icmp slt i32 %435, %51
  br i1 %436, label %396, label %392, !llvm.loop !26

437:                                              ; preds = %392
  %438 = getelementptr inbounds float, float addrspace(1)* %5, i64 %395
  %439 = load float, float addrspace(1)* %438, align 4, !tbaa !18
  %440 = fcmp contract ogt float %439, %393
  br i1 %440, label %441, label %444

441:                                              ; preds = %392, %437
  %442 = getelementptr inbounds float, float addrspace(1)* %5, i64 %395
  store float %393, float addrspace(1)* %442, align 4, !tbaa !18
  %443 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %395
  store i32 %394, i32 addrspace(1)* %443, align 4, !tbaa !27
  br label %444

444:                                              ; preds = %441, %437
  %445 = add i32 %73, %86
  %446 = icmp slt i32 %445, %1
  br i1 %446, label %85, label %83, !llvm.loop !29
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
