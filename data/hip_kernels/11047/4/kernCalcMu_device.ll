; ModuleID = '../data/hip_kernels/11047/4/main.cu'
source_filename = "../data/hip_kernels/11047/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10kernCalcMummPKdS0_S0_Pd(i64 %0, i64 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = add i32 %21, %22
  %24 = mul i32 %23, %15
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = sext i32 %26 to i64
  %28 = icmp ult i64 %27, %0
  br i1 %28, label %29, label %145

29:                                               ; preds = %6
  %30 = getelementptr inbounds double, double addrspace(1)* %3, i64 %27
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !16, !amdgpu.noclobber !14
  %32 = fmul double %31, 0x3FF71547652B82FE
  %33 = tail call double @llvm.rint.f64(double %32)
  %34 = fneg double %33
  %35 = tail call double @llvm.fma.f64(double %34, double 0x3FE62E42FEFA39EF, double %31)
  %36 = tail call double @llvm.fma.f64(double %34, double 0x3C7ABC9E3B39803F, double %35)
  %37 = tail call double @llvm.fma.f64(double %36, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %38 = tail call double @llvm.fma.f64(double %36, double %37, double 0x3EC71DEE623FDE64)
  %39 = tail call double @llvm.fma.f64(double %36, double %38, double 0x3EFA01997C89E6B0)
  %40 = tail call double @llvm.fma.f64(double %36, double %39, double 0x3F2A01A014761F6E)
  %41 = tail call double @llvm.fma.f64(double %36, double %40, double 0x3F56C16C1852B7B0)
  %42 = tail call double @llvm.fma.f64(double %36, double %41, double 0x3F81111111122322)
  %43 = tail call double @llvm.fma.f64(double %36, double %42, double 0x3FA55555555502A1)
  %44 = tail call double @llvm.fma.f64(double %36, double %43, double 0x3FC5555555555511)
  %45 = tail call double @llvm.fma.f64(double %36, double %44, double 0x3FE000000000000B)
  %46 = tail call double @llvm.fma.f64(double %36, double %45, double 1.000000e+00)
  %47 = tail call double @llvm.fma.f64(double %36, double %46, double 1.000000e+00)
  %48 = fptosi double %33 to i32
  %49 = tail call double @llvm.amdgcn.ldexp.f64(double %47, i32 %48)
  %50 = fcmp ogt double %31, 1.024000e+03
  %51 = select i1 %50, double 0x7FF0000000000000, double %49
  %52 = fcmp olt double %31, -1.075000e+03
  %53 = select i1 %52, double 0.000000e+00, double %51
  %54 = load double, double addrspace(1)* %4, align 8, !tbaa !16, !amdgpu.noclobber !14
  %55 = fmul double %54, 0x3FF71547652B82FE
  %56 = tail call double @llvm.rint.f64(double %55)
  %57 = fneg double %56
  %58 = tail call double @llvm.fma.f64(double %57, double 0x3FE62E42FEFA39EF, double %54)
  %59 = tail call double @llvm.fma.f64(double %57, double 0x3C7ABC9E3B39803F, double %58)
  %60 = tail call double @llvm.fma.f64(double %59, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %61 = tail call double @llvm.fma.f64(double %59, double %60, double 0x3EC71DEE623FDE64)
  %62 = tail call double @llvm.fma.f64(double %59, double %61, double 0x3EFA01997C89E6B0)
  %63 = tail call double @llvm.fma.f64(double %59, double %62, double 0x3F2A01A014761F6E)
  %64 = tail call double @llvm.fma.f64(double %59, double %63, double 0x3F56C16C1852B7B0)
  %65 = tail call double @llvm.fma.f64(double %59, double %64, double 0x3F81111111122322)
  %66 = tail call double @llvm.fma.f64(double %59, double %65, double 0x3FA55555555502A1)
  %67 = tail call double @llvm.fma.f64(double %59, double %66, double 0x3FC5555555555511)
  %68 = tail call double @llvm.fma.f64(double %59, double %67, double 0x3FE000000000000B)
  %69 = tail call double @llvm.fma.f64(double %59, double %68, double 1.000000e+00)
  %70 = tail call double @llvm.fma.f64(double %59, double %69, double 1.000000e+00)
  %71 = fptosi double %56 to i32
  %72 = tail call double @llvm.amdgcn.ldexp.f64(double %70, i32 %71)
  %73 = fcmp ogt double %54, 1.024000e+03
  %74 = select i1 %73, double 0x7FF0000000000000, double %72
  %75 = fcmp olt double %54, -1.075000e+03
  %76 = select i1 %75, double 0.000000e+00, double %74
  %77 = fdiv contract double %53, %76
  %78 = mul i64 %27, %1
  %79 = getelementptr inbounds double, double addrspace(1)* %2, i64 %78
  %80 = getelementptr inbounds double, double addrspace(1)* %5, i64 %78
  %81 = icmp eq i64 %1, 0
  br i1 %81, label %145, label %82

82:                                               ; preds = %29
  %83 = and i64 %1, 7
  %84 = icmp ult i64 %1, 8
  br i1 %84, label %132, label %85

85:                                               ; preds = %82
  %86 = and i64 %1, -8
  br label %87

87:                                               ; preds = %87, %85
  %88 = phi i64 [ 0, %85 ], [ %129, %87 ]
  %89 = phi i64 [ 0, %85 ], [ %130, %87 ]
  %90 = getelementptr inbounds double, double addrspace(1)* %79, i64 %88
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !16
  %92 = fmul contract double %77, %91
  %93 = getelementptr inbounds double, double addrspace(1)* %80, i64 %88
  store double %92, double addrspace(1)* %93, align 8, !tbaa !16
  %94 = or i64 %88, 1
  %95 = getelementptr inbounds double, double addrspace(1)* %79, i64 %94
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !16
  %97 = fmul contract double %77, %96
  %98 = getelementptr inbounds double, double addrspace(1)* %80, i64 %94
  store double %97, double addrspace(1)* %98, align 8, !tbaa !16
  %99 = or i64 %88, 2
  %100 = getelementptr inbounds double, double addrspace(1)* %79, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !16
  %102 = fmul contract double %77, %101
  %103 = getelementptr inbounds double, double addrspace(1)* %80, i64 %99
  store double %102, double addrspace(1)* %103, align 8, !tbaa !16
  %104 = or i64 %88, 3
  %105 = getelementptr inbounds double, double addrspace(1)* %79, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !16
  %107 = fmul contract double %77, %106
  %108 = getelementptr inbounds double, double addrspace(1)* %80, i64 %104
  store double %107, double addrspace(1)* %108, align 8, !tbaa !16
  %109 = or i64 %88, 4
  %110 = getelementptr inbounds double, double addrspace(1)* %79, i64 %109
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !16
  %112 = fmul contract double %77, %111
  %113 = getelementptr inbounds double, double addrspace(1)* %80, i64 %109
  store double %112, double addrspace(1)* %113, align 8, !tbaa !16
  %114 = or i64 %88, 5
  %115 = getelementptr inbounds double, double addrspace(1)* %79, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !16
  %117 = fmul contract double %77, %116
  %118 = getelementptr inbounds double, double addrspace(1)* %80, i64 %114
  store double %117, double addrspace(1)* %118, align 8, !tbaa !16
  %119 = or i64 %88, 6
  %120 = getelementptr inbounds double, double addrspace(1)* %79, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !16
  %122 = fmul contract double %77, %121
  %123 = getelementptr inbounds double, double addrspace(1)* %80, i64 %119
  store double %122, double addrspace(1)* %123, align 8, !tbaa !16
  %124 = or i64 %88, 7
  %125 = getelementptr inbounds double, double addrspace(1)* %79, i64 %124
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !16
  %127 = fmul contract double %77, %126
  %128 = getelementptr inbounds double, double addrspace(1)* %80, i64 %124
  store double %127, double addrspace(1)* %128, align 8, !tbaa !16
  %129 = add nuw i64 %88, 8
  %130 = add i64 %89, 8
  %131 = icmp eq i64 %130, %86
  br i1 %131, label %132, label %87, !llvm.loop !20

132:                                              ; preds = %87, %82
  %133 = phi i64 [ 0, %82 ], [ %129, %87 ]
  %134 = icmp eq i64 %83, 0
  br i1 %134, label %145, label %135

135:                                              ; preds = %132, %135
  %136 = phi i64 [ %142, %135 ], [ %133, %132 ]
  %137 = phi i64 [ %143, %135 ], [ 0, %132 ]
  %138 = getelementptr inbounds double, double addrspace(1)* %79, i64 %136
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !16
  %140 = fmul contract double %77, %139
  %141 = getelementptr inbounds double, double addrspace(1)* %80, i64 %136
  store double %140, double addrspace(1)* %141, align 8, !tbaa !16
  %142 = add nuw i64 %136, 1
  %143 = add i64 %137, 1
  %144 = icmp eq i64 %143, %83
  br i1 %144, label %145, label %135, !llvm.loop !22

145:                                              ; preds = %132, %135, %29, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
