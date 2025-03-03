; ModuleID = '../data/hip_kernels/3596/7/main.cu'
source_filename = "../data/hip_kernels/3596/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26MHDComputedUy_CUDA3_kernelPfS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_fiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture %9, float addrspace(1)* nocapture %10, float addrspace(1)* nocapture %11, float addrspace(1)* nocapture %12, float addrspace(1)* nocapture %13, float addrspace(1)* nocapture %14, float addrspace(1)* nocapture %15, float addrspace(1)* nocapture %16, float addrspace(1)* nocapture %17, float %18, i32 %19, i32 %20, i32 %21, i32 %22) local_unnamed_addr #0 {
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
  br i1 %34, label %139, label %35

35:                                               ; preds = %23
  %36 = mul i32 %21, %20
  %37 = sdiv i32 %30, %36
  %38 = mul i32 %36, %37
  %39 = sub nsw i32 %30, %38
  %40 = sdiv i32 %39, %21
  %41 = sub i32 %37, %40
  %42 = mul i32 %41, %21
  %43 = add i32 %42, %39
  %44 = mul nsw i32 %43, %20
  %45 = add nsw i32 %44, %40
  %46 = add nuw nsw i32 %30, 1
  %47 = sdiv i32 %46, %36
  %48 = mul i32 %36, %47
  %49 = sub nsw i32 %46, %48
  %50 = sdiv i32 %49, %21
  %51 = sub i32 %47, %50
  %52 = mul i32 %51, %21
  %53 = add i32 %52, %49
  %54 = mul nsw i32 %53, %20
  %55 = add nsw i32 %54, %50
  %56 = sext i32 %45 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = sext i32 %55 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = fsub contract float %58, %61
  %63 = fmul contract float %62, %18
  %64 = getelementptr inbounds float, float addrspace(1)* %9, i64 %56
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = fadd contract float %65, %63
  store float %66, float addrspace(1)* %64, align 4, !tbaa !5
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5
  %71 = fsub contract float %68, %70
  %72 = fmul contract float %71, %18
  %73 = getelementptr inbounds float, float addrspace(1)* %10, i64 %56
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5
  %75 = fadd contract float %74, %72
  store float %75, float addrspace(1)* %73, align 4, !tbaa !5
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5
  %80 = fsub contract float %77, %79
  %81 = fmul contract float %80, %18
  %82 = getelementptr inbounds float, float addrspace(1)* %11, i64 %56
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5
  %84 = fadd contract float %83, %81
  store float %84, float addrspace(1)* %82, align 4, !tbaa !5
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5
  %87 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  %89 = fsub contract float %86, %88
  %90 = fmul contract float %89, %18
  %91 = getelementptr inbounds float, float addrspace(1)* %12, i64 %56
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  %93 = fadd contract float %92, %90
  store float %93, float addrspace(1)* %91, align 4, !tbaa !5
  %94 = getelementptr inbounds float, float addrspace(1)* %4, i64 %56
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5
  %96 = getelementptr inbounds float, float addrspace(1)* %4, i64 %59
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  %98 = fsub contract float %95, %97
  %99 = fmul contract float %98, %18
  %100 = getelementptr inbounds float, float addrspace(1)* %13, i64 %56
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5
  %102 = fadd contract float %101, %99
  store float %102, float addrspace(1)* %100, align 4, !tbaa !5
  %103 = getelementptr inbounds float, float addrspace(1)* %5, i64 %56
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5
  %105 = getelementptr inbounds float, float addrspace(1)* %5, i64 %59
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = fsub contract float %104, %106
  %108 = fmul contract float %107, %18
  %109 = getelementptr inbounds float, float addrspace(1)* %14, i64 %56
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5
  %111 = fadd contract float %110, %108
  store float %111, float addrspace(1)* %109, align 4, !tbaa !5
  %112 = getelementptr inbounds float, float addrspace(1)* %6, i64 %56
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5
  %114 = getelementptr inbounds float, float addrspace(1)* %6, i64 %59
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5
  %116 = fsub contract float %113, %115
  %117 = fmul contract float %116, %18
  %118 = getelementptr inbounds float, float addrspace(1)* %15, i64 %56
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5
  %120 = fadd contract float %119, %117
  store float %120, float addrspace(1)* %118, align 4, !tbaa !5
  %121 = getelementptr inbounds float, float addrspace(1)* %7, i64 %56
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !5
  %123 = getelementptr inbounds float, float addrspace(1)* %7, i64 %59
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5
  %125 = fsub contract float %122, %124
  %126 = fmul contract float %125, %18
  %127 = getelementptr inbounds float, float addrspace(1)* %16, i64 %56
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !5
  %129 = fadd contract float %128, %126
  store float %129, float addrspace(1)* %127, align 4, !tbaa !5
  %130 = getelementptr inbounds float, float addrspace(1)* %8, i64 %56
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5
  %132 = getelementptr inbounds float, float addrspace(1)* %8, i64 %59
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5
  %134 = fsub contract float %131, %133
  %135 = fmul contract float %134, %18
  %136 = getelementptr inbounds float, float addrspace(1)* %17, i64 %56
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5
  %138 = fadd contract float %137, %135
  store float %138, float addrspace(1)* %136, align 4, !tbaa !5
  br label %139

139:                                              ; preds = %23, %35
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
