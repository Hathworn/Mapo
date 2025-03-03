; ModuleID = '../data/hip_kernels/10552/40/main.cu'
source_filename = "../data/hip_kernels/10552/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9_kgauss32iiPfPiS0_S_S0_S0_S_f(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8, float %9) local_unnamed_addr #0 {
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
  br i1 %24, label %25, label %137

25:                                               ; preds = %10
  %26 = fneg contract float %9
  %27 = fpext float %26 to double
  %28 = udiv i32 %20, %17
  %29 = mul i32 %28, %17
  %30 = icmp ugt i32 %20, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %17
  br label %34

34:                                               ; preds = %25, %107
  %35 = phi i32 [ %22, %25 ], [ %135, %107 ]
  %36 = freeze i32 %35
  %37 = freeze i32 %0
  %38 = sdiv i32 %36, %37
  %39 = mul i32 %38, %37
  %40 = sub i32 %36, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %41
  %43 = bitcast i32 addrspace(1)* %42 to <2 x i32> addrspace(1)*
  %44 = load <2 x i32>, <2 x i32> addrspace(1)* %43, align 4, !tbaa !16
  %45 = extractelement <2 x i32> %44, i64 1
  %46 = add nsw i32 %45, -1
  %47 = sext i32 %38 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %47
  %49 = bitcast i32 addrspace(1)* %48 to <2 x i32> addrspace(1)*
  %50 = load <2 x i32>, <2 x i32> addrspace(1)* %49, align 4, !tbaa !16
  %51 = extractelement <2 x i32> %50, i64 1
  %52 = add nsw i32 %51, -1
  %53 = extractelement <2 x i32> %44, i64 0
  %54 = icmp slt i32 %53, %45
  %55 = extractelement <2 x i32> %50, i64 0
  %56 = icmp slt i32 %55, %51
  %57 = select i1 %54, i1 true, i1 %56
  br i1 %57, label %58, label %107

58:                                               ; preds = %34
  %59 = add nsw i32 %55, -1
  %60 = add nsw i32 %53, -1
  br label %61

61:                                               ; preds = %58, %97
  %62 = phi i1 [ %105, %97 ], [ %56, %58 ]
  %63 = phi i1 [ %104, %97 ], [ %54, %58 ]
  %64 = phi double [ %103, %97 ], [ 0.000000e+00, %58 ]
  %65 = phi i32 [ %99, %97 ], [ %60, %58 ]
  %66 = phi i32 [ %98, %97 ], [ %59, %58 ]
  br i1 %63, label %67, label %71

67:                                               ; preds = %61
  %68 = sext i32 %65 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !16, !amdgpu.noclobber !6
  br label %71

71:                                               ; preds = %61, %67
  %72 = phi i32 [ %70, %67 ], [ 2147483647, %61 ]
  br i1 %62, label %73, label %77

73:                                               ; preds = %71
  %74 = sext i32 %66 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !6
  br label %77

77:                                               ; preds = %71, %73
  %78 = phi i32 [ %76, %73 ], [ 2147483647, %71 ]
  %79 = icmp slt i32 %78, %72
  br i1 %79, label %80, label %85

80:                                               ; preds = %77
  %81 = add nsw i32 %66, 1
  %82 = sext i32 %66 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %5, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !20
  br label %97

85:                                               ; preds = %77
  %86 = icmp slt i32 %72, %78
  %87 = add nsw i32 %65, 1
  %88 = sext i32 %65 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %2, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !20
  br i1 %86, label %97, label %91

91:                                               ; preds = %85
  %92 = add nsw i32 %66, 1
  %93 = sext i32 %66 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %5, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !20
  %96 = fsub contract float %90, %95
  br label %97

97:                                               ; preds = %85, %91, %80
  %98 = phi i32 [ %81, %80 ], [ %92, %91 ], [ %66, %85 ]
  %99 = phi i32 [ %65, %80 ], [ %87, %91 ], [ %87, %85 ]
  %100 = phi contract float [ %84, %80 ], [ %96, %91 ], [ %90, %85 ]
  %101 = fpext float %100 to double
  %102 = fmul contract double %101, %101
  %103 = fadd contract double %64, %102
  %104 = icmp slt i32 %99, %46
  %105 = icmp slt i32 %98, %52
  %106 = select i1 %104, i1 true, i1 %105
  br i1 %106, label %61, label %107, !llvm.loop !22

107:                                              ; preds = %97, %34
  %108 = phi double [ 0.000000e+00, %34 ], [ %103, %97 ]
  %109 = fmul contract double %108, %27
  %110 = fmul double %109, 0x3FF71547652B82FE
  %111 = tail call double @llvm.rint.f64(double %110)
  %112 = fneg double %111
  %113 = tail call double @llvm.fma.f64(double %112, double 0x3FE62E42FEFA39EF, double %109)
  %114 = tail call double @llvm.fma.f64(double %112, double 0x3C7ABC9E3B39803F, double %113)
  %115 = tail call double @llvm.fma.f64(double %114, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %116 = tail call double @llvm.fma.f64(double %114, double %115, double 0x3EC71DEE623FDE64)
  %117 = tail call double @llvm.fma.f64(double %114, double %116, double 0x3EFA01997C89E6B0)
  %118 = tail call double @llvm.fma.f64(double %114, double %117, double 0x3F2A01A014761F6E)
  %119 = tail call double @llvm.fma.f64(double %114, double %118, double 0x3F56C16C1852B7B0)
  %120 = tail call double @llvm.fma.f64(double %114, double %119, double 0x3F81111111122322)
  %121 = tail call double @llvm.fma.f64(double %114, double %120, double 0x3FA55555555502A1)
  %122 = tail call double @llvm.fma.f64(double %114, double %121, double 0x3FC5555555555511)
  %123 = tail call double @llvm.fma.f64(double %114, double %122, double 0x3FE000000000000B)
  %124 = tail call double @llvm.fma.f64(double %114, double %123, double 1.000000e+00)
  %125 = tail call double @llvm.fma.f64(double %114, double %124, double 1.000000e+00)
  %126 = fptosi double %111 to i32
  %127 = tail call double @llvm.amdgcn.ldexp.f64(double %125, i32 %126)
  %128 = fcmp ogt double %109, 1.024000e+03
  %129 = select i1 %128, double 0x7FF0000000000000, double %127
  %130 = fcmp olt double %109, -1.075000e+03
  %131 = select i1 %130, double 0.000000e+00, double %129
  %132 = fptrunc double %131 to float
  %133 = sext i32 %35 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %8, i64 %133
  store float %132, float addrspace(1)* %134, align 4, !tbaa !20
  %135 = add i32 %33, %35
  %136 = icmp slt i32 %135, %23
  br i1 %136, label %34, label %137, !llvm.loop !24

137:                                              ; preds = %107, %10
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
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
