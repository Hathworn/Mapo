; ModuleID = '../data/hip_kernels/16034/34/main.cu'
source_filename = "../data/hip_kernels/16034/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_asin(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %117

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp oge double %36, 5.000000e-01
  %38 = tail call double @llvm.fma.f64(double %36, double -5.000000e-01, double 5.000000e-01)
  %39 = fmul double %35, %35
  %40 = select i1 %37, double %38, double %39
  %41 = tail call double @llvm.fma.f64(double %40, double 0x3FA059859FEA6A70, double 0xBF90A5A378A05EAF)
  %42 = tail call double @llvm.fma.f64(double %40, double %41, double 0x3F94052137024D6A)
  %43 = tail call double @llvm.fma.f64(double %40, double %42, double 0x3F7AB3A098A70509)
  %44 = tail call double @llvm.fma.f64(double %40, double %43, double 0x3F88ED60A300C8D2)
  %45 = tail call double @llvm.fma.f64(double %40, double %44, double 0x3F8C6FA84B77012B)
  %46 = tail call double @llvm.fma.f64(double %40, double %45, double 0x3F91C6C111DCCB70)
  %47 = tail call double @llvm.fma.f64(double %40, double %46, double 0x3F96E89F0A0ADACF)
  %48 = tail call double @llvm.fma.f64(double %40, double %47, double 0x3F9F1C72C668963F)
  %49 = tail call double @llvm.fma.f64(double %40, double %48, double 0x3FA6DB6DB41CE4BD)
  %50 = tail call double @llvm.fma.f64(double %40, double %49, double 0x3FB333333336FD5B)
  %51 = tail call double @llvm.fma.f64(double %40, double %50, double 0x3FC5555555555380)
  %52 = fmul double %40, %51
  %53 = tail call double @llvm.fma.f64(double %36, double %52, double %36)
  br i1 %37, label %54, label %113

54:                                               ; preds = %32
  %55 = tail call double @llvm.amdgcn.rsq.f64(double %40)
  %56 = fmul double %40, %55
  %57 = fmul double %55, 5.000000e-01
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %58, double %56, double 5.000000e-01)
  %60 = tail call double @llvm.fma.f64(double %57, double %59, double %57)
  %61 = tail call double @llvm.fma.f64(double %56, double %59, double %56)
  %62 = fneg double %61
  %63 = tail call double @llvm.fma.f64(double %62, double %61, double %40)
  %64 = tail call double @llvm.fma.f64(double %63, double %60, double %61)
  %65 = fcmp oeq double %40, 0.000000e+00
  %66 = select i1 %65, double %40, double %64
  %67 = fmul double %66, %66
  %68 = fneg double %67
  %69 = tail call double @llvm.fma.f64(double %66, double %66, double %68)
  %70 = fsub double %40, %67
  %71 = fsub double %40, %70
  %72 = fsub double %71, %67
  %73 = fsub double %72, %69
  %74 = fadd double %70, %73
  %75 = fmul double %66, 2.000000e+00
  %76 = tail call double @llvm.amdgcn.rcp.f64(double %75)
  %77 = fneg double %75
  %78 = tail call double @llvm.fma.f64(double %77, double %76, double 1.000000e+00)
  %79 = tail call double @llvm.fma.f64(double %78, double %76, double %76)
  %80 = tail call double @llvm.fma.f64(double %77, double %79, double 1.000000e+00)
  %81 = tail call double @llvm.fma.f64(double %80, double %79, double %79)
  %82 = fmul double %74, %81
  %83 = tail call double @llvm.fma.f64(double %77, double %82, double %74)
  %84 = tail call double @llvm.fma.f64(double %83, double %81, double %82)
  %85 = select i1 %65, double 0.000000e+00, double %84
  %86 = fadd double %66, %85
  %87 = fsub double %86, %66
  %88 = fsub double %85, %87
  %89 = fmul double %52, %86
  %90 = fneg double %89
  %91 = tail call double @llvm.fma.f64(double %86, double %52, double %90)
  %92 = tail call double @llvm.fma.f64(double %88, double %52, double %91)
  %93 = fadd double %89, %92
  %94 = fsub double %93, %89
  %95 = fsub double %92, %94
  %96 = fadd double %86, %93
  %97 = fsub double %96, %86
  %98 = fsub double %93, %97
  %99 = fadd double %88, %95
  %100 = fadd double %99, %98
  %101 = fadd double %96, %100
  %102 = fsub double %101, %96
  %103 = fsub double %100, %102
  %104 = fsub double 0x3FE921FB54442D18, %101
  %105 = fsub double 0x3FE921FB54442D18, %104
  %106 = fsub double %105, %101
  %107 = fadd double %106, 0x3C81A62633145C07
  %108 = fsub double %107, %103
  %109 = fadd double %104, %108
  %110 = fadd double %109, %109
  %111 = fcmp oeq double %36, 1.000000e+00
  %112 = select i1 %111, double 0x3FF921FB54442D18, double %110
  br label %113

113:                                              ; preds = %32, %54
  %114 = phi double [ %112, %54 ], [ %53, %32 ]
  %115 = tail call double @llvm.copysign.f64(double %114, double %35)
  %116 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %115, double addrspace(1)* %116, align 8, !tbaa !16
  br label %117

117:                                              ; preds = %113, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
