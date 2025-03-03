; ModuleID = '../data/hip_kernels/3524/2/main.cu'
source_filename = "../data/hip_kernels/3524/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10moveBodiesP15HIP_vector_typeIfLj4EES1_PS_IfLj3EES3_i(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture %1, %struct.HIP_vector_type.0 addrspace(1)* nocapture %2, %struct.HIP_vector_type.0 addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, 4096
  br i1 %15, label %16, label %88

16:                                               ; preds = %5
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %17, i32 0, i32 0, i32 0, i32 0, i64 0
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = fpext float %19 to double
  %21 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %17, i32 0, i32 0, i32 0, i32 0, i64 0
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = fpext float %22 to double
  %24 = fsub contract double %20, %23
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %17, i32 0, i32 0, i32 0, i64 3
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = fpext float %26 to double
  %28 = fdiv contract double %24, %27
  %29 = fmul contract double %28, 1.000000e-03
  %30 = fadd contract double %29, %23
  %31 = fptrunc double %30 to float
  store float %31, float addrspace(1)* %21, align 4, !tbaa !7
  %32 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %17, i32 0, i32 0, i32 0, i32 0, i64 1
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = fpext float %33 to double
  %35 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %17, i32 0, i32 0, i32 0, i32 0, i64 1
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = fpext float %36 to double
  %38 = fsub contract double %34, %37
  %39 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %40 = fpext float %39 to double
  %41 = fdiv contract double %38, %40
  %42 = fmul contract double %41, 1.000000e-03
  %43 = fadd contract double %42, %37
  %44 = fptrunc double %43 to float
  store float %44, float addrspace(1)* %35, align 4, !tbaa !7
  %45 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %17, i32 0, i32 0, i32 0, i32 0, i64 2
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fpext float %46 to double
  %48 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %17, i32 0, i32 0, i32 0, i32 0, i64 2
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = fpext float %49 to double
  %51 = fsub contract double %47, %50
  %52 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %53 = fpext float %52 to double
  %54 = fdiv contract double %51, %53
  %55 = fmul contract double %54, 1.000000e-03
  %56 = fadd contract double %55, %50
  %57 = fptrunc double %56 to float
  store float %57, float addrspace(1)* %48, align 4, !tbaa !7
  %58 = fpext float %31 to double
  %59 = fmul contract double %58, 1.000000e-03
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %17, i32 0, i32 0, i32 0, i64 0
  %61 = load float, float addrspace(1)* %60, align 16, !tbaa !7
  %62 = fpext float %61 to double
  %63 = fadd contract double %59, %62
  %64 = fptrunc double %63 to float
  store float %64, float addrspace(1)* %60, align 16, !tbaa !7
  %65 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %66 = fpext float %65 to double
  %67 = fmul contract double %66, 1.000000e-03
  %68 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %17, i32 0, i32 0, i32 0, i64 1
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fpext float %69 to double
  %71 = fadd contract double %67, %70
  %72 = fptrunc double %71 to float
  store float %72, float addrspace(1)* %68, align 4, !tbaa !7
  %73 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %74 = fpext float %73 to double
  %75 = fmul contract double %74, 1.000000e-03
  %76 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %17, i32 0, i32 0, i32 0, i64 2
  %77 = load float, float addrspace(1)* %76, align 8, !tbaa !7
  %78 = fpext float %77 to double
  %79 = fadd contract double %75, %78
  %80 = fptrunc double %79 to float
  store float %80, float addrspace(1)* %76, align 8, !tbaa !7
  %81 = add nsw i32 %14, %4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %82, i32 0, i32 0, i32 0, i64 0
  store float %64, float addrspace(1)* %83, align 16, !tbaa !7
  %84 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %85 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %82, i32 0, i32 0, i32 0, i64 1
  store float %84, float addrspace(1)* %85, align 4, !tbaa !7
  %86 = load float, float addrspace(1)* %76, align 8, !tbaa !7
  %87 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %82, i32 0, i32 0, i32 0, i64 2
  store float %86, float addrspace(1)* %87, align 8, !tbaa !7
  br label %88

88:                                               ; preds = %16, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
