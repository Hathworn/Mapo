; ModuleID = '../data/hip_kernels/15505/41/main.cu'
source_filename = "../data/hip_kernels/15505/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11exp_kerneldPdi(double addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = add i32 %10, %3
  %12 = icmp slt i32 %11, %1
  br i1 %12, label %13, label %39

13:                                               ; preds = %2
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds double, double addrspace(1)* %0, i64 %14
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !7, !amdgpu.noclobber !6
  %17 = fmul double %16, 0x3FF71547652B82FE
  %18 = tail call double @llvm.rint.f64(double %17)
  %19 = fneg double %18
  %20 = tail call double @llvm.fma.f64(double %19, double 0x3FE62E42FEFA39EF, double %16)
  %21 = tail call double @llvm.fma.f64(double %19, double 0x3C7ABC9E3B39803F, double %20)
  %22 = tail call double @llvm.fma.f64(double %21, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %23 = tail call double @llvm.fma.f64(double %21, double %22, double 0x3EC71DEE623FDE64)
  %24 = tail call double @llvm.fma.f64(double %21, double %23, double 0x3EFA01997C89E6B0)
  %25 = tail call double @llvm.fma.f64(double %21, double %24, double 0x3F2A01A014761F6E)
  %26 = tail call double @llvm.fma.f64(double %21, double %25, double 0x3F56C16C1852B7B0)
  %27 = tail call double @llvm.fma.f64(double %21, double %26, double 0x3F81111111122322)
  %28 = tail call double @llvm.fma.f64(double %21, double %27, double 0x3FA55555555502A1)
  %29 = tail call double @llvm.fma.f64(double %21, double %28, double 0x3FC5555555555511)
  %30 = tail call double @llvm.fma.f64(double %21, double %29, double 0x3FE000000000000B)
  %31 = tail call double @llvm.fma.f64(double %21, double %30, double 1.000000e+00)
  %32 = tail call double @llvm.fma.f64(double %21, double %31, double 1.000000e+00)
  %33 = fptosi double %18 to i32
  %34 = tail call double @llvm.amdgcn.ldexp.f64(double %32, i32 %33)
  %35 = fcmp ogt double %16, 1.024000e+03
  %36 = select i1 %35, double 0x7FF0000000000000, double %34
  %37 = fcmp olt double %16, -1.075000e+03
  %38 = select i1 %37, double 0.000000e+00, double %36
  store double %38, double addrspace(1)* %15, align 8, !tbaa !7
  br label %39

39:                                               ; preds = %2, %13
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
