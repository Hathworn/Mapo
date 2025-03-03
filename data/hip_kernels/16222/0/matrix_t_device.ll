; ModuleID = '../data/hip_kernels/16222/0/main.cu'
source_filename = "../data/hip_kernels/16222/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8matrix_tPiS_S_S_E5chunk = internal unnamed_addr addrspace(3) global [32 x [32 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8matrix_tPiS_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
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
  %19 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ8matrix_tPiS_S_S_E5chunk, i32 0, i32 %7, i32 %11
  store i32 %18, i32 addrspace(3)* %19, align 4, !tbaa !5
  %20 = add nuw nsw i32 %11, 8
  %21 = add i32 %20, %10
  %22 = mul nsw i32 %12, %21
  %23 = add nsw i32 %8, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ8matrix_tPiS_S_S_E5chunk, i32 0, i32 %7, i32 %20
  store i32 %26, i32 addrspace(3)* %27, align 4, !tbaa !5
  %28 = add nuw nsw i32 %11, 16
  %29 = add i32 %28, %10
  %30 = mul nsw i32 %12, %29
  %31 = add nsw i32 %8, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ8matrix_tPiS_S_S_E5chunk, i32 0, i32 %7, i32 %28
  store i32 %34, i32 addrspace(3)* %35, align 4, !tbaa !5
  %36 = add nuw nsw i32 %11, 24
  %37 = add i32 %36, %10
  %38 = mul nsw i32 %12, %37
  %39 = add nsw i32 %8, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ8matrix_tPiS_S_S_E5chunk, i32 0, i32 %7, i32 %36
  store i32 %42, i32 addrspace(3)* %43, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = add i32 %10, %7
  %45 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %59

47:                                               ; preds = %4
  %48 = add i32 %11, %6
  %49 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !5
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %59

51:                                               ; preds = %47
  %52 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ8matrix_tPiS_S_S_E5chunk, i32 0, i32 %11, i32 %7
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %54 = mul nsw i32 %45, %48
  %55 = add nsw i32 %54, %44
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  store i32 %53, i32 addrspace(1)* %57, align 4, !tbaa !5
  %58 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  br label %59

59:                                               ; preds = %4, %47, %51
  %60 = phi i32 [ %45, %4 ], [ %45, %47 ], [ %58, %51 ]
  %61 = icmp slt i32 %44, %60
  br i1 %61, label %62, label %74

62:                                               ; preds = %59
  %63 = add i32 %20, %6
  %64 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !5
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %74

66:                                               ; preds = %62
  %67 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ8matrix_tPiS_S_S_E5chunk, i32 0, i32 %20, i32 %7
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %69 = mul nsw i32 %60, %63
  %70 = add nsw i32 %69, %44
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  store i32 %68, i32 addrspace(1)* %72, align 4, !tbaa !5
  %73 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  br label %74

74:                                               ; preds = %66, %62, %59
  %75 = phi i32 [ %73, %66 ], [ %60, %62 ], [ %60, %59 ]
  %76 = icmp slt i32 %44, %75
  br i1 %76, label %77, label %89

77:                                               ; preds = %74
  %78 = add i32 %28, %6
  %79 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !5
  %80 = icmp slt i32 %78, %79
  br i1 %80, label %81, label %89

81:                                               ; preds = %77
  %82 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ8matrix_tPiS_S_S_E5chunk, i32 0, i32 %28, i32 %7
  %83 = load i32, i32 addrspace(3)* %82, align 4, !tbaa !5
  %84 = mul nsw i32 %75, %78
  %85 = add nsw i32 %84, %44
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %86
  store i32 %83, i32 addrspace(1)* %87, align 4, !tbaa !5
  %88 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  br label %89

89:                                               ; preds = %81, %77, %74
  %90 = phi i32 [ %88, %81 ], [ %75, %77 ], [ %75, %74 ]
  %91 = icmp slt i32 %44, %90
  br i1 %91, label %92, label %103

92:                                               ; preds = %89
  %93 = add i32 %36, %6
  %94 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !5
  %95 = icmp slt i32 %93, %94
  br i1 %95, label %96, label %103

96:                                               ; preds = %92
  %97 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ8matrix_tPiS_S_S_E5chunk, i32 0, i32 %36, i32 %7
  %98 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !5
  %99 = mul nsw i32 %90, %93
  %100 = add nsw i32 %99, %44
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %101
  store i32 %98, i32 addrspace(1)* %102, align 4, !tbaa !5
  br label %103

103:                                              ; preds = %96, %92, %89
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
