; ModuleID = '../data/hip_kernels/869/29/main.cu'
source_filename = "../data/hip_kernels/869/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3addPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 6
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = shl nuw nsw i32 %9, 1
  %11 = add i32 %8, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = shl i32 %12, 3
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = add i32 %13, %14
  %16 = mul i32 %15, %3
  %17 = add i32 %16, %11
  %18 = mul i32 %15, %4
  %19 = add i32 %18, %11
  %20 = mul i32 %15, %5
  %21 = add i32 %20, %11
  %22 = sext i32 %17 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 8, !amdgpu.noclobber !5
  %25 = getelementptr inbounds float, float addrspace(1)* %23, i64 1
  %26 = load float, float addrspace(1)* %25, align 4, !amdgpu.noclobber !5
  %27 = sext i32 %19 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = load float, float addrspace(1)* %28, align 8, !amdgpu.noclobber !5
  %30 = getelementptr inbounds float, float addrspace(1)* %28, i64 1
  %31 = load float, float addrspace(1)* %30, align 4, !amdgpu.noclobber !5
  %32 = fadd contract float %24, %29
  %33 = fadd contract float %26, %31
  %34 = sext i32 %21 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  store float %32, float addrspace(1)* %35, align 8
  %36 = getelementptr inbounds float, float addrspace(1)* %35, i64 1
  store float %33, float addrspace(1)* %36, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{}
