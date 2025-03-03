; ModuleID = '../data/hip_kernels/606/6/main.cu'
source_filename = "../data/hip_kernels/606/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9kernelAddPiiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %12, %2
  %14 = add i32 %13, %11
  %15 = icmp slt i32 %14, %3
  %16 = icmp sgt i32 %1, 0
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %69

18:                                               ; preds = %4
  %19 = sext i32 %14 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7
  %22 = and i32 %1, 7
  %23 = icmp ult i32 %1, 8
  br i1 %23, label %55, label %24

24:                                               ; preds = %18
  %25 = and i32 %1, -8
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi i32 [ %21, %24 ], [ %52, %26 ]
  %28 = phi i32 [ 0, %24 ], [ %53, %26 ]
  %29 = mul nsw i32 %27, %27
  %30 = add nsw i32 %29, %27
  %31 = mul nsw i32 %30, %27
  %32 = mul nsw i32 %31, %31
  %33 = add nsw i32 %32, %31
  %34 = mul nsw i32 %33, %31
  %35 = mul nsw i32 %34, %34
  %36 = add nsw i32 %35, %34
  %37 = mul nsw i32 %36, %34
  %38 = mul nsw i32 %37, %37
  %39 = add nsw i32 %38, %37
  %40 = mul nsw i32 %39, %37
  %41 = mul nsw i32 %40, %40
  %42 = add nsw i32 %41, %40
  %43 = mul nsw i32 %42, %40
  %44 = mul nsw i32 %43, %43
  %45 = add nsw i32 %44, %43
  %46 = mul nsw i32 %45, %43
  %47 = mul nsw i32 %46, %46
  %48 = add nsw i32 %47, %46
  %49 = mul nsw i32 %48, %46
  %50 = mul nsw i32 %49, %49
  %51 = add nsw i32 %50, %49
  %52 = mul nsw i32 %51, %49
  %53 = add i32 %28, 8
  %54 = icmp eq i32 %53, %25
  br i1 %54, label %55, label %26, !llvm.loop !11

55:                                               ; preds = %26, %18
  %56 = phi i32 [ undef, %18 ], [ %52, %26 ]
  %57 = phi i32 [ %21, %18 ], [ %52, %26 ]
  %58 = icmp eq i32 %22, 0
  br i1 %58, label %67, label %59

59:                                               ; preds = %55, %59
  %60 = phi i32 [ %64, %59 ], [ %57, %55 ]
  %61 = phi i32 [ %65, %59 ], [ 0, %55 ]
  %62 = mul nsw i32 %60, %60
  %63 = add nsw i32 %62, %60
  %64 = mul nsw i32 %63, %60
  %65 = add i32 %61, 1
  %66 = icmp eq i32 %65, %22
  br i1 %66, label %67, label %59, !llvm.loop !13

67:                                               ; preds = %59, %55
  %68 = phi i32 [ %56, %55 ], [ %64, %59 ]
  store i32 %68, i32 addrspace(1)* %20, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %67, %4
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
