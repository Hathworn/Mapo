; ModuleID = '../data/hip_kernels/952/8/main.cu'
source_filename = "../data/hip_kernels/952/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@Ly = protected addrspace(4) externally_initialized global double 1.000000e+00, align 8
@dy = protected addrspace(4) externally_initialized global double 1.000000e-02, align 8
@rho0 = protected addrspace(4) externally_initialized global double 1.600000e+03, align 8
@voltage = protected addrspace(4) externally_initialized global double 1.000000e+04, align 8
@llvm.compiler.used = appending addrspace(1) global [4 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @Ly to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @dy to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @rho0 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @voltage to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z18gpu_initializationPdS_S_S_S_S_S_(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture writeonly %4, double addrspace(1)* nocapture writeonly %5, double addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = mul i32 %8, 122
  %18 = add i32 %17, %16
  %19 = add i32 %18, %15
  %20 = zext i32 %19 to i64
  %21 = load double, double addrspace(4)* @rho0, align 8, !tbaa !7
  %22 = getelementptr inbounds double, double addrspace(1)* %0, i64 %20
  store double %21, double addrspace(1)* %22, align 8, !tbaa !7
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %20
  store double 0.000000e+00, double addrspace(1)* %23, align 8, !tbaa !7
  %24 = load double, double addrspace(4)* @voltage, align 8, !tbaa !7
  %25 = load double, double addrspace(4)* @Ly, align 8, !tbaa !7
  %26 = load double, double addrspace(4)* @dy, align 8, !tbaa !7
  %27 = uitofp i32 %8 to double
  %28 = fmul contract double %26, %27
  %29 = fsub contract double %25, %28
  %30 = fmul contract double %24, %29
  %31 = fdiv contract double %30, %25
  %32 = getelementptr inbounds double, double addrspace(1)* %2, i64 %20
  store double %31, double addrspace(1)* %32, align 8, !tbaa !7
  %33 = getelementptr inbounds double, double addrspace(1)* %3, i64 %20
  store double 0.000000e+00, double addrspace(1)* %33, align 8, !tbaa !7
  %34 = getelementptr inbounds double, double addrspace(1)* %4, i64 %20
  store double 0.000000e+00, double addrspace(1)* %34, align 8, !tbaa !7
  %35 = getelementptr inbounds double, double addrspace(1)* %5, i64 %20
  store double 0.000000e+00, double addrspace(1)* %35, align 8, !tbaa !7
  %36 = getelementptr inbounds double, double addrspace(1)* %6, i64 %20
  store double 0.000000e+00, double addrspace(1)* %36, align 8, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
