; ModuleID = '../data/hip_kernels/17143/1/main.cu'
source_filename = "../data/hip_kernels/17143/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18processQueueKernelPiPdPKiS2_S2_PKd(i32 addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %8
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %11
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = getelementptr inbounds double, double addrspace(1)* %5, i64 %11
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !10, !amdgpu.noclobber !9
  %18 = sext i32 %13 to i64
  %19 = getelementptr inbounds double, double addrspace(1)* %1, i64 %18
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !10, !amdgpu.noclobber !9
  %21 = fadd contract double %17, %20
  %22 = sext i32 %15 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !10, !amdgpu.noclobber !9
  %25 = fcmp contract olt double %21, %24
  br i1 %25, label %26, label %28

26:                                               ; preds = %6
  store double %21, double addrspace(1)* %23, align 8, !tbaa !10
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  store i32 %13, i32 addrspace(1)* %27, align 4, !tbaa !5
  br label %28

28:                                               ; preds = %26, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"double", !7, i64 0}
