; ModuleID = '../data/hip_kernels/247/1/main.cu'
source_filename = "../data/hip_kernels/247/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10kLogistic1PfS_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = icmp ult i32 %15, %2
  br i1 %16, label %17, label %24

17:                                               ; preds = %3
  %18 = udiv i32 %12, %9
  %19 = mul i32 %18, %9
  %20 = icmp ugt i32 %12, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %9
  br label %25

24:                                               ; preds = %58, %3
  ret void

25:                                               ; preds = %17, %58
  %26 = phi i32 [ %15, %17 ], [ %64, %58 ]
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16
  %30 = fmul contract float %29, 5.000000e-01
  %31 = tail call float @llvm.fabs.f32(float %30)
  %32 = fcmp olt float %31, 6.250000e-01
  br i1 %32, label %33, label %41

33:                                               ; preds = %25
  %34 = fmul float %30, %30
  %35 = tail call float @llvm.fmuladd.f32(float %34, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %36 = tail call float @llvm.fmuladd.f32(float %34, float %35, float 0xBFAB8389C0000000)
  %37 = tail call float @llvm.fmuladd.f32(float %34, float %36, float 0x3FC1107040000000)
  %38 = tail call float @llvm.fmuladd.f32(float %34, float %37, float 0xBFD5555320000000)
  %39 = fmul float %31, %38
  %40 = tail call float @llvm.fmuladd.f32(float %34, float %39, float %31)
  br label %58

41:                                               ; preds = %25
  %42 = fmul float %31, 2.000000e+00
  %43 = fmul float %42, 0x3FF7154760000000
  %44 = tail call float @llvm.rint.f32(float %43)
  %45 = fcmp ogt float %42, 0x40562E4300000000
  %46 = fneg float %43
  %47 = tail call float @llvm.fma.f32(float %42, float 0x3FF7154760000000, float %46)
  %48 = tail call float @llvm.fma.f32(float %42, float 0x3E54AE0BE0000000, float %47)
  %49 = fsub float %43, %44
  %50 = fadd float %48, %49
  %51 = tail call float @llvm.exp2.f32(float %50)
  %52 = fptosi float %44 to i32
  %53 = tail call float @llvm.amdgcn.ldexp.f32(float %51, i32 %52)
  %54 = fadd float %53, 1.000000e+00
  %55 = select i1 %45, float 0x7FF0000000000000, float %54
  %56 = tail call float @llvm.amdgcn.rcp.f32(float %55)
  %57 = tail call float @llvm.fmuladd.f32(float %56, float -2.000000e+00, float 1.000000e+00)
  br label %58

58:                                               ; preds = %33, %41
  %59 = phi float [ %40, %33 ], [ %57, %41 ]
  %60 = tail call float @llvm.copysign.f32(float %59, float %30)
  %61 = fadd contract float %60, 1.000000e+00
  %62 = fmul contract float %61, 5.000000e-01
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  store float %62, float addrspace(1)* %63, align 4, !tbaa !16
  %64 = add i32 %23, %26
  %65 = icmp ult i32 %64, %2
  br i1 %65, label %25, label %24, !llvm.loop !20
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
