; ModuleID = '../data/hip_kernels/11580/52/main.cu'
source_filename = "../data/hip_kernels/11580/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23cuConvertRGBToHSVKernelPK15HIP_vector_typeIfLj4EEPS0_miib(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i64 %2, i32 %3, i32 %4, i1 %5) local_unnamed_addr #0 {
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
  br i1 %26, label %27, label %127

27:                                               ; preds = %6
  %28 = trunc i64 %2 to i32
  %29 = mul i32 %23, %28
  %30 = add i32 %29, %15
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 0
  %33 = load float, float addrspace(1)* %32, align 16, !amdgpu.noclobber !5
  %34 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 1
  %35 = load float, float addrspace(1)* %34, align 4, !amdgpu.noclobber !5
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 2
  %37 = load float, float addrspace(1)* %36, align 8, !amdgpu.noclobber !5
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 3
  %39 = load float, float addrspace(1)* %38, align 4, !amdgpu.noclobber !5
  %40 = tail call float @llvm.maxnum.f32(float %35, float %37)
  %41 = tail call float @llvm.maxnum.f32(float %33, float %40)
  %42 = tail call float @llvm.minnum.f32(float %35, float %37)
  %43 = tail call float @llvm.minnum.f32(float %33, float %42)
  %44 = fsub contract float %41, %43
  %45 = fcmp contract une float %44, 0.000000e+00
  br i1 %45, label %46, label %112

46:                                               ; preds = %27
  %47 = fcmp contract oeq float %41, %33
  br i1 %47, label %48, label %98

48:                                               ; preds = %46
  %49 = fsub contract float %35, %37
  %50 = fdiv contract float %49, %44
  %51 = tail call float @llvm.fabs.f32(float %50)
  %52 = fcmp ogt float %51, 6.000000e+00
  br i1 %52, label %53, label %90

53:                                               ; preds = %48
  %54 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %51)
  %55 = tail call float @llvm.amdgcn.frexp.mant.f32(float %51)
  %56 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 12)
  %57 = add i32 %54, -3
  %58 = icmp sgt i32 %57, 12
  br i1 %58, label %59, label %72

59:                                               ; preds = %53, %59
  %60 = phi float [ %69, %59 ], [ %56, %53 ]
  %61 = phi i32 [ %70, %59 ], [ %57, %53 ]
  %62 = fmul float %60, 0x3FE5555560000000
  %63 = tail call float @llvm.rint.f32(float %62)
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %64, float 1.500000e+00, float %60)
  %66 = fcmp olt float %65, 0.000000e+00
  %67 = select i1 %66, float 1.500000e+00, float -0.000000e+00
  %68 = fadd float %65, %67
  %69 = tail call float @llvm.amdgcn.ldexp.f32(float %68, i32 12)
  %70 = add nsw i32 %61, -12
  %71 = icmp ugt i32 %61, 24
  br i1 %71, label %59, label %72

72:                                               ; preds = %59, %53
  %73 = phi i32 [ %57, %53 ], [ %70, %59 ]
  %74 = phi float [ %56, %53 ], [ %69, %59 ]
  %75 = add nsw i32 %73, -11
  %76 = tail call float @llvm.amdgcn.ldexp.f32(float %74, i32 %75)
  %77 = fmul float %76, 0x3FE5555560000000
  %78 = tail call float @llvm.rint.f32(float %77)
  %79 = fneg float %78
  %80 = tail call float @llvm.fma.f32(float %79, float 1.500000e+00, float %76)
  %81 = fcmp olt float %80, 0.000000e+00
  %82 = select i1 %81, float 1.500000e+00, float -0.000000e+00
  %83 = fadd float %80, %82
  %84 = tail call float @llvm.amdgcn.ldexp.f32(float %83, i32 2)
  %85 = bitcast float %50 to i32
  %86 = and i32 %85, -2147483648
  %87 = bitcast float %84 to i32
  %88 = xor i32 %86, %87
  %89 = bitcast i32 %88 to float
  br label %94

90:                                               ; preds = %48
  %91 = fcmp oeq float %51, 6.000000e+00
  %92 = tail call float @llvm.copysign.f32(float 0.000000e+00, float %50)
  %93 = select i1 %91, float %92, float %50
  br label %94

94:                                               ; preds = %72, %90
  %95 = phi float [ %89, %72 ], [ %93, %90 ]
  %96 = tail call i1 @llvm.amdgcn.class.f32(float %50, i32 504)
  %97 = select i1 %96, float %95, float 0x7FF8000000000000
  br label %98

98:                                               ; preds = %94, %46
  %99 = phi float [ %97, %94 ], [ 0.000000e+00, %46 ]
  %100 = fcmp contract oeq float %41, %35
  br i1 %100, label %101, label %105

101:                                              ; preds = %98
  %102 = fsub contract float %37, %33
  %103 = fdiv contract float %102, %44
  %104 = fadd contract float %103, 2.000000e+00
  br label %105

105:                                              ; preds = %101, %98
  %106 = phi float [ %104, %101 ], [ %99, %98 ]
  %107 = fcmp contract oeq float %41, %37
  br i1 %107, label %108, label %112

108:                                              ; preds = %105
  %109 = fsub contract float %33, %35
  %110 = fdiv contract float %109, %44
  %111 = fadd contract float %110, 4.000000e+00
  br label %112

112:                                              ; preds = %105, %108, %27
  %113 = phi float [ %111, %108 ], [ %106, %105 ], [ 0.000000e+00, %27 ]
  %114 = fmul contract float %113, 6.000000e+01
  %115 = fdiv contract float %44, %41
  %116 = select i1 %45, float %115, float 0.000000e+00
  %117 = fcmp contract olt float %114, 0.000000e+00
  %118 = fadd contract float %114, 3.600000e+02
  %119 = select i1 %117, float %118, float %114
  %120 = fdiv contract float %119, 3.600000e+02
  %121 = select i1 %5, float %120, float %119
  %122 = insertelement <4 x float> undef, float %121, i64 0
  %123 = insertelement <4 x float> %122, float %116, i64 1
  %124 = insertelement <4 x float> %123, float %41, i64 2
  %125 = insertelement <4 x float> %124, float %39, i64 3
  %126 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %31, i32 0, i32 0, i32 0
  store <4 x float> %125, <4 x float> addrspace(1)* %126, align 16
  br label %127

127:                                              ; preds = %112, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
