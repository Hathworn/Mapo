; ModuleID = '../data/hip_kernels/591/49/main.cu'
source_filename = "../data/hip_kernels/591/49/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3binPtPfi(i16 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = shl i32 %4, 5
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = add i32 %5, %6
  %8 = sdiv i32 %2, 2
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 3
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = shl nsw i32 %12, 1
  %14 = mul nsw i32 %8, %7
  %15 = sext i32 %14 to i64
  %16 = sext i32 %12 to i64
  %17 = add nsw i64 %15, %16
  %18 = mul nsw i32 %7, %2
  %19 = sext i32 %18 to i64
  %20 = sext i32 %13 to i64
  %21 = add nsw i64 %19, %20
  %22 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %21
  %23 = load i16, i16 addrspace(1)* %22, align 2, !tbaa !5, !amdgpu.noclobber !9
  %24 = zext i16 %23 to i32
  %25 = add nsw i64 %21, 1
  %26 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %25
  %27 = load i16, i16 addrspace(1)* %26, align 2, !tbaa !5, !amdgpu.noclobber !9
  %28 = zext i16 %27 to i32
  %29 = add nuw nsw i32 %28, %24
  %30 = sitofp i32 %29 to float
  %31 = fmul contract float %30, 5.000000e-01
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  store float %31, float addrspace(1)* %32, align 4, !tbaa !10
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
!5 = !{!6, !6, i64 0}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
