; ModuleID = '../data/hip_kernels/399/0/main.cu'
source_filename = "../data/hip_kernels/399/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4nmfwPfiiiS_S_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %3
  %26 = icmp slt i32 %16, %1
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %317

28:                                               ; preds = %7
  %29 = icmp sgt i32 %2, 0
  br i1 %29, label %30, label %59

30:                                               ; preds = %28
  %31 = mul nsw i32 %16, %2
  %32 = mul nsw i32 %24, %2
  %33 = and i32 %2, 7
  %34 = icmp ult i32 %2, 8
  br i1 %34, label %37, label %35

35:                                               ; preds = %30
  %36 = and i32 %2, -8
  br label %74

37:                                               ; preds = %74, %30
  %38 = phi float [ undef, %30 ], [ %164, %74 ]
  %39 = phi i32 [ 0, %30 ], [ %165, %74 ]
  %40 = phi float [ 0.000000e+00, %30 ], [ %164, %74 ]
  %41 = icmp eq i32 %33, 0
  br i1 %41, label %59, label %42

42:                                               ; preds = %37, %42
  %43 = phi i32 [ %56, %42 ], [ %39, %37 ]
  %44 = phi float [ %55, %42 ], [ %40, %37 ]
  %45 = phi i32 [ %57, %42 ], [ 0, %37 ]
  %46 = add nsw i32 %43, %31
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = add nsw i32 %43, %32
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %5, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fmul contract float %49, %53
  %55 = fadd contract float %44, %54
  %56 = add nuw nsw i32 %43, 1
  %57 = add i32 %45, 1
  %58 = icmp eq i32 %57, %33
  br i1 %58, label %59, label %42, !llvm.loop !11

59:                                               ; preds = %37, %42, %28
  %60 = phi float [ 0.000000e+00, %28 ], [ %38, %37 ], [ %55, %42 ]
  %61 = mul nsw i32 %16, %3
  %62 = add nsw i32 %61, %24
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fmul contract float %60, %65
  br i1 %29, label %67, label %176

67:                                               ; preds = %59
  %68 = icmp sgt i32 %3, 0
  %69 = mul nsw i32 %24, %2
  %70 = and i32 %3, 7
  %71 = icmp ult i32 %3, 8
  %72 = and i32 %3, -8
  %73 = icmp eq i32 %70, 0
  br label %168

74:                                               ; preds = %74, %35
  %75 = phi i32 [ 0, %35 ], [ %165, %74 ]
  %76 = phi float [ 0.000000e+00, %35 ], [ %164, %74 ]
  %77 = phi i32 [ 0, %35 ], [ %166, %74 ]
  %78 = add nsw i32 %75, %31
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = add nsw i32 %75, %32
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %5, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = fmul contract float %81, %85
  %87 = fadd contract float %76, %86
  %88 = or i32 %75, 1
  %89 = add nsw i32 %88, %31
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = add nsw i32 %88, %32
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %5, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fmul contract float %92, %96
  %98 = fadd contract float %87, %97
  %99 = or i32 %75, 2
  %100 = add nsw i32 %99, %31
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = add nsw i32 %99, %32
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %5, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = fmul contract float %103, %107
  %109 = fadd contract float %98, %108
  %110 = or i32 %75, 3
  %111 = add nsw i32 %110, %31
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = add nsw i32 %110, %32
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %5, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = fmul contract float %114, %118
  %120 = fadd contract float %109, %119
  %121 = or i32 %75, 4
  %122 = add nsw i32 %121, %31
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = add nsw i32 %121, %32
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %5, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = fmul contract float %125, %129
  %131 = fadd contract float %120, %130
  %132 = or i32 %75, 5
  %133 = add nsw i32 %132, %31
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = add nsw i32 %132, %32
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %5, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = fmul contract float %136, %140
  %142 = fadd contract float %131, %141
  %143 = or i32 %75, 6
  %144 = add nsw i32 %143, %31
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !5
  %148 = add nsw i32 %143, %32
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %5, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = fmul contract float %147, %151
  %153 = fadd contract float %142, %152
  %154 = or i32 %75, 7
  %155 = add nsw i32 %154, %31
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = add nsw i32 %154, %32
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %5, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7, !amdgpu.noclobber !5
  %163 = fmul contract float %158, %162
  %164 = fadd contract float %153, %163
  %165 = add nuw nsw i32 %75, 8
  %166 = add i32 %77, 8
  %167 = icmp eq i32 %166, %36
  br i1 %167, label %37, label %74, !llvm.loop !13

168:                                              ; preds = %67, %203
  %169 = phi i32 [ 0, %67 ], [ %205, %203 ]
  %170 = phi float [ 0.000000e+00, %67 ], [ %204, %203 ]
  br i1 %68, label %171, label %203

171:                                              ; preds = %168
  %172 = add nsw i32 %169, %69
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %5, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7, !amdgpu.noclobber !5
  br i1 %71, label %180, label %207

176:                                              ; preds = %203, %59
  %177 = phi float [ 0.000000e+00, %59 ], [ %204, %203 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %178 = fdiv contract float %66, %177
  %179 = getelementptr inbounds float, float addrspace(1)* %6, i64 %63
  store float %178, float addrspace(1)* %179, align 4, !tbaa !7
  br label %317

180:                                              ; preds = %207, %171
  %181 = phi float [ undef, %171 ], [ %313, %207 ]
  %182 = phi i32 [ 0, %171 ], [ %314, %207 ]
  %183 = phi float [ %170, %171 ], [ %313, %207 ]
  br i1 %73, label %203, label %184

184:                                              ; preds = %180, %184
  %185 = phi i32 [ %200, %184 ], [ %182, %180 ]
  %186 = phi float [ %199, %184 ], [ %183, %180 ]
  %187 = phi i32 [ %201, %184 ], [ 0, %180 ]
  %188 = add nsw i32 %185, %61
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %4, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7, !amdgpu.noclobber !5
  %192 = mul nsw i32 %185, %2
  %193 = add nsw i32 %192, %169
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %5, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7, !amdgpu.noclobber !5
  %197 = fmul contract float %191, %196
  %198 = fmul contract float %197, %175
  %199 = fadd contract float %186, %198
  %200 = add nuw nsw i32 %185, 1
  %201 = add i32 %187, 1
  %202 = icmp eq i32 %201, %70
  br i1 %202, label %203, label %184, !llvm.loop !15

203:                                              ; preds = %180, %184, %168
  %204 = phi float [ %170, %168 ], [ %181, %180 ], [ %199, %184 ]
  %205 = add nuw nsw i32 %169, 1
  %206 = icmp eq i32 %205, %2
  br i1 %206, label %176, label %168, !llvm.loop !16

207:                                              ; preds = %171, %207
  %208 = phi i32 [ %314, %207 ], [ 0, %171 ]
  %209 = phi float [ %313, %207 ], [ %170, %171 ]
  %210 = phi i32 [ %315, %207 ], [ 0, %171 ]
  %211 = add nsw i32 %208, %61
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %4, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7, !amdgpu.noclobber !5
  %215 = mul nsw i32 %208, %2
  %216 = add nsw i32 %215, %169
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %5, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !7, !amdgpu.noclobber !5
  %220 = fmul contract float %214, %219
  %221 = fmul contract float %220, %175
  %222 = fadd contract float %209, %221
  %223 = or i32 %208, 1
  %224 = add nsw i32 %223, %61
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %4, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !7, !amdgpu.noclobber !5
  %228 = mul nsw i32 %223, %2
  %229 = add nsw i32 %228, %169
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %5, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7, !amdgpu.noclobber !5
  %233 = fmul contract float %227, %232
  %234 = fmul contract float %233, %175
  %235 = fadd contract float %222, %234
  %236 = or i32 %208, 2
  %237 = add nsw i32 %236, %61
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %4, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !7, !amdgpu.noclobber !5
  %241 = mul nsw i32 %236, %2
  %242 = add nsw i32 %241, %169
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds float, float addrspace(1)* %5, i64 %243
  %245 = load float, float addrspace(1)* %244, align 4, !tbaa !7, !amdgpu.noclobber !5
  %246 = fmul contract float %240, %245
  %247 = fmul contract float %246, %175
  %248 = fadd contract float %235, %247
  %249 = or i32 %208, 3
  %250 = add nsw i32 %249, %61
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %4, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !7, !amdgpu.noclobber !5
  %254 = mul nsw i32 %249, %2
  %255 = add nsw i32 %254, %169
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %5, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !7, !amdgpu.noclobber !5
  %259 = fmul contract float %253, %258
  %260 = fmul contract float %259, %175
  %261 = fadd contract float %248, %260
  %262 = or i32 %208, 4
  %263 = add nsw i32 %262, %61
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %4, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !7, !amdgpu.noclobber !5
  %267 = mul nsw i32 %262, %2
  %268 = add nsw i32 %267, %169
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %5, i64 %269
  %271 = load float, float addrspace(1)* %270, align 4, !tbaa !7, !amdgpu.noclobber !5
  %272 = fmul contract float %266, %271
  %273 = fmul contract float %272, %175
  %274 = fadd contract float %261, %273
  %275 = or i32 %208, 5
  %276 = add nsw i32 %275, %61
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %4, i64 %277
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !7, !amdgpu.noclobber !5
  %280 = mul nsw i32 %275, %2
  %281 = add nsw i32 %280, %169
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %5, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !7, !amdgpu.noclobber !5
  %285 = fmul contract float %279, %284
  %286 = fmul contract float %285, %175
  %287 = fadd contract float %274, %286
  %288 = or i32 %208, 6
  %289 = add nsw i32 %288, %61
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds float, float addrspace(1)* %4, i64 %290
  %292 = load float, float addrspace(1)* %291, align 4, !tbaa !7, !amdgpu.noclobber !5
  %293 = mul nsw i32 %288, %2
  %294 = add nsw i32 %293, %169
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds float, float addrspace(1)* %5, i64 %295
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !7, !amdgpu.noclobber !5
  %298 = fmul contract float %292, %297
  %299 = fmul contract float %298, %175
  %300 = fadd contract float %287, %299
  %301 = or i32 %208, 7
  %302 = add nsw i32 %301, %61
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %4, i64 %303
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !7, !amdgpu.noclobber !5
  %306 = mul nsw i32 %301, %2
  %307 = add nsw i32 %306, %169
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %5, i64 %308
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !7, !amdgpu.noclobber !5
  %311 = fmul contract float %305, %310
  %312 = fmul contract float %311, %175
  %313 = fadd contract float %300, %312
  %314 = add nuw nsw i32 %208, 8
  %315 = add i32 %210, 8
  %316 = icmp eq i32 %315, %72
  br i1 %316, label %180, label %207, !llvm.loop !17

317:                                              ; preds = %176, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
