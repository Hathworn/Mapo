; ModuleID = '../data/hip_kernels/12526/0/main.cu'
source_filename = "../data/hip_kernels/12526/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16multSquareMatrixPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %3, 0
  br i1 %14, label %15, label %108

15:                                               ; preds = %4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %3
  %25 = add nsw i32 %24, %13
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %26
  %28 = and i32 %3, 3
  %29 = icmp ult i32 %3, 4
  br i1 %29, label %86, label %30

30:                                               ; preds = %15
  %31 = and i32 %3, -4
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi i32 [ 0, %30 ], [ %83, %32 ]
  %34 = phi i32 [ 0, %30 ], [ %82, %32 ]
  %35 = phi i32 [ 0, %30 ], [ %84, %32 ]
  %36 = add nsw i32 %33, %24
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7
  %40 = mul nsw i32 %33, %3
  %41 = add nsw i32 %40, %13
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  %45 = mul nsw i32 %44, %39
  %46 = add nsw i32 %45, %34
  store i32 %46, i32 addrspace(1)* %27, align 4, !tbaa !7
  %47 = or i32 %33, 1
  %48 = add nsw i32 %47, %24
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7
  %52 = mul nsw i32 %47, %3
  %53 = add nsw i32 %52, %13
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  %57 = mul nsw i32 %56, %51
  %58 = add nsw i32 %57, %46
  store i32 %58, i32 addrspace(1)* %27, align 4, !tbaa !7
  %59 = or i32 %33, 2
  %60 = add nsw i32 %59, %24
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %64 = mul nsw i32 %59, %3
  %65 = add nsw i32 %64, %13
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7
  %69 = mul nsw i32 %68, %63
  %70 = add nsw i32 %69, %58
  store i32 %70, i32 addrspace(1)* %27, align 4, !tbaa !7
  %71 = or i32 %33, 3
  %72 = add nsw i32 %71, %24
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7
  %76 = mul nsw i32 %71, %3
  %77 = add nsw i32 %76, %13
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !7
  %81 = mul nsw i32 %80, %75
  %82 = add nsw i32 %81, %70
  store i32 %82, i32 addrspace(1)* %27, align 4, !tbaa !7
  %83 = add nuw nsw i32 %33, 4
  %84 = add i32 %35, 4
  %85 = icmp eq i32 %84, %31
  br i1 %85, label %86, label %32, !llvm.loop !11

86:                                               ; preds = %32, %15
  %87 = phi i32 [ 0, %15 ], [ %83, %32 ]
  %88 = phi i32 [ 0, %15 ], [ %82, %32 ]
  %89 = icmp eq i32 %28, 0
  br i1 %89, label %108, label %90

90:                                               ; preds = %86, %90
  %91 = phi i32 [ %105, %90 ], [ %87, %86 ]
  %92 = phi i32 [ %104, %90 ], [ %88, %86 ]
  %93 = phi i32 [ %106, %90 ], [ 0, %86 ]
  %94 = add nsw i32 %91, %24
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %98 = mul nsw i32 %91, %3
  %99 = add nsw i32 %98, %13
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !7
  %103 = mul nsw i32 %102, %97
  %104 = add nsw i32 %103, %92
  store i32 %104, i32 addrspace(1)* %27, align 4, !tbaa !7
  %105 = add nuw nsw i32 %91, 1
  %106 = add i32 %93, 1
  %107 = icmp eq i32 %106, %28
  br i1 %107, label %108, label %90, !llvm.loop !13

108:                                              ; preds = %86, %90, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
