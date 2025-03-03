; ModuleID = '../data/hip_kernels/711/4/main.cu'
source_filename = "../data/hip_kernels/711/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14propose_kernelPlS_PKlS1_l(i64 addrspace(1)* nocapture %0, i64 addrspace(1)* nocapture writeonly %1, i64 addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture readonly %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = icmp slt i64 %15, %4
  br i1 %16, label %17, label %45

17:                                               ; preds = %5
  %18 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %15
  %19 = load i64, i64 addrspace(1)* %18, align 8, !tbaa !7, !amdgpu.noclobber !5
  %20 = icmp eq i64 %19, -1
  br i1 %20, label %21, label %45

21:                                               ; preds = %17
  %22 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %15
  %23 = bitcast i64 addrspace(1)* %22 to <2 x i64> addrspace(1)*
  %24 = load <2 x i64>, <2 x i64> addrspace(1)* %23, align 8, !tbaa !7
  %25 = extractelement <2 x i64> %24, i64 0
  %26 = extractelement <2 x i64> %24, i64 1
  %27 = icmp slt i64 %25, %26
  br i1 %27, label %30, label %44

28:                                               ; preds = %30
  %29 = icmp slt i64 %40, %26
  br i1 %29, label %30, label %43, !llvm.loop !11

30:                                               ; preds = %21, %28
  %31 = phi i64 [ %40, %28 ], [ %25, %21 ]
  %32 = phi i1 [ %38, %28 ], [ false, %21 ]
  %33 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %31
  %34 = load i64, i64 addrspace(1)* %33, align 8, !tbaa !7, !amdgpu.noclobber !5
  %35 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %34
  %36 = load i64, i64 addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = icmp slt i64 %36, 0
  %38 = select i1 %37, i1 true, i1 %32
  %39 = icmp eq i64 %36, -2
  %40 = add nsw i64 %31, 1
  br i1 %39, label %41, label %28

41:                                               ; preds = %30
  %42 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %15
  store i64 %34, i64 addrspace(1)* %42, align 8, !tbaa !7
  br label %43

43:                                               ; preds = %28, %41
  br i1 %38, label %45, label %44

44:                                               ; preds = %21, %43
  store i64 %15, i64 addrspace(1)* %18, align 8, !tbaa !7
  br label %45

45:                                               ; preds = %5, %44, %43, %17
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
