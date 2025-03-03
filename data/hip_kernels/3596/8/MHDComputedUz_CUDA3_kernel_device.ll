; ModuleID = '../data/hip_kernels/3596/8/main.cu'
source_filename = "../data/hip_kernels/3596/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26MHDComputedUz_CUDA3_kernelPfS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_fiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture %9, float addrspace(1)* nocapture %10, float addrspace(1)* nocapture %11, float addrspace(1)* nocapture %12, float addrspace(1)* nocapture %13, float addrspace(1)* nocapture %14, float addrspace(1)* nocapture %15, float addrspace(1)* nocapture %16, float addrspace(1)* nocapture %17, float %18, i32 %19, i32 %20, i32 %21, i32 %22) local_unnamed_addr #0 {
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = shl i32 %25, 6
  %28 = add i32 %27, %24
  %29 = mul i32 %26, 40960
  %30 = add i32 %28, %29
  %31 = icmp slt i32 %30, 2
  %32 = add nsw i32 %19, -3
  %33 = icmp sgt i32 %30, %32
  %34 = select i1 %31, i1 true, i1 %33
  br i1 %34, label %141, label %35

35:                                               ; preds = %23
  %36 = mul i32 %22, %20
  %37 = sdiv i32 %30, %36
  %38 = mul i32 %36, %37
  %39 = sub nsw i32 %30, %38
  %40 = sdiv i32 %39, %22
  %41 = mul nsw i32 %40, %22
  %42 = sub nsw i32 %39, %41
  %43 = mul nsw i32 %42, %21
  %44 = add nsw i32 %43, %37
  %45 = mul nsw i32 %44, %20
  %46 = add nsw i32 %45, %40
  %47 = add nuw nsw i32 %30, 1
  %48 = sdiv i32 %47, %36
  %49 = mul i32 %36, %48
  %50 = sub nsw i32 %47, %49
  %51 = sdiv i32 %50, %22
  %52 = mul nsw i32 %51, %22
  %53 = sub nsw i32 %50, %52
  %54 = mul nsw i32 %53, %21
  %55 = add nsw i32 %54, %48
  %56 = mul nsw i32 %55, %20
  %57 = add nsw i32 %56, %51
  %58 = sext i32 %46 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = sext i32 %57 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fsub contract float %60, %63
  %65 = fmul contract float %64, %18
  %66 = getelementptr inbounds float, float addrspace(1)* %9, i64 %58
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = fadd contract float %67, %65
  store float %68, float addrspace(1)* %66, align 4, !tbaa !5
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = fsub contract float %70, %72
  %74 = fmul contract float %73, %18
  %75 = getelementptr inbounds float, float addrspace(1)* %10, i64 %58
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5
  %77 = fadd contract float %76, %74
  store float %77, float addrspace(1)* %75, align 4, !tbaa !5
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = fsub contract float %79, %81
  %83 = fmul contract float %82, %18
  %84 = getelementptr inbounds float, float addrspace(1)* %11, i64 %58
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5
  %86 = fadd contract float %85, %83
  store float %86, float addrspace(1)* %84, align 4, !tbaa !5
  %87 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  %89 = getelementptr inbounds float, float addrspace(1)* %3, i64 %61
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5
  %91 = fsub contract float %88, %90
  %92 = fmul contract float %91, %18
  %93 = getelementptr inbounds float, float addrspace(1)* %12, i64 %58
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5
  %95 = fadd contract float %94, %92
  store float %95, float addrspace(1)* %93, align 4, !tbaa !5
  %96 = getelementptr inbounds float, float addrspace(1)* %4, i64 %58
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  %98 = getelementptr inbounds float, float addrspace(1)* %4, i64 %61
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5
  %100 = fsub contract float %97, %99
  %101 = fmul contract float %100, %18
  %102 = getelementptr inbounds float, float addrspace(1)* %13, i64 %58
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5
  %104 = fadd contract float %103, %101
  store float %104, float addrspace(1)* %102, align 4, !tbaa !5
  %105 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = getelementptr inbounds float, float addrspace(1)* %5, i64 %61
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5
  %109 = fsub contract float %106, %108
  %110 = fmul contract float %109, %18
  %111 = getelementptr inbounds float, float addrspace(1)* %14, i64 %58
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5
  %113 = fadd contract float %112, %110
  store float %113, float addrspace(1)* %111, align 4, !tbaa !5
  %114 = getelementptr inbounds float, float addrspace(1)* %6, i64 %58
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5
  %116 = getelementptr inbounds float, float addrspace(1)* %6, i64 %61
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5
  %118 = fsub contract float %115, %117
  %119 = fmul contract float %118, %18
  %120 = getelementptr inbounds float, float addrspace(1)* %15, i64 %58
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5
  %122 = fadd contract float %121, %119
  store float %122, float addrspace(1)* %120, align 4, !tbaa !5
  %123 = getelementptr inbounds float, float addrspace(1)* %7, i64 %58
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5
  %125 = getelementptr inbounds float, float addrspace(1)* %7, i64 %61
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5
  %127 = fsub contract float %124, %126
  %128 = fmul contract float %127, %18
  %129 = getelementptr inbounds float, float addrspace(1)* %16, i64 %58
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !5
  %131 = fadd contract float %130, %128
  store float %131, float addrspace(1)* %129, align 4, !tbaa !5
  %132 = getelementptr inbounds float, float addrspace(1)* %8, i64 %58
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5
  %134 = getelementptr inbounds float, float addrspace(1)* %8, i64 %61
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5
  %136 = fsub contract float %133, %135
  %137 = fmul contract float %136, %18
  %138 = getelementptr inbounds float, float addrspace(1)* %17, i64 %58
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !5
  %140 = fadd contract float %139, %137
  store float %140, float addrspace(1)* %138, align 4, !tbaa !5
  br label %141

141:                                              ; preds = %23, %35
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
