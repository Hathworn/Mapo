; ModuleID = '../data/hip_kernels/12776/35/main.cu'
source_filename = "../data/hip_kernels/12776/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12forwardPass2PfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %15 = load float, float addrspace(1)* %0, align 4, !tbaa !7
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7
  %18 = fmul contract float %15, %17
  %19 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %20 = fadd contract float %19, %18
  store float %20, float addrspace(1)* %14, align 4, !tbaa !7
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7
  %23 = add nsw i32 %12, 10
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %27 = fmul contract float %22, %26
  %28 = fadd contract float %20, %27
  store float %28, float addrspace(1)* %14, align 4, !tbaa !7
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %31 = add nsw i32 %12, 20
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = fmul contract float %30, %34
  %36 = fadd contract float %28, %35
  store float %36, float addrspace(1)* %14, align 4, !tbaa !7
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 3
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = add nsw i32 %12, 30
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fmul contract float %38, %42
  %44 = fadd contract float %36, %43
  store float %44, float addrspace(1)* %14, align 4, !tbaa !7
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 4
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = add nsw i32 %12, 40
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fmul contract float %46, %50
  %52 = fadd contract float %44, %51
  store float %52, float addrspace(1)* %14, align 4, !tbaa !7
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 5
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = add nsw i32 %12, 50
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = fmul contract float %54, %58
  %60 = fadd contract float %52, %59
  store float %60, float addrspace(1)* %14, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 6
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = add nsw i32 %12, 60
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fmul contract float %62, %66
  %68 = fadd contract float %60, %67
  store float %68, float addrspace(1)* %14, align 4, !tbaa !7
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 7
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = add nsw i32 %12, 70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fmul contract float %70, %74
  %76 = fadd contract float %68, %75
  store float %76, float addrspace(1)* %14, align 4, !tbaa !7
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 8
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = add nsw i32 %12, 80
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fmul contract float %78, %82
  %84 = fadd contract float %76, %83
  store float %84, float addrspace(1)* %14, align 4, !tbaa !7
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 9
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = add nsw i32 %12, 90
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = fmul contract float %86, %90
  %92 = fadd contract float %84, %91
  store float %92, float addrspace(1)* %14, align 4, !tbaa !7
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 10
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = add nsw i32 %12, 100
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = fmul contract float %94, %98
  %100 = fadd contract float %92, %99
  store float %100, float addrspace(1)* %14, align 4, !tbaa !7
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 11
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = add nsw i32 %12, 110
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fmul contract float %102, %106
  %108 = fadd contract float %100, %107
  store float %108, float addrspace(1)* %14, align 4, !tbaa !7
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 12
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = add nsw i32 %12, 120
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = fmul contract float %110, %114
  %116 = fadd contract float %108, %115
  store float %116, float addrspace(1)* %14, align 4, !tbaa !7
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 13
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = add nsw i32 %12, 130
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fmul contract float %118, %122
  %124 = fadd contract float %116, %123
  store float %124, float addrspace(1)* %14, align 4, !tbaa !7
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 14
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %127 = add nsw i32 %12, 140
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %131 = fmul contract float %126, %130
  %132 = fadd contract float %124, %131
  store float %132, float addrspace(1)* %14, align 4, !tbaa !7
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 15
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = add nsw i32 %12, 150
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7
  %139 = fmul contract float %134, %138
  %140 = fadd contract float %132, %139
  store float %140, float addrspace(1)* %14, align 4, !tbaa !7
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 16
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7
  %143 = add nsw i32 %12, 160
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = fmul contract float %142, %146
  %148 = fadd contract float %140, %147
  store float %148, float addrspace(1)* %14, align 4, !tbaa !7
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 17
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = add nsw i32 %12, 170
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7
  %155 = fmul contract float %150, %154
  %156 = fadd contract float %148, %155
  store float %156, float addrspace(1)* %14, align 4, !tbaa !7
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 18
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %159 = add nsw i32 %12, 180
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %1, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7
  %163 = fmul contract float %158, %162
  %164 = fadd contract float %156, %163
  store float %164, float addrspace(1)* %14, align 4, !tbaa !7
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 19
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7
  %167 = add nsw i32 %12, 190
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %1, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = fmul contract float %166, %170
  %172 = fadd contract float %164, %171
  store float %172, float addrspace(1)* %14, align 4, !tbaa !7
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 20
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7
  %175 = add nsw i32 %12, 200
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %1, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !7
  %179 = fmul contract float %174, %178
  %180 = fadd contract float %172, %179
  store float %180, float addrspace(1)* %14, align 4, !tbaa !7
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 21
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7
  %183 = add nsw i32 %12, 210
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %1, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !7
  %187 = fmul contract float %182, %186
  %188 = fadd contract float %180, %187
  store float %188, float addrspace(1)* %14, align 4, !tbaa !7
  %189 = getelementptr inbounds float, float addrspace(1)* %0, i64 22
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !7
  %191 = add nsw i32 %12, 220
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %1, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = fmul contract float %190, %194
  %196 = fadd contract float %188, %195
  store float %196, float addrspace(1)* %14, align 4, !tbaa !7
  %197 = getelementptr inbounds float, float addrspace(1)* %0, i64 23
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !7
  %199 = add nsw i32 %12, 230
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %1, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !7
  %203 = fmul contract float %198, %202
  %204 = fadd contract float %196, %203
  store float %204, float addrspace(1)* %14, align 4, !tbaa !7
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 24
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !7
  %207 = add nsw i32 %12, 240
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %1, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  %211 = fmul contract float %206, %210
  %212 = fadd contract float %204, %211
  store float %212, float addrspace(1)* %14, align 4, !tbaa !7
  %213 = getelementptr inbounds float, float addrspace(1)* %0, i64 25
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7
  %215 = add nsw i32 %12, 250
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds float, float addrspace(1)* %1, i64 %216
  %218 = load float, float addrspace(1)* %217, align 4, !tbaa !7
  %219 = fmul contract float %214, %218
  %220 = fadd contract float %212, %219
  store float %220, float addrspace(1)* %14, align 4, !tbaa !7
  %221 = getelementptr inbounds float, float addrspace(1)* %0, i64 26
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !7
  %223 = add nsw i32 %12, 260
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %1, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = fmul contract float %222, %226
  %228 = fadd contract float %220, %227
  store float %228, float addrspace(1)* %14, align 4, !tbaa !7
  %229 = getelementptr inbounds float, float addrspace(1)* %0, i64 27
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !7
  %231 = add nsw i32 %12, 270
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds float, float addrspace(1)* %1, i64 %232
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !7
  %235 = fmul contract float %230, %234
  %236 = fadd contract float %228, %235
  store float %236, float addrspace(1)* %14, align 4, !tbaa !7
  %237 = getelementptr inbounds float, float addrspace(1)* %0, i64 28
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !7
  %239 = add nsw i32 %12, 280
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %1, i64 %240
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !7
  %243 = fmul contract float %238, %242
  %244 = fadd contract float %236, %243
  store float %244, float addrspace(1)* %14, align 4, !tbaa !7
  %245 = getelementptr inbounds float, float addrspace(1)* %0, i64 29
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !7
  %247 = add nsw i32 %12, 290
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %1, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7
  %251 = fmul contract float %246, %250
  %252 = fadd contract float %244, %251
  store float %252, float addrspace(1)* %14, align 4, !tbaa !7
  %253 = getelementptr inbounds float, float addrspace(1)* %0, i64 30
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !7
  %255 = add nsw i32 %12, 300
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %1, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !7
  %259 = fmul contract float %254, %258
  %260 = fadd contract float %252, %259
  store float %260, float addrspace(1)* %14, align 4, !tbaa !7
  %261 = getelementptr inbounds float, float addrspace(1)* %0, i64 31
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !7
  %263 = add nsw i32 %12, 310
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %1, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !7
  %267 = fmul contract float %262, %266
  %268 = fadd contract float %260, %267
  store float %268, float addrspace(1)* %14, align 4, !tbaa !7
  %269 = getelementptr inbounds float, float addrspace(1)* %0, i64 32
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !7
  %271 = add nsw i32 %12, 320
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %1, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %275 = fmul contract float %270, %274
  %276 = fadd contract float %268, %275
  store float %276, float addrspace(1)* %14, align 4, !tbaa !7
  %277 = getelementptr inbounds float, float addrspace(1)* %0, i64 33
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !7
  %279 = add nsw i32 %12, 330
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float addrspace(1)* %1, i64 %280
  %282 = load float, float addrspace(1)* %281, align 4, !tbaa !7
  %283 = fmul contract float %278, %282
  %284 = fadd contract float %276, %283
  store float %284, float addrspace(1)* %14, align 4, !tbaa !7
  %285 = getelementptr inbounds float, float addrspace(1)* %0, i64 34
  %286 = load float, float addrspace(1)* %285, align 4, !tbaa !7
  %287 = add nsw i32 %12, 340
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds float, float addrspace(1)* %1, i64 %288
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !7
  %291 = fmul contract float %286, %290
  %292 = fadd contract float %284, %291
  store float %292, float addrspace(1)* %14, align 4, !tbaa !7
  %293 = getelementptr inbounds float, float addrspace(1)* %0, i64 35
  %294 = load float, float addrspace(1)* %293, align 4, !tbaa !7
  %295 = add nsw i32 %12, 350
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds float, float addrspace(1)* %1, i64 %296
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !7
  %299 = fmul contract float %294, %298
  %300 = fadd contract float %292, %299
  store float %300, float addrspace(1)* %14, align 4, !tbaa !7
  %301 = getelementptr inbounds float, float addrspace(1)* %0, i64 36
  %302 = load float, float addrspace(1)* %301, align 4, !tbaa !7
  %303 = add nsw i32 %12, 360
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds float, float addrspace(1)* %1, i64 %304
  %306 = load float, float addrspace(1)* %305, align 4, !tbaa !7
  %307 = fmul contract float %302, %306
  %308 = fadd contract float %300, %307
  store float %308, float addrspace(1)* %14, align 4, !tbaa !7
  %309 = getelementptr inbounds float, float addrspace(1)* %0, i64 37
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !7
  %311 = add nsw i32 %12, 370
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds float, float addrspace(1)* %1, i64 %312
  %314 = load float, float addrspace(1)* %313, align 4, !tbaa !7
  %315 = fmul contract float %310, %314
  %316 = fadd contract float %308, %315
  store float %316, float addrspace(1)* %14, align 4, !tbaa !7
  %317 = getelementptr inbounds float, float addrspace(1)* %0, i64 38
  %318 = load float, float addrspace(1)* %317, align 4, !tbaa !7
  %319 = add nsw i32 %12, 380
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds float, float addrspace(1)* %1, i64 %320
  %322 = load float, float addrspace(1)* %321, align 4, !tbaa !7
  %323 = fmul contract float %318, %322
  %324 = fadd contract float %316, %323
  store float %324, float addrspace(1)* %14, align 4, !tbaa !7
  %325 = getelementptr inbounds float, float addrspace(1)* %0, i64 39
  %326 = load float, float addrspace(1)* %325, align 4, !tbaa !7
  %327 = add nsw i32 %12, 390
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds float, float addrspace(1)* %1, i64 %328
  %330 = load float, float addrspace(1)* %329, align 4, !tbaa !7
  %331 = fmul contract float %326, %330
  %332 = fadd contract float %324, %331
  store float %332, float addrspace(1)* %14, align 4, !tbaa !7
  %333 = getelementptr inbounds float, float addrspace(1)* %0, i64 40
  %334 = load float, float addrspace(1)* %333, align 4, !tbaa !7
  %335 = add nsw i32 %12, 400
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %1, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !7
  %339 = fmul contract float %334, %338
  %340 = fadd contract float %332, %339
  store float %340, float addrspace(1)* %14, align 4, !tbaa !7
  %341 = getelementptr inbounds float, float addrspace(1)* %0, i64 41
  %342 = load float, float addrspace(1)* %341, align 4, !tbaa !7
  %343 = add nsw i32 %12, 410
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %1, i64 %344
  %346 = load float, float addrspace(1)* %345, align 4, !tbaa !7
  %347 = fmul contract float %342, %346
  %348 = fadd contract float %340, %347
  store float %348, float addrspace(1)* %14, align 4, !tbaa !7
  %349 = getelementptr inbounds float, float addrspace(1)* %0, i64 42
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !7
  %351 = add nsw i32 %12, 420
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds float, float addrspace(1)* %1, i64 %352
  %354 = load float, float addrspace(1)* %353, align 4, !tbaa !7
  %355 = fmul contract float %350, %354
  %356 = fadd contract float %348, %355
  store float %356, float addrspace(1)* %14, align 4, !tbaa !7
  %357 = getelementptr inbounds float, float addrspace(1)* %0, i64 43
  %358 = load float, float addrspace(1)* %357, align 4, !tbaa !7
  %359 = add nsw i32 %12, 430
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds float, float addrspace(1)* %1, i64 %360
  %362 = load float, float addrspace(1)* %361, align 4, !tbaa !7
  %363 = fmul contract float %358, %362
  %364 = fadd contract float %356, %363
  store float %364, float addrspace(1)* %14, align 4, !tbaa !7
  %365 = getelementptr inbounds float, float addrspace(1)* %0, i64 44
  %366 = load float, float addrspace(1)* %365, align 4, !tbaa !7
  %367 = add nsw i32 %12, 440
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds float, float addrspace(1)* %1, i64 %368
  %370 = load float, float addrspace(1)* %369, align 4, !tbaa !7
  %371 = fmul contract float %366, %370
  %372 = fadd contract float %364, %371
  store float %372, float addrspace(1)* %14, align 4, !tbaa !7
  %373 = getelementptr inbounds float, float addrspace(1)* %0, i64 45
  %374 = load float, float addrspace(1)* %373, align 4, !tbaa !7
  %375 = add nsw i32 %12, 450
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %1, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !7
  %379 = fmul contract float %374, %378
  %380 = fadd contract float %372, %379
  store float %380, float addrspace(1)* %14, align 4, !tbaa !7
  %381 = getelementptr inbounds float, float addrspace(1)* %0, i64 46
  %382 = load float, float addrspace(1)* %381, align 4, !tbaa !7
  %383 = add nsw i32 %12, 460
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds float, float addrspace(1)* %1, i64 %384
  %386 = load float, float addrspace(1)* %385, align 4, !tbaa !7
  %387 = fmul contract float %382, %386
  %388 = fadd contract float %380, %387
  store float %388, float addrspace(1)* %14, align 4, !tbaa !7
  %389 = getelementptr inbounds float, float addrspace(1)* %0, i64 47
  %390 = load float, float addrspace(1)* %389, align 4, !tbaa !7
  %391 = add nsw i32 %12, 470
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds float, float addrspace(1)* %1, i64 %392
  %394 = load float, float addrspace(1)* %393, align 4, !tbaa !7
  %395 = fmul contract float %390, %394
  %396 = fadd contract float %388, %395
  store float %396, float addrspace(1)* %14, align 4, !tbaa !7
  %397 = getelementptr inbounds float, float addrspace(1)* %0, i64 48
  %398 = load float, float addrspace(1)* %397, align 4, !tbaa !7
  %399 = add nsw i32 %12, 480
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds float, float addrspace(1)* %1, i64 %400
  %402 = load float, float addrspace(1)* %401, align 4, !tbaa !7
  %403 = fmul contract float %398, %402
  %404 = fadd contract float %396, %403
  store float %404, float addrspace(1)* %14, align 4, !tbaa !7
  %405 = getelementptr inbounds float, float addrspace(1)* %0, i64 49
  %406 = load float, float addrspace(1)* %405, align 4, !tbaa !7
  %407 = add nsw i32 %12, 490
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds float, float addrspace(1)* %1, i64 %408
  %410 = load float, float addrspace(1)* %409, align 4, !tbaa !7
  %411 = fmul contract float %406, %410
  %412 = fadd contract float %404, %411
  store float %412, float addrspace(1)* %14, align 4, !tbaa !7
  %413 = getelementptr inbounds float, float addrspace(1)* %0, i64 50
  %414 = load float, float addrspace(1)* %413, align 4, !tbaa !7
  %415 = add nsw i32 %12, 500
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds float, float addrspace(1)* %1, i64 %416
  %418 = load float, float addrspace(1)* %417, align 4, !tbaa !7
  %419 = fmul contract float %414, %418
  %420 = fadd contract float %412, %419
  store float %420, float addrspace(1)* %14, align 4, !tbaa !7
  %421 = getelementptr inbounds float, float addrspace(1)* %0, i64 51
  %422 = load float, float addrspace(1)* %421, align 4, !tbaa !7
  %423 = add nsw i32 %12, 510
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds float, float addrspace(1)* %1, i64 %424
  %426 = load float, float addrspace(1)* %425, align 4, !tbaa !7
  %427 = fmul contract float %422, %426
  %428 = fadd contract float %420, %427
  store float %428, float addrspace(1)* %14, align 4, !tbaa !7
  %429 = getelementptr inbounds float, float addrspace(1)* %0, i64 52
  %430 = load float, float addrspace(1)* %429, align 4, !tbaa !7
  %431 = add nsw i32 %12, 520
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds float, float addrspace(1)* %1, i64 %432
  %434 = load float, float addrspace(1)* %433, align 4, !tbaa !7
  %435 = fmul contract float %430, %434
  %436 = fadd contract float %428, %435
  store float %436, float addrspace(1)* %14, align 4, !tbaa !7
  %437 = getelementptr inbounds float, float addrspace(1)* %0, i64 53
  %438 = load float, float addrspace(1)* %437, align 4, !tbaa !7
  %439 = add nsw i32 %12, 530
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds float, float addrspace(1)* %1, i64 %440
  %442 = load float, float addrspace(1)* %441, align 4, !tbaa !7
  %443 = fmul contract float %438, %442
  %444 = fadd contract float %436, %443
  store float %444, float addrspace(1)* %14, align 4, !tbaa !7
  %445 = getelementptr inbounds float, float addrspace(1)* %0, i64 54
  %446 = load float, float addrspace(1)* %445, align 4, !tbaa !7
  %447 = add nsw i32 %12, 540
  %448 = sext i32 %447 to i64
  %449 = getelementptr inbounds float, float addrspace(1)* %1, i64 %448
  %450 = load float, float addrspace(1)* %449, align 4, !tbaa !7
  %451 = fmul contract float %446, %450
  %452 = fadd contract float %444, %451
  store float %452, float addrspace(1)* %14, align 4, !tbaa !7
  %453 = getelementptr inbounds float, float addrspace(1)* %0, i64 55
  %454 = load float, float addrspace(1)* %453, align 4, !tbaa !7
  %455 = add nsw i32 %12, 550
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds float, float addrspace(1)* %1, i64 %456
  %458 = load float, float addrspace(1)* %457, align 4, !tbaa !7
  %459 = fmul contract float %454, %458
  %460 = fadd contract float %452, %459
  store float %460, float addrspace(1)* %14, align 4, !tbaa !7
  %461 = getelementptr inbounds float, float addrspace(1)* %0, i64 56
  %462 = load float, float addrspace(1)* %461, align 4, !tbaa !7
  %463 = add nsw i32 %12, 560
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds float, float addrspace(1)* %1, i64 %464
  %466 = load float, float addrspace(1)* %465, align 4, !tbaa !7
  %467 = fmul contract float %462, %466
  %468 = fadd contract float %460, %467
  store float %468, float addrspace(1)* %14, align 4, !tbaa !7
  %469 = getelementptr inbounds float, float addrspace(1)* %0, i64 57
  %470 = load float, float addrspace(1)* %469, align 4, !tbaa !7
  %471 = add nsw i32 %12, 570
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds float, float addrspace(1)* %1, i64 %472
  %474 = load float, float addrspace(1)* %473, align 4, !tbaa !7
  %475 = fmul contract float %470, %474
  %476 = fadd contract float %468, %475
  store float %476, float addrspace(1)* %14, align 4, !tbaa !7
  %477 = getelementptr inbounds float, float addrspace(1)* %0, i64 58
  %478 = load float, float addrspace(1)* %477, align 4, !tbaa !7
  %479 = add nsw i32 %12, 580
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds float, float addrspace(1)* %1, i64 %480
  %482 = load float, float addrspace(1)* %481, align 4, !tbaa !7
  %483 = fmul contract float %478, %482
  %484 = fadd contract float %476, %483
  store float %484, float addrspace(1)* %14, align 4, !tbaa !7
  %485 = getelementptr inbounds float, float addrspace(1)* %0, i64 59
  %486 = load float, float addrspace(1)* %485, align 4, !tbaa !7
  %487 = add nsw i32 %12, 590
  %488 = sext i32 %487 to i64
  %489 = getelementptr inbounds float, float addrspace(1)* %1, i64 %488
  %490 = load float, float addrspace(1)* %489, align 4, !tbaa !7
  %491 = fmul contract float %486, %490
  %492 = fadd contract float %484, %491
  store float %492, float addrspace(1)* %14, align 4, !tbaa !7
  %493 = getelementptr inbounds float, float addrspace(1)* %0, i64 60
  %494 = load float, float addrspace(1)* %493, align 4, !tbaa !7
  %495 = add nsw i32 %12, 600
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds float, float addrspace(1)* %1, i64 %496
  %498 = load float, float addrspace(1)* %497, align 4, !tbaa !7
  %499 = fmul contract float %494, %498
  %500 = fadd contract float %492, %499
  store float %500, float addrspace(1)* %14, align 4, !tbaa !7
  %501 = getelementptr inbounds float, float addrspace(1)* %0, i64 61
  %502 = load float, float addrspace(1)* %501, align 4, !tbaa !7
  %503 = add nsw i32 %12, 610
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds float, float addrspace(1)* %1, i64 %504
  %506 = load float, float addrspace(1)* %505, align 4, !tbaa !7
  %507 = fmul contract float %502, %506
  %508 = fadd contract float %500, %507
  store float %508, float addrspace(1)* %14, align 4, !tbaa !7
  %509 = getelementptr inbounds float, float addrspace(1)* %0, i64 62
  %510 = load float, float addrspace(1)* %509, align 4, !tbaa !7
  %511 = add nsw i32 %12, 620
  %512 = sext i32 %511 to i64
  %513 = getelementptr inbounds float, float addrspace(1)* %1, i64 %512
  %514 = load float, float addrspace(1)* %513, align 4, !tbaa !7
  %515 = fmul contract float %510, %514
  %516 = fadd contract float %508, %515
  store float %516, float addrspace(1)* %14, align 4, !tbaa !7
  %517 = getelementptr inbounds float, float addrspace(1)* %0, i64 63
  %518 = load float, float addrspace(1)* %517, align 4, !tbaa !7
  %519 = add nsw i32 %12, 630
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds float, float addrspace(1)* %1, i64 %520
  %522 = load float, float addrspace(1)* %521, align 4, !tbaa !7
  %523 = fmul contract float %518, %522
  %524 = fadd contract float %516, %523
  store float %524, float addrspace(1)* %14, align 4, !tbaa !7
  %525 = getelementptr inbounds float, float addrspace(1)* %0, i64 64
  %526 = load float, float addrspace(1)* %525, align 4, !tbaa !7
  %527 = add nsw i32 %12, 640
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds float, float addrspace(1)* %1, i64 %528
  %530 = load float, float addrspace(1)* %529, align 4, !tbaa !7
  %531 = fmul contract float %526, %530
  %532 = fadd contract float %524, %531
  store float %532, float addrspace(1)* %14, align 4, !tbaa !7
  %533 = getelementptr inbounds float, float addrspace(1)* %0, i64 65
  %534 = load float, float addrspace(1)* %533, align 4, !tbaa !7
  %535 = add nsw i32 %12, 650
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds float, float addrspace(1)* %1, i64 %536
  %538 = load float, float addrspace(1)* %537, align 4, !tbaa !7
  %539 = fmul contract float %534, %538
  %540 = fadd contract float %532, %539
  store float %540, float addrspace(1)* %14, align 4, !tbaa !7
  %541 = getelementptr inbounds float, float addrspace(1)* %0, i64 66
  %542 = load float, float addrspace(1)* %541, align 4, !tbaa !7
  %543 = add nsw i32 %12, 660
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds float, float addrspace(1)* %1, i64 %544
  %546 = load float, float addrspace(1)* %545, align 4, !tbaa !7
  %547 = fmul contract float %542, %546
  %548 = fadd contract float %540, %547
  store float %548, float addrspace(1)* %14, align 4, !tbaa !7
  %549 = getelementptr inbounds float, float addrspace(1)* %0, i64 67
  %550 = load float, float addrspace(1)* %549, align 4, !tbaa !7
  %551 = add nsw i32 %12, 670
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds float, float addrspace(1)* %1, i64 %552
  %554 = load float, float addrspace(1)* %553, align 4, !tbaa !7
  %555 = fmul contract float %550, %554
  %556 = fadd contract float %548, %555
  store float %556, float addrspace(1)* %14, align 4, !tbaa !7
  %557 = getelementptr inbounds float, float addrspace(1)* %0, i64 68
  %558 = load float, float addrspace(1)* %557, align 4, !tbaa !7
  %559 = add nsw i32 %12, 680
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds float, float addrspace(1)* %1, i64 %560
  %562 = load float, float addrspace(1)* %561, align 4, !tbaa !7
  %563 = fmul contract float %558, %562
  %564 = fadd contract float %556, %563
  store float %564, float addrspace(1)* %14, align 4, !tbaa !7
  %565 = getelementptr inbounds float, float addrspace(1)* %0, i64 69
  %566 = load float, float addrspace(1)* %565, align 4, !tbaa !7
  %567 = add nsw i32 %12, 690
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds float, float addrspace(1)* %1, i64 %568
  %570 = load float, float addrspace(1)* %569, align 4, !tbaa !7
  %571 = fmul contract float %566, %570
  %572 = fadd contract float %564, %571
  store float %572, float addrspace(1)* %14, align 4, !tbaa !7
  %573 = getelementptr inbounds float, float addrspace(1)* %0, i64 70
  %574 = load float, float addrspace(1)* %573, align 4, !tbaa !7
  %575 = add nsw i32 %12, 700
  %576 = sext i32 %575 to i64
  %577 = getelementptr inbounds float, float addrspace(1)* %1, i64 %576
  %578 = load float, float addrspace(1)* %577, align 4, !tbaa !7
  %579 = fmul contract float %574, %578
  %580 = fadd contract float %572, %579
  store float %580, float addrspace(1)* %14, align 4, !tbaa !7
  %581 = getelementptr inbounds float, float addrspace(1)* %0, i64 71
  %582 = load float, float addrspace(1)* %581, align 4, !tbaa !7
  %583 = add nsw i32 %12, 710
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds float, float addrspace(1)* %1, i64 %584
  %586 = load float, float addrspace(1)* %585, align 4, !tbaa !7
  %587 = fmul contract float %582, %586
  %588 = fadd contract float %580, %587
  store float %588, float addrspace(1)* %14, align 4, !tbaa !7
  %589 = getelementptr inbounds float, float addrspace(1)* %0, i64 72
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !7
  %591 = add nsw i32 %12, 720
  %592 = sext i32 %591 to i64
  %593 = getelementptr inbounds float, float addrspace(1)* %1, i64 %592
  %594 = load float, float addrspace(1)* %593, align 4, !tbaa !7
  %595 = fmul contract float %590, %594
  %596 = fadd contract float %588, %595
  store float %596, float addrspace(1)* %14, align 4, !tbaa !7
  %597 = getelementptr inbounds float, float addrspace(1)* %0, i64 73
  %598 = load float, float addrspace(1)* %597, align 4, !tbaa !7
  %599 = add nsw i32 %12, 730
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds float, float addrspace(1)* %1, i64 %600
  %602 = load float, float addrspace(1)* %601, align 4, !tbaa !7
  %603 = fmul contract float %598, %602
  %604 = fadd contract float %596, %603
  store float %604, float addrspace(1)* %14, align 4, !tbaa !7
  %605 = getelementptr inbounds float, float addrspace(1)* %0, i64 74
  %606 = load float, float addrspace(1)* %605, align 4, !tbaa !7
  %607 = add nsw i32 %12, 740
  %608 = sext i32 %607 to i64
  %609 = getelementptr inbounds float, float addrspace(1)* %1, i64 %608
  %610 = load float, float addrspace(1)* %609, align 4, !tbaa !7
  %611 = fmul contract float %606, %610
  %612 = fadd contract float %604, %611
  store float %612, float addrspace(1)* %14, align 4, !tbaa !7
  %613 = getelementptr inbounds float, float addrspace(1)* %0, i64 75
  %614 = load float, float addrspace(1)* %613, align 4, !tbaa !7
  %615 = add nsw i32 %12, 750
  %616 = sext i32 %615 to i64
  %617 = getelementptr inbounds float, float addrspace(1)* %1, i64 %616
  %618 = load float, float addrspace(1)* %617, align 4, !tbaa !7
  %619 = fmul contract float %614, %618
  %620 = fadd contract float %612, %619
  store float %620, float addrspace(1)* %14, align 4, !tbaa !7
  %621 = getelementptr inbounds float, float addrspace(1)* %0, i64 76
  %622 = load float, float addrspace(1)* %621, align 4, !tbaa !7
  %623 = add nsw i32 %12, 760
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds float, float addrspace(1)* %1, i64 %624
  %626 = load float, float addrspace(1)* %625, align 4, !tbaa !7
  %627 = fmul contract float %622, %626
  %628 = fadd contract float %620, %627
  store float %628, float addrspace(1)* %14, align 4, !tbaa !7
  %629 = getelementptr inbounds float, float addrspace(1)* %0, i64 77
  %630 = load float, float addrspace(1)* %629, align 4, !tbaa !7
  %631 = add nsw i32 %12, 770
  %632 = sext i32 %631 to i64
  %633 = getelementptr inbounds float, float addrspace(1)* %1, i64 %632
  %634 = load float, float addrspace(1)* %633, align 4, !tbaa !7
  %635 = fmul contract float %630, %634
  %636 = fadd contract float %628, %635
  store float %636, float addrspace(1)* %14, align 4, !tbaa !7
  %637 = getelementptr inbounds float, float addrspace(1)* %0, i64 78
  %638 = load float, float addrspace(1)* %637, align 4, !tbaa !7
  %639 = add nsw i32 %12, 780
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds float, float addrspace(1)* %1, i64 %640
  %642 = load float, float addrspace(1)* %641, align 4, !tbaa !7
  %643 = fmul contract float %638, %642
  %644 = fadd contract float %636, %643
  store float %644, float addrspace(1)* %14, align 4, !tbaa !7
  %645 = getelementptr inbounds float, float addrspace(1)* %0, i64 79
  %646 = load float, float addrspace(1)* %645, align 4, !tbaa !7
  %647 = add nsw i32 %12, 790
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds float, float addrspace(1)* %1, i64 %648
  %650 = load float, float addrspace(1)* %649, align 4, !tbaa !7
  %651 = fmul contract float %646, %650
  %652 = fadd contract float %644, %651
  store float %652, float addrspace(1)* %14, align 4, !tbaa !7
  %653 = getelementptr inbounds float, float addrspace(1)* %0, i64 80
  %654 = load float, float addrspace(1)* %653, align 4, !tbaa !7
  %655 = add nsw i32 %12, 800
  %656 = sext i32 %655 to i64
  %657 = getelementptr inbounds float, float addrspace(1)* %1, i64 %656
  %658 = load float, float addrspace(1)* %657, align 4, !tbaa !7
  %659 = fmul contract float %654, %658
  %660 = fadd contract float %652, %659
  store float %660, float addrspace(1)* %14, align 4, !tbaa !7
  %661 = getelementptr inbounds float, float addrspace(1)* %0, i64 81
  %662 = load float, float addrspace(1)* %661, align 4, !tbaa !7
  %663 = add nsw i32 %12, 810
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds float, float addrspace(1)* %1, i64 %664
  %666 = load float, float addrspace(1)* %665, align 4, !tbaa !7
  %667 = fmul contract float %662, %666
  %668 = fadd contract float %660, %667
  store float %668, float addrspace(1)* %14, align 4, !tbaa !7
  %669 = getelementptr inbounds float, float addrspace(1)* %0, i64 82
  %670 = load float, float addrspace(1)* %669, align 4, !tbaa !7
  %671 = add nsw i32 %12, 820
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds float, float addrspace(1)* %1, i64 %672
  %674 = load float, float addrspace(1)* %673, align 4, !tbaa !7
  %675 = fmul contract float %670, %674
  %676 = fadd contract float %668, %675
  store float %676, float addrspace(1)* %14, align 4, !tbaa !7
  %677 = getelementptr inbounds float, float addrspace(1)* %0, i64 83
  %678 = load float, float addrspace(1)* %677, align 4, !tbaa !7
  %679 = add nsw i32 %12, 830
  %680 = sext i32 %679 to i64
  %681 = getelementptr inbounds float, float addrspace(1)* %1, i64 %680
  %682 = load float, float addrspace(1)* %681, align 4, !tbaa !7
  %683 = fmul contract float %678, %682
  %684 = fadd contract float %676, %683
  store float %684, float addrspace(1)* %14, align 4, !tbaa !7
  %685 = getelementptr inbounds float, float addrspace(1)* %0, i64 84
  %686 = load float, float addrspace(1)* %685, align 4, !tbaa !7
  %687 = add nsw i32 %12, 840
  %688 = sext i32 %687 to i64
  %689 = getelementptr inbounds float, float addrspace(1)* %1, i64 %688
  %690 = load float, float addrspace(1)* %689, align 4, !tbaa !7
  %691 = fmul contract float %686, %690
  %692 = fadd contract float %684, %691
  store float %692, float addrspace(1)* %14, align 4, !tbaa !7
  %693 = getelementptr inbounds float, float addrspace(1)* %0, i64 85
  %694 = load float, float addrspace(1)* %693, align 4, !tbaa !7
  %695 = add nsw i32 %12, 850
  %696 = sext i32 %695 to i64
  %697 = getelementptr inbounds float, float addrspace(1)* %1, i64 %696
  %698 = load float, float addrspace(1)* %697, align 4, !tbaa !7
  %699 = fmul contract float %694, %698
  %700 = fadd contract float %692, %699
  store float %700, float addrspace(1)* %14, align 4, !tbaa !7
  %701 = getelementptr inbounds float, float addrspace(1)* %0, i64 86
  %702 = load float, float addrspace(1)* %701, align 4, !tbaa !7
  %703 = add nsw i32 %12, 860
  %704 = sext i32 %703 to i64
  %705 = getelementptr inbounds float, float addrspace(1)* %1, i64 %704
  %706 = load float, float addrspace(1)* %705, align 4, !tbaa !7
  %707 = fmul contract float %702, %706
  %708 = fadd contract float %700, %707
  store float %708, float addrspace(1)* %14, align 4, !tbaa !7
  %709 = getelementptr inbounds float, float addrspace(1)* %0, i64 87
  %710 = load float, float addrspace(1)* %709, align 4, !tbaa !7
  %711 = add nsw i32 %12, 870
  %712 = sext i32 %711 to i64
  %713 = getelementptr inbounds float, float addrspace(1)* %1, i64 %712
  %714 = load float, float addrspace(1)* %713, align 4, !tbaa !7
  %715 = fmul contract float %710, %714
  %716 = fadd contract float %708, %715
  store float %716, float addrspace(1)* %14, align 4, !tbaa !7
  %717 = getelementptr inbounds float, float addrspace(1)* %0, i64 88
  %718 = load float, float addrspace(1)* %717, align 4, !tbaa !7
  %719 = add nsw i32 %12, 880
  %720 = sext i32 %719 to i64
  %721 = getelementptr inbounds float, float addrspace(1)* %1, i64 %720
  %722 = load float, float addrspace(1)* %721, align 4, !tbaa !7
  %723 = fmul contract float %718, %722
  %724 = fadd contract float %716, %723
  store float %724, float addrspace(1)* %14, align 4, !tbaa !7
  %725 = getelementptr inbounds float, float addrspace(1)* %0, i64 89
  %726 = load float, float addrspace(1)* %725, align 4, !tbaa !7
  %727 = add nsw i32 %12, 890
  %728 = sext i32 %727 to i64
  %729 = getelementptr inbounds float, float addrspace(1)* %1, i64 %728
  %730 = load float, float addrspace(1)* %729, align 4, !tbaa !7
  %731 = fmul contract float %726, %730
  %732 = fadd contract float %724, %731
  store float %732, float addrspace(1)* %14, align 4, !tbaa !7
  %733 = getelementptr inbounds float, float addrspace(1)* %0, i64 90
  %734 = load float, float addrspace(1)* %733, align 4, !tbaa !7
  %735 = add nsw i32 %12, 900
  %736 = sext i32 %735 to i64
  %737 = getelementptr inbounds float, float addrspace(1)* %1, i64 %736
  %738 = load float, float addrspace(1)* %737, align 4, !tbaa !7
  %739 = fmul contract float %734, %738
  %740 = fadd contract float %732, %739
  store float %740, float addrspace(1)* %14, align 4, !tbaa !7
  %741 = getelementptr inbounds float, float addrspace(1)* %0, i64 91
  %742 = load float, float addrspace(1)* %741, align 4, !tbaa !7
  %743 = add nsw i32 %12, 910
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds float, float addrspace(1)* %1, i64 %744
  %746 = load float, float addrspace(1)* %745, align 4, !tbaa !7
  %747 = fmul contract float %742, %746
  %748 = fadd contract float %740, %747
  store float %748, float addrspace(1)* %14, align 4, !tbaa !7
  %749 = getelementptr inbounds float, float addrspace(1)* %0, i64 92
  %750 = load float, float addrspace(1)* %749, align 4, !tbaa !7
  %751 = add nsw i32 %12, 920
  %752 = sext i32 %751 to i64
  %753 = getelementptr inbounds float, float addrspace(1)* %1, i64 %752
  %754 = load float, float addrspace(1)* %753, align 4, !tbaa !7
  %755 = fmul contract float %750, %754
  %756 = fadd contract float %748, %755
  store float %756, float addrspace(1)* %14, align 4, !tbaa !7
  %757 = getelementptr inbounds float, float addrspace(1)* %0, i64 93
  %758 = load float, float addrspace(1)* %757, align 4, !tbaa !7
  %759 = add nsw i32 %12, 930
  %760 = sext i32 %759 to i64
  %761 = getelementptr inbounds float, float addrspace(1)* %1, i64 %760
  %762 = load float, float addrspace(1)* %761, align 4, !tbaa !7
  %763 = fmul contract float %758, %762
  %764 = fadd contract float %756, %763
  store float %764, float addrspace(1)* %14, align 4, !tbaa !7
  %765 = getelementptr inbounds float, float addrspace(1)* %0, i64 94
  %766 = load float, float addrspace(1)* %765, align 4, !tbaa !7
  %767 = add nsw i32 %12, 940
  %768 = sext i32 %767 to i64
  %769 = getelementptr inbounds float, float addrspace(1)* %1, i64 %768
  %770 = load float, float addrspace(1)* %769, align 4, !tbaa !7
  %771 = fmul contract float %766, %770
  %772 = fadd contract float %764, %771
  store float %772, float addrspace(1)* %14, align 4, !tbaa !7
  %773 = getelementptr inbounds float, float addrspace(1)* %0, i64 95
  %774 = load float, float addrspace(1)* %773, align 4, !tbaa !7
  %775 = add nsw i32 %12, 950
  %776 = sext i32 %775 to i64
  %777 = getelementptr inbounds float, float addrspace(1)* %1, i64 %776
  %778 = load float, float addrspace(1)* %777, align 4, !tbaa !7
  %779 = fmul contract float %774, %778
  %780 = fadd contract float %772, %779
  store float %780, float addrspace(1)* %14, align 4, !tbaa !7
  %781 = getelementptr inbounds float, float addrspace(1)* %0, i64 96
  %782 = load float, float addrspace(1)* %781, align 4, !tbaa !7
  %783 = add nsw i32 %12, 960
  %784 = sext i32 %783 to i64
  %785 = getelementptr inbounds float, float addrspace(1)* %1, i64 %784
  %786 = load float, float addrspace(1)* %785, align 4, !tbaa !7
  %787 = fmul contract float %782, %786
  %788 = fadd contract float %780, %787
  store float %788, float addrspace(1)* %14, align 4, !tbaa !7
  %789 = getelementptr inbounds float, float addrspace(1)* %0, i64 97
  %790 = load float, float addrspace(1)* %789, align 4, !tbaa !7
  %791 = add nsw i32 %12, 970
  %792 = sext i32 %791 to i64
  %793 = getelementptr inbounds float, float addrspace(1)* %1, i64 %792
  %794 = load float, float addrspace(1)* %793, align 4, !tbaa !7
  %795 = fmul contract float %790, %794
  %796 = fadd contract float %788, %795
  store float %796, float addrspace(1)* %14, align 4, !tbaa !7
  %797 = getelementptr inbounds float, float addrspace(1)* %0, i64 98
  %798 = load float, float addrspace(1)* %797, align 4, !tbaa !7
  %799 = add nsw i32 %12, 980
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds float, float addrspace(1)* %1, i64 %800
  %802 = load float, float addrspace(1)* %801, align 4, !tbaa !7
  %803 = fmul contract float %798, %802
  %804 = fadd contract float %796, %803
  store float %804, float addrspace(1)* %14, align 4, !tbaa !7
  %805 = getelementptr inbounds float, float addrspace(1)* %0, i64 99
  %806 = load float, float addrspace(1)* %805, align 4, !tbaa !7
  %807 = add nsw i32 %12, 990
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds float, float addrspace(1)* %1, i64 %808
  %810 = load float, float addrspace(1)* %809, align 4, !tbaa !7
  %811 = fmul contract float %806, %810
  %812 = fadd contract float %804, %811
  store float %812, float addrspace(1)* %14, align 4, !tbaa !7
  %813 = getelementptr inbounds float, float addrspace(1)* %0, i64 100
  %814 = load float, float addrspace(1)* %813, align 4, !tbaa !7
  %815 = add nsw i32 %12, 1000
  %816 = sext i32 %815 to i64
  %817 = getelementptr inbounds float, float addrspace(1)* %1, i64 %816
  %818 = load float, float addrspace(1)* %817, align 4, !tbaa !7
  %819 = fmul contract float %814, %818
  %820 = fadd contract float %812, %819
  store float %820, float addrspace(1)* %14, align 4, !tbaa !7
  %821 = getelementptr inbounds float, float addrspace(1)* %0, i64 101
  %822 = load float, float addrspace(1)* %821, align 4, !tbaa !7
  %823 = add nsw i32 %12, 1010
  %824 = sext i32 %823 to i64
  %825 = getelementptr inbounds float, float addrspace(1)* %1, i64 %824
  %826 = load float, float addrspace(1)* %825, align 4, !tbaa !7
  %827 = fmul contract float %822, %826
  %828 = fadd contract float %820, %827
  store float %828, float addrspace(1)* %14, align 4, !tbaa !7
  %829 = getelementptr inbounds float, float addrspace(1)* %0, i64 102
  %830 = load float, float addrspace(1)* %829, align 4, !tbaa !7
  %831 = add nsw i32 %12, 1020
  %832 = sext i32 %831 to i64
  %833 = getelementptr inbounds float, float addrspace(1)* %1, i64 %832
  %834 = load float, float addrspace(1)* %833, align 4, !tbaa !7
  %835 = fmul contract float %830, %834
  %836 = fadd contract float %828, %835
  store float %836, float addrspace(1)* %14, align 4, !tbaa !7
  %837 = getelementptr inbounds float, float addrspace(1)* %0, i64 103
  %838 = load float, float addrspace(1)* %837, align 4, !tbaa !7
  %839 = add nsw i32 %12, 1030
  %840 = sext i32 %839 to i64
  %841 = getelementptr inbounds float, float addrspace(1)* %1, i64 %840
  %842 = load float, float addrspace(1)* %841, align 4, !tbaa !7
  %843 = fmul contract float %838, %842
  %844 = fadd contract float %836, %843
  store float %844, float addrspace(1)* %14, align 4, !tbaa !7
  %845 = getelementptr inbounds float, float addrspace(1)* %0, i64 104
  %846 = load float, float addrspace(1)* %845, align 4, !tbaa !7
  %847 = add nsw i32 %12, 1040
  %848 = sext i32 %847 to i64
  %849 = getelementptr inbounds float, float addrspace(1)* %1, i64 %848
  %850 = load float, float addrspace(1)* %849, align 4, !tbaa !7
  %851 = fmul contract float %846, %850
  %852 = fadd contract float %844, %851
  store float %852, float addrspace(1)* %14, align 4, !tbaa !7
  %853 = getelementptr inbounds float, float addrspace(1)* %0, i64 105
  %854 = load float, float addrspace(1)* %853, align 4, !tbaa !7
  %855 = add nsw i32 %12, 1050
  %856 = sext i32 %855 to i64
  %857 = getelementptr inbounds float, float addrspace(1)* %1, i64 %856
  %858 = load float, float addrspace(1)* %857, align 4, !tbaa !7
  %859 = fmul contract float %854, %858
  %860 = fadd contract float %852, %859
  store float %860, float addrspace(1)* %14, align 4, !tbaa !7
  %861 = getelementptr inbounds float, float addrspace(1)* %0, i64 106
  %862 = load float, float addrspace(1)* %861, align 4, !tbaa !7
  %863 = add nsw i32 %12, 1060
  %864 = sext i32 %863 to i64
  %865 = getelementptr inbounds float, float addrspace(1)* %1, i64 %864
  %866 = load float, float addrspace(1)* %865, align 4, !tbaa !7
  %867 = fmul contract float %862, %866
  %868 = fadd contract float %860, %867
  store float %868, float addrspace(1)* %14, align 4, !tbaa !7
  %869 = getelementptr inbounds float, float addrspace(1)* %0, i64 107
  %870 = load float, float addrspace(1)* %869, align 4, !tbaa !7
  %871 = add nsw i32 %12, 1070
  %872 = sext i32 %871 to i64
  %873 = getelementptr inbounds float, float addrspace(1)* %1, i64 %872
  %874 = load float, float addrspace(1)* %873, align 4, !tbaa !7
  %875 = fmul contract float %870, %874
  %876 = fadd contract float %868, %875
  store float %876, float addrspace(1)* %14, align 4, !tbaa !7
  %877 = getelementptr inbounds float, float addrspace(1)* %0, i64 108
  %878 = load float, float addrspace(1)* %877, align 4, !tbaa !7
  %879 = add nsw i32 %12, 1080
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds float, float addrspace(1)* %1, i64 %880
  %882 = load float, float addrspace(1)* %881, align 4, !tbaa !7
  %883 = fmul contract float %878, %882
  %884 = fadd contract float %876, %883
  store float %884, float addrspace(1)* %14, align 4, !tbaa !7
  %885 = getelementptr inbounds float, float addrspace(1)* %0, i64 109
  %886 = load float, float addrspace(1)* %885, align 4, !tbaa !7
  %887 = add nsw i32 %12, 1090
  %888 = sext i32 %887 to i64
  %889 = getelementptr inbounds float, float addrspace(1)* %1, i64 %888
  %890 = load float, float addrspace(1)* %889, align 4, !tbaa !7
  %891 = fmul contract float %886, %890
  %892 = fadd contract float %884, %891
  store float %892, float addrspace(1)* %14, align 4, !tbaa !7
  %893 = getelementptr inbounds float, float addrspace(1)* %0, i64 110
  %894 = load float, float addrspace(1)* %893, align 4, !tbaa !7
  %895 = add nsw i32 %12, 1100
  %896 = sext i32 %895 to i64
  %897 = getelementptr inbounds float, float addrspace(1)* %1, i64 %896
  %898 = load float, float addrspace(1)* %897, align 4, !tbaa !7
  %899 = fmul contract float %894, %898
  %900 = fadd contract float %892, %899
  store float %900, float addrspace(1)* %14, align 4, !tbaa !7
  %901 = getelementptr inbounds float, float addrspace(1)* %0, i64 111
  %902 = load float, float addrspace(1)* %901, align 4, !tbaa !7
  %903 = add nsw i32 %12, 1110
  %904 = sext i32 %903 to i64
  %905 = getelementptr inbounds float, float addrspace(1)* %1, i64 %904
  %906 = load float, float addrspace(1)* %905, align 4, !tbaa !7
  %907 = fmul contract float %902, %906
  %908 = fadd contract float %900, %907
  store float %908, float addrspace(1)* %14, align 4, !tbaa !7
  %909 = getelementptr inbounds float, float addrspace(1)* %0, i64 112
  %910 = load float, float addrspace(1)* %909, align 4, !tbaa !7
  %911 = add nsw i32 %12, 1120
  %912 = sext i32 %911 to i64
  %913 = getelementptr inbounds float, float addrspace(1)* %1, i64 %912
  %914 = load float, float addrspace(1)* %913, align 4, !tbaa !7
  %915 = fmul contract float %910, %914
  %916 = fadd contract float %908, %915
  store float %916, float addrspace(1)* %14, align 4, !tbaa !7
  %917 = getelementptr inbounds float, float addrspace(1)* %0, i64 113
  %918 = load float, float addrspace(1)* %917, align 4, !tbaa !7
  %919 = add nsw i32 %12, 1130
  %920 = sext i32 %919 to i64
  %921 = getelementptr inbounds float, float addrspace(1)* %1, i64 %920
  %922 = load float, float addrspace(1)* %921, align 4, !tbaa !7
  %923 = fmul contract float %918, %922
  %924 = fadd contract float %916, %923
  store float %924, float addrspace(1)* %14, align 4, !tbaa !7
  %925 = getelementptr inbounds float, float addrspace(1)* %0, i64 114
  %926 = load float, float addrspace(1)* %925, align 4, !tbaa !7
  %927 = add nsw i32 %12, 1140
  %928 = sext i32 %927 to i64
  %929 = getelementptr inbounds float, float addrspace(1)* %1, i64 %928
  %930 = load float, float addrspace(1)* %929, align 4, !tbaa !7
  %931 = fmul contract float %926, %930
  %932 = fadd contract float %924, %931
  store float %932, float addrspace(1)* %14, align 4, !tbaa !7
  %933 = getelementptr inbounds float, float addrspace(1)* %0, i64 115
  %934 = load float, float addrspace(1)* %933, align 4, !tbaa !7
  %935 = add nsw i32 %12, 1150
  %936 = sext i32 %935 to i64
  %937 = getelementptr inbounds float, float addrspace(1)* %1, i64 %936
  %938 = load float, float addrspace(1)* %937, align 4, !tbaa !7
  %939 = fmul contract float %934, %938
  %940 = fadd contract float %932, %939
  store float %940, float addrspace(1)* %14, align 4, !tbaa !7
  %941 = getelementptr inbounds float, float addrspace(1)* %0, i64 116
  %942 = load float, float addrspace(1)* %941, align 4, !tbaa !7
  %943 = add nsw i32 %12, 1160
  %944 = sext i32 %943 to i64
  %945 = getelementptr inbounds float, float addrspace(1)* %1, i64 %944
  %946 = load float, float addrspace(1)* %945, align 4, !tbaa !7
  %947 = fmul contract float %942, %946
  %948 = fadd contract float %940, %947
  store float %948, float addrspace(1)* %14, align 4, !tbaa !7
  %949 = getelementptr inbounds float, float addrspace(1)* %0, i64 117
  %950 = load float, float addrspace(1)* %949, align 4, !tbaa !7
  %951 = add nsw i32 %12, 1170
  %952 = sext i32 %951 to i64
  %953 = getelementptr inbounds float, float addrspace(1)* %1, i64 %952
  %954 = load float, float addrspace(1)* %953, align 4, !tbaa !7
  %955 = fmul contract float %950, %954
  %956 = fadd contract float %948, %955
  store float %956, float addrspace(1)* %14, align 4, !tbaa !7
  %957 = getelementptr inbounds float, float addrspace(1)* %0, i64 118
  %958 = load float, float addrspace(1)* %957, align 4, !tbaa !7
  %959 = add nsw i32 %12, 1180
  %960 = sext i32 %959 to i64
  %961 = getelementptr inbounds float, float addrspace(1)* %1, i64 %960
  %962 = load float, float addrspace(1)* %961, align 4, !tbaa !7
  %963 = fmul contract float %958, %962
  %964 = fadd contract float %956, %963
  store float %964, float addrspace(1)* %14, align 4, !tbaa !7
  %965 = getelementptr inbounds float, float addrspace(1)* %0, i64 119
  %966 = load float, float addrspace(1)* %965, align 4, !tbaa !7
  %967 = add nsw i32 %12, 1190
  %968 = sext i32 %967 to i64
  %969 = getelementptr inbounds float, float addrspace(1)* %1, i64 %968
  %970 = load float, float addrspace(1)* %969, align 4, !tbaa !7
  %971 = fmul contract float %966, %970
  %972 = fadd contract float %964, %971
  store float %972, float addrspace(1)* %14, align 4, !tbaa !7
  %973 = getelementptr inbounds float, float addrspace(1)* %0, i64 120
  %974 = load float, float addrspace(1)* %973, align 4, !tbaa !7
  %975 = add nsw i32 %12, 1200
  %976 = sext i32 %975 to i64
  %977 = getelementptr inbounds float, float addrspace(1)* %1, i64 %976
  %978 = load float, float addrspace(1)* %977, align 4, !tbaa !7
  %979 = fmul contract float %974, %978
  %980 = fadd contract float %972, %979
  store float %980, float addrspace(1)* %14, align 4, !tbaa !7
  %981 = getelementptr inbounds float, float addrspace(1)* %0, i64 121
  %982 = load float, float addrspace(1)* %981, align 4, !tbaa !7
  %983 = add nsw i32 %12, 1210
  %984 = sext i32 %983 to i64
  %985 = getelementptr inbounds float, float addrspace(1)* %1, i64 %984
  %986 = load float, float addrspace(1)* %985, align 4, !tbaa !7
  %987 = fmul contract float %982, %986
  %988 = fadd contract float %980, %987
  store float %988, float addrspace(1)* %14, align 4, !tbaa !7
  %989 = getelementptr inbounds float, float addrspace(1)* %0, i64 122
  %990 = load float, float addrspace(1)* %989, align 4, !tbaa !7
  %991 = add nsw i32 %12, 1220
  %992 = sext i32 %991 to i64
  %993 = getelementptr inbounds float, float addrspace(1)* %1, i64 %992
  %994 = load float, float addrspace(1)* %993, align 4, !tbaa !7
  %995 = fmul contract float %990, %994
  %996 = fadd contract float %988, %995
  store float %996, float addrspace(1)* %14, align 4, !tbaa !7
  %997 = getelementptr inbounds float, float addrspace(1)* %0, i64 123
  %998 = load float, float addrspace(1)* %997, align 4, !tbaa !7
  %999 = add nsw i32 %12, 1230
  %1000 = sext i32 %999 to i64
  %1001 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1000
  %1002 = load float, float addrspace(1)* %1001, align 4, !tbaa !7
  %1003 = fmul contract float %998, %1002
  %1004 = fadd contract float %996, %1003
  store float %1004, float addrspace(1)* %14, align 4, !tbaa !7
  %1005 = getelementptr inbounds float, float addrspace(1)* %0, i64 124
  %1006 = load float, float addrspace(1)* %1005, align 4, !tbaa !7
  %1007 = add nsw i32 %12, 1240
  %1008 = sext i32 %1007 to i64
  %1009 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1008
  %1010 = load float, float addrspace(1)* %1009, align 4, !tbaa !7
  %1011 = fmul contract float %1006, %1010
  %1012 = fadd contract float %1004, %1011
  store float %1012, float addrspace(1)* %14, align 4, !tbaa !7
  %1013 = getelementptr inbounds float, float addrspace(1)* %0, i64 125
  %1014 = load float, float addrspace(1)* %1013, align 4, !tbaa !7
  %1015 = add nsw i32 %12, 1250
  %1016 = sext i32 %1015 to i64
  %1017 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1016
  %1018 = load float, float addrspace(1)* %1017, align 4, !tbaa !7
  %1019 = fmul contract float %1014, %1018
  %1020 = fadd contract float %1012, %1019
  store float %1020, float addrspace(1)* %14, align 4, !tbaa !7
  %1021 = getelementptr inbounds float, float addrspace(1)* %0, i64 126
  %1022 = load float, float addrspace(1)* %1021, align 4, !tbaa !7
  %1023 = add nsw i32 %12, 1260
  %1024 = sext i32 %1023 to i64
  %1025 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1024
  %1026 = load float, float addrspace(1)* %1025, align 4, !tbaa !7
  %1027 = fmul contract float %1022, %1026
  %1028 = fadd contract float %1020, %1027
  store float %1028, float addrspace(1)* %14, align 4, !tbaa !7
  %1029 = getelementptr inbounds float, float addrspace(1)* %0, i64 127
  %1030 = load float, float addrspace(1)* %1029, align 4, !tbaa !7
  %1031 = add nsw i32 %12, 1270
  %1032 = sext i32 %1031 to i64
  %1033 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1032
  %1034 = load float, float addrspace(1)* %1033, align 4, !tbaa !7
  %1035 = fmul contract float %1030, %1034
  %1036 = fadd contract float %1028, %1035
  %1037 = fmul float %1036, 0x3FF7154760000000
  %1038 = tail call float @llvm.rint.f32(float %1037)
  %1039 = fcmp ogt float %1036, 0x40562E4300000000
  %1040 = fcmp olt float %1036, 0xC059D1DA00000000
  %1041 = fneg float %1037
  %1042 = tail call float @llvm.fma.f32(float %1036, float 0x3FF7154760000000, float %1041)
  %1043 = tail call float @llvm.fma.f32(float %1036, float 0x3E54AE0BE0000000, float %1042)
  %1044 = fsub float %1037, %1038
  %1045 = fadd float %1043, %1044
  %1046 = tail call float @llvm.exp2.f32(float %1045)
  %1047 = fptosi float %1038 to i32
  %1048 = tail call float @llvm.amdgcn.ldexp.f32(float %1046, i32 %1047)
  %1049 = select i1 %1040, float 0.000000e+00, float %1048
  %1050 = select i1 %1039, float 0x7FF0000000000000, float %1049
  %1051 = fpext float %1050 to double
  %1052 = fadd contract double %1051, 1.000000e+00
  %1053 = fdiv contract double 1.000000e+00, %1052
  %1054 = fptrunc double %1053 to float
  store float %1054, float addrspace(1)* %14, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
