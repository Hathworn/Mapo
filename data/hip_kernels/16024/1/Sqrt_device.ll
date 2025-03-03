; ModuleID = '../data/hip_kernels/16024/1/main.cu'
source_filename = "../data/hip_kernels/16024/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z4SqrtPfS_S_S_S_S_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = mul nsw i32 %7, 1536
  %10 = mul nuw nsw i32 %8, 3
  %11 = add nsw i32 %9, %10
  %12 = sdiv i32 %11, 3
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %5, i64 %13
  %15 = getelementptr inbounds float, float addrspace(1)* %4, i64 %13
  %16 = sext i32 %11 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  store float 0x3F847AE140000000, float addrspace(1)* %17, align 4, !tbaa !5
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  store float 0x3FE3333340000000, float addrspace(1)* %18, align 4, !tbaa !5
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  store float 0x3FD3333340000000, float addrspace(1)* %19, align 4, !tbaa !5
  %20 = getelementptr inbounds float, float addrspace(1)* %3, i64 %16
  store float 5.000000e-01, float addrspace(1)* %20, align 4, !tbaa !5
  %21 = add nsw i32 %11, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  store float 0x3F847AE140000000, float addrspace(1)* %23, align 4, !tbaa !5
  %24 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  store float 0x3FE3333340000000, float addrspace(1)* %24, align 4, !tbaa !5
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  store float 0x3FD3333340000000, float addrspace(1)* %25, align 4, !tbaa !5
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %22
  store float 5.000000e-01, float addrspace(1)* %26, align 4, !tbaa !5
  %27 = add nsw i32 %11, 2
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  store float 0x3F847AE140000000, float addrspace(1)* %29, align 4, !tbaa !5
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  store float 0x3FE3333340000000, float addrspace(1)* %30, align 4, !tbaa !5
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  store float 0x3FD3333340000000, float addrspace(1)* %31, align 4, !tbaa !5
  %32 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  store float 5.000000e-01, float addrspace(1)* %32, align 4, !tbaa !5
  store float 1.000000e+05, float addrspace(1)* %14, align 4, !tbaa !5
  store float 5.000000e-01, float addrspace(1)* %15, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
