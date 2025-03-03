; ModuleID = '../data/hip_kernels/1114/37/main.cu'
source_filename = "../data/hip_kernels/1114/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z7set_binPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %3
  br i1 %16, label %17, label %46

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = atomicrmw max i32 addrspace(1)* %2, i32 %20 syncscope("agent-one-as") monotonic, align 4
  %22 = icmp sgt i32 %20, %4
  br i1 %22, label %29, label %23

23:                                               ; preds = %38, %35, %32, %29, %17
  %24 = phi i64 [ 0, %17 ], [ 1, %29 ], [ 2, %32 ], [ 3, %35 ], [ 4, %38 ]
  %25 = icmp sgt i32 %20, %5
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  %27 = zext i1 %25 to i64
  %28 = getelementptr i32, i32 addrspace(1)* %26, i64 %27
  br label %43

29:                                               ; preds = %17
  %30 = shl i32 %4, 1
  %31 = icmp sgt i32 %20, %30
  br i1 %31, label %32, label %23

32:                                               ; preds = %29
  %33 = shl i32 %4, 2
  %34 = icmp sgt i32 %20, %33
  br i1 %34, label %35, label %23

35:                                               ; preds = %32
  %36 = shl i32 %4, 3
  %37 = icmp sgt i32 %20, %36
  br i1 %37, label %38, label %23

38:                                               ; preds = %35
  %39 = shl i32 %4, 4
  %40 = icmp sgt i32 %20, %39
  br i1 %40, label %41, label %23

41:                                               ; preds = %38
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 6
  br label %43

43:                                               ; preds = %23, %41
  %44 = phi i32 addrspace(1)* [ %42, %41 ], [ %28, %23 ]
  %45 = atomicrmw add i32 addrspace(1)* %44, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %46

46:                                               ; preds = %43, %6
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
