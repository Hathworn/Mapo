; ModuleID = '../data/hip_kernels/11909/9/main.cu'
source_filename = "../data/hip_kernels/11909/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL20cudaSumIIGammaKernelPdS_S_i = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL20cudaSumIIGammaKernelPdS_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 comdat {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %48

15:                                               ; preds = %4
  %16 = freeze i32 %13
  %17 = sdiv i32 %16, 4
  %18 = mul i32 %17, 4
  %19 = sub i32 %16, %18
  %20 = shl nsw i32 %17, 4
  %21 = shl nsw i32 %19, 2
  %22 = add nsw i32 %20, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double, double addrspace(1)* %0, i64 %23
  %25 = getelementptr inbounds double, double addrspace(1)* %1, i64 %23
  %26 = getelementptr inbounds double, double addrspace(1)* %2, i64 %23
  %27 = load double, double addrspace(1)* %24, align 8, !tbaa !7
  %28 = load double, double addrspace(1)* %25, align 8, !tbaa !7
  %29 = fmul contract double %27, %28
  store double %29, double addrspace(1)* %26, align 8, !tbaa !7
  %30 = getelementptr inbounds double, double addrspace(1)* %24, i64 1
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7
  %32 = getelementptr inbounds double, double addrspace(1)* %25, i64 1
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !7
  %34 = fmul contract double %31, %33
  %35 = getelementptr inbounds double, double addrspace(1)* %26, i64 1
  store double %34, double addrspace(1)* %35, align 8, !tbaa !7
  %36 = getelementptr inbounds double, double addrspace(1)* %24, i64 2
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %38 = getelementptr inbounds double, double addrspace(1)* %25, i64 2
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7
  %40 = fmul contract double %37, %39
  %41 = getelementptr inbounds double, double addrspace(1)* %26, i64 2
  store double %40, double addrspace(1)* %41, align 8, !tbaa !7
  %42 = getelementptr inbounds double, double addrspace(1)* %24, i64 3
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7
  %44 = getelementptr inbounds double, double addrspace(1)* %25, i64 3
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7
  %46 = fmul contract double %43, %45
  %47 = getelementptr inbounds double, double addrspace(1)* %26, i64 3
  store double %46, double addrspace(1)* %47, align 8, !tbaa !7
  br label %48

48:                                               ; preds = %15, %4
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
