; ModuleID = '../data/hip_kernels/3596/9/main.cu'
source_filename = "../data/hip_kernels/3596/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26MHDUpdatePrim_CUDA3_kernelPfS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_fffi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, float addrspace(1)* nocapture readonly %15, float addrspace(1)* nocapture readonly %16, float addrspace(1)* nocapture readonly %17, float %18, float %19, float %20, i32 %21) local_unnamed_addr #0 {
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = shl i32 %24, 6
  %27 = add i32 %26, %23
  %28 = mul i32 %25, 40960
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %29, 2
  %31 = add nsw i32 %21, -3
  %32 = icmp sgt i32 %29, %31
  %33 = select i1 %30, i1 true, i1 %32
  br i1 %33, label %108, label %34

34:                                               ; preds = %22
  %35 = zext i32 %29 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = fmul contract float %37, %39
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = fmul contract float %37, %42
  %44 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = fmul contract float %37, %45
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %35
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = fmul contract float %37, %48
  %50 = getelementptr inbounds float, float addrspace(1)* %9, i64 %35
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = fadd contract float %37, %51
  %53 = getelementptr inbounds float, float addrspace(1)* %10, i64 %35
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = fadd contract float %40, %54
  %56 = getelementptr inbounds float, float addrspace(1)* %11, i64 %35
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = fadd contract float %43, %57
  %59 = getelementptr inbounds float, float addrspace(1)* %12, i64 %35
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = fadd contract float %46, %60
  %62 = getelementptr inbounds float, float addrspace(1)* %13, i64 %35
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fadd contract float %49, %63
  store float %52, float addrspace(1)* %36, align 4, !tbaa !5
  %65 = fdiv contract float %55, %52
  store float %65, float addrspace(1)* %38, align 4, !tbaa !5
  %66 = fdiv contract float %58, %52
  store float %66, float addrspace(1)* %41, align 4, !tbaa !5
  %67 = fdiv contract float %61, %52
  store float %67, float addrspace(1)* %44, align 4, !tbaa !5
  %68 = fdiv contract float %64, %52
  store float %68, float addrspace(1)* %47, align 4, !tbaa !5
  %69 = getelementptr inbounds float, float addrspace(1)* %14, i64 %35
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5
  %71 = getelementptr inbounds float, float addrspace(1)* %5, i64 %35
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = fadd contract float %70, %72
  store float %73, float addrspace(1)* %71, align 4, !tbaa !5
  %74 = getelementptr inbounds float, float addrspace(1)* %15, i64 %35
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5
  %76 = getelementptr inbounds float, float addrspace(1)* %6, i64 %35
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5
  %78 = fadd contract float %75, %77
  store float %78, float addrspace(1)* %76, align 4, !tbaa !5
  %79 = getelementptr inbounds float, float addrspace(1)* %16, i64 %35
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5
  %81 = getelementptr inbounds float, float addrspace(1)* %7, i64 %35
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5
  %83 = fadd contract float %80, %82
  store float %83, float addrspace(1)* %81, align 4, !tbaa !5
  %84 = getelementptr inbounds float, float addrspace(1)* %17, i64 %35
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5
  %86 = getelementptr inbounds float, float addrspace(1)* %8, i64 %35
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5
  %88 = fadd contract float %85, %87
  %89 = fneg contract float %18
  %90 = fdiv contract float %19, %20
  %91 = fmul contract float %90, %89
  %92 = fmul contract float %90, %91
  %93 = fmul float %92, 0x3FF7154760000000
  %94 = tail call float @llvm.rint.f32(float %93)
  %95 = fcmp ogt float %92, 0x40562E4300000000
  %96 = fcmp olt float %92, 0xC059D1DA00000000
  %97 = fneg float %93
  %98 = tail call float @llvm.fma.f32(float %92, float 0x3FF7154760000000, float %97)
  %99 = tail call float @llvm.fma.f32(float %92, float 0x3E54AE0BE0000000, float %98)
  %100 = fsub float %93, %94
  %101 = fadd float %99, %100
  %102 = tail call float @llvm.exp2.f32(float %101)
  %103 = fptosi float %94 to i32
  %104 = tail call float @llvm.amdgcn.ldexp.f32(float %102, i32 %103)
  %105 = select i1 %96, float 0.000000e+00, float %104
  %106 = select i1 %95, float 0x7FF0000000000000, float %105
  %107 = fmul contract float %106, %88
  store float %107, float addrspace(1)* %86, align 4, !tbaa !5
  br label %108

108:                                              ; preds = %22, %34
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
