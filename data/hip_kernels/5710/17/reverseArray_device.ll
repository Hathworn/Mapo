; ModuleID = '../data/hip_kernels/5710/17/main.cu'
source_filename = "../data/hip_kernels/5710/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12reverseArrayPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = mul nuw nsw i32 %3, 1314
  %5 = add nuw nsw i32 %4, 1314
  %6 = lshr i32 %5, 8
  %7 = lshr i32 %4, 8
  %8 = add nuw nsw i32 %6, 7
  %9 = add nsw i32 %6, -2
  %10 = and i32 %8, 7
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %25, label %12

12:                                               ; preds = %2, %12
  %13 = phi i32 [ %16, %12 ], [ %6, %2 ]
  %14 = phi i32 [ %22, %12 ], [ %7, %2 ]
  %15 = phi i32 [ %23, %12 ], [ 0, %2 ]
  %16 = add nsw i32 %13, -1
  %17 = zext i32 %14 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5
  %20 = zext i32 %16 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %20
  store i32 %19, i32 addrspace(1)* %21, align 4, !tbaa !5
  %22 = add nuw nsw i32 %14, 1
  %23 = add i32 %15, 1
  %24 = icmp eq i32 %23, %10
  br i1 %24, label %25, label %12, !llvm.loop !9

25:                                               ; preds = %12, %2
  %26 = phi i32 [ %6, %2 ], [ %16, %12 ]
  %27 = phi i32 [ %7, %2 ], [ %22, %12 ]
  %28 = icmp ult i32 %9, 7
  br i1 %28, label %89, label %29

29:                                               ; preds = %25, %29
  %30 = phi i32 [ %81, %29 ], [ %26, %25 ]
  %31 = phi i32 [ %87, %29 ], [ %27, %25 ]
  %32 = add nsw i32 %30, -1
  %33 = zext i32 %31 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !5
  %36 = zext i32 %32 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  store i32 %35, i32 addrspace(1)* %37, align 4, !tbaa !5
  %38 = add nuw nsw i32 %31, 1
  %39 = add nsw i32 %30, -2
  %40 = zext i32 %38 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %43 = zext i32 %39 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  store i32 %42, i32 addrspace(1)* %44, align 4, !tbaa !5
  %45 = add nuw nsw i32 %31, 2
  %46 = add nsw i32 %30, -3
  %47 = zext i32 %45 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !5
  %50 = zext i32 %46 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  store i32 %49, i32 addrspace(1)* %51, align 4, !tbaa !5
  %52 = add nuw nsw i32 %31, 3
  %53 = add nsw i32 %30, -4
  %54 = zext i32 %52 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !5
  %57 = zext i32 %53 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %57
  store i32 %56, i32 addrspace(1)* %58, align 4, !tbaa !5
  %59 = add nuw nsw i32 %31, 4
  %60 = add nsw i32 %30, -5
  %61 = zext i32 %59 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  %64 = zext i32 %60 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %64
  store i32 %63, i32 addrspace(1)* %65, align 4, !tbaa !5
  %66 = add nuw nsw i32 %31, 5
  %67 = add nsw i32 %30, -6
  %68 = zext i32 %66 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !5
  %71 = zext i32 %67 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  store i32 %70, i32 addrspace(1)* %72, align 4, !tbaa !5
  %73 = add nuw nsw i32 %31, 6
  %74 = add nsw i32 %30, -7
  %75 = zext i32 %73 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !5
  %78 = zext i32 %74 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  store i32 %77, i32 addrspace(1)* %79, align 4, !tbaa !5
  %80 = add nuw nsw i32 %31, 7
  %81 = add nsw i32 %30, -8
  %82 = zext i32 %80 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !5
  %85 = zext i32 %81 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %85
  store i32 %84, i32 addrspace(1)* %86, align 4, !tbaa !5
  %87 = add nuw nsw i32 %31, 8
  %88 = icmp ugt i32 %74, 2
  br i1 %88, label %29, label %89, !llvm.loop !11

89:                                               ; preds = %29, %25
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
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
