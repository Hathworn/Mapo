; ModuleID = '../data/hip_kernels/17807/7/main.cu'
source_filename = "../data/hip_kernels/17807/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E12c_frontier_s = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16
@_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E17c_frontier_tail_s = internal addrspace(3) global i32 undef, align 4
@_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E19our_c_frontier_tail = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture %6, i32 addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  store i32 0, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E17c_frontier_tail_s, align 4, !tbaa !5
  br label %12

12:                                               ; preds = %11, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !9, !invariant.load !10
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %9
  %21 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !5
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %86

23:                                               ; preds = %12
  %24 = sext i32 %20 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %27
  %29 = add nsw i32 %26, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %30
  %32 = bitcast i32 addrspace(1)* %28 to <2 x i32> addrspace(1)*
  %33 = load <2 x i32>, <2 x i32> addrspace(1)* %32, align 4, !tbaa !5
  %34 = extractelement <2 x i32> %33, i64 0
  %35 = extractelement <2 x i32> %33, i64 1
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %39

37:                                               ; preds = %23
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %27
  br label %40

39:                                               ; preds = %65, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %10, label %69, label %72

40:                                               ; preds = %37, %65
  %41 = phi i32 [ %34, %37 ], [ %66, %65 ]
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !5
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %45
  %47 = atomicrmw xchg i32 addrspace(1)* %46, i32 1 syncscope("agent-one-as") monotonic, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %65

49:                                               ; preds = %40
  %50 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !5
  %51 = add nsw i32 %50, 1
  %52 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !5
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %53
  store i32 %51, i32 addrspace(1)* %54, align 4, !tbaa !5
  %55 = atomicrmw add i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E17c_frontier_tail_s, i32 1 syncscope("agent-one-as") monotonic, align 4
  %56 = icmp slt i32 %55, 16
  br i1 %56, label %57, label %60

57:                                               ; preds = %49
  %58 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !5
  %59 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E12c_frontier_s, i32 0, i32 %55
  store i32 %58, i32 addrspace(3)* %59, align 4, !tbaa !5
  br label %65

60:                                               ; preds = %49
  store i32 16, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E17c_frontier_tail_s, align 4, !tbaa !5
  %61 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  %62 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !5
  %63 = sext i32 %61 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %63
  store i32 %62, i32 addrspace(1)* %64, align 4, !tbaa !5
  br label %65

65:                                               ; preds = %57, %60, %40
  %66 = add nsw i32 %41, 1
  %67 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !5
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %40, label %39, !llvm.loop !11

69:                                               ; preds = %39
  %70 = load i32, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E17c_frontier_tail_s, align 4, !tbaa !5
  %71 = atomicrmw add i32 addrspace(1)* %3, i32 %70 syncscope("agent-one-as") monotonic, align 4
  store i32 %71, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E19our_c_frontier_tail, align 4, !tbaa !5
  br label %72

72:                                               ; preds = %69, %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %73 = load i32, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E17c_frontier_tail_s, align 4, !tbaa !5
  %74 = icmp slt i32 %9, %73
  br i1 %74, label %75, label %86

75:                                               ; preds = %72
  %76 = load i32, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E19our_c_frontier_tail, align 4, !tbaa !5
  br label %77

77:                                               ; preds = %75, %77
  %78 = phi i32 [ %9, %75 ], [ %84, %77 ]
  %79 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ17BFS_Bqueue_kernelPiS_S_S_S_S_S_S_E12c_frontier_s, i32 0, i32 %78
  %80 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !5
  %81 = add nsw i32 %76, %78
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %82
  store i32 %80, i32 addrspace(1)* %83, align 4, !tbaa !5
  %84 = add i32 %78, %18
  %85 = icmp slt i32 %84, %73
  br i1 %85, label %77, label %86, !llvm.loop !13

86:                                               ; preds = %77, %72, %12
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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
