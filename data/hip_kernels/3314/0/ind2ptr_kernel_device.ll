; ModuleID = '../data/hip_kernels/3314/0/main.cu'
source_filename = "../data/hip_kernels/3314/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14ind2ptr_kernelPKlPlll(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture writeonly %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = zext i32 %13 to i64
  %15 = icmp eq i32 %13, 0
  br i1 %15, label %16, label %25

16:                                               ; preds = %4
  %17 = load i64, i64 addrspace(1)* %0, align 8, !tbaa !7
  %18 = icmp slt i64 %17, 0
  br i1 %18, label %54, label %19

19:                                               ; preds = %16, %19
  %20 = phi i64 [ %22, %19 ], [ 0, %16 ]
  %21 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %20
  store i64 0, i64 addrspace(1)* %21, align 8, !tbaa !7
  %22 = add nuw nsw i64 %20, 1
  %23 = load i64, i64 addrspace(1)* %0, align 8, !tbaa !7
  %24 = icmp slt i64 %20, %23
  br i1 %24, label %19, label %54, !llvm.loop !11

25:                                               ; preds = %4
  %26 = icmp slt i64 %14, %3
  br i1 %26, label %27, label %42

27:                                               ; preds = %25
  %28 = add nsw i64 %14, -1
  %29 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %28
  %30 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %14
  %31 = bitcast i64 addrspace(1)* %29 to <2 x i64> addrspace(1)*
  %32 = load <2 x i64>, <2 x i64> addrspace(1)* %31, align 8, !tbaa !7
  %33 = extractelement <2 x i64> %32, i64 0
  %34 = extractelement <2 x i64> %32, i64 1
  %35 = icmp slt i64 %33, %34
  br i1 %35, label %36, label %54

36:                                               ; preds = %27, %36
  %37 = phi i64 [ %38, %36 ], [ %33, %27 ]
  %38 = add nsw i64 %37, 1
  %39 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %38
  store i64 %14, i64 addrspace(1)* %39, align 8, !tbaa !7
  %40 = load i64, i64 addrspace(1)* %30, align 8, !tbaa !7
  %41 = icmp slt i64 %38, %40
  br i1 %41, label %36, label %54, !llvm.loop !13

42:                                               ; preds = %25
  %43 = icmp eq i64 %14, %3
  br i1 %43, label %44, label %54

44:                                               ; preds = %42
  %45 = add nsw i64 %3, -1
  %46 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %45
  %47 = load i64, i64 addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !5
  %48 = icmp slt i64 %47, %2
  br i1 %48, label %49, label %54

49:                                               ; preds = %44, %49
  %50 = phi i64 [ %51, %49 ], [ %47, %44 ]
  %51 = add nsw i64 %50, 1
  %52 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %51
  store i64 %3, i64 addrspace(1)* %52, align 8, !tbaa !7
  %53 = icmp slt i64 %51, %2
  br i1 %53, label %49, label %54, !llvm.loop !14

54:                                               ; preds = %49, %36, %19, %44, %27, %16, %42
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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
