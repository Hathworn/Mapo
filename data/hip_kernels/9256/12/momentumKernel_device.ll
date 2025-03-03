; ModuleID = '../data/hip_kernels/9256/12/main.cu'
source_filename = "../data/hip_kernels/9256/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14momentumKerneliPiS_iPfS0_ffS0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float %6, float %7, float addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !4, !amdgpu.noclobber !8
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %11
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !4, !amdgpu.noclobber !8
  %16 = icmp ne i32 %13, -1
  %17 = icmp sgt i32 %15, 0
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %60

19:                                               ; preds = %9
  %20 = sitofp i32 %15 to float
  %21 = fdiv contract float 1.000000e+00, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !9, !invariant.load !8
  %27 = zext i16 %26 to i32
  %28 = mul i32 %22, %27
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %30 = add i32 %28, %29
  %31 = mul i32 %30, %0
  %32 = mul nsw i32 %13, %3
  %33 = add nsw i32 %31, %32
  %34 = add nsw i32 %33, %0
  %35 = add nsw i32 %32, %3
  %36 = tail call i32 @llvm.smin.i32(i32 %34, i32 %35)
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %60

38:                                               ; preds = %19
  %39 = mul nsw i32 %10, %3
  %40 = add nsw i32 %31, %39
  br label %41

41:                                               ; preds = %38, %41
  %42 = phi i32 [ %57, %41 ], [ %33, %38 ]
  %43 = phi i32 [ %58, %41 ], [ %40, %38 ]
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %5, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !11
  %47 = fmul contract float %21, %46
  %48 = sext i32 %42 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %8, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !11
  %51 = fmul contract float %50, %7
  %52 = fmul contract float %47, %6
  %53 = fsub contract float %51, %52
  store float %53, float addrspace(1)* %49, align 4, !tbaa !11
  %54 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !11
  %56 = fadd contract float %55, %53
  store float %56, float addrspace(1)* %54, align 4, !tbaa !11
  %57 = add nsw i32 %42, 1
  %58 = add nsw i32 %43, 1
  %59 = icmp slt i32 %57, %36
  br i1 %59, label %41, label %60, !llvm.loop !13

60:                                               ; preds = %41, %19, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
