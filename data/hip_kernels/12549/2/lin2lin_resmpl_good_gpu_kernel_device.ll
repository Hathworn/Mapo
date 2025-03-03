; ModuleID = '../data/hip_kernels/12549/2/main.cu'
source_filename = "../data/hip_kernels/12549/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@lTable_const = protected local_unnamed_addr addrspace(4) externally_initialized global [1064 x float] zeroinitializer, align 16
@mr_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mg_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mb_const = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z30lin2lin_resmpl_good_gpu_kernelPfS_S_S_S_iiiiifPiS0_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float %10, i32 addrspace(1)* nocapture readonly %11, i32 addrspace(1)* nocapture readonly %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %14
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = add i32 %29, %23
  %31 = icmp ult i32 %22, %7
  %32 = icmp ult i32 %30, %8
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %306

34:                                               ; preds = %13
  %35 = mul nsw i32 %6, %5
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = mul nsw i32 %8, %7
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = shl i32 %5, 1
  %42 = mul i32 %41, %6
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = shl nsw i32 %8, 1
  %46 = mul nsw i32 %45, %7
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = icmp eq i32 %6, %8
  %50 = icmp eq i32 %5, %7
  %51 = select i1 %49, i1 %50, i1 false
  br i1 %51, label %52, label %67

52:                                               ; preds = %34
  %53 = mul i32 %22, %7
  %54 = add i32 %30, %53
  %55 = mul nsw i32 %54, %9
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !6
  %59 = sext i32 %54 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  store float %58, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %37, i64 %56
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = getelementptr inbounds float, float addrspace(1)* %40, i64 %59
  store float %62, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = getelementptr inbounds float, float addrspace(1)* %44, i64 %56
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = getelementptr inbounds float, float addrspace(1)* %48, i64 %59
  store float %65, float addrspace(1)* %66, align 4, !tbaa !7
  br label %306

67:                                               ; preds = %34
  %68 = icmp eq i32 %45, %6
  br i1 %68, label %69, label %71

69:                                               ; preds = %67
  %70 = shl i32 %30, 1
  br label %81

71:                                               ; preds = %67
  %72 = mul nsw i32 %8, 3
  %73 = icmp eq i32 %72, %6
  br i1 %73, label %74, label %76

74:                                               ; preds = %71
  %75 = mul i32 %30, 3
  br label %81

76:                                               ; preds = %71
  %77 = shl nsw i32 %8, 2
  %78 = icmp eq i32 %77, %6
  %79 = shl i32 %30, 2
  %80 = select i1 %78, i32 %79, i32 0
  br label %81

81:                                               ; preds = %76, %74, %69
  %82 = phi i32 [ %70, %69 ], [ %75, %74 ], [ %80, %76 ]
  %83 = icmp eq i32 %30, 0
  %84 = select i1 %83, i32 0, i32 %82
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !11, !amdgpu.noclobber !6
  %88 = mul nsw i32 %87, %5
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = sext i32 %5 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %90, i64 %91
  %93 = getelementptr inbounds float, float addrspace(1)* %92, i64 %91
  %94 = getelementptr inbounds float, float addrspace(1)* %93, i64 %91
  %95 = getelementptr inbounds float, float addrspace(1)* %37, i64 %89
  %96 = getelementptr inbounds float, float addrspace(1)* %44, i64 %89
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %85
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !11, !amdgpu.noclobber !6
  %99 = mul nsw i32 %98, %7
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = getelementptr inbounds float, float addrspace(1)* %40, i64 %100
  %103 = getelementptr inbounds float, float addrspace(1)* %48, i64 %100
  br i1 %68, label %104, label %119

104:                                              ; preds = %81
  %105 = zext i32 %22 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %90, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = getelementptr inbounds float, float addrspace(1)* %92, i64 %105
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = fadd contract float %107, %109
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  store float %110, float addrspace(1)* %111, align 4, !tbaa !7
  %112 = getelementptr inbounds float, float addrspace(1)* %95, i64 %105
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %115 = fadd contract float %113, %114
  %116 = getelementptr inbounds float, float addrspace(1)* %3, i64 %105
  store float %115, float addrspace(1)* %116, align 4, !tbaa !7
  %117 = getelementptr inbounds float, float addrspace(1)* %96, i64 %105
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  br label %176

119:                                              ; preds = %81
  %120 = mul nsw i32 %8, 3
  %121 = icmp eq i32 %120, %6
  br i1 %121, label %122, label %144

122:                                              ; preds = %119
  %123 = zext i32 %22 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %90, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !6
  %126 = getelementptr inbounds float, float addrspace(1)* %92, i64 %123
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !6
  %128 = fadd contract float %125, %127
  %129 = getelementptr inbounds float, float addrspace(1)* %93, i64 %123
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !6
  %131 = fadd contract float %128, %130
  %132 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  store float %131, float addrspace(1)* %132, align 4, !tbaa !7
  %133 = getelementptr inbounds float, float addrspace(1)* %95, i64 %123
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %136 = fadd contract float %134, %135
  %137 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %138 = fadd contract float %136, %137
  %139 = getelementptr inbounds float, float addrspace(1)* %3, i64 %123
  store float %138, float addrspace(1)* %139, align 4, !tbaa !7
  %140 = getelementptr inbounds float, float addrspace(1)* %96, i64 %123
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %143 = fadd contract float %141, %142
  br label %176

144:                                              ; preds = %119
  %145 = shl nsw i32 %8, 2
  %146 = icmp eq i32 %145, %6
  br i1 %146, label %147, label %183

147:                                              ; preds = %144
  %148 = zext i32 %22 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %90, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !6
  %151 = getelementptr inbounds float, float addrspace(1)* %92, i64 %148
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !6
  %153 = fadd contract float %150, %152
  %154 = getelementptr inbounds float, float addrspace(1)* %93, i64 %148
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !6
  %156 = fadd contract float %153, %155
  %157 = getelementptr inbounds float, float addrspace(1)* %94, i64 %148
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !6
  %159 = fadd contract float %156, %158
  %160 = getelementptr inbounds float, float addrspace(1)* %2, i64 %148
  store float %159, float addrspace(1)* %160, align 4, !tbaa !7
  %161 = getelementptr inbounds float, float addrspace(1)* %95, i64 %148
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7
  %163 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %164 = fadd contract float %162, %163
  %165 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %166 = fadd contract float %164, %165
  %167 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %168 = fadd contract float %166, %167
  %169 = getelementptr inbounds float, float addrspace(1)* %3, i64 %148
  store float %168, float addrspace(1)* %169, align 4, !tbaa !7
  %170 = getelementptr inbounds float, float addrspace(1)* %96, i64 %148
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %172 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %173 = fadd contract float %171, %172
  %174 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %175 = fadd contract float %173, %174
  br label %176

176:                                              ; preds = %104, %147, %122
  %177 = phi float addrspace(1)* [ %129, %122 ], [ %157, %147 ], [ %108, %104 ]
  %178 = phi float [ %143, %122 ], [ %175, %147 ], [ %118, %104 ]
  %179 = phi i64 [ %123, %122 ], [ %148, %147 ], [ %105, %104 ]
  %180 = load float, float addrspace(1)* %177, align 4, !tbaa !7
  %181 = fadd contract float %178, %180
  %182 = getelementptr inbounds float, float addrspace(1)* %4, i64 %179
  store float %181, float addrspace(1)* %182, align 4, !tbaa !7
  br label %183

183:                                              ; preds = %176, %144
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %184 = shl nsw i32 %7, 1
  %185 = icmp eq i32 %184, %5
  br i1 %185, label %186, label %209

186:                                              ; preds = %183
  %187 = shl i32 %22, 1
  %188 = zext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %2, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !7
  %191 = add nuw nsw i32 %187, 1
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %2, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = fadd contract float %190, %194
  %196 = fmul contract float %10, 5.000000e-01
  %197 = fmul contract float %196, %195
  %198 = zext i32 %22 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %101, i64 %198
  store float %197, float addrspace(1)* %199, align 4, !tbaa !7
  %200 = getelementptr inbounds float, float addrspace(1)* %3, i64 %188
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !7
  %202 = getelementptr inbounds float, float addrspace(1)* %3, i64 %192
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %204 = fadd contract float %201, %203
  %205 = fmul contract float %196, %204
  %206 = getelementptr inbounds float, float addrspace(1)* %102, i64 %198
  store float %205, float addrspace(1)* %206, align 4, !tbaa !7
  %207 = getelementptr inbounds float, float addrspace(1)* %4, i64 %188
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !7
  br label %295

209:                                              ; preds = %183
  %210 = mul nsw i32 %7, 3
  %211 = icmp eq i32 %210, %5
  br i1 %211, label %212, label %246

212:                                              ; preds = %209
  %213 = mul i32 %22, 3
  %214 = zext i32 %213 to i64
  %215 = getelementptr inbounds float, float addrspace(1)* %2, i64 %214
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !7
  %217 = add i32 %213, 1
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %2, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7
  %221 = fadd contract float %216, %220
  %222 = add i32 %213, 2
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %2, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7
  %226 = fadd contract float %221, %225
  %227 = fdiv contract float %10, 3.000000e+00
  %228 = fmul contract float %227, %226
  %229 = zext i32 %22 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %101, i64 %229
  store float %228, float addrspace(1)* %230, align 4, !tbaa !7
  %231 = getelementptr inbounds float, float addrspace(1)* %3, i64 %214
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7
  %233 = getelementptr inbounds float, float addrspace(1)* %3, i64 %218
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !7
  %235 = fadd contract float %232, %234
  %236 = getelementptr inbounds float, float addrspace(1)* %3, i64 %223
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !7
  %238 = fadd contract float %235, %237
  %239 = fmul contract float %227, %238
  %240 = getelementptr inbounds float, float addrspace(1)* %102, i64 %229
  store float %239, float addrspace(1)* %240, align 4, !tbaa !7
  %241 = getelementptr inbounds float, float addrspace(1)* %4, i64 %214
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !7
  %243 = getelementptr inbounds float, float addrspace(1)* %4, i64 %218
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7
  %245 = fadd contract float %242, %244
  br label %295

246:                                              ; preds = %209
  %247 = shl nsw i32 %7, 2
  %248 = icmp eq i32 %247, %5
  br i1 %248, label %249, label %305

249:                                              ; preds = %246
  %250 = shl i32 %22, 2
  %251 = zext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %2, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !7
  %254 = add nuw nsw i32 %250, 1
  %255 = zext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %2, i64 %255
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !7
  %258 = fadd contract float %253, %257
  %259 = add nuw nsw i32 %250, 2
  %260 = zext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %2, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !7
  %263 = fadd contract float %258, %262
  %264 = add nuw nsw i32 %250, 3
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds float, float addrspace(1)* %2, i64 %265
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !7
  %268 = fadd contract float %263, %267
  %269 = fmul contract float %10, 2.500000e-01
  %270 = fmul contract float %269, %268
  %271 = zext i32 %22 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %101, i64 %271
  store float %270, float addrspace(1)* %272, align 4, !tbaa !7
  %273 = getelementptr inbounds float, float addrspace(1)* %3, i64 %251
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %275 = getelementptr inbounds float, float addrspace(1)* %3, i64 %255
  %276 = load float, float addrspace(1)* %275, align 4, !tbaa !7
  %277 = fadd contract float %274, %276
  %278 = getelementptr inbounds float, float addrspace(1)* %3, i64 %260
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %280 = fadd contract float %277, %279
  %281 = getelementptr inbounds float, float addrspace(1)* %3, i64 %265
  %282 = load float, float addrspace(1)* %281, align 4, !tbaa !7
  %283 = fadd contract float %280, %282
  %284 = fmul contract float %269, %283
  %285 = getelementptr inbounds float, float addrspace(1)* %102, i64 %271
  store float %284, float addrspace(1)* %285, align 4, !tbaa !7
  %286 = getelementptr inbounds float, float addrspace(1)* %4, i64 %251
  %287 = bitcast float addrspace(1)* %286 to <2 x float> addrspace(1)*
  %288 = load <2 x float>, <2 x float> addrspace(1)* %287, align 4, !tbaa !7
  %289 = extractelement <2 x float> %288, i64 0
  %290 = extractelement <2 x float> %288, i64 1
  %291 = fadd contract float %289, %290
  %292 = getelementptr inbounds float, float addrspace(1)* %4, i64 %260
  %293 = load float, float addrspace(1)* %292, align 4, !tbaa !7
  %294 = fadd contract float %291, %293
  br label %295

295:                                              ; preds = %186, %249, %212
  %296 = phi i64 [ %223, %212 ], [ %265, %249 ], [ %192, %186 ]
  %297 = phi float [ %245, %212 ], [ %294, %249 ], [ %208, %186 ]
  %298 = phi float [ %227, %212 ], [ %269, %249 ], [ %196, %186 ]
  %299 = phi i64 [ %229, %212 ], [ %271, %249 ], [ %198, %186 ]
  %300 = getelementptr inbounds float, float addrspace(1)* %4, i64 %296
  %301 = load float, float addrspace(1)* %300, align 4, !tbaa !7
  %302 = fadd contract float %297, %301
  %303 = fmul contract float %298, %302
  %304 = getelementptr inbounds float, float addrspace(1)* %103, i64 %299
  store float %303, float addrspace(1)* %304, align 4, !tbaa !7
  br label %305

305:                                              ; preds = %295, %246
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %306

306:                                              ; preds = %13, %305, %52
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

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
