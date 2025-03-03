; ModuleID = '../data/hip_kernels/3557/19/main.cu'
source_filename = "../data/hip_kernels/3557/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23cudaNoConversion_kernelPfS_S_fjjj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture %2, float %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = mul i32 %5, %4
  %9 = mul i32 %8, %6
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = icmp ult i32 %12, %9
  br i1 %13, label %14, label %20

14:                                               ; preds = %7
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  br label %21

20:                                               ; preds = %21, %7
  ret void

21:                                               ; preds = %14, %21
  %22 = phi i32 [ %12, %14 ], [ %32, %21 ]
  %23 = add i32 %22, %11
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %27 = fmul contract float %26, %3
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  store float %27, float addrspace(1)* %28, align 4, !tbaa !7
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %31 = fadd contract float %27, %30
  store float %31, float addrspace(1)* %29, align 4, !tbaa !7
  %32 = add i32 %22, %19
  %33 = icmp ult i32 %32, %9
  br i1 %33, label %21, label %20, !llvm.loop !11
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
