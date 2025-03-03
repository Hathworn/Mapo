; ModuleID = '../data/hip_kernels/11896/15/main.cu'
source_filename = "../data/hip_kernels/11896/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13KGaborFilter2Pdid(double addrspace(1)* nocapture %0, i32 %1, double %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sgt i32 %12, %1
  br i1 %13, label %41, label %14

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !5
  %18 = fmul contract double %17, %2
  %19 = fcmp olt double %18, 0x1000000000000000
  %20 = select i1 %19, double 0x4FF0000000000000, double 1.000000e+00
  %21 = fmul double %18, %20
  %22 = tail call double @llvm.amdgcn.rsq.f64(double %21)
  %23 = fmul double %21, %22
  %24 = fmul double %22, 5.000000e-01
  %25 = fneg double %24
  %26 = tail call double @llvm.fma.f64(double %25, double %23, double 5.000000e-01)
  %27 = tail call double @llvm.fma.f64(double %24, double %26, double %24)
  %28 = tail call double @llvm.fma.f64(double %23, double %26, double %23)
  %29 = fneg double %28
  %30 = tail call double @llvm.fma.f64(double %29, double %28, double %21)
  %31 = tail call double @llvm.fma.f64(double %30, double %27, double %28)
  %32 = fneg double %31
  %33 = tail call double @llvm.fma.f64(double %32, double %31, double %21)
  %34 = tail call double @llvm.fma.f64(double %33, double %27, double %31)
  %35 = select i1 %19, double 0x37F0000000000000, double 1.000000e+00
  %36 = fmul double %35, %34
  %37 = fcmp oeq double %21, 0.000000e+00
  %38 = fcmp oeq double %21, 0x7FF0000000000000
  %39 = or i1 %37, %38
  %40 = select i1 %39, double %21, double %36
  store double %40, double addrspace(1)* %16, align 8, !tbaa !7
  br label %41

41:                                               ; preds = %3, %14
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
