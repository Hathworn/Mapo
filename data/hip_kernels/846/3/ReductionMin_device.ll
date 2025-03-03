; ModuleID = '../data/hip_kernels/846/3/main.cu'
source_filename = "../data/hip_kernels/846/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12ReductionMinPjS_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = icmp ult i16 %8, 2
  br i1 %9, label %14, label %10

10:                                               ; preds = %3
  %11 = zext i16 %8 to i32
  %12 = zext i32 %4 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  br label %16

14:                                               ; preds = %29, %3
  %15 = icmp eq i32 %4, 0
  br i1 %15, label %31, label %33

16:                                               ; preds = %10, %29
  %17 = phi i32 [ %11, %10 ], [ %18, %29 ]
  %18 = lshr i32 %17, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = icmp ult i32 %4, %18
  br i1 %19, label %20, label %29

20:                                               ; preds = %16
  %21 = add nuw nsw i32 %18, %4
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7
  %25 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7
  %26 = add i32 %25, -1
  %27 = icmp ult i32 %26, %24
  br i1 %27, label %29, label %28

28:                                               ; preds = %20
  store i32 %24, i32 addrspace(1)* %13, align 4, !tbaa !7
  br label %29

29:                                               ; preds = %20, %16, %28
  %30 = icmp ult i32 %17, 4
  br i1 %30, label %14, label %16, !llvm.loop !11

31:                                               ; preds = %14
  %32 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7
  store i32 %32, i32 addrspace(1)* %1, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %31, %14
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
