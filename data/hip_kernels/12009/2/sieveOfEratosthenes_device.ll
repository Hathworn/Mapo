; ModuleID = '../data/hip_kernels/12009/2/main.cu'
source_filename = "../data/hip_kernels/12009/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL19sieveOfEratosthenesPcm = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL19sieveOfEratosthenesPcm(i8 addrspace(1)* nocapture %0, i64 %1) local_unnamed_addr #0 comdat {
  store i8 1, i8 addrspace(1)* %0, align 1, !tbaa !4
  %3 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 1
  store i8 1, i8 addrspace(1)* %3, align 1, !tbaa !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !7, !invariant.load !8
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %12 = add i32 %10, %11
  %13 = uitofp i64 %1 to double
  %14 = icmp eq i64 %1, 0
  %15 = select i1 %14, double 0x4FF0000000000000, double 1.000000e+00
  %16 = fmul double %15, %13
  %17 = tail call double @llvm.amdgcn.rsq.f64(double %16)
  %18 = fmul double %16, %17
  %19 = fmul double %17, 5.000000e-01
  %20 = fneg double %19
  %21 = tail call double @llvm.fma.f64(double %20, double %18, double 5.000000e-01)
  %22 = tail call double @llvm.fma.f64(double %19, double %21, double %19)
  %23 = tail call double @llvm.fma.f64(double %18, double %21, double %18)
  %24 = fneg double %23
  %25 = tail call double @llvm.fma.f64(double %24, double %23, double %16)
  %26 = tail call double @llvm.fma.f64(double %25, double %22, double %23)
  %27 = fneg double %26
  %28 = tail call double @llvm.fma.f64(double %27, double %26, double %16)
  %29 = tail call double @llvm.fma.f64(double %28, double %22, double %26)
  %30 = select i1 %14, double 0x37F0000000000000, double 1.000000e+00
  %31 = fmul double %30, %29
  %32 = fcmp oeq double %16, 0.000000e+00
  %33 = fcmp oeq double %16, 0x7FF0000000000000
  %34 = or i1 %32, %33
  %35 = select i1 %34, double %16, double %31
  %36 = fptoui double %35 to i64
  %37 = sext i32 %12 to i64
  %38 = icmp ugt i64 %37, %36
  br i1 %38, label %56, label %39

39:                                               ; preds = %2
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %37
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !4
  %42 = icmp eq i8 %41, 0
  %43 = icmp sgt i32 %12, 1
  %44 = select i1 %42, i1 %43, i1 false
  %45 = mul nsw i32 %12, %12
  %46 = zext i32 %45 to i64
  %47 = icmp ult i64 %46, %1
  %48 = select i1 %44, i1 %47, i1 false
  br i1 %48, label %49, label %56

49:                                               ; preds = %39, %49
  %50 = phi i64 [ %54, %49 ], [ %46, %39 ]
  %51 = phi i32 [ %53, %49 ], [ %45, %39 ]
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %50
  store i8 1, i8 addrspace(1)* %52, align 1, !tbaa !4
  %53 = add nsw i32 %51, %12
  %54 = sext i32 %53 to i64
  %55 = icmp ult i64 %54, %1
  br i1 %55, label %49, label %56, !llvm.loop !10

56:                                               ; preds = %49, %39, %2
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i16 1, i16 1025}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
