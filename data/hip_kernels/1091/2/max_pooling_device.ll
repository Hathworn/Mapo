; ModuleID = '../data/hip_kernels/1091/2/main.cu'
source_filename = "../data/hip_kernels/1091/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11max_poolingPhS_jjj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = lshr i32 %4, 2
  %8 = icmp ult i32 %6, %7
  br i1 %8, label %9, label %11

9:                                                ; preds = %5
  %10 = shl i32 %2, 1
  br label %12

11:                                               ; preds = %43, %5
  ret void

12:                                               ; preds = %9, %43
  %13 = phi i32 [ %6, %9 ], [ %47, %43 ]
  %14 = sdiv i32 %13, 4
  %15 = udiv i32 %13, %10
  %16 = mul i32 %15, %2
  %17 = add i32 %16, %14
  %18 = shl i32 %17, 2
  %19 = add i32 %18, %13
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %20
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !5
  %23 = add i32 %19, 4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %24
  %26 = load i8, i8 addrspace(1)* %25, align 1, !tbaa !5
  %27 = tail call i8 @llvm.umax.i8(i8 %26, i8 %22)
  %28 = add i32 %19, %2
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !5
  %32 = tail call i8 @llvm.umax.i8(i8 %31, i8 %27)
  %33 = add i32 %28, 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !5
  %37 = icmp ugt i8 %36, %32
  br i1 %37, label %38, label %43

38:                                               ; preds = %12
  %39 = add i32 %28, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !5
  br label %43

43:                                               ; preds = %38, %12
  %44 = phi i8 [ %42, %38 ], [ %32, %12 ]
  %45 = zext i32 %13 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %45
  store i8 %44, i8 addrspace(1)* %46, align 1, !tbaa !5
  %47 = add i32 %13, %3
  %48 = icmp ult i32 %47, %7
  br i1 %48, label %12, label %11, !llvm.loop !8
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.umax.i8(i8, i8) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
