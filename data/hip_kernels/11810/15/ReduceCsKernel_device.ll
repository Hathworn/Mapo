; ModuleID = '../data/hip_kernels/11810/15/main.cu'
source_filename = "../data/hip_kernels/11810/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14ReduceCsKernelPdS_S_S_S_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %5
  br i1 %17, label %18, label %42

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !7, !amdgpu.noclobber !6
  %22 = getelementptr inbounds double, double addrspace(1)* %1, i64 %19
  store double %21, double addrspace(1)* %22, align 8, !tbaa !7
  %23 = add nsw i32 %16, %5
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 %24
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !7
  %27 = getelementptr inbounds double, double addrspace(1)* %2, i64 %19
  store double %26, double addrspace(1)* %27, align 8, !tbaa !7
  %28 = add nsw i32 %6, -1
  %29 = add nsw i32 %6, -2
  %30 = mul nsw i32 %29, %5
  %31 = add nsw i32 %16, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %0, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7
  %35 = getelementptr inbounds double, double addrspace(1)* %4, i64 %19
  store double %34, double addrspace(1)* %35, align 8, !tbaa !7
  %36 = mul nsw i32 %28, %5
  %37 = add nsw i32 %16, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7
  %41 = getelementptr inbounds double, double addrspace(1)* %3, i64 %19
  store double %40, double addrspace(1)* %41, align 8, !tbaa !7
  br label %42

42:                                               ; preds = %7, %18
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
