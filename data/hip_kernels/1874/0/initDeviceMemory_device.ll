; ModuleID = '../data/hip_kernels/1874/0/main.cu'
source_filename = "../data/hip_kernels/1874/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16initDeviceMemoryiPdS_S_S_S_S_S_S_S_S_S_S_(i32 %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture %3, double addrspace(1)* nocapture writeonly %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture %7, double addrspace(1)* nocapture %8, double addrspace(1)* nocapture writeonly %9, double addrspace(1)* nocapture writeonly %10, double addrspace(1)* nocapture %11, double addrspace(1)* nocapture writeonly %12) local_unnamed_addr #0 {
  store double 0.000000e+00, double addrspace(1)* %12, align 8, !tbaa !4
  store double 1.000000e+00, double addrspace(1)* %6, align 8, !tbaa !4
  store double 1.400000e+00, double addrspace(1)* %7, align 8, !tbaa !4
  store double 9.000000e-01, double addrspace(1)* %8, align 8, !tbaa !4
  store double 0.000000e+00, double addrspace(1)* %9, align 8, !tbaa !4
  %14 = load double, double addrspace(1)* %6, align 8, !tbaa !4
  %15 = add nsw i32 %0, -1
  %16 = sitofp i32 %15 to double
  %17 = fdiv contract double %14, %16
  store double %17, double addrspace(1)* %5, align 8, !tbaa !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !8, !invariant.load !9
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !10
  %27 = mul i32 %18, %23
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %29, %0
  br i1 %30, label %31, label %33

31:                                               ; preds = %13
  %32 = sdiv i32 %0, 2
  br label %99

33:                                               ; preds = %99, %13
  store double 0.000000e+00, double addrspace(1)* %11, align 8, !tbaa !4
  %34 = udiv i32 %26, %23
  %35 = mul i32 %34, %23
  %36 = icmp ugt i32 %26, %35
  %37 = zext i1 %36 to i32
  %38 = add i32 %34, %37
  %39 = mul i32 %38, %23
  br i1 %30, label %40, label %93

40:                                               ; preds = %33, %89
  %41 = phi double [ %90, %89 ], [ 0.000000e+00, %33 ]
  %42 = phi i32 [ %91, %89 ], [ %29, %33 ]
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %1, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !4
  %46 = fcmp contract oeq double %45, 0.000000e+00
  br i1 %46, label %89, label %47

47:                                               ; preds = %40
  %48 = getelementptr inbounds double, double addrspace(1)* %2, i64 %43
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !4
  %50 = fdiv contract double %49, %45
  %51 = getelementptr inbounds double, double addrspace(1)* %3, i64 %43
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !4
  %53 = fmul contract double %45, %50
  %54 = fmul contract double %50, %53
  %55 = fmul contract double %54, 5.000000e-01
  %56 = fsub contract double %52, %55
  %57 = load double, double addrspace(1)* %7, align 8, !tbaa !4
  %58 = fadd contract double %57, -1.000000e+00
  %59 = fmul contract double %58, %56
  %60 = tail call double @llvm.fabs.f64(double %59)
  %61 = fmul contract double %57, %60
  %62 = fdiv contract double %61, %45
  %63 = fcmp olt double %62, 0x1000000000000000
  %64 = select i1 %63, double 0x4FF0000000000000, double 1.000000e+00
  %65 = fmul double %62, %64
  %66 = tail call double @llvm.amdgcn.rsq.f64(double %65)
  %67 = fmul double %65, %66
  %68 = fmul double %66, 5.000000e-01
  %69 = fneg double %68
  %70 = tail call double @llvm.fma.f64(double %69, double %67, double 5.000000e-01)
  %71 = tail call double @llvm.fma.f64(double %68, double %70, double %68)
  %72 = tail call double @llvm.fma.f64(double %67, double %70, double %67)
  %73 = fneg double %72
  %74 = tail call double @llvm.fma.f64(double %73, double %72, double %65)
  %75 = tail call double @llvm.fma.f64(double %74, double %71, double %72)
  %76 = fneg double %75
  %77 = tail call double @llvm.fma.f64(double %76, double %75, double %65)
  %78 = tail call double @llvm.fma.f64(double %77, double %71, double %75)
  %79 = select i1 %63, double 0x37F0000000000000, double 1.000000e+00
  %80 = fmul double %79, %78
  %81 = fcmp oeq double %65, 0.000000e+00
  %82 = fcmp oeq double %65, 0x7FF0000000000000
  %83 = or i1 %81, %82
  %84 = select i1 %83, double %65, double %80
  %85 = tail call double @llvm.fabs.f64(double %50)
  %86 = fadd contract double %85, %84
  %87 = fcmp contract olt double %41, %86
  br i1 %87, label %88, label %89

88:                                               ; preds = %47
  store double %86, double addrspace(1)* %11, align 8, !tbaa !4
  br label %89

89:                                               ; preds = %88, %47, %40
  %90 = phi double [ %41, %47 ], [ %86, %88 ], [ %41, %40 ]
  %91 = add nsw i32 %42, %39
  %92 = icmp slt i32 %91, %0
  br i1 %92, label %40, label %93, !llvm.loop !20

93:                                               ; preds = %89, %33
  %94 = phi double [ 0.000000e+00, %33 ], [ %90, %89 ]
  %95 = load double, double addrspace(1)* %8, align 8, !tbaa !4
  %96 = load double, double addrspace(1)* %5, align 8, !tbaa !4
  %97 = fmul contract double %95, %96
  %98 = fdiv contract double %97, %94
  store double %98, double addrspace(1)* %10, align 8, !tbaa !4
  ret void

99:                                               ; preds = %31, %99
  %100 = phi i32 [ %29, %31 ], [ %116, %99 ]
  %101 = icmp slt i32 %100, %32
  %102 = select i1 %101, double 1.000000e+00, double 1.250000e-01
  %103 = select i1 %101, double 1.000000e+00, double 1.000000e-01
  %104 = load double, double addrspace(1)* %7, align 8, !tbaa !4
  %105 = fadd contract double %104, -1.000000e+00
  %106 = fdiv contract double %103, %105
  %107 = fmul contract double %102, 0.000000e+00
  %108 = fmul contract double %107, 0.000000e+00
  %109 = fmul contract double %108, 5.000000e-01
  %110 = fadd contract double %109, %106
  %111 = sext i32 %100 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %1, i64 %111
  store double %102, double addrspace(1)* %112, align 8, !tbaa !4
  %113 = getelementptr inbounds double, double addrspace(1)* %2, i64 %111
  store double %107, double addrspace(1)* %113, align 8, !tbaa !4
  %114 = getelementptr inbounds double, double addrspace(1)* %3, i64 %111
  store double %110, double addrspace(1)* %114, align 8, !tbaa !4
  %115 = getelementptr inbounds double, double addrspace(1)* %4, i64 %111
  store double 1.000000e+00, double addrspace(1)* %115, align 8, !tbaa !4
  %116 = add nsw i32 %100, %23
  %117 = icmp slt i32 %116, %0
  br i1 %117, label %99, label %33, !llvm.loop !22
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
!22 = distinct !{!22, !21}
