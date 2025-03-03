; ModuleID = '../data/hip_kernels/3491/41/main.cu'
source_filename = "../data/hip_kernels/3491/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@g_mutex = protected addrspace(1) externally_initialized global i32 0, align 4
@g_mutex2 = protected addrspace(1) externally_initialized global i32 0, align 4
@g_q_offsets = protected addrspace(1) externally_initialized global [1 x i32] zeroinitializer, align 4
@g_q_size = protected addrspace(1) externally_initialized global [1 x i32] zeroinitializer, align 4
@_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length = internal addrspace(3) global [1 x i32] undef, align 4
@_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE8b_offset = internal addrspace(3) global [1 x i32] undef, align 4
@b_q = external hidden addrspace(3) global [0 x i32], align 4
@llvm.compiler.used = appending addrspace(1) global [4 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @g_mutex to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @g_mutex2 to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([1 x i32] addrspace(1)* @g_q_offsets to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([1 x i32] addrspace(1)* @g_q_size to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_j(i32 addrspace(1)* %0, i32 addrspace(1)* %1, i32 %2, i32 addrspace(1)* %3, i32 addrspace(1)* %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 addrspace(1)* %9, i32 %10) local_unnamed_addr #0 {
  %12 = addrspacecast i32 addrspace(1)* %9 to i32*
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !7
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = mul i32 %22, %18
  %24 = add i32 %23, %13
  %25 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* @g_mutex2 to i32*), align 4, !tbaa !16
  %26 = icmp eq i32 %13, 0
  %27 = zext i32 %24 to i64
  %28 = icmp eq i32 %24, 0
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @b_q, i32 0, i32 %13
  %30 = addrspacecast i32 addrspace(3)* %29 to i32*
  br label %31

31:                                               ; preds = %143, %11
  %32 = phi i32 [ %2, %11 ], [ %146, %143 ]
  %33 = phi i32 [ %25, %11 ], [ %130, %143 ]
  %34 = phi i32 [ 0, %11 ], [ %145, %143 ]
  br i1 %26, label %35, label %36

35:                                               ; preds = %31
  store volatile i32 0, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !16
  store volatile i32 0, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0) to i32*), align 4, !tbaa !16
  br label %36

36:                                               ; preds = %35, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp ult i32 %24, %32
  br i1 %37, label %38, label %94

38:                                               ; preds = %36
  %39 = icmp eq i32 %34, 0
  %40 = select i1 %39, i32 addrspace(1)* %0, i32 addrspace(1)* %1
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %40, i64 %27
  %42 = addrspacecast i32 addrspace(1)* %41 to i32*
  %43 = load volatile i32, i32* %42, align 4, !tbaa !16
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %44
  %46 = addrspacecast i32 addrspace(1)* %45 to i32*
  store volatile i32 0, i32* %46, align 4, !tbaa !16
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %44
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !16
  %49 = add i32 %43, 1
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16
  %53 = icmp ult i32 %48, %52
  br i1 %53, label %54, label %94

54:                                               ; preds = %38
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %44
  %56 = addrspacecast i32 addrspace(1)* %55 to i32*
  br label %57

57:                                               ; preds = %54, %91
  %58 = phi i32 [ %48, %54 ], [ %92, %91 ]
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !16
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %62
  %64 = load volatile i32, i32* %56, align 4, !tbaa !16
  %65 = add i32 %64, 1
  %66 = atomicrmw umin i32 addrspace(1)* %63, i32 %65 syncscope("agent-one-as") monotonic, align 4
  %67 = load volatile i32, i32* %56, align 4, !tbaa !16
  %68 = add i32 %67, 1
  %69 = icmp ugt i32 %66, %68
  br i1 %69, label %70, label %91

70:                                               ; preds = %57
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %62
  %72 = atomicrmw xchg i32 addrspace(1)* %71, i32 1 syncscope("agent-one-as") monotonic, align 4
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %91

74:                                               ; preds = %70
  %75 = atomicrmw add i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0), i32 1 syncscope("agent-one-as") monotonic, align 4
  %76 = icmp ult i32 %75, %10
  br i1 %76, label %77, label %80

77:                                               ; preds = %74
  %78 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @b_q, i32 0, i32 %75
  %79 = addrspacecast i32 addrspace(3)* %78 to i32*
  br label %89

80:                                               ; preds = %74
  %81 = atomicrmw add i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_offsets, i64 0, i64 0), i32 1 syncscope("agent-one-as") monotonic, align 4
  %82 = sext i32 %81 to i64
  br i1 %39, label %83, label %86

83:                                               ; preds = %80
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  %85 = addrspacecast i32 addrspace(1)* %84 to i32*
  br label %89

86:                                               ; preds = %80
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %82
  %88 = addrspacecast i32 addrspace(1)* %87 to i32*
  br label %89

89:                                               ; preds = %77, %86, %83
  %90 = phi i32* [ %85, %83 ], [ %88, %86 ], [ %79, %77 ]
  store volatile i32 %61, i32* %90, align 4, !tbaa !16
  br label %91

91:                                               ; preds = %89, %70, %57
  %92 = add nuw i32 %58, 1
  %93 = icmp ult i32 %92, %52
  br i1 %93, label %57, label %94, !llvm.loop !20

94:                                               ; preds = %91, %38, %36
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %95, label %102

95:                                               ; preds = %94
  %96 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !16
  %97 = icmp ugt i32 %96, %10
  br i1 %97, label %98, label %99

98:                                               ; preds = %95
  store volatile i32 %10, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !16
  br label %99

99:                                               ; preds = %98, %95
  %100 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !16
  %101 = atomicrmw add i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_offsets, i64 0, i64 0), i32 %100 syncscope("agent-one-as") monotonic, align 4
  store volatile i32 %101, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0) to i32*), align 4, !tbaa !16
  br label %102

102:                                              ; preds = %99, %94
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = udiv i32 %21, %18
  %104 = mul i32 %103, %18
  %105 = icmp ugt i32 %21, %104
  %106 = zext i1 %105 to i32
  %107 = add i32 %103, %106
  %108 = add i32 %107, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %109, label %114

109:                                              ; preds = %102
  %110 = atomicrmw add i32 addrspace(1)* @g_mutex, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %111

111:                                              ; preds = %111, %109
  %112 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* @g_mutex to i32*), align 4, !tbaa !16
  %113 = icmp slt i32 %112, %108
  br i1 %113, label %111, label %114, !llvm.loop !22

114:                                              ; preds = %111, %102
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %28, label %115, label %117

115:                                              ; preds = %114
  %116 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_offsets, i64 0, i64 0) to i32*), align 4, !tbaa !16
  store volatile i32 %116, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_size, i64 0, i64 0) to i32*), align 4, !tbaa !16
  store volatile i32 0, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_offsets, i64 0, i64 0) to i32*), align 4, !tbaa !16
  br label %117

117:                                              ; preds = %115, %114
  %118 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE10b_q_length, i32 0, i32 0) to i32*), align 4, !tbaa !16
  %119 = icmp ult i32 %13, %118
  br i1 %119, label %120, label %129

120:                                              ; preds = %117
  %121 = icmp eq i32 %34, 0
  %122 = load volatile i32, i32* %30, align 4, !tbaa !16
  %123 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(3)* @_ZZ25BFS_kernel_SM_block_spillPVjS0_jS0_PViPjS3_jjS0_jE8b_offset, i32 0, i32 0) to i32*), align 4, !tbaa !16
  %124 = add i32 %123, %13
  %125 = zext i32 %124 to i64
  %126 = select i1 %121, i32 addrspace(1)* %1, i32 addrspace(1)* %0
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %126, i64 %125
  %128 = addrspacecast i32 addrspace(1)* %127 to i32*
  store volatile i32 %122, i32* %128, align 4, !tbaa !16
  br label %129

129:                                              ; preds = %120, %117
  %130 = add i32 %108, %107
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %131, label %136

131:                                              ; preds = %129
  %132 = atomicrmw add i32 addrspace(1)* @g_mutex, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %133

133:                                              ; preds = %133, %131
  %134 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* @g_mutex to i32*), align 4, !tbaa !16
  %135 = icmp slt i32 %134, %130
  br i1 %135, label %133, label %136, !llvm.loop !22

136:                                              ; preds = %133, %129
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %137 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_size, i64 0, i64 0) to i32*), align 4, !tbaa !16
  %138 = icmp ult i32 %137, %18
  br i1 %138, label %147, label %139

139:                                              ; preds = %136
  %140 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_size, i64 0, i64 0) to i32*), align 4, !tbaa !16
  %141 = mul i32 %107, %18
  %142 = icmp ugt i32 %140, %141
  br i1 %142, label %147, label %143

143:                                              ; preds = %139
  %144 = add nsw i32 %34, 1
  %145 = srem i32 %144, 2
  %146 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_size, i64 0, i64 0) to i32*), align 4, !tbaa !16
  br label %31, !llvm.loop !23

147:                                              ; preds = %136, %139
  %148 = icmp eq i32 %34, 0
  br i1 %148, label %149, label %165

149:                                              ; preds = %147
  %150 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_size, i64 0, i64 0) to i32*), align 4, !tbaa !16
  %151 = icmp slt i32 %24, %150
  br i1 %151, label %152, label %165

152:                                              ; preds = %149
  %153 = mul i32 %107, %18
  br label %154

154:                                              ; preds = %152, %154
  %155 = phi i32 [ %24, %152 ], [ %162, %154 ]
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %156
  %158 = addrspacecast i32 addrspace(1)* %157 to i32*
  %159 = load volatile i32, i32* %158, align 4, !tbaa !16
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %156
  %161 = addrspacecast i32 addrspace(1)* %160 to i32*
  store volatile i32 %159, i32* %161, align 4, !tbaa !16
  %162 = add i32 %155, %153
  %163 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_size, i64 0, i64 0) to i32*), align 4, !tbaa !16
  %164 = icmp slt i32 %162, %163
  br i1 %164, label %154, label %165, !llvm.loop !24

165:                                              ; preds = %154, %149, %147
  br i1 %28, label %166, label %168

166:                                              ; preds = %165
  %167 = load volatile i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_size, i64 0, i64 0) to i32*), align 4, !tbaa !16
  store volatile i32 %167, i32* %12, align 4, !tbaa !16
  br label %168

168:                                              ; preds = %166, %165
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
