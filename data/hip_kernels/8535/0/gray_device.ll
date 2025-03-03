; ModuleID = '../data/hip_kernels/8535/0/main.cu'
source_filename = "../data/hip_kernels/8535/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z4grayPhS_iiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = mul nsw i32 %7, %4
  %10 = mul nsw i32 %8, %5
  %11 = add nsw i32 %10, %9
  %12 = add nsw i32 %11, 2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %13
  %15 = load i8, i8 addrspace(1)* %14, align 1, !tbaa !5, !amdgpu.noclobber !8
  %16 = uitofp i8 %15 to float
  %17 = add nsw i32 %11, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %18
  %20 = load i8, i8 addrspace(1)* %19, align 1, !tbaa !5, !amdgpu.noclobber !8
  %21 = uitofp i8 %20 to float
  %22 = sext i32 %11 to i64
  %23 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %22
  %24 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !5, !amdgpu.noclobber !8
  %25 = uitofp i8 %24 to float
  %26 = fadd contract float %16, %21
  %27 = fadd contract float %26, %25
  %28 = fdiv contract float %27, 3.000000e+00
  %29 = fptoui float %28 to i8
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %13
  store i8 %29, i8 addrspace(1)* %30, align 1, !tbaa !5
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %18
  store i8 %29, i8 addrspace(1)* %31, align 1, !tbaa !5
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %22
  store i8 %29, i8 addrspace(1)* %32, align 1, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
