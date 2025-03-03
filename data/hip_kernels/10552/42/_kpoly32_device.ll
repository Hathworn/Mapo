; ModuleID = '../data/hip_kernels/10552/42/main.cu'
source_filename = "../data/hip_kernels/10552/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8_kpoly32iiPfPiS0_S_S0_S0_S_ff(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8, float %9, float %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !7
  %22 = mul i32 %13, %18
  %23 = add i32 %22, %12
  %24 = mul nsw i32 %1, %0
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %308

26:                                               ; preds = %11
  %27 = fpext float %9 to double
  %28 = fpext float %10 to double
  %29 = tail call double @llvm.fabs.f64(double %28)
  %30 = tail call double @llvm.trunc.f64(double %29)
  %31 = fcmp oeq double %29, %30
  %32 = zext i1 %31 to i32
  %33 = fmul double %30, 5.000000e-01
  %34 = tail call double @llvm.amdgcn.fract.f64(double %33)
  %35 = tail call i1 @llvm.amdgcn.class.f64(double %33, i32 516)
  %36 = select i1 %35, double 0.000000e+00, double %34
  %37 = fcmp oeq double %36, 0.000000e+00
  %38 = and i1 %31, %37
  %39 = zext i1 %38 to i32
  %40 = add nuw nsw i32 %39, %32
  %41 = icmp eq i32 %40, 1
  %42 = icmp ne i32 %40, 0
  %43 = fcmp oeq double %29, 0x7FF0000000000000
  %44 = bitcast double %28 to <2 x i32>
  %45 = extractelement <2 x i32> %44, i64 1
  %46 = fcmp olt float %10, 0.000000e+00
  %47 = fcmp oeq float %10, 0.000000e+00
  %48 = udiv i32 %21, %18
  %49 = mul i32 %48, %18
  %50 = icmp ugt i32 %21, %49
  %51 = zext i1 %50 to i32
  %52 = add i32 %48, %51
  %53 = mul i32 %52, %18
  br label %54

54:                                               ; preds = %26, %113
  %55 = phi i32 [ %23, %26 ], [ %306, %113 ]
  %56 = freeze i32 %55
  %57 = freeze i32 %0
  %58 = sdiv i32 %56, %57
  %59 = mul i32 %58, %57
  %60 = sub i32 %56, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %61
  %63 = bitcast i32 addrspace(1)* %62 to <2 x i32> addrspace(1)*
  %64 = load <2 x i32>, <2 x i32> addrspace(1)* %63, align 4, !tbaa !16
  %65 = extractelement <2 x i32> %64, i64 1
  %66 = add nsw i32 %65, -1
  %67 = sext i32 %58 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %67
  %69 = bitcast i32 addrspace(1)* %68 to <2 x i32> addrspace(1)*
  %70 = load <2 x i32>, <2 x i32> addrspace(1)* %69, align 4, !tbaa !16
  %71 = extractelement <2 x i32> %70, i64 1
  %72 = add nsw i32 %71, -1
  %73 = extractelement <2 x i32> %64, i64 0
  %74 = icmp slt i32 %73, %65
  %75 = extractelement <2 x i32> %70, i64 0
  %76 = icmp slt i32 %75, %71
  %77 = select i1 %74, i1 %76, i1 false
  br i1 %77, label %78, label %113

78:                                               ; preds = %54
  %79 = add nsw i32 %75, -1
  %80 = add nsw i32 %73, -1
  br label %81

81:                                               ; preds = %78, %106
  %82 = phi double [ %109, %106 ], [ 0.000000e+00, %78 ]
  %83 = phi i32 [ %108, %106 ], [ %80, %78 ]
  %84 = phi i32 [ %107, %106 ], [ %79, %78 ]
  %85 = sext i32 %83 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !16, !amdgpu.noclobber !6
  %88 = sext i32 %84 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !6
  %91 = icmp slt i32 %90, %87
  br i1 %91, label %92, label %94

92:                                               ; preds = %81
  %93 = add nsw i32 %84, 1
  br label %106

94:                                               ; preds = %81
  %95 = icmp slt i32 %87, %90
  %96 = add nsw i32 %83, 1
  br i1 %95, label %106, label %97

97:                                               ; preds = %94
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !20
  %100 = add nsw i32 %84, 1
  %101 = getelementptr inbounds float, float addrspace(1)* %5, i64 %88
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !20
  %103 = fmul contract float %99, %102
  %104 = fpext float %103 to double
  %105 = fadd contract double %82, %104
  br label %106

106:                                              ; preds = %94, %97, %92
  %107 = phi i32 [ %93, %92 ], [ %100, %97 ], [ %84, %94 ]
  %108 = phi i32 [ %83, %92 ], [ %96, %97 ], [ %96, %94 ]
  %109 = phi double [ %82, %92 ], [ %105, %97 ], [ %82, %94 ]
  %110 = icmp slt i32 %108, %66
  %111 = icmp slt i32 %107, %72
  %112 = select i1 %110, i1 %111, i1 false
  br i1 %112, label %81, label %113, !llvm.loop !22

113:                                              ; preds = %106, %54
  %114 = phi double [ 0.000000e+00, %54 ], [ %109, %106 ]
  %115 = fadd contract double %114, %27
  %116 = tail call double @llvm.fabs.f64(double %115)
  %117 = tail call double @llvm.amdgcn.frexp.mant.f64(double %116)
  %118 = fcmp olt double %117, 0x3FE5555555555555
  %119 = zext i1 %118 to i32
  %120 = tail call double @llvm.amdgcn.ldexp.f64(double %117, i32 %119)
  %121 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %116)
  %122 = sub nsw i32 %121, %119
  %123 = fadd double %120, -1.000000e+00
  %124 = fadd double %120, 1.000000e+00
  %125 = fadd double %124, -1.000000e+00
  %126 = fsub double %120, %125
  %127 = tail call double @llvm.amdgcn.rcp.f64(double %124)
  %128 = fneg double %124
  %129 = tail call double @llvm.fma.f64(double %128, double %127, double 1.000000e+00)
  %130 = tail call double @llvm.fma.f64(double %129, double %127, double %127)
  %131 = tail call double @llvm.fma.f64(double %128, double %130, double 1.000000e+00)
  %132 = tail call double @llvm.fma.f64(double %131, double %130, double %130)
  %133 = fmul double %123, %132
  %134 = fmul double %124, %133
  %135 = fneg double %134
  %136 = tail call double @llvm.fma.f64(double %133, double %124, double %135)
  %137 = tail call double @llvm.fma.f64(double %133, double %126, double %136)
  %138 = fadd double %134, %137
  %139 = fsub double %138, %134
  %140 = fsub double %137, %139
  %141 = fsub double %123, %138
  %142 = fsub double %123, %141
  %143 = fsub double %142, %138
  %144 = fsub double %143, %140
  %145 = fadd double %141, %144
  %146 = fmul double %132, %145
  %147 = fadd double %133, %146
  %148 = fsub double %147, %133
  %149 = fsub double %146, %148
  %150 = fmul double %147, %147
  %151 = fneg double %150
  %152 = tail call double @llvm.fma.f64(double %147, double %147, double %151)
  %153 = fmul double %149, 2.000000e+00
  %154 = tail call double @llvm.fma.f64(double %147, double %153, double %152)
  %155 = fadd double %150, %154
  %156 = fsub double %155, %150
  %157 = fsub double %154, %156
  %158 = tail call double @llvm.fma.f64(double %155, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %159 = tail call double @llvm.fma.f64(double %155, double %158, double 0x3FBE25E43ABE935A)
  %160 = tail call double @llvm.fma.f64(double %155, double %159, double 0x3FC110EF47E6C9C2)
  %161 = tail call double @llvm.fma.f64(double %155, double %160, double 0x3FC3B13BCFA74449)
  %162 = tail call double @llvm.fma.f64(double %155, double %161, double 0x3FC745D171BF3C30)
  %163 = tail call double @llvm.fma.f64(double %155, double %162, double 0x3FCC71C71C7792CE)
  %164 = tail call double @llvm.fma.f64(double %155, double %163, double 0x3FD24924924920DA)
  %165 = tail call double @llvm.fma.f64(double %155, double %164, double 0x3FD999999999999C)
  %166 = sitofp i32 %122 to double
  %167 = fmul double %166, 0x3FE62E42FEFA39EF
  %168 = fneg double %167
  %169 = tail call double @llvm.fma.f64(double %166, double 0x3FE62E42FEFA39EF, double %168)
  %170 = tail call double @llvm.fma.f64(double %166, double 0x3C7ABC9E3B39803F, double %169)
  %171 = fadd double %167, %170
  %172 = fsub double %171, %167
  %173 = fsub double %170, %172
  %174 = tail call double @llvm.amdgcn.ldexp.f64(double %147, i32 1)
  %175 = tail call double @llvm.amdgcn.ldexp.f64(double %149, i32 1)
  %176 = fmul double %147, %155
  %177 = fneg double %176
  %178 = tail call double @llvm.fma.f64(double %155, double %147, double %177)
  %179 = tail call double @llvm.fma.f64(double %155, double %149, double %178)
  %180 = tail call double @llvm.fma.f64(double %157, double %147, double %179)
  %181 = fadd double %176, %180
  %182 = fsub double %181, %176
  %183 = fsub double %180, %182
  %184 = fmul double %155, %165
  %185 = fneg double %184
  %186 = tail call double @llvm.fma.f64(double %155, double %165, double %185)
  %187 = tail call double @llvm.fma.f64(double %157, double %165, double %186)
  %188 = fadd double %184, %187
  %189 = fsub double %188, %184
  %190 = fsub double %187, %189
  %191 = fadd double %188, 0x3FE5555555555555
  %192 = fadd double %191, 0xBFE5555555555555
  %193 = fsub double %188, %192
  %194 = fadd double %190, 0x3C8543B0D5DF274D
  %195 = fadd double %194, %193
  %196 = fadd double %191, %195
  %197 = fsub double %196, %191
  %198 = fsub double %195, %197
  %199 = fmul double %181, %196
  %200 = fneg double %199
  %201 = tail call double @llvm.fma.f64(double %181, double %196, double %200)
  %202 = tail call double @llvm.fma.f64(double %181, double %198, double %201)
  %203 = tail call double @llvm.fma.f64(double %183, double %196, double %202)
  %204 = fadd double %199, %203
  %205 = fsub double %204, %199
  %206 = fsub double %203, %205
  %207 = fadd double %174, %204
  %208 = fsub double %207, %174
  %209 = fsub double %204, %208
  %210 = fadd double %175, %206
  %211 = fadd double %210, %209
  %212 = fadd double %207, %211
  %213 = fsub double %212, %207
  %214 = fsub double %211, %213
  %215 = fadd double %171, %212
  %216 = fsub double %215, %171
  %217 = fsub double %215, %216
  %218 = fsub double %171, %217
  %219 = fsub double %212, %216
  %220 = fadd double %219, %218
  %221 = fadd double %173, %214
  %222 = fsub double %221, %173
  %223 = fsub double %221, %222
  %224 = fsub double %173, %223
  %225 = fsub double %214, %222
  %226 = fadd double %225, %224
  %227 = fadd double %221, %220
  %228 = fadd double %215, %227
  %229 = fsub double %228, %215
  %230 = fsub double %227, %229
  %231 = fadd double %226, %230
  %232 = fadd double %228, %231
  %233 = fsub double %232, %228
  %234 = fsub double %231, %233
  %235 = fmul double %232, %28
  %236 = fneg double %235
  %237 = tail call double @llvm.fma.f64(double %28, double %232, double %236)
  %238 = tail call double @llvm.fma.f64(double %28, double %234, double %237)
  %239 = fadd double %235, %238
  %240 = fsub double %239, %235
  %241 = fsub double %238, %240
  %242 = tail call double @llvm.fabs.f64(double %235) #3
  %243 = fcmp oeq double %242, 0x7FF0000000000000
  %244 = select i1 %243, double %235, double %239
  %245 = tail call double @llvm.fabs.f64(double %244) #3
  %246 = fcmp oeq double %245, 0x7FF0000000000000
  %247 = select i1 %246, double 0.000000e+00, double %241
  %248 = fmul double %244, 0x3FF71547652B82FE
  %249 = tail call double @llvm.rint.f64(double %248)
  %250 = fneg double %249
  %251 = tail call double @llvm.fma.f64(double %250, double 0x3FE62E42FEFA39EF, double %244)
  %252 = tail call double @llvm.fma.f64(double %250, double 0x3C7ABC9E3B39803F, double %251)
  %253 = tail call double @llvm.fma.f64(double %252, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %254 = tail call double @llvm.fma.f64(double %252, double %253, double 0x3EC71DEE623FDE64)
  %255 = tail call double @llvm.fma.f64(double %252, double %254, double 0x3EFA01997C89E6B0)
  %256 = tail call double @llvm.fma.f64(double %252, double %255, double 0x3F2A01A014761F6E)
  %257 = tail call double @llvm.fma.f64(double %252, double %256, double 0x3F56C16C1852B7B0)
  %258 = tail call double @llvm.fma.f64(double %252, double %257, double 0x3F81111111122322)
  %259 = tail call double @llvm.fma.f64(double %252, double %258, double 0x3FA55555555502A1)
  %260 = tail call double @llvm.fma.f64(double %252, double %259, double 0x3FC5555555555511)
  %261 = tail call double @llvm.fma.f64(double %252, double %260, double 0x3FE000000000000B)
  %262 = tail call double @llvm.fma.f64(double %252, double %261, double 1.000000e+00)
  %263 = tail call double @llvm.fma.f64(double %252, double %262, double 1.000000e+00)
  %264 = fptosi double %249 to i32
  %265 = tail call double @llvm.amdgcn.ldexp.f64(double %263, i32 %264)
  %266 = fcmp ogt double %244, 1.024000e+03
  %267 = select i1 %266, double 0x7FF0000000000000, double %265
  %268 = fcmp olt double %244, -1.075000e+03
  %269 = select i1 %268, double 0.000000e+00, double %267
  %270 = tail call double @llvm.fma.f64(double %269, double %247, double %269)
  %271 = tail call double @llvm.fabs.f64(double %269) #3
  %272 = fcmp oeq double %271, 0x7FF0000000000000
  %273 = select i1 %272, double %269, double %270
  %274 = fcmp olt double %115, 0.000000e+00
  %275 = and i1 %41, %274
  %276 = select i1 %275, double -0.000000e+00, double 0.000000e+00
  %277 = tail call double @llvm.copysign.f64(double %273, double %276)
  %278 = fcmp uge double %115, 0.000000e+00
  %279 = select i1 %278, i1 true, i1 %42
  %280 = select i1 %279, double %277, double 0x7FF8000000000000
  %281 = fcmp oeq double %116, 1.000000e+00
  %282 = fadd double %116, -1.000000e+00
  %283 = bitcast double %282 to <2 x i32>
  %284 = extractelement <2 x i32> %283, i64 1
  %285 = xor i32 %284, %45
  %286 = icmp sgt i32 %285, -1
  %287 = select i1 %286, double 0x7FF0000000000000, double 0.000000e+00
  %288 = select i1 %281, double %116, double %287
  %289 = select i1 %43, double %288, double %280
  %290 = fcmp oeq double %116, 0x7FF0000000000000
  %291 = fcmp oeq double %115, 0.000000e+00
  %292 = or i1 %291, %290
  %293 = xor i1 %46, %291
  %294 = select i1 %293, double 0.000000e+00, double 0x7FF0000000000000
  %295 = select i1 %41, double %115, double 0.000000e+00
  %296 = tail call double @llvm.copysign.f64(double %294, double %295)
  %297 = select i1 %292, double %296, double %289
  %298 = fcmp uno double %115, %28
  %299 = select i1 %298, double 0x7FF8000000000000, double %297
  %300 = fcmp oeq double %115, 1.000000e+00
  %301 = or i1 %47, %300
  %302 = fptrunc double %299 to float
  %303 = select i1 %301, float 1.000000e+00, float %302
  %304 = sext i32 %55 to i64
  %305 = getelementptr inbounds float, float addrspace(1)* %8, i64 %304
  store float %303, float addrspace(1)* %305, align 4, !tbaa !20
  %306 = add i32 %53, %55
  %307 = icmp slt i32 %306, %24
  br i1 %307, label %54, label %308, !llvm.loop !24

308:                                              ; preds = %113, %11
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.trunc.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
