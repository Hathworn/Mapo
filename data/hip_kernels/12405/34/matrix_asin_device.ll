; ModuleID = '../data/hip_kernels/12405/34/main.cu'
source_filename = "../data/hip_kernels/12405/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @matrix_asin(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %99

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !5
  %18 = tail call double @llvm.fabs.f64(double %17)
  %19 = fcmp oge double %18, 5.000000e-01
  %20 = tail call double @llvm.fma.f64(double %18, double -5.000000e-01, double 5.000000e-01)
  %21 = fmul double %17, %17
  %22 = select i1 %19, double %20, double %21
  %23 = tail call double @llvm.fma.f64(double %22, double 0x3FA059859FEA6A70, double 0xBF90A5A378A05EAF)
  %24 = tail call double @llvm.fma.f64(double %22, double %23, double 0x3F94052137024D6A)
  %25 = tail call double @llvm.fma.f64(double %22, double %24, double 0x3F7AB3A098A70509)
  %26 = tail call double @llvm.fma.f64(double %22, double %25, double 0x3F88ED60A300C8D2)
  %27 = tail call double @llvm.fma.f64(double %22, double %26, double 0x3F8C6FA84B77012B)
  %28 = tail call double @llvm.fma.f64(double %22, double %27, double 0x3F91C6C111DCCB70)
  %29 = tail call double @llvm.fma.f64(double %22, double %28, double 0x3F96E89F0A0ADACF)
  %30 = tail call double @llvm.fma.f64(double %22, double %29, double 0x3F9F1C72C668963F)
  %31 = tail call double @llvm.fma.f64(double %22, double %30, double 0x3FA6DB6DB41CE4BD)
  %32 = tail call double @llvm.fma.f64(double %22, double %31, double 0x3FB333333336FD5B)
  %33 = tail call double @llvm.fma.f64(double %22, double %32, double 0x3FC5555555555380)
  %34 = fmul double %22, %33
  %35 = tail call double @llvm.fma.f64(double %18, double %34, double %18)
  br i1 %19, label %36, label %95

36:                                               ; preds = %14
  %37 = tail call double @llvm.amdgcn.rsq.f64(double %22)
  %38 = fmul double %22, %37
  %39 = fmul double %37, 5.000000e-01
  %40 = fneg double %39
  %41 = tail call double @llvm.fma.f64(double %40, double %38, double 5.000000e-01)
  %42 = tail call double @llvm.fma.f64(double %39, double %41, double %39)
  %43 = tail call double @llvm.fma.f64(double %38, double %41, double %38)
  %44 = fneg double %43
  %45 = tail call double @llvm.fma.f64(double %44, double %43, double %22)
  %46 = tail call double @llvm.fma.f64(double %45, double %42, double %43)
  %47 = fcmp oeq double %22, 0.000000e+00
  %48 = select i1 %47, double %22, double %46
  %49 = fmul double %48, %48
  %50 = fneg double %49
  %51 = tail call double @llvm.fma.f64(double %48, double %48, double %50)
  %52 = fsub double %22, %49
  %53 = fsub double %22, %52
  %54 = fsub double %53, %49
  %55 = fsub double %54, %51
  %56 = fadd double %52, %55
  %57 = fmul double %48, 2.000000e+00
  %58 = tail call double @llvm.amdgcn.rcp.f64(double %57)
  %59 = fneg double %57
  %60 = tail call double @llvm.fma.f64(double %59, double %58, double 1.000000e+00)
  %61 = tail call double @llvm.fma.f64(double %60, double %58, double %58)
  %62 = tail call double @llvm.fma.f64(double %59, double %61, double 1.000000e+00)
  %63 = tail call double @llvm.fma.f64(double %62, double %61, double %61)
  %64 = fmul double %56, %63
  %65 = tail call double @llvm.fma.f64(double %59, double %64, double %56)
  %66 = tail call double @llvm.fma.f64(double %65, double %63, double %64)
  %67 = select i1 %47, double 0.000000e+00, double %66
  %68 = fadd double %48, %67
  %69 = fsub double %68, %48
  %70 = fsub double %67, %69
  %71 = fmul double %34, %68
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %68, double %34, double %72)
  %74 = tail call double @llvm.fma.f64(double %70, double %34, double %73)
  %75 = fadd double %71, %74
  %76 = fsub double %75, %71
  %77 = fsub double %74, %76
  %78 = fadd double %68, %75
  %79 = fsub double %78, %68
  %80 = fsub double %75, %79
  %81 = fadd double %70, %77
  %82 = fadd double %81, %80
  %83 = fadd double %78, %82
  %84 = fsub double %83, %78
  %85 = fsub double %82, %84
  %86 = fsub double 0x3FE921FB54442D18, %83
  %87 = fsub double 0x3FE921FB54442D18, %86
  %88 = fsub double %87, %83
  %89 = fadd double %88, 0x3C81A62633145C07
  %90 = fsub double %89, %85
  %91 = fadd double %86, %90
  %92 = fadd double %91, %91
  %93 = fcmp oeq double %18, 1.000000e+00
  %94 = select i1 %93, double 0x3FF921FB54442D18, double %92
  br label %95

95:                                               ; preds = %14, %36
  %96 = phi double [ %94, %36 ], [ %35, %14 ]
  %97 = tail call double @llvm.copysign.f64(double %96, double %17)
  %98 = getelementptr inbounds double, double addrspace(1)* %1, i64 %15
  store double %97, double addrspace(1)* %98, align 8, !tbaa !7
  br label %99

99:                                               ; preds = %95, %3
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
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
