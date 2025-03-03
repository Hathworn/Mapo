; ModuleID = '../data/hip_kernels/879/0/main.cu'
source_filename = "../data/hip_kernels/879/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_mem = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9calculatePiS_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %19

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %22

19:                                               ; preds = %4
  switch i32 %3, label %21 [
    i32 3, label %22
    i32 0, label %22
    i32 1, label %20
  ]

20:                                               ; preds = %19
  br label %22

21:                                               ; preds = %19
  br label %22

22:                                               ; preds = %19, %19, %21, %20, %15
  %23 = phi i32 [ 2147483647, %21 ], [ -2147483647, %20 ], [ %18, %15 ], [ 0, %19 ], [ 0, %19 ]
  %24 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared_mem, i32 0, i32 %5
  store i32 %23, i32 addrspace(3)* %24, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = icmp ugt i16 %9, 1
  br i1 %25, label %26, label %29

26:                                               ; preds = %22
  %27 = lshr i32 %10, 1
  %28 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared_mem, i32 0, i32 %5
  br label %33

29:                                               ; preds = %57, %22
  %30 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @shared_mem, i32 0, i32 0), align 4, !tbaa !7
  %31 = zext i32 %11 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  store i32 %30, i32 addrspace(1)* %32, align 4, !tbaa !7
  ret void

33:                                               ; preds = %26, %57
  %34 = phi i32 [ %27, %26 ], [ %58, %57 ]
  %35 = icmp slt i32 %5, %34
  br i1 %35, label %36, label %57

36:                                               ; preds = %33
  switch i32 %3, label %49 [
    i32 3, label %37
    i32 0, label %37
    i32 1, label %43
  ]

37:                                               ; preds = %36, %36
  %38 = add nsw i32 %34, %5
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared_mem, i32 0, i32 %38
  %40 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !7
  %41 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !7
  %42 = add nsw i32 %41, %40
  br label %55

43:                                               ; preds = %36
  %44 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !7
  %45 = add nsw i32 %34, %5
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared_mem, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = tail call i32 @llvm.smax.i32(i32 %44, i32 %47)
  br label %55

49:                                               ; preds = %36
  %50 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !7
  %51 = add nsw i32 %34, %5
  %52 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared_mem, i32 0, i32 %51
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !7
  %54 = tail call i32 @llvm.smin.i32(i32 %50, i32 %53)
  br label %55

55:                                               ; preds = %43, %49, %37
  %56 = phi i32 [ %42, %37 ], [ %54, %49 ], [ %48, %43 ]
  store i32 %56, i32 addrspace(3)* %28, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %55, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = sdiv i32 %34, 2
  %59 = icmp sgt i32 %34, 1
  br i1 %59, label %33, label %29, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
