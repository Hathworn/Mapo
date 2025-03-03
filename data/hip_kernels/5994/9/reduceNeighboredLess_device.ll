; ModuleID = '../data/hip_kernels/5994/9/main.cu'
source_filename = "../data/hip_kernels/5994/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20reduceNeighboredLessPiS_j(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = zext i32 %10 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %13
  %15 = icmp ult i32 %11, %2
  br i1 %15, label %16, label %42

16:                                               ; preds = %3
  %17 = icmp ugt i16 %8, 1
  br i1 %17, label %18, label %20

18:                                               ; preds = %16
  %19 = shl nsw i32 %12, 1
  br label %22

20:                                               ; preds = %35, %16
  %21 = icmp eq i32 %11, 0
  br i1 %21, label %38, label %42

22:                                               ; preds = %18, %35
  %23 = phi i32 [ 1, %18 ], [ %36, %35 ]
  %24 = mul nsw i32 %23, %19
  %25 = icmp ult i32 %24, %9
  br i1 %25, label %26, label %35

26:                                               ; preds = %22
  %27 = add nsw i32 %24, %23
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %14, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %31 = zext i32 %24 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %14, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %34 = add nsw i32 %33, %30
  store i32 %34, i32 addrspace(1)* %32, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %26, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = shl nsw i32 %23, 1
  %37 = icmp ult i32 %36, %9
  br i1 %37, label %22, label %20, !llvm.loop !11

38:                                               ; preds = %20
  %39 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7
  %40 = zext i32 %4 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %40
  store i32 %39, i32 addrspace(1)* %41, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %20, %38, %3
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
