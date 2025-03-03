; ModuleID = '../data/hip_kernels/14439/6/main.cu'
source_filename = "../data/hip_kernels/14439/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16assemble_tensorsPKdPdi(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = mul i32 %4, 9
  %6 = mul i32 %4, %2
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds double, double addrspace(1)* %0, i64 %7
  %9 = load double, double addrspace(1)* %8, align 8, !tbaa !4, !amdgpu.noclobber !8
  %10 = sext i32 %5 to i64
  %11 = getelementptr inbounds double, double addrspace(1)* %1, i64 %10
  store double %9, double addrspace(1)* %11, align 8, !tbaa !4
  %12 = add nsw i32 %6, 1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds double, double addrspace(1)* %0, i64 %13
  %15 = load double, double addrspace(1)* %14, align 8, !tbaa !4
  %16 = add nsw i32 %5, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds double, double addrspace(1)* %1, i64 %17
  store double %15, double addrspace(1)* %18, align 8, !tbaa !4
  %19 = add nsw i32 %6, 3
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 %20
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !4
  %23 = add nsw i32 %5, 2
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, double addrspace(1)* %1, i64 %24
  store double %22, double addrspace(1)* %25, align 8, !tbaa !4
  %26 = load double, double addrspace(1)* %14, align 8, !tbaa !4
  %27 = add nsw i32 %5, 3
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  store double %26, double addrspace(1)* %29, align 8, !tbaa !4
  %30 = add nsw i32 %6, 2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %0, i64 %31
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !4
  %34 = add nsw i32 %5, 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  store double %33, double addrspace(1)* %36, align 8, !tbaa !4
  %37 = add nsw i32 %6, 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !4
  %41 = add nsw i32 %5, 5
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %1, i64 %42
  store double %40, double addrspace(1)* %43, align 8, !tbaa !4
  %44 = load double, double addrspace(1)* %21, align 8, !tbaa !4
  %45 = add nsw i32 %5, 6
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  store double %44, double addrspace(1)* %47, align 8, !tbaa !4
  %48 = load double, double addrspace(1)* %39, align 8, !tbaa !4
  %49 = add nsw i32 %5, 7
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %1, i64 %50
  store double %48, double addrspace(1)* %51, align 8, !tbaa !4
  %52 = add nsw i32 %6, 5
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !4
  %56 = add nsw i32 %5, 8
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  store double %55, double addrspace(1)* %58, align 8, !tbaa !4
  ret void
}

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
