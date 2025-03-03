; ModuleID = '../data/hip_kernels/17563/0/main.cu'
source_filename = "../data/hip_kernels/17563/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9matrixMulPiS_S_iiiiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp eq i32 %4, %5
  br i1 %27, label %28, label %121

28:                                               ; preds = %9
  %29 = icmp slt i32 %18, %3
  %30 = icmp slt i32 %26, %6
  %31 = select i1 %29, i1 %30, i1 false
  %32 = icmp sgt i32 %4, 0
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %121

34:                                               ; preds = %28
  %35 = mul nsw i32 %18, %4
  %36 = mul nsw i32 %18, %8
  %37 = add nsw i32 %36, %26
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %41 = and i32 %4, 3
  %42 = icmp ult i32 %4, 4
  br i1 %42, label %99, label %43

43:                                               ; preds = %34
  %44 = and i32 %4, -4
  br label %45

45:                                               ; preds = %45, %43
  %46 = phi i32 [ %40, %43 ], [ %95, %45 ]
  %47 = phi i32 [ 0, %43 ], [ %96, %45 ]
  %48 = phi i32 [ 0, %43 ], [ %97, %45 ]
  %49 = add nsw i32 %47, %35
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7
  %53 = mul nsw i32 %47, %6
  %54 = add nsw i32 %53, %26
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7
  %58 = mul nsw i32 %57, %52
  %59 = add nsw i32 %46, %58
  store i32 %59, i32 addrspace(1)* %39, align 4, !tbaa !7
  %60 = or i32 %47, 1
  %61 = add nsw i32 %60, %35
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7
  %65 = mul nsw i32 %60, %6
  %66 = add nsw i32 %65, %26
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = mul nsw i32 %69, %64
  %71 = add nsw i32 %59, %70
  store i32 %71, i32 addrspace(1)* %39, align 4, !tbaa !7
  %72 = or i32 %47, 2
  %73 = add nsw i32 %72, %35
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7
  %77 = mul nsw i32 %72, %6
  %78 = add nsw i32 %77, %26
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7
  %82 = mul nsw i32 %81, %76
  %83 = add nsw i32 %71, %82
  store i32 %83, i32 addrspace(1)* %39, align 4, !tbaa !7
  %84 = or i32 %47, 3
  %85 = add nsw i32 %84, %35
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7
  %89 = mul nsw i32 %84, %6
  %90 = add nsw i32 %89, %26
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7
  %94 = mul nsw i32 %93, %88
  %95 = add nsw i32 %83, %94
  store i32 %95, i32 addrspace(1)* %39, align 4, !tbaa !7
  %96 = add nuw nsw i32 %47, 4
  %97 = add i32 %48, 4
  %98 = icmp eq i32 %97, %44
  br i1 %98, label %99, label %45, !llvm.loop !11

99:                                               ; preds = %45, %34
  %100 = phi i32 [ %40, %34 ], [ %95, %45 ]
  %101 = phi i32 [ 0, %34 ], [ %96, %45 ]
  %102 = icmp eq i32 %41, 0
  br i1 %102, label %121, label %103

103:                                              ; preds = %99, %103
  %104 = phi i32 [ %117, %103 ], [ %100, %99 ]
  %105 = phi i32 [ %118, %103 ], [ %101, %99 ]
  %106 = phi i32 [ %119, %103 ], [ 0, %99 ]
  %107 = add nsw i32 %105, %35
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %108
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !7
  %111 = mul nsw i32 %105, %6
  %112 = add nsw i32 %111, %26
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !7
  %116 = mul nsw i32 %115, %110
  %117 = add nsw i32 %104, %116
  store i32 %117, i32 addrspace(1)* %39, align 4, !tbaa !7
  %118 = add nuw nsw i32 %105, 1
  %119 = add i32 %106, 1
  %120 = icmp eq i32 %119, %41
  br i1 %120, label %121, label %103, !llvm.loop !13

121:                                              ; preds = %99, %103, %28, %9
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
