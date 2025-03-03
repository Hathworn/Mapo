; ModuleID = '../data/hip_kernels/16363/2/main.cu'
source_filename = "../data/hip_kernels/16363/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9reductionPbPii(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %106

14:                                               ; preds = %3
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %16, label %40

16:                                               ; preds = %14
  %17 = mul nsw i32 %12, %2
  %18 = and i32 %2, 7
  %19 = icmp ult i32 %2, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %16
  %21 = and i32 %2, -8
  br label %44

22:                                               ; preds = %44, %16
  %23 = phi i32 [ undef, %16 ], [ %102, %44 ]
  %24 = phi i32 [ 0, %16 ], [ %103, %44 ]
  %25 = phi i32 [ 0, %16 ], [ %102, %44 ]
  %26 = icmp eq i32 %18, 0
  br i1 %26, label %40, label %27

27:                                               ; preds = %22, %27
  %28 = phi i32 [ %37, %27 ], [ %24, %22 ]
  %29 = phi i32 [ %36, %27 ], [ %25, %22 ]
  %30 = phi i32 [ %38, %27 ], [ 0, %22 ]
  %31 = add nsw i32 %28, %17
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %35 = zext i8 %34 to i32
  %36 = add nuw nsw i32 %29, %35
  %37 = add nuw nsw i32 %28, 1
  %38 = add i32 %30, 1
  %39 = icmp eq i32 %38, %18
  br i1 %39, label %40, label %27, !llvm.loop !12

40:                                               ; preds = %22, %27, %14
  %41 = phi i32 [ 0, %14 ], [ %23, %22 ], [ %36, %27 ]
  %42 = sext i32 %12 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  store i32 %41, i32 addrspace(1)* %43, align 4, !tbaa !14
  br label %106

44:                                               ; preds = %44, %20
  %45 = phi i32 [ 0, %20 ], [ %103, %44 ]
  %46 = phi i32 [ 0, %20 ], [ %102, %44 ]
  %47 = phi i32 [ 0, %20 ], [ %104, %44 ]
  %48 = add nsw i32 %45, %17
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %49
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %52 = zext i8 %51 to i32
  %53 = add nuw nsw i32 %46, %52
  %54 = or i32 %45, 1
  %55 = add nsw i32 %54, %17
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %56
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %59 = zext i8 %58 to i32
  %60 = add nuw nsw i32 %53, %59
  %61 = or i32 %45, 2
  %62 = add nsw i32 %61, %17
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %66 = zext i8 %65 to i32
  %67 = add nuw nsw i32 %60, %66
  %68 = or i32 %45, 3
  %69 = add nsw i32 %68, %17
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %73 = zext i8 %72 to i32
  %74 = add nuw nsw i32 %67, %73
  %75 = or i32 %45, 4
  %76 = add nsw i32 %75, %17
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %77
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %80 = zext i8 %79 to i32
  %81 = add nuw nsw i32 %74, %80
  %82 = or i32 %45, 5
  %83 = add nsw i32 %82, %17
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %87 = zext i8 %86 to i32
  %88 = add nuw nsw i32 %81, %87
  %89 = or i32 %45, 6
  %90 = add nsw i32 %89, %17
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %91
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %94 = zext i8 %93 to i32
  %95 = add nuw nsw i32 %88, %94
  %96 = or i32 %45, 7
  %97 = add nsw i32 %96, %17
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %98
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %101 = zext i8 %100 to i32
  %102 = add nuw nsw i32 %95, %101
  %103 = add nuw nsw i32 %45, 8
  %104 = add i32 %47, 8
  %105 = icmp eq i32 %104, %21
  br i1 %105, label %22, label %44, !llvm.loop !16

106:                                              ; preds = %40, %3
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
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !9, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
