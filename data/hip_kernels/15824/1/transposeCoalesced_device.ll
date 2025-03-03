; ModuleID = '../data/hip_kernels/15824/1/main.cu'
source_filename = "../data/hip_kernels/15824/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18transposeCoalescedPfPKfiiE4tile = internal unnamed_addr addrspace(3) global [32 x [33 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18transposeCoalescedPfPKfii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = icmp slt i32 %8, %3
  %13 = add i32 %11, %10
  %14 = icmp slt i32 %13, %2
  %15 = select i1 %14, i1 %12, i1 false
  br i1 %15, label %16, label %23

16:                                               ; preds = %4
  %17 = mul nsw i32 %13, %3
  %18 = add nsw i32 %17, %8
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ18transposeCoalescedPfPKfiiE4tile, i32 0, i32 %11, i32 %7
  store float %21, float addrspace(3)* %22, align 4, !tbaa !5
  br label %23

23:                                               ; preds = %4, %16
  %24 = add nuw nsw i32 %11, 8
  %25 = add i32 %24, %10
  %26 = icmp slt i32 %25, %2
  %27 = select i1 %26, i1 %12, i1 false
  br i1 %27, label %28, label %35

28:                                               ; preds = %23
  %29 = mul nsw i32 %25, %3
  %30 = add nsw i32 %29, %8
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ18transposeCoalescedPfPKfiiE4tile, i32 0, i32 %24, i32 %7
  store float %33, float addrspace(3)* %34, align 4, !tbaa !5
  br label %35

35:                                               ; preds = %28, %23
  %36 = add nuw nsw i32 %11, 16
  %37 = add i32 %36, %10
  %38 = icmp slt i32 %37, %2
  %39 = select i1 %38, i1 %12, i1 false
  br i1 %39, label %40, label %47

40:                                               ; preds = %35
  %41 = mul nsw i32 %37, %3
  %42 = add nsw i32 %41, %8
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ18transposeCoalescedPfPKfiiE4tile, i32 0, i32 %36, i32 %7
  store float %45, float addrspace(3)* %46, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %40, %35
  %48 = add nuw nsw i32 %11, 24
  %49 = add i32 %48, %10
  %50 = icmp slt i32 %49, %2
  %51 = select i1 %50, i1 %12, i1 false
  br i1 %51, label %52, label %59

52:                                               ; preds = %47
  %53 = mul nsw i32 %49, %3
  %54 = add nsw i32 %53, %8
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ18transposeCoalescedPfPKfiiE4tile, i32 0, i32 %48, i32 %7
  store float %57, float addrspace(3)* %58, align 4, !tbaa !5
  br label %59

59:                                               ; preds = %52, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %60 = add i32 %10, %7
  %61 = icmp slt i32 %60, %2
  %62 = add i32 %11, %6
  %63 = icmp slt i32 %62, %3
  %64 = select i1 %63, i1 %61, i1 false
  br i1 %64, label %65, label %72

65:                                               ; preds = %59
  %66 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ18transposeCoalescedPfPKfiiE4tile, i32 0, i32 %7, i32 %11
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %68 = mul nsw i32 %62, %2
  %69 = add nsw i32 %68, %60
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  store float %67, float addrspace(1)* %71, align 4, !tbaa !5
  br label %72

72:                                               ; preds = %59, %65
  %73 = add i32 %24, %6
  %74 = icmp slt i32 %73, %3
  %75 = select i1 %74, i1 %61, i1 false
  br i1 %75, label %76, label %83

76:                                               ; preds = %72
  %77 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ18transposeCoalescedPfPKfiiE4tile, i32 0, i32 %7, i32 %24
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %79 = mul nsw i32 %73, %2
  %80 = add nsw i32 %79, %60
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  store float %78, float addrspace(1)* %82, align 4, !tbaa !5
  br label %83

83:                                               ; preds = %76, %72
  %84 = add i32 %36, %6
  %85 = icmp slt i32 %84, %3
  %86 = select i1 %85, i1 %61, i1 false
  br i1 %86, label %87, label %94

87:                                               ; preds = %83
  %88 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ18transposeCoalescedPfPKfiiE4tile, i32 0, i32 %7, i32 %36
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %90 = mul nsw i32 %84, %2
  %91 = add nsw i32 %90, %60
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  store float %89, float addrspace(1)* %93, align 4, !tbaa !5
  br label %94

94:                                               ; preds = %87, %83
  %95 = add i32 %48, %6
  %96 = icmp slt i32 %95, %3
  %97 = select i1 %96, i1 %61, i1 false
  br i1 %97, label %98, label %105

98:                                               ; preds = %94
  %99 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ18transposeCoalescedPfPKfiiE4tile, i32 0, i32 %7, i32 %48
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !5
  %101 = mul nsw i32 %95, %2
  %102 = add nsw i32 %101, %60
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  store float %100, float addrspace(1)* %104, align 4, !tbaa !5
  br label %105

105:                                              ; preds = %98, %94
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
