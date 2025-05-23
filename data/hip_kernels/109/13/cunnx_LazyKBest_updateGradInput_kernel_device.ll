; ModuleID = '../data/hip_kernels/109/13/main.cu'
source_filename = "../data/hip_kernels/109/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z38cunnx_LazyKBest_updateGradInput_kernelPfPKfS1_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul nsw i32 %12, %3
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = mul nsw i32 %12, %4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %20 = icmp slt i32 %6, %4
  br i1 %20, label %22, label %21

21:                                               ; preds = %22, %5
  ret void

22:                                               ; preds = %5, %22
  %23 = phi i32 [ %33, %22 ], [ %6, %5 ]
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %18, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %27 = getelementptr inbounds float, float addrspace(1)* %19, i64 %24
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %29 = fadd contract float %28, -1.000000e+00
  %30 = fptosi float %29 to i32
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %15, i64 %31
  store float %26, float addrspace(1)* %32, align 4, !tbaa !7
  %33 = add nuw nsw i32 %23, %11
  %34 = icmp slt i32 %33, %4
  br i1 %34, label %22, label %21, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
