; ModuleID = '../data/hip_kernels/10513/8/main.cu'
source_filename = "../data/hip_kernels/10513/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

@_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI = internal unnamed_addr addrspace(3) global [512 x %struct.HIP_vector_type] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jf(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = shl i32 %8, 2
  %15 = mul i32 %14, %13
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp ult i32 %17, %5
  br i1 %18, label %19, label %26

19:                                               ; preds = %7
  %20 = sext i32 %17 to i64
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %20
  %22 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %16
  %23 = bitcast %struct.HIP_vector_type addrspace(3)* %22 to i8 addrspace(3)*
  %24 = bitcast %struct.HIP_vector_type addrspace(1)* %21 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 16 dereferenceable(16) %23, i8 addrspace(1)* noundef align 16 dereferenceable(16) %24, i64 16, i1 false)
  %25 = add nuw nsw i32 %16, 128
  br label %26

26:                                               ; preds = %7, %19
  %27 = phi i32 [ %25, %19 ], [ %16, %7 ]
  %28 = add nsw i32 %17, 128
  %29 = icmp ult i32 %28, %5
  br i1 %29, label %30, label %37

30:                                               ; preds = %26
  %31 = sext i32 %28 to i64
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31
  %33 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %27
  %34 = bitcast %struct.HIP_vector_type addrspace(3)* %33 to i8 addrspace(3)*
  %35 = bitcast %struct.HIP_vector_type addrspace(1)* %32 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 16 dereferenceable(16) %34, i8 addrspace(1)* noundef align 16 dereferenceable(16) %35, i64 16, i1 false)
  %36 = add nuw nsw i32 %27, 128
  br label %37

37:                                               ; preds = %30, %26
  %38 = phi i32 [ %36, %30 ], [ %27, %26 ]
  %39 = add nsw i32 %17, 256
  %40 = icmp ult i32 %39, %5
  br i1 %40, label %41, label %48

41:                                               ; preds = %37
  %42 = sext i32 %39 to i64
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %42
  %44 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %38
  %45 = bitcast %struct.HIP_vector_type addrspace(3)* %44 to i8 addrspace(3)*
  %46 = bitcast %struct.HIP_vector_type addrspace(1)* %43 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 16 dereferenceable(16) %45, i8 addrspace(1)* noundef align 16 dereferenceable(16) %46, i64 16, i1 false)
  %47 = add nuw nsw i32 %38, 128
  br label %48

48:                                               ; preds = %41, %37
  %49 = phi i32 [ %47, %41 ], [ %38, %37 ]
  %50 = add nsw i32 %17, 384
  %51 = icmp ult i32 %50, %5
  br i1 %51, label %52, label %58

52:                                               ; preds = %48
  %53 = sext i32 %50 to i64
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %53
  %55 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %49
  %56 = bitcast %struct.HIP_vector_type addrspace(3)* %55 to i8 addrspace(3)*
  %57 = bitcast %struct.HIP_vector_type addrspace(1)* %54 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 16 dereferenceable(16) %56, i8 addrspace(1)* noundef align 16 dereferenceable(16) %57, i64 16, i1 false)
  br label %58

58:                                               ; preds = %48, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %18, label %59, label %146

59:                                               ; preds = %58
  %60 = sext i32 %17 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %16, i32 0, i32 0, i32 0, i32 0
  %66 = load float, float addrspace(3)* %65, align 16
  %67 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %16, i32 0, i32 0, i32 0, i32 1
  %68 = load float, float addrspace(3)* %67, align 4
  %69 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %16, i32 0, i32 0, i32 0, i32 2
  %70 = load float, float addrspace(3)* %69, align 8
  %71 = add nuw nsw i32 %16, 128
  %72 = icmp sgt i32 %64, 0
  br i1 %72, label %73, label %146

73:                                               ; preds = %59
  %74 = fmul contract float %66, %66
  %75 = fmul contract float %68, %68
  %76 = fadd contract float %74, %75
  %77 = fmul contract float %70, %70
  %78 = fadd contract float %76, %77
  %79 = tail call float @llvm.sqrt.f32(float %78)
  br label %80

80:                                               ; preds = %73, %141
  %81 = phi i32 [ 0, %73 ], [ %144, %141 ]
  %82 = add nsw i32 %81, %62
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = sub nsw i32 %85, %15
  %87 = add i32 %86, -1
  %88 = icmp ult i32 %87, 511
  %89 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %86
  %90 = addrspacecast %struct.HIP_vector_type addrspace(3)* %89 to %struct.HIP_vector_type*
  %91 = sext i32 %85 to i64
  %92 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %91
  %93 = addrspacecast %struct.HIP_vector_type addrspace(1)* %92 to %struct.HIP_vector_type*
  %94 = select i1 %88, %struct.HIP_vector_type* %90, %struct.HIP_vector_type* %93
  %95 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %94, i64 0, i32 0, i32 0, i32 0, i64 0
  %96 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %94, i64 0, i32 0, i32 0, i32 0, i64 2
  %97 = load float, float* %96, align 8
  %98 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %94, i64 0, i32 0, i32 0, i32 0, i64 1
  %99 = load float, float* %98, align 4
  %100 = load float, float* %95, align 16
  %101 = fmul contract float %66, %100
  %102 = fmul contract float %68, %99
  %103 = fadd contract float %102, %101
  %104 = fmul contract float %70, %97
  %105 = fadd contract float %104, %103
  %106 = fmul contract float %100, %100
  %107 = fmul contract float %99, %99
  %108 = fadd contract float %107, %106
  %109 = fmul contract float %97, %97
  %110 = fadd contract float %109, %108
  %111 = tail call float @llvm.sqrt.f32(float %110)
  %112 = fmul contract float %79, %111
  %113 = fcmp contract olt float %112, 0x3E7AD7F2A0000000
  %114 = tail call float @llvm.fabs.f32(float %105)
  %115 = fcmp contract ogt float %114, %112
  %116 = select i1 %113, i1 true, i1 %115
  br i1 %116, label %141, label %117

117:                                              ; preds = %80
  %118 = fdiv contract float %105, %112
  %119 = tail call float @llvm.fabs.f32(float %118)
  %120 = tail call float @llvm.fmuladd.f32(float %119, float -5.000000e-01, float 5.000000e-01)
  %121 = fmul float %118, %118
  %122 = fcmp ogt float %119, 5.000000e-01
  %123 = select i1 %122, float %120, float %121
  %124 = tail call float @llvm.fmuladd.f32(float %123, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %125 = tail call float @llvm.fmuladd.f32(float %123, float %124, float 0x3FA0698780000000)
  %126 = tail call float @llvm.fmuladd.f32(float %123, float %125, float 0x3FA6C83620000000)
  %127 = tail call float @llvm.fmuladd.f32(float %123, float %126, float 0x3FB3337900000000)
  %128 = tail call float @llvm.fmuladd.f32(float %123, float %127, float 0x3FC5555580000000)
  %129 = fmul float %123, %128
  %130 = tail call float @llvm.sqrt.f32(float %123)
  %131 = tail call float @llvm.fmuladd.f32(float %130, float %129, float %130)
  %132 = fmul float %131, 2.000000e+00
  %133 = fsub float 0x400921FB60000000, %132
  %134 = fcmp olt float %118, 0.000000e+00
  %135 = select i1 %134, float %133, float %132
  %136 = tail call float @llvm.fmuladd.f32(float %118, float %129, float %118)
  %137 = fsub float 0x3FF921FB60000000, %136
  %138 = select i1 %122, float %135, float %137
  %139 = tail call float @llvm.fabs.f32(float %138)
  %140 = fmul contract float %139, %6
  br label %141

141:                                              ; preds = %80, %117
  %142 = phi float [ %140, %117 ], [ 0.000000e+00, %80 ]
  %143 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  store float %142, float addrspace(1)* %143, align 4, !tbaa !11
  %144 = add nuw nsw i32 %81, 1
  %145 = icmp eq i32 %144, %64
  br i1 %145, label %146, label %80, !llvm.loop !13

146:                                              ; preds = %141, %59, %58
  %147 = phi i32 [ %16, %58 ], [ %71, %59 ], [ %71, %141 ]
  %148 = icmp ult i32 %28, %5
  br i1 %148, label %149, label %236

149:                                              ; preds = %146
  %150 = sext i32 %28 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %150
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !5
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %150
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !7, !amdgpu.noclobber !5
  %155 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %147, i32 0, i32 0, i32 0, i32 0
  %156 = load float, float addrspace(3)* %155, align 16
  %157 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %147, i32 0, i32 0, i32 0, i32 1
  %158 = load float, float addrspace(3)* %157, align 4
  %159 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %147, i32 0, i32 0, i32 0, i32 2
  %160 = load float, float addrspace(3)* %159, align 8
  %161 = add nsw i32 %147, 128
  %162 = icmp sgt i32 %154, 0
  br i1 %162, label %163, label %236

163:                                              ; preds = %149
  %164 = fmul contract float %156, %156
  %165 = fmul contract float %158, %158
  %166 = fadd contract float %164, %165
  %167 = fmul contract float %160, %160
  %168 = fadd contract float %166, %167
  %169 = tail call float @llvm.sqrt.f32(float %168)
  br label %170

170:                                              ; preds = %231, %163
  %171 = phi i32 [ 0, %163 ], [ %234, %231 ]
  %172 = add nsw i32 %171, %152
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %173
  %175 = load i32, i32 addrspace(1)* %174, align 4, !tbaa !7, !amdgpu.noclobber !5
  %176 = sub nsw i32 %175, %15
  %177 = add i32 %176, -1
  %178 = icmp ult i32 %177, 511
  %179 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %176
  %180 = addrspacecast %struct.HIP_vector_type addrspace(3)* %179 to %struct.HIP_vector_type*
  %181 = sext i32 %175 to i64
  %182 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %181
  %183 = addrspacecast %struct.HIP_vector_type addrspace(1)* %182 to %struct.HIP_vector_type*
  %184 = select i1 %178, %struct.HIP_vector_type* %180, %struct.HIP_vector_type* %183
  %185 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %184, i64 0, i32 0, i32 0, i32 0, i64 0
  %186 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %184, i64 0, i32 0, i32 0, i32 0, i64 2
  %187 = load float, float* %186, align 8
  %188 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %184, i64 0, i32 0, i32 0, i32 0, i64 1
  %189 = load float, float* %188, align 4
  %190 = load float, float* %185, align 16
  %191 = fmul contract float %156, %190
  %192 = fmul contract float %158, %189
  %193 = fadd contract float %192, %191
  %194 = fmul contract float %160, %187
  %195 = fadd contract float %194, %193
  %196 = fmul contract float %190, %190
  %197 = fmul contract float %189, %189
  %198 = fadd contract float %197, %196
  %199 = fmul contract float %187, %187
  %200 = fadd contract float %199, %198
  %201 = tail call float @llvm.sqrt.f32(float %200)
  %202 = fmul contract float %169, %201
  %203 = fcmp contract olt float %202, 0x3E7AD7F2A0000000
  %204 = tail call float @llvm.fabs.f32(float %195)
  %205 = fcmp contract ogt float %204, %202
  %206 = select i1 %203, i1 true, i1 %205
  br i1 %206, label %231, label %207

207:                                              ; preds = %170
  %208 = fdiv contract float %195, %202
  %209 = tail call float @llvm.fabs.f32(float %208)
  %210 = tail call float @llvm.fmuladd.f32(float %209, float -5.000000e-01, float 5.000000e-01)
  %211 = fmul float %208, %208
  %212 = fcmp ogt float %209, 5.000000e-01
  %213 = select i1 %212, float %210, float %211
  %214 = tail call float @llvm.fmuladd.f32(float %213, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %215 = tail call float @llvm.fmuladd.f32(float %213, float %214, float 0x3FA0698780000000)
  %216 = tail call float @llvm.fmuladd.f32(float %213, float %215, float 0x3FA6C83620000000)
  %217 = tail call float @llvm.fmuladd.f32(float %213, float %216, float 0x3FB3337900000000)
  %218 = tail call float @llvm.fmuladd.f32(float %213, float %217, float 0x3FC5555580000000)
  %219 = fmul float %213, %218
  %220 = tail call float @llvm.sqrt.f32(float %213)
  %221 = tail call float @llvm.fmuladd.f32(float %220, float %219, float %220)
  %222 = fmul float %221, 2.000000e+00
  %223 = fsub float 0x400921FB60000000, %222
  %224 = fcmp olt float %208, 0.000000e+00
  %225 = select i1 %224, float %223, float %222
  %226 = tail call float @llvm.fmuladd.f32(float %208, float %219, float %208)
  %227 = fsub float 0x3FF921FB60000000, %226
  %228 = select i1 %212, float %225, float %227
  %229 = tail call float @llvm.fabs.f32(float %228)
  %230 = fmul contract float %229, %6
  br label %231

231:                                              ; preds = %170, %207
  %232 = phi float [ %230, %207 ], [ 0.000000e+00, %170 ]
  %233 = getelementptr inbounds float, float addrspace(1)* %1, i64 %173
  store float %232, float addrspace(1)* %233, align 4, !tbaa !11
  %234 = add nuw nsw i32 %171, 1
  %235 = icmp eq i32 %234, %154
  br i1 %235, label %236, label %170, !llvm.loop !13

236:                                              ; preds = %231, %149, %146
  %237 = phi i32 [ %147, %146 ], [ %161, %149 ], [ %161, %231 ]
  %238 = add nsw i32 %17, 256
  %239 = icmp ult i32 %238, %5
  br i1 %239, label %240, label %327

240:                                              ; preds = %236
  %241 = sext i32 %238 to i64
  %242 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %241
  %243 = load i32, i32 addrspace(1)* %242, align 4, !tbaa !7, !amdgpu.noclobber !5
  %244 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %241
  %245 = load i32, i32 addrspace(1)* %244, align 4, !tbaa !7, !amdgpu.noclobber !5
  %246 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %237, i32 0, i32 0, i32 0, i32 0
  %247 = load float, float addrspace(3)* %246, align 16
  %248 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %237, i32 0, i32 0, i32 0, i32 1
  %249 = load float, float addrspace(3)* %248, align 4
  %250 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %237, i32 0, i32 0, i32 0, i32 2
  %251 = load float, float addrspace(3)* %250, align 8
  %252 = add nsw i32 %237, 128
  %253 = icmp sgt i32 %245, 0
  br i1 %253, label %254, label %327

254:                                              ; preds = %240
  %255 = fmul contract float %247, %247
  %256 = fmul contract float %249, %249
  %257 = fadd contract float %255, %256
  %258 = fmul contract float %251, %251
  %259 = fadd contract float %257, %258
  %260 = tail call float @llvm.sqrt.f32(float %259)
  br label %261

261:                                              ; preds = %322, %254
  %262 = phi i32 [ 0, %254 ], [ %325, %322 ]
  %263 = add nsw i32 %262, %243
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %264
  %266 = load i32, i32 addrspace(1)* %265, align 4, !tbaa !7, !amdgpu.noclobber !5
  %267 = sub nsw i32 %266, %15
  %268 = add i32 %267, -1
  %269 = icmp ult i32 %268, 511
  %270 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %267
  %271 = addrspacecast %struct.HIP_vector_type addrspace(3)* %270 to %struct.HIP_vector_type*
  %272 = sext i32 %266 to i64
  %273 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %272
  %274 = addrspacecast %struct.HIP_vector_type addrspace(1)* %273 to %struct.HIP_vector_type*
  %275 = select i1 %269, %struct.HIP_vector_type* %271, %struct.HIP_vector_type* %274
  %276 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %275, i64 0, i32 0, i32 0, i32 0, i64 0
  %277 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %275, i64 0, i32 0, i32 0, i32 0, i64 2
  %278 = load float, float* %277, align 8
  %279 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %275, i64 0, i32 0, i32 0, i32 0, i64 1
  %280 = load float, float* %279, align 4
  %281 = load float, float* %276, align 16
  %282 = fmul contract float %247, %281
  %283 = fmul contract float %249, %280
  %284 = fadd contract float %283, %282
  %285 = fmul contract float %251, %278
  %286 = fadd contract float %285, %284
  %287 = fmul contract float %281, %281
  %288 = fmul contract float %280, %280
  %289 = fadd contract float %288, %287
  %290 = fmul contract float %278, %278
  %291 = fadd contract float %290, %289
  %292 = tail call float @llvm.sqrt.f32(float %291)
  %293 = fmul contract float %260, %292
  %294 = fcmp contract olt float %293, 0x3E7AD7F2A0000000
  %295 = tail call float @llvm.fabs.f32(float %286)
  %296 = fcmp contract ogt float %295, %293
  %297 = select i1 %294, i1 true, i1 %296
  br i1 %297, label %322, label %298

298:                                              ; preds = %261
  %299 = fdiv contract float %286, %293
  %300 = tail call float @llvm.fabs.f32(float %299)
  %301 = tail call float @llvm.fmuladd.f32(float %300, float -5.000000e-01, float 5.000000e-01)
  %302 = fmul float %299, %299
  %303 = fcmp ogt float %300, 5.000000e-01
  %304 = select i1 %303, float %301, float %302
  %305 = tail call float @llvm.fmuladd.f32(float %304, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %306 = tail call float @llvm.fmuladd.f32(float %304, float %305, float 0x3FA0698780000000)
  %307 = tail call float @llvm.fmuladd.f32(float %304, float %306, float 0x3FA6C83620000000)
  %308 = tail call float @llvm.fmuladd.f32(float %304, float %307, float 0x3FB3337900000000)
  %309 = tail call float @llvm.fmuladd.f32(float %304, float %308, float 0x3FC5555580000000)
  %310 = fmul float %304, %309
  %311 = tail call float @llvm.sqrt.f32(float %304)
  %312 = tail call float @llvm.fmuladd.f32(float %311, float %310, float %311)
  %313 = fmul float %312, 2.000000e+00
  %314 = fsub float 0x400921FB60000000, %313
  %315 = fcmp olt float %299, 0.000000e+00
  %316 = select i1 %315, float %314, float %313
  %317 = tail call float @llvm.fmuladd.f32(float %299, float %310, float %299)
  %318 = fsub float 0x3FF921FB60000000, %317
  %319 = select i1 %303, float %316, float %318
  %320 = tail call float @llvm.fabs.f32(float %319)
  %321 = fmul contract float %320, %6
  br label %322

322:                                              ; preds = %261, %298
  %323 = phi float [ %321, %298 ], [ 0.000000e+00, %261 ]
  %324 = getelementptr inbounds float, float addrspace(1)* %1, i64 %264
  store float %323, float addrspace(1)* %324, align 4, !tbaa !11
  %325 = add nuw nsw i32 %262, 1
  %326 = icmp eq i32 %325, %245
  br i1 %326, label %327, label %261, !llvm.loop !13

327:                                              ; preds = %322, %240, %236
  %328 = phi i32 [ %237, %236 ], [ %252, %240 ], [ %252, %322 ]
  %329 = add nsw i32 %17, 384
  %330 = icmp ult i32 %329, %5
  br i1 %330, label %331, label %417

331:                                              ; preds = %327
  %332 = sext i32 %329 to i64
  %333 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %332
  %334 = load i32, i32 addrspace(1)* %333, align 4, !tbaa !7, !amdgpu.noclobber !5
  %335 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %332
  %336 = load i32, i32 addrspace(1)* %335, align 4, !tbaa !7, !amdgpu.noclobber !5
  %337 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %328, i32 0, i32 0, i32 0, i32 0
  %338 = load float, float addrspace(3)* %337, align 16
  %339 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %328, i32 0, i32 0, i32 0, i32 1
  %340 = load float, float addrspace(3)* %339, align 4
  %341 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %328, i32 0, i32 0, i32 0, i32 2
  %342 = load float, float addrspace(3)* %341, align 8
  %343 = icmp sgt i32 %336, 0
  br i1 %343, label %344, label %417

344:                                              ; preds = %331
  %345 = fmul contract float %338, %338
  %346 = fmul contract float %340, %340
  %347 = fadd contract float %345, %346
  %348 = fmul contract float %342, %342
  %349 = fadd contract float %347, %348
  %350 = tail call float @llvm.sqrt.f32(float %349)
  br label %351

351:                                              ; preds = %412, %344
  %352 = phi i32 [ 0, %344 ], [ %415, %412 ]
  %353 = add nsw i32 %352, %334
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %354
  %356 = load i32, i32 addrspace(1)* %355, align 4, !tbaa !7, !amdgpu.noclobber !5
  %357 = sub nsw i32 %356, %15
  %358 = add i32 %357, -1
  %359 = icmp ult i32 %358, 511
  %360 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ34computeSphereVertexDistancesKernelP15HIP_vector_typeIfLj4EEPfPjS3_S3_jfE2SI, i32 0, i32 %357
  %361 = addrspacecast %struct.HIP_vector_type addrspace(3)* %360 to %struct.HIP_vector_type*
  %362 = sext i32 %356 to i64
  %363 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %362
  %364 = addrspacecast %struct.HIP_vector_type addrspace(1)* %363 to %struct.HIP_vector_type*
  %365 = select i1 %359, %struct.HIP_vector_type* %361, %struct.HIP_vector_type* %364
  %366 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %365, i64 0, i32 0, i32 0, i32 0, i64 0
  %367 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %365, i64 0, i32 0, i32 0, i32 0, i64 2
  %368 = load float, float* %367, align 8
  %369 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type* %365, i64 0, i32 0, i32 0, i32 0, i64 1
  %370 = load float, float* %369, align 4
  %371 = load float, float* %366, align 16
  %372 = fmul contract float %338, %371
  %373 = fmul contract float %340, %370
  %374 = fadd contract float %373, %372
  %375 = fmul contract float %342, %368
  %376 = fadd contract float %375, %374
  %377 = fmul contract float %371, %371
  %378 = fmul contract float %370, %370
  %379 = fadd contract float %378, %377
  %380 = fmul contract float %368, %368
  %381 = fadd contract float %380, %379
  %382 = tail call float @llvm.sqrt.f32(float %381)
  %383 = fmul contract float %350, %382
  %384 = fcmp contract olt float %383, 0x3E7AD7F2A0000000
  %385 = tail call float @llvm.fabs.f32(float %376)
  %386 = fcmp contract ogt float %385, %383
  %387 = select i1 %384, i1 true, i1 %386
  br i1 %387, label %412, label %388

388:                                              ; preds = %351
  %389 = fdiv contract float %376, %383
  %390 = tail call float @llvm.fabs.f32(float %389)
  %391 = tail call float @llvm.fmuladd.f32(float %390, float -5.000000e-01, float 5.000000e-01)
  %392 = fmul float %389, %389
  %393 = fcmp ogt float %390, 5.000000e-01
  %394 = select i1 %393, float %391, float %392
  %395 = tail call float @llvm.fmuladd.f32(float %394, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %396 = tail call float @llvm.fmuladd.f32(float %394, float %395, float 0x3FA0698780000000)
  %397 = tail call float @llvm.fmuladd.f32(float %394, float %396, float 0x3FA6C83620000000)
  %398 = tail call float @llvm.fmuladd.f32(float %394, float %397, float 0x3FB3337900000000)
  %399 = tail call float @llvm.fmuladd.f32(float %394, float %398, float 0x3FC5555580000000)
  %400 = fmul float %394, %399
  %401 = tail call float @llvm.sqrt.f32(float %394)
  %402 = tail call float @llvm.fmuladd.f32(float %401, float %400, float %401)
  %403 = fmul float %402, 2.000000e+00
  %404 = fsub float 0x400921FB60000000, %403
  %405 = fcmp olt float %389, 0.000000e+00
  %406 = select i1 %405, float %404, float %403
  %407 = tail call float @llvm.fmuladd.f32(float %389, float %400, float %389)
  %408 = fsub float 0x3FF921FB60000000, %407
  %409 = select i1 %393, float %406, float %408
  %410 = tail call float @llvm.fabs.f32(float %409)
  %411 = fmul contract float %410, %6
  br label %412

412:                                              ; preds = %351, %388
  %413 = phi float [ %411, %388 ], [ 0.000000e+00, %351 ]
  %414 = getelementptr inbounds float, float addrspace(1)* %1, i64 %354
  store float %413, float addrspace(1)* %414, align 4, !tbaa !11
  %415 = add nuw nsw i32 %352, 1
  %416 = icmp eq i32 %415, %336
  br i1 %416, label %417, label %351, !llvm.loop !13

417:                                              ; preds = %412, %327, %331
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
