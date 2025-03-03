; ModuleID = '../data/hip_kernels/1040/7/main.cu'
source_filename = "../data/hip_kernels/1040/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20get_vertex_row_groupPiS_iii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp slt i32 %6, %3
  br i1 %7, label %8, label %26

8:                                                ; preds = %5
  %9 = icmp sgt i32 %2, 0
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = and i32 %2, 7
  %16 = icmp ult i32 %2, 8
  %17 = and i32 %2, -8
  %18 = icmp eq i32 %15, 0
  br label %19

19:                                               ; preds = %8, %43
  %20 = phi i32 [ %6, %8 ], [ %44, %43 ]
  br i1 %9, label %21, label %43

21:                                               ; preds = %19
  %22 = mul nsw i32 %20, %4
  %23 = sext i32 %20 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7
  br i1 %16, label %27, label %46

26:                                               ; preds = %43, %5
  ret void

27:                                               ; preds = %46, %21
  %28 = phi i32 [ %25, %21 ], [ %105, %46 ]
  %29 = phi i32 [ 0, %21 ], [ %103, %46 ]
  br i1 %18, label %43, label %30

30:                                               ; preds = %27, %30
  %31 = phi i32 [ %40, %30 ], [ %28, %27 ]
  %32 = phi i32 [ %38, %30 ], [ %29, %27 ]
  %33 = phi i32 [ %41, %30 ], [ 0, %27 ]
  %34 = add nsw i32 %32, %22
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = add nuw nsw i32 %32, 1
  %39 = mul nsw i32 %37, %38
  %40 = add nsw i32 %31, %39
  store i32 %40, i32 addrspace(1)* %24, align 4, !tbaa !7
  %41 = add i32 %33, 1
  %42 = icmp eq i32 %41, %15
  br i1 %42, label %43, label %30, !llvm.loop !11

43:                                               ; preds = %27, %30, %19
  %44 = add i32 %20, %14
  %45 = icmp slt i32 %44, %3
  br i1 %45, label %19, label %26, !llvm.loop !13

46:                                               ; preds = %21, %46
  %47 = phi i32 [ %105, %46 ], [ %25, %21 ]
  %48 = phi i32 [ %103, %46 ], [ 0, %21 ]
  %49 = phi i32 [ %106, %46 ], [ 0, %21 ]
  %50 = add nsw i32 %48, %22
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7
  %54 = or i32 %48, 1
  %55 = mul nsw i32 %53, %54
  %56 = add nsw i32 %47, %55
  store i32 %56, i32 addrspace(1)* %24, align 4, !tbaa !7
  %57 = add nsw i32 %54, %22
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7
  %61 = or i32 %48, 2
  %62 = mul nsw i32 %60, %61
  %63 = add nsw i32 %56, %62
  store i32 %63, i32 addrspace(1)* %24, align 4, !tbaa !7
  %64 = add nsw i32 %61, %22
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7
  %68 = or i32 %48, 3
  %69 = mul nsw i32 %67, %68
  %70 = add nsw i32 %63, %69
  store i32 %70, i32 addrspace(1)* %24, align 4, !tbaa !7
  %71 = add nsw i32 %68, %22
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7
  %75 = or i32 %48, 4
  %76 = mul nsw i32 %74, %75
  %77 = add nsw i32 %70, %76
  store i32 %77, i32 addrspace(1)* %24, align 4, !tbaa !7
  %78 = add nsw i32 %75, %22
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7
  %82 = or i32 %48, 5
  %83 = mul nsw i32 %81, %82
  %84 = add nsw i32 %77, %83
  store i32 %84, i32 addrspace(1)* %24, align 4, !tbaa !7
  %85 = add nsw i32 %82, %22
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7
  %89 = or i32 %48, 6
  %90 = mul nsw i32 %88, %89
  %91 = add nsw i32 %84, %90
  store i32 %91, i32 addrspace(1)* %24, align 4, !tbaa !7
  %92 = add nsw i32 %89, %22
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %96 = or i32 %48, 7
  %97 = mul nsw i32 %95, %96
  %98 = add nsw i32 %91, %97
  store i32 %98, i32 addrspace(1)* %24, align 4, !tbaa !7
  %99 = add nsw i32 %96, %22
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !7
  %103 = add nuw nsw i32 %48, 8
  %104 = mul nsw i32 %102, %103
  %105 = add nsw i32 %98, %104
  store i32 %105, i32 addrspace(1)* %24, align 4, !tbaa !7
  %106 = add i32 %49, 8
  %107 = icmp eq i32 %106, %17
  br i1 %107, label %27, label %46, !llvm.loop !15
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
