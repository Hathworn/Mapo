; ModuleID = '../data/hip_kernels/3524/0/main.cu'
source_filename = "../data/hip_kernels/3524/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }

@_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r = internal unnamed_addr addrspace(3) global [256 x %struct.HIP_vector_type] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_(%struct.HIP_vector_type.0 addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture %2, i32 %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = add nsw i32 %14, %3
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 0
  %18 = load float, float addrspace(1)* %17, align 16, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 1
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 2
  %22 = load float, float addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !6
  %23 = sext i32 %14 to i64
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %23, i32 0, i32 0, i32 0, i32 0, i64 0
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %23, i32 0, i32 0, i32 0, i32 0, i64 1
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %23, i32 0, i32 0, i32 0, i32 0, i64 2
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %6
  %31 = bitcast %struct.HIP_vector_type addrspace(3)* %30 to i8 addrspace(3)*
  %32 = zext i32 %6 to i64
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %32
  %34 = bitcast %struct.HIP_vector_type addrspace(1)* %33 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %34, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1853

35:                                               ; preds = %1853
  %36 = add nuw nsw i32 %6, %11
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %37
  %39 = bitcast %struct.HIP_vector_type addrspace(1)* %38 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %39, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %40

40:                                               ; preds = %40, %35
  %41 = phi float [ %1923, %35 ], [ %110, %40 ]
  %42 = phi float [ %1922, %35 ], [ %109, %40 ]
  %43 = phi float [ %1921, %35 ], [ %108, %40 ]
  %44 = phi i32 [ 1, %35 ], [ %111, %40 ]
  %45 = add nsw i32 %44, -1
  %46 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %45, i32 0, i32 0, i32 0, i32 0, i32 0
  %47 = load float, float addrspace(3)* %46, align 4
  %48 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %45, i32 0, i32 0, i32 0, i32 0, i32 1
  %49 = load float, float addrspace(3)* %48, align 4
  %50 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %45, i32 0, i32 0, i32 0, i32 0, i32 2
  %51 = load float, float addrspace(3)* %50, align 4
  %52 = and i32 %44, 255
  %53 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %52, i32 0, i32 0, i32 0, i32 0, i32 0
  %54 = load float, float addrspace(3)* %53, align 4
  %55 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %52, i32 0, i32 0, i32 0, i32 0, i32 1
  %56 = load float, float addrspace(3)* %55, align 4
  %57 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %52, i32 0, i32 0, i32 0, i32 0, i32 2
  %58 = load float, float addrspace(3)* %57, align 4
  %59 = fsub contract float %54, %47
  %60 = fsub contract float %56, %49
  %61 = fsub contract float %58, %51
  %62 = fsub contract float %18, %47
  %63 = fsub contract float %20, %49
  %64 = fsub contract float %22, %51
  %65 = fmul contract float %62, %62
  %66 = fmul contract float %63, %63
  %67 = fadd contract float %65, %66
  %68 = fmul contract float %64, %64
  %69 = fadd contract float %68, %67
  %70 = fdiv contract float 1.000000e+00, %69
  %71 = fcmp olt float %69, 0x39F0000000000000
  %72 = select i1 %71, float 0x41F0000000000000, float 1.000000e+00
  %73 = fmul float %69, %72
  %74 = tail call float @llvm.sqrt.f32(float %73)
  %75 = bitcast float %74 to i32
  %76 = add nsw i32 %75, -1
  %77 = bitcast i32 %76 to float
  %78 = add nsw i32 %75, 1
  %79 = bitcast i32 %78 to float
  %80 = tail call i1 @llvm.amdgcn.class.f32(float %73, i32 608)
  %81 = select i1 %71, float 0x3EF0000000000000, float 1.000000e+00
  %82 = fneg float %79
  %83 = tail call float @llvm.fma.f32(float %82, float %74, float %73)
  %84 = fcmp ogt float %83, 0.000000e+00
  %85 = fneg float %77
  %86 = tail call float @llvm.fma.f32(float %85, float %74, float %73)
  %87 = fcmp ole float %86, 0.000000e+00
  %88 = select i1 %87, float %77, float %74
  %89 = select i1 %84, float %79, float %88
  %90 = fmul float %81, %89
  %91 = select i1 %80, float %73, float %90
  %92 = fdiv contract float 1.000000e+00, %91
  %93 = fmul contract float %62, %92
  %94 = fmul contract float %63, %92
  %95 = fmul contract float %64, %92
  %96 = fmul contract float %60, %95
  %97 = fmul contract float %61, %94
  %98 = fsub contract float %96, %97
  %99 = fmul contract float %70, %98
  %100 = fmul contract float %61, %93
  %101 = fmul contract float %59, %95
  %102 = fsub contract float %100, %101
  %103 = fmul contract float %70, %102
  %104 = fmul contract float %59, %94
  %105 = fmul contract float %60, %93
  %106 = fsub contract float %104, %105
  %107 = fmul contract float %70, %106
  %108 = fadd contract float %43, %99
  %109 = fadd contract float %42, %103
  %110 = fadd contract float %41, %107
  %111 = add nuw nsw i32 %44, 1
  %112 = icmp eq i32 %111, 257
  br i1 %112, label %113, label %40, !llvm.loop !10

113:                                              ; preds = %40
  %114 = shl nuw nsw i32 %11, 1
  %115 = add nuw nsw i32 %114, %6
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %116
  %118 = bitcast %struct.HIP_vector_type addrspace(1)* %117 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %118, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %119

119:                                              ; preds = %119, %113
  %120 = phi float [ %110, %113 ], [ %189, %119 ]
  %121 = phi float [ %109, %113 ], [ %188, %119 ]
  %122 = phi float [ %108, %113 ], [ %187, %119 ]
  %123 = phi i32 [ 1, %113 ], [ %190, %119 ]
  %124 = add nsw i32 %123, -1
  %125 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %124, i32 0, i32 0, i32 0, i32 0, i32 0
  %126 = load float, float addrspace(3)* %125, align 4
  %127 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %124, i32 0, i32 0, i32 0, i32 0, i32 1
  %128 = load float, float addrspace(3)* %127, align 4
  %129 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %124, i32 0, i32 0, i32 0, i32 0, i32 2
  %130 = load float, float addrspace(3)* %129, align 4
  %131 = and i32 %123, 255
  %132 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %131, i32 0, i32 0, i32 0, i32 0, i32 0
  %133 = load float, float addrspace(3)* %132, align 4
  %134 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %131, i32 0, i32 0, i32 0, i32 0, i32 1
  %135 = load float, float addrspace(3)* %134, align 4
  %136 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %131, i32 0, i32 0, i32 0, i32 0, i32 2
  %137 = load float, float addrspace(3)* %136, align 4
  %138 = fsub contract float %133, %126
  %139 = fsub contract float %135, %128
  %140 = fsub contract float %137, %130
  %141 = fsub contract float %18, %126
  %142 = fsub contract float %20, %128
  %143 = fsub contract float %22, %130
  %144 = fmul contract float %141, %141
  %145 = fmul contract float %142, %142
  %146 = fadd contract float %144, %145
  %147 = fmul contract float %143, %143
  %148 = fadd contract float %147, %146
  %149 = fdiv contract float 1.000000e+00, %148
  %150 = fcmp olt float %148, 0x39F0000000000000
  %151 = select i1 %150, float 0x41F0000000000000, float 1.000000e+00
  %152 = fmul float %148, %151
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
  %171 = fdiv contract float 1.000000e+00, %170
  %172 = fmul contract float %141, %171
  %173 = fmul contract float %142, %171
  %174 = fmul contract float %143, %171
  %175 = fmul contract float %139, %174
  %176 = fmul contract float %140, %173
  %177 = fsub contract float %175, %176
  %178 = fmul contract float %149, %177
  %179 = fmul contract float %140, %172
  %180 = fmul contract float %138, %174
  %181 = fsub contract float %179, %180
  %182 = fmul contract float %149, %181
  %183 = fmul contract float %138, %173
  %184 = fmul contract float %139, %172
  %185 = fsub contract float %183, %184
  %186 = fmul contract float %149, %185
  %187 = fadd contract float %122, %178
  %188 = fadd contract float %121, %182
  %189 = fadd contract float %120, %186
  %190 = add nuw nsw i32 %123, 1
  %191 = icmp eq i32 %190, 257
  br i1 %191, label %192, label %119, !llvm.loop !10

192:                                              ; preds = %119
  %193 = mul nuw nsw i32 %11, 3
  %194 = add nuw nsw i32 %193, %6
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %195
  %197 = bitcast %struct.HIP_vector_type addrspace(1)* %196 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %197, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %198

198:                                              ; preds = %198, %192
  %199 = phi float [ %189, %192 ], [ %268, %198 ]
  %200 = phi float [ %188, %192 ], [ %267, %198 ]
  %201 = phi float [ %187, %192 ], [ %266, %198 ]
  %202 = phi i32 [ 1, %192 ], [ %269, %198 ]
  %203 = add nsw i32 %202, -1
  %204 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %203, i32 0, i32 0, i32 0, i32 0, i32 0
  %205 = load float, float addrspace(3)* %204, align 4
  %206 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %203, i32 0, i32 0, i32 0, i32 0, i32 1
  %207 = load float, float addrspace(3)* %206, align 4
  %208 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %203, i32 0, i32 0, i32 0, i32 0, i32 2
  %209 = load float, float addrspace(3)* %208, align 4
  %210 = and i32 %202, 255
  %211 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %210, i32 0, i32 0, i32 0, i32 0, i32 0
  %212 = load float, float addrspace(3)* %211, align 4
  %213 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %210, i32 0, i32 0, i32 0, i32 0, i32 1
  %214 = load float, float addrspace(3)* %213, align 4
  %215 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %210, i32 0, i32 0, i32 0, i32 0, i32 2
  %216 = load float, float addrspace(3)* %215, align 4
  %217 = fsub contract float %212, %205
  %218 = fsub contract float %214, %207
  %219 = fsub contract float %216, %209
  %220 = fsub contract float %18, %205
  %221 = fsub contract float %20, %207
  %222 = fsub contract float %22, %209
  %223 = fmul contract float %220, %220
  %224 = fmul contract float %221, %221
  %225 = fadd contract float %223, %224
  %226 = fmul contract float %222, %222
  %227 = fadd contract float %226, %225
  %228 = fdiv contract float 1.000000e+00, %227
  %229 = fcmp olt float %227, 0x39F0000000000000
  %230 = select i1 %229, float 0x41F0000000000000, float 1.000000e+00
  %231 = fmul float %227, %230
  %232 = tail call float @llvm.sqrt.f32(float %231)
  %233 = bitcast float %232 to i32
  %234 = add nsw i32 %233, -1
  %235 = bitcast i32 %234 to float
  %236 = add nsw i32 %233, 1
  %237 = bitcast i32 %236 to float
  %238 = tail call i1 @llvm.amdgcn.class.f32(float %231, i32 608)
  %239 = select i1 %229, float 0x3EF0000000000000, float 1.000000e+00
  %240 = fneg float %237
  %241 = tail call float @llvm.fma.f32(float %240, float %232, float %231)
  %242 = fcmp ogt float %241, 0.000000e+00
  %243 = fneg float %235
  %244 = tail call float @llvm.fma.f32(float %243, float %232, float %231)
  %245 = fcmp ole float %244, 0.000000e+00
  %246 = select i1 %245, float %235, float %232
  %247 = select i1 %242, float %237, float %246
  %248 = fmul float %239, %247
  %249 = select i1 %238, float %231, float %248
  %250 = fdiv contract float 1.000000e+00, %249
  %251 = fmul contract float %220, %250
  %252 = fmul contract float %221, %250
  %253 = fmul contract float %222, %250
  %254 = fmul contract float %218, %253
  %255 = fmul contract float %219, %252
  %256 = fsub contract float %254, %255
  %257 = fmul contract float %228, %256
  %258 = fmul contract float %219, %251
  %259 = fmul contract float %217, %253
  %260 = fsub contract float %258, %259
  %261 = fmul contract float %228, %260
  %262 = fmul contract float %217, %252
  %263 = fmul contract float %218, %251
  %264 = fsub contract float %262, %263
  %265 = fmul contract float %228, %264
  %266 = fadd contract float %201, %257
  %267 = fadd contract float %200, %261
  %268 = fadd contract float %199, %265
  %269 = add nuw nsw i32 %202, 1
  %270 = icmp eq i32 %269, 257
  br i1 %270, label %271, label %198, !llvm.loop !10

271:                                              ; preds = %198
  %272 = shl nuw nsw i32 %11, 2
  %273 = add nuw nsw i32 %272, %6
  %274 = zext i32 %273 to i64
  %275 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %274
  %276 = bitcast %struct.HIP_vector_type addrspace(1)* %275 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %276, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %277

277:                                              ; preds = %277, %271
  %278 = phi float [ %268, %271 ], [ %347, %277 ]
  %279 = phi float [ %267, %271 ], [ %346, %277 ]
  %280 = phi float [ %266, %271 ], [ %345, %277 ]
  %281 = phi i32 [ 1, %271 ], [ %348, %277 ]
  %282 = add nsw i32 %281, -1
  %283 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %282, i32 0, i32 0, i32 0, i32 0, i32 0
  %284 = load float, float addrspace(3)* %283, align 4
  %285 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %282, i32 0, i32 0, i32 0, i32 0, i32 1
  %286 = load float, float addrspace(3)* %285, align 4
  %287 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %282, i32 0, i32 0, i32 0, i32 0, i32 2
  %288 = load float, float addrspace(3)* %287, align 4
  %289 = and i32 %281, 255
  %290 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %289, i32 0, i32 0, i32 0, i32 0, i32 0
  %291 = load float, float addrspace(3)* %290, align 4
  %292 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %289, i32 0, i32 0, i32 0, i32 0, i32 1
  %293 = load float, float addrspace(3)* %292, align 4
  %294 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %289, i32 0, i32 0, i32 0, i32 0, i32 2
  %295 = load float, float addrspace(3)* %294, align 4
  %296 = fsub contract float %291, %284
  %297 = fsub contract float %293, %286
  %298 = fsub contract float %295, %288
  %299 = fsub contract float %18, %284
  %300 = fsub contract float %20, %286
  %301 = fsub contract float %22, %288
  %302 = fmul contract float %299, %299
  %303 = fmul contract float %300, %300
  %304 = fadd contract float %302, %303
  %305 = fmul contract float %301, %301
  %306 = fadd contract float %305, %304
  %307 = fdiv contract float 1.000000e+00, %306
  %308 = fcmp olt float %306, 0x39F0000000000000
  %309 = select i1 %308, float 0x41F0000000000000, float 1.000000e+00
  %310 = fmul float %306, %309
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
  %329 = fdiv contract float 1.000000e+00, %328
  %330 = fmul contract float %299, %329
  %331 = fmul contract float %300, %329
  %332 = fmul contract float %301, %329
  %333 = fmul contract float %297, %332
  %334 = fmul contract float %298, %331
  %335 = fsub contract float %333, %334
  %336 = fmul contract float %307, %335
  %337 = fmul contract float %298, %330
  %338 = fmul contract float %296, %332
  %339 = fsub contract float %337, %338
  %340 = fmul contract float %307, %339
  %341 = fmul contract float %296, %331
  %342 = fmul contract float %297, %330
  %343 = fsub contract float %341, %342
  %344 = fmul contract float %307, %343
  %345 = fadd contract float %280, %336
  %346 = fadd contract float %279, %340
  %347 = fadd contract float %278, %344
  %348 = add nuw nsw i32 %281, 1
  %349 = icmp eq i32 %348, 257
  br i1 %349, label %350, label %277, !llvm.loop !10

350:                                              ; preds = %277
  %351 = mul nuw nsw i32 %11, 5
  %352 = add nuw nsw i32 %351, %6
  %353 = zext i32 %352 to i64
  %354 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %353
  %355 = bitcast %struct.HIP_vector_type addrspace(1)* %354 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %355, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %356

356:                                              ; preds = %356, %350
  %357 = phi float [ %347, %350 ], [ %426, %356 ]
  %358 = phi float [ %346, %350 ], [ %425, %356 ]
  %359 = phi float [ %345, %350 ], [ %424, %356 ]
  %360 = phi i32 [ 1, %350 ], [ %427, %356 ]
  %361 = add nsw i32 %360, -1
  %362 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %361, i32 0, i32 0, i32 0, i32 0, i32 0
  %363 = load float, float addrspace(3)* %362, align 4
  %364 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %361, i32 0, i32 0, i32 0, i32 0, i32 1
  %365 = load float, float addrspace(3)* %364, align 4
  %366 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %361, i32 0, i32 0, i32 0, i32 0, i32 2
  %367 = load float, float addrspace(3)* %366, align 4
  %368 = and i32 %360, 255
  %369 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %368, i32 0, i32 0, i32 0, i32 0, i32 0
  %370 = load float, float addrspace(3)* %369, align 4
  %371 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %368, i32 0, i32 0, i32 0, i32 0, i32 1
  %372 = load float, float addrspace(3)* %371, align 4
  %373 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %368, i32 0, i32 0, i32 0, i32 0, i32 2
  %374 = load float, float addrspace(3)* %373, align 4
  %375 = fsub contract float %370, %363
  %376 = fsub contract float %372, %365
  %377 = fsub contract float %374, %367
  %378 = fsub contract float %18, %363
  %379 = fsub contract float %20, %365
  %380 = fsub contract float %22, %367
  %381 = fmul contract float %378, %378
  %382 = fmul contract float %379, %379
  %383 = fadd contract float %381, %382
  %384 = fmul contract float %380, %380
  %385 = fadd contract float %384, %383
  %386 = fdiv contract float 1.000000e+00, %385
  %387 = fcmp olt float %385, 0x39F0000000000000
  %388 = select i1 %387, float 0x41F0000000000000, float 1.000000e+00
  %389 = fmul float %385, %388
  %390 = tail call float @llvm.sqrt.f32(float %389)
  %391 = bitcast float %390 to i32
  %392 = add nsw i32 %391, -1
  %393 = bitcast i32 %392 to float
  %394 = add nsw i32 %391, 1
  %395 = bitcast i32 %394 to float
  %396 = tail call i1 @llvm.amdgcn.class.f32(float %389, i32 608)
  %397 = select i1 %387, float 0x3EF0000000000000, float 1.000000e+00
  %398 = fneg float %395
  %399 = tail call float @llvm.fma.f32(float %398, float %390, float %389)
  %400 = fcmp ogt float %399, 0.000000e+00
  %401 = fneg float %393
  %402 = tail call float @llvm.fma.f32(float %401, float %390, float %389)
  %403 = fcmp ole float %402, 0.000000e+00
  %404 = select i1 %403, float %393, float %390
  %405 = select i1 %400, float %395, float %404
  %406 = fmul float %397, %405
  %407 = select i1 %396, float %389, float %406
  %408 = fdiv contract float 1.000000e+00, %407
  %409 = fmul contract float %378, %408
  %410 = fmul contract float %379, %408
  %411 = fmul contract float %380, %408
  %412 = fmul contract float %376, %411
  %413 = fmul contract float %377, %410
  %414 = fsub contract float %412, %413
  %415 = fmul contract float %386, %414
  %416 = fmul contract float %377, %409
  %417 = fmul contract float %375, %411
  %418 = fsub contract float %416, %417
  %419 = fmul contract float %386, %418
  %420 = fmul contract float %375, %410
  %421 = fmul contract float %376, %409
  %422 = fsub contract float %420, %421
  %423 = fmul contract float %386, %422
  %424 = fadd contract float %359, %415
  %425 = fadd contract float %358, %419
  %426 = fadd contract float %357, %423
  %427 = add nuw nsw i32 %360, 1
  %428 = icmp eq i32 %427, 257
  br i1 %428, label %429, label %356, !llvm.loop !10

429:                                              ; preds = %356
  %430 = mul nuw nsw i32 %11, 6
  %431 = add nuw nsw i32 %430, %6
  %432 = zext i32 %431 to i64
  %433 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %432
  %434 = bitcast %struct.HIP_vector_type addrspace(1)* %433 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %434, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %435

435:                                              ; preds = %435, %429
  %436 = phi float [ %426, %429 ], [ %505, %435 ]
  %437 = phi float [ %425, %429 ], [ %504, %435 ]
  %438 = phi float [ %424, %429 ], [ %503, %435 ]
  %439 = phi i32 [ 1, %429 ], [ %506, %435 ]
  %440 = add nsw i32 %439, -1
  %441 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %440, i32 0, i32 0, i32 0, i32 0, i32 0
  %442 = load float, float addrspace(3)* %441, align 4
  %443 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %440, i32 0, i32 0, i32 0, i32 0, i32 1
  %444 = load float, float addrspace(3)* %443, align 4
  %445 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %440, i32 0, i32 0, i32 0, i32 0, i32 2
  %446 = load float, float addrspace(3)* %445, align 4
  %447 = and i32 %439, 255
  %448 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %447, i32 0, i32 0, i32 0, i32 0, i32 0
  %449 = load float, float addrspace(3)* %448, align 4
  %450 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %447, i32 0, i32 0, i32 0, i32 0, i32 1
  %451 = load float, float addrspace(3)* %450, align 4
  %452 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %447, i32 0, i32 0, i32 0, i32 0, i32 2
  %453 = load float, float addrspace(3)* %452, align 4
  %454 = fsub contract float %449, %442
  %455 = fsub contract float %451, %444
  %456 = fsub contract float %453, %446
  %457 = fsub contract float %18, %442
  %458 = fsub contract float %20, %444
  %459 = fsub contract float %22, %446
  %460 = fmul contract float %457, %457
  %461 = fmul contract float %458, %458
  %462 = fadd contract float %460, %461
  %463 = fmul contract float %459, %459
  %464 = fadd contract float %463, %462
  %465 = fdiv contract float 1.000000e+00, %464
  %466 = fcmp olt float %464, 0x39F0000000000000
  %467 = select i1 %466, float 0x41F0000000000000, float 1.000000e+00
  %468 = fmul float %464, %467
  %469 = tail call float @llvm.sqrt.f32(float %468)
  %470 = bitcast float %469 to i32
  %471 = add nsw i32 %470, -1
  %472 = bitcast i32 %471 to float
  %473 = add nsw i32 %470, 1
  %474 = bitcast i32 %473 to float
  %475 = tail call i1 @llvm.amdgcn.class.f32(float %468, i32 608)
  %476 = select i1 %466, float 0x3EF0000000000000, float 1.000000e+00
  %477 = fneg float %474
  %478 = tail call float @llvm.fma.f32(float %477, float %469, float %468)
  %479 = fcmp ogt float %478, 0.000000e+00
  %480 = fneg float %472
  %481 = tail call float @llvm.fma.f32(float %480, float %469, float %468)
  %482 = fcmp ole float %481, 0.000000e+00
  %483 = select i1 %482, float %472, float %469
  %484 = select i1 %479, float %474, float %483
  %485 = fmul float %476, %484
  %486 = select i1 %475, float %468, float %485
  %487 = fdiv contract float 1.000000e+00, %486
  %488 = fmul contract float %457, %487
  %489 = fmul contract float %458, %487
  %490 = fmul contract float %459, %487
  %491 = fmul contract float %455, %490
  %492 = fmul contract float %456, %489
  %493 = fsub contract float %491, %492
  %494 = fmul contract float %465, %493
  %495 = fmul contract float %456, %488
  %496 = fmul contract float %454, %490
  %497 = fsub contract float %495, %496
  %498 = fmul contract float %465, %497
  %499 = fmul contract float %454, %489
  %500 = fmul contract float %455, %488
  %501 = fsub contract float %499, %500
  %502 = fmul contract float %465, %501
  %503 = fadd contract float %438, %494
  %504 = fadd contract float %437, %498
  %505 = fadd contract float %436, %502
  %506 = add nuw nsw i32 %439, 1
  %507 = icmp eq i32 %506, 257
  br i1 %507, label %508, label %435, !llvm.loop !10

508:                                              ; preds = %435
  %509 = mul nuw nsw i32 %11, 7
  %510 = add nuw nsw i32 %509, %6
  %511 = zext i32 %510 to i64
  %512 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %511
  %513 = bitcast %struct.HIP_vector_type addrspace(1)* %512 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %513, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %514

514:                                              ; preds = %514, %508
  %515 = phi float [ %505, %508 ], [ %584, %514 ]
  %516 = phi float [ %504, %508 ], [ %583, %514 ]
  %517 = phi float [ %503, %508 ], [ %582, %514 ]
  %518 = phi i32 [ 1, %508 ], [ %585, %514 ]
  %519 = add nsw i32 %518, -1
  %520 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %519, i32 0, i32 0, i32 0, i32 0, i32 0
  %521 = load float, float addrspace(3)* %520, align 4
  %522 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %519, i32 0, i32 0, i32 0, i32 0, i32 1
  %523 = load float, float addrspace(3)* %522, align 4
  %524 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %519, i32 0, i32 0, i32 0, i32 0, i32 2
  %525 = load float, float addrspace(3)* %524, align 4
  %526 = and i32 %518, 255
  %527 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %526, i32 0, i32 0, i32 0, i32 0, i32 0
  %528 = load float, float addrspace(3)* %527, align 4
  %529 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %526, i32 0, i32 0, i32 0, i32 0, i32 1
  %530 = load float, float addrspace(3)* %529, align 4
  %531 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %526, i32 0, i32 0, i32 0, i32 0, i32 2
  %532 = load float, float addrspace(3)* %531, align 4
  %533 = fsub contract float %528, %521
  %534 = fsub contract float %530, %523
  %535 = fsub contract float %532, %525
  %536 = fsub contract float %18, %521
  %537 = fsub contract float %20, %523
  %538 = fsub contract float %22, %525
  %539 = fmul contract float %536, %536
  %540 = fmul contract float %537, %537
  %541 = fadd contract float %539, %540
  %542 = fmul contract float %538, %538
  %543 = fadd contract float %542, %541
  %544 = fdiv contract float 1.000000e+00, %543
  %545 = fcmp olt float %543, 0x39F0000000000000
  %546 = select i1 %545, float 0x41F0000000000000, float 1.000000e+00
  %547 = fmul float %543, %546
  %548 = tail call float @llvm.sqrt.f32(float %547)
  %549 = bitcast float %548 to i32
  %550 = add nsw i32 %549, -1
  %551 = bitcast i32 %550 to float
  %552 = add nsw i32 %549, 1
  %553 = bitcast i32 %552 to float
  %554 = tail call i1 @llvm.amdgcn.class.f32(float %547, i32 608)
  %555 = select i1 %545, float 0x3EF0000000000000, float 1.000000e+00
  %556 = fneg float %553
  %557 = tail call float @llvm.fma.f32(float %556, float %548, float %547)
  %558 = fcmp ogt float %557, 0.000000e+00
  %559 = fneg float %551
  %560 = tail call float @llvm.fma.f32(float %559, float %548, float %547)
  %561 = fcmp ole float %560, 0.000000e+00
  %562 = select i1 %561, float %551, float %548
  %563 = select i1 %558, float %553, float %562
  %564 = fmul float %555, %563
  %565 = select i1 %554, float %547, float %564
  %566 = fdiv contract float 1.000000e+00, %565
  %567 = fmul contract float %536, %566
  %568 = fmul contract float %537, %566
  %569 = fmul contract float %538, %566
  %570 = fmul contract float %534, %569
  %571 = fmul contract float %535, %568
  %572 = fsub contract float %570, %571
  %573 = fmul contract float %544, %572
  %574 = fmul contract float %535, %567
  %575 = fmul contract float %533, %569
  %576 = fsub contract float %574, %575
  %577 = fmul contract float %544, %576
  %578 = fmul contract float %533, %568
  %579 = fmul contract float %534, %567
  %580 = fsub contract float %578, %579
  %581 = fmul contract float %544, %580
  %582 = fadd contract float %517, %573
  %583 = fadd contract float %516, %577
  %584 = fadd contract float %515, %581
  %585 = add nuw nsw i32 %518, 1
  %586 = icmp eq i32 %585, 257
  br i1 %586, label %587, label %514, !llvm.loop !10

587:                                              ; preds = %514
  %588 = shl nuw nsw i32 %11, 3
  %589 = add nuw nsw i32 %588, %6
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %590
  %592 = bitcast %struct.HIP_vector_type addrspace(1)* %591 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %592, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %593

593:                                              ; preds = %593, %587
  %594 = phi float [ %584, %587 ], [ %663, %593 ]
  %595 = phi float [ %583, %587 ], [ %662, %593 ]
  %596 = phi float [ %582, %587 ], [ %661, %593 ]
  %597 = phi i32 [ 1, %587 ], [ %664, %593 ]
  %598 = add nsw i32 %597, -1
  %599 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %598, i32 0, i32 0, i32 0, i32 0, i32 0
  %600 = load float, float addrspace(3)* %599, align 4
  %601 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %598, i32 0, i32 0, i32 0, i32 0, i32 1
  %602 = load float, float addrspace(3)* %601, align 4
  %603 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %598, i32 0, i32 0, i32 0, i32 0, i32 2
  %604 = load float, float addrspace(3)* %603, align 4
  %605 = and i32 %597, 255
  %606 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %605, i32 0, i32 0, i32 0, i32 0, i32 0
  %607 = load float, float addrspace(3)* %606, align 4
  %608 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %605, i32 0, i32 0, i32 0, i32 0, i32 1
  %609 = load float, float addrspace(3)* %608, align 4
  %610 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %605, i32 0, i32 0, i32 0, i32 0, i32 2
  %611 = load float, float addrspace(3)* %610, align 4
  %612 = fsub contract float %607, %600
  %613 = fsub contract float %609, %602
  %614 = fsub contract float %611, %604
  %615 = fsub contract float %18, %600
  %616 = fsub contract float %20, %602
  %617 = fsub contract float %22, %604
  %618 = fmul contract float %615, %615
  %619 = fmul contract float %616, %616
  %620 = fadd contract float %618, %619
  %621 = fmul contract float %617, %617
  %622 = fadd contract float %621, %620
  %623 = fdiv contract float 1.000000e+00, %622
  %624 = fcmp olt float %622, 0x39F0000000000000
  %625 = select i1 %624, float 0x41F0000000000000, float 1.000000e+00
  %626 = fmul float %622, %625
  %627 = tail call float @llvm.sqrt.f32(float %626)
  %628 = bitcast float %627 to i32
  %629 = add nsw i32 %628, -1
  %630 = bitcast i32 %629 to float
  %631 = add nsw i32 %628, 1
  %632 = bitcast i32 %631 to float
  %633 = tail call i1 @llvm.amdgcn.class.f32(float %626, i32 608)
  %634 = select i1 %624, float 0x3EF0000000000000, float 1.000000e+00
  %635 = fneg float %632
  %636 = tail call float @llvm.fma.f32(float %635, float %627, float %626)
  %637 = fcmp ogt float %636, 0.000000e+00
  %638 = fneg float %630
  %639 = tail call float @llvm.fma.f32(float %638, float %627, float %626)
  %640 = fcmp ole float %639, 0.000000e+00
  %641 = select i1 %640, float %630, float %627
  %642 = select i1 %637, float %632, float %641
  %643 = fmul float %634, %642
  %644 = select i1 %633, float %626, float %643
  %645 = fdiv contract float 1.000000e+00, %644
  %646 = fmul contract float %615, %645
  %647 = fmul contract float %616, %645
  %648 = fmul contract float %617, %645
  %649 = fmul contract float %613, %648
  %650 = fmul contract float %614, %647
  %651 = fsub contract float %649, %650
  %652 = fmul contract float %623, %651
  %653 = fmul contract float %614, %646
  %654 = fmul contract float %612, %648
  %655 = fsub contract float %653, %654
  %656 = fmul contract float %623, %655
  %657 = fmul contract float %612, %647
  %658 = fmul contract float %613, %646
  %659 = fsub contract float %657, %658
  %660 = fmul contract float %623, %659
  %661 = fadd contract float %596, %652
  %662 = fadd contract float %595, %656
  %663 = fadd contract float %594, %660
  %664 = add nuw nsw i32 %597, 1
  %665 = icmp eq i32 %664, 257
  br i1 %665, label %666, label %593, !llvm.loop !10

666:                                              ; preds = %593
  %667 = mul nuw nsw i32 %11, 9
  %668 = add nuw nsw i32 %667, %6
  %669 = zext i32 %668 to i64
  %670 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %669
  %671 = bitcast %struct.HIP_vector_type addrspace(1)* %670 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %671, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %672

672:                                              ; preds = %672, %666
  %673 = phi float [ %663, %666 ], [ %742, %672 ]
  %674 = phi float [ %662, %666 ], [ %741, %672 ]
  %675 = phi float [ %661, %666 ], [ %740, %672 ]
  %676 = phi i32 [ 1, %666 ], [ %743, %672 ]
  %677 = add nsw i32 %676, -1
  %678 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %677, i32 0, i32 0, i32 0, i32 0, i32 0
  %679 = load float, float addrspace(3)* %678, align 4
  %680 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %677, i32 0, i32 0, i32 0, i32 0, i32 1
  %681 = load float, float addrspace(3)* %680, align 4
  %682 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %677, i32 0, i32 0, i32 0, i32 0, i32 2
  %683 = load float, float addrspace(3)* %682, align 4
  %684 = and i32 %676, 255
  %685 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %684, i32 0, i32 0, i32 0, i32 0, i32 0
  %686 = load float, float addrspace(3)* %685, align 4
  %687 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %684, i32 0, i32 0, i32 0, i32 0, i32 1
  %688 = load float, float addrspace(3)* %687, align 4
  %689 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %684, i32 0, i32 0, i32 0, i32 0, i32 2
  %690 = load float, float addrspace(3)* %689, align 4
  %691 = fsub contract float %686, %679
  %692 = fsub contract float %688, %681
  %693 = fsub contract float %690, %683
  %694 = fsub contract float %18, %679
  %695 = fsub contract float %20, %681
  %696 = fsub contract float %22, %683
  %697 = fmul contract float %694, %694
  %698 = fmul contract float %695, %695
  %699 = fadd contract float %697, %698
  %700 = fmul contract float %696, %696
  %701 = fadd contract float %700, %699
  %702 = fdiv contract float 1.000000e+00, %701
  %703 = fcmp olt float %701, 0x39F0000000000000
  %704 = select i1 %703, float 0x41F0000000000000, float 1.000000e+00
  %705 = fmul float %701, %704
  %706 = tail call float @llvm.sqrt.f32(float %705)
  %707 = bitcast float %706 to i32
  %708 = add nsw i32 %707, -1
  %709 = bitcast i32 %708 to float
  %710 = add nsw i32 %707, 1
  %711 = bitcast i32 %710 to float
  %712 = tail call i1 @llvm.amdgcn.class.f32(float %705, i32 608)
  %713 = select i1 %703, float 0x3EF0000000000000, float 1.000000e+00
  %714 = fneg float %711
  %715 = tail call float @llvm.fma.f32(float %714, float %706, float %705)
  %716 = fcmp ogt float %715, 0.000000e+00
  %717 = fneg float %709
  %718 = tail call float @llvm.fma.f32(float %717, float %706, float %705)
  %719 = fcmp ole float %718, 0.000000e+00
  %720 = select i1 %719, float %709, float %706
  %721 = select i1 %716, float %711, float %720
  %722 = fmul float %713, %721
  %723 = select i1 %712, float %705, float %722
  %724 = fdiv contract float 1.000000e+00, %723
  %725 = fmul contract float %694, %724
  %726 = fmul contract float %695, %724
  %727 = fmul contract float %696, %724
  %728 = fmul contract float %692, %727
  %729 = fmul contract float %693, %726
  %730 = fsub contract float %728, %729
  %731 = fmul contract float %702, %730
  %732 = fmul contract float %693, %725
  %733 = fmul contract float %691, %727
  %734 = fsub contract float %732, %733
  %735 = fmul contract float %702, %734
  %736 = fmul contract float %691, %726
  %737 = fmul contract float %692, %725
  %738 = fsub contract float %736, %737
  %739 = fmul contract float %702, %738
  %740 = fadd contract float %675, %731
  %741 = fadd contract float %674, %735
  %742 = fadd contract float %673, %739
  %743 = add nuw nsw i32 %676, 1
  %744 = icmp eq i32 %743, 257
  br i1 %744, label %745, label %672, !llvm.loop !10

745:                                              ; preds = %672
  %746 = mul nuw nsw i32 %11, 10
  %747 = add nuw nsw i32 %746, %6
  %748 = zext i32 %747 to i64
  %749 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %748
  %750 = bitcast %struct.HIP_vector_type addrspace(1)* %749 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %750, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %751

751:                                              ; preds = %751, %745
  %752 = phi float [ %742, %745 ], [ %821, %751 ]
  %753 = phi float [ %741, %745 ], [ %820, %751 ]
  %754 = phi float [ %740, %745 ], [ %819, %751 ]
  %755 = phi i32 [ 1, %745 ], [ %822, %751 ]
  %756 = add nsw i32 %755, -1
  %757 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %756, i32 0, i32 0, i32 0, i32 0, i32 0
  %758 = load float, float addrspace(3)* %757, align 4
  %759 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %756, i32 0, i32 0, i32 0, i32 0, i32 1
  %760 = load float, float addrspace(3)* %759, align 4
  %761 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %756, i32 0, i32 0, i32 0, i32 0, i32 2
  %762 = load float, float addrspace(3)* %761, align 4
  %763 = and i32 %755, 255
  %764 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %763, i32 0, i32 0, i32 0, i32 0, i32 0
  %765 = load float, float addrspace(3)* %764, align 4
  %766 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %763, i32 0, i32 0, i32 0, i32 0, i32 1
  %767 = load float, float addrspace(3)* %766, align 4
  %768 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %763, i32 0, i32 0, i32 0, i32 0, i32 2
  %769 = load float, float addrspace(3)* %768, align 4
  %770 = fsub contract float %765, %758
  %771 = fsub contract float %767, %760
  %772 = fsub contract float %769, %762
  %773 = fsub contract float %18, %758
  %774 = fsub contract float %20, %760
  %775 = fsub contract float %22, %762
  %776 = fmul contract float %773, %773
  %777 = fmul contract float %774, %774
  %778 = fadd contract float %776, %777
  %779 = fmul contract float %775, %775
  %780 = fadd contract float %779, %778
  %781 = fdiv contract float 1.000000e+00, %780
  %782 = fcmp olt float %780, 0x39F0000000000000
  %783 = select i1 %782, float 0x41F0000000000000, float 1.000000e+00
  %784 = fmul float %780, %783
  %785 = tail call float @llvm.sqrt.f32(float %784)
  %786 = bitcast float %785 to i32
  %787 = add nsw i32 %786, -1
  %788 = bitcast i32 %787 to float
  %789 = add nsw i32 %786, 1
  %790 = bitcast i32 %789 to float
  %791 = tail call i1 @llvm.amdgcn.class.f32(float %784, i32 608)
  %792 = select i1 %782, float 0x3EF0000000000000, float 1.000000e+00
  %793 = fneg float %790
  %794 = tail call float @llvm.fma.f32(float %793, float %785, float %784)
  %795 = fcmp ogt float %794, 0.000000e+00
  %796 = fneg float %788
  %797 = tail call float @llvm.fma.f32(float %796, float %785, float %784)
  %798 = fcmp ole float %797, 0.000000e+00
  %799 = select i1 %798, float %788, float %785
  %800 = select i1 %795, float %790, float %799
  %801 = fmul float %792, %800
  %802 = select i1 %791, float %784, float %801
  %803 = fdiv contract float 1.000000e+00, %802
  %804 = fmul contract float %773, %803
  %805 = fmul contract float %774, %803
  %806 = fmul contract float %775, %803
  %807 = fmul contract float %771, %806
  %808 = fmul contract float %772, %805
  %809 = fsub contract float %807, %808
  %810 = fmul contract float %781, %809
  %811 = fmul contract float %772, %804
  %812 = fmul contract float %770, %806
  %813 = fsub contract float %811, %812
  %814 = fmul contract float %781, %813
  %815 = fmul contract float %770, %805
  %816 = fmul contract float %771, %804
  %817 = fsub contract float %815, %816
  %818 = fmul contract float %781, %817
  %819 = fadd contract float %754, %810
  %820 = fadd contract float %753, %814
  %821 = fadd contract float %752, %818
  %822 = add nuw nsw i32 %755, 1
  %823 = icmp eq i32 %822, 257
  br i1 %823, label %824, label %751, !llvm.loop !10

824:                                              ; preds = %751
  %825 = mul nuw nsw i32 %11, 11
  %826 = add nuw nsw i32 %825, %6
  %827 = zext i32 %826 to i64
  %828 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %827
  %829 = bitcast %struct.HIP_vector_type addrspace(1)* %828 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %829, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %830

830:                                              ; preds = %830, %824
  %831 = phi float [ %821, %824 ], [ %900, %830 ]
  %832 = phi float [ %820, %824 ], [ %899, %830 ]
  %833 = phi float [ %819, %824 ], [ %898, %830 ]
  %834 = phi i32 [ 1, %824 ], [ %901, %830 ]
  %835 = add nsw i32 %834, -1
  %836 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %835, i32 0, i32 0, i32 0, i32 0, i32 0
  %837 = load float, float addrspace(3)* %836, align 4
  %838 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %835, i32 0, i32 0, i32 0, i32 0, i32 1
  %839 = load float, float addrspace(3)* %838, align 4
  %840 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %835, i32 0, i32 0, i32 0, i32 0, i32 2
  %841 = load float, float addrspace(3)* %840, align 4
  %842 = and i32 %834, 255
  %843 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %842, i32 0, i32 0, i32 0, i32 0, i32 0
  %844 = load float, float addrspace(3)* %843, align 4
  %845 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %842, i32 0, i32 0, i32 0, i32 0, i32 1
  %846 = load float, float addrspace(3)* %845, align 4
  %847 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %842, i32 0, i32 0, i32 0, i32 0, i32 2
  %848 = load float, float addrspace(3)* %847, align 4
  %849 = fsub contract float %844, %837
  %850 = fsub contract float %846, %839
  %851 = fsub contract float %848, %841
  %852 = fsub contract float %18, %837
  %853 = fsub contract float %20, %839
  %854 = fsub contract float %22, %841
  %855 = fmul contract float %852, %852
  %856 = fmul contract float %853, %853
  %857 = fadd contract float %855, %856
  %858 = fmul contract float %854, %854
  %859 = fadd contract float %858, %857
  %860 = fdiv contract float 1.000000e+00, %859
  %861 = fcmp olt float %859, 0x39F0000000000000
  %862 = select i1 %861, float 0x41F0000000000000, float 1.000000e+00
  %863 = fmul float %859, %862
  %864 = tail call float @llvm.sqrt.f32(float %863)
  %865 = bitcast float %864 to i32
  %866 = add nsw i32 %865, -1
  %867 = bitcast i32 %866 to float
  %868 = add nsw i32 %865, 1
  %869 = bitcast i32 %868 to float
  %870 = tail call i1 @llvm.amdgcn.class.f32(float %863, i32 608)
  %871 = select i1 %861, float 0x3EF0000000000000, float 1.000000e+00
  %872 = fneg float %869
  %873 = tail call float @llvm.fma.f32(float %872, float %864, float %863)
  %874 = fcmp ogt float %873, 0.000000e+00
  %875 = fneg float %867
  %876 = tail call float @llvm.fma.f32(float %875, float %864, float %863)
  %877 = fcmp ole float %876, 0.000000e+00
  %878 = select i1 %877, float %867, float %864
  %879 = select i1 %874, float %869, float %878
  %880 = fmul float %871, %879
  %881 = select i1 %870, float %863, float %880
  %882 = fdiv contract float 1.000000e+00, %881
  %883 = fmul contract float %852, %882
  %884 = fmul contract float %853, %882
  %885 = fmul contract float %854, %882
  %886 = fmul contract float %850, %885
  %887 = fmul contract float %851, %884
  %888 = fsub contract float %886, %887
  %889 = fmul contract float %860, %888
  %890 = fmul contract float %851, %883
  %891 = fmul contract float %849, %885
  %892 = fsub contract float %890, %891
  %893 = fmul contract float %860, %892
  %894 = fmul contract float %849, %884
  %895 = fmul contract float %850, %883
  %896 = fsub contract float %894, %895
  %897 = fmul contract float %860, %896
  %898 = fadd contract float %833, %889
  %899 = fadd contract float %832, %893
  %900 = fadd contract float %831, %897
  %901 = add nuw nsw i32 %834, 1
  %902 = icmp eq i32 %901, 257
  br i1 %902, label %903, label %830, !llvm.loop !10

903:                                              ; preds = %830
  %904 = mul nuw nsw i32 %11, 12
  %905 = add nuw nsw i32 %904, %6
  %906 = zext i32 %905 to i64
  %907 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %906
  %908 = bitcast %struct.HIP_vector_type addrspace(1)* %907 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %908, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %909

909:                                              ; preds = %909, %903
  %910 = phi float [ %900, %903 ], [ %979, %909 ]
  %911 = phi float [ %899, %903 ], [ %978, %909 ]
  %912 = phi float [ %898, %903 ], [ %977, %909 ]
  %913 = phi i32 [ 1, %903 ], [ %980, %909 ]
  %914 = add nsw i32 %913, -1
  %915 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %914, i32 0, i32 0, i32 0, i32 0, i32 0
  %916 = load float, float addrspace(3)* %915, align 4
  %917 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %914, i32 0, i32 0, i32 0, i32 0, i32 1
  %918 = load float, float addrspace(3)* %917, align 4
  %919 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %914, i32 0, i32 0, i32 0, i32 0, i32 2
  %920 = load float, float addrspace(3)* %919, align 4
  %921 = and i32 %913, 255
  %922 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %921, i32 0, i32 0, i32 0, i32 0, i32 0
  %923 = load float, float addrspace(3)* %922, align 4
  %924 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %921, i32 0, i32 0, i32 0, i32 0, i32 1
  %925 = load float, float addrspace(3)* %924, align 4
  %926 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %921, i32 0, i32 0, i32 0, i32 0, i32 2
  %927 = load float, float addrspace(3)* %926, align 4
  %928 = fsub contract float %923, %916
  %929 = fsub contract float %925, %918
  %930 = fsub contract float %927, %920
  %931 = fsub contract float %18, %916
  %932 = fsub contract float %20, %918
  %933 = fsub contract float %22, %920
  %934 = fmul contract float %931, %931
  %935 = fmul contract float %932, %932
  %936 = fadd contract float %934, %935
  %937 = fmul contract float %933, %933
  %938 = fadd contract float %937, %936
  %939 = fdiv contract float 1.000000e+00, %938
  %940 = fcmp olt float %938, 0x39F0000000000000
  %941 = select i1 %940, float 0x41F0000000000000, float 1.000000e+00
  %942 = fmul float %938, %941
  %943 = tail call float @llvm.sqrt.f32(float %942)
  %944 = bitcast float %943 to i32
  %945 = add nsw i32 %944, -1
  %946 = bitcast i32 %945 to float
  %947 = add nsw i32 %944, 1
  %948 = bitcast i32 %947 to float
  %949 = tail call i1 @llvm.amdgcn.class.f32(float %942, i32 608)
  %950 = select i1 %940, float 0x3EF0000000000000, float 1.000000e+00
  %951 = fneg float %948
  %952 = tail call float @llvm.fma.f32(float %951, float %943, float %942)
  %953 = fcmp ogt float %952, 0.000000e+00
  %954 = fneg float %946
  %955 = tail call float @llvm.fma.f32(float %954, float %943, float %942)
  %956 = fcmp ole float %955, 0.000000e+00
  %957 = select i1 %956, float %946, float %943
  %958 = select i1 %953, float %948, float %957
  %959 = fmul float %950, %958
  %960 = select i1 %949, float %942, float %959
  %961 = fdiv contract float 1.000000e+00, %960
  %962 = fmul contract float %931, %961
  %963 = fmul contract float %932, %961
  %964 = fmul contract float %933, %961
  %965 = fmul contract float %929, %964
  %966 = fmul contract float %930, %963
  %967 = fsub contract float %965, %966
  %968 = fmul contract float %939, %967
  %969 = fmul contract float %930, %962
  %970 = fmul contract float %928, %964
  %971 = fsub contract float %969, %970
  %972 = fmul contract float %939, %971
  %973 = fmul contract float %928, %963
  %974 = fmul contract float %929, %962
  %975 = fsub contract float %973, %974
  %976 = fmul contract float %939, %975
  %977 = fadd contract float %912, %968
  %978 = fadd contract float %911, %972
  %979 = fadd contract float %910, %976
  %980 = add nuw nsw i32 %913, 1
  %981 = icmp eq i32 %980, 257
  br i1 %981, label %982, label %909, !llvm.loop !10

982:                                              ; preds = %909
  %983 = mul nuw nsw i32 %11, 13
  %984 = add nuw nsw i32 %983, %6
  %985 = zext i32 %984 to i64
  %986 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %985
  %987 = bitcast %struct.HIP_vector_type addrspace(1)* %986 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %987, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %988

988:                                              ; preds = %988, %982
  %989 = phi float [ %979, %982 ], [ %1058, %988 ]
  %990 = phi float [ %978, %982 ], [ %1057, %988 ]
  %991 = phi float [ %977, %982 ], [ %1056, %988 ]
  %992 = phi i32 [ 1, %982 ], [ %1059, %988 ]
  %993 = add nsw i32 %992, -1
  %994 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %993, i32 0, i32 0, i32 0, i32 0, i32 0
  %995 = load float, float addrspace(3)* %994, align 4
  %996 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %993, i32 0, i32 0, i32 0, i32 0, i32 1
  %997 = load float, float addrspace(3)* %996, align 4
  %998 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %993, i32 0, i32 0, i32 0, i32 0, i32 2
  %999 = load float, float addrspace(3)* %998, align 4
  %1000 = and i32 %992, 255
  %1001 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1000, i32 0, i32 0, i32 0, i32 0, i32 0
  %1002 = load float, float addrspace(3)* %1001, align 4
  %1003 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1000, i32 0, i32 0, i32 0, i32 0, i32 1
  %1004 = load float, float addrspace(3)* %1003, align 4
  %1005 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1000, i32 0, i32 0, i32 0, i32 0, i32 2
  %1006 = load float, float addrspace(3)* %1005, align 4
  %1007 = fsub contract float %1002, %995
  %1008 = fsub contract float %1004, %997
  %1009 = fsub contract float %1006, %999
  %1010 = fsub contract float %18, %995
  %1011 = fsub contract float %20, %997
  %1012 = fsub contract float %22, %999
  %1013 = fmul contract float %1010, %1010
  %1014 = fmul contract float %1011, %1011
  %1015 = fadd contract float %1013, %1014
  %1016 = fmul contract float %1012, %1012
  %1017 = fadd contract float %1016, %1015
  %1018 = fdiv contract float 1.000000e+00, %1017
  %1019 = fcmp olt float %1017, 0x39F0000000000000
  %1020 = select i1 %1019, float 0x41F0000000000000, float 1.000000e+00
  %1021 = fmul float %1017, %1020
  %1022 = tail call float @llvm.sqrt.f32(float %1021)
  %1023 = bitcast float %1022 to i32
  %1024 = add nsw i32 %1023, -1
  %1025 = bitcast i32 %1024 to float
  %1026 = add nsw i32 %1023, 1
  %1027 = bitcast i32 %1026 to float
  %1028 = tail call i1 @llvm.amdgcn.class.f32(float %1021, i32 608)
  %1029 = select i1 %1019, float 0x3EF0000000000000, float 1.000000e+00
  %1030 = fneg float %1027
  %1031 = tail call float @llvm.fma.f32(float %1030, float %1022, float %1021)
  %1032 = fcmp ogt float %1031, 0.000000e+00
  %1033 = fneg float %1025
  %1034 = tail call float @llvm.fma.f32(float %1033, float %1022, float %1021)
  %1035 = fcmp ole float %1034, 0.000000e+00
  %1036 = select i1 %1035, float %1025, float %1022
  %1037 = select i1 %1032, float %1027, float %1036
  %1038 = fmul float %1029, %1037
  %1039 = select i1 %1028, float %1021, float %1038
  %1040 = fdiv contract float 1.000000e+00, %1039
  %1041 = fmul contract float %1010, %1040
  %1042 = fmul contract float %1011, %1040
  %1043 = fmul contract float %1012, %1040
  %1044 = fmul contract float %1008, %1043
  %1045 = fmul contract float %1009, %1042
  %1046 = fsub contract float %1044, %1045
  %1047 = fmul contract float %1018, %1046
  %1048 = fmul contract float %1009, %1041
  %1049 = fmul contract float %1007, %1043
  %1050 = fsub contract float %1048, %1049
  %1051 = fmul contract float %1018, %1050
  %1052 = fmul contract float %1007, %1042
  %1053 = fmul contract float %1008, %1041
  %1054 = fsub contract float %1052, %1053
  %1055 = fmul contract float %1018, %1054
  %1056 = fadd contract float %991, %1047
  %1057 = fadd contract float %990, %1051
  %1058 = fadd contract float %989, %1055
  %1059 = add nuw nsw i32 %992, 1
  %1060 = icmp eq i32 %1059, 257
  br i1 %1060, label %1061, label %988, !llvm.loop !10

1061:                                             ; preds = %988
  %1062 = mul nuw nsw i32 %11, 14
  %1063 = add nuw nsw i32 %1062, %6
  %1064 = zext i32 %1063 to i64
  %1065 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1064
  %1066 = bitcast %struct.HIP_vector_type addrspace(1)* %1065 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1066, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1067

1067:                                             ; preds = %1067, %1061
  %1068 = phi float [ %1058, %1061 ], [ %1137, %1067 ]
  %1069 = phi float [ %1057, %1061 ], [ %1136, %1067 ]
  %1070 = phi float [ %1056, %1061 ], [ %1135, %1067 ]
  %1071 = phi i32 [ 1, %1061 ], [ %1138, %1067 ]
  %1072 = add nsw i32 %1071, -1
  %1073 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1072, i32 0, i32 0, i32 0, i32 0, i32 0
  %1074 = load float, float addrspace(3)* %1073, align 4
  %1075 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1072, i32 0, i32 0, i32 0, i32 0, i32 1
  %1076 = load float, float addrspace(3)* %1075, align 4
  %1077 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1072, i32 0, i32 0, i32 0, i32 0, i32 2
  %1078 = load float, float addrspace(3)* %1077, align 4
  %1079 = and i32 %1071, 255
  %1080 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1079, i32 0, i32 0, i32 0, i32 0, i32 0
  %1081 = load float, float addrspace(3)* %1080, align 4
  %1082 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1079, i32 0, i32 0, i32 0, i32 0, i32 1
  %1083 = load float, float addrspace(3)* %1082, align 4
  %1084 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1079, i32 0, i32 0, i32 0, i32 0, i32 2
  %1085 = load float, float addrspace(3)* %1084, align 4
  %1086 = fsub contract float %1081, %1074
  %1087 = fsub contract float %1083, %1076
  %1088 = fsub contract float %1085, %1078
  %1089 = fsub contract float %18, %1074
  %1090 = fsub contract float %20, %1076
  %1091 = fsub contract float %22, %1078
  %1092 = fmul contract float %1089, %1089
  %1093 = fmul contract float %1090, %1090
  %1094 = fadd contract float %1092, %1093
  %1095 = fmul contract float %1091, %1091
  %1096 = fadd contract float %1095, %1094
  %1097 = fdiv contract float 1.000000e+00, %1096
  %1098 = fcmp olt float %1096, 0x39F0000000000000
  %1099 = select i1 %1098, float 0x41F0000000000000, float 1.000000e+00
  %1100 = fmul float %1096, %1099
  %1101 = tail call float @llvm.sqrt.f32(float %1100)
  %1102 = bitcast float %1101 to i32
  %1103 = add nsw i32 %1102, -1
  %1104 = bitcast i32 %1103 to float
  %1105 = add nsw i32 %1102, 1
  %1106 = bitcast i32 %1105 to float
  %1107 = tail call i1 @llvm.amdgcn.class.f32(float %1100, i32 608)
  %1108 = select i1 %1098, float 0x3EF0000000000000, float 1.000000e+00
  %1109 = fneg float %1106
  %1110 = tail call float @llvm.fma.f32(float %1109, float %1101, float %1100)
  %1111 = fcmp ogt float %1110, 0.000000e+00
  %1112 = fneg float %1104
  %1113 = tail call float @llvm.fma.f32(float %1112, float %1101, float %1100)
  %1114 = fcmp ole float %1113, 0.000000e+00
  %1115 = select i1 %1114, float %1104, float %1101
  %1116 = select i1 %1111, float %1106, float %1115
  %1117 = fmul float %1108, %1116
  %1118 = select i1 %1107, float %1100, float %1117
  %1119 = fdiv contract float 1.000000e+00, %1118
  %1120 = fmul contract float %1089, %1119
  %1121 = fmul contract float %1090, %1119
  %1122 = fmul contract float %1091, %1119
  %1123 = fmul contract float %1087, %1122
  %1124 = fmul contract float %1088, %1121
  %1125 = fsub contract float %1123, %1124
  %1126 = fmul contract float %1097, %1125
  %1127 = fmul contract float %1088, %1120
  %1128 = fmul contract float %1086, %1122
  %1129 = fsub contract float %1127, %1128
  %1130 = fmul contract float %1097, %1129
  %1131 = fmul contract float %1086, %1121
  %1132 = fmul contract float %1087, %1120
  %1133 = fsub contract float %1131, %1132
  %1134 = fmul contract float %1097, %1133
  %1135 = fadd contract float %1070, %1126
  %1136 = fadd contract float %1069, %1130
  %1137 = fadd contract float %1068, %1134
  %1138 = add nuw nsw i32 %1071, 1
  %1139 = icmp eq i32 %1138, 257
  br i1 %1139, label %1140, label %1067, !llvm.loop !10

1140:                                             ; preds = %1067
  %1141 = mul nuw nsw i32 %11, 15
  %1142 = add nuw nsw i32 %1141, %6
  %1143 = zext i32 %1142 to i64
  %1144 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1143
  %1145 = bitcast %struct.HIP_vector_type addrspace(1)* %1144 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1145, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1146

1146:                                             ; preds = %1146, %1140
  %1147 = phi float [ %1137, %1140 ], [ %1216, %1146 ]
  %1148 = phi float [ %1136, %1140 ], [ %1215, %1146 ]
  %1149 = phi float [ %1135, %1140 ], [ %1214, %1146 ]
  %1150 = phi i32 [ 1, %1140 ], [ %1217, %1146 ]
  %1151 = add nsw i32 %1150, -1
  %1152 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1151, i32 0, i32 0, i32 0, i32 0, i32 0
  %1153 = load float, float addrspace(3)* %1152, align 4
  %1154 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1151, i32 0, i32 0, i32 0, i32 0, i32 1
  %1155 = load float, float addrspace(3)* %1154, align 4
  %1156 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1151, i32 0, i32 0, i32 0, i32 0, i32 2
  %1157 = load float, float addrspace(3)* %1156, align 4
  %1158 = and i32 %1150, 255
  %1159 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1158, i32 0, i32 0, i32 0, i32 0, i32 0
  %1160 = load float, float addrspace(3)* %1159, align 4
  %1161 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1158, i32 0, i32 0, i32 0, i32 0, i32 1
  %1162 = load float, float addrspace(3)* %1161, align 4
  %1163 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1158, i32 0, i32 0, i32 0, i32 0, i32 2
  %1164 = load float, float addrspace(3)* %1163, align 4
  %1165 = fsub contract float %1160, %1153
  %1166 = fsub contract float %1162, %1155
  %1167 = fsub contract float %1164, %1157
  %1168 = fsub contract float %18, %1153
  %1169 = fsub contract float %20, %1155
  %1170 = fsub contract float %22, %1157
  %1171 = fmul contract float %1168, %1168
  %1172 = fmul contract float %1169, %1169
  %1173 = fadd contract float %1171, %1172
  %1174 = fmul contract float %1170, %1170
  %1175 = fadd contract float %1174, %1173
  %1176 = fdiv contract float 1.000000e+00, %1175
  %1177 = fcmp olt float %1175, 0x39F0000000000000
  %1178 = select i1 %1177, float 0x41F0000000000000, float 1.000000e+00
  %1179 = fmul float %1175, %1178
  %1180 = tail call float @llvm.sqrt.f32(float %1179)
  %1181 = bitcast float %1180 to i32
  %1182 = add nsw i32 %1181, -1
  %1183 = bitcast i32 %1182 to float
  %1184 = add nsw i32 %1181, 1
  %1185 = bitcast i32 %1184 to float
  %1186 = tail call i1 @llvm.amdgcn.class.f32(float %1179, i32 608)
  %1187 = select i1 %1177, float 0x3EF0000000000000, float 1.000000e+00
  %1188 = fneg float %1185
  %1189 = tail call float @llvm.fma.f32(float %1188, float %1180, float %1179)
  %1190 = fcmp ogt float %1189, 0.000000e+00
  %1191 = fneg float %1183
  %1192 = tail call float @llvm.fma.f32(float %1191, float %1180, float %1179)
  %1193 = fcmp ole float %1192, 0.000000e+00
  %1194 = select i1 %1193, float %1183, float %1180
  %1195 = select i1 %1190, float %1185, float %1194
  %1196 = fmul float %1187, %1195
  %1197 = select i1 %1186, float %1179, float %1196
  %1198 = fdiv contract float 1.000000e+00, %1197
  %1199 = fmul contract float %1168, %1198
  %1200 = fmul contract float %1169, %1198
  %1201 = fmul contract float %1170, %1198
  %1202 = fmul contract float %1166, %1201
  %1203 = fmul contract float %1167, %1200
  %1204 = fsub contract float %1202, %1203
  %1205 = fmul contract float %1176, %1204
  %1206 = fmul contract float %1167, %1199
  %1207 = fmul contract float %1165, %1201
  %1208 = fsub contract float %1206, %1207
  %1209 = fmul contract float %1176, %1208
  %1210 = fmul contract float %1165, %1200
  %1211 = fmul contract float %1166, %1199
  %1212 = fsub contract float %1210, %1211
  %1213 = fmul contract float %1176, %1212
  %1214 = fadd contract float %1149, %1205
  %1215 = fadd contract float %1148, %1209
  %1216 = fadd contract float %1147, %1213
  %1217 = add nuw nsw i32 %1150, 1
  %1218 = icmp eq i32 %1217, 257
  br i1 %1218, label %1219, label %1146, !llvm.loop !10

1219:                                             ; preds = %1146
  %1220 = shl nuw nsw i32 %11, 4
  %1221 = add nuw nsw i32 %1220, %6
  %1222 = zext i32 %1221 to i64
  %1223 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1222
  %1224 = bitcast %struct.HIP_vector_type addrspace(1)* %1223 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1224, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1225

1225:                                             ; preds = %1225, %1219
  %1226 = phi float [ %1216, %1219 ], [ %1295, %1225 ]
  %1227 = phi float [ %1215, %1219 ], [ %1294, %1225 ]
  %1228 = phi float [ %1214, %1219 ], [ %1293, %1225 ]
  %1229 = phi i32 [ 1, %1219 ], [ %1296, %1225 ]
  %1230 = add nsw i32 %1229, -1
  %1231 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1230, i32 0, i32 0, i32 0, i32 0, i32 0
  %1232 = load float, float addrspace(3)* %1231, align 4
  %1233 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1230, i32 0, i32 0, i32 0, i32 0, i32 1
  %1234 = load float, float addrspace(3)* %1233, align 4
  %1235 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1230, i32 0, i32 0, i32 0, i32 0, i32 2
  %1236 = load float, float addrspace(3)* %1235, align 4
  %1237 = and i32 %1229, 255
  %1238 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1237, i32 0, i32 0, i32 0, i32 0, i32 0
  %1239 = load float, float addrspace(3)* %1238, align 4
  %1240 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1237, i32 0, i32 0, i32 0, i32 0, i32 1
  %1241 = load float, float addrspace(3)* %1240, align 4
  %1242 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1237, i32 0, i32 0, i32 0, i32 0, i32 2
  %1243 = load float, float addrspace(3)* %1242, align 4
  %1244 = fsub contract float %1239, %1232
  %1245 = fsub contract float %1241, %1234
  %1246 = fsub contract float %1243, %1236
  %1247 = fsub contract float %18, %1232
  %1248 = fsub contract float %20, %1234
  %1249 = fsub contract float %22, %1236
  %1250 = fmul contract float %1247, %1247
  %1251 = fmul contract float %1248, %1248
  %1252 = fadd contract float %1250, %1251
  %1253 = fmul contract float %1249, %1249
  %1254 = fadd contract float %1253, %1252
  %1255 = fdiv contract float 1.000000e+00, %1254
  %1256 = fcmp olt float %1254, 0x39F0000000000000
  %1257 = select i1 %1256, float 0x41F0000000000000, float 1.000000e+00
  %1258 = fmul float %1254, %1257
  %1259 = tail call float @llvm.sqrt.f32(float %1258)
  %1260 = bitcast float %1259 to i32
  %1261 = add nsw i32 %1260, -1
  %1262 = bitcast i32 %1261 to float
  %1263 = add nsw i32 %1260, 1
  %1264 = bitcast i32 %1263 to float
  %1265 = tail call i1 @llvm.amdgcn.class.f32(float %1258, i32 608)
  %1266 = select i1 %1256, float 0x3EF0000000000000, float 1.000000e+00
  %1267 = fneg float %1264
  %1268 = tail call float @llvm.fma.f32(float %1267, float %1259, float %1258)
  %1269 = fcmp ogt float %1268, 0.000000e+00
  %1270 = fneg float %1262
  %1271 = tail call float @llvm.fma.f32(float %1270, float %1259, float %1258)
  %1272 = fcmp ole float %1271, 0.000000e+00
  %1273 = select i1 %1272, float %1262, float %1259
  %1274 = select i1 %1269, float %1264, float %1273
  %1275 = fmul float %1266, %1274
  %1276 = select i1 %1265, float %1258, float %1275
  %1277 = fdiv contract float 1.000000e+00, %1276
  %1278 = fmul contract float %1247, %1277
  %1279 = fmul contract float %1248, %1277
  %1280 = fmul contract float %1249, %1277
  %1281 = fmul contract float %1245, %1280
  %1282 = fmul contract float %1246, %1279
  %1283 = fsub contract float %1281, %1282
  %1284 = fmul contract float %1255, %1283
  %1285 = fmul contract float %1246, %1278
  %1286 = fmul contract float %1244, %1280
  %1287 = fsub contract float %1285, %1286
  %1288 = fmul contract float %1255, %1287
  %1289 = fmul contract float %1244, %1279
  %1290 = fmul contract float %1245, %1278
  %1291 = fsub contract float %1289, %1290
  %1292 = fmul contract float %1255, %1291
  %1293 = fadd contract float %1228, %1284
  %1294 = fadd contract float %1227, %1288
  %1295 = fadd contract float %1226, %1292
  %1296 = add nuw nsw i32 %1229, 1
  %1297 = icmp eq i32 %1296, 257
  br i1 %1297, label %1298, label %1225, !llvm.loop !10

1298:                                             ; preds = %1225
  %1299 = mul nuw nsw i32 %11, 17
  %1300 = add nuw nsw i32 %1299, %6
  %1301 = zext i32 %1300 to i64
  %1302 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1301
  %1303 = bitcast %struct.HIP_vector_type addrspace(1)* %1302 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1303, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1304

1304:                                             ; preds = %1304, %1298
  %1305 = phi float [ %1295, %1298 ], [ %1374, %1304 ]
  %1306 = phi float [ %1294, %1298 ], [ %1373, %1304 ]
  %1307 = phi float [ %1293, %1298 ], [ %1372, %1304 ]
  %1308 = phi i32 [ 1, %1298 ], [ %1375, %1304 ]
  %1309 = add nsw i32 %1308, -1
  %1310 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1309, i32 0, i32 0, i32 0, i32 0, i32 0
  %1311 = load float, float addrspace(3)* %1310, align 4
  %1312 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1309, i32 0, i32 0, i32 0, i32 0, i32 1
  %1313 = load float, float addrspace(3)* %1312, align 4
  %1314 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1309, i32 0, i32 0, i32 0, i32 0, i32 2
  %1315 = load float, float addrspace(3)* %1314, align 4
  %1316 = and i32 %1308, 255
  %1317 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1316, i32 0, i32 0, i32 0, i32 0, i32 0
  %1318 = load float, float addrspace(3)* %1317, align 4
  %1319 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1316, i32 0, i32 0, i32 0, i32 0, i32 1
  %1320 = load float, float addrspace(3)* %1319, align 4
  %1321 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1316, i32 0, i32 0, i32 0, i32 0, i32 2
  %1322 = load float, float addrspace(3)* %1321, align 4
  %1323 = fsub contract float %1318, %1311
  %1324 = fsub contract float %1320, %1313
  %1325 = fsub contract float %1322, %1315
  %1326 = fsub contract float %18, %1311
  %1327 = fsub contract float %20, %1313
  %1328 = fsub contract float %22, %1315
  %1329 = fmul contract float %1326, %1326
  %1330 = fmul contract float %1327, %1327
  %1331 = fadd contract float %1329, %1330
  %1332 = fmul contract float %1328, %1328
  %1333 = fadd contract float %1332, %1331
  %1334 = fdiv contract float 1.000000e+00, %1333
  %1335 = fcmp olt float %1333, 0x39F0000000000000
  %1336 = select i1 %1335, float 0x41F0000000000000, float 1.000000e+00
  %1337 = fmul float %1333, %1336
  %1338 = tail call float @llvm.sqrt.f32(float %1337)
  %1339 = bitcast float %1338 to i32
  %1340 = add nsw i32 %1339, -1
  %1341 = bitcast i32 %1340 to float
  %1342 = add nsw i32 %1339, 1
  %1343 = bitcast i32 %1342 to float
  %1344 = tail call i1 @llvm.amdgcn.class.f32(float %1337, i32 608)
  %1345 = select i1 %1335, float 0x3EF0000000000000, float 1.000000e+00
  %1346 = fneg float %1343
  %1347 = tail call float @llvm.fma.f32(float %1346, float %1338, float %1337)
  %1348 = fcmp ogt float %1347, 0.000000e+00
  %1349 = fneg float %1341
  %1350 = tail call float @llvm.fma.f32(float %1349, float %1338, float %1337)
  %1351 = fcmp ole float %1350, 0.000000e+00
  %1352 = select i1 %1351, float %1341, float %1338
  %1353 = select i1 %1348, float %1343, float %1352
  %1354 = fmul float %1345, %1353
  %1355 = select i1 %1344, float %1337, float %1354
  %1356 = fdiv contract float 1.000000e+00, %1355
  %1357 = fmul contract float %1326, %1356
  %1358 = fmul contract float %1327, %1356
  %1359 = fmul contract float %1328, %1356
  %1360 = fmul contract float %1324, %1359
  %1361 = fmul contract float %1325, %1358
  %1362 = fsub contract float %1360, %1361
  %1363 = fmul contract float %1334, %1362
  %1364 = fmul contract float %1325, %1357
  %1365 = fmul contract float %1323, %1359
  %1366 = fsub contract float %1364, %1365
  %1367 = fmul contract float %1334, %1366
  %1368 = fmul contract float %1323, %1358
  %1369 = fmul contract float %1324, %1357
  %1370 = fsub contract float %1368, %1369
  %1371 = fmul contract float %1334, %1370
  %1372 = fadd contract float %1307, %1363
  %1373 = fadd contract float %1306, %1367
  %1374 = fadd contract float %1305, %1371
  %1375 = add nuw nsw i32 %1308, 1
  %1376 = icmp eq i32 %1375, 257
  br i1 %1376, label %1377, label %1304, !llvm.loop !10

1377:                                             ; preds = %1304
  %1378 = mul nuw nsw i32 %11, 18
  %1379 = add nuw nsw i32 %1378, %6
  %1380 = zext i32 %1379 to i64
  %1381 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1380
  %1382 = bitcast %struct.HIP_vector_type addrspace(1)* %1381 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1382, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1383

1383:                                             ; preds = %1383, %1377
  %1384 = phi float [ %1374, %1377 ], [ %1453, %1383 ]
  %1385 = phi float [ %1373, %1377 ], [ %1452, %1383 ]
  %1386 = phi float [ %1372, %1377 ], [ %1451, %1383 ]
  %1387 = phi i32 [ 1, %1377 ], [ %1454, %1383 ]
  %1388 = add nsw i32 %1387, -1
  %1389 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1388, i32 0, i32 0, i32 0, i32 0, i32 0
  %1390 = load float, float addrspace(3)* %1389, align 4
  %1391 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1388, i32 0, i32 0, i32 0, i32 0, i32 1
  %1392 = load float, float addrspace(3)* %1391, align 4
  %1393 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1388, i32 0, i32 0, i32 0, i32 0, i32 2
  %1394 = load float, float addrspace(3)* %1393, align 4
  %1395 = and i32 %1387, 255
  %1396 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1395, i32 0, i32 0, i32 0, i32 0, i32 0
  %1397 = load float, float addrspace(3)* %1396, align 4
  %1398 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1395, i32 0, i32 0, i32 0, i32 0, i32 1
  %1399 = load float, float addrspace(3)* %1398, align 4
  %1400 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1395, i32 0, i32 0, i32 0, i32 0, i32 2
  %1401 = load float, float addrspace(3)* %1400, align 4
  %1402 = fsub contract float %1397, %1390
  %1403 = fsub contract float %1399, %1392
  %1404 = fsub contract float %1401, %1394
  %1405 = fsub contract float %18, %1390
  %1406 = fsub contract float %20, %1392
  %1407 = fsub contract float %22, %1394
  %1408 = fmul contract float %1405, %1405
  %1409 = fmul contract float %1406, %1406
  %1410 = fadd contract float %1408, %1409
  %1411 = fmul contract float %1407, %1407
  %1412 = fadd contract float %1411, %1410
  %1413 = fdiv contract float 1.000000e+00, %1412
  %1414 = fcmp olt float %1412, 0x39F0000000000000
  %1415 = select i1 %1414, float 0x41F0000000000000, float 1.000000e+00
  %1416 = fmul float %1412, %1415
  %1417 = tail call float @llvm.sqrt.f32(float %1416)
  %1418 = bitcast float %1417 to i32
  %1419 = add nsw i32 %1418, -1
  %1420 = bitcast i32 %1419 to float
  %1421 = add nsw i32 %1418, 1
  %1422 = bitcast i32 %1421 to float
  %1423 = tail call i1 @llvm.amdgcn.class.f32(float %1416, i32 608)
  %1424 = select i1 %1414, float 0x3EF0000000000000, float 1.000000e+00
  %1425 = fneg float %1422
  %1426 = tail call float @llvm.fma.f32(float %1425, float %1417, float %1416)
  %1427 = fcmp ogt float %1426, 0.000000e+00
  %1428 = fneg float %1420
  %1429 = tail call float @llvm.fma.f32(float %1428, float %1417, float %1416)
  %1430 = fcmp ole float %1429, 0.000000e+00
  %1431 = select i1 %1430, float %1420, float %1417
  %1432 = select i1 %1427, float %1422, float %1431
  %1433 = fmul float %1424, %1432
  %1434 = select i1 %1423, float %1416, float %1433
  %1435 = fdiv contract float 1.000000e+00, %1434
  %1436 = fmul contract float %1405, %1435
  %1437 = fmul contract float %1406, %1435
  %1438 = fmul contract float %1407, %1435
  %1439 = fmul contract float %1403, %1438
  %1440 = fmul contract float %1404, %1437
  %1441 = fsub contract float %1439, %1440
  %1442 = fmul contract float %1413, %1441
  %1443 = fmul contract float %1404, %1436
  %1444 = fmul contract float %1402, %1438
  %1445 = fsub contract float %1443, %1444
  %1446 = fmul contract float %1413, %1445
  %1447 = fmul contract float %1402, %1437
  %1448 = fmul contract float %1403, %1436
  %1449 = fsub contract float %1447, %1448
  %1450 = fmul contract float %1413, %1449
  %1451 = fadd contract float %1386, %1442
  %1452 = fadd contract float %1385, %1446
  %1453 = fadd contract float %1384, %1450
  %1454 = add nuw nsw i32 %1387, 1
  %1455 = icmp eq i32 %1454, 257
  br i1 %1455, label %1456, label %1383, !llvm.loop !10

1456:                                             ; preds = %1383
  %1457 = mul nuw nsw i32 %11, 19
  %1458 = add nuw nsw i32 %1457, %6
  %1459 = zext i32 %1458 to i64
  %1460 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1459
  %1461 = bitcast %struct.HIP_vector_type addrspace(1)* %1460 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1461, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1462

1462:                                             ; preds = %1462, %1456
  %1463 = phi float [ %1453, %1456 ], [ %1532, %1462 ]
  %1464 = phi float [ %1452, %1456 ], [ %1531, %1462 ]
  %1465 = phi float [ %1451, %1456 ], [ %1530, %1462 ]
  %1466 = phi i32 [ 1, %1456 ], [ %1533, %1462 ]
  %1467 = add nsw i32 %1466, -1
  %1468 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1467, i32 0, i32 0, i32 0, i32 0, i32 0
  %1469 = load float, float addrspace(3)* %1468, align 4
  %1470 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1467, i32 0, i32 0, i32 0, i32 0, i32 1
  %1471 = load float, float addrspace(3)* %1470, align 4
  %1472 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1467, i32 0, i32 0, i32 0, i32 0, i32 2
  %1473 = load float, float addrspace(3)* %1472, align 4
  %1474 = and i32 %1466, 255
  %1475 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1474, i32 0, i32 0, i32 0, i32 0, i32 0
  %1476 = load float, float addrspace(3)* %1475, align 4
  %1477 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1474, i32 0, i32 0, i32 0, i32 0, i32 1
  %1478 = load float, float addrspace(3)* %1477, align 4
  %1479 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1474, i32 0, i32 0, i32 0, i32 0, i32 2
  %1480 = load float, float addrspace(3)* %1479, align 4
  %1481 = fsub contract float %1476, %1469
  %1482 = fsub contract float %1478, %1471
  %1483 = fsub contract float %1480, %1473
  %1484 = fsub contract float %18, %1469
  %1485 = fsub contract float %20, %1471
  %1486 = fsub contract float %22, %1473
  %1487 = fmul contract float %1484, %1484
  %1488 = fmul contract float %1485, %1485
  %1489 = fadd contract float %1487, %1488
  %1490 = fmul contract float %1486, %1486
  %1491 = fadd contract float %1490, %1489
  %1492 = fdiv contract float 1.000000e+00, %1491
  %1493 = fcmp olt float %1491, 0x39F0000000000000
  %1494 = select i1 %1493, float 0x41F0000000000000, float 1.000000e+00
  %1495 = fmul float %1491, %1494
  %1496 = tail call float @llvm.sqrt.f32(float %1495)
  %1497 = bitcast float %1496 to i32
  %1498 = add nsw i32 %1497, -1
  %1499 = bitcast i32 %1498 to float
  %1500 = add nsw i32 %1497, 1
  %1501 = bitcast i32 %1500 to float
  %1502 = tail call i1 @llvm.amdgcn.class.f32(float %1495, i32 608)
  %1503 = select i1 %1493, float 0x3EF0000000000000, float 1.000000e+00
  %1504 = fneg float %1501
  %1505 = tail call float @llvm.fma.f32(float %1504, float %1496, float %1495)
  %1506 = fcmp ogt float %1505, 0.000000e+00
  %1507 = fneg float %1499
  %1508 = tail call float @llvm.fma.f32(float %1507, float %1496, float %1495)
  %1509 = fcmp ole float %1508, 0.000000e+00
  %1510 = select i1 %1509, float %1499, float %1496
  %1511 = select i1 %1506, float %1501, float %1510
  %1512 = fmul float %1503, %1511
  %1513 = select i1 %1502, float %1495, float %1512
  %1514 = fdiv contract float 1.000000e+00, %1513
  %1515 = fmul contract float %1484, %1514
  %1516 = fmul contract float %1485, %1514
  %1517 = fmul contract float %1486, %1514
  %1518 = fmul contract float %1482, %1517
  %1519 = fmul contract float %1483, %1516
  %1520 = fsub contract float %1518, %1519
  %1521 = fmul contract float %1492, %1520
  %1522 = fmul contract float %1483, %1515
  %1523 = fmul contract float %1481, %1517
  %1524 = fsub contract float %1522, %1523
  %1525 = fmul contract float %1492, %1524
  %1526 = fmul contract float %1481, %1516
  %1527 = fmul contract float %1482, %1515
  %1528 = fsub contract float %1526, %1527
  %1529 = fmul contract float %1492, %1528
  %1530 = fadd contract float %1465, %1521
  %1531 = fadd contract float %1464, %1525
  %1532 = fadd contract float %1463, %1529
  %1533 = add nuw nsw i32 %1466, 1
  %1534 = icmp eq i32 %1533, 257
  br i1 %1534, label %1535, label %1462, !llvm.loop !10

1535:                                             ; preds = %1462
  %1536 = mul nuw nsw i32 %11, 20
  %1537 = add nuw nsw i32 %1536, %6
  %1538 = zext i32 %1537 to i64
  %1539 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1538
  %1540 = bitcast %struct.HIP_vector_type addrspace(1)* %1539 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1540, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1541

1541:                                             ; preds = %1541, %1535
  %1542 = phi float [ %1532, %1535 ], [ %1611, %1541 ]
  %1543 = phi float [ %1531, %1535 ], [ %1610, %1541 ]
  %1544 = phi float [ %1530, %1535 ], [ %1609, %1541 ]
  %1545 = phi i32 [ 1, %1535 ], [ %1612, %1541 ]
  %1546 = add nsw i32 %1545, -1
  %1547 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1546, i32 0, i32 0, i32 0, i32 0, i32 0
  %1548 = load float, float addrspace(3)* %1547, align 4
  %1549 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1546, i32 0, i32 0, i32 0, i32 0, i32 1
  %1550 = load float, float addrspace(3)* %1549, align 4
  %1551 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1546, i32 0, i32 0, i32 0, i32 0, i32 2
  %1552 = load float, float addrspace(3)* %1551, align 4
  %1553 = and i32 %1545, 255
  %1554 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1553, i32 0, i32 0, i32 0, i32 0, i32 0
  %1555 = load float, float addrspace(3)* %1554, align 4
  %1556 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1553, i32 0, i32 0, i32 0, i32 0, i32 1
  %1557 = load float, float addrspace(3)* %1556, align 4
  %1558 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1553, i32 0, i32 0, i32 0, i32 0, i32 2
  %1559 = load float, float addrspace(3)* %1558, align 4
  %1560 = fsub contract float %1555, %1548
  %1561 = fsub contract float %1557, %1550
  %1562 = fsub contract float %1559, %1552
  %1563 = fsub contract float %18, %1548
  %1564 = fsub contract float %20, %1550
  %1565 = fsub contract float %22, %1552
  %1566 = fmul contract float %1563, %1563
  %1567 = fmul contract float %1564, %1564
  %1568 = fadd contract float %1566, %1567
  %1569 = fmul contract float %1565, %1565
  %1570 = fadd contract float %1569, %1568
  %1571 = fdiv contract float 1.000000e+00, %1570
  %1572 = fcmp olt float %1570, 0x39F0000000000000
  %1573 = select i1 %1572, float 0x41F0000000000000, float 1.000000e+00
  %1574 = fmul float %1570, %1573
  %1575 = tail call float @llvm.sqrt.f32(float %1574)
  %1576 = bitcast float %1575 to i32
  %1577 = add nsw i32 %1576, -1
  %1578 = bitcast i32 %1577 to float
  %1579 = add nsw i32 %1576, 1
  %1580 = bitcast i32 %1579 to float
  %1581 = tail call i1 @llvm.amdgcn.class.f32(float %1574, i32 608)
  %1582 = select i1 %1572, float 0x3EF0000000000000, float 1.000000e+00
  %1583 = fneg float %1580
  %1584 = tail call float @llvm.fma.f32(float %1583, float %1575, float %1574)
  %1585 = fcmp ogt float %1584, 0.000000e+00
  %1586 = fneg float %1578
  %1587 = tail call float @llvm.fma.f32(float %1586, float %1575, float %1574)
  %1588 = fcmp ole float %1587, 0.000000e+00
  %1589 = select i1 %1588, float %1578, float %1575
  %1590 = select i1 %1585, float %1580, float %1589
  %1591 = fmul float %1582, %1590
  %1592 = select i1 %1581, float %1574, float %1591
  %1593 = fdiv contract float 1.000000e+00, %1592
  %1594 = fmul contract float %1563, %1593
  %1595 = fmul contract float %1564, %1593
  %1596 = fmul contract float %1565, %1593
  %1597 = fmul contract float %1561, %1596
  %1598 = fmul contract float %1562, %1595
  %1599 = fsub contract float %1597, %1598
  %1600 = fmul contract float %1571, %1599
  %1601 = fmul contract float %1562, %1594
  %1602 = fmul contract float %1560, %1596
  %1603 = fsub contract float %1601, %1602
  %1604 = fmul contract float %1571, %1603
  %1605 = fmul contract float %1560, %1595
  %1606 = fmul contract float %1561, %1594
  %1607 = fsub contract float %1605, %1606
  %1608 = fmul contract float %1571, %1607
  %1609 = fadd contract float %1544, %1600
  %1610 = fadd contract float %1543, %1604
  %1611 = fadd contract float %1542, %1608
  %1612 = add nuw nsw i32 %1545, 1
  %1613 = icmp eq i32 %1612, 257
  br i1 %1613, label %1614, label %1541, !llvm.loop !10

1614:                                             ; preds = %1541
  %1615 = mul nuw nsw i32 %11, 21
  %1616 = add nuw nsw i32 %1615, %6
  %1617 = zext i32 %1616 to i64
  %1618 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1617
  %1619 = bitcast %struct.HIP_vector_type addrspace(1)* %1618 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1619, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1620

1620:                                             ; preds = %1620, %1614
  %1621 = phi float [ %1611, %1614 ], [ %1690, %1620 ]
  %1622 = phi float [ %1610, %1614 ], [ %1689, %1620 ]
  %1623 = phi float [ %1609, %1614 ], [ %1688, %1620 ]
  %1624 = phi i32 [ 1, %1614 ], [ %1691, %1620 ]
  %1625 = add nsw i32 %1624, -1
  %1626 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1625, i32 0, i32 0, i32 0, i32 0, i32 0
  %1627 = load float, float addrspace(3)* %1626, align 4
  %1628 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1625, i32 0, i32 0, i32 0, i32 0, i32 1
  %1629 = load float, float addrspace(3)* %1628, align 4
  %1630 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1625, i32 0, i32 0, i32 0, i32 0, i32 2
  %1631 = load float, float addrspace(3)* %1630, align 4
  %1632 = and i32 %1624, 255
  %1633 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1632, i32 0, i32 0, i32 0, i32 0, i32 0
  %1634 = load float, float addrspace(3)* %1633, align 4
  %1635 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1632, i32 0, i32 0, i32 0, i32 0, i32 1
  %1636 = load float, float addrspace(3)* %1635, align 4
  %1637 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1632, i32 0, i32 0, i32 0, i32 0, i32 2
  %1638 = load float, float addrspace(3)* %1637, align 4
  %1639 = fsub contract float %1634, %1627
  %1640 = fsub contract float %1636, %1629
  %1641 = fsub contract float %1638, %1631
  %1642 = fsub contract float %18, %1627
  %1643 = fsub contract float %20, %1629
  %1644 = fsub contract float %22, %1631
  %1645 = fmul contract float %1642, %1642
  %1646 = fmul contract float %1643, %1643
  %1647 = fadd contract float %1645, %1646
  %1648 = fmul contract float %1644, %1644
  %1649 = fadd contract float %1648, %1647
  %1650 = fdiv contract float 1.000000e+00, %1649
  %1651 = fcmp olt float %1649, 0x39F0000000000000
  %1652 = select i1 %1651, float 0x41F0000000000000, float 1.000000e+00
  %1653 = fmul float %1649, %1652
  %1654 = tail call float @llvm.sqrt.f32(float %1653)
  %1655 = bitcast float %1654 to i32
  %1656 = add nsw i32 %1655, -1
  %1657 = bitcast i32 %1656 to float
  %1658 = add nsw i32 %1655, 1
  %1659 = bitcast i32 %1658 to float
  %1660 = tail call i1 @llvm.amdgcn.class.f32(float %1653, i32 608)
  %1661 = select i1 %1651, float 0x3EF0000000000000, float 1.000000e+00
  %1662 = fneg float %1659
  %1663 = tail call float @llvm.fma.f32(float %1662, float %1654, float %1653)
  %1664 = fcmp ogt float %1663, 0.000000e+00
  %1665 = fneg float %1657
  %1666 = tail call float @llvm.fma.f32(float %1665, float %1654, float %1653)
  %1667 = fcmp ole float %1666, 0.000000e+00
  %1668 = select i1 %1667, float %1657, float %1654
  %1669 = select i1 %1664, float %1659, float %1668
  %1670 = fmul float %1661, %1669
  %1671 = select i1 %1660, float %1653, float %1670
  %1672 = fdiv contract float 1.000000e+00, %1671
  %1673 = fmul contract float %1642, %1672
  %1674 = fmul contract float %1643, %1672
  %1675 = fmul contract float %1644, %1672
  %1676 = fmul contract float %1640, %1675
  %1677 = fmul contract float %1641, %1674
  %1678 = fsub contract float %1676, %1677
  %1679 = fmul contract float %1650, %1678
  %1680 = fmul contract float %1641, %1673
  %1681 = fmul contract float %1639, %1675
  %1682 = fsub contract float %1680, %1681
  %1683 = fmul contract float %1650, %1682
  %1684 = fmul contract float %1639, %1674
  %1685 = fmul contract float %1640, %1673
  %1686 = fsub contract float %1684, %1685
  %1687 = fmul contract float %1650, %1686
  %1688 = fadd contract float %1623, %1679
  %1689 = fadd contract float %1622, %1683
  %1690 = fadd contract float %1621, %1687
  %1691 = add nuw nsw i32 %1624, 1
  %1692 = icmp eq i32 %1691, 257
  br i1 %1692, label %1693, label %1620, !llvm.loop !10

1693:                                             ; preds = %1620
  %1694 = mul nuw nsw i32 %11, 22
  %1695 = add nuw nsw i32 %1694, %6
  %1696 = zext i32 %1695 to i64
  %1697 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1696
  %1698 = bitcast %struct.HIP_vector_type addrspace(1)* %1697 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1698, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1699

1699:                                             ; preds = %1699, %1693
  %1700 = phi float [ %1690, %1693 ], [ %1769, %1699 ]
  %1701 = phi float [ %1689, %1693 ], [ %1768, %1699 ]
  %1702 = phi float [ %1688, %1693 ], [ %1767, %1699 ]
  %1703 = phi i32 [ 1, %1693 ], [ %1770, %1699 ]
  %1704 = add nsw i32 %1703, -1
  %1705 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1704, i32 0, i32 0, i32 0, i32 0, i32 0
  %1706 = load float, float addrspace(3)* %1705, align 4
  %1707 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1704, i32 0, i32 0, i32 0, i32 0, i32 1
  %1708 = load float, float addrspace(3)* %1707, align 4
  %1709 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1704, i32 0, i32 0, i32 0, i32 0, i32 2
  %1710 = load float, float addrspace(3)* %1709, align 4
  %1711 = and i32 %1703, 255
  %1712 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1711, i32 0, i32 0, i32 0, i32 0, i32 0
  %1713 = load float, float addrspace(3)* %1712, align 4
  %1714 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1711, i32 0, i32 0, i32 0, i32 0, i32 1
  %1715 = load float, float addrspace(3)* %1714, align 4
  %1716 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1711, i32 0, i32 0, i32 0, i32 0, i32 2
  %1717 = load float, float addrspace(3)* %1716, align 4
  %1718 = fsub contract float %1713, %1706
  %1719 = fsub contract float %1715, %1708
  %1720 = fsub contract float %1717, %1710
  %1721 = fsub contract float %18, %1706
  %1722 = fsub contract float %20, %1708
  %1723 = fsub contract float %22, %1710
  %1724 = fmul contract float %1721, %1721
  %1725 = fmul contract float %1722, %1722
  %1726 = fadd contract float %1724, %1725
  %1727 = fmul contract float %1723, %1723
  %1728 = fadd contract float %1727, %1726
  %1729 = fdiv contract float 1.000000e+00, %1728
  %1730 = fcmp olt float %1728, 0x39F0000000000000
  %1731 = select i1 %1730, float 0x41F0000000000000, float 1.000000e+00
  %1732 = fmul float %1728, %1731
  %1733 = tail call float @llvm.sqrt.f32(float %1732)
  %1734 = bitcast float %1733 to i32
  %1735 = add nsw i32 %1734, -1
  %1736 = bitcast i32 %1735 to float
  %1737 = add nsw i32 %1734, 1
  %1738 = bitcast i32 %1737 to float
  %1739 = tail call i1 @llvm.amdgcn.class.f32(float %1732, i32 608)
  %1740 = select i1 %1730, float 0x3EF0000000000000, float 1.000000e+00
  %1741 = fneg float %1738
  %1742 = tail call float @llvm.fma.f32(float %1741, float %1733, float %1732)
  %1743 = fcmp ogt float %1742, 0.000000e+00
  %1744 = fneg float %1736
  %1745 = tail call float @llvm.fma.f32(float %1744, float %1733, float %1732)
  %1746 = fcmp ole float %1745, 0.000000e+00
  %1747 = select i1 %1746, float %1736, float %1733
  %1748 = select i1 %1743, float %1738, float %1747
  %1749 = fmul float %1740, %1748
  %1750 = select i1 %1739, float %1732, float %1749
  %1751 = fdiv contract float 1.000000e+00, %1750
  %1752 = fmul contract float %1721, %1751
  %1753 = fmul contract float %1722, %1751
  %1754 = fmul contract float %1723, %1751
  %1755 = fmul contract float %1719, %1754
  %1756 = fmul contract float %1720, %1753
  %1757 = fsub contract float %1755, %1756
  %1758 = fmul contract float %1729, %1757
  %1759 = fmul contract float %1720, %1752
  %1760 = fmul contract float %1718, %1754
  %1761 = fsub contract float %1759, %1760
  %1762 = fmul contract float %1729, %1761
  %1763 = fmul contract float %1718, %1753
  %1764 = fmul contract float %1719, %1752
  %1765 = fsub contract float %1763, %1764
  %1766 = fmul contract float %1729, %1765
  %1767 = fadd contract float %1702, %1758
  %1768 = fadd contract float %1701, %1762
  %1769 = fadd contract float %1700, %1766
  %1770 = add nuw nsw i32 %1703, 1
  %1771 = icmp eq i32 %1770, 257
  br i1 %1771, label %1772, label %1699, !llvm.loop !10

1772:                                             ; preds = %1699
  %1773 = mul nuw nsw i32 %11, 23
  %1774 = add nuw nsw i32 %1773, %6
  %1775 = zext i32 %1774 to i64
  %1776 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %1775
  %1777 = bitcast %struct.HIP_vector_type addrspace(1)* %1776 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %31, i8 addrspace(1)* noundef align 4 dereferenceable(12) %1777, i64 12, i1 false)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %1778

1778:                                             ; preds = %1778, %1772
  %1779 = phi float [ %1769, %1772 ], [ %1848, %1778 ]
  %1780 = phi float [ %1768, %1772 ], [ %1847, %1778 ]
  %1781 = phi float [ %1767, %1772 ], [ %1846, %1778 ]
  %1782 = phi i32 [ 1, %1772 ], [ %1849, %1778 ]
  %1783 = add nsw i32 %1782, -1
  %1784 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1783, i32 0, i32 0, i32 0, i32 0, i32 0
  %1785 = load float, float addrspace(3)* %1784, align 4
  %1786 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1783, i32 0, i32 0, i32 0, i32 0, i32 1
  %1787 = load float, float addrspace(3)* %1786, align 4
  %1788 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1783, i32 0, i32 0, i32 0, i32 0, i32 2
  %1789 = load float, float addrspace(3)* %1788, align 4
  %1790 = and i32 %1782, 255
  %1791 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1790, i32 0, i32 0, i32 0, i32 0, i32 0
  %1792 = load float, float addrspace(3)* %1791, align 4
  %1793 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1790, i32 0, i32 0, i32 0, i32 0, i32 1
  %1794 = load float, float addrspace(3)* %1793, align 4
  %1795 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1790, i32 0, i32 0, i32 0, i32 0, i32 2
  %1796 = load float, float addrspace(3)* %1795, align 4
  %1797 = fsub contract float %1792, %1785
  %1798 = fsub contract float %1794, %1787
  %1799 = fsub contract float %1796, %1789
  %1800 = fsub contract float %18, %1785
  %1801 = fsub contract float %20, %1787
  %1802 = fsub contract float %22, %1789
  %1803 = fmul contract float %1800, %1800
  %1804 = fmul contract float %1801, %1801
  %1805 = fadd contract float %1803, %1804
  %1806 = fmul contract float %1802, %1802
  %1807 = fadd contract float %1806, %1805
  %1808 = fdiv contract float 1.000000e+00, %1807
  %1809 = fcmp olt float %1807, 0x39F0000000000000
  %1810 = select i1 %1809, float 0x41F0000000000000, float 1.000000e+00
  %1811 = fmul float %1807, %1810
  %1812 = tail call float @llvm.sqrt.f32(float %1811)
  %1813 = bitcast float %1812 to i32
  %1814 = add nsw i32 %1813, -1
  %1815 = bitcast i32 %1814 to float
  %1816 = add nsw i32 %1813, 1
  %1817 = bitcast i32 %1816 to float
  %1818 = tail call i1 @llvm.amdgcn.class.f32(float %1811, i32 608)
  %1819 = select i1 %1809, float 0x3EF0000000000000, float 1.000000e+00
  %1820 = fneg float %1817
  %1821 = tail call float @llvm.fma.f32(float %1820, float %1812, float %1811)
  %1822 = fcmp ogt float %1821, 0.000000e+00
  %1823 = fneg float %1815
  %1824 = tail call float @llvm.fma.f32(float %1823, float %1812, float %1811)
  %1825 = fcmp ole float %1824, 0.000000e+00
  %1826 = select i1 %1825, float %1815, float %1812
  %1827 = select i1 %1822, float %1817, float %1826
  %1828 = fmul float %1819, %1827
  %1829 = select i1 %1818, float %1811, float %1828
  %1830 = fdiv contract float 1.000000e+00, %1829
  %1831 = fmul contract float %1800, %1830
  %1832 = fmul contract float %1801, %1830
  %1833 = fmul contract float %1802, %1830
  %1834 = fmul contract float %1798, %1833
  %1835 = fmul contract float %1799, %1832
  %1836 = fsub contract float %1834, %1835
  %1837 = fmul contract float %1808, %1836
  %1838 = fmul contract float %1799, %1831
  %1839 = fmul contract float %1797, %1833
  %1840 = fsub contract float %1838, %1839
  %1841 = fmul contract float %1808, %1840
  %1842 = fmul contract float %1797, %1832
  %1843 = fmul contract float %1798, %1831
  %1844 = fsub contract float %1842, %1843
  %1845 = fmul contract float %1808, %1844
  %1846 = fadd contract float %1781, %1837
  %1847 = fadd contract float %1780, %1841
  %1848 = fadd contract float %1779, %1845
  %1849 = add nuw nsw i32 %1782, 1
  %1850 = icmp eq i32 %1849, 257
  br i1 %1850, label %1851, label %1778, !llvm.loop !10

1851:                                             ; preds = %1778
  %1852 = icmp slt i32 %14, 4096
  br i1 %1852, label %1926, label %1945

1853:                                             ; preds = %5, %1853
  %1854 = phi float [ 0.000000e+00, %5 ], [ %1923, %1853 ]
  %1855 = phi float [ 0.000000e+00, %5 ], [ %1922, %1853 ]
  %1856 = phi float [ 0.000000e+00, %5 ], [ %1921, %1853 ]
  %1857 = phi i32 [ 1, %5 ], [ %1924, %1853 ]
  %1858 = add nsw i32 %1857, -1
  %1859 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1858, i32 0, i32 0, i32 0, i32 0, i32 0
  %1860 = load float, float addrspace(3)* %1859, align 4
  %1861 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1858, i32 0, i32 0, i32 0, i32 0, i32 1
  %1862 = load float, float addrspace(3)* %1861, align 4
  %1863 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1858, i32 0, i32 0, i32 0, i32 0, i32 2
  %1864 = load float, float addrspace(3)* %1863, align 4
  %1865 = and i32 %1857, 255
  %1866 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1865, i32 0, i32 0, i32 0, i32 0, i32 0
  %1867 = load float, float addrspace(3)* %1866, align 4
  %1868 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1865, i32 0, i32 0, i32 0, i32 0, i32 1
  %1869 = load float, float addrspace(3)* %1868, align 4
  %1870 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ12getForcesMagP15HIP_vector_typeIfLj4EEPS_IfLj3EES3_iS3_E8shared_r, i32 0, i32 %1865, i32 0, i32 0, i32 0, i32 0, i32 2
  %1871 = load float, float addrspace(3)* %1870, align 4
  %1872 = fsub contract float %1867, %1860
  %1873 = fsub contract float %1869, %1862
  %1874 = fsub contract float %1871, %1864
  %1875 = fsub contract float %18, %1860
  %1876 = fsub contract float %20, %1862
  %1877 = fsub contract float %22, %1864
  %1878 = fmul contract float %1875, %1875
  %1879 = fmul contract float %1876, %1876
  %1880 = fadd contract float %1878, %1879
  %1881 = fmul contract float %1877, %1877
  %1882 = fadd contract float %1881, %1880
  %1883 = fdiv contract float 1.000000e+00, %1882
  %1884 = fcmp olt float %1882, 0x39F0000000000000
  %1885 = select i1 %1884, float 0x41F0000000000000, float 1.000000e+00
  %1886 = fmul float %1882, %1885
  %1887 = tail call float @llvm.sqrt.f32(float %1886)
  %1888 = bitcast float %1887 to i32
  %1889 = add nsw i32 %1888, -1
  %1890 = bitcast i32 %1889 to float
  %1891 = add nsw i32 %1888, 1
  %1892 = bitcast i32 %1891 to float
  %1893 = tail call i1 @llvm.amdgcn.class.f32(float %1886, i32 608)
  %1894 = select i1 %1884, float 0x3EF0000000000000, float 1.000000e+00
  %1895 = fneg float %1892
  %1896 = tail call float @llvm.fma.f32(float %1895, float %1887, float %1886)
  %1897 = fcmp ogt float %1896, 0.000000e+00
  %1898 = fneg float %1890
  %1899 = tail call float @llvm.fma.f32(float %1898, float %1887, float %1886)
  %1900 = fcmp ole float %1899, 0.000000e+00
  %1901 = select i1 %1900, float %1890, float %1887
  %1902 = select i1 %1897, float %1892, float %1901
  %1903 = fmul float %1894, %1902
  %1904 = select i1 %1893, float %1886, float %1903
  %1905 = fdiv contract float 1.000000e+00, %1904
  %1906 = fmul contract float %1875, %1905
  %1907 = fmul contract float %1876, %1905
  %1908 = fmul contract float %1877, %1905
  %1909 = fmul contract float %1873, %1908
  %1910 = fmul contract float %1874, %1907
  %1911 = fsub contract float %1909, %1910
  %1912 = fmul contract float %1883, %1911
  %1913 = fmul contract float %1874, %1906
  %1914 = fmul contract float %1872, %1908
  %1915 = fsub contract float %1913, %1914
  %1916 = fmul contract float %1883, %1915
  %1917 = fmul contract float %1872, %1907
  %1918 = fmul contract float %1873, %1906
  %1919 = fsub contract float %1917, %1918
  %1920 = fmul contract float %1883, %1919
  %1921 = fadd contract float %1856, %1912
  %1922 = fadd contract float %1855, %1916
  %1923 = fadd contract float %1854, %1920
  %1924 = add nuw nsw i32 %1857, 1
  %1925 = icmp eq i32 %1924, 257
  br i1 %1925, label %35, label %1853, !llvm.loop !10

1926:                                             ; preds = %1851
  %1927 = fmul contract float %25, %1847
  %1928 = fmul contract float %27, %1846
  %1929 = fsub contract float %1927, %1928
  %1930 = fmul contract float %29, %1846
  %1931 = fmul contract float %25, %1848
  %1932 = fsub contract float %1930, %1931
  %1933 = fmul contract float %27, %1848
  %1934 = fmul contract float %29, %1847
  %1935 = fsub contract float %1933, %1934
  %1936 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %23, i32 0, i32 0, i32 0, i32 0, i64 0
  %1937 = load float, float addrspace(1)* %1936, align 4, !tbaa !7, !amdgpu.noclobber !6
  %1938 = fadd contract float %1935, %1937
  store float %1938, float addrspace(1)* %1936, align 4, !tbaa !7
  %1939 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %23, i32 0, i32 0, i32 0, i32 0, i64 1
  %1940 = load float, float addrspace(1)* %1939, align 4, !tbaa !7, !amdgpu.noclobber !6
  %1941 = fadd contract float %1932, %1940
  store float %1941, float addrspace(1)* %1939, align 4, !tbaa !7
  %1942 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %23, i32 0, i32 0, i32 0, i32 0, i64 2
  %1943 = load float, float addrspace(1)* %1942, align 4, !tbaa !7, !amdgpu.noclobber !6
  %1944 = fadd contract float %1929, %1943
  store float %1944, float addrspace(1)* %1942, align 4, !tbaa !7
  br label %1945

1945:                                             ; preds = %1926, %1851
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
