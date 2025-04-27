; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/10455/3/DiffusionJacobi.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/10455/3/DiffusionJacobi.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15DiffusionJacobiP15HIP_vector_typeIfLj2EES1_S1_fffjj(%struct.HIP_vector_type addrspace(1)* noalias nocapture readnone %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* noalias nocapture writeonly %2, float %3, float %4, float %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = mul i32 %25, %6
  %27 = add i32 %26, %17
  %28 = zext i32 %27 to i64
  %29 = fmul contract float %4, %4
  %30 = fmul contract float %3, %5
  %31 = fdiv contract float %29, %30
  %32 = icmp eq i32 %17, 0
  %33 = icmp eq i32 %25, 0
  %34 = select i1 %32, i1 true, i1 %33
  %35 = add i32 %6, -1
  %36 = icmp eq i32 %17, %35
  %37 = select i1 %34, i1 true, i1 %36
  %38 = add i32 %7, -1
  %39 = icmp eq i32 %25, %38
  %40 = select i1 %37, i1 true, i1 %39
  br i1 %40, label %89, label %41

41:                                               ; preds = %8
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i64 1
  %43 = load float, float addrspace(1)* %42, align 4
  %44 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i64 0
  %45 = load float, float addrspace(1)* %44, align 8
  %46 = add i32 %25, -1
  %47 = mul i32 %46, %6
  %48 = add i32 %47, %17
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %49, i32 0, i32 0, i32 0, i64 0
  %51 = load float, float addrspace(1)* %50, align 8
  %52 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %49, i32 0, i32 0, i32 0, i64 1
  %53 = load float, float addrspace(1)* %52, align 4
  %54 = add i32 %27, -1
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %55, i32 0, i32 0, i32 0, i64 0
  %57 = load float, float addrspace(1)* %56, align 8
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %55, i32 0, i32 0, i32 0, i64 1
  %59 = load float, float addrspace(1)* %58, align 4
  %60 = add i32 %25, 1
  %61 = mul i32 %60, %6
  %62 = add i32 %61, %17
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %63, i32 0, i32 0, i32 0, i64 0
  %65 = load float, float addrspace(1)* %64, align 8
  %66 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %63, i32 0, i32 0, i32 0, i64 1
  %67 = load float, float addrspace(1)* %66, align 4
  %68 = add i32 %27, 1
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %69, i32 0, i32 0, i32 0, i64 0
  %71 = load float, float addrspace(1)* %70, align 8
  %72 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %69, i32 0, i32 0, i32 0, i64 1
  %73 = load float, float addrspace(1)* %72, align 4
  %74 = fadd contract float %51, %57
  %75 = fadd contract float %74, %65
  %76 = fadd contract float %75, %71
  %77 = fmul contract float %31, %45
  %78 = fadd contract float %77, %76
  %79 = fadd contract float %31, 4.000000e+00
  %80 = fdiv contract float %78, %79
  %81 = fadd contract float %53, %59
  %82 = fadd contract float %81, %67
  %83 = fadd contract float %82, %73
  %84 = fmul contract float %31, %43
  %85 = fadd contract float %84, %83
  %86 = fdiv contract float %85, %79
  %87 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 0
  store float %80, float addrspace(1)* %87, align 8
  %88 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 1
  store float %86, float addrspace(1)* %88, align 4
  br label %89

89:                                               ; preds = %41, %8
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
!6 = !{i32 0, i32 1024}
