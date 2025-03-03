; ModuleID = '../data/hip_kernels/867/2/main.cu'
source_filename = "../data/hip_kernels/867/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6smoothPfS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %2, %3
  %4 = phi i32 [ 0, %2 ], [ %635, %3 ]
  %5 = mul nuw nsw i32 %4, 70
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds float, float addrspace(1)* %0, i64 %6
  %8 = load float, float addrspace(1)* %7, align 4, !tbaa !4
  %9 = fmul contract float %8, 0x3FE99999A0000000
  %10 = add nuw nsw i32 %5, 9
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !4
  %14 = fmul contract float %13, 0x3FB99999A0000000
  %15 = fadd contract float %9, %14
  %16 = or i32 %5, 1
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !4
  %20 = fmul contract float %19, 0x3FB99999A0000000
  %21 = fadd contract float %15, %20
  %22 = fmul contract float %19, 0x3FE99999A0000000
  %23 = fmul contract float %8, 0x3FB99999A0000000
  %24 = fadd contract float %22, %23
  %25 = add nuw nsw i32 %5, 2
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !4
  %29 = fmul contract float %28, 0x3FB99999A0000000
  %30 = fadd contract float %24, %29
  %31 = fmul contract float %28, 0x3FE99999A0000000
  %32 = fadd contract float %31, %20
  %33 = add nuw nsw i32 %5, 3
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !4
  %37 = fmul contract float %36, 0x3FB99999A0000000
  %38 = fadd contract float %32, %37
  %39 = fmul contract float %36, 0x3FE99999A0000000
  %40 = fadd contract float %39, %29
  %41 = add nuw nsw i32 %5, 4
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !4
  %45 = fmul contract float %44, 0x3FB99999A0000000
  %46 = fadd contract float %40, %45
  %47 = fmul contract float %44, 0x3FE99999A0000000
  %48 = fadd contract float %47, %37
  %49 = add nuw nsw i32 %5, 5
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !4
  %53 = fmul contract float %52, 0x3FB99999A0000000
  %54 = fadd contract float %48, %53
  %55 = fmul contract float %52, 0x3FE99999A0000000
  %56 = fadd contract float %55, %45
  %57 = add nuw nsw i32 %5, 6
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !4
  %61 = fmul contract float %60, 0x3FB99999A0000000
  %62 = fadd contract float %56, %61
  %63 = fmul contract float %60, 0x3FE99999A0000000
  %64 = fadd contract float %63, %53
  %65 = add nuw nsw i32 %5, 7
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !4
  %69 = fmul contract float %68, 0x3FB99999A0000000
  %70 = fadd contract float %64, %69
  %71 = fmul contract float %68, 0x3FE99999A0000000
  %72 = fadd contract float %71, %61
  %73 = add nuw nsw i32 %5, 8
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !4
  %77 = fmul contract float %76, 0x3FB99999A0000000
  %78 = fadd contract float %72, %77
  %79 = fmul contract float %76, 0x3FE99999A0000000
  %80 = fadd contract float %79, %69
  %81 = fadd contract float %80, %14
  %82 = fmul contract float %13, 0x3FE99999A0000000
  %83 = fadd contract float %82, %77
  %84 = fadd contract float %83, %23
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %6
  store float %21, float addrspace(1)* %85, align 4, !tbaa !4
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  store float %30, float addrspace(1)* %86, align 4, !tbaa !4
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %38, float addrspace(1)* %87, align 4, !tbaa !4
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  store float %46, float addrspace(1)* %88, align 4, !tbaa !4
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  store float %54, float addrspace(1)* %89, align 4, !tbaa !4
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  store float %62, float addrspace(1)* %90, align 4, !tbaa !4
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  store float %70, float addrspace(1)* %91, align 4, !tbaa !4
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  store float %78, float addrspace(1)* %92, align 4, !tbaa !4
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  store float %81, float addrspace(1)* %93, align 4, !tbaa !4
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %11
  store float %84, float addrspace(1)* %94, align 4, !tbaa !4
  %95 = add nuw nsw i32 %5, 10
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !4
  %99 = fmul contract float %98, 0x3FE99999A0000000
  %100 = add nuw nsw i32 %5, 19
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !4
  %104 = fmul contract float %103, 0x3FB99999A0000000
  %105 = fadd contract float %99, %104
  %106 = add nuw nsw i32 %5, 11
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !4
  %110 = fmul contract float %109, 0x3FB99999A0000000
  %111 = fadd contract float %105, %110
  %112 = fmul contract float %109, 0x3FE99999A0000000
  %113 = fmul contract float %98, 0x3FB99999A0000000
  %114 = fadd contract float %112, %113
  %115 = add nuw nsw i32 %5, 12
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !4
  %119 = fmul contract float %118, 0x3FB99999A0000000
  %120 = fadd contract float %114, %119
  %121 = fmul contract float %118, 0x3FE99999A0000000
  %122 = fadd contract float %121, %110
  %123 = add nuw nsw i32 %5, 13
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !4
  %127 = fmul contract float %126, 0x3FB99999A0000000
  %128 = fadd contract float %122, %127
  %129 = fmul contract float %126, 0x3FE99999A0000000
  %130 = fadd contract float %129, %119
  %131 = add nuw nsw i32 %5, 14
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !4
  %135 = fmul contract float %134, 0x3FB99999A0000000
  %136 = fadd contract float %130, %135
  %137 = fmul contract float %134, 0x3FE99999A0000000
  %138 = fadd contract float %137, %127
  %139 = add nuw nsw i32 %5, 15
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !4
  %143 = fmul contract float %142, 0x3FB99999A0000000
  %144 = fadd contract float %138, %143
  %145 = fmul contract float %142, 0x3FE99999A0000000
  %146 = fadd contract float %145, %135
  %147 = add nuw nsw i32 %5, 16
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !4
  %151 = fmul contract float %150, 0x3FB99999A0000000
  %152 = fadd contract float %146, %151
  %153 = fmul contract float %150, 0x3FE99999A0000000
  %154 = fadd contract float %153, %143
  %155 = add nuw nsw i32 %5, 17
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !4
  %159 = fmul contract float %158, 0x3FB99999A0000000
  %160 = fadd contract float %154, %159
  %161 = fmul contract float %158, 0x3FE99999A0000000
  %162 = fadd contract float %161, %151
  %163 = add nuw nsw i32 %5, 18
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !4
  %167 = fmul contract float %166, 0x3FB99999A0000000
  %168 = fadd contract float %162, %167
  %169 = fmul contract float %166, 0x3FE99999A0000000
  %170 = fadd contract float %169, %159
  %171 = fadd contract float %170, %104
  %172 = fmul contract float %103, 0x3FE99999A0000000
  %173 = fadd contract float %172, %167
  %174 = fadd contract float %173, %113
  %175 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  store float %111, float addrspace(1)* %175, align 4, !tbaa !4
  %176 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  store float %120, float addrspace(1)* %176, align 4, !tbaa !4
  %177 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  store float %128, float addrspace(1)* %177, align 4, !tbaa !4
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  store float %136, float addrspace(1)* %178, align 4, !tbaa !4
  %179 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  store float %144, float addrspace(1)* %179, align 4, !tbaa !4
  %180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %140
  store float %152, float addrspace(1)* %180, align 4, !tbaa !4
  %181 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  store float %160, float addrspace(1)* %181, align 4, !tbaa !4
  %182 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  store float %168, float addrspace(1)* %182, align 4, !tbaa !4
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  store float %171, float addrspace(1)* %183, align 4, !tbaa !4
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  store float %174, float addrspace(1)* %184, align 4, !tbaa !4
  %185 = add nuw nsw i32 %5, 20
  %186 = zext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %0, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !4
  %189 = fmul contract float %188, 0x3FE99999A0000000
  %190 = add nuw nsw i32 %5, 29
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %0, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !4
  %194 = fmul contract float %193, 0x3FB99999A0000000
  %195 = fadd contract float %189, %194
  %196 = add nuw nsw i32 %5, 21
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %0, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !4
  %200 = fmul contract float %199, 0x3FB99999A0000000
  %201 = fadd contract float %195, %200
  %202 = fmul contract float %199, 0x3FE99999A0000000
  %203 = fmul contract float %188, 0x3FB99999A0000000
  %204 = fadd contract float %202, %203
  %205 = add nuw nsw i32 %5, 22
  %206 = zext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %0, i64 %206
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !4
  %209 = fmul contract float %208, 0x3FB99999A0000000
  %210 = fadd contract float %204, %209
  %211 = fmul contract float %208, 0x3FE99999A0000000
  %212 = fadd contract float %211, %200
  %213 = add nuw nsw i32 %5, 23
  %214 = zext i32 %213 to i64
  %215 = getelementptr inbounds float, float addrspace(1)* %0, i64 %214
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !4
  %217 = fmul contract float %216, 0x3FB99999A0000000
  %218 = fadd contract float %212, %217
  %219 = fmul contract float %216, 0x3FE99999A0000000
  %220 = fadd contract float %219, %209
  %221 = add nuw nsw i32 %5, 24
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %0, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !4
  %225 = fmul contract float %224, 0x3FB99999A0000000
  %226 = fadd contract float %220, %225
  %227 = fmul contract float %224, 0x3FE99999A0000000
  %228 = fadd contract float %227, %217
  %229 = add nuw nsw i32 %5, 25
  %230 = zext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %0, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !4
  %233 = fmul contract float %232, 0x3FB99999A0000000
  %234 = fadd contract float %228, %233
  %235 = fmul contract float %232, 0x3FE99999A0000000
  %236 = fadd contract float %235, %225
  %237 = add nuw nsw i32 %5, 26
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %0, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !4
  %241 = fmul contract float %240, 0x3FB99999A0000000
  %242 = fadd contract float %236, %241
  %243 = fmul contract float %240, 0x3FE99999A0000000
  %244 = fadd contract float %243, %233
  %245 = add nuw nsw i32 %5, 27
  %246 = zext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %0, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !4
  %249 = fmul contract float %248, 0x3FB99999A0000000
  %250 = fadd contract float %244, %249
  %251 = fmul contract float %248, 0x3FE99999A0000000
  %252 = fadd contract float %251, %241
  %253 = add nuw nsw i32 %5, 28
  %254 = zext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %0, i64 %254
  %256 = load float, float addrspace(1)* %255, align 4, !tbaa !4
  %257 = fmul contract float %256, 0x3FB99999A0000000
  %258 = fadd contract float %252, %257
  %259 = fmul contract float %256, 0x3FE99999A0000000
  %260 = fadd contract float %259, %249
  %261 = fadd contract float %260, %194
  %262 = fmul contract float %193, 0x3FE99999A0000000
  %263 = fadd contract float %262, %257
  %264 = fadd contract float %263, %203
  %265 = getelementptr inbounds float, float addrspace(1)* %1, i64 %186
  store float %201, float addrspace(1)* %265, align 4, !tbaa !4
  %266 = getelementptr inbounds float, float addrspace(1)* %1, i64 %197
  store float %210, float addrspace(1)* %266, align 4, !tbaa !4
  %267 = getelementptr inbounds float, float addrspace(1)* %1, i64 %206
  store float %218, float addrspace(1)* %267, align 4, !tbaa !4
  %268 = getelementptr inbounds float, float addrspace(1)* %1, i64 %214
  store float %226, float addrspace(1)* %268, align 4, !tbaa !4
  %269 = getelementptr inbounds float, float addrspace(1)* %1, i64 %222
  store float %234, float addrspace(1)* %269, align 4, !tbaa !4
  %270 = getelementptr inbounds float, float addrspace(1)* %1, i64 %230
  store float %242, float addrspace(1)* %270, align 4, !tbaa !4
  %271 = getelementptr inbounds float, float addrspace(1)* %1, i64 %238
  store float %250, float addrspace(1)* %271, align 4, !tbaa !4
  %272 = getelementptr inbounds float, float addrspace(1)* %1, i64 %246
  store float %258, float addrspace(1)* %272, align 4, !tbaa !4
  %273 = getelementptr inbounds float, float addrspace(1)* %1, i64 %254
  store float %261, float addrspace(1)* %273, align 4, !tbaa !4
  %274 = getelementptr inbounds float, float addrspace(1)* %1, i64 %191
  store float %264, float addrspace(1)* %274, align 4, !tbaa !4
  %275 = add nuw nsw i32 %5, 30
  %276 = zext i32 %275 to i64
  %277 = getelementptr inbounds float, float addrspace(1)* %0, i64 %276
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !4
  %279 = fmul contract float %278, 0x3FE99999A0000000
  %280 = add nuw nsw i32 %5, 39
  %281 = zext i32 %280 to i64
  %282 = getelementptr inbounds float, float addrspace(1)* %0, i64 %281
  %283 = load float, float addrspace(1)* %282, align 4, !tbaa !4
  %284 = fmul contract float %283, 0x3FB99999A0000000
  %285 = fadd contract float %279, %284
  %286 = add nuw nsw i32 %5, 31
  %287 = zext i32 %286 to i64
  %288 = getelementptr inbounds float, float addrspace(1)* %0, i64 %287
  %289 = load float, float addrspace(1)* %288, align 4, !tbaa !4
  %290 = fmul contract float %289, 0x3FB99999A0000000
  %291 = fadd contract float %285, %290
  %292 = fmul contract float %289, 0x3FE99999A0000000
  %293 = fmul contract float %278, 0x3FB99999A0000000
  %294 = fadd contract float %292, %293
  %295 = add nuw nsw i32 %5, 32
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds float, float addrspace(1)* %0, i64 %296
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !4
  %299 = fmul contract float %298, 0x3FB99999A0000000
  %300 = fadd contract float %294, %299
  %301 = fmul contract float %298, 0x3FE99999A0000000
  %302 = fadd contract float %301, %290
  %303 = add nuw nsw i32 %5, 33
  %304 = zext i32 %303 to i64
  %305 = getelementptr inbounds float, float addrspace(1)* %0, i64 %304
  %306 = load float, float addrspace(1)* %305, align 4, !tbaa !4
  %307 = fmul contract float %306, 0x3FB99999A0000000
  %308 = fadd contract float %302, %307
  %309 = fmul contract float %306, 0x3FE99999A0000000
  %310 = fadd contract float %309, %299
  %311 = add nuw nsw i32 %5, 34
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds float, float addrspace(1)* %0, i64 %312
  %314 = load float, float addrspace(1)* %313, align 4, !tbaa !4
  %315 = fmul contract float %314, 0x3FB99999A0000000
  %316 = fadd contract float %310, %315
  %317 = fmul contract float %314, 0x3FE99999A0000000
  %318 = fadd contract float %317, %307
  %319 = add nuw nsw i32 %5, 35
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds float, float addrspace(1)* %0, i64 %320
  %322 = load float, float addrspace(1)* %321, align 4, !tbaa !4
  %323 = fmul contract float %322, 0x3FB99999A0000000
  %324 = fadd contract float %318, %323
  %325 = fmul contract float %322, 0x3FE99999A0000000
  %326 = fadd contract float %325, %315
  %327 = add nuw nsw i32 %5, 36
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, float addrspace(1)* %0, i64 %328
  %330 = load float, float addrspace(1)* %329, align 4, !tbaa !4
  %331 = fmul contract float %330, 0x3FB99999A0000000
  %332 = fadd contract float %326, %331
  %333 = fmul contract float %330, 0x3FE99999A0000000
  %334 = fadd contract float %333, %323
  %335 = add nuw nsw i32 %5, 37
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %0, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !4
  %339 = fmul contract float %338, 0x3FB99999A0000000
  %340 = fadd contract float %334, %339
  %341 = fmul contract float %338, 0x3FE99999A0000000
  %342 = fadd contract float %341, %331
  %343 = add nuw nsw i32 %5, 38
  %344 = zext i32 %343 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %0, i64 %344
  %346 = load float, float addrspace(1)* %345, align 4, !tbaa !4
  %347 = fmul contract float %346, 0x3FB99999A0000000
  %348 = fadd contract float %342, %347
  %349 = fmul contract float %346, 0x3FE99999A0000000
  %350 = fadd contract float %349, %339
  %351 = fadd contract float %350, %284
  %352 = fmul contract float %283, 0x3FE99999A0000000
  %353 = fadd contract float %352, %347
  %354 = fadd contract float %353, %293
  %355 = getelementptr inbounds float, float addrspace(1)* %1, i64 %276
  store float %291, float addrspace(1)* %355, align 4, !tbaa !4
  %356 = getelementptr inbounds float, float addrspace(1)* %1, i64 %287
  store float %300, float addrspace(1)* %356, align 4, !tbaa !4
  %357 = getelementptr inbounds float, float addrspace(1)* %1, i64 %296
  store float %308, float addrspace(1)* %357, align 4, !tbaa !4
  %358 = getelementptr inbounds float, float addrspace(1)* %1, i64 %304
  store float %316, float addrspace(1)* %358, align 4, !tbaa !4
  %359 = getelementptr inbounds float, float addrspace(1)* %1, i64 %312
  store float %324, float addrspace(1)* %359, align 4, !tbaa !4
  %360 = getelementptr inbounds float, float addrspace(1)* %1, i64 %320
  store float %332, float addrspace(1)* %360, align 4, !tbaa !4
  %361 = getelementptr inbounds float, float addrspace(1)* %1, i64 %328
  store float %340, float addrspace(1)* %361, align 4, !tbaa !4
  %362 = getelementptr inbounds float, float addrspace(1)* %1, i64 %336
  store float %348, float addrspace(1)* %362, align 4, !tbaa !4
  %363 = getelementptr inbounds float, float addrspace(1)* %1, i64 %344
  store float %351, float addrspace(1)* %363, align 4, !tbaa !4
  %364 = getelementptr inbounds float, float addrspace(1)* %1, i64 %281
  store float %354, float addrspace(1)* %364, align 4, !tbaa !4
  %365 = add nuw nsw i32 %5, 40
  %366 = zext i32 %365 to i64
  %367 = getelementptr inbounds float, float addrspace(1)* %0, i64 %366
  %368 = load float, float addrspace(1)* %367, align 4, !tbaa !4
  %369 = fmul contract float %368, 0x3FE99999A0000000
  %370 = add nuw nsw i32 %5, 49
  %371 = zext i32 %370 to i64
  %372 = getelementptr inbounds float, float addrspace(1)* %0, i64 %371
  %373 = load float, float addrspace(1)* %372, align 4, !tbaa !4
  %374 = fmul contract float %373, 0x3FB99999A0000000
  %375 = fadd contract float %369, %374
  %376 = add nuw nsw i32 %5, 41
  %377 = zext i32 %376 to i64
  %378 = getelementptr inbounds float, float addrspace(1)* %0, i64 %377
  %379 = load float, float addrspace(1)* %378, align 4, !tbaa !4
  %380 = fmul contract float %379, 0x3FB99999A0000000
  %381 = fadd contract float %375, %380
  %382 = fmul contract float %379, 0x3FE99999A0000000
  %383 = fmul contract float %368, 0x3FB99999A0000000
  %384 = fadd contract float %382, %383
  %385 = add nuw nsw i32 %5, 42
  %386 = zext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %0, i64 %386
  %388 = load float, float addrspace(1)* %387, align 4, !tbaa !4
  %389 = fmul contract float %388, 0x3FB99999A0000000
  %390 = fadd contract float %384, %389
  %391 = fmul contract float %388, 0x3FE99999A0000000
  %392 = fadd contract float %391, %380
  %393 = add nuw nsw i32 %5, 43
  %394 = zext i32 %393 to i64
  %395 = getelementptr inbounds float, float addrspace(1)* %0, i64 %394
  %396 = load float, float addrspace(1)* %395, align 4, !tbaa !4
  %397 = fmul contract float %396, 0x3FB99999A0000000
  %398 = fadd contract float %392, %397
  %399 = fmul contract float %396, 0x3FE99999A0000000
  %400 = fadd contract float %399, %389
  %401 = add nuw nsw i32 %5, 44
  %402 = zext i32 %401 to i64
  %403 = getelementptr inbounds float, float addrspace(1)* %0, i64 %402
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !4
  %405 = fmul contract float %404, 0x3FB99999A0000000
  %406 = fadd contract float %400, %405
  %407 = fmul contract float %404, 0x3FE99999A0000000
  %408 = fadd contract float %407, %397
  %409 = add nuw nsw i32 %5, 45
  %410 = zext i32 %409 to i64
  %411 = getelementptr inbounds float, float addrspace(1)* %0, i64 %410
  %412 = load float, float addrspace(1)* %411, align 4, !tbaa !4
  %413 = fmul contract float %412, 0x3FB99999A0000000
  %414 = fadd contract float %408, %413
  %415 = fmul contract float %412, 0x3FE99999A0000000
  %416 = fadd contract float %415, %405
  %417 = add nuw nsw i32 %5, 46
  %418 = zext i32 %417 to i64
  %419 = getelementptr inbounds float, float addrspace(1)* %0, i64 %418
  %420 = load float, float addrspace(1)* %419, align 4, !tbaa !4
  %421 = fmul contract float %420, 0x3FB99999A0000000
  %422 = fadd contract float %416, %421
  %423 = fmul contract float %420, 0x3FE99999A0000000
  %424 = fadd contract float %423, %413
  %425 = add nuw nsw i32 %5, 47
  %426 = zext i32 %425 to i64
  %427 = getelementptr inbounds float, float addrspace(1)* %0, i64 %426
  %428 = load float, float addrspace(1)* %427, align 4, !tbaa !4
  %429 = fmul contract float %428, 0x3FB99999A0000000
  %430 = fadd contract float %424, %429
  %431 = fmul contract float %428, 0x3FE99999A0000000
  %432 = fadd contract float %431, %421
  %433 = add nuw nsw i32 %5, 48
  %434 = zext i32 %433 to i64
  %435 = getelementptr inbounds float, float addrspace(1)* %0, i64 %434
  %436 = load float, float addrspace(1)* %435, align 4, !tbaa !4
  %437 = fmul contract float %436, 0x3FB99999A0000000
  %438 = fadd contract float %432, %437
  %439 = fmul contract float %436, 0x3FE99999A0000000
  %440 = fadd contract float %439, %429
  %441 = fadd contract float %440, %374
  %442 = fmul contract float %373, 0x3FE99999A0000000
  %443 = fadd contract float %442, %437
  %444 = fadd contract float %443, %383
  %445 = getelementptr inbounds float, float addrspace(1)* %1, i64 %366
  store float %381, float addrspace(1)* %445, align 4, !tbaa !4
  %446 = getelementptr inbounds float, float addrspace(1)* %1, i64 %377
  store float %390, float addrspace(1)* %446, align 4, !tbaa !4
  %447 = getelementptr inbounds float, float addrspace(1)* %1, i64 %386
  store float %398, float addrspace(1)* %447, align 4, !tbaa !4
  %448 = getelementptr inbounds float, float addrspace(1)* %1, i64 %394
  store float %406, float addrspace(1)* %448, align 4, !tbaa !4
  %449 = getelementptr inbounds float, float addrspace(1)* %1, i64 %402
  store float %414, float addrspace(1)* %449, align 4, !tbaa !4
  %450 = getelementptr inbounds float, float addrspace(1)* %1, i64 %410
  store float %422, float addrspace(1)* %450, align 4, !tbaa !4
  %451 = getelementptr inbounds float, float addrspace(1)* %1, i64 %418
  store float %430, float addrspace(1)* %451, align 4, !tbaa !4
  %452 = getelementptr inbounds float, float addrspace(1)* %1, i64 %426
  store float %438, float addrspace(1)* %452, align 4, !tbaa !4
  %453 = getelementptr inbounds float, float addrspace(1)* %1, i64 %434
  store float %441, float addrspace(1)* %453, align 4, !tbaa !4
  %454 = getelementptr inbounds float, float addrspace(1)* %1, i64 %371
  store float %444, float addrspace(1)* %454, align 4, !tbaa !4
  %455 = add nuw nsw i32 %5, 50
  %456 = zext i32 %455 to i64
  %457 = getelementptr inbounds float, float addrspace(1)* %0, i64 %456
  %458 = load float, float addrspace(1)* %457, align 4, !tbaa !4
  %459 = fmul contract float %458, 0x3FE99999A0000000
  %460 = add nuw nsw i32 %5, 59
  %461 = zext i32 %460 to i64
  %462 = getelementptr inbounds float, float addrspace(1)* %0, i64 %461
  %463 = load float, float addrspace(1)* %462, align 4, !tbaa !4
  %464 = fmul contract float %463, 0x3FB99999A0000000
  %465 = fadd contract float %459, %464
  %466 = add nuw nsw i32 %5, 51
  %467 = zext i32 %466 to i64
  %468 = getelementptr inbounds float, float addrspace(1)* %0, i64 %467
  %469 = load float, float addrspace(1)* %468, align 4, !tbaa !4
  %470 = fmul contract float %469, 0x3FB99999A0000000
  %471 = fadd contract float %465, %470
  %472 = fmul contract float %469, 0x3FE99999A0000000
  %473 = fmul contract float %458, 0x3FB99999A0000000
  %474 = fadd contract float %472, %473
  %475 = add nuw nsw i32 %5, 52
  %476 = zext i32 %475 to i64
  %477 = getelementptr inbounds float, float addrspace(1)* %0, i64 %476
  %478 = load float, float addrspace(1)* %477, align 4, !tbaa !4
  %479 = fmul contract float %478, 0x3FB99999A0000000
  %480 = fadd contract float %474, %479
  %481 = fmul contract float %478, 0x3FE99999A0000000
  %482 = fadd contract float %481, %470
  %483 = add nuw nsw i32 %5, 53
  %484 = zext i32 %483 to i64
  %485 = getelementptr inbounds float, float addrspace(1)* %0, i64 %484
  %486 = load float, float addrspace(1)* %485, align 4, !tbaa !4
  %487 = fmul contract float %486, 0x3FB99999A0000000
  %488 = fadd contract float %482, %487
  %489 = fmul contract float %486, 0x3FE99999A0000000
  %490 = fadd contract float %489, %479
  %491 = add nuw nsw i32 %5, 54
  %492 = zext i32 %491 to i64
  %493 = getelementptr inbounds float, float addrspace(1)* %0, i64 %492
  %494 = load float, float addrspace(1)* %493, align 4, !tbaa !4
  %495 = fmul contract float %494, 0x3FB99999A0000000
  %496 = fadd contract float %490, %495
  %497 = fmul contract float %494, 0x3FE99999A0000000
  %498 = fadd contract float %497, %487
  %499 = add nuw nsw i32 %5, 55
  %500 = zext i32 %499 to i64
  %501 = getelementptr inbounds float, float addrspace(1)* %0, i64 %500
  %502 = load float, float addrspace(1)* %501, align 4, !tbaa !4
  %503 = fmul contract float %502, 0x3FB99999A0000000
  %504 = fadd contract float %498, %503
  %505 = fmul contract float %502, 0x3FE99999A0000000
  %506 = fadd contract float %505, %495
  %507 = add nuw nsw i32 %5, 56
  %508 = zext i32 %507 to i64
  %509 = getelementptr inbounds float, float addrspace(1)* %0, i64 %508
  %510 = load float, float addrspace(1)* %509, align 4, !tbaa !4
  %511 = fmul contract float %510, 0x3FB99999A0000000
  %512 = fadd contract float %506, %511
  %513 = fmul contract float %510, 0x3FE99999A0000000
  %514 = fadd contract float %513, %503
  %515 = add nuw nsw i32 %5, 57
  %516 = zext i32 %515 to i64
  %517 = getelementptr inbounds float, float addrspace(1)* %0, i64 %516
  %518 = load float, float addrspace(1)* %517, align 4, !tbaa !4
  %519 = fmul contract float %518, 0x3FB99999A0000000
  %520 = fadd contract float %514, %519
  %521 = fmul contract float %518, 0x3FE99999A0000000
  %522 = fadd contract float %521, %511
  %523 = add nuw nsw i32 %5, 58
  %524 = zext i32 %523 to i64
  %525 = getelementptr inbounds float, float addrspace(1)* %0, i64 %524
  %526 = load float, float addrspace(1)* %525, align 4, !tbaa !4
  %527 = fmul contract float %526, 0x3FB99999A0000000
  %528 = fadd contract float %522, %527
  %529 = fmul contract float %526, 0x3FE99999A0000000
  %530 = fadd contract float %529, %519
  %531 = fadd contract float %530, %464
  %532 = fmul contract float %463, 0x3FE99999A0000000
  %533 = fadd contract float %532, %527
  %534 = fadd contract float %533, %473
  %535 = getelementptr inbounds float, float addrspace(1)* %1, i64 %456
  store float %471, float addrspace(1)* %535, align 4, !tbaa !4
  %536 = getelementptr inbounds float, float addrspace(1)* %1, i64 %467
  store float %480, float addrspace(1)* %536, align 4, !tbaa !4
  %537 = getelementptr inbounds float, float addrspace(1)* %1, i64 %476
  store float %488, float addrspace(1)* %537, align 4, !tbaa !4
  %538 = getelementptr inbounds float, float addrspace(1)* %1, i64 %484
  store float %496, float addrspace(1)* %538, align 4, !tbaa !4
  %539 = getelementptr inbounds float, float addrspace(1)* %1, i64 %492
  store float %504, float addrspace(1)* %539, align 4, !tbaa !4
  %540 = getelementptr inbounds float, float addrspace(1)* %1, i64 %500
  store float %512, float addrspace(1)* %540, align 4, !tbaa !4
  %541 = getelementptr inbounds float, float addrspace(1)* %1, i64 %508
  store float %520, float addrspace(1)* %541, align 4, !tbaa !4
  %542 = getelementptr inbounds float, float addrspace(1)* %1, i64 %516
  store float %528, float addrspace(1)* %542, align 4, !tbaa !4
  %543 = getelementptr inbounds float, float addrspace(1)* %1, i64 %524
  store float %531, float addrspace(1)* %543, align 4, !tbaa !4
  %544 = getelementptr inbounds float, float addrspace(1)* %1, i64 %461
  store float %534, float addrspace(1)* %544, align 4, !tbaa !4
  %545 = add nuw nsw i32 %5, 60
  %546 = zext i32 %545 to i64
  %547 = getelementptr inbounds float, float addrspace(1)* %0, i64 %546
  %548 = load float, float addrspace(1)* %547, align 4, !tbaa !4
  %549 = fmul contract float %548, 0x3FE99999A0000000
  %550 = add nuw nsw i32 %5, 69
  %551 = zext i32 %550 to i64
  %552 = getelementptr inbounds float, float addrspace(1)* %0, i64 %551
  %553 = load float, float addrspace(1)* %552, align 4, !tbaa !4
  %554 = fmul contract float %553, 0x3FB99999A0000000
  %555 = fadd contract float %549, %554
  %556 = add nuw nsw i32 %5, 61
  %557 = zext i32 %556 to i64
  %558 = getelementptr inbounds float, float addrspace(1)* %0, i64 %557
  %559 = load float, float addrspace(1)* %558, align 4, !tbaa !4
  %560 = fmul contract float %559, 0x3FB99999A0000000
  %561 = fadd contract float %555, %560
  %562 = fmul contract float %559, 0x3FE99999A0000000
  %563 = fmul contract float %548, 0x3FB99999A0000000
  %564 = fadd contract float %562, %563
  %565 = add nuw nsw i32 %5, 62
  %566 = zext i32 %565 to i64
  %567 = getelementptr inbounds float, float addrspace(1)* %0, i64 %566
  %568 = load float, float addrspace(1)* %567, align 4, !tbaa !4
  %569 = fmul contract float %568, 0x3FB99999A0000000
  %570 = fadd contract float %564, %569
  %571 = fmul contract float %568, 0x3FE99999A0000000
  %572 = fadd contract float %571, %560
  %573 = add nuw nsw i32 %5, 63
  %574 = zext i32 %573 to i64
  %575 = getelementptr inbounds float, float addrspace(1)* %0, i64 %574
  %576 = load float, float addrspace(1)* %575, align 4, !tbaa !4
  %577 = fmul contract float %576, 0x3FB99999A0000000
  %578 = fadd contract float %572, %577
  %579 = fmul contract float %576, 0x3FE99999A0000000
  %580 = fadd contract float %579, %569
  %581 = add nuw nsw i32 %5, 64
  %582 = zext i32 %581 to i64
  %583 = getelementptr inbounds float, float addrspace(1)* %0, i64 %582
  %584 = load float, float addrspace(1)* %583, align 4, !tbaa !4
  %585 = fmul contract float %584, 0x3FB99999A0000000
  %586 = fadd contract float %580, %585
  %587 = fmul contract float %584, 0x3FE99999A0000000
  %588 = fadd contract float %587, %577
  %589 = add nuw nsw i32 %5, 65
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds float, float addrspace(1)* %0, i64 %590
  %592 = load float, float addrspace(1)* %591, align 4, !tbaa !4
  %593 = fmul contract float %592, 0x3FB99999A0000000
  %594 = fadd contract float %588, %593
  %595 = fmul contract float %592, 0x3FE99999A0000000
  %596 = fadd contract float %595, %585
  %597 = add nuw nsw i32 %5, 66
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds float, float addrspace(1)* %0, i64 %598
  %600 = load float, float addrspace(1)* %599, align 4, !tbaa !4
  %601 = fmul contract float %600, 0x3FB99999A0000000
  %602 = fadd contract float %596, %601
  %603 = fmul contract float %600, 0x3FE99999A0000000
  %604 = fadd contract float %603, %593
  %605 = add nuw nsw i32 %5, 67
  %606 = zext i32 %605 to i64
  %607 = getelementptr inbounds float, float addrspace(1)* %0, i64 %606
  %608 = load float, float addrspace(1)* %607, align 4, !tbaa !4
  %609 = fmul contract float %608, 0x3FB99999A0000000
  %610 = fadd contract float %604, %609
  %611 = fmul contract float %608, 0x3FE99999A0000000
  %612 = fadd contract float %611, %601
  %613 = add nuw nsw i32 %5, 68
  %614 = zext i32 %613 to i64
  %615 = getelementptr inbounds float, float addrspace(1)* %0, i64 %614
  %616 = load float, float addrspace(1)* %615, align 4, !tbaa !4
  %617 = fmul contract float %616, 0x3FB99999A0000000
  %618 = fadd contract float %612, %617
  %619 = fmul contract float %616, 0x3FE99999A0000000
  %620 = fadd contract float %619, %609
  %621 = fadd contract float %620, %554
  %622 = fmul contract float %553, 0x3FE99999A0000000
  %623 = fadd contract float %622, %617
  %624 = fadd contract float %623, %563
  %625 = getelementptr inbounds float, float addrspace(1)* %1, i64 %546
  store float %561, float addrspace(1)* %625, align 4, !tbaa !4
  %626 = getelementptr inbounds float, float addrspace(1)* %1, i64 %557
  store float %570, float addrspace(1)* %626, align 4, !tbaa !4
  %627 = getelementptr inbounds float, float addrspace(1)* %1, i64 %566
  store float %578, float addrspace(1)* %627, align 4, !tbaa !4
  %628 = getelementptr inbounds float, float addrspace(1)* %1, i64 %574
  store float %586, float addrspace(1)* %628, align 4, !tbaa !4
  %629 = getelementptr inbounds float, float addrspace(1)* %1, i64 %582
  store float %594, float addrspace(1)* %629, align 4, !tbaa !4
  %630 = getelementptr inbounds float, float addrspace(1)* %1, i64 %590
  store float %602, float addrspace(1)* %630, align 4, !tbaa !4
  %631 = getelementptr inbounds float, float addrspace(1)* %1, i64 %598
  store float %610, float addrspace(1)* %631, align 4, !tbaa !4
  %632 = getelementptr inbounds float, float addrspace(1)* %1, i64 %606
  store float %618, float addrspace(1)* %632, align 4, !tbaa !4
  %633 = getelementptr inbounds float, float addrspace(1)* %1, i64 %614
  store float %621, float addrspace(1)* %633, align 4, !tbaa !4
  %634 = getelementptr inbounds float, float addrspace(1)* %1, i64 %551
  store float %624, float addrspace(1)* %634, align 4, !tbaa !4
  %635 = add nuw nsw i32 %4, 1
  %636 = icmp eq i32 %635, 18
  br i1 %636, label %637, label %3, !llvm.loop !8

637:                                              ; preds = %3
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
