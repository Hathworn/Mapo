; ModuleID = '../data/hip_kernels/17807/0/main.cu'
source_filename = "../data/hip_kernels/17807/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z11BFS_UNIFIEDiPiS_S_S_S_S_S_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %60

21:                                               ; preds = %9
  %22 = sext i32 %18 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  %27 = add nsw i32 %24, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  %30 = bitcast i32 addrspace(1)* %26 to <2 x i32> addrspace(1)*
  %31 = load <2 x i32>, <2 x i32> addrspace(1)* %30, align 4, !tbaa !7
  %32 = extractelement <2 x i32> %31, i64 0
  %33 = extractelement <2 x i32> %31, i64 1
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %60

35:                                               ; preds = %21
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %25
  br label %37

37:                                               ; preds = %35, %56
  %38 = phi i32 [ %32, %35 ], [ %57, %56 ]
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %42
  %44 = atomicrmw xchg i32 addrspace(1)* %43, i32 1 syncscope("agent-one-as") monotonic, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %56

46:                                               ; preds = %37
  %47 = atomicrmw add i32 addrspace(1)* %5, i32 1 syncscope("agent-one-as") monotonic, align 4
  %48 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %49 = sext i32 %47 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %49
  store i32 %48, i32 addrspace(1)* %50, align 4, !tbaa !7
  %51 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %52 = add nsw i32 %51, 1
  %53 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %54
  store i32 %52, i32 addrspace(1)* %55, align 4, !tbaa !7
  br label %56

56:                                               ; preds = %46, %37
  %57 = add nsw i32 %38, 1
  %58 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %37, label %60, !llvm.loop !11

60:                                               ; preds = %56, %21, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
