; ModuleID = '../data/hip_kernels/959/0/main.cu'
source_filename = "../data/hip_kernels/959/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { %"struct.HIP_vector_base<double, 3>::Native_vec_" }
%"struct.HIP_vector_base<double, 3>::Native_vec_" = type { [3 x double] }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29inverse_dft_with_w_correctionP15HIP_vector_typeIdLj2EEmPKS_IdLj3EEPKS0_iiiiid(%struct.HIP_vector_type addrspace(1)* nocapture %0, i64 %1, %struct.HIP_vector_type.0 addrspace(1)* nocapture readonly %2, %struct.HIP_vector_type addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, double %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %19, %8
  %29 = icmp slt i32 %27, %8
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %268

31:                                               ; preds = %10
  %32 = add nsw i32 %19, %6
  %33 = sitofp i32 %32 to double
  %34 = fmul contract double %33, %9
  %35 = add nsw i32 %27, %7
  %36 = sitofp i32 %35 to double
  %37 = fmul contract double %36, %9
  %38 = fmul contract double %34, %34
  %39 = fsub contract double 1.000000e+00, %38
  %40 = fmul contract double %37, %37
  %41 = fsub contract double %39, %40
  %42 = fcmp olt double %41, 0x1000000000000000
  %43 = select i1 %42, double 0x4FF0000000000000, double 1.000000e+00
  %44 = fmul double %41, %43
  %45 = tail call double @llvm.amdgcn.rsq.f64(double %44)
  %46 = fmul double %44, %45
  %47 = fmul double %45, 5.000000e-01
  %48 = fneg double %47
  %49 = tail call double @llvm.fma.f64(double %48, double %46, double 5.000000e-01)
  %50 = tail call double @llvm.fma.f64(double %47, double %49, double %47)
  %51 = tail call double @llvm.fma.f64(double %46, double %49, double %46)
  %52 = fneg double %51
  %53 = tail call double @llvm.fma.f64(double %52, double %51, double %44)
  %54 = tail call double @llvm.fma.f64(double %53, double %50, double %51)
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %55, double %54, double %44)
  %57 = tail call double @llvm.fma.f64(double %56, double %50, double %54)
  %58 = select i1 %42, double 0x37F0000000000000, double 1.000000e+00
  %59 = fmul double %58, %57
  %60 = fcmp oeq double %44, 0.000000e+00
  %61 = fcmp oeq double %44, 0x7FF0000000000000
  %62 = or i1 %60, %61
  %63 = select i1 %62, double %44, double %59
  %64 = fadd contract double %63, -1.000000e+00
  %65 = icmp sgt i32 %5, 0
  br i1 %65, label %86, label %66

66:                                               ; preds = %200, %31
  %67 = phi double [ 0.000000e+00, %31 ], [ %265, %200 ]
  %68 = phi double [ 0.000000e+00, %31 ], [ %264, %200 ]
  %69 = fmul contract double %63, %68
  %70 = fmul contract double %63, %67
  %71 = bitcast %struct.HIP_vector_type addrspace(1)* %0 to i8 addrspace(1)*
  %72 = sext i32 %27 to i64
  %73 = mul i64 %72, %1
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %71, i64 %73
  %75 = bitcast i8 addrspace(1)* %74 to %struct.HIP_vector_type addrspace(1)*
  %76 = sitofp i32 %4 to double
  %77 = fdiv contract double %69, %76
  %78 = sext i32 %19 to i64
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %75, i64 %78, i32 0, i32 0, i32 0, i64 0
  %80 = load double, double addrspace(1)* %79, align 16, !tbaa !7, !amdgpu.noclobber !5
  %81 = fadd contract double %77, %80
  store double %81, double addrspace(1)* %79, align 16, !tbaa !7
  %82 = fdiv contract double %70, %76
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %75, i64 %78, i32 0, i32 0, i32 0, i64 1
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7, !amdgpu.noclobber !5
  %85 = fadd contract double %82, %84
  store double %85, double addrspace(1)* %83, align 8, !tbaa !7
  br label %268

86:                                               ; preds = %31, %200
  %87 = phi double [ %264, %200 ], [ 0.000000e+00, %31 ]
  %88 = phi double [ %265, %200 ], [ 0.000000e+00, %31 ]
  %89 = phi i32 [ %266, %200 ], [ 0, %31 ]
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 0
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7, !amdgpu.noclobber !5
  %93 = fmul contract double %34, %92
  %94 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 1
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !7, !amdgpu.noclobber !5
  %96 = fmul contract double %37, %95
  %97 = fadd contract double %93, %96
  %98 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 2
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7, !amdgpu.noclobber !5
  %100 = fmul contract double %64, %99
  %101 = fadd contract double %97, %100
  %102 = fmul contract double %101, 0x401921FB54442D18
  %103 = tail call double @llvm.fabs.f64(double %102)
  %104 = fcmp olt double %103, 0x41D0000000000000
  br i1 %104, label %105, label %124

105:                                              ; preds = %86
  %106 = fmul double %103, 0x3FE45F306DC9C883
  %107 = tail call double @llvm.rint.f64(double %106)
  %108 = tail call double @llvm.fma.f64(double %107, double 0xBFF921FB54442D18, double %103)
  %109 = tail call double @llvm.fma.f64(double %107, double 0xBC91A62633145C00, double %108)
  %110 = fmul double %107, 0x3C91A62633145C00
  %111 = fneg double %110
  %112 = tail call double @llvm.fma.f64(double %107, double 0x3C91A62633145C00, double %111)
  %113 = fsub double %108, %110
  %114 = fsub double %108, %113
  %115 = fsub double %114, %110
  %116 = fsub double %113, %109
  %117 = fadd double %116, %115
  %118 = fsub double %117, %112
  %119 = tail call double @llvm.fma.f64(double %107, double 0xB97B839A252049C0, double %118)
  %120 = fadd double %109, %119
  %121 = fsub double %120, %109
  %122 = fsub double %119, %121
  %123 = fptosi double %107 to i32
  br label %200

124:                                              ; preds = %86
  %125 = tail call double @llvm.amdgcn.trig.preop.f64(double %103, i32 0)
  %126 = tail call double @llvm.amdgcn.trig.preop.f64(double %103, i32 1)
  %127 = tail call double @llvm.amdgcn.trig.preop.f64(double %103, i32 2)
  %128 = fcmp oge double %103, 0x7B00000000000000
  %129 = tail call double @llvm.amdgcn.ldexp.f64(double %103, i32 -128)
  %130 = select i1 %128, double %129, double %103
  %131 = fmul double %127, %130
  %132 = fneg double %131
  %133 = tail call double @llvm.fma.f64(double %127, double %130, double %132)
  %134 = fmul double %126, %130
  %135 = fneg double %134
  %136 = tail call double @llvm.fma.f64(double %126, double %130, double %135)
  %137 = fmul double %125, %130
  %138 = fneg double %137
  %139 = tail call double @llvm.fma.f64(double %125, double %130, double %138)
  %140 = fadd double %134, %139
  %141 = fsub double %140, %134
  %142 = fsub double %140, %141
  %143 = fsub double %139, %141
  %144 = fsub double %134, %142
  %145 = fadd double %143, %144
  %146 = fadd double %131, %136
  %147 = fsub double %146, %131
  %148 = fsub double %146, %147
  %149 = fsub double %136, %147
  %150 = fsub double %131, %148
  %151 = fadd double %149, %150
  %152 = fadd double %146, %145
  %153 = fsub double %152, %146
  %154 = fsub double %152, %153
  %155 = fsub double %145, %153
  %156 = fsub double %146, %154
  %157 = fadd double %155, %156
  %158 = fadd double %151, %157
  %159 = fadd double %133, %158
  %160 = fadd double %137, %140
  %161 = fsub double %160, %137
  %162 = fsub double %140, %161
  %163 = fadd double %162, %152
  %164 = fsub double %163, %162
  %165 = fsub double %152, %164
  %166 = fadd double %165, %159
  %167 = tail call double @llvm.amdgcn.ldexp.f64(double %160, i32 -2)
  %168 = tail call double @llvm.amdgcn.fract.f64(double %167)
  %169 = tail call i1 @llvm.amdgcn.class.f64(double %167, i32 516)
  %170 = select i1 %169, double 0.000000e+00, double %168
  %171 = tail call double @llvm.amdgcn.ldexp.f64(double %170, i32 2)
  %172 = fadd double %171, %163
  %173 = fcmp olt double %172, 0.000000e+00
  %174 = select i1 %173, double 4.000000e+00, double 0.000000e+00
  %175 = fadd double %171, %174
  %176 = fadd double %163, %175
  %177 = fptosi double %176 to i32
  %178 = sitofp i32 %177 to double
  %179 = fsub double %175, %178
  %180 = fadd double %163, %179
  %181 = fsub double %180, %179
  %182 = fsub double %163, %181
  %183 = fadd double %166, %182
  %184 = fcmp oge double %180, 5.000000e-01
  %185 = zext i1 %184 to i32
  %186 = add nsw i32 %185, %177
  %187 = select i1 %184, double 1.000000e+00, double 0.000000e+00
  %188 = fsub double %180, %187
  %189 = fadd double %188, %183
  %190 = fsub double %189, %188
  %191 = fsub double %183, %190
  %192 = fmul double %189, 0x3FF921FB54442D18
  %193 = fneg double %192
  %194 = tail call double @llvm.fma.f64(double %189, double 0x3FF921FB54442D18, double %193)
  %195 = tail call double @llvm.fma.f64(double %189, double 0x3C91A62633145C07, double %194)
  %196 = tail call double @llvm.fma.f64(double %191, double 0x3FF921FB54442D18, double %195)
  %197 = fadd double %192, %196
  %198 = fsub double %197, %192
  %199 = fsub double %196, %198
  br label %200

200:                                              ; preds = %105, %124
  %201 = phi double [ %122, %105 ], [ %199, %124 ]
  %202 = phi double [ %120, %105 ], [ %197, %124 ]
  %203 = phi i32 [ %123, %105 ], [ %186, %124 ]
  %204 = fmul double %202, %202
  %205 = fmul double %204, 5.000000e-01
  %206 = fsub double 1.000000e+00, %205
  %207 = fsub double 1.000000e+00, %206
  %208 = fsub double %207, %205
  %209 = fmul double %204, %204
  %210 = tail call double @llvm.fma.f64(double %204, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %211 = tail call double @llvm.fma.f64(double %204, double %210, double 0xBE927E4FA17F65F6)
  %212 = tail call double @llvm.fma.f64(double %204, double %211, double 0x3EFA01A019F4EC90)
  %213 = tail call double @llvm.fma.f64(double %204, double %212, double 0xBF56C16C16C16967)
  %214 = tail call double @llvm.fma.f64(double %204, double %213, double 0x3FA5555555555555)
  %215 = fneg double %201
  %216 = tail call double @llvm.fma.f64(double %202, double %215, double %208)
  %217 = tail call double @llvm.fma.f64(double %209, double %214, double %216)
  %218 = fadd double %206, %217
  %219 = tail call double @llvm.fma.f64(double %204, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %220 = tail call double @llvm.fma.f64(double %204, double %219, double 0x3EC71DE3796CDE01)
  %221 = tail call double @llvm.fma.f64(double %204, double %220, double 0xBF2A01A019E83E5C)
  %222 = tail call double @llvm.fma.f64(double %204, double %221, double 0x3F81111111110BB3)
  %223 = fneg double %204
  %224 = fmul double %202, %223
  %225 = fmul double %201, 5.000000e-01
  %226 = tail call double @llvm.fma.f64(double %224, double %222, double %225)
  %227 = tail call double @llvm.fma.f64(double %204, double %226, double %215)
  %228 = tail call double @llvm.fma.f64(double %224, double 0xBFC5555555555555, double %227)
  %229 = fsub double %202, %228
  %230 = shl i32 %203, 30
  %231 = and i32 %230, -2147483648
  %232 = and i32 %203, 1
  %233 = icmp eq i32 %232, 0
  %234 = select i1 %233, double %229, double %218
  %235 = bitcast double %234 to <2 x i32>
  %236 = bitcast double %102 to <2 x i32>
  %237 = extractelement <2 x i32> %236, i64 1
  %238 = and i32 %237, -2147483648
  %239 = extractelement <2 x i32> %235, i64 1
  %240 = xor i32 %238, %239
  %241 = xor i32 %240, %231
  %242 = insertelement <2 x i32> %235, i32 %241, i64 1
  %243 = fneg double %229
  %244 = select i1 %233, double %218, double %243
  %245 = bitcast double %244 to <2 x i32>
  %246 = extractelement <2 x i32> %245, i64 1
  %247 = xor i32 %246, %231
  %248 = insertelement <2 x i32> %245, i32 %247, i64 1
  %249 = tail call i1 @llvm.amdgcn.class.f64(double %102, i32 504)
  %250 = select i1 %249, <2 x i32> %242, <2 x i32> <i32 0, i32 2146959360>
  %251 = select i1 %249, <2 x i32> %248, <2 x i32> <i32 0, i32 2146959360>
  %252 = bitcast <2 x i32> %250 to double
  %253 = bitcast <2 x i32> %251 to double
  %254 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %90, i32 0, i32 0, i32 0
  %255 = load <2 x double>, <2 x double> addrspace(1)* %254, align 16, !amdgpu.noclobber !5
  %256 = extractelement <2 x double> %255, i64 0
  %257 = fmul contract double %256, %253
  %258 = extractelement <2 x double> %255, i64 1
  %259 = fmul contract double %258, %252
  %260 = fsub contract double %257, %259
  %261 = fmul contract double %258, %253
  %262 = fmul contract double %256, %252
  %263 = fadd contract double %261, %262
  %264 = fadd contract double %87, %260
  %265 = fadd contract double %88, %263
  %266 = add nuw nsw i32 %89, 1
  %267 = icmp eq i32 %266, %5
  br i1 %267, label %66, label %86, !llvm.loop !10

268:                                              ; preds = %10, %66
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

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
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
