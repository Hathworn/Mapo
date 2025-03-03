; ModuleID = '../data/hip_kernels/16910/7/main.cu'
source_filename = "../data/hip_kernels/16910/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8blankdWUPKdS0_PKiS2_Pd(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %7 = load double, double addrspace(1)* %6, align 8, !tbaa !4, !amdgpu.noclobber !8
  %8 = fptosi double %7 to i32
  %9 = getelementptr inbounds double, double addrspace(1)* %0, i64 10
  %10 = load double, double addrspace(1)* %9, align 8, !tbaa !4, !amdgpu.noclobber !8
  %11 = fptosi double %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = icmp slt i32 %13, %11
  br i1 %15, label %16, label %45

16:                                               ; preds = %5
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !4, !amdgpu.noclobber !8
  %19 = fptosi double %18 to i32
  %20 = sext i32 %14 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !10, !amdgpu.noclobber !8
  %23 = mul nsw i32 %22, %11
  %24 = mul i32 %14, %19
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !12, !invariant.load !8
  %29 = zext i16 %28 to i32
  br label %30

30:                                               ; preds = %16, %30
  %31 = phi i32 [ %13, %16 ], [ %43, %30 ]
  %32 = add nsw i32 %23, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !10, !amdgpu.noclobber !8
  %36 = add i32 %35, %24
  %37 = mul i32 %36, %8
  %38 = add i32 %37, %12
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !4
  %42 = getelementptr inbounds double, double addrspace(1)* %4, i64 %39
  store double %41, double addrspace(1)* %42, align 8, !tbaa !4
  %43 = add i32 %31, %29
  %44 = icmp slt i32 %43, %11
  br i1 %44, label %30, label %45, !llvm.loop !13

45:                                               ; preds = %30, %5
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
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{i16 1, i16 1025}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
