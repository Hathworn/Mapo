; ModuleID = '../data/hip_kernels/4154/3/main.cu'
source_filename = "../data/hip_kernels/4154/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL17resizeBatchKernelPKtiiPtii = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL17resizeBatchKernelPKtiiPtii(i16 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i16 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5) local_unnamed_addr #0 comdat {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = sdiv i32 %2, %5
  switch i32 %24, label %365 [
    i32 4, label %25
    i32 6, label %163
    i32 2, label %221
  ]

25:                                               ; preds = %6
  %26 = sdiv i32 %4, 6
  %27 = icmp slt i32 %15, %26
  %28 = icmp slt i32 %23, %5
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %365

30:                                               ; preds = %25
  %31 = mul nsw i32 %23, %1
  %32 = shl nsw i32 %31, 2
  %33 = shl nsw i32 %15, 5
  %34 = add nsw i32 %32, %33
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %35
  %37 = load i16, i16 addrspace(1)* %36, align 2, !tbaa !7, !amdgpu.noclobber !5
  %38 = zext i16 %37 to i32
  %39 = or i32 %34, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %40
  %42 = load i16, i16 addrspace(1)* %41, align 2, !tbaa !7, !amdgpu.noclobber !5
  %43 = zext i16 %42 to i32
  %44 = shl nuw i32 %43, 16
  %45 = or i32 %44, %38
  %46 = add nsw i32 %34, 6
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %47
  %49 = load i16, i16 addrspace(1)* %48, align 2, !tbaa !7, !amdgpu.noclobber !5
  %50 = lshr i16 %42, 4
  %51 = and i16 %50, 1023
  %52 = lshr i32 %45, 10
  %53 = and i16 %37, 1023
  %54 = and i16 %49, 1023
  %55 = add nsw i32 %34, 10
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %56
  %58 = load i16, i16 addrspace(1)* %57, align 2, !tbaa !7, !amdgpu.noclobber !5
  %59 = zext i16 %58 to i32
  %60 = add nsw i32 %34, 11
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %61
  %63 = load i16, i16 addrspace(1)* %62, align 2, !tbaa !7, !amdgpu.noclobber !5
  %64 = zext i16 %63 to i32
  %65 = shl nuw i32 %64, 16
  %66 = or i32 %65, %59
  %67 = add nsw i32 %34, 12
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %68
  %70 = load i16, i16 addrspace(1)* %69, align 2, !tbaa !7, !amdgpu.noclobber !5
  %71 = lshr i16 %63, 4
  %72 = and i16 %71, 1023
  %73 = lshr i32 %66, 10
  %74 = and i16 %70, 1023
  %75 = add nsw i32 %34, 16
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %76
  %78 = load i16, i16 addrspace(1)* %77, align 2, !tbaa !7, !amdgpu.noclobber !5
  %79 = zext i16 %78 to i32
  %80 = add nsw i32 %34, 17
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %81
  %83 = load i16, i16 addrspace(1)* %82, align 2, !tbaa !7, !amdgpu.noclobber !5
  %84 = zext i16 %83 to i32
  %85 = shl nuw i32 %84, 16
  %86 = or i32 %85, %79
  %87 = add nsw i32 %34, 21
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %88
  %90 = load i16, i16 addrspace(1)* %89, align 2, !tbaa !7, !amdgpu.noclobber !5
  %91 = add nsw i32 %34, 22
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %92
  %94 = load i16, i16 addrspace(1)* %93, align 2, !tbaa !7, !amdgpu.noclobber !5
  %95 = zext i16 %94 to i32
  %96 = add nsw i32 %34, 23
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %97
  %99 = load i16, i16 addrspace(1)* %98, align 2, !tbaa !7, !amdgpu.noclobber !5
  %100 = zext i16 %99 to i32
  %101 = shl nuw i32 %100, 16
  %102 = or i32 %101, %95
  %103 = lshr i32 %86, 10
  %104 = lshr i16 %90, 4
  %105 = and i16 %104, 1023
  %106 = lshr i32 %102, 10
  %107 = and i16 %94, 1023
  %108 = add nsw i32 %34, 27
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %109
  %111 = load i16, i16 addrspace(1)* %110, align 2, !tbaa !7, !amdgpu.noclobber !5
  %112 = lshr i16 %111, 4
  %113 = and i16 %112, 1023
  %114 = mul nsw i32 %15, 6
  %115 = mul nsw i32 %23, %4
  %116 = trunc i32 %52 to i16
  %117 = and i16 %116, 1023
  %118 = add nsw i32 %115, %114
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %119
  store i16 %117, i16 addrspace(1)* %120, align 2, !tbaa !7
  %121 = add nsw i32 %118, 1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %122
  store i16 %54, i16 addrspace(1)* %123, align 2, !tbaa !7
  %124 = add nsw i32 %118, 2
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %125
  store i16 %72, i16 addrspace(1)* %126, align 2, !tbaa !7
  %127 = trunc i32 %103 to i16
  %128 = and i16 %127, 1023
  %129 = add nsw i32 %118, 3
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %130
  store i16 %128, i16 addrspace(1)* %131, align 2, !tbaa !7
  %132 = add nsw i32 %118, 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %133
  store i16 %107, i16 addrspace(1)* %134, align 2, !tbaa !7
  %135 = add nsw i32 %118, 5
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %136
  store i16 %113, i16 addrspace(1)* %137, align 2, !tbaa !7
  %138 = mul nsw i32 %15, 3
  %139 = sdiv i32 %115, 2
  %140 = mul nsw i32 %5, %4
  %141 = add i32 %139, %138
  %142 = add i32 %141, %140
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %143
  store i16 %53, i16 addrspace(1)* %144, align 2, !tbaa !7
  %145 = trunc i32 %73 to i16
  %146 = and i16 %145, 1023
  %147 = add nsw i32 %142, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %148
  store i16 %146, i16 addrspace(1)* %149, align 2, !tbaa !7
  %150 = add nsw i32 %142, 2
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %151
  store i16 %105, i16 addrspace(1)* %152, align 2, !tbaa !7
  %153 = mul nsw i32 %140, 3
  %154 = sdiv i32 %153, 2
  %155 = add i32 %141, %154
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %156
  store i16 %51, i16 addrspace(1)* %157, align 2, !tbaa !7
  %158 = add nsw i32 %155, 1
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %159
  store i16 %74, i16 addrspace(1)* %160, align 2, !tbaa !7
  %161 = trunc i32 %106 to i16
  %162 = add nsw i32 %155, 2
  br label %359

163:                                              ; preds = %6
  %164 = sdiv i32 %4, 2
  %165 = icmp slt i32 %15, %164
  %166 = icmp slt i32 %23, %5
  %167 = select i1 %165, i1 %166, i1 false
  br i1 %167, label %168, label %365

168:                                              ; preds = %163
  %169 = mul nsw i32 %23, %1
  %170 = mul nsw i32 %169, 6
  %171 = shl nsw i32 %15, 4
  %172 = add nsw i32 %170, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %173
  %175 = load i16, i16 addrspace(1)* %174, align 2, !tbaa !7, !amdgpu.noclobber !5
  %176 = zext i16 %175 to i32
  %177 = or i32 %172, 1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %178
  %180 = load i16, i16 addrspace(1)* %179, align 2, !tbaa !7, !amdgpu.noclobber !5
  %181 = zext i16 %180 to i32
  %182 = shl nuw i32 %181, 16
  %183 = or i32 %182, %176
  %184 = lshr i16 %180, 4
  %185 = lshr i32 %183, 10
  %186 = and i16 %175, 1023
  %187 = add nsw i32 %172, 8
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %188
  %190 = load i16, i16 addrspace(1)* %189, align 2, !tbaa !7, !amdgpu.noclobber !5
  %191 = zext i16 %190 to i32
  %192 = add nsw i32 %172, 9
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %193
  %195 = load i16, i16 addrspace(1)* %194, align 2, !tbaa !7, !amdgpu.noclobber !5
  %196 = zext i16 %195 to i32
  %197 = shl nuw i32 %196, 16
  %198 = or i32 %197, %191
  %199 = lshr i32 %198, 10
  %200 = shl nsw i32 %15, 1
  %201 = mul nsw i32 %23, %4
  %202 = trunc i32 %185 to i16
  %203 = and i16 %202, 1023
  %204 = add nsw i32 %201, %200
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %205
  store i16 %203, i16 addrspace(1)* %206, align 2, !tbaa !7
  %207 = trunc i32 %199 to i16
  %208 = and i16 %207, 1023
  %209 = add nsw i32 %204, 1
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %210
  store i16 %208, i16 addrspace(1)* %211, align 2, !tbaa !7
  %212 = sdiv i32 %201, 2
  %213 = mul nsw i32 %5, %4
  %214 = add i32 %212, %15
  %215 = add i32 %214, %213
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %216
  store i16 %186, i16 addrspace(1)* %217, align 2, !tbaa !7
  %218 = mul nsw i32 %213, 3
  %219 = sdiv i32 %218, 2
  %220 = add i32 %214, %219
  br label %359

221:                                              ; preds = %6
  %222 = sdiv i32 %4, 6
  %223 = icmp slt i32 %15, %222
  %224 = icmp slt i32 %23, %5
  %225 = select i1 %223, i1 %224, i1 false
  br i1 %225, label %226, label %365

226:                                              ; preds = %221
  %227 = mul nsw i32 %23, %1
  %228 = shl nsw i32 %227, 1
  %229 = shl nsw i32 %15, 4
  %230 = add nsw i32 %228, %229
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %231
  %233 = load i16, i16 addrspace(1)* %232, align 2, !tbaa !7, !amdgpu.noclobber !5
  %234 = zext i16 %233 to i32
  %235 = or i32 %230, 1
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %236
  %238 = load i16, i16 addrspace(1)* %237, align 2, !tbaa !7, !amdgpu.noclobber !5
  %239 = zext i16 %238 to i32
  %240 = shl nuw i32 %239, 16
  %241 = or i32 %240, %234
  %242 = add nsw i32 %230, 3
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %243
  %245 = load i16, i16 addrspace(1)* %244, align 2, !tbaa !7, !amdgpu.noclobber !5
  %246 = add nsw i32 %230, 5
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %247
  %249 = load i16, i16 addrspace(1)* %248, align 2, !tbaa !7, !amdgpu.noclobber !5
  %250 = add nsw i32 %230, 6
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %251
  %253 = load i16, i16 addrspace(1)* %252, align 2, !tbaa !7, !amdgpu.noclobber !5
  %254 = zext i16 %253 to i32
  %255 = add nsw i32 %230, 7
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %256
  %258 = load i16, i16 addrspace(1)* %257, align 2, !tbaa !7, !amdgpu.noclobber !5
  %259 = zext i16 %258 to i32
  %260 = shl nuw i32 %259, 16
  %261 = or i32 %260, %254
  %262 = lshr i16 %238, 4
  %263 = and i16 %262, 1023
  %264 = lshr i32 %241, 10
  %265 = and i16 %233, 1023
  %266 = lshr i16 %245, 4
  %267 = and i16 %266, 1023
  %268 = lshr i16 %249, 4
  %269 = and i16 %268, 1023
  %270 = lshr i32 %261, 10
  %271 = and i16 %253, 1023
  %272 = add nsw i32 %230, 8
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %273
  %275 = load i16, i16 addrspace(1)* %274, align 2, !tbaa !7, !amdgpu.noclobber !5
  %276 = zext i16 %275 to i32
  %277 = add nsw i32 %230, 9
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %278
  %280 = load i16, i16 addrspace(1)* %279, align 2, !tbaa !7, !amdgpu.noclobber !5
  %281 = zext i16 %280 to i32
  %282 = shl nuw i32 %281, 16
  %283 = or i32 %282, %276
  %284 = add nsw i32 %230, 10
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %285
  %287 = load i16, i16 addrspace(1)* %286, align 2, !tbaa !7, !amdgpu.noclobber !5
  %288 = zext i16 %287 to i32
  %289 = add nsw i32 %230, 11
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %290
  %292 = load i16, i16 addrspace(1)* %291, align 2, !tbaa !7, !amdgpu.noclobber !5
  %293 = zext i16 %292 to i32
  %294 = shl nuw i32 %293, 16
  %295 = or i32 %294, %288
  %296 = add nsw i32 %230, 12
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %297
  %299 = load i16, i16 addrspace(1)* %298, align 2, !tbaa !7, !amdgpu.noclobber !5
  %300 = add nsw i32 %230, 14
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %301
  %303 = load i16, i16 addrspace(1)* %302, align 2, !tbaa !7, !amdgpu.noclobber !5
  %304 = lshr i32 %283, 10
  %305 = lshr i16 %292, 4
  %306 = and i16 %305, 1023
  %307 = lshr i32 %295, 10
  %308 = and i16 %303, 1023
  %309 = mul nsw i32 %15, 6
  %310 = mul nsw i32 %23, %4
  %311 = trunc i32 %264 to i16
  %312 = and i16 %311, 1023
  %313 = add nsw i32 %310, %309
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %314
  store i16 %312, i16 addrspace(1)* %315, align 2, !tbaa !7
  %316 = add nsw i32 %313, 1
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %317
  store i16 %267, i16 addrspace(1)* %318, align 2, !tbaa !7
  %319 = add nsw i32 %313, 2
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %320
  store i16 %271, i16 addrspace(1)* %321, align 2, !tbaa !7
  %322 = trunc i32 %304 to i16
  %323 = and i16 %322, 1023
  %324 = add nsw i32 %313, 3
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %325
  store i16 %323, i16 addrspace(1)* %326, align 2, !tbaa !7
  %327 = add nsw i32 %313, 4
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %328
  store i16 %306, i16 addrspace(1)* %329, align 2, !tbaa !7
  %330 = add nsw i32 %313, 5
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %331
  store i16 %308, i16 addrspace(1)* %332, align 2, !tbaa !7
  %333 = mul nsw i32 %15, 3
  %334 = sdiv i32 %310, 2
  %335 = mul nsw i32 %5, %4
  %336 = add i32 %334, %333
  %337 = add i32 %336, %335
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %338
  store i16 %265, i16 addrspace(1)* %339, align 2, !tbaa !7
  %340 = add nsw i32 %337, 1
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %341
  store i16 %269, i16 addrspace(1)* %342, align 2, !tbaa !7
  %343 = trunc i32 %307 to i16
  %344 = and i16 %343, 1023
  %345 = add nsw i32 %337, 2
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %346
  store i16 %344, i16 addrspace(1)* %347, align 2, !tbaa !7
  %348 = mul nsw i32 %335, 3
  %349 = sdiv i32 %348, 2
  %350 = add i32 %336, %349
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %351
  store i16 %263, i16 addrspace(1)* %352, align 2, !tbaa !7
  %353 = trunc i32 %270 to i16
  %354 = and i16 %353, 1023
  %355 = add nsw i32 %350, 1
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %356
  store i16 %354, i16 addrspace(1)* %357, align 2, !tbaa !7
  %358 = add nsw i32 %350, 2
  br label %359

359:                                              ; preds = %30, %168, %226
  %360 = phi i32 [ %358, %226 ], [ %220, %168 ], [ %162, %30 ]
  %361 = phi i16 [ %299, %226 ], [ %184, %168 ], [ %161, %30 ]
  %362 = and i16 %361, 1023
  %363 = sext i32 %360 to i64
  %364 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %363
  store i16 %362, i16 addrspace(1)* %364, align 2, !tbaa !7
  br label %365

365:                                              ; preds = %359, %221, %6, %163, %25
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
