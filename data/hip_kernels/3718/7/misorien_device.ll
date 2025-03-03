; ModuleID = '../data/hip_kernels/3718/7/main.cu'
source_filename = "../data/hip_kernels/3718/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }

@tcExpData = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture undef, align 8
@tfG = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.0 undef, align 8

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8misorienPfS_S_S_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul i32 %5, 9
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = getelementptr inbounds float, float addrspace(1)* %16, i64 3
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = getelementptr inbounds float, float addrspace(1)* %16, i64 6
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds float, float addrspace(1)* %16, i64 1
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = getelementptr inbounds float, float addrspace(1)* %16, i64 4
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = getelementptr inbounds float, float addrspace(1)* %16, i64 7
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = getelementptr inbounds float, float addrspace(1)* %16, i64 2
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = getelementptr inbounds float, float addrspace(1)* %16, i64 5
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = getelementptr inbounds float, float addrspace(1)* %16, i64 8
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = mul nuw nsw i32 %12, 9
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fmul contract float %17, %37
  %39 = fadd contract float %38, 0.000000e+00
  %40 = getelementptr inbounds float, float addrspace(1)* %36, i64 1
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract float %23, %41
  %43 = fadd contract float %39, %42
  %44 = getelementptr inbounds float, float addrspace(1)* %36, i64 2
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = fmul contract float %29, %45
  %47 = fadd contract float %43, %46
  %48 = fmul contract float %19, %37
  %49 = fadd contract float %48, 0.000000e+00
  %50 = fmul contract float %25, %41
  %51 = fadd contract float %49, %50
  %52 = fmul contract float %31, %45
  %53 = fadd contract float %51, %52
  %54 = fmul contract float %21, %37
  %55 = fadd contract float %54, 0.000000e+00
  %56 = fmul contract float %27, %41
  %57 = fadd contract float %55, %56
  %58 = fmul contract float %33, %45
  %59 = fadd contract float %57, %58
  %60 = getelementptr inbounds float, float addrspace(1)* %36, i64 3
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = fmul contract float %17, %61
  %63 = fadd contract float %62, 0.000000e+00
  %64 = getelementptr inbounds float, float addrspace(1)* %36, i64 4
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fmul contract float %23, %65
  %67 = fadd contract float %63, %66
  %68 = getelementptr inbounds float, float addrspace(1)* %36, i64 5
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = fmul contract float %29, %69
  %71 = fadd contract float %67, %70
  %72 = fmul contract float %19, %61
  %73 = fadd contract float %72, 0.000000e+00
  %74 = fmul contract float %25, %65
  %75 = fadd contract float %73, %74
  %76 = fmul contract float %31, %69
  %77 = fadd contract float %75, %76
  %78 = fmul contract float %21, %61
  %79 = fadd contract float %78, 0.000000e+00
  %80 = fmul contract float %27, %65
  %81 = fadd contract float %79, %80
  %82 = fmul contract float %33, %69
  %83 = fadd contract float %81, %82
  %84 = getelementptr inbounds float, float addrspace(1)* %36, i64 6
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = fmul contract float %17, %85
  %87 = fadd contract float %86, 0.000000e+00
  %88 = getelementptr inbounds float, float addrspace(1)* %36, i64 7
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fmul contract float %23, %89
  %91 = fadd contract float %87, %90
  %92 = getelementptr inbounds float, float addrspace(1)* %36, i64 8
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fmul contract float %29, %93
  %95 = fadd contract float %91, %94
  %96 = fmul contract float %19, %85
  %97 = fadd contract float %96, 0.000000e+00
  %98 = fmul contract float %25, %89
  %99 = fadd contract float %97, %98
  %100 = fmul contract float %31, %93
  %101 = fadd contract float %99, %100
  %102 = fmul contract float %21, %85
  %103 = fadd contract float %102, 0.000000e+00
  %104 = fmul contract float %27, %89
  %105 = fadd contract float %103, %104
  %106 = fmul contract float %33, %93
  %107 = fadd contract float %105, %106
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fmul contract float %47, %109
  %111 = fadd contract float %110, 0.000000e+00
  %112 = getelementptr inbounds float, float addrspace(1)* %108, i64 1
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = fmul contract float %71, %113
  %115 = fadd contract float %111, %114
  %116 = getelementptr inbounds float, float addrspace(1)* %108, i64 2
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fmul contract float %95, %117
  %119 = fadd contract float %115, %118
  %120 = getelementptr inbounds float, float addrspace(1)* %108, i64 3
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = getelementptr inbounds float, float addrspace(1)* %108, i64 4
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = getelementptr inbounds float, float addrspace(1)* %108, i64 5
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = fmul contract float %53, %121
  %127 = fadd contract float %126, 0.000000e+00
  %128 = fmul contract float %77, %123
  %129 = fadd contract float %127, %128
  %130 = fmul contract float %101, %125
  %131 = fadd contract float %129, %130
  %132 = getelementptr inbounds float, float addrspace(1)* %108, i64 6
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = getelementptr inbounds float, float addrspace(1)* %108, i64 7
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !5
  %136 = getelementptr inbounds float, float addrspace(1)* %108, i64 8
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract float %59, %133
  %139 = fadd contract float %138, 0.000000e+00
  %140 = fmul contract float %83, %135
  %141 = fadd contract float %139, %140
  %142 = fmul contract float %107, %137
  %143 = fadd contract float %141, %142
  %144 = fadd contract float %119, %131
  %145 = fadd contract float %144, %143
  %146 = fadd contract float %145, -1.000000e+00
  %147 = fmul contract float %146, 5.000000e-01
  %148 = fpext float %147 to double
  %149 = tail call double @llvm.minnum.f64(double %148, double 0x3FEFFFFFFFF24190)
  %150 = fptrunc double %149 to float
  %151 = fpext float %150 to double
  %152 = tail call double @llvm.maxnum.f64(double %151, double 0xBFEFFFFFFFFEA028)
  %153 = fptrunc double %152 to float
  %154 = tail call float @llvm.fabs.f32(float %153)
  %155 = tail call float @llvm.fmuladd.f32(float %154, float -5.000000e-01, float 5.000000e-01)
  %156 = fmul float %153, %153
  %157 = fcmp ogt float %154, 5.000000e-01
  %158 = select i1 %157, float %155, float %156
  %159 = tail call float @llvm.fmuladd.f32(float %158, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %160 = tail call float @llvm.fmuladd.f32(float %158, float %159, float 0x3FA0698780000000)
  %161 = tail call float @llvm.fmuladd.f32(float %158, float %160, float 0x3FA6C83620000000)
  %162 = tail call float @llvm.fmuladd.f32(float %158, float %161, float 0x3FB3337900000000)
  %163 = tail call float @llvm.fmuladd.f32(float %158, float %162, float 0x3FC5555580000000)
  %164 = fmul float %158, %163
  %165 = tail call float @llvm.sqrt.f32(float %158)
  %166 = tail call float @llvm.fmuladd.f32(float %165, float %164, float %165)
  %167 = fmul float %166, 2.000000e+00
  %168 = fsub float 0x400921FB60000000, %167
  %169 = fcmp olt float %153, 0.000000e+00
  %170 = select i1 %169, float %168, float %167
  %171 = tail call float @llvm.fmuladd.f32(float %153, float %164, float %153)
  %172 = fsub float 0x3FF921FB60000000, %171
  %173 = select i1 %157, float %170, float %172
  %174 = sext i32 %13 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  store float %173, float addrspace(1)* %175, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

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
