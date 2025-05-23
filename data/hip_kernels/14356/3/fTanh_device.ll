; ModuleID = '../data/hip_kernels/14356/3/main.cu'
source_filename = "../data/hip_kernels/14356/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @fTanh(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %6 = bitcast i8 addrspace(4)* %5 to i32 addrspace(4)*
  %7 = load i32, i32 addrspace(4)* %6, align 4, !tbaa !4
  %8 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !13, !invariant.load !14
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %7, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %7, %13
  %15 = zext i1 %14 to i32
  %16 = add i32 %12, %15
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 16
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 8, !tbaa !15
  %20 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !13, !invariant.load !14
  %23 = zext i16 %22 to i32
  %24 = udiv i32 %19, %23
  %25 = mul i32 %24, %23
  %26 = icmp ugt i32 %19, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %30 = mul i32 %28, %29
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %33 = add i32 %30, %31
  %34 = mul i32 %33, %16
  %35 = add i32 %34, %32
  %36 = sext i32 %35 to i64
  %37 = icmp slt i64 %36, %2
  br i1 %37, label %38, label %72

38:                                               ; preds = %3
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !17, !amdgpu.noclobber !14
  %41 = tail call float @llvm.fabs.f32(float %40)
  %42 = fcmp olt float %41, 6.250000e-01
  br i1 %42, label %43, label %51

43:                                               ; preds = %38
  %44 = fmul float %40, %40
  %45 = tail call float @llvm.fmuladd.f32(float %44, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %46 = tail call float @llvm.fmuladd.f32(float %44, float %45, float 0xBFAB8389C0000000)
  %47 = tail call float @llvm.fmuladd.f32(float %44, float %46, float 0x3FC1107040000000)
  %48 = tail call float @llvm.fmuladd.f32(float %44, float %47, float 0xBFD5555320000000)
  %49 = fmul float %41, %48
  %50 = tail call float @llvm.fmuladd.f32(float %44, float %49, float %41)
  br label %68

51:                                               ; preds = %38
  %52 = fmul float %41, 2.000000e+00
  %53 = fmul float %52, 0x3FF7154760000000
  %54 = tail call float @llvm.rint.f32(float %53)
  %55 = fcmp ogt float %52, 0x40562E4300000000
  %56 = fneg float %53
  %57 = tail call float @llvm.fma.f32(float %52, float 0x3FF7154760000000, float %56)
  %58 = tail call float @llvm.fma.f32(float %52, float 0x3E54AE0BE0000000, float %57)
  %59 = fsub float %53, %54
  %60 = fadd float %58, %59
  %61 = tail call float @llvm.exp2.f32(float %60)
  %62 = fptosi float %54 to i32
  %63 = tail call float @llvm.amdgcn.ldexp.f32(float %61, i32 %62)
  %64 = fadd float %63, 1.000000e+00
  %65 = select i1 %55, float 0x7FF0000000000000, float %64
  %66 = tail call float @llvm.amdgcn.rcp.f32(float %65)
  %67 = tail call float @llvm.fmuladd.f32(float %66, float -2.000000e+00, float 1.000000e+00)
  br label %68

68:                                               ; preds = %43, %51
  %69 = phi float [ %50, %43 ], [ %67, %51 ]
  %70 = tail call float @llvm.copysign.f32(float %69, float %40)
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  store float %70, float addrspace(1)* %71, align 4, !tbaa !17
  br label %72

72:                                               ; preds = %68, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
