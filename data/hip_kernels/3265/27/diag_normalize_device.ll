; ModuleID = '../data/hip_kernels/3265/27/main.cu'
source_filename = "../data/hip_kernels/3265/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14diag_normalizePdS_ii(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = bitcast i8 addrspace(4)* %7 to <2 x i16> addrspace(4)*
  %12 = load <2 x i16>, <2 x i16> addrspace(4)* %11, align 4, !invariant.load !5
  %13 = zext <2 x i16> %12 to <2 x i32>
  %14 = insertelement <2 x i32> poison, i32 %5, i64 0
  %15 = insertelement <2 x i32> %14, i32 %9, i64 1
  %16 = mul <2 x i32> %15, %13
  %17 = insertelement <2 x i32> poison, i32 %8, i64 0
  %18 = insertelement <2 x i32> %17, i32 %10, i64 1
  %19 = add <2 x i32> %16, %18
  %20 = shufflevector <2 x i32> %19, <2 x i32> poison, <4 x i32> <i32 0, i32 0, i32 1, i32 0>
  %21 = insertelement <4 x i32> poison, i32 %3, i64 1
  %22 = insertelement <4 x i32> %21, i32 %2, i64 2
  %23 = insertelement <4 x i32> %22, i32 %2, i64 3
  %24 = shufflevector <4 x i32> %23, <4 x i32> %20, <4 x i32> <i32 6, i32 1, i32 2, i32 3>
  %25 = icmp eq <4 x i32> %20, %24
  %26 = icmp slt <4 x i32> %20, %24
  %27 = shufflevector <4 x i1> %25, <4 x i1> %26, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %28 = freeze <4 x i1> %27
  %29 = bitcast <4 x i1> %28 to i4
  %30 = icmp eq i4 %29, -1
  br i1 %30, label %31, label %42

31:                                               ; preds = %4
  %32 = mul nsw i32 %3, %2
  %33 = add nsw i32 %32, %3
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !6, !amdgpu.noclobber !5
  %37 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !6, !amdgpu.noclobber !5
  %39 = fdiv contract double %38, %36
  store double %39, double addrspace(1)* %37, align 8, !tbaa !6
  %40 = load double, double addrspace(1)* %35, align 8, !tbaa !6
  %41 = fdiv contract double %40, %40
  store double %41, double addrspace(1)* %35, align 8, !tbaa !6
  br label %42

42:                                               ; preds = %31, %4
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
!7 = !{!"double", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
