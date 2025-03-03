; ModuleID = '../data/hip_kernels/16034/32/main.cu'
source_filename = "../data/hip_kernels/16034/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_acos(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %106

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
  %53 = tail call double @llvm.fma.f64(double %35, double %52, double %35)
  %54 = fneg double %53
  %55 = tail call double @llvm.fma.f64(double 0x3FEDD9AD336A0500, double 0x3FFAF154EEB562D6, double %54)
  br i1 %37, label %56, label %103

56:                                               ; preds = %32
  %57 = tail call double @llvm.amdgcn.rsq.f64(double %40)
  %58 = fmul double %40, %57
  %59 = fmul double %57, 5.000000e-01
  %60 = fneg double %59
  %61 = tail call double @llvm.fma.f64(double %60, double %58, double 5.000000e-01)
  %62 = tail call double @llvm.fma.f64(double %59, double %61, double %59)
  %63 = tail call double @llvm.fma.f64(double %58, double %61, double %58)
  %64 = fneg double %63
  %65 = tail call double @llvm.fma.f64(double %64, double %63, double %40)
  %66 = tail call double @llvm.fma.f64(double %65, double %62, double %63)
  %67 = fcmp oeq double %40, 0.000000e+00
  %68 = select i1 %67, double %40, double %66
  %69 = fmul double %68, %68
  %70 = fneg double %69
  %71 = tail call double @llvm.fma.f64(double %68, double %68, double %70)
  %72 = fsub double %40, %69
  %73 = fsub double %40, %72
  %74 = fsub double %73, %69
  %75 = fsub double %74, %71
  %76 = fadd double %72, %75
  %77 = fmul double %68, 2.000000e+00
  %78 = tail call double @llvm.amdgcn.rcp.f64(double %77)
  %79 = fneg double %77
  %80 = tail call double @llvm.fma.f64(double %79, double %78, double 1.000000e+00)
  %81 = tail call double @llvm.fma.f64(double %80, double %78, double %78)
  %82 = tail call double @llvm.fma.f64(double %79, double %81, double 1.000000e+00)
  %83 = tail call double @llvm.fma.f64(double %82, double %81, double %81)
  %84 = fmul double %76, %83
  %85 = tail call double @llvm.fma.f64(double %79, double %84, double %76)
  %86 = tail call double @llvm.fma.f64(double %85, double %83, double %84)
  %87 = select i1 %67, double 0.000000e+00, double %86
  %88 = fadd double %68, %87
  %89 = fsub double %88, %68
  %90 = fsub double %87, %89
  %91 = tail call double @llvm.fma.f64(double %88, double %52, double %88)
  %92 = fmul double %91, -2.000000e+00
  %93 = tail call double @llvm.fma.f64(double 0x3FFDD9AD336A0500, double 0x3FFAF154EEB562D6, double %92)
  %94 = tail call double @llvm.fma.f64(double %88, double %52, double %90)
  %95 = fadd double %88, %94
  %96 = fmul double %95, 2.000000e+00
  %97 = fcmp olt double %35, 0.000000e+00
  %98 = select i1 %97, double %93, double %96
  %99 = fcmp oeq double %35, -1.000000e+00
  %100 = select i1 %99, double 0x400921FB54442D18, double %98
  %101 = fcmp oeq double %35, 1.000000e+00
  %102 = select i1 %101, double 0.000000e+00, double %100
  br label %103

103:                                              ; preds = %32, %56
  %104 = phi double [ %102, %56 ], [ %55, %32 ]
  %105 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %104, double addrspace(1)* %105, align 8, !tbaa !16
  br label %106

106:                                              ; preds = %103, %3
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
