; ModuleID = '../data/hip_kernels/9798/30/main.cu'
source_filename = "../data/hip_kernels/9798/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @normalize(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp ult i32 %13, %2
  br i1 %14, label %15, label %46

15:                                               ; preds = %4
  %16 = sext i32 %3 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 %16
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !7, !amdgpu.noclobber !5
  %19 = sext i32 %13 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !7, !amdgpu.noclobber !5
  %22 = fsub contract double %21, %18
  %23 = fmul double %22, 0x3FF71547652B82FE
  %24 = tail call double @llvm.rint.f64(double %23)
  %25 = fneg double %24
  %26 = tail call double @llvm.fma.f64(double %25, double 0x3FE62E42FEFA39EF, double %22)
  %27 = tail call double @llvm.fma.f64(double %25, double 0x3C7ABC9E3B39803F, double %26)
  %28 = tail call double @llvm.fma.f64(double %27, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %29 = tail call double @llvm.fma.f64(double %27, double %28, double 0x3EC71DEE623FDE64)
  %30 = tail call double @llvm.fma.f64(double %27, double %29, double 0x3EFA01997C89E6B0)
  %31 = tail call double @llvm.fma.f64(double %27, double %30, double 0x3F2A01A014761F6E)
  %32 = tail call double @llvm.fma.f64(double %27, double %31, double 0x3F56C16C1852B7B0)
  %33 = tail call double @llvm.fma.f64(double %27, double %32, double 0x3F81111111122322)
  %34 = tail call double @llvm.fma.f64(double %27, double %33, double 0x3FA55555555502A1)
  %35 = tail call double @llvm.fma.f64(double %27, double %34, double 0x3FC5555555555511)
  %36 = tail call double @llvm.fma.f64(double %27, double %35, double 0x3FE000000000000B)
  %37 = tail call double @llvm.fma.f64(double %27, double %36, double 1.000000e+00)
  %38 = tail call double @llvm.fma.f64(double %27, double %37, double 1.000000e+00)
  %39 = fptosi double %24 to i32
  %40 = tail call double @llvm.amdgcn.ldexp.f64(double %38, i32 %39)
  %41 = fcmp ogt double %22, 1.024000e+03
  %42 = select i1 %41, double 0x7FF0000000000000, double %40
  %43 = fcmp olt double %22, -1.075000e+03
  %44 = select i1 %43, double 0.000000e+00, double %42
  %45 = getelementptr inbounds double, double addrspace(1)* %1, i64 %19
  store double %44, double addrspace(1)* %45, align 8, !tbaa !7
  br label %46

46:                                               ; preds = %15, %4
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
