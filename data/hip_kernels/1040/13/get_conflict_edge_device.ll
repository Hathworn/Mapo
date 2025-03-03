; ModuleID = '../data/hip_kernels/1040/13/main.cu'
source_filename = "../data/hip_kernels/1040/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17get_conflict_edgePiS_S_S_iiS_iii(i32 addrspace(1)* nocapture readnone %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readnone %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = icmp slt i32 %11, %8
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = sub nsw i32 0, %4
  %15 = add nsw i32 %5, 1
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 1
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  br label %23

22:                                               ; preds = %40, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

23:                                               ; preds = %13, %40
  %24 = phi i32 [ %11, %13 ], [ %41, %40 ]
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7
  %28 = icmp eq i32 %27, %14
  br i1 %28, label %29, label %31

29:                                               ; preds = %23
  %30 = atomicrmw max i32 addrspace(1)* %6, i32 %24 syncscope("agent-one-as") monotonic, align 4
  br label %31

31:                                               ; preds = %29, %23
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %25
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %34 = icmp eq i32 %33, %15
  br i1 %34, label %35, label %40

35:                                               ; preds = %31
  %36 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7
  %37 = icmp eq i32 %36, %4
  br i1 %37, label %38, label %40

38:                                               ; preds = %35
  %39 = atomicrmw max i32 addrspace(1)* %16, i32 %24 syncscope("agent-one-as") monotonic, align 4
  br label %40

40:                                               ; preds = %31, %35, %38
  %41 = add i32 %24, %21
  %42 = icmp slt i32 %41, %8
  br i1 %42, label %23, label %22, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
