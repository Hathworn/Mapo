; ModuleID = '../data/hip_kernels/5182/226/main.cu'
source_filename = "../data/hip_kernels/5182/226/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18ComputeCubesKernelPfS_ifPiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* writeonly %1, i32 %2, float %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %15, %12
  %19 = mul i32 %18, %12
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %16
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %24
  %28 = icmp slt i32 %27, %6
  br i1 %28, label %29, label %427

29:                                               ; preds = %7
  %30 = mul nsw i32 %27, 3
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !16, !amdgpu.noclobber !5
  %34 = add nsw i32 %30, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !5
  %38 = add nsw i32 %30, 2
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !5
  %42 = fmul contract float %3, 5.000000e-01
  %43 = sext i32 %27 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !20, !amdgpu.noclobber !5
  %46 = icmp eq i32 %45, 0
  %47 = select i1 %46, float 0.000000e+00, float %42
  %48 = mul i32 %6, 72
  %49 = add nsw i32 %48, %2
  %50 = mul nsw i32 %6, %5
  %51 = sitofp i32 %50 to float
  %52 = fsub contract float %33, %47
  %53 = mul nsw i32 %27, 72
  %54 = add nsw i32 %53, %2
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  store float %52, float addrspace(1)* %56, align 4, !tbaa !16
  %57 = fsub contract float %37, %47
  %58 = add nsw i32 %54, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  store float %57, float addrspace(1)* %60, align 4, !tbaa !16
  %61 = fadd contract float %41, %47
  %62 = add nsw i32 %54, 2
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  store float %61, float addrspace(1)* %64, align 4, !tbaa !16
  %65 = add nsw i32 %54, 3
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  store float %52, float addrspace(1)* %67, align 4, !tbaa !16
  %68 = add nsw i32 %54, 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  store float %57, float addrspace(1)* %70, align 4, !tbaa !16
  %71 = fsub contract float %41, %47
  %72 = add nsw i32 %54, 5
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  store float %71, float addrspace(1)* %74, align 4, !tbaa !16
  %75 = fadd contract float %33, %47
  %76 = add nsw i32 %54, 6
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  store float %75, float addrspace(1)* %78, align 4, !tbaa !16
  %79 = add nsw i32 %54, 7
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  store float %57, float addrspace(1)* %81, align 4, !tbaa !16
  %82 = add nsw i32 %54, 8
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  store float %71, float addrspace(1)* %84, align 4, !tbaa !16
  %85 = add nsw i32 %54, 9
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  store float %75, float addrspace(1)* %87, align 4, !tbaa !16
  %88 = add nsw i32 %54, 10
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  store float %57, float addrspace(1)* %90, align 4, !tbaa !16
  %91 = add nsw i32 %54, 11
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  store float %61, float addrspace(1)* %93, align 4, !tbaa !16
  %94 = mul nsw i32 %27, %5
  %95 = sitofp i32 %94 to float
  %96 = fdiv contract float %95, %51
  %97 = mul nsw i32 %27, 48
  %98 = add nsw i32 %49, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  store float %96, float addrspace(1)* %100, align 4, !tbaa !16
  %101 = add nsw i32 %98, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  store float 0.000000e+00, float addrspace(1)* %103, align 4, !tbaa !16
  %104 = add nsw i32 %98, 2
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  store float %96, float addrspace(1)* %106, align 4, !tbaa !16
  %107 = add nsw i32 %98, 3
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  store float 1.000000e+00, float addrspace(1)* %109, align 4, !tbaa !16
  %110 = add nsw i32 %27, 1
  %111 = mul nsw i32 %110, %5
  %112 = sitofp i32 %111 to float
  %113 = fdiv contract float %112, %51
  %114 = add nsw i32 %98, 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  store float %113, float addrspace(1)* %116, align 4, !tbaa !16
  %117 = add nsw i32 %98, 5
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  store float 1.000000e+00, float addrspace(1)* %119, align 4, !tbaa !16
  %120 = add nsw i32 %98, 6
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  store float %113, float addrspace(1)* %122, align 4, !tbaa !16
  %123 = add nsw i32 %98, 7
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  store float 0.000000e+00, float addrspace(1)* %125, align 4, !tbaa !16
  %126 = add nsw i32 %54, 12
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  store float %52, float addrspace(1)* %128, align 4, !tbaa !16
  %129 = fadd contract float %37, %47
  %130 = add nsw i32 %54, 13
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  store float %129, float addrspace(1)* %132, align 4, !tbaa !16
  %133 = add nsw i32 %54, 14
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  store float %61, float addrspace(1)* %135, align 4, !tbaa !16
  %136 = add nsw i32 %54, 15
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  store float %52, float addrspace(1)* %138, align 4, !tbaa !16
  %139 = add nsw i32 %54, 16
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %1, i64 %140
  store float %57, float addrspace(1)* %141, align 4, !tbaa !16
  %142 = add nsw i32 %54, 17
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  store float %61, float addrspace(1)* %144, align 4, !tbaa !16
  %145 = add nsw i32 %54, 18
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  store float %75, float addrspace(1)* %147, align 4, !tbaa !16
  %148 = add nsw i32 %54, 19
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  store float %57, float addrspace(1)* %150, align 4, !tbaa !16
  %151 = add nsw i32 %54, 20
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %152
  store float %61, float addrspace(1)* %153, align 4, !tbaa !16
  %154 = add nsw i32 %54, 21
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %1, i64 %155
  store float %75, float addrspace(1)* %156, align 4, !tbaa !16
  %157 = add nsw i32 %54, 22
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  store float %129, float addrspace(1)* %159, align 4, !tbaa !16
  %160 = add nsw i32 %54, 23
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  store float %61, float addrspace(1)* %162, align 4, !tbaa !16
  %163 = add nsw i32 %98, 8
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  store float %96, float addrspace(1)* %165, align 4, !tbaa !16
  %166 = add nsw i32 %98, 9
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  store float 0.000000e+00, float addrspace(1)* %168, align 4, !tbaa !16
  %169 = add nsw i32 %98, 10
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  store float %96, float addrspace(1)* %171, align 4, !tbaa !16
  %172 = add nsw i32 %98, 11
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %173
  store float 1.000000e+00, float addrspace(1)* %174, align 4, !tbaa !16
  %175 = add nsw i32 %98, 12
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %1, i64 %176
  store float %113, float addrspace(1)* %177, align 4, !tbaa !16
  %178 = add nsw i32 %98, 13
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %179
  store float 1.000000e+00, float addrspace(1)* %180, align 4, !tbaa !16
  %181 = add nsw i32 %98, 14
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  store float %113, float addrspace(1)* %183, align 4, !tbaa !16
  %184 = add nsw i32 %98, 15
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %1, i64 %185
  store float 0.000000e+00, float addrspace(1)* %186, align 4, !tbaa !16
  %187 = add nsw i32 %54, 24
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %1, i64 %188
  store float %52, float addrspace(1)* %189, align 4, !tbaa !16
  %190 = add nsw i32 %54, 25
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %1, i64 %191
  store float %129, float addrspace(1)* %192, align 4, !tbaa !16
  %193 = add nsw i32 %54, 26
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %1, i64 %194
  store float %71, float addrspace(1)* %195, align 4, !tbaa !16
  %196 = add nsw i32 %54, 27
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %1, i64 %197
  store float %52, float addrspace(1)* %198, align 4, !tbaa !16
  %199 = add nsw i32 %54, 28
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %1, i64 %200
  store float %57, float addrspace(1)* %201, align 4, !tbaa !16
  %202 = add nsw i32 %54, 29
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %1, i64 %203
  store float %71, float addrspace(1)* %204, align 4, !tbaa !16
  %205 = add nsw i32 %54, 30
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %1, i64 %206
  store float %52, float addrspace(1)* %207, align 4, !tbaa !16
  %208 = add nsw i32 %54, 31
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %1, i64 %209
  store float %57, float addrspace(1)* %210, align 4, !tbaa !16
  %211 = add nsw i32 %54, 32
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %1, i64 %212
  store float %61, float addrspace(1)* %213, align 4, !tbaa !16
  %214 = add nsw i32 %54, 33
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %1, i64 %215
  store float %52, float addrspace(1)* %216, align 4, !tbaa !16
  %217 = add nsw i32 %54, 34
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %1, i64 %218
  store float %129, float addrspace(1)* %219, align 4, !tbaa !16
  %220 = add nsw i32 %54, 35
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %1, i64 %221
  store float %61, float addrspace(1)* %222, align 4, !tbaa !16
  %223 = add nsw i32 %98, 16
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %1, i64 %224
  store float %96, float addrspace(1)* %225, align 4, !tbaa !16
  %226 = add nsw i32 %98, 17
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds float, float addrspace(1)* %1, i64 %227
  store float 0.000000e+00, float addrspace(1)* %228, align 4, !tbaa !16
  %229 = add nsw i32 %98, 18
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %1, i64 %230
  store float %96, float addrspace(1)* %231, align 4, !tbaa !16
  %232 = add nsw i32 %98, 19
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %1, i64 %233
  store float 1.000000e+00, float addrspace(1)* %234, align 4, !tbaa !16
  %235 = add nsw i32 %98, 20
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds float, float addrspace(1)* %1, i64 %236
  store float %113, float addrspace(1)* %237, align 4, !tbaa !16
  %238 = add nsw i32 %98, 21
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %1, i64 %239
  store float 1.000000e+00, float addrspace(1)* %240, align 4, !tbaa !16
  %241 = add nsw i32 %98, 22
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %1, i64 %242
  store float %113, float addrspace(1)* %243, align 4, !tbaa !16
  %244 = add nsw i32 %98, 23
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %1, i64 %245
  store float 0.000000e+00, float addrspace(1)* %246, align 4, !tbaa !16
  %247 = add nsw i32 %54, 36
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %1, i64 %248
  store float %52, float addrspace(1)* %249, align 4, !tbaa !16
  %250 = add nsw i32 %54, 37
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %1, i64 %251
  store float %129, float addrspace(1)* %252, align 4, !tbaa !16
  %253 = add nsw i32 %54, 38
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %1, i64 %254
  store float %71, float addrspace(1)* %255, align 4, !tbaa !16
  %256 = add nsw i32 %54, 39
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %1, i64 %257
  store float %52, float addrspace(1)* %258, align 4, !tbaa !16
  %259 = add nsw i32 %54, 40
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %1, i64 %260
  store float %57, float addrspace(1)* %261, align 4, !tbaa !16
  %262 = add nsw i32 %54, 41
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %1, i64 %263
  store float %71, float addrspace(1)* %264, align 4, !tbaa !16
  %265 = add nsw i32 %54, 42
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %1, i64 %266
  store float %75, float addrspace(1)* %267, align 4, !tbaa !16
  %268 = add nsw i32 %54, 43
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %1, i64 %269
  store float %57, float addrspace(1)* %270, align 4, !tbaa !16
  %271 = add nsw i32 %54, 44
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %1, i64 %272
  store float %71, float addrspace(1)* %273, align 4, !tbaa !16
  %274 = add nsw i32 %54, 45
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds float, float addrspace(1)* %1, i64 %275
  store float %75, float addrspace(1)* %276, align 4, !tbaa !16
  %277 = add nsw i32 %54, 46
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %1, i64 %278
  store float %129, float addrspace(1)* %279, align 4, !tbaa !16
  %280 = add nsw i32 %54, 47
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds float, float addrspace(1)* %1, i64 %281
  store float %71, float addrspace(1)* %282, align 4, !tbaa !16
  %283 = add nsw i32 %98, 24
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds float, float addrspace(1)* %1, i64 %284
  store float %113, float addrspace(1)* %285, align 4, !tbaa !16
  %286 = add nsw i32 %98, 25
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds float, float addrspace(1)* %1, i64 %287
  store float 0.000000e+00, float addrspace(1)* %288, align 4, !tbaa !16
  %289 = add nsw i32 %98, 26
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds float, float addrspace(1)* %1, i64 %290
  store float %113, float addrspace(1)* %291, align 4, !tbaa !16
  %292 = add nsw i32 %98, 27
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds float, float addrspace(1)* %1, i64 %293
  store float 1.000000e+00, float addrspace(1)* %294, align 4, !tbaa !16
  %295 = add nsw i32 %98, 28
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds float, float addrspace(1)* %1, i64 %296
  store float %96, float addrspace(1)* %297, align 4, !tbaa !16
  %298 = add nsw i32 %98, 29
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds float, float addrspace(1)* %1, i64 %299
  store float 1.000000e+00, float addrspace(1)* %300, align 4, !tbaa !16
  %301 = add nsw i32 %98, 30
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %1, i64 %302
  store float %96, float addrspace(1)* %303, align 4, !tbaa !16
  %304 = add nsw i32 %98, 31
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(1)* %1, i64 %305
  store float 0.000000e+00, float addrspace(1)* %306, align 4, !tbaa !16
  %307 = add nsw i32 %54, 48
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %1, i64 %308
  store float %75, float addrspace(1)* %309, align 4, !tbaa !16
  %310 = add nsw i32 %54, 49
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds float, float addrspace(1)* %1, i64 %311
  store float %129, float addrspace(1)* %312, align 4, !tbaa !16
  %313 = add nsw i32 %54, 50
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds float, float addrspace(1)* %1, i64 %314
  store float %71, float addrspace(1)* %315, align 4, !tbaa !16
  %316 = add nsw i32 %54, 51
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds float, float addrspace(1)* %1, i64 %317
  store float %75, float addrspace(1)* %318, align 4, !tbaa !16
  %319 = add nsw i32 %54, 52
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds float, float addrspace(1)* %1, i64 %320
  store float %57, float addrspace(1)* %321, align 4, !tbaa !16
  %322 = add nsw i32 %54, 53
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %1, i64 %323
  store float %71, float addrspace(1)* %324, align 4, !tbaa !16
  %325 = add nsw i32 %54, 54
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds float, float addrspace(1)* %1, i64 %326
  store float %75, float addrspace(1)* %327, align 4, !tbaa !16
  %328 = add nsw i32 %54, 55
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds float, float addrspace(1)* %1, i64 %329
  store float %57, float addrspace(1)* %330, align 4, !tbaa !16
  %331 = add nsw i32 %54, 56
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %1, i64 %332
  store float %61, float addrspace(1)* %333, align 4, !tbaa !16
  %334 = add nsw i32 %54, 57
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(1)* %1, i64 %335
  store float %75, float addrspace(1)* %336, align 4, !tbaa !16
  %337 = add nsw i32 %54, 58
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds float, float addrspace(1)* %1, i64 %338
  store float %129, float addrspace(1)* %339, align 4, !tbaa !16
  %340 = add nsw i32 %54, 59
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds float, float addrspace(1)* %1, i64 %341
  store float %61, float addrspace(1)* %342, align 4, !tbaa !16
  %343 = add nsw i32 %98, 32
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %1, i64 %344
  store float %113, float addrspace(1)* %345, align 4, !tbaa !16
  %346 = add nsw i32 %98, 33
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds float, float addrspace(1)* %1, i64 %347
  store float 0.000000e+00, float addrspace(1)* %348, align 4, !tbaa !16
  %349 = add nsw i32 %98, 34
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %1, i64 %350
  store float %113, float addrspace(1)* %351, align 4, !tbaa !16
  %352 = add nsw i32 %98, 35
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds float, float addrspace(1)* %1, i64 %353
  store float 1.000000e+00, float addrspace(1)* %354, align 4, !tbaa !16
  %355 = add nsw i32 %98, 36
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds float, float addrspace(1)* %1, i64 %356
  store float %96, float addrspace(1)* %357, align 4, !tbaa !16
  %358 = add nsw i32 %98, 37
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds float, float addrspace(1)* %1, i64 %359
  store float 1.000000e+00, float addrspace(1)* %360, align 4, !tbaa !16
  %361 = add nsw i32 %98, 38
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds float, float addrspace(1)* %1, i64 %362
  store float %96, float addrspace(1)* %363, align 4, !tbaa !16
  %364 = add nsw i32 %98, 39
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %1, i64 %365
  store float 0.000000e+00, float addrspace(1)* %366, align 4, !tbaa !16
  %367 = add nsw i32 %54, 60
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds float, float addrspace(1)* %1, i64 %368
  store float %52, float addrspace(1)* %369, align 4, !tbaa !16
  %370 = add nsw i32 %54, 61
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds float, float addrspace(1)* %1, i64 %371
  store float %129, float addrspace(1)* %372, align 4, !tbaa !16
  %373 = add nsw i32 %54, 62
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds float, float addrspace(1)* %1, i64 %374
  store float %61, float addrspace(1)* %375, align 4, !tbaa !16
  %376 = add nsw i32 %54, 63
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds float, float addrspace(1)* %1, i64 %377
  store float %52, float addrspace(1)* %378, align 4, !tbaa !16
  %379 = add nsw i32 %54, 64
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds float, float addrspace(1)* %1, i64 %380
  store float %129, float addrspace(1)* %381, align 4, !tbaa !16
  %382 = add nsw i32 %54, 65
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds float, float addrspace(1)* %1, i64 %383
  store float %71, float addrspace(1)* %384, align 4, !tbaa !16
  %385 = add nsw i32 %54, 66
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %1, i64 %386
  store float %75, float addrspace(1)* %387, align 4, !tbaa !16
  %388 = add nsw i32 %54, 67
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds float, float addrspace(1)* %1, i64 %389
  store float %129, float addrspace(1)* %390, align 4, !tbaa !16
  %391 = add nsw i32 %54, 68
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds float, float addrspace(1)* %1, i64 %392
  store float %71, float addrspace(1)* %393, align 4, !tbaa !16
  %394 = add nsw i32 %54, 69
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds float, float addrspace(1)* %1, i64 %395
  store float %75, float addrspace(1)* %396, align 4, !tbaa !16
  %397 = add nsw i32 %54, 70
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds float, float addrspace(1)* %1, i64 %398
  store float %129, float addrspace(1)* %399, align 4, !tbaa !16
  %400 = add nsw i32 %54, 71
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds float, float addrspace(1)* %1, i64 %401
  store float %61, float addrspace(1)* %402, align 4, !tbaa !16
  %403 = add nsw i32 %98, 40
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds float, float addrspace(1)* %1, i64 %404
  store float %96, float addrspace(1)* %405, align 4, !tbaa !16
  %406 = add nsw i32 %98, 41
  %407 = sext i32 %406 to i64
  %408 = getelementptr inbounds float, float addrspace(1)* %1, i64 %407
  store float 1.000000e+00, float addrspace(1)* %408, align 4, !tbaa !16
  %409 = add nsw i32 %98, 42
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds float, float addrspace(1)* %1, i64 %410
  store float %96, float addrspace(1)* %411, align 4, !tbaa !16
  %412 = add nsw i32 %98, 43
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds float, float addrspace(1)* %1, i64 %413
  store float 0.000000e+00, float addrspace(1)* %414, align 4, !tbaa !16
  %415 = add nsw i32 %98, 44
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds float, float addrspace(1)* %1, i64 %416
  store float %113, float addrspace(1)* %417, align 4, !tbaa !16
  %418 = add nsw i32 %98, 45
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds float, float addrspace(1)* %1, i64 %419
  store float 0.000000e+00, float addrspace(1)* %420, align 4, !tbaa !16
  %421 = add nsw i32 %98, 46
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds float, float addrspace(1)* %1, i64 %422
  store float %113, float addrspace(1)* %423, align 4, !tbaa !16
  %424 = add nsw i32 %98, 47
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds float, float addrspace(1)* %1, i64 %425
  store float 1.000000e+00, float addrspace(1)* %426, align 4, !tbaa !16
  br label %427

427:                                              ; preds = %29, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
