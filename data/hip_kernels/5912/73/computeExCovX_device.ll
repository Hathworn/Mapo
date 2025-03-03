; ModuleID = '../data/hip_kernels/5912/73/main.cu'
source_filename = "../data/hip_kernels/5912/73/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13computeExCovXPfS_S_PiS0_S0_iPdS1_S1_ddS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double %10, double %11, double addrspace(1)* nocapture writeonly %12, double addrspace(1)* nocapture readonly %13, double addrspace(1)* nocapture readonly %14, double addrspace(1)* nocapture readonly %15, double addrspace(1)* nocapture readonly %16, double addrspace(1)* nocapture readonly %17, double addrspace(1)* nocapture readonly %18, double addrspace(1)* nocapture readonly %19, double addrspace(1)* nocapture readonly %20, double addrspace(1)* nocapture readonly %21) local_unnamed_addr #0 {
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 12
  %31 = bitcast i8 addrspace(4)* %30 to i32 addrspace(4)*
  %32 = load i32, i32 addrspace(4)* %31, align 4, !tbaa !7
  %33 = mul i32 %24, %29
  %34 = add i32 %33, %23
  %35 = udiv i32 %32, %29
  %36 = mul i32 %35, %29
  %37 = icmp ugt i32 %32, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = mul i32 %39, %29
  %41 = icmp slt i32 %34, %6
  br i1 %41, label %42, label %44

42:                                               ; preds = %22
  %43 = fneg contract double %11
  br label %45

44:                                               ; preds = %67, %22
  ret void

45:                                               ; preds = %42, %67
  %46 = phi i32 [ %34, %42 ], [ %68, %67 ]
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !6
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !20, !amdgpu.noclobber !6
  %53 = fpext float %52 to double
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !20, !amdgpu.noclobber !6
  %56 = fpext float %55 to double
  %57 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !20, !amdgpu.noclobber !6
  %59 = fpext float %58 to double
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !16, !amdgpu.noclobber !6
  %62 = add nsw i32 %46, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !6
  %66 = icmp slt i32 %61, %65
  br i1 %66, label %70, label %67

67:                                               ; preds = %70, %45
  %68 = add nsw i32 %46, %40
  %69 = icmp slt i32 %68, %6
  br i1 %69, label %45, label %44, !llvm.loop !22

70:                                               ; preds = %45, %70
  %71 = phi i32 [ %148, %70 ], [ %61, %45 ]
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !16, !amdgpu.noclobber !6
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %7, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !24
  %78 = fsub contract double %53, %77
  %79 = getelementptr inbounds double, double addrspace(1)* %8, i64 %75
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !24
  %81 = fsub contract double %56, %80
  %82 = getelementptr inbounds double, double addrspace(1)* %9, i64 %75
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !24
  %84 = fsub contract double %59, %83
  %85 = getelementptr inbounds double, double addrspace(1)* %13, i64 %75
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !24
  %87 = fmul contract double %78, %86
  %88 = getelementptr inbounds double, double addrspace(1)* %14, i64 %75
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !24
  %90 = fmul contract double %81, %89
  %91 = fadd contract double %87, %90
  %92 = getelementptr inbounds double, double addrspace(1)* %15, i64 %75
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !24
  %94 = fmul contract double %84, %93
  %95 = fadd contract double %91, %94
  %96 = fmul contract double %78, %95
  %97 = getelementptr inbounds double, double addrspace(1)* %16, i64 %75
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !24
  %99 = fmul contract double %78, %98
  %100 = getelementptr inbounds double, double addrspace(1)* %17, i64 %75
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !24
  %102 = fmul contract double %81, %101
  %103 = fadd contract double %99, %102
  %104 = getelementptr inbounds double, double addrspace(1)* %18, i64 %75
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !24
  %106 = fmul contract double %84, %105
  %107 = fadd contract double %103, %106
  %108 = fmul contract double %81, %107
  %109 = fadd contract double %96, %108
  %110 = getelementptr inbounds double, double addrspace(1)* %19, i64 %75
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !24
  %112 = fmul contract double %78, %111
  %113 = getelementptr inbounds double, double addrspace(1)* %20, i64 %75
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !24
  %115 = fmul contract double %81, %114
  %116 = fadd contract double %112, %115
  %117 = getelementptr inbounds double, double addrspace(1)* %21, i64 %75
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !24
  %119 = fmul contract double %84, %118
  %120 = fadd contract double %116, %119
  %121 = fmul contract double %84, %120
  %122 = fadd contract double %109, %121
  %123 = fmul contract double %122, %43
  %124 = fmul contract double %123, 5.000000e-01
  %125 = fmul double %124, 0x3FF71547652B82FE
  %126 = tail call double @llvm.rint.f64(double %125)
  %127 = fneg double %126
  %128 = tail call double @llvm.fma.f64(double %127, double 0x3FE62E42FEFA39EF, double %124)
  %129 = tail call double @llvm.fma.f64(double %127, double 0x3C7ABC9E3B39803F, double %128)
  %130 = tail call double @llvm.fma.f64(double %129, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %131 = tail call double @llvm.fma.f64(double %129, double %130, double 0x3EC71DEE623FDE64)
  %132 = tail call double @llvm.fma.f64(double %129, double %131, double 0x3EFA01997C89E6B0)
  %133 = tail call double @llvm.fma.f64(double %129, double %132, double 0x3F2A01A014761F6E)
  %134 = tail call double @llvm.fma.f64(double %129, double %133, double 0x3F56C16C1852B7B0)
  %135 = tail call double @llvm.fma.f64(double %129, double %134, double 0x3F81111111122322)
  %136 = tail call double @llvm.fma.f64(double %129, double %135, double 0x3FA55555555502A1)
  %137 = tail call double @llvm.fma.f64(double %129, double %136, double 0x3FC5555555555511)
  %138 = tail call double @llvm.fma.f64(double %129, double %137, double 0x3FE000000000000B)
  %139 = tail call double @llvm.fma.f64(double %129, double %138, double 1.000000e+00)
  %140 = tail call double @llvm.fma.f64(double %129, double %139, double 1.000000e+00)
  %141 = fptosi double %126 to i32
  %142 = tail call double @llvm.amdgcn.ldexp.f64(double %140, i32 %141)
  %143 = fcmp ogt double %124, 1.024000e+03
  %144 = select i1 %143, double 0x7FF0000000000000, double %142
  %145 = fcmp olt double %124, -1.075000e+03
  %146 = select i1 %145, double 0.000000e+00, double %144
  %147 = getelementptr inbounds double, double addrspace(1)* %12, i64 %72
  store double %146, double addrspace(1)* %147, align 8, !tbaa !24
  %148 = add nsw i32 %71, 1
  %149 = icmp slt i32 %148, %65
  br i1 %149, label %70, label %67, !llvm.loop !26
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = !{!25, !25, i64 0}
!25 = !{!"double", !18, i64 0}
!26 = distinct !{!26, !23}
