; ModuleID = '../data/hip_kernels/7/17/main.cu'
source_filename = "../data/hip_kernels/7/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16perturbPositionsPfP15HIP_vector_typeIfLj4EEfPiiii(float addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture %1, float %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %4
  br i1 %17, label %18, label %63

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = mul nsw i32 %21, 3
  %23 = add nsw i32 %22, %5
  %24 = freeze i32 %23
  %25 = sdiv i32 %24, 3
  %26 = icmp slt i32 %25, %6
  br i1 %26, label %27, label %63

27:                                               ; preds = %18
  %28 = add nsw i32 %4, -1
  %29 = icmp eq i32 %16, %28
  br i1 %29, label %36, label %30

30:                                               ; preds = %27
  %31 = add nsw i32 %16, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = icmp slt i32 %25, %34
  br i1 %35, label %36, label %63

36:                                               ; preds = %30, %27
  %37 = mul i32 %25, 3
  %38 = sub i32 %24, %37
  switch i32 %38, label %55 [
    i32 0, label %39
    i32 1, label %47
  ]

39:                                               ; preds = %36
  %40 = sext i32 %25 to i64
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %40, i32 0, i32 0, i32 0, i64 0
  %42 = load float, float addrspace(1)* %41, align 16, !tbaa !11, !amdgpu.noclobber !5
  %43 = sext i32 %23 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  store float %42, float addrspace(1)* %44, align 4, !tbaa !12
  %45 = load float, float addrspace(1)* %41, align 16, !tbaa !11
  %46 = fadd contract float %45, %2
  store float %46, float addrspace(1)* %41, align 16, !tbaa !11
  br label %63

47:                                               ; preds = %36
  %48 = sext i32 %25 to i64
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %48, i32 0, i32 0, i32 0, i64 1
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !11, !amdgpu.noclobber !5
  %51 = sext i32 %23 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  store float %50, float addrspace(1)* %52, align 4, !tbaa !12
  %53 = load float, float addrspace(1)* %49, align 4, !tbaa !11
  %54 = fadd contract float %53, %2
  store float %54, float addrspace(1)* %49, align 4, !tbaa !11
  br label %63

55:                                               ; preds = %36
  %56 = sext i32 %25 to i64
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %56, i32 0, i32 0, i32 0, i64 2
  %58 = load float, float addrspace(1)* %57, align 8, !tbaa !11, !amdgpu.noclobber !5
  %59 = sext i32 %23 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  store float %58, float addrspace(1)* %60, align 4, !tbaa !12
  %61 = load float, float addrspace(1)* %57, align 8, !tbaa !11
  %62 = fadd contract float %61, %2
  store float %62, float addrspace(1)* %57, align 8, !tbaa !11
  br label %63

63:                                               ; preds = %30, %18, %47, %55, %39, %7
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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !9, i64 0}
