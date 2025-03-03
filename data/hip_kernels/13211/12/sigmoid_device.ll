; ModuleID = '../data/hip_kernels/13211/12/main.cu'
source_filename = "../data/hip_kernels/13211/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7sigmoidiPKdPd(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %0
  br i1 %13, label %14, label %44

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %1, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !6
  %18 = fneg contract double %17
  %19 = fmul double %17, 0xBFF71547652B82FE
  %20 = tail call double @llvm.rint.f64(double %19)
  %21 = fneg double %20
  %22 = tail call double @llvm.fma.f64(double %21, double 0x3FE62E42FEFA39EF, double %18)
  %23 = tail call double @llvm.fma.f64(double %21, double 0x3C7ABC9E3B39803F, double %22)
  %24 = tail call double @llvm.fma.f64(double %23, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %25 = tail call double @llvm.fma.f64(double %23, double %24, double 0x3EC71DEE623FDE64)
  %26 = tail call double @llvm.fma.f64(double %23, double %25, double 0x3EFA01997C89E6B0)
  %27 = tail call double @llvm.fma.f64(double %23, double %26, double 0x3F2A01A014761F6E)
  %28 = tail call double @llvm.fma.f64(double %23, double %27, double 0x3F56C16C1852B7B0)
  %29 = tail call double @llvm.fma.f64(double %23, double %28, double 0x3F81111111122322)
  %30 = tail call double @llvm.fma.f64(double %23, double %29, double 0x3FA55555555502A1)
  %31 = tail call double @llvm.fma.f64(double %23, double %30, double 0x3FC5555555555511)
  %32 = tail call double @llvm.fma.f64(double %23, double %31, double 0x3FE000000000000B)
  %33 = tail call double @llvm.fma.f64(double %23, double %32, double 1.000000e+00)
  %34 = tail call double @llvm.fma.f64(double %23, double %33, double 1.000000e+00)
  %35 = fptosi double %20 to i32
  %36 = tail call double @llvm.amdgcn.ldexp.f64(double %34, i32 %35)
  %37 = fcmp olt double %17, -1.024000e+03
  %38 = fcmp ogt double %17, 1.075000e+03
  %39 = getelementptr inbounds double, double addrspace(1)* %2, i64 %15
  %40 = fadd contract double %36, 1.000000e+00
  %41 = fdiv contract double 1.000000e+00, %40
  %42 = select i1 %37, double 0.000000e+00, double %41
  %43 = select i1 %38, double 1.000000e+00, double %42
  store double %43, double addrspace(1)* %39, align 8, !tbaa !7
  br label %44

44:                                               ; preds = %14, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
