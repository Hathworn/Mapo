; ModuleID = '../data/hip_kernels/867/4/main.cu'
source_filename = "../data/hip_kernels/867/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z14normalizeL2HysPfS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = mul nsw i32 %3, 30
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds float, float addrspace(1)* %0, i64 %6
  %8 = getelementptr inbounds float, float addrspace(1)* %1, i64 %6
  %9 = zext i32 %4 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %7, i64 %9
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %12 = fmul contract float %11, %11
  %13 = fadd contract float %12, 0.000000e+00
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %14 = fpext float %13 to double
  %15 = tail call double @llvm.amdgcn.rsq.f64(double %14)
  %16 = fneg double %14
  %17 = fmul double %15, %16
  %18 = tail call double @llvm.fma.f64(double %17, double %15, double 1.000000e+00)
  %19 = fmul double %15, %18
  %20 = tail call double @llvm.fma.f64(double %18, double 3.750000e-01, double 5.000000e-01)
  %21 = tail call double @llvm.fma.f64(double %19, double %20, double %15)
  %22 = tail call i1 @llvm.amdgcn.class.f64(double %15, i32 384)
  %23 = select i1 %22, double %21, double %15
  %24 = fadd contract double %23, 3.000000e+01
  %25 = fdiv contract double 1.000000e+00, %24
  %26 = fptrunc double %25 to float
  %27 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = fmul contract float %27, %26
  %29 = getelementptr inbounds float, float addrspace(1)* %8, i64 %9
  store float %28, float addrspace(1)* %29, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
