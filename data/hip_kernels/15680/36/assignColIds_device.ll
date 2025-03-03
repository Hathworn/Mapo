; ModuleID = '../data/hip_kernels/15680/36/main.cu'
source_filename = "../data/hip_kernels/15680/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12assignColIdsPiPKi(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %4
  %6 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !4, !amdgpu.noclobber !8
  %7 = add nsw i32 %3, 1
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %8
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !4, !amdgpu.noclobber !8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %12 = add i32 %6, %11
  %13 = icmp slt i32 %12, %10
  br i1 %13, label %14, label %20

14:                                               ; preds = %2
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !10, !invariant.load !8
  %19 = zext i16 %18 to i32
  br label %21

20:                                               ; preds = %21, %2
  ret void

21:                                               ; preds = %14, %21
  %22 = phi i32 [ %12, %14 ], [ %25, %21 ]
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  store i32 %3, i32 addrspace(1)* %24, align 4, !tbaa !4
  %25 = add i32 %22, %19
  %26 = icmp slt i32 %25, %10
  br i1 %26, label %21, label %20, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
