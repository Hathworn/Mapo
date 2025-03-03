; ModuleID = '../data/hip_kernels/8390/0/main.cu'
source_filename = "../data/hip_kernels/8390/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.block = type { %struct.secuence, %struct.secuence, i32, i32, i32 }
%struct.secuence = type { i32, i32, i32 }

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7gqsort1P5blockPiS1_S1_(%struct.block addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = sext i32 %5 to i64
  %13 = getelementptr inbounds %struct.block, %struct.block addrspace(1)* %0, i64 %12, i32 0, i32 2
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = getelementptr inbounds %struct.block, %struct.block addrspace(1)* %0, i64 %12, i32 0, i32 0
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !13, !amdgpu.noclobber !6
  %17 = getelementptr inbounds %struct.block, %struct.block addrspace(1)* %0, i64 %12, i32 0, i32 1
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !14, !amdgpu.noclobber !6
  %19 = icmp eq i32 %6, 0
  br i1 %19, label %20, label %23

20:                                               ; preds = %4
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %12
  store i32 0, i32 addrspace(1)* %21, align 4, !tbaa !15
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %12
  store i32 0, i32 addrspace(1)* %22, align 4, !tbaa !15
  br label %23

23:                                               ; preds = %20, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = add nsw i32 %16, %6
  %25 = icmp slt i32 %24, %18
  br i1 %25, label %33, label %26

26:                                               ; preds = %33, %23
  %27 = phi i32 [ 0, %23 ], [ %43, %33 ]
  %28 = phi i32 [ 0, %23 ], [ %45, %33 ]
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %12
  %30 = atomicrmw add i32 addrspace(1)* %29, i32 %27 syncscope("agent-one-as") monotonic, align 4
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %12
  %32 = atomicrmw add i32 addrspace(1)* %31, i32 %28 syncscope("agent-one-as") monotonic, align 4
  ret void

33:                                               ; preds = %23, %33
  %34 = phi i32 [ %46, %33 ], [ %24, %23 ]
  %35 = phi i32 [ %45, %33 ], [ 0, %23 ]
  %36 = phi i32 [ %43, %33 ], [ 0, %23 ]
  %37 = sext i32 %34 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !15
  %40 = icmp slt i32 %39, %14
  %41 = icmp sgt i32 %39, %14
  %42 = zext i1 %40 to i32
  %43 = add nuw nsw i32 %36, %42
  %44 = zext i1 %41 to i32
  %45 = add nuw nsw i32 %35, %44
  %46 = add nsw i32 %34, %11
  %47 = icmp slt i32 %46, %18
  br i1 %47, label %33, label %26, !llvm.loop !16
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
!7 = !{!8, !10, i64 8}
!8 = !{!"_ZTS5block", !9, i64 0, !9, i64 12, !10, i64 24, !10, i64 28, !10, i64 32}
!9 = !{!"_ZTS8secuence", !10, i64 0, !10, i64 4, !10, i64 8}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = !{!8, !10, i64 0}
!14 = !{!8, !10, i64 4}
!15 = !{!10, !10, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
