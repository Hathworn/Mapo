; ModuleID = '../data/hip_kernels/435/1/main.cu'
source_filename = "../data/hip_kernels/435/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z5scalePdiiS_(double addrspace(1)* nocapture %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %1
  br i1 %14, label %15, label %44

15:                                               ; preds = %4
  %16 = mul nsw i32 %13, %2
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds double, double addrspace(1)* %0, i64 %17
  %19 = load double, double addrspace(1)* %18, align 8, !tbaa !7, !amdgpu.noclobber !5
  %20 = load double, double addrspace(1)* %3, align 8, !tbaa !7, !amdgpu.noclobber !5
  %21 = fcmp olt double %20, 0x1000000000000000
  %22 = select i1 %21, double 0x4FF0000000000000, double 1.000000e+00
  %23 = fmul double %20, %22
  %24 = tail call double @llvm.amdgcn.rsq.f64(double %23)
  %25 = fmul double %23, %24
  %26 = fmul double %24, 5.000000e-01
  %27 = fneg double %26
  %28 = tail call double @llvm.fma.f64(double %27, double %25, double 5.000000e-01)
  %29 = tail call double @llvm.fma.f64(double %26, double %28, double %26)
  %30 = tail call double @llvm.fma.f64(double %25, double %28, double %25)
  %31 = fneg double %30
  %32 = tail call double @llvm.fma.f64(double %31, double %30, double %23)
  %33 = tail call double @llvm.fma.f64(double %32, double %29, double %30)
  %34 = fneg double %33
  %35 = tail call double @llvm.fma.f64(double %34, double %33, double %23)
  %36 = tail call double @llvm.fma.f64(double %35, double %29, double %33)
  %37 = select i1 %21, double 0x37F0000000000000, double 1.000000e+00
  %38 = fmul double %37, %36
  %39 = fcmp oeq double %23, 0.000000e+00
  %40 = fcmp oeq double %23, 0x7FF0000000000000
  %41 = or i1 %39, %40
  %42 = select i1 %41, double %23, double %38
  %43 = fdiv contract double %19, %42
  store double %43, double addrspace(1)* %18, align 8, !tbaa !7
  br label %44

44:                                               ; preds = %15, %4
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
