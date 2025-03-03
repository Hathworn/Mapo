; ModuleID = '../data/hip_kernels/7064/33/main.cu'
source_filename = "../data/hip_kernels/7064/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18gLSTMOutputForwardPfPKfS1_S1_S1_mm(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i64 %5, i64 %6) local_unnamed_addr #0 {
  %8 = icmp eq i64 %5, 0
  br i1 %8, label %27, label %9

9:                                                ; preds = %7
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = icmp eq i64 %6, 0
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %13 = trunc i64 %6 to i32
  %14 = mul i32 %13, 3
  %15 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !4
  %21 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %22 = zext i16 %21 to i32
  %23 = udiv i32 %20, %22
  %24 = mul i32 %23, %22
  %25 = icmp ugt i32 %20, %24
  %26 = zext i1 %25 to i32
  br label %28

27:                                               ; preds = %134, %7
  ret void

28:                                               ; preds = %9, %134
  %29 = phi i32 [ 0, %9 ], [ %136, %134 ]
  %30 = add i32 %29, %10
  %31 = sext i32 %30 to i64
  %32 = icmp ult i64 %31, %5
  br i1 %32, label %33, label %134

33:                                               ; preds = %28
  %34 = mul i64 %31, %6
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %37 = shl i64 %34, 2
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  br i1 %11, label %134, label %40

40:                                               ; preds = %33, %130
  %41 = phi i32 [ %131, %130 ], [ 0, %33 ]
  %42 = add i32 %41, %12
  %43 = sext i32 %42 to i64
  %44 = icmp ult i64 %43, %6
  br i1 %44, label %45, label %130

45:                                               ; preds = %40
  %46 = add i32 %42, %14
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %38, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !15
  %50 = getelementptr inbounds float, float addrspace(1)* %39, i64 %47
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !15
  %52 = fadd contract float %49, %51
  %53 = getelementptr inbounds float, float addrspace(1)* %4, i64 %47
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !15
  %55 = fadd contract float %52, %54
  %56 = fcmp contract ult float %55, 0.000000e+00
  br i1 %56, label %74, label %57

57:                                               ; preds = %45
  %58 = fneg contract float %55
  %59 = fmul float %55, 0xBFF7154760000000
  %60 = tail call float @llvm.rint.f32(float %59)
  %61 = fcmp olt float %55, 0xC0562E4300000000
  %62 = fcmp ogt float %55, 0x4059D1DA00000000
  %63 = fneg float %59
  %64 = tail call float @llvm.fma.f32(float %58, float 0x3FF7154760000000, float %63)
  %65 = tail call float @llvm.fma.f32(float %58, float 0x3E54AE0BE0000000, float %64)
  %66 = fsub float %59, %60
  %67 = fadd float %65, %66
  %68 = tail call float @llvm.exp2.f32(float %67)
  %69 = fptosi float %60 to i32
  %70 = tail call float @llvm.amdgcn.ldexp.f32(float %68, i32 %69)
  %71 = select i1 %62, float 0.000000e+00, float %70
  %72 = select i1 %61, float 0x7FF0000000000000, float %71
  %73 = fpext float %72 to double
  br label %90

74:                                               ; preds = %45
  %75 = fmul float %55, 0x3FF7154760000000
  %76 = tail call float @llvm.rint.f32(float %75)
  %77 = fcmp ogt float %55, 0x40562E4300000000
  %78 = fcmp olt float %55, 0xC059D1DA00000000
  %79 = fneg float %75
  %80 = tail call float @llvm.fma.f32(float %55, float 0x3FF7154760000000, float %79)
  %81 = tail call float @llvm.fma.f32(float %55, float 0x3E54AE0BE0000000, float %80)
  %82 = fsub float %75, %76
  %83 = fadd float %81, %82
  %84 = tail call float @llvm.exp2.f32(float %83)
  %85 = fptosi float %76 to i32
  %86 = tail call float @llvm.amdgcn.ldexp.f32(float %84, i32 %85)
  %87 = select i1 %78, float 0.000000e+00, float %86
  %88 = select i1 %77, float 0x7FF0000000000000, float %87
  %89 = fpext float %88 to double
  br label %90

90:                                               ; preds = %57, %74
  %91 = phi double [ %89, %74 ], [ %73, %57 ]
  %92 = phi double [ %89, %74 ], [ 1.000000e+00, %57 ]
  %93 = fadd contract double %91, 1.000000e+00
  %94 = fdiv contract double %92, %93
  %95 = fptrunc double %94 to float
  %96 = getelementptr inbounds float, float addrspace(1)* %36, i64 %43
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !15
  %98 = tail call float @llvm.fabs.f32(float %97)
  %99 = fcmp olt float %98, 6.250000e-01
  br i1 %99, label %100, label %108

100:                                              ; preds = %90
  %101 = fmul float %97, %97
  %102 = tail call float @llvm.fmuladd.f32(float %101, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %103 = tail call float @llvm.fmuladd.f32(float %101, float %102, float 0xBFAB8389C0000000)
  %104 = tail call float @llvm.fmuladd.f32(float %101, float %103, float 0x3FC1107040000000)
  %105 = tail call float @llvm.fmuladd.f32(float %101, float %104, float 0xBFD5555320000000)
  %106 = fmul float %98, %105
  %107 = tail call float @llvm.fmuladd.f32(float %101, float %106, float %98)
  br label %125

108:                                              ; preds = %90
  %109 = fmul float %98, 2.000000e+00
  %110 = fmul float %109, 0x3FF7154760000000
  %111 = tail call float @llvm.rint.f32(float %110)
  %112 = fcmp ogt float %109, 0x40562E4300000000
  %113 = fneg float %110
  %114 = tail call float @llvm.fma.f32(float %109, float 0x3FF7154760000000, float %113)
  %115 = tail call float @llvm.fma.f32(float %109, float 0x3E54AE0BE0000000, float %114)
  %116 = fsub float %110, %111
  %117 = fadd float %115, %116
  %118 = tail call float @llvm.exp2.f32(float %117)
  %119 = fptosi float %111 to i32
  %120 = tail call float @llvm.amdgcn.ldexp.f32(float %118, i32 %119)
  %121 = fadd float %120, 1.000000e+00
  %122 = select i1 %112, float 0x7FF0000000000000, float %121
  %123 = tail call float @llvm.amdgcn.rcp.f32(float %122)
  %124 = tail call float @llvm.fmuladd.f32(float %123, float -2.000000e+00, float 1.000000e+00)
  br label %125

125:                                              ; preds = %100, %108
  %126 = phi float [ %107, %100 ], [ %124, %108 ]
  %127 = tail call float @llvm.copysign.f32(float %126, float %97)
  %128 = fmul contract float %127, %95
  %129 = getelementptr inbounds float, float addrspace(1)* %35, i64 %43
  store float %128, float addrspace(1)* %129, align 4, !tbaa !15
  br label %130

130:                                              ; preds = %125, %40
  %131 = add i32 %41, %22
  %132 = sext i32 %131 to i64
  %133 = icmp ult i64 %132, %6
  br i1 %133, label %40, label %134, !llvm.loop !19

134:                                              ; preds = %130, %33, %28
  %135 = add i32 %23, %29
  %136 = add i32 %135, %26
  %137 = sext i32 %136 to i64
  %138 = icmp ult i64 %137, %5
  br i1 %138, label %28, label %27, !llvm.loop !21
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
