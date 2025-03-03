; ModuleID = '../data/hip_kernels/2006/12/main.cu'
source_filename = "../data/hip_kernels/2006/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @cuLog(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %0
  br i1 %13, label %14, label %105

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = fpext float %17 to double
  %19 = tail call double @llvm.amdgcn.frexp.mant.f64(double %18)
  %20 = fcmp olt double %19, 0x3FE5555555555555
  %21 = zext i1 %20 to i32
  %22 = tail call double @llvm.amdgcn.ldexp.f64(double %19, i32 %21)
  %23 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %18)
  %24 = sub nsw i32 %23, %21
  %25 = fadd double %22, -1.000000e+00
  %26 = fadd double %22, 1.000000e+00
  %27 = fadd double %26, -1.000000e+00
  %28 = fsub double %22, %27
  %29 = tail call double @llvm.amdgcn.rcp.f64(double %26)
  %30 = fneg double %26
  %31 = tail call double @llvm.fma.f64(double %30, double %29, double 1.000000e+00)
  %32 = tail call double @llvm.fma.f64(double %31, double %29, double %29)
  %33 = tail call double @llvm.fma.f64(double %30, double %32, double 1.000000e+00)
  %34 = tail call double @llvm.fma.f64(double %33, double %32, double %32)
  %35 = fmul double %25, %34
  %36 = fmul double %26, %35
  %37 = fneg double %36
  %38 = tail call double @llvm.fma.f64(double %35, double %26, double %37)
  %39 = tail call double @llvm.fma.f64(double %35, double %28, double %38)
  %40 = fadd double %36, %39
  %41 = fsub double %40, %36
  %42 = fsub double %39, %41
  %43 = fsub double %25, %40
  %44 = fsub double %25, %43
  %45 = fsub double %44, %40
  %46 = fsub double %45, %42
  %47 = fadd double %43, %46
  %48 = fmul double %34, %47
  %49 = fadd double %35, %48
  %50 = fsub double %49, %35
  %51 = fsub double %48, %50
  %52 = fmul double %49, %49
  %53 = tail call double @llvm.fma.f64(double %52, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %54 = tail call double @llvm.fma.f64(double %52, double %53, double 0x3FC7474DD7F4DF2E)
  %55 = tail call double @llvm.fma.f64(double %52, double %54, double 0x3FCC71C016291751)
  %56 = tail call double @llvm.fma.f64(double %52, double %55, double 0x3FD249249B27ACF1)
  %57 = tail call double @llvm.fma.f64(double %52, double %56, double 0x3FD99999998EF7B6)
  %58 = tail call double @llvm.fma.f64(double %52, double %57, double 0x3FE5555555555780)
  %59 = tail call double @llvm.amdgcn.ldexp.f64(double %49, i32 1)
  %60 = tail call double @llvm.amdgcn.ldexp.f64(double %51, i32 1)
  %61 = fmul double %49, %52
  %62 = fmul double %61, %58
  %63 = fadd double %59, %62
  %64 = fsub double %63, %59
  %65 = fsub double %62, %64
  %66 = fadd double %60, %65
  %67 = fadd double %63, %66
  %68 = fsub double %67, %63
  %69 = fsub double %66, %68
  %70 = sitofp i32 %24 to double
  %71 = fmul double %70, 0x3FE62E42FEFA39EF
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %70, double 0x3FE62E42FEFA39EF, double %72)
  %74 = tail call double @llvm.fma.f64(double %70, double 0x3C7ABC9E3B39803F, double %73)
  %75 = fadd double %71, %74
  %76 = fsub double %75, %71
  %77 = fsub double %74, %76
  %78 = fadd double %75, %67
  %79 = fsub double %78, %75
  %80 = fsub double %78, %79
  %81 = fsub double %75, %80
  %82 = fsub double %67, %79
  %83 = fadd double %82, %81
  %84 = fadd double %77, %69
  %85 = fsub double %84, %77
  %86 = fsub double %84, %85
  %87 = fsub double %77, %86
  %88 = fsub double %69, %85
  %89 = fadd double %88, %87
  %90 = fadd double %84, %83
  %91 = fadd double %78, %90
  %92 = fsub double %91, %78
  %93 = fsub double %90, %92
  %94 = fadd double %89, %93
  %95 = fadd double %91, %94
  %96 = tail call double @llvm.fabs.f64(double %18) #3
  %97 = fcmp oeq double %96, 0x7FF0000000000000
  %98 = fcmp olt float %17, 0.000000e+00
  %99 = fcmp oeq float %17, 0.000000e+00
  %100 = fptrunc double %95 to float
  %101 = select i1 %97, float %17, float %100
  %102 = select i1 %98, float 0x7FF8000000000000, float %101
  %103 = select i1 %99, float 0xFFF0000000000000, float %102
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %15
  store float %103, float addrspace(1)* %104, align 4, !tbaa !7
  br label %105

105:                                              ; preds = %14, %3
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
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
