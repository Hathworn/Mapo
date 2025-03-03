; ModuleID = '../data/hip_kernels/16034/116/main.cu'
source_filename = "../data/hip_kernels/16034/116/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_computePoissonLikelihood(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = udiv i32 %14, %11
  %24 = mul i32 %23, %11
  %25 = icmp ugt i32 %14, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %22
  %29 = add i32 %28, %6
  %30 = mul i32 %29, %11
  %31 = add i32 %30, %5
  %32 = icmp slt i32 %31, %0
  br i1 %32, label %33, label %130

33:                                               ; preds = %4
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %3, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !16, !amdgpu.noclobber !6
  %37 = fcmp contract ogt double %36, 0.000000e+00
  br i1 %37, label %38, label %127

38:                                               ; preds = %33
  %39 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !16, !amdgpu.noclobber !6
  %41 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %42 = fcmp olt double %41, 0x3FE5555555555555
  %43 = zext i1 %42 to i32
  %44 = tail call double @llvm.amdgcn.ldexp.f64(double %41, i32 %43)
  %45 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %46 = sub nsw i32 %45, %43
  %47 = fadd double %44, -1.000000e+00
  %48 = fadd double %44, 1.000000e+00
  %49 = fadd double %48, -1.000000e+00
  %50 = fsub double %44, %49
  %51 = tail call double @llvm.amdgcn.rcp.f64(double %48)
  %52 = fneg double %48
  %53 = tail call double @llvm.fma.f64(double %52, double %51, double 1.000000e+00)
  %54 = tail call double @llvm.fma.f64(double %53, double %51, double %51)
  %55 = tail call double @llvm.fma.f64(double %52, double %54, double 1.000000e+00)
  %56 = tail call double @llvm.fma.f64(double %55, double %54, double %54)
  %57 = fmul double %47, %56
  %58 = fmul double %48, %57
  %59 = fneg double %58
  %60 = tail call double @llvm.fma.f64(double %57, double %48, double %59)
  %61 = tail call double @llvm.fma.f64(double %57, double %50, double %60)
  %62 = fadd double %58, %61
  %63 = fsub double %62, %58
  %64 = fsub double %61, %63
  %65 = fsub double %47, %62
  %66 = fsub double %47, %65
  %67 = fsub double %66, %62
  %68 = fsub double %67, %64
  %69 = fadd double %65, %68
  %70 = fmul double %56, %69
  %71 = fadd double %57, %70
  %72 = fsub double %71, %57
  %73 = fsub double %70, %72
  %74 = fmul double %71, %71
  %75 = tail call double @llvm.fma.f64(double %74, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %76 = tail call double @llvm.fma.f64(double %74, double %75, double 0x3FC7474DD7F4DF2E)
  %77 = tail call double @llvm.fma.f64(double %74, double %76, double 0x3FCC71C016291751)
  %78 = tail call double @llvm.fma.f64(double %74, double %77, double 0x3FD249249B27ACF1)
  %79 = tail call double @llvm.fma.f64(double %74, double %78, double 0x3FD99999998EF7B6)
  %80 = tail call double @llvm.fma.f64(double %74, double %79, double 0x3FE5555555555780)
  %81 = tail call double @llvm.amdgcn.ldexp.f64(double %71, i32 1)
  %82 = tail call double @llvm.amdgcn.ldexp.f64(double %73, i32 1)
  %83 = fmul double %71, %74
  %84 = fmul double %83, %80
  %85 = fadd double %81, %84
  %86 = fsub double %85, %81
  %87 = fsub double %84, %86
  %88 = fadd double %82, %87
  %89 = fadd double %85, %88
  %90 = fsub double %89, %85
  %91 = fsub double %88, %90
  %92 = sitofp i32 %46 to double
  %93 = fmul double %92, 0x3FE62E42FEFA39EF
  %94 = fneg double %93
  %95 = tail call double @llvm.fma.f64(double %92, double 0x3FE62E42FEFA39EF, double %94)
  %96 = tail call double @llvm.fma.f64(double %92, double 0x3C7ABC9E3B39803F, double %95)
  %97 = fadd double %93, %96
  %98 = fsub double %97, %93
  %99 = fsub double %96, %98
  %100 = fadd double %97, %89
  %101 = fsub double %100, %97
  %102 = fsub double %100, %101
  %103 = fsub double %97, %102
  %104 = fsub double %89, %101
  %105 = fadd double %104, %103
  %106 = fadd double %99, %91
  %107 = fsub double %106, %99
  %108 = fsub double %106, %107
  %109 = fsub double %99, %108
  %110 = fsub double %91, %107
  %111 = fadd double %110, %109
  %112 = fadd double %106, %105
  %113 = fadd double %100, %112
  %114 = fsub double %113, %100
  %115 = fsub double %112, %114
  %116 = fadd double %111, %115
  %117 = fadd double %113, %116
  %118 = tail call double @llvm.fabs.f64(double %36) #3
  %119 = fcmp oeq double %118, 0x7FF0000000000000
  %120 = select i1 %119, double %36, double %117
  %121 = fcmp olt double %36, 0.000000e+00
  %122 = select i1 %121, double 0x7FF8000000000000, double %120
  %123 = fcmp oeq double %36, 0.000000e+00
  %124 = select i1 %123, double 0xFFF0000000000000, double %122
  %125 = fmul contract double %124, %40
  %126 = fsub contract double %36, %125
  br label %127

127:                                              ; preds = %33, %38
  %128 = phi double [ %126, %38 ], [ 1.000000e+07, %33 ]
  %129 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  store double %128, double addrspace(1)* %129, align 8, !tbaa !16
  br label %130

130:                                              ; preds = %127, %4
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
