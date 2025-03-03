; ModuleID = '../data/hip_kernels/17687/17/main.cu'
source_filename = "../data/hip_kernels/17687/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14kernelGetOmegaiPdS_dddd(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double %3, double %4, double %5, double %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %52

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %2, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !7, !amdgpu.noclobber !5
  %22 = fadd contract double %21, 1.000000e+00
  %23 = fmul contract double %5, 3.000000e+00
  %24 = fmul contract double %23, %3
  %25 = fadd contract double %24, %22
  %26 = fmul contract double %6, 1.500000e+01
  %27 = fmul contract double %26, %4
  %28 = fadd contract double %27, %25
  %29 = fcmp olt double %28, 0x1000000000000000
  %30 = select i1 %29, double 0x4FF0000000000000, double 1.000000e+00
  %31 = fmul double %28, %30
  %32 = tail call double @llvm.amdgcn.rsq.f64(double %31)
  %33 = fmul double %31, %32
  %34 = fmul double %32, 5.000000e-01
  %35 = fneg double %34
  %36 = tail call double @llvm.fma.f64(double %35, double %33, double 5.000000e-01)
  %37 = tail call double @llvm.fma.f64(double %34, double %36, double %34)
  %38 = tail call double @llvm.fma.f64(double %33, double %36, double %33)
  %39 = fneg double %38
  %40 = tail call double @llvm.fma.f64(double %39, double %38, double %31)
  %41 = tail call double @llvm.fma.f64(double %40, double %37, double %38)
  %42 = fneg double %41
  %43 = tail call double @llvm.fma.f64(double %42, double %41, double %31)
  %44 = tail call double @llvm.fma.f64(double %43, double %37, double %41)
  %45 = select i1 %29, double 0x37F0000000000000, double 1.000000e+00
  %46 = fmul double %45, %44
  %47 = fcmp oeq double %31, 0.000000e+00
  %48 = fcmp oeq double %31, 0x7FF0000000000000
  %49 = or i1 %47, %48
  %50 = select i1 %49, double %31, double %46
  %51 = getelementptr inbounds double, double addrspace(1)* %1, i64 %19
  store double %50, double addrspace(1)* %51, align 8, !tbaa !7
  br label %52

52:                                               ; preds = %18, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
