; ModuleID = '../data/hip_kernels/1838/94/main.cu'
source_filename = "../data/hip_kernels/1838/94/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z35disp_absolute_residual_scalable_GPUPfPKfPK15HIP_vector_typeIfLj4EEPKiPKjfffffiiS7_S7_fS1_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float %5, float %6, float %7, float %8, float %9, i32 %10, i32 %11, i32 addrspace(1)* nocapture readonly %12, i32 addrspace(1)* nocapture readonly %13, float %14, float addrspace(1)* nocapture readonly %15) local_unnamed_addr #0 {
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = mul i32 %22, %21
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %11
  br i1 %26, label %27, label %134

27:                                               ; preds = %16
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !11, !amdgpu.noclobber !5
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 0
  %37 = load float, float addrspace(1)* %36, align 16, !amdgpu.noclobber !5
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 1
  %39 = load float, float addrspace(1)* %38, align 4, !amdgpu.noclobber !5
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 2
  %41 = load float, float addrspace(1)* %40, align 8, !amdgpu.noclobber !5
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 3
  %43 = load float, float addrspace(1)* %42, align 4, !amdgpu.noclobber !5
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = sitofp i32 %45 to float
  %47 = sitofp i32 %10 to float
  %48 = fdiv contract float %46, %47
  %49 = tail call float @llvm.floor.f32(float %48)
  %50 = fmul contract float %49, %47
  %51 = fsub contract float %46, %50
  %52 = fsub contract float %51, %7
  %53 = fdiv contract float %52, %5
  %54 = fsub contract float %49, %8
  %55 = fdiv contract float %54, %6
  %56 = fneg contract float %5
  %57 = fmul contract float %56, %9
  %58 = fdiv contract float %57, %35
  %59 = fmul contract float %58, %53
  %60 = fmul contract float %58, %55
  %61 = fmul contract float %37, %53
  %62 = fmul contract float %37, %55
  %63 = sext i32 %33 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = add nsw i32 %65, %25
  %67 = mul nsw i32 %33, 6
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %15, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !11, !amdgpu.noclobber !5
  %71 = or i32 %67, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %15, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !11, !amdgpu.noclobber !5
  %75 = add nsw i32 %67, 2
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %15, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !11, !amdgpu.noclobber !5
  %79 = add nsw i32 %67, 3
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %15, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11, !amdgpu.noclobber !5
  %83 = add nsw i32 %67, 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %15, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !11, !amdgpu.noclobber !5
  %87 = add nsw i32 %67, 5
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %15, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !11, !amdgpu.noclobber !5
  %91 = fmul contract float %39, %61
  %92 = fmul contract float %39, %59
  %93 = fsub contract float %91, %92
  %94 = fmul contract float %41, %60
  %95 = fsub contract float %93, %94
  %96 = fmul contract float %41, %62
  %97 = fadd contract float %96, %95
  %98 = fmul contract float %58, %43
  %99 = fsub contract float %97, %98
  %100 = fmul contract float %37, %43
  %101 = fadd contract float %100, %99
  %102 = fmul contract float %39, %70
  %103 = fadd contract float %102, %101
  %104 = fmul contract float %41, %74
  %105 = fadd contract float %104, %103
  %106 = fmul contract float %43, %78
  %107 = fadd contract float %106, %105
  %108 = fmul contract float %41, %61
  %109 = fmul contract float %90, %108
  %110 = fadd contract float %109, %107
  %111 = fmul contract float %43, %61
  %112 = fmul contract float %86, %111
  %113 = fsub contract float %110, %112
  %114 = fmul contract float %39, %62
  %115 = fmul contract float %114, %90
  %116 = fsub contract float %113, %115
  %117 = fmul contract float %43, %62
  %118 = fmul contract float %82, %117
  %119 = fadd contract float %118, %116
  %120 = fmul contract float %37, %39
  %121 = fmul contract float %120, %86
  %122 = fadd contract float %121, %119
  %123 = fmul contract float %37, %41
  %124 = fmul contract float %123, %82
  %125 = fsub contract float %122, %124
  %126 = fmul contract float %5, %9
  %127 = fmul contract float %37, %37
  %128 = fdiv contract float %126, %127
  %129 = fmul contract float %128, %125
  %130 = tail call float @llvm.fabs.f32(float %129)
  %131 = fmul contract float %130, %14
  %132 = sext i32 %66 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  store float %131, float addrspace(1)* %133, align 4, !tbaa !11
  br label %134

134:                                              ; preds = %27, %16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
