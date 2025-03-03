; ModuleID = '../data/hip_kernels/12941/1/main.cu'
source_filename = "../data/hip_kernels/12941/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12bitonicSort2Pijjj(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = bitcast i32 addrspace(1)* %0 to %struct.HIP_vector_type addrspace(1)*
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = icmp eq i32 %1, 0
  br i1 %16, label %198, label %17

17:                                               ; preds = %4
  %18 = icmp eq i32 %2, 0
  br i1 %18, label %97, label %19

19:                                               ; preds = %17
  %20 = add i32 %2, -1
  %21 = shl nuw i32 1, %20
  %22 = sext i32 %21 to i64
  %23 = add nsw i64 %22, 4294967295
  %24 = zext i32 %20 to i64
  %25 = lshr i64 %15, %24
  %26 = zext i32 %2 to i64
  %27 = shl i64 %25, %26
  %28 = and i64 %23, %15
  %29 = add i64 %27, %28
  %30 = add i64 %29, %22
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %29, i32 0, i32 0, i32 0, i64 0
  %32 = load i32, i32 addrspace(1)* %31, align 16, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %29, i32 0, i32 0, i32 0, i64 1
  %34 = load i32, i32 addrspace(1)* %33, align 4, !amdgpu.noclobber !5
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %29, i32 0, i32 0, i32 0, i64 2
  %36 = load i32, i32 addrspace(1)* %35, align 8, !amdgpu.noclobber !5
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %29, i32 0, i32 0, i32 0, i64 3
  %38 = load i32, i32 addrspace(1)* %37, align 4, !amdgpu.noclobber !5
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %30
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %39, i64 0, i32 0, i32 0, i32 0
  %41 = load <4 x i32>, <4 x i32> addrspace(1)* %40, align 16, !amdgpu.noclobber !5
  %42 = extractelement <4 x i32> %41, i64 0
  %43 = icmp slt i32 %32, %42
  %44 = zext i1 %43 to i32
  %45 = extractelement <4 x i32> %41, i64 1
  %46 = icmp slt i32 %34, %45
  %47 = zext i1 %46 to i32
  %48 = extractelement <4 x i32> %41, i64 2
  %49 = icmp slt i32 %36, %48
  %50 = zext i1 %49 to i32
  %51 = extractelement <4 x i32> %41, i64 3
  %52 = icmp slt i32 %38, %51
  %53 = zext i1 %52 to i32
  %54 = and i32 %32, %44
  %55 = xor i32 %44, -1
  %56 = and i32 %42, %55
  %57 = or i32 %54, %56
  %58 = and i32 %34, %47
  %59 = xor i32 %47, -1
  %60 = and i32 %45, %59
  %61 = or i32 %58, %60
  %62 = and i32 %36, %50
  %63 = xor i32 %50, -1
  %64 = and i32 %48, %63
  %65 = or i32 %62, %64
  %66 = and i32 %38, %53
  %67 = xor i32 %53, -1
  %68 = and i32 %51, %67
  %69 = or i32 %66, %68
  %70 = and i32 %32, %55
  %71 = and i32 %42, %44
  %72 = or i32 %70, %71
  %73 = and i32 %34, %59
  %74 = and i32 %45, %47
  %75 = or i32 %73, %74
  %76 = and i32 %36, %63
  %77 = and i32 %48, %50
  %78 = or i32 %76, %77
  %79 = and i32 %38, %67
  %80 = and i32 %51, %53
  %81 = or i32 %79, %80
  %82 = add i32 %1, -1
  %83 = zext i32 %82 to i64
  %84 = shl nuw i64 1, %83
  %85 = and i64 %84, %15
  %86 = icmp eq i64 %85, 0
  br i1 %86, label %92, label %87

87:                                               ; preds = %19
  store i32 %57, i32 addrspace(1)* %31, align 16
  store i32 %61, i32 addrspace(1)* %33, align 4
  store i32 %65, i32 addrspace(1)* %35, align 8
  store i32 %69, i32 addrspace(1)* %37, align 4
  %88 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %39, i64 0, i32 0, i32 0, i32 0, i64 0
  store i32 %72, i32 addrspace(1)* %88, align 16
  %89 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %30, i32 0, i32 0, i32 0, i64 1
  store i32 %75, i32 addrspace(1)* %89, align 4
  %90 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %30, i32 0, i32 0, i32 0, i64 2
  store i32 %78, i32 addrspace(1)* %90, align 8
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %30, i32 0, i32 0, i32 0, i64 3
  store i32 %81, i32 addrspace(1)* %91, align 4
  br label %325

92:                                               ; preds = %19
  %93 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %39, i64 0, i32 0, i32 0, i32 0, i64 0
  store i32 %57, i32 addrspace(1)* %93, align 16
  %94 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %30, i32 0, i32 0, i32 0, i64 1
  store i32 %61, i32 addrspace(1)* %94, align 4
  %95 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %30, i32 0, i32 0, i32 0, i64 2
  store i32 %65, i32 addrspace(1)* %95, align 8
  %96 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %30, i32 0, i32 0, i32 0, i64 3
  store i32 %69, i32 addrspace(1)* %96, align 4
  store i32 %72, i32 addrspace(1)* %31, align 16
  store i32 %75, i32 addrspace(1)* %33, align 4
  store i32 %78, i32 addrspace(1)* %35, align 8
  store i32 %81, i32 addrspace(1)* %37, align 4
  br label %325

97:                                               ; preds = %17
  %98 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %15, i32 0, i32 0, i32 0, i64 0
  %99 = load i32, i32 addrspace(1)* %98, align 16, !amdgpu.noclobber !5
  %100 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %15, i32 0, i32 0, i32 0, i64 1
  %101 = load i32, i32 addrspace(1)* %100, align 4, !amdgpu.noclobber !5
  %102 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %15, i32 0, i32 0, i32 0, i64 2
  %103 = load i32, i32 addrspace(1)* %102, align 8, !amdgpu.noclobber !5
  %104 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %15, i32 0, i32 0, i32 0, i64 3
  %105 = load i32, i32 addrspace(1)* %104, align 4, !amdgpu.noclobber !5
  %106 = icmp slt i32 %99, %103
  %107 = zext i1 %106 to i32
  %108 = icmp slt i32 %101, %105
  %109 = zext i1 %108 to i32
  %110 = icmp slt i32 %103, %99
  %111 = zext i1 %110 to i32
  %112 = xor i32 %111, -1
  %113 = icmp slt i32 %105, %101
  %114 = zext i1 %113 to i32
  %115 = xor i32 %114, -1
  %116 = zext i32 %1 to i64
  %117 = shl nuw i64 1, %116
  %118 = and i64 %117, %15
  %119 = icmp eq i64 %118, 0
  br i1 %119, label %159, label %120

120:                                              ; preds = %97
  %121 = and i32 %99, %107
  %122 = xor i32 %107, -1
  %123 = and i32 %103, %122
  %124 = or i32 %121, %123
  %125 = and i32 %101, %109
  %126 = xor i32 %109, -1
  %127 = and i32 %105, %126
  %128 = or i32 %125, %127
  %129 = and i32 %103, %112
  %130 = and i32 %99, %111
  %131 = or i32 %129, %130
  %132 = and i32 %105, %115
  %133 = and i32 %101, %114
  %134 = or i32 %132, %133
  %135 = icmp slt i32 %124, %128
  %136 = zext i1 %135 to i32
  %137 = icmp slt i32 %128, %124
  %138 = zext i1 %137 to i32
  %139 = xor i32 %138, -1
  %140 = icmp slt i32 %131, %134
  %141 = zext i1 %140 to i32
  %142 = icmp slt i32 %134, %131
  %143 = zext i1 %142 to i32
  %144 = xor i32 %143, -1
  %145 = and i32 %124, %136
  %146 = xor i32 %136, -1
  %147 = and i32 %128, %146
  %148 = or i32 %145, %147
  store i32 %148, i32 addrspace(1)* %98, align 16, !tbaa !7
  %149 = and i32 %128, %139
  %150 = and i32 %124, %138
  %151 = or i32 %149, %150
  store i32 %151, i32 addrspace(1)* %100, align 4, !tbaa !7
  %152 = and i32 %131, %141
  %153 = xor i32 %141, -1
  %154 = and i32 %134, %153
  %155 = or i32 %152, %154
  store i32 %155, i32 addrspace(1)* %102, align 8, !tbaa !7
  %156 = and i32 %134, %144
  %157 = and i32 %131, %143
  %158 = or i32 %156, %157
  store i32 %158, i32 addrspace(1)* %104, align 4, !tbaa !7
  br label %325

159:                                              ; preds = %97
  %160 = xor i32 %107, -1
  %161 = and i32 %99, %160
  %162 = and i32 %103, %107
  %163 = or i32 %161, %162
  %164 = xor i32 %109, -1
  %165 = and i32 %101, %164
  %166 = and i32 %105, %109
  %167 = or i32 %165, %166
  %168 = and i32 %103, %111
  %169 = and i32 %99, %112
  %170 = or i32 %168, %169
  %171 = and i32 %105, %114
  %172 = and i32 %101, %115
  %173 = or i32 %171, %172
  %174 = icmp slt i32 %163, %167
  %175 = zext i1 %174 to i32
  %176 = icmp slt i32 %167, %163
  %177 = zext i1 %176 to i32
  %178 = xor i32 %177, -1
  %179 = icmp slt i32 %170, %173
  %180 = zext i1 %179 to i32
  %181 = icmp slt i32 %173, %170
  %182 = zext i1 %181 to i32
  %183 = xor i32 %182, -1
  %184 = xor i32 %175, -1
  %185 = and i32 %163, %184
  %186 = and i32 %167, %175
  %187 = or i32 %185, %186
  store i32 %187, i32 addrspace(1)* %98, align 16, !tbaa !7
  %188 = and i32 %167, %177
  %189 = and i32 %163, %178
  %190 = or i32 %188, %189
  store i32 %190, i32 addrspace(1)* %100, align 4, !tbaa !7
  %191 = xor i32 %180, -1
  %192 = and i32 %170, %191
  %193 = and i32 %173, %180
  %194 = or i32 %192, %193
  store i32 %194, i32 addrspace(1)* %102, align 8, !tbaa !7
  %195 = and i32 %173, %182
  %196 = and i32 %170, %183
  %197 = or i32 %195, %196
  store i32 %197, i32 addrspace(1)* %104, align 4, !tbaa !7
  br label %325

198:                                              ; preds = %4
  %199 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %15, i32 0, i32 0, i32 0, i64 0
  %200 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %15, i32 0, i32 0, i32 0, i64 1
  %201 = bitcast i32 addrspace(1)* %199 to <2 x i32> addrspace(1)*
  %202 = load <2 x i32>, <2 x i32> addrspace(1)* %201, align 16
  %203 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %15, i32 0, i32 0, i32 0, i64 2
  %204 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %15, i32 0, i32 0, i32 0, i64 3
  %205 = bitcast i32 addrspace(1)* %203 to <2 x i32> addrspace(1)*
  %206 = load <2 x i32>, <2 x i32> addrspace(1)* %205, align 8
  %207 = extractelement <2 x i32> %202, i64 0
  %208 = extractelement <2 x i32> %202, i64 1
  %209 = icmp slt i32 %207, %208
  %210 = zext i1 %209 to i32
  %211 = icmp slt i32 %208, %207
  %212 = zext i1 %211 to i32
  %213 = xor i32 %212, -1
  %214 = extractelement <2 x i32> %206, i64 0
  %215 = extractelement <2 x i32> %206, i64 1
  %216 = icmp slt i32 %214, %215
  %217 = zext i1 %216 to i32
  %218 = xor i32 %217, -1
  %219 = icmp slt i32 %215, %214
  %220 = zext i1 %219 to i32
  %221 = xor i32 %210, -1
  %222 = and i32 %207, %221
  %223 = and i32 %208, %210
  %224 = or i32 %222, %223
  %225 = and i32 %208, %212
  %226 = and i32 %207, %213
  %227 = or i32 %225, %226
  %228 = and i32 %214, %217
  %229 = and i32 %215, %218
  %230 = or i32 %228, %229
  %231 = xor i32 %220, -1
  %232 = and i32 %215, %231
  %233 = and i32 %214, %220
  %234 = or i32 %232, %233
  %235 = icmp slt i32 %224, %230
  %236 = zext i1 %235 to i32
  %237 = icmp slt i32 %227, %234
  %238 = zext i1 %237 to i32
  %239 = icmp slt i32 %230, %224
  %240 = zext i1 %239 to i32
  %241 = xor i32 %240, -1
  %242 = icmp slt i32 %234, %227
  %243 = zext i1 %242 to i32
  %244 = xor i32 %243, -1
  %245 = and i64 %15, 1
  %246 = icmp eq i64 %245, 0
  br i1 %246, label %286, label %247

247:                                              ; preds = %198
  %248 = and i32 %224, %236
  %249 = xor i32 %236, -1
  %250 = and i32 %230, %249
  %251 = or i32 %248, %250
  %252 = and i32 %227, %238
  %253 = xor i32 %238, -1
  %254 = and i32 %234, %253
  %255 = or i32 %252, %254
  %256 = and i32 %230, %241
  %257 = and i32 %224, %240
  %258 = or i32 %256, %257
  %259 = and i32 %234, %244
  %260 = and i32 %227, %243
  %261 = or i32 %259, %260
  %262 = icmp slt i32 %251, %255
  %263 = zext i1 %262 to i32
  %264 = icmp slt i32 %255, %251
  %265 = zext i1 %264 to i32
  %266 = xor i32 %265, -1
  %267 = icmp slt i32 %258, %261
  %268 = zext i1 %267 to i32
  %269 = icmp slt i32 %261, %258
  %270 = zext i1 %269 to i32
  %271 = xor i32 %270, -1
  %272 = and i32 %251, %263
  %273 = xor i32 %263, -1
  %274 = and i32 %255, %273
  %275 = or i32 %272, %274
  store i32 %275, i32 addrspace(1)* %199, align 16, !tbaa !7
  %276 = and i32 %255, %266
  %277 = and i32 %251, %265
  %278 = or i32 %276, %277
  store i32 %278, i32 addrspace(1)* %200, align 4, !tbaa !7
  %279 = and i32 %258, %268
  %280 = xor i32 %268, -1
  %281 = and i32 %261, %280
  %282 = or i32 %279, %281
  store i32 %282, i32 addrspace(1)* %203, align 8, !tbaa !7
  %283 = and i32 %261, %271
  %284 = and i32 %258, %270
  %285 = or i32 %283, %284
  store i32 %285, i32 addrspace(1)* %204, align 4, !tbaa !7
  br label %325

286:                                              ; preds = %198
  %287 = xor i32 %236, -1
  %288 = and i32 %224, %287
  %289 = and i32 %230, %236
  %290 = or i32 %288, %289
  %291 = xor i32 %238, -1
  %292 = and i32 %227, %291
  %293 = and i32 %234, %238
  %294 = or i32 %292, %293
  %295 = and i32 %230, %240
  %296 = and i32 %224, %241
  %297 = or i32 %295, %296
  %298 = and i32 %234, %243
  %299 = and i32 %227, %244
  %300 = or i32 %298, %299
  %301 = icmp slt i32 %290, %294
  %302 = zext i1 %301 to i32
  %303 = icmp slt i32 %294, %290
  %304 = zext i1 %303 to i32
  %305 = xor i32 %304, -1
  %306 = icmp slt i32 %297, %300
  %307 = zext i1 %306 to i32
  %308 = icmp slt i32 %300, %297
  %309 = zext i1 %308 to i32
  %310 = xor i32 %309, -1
  %311 = xor i32 %302, -1
  %312 = and i32 %290, %311
  %313 = and i32 %294, %302
  %314 = or i32 %312, %313
  store i32 %314, i32 addrspace(1)* %199, align 16, !tbaa !7
  %315 = and i32 %294, %304
  %316 = and i32 %290, %305
  %317 = or i32 %315, %316
  store i32 %317, i32 addrspace(1)* %200, align 4, !tbaa !7
  %318 = xor i32 %307, -1
  %319 = and i32 %297, %318
  %320 = and i32 %300, %307
  %321 = or i32 %319, %320
  store i32 %321, i32 addrspace(1)* %203, align 8, !tbaa !7
  %322 = and i32 %300, %309
  %323 = and i32 %297, %310
  %324 = or i32 %322, %323
  store i32 %324, i32 addrspace(1)* %204, align 4, !tbaa !7
  br label %325

325:                                              ; preds = %247, %286, %87, %92, %159, %120
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
