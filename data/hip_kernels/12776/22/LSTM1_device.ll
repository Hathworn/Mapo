; ModuleID = '../data/hip_kernels/12776/22/main.cu'
source_filename = "../data/hip_kernels/12776/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z5LSTM1PfS_PKfS1_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = shl nsw i32 %4, 8
  %16 = add i32 %14, %15
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = getelementptr inbounds float, float addrspace(1)* %3, i64 %17
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fpext float %23 to double
  %25 = fmul contract double %24, 2.000000e+00
  %26 = fmul double %25, 0x3FF71547652B82FE
  %27 = tail call double @llvm.rint.f64(double %26)
  %28 = fneg double %27
  %29 = tail call double @llvm.fma.f64(double %28, double 0x3FE62E42FEFA39EF, double %25)
  %30 = tail call double @llvm.fma.f64(double %28, double 0x3C7ABC9E3B39803F, double %29)
  %31 = tail call double @llvm.fma.f64(double %30, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %32 = tail call double @llvm.fma.f64(double %30, double %31, double 0x3EC71DEE623FDE64)
  %33 = tail call double @llvm.fma.f64(double %30, double %32, double 0x3EFA01997C89E6B0)
  %34 = tail call double @llvm.fma.f64(double %30, double %33, double 0x3F2A01A014761F6E)
  %35 = tail call double @llvm.fma.f64(double %30, double %34, double 0x3F56C16C1852B7B0)
  %36 = tail call double @llvm.fma.f64(double %30, double %35, double 0x3F81111111122322)
  %37 = tail call double @llvm.fma.f64(double %30, double %36, double 0x3FA55555555502A1)
  %38 = tail call double @llvm.fma.f64(double %30, double %37, double 0x3FC5555555555511)
  %39 = tail call double @llvm.fma.f64(double %30, double %38, double 0x3FE000000000000B)
  %40 = tail call double @llvm.fma.f64(double %30, double %39, double 1.000000e+00)
  %41 = tail call double @llvm.fma.f64(double %30, double %40, double 1.000000e+00)
  %42 = fptosi double %27 to i32
  %43 = tail call double @llvm.amdgcn.ldexp.f64(double %41, i32 %42)
  %44 = fcmp ogt double %25, 1.024000e+03
  %45 = select i1 %44, double 0x7FF0000000000000, double %43
  %46 = fcmp olt double %25, -1.075000e+03
  %47 = select i1 %46, double 0.000000e+00, double %45
  %48 = fptrunc double %47 to float
  %49 = fpext float %48 to double
  %50 = icmp sgt i32 %4, 0
  br i1 %50, label %51, label %58

51:                                               ; preds = %5
  %52 = fsub contract float 1.000000e+00, %19
  %53 = add nsw i32 %16, -256
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = fmul contract float %52, %56
  br label %58

58:                                               ; preds = %51, %5
  %59 = phi float [ %57, %51 ], [ 0.000000e+00, %5 ]
  %60 = fadd contract double %49, -1.000000e+00
  %61 = fadd contract double %49, 1.000000e+00
  %62 = fdiv contract double %60, %61
  %63 = fptrunc double %62 to float
  %64 = fmul contract float %19, %63
  %65 = fadd contract float %64, %59
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  store float %65, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = fpext float %65 to double
  %68 = fmul contract double %67, 2.000000e+00
  %69 = fmul double %68, 0x3FF71547652B82FE
  %70 = tail call double @llvm.rint.f64(double %69)
  %71 = fneg double %70
  %72 = tail call double @llvm.fma.f64(double %71, double 0x3FE62E42FEFA39EF, double %68)
  %73 = tail call double @llvm.fma.f64(double %71, double 0x3C7ABC9E3B39803F, double %72)
  %74 = tail call double @llvm.fma.f64(double %73, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %75 = tail call double @llvm.fma.f64(double %73, double %74, double 0x3EC71DEE623FDE64)
  %76 = tail call double @llvm.fma.f64(double %73, double %75, double 0x3EFA01997C89E6B0)
  %77 = tail call double @llvm.fma.f64(double %73, double %76, double 0x3F2A01A014761F6E)
  %78 = tail call double @llvm.fma.f64(double %73, double %77, double 0x3F56C16C1852B7B0)
  %79 = tail call double @llvm.fma.f64(double %73, double %78, double 0x3F81111111122322)
  %80 = tail call double @llvm.fma.f64(double %73, double %79, double 0x3FA55555555502A1)
  %81 = tail call double @llvm.fma.f64(double %73, double %80, double 0x3FC5555555555511)
  %82 = tail call double @llvm.fma.f64(double %73, double %81, double 0x3FE000000000000B)
  %83 = tail call double @llvm.fma.f64(double %73, double %82, double 1.000000e+00)
  %84 = tail call double @llvm.fma.f64(double %73, double %83, double 1.000000e+00)
  %85 = fptosi double %70 to i32
  %86 = tail call double @llvm.amdgcn.ldexp.f64(double %84, i32 %85)
  %87 = fcmp ogt double %68, 1.024000e+03
  %88 = select i1 %87, double 0x7FF0000000000000, double %86
  %89 = fcmp olt double %68, -1.075000e+03
  %90 = select i1 %89, double 0.000000e+00, double %88
  %91 = fptrunc double %90 to float
  %92 = fpext float %91 to double
  %93 = fadd contract double %92, -1.000000e+00
  %94 = fadd contract double %92, 1.000000e+00
  %95 = fdiv contract double %93, %94
  %96 = fptrunc double %95 to float
  %97 = fmul contract float %21, %96
  store float %97, float addrspace(1)* %22, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
