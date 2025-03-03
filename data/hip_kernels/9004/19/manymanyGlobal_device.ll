; ModuleID = '../data/hip_kernels/9004/19/main.cu'
source_filename = "../data/hip_kernels/9004/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z14manymanyGlobalPiS_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  br label %5

4:                                                ; preds = %70
  ret void

5:                                                ; preds = %70, %2
  %6 = phi i32 [ 0, %2 ], [ %71, %70 ]
  br label %73

7:                                                ; preds = %73, %7
  %8 = phi i32 [ %12, %7 ], [ %3, %73 ]
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %9
  store i32 0, i32 addrspace(1)* %10, align 4, !tbaa !5
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %9
  store i32 0, i32 addrspace(1)* %11, align 4, !tbaa !5
  %12 = add nuw nsw i32 %8, 512
  %13 = icmp ult i32 %8, 9488
  br i1 %13, label %7, label %14, !llvm.loop !9

14:                                               ; preds = %7, %14
  %15 = phi i32 [ %19, %14 ], [ %3, %7 ]
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  store i32 0, i32 addrspace(1)* %17, align 4, !tbaa !5
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  store i32 0, i32 addrspace(1)* %18, align 4, !tbaa !5
  %19 = add nuw nsw i32 %15, 512
  %20 = icmp ult i32 %15, 9488
  br i1 %20, label %14, label %21, !llvm.loop !9

21:                                               ; preds = %14, %21
  %22 = phi i32 [ %26, %21 ], [ %3, %14 ]
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  store i32 0, i32 addrspace(1)* %24, align 4, !tbaa !5
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  store i32 0, i32 addrspace(1)* %25, align 4, !tbaa !5
  %26 = add nuw nsw i32 %22, 512
  %27 = icmp ult i32 %22, 9488
  br i1 %27, label %21, label %28, !llvm.loop !9

28:                                               ; preds = %21, %28
  %29 = phi i32 [ %33, %28 ], [ %3, %21 ]
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  store i32 0, i32 addrspace(1)* %31, align 4, !tbaa !5
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  store i32 0, i32 addrspace(1)* %32, align 4, !tbaa !5
  %33 = add nuw nsw i32 %29, 512
  %34 = icmp ult i32 %29, 9488
  br i1 %34, label %28, label %35, !llvm.loop !9

35:                                               ; preds = %28, %35
  %36 = phi i32 [ %40, %35 ], [ %3, %28 ]
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  store i32 0, i32 addrspace(1)* %38, align 4, !tbaa !5
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  store i32 0, i32 addrspace(1)* %39, align 4, !tbaa !5
  %40 = add nuw nsw i32 %36, 512
  %41 = icmp ult i32 %36, 9488
  br i1 %41, label %35, label %42, !llvm.loop !9

42:                                               ; preds = %35, %42
  %43 = phi i32 [ %47, %42 ], [ %3, %35 ]
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  store i32 0, i32 addrspace(1)* %45, align 4, !tbaa !5
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  store i32 0, i32 addrspace(1)* %46, align 4, !tbaa !5
  %47 = add nuw nsw i32 %43, 512
  %48 = icmp ult i32 %43, 9488
  br i1 %48, label %42, label %49, !llvm.loop !9

49:                                               ; preds = %42, %49
  %50 = phi i32 [ %54, %49 ], [ %3, %42 ]
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  store i32 0, i32 addrspace(1)* %52, align 4, !tbaa !5
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  store i32 0, i32 addrspace(1)* %53, align 4, !tbaa !5
  %54 = add nuw nsw i32 %50, 512
  %55 = icmp ult i32 %50, 9488
  br i1 %55, label %49, label %56, !llvm.loop !9

56:                                               ; preds = %49, %56
  %57 = phi i32 [ %61, %56 ], [ %3, %49 ]
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %58
  store i32 0, i32 addrspace(1)* %59, align 4, !tbaa !5
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  store i32 0, i32 addrspace(1)* %60, align 4, !tbaa !5
  %61 = add nuw nsw i32 %57, 512
  %62 = icmp ult i32 %57, 9488
  br i1 %62, label %56, label %63, !llvm.loop !9

63:                                               ; preds = %56, %63
  %64 = phi i32 [ %68, %63 ], [ %3, %56 ]
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  store i32 0, i32 addrspace(1)* %66, align 4, !tbaa !5
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  store i32 0, i32 addrspace(1)* %67, align 4, !tbaa !5
  %68 = add nuw nsw i32 %64, 512
  %69 = icmp ult i32 %64, 9488
  br i1 %69, label %63, label %70, !llvm.loop !9

70:                                               ; preds = %63
  %71 = add nuw nsw i32 %6, 10
  %72 = icmp eq i32 %71, 340000
  br i1 %72, label %4, label %5, !llvm.loop !11

73:                                               ; preds = %5, %73
  %74 = phi i32 [ %3, %5 ], [ %78, %73 ]
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  store i32 0, i32 addrspace(1)* %76, align 4, !tbaa !5
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %75
  store i32 0, i32 addrspace(1)* %77, align 4, !tbaa !5
  %78 = add nuw nsw i32 %74, 512
  %79 = icmp ult i32 %74, 9488
  br i1 %79, label %73, label %7, !llvm.loop !9
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
