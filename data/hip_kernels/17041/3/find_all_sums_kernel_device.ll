; ModuleID = '../data/hip_kernels/17041/3/main.cu'
source_filename = "../data/hip_kernels/17041/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20find_all_sums_kernelPbPdPiS1_S0_ii(i8 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = mul nsw i32 %24, %5
  %26 = add nsw i32 %25, %16
  %27 = icmp slt i32 %16, %5
  %28 = icmp slt i32 %24, %6
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %60

30:                                               ; preds = %7
  %31 = sext i32 %26 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %31
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %60, label %35

35:                                               ; preds = %30
  %36 = add nsw i32 %26, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !12, !amdgpu.noclobber !5
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %31
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !12, !amdgpu.noclobber !5
  %42 = add nsw i32 %41, 11
  %43 = tail call i32 @llvm.smin.i32(i32 %39, i32 %42)
  %44 = icmp slt i32 %41, %43
  br i1 %44, label %48, label %45

45:                                               ; preds = %48, %35
  %46 = phi double [ 0.000000e+00, %35 ], [ %57, %48 ]
  %47 = getelementptr inbounds double, double addrspace(1)* %4, i64 %31
  store double %46, double addrspace(1)* %47, align 8, !tbaa !14
  br label %60

48:                                               ; preds = %35, %48
  %49 = phi i32 [ %58, %48 ], [ %41, %35 ]
  %50 = phi double [ %57, %48 ], [ 0.000000e+00, %35 ]
  %51 = sext i32 %49 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !12, !amdgpu.noclobber !5
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %1, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !14, !amdgpu.noclobber !5
  %57 = fadd contract double %50, %56
  %58 = add nsw i32 %49, 1
  %59 = icmp slt i32 %58, %43
  br i1 %59, label %48, label %45, !llvm.loop !16

60:                                               ; preds = %45, %30, %7
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
!15 = !{!"double", !9, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
