; ModuleID = '../data/hip_kernels/10552/19/main.cu'
source_filename = "../data/hip_kernels/10552/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10_rmsprop64iddPdS_(i32 %0, double %1, double %2, double addrspace(1)* nocapture %3, double addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !7
  %16 = mul i32 %7, %12
  %17 = add i32 %16, %6
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %65

19:                                               ; preds = %5
  %20 = fsub contract double 1.000000e+00, %2
  %21 = udiv i32 %15, %12
  %22 = mul i32 %21, %12
  %23 = icmp ugt i32 %15, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %12
  br label %27

27:                                               ; preds = %19, %27
  %28 = phi i32 [ %17, %19 ], [ %63, %27 ]
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %3, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !16
  %32 = fmul contract double %31, %2
  %33 = getelementptr inbounds double, double addrspace(1)* %4, i64 %29
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %35 = fmul contract double %20, %34
  %36 = fmul contract double %34, %35
  %37 = fadd contract double %32, %36
  store double %37, double addrspace(1)* %30, align 8, !tbaa !16
  %38 = fadd contract double %37, %1
  %39 = fcmp olt double %38, 0x1000000000000000
  %40 = select i1 %39, double 0x4FF0000000000000, double 1.000000e+00
  %41 = fmul double %38, %40
  %42 = tail call double @llvm.amdgcn.rsq.f64(double %41)
  %43 = fmul double %41, %42
  %44 = fmul double %42, 5.000000e-01
  %45 = fneg double %44
  %46 = tail call double @llvm.fma.f64(double %45, double %43, double 5.000000e-01)
  %47 = tail call double @llvm.fma.f64(double %44, double %46, double %44)
  %48 = tail call double @llvm.fma.f64(double %43, double %46, double %43)
  %49 = fneg double %48
  %50 = tail call double @llvm.fma.f64(double %49, double %48, double %41)
  %51 = tail call double @llvm.fma.f64(double %50, double %47, double %48)
  %52 = fneg double %51
  %53 = tail call double @llvm.fma.f64(double %52, double %51, double %41)
  %54 = tail call double @llvm.fma.f64(double %53, double %47, double %51)
  %55 = select i1 %39, double 0x37F0000000000000, double 1.000000e+00
  %56 = fmul double %55, %54
  %57 = fcmp oeq double %41, 0.000000e+00
  %58 = fcmp oeq double %41, 0x7FF0000000000000
  %59 = or i1 %57, %58
  %60 = select i1 %59, double %41, double %56
  %61 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %62 = fdiv contract double %61, %60
  store double %62, double addrspace(1)* %33, align 8, !tbaa !16
  %63 = add i32 %26, %28
  %64 = icmp slt i32 %63, %0
  br i1 %64, label %27, label %65, !llvm.loop !20

65:                                               ; preds = %27, %5
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
