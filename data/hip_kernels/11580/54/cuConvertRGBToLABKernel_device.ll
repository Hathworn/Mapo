; ModuleID = '../data/hip_kernels/11580/54/main.cu'
source_filename = "../data/hip_kernels/11580/54/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23cuConvertRGBToLABKernelPK15HIP_vector_typeIfLj4EEPS0_miib(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i64 %2, i32 %3, i32 %4, i1 %5) local_unnamed_addr #0 {
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
  br i1 %26, label %27, label %153

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
  br i1 %5, label %45, label %40

40:                                               ; preds = %27
  %41 = fdiv contract float %33, 2.550000e+02
  %42 = fdiv contract float %35, 2.550000e+02
  %43 = fdiv contract float %37, 2.550000e+02
  %44 = fdiv contract float %39, 2.550000e+02
  br label %45

45:                                               ; preds = %40, %27
  %46 = phi float [ %33, %27 ], [ %41, %40 ]
  %47 = phi float [ %35, %27 ], [ %42, %40 ]
  %48 = phi float [ %37, %27 ], [ %43, %40 ]
  %49 = phi float [ %39, %27 ], [ %44, %40 ]
  %50 = fmul contract float %46, 0x3FDA65AF80000000
  %51 = fmul contract float %47, 0x3FD6E286E0000000
  %52 = fadd contract float %50, %51
  %53 = fmul contract float %48, 0x3FC7189380000000
  %54 = fadd contract float %52, %53
  %55 = fmul contract float %46, 0x3FCB38DDA0000000
  %56 = fmul contract float %47, 0x3FE6E286E0000000
  %57 = fadd contract float %55, %56
  %58 = fmul contract float %48, 0x3FB27A0FA0000000
  %59 = fadd contract float %57, %58
  %60 = fmul contract float %46, 0x3F93CC4420000000
  %61 = fmul contract float %47, 0x3FBE835DE0000000
  %62 = fadd contract float %60, %61
  %63 = fmul contract float %48, 0x3FEE68E420000000
  %64 = fadd contract float %62, %63
  %65 = fdiv contract float %54, 0x3FEE6A22C0000000
  %66 = fdiv contract float %64, 0x3FF16B8960000000
  %67 = fcmp contract ogt float %65, 0x3F822354E0000000
  br i1 %67, label %68, label %86

68:                                               ; preds = %45
  %69 = tail call float @llvm.fabs.f32(float %65)
  %70 = tail call i1 @llvm.amdgcn.class.f32(float %65, i32 144)
  %71 = tail call float @llvm.amdgcn.ldexp.f32(float %69, i32 24)
  %72 = select i1 %70, float %71, float %69
  %73 = tail call float @llvm.log2.f32(float %72)
  %74 = fmul float %73, 0x3FD5555560000000
  %75 = tail call float @llvm.exp2.f32(float %74)
  %76 = fmul float %75, %75
  %77 = tail call float @llvm.amdgcn.rcp.f32(float %76)
  %78 = fneg float %72
  %79 = tail call float @llvm.fmuladd.f32(float %77, float %78, float %75)
  %80 = tail call float @llvm.fmuladd.f32(float %79, float 0xBFD5555560000000, float %75)
  %81 = tail call float @llvm.amdgcn.ldexp.f32(float %80, i32 -8)
  %82 = select i1 %70, float %81, float %80
  %83 = tail call i1 @llvm.amdgcn.class.f32(float %65, i32 615)
  %84 = select i1 %83, float %65, float %82
  %85 = tail call float @llvm.copysign.f32(float %84, float %65)
  br label %90

86:                                               ; preds = %45
  %87 = fmul contract float %65, 0x408C3A5EE0000000
  %88 = fadd contract float %87, 1.600000e+01
  %89 = fdiv contract float %88, 1.160000e+02
  br label %90

90:                                               ; preds = %86, %68
  %91 = phi float [ %85, %68 ], [ %89, %86 ]
  %92 = fcmp contract ogt float %59, 0x3F822354E0000000
  br i1 %92, label %93, label %111

93:                                               ; preds = %90
  %94 = tail call float @llvm.fabs.f32(float %59)
  %95 = tail call i1 @llvm.amdgcn.class.f32(float %59, i32 144)
  %96 = tail call float @llvm.amdgcn.ldexp.f32(float %94, i32 24)
  %97 = select i1 %95, float %96, float %94
  %98 = tail call float @llvm.log2.f32(float %97)
  %99 = fmul float %98, 0x3FD5555560000000
  %100 = tail call float @llvm.exp2.f32(float %99)
  %101 = fmul float %100, %100
  %102 = tail call float @llvm.amdgcn.rcp.f32(float %101)
  %103 = fneg float %97
  %104 = tail call float @llvm.fmuladd.f32(float %102, float %103, float %100)
  %105 = tail call float @llvm.fmuladd.f32(float %104, float 0xBFD5555560000000, float %100)
  %106 = tail call float @llvm.amdgcn.ldexp.f32(float %105, i32 -8)
  %107 = select i1 %95, float %106, float %105
  %108 = tail call i1 @llvm.amdgcn.class.f32(float %59, i32 615)
  %109 = select i1 %108, float %59, float %107
  %110 = tail call float @llvm.copysign.f32(float %109, float %59)
  br label %115

111:                                              ; preds = %90
  %112 = fmul contract float %59, 0x408C3A5EE0000000
  %113 = fadd contract float %112, 1.600000e+01
  %114 = fdiv contract float %113, 1.160000e+02
  br label %115

115:                                              ; preds = %111, %93
  %116 = phi float [ %110, %93 ], [ %114, %111 ]
  %117 = fcmp contract ogt float %66, 0x3F822354E0000000
  br i1 %117, label %118, label %136

118:                                              ; preds = %115
  %119 = tail call float @llvm.fabs.f32(float %66)
  %120 = tail call i1 @llvm.amdgcn.class.f32(float %66, i32 144)
  %121 = tail call float @llvm.amdgcn.ldexp.f32(float %119, i32 24)
  %122 = select i1 %120, float %121, float %119
  %123 = tail call float @llvm.log2.f32(float %122)
  %124 = fmul float %123, 0x3FD5555560000000
  %125 = tail call float @llvm.exp2.f32(float %124)
  %126 = fmul float %125, %125
  %127 = tail call float @llvm.amdgcn.rcp.f32(float %126)
  %128 = fneg float %122
  %129 = tail call float @llvm.fmuladd.f32(float %127, float %128, float %125)
  %130 = tail call float @llvm.fmuladd.f32(float %129, float 0xBFD5555560000000, float %125)
  %131 = tail call float @llvm.amdgcn.ldexp.f32(float %130, i32 -8)
  %132 = select i1 %120, float %131, float %130
  %133 = tail call i1 @llvm.amdgcn.class.f32(float %66, i32 615)
  %134 = select i1 %133, float %66, float %132
  %135 = tail call float @llvm.copysign.f32(float %134, float %66)
  br label %140

136:                                              ; preds = %115
  %137 = fmul contract float %66, 0x408C3A5EE0000000
  %138 = fadd contract float %137, 1.600000e+01
  %139 = fdiv contract float %138, 1.160000e+02
  br label %140

140:                                              ; preds = %136, %118
  %141 = phi float [ %135, %118 ], [ %139, %136 ]
  %142 = fmul contract float %116, 1.160000e+02
  %143 = fadd contract float %142, -1.600000e+01
  %144 = fsub contract float %91, %116
  %145 = fmul contract float %144, 5.000000e+02
  %146 = fsub contract float %116, %141
  %147 = fmul contract float %146, 2.000000e+02
  %148 = insertelement <4 x float> undef, float %143, i64 0
  %149 = insertelement <4 x float> %148, float %145, i64 1
  %150 = insertelement <4 x float> %149, float %147, i64 2
  %151 = insertelement <4 x float> %150, float %49, i64 3
  %152 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %31, i32 0, i32 0, i32 0
  store <4 x float> %151, <4 x float> addrspace(1)* %152, align 16
  br label %153

153:                                              ; preds = %140, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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
