; ModuleID = '../data/hip_kernels/2583/5/main.cu'
source_filename = "../data/hip_kernels/2583/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12tanhGradientiiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %0
  %23 = icmp slt i32 %21, %1
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %56

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %0
  %27 = add nsw i32 %26, %13
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = fmul contract float %30, 0x3FE5555560000000
  %32 = fpext float %31 to double
  %33 = fcmp contract ogt double %32, 4.970000e+00
  br i1 %33, label %34, label %35

34:                                               ; preds = %25
  store float 0x3FFB745380000000, float addrspace(1)* %29, align 4, !tbaa !7
  br label %53

35:                                               ; preds = %25
  %36 = fcmp contract olt double %32, -4.970000e+00
  br i1 %36, label %37, label %38

37:                                               ; preds = %35
  store float 0xBFFB745380000000, float addrspace(1)* %29, align 4, !tbaa !7
  br label %53

38:                                               ; preds = %35
  %39 = fmul contract float %31, %31
  %40 = fadd contract float %39, 3.780000e+02
  %41 = tail call float @llvm.fma.f32(float %39, float %40, float 1.723500e+04)
  %42 = tail call float @llvm.fma.f32(float %39, float %41, float 1.351350e+05)
  %43 = fmul contract float %31, %42
  %44 = tail call float @llvm.fma.f32(float %39, float 2.800000e+01, float 3.150000e+03)
  %45 = tail call float @llvm.fma.f32(float %39, float %44, float 6.237000e+04)
  %46 = tail call float @llvm.fma.f32(float %39, float %45, float 1.351350e+05)
  %47 = fdiv contract float %43, %46
  %48 = fmul contract float %47, 0x3FFB745380000000
  store float %48, float addrspace(1)* %29, align 4, !tbaa !7
  %49 = fneg contract float %47
  %50 = tail call float @llvm.fma.f32(float %49, float %47, float 1.000000e+00)
  %51 = fmul contract float %50, 0x3FE5555560000000
  %52 = fmul contract float %51, 0x3FFB745380000000
  br label %53

53:                                               ; preds = %37, %38, %34
  %54 = phi float [ 0.000000e+00, %34 ], [ %52, %38 ], [ 0.000000e+00, %37 ]
  %55 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  store float %54, float addrspace(1)* %55, align 4, !tbaa !7
  br label %56

56:                                               ; preds = %53, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
