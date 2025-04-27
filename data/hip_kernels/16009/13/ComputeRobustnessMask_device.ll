; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/13/ComputeRobustnessMask.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/13/ComputeRobustnessMask.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }
%struct.__hip_texture = type opaque

@pixelsRef = external hidden local_unnamed_addr addrspace(3) global [0 x %struct.HIP_vector_type], align 4

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21ComputeRobustnessMaskPK15HIP_vector_typeIfLj3EES2_PS_IfLj4EEP13__hip_textureiiiifff(%struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, %struct.HIP_vector_type.0 addrspace(1)* noalias nocapture writeonly %2, %struct.__hip_texture addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, float %8, float %9, float %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = mul nuw nsw i32 %27, %17
  %30 = add nuw nsw i32 %29, %19
  %31 = mul nuw nsw i32 %30, 9
  %32 = add nsw i32 %4, -1
  %33 = icmp slt i32 %20, %32
  br i1 %33, label %34, label %757

34:                                               ; preds = %11
  %35 = add nsw i32 %5, -1
  %36 = icmp sge i32 %28, %35
  %37 = icmp slt i32 %20, 1
  %38 = select i1 %36, i1 true, i1 %37
  %39 = icmp slt i32 %28, 1
  %40 = or i1 %39, %38
  br i1 %40, label %757, label %41

41:                                               ; preds = %34
  %42 = sitofp i32 %20 to float
  %43 = fadd contract float %42, 5.000000e-01
  %44 = sitofp i32 %4 to float
  %45 = fdiv contract float %43, %44
  %46 = sitofp i32 %28 to float
  %47 = fadd contract float %46, 5.000000e-01
  %48 = sitofp i32 %5 to float
  %49 = fdiv contract float %47, %48
  %50 = bitcast %struct.__hip_texture addrspace(1)* %3 to i32 addrspace(1)*
  %51 = addrspacecast i32 addrspace(1)* %50 to i32 addrspace(4)*
  %52 = getelementptr inbounds i32, i32 addrspace(4)* %51, i64 12
  %53 = getelementptr inbounds i32, i32 addrspace(4)* %51, i64 10
  %54 = load i32, i32 addrspace(4)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = uitofp i32 %54 to float
  %56 = getelementptr inbounds i32, i32 addrspace(4)* %51, i64 2
  %57 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = lshr i32 %57, 14
  %59 = and i32 %58, 16383
  %60 = add nuw nsw i32 %59, 1
  %61 = uitofp i32 %60 to float
  %62 = load i32, i32 addrspace(4)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = and i32 %62, 32768
  %64 = icmp eq i32 %63, 0
  %65 = select i1 %64, float %55, float 1.000000e+00
  %66 = select i1 %64, float %61, float 1.000000e+00
  %67 = getelementptr inbounds i32, i32 addrspace(4)* %51, i64 14
  %68 = load i32, i32 addrspace(4)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = and i32 %68, 1048576
  %70 = icmp eq i32 %69, 0
  %71 = bitcast i32 addrspace(4)* %52 to <4 x i32> addrspace(4)*
  %72 = load <4 x i32>, <4 x i32> addrspace(4)* %71, align 16, !tbaa !11, !amdgpu.noclobber !5
  %73 = bitcast %struct.__hip_texture addrspace(1)* %3 to <8 x i32> addrspace(1)*
  %74 = addrspacecast <8 x i32> addrspace(1)* %73 to <8 x i32> addrspace(4)*
  %75 = load <8 x i32>, <8 x i32> addrspace(4)* %74, align 32, !tbaa !11, !amdgpu.noclobber !5
  %76 = tail call float @llvm.amdgcn.rcp.f32(float %66)
  %77 = fmul float %49, %66
  %78 = tail call float @llvm.floor.f32(float %77)
  %79 = fmul float %76, %78
  %80 = select i1 %70, float %79, float %49
  %81 = tail call float @llvm.amdgcn.rcp.f32(float %65)
  %82 = fmul float %45, %65
  %83 = tail call float @llvm.floor.f32(float %82)
  %84 = fmul float %81, %83
  %85 = select i1 %70, float %84, float %45
  %86 = tail call <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 3, float %85, float %80, <8 x i32> %75, <4 x i32> %72, i1 false, i32 0, i32 0)
  %87 = extractelement <2 x float> %86, i64 0
  %88 = extractelement <2 x float> %86, i64 1
  %89 = fadd contract float %46, 2.000000e+00
  %90 = fadd contract float %89, 5.000000e-01
  %91 = fdiv contract float %90, %48
  %92 = fmul float %66, %91
  %93 = tail call float @llvm.floor.f32(float %92)
  %94 = fmul float %76, %93
  %95 = select i1 %70, float %94, float %91
  %96 = fadd contract float %42, 2.000000e+00
  %97 = fadd contract float %96, 5.000000e-01
  %98 = fdiv contract float %97, %44
  %99 = fmul float %65, %98
  %100 = tail call float @llvm.floor.f32(float %99)
  %101 = fmul float %81, %100
  %102 = select i1 %70, float %101, float %98
  %103 = tail call <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 3, float %102, float %95, <8 x i32> %75, <4 x i32> %72, i1 false, i32 0, i32 0)
  %104 = extractelement <2 x float> %103, i64 0
  %105 = tail call float @llvm.maxnum.f32(float %104, float %87)
  %106 = tail call float @llvm.minnum.f32(float %104, float %87)
  %107 = fmul contract float %87, 5.000000e-01
  %108 = tail call float @llvm.round.f32(float %107)
  %109 = fptosi float %108 to i32
  %110 = fmul contract float %88, 5.000000e-01
  %111 = tail call float @llvm.round.f32(float %110)
  %112 = fptosi float %111 to i32
  %113 = bitcast %struct.HIP_vector_type addrspace(1)* %0 to i8 addrspace(1)*
  %114 = zext i32 %20 to i64
  %115 = add nuw nsw i32 %31, 3
  %116 = add nsw i32 %20, %109
  %117 = bitcast %struct.HIP_vector_type addrspace(1)* %1 to i8 addrspace(1)*
  %118 = add nsw i32 %28, -1
  %119 = mul nsw i32 %118, %6
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8 addrspace(1)* %113, i64 %120
  %122 = bitcast i8 addrspace(1)* %121 to %struct.HIP_vector_type addrspace(1)*
  %123 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %122, i64 %114
  %124 = add i32 %118, %112
  %125 = tail call i32 @llvm.smax.i32(i32 %124, i32 0)
  %126 = tail call i32 @llvm.smin.i32(i32 %125, i32 %35)
  %127 = mul nsw i32 %126, %6
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %117, i64 %128
  %130 = bitcast i8 addrspace(1)* %129 to %struct.HIP_vector_type addrspace(1)*
  %131 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %123, i64 -1
  %132 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %131, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %133 = load float, float addrspace(1)* %132, align 4, !amdgpu.noclobber !5
  %134 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %131, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %135 = load float, float addrspace(1)* %134, align 4, !amdgpu.noclobber !5
  %136 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %131, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2
  %137 = load float, float addrspace(1)* %136, align 4, !amdgpu.noclobber !5
  %138 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %31, i32 0, i32 0, i32 0, i32 0, i32 0
  store float %133, float addrspace(3)* %138, align 4
  %139 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %31, i32 0, i32 0, i32 0, i32 0, i32 1
  store float %135, float addrspace(3)* %139, align 4
  %140 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %31, i32 0, i32 0, i32 0, i32 0, i32 2
  store float %137, float addrspace(3)* %140, align 4
  %141 = fadd contract float %133, 0.000000e+00
  %142 = fadd contract float %135, 0.000000e+00
  %143 = fadd contract float %137, 0.000000e+00
  %144 = tail call i32 @llvm.smax.i32(i32 %116, i32 1)
  %145 = add nsw i32 %144, -1
  %146 = tail call i32 @llvm.smin.i32(i32 %145, i32 %32)
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %130, i64 %147, i32 0, i32 0, i32 0, i32 0, i64 0
  %149 = load float, float addrspace(1)* %148, align 4, !amdgpu.noclobber !5
  %150 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %130, i64 %147, i32 0, i32 0, i32 0, i32 0, i64 1
  %151 = load float, float addrspace(1)* %150, align 4, !amdgpu.noclobber !5
  %152 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %130, i64 %147, i32 0, i32 0, i32 0, i32 0, i64 2
  %153 = load float, float addrspace(1)* %152, align 4, !amdgpu.noclobber !5
  %154 = fadd contract float %149, 0.000000e+00
  %155 = fadd contract float %151, 0.000000e+00
  %156 = fadd contract float %153, 0.000000e+00
  %157 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %123, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %158 = load float, float addrspace(1)* %157, align 4, !amdgpu.noclobber !5
  %159 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %122, i64 %114, i32 0, i32 0, i32 0, i32 0, i64 1
  %160 = load float, float addrspace(1)* %159, align 4, !amdgpu.noclobber !5
  %161 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %122, i64 %114, i32 0, i32 0, i32 0, i32 0, i64 2
  %162 = load float, float addrspace(1)* %161, align 4, !amdgpu.noclobber !5
  %163 = add nuw nsw i32 %31, 1
  %164 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %163, i32 0, i32 0, i32 0, i32 0, i32 0
  store float %158, float addrspace(3)* %164, align 4
  %165 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %163, i32 0, i32 0, i32 0, i32 0, i32 1
  store float %160, float addrspace(3)* %165, align 4
  %166 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %163, i32 0, i32 0, i32 0, i32 0, i32 2
  store float %162, float addrspace(3)* %166, align 4
  %167 = fadd contract float %141, %158
  %168 = fadd contract float %142, %160
  %169 = fadd contract float %143, %162
  %170 = tail call i32 @llvm.smax.i32(i32 %116, i32 0)
  %171 = tail call i32 @llvm.smin.i32(i32 %170, i32 %32)
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %130, i64 %172, i32 0, i32 0, i32 0, i32 0, i64 0
  %174 = load float, float addrspace(1)* %173, align 4, !amdgpu.noclobber !5
  %175 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %130, i64 %172, i32 0, i32 0, i32 0, i32 0, i64 1
  %176 = load float, float addrspace(1)* %175, align 4, !amdgpu.noclobber !5
  %177 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %130, i64 %172, i32 0, i32 0, i32 0, i32 0, i64 2
  %178 = load float, float addrspace(1)* %177, align 4, !amdgpu.noclobber !5
  %179 = fadd contract float %154, %174
  %180 = fadd contract float %155, %176
  %181 = fadd contract float %156, %178
  %182 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %123, i64 1
  %183 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %182, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %184 = load float, float addrspace(1)* %183, align 4, !amdgpu.noclobber !5
  %185 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %182, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %186 = load float, float addrspace(1)* %185, align 4, !amdgpu.noclobber !5
  %187 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %182, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2
  %188 = load float, float addrspace(1)* %187, align 4, !amdgpu.noclobber !5
  %189 = add nuw nsw i32 %31, 2
  %190 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %189, i32 0, i32 0, i32 0, i32 0, i32 0
  store float %184, float addrspace(3)* %190, align 4
  %191 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %189, i32 0, i32 0, i32 0, i32 0, i32 1
  store float %186, float addrspace(3)* %191, align 4
  %192 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %189, i32 0, i32 0, i32 0, i32 0, i32 2
  store float %188, float addrspace(3)* %192, align 4
  %193 = fadd contract float %167, %184
  %194 = fadd contract float %168, %186
  %195 = fadd contract float %169, %188
  %196 = tail call i32 @llvm.smax.i32(i32 %116, i32 -1)
  %197 = add nsw i32 %196, 1
  %198 = tail call i32 @llvm.smin.i32(i32 %197, i32 %32)
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %130, i64 %199, i32 0, i32 0, i32 0, i32 0, i64 0
  %201 = load float, float addrspace(1)* %200, align 4, !amdgpu.noclobber !5
  %202 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %130, i64 %199, i32 0, i32 0, i32 0, i32 0, i64 1
  %203 = load float, float addrspace(1)* %202, align 4, !amdgpu.noclobber !5
  %204 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %130, i64 %199, i32 0, i32 0, i32 0, i32 0, i64 2
  %205 = load float, float addrspace(1)* %204, align 4, !amdgpu.noclobber !5
  %206 = fadd contract float %179, %201
  %207 = fadd contract float %180, %203
  %208 = fadd contract float %181, %205
  %209 = mul nsw i32 %28, %6
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i8, i8 addrspace(1)* %113, i64 %210
  %212 = bitcast i8 addrspace(1)* %211 to %struct.HIP_vector_type addrspace(1)*
  %213 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %212, i64 %114
  %214 = add i32 %28, %112
  %215 = tail call i32 @llvm.smax.i32(i32 %214, i32 0)
  %216 = tail call i32 @llvm.smin.i32(i32 %215, i32 %35)
  %217 = mul nsw i32 %216, %6
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i8, i8 addrspace(1)* %117, i64 %218
  %220 = bitcast i8 addrspace(1)* %219 to %struct.HIP_vector_type addrspace(1)*
  %221 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %213, i64 -1
  %222 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %221, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %223 = load float, float addrspace(1)* %222, align 4, !amdgpu.noclobber !5
  %224 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %221, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %225 = load float, float addrspace(1)* %224, align 4, !amdgpu.noclobber !5
  %226 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %221, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2
  %227 = load float, float addrspace(1)* %226, align 4, !amdgpu.noclobber !5
  %228 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %115, i32 0, i32 0, i32 0, i32 0, i32 0
  store float %223, float addrspace(3)* %228, align 4
  %229 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %115, i32 0, i32 0, i32 0, i32 0, i32 1
  store float %225, float addrspace(3)* %229, align 4
  %230 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %115, i32 0, i32 0, i32 0, i32 0, i32 2
  store float %227, float addrspace(3)* %230, align 4
  %231 = fadd contract float %193, %223
  %232 = fadd contract float %194, %225
  %233 = fadd contract float %195, %227
  %234 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %220, i64 %147, i32 0, i32 0, i32 0, i32 0, i64 0
  %235 = load float, float addrspace(1)* %234, align 4, !amdgpu.noclobber !5
  %236 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %220, i64 %147, i32 0, i32 0, i32 0, i32 0, i64 1
  %237 = load float, float addrspace(1)* %236, align 4, !amdgpu.noclobber !5
  %238 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %220, i64 %147, i32 0, i32 0, i32 0, i32 0, i64 2
  %239 = load float, float addrspace(1)* %238, align 4, !amdgpu.noclobber !5
  %240 = fadd contract float %206, %235
  %241 = fadd contract float %207, %237
  %242 = fadd contract float %208, %239
  %243 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %213, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %244 = load float, float addrspace(1)* %243, align 4, !amdgpu.noclobber !5
  %245 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %212, i64 %114, i32 0, i32 0, i32 0, i32 0, i64 1
  %246 = load float, float addrspace(1)* %245, align 4, !amdgpu.noclobber !5
  %247 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %212, i64 %114, i32 0, i32 0, i32 0, i32 0, i64 2
  %248 = load float, float addrspace(1)* %247, align 4, !amdgpu.noclobber !5
  %249 = add nuw nsw i32 %31, 4
  %250 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %249, i32 0, i32 0, i32 0, i32 0, i32 0
  store float %244, float addrspace(3)* %250, align 4
  %251 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %249, i32 0, i32 0, i32 0, i32 0, i32 1
  store float %246, float addrspace(3)* %251, align 4
  %252 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %249, i32 0, i32 0, i32 0, i32 0, i32 2
  store float %248, float addrspace(3)* %252, align 4
  %253 = fadd contract float %231, %244
  %254 = fadd contract float %232, %246
  %255 = fadd contract float %233, %248
  %256 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %220, i64 %172, i32 0, i32 0, i32 0, i32 0, i64 0
  %257 = load float, float addrspace(1)* %256, align 4, !amdgpu.noclobber !5
  %258 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %220, i64 %172, i32 0, i32 0, i32 0, i32 0, i64 1
  %259 = load float, float addrspace(1)* %258, align 4, !amdgpu.noclobber !5
  %260 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %220, i64 %172, i32 0, i32 0, i32 0, i32 0, i64 2
  %261 = load float, float addrspace(1)* %260, align 4, !amdgpu.noclobber !5
  %262 = fadd contract float %240, %257
  %263 = fadd contract float %241, %259
  %264 = fadd contract float %242, %261
  %265 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %213, i64 1
  %266 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %265, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %267 = load float, float addrspace(1)* %266, align 4, !amdgpu.noclobber !5
  %268 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %265, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %269 = load float, float addrspace(1)* %268, align 4, !amdgpu.noclobber !5
  %270 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %265, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2
  %271 = load float, float addrspace(1)* %270, align 4, !amdgpu.noclobber !5
  %272 = add nuw nsw i32 %31, 5
  %273 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %272, i32 0, i32 0, i32 0, i32 0, i32 0
  store float %267, float addrspace(3)* %273, align 4
  %274 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %272, i32 0, i32 0, i32 0, i32 0, i32 1
  store float %269, float addrspace(3)* %274, align 4
  %275 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %272, i32 0, i32 0, i32 0, i32 0, i32 2
  store float %271, float addrspace(3)* %275, align 4
  %276 = fadd contract float %253, %267
  %277 = fadd contract float %254, %269
  %278 = fadd contract float %255, %271
  %279 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %220, i64 %199, i32 0, i32 0, i32 0, i32 0, i64 0
  %280 = load float, float addrspace(1)* %279, align 4, !amdgpu.noclobber !5
  %281 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %220, i64 %199, i32 0, i32 0, i32 0, i32 0, i64 1
  %282 = load float, float addrspace(1)* %281, align 4, !amdgpu.noclobber !5
  %283 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %220, i64 %199, i32 0, i32 0, i32 0, i32 0, i64 2
  %284 = load float, float addrspace(1)* %283, align 4, !amdgpu.noclobber !5
  %285 = fadd contract float %262, %280
  %286 = fadd contract float %263, %282
  %287 = fadd contract float %264, %284
  %288 = add nuw nsw i32 %28, 1
  %289 = mul nsw i32 %288, %6
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i8, i8 addrspace(1)* %113, i64 %290
  %292 = bitcast i8 addrspace(1)* %291 to %struct.HIP_vector_type addrspace(1)*
  %293 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %292, i64 %114
  %294 = add nuw nsw i32 %31, 6
  %295 = add i32 %288, %112
  %296 = tail call i32 @llvm.smax.i32(i32 %295, i32 0)
  %297 = tail call i32 @llvm.smin.i32(i32 %296, i32 %35)
  %298 = mul nsw i32 %297, %6
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds i8, i8 addrspace(1)* %117, i64 %299
  %301 = bitcast i8 addrspace(1)* %300 to %struct.HIP_vector_type addrspace(1)*
  %302 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %293, i64 -1
  %303 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %302, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %304 = load float, float addrspace(1)* %303, align 4, !amdgpu.noclobber !5
  %305 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %302, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %306 = load float, float addrspace(1)* %305, align 4, !amdgpu.noclobber !5
  %307 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %302, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2
  %308 = load float, float addrspace(1)* %307, align 4, !amdgpu.noclobber !5
  %309 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %294, i32 0, i32 0, i32 0, i32 0, i32 0
  store float %304, float addrspace(3)* %309, align 4
  %310 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %294, i32 0, i32 0, i32 0, i32 0, i32 1
  store float %306, float addrspace(3)* %310, align 4
  %311 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %294, i32 0, i32 0, i32 0, i32 0, i32 2
  store float %308, float addrspace(3)* %311, align 4
  %312 = fadd contract float %276, %304
  %313 = fadd contract float %277, %306
  %314 = fadd contract float %278, %308
  %315 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %301, i64 %147, i32 0, i32 0, i32 0, i32 0, i64 0
  %316 = load float, float addrspace(1)* %315, align 4, !amdgpu.noclobber !5
  %317 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %301, i64 %147, i32 0, i32 0, i32 0, i32 0, i64 1
  %318 = load float, float addrspace(1)* %317, align 4, !amdgpu.noclobber !5
  %319 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %301, i64 %147, i32 0, i32 0, i32 0, i32 0, i64 2
  %320 = load float, float addrspace(1)* %319, align 4, !amdgpu.noclobber !5
  %321 = fadd contract float %285, %316
  %322 = fadd contract float %286, %318
  %323 = fadd contract float %287, %320
  %324 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %293, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %325 = load float, float addrspace(1)* %324, align 4, !amdgpu.noclobber !5
  %326 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %292, i64 %114, i32 0, i32 0, i32 0, i32 0, i64 1
  %327 = load float, float addrspace(1)* %326, align 4, !amdgpu.noclobber !5
  %328 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %292, i64 %114, i32 0, i32 0, i32 0, i32 0, i64 2
  %329 = load float, float addrspace(1)* %328, align 4, !amdgpu.noclobber !5
  %330 = add nuw nsw i32 %31, 7
  %331 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %330, i32 0, i32 0, i32 0, i32 0, i32 0
  store float %325, float addrspace(3)* %331, align 4
  %332 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %330, i32 0, i32 0, i32 0, i32 0, i32 1
  store float %327, float addrspace(3)* %332, align 4
  %333 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %330, i32 0, i32 0, i32 0, i32 0, i32 2
  store float %329, float addrspace(3)* %333, align 4
  %334 = fadd contract float %312, %325
  %335 = fadd contract float %313, %327
  %336 = fadd contract float %314, %329
  %337 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %301, i64 %172, i32 0, i32 0, i32 0, i32 0, i64 0
  %338 = load float, float addrspace(1)* %337, align 4, !amdgpu.noclobber !5
  %339 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %301, i64 %172, i32 0, i32 0, i32 0, i32 0, i64 1
  %340 = load float, float addrspace(1)* %339, align 4, !amdgpu.noclobber !5
  %341 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %301, i64 %172, i32 0, i32 0, i32 0, i32 0, i64 2
  %342 = load float, float addrspace(1)* %341, align 4, !amdgpu.noclobber !5
  %343 = fadd contract float %321, %338
  %344 = fadd contract float %322, %340
  %345 = fadd contract float %323, %342
  %346 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %293, i64 1
  %347 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %346, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %348 = load float, float addrspace(1)* %347, align 4, !amdgpu.noclobber !5
  %349 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %346, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %350 = load float, float addrspace(1)* %349, align 4, !amdgpu.noclobber !5
  %351 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %346, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2
  %352 = load float, float addrspace(1)* %351, align 4, !amdgpu.noclobber !5
  %353 = add nuw nsw i32 %31, 8
  %354 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %353, i32 0, i32 0, i32 0, i32 0, i32 0
  store float %348, float addrspace(3)* %354, align 4
  %355 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %353, i32 0, i32 0, i32 0, i32 0, i32 1
  store float %350, float addrspace(3)* %355, align 4
  %356 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @pixelsRef, i32 0, i32 %353, i32 0, i32 0, i32 0, i32 0, i32 2
  store float %352, float addrspace(3)* %356, align 4
  %357 = fadd contract float %334, %348
  %358 = fadd contract float %335, %350
  %359 = fadd contract float %336, %352
  %360 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %301, i64 %199, i32 0, i32 0, i32 0, i32 0, i64 0
  %361 = load float, float addrspace(1)* %360, align 4, !amdgpu.noclobber !5
  %362 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %301, i64 %199, i32 0, i32 0, i32 0, i32 0, i64 1
  %363 = load float, float addrspace(1)* %362, align 4, !amdgpu.noclobber !5
  %364 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %301, i64 %199, i32 0, i32 0, i32 0, i32 0, i64 2
  %365 = load float, float addrspace(1)* %364, align 4, !amdgpu.noclobber !5
  %366 = fadd contract float %343, %361
  %367 = fadd contract float %344, %363
  %368 = fadd contract float %345, %365
  %369 = extractelement <2 x float> %103, i64 1
  %370 = tail call float @llvm.maxnum.f32(float %369, float %88)
  %371 = tail call float @llvm.minnum.f32(float %369, float %88)
  %372 = fdiv contract float %357, 9.000000e+00
  %373 = fdiv contract float %358, 9.000000e+00
  %374 = fdiv contract float %359, 9.000000e+00
  %375 = fdiv contract float %366, 9.000000e+00
  %376 = fdiv contract float %367, 9.000000e+00
  %377 = fdiv contract float %368, 9.000000e+00
  %378 = fsub contract float %372, %375
  %379 = tail call float @llvm.fabs.f32(float %378)
  %380 = fsub contract float %373, %376
  %381 = tail call float @llvm.fabs.f32(float %380)
  %382 = fadd contract float %379, %381
  %383 = fsub contract float %374, %377
  %384 = tail call float @llvm.fabs.f32(float %383)
  %385 = fadd contract float %382, %384
  %386 = fdiv contract float %385, 3.000000e+00
  %387 = fmul contract float %386, 5.000000e-01
  %388 = fmul contract float %105, %387
  %389 = fmul contract float %370, %387
  %390 = fmul contract float %106, %387
  %391 = fmul contract float %371, %387
  %392 = fsub contract float %388, %390
  %393 = fmul contract float %392, %392
  %394 = fsub contract float %389, %391
  %395 = fmul contract float %394, %394
  %396 = fadd contract float %393, %395
  %397 = fcmp olt float %396, 0x39F0000000000000
  %398 = select i1 %397, float 0x41F0000000000000, float 1.000000e+00
  %399 = fmul float %396, %398
  %400 = tail call float @llvm.sqrt.f32(float %399)
  %401 = bitcast float %400 to i32
  %402 = add nsw i32 %401, -1
  %403 = bitcast i32 %402 to float
  %404 = add nsw i32 %401, 1
  %405 = bitcast i32 %404 to float
  %406 = select i1 %397, float 0x3EF0000000000000, float 1.000000e+00
  %407 = fneg float %405
  %408 = tail call float @llvm.fma.f32(float %407, float %400, float %399)
  %409 = fcmp ogt float %408, 0.000000e+00
  %410 = fneg float %403
  %411 = tail call float @llvm.fma.f32(float %410, float %400, float %399)
  %412 = fcmp ole float %411, 0.000000e+00
  %413 = select i1 %412, float %403, float %400
  %414 = select i1 %409, float %405, float %413
  %415 = fmul float %406, %414
  %416 = load float, float addrspace(3)* %138, align 4, !tbaa !12
  %417 = fsub contract float %416, %372
  %418 = fmul contract float %417, %417
  %419 = fadd contract float %418, 0.000000e+00
  %420 = load float, float addrspace(3)* %139, align 4, !tbaa !12
  %421 = fsub contract float %420, %373
  %422 = fmul contract float %421, %421
  %423 = fadd contract float %422, 0.000000e+00
  %424 = load float, float addrspace(3)* %140, align 4, !tbaa !12
  %425 = fsub contract float %424, %374
  %426 = fmul contract float %425, %425
  %427 = fadd contract float %426, 0.000000e+00
  %428 = load float, float addrspace(3)* %164, align 4, !tbaa !12
  %429 = fsub contract float %428, %372
  %430 = fmul contract float %429, %429
  %431 = fadd contract float %419, %430
  %432 = load float, float addrspace(3)* %165, align 4, !tbaa !12
  %433 = fsub contract float %432, %373
  %434 = fmul contract float %433, %433
  %435 = fadd contract float %423, %434
  %436 = load float, float addrspace(3)* %166, align 4, !tbaa !12
  %437 = fsub contract float %436, %374
  %438 = fmul contract float %437, %437
  %439 = fadd contract float %427, %438
  %440 = load float, float addrspace(3)* %190, align 4, !tbaa !12
  %441 = fsub contract float %440, %372
  %442 = fmul contract float %441, %441
  %443 = fadd contract float %431, %442
  %444 = load float, float addrspace(3)* %191, align 4, !tbaa !12
  %445 = fsub contract float %444, %373
  %446 = fmul contract float %445, %445
  %447 = fadd contract float %435, %446
  %448 = load float, float addrspace(3)* %192, align 4, !tbaa !12
  %449 = fsub contract float %448, %374
  %450 = fmul contract float %449, %449
  %451 = fadd contract float %439, %450
  %452 = load float, float addrspace(3)* %228, align 4, !tbaa !12
  %453 = fsub contract float %452, %372
  %454 = fmul contract float %453, %453
  %455 = fadd contract float %443, %454
  %456 = load float, float addrspace(3)* %229, align 4, !tbaa !12
  %457 = fsub contract float %456, %373
  %458 = fmul contract float %457, %457
  %459 = fadd contract float %447, %458
  %460 = load float, float addrspace(3)* %230, align 4, !tbaa !12
  %461 = fsub contract float %460, %374
  %462 = fmul contract float %461, %461
  %463 = fadd contract float %451, %462
  %464 = load float, float addrspace(3)* %250, align 4, !tbaa !12
  %465 = fsub contract float %464, %372
  %466 = fmul contract float %465, %465
  %467 = fadd contract float %455, %466
  %468 = load float, float addrspace(3)* %251, align 4, !tbaa !12
  %469 = fsub contract float %468, %373
  %470 = fmul contract float %469, %469
  %471 = fadd contract float %459, %470
  %472 = load float, float addrspace(3)* %252, align 4, !tbaa !12
  %473 = fsub contract float %472, %374
  %474 = fmul contract float %473, %473
  %475 = fadd contract float %463, %474
  %476 = load float, float addrspace(3)* %273, align 4, !tbaa !12
  %477 = fsub contract float %476, %372
  %478 = fmul contract float %477, %477
  %479 = fadd contract float %467, %478
  %480 = load float, float addrspace(3)* %274, align 4, !tbaa !12
  %481 = fsub contract float %480, %373
  %482 = fmul contract float %481, %481
  %483 = fadd contract float %471, %482
  %484 = load float, float addrspace(3)* %275, align 4, !tbaa !12
  %485 = fsub contract float %484, %374
  %486 = fmul contract float %485, %485
  %487 = fadd contract float %475, %486
  %488 = load float, float addrspace(3)* %309, align 4, !tbaa !12
  %489 = fsub contract float %488, %372
  %490 = fmul contract float %489, %489
  %491 = fadd contract float %479, %490
  %492 = load float, float addrspace(3)* %310, align 4, !tbaa !12
  %493 = fsub contract float %492, %373
  %494 = fmul contract float %493, %493
  %495 = fadd contract float %483, %494
  %496 = load float, float addrspace(3)* %311, align 4, !tbaa !12
  %497 = fsub contract float %496, %374
  %498 = fmul contract float %497, %497
  %499 = fadd contract float %487, %498
  %500 = load float, float addrspace(3)* %331, align 4, !tbaa !12
  %501 = fsub contract float %500, %372
  %502 = fmul contract float %501, %501
  %503 = fadd contract float %491, %502
  %504 = load float, float addrspace(3)* %332, align 4, !tbaa !12
  %505 = fsub contract float %504, %373
  %506 = fmul contract float %505, %505
  %507 = fadd contract float %495, %506
  %508 = load float, float addrspace(3)* %333, align 4, !tbaa !12
  %509 = fsub contract float %508, %374
  %510 = fmul contract float %509, %509
  %511 = fadd contract float %499, %510
  %512 = load float, float addrspace(3)* %354, align 4, !tbaa !12
  %513 = fsub contract float %512, %372
  %514 = fmul contract float %513, %513
  %515 = fadd contract float %503, %514
  %516 = load float, float addrspace(3)* %355, align 4, !tbaa !12
  %517 = fsub contract float %516, %373
  %518 = fmul contract float %517, %517
  %519 = fadd contract float %507, %518
  %520 = load float, float addrspace(3)* %356, align 4, !tbaa !12
  %521 = fsub contract float %520, %374
  %522 = fmul contract float %521, %521
  %523 = fadd contract float %511, %522
  %524 = tail call i1 @llvm.amdgcn.class.f32(float %399, i32 608)
  %525 = select i1 %524, float %399, float %415
  %526 = fdiv contract float %515, 9.000000e+00
  %527 = fcmp olt float %526, 0x39F0000000000000
  %528 = select i1 %527, float 0x41F0000000000000, float 1.000000e+00
  %529 = fmul float %526, %528
  %530 = tail call float @llvm.sqrt.f32(float %529)
  %531 = bitcast float %530 to i32
  %532 = add nsw i32 %531, -1
  %533 = bitcast i32 %532 to float
  %534 = add nsw i32 %531, 1
  %535 = bitcast i32 %534 to float
  %536 = tail call i1 @llvm.amdgcn.class.f32(float %529, i32 608)
  %537 = select i1 %527, float 0x3EF0000000000000, float 1.000000e+00
  %538 = fneg float %535
  %539 = tail call float @llvm.fma.f32(float %538, float %530, float %529)
  %540 = fcmp ogt float %539, 0.000000e+00
  %541 = fneg float %533
  %542 = tail call float @llvm.fma.f32(float %541, float %530, float %529)
  %543 = fcmp ole float %542, 0.000000e+00
  %544 = select i1 %543, float %533, float %530
  %545 = select i1 %540, float %535, float %544
  %546 = fmul float %537, %545
  %547 = select i1 %536, float %529, float %546
  %548 = fdiv contract float %519, 9.000000e+00
  %549 = fcmp olt float %548, 0x39F0000000000000
  %550 = select i1 %549, float 0x41F0000000000000, float 1.000000e+00
  %551 = fmul float %548, %550
  %552 = tail call float @llvm.sqrt.f32(float %551)
  %553 = bitcast float %552 to i32
  %554 = add nsw i32 %553, -1
  %555 = bitcast i32 %554 to float
  %556 = add nsw i32 %553, 1
  %557 = bitcast i32 %556 to float
  %558 = tail call i1 @llvm.amdgcn.class.f32(float %551, i32 608)
  %559 = select i1 %549, float 0x3EF0000000000000, float 1.000000e+00
  %560 = fneg float %557
  %561 = tail call float @llvm.fma.f32(float %560, float %552, float %551)
  %562 = fcmp ogt float %561, 0.000000e+00
  %563 = fneg float %555
  %564 = tail call float @llvm.fma.f32(float %563, float %552, float %551)
  %565 = fcmp ole float %564, 0.000000e+00
  %566 = select i1 %565, float %555, float %552
  %567 = select i1 %562, float %557, float %566
  %568 = fmul float %559, %567
  %569 = select i1 %558, float %551, float %568
  %570 = fdiv contract float %523, 9.000000e+00
  %571 = fcmp olt float %570, 0x39F0000000000000
  %572 = select i1 %571, float 0x41F0000000000000, float 1.000000e+00
  %573 = fmul float %570, %572
  %574 = tail call float @llvm.sqrt.f32(float %573)
  %575 = bitcast float %574 to i32
  %576 = add nsw i32 %575, -1
  %577 = bitcast i32 %576 to float
  %578 = add nsw i32 %575, 1
  %579 = bitcast i32 %578 to float
  %580 = tail call i1 @llvm.amdgcn.class.f32(float %573, i32 608)
  %581 = select i1 %571, float 0x3EF0000000000000, float 1.000000e+00
  %582 = fneg float %579
  %583 = tail call float @llvm.fma.f32(float %582, float %574, float %573)
  %584 = fcmp ogt float %583, 0.000000e+00
  %585 = fneg float %577
  %586 = tail call float @llvm.fma.f32(float %585, float %574, float %573)
  %587 = fcmp ole float %586, 0.000000e+00
  %588 = select i1 %587, float %577, float %574
  %589 = select i1 %584, float %579, float %588
  %590 = fmul float %581, %589
  %591 = select i1 %580, float %573, float %590
  %592 = fmul contract float %372, %8
  %593 = fadd contract float %592, %9
  %594 = fcmp olt float %593, 0x39F0000000000000
  %595 = select i1 %594, float 0x41F0000000000000, float 1.000000e+00
  %596 = fmul float %593, %595
  %597 = tail call float @llvm.sqrt.f32(float %596)
  %598 = bitcast float %597 to i32
  %599 = add nsw i32 %598, -1
  %600 = bitcast i32 %599 to float
  %601 = add nsw i32 %598, 1
  %602 = bitcast i32 %601 to float
  %603 = tail call i1 @llvm.amdgcn.class.f32(float %596, i32 608)
  %604 = select i1 %594, float 0x3EF0000000000000, float 1.000000e+00
  %605 = fneg float %602
  %606 = tail call float @llvm.fma.f32(float %605, float %597, float %596)
  %607 = fcmp ogt float %606, 0.000000e+00
  %608 = fneg float %600
  %609 = tail call float @llvm.fma.f32(float %608, float %597, float %596)
  %610 = fcmp ole float %609, 0.000000e+00
  %611 = select i1 %610, float %600, float %597
  %612 = select i1 %607, float %602, float %611
  %613 = fmul float %604, %612
  %614 = select i1 %603, float %596, float %613
  %615 = fmul contract float %373, %8
  %616 = fadd contract float %615, %9
  %617 = fcmp olt float %616, 0x39F0000000000000
  %618 = select i1 %617, float 0x41F0000000000000, float 1.000000e+00
  %619 = fmul float %616, %618
  %620 = tail call float @llvm.sqrt.f32(float %619)
  %621 = bitcast float %620 to i32
  %622 = add nsw i32 %621, -1
  %623 = bitcast i32 %622 to float
  %624 = add nsw i32 %621, 1
  %625 = bitcast i32 %624 to float
  %626 = tail call i1 @llvm.amdgcn.class.f32(float %619, i32 608)
  %627 = select i1 %617, float 0x3EF0000000000000, float 1.000000e+00
  %628 = fneg float %625
  %629 = tail call float @llvm.fma.f32(float %628, float %620, float %619)
  %630 = fcmp ogt float %629, 0.000000e+00
  %631 = fneg float %623
  %632 = tail call float @llvm.fma.f32(float %631, float %620, float %619)
  %633 = fcmp ole float %632, 0.000000e+00
  %634 = select i1 %633, float %623, float %620
  %635 = select i1 %630, float %625, float %634
  %636 = fmul float %627, %635
  %637 = select i1 %626, float %619, float %636
  %638 = fdiv contract float %637, 0x3FF6A09E60000000
  %639 = fmul contract float %374, %8
  %640 = fadd contract float %639, %9
  %641 = fcmp olt float %640, 0x39F0000000000000
  %642 = select i1 %641, float 0x41F0000000000000, float 1.000000e+00
  %643 = fmul float %640, %642
  %644 = tail call float @llvm.sqrt.f32(float %643)
  %645 = bitcast float %644 to i32
  %646 = add nsw i32 %645, -1
  %647 = bitcast i32 %646 to float
  %648 = add nsw i32 %645, 1
  %649 = bitcast i32 %648 to float
  %650 = tail call i1 @llvm.amdgcn.class.f32(float %643, i32 608)
  %651 = select i1 %641, float 0x3EF0000000000000, float 1.000000e+00
  %652 = fneg float %649
  %653 = tail call float @llvm.fma.f32(float %652, float %644, float %643)
  %654 = fcmp ogt float %653, 0.000000e+00
  %655 = fneg float %647
  %656 = tail call float @llvm.fma.f32(float %655, float %644, float %643)
  %657 = fcmp ole float %656, 0.000000e+00
  %658 = select i1 %657, float %647, float %644
  %659 = select i1 %654, float %649, float %658
  %660 = fmul float %651, %659
  %661 = select i1 %650, float %643, float %660
  %662 = tail call float @llvm.maxnum.f32(float %614, float %547)
  %663 = tail call float @llvm.maxnum.f32(float %638, float %569)
  %664 = tail call float @llvm.maxnum.f32(float %661, float %591)
  %665 = fmul contract float %547, %547
  %666 = fmul contract float %614, %614
  %667 = fadd contract float %666, %665
  %668 = fdiv contract float %665, %667
  %669 = fmul contract float %379, %668
  %670 = fmul contract float %569, %569
  %671 = fmul contract float %638, %638
  %672 = fadd contract float %671, %670
  %673 = fdiv contract float %670, %672
  %674 = fmul contract float %381, %673
  %675 = fmul contract float %591, %591
  %676 = fmul contract float %661, %661
  %677 = fadd contract float %676, %675
  %678 = fdiv contract float %675, %677
  %679 = fmul contract float %384, %678
  %680 = fcmp contract ogt float %525, %10
  %681 = select i1 %680, float 0.000000e+00, float 1.500000e+00
  %682 = fneg contract float %669
  %683 = fmul contract float %669, %682
  %684 = fmul contract float %662, %662
  %685 = fdiv contract float %683, %684
  %686 = fmul float %685, 0x3FF7154760000000
  %687 = tail call float @llvm.rint.f32(float %686)
  %688 = fcmp ogt float %685, 0x40562E4300000000
  %689 = fcmp olt float %685, 0xC059D1DA00000000
  %690 = fneg float %686
  %691 = tail call float @llvm.fma.f32(float %685, float 0x3FF7154760000000, float %690)
  %692 = tail call float @llvm.fma.f32(float %685, float 0x3E54AE0BE0000000, float %691)
  %693 = fsub float %686, %687
  %694 = fadd float %692, %693
  %695 = tail call float @llvm.exp2.f32(float %694)
  %696 = fptosi float %687 to i32
  %697 = tail call float @llvm.amdgcn.ldexp.f32(float %695, i32 %696)
  %698 = select i1 %689, float 0.000000e+00, float %697
  %699 = select i1 %688, float 0x7FF0000000000000, float %698
  %700 = fmul contract float %681, %699
  %701 = fadd contract float %700, 0xBFBEB851E0000000
  %702 = tail call float @llvm.minnum.f32(float %701, float 1.000000e+00)
  %703 = tail call float @llvm.maxnum.f32(float %702, float 0.000000e+00)
  %704 = fneg contract float %674
  %705 = fmul contract float %674, %704
  %706 = fmul contract float %663, %663
  %707 = fdiv contract float %705, %706
  %708 = fmul float %707, 0x3FF7154760000000
  %709 = tail call float @llvm.rint.f32(float %708)
  %710 = fcmp ogt float %707, 0x40562E4300000000
  %711 = fcmp olt float %707, 0xC059D1DA00000000
  %712 = fneg float %708
  %713 = tail call float @llvm.fma.f32(float %707, float 0x3FF7154760000000, float %712)
  %714 = tail call float @llvm.fma.f32(float %707, float 0x3E54AE0BE0000000, float %713)
  %715 = fsub float %708, %709
  %716 = fadd float %714, %715
  %717 = tail call float @llvm.exp2.f32(float %716)
  %718 = fptosi float %709 to i32
  %719 = tail call float @llvm.amdgcn.ldexp.f32(float %717, i32 %718)
  %720 = select i1 %711, float 0.000000e+00, float %719
  %721 = select i1 %710, float 0x7FF0000000000000, float %720
  %722 = fmul contract float %681, %721
  %723 = fadd contract float %722, 0xBFBEB851E0000000
  %724 = tail call float @llvm.minnum.f32(float %723, float 1.000000e+00)
  %725 = tail call float @llvm.maxnum.f32(float %724, float 0.000000e+00)
  %726 = fneg contract float %679
  %727 = fmul contract float %679, %726
  %728 = fmul contract float %664, %664
  %729 = fdiv contract float %727, %728
  %730 = fmul float %729, 0x3FF7154760000000
  %731 = tail call float @llvm.rint.f32(float %730)
  %732 = fcmp ogt float %729, 0x40562E4300000000
  %733 = fcmp olt float %729, 0xC059D1DA00000000
  %734 = fneg float %730
  %735 = tail call float @llvm.fma.f32(float %729, float 0x3FF7154760000000, float %734)
  %736 = tail call float @llvm.fma.f32(float %729, float 0x3E54AE0BE0000000, float %735)
  %737 = fsub float %730, %731
  %738 = fadd float %736, %737
  %739 = tail call float @llvm.exp2.f32(float %738)
  %740 = fptosi float %731 to i32
  %741 = tail call float @llvm.amdgcn.ldexp.f32(float %739, i32 %740)
  %742 = select i1 %733, float 0.000000e+00, float %741
  %743 = select i1 %732, float 0x7FF0000000000000, float %742
  %744 = fmul contract float %681, %743
  %745 = fadd contract float %744, 0xBFBEB851E0000000
  %746 = tail call float @llvm.minnum.f32(float %745, float 1.000000e+00)
  %747 = tail call float @llvm.maxnum.f32(float %746, float 0.000000e+00)
  %748 = bitcast %struct.HIP_vector_type.0 addrspace(1)* %2 to i8 addrspace(1)*
  %749 = mul nsw i32 %28, %7
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds i8, i8 addrspace(1)* %748, i64 %750
  %752 = bitcast i8 addrspace(1)* %751 to %struct.HIP_vector_type.0 addrspace(1)*
  %753 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %752, i64 %114, i32 0, i32 0, i32 0, i64 0
  store float %703, float addrspace(1)* %753, align 16
  %754 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %752, i64 %114, i32 0, i32 0, i32 0, i64 1
  store float %725, float addrspace(1)* %754, align 4
  %755 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %752, i64 %114, i32 0, i32 0, i32 0, i64 2
  store float %747, float addrspace(1)* %755, align 8
  %756 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %752, i64 %114, i32 0, i32 0, i32 0, i64 3
  store float %525, float addrspace(1)* %756, align 4
  br label %757

757:                                              ; preds = %11, %34, %41
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.round.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nounwind readonly willreturn
declare <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #4

attributes #0 = { mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind readonly willreturn }

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
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
