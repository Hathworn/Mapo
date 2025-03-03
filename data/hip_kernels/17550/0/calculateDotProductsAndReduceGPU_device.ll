; ModuleID = '../data/hip_kernels/17550/0/main.cu'
source_filename = "../data/hip_kernels/17550/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z32calculateDotProductsAndReduceGPUPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %5
  store i32 0, i32 addrspace(3)* %14, align 4, !tbaa !7
  %15 = add nuw nsw i32 %5, %10
  %16 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %15
  store i32 0, i32 addrspace(3)* %16, align 4, !tbaa !7
  %17 = shl nuw nsw i32 %10, 1
  %18 = add nuw nsw i32 %17, %5
  %19 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %18
  store i32 0, i32 addrspace(3)* %19, align 4, !tbaa !7
  %20 = icmp slt i32 %13, %3
  br i1 %20, label %21, label %53

21:                                               ; preds = %4
  %22 = sext i32 %13 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = mul nsw i32 %26, %24
  store i32 %27, i32 addrspace(3)* %14, align 4, !tbaa !7
  %28 = mul nsw i32 %24, %24
  store i32 %28, i32 addrspace(3)* %16, align 4, !tbaa !7
  %29 = mul nsw i32 %26, %26
  store i32 %29, i32 addrspace(3)* %19, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp ult i16 %9, 2
  br i1 %30, label %53, label %31

31:                                               ; preds = %21, %51
  %32 = phi i32 [ %33, %51 ], [ %10, %21 ]
  %33 = lshr i32 %32, 1
  %34 = icmp ult i32 %5, %33
  br i1 %34, label %35, label %51

35:                                               ; preds = %31
  %36 = add nuw nsw i32 %33, %5
  %37 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %36
  %38 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !7
  %39 = load i32, i32 addrspace(3)* %14, align 4, !tbaa !7
  %40 = add nsw i32 %39, %38
  store i32 %40, i32 addrspace(3)* %14, align 4, !tbaa !7
  %41 = add nuw nsw i32 %33, %15
  %42 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %41
  %43 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !7
  %44 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !7
  %45 = add nsw i32 %44, %43
  store i32 %45, i32 addrspace(3)* %16, align 4, !tbaa !7
  %46 = add nuw nsw i32 %33, %18
  %47 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %46
  %48 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !7
  %49 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !7
  %50 = add nsw i32 %49, %48
  store i32 %50, i32 addrspace(3)* %19, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %35, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp ult i32 %32, 4
  br i1 %52, label %53, label %31, !llvm.loop !11

53:                                               ; preds = %51, %21, %4
  %54 = icmp eq i32 %5, 0
  br i1 %54, label %55, label %64

55:                                               ; preds = %53
  %56 = load i32, i32 addrspace(3)* %14, align 4, !tbaa !7
  %57 = atomicrmw add i32 addrspace(1)* %2, i32 %56 syncscope("agent-one-as") monotonic, align 4
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 1
  %59 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !7
  %60 = atomicrmw add i32 addrspace(1)* %58, i32 %59 syncscope("agent-one-as") monotonic, align 4
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 2
  %62 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !7
  %63 = atomicrmw add i32 addrspace(1)* %61, i32 %62 syncscope("agent-one-as") monotonic, align 4
  br label %64

64:                                               ; preds = %55, %53
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
