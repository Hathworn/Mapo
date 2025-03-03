; ModuleID = '../data/hip_kernels/12544/7/main.cu'
source_filename = "../data/hip_kernels/12544/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @tanh_float(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %26

19:                                               ; preds = %5
  %20 = udiv i32 %14, %11
  %21 = mul i32 %20, %11
  %22 = icmp ugt i32 %14, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  br label %27

26:                                               ; preds = %68, %5
  ret void

27:                                               ; preds = %19, %68
  %28 = phi i32 [ %17, %19 ], [ %69, %68 ]
  %29 = icmp slt i32 %28, %1
  br i1 %29, label %68, label %30

30:                                               ; preds = %27
  %31 = srem i32 %28, %3
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %68

33:                                               ; preds = %30
  %34 = sext i32 %28 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = tail call float @llvm.fabs.f32(float %36)
  %38 = fcmp olt float %37, 6.250000e-01
  br i1 %38, label %39, label %47

39:                                               ; preds = %33
  %40 = fmul float %36, %36
  %41 = tail call float @llvm.fmuladd.f32(float %40, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %42 = tail call float @llvm.fmuladd.f32(float %40, float %41, float 0xBFAB8389C0000000)
  %43 = tail call float @llvm.fmuladd.f32(float %40, float %42, float 0x3FC1107040000000)
  %44 = tail call float @llvm.fmuladd.f32(float %40, float %43, float 0xBFD5555320000000)
  %45 = fmul float %37, %44
  %46 = tail call float @llvm.fmuladd.f32(float %40, float %45, float %37)
  br label %64

47:                                               ; preds = %33
  %48 = fmul float %37, 2.000000e+00
  %49 = fmul float %48, 0x3FF7154760000000
  %50 = tail call float @llvm.rint.f32(float %49)
  %51 = fcmp ogt float %48, 0x40562E4300000000
  %52 = fneg float %49
  %53 = tail call float @llvm.fma.f32(float %48, float 0x3FF7154760000000, float %52)
  %54 = tail call float @llvm.fma.f32(float %48, float 0x3E54AE0BE0000000, float %53)
  %55 = fsub float %49, %50
  %56 = fadd float %54, %55
  %57 = tail call float @llvm.exp2.f32(float %56)
  %58 = fptosi float %50 to i32
  %59 = tail call float @llvm.amdgcn.ldexp.f32(float %57, i32 %58)
  %60 = fadd float %59, 1.000000e+00
  %61 = select i1 %51, float 0x7FF0000000000000, float %60
  %62 = tail call float @llvm.amdgcn.rcp.f32(float %61)
  %63 = tail call float @llvm.fmuladd.f32(float %62, float -2.000000e+00, float 1.000000e+00)
  br label %64

64:                                               ; preds = %39, %47
  %65 = phi float [ %46, %39 ], [ %63, %47 ]
  %66 = tail call float @llvm.copysign.f32(float %65, float %36)
  %67 = getelementptr inbounds float, float addrspace(1)* %4, i64 %34
  store float %66, float addrspace(1)* %67, align 4, !tbaa !16
  br label %68

68:                                               ; preds = %27, %30, %64
  %69 = add i32 %25, %28
  %70 = icmp slt i32 %69, %0
  br i1 %70, label %27, label %26, !llvm.loop !20
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
