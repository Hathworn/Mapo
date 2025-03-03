; ModuleID = '../data/hip_kernels/14393/0/main.cu'
source_filename = "../data/hip_kernels/14393/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9resultantPhS_S_(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %13
  %15 = load i8, i8 addrspace(1)* %14, align 1, !tbaa !7, !amdgpu.noclobber !5
  %16 = uitofp i8 %15 to float
  %17 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %13
  %18 = load i8, i8 addrspace(1)* %17, align 1, !tbaa !7, !amdgpu.noclobber !5
  %19 = uitofp i8 %18 to float
  %20 = fadd contract float %16, %19
  %21 = fmul contract float %20, %20
  %22 = fmul contract float %16, 2.000000e+00
  %23 = fmul contract float %22, %19
  %24 = fsub contract float %21, %23
  %25 = fcmp olt float %24, 0x39F0000000000000
  %26 = select i1 %25, float 0x41F0000000000000, float 1.000000e+00
  %27 = fmul float %24, %26
  %28 = tail call float @llvm.sqrt.f32(float %27)
  %29 = bitcast float %28 to i32
  %30 = add nsw i32 %29, -1
  %31 = bitcast i32 %30 to float
  %32 = add nsw i32 %29, 1
  %33 = bitcast i32 %32 to float
  %34 = tail call i1 @llvm.amdgcn.class.f32(float %27, i32 608)
  %35 = select i1 %25, float 0x3EF0000000000000, float 1.000000e+00
  %36 = fneg float %33
  %37 = tail call float @llvm.fma.f32(float %36, float %28, float %27)
  %38 = fcmp ogt float %37, 0.000000e+00
  %39 = fneg float %31
  %40 = tail call float @llvm.fma.f32(float %39, float %28, float %27)
  %41 = fcmp ole float %40, 0.000000e+00
  %42 = select i1 %41, float %31, float %28
  %43 = select i1 %38, float %33, float %42
  %44 = fmul float %35, %43
  %45 = select i1 %34, float %27, float %44
  %46 = fptoui float %45 to i8
  %47 = icmp ugt i8 %46, 15
  br i1 %47, label %48, label %54

48:                                               ; preds = %3
  %49 = add nsw i32 %12, -1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !5
  %53 = icmp eq i8 %52, -108
  br i1 %53, label %54, label %55

54:                                               ; preds = %48, %3
  br label %55

55:                                               ; preds = %48, %54
  %56 = phi i8 [ 0, %54 ], [ -108, %48 ]
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %13
  store i8 %56, i8 addrspace(1)* %57, align 1, !tbaa !7
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
