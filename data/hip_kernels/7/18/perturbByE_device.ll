; ModuleID = '../data/hip_kernels/7/18/main.cu'
source_filename = "../data/hip_kernels/7/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10perturbByEPfP15HIP_vector_typeIfLj4EEfS_S_iii(float addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture %1, float %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %7
  br i1 %18, label %19, label %138

19:                                               ; preds = %8
  %20 = freeze i32 %17
  %21 = sdiv i32 %20, 3
  %22 = mul i32 %21, 3
  %23 = sub i32 %20, %22
  switch i32 %23, label %100 [
    i32 0, label %24
    i32 1, label %62
  ]

24:                                               ; preds = %19
  %25 = sext i32 %21 to i64
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %25, i32 0, i32 0, i32 0, i64 0
  %27 = load float, float addrspace(1)* %26, align 16, !tbaa !7, !amdgpu.noclobber !5
  %28 = sext i32 %17 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  store float %27, float addrspace(1)* %29, align 4, !tbaa !10
  %30 = mul nsw i32 %17, %6
  %31 = add nsw i32 %30, %5
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !10
  %35 = fmul contract float %34, %2
  %36 = getelementptr inbounds float, float addrspace(1)* %4, i64 %25
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !10
  %38 = fcmp olt float %37, 0x39F0000000000000
  %39 = select i1 %38, float 0x41F0000000000000, float 1.000000e+00
  %40 = fmul float %37, %39
  %41 = tail call float @llvm.sqrt.f32(float %40)
  %42 = bitcast float %41 to i32
  %43 = add nsw i32 %42, -1
  %44 = bitcast i32 %43 to float
  %45 = add nsw i32 %42, 1
  %46 = bitcast i32 %45 to float
  %47 = tail call i1 @llvm.amdgcn.class.f32(float %40, i32 608)
  %48 = select i1 %38, float 0x3EF0000000000000, float 1.000000e+00
  %49 = fneg float %46
  %50 = tail call float @llvm.fma.f32(float %49, float %41, float %40)
  %51 = fcmp ogt float %50, 0.000000e+00
  %52 = fneg float %44
  %53 = tail call float @llvm.fma.f32(float %52, float %41, float %40)
  %54 = fcmp ole float %53, 0.000000e+00
  %55 = select i1 %54, float %44, float %41
  %56 = select i1 %51, float %46, float %55
  %57 = fmul float %48, %56
  %58 = select i1 %47, float %40, float %57
  %59 = fdiv contract float %35, %58
  %60 = load float, float addrspace(1)* %26, align 16, !tbaa !7
  %61 = fadd contract float %60, %59
  store float %61, float addrspace(1)* %26, align 16, !tbaa !7
  br label %138

62:                                               ; preds = %19
  %63 = sext i32 %21 to i64
  %64 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %63, i32 0, i32 0, i32 0, i64 1
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = sext i32 %17 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  store float %65, float addrspace(1)* %67, align 4, !tbaa !10
  %68 = mul nsw i32 %17, %6
  %69 = add nsw i32 %68, %5
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %3, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !10
  %73 = fmul contract float %72, %2
  %74 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !10
  %76 = fcmp olt float %75, 0x39F0000000000000
  %77 = select i1 %76, float 0x41F0000000000000, float 1.000000e+00
  %78 = fmul float %75, %77
  %79 = tail call float @llvm.sqrt.f32(float %78)
  %80 = bitcast float %79 to i32
  %81 = add nsw i32 %80, -1
  %82 = bitcast i32 %81 to float
  %83 = add nsw i32 %80, 1
  %84 = bitcast i32 %83 to float
  %85 = tail call i1 @llvm.amdgcn.class.f32(float %78, i32 608)
  %86 = select i1 %76, float 0x3EF0000000000000, float 1.000000e+00
  %87 = fneg float %84
  %88 = tail call float @llvm.fma.f32(float %87, float %79, float %78)
  %89 = fcmp ogt float %88, 0.000000e+00
  %90 = fneg float %82
  %91 = tail call float @llvm.fma.f32(float %90, float %79, float %78)
  %92 = fcmp ole float %91, 0.000000e+00
  %93 = select i1 %92, float %82, float %79
  %94 = select i1 %89, float %84, float %93
  %95 = fmul float %86, %94
  %96 = select i1 %85, float %78, float %95
  %97 = fdiv contract float %73, %96
  %98 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %99 = fadd contract float %98, %97
  store float %99, float addrspace(1)* %64, align 4, !tbaa !7
  br label %138

100:                                              ; preds = %19
  %101 = sext i32 %21 to i64
  %102 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %101, i32 0, i32 0, i32 0, i64 2
  %103 = load float, float addrspace(1)* %102, align 8, !tbaa !7, !amdgpu.noclobber !5
  %104 = sext i32 %17 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  store float %103, float addrspace(1)* %105, align 4, !tbaa !10
  %106 = mul nsw i32 %17, %6
  %107 = add nsw i32 %106, %5
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %3, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !10
  %111 = fmul contract float %110, %2
  %112 = getelementptr inbounds float, float addrspace(1)* %4, i64 %101
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !10
  %114 = fcmp olt float %113, 0x39F0000000000000
  %115 = select i1 %114, float 0x41F0000000000000, float 1.000000e+00
  %116 = fmul float %113, %115
  %117 = tail call float @llvm.sqrt.f32(float %116)
  %118 = bitcast float %117 to i32
  %119 = add nsw i32 %118, -1
  %120 = bitcast i32 %119 to float
  %121 = add nsw i32 %118, 1
  %122 = bitcast i32 %121 to float
  %123 = tail call i1 @llvm.amdgcn.class.f32(float %116, i32 608)
  %124 = select i1 %114, float 0x3EF0000000000000, float 1.000000e+00
  %125 = fneg float %122
  %126 = tail call float @llvm.fma.f32(float %125, float %117, float %116)
  %127 = fcmp ogt float %126, 0.000000e+00
  %128 = fneg float %120
  %129 = tail call float @llvm.fma.f32(float %128, float %117, float %116)
  %130 = fcmp ole float %129, 0.000000e+00
  %131 = select i1 %130, float %120, float %117
  %132 = select i1 %127, float %122, float %131
  %133 = fmul float %124, %132
  %134 = select i1 %123, float %116, float %133
  %135 = fdiv contract float %111, %134
  %136 = load float, float addrspace(1)* %102, align 8, !tbaa !7
  %137 = fadd contract float %136, %135
  store float %137, float addrspace(1)* %102, align 8, !tbaa !7
  br label %138

138:                                              ; preds = %24, %100, %62, %8
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
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
