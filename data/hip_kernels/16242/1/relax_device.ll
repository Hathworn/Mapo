; ModuleID = '../data/hip_kernels/16242/1/main.cu'
source_filename = "../data/hip_kernels/16242/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z5relaxPiS_S_mS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i64 %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
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
  %16 = icmp ult i64 %15, %3
  br i1 %16, label %17, label %46

17:                                               ; preds = %5
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %46, label %21

21:                                               ; preds = %17
  %22 = mul i64 %15, %3
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %15
  br label %24

24:                                               ; preds = %21, %42
  %25 = phi i64 [ 0, %21 ], [ %44, %42 ]
  %26 = trunc i64 %25 to i32
  %27 = add i64 %25, %22
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %30 = icmp eq i32 %29, 0
  %31 = icmp eq i32 %14, %26
  %32 = select i1 %30, i1 true, i1 %31
  br i1 %32, label %42, label %33

33:                                               ; preds = %24
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %42, label %37

37:                                               ; preds = %33
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %25
  %39 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7
  %40 = add nsw i32 %39, %29
  %41 = atomicrmw min i32 addrspace(1)* %38, i32 %40 syncscope("agent-one-as") monotonic, align 4
  br label %42

42:                                               ; preds = %24, %33, %37
  %43 = add nuw nsw i64 %25, 1
  %44 = and i64 %43, 4294967295
  %45 = icmp ult i64 %44, %3
  br i1 %45, label %24, label %46, !llvm.loop !11

46:                                               ; preds = %42, %17, %5
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
