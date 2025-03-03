; ModuleID = '../data/hip_kernels/16231/2/main.cu'
source_filename = "../data/hip_kernels/16231/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17littleBinoticSortPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %1
  br i1 %13, label %17, label %14

14:                                               ; preds = %3
  %15 = zext i32 %12 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  store i32 2147483647, i32 addrspace(1)* %16, align 4, !tbaa !7
  br label %17

17:                                               ; preds = %14, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp ult i32 %2, 2
  br i1 %18, label %28, label %19

19:                                               ; preds = %17
  %20 = zext i32 %12 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  br label %22

22:                                               ; preds = %19, %29
  %23 = phi i32 [ 2, %19 ], [ %30, %29 ]
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %29, label %25

25:                                               ; preds = %22
  %26 = and i32 %23, %12
  %27 = icmp eq i32 %26, 0
  br label %32

28:                                               ; preds = %29, %17
  ret void

29:                                               ; preds = %47, %22
  %30 = shl i32 %23, 1
  %31 = icmp ugt i32 %30, %2
  br i1 %31, label %28, label %22, !llvm.loop !11

32:                                               ; preds = %25, %47
  %33 = phi i32 [ %23, %25 ], [ %34, %47 ]
  %34 = lshr i32 %33, 1
  %35 = xor i32 %34, %12
  %36 = icmp ugt i32 %35, %12
  br i1 %36, label %37, label %47

37:                                               ; preds = %32
  %38 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7
  %39 = zext i32 %35 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  br i1 %27, label %42, label %44

42:                                               ; preds = %37
  %43 = icmp sgt i32 %38, %41
  br i1 %43, label %46, label %47

44:                                               ; preds = %37
  %45 = icmp slt i32 %38, %41
  br i1 %45, label %46, label %47

46:                                               ; preds = %44, %42
  store i32 %41, i32 addrspace(1)* %21, align 4, !tbaa !7
  store i32 %38, i32 addrspace(1)* %40, align 4, !tbaa !7
  br label %47

47:                                               ; preds = %46, %42, %44, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ult i32 %33, 4
  br i1 %48, label %29, label %32, !llvm.loop !13
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
!13 = distinct !{!13, !12}
