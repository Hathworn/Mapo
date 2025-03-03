; ModuleID = '../data/hip_kernels/10552/43/main.cu'
source_filename = "../data/hip_kernels/10552/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8_kpoly64iiPdPiS0_S_S0_S0_S_dd(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture writeonly %8, double %9, double %10) local_unnamed_addr #0 {
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
  br i1 %25, label %26, label %304

26:                                               ; preds = %11
  %27 = tail call double @llvm.fabs.f64(double %10)
  %28 = tail call double @llvm.trunc.f64(double %27)
  %29 = fcmp oeq double %27, %28
  %30 = zext i1 %29 to i32
  %31 = fmul double %28, 5.000000e-01
  %32 = tail call double @llvm.amdgcn.fract.f64(double %31)
  %33 = tail call i1 @llvm.amdgcn.class.f64(double %31, i32 516)
  %34 = select i1 %33, double 0.000000e+00, double %32
  %35 = fcmp oeq double %34, 0.000000e+00
  %36 = and i1 %29, %35
  %37 = zext i1 %36 to i32
  %38 = add nuw nsw i32 %37, %30
  %39 = icmp eq i32 %38, 1
  %40 = icmp ne i32 %38, 0
  %41 = fcmp oeq double %27, 0x7FF0000000000000
  %42 = bitcast double %10 to <2 x i32>
  %43 = extractelement <2 x i32> %42, i64 1
  %44 = fcmp olt double %10, 0.000000e+00
  %45 = fcmp oeq double %10, 0.000000e+00
  %46 = udiv i32 %21, %18
  %47 = mul i32 %46, %18
  %48 = icmp ugt i32 %21, %47
  %49 = zext i1 %48 to i32
  %50 = add i32 %46, %49
  %51 = mul i32 %50, %18
  br label %52

52:                                               ; preds = %26, %110
  %53 = phi i32 [ %23, %26 ], [ %302, %110 ]
  %54 = freeze i32 %53
  %55 = freeze i32 %0
  %56 = sdiv i32 %54, %55
  %57 = mul i32 %56, %55
  %58 = sub i32 %54, %57
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %59
  %61 = bitcast i32 addrspace(1)* %60 to <2 x i32> addrspace(1)*
  %62 = load <2 x i32>, <2 x i32> addrspace(1)* %61, align 4, !tbaa !16
  %63 = extractelement <2 x i32> %62, i64 1
  %64 = add nsw i32 %63, -1
  %65 = sext i32 %56 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %65
  %67 = bitcast i32 addrspace(1)* %66 to <2 x i32> addrspace(1)*
  %68 = load <2 x i32>, <2 x i32> addrspace(1)* %67, align 4, !tbaa !16
  %69 = extractelement <2 x i32> %68, i64 1
  %70 = add nsw i32 %69, -1
  %71 = extractelement <2 x i32> %62, i64 0
  %72 = icmp slt i32 %71, %63
  %73 = extractelement <2 x i32> %68, i64 0
  %74 = icmp slt i32 %73, %69
  %75 = select i1 %72, i1 %74, i1 false
  br i1 %75, label %76, label %110

76:                                               ; preds = %52
  %77 = add nsw i32 %73, -1
  %78 = add nsw i32 %71, -1
  br label %79

79:                                               ; preds = %76, %103
  %80 = phi double [ %106, %103 ], [ 0.000000e+00, %76 ]
  %81 = phi i32 [ %105, %103 ], [ %78, %76 ]
  %82 = phi i32 [ %104, %103 ], [ %77, %76 ]
  %83 = sext i32 %81 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !16, !amdgpu.noclobber !6
  %86 = sext i32 %82 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !16, !amdgpu.noclobber !6
  %89 = icmp slt i32 %88, %85
  br i1 %89, label %90, label %92

90:                                               ; preds = %79
  %91 = add nsw i32 %82, 1
  br label %103

92:                                               ; preds = %79
  %93 = icmp slt i32 %85, %88
  %94 = add nsw i32 %81, 1
  br i1 %93, label %103, label %95

95:                                               ; preds = %92
  %96 = getelementptr inbounds double, double addrspace(1)* %2, i64 %83
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !20
  %98 = add nsw i32 %82, 1
  %99 = getelementptr inbounds double, double addrspace(1)* %5, i64 %86
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !20
  %101 = fmul contract double %97, %100
  %102 = fadd contract double %80, %101
  br label %103

103:                                              ; preds = %92, %95, %90
  %104 = phi i32 [ %91, %90 ], [ %98, %95 ], [ %82, %92 ]
  %105 = phi i32 [ %81, %90 ], [ %94, %95 ], [ %94, %92 ]
  %106 = phi double [ %80, %90 ], [ %102, %95 ], [ %80, %92 ]
  %107 = icmp slt i32 %105, %64
  %108 = icmp slt i32 %104, %70
  %109 = select i1 %107, i1 %108, i1 false
  br i1 %109, label %79, label %110, !llvm.loop !22

110:                                              ; preds = %103, %52
  %111 = phi double [ 0.000000e+00, %52 ], [ %106, %103 ]
  %112 = fadd contract double %111, %9
  %113 = tail call double @llvm.fabs.f64(double %112)
  %114 = tail call double @llvm.amdgcn.frexp.mant.f64(double %113)
  %115 = fcmp olt double %114, 0x3FE5555555555555
  %116 = zext i1 %115 to i32
  %117 = tail call double @llvm.amdgcn.ldexp.f64(double %114, i32 %116)
  %118 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %113)
  %119 = sub nsw i32 %118, %116
  %120 = fadd double %117, -1.000000e+00
  %121 = fadd double %117, 1.000000e+00
  %122 = fadd double %121, -1.000000e+00
  %123 = fsub double %117, %122
  %124 = tail call double @llvm.amdgcn.rcp.f64(double %121)
  %125 = fneg double %121
  %126 = tail call double @llvm.fma.f64(double %125, double %124, double 1.000000e+00)
  %127 = tail call double @llvm.fma.f64(double %126, double %124, double %124)
  %128 = tail call double @llvm.fma.f64(double %125, double %127, double 1.000000e+00)
  %129 = tail call double @llvm.fma.f64(double %128, double %127, double %127)
  %130 = fmul double %120, %129
  %131 = fmul double %121, %130
  %132 = fneg double %131
  %133 = tail call double @llvm.fma.f64(double %130, double %121, double %132)
  %134 = tail call double @llvm.fma.f64(double %130, double %123, double %133)
  %135 = fadd double %131, %134
  %136 = fsub double %135, %131
  %137 = fsub double %134, %136
  %138 = fsub double %120, %135
  %139 = fsub double %120, %138
  %140 = fsub double %139, %135
  %141 = fsub double %140, %137
  %142 = fadd double %138, %141
  %143 = fmul double %129, %142
  %144 = fadd double %130, %143
  %145 = fsub double %144, %130
  %146 = fsub double %143, %145
  %147 = fmul double %144, %144
  %148 = fneg double %147
  %149 = tail call double @llvm.fma.f64(double %144, double %144, double %148)
  %150 = fmul double %146, 2.000000e+00
  %151 = tail call double @llvm.fma.f64(double %144, double %150, double %149)
  %152 = fadd double %147, %151
  %153 = fsub double %152, %147
  %154 = fsub double %151, %153
  %155 = tail call double @llvm.fma.f64(double %152, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %156 = tail call double @llvm.fma.f64(double %152, double %155, double 0x3FBE25E43ABE935A)
  %157 = tail call double @llvm.fma.f64(double %152, double %156, double 0x3FC110EF47E6C9C2)
  %158 = tail call double @llvm.fma.f64(double %152, double %157, double 0x3FC3B13BCFA74449)
  %159 = tail call double @llvm.fma.f64(double %152, double %158, double 0x3FC745D171BF3C30)
  %160 = tail call double @llvm.fma.f64(double %152, double %159, double 0x3FCC71C71C7792CE)
  %161 = tail call double @llvm.fma.f64(double %152, double %160, double 0x3FD24924924920DA)
  %162 = tail call double @llvm.fma.f64(double %152, double %161, double 0x3FD999999999999C)
  %163 = sitofp i32 %119 to double
  %164 = fmul double %163, 0x3FE62E42FEFA39EF
  %165 = fneg double %164
  %166 = tail call double @llvm.fma.f64(double %163, double 0x3FE62E42FEFA39EF, double %165)
  %167 = tail call double @llvm.fma.f64(double %163, double 0x3C7ABC9E3B39803F, double %166)
  %168 = fadd double %164, %167
  %169 = fsub double %168, %164
  %170 = fsub double %167, %169
  %171 = tail call double @llvm.amdgcn.ldexp.f64(double %144, i32 1)
  %172 = tail call double @llvm.amdgcn.ldexp.f64(double %146, i32 1)
  %173 = fmul double %144, %152
  %174 = fneg double %173
  %175 = tail call double @llvm.fma.f64(double %152, double %144, double %174)
  %176 = tail call double @llvm.fma.f64(double %152, double %146, double %175)
  %177 = tail call double @llvm.fma.f64(double %154, double %144, double %176)
  %178 = fadd double %173, %177
  %179 = fsub double %178, %173
  %180 = fsub double %177, %179
  %181 = fmul double %152, %162
  %182 = fneg double %181
  %183 = tail call double @llvm.fma.f64(double %152, double %162, double %182)
  %184 = tail call double @llvm.fma.f64(double %154, double %162, double %183)
  %185 = fadd double %181, %184
  %186 = fsub double %185, %181
  %187 = fsub double %184, %186
  %188 = fadd double %185, 0x3FE5555555555555
  %189 = fadd double %188, 0xBFE5555555555555
  %190 = fsub double %185, %189
  %191 = fadd double %187, 0x3C8543B0D5DF274D
  %192 = fadd double %191, %190
  %193 = fadd double %188, %192
  %194 = fsub double %193, %188
  %195 = fsub double %192, %194
  %196 = fmul double %178, %193
  %197 = fneg double %196
  %198 = tail call double @llvm.fma.f64(double %178, double %193, double %197)
  %199 = tail call double @llvm.fma.f64(double %178, double %195, double %198)
  %200 = tail call double @llvm.fma.f64(double %180, double %193, double %199)
  %201 = fadd double %196, %200
  %202 = fsub double %201, %196
  %203 = fsub double %200, %202
  %204 = fadd double %171, %201
  %205 = fsub double %204, %171
  %206 = fsub double %201, %205
  %207 = fadd double %172, %203
  %208 = fadd double %207, %206
  %209 = fadd double %204, %208
  %210 = fsub double %209, %204
  %211 = fsub double %208, %210
  %212 = fadd double %168, %209
  %213 = fsub double %212, %168
  %214 = fsub double %212, %213
  %215 = fsub double %168, %214
  %216 = fsub double %209, %213
  %217 = fadd double %216, %215
  %218 = fadd double %170, %211
  %219 = fsub double %218, %170
  %220 = fsub double %218, %219
  %221 = fsub double %170, %220
  %222 = fsub double %211, %219
  %223 = fadd double %222, %221
  %224 = fadd double %218, %217
  %225 = fadd double %212, %224
  %226 = fsub double %225, %212
  %227 = fsub double %224, %226
  %228 = fadd double %223, %227
  %229 = fadd double %225, %228
  %230 = fsub double %229, %225
  %231 = fsub double %228, %230
  %232 = fmul double %229, %10
  %233 = fneg double %232
  %234 = tail call double @llvm.fma.f64(double %10, double %229, double %233)
  %235 = tail call double @llvm.fma.f64(double %10, double %231, double %234)
  %236 = fadd double %232, %235
  %237 = fsub double %236, %232
  %238 = fsub double %235, %237
  %239 = tail call double @llvm.fabs.f64(double %232) #3
  %240 = fcmp oeq double %239, 0x7FF0000000000000
  %241 = select i1 %240, double %232, double %236
  %242 = tail call double @llvm.fabs.f64(double %241) #3
  %243 = fcmp oeq double %242, 0x7FF0000000000000
  %244 = select i1 %243, double 0.000000e+00, double %238
  %245 = fmul double %241, 0x3FF71547652B82FE
  %246 = tail call double @llvm.rint.f64(double %245)
  %247 = fneg double %246
  %248 = tail call double @llvm.fma.f64(double %247, double 0x3FE62E42FEFA39EF, double %241)
  %249 = tail call double @llvm.fma.f64(double %247, double 0x3C7ABC9E3B39803F, double %248)
  %250 = tail call double @llvm.fma.f64(double %249, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %251 = tail call double @llvm.fma.f64(double %249, double %250, double 0x3EC71DEE623FDE64)
  %252 = tail call double @llvm.fma.f64(double %249, double %251, double 0x3EFA01997C89E6B0)
  %253 = tail call double @llvm.fma.f64(double %249, double %252, double 0x3F2A01A014761F6E)
  %254 = tail call double @llvm.fma.f64(double %249, double %253, double 0x3F56C16C1852B7B0)
  %255 = tail call double @llvm.fma.f64(double %249, double %254, double 0x3F81111111122322)
  %256 = tail call double @llvm.fma.f64(double %249, double %255, double 0x3FA55555555502A1)
  %257 = tail call double @llvm.fma.f64(double %249, double %256, double 0x3FC5555555555511)
  %258 = tail call double @llvm.fma.f64(double %249, double %257, double 0x3FE000000000000B)
  %259 = tail call double @llvm.fma.f64(double %249, double %258, double 1.000000e+00)
  %260 = tail call double @llvm.fma.f64(double %249, double %259, double 1.000000e+00)
  %261 = fptosi double %246 to i32
  %262 = tail call double @llvm.amdgcn.ldexp.f64(double %260, i32 %261)
  %263 = fcmp ogt double %241, 1.024000e+03
  %264 = select i1 %263, double 0x7FF0000000000000, double %262
  %265 = fcmp olt double %241, -1.075000e+03
  %266 = select i1 %265, double 0.000000e+00, double %264
  %267 = tail call double @llvm.fma.f64(double %266, double %244, double %266)
  %268 = tail call double @llvm.fabs.f64(double %266) #3
  %269 = fcmp oeq double %268, 0x7FF0000000000000
  %270 = select i1 %269, double %266, double %267
  %271 = fcmp olt double %112, 0.000000e+00
  %272 = and i1 %39, %271
  %273 = select i1 %272, double -0.000000e+00, double 0.000000e+00
  %274 = tail call double @llvm.copysign.f64(double %270, double %273)
  %275 = fcmp uge double %112, 0.000000e+00
  %276 = select i1 %275, i1 true, i1 %40
  %277 = select i1 %276, double %274, double 0x7FF8000000000000
  %278 = fcmp oeq double %113, 1.000000e+00
  %279 = fadd double %113, -1.000000e+00
  %280 = bitcast double %279 to <2 x i32>
  %281 = extractelement <2 x i32> %280, i64 1
  %282 = xor i32 %281, %43
  %283 = icmp sgt i32 %282, -1
  %284 = select i1 %283, double 0x7FF0000000000000, double 0.000000e+00
  %285 = select i1 %278, double %113, double %284
  %286 = select i1 %41, double %285, double %277
  %287 = fcmp oeq double %113, 0x7FF0000000000000
  %288 = fcmp oeq double %112, 0.000000e+00
  %289 = or i1 %288, %287
  %290 = xor i1 %44, %288
  %291 = select i1 %290, double 0.000000e+00, double 0x7FF0000000000000
  %292 = select i1 %39, double %112, double 0.000000e+00
  %293 = tail call double @llvm.copysign.f64(double %291, double %292)
  %294 = select i1 %289, double %293, double %286
  %295 = fcmp uno double %112, %10
  %296 = select i1 %295, double 0x7FF8000000000000, double %294
  %297 = fcmp oeq double %112, 1.000000e+00
  %298 = or i1 %45, %297
  %299 = select i1 %298, double 1.000000e+00, double %296
  %300 = sext i32 %53 to i64
  %301 = getelementptr inbounds double, double addrspace(1)* %8, i64 %300
  store double %299, double addrspace(1)* %301, align 8, !tbaa !20
  %302 = add i32 %51, %53
  %303 = icmp slt i32 %302, %24
  br i1 %303, label %52, label %304, !llvm.loop !24

304:                                              ; preds = %110, %11
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
!21 = !{!"double", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
