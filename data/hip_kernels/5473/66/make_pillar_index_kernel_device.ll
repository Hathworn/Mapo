; ModuleID = '../data/hip_kernels/5473/66/main.cu'
source_filename = "../data/hip_kernels/5473/66/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z24make_pillar_index_kernelPiS_S_S_S_PfS0_S0_S_iiiffi(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10, i32 %11, float %12, float %13, i32 %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = mul nsw i32 %17, %11
  %19 = add nsw i32 %18, %16
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %47, label %24

24:                                               ; preds = %15
  %25 = atomicrmw add i32 addrspace(1)* %1, i32 1 syncscope("agent-one-as") monotonic, align 4
  %26 = icmp slt i32 %25, %9
  br i1 %26, label %27, label %47

27:                                               ; preds = %24
  %28 = atomicrmw add i32 addrspace(1)* %2, i32 1 syncscope("agent-one-as") monotonic, align 4
  %29 = sext i32 %25 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %7, i64 %29
  %31 = tail call i32 @llvm.smin.i32(i32 %22, i32 %10)
  %32 = sitofp i32 %31 to float
  store float %32, float addrspace(1)* %30, align 4, !tbaa !10
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %29
  store i32 %16, i32 addrspace(1)* %33, align 4, !tbaa !5
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %29
  store i32 %17, i32 addrspace(1)* %34, align 4, !tbaa !5
  %35 = sitofp i32 %16 to float
  %36 = fmul contract float %35, %12
  %37 = fadd contract float %36, 0x3FB99999A0000000
  %38 = getelementptr inbounds float, float addrspace(1)* %5, i64 %29
  store float %37, float addrspace(1)* %38, align 4, !tbaa !10
  %39 = sitofp i32 %17 to float
  %40 = fmul contract float %39, %13
  %41 = fadd contract float %40, 0xC043F33340000000
  %42 = getelementptr inbounds float, float addrspace(1)* %6, i64 %29
  store float %41, float addrspace(1)* %42, align 4, !tbaa !10
  %43 = mul nsw i32 %17, %14
  %44 = add nsw i32 %43, %16
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %45
  store i32 1, i32 addrspace(1)* %46, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %24, %27, %15
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!"float", !7, i64 0}
