; ModuleID = '../data/hip_kernels/879/2/main.cu'
source_filename = "../data/hip_kernels/879/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10multVectorPiS_S_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %4
  br i1 %15, label %16, label %96

16:                                               ; preds = %5
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  store i32 0, i32 addrspace(1)* %18, align 4, !tbaa !7
  %19 = icmp sgt i32 %3, 0
  br i1 %19, label %20, label %96

20:                                               ; preds = %16
  %21 = and i32 %3, 3
  %22 = icmp ult i32 %3, 4
  br i1 %22, label %75, label %23

23:                                               ; preds = %20
  %24 = and i32 %3, -4
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi i32 [ 0, %23 ], [ %71, %25 ]
  %27 = phi i32 [ 0, %23 ], [ %72, %25 ]
  %28 = phi i32 [ 0, %23 ], [ %73, %25 ]
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %32 = mul nsw i32 %27, %4
  %33 = add nsw i32 %32, %14
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %37 = mul nsw i32 %36, %31
  %38 = add nsw i32 %26, %37
  store i32 %38, i32 addrspace(1)* %18, align 4, !tbaa !7
  %39 = or i32 %27, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7
  %43 = mul nsw i32 %39, %4
  %44 = add nsw i32 %43, %14
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7
  %48 = mul nsw i32 %47, %42
  %49 = add nsw i32 %38, %48
  store i32 %49, i32 addrspace(1)* %18, align 4, !tbaa !7
  %50 = or i32 %27, 2
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7
  %54 = mul nsw i32 %50, %4
  %55 = add nsw i32 %54, %14
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  %59 = mul nsw i32 %58, %53
  %60 = add nsw i32 %49, %59
  store i32 %60, i32 addrspace(1)* %18, align 4, !tbaa !7
  %61 = or i32 %27, 3
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7
  %65 = mul nsw i32 %61, %4
  %66 = add nsw i32 %65, %14
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = mul nsw i32 %69, %64
  %71 = add nsw i32 %60, %70
  store i32 %71, i32 addrspace(1)* %18, align 4, !tbaa !7
  %72 = add nuw nsw i32 %27, 4
  %73 = add i32 %28, 4
  %74 = icmp eq i32 %73, %24
  br i1 %74, label %75, label %25, !llvm.loop !11

75:                                               ; preds = %25, %20
  %76 = phi i32 [ 0, %20 ], [ %71, %25 ]
  %77 = phi i32 [ 0, %20 ], [ %72, %25 ]
  %78 = icmp eq i32 %21, 0
  br i1 %78, label %96, label %79

79:                                               ; preds = %75, %79
  %80 = phi i32 [ %92, %79 ], [ %76, %75 ]
  %81 = phi i32 [ %93, %79 ], [ %77, %75 ]
  %82 = phi i32 [ %94, %79 ], [ 0, %75 ]
  %83 = zext i32 %81 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = mul nsw i32 %81, %4
  %87 = add nsw i32 %86, %14
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7
  %91 = mul nsw i32 %90, %85
  %92 = add nsw i32 %80, %91
  store i32 %92, i32 addrspace(1)* %18, align 4, !tbaa !7
  %93 = add nuw nsw i32 %81, 1
  %94 = add i32 %82, 1
  %95 = icmp eq i32 %94, %21
  br i1 %95, label %96, label %79, !llvm.loop !13

96:                                               ; preds = %75, %79, %16, %5
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
