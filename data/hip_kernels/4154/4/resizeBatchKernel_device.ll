; ModuleID = '../data/hip_kernels/4154/4/main.cu'
source_filename = "../data/hip_kernels/4154/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL17resizeBatchKernelPKtiiPhiiPi = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL17resizeBatchKernelPKtiiPhiiPi(i16 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i8 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 comdat {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = sdiv i32 %2, %5
  switch i32 %25, label %461 [
    i32 4, label %26
    i32 6, label %205
    i32 2, label %275
  ]

26:                                               ; preds = %7
  %27 = sdiv i32 %4, 6
  %28 = icmp slt i32 %16, %27
  %29 = icmp slt i32 %24, %5
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %461

31:                                               ; preds = %26
  %32 = mul nsw i32 %24, %1
  %33 = shl nsw i32 %32, 2
  %34 = shl nsw i32 %16, 5
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %36
  %38 = load i16, i16 addrspace(1)* %37, align 2, !tbaa !7, !amdgpu.noclobber !5
  %39 = zext i16 %38 to i32
  %40 = or i32 %35, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %41
  %43 = load i16, i16 addrspace(1)* %42, align 2, !tbaa !7, !amdgpu.noclobber !5
  %44 = zext i16 %43 to i32
  %45 = shl nuw i32 %44, 16
  %46 = or i32 %45, %39
  %47 = add nsw i32 %35, 6
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %48
  %50 = load i16, i16 addrspace(1)* %49, align 2, !tbaa !7, !amdgpu.noclobber !5
  %51 = lshr i32 %44, 4
  %52 = and i32 %51, 1023
  %53 = lshr i32 %46, 10
  %54 = and i32 %53, 1023
  %55 = and i32 %39, 1023
  %56 = and i16 %50, 1023
  %57 = add nsw i32 %35, 10
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %58
  %60 = load i16, i16 addrspace(1)* %59, align 2, !tbaa !7, !amdgpu.noclobber !5
  %61 = zext i16 %60 to i32
  %62 = add nsw i32 %35, 11
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %63
  %65 = load i16, i16 addrspace(1)* %64, align 2, !tbaa !7, !amdgpu.noclobber !5
  %66 = zext i16 %65 to i32
  %67 = shl nuw i32 %66, 16
  %68 = or i32 %67, %61
  %69 = add nsw i32 %35, 12
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %70
  %72 = load i16, i16 addrspace(1)* %71, align 2, !tbaa !7, !amdgpu.noclobber !5
  %73 = lshr i32 %66, 4
  %74 = and i32 %73, 1023
  %75 = lshr i32 %68, 10
  %76 = and i32 %75, 1023
  %77 = and i16 %72, 1023
  %78 = add nsw i32 %35, 16
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %79
  %81 = load i16, i16 addrspace(1)* %80, align 2, !tbaa !7, !amdgpu.noclobber !5
  %82 = zext i16 %81 to i64
  %83 = add nsw i32 %35, 17
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %84
  %86 = load i16, i16 addrspace(1)* %85, align 2, !tbaa !7, !amdgpu.noclobber !5
  %87 = zext i16 %86 to i64
  %88 = shl nuw nsw i64 %87, 16
  %89 = or i64 %88, %82
  %90 = add nsw i32 %35, 21
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %91
  %93 = load i16, i16 addrspace(1)* %92, align 2, !tbaa !7, !amdgpu.noclobber !5
  %94 = add nsw i32 %35, 22
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %95
  %97 = load i16, i16 addrspace(1)* %96, align 2, !tbaa !7, !amdgpu.noclobber !5
  %98 = zext i16 %97 to i32
  %99 = add nsw i32 %35, 23
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %100
  %102 = load i16, i16 addrspace(1)* %101, align 2, !tbaa !7, !amdgpu.noclobber !5
  %103 = zext i16 %102 to i32
  %104 = shl nuw i32 %103, 16
  %105 = or i32 %104, %98
  %106 = lshr i64 %89, 10
  %107 = and i64 %106, 1023
  %108 = lshr i16 %93, 4
  %109 = and i16 %108, 1023
  %110 = lshr i32 %105, 10
  %111 = and i32 %110, 1023
  %112 = and i32 %98, 1023
  %113 = add nsw i32 %35, 27
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %114
  %116 = load i16, i16 addrspace(1)* %115, align 2, !tbaa !7, !amdgpu.noclobber !5
  %117 = lshr i16 %116, 4
  %118 = and i16 %117, 1023
  %119 = mul nsw i32 %16, 6
  %120 = mul nsw i32 %24, %4
  %121 = zext i32 %54 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !11, !amdgpu.noclobber !5
  %124 = trunc i32 %123 to i8
  %125 = add nsw i32 %120, %119
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %126
  store i8 %124, i8 addrspace(1)* %127, align 1, !tbaa !13
  %128 = zext i16 %56 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !11
  %131 = trunc i32 %130 to i8
  %132 = add nsw i32 %125, 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %133
  store i8 %131, i8 addrspace(1)* %134, align 1, !tbaa !13
  %135 = zext i32 %74 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %135
  %137 = load i32, i32 addrspace(1)* %136, align 4, !tbaa !11
  %138 = trunc i32 %137 to i8
  %139 = add nsw i32 %125, 2
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %140
  store i8 %138, i8 addrspace(1)* %141, align 1, !tbaa !13
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %107
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !11
  %144 = trunc i32 %143 to i8
  %145 = add nsw i32 %125, 3
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %146
  store i8 %144, i8 addrspace(1)* %147, align 1, !tbaa !13
  %148 = zext i32 %112 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %148
  %150 = load i32, i32 addrspace(1)* %149, align 4, !tbaa !11
  %151 = trunc i32 %150 to i8
  %152 = add nsw i32 %125, 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %153
  store i8 %151, i8 addrspace(1)* %154, align 1, !tbaa !13
  %155 = zext i16 %118 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %155
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !11
  %158 = trunc i32 %157 to i8
  %159 = add nsw i32 %125, 5
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %160
  store i8 %158, i8 addrspace(1)* %161, align 1, !tbaa !13
  %162 = mul nsw i32 %16, 3
  %163 = sdiv i32 %120, 2
  %164 = zext i32 %55 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %164
  %166 = load i32, i32 addrspace(1)* %165, align 4, !tbaa !11
  %167 = trunc i32 %166 to i8
  %168 = add i32 %163, %162
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %169
  store i8 %167, i8 addrspace(1)* %170, align 1, !tbaa !13
  %171 = zext i32 %76 to i64
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %171
  %173 = load i32, i32 addrspace(1)* %172, align 4, !tbaa !11
  %174 = trunc i32 %173 to i8
  %175 = add nsw i32 %168, 1
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %176
  store i8 %174, i8 addrspace(1)* %177, align 1, !tbaa !13
  %178 = zext i16 %109 to i64
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %178
  %180 = load i32, i32 addrspace(1)* %179, align 4, !tbaa !11
  %181 = trunc i32 %180 to i8
  %182 = add nsw i32 %168, 2
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %183
  store i8 %181, i8 addrspace(1)* %184, align 1, !tbaa !13
  %185 = mul i32 %4, 3
  %186 = mul i32 %185, %5
  %187 = sdiv i32 %186, 2
  %188 = zext i32 %52 to i64
  %189 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %188
  %190 = load i32, i32 addrspace(1)* %189, align 4, !tbaa !11
  %191 = trunc i32 %190 to i8
  %192 = add i32 %168, %187
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %193
  store i8 %191, i8 addrspace(1)* %194, align 1, !tbaa !13
  %195 = zext i16 %77 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %195
  %197 = load i32, i32 addrspace(1)* %196, align 4, !tbaa !11
  %198 = trunc i32 %197 to i8
  %199 = add nsw i32 %192, 1
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %200
  store i8 %198, i8 addrspace(1)* %201, align 1, !tbaa !13
  %202 = zext i32 %111 to i64
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %202
  %204 = add nsw i32 %192, 2
  br label %454

205:                                              ; preds = %7
  %206 = sdiv i32 %4, 2
  %207 = icmp slt i32 %16, %206
  %208 = icmp slt i32 %24, %5
  %209 = select i1 %207, i1 %208, i1 false
  br i1 %209, label %210, label %461

210:                                              ; preds = %205
  %211 = mul nsw i32 %24, %1
  %212 = mul nsw i32 %211, 6
  %213 = shl nsw i32 %16, 4
  %214 = add nsw i32 %212, %213
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %215
  %217 = load i16, i16 addrspace(1)* %216, align 2, !tbaa !7, !amdgpu.noclobber !5
  %218 = zext i16 %217 to i32
  %219 = or i32 %214, 1
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %220
  %222 = load i16, i16 addrspace(1)* %221, align 2, !tbaa !7, !amdgpu.noclobber !5
  %223 = zext i16 %222 to i32
  %224 = shl nuw i32 %223, 16
  %225 = or i32 %224, %218
  %226 = lshr i32 %223, 4
  %227 = and i32 %226, 1023
  %228 = lshr i32 %225, 10
  %229 = and i32 %228, 1023
  %230 = and i32 %218, 1023
  %231 = add nsw i32 %214, 8
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %232
  %234 = load i16, i16 addrspace(1)* %233, align 2, !tbaa !7, !amdgpu.noclobber !5
  %235 = zext i16 %234 to i64
  %236 = add nsw i32 %214, 9
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %237
  %239 = load i16, i16 addrspace(1)* %238, align 2, !tbaa !7, !amdgpu.noclobber !5
  %240 = zext i16 %239 to i64
  %241 = shl nuw nsw i64 %240, 16
  %242 = or i64 %241, %235
  %243 = lshr i64 %242, 10
  %244 = and i64 %243, 1023
  %245 = shl nsw i32 %16, 1
  %246 = mul nsw i32 %24, %4
  %247 = zext i32 %229 to i64
  %248 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %247
  %249 = load i32, i32 addrspace(1)* %248, align 4, !tbaa !11, !amdgpu.noclobber !5
  %250 = trunc i32 %249 to i8
  %251 = add nsw i32 %246, %245
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %252
  store i8 %250, i8 addrspace(1)* %253, align 1, !tbaa !13
  %254 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %244
  %255 = load i32, i32 addrspace(1)* %254, align 4, !tbaa !11
  %256 = trunc i32 %255 to i8
  %257 = add nsw i32 %251, 1
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %258
  store i8 %256, i8 addrspace(1)* %259, align 1, !tbaa !13
  %260 = sdiv i32 %246, 2
  %261 = zext i32 %230 to i64
  %262 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %261
  %263 = load i32, i32 addrspace(1)* %262, align 4, !tbaa !11
  %264 = trunc i32 %263 to i8
  %265 = add i32 %260, %16
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %266
  store i8 %264, i8 addrspace(1)* %267, align 1, !tbaa !13
  %268 = mul i32 %4, 3
  %269 = mul i32 %268, %5
  %270 = sdiv i32 %269, 2
  %271 = zext i32 %227 to i64
  %272 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %271
  %273 = add i32 %265, 1
  %274 = add i32 %273, %270
  br label %454

275:                                              ; preds = %7
  %276 = sdiv i32 %4, 6
  %277 = icmp slt i32 %16, %276
  %278 = icmp slt i32 %24, %5
  %279 = select i1 %277, i1 %278, i1 false
  br i1 %279, label %280, label %461

280:                                              ; preds = %275
  %281 = mul nsw i32 %24, %1
  %282 = shl nsw i32 %281, 1
  %283 = shl nsw i32 %16, 4
  %284 = add nsw i32 %282, %283
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %285
  %287 = load i16, i16 addrspace(1)* %286, align 2, !tbaa !7, !amdgpu.noclobber !5
  %288 = zext i16 %287 to i32
  %289 = or i32 %284, 1
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %290
  %292 = load i16, i16 addrspace(1)* %291, align 2, !tbaa !7, !amdgpu.noclobber !5
  %293 = zext i16 %292 to i32
  %294 = shl nuw i32 %293, 16
  %295 = or i32 %294, %288
  %296 = add nsw i32 %284, 3
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %297
  %299 = load i16, i16 addrspace(1)* %298, align 2, !tbaa !7, !amdgpu.noclobber !5
  %300 = add nsw i32 %284, 5
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %301
  %303 = load i16, i16 addrspace(1)* %302, align 2, !tbaa !7, !amdgpu.noclobber !5
  %304 = add nsw i32 %284, 6
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %305
  %307 = load i16, i16 addrspace(1)* %306, align 2, !tbaa !7, !amdgpu.noclobber !5
  %308 = zext i16 %307 to i32
  %309 = add nsw i32 %284, 7
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %310
  %312 = load i16, i16 addrspace(1)* %311, align 2, !tbaa !7, !amdgpu.noclobber !5
  %313 = zext i16 %312 to i32
  %314 = shl nuw i32 %313, 16
  %315 = or i32 %314, %308
  %316 = lshr i32 %293, 4
  %317 = and i32 %316, 1023
  %318 = lshr i32 %295, 10
  %319 = and i32 %318, 1023
  %320 = and i32 %288, 1023
  %321 = lshr i16 %299, 4
  %322 = and i16 %321, 1023
  %323 = lshr i16 %303, 4
  %324 = and i16 %323, 1023
  %325 = lshr i32 %315, 10
  %326 = and i32 %325, 1023
  %327 = and i32 %308, 1023
  %328 = add nsw i32 %284, 8
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %329
  %331 = load i16, i16 addrspace(1)* %330, align 2, !tbaa !7, !amdgpu.noclobber !5
  %332 = zext i16 %331 to i64
  %333 = add nsw i32 %284, 9
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %334
  %336 = load i16, i16 addrspace(1)* %335, align 2, !tbaa !7, !amdgpu.noclobber !5
  %337 = zext i16 %336 to i64
  %338 = shl nuw nsw i64 %337, 16
  %339 = or i64 %338, %332
  %340 = add nsw i32 %284, 10
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %341
  %343 = load i16, i16 addrspace(1)* %342, align 2, !tbaa !7, !amdgpu.noclobber !5
  %344 = zext i16 %343 to i32
  %345 = add nsw i32 %284, 11
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %346
  %348 = load i16, i16 addrspace(1)* %347, align 2, !tbaa !7, !amdgpu.noclobber !5
  %349 = zext i16 %348 to i32
  %350 = shl nuw i32 %349, 16
  %351 = or i32 %350, %344
  %352 = add nsw i32 %284, 12
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %353
  %355 = load i16, i16 addrspace(1)* %354, align 2, !tbaa !7, !amdgpu.noclobber !5
  %356 = add nsw i32 %284, 14
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %357
  %359 = load i16, i16 addrspace(1)* %358, align 2, !tbaa !7, !amdgpu.noclobber !5
  %360 = lshr i64 %339, 10
  %361 = and i64 %360, 1023
  %362 = lshr i32 %349, 4
  %363 = and i32 %362, 1023
  %364 = lshr i32 %351, 10
  %365 = and i32 %364, 1023
  %366 = and i16 %355, 1023
  %367 = and i16 %359, 1023
  %368 = mul nsw i32 %16, 6
  %369 = mul nsw i32 %24, %4
  %370 = zext i32 %319 to i64
  %371 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %370
  %372 = load i32, i32 addrspace(1)* %371, align 4, !tbaa !11, !amdgpu.noclobber !5
  %373 = trunc i32 %372 to i8
  %374 = add nsw i32 %369, %368
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %375
  store i8 %373, i8 addrspace(1)* %376, align 1, !tbaa !13
  %377 = zext i16 %322 to i64
  %378 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %377
  %379 = load i32, i32 addrspace(1)* %378, align 4, !tbaa !11
  %380 = trunc i32 %379 to i8
  %381 = add nsw i32 %374, 1
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %382
  store i8 %380, i8 addrspace(1)* %383, align 1, !tbaa !13
  %384 = zext i32 %327 to i64
  %385 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %384
  %386 = load i32, i32 addrspace(1)* %385, align 4, !tbaa !11
  %387 = trunc i32 %386 to i8
  %388 = add nsw i32 %374, 2
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %389
  store i8 %387, i8 addrspace(1)* %390, align 1, !tbaa !13
  %391 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %361
  %392 = load i32, i32 addrspace(1)* %391, align 4, !tbaa !11
  %393 = trunc i32 %392 to i8
  %394 = add nsw i32 %374, 3
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %395
  store i8 %393, i8 addrspace(1)* %396, align 1, !tbaa !13
  %397 = zext i32 %363 to i64
  %398 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %397
  %399 = load i32, i32 addrspace(1)* %398, align 4, !tbaa !11
  %400 = trunc i32 %399 to i8
  %401 = add nsw i32 %374, 4
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %402
  store i8 %400, i8 addrspace(1)* %403, align 1, !tbaa !13
  %404 = zext i16 %367 to i64
  %405 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %404
  %406 = load i32, i32 addrspace(1)* %405, align 4, !tbaa !11
  %407 = trunc i32 %406 to i8
  %408 = add nsw i32 %374, 5
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %409
  store i8 %407, i8 addrspace(1)* %410, align 1, !tbaa !13
  %411 = mul nsw i32 %16, 3
  %412 = sdiv i32 %369, 2
  %413 = zext i32 %320 to i64
  %414 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %413
  %415 = load i32, i32 addrspace(1)* %414, align 4, !tbaa !11
  %416 = trunc i32 %415 to i8
  %417 = add i32 %412, %411
  %418 = sext i32 %417 to i64
  %419 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %418
  store i8 %416, i8 addrspace(1)* %419, align 1, !tbaa !13
  %420 = zext i16 %324 to i64
  %421 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %420
  %422 = load i32, i32 addrspace(1)* %421, align 4, !tbaa !11
  %423 = trunc i32 %422 to i8
  %424 = add nsw i32 %417, 1
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %425
  store i8 %423, i8 addrspace(1)* %426, align 1, !tbaa !13
  %427 = zext i32 %365 to i64
  %428 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %427
  %429 = load i32, i32 addrspace(1)* %428, align 4, !tbaa !11
  %430 = trunc i32 %429 to i8
  %431 = add nsw i32 %417, 2
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %432
  store i8 %430, i8 addrspace(1)* %433, align 1, !tbaa !13
  %434 = mul i32 %4, 3
  %435 = mul i32 %434, %5
  %436 = sdiv i32 %435, 2
  %437 = zext i32 %317 to i64
  %438 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %437
  %439 = load i32, i32 addrspace(1)* %438, align 4, !tbaa !11
  %440 = trunc i32 %439 to i8
  %441 = add i32 %417, %436
  %442 = sext i32 %441 to i64
  %443 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %442
  store i8 %440, i8 addrspace(1)* %443, align 1, !tbaa !13
  %444 = zext i32 %326 to i64
  %445 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %444
  %446 = load i32, i32 addrspace(1)* %445, align 4, !tbaa !11
  %447 = trunc i32 %446 to i8
  %448 = add nsw i32 %441, 1
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %449
  store i8 %447, i8 addrspace(1)* %450, align 1, !tbaa !13
  %451 = zext i16 %366 to i64
  %452 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %451
  %453 = add nsw i32 %441, 2
  br label %454

454:                                              ; preds = %31, %210, %280
  %455 = phi i32 [ %453, %280 ], [ %274, %210 ], [ %204, %31 ]
  %456 = phi i32 addrspace(1)* [ %452, %280 ], [ %272, %210 ], [ %203, %31 ]
  %457 = load i32, i32 addrspace(1)* %456, align 4, !tbaa !11
  %458 = trunc i32 %457 to i8
  %459 = sext i32 %455 to i64
  %460 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %459
  store i8 %458, i8 addrspace(1)* %460, align 1, !tbaa !13
  br label %461

461:                                              ; preds = %454, %275, %7, %205, %26
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = !{!9, !9, i64 0}
