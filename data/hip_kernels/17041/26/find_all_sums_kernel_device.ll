; ModuleID = '../data/hip_kernels/17041/26/main.cu'
source_filename = "../data/hip_kernels/17041/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20find_all_sums_kernelPbPfPiS1_S0_S0_ii(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = mul nsw i32 %25, %6
  %27 = add nsw i32 %26, %17
  %28 = icmp slt i32 %17, %6
  %29 = icmp slt i32 %25, %7
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %62

31:                                               ; preds = %8
  %32 = sext i32 %27 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %62, label %36

36:                                               ; preds = %31
  %37 = add nsw i32 %27, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !12, !amdgpu.noclobber !5
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %32
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !12, !amdgpu.noclobber !5
  %43 = add nsw i32 %42, 11
  %44 = tail call i32 @llvm.smin.i32(i32 %40, i32 %43)
  %45 = icmp slt i32 %42, %44
  br i1 %45, label %49, label %46

46:                                               ; preds = %49, %36
  %47 = phi float [ 0.000000e+00, %36 ], [ %58, %49 ]
  %48 = getelementptr inbounds float, float addrspace(1)* %5, i64 %32
  store float %47, float addrspace(1)* %48, align 4, !tbaa !14
  br label %62

49:                                               ; preds = %36, %49
  %50 = phi i32 [ %60, %49 ], [ %42, %36 ]
  %51 = phi float [ %58, %49 ], [ 0.000000e+00, %36 ]
  %52 = sext i32 %50 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !12, !amdgpu.noclobber !5
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !14
  %58 = fadd contract float %51, %57
  %59 = getelementptr inbounds float, float addrspace(1)* %4, i64 %52
  store float %58, float addrspace(1)* %59, align 4, !tbaa !14
  %60 = add nsw i32 %50, 1
  %61 = icmp slt i32 %60, %44
  br i1 %61, label %49, label %46, !llvm.loop !16

62:                                               ; preds = %46, %31, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !9, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !9, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
