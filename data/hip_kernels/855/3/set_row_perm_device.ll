; ModuleID = '../data/hip_kernels/855/3/main.cu'
source_filename = "../data/hip_kernels/855/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z12set_row_permPiS_S_S_iii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %4
  br i1 %17, label %18, label %58

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = icmp sgt i32 %21, %5
  br i1 %22, label %35, label %23

23:                                               ; preds = %44, %41, %38, %35, %18
  %24 = phi i32 [ 0, %18 ], [ 1, %35 ], [ 2, %38 ], [ 3, %41 ], [ 4, %44 ]
  %25 = icmp sgt i32 %21, %6
  %26 = zext i32 %24 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  br i1 %25, label %30, label %28

28:                                               ; preds = %23
  %29 = atomicrmw add i32 addrspace(1)* %27, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %50

30:                                               ; preds = %23
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 1
  %32 = atomicrmw add i32 addrspace(1)* %31, i32 1 syncscope("agent-one-as") monotonic, align 4
  %33 = add nuw nsw i32 %24, 1
  %34 = zext i32 %33 to i64
  br label %50

35:                                               ; preds = %18
  %36 = shl i32 %5, 1
  %37 = icmp sgt i32 %21, %36
  br i1 %37, label %38, label %23

38:                                               ; preds = %35
  %39 = shl i32 %5, 2
  %40 = icmp sgt i32 %21, %39
  br i1 %40, label %41, label %23

41:                                               ; preds = %38
  %42 = shl i32 %5, 3
  %43 = icmp sgt i32 %21, %42
  br i1 %43, label %44, label %23

44:                                               ; preds = %41
  %45 = shl i32 %5, 4
  %46 = icmp sgt i32 %21, %45
  br i1 %46, label %47, label %23

47:                                               ; preds = %44
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 6
  %49 = atomicrmw add i32 addrspace(1)* %48, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %50

50:                                               ; preds = %28, %30, %47
  %51 = phi i64 [ 6, %47 ], [ %34, %30 ], [ %26, %28 ]
  %52 = phi i32 [ %49, %47 ], [ %32, %30 ], [ %29, %28 ]
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7
  %55 = add nsw i32 %54, %52
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %56
  store i32 %16, i32 addrspace(1)* %57, align 4, !tbaa !7
  br label %58

58:                                               ; preds = %50, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
