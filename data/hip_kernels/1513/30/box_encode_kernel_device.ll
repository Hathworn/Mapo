; ModuleID = '../data/hip_kernels/1513/30/main.cu'
source_filename = "../data/hip_kernels/1513/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17box_encode_kernelPfS_S_S_P15HIP_vector_typeIfLj4EES2_ffffmm(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4, %struct.HIP_vector_type addrspace(1)* nocapture readonly %5, float %6, float %7, float %8, float %9, i64 %10, i64 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = sext i32 %21 to i64
  %23 = icmp ult i64 %22, %10
  br i1 %23, label %25, label %24

24:                                               ; preds = %25, %12
  ret void

25:                                               ; preds = %12, %25
  %26 = phi i64 [ %113, %25 ], [ %22, %12 ]
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %26, i32 0, i32 0, i32 0, i64 0
  %28 = load float, float addrspace(1)* %27, align 16, !tbaa !7
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %26, i32 0, i32 0, i32 0, i64 1
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %26, i32 0, i32 0, i32 0, i64 2
  %32 = load float, float addrspace(1)* %31, align 8, !tbaa !7
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %26, i32 0, i32 0, i32 0, i64 3
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %26, i32 0, i32 0, i32 0, i64 0
  %36 = load float, float addrspace(1)* %35, align 16, !tbaa !7
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %26, i32 0, i32 0, i32 0, i64 1
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %26, i32 0, i32 0, i32 0, i64 2
  %40 = load float, float addrspace(1)* %39, align 8, !tbaa !7
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %26, i32 0, i32 0, i32 0, i64 3
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fsub contract float %32, %28
  %44 = fadd contract float %43, 1.000000e+00
  %45 = fsub contract float %34, %30
  %46 = fadd contract float %45, 1.000000e+00
  %47 = fpext float %28 to double
  %48 = fpext float %44 to double
  %49 = fmul contract double %48, 5.000000e-01
  %50 = fadd contract double %49, %47
  %51 = fptrunc double %50 to float
  %52 = fpext float %30 to double
  %53 = fpext float %46 to double
  %54 = fmul contract double %53, 5.000000e-01
  %55 = fadd contract double %54, %52
  %56 = fptrunc double %55 to float
  %57 = fsub contract float %40, %36
  %58 = fadd contract float %57, 1.000000e+00
  %59 = fsub contract float %42, %38
  %60 = fadd contract float %59, 1.000000e+00
  %61 = fpext float %36 to double
  %62 = fpext float %58 to double
  %63 = fmul contract double %62, 5.000000e-01
  %64 = fadd contract double %63, %61
  %65 = fptrunc double %64 to float
  %66 = fpext float %38 to double
  %67 = fpext float %60 to double
  %68 = fmul contract double %67, 5.000000e-01
  %69 = fadd contract double %68, %66
  %70 = fptrunc double %69 to float
  %71 = fsub contract float %65, %51
  %72 = fmul contract float %71, %6
  %73 = fdiv contract float %72, %44
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  store float %73, float addrspace(1)* %74, align 4, !tbaa !10
  %75 = fsub contract float %70, %56
  %76 = fmul contract float %75, %7
  %77 = fdiv contract float %76, %46
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %77, float addrspace(1)* %78, align 4, !tbaa !10
  %79 = fdiv contract float %58, %44
  %80 = tail call i1 @llvm.amdgcn.class.f32(float %79, i32 144)
  %81 = select i1 %80, float 0x41F0000000000000, float 1.000000e+00
  %82 = fmul float %79, %81
  %83 = tail call float @llvm.log2.f32(float %82)
  %84 = fmul float %83, 0x3FE62E42E0000000
  %85 = tail call i1 @llvm.amdgcn.class.f32(float %83, i32 519)
  %86 = fneg float %84
  %87 = tail call float @llvm.fma.f32(float %83, float 0x3FE62E42E0000000, float %86)
  %88 = tail call float @llvm.fma.f32(float %83, float 0x3E6EFA39E0000000, float %87)
  %89 = fadd float %84, %88
  %90 = select i1 %85, float %83, float %89
  %91 = select i1 %80, float 0x40362E4300000000, float 0.000000e+00
  %92 = fsub float %90, %91
  %93 = fmul contract float %92, %8
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  store float %93, float addrspace(1)* %94, align 4, !tbaa !10
  %95 = fdiv contract float %60, %46
  %96 = tail call i1 @llvm.amdgcn.class.f32(float %95, i32 144)
  %97 = select i1 %96, float 0x41F0000000000000, float 1.000000e+00
  %98 = fmul float %95, %97
  %99 = tail call float @llvm.log2.f32(float %98)
  %100 = fmul float %99, 0x3FE62E42E0000000
  %101 = tail call i1 @llvm.amdgcn.class.f32(float %99, i32 519)
  %102 = fneg float %100
  %103 = tail call float @llvm.fma.f32(float %99, float 0x3FE62E42E0000000, float %102)
  %104 = tail call float @llvm.fma.f32(float %99, float 0x3E6EFA39E0000000, float %103)
  %105 = fadd float %100, %104
  %106 = select i1 %101, float %99, float %105
  %107 = select i1 %96, float 0x40362E4300000000, float 0.000000e+00
  %108 = fsub float %106, %107
  %109 = fmul contract float %108, %9
  %110 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  store float %109, float addrspace(1)* %110, align 4, !tbaa !10
  %111 = add i64 %26, %11
  %112 = shl i64 %111, 32
  %113 = ashr exact i64 %112, 32
  %114 = icmp ult i64 %113, %10
  br i1 %114, label %25, label %24, !llvm.loop !12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
