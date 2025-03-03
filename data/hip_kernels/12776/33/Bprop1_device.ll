; ModuleID = '../data/hip_kernels/12776/33/main.cu'
source_filename = "../data/hip_kernels/12776/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z6Bprop1PKfS0_S0_S0_PfS1_S1_f(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = mul i32 %14, %13
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = shl nsw i32 %17, 8
  %21 = add nsw i32 %20, %18
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %4, i64 %22
  %24 = shl nsw i32 %19, 8
  %25 = add nsw i32 %24, %18
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = shl nsw i32 %19, 6
  %30 = add nsw i32 %17, %29
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %3, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fmul contract float %28, %33
  %35 = fmul contract float %34, %7
  %36 = atomicrmw fadd float addrspace(1)* %23, float %35 syncscope("agent-one-as") monotonic, align 4
  %37 = getelementptr inbounds float, float addrspace(1)* %5, i64 %22
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7
  %40 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %41 = fmul contract float %39, %40
  %42 = fmul contract float %41, %7
  %43 = atomicrmw fadd float addrspace(1)* %37, float %42 syncscope("agent-one-as") monotonic, align 4
  %44 = getelementptr inbounds float, float addrspace(1)* %6, i64 %22
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %48 = fmul contract float %46, %47
  %49 = fmul contract float %48, %7
  %50 = atomicrmw fadd float addrspace(1)* %44, float %49 syncscope("agent-one-as") monotonic, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
