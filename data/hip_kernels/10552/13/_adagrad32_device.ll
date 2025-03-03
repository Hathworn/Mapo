; ModuleID = '../data/hip_kernels/10552/13/main.cu'
source_filename = "../data/hip_kernels/10552/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10_adagrad32idPfS_(i32 %0, double %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %64

18:                                               ; preds = %4
  %19 = udiv i32 %14, %11
  %20 = mul i32 %19, %11
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %11
  br label %25

25:                                               ; preds = %18, %25
  %26 = phi i32 [ %16, %18 ], [ %62, %25 ]
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %3, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16
  %30 = fmul contract float %29, %29
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %27
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %33 = fadd contract float %32, %30
  store float %33, float addrspace(1)* %31, align 4, !tbaa !16
  %34 = fpext float %33 to double
  %35 = fadd contract double %34, %1
  %36 = fcmp olt double %35, 0x1000000000000000
  %37 = select i1 %36, double 0x4FF0000000000000, double 1.000000e+00
  %38 = fmul double %35, %37
  %39 = tail call double @llvm.amdgcn.rsq.f64(double %38)
  %40 = fmul double %38, %39
  %41 = fmul double %39, 5.000000e-01
  %42 = fneg double %41
  %43 = tail call double @llvm.fma.f64(double %42, double %40, double 5.000000e-01)
  %44 = tail call double @llvm.fma.f64(double %41, double %43, double %41)
  %45 = tail call double @llvm.fma.f64(double %40, double %43, double %40)
  %46 = fneg double %45
  %47 = tail call double @llvm.fma.f64(double %46, double %45, double %38)
  %48 = tail call double @llvm.fma.f64(double %47, double %44, double %45)
  %49 = fneg double %48
  %50 = tail call double @llvm.fma.f64(double %49, double %48, double %38)
  %51 = tail call double @llvm.fma.f64(double %50, double %44, double %48)
  %52 = select i1 %36, double 0x37F0000000000000, double 1.000000e+00
  %53 = fmul double %52, %51
  %54 = fcmp oeq double %38, 0.000000e+00
  %55 = fcmp oeq double %38, 0x7FF0000000000000
  %56 = or i1 %54, %55
  %57 = select i1 %56, double %38, double %53
  %58 = load float, float addrspace(1)* %28, align 4, !tbaa !16
  %59 = fpext float %58 to double
  %60 = fdiv contract double %59, %57
  %61 = fptrunc double %60 to float
  store float %61, float addrspace(1)* %28, align 4, !tbaa !16
  %62 = add i32 %24, %26
  %63 = icmp slt i32 %62, %0
  br i1 %63, label %25, label %64, !llvm.loop !20

64:                                               ; preds = %25, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
