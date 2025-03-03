; ModuleID = '../data/hip_kernels/1874/1/main.cu'
source_filename = "../data/hip_kernels/1874/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9updateTauiPKdS0_S0_S0_PdS0_S0_S1_(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  store double 0.000000e+00, double addrspace(1)* %5, align 8, !tbaa !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !8, !invariant.load !9
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !10
  %19 = mul i32 %10, %15
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %21 = add i32 %19, %20
  %22 = udiv i32 %18, %15
  %23 = mul i32 %22, %15
  %24 = icmp ugt i32 %18, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %15
  %28 = icmp slt i32 %21, %0
  br i1 %28, label %29, label %82

29:                                               ; preds = %9, %78
  %30 = phi double [ %79, %78 ], [ 0.000000e+00, %9 ]
  %31 = phi i32 [ %80, %78 ], [ %21, %9 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %1, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !4
  %35 = fcmp contract oeq double %34, 0.000000e+00
  br i1 %35, label %78, label %36

36:                                               ; preds = %29
  %37 = getelementptr inbounds double, double addrspace(1)* %2, i64 %32
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !4
  %39 = fdiv contract double %38, %34
  %40 = getelementptr inbounds double, double addrspace(1)* %3, i64 %32
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !4
  %42 = fmul contract double %34, %39
  %43 = fmul contract double %39, %42
  %44 = fmul contract double %43, 5.000000e-01
  %45 = fsub contract double %41, %44
  %46 = load double, double addrspace(1)* %4, align 8, !tbaa !4
  %47 = fadd contract double %46, -1.000000e+00
  %48 = fmul contract double %47, %45
  %49 = tail call double @llvm.fabs.f64(double %48)
  %50 = fmul contract double %46, %49
  %51 = fdiv contract double %50, %34
  %52 = fcmp olt double %51, 0x1000000000000000
  %53 = select i1 %52, double 0x4FF0000000000000, double 1.000000e+00
  %54 = fmul double %51, %53
  %55 = tail call double @llvm.amdgcn.rsq.f64(double %54)
  %56 = fmul double %54, %55
  %57 = fmul double %55, 5.000000e-01
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %58, double %56, double 5.000000e-01)
  %60 = tail call double @llvm.fma.f64(double %57, double %59, double %57)
  %61 = tail call double @llvm.fma.f64(double %56, double %59, double %56)
  %62 = fneg double %61
  %63 = tail call double @llvm.fma.f64(double %62, double %61, double %54)
  %64 = tail call double @llvm.fma.f64(double %63, double %60, double %61)
  %65 = fneg double %64
  %66 = tail call double @llvm.fma.f64(double %65, double %64, double %54)
  %67 = tail call double @llvm.fma.f64(double %66, double %60, double %64)
  %68 = select i1 %52, double 0x37F0000000000000, double 1.000000e+00
  %69 = fmul double %68, %67
  %70 = fcmp oeq double %54, 0.000000e+00
  %71 = fcmp oeq double %54, 0x7FF0000000000000
  %72 = or i1 %70, %71
  %73 = select i1 %72, double %54, double %69
  %74 = tail call double @llvm.fabs.f64(double %39)
  %75 = fadd contract double %74, %73
  %76 = fcmp contract olt double %30, %75
  br i1 %76, label %77, label %78

77:                                               ; preds = %36
  store double %75, double addrspace(1)* %5, align 8, !tbaa !4
  br label %78

78:                                               ; preds = %77, %36, %29
  %79 = phi double [ %30, %36 ], [ %75, %77 ], [ %30, %29 ]
  %80 = add nsw i32 %31, %27
  %81 = icmp slt i32 %80, %0
  br i1 %81, label %29, label %82, !llvm.loop !20

82:                                               ; preds = %78, %9
  %83 = phi double [ 0.000000e+00, %9 ], [ %79, %78 ]
  %84 = load double, double addrspace(1)* %7, align 8, !tbaa !4
  %85 = load double, double addrspace(1)* %6, align 8, !tbaa !4
  %86 = fmul contract double %84, %85
  %87 = fdiv contract double %86, %83
  store double %87, double addrspace(1)* %8, align 8, !tbaa !4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i16 1, i16 1025}
!9 = !{}
!10 = !{!11, !15, i64 12}
!11 = !{!"hsa_kernel_dispatch_packet_s", !12, i64 0, !12, i64 2, !12, i64 4, !12, i64 6, !12, i64 8, !12, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!12 = !{!"short", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!"int", !13, i64 0}
!16 = !{!"long", !13, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{i32 0, i32 1024}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
