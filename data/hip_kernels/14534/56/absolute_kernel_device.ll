; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/56/absolute_kernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/56/absolute_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15absolute_kernelP15HIP_vector_typeIfLj4EEPKS0_i(%struct.HIP_vector_type addrspace(1)* noalias nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = udiv i32 %11, %8
  %15 = mul i32 %14, %8
  %16 = icmp ugt i32 %11, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %13
  %20 = add i32 %19, %12
  %21 = mul i32 %20, %8
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %23, %2
  br i1 %24, label %25, label %43

25:                                               ; preds = %3
  %26 = sext i32 %23 to i64
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %26, i32 0, i32 0, i32 0, i64 0
  %28 = load float, float addrspace(1)* %27, align 16, !amdgpu.noclobber !5
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %26, i32 0, i32 0, i32 0, i64 1
  %30 = load float, float addrspace(1)* %29, align 4, !amdgpu.noclobber !5
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %26, i32 0, i32 0, i32 0, i64 2
  %32 = load float, float addrspace(1)* %31, align 8, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %26, i32 0, i32 0, i32 0, i64 3
  %34 = load float, float addrspace(1)* %33, align 4, !amdgpu.noclobber !5
  %35 = tail call float @llvm.fabs.f32(float %28)
  %36 = tail call float @llvm.fabs.f32(float %30)
  %37 = tail call float @llvm.fabs.f32(float %32)
  %38 = tail call float @llvm.fabs.f32(float %34)
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %26, i32 0, i32 0, i32 0, i64 0
  store float %35, float addrspace(1)* %39, align 16
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %26, i32 0, i32 0, i32 0, i64 1
  store float %36, float addrspace(1)* %40, align 4
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %26, i32 0, i32 0, i32 0, i64 2
  store float %37, float addrspace(1)* %41, align 8
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %26, i32 0, i32 0, i32 0, i64 3
  store float %38, float addrspace(1)* %42, align 4
  br label %43

43:                                               ; preds = %25, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
