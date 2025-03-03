; ModuleID = '../data/hip_kernels/3557/71/main.cu'
source_filename = "../data/hip_kernels/3557/71/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30cudaDSoftplus_propagate_kernelPdS_j(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
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
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp ult i32 %15, %2
  br i1 %22, label %24, label %23

23:                                               ; preds = %24, %3
  ret void

24:                                               ; preds = %3, %24
  %25 = phi i32 [ %137, %24 ], [ %15, %3 ]
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %0, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !16
  %29 = fmul double %28, 0x3FF71547652B82FE
  %30 = tail call double @llvm.rint.f64(double %29)
  %31 = fneg double %30
  %32 = tail call double @llvm.fma.f64(double %31, double 0x3FE62E42FEFA39EF, double %28)
  %33 = tail call double @llvm.fma.f64(double %31, double 0x3C7ABC9E3B39803F, double %32)
  %34 = tail call double @llvm.fma.f64(double %33, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %35 = tail call double @llvm.fma.f64(double %33, double %34, double 0x3EC71DEE623FDE64)
  %36 = tail call double @llvm.fma.f64(double %33, double %35, double 0x3EFA01997C89E6B0)
  %37 = tail call double @llvm.fma.f64(double %33, double %36, double 0x3F2A01A014761F6E)
  %38 = tail call double @llvm.fma.f64(double %33, double %37, double 0x3F56C16C1852B7B0)
  %39 = tail call double @llvm.fma.f64(double %33, double %38, double 0x3F81111111122322)
  %40 = tail call double @llvm.fma.f64(double %33, double %39, double 0x3FA55555555502A1)
  %41 = tail call double @llvm.fma.f64(double %33, double %40, double 0x3FC5555555555511)
  %42 = tail call double @llvm.fma.f64(double %33, double %41, double 0x3FE000000000000B)
  %43 = tail call double @llvm.fma.f64(double %33, double %42, double 1.000000e+00)
  %44 = tail call double @llvm.fma.f64(double %33, double %43, double 1.000000e+00)
  %45 = fptosi double %30 to i32
  %46 = tail call double @llvm.amdgcn.ldexp.f64(double %44, i32 %45)
  %47 = fcmp ogt double %28, 1.024000e+03
  %48 = fcmp olt double %28, -1.075000e+03
  %49 = fadd contract double %46, 1.000000e+00
  %50 = select i1 %47, double 0x7FF0000000000000, double %49
  %51 = select i1 %48, double 1.000000e+00, double %50
  %52 = tail call double @llvm.amdgcn.frexp.mant.f64(double %51)
  %53 = fcmp olt double %52, 0x3FE5555555555555
  %54 = zext i1 %53 to i32
  %55 = tail call double @llvm.amdgcn.ldexp.f64(double %52, i32 %54)
  %56 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %51)
  %57 = sub nsw i32 %56, %54
  %58 = fadd double %55, -1.000000e+00
  %59 = fadd double %55, 1.000000e+00
  %60 = fadd double %59, -1.000000e+00
  %61 = fsub double %55, %60
  %62 = tail call double @llvm.amdgcn.rcp.f64(double %59)
  %63 = fneg double %59
  %64 = tail call double @llvm.fma.f64(double %63, double %62, double 1.000000e+00)
  %65 = tail call double @llvm.fma.f64(double %64, double %62, double %62)
  %66 = tail call double @llvm.fma.f64(double %63, double %65, double 1.000000e+00)
  %67 = tail call double @llvm.fma.f64(double %66, double %65, double %65)
  %68 = fmul double %58, %67
  %69 = fmul double %59, %68
  %70 = fneg double %69
  %71 = tail call double @llvm.fma.f64(double %68, double %59, double %70)
  %72 = tail call double @llvm.fma.f64(double %68, double %61, double %71)
  %73 = fadd double %69, %72
  %74 = fsub double %73, %69
  %75 = fsub double %72, %74
  %76 = fsub double %58, %73
  %77 = fsub double %58, %76
  %78 = fsub double %77, %73
  %79 = fsub double %78, %75
  %80 = fadd double %76, %79
  %81 = fmul double %67, %80
  %82 = fadd double %68, %81
  %83 = fsub double %82, %68
  %84 = fsub double %81, %83
  %85 = fmul double %82, %82
  %86 = tail call double @llvm.fma.f64(double %85, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %87 = tail call double @llvm.fma.f64(double %85, double %86, double 0x3FC7474DD7F4DF2E)
  %88 = tail call double @llvm.fma.f64(double %85, double %87, double 0x3FCC71C016291751)
  %89 = tail call double @llvm.fma.f64(double %85, double %88, double 0x3FD249249B27ACF1)
  %90 = tail call double @llvm.fma.f64(double %85, double %89, double 0x3FD99999998EF7B6)
  %91 = tail call double @llvm.fma.f64(double %85, double %90, double 0x3FE5555555555780)
  %92 = tail call double @llvm.amdgcn.ldexp.f64(double %82, i32 1)
  %93 = tail call double @llvm.amdgcn.ldexp.f64(double %84, i32 1)
  %94 = fmul double %82, %85
  %95 = fmul double %94, %91
  %96 = fadd double %92, %95
  %97 = fsub double %96, %92
  %98 = fsub double %95, %97
  %99 = fadd double %93, %98
  %100 = fadd double %96, %99
  %101 = fsub double %100, %96
  %102 = fsub double %99, %101
  %103 = sitofp i32 %57 to double
  %104 = fmul double %103, 0x3FE62E42FEFA39EF
  %105 = fneg double %104
  %106 = tail call double @llvm.fma.f64(double %103, double 0x3FE62E42FEFA39EF, double %105)
  %107 = tail call double @llvm.fma.f64(double %103, double 0x3C7ABC9E3B39803F, double %106)
  %108 = fadd double %104, %107
  %109 = fsub double %108, %104
  %110 = fsub double %107, %109
  %111 = fadd double %108, %100
  %112 = fsub double %111, %108
  %113 = fsub double %111, %112
  %114 = fsub double %108, %113
  %115 = fsub double %100, %112
  %116 = fadd double %115, %114
  %117 = fadd double %110, %102
  %118 = fsub double %117, %110
  %119 = fsub double %117, %118
  %120 = fsub double %110, %119
  %121 = fsub double %102, %118
  %122 = fadd double %121, %120
  %123 = fadd double %117, %116
  %124 = fadd double %111, %123
  %125 = fsub double %124, %111
  %126 = fsub double %123, %125
  %127 = fadd double %122, %126
  %128 = fadd double %124, %127
  %129 = tail call double @llvm.fabs.f64(double %51) #3
  %130 = fcmp oeq double %129, 0x7FF0000000000000
  %131 = select i1 %130, double %51, double %128
  %132 = fcmp olt double %51, 0.000000e+00
  %133 = select i1 %132, double 0x7FF8000000000000, double %131
  %134 = fcmp oeq double %51, 0.000000e+00
  %135 = select i1 %134, double 0xFFF0000000000000, double %133
  %136 = getelementptr inbounds double, double addrspace(1)* %1, i64 %26
  store double %135, double addrspace(1)* %136, align 8, !tbaa !16
  %137 = add i32 %25, %21
  %138 = icmp ult i32 %137, %2
  br i1 %138, label %24, label %23, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
