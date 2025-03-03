; ModuleID = '../data/hip_kernels/14395/51/main.cu'
source_filename = "../data/hip_kernels/14395/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7cu_tanhPKfPfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = mul i32 %5, %10
  %15 = add i32 %14, %4
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %10
  %22 = icmp slt i32 %15, %2
  br i1 %22, label %23, label %61

23:                                               ; preds = %3, %55
  %24 = phi i32 [ %59, %55 ], [ %15, %3 ]
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !16
  %28 = tail call float @llvm.fabs.f32(float %27)
  %29 = fcmp olt float %28, 6.250000e-01
  br i1 %29, label %30, label %38

30:                                               ; preds = %23
  %31 = fmul float %27, %27
  %32 = tail call float @llvm.fmuladd.f32(float %31, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %33 = tail call float @llvm.fmuladd.f32(float %31, float %32, float 0xBFAB8389C0000000)
  %34 = tail call float @llvm.fmuladd.f32(float %31, float %33, float 0x3FC1107040000000)
  %35 = tail call float @llvm.fmuladd.f32(float %31, float %34, float 0xBFD5555320000000)
  %36 = fmul float %28, %35
  %37 = tail call float @llvm.fmuladd.f32(float %31, float %36, float %28)
  br label %55

38:                                               ; preds = %23
  %39 = fmul float %28, 2.000000e+00
  %40 = fmul float %39, 0x3FF7154760000000
  %41 = tail call float @llvm.rint.f32(float %40)
  %42 = fcmp ogt float %39, 0x40562E4300000000
  %43 = fneg float %40
  %44 = tail call float @llvm.fma.f32(float %39, float 0x3FF7154760000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %39, float 0x3E54AE0BE0000000, float %44)
  %46 = fsub float %40, %41
  %47 = fadd float %45, %46
  %48 = tail call float @llvm.exp2.f32(float %47)
  %49 = fptosi float %41 to i32
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %48, i32 %49)
  %51 = fadd float %50, 1.000000e+00
  %52 = select i1 %42, float 0x7FF0000000000000, float %51
  %53 = tail call float @llvm.amdgcn.rcp.f32(float %52)
  %54 = tail call float @llvm.fmuladd.f32(float %53, float -2.000000e+00, float 1.000000e+00)
  br label %55

55:                                               ; preds = %30, %38
  %56 = phi float [ %37, %30 ], [ %54, %38 ]
  %57 = tail call float @llvm.copysign.f32(float %56, float %27)
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  store float %57, float addrspace(1)* %58, align 4, !tbaa !16
  %59 = add nsw i32 %24, %21
  %60 = icmp slt i32 %59, %2
  br i1 %60, label %23, label %61, !llvm.loop !20

61:                                               ; preds = %55, %3
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
