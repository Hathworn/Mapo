; ModuleID = '../data/hip_kernels/8510/25/main.cu'
source_filename = "../data/hip_kernels/8510/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12vectorLengthPiPKdS1_Pd(i32 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = zext i32 %7 to i64
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i64
  %14 = mul nuw nsw i64 %13, %8
  %15 = add nuw nsw i64 %14, %6
  %16 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = sext i32 %16 to i64
  %18 = icmp slt i64 %15, %17
  br i1 %18, label %19, label %50

19:                                               ; preds = %4
  %20 = getelementptr inbounds double, double addrspace(1)* %1, i64 %15
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !11, !amdgpu.noclobber !6
  %22 = fmul contract double %21, %21
  %23 = getelementptr inbounds double, double addrspace(1)* %2, i64 %15
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !11, !amdgpu.noclobber !6
  %25 = fmul contract double %24, %24
  %26 = fadd contract double %22, %25
  %27 = fcmp olt double %26, 0x1000000000000000
  %28 = select i1 %27, double 0x4FF0000000000000, double 1.000000e+00
  %29 = fmul double %26, %28
  %30 = tail call double @llvm.amdgcn.rsq.f64(double %29)
  %31 = fmul double %29, %30
  %32 = fmul double %30, 5.000000e-01
  %33 = fneg double %32
  %34 = tail call double @llvm.fma.f64(double %33, double %31, double 5.000000e-01)
  %35 = tail call double @llvm.fma.f64(double %32, double %34, double %32)
  %36 = tail call double @llvm.fma.f64(double %31, double %34, double %31)
  %37 = fneg double %36
  %38 = tail call double @llvm.fma.f64(double %37, double %36, double %29)
  %39 = tail call double @llvm.fma.f64(double %38, double %35, double %36)
  %40 = fneg double %39
  %41 = tail call double @llvm.fma.f64(double %40, double %39, double %29)
  %42 = tail call double @llvm.fma.f64(double %41, double %35, double %39)
  %43 = select i1 %27, double 0x37F0000000000000, double 1.000000e+00
  %44 = fmul double %43, %42
  %45 = fcmp oeq double %29, 0.000000e+00
  %46 = fcmp oeq double %29, 0x7FF0000000000000
  %47 = or i1 %45, %46
  %48 = select i1 %47, double %29, double %44
  %49 = getelementptr inbounds double, double addrspace(1)* %3, i64 %15
  store double %48, double addrspace(1)* %49, align 8, !tbaa !11
  br label %50

50:                                               ; preds = %19, %4
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
