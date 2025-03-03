; ModuleID = '../data/hip_kernels/4388/1/main.cu'
source_filename = "../data/hip_kernels/4388/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24processMandelbrotElementPdPKdS1_jj(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !13
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !13
  %15 = bitcast i8 addrspace(4)* %12 to <2 x i16> addrspace(4)*
  %16 = load <2 x i16>, <2 x i16> addrspace(4)* %15, align 4, !invariant.load !14
  %17 = zext <2 x i16> %16 to <2 x i32>
  %18 = extractelement <2 x i32> %17, i64 0
  %19 = udiv i32 %11, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %11, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %7
  %25 = add i32 %24, %6
  %26 = zext i32 %25 to i64
  %27 = mul nuw nsw i32 %14, %18
  %28 = add nuw nsw i32 %27, %13
  %29 = zext i32 %28 to i64
  %30 = extractelement <2 x i32> %17, i64 1
  %31 = mul nuw nsw i32 %30, %18
  %32 = zext i32 %31 to i64
  %33 = mul nuw nsw i64 %26, %32
  %34 = add nuw nsw i64 %33, %29
  %35 = zext i32 %4 to i64
  %36 = icmp ult i64 %34, %35
  br i1 %36, label %37, label %142

37:                                               ; preds = %5
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !15, !amdgpu.noclobber !14
  %40 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !15, !amdgpu.noclobber !14
  br label %42

42:                                               ; preds = %50, %37
  %43 = phi double [ %39, %37 ], [ %53, %50 ]
  %44 = phi i32 [ 0, %37 ], [ %51, %50 ]
  %45 = phi double [ %41, %37 ], [ %56, %50 ]
  %46 = fmul contract double %43, %43
  %47 = fmul contract double %45, %45
  %48 = fadd contract double %46, %47
  %49 = fcmp contract ugt double %48, 4.000000e+00
  br i1 %49, label %58, label %50

50:                                               ; preds = %42
  %51 = add i32 %44, 1
  %52 = fsub contract double %46, %47
  %53 = fadd contract double %39, %52
  %54 = fmul contract double %43, 2.000000e+00
  %55 = fmul contract double %54, %45
  %56 = fadd contract double %41, %55
  %57 = icmp ugt i32 %51, %3
  br i1 %57, label %58, label %42, !llvm.loop !19

58:                                               ; preds = %42, %50
  %59 = phi i32 [ %51, %50 ], [ %44, %42 ]
  %60 = add i32 %59, 1
  %61 = uitofp i32 %60 to double
  %62 = tail call double @llvm.amdgcn.frexp.mant.f64(double %61)
  %63 = fcmp olt double %62, 0x3FE5555555555555
  %64 = zext i1 %63 to i32
  %65 = tail call double @llvm.amdgcn.ldexp.f64(double %62, i32 %64)
  %66 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %61)
  %67 = sub nsw i32 %66, %64
  %68 = fadd double %65, -1.000000e+00
  %69 = fadd double %65, 1.000000e+00
  %70 = fadd double %69, -1.000000e+00
  %71 = fsub double %65, %70
  %72 = tail call double @llvm.amdgcn.rcp.f64(double %69)
  %73 = fneg double %69
  %74 = tail call double @llvm.fma.f64(double %73, double %72, double 1.000000e+00)
  %75 = tail call double @llvm.fma.f64(double %74, double %72, double %72)
  %76 = tail call double @llvm.fma.f64(double %73, double %75, double 1.000000e+00)
  %77 = tail call double @llvm.fma.f64(double %76, double %75, double %75)
  %78 = fmul double %68, %77
  %79 = fmul double %69, %78
  %80 = fneg double %79
  %81 = tail call double @llvm.fma.f64(double %78, double %69, double %80)
  %82 = tail call double @llvm.fma.f64(double %78, double %71, double %81)
  %83 = fadd double %79, %82
  %84 = fsub double %83, %79
  %85 = fsub double %82, %84
  %86 = fsub double %68, %83
  %87 = fsub double %68, %86
  %88 = fsub double %87, %83
  %89 = fsub double %88, %85
  %90 = fadd double %86, %89
  %91 = fmul double %77, %90
  %92 = fadd double %78, %91
  %93 = fsub double %92, %78
  %94 = fsub double %91, %93
  %95 = fmul double %92, %92
  %96 = tail call double @llvm.fma.f64(double %95, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %97 = tail call double @llvm.fma.f64(double %95, double %96, double 0x3FC7474DD7F4DF2E)
  %98 = tail call double @llvm.fma.f64(double %95, double %97, double 0x3FCC71C016291751)
  %99 = tail call double @llvm.fma.f64(double %95, double %98, double 0x3FD249249B27ACF1)
  %100 = tail call double @llvm.fma.f64(double %95, double %99, double 0x3FD99999998EF7B6)
  %101 = tail call double @llvm.fma.f64(double %95, double %100, double 0x3FE5555555555780)
  %102 = tail call double @llvm.amdgcn.ldexp.f64(double %92, i32 1)
  %103 = tail call double @llvm.amdgcn.ldexp.f64(double %94, i32 1)
  %104 = fmul double %92, %95
  %105 = fmul double %104, %101
  %106 = fadd double %102, %105
  %107 = fsub double %106, %102
  %108 = fsub double %105, %107
  %109 = fadd double %103, %108
  %110 = fadd double %106, %109
  %111 = fsub double %110, %106
  %112 = fsub double %109, %111
  %113 = sitofp i32 %67 to double
  %114 = fmul double %113, 0x3FE62E42FEFA39EF
  %115 = fneg double %114
  %116 = tail call double @llvm.fma.f64(double %113, double 0x3FE62E42FEFA39EF, double %115)
  %117 = tail call double @llvm.fma.f64(double %113, double 0x3C7ABC9E3B39803F, double %116)
  %118 = fadd double %114, %117
  %119 = fsub double %118, %114
  %120 = fsub double %117, %119
  %121 = fadd double %118, %110
  %122 = fsub double %121, %118
  %123 = fsub double %121, %122
  %124 = fsub double %118, %123
  %125 = fsub double %110, %122
  %126 = fadd double %125, %124
  %127 = fadd double %120, %112
  %128 = fsub double %127, %120
  %129 = fsub double %127, %128
  %130 = fsub double %120, %129
  %131 = fsub double %112, %128
  %132 = fadd double %131, %130
  %133 = fadd double %127, %126
  %134 = fadd double %121, %133
  %135 = fsub double %134, %121
  %136 = fsub double %133, %135
  %137 = fadd double %132, %136
  %138 = fadd double %134, %137
  %139 = icmp eq i32 %60, 0
  %140 = select i1 %139, double 0xFFF0000000000000, double %138
  %141 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  store double %140, double addrspace(1)* %141, align 8, !tbaa !15
  br label %142

142:                                              ; preds = %5, %58
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!13 = !{i32 0, i32 1024}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"double", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
