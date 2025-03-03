; ModuleID = '../data/hip_kernels/1838/93/main.cu'
source_filename = "../data/hip_kernels/1838/93/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z35flow_absolute_residual_scalable_GPUPfPK15HIP_vector_typeIfLj2EEPKfPKiPKjffffiiiS7_S7_ffS5_(float addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float %5, float %6, float %7, float %8, i32 %9, i32 %10, i32 %11, i32 addrspace(1)* nocapture readonly %12, i32 addrspace(1)* nocapture readonly %13, float %14, float %15, float addrspace(1)* nocapture readonly %16) local_unnamed_addr #0 {
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = mul i32 %23, %22
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %26, %11
  br i1 %27, label %28, label %149

28:                                               ; preds = %17
  %29 = sext i32 %26 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %29, i32 0, i32 0, i32 0, i64 0
  %36 = load float, float addrspace(1)* %35, align 8, !amdgpu.noclobber !5
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %29, i32 0, i32 0, i32 0, i64 1
  %38 = load float, float addrspace(1)* %37, align 4, !amdgpu.noclobber !5
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !11, !amdgpu.noclobber !5
  %41 = fdiv contract float 1.000000e+00, %40
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %29
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = mul nsw i32 %10, %9
  %45 = icmp slt i32 %43, %44
  %46 = select i1 %45, i32 0, i32 %9
  %47 = mul nsw i32 %46, %10
  %48 = sub nsw i32 %43, %47
  %49 = sitofp i32 %48 to float
  %50 = sitofp i32 %10 to float
  %51 = fdiv contract float %49, %50
  %52 = tail call float @llvm.floor.f32(float %51)
  %53 = fmul contract float %52, %50
  %54 = fsub contract float %49, %53
  %55 = fsub contract float %54, %7
  %56 = fsub contract float %52, %8
  %57 = select contract i1 %45, float %14, float %15
  %58 = sext i32 %34 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = add nsw i32 %60, %26
  %62 = mul nsw i32 %34, 6
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %16, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !11, !amdgpu.noclobber !5
  %66 = or i32 %62, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %16, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !11, !amdgpu.noclobber !5
  %70 = add nsw i32 %62, 2
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %16, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !11, !amdgpu.noclobber !5
  %74 = add nsw i32 %62, 3
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %16, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !11, !amdgpu.noclobber !5
  %78 = add nsw i32 %62, 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %16, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11, !amdgpu.noclobber !5
  %82 = add nsw i32 %62, 5
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %16, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11, !amdgpu.noclobber !5
  %86 = fmul contract float %81, %5
  %87 = fsub contract float %86, %36
  %88 = fmul contract float %85, %56
  %89 = fsub contract float %87, %88
  %90 = fmul contract float %55, %55
  %91 = fmul contract float %81, %90
  %92 = fdiv contract float %91, %5
  %93 = fadd contract float %89, %92
  %94 = fmul contract float %41, %5
  %95 = fmul contract float %94, %65
  %96 = fadd contract float %95, %93
  %97 = fmul contract float %41, %55
  %98 = fmul contract float %73, %97
  %99 = fsub contract float %96, %98
  %100 = fmul contract float %56, %55
  %101 = fmul contract float %77, %100
  %102 = fdiv contract float %101, %5
  %103 = fsub contract float %99, %102
  %104 = fneg contract float %38
  %105 = fmul contract float %77, %6
  %106 = fsub contract float %104, %105
  %107 = fmul contract float %85, %55
  %108 = fadd contract float %106, %107
  %109 = fmul contract float %41, %56
  %110 = fmul contract float %73, %109
  %111 = fsub contract float %108, %110
  %112 = fmul contract float %56, %56
  %113 = fmul contract float %77, %112
  %114 = fdiv contract float %113, %6
  %115 = fsub contract float %111, %114
  %116 = fmul contract float %41, %6
  %117 = fmul contract float %116, %69
  %118 = fadd contract float %117, %115
  %119 = fmul contract float %81, %100
  %120 = fdiv contract float %119, %6
  %121 = fadd contract float %120, %118
  %122 = fmul contract float %103, %103
  %123 = fmul contract float %121, %121
  %124 = fadd contract float %123, %122
  %125 = fcmp olt float %124, 0x39F0000000000000
  %126 = select i1 %125, float 0x41F0000000000000, float 1.000000e+00
  %127 = fmul float %124, %126
  %128 = tail call float @llvm.sqrt.f32(float %127)
  %129 = bitcast float %128 to i32
  %130 = add nsw i32 %129, -1
  %131 = bitcast i32 %130 to float
  %132 = add nsw i32 %129, 1
  %133 = bitcast i32 %132 to float
  %134 = tail call i1 @llvm.amdgcn.class.f32(float %127, i32 608)
  %135 = select i1 %125, float 0x3EF0000000000000, float 1.000000e+00
  %136 = fneg float %133
  %137 = tail call float @llvm.fma.f32(float %136, float %128, float %127)
  %138 = fcmp ogt float %137, 0.000000e+00
  %139 = fneg float %131
  %140 = tail call float @llvm.fma.f32(float %139, float %128, float %127)
  %141 = fcmp ole float %140, 0.000000e+00
  %142 = select i1 %141, float %131, float %128
  %143 = select i1 %138, float %133, float %142
  %144 = fmul float %135, %143
  %145 = select i1 %134, float %127, float %144
  %146 = fmul contract float %57, %145
  %147 = sext i32 %61 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  store float %146, float addrspace(1)* %148, align 4, !tbaa !11
  br label %149

149:                                              ; preds = %28, %17
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
