; ModuleID = '../data/hip_kernels/711/6/main.cu'
source_filename = "../data/hip_kernels/711/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14respond_kernelPlPKlS1_S1_l(i64 addrspace(1)* nocapture %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture readonly %3, i64 %4) local_unnamed_addr #0 {
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
  br i1 %16, label %17, label %49

17:                                               ; preds = %5
  %18 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %15
  %19 = load i64, i64 addrspace(1)* %18, align 8, !tbaa !7, !amdgpu.noclobber !5
  %20 = icmp eq i64 %19, -2
  br i1 %20, label %21, label %49

21:                                               ; preds = %17
  %22 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %15
  %23 = bitcast i64 addrspace(1)* %22 to <2 x i64> addrspace(1)*
  %24 = load <2 x i64>, <2 x i64> addrspace(1)* %23, align 8, !tbaa !7
  %25 = extractelement <2 x i64> %24, i64 0
  %26 = extractelement <2 x i64> %24, i64 1
  %27 = icmp slt i64 %25, %26
  br i1 %27, label %28, label %48

28:                                               ; preds = %21, %44
  %29 = phi i64 [ %45, %44 ], [ %25, %21 ]
  %30 = phi i1 [ %36, %44 ], [ false, %21 ]
  %31 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %29
  %32 = load i64, i64 addrspace(1)* %31, align 8, !tbaa !7, !amdgpu.noclobber !5
  %33 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %32
  %34 = load i64, i64 addrspace(1)* %33, align 8, !tbaa !7, !amdgpu.noclobber !5
  %35 = icmp slt i64 %34, 0
  %36 = select i1 %35, i1 true, i1 %30
  %37 = icmp eq i64 %34, -1
  br i1 %37, label %38, label %44

38:                                               ; preds = %28
  %39 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %32
  %40 = load i64, i64 addrspace(1)* %39, align 8, !tbaa !7, !amdgpu.noclobber !5
  %41 = icmp eq i64 %40, %15
  br i1 %41, label %42, label %44

42:                                               ; preds = %38
  %43 = tail call i64 @llvm.smin.i64(i64 %15, i64 %32)
  store i64 %43, i64 addrspace(1)* %18, align 8, !tbaa !7
  store i64 %43, i64 addrspace(1)* %33, align 8, !tbaa !7
  br label %47

44:                                               ; preds = %38, %28
  %45 = add nsw i64 %29, 1
  %46 = icmp slt i64 %45, %26
  br i1 %46, label %28, label %47, !llvm.loop !11

47:                                               ; preds = %44, %42
  br i1 %36, label %49, label %48

48:                                               ; preds = %21, %47
  store i64 %15, i64 addrspace(1)* %18, align 8, !tbaa !7
  br label %49

49:                                               ; preds = %5, %48, %47, %17
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smin.i64(i64, i64) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
