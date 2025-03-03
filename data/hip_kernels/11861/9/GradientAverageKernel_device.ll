; ModuleID = '../data/hip_kernels/11861/9/main.cu'
source_filename = "../data/hip_kernels/11861/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

@_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI = internal unnamed_addr addrspace(3) global [512 x %struct.HIP_vector_type] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_j(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = shl i32 %7, 2
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = shl nuw nsw i32 %15, 2
  %18 = icmp ult i32 %16, %5
  br i1 %18, label %19, label %26

19:                                               ; preds = %6
  %20 = sext i32 %16 to i64
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %20
  %22 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %17
  %23 = bitcast %struct.HIP_vector_type addrspace(3)* %22 to i8 addrspace(3)*
  %24 = bitcast %struct.HIP_vector_type addrspace(1)* %21 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 16 dereferenceable(16) %23, i8 addrspace(1)* noundef align 16 dereferenceable(16) %24, i64 16, i1 false)
  %25 = add nuw nsw i32 %17, 1
  br label %26

26:                                               ; preds = %6, %19
  %27 = phi i32 [ %25, %19 ], [ %17, %6 ]
  %28 = add nsw i32 %16, 128
  %29 = icmp ult i32 %28, %5
  br i1 %29, label %30, label %37

30:                                               ; preds = %26
  %31 = sext i32 %28 to i64
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31
  %33 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %27
  %34 = bitcast %struct.HIP_vector_type addrspace(3)* %33 to i8 addrspace(3)*
  %35 = bitcast %struct.HIP_vector_type addrspace(1)* %32 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 16 dereferenceable(16) %34, i8 addrspace(1)* noundef align 16 dereferenceable(16) %35, i64 16, i1 false)
  %36 = add nuw nsw i32 %27, 1
  br label %37

37:                                               ; preds = %30, %26
  %38 = phi i32 [ %36, %30 ], [ %27, %26 ]
  %39 = add nsw i32 %16, 256
  %40 = icmp ult i32 %39, %5
  br i1 %40, label %41, label %48

41:                                               ; preds = %37
  %42 = sext i32 %39 to i64
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %42
  %44 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %38
  %45 = bitcast %struct.HIP_vector_type addrspace(3)* %44 to i8 addrspace(3)*
  %46 = bitcast %struct.HIP_vector_type addrspace(1)* %43 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 16 dereferenceable(16) %45, i8 addrspace(1)* noundef align 16 dereferenceable(16) %46, i64 16, i1 false)
  %47 = add nuw nsw i32 %38, 1
  br label %48

48:                                               ; preds = %41, %37
  %49 = phi i32 [ %47, %41 ], [ %38, %37 ]
  %50 = add nsw i32 %16, 384
  %51 = icmp ult i32 %50, %5
  br i1 %51, label %52, label %58

52:                                               ; preds = %48
  %53 = sext i32 %50 to i64
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %53
  %55 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %49
  %56 = bitcast %struct.HIP_vector_type addrspace(3)* %55 to i8 addrspace(3)*
  %57 = bitcast %struct.HIP_vector_type addrspace(1)* %54 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 16 dereferenceable(16) %56, i8 addrspace(1)* noundef align 16 dereferenceable(16) %57, i64 16, i1 false)
  br label %58

58:                                               ; preds = %48, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %18, label %59, label %253

59:                                               ; preds = %58
  %60 = sext i32 %16 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7
  %65 = add nuw nsw i32 %17, 1
  %66 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %17, i32 0, i32 0, i32 0, i32 0
  %67 = load float, float addrspace(3)* %66, align 16
  %68 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %17, i32 0, i32 0, i32 0, i32 1
  %69 = load float, float addrspace(3)* %68, align 4
  %70 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %17, i32 0, i32 0, i32 0, i32 2
  %71 = load float, float addrspace(3)* %70, align 8
  %72 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %17, i32 0, i32 0, i32 0, i32 3
  %73 = load float, float addrspace(3)* %72, align 4
  %74 = icmp sgt i32 %64, 0
  br i1 %74, label %75, label %240

75:                                               ; preds = %59
  %76 = and i32 %64, 7
  %77 = icmp ult i32 %64, 8
  br i1 %77, label %208, label %78

78:                                               ; preds = %75
  %79 = and i32 %64, -8
  br label %80

80:                                               ; preds = %80, %78
  %81 = phi float [ %67, %78 ], [ %202, %80 ]
  %82 = phi float [ %69, %78 ], [ %203, %80 ]
  %83 = phi float [ %71, %78 ], [ %204, %80 ]
  %84 = phi i32 [ 0, %78 ], [ %205, %80 ]
  %85 = phi i32 [ 0, %78 ], [ %206, %80 ]
  %86 = add nsw i32 %84, %62
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !7
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 0, i64 0
  %92 = load float, float addrspace(1)* %91, align 16
  %93 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 0, i64 1
  %94 = load float, float addrspace(1)* %93, align 4
  %95 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 0, i64 2
  %96 = load float, float addrspace(1)* %95, align 8
  %97 = fadd contract float %81, %92
  %98 = fadd contract float %82, %94
  %99 = fadd contract float %83, %96
  %100 = or i32 %84, 1
  %101 = add nsw i32 %100, %62
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %102
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !7
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %105, i32 0, i32 0, i32 0, i64 0
  %107 = load float, float addrspace(1)* %106, align 16
  %108 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %105, i32 0, i32 0, i32 0, i64 1
  %109 = load float, float addrspace(1)* %108, align 4
  %110 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %105, i32 0, i32 0, i32 0, i64 2
  %111 = load float, float addrspace(1)* %110, align 8
  %112 = fadd contract float %97, %107
  %113 = fadd contract float %98, %109
  %114 = fadd contract float %99, %111
  %115 = or i32 %84, 2
  %116 = add nsw i32 %115, %62
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %117
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !7
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %120, i32 0, i32 0, i32 0, i64 0
  %122 = load float, float addrspace(1)* %121, align 16
  %123 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %120, i32 0, i32 0, i32 0, i64 1
  %124 = load float, float addrspace(1)* %123, align 4
  %125 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %120, i32 0, i32 0, i32 0, i64 2
  %126 = load float, float addrspace(1)* %125, align 8
  %127 = fadd contract float %112, %122
  %128 = fadd contract float %113, %124
  %129 = fadd contract float %114, %126
  %130 = or i32 %84, 3
  %131 = add nsw i32 %130, %62
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %132
  %134 = load i32, i32 addrspace(1)* %133, align 4, !tbaa !7
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %135, i32 0, i32 0, i32 0, i64 0
  %137 = load float, float addrspace(1)* %136, align 16
  %138 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %135, i32 0, i32 0, i32 0, i64 1
  %139 = load float, float addrspace(1)* %138, align 4
  %140 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %135, i32 0, i32 0, i32 0, i64 2
  %141 = load float, float addrspace(1)* %140, align 8
  %142 = fadd contract float %127, %137
  %143 = fadd contract float %128, %139
  %144 = fadd contract float %129, %141
  %145 = or i32 %84, 4
  %146 = add nsw i32 %145, %62
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %147
  %149 = load i32, i32 addrspace(1)* %148, align 4, !tbaa !7
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %150, i32 0, i32 0, i32 0, i64 0
  %152 = load float, float addrspace(1)* %151, align 16
  %153 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %150, i32 0, i32 0, i32 0, i64 1
  %154 = load float, float addrspace(1)* %153, align 4
  %155 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %150, i32 0, i32 0, i32 0, i64 2
  %156 = load float, float addrspace(1)* %155, align 8
  %157 = fadd contract float %142, %152
  %158 = fadd contract float %143, %154
  %159 = fadd contract float %144, %156
  %160 = or i32 %84, 5
  %161 = add nsw i32 %160, %62
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %162
  %164 = load i32, i32 addrspace(1)* %163, align 4, !tbaa !7
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %165, i32 0, i32 0, i32 0, i64 0
  %167 = load float, float addrspace(1)* %166, align 16
  %168 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %165, i32 0, i32 0, i32 0, i64 1
  %169 = load float, float addrspace(1)* %168, align 4
  %170 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %165, i32 0, i32 0, i32 0, i64 2
  %171 = load float, float addrspace(1)* %170, align 8
  %172 = fadd contract float %157, %167
  %173 = fadd contract float %158, %169
  %174 = fadd contract float %159, %171
  %175 = or i32 %84, 6
  %176 = add nsw i32 %175, %62
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %177
  %179 = load i32, i32 addrspace(1)* %178, align 4, !tbaa !7
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %180, i32 0, i32 0, i32 0, i64 0
  %182 = load float, float addrspace(1)* %181, align 16
  %183 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %180, i32 0, i32 0, i32 0, i64 1
  %184 = load float, float addrspace(1)* %183, align 4
  %185 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %180, i32 0, i32 0, i32 0, i64 2
  %186 = load float, float addrspace(1)* %185, align 8
  %187 = fadd contract float %172, %182
  %188 = fadd contract float %173, %184
  %189 = fadd contract float %174, %186
  %190 = or i32 %84, 7
  %191 = add nsw i32 %190, %62
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %192
  %194 = load i32, i32 addrspace(1)* %193, align 4, !tbaa !7
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %195, i32 0, i32 0, i32 0, i64 0
  %197 = load float, float addrspace(1)* %196, align 16
  %198 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %195, i32 0, i32 0, i32 0, i64 1
  %199 = load float, float addrspace(1)* %198, align 4
  %200 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %195, i32 0, i32 0, i32 0, i64 2
  %201 = load float, float addrspace(1)* %200, align 8
  %202 = fadd contract float %187, %197
  %203 = fadd contract float %188, %199
  %204 = fadd contract float %189, %201
  %205 = add nuw nsw i32 %84, 8
  %206 = add i32 %85, 8
  %207 = icmp eq i32 %206, %79
  br i1 %207, label %208, label %80, !llvm.loop !11

208:                                              ; preds = %80, %75
  %209 = phi float [ undef, %75 ], [ %202, %80 ]
  %210 = phi float [ undef, %75 ], [ %203, %80 ]
  %211 = phi float [ undef, %75 ], [ %204, %80 ]
  %212 = phi float [ %67, %75 ], [ %202, %80 ]
  %213 = phi float [ %69, %75 ], [ %203, %80 ]
  %214 = phi float [ %71, %75 ], [ %204, %80 ]
  %215 = phi i32 [ 0, %75 ], [ %205, %80 ]
  %216 = icmp eq i32 %76, 0
  br i1 %216, label %240, label %217

217:                                              ; preds = %208, %217
  %218 = phi float [ %234, %217 ], [ %212, %208 ]
  %219 = phi float [ %235, %217 ], [ %213, %208 ]
  %220 = phi float [ %236, %217 ], [ %214, %208 ]
  %221 = phi i32 [ %237, %217 ], [ %215, %208 ]
  %222 = phi i32 [ %238, %217 ], [ 0, %208 ]
  %223 = add nsw i32 %221, %62
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %224
  %226 = load i32, i32 addrspace(1)* %225, align 4, !tbaa !7
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %227, i32 0, i32 0, i32 0, i64 0
  %229 = load float, float addrspace(1)* %228, align 16
  %230 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %227, i32 0, i32 0, i32 0, i64 1
  %231 = load float, float addrspace(1)* %230, align 4
  %232 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %227, i32 0, i32 0, i32 0, i64 2
  %233 = load float, float addrspace(1)* %232, align 8
  %234 = fadd contract float %218, %229
  %235 = fadd contract float %219, %231
  %236 = fadd contract float %220, %233
  %237 = add nuw nsw i32 %221, 1
  %238 = add i32 %222, 1
  %239 = icmp eq i32 %238, %76
  br i1 %239, label %240, label %217, !llvm.loop !13

240:                                              ; preds = %208, %217, %59
  %241 = phi float [ %71, %59 ], [ %211, %208 ], [ %236, %217 ]
  %242 = phi float [ %69, %59 ], [ %210, %208 ], [ %235, %217 ]
  %243 = phi float [ %67, %59 ], [ %209, %208 ], [ %234, %217 ]
  %244 = add nsw i32 %64, 1
  %245 = sitofp i32 %244 to float
  %246 = fdiv contract float %243, %245
  %247 = fdiv contract float %242, %245
  %248 = fdiv contract float %241, %245
  %249 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %60, i32 0, i32 0, i32 0, i64 0
  store float %246, float addrspace(1)* %249, align 16
  %250 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %60, i32 0, i32 0, i32 0, i64 1
  store float %247, float addrspace(1)* %250, align 4
  %251 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %60, i32 0, i32 0, i32 0, i64 2
  store float %248, float addrspace(1)* %251, align 8
  %252 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %60, i32 0, i32 0, i32 0, i64 3
  store float %73, float addrspace(1)* %252, align 4
  br label %253

253:                                              ; preds = %240, %58
  %254 = phi i32 [ %65, %240 ], [ %17, %58 ]
  %255 = icmp ult i32 %28, %5
  br i1 %255, label %256, label %450

256:                                              ; preds = %253
  %257 = sext i32 %28 to i64
  %258 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %257
  %259 = load i32, i32 addrspace(1)* %258, align 4, !tbaa !7
  %260 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %257
  %261 = load i32, i32 addrspace(1)* %260, align 4, !tbaa !7
  %262 = add nsw i32 %254, 1
  %263 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %254, i32 0, i32 0, i32 0, i32 0
  %264 = load float, float addrspace(3)* %263, align 16
  %265 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %254, i32 0, i32 0, i32 0, i32 1
  %266 = load float, float addrspace(3)* %265, align 4
  %267 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %254, i32 0, i32 0, i32 0, i32 2
  %268 = load float, float addrspace(3)* %267, align 8
  %269 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %254, i32 0, i32 0, i32 0, i32 3
  %270 = load float, float addrspace(3)* %269, align 4
  %271 = icmp sgt i32 %261, 0
  br i1 %271, label %272, label %437

272:                                              ; preds = %256
  %273 = and i32 %261, 7
  %274 = icmp ult i32 %261, 8
  br i1 %274, label %405, label %275

275:                                              ; preds = %272
  %276 = and i32 %261, -8
  br label %277

277:                                              ; preds = %277, %275
  %278 = phi float [ %264, %275 ], [ %399, %277 ]
  %279 = phi float [ %266, %275 ], [ %400, %277 ]
  %280 = phi float [ %268, %275 ], [ %401, %277 ]
  %281 = phi i32 [ 0, %275 ], [ %402, %277 ]
  %282 = phi i32 [ 0, %275 ], [ %403, %277 ]
  %283 = add nsw i32 %281, %259
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %284
  %286 = load i32, i32 addrspace(1)* %285, align 4, !tbaa !7
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %287, i32 0, i32 0, i32 0, i64 0
  %289 = load float, float addrspace(1)* %288, align 16
  %290 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %287, i32 0, i32 0, i32 0, i64 1
  %291 = load float, float addrspace(1)* %290, align 4
  %292 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %287, i32 0, i32 0, i32 0, i64 2
  %293 = load float, float addrspace(1)* %292, align 8
  %294 = fadd contract float %278, %289
  %295 = fadd contract float %279, %291
  %296 = fadd contract float %280, %293
  %297 = or i32 %281, 1
  %298 = add nsw i32 %297, %259
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %299
  %301 = load i32, i32 addrspace(1)* %300, align 4, !tbaa !7
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %302, i32 0, i32 0, i32 0, i64 0
  %304 = load float, float addrspace(1)* %303, align 16
  %305 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %302, i32 0, i32 0, i32 0, i64 1
  %306 = load float, float addrspace(1)* %305, align 4
  %307 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %302, i32 0, i32 0, i32 0, i64 2
  %308 = load float, float addrspace(1)* %307, align 8
  %309 = fadd contract float %294, %304
  %310 = fadd contract float %295, %306
  %311 = fadd contract float %296, %308
  %312 = or i32 %281, 2
  %313 = add nsw i32 %312, %259
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %314
  %316 = load i32, i32 addrspace(1)* %315, align 4, !tbaa !7
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %317, i32 0, i32 0, i32 0, i64 0
  %319 = load float, float addrspace(1)* %318, align 16
  %320 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %317, i32 0, i32 0, i32 0, i64 1
  %321 = load float, float addrspace(1)* %320, align 4
  %322 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %317, i32 0, i32 0, i32 0, i64 2
  %323 = load float, float addrspace(1)* %322, align 8
  %324 = fadd contract float %309, %319
  %325 = fadd contract float %310, %321
  %326 = fadd contract float %311, %323
  %327 = or i32 %281, 3
  %328 = add nsw i32 %327, %259
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %329
  %331 = load i32, i32 addrspace(1)* %330, align 4, !tbaa !7
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %332, i32 0, i32 0, i32 0, i64 0
  %334 = load float, float addrspace(1)* %333, align 16
  %335 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %332, i32 0, i32 0, i32 0, i64 1
  %336 = load float, float addrspace(1)* %335, align 4
  %337 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %332, i32 0, i32 0, i32 0, i64 2
  %338 = load float, float addrspace(1)* %337, align 8
  %339 = fadd contract float %324, %334
  %340 = fadd contract float %325, %336
  %341 = fadd contract float %326, %338
  %342 = or i32 %281, 4
  %343 = add nsw i32 %342, %259
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %344
  %346 = load i32, i32 addrspace(1)* %345, align 4, !tbaa !7
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %347, i32 0, i32 0, i32 0, i64 0
  %349 = load float, float addrspace(1)* %348, align 16
  %350 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %347, i32 0, i32 0, i32 0, i64 1
  %351 = load float, float addrspace(1)* %350, align 4
  %352 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %347, i32 0, i32 0, i32 0, i64 2
  %353 = load float, float addrspace(1)* %352, align 8
  %354 = fadd contract float %339, %349
  %355 = fadd contract float %340, %351
  %356 = fadd contract float %341, %353
  %357 = or i32 %281, 5
  %358 = add nsw i32 %357, %259
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %359
  %361 = load i32, i32 addrspace(1)* %360, align 4, !tbaa !7
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %362, i32 0, i32 0, i32 0, i64 0
  %364 = load float, float addrspace(1)* %363, align 16
  %365 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %362, i32 0, i32 0, i32 0, i64 1
  %366 = load float, float addrspace(1)* %365, align 4
  %367 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %362, i32 0, i32 0, i32 0, i64 2
  %368 = load float, float addrspace(1)* %367, align 8
  %369 = fadd contract float %354, %364
  %370 = fadd contract float %355, %366
  %371 = fadd contract float %356, %368
  %372 = or i32 %281, 6
  %373 = add nsw i32 %372, %259
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %374
  %376 = load i32, i32 addrspace(1)* %375, align 4, !tbaa !7
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %377, i32 0, i32 0, i32 0, i64 0
  %379 = load float, float addrspace(1)* %378, align 16
  %380 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %377, i32 0, i32 0, i32 0, i64 1
  %381 = load float, float addrspace(1)* %380, align 4
  %382 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %377, i32 0, i32 0, i32 0, i64 2
  %383 = load float, float addrspace(1)* %382, align 8
  %384 = fadd contract float %369, %379
  %385 = fadd contract float %370, %381
  %386 = fadd contract float %371, %383
  %387 = or i32 %281, 7
  %388 = add nsw i32 %387, %259
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %389
  %391 = load i32, i32 addrspace(1)* %390, align 4, !tbaa !7
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %392, i32 0, i32 0, i32 0, i64 0
  %394 = load float, float addrspace(1)* %393, align 16
  %395 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %392, i32 0, i32 0, i32 0, i64 1
  %396 = load float, float addrspace(1)* %395, align 4
  %397 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %392, i32 0, i32 0, i32 0, i64 2
  %398 = load float, float addrspace(1)* %397, align 8
  %399 = fadd contract float %384, %394
  %400 = fadd contract float %385, %396
  %401 = fadd contract float %386, %398
  %402 = add nuw nsw i32 %281, 8
  %403 = add i32 %282, 8
  %404 = icmp eq i32 %403, %276
  br i1 %404, label %405, label %277, !llvm.loop !11

405:                                              ; preds = %277, %272
  %406 = phi float [ undef, %272 ], [ %399, %277 ]
  %407 = phi float [ undef, %272 ], [ %400, %277 ]
  %408 = phi float [ undef, %272 ], [ %401, %277 ]
  %409 = phi float [ %264, %272 ], [ %399, %277 ]
  %410 = phi float [ %266, %272 ], [ %400, %277 ]
  %411 = phi float [ %268, %272 ], [ %401, %277 ]
  %412 = phi i32 [ 0, %272 ], [ %402, %277 ]
  %413 = icmp eq i32 %273, 0
  br i1 %413, label %437, label %414

414:                                              ; preds = %405, %414
  %415 = phi float [ %431, %414 ], [ %409, %405 ]
  %416 = phi float [ %432, %414 ], [ %410, %405 ]
  %417 = phi float [ %433, %414 ], [ %411, %405 ]
  %418 = phi i32 [ %434, %414 ], [ %412, %405 ]
  %419 = phi i32 [ %435, %414 ], [ 0, %405 ]
  %420 = add nsw i32 %418, %259
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %421
  %423 = load i32, i32 addrspace(1)* %422, align 4, !tbaa !7
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %424, i32 0, i32 0, i32 0, i64 0
  %426 = load float, float addrspace(1)* %425, align 16
  %427 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %424, i32 0, i32 0, i32 0, i64 1
  %428 = load float, float addrspace(1)* %427, align 4
  %429 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %424, i32 0, i32 0, i32 0, i64 2
  %430 = load float, float addrspace(1)* %429, align 8
  %431 = fadd contract float %415, %426
  %432 = fadd contract float %416, %428
  %433 = fadd contract float %417, %430
  %434 = add nuw nsw i32 %418, 1
  %435 = add i32 %419, 1
  %436 = icmp eq i32 %435, %273
  br i1 %436, label %437, label %414, !llvm.loop !15

437:                                              ; preds = %405, %414, %256
  %438 = phi float [ %268, %256 ], [ %408, %405 ], [ %433, %414 ]
  %439 = phi float [ %266, %256 ], [ %407, %405 ], [ %432, %414 ]
  %440 = phi float [ %264, %256 ], [ %406, %405 ], [ %431, %414 ]
  %441 = add nsw i32 %261, 1
  %442 = sitofp i32 %441 to float
  %443 = fdiv contract float %440, %442
  %444 = fdiv contract float %439, %442
  %445 = fdiv contract float %438, %442
  %446 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %257, i32 0, i32 0, i32 0, i64 0
  store float %443, float addrspace(1)* %446, align 16
  %447 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %257, i32 0, i32 0, i32 0, i64 1
  store float %444, float addrspace(1)* %447, align 4
  %448 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %257, i32 0, i32 0, i32 0, i64 2
  store float %445, float addrspace(1)* %448, align 8
  %449 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %257, i32 0, i32 0, i32 0, i64 3
  store float %270, float addrspace(1)* %449, align 4
  br label %450

450:                                              ; preds = %437, %253
  %451 = phi i32 [ %262, %437 ], [ %254, %253 ]
  %452 = add nsw i32 %16, 256
  %453 = icmp ult i32 %452, %5
  br i1 %453, label %454, label %648

454:                                              ; preds = %450
  %455 = sext i32 %452 to i64
  %456 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %455
  %457 = load i32, i32 addrspace(1)* %456, align 4, !tbaa !7
  %458 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %455
  %459 = load i32, i32 addrspace(1)* %458, align 4, !tbaa !7
  %460 = add nsw i32 %451, 1
  %461 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %451, i32 0, i32 0, i32 0, i32 0
  %462 = load float, float addrspace(3)* %461, align 16
  %463 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %451, i32 0, i32 0, i32 0, i32 1
  %464 = load float, float addrspace(3)* %463, align 4
  %465 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %451, i32 0, i32 0, i32 0, i32 2
  %466 = load float, float addrspace(3)* %465, align 8
  %467 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %451, i32 0, i32 0, i32 0, i32 3
  %468 = load float, float addrspace(3)* %467, align 4
  %469 = icmp sgt i32 %459, 0
  br i1 %469, label %470, label %635

470:                                              ; preds = %454
  %471 = and i32 %459, 7
  %472 = icmp ult i32 %459, 8
  br i1 %472, label %603, label %473

473:                                              ; preds = %470
  %474 = and i32 %459, -8
  br label %475

475:                                              ; preds = %475, %473
  %476 = phi float [ %462, %473 ], [ %597, %475 ]
  %477 = phi float [ %464, %473 ], [ %598, %475 ]
  %478 = phi float [ %466, %473 ], [ %599, %475 ]
  %479 = phi i32 [ 0, %473 ], [ %600, %475 ]
  %480 = phi i32 [ 0, %473 ], [ %601, %475 ]
  %481 = add nsw i32 %479, %457
  %482 = sext i32 %481 to i64
  %483 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %482
  %484 = load i32, i32 addrspace(1)* %483, align 4, !tbaa !7
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %485, i32 0, i32 0, i32 0, i64 0
  %487 = load float, float addrspace(1)* %486, align 16
  %488 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %485, i32 0, i32 0, i32 0, i64 1
  %489 = load float, float addrspace(1)* %488, align 4
  %490 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %485, i32 0, i32 0, i32 0, i64 2
  %491 = load float, float addrspace(1)* %490, align 8
  %492 = fadd contract float %476, %487
  %493 = fadd contract float %477, %489
  %494 = fadd contract float %478, %491
  %495 = or i32 %479, 1
  %496 = add nsw i32 %495, %457
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %497
  %499 = load i32, i32 addrspace(1)* %498, align 4, !tbaa !7
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %500, i32 0, i32 0, i32 0, i64 0
  %502 = load float, float addrspace(1)* %501, align 16
  %503 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %500, i32 0, i32 0, i32 0, i64 1
  %504 = load float, float addrspace(1)* %503, align 4
  %505 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %500, i32 0, i32 0, i32 0, i64 2
  %506 = load float, float addrspace(1)* %505, align 8
  %507 = fadd contract float %492, %502
  %508 = fadd contract float %493, %504
  %509 = fadd contract float %494, %506
  %510 = or i32 %479, 2
  %511 = add nsw i32 %510, %457
  %512 = sext i32 %511 to i64
  %513 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %512
  %514 = load i32, i32 addrspace(1)* %513, align 4, !tbaa !7
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %515, i32 0, i32 0, i32 0, i64 0
  %517 = load float, float addrspace(1)* %516, align 16
  %518 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %515, i32 0, i32 0, i32 0, i64 1
  %519 = load float, float addrspace(1)* %518, align 4
  %520 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %515, i32 0, i32 0, i32 0, i64 2
  %521 = load float, float addrspace(1)* %520, align 8
  %522 = fadd contract float %507, %517
  %523 = fadd contract float %508, %519
  %524 = fadd contract float %509, %521
  %525 = or i32 %479, 3
  %526 = add nsw i32 %525, %457
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %527
  %529 = load i32, i32 addrspace(1)* %528, align 4, !tbaa !7
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %530, i32 0, i32 0, i32 0, i64 0
  %532 = load float, float addrspace(1)* %531, align 16
  %533 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %530, i32 0, i32 0, i32 0, i64 1
  %534 = load float, float addrspace(1)* %533, align 4
  %535 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %530, i32 0, i32 0, i32 0, i64 2
  %536 = load float, float addrspace(1)* %535, align 8
  %537 = fadd contract float %522, %532
  %538 = fadd contract float %523, %534
  %539 = fadd contract float %524, %536
  %540 = or i32 %479, 4
  %541 = add nsw i32 %540, %457
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %542
  %544 = load i32, i32 addrspace(1)* %543, align 4, !tbaa !7
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %545, i32 0, i32 0, i32 0, i64 0
  %547 = load float, float addrspace(1)* %546, align 16
  %548 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %545, i32 0, i32 0, i32 0, i64 1
  %549 = load float, float addrspace(1)* %548, align 4
  %550 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %545, i32 0, i32 0, i32 0, i64 2
  %551 = load float, float addrspace(1)* %550, align 8
  %552 = fadd contract float %537, %547
  %553 = fadd contract float %538, %549
  %554 = fadd contract float %539, %551
  %555 = or i32 %479, 5
  %556 = add nsw i32 %555, %457
  %557 = sext i32 %556 to i64
  %558 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %557
  %559 = load i32, i32 addrspace(1)* %558, align 4, !tbaa !7
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %560, i32 0, i32 0, i32 0, i64 0
  %562 = load float, float addrspace(1)* %561, align 16
  %563 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %560, i32 0, i32 0, i32 0, i64 1
  %564 = load float, float addrspace(1)* %563, align 4
  %565 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %560, i32 0, i32 0, i32 0, i64 2
  %566 = load float, float addrspace(1)* %565, align 8
  %567 = fadd contract float %552, %562
  %568 = fadd contract float %553, %564
  %569 = fadd contract float %554, %566
  %570 = or i32 %479, 6
  %571 = add nsw i32 %570, %457
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %572
  %574 = load i32, i32 addrspace(1)* %573, align 4, !tbaa !7
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %575, i32 0, i32 0, i32 0, i64 0
  %577 = load float, float addrspace(1)* %576, align 16
  %578 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %575, i32 0, i32 0, i32 0, i64 1
  %579 = load float, float addrspace(1)* %578, align 4
  %580 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %575, i32 0, i32 0, i32 0, i64 2
  %581 = load float, float addrspace(1)* %580, align 8
  %582 = fadd contract float %567, %577
  %583 = fadd contract float %568, %579
  %584 = fadd contract float %569, %581
  %585 = or i32 %479, 7
  %586 = add nsw i32 %585, %457
  %587 = sext i32 %586 to i64
  %588 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %587
  %589 = load i32, i32 addrspace(1)* %588, align 4, !tbaa !7
  %590 = sext i32 %589 to i64
  %591 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %590, i32 0, i32 0, i32 0, i64 0
  %592 = load float, float addrspace(1)* %591, align 16
  %593 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %590, i32 0, i32 0, i32 0, i64 1
  %594 = load float, float addrspace(1)* %593, align 4
  %595 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %590, i32 0, i32 0, i32 0, i64 2
  %596 = load float, float addrspace(1)* %595, align 8
  %597 = fadd contract float %582, %592
  %598 = fadd contract float %583, %594
  %599 = fadd contract float %584, %596
  %600 = add nuw nsw i32 %479, 8
  %601 = add i32 %480, 8
  %602 = icmp eq i32 %601, %474
  br i1 %602, label %603, label %475, !llvm.loop !11

603:                                              ; preds = %475, %470
  %604 = phi float [ undef, %470 ], [ %597, %475 ]
  %605 = phi float [ undef, %470 ], [ %598, %475 ]
  %606 = phi float [ undef, %470 ], [ %599, %475 ]
  %607 = phi float [ %462, %470 ], [ %597, %475 ]
  %608 = phi float [ %464, %470 ], [ %598, %475 ]
  %609 = phi float [ %466, %470 ], [ %599, %475 ]
  %610 = phi i32 [ 0, %470 ], [ %600, %475 ]
  %611 = icmp eq i32 %471, 0
  br i1 %611, label %635, label %612

612:                                              ; preds = %603, %612
  %613 = phi float [ %629, %612 ], [ %607, %603 ]
  %614 = phi float [ %630, %612 ], [ %608, %603 ]
  %615 = phi float [ %631, %612 ], [ %609, %603 ]
  %616 = phi i32 [ %632, %612 ], [ %610, %603 ]
  %617 = phi i32 [ %633, %612 ], [ 0, %603 ]
  %618 = add nsw i32 %616, %457
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %619
  %621 = load i32, i32 addrspace(1)* %620, align 4, !tbaa !7
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %622, i32 0, i32 0, i32 0, i64 0
  %624 = load float, float addrspace(1)* %623, align 16
  %625 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %622, i32 0, i32 0, i32 0, i64 1
  %626 = load float, float addrspace(1)* %625, align 4
  %627 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %622, i32 0, i32 0, i32 0, i64 2
  %628 = load float, float addrspace(1)* %627, align 8
  %629 = fadd contract float %613, %624
  %630 = fadd contract float %614, %626
  %631 = fadd contract float %615, %628
  %632 = add nuw nsw i32 %616, 1
  %633 = add i32 %617, 1
  %634 = icmp eq i32 %633, %471
  br i1 %634, label %635, label %612, !llvm.loop !16

635:                                              ; preds = %603, %612, %454
  %636 = phi float [ %466, %454 ], [ %606, %603 ], [ %631, %612 ]
  %637 = phi float [ %464, %454 ], [ %605, %603 ], [ %630, %612 ]
  %638 = phi float [ %462, %454 ], [ %604, %603 ], [ %629, %612 ]
  %639 = add nsw i32 %459, 1
  %640 = sitofp i32 %639 to float
  %641 = fdiv contract float %638, %640
  %642 = fdiv contract float %637, %640
  %643 = fdiv contract float %636, %640
  %644 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %455, i32 0, i32 0, i32 0, i64 0
  store float %641, float addrspace(1)* %644, align 16
  %645 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %455, i32 0, i32 0, i32 0, i64 1
  store float %642, float addrspace(1)* %645, align 4
  %646 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %455, i32 0, i32 0, i32 0, i64 2
  store float %643, float addrspace(1)* %646, align 8
  %647 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %455, i32 0, i32 0, i32 0, i64 3
  store float %468, float addrspace(1)* %647, align 4
  br label %648

648:                                              ; preds = %635, %450
  %649 = phi i32 [ %460, %635 ], [ %451, %450 ]
  %650 = add nsw i32 %16, 384
  %651 = icmp ult i32 %650, %5
  br i1 %651, label %652, label %845

652:                                              ; preds = %648
  %653 = sext i32 %650 to i64
  %654 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %653
  %655 = load i32, i32 addrspace(1)* %654, align 4, !tbaa !7
  %656 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %653
  %657 = load i32, i32 addrspace(1)* %656, align 4, !tbaa !7
  %658 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %649, i32 0, i32 0, i32 0, i32 0
  %659 = load float, float addrspace(3)* %658, align 16
  %660 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %649, i32 0, i32 0, i32 0, i32 1
  %661 = load float, float addrspace(3)* %660, align 4
  %662 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %649, i32 0, i32 0, i32 0, i32 2
  %663 = load float, float addrspace(3)* %662, align 8
  %664 = getelementptr inbounds [512 x %struct.HIP_vector_type], [512 x %struct.HIP_vector_type] addrspace(3)* @_ZZ21GradientAverageKernelP15HIP_vector_typeIfLj4EES1_PjS2_S2_jE2SI, i32 0, i32 %649, i32 0, i32 0, i32 0, i32 3
  %665 = load float, float addrspace(3)* %664, align 4
  %666 = icmp sgt i32 %657, 0
  br i1 %666, label %667, label %832

667:                                              ; preds = %652
  %668 = and i32 %657, 7
  %669 = icmp ult i32 %657, 8
  br i1 %669, label %800, label %670

670:                                              ; preds = %667
  %671 = and i32 %657, -8
  br label %672

672:                                              ; preds = %672, %670
  %673 = phi float [ %659, %670 ], [ %794, %672 ]
  %674 = phi float [ %661, %670 ], [ %795, %672 ]
  %675 = phi float [ %663, %670 ], [ %796, %672 ]
  %676 = phi i32 [ 0, %670 ], [ %797, %672 ]
  %677 = phi i32 [ 0, %670 ], [ %798, %672 ]
  %678 = add nsw i32 %676, %655
  %679 = sext i32 %678 to i64
  %680 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %679
  %681 = load i32, i32 addrspace(1)* %680, align 4, !tbaa !7
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %682, i32 0, i32 0, i32 0, i64 0
  %684 = load float, float addrspace(1)* %683, align 16
  %685 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %682, i32 0, i32 0, i32 0, i64 1
  %686 = load float, float addrspace(1)* %685, align 4
  %687 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %682, i32 0, i32 0, i32 0, i64 2
  %688 = load float, float addrspace(1)* %687, align 8
  %689 = fadd contract float %673, %684
  %690 = fadd contract float %674, %686
  %691 = fadd contract float %675, %688
  %692 = or i32 %676, 1
  %693 = add nsw i32 %692, %655
  %694 = sext i32 %693 to i64
  %695 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %694
  %696 = load i32, i32 addrspace(1)* %695, align 4, !tbaa !7
  %697 = sext i32 %696 to i64
  %698 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %697, i32 0, i32 0, i32 0, i64 0
  %699 = load float, float addrspace(1)* %698, align 16
  %700 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %697, i32 0, i32 0, i32 0, i64 1
  %701 = load float, float addrspace(1)* %700, align 4
  %702 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %697, i32 0, i32 0, i32 0, i64 2
  %703 = load float, float addrspace(1)* %702, align 8
  %704 = fadd contract float %689, %699
  %705 = fadd contract float %690, %701
  %706 = fadd contract float %691, %703
  %707 = or i32 %676, 2
  %708 = add nsw i32 %707, %655
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %709
  %711 = load i32, i32 addrspace(1)* %710, align 4, !tbaa !7
  %712 = sext i32 %711 to i64
  %713 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %712, i32 0, i32 0, i32 0, i64 0
  %714 = load float, float addrspace(1)* %713, align 16
  %715 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %712, i32 0, i32 0, i32 0, i64 1
  %716 = load float, float addrspace(1)* %715, align 4
  %717 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %712, i32 0, i32 0, i32 0, i64 2
  %718 = load float, float addrspace(1)* %717, align 8
  %719 = fadd contract float %704, %714
  %720 = fadd contract float %705, %716
  %721 = fadd contract float %706, %718
  %722 = or i32 %676, 3
  %723 = add nsw i32 %722, %655
  %724 = sext i32 %723 to i64
  %725 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %724
  %726 = load i32, i32 addrspace(1)* %725, align 4, !tbaa !7
  %727 = sext i32 %726 to i64
  %728 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %727, i32 0, i32 0, i32 0, i64 0
  %729 = load float, float addrspace(1)* %728, align 16
  %730 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %727, i32 0, i32 0, i32 0, i64 1
  %731 = load float, float addrspace(1)* %730, align 4
  %732 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %727, i32 0, i32 0, i32 0, i64 2
  %733 = load float, float addrspace(1)* %732, align 8
  %734 = fadd contract float %719, %729
  %735 = fadd contract float %720, %731
  %736 = fadd contract float %721, %733
  %737 = or i32 %676, 4
  %738 = add nsw i32 %737, %655
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %739
  %741 = load i32, i32 addrspace(1)* %740, align 4, !tbaa !7
  %742 = sext i32 %741 to i64
  %743 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %742, i32 0, i32 0, i32 0, i64 0
  %744 = load float, float addrspace(1)* %743, align 16
  %745 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %742, i32 0, i32 0, i32 0, i64 1
  %746 = load float, float addrspace(1)* %745, align 4
  %747 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %742, i32 0, i32 0, i32 0, i64 2
  %748 = load float, float addrspace(1)* %747, align 8
  %749 = fadd contract float %734, %744
  %750 = fadd contract float %735, %746
  %751 = fadd contract float %736, %748
  %752 = or i32 %676, 5
  %753 = add nsw i32 %752, %655
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %754
  %756 = load i32, i32 addrspace(1)* %755, align 4, !tbaa !7
  %757 = sext i32 %756 to i64
  %758 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %757, i32 0, i32 0, i32 0, i64 0
  %759 = load float, float addrspace(1)* %758, align 16
  %760 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %757, i32 0, i32 0, i32 0, i64 1
  %761 = load float, float addrspace(1)* %760, align 4
  %762 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %757, i32 0, i32 0, i32 0, i64 2
  %763 = load float, float addrspace(1)* %762, align 8
  %764 = fadd contract float %749, %759
  %765 = fadd contract float %750, %761
  %766 = fadd contract float %751, %763
  %767 = or i32 %676, 6
  %768 = add nsw i32 %767, %655
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %769
  %771 = load i32, i32 addrspace(1)* %770, align 4, !tbaa !7
  %772 = sext i32 %771 to i64
  %773 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %772, i32 0, i32 0, i32 0, i64 0
  %774 = load float, float addrspace(1)* %773, align 16
  %775 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %772, i32 0, i32 0, i32 0, i64 1
  %776 = load float, float addrspace(1)* %775, align 4
  %777 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %772, i32 0, i32 0, i32 0, i64 2
  %778 = load float, float addrspace(1)* %777, align 8
  %779 = fadd contract float %764, %774
  %780 = fadd contract float %765, %776
  %781 = fadd contract float %766, %778
  %782 = or i32 %676, 7
  %783 = add nsw i32 %782, %655
  %784 = sext i32 %783 to i64
  %785 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %784
  %786 = load i32, i32 addrspace(1)* %785, align 4, !tbaa !7
  %787 = sext i32 %786 to i64
  %788 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %787, i32 0, i32 0, i32 0, i64 0
  %789 = load float, float addrspace(1)* %788, align 16
  %790 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %787, i32 0, i32 0, i32 0, i64 1
  %791 = load float, float addrspace(1)* %790, align 4
  %792 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %787, i32 0, i32 0, i32 0, i64 2
  %793 = load float, float addrspace(1)* %792, align 8
  %794 = fadd contract float %779, %789
  %795 = fadd contract float %780, %791
  %796 = fadd contract float %781, %793
  %797 = add nuw nsw i32 %676, 8
  %798 = add i32 %677, 8
  %799 = icmp eq i32 %798, %671
  br i1 %799, label %800, label %672, !llvm.loop !11

800:                                              ; preds = %672, %667
  %801 = phi float [ undef, %667 ], [ %794, %672 ]
  %802 = phi float [ undef, %667 ], [ %795, %672 ]
  %803 = phi float [ undef, %667 ], [ %796, %672 ]
  %804 = phi float [ %659, %667 ], [ %794, %672 ]
  %805 = phi float [ %661, %667 ], [ %795, %672 ]
  %806 = phi float [ %663, %667 ], [ %796, %672 ]
  %807 = phi i32 [ 0, %667 ], [ %797, %672 ]
  %808 = icmp eq i32 %668, 0
  br i1 %808, label %832, label %809

809:                                              ; preds = %800, %809
  %810 = phi float [ %826, %809 ], [ %804, %800 ]
  %811 = phi float [ %827, %809 ], [ %805, %800 ]
  %812 = phi float [ %828, %809 ], [ %806, %800 ]
  %813 = phi i32 [ %829, %809 ], [ %807, %800 ]
  %814 = phi i32 [ %830, %809 ], [ 0, %800 ]
  %815 = add nsw i32 %813, %655
  %816 = sext i32 %815 to i64
  %817 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %816
  %818 = load i32, i32 addrspace(1)* %817, align 4, !tbaa !7
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %819, i32 0, i32 0, i32 0, i64 0
  %821 = load float, float addrspace(1)* %820, align 16
  %822 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %819, i32 0, i32 0, i32 0, i64 1
  %823 = load float, float addrspace(1)* %822, align 4
  %824 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %819, i32 0, i32 0, i32 0, i64 2
  %825 = load float, float addrspace(1)* %824, align 8
  %826 = fadd contract float %810, %821
  %827 = fadd contract float %811, %823
  %828 = fadd contract float %812, %825
  %829 = add nuw nsw i32 %813, 1
  %830 = add i32 %814, 1
  %831 = icmp eq i32 %830, %668
  br i1 %831, label %832, label %809, !llvm.loop !17

832:                                              ; preds = %800, %809, %652
  %833 = phi float [ %663, %652 ], [ %803, %800 ], [ %828, %809 ]
  %834 = phi float [ %661, %652 ], [ %802, %800 ], [ %827, %809 ]
  %835 = phi float [ %659, %652 ], [ %801, %800 ], [ %826, %809 ]
  %836 = add nsw i32 %657, 1
  %837 = sitofp i32 %836 to float
  %838 = fdiv contract float %835, %837
  %839 = fdiv contract float %834, %837
  %840 = fdiv contract float %833, %837
  %841 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %653, i32 0, i32 0, i32 0, i64 0
  store float %838, float addrspace(1)* %841, align 16
  %842 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %653, i32 0, i32 0, i32 0, i64 1
  store float %839, float addrspace(1)* %842, align 4
  %843 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %653, i32 0, i32 0, i32 0, i64 2
  store float %840, float addrspace(1)* %843, align 8
  %844 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %653, i32 0, i32 0, i32 0, i64 3
  store float %665, float addrspace(1)* %844, align 4
  br label %845

845:                                              ; preds = %648, %832
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
