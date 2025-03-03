; ModuleID = '../data/hip_kernels/9137/0/main.cu'
source_filename = "../data/hip_kernels/9137/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9BFSLevelsPiS_S_S_S_S_PbS0_S0_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i8 addrspace(1)* nocapture %6, i8 addrspace(1)* nocapture %7, i8 addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = icmp slt i32 %20, %9
  br i1 %21, label %22, label %60

22:                                               ; preds = %11
  %23 = sext i32 %20 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !6
  %29 = icmp eq i8 %28, 0
  br i1 %29, label %60, label %30

30:                                               ; preds = %22
  store i8 0, i8 addrspace(1)* %27, align 1, !tbaa !11
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %26
  store i8 1, i8 addrspace(1)* %31, align 1, !tbaa !11
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %23
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %23
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = add nsw i32 %35, %33
  %37 = icmp sgt i32 %33, 0
  br i1 %37, label %38, label %60

38:                                               ; preds = %30
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %26
  br label %40

40:                                               ; preds = %38, %57
  %41 = phi i32 [ %35, %38 ], [ %58, %57 ]
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %45
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !11, !range !13
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %49, label %57

49:                                               ; preds = %40
  %50 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %51 = add nsw i32 %50, 1
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %45
  store i32 %51, i32 addrspace(1)* %52, align 4, !tbaa !7
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %45
  store i8 1, i8 addrspace(1)* %53, align 1, !tbaa !11
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %45
  store i32 %25, i32 addrspace(1)* %54, align 4, !tbaa !7
  %55 = icmp eq i32 %44, %10
  br i1 %55, label %56, label %57

56:                                               ; preds = %49
  store i8 1, i8 addrspace(1)* %8, align 1, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %57

57:                                               ; preds = %49, %56, %40
  %58 = add nsw i32 %41, 1
  %59 = icmp slt i32 %58, %36
  br i1 %59, label %40, label %60, !llvm.loop !14

60:                                               ; preds = %57, %30, %22, %11
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"bool", !9, i64 0}
!13 = !{i8 0, i8 2}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
