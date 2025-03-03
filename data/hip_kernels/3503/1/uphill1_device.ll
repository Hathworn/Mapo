; ModuleID = '../data/hip_kernels/3503/1/main.cu'
source_filename = "../data/hip_kernels/3503/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7uphill1PjPhS0_ll(i32 addrspace(1)* nocapture %0, i8 addrspace(1)* nocapture readnone %1, i8 addrspace(1)* nocapture %2, i64 %3, i64 %4) local_unnamed_addr #0 {
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
  %16 = add nsw i64 %15, %4
  %17 = icmp slt i64 %16, %3
  br i1 %17, label %18, label %41

18:                                               ; preds = %5
  %19 = shl nsw i64 %4, 1
  %20 = srem i64 %15, %19
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %22, label %41

22:                                               ; preds = %18
  %23 = add nsw i64 %3, -1
  %24 = sub nsw i64 %23, %15
  %25 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %24
  %26 = load i8, i8 addrspace(1)* %25, align 1, !tbaa !7, !amdgpu.noclobber !5
  %27 = icmp eq i8 %26, 0
  %28 = sub nsw i64 %23, %16
  br i1 %27, label %29, label %36

29:                                               ; preds = %22
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !10, !amdgpu.noclobber !5
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !10, !amdgpu.noclobber !5
  %34 = add i32 %33, %31
  store i32 %34, i32 addrspace(1)* %32, align 4, !tbaa !10
  %35 = load i8, i8 addrspace(1)* %25, align 1, !tbaa !7
  br label %36

36:                                               ; preds = %22, %29
  %37 = phi i8 [ %35, %29 ], [ %26, %22 ]
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %28
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7
  %40 = or i8 %37, %39
  store i8 %40, i8 addrspace(1)* %25, align 1, !tbaa !7
  br label %41

41:                                               ; preds = %18, %36, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
