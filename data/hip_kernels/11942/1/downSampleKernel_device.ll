; ModuleID = '../data/hip_kernels/11942/1/main.cu'
source_filename = "../data/hip_kernels/11942/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16downSampleKernelPhS_m(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = mul nuw nsw i64 %5, 3
  %7 = mul i64 %6, %2
  %8 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %7
  %9 = load i8, i8 addrspace(1)* %8, align 1, !tbaa !5, !amdgpu.noclobber !8
  %10 = zext i8 %9 to i16
  %11 = add i64 %7, 1
  %12 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %11
  %13 = load i8, i8 addrspace(1)* %12, align 1, !tbaa !5, !amdgpu.noclobber !8
  %14 = zext i8 %13 to i16
  %15 = add nuw nsw i16 %14, %10
  %16 = add i64 %7, 2
  %17 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %16
  %18 = load i8, i8 addrspace(1)* %17, align 1, !tbaa !5, !amdgpu.noclobber !8
  %19 = zext i8 %18 to i16
  %20 = add nuw nsw i16 %15, %19
  %21 = udiv i16 %20, 3
  %22 = trunc i16 %21 to i8
  %23 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %5
  store i8 %22, i8 addrspace(1)* %23, align 1, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
