; ModuleID = '../data/hip_kernels/10802/8/main.cu'
source_filename = "../data/hip_kernels/10802/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11hyst_kernelPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = bitcast i8 addrspace(4)* %9 to <2 x i16> addrspace(4)*
  %12 = load <2 x i16>, <2 x i16> addrspace(4)* %11, align 4, !invariant.load !5
  %13 = zext <2 x i16> %12 to <2 x i32>
  %14 = insertelement <2 x i32> poison, i32 %8, i64 0
  %15 = insertelement <2 x i32> %14, i32 %5, i64 1
  %16 = mul <2 x i32> %15, %13
  %17 = insertelement <2 x i32> poison, i32 %10, i64 0
  %18 = insertelement <2 x i32> %17, i32 %7, i64 1
  %19 = add nuw nsw <2 x i32> %18, <i32 1, i32 1>
  %20 = add <2 x i32> %19, %16
  %21 = extractelement <2 x i32> %20, i64 1
  %22 = mul nsw i32 %21, %3
  %23 = extractelement <2 x i32> %20, i64 0
  %24 = add i32 %23, %22
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %25
  %27 = load i8, i8 addrspace(1)* %26, align 1, !tbaa !6, !amdgpu.noclobber !5
  %28 = icmp ugt i8 %27, 69
  br i1 %28, label %29, label %31

29:                                               ; preds = %4
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %25
  store i8 -1, i8 addrspace(1)* %30, align 1, !tbaa !6
  br label %40

31:                                               ; preds = %4
  %32 = icmp ult i8 %27, 11
  br i1 %32, label %33, label %35

33:                                               ; preds = %31
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %25
  store i8 0, i8 addrspace(1)* %34, align 1, !tbaa !6
  br label %40

35:                                               ; preds = %31
  %36 = icmp ugt i8 %27, 39
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %25
  br i1 %36, label %38, label %39

38:                                               ; preds = %35
  store i8 -1, i8 addrspace(1)* %37, align 1, !tbaa !6
  br label %40

39:                                               ; preds = %35
  store i8 0, i8 addrspace(1)* %37, align 1, !tbaa !6
  br label %40

40:                                               ; preds = %38, %39, %33, %29
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
