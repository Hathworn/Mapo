; ModuleID = '../data/hip_kernels/7295/0/main.cu'
source_filename = "../data/hip_kernels/7295/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15forces_and_stepPdS_jdt(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i32 %2, double %3, i16 %4) local_unnamed_addr #0 {
  %6 = zext i16 %4 to i32
  %7 = icmp eq i16 %4, 0
  br i1 %7, label %21, label %8

8:                                                ; preds = %5
  %9 = mul nuw nsw i32 %6, 5
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = mul i32 %9, %18
  %20 = mul i32 %2, 5
  br label %22

21:                                               ; preds = %297, %5
  ret void

22:                                               ; preds = %8, %297
  %23 = phi i32 [ %19, %8 ], [ %298, %297 ]
  %24 = phi i32 [ 0, %8 ], [ %299, %297 ]
  %25 = icmp ult i32 %23, %20
  br i1 %25, label %26, label %297

26:                                               ; preds = %22
  %27 = zext i32 %23 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %0, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7
  %30 = add nuw i32 %23, 1
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %0, i64 %31
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !7
  %34 = add i32 %23, 4
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  br label %66

37:                                               ; preds = %292
  %38 = add i32 %23, 2
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %43 = fdiv contract double %293, %42
  %44 = fmul contract double %43, %3
  %45 = fadd contract double %41, %44
  %46 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  store double %45, double addrspace(1)* %46, align 8, !tbaa !7
  %47 = add i32 %23, 3
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %0, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7
  %51 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %52 = fdiv contract double %294, %51
  %53 = fmul contract double %52, %3
  %54 = fadd contract double %50, %53
  %55 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  store double %54, double addrspace(1)* %55, align 8, !tbaa !7
  %56 = load double, double addrspace(1)* %28, align 8, !tbaa !7
  %57 = fmul contract double %45, %3
  %58 = fadd contract double %57, %56
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 %27
  store double %58, double addrspace(1)* %59, align 8, !tbaa !7
  %60 = load double, double addrspace(1)* %32, align 8, !tbaa !7
  %61 = fmul contract double %54, %3
  %62 = fadd contract double %60, %61
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %31
  store double %62, double addrspace(1)* %63, align 8, !tbaa !7
  %64 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %65 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  store double %64, double addrspace(1)* %65, align 8, !tbaa !7
  br label %297

66:                                               ; preds = %26, %292
  %67 = phi i32 [ 0, %26 ], [ %295, %292 ]
  %68 = phi double [ 0.000000e+00, %26 ], [ %294, %292 ]
  %69 = phi double [ 0.000000e+00, %26 ], [ %293, %292 ]
  %70 = zext i32 %67 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7
  %73 = fsub contract double %72, %29
  %74 = add nuw i32 %67, 1
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7
  %78 = fsub contract double %77, %33
  %79 = fcmp contract oeq double %73, 0.000000e+00
  %80 = fcmp contract oeq double %78, 0.000000e+00
  %81 = select i1 %79, i1 %80, i1 false
  br i1 %81, label %292, label %82

82:                                               ; preds = %66
  %83 = add i32 %67, 4
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7
  %87 = fmul contract double %86, 4.302000e-03
  %88 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %89 = fmul contract double %87, %88
  %90 = fmul contract double %73, %89
  %91 = fmul contract double %73, %73
  %92 = fmul contract double %78, %78
  %93 = fadd contract double %91, %92
  %94 = fcmp olt double %93, 0x1000000000000000
  %95 = select i1 %94, double 0x4FF0000000000000, double 1.000000e+00
  %96 = fmul double %93, %95
  %97 = tail call double @llvm.amdgcn.rsq.f64(double %96)
  %98 = fmul double %96, %97
  %99 = fmul double %97, 5.000000e-01
  %100 = fneg double %99
  %101 = tail call double @llvm.fma.f64(double %100, double %98, double 5.000000e-01)
  %102 = tail call double @llvm.fma.f64(double %99, double %101, double %99)
  %103 = tail call double @llvm.fma.f64(double %98, double %101, double %98)
  %104 = fneg double %103
  %105 = tail call double @llvm.fma.f64(double %104, double %103, double %96)
  %106 = tail call double @llvm.fma.f64(double %105, double %102, double %103)
  %107 = fneg double %106
  %108 = tail call double @llvm.fma.f64(double %107, double %106, double %96)
  %109 = tail call double @llvm.fma.f64(double %108, double %102, double %106)
  %110 = select i1 %94, double 0x37F0000000000000, double 1.000000e+00
  %111 = fmul double %110, %109
  %112 = fcmp oeq double %96, 0.000000e+00
  %113 = fcmp oeq double %96, 0x7FF0000000000000
  %114 = or i1 %112, %113
  %115 = select i1 %114, double %96, double %111
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
  %235 = fmul double %232, 3.000000e+00
  %236 = fneg double %235
  %237 = tail call double @llvm.fma.f64(double %232, double 3.000000e+00, double %236)
  %238 = tail call double @llvm.fma.f64(double %234, double 3.000000e+00, double %237)
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
  %275 = select i1 %274, double -0.000000e+00, double 0.000000e+00
  %276 = tail call double @llvm.copysign.f64(double %273, double %275)
  %277 = fcmp oeq double %116, 0x7FF0000000000000
  %278 = fcmp oeq double %115, 0.000000e+00
  %279 = or i1 %278, %277
  %280 = select i1 %278, double 0.000000e+00, double 0x7FF0000000000000
  %281 = tail call double @llvm.copysign.f64(double %280, double %115)
  %282 = select i1 %279, double %281, double %276
  %283 = fcmp uno double %115, 0.000000e+00
  %284 = select i1 %283, double 0x7FF8000000000000, double %282
  %285 = fcmp oeq double %115, 1.000000e+00
  %286 = select i1 %285, double 1.000000e+00, double %284
  %287 = fdiv contract double %90, %286
  %288 = fadd contract double %69, %287
  %289 = fmul contract double %78, %89
  %290 = fdiv contract double %289, %286
  %291 = fadd contract double %68, %290
  br label %292

292:                                              ; preds = %66, %82
  %293 = phi double [ %288, %82 ], [ %69, %66 ]
  %294 = phi double [ %291, %82 ], [ %68, %66 ]
  %295 = add i32 %67, 5
  %296 = icmp ult i32 %295, %20
  br i1 %296, label %66, label %37, !llvm.loop !11

297:                                              ; preds = %37, %22
  %298 = add i32 %23, 5
  %299 = add nuw nsw i32 %24, 1
  %300 = icmp eq i32 %299, %6
  br i1 %300, label %21, label %22, !llvm.loop !13
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
