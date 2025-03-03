; ModuleID = '../data/hip_kernels/10483/9/main.cu'
source_filename = "../data/hip_kernels/10483/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19roadCrossingsKerneliiPiS_(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %95

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %16
  store i32 0, i32 addrspace(1)* %17, align 4, !tbaa !7
  %18 = icmp sgt i32 %1, 0
  br i1 %18, label %19, label %95

19:                                               ; preds = %15
  %20 = mul nsw i32 %13, %1
  %21 = and i32 %1, 7
  %22 = icmp ult i32 %1, 8
  br i1 %22, label %79, label %23

23:                                               ; preds = %19
  %24 = and i32 %1, -8
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi i32 [ 0, %23 ], [ %75, %25 ]
  %27 = phi i32 [ 0, %23 ], [ %76, %25 ]
  %28 = phi i32 [ 0, %23 ], [ %77, %25 ]
  %29 = add nsw i32 %27, %20
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %33 = add nsw i32 %26, %32
  store i32 %33, i32 addrspace(1)* %17, align 4, !tbaa !7
  %34 = or i32 %27, 1
  %35 = add nsw i32 %34, %20
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = add nsw i32 %33, %38
  store i32 %39, i32 addrspace(1)* %17, align 4, !tbaa !7
  %40 = or i32 %27, 2
  %41 = add nsw i32 %40, %20
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  %45 = add nsw i32 %39, %44
  store i32 %45, i32 addrspace(1)* %17, align 4, !tbaa !7
  %46 = or i32 %27, 3
  %47 = add nsw i32 %46, %20
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = add nsw i32 %45, %50
  store i32 %51, i32 addrspace(1)* %17, align 4, !tbaa !7
  %52 = or i32 %27, 4
  %53 = add nsw i32 %52, %20
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  %57 = add nsw i32 %51, %56
  store i32 %57, i32 addrspace(1)* %17, align 4, !tbaa !7
  %58 = or i32 %27, 5
  %59 = add nsw i32 %58, %20
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7
  %63 = add nsw i32 %57, %62
  store i32 %63, i32 addrspace(1)* %17, align 4, !tbaa !7
  %64 = or i32 %27, 6
  %65 = add nsw i32 %64, %20
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7
  %69 = add nsw i32 %63, %68
  store i32 %69, i32 addrspace(1)* %17, align 4, !tbaa !7
  %70 = or i32 %27, 7
  %71 = add nsw i32 %70, %20
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7
  %75 = add nsw i32 %69, %74
  store i32 %75, i32 addrspace(1)* %17, align 4, !tbaa !7
  %76 = add nuw nsw i32 %27, 8
  %77 = add i32 %28, 8
  %78 = icmp eq i32 %77, %24
  br i1 %78, label %79, label %25, !llvm.loop !11

79:                                               ; preds = %25, %19
  %80 = phi i32 [ 0, %19 ], [ %75, %25 ]
  %81 = phi i32 [ 0, %19 ], [ %76, %25 ]
  %82 = icmp eq i32 %21, 0
  br i1 %82, label %95, label %83

83:                                               ; preds = %79, %83
  %84 = phi i32 [ %91, %83 ], [ %80, %79 ]
  %85 = phi i32 [ %92, %83 ], [ %81, %79 ]
  %86 = phi i32 [ %93, %83 ], [ 0, %79 ]
  %87 = add nsw i32 %85, %20
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7
  %91 = add nsw i32 %84, %90
  store i32 %91, i32 addrspace(1)* %17, align 4, !tbaa !7
  %92 = add nuw nsw i32 %85, 1
  %93 = add i32 %86, 1
  %94 = icmp eq i32 %93, %21
  br i1 %94, label %95, label %83, !llvm.loop !13

95:                                               ; preds = %79, %83, %15, %4
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
