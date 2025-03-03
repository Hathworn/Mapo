; ModuleID = '../data/hip_kernels/4483/0/main.cu'
source_filename = "../data/hip_kernels/4483/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20global_memory_kernelPiPjS0_PhS0_miiiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4, i64 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = lshr i64 %5, 2
  %20 = trunc i64 %19 to i32
  %21 = sdiv i32 %7, %10
  %22 = mul i32 %21, %12
  %23 = udiv i32 %21, %17
  %24 = mul i32 %23, %18
  %25 = add i32 %24, %22
  %26 = add nsw i32 %10, -1
  %27 = icmp eq i32 %12, %26
  %28 = add nsw i32 %17, -1
  %29 = icmp eq i32 %18, %28
  %30 = select i1 %27, i1 %29, i1 false
  %31 = add i32 %23, %6
  %32 = add i32 %31, %25
  %33 = select i1 %30, i32 %7, i32 %32
  %34 = add nsw i32 %33, -1
  %35 = icmp slt i32 %25, %34
  %36 = icmp slt i32 %25, %7
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %80

38:                                               ; preds = %11
  %39 = mul i32 %12, %17
  %40 = add i32 %39, %18
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %41
  br label %43

43:                                               ; preds = %38, %69
  %44 = phi i32 [ %25, %38 ], [ %76, %69 ]
  %45 = phi i32 [ 0, %38 ], [ %70, %69 ]
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7
  %49 = zext i8 %48 to i32
  %50 = mul nsw i32 %45, %20
  %51 = add nsw i32 %50, -65
  %52 = add i32 %51, %49
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !10
  %56 = icmp eq i32 %55, -1
  br i1 %56, label %57, label %69

57:                                               ; preds = %43, %57
  %58 = phi i32 [ %61, %57 ], [ %45, %43 ]
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !10
  %62 = mul nsw i32 %61, %20
  %63 = add nsw i32 %62, -65
  %64 = add i32 %63, %49
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !10
  %68 = icmp eq i32 %67, -1
  br i1 %68, label %57, label %69, !llvm.loop !12

69:                                               ; preds = %57, %43
  %70 = phi i32 [ %55, %43 ], [ %67, %57 ]
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !10
  %74 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !10
  %75 = add i32 %74, %73
  store i32 %75, i32 addrspace(1)* %42, align 4, !tbaa !10
  %76 = add nsw i32 %44, 1
  %77 = icmp slt i32 %76, %34
  %78 = icmp slt i32 %76, %7
  %79 = select i1 %77, i1 %78, i1 false
  br i1 %79, label %43, label %80, !llvm.loop !14

80:                                               ; preds = %69, %11
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
