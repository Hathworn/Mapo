; ModuleID = '../data/hip_kernels/17807/1/main.cu'
source_filename = "../data/hip_kernels/17807/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z10device_BFSPKiS0_PiS1_S1_S1_S1_S1_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %59

20:                                               ; preds = %8
  %21 = sext i32 %17 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = add nsw i32 %23, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = bitcast i32 addrspace(1)* %25 to <2 x i32> addrspace(1)*
  %30 = load <2 x i32>, <2 x i32> addrspace(1)* %29, align 4, !tbaa !7
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = extractelement <2 x i32> %30, i64 1
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %59

34:                                               ; preds = %20
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %24
  br label %36

36:                                               ; preds = %34, %55
  %37 = phi i32 [ %31, %34 ], [ %56, %55 ]
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %41
  %43 = atomicrmw xchg i32 addrspace(1)* %42, i32 1 syncscope("agent-one-as") monotonic, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %55

45:                                               ; preds = %36
  %46 = atomicrmw add i32 addrspace(1)* %4, i32 1 syncscope("agent-one-as") monotonic, align 4
  %47 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %48 = sext i32 %46 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %48
  store i32 %47, i32 addrspace(1)* %49, align 4, !tbaa !7
  %50 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %51 = add nsw i32 %50, 1
  %52 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %53
  store i32 %51, i32 addrspace(1)* %54, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %45, %36
  %56 = add nsw i32 %37, 1
  %57 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %58 = icmp slt i32 %56, %57
  br i1 %58, label %36, label %59, !llvm.loop !11

59:                                               ; preds = %55, %20, %8
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
