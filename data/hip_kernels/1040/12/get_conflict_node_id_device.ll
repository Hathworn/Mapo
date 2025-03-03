; ModuleID = '../data/hip_kernels/1040/12/main.cu'
source_filename = "../data/hip_kernels/1040/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20get_conflict_node_idPiS_iS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp slt i32 %6, %4
  br i1 %7, label %8, label %15

8:                                                ; preds = %5
  %9 = add nsw i32 %2, 1
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  br label %16

15:                                               ; preds = %28, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

16:                                               ; preds = %8, %28
  %17 = phi i32 [ %6, %8 ], [ %29, %28 ]
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7
  %21 = icmp eq i32 %20, %9
  br i1 %21, label %22, label %28

22:                                               ; preds = %16
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7
  %25 = icmp sgt i32 %24, %2
  br i1 %25, label %28, label %26

26:                                               ; preds = %22
  %27 = atomicrmw max i32 addrspace(1)* %3, i32 %24 syncscope("agent-one-as") monotonic, align 4
  br label %28

28:                                               ; preds = %16, %22, %26
  %29 = add i32 %17, %14
  %30 = icmp slt i32 %29, %4
  br i1 %30, label %16, label %15, !llvm.loop !11
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
