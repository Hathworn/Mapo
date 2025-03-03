; ModuleID = '../data/hip_kernels/8192/344/main.cu'
source_filename = "../data/hip_kernels/8192/344/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25LogarithmicFunctionKernelPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = udiv i32 %12, %9
  %16 = mul i32 %15, %9
  %17 = icmp ugt i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %14
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %13
  %23 = mul i32 %22, %9
  %24 = add i32 %23, %21
  %25 = icmp slt i32 %24, %2
  br i1 %25, label %26, label %75

26:                                               ; preds = %4
  switch i32 %3, label %75 [
    i32 1, label %27
    i32 2, label %44
    i32 3, label %54
  ]

27:                                               ; preds = %26
  %28 = sext i32 %24 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !5
  %31 = tail call i1 @llvm.amdgcn.class.f32(float %30, i32 144)
  %32 = select i1 %31, float 0x41F0000000000000, float 1.000000e+00
  %33 = fmul float %30, %32
  %34 = tail call float @llvm.log2.f32(float %33)
  %35 = fmul float %34, 0x3FE62E42E0000000
  %36 = tail call i1 @llvm.amdgcn.class.f32(float %34, i32 519)
  %37 = fneg float %35
  %38 = tail call float @llvm.fma.f32(float %34, float 0x3FE62E42E0000000, float %37)
  %39 = tail call float @llvm.fma.f32(float %34, float 0x3E6EFA39E0000000, float %38)
  %40 = fadd float %35, %39
  %41 = select i1 %36, float %34, float %40
  %42 = select i1 %31, float 0x40362E4300000000, float 0.000000e+00
  %43 = fsub float %41, %42
  br label %71

44:                                               ; preds = %26
  %45 = sext i32 %24 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !5
  %48 = tail call i1 @llvm.amdgcn.class.f32(float %47, i32 144)
  %49 = select i1 %48, float 0x41F0000000000000, float 1.000000e+00
  %50 = fmul float %47, %49
  %51 = tail call float @llvm.log2.f32(float %50)
  %52 = select i1 %48, float 3.200000e+01, float 0.000000e+00
  %53 = fsub float %51, %52
  br label %71

54:                                               ; preds = %26
  %55 = sext i32 %24 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16, !amdgpu.noclobber !5
  %58 = tail call i1 @llvm.amdgcn.class.f32(float %57, i32 144)
  %59 = select i1 %58, float 0x41F0000000000000, float 1.000000e+00
  %60 = fmul float %57, %59
  %61 = tail call float @llvm.log2.f32(float %60)
  %62 = fmul float %61, 0x3FD3441340000000
  %63 = tail call i1 @llvm.amdgcn.class.f32(float %61, i32 519)
  %64 = fneg float %62
  %65 = tail call float @llvm.fma.f32(float %61, float 0x3FD3441340000000, float %64)
  %66 = tail call float @llvm.fma.f32(float %61, float 0x3E509F79E0000000, float %65)
  %67 = fadd float %62, %66
  %68 = select i1 %63, float %61, float %67
  %69 = select i1 %58, float 0x4023441360000000, float 0.000000e+00
  %70 = fsub float %68, %69
  br label %71

71:                                               ; preds = %54, %44, %27
  %72 = phi i64 [ %28, %27 ], [ %45, %44 ], [ %55, %54 ]
  %73 = phi float [ %43, %27 ], [ %53, %44 ], [ %70, %54 ]
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  store float %73, float addrspace(1)* %74, align 4, !tbaa !16
  br label %75

75:                                               ; preds = %71, %26, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
