; ModuleID = '../data/hip_kernels/2532/31/main.cu'
source_filename = "../data/hip_kernels/2532/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14zupdate2_dummyPfS_S_fii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %4
  %25 = icmp slt i32 %23, %5
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %68

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %4
  %29 = add nsw i32 %28, %15
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = fmul contract float %32, %32
  %34 = fadd contract float %33, %33
  %35 = fcmp olt float %34, 0x39F0000000000000
  %36 = select i1 %35, float 0x41F0000000000000, float 1.000000e+00
  %37 = fmul float %34, %36
  %38 = tail call float @llvm.sqrt.f32(float %37)
  %39 = bitcast float %38 to i32
  %40 = add nsw i32 %39, -1
  %41 = bitcast i32 %40 to float
  %42 = add nsw i32 %39, 1
  %43 = bitcast i32 %42 to float
  %44 = tail call i1 @llvm.amdgcn.class.f32(float %37, i32 608)
  %45 = select i1 %35, float 0x3EF0000000000000, float 1.000000e+00
  %46 = fneg float %43
  %47 = tail call float @llvm.fma.f32(float %46, float %38, float %37)
  %48 = fcmp ogt float %47, 0.000000e+00
  %49 = fneg float %41
  %50 = tail call float @llvm.fma.f32(float %49, float %38, float %37)
  %51 = fcmp ole float %50, 0.000000e+00
  %52 = select i1 %51, float %41, float %38
  %53 = select i1 %48, float %43, float %52
  %54 = fmul float %45, %53
  %55 = select i1 %44, float %37, float %54
  %56 = fmul contract float %55, %3
  %57 = fadd contract float %56, 1.000000e+00
  %58 = fdiv contract float 1.000000e+00, %57
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract float %32, %3
  %62 = fadd contract float %60, %61
  %63 = fmul contract float %62, %58
  store float %63, float addrspace(1)* %59, align 4, !tbaa !7
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = fadd contract float %61, %65
  %67 = fmul contract float %66, %58
  store float %67, float addrspace(1)* %64, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %27, %6
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
