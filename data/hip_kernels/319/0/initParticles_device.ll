; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/319/0/initParticles.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/319/0/initParticles.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i16> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z13initParticlesP15HIP_vector_typeItLj4EEPjS2_j(%struct.HIP_vector_type addrspace(1)* noalias nocapture writeonly %0, i32 addrspace(1)* noalias nocapture writeonly %1, i32 addrspace(1)* noalias nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp ugt i32 %13, %3
  br i1 %14, label %33, label %15

15:                                               ; preds = %4
  %16 = zext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %16
  store i32 %13, i32 addrspace(1)* %17, align 4, !tbaa !7
  %18 = lshr i32 %13, 16
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 0
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 1
  store i16 0, i16 addrspace(1)* %20, align 2
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 2
  %22 = insertelement <2 x i32> poison, i32 %13, i64 0
  %23 = insertelement <2 x i32> %22, i32 %18, i64 1
  %24 = trunc <2 x i32> %23 to <2 x i16>
  %25 = extractelement <2 x i16> %24, i64 0
  %26 = and i16 %25, 3
  store i16 %26, i16 addrspace(1)* %19, align 8
  %27 = bitcast i16 addrspace(1)* %21 to <2 x i16> addrspace(1)*
  store <2 x i16> %24, <2 x i16> addrspace(1)* %27, align 4
  %28 = udiv i32 %13, 17
  %29 = and i32 %13, 17
  %30 = urem i32 %13, %29
  %31 = add nuw nsw i32 %30, %28
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  store i32 %31, i32 addrspace(1)* %32, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %4, %15
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
