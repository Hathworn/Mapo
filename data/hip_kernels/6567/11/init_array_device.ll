; ModuleID = '../data/hip_kernels/6567/11/main.cu'
source_filename = "../data/hip_kernels/6567/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10init_arrayPiS_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %5, label %32

5:                                                ; preds = %3
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %18 = and i32 %2, 7
  %19 = icmp ult i32 %2, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %5
  %21 = and i32 %2, -8
  br label %33

22:                                               ; preds = %33, %5
  %23 = phi i32 [ %17, %5 ], [ %51, %33 ]
  %24 = icmp eq i32 %18, 0
  br i1 %24, label %32, label %25

25:                                               ; preds = %22, %25
  %26 = phi i32 [ %29, %25 ], [ %23, %22 ]
  %27 = phi i32 [ %30, %25 ], [ 0, %22 ]
  %28 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %29 = add nsw i32 %26, %28
  store i32 %29, i32 addrspace(1)* %16, align 4, !tbaa !7
  %30 = add i32 %27, 1
  %31 = icmp eq i32 %30, %18
  br i1 %31, label %32, label %25, !llvm.loop !11

32:                                               ; preds = %22, %25, %3
  ret void

33:                                               ; preds = %33, %20
  %34 = phi i32 [ %17, %20 ], [ %51, %33 ]
  %35 = phi i32 [ 0, %20 ], [ %52, %33 ]
  %36 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %37 = add nsw i32 %34, %36
  store i32 %37, i32 addrspace(1)* %16, align 4, !tbaa !7
  %38 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %39 = add nsw i32 %37, %38
  store i32 %39, i32 addrspace(1)* %16, align 4, !tbaa !7
  %40 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %41 = add nsw i32 %39, %40
  store i32 %41, i32 addrspace(1)* %16, align 4, !tbaa !7
  %42 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %43 = add nsw i32 %41, %42
  store i32 %43, i32 addrspace(1)* %16, align 4, !tbaa !7
  %44 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %45 = add nsw i32 %43, %44
  store i32 %45, i32 addrspace(1)* %16, align 4, !tbaa !7
  %46 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %47 = add nsw i32 %45, %46
  store i32 %47, i32 addrspace(1)* %16, align 4, !tbaa !7
  %48 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %49 = add nsw i32 %47, %48
  store i32 %49, i32 addrspace(1)* %16, align 4, !tbaa !7
  %50 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7
  %51 = add nsw i32 %49, %50
  store i32 %51, i32 addrspace(1)* %16, align 4, !tbaa !7
  %52 = add i32 %35, 8
  %53 = icmp eq i32 %52, %21
  br i1 %53, label %22, label %33, !llvm.loop !13
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
