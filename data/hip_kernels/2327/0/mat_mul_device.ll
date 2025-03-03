; ModuleID = '../data/hip_kernels/2327/0/main.cu'
source_filename = "../data/hip_kernels/2327/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7mat_mulPiS_S_iiiiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = add i32 %17, %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = add i32 %25, %19
  %27 = icmp slt i32 %18, %7
  %28 = icmp slt i32 %26, %8
  %29 = select i1 %27, i1 %28, i1 false
  %30 = icmp sgt i32 %4, 0
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %119

32:                                               ; preds = %9
  %33 = mul nsw i32 %18, %4
  %34 = mul nsw i32 %18, %8
  %35 = add nsw i32 %34, %26
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = and i32 %4, 3
  %40 = icmp ult i32 %4, 4
  br i1 %40, label %97, label %41

41:                                               ; preds = %32
  %42 = and i32 %4, -4
  br label %43

43:                                               ; preds = %43, %41
  %44 = phi i32 [ %38, %41 ], [ %93, %43 ]
  %45 = phi i32 [ 0, %41 ], [ %94, %43 ]
  %46 = phi i32 [ 0, %41 ], [ %95, %43 ]
  %47 = add nsw i32 %45, %33
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = mul nsw i32 %45, %6
  %52 = add nsw i32 %51, %26
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = mul nsw i32 %55, %50
  %57 = add nsw i32 %44, %56
  store i32 %57, i32 addrspace(1)* %37, align 4, !tbaa !7
  %58 = or i32 %45, 1
  %59 = add nsw i32 %58, %33
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7
  %63 = mul nsw i32 %58, %6
  %64 = add nsw i32 %63, %26
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7
  %68 = mul nsw i32 %67, %62
  %69 = add nsw i32 %57, %68
  store i32 %69, i32 addrspace(1)* %37, align 4, !tbaa !7
  %70 = or i32 %45, 2
  %71 = add nsw i32 %70, %33
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7
  %75 = mul nsw i32 %70, %6
  %76 = add nsw i32 %75, %26
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7
  %80 = mul nsw i32 %79, %74
  %81 = add nsw i32 %69, %80
  store i32 %81, i32 addrspace(1)* %37, align 4, !tbaa !7
  %82 = or i32 %45, 3
  %83 = add nsw i32 %82, %33
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !7
  %87 = mul nsw i32 %82, %6
  %88 = add nsw i32 %87, %26
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !7
  %92 = mul nsw i32 %91, %86
  %93 = add nsw i32 %81, %92
  store i32 %93, i32 addrspace(1)* %37, align 4, !tbaa !7
  %94 = add nuw nsw i32 %45, 4
  %95 = add i32 %46, 4
  %96 = icmp eq i32 %95, %42
  br i1 %96, label %97, label %43, !llvm.loop !11

97:                                               ; preds = %43, %32
  %98 = phi i32 [ %38, %32 ], [ %93, %43 ]
  %99 = phi i32 [ 0, %32 ], [ %94, %43 ]
  %100 = icmp eq i32 %39, 0
  br i1 %100, label %119, label %101

101:                                              ; preds = %97, %101
  %102 = phi i32 [ %115, %101 ], [ %98, %97 ]
  %103 = phi i32 [ %116, %101 ], [ %99, %97 ]
  %104 = phi i32 [ %117, %101 ], [ 0, %97 ]
  %105 = add nsw i32 %103, %33
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !7
  %109 = mul nsw i32 %103, %6
  %110 = add nsw i32 %109, %26
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7
  %114 = mul nsw i32 %113, %108
  %115 = add nsw i32 %102, %114
  store i32 %115, i32 addrspace(1)* %37, align 4, !tbaa !7
  %116 = add nuw nsw i32 %103, 1
  %117 = add i32 %104, 1
  %118 = icmp eq i32 %117, %39
  br i1 %118, label %119, label %101, !llvm.loop !13

119:                                              ; preds = %97, %101, %9
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
