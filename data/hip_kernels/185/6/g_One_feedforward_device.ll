; ModuleID = '../data/hip_kernels/185/6/main.cu'
source_filename = "../data/hip_kernels/185/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17g_One_feedforwardPfS_S_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = mul nsw i32 %9, %4
  %11 = add i32 %10, %8
  %12 = mul i32 %11, %5
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = getelementptr inbounds float, float addrspace(1)* %3, i64 %13
  %16 = mul nsw i32 %9, %5
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %20 = icmp sgt i32 %5, 0
  br i1 %20, label %21, label %28

21:                                               ; preds = %7
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  br label %29

28:                                               ; preds = %44, %7
  ret void

29:                                               ; preds = %21, %44
  %30 = phi i32 [ 0, %21 ], [ %45, %44 ]
  %31 = add i32 %30, %22
  %32 = icmp slt i32 %31, %5
  br i1 %32, label %33, label %44

33:                                               ; preds = %29
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %14, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = getelementptr inbounds float, float addrspace(1)* %18, i64 %34
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = fmul contract float %36, %38
  %40 = getelementptr inbounds float, float addrspace(1)* %19, i64 %34
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = fadd contract float %39, %41
  %43 = getelementptr inbounds float, float addrspace(1)* %15, i64 %34
  store float %42, float addrspace(1)* %43, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %33, %29
  %45 = add i32 %30, %27
  %46 = icmp slt i32 %45, %5
  br i1 %46, label %29, label %28, !llvm.loop !11
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
