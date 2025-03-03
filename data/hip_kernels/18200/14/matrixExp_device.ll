; ModuleID = '../data/hip_kernels/18200/14/main.cu'
source_filename = "../data/hip_kernels/18200/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9matrixExpPdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %2
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %54

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %3
  %27 = add nsw i32 %26, %13
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !5
  %31 = fmul double %30, 0x3FF71547652B82FE
  %32 = tail call double @llvm.rint.f64(double %31)
  %33 = fneg double %32
  %34 = tail call double @llvm.fma.f64(double %33, double 0x3FE62E42FEFA39EF, double %30)
  %35 = tail call double @llvm.fma.f64(double %33, double 0x3C7ABC9E3B39803F, double %34)
  %36 = tail call double @llvm.fma.f64(double %35, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %37 = tail call double @llvm.fma.f64(double %35, double %36, double 0x3EC71DEE623FDE64)
  %38 = tail call double @llvm.fma.f64(double %35, double %37, double 0x3EFA01997C89E6B0)
  %39 = tail call double @llvm.fma.f64(double %35, double %38, double 0x3F2A01A014761F6E)
  %40 = tail call double @llvm.fma.f64(double %35, double %39, double 0x3F56C16C1852B7B0)
  %41 = tail call double @llvm.fma.f64(double %35, double %40, double 0x3F81111111122322)
  %42 = tail call double @llvm.fma.f64(double %35, double %41, double 0x3FA55555555502A1)
  %43 = tail call double @llvm.fma.f64(double %35, double %42, double 0x3FC5555555555511)
  %44 = tail call double @llvm.fma.f64(double %35, double %43, double 0x3FE000000000000B)
  %45 = tail call double @llvm.fma.f64(double %35, double %44, double 1.000000e+00)
  %46 = tail call double @llvm.fma.f64(double %35, double %45, double 1.000000e+00)
  %47 = fptosi double %32 to i32
  %48 = tail call double @llvm.amdgcn.ldexp.f64(double %46, i32 %47)
  %49 = fcmp ogt double %30, 1.024000e+03
  %50 = select i1 %49, double 0x7FF0000000000000, double %48
  %51 = fcmp olt double %30, -1.075000e+03
  %52 = select i1 %51, double 0.000000e+00, double %50
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  store double %52, double addrspace(1)* %53, align 8, !tbaa !7
  br label %54

54:                                               ; preds = %25, %4
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
