; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/92/absolute_deriviative_upd_kernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/92/absolute_deriviative_upd_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z31absolute_deriviative_upd_kernelP15HIP_vector_typeIfLj4EEPKS0_S3_bi(%struct.HIP_vector_type addrspace(1)* noalias nocapture %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %2, i1 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %15
  %22 = add i32 %21, %14
  %23 = mul i32 %22, %10
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %4
  br i1 %26, label %27, label %79

27:                                               ; preds = %5
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 0
  %30 = load float, float addrspace(1)* %29, align 16, !amdgpu.noclobber !5
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 1
  %32 = load float, float addrspace(1)* %31, align 4, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 2
  %34 = load float, float addrspace(1)* %33, align 8, !amdgpu.noclobber !5
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 3
  %36 = load float, float addrspace(1)* %35, align 4, !amdgpu.noclobber !5
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i64 0
  %38 = load float, float addrspace(1)* %37, align 16, !amdgpu.noclobber !5
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i64 1
  %40 = load float, float addrspace(1)* %39, align 4, !amdgpu.noclobber !5
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i64 2
  %42 = load float, float addrspace(1)* %41, align 8, !amdgpu.noclobber !5
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i64 3
  %44 = load float, float addrspace(1)* %43, align 4, !amdgpu.noclobber !5
  %45 = fcmp contract olt float %30, 0.000000e+00
  %46 = fneg contract float %38
  %47 = select i1 %45, float %46, float %38
  %48 = fcmp contract olt float %32, 0.000000e+00
  %49 = fneg contract float %40
  %50 = select i1 %48, float %49, float %40
  %51 = fcmp contract olt float %34, 0.000000e+00
  %52 = fneg contract float %42
  %53 = select i1 %51, float %52, float %42
  %54 = fcmp contract olt float %36, 0.000000e+00
  %55 = fneg contract float %44
  %56 = select i1 %54, float %55, float %44
  br i1 %3, label %57, label %70

57:                                               ; preds = %27
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i64 0
  %59 = load float, float addrspace(1)* %58, align 16, !amdgpu.noclobber !5
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i64 1
  %61 = load float, float addrspace(1)* %60, align 4, !amdgpu.noclobber !5
  %62 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i64 2
  %63 = load float, float addrspace(1)* %62, align 8, !amdgpu.noclobber !5
  %64 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i64 3
  %65 = load float, float addrspace(1)* %64, align 4, !amdgpu.noclobber !5
  %66 = fadd contract float %47, %59
  %67 = fadd contract float %50, %61
  %68 = fadd contract float %53, %63
  %69 = fadd contract float %56, %65
  br label %70

70:                                               ; preds = %57, %27
  %71 = phi float [ %66, %57 ], [ %47, %27 ]
  %72 = phi float [ %67, %57 ], [ %50, %27 ]
  %73 = phi float [ %68, %57 ], [ %53, %27 ]
  %74 = phi float [ %69, %57 ], [ %56, %27 ]
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i64 0
  store float %71, float addrspace(1)* %75, align 16
  %76 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i64 1
  store float %72, float addrspace(1)* %76, align 4
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i64 2
  store float %73, float addrspace(1)* %77, align 8
  %78 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i64 3
  store float %74, float addrspace(1)* %78, align 4
  br label %79

79:                                               ; preds = %70, %5
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
