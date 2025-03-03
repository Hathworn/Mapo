; ModuleID = '../data/hip_kernels/11580/53/main.cu'
source_filename = "../data/hip_kernels/11580/53/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23cuConvertHSVToRGBKernelPK15HIP_vector_typeIfLj4EEPS0_miib(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i64 %2, i32 %3, i32 %4, i1 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %3
  %25 = icmp slt i32 %23, %4
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %102

27:                                               ; preds = %6
  %28 = trunc i64 %2 to i32
  %29 = mul i32 %23, %28
  %30 = add i32 %29, %15
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 1
  %33 = load float, float addrspace(1)* %32, align 4, !amdgpu.noclobber !5
  %34 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 2
  %35 = load float, float addrspace(1)* %34, align 8, !amdgpu.noclobber !5
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 3
  %37 = load float, float addrspace(1)* %36, align 4, !amdgpu.noclobber !5
  %38 = fcmp contract une float %33, 0.000000e+00
  br i1 %38, label %42, label %39

39:                                               ; preds = %27
  %40 = insertelement <4 x float> undef, float %35, i64 0
  %41 = shufflevector <4 x float> %40, <4 x float> poison, <4 x i32> <i32 0, i32 0, i32 0, i32 undef>
  br label %98

42:                                               ; preds = %27
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 0
  %44 = load float, float addrspace(1)* %43, align 16, !amdgpu.noclobber !5
  %45 = fdiv contract float %44, 6.000000e+01
  %46 = tail call float @llvm.floor.f32(float %45)
  %47 = fptosi float %46 to i32
  %48 = sitofp i32 %47 to float
  %49 = fsub contract float %45, %48
  %50 = fsub contract float 1.000000e+00, %33
  %51 = fmul contract float %35, %50
  %52 = fmul contract float %33, %49
  %53 = fsub contract float 1.000000e+00, %52
  %54 = fmul contract float %35, %53
  %55 = fsub contract float 1.000000e+00, %49
  %56 = fmul contract float %33, %55
  %57 = fsub contract float 1.000000e+00, %56
  %58 = fmul contract float %35, %57
  switch i32 %47, label %95 [
    i32 0, label %59
    i32 1, label %65
    i32 2, label %71
    i32 3, label %77
    i32 4, label %83
    i32 5, label %89
  ]

59:                                               ; preds = %42
  %60 = insertelement <4 x float> undef, float %35, i64 0
  %61 = insertelement <4 x float> %60, float %58, i64 1
  %62 = insertelement <4 x float> %61, float %51, i64 2
  %63 = insertelement <4 x float> %62, float %37, i64 3
  %64 = insertvalue %struct.HIP_vector_base poison, <4 x float> %63, 0, 0
  br label %95

65:                                               ; preds = %42
  %66 = insertelement <4 x float> undef, float %54, i64 0
  %67 = insertelement <4 x float> %66, float %35, i64 1
  %68 = insertelement <4 x float> %67, float %51, i64 2
  %69 = insertelement <4 x float> %68, float %37, i64 3
  %70 = insertvalue %struct.HIP_vector_base poison, <4 x float> %69, 0, 0
  br label %95

71:                                               ; preds = %42
  %72 = insertelement <4 x float> undef, float %51, i64 0
  %73 = insertelement <4 x float> %72, float %35, i64 1
  %74 = insertelement <4 x float> %73, float %58, i64 2
  %75 = insertelement <4 x float> %74, float %37, i64 3
  %76 = insertvalue %struct.HIP_vector_base poison, <4 x float> %75, 0, 0
  br label %95

77:                                               ; preds = %42
  %78 = insertelement <4 x float> undef, float %51, i64 0
  %79 = insertelement <4 x float> %78, float %54, i64 1
  %80 = insertelement <4 x float> %79, float %35, i64 2
  %81 = insertelement <4 x float> %80, float %37, i64 3
  %82 = insertvalue %struct.HIP_vector_base poison, <4 x float> %81, 0, 0
  br label %95

83:                                               ; preds = %42
  %84 = insertelement <4 x float> undef, float %58, i64 0
  %85 = insertelement <4 x float> %84, float %51, i64 1
  %86 = insertelement <4 x float> %85, float %35, i64 2
  %87 = insertelement <4 x float> %86, float %37, i64 3
  %88 = insertvalue %struct.HIP_vector_base poison, <4 x float> %87, 0, 0
  br label %95

89:                                               ; preds = %42
  %90 = insertelement <4 x float> undef, float %35, i64 0
  %91 = insertelement <4 x float> %90, float %51, i64 1
  %92 = insertelement <4 x float> %91, float %54, i64 2
  %93 = insertelement <4 x float> %92, float %37, i64 3
  %94 = insertvalue %struct.HIP_vector_base poison, <4 x float> %93, 0, 0
  br label %95

95:                                               ; preds = %42, %65, %77, %89, %83, %71, %59
  %96 = phi %struct.HIP_vector_base [ %64, %59 ], [ %70, %65 ], [ %76, %71 ], [ %82, %77 ], [ %88, %83 ], [ %94, %89 ], [ zeroinitializer, %42 ]
  %97 = extractvalue %struct.HIP_vector_base %96, 0, 0
  br label %98

98:                                               ; preds = %95, %39
  %99 = phi <4 x float> [ %41, %39 ], [ %97, %95 ]
  %100 = insertelement <4 x float> %99, float %37, i64 3
  %101 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %31, i32 0, i32 0, i32 0
  store <4 x float> %100, <4 x float> addrspace(1)* %101, align 16
  br label %102

102:                                              ; preds = %98, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
