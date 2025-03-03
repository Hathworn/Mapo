; ModuleID = '../data/hip_kernels/9255/29/main.cu'
source_filename = "../data/hip_kernels/9255/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@constant_n_test_vertices = protected addrspace(4) externally_initialized global i32 0, align 4
@constant_n_hits = protected addrspace(4) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @constant_n_hits to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @constant_n_test_vertices to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z34kernel_histo_one_thread_one_vertexPjS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = add i32 %10, %3
  %12 = load i32, i32 addrspace(4)* @constant_n_test_vertices, align 4, !tbaa !7
  %13 = load i32, i32 addrspace(4)* @constant_n_hits, align 4, !tbaa !7
  %14 = mul i32 %13, %12
  %15 = mul i32 %11, %13
  %16 = icmp eq i32 %13, 0
  br i1 %16, label %41, label %17

17:                                               ; preds = %2
  %18 = and i32 %13, 7
  %19 = icmp ult i32 %13, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = and i32 %13, -8
  br label %42

22:                                               ; preds = %131, %17
  %23 = phi i32 [ 0, %17 ], [ %132, %131 ]
  %24 = icmp eq i32 %18, 0
  br i1 %24, label %41, label %25

25:                                               ; preds = %22, %37
  %26 = phi i32 [ %38, %37 ], [ %23, %22 ]
  %27 = phi i32 [ %39, %37 ], [ 0, %22 ]
  %28 = add i32 %26, %15
  %29 = icmp ult i32 %28, %14
  br i1 %29, label %30, label %37

30:                                               ; preds = %25
  %31 = zext i32 %28 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %34
  %36 = atomicrmw add i32 addrspace(1)* %35, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %37

37:                                               ; preds = %30, %25
  %38 = add nuw i32 %26, 1
  %39 = add i32 %27, 1
  %40 = icmp eq i32 %39, %18
  br i1 %40, label %41, label %25, !llvm.loop !11

41:                                               ; preds = %22, %37, %2
  ret void

42:                                               ; preds = %131, %20
  %43 = phi i32 [ 0, %20 ], [ %132, %131 ]
  %44 = phi i32 [ 0, %20 ], [ %133, %131 ]
  %45 = add i32 %43, %15
  %46 = icmp ult i32 %45, %14
  br i1 %46, label %47, label %54

47:                                               ; preds = %42
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = atomicrmw add i32 addrspace(1)* %52, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %54

54:                                               ; preds = %42, %47
  %55 = or i32 %43, 1
  %56 = add i32 %55, %15
  %57 = icmp ult i32 %56, %14
  br i1 %57, label %58, label %65

58:                                               ; preds = %54
  %59 = zext i32 %56 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %62
  %64 = atomicrmw add i32 addrspace(1)* %63, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %65

65:                                               ; preds = %58, %54
  %66 = or i32 %43, 2
  %67 = add i32 %66, %15
  %68 = icmp ult i32 %67, %14
  br i1 %68, label %69, label %76

69:                                               ; preds = %65
  %70 = zext i32 %67 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  %75 = atomicrmw add i32 addrspace(1)* %74, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %76

76:                                               ; preds = %69, %65
  %77 = or i32 %43, 3
  %78 = add i32 %77, %15
  %79 = icmp ult i32 %78, %14
  br i1 %79, label %80, label %87

80:                                               ; preds = %76
  %81 = zext i32 %78 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %84
  %86 = atomicrmw add i32 addrspace(1)* %85, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %87

87:                                               ; preds = %80, %76
  %88 = or i32 %43, 4
  %89 = add i32 %88, %15
  %90 = icmp ult i32 %89, %14
  br i1 %90, label %91, label %98

91:                                               ; preds = %87
  %92 = zext i32 %89 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %95
  %97 = atomicrmw add i32 addrspace(1)* %96, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %98

98:                                               ; preds = %91, %87
  %99 = or i32 %43, 5
  %100 = add i32 %99, %15
  %101 = icmp ult i32 %100, %14
  br i1 %101, label %102, label %109

102:                                              ; preds = %98
  %103 = zext i32 %100 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !7
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %106
  %108 = atomicrmw add i32 addrspace(1)* %107, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %109

109:                                              ; preds = %102, %98
  %110 = or i32 %43, 6
  %111 = add i32 %110, %15
  %112 = icmp ult i32 %111, %14
  br i1 %112, label %113, label %120

113:                                              ; preds = %109
  %114 = zext i32 %111 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %117
  %119 = atomicrmw add i32 addrspace(1)* %118, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %120

120:                                              ; preds = %113, %109
  %121 = or i32 %43, 7
  %122 = add i32 %121, %15
  %123 = icmp ult i32 %122, %14
  br i1 %123, label %124, label %131

124:                                              ; preds = %120
  %125 = zext i32 %122 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !7
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %128
  %130 = atomicrmw add i32 addrspace(1)* %129, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %131

131:                                              ; preds = %124, %120
  %132 = add nuw i32 %43, 8
  %133 = add i32 %44, 8
  %134 = icmp eq i32 %133, %21
  br i1 %134, label %22, label %42, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
