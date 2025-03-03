; ModuleID = '../data/hip_kernels/2107/2/main.cu'
source_filename = "../data/hip_kernels/2107/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

@__const._Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf.colorwheelR = private unnamed_addr addrspace(4) constant [55 x float] [float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.130000e+02, float 1.700000e+02, float 1.280000e+02, float 8.500000e+01, float 4.300000e+01, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 1.900000e+01, float 3.900000e+01, float 5.800000e+01, float 7.800000e+01, float 9.800000e+01, float 1.170000e+02, float 1.370000e+02, float 1.560000e+02, float 1.760000e+02, float 1.960000e+02, float 2.150000e+02, float 2.350000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02], align 16
@__const._Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf.colorwheelG = private unnamed_addr addrspace(4) constant <{ [36 x float], [19 x float] }> <{ [36 x float] [float 0.000000e+00, float 1.700000e+01, float 3.400000e+01, float 5.100000e+01, float 6.800000e+01, float 8.500000e+01, float 1.020000e+02, float 1.190000e+02, float 1.360000e+02, float 1.530000e+02, float 1.700000e+02, float 1.870000e+02, float 2.040000e+02, float 2.210000e+02, float 2.380000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.320000e+02, float 2.090000e+02, float 1.860000e+02, float 1.630000e+02, float 1.400000e+02, float 1.160000e+02, float 9.300000e+01, float 7.000000e+01, float 4.700000e+01, float 2.400000e+01], [19 x float] zeroinitializer }>, align 16
@__const._Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf.colorwheelB = private unnamed_addr addrspace(4) constant [55 x float] [float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 6.300000e+01, float 1.270000e+02, float 1.910000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.130000e+02, float 1.700000e+02, float 1.280000e+02, float 8.500000e+01, float 4.300000e+01], align 16

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %3
  %26 = icmp slt i32 %24, %2
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %161

28:                                               ; preds = %7
  %29 = mul nsw i32 %16, %4
  %30 = add nsw i32 %24, %29
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fdiv contract float %33, %6
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = fdiv contract float %36, %6
  %38 = fmul contract float %34, %34
  %39 = fmul contract float %37, %37
  %40 = fadd contract float %38, %39
  %41 = fcmp olt float %40, 0x39F0000000000000
  %42 = select i1 %41, float 0x41F0000000000000, float 1.000000e+00
  %43 = fmul float %40, %42
  %44 = tail call float @llvm.sqrt.f32(float %43)
  %45 = bitcast float %44 to i32
  %46 = add nsw i32 %45, -1
  %47 = bitcast i32 %46 to float
  %48 = add nsw i32 %45, 1
  %49 = bitcast i32 %48 to float
  %50 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 608)
  %51 = select i1 %41, float 0x3EF0000000000000, float 1.000000e+00
  %52 = fneg float %49
  %53 = tail call float @llvm.fma.f32(float %52, float %44, float %43)
  %54 = fcmp ogt float %53, 0.000000e+00
  %55 = fneg float %47
  %56 = tail call float @llvm.fma.f32(float %55, float %44, float %43)
  %57 = fcmp ole float %56, 0.000000e+00
  %58 = select i1 %57, float %47, float %44
  %59 = select i1 %54, float %49, float %58
  %60 = fmul float %51, %59
  %61 = select i1 %50, float %43, float %60
  %62 = fneg contract float %37
  %63 = fneg contract float %34
  %64 = tail call float @llvm.fabs.f32(float %63)
  %65 = tail call float @llvm.fabs.f32(float %62)
  %66 = tail call float @llvm.minnum.f32(float %64, float %65)
  %67 = tail call float @llvm.maxnum.f32(float %64, float %65)
  %68 = fdiv float %66, %67, !fpmath !11
  %69 = fmul float %68, %68
  %70 = tail call float @llvm.fmuladd.f32(float %69, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %71 = tail call float @llvm.fmuladd.f32(float %69, float %70, float 0x3FA53F67E0000000)
  %72 = tail call float @llvm.fmuladd.f32(float %69, float %71, float 0xBFB2FA9AE0000000)
  %73 = tail call float @llvm.fmuladd.f32(float %69, float %72, float 0x3FBB263640000000)
  %74 = tail call float @llvm.fmuladd.f32(float %69, float %73, float 0xBFC22C1CC0000000)
  %75 = tail call float @llvm.fmuladd.f32(float %69, float %74, float 0x3FC99717E0000000)
  %76 = tail call float @llvm.fmuladd.f32(float %69, float %75, float 0xBFD5554C40000000)
  %77 = fmul float %69, %76
  %78 = tail call float @llvm.fmuladd.f32(float %68, float %77, float %68)
  %79 = fsub float 0x3FF921FB60000000, %78
  %80 = fcmp ogt float %65, %64
  %81 = select i1 %80, float %79, float %78
  %82 = fsub float 0x400921FB60000000, %81
  %83 = fcmp ogt float %34, 0.000000e+00
  %84 = select i1 %83, float %82, float %81
  %85 = bitcast float %63 to i32
  %86 = icmp slt i32 %85, 0
  %87 = select i1 %86, float 0x400921FB60000000, float 0.000000e+00
  %88 = fcmp oeq float %37, 0.000000e+00
  %89 = select i1 %88, float %87, float %84
  %90 = select i1 %83, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %91 = fcmp oeq float %64, 0x7FF0000000000000
  %92 = fcmp oeq float %65, 0x7FF0000000000000
  %93 = and i1 %91, %92
  %94 = select i1 %93, float %90, float %89
  %95 = fcmp uno float %34, %37
  %96 = select i1 %95, float 0x7FF8000000000000, float %94
  %97 = tail call float @llvm.copysign.f32(float %96, float %62)
  %98 = fdiv contract float %97, 0x400921FA00000000
  %99 = fadd contract float %98, 1.000000e+00
  %100 = fmul contract float %99, 5.000000e-01
  %101 = fmul contract float %100, 5.400000e+01
  %102 = tail call float @llvm.floor.f32(float %101)
  %103 = fptosi float %102 to i32
  %104 = add nsw i32 %103, 1
  %105 = icmp eq i32 %104, 55
  %106 = select i1 %105, i32 1, i32 %104
  %107 = sitofp i32 %103 to float
  %108 = fsub contract float %101, %107
  %109 = fsub contract float 1.000000e+00, %108
  %110 = sext i32 %103 to i64
  %111 = getelementptr [55 x float], [55 x float] addrspace(4)* @__const._Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf.colorwheelR, i64 0, i64 %110
  %112 = load float, float addrspace(4)* %111, align 4, !tbaa !7
  %113 = fdiv contract float %112, 2.550000e+02
  %114 = fmul contract float %113, %109
  %115 = sext i32 %106 to i64
  %116 = getelementptr [55 x float], [55 x float] addrspace(4)* @__const._Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf.colorwheelR, i64 0, i64 %115
  %117 = load float, float addrspace(4)* %116, align 4, !tbaa !7
  %118 = fdiv contract float %117, 2.550000e+02
  %119 = fmul contract float %118, %108
  %120 = fadd contract float %119, %114
  %121 = getelementptr [55 x float], [55 x float] addrspace(4)* bitcast (<{ [36 x float], [19 x float] }> addrspace(4)* @__const._Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf.colorwheelG to [55 x float] addrspace(4)*), i64 0, i64 %110
  %122 = load float, float addrspace(4)* %121, align 4, !tbaa !7
  %123 = fdiv contract float %122, 2.550000e+02
  %124 = fmul contract float %123, %109
  %125 = getelementptr [55 x float], [55 x float] addrspace(4)* bitcast (<{ [36 x float], [19 x float] }> addrspace(4)* @__const._Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf.colorwheelG to [55 x float] addrspace(4)*), i64 0, i64 %115
  %126 = load float, float addrspace(4)* %125, align 4, !tbaa !7
  %127 = fdiv contract float %126, 2.550000e+02
  %128 = fmul contract float %127, %108
  %129 = fadd contract float %128, %124
  %130 = getelementptr [55 x float], [55 x float] addrspace(4)* @__const._Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf.colorwheelB, i64 0, i64 %110
  %131 = load float, float addrspace(4)* %130, align 4, !tbaa !7
  %132 = fdiv contract float %131, 2.550000e+02
  %133 = fmul contract float %132, %109
  %134 = getelementptr [55 x float], [55 x float] addrspace(4)* @__const._Z18ComputeColorKernelPfS_iiiP15HIP_vector_typeIfLj3EEf.colorwheelB, i64 0, i64 %115
  %135 = load float, float addrspace(4)* %134, align 4, !tbaa !7
  %136 = fdiv contract float %135, 2.550000e+02
  %137 = fmul contract float %136, %108
  %138 = fadd contract float %137, %133
  %139 = fcmp contract ugt float %61, 1.000000e+00
  br i1 %139, label %150, label %140

140:                                              ; preds = %28
  %141 = fsub contract float 1.000000e+00, %120
  %142 = fmul contract float %61, %141
  %143 = fsub contract float 1.000000e+00, %142
  %144 = fsub contract float 1.000000e+00, %129
  %145 = fmul contract float %61, %144
  %146 = fsub contract float 1.000000e+00, %145
  %147 = fsub contract float 1.000000e+00, %138
  %148 = fmul contract float %61, %147
  %149 = fsub contract float 1.000000e+00, %148
  br label %154

150:                                              ; preds = %28
  %151 = fmul contract float %120, 7.500000e-01
  %152 = fmul contract float %129, 7.500000e-01
  %153 = fmul contract float %138, 7.500000e-01
  br label %154

154:                                              ; preds = %150, %140
  %155 = phi float [ %143, %140 ], [ %151, %150 ]
  %156 = phi float [ %146, %140 ], [ %152, %150 ]
  %157 = phi float [ %149, %140 ], [ %153, %150 ]
  %158 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %31, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %155, float addrspace(1)* %158, align 4, !tbaa !12
  %159 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %31, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %156, float addrspace(1)* %159, align 4, !tbaa !12
  %160 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %31, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %157, float addrspace(1)* %160, align 4, !tbaa !12
  br label %161

161:                                              ; preds = %154, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!11 = !{float 2.500000e+00}
!12 = !{!9, !9, i64 0}
