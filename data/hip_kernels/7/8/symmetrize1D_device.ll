; ModuleID = '../data/hip_kernels/7/8/main.cu'
source_filename = "../data/hip_kernels/7/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12symmetrize1DPfPiS0_i(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %49

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = mul nsw i32 %18, 3
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = add i32 %19, -1
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %49, label %28

26:                                               ; preds = %34, %28
  %27 = icmp eq i32 %30, %24
  br i1 %27, label %49, label %28, !llvm.loop !11

28:                                               ; preds = %15, %26
  %29 = phi i32 [ %30, %26 ], [ 0, %15 ]
  %30 = add nuw i32 %29, 1
  %31 = icmp ult i32 %30, %19
  br i1 %31, label %32, label %26

32:                                               ; preds = %28
  %33 = mul i32 %29, %19
  br label %34

34:                                               ; preds = %32, %34
  %35 = phi i32 [ %30, %32 ], [ %47, %34 ]
  %36 = add i32 %35, %33
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %23, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !13
  %40 = mul i32 %35, %19
  %41 = add i32 %40, %29
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %23, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !13
  %45 = fadd contract float %39, %44
  %46 = fmul contract float %45, 5.000000e-01
  store float %46, float addrspace(1)* %38, align 4, !tbaa !13
  store float %46, float addrspace(1)* %43, align 4, !tbaa !13
  %47 = add nuw i32 %35, 1
  %48 = icmp ult i32 %47, %19
  br i1 %48, label %34, label %26, !llvm.loop !15

49:                                               ; preds = %26, %15, %4
  ret void
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !9, i64 0}
!15 = distinct !{!15, !12}
