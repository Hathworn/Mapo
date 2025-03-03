; ModuleID = '../data/hip_kernels/16222/1/main.cu'
source_filename = "../data/hip_kernels/16222/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12matrix_countPiS_S_S_E5chunk = internal unnamed_addr addrspace(3) global [32 x [32 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12matrix_countPiS_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = add i32 %11, %10
  %14 = mul nsw i32 %12, %13
  %15 = add nsw i32 %8, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ12matrix_countPiS_S_S_E5chunk, i32 0, i32 %7, i32 %11
  store i32 %18, i32 addrspace(3)* %19, align 4, !tbaa !5
  %20 = add nuw nsw i32 %11, 8
  %21 = add i32 %20, %10
  %22 = mul nsw i32 %12, %21
  %23 = add nsw i32 %8, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ12matrix_countPiS_S_S_E5chunk, i32 0, i32 %7, i32 %20
  store i32 %26, i32 addrspace(3)* %27, align 4, !tbaa !5
  %28 = add nuw nsw i32 %11, 16
  %29 = add i32 %28, %10
  %30 = mul nsw i32 %12, %29
  %31 = add nsw i32 %8, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ12matrix_countPiS_S_S_E5chunk, i32 0, i32 %7, i32 %28
  store i32 %34, i32 addrspace(3)* %35, align 4, !tbaa !5
  %36 = add nuw nsw i32 %11, 24
  %37 = add i32 %36, %10
  %38 = mul nsw i32 %12, %37
  %39 = add nsw i32 %8, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ12matrix_countPiS_S_S_E5chunk, i32 0, i32 %7, i32 %36
  store i32 %42, i32 addrspace(3)* %43, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = add i32 %10, %7
  %45 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %58

47:                                               ; preds = %4
  %48 = add i32 %11, %6
  %49 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !5
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %58

51:                                               ; preds = %47
  %52 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ12matrix_countPiS_S_S_E5chunk, i32 0, i32 %11, i32 %7
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %54 = icmp eq i32 %53, 1
  br i1 %54, label %55, label %58

55:                                               ; preds = %51
  %56 = atomicrmw add i32 addrspace(1)* %1, i32 1 syncscope("agent-one-as") monotonic, align 4
  %57 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %4, %47, %55, %51
  %59 = phi i32 [ %45, %4 ], [ %45, %47 ], [ %57, %55 ], [ %45, %51 ]
  %60 = icmp slt i32 %44, %59
  br i1 %60, label %61, label %72

61:                                               ; preds = %58
  %62 = add i32 %20, %6
  %63 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !5
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %72

65:                                               ; preds = %61
  %66 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ12matrix_countPiS_S_S_E5chunk, i32 0, i32 %20, i32 %7
  %67 = load i32, i32 addrspace(3)* %66, align 4, !tbaa !5
  %68 = icmp eq i32 %67, 1
  br i1 %68, label %69, label %72

69:                                               ; preds = %65
  %70 = atomicrmw add i32 addrspace(1)* %1, i32 1 syncscope("agent-one-as") monotonic, align 4
  %71 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  br label %72

72:                                               ; preds = %69, %65, %61, %58
  %73 = phi i32 [ %71, %69 ], [ %59, %65 ], [ %59, %61 ], [ %59, %58 ]
  %74 = icmp slt i32 %44, %73
  br i1 %74, label %75, label %86

75:                                               ; preds = %72
  %76 = add i32 %28, %6
  %77 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !5
  %78 = icmp slt i32 %76, %77
  br i1 %78, label %79, label %86

79:                                               ; preds = %75
  %80 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ12matrix_countPiS_S_S_E5chunk, i32 0, i32 %28, i32 %7
  %81 = load i32, i32 addrspace(3)* %80, align 4, !tbaa !5
  %82 = icmp eq i32 %81, 1
  br i1 %82, label %83, label %86

83:                                               ; preds = %79
  %84 = atomicrmw add i32 addrspace(1)* %1, i32 1 syncscope("agent-one-as") monotonic, align 4
  %85 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  br label %86

86:                                               ; preds = %83, %79, %75, %72
  %87 = phi i32 [ %85, %83 ], [ %73, %79 ], [ %73, %75 ], [ %73, %72 ]
  %88 = icmp slt i32 %44, %87
  br i1 %88, label %89, label %99

89:                                               ; preds = %86
  %90 = add i32 %36, %6
  %91 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !5
  %92 = icmp slt i32 %90, %91
  br i1 %92, label %93, label %99

93:                                               ; preds = %89
  %94 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ12matrix_countPiS_S_S_E5chunk, i32 0, i32 %36, i32 %7
  %95 = load i32, i32 addrspace(3)* %94, align 4, !tbaa !5
  %96 = icmp eq i32 %95, 1
  br i1 %96, label %97, label %99

97:                                               ; preds = %93
  %98 = atomicrmw add i32 addrspace(1)* %1, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %99

99:                                               ; preds = %97, %93, %89, %86
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!9 = !{}
