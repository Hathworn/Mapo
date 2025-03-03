; ModuleID = '../data/hip_kernels/2824/32/main.cu'
source_filename = "../data/hip_kernels/2824/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z5poli4Pfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !5
  %15 = icmp slt i32 %11, %1
  br i1 %15, label %16, label %53

16:                                               ; preds = %2
  %17 = fmul contract float %14, 5.000000e+00
  %18 = fadd contract float %17, 5.000000e+00
  %19 = fcmp olt float %14, 0x39F0000000000000
  %20 = select i1 %19, float 0x41F0000000000000, float 1.000000e+00
  %21 = fmul float %14, %20
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
  %40 = fmul contract float %17, %39
  %41 = fadd contract float %18, %40
  %42 = fmul contract float %39, 5.000000e+00
  %43 = fmul contract float %14, %42
  %44 = fmul contract float %14, %43
  %45 = fadd contract float %41, %44
  %46 = fmul contract float %14, %40
  %47 = fmul contract float %14, %46
  %48 = fadd contract float %47, %45
  %49 = fmul contract float %39, %40
  %50 = fmul contract float %14, %49
  %51 = fmul contract float %14, %50
  %52 = fadd contract float %51, %48
  store float %52, float addrspace(1)* %13, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %16, %2
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
