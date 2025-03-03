; ModuleID = '../data/hip_kernels/12709/15/main.cu'
source_filename = "../data/hip_kernels/12709/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6cal_piPfifii(float addrspace(1)* nocapture %0, i32 %1, float %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %1
  br i1 %15, label %16, label %39

16:                                               ; preds = %5
  %17 = fpext float %2 to double
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = mul nsw i32 %4, %3
  %21 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  br label %22

22:                                               ; preds = %16, %22
  %23 = phi float [ %21, %16 ], [ %35, %22 ]
  %24 = phi i32 [ %14, %16 ], [ %36, %22 ]
  %25 = sitofp i32 %24 to double
  %26 = fadd contract double %25, 5.000000e-01
  %27 = fmul contract double %26, %17
  %28 = fptrunc double %27 to float
  %29 = fmul contract float %28, %28
  %30 = fpext float %29 to double
  %31 = fadd contract double %30, 1.000000e+00
  %32 = fdiv contract double 4.000000e+00, %31
  %33 = fpext float %23 to double
  %34 = fadd contract double %32, %33
  %35 = fptrunc double %34 to float
  %36 = add nsw i32 %24, %20
  %37 = icmp slt i32 %36, %1
  br i1 %37, label %22, label %38, !llvm.loop !11

38:                                               ; preds = %22
  store float %35, float addrspace(1)* %19, align 4, !tbaa !7
  br label %39

39:                                               ; preds = %38, %5
  ret void
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
