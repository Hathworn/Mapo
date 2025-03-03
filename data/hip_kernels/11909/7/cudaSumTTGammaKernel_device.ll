; ModuleID = '../data/hip_kernels/11909/7/main.cu'
source_filename = "../data/hip_kernels/11909/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL20cudaSumTTGammaKernelPhS_PdS0_i = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL20cudaSumTTGammaKernelPhS_PdS0_i(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 comdat {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %4
  br i1 %15, label %16, label %58

16:                                               ; preds = %5
  %17 = freeze i32 %14
  %18 = sdiv i32 %17, 4
  %19 = mul i32 %18, 4
  %20 = sub i32 %17, %19
  %21 = sext i32 %18 to i64
  %22 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %21
  %23 = load i8, i8 addrspace(1)* %22, align 1, !tbaa !7, !amdgpu.noclobber !5
  %24 = zext i8 %23 to i64
  %25 = shl nuw nsw i64 %24, 2
  %26 = getelementptr inbounds double, double addrspace(1)* %2, i64 %25
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %21
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !7, !amdgpu.noclobber !5
  %29 = zext i8 %28 to i64
  %30 = shl nuw nsw i64 %29, 2
  %31 = getelementptr inbounds double, double addrspace(1)* %2, i64 %30
  %32 = shl nsw i32 %18, 4
  %33 = shl nsw i32 %20, 2
  %34 = add nsw i32 %32, %33
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %3, i64 %35
  %37 = load double, double addrspace(1)* %26, align 8, !tbaa !10
  %38 = load double, double addrspace(1)* %31, align 8, !tbaa !10
  %39 = fmul contract double %37, %38
  store double %39, double addrspace(1)* %36, align 8, !tbaa !10
  %40 = getelementptr inbounds double, double addrspace(1)* %26, i64 1
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !10
  %42 = getelementptr inbounds double, double addrspace(1)* %31, i64 1
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !10
  %44 = fmul contract double %41, %43
  %45 = getelementptr inbounds double, double addrspace(1)* %36, i64 1
  store double %44, double addrspace(1)* %45, align 8, !tbaa !10
  %46 = getelementptr inbounds double, double addrspace(1)* %26, i64 2
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !10
  %48 = getelementptr inbounds double, double addrspace(1)* %31, i64 2
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !10
  %50 = fmul contract double %47, %49
  %51 = getelementptr inbounds double, double addrspace(1)* %36, i64 2
  store double %50, double addrspace(1)* %51, align 8, !tbaa !10
  %52 = getelementptr inbounds double, double addrspace(1)* %26, i64 3
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !10
  %54 = getelementptr inbounds double, double addrspace(1)* %31, i64 3
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !10
  %56 = fmul contract double %53, %55
  %57 = getelementptr inbounds double, double addrspace(1)* %36, i64 3
  store double %56, double addrspace(1)* %57, align 8, !tbaa !10
  br label %58

58:                                               ; preds = %16, %5
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"double", !8, i64 0}
