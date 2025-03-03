; ModuleID = '../data/hip_kernels/185/7/main.cu'
source_filename = "../data/hip_kernels/185/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21g_One_backpropagationPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = mul nsw i32 %8, %3
  %10 = add i32 %9, %7
  %11 = mul i32 %10, %4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = getelementptr inbounds float, float addrspace(1)* %2, i64 %12
  %15 = mul nsw i32 %8, %4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %18 = icmp sgt i32 %4, 0
  br i1 %18, label %19, label %26

19:                                               ; preds = %6
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  br label %27

26:                                               ; preds = %39, %6
  ret void

27:                                               ; preds = %19, %39
  %28 = phi i32 [ 0, %19 ], [ %40, %39 ]
  %29 = add i32 %28, %20
  %30 = icmp slt i32 %29, %4
  br i1 %30, label %31, label %39

31:                                               ; preds = %27
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %13, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = getelementptr inbounds float, float addrspace(1)* %17, i64 %32
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = fmul contract float %34, %36
  %38 = getelementptr inbounds float, float addrspace(1)* %14, i64 %32
  store float %37, float addrspace(1)* %38, align 4, !tbaa !7
  br label %39

39:                                               ; preds = %31, %27
  %40 = add i32 %28, %25
  %41 = icmp slt i32 %40, %4
  br i1 %41, label %27, label %26, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
