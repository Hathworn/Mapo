; ModuleID = '../data/hip_kernels/10552/41/main.cu'
source_filename = "../data/hip_kernels/10552/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9_kgauss64iiPdPiS0_S_S0_S0_S_d(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture writeonly %8, double %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = mul i32 %12, %17
  %22 = add i32 %21, %11
  %23 = mul nsw i32 %1, %0
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %134

25:                                               ; preds = %10
  %26 = fneg contract double %9
  %27 = udiv i32 %20, %17
  %28 = mul i32 %27, %17
  %29 = icmp ugt i32 %20, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %17
  br label %33

33:                                               ; preds = %25, %105
  %34 = phi i32 [ %22, %25 ], [ %132, %105 ]
  %35 = freeze i32 %34
  %36 = freeze i32 %0
  %37 = sdiv i32 %35, %36
  %38 = mul i32 %37, %36
  %39 = sub i32 %35, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %40
  %42 = bitcast i32 addrspace(1)* %41 to <2 x i32> addrspace(1)*
  %43 = load <2 x i32>, <2 x i32> addrspace(1)* %42, align 4, !tbaa !16
  %44 = extractelement <2 x i32> %43, i64 1
  %45 = add nsw i32 %44, -1
  %46 = sext i32 %37 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %46
  %48 = bitcast i32 addrspace(1)* %47 to <2 x i32> addrspace(1)*
  %49 = load <2 x i32>, <2 x i32> addrspace(1)* %48, align 4, !tbaa !16
  %50 = extractelement <2 x i32> %49, i64 1
  %51 = add nsw i32 %50, -1
  %52 = extractelement <2 x i32> %43, i64 0
  %53 = icmp slt i32 %52, %44
  %54 = extractelement <2 x i32> %49, i64 0
  %55 = icmp slt i32 %54, %50
  %56 = select i1 %53, i1 true, i1 %55
  br i1 %56, label %57, label %105

57:                                               ; preds = %33
  %58 = add nsw i32 %54, -1
  %59 = add nsw i32 %52, -1
  br label %60

60:                                               ; preds = %57, %96
  %61 = phi i1 [ %103, %96 ], [ %55, %57 ]
  %62 = phi i1 [ %102, %96 ], [ %53, %57 ]
  %63 = phi double [ %101, %96 ], [ 0.000000e+00, %57 ]
  %64 = phi i32 [ %98, %96 ], [ %59, %57 ]
  %65 = phi i32 [ %97, %96 ], [ %58, %57 ]
  br i1 %62, label %66, label %70

66:                                               ; preds = %60
  %67 = sext i32 %64 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !6
  br label %70

70:                                               ; preds = %60, %66
  %71 = phi i32 [ %69, %66 ], [ 2147483647, %60 ]
  br i1 %61, label %72, label %76

72:                                               ; preds = %70
  %73 = sext i32 %65 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !16, !amdgpu.noclobber !6
  br label %76

76:                                               ; preds = %70, %72
  %77 = phi i32 [ %75, %72 ], [ 2147483647, %70 ]
  %78 = icmp slt i32 %77, %71
  br i1 %78, label %79, label %84

79:                                               ; preds = %76
  %80 = add nsw i32 %65, 1
  %81 = sext i32 %65 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %5, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !20
  br label %96

84:                                               ; preds = %76
  %85 = icmp slt i32 %71, %77
  %86 = add nsw i32 %64, 1
  %87 = sext i32 %64 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %2, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !20
  br i1 %85, label %96, label %90

90:                                               ; preds = %84
  %91 = add nsw i32 %65, 1
  %92 = sext i32 %65 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %5, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !20
  %95 = fsub contract double %89, %94
  br label %96

96:                                               ; preds = %84, %90, %79
  %97 = phi i32 [ %80, %79 ], [ %91, %90 ], [ %65, %84 ]
  %98 = phi i32 [ %64, %79 ], [ %86, %90 ], [ %86, %84 ]
  %99 = phi contract double [ %83, %79 ], [ %95, %90 ], [ %89, %84 ]
  %100 = fmul contract double %99, %99
  %101 = fadd contract double %63, %100
  %102 = icmp slt i32 %98, %45
  %103 = icmp slt i32 %97, %51
  %104 = select i1 %102, i1 true, i1 %103
  br i1 %104, label %60, label %105, !llvm.loop !22

105:                                              ; preds = %96, %33
  %106 = phi double [ 0.000000e+00, %33 ], [ %101, %96 ]
  %107 = fmul contract double %106, %26
  %108 = fmul double %107, 0x3FF71547652B82FE
  %109 = tail call double @llvm.rint.f64(double %108)
  %110 = fneg double %109
  %111 = tail call double @llvm.fma.f64(double %110, double 0x3FE62E42FEFA39EF, double %107)
  %112 = tail call double @llvm.fma.f64(double %110, double 0x3C7ABC9E3B39803F, double %111)
  %113 = tail call double @llvm.fma.f64(double %112, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %114 = tail call double @llvm.fma.f64(double %112, double %113, double 0x3EC71DEE623FDE64)
  %115 = tail call double @llvm.fma.f64(double %112, double %114, double 0x3EFA01997C89E6B0)
  %116 = tail call double @llvm.fma.f64(double %112, double %115, double 0x3F2A01A014761F6E)
  %117 = tail call double @llvm.fma.f64(double %112, double %116, double 0x3F56C16C1852B7B0)
  %118 = tail call double @llvm.fma.f64(double %112, double %117, double 0x3F81111111122322)
  %119 = tail call double @llvm.fma.f64(double %112, double %118, double 0x3FA55555555502A1)
  %120 = tail call double @llvm.fma.f64(double %112, double %119, double 0x3FC5555555555511)
  %121 = tail call double @llvm.fma.f64(double %112, double %120, double 0x3FE000000000000B)
  %122 = tail call double @llvm.fma.f64(double %112, double %121, double 1.000000e+00)
  %123 = tail call double @llvm.fma.f64(double %112, double %122, double 1.000000e+00)
  %124 = fptosi double %109 to i32
  %125 = tail call double @llvm.amdgcn.ldexp.f64(double %123, i32 %124)
  %126 = fcmp ogt double %107, 1.024000e+03
  %127 = select i1 %126, double 0x7FF0000000000000, double %125
  %128 = fcmp olt double %107, -1.075000e+03
  %129 = select i1 %128, double 0.000000e+00, double %127
  %130 = sext i32 %34 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %8, i64 %130
  store double %129, double addrspace(1)* %131, align 8, !tbaa !20
  %132 = add i32 %32, %34
  %133 = icmp slt i32 %132, %23
  br i1 %133, label %33, label %134, !llvm.loop !24

134:                                              ; preds = %105, %10
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
!21 = !{!"double", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
