; ModuleID = '../data/hip_kernels/16323/7/main.cu'
source_filename = "../data/hip_kernels/16323/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@gaussian_kernel = protected addrspace(4) externally_initialized global [25 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([25 x float] addrspace(4)* @gaussian_kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11kernel_blurPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = add i32 %12, %5
  %14 = zext i32 %13 to i64
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = zext i32 %22 to i64
  %24 = sext i32 %3 to i64
  %25 = mul nsw i64 %14, %24
  %26 = add nsw i64 %25, %23
  %27 = add nsw i32 %2, -5
  %28 = sext i32 %27 to i64
  %29 = icmp uge i64 %14, %28
  %30 = icmp ult i32 %13, 6
  %31 = or i1 %30, %29
  br i1 %31, label %788, label %32

32:                                               ; preds = %4
  %33 = add nsw i32 %3, -5
  %34 = sext i32 %33 to i64
  %35 = icmp uge i64 %23, %34
  %36 = icmp ult i32 %22, 6
  %37 = or i1 %36, %35
  br i1 %37, label %788, label %38

38:                                               ; preds = %32
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = add nsw i64 %14, -5
  %42 = mul i64 %41, %24
  %43 = add i64 %42, %23
  %44 = add i64 %43, -5
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 0), align 16, !tbaa !7
  %48 = fmul contract float %46, %47
  %49 = fadd contract float %40, %48
  store float %49, float addrspace(1)* %39, align 4, !tbaa !7
  %50 = add i64 %43, -4
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 1), align 4, !tbaa !7
  %54 = fmul contract float %52, %53
  %55 = fadd contract float %49, %54
  store float %55, float addrspace(1)* %39, align 4, !tbaa !7
  %56 = add i64 %43, -3
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 2), align 8, !tbaa !7
  %60 = fmul contract float %58, %59
  %61 = fadd contract float %55, %60
  store float %61, float addrspace(1)* %39, align 4, !tbaa !7
  %62 = add i64 %43, -2
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 3), align 4, !tbaa !7
  %66 = fmul contract float %64, %65
  %67 = fadd contract float %61, %66
  store float %67, float addrspace(1)* %39, align 4, !tbaa !7
  %68 = add i64 %43, -1
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 4), align 16, !tbaa !7
  %72 = fmul contract float %70, %71
  %73 = fadd contract float %67, %72
  store float %73, float addrspace(1)* %39, align 4, !tbaa !7
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 5), align 4, !tbaa !7
  %77 = fmul contract float %75, %76
  %78 = fadd contract float %73, %77
  store float %78, float addrspace(1)* %39, align 4, !tbaa !7
  %79 = add i64 %43, 1
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 6), align 8, !tbaa !7
  %83 = fmul contract float %81, %82
  %84 = fadd contract float %78, %83
  store float %84, float addrspace(1)* %39, align 4, !tbaa !7
  %85 = add i64 %43, 2
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 7), align 4, !tbaa !7
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %84, %89
  store float %90, float addrspace(1)* %39, align 4, !tbaa !7
  %91 = add i64 %43, 3
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7
  %94 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 8), align 16, !tbaa !7
  %95 = fmul contract float %93, %94
  %96 = fadd contract float %90, %95
  store float %96, float addrspace(1)* %39, align 4, !tbaa !7
  %97 = add i64 %43, 4
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 9), align 4, !tbaa !7
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %96, %101
  store float %102, float addrspace(1)* %39, align 4, !tbaa !7
  %103 = add i64 %43, 5
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 10), align 8, !tbaa !7
  %107 = fmul contract float %105, %106
  %108 = fadd contract float %102, %107
  store float %108, float addrspace(1)* %39, align 4, !tbaa !7
  %109 = add nsw i64 %14, -4
  %110 = mul i64 %109, %24
  %111 = add i64 %110, %23
  %112 = add i64 %111, -5
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 11), align 4, !tbaa !7
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %108, %116
  store float %117, float addrspace(1)* %39, align 4, !tbaa !7
  %118 = add i64 %111, -4
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 12), align 16, !tbaa !7
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %117, %122
  store float %123, float addrspace(1)* %39, align 4, !tbaa !7
  %124 = add i64 %111, -3
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %127 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 13), align 4, !tbaa !7
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %123, %128
  store float %129, float addrspace(1)* %39, align 4, !tbaa !7
  %130 = add i64 %111, -2
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 14), align 8, !tbaa !7
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %129, %134
  store float %135, float addrspace(1)* %39, align 4, !tbaa !7
  %136 = add i64 %111, -1
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7
  %139 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 15), align 4, !tbaa !7
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %135, %140
  store float %141, float addrspace(1)* %39, align 4, !tbaa !7
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 16), align 16, !tbaa !7
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %141, %145
  store float %146, float addrspace(1)* %39, align 4, !tbaa !7
  %147 = add i64 %111, 1
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 17), align 4, !tbaa !7
  %151 = fmul contract float %149, %150
  %152 = fadd contract float %146, %151
  store float %152, float addrspace(1)* %39, align 4, !tbaa !7
  %153 = add i64 %111, 2
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %156 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 18), align 8, !tbaa !7
  %157 = fmul contract float %155, %156
  %158 = fadd contract float %152, %157
  store float %158, float addrspace(1)* %39, align 4, !tbaa !7
  %159 = add i64 %111, 3
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %162 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 19), align 4, !tbaa !7
  %163 = fmul contract float %161, %162
  %164 = fadd contract float %158, %163
  store float %164, float addrspace(1)* %39, align 4, !tbaa !7
  %165 = add i64 %111, 4
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7
  %168 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 20), align 16, !tbaa !7
  %169 = fmul contract float %167, %168
  %170 = fadd contract float %164, %169
  store float %170, float addrspace(1)* %39, align 4, !tbaa !7
  %171 = add i64 %111, 5
  %172 = getelementptr inbounds float, float addrspace(1)* %0, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7
  %174 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 21), align 4, !tbaa !7
  %175 = fmul contract float %173, %174
  %176 = fadd contract float %170, %175
  store float %176, float addrspace(1)* %39, align 4, !tbaa !7
  %177 = add nsw i64 %14, -3
  %178 = mul i64 %177, %24
  %179 = add i64 %178, %23
  %180 = add i64 %179, -5
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7
  %183 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 22), align 8, !tbaa !7
  %184 = fmul contract float %182, %183
  %185 = fadd contract float %176, %184
  store float %185, float addrspace(1)* %39, align 4, !tbaa !7
  %186 = add i64 %179, -4
  %187 = getelementptr inbounds float, float addrspace(1)* %0, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !7
  %189 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 23), align 4, !tbaa !7
  %190 = fmul contract float %188, %189
  %191 = fadd contract float %185, %190
  store float %191, float addrspace(1)* %39, align 4, !tbaa !7
  %192 = add i64 %179, -3
  %193 = getelementptr inbounds float, float addrspace(1)* %0, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 0, i64 24), align 16, !tbaa !7
  %196 = fmul contract float %194, %195
  %197 = fadd contract float %191, %196
  store float %197, float addrspace(1)* %39, align 4, !tbaa !7
  %198 = add i64 %179, -2
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !7
  %201 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 0), align 4, !tbaa !7
  %202 = fmul contract float %200, %201
  %203 = fadd contract float %197, %202
  store float %203, float addrspace(1)* %39, align 4, !tbaa !7
  %204 = add i64 %179, -1
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !7
  %207 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 1), align 8, !tbaa !7
  %208 = fmul contract float %206, %207
  %209 = fadd contract float %203, %208
  store float %209, float addrspace(1)* %39, align 4, !tbaa !7
  %210 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !7
  %212 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 2), align 4, !tbaa !7
  %213 = fmul contract float %211, %212
  %214 = fadd contract float %209, %213
  store float %214, float addrspace(1)* %39, align 4, !tbaa !7
  %215 = add i64 %179, 1
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !7
  %218 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 3), align 16, !tbaa !7
  %219 = fmul contract float %217, %218
  %220 = fadd contract float %214, %219
  store float %220, float addrspace(1)* %39, align 4, !tbaa !7
  %221 = add i64 %179, 2
  %222 = getelementptr inbounds float, float addrspace(1)* %0, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !7
  %224 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 4), align 4, !tbaa !7
  %225 = fmul contract float %223, %224
  %226 = fadd contract float %220, %225
  store float %226, float addrspace(1)* %39, align 4, !tbaa !7
  %227 = add i64 %179, 3
  %228 = getelementptr inbounds float, float addrspace(1)* %0, i64 %227
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !7
  %230 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 5), align 8, !tbaa !7
  %231 = fmul contract float %229, %230
  %232 = fadd contract float %226, %231
  store float %232, float addrspace(1)* %39, align 4, !tbaa !7
  %233 = add i64 %179, 4
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !7
  %236 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 6), align 4, !tbaa !7
  %237 = fmul contract float %235, %236
  %238 = fadd contract float %232, %237
  store float %238, float addrspace(1)* %39, align 4, !tbaa !7
  %239 = add i64 %179, 5
  %240 = getelementptr inbounds float, float addrspace(1)* %0, i64 %239
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !7
  %242 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 7), align 16, !tbaa !7
  %243 = fmul contract float %241, %242
  %244 = fadd contract float %238, %243
  store float %244, float addrspace(1)* %39, align 4, !tbaa !7
  %245 = add nsw i64 %14, -2
  %246 = mul i64 %245, %24
  %247 = add i64 %246, %23
  %248 = add i64 %247, -5
  %249 = getelementptr inbounds float, float addrspace(1)* %0, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7
  %251 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 8), align 4, !tbaa !7
  %252 = fmul contract float %250, %251
  %253 = fadd contract float %244, %252
  store float %253, float addrspace(1)* %39, align 4, !tbaa !7
  %254 = add i64 %247, -4
  %255 = getelementptr inbounds float, float addrspace(1)* %0, i64 %254
  %256 = load float, float addrspace(1)* %255, align 4, !tbaa !7
  %257 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 9), align 8, !tbaa !7
  %258 = fmul contract float %256, %257
  %259 = fadd contract float %253, %258
  store float %259, float addrspace(1)* %39, align 4, !tbaa !7
  %260 = add i64 %247, -3
  %261 = getelementptr inbounds float, float addrspace(1)* %0, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !7
  %263 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 10), align 4, !tbaa !7
  %264 = fmul contract float %262, %263
  %265 = fadd contract float %259, %264
  store float %265, float addrspace(1)* %39, align 4, !tbaa !7
  %266 = add i64 %247, -2
  %267 = getelementptr inbounds float, float addrspace(1)* %0, i64 %266
  %268 = load float, float addrspace(1)* %267, align 4, !tbaa !7
  %269 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 11), align 16, !tbaa !7
  %270 = fmul contract float %268, %269
  %271 = fadd contract float %265, %270
  store float %271, float addrspace(1)* %39, align 4, !tbaa !7
  %272 = add i64 %247, -1
  %273 = getelementptr inbounds float, float addrspace(1)* %0, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %275 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 12), align 4, !tbaa !7
  %276 = fmul contract float %274, %275
  %277 = fadd contract float %271, %276
  store float %277, float addrspace(1)* %39, align 4, !tbaa !7
  %278 = getelementptr inbounds float, float addrspace(1)* %0, i64 %247
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %280 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 13), align 8, !tbaa !7
  %281 = fmul contract float %279, %280
  %282 = fadd contract float %277, %281
  store float %282, float addrspace(1)* %39, align 4, !tbaa !7
  %283 = add i64 %247, 1
  %284 = getelementptr inbounds float, float addrspace(1)* %0, i64 %283
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !7
  %286 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 14), align 4, !tbaa !7
  %287 = fmul contract float %285, %286
  %288 = fadd contract float %282, %287
  store float %288, float addrspace(1)* %39, align 4, !tbaa !7
  %289 = add i64 %247, 2
  %290 = getelementptr inbounds float, float addrspace(1)* %0, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !7
  %292 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 15), align 16, !tbaa !7
  %293 = fmul contract float %291, %292
  %294 = fadd contract float %288, %293
  store float %294, float addrspace(1)* %39, align 4, !tbaa !7
  %295 = add i64 %247, 3
  %296 = getelementptr inbounds float, float addrspace(1)* %0, i64 %295
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !7
  %298 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 16), align 4, !tbaa !7
  %299 = fmul contract float %297, %298
  %300 = fadd contract float %294, %299
  store float %300, float addrspace(1)* %39, align 4, !tbaa !7
  %301 = add i64 %247, 4
  %302 = getelementptr inbounds float, float addrspace(1)* %0, i64 %301
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !7
  %304 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 17), align 8, !tbaa !7
  %305 = fmul contract float %303, %304
  %306 = fadd contract float %300, %305
  store float %306, float addrspace(1)* %39, align 4, !tbaa !7
  %307 = add i64 %247, 5
  %308 = getelementptr inbounds float, float addrspace(1)* %0, i64 %307
  %309 = load float, float addrspace(1)* %308, align 4, !tbaa !7
  %310 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 18), align 4, !tbaa !7
  %311 = fmul contract float %309, %310
  %312 = fadd contract float %306, %311
  store float %312, float addrspace(1)* %39, align 4, !tbaa !7
  %313 = add nsw i64 %14, -1
  %314 = mul i64 %313, %24
  %315 = add i64 %314, %23
  %316 = add i64 %315, -5
  %317 = getelementptr inbounds float, float addrspace(1)* %0, i64 %316
  %318 = load float, float addrspace(1)* %317, align 4, !tbaa !7
  %319 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 19), align 16, !tbaa !7
  %320 = fmul contract float %318, %319
  %321 = fadd contract float %312, %320
  store float %321, float addrspace(1)* %39, align 4, !tbaa !7
  %322 = add i64 %315, -4
  %323 = getelementptr inbounds float, float addrspace(1)* %0, i64 %322
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !7
  %325 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 20), align 4, !tbaa !7
  %326 = fmul contract float %324, %325
  %327 = fadd contract float %321, %326
  store float %327, float addrspace(1)* %39, align 4, !tbaa !7
  %328 = add i64 %315, -3
  %329 = getelementptr inbounds float, float addrspace(1)* %0, i64 %328
  %330 = load float, float addrspace(1)* %329, align 4, !tbaa !7
  %331 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 21), align 8, !tbaa !7
  %332 = fmul contract float %330, %331
  %333 = fadd contract float %327, %332
  store float %333, float addrspace(1)* %39, align 4, !tbaa !7
  %334 = add i64 %315, -2
  %335 = getelementptr inbounds float, float addrspace(1)* %0, i64 %334
  %336 = load float, float addrspace(1)* %335, align 4, !tbaa !7
  %337 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 22), align 4, !tbaa !7
  %338 = fmul contract float %336, %337
  %339 = fadd contract float %333, %338
  store float %339, float addrspace(1)* %39, align 4, !tbaa !7
  %340 = add i64 %315, -1
  %341 = getelementptr inbounds float, float addrspace(1)* %0, i64 %340
  %342 = load float, float addrspace(1)* %341, align 4, !tbaa !7
  %343 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 23), align 16, !tbaa !7
  %344 = fmul contract float %342, %343
  %345 = fadd contract float %339, %344
  store float %345, float addrspace(1)* %39, align 4, !tbaa !7
  %346 = getelementptr inbounds float, float addrspace(1)* %0, i64 %315
  %347 = load float, float addrspace(1)* %346, align 4, !tbaa !7
  %348 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 1, i64 24), align 4, !tbaa !7
  %349 = fmul contract float %347, %348
  %350 = fadd contract float %345, %349
  store float %350, float addrspace(1)* %39, align 4, !tbaa !7
  %351 = add i64 %315, 1
  %352 = getelementptr inbounds float, float addrspace(1)* %0, i64 %351
  %353 = load float, float addrspace(1)* %352, align 4, !tbaa !7
  %354 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 0), align 8, !tbaa !7
  %355 = fmul contract float %353, %354
  %356 = fadd contract float %350, %355
  store float %356, float addrspace(1)* %39, align 4, !tbaa !7
  %357 = add i64 %315, 2
  %358 = getelementptr inbounds float, float addrspace(1)* %0, i64 %357
  %359 = load float, float addrspace(1)* %358, align 4, !tbaa !7
  %360 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 1), align 4, !tbaa !7
  %361 = fmul contract float %359, %360
  %362 = fadd contract float %356, %361
  store float %362, float addrspace(1)* %39, align 4, !tbaa !7
  %363 = add i64 %315, 3
  %364 = getelementptr inbounds float, float addrspace(1)* %0, i64 %363
  %365 = load float, float addrspace(1)* %364, align 4, !tbaa !7
  %366 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 2), align 16, !tbaa !7
  %367 = fmul contract float %365, %366
  %368 = fadd contract float %362, %367
  store float %368, float addrspace(1)* %39, align 4, !tbaa !7
  %369 = add i64 %315, 4
  %370 = getelementptr inbounds float, float addrspace(1)* %0, i64 %369
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !7
  %372 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 3), align 4, !tbaa !7
  %373 = fmul contract float %371, %372
  %374 = fadd contract float %368, %373
  store float %374, float addrspace(1)* %39, align 4, !tbaa !7
  %375 = add i64 %315, 5
  %376 = getelementptr inbounds float, float addrspace(1)* %0, i64 %375
  %377 = load float, float addrspace(1)* %376, align 4, !tbaa !7
  %378 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 4), align 8, !tbaa !7
  %379 = fmul contract float %377, %378
  %380 = fadd contract float %374, %379
  store float %380, float addrspace(1)* %39, align 4, !tbaa !7
  %381 = mul nsw i64 %14, %24
  %382 = add i64 %381, %23
  %383 = add i64 %382, -5
  %384 = getelementptr inbounds float, float addrspace(1)* %0, i64 %383
  %385 = load float, float addrspace(1)* %384, align 4, !tbaa !7
  %386 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 5), align 4, !tbaa !7
  %387 = fmul contract float %385, %386
  %388 = fadd contract float %380, %387
  store float %388, float addrspace(1)* %39, align 4, !tbaa !7
  %389 = add i64 %382, -4
  %390 = getelementptr inbounds float, float addrspace(1)* %0, i64 %389
  %391 = load float, float addrspace(1)* %390, align 4, !tbaa !7
  %392 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 6), align 16, !tbaa !7
  %393 = fmul contract float %391, %392
  %394 = fadd contract float %388, %393
  store float %394, float addrspace(1)* %39, align 4, !tbaa !7
  %395 = add i64 %382, -3
  %396 = getelementptr inbounds float, float addrspace(1)* %0, i64 %395
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !7
  %398 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 7), align 4, !tbaa !7
  %399 = fmul contract float %397, %398
  %400 = fadd contract float %394, %399
  store float %400, float addrspace(1)* %39, align 4, !tbaa !7
  %401 = add i64 %382, -2
  %402 = getelementptr inbounds float, float addrspace(1)* %0, i64 %401
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !7
  %404 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 8), align 8, !tbaa !7
  %405 = fmul contract float %403, %404
  %406 = fadd contract float %400, %405
  store float %406, float addrspace(1)* %39, align 4, !tbaa !7
  %407 = add i64 %382, -1
  %408 = getelementptr inbounds float, float addrspace(1)* %0, i64 %407
  %409 = load float, float addrspace(1)* %408, align 4, !tbaa !7
  %410 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 9), align 4, !tbaa !7
  %411 = fmul contract float %409, %410
  %412 = fadd contract float %406, %411
  store float %412, float addrspace(1)* %39, align 4, !tbaa !7
  %413 = getelementptr inbounds float, float addrspace(1)* %0, i64 %382
  %414 = load float, float addrspace(1)* %413, align 4, !tbaa !7
  %415 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 10), align 16, !tbaa !7
  %416 = fmul contract float %414, %415
  %417 = fadd contract float %412, %416
  store float %417, float addrspace(1)* %39, align 4, !tbaa !7
  %418 = add i64 %382, 1
  %419 = getelementptr inbounds float, float addrspace(1)* %0, i64 %418
  %420 = load float, float addrspace(1)* %419, align 4, !tbaa !7
  %421 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 11), align 4, !tbaa !7
  %422 = fmul contract float %420, %421
  %423 = fadd contract float %417, %422
  store float %423, float addrspace(1)* %39, align 4, !tbaa !7
  %424 = add i64 %382, 2
  %425 = getelementptr inbounds float, float addrspace(1)* %0, i64 %424
  %426 = load float, float addrspace(1)* %425, align 4, !tbaa !7
  %427 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 12), align 8, !tbaa !7
  %428 = fmul contract float %426, %427
  %429 = fadd contract float %423, %428
  store float %429, float addrspace(1)* %39, align 4, !tbaa !7
  %430 = add i64 %382, 3
  %431 = getelementptr inbounds float, float addrspace(1)* %0, i64 %430
  %432 = load float, float addrspace(1)* %431, align 4, !tbaa !7
  %433 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 13), align 4, !tbaa !7
  %434 = fmul contract float %432, %433
  %435 = fadd contract float %429, %434
  store float %435, float addrspace(1)* %39, align 4, !tbaa !7
  %436 = add i64 %382, 4
  %437 = getelementptr inbounds float, float addrspace(1)* %0, i64 %436
  %438 = load float, float addrspace(1)* %437, align 4, !tbaa !7
  %439 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 14), align 16, !tbaa !7
  %440 = fmul contract float %438, %439
  %441 = fadd contract float %435, %440
  store float %441, float addrspace(1)* %39, align 4, !tbaa !7
  %442 = add i64 %382, 5
  %443 = getelementptr inbounds float, float addrspace(1)* %0, i64 %442
  %444 = load float, float addrspace(1)* %443, align 4, !tbaa !7
  %445 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 15), align 4, !tbaa !7
  %446 = fmul contract float %444, %445
  %447 = fadd contract float %441, %446
  store float %447, float addrspace(1)* %39, align 4, !tbaa !7
  %448 = add nuw nsw i64 %14, 1
  %449 = mul i64 %448, %24
  %450 = add i64 %449, %23
  %451 = add i64 %450, -5
  %452 = getelementptr inbounds float, float addrspace(1)* %0, i64 %451
  %453 = load float, float addrspace(1)* %452, align 4, !tbaa !7
  %454 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 16), align 8, !tbaa !7
  %455 = fmul contract float %453, %454
  %456 = fadd contract float %447, %455
  store float %456, float addrspace(1)* %39, align 4, !tbaa !7
  %457 = add i64 %450, -4
  %458 = getelementptr inbounds float, float addrspace(1)* %0, i64 %457
  %459 = load float, float addrspace(1)* %458, align 4, !tbaa !7
  %460 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 17), align 4, !tbaa !7
  %461 = fmul contract float %459, %460
  %462 = fadd contract float %456, %461
  store float %462, float addrspace(1)* %39, align 4, !tbaa !7
  %463 = add i64 %450, -3
  %464 = getelementptr inbounds float, float addrspace(1)* %0, i64 %463
  %465 = load float, float addrspace(1)* %464, align 4, !tbaa !7
  %466 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 18), align 16, !tbaa !7
  %467 = fmul contract float %465, %466
  %468 = fadd contract float %462, %467
  store float %468, float addrspace(1)* %39, align 4, !tbaa !7
  %469 = add i64 %450, -2
  %470 = getelementptr inbounds float, float addrspace(1)* %0, i64 %469
  %471 = load float, float addrspace(1)* %470, align 4, !tbaa !7
  %472 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 19), align 4, !tbaa !7
  %473 = fmul contract float %471, %472
  %474 = fadd contract float %468, %473
  store float %474, float addrspace(1)* %39, align 4, !tbaa !7
  %475 = add i64 %450, -1
  %476 = getelementptr inbounds float, float addrspace(1)* %0, i64 %475
  %477 = load float, float addrspace(1)* %476, align 4, !tbaa !7
  %478 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 20), align 8, !tbaa !7
  %479 = fmul contract float %477, %478
  %480 = fadd contract float %474, %479
  store float %480, float addrspace(1)* %39, align 4, !tbaa !7
  %481 = getelementptr inbounds float, float addrspace(1)* %0, i64 %450
  %482 = load float, float addrspace(1)* %481, align 4, !tbaa !7
  %483 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 21), align 4, !tbaa !7
  %484 = fmul contract float %482, %483
  %485 = fadd contract float %480, %484
  store float %485, float addrspace(1)* %39, align 4, !tbaa !7
  %486 = add i64 %450, 1
  %487 = getelementptr inbounds float, float addrspace(1)* %0, i64 %486
  %488 = load float, float addrspace(1)* %487, align 4, !tbaa !7
  %489 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 22), align 16, !tbaa !7
  %490 = fmul contract float %488, %489
  %491 = fadd contract float %485, %490
  store float %491, float addrspace(1)* %39, align 4, !tbaa !7
  %492 = add i64 %450, 2
  %493 = getelementptr inbounds float, float addrspace(1)* %0, i64 %492
  %494 = load float, float addrspace(1)* %493, align 4, !tbaa !7
  %495 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 23), align 4, !tbaa !7
  %496 = fmul contract float %494, %495
  %497 = fadd contract float %491, %496
  store float %497, float addrspace(1)* %39, align 4, !tbaa !7
  %498 = add i64 %450, 3
  %499 = getelementptr inbounds float, float addrspace(1)* %0, i64 %498
  %500 = load float, float addrspace(1)* %499, align 4, !tbaa !7
  %501 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 2, i64 24), align 8, !tbaa !7
  %502 = fmul contract float %500, %501
  %503 = fadd contract float %497, %502
  store float %503, float addrspace(1)* %39, align 4, !tbaa !7
  %504 = add i64 %450, 4
  %505 = getelementptr inbounds float, float addrspace(1)* %0, i64 %504
  %506 = load float, float addrspace(1)* %505, align 4, !tbaa !7
  %507 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 0), align 4, !tbaa !7
  %508 = fmul contract float %506, %507
  %509 = fadd contract float %503, %508
  store float %509, float addrspace(1)* %39, align 4, !tbaa !7
  %510 = add i64 %450, 5
  %511 = getelementptr inbounds float, float addrspace(1)* %0, i64 %510
  %512 = load float, float addrspace(1)* %511, align 4, !tbaa !7
  %513 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 1), align 16, !tbaa !7
  %514 = fmul contract float %512, %513
  %515 = fadd contract float %509, %514
  store float %515, float addrspace(1)* %39, align 4, !tbaa !7
  %516 = add nuw nsw i64 %14, 2
  %517 = mul i64 %516, %24
  %518 = add i64 %517, %23
  %519 = add i64 %518, -5
  %520 = getelementptr inbounds float, float addrspace(1)* %0, i64 %519
  %521 = load float, float addrspace(1)* %520, align 4, !tbaa !7
  %522 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 2), align 4, !tbaa !7
  %523 = fmul contract float %521, %522
  %524 = fadd contract float %515, %523
  store float %524, float addrspace(1)* %39, align 4, !tbaa !7
  %525 = add i64 %518, -4
  %526 = getelementptr inbounds float, float addrspace(1)* %0, i64 %525
  %527 = load float, float addrspace(1)* %526, align 4, !tbaa !7
  %528 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 3), align 8, !tbaa !7
  %529 = fmul contract float %527, %528
  %530 = fadd contract float %524, %529
  store float %530, float addrspace(1)* %39, align 4, !tbaa !7
  %531 = add i64 %518, -3
  %532 = getelementptr inbounds float, float addrspace(1)* %0, i64 %531
  %533 = load float, float addrspace(1)* %532, align 4, !tbaa !7
  %534 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 4), align 4, !tbaa !7
  %535 = fmul contract float %533, %534
  %536 = fadd contract float %530, %535
  store float %536, float addrspace(1)* %39, align 4, !tbaa !7
  %537 = add i64 %518, -2
  %538 = getelementptr inbounds float, float addrspace(1)* %0, i64 %537
  %539 = load float, float addrspace(1)* %538, align 4, !tbaa !7
  %540 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 5), align 16, !tbaa !7
  %541 = fmul contract float %539, %540
  %542 = fadd contract float %536, %541
  store float %542, float addrspace(1)* %39, align 4, !tbaa !7
  %543 = add i64 %518, -1
  %544 = getelementptr inbounds float, float addrspace(1)* %0, i64 %543
  %545 = load float, float addrspace(1)* %544, align 4, !tbaa !7
  %546 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 6), align 4, !tbaa !7
  %547 = fmul contract float %545, %546
  %548 = fadd contract float %542, %547
  store float %548, float addrspace(1)* %39, align 4, !tbaa !7
  %549 = getelementptr inbounds float, float addrspace(1)* %0, i64 %518
  %550 = load float, float addrspace(1)* %549, align 4, !tbaa !7
  %551 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 7), align 8, !tbaa !7
  %552 = fmul contract float %550, %551
  %553 = fadd contract float %548, %552
  store float %553, float addrspace(1)* %39, align 4, !tbaa !7
  %554 = add i64 %518, 1
  %555 = getelementptr inbounds float, float addrspace(1)* %0, i64 %554
  %556 = load float, float addrspace(1)* %555, align 4, !tbaa !7
  %557 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 8), align 4, !tbaa !7
  %558 = fmul contract float %556, %557
  %559 = fadd contract float %553, %558
  store float %559, float addrspace(1)* %39, align 4, !tbaa !7
  %560 = add i64 %518, 2
  %561 = getelementptr inbounds float, float addrspace(1)* %0, i64 %560
  %562 = load float, float addrspace(1)* %561, align 4, !tbaa !7
  %563 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 9), align 16, !tbaa !7
  %564 = fmul contract float %562, %563
  %565 = fadd contract float %559, %564
  store float %565, float addrspace(1)* %39, align 4, !tbaa !7
  %566 = add i64 %518, 3
  %567 = getelementptr inbounds float, float addrspace(1)* %0, i64 %566
  %568 = load float, float addrspace(1)* %567, align 4, !tbaa !7
  %569 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 10), align 4, !tbaa !7
  %570 = fmul contract float %568, %569
  %571 = fadd contract float %565, %570
  store float %571, float addrspace(1)* %39, align 4, !tbaa !7
  %572 = add i64 %518, 4
  %573 = getelementptr inbounds float, float addrspace(1)* %0, i64 %572
  %574 = load float, float addrspace(1)* %573, align 4, !tbaa !7
  %575 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 11), align 8, !tbaa !7
  %576 = fmul contract float %574, %575
  %577 = fadd contract float %571, %576
  store float %577, float addrspace(1)* %39, align 4, !tbaa !7
  %578 = add i64 %518, 5
  %579 = getelementptr inbounds float, float addrspace(1)* %0, i64 %578
  %580 = load float, float addrspace(1)* %579, align 4, !tbaa !7
  %581 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 12), align 4, !tbaa !7
  %582 = fmul contract float %580, %581
  %583 = fadd contract float %577, %582
  store float %583, float addrspace(1)* %39, align 4, !tbaa !7
  %584 = add nuw nsw i64 %14, 3
  %585 = mul i64 %584, %24
  %586 = add i64 %585, %23
  %587 = add i64 %586, -5
  %588 = getelementptr inbounds float, float addrspace(1)* %0, i64 %587
  %589 = load float, float addrspace(1)* %588, align 4, !tbaa !7
  %590 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 13), align 16, !tbaa !7
  %591 = fmul contract float %589, %590
  %592 = fadd contract float %583, %591
  store float %592, float addrspace(1)* %39, align 4, !tbaa !7
  %593 = add i64 %586, -4
  %594 = getelementptr inbounds float, float addrspace(1)* %0, i64 %593
  %595 = load float, float addrspace(1)* %594, align 4, !tbaa !7
  %596 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 14), align 4, !tbaa !7
  %597 = fmul contract float %595, %596
  %598 = fadd contract float %592, %597
  store float %598, float addrspace(1)* %39, align 4, !tbaa !7
  %599 = add i64 %586, -3
  %600 = getelementptr inbounds float, float addrspace(1)* %0, i64 %599
  %601 = load float, float addrspace(1)* %600, align 4, !tbaa !7
  %602 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 15), align 8, !tbaa !7
  %603 = fmul contract float %601, %602
  %604 = fadd contract float %598, %603
  store float %604, float addrspace(1)* %39, align 4, !tbaa !7
  %605 = add i64 %586, -2
  %606 = getelementptr inbounds float, float addrspace(1)* %0, i64 %605
  %607 = load float, float addrspace(1)* %606, align 4, !tbaa !7
  %608 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 16), align 4, !tbaa !7
  %609 = fmul contract float %607, %608
  %610 = fadd contract float %604, %609
  store float %610, float addrspace(1)* %39, align 4, !tbaa !7
  %611 = add i64 %586, -1
  %612 = getelementptr inbounds float, float addrspace(1)* %0, i64 %611
  %613 = load float, float addrspace(1)* %612, align 4, !tbaa !7
  %614 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 17), align 16, !tbaa !7
  %615 = fmul contract float %613, %614
  %616 = fadd contract float %610, %615
  store float %616, float addrspace(1)* %39, align 4, !tbaa !7
  %617 = getelementptr inbounds float, float addrspace(1)* %0, i64 %586
  %618 = load float, float addrspace(1)* %617, align 4, !tbaa !7
  %619 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 18), align 4, !tbaa !7
  %620 = fmul contract float %618, %619
  %621 = fadd contract float %616, %620
  store float %621, float addrspace(1)* %39, align 4, !tbaa !7
  %622 = add i64 %586, 1
  %623 = getelementptr inbounds float, float addrspace(1)* %0, i64 %622
  %624 = load float, float addrspace(1)* %623, align 4, !tbaa !7
  %625 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 19), align 8, !tbaa !7
  %626 = fmul contract float %624, %625
  %627 = fadd contract float %621, %626
  store float %627, float addrspace(1)* %39, align 4, !tbaa !7
  %628 = add i64 %586, 2
  %629 = getelementptr inbounds float, float addrspace(1)* %0, i64 %628
  %630 = load float, float addrspace(1)* %629, align 4, !tbaa !7
  %631 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 20), align 4, !tbaa !7
  %632 = fmul contract float %630, %631
  %633 = fadd contract float %627, %632
  store float %633, float addrspace(1)* %39, align 4, !tbaa !7
  %634 = add i64 %586, 3
  %635 = getelementptr inbounds float, float addrspace(1)* %0, i64 %634
  %636 = load float, float addrspace(1)* %635, align 4, !tbaa !7
  %637 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 21), align 16, !tbaa !7
  %638 = fmul contract float %636, %637
  %639 = fadd contract float %633, %638
  store float %639, float addrspace(1)* %39, align 4, !tbaa !7
  %640 = add i64 %586, 4
  %641 = getelementptr inbounds float, float addrspace(1)* %0, i64 %640
  %642 = load float, float addrspace(1)* %641, align 4, !tbaa !7
  %643 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 22), align 4, !tbaa !7
  %644 = fmul contract float %642, %643
  %645 = fadd contract float %639, %644
  store float %645, float addrspace(1)* %39, align 4, !tbaa !7
  %646 = add i64 %586, 5
  %647 = getelementptr inbounds float, float addrspace(1)* %0, i64 %646
  %648 = load float, float addrspace(1)* %647, align 4, !tbaa !7
  %649 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 23), align 8, !tbaa !7
  %650 = fmul contract float %648, %649
  %651 = fadd contract float %645, %650
  store float %651, float addrspace(1)* %39, align 4, !tbaa !7
  %652 = add nuw nsw i64 %14, 4
  %653 = mul i64 %652, %24
  %654 = add i64 %653, %23
  %655 = add i64 %654, -5
  %656 = getelementptr inbounds float, float addrspace(1)* %0, i64 %655
  %657 = load float, float addrspace(1)* %656, align 4, !tbaa !7
  %658 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 3, i64 24), align 4, !tbaa !7
  %659 = fmul contract float %657, %658
  %660 = fadd contract float %651, %659
  store float %660, float addrspace(1)* %39, align 4, !tbaa !7
  %661 = add i64 %654, -4
  %662 = getelementptr inbounds float, float addrspace(1)* %0, i64 %661
  %663 = load float, float addrspace(1)* %662, align 4, !tbaa !7
  %664 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 0), align 16, !tbaa !7
  %665 = fmul contract float %663, %664
  %666 = fadd contract float %660, %665
  store float %666, float addrspace(1)* %39, align 4, !tbaa !7
  %667 = add i64 %654, -3
  %668 = getelementptr inbounds float, float addrspace(1)* %0, i64 %667
  %669 = load float, float addrspace(1)* %668, align 4, !tbaa !7
  %670 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 1), align 4, !tbaa !7
  %671 = fmul contract float %669, %670
  %672 = fadd contract float %666, %671
  store float %672, float addrspace(1)* %39, align 4, !tbaa !7
  %673 = add i64 %654, -2
  %674 = getelementptr inbounds float, float addrspace(1)* %0, i64 %673
  %675 = load float, float addrspace(1)* %674, align 4, !tbaa !7
  %676 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 2), align 8, !tbaa !7
  %677 = fmul contract float %675, %676
  %678 = fadd contract float %672, %677
  store float %678, float addrspace(1)* %39, align 4, !tbaa !7
  %679 = add i64 %654, -1
  %680 = getelementptr inbounds float, float addrspace(1)* %0, i64 %679
  %681 = load float, float addrspace(1)* %680, align 4, !tbaa !7
  %682 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 3), align 4, !tbaa !7
  %683 = fmul contract float %681, %682
  %684 = fadd contract float %678, %683
  store float %684, float addrspace(1)* %39, align 4, !tbaa !7
  %685 = getelementptr inbounds float, float addrspace(1)* %0, i64 %654
  %686 = load float, float addrspace(1)* %685, align 4, !tbaa !7
  %687 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 4), align 16, !tbaa !7
  %688 = fmul contract float %686, %687
  %689 = fadd contract float %684, %688
  store float %689, float addrspace(1)* %39, align 4, !tbaa !7
  %690 = add i64 %654, 1
  %691 = getelementptr inbounds float, float addrspace(1)* %0, i64 %690
  %692 = load float, float addrspace(1)* %691, align 4, !tbaa !7
  %693 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 5), align 4, !tbaa !7
  %694 = fmul contract float %692, %693
  %695 = fadd contract float %689, %694
  store float %695, float addrspace(1)* %39, align 4, !tbaa !7
  %696 = add i64 %654, 2
  %697 = getelementptr inbounds float, float addrspace(1)* %0, i64 %696
  %698 = load float, float addrspace(1)* %697, align 4, !tbaa !7
  %699 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 6), align 8, !tbaa !7
  %700 = fmul contract float %698, %699
  %701 = fadd contract float %695, %700
  store float %701, float addrspace(1)* %39, align 4, !tbaa !7
  %702 = add i64 %654, 3
  %703 = getelementptr inbounds float, float addrspace(1)* %0, i64 %702
  %704 = load float, float addrspace(1)* %703, align 4, !tbaa !7
  %705 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 7), align 4, !tbaa !7
  %706 = fmul contract float %704, %705
  %707 = fadd contract float %701, %706
  store float %707, float addrspace(1)* %39, align 4, !tbaa !7
  %708 = add i64 %654, 4
  %709 = getelementptr inbounds float, float addrspace(1)* %0, i64 %708
  %710 = load float, float addrspace(1)* %709, align 4, !tbaa !7
  %711 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 8), align 16, !tbaa !7
  %712 = fmul contract float %710, %711
  %713 = fadd contract float %707, %712
  store float %713, float addrspace(1)* %39, align 4, !tbaa !7
  %714 = add i64 %654, 5
  %715 = getelementptr inbounds float, float addrspace(1)* %0, i64 %714
  %716 = load float, float addrspace(1)* %715, align 4, !tbaa !7
  %717 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 9), align 4, !tbaa !7
  %718 = fmul contract float %716, %717
  %719 = fadd contract float %713, %718
  store float %719, float addrspace(1)* %39, align 4, !tbaa !7
  %720 = add nuw nsw i64 %14, 5
  %721 = mul i64 %720, %24
  %722 = add i64 %721, %23
  %723 = add i64 %722, -5
  %724 = getelementptr inbounds float, float addrspace(1)* %0, i64 %723
  %725 = load float, float addrspace(1)* %724, align 4, !tbaa !7
  %726 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 10), align 8, !tbaa !7
  %727 = fmul contract float %725, %726
  %728 = fadd contract float %719, %727
  store float %728, float addrspace(1)* %39, align 4, !tbaa !7
  %729 = add i64 %722, -4
  %730 = getelementptr inbounds float, float addrspace(1)* %0, i64 %729
  %731 = load float, float addrspace(1)* %730, align 4, !tbaa !7
  %732 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 11), align 4, !tbaa !7
  %733 = fmul contract float %731, %732
  %734 = fadd contract float %728, %733
  store float %734, float addrspace(1)* %39, align 4, !tbaa !7
  %735 = add i64 %722, -3
  %736 = getelementptr inbounds float, float addrspace(1)* %0, i64 %735
  %737 = load float, float addrspace(1)* %736, align 4, !tbaa !7
  %738 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 12), align 16, !tbaa !7
  %739 = fmul contract float %737, %738
  %740 = fadd contract float %734, %739
  store float %740, float addrspace(1)* %39, align 4, !tbaa !7
  %741 = add i64 %722, -2
  %742 = getelementptr inbounds float, float addrspace(1)* %0, i64 %741
  %743 = load float, float addrspace(1)* %742, align 4, !tbaa !7
  %744 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 13), align 4, !tbaa !7
  %745 = fmul contract float %743, %744
  %746 = fadd contract float %740, %745
  store float %746, float addrspace(1)* %39, align 4, !tbaa !7
  %747 = add i64 %722, -1
  %748 = getelementptr inbounds float, float addrspace(1)* %0, i64 %747
  %749 = load float, float addrspace(1)* %748, align 4, !tbaa !7
  %750 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 14), align 8, !tbaa !7
  %751 = fmul contract float %749, %750
  %752 = fadd contract float %746, %751
  store float %752, float addrspace(1)* %39, align 4, !tbaa !7
  %753 = getelementptr inbounds float, float addrspace(1)* %0, i64 %722
  %754 = load float, float addrspace(1)* %753, align 4, !tbaa !7
  %755 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 15), align 4, !tbaa !7
  %756 = fmul contract float %754, %755
  %757 = fadd contract float %752, %756
  store float %757, float addrspace(1)* %39, align 4, !tbaa !7
  %758 = add i64 %722, 1
  %759 = getelementptr inbounds float, float addrspace(1)* %0, i64 %758
  %760 = load float, float addrspace(1)* %759, align 4, !tbaa !7
  %761 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 16), align 16, !tbaa !7
  %762 = fmul contract float %760, %761
  %763 = fadd contract float %757, %762
  store float %763, float addrspace(1)* %39, align 4, !tbaa !7
  %764 = add i64 %722, 2
  %765 = getelementptr inbounds float, float addrspace(1)* %0, i64 %764
  %766 = load float, float addrspace(1)* %765, align 4, !tbaa !7
  %767 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 17), align 4, !tbaa !7
  %768 = fmul contract float %766, %767
  %769 = fadd contract float %763, %768
  store float %769, float addrspace(1)* %39, align 4, !tbaa !7
  %770 = add i64 %722, 3
  %771 = getelementptr inbounds float, float addrspace(1)* %0, i64 %770
  %772 = load float, float addrspace(1)* %771, align 4, !tbaa !7
  %773 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 18), align 8, !tbaa !7
  %774 = fmul contract float %772, %773
  %775 = fadd contract float %769, %774
  store float %775, float addrspace(1)* %39, align 4, !tbaa !7
  %776 = add i64 %722, 4
  %777 = getelementptr inbounds float, float addrspace(1)* %0, i64 %776
  %778 = load float, float addrspace(1)* %777, align 4, !tbaa !7
  %779 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 19), align 4, !tbaa !7
  %780 = fmul contract float %778, %779
  %781 = fadd contract float %775, %780
  store float %781, float addrspace(1)* %39, align 4, !tbaa !7
  %782 = add i64 %722, 5
  %783 = getelementptr inbounds float, float addrspace(1)* %0, i64 %782
  %784 = load float, float addrspace(1)* %783, align 4, !tbaa !7
  %785 = load float, float addrspace(4)* getelementptr inbounds ([25 x float], [25 x float] addrspace(4)* @gaussian_kernel, i64 4, i64 20), align 16, !tbaa !7
  %786 = fmul contract float %784, %785
  %787 = fadd contract float %781, %786
  store float %787, float addrspace(1)* %39, align 4, !tbaa !7
  br label %788

788:                                              ; preds = %38, %4, %32
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
