; ModuleID = '../data/hip_kernels/3367/3/main.cu'
source_filename = "../data/hip_kernels/3367/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7kUpdateiPfS_(i32 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %0
  br i1 %13, label %14, label %56

14:                                               ; preds = %3
  %15 = mul nsw i32 %0, 5
  %16 = add nsw i32 %12, %15
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = fptosi float %19 to i32
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %56, label %22

22:                                               ; preds = %14
  %23 = shl nsw i32 %0, 2
  %24 = mul nsw i32 %0, 3
  %25 = shl nsw i32 %0, 1
  %26 = sext i32 %12 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = sitofp i32 %20 to float
  %30 = fdiv contract float %28, %29
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %30, float addrspace(1)* %31, align 4, !tbaa !7
  %32 = add nsw i32 %12, %0
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = fdiv contract float %35, %29
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  store float %36, float addrspace(1)* %37, align 4, !tbaa !7
  %38 = add nsw i32 %12, %25
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = fdiv contract float %41, %29
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  store float %42, float addrspace(1)* %43, align 4, !tbaa !7
  %44 = add nsw i32 %12, %24
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = fdiv contract float %47, %29
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  store float %48, float addrspace(1)* %49, align 4, !tbaa !7
  %50 = add nsw i32 %12, %23
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fdiv contract float %53, %29
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  store float %54, float addrspace(1)* %55, align 4, !tbaa !7
  store float 0.000000e+00, float addrspace(1)* %27, align 4, !tbaa !7
  store float 0.000000e+00, float addrspace(1)* %34, align 4, !tbaa !7
  store float 0.000000e+00, float addrspace(1)* %40, align 4, !tbaa !7
  store float 0.000000e+00, float addrspace(1)* %46, align 4, !tbaa !7
  store float 0.000000e+00, float addrspace(1)* %52, align 4, !tbaa !7
  store float 0.000000e+00, float addrspace(1)* %18, align 4, !tbaa !7
  br label %56

56:                                               ; preds = %14, %22, %3
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
