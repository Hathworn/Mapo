; ModuleID = '../data/hip_kernels/4483/7/main.cu'
source_filename = "../data/hip_kernels/4483/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10ac_kernel1PiPjS0_PhS0_miiiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i64 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = lshr i64 %5, 2
  %13 = trunc i64 %12 to i32
  %14 = sdiv i32 %7, %10
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %14, %15
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %14, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = mul i32 %22, %23
  %25 = add i32 %24, %16
  %26 = add nsw i32 %10, -1
  %27 = icmp eq i32 %15, %26
  %28 = add nsw i32 %21, -1
  %29 = icmp eq i32 %23, %28
  %30 = select i1 %27, i1 %29, i1 false
  %31 = add i32 %22, %6
  %32 = add i32 %31, %25
  %33 = select i1 %30, i32 %7, i32 %32
  %34 = add nsw i32 %33, -1
  %35 = icmp slt i32 %25, %34
  %36 = icmp slt i32 %25, %7
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %74

38:                                               ; preds = %11, %64
  %39 = phi i32 [ %70, %64 ], [ %25, %11 ]
  %40 = phi i32 [ %65, %64 ], [ 0, %11 ]
  %41 = sext i32 %39 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !7
  %44 = zext i8 %43 to i32
  %45 = mul nsw i32 %40, %13
  %46 = add nsw i32 %45, -65
  %47 = add i32 %46, %44
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !10
  %51 = icmp eq i32 %50, -1
  br i1 %51, label %52, label %64

52:                                               ; preds = %38, %52
  %53 = phi i32 [ %56, %52 ], [ %40, %38 ]
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !10
  %57 = mul nsw i32 %56, %13
  %58 = add nsw i32 %57, -65
  %59 = add i32 %58, %44
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !10
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %52, label %64, !llvm.loop !12

64:                                               ; preds = %52, %38
  %65 = phi i32 [ %50, %38 ], [ %62, %52 ]
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !10
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %41
  store i32 %68, i32 addrspace(1)* %69, align 4, !tbaa !10
  %70 = add nsw i32 %39, 1
  %71 = icmp slt i32 %70, %34
  %72 = icmp slt i32 %70, %7
  %73 = select i1 %71, i1 %72, i1 false
  br i1 %73, label %38, label %74, !llvm.loop !14

74:                                               ; preds = %64, %11
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
