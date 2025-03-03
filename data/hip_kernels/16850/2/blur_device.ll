; ModuleID = '../data/hip_kernels/16850/2/main.cu'
source_filename = "../data/hip_kernels/16850/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4blurPiS_S_S_S_S_S_iiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = shl i32 %12, 10
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = or i32 %13, %14
  %16 = mul nsw i32 %8, %7
  %17 = icmp sgt i32 %15, %16
  br i1 %17, label %100, label %18

18:                                               ; preds = %11
  %19 = sdiv i32 %15, %8
  %20 = mul nsw i32 %19, %8
  %21 = sub nsw i32 %15, %20
  %22 = add nsw i32 %9, -1
  %23 = sdiv i32 %22, -2
  %24 = add nsw i32 %10, -1
  %25 = sdiv i32 %24, -2
  %26 = icmp sgt i32 %9, 0
  br i1 %26, label %29, label %27

27:                                               ; preds = %18
  %28 = sext i32 %15 to i64
  br label %45

29:                                               ; preds = %18
  %30 = icmp sgt i32 %10, 0
  %31 = sext i32 %15 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %31
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %31
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %31
  br label %35

35:                                               ; preds = %29, %57
  %36 = phi i32 [ 0, %29 ], [ %59, %57 ]
  %37 = phi i32 [ 0, %29 ], [ %58, %57 ]
  br i1 %30, label %38, label %57

38:                                               ; preds = %35
  %39 = add i32 %36, %23
  %40 = add nsw i32 %39, %19
  %41 = mul nsw i32 %40, %8
  %42 = icmp sgt i32 %40, -1
  %43 = icmp slt i32 %40, %7
  %44 = mul nsw i32 %39, %10
  br label %61

45:                                               ; preds = %57, %27
  %46 = phi i64 [ %28, %27 ], [ %31, %57 ]
  %47 = phi i32 [ 0, %27 ], [ %58, %57 ]
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %46
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !5
  %50 = sdiv i32 %49, %47
  store i32 %50, i32 addrspace(1)* %48, align 4, !tbaa !5
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %46
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !5
  %53 = sdiv i32 %52, %47
  store i32 %53, i32 addrspace(1)* %51, align 4, !tbaa !5
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %46
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5
  %56 = sdiv i32 %55, %47
  store i32 %56, i32 addrspace(1)* %54, align 4, !tbaa !5
  br label %100

57:                                               ; preds = %96, %35
  %58 = phi i32 [ %37, %35 ], [ %97, %96 ]
  %59 = add nuw nsw i32 %36, 1
  %60 = icmp eq i32 %59, %9
  br i1 %60, label %45, label %35, !llvm.loop !9

61:                                               ; preds = %38, %96
  %62 = phi i32 [ 0, %38 ], [ %98, %96 ]
  %63 = phi i32 [ %37, %38 ], [ %97, %96 ]
  %64 = add i32 %62, %25
  %65 = add nsw i32 %64, %21
  %66 = add nsw i32 %65, %41
  br i1 %42, label %67, label %96

67:                                               ; preds = %61
  %68 = icmp sgt i32 %65, -1
  %69 = select i1 %43, i1 %68, i1 false
  %70 = icmp slt i32 %65, %8
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %72, label %96

72:                                               ; preds = %67
  %73 = add nsw i32 %64, %44
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !5
  %77 = add nsw i32 %76, %63
  %78 = sext i32 %66 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !5
  %81 = mul nsw i32 %80, %76
  %82 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5
  %83 = add nsw i32 %82, %81
  store i32 %83, i32 addrspace(1)* %32, align 4, !tbaa !5
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5
  %86 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !5
  %87 = mul nsw i32 %86, %85
  %88 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5
  %89 = add nsw i32 %88, %87
  store i32 %89, i32 addrspace(1)* %33, align 4, !tbaa !5
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %78
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !5
  %92 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !5
  %93 = mul nsw i32 %92, %91
  %94 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !5
  %95 = add nsw i32 %94, %93
  store i32 %95, i32 addrspace(1)* %34, align 4, !tbaa !5
  br label %96

96:                                               ; preds = %61, %67, %72
  %97 = phi i32 [ %77, %72 ], [ %63, %67 ], [ %63, %61 ]
  %98 = add nuw nsw i32 %62, 1
  %99 = icmp eq i32 %98, %10
  br i1 %99, label %57, label %61, !llvm.loop !11

100:                                              ; preds = %11, %45
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !10}
