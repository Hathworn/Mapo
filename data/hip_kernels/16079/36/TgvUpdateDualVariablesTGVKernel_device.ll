; ModuleID = '../data/hip_kernels/16079/36/main.cu'
source_filename = "../data/hip_kernels/16079/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z31TgvUpdateDualVariablesTGVKernelPfP15HIP_vector_typeIfLj2EEfffffS_S_S_PS0_IfLj4EES2_S4_iii(float addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, float %2, float %3, float %4, float %5, float %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, %struct.HIP_vector_type.0 addrspace(1)* nocapture %10, %struct.HIP_vector_type addrspace(1)* nocapture %11, %struct.HIP_vector_type.0 addrspace(1)* nocapture %12, i32 %13, i32 %14, i32 %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %17, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !4, !invariant.load !5
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %33 = add i32 %31, %32
  %34 = sitofp i32 %13 to float
  %35 = fmul contract float %34, 5.000000e-01
  %36 = sitofp i32 %14 to float
  %37 = fmul contract float %36, 5.000000e-01
  %38 = sitofp i32 %25 to float
  %39 = fsub contract float %38, %37
  %40 = fmul contract float %39, %39
  %41 = sitofp i32 %33 to float
  %42 = fsub contract float %41, %35
  %43 = fmul contract float %42, %42
  %44 = fadd contract float %40, %43
  %45 = fcmp olt float %44, 0x39F0000000000000
  %46 = select i1 %45, float 0x41F0000000000000, float 1.000000e+00
  %47 = fmul float %44, %46
  %48 = tail call float @llvm.sqrt.f32(float %47)
  %49 = bitcast float %48 to i32
  %50 = add nsw i32 %49, -1
  %51 = bitcast i32 %50 to float
  %52 = add nsw i32 %49, 1
  %53 = bitcast i32 %52 to float
  %54 = icmp slt i32 %25, %14
  %55 = icmp slt i32 %33, %13
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %57, label %335

57:                                               ; preds = %16
  %58 = tail call i1 @llvm.amdgcn.class.f32(float %47, i32 608)
  %59 = select i1 %45, float 0x3EF0000000000000, float 1.000000e+00
  %60 = fneg float %53
  %61 = tail call float @llvm.fma.f32(float %60, float %48, float %47)
  %62 = fcmp ogt float %61, 0.000000e+00
  %63 = fneg float %51
  %64 = tail call float @llvm.fma.f32(float %63, float %48, float %47)
  %65 = fcmp ole float %64, 0.000000e+00
  %66 = select i1 %65, float %51, float %48
  %67 = select i1 %62, float %53, float %66
  %68 = fmul float %59, %67
  %69 = select i1 %58, float %47, float %68
  %70 = fdiv contract float %34, 0x40019999A0000000
  %71 = mul nsw i32 %25, %15
  %72 = add i32 %33, %71
  %73 = fcmp contract ult float %69, %70
  br i1 %73, label %81, label %74

74:                                               ; preds = %57
  %75 = sext i32 %72 to i64
  %76 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %75
  %77 = bitcast %struct.HIP_vector_type addrspace(1)* %76 to i32 addrspace(1)*
  store i32 0, i32 addrspace(1)* %77, align 8
  %78 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %75, i32 0, i32 0, i32 0, i64 1
  %79 = bitcast float addrspace(1)* %78 to i32 addrspace(1)*
  store i32 0, i32 addrspace(1)* %79, align 4
  %80 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %12, i64 %75, i32 0, i32 0, i32 0
  store <4 x float> zeroinitializer, <4 x float> addrspace(1)* %80, align 16
  br label %335

81:                                               ; preds = %57
  %82 = add nsw i32 %33, 1
  %83 = add nsw i32 %82, %71
  %84 = add nsw i32 %25, 1
  %85 = mul nsw i32 %84, %15
  %86 = add nsw i32 %85, %33
  %87 = add nsw i32 %72, -1
  %88 = add nsw i32 %25, -1
  %89 = mul nsw i32 %88, %15
  %90 = add nsw i32 %89, %33
  %91 = icmp slt i32 %82, %13
  br i1 %91, label %92, label %100

92:                                               ; preds = %81
  %93 = sext i32 %83 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = sext i32 %72 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = fsub contract float %95, %98
  br label %108

100:                                              ; preds = %81
  %101 = sext i32 %72 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = sext i32 %87 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = fsub contract float %103, %106
  br label %108

108:                                              ; preds = %100, %92
  %109 = phi i64 [ %101, %100 ], [ %96, %92 ]
  %110 = phi float [ %107, %100 ], [ %99, %92 ]
  %111 = phi float [ %103, %100 ], [ %98, %92 ]
  %112 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %109, i32 0, i32 0, i32 0, i64 0
  %113 = load float, float addrspace(1)* %112, align 8, !tbaa !11
  %114 = fsub contract float %110, %113
  %115 = icmp slt i32 %84, %14
  br i1 %115, label %116, label %186

116:                                              ; preds = %108
  %117 = sext i32 %86 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = fsub contract float %119, %111
  %121 = sext i32 %72 to i64
  %122 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %121, i32 0, i32 0, i32 0, i64 1
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !11
  %124 = fsub contract float %120, %123
  %125 = getelementptr inbounds float, float addrspace(1)* %7, i64 %121
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fmul contract float %114, %126
  %128 = getelementptr inbounds float, float addrspace(1)* %9, i64 %121
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = fmul contract float %124, %129
  %131 = fadd contract float %127, %130
  %132 = fmul contract float %114, %129
  %133 = getelementptr inbounds float, float addrspace(1)* %8, i64 %121
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = fmul contract float %124, %134
  %136 = fadd contract float %132, %135
  %137 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %121, i32 0, i32 0, i32 0, i64 0
  %138 = load float, float addrspace(1)* %137, align 8, !tbaa !11, !amdgpu.noclobber !5
  %139 = fmul contract float %3, %4
  %140 = fdiv contract float %139, %5
  %141 = fmul contract float %140, %131
  %142 = fadd contract float %138, %141
  %143 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %121, i32 0, i32 0, i32 0, i64 1
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !11, !amdgpu.noclobber !5
  %145 = fmul contract float %140, %136
  %146 = fadd contract float %144, %145
  %147 = fmul contract float %142, %142
  %148 = fmul contract float %146, %146
  %149 = fadd contract float %147, %148
  %150 = fcmp olt float %149, 0x39F0000000000000
  %151 = select i1 %150, float 0x41F0000000000000, float 1.000000e+00
  %152 = fmul float %149, %151
  %153 = tail call float @llvm.sqrt.f32(float %152)
  %154 = bitcast float %153 to i32
  %155 = add nsw i32 %154, -1
  %156 = bitcast i32 %155 to float
  %157 = add nsw i32 %154, 1
  %158 = bitcast i32 %157 to float
  %159 = tail call i1 @llvm.amdgcn.class.f32(float %152, i32 608)
  %160 = select i1 %150, float 0x3EF0000000000000, float 1.000000e+00
  %161 = fneg float %158
  %162 = tail call float @llvm.fma.f32(float %161, float %153, float %152)
  %163 = fcmp ogt float %162, 0.000000e+00
  %164 = fneg float %156
  %165 = tail call float @llvm.fma.f32(float %164, float %153, float %152)
  %166 = fcmp ole float %165, 0.000000e+00
  %167 = select i1 %166, float %156, float %153
  %168 = select i1 %163, float %158, float %167
  %169 = fmul float %160, %168
  %170 = select i1 %159, float %152, float %169
  %171 = fcmp contract olt float %170, 1.000000e+00
  %172 = select i1 %171, float 1.000000e+00, float %170
  %173 = fdiv contract float %142, %172
  store float %173, float addrspace(1)* %137, align 8, !tbaa !11
  %174 = fdiv contract float %146, %172
  store float %174, float addrspace(1)* %143, align 4, !tbaa !11
  %175 = sext i32 %87 to i64
  %176 = sext i32 %83 to i64
  %177 = select i1 %91, i64 %121, i64 %175
  %178 = select i1 %91, i64 %176, i64 %121
  %179 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %178, i32 0, i32 0, i32 0, i64 0
  %180 = load float, float addrspace(1)* %179, align 8, !tbaa !11
  %181 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %177, i32 0, i32 0, i32 0, i64 0
  %182 = load float, float addrspace(1)* %181, align 8, !tbaa !11
  %183 = fsub contract float %180, %182
  %184 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %10, i64 %121, i32 0, i32 0, i32 0, i64 0
  store float %183, float addrspace(1)* %184, align 16
  %185 = sext i32 %86 to i64
  br label %256

186:                                              ; preds = %108
  %187 = sext i32 %90 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7, !amdgpu.noclobber !5
  %190 = fsub contract float %111, %189
  %191 = sext i32 %72 to i64
  %192 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %191, i32 0, i32 0, i32 0, i64 1
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !11
  %194 = fsub contract float %190, %193
  %195 = getelementptr inbounds float, float addrspace(1)* %7, i64 %191
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7, !amdgpu.noclobber !5
  %197 = fmul contract float %114, %196
  %198 = getelementptr inbounds float, float addrspace(1)* %9, i64 %191
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7, !amdgpu.noclobber !5
  %200 = fmul contract float %194, %199
  %201 = fadd contract float %197, %200
  %202 = fmul contract float %114, %199
  %203 = getelementptr inbounds float, float addrspace(1)* %8, i64 %191
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !7, !amdgpu.noclobber !5
  %205 = fmul contract float %194, %204
  %206 = fadd contract float %202, %205
  %207 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %191, i32 0, i32 0, i32 0, i64 0
  %208 = load float, float addrspace(1)* %207, align 8, !tbaa !11, !amdgpu.noclobber !5
  %209 = fmul contract float %3, %4
  %210 = fdiv contract float %209, %5
  %211 = fmul contract float %210, %201
  %212 = fadd contract float %208, %211
  %213 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %191, i32 0, i32 0, i32 0, i64 1
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !11, !amdgpu.noclobber !5
  %215 = fmul contract float %210, %206
  %216 = fadd contract float %214, %215
  %217 = fmul contract float %212, %212
  %218 = fmul contract float %216, %216
  %219 = fadd contract float %217, %218
  %220 = fcmp olt float %219, 0x39F0000000000000
  %221 = select i1 %220, float 0x41F0000000000000, float 1.000000e+00
  %222 = fmul float %219, %221
  %223 = tail call float @llvm.sqrt.f32(float %222)
  %224 = bitcast float %223 to i32
  %225 = add nsw i32 %224, -1
  %226 = bitcast i32 %225 to float
  %227 = add nsw i32 %224, 1
  %228 = bitcast i32 %227 to float
  %229 = tail call i1 @llvm.amdgcn.class.f32(float %222, i32 608)
  %230 = select i1 %220, float 0x3EF0000000000000, float 1.000000e+00
  %231 = fneg float %228
  %232 = tail call float @llvm.fma.f32(float %231, float %223, float %222)
  %233 = fcmp ogt float %232, 0.000000e+00
  %234 = fneg float %226
  %235 = tail call float @llvm.fma.f32(float %234, float %223, float %222)
  %236 = fcmp ole float %235, 0.000000e+00
  %237 = select i1 %236, float %226, float %223
  %238 = select i1 %233, float %228, float %237
  %239 = fmul float %230, %238
  %240 = select i1 %229, float %222, float %239
  %241 = fcmp contract olt float %240, 1.000000e+00
  %242 = select i1 %241, float 1.000000e+00, float %240
  %243 = fdiv contract float %212, %242
  store float %243, float addrspace(1)* %207, align 8, !tbaa !11
  %244 = fdiv contract float %216, %242
  store float %244, float addrspace(1)* %213, align 4, !tbaa !11
  %245 = sext i32 %87 to i64
  %246 = sext i32 %83 to i64
  %247 = select i1 %91, i64 %191, i64 %245
  %248 = select i1 %91, i64 %246, i64 %191
  %249 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %248, i32 0, i32 0, i32 0, i64 0
  %250 = load float, float addrspace(1)* %249, align 8, !tbaa !11
  %251 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %247, i32 0, i32 0, i32 0, i64 0
  %252 = load float, float addrspace(1)* %251, align 8, !tbaa !11
  %253 = fsub contract float %250, %252
  %254 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %10, i64 %191, i32 0, i32 0, i32 0, i64 0
  store float %253, float addrspace(1)* %254, align 16
  %255 = sext i32 %90 to i64
  br label %256

256:                                              ; preds = %186, %116
  %257 = phi float [ %183, %116 ], [ %253, %186 ]
  %258 = phi i64 [ %121, %116 ], [ %191, %186 ]
  %259 = phi i64 [ %121, %116 ], [ %255, %186 ]
  %260 = phi i64 [ %185, %116 ], [ %191, %186 ]
  %261 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %260, i32 0, i32 0, i32 0, i64 1
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !11
  %263 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %259, i32 0, i32 0, i32 0, i64 1
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !11
  %265 = fsub contract float %262, %264
  %266 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %10, i64 %258, i32 0, i32 0, i32 0, i64 1
  store float %265, float addrspace(1)* %266, align 4, !tbaa !11
  %267 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %260, i32 0, i32 0, i32 0, i64 0
  %268 = load float, float addrspace(1)* %267, align 8, !tbaa !11
  %269 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %259, i32 0, i32 0, i32 0, i64 0
  %270 = load float, float addrspace(1)* %269, align 8, !tbaa !11
  %271 = fsub contract float %268, %270
  %272 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %10, i64 %258, i32 0, i32 0, i32 0, i64 2
  store float %271, float addrspace(1)* %272, align 8
  %273 = sext i32 %87 to i64
  %274 = sext i32 %83 to i64
  %275 = select i1 %91, i64 %258, i64 %273
  %276 = select i1 %91, i64 %274, i64 %258
  %277 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %276, i32 0, i32 0, i32 0, i64 1
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !11
  %279 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %275, i32 0, i32 0, i32 0, i64 1
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !11
  %281 = fsub contract float %278, %280
  %282 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %10, i64 %258, i32 0, i32 0, i32 0, i64 3
  store float %281, float addrspace(1)* %282, align 4
  %283 = fmul contract float %2, %4
  %284 = fdiv contract float %283, %6
  %285 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %12, i64 %258, i32 0, i32 0, i32 0, i64 0
  %286 = load float, float addrspace(1)* %285, align 16, !tbaa !11
  %287 = fmul contract float %284, %257
  %288 = fadd contract float %286, %287
  %289 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %12, i64 %258, i32 0, i32 0, i32 0, i64 1
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !11
  %291 = fmul contract float %284, %265
  %292 = fadd contract float %290, %291
  %293 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %12, i64 %258, i32 0, i32 0, i32 0, i64 2
  %294 = load float, float addrspace(1)* %293, align 8, !tbaa !11
  %295 = fmul contract float %284, %271
  %296 = fadd contract float %294, %295
  %297 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %12, i64 %258, i32 0, i32 0, i32 0, i64 3
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !11
  %299 = fmul contract float %284, %281
  %300 = fadd contract float %298, %299
  %301 = fmul contract float %288, %288
  %302 = fmul contract float %292, %292
  %303 = fadd contract float %301, %302
  %304 = fmul contract float %296, %296
  %305 = fadd contract float %303, %304
  %306 = fmul contract float %300, %300
  %307 = fadd contract float %305, %306
  %308 = fcmp olt float %307, 0x39F0000000000000
  %309 = select i1 %308, float 0x41F0000000000000, float 1.000000e+00
  %310 = fmul float %307, %309
  %311 = tail call float @llvm.sqrt.f32(float %310)
  %312 = bitcast float %311 to i32
  %313 = add nsw i32 %312, -1
  %314 = bitcast i32 %313 to float
  %315 = add nsw i32 %312, 1
  %316 = bitcast i32 %315 to float
  %317 = tail call i1 @llvm.amdgcn.class.f32(float %310, i32 608)
  %318 = select i1 %308, float 0x3EF0000000000000, float 1.000000e+00
  %319 = fneg float %316
  %320 = tail call float @llvm.fma.f32(float %319, float %311, float %310)
  %321 = fcmp ogt float %320, 0.000000e+00
  %322 = fneg float %314
  %323 = tail call float @llvm.fma.f32(float %322, float %311, float %310)
  %324 = fcmp ole float %323, 0.000000e+00
  %325 = select i1 %324, float %314, float %311
  %326 = select i1 %321, float %316, float %325
  %327 = fmul float %318, %326
  %328 = select i1 %317, float %310, float %327
  %329 = fcmp contract olt float %328, 1.000000e+00
  %330 = select i1 %329, float 1.000000e+00, float %328
  %331 = fdiv contract float %288, %330
  store float %331, float addrspace(1)* %285, align 16, !tbaa !11
  %332 = fdiv contract float %292, %330
  store float %332, float addrspace(1)* %289, align 4, !tbaa !11
  %333 = fdiv contract float %296, %330
  store float %333, float addrspace(1)* %293, align 8, !tbaa !11
  %334 = fdiv contract float %300, %330
  store float %334, float addrspace(1)* %297, align 4, !tbaa !11
  br label %335

335:                                              ; preds = %74, %256, %16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = !{!9, !9, i64 0}
