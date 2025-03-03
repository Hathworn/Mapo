; ModuleID = '../data/hip_kernels/12862/14/main.cu'
source_filename = "../data/hip_kernels/12862/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_OMEGA = protected addrspace(4) externally_initialized global double 6.400000e-01, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @d_OMEGA to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20kernelUpdateParticlePdS_S_S_iidd(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, double %6, double %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = mul nsw i32 %5, %4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %42

20:                                               ; preds = %8
  %21 = load double, double addrspace(4)* @d_OMEGA, align 8, !tbaa !7
  %22 = sext i32 %17 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7, !amdgpu.noclobber !5
  %25 = fmul contract double %21, %24
  %26 = getelementptr inbounds double, double addrspace(1)* %2, i64 %22
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !7, !amdgpu.noclobber !5
  %28 = getelementptr inbounds double, double addrspace(1)* %0, i64 %22
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7, !amdgpu.noclobber !5
  %30 = fsub contract double %27, %29
  %31 = fmul contract double %30, %6
  %32 = fadd contract double %25, %31
  %33 = srem i32 %17, %5
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %3, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = fsub contract double %36, %29
  %38 = fmul contract double %37, %7
  %39 = fadd contract double %32, %38
  store double %39, double addrspace(1)* %23, align 8, !tbaa !7
  %40 = load double, double addrspace(1)* %28, align 8, !tbaa !7
  %41 = fadd contract double %40, %39
  store double %41, double addrspace(1)* %28, align 8, !tbaa !7
  br label %42

42:                                               ; preds = %8, %20
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
