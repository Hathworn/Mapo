; ModuleID = '../data/hip_kernels/4154/5/main.cu'
source_filename = "../data/hip_kernels/4154/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL17resizeBatchKernelPKtiiPhS1_S1_iiPi = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL17resizeBatchKernelPKtiiPhS1_S1_iiPi(i16 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i8 addrspace(1)* nocapture writeonly %3, i8 addrspace(1)* nocapture writeonly %4, i8 addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, i32 addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 comdat {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = sdiv i32 %2, %7
  switch i32 %27, label %443 [
    i32 4, label %28
    i32 6, label %199
    i32 2, label %266
  ]

28:                                               ; preds = %9
  %29 = sdiv i32 %6, 6
  %30 = icmp slt i32 %18, %29
  %31 = icmp slt i32 %26, %7
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %443

33:                                               ; preds = %28
  %34 = mul nsw i32 %26, %1
  %35 = shl nsw i32 %34, 2
  %36 = shl nsw i32 %18, 5
  %37 = add nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %38
  %40 = load i16, i16 addrspace(1)* %39, align 2, !tbaa !7, !amdgpu.noclobber !5
  %41 = zext i16 %40 to i32
  %42 = or i32 %37, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %43
  %45 = load i16, i16 addrspace(1)* %44, align 2, !tbaa !7, !amdgpu.noclobber !5
  %46 = zext i16 %45 to i32
  %47 = shl nuw i32 %46, 16
  %48 = or i32 %47, %41
  %49 = add nsw i32 %37, 6
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %50
  %52 = load i16, i16 addrspace(1)* %51, align 2, !tbaa !7, !amdgpu.noclobber !5
  %53 = lshr i32 %46, 4
  %54 = and i32 %53, 1023
  %55 = lshr i32 %48, 10
  %56 = and i32 %55, 1023
  %57 = and i32 %41, 1023
  %58 = and i16 %52, 1023
  %59 = add nsw i32 %37, 10
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %60
  %62 = load i16, i16 addrspace(1)* %61, align 2, !tbaa !7, !amdgpu.noclobber !5
  %63 = zext i16 %62 to i32
  %64 = add nsw i32 %37, 11
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %65
  %67 = load i16, i16 addrspace(1)* %66, align 2, !tbaa !7, !amdgpu.noclobber !5
  %68 = zext i16 %67 to i32
  %69 = shl nuw i32 %68, 16
  %70 = or i32 %69, %63
  %71 = add nsw i32 %37, 12
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %72
  %74 = load i16, i16 addrspace(1)* %73, align 2, !tbaa !7, !amdgpu.noclobber !5
  %75 = lshr i32 %68, 4
  %76 = and i32 %75, 1023
  %77 = lshr i32 %70, 10
  %78 = and i32 %77, 1023
  %79 = and i16 %74, 1023
  %80 = add nsw i32 %37, 16
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %81
  %83 = load i16, i16 addrspace(1)* %82, align 2, !tbaa !7, !amdgpu.noclobber !5
  %84 = zext i16 %83 to i64
  %85 = add nsw i32 %37, 17
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %86
  %88 = load i16, i16 addrspace(1)* %87, align 2, !tbaa !7, !amdgpu.noclobber !5
  %89 = zext i16 %88 to i64
  %90 = shl nuw nsw i64 %89, 16
  %91 = or i64 %90, %84
  %92 = add nsw i32 %37, 21
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %93
  %95 = load i16, i16 addrspace(1)* %94, align 2, !tbaa !7, !amdgpu.noclobber !5
  %96 = add nsw i32 %37, 22
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %97
  %99 = load i16, i16 addrspace(1)* %98, align 2, !tbaa !7, !amdgpu.noclobber !5
  %100 = zext i16 %99 to i32
  %101 = add nsw i32 %37, 23
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %102
  %104 = load i16, i16 addrspace(1)* %103, align 2, !tbaa !7, !amdgpu.noclobber !5
  %105 = zext i16 %104 to i32
  %106 = shl nuw i32 %105, 16
  %107 = or i32 %106, %100
  %108 = lshr i64 %91, 10
  %109 = and i64 %108, 1023
  %110 = lshr i16 %95, 4
  %111 = and i16 %110, 1023
  %112 = lshr i32 %107, 10
  %113 = and i32 %112, 1023
  %114 = and i32 %100, 1023
  %115 = add nsw i32 %37, 27
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %116
  %118 = load i16, i16 addrspace(1)* %117, align 2, !tbaa !7, !amdgpu.noclobber !5
  %119 = lshr i16 %118, 4
  %120 = and i16 %119, 1023
  %121 = mul nsw i32 %18, 6
  %122 = mul nsw i32 %26, %6
  %123 = zext i32 %56 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !11, !amdgpu.noclobber !5
  %126 = trunc i32 %125 to i8
  %127 = add nsw i32 %122, %121
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %128
  store i8 %126, i8 addrspace(1)* %129, align 1, !tbaa !13
  %130 = zext i16 %58 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %130
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !11
  %133 = trunc i32 %132 to i8
  %134 = add nsw i32 %127, 1
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %135
  store i8 %133, i8 addrspace(1)* %136, align 1, !tbaa !13
  %137 = zext i32 %76 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !11
  %140 = trunc i32 %139 to i8
  %141 = add nsw i32 %127, 2
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %142
  store i8 %140, i8 addrspace(1)* %143, align 1, !tbaa !13
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %109
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !11
  %146 = trunc i32 %145 to i8
  %147 = add nsw i32 %127, 3
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %148
  store i8 %146, i8 addrspace(1)* %149, align 1, !tbaa !13
  %150 = zext i32 %114 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %150
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !11
  %153 = trunc i32 %152 to i8
  %154 = add nsw i32 %127, 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %155
  store i8 %153, i8 addrspace(1)* %156, align 1, !tbaa !13
  %157 = zext i16 %120 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %157
  %159 = load i32, i32 addrspace(1)* %158, align 4, !tbaa !11
  %160 = trunc i32 %159 to i8
  %161 = add nsw i32 %127, 5
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %162
  store i8 %160, i8 addrspace(1)* %163, align 1, !tbaa !13
  %164 = mul nsw i32 %18, 3
  %165 = sdiv i32 %122, 2
  %166 = zext i32 %57 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %166
  %168 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !11
  %169 = trunc i32 %168 to i8
  %170 = add nsw i32 %165, %164
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %171
  store i8 %169, i8 addrspace(1)* %172, align 1, !tbaa !13
  %173 = zext i32 %78 to i64
  %174 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %173
  %175 = load i32, i32 addrspace(1)* %174, align 4, !tbaa !11
  %176 = trunc i32 %175 to i8
  %177 = add nsw i32 %170, 1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %178
  store i8 %176, i8 addrspace(1)* %179, align 1, !tbaa !13
  %180 = zext i16 %111 to i64
  %181 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %180
  %182 = load i32, i32 addrspace(1)* %181, align 4, !tbaa !11
  %183 = trunc i32 %182 to i8
  %184 = add nsw i32 %170, 2
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %185
  store i8 %183, i8 addrspace(1)* %186, align 1, !tbaa !13
  %187 = zext i32 %54 to i64
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %187
  %189 = load i32, i32 addrspace(1)* %188, align 4, !tbaa !11
  %190 = trunc i32 %189 to i8
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %171
  store i8 %190, i8 addrspace(1)* %191, align 1, !tbaa !13
  %192 = zext i16 %79 to i64
  %193 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %192
  %194 = load i32, i32 addrspace(1)* %193, align 4, !tbaa !11
  %195 = trunc i32 %194 to i8
  %196 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %178
  store i8 %195, i8 addrspace(1)* %196, align 1, !tbaa !13
  %197 = zext i32 %113 to i64
  %198 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %197
  br label %437

199:                                              ; preds = %9
  %200 = sdiv i32 %6, 2
  %201 = icmp slt i32 %18, %200
  %202 = icmp slt i32 %26, %7
  %203 = select i1 %201, i1 %202, i1 false
  br i1 %203, label %204, label %443

204:                                              ; preds = %199
  %205 = mul nsw i32 %26, %1
  %206 = mul nsw i32 %205, 6
  %207 = shl nsw i32 %18, 4
  %208 = add nsw i32 %206, %207
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %209
  %211 = load i16, i16 addrspace(1)* %210, align 2, !tbaa !7, !amdgpu.noclobber !5
  %212 = zext i16 %211 to i32
  %213 = or i32 %208, 1
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %214
  %216 = load i16, i16 addrspace(1)* %215, align 2, !tbaa !7, !amdgpu.noclobber !5
  %217 = zext i16 %216 to i32
  %218 = shl nuw i32 %217, 16
  %219 = or i32 %218, %212
  %220 = lshr i32 %217, 4
  %221 = and i32 %220, 1023
  %222 = lshr i32 %219, 10
  %223 = and i32 %222, 1023
  %224 = and i32 %212, 1023
  %225 = add nsw i32 %208, 8
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %226
  %228 = load i16, i16 addrspace(1)* %227, align 2, !tbaa !7, !amdgpu.noclobber !5
  %229 = zext i16 %228 to i64
  %230 = add nsw i32 %208, 9
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %231
  %233 = load i16, i16 addrspace(1)* %232, align 2, !tbaa !7, !amdgpu.noclobber !5
  %234 = zext i16 %233 to i64
  %235 = shl nuw nsw i64 %234, 16
  %236 = or i64 %235, %229
  %237 = lshr i64 %236, 10
  %238 = and i64 %237, 1023
  %239 = shl nsw i32 %18, 1
  %240 = mul nsw i32 %26, %6
  %241 = zext i32 %223 to i64
  %242 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %241
  %243 = load i32, i32 addrspace(1)* %242, align 4, !tbaa !11, !amdgpu.noclobber !5
  %244 = trunc i32 %243 to i8
  %245 = add nsw i32 %240, %239
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %246
  store i8 %244, i8 addrspace(1)* %247, align 1, !tbaa !13
  %248 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %238
  %249 = load i32, i32 addrspace(1)* %248, align 4, !tbaa !11
  %250 = trunc i32 %249 to i8
  %251 = add nsw i32 %245, 1
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %252
  store i8 %250, i8 addrspace(1)* %253, align 1, !tbaa !13
  %254 = sdiv i32 %240, 2
  %255 = zext i32 %224 to i64
  %256 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %255
  %257 = load i32, i32 addrspace(1)* %256, align 4, !tbaa !11
  %258 = trunc i32 %257 to i8
  %259 = add nsw i32 %254, %18
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %260
  store i8 %258, i8 addrspace(1)* %261, align 1, !tbaa !13
  %262 = zext i32 %221 to i64
  %263 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %262
  %264 = add nsw i32 %259, 1
  %265 = sext i32 %264 to i64
  br label %437

266:                                              ; preds = %9
  %267 = sdiv i32 %6, 6
  %268 = icmp slt i32 %18, %267
  %269 = icmp slt i32 %26, %7
  %270 = select i1 %268, i1 %269, i1 false
  br i1 %270, label %271, label %443

271:                                              ; preds = %266
  %272 = mul nsw i32 %26, %1
  %273 = shl nsw i32 %272, 1
  %274 = shl nsw i32 %18, 4
  %275 = add nsw i32 %273, %274
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %276
  %278 = load i16, i16 addrspace(1)* %277, align 2, !tbaa !7, !amdgpu.noclobber !5
  %279 = zext i16 %278 to i32
  %280 = or i32 %275, 1
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %281
  %283 = load i16, i16 addrspace(1)* %282, align 2, !tbaa !7, !amdgpu.noclobber !5
  %284 = zext i16 %283 to i32
  %285 = shl nuw i32 %284, 16
  %286 = or i32 %285, %279
  %287 = add nsw i32 %275, 3
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %288
  %290 = load i16, i16 addrspace(1)* %289, align 2, !tbaa !7, !amdgpu.noclobber !5
  %291 = add nsw i32 %275, 5
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %292
  %294 = load i16, i16 addrspace(1)* %293, align 2, !tbaa !7, !amdgpu.noclobber !5
  %295 = add nsw i32 %275, 6
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %296
  %298 = load i16, i16 addrspace(1)* %297, align 2, !tbaa !7, !amdgpu.noclobber !5
  %299 = zext i16 %298 to i32
  %300 = add nsw i32 %275, 7
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %301
  %303 = load i16, i16 addrspace(1)* %302, align 2, !tbaa !7, !amdgpu.noclobber !5
  %304 = zext i16 %303 to i32
  %305 = shl nuw i32 %304, 16
  %306 = or i32 %305, %299
  %307 = lshr i32 %284, 4
  %308 = and i32 %307, 1023
  %309 = lshr i32 %286, 10
  %310 = and i32 %309, 1023
  %311 = and i32 %279, 1023
  %312 = lshr i16 %290, 4
  %313 = and i16 %312, 1023
  %314 = lshr i16 %294, 4
  %315 = and i16 %314, 1023
  %316 = lshr i32 %306, 10
  %317 = and i32 %316, 1023
  %318 = and i32 %299, 1023
  %319 = add nsw i32 %275, 8
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %320
  %322 = load i16, i16 addrspace(1)* %321, align 2, !tbaa !7, !amdgpu.noclobber !5
  %323 = zext i16 %322 to i64
  %324 = add nsw i32 %275, 9
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %325
  %327 = load i16, i16 addrspace(1)* %326, align 2, !tbaa !7, !amdgpu.noclobber !5
  %328 = zext i16 %327 to i64
  %329 = shl nuw nsw i64 %328, 16
  %330 = or i64 %329, %323
  %331 = add nsw i32 %275, 10
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %332
  %334 = load i16, i16 addrspace(1)* %333, align 2, !tbaa !7, !amdgpu.noclobber !5
  %335 = zext i16 %334 to i32
  %336 = add nsw i32 %275, 11
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %337
  %339 = load i16, i16 addrspace(1)* %338, align 2, !tbaa !7, !amdgpu.noclobber !5
  %340 = zext i16 %339 to i32
  %341 = shl nuw i32 %340, 16
  %342 = or i32 %341, %335
  %343 = add nsw i32 %275, 12
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %344
  %346 = load i16, i16 addrspace(1)* %345, align 2, !tbaa !7, !amdgpu.noclobber !5
  %347 = add nsw i32 %275, 14
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %348
  %350 = load i16, i16 addrspace(1)* %349, align 2, !tbaa !7, !amdgpu.noclobber !5
  %351 = lshr i64 %330, 10
  %352 = and i64 %351, 1023
  %353 = lshr i32 %340, 4
  %354 = and i32 %353, 1023
  %355 = lshr i32 %342, 10
  %356 = and i32 %355, 1023
  %357 = and i16 %346, 1023
  %358 = and i16 %350, 1023
  %359 = mul nsw i32 %18, 6
  %360 = mul nsw i32 %26, %6
  %361 = zext i32 %310 to i64
  %362 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %361
  %363 = load i32, i32 addrspace(1)* %362, align 4, !tbaa !11, !amdgpu.noclobber !5
  %364 = trunc i32 %363 to i8
  %365 = add nsw i32 %360, %359
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %366
  store i8 %364, i8 addrspace(1)* %367, align 1, !tbaa !13
  %368 = zext i16 %313 to i64
  %369 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %368
  %370 = load i32, i32 addrspace(1)* %369, align 4, !tbaa !11
  %371 = trunc i32 %370 to i8
  %372 = add nsw i32 %365, 1
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %373
  store i8 %371, i8 addrspace(1)* %374, align 1, !tbaa !13
  %375 = zext i32 %318 to i64
  %376 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %375
  %377 = load i32, i32 addrspace(1)* %376, align 4, !tbaa !11
  %378 = trunc i32 %377 to i8
  %379 = add nsw i32 %365, 2
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %380
  store i8 %378, i8 addrspace(1)* %381, align 1, !tbaa !13
  %382 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %352
  %383 = load i32, i32 addrspace(1)* %382, align 4, !tbaa !11
  %384 = trunc i32 %383 to i8
  %385 = add nsw i32 %365, 3
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %386
  store i8 %384, i8 addrspace(1)* %387, align 1, !tbaa !13
  %388 = zext i32 %354 to i64
  %389 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %388
  %390 = load i32, i32 addrspace(1)* %389, align 4, !tbaa !11
  %391 = trunc i32 %390 to i8
  %392 = add nsw i32 %365, 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %393
  store i8 %391, i8 addrspace(1)* %394, align 1, !tbaa !13
  %395 = zext i16 %358 to i64
  %396 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %395
  %397 = load i32, i32 addrspace(1)* %396, align 4, !tbaa !11
  %398 = trunc i32 %397 to i8
  %399 = add nsw i32 %365, 5
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %400
  store i8 %398, i8 addrspace(1)* %401, align 1, !tbaa !13
  %402 = mul nsw i32 %18, 3
  %403 = sdiv i32 %360, 2
  %404 = zext i32 %311 to i64
  %405 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %404
  %406 = load i32, i32 addrspace(1)* %405, align 4, !tbaa !11
  %407 = trunc i32 %406 to i8
  %408 = add nsw i32 %403, %402
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %409
  store i8 %407, i8 addrspace(1)* %410, align 1, !tbaa !13
  %411 = zext i16 %315 to i64
  %412 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %411
  %413 = load i32, i32 addrspace(1)* %412, align 4, !tbaa !11
  %414 = trunc i32 %413 to i8
  %415 = add nsw i32 %408, 1
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %416
  store i8 %414, i8 addrspace(1)* %417, align 1, !tbaa !13
  %418 = zext i32 %356 to i64
  %419 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %418
  %420 = load i32, i32 addrspace(1)* %419, align 4, !tbaa !11
  %421 = trunc i32 %420 to i8
  %422 = add nsw i32 %408, 2
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %423
  store i8 %421, i8 addrspace(1)* %424, align 1, !tbaa !13
  %425 = zext i32 %308 to i64
  %426 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %425
  %427 = load i32, i32 addrspace(1)* %426, align 4, !tbaa !11
  %428 = trunc i32 %427 to i8
  %429 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %409
  store i8 %428, i8 addrspace(1)* %429, align 1, !tbaa !13
  %430 = zext i32 %317 to i64
  %431 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %430
  %432 = load i32, i32 addrspace(1)* %431, align 4, !tbaa !11
  %433 = trunc i32 %432 to i8
  %434 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %416
  store i8 %433, i8 addrspace(1)* %434, align 1, !tbaa !13
  %435 = zext i16 %357 to i64
  %436 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %435
  br label %437

437:                                              ; preds = %33, %204, %271
  %438 = phi i64 [ %423, %271 ], [ %265, %204 ], [ %185, %33 ]
  %439 = phi i32 addrspace(1)* [ %436, %271 ], [ %263, %204 ], [ %198, %33 ]
  %440 = load i32, i32 addrspace(1)* %439, align 4, !tbaa !11
  %441 = trunc i32 %440 to i8
  %442 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %438
  store i8 %441, i8 addrspace(1)* %442, align 1, !tbaa !13
  br label %443

443:                                              ; preds = %437, %266, %9, %199, %28
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
