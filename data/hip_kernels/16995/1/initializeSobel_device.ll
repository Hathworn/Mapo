; ModuleID = '../data/hip_kernels/16995/1/main.cu'
source_filename = "../data/hip_kernels/16995/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z15initializeSobelPfS_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %5 = icmp ult i32 %3, 5
  %6 = icmp ult i32 %4, 5
  %7 = select i1 %5, i1 %6, i1 false
  br i1 %7, label %8, label %33

8:                                                ; preds = %2
  %9 = mul nuw nsw i32 %4, 5
  %10 = add nuw nsw i32 %9, %3
  %11 = add nsw i32 %3, -2
  %12 = sitofp i32 %11 to float
  %13 = add nsw i32 %4, -2
  %14 = sitofp i32 %13 to float
  %15 = fmul contract float %12, %12
  %16 = fmul contract float %14, %14
  %17 = fadd contract float %15, %16
  %18 = fcmp contract oeq float %17, 0.000000e+00
  br i1 %18, label %19, label %22

19:                                               ; preds = %8
  %20 = zext i32 %10 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  store float 0.000000e+00, float addrspace(1)* %21, align 4, !tbaa !5
  br label %29

22:                                               ; preds = %8
  %23 = fmul contract float %12, 2.000000e+00
  %24 = fdiv contract float %23, %17
  %25 = zext i32 %10 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  store float %24, float addrspace(1)* %26, align 4, !tbaa !5
  %27 = fmul contract float %14, 2.000000e+00
  %28 = fdiv contract float %27, %17
  br label %29

29:                                               ; preds = %22, %19
  %30 = phi i64 [ %20, %19 ], [ %25, %22 ]
  %31 = phi float [ 0.000000e+00, %19 ], [ %28, %22 ]
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  store float %31, float addrspace(1)* %32, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %29, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
