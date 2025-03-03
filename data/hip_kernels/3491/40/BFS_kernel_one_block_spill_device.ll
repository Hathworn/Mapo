; ModuleID = '../data/hip_kernels/3491/40/main.cu'
source_filename = "../data/hip_kernels/3491/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_mem = external hidden addrspace(3) global [0 x i32], align 4
@_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE8b_offset = internal addrspace(3) global [1 x i32] undef, align 4
@_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE10b_q_length = internal addrspace(3) global [1 x i32] undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_j(i32 addrspace(1)* %0, i32 %1, i32 addrspace(1)* %2, i32 addrspace(1)* %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 addrspace(1)* %8, i32 %9) local_unnamed_addr #0 {
  %11 = addrspacecast i32 addrspace(1)* %8 to i32*
  %12 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_mem, i32 0, i32 %9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = icmp ult i32 %13, %1
  br i1 %14, label %15, label %21

15:                                               ; preds = %10
  %16 = zext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = addrspacecast i32 addrspace(1)* %17 to i32*
  %19 = load volatile i32, i32* %18, align 4, !tbaa !5
  %20 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_mem, i32 0, i32 %13
  store i32 %19, i32 addrspace(3)* %20, align 4, !tbaa !5
  br label %21

21:                                               ; preds = %15, %10
  %22 = icmp eq i32 %13, 0
  %23 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_mem, i32 0, i32 %13
  %24 = addrspacecast i32 addrspace(3)* %23 to i32*
  %25 = icmp ult i32 %13, %9
  %26 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 %13
  %27 = addrspacecast i32 addrspace(3)* %26 to i32*
  %28 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %29 = getelementptr i8, i8 addrspace(4)* %28, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  br label %31

31:                                               ; preds = %111, %21
  %32 = phi i32 [ %1, %21 ], [ %112, %111 ]
  br i1 %22, label %33, label %34

33:                                               ; preds = %31
  store volatile i32 0, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !5
  store volatile i32 0, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0) to i32*), align 4, !tbaa !5
  br label %34

34:                                               ; preds = %33, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp ult i32 %13, %32
  br i1 %35, label %36, label %81

36:                                               ; preds = %34
  %37 = load volatile i32, i32* %24, align 4, !tbaa !5
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %38
  %40 = addrspacecast i32 addrspace(1)* %39 to i32*
  store volatile i32 0, i32* %40, align 4, !tbaa !5
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %38
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %43 = add i32 %37, 1
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !5
  %47 = icmp ult i32 %42, %46
  br i1 %47, label %48, label %81

48:                                               ; preds = %36
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %50 = addrspacecast i32 addrspace(1)* %49 to i32*
  br label %51

51:                                               ; preds = %48, %78
  %52 = phi i32 [ %42, %48 ], [ %79, %78 ]
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %56
  %58 = load volatile i32, i32* %50, align 4, !tbaa !5
  %59 = add i32 %58, 1
  %60 = atomicrmw umin i32 addrspace(1)* %57, i32 %59 syncscope("agent-one-as") monotonic, align 4
  %61 = load volatile i32, i32* %50, align 4, !tbaa !5
  %62 = add i32 %61, 1
  %63 = icmp ugt i32 %60, %62
  br i1 %63, label %64, label %78

64:                                               ; preds = %51
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %56
  %66 = atomicrmw xchg i32 addrspace(1)* %65, i32 1 syncscope("agent-one-as") monotonic, align 4
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %78

68:                                               ; preds = %64
  %69 = atomicrmw add i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0), i32 1 syncscope("agent-one-as") monotonic, align 4
  %70 = icmp ult i32 %69, %9
  br i1 %70, label %71, label %73

71:                                               ; preds = %68
  %72 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 %69
  store i32 %55, i32 addrspace(3)* %72, align 4, !tbaa !5
  br label %78

73:                                               ; preds = %68
  %74 = atomicrmw add i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0), i32 1 syncscope("agent-one-as") monotonic, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  %77 = addrspacecast i32 addrspace(1)* %76 to i32*
  store volatile i32 %55, i32* %77, align 4, !tbaa !5
  br label %78

78:                                               ; preds = %64, %73, %71, %51
  %79 = add nuw i32 %52, 1
  %80 = icmp ult i32 %79, %46
  br i1 %80, label %51, label %81, !llvm.loop !9

81:                                               ; preds = %78, %36, %34
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %25, label %82, label %84

82:                                               ; preds = %81
  %83 = load volatile i32, i32* %27, align 4, !tbaa !5
  store i32 %83, i32 addrspace(3)* %23, align 4, !tbaa !5
  br label %84

84:                                               ; preds = %82, %81
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %85 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !5
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %88

87:                                               ; preds = %84
  br i1 %22, label %113, label %115

88:                                               ; preds = %84
  %89 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !5
  %90 = load i16, i16 addrspace(4)* %30, align 4, !range !11, !invariant.load !12
  %91 = zext i16 %90 to i32
  %92 = icmp ugt i32 %89, %91
  br i1 %92, label %96, label %93

93:                                               ; preds = %88
  %94 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !5
  %95 = icmp ugt i32 %94, %9
  br i1 %95, label %96, label %111

96:                                               ; preds = %93, %88
  %97 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !5
  %98 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0) to i32*), align 4, !tbaa !5
  %99 = sub i32 %97, %98
  %100 = icmp ult i32 %13, %99
  br i1 %100, label %101, label %108

101:                                              ; preds = %96
  %102 = load volatile i32, i32* %24, align 4, !tbaa !5
  %103 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0) to i32*), align 4, !tbaa !5
  %104 = add i32 %103, %13
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %105
  %107 = addrspacecast i32 addrspace(1)* %106 to i32*
  store volatile i32 %102, i32* %107, align 4, !tbaa !5
  br label %108

108:                                              ; preds = %101, %96
  br i1 %22, label %109, label %115

109:                                              ; preds = %108
  %110 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !5
  br label %113

111:                                              ; preds = %93
  %112 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ26BFS_kernel_one_block_spillPVjjS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %31, !llvm.loop !13

113:                                              ; preds = %87, %109
  %114 = phi i32 [ %110, %109 ], [ 0, %87 ]
  store volatile i32 %114, i32* %11, align 4, !tbaa !5
  br label %115

115:                                              ; preds = %113, %108, %87
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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{i16 1, i16 1025}
!12 = !{}
!13 = distinct !{!13, !10}
