; ModuleID = '../data/hip_kernels/13183/20/main.cu'
source_filename = "../data/hip_kernels/13183/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25gpu_colorRampHeatMapUnsatP15HIP_vector_typeIhLj4EEPKfiiff(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float %4, float %5) local_unnamed_addr #0 {
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
  %24 = icmp slt i32 %15, %2
  %25 = icmp slt i32 %23, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %130

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %2
  %29 = add nsw i32 %28, %15
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fcmp uno float %33, 0.000000e+00
  br i1 %34, label %35, label %37

35:                                               ; preds = %27
  %36 = bitcast %struct.HIP_vector_type addrspace(1)* %31 to i32 addrspace(1)*
  store i32 0, i32 addrspace(1)* %36, align 4
  br label %130

37:                                               ; preds = %27
  %38 = fsub contract float %33, %4
  %39 = fsub contract float %5, %4
  %40 = fdiv contract float %38, %39
  %41 = tail call float @llvm.minnum.f32(float %40, float 1.000000e+00)
  %42 = tail call float @llvm.maxnum.f32(float %41, float 0.000000e+00)
  %43 = fcmp contract oeq float %42, 1.000000e+00
  br i1 %43, label %89, label %44

44:                                               ; preds = %37
  %45 = tail call float @llvm.fabs.f32(float %42)
  %46 = fcmp ogt float %45, 2.500000e-01
  br i1 %46, label %47, label %80

47:                                               ; preds = %44
  %48 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %45)
  %49 = tail call float @llvm.amdgcn.frexp.mant.f32(float %45)
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 12)
  %51 = add i32 %48, 1
  %52 = icmp sgt i32 %51, 12
  br i1 %52, label %53, label %64

53:                                               ; preds = %47, %53
  %54 = phi float [ %61, %53 ], [ %50, %47 ]
  %55 = phi i32 [ %62, %53 ], [ %51, %47 ]
  %56 = tail call float @llvm.rint.f32(float %54)
  %57 = fsub float %54, %56
  %58 = fcmp olt float %57, 0.000000e+00
  %59 = select i1 %58, float 1.000000e+00, float -0.000000e+00
  %60 = fadd float %57, %59
  %61 = tail call float @llvm.amdgcn.ldexp.f32(float %60, i32 12)
  %62 = add nsw i32 %55, -12
  %63 = icmp ugt i32 %55, 24
  br i1 %63, label %53, label %64

64:                                               ; preds = %53, %47
  %65 = phi i32 [ %51, %47 ], [ %62, %53 ]
  %66 = phi float [ %50, %47 ], [ %61, %53 ]
  %67 = add nsw i32 %65, -11
  %68 = tail call float @llvm.amdgcn.ldexp.f32(float %66, i32 %67)
  %69 = tail call float @llvm.rint.f32(float %68)
  %70 = fsub float %68, %69
  %71 = fcmp olt float %70, 0.000000e+00
  %72 = select i1 %71, float 1.000000e+00, float -0.000000e+00
  %73 = fadd float %70, %72
  %74 = tail call float @llvm.amdgcn.ldexp.f32(float %73, i32 -2)
  %75 = bitcast float %42 to i32
  %76 = and i32 %75, -2147483648
  %77 = bitcast float %74 to i32
  %78 = xor i32 %76, %77
  %79 = bitcast i32 %78 to float
  br label %84

80:                                               ; preds = %44
  %81 = fcmp oeq float %45, 2.500000e-01
  %82 = tail call float @llvm.copysign.f32(float 0.000000e+00, float %42)
  %83 = select i1 %81, float %82, float %42
  br label %84

84:                                               ; preds = %64, %80
  %85 = phi float [ %79, %64 ], [ %83, %80 ]
  %86 = tail call i1 @llvm.amdgcn.class.f32(float %42, i32 504)
  %87 = fmul contract float %85, 4.000000e+00
  %88 = select i1 %86, float %87, float 0x7FF8000000000000
  br label %89

89:                                               ; preds = %37, %84
  %90 = phi float [ %88, %84 ], [ 1.000000e+00, %37 ]
  %91 = fcmp contract olt float %42, 2.500000e-01
  br i1 %91, label %100, label %92

92:                                               ; preds = %89
  %93 = fcmp contract olt float %42, 5.000000e-01
  br i1 %93, label %100, label %94

94:                                               ; preds = %92
  %95 = fcmp contract olt float %42, 7.500000e-01
  %96 = select i1 %95, i32 4162758, i32 3556288
  %97 = select i1 %95, i32 9038065, i32 4162758
  %98 = select i1 %95, float 2.320000e+02, float 1.320000e+02
  %99 = select i1 %95, float 1.320000e+02, float 6.700000e+01
  br label %100

100:                                              ; preds = %94, %92, %89
  %101 = phi i32 [ 9158432, %89 ], [ 9038065, %92 ], [ %96, %94 ]
  %102 = phi float [ 1.910000e+02, %89 ], [ 2.320000e+02, %92 ], [ %99, %94 ]
  %103 = phi i32 [ 9658904, %89 ], [ 9158432, %92 ], [ %97, %94 ]
  %104 = phi float [ 9.800000e+01, %89 ], [ 1.910000e+02, %92 ], [ %98, %94 ]
  %105 = lshr i32 %101, 16
  %106 = lshr i32 %103, 16
  %107 = fsub contract float 1.000000e+00, %90
  %108 = and i32 %103, 255
  %109 = sitofp i32 %108 to float
  %110 = fmul contract float %107, %109
  %111 = and i32 %101, 247
  %112 = sitofp i32 %111 to float
  %113 = fmul contract float %90, %112
  %114 = fadd contract float %113, %110
  %115 = fptoui float %114 to i8
  %116 = fmul contract float %107, %104
  %117 = fmul contract float %90, %102
  %118 = fadd contract float %117, %116
  %119 = fptoui float %118 to i8
  %120 = sitofp i32 %106 to float
  %121 = fmul contract float %107, %120
  %122 = sitofp i32 %105 to float
  %123 = fmul contract float %90, %122
  %124 = fadd contract float %123, %121
  %125 = fptoui float %124 to i8
  %126 = insertelement <4 x i8> <i8 poison, i8 poison, i8 poison, i8 -1>, i8 %115, i64 0
  %127 = insertelement <4 x i8> %126, i8 %119, i64 1
  %128 = insertelement <4 x i8> %127, i8 %125, i64 2
  %129 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %31, i64 0, i32 0, i32 0, i32 0
  store <4 x i8> %128, <4 x i8> addrspace(1)* %129, align 4
  br label %130

130:                                              ; preds = %35, %100, %6
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
