; ModuleID = '../data/hip_kernels/11909/8/main.cu'
source_filename = "../data/hip_kernels/11909/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL20cudaSumTIGammaKernelPhPdS0_S0_i = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL20cudaSumTIGammaKernelPhPdS0_S0_i(i8 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 comdat {
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
  br i1 %15, label %16, label %54

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
  %27 = shl nsw i32 %18, 4
  %28 = shl nsw i32 %20, 2
  %29 = add nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %1, i64 %30
  %32 = getelementptr inbounds double, double addrspace(1)* %3, i64 %30
  %33 = load double, double addrspace(1)* %26, align 8, !tbaa !10
  %34 = load double, double addrspace(1)* %31, align 8, !tbaa !10
  %35 = fmul contract double %33, %34
  store double %35, double addrspace(1)* %32, align 8, !tbaa !10
  %36 = getelementptr inbounds double, double addrspace(1)* %26, i64 1
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !10
  %38 = getelementptr inbounds double, double addrspace(1)* %31, i64 1
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !10
  %40 = fmul contract double %37, %39
  %41 = getelementptr inbounds double, double addrspace(1)* %32, i64 1
  store double %40, double addrspace(1)* %41, align 8, !tbaa !10
  %42 = getelementptr inbounds double, double addrspace(1)* %26, i64 2
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !10
  %44 = getelementptr inbounds double, double addrspace(1)* %31, i64 2
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !10
  %46 = fmul contract double %43, %45
  %47 = getelementptr inbounds double, double addrspace(1)* %32, i64 2
  store double %46, double addrspace(1)* %47, align 8, !tbaa !10
  %48 = getelementptr inbounds double, double addrspace(1)* %26, i64 3
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !10
  %50 = getelementptr inbounds double, double addrspace(1)* %31, i64 3
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !10
  %52 = fmul contract double %49, %51
  %53 = getelementptr inbounds double, double addrspace(1)* %32, i64 3
  store double %52, double addrspace(1)* %53, align 8, !tbaa !10
  br label %54

54:                                               ; preds = %16, %5
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
