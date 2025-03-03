; ModuleID = '../data/hip_kernels/219/32/main.cu'
source_filename = "../data/hip_kernels/219/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11segCountSumPiS_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  %14 = icmp sgt i32 %2, 0
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %103

16:                                               ; preds = %3
  %17 = zext i32 %12 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7
  %20 = and i32 %2, 7
  %21 = icmp ult i32 %2, 8
  br i1 %21, label %86, label %22

22:                                               ; preds = %16
  %23 = and i32 %2, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ %19, %22 ], [ %82, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %83, %24 ]
  %27 = phi i32 [ 0, %22 ], [ %84, %24 ]
  %28 = mul nsw i32 %26, %2
  %29 = add i32 %28, %12
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %33 = add nsw i32 %32, %25
  store i32 %33, i32 addrspace(1)* %18, align 4, !tbaa !7
  %34 = or i32 %26, 1
  %35 = mul nsw i32 %34, %2
  %36 = add i32 %35, %12
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7
  %40 = add nsw i32 %39, %33
  store i32 %40, i32 addrspace(1)* %18, align 4, !tbaa !7
  %41 = or i32 %26, 2
  %42 = mul nsw i32 %41, %2
  %43 = add i32 %42, %12
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %47 = add nsw i32 %46, %40
  store i32 %47, i32 addrspace(1)* %18, align 4, !tbaa !7
  %48 = or i32 %26, 3
  %49 = mul nsw i32 %48, %2
  %50 = add i32 %49, %12
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7
  %54 = add nsw i32 %53, %47
  store i32 %54, i32 addrspace(1)* %18, align 4, !tbaa !7
  %55 = or i32 %26, 4
  %56 = mul nsw i32 %55, %2
  %57 = add i32 %56, %12
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7
  %61 = add nsw i32 %60, %54
  store i32 %61, i32 addrspace(1)* %18, align 4, !tbaa !7
  %62 = or i32 %26, 5
  %63 = mul nsw i32 %62, %2
  %64 = add i32 %63, %12
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7
  %68 = add nsw i32 %67, %61
  store i32 %68, i32 addrspace(1)* %18, align 4, !tbaa !7
  %69 = or i32 %26, 6
  %70 = mul nsw i32 %69, %2
  %71 = add i32 %70, %12
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7
  %75 = add nsw i32 %74, %68
  store i32 %75, i32 addrspace(1)* %18, align 4, !tbaa !7
  %76 = or i32 %26, 7
  %77 = mul nsw i32 %76, %2
  %78 = add i32 %77, %12
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7
  %82 = add nsw i32 %81, %75
  store i32 %82, i32 addrspace(1)* %18, align 4, !tbaa !7
  %83 = add nuw nsw i32 %26, 8
  %84 = add i32 %27, 8
  %85 = icmp eq i32 %84, %23
  br i1 %85, label %86, label %24, !llvm.loop !11

86:                                               ; preds = %24, %16
  %87 = phi i32 [ %19, %16 ], [ %82, %24 ]
  %88 = phi i32 [ 0, %16 ], [ %83, %24 ]
  %89 = icmp eq i32 %20, 0
  br i1 %89, label %103, label %90

90:                                               ; preds = %86, %90
  %91 = phi i32 [ %99, %90 ], [ %87, %86 ]
  %92 = phi i32 [ %100, %90 ], [ %88, %86 ]
  %93 = phi i32 [ %101, %90 ], [ 0, %86 ]
  %94 = mul nsw i32 %92, %2
  %95 = add i32 %94, %12
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7
  %99 = add nsw i32 %98, %91
  store i32 %99, i32 addrspace(1)* %18, align 4, !tbaa !7
  %100 = add nuw nsw i32 %92, 1
  %101 = add i32 %93, 1
  %102 = icmp eq i32 %101, %20
  br i1 %102, label %103, label %90, !llvm.loop !13

103:                                              ; preds = %86, %90, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
