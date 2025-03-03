; ModuleID = '../data/hip_kernels/11105/12/main.cu'
source_filename = "../data/hip_kernels/11105/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20gamma_tonemap_kernelPfS_iiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %3
  %26 = icmp slt i32 %24, %2
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %298

28:                                               ; preds = %7
  %29 = mul nsw i32 %16, %2
  %30 = add nsw i32 %29, %24
  %31 = mul nsw i32 %30, 3
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = add nsw i32 %31, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %31, 2
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = fpext float %34 to double
  %44 = fmul contract double %43, 7.220000e-02
  %45 = fpext float %38 to double
  %46 = fmul contract double %45, 7.152000e-01
  %47 = fadd contract double %44, %46
  %48 = fpext float %42 to double
  %49 = fmul contract double %48, 2.126000e-01
  %50 = fadd contract double %47, %49
  %51 = fptrunc double %50 to float
  %52 = fmul float %5, 0x3FE62E4300000000
  %53 = fneg float %52
  %54 = tail call float @llvm.fma.f32(float %5, float 0x3FE62E4300000000, float %53)
  %55 = tail call float @llvm.fma.f32(float %5, float 0xBE205C6100000000, float %54)
  %56 = fadd float %52, %55
  %57 = fsub float %56, %52
  %58 = fsub float %55, %57
  %59 = tail call float @llvm.fabs.f32(float %52) #3
  %60 = fcmp oeq float %59, 0x7FF0000000000000
  %61 = select i1 %60, float %52, float %56
  %62 = tail call float @llvm.fabs.f32(float %61) #3
  %63 = fcmp oeq float %62, 0x7FF0000000000000
  %64 = select i1 %63, float 0.000000e+00, float %58
  %65 = fcmp oeq float %61, 0x40562E4300000000
  %66 = select i1 %65, float 0x3EE0000000000000, float 0.000000e+00
  %67 = fsub float %61, %66
  %68 = fadd float %66, %64
  %69 = fmul float %67, 0x3FF7154760000000
  %70 = tail call float @llvm.rint.f32(float %69)
  %71 = fcmp ogt float %67, 0x40562E4300000000
  %72 = fcmp olt float %67, 0xC059D1DA00000000
  %73 = fneg float %69
  %74 = tail call float @llvm.fma.f32(float %67, float 0x3FF7154760000000, float %73)
  %75 = tail call float @llvm.fma.f32(float %67, float 0x3E54AE0BE0000000, float %74)
  %76 = fsub float %69, %70
  %77 = fadd float %75, %76
  %78 = tail call float @llvm.exp2.f32(float %77)
  %79 = fptosi float %70 to i32
  %80 = tail call float @llvm.amdgcn.ldexp.f32(float %78, i32 %79)
  %81 = select i1 %72, float 0.000000e+00, float %80
  %82 = select i1 %71, float 0x7FF0000000000000, float %81
  %83 = tail call float @llvm.fma.f32(float %82, float %68, float %82)
  %84 = tail call float @llvm.fabs.f32(float %82) #3
  %85 = fcmp oeq float %84, 0x7FF0000000000000
  %86 = select i1 %85, float %82, float %83
  %87 = tail call float @llvm.fabs.f32(float %5)
  %88 = tail call float @llvm.fabs.f32(float %86)
  %89 = fcmp oeq float %87, 0x7FF0000000000000
  %90 = bitcast float %5 to i32
  %91 = icmp sgt i32 %90, -1
  %92 = select i1 %91, float 0x7FF0000000000000, float 0.000000e+00
  %93 = select i1 %89, float %92, float %88
  %94 = fcmp uno float %5, 0.000000e+00
  %95 = select i1 %94, float 0x7FF8000000000000, float %93
  %96 = fcmp oeq float %5, 0.000000e+00
  %97 = select i1 %96, float 1.000000e+00, float %95
  %98 = fmul contract float %97, %51
  %99 = fdiv contract float 1.000000e+00, %6
  %100 = tail call float @llvm.fabs.f32(float %98)
  %101 = tail call float @llvm.amdgcn.frexp.mant.f32(float %100)
  %102 = fcmp olt float %101, 0x3FE5555560000000
  %103 = zext i1 %102 to i32
  %104 = tail call float @llvm.amdgcn.ldexp.f32(float %101, i32 %103)
  %105 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %100)
  %106 = sub nsw i32 %105, %103
  %107 = fadd float %104, -1.000000e+00
  %108 = fadd float %104, 1.000000e+00
  %109 = fadd float %108, -1.000000e+00
  %110 = fsub float %104, %109
  %111 = tail call float @llvm.amdgcn.rcp.f32(float %108)
  %112 = fmul float %107, %111
  %113 = fmul float %108, %112
  %114 = fneg float %113
  %115 = tail call float @llvm.fma.f32(float %112, float %108, float %114)
  %116 = tail call float @llvm.fma.f32(float %112, float %110, float %115)
  %117 = fadd float %113, %116
  %118 = fsub float %117, %113
  %119 = fsub float %116, %118
  %120 = fsub float %107, %117
  %121 = fsub float %107, %120
  %122 = fsub float %121, %117
  %123 = fsub float %122, %119
  %124 = fadd float %120, %123
  %125 = fmul float %111, %124
  %126 = fadd float %112, %125
  %127 = fsub float %126, %112
  %128 = fsub float %125, %127
  %129 = fmul float %126, %126
  %130 = fneg float %129
  %131 = tail call float @llvm.fma.f32(float %126, float %126, float %130)
  %132 = fmul float %128, 2.000000e+00
  %133 = tail call float @llvm.fma.f32(float %126, float %132, float %131)
  %134 = fadd float %129, %133
  %135 = fsub float %134, %129
  %136 = fsub float %133, %135
  %137 = tail call float @llvm.fmuladd.f32(float %134, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %138 = tail call float @llvm.fmuladd.f32(float %134, float %137, float 0x3FD999BDE0000000)
  %139 = sitofp i32 %106 to float
  %140 = fmul float %139, 0x3FE62E4300000000
  %141 = fneg float %140
  %142 = tail call float @llvm.fma.f32(float %139, float 0x3FE62E4300000000, float %141)
  %143 = tail call float @llvm.fma.f32(float %139, float 0xBE205C6100000000, float %142)
  %144 = fadd float %140, %143
  %145 = fsub float %144, %140
  %146 = fsub float %143, %145
  %147 = tail call float @llvm.amdgcn.ldexp.f32(float %126, i32 1)
  %148 = fmul float %126, %134
  %149 = fneg float %148
  %150 = tail call float @llvm.fma.f32(float %134, float %126, float %149)
  %151 = tail call float @llvm.fma.f32(float %134, float %128, float %150)
  %152 = tail call float @llvm.fma.f32(float %136, float %126, float %151)
  %153 = fadd float %148, %152
  %154 = fsub float %153, %148
  %155 = fsub float %152, %154
  %156 = fmul float %134, %138
  %157 = fneg float %156
  %158 = tail call float @llvm.fma.f32(float %134, float %138, float %157)
  %159 = tail call float @llvm.fma.f32(float %136, float %138, float %158)
  %160 = fadd float %156, %159
  %161 = fsub float %160, %156
  %162 = fsub float %159, %161
  %163 = fadd float %160, 0x3FE5555540000000
  %164 = fadd float %163, 0xBFE5555540000000
  %165 = fsub float %160, %164
  %166 = fadd float %162, 0x3E2E720200000000
  %167 = fadd float %166, %165
  %168 = fadd float %163, %167
  %169 = fsub float %168, %163
  %170 = fsub float %167, %169
  %171 = fmul float %153, %168
  %172 = fneg float %171
  %173 = tail call float @llvm.fma.f32(float %153, float %168, float %172)
  %174 = tail call float @llvm.fma.f32(float %153, float %170, float %173)
  %175 = tail call float @llvm.fma.f32(float %155, float %168, float %174)
  %176 = tail call float @llvm.amdgcn.ldexp.f32(float %128, i32 1)
  %177 = fadd float %171, %175
  %178 = fsub float %177, %171
  %179 = fsub float %175, %178
  %180 = fadd float %147, %177
  %181 = fsub float %180, %147
  %182 = fsub float %177, %181
  %183 = fadd float %176, %179
  %184 = fadd float %183, %182
  %185 = fadd float %180, %184
  %186 = fsub float %185, %180
  %187 = fsub float %184, %186
  %188 = fadd float %144, %185
  %189 = fsub float %188, %144
  %190 = fsub float %188, %189
  %191 = fsub float %144, %190
  %192 = fsub float %185, %189
  %193 = fadd float %192, %191
  %194 = fadd float %146, %187
  %195 = fsub float %194, %146
  %196 = fsub float %194, %195
  %197 = fsub float %146, %196
  %198 = fsub float %187, %195
  %199 = fadd float %198, %197
  %200 = fadd float %194, %193
  %201 = fadd float %188, %200
  %202 = fsub float %201, %188
  %203 = fsub float %200, %202
  %204 = fadd float %199, %203
  %205 = fadd float %201, %204
  %206 = fsub float %205, %201
  %207 = fsub float %204, %206
  %208 = fmul float %99, %205
  %209 = fneg float %208
  %210 = tail call float @llvm.fma.f32(float %99, float %205, float %209)
  %211 = tail call float @llvm.fma.f32(float %99, float %207, float %210)
  %212 = fadd float %208, %211
  %213 = fsub float %212, %208
  %214 = fsub float %211, %213
  %215 = tail call float @llvm.fabs.f32(float %208) #3
  %216 = fcmp oeq float %215, 0x7FF0000000000000
  %217 = select i1 %216, float %208, float %212
  %218 = tail call float @llvm.fabs.f32(float %217) #3
  %219 = fcmp oeq float %218, 0x7FF0000000000000
  %220 = select i1 %219, float 0.000000e+00, float %214
  %221 = fcmp oeq float %217, 0x40562E4300000000
  %222 = select i1 %221, float 0x3EE0000000000000, float 0.000000e+00
  %223 = fsub float %217, %222
  %224 = fadd float %222, %220
  %225 = fmul float %223, 0x3FF7154760000000
  %226 = tail call float @llvm.rint.f32(float %225)
  %227 = fcmp ogt float %223, 0x40562E4300000000
  %228 = fcmp olt float %223, 0xC059D1DA00000000
  %229 = fneg float %225
  %230 = tail call float @llvm.fma.f32(float %223, float 0x3FF7154760000000, float %229)
  %231 = tail call float @llvm.fma.f32(float %223, float 0x3E54AE0BE0000000, float %230)
  %232 = fsub float %225, %226
  %233 = fadd float %231, %232
  %234 = tail call float @llvm.exp2.f32(float %233)
  %235 = fptosi float %226 to i32
  %236 = tail call float @llvm.amdgcn.ldexp.f32(float %234, i32 %235)
  %237 = select i1 %228, float 0.000000e+00, float %236
  %238 = select i1 %227, float 0x7FF0000000000000, float %237
  %239 = tail call float @llvm.fma.f32(float %238, float %224, float %238)
  %240 = tail call float @llvm.fabs.f32(float %238) #3
  %241 = fcmp oeq float %240, 0x7FF0000000000000
  %242 = select i1 %241, float %238, float %239
  %243 = tail call float @llvm.fabs.f32(float %99)
  %244 = tail call float @llvm.trunc.f32(float %243)
  %245 = fcmp oeq float %243, %244
  %246 = zext i1 %245 to i32
  %247 = fmul float %244, 5.000000e-01
  %248 = tail call float @llvm.amdgcn.fract.f32(float %247)
  %249 = tail call i1 @llvm.amdgcn.class.f32(float %247, i32 516)
  %250 = select i1 %249, float 0.000000e+00, float %248
  %251 = fcmp oeq float %250, 0.000000e+00
  %252 = and i1 %245, %251
  %253 = zext i1 %252 to i32
  %254 = add nuw nsw i32 %253, %246
  %255 = icmp eq i32 %254, 1
  %256 = fcmp olt float %98, 0.000000e+00
  %257 = and i1 %255, %256
  %258 = select i1 %257, float -0.000000e+00, float 0.000000e+00
  %259 = tail call float @llvm.copysign.f32(float %242, float %258)
  %260 = fcmp uge float %98, 0.000000e+00
  %261 = icmp ne i32 %254, 0
  %262 = select i1 %260, i1 true, i1 %261
  %263 = select i1 %262, float %259, float 0x7FF8000000000000
  %264 = fcmp oeq float %243, 0x7FF0000000000000
  br i1 %264, label %265, label %274

265:                                              ; preds = %28
  %266 = fcmp oeq float %100, 1.000000e+00
  %267 = fadd float %100, -1.000000e+00
  %268 = bitcast float %99 to i32
  %269 = bitcast float %267 to i32
  %270 = xor i32 %269, %268
  %271 = icmp sgt i32 %270, -1
  %272 = select i1 %271, float 0x7FF0000000000000, float 0.000000e+00
  %273 = select i1 %266, float %100, float %272
  br label %274

274:                                              ; preds = %28, %265
  %275 = phi float [ %263, %28 ], [ %273, %265 ]
  %276 = fcmp oeq float %100, 0x7FF0000000000000
  %277 = fcmp oeq float %98, 0.000000e+00
  %278 = or i1 %277, %276
  %279 = fcmp olt float %99, 0.000000e+00
  %280 = xor i1 %279, %277
  %281 = select i1 %280, float 0.000000e+00, float 0x7FF0000000000000
  %282 = select i1 %255, float %98, float 0.000000e+00
  %283 = tail call float @llvm.copysign.f32(float %281, float %282)
  %284 = select i1 %278, float %283, float %275
  %285 = fcmp uno float %98, %99
  %286 = select i1 %285, float 0x7FF8000000000000, float %284
  %287 = fcmp oeq float %98, 1.000000e+00
  %288 = fcmp oeq float %99, 0.000000e+00
  %289 = or i1 %288, %287
  %290 = select i1 %289, float 1.000000e+00, float %286
  %291 = fdiv contract float %290, %51
  %292 = fmul contract float %34, %291
  %293 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  store float %292, float addrspace(1)* %293, align 4, !tbaa !7
  %294 = fmul contract float %38, %291
  %295 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  store float %294, float addrspace(1)* %295, align 4, !tbaa !7
  %296 = fmul contract float %42, %291
  %297 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  store float %296, float addrspace(1)* %297, align 4, !tbaa !7
  br label %298

298:                                              ; preds = %274, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
