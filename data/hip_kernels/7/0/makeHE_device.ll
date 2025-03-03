; ModuleID = '../data/hip_kernels/7/0/main.cu'
source_filename = "../data/hip_kernels/7/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6makeHEPfS_P15HIP_vector_typeIfLj4EES_fiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = freeze i32 %17
  %19 = sdiv i32 %18, 3
  %20 = icmp slt i32 %17, %7
  br i1 %20, label %21, label %130

21:                                               ; preds = %8
  %22 = mul i32 %19, 3
  %23 = sub i32 %18, %22
  switch i32 %23, label %86 [
    i32 0, label %24
    i32 1, label %55
  ]

24:                                               ; preds = %21
  %25 = sext i32 %17 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = sext i32 %19 to i64
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 0
  %30 = load float, float addrspace(1)* %29, align 16, !tbaa !11, !amdgpu.noclobber !5
  %31 = fsub contract float %27, %30
  %32 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fcmp olt float %33, 0x39F0000000000000
  %35 = select i1 %34, float 0x41F0000000000000, float 1.000000e+00
  %36 = fmul float %33, %35
  %37 = tail call float @llvm.sqrt.f32(float %36)
  %38 = bitcast float %37 to i32
  %39 = add nsw i32 %38, -1
  %40 = bitcast i32 %39 to float
  %41 = add nsw i32 %38, 1
  %42 = bitcast i32 %41 to float
  %43 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 608)
  %44 = select i1 %34, float 0x3EF0000000000000, float 1.000000e+00
  %45 = fneg float %42
  %46 = tail call float @llvm.fma.f32(float %45, float %37, float %36)
  %47 = fcmp ogt float %46, 0.000000e+00
  %48 = fneg float %40
  %49 = tail call float @llvm.fma.f32(float %48, float %37, float %36)
  %50 = fcmp ole float %49, 0.000000e+00
  %51 = select i1 %50, float %40, float %37
  %52 = select i1 %47, float %42, float %51
  %53 = fmul float %44, %52
  %54 = select i1 %43, float %36, float %53
  br label %117

55:                                               ; preds = %21
  %56 = sext i32 %17 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = sext i32 %19 to i64
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %59, i32 0, i32 0, i32 0, i64 1
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11, !amdgpu.noclobber !5
  %62 = fsub contract float %58, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = fcmp olt float %64, 0x39F0000000000000
  %66 = select i1 %65, float 0x41F0000000000000, float 1.000000e+00
  %67 = fmul float %64, %66
  %68 = tail call float @llvm.sqrt.f32(float %67)
  %69 = bitcast float %68 to i32
  %70 = add nsw i32 %69, -1
  %71 = bitcast i32 %70 to float
  %72 = add nsw i32 %69, 1
  %73 = bitcast i32 %72 to float
  %74 = tail call i1 @llvm.amdgcn.class.f32(float %67, i32 608)
  %75 = select i1 %65, float 0x3EF0000000000000, float 1.000000e+00
  %76 = fneg float %73
  %77 = tail call float @llvm.fma.f32(float %76, float %68, float %67)
  %78 = fcmp ogt float %77, 0.000000e+00
  %79 = fneg float %71
  %80 = tail call float @llvm.fma.f32(float %79, float %68, float %67)
  %81 = fcmp ole float %80, 0.000000e+00
  %82 = select i1 %81, float %71, float %68
  %83 = select i1 %78, float %73, float %82
  %84 = fmul float %75, %83
  %85 = select i1 %74, float %67, float %84
  br label %117

86:                                               ; preds = %21
  %87 = sext i32 %17 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = sext i32 %19 to i64
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %90, i32 0, i32 0, i32 0, i64 2
  %92 = load float, float addrspace(1)* %91, align 8, !tbaa !11, !amdgpu.noclobber !5
  %93 = fsub contract float %89, %92
  %94 = getelementptr inbounds float, float addrspace(1)* %3, i64 %90
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = fcmp olt float %95, 0x39F0000000000000
  %97 = select i1 %96, float 0x41F0000000000000, float 1.000000e+00
  %98 = fmul float %95, %97
  %99 = tail call float @llvm.sqrt.f32(float %98)
  %100 = bitcast float %99 to i32
  %101 = add nsw i32 %100, -1
  %102 = bitcast i32 %101 to float
  %103 = add nsw i32 %100, 1
  %104 = bitcast i32 %103 to float
  %105 = tail call i1 @llvm.amdgcn.class.f32(float %98, i32 608)
  %106 = select i1 %96, float 0x3EF0000000000000, float 1.000000e+00
  %107 = fneg float %104
  %108 = tail call float @llvm.fma.f32(float %107, float %99, float %98)
  %109 = fcmp ogt float %108, 0.000000e+00
  %110 = fneg float %102
  %111 = tail call float @llvm.fma.f32(float %110, float %99, float %98)
  %112 = fcmp ole float %111, 0.000000e+00
  %113 = select i1 %112, float %102, float %99
  %114 = select i1 %109, float %104, float %113
  %115 = fmul float %106, %114
  %116 = select i1 %105, float %98, float %115
  br label %117

117:                                              ; preds = %55, %86, %24
  %118 = phi float [ %54, %24 ], [ %116, %86 ], [ %85, %55 ]
  %119 = phi float [ %31, %24 ], [ %93, %86 ], [ %62, %55 ]
  %120 = fpext float %119 to double
  %121 = fpext float %118 to double
  %122 = fpext float %4 to double
  %123 = fmul contract double %122, %121
  %124 = fdiv contract double %120, %123
  %125 = fptrunc double %124 to float
  %126 = mul nsw i32 %17, %6
  %127 = add nsw i32 %126, %5
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  store float %125, float addrspace(1)* %129, align 4, !tbaa !7
  br label %130

130:                                              ; preds = %117, %8
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
