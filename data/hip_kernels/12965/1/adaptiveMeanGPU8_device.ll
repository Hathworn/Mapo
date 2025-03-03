; ModuleID = '../data/hip_kernels/12965/1/main.cu'
source_filename = "../data/hip_kernels/12965/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16adaptiveMeanGPU8PfiiE8D_shared = internal unnamed_addr addrspace(3) global [39 x [39 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16adaptiveMeanGPU8Pfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %5, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = add i32 %12, 4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = add i32 %21, 4
  %23 = mul i32 %22, %1
  %24 = add i32 %23, %13
  %25 = add nuw nsw i32 %11, 4
  %26 = add nuw nsw i32 %20, 4
  %27 = add nsw i32 %1, -4
  %28 = icmp ugt i32 %13, %27
  %29 = add nsw i32 %2, -4
  %30 = icmp ugt i32 %22, %29
  %31 = select i1 %28, i1 true, i1 %30
  br i1 %31, label %407, label %32

32:                                               ; preds = %3
  %33 = add nsw i32 %9, -1
  %34 = icmp eq i32 %11, %33
  br i1 %34, label %35, label %54

35:                                               ; preds = %32
  %36 = add i32 %24, 1
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = add nuw nsw i32 %11, 5
  %41 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %40, i32 %26
  store float %39, float addrspace(3)* %41, align 4, !tbaa !7
  %42 = add i32 %24, 2
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = add nuw nsw i32 %11, 6
  %47 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %46, i32 %26
  store float %45, float addrspace(3)* %47, align 4, !tbaa !7
  %48 = add i32 %24, 3
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = add nuw nsw i32 %11, 7
  %53 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %52, i32 %26
  store float %51, float addrspace(3)* %53, align 4, !tbaa !7
  br label %54

54:                                               ; preds = %35, %32
  %55 = icmp eq i32 %11, 0
  br i1 %55, label %56, label %77

56:                                               ; preds = %54
  %57 = add i32 %23, %12
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 0, i32 %26
  store float %60, float addrspace(3)* %61, align 4, !tbaa !7
  %62 = add i32 %24, -3
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 1, i32 %26
  store float %65, float addrspace(3)* %66, align 4, !tbaa !7
  %67 = add i32 %24, -2
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 2, i32 %26
  store float %70, float addrspace(3)* %71, align 4, !tbaa !7
  %72 = add i32 %24, -1
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 3, i32 %26
  store float %75, float addrspace(3)* %76, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %56, %54
  %78 = icmp eq i32 %20, 0
  br i1 %78, label %79, label %107

79:                                               ; preds = %77
  %80 = mul i32 %21, %1
  %81 = add i32 %80, %13
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 0
  store float %84, float addrspace(3)* %85, align 4, !tbaa !7
  %86 = add i32 %21, 1
  %87 = mul i32 %86, %1
  %88 = add i32 %87, %13
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 1
  store float %91, float addrspace(3)* %92, align 4, !tbaa !7
  %93 = add i32 %21, 2
  %94 = mul i32 %93, %1
  %95 = add i32 %94, %13
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 2
  store float %98, float addrspace(3)* %99, align 4, !tbaa !7
  %100 = add i32 %21, 3
  %101 = mul i32 %100, %1
  %102 = add i32 %101, %13
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 3
  store float %105, float addrspace(3)* %106, align 4, !tbaa !7
  br label %107

107:                                              ; preds = %79, %77
  %108 = add nsw i32 %18, -1
  %109 = icmp eq i32 %20, %108
  br i1 %109, label %110, label %135

110:                                              ; preds = %107
  %111 = add i32 %21, 5
  %112 = mul i32 %111, %1
  %113 = add i32 %112, %13
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = add nuw nsw i32 %20, 5
  %118 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %117
  store float %116, float addrspace(3)* %118, align 4, !tbaa !7
  %119 = add i32 %21, 6
  %120 = mul i32 %119, %1
  %121 = add i32 %120, %13
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = add nuw nsw i32 %20, 6
  %126 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %125
  store float %124, float addrspace(3)* %126, align 4, !tbaa !7
  %127 = add i32 %21, 7
  %128 = mul i32 %127, %1
  %129 = add i32 %128, %13
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = add nuw nsw i32 %20, 7
  %134 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %133
  store float %132, float addrspace(3)* %134, align 4, !tbaa !7
  br label %135

135:                                              ; preds = %110, %107
  %136 = zext i32 %24 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = fcmp contract olt float %138, 0.000000e+00
  %140 = select i1 %139, float -1.000000e+01, float %138
  %141 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %26
  store float %140, float addrspace(3)* %141, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %142 = load float, float addrspace(3)* %141, align 4, !tbaa !7
  %143 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %11, i32 %26
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !7
  %145 = fsub contract float %144, %142
  %146 = tail call float @llvm.fabs.f32(float %145)
  %147 = fsub contract float 4.000000e+00, %146
  %148 = tail call float @llvm.maxnum.f32(float %147, float 0.000000e+00)
  %149 = fadd contract float %148, 0.000000e+00
  %150 = add nuw nsw i32 %11, 1
  %151 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %150, i32 %26
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !7
  %153 = fsub contract float %152, %142
  %154 = tail call float @llvm.fabs.f32(float %153)
  %155 = fsub contract float 4.000000e+00, %154
  %156 = tail call float @llvm.maxnum.f32(float %155, float 0.000000e+00)
  %157 = fadd contract float %149, %156
  %158 = add nuw nsw i32 %11, 2
  %159 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %158, i32 %26
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !7
  %161 = fsub contract float %160, %142
  %162 = tail call float @llvm.fabs.f32(float %161)
  %163 = fsub contract float 4.000000e+00, %162
  %164 = tail call float @llvm.maxnum.f32(float %163, float 0.000000e+00)
  %165 = fadd contract float %157, %164
  %166 = add nuw nsw i32 %11, 3
  %167 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %166, i32 %26
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !7
  %169 = fsub contract float %168, %142
  %170 = tail call float @llvm.fabs.f32(float %169)
  %171 = fsub contract float 4.000000e+00, %170
  %172 = tail call float @llvm.maxnum.f32(float %171, float 0.000000e+00)
  %173 = fadd contract float %165, %172
  %174 = fsub contract float %142, %142
  %175 = tail call float @llvm.fabs.f32(float %174)
  %176 = fsub contract float 4.000000e+00, %175
  %177 = tail call float @llvm.maxnum.f32(float %176, float 0.000000e+00)
  %178 = fadd contract float %173, %177
  %179 = add nuw nsw i32 %11, 5
  %180 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %179, i32 %26
  %181 = load float, float addrspace(3)* %180, align 4, !tbaa !7
  %182 = fsub contract float %181, %142
  %183 = tail call float @llvm.fabs.f32(float %182)
  %184 = fsub contract float 4.000000e+00, %183
  %185 = tail call float @llvm.maxnum.f32(float %184, float 0.000000e+00)
  %186 = fadd contract float %178, %185
  %187 = add nuw nsw i32 %11, 6
  %188 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %187, i32 %26
  %189 = load float, float addrspace(3)* %188, align 4, !tbaa !7
  %190 = fsub contract float %189, %142
  %191 = tail call float @llvm.fabs.f32(float %190)
  %192 = fsub contract float 4.000000e+00, %191
  %193 = tail call float @llvm.maxnum.f32(float %192, float 0.000000e+00)
  %194 = fadd contract float %186, %193
  %195 = add nuw nsw i32 %11, 7
  %196 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %195, i32 %26
  %197 = load float, float addrspace(3)* %196, align 4, !tbaa !7
  %198 = fsub contract float %197, %142
  %199 = tail call float @llvm.fabs.f32(float %198)
  %200 = fsub contract float 4.000000e+00, %199
  %201 = tail call float @llvm.maxnum.f32(float %200, float 0.000000e+00)
  %202 = fadd contract float %194, %201
  %203 = fcmp contract ogt float %202, 0.000000e+00
  br i1 %203, label %204, label %224

204:                                              ; preds = %135
  %205 = fmul contract float %144, %148
  %206 = fadd contract float %205, 0.000000e+00
  %207 = fmul contract float %152, %156
  %208 = fadd contract float %206, %207
  %209 = fmul contract float %160, %164
  %210 = fadd contract float %208, %209
  %211 = fmul contract float %168, %172
  %212 = fadd contract float %210, %211
  %213 = fmul contract float %142, %177
  %214 = fadd contract float %212, %213
  %215 = fmul contract float %181, %185
  %216 = fadd contract float %214, %215
  %217 = fmul contract float %189, %193
  %218 = fadd contract float %216, %217
  %219 = fmul contract float %197, %201
  %220 = fadd contract float %218, %219
  %221 = fdiv contract float %220, %202
  %222 = fcmp contract ult float %221, 0.000000e+00
  br i1 %222, label %224, label %223

223:                                              ; preds = %204
  store float %221, float addrspace(1)* %137, align 4, !tbaa !7
  br label %224

224:                                              ; preds = %204, %223, %135
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %225, label %238

225:                                              ; preds = %224
  %226 = add i32 %24, 1
  %227 = zext i32 %226 to i64
  %228 = getelementptr inbounds float, float addrspace(1)* %0, i64 %227
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !7
  store float %229, float addrspace(3)* %180, align 4, !tbaa !7
  %230 = add i32 %24, 2
  %231 = zext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %0, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !7
  store float %233, float addrspace(3)* %188, align 4, !tbaa !7
  %234 = add i32 %24, 3
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %0, i64 %235
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !7
  store float %237, float addrspace(3)* %196, align 4, !tbaa !7
  br label %238

238:                                              ; preds = %225, %224
  br i1 %55, label %239, label %260

239:                                              ; preds = %238
  %240 = add i32 %23, %12
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %0, i64 %241
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !7
  %244 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 0, i32 %26
  store float %243, float addrspace(3)* %244, align 4, !tbaa !7
  %245 = add i32 %24, -3
  %246 = zext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %0, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !7
  %249 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 1, i32 %26
  store float %248, float addrspace(3)* %249, align 4, !tbaa !7
  %250 = add i32 %24, -2
  %251 = zext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %0, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !7
  %254 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 2, i32 %26
  store float %253, float addrspace(3)* %254, align 4, !tbaa !7
  %255 = add i32 %24, -1
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %0, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !7
  %259 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 3, i32 %26
  store float %258, float addrspace(3)* %259, align 4, !tbaa !7
  br label %260

260:                                              ; preds = %239, %238
  br i1 %78, label %261, label %289

261:                                              ; preds = %260
  %262 = mul i32 %21, %1
  %263 = add i32 %262, %13
  %264 = zext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %0, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !7
  %267 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 0
  store float %266, float addrspace(3)* %267, align 4, !tbaa !7
  %268 = add i32 %21, 1
  %269 = mul i32 %268, %1
  %270 = add i32 %269, %13
  %271 = zext i32 %270 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %0, i64 %271
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !7
  %274 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 1
  store float %273, float addrspace(3)* %274, align 4, !tbaa !7
  %275 = add i32 %21, 2
  %276 = mul i32 %275, %1
  %277 = add i32 %276, %13
  %278 = zext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %0, i64 %278
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !7
  %281 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 2
  store float %280, float addrspace(3)* %281, align 4, !tbaa !7
  %282 = add i32 %21, 3
  %283 = mul i32 %282, %1
  %284 = add i32 %283, %13
  %285 = zext i32 %284 to i64
  %286 = getelementptr inbounds float, float addrspace(1)* %0, i64 %285
  %287 = load float, float addrspace(1)* %286, align 4, !tbaa !7
  %288 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 3
  store float %287, float addrspace(3)* %288, align 4, !tbaa !7
  br label %289

289:                                              ; preds = %261, %260
  br i1 %109, label %294, label %290

290:                                              ; preds = %289
  %291 = add nuw nsw i32 %20, 5
  %292 = add nuw nsw i32 %20, 6
  %293 = add nuw nsw i32 %20, 7
  br label %319

294:                                              ; preds = %289
  %295 = add i32 %21, 5
  %296 = mul i32 %295, %1
  %297 = add i32 %296, %13
  %298 = zext i32 %297 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %0, i64 %298
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !7
  %301 = add nuw nsw i32 %20, 5
  %302 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %301
  store float %300, float addrspace(3)* %302, align 4, !tbaa !7
  %303 = add i32 %21, 6
  %304 = mul i32 %303, %1
  %305 = add i32 %304, %13
  %306 = zext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %0, i64 %306
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !7
  %309 = add nuw nsw i32 %20, 6
  %310 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %309
  store float %308, float addrspace(3)* %310, align 4, !tbaa !7
  %311 = add i32 %21, 7
  %312 = mul i32 %311, %1
  %313 = add i32 %312, %13
  %314 = zext i32 %313 to i64
  %315 = getelementptr inbounds float, float addrspace(1)* %0, i64 %314
  %316 = load float, float addrspace(1)* %315, align 4, !tbaa !7
  %317 = add nuw nsw i32 %20, 7
  %318 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %317
  store float %316, float addrspace(3)* %318, align 4, !tbaa !7
  br label %319

319:                                              ; preds = %290, %294
  %320 = phi i32 [ %293, %290 ], [ %317, %294 ]
  %321 = phi i32 [ %292, %290 ], [ %309, %294 ]
  %322 = phi i32 [ %291, %290 ], [ %301, %294 ]
  %323 = load float, float addrspace(1)* %137, align 4, !tbaa !7
  %324 = fcmp contract olt float %323, 0.000000e+00
  %325 = select i1 %324, float -1.000000e+01, float %323
  store float %325, float addrspace(3)* %141, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %326 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %20
  %327 = load float, float addrspace(3)* %326, align 4, !tbaa !7
  %328 = add nuw nsw i32 %20, 1
  %329 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %328
  %330 = load float, float addrspace(3)* %329, align 4, !tbaa !7
  %331 = add nuw nsw i32 %20, 2
  %332 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %331
  %333 = load float, float addrspace(3)* %332, align 4, !tbaa !7
  %334 = add nuw nsw i32 %20, 3
  %335 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %334
  %336 = bitcast float addrspace(3)* %335 to <2 x float> addrspace(3)*
  %337 = load <2 x float>, <2 x float> addrspace(3)* %336, align 4, !tbaa !7
  %338 = extractelement <2 x float> %337, i64 1
  %339 = fsub contract float %327, %338
  %340 = tail call float @llvm.fabs.f32(float %339)
  %341 = fsub contract float 4.000000e+00, %340
  %342 = tail call float @llvm.maxnum.f32(float %341, float 0.000000e+00)
  %343 = fadd contract float %342, 0.000000e+00
  %344 = fsub contract float %330, %338
  %345 = tail call float @llvm.fabs.f32(float %344)
  %346 = fsub contract float 4.000000e+00, %345
  %347 = tail call float @llvm.maxnum.f32(float %346, float 0.000000e+00)
  %348 = fadd contract float %343, %347
  %349 = fsub contract float %333, %338
  %350 = tail call float @llvm.fabs.f32(float %349)
  %351 = fsub contract float 4.000000e+00, %350
  %352 = tail call float @llvm.maxnum.f32(float %351, float 0.000000e+00)
  %353 = fadd contract float %348, %352
  %354 = extractelement <2 x float> %337, i64 0
  %355 = fsub contract float %354, %338
  %356 = tail call float @llvm.fabs.f32(float %355)
  %357 = fsub contract float 4.000000e+00, %356
  %358 = tail call float @llvm.maxnum.f32(float %357, float 0.000000e+00)
  %359 = fadd contract float %353, %358
  %360 = fsub contract float %338, %338
  %361 = tail call float @llvm.fabs.f32(float %360)
  %362 = fsub contract float 4.000000e+00, %361
  %363 = tail call float @llvm.maxnum.f32(float %362, float 0.000000e+00)
  %364 = fadd contract float %359, %363
  %365 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %322
  %366 = load float, float addrspace(3)* %365, align 4, !tbaa !7
  %367 = fsub contract float %366, %338
  %368 = tail call float @llvm.fabs.f32(float %367)
  %369 = fsub contract float 4.000000e+00, %368
  %370 = tail call float @llvm.maxnum.f32(float %369, float 0.000000e+00)
  %371 = fadd contract float %364, %370
  %372 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %321
  %373 = load float, float addrspace(3)* %372, align 4, !tbaa !7
  %374 = fsub contract float %373, %338
  %375 = tail call float @llvm.fabs.f32(float %374)
  %376 = fsub contract float 4.000000e+00, %375
  %377 = tail call float @llvm.maxnum.f32(float %376, float 0.000000e+00)
  %378 = fadd contract float %371, %377
  %379 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ16adaptiveMeanGPU8PfiiE8D_shared, i32 0, i32 %25, i32 %320
  %380 = load float, float addrspace(3)* %379, align 4, !tbaa !7
  %381 = fsub contract float %380, %338
  %382 = tail call float @llvm.fabs.f32(float %381)
  %383 = fsub contract float 4.000000e+00, %382
  %384 = tail call float @llvm.maxnum.f32(float %383, float 0.000000e+00)
  %385 = fadd contract float %378, %384
  %386 = fcmp contract ogt float %385, 0.000000e+00
  br i1 %386, label %387, label %407

387:                                              ; preds = %319
  %388 = fmul contract float %327, %342
  %389 = fadd contract float %388, 0.000000e+00
  %390 = fmul contract float %330, %347
  %391 = fadd contract float %389, %390
  %392 = fmul contract float %333, %352
  %393 = fadd contract float %391, %392
  %394 = fmul contract float %354, %358
  %395 = fadd contract float %393, %394
  %396 = fmul contract float %338, %363
  %397 = fadd contract float %395, %396
  %398 = fmul contract float %366, %370
  %399 = fadd contract float %397, %398
  %400 = fmul contract float %373, %377
  %401 = fadd contract float %399, %400
  %402 = fmul contract float %380, %384
  %403 = fadd contract float %401, %402
  %404 = fdiv contract float %403, %385
  %405 = fcmp contract ult float %404, 0.000000e+00
  br i1 %405, label %407, label %406

406:                                              ; preds = %387
  store float %404, float addrspace(1)* %137, align 4, !tbaa !7
  br label %407

407:                                              ; preds = %319, %406, %387, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
