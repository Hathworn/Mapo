; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/55/rectified_linear_backprop_upd_kernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/55/rectified_linear_backprop_upd_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z36rectified_linear_backprop_upd_kernelP15HIP_vector_typeIfLj4EEPKS0_PKS_IjLj4EEfbi(%struct.HIP_vector_type addrspace(1)* noalias nocapture %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, %struct.HIP_vector_type.0 addrspace(1)* noalias nocapture readonly %2, float %3, i1 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %5
  br i1 %16, label %17, label %77

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 0
  %20 = load float, float addrspace(1)* %19, align 16, !amdgpu.noclobber !5
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 1
  %22 = load float, float addrspace(1)* %21, align 4, !amdgpu.noclobber !5
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 2
  %24 = load float, float addrspace(1)* %23, align 8, !amdgpu.noclobber !5
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 3
  %26 = load float, float addrspace(1)* %25, align 4, !amdgpu.noclobber !5
  %27 = ashr i32 %15, 5
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 0
  %30 = load i32, i32 addrspace(1)* %29, align 16, !amdgpu.noclobber !5
  %31 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 1
  %32 = load i32, i32 addrspace(1)* %31, align 4, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 2
  %34 = load i32, i32 addrspace(1)* %33, align 8, !amdgpu.noclobber !5
  %35 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 3
  %36 = load i32, i32 addrspace(1)* %35, align 4, !amdgpu.noclobber !5
  %37 = and i32 %15, 31
  %38 = shl nuw i32 1, %37
  %39 = and i32 %30, %38
  %40 = icmp eq i32 %39, 0
  %41 = select i1 %40, float %3, float 1.000000e+00
  %42 = fmul contract float %20, %41
  %43 = and i32 %32, %38
  %44 = icmp eq i32 %43, 0
  %45 = select i1 %44, float %3, float 1.000000e+00
  %46 = fmul contract float %22, %45
  %47 = and i32 %34, %38
  %48 = icmp eq i32 %47, 0
  %49 = select i1 %48, float %3, float 1.000000e+00
  %50 = fmul contract float %24, %49
  %51 = and i32 %36, %38
  %52 = icmp eq i32 %51, 0
  %53 = select i1 %52, float %3, float 1.000000e+00
  %54 = fmul contract float %26, %53
  br i1 %4, label %55, label %68

55:                                               ; preds = %17
  %56 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 0
  %57 = load float, float addrspace(1)* %56, align 16, !amdgpu.noclobber !5
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 1
  %59 = load float, float addrspace(1)* %58, align 4, !amdgpu.noclobber !5
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 2
  %61 = load float, float addrspace(1)* %60, align 8, !amdgpu.noclobber !5
  %62 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 3
  %63 = load float, float addrspace(1)* %62, align 4, !amdgpu.noclobber !5
  %64 = fadd contract float %42, %57
  %65 = fadd contract float %46, %59
  %66 = fadd contract float %50, %61
  %67 = fadd contract float %54, %63
  br label %68

68:                                               ; preds = %55, %17
  %69 = phi float [ %64, %55 ], [ %42, %17 ]
  %70 = phi float [ %65, %55 ], [ %46, %17 ]
  %71 = phi float [ %66, %55 ], [ %50, %17 ]
  %72 = phi float [ %67, %55 ], [ %54, %17 ]
  %73 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 0
  store float %69, float addrspace(1)* %73, align 16
  %74 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 1
  store float %70, float addrspace(1)* %74, align 4
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 2
  store float %71, float addrspace(1)* %75, align 8
  %76 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 3
  store float %72, float addrspace(1)* %76, align 4
  br label %77

77:                                               ; preds = %68, %6
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
