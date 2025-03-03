; ModuleID = '../data/hip_kernels/3916/42/main.cu'
source_filename = "../data/hip_kernels/3916/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20softmax_x_ent_kerneliPfS_S_S_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = add i32 %21, %6
  %23 = mul i32 %22, %15
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %0
  br i1 %26, label %27, label %54

27:                                               ; preds = %5
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !14
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !14
  %33 = fcmp contract une float %30, 0.000000e+00
  br i1 %33, label %34, label %49

34:                                               ; preds = %27
  %35 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 144)
  %36 = select i1 %35, float 0x41F0000000000000, float 1.000000e+00
  %37 = fmul float %32, %36
  %38 = tail call float @llvm.log2.f32(float %37)
  %39 = fmul float %38, 0x3FE62E42E0000000
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 519)
  %41 = fneg float %39
  %42 = tail call float @llvm.fma.f32(float %38, float 0x3FE62E42E0000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %38, float 0x3E6EFA39E0000000, float %42)
  %44 = fadd float %39, %43
  %45 = select i1 %40, float %38, float %44
  %46 = select i1 %35, float 0x40362E4300000000, float 0.000000e+00
  %47 = fsub float %45, %46
  %48 = fneg contract float %47
  br label %49

49:                                               ; preds = %27, %34
  %50 = phi contract float [ %48, %34 ], [ 0.000000e+00, %27 ]
  %51 = getelementptr inbounds float, float addrspace(1)* %4, i64 %28
  store float %50, float addrspace(1)* %51, align 4, !tbaa !16
  %52 = fsub contract float %30, %32
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  store float %52, float addrspace(1)* %53, align 4, !tbaa !16
  br label %54

54:                                               ; preds = %49, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
