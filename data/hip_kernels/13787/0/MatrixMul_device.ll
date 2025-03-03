; ModuleID = '../data/hip_kernels/13787/0/main.cu'
source_filename = "../data/hip_kernels/13787/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9MatrixMulPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 1
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = shl i32 %8, 1
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = add i32 %9, %10
  %12 = mul i32 %11, 100
  %13 = add i32 %12, %7
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %2, i64 %14
  store float 0.000000e+00, float addrspace(1)* %15, align 4, !tbaa !5
  %16 = zext i32 %12 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5
  %19 = zext i32 %7 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5
  %22 = fmul contract float %18, %21
  %23 = fadd contract float %22, 0.000000e+00
  store float %23, float addrspace(1)* %15, align 4, !tbaa !5
  %24 = or i32 %12, 1
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5
  %28 = add i32 %7, 100
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5
  %32 = fmul contract float %27, %31
  %33 = fadd contract float %23, %32
  store float %33, float addrspace(1)* %15, align 4, !tbaa !5
  %34 = or i32 %12, 2
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5
  %38 = add i32 %7, 200
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5
  %42 = fmul contract float %37, %41
  %43 = fadd contract float %33, %42
  store float %43, float addrspace(1)* %15, align 4, !tbaa !5
  %44 = or i32 %12, 3
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5
  %48 = add i32 %7, 300
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5
  %52 = fmul contract float %47, %51
  %53 = fadd contract float %43, %52
  store float %53, float addrspace(1)* %15, align 4, !tbaa !5
  %54 = add i32 %12, 4
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5
  %58 = add i32 %7, 400
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5
  %62 = fmul contract float %57, %61
  %63 = fadd contract float %53, %62
  store float %63, float addrspace(1)* %15, align 4, !tbaa !5
  %64 = add i32 %12, 5
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5
  %68 = add i32 %7, 500
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5
  %72 = fmul contract float %67, %71
  %73 = fadd contract float %63, %72
  store float %73, float addrspace(1)* %15, align 4, !tbaa !5
  %74 = add i32 %12, 6
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5
  %78 = add i32 %7, 600
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = fmul contract float %77, %81
  %83 = fadd contract float %73, %82
  store float %83, float addrspace(1)* %15, align 4, !tbaa !5
  %84 = add i32 %12, 7
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5
  %88 = add i32 %7, 700
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5
  %92 = fmul contract float %87, %91
  %93 = fadd contract float %83, %92
  store float %93, float addrspace(1)* %15, align 4, !tbaa !5
  %94 = add i32 %12, 8
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  %98 = add i32 %7, 800
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5
  %102 = fmul contract float %97, %101
  %103 = fadd contract float %93, %102
  store float %103, float addrspace(1)* %15, align 4, !tbaa !5
  %104 = add i32 %12, 9
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5
  %108 = add i32 %7, 900
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !5
  %112 = fmul contract float %107, %111
  %113 = fadd contract float %103, %112
  store float %113, float addrspace(1)* %15, align 4, !tbaa !5
  %114 = add i32 %12, 10
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5
  %118 = add i32 %7, 1000
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5
  %122 = fmul contract float %117, %121
  %123 = fadd contract float %113, %122
  store float %123, float addrspace(1)* %15, align 4, !tbaa !5
  %124 = add i32 %12, 11
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5
  %128 = add i32 %7, 1100
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5
  %132 = fmul contract float %127, %131
  %133 = fadd contract float %123, %132
  store float %133, float addrspace(1)* %15, align 4, !tbaa !5
  %134 = add i32 %12, 12
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5
  %138 = add i32 %7, 1200
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !5
  %142 = fmul contract float %137, %141
  %143 = fadd contract float %133, %142
  store float %143, float addrspace(1)* %15, align 4, !tbaa !5
  %144 = add i32 %12, 13
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !5
  %148 = add i32 %7, 1300
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !5
  %152 = fmul contract float %147, %151
  %153 = fadd contract float %143, %152
  store float %153, float addrspace(1)* %15, align 4, !tbaa !5
  %154 = add i32 %12, 14
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !5
  %158 = add i32 %7, 1400
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !5
  %162 = fmul contract float %157, %161
  %163 = fadd contract float %153, %162
  store float %163, float addrspace(1)* %15, align 4, !tbaa !5
  %164 = add i32 %12, 15
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !5
  %168 = add i32 %7, 1500
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !5
  %172 = fmul contract float %167, %171
  %173 = fadd contract float %163, %172
  store float %173, float addrspace(1)* %15, align 4, !tbaa !5
  %174 = add i32 %12, 16
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %0, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !5
  %178 = add i32 %7, 1600
  %179 = zext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !5
  %182 = fmul contract float %177, %181
  %183 = fadd contract float %173, %182
  store float %183, float addrspace(1)* %15, align 4, !tbaa !5
  %184 = add i32 %12, 17
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %0, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !5
  %188 = add i32 %7, 1700
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %1, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !5
  %192 = fmul contract float %187, %191
  %193 = fadd contract float %183, %192
  store float %193, float addrspace(1)* %15, align 4, !tbaa !5
  %194 = add i32 %12, 18
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %0, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !5
  %198 = add i32 %7, 1800
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %1, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !5
  %202 = fmul contract float %197, %201
  %203 = fadd contract float %193, %202
  store float %203, float addrspace(1)* %15, align 4, !tbaa !5
  %204 = add i32 %12, 19
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %0, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !5
  %208 = add i32 %7, 1900
  %209 = zext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %1, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !5
  %212 = fmul contract float %207, %211
  %213 = fadd contract float %203, %212
  store float %213, float addrspace(1)* %15, align 4, !tbaa !5
  %214 = add i32 %12, 20
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !5
  %218 = add i32 %7, 2000
  %219 = zext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !5
  %222 = fmul contract float %217, %221
  %223 = fadd contract float %213, %222
  store float %223, float addrspace(1)* %15, align 4, !tbaa !5
  %224 = add i32 %12, 21
  %225 = zext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %0, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !5
  %228 = add i32 %7, 2100
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %1, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !5
  %232 = fmul contract float %227, %231
  %233 = fadd contract float %223, %232
  store float %233, float addrspace(1)* %15, align 4, !tbaa !5
  %234 = add i32 %12, 22
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %0, i64 %235
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !5
  %238 = add i32 %7, 2200
  %239 = zext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %1, i64 %239
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !5
  %242 = fmul contract float %237, %241
  %243 = fadd contract float %233, %242
  store float %243, float addrspace(1)* %15, align 4, !tbaa !5
  %244 = add i32 %12, 23
  %245 = zext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %0, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !5
  %248 = add i32 %7, 2300
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %1, i64 %249
  %251 = load float, float addrspace(1)* %250, align 4, !tbaa !5
  %252 = fmul contract float %247, %251
  %253 = fadd contract float %243, %252
  store float %253, float addrspace(1)* %15, align 4, !tbaa !5
  %254 = add i32 %12, 24
  %255 = zext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %0, i64 %255
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !5
  %258 = add i32 %7, 2400
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %1, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !5
  %262 = fmul contract float %257, %261
  %263 = fadd contract float %253, %262
  store float %263, float addrspace(1)* %15, align 4, !tbaa !5
  %264 = add i32 %12, 25
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds float, float addrspace(1)* %0, i64 %265
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !5
  %268 = add i32 %7, 2500
  %269 = zext i32 %268 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %1, i64 %269
  %271 = load float, float addrspace(1)* %270, align 4, !tbaa !5
  %272 = fmul contract float %267, %271
  %273 = fadd contract float %263, %272
  store float %273, float addrspace(1)* %15, align 4, !tbaa !5
  %274 = add i32 %12, 26
  %275 = zext i32 %274 to i64
  %276 = getelementptr inbounds float, float addrspace(1)* %0, i64 %275
  %277 = load float, float addrspace(1)* %276, align 4, !tbaa !5
  %278 = add i32 %7, 2600
  %279 = zext i32 %278 to i64
  %280 = getelementptr inbounds float, float addrspace(1)* %1, i64 %279
  %281 = load float, float addrspace(1)* %280, align 4, !tbaa !5
  %282 = fmul contract float %277, %281
  %283 = fadd contract float %273, %282
  store float %283, float addrspace(1)* %15, align 4, !tbaa !5
  %284 = add i32 %12, 27
  %285 = zext i32 %284 to i64
  %286 = getelementptr inbounds float, float addrspace(1)* %0, i64 %285
  %287 = load float, float addrspace(1)* %286, align 4, !tbaa !5
  %288 = add i32 %7, 2700
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %1, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !5
  %292 = fmul contract float %287, %291
  %293 = fadd contract float %283, %292
  store float %293, float addrspace(1)* %15, align 4, !tbaa !5
  %294 = add i32 %12, 28
  %295 = zext i32 %294 to i64
  %296 = getelementptr inbounds float, float addrspace(1)* %0, i64 %295
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !5
  %298 = add i32 %7, 2800
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds float, float addrspace(1)* %1, i64 %299
  %301 = load float, float addrspace(1)* %300, align 4, !tbaa !5
  %302 = fmul contract float %297, %301
  %303 = fadd contract float %293, %302
  store float %303, float addrspace(1)* %15, align 4, !tbaa !5
  %304 = add i32 %12, 29
  %305 = zext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(1)* %0, i64 %305
  %307 = load float, float addrspace(1)* %306, align 4, !tbaa !5
  %308 = add i32 %7, 2900
  %309 = zext i32 %308 to i64
  %310 = getelementptr inbounds float, float addrspace(1)* %1, i64 %309
  %311 = load float, float addrspace(1)* %310, align 4, !tbaa !5
  %312 = fmul contract float %307, %311
  %313 = fadd contract float %303, %312
  store float %313, float addrspace(1)* %15, align 4, !tbaa !5
  %314 = add i32 %12, 30
  %315 = zext i32 %314 to i64
  %316 = getelementptr inbounds float, float addrspace(1)* %0, i64 %315
  %317 = load float, float addrspace(1)* %316, align 4, !tbaa !5
  %318 = add i32 %7, 3000
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %1, i64 %319
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !5
  %322 = fmul contract float %317, %321
  %323 = fadd contract float %313, %322
  store float %323, float addrspace(1)* %15, align 4, !tbaa !5
  %324 = add i32 %12, 31
  %325 = zext i32 %324 to i64
  %326 = getelementptr inbounds float, float addrspace(1)* %0, i64 %325
  %327 = load float, float addrspace(1)* %326, align 4, !tbaa !5
  %328 = add i32 %7, 3100
  %329 = zext i32 %328 to i64
  %330 = getelementptr inbounds float, float addrspace(1)* %1, i64 %329
  %331 = load float, float addrspace(1)* %330, align 4, !tbaa !5
  %332 = fmul contract float %327, %331
  %333 = fadd contract float %323, %332
  store float %333, float addrspace(1)* %15, align 4, !tbaa !5
  %334 = add i32 %12, 32
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(1)* %0, i64 %335
  %337 = load float, float addrspace(1)* %336, align 4, !tbaa !5
  %338 = add i32 %7, 3200
  %339 = zext i32 %338 to i64
  %340 = getelementptr inbounds float, float addrspace(1)* %1, i64 %339
  %341 = load float, float addrspace(1)* %340, align 4, !tbaa !5
  %342 = fmul contract float %337, %341
  %343 = fadd contract float %333, %342
  store float %343, float addrspace(1)* %15, align 4, !tbaa !5
  %344 = add i32 %12, 33
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds float, float addrspace(1)* %0, i64 %345
  %347 = load float, float addrspace(1)* %346, align 4, !tbaa !5
  %348 = add i32 %7, 3300
  %349 = zext i32 %348 to i64
  %350 = getelementptr inbounds float, float addrspace(1)* %1, i64 %349
  %351 = load float, float addrspace(1)* %350, align 4, !tbaa !5
  %352 = fmul contract float %347, %351
  %353 = fadd contract float %343, %352
  store float %353, float addrspace(1)* %15, align 4, !tbaa !5
  %354 = add i32 %12, 34
  %355 = zext i32 %354 to i64
  %356 = getelementptr inbounds float, float addrspace(1)* %0, i64 %355
  %357 = load float, float addrspace(1)* %356, align 4, !tbaa !5
  %358 = add i32 %7, 3400
  %359 = zext i32 %358 to i64
  %360 = getelementptr inbounds float, float addrspace(1)* %1, i64 %359
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !5
  %362 = fmul contract float %357, %361
  %363 = fadd contract float %353, %362
  store float %363, float addrspace(1)* %15, align 4, !tbaa !5
  %364 = add i32 %12, 35
  %365 = zext i32 %364 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %0, i64 %365
  %367 = load float, float addrspace(1)* %366, align 4, !tbaa !5
  %368 = add i32 %7, 3500
  %369 = zext i32 %368 to i64
  %370 = getelementptr inbounds float, float addrspace(1)* %1, i64 %369
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !5
  %372 = fmul contract float %367, %371
  %373 = fadd contract float %363, %372
  store float %373, float addrspace(1)* %15, align 4, !tbaa !5
  %374 = add i32 %12, 36
  %375 = zext i32 %374 to i64
  %376 = getelementptr inbounds float, float addrspace(1)* %0, i64 %375
  %377 = load float, float addrspace(1)* %376, align 4, !tbaa !5
  %378 = add i32 %7, 3600
  %379 = zext i32 %378 to i64
  %380 = getelementptr inbounds float, float addrspace(1)* %1, i64 %379
  %381 = load float, float addrspace(1)* %380, align 4, !tbaa !5
  %382 = fmul contract float %377, %381
  %383 = fadd contract float %373, %382
  store float %383, float addrspace(1)* %15, align 4, !tbaa !5
  %384 = add i32 %12, 37
  %385 = zext i32 %384 to i64
  %386 = getelementptr inbounds float, float addrspace(1)* %0, i64 %385
  %387 = load float, float addrspace(1)* %386, align 4, !tbaa !5
  %388 = add i32 %7, 3700
  %389 = zext i32 %388 to i64
  %390 = getelementptr inbounds float, float addrspace(1)* %1, i64 %389
  %391 = load float, float addrspace(1)* %390, align 4, !tbaa !5
  %392 = fmul contract float %387, %391
  %393 = fadd contract float %383, %392
  store float %393, float addrspace(1)* %15, align 4, !tbaa !5
  %394 = add i32 %12, 38
  %395 = zext i32 %394 to i64
  %396 = getelementptr inbounds float, float addrspace(1)* %0, i64 %395
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !5
  %398 = add i32 %7, 3800
  %399 = zext i32 %398 to i64
  %400 = getelementptr inbounds float, float addrspace(1)* %1, i64 %399
  %401 = load float, float addrspace(1)* %400, align 4, !tbaa !5
  %402 = fmul contract float %397, %401
  %403 = fadd contract float %393, %402
  store float %403, float addrspace(1)* %15, align 4, !tbaa !5
  %404 = add i32 %12, 39
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds float, float addrspace(1)* %0, i64 %405
  %407 = load float, float addrspace(1)* %406, align 4, !tbaa !5
  %408 = add i32 %7, 3900
  %409 = zext i32 %408 to i64
  %410 = getelementptr inbounds float, float addrspace(1)* %1, i64 %409
  %411 = load float, float addrspace(1)* %410, align 4, !tbaa !5
  %412 = fmul contract float %407, %411
  %413 = fadd contract float %403, %412
  store float %413, float addrspace(1)* %15, align 4, !tbaa !5
  %414 = add i32 %12, 40
  %415 = zext i32 %414 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %0, i64 %415
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !5
  %418 = add i32 %7, 4000
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, float addrspace(1)* %1, i64 %419
  %421 = load float, float addrspace(1)* %420, align 4, !tbaa !5
  %422 = fmul contract float %417, %421
  %423 = fadd contract float %413, %422
  store float %423, float addrspace(1)* %15, align 4, !tbaa !5
  %424 = add i32 %12, 41
  %425 = zext i32 %424 to i64
  %426 = getelementptr inbounds float, float addrspace(1)* %0, i64 %425
  %427 = load float, float addrspace(1)* %426, align 4, !tbaa !5
  %428 = add i32 %7, 4100
  %429 = zext i32 %428 to i64
  %430 = getelementptr inbounds float, float addrspace(1)* %1, i64 %429
  %431 = load float, float addrspace(1)* %430, align 4, !tbaa !5
  %432 = fmul contract float %427, %431
  %433 = fadd contract float %423, %432
  store float %433, float addrspace(1)* %15, align 4, !tbaa !5
  %434 = add i32 %12, 42
  %435 = zext i32 %434 to i64
  %436 = getelementptr inbounds float, float addrspace(1)* %0, i64 %435
  %437 = load float, float addrspace(1)* %436, align 4, !tbaa !5
  %438 = add i32 %7, 4200
  %439 = zext i32 %438 to i64
  %440 = getelementptr inbounds float, float addrspace(1)* %1, i64 %439
  %441 = load float, float addrspace(1)* %440, align 4, !tbaa !5
  %442 = fmul contract float %437, %441
  %443 = fadd contract float %433, %442
  store float %443, float addrspace(1)* %15, align 4, !tbaa !5
  %444 = add i32 %12, 43
  %445 = zext i32 %444 to i64
  %446 = getelementptr inbounds float, float addrspace(1)* %0, i64 %445
  %447 = load float, float addrspace(1)* %446, align 4, !tbaa !5
  %448 = add i32 %7, 4300
  %449 = zext i32 %448 to i64
  %450 = getelementptr inbounds float, float addrspace(1)* %1, i64 %449
  %451 = load float, float addrspace(1)* %450, align 4, !tbaa !5
  %452 = fmul contract float %447, %451
  %453 = fadd contract float %443, %452
  store float %453, float addrspace(1)* %15, align 4, !tbaa !5
  %454 = add i32 %12, 44
  %455 = zext i32 %454 to i64
  %456 = getelementptr inbounds float, float addrspace(1)* %0, i64 %455
  %457 = load float, float addrspace(1)* %456, align 4, !tbaa !5
  %458 = add i32 %7, 4400
  %459 = zext i32 %458 to i64
  %460 = getelementptr inbounds float, float addrspace(1)* %1, i64 %459
  %461 = load float, float addrspace(1)* %460, align 4, !tbaa !5
  %462 = fmul contract float %457, %461
  %463 = fadd contract float %453, %462
  store float %463, float addrspace(1)* %15, align 4, !tbaa !5
  %464 = add i32 %12, 45
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds float, float addrspace(1)* %0, i64 %465
  %467 = load float, float addrspace(1)* %466, align 4, !tbaa !5
  %468 = add i32 %7, 4500
  %469 = zext i32 %468 to i64
  %470 = getelementptr inbounds float, float addrspace(1)* %1, i64 %469
  %471 = load float, float addrspace(1)* %470, align 4, !tbaa !5
  %472 = fmul contract float %467, %471
  %473 = fadd contract float %463, %472
  store float %473, float addrspace(1)* %15, align 4, !tbaa !5
  %474 = add i32 %12, 46
  %475 = zext i32 %474 to i64
  %476 = getelementptr inbounds float, float addrspace(1)* %0, i64 %475
  %477 = load float, float addrspace(1)* %476, align 4, !tbaa !5
  %478 = add i32 %7, 4600
  %479 = zext i32 %478 to i64
  %480 = getelementptr inbounds float, float addrspace(1)* %1, i64 %479
  %481 = load float, float addrspace(1)* %480, align 4, !tbaa !5
  %482 = fmul contract float %477, %481
  %483 = fadd contract float %473, %482
  store float %483, float addrspace(1)* %15, align 4, !tbaa !5
  %484 = add i32 %12, 47
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds float, float addrspace(1)* %0, i64 %485
  %487 = load float, float addrspace(1)* %486, align 4, !tbaa !5
  %488 = add i32 %7, 4700
  %489 = zext i32 %488 to i64
  %490 = getelementptr inbounds float, float addrspace(1)* %1, i64 %489
  %491 = load float, float addrspace(1)* %490, align 4, !tbaa !5
  %492 = fmul contract float %487, %491
  %493 = fadd contract float %483, %492
  store float %493, float addrspace(1)* %15, align 4, !tbaa !5
  %494 = add i32 %12, 48
  %495 = zext i32 %494 to i64
  %496 = getelementptr inbounds float, float addrspace(1)* %0, i64 %495
  %497 = load float, float addrspace(1)* %496, align 4, !tbaa !5
  %498 = add i32 %7, 4800
  %499 = zext i32 %498 to i64
  %500 = getelementptr inbounds float, float addrspace(1)* %1, i64 %499
  %501 = load float, float addrspace(1)* %500, align 4, !tbaa !5
  %502 = fmul contract float %497, %501
  %503 = fadd contract float %493, %502
  store float %503, float addrspace(1)* %15, align 4, !tbaa !5
  %504 = add i32 %12, 49
  %505 = zext i32 %504 to i64
  %506 = getelementptr inbounds float, float addrspace(1)* %0, i64 %505
  %507 = load float, float addrspace(1)* %506, align 4, !tbaa !5
  %508 = add i32 %7, 4900
  %509 = zext i32 %508 to i64
  %510 = getelementptr inbounds float, float addrspace(1)* %1, i64 %509
  %511 = load float, float addrspace(1)* %510, align 4, !tbaa !5
  %512 = fmul contract float %507, %511
  %513 = fadd contract float %503, %512
  store float %513, float addrspace(1)* %15, align 4, !tbaa !5
  %514 = add i32 %12, 50
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, float addrspace(1)* %0, i64 %515
  %517 = load float, float addrspace(1)* %516, align 4, !tbaa !5
  %518 = add i32 %7, 5000
  %519 = zext i32 %518 to i64
  %520 = getelementptr inbounds float, float addrspace(1)* %1, i64 %519
  %521 = load float, float addrspace(1)* %520, align 4, !tbaa !5
  %522 = fmul contract float %517, %521
  %523 = fadd contract float %513, %522
  store float %523, float addrspace(1)* %15, align 4, !tbaa !5
  %524 = add i32 %12, 51
  %525 = zext i32 %524 to i64
  %526 = getelementptr inbounds float, float addrspace(1)* %0, i64 %525
  %527 = load float, float addrspace(1)* %526, align 4, !tbaa !5
  %528 = add i32 %7, 5100
  %529 = zext i32 %528 to i64
  %530 = getelementptr inbounds float, float addrspace(1)* %1, i64 %529
  %531 = load float, float addrspace(1)* %530, align 4, !tbaa !5
  %532 = fmul contract float %527, %531
  %533 = fadd contract float %523, %532
  store float %533, float addrspace(1)* %15, align 4, !tbaa !5
  %534 = add i32 %12, 52
  %535 = zext i32 %534 to i64
  %536 = getelementptr inbounds float, float addrspace(1)* %0, i64 %535
  %537 = load float, float addrspace(1)* %536, align 4, !tbaa !5
  %538 = add i32 %7, 5200
  %539 = zext i32 %538 to i64
  %540 = getelementptr inbounds float, float addrspace(1)* %1, i64 %539
  %541 = load float, float addrspace(1)* %540, align 4, !tbaa !5
  %542 = fmul contract float %537, %541
  %543 = fadd contract float %533, %542
  store float %543, float addrspace(1)* %15, align 4, !tbaa !5
  %544 = add i32 %12, 53
  %545 = zext i32 %544 to i64
  %546 = getelementptr inbounds float, float addrspace(1)* %0, i64 %545
  %547 = load float, float addrspace(1)* %546, align 4, !tbaa !5
  %548 = add i32 %7, 5300
  %549 = zext i32 %548 to i64
  %550 = getelementptr inbounds float, float addrspace(1)* %1, i64 %549
  %551 = load float, float addrspace(1)* %550, align 4, !tbaa !5
  %552 = fmul contract float %547, %551
  %553 = fadd contract float %543, %552
  store float %553, float addrspace(1)* %15, align 4, !tbaa !5
  %554 = add i32 %12, 54
  %555 = zext i32 %554 to i64
  %556 = getelementptr inbounds float, float addrspace(1)* %0, i64 %555
  %557 = load float, float addrspace(1)* %556, align 4, !tbaa !5
  %558 = add i32 %7, 5400
  %559 = zext i32 %558 to i64
  %560 = getelementptr inbounds float, float addrspace(1)* %1, i64 %559
  %561 = load float, float addrspace(1)* %560, align 4, !tbaa !5
  %562 = fmul contract float %557, %561
  %563 = fadd contract float %553, %562
  store float %563, float addrspace(1)* %15, align 4, !tbaa !5
  %564 = add i32 %12, 55
  %565 = zext i32 %564 to i64
  %566 = getelementptr inbounds float, float addrspace(1)* %0, i64 %565
  %567 = load float, float addrspace(1)* %566, align 4, !tbaa !5
  %568 = add i32 %7, 5500
  %569 = zext i32 %568 to i64
  %570 = getelementptr inbounds float, float addrspace(1)* %1, i64 %569
  %571 = load float, float addrspace(1)* %570, align 4, !tbaa !5
  %572 = fmul contract float %567, %571
  %573 = fadd contract float %563, %572
  store float %573, float addrspace(1)* %15, align 4, !tbaa !5
  %574 = add i32 %12, 56
  %575 = zext i32 %574 to i64
  %576 = getelementptr inbounds float, float addrspace(1)* %0, i64 %575
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !5
  %578 = add i32 %7, 5600
  %579 = zext i32 %578 to i64
  %580 = getelementptr inbounds float, float addrspace(1)* %1, i64 %579
  %581 = load float, float addrspace(1)* %580, align 4, !tbaa !5
  %582 = fmul contract float %577, %581
  %583 = fadd contract float %573, %582
  store float %583, float addrspace(1)* %15, align 4, !tbaa !5
  %584 = add i32 %12, 57
  %585 = zext i32 %584 to i64
  %586 = getelementptr inbounds float, float addrspace(1)* %0, i64 %585
  %587 = load float, float addrspace(1)* %586, align 4, !tbaa !5
  %588 = add i32 %7, 5700
  %589 = zext i32 %588 to i64
  %590 = getelementptr inbounds float, float addrspace(1)* %1, i64 %589
  %591 = load float, float addrspace(1)* %590, align 4, !tbaa !5
  %592 = fmul contract float %587, %591
  %593 = fadd contract float %583, %592
  store float %593, float addrspace(1)* %15, align 4, !tbaa !5
  %594 = add i32 %12, 58
  %595 = zext i32 %594 to i64
  %596 = getelementptr inbounds float, float addrspace(1)* %0, i64 %595
  %597 = load float, float addrspace(1)* %596, align 4, !tbaa !5
  %598 = add i32 %7, 5800
  %599 = zext i32 %598 to i64
  %600 = getelementptr inbounds float, float addrspace(1)* %1, i64 %599
  %601 = load float, float addrspace(1)* %600, align 4, !tbaa !5
  %602 = fmul contract float %597, %601
  %603 = fadd contract float %593, %602
  store float %603, float addrspace(1)* %15, align 4, !tbaa !5
  %604 = add i32 %12, 59
  %605 = zext i32 %604 to i64
  %606 = getelementptr inbounds float, float addrspace(1)* %0, i64 %605
  %607 = load float, float addrspace(1)* %606, align 4, !tbaa !5
  %608 = add i32 %7, 5900
  %609 = zext i32 %608 to i64
  %610 = getelementptr inbounds float, float addrspace(1)* %1, i64 %609
  %611 = load float, float addrspace(1)* %610, align 4, !tbaa !5
  %612 = fmul contract float %607, %611
  %613 = fadd contract float %603, %612
  store float %613, float addrspace(1)* %15, align 4, !tbaa !5
  %614 = add i32 %12, 60
  %615 = zext i32 %614 to i64
  %616 = getelementptr inbounds float, float addrspace(1)* %0, i64 %615
  %617 = load float, float addrspace(1)* %616, align 4, !tbaa !5
  %618 = add i32 %7, 6000
  %619 = zext i32 %618 to i64
  %620 = getelementptr inbounds float, float addrspace(1)* %1, i64 %619
  %621 = load float, float addrspace(1)* %620, align 4, !tbaa !5
  %622 = fmul contract float %617, %621
  %623 = fadd contract float %613, %622
  store float %623, float addrspace(1)* %15, align 4, !tbaa !5
  %624 = add i32 %12, 61
  %625 = zext i32 %624 to i64
  %626 = getelementptr inbounds float, float addrspace(1)* %0, i64 %625
  %627 = load float, float addrspace(1)* %626, align 4, !tbaa !5
  %628 = add i32 %7, 6100
  %629 = zext i32 %628 to i64
  %630 = getelementptr inbounds float, float addrspace(1)* %1, i64 %629
  %631 = load float, float addrspace(1)* %630, align 4, !tbaa !5
  %632 = fmul contract float %627, %631
  %633 = fadd contract float %623, %632
  store float %633, float addrspace(1)* %15, align 4, !tbaa !5
  %634 = add i32 %12, 62
  %635 = zext i32 %634 to i64
  %636 = getelementptr inbounds float, float addrspace(1)* %0, i64 %635
  %637 = load float, float addrspace(1)* %636, align 4, !tbaa !5
  %638 = add i32 %7, 6200
  %639 = zext i32 %638 to i64
  %640 = getelementptr inbounds float, float addrspace(1)* %1, i64 %639
  %641 = load float, float addrspace(1)* %640, align 4, !tbaa !5
  %642 = fmul contract float %637, %641
  %643 = fadd contract float %633, %642
  store float %643, float addrspace(1)* %15, align 4, !tbaa !5
  %644 = add i32 %12, 63
  %645 = zext i32 %644 to i64
  %646 = getelementptr inbounds float, float addrspace(1)* %0, i64 %645
  %647 = load float, float addrspace(1)* %646, align 4, !tbaa !5
  %648 = add i32 %7, 6300
  %649 = zext i32 %648 to i64
  %650 = getelementptr inbounds float, float addrspace(1)* %1, i64 %649
  %651 = load float, float addrspace(1)* %650, align 4, !tbaa !5
  %652 = fmul contract float %647, %651
  %653 = fadd contract float %643, %652
  store float %653, float addrspace(1)* %15, align 4, !tbaa !5
  %654 = add i32 %12, 64
  %655 = zext i32 %654 to i64
  %656 = getelementptr inbounds float, float addrspace(1)* %0, i64 %655
  %657 = load float, float addrspace(1)* %656, align 4, !tbaa !5
  %658 = add i32 %7, 6400
  %659 = zext i32 %658 to i64
  %660 = getelementptr inbounds float, float addrspace(1)* %1, i64 %659
  %661 = load float, float addrspace(1)* %660, align 4, !tbaa !5
  %662 = fmul contract float %657, %661
  %663 = fadd contract float %653, %662
  store float %663, float addrspace(1)* %15, align 4, !tbaa !5
  %664 = add i32 %12, 65
  %665 = zext i32 %664 to i64
  %666 = getelementptr inbounds float, float addrspace(1)* %0, i64 %665
  %667 = load float, float addrspace(1)* %666, align 4, !tbaa !5
  %668 = add i32 %7, 6500
  %669 = zext i32 %668 to i64
  %670 = getelementptr inbounds float, float addrspace(1)* %1, i64 %669
  %671 = load float, float addrspace(1)* %670, align 4, !tbaa !5
  %672 = fmul contract float %667, %671
  %673 = fadd contract float %663, %672
  store float %673, float addrspace(1)* %15, align 4, !tbaa !5
  %674 = add i32 %12, 66
  %675 = zext i32 %674 to i64
  %676 = getelementptr inbounds float, float addrspace(1)* %0, i64 %675
  %677 = load float, float addrspace(1)* %676, align 4, !tbaa !5
  %678 = add i32 %7, 6600
  %679 = zext i32 %678 to i64
  %680 = getelementptr inbounds float, float addrspace(1)* %1, i64 %679
  %681 = load float, float addrspace(1)* %680, align 4, !tbaa !5
  %682 = fmul contract float %677, %681
  %683 = fadd contract float %673, %682
  store float %683, float addrspace(1)* %15, align 4, !tbaa !5
  %684 = add i32 %12, 67
  %685 = zext i32 %684 to i64
  %686 = getelementptr inbounds float, float addrspace(1)* %0, i64 %685
  %687 = load float, float addrspace(1)* %686, align 4, !tbaa !5
  %688 = add i32 %7, 6700
  %689 = zext i32 %688 to i64
  %690 = getelementptr inbounds float, float addrspace(1)* %1, i64 %689
  %691 = load float, float addrspace(1)* %690, align 4, !tbaa !5
  %692 = fmul contract float %687, %691
  %693 = fadd contract float %683, %692
  store float %693, float addrspace(1)* %15, align 4, !tbaa !5
  %694 = add i32 %12, 68
  %695 = zext i32 %694 to i64
  %696 = getelementptr inbounds float, float addrspace(1)* %0, i64 %695
  %697 = load float, float addrspace(1)* %696, align 4, !tbaa !5
  %698 = add i32 %7, 6800
  %699 = zext i32 %698 to i64
  %700 = getelementptr inbounds float, float addrspace(1)* %1, i64 %699
  %701 = load float, float addrspace(1)* %700, align 4, !tbaa !5
  %702 = fmul contract float %697, %701
  %703 = fadd contract float %693, %702
  store float %703, float addrspace(1)* %15, align 4, !tbaa !5
  %704 = add i32 %12, 69
  %705 = zext i32 %704 to i64
  %706 = getelementptr inbounds float, float addrspace(1)* %0, i64 %705
  %707 = load float, float addrspace(1)* %706, align 4, !tbaa !5
  %708 = add i32 %7, 6900
  %709 = zext i32 %708 to i64
  %710 = getelementptr inbounds float, float addrspace(1)* %1, i64 %709
  %711 = load float, float addrspace(1)* %710, align 4, !tbaa !5
  %712 = fmul contract float %707, %711
  %713 = fadd contract float %703, %712
  store float %713, float addrspace(1)* %15, align 4, !tbaa !5
  %714 = add i32 %12, 70
  %715 = zext i32 %714 to i64
  %716 = getelementptr inbounds float, float addrspace(1)* %0, i64 %715
  %717 = load float, float addrspace(1)* %716, align 4, !tbaa !5
  %718 = add i32 %7, 7000
  %719 = zext i32 %718 to i64
  %720 = getelementptr inbounds float, float addrspace(1)* %1, i64 %719
  %721 = load float, float addrspace(1)* %720, align 4, !tbaa !5
  %722 = fmul contract float %717, %721
  %723 = fadd contract float %713, %722
  store float %723, float addrspace(1)* %15, align 4, !tbaa !5
  %724 = add i32 %12, 71
  %725 = zext i32 %724 to i64
  %726 = getelementptr inbounds float, float addrspace(1)* %0, i64 %725
  %727 = load float, float addrspace(1)* %726, align 4, !tbaa !5
  %728 = add i32 %7, 7100
  %729 = zext i32 %728 to i64
  %730 = getelementptr inbounds float, float addrspace(1)* %1, i64 %729
  %731 = load float, float addrspace(1)* %730, align 4, !tbaa !5
  %732 = fmul contract float %727, %731
  %733 = fadd contract float %723, %732
  store float %733, float addrspace(1)* %15, align 4, !tbaa !5
  %734 = add i32 %12, 72
  %735 = zext i32 %734 to i64
  %736 = getelementptr inbounds float, float addrspace(1)* %0, i64 %735
  %737 = load float, float addrspace(1)* %736, align 4, !tbaa !5
  %738 = add i32 %7, 7200
  %739 = zext i32 %738 to i64
  %740 = getelementptr inbounds float, float addrspace(1)* %1, i64 %739
  %741 = load float, float addrspace(1)* %740, align 4, !tbaa !5
  %742 = fmul contract float %737, %741
  %743 = fadd contract float %733, %742
  store float %743, float addrspace(1)* %15, align 4, !tbaa !5
  %744 = add i32 %12, 73
  %745 = zext i32 %744 to i64
  %746 = getelementptr inbounds float, float addrspace(1)* %0, i64 %745
  %747 = load float, float addrspace(1)* %746, align 4, !tbaa !5
  %748 = add i32 %7, 7300
  %749 = zext i32 %748 to i64
  %750 = getelementptr inbounds float, float addrspace(1)* %1, i64 %749
  %751 = load float, float addrspace(1)* %750, align 4, !tbaa !5
  %752 = fmul contract float %747, %751
  %753 = fadd contract float %743, %752
  store float %753, float addrspace(1)* %15, align 4, !tbaa !5
  %754 = add i32 %12, 74
  %755 = zext i32 %754 to i64
  %756 = getelementptr inbounds float, float addrspace(1)* %0, i64 %755
  %757 = load float, float addrspace(1)* %756, align 4, !tbaa !5
  %758 = add i32 %7, 7400
  %759 = zext i32 %758 to i64
  %760 = getelementptr inbounds float, float addrspace(1)* %1, i64 %759
  %761 = load float, float addrspace(1)* %760, align 4, !tbaa !5
  %762 = fmul contract float %757, %761
  %763 = fadd contract float %753, %762
  store float %763, float addrspace(1)* %15, align 4, !tbaa !5
  %764 = add i32 %12, 75
  %765 = zext i32 %764 to i64
  %766 = getelementptr inbounds float, float addrspace(1)* %0, i64 %765
  %767 = load float, float addrspace(1)* %766, align 4, !tbaa !5
  %768 = add i32 %7, 7500
  %769 = zext i32 %768 to i64
  %770 = getelementptr inbounds float, float addrspace(1)* %1, i64 %769
  %771 = load float, float addrspace(1)* %770, align 4, !tbaa !5
  %772 = fmul contract float %767, %771
  %773 = fadd contract float %763, %772
  store float %773, float addrspace(1)* %15, align 4, !tbaa !5
  %774 = add i32 %12, 76
  %775 = zext i32 %774 to i64
  %776 = getelementptr inbounds float, float addrspace(1)* %0, i64 %775
  %777 = load float, float addrspace(1)* %776, align 4, !tbaa !5
  %778 = add i32 %7, 7600
  %779 = zext i32 %778 to i64
  %780 = getelementptr inbounds float, float addrspace(1)* %1, i64 %779
  %781 = load float, float addrspace(1)* %780, align 4, !tbaa !5
  %782 = fmul contract float %777, %781
  %783 = fadd contract float %773, %782
  store float %783, float addrspace(1)* %15, align 4, !tbaa !5
  %784 = add i32 %12, 77
  %785 = zext i32 %784 to i64
  %786 = getelementptr inbounds float, float addrspace(1)* %0, i64 %785
  %787 = load float, float addrspace(1)* %786, align 4, !tbaa !5
  %788 = add i32 %7, 7700
  %789 = zext i32 %788 to i64
  %790 = getelementptr inbounds float, float addrspace(1)* %1, i64 %789
  %791 = load float, float addrspace(1)* %790, align 4, !tbaa !5
  %792 = fmul contract float %787, %791
  %793 = fadd contract float %783, %792
  store float %793, float addrspace(1)* %15, align 4, !tbaa !5
  %794 = add i32 %12, 78
  %795 = zext i32 %794 to i64
  %796 = getelementptr inbounds float, float addrspace(1)* %0, i64 %795
  %797 = load float, float addrspace(1)* %796, align 4, !tbaa !5
  %798 = add i32 %7, 7800
  %799 = zext i32 %798 to i64
  %800 = getelementptr inbounds float, float addrspace(1)* %1, i64 %799
  %801 = load float, float addrspace(1)* %800, align 4, !tbaa !5
  %802 = fmul contract float %797, %801
  %803 = fadd contract float %793, %802
  store float %803, float addrspace(1)* %15, align 4, !tbaa !5
  %804 = add i32 %12, 79
  %805 = zext i32 %804 to i64
  %806 = getelementptr inbounds float, float addrspace(1)* %0, i64 %805
  %807 = load float, float addrspace(1)* %806, align 4, !tbaa !5
  %808 = add i32 %7, 7900
  %809 = zext i32 %808 to i64
  %810 = getelementptr inbounds float, float addrspace(1)* %1, i64 %809
  %811 = load float, float addrspace(1)* %810, align 4, !tbaa !5
  %812 = fmul contract float %807, %811
  %813 = fadd contract float %803, %812
  store float %813, float addrspace(1)* %15, align 4, !tbaa !5
  %814 = add i32 %12, 80
  %815 = zext i32 %814 to i64
  %816 = getelementptr inbounds float, float addrspace(1)* %0, i64 %815
  %817 = load float, float addrspace(1)* %816, align 4, !tbaa !5
  %818 = add i32 %7, 8000
  %819 = zext i32 %818 to i64
  %820 = getelementptr inbounds float, float addrspace(1)* %1, i64 %819
  %821 = load float, float addrspace(1)* %820, align 4, !tbaa !5
  %822 = fmul contract float %817, %821
  %823 = fadd contract float %813, %822
  store float %823, float addrspace(1)* %15, align 4, !tbaa !5
  %824 = add i32 %12, 81
  %825 = zext i32 %824 to i64
  %826 = getelementptr inbounds float, float addrspace(1)* %0, i64 %825
  %827 = load float, float addrspace(1)* %826, align 4, !tbaa !5
  %828 = add i32 %7, 8100
  %829 = zext i32 %828 to i64
  %830 = getelementptr inbounds float, float addrspace(1)* %1, i64 %829
  %831 = load float, float addrspace(1)* %830, align 4, !tbaa !5
  %832 = fmul contract float %827, %831
  %833 = fadd contract float %823, %832
  store float %833, float addrspace(1)* %15, align 4, !tbaa !5
  %834 = add i32 %12, 82
  %835 = zext i32 %834 to i64
  %836 = getelementptr inbounds float, float addrspace(1)* %0, i64 %835
  %837 = load float, float addrspace(1)* %836, align 4, !tbaa !5
  %838 = add i32 %7, 8200
  %839 = zext i32 %838 to i64
  %840 = getelementptr inbounds float, float addrspace(1)* %1, i64 %839
  %841 = load float, float addrspace(1)* %840, align 4, !tbaa !5
  %842 = fmul contract float %837, %841
  %843 = fadd contract float %833, %842
  store float %843, float addrspace(1)* %15, align 4, !tbaa !5
  %844 = add i32 %12, 83
  %845 = zext i32 %844 to i64
  %846 = getelementptr inbounds float, float addrspace(1)* %0, i64 %845
  %847 = load float, float addrspace(1)* %846, align 4, !tbaa !5
  %848 = add i32 %7, 8300
  %849 = zext i32 %848 to i64
  %850 = getelementptr inbounds float, float addrspace(1)* %1, i64 %849
  %851 = load float, float addrspace(1)* %850, align 4, !tbaa !5
  %852 = fmul contract float %847, %851
  %853 = fadd contract float %843, %852
  store float %853, float addrspace(1)* %15, align 4, !tbaa !5
  %854 = add i32 %12, 84
  %855 = zext i32 %854 to i64
  %856 = getelementptr inbounds float, float addrspace(1)* %0, i64 %855
  %857 = load float, float addrspace(1)* %856, align 4, !tbaa !5
  %858 = add i32 %7, 8400
  %859 = zext i32 %858 to i64
  %860 = getelementptr inbounds float, float addrspace(1)* %1, i64 %859
  %861 = load float, float addrspace(1)* %860, align 4, !tbaa !5
  %862 = fmul contract float %857, %861
  %863 = fadd contract float %853, %862
  store float %863, float addrspace(1)* %15, align 4, !tbaa !5
  %864 = add i32 %12, 85
  %865 = zext i32 %864 to i64
  %866 = getelementptr inbounds float, float addrspace(1)* %0, i64 %865
  %867 = load float, float addrspace(1)* %866, align 4, !tbaa !5
  %868 = add i32 %7, 8500
  %869 = zext i32 %868 to i64
  %870 = getelementptr inbounds float, float addrspace(1)* %1, i64 %869
  %871 = load float, float addrspace(1)* %870, align 4, !tbaa !5
  %872 = fmul contract float %867, %871
  %873 = fadd contract float %863, %872
  store float %873, float addrspace(1)* %15, align 4, !tbaa !5
  %874 = add i32 %12, 86
  %875 = zext i32 %874 to i64
  %876 = getelementptr inbounds float, float addrspace(1)* %0, i64 %875
  %877 = load float, float addrspace(1)* %876, align 4, !tbaa !5
  %878 = add i32 %7, 8600
  %879 = zext i32 %878 to i64
  %880 = getelementptr inbounds float, float addrspace(1)* %1, i64 %879
  %881 = load float, float addrspace(1)* %880, align 4, !tbaa !5
  %882 = fmul contract float %877, %881
  %883 = fadd contract float %873, %882
  store float %883, float addrspace(1)* %15, align 4, !tbaa !5
  %884 = add i32 %12, 87
  %885 = zext i32 %884 to i64
  %886 = getelementptr inbounds float, float addrspace(1)* %0, i64 %885
  %887 = load float, float addrspace(1)* %886, align 4, !tbaa !5
  %888 = add i32 %7, 8700
  %889 = zext i32 %888 to i64
  %890 = getelementptr inbounds float, float addrspace(1)* %1, i64 %889
  %891 = load float, float addrspace(1)* %890, align 4, !tbaa !5
  %892 = fmul contract float %887, %891
  %893 = fadd contract float %883, %892
  store float %893, float addrspace(1)* %15, align 4, !tbaa !5
  %894 = add i32 %12, 88
  %895 = zext i32 %894 to i64
  %896 = getelementptr inbounds float, float addrspace(1)* %0, i64 %895
  %897 = load float, float addrspace(1)* %896, align 4, !tbaa !5
  %898 = add i32 %7, 8800
  %899 = zext i32 %898 to i64
  %900 = getelementptr inbounds float, float addrspace(1)* %1, i64 %899
  %901 = load float, float addrspace(1)* %900, align 4, !tbaa !5
  %902 = fmul contract float %897, %901
  %903 = fadd contract float %893, %902
  store float %903, float addrspace(1)* %15, align 4, !tbaa !5
  %904 = add i32 %12, 89
  %905 = zext i32 %904 to i64
  %906 = getelementptr inbounds float, float addrspace(1)* %0, i64 %905
  %907 = load float, float addrspace(1)* %906, align 4, !tbaa !5
  %908 = add i32 %7, 8900
  %909 = zext i32 %908 to i64
  %910 = getelementptr inbounds float, float addrspace(1)* %1, i64 %909
  %911 = load float, float addrspace(1)* %910, align 4, !tbaa !5
  %912 = fmul contract float %907, %911
  %913 = fadd contract float %903, %912
  store float %913, float addrspace(1)* %15, align 4, !tbaa !5
  %914 = add i32 %12, 90
  %915 = zext i32 %914 to i64
  %916 = getelementptr inbounds float, float addrspace(1)* %0, i64 %915
  %917 = load float, float addrspace(1)* %916, align 4, !tbaa !5
  %918 = add i32 %7, 9000
  %919 = zext i32 %918 to i64
  %920 = getelementptr inbounds float, float addrspace(1)* %1, i64 %919
  %921 = load float, float addrspace(1)* %920, align 4, !tbaa !5
  %922 = fmul contract float %917, %921
  %923 = fadd contract float %913, %922
  store float %923, float addrspace(1)* %15, align 4, !tbaa !5
  %924 = add i32 %12, 91
  %925 = zext i32 %924 to i64
  %926 = getelementptr inbounds float, float addrspace(1)* %0, i64 %925
  %927 = load float, float addrspace(1)* %926, align 4, !tbaa !5
  %928 = add i32 %7, 9100
  %929 = zext i32 %928 to i64
  %930 = getelementptr inbounds float, float addrspace(1)* %1, i64 %929
  %931 = load float, float addrspace(1)* %930, align 4, !tbaa !5
  %932 = fmul contract float %927, %931
  %933 = fadd contract float %923, %932
  store float %933, float addrspace(1)* %15, align 4, !tbaa !5
  %934 = add i32 %12, 92
  %935 = zext i32 %934 to i64
  %936 = getelementptr inbounds float, float addrspace(1)* %0, i64 %935
  %937 = load float, float addrspace(1)* %936, align 4, !tbaa !5
  %938 = add i32 %7, 9200
  %939 = zext i32 %938 to i64
  %940 = getelementptr inbounds float, float addrspace(1)* %1, i64 %939
  %941 = load float, float addrspace(1)* %940, align 4, !tbaa !5
  %942 = fmul contract float %937, %941
  %943 = fadd contract float %933, %942
  store float %943, float addrspace(1)* %15, align 4, !tbaa !5
  %944 = add i32 %12, 93
  %945 = zext i32 %944 to i64
  %946 = getelementptr inbounds float, float addrspace(1)* %0, i64 %945
  %947 = load float, float addrspace(1)* %946, align 4, !tbaa !5
  %948 = add i32 %7, 9300
  %949 = zext i32 %948 to i64
  %950 = getelementptr inbounds float, float addrspace(1)* %1, i64 %949
  %951 = load float, float addrspace(1)* %950, align 4, !tbaa !5
  %952 = fmul contract float %947, %951
  %953 = fadd contract float %943, %952
  store float %953, float addrspace(1)* %15, align 4, !tbaa !5
  %954 = add i32 %12, 94
  %955 = zext i32 %954 to i64
  %956 = getelementptr inbounds float, float addrspace(1)* %0, i64 %955
  %957 = load float, float addrspace(1)* %956, align 4, !tbaa !5
  %958 = add i32 %7, 9400
  %959 = zext i32 %958 to i64
  %960 = getelementptr inbounds float, float addrspace(1)* %1, i64 %959
  %961 = load float, float addrspace(1)* %960, align 4, !tbaa !5
  %962 = fmul contract float %957, %961
  %963 = fadd contract float %953, %962
  store float %963, float addrspace(1)* %15, align 4, !tbaa !5
  %964 = add i32 %12, 95
  %965 = zext i32 %964 to i64
  %966 = getelementptr inbounds float, float addrspace(1)* %0, i64 %965
  %967 = load float, float addrspace(1)* %966, align 4, !tbaa !5
  %968 = add i32 %7, 9500
  %969 = zext i32 %968 to i64
  %970 = getelementptr inbounds float, float addrspace(1)* %1, i64 %969
  %971 = load float, float addrspace(1)* %970, align 4, !tbaa !5
  %972 = fmul contract float %967, %971
  %973 = fadd contract float %963, %972
  store float %973, float addrspace(1)* %15, align 4, !tbaa !5
  %974 = add i32 %12, 96
  %975 = zext i32 %974 to i64
  %976 = getelementptr inbounds float, float addrspace(1)* %0, i64 %975
  %977 = load float, float addrspace(1)* %976, align 4, !tbaa !5
  %978 = add i32 %7, 9600
  %979 = zext i32 %978 to i64
  %980 = getelementptr inbounds float, float addrspace(1)* %1, i64 %979
  %981 = load float, float addrspace(1)* %980, align 4, !tbaa !5
  %982 = fmul contract float %977, %981
  %983 = fadd contract float %973, %982
  store float %983, float addrspace(1)* %15, align 4, !tbaa !5
  %984 = add i32 %12, 97
  %985 = zext i32 %984 to i64
  %986 = getelementptr inbounds float, float addrspace(1)* %0, i64 %985
  %987 = load float, float addrspace(1)* %986, align 4, !tbaa !5
  %988 = add i32 %7, 9700
  %989 = zext i32 %988 to i64
  %990 = getelementptr inbounds float, float addrspace(1)* %1, i64 %989
  %991 = load float, float addrspace(1)* %990, align 4, !tbaa !5
  %992 = fmul contract float %987, %991
  %993 = fadd contract float %983, %992
  store float %993, float addrspace(1)* %15, align 4, !tbaa !5
  %994 = add i32 %12, 98
  %995 = zext i32 %994 to i64
  %996 = getelementptr inbounds float, float addrspace(1)* %0, i64 %995
  %997 = load float, float addrspace(1)* %996, align 4, !tbaa !5
  %998 = add i32 %7, 9800
  %999 = zext i32 %998 to i64
  %1000 = getelementptr inbounds float, float addrspace(1)* %1, i64 %999
  %1001 = load float, float addrspace(1)* %1000, align 4, !tbaa !5
  %1002 = fmul contract float %997, %1001
  %1003 = fadd contract float %993, %1002
  store float %1003, float addrspace(1)* %15, align 4, !tbaa !5
  %1004 = add i32 %12, 99
  %1005 = zext i32 %1004 to i64
  %1006 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1005
  %1007 = load float, float addrspace(1)* %1006, align 4, !tbaa !5
  %1008 = add i32 %7, 9900
  %1009 = zext i32 %1008 to i64
  %1010 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1009
  %1011 = load float, float addrspace(1)* %1010, align 4, !tbaa !5
  %1012 = fmul contract float %1007, %1011
  %1013 = fadd contract float %1003, %1012
  store float %1013, float addrspace(1)* %15, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
