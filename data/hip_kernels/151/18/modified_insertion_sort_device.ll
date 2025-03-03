; ModuleID = '../data/hip_kernels/151/18/main.cu'
source_filename = "../data/hip_kernels/151/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23modified_insertion_sortPfiPiiiii(float addrspace(1)* nocapture %0, i32 %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp ult i32 %16, %4
  br i1 %17, label %18, label %72

18:                                               ; preds = %7
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %19
  store i32 0, i32 addrspace(1)* %21, align 4, !tbaa !7
  %22 = icmp sgt i32 %5, 1
  br i1 %22, label %23, label %72

23:                                               ; preds = %18
  %24 = add nsw i32 %6, -1
  %25 = mul nsw i32 %24, %1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %20, i64 %26
  %28 = icmp sgt i32 %6, 1
  br label %29

29:                                               ; preds = %23, %69
  %30 = phi i32 [ 1, %23 ], [ %70, %69 ]
  %31 = mul nsw i32 %30, %1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %20, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !11
  %35 = icmp slt i32 %30, %6
  br i1 %35, label %39, label %36

36:                                               ; preds = %29
  %37 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %38 = fcmp contract ult float %34, %37
  br i1 %38, label %39, label %69

39:                                               ; preds = %36, %29
  %40 = tail call i32 @llvm.smin.i32(i32 %30, i32 %24)
  br i1 %28, label %41, label %61

41:                                               ; preds = %39, %49
  %42 = phi i32 [ %43, %49 ], [ %40, %39 ]
  %43 = add nsw i32 %42, -1
  %44 = mul nsw i32 %43, %1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %20, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !11
  %48 = fcmp contract ogt float %47, %34
  br i1 %48, label %49, label %61

49:                                               ; preds = %41
  %50 = mul nsw i32 %42, %1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %20, i64 %51
  store float %47, float addrspace(1)* %52, align 4, !tbaa !11
  %53 = mul nsw i32 %43, %3
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  %57 = mul nsw i32 %42, %3
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %58
  store i32 %56, i32 addrspace(1)* %59, align 4, !tbaa !7
  %60 = icmp sgt i32 %42, 1
  br i1 %60, label %41, label %61, !llvm.loop !13

61:                                               ; preds = %41, %49, %39
  %62 = phi i32 [ %40, %39 ], [ %42, %41 ], [ %43, %49 ]
  %63 = mul nsw i32 %62, %1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %20, i64 %64
  store float %34, float addrspace(1)* %65, align 4, !tbaa !11
  %66 = mul nsw i32 %62, %3
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %67
  store i32 %30, i32 addrspace(1)* %68, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %36, %61
  %70 = add nuw nsw i32 %30, 1
  %71 = icmp eq i32 %70, %5
  br i1 %71, label %72, label %29, !llvm.loop !15

72:                                               ; preds = %69, %18, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
