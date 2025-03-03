; ModuleID = '../data/hip_kernels/380/9/main.cu'
source_filename = "../data/hip_kernels/380/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18MultiChannelsSplitPfS_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul i32 %4, %4
  %9 = mul i32 %8, %7
  %10 = mul i32 %9, %5
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = sext i32 %3 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %12, i64 %13
  %15 = mul i32 %8, %2
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %25

17:                                               ; preds = %6
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %19 = mul i32 %9, %2
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  br label %26

25:                                               ; preds = %37, %6
  ret void

26:                                               ; preds = %17, %37
  %27 = phi i32 [ 0, %17 ], [ %38, %37 ]
  %28 = add i32 %27, %18
  %29 = icmp slt i32 %28, %15
  br i1 %29, label %30, label %37

30:                                               ; preds = %26
  %31 = sext i32 %28 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %14, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = add nsw i32 %28, %19
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  store float %33, float addrspace(1)* %36, align 4, !tbaa !7
  br label %37

37:                                               ; preds = %30, %26
  %38 = add i32 %27, %24
  %39 = icmp slt i32 %38, %15
  br i1 %39, label %26, label %25, !llvm.loop !11
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
