; ModuleID = '../data/hip_kernels/2704/40/main.cu'
source_filename = "../data/hip_kernels/2704/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10core_svd2DPfS_S_m(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %5
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = add i32 %19, %20
  %22 = mul i32 %21, %13
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = zext i32 %24 to i64
  %26 = icmp ult i64 %25, %3
  br i1 %26, label %27, label %125

27:                                               ; preds = %4
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !14
  %30 = fpext float %29 to double
  %31 = add i64 %25, %3
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !16, !amdgpu.noclobber !14
  %34 = fpext float %33 to double
  %35 = shl i64 %3, 1
  %36 = add i64 %35, %25
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16, !amdgpu.noclobber !14
  %39 = fpext float %38 to double
  %40 = tail call double @llvm.fabs.f64(double %34)
  %41 = fcmp contract olt double %40, 1.000000e-15
  br i1 %41, label %42, label %45

42:                                               ; preds = %27
  %43 = insertelement <2 x double> undef, double %30, i64 0
  %44 = insertelement <2 x double> %43, double %39, i64 1
  br label %110

45:                                               ; preds = %27
  %46 = fadd contract double %30, %39
  %47 = fsub contract double %30, %39
  %48 = fmul contract double %47, %47
  %49 = fmul contract double %34, 4.000000e+00
  %50 = fmul contract double %49, %34
  %51 = fadd contract double %48, %50
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
  %74 = fadd contract double %46, %73
  %75 = fmul contract double %74, 5.000000e-01
  %76 = insertelement <2 x double> undef, double %75, i64 0
  %77 = fsub contract double %46, %73
  %78 = fmul contract double %77, 5.000000e-01
  %79 = insertelement <2 x double> %76, double %78, i64 1
  %80 = fsub contract double %75, %30
  %81 = fmul contract double %80, %80
  %82 = fmul contract double %34, %34
  %83 = fadd contract double %82, %81
  %84 = fcmp olt double %83, 0x1000000000000000
  %85 = select i1 %84, double 0x4FF0000000000000, double 1.000000e+00
  %86 = fmul double %83, %85
  %87 = tail call double @llvm.amdgcn.rsq.f64(double %86)
  %88 = fmul double %86, %87
  %89 = fmul double %87, 5.000000e-01
  %90 = fneg double %89
  %91 = tail call double @llvm.fma.f64(double %90, double %88, double 5.000000e-01)
  %92 = tail call double @llvm.fma.f64(double %89, double %91, double %89)
  %93 = tail call double @llvm.fma.f64(double %88, double %91, double %88)
  %94 = fneg double %93
  %95 = tail call double @llvm.fma.f64(double %94, double %93, double %86)
  %96 = tail call double @llvm.fma.f64(double %95, double %92, double %93)
  %97 = fneg double %96
  %98 = tail call double @llvm.fma.f64(double %97, double %96, double %86)
  %99 = tail call double @llvm.fma.f64(double %98, double %92, double %96)
  %100 = select i1 %84, double 0x37F0000000000000, double 1.000000e+00
  %101 = fmul double %100, %99
  %102 = fcmp oeq double %86, 0.000000e+00
  %103 = fcmp oeq double %86, 0x7FF0000000000000
  %104 = or i1 %102, %103
  %105 = select i1 %104, double %86, double %101
  %106 = fdiv contract double %34, %105
  %107 = insertelement <2 x double> undef, double %106, i64 0
  %108 = fdiv contract double %80, %105
  %109 = insertelement <2 x double> %107, double %108, i64 1
  br label %110

110:                                              ; preds = %45, %42
  %111 = phi <2 x double> [ %44, %42 ], [ %79, %45 ]
  %112 = phi <2 x double> [ <double 1.000000e+00, double 0.000000e+00>, %42 ], [ %109, %45 ]
  %113 = extractelement <2 x double> %111, i64 0
  %114 = fptrunc double %113 to float
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  store float %114, float addrspace(1)* %115, align 4, !tbaa !16
  %116 = extractelement <2 x double> %112, i64 0
  %117 = fptrunc double %116 to float
  %118 = getelementptr inbounds float, float addrspace(1)* %2, i64 %25
  store float %117, float addrspace(1)* %118, align 4, !tbaa !16
  %119 = extractelement <2 x double> %111, i64 1
  %120 = fptrunc double %119 to float
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  store float %120, float addrspace(1)* %121, align 4, !tbaa !16
  %122 = extractelement <2 x double> %112, i64 1
  %123 = fptrunc double %122 to float
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  store float %123, float addrspace(1)* %124, align 4, !tbaa !16
  br label %125

125:                                              ; preds = %110, %4
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
