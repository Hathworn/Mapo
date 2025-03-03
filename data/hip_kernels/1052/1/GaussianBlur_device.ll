; ModuleID = '../data/hip_kernels/1052/1/main.cu'
source_filename = "../data/hip_kernels/1052/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12GaussianBlurPjS_S_ijPiS0_S0_(i32 addrspace(1)* readonly %0, i32 addrspace(1)* readonly %1, i32 addrspace(1)* readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %3
  br i1 %18, label %19, label %618

19:                                               ; preds = %8
  %20 = icmp ult i32 %17, %4
  br i1 %20, label %21, label %189

21:                                               ; preds = %19
  %22 = icmp eq i32 %17, 0
  br i1 %22, label %23, label %66

23:                                               ; preds = %21
  %24 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = shl i32 %24, 2
  %26 = zext i32 %4 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = add i32 %4, 1
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 1
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = add i32 %34, %28
  %36 = shl i32 %35, 1
  %37 = add i32 %32, %25
  %38 = add i32 %37, %36
  %39 = udiv i32 %38, 9
  store i32 %39, i32 addrspace(1)* %5, align 4, !tbaa !7
  %40 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %41 = shl i32 %40, 2
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 1
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7
  %48 = add i32 %47, %43
  %49 = shl i32 %48, 1
  %50 = add i32 %45, %41
  %51 = add i32 %50, %49
  %52 = udiv i32 %51, 9
  store i32 %52, i32 addrspace(1)* %6, align 4, !tbaa !7
  %53 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !7
  %54 = shl i32 %53, 2
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %26
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 1
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7
  %61 = add i32 %60, %56
  %62 = shl i32 %61, 1
  %63 = add i32 %58, %54
  %64 = add i32 %63, %62
  %65 = udiv i32 %64, 9
  store i32 %65, i32 addrspace(1)* %7, align 4, !tbaa !7
  br label %618

66:                                               ; preds = %21
  %67 = add i32 %4, -1
  %68 = icmp eq i32 %17, %67
  %69 = sext i32 %17 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7
  %72 = shl i32 %71, 2
  %73 = add i32 %17, %4
  br i1 %68, label %74, label %119

74:                                               ; preds = %66
  %75 = add i32 %73, -1
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = zext i32 %73 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = add nsw i32 %17, -1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = add i32 %85, %81
  %87 = shl i32 %86, 1
  %88 = add i32 %72, %78
  %89 = add i32 %88, %87
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %69
  store i32 %89, i32 addrspace(1)* %90, align 4, !tbaa !7
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7
  %93 = shl i32 %92, 2
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %76
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %83
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !7
  %100 = add i32 %99, %97
  %101 = shl i32 %100, 1
  %102 = add i32 %93, %95
  %103 = add i32 %102, %101
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %69
  store i32 %103, i32 addrspace(1)* %104, align 4, !tbaa !7
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %69
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7
  %107 = shl i32 %106, 2
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %76
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !7
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %79
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %83
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7
  %114 = add i32 %113, %111
  %115 = shl i32 %114, 1
  %116 = add i32 %107, %109
  %117 = add i32 %116, %115
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %69
  store i32 %117, i32 addrspace(1)* %118, align 4, !tbaa !7
  br label %618

119:                                              ; preds = %66
  %120 = zext i32 %73 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = add i32 %73, 1
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = add nuw nsw i32 %17, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = add i32 %73, -1
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %132
  %134 = load i32, i32 addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = add nsw i32 %17, -1
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = add i32 %130, %122
  %140 = add i32 %139, %138
  %141 = shl i32 %140, 1
  %142 = add i32 %126, %72
  %143 = add i32 %142, %134
  %144 = add i32 %143, %141
  %145 = udiv i32 %144, 12
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %69
  store i32 %145, i32 addrspace(1)* %146, align 4, !tbaa !7
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %69
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7
  %149 = shl i32 %148, 2
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %120
  %151 = load i32, i32 addrspace(1)* %150, align 4, !tbaa !7
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %124
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !7
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %128
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !7
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %132
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !7
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %136
  %159 = load i32, i32 addrspace(1)* %158, align 4, !tbaa !7
  %160 = add i32 %155, %151
  %161 = add i32 %160, %159
  %162 = shl i32 %161, 1
  %163 = add i32 %153, %149
  %164 = add i32 %163, %157
  %165 = add i32 %164, %162
  %166 = udiv i32 %165, 12
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %69
  store i32 %166, i32 addrspace(1)* %167, align 4, !tbaa !7
  %168 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  %169 = load i32, i32 addrspace(1)* %168, align 4, !tbaa !7
  %170 = shl i32 %169, 2
  %171 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %120
  %172 = load i32, i32 addrspace(1)* %171, align 4, !tbaa !7
  %173 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %124
  %174 = load i32, i32 addrspace(1)* %173, align 4, !tbaa !7
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %128
  %176 = load i32, i32 addrspace(1)* %175, align 4, !tbaa !7
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %132
  %178 = load i32, i32 addrspace(1)* %177, align 4, !tbaa !7
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %136
  %180 = load i32, i32 addrspace(1)* %179, align 4, !tbaa !7
  %181 = add i32 %176, %172
  %182 = add i32 %181, %180
  %183 = shl i32 %182, 1
  %184 = add i32 %174, %170
  %185 = add i32 %184, %178
  %186 = add i32 %185, %183
  %187 = udiv i32 %186, 12
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %69
  store i32 %187, i32 addrspace(1)* %188, align 4, !tbaa !7
  br label %618

189:                                              ; preds = %19
  %190 = sub i32 %3, %4
  %191 = icmp ult i32 %17, %190
  br i1 %191, label %354, label %192

192:                                              ; preds = %189
  %193 = icmp eq i32 %17, %190
  br i1 %193, label %194, label %247

194:                                              ; preds = %192
  %195 = sext i32 %17 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %195
  %197 = load i32, i32 addrspace(1)* %196, align 4, !tbaa !7, !amdgpu.noclobber !5
  %198 = shl i32 %197, 2
  %199 = add nsw i32 %17, 1
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %200
  %202 = load i32, i32 addrspace(1)* %201, align 4, !tbaa !7, !amdgpu.noclobber !5
  %203 = sub i32 %17, %4
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %204
  %206 = load i32, i32 addrspace(1)* %205, align 4, !tbaa !7, !amdgpu.noclobber !5
  %207 = add i32 %203, 1
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %208
  %210 = load i32, i32 addrspace(1)* %209, align 4, !tbaa !7, !amdgpu.noclobber !5
  %211 = add i32 %206, %202
  %212 = shl i32 %211, 1
  %213 = add i32 %210, %198
  %214 = add i32 %213, %212
  %215 = udiv i32 %214, 9
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %195
  store i32 %215, i32 addrspace(1)* %216, align 4, !tbaa !7
  %217 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %195
  %218 = load i32, i32 addrspace(1)* %217, align 4, !tbaa !7
  %219 = shl i32 %218, 2
  %220 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %200
  %221 = load i32, i32 addrspace(1)* %220, align 4, !tbaa !7
  %222 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %204
  %223 = load i32, i32 addrspace(1)* %222, align 4, !tbaa !7
  %224 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %208
  %225 = load i32, i32 addrspace(1)* %224, align 4, !tbaa !7
  %226 = add i32 %223, %221
  %227 = shl i32 %226, 1
  %228 = add i32 %225, %219
  %229 = add i32 %228, %227
  %230 = udiv i32 %229, 9
  %231 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %195
  store i32 %230, i32 addrspace(1)* %231, align 4, !tbaa !7
  %232 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %195
  %233 = load i32, i32 addrspace(1)* %232, align 4, !tbaa !7
  %234 = shl i32 %233, 2
  %235 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %200
  %236 = load i32, i32 addrspace(1)* %235, align 4, !tbaa !7
  %237 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %204
  %238 = load i32, i32 addrspace(1)* %237, align 4, !tbaa !7
  %239 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %208
  %240 = load i32, i32 addrspace(1)* %239, align 4, !tbaa !7
  %241 = add i32 %238, %236
  %242 = shl i32 %241, 1
  %243 = add i32 %240, %234
  %244 = add i32 %243, %242
  %245 = udiv i32 %244, 9
  %246 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %195
  store i32 %245, i32 addrspace(1)* %246, align 4, !tbaa !7
  br label %618

247:                                              ; preds = %192
  %248 = add nsw i32 %3, -1
  %249 = icmp eq i32 %17, %248
  %250 = sext i32 %17 to i64
  %251 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %250
  %252 = load i32, i32 addrspace(1)* %251, align 4, !tbaa !7
  %253 = shl i32 %252, 2
  %254 = add nsw i32 %17, -1
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %255
  %257 = load i32, i32 addrspace(1)* %256, align 4, !tbaa !7
  %258 = sub i32 %17, %4
  %259 = add i32 %258, -1
  %260 = zext i32 %259 to i64
  %261 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %260
  %262 = load i32, i32 addrspace(1)* %261, align 4, !tbaa !7
  %263 = zext i32 %258 to i64
  %264 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %263
  %265 = load i32, i32 addrspace(1)* %264, align 4, !tbaa !7
  br i1 %249, label %266, label %303

266:                                              ; preds = %247
  %267 = add i32 %265, %257
  %268 = shl i32 %267, 1
  %269 = add i32 %262, %253
  %270 = add i32 %269, %268
  %271 = udiv i32 %270, 9
  %272 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %250
  store i32 %271, i32 addrspace(1)* %272, align 4, !tbaa !7
  %273 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %250
  %274 = load i32, i32 addrspace(1)* %273, align 4, !tbaa !7
  %275 = shl i32 %274, 2
  %276 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %255
  %277 = load i32, i32 addrspace(1)* %276, align 4, !tbaa !7
  %278 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %260
  %279 = load i32, i32 addrspace(1)* %278, align 4, !tbaa !7
  %280 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %263
  %281 = load i32, i32 addrspace(1)* %280, align 4, !tbaa !7
  %282 = add i32 %281, %277
  %283 = shl i32 %282, 1
  %284 = add i32 %279, %275
  %285 = add i32 %284, %283
  %286 = udiv i32 %285, 9
  %287 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %250
  store i32 %286, i32 addrspace(1)* %287, align 4, !tbaa !7
  %288 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %250
  %289 = load i32, i32 addrspace(1)* %288, align 4, !tbaa !7
  %290 = shl i32 %289, 2
  %291 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %255
  %292 = load i32, i32 addrspace(1)* %291, align 4, !tbaa !7
  %293 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %260
  %294 = load i32, i32 addrspace(1)* %293, align 4, !tbaa !7
  %295 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %263
  %296 = load i32, i32 addrspace(1)* %295, align 4, !tbaa !7
  %297 = add i32 %296, %292
  %298 = shl i32 %297, 1
  %299 = add i32 %294, %290
  %300 = add i32 %299, %298
  %301 = udiv i32 %300, 9
  %302 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %250
  store i32 %301, i32 addrspace(1)* %302, align 4, !tbaa !7
  br label %618

303:                                              ; preds = %247
  %304 = add nsw i32 %17, 1
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %305
  %307 = load i32, i32 addrspace(1)* %306, align 4, !tbaa !7, !amdgpu.noclobber !5
  %308 = add i32 %265, %257
  %309 = add i32 %308, %307
  %310 = shl i32 %309, 1
  %311 = add i32 %262, %253
  %312 = add i32 %311, %265
  %313 = add i32 %312, %310
  %314 = udiv i32 %313, 12
  %315 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %250
  store i32 %314, i32 addrspace(1)* %315, align 4, !tbaa !7
  %316 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %250
  %317 = load i32, i32 addrspace(1)* %316, align 4, !tbaa !7
  %318 = shl i32 %317, 2
  %319 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %255
  %320 = load i32, i32 addrspace(1)* %319, align 4, !tbaa !7
  %321 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %260
  %322 = load i32, i32 addrspace(1)* %321, align 4, !tbaa !7
  %323 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %263
  %324 = load i32, i32 addrspace(1)* %323, align 4, !tbaa !7
  %325 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %305
  %326 = load i32, i32 addrspace(1)* %325, align 4, !tbaa !7
  %327 = add i32 %324, %320
  %328 = add i32 %327, %326
  %329 = shl i32 %328, 1
  %330 = add i32 %322, %318
  %331 = add i32 %330, %324
  %332 = add i32 %331, %329
  %333 = udiv i32 %332, 12
  %334 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %250
  store i32 %333, i32 addrspace(1)* %334, align 4, !tbaa !7
  %335 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %250
  %336 = load i32, i32 addrspace(1)* %335, align 4, !tbaa !7
  %337 = shl i32 %336, 2
  %338 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %255
  %339 = load i32, i32 addrspace(1)* %338, align 4, !tbaa !7
  %340 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %260
  %341 = load i32, i32 addrspace(1)* %340, align 4, !tbaa !7
  %342 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %263
  %343 = load i32, i32 addrspace(1)* %342, align 4, !tbaa !7
  %344 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %305
  %345 = load i32, i32 addrspace(1)* %344, align 4, !tbaa !7
  %346 = add i32 %343, %339
  %347 = add i32 %346, %345
  %348 = shl i32 %347, 1
  %349 = add i32 %341, %337
  %350 = add i32 %349, %343
  %351 = add i32 %350, %348
  %352 = udiv i32 %351, 12
  %353 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %250
  store i32 %352, i32 addrspace(1)* %353, align 4, !tbaa !7
  br label %618

354:                                              ; preds = %189
  %355 = urem i32 %17, %4
  %356 = icmp eq i32 %355, 0
  br i1 %356, label %357, label %432

357:                                              ; preds = %354
  %358 = sext i32 %17 to i64
  %359 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %358
  %360 = load i32, i32 addrspace(1)* %359, align 4, !tbaa !7, !amdgpu.noclobber !5
  %361 = shl i32 %360, 2
  %362 = add i32 %17, %4
  %363 = zext i32 %362 to i64
  %364 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %363
  %365 = load i32, i32 addrspace(1)* %364, align 4, !tbaa !7, !amdgpu.noclobber !5
  %366 = add i32 %362, 1
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %367
  %369 = load i32, i32 addrspace(1)* %368, align 4, !tbaa !7, !amdgpu.noclobber !5
  %370 = add nuw nsw i32 %17, 1
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %371
  %373 = load i32, i32 addrspace(1)* %372, align 4, !tbaa !7, !amdgpu.noclobber !5
  %374 = sub i32 %17, %4
  %375 = add i32 %374, 1
  %376 = zext i32 %375 to i64
  %377 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %376
  %378 = load i32, i32 addrspace(1)* %377, align 4, !tbaa !7, !amdgpu.noclobber !5
  %379 = zext i32 %374 to i64
  %380 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %379
  %381 = load i32, i32 addrspace(1)* %380, align 4, !tbaa !7, !amdgpu.noclobber !5
  %382 = add i32 %373, %365
  %383 = shl i32 %382, 1
  %384 = add i32 %369, %361
  %385 = add i32 %384, %378
  %386 = add i32 %385, %381
  %387 = add i32 %386, %383
  %388 = udiv i32 %387, 12
  %389 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %358
  store i32 %388, i32 addrspace(1)* %389, align 4, !tbaa !7
  %390 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %358
  %391 = load i32, i32 addrspace(1)* %390, align 4, !tbaa !7
  %392 = shl i32 %391, 2
  %393 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %363
  %394 = load i32, i32 addrspace(1)* %393, align 4, !tbaa !7
  %395 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %367
  %396 = load i32, i32 addrspace(1)* %395, align 4, !tbaa !7
  %397 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %371
  %398 = load i32, i32 addrspace(1)* %397, align 4, !tbaa !7
  %399 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %376
  %400 = load i32, i32 addrspace(1)* %399, align 4, !tbaa !7
  %401 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %379
  %402 = load i32, i32 addrspace(1)* %401, align 4, !tbaa !7
  %403 = add i32 %398, %394
  %404 = shl i32 %403, 1
  %405 = add i32 %396, %392
  %406 = add i32 %405, %400
  %407 = add i32 %406, %402
  %408 = add i32 %407, %404
  %409 = udiv i32 %408, 12
  %410 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %358
  store i32 %409, i32 addrspace(1)* %410, align 4, !tbaa !7
  %411 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %358
  %412 = load i32, i32 addrspace(1)* %411, align 4, !tbaa !7
  %413 = shl i32 %412, 2
  %414 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %363
  %415 = load i32, i32 addrspace(1)* %414, align 4, !tbaa !7
  %416 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %367
  %417 = load i32, i32 addrspace(1)* %416, align 4, !tbaa !7
  %418 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %371
  %419 = load i32, i32 addrspace(1)* %418, align 4, !tbaa !7
  %420 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %376
  %421 = load i32, i32 addrspace(1)* %420, align 4, !tbaa !7
  %422 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %379
  %423 = load i32, i32 addrspace(1)* %422, align 4, !tbaa !7
  %424 = add i32 %419, %415
  %425 = shl i32 %424, 1
  %426 = add i32 %417, %413
  %427 = add i32 %426, %421
  %428 = add i32 %427, %423
  %429 = add i32 %428, %425
  %430 = udiv i32 %429, 12
  %431 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %358
  store i32 %430, i32 addrspace(1)* %431, align 4, !tbaa !7
  br label %618

432:                                              ; preds = %354
  %433 = add i32 %4, -1
  %434 = icmp eq i32 %355, %433
  br i1 %434, label %435, label %510

435:                                              ; preds = %432
  %436 = sext i32 %17 to i64
  %437 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %436
  %438 = load i32, i32 addrspace(1)* %437, align 4, !tbaa !7, !amdgpu.noclobber !5
  %439 = shl i32 %438, 2
  %440 = add i32 %17, %4
  %441 = zext i32 %440 to i64
  %442 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %441
  %443 = load i32, i32 addrspace(1)* %442, align 4, !tbaa !7, !amdgpu.noclobber !5
  %444 = add i32 %440, -1
  %445 = zext i32 %444 to i64
  %446 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %445
  %447 = load i32, i32 addrspace(1)* %446, align 4, !tbaa !7, !amdgpu.noclobber !5
  %448 = add nsw i32 %17, -1
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %449
  %451 = load i32, i32 addrspace(1)* %450, align 4, !tbaa !7, !amdgpu.noclobber !5
  %452 = sub i32 %17, %4
  %453 = add i32 %452, -1
  %454 = zext i32 %453 to i64
  %455 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %454
  %456 = load i32, i32 addrspace(1)* %455, align 4, !tbaa !7, !amdgpu.noclobber !5
  %457 = zext i32 %452 to i64
  %458 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %457
  %459 = load i32, i32 addrspace(1)* %458, align 4, !tbaa !7, !amdgpu.noclobber !5
  %460 = add i32 %451, %443
  %461 = add i32 %460, %459
  %462 = shl i32 %461, 1
  %463 = add i32 %447, %439
  %464 = add i32 %463, %456
  %465 = add i32 %464, %462
  %466 = udiv i32 %465, 12
  %467 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %436
  store i32 %466, i32 addrspace(1)* %467, align 4, !tbaa !7
  %468 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %436
  %469 = load i32, i32 addrspace(1)* %468, align 4, !tbaa !7
  %470 = shl i32 %469, 2
  %471 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %441
  %472 = load i32, i32 addrspace(1)* %471, align 4, !tbaa !7
  %473 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %445
  %474 = load i32, i32 addrspace(1)* %473, align 4, !tbaa !7
  %475 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %449
  %476 = load i32, i32 addrspace(1)* %475, align 4, !tbaa !7
  %477 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %454
  %478 = load i32, i32 addrspace(1)* %477, align 4, !tbaa !7
  %479 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %457
  %480 = load i32, i32 addrspace(1)* %479, align 4, !tbaa !7
  %481 = add i32 %476, %472
  %482 = add i32 %481, %480
  %483 = shl i32 %482, 1
  %484 = add i32 %474, %470
  %485 = add i32 %484, %478
  %486 = add i32 %485, %483
  %487 = udiv i32 %486, 12
  %488 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %436
  store i32 %487, i32 addrspace(1)* %488, align 4, !tbaa !7
  %489 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %436
  %490 = load i32, i32 addrspace(1)* %489, align 4, !tbaa !7
  %491 = shl i32 %490, 2
  %492 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %441
  %493 = load i32, i32 addrspace(1)* %492, align 4, !tbaa !7
  %494 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %445
  %495 = load i32, i32 addrspace(1)* %494, align 4, !tbaa !7
  %496 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %449
  %497 = load i32, i32 addrspace(1)* %496, align 4, !tbaa !7
  %498 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %454
  %499 = load i32, i32 addrspace(1)* %498, align 4, !tbaa !7
  %500 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %457
  %501 = load i32, i32 addrspace(1)* %500, align 4, !tbaa !7
  %502 = add i32 %497, %493
  %503 = add i32 %502, %501
  %504 = shl i32 %503, 1
  %505 = add i32 %495, %491
  %506 = add i32 %505, %499
  %507 = add i32 %506, %504
  %508 = udiv i32 %507, 12
  %509 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %436
  store i32 %508, i32 addrspace(1)* %509, align 4, !tbaa !7
  br label %618

510:                                              ; preds = %432
  %511 = sub i32 %17, %4
  %512 = add i32 %511, -1
  %513 = add i32 %511, 1
  %514 = add nsw i32 %17, -1
  %515 = add nuw nsw i32 %17, 1
  %516 = add i32 %17, %4
  %517 = add i32 %516, -1
  %518 = add i32 %516, 1
  %519 = sext i32 %512 to i64
  %520 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %519
  %521 = load i32, i32 addrspace(1)* %520, align 4, !tbaa !7, !amdgpu.noclobber !5
  %522 = sext i32 %511 to i64
  %523 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %522
  %524 = load i32, i32 addrspace(1)* %523, align 4, !tbaa !7, !amdgpu.noclobber !5
  %525 = sext i32 %513 to i64
  %526 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %525
  %527 = load i32, i32 addrspace(1)* %526, align 4, !tbaa !7, !amdgpu.noclobber !5
  %528 = sext i32 %514 to i64
  %529 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %528
  %530 = load i32, i32 addrspace(1)* %529, align 4, !tbaa !7, !amdgpu.noclobber !5
  %531 = sext i32 %17 to i64
  %532 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %531
  %533 = load i32, i32 addrspace(1)* %532, align 4, !tbaa !7, !amdgpu.noclobber !5
  %534 = shl i32 %533, 2
  %535 = sext i32 %515 to i64
  %536 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %535
  %537 = load i32, i32 addrspace(1)* %536, align 4, !tbaa !7, !amdgpu.noclobber !5
  %538 = sext i32 %517 to i64
  %539 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %538
  %540 = load i32, i32 addrspace(1)* %539, align 4, !tbaa !7, !amdgpu.noclobber !5
  %541 = sext i32 %516 to i64
  %542 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %541
  %543 = load i32, i32 addrspace(1)* %542, align 4, !tbaa !7, !amdgpu.noclobber !5
  %544 = sext i32 %518 to i64
  %545 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %544
  %546 = load i32, i32 addrspace(1)* %545, align 4, !tbaa !7, !amdgpu.noclobber !5
  %547 = add i32 %530, %524
  %548 = add i32 %547, %537
  %549 = add i32 %548, %543
  %550 = shl i32 %549, 1
  %551 = add i32 %527, %521
  %552 = add i32 %551, %534
  %553 = add i32 %552, %540
  %554 = add i32 %553, %546
  %555 = add i32 %554, %550
  %556 = lshr i32 %555, 4
  %557 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %531
  store i32 %556, i32 addrspace(1)* %557, align 4, !tbaa !7
  %558 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %519
  %559 = load i32, i32 addrspace(1)* %558, align 4, !tbaa !7
  %560 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %522
  %561 = load i32, i32 addrspace(1)* %560, align 4, !tbaa !7
  %562 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %525
  %563 = load i32, i32 addrspace(1)* %562, align 4, !tbaa !7
  %564 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %528
  %565 = load i32, i32 addrspace(1)* %564, align 4, !tbaa !7
  %566 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %531
  %567 = load i32, i32 addrspace(1)* %566, align 4, !tbaa !7
  %568 = shl i32 %567, 2
  %569 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %535
  %570 = load i32, i32 addrspace(1)* %569, align 4, !tbaa !7
  %571 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %538
  %572 = load i32, i32 addrspace(1)* %571, align 4, !tbaa !7
  %573 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %541
  %574 = load i32, i32 addrspace(1)* %573, align 4, !tbaa !7
  %575 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %544
  %576 = load i32, i32 addrspace(1)* %575, align 4, !tbaa !7
  %577 = add i32 %565, %561
  %578 = add i32 %577, %570
  %579 = add i32 %578, %574
  %580 = shl i32 %579, 1
  %581 = add i32 %563, %559
  %582 = add i32 %581, %568
  %583 = add i32 %582, %572
  %584 = add i32 %583, %576
  %585 = add i32 %584, %580
  %586 = lshr i32 %585, 4
  %587 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %531
  store i32 %586, i32 addrspace(1)* %587, align 4, !tbaa !7
  %588 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %519
  %589 = load i32, i32 addrspace(1)* %588, align 4, !tbaa !7
  %590 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %522
  %591 = load i32, i32 addrspace(1)* %590, align 4, !tbaa !7
  %592 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %525
  %593 = load i32, i32 addrspace(1)* %592, align 4, !tbaa !7
  %594 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %528
  %595 = load i32, i32 addrspace(1)* %594, align 4, !tbaa !7
  %596 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %531
  %597 = load i32, i32 addrspace(1)* %596, align 4, !tbaa !7
  %598 = shl i32 %597, 2
  %599 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %535
  %600 = load i32, i32 addrspace(1)* %599, align 4, !tbaa !7
  %601 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %538
  %602 = load i32, i32 addrspace(1)* %601, align 4, !tbaa !7
  %603 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %541
  %604 = load i32, i32 addrspace(1)* %603, align 4, !tbaa !7
  %605 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %544
  %606 = load i32, i32 addrspace(1)* %605, align 4, !tbaa !7
  %607 = add i32 %595, %591
  %608 = add i32 %607, %600
  %609 = add i32 %608, %604
  %610 = shl i32 %609, 1
  %611 = add i32 %593, %589
  %612 = add i32 %611, %598
  %613 = add i32 %612, %602
  %614 = add i32 %613, %606
  %615 = add i32 %614, %610
  %616 = lshr i32 %615, 4
  %617 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %531
  store i32 %616, i32 addrspace(1)* %617, align 4, !tbaa !7
  br label %618

618:                                              ; preds = %23, %74, %119, %194, %266, %303, %357, %435, %510, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
