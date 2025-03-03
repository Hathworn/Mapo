; ModuleID = '../data/hip_kernels/11005/4/main.cu'
source_filename = "../data/hip_kernels/11005/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22frame_encode_staircasePiS_iiii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readnone %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = ashr i32 %5, 2
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add nsw i32 %2, -1
  %10 = add i32 %9, %3
  %11 = icmp sgt i32 %10, %2
  br i1 %11, label %12, label %27

12:                                               ; preds = %6
  %13 = icmp slt i32 %8, %7
  %14 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  br label %17

17:                                               ; preds = %12, %41
  %18 = phi i32 [ %2, %12 ], [ %42, %41 ]
  br i1 %13, label %21, label %19

19:                                               ; preds = %17
  %20 = add nsw i32 %18, 1
  br label %41

21:                                               ; preds = %17
  %22 = mul nsw i32 %18, %7
  %23 = add nsw i32 %18, 1
  %24 = mul nsw i32 %23, %7
  %25 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  br label %28

27:                                               ; preds = %41, %6
  ret void

28:                                               ; preds = %21, %28
  %29 = phi i32 [ %8, %21 ], [ %39, %28 ]
  %30 = add nsw i32 %29, %22
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %34 = add nsw i32 %29, %24
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = xor i32 %37, %33
  store i32 %38, i32 addrspace(1)* %36, align 4, !tbaa !7
  %39 = add nuw nsw i32 %29, %26
  %40 = icmp slt i32 %39, %7
  br i1 %40, label %28, label %41, !llvm.loop !11

41:                                               ; preds = %28, %19
  %42 = phi i32 [ %20, %19 ], [ %23, %28 ]
  %43 = icmp eq i32 %42, %10
  br i1 %43, label %27, label %17, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
