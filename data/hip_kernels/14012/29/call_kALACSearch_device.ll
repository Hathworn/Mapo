; ModuleID = '../data/hip_kernels/14012/29/main.cu'
source_filename = "../data/hip_kernels/14012/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z16call_kALACSearchPsS_i(i16 addrspace(1)* nocapture writeonly %0, i16 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = shl nsw i32 %4, 8
  %7 = shl nuw nsw i32 %5, 4
  %8 = add nsw i32 %6, %7
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %9
  %11 = bitcast i16 addrspace(1)* %10 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 1216, i16 -928>, <2 x i16> addrspace(1)* %11, align 2, !tbaa !5
  %12 = or i32 %8, 2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %13
  store i16 -64, i16 addrspace(1)* %14, align 2, !tbaa !5
  %15 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %9
  %16 = bitcast i16 addrspace(1)* %15 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 1216, i16 -928>, <2 x i16> addrspace(1)* %16, align 2, !tbaa !5
  %17 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %13
  store i16 -64, i16 addrspace(1)* %17, align 2, !tbaa !5
  %18 = icmp sgt i32 %2, 3
  br i1 %18, label %19, label %84

19:                                               ; preds = %3
  %20 = add i32 %2, -3
  %21 = add i32 %2, -4
  %22 = and i32 %20, 7
  %23 = icmp ult i32 %21, 7
  br i1 %23, label %71, label %24

24:                                               ; preds = %19
  %25 = and i32 %20, -8
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi i32 [ 3, %24 ], [ %68, %26 ]
  %28 = phi i32 [ 0, %24 ], [ %69, %26 ]
  %29 = add nsw i32 %27, %8
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %30
  store i16 0, i16 addrspace(1)* %31, align 2, !tbaa !5
  %32 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %30
  store i16 0, i16 addrspace(1)* %32, align 2, !tbaa !5
  %33 = add nuw nsw i32 %27, 1
  %34 = add nsw i32 %33, %8
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %35
  store i16 0, i16 addrspace(1)* %36, align 2, !tbaa !5
  %37 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %35
  store i16 0, i16 addrspace(1)* %37, align 2, !tbaa !5
  %38 = add nuw nsw i32 %27, 2
  %39 = add nsw i32 %38, %8
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %40
  store i16 0, i16 addrspace(1)* %41, align 2, !tbaa !5
  %42 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %40
  store i16 0, i16 addrspace(1)* %42, align 2, !tbaa !5
  %43 = add nuw nsw i32 %27, 3
  %44 = add nsw i32 %43, %8
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %45
  store i16 0, i16 addrspace(1)* %46, align 2, !tbaa !5
  %47 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %45
  store i16 0, i16 addrspace(1)* %47, align 2, !tbaa !5
  %48 = add nuw nsw i32 %27, 4
  %49 = add nsw i32 %48, %8
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %50
  store i16 0, i16 addrspace(1)* %51, align 2, !tbaa !5
  %52 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %50
  store i16 0, i16 addrspace(1)* %52, align 2, !tbaa !5
  %53 = add nuw nsw i32 %27, 5
  %54 = add nsw i32 %53, %8
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %55
  store i16 0, i16 addrspace(1)* %56, align 2, !tbaa !5
  %57 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %55
  store i16 0, i16 addrspace(1)* %57, align 2, !tbaa !5
  %58 = add nuw nsw i32 %27, 6
  %59 = add nsw i32 %58, %8
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %60
  store i16 0, i16 addrspace(1)* %61, align 2, !tbaa !5
  %62 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %60
  store i16 0, i16 addrspace(1)* %62, align 2, !tbaa !5
  %63 = add nuw nsw i32 %27, 7
  %64 = add nsw i32 %63, %8
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %65
  store i16 0, i16 addrspace(1)* %66, align 2, !tbaa !5
  %67 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %65
  store i16 0, i16 addrspace(1)* %67, align 2, !tbaa !5
  %68 = add nuw nsw i32 %27, 8
  %69 = add i32 %28, 8
  %70 = icmp eq i32 %69, %25
  br i1 %70, label %71, label %26, !llvm.loop !9

71:                                               ; preds = %26, %19
  %72 = phi i32 [ 3, %19 ], [ %68, %26 ]
  %73 = icmp eq i32 %22, 0
  br i1 %73, label %84, label %74

74:                                               ; preds = %71, %74
  %75 = phi i32 [ %81, %74 ], [ %72, %71 ]
  %76 = phi i32 [ %82, %74 ], [ 0, %71 ]
  %77 = add nsw i32 %75, %8
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %78
  store i16 0, i16 addrspace(1)* %79, align 2, !tbaa !5
  %80 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %78
  store i16 0, i16 addrspace(1)* %80, align 2, !tbaa !5
  %81 = add nuw nsw i32 %75, 1
  %82 = add i32 %76, 1
  %83 = icmp eq i32 %82, %22
  br i1 %83, label %84, label %74, !llvm.loop !11

84:                                               ; preds = %71, %74, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
