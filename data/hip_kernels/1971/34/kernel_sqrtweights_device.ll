; ModuleID = '../data/hip_kernels/1971/34/main.cu'
source_filename = "../data/hip_kernels/1971/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18kernel_sqrtweightsiPd(i32 %0, double addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp ult i32 %11, %0
  br i1 %12, label %13, label %39

13:                                               ; preds = %2
  %14 = zext i32 %11 to i64
  %15 = getelementptr inbounds double, double addrspace(1)* %1, i64 %14
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !7, !amdgpu.noclobber !5
  %17 = fcmp olt double %16, 0x1000000000000000
  %18 = select i1 %17, double 0x4FF0000000000000, double 1.000000e+00
  %19 = fmul double %16, %18
  %20 = tail call double @llvm.amdgcn.rsq.f64(double %19)
  %21 = fmul double %19, %20
  %22 = fmul double %20, 5.000000e-01
  %23 = fneg double %22
  %24 = tail call double @llvm.fma.f64(double %23, double %21, double 5.000000e-01)
  %25 = tail call double @llvm.fma.f64(double %22, double %24, double %22)
  %26 = tail call double @llvm.fma.f64(double %21, double %24, double %21)
  %27 = fneg double %26
  %28 = tail call double @llvm.fma.f64(double %27, double %26, double %19)
  %29 = tail call double @llvm.fma.f64(double %28, double %25, double %26)
  %30 = fneg double %29
  %31 = tail call double @llvm.fma.f64(double %30, double %29, double %19)
  %32 = tail call double @llvm.fma.f64(double %31, double %25, double %29)
  %33 = select i1 %17, double 0x37F0000000000000, double 1.000000e+00
  %34 = fmul double %33, %32
  %35 = fcmp oeq double %19, 0.000000e+00
  %36 = fcmp oeq double %19, 0x7FF0000000000000
  %37 = or i1 %35, %36
  %38 = select i1 %37, double %19, double %34
  store double %38, double addrspace(1)* %15, align 8, !tbaa !7
  br label %39

39:                                               ; preds = %13, %2
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
