; ModuleID = '../data/hip_kernels/4156/16/main.cu'
source_filename = "../data/hip_kernels/4156/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z21selection_sum_weightsPfS_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = add i32 %8, %9
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !5
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !14, !invariant.load !15
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = icmp sgt i32 %2, 0
  %25 = mul i32 %10, %23
  %26 = add i32 %25, %5
  %27 = shl i32 %26, 5
  %28 = add i32 %27, %6
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  store float 0.000000e+00, float addrspace(1)* %30, align 4, !tbaa !16
  br i1 %24, label %31, label %112

31:                                               ; preds = %4
  %32 = and i32 %2, 7
  %33 = icmp ult i32 %2, 8
  br i1 %33, label %97, label %34

34:                                               ; preds = %31
  %35 = and i32 %2, -8
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i32 [ 0, %34 ], [ %94, %36 ]
  %38 = phi i32 [ 0, %34 ], [ %95, %36 ]
  %39 = mul nsw i32 %37, %3
  %40 = add nsw i32 %39, %28
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16
  %44 = atomicrmw fadd float addrspace(1)* %30, float %43 syncscope("agent-one-as") monotonic, align 4
  %45 = or i32 %37, 1
  %46 = mul nsw i32 %45, %3
  %47 = add nsw i32 %46, %28
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = atomicrmw fadd float addrspace(1)* %30, float %50 syncscope("agent-one-as") monotonic, align 4
  %52 = or i32 %37, 2
  %53 = mul nsw i32 %52, %3
  %54 = add nsw i32 %53, %28
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = atomicrmw fadd float addrspace(1)* %30, float %57 syncscope("agent-one-as") monotonic, align 4
  %59 = or i32 %37, 3
  %60 = mul nsw i32 %59, %3
  %61 = add nsw i32 %60, %28
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = atomicrmw fadd float addrspace(1)* %30, float %64 syncscope("agent-one-as") monotonic, align 4
  %66 = or i32 %37, 4
  %67 = mul nsw i32 %66, %3
  %68 = add nsw i32 %67, %28
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16
  %72 = atomicrmw fadd float addrspace(1)* %30, float %71 syncscope("agent-one-as") monotonic, align 4
  %73 = or i32 %37, 5
  %74 = mul nsw i32 %73, %3
  %75 = add nsw i32 %74, %28
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = atomicrmw fadd float addrspace(1)* %30, float %78 syncscope("agent-one-as") monotonic, align 4
  %80 = or i32 %37, 6
  %81 = mul nsw i32 %80, %3
  %82 = add nsw i32 %81, %28
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = atomicrmw fadd float addrspace(1)* %30, float %85 syncscope("agent-one-as") monotonic, align 4
  %87 = or i32 %37, 7
  %88 = mul nsw i32 %87, %3
  %89 = add nsw i32 %88, %28
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16
  %93 = atomicrmw fadd float addrspace(1)* %30, float %92 syncscope("agent-one-as") monotonic, align 4
  %94 = add nuw nsw i32 %37, 8
  %95 = add i32 %38, 8
  %96 = icmp eq i32 %95, %35
  br i1 %96, label %97, label %36, !llvm.loop !20

97:                                               ; preds = %36, %31
  %98 = phi i32 [ 0, %31 ], [ %94, %36 ]
  %99 = icmp eq i32 %32, 0
  br i1 %99, label %112, label %100

100:                                              ; preds = %97, %100
  %101 = phi i32 [ %109, %100 ], [ %98, %97 ]
  %102 = phi i32 [ %110, %100 ], [ 0, %97 ]
  %103 = mul nsw i32 %101, %3
  %104 = add nsw i32 %103, %28
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = atomicrmw fadd float addrspace(1)* %30, float %107 syncscope("agent-one-as") monotonic, align 4
  %109 = add nuw nsw i32 %101, 1
  %110 = add i32 %102, 1
  %111 = icmp eq i32 %110, %32
  br i1 %111, label %112, label %100, !llvm.loop !22

112:                                              ; preds = %97, %100, %4
  %113 = add nsw i32 %10, 8
  %114 = mul i32 %113, %23
  %115 = add i32 %114, %5
  %116 = shl i32 %115, 5
  %117 = add i32 %116, %6
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  store float 0.000000e+00, float addrspace(1)* %119, align 4, !tbaa !16
  br i1 %24, label %120, label %201

120:                                              ; preds = %112
  %121 = and i32 %2, 7
  %122 = icmp ult i32 %2, 8
  br i1 %122, label %186, label %123

123:                                              ; preds = %120
  %124 = and i32 %2, -8
  br label %125

125:                                              ; preds = %125, %123
  %126 = phi i32 [ 0, %123 ], [ %183, %125 ]
  %127 = phi i32 [ 0, %123 ], [ %184, %125 ]
  %128 = mul nsw i32 %126, %3
  %129 = add nsw i32 %128, %117
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16
  %133 = atomicrmw fadd float addrspace(1)* %119, float %132 syncscope("agent-one-as") monotonic, align 4
  %134 = or i32 %126, 1
  %135 = mul nsw i32 %134, %3
  %136 = add nsw i32 %135, %117
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = atomicrmw fadd float addrspace(1)* %119, float %139 syncscope("agent-one-as") monotonic, align 4
  %141 = or i32 %126, 2
  %142 = mul nsw i32 %141, %3
  %143 = add nsw i32 %142, %117
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16
  %147 = atomicrmw fadd float addrspace(1)* %119, float %146 syncscope("agent-one-as") monotonic, align 4
  %148 = or i32 %126, 3
  %149 = mul nsw i32 %148, %3
  %150 = add nsw i32 %149, %117
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !16
  %154 = atomicrmw fadd float addrspace(1)* %119, float %153 syncscope("agent-one-as") monotonic, align 4
  %155 = or i32 %126, 4
  %156 = mul nsw i32 %155, %3
  %157 = add nsw i32 %156, %117
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !16
  %161 = atomicrmw fadd float addrspace(1)* %119, float %160 syncscope("agent-one-as") monotonic, align 4
  %162 = or i32 %126, 5
  %163 = mul nsw i32 %162, %3
  %164 = add nsw i32 %163, %117
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %1, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !16
  %168 = atomicrmw fadd float addrspace(1)* %119, float %167 syncscope("agent-one-as") monotonic, align 4
  %169 = or i32 %126, 6
  %170 = mul nsw i32 %169, %3
  %171 = add nsw i32 %170, %117
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16
  %175 = atomicrmw fadd float addrspace(1)* %119, float %174 syncscope("agent-one-as") monotonic, align 4
  %176 = or i32 %126, 7
  %177 = mul nsw i32 %176, %3
  %178 = add nsw i32 %177, %117
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !16
  %182 = atomicrmw fadd float addrspace(1)* %119, float %181 syncscope("agent-one-as") monotonic, align 4
  %183 = add nuw nsw i32 %126, 8
  %184 = add i32 %127, 8
  %185 = icmp eq i32 %184, %124
  br i1 %185, label %186, label %125, !llvm.loop !20

186:                                              ; preds = %125, %120
  %187 = phi i32 [ 0, %120 ], [ %183, %125 ]
  %188 = icmp eq i32 %121, 0
  br i1 %188, label %201, label %189

189:                                              ; preds = %186, %189
  %190 = phi i32 [ %198, %189 ], [ %187, %186 ]
  %191 = phi i32 [ %199, %189 ], [ 0, %186 ]
  %192 = mul nsw i32 %190, %3
  %193 = add nsw i32 %192, %117
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %1, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !16
  %197 = atomicrmw fadd float addrspace(1)* %119, float %196 syncscope("agent-one-as") monotonic, align 4
  %198 = add nuw nsw i32 %190, 1
  %199 = add i32 %191, 1
  %200 = icmp eq i32 %199, %121
  br i1 %200, label %201, label %189, !llvm.loop !24

201:                                              ; preds = %186, %189, %112
  %202 = add nsw i32 %10, 16
  %203 = mul i32 %202, %23
  %204 = add i32 %203, %5
  %205 = shl i32 %204, 5
  %206 = add i32 %205, %6
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %0, i64 %207
  store float 0.000000e+00, float addrspace(1)* %208, align 4, !tbaa !16
  br i1 %24, label %209, label %290

209:                                              ; preds = %201
  %210 = and i32 %2, 7
  %211 = icmp ult i32 %2, 8
  br i1 %211, label %275, label %212

212:                                              ; preds = %209
  %213 = and i32 %2, -8
  br label %214

214:                                              ; preds = %214, %212
  %215 = phi i32 [ 0, %212 ], [ %272, %214 ]
  %216 = phi i32 [ 0, %212 ], [ %273, %214 ]
  %217 = mul nsw i32 %215, %3
  %218 = add nsw i32 %217, %206
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !16
  %222 = atomicrmw fadd float addrspace(1)* %208, float %221 syncscope("agent-one-as") monotonic, align 4
  %223 = or i32 %215, 1
  %224 = mul nsw i32 %223, %3
  %225 = add nsw i32 %224, %206
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds float, float addrspace(1)* %1, i64 %226
  %228 = load float, float addrspace(1)* %227, align 4, !tbaa !16
  %229 = atomicrmw fadd float addrspace(1)* %208, float %228 syncscope("agent-one-as") monotonic, align 4
  %230 = or i32 %215, 2
  %231 = mul nsw i32 %230, %3
  %232 = add nsw i32 %231, %206
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %1, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !16
  %236 = atomicrmw fadd float addrspace(1)* %208, float %235 syncscope("agent-one-as") monotonic, align 4
  %237 = or i32 %215, 3
  %238 = mul nsw i32 %237, %3
  %239 = add nsw i32 %238, %206
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %1, i64 %240
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !16
  %243 = atomicrmw fadd float addrspace(1)* %208, float %242 syncscope("agent-one-as") monotonic, align 4
  %244 = or i32 %215, 4
  %245 = mul nsw i32 %244, %3
  %246 = add nsw i32 %245, %206
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds float, float addrspace(1)* %1, i64 %247
  %249 = load float, float addrspace(1)* %248, align 4, !tbaa !16
  %250 = atomicrmw fadd float addrspace(1)* %208, float %249 syncscope("agent-one-as") monotonic, align 4
  %251 = or i32 %215, 5
  %252 = mul nsw i32 %251, %3
  %253 = add nsw i32 %252, %206
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %1, i64 %254
  %256 = load float, float addrspace(1)* %255, align 4, !tbaa !16
  %257 = atomicrmw fadd float addrspace(1)* %208, float %256 syncscope("agent-one-as") monotonic, align 4
  %258 = or i32 %215, 6
  %259 = mul nsw i32 %258, %3
  %260 = add nsw i32 %259, %206
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %1, i64 %261
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !16
  %264 = atomicrmw fadd float addrspace(1)* %208, float %263 syncscope("agent-one-as") monotonic, align 4
  %265 = or i32 %215, 7
  %266 = mul nsw i32 %265, %3
  %267 = add nsw i32 %266, %206
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds float, float addrspace(1)* %1, i64 %268
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !16
  %271 = atomicrmw fadd float addrspace(1)* %208, float %270 syncscope("agent-one-as") monotonic, align 4
  %272 = add nuw nsw i32 %215, 8
  %273 = add i32 %216, 8
  %274 = icmp eq i32 %273, %213
  br i1 %274, label %275, label %214, !llvm.loop !20

275:                                              ; preds = %214, %209
  %276 = phi i32 [ 0, %209 ], [ %272, %214 ]
  %277 = icmp eq i32 %210, 0
  br i1 %277, label %290, label %278

278:                                              ; preds = %275, %278
  %279 = phi i32 [ %287, %278 ], [ %276, %275 ]
  %280 = phi i32 [ %288, %278 ], [ 0, %275 ]
  %281 = mul nsw i32 %279, %3
  %282 = add nsw i32 %281, %206
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %1, i64 %283
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !16
  %286 = atomicrmw fadd float addrspace(1)* %208, float %285 syncscope("agent-one-as") monotonic, align 4
  %287 = add nuw nsw i32 %279, 1
  %288 = add i32 %280, 1
  %289 = icmp eq i32 %288, %210
  br i1 %289, label %290, label %278, !llvm.loop !25

290:                                              ; preds = %275, %278, %201
  %291 = add nsw i32 %10, 24
  %292 = mul i32 %291, %23
  %293 = add i32 %292, %5
  %294 = shl i32 %293, 5
  %295 = add i32 %294, %6
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds float, float addrspace(1)* %0, i64 %296
  store float 0.000000e+00, float addrspace(1)* %297, align 4, !tbaa !16
  br i1 %24, label %298, label %379

298:                                              ; preds = %290
  %299 = and i32 %2, 7
  %300 = icmp ult i32 %2, 8
  br i1 %300, label %364, label %301

301:                                              ; preds = %298
  %302 = and i32 %2, -8
  br label %303

303:                                              ; preds = %303, %301
  %304 = phi i32 [ 0, %301 ], [ %361, %303 ]
  %305 = phi i32 [ 0, %301 ], [ %362, %303 ]
  %306 = mul nsw i32 %304, %3
  %307 = add nsw i32 %306, %295
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %1, i64 %308
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !16
  %311 = atomicrmw fadd float addrspace(1)* %297, float %310 syncscope("agent-one-as") monotonic, align 4
  %312 = or i32 %304, 1
  %313 = mul nsw i32 %312, %3
  %314 = add nsw i32 %313, %295
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds float, float addrspace(1)* %1, i64 %315
  %317 = load float, float addrspace(1)* %316, align 4, !tbaa !16
  %318 = atomicrmw fadd float addrspace(1)* %297, float %317 syncscope("agent-one-as") monotonic, align 4
  %319 = or i32 %304, 2
  %320 = mul nsw i32 %319, %3
  %321 = add nsw i32 %320, %295
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds float, float addrspace(1)* %1, i64 %322
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !16
  %325 = atomicrmw fadd float addrspace(1)* %297, float %324 syncscope("agent-one-as") monotonic, align 4
  %326 = or i32 %304, 3
  %327 = mul nsw i32 %326, %3
  %328 = add nsw i32 %327, %295
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds float, float addrspace(1)* %1, i64 %329
  %331 = load float, float addrspace(1)* %330, align 4, !tbaa !16
  %332 = atomicrmw fadd float addrspace(1)* %297, float %331 syncscope("agent-one-as") monotonic, align 4
  %333 = or i32 %304, 4
  %334 = mul nsw i32 %333, %3
  %335 = add nsw i32 %334, %295
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %1, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !16
  %339 = atomicrmw fadd float addrspace(1)* %297, float %338 syncscope("agent-one-as") monotonic, align 4
  %340 = or i32 %304, 5
  %341 = mul nsw i32 %340, %3
  %342 = add nsw i32 %341, %295
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds float, float addrspace(1)* %1, i64 %343
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !16
  %346 = atomicrmw fadd float addrspace(1)* %297, float %345 syncscope("agent-one-as") monotonic, align 4
  %347 = or i32 %304, 6
  %348 = mul nsw i32 %347, %3
  %349 = add nsw i32 %348, %295
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %1, i64 %350
  %352 = load float, float addrspace(1)* %351, align 4, !tbaa !16
  %353 = atomicrmw fadd float addrspace(1)* %297, float %352 syncscope("agent-one-as") monotonic, align 4
  %354 = or i32 %304, 7
  %355 = mul nsw i32 %354, %3
  %356 = add nsw i32 %355, %295
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds float, float addrspace(1)* %1, i64 %357
  %359 = load float, float addrspace(1)* %358, align 4, !tbaa !16
  %360 = atomicrmw fadd float addrspace(1)* %297, float %359 syncscope("agent-one-as") monotonic, align 4
  %361 = add nuw nsw i32 %304, 8
  %362 = add i32 %305, 8
  %363 = icmp eq i32 %362, %302
  br i1 %363, label %364, label %303, !llvm.loop !20

364:                                              ; preds = %303, %298
  %365 = phi i32 [ 0, %298 ], [ %361, %303 ]
  %366 = icmp eq i32 %299, 0
  br i1 %366, label %379, label %367

367:                                              ; preds = %364, %367
  %368 = phi i32 [ %376, %367 ], [ %365, %364 ]
  %369 = phi i32 [ %377, %367 ], [ 0, %364 ]
  %370 = mul nsw i32 %368, %3
  %371 = add nsw i32 %370, %295
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds float, float addrspace(1)* %1, i64 %372
  %374 = load float, float addrspace(1)* %373, align 4, !tbaa !16
  %375 = atomicrmw fadd float addrspace(1)* %297, float %374 syncscope("agent-one-as") monotonic, align 4
  %376 = add nuw nsw i32 %368, 1
  %377 = add i32 %369, 1
  %378 = icmp eq i32 %377, %299
  br i1 %378, label %379, label %367, !llvm.loop !26

379:                                              ; preds = %364, %367, %290
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !23}
