; ModuleID = '../data/hip_kernels/12063/8/main.cu'
source_filename = "../data/hip_kernels/12063/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16partialSumKernelPiiE10partialSum = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16partialSumKernelPii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = icmp slt i32 %11, %1
  br i1 %12, label %13, label %17

13:                                               ; preds = %2
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %17

17:                                               ; preds = %2, %13
  %18 = phi i32 [ %16, %13 ], [ 0, %2 ]
  %19 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ16partialSumKernelPiiE10partialSum, i32 0, i32 %3
  store i32 %18, i32 addrspace(3)* %19, align 4, !tbaa !7
  %20 = add nuw nsw i32 %3, %9
  %21 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ16partialSumKernelPiiE10partialSum, i32 0, i32 %20
  store i32 0, i32 addrspace(3)* %21, align 4, !tbaa !7
  br label %24

22:                                               ; preds = %33
  %23 = icmp eq i32 %3, 0
  br i1 %23, label %36, label %40

24:                                               ; preds = %17, %33
  %25 = phi i32 [ %9, %17 ], [ %34, %33 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = icmp ugt i32 %3, %25
  br i1 %26, label %33, label %27

27:                                               ; preds = %24
  %28 = add nuw nsw i32 %25, %3
  %29 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ16partialSumKernelPiiE10partialSum, i32 0, i32 %28
  %30 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !7
  %31 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !7
  %32 = add nsw i32 %31, %30
  store i32 %32, i32 addrspace(3)* %19, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %24, %27
  %34 = lshr i32 %25, 1
  %35 = icmp ult i32 %25, 2
  br i1 %35, label %22, label %24, !llvm.loop !11

36:                                               ; preds = %22
  %37 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !7
  %38 = zext i32 %4 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  store i32 %37, i32 addrspace(1)* %39, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %36, %22
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
