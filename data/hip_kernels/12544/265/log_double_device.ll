; ModuleID = '../data/hip_kernels/12544/265/main.cu'
source_filename = "../data/hip_kernels/12544/265/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10log_doubleiiPdiS_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 %3, double addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %26

19:                                               ; preds = %5
  %20 = udiv i32 %14, %11
  %21 = mul i32 %20, %11
  %22 = icmp ugt i32 %14, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  br label %27

26:                                               ; preds = %122, %5
  ret void

27:                                               ; preds = %19, %122
  %28 = phi i32 [ %17, %19 ], [ %123, %122 ]
  %29 = icmp slt i32 %28, %1
  br i1 %29, label %122, label %30

30:                                               ; preds = %27
  %31 = srem i32 %28, %3
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %122

33:                                               ; preds = %30
  %34 = sext i32 %28 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !16
  %37 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %38 = fcmp olt double %37, 0x3FE5555555555555
  %39 = zext i1 %38 to i32
  %40 = tail call double @llvm.amdgcn.ldexp.f64(double %37, i32 %39)
  %41 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %42 = sub nsw i32 %41, %39
  %43 = fadd double %40, -1.000000e+00
  %44 = fadd double %40, 1.000000e+00
  %45 = fadd double %44, -1.000000e+00
  %46 = fsub double %40, %45
  %47 = tail call double @llvm.amdgcn.rcp.f64(double %44)
  %48 = fneg double %44
  %49 = tail call double @llvm.fma.f64(double %48, double %47, double 1.000000e+00)
  %50 = tail call double @llvm.fma.f64(double %49, double %47, double %47)
  %51 = tail call double @llvm.fma.f64(double %48, double %50, double 1.000000e+00)
  %52 = tail call double @llvm.fma.f64(double %51, double %50, double %50)
  %53 = fmul double %43, %52
  %54 = fmul double %44, %53
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %53, double %44, double %55)
  %57 = tail call double @llvm.fma.f64(double %53, double %46, double %56)
  %58 = fadd double %54, %57
  %59 = fsub double %58, %54
  %60 = fsub double %57, %59
  %61 = fsub double %43, %58
  %62 = fsub double %43, %61
  %63 = fsub double %62, %58
  %64 = fsub double %63, %60
  %65 = fadd double %61, %64
  %66 = fmul double %52, %65
  %67 = fadd double %53, %66
  %68 = fsub double %67, %53
  %69 = fsub double %66, %68
  %70 = fmul double %67, %67
  %71 = tail call double @llvm.fma.f64(double %70, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %72 = tail call double @llvm.fma.f64(double %70, double %71, double 0x3FC7474DD7F4DF2E)
  %73 = tail call double @llvm.fma.f64(double %70, double %72, double 0x3FCC71C016291751)
  %74 = tail call double @llvm.fma.f64(double %70, double %73, double 0x3FD249249B27ACF1)
  %75 = tail call double @llvm.fma.f64(double %70, double %74, double 0x3FD99999998EF7B6)
  %76 = tail call double @llvm.fma.f64(double %70, double %75, double 0x3FE5555555555780)
  %77 = tail call double @llvm.amdgcn.ldexp.f64(double %67, i32 1)
  %78 = tail call double @llvm.amdgcn.ldexp.f64(double %69, i32 1)
  %79 = fmul double %67, %70
  %80 = fmul double %79, %76
  %81 = fadd double %77, %80
  %82 = fsub double %81, %77
  %83 = fsub double %80, %82
  %84 = fadd double %78, %83
  %85 = fadd double %81, %84
  %86 = fsub double %85, %81
  %87 = fsub double %84, %86
  %88 = sitofp i32 %42 to double
  %89 = fmul double %88, 0x3FE62E42FEFA39EF
  %90 = fneg double %89
  %91 = tail call double @llvm.fma.f64(double %88, double 0x3FE62E42FEFA39EF, double %90)
  %92 = tail call double @llvm.fma.f64(double %88, double 0x3C7ABC9E3B39803F, double %91)
  %93 = fadd double %89, %92
  %94 = fsub double %93, %89
  %95 = fsub double %92, %94
  %96 = fadd double %93, %85
  %97 = fsub double %96, %93
  %98 = fsub double %96, %97
  %99 = fsub double %93, %98
  %100 = fsub double %85, %97
  %101 = fadd double %100, %99
  %102 = fadd double %95, %87
  %103 = fsub double %102, %95
  %104 = fsub double %102, %103
  %105 = fsub double %95, %104
  %106 = fsub double %87, %103
  %107 = fadd double %106, %105
  %108 = fadd double %102, %101
  %109 = fadd double %96, %108
  %110 = fsub double %109, %96
  %111 = fsub double %108, %110
  %112 = fadd double %107, %111
  %113 = fadd double %109, %112
  %114 = tail call double @llvm.fabs.f64(double %36) #3
  %115 = fcmp oeq double %114, 0x7FF0000000000000
  %116 = select i1 %115, double %36, double %113
  %117 = fcmp olt double %36, 0.000000e+00
  %118 = select i1 %117, double 0x7FF8000000000000, double %116
  %119 = fcmp oeq double %36, 0.000000e+00
  %120 = select i1 %119, double 0xFFF0000000000000, double %118
  %121 = getelementptr inbounds double, double addrspace(1)* %4, i64 %34
  store double %120, double addrspace(1)* %121, align 8, !tbaa !16
  br label %122

122:                                              ; preds = %27, %30, %33
  %123 = add i32 %25, %28
  %124 = icmp slt i32 %123, %0
  br i1 %124, label %27, label %26, !llvm.loop !20
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
