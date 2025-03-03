; ModuleID = '../data/hip_kernels/260/2/main.cu'
source_filename = "../data/hip_kernels/260/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z10mInitForcePfS_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = uitofp i32 %10 to float
  %13 = uitofp i32 %3 to float
  %14 = fadd contract float %12, -3.200000e+02
  %15 = fmul contract float %14, %14
  %16 = fadd contract float %13, -2.400000e+02
  %17 = fmul contract float %16, %16
  %18 = fadd contract float %15, %17
  %19 = fcmp olt float %18, 0x39F0000000000000
  %20 = select i1 %19, float 0x41F0000000000000, float 1.000000e+00
  %21 = fmul float %18, %20
  %22 = tail call float @llvm.sqrt.f32(float %21)
  %23 = bitcast float %22 to i32
  %24 = add nsw i32 %23, -1
  %25 = bitcast i32 %24 to float
  %26 = add nsw i32 %23, 1
  %27 = bitcast i32 %26 to float
  %28 = tail call i1 @llvm.amdgcn.class.f32(float %21, i32 608)
  %29 = select i1 %19, float 0x3EF0000000000000, float 1.000000e+00
  %30 = fneg float %27
  %31 = tail call float @llvm.fma.f32(float %30, float %22, float %21)
  %32 = fcmp ogt float %31, 0.000000e+00
  %33 = fneg float %25
  %34 = tail call float @llvm.fma.f32(float %33, float %22, float %21)
  %35 = fcmp ole float %34, 0.000000e+00
  %36 = select i1 %35, float %25, float %22
  %37 = select i1 %32, float %27, float %36
  %38 = fmul float %29, %37
  %39 = select i1 %28, float %21, float %38
  %40 = fcmp contract olt float %39, 1.000000e+01
  br i1 %40, label %41, label %54

41:                                               ; preds = %2
  %42 = fpext float %13 to double
  %43 = fsub contract double 2.400000e+02, %42
  %44 = fpext float %39 to double
  %45 = fdiv contract double %43, %44
  %46 = fptrunc double %45 to float
  %47 = sext i32 %11 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float %46, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = uitofp i32 %10 to double
  %50 = fadd contract double %49, -3.200000e+02
  %51 = fdiv contract double %50, %44
  %52 = fptrunc double %51 to float
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  store float %52, float addrspace(1)* %53, align 4, !tbaa !7
  br label %58

54:                                               ; preds = %2
  %55 = sext i32 %11 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  store float 0.000000e+00, float addrspace(1)* %56, align 4, !tbaa !7
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  store float 0.000000e+00, float addrspace(1)* %57, align 4, !tbaa !7
  br label %58

58:                                               ; preds = %54, %41
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
