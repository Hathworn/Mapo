; ModuleID = '../data/hip_kernels/14592/17/main.cu'
source_filename = "../data/hip_kernels/14592/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13subgradweightPfS_S_S_iiiiiiif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, float %11) local_unnamed_addr #0 {
  %13 = sub nsw i32 %6, %8
  %14 = sdiv i32 %13, %10
  %15 = add nsw i32 %14, 1
  %16 = sub nsw i32 %5, %7
  %17 = sdiv i32 %16, %9
  %18 = add nsw i32 %17, 1
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = urem i32 %19, %4
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %28 = getelementptr i8, i8 addrspace(4)* %22, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2, !range !5, !invariant.load !6
  %31 = zext i16 %30 to i32
  %32 = mul i32 %18, %15
  %33 = mul i32 %32, %19
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = mul i32 %19, %5
  %37 = mul i32 %36, %6
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = mul nuw nsw i32 %27, %26
  %41 = add nuw nsw i32 %40, %21
  %42 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %41
  store float 0.000000e+00, float addrspace(3)* %42, align 4, !tbaa !7
  %43 = icmp sgt i32 %27, %17
  br i1 %43, label %157, label %44

44:                                               ; preds = %12
  %45 = icmp sgt i32 %21, %14
  %46 = mul i32 %9, %6
  %47 = sext i32 %7 to i64
  %48 = icmp sgt i32 %7, 0
  %49 = sext i32 %8 to i64
  %50 = icmp sgt i32 %8, 0
  %51 = sext i32 %6 to i64
  %52 = and i64 %49, 7
  %53 = icmp ult i32 %8, 8
  %54 = and i64 %49, -8
  %55 = icmp eq i64 %52, 0
  br label %56

56:                                               ; preds = %44, %153
  %57 = phi float [ 0.000000e+00, %44 ], [ %154, %153 ]
  %58 = phi i32 [ %27, %44 ], [ %155, %153 ]
  br i1 %45, label %153, label %59

59:                                               ; preds = %56
  %60 = mul i32 %46, %58
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %39, i64 %61
  %63 = mul nsw i32 %58, %15
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %35, i64 %64
  br label %66

66:                                               ; preds = %59, %149
  %67 = phi float [ %57, %59 ], [ %150, %149 ]
  %68 = phi i32 [ %21, %59 ], [ %151, %149 ]
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %65, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  br i1 %48, label %72, label %149

72:                                               ; preds = %66
  %73 = mul nsw i32 %68, %10
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %62, i64 %74
  br label %76

76:                                               ; preds = %72, %144
  %77 = phi float [ %145, %144 ], [ %67, %72 ]
  %78 = phi i64 [ %147, %144 ], [ 0, %72 ]
  %79 = phi float addrspace(1)* [ %146, %144 ], [ %75, %72 ]
  br i1 %50, label %80, label %144

80:                                               ; preds = %76
  br i1 %53, label %127, label %81

81:                                               ; preds = %80, %81
  %82 = phi float [ %123, %81 ], [ %77, %80 ]
  %83 = phi i64 [ %124, %81 ], [ 0, %80 ]
  %84 = phi i64 [ %125, %81 ], [ 0, %80 ]
  %85 = getelementptr inbounds float, float addrspace(1)* %79, i64 %83
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fmul contract float %71, %86
  %88 = fadd contract float %82, %87
  %89 = or i64 %83, 1
  %90 = getelementptr inbounds float, float addrspace(1)* %79, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fmul contract float %71, %91
  %93 = fadd contract float %88, %92
  %94 = or i64 %83, 2
  %95 = getelementptr inbounds float, float addrspace(1)* %79, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fmul contract float %71, %96
  %98 = fadd contract float %93, %97
  %99 = or i64 %83, 3
  %100 = getelementptr inbounds float, float addrspace(1)* %79, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = fmul contract float %71, %101
  %103 = fadd contract float %98, %102
  %104 = or i64 %83, 4
  %105 = getelementptr inbounds float, float addrspace(1)* %79, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fmul contract float %71, %106
  %108 = fadd contract float %103, %107
  %109 = or i64 %83, 5
  %110 = getelementptr inbounds float, float addrspace(1)* %79, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = fmul contract float %71, %111
  %113 = fadd contract float %108, %112
  %114 = or i64 %83, 6
  %115 = getelementptr inbounds float, float addrspace(1)* %79, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fmul contract float %71, %116
  %118 = fadd contract float %113, %117
  %119 = or i64 %83, 7
  %120 = getelementptr inbounds float, float addrspace(1)* %79, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = fmul contract float %71, %121
  %123 = fadd contract float %118, %122
  %124 = add nuw nsw i64 %83, 8
  %125 = add i64 %84, 8
  %126 = icmp eq i64 %125, %54
  br i1 %126, label %127, label %81, !llvm.loop !11

127:                                              ; preds = %81, %80
  %128 = phi float [ undef, %80 ], [ %123, %81 ]
  %129 = phi float [ %77, %80 ], [ %123, %81 ]
  %130 = phi i64 [ 0, %80 ], [ %124, %81 ]
  br i1 %55, label %142, label %131

131:                                              ; preds = %127, %131
  %132 = phi float [ %138, %131 ], [ %129, %127 ]
  %133 = phi i64 [ %139, %131 ], [ %130, %127 ]
  %134 = phi i64 [ %140, %131 ], [ 0, %127 ]
  %135 = getelementptr inbounds float, float addrspace(1)* %79, i64 %133
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fmul contract float %71, %136
  %138 = fadd contract float %132, %137
  %139 = add nuw nsw i64 %133, 1
  %140 = add i64 %134, 1
  %141 = icmp eq i64 %140, %52
  br i1 %141, label %142, label %131, !llvm.loop !13

142:                                              ; preds = %131, %127
  %143 = phi float [ %128, %127 ], [ %138, %131 ]
  store float %143, float addrspace(3)* %42, align 4, !tbaa !7
  br label %144

144:                                              ; preds = %142, %76
  %145 = phi float [ %143, %142 ], [ %77, %76 ]
  %146 = getelementptr inbounds float, float addrspace(1)* %79, i64 %51
  %147 = add nuw nsw i64 %78, 1
  %148 = icmp eq i64 %147, %47
  br i1 %148, label %149, label %76, !llvm.loop !15

149:                                              ; preds = %144, %66
  %150 = phi float [ %67, %66 ], [ %145, %144 ]
  %151 = add nuw nsw i32 %68, %26
  %152 = icmp sgt i32 %151, %14
  br i1 %152, label %153, label %66, !llvm.loop !16

153:                                              ; preds = %149, %56
  %154 = phi float [ %57, %56 ], [ %150, %149 ]
  %155 = add nuw nsw i32 %58, %31
  %156 = icmp sgt i32 %155, %17
  br i1 %156, label %157, label %56, !llvm.loop !17

157:                                              ; preds = %153, %12
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %158 = icmp eq i32 %21, 0
  %159 = icmp eq i32 %27, 0
  %160 = select i1 %158, i1 %159, i1 false
  br i1 %160, label %161, label %234

161:                                              ; preds = %157
  %162 = mul nuw nsw i32 %31, %26
  %163 = sext i32 %20 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %2, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7
  %166 = and i32 %162, 7
  %167 = icmp ult i32 %162, 8
  br i1 %167, label %216, label %168

168:                                              ; preds = %161
  %169 = and i32 %162, 4194296
  br label %170

170:                                              ; preds = %170, %168
  %171 = phi i32 [ 0, %168 ], [ %213, %170 ]
  %172 = phi float [ %165, %168 ], [ %212, %170 ]
  %173 = phi i32 [ 0, %168 ], [ %214, %170 ]
  %174 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %171
  %175 = load float, float addrspace(3)* %174, align 16, !tbaa !7
  %176 = fmul contract float %175, %11
  %177 = fadd contract float %172, %176
  %178 = or i32 %171, 1
  %179 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %178
  %180 = load float, float addrspace(3)* %179, align 4, !tbaa !7
  %181 = fmul contract float %180, %11
  %182 = fadd contract float %177, %181
  %183 = or i32 %171, 2
  %184 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %183
  %185 = load float, float addrspace(3)* %184, align 8, !tbaa !7
  %186 = fmul contract float %185, %11
  %187 = fadd contract float %182, %186
  %188 = or i32 %171, 3
  %189 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %188
  %190 = load float, float addrspace(3)* %189, align 4, !tbaa !7
  %191 = fmul contract float %190, %11
  %192 = fadd contract float %187, %191
  %193 = or i32 %171, 4
  %194 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %193
  %195 = load float, float addrspace(3)* %194, align 16, !tbaa !7
  %196 = fmul contract float %195, %11
  %197 = fadd contract float %192, %196
  %198 = or i32 %171, 5
  %199 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !7
  %201 = fmul contract float %200, %11
  %202 = fadd contract float %197, %201
  %203 = or i32 %171, 6
  %204 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %203
  %205 = load float, float addrspace(3)* %204, align 8, !tbaa !7
  %206 = fmul contract float %205, %11
  %207 = fadd contract float %202, %206
  %208 = or i32 %171, 7
  %209 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %208
  %210 = load float, float addrspace(3)* %209, align 4, !tbaa !7
  %211 = fmul contract float %210, %11
  %212 = fadd contract float %207, %211
  %213 = add nuw nsw i32 %171, 8
  %214 = add i32 %173, 8
  %215 = icmp eq i32 %214, %169
  br i1 %215, label %216, label %170, !llvm.loop !18

216:                                              ; preds = %170, %161
  %217 = phi float [ undef, %161 ], [ %212, %170 ]
  %218 = phi i32 [ 0, %161 ], [ %213, %170 ]
  %219 = phi float [ %165, %161 ], [ %212, %170 ]
  %220 = icmp eq i32 %166, 0
  br i1 %220, label %232, label %221

221:                                              ; preds = %216, %221
  %222 = phi i32 [ %229, %221 ], [ %218, %216 ]
  %223 = phi float [ %228, %221 ], [ %219, %216 ]
  %224 = phi i32 [ %230, %221 ], [ 0, %216 ]
  %225 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %222
  %226 = load float, float addrspace(3)* %225, align 4, !tbaa !7
  %227 = fmul contract float %226, %11
  %228 = fadd contract float %223, %227
  %229 = add nuw nsw i32 %222, 1
  %230 = add i32 %224, 1
  %231 = icmp eq i32 %230, %166
  br i1 %231, label %232, label %221, !llvm.loop !19

232:                                              ; preds = %221, %216
  %233 = phi float [ %217, %216 ], [ %228, %221 ]
  store float %233, float addrspace(1)* %164, align 4, !tbaa !7
  br label %234

234:                                              ; preds = %232, %157
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store float 0.000000e+00, float addrspace(3)* %42, align 4, !tbaa !7
  %235 = icmp slt i32 %41, %32
  br i1 %235, label %236, label %239

236:                                              ; preds = %234
  %237 = mul nuw nsw i32 %31, %26
  br label %249

238:                                              ; preds = %249
  store float %255, float addrspace(3)* %42, align 4, !tbaa !7
  br label %239

239:                                              ; preds = %238, %234
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %160, label %240, label %322

240:                                              ; preds = %239
  %241 = mul nuw nsw i32 %31, %26
  %242 = sext i32 %20 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %3, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7
  %245 = and i32 %241, 7
  %246 = icmp ult i32 %241, 8
  br i1 %246, label %304, label %247

247:                                              ; preds = %240
  %248 = and i32 %241, 4194296
  br label %258

249:                                              ; preds = %236, %249
  %250 = phi float [ 0.000000e+00, %236 ], [ %255, %249 ]
  %251 = phi i32 [ %41, %236 ], [ %256, %249 ]
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %35, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !7
  %255 = fadd contract float %254, %250
  %256 = add i32 %251, %237
  %257 = icmp slt i32 %256, %32
  br i1 %257, label %249, label %238, !llvm.loop !20

258:                                              ; preds = %258, %247
  %259 = phi i32 [ 0, %247 ], [ %301, %258 ]
  %260 = phi float [ %244, %247 ], [ %300, %258 ]
  %261 = phi i32 [ 0, %247 ], [ %302, %258 ]
  %262 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %259
  %263 = load float, float addrspace(3)* %262, align 16, !tbaa !7
  %264 = fmul contract float %263, %11
  %265 = fadd contract float %260, %264
  %266 = or i32 %259, 1
  %267 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %266
  %268 = load float, float addrspace(3)* %267, align 4, !tbaa !7
  %269 = fmul contract float %268, %11
  %270 = fadd contract float %265, %269
  %271 = or i32 %259, 2
  %272 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %271
  %273 = load float, float addrspace(3)* %272, align 8, !tbaa !7
  %274 = fmul contract float %273, %11
  %275 = fadd contract float %270, %274
  %276 = or i32 %259, 3
  %277 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %276
  %278 = load float, float addrspace(3)* %277, align 4, !tbaa !7
  %279 = fmul contract float %278, %11
  %280 = fadd contract float %275, %279
  %281 = or i32 %259, 4
  %282 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %281
  %283 = load float, float addrspace(3)* %282, align 16, !tbaa !7
  %284 = fmul contract float %283, %11
  %285 = fadd contract float %280, %284
  %286 = or i32 %259, 5
  %287 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %286
  %288 = load float, float addrspace(3)* %287, align 4, !tbaa !7
  %289 = fmul contract float %288, %11
  %290 = fadd contract float %285, %289
  %291 = or i32 %259, 6
  %292 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %291
  %293 = load float, float addrspace(3)* %292, align 8, !tbaa !7
  %294 = fmul contract float %293, %11
  %295 = fadd contract float %290, %294
  %296 = or i32 %259, 7
  %297 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %296
  %298 = load float, float addrspace(3)* %297, align 4, !tbaa !7
  %299 = fmul contract float %298, %11
  %300 = fadd contract float %295, %299
  %301 = add nuw nsw i32 %259, 8
  %302 = add i32 %261, 8
  %303 = icmp eq i32 %302, %248
  br i1 %303, label %304, label %258, !llvm.loop !21

304:                                              ; preds = %258, %240
  %305 = phi float [ undef, %240 ], [ %300, %258 ]
  %306 = phi i32 [ 0, %240 ], [ %301, %258 ]
  %307 = phi float [ %244, %240 ], [ %300, %258 ]
  %308 = icmp eq i32 %245, 0
  br i1 %308, label %320, label %309

309:                                              ; preds = %304, %309
  %310 = phi i32 [ %317, %309 ], [ %306, %304 ]
  %311 = phi float [ %316, %309 ], [ %307, %304 ]
  %312 = phi i32 [ %318, %309 ], [ 0, %304 ]
  %313 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13subgradweightPfS_S_S_iiiiiiifE4sums, i32 0, i32 %310
  %314 = load float, float addrspace(3)* %313, align 4, !tbaa !7
  %315 = fmul contract float %314, %11
  %316 = fadd contract float %311, %315
  %317 = add nuw nsw i32 %310, 1
  %318 = add i32 %312, 1
  %319 = icmp eq i32 %318, %245
  br i1 %319, label %320, label %309, !llvm.loop !22

320:                                              ; preds = %309, %304
  %321 = phi float [ %305, %304 ], [ %316, %309 ]
  store float %321, float addrspace(1)* %243, align 4, !tbaa !7
  br label %322

322:                                              ; preds = %320, %239
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !12}
!22 = distinct !{!22, !14}
