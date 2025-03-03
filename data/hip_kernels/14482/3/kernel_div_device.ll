; ModuleID = '../data/hip_kernels/14482/3/main.cu'
source_filename = "../data/hip_kernels/14482/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10kernel_divPcS_S_iiPiS_(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readnone %5, i8 addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = icmp eq i32 %9, 0
  %11 = icmp eq i32 %8, 0
  %12 = select i1 %10, i1 %11, i1 false
  br i1 %12, label %13, label %22

13:                                               ; preds = %7
  %14 = load i8, i8 addrspace(1)* %1, align 1, !tbaa !5, !amdgpu.noclobber !8
  %15 = icmp eq i8 %14, 45
  br i1 %15, label %20, label %16

16:                                               ; preds = %13
  %17 = load i8, i8 addrspace(1)* %2, align 1, !tbaa !5, !amdgpu.noclobber !8
  %18 = icmp eq i8 %17, 45
  %19 = select i1 %18, i8 45, i8 43
  br label %20

20:                                               ; preds = %16, %13
  %21 = phi i8 [ 45, %13 ], [ %19, %16 ]
  store i8 %21, i8 addrspace(1)* %0, align 1, !tbaa !5
  br label %65

22:                                               ; preds = %7
  %23 = sub i32 %4, %3
  %24 = add nsw i32 %9, -1
  %25 = add i32 %23, %24
  %26 = icmp sgt i32 %25, -1
  br i1 %26, label %27, label %38

27:                                               ; preds = %22
  %28 = zext i32 %25 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !5, !amdgpu.noclobber !8
  switch i8 %30, label %31 [
    i8 43, label %38
    i8 45, label %38
  ]

31:                                               ; preds = %27
  %32 = sext i8 %30 to i32
  %33 = sext i32 %24 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !5, !amdgpu.noclobber !8
  %36 = sext i8 %35 to i32
  %37 = sub nsw i32 %36, %32
  br label %44

38:                                               ; preds = %27, %27, %22
  %39 = sext i32 %24 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !5, !amdgpu.noclobber !8
  switch i8 %41, label %42 [
    i8 43, label %44
    i8 45, label %44
  ]

42:                                               ; preds = %38
  %43 = sext i8 %41 to i32
  br label %44

44:                                               ; preds = %38, %38, %42, %31
  %45 = phi i32 [ %37, %31 ], [ %43, %42 ], [ 0, %38 ], [ 0, %38 ]
  %46 = icmp slt i32 %45, 0
  br i1 %46, label %47, label %55

47:                                               ; preds = %44
  %48 = mul nsw i32 %8, %3
  %49 = add i32 %24, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !5, !amdgpu.noclobber !8
  %53 = add i8 %52, -1
  store i8 %53, i8 addrspace(1)* %51, align 1, !tbaa !5
  %54 = add nsw i32 %45, 10
  br label %55

55:                                               ; preds = %47, %44
  %56 = phi i32 [ %54, %47 ], [ %45, %44 ]
  br i1 %11, label %65, label %57

57:                                               ; preds = %55
  %58 = mul nsw i32 %8, %3
  %59 = add nsw i32 %58, %9
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %60
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !5
  %63 = trunc i32 %56 to i8
  %64 = add i8 %62, %63
  store i8 %64, i8 addrspace(1)* %61, align 1, !tbaa !5
  br label %65

65:                                               ; preds = %55, %57, %20
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
