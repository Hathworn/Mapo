; ModuleID = '../data/hip_kernels/14769/1/main.cu'
source_filename = "../data/hip_kernels/14769/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9iterationPfiiE4f_sh = internal unnamed_addr addrspace(3) global [26 x [26 x [9 x float]]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9iterationPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %6, 24
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = mul i32 %8, 24
  %10 = add nsw i32 %7, %4
  %11 = add nsw i32 %9, %5
  %12 = mul nsw i32 %10, %2
  %13 = add i32 %12, %11
  %14 = mul i32 %13, 9
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %5, i32 0
  store float %17, float addrspace(3)* %18, align 4, !tbaa !5
  %19 = add nsw i32 %14, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %5, i32 1
  store float %22, float addrspace(3)* %23, align 4, !tbaa !5
  %24 = add nsw i32 %14, 2
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %5, i32 2
  store float %27, float addrspace(3)* %28, align 4, !tbaa !5
  %29 = add nsw i32 %14, 3
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %5, i32 3
  store float %32, float addrspace(3)* %33, align 4, !tbaa !5
  %34 = add nsw i32 %14, 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %5, i32 4
  store float %37, float addrspace(3)* %38, align 4, !tbaa !5
  %39 = add nsw i32 %14, 5
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %5, i32 5
  store float %42, float addrspace(3)* %43, align 4, !tbaa !5
  %44 = add nsw i32 %14, 6
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %5, i32 6
  store float %47, float addrspace(3)* %48, align 4, !tbaa !5
  %49 = add nsw i32 %14, 7
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %5, i32 7
  store float %52, float addrspace(3)* %53, align 4, !tbaa !5
  %54 = add nsw i32 %14, 8
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %5, i32 8
  store float %57, float addrspace(3)* %58, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %60 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %61 = fadd contract float %59, %60
  %62 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %63 = fadd contract float %61, %62
  %64 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %65 = fadd contract float %63, %64
  %66 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %67 = fadd contract float %65, %66
  %68 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %69 = fadd contract float %67, %68
  %70 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %71 = fadd contract float %69, %70
  %72 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %73 = fadd contract float %71, %72
  %74 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %75 = fadd contract float %73, %74
  %76 = fsub contract float %60, %62
  %77 = fadd contract float %76, %68
  %78 = fsub contract float %77, %70
  %79 = fsub contract float %78, %72
  %80 = fadd contract float %79, %74
  %81 = fsub contract float %64, %66
  %82 = fadd contract float %81, %68
  %83 = fadd contract float %82, %70
  %84 = fsub contract float %83, %72
  %85 = fsub contract float %84, %74
  %86 = fdiv contract float %80, %75
  %87 = fdiv contract float %85, %75
  %88 = fmul contract float %86, %86
  %89 = fmul contract float %87, %87
  %90 = fmul contract float %86, 2.000000e+00
  %91 = fmul contract float %87, %90
  %92 = fadd contract float %88, %89
  %93 = fmul contract float %75, 2.000000e+00
  %94 = fmul contract float %93, 0.000000e+00
  %95 = fmul contract float %86, %94
  %96 = fmul contract float %87, %94
  %97 = fmul contract float %87, 0.000000e+00
  %98 = fmul contract float %86, 0.000000e+00
  %99 = fadd contract float %97, %98
  %100 = fmul contract float %93, %99
  %101 = fadd contract float %95, %96
  %102 = fmul contract float %75, 0.000000e+00
  %103 = fmul contract float %75, 0x3FDC71C720000000
  %104 = fpext float %103 to double
  %105 = fpext float %92 to double
  %106 = fmul contract double %105, 1.500000e+00
  %107 = fsub contract double 1.000000e+00, %106
  %108 = fmul contract double %107, %104
  %109 = fpext float %59 to double
  %110 = fsub contract double %108, %109
  %111 = fpext float %101 to double
  %112 = fmul contract double %111, 0x3FE5555558000000
  %113 = fsub contract double %110, %112
  %114 = fadd contract double %113, %109
  %115 = fptrunc double %114 to float
  store float %115, float addrspace(3)* %18, align 4, !tbaa !5
  %116 = fmul contract float %75, 0x3FBC71C720000000
  %117 = fpext float %116 to double
  %118 = fmul contract float %86, 3.000000e+00
  %119 = fadd contract float %118, 1.000000e+00
  %120 = fpext float %119 to double
  %121 = fpext float %88 to double
  %122 = fmul contract double %121, 4.500000e+00
  %123 = fadd contract double %122, %120
  %124 = fsub contract double %123, %106
  %125 = fmul contract double %124, %117
  %126 = fpext float %60 to double
  %127 = fsub contract double %125, %126
  %128 = fmul contract float %102, 3.000000e+00
  %129 = fpext float %128 to double
  %130 = fpext float %95 to double
  %131 = fmul contract double %130, 4.500000e+00
  %132 = fadd contract double %131, %129
  %133 = fmul contract double %111, 1.500000e+00
  %134 = fsub contract double %132, %133
  %135 = fmul contract double %134, 0x3FBC71C720000000
  %136 = fadd contract double %127, %135
  %137 = fadd contract double %136, %126
  %138 = fptrunc double %137 to float
  store float %138, float addrspace(3)* %23, align 4, !tbaa !5
  %139 = fsub contract float 1.000000e+00, %118
  %140 = fpext float %139 to double
  %141 = fadd contract double %122, %140
  %142 = fsub contract double %141, %106
  %143 = fmul contract double %142, %117
  %144 = fpext float %62 to double
  %145 = fsub contract double %143, %144
  %146 = fmul contract float %102, -3.000000e+00
  %147 = fpext float %146 to double
  %148 = fadd contract double %131, %147
  %149 = fsub contract double %148, %133
  %150 = fmul contract double %149, 0x3FBC71C720000000
  %151 = fadd contract double %145, %150
  %152 = fadd contract double %151, %144
  %153 = fptrunc double %152 to float
  store float %153, float addrspace(3)* %28, align 4, !tbaa !5
  %154 = fmul contract float %87, 3.000000e+00
  %155 = fadd contract float %154, 1.000000e+00
  %156 = fpext float %155 to double
  %157 = fpext float %89 to double
  %158 = fmul contract double %157, 4.500000e+00
  %159 = fadd contract double %158, %156
  %160 = fsub contract double %159, %106
  %161 = fmul contract double %160, %117
  %162 = fpext float %64 to double
  %163 = fsub contract double %161, %162
  %164 = fpext float %96 to double
  %165 = fmul contract double %164, 4.500000e+00
  %166 = fadd contract double %165, %129
  %167 = fsub contract double %166, %133
  %168 = fmul contract double %167, 0x3FBC71C720000000
  %169 = fadd contract double %163, %168
  %170 = fadd contract double %169, %162
  %171 = fptrunc double %170 to float
  store float %171, float addrspace(3)* %33, align 4, !tbaa !5
  %172 = fsub contract float 1.000000e+00, %154
  %173 = fpext float %172 to double
  %174 = fadd contract double %158, %173
  %175 = fsub contract double %174, %106
  %176 = fmul contract double %175, %117
  %177 = fpext float %66 to double
  %178 = fsub contract double %176, %177
  %179 = fadd contract double %165, %147
  %180 = fsub contract double %179, %133
  %181 = fmul contract double %180, 0x3FBC71C720000000
  %182 = fadd contract double %178, %181
  %183 = fadd contract double %182, %177
  %184 = fptrunc double %183 to float
  store float %184, float addrspace(3)* %38, align 4, !tbaa !5
  %185 = fmul contract float %75, 0x3F9C71C720000000
  %186 = fpext float %185 to double
  %187 = fadd contract float %86, %87
  %188 = fmul contract float %187, 3.000000e+00
  %189 = fadd contract float %188, 1.000000e+00
  %190 = fpext float %189 to double
  %191 = fadd contract float %88, %91
  %192 = fadd contract float %89, %191
  %193 = fpext float %192 to double
  %194 = fmul contract double %193, 4.500000e+00
  %195 = fadd contract double %194, %190
  %196 = fsub contract double %195, %106
  %197 = fmul contract double %196, %186
  %198 = fpext float %68 to double
  %199 = fsub contract double %197, %198
  %200 = fadd contract float %102, %102
  %201 = fmul contract float %200, 3.000000e+00
  %202 = fpext float %201 to double
  %203 = fadd contract float %95, %100
  %204 = fadd contract float %96, %203
  %205 = fpext float %204 to double
  %206 = fmul contract double %205, 4.500000e+00
  %207 = fadd contract double %206, %202
  %208 = fsub contract double %207, %133
  %209 = fmul contract double %208, 0x3F9C71C720000000
  %210 = fadd contract double %199, %209
  %211 = fadd contract double %210, %198
  %212 = fptrunc double %211 to float
  store float %212, float addrspace(3)* %43, align 4, !tbaa !5
  %213 = fneg contract float %86
  %214 = fsub contract float %87, %86
  %215 = fmul contract float %214, 3.000000e+00
  %216 = fadd contract float %215, 1.000000e+00
  %217 = fpext float %216 to double
  %218 = fsub contract float %88, %91
  %219 = fadd contract float %89, %218
  %220 = fpext float %219 to double
  %221 = fmul contract double %220, 4.500000e+00
  %222 = fadd contract double %221, %217
  %223 = fsub contract double %222, %106
  %224 = fmul contract double %223, %186
  %225 = fpext float %70 to double
  %226 = fsub contract double %224, %225
  %227 = fneg contract float %102
  %228 = fsub contract float %102, %102
  %229 = fmul contract float %228, 3.000000e+00
  %230 = fpext float %229 to double
  %231 = fsub contract float %95, %100
  %232 = fadd contract float %96, %231
  %233 = fpext float %232 to double
  %234 = fmul contract double %233, 4.500000e+00
  %235 = fadd contract double %234, %230
  %236 = fsub contract double %235, %133
  %237 = fmul contract double %236, 0x3F9C71C720000000
  %238 = fadd contract double %226, %237
  %239 = fadd contract double %238, %225
  %240 = fptrunc double %239 to float
  store float %240, float addrspace(3)* %48, align 4, !tbaa !5
  %241 = fsub contract float %213, %87
  %242 = fmul contract float %241, 3.000000e+00
  %243 = fadd contract float %242, 1.000000e+00
  %244 = fpext float %243 to double
  %245 = fadd contract double %194, %244
  %246 = fsub contract double %245, %106
  %247 = fmul contract double %246, %186
  %248 = fpext float %72 to double
  %249 = fsub contract double %247, %248
  %250 = fsub contract float %227, %102
  %251 = fmul contract float %250, 3.000000e+00
  %252 = fpext float %251 to double
  %253 = fadd contract double %206, %252
  %254 = fsub contract double %253, %133
  %255 = fmul contract double %254, 0x3F9C71C720000000
  %256 = fadd contract double %249, %255
  %257 = fadd contract double %256, %248
  %258 = fptrunc double %257 to float
  store float %258, float addrspace(3)* %53, align 4, !tbaa !5
  %259 = fsub contract float %86, %87
  %260 = fmul contract float %259, 3.000000e+00
  %261 = fadd contract float %260, 1.000000e+00
  %262 = fpext float %261 to double
  %263 = fadd contract double %221, %262
  %264 = fsub contract double %263, %106
  %265 = fmul contract double %264, %186
  %266 = fpext float %74 to double
  %267 = fsub contract double %265, %266
  %268 = fadd contract double %267, %237
  %269 = fadd contract double %268, %266
  %270 = fptrunc double %269 to float
  store float %270, float addrspace(3)* %58, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %271 = add nsw i32 %4, -1
  %272 = icmp ult i32 %271, 24
  %273 = icmp ne i32 %5, 0
  %274 = select i1 %272, i1 %273, i1 false
  %275 = icmp ult i32 %5, 25
  %276 = select i1 %274, i1 %275, i1 false
  br i1 %276, label %277, label %298

277:                                              ; preds = %3
  %278 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  store float %278, float addrspace(1)* %16, align 4, !tbaa !5
  %279 = add nuw nsw i32 %4, 1
  %280 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %279, i32 %5, i32 2
  %281 = load float, float addrspace(3)* %280, align 4, !tbaa !5
  store float %281, float addrspace(1)* %26, align 4, !tbaa !5
  %282 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %271, i32 %5, i32 1
  %283 = load float, float addrspace(3)* %282, align 4, !tbaa !5
  store float %283, float addrspace(1)* %21, align 4, !tbaa !5
  %284 = add nuw nsw i32 %5, 1
  %285 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %284, i32 4
  %286 = load float, float addrspace(3)* %285, align 4, !tbaa !5
  store float %286, float addrspace(1)* %36, align 4, !tbaa !5
  %287 = add nsw i32 %5, -1
  %288 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %4, i32 %287, i32 3
  %289 = load float, float addrspace(3)* %288, align 4, !tbaa !5
  store float %289, float addrspace(1)* %31, align 4, !tbaa !5
  %290 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %279, i32 %284, i32 7
  %291 = load float, float addrspace(3)* %290, align 4, !tbaa !5
  store float %291, float addrspace(1)* %51, align 4, !tbaa !5
  %292 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %271, i32 %287, i32 5
  %293 = load float, float addrspace(3)* %292, align 4, !tbaa !5
  store float %293, float addrspace(1)* %41, align 4, !tbaa !5
  %294 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %279, i32 %287, i32 6
  %295 = load float, float addrspace(3)* %294, align 4, !tbaa !5
  store float %295, float addrspace(1)* %46, align 4, !tbaa !5
  %296 = getelementptr inbounds [26 x [26 x [9 x float]]], [26 x [26 x [9 x float]]] addrspace(3)* @_ZZ9iterationPfiiE4f_sh, i32 0, i32 %271, i32 %284, i32 8
  %297 = load float, float addrspace(3)* %296, align 4, !tbaa !5
  store float %297, float addrspace(1)* %56, align 4, !tbaa !5
  br label %298

298:                                              ; preds = %277, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %299 = icmp eq i32 %10, 0
  br i1 %299, label %300, label %367

300:                                              ; preds = %298
  %301 = add nsw i32 %1, -2
  %302 = mul i32 %2, 9
  %303 = mul i32 %302, %301
  %304 = mul nsw i32 %11, 9
  %305 = add i32 %304, %303
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %0, i64 %306
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !5
  %309 = sext i32 %304 to i64
  %310 = getelementptr inbounds float, float addrspace(1)* %0, i64 %309
  store float %308, float addrspace(1)* %310, align 4, !tbaa !5
  %311 = add i32 %304, 1
  %312 = add i32 %311, %303
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds float, float addrspace(1)* %0, i64 %313
  %315 = load float, float addrspace(1)* %314, align 4, !tbaa !5
  %316 = sext i32 %311 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %0, i64 %316
  store float %315, float addrspace(1)* %317, align 4, !tbaa !5
  %318 = add i32 %304, 2
  %319 = add i32 %318, %303
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds float, float addrspace(1)* %0, i64 %320
  %322 = load float, float addrspace(1)* %321, align 4, !tbaa !5
  %323 = sext i32 %318 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %0, i64 %323
  store float %322, float addrspace(1)* %324, align 4, !tbaa !5
  %325 = add i32 %304, 3
  %326 = add i32 %325, %303
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %0, i64 %327
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !5
  %330 = sext i32 %325 to i64
  %331 = getelementptr inbounds float, float addrspace(1)* %0, i64 %330
  store float %329, float addrspace(1)* %331, align 4, !tbaa !5
  %332 = add i32 %304, 4
  %333 = add i32 %332, %303
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds float, float addrspace(1)* %0, i64 %334
  %336 = load float, float addrspace(1)* %335, align 4, !tbaa !5
  %337 = sext i32 %332 to i64
  %338 = getelementptr inbounds float, float addrspace(1)* %0, i64 %337
  store float %336, float addrspace(1)* %338, align 4, !tbaa !5
  %339 = add i32 %304, 5
  %340 = add i32 %339, %303
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds float, float addrspace(1)* %0, i64 %341
  %343 = load float, float addrspace(1)* %342, align 4, !tbaa !5
  %344 = sext i32 %339 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %0, i64 %344
  store float %343, float addrspace(1)* %345, align 4, !tbaa !5
  %346 = add i32 %304, 6
  %347 = add i32 %346, %303
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds float, float addrspace(1)* %0, i64 %348
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !5
  %351 = sext i32 %346 to i64
  %352 = getelementptr inbounds float, float addrspace(1)* %0, i64 %351
  store float %350, float addrspace(1)* %352, align 4, !tbaa !5
  %353 = add i32 %304, 7
  %354 = add i32 %353, %303
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds float, float addrspace(1)* %0, i64 %355
  %357 = load float, float addrspace(1)* %356, align 4, !tbaa !5
  %358 = sext i32 %353 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %0, i64 %358
  store float %357, float addrspace(1)* %359, align 4, !tbaa !5
  %360 = add i32 %304, 8
  %361 = add i32 %360, %303
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds float, float addrspace(1)* %0, i64 %362
  %364 = load float, float addrspace(1)* %363, align 4, !tbaa !5
  %365 = sext i32 %360 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %0, i64 %365
  store float %364, float addrspace(1)* %366, align 4, !tbaa !5
  br label %367

367:                                              ; preds = %300, %298
  %368 = add nsw i32 %1, -1
  %369 = icmp eq i32 %10, %368
  br i1 %369, label %370, label %445

370:                                              ; preds = %367
  %371 = mul i32 %2, 9
  %372 = mul nsw i32 %11, 9
  %373 = mul i32 %371, %10
  %374 = add i32 %372, %371
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds float, float addrspace(1)* %0, i64 %375
  %377 = load float, float addrspace(1)* %376, align 4, !tbaa !5
  %378 = add i32 %372, %373
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds float, float addrspace(1)* %0, i64 %379
  store float %377, float addrspace(1)* %380, align 4, !tbaa !5
  %381 = add i32 %372, 1
  %382 = add i32 %381, %371
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds float, float addrspace(1)* %0, i64 %383
  %385 = load float, float addrspace(1)* %384, align 4, !tbaa !5
  %386 = add i32 %381, %373
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds float, float addrspace(1)* %0, i64 %387
  store float %385, float addrspace(1)* %388, align 4, !tbaa !5
  %389 = add i32 %372, 2
  %390 = add i32 %389, %371
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %0, i64 %391
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !5
  %394 = add i32 %389, %373
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds float, float addrspace(1)* %0, i64 %395
  store float %393, float addrspace(1)* %396, align 4, !tbaa !5
  %397 = add i32 %372, 3
  %398 = add i32 %397, %371
  %399 = sext i32 %398 to i64
  %400 = getelementptr inbounds float, float addrspace(1)* %0, i64 %399
  %401 = load float, float addrspace(1)* %400, align 4, !tbaa !5
  %402 = add i32 %397, %373
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds float, float addrspace(1)* %0, i64 %403
  store float %401, float addrspace(1)* %404, align 4, !tbaa !5
  %405 = add i32 %372, 4
  %406 = add i32 %405, %371
  %407 = sext i32 %406 to i64
  %408 = getelementptr inbounds float, float addrspace(1)* %0, i64 %407
  %409 = load float, float addrspace(1)* %408, align 4, !tbaa !5
  %410 = add i32 %405, %373
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds float, float addrspace(1)* %0, i64 %411
  store float %409, float addrspace(1)* %412, align 4, !tbaa !5
  %413 = add i32 %372, 5
  %414 = add i32 %413, %371
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %0, i64 %415
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !5
  %418 = add i32 %413, %373
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds float, float addrspace(1)* %0, i64 %419
  store float %417, float addrspace(1)* %420, align 4, !tbaa !5
  %421 = add i32 %372, 6
  %422 = add i32 %421, %371
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds float, float addrspace(1)* %0, i64 %423
  %425 = load float, float addrspace(1)* %424, align 4, !tbaa !5
  %426 = add i32 %421, %373
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds float, float addrspace(1)* %0, i64 %427
  store float %425, float addrspace(1)* %428, align 4, !tbaa !5
  %429 = add i32 %372, 7
  %430 = add i32 %429, %371
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds float, float addrspace(1)* %0, i64 %431
  %433 = load float, float addrspace(1)* %432, align 4, !tbaa !5
  %434 = add i32 %429, %373
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds float, float addrspace(1)* %0, i64 %435
  store float %433, float addrspace(1)* %436, align 4, !tbaa !5
  %437 = add i32 %372, 8
  %438 = add i32 %437, %371
  %439 = sext i32 %438 to i64
  %440 = getelementptr inbounds float, float addrspace(1)* %0, i64 %439
  %441 = load float, float addrspace(1)* %440, align 4, !tbaa !5
  %442 = add i32 %437, %373
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds float, float addrspace(1)* %0, i64 %443
  store float %441, float addrspace(1)* %444, align 4, !tbaa !5
  br label %445

445:                                              ; preds = %370, %367
  %446 = icmp eq i32 %11, 0
  br i1 %446, label %447, label %521

447:                                              ; preds = %445
  %448 = mul i32 %2, 9
  %449 = mul i32 %448, %10
  %450 = add nsw i32 %449, -18
  %451 = add i32 %450, %448
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds float, float addrspace(1)* %0, i64 %452
  %454 = load float, float addrspace(1)* %453, align 4, !tbaa !5
  %455 = sext i32 %449 to i64
  %456 = getelementptr inbounds float, float addrspace(1)* %0, i64 %455
  store float %454, float addrspace(1)* %456, align 4, !tbaa !5
  %457 = add i32 %449, 1
  %458 = add i32 %449, -17
  %459 = add i32 %458, %448
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds float, float addrspace(1)* %0, i64 %460
  %462 = load float, float addrspace(1)* %461, align 4, !tbaa !5
  %463 = sext i32 %457 to i64
  %464 = getelementptr inbounds float, float addrspace(1)* %0, i64 %463
  store float %462, float addrspace(1)* %464, align 4, !tbaa !5
  %465 = add i32 %449, 2
  %466 = add i32 %449, -16
  %467 = add i32 %466, %448
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds float, float addrspace(1)* %0, i64 %468
  %470 = load float, float addrspace(1)* %469, align 4, !tbaa !5
  %471 = sext i32 %465 to i64
  %472 = getelementptr inbounds float, float addrspace(1)* %0, i64 %471
  store float %470, float addrspace(1)* %472, align 4, !tbaa !5
  %473 = add i32 %449, 3
  %474 = add i32 %449, -15
  %475 = add i32 %474, %448
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds float, float addrspace(1)* %0, i64 %476
  %478 = load float, float addrspace(1)* %477, align 4, !tbaa !5
  %479 = sext i32 %473 to i64
  %480 = getelementptr inbounds float, float addrspace(1)* %0, i64 %479
  store float %478, float addrspace(1)* %480, align 4, !tbaa !5
  %481 = add i32 %449, 4
  %482 = add i32 %449, -14
  %483 = add i32 %482, %448
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds float, float addrspace(1)* %0, i64 %484
  %486 = load float, float addrspace(1)* %485, align 4, !tbaa !5
  %487 = sext i32 %481 to i64
  %488 = getelementptr inbounds float, float addrspace(1)* %0, i64 %487
  store float %486, float addrspace(1)* %488, align 4, !tbaa !5
  %489 = add i32 %449, 5
  %490 = add i32 %449, -13
  %491 = add i32 %490, %448
  %492 = sext i32 %491 to i64
  %493 = getelementptr inbounds float, float addrspace(1)* %0, i64 %492
  %494 = load float, float addrspace(1)* %493, align 4, !tbaa !5
  %495 = sext i32 %489 to i64
  %496 = getelementptr inbounds float, float addrspace(1)* %0, i64 %495
  store float %494, float addrspace(1)* %496, align 4, !tbaa !5
  %497 = add i32 %449, 6
  %498 = add i32 %449, -12
  %499 = add i32 %498, %448
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds float, float addrspace(1)* %0, i64 %500
  %502 = load float, float addrspace(1)* %501, align 4, !tbaa !5
  %503 = sext i32 %497 to i64
  %504 = getelementptr inbounds float, float addrspace(1)* %0, i64 %503
  store float %502, float addrspace(1)* %504, align 4, !tbaa !5
  %505 = add i32 %449, 7
  %506 = add i32 %449, -11
  %507 = add i32 %506, %448
  %508 = sext i32 %507 to i64
  %509 = getelementptr inbounds float, float addrspace(1)* %0, i64 %508
  %510 = load float, float addrspace(1)* %509, align 4, !tbaa !5
  %511 = sext i32 %505 to i64
  %512 = getelementptr inbounds float, float addrspace(1)* %0, i64 %511
  store float %510, float addrspace(1)* %512, align 4, !tbaa !5
  %513 = add i32 %449, 8
  %514 = add i32 %449, -10
  %515 = add i32 %514, %448
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds float, float addrspace(1)* %0, i64 %516
  %518 = load float, float addrspace(1)* %517, align 4, !tbaa !5
  %519 = sext i32 %513 to i64
  %520 = getelementptr inbounds float, float addrspace(1)* %0, i64 %519
  store float %518, float addrspace(1)* %520, align 4, !tbaa !5
  br label %521

521:                                              ; preds = %447, %445
  %522 = add nsw i32 %2, -1
  %523 = icmp eq i32 %11, %522
  br i1 %523, label %524, label %599

524:                                              ; preds = %521
  %525 = mul i32 %2, 9
  %526 = mul i32 %525, %10
  %527 = mul nsw i32 %11, 9
  %528 = add i32 %526, 9
  %529 = sext i32 %528 to i64
  %530 = getelementptr inbounds float, float addrspace(1)* %0, i64 %529
  %531 = load float, float addrspace(1)* %530, align 4, !tbaa !5
  %532 = add i32 %526, %527
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds float, float addrspace(1)* %0, i64 %533
  store float %531, float addrspace(1)* %534, align 4, !tbaa !5
  %535 = add i32 %526, 1
  %536 = add i32 %526, 10
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds float, float addrspace(1)* %0, i64 %537
  %539 = load float, float addrspace(1)* %538, align 4, !tbaa !5
  %540 = add i32 %535, %527
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds float, float addrspace(1)* %0, i64 %541
  store float %539, float addrspace(1)* %542, align 4, !tbaa !5
  %543 = add i32 %526, 2
  %544 = add i32 %526, 11
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds float, float addrspace(1)* %0, i64 %545
  %547 = load float, float addrspace(1)* %546, align 4, !tbaa !5
  %548 = add i32 %543, %527
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds float, float addrspace(1)* %0, i64 %549
  store float %547, float addrspace(1)* %550, align 4, !tbaa !5
  %551 = add i32 %526, 3
  %552 = add i32 %526, 12
  %553 = sext i32 %552 to i64
  %554 = getelementptr inbounds float, float addrspace(1)* %0, i64 %553
  %555 = load float, float addrspace(1)* %554, align 4, !tbaa !5
  %556 = add i32 %551, %527
  %557 = sext i32 %556 to i64
  %558 = getelementptr inbounds float, float addrspace(1)* %0, i64 %557
  store float %555, float addrspace(1)* %558, align 4, !tbaa !5
  %559 = add i32 %526, 4
  %560 = add i32 %526, 13
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds float, float addrspace(1)* %0, i64 %561
  %563 = load float, float addrspace(1)* %562, align 4, !tbaa !5
  %564 = add i32 %559, %527
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds float, float addrspace(1)* %0, i64 %565
  store float %563, float addrspace(1)* %566, align 4, !tbaa !5
  %567 = add i32 %526, 5
  %568 = add i32 %526, 14
  %569 = sext i32 %568 to i64
  %570 = getelementptr inbounds float, float addrspace(1)* %0, i64 %569
  %571 = load float, float addrspace(1)* %570, align 4, !tbaa !5
  %572 = add i32 %567, %527
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds float, float addrspace(1)* %0, i64 %573
  store float %571, float addrspace(1)* %574, align 4, !tbaa !5
  %575 = add i32 %526, 6
  %576 = add i32 %526, 15
  %577 = sext i32 %576 to i64
  %578 = getelementptr inbounds float, float addrspace(1)* %0, i64 %577
  %579 = load float, float addrspace(1)* %578, align 4, !tbaa !5
  %580 = add i32 %575, %527
  %581 = sext i32 %580 to i64
  %582 = getelementptr inbounds float, float addrspace(1)* %0, i64 %581
  store float %579, float addrspace(1)* %582, align 4, !tbaa !5
  %583 = add i32 %526, 7
  %584 = add i32 %526, 16
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds float, float addrspace(1)* %0, i64 %585
  %587 = load float, float addrspace(1)* %586, align 4, !tbaa !5
  %588 = add i32 %583, %527
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds float, float addrspace(1)* %0, i64 %589
  store float %587, float addrspace(1)* %590, align 4, !tbaa !5
  %591 = add i32 %526, 8
  %592 = add i32 %526, 17
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds float, float addrspace(1)* %0, i64 %593
  %595 = load float, float addrspace(1)* %594, align 4, !tbaa !5
  %596 = add i32 %591, %527
  %597 = sext i32 %596 to i64
  %598 = getelementptr inbounds float, float addrspace(1)* %0, i64 %597
  store float %595, float addrspace(1)* %598, align 4, !tbaa !5
  br label %599

599:                                              ; preds = %524, %521
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
