; ModuleID = '../data/hip_kernels/3596/6/main.cu'
source_filename = "../data/hip_kernels/3596/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26MHDComputedUx_CUDA3_kernelPfS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_fi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture writeonly %9, float addrspace(1)* nocapture writeonly %10, float addrspace(1)* nocapture writeonly %11, float addrspace(1)* nocapture writeonly %12, float addrspace(1)* nocapture writeonly %13, float addrspace(1)* nocapture writeonly %14, float addrspace(1)* nocapture writeonly %15, float addrspace(1)* nocapture writeonly %16, float addrspace(1)* nocapture writeonly %17, float %18, i32 %19) local_unnamed_addr #0 {
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = shl i32 %22, 6
  %25 = add i32 %24, %21
  %26 = mul i32 %23, 40960
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %27, 2
  %29 = add nsw i32 %19, -3
  %30 = icmp sgt i32 %27, %29
  %31 = select i1 %28, i1 true, i1 %30
  br i1 %31, label %99, label %32

32:                                               ; preds = %20
  %33 = add nuw nsw i32 %27, 1
  %34 = zext i32 %27 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = zext i32 %33 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = fsub contract float %36, %39
  %41 = fmul contract float %40, %18
  %42 = getelementptr inbounds float, float addrspace(1)* %9, i64 %34
  store float %41, float addrspace(1)* %42, align 4, !tbaa !5
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5
  %47 = fsub contract float %44, %46
  %48 = fmul contract float %47, %18
  %49 = getelementptr inbounds float, float addrspace(1)* %10, i64 %34
  store float %48, float addrspace(1)* %49, align 4, !tbaa !5
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5
  %54 = fsub contract float %51, %53
  %55 = fmul contract float %54, %18
  %56 = getelementptr inbounds float, float addrspace(1)* %11, i64 %34
  store float %55, float addrspace(1)* %56, align 4, !tbaa !5
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %34
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = fsub contract float %58, %60
  %62 = fmul contract float %61, %18
  %63 = getelementptr inbounds float, float addrspace(1)* %12, i64 %34
  store float %62, float addrspace(1)* %63, align 4, !tbaa !5
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %34
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5
  %66 = getelementptr inbounds float, float addrspace(1)* %4, i64 %37
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5
  %68 = fsub contract float %65, %67
  %69 = fmul contract float %68, %18
  %70 = getelementptr inbounds float, float addrspace(1)* %13, i64 %34
  store float %69, float addrspace(1)* %70, align 4, !tbaa !5
  %71 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = getelementptr inbounds float, float addrspace(1)* %5, i64 %37
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5
  %75 = fsub contract float %72, %74
  %76 = fmul contract float %75, %18
  %77 = getelementptr inbounds float, float addrspace(1)* %14, i64 %34
  store float %76, float addrspace(1)* %77, align 4, !tbaa !5
  %78 = getelementptr inbounds float, float addrspace(1)* %6, i64 %34
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5
  %80 = getelementptr inbounds float, float addrspace(1)* %6, i64 %37
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = fsub contract float %79, %81
  %83 = fmul contract float %82, %18
  %84 = getelementptr inbounds float, float addrspace(1)* %15, i64 %34
  store float %83, float addrspace(1)* %84, align 4, !tbaa !5
  %85 = getelementptr inbounds float, float addrspace(1)* %7, i64 %34
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5
  %87 = getelementptr inbounds float, float addrspace(1)* %7, i64 %37
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  %89 = fsub contract float %86, %88
  %90 = fmul contract float %89, %18
  %91 = getelementptr inbounds float, float addrspace(1)* %16, i64 %34
  store float %90, float addrspace(1)* %91, align 4, !tbaa !5
  %92 = getelementptr inbounds float, float addrspace(1)* %8, i64 %34
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5
  %94 = getelementptr inbounds float, float addrspace(1)* %8, i64 %37
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5
  %96 = fsub contract float %93, %95
  %97 = fmul contract float %96, %18
  %98 = getelementptr inbounds float, float addrspace(1)* %17, i64 %34
  store float %97, float addrspace(1)* %98, align 4, !tbaa !5
  br label %99

99:                                               ; preds = %20, %32
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
