; ModuleID = '../data/hip_kernels/248/0/main.cu'
source_filename = "../data/hip_kernels/248/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11kRgb2CIELabP15HIP_vector_typeIhLj4EEPS_IfLj4EEii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %17, %19
  %21 = mul i32 %20, %2
  %22 = add i32 %11, %18
  %23 = add i32 %22, %21
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i64 0
  %26 = load i8, i8 addrspace(1)* %25, align 4, !amdgpu.noclobber !5
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i64 1
  %28 = load i8, i8 addrspace(1)* %27, align 1, !amdgpu.noclobber !5
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i64 2
  %30 = load i8, i8 addrspace(1)* %29, align 2, !amdgpu.noclobber !5
  %31 = uitofp i8 %26 to double
  %32 = fdiv contract double %31, 2.550000e+02
  %33 = fptrunc double %32 to float
  %34 = uitofp i8 %28 to double
  %35 = fdiv contract double %34, 2.550000e+02
  %36 = fptrunc double %35 to float
  %37 = uitofp i8 %30 to double
  %38 = fdiv contract double %37, 2.550000e+02
  %39 = fptrunc double %38 to float
  %40 = fpext float %39 to double
  %41 = fmul contract double %40, 4.124530e-01
  %42 = fpext float %36 to double
  %43 = fmul contract double %42, 3.575800e-01
  %44 = fadd contract double %43, %41
  %45 = fpext float %33 to double
  %46 = fmul contract double %45, 1.804230e-01
  %47 = fadd contract double %46, %44
  %48 = fptrunc double %47 to float
  %49 = fmul contract double %40, 2.126710e-01
  %50 = fmul contract double %42, 7.151600e-01
  %51 = fadd contract double %50, %49
  %52 = fmul contract double %45, 0x3FB279AAE6C8F755
  %53 = fadd contract double %52, %51
  %54 = fptrunc double %53 to float
  %55 = fmul contract double %40, 1.933400e-02
  %56 = fmul contract double %42, 1.191930e-01
  %57 = fadd contract double %56, %55
  %58 = fmul contract double %45, 9.502270e-01
  %59 = fadd contract double %58, %57
  %60 = fptrunc double %59 to float
  %61 = fpext float %48 to double
  %62 = fdiv contract double %61, 0x3FEE6A22B3892EE8
  %63 = fptrunc double %62 to float
  %64 = tail call i1 @llvm.amdgcn.class.f32(float %54, i32 144)
  %65 = select i1 %64, float 0x41F0000000000000, float 1.000000e+00
  %66 = fmul float %65, %54
  %67 = tail call float @llvm.log2.f32(float %66)
  %68 = fmul float %67, 0x3FE62E42E0000000
  %69 = tail call i1 @llvm.amdgcn.class.f32(float %67, i32 519)
  %70 = fneg float %68
  %71 = tail call float @llvm.fma.f32(float %67, float 0x3FE62E42E0000000, float %70)
  %72 = tail call float @llvm.fma.f32(float %67, float 0x3E6EFA39E0000000, float %71)
  %73 = fadd float %68, %72
  %74 = select i1 %69, float %67, float %73
  %75 = select i1 %64, float 0x40362E4300000000, float 0.000000e+00
  %76 = fsub float %74, %75
  %77 = fpext float %76 to double
  %78 = fdiv contract double %77, 3.000000e+00
  %79 = fmul double %78, 0x3FF71547652B82FE
  %80 = tail call double @llvm.rint.f64(double %79)
  %81 = fneg double %80
  %82 = tail call double @llvm.fma.f64(double %81, double 0x3FE62E42FEFA39EF, double %78)
  %83 = tail call double @llvm.fma.f64(double %81, double 0x3C7ABC9E3B39803F, double %82)
  %84 = tail call double @llvm.fma.f64(double %83, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %85 = tail call double @llvm.fma.f64(double %83, double %84, double 0x3EC71DEE623FDE64)
  %86 = tail call double @llvm.fma.f64(double %83, double %85, double 0x3EFA01997C89E6B0)
  %87 = tail call double @llvm.fma.f64(double %83, double %86, double 0x3F2A01A014761F6E)
  %88 = tail call double @llvm.fma.f64(double %83, double %87, double 0x3F56C16C1852B7B0)
  %89 = tail call double @llvm.fma.f64(double %83, double %88, double 0x3F81111111122322)
  %90 = tail call double @llvm.fma.f64(double %83, double %89, double 0x3FA55555555502A1)
  %91 = tail call double @llvm.fma.f64(double %83, double %90, double 0x3FC5555555555511)
  %92 = tail call double @llvm.fma.f64(double %83, double %91, double 0x3FE000000000000B)
  %93 = tail call double @llvm.fma.f64(double %83, double %92, double 1.000000e+00)
  %94 = tail call double @llvm.fma.f64(double %83, double %93, double 1.000000e+00)
  %95 = fptosi double %80 to i32
  %96 = tail call double @llvm.amdgcn.ldexp.f64(double %94, i32 %95)
  %97 = fcmp ogt double %78, 1.024000e+03
  %98 = select i1 %97, double 0x7FF0000000000000, double %96
  %99 = fcmp olt double %78, -1.075000e+03
  %100 = select i1 %99, double 0.000000e+00, double %98
  %101 = fptrunc double %100 to float
  %102 = fpext float %60 to double
  %103 = fdiv contract double %102, 0x3FF16B8950763A19
  %104 = fptrunc double %103 to float
  %105 = fpext float %63 to double
  %106 = fcmp contract ogt double %105, 8.856000e-03
  br i1 %106, label %107, label %145

107:                                              ; preds = %4
  %108 = tail call i1 @llvm.amdgcn.class.f32(float %63, i32 144)
  %109 = select i1 %108, float 0x41F0000000000000, float 1.000000e+00
  %110 = fmul float %109, %63
  %111 = tail call float @llvm.log2.f32(float %110)
  %112 = fmul float %111, 0x3FE62E42E0000000
  %113 = tail call i1 @llvm.amdgcn.class.f32(float %111, i32 519)
  %114 = fneg float %112
  %115 = tail call float @llvm.fma.f32(float %111, float 0x3FE62E42E0000000, float %114)
  %116 = tail call float @llvm.fma.f32(float %111, float 0x3E6EFA39E0000000, float %115)
  %117 = fadd float %112, %116
  %118 = select i1 %113, float %111, float %117
  %119 = select i1 %108, float 0x40362E4300000000, float 0.000000e+00
  %120 = fsub float %118, %119
  %121 = fpext float %120 to double
  %122 = fdiv contract double %121, 3.000000e+00
  %123 = fmul double %122, 0x3FF71547652B82FE
  %124 = tail call double @llvm.rint.f64(double %123)
  %125 = fneg double %124
  %126 = tail call double @llvm.fma.f64(double %125, double 0x3FE62E42FEFA39EF, double %122)
  %127 = tail call double @llvm.fma.f64(double %125, double 0x3C7ABC9E3B39803F, double %126)
  %128 = tail call double @llvm.fma.f64(double %127, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %129 = tail call double @llvm.fma.f64(double %127, double %128, double 0x3EC71DEE623FDE64)
  %130 = tail call double @llvm.fma.f64(double %127, double %129, double 0x3EFA01997C89E6B0)
  %131 = tail call double @llvm.fma.f64(double %127, double %130, double 0x3F2A01A014761F6E)
  %132 = tail call double @llvm.fma.f64(double %127, double %131, double 0x3F56C16C1852B7B0)
  %133 = tail call double @llvm.fma.f64(double %127, double %132, double 0x3F81111111122322)
  %134 = tail call double @llvm.fma.f64(double %127, double %133, double 0x3FA55555555502A1)
  %135 = tail call double @llvm.fma.f64(double %127, double %134, double 0x3FC5555555555511)
  %136 = tail call double @llvm.fma.f64(double %127, double %135, double 0x3FE000000000000B)
  %137 = tail call double @llvm.fma.f64(double %127, double %136, double 1.000000e+00)
  %138 = tail call double @llvm.fma.f64(double %127, double %137, double 1.000000e+00)
  %139 = fptosi double %124 to i32
  %140 = tail call double @llvm.amdgcn.ldexp.f64(double %138, i32 %139)
  %141 = fcmp ogt double %122, 1.024000e+03
  %142 = select i1 %141, double 0x7FF0000000000000, double %140
  %143 = fcmp olt double %122, -1.075000e+03
  %144 = select i1 %143, double 0.000000e+00, double %142
  br label %148

145:                                              ; preds = %4
  %146 = fmul contract double %105, 0x401F25E353F7CED9
  %147 = fadd contract double %146, 1.379300e-01
  br label %148

148:                                              ; preds = %145, %107
  %149 = phi contract double [ %144, %107 ], [ %147, %145 ]
  %150 = fpext float %54 to double
  %151 = fcmp contract ogt double %150, 8.856000e-03
  %152 = fmul contract double %150, 0x401F25E353F7CED9
  %153 = fadd contract double %152, 1.379300e-01
  %154 = fptrunc double %153 to float
  %155 = select i1 %151, float %101, float %154
  %156 = fpext float %104 to double
  %157 = fcmp contract ogt double %156, 8.856000e-03
  br i1 %157, label %158, label %197

158:                                              ; preds = %148
  %159 = tail call i1 @llvm.amdgcn.class.f32(float %104, i32 144)
  %160 = select i1 %159, float 0x41F0000000000000, float 1.000000e+00
  %161 = fmul float %160, %104
  %162 = tail call float @llvm.log2.f32(float %161)
  %163 = fmul float %162, 0x3FE62E42E0000000
  %164 = tail call i1 @llvm.amdgcn.class.f32(float %162, i32 519)
  %165 = fneg float %163
  %166 = tail call float @llvm.fma.f32(float %162, float 0x3FE62E42E0000000, float %165)
  %167 = tail call float @llvm.fma.f32(float %162, float 0x3E6EFA39E0000000, float %166)
  %168 = fadd float %163, %167
  %169 = select i1 %164, float %162, float %168
  %170 = select i1 %159, float 0x40362E4300000000, float 0.000000e+00
  %171 = fsub float %169, %170
  %172 = fpext float %171 to double
  %173 = fdiv contract double %172, 3.000000e+00
  %174 = fmul double %173, 0x3FF71547652B82FE
  %175 = tail call double @llvm.rint.f64(double %174)
  %176 = fneg double %175
  %177 = tail call double @llvm.fma.f64(double %176, double 0x3FE62E42FEFA39EF, double %173)
  %178 = tail call double @llvm.fma.f64(double %176, double 0x3C7ABC9E3B39803F, double %177)
  %179 = tail call double @llvm.fma.f64(double %178, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %180 = tail call double @llvm.fma.f64(double %178, double %179, double 0x3EC71DEE623FDE64)
  %181 = tail call double @llvm.fma.f64(double %178, double %180, double 0x3EFA01997C89E6B0)
  %182 = tail call double @llvm.fma.f64(double %178, double %181, double 0x3F2A01A014761F6E)
  %183 = tail call double @llvm.fma.f64(double %178, double %182, double 0x3F56C16C1852B7B0)
  %184 = tail call double @llvm.fma.f64(double %178, double %183, double 0x3F81111111122322)
  %185 = tail call double @llvm.fma.f64(double %178, double %184, double 0x3FA55555555502A1)
  %186 = tail call double @llvm.fma.f64(double %178, double %185, double 0x3FC5555555555511)
  %187 = tail call double @llvm.fma.f64(double %178, double %186, double 0x3FE000000000000B)
  %188 = tail call double @llvm.fma.f64(double %178, double %187, double 1.000000e+00)
  %189 = tail call double @llvm.fma.f64(double %178, double %188, double 1.000000e+00)
  %190 = fptosi double %175 to i32
  %191 = tail call double @llvm.amdgcn.ldexp.f64(double %189, i32 %190)
  %192 = fcmp ogt double %173, 1.024000e+03
  %193 = select i1 %192, double 0x7FF0000000000000, double %191
  %194 = fcmp olt double %173, -1.075000e+03
  %195 = select i1 %194, double 0.000000e+00, double %193
  %196 = fdiv contract double %156, %195
  br label %200

197:                                              ; preds = %148
  %198 = fmul contract double %156, 0x401F25E353F7CED9
  %199 = fadd contract double %198, 1.379300e-01
  br label %200

200:                                              ; preds = %197, %158
  %201 = phi double [ %196, %158 ], [ %199, %197 ]
  %202 = fpext float %155 to double
  %203 = fcmp contract ogt double %202, 8.856000e-03
  br i1 %203, label %204, label %208

204:                                              ; preds = %200
  %205 = fpext float %101 to double
  %206 = fmul contract double %205, 1.160000e+02
  %207 = fadd contract double %206, -1.600000e+01
  br label %210

208:                                              ; preds = %200
  %209 = fmul contract double %202, 0x408C3A6666666666
  br label %210

210:                                              ; preds = %208, %204
  %211 = phi contract double [ %207, %204 ], [ %209, %208 ]
  %212 = fptrunc double %201 to float
  %213 = fptrunc double %149 to float
  %214 = fptrunc double %211 to float
  %215 = fsub contract float %213, %155
  %216 = fmul contract float %215, 5.000000e+02
  %217 = fsub contract float %155, %212
  %218 = fmul contract float %217, 2.000000e+02
  %219 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %24, i32 0, i32 0, i32 0, i64 0
  store float %214, float addrspace(1)* %219, align 16
  %220 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %24, i32 0, i32 0, i32 0, i64 1
  store float %216, float addrspace(1)* %220, align 4
  %221 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %24, i32 0, i32 0, i32 0, i64 2
  store float %218, float addrspace(1)* %221, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

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
