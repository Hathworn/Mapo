; ModuleID = '../data/hip_kernels/14408/10/main.cu'
source_filename = "../data/hip_kernels/14408/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6kernelPiS_S_i(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp slt i32 %5, %3
  %7 = icmp sgt i32 %3, 0
  %8 = and i1 %6, %7
  br i1 %8, label %9, label %109

9:                                                ; preds = %4
  %10 = mul nsw i32 %5, %3
  %11 = and i32 %3, 7
  %12 = icmp ult i32 %3, 8
  br i1 %12, label %92, label %13

13:                                               ; preds = %9
  %14 = and i32 %3, -8
  br label %15

15:                                               ; preds = %15, %13
  %16 = phi i32 [ 0, %13 ], [ %89, %15 ]
  %17 = phi i32 [ 0, %13 ], [ %90, %15 ]
  %18 = add nsw i32 %16, %10
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5
  %22 = add nsw i32 %21, 1
  store i32 %22, i32 addrspace(1)* %20, align 4, !tbaa !5
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !5
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  store i32 %24, i32 addrspace(1)* %25, align 4, !tbaa !5
  %26 = or i32 %16, 1
  %27 = add nsw i32 %26, %10
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !5
  %31 = add nsw i32 %30, 1
  store i32 %31, i32 addrspace(1)* %29, align 4, !tbaa !5
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  store i32 %33, i32 addrspace(1)* %34, align 4, !tbaa !5
  %35 = or i32 %16, 2
  %36 = add nsw i32 %35, %10
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !5
  %40 = add nsw i32 %39, 1
  store i32 %40, i32 addrspace(1)* %38, align 4, !tbaa !5
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  store i32 %42, i32 addrspace(1)* %43, align 4, !tbaa !5
  %44 = or i32 %16, 3
  %45 = add nsw i32 %44, %10
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !5
  %49 = add nsw i32 %48, 1
  store i32 %49, i32 addrspace(1)* %47, align 4, !tbaa !5
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !5
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  store i32 %51, i32 addrspace(1)* %52, align 4, !tbaa !5
  %53 = or i32 %16, 4
  %54 = add nsw i32 %53, %10
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !5
  %58 = add nsw i32 %57, 1
  store i32 %58, i32 addrspace(1)* %56, align 4, !tbaa !5
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !5
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  store i32 %60, i32 addrspace(1)* %61, align 4, !tbaa !5
  %62 = or i32 %16, 5
  %63 = add nsw i32 %62, %10
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !5
  %67 = add nsw i32 %66, 1
  store i32 %67, i32 addrspace(1)* %65, align 4, !tbaa !5
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %64
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !5
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %64
  store i32 %69, i32 addrspace(1)* %70, align 4, !tbaa !5
  %71 = or i32 %16, 6
  %72 = add nsw i32 %71, %10
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !5
  %76 = add nsw i32 %75, 1
  store i32 %76, i32 addrspace(1)* %74, align 4, !tbaa !5
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !5
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %73
  store i32 %78, i32 addrspace(1)* %79, align 4, !tbaa !5
  %80 = or i32 %16, 7
  %81 = add nsw i32 %80, %10
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !5
  %85 = add nsw i32 %84, 1
  store i32 %85, i32 addrspace(1)* %83, align 4, !tbaa !5
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !5
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %82
  store i32 %87, i32 addrspace(1)* %88, align 4, !tbaa !5
  %89 = add nuw nsw i32 %16, 8
  %90 = add i32 %17, 8
  %91 = icmp eq i32 %90, %14
  br i1 %91, label %92, label %15, !llvm.loop !9

92:                                               ; preds = %15, %9
  %93 = phi i32 [ 0, %9 ], [ %89, %15 ]
  %94 = icmp eq i32 %11, 0
  br i1 %94, label %109, label %95

95:                                               ; preds = %92, %95
  %96 = phi i32 [ %106, %95 ], [ %93, %92 ]
  %97 = phi i32 [ %107, %95 ], [ 0, %92 ]
  %98 = add nsw i32 %96, %10
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !5
  %102 = add nsw i32 %101, 1
  store i32 %102, i32 addrspace(1)* %100, align 4, !tbaa !5
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %99
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !5
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  store i32 %104, i32 addrspace(1)* %105, align 4, !tbaa !5
  %106 = add nuw nsw i32 %96, 1
  %107 = add i32 %97, 1
  %108 = icmp eq i32 %107, %11
  br i1 %108, label %109, label %95, !llvm.loop !11

109:                                              ; preds = %92, %95, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
