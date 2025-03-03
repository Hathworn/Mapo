; ModuleID = '../data/hip_kernels/17691/1/main.cu'
source_filename = "../data/hip_kernels/17691/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15histo_MonoBlockPhlPjE4temp = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15histo_MonoBlockPhlPj(i8 addrspace(1)* nocapture readonly %0, i64 %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ15histo_MonoBlockPhlPjE4temp, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %5, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !9, !invariant.load !10
  %10 = zext i16 %9 to i64
  %11 = zext i32 %4 to i64
  %12 = icmp slt i64 %11, %1
  br i1 %12, label %13, label %23

13:                                               ; preds = %3, %13
  %14 = phi i64 [ %21, %13 ], [ %11, %3 ]
  %15 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %14
  %16 = load i8, i8 addrspace(1)* %15, align 1, !tbaa !11, !amdgpu.noclobber !10
  %17 = zext i8 %16 to i32
  %18 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ15histo_MonoBlockPhlPjE4temp, i32 0, i32 %17
  %19 = atomicrmw add i32 addrspace(3)* %18, i32 1 syncscope("agent-one-as") monotonic, align 4
  %20 = add nuw nsw i64 %14, %10
  %21 = and i64 %20, 4294967295
  %22 = icmp slt i64 %21, %1
  br i1 %22, label %13, label %23, !llvm.loop !12

23:                                               ; preds = %13, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %11
  %25 = load i32, i32 addrspace(3)* %5, align 4, !tbaa !5
  %26 = atomicrmw add i32 addrspace(1)* %24, i32 %25 syncscope("agent-one-as") monotonic, align 4
  ret void
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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!7, !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
