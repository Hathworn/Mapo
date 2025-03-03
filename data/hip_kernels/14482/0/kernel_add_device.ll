; ModuleID = '../data/hip_kernels/14482/0/main.cu'
source_filename = "../data/hip_kernels/14482/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10kernel_addPcS_S_iiPi(i8 addrspace(1)* nocapture %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readnone %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %48, label %9

9:                                                ; preds = %6
  %10 = add nsw i32 %7, -1
  %11 = sub nsw i32 %10, %4
  %12 = icmp sgt i32 %11, -1
  br i1 %12, label %13, label %24

13:                                               ; preds = %9
  %14 = zext i32 %11 to i64
  %15 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %14
  %16 = load i8, i8 addrspace(1)* %15, align 1, !tbaa !5, !amdgpu.noclobber !8
  switch i8 %16, label %17 [
    i8 43, label %24
    i8 45, label %24
  ]

17:                                               ; preds = %13
  %18 = sext i8 %16 to i32
  %19 = zext i32 %10 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %19
  %21 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !5, !amdgpu.noclobber !8
  %22 = sext i8 %21 to i32
  %23 = add nsw i32 %22, %18
  br label %30

24:                                               ; preds = %13, %13, %9
  %25 = zext i32 %10 to i64
  %26 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %25
  %27 = load i8, i8 addrspace(1)* %26, align 1, !tbaa !5, !amdgpu.noclobber !8
  switch i8 %27, label %28 [
    i8 43, label %30
    i8 45, label %30
  ]

28:                                               ; preds = %24
  %29 = sext i8 %27 to i32
  br label %30

30:                                               ; preds = %24, %24, %28, %17
  %31 = phi i32 [ %23, %17 ], [ %29, %28 ], [ 0, %24 ], [ 0, %24 ]
  %32 = icmp sgt i32 %31, 9
  br i1 %32, label %33, label %41

33:                                               ; preds = %30
  %34 = zext i32 %10 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !5, !amdgpu.noclobber !8
  %37 = add i8 %36, 1
  store i8 %37, i8 addrspace(1)* %35, align 1, !tbaa !5
  %38 = trunc i32 %31 to i8
  %39 = urem i8 %38, 10
  %40 = zext i8 %39 to i32
  br label %41

41:                                               ; preds = %30, %33
  %42 = phi i32 [ %40, %33 ], [ %31, %30 ]
  %43 = zext i32 %7 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !5
  %46 = trunc i32 %42 to i8
  %47 = add i8 %45, %46
  store i8 %47, i8 addrspace(1)* %44, align 1, !tbaa !5
  br label %48

48:                                               ; preds = %6, %41
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
