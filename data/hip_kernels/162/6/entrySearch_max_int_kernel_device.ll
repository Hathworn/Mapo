; ModuleID = '../data/hip_kernels/162/6/main.cu'
source_filename = "../data/hip_kernels/162/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sarr_int = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26entrySearch_max_int_kernelPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 1
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = add i32 %13, %10
  %15 = icmp ult i32 %14, %2
  br i1 %15, label %16, label %27

16:                                               ; preds = %3
  %17 = zext i32 %13 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = zext i32 %14 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = icmp sgt i32 %19, %22
  %24 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sarr_int, i32 0, i32 %4
  br i1 %23, label %25, label %26

25:                                               ; preds = %16
  store i32 %19, i32 addrspace(3)* %24, align 4, !tbaa !7
  br label %36

26:                                               ; preds = %16
  store i32 %22, i32 addrspace(3)* %24, align 4, !tbaa !7
  br label %36

27:                                               ; preds = %3
  %28 = icmp ult i32 %13, %2
  br i1 %28, label %29, label %34

29:                                               ; preds = %27
  %30 = zext i32 %13 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sarr_int, i32 0, i32 %4
  store i32 %32, i32 addrspace(3)* %33, align 4, !tbaa !7
  br label %36

34:                                               ; preds = %27
  %35 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sarr_int, i32 0, i32 %4
  store i32 -2147483648, i32 addrspace(3)* %35, align 4, !tbaa !7
  br label %36

36:                                               ; preds = %29, %34, %25, %26
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp ult i16 %9, 2
  br i1 %37, label %40, label %38

38:                                               ; preds = %36
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sarr_int, i32 0, i32 %4
  br label %42

40:                                               ; preds = %53, %36
  %41 = icmp eq i32 %4, 0
  br i1 %41, label %55, label %59

42:                                               ; preds = %38, %53
  %43 = phi i32 [ %10, %38 ], [ %44, %53 ]
  %44 = lshr i32 %43, 1
  %45 = icmp ult i32 %4, %44
  br i1 %45, label %46, label %53

46:                                               ; preds = %42
  %47 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !7
  %48 = add nuw nsw i32 %44, %4
  %49 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sarr_int, i32 0, i32 %48
  %50 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !7
  %51 = icmp slt i32 %47, %50
  br i1 %51, label %52, label %53

52:                                               ; preds = %46
  store i32 %50, i32 addrspace(3)* %39, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %46, %52, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp ult i32 %43, 4
  br i1 %54, label %40, label %42, !llvm.loop !11

55:                                               ; preds = %40
  %56 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sarr_int, i32 0, i32 0), align 4, !tbaa !7
  %57 = zext i32 %5 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %57
  store i32 %56, i32 addrspace(1)* %58, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %55, %40
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
