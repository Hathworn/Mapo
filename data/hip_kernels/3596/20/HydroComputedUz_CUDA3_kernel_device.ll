; ModuleID = '../data/hip_kernels/3596/20/main.cu'
source_filename = "../data/hip_kernels/3596/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28HydroComputedUz_CUDA3_kernelPfS_S_S_S_S_S_S_S_S_fiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9, float %10, i32 %11, i32 %12, i32 %13, i32 %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = shl i32 %17, 6
  %20 = add i32 %19, %16
  %21 = mul i32 %18, 40960
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, 2
  %24 = add nsw i32 %11, -3
  %25 = icmp sgt i32 %22, %24
  %26 = select i1 %23, i1 true, i1 %25
  br i1 %26, label %97, label %27

27:                                               ; preds = %15
  %28 = mul i32 %14, %12
  %29 = sdiv i32 %22, %28
  %30 = mul i32 %28, %29
  %31 = sub nsw i32 %22, %30
  %32 = sdiv i32 %31, %14
  %33 = mul nsw i32 %32, %14
  %34 = sub nsw i32 %31, %33
  %35 = mul nsw i32 %34, %13
  %36 = add nsw i32 %35, %29
  %37 = mul nsw i32 %36, %12
  %38 = add nsw i32 %37, %32
  %39 = add nuw nsw i32 %22, 1
  %40 = sdiv i32 %39, %28
  %41 = mul i32 %28, %40
  %42 = sub nsw i32 %39, %41
  %43 = sdiv i32 %42, %14
  %44 = mul nsw i32 %43, %14
  %45 = sub nsw i32 %42, %44
  %46 = mul nsw i32 %45, %13
  %47 = add nsw i32 %46, %40
  %48 = mul nsw i32 %47, %12
  %49 = add nsw i32 %48, %43
  %50 = sext i32 %38 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = sext i32 %49 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = fsub contract float %52, %55
  %57 = fmul contract float %56, %10
  %58 = getelementptr inbounds float, float addrspace(1)* %5, i64 %50
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = fadd contract float %59, %57
  store float %60, float addrspace(1)* %58, align 4, !tbaa !5
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5
  %65 = fsub contract float %62, %64
  %66 = fmul contract float %65, %10
  %67 = getelementptr inbounds float, float addrspace(1)* %6, i64 %50
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5
  %69 = fadd contract float %68, %66
  store float %69, float addrspace(1)* %67, align 4, !tbaa !5
  %70 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5
  %74 = fsub contract float %71, %73
  %75 = fmul contract float %74, %10
  %76 = getelementptr inbounds float, float addrspace(1)* %7, i64 %50
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5
  %78 = fadd contract float %77, %75
  store float %78, float addrspace(1)* %76, align 4, !tbaa !5
  %79 = getelementptr inbounds float, float addrspace(1)* %3, i64 %50
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5
  %83 = fsub contract float %80, %82
  %84 = fmul contract float %83, %10
  %85 = getelementptr inbounds float, float addrspace(1)* %8, i64 %50
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5
  %87 = fadd contract float %86, %84
  store float %87, float addrspace(1)* %85, align 4, !tbaa !5
  %88 = getelementptr inbounds float, float addrspace(1)* %4, i64 %50
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5
  %90 = getelementptr inbounds float, float addrspace(1)* %4, i64 %53
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5
  %92 = fsub contract float %89, %91
  %93 = fmul contract float %92, %10
  %94 = getelementptr inbounds float, float addrspace(1)* %9, i64 %50
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5
  %96 = fadd contract float %95, %93
  store float %96, float addrspace(1)* %94, align 4, !tbaa !5
  br label %97

97:                                               ; preds = %15, %27
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
