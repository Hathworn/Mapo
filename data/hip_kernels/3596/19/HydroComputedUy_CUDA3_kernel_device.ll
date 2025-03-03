; ModuleID = '../data/hip_kernels/3596/19/main.cu'
source_filename = "../data/hip_kernels/3596/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28HydroComputedUy_CUDA3_kernelPfS_S_S_S_S_S_S_S_S_fiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9, float %10, i32 %11, i32 %12, i32 %13, i32 %14) local_unnamed_addr #0 {
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
  br i1 %26, label %95, label %27

27:                                               ; preds = %15
  %28 = mul i32 %13, %12
  %29 = sdiv i32 %22, %28
  %30 = mul i32 %28, %29
  %31 = sub nsw i32 %22, %30
  %32 = sdiv i32 %31, %13
  %33 = sub i32 %29, %32
  %34 = mul i32 %33, %13
  %35 = add i32 %34, %31
  %36 = mul nsw i32 %35, %12
  %37 = add nsw i32 %36, %32
  %38 = add nuw nsw i32 %22, 1
  %39 = sdiv i32 %38, %28
  %40 = mul i32 %28, %39
  %41 = sub nsw i32 %38, %40
  %42 = sdiv i32 %41, %13
  %43 = sub i32 %39, %42
  %44 = mul i32 %43, %13
  %45 = add i32 %44, %41
  %46 = mul nsw i32 %45, %12
  %47 = add nsw i32 %46, %42
  %48 = sext i32 %37 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = sext i32 %47 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = fsub contract float %50, %53
  %55 = fmul contract float %54, %10
  %56 = getelementptr inbounds float, float addrspace(1)* %5, i64 %48
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = fadd contract float %57, %55
  store float %58, float addrspace(1)* %56, align 4, !tbaa !5
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5
  %63 = fsub contract float %60, %62
  %64 = fmul contract float %63, %10
  %65 = getelementptr inbounds float, float addrspace(1)* %6, i64 %48
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = fadd contract float %66, %64
  store float %67, float addrspace(1)* %65, align 4, !tbaa !5
  %68 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5
  %70 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5
  %72 = fsub contract float %69, %71
  %73 = fmul contract float %72, %10
  %74 = getelementptr inbounds float, float addrspace(1)* %7, i64 %48
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5
  %76 = fadd contract float %75, %73
  store float %76, float addrspace(1)* %74, align 4, !tbaa !5
  %77 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %79 = getelementptr inbounds float, float addrspace(1)* %3, i64 %51
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5
  %81 = fsub contract float %78, %80
  %82 = fmul contract float %81, %10
  %83 = getelementptr inbounds float, float addrspace(1)* %8, i64 %48
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5
  %85 = fadd contract float %84, %82
  store float %85, float addrspace(1)* %83, align 4, !tbaa !5
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5
  %88 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5
  %90 = fsub contract float %87, %89
  %91 = fmul contract float %90, %10
  %92 = getelementptr inbounds float, float addrspace(1)* %9, i64 %48
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5
  %94 = fadd contract float %93, %91
  store float %94, float addrspace(1)* %92, align 4, !tbaa !5
  br label %95

95:                                               ; preds = %15, %27
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
