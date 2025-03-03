; ModuleID = '../data/hip_kernels/12756/149/main.cu'
source_filename = "../data/hip_kernels/12756/149/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17conflictDetectionPiS_S_iiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %3
  br i1 %16, label %17, label %54

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = add nsw i32 %15, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = icmp slt i32 %22, %26
  br i1 %27, label %28, label %54

28:                                               ; preds = %17
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %18
  br label %30

30:                                               ; preds = %28, %51
  %31 = phi i32 [ %22, %28 ], [ %52, %51 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %35 = add nsw i32 %34, -1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = icmp eq i32 %38, %20
  br i1 %39, label %40, label %51

40:                                               ; preds = %30
  %41 = icmp slt i32 %15, %35
  br i1 %41, label %42, label %45

42:                                               ; preds = %40
  %43 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %51, label %49

45:                                               ; preds = %40
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %36
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7
  %48 = icmp eq i32 %47, 1
  br i1 %48, label %51, label %49

49:                                               ; preds = %45, %42
  %50 = phi i32 addrspace(1)* [ %29, %42 ], [ %46, %45 ]
  store i32 1, i32 addrspace(1)* %50, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %49, %30, %45, %42
  %52 = add nsw i32 %31, 1
  %53 = icmp slt i32 %52, %26
  br i1 %53, label %30, label %54, !llvm.loop !11

54:                                               ; preds = %51, %17, %6
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
