; ModuleID = '../data/hip_kernels/175/2/main.cu'
source_filename = "../data/hip_kernels/175/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19normalizeLab_kerneljjPfS_S_(i32 %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp ult i32 %14, %0
  %24 = icmp ult i32 %22, %1
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %53

26:                                               ; preds = %5
  %27 = mul i32 %22, %0
  %28 = add i32 %27, %14
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = fdiv contract float %31, 1.000000e+02
  %33 = getelementptr inbounds float, float addrspace(1)* %3, i64 %29
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = fadd contract float %34, 7.300000e+01
  %36 = fdiv contract float %35, 1.680000e+02
  %37 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = fadd contract float %38, 7.300000e+01
  %40 = fdiv contract float %39, 1.680000e+02
  %41 = fcmp contract olt float %32, 0.000000e+00
  %42 = fcmp contract ogt float %32, 1.000000e+00
  %43 = select i1 %42, float 1.000000e+00, float %32
  %44 = select i1 %41, float 0.000000e+00, float %43
  %45 = fcmp contract olt float %36, 0.000000e+00
  %46 = fcmp contract ogt float %36, 1.000000e+00
  %47 = select i1 %46, float 1.000000e+00, float %36
  %48 = select i1 %45, float 0.000000e+00, float %47
  %49 = fcmp contract olt float %40, 0.000000e+00
  %50 = fcmp contract ogt float %40, 1.000000e+00
  %51 = select i1 %50, float 1.000000e+00, float %40
  %52 = select i1 %49, float 0.000000e+00, float %51
  store float %44, float addrspace(1)* %30, align 4, !tbaa !7
  store float %48, float addrspace(1)* %33, align 4, !tbaa !7
  store float %52, float addrspace(1)* %37, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %26, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
