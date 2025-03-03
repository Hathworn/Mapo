; ModuleID = '../data/hip_kernels/14377/15/main.cu'
source_filename = "../data/hip_kernels/14377/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z14pointGenKernelPfS_iiff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = udiv i32 %7, %2
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul nsw i32 %8, %2
  %15 = sub i32 %7, %14
  %16 = mul i32 %15, %13
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %3
  %28 = icmp slt i32 %26, %3
  %29 = select i1 %27, i1 %28, i1 false
  %30 = icmp slt i32 %8, %3
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %61

32:                                               ; preds = %6
  %33 = sitofp i32 %18 to float
  %34 = fmul contract float %33, %5
  %35 = fadd contract float %34, %4
  %36 = sitofp i32 %26 to float
  %37 = fmul contract float %36, %5
  %38 = fadd contract float %37, %4
  %39 = sitofp i32 %8 to float
  %40 = fmul contract float %39, %5
  %41 = fadd contract float %40, %4
  %42 = mul i32 %8, %3
  %43 = add i32 %26, %42
  %44 = mul i32 %43, %3
  %45 = add i32 %44, %18
  %46 = mul nsw i32 %45, 3
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float %35, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = add nsw i32 %46, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  store float %38, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = add nsw i32 %46, 2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  store float %41, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = fadd contract float %35, -1.000000e+01
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  store float %55, float addrspace(1)* %56, align 4, !tbaa !7
  %57 = fadd contract float %38, -1.000000e+01
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  store float %57, float addrspace(1)* %58, align 4, !tbaa !7
  %59 = fadd contract float %41, -1.000000e+01
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  store float %59, float addrspace(1)* %60, align 4, !tbaa !7
  br label %61

61:                                               ; preds = %32, %6
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
