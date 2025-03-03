; ModuleID = '../data/hip_kernels/5182/19/main.cu'
source_filename = "../data/hip_kernels/5182/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11crate3DplotPffiifS_(float addrspace(1)* nocapture readonly %0, float %1, i32 %2, i32 %3, float %4, float addrspace(1)* %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = udiv i32 %14, %11
  %18 = mul i32 %17, %11
  %19 = icmp ugt i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %16
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %15
  %25 = mul i32 %24, %11
  %26 = add i32 %25, %23
  %27 = mul nsw i32 %3, %2
  %28 = sitofp i32 %2 to float
  %29 = fdiv contract float 1.000000e+00, %28
  %30 = sitofp i32 %3 to float
  %31 = fdiv contract float 1.000000e+00, %30
  %32 = freeze i32 %26
  %33 = freeze i32 %3
  %34 = sdiv i32 %32, %33
  %35 = mul i32 %34, %33
  %36 = sub i32 %32, %35
  %37 = sub nsw i32 %3, %36
  %38 = icmp slt i32 %26, %27
  br i1 %38, label %39, label %157

39:                                               ; preds = %6
  %40 = add nsw i32 %37, -1
  %41 = sext i32 %26 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16, !amdgpu.noclobber !5
  %44 = fdiv contract float %43, %4
  %45 = bitcast float addrspace(1)* %5 to %struct.HIP_vector_type addrspace(1)*
  %46 = mul nsw i32 %27, 60
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %5, i64 %47
  %49 = bitcast float addrspace(1)* %48 to %struct.HIP_vector_type.0 addrspace(1)*
  %50 = sitofp i32 %34 to float
  %51 = fmul contract float %50, %1
  %52 = fadd contract float %51, 0.000000e+00
  %53 = shl nsw i32 %26, 2
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %54
  %56 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %55, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %52, float addrspace(1)* %56, align 4, !tbaa !20
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %54, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %44, float addrspace(1)* %57, align 4, !tbaa !20
  %58 = sitofp i32 %40 to float
  %59 = fmul contract float %58, %1
  %60 = fadd contract float %59, 0.000000e+00
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %54, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %60, float addrspace(1)* %61, align 4, !tbaa !20
  %62 = fmul contract float %29, %50
  %63 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %49, i64 %54, i32 0, i32 0, i32 0, i64 0
  store float %62, float addrspace(1)* %63, align 8, !tbaa !20
  %64 = fmul contract float %31, %58
  %65 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %49, i64 %54, i32 0, i32 0, i32 0, i64 1
  store float %64, float addrspace(1)* %65, align 4, !tbaa !20
  %66 = add nsw i32 %34, 1
  %67 = sitofp i32 %66 to float
  %68 = fmul contract float %67, %1
  %69 = add nuw nsw i32 %53, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %70
  %72 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %71, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %68, float addrspace(1)* %72, align 4, !tbaa !20
  %73 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %70, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %44, float addrspace(1)* %73, align 4, !tbaa !20
  %74 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %70, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %60, float addrspace(1)* %74, align 4, !tbaa !20
  %75 = fmul contract float %29, %67
  %76 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %49, i64 %70, i32 0, i32 0, i32 0, i64 0
  store float %75, float addrspace(1)* %76, align 8, !tbaa !20
  %77 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %49, i64 %70, i32 0, i32 0, i32 0, i64 1
  store float %64, float addrspace(1)* %77, align 4, !tbaa !20
  %78 = add nuw nsw i32 %53, 2
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %79
  %81 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %80, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %68, float addrspace(1)* %81, align 4, !tbaa !20
  %82 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %79, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %44, float addrspace(1)* %82, align 4, !tbaa !20
  %83 = sitofp i32 %37 to float
  %84 = fmul contract float %83, %1
  %85 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %79, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %84, float addrspace(1)* %85, align 4, !tbaa !20
  %86 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %49, i64 %79, i32 0, i32 0, i32 0, i64 0
  store float %75, float addrspace(1)* %86, align 8, !tbaa !20
  %87 = fmul contract float %31, %83
  %88 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %49, i64 %79, i32 0, i32 0, i32 0, i64 1
  store float %87, float addrspace(1)* %88, align 4, !tbaa !20
  %89 = add nuw nsw i32 %53, 3
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %90
  %92 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %91, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %52, float addrspace(1)* %92, align 4, !tbaa !20
  %93 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %44, float addrspace(1)* %93, align 4, !tbaa !20
  %94 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %45, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %84, float addrspace(1)* %94, align 4, !tbaa !20
  %95 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %49, i64 %90, i32 0, i32 0, i32 0, i64 0
  store float %62, float addrspace(1)* %95, align 8, !tbaa !20
  %96 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %49, i64 %90, i32 0, i32 0, i32 0, i64 1
  store float %87, float addrspace(1)* %96, align 4, !tbaa !20
  %97 = mul nsw i32 %27, 12
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %5, i64 %98
  %100 = bitcast float addrspace(1)* %99 to %struct.HIP_vector_type addrspace(1)*
  %101 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %100, i64 %54
  %102 = bitcast %struct.HIP_vector_type addrspace(1)* %101 to i8 addrspace(1)*
  %103 = bitcast %struct.HIP_vector_type addrspace(1)* %55 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %102, i8 addrspace(1)* noundef align 4 dereferenceable(12) %103, i64 12, i1 false)
  %104 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %100, i64 %54, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0.000000e+00, float addrspace(1)* %104, align 4, !tbaa !20
  %105 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %100, i64 %70
  %106 = bitcast %struct.HIP_vector_type addrspace(1)* %105 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %106, i8 addrspace(1)* noundef align 4 dereferenceable(12) %103, i64 12, i1 false)
  %107 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %100, i64 %79
  %108 = bitcast %struct.HIP_vector_type addrspace(1)* %107 to i8 addrspace(1)*
  %109 = bitcast %struct.HIP_vector_type addrspace(1)* %91 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %108, i8 addrspace(1)* noundef align 4 dereferenceable(12) %109, i64 12, i1 false)
  %110 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %100, i64 %90
  %111 = bitcast %struct.HIP_vector_type addrspace(1)* %110 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %111, i8 addrspace(1)* noundef align 4 dereferenceable(12) %109, i64 12, i1 false)
  %112 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %100, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0.000000e+00, float addrspace(1)* %112, align 4, !tbaa !20
  %113 = mul nsw i32 %27, 24
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %5, i64 %114
  %116 = bitcast float addrspace(1)* %115 to %struct.HIP_vector_type addrspace(1)*
  %117 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %116, i64 %54
  %118 = bitcast %struct.HIP_vector_type addrspace(1)* %117 to i8 addrspace(1)*
  %119 = bitcast %struct.HIP_vector_type addrspace(1)* %80 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %118, i8 addrspace(1)* noundef align 4 dereferenceable(12) %119, i64 12, i1 false)
  %120 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %116, i64 %54, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0.000000e+00, float addrspace(1)* %120, align 4, !tbaa !20
  %121 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %116, i64 %70
  %122 = bitcast %struct.HIP_vector_type addrspace(1)* %121 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %122, i8 addrspace(1)* noundef align 4 dereferenceable(12) %109, i64 12, i1 false)
  %123 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %116, i64 %70, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0.000000e+00, float addrspace(1)* %123, align 4, !tbaa !20
  %124 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %116, i64 %79
  %125 = bitcast %struct.HIP_vector_type addrspace(1)* %124 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %125, i8 addrspace(1)* noundef align 4 dereferenceable(12) %109, i64 12, i1 false)
  %126 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %116, i64 %90
  %127 = bitcast %struct.HIP_vector_type addrspace(1)* %126 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %127, i8 addrspace(1)* noundef align 4 dereferenceable(12) %119, i64 12, i1 false)
  %128 = mul nsw i32 %27, 36
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %5, i64 %129
  %131 = bitcast float addrspace(1)* %130 to %struct.HIP_vector_type addrspace(1)*
  %132 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %131, i64 %54
  %133 = bitcast %struct.HIP_vector_type addrspace(1)* %132 to i8 addrspace(1)*
  %134 = bitcast %struct.HIP_vector_type addrspace(1)* %71 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %133, i8 addrspace(1)* noundef align 4 dereferenceable(12) %134, i64 12, i1 false)
  %135 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %131, i64 %54, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0.000000e+00, float addrspace(1)* %135, align 4, !tbaa !20
  %136 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %131, i64 %70
  %137 = bitcast %struct.HIP_vector_type addrspace(1)* %136 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %137, i8 addrspace(1)* noundef align 4 dereferenceable(12) %103, i64 12, i1 false)
  %138 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %131, i64 %70, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0.000000e+00, float addrspace(1)* %138, align 4, !tbaa !20
  %139 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %131, i64 %79
  %140 = bitcast %struct.HIP_vector_type addrspace(1)* %139 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %140, i8 addrspace(1)* noundef align 4 dereferenceable(12) %103, i64 12, i1 false)
  %141 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %131, i64 %90
  %142 = bitcast %struct.HIP_vector_type addrspace(1)* %141 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %142, i8 addrspace(1)* noundef align 4 dereferenceable(12) %134, i64 12, i1 false)
  %143 = mul nsw i32 %27, 48
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %5, i64 %144
  %146 = bitcast float addrspace(1)* %145 to %struct.HIP_vector_type addrspace(1)*
  %147 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %146, i64 %54
  %148 = bitcast %struct.HIP_vector_type addrspace(1)* %147 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %148, i8 addrspace(1)* noundef align 4 dereferenceable(12) %119, i64 12, i1 false)
  %149 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %146, i64 %54, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0.000000e+00, float addrspace(1)* %149, align 4, !tbaa !20
  %150 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %146, i64 %70
  %151 = bitcast %struct.HIP_vector_type addrspace(1)* %150 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %151, i8 addrspace(1)* noundef align 4 dereferenceable(12) %119, i64 12, i1 false)
  %152 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %146, i64 %79
  %153 = bitcast %struct.HIP_vector_type addrspace(1)* %152 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %153, i8 addrspace(1)* noundef align 4 dereferenceable(12) %134, i64 12, i1 false)
  %154 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %146, i64 %90
  %155 = bitcast %struct.HIP_vector_type addrspace(1)* %154 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %155, i8 addrspace(1)* noundef align 4 dereferenceable(12) %134, i64 12, i1 false)
  %156 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %146, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0.000000e+00, float addrspace(1)* %156, align 4, !tbaa !20
  br label %157

157:                                              ; preds = %39, %6
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

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }

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
!20 = !{!18, !18, i64 0}
