; ModuleID = '../data/hip_kernels/2824/69/main.cu'
source_filename = "../data/hip_kernels/2824/69/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z7atomicsPiS_ii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %44

15:                                               ; preds = %4
  %16 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %17 = sext i32 %13 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  store i32 %16, i32 addrspace(1)* %18, align 4, !tbaa !7
  %19 = icmp sgt i32 %3, 0
  br i1 %19, label %20, label %44

20:                                               ; preds = %15
  %21 = and i32 %3, 7
  %22 = icmp ult i32 %3, 8
  br i1 %22, label %37, label %23

23:                                               ; preds = %20
  %24 = and i32 %3, -8
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi i32 [ 0, %23 ], [ %35, %25 ]
  %27 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %28 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %29 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %30 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %31 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %32 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %33 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %34 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %35 = add i32 %26, 8
  %36 = icmp eq i32 %35, %24
  br i1 %36, label %37, label %25, !llvm.loop !11

37:                                               ; preds = %25, %20
  %38 = icmp eq i32 %21, 0
  br i1 %38, label %44, label %39

39:                                               ; preds = %37, %39
  %40 = phi i32 [ %42, %39 ], [ 0, %37 ]
  %41 = atomicrmw add i32 addrspace(1)* %0, i32 1 syncscope("agent-one-as") monotonic, align 4
  %42 = add i32 %40, 1
  %43 = icmp eq i32 %42, %21
  br i1 %43, label %44, label %39, !llvm.loop !13

44:                                               ; preds = %37, %39, %15, %4
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
