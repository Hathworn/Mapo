; ModuleID = '../data/hip_kernels/17807/8/main.cu'
source_filename = "../data/hip_kernels/17807/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E12c_frontier_s = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16
@_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E17c_frontier_tail_s = internal addrspace(3) global i32 undef, align 4
@_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E19our_c_frontier_tail = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture %6, i32 addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  store i32 0, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E17c_frontier_tail_s, align 4, !tbaa !5
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
  %22 = icmp ult i32 %20, %21
  br i1 %22, label %23, label %83

23:                                               ; preds = %12
  %24 = zext i32 %20 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !5
  %30 = add i32 %26, 1
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5
  %34 = icmp ult i32 %29, %33
  br i1 %34, label %35, label %37

35:                                               ; preds = %23
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %27
  br label %38

37:                                               ; preds = %62, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %10, label %66, label %69

38:                                               ; preds = %35, %62
  %39 = phi i32 [ %29, %35 ], [ %63, %62 ]
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %43
  %45 = atomicrmw xchg i32 addrspace(1)* %44, i32 1 syncscope("agent-one-as") monotonic, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %62

47:                                               ; preds = %38
  %48 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5
  %49 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %50
  store i32 %48, i32 addrspace(1)* %51, align 4, !tbaa !5
  %52 = atomicrmw add i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E17c_frontier_tail_s, i32 1 syncscope("agent-one-as") monotonic, align 4
  %53 = icmp ult i32 %52, 16
  br i1 %53, label %54, label %57

54:                                               ; preds = %47
  %55 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %56 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E12c_frontier_s, i32 0, i32 %52
  store i32 %55, i32 addrspace(3)* %56, align 4, !tbaa !5
  br label %62

57:                                               ; preds = %47
  store i32 16, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E17c_frontier_tail_s, align 4, !tbaa !5
  %58 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  %59 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %60 = zext i32 %58 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  store i32 %59, i32 addrspace(1)* %61, align 4, !tbaa !5
  br label %62

62:                                               ; preds = %54, %57, %38
  %63 = add nuw i32 %39, 1
  %64 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5
  %65 = icmp ult i32 %63, %64
  br i1 %65, label %38, label %37, !llvm.loop !11

66:                                               ; preds = %37
  %67 = load i32, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E17c_frontier_tail_s, align 4, !tbaa !5
  %68 = atomicrmw add i32 addrspace(1)* %3, i32 %67 syncscope("agent-one-as") monotonic, align 4
  store i32 %68, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E19our_c_frontier_tail, align 4, !tbaa !5
  br label %69

69:                                               ; preds = %66, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = load i32, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E17c_frontier_tail_s, align 4, !tbaa !5
  %71 = icmp ult i32 %9, %70
  br i1 %71, label %72, label %83

72:                                               ; preds = %69
  %73 = load i32, i32 addrspace(3)* @_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E19our_c_frontier_tail, align 4, !tbaa !5
  br label %74

74:                                               ; preds = %72, %74
  %75 = phi i32 [ %9, %72 ], [ %81, %74 ]
  %76 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ17BFS_Bqueue_kernelPjS_S_S_S_S_S_S_E12c_frontier_s, i32 0, i32 %75
  %77 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !5
  %78 = add i32 %73, %75
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %79
  store i32 %77, i32 addrspace(1)* %80, align 4, !tbaa !5
  %81 = add i32 %75, %18
  %82 = icmp ult i32 %81, %70
  br i1 %82, label %74, label %83, !llvm.loop !13

83:                                               ; preds = %74, %69, %12
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
