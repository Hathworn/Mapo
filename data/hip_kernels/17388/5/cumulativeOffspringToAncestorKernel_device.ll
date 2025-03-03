; ModuleID = '../data/hip_kernels/17388/5/main.cu'
source_filename = "../data/hip_kernels/17388/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z35cumulativeOffspringToAncestorKernelPKiPii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sge i32 %12, %2
  %14 = icmp slt i32 %12, 0
  %15 = or i1 %13, %14
  br i1 %15, label %86, label %16

16:                                               ; preds = %3
  %17 = icmp eq i32 %12, 0
  br i1 %17, label %23, label %18

18:                                               ; preds = %16
  %19 = add nsw i32 %12, -1
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %23

23:                                               ; preds = %16, %18
  %24 = phi i32 [ %22, %18 ], [ 0, %16 ]
  %25 = zext i32 %12 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = sub nsw i32 %27, %24
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %86

30:                                               ; preds = %23
  %31 = xor i32 %24, -1
  %32 = add i32 %27, %31
  %33 = and i32 %28, 7
  %34 = icmp ult i32 %32, 7
  br i1 %34, label %74, label %35

35:                                               ; preds = %30
  %36 = and i32 %28, -8
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i32 [ 0, %35 ], [ %71, %37 ]
  %39 = phi i32 [ 0, %35 ], [ %72, %37 ]
  %40 = add nsw i32 %38, %24
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  store i32 %12, i32 addrspace(1)* %42, align 4, !tbaa !7
  %43 = or i32 %38, 1
  %44 = add nsw i32 %43, %24
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %45
  store i32 %12, i32 addrspace(1)* %46, align 4, !tbaa !7
  %47 = or i32 %38, 2
  %48 = add nsw i32 %47, %24
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %49
  store i32 %12, i32 addrspace(1)* %50, align 4, !tbaa !7
  %51 = or i32 %38, 3
  %52 = add nsw i32 %51, %24
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  store i32 %12, i32 addrspace(1)* %54, align 4, !tbaa !7
  %55 = or i32 %38, 4
  %56 = add nsw i32 %55, %24
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %57
  store i32 %12, i32 addrspace(1)* %58, align 4, !tbaa !7
  %59 = or i32 %38, 5
  %60 = add nsw i32 %59, %24
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %61
  store i32 %12, i32 addrspace(1)* %62, align 4, !tbaa !7
  %63 = or i32 %38, 6
  %64 = add nsw i32 %63, %24
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  store i32 %12, i32 addrspace(1)* %66, align 4, !tbaa !7
  %67 = or i32 %38, 7
  %68 = add nsw i32 %67, %24
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  store i32 %12, i32 addrspace(1)* %70, align 4, !tbaa !7
  %71 = add nuw nsw i32 %38, 8
  %72 = add i32 %39, 8
  %73 = icmp eq i32 %72, %36
  br i1 %73, label %74, label %37, !llvm.loop !11

74:                                               ; preds = %37, %30
  %75 = phi i32 [ 0, %30 ], [ %71, %37 ]
  %76 = icmp eq i32 %33, 0
  br i1 %76, label %86, label %77

77:                                               ; preds = %74, %77
  %78 = phi i32 [ %83, %77 ], [ %75, %74 ]
  %79 = phi i32 [ %84, %77 ], [ 0, %74 ]
  %80 = add nsw i32 %78, %24
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %81
  store i32 %12, i32 addrspace(1)* %82, align 4, !tbaa !7
  %83 = add nuw nsw i32 %78, 1
  %84 = add i32 %79, 1
  %85 = icmp eq i32 %84, %33
  br i1 %85, label %86, label %77, !llvm.loop !13

86:                                               ; preds = %74, %77, %23, %3
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
