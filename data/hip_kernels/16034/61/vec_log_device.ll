; ModuleID = '../data/hip_kernels/16034/61/main.cu'
source_filename = "../data/hip_kernels/16034/61/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_log(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %121

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.amdgcn.frexp.mant.f64(double %35)
  %37 = fcmp olt double %36, 0x3FE5555555555555
  %38 = zext i1 %37 to i32
  %39 = tail call double @llvm.amdgcn.ldexp.f64(double %36, i32 %38)
  %40 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %35)
  %41 = sub nsw i32 %40, %38
  %42 = fadd double %39, -1.000000e+00
  %43 = fadd double %39, 1.000000e+00
  %44 = fadd double %43, -1.000000e+00
  %45 = fsub double %39, %44
  %46 = tail call double @llvm.amdgcn.rcp.f64(double %43)
  %47 = fneg double %43
  %48 = tail call double @llvm.fma.f64(double %47, double %46, double 1.000000e+00)
  %49 = tail call double @llvm.fma.f64(double %48, double %46, double %46)
  %50 = tail call double @llvm.fma.f64(double %47, double %49, double 1.000000e+00)
  %51 = tail call double @llvm.fma.f64(double %50, double %49, double %49)
  %52 = fmul double %42, %51
  %53 = fmul double %43, %52
  %54 = fneg double %53
  %55 = tail call double @llvm.fma.f64(double %52, double %43, double %54)
  %56 = tail call double @llvm.fma.f64(double %52, double %45, double %55)
  %57 = fadd double %53, %56
  %58 = fsub double %57, %53
  %59 = fsub double %56, %58
  %60 = fsub double %42, %57
  %61 = fsub double %42, %60
  %62 = fsub double %61, %57
  %63 = fsub double %62, %59
  %64 = fadd double %60, %63
  %65 = fmul double %51, %64
  %66 = fadd double %52, %65
  %67 = fsub double %66, %52
  %68 = fsub double %65, %67
  %69 = fmul double %66, %66
  %70 = tail call double @llvm.fma.f64(double %69, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %71 = tail call double @llvm.fma.f64(double %69, double %70, double 0x3FC7474DD7F4DF2E)
  %72 = tail call double @llvm.fma.f64(double %69, double %71, double 0x3FCC71C016291751)
  %73 = tail call double @llvm.fma.f64(double %69, double %72, double 0x3FD249249B27ACF1)
  %74 = tail call double @llvm.fma.f64(double %69, double %73, double 0x3FD99999998EF7B6)
  %75 = tail call double @llvm.fma.f64(double %69, double %74, double 0x3FE5555555555780)
  %76 = tail call double @llvm.amdgcn.ldexp.f64(double %66, i32 1)
  %77 = tail call double @llvm.amdgcn.ldexp.f64(double %68, i32 1)
  %78 = fmul double %66, %69
  %79 = fmul double %78, %75
  %80 = fadd double %76, %79
  %81 = fsub double %80, %76
  %82 = fsub double %79, %81
  %83 = fadd double %77, %82
  %84 = fadd double %80, %83
  %85 = fsub double %84, %80
  %86 = fsub double %83, %85
  %87 = sitofp i32 %41 to double
  %88 = fmul double %87, 0x3FE62E42FEFA39EF
  %89 = fneg double %88
  %90 = tail call double @llvm.fma.f64(double %87, double 0x3FE62E42FEFA39EF, double %89)
  %91 = tail call double @llvm.fma.f64(double %87, double 0x3C7ABC9E3B39803F, double %90)
  %92 = fadd double %88, %91
  %93 = fsub double %92, %88
  %94 = fsub double %91, %93
  %95 = fadd double %92, %84
  %96 = fsub double %95, %92
  %97 = fsub double %95, %96
  %98 = fsub double %92, %97
  %99 = fsub double %84, %96
  %100 = fadd double %99, %98
  %101 = fadd double %94, %86
  %102 = fsub double %101, %94
  %103 = fsub double %101, %102
  %104 = fsub double %94, %103
  %105 = fsub double %86, %102
  %106 = fadd double %105, %104
  %107 = fadd double %101, %100
  %108 = fadd double %95, %107
  %109 = fsub double %108, %95
  %110 = fsub double %107, %109
  %111 = fadd double %106, %110
  %112 = fadd double %108, %111
  %113 = tail call double @llvm.fabs.f64(double %35) #3
  %114 = fcmp oeq double %113, 0x7FF0000000000000
  %115 = select i1 %114, double %35, double %112
  %116 = fcmp olt double %35, 0.000000e+00
  %117 = select i1 %116, double 0x7FF8000000000000, double %115
  %118 = fcmp oeq double %35, 0.000000e+00
  %119 = select i1 %118, double 0xFFF0000000000000, double %117
  %120 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %119, double addrspace(1)* %120, align 8, !tbaa !16
  br label %121

121:                                              ; preds = %32, %3
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
