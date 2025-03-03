; ModuleID = '../data/hip_kernels/3491/42/main.cu'
source_filename = "../data/hip_kernels/3491/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length = internal addrspace(3) global [1 x i32] undef, align 4
@_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE8b_offset = internal addrspace(3) global [1 x i32] undef, align 4
@b_q = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_j(i32 addrspace(1)* %0, i32 addrspace(1)* %1, i32 %2, i32 addrspace(1)* %3, i32 addrspace(1)* %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 addrspace(1)* nocapture %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %18, %17
  %20 = add i32 %19, %12
  %21 = icmp eq i32 %12, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %11
  store volatile i32 0, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !7
  store volatile i32 0, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0) to i32*), align 4, !tbaa !7
  br label %23

23:                                               ; preds = %22, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = icmp ult i32 %20, %2
  br i1 %24, label %25, label %76

25:                                               ; preds = %23
  %26 = zext i32 %20 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = addrspacecast i32 addrspace(1)* %27 to i32*
  %29 = load volatile i32, i32* %28, align 4, !tbaa !7
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %30
  %32 = addrspacecast i32 addrspace(1)* %31 to i32*
  store volatile i32 0, i32* %32, align 4, !tbaa !7
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %30
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %35 = add i32 %29, 1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = icmp ult i32 %34, %38
  br i1 %39, label %40, label %76

40:                                               ; preds = %25
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %30
  %42 = addrspacecast i32 addrspace(1)* %41 to i32*
  br label %43

43:                                               ; preds = %40, %73
  %44 = phi i32 [ %34, %40 ], [ %74, %73 ]
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %48
  %50 = load volatile i32, i32* %42, align 4, !tbaa !7
  %51 = add i32 %50, 1
  %52 = atomicrmw umin i32 addrspace(1)* %49, i32 %51 syncscope("agent-one-as") monotonic, align 4
  %53 = load volatile i32, i32* %42, align 4, !tbaa !7
  %54 = add i32 %53, 1
  %55 = icmp ugt i32 %52, %54
  br i1 %55, label %56, label %73

56:                                               ; preds = %43
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %48
  %58 = atomicrmw xchg i32 addrspace(1)* %57, i32 1 syncscope("agent-one-as") monotonic, align 4
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %73

60:                                               ; preds = %56
  %61 = atomicrmw add i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0), i32 1 syncscope("agent-one-as") monotonic, align 4
  %62 = icmp ult i32 %61, %10
  br i1 %62, label %63, label %66

63:                                               ; preds = %60
  %64 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @b_q, i32 0, i32 %61
  %65 = addrspacecast i32 addrspace(3)* %64 to i32*
  br label %71

66:                                               ; preds = %60
  %67 = atomicrmw add i32 addrspace(1)* %9, i32 1 syncscope("agent-one-as") monotonic, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = addrspacecast i32 addrspace(1)* %69 to i32*
  br label %71

71:                                               ; preds = %63, %66
  %72 = phi i32* [ %70, %66 ], [ %65, %63 ]
  store volatile i32 %47, i32* %72, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %71, %56, %43
  %74 = add nuw i32 %44, 1
  %75 = icmp ult i32 %74, %38
  br i1 %75, label %43, label %76, !llvm.loop !11

76:                                               ; preds = %73, %25, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %21, label %77, label %84

77:                                               ; preds = %76
  %78 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !7
  %79 = icmp ugt i32 %78, %10
  br i1 %79, label %80, label %81

80:                                               ; preds = %77
  store volatile i32 %10, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !7
  br label %81

81:                                               ; preds = %80, %77
  %82 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !7
  %83 = atomicrmw add i32 addrspace(1)* %9, i32 %82 syncscope("agent-one-as") monotonic, align 4
  store volatile i32 %83, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0) to i32*), align 4, !tbaa !7
  br label %84

84:                                               ; preds = %81, %76
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %85 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !7
  %86 = icmp ult i32 %12, %85
  br i1 %86, label %87, label %96

87:                                               ; preds = %84
  %88 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @b_q, i32 0, i32 %12
  %89 = addrspacecast i32 addrspace(3)* %88 to i32*
  %90 = load volatile i32, i32* %89, align 4, !tbaa !7
  %91 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ28BFS_kernel_multi_block_spillPVjS0_jS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0) to i32*), align 4, !tbaa !7
  %92 = add i32 %91, %12
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %93
  %95 = addrspacecast i32 addrspace(1)* %94 to i32*
  store volatile i32 %90, i32* %95, align 4, !tbaa !7
  br label %96

96:                                               ; preds = %87, %84
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
