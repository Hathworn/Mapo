; ModuleID = '../data/hip_kernels/7745/0/main.cu'
source_filename = "../data/hip_kernels/7745/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19calc_entropy_atomicE3sum = internal addrspace(3) global float undef, align 4
@_ZZ19calc_entropy_atomicE7entropy = internal addrspace(3) global float undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @calc_entropy_atomic(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp eq i32 %4, 0
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %7 = icmp eq i32 %6, 0
  %8 = select i1 %5, i1 %7, i1 false
  br i1 %8, label %9, label %10

9:                                                ; preds = %3
  store float 0.000000e+00, float addrspace(3)* @_ZZ19calc_entropy_atomicE3sum, align 4, !tbaa !5
  br label %10

10:                                               ; preds = %9, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %11 = mul nsw i32 %2, %2
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !9
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !18, !invariant.load !19
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !18, !invariant.load !19
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = add i32 %31, %6
  %33 = mul i32 %32, %24
  %34 = add i32 %33, %25
  %35 = mul i32 %34, %19
  %36 = add i32 %35, %4
  %37 = mul i32 %24, %26
  %38 = add i32 %37, %25
  %39 = sext i32 %36 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5
  %42 = fmul contract float %41, %41
  %43 = sitofp i32 %11 to float
  %44 = fdiv contract float %42, %43
  store float %44, float addrspace(1)* %40, align 4, !tbaa !5
  %45 = atomicrmw fadd float addrspace(3)* @_ZZ19calc_entropy_atomicE3sum, float %44 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %8, label %46, label %47

46:                                               ; preds = %10
  store float 0.000000e+00, float addrspace(3)* @_ZZ19calc_entropy_atomicE7entropy, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %46, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = load float, float addrspace(1)* %40, align 4, !tbaa !5
  %49 = load float, float addrspace(3)* @_ZZ19calc_entropy_atomicE3sum, align 4, !tbaa !5
  %50 = fdiv contract float %48, %49
  store float %50, float addrspace(1)* %40, align 4, !tbaa !5
  %51 = fneg contract float %50
  %52 = tail call i1 @llvm.amdgcn.class.f32(float %50, i32 144)
  %53 = select i1 %52, float 0x41F0000000000000, float 1.000000e+00
  %54 = fmul float %50, %53
  %55 = tail call float @llvm.log2.f32(float %54)
  %56 = select i1 %52, float 3.200000e+01, float 0.000000e+00
  %57 = fsub float %55, %56
  %58 = fmul contract float %57, %51
  %59 = atomicrmw fadd float addrspace(3)* @_ZZ19calc_entropy_atomicE7entropy, float %58 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %8, label %60, label %64

60:                                               ; preds = %47
  %61 = load float, float addrspace(3)* @_ZZ19calc_entropy_atomicE7entropy, align 4, !tbaa !5
  %62 = sext i32 %38 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  store float %61, float addrspace(1)* %63, align 4, !tbaa !5
  br label %64

64:                                               ; preds = %60, %47
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{!10, !14, i64 12}
!10 = !{!"hsa_kernel_dispatch_packet_s", !11, i64 0, !11, i64 2, !11, i64 4, !11, i64 6, !11, i64 8, !11, i64 10, !14, i64 12, !14, i64 16, !14, i64 20, !14, i64 24, !14, i64 28, !15, i64 32, !16, i64 40, !15, i64 48, !17, i64 56}
!11 = !{!"short", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!"int", !12, i64 0}
!15 = !{!"long", !12, i64 0}
!16 = !{!"any pointer", !12, i64 0}
!17 = !{!"hsa_signal_s", !15, i64 0}
!18 = !{i16 1, i16 1025}
!19 = !{}
