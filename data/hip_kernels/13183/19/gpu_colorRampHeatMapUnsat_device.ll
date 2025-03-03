; ModuleID = '../data/hip_kernels/13183/19/main.cu'
source_filename = "../data/hip_kernels/13183/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" }
%"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" = type { [3 x i8] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25gpu_colorRampHeatMapUnsatP15HIP_vector_typeIhLj3EEPKfiiff(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float %4, float %5) local_unnamed_addr #0 {
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
  br i1 %26, label %27, label %135

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %2
  %29 = add nsw i32 %28, %15
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fcmp uno float %33, 0.000000e+00
  br i1 %34, label %132, label %35

35:                                               ; preds = %27
  %36 = fsub contract float %33, %4
  %37 = fsub contract float %5, %4
  %38 = fdiv contract float %36, %37
  %39 = tail call float @llvm.minnum.f32(float %38, float 1.000000e+00)
  %40 = tail call float @llvm.maxnum.f32(float %39, float 0.000000e+00)
  %41 = fcmp contract oeq float %40, 1.000000e+00
  br i1 %41, label %87, label %42

42:                                               ; preds = %35
  %43 = tail call float @llvm.fabs.f32(float %40)
  %44 = fcmp ogt float %43, 2.500000e-01
  br i1 %44, label %45, label %78

45:                                               ; preds = %42
  %46 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %43)
  %47 = tail call float @llvm.amdgcn.frexp.mant.f32(float %43)
  %48 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 12)
  %49 = add i32 %46, 1
  %50 = icmp sgt i32 %49, 12
  br i1 %50, label %51, label %62

51:                                               ; preds = %45, %51
  %52 = phi float [ %59, %51 ], [ %48, %45 ]
  %53 = phi i32 [ %60, %51 ], [ %49, %45 ]
  %54 = tail call float @llvm.rint.f32(float %52)
  %55 = fsub float %52, %54
  %56 = fcmp olt float %55, 0.000000e+00
  %57 = select i1 %56, float 1.000000e+00, float -0.000000e+00
  %58 = fadd float %55, %57
  %59 = tail call float @llvm.amdgcn.ldexp.f32(float %58, i32 12)
  %60 = add nsw i32 %53, -12
  %61 = icmp ugt i32 %53, 24
  br i1 %61, label %51, label %62

62:                                               ; preds = %51, %45
  %63 = phi i32 [ %49, %45 ], [ %60, %51 ]
  %64 = phi float [ %48, %45 ], [ %59, %51 ]
  %65 = add nsw i32 %63, -11
  %66 = tail call float @llvm.amdgcn.ldexp.f32(float %64, i32 %65)
  %67 = tail call float @llvm.rint.f32(float %66)
  %68 = fsub float %66, %67
  %69 = fcmp olt float %68, 0.000000e+00
  %70 = select i1 %69, float 1.000000e+00, float -0.000000e+00
  %71 = fadd float %68, %70
  %72 = tail call float @llvm.amdgcn.ldexp.f32(float %71, i32 -2)
  %73 = bitcast float %40 to i32
  %74 = and i32 %73, -2147483648
  %75 = bitcast float %72 to i32
  %76 = xor i32 %74, %75
  %77 = bitcast i32 %76 to float
  br label %82

78:                                               ; preds = %42
  %79 = fcmp oeq float %43, 2.500000e-01
  %80 = tail call float @llvm.copysign.f32(float 0.000000e+00, float %40)
  %81 = select i1 %79, float %80, float %40
  br label %82

82:                                               ; preds = %62, %78
  %83 = phi float [ %77, %62 ], [ %81, %78 ]
  %84 = tail call i1 @llvm.amdgcn.class.f32(float %40, i32 504)
  %85 = fmul contract float %83, 4.000000e+00
  %86 = select i1 %84, float %85, float 0x7FF8000000000000
  br label %87

87:                                               ; preds = %35, %82
  %88 = phi float [ %86, %82 ], [ 1.000000e+00, %35 ]
  %89 = fcmp contract olt float %40, 2.500000e-01
  br i1 %89, label %98, label %90

90:                                               ; preds = %87
  %91 = fcmp contract olt float %40, 5.000000e-01
  br i1 %91, label %98, label %92

92:                                               ; preds = %90
  %93 = fcmp contract olt float %40, 7.500000e-01
  %94 = select i1 %93, i32 4162758, i32 3556288
  %95 = select i1 %93, i32 9038065, i32 4162758
  %96 = select i1 %93, float 2.320000e+02, float 1.320000e+02
  %97 = select i1 %93, float 1.320000e+02, float 6.700000e+01
  br label %98

98:                                               ; preds = %92, %90, %87
  %99 = phi i32 [ 9158432, %87 ], [ 9038065, %90 ], [ %94, %92 ]
  %100 = phi float [ 1.910000e+02, %87 ], [ 2.320000e+02, %90 ], [ %97, %92 ]
  %101 = phi i32 [ 9658904, %87 ], [ 9158432, %90 ], [ %95, %92 ]
  %102 = phi float [ 9.800000e+01, %87 ], [ 1.910000e+02, %90 ], [ %96, %92 ]
  %103 = lshr i32 %99, 16
  %104 = lshr i32 %101, 16
  %105 = fsub contract float 1.000000e+00, %88
  %106 = and i32 %101, 255
  %107 = sitofp i32 %106 to float
  %108 = fmul contract float %105, %107
  %109 = and i32 %99, 247
  %110 = sitofp i32 %109 to float
  %111 = fmul contract float %88, %110
  %112 = fadd contract float %111, %108
  %113 = fptoui float %112 to i8
  %114 = fmul contract float %105, %102
  %115 = fmul contract float %88, %100
  %116 = fadd contract float %115, %114
  %117 = fptoui float %116 to i8
  %118 = sitofp i32 %104 to float
  %119 = fmul contract float %105, %118
  %120 = sitofp i32 %103 to float
  %121 = fmul contract float %88, %120
  %122 = fadd contract float %121, %119
  %123 = fptoui float %122 to i8
  %124 = zext i8 %123 to i32
  %125 = shl nuw nsw i32 %124, 16
  %126 = zext i8 %117 to i32
  %127 = shl nuw nsw i32 %126, 8
  %128 = or i32 %125, %127
  %129 = zext i8 %113 to i32
  %130 = or i32 %128, %129
  %131 = trunc i32 %130 to i24
  br label %132

132:                                              ; preds = %27, %98
  %133 = phi i24 [ %131, %98 ], [ -1, %27 ]
  %134 = bitcast %struct.HIP_vector_type addrspace(1)* %31 to i24 addrspace(1)*
  store i24 %133, i24 addrspace(1)* %134, align 1
  br label %135

135:                                              ; preds = %132, %6
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
