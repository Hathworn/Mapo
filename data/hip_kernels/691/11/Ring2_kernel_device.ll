; ModuleID = '../data/hip_kernels/691/11/main.cu'
source_filename = "../data/hip_kernels/691/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12Ring2_kernelPfS_PiS0_S0_iiii(float addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture readnone %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = mul nsw i32 %8, %7
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %61

21:                                               ; preds = %9
  %22 = sext i32 %18 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %61, label %26

26:                                               ; preds = %21
  %27 = shl nsw i32 %18, 1
  %28 = add nuw nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = sext i32 %27 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = sub i32 0, %5
  %36 = icmp slt i32 %5, 0
  br i1 %36, label %61, label %37

37:                                               ; preds = %26, %42
  %38 = phi i32 [ %43, %42 ], [ %35, %26 ]
  %39 = add nsw i32 %38, %34
  %40 = icmp sgt i32 %39, -1
  %41 = icmp slt i32 %39, %8
  br label %45

42:                                               ; preds = %58
  %43 = add i32 %38, 1
  %44 = icmp eq i32 %38, %5
  br i1 %44, label %61, label %37, !llvm.loop !11

45:                                               ; preds = %37, %58
  %46 = phi i32 [ %35, %37 ], [ %59, %58 ]
  %47 = add nsw i32 %46, %31
  br i1 %40, label %48, label %58

48:                                               ; preds = %45
  %49 = icmp sgt i32 %47, -1
  %50 = select i1 %41, i1 %49, i1 false
  %51 = icmp slt i32 %47, %7
  %52 = select i1 %50, i1 %51, i1 false
  br i1 %52, label %53, label %58

53:                                               ; preds = %48
  %54 = mul nsw i32 %47, %8
  %55 = add nsw i32 %54, %39
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %56
  store i32 1, i32 addrspace(1)* %57, align 4, !tbaa !7
  br label %58

58:                                               ; preds = %53, %48, %45
  %59 = add i32 %46, 1
  %60 = icmp eq i32 %46, %5
  br i1 %60, label %42, label %45, !llvm.loop !13

61:                                               ; preds = %42, %26, %21, %9
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
!13 = distinct !{!13, !12}
