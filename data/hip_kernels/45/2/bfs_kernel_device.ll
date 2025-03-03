; ModuleID = '../data/hip_kernels/45/2/main.cu'
source_filename = "../data/hip_kernels/45/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.Node = type { i32, i32 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bfs_kernelP4NodePiPbS2_S1_S2_i(%struct.Node addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture %2, i8 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i8 addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %6
  br i1 %17, label %18, label %56

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %19
  %21 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %56, label %23

23:                                               ; preds = %18
  store i8 0, i8 addrspace(1)* %20, align 1, !tbaa !7
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %19
  store i8 1, i8 addrspace(1)* %24, align 1, !tbaa !7
  %25 = getelementptr inbounds %struct.Node, %struct.Node addrspace(1)* %0, i64 %19, i32 0
  %26 = getelementptr inbounds %struct.Node, %struct.Node addrspace(1)* %0, i64 %19, i32 1
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !12
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %56

29:                                               ; preds = %23
  %30 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !15
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %19
  br label %32

32:                                               ; preds = %29, %50
  %33 = phi i32 [ %30, %29 ], [ %51, %50 ]
  %34 = phi i32 [ %27, %29 ], [ %52, %50 ]
  %35 = phi i32 [ %30, %29 ], [ %53, %50 ]
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !16
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7, !range !11
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %43, label %50

43:                                               ; preds = %32
  %44 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !16
  %45 = add nsw i32 %44, 1
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %39
  store i32 %45, i32 addrspace(1)* %46, align 4, !tbaa !16
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %39
  store i8 1, i8 addrspace(1)* %47, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %5, align 1, !tbaa !7
  %48 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !12
  %49 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !15
  br label %50

50:                                               ; preds = %43, %32
  %51 = phi i32 [ %49, %43 ], [ %33, %32 ]
  %52 = phi i32 [ %48, %43 ], [ %34, %32 ]
  %53 = add nsw i32 %35, 1
  %54 = add nsw i32 %51, %52
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %32, label %56, !llvm.loop !17

56:                                               ; preds = %50, %23, %18, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = !{!13, !14, i64 4}
!13 = !{!"_ZTS4Node", !14, i64 0, !14, i64 4}
!14 = !{!"int", !9, i64 0}
!15 = !{!13, !14, i64 0}
!16 = !{!14, !14, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
