; ModuleID = '../data/hip_kernels/714/1/main.cu'
source_filename = "../data/hip_kernels/714/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z14d_count_kernelPjPiiS_S_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %6
  br i1 %17, label %18, label %55

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = sdiv i32 %2, 2
  %23 = add nsw i32 %22, -1
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = add i32 %2, 3
  %28 = icmp ult i32 %27, 7
  br i1 %28, label %44, label %29

29:                                               ; preds = %18
  %30 = sdiv i32 %2, 4
  br label %31

31:                                               ; preds = %29, %31
  %32 = phi i32 [ %42, %31 ], [ %26, %29 ]
  %33 = phi i32 [ %39, %31 ], [ %30, %29 ]
  %34 = phi i32 [ %38, %31 ], [ %23, %29 ]
  %35 = icmp ult i32 %21, %32
  %36 = sub nsw i32 0, %33
  %37 = select i1 %35, i32 %36, i32 %33
  %38 = add i32 %37, %34
  %39 = lshr i32 %33, 1
  %40 = zext i32 %38 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = icmp ult i32 %33, 2
  br i1 %43, label %44, label %31, !llvm.loop !11

44:                                               ; preds = %31, %18
  %45 = phi i32 [ %23, %18 ], [ %38, %31 ]
  %46 = phi i32 [ %26, %18 ], [ %42, %31 ]
  %47 = icmp uge i32 %21, %46
  %48 = zext i1 %47 to i32
  %49 = add i32 %45, %48
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %19
  store i32 %49, i32 addrspace(1)* %50, align 4, !tbaa !7
  %51 = zext i32 %49 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = atomicrmw add i32 addrspace(1)* %52, i32 1 syncscope("agent-one-as") monotonic, align 4
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %19
  store i32 %53, i32 addrspace(1)* %54, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %44, %7
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
