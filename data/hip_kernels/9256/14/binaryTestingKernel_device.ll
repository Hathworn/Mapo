; ModuleID = '../data/hip_kernels/9256/14/main.cu'
source_filename = "../data/hip_kernels/9256/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19binaryTestingKerneliiPfS_Pi(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul nsw i32 %6, %1
  %8 = add nsw i32 %7, %0
  %9 = add nsw i32 %8, %1
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %12, %5
  ret void

12:                                               ; preds = %5, %12
  %13 = phi i32 [ %28, %12 ], [ %8, %5 ]
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %2, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !4, !amdgpu.noclobber !8
  %17 = getelementptr inbounds float, float addrspace(1)* %3, i64 %14
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !4, !amdgpu.noclobber !8
  %19 = fcmp contract olt float %16, 5.000000e-01
  %20 = fcmp contract oeq float %18, 0.000000e+00
  %21 = select i1 %19, i1 %20, i1 false
  %22 = fcmp contract oge float %16, 5.000000e-01
  %23 = fcmp contract oeq float %18, 1.000000e+00
  %24 = select i1 %22, i1 %23, i1 false
  %25 = select i1 %21, i1 true, i1 %24
  %26 = zext i1 %25 to i32
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %14
  store i32 %26, i32 addrspace(1)* %27, align 4, !tbaa !9
  %28 = add nsw i32 %13, 1
  %29 = icmp slt i32 %28, %9
  br i1 %29, label %12, label %11, !llvm.loop !11
}

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
