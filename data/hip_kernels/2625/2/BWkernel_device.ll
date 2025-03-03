; ModuleID = '../data/hip_kernels/2625/2/main.cu'
source_filename = "../data/hip_kernels/2625/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8BWkernelPhj(i8 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp ult i32 %11, %1
  br i1 %12, label %13, label %42

13:                                               ; preds = %2
  %14 = mul nsw i32 %11, 3
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %15
  %17 = load i8, i8 addrspace(1)* %16, align 1, !tbaa !7, !amdgpu.noclobber !5
  %18 = uitofp i8 %17 to double
  %19 = fmul contract double %18, 1.140000e-01
  %20 = fadd contract double %19, 0.000000e+00
  %21 = fptrunc double %20 to float
  %22 = add nsw i32 %14, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %23
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !7, !amdgpu.noclobber !5
  %26 = uitofp i8 %25 to double
  %27 = fmul contract double %26, 5.870000e-01
  %28 = fpext float %21 to double
  %29 = fadd contract double %27, %28
  %30 = fptrunc double %29 to float
  %31 = add nsw i32 %14, 2
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7, !amdgpu.noclobber !5
  %35 = uitofp i8 %34 to double
  %36 = fmul contract double %35, 2.990000e-01
  %37 = fpext float %30 to double
  %38 = fadd contract double %36, %37
  %39 = fptrunc double %38 to float
  %40 = fdiv contract float %39, 3.000000e+00
  %41 = fptoui float %40 to i8
  store i8 %41, i8 addrspace(1)* %16, align 1, !tbaa !7
  store i8 %41, i8 addrspace(1)* %24, align 1, !tbaa !7
  store i8 %41, i8 addrspace(1)* %33, align 1, !tbaa !7
  br label %42

42:                                               ; preds = %13, %2
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
