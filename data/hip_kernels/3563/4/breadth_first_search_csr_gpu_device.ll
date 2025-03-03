; ModuleID = '../data/hip_kernels/3563/4/main.cu'
source_filename = "../data/hip_kernels/3563/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28breadth_first_search_csr_gpuPjS_PiS_S_j(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp ult i32 %15, %5
  br i1 %16, label %17, label %48

17:                                               ; preds = %6
  %18 = zext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %48

22:                                               ; preds = %17
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %18
  store i32 1, i32 addrspace(1)* %23, align 4, !tbaa !7
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7
  %26 = add nuw i32 %15, 1
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %30 = icmp ult i32 %25, %29
  br i1 %30, label %31, label %48

31:                                               ; preds = %22, %45
  %32 = phi i32 [ %46, %45 ], [ %25, %22 ]
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  switch i32 %35, label %42 [
    i32 0, label %45
    i32 1, label %36
  ]

36:                                               ; preds = %31
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %39
  store i32 1, i32 addrspace(1)* %40, align 4, !tbaa !7
  %41 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %31, %36
  %43 = phi i32 [ %35, %31 ], [ %41, %36 ]
  %44 = add nsw i32 %43, -1
  store i32 %44, i32 addrspace(1)* %34, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %31, %42
  %46 = add nuw nsw i32 %32, 1
  %47 = icmp ult i32 %46, %29
  br i1 %47, label %31, label %48, !llvm.loop !11

48:                                               ; preds = %45, %22, %17, %6
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
