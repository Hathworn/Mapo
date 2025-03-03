; ModuleID = '../data/hip_kernels/7913/0/main.cu'
source_filename = "../data/hip_kernels/7913/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15adicionarKernelPdPKd(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds double, double addrspace(1)* %1, i64 %4
  %6 = load double, double addrspace(1)* %5, align 8, !tbaa !5, !amdgpu.noclobber !9
  %7 = fmul contract double %6, 4.000000e+00
  %8 = fadd contract double %7, 0.000000e+00
  %9 = fcmp olt double %8, 0x1000000000000000
  %10 = select i1 %9, double 0x4FF0000000000000, double 1.000000e+00
  %11 = fmul double %8, %10
  %12 = tail call double @llvm.amdgcn.rsq.f64(double %11)
  %13 = fmul double %11, %12
  %14 = fmul double %12, 5.000000e-01
  %15 = fneg double %14
  %16 = tail call double @llvm.fma.f64(double %15, double %13, double 5.000000e-01)
  %17 = tail call double @llvm.fma.f64(double %14, double %16, double %14)
  %18 = tail call double @llvm.fma.f64(double %13, double %16, double %13)
  %19 = fneg double %18
  %20 = tail call double @llvm.fma.f64(double %19, double %18, double %11)
  %21 = tail call double @llvm.fma.f64(double %20, double %17, double %18)
  %22 = fneg double %21
  %23 = tail call double @llvm.fma.f64(double %22, double %21, double %11)
  %24 = tail call double @llvm.fma.f64(double %23, double %17, double %21)
  %25 = select i1 %9, double 0x37F0000000000000, double 1.000000e+00
  %26 = fmul double %25, %24
  %27 = fcmp oeq double %11, 0.000000e+00
  %28 = fcmp oeq double %11, 0x7FF0000000000000
  %29 = or i1 %27, %28
  %30 = select i1 %29, double %11, double %26
  %31 = fmul contract double %30, 5.000000e-01
  %32 = getelementptr inbounds double, double addrspace(1)* %0, i64 %4
  store double %31, double addrspace(1)* %32, align 8, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
