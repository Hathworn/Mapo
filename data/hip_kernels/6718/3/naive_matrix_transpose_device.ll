; ModuleID = '../data/hip_kernels/6718/3/main.cu'
source_filename = "../data/hip_kernels/6718/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22naive_matrix_transposePfiiS_E4tile = internal unnamed_addr addrspace(3) global [32 x [33 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22naive_matrix_transposePfiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = icmp slt i32 %8, %1
  %13 = freeze i1 %12
  br i1 %13, label %14, label %17

14:                                               ; preds = %4
  %15 = add i32 %11, %10
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %24, label %17

17:                                               ; preds = %14, %24, %34, %44, %54, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = add i32 %10, %7
  %19 = icmp slt i32 %18, %1
  %20 = freeze i1 %19
  br i1 %20, label %21, label %61

21:                                               ; preds = %17
  %22 = add i32 %11, %6
  %23 = icmp slt i32 %22, %2
  br i1 %23, label %62, label %61

24:                                               ; preds = %14
  %25 = mul nsw i32 %15, %1
  %26 = add nsw i32 %25, %8
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ22naive_matrix_transposePfiiS_E4tile, i32 0, i32 %11, i32 %7
  store float %29, float addrspace(3)* %30, align 4, !tbaa !5
  %31 = add nuw nsw i32 %11, 8
  %32 = add i32 %31, %10
  %33 = icmp slt i32 %32, %2
  br i1 %33, label %34, label %17

34:                                               ; preds = %24
  %35 = mul nsw i32 %32, %1
  %36 = add nsw i32 %35, %8
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ22naive_matrix_transposePfiiS_E4tile, i32 0, i32 %31, i32 %7
  store float %39, float addrspace(3)* %40, align 4, !tbaa !5
  %41 = add nuw nsw i32 %11, 16
  %42 = add i32 %41, %10
  %43 = icmp slt i32 %42, %2
  br i1 %43, label %44, label %17

44:                                               ; preds = %34
  %45 = mul nsw i32 %42, %1
  %46 = add nsw i32 %45, %8
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ22naive_matrix_transposePfiiS_E4tile, i32 0, i32 %41, i32 %7
  store float %49, float addrspace(3)* %50, align 4, !tbaa !5
  %51 = add nuw nsw i32 %11, 24
  %52 = add i32 %51, %10
  %53 = icmp slt i32 %52, %2
  br i1 %53, label %54, label %17

54:                                               ; preds = %44
  %55 = mul nsw i32 %52, %1
  %56 = add nsw i32 %55, %8
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ22naive_matrix_transposePfiiS_E4tile, i32 0, i32 %51, i32 %7
  store float %59, float addrspace(3)* %60, align 4, !tbaa !5
  br label %17

61:                                               ; preds = %21, %62, %72, %82, %92, %17
  ret void

62:                                               ; preds = %21
  %63 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ22naive_matrix_transposePfiiS_E4tile, i32 0, i32 %7, i32 %11
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %65 = mul nsw i32 %22, %1
  %66 = add nsw i32 %65, %18
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  store float %64, float addrspace(1)* %68, align 4, !tbaa !5
  %69 = add nuw nsw i32 %11, 8
  %70 = add i32 %69, %6
  %71 = icmp slt i32 %70, %2
  br i1 %71, label %72, label %61

72:                                               ; preds = %62
  %73 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ22naive_matrix_transposePfiiS_E4tile, i32 0, i32 %7, i32 %69
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %75 = mul nsw i32 %70, %1
  %76 = add nsw i32 %75, %18
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  store float %74, float addrspace(1)* %78, align 4, !tbaa !5
  %79 = add nuw nsw i32 %11, 16
  %80 = add i32 %79, %6
  %81 = icmp slt i32 %80, %2
  br i1 %81, label %82, label %61

82:                                               ; preds = %72
  %83 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ22naive_matrix_transposePfiiS_E4tile, i32 0, i32 %7, i32 %79
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %85 = mul nsw i32 %80, %1
  %86 = add nsw i32 %85, %18
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %3, i64 %87
  store float %84, float addrspace(1)* %88, align 4, !tbaa !5
  %89 = add nuw nsw i32 %11, 24
  %90 = add i32 %89, %6
  %91 = icmp slt i32 %90, %2
  br i1 %91, label %92, label %61

92:                                               ; preds = %82
  %93 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ22naive_matrix_transposePfiiS_E4tile, i32 0, i32 %7, i32 %89
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %95 = mul nsw i32 %90, %1
  %96 = add nsw i32 %95, %18
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %3, i64 %97
  store float %94, float addrspace(1)* %98, align 4, !tbaa !5
  br label %61
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
