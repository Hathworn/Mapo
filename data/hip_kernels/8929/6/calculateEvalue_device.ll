; ModuleID = '../data/hip_kernels/8929/6/main.cu'
source_filename = "../data/hip_kernels/8929/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15calculateEvalueiidddPKiS0_S0_Pd(i32 %0, i32 %1, double %2, double %3, double %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %1
  br i1 %19, label %20, label %60

20:                                               ; preds = %9
  %21 = sext i32 %18 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = sub nsw i32 %23, %0
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %21
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = fmul contract double %2, %3
  %31 = sitofp i32 %27 to double
  %32 = fmul contract double %30, %31
  %33 = fneg contract double %4
  %34 = sitofp i32 %29 to double
  %35 = fmul contract double %33, %34
  %36 = fmul double %35, 0x3FF71547652B82FE
  %37 = tail call double @llvm.rint.f64(double %36)
  %38 = fneg double %37
  %39 = tail call double @llvm.fma.f64(double %38, double 0x3FE62E42FEFA39EF, double %35)
  %40 = tail call double @llvm.fma.f64(double %38, double 0x3C7ABC9E3B39803F, double %39)
  %41 = tail call double @llvm.fma.f64(double %40, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %42 = tail call double @llvm.fma.f64(double %40, double %41, double 0x3EC71DEE623FDE64)
  %43 = tail call double @llvm.fma.f64(double %40, double %42, double 0x3EFA01997C89E6B0)
  %44 = tail call double @llvm.fma.f64(double %40, double %43, double 0x3F2A01A014761F6E)
  %45 = tail call double @llvm.fma.f64(double %40, double %44, double 0x3F56C16C1852B7B0)
  %46 = tail call double @llvm.fma.f64(double %40, double %45, double 0x3F81111111122322)
  %47 = tail call double @llvm.fma.f64(double %40, double %46, double 0x3FA55555555502A1)
  %48 = tail call double @llvm.fma.f64(double %40, double %47, double 0x3FC5555555555511)
  %49 = tail call double @llvm.fma.f64(double %40, double %48, double 0x3FE000000000000B)
  %50 = tail call double @llvm.fma.f64(double %40, double %49, double 1.000000e+00)
  %51 = tail call double @llvm.fma.f64(double %40, double %50, double 1.000000e+00)
  %52 = fptosi double %37 to i32
  %53 = tail call double @llvm.amdgcn.ldexp.f64(double %51, i32 %52)
  %54 = fcmp ogt double %35, 1.024000e+03
  %55 = select i1 %54, double 0x7FF0000000000000, double %53
  %56 = fcmp olt double %35, -1.075000e+03
  %57 = select i1 %56, double 0.000000e+00, double %55
  %58 = fmul contract double %32, %57
  %59 = getelementptr inbounds double, double addrspace(1)* %8, i64 %21
  store double %58, double addrspace(1)* %59, align 8, !tbaa !11
  br label %60

60:                                               ; preds = %20, %9
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
