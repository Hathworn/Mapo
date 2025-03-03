; ModuleID = '../data/hip_kernels/8685/4/main.cu'
source_filename = "../data/hip_kernels/8685/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10randomWalkPdPiiii(double addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, %4
  br i1 %15, label %16, label %295

16:                                               ; preds = %5
  %17 = mul i32 %14, %3
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  store i32 0, i32 addrspace(1)* %19, align 4, !tbaa !7
  %20 = sext i32 %17 to i64
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 %20
  store double 0.000000e+00, double addrspace(1)* %21, align 8, !tbaa !11
  %22 = add nsw i32 %17, %3
  %23 = icmp sgt i32 %3, 1
  br i1 %23, label %24, label %295

24:                                               ; preds = %16
  %25 = add nsw i32 %17, 1
  %26 = sitofp i32 %2 to double
  %27 = sitofp i32 %3 to double
  %28 = fdiv contract double %26, %27
  %29 = fcmp olt double %28, 0x1000000000000000
  %30 = select i1 %29, double 0x4FF0000000000000, double 1.000000e+00
  %31 = fmul double %28, %30
  %32 = tail call double @llvm.amdgcn.rsq.f64(double %31)
  %33 = fmul double %31, %32
  %34 = fmul double %32, 5.000000e-01
  %35 = fneg double %34
  %36 = tail call double @llvm.fma.f64(double %35, double %33, double 5.000000e-01)
  %37 = tail call double @llvm.fma.f64(double %34, double %36, double %34)
  %38 = tail call double @llvm.fma.f64(double %33, double %36, double %33)
  %39 = fneg double %38
  %40 = tail call double @llvm.fma.f64(double %39, double %38, double %31)
  %41 = tail call double @llvm.fma.f64(double %40, double %37, double %38)
  %42 = fneg double %41
  %43 = tail call double @llvm.fma.f64(double %42, double %41, double %31)
  %44 = tail call double @llvm.fma.f64(double %43, double %37, double %41)
  %45 = select i1 %29, double 0x37F0000000000000, double 1.000000e+00
  %46 = fmul double %45, %44
  %47 = fcmp oeq double %31, 0.000000e+00
  %48 = fcmp oeq double %31, 0x7FF0000000000000
  %49 = or i1 %47, %48
  %50 = select i1 %49, double %31, double %46
  br label %51

51:                                               ; preds = %24, %278
  %52 = phi double [ 0.000000e+00, %24 ], [ %290, %278 ]
  %53 = phi i32 [ %25, %24 ], [ %293, %278 ]
  %54 = phi i32 [ %17, %24 ], [ %53, %278 ]
  %55 = phi i32 [ 485462757, %24 ], [ %287, %278 ]
  %56 = phi i32 [ -1836744730, %24 ], [ %286, %278 ]
  %57 = phi i32 [ 0, %24 ], [ %285, %278 ]
  %58 = phi i32 [ -1894485380, %24 ], [ %284, %278 ]
  %59 = phi double [ undef, %24 ], [ %283, %278 ]
  %60 = phi i32 [ -1719071262, %24 ], [ %282, %278 ]
  %61 = phi i32 [ -2018044632, %24 ], [ %281, %278 ]
  %62 = phi i32 [ -1452303100, %24 ], [ %280, %278 ]
  %63 = icmp eq i32 %57, 0
  br i1 %63, label %67, label %64

64:                                               ; preds = %51
  %65 = fptrunc double %59 to float
  %66 = fpext float %65 to double
  br label %278

67:                                               ; preds = %51
  %68 = lshr i32 %60, 2
  %69 = xor i32 %68, %60
  %70 = shl i32 %56, 4
  %71 = shl i32 %69, 1
  %72 = xor i32 %71, %70
  %73 = xor i32 %72, %69
  %74 = xor i32 %73, %56
  %75 = add i32 %55, 362437
  %76 = add i32 %75, %74
  %77 = lshr i32 %61, 2
  %78 = xor i32 %77, %61
  %79 = shl i32 %74, 4
  %80 = shl i32 %78, 1
  %81 = xor i32 %80, %79
  %82 = xor i32 %81, %78
  %83 = xor i32 %82, %74
  %84 = add i32 %55, 724874
  %85 = add i32 %84, %83
  %86 = lshr i32 %62, 2
  %87 = xor i32 %86, %62
  %88 = shl i32 %83, 4
  %89 = shl i32 %87, 1
  %90 = xor i32 %89, %88
  %91 = xor i32 %90, %87
  %92 = xor i32 %91, %83
  %93 = add i32 %55, 1087311
  %94 = add i32 %93, %92
  %95 = lshr i32 %58, 2
  %96 = xor i32 %95, %58
  %97 = shl i32 %92, 4
  %98 = shl i32 %96, 1
  %99 = xor i32 %98, %97
  %100 = xor i32 %99, %96
  %101 = xor i32 %100, %92
  %102 = add i32 %55, 1449748
  %103 = add i32 %101, %102
  %104 = zext i32 %76 to i64
  %105 = zext i32 %85 to i64
  %106 = shl nuw nsw i64 %105, 21
  %107 = xor i64 %106, %104
  %108 = uitofp i64 %107 to double
  %109 = fmul contract double %108, 0x3CA0000000000000
  %110 = fadd contract double %109, 0x3CA0000000000000
  %111 = zext i32 %94 to i64
  %112 = zext i32 %103 to i64
  %113 = shl nuw nsw i64 %112, 21
  %114 = xor i64 %113, %111
  %115 = uitofp i64 %114 to double
  %116 = fmul contract double %115, 0x3CB0000000000000
  %117 = fadd contract double %116, 0x3CB0000000000000
  %118 = tail call double @llvm.amdgcn.frexp.mant.f64(double %110)
  %119 = fcmp olt double %118, 0x3FE5555555555555
  %120 = zext i1 %119 to i32
  %121 = tail call double @llvm.amdgcn.ldexp.f64(double %118, i32 %120)
  %122 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %110)
  %123 = sub nsw i32 %122, %120
  %124 = fadd double %121, -1.000000e+00
  %125 = fadd double %121, 1.000000e+00
  %126 = fadd double %125, -1.000000e+00
  %127 = fsub double %121, %126
  %128 = tail call double @llvm.amdgcn.rcp.f64(double %125)
  %129 = fneg double %125
  %130 = tail call double @llvm.fma.f64(double %129, double %128, double 1.000000e+00)
  %131 = tail call double @llvm.fma.f64(double %130, double %128, double %128)
  %132 = tail call double @llvm.fma.f64(double %129, double %131, double 1.000000e+00)
  %133 = tail call double @llvm.fma.f64(double %132, double %131, double %131)
  %134 = fmul double %124, %133
  %135 = fmul double %125, %134
  %136 = fneg double %135
  %137 = tail call double @llvm.fma.f64(double %134, double %125, double %136)
  %138 = tail call double @llvm.fma.f64(double %134, double %127, double %137)
  %139 = fadd double %135, %138
  %140 = fsub double %139, %135
  %141 = fsub double %138, %140
  %142 = fsub double %124, %139
  %143 = fsub double %124, %142
  %144 = fsub double %143, %139
  %145 = fsub double %144, %141
  %146 = fadd double %142, %145
  %147 = fmul double %133, %146
  %148 = fadd double %134, %147
  %149 = fsub double %148, %134
  %150 = fsub double %147, %149
  %151 = fmul double %148, %148
  %152 = tail call double @llvm.fma.f64(double %151, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %153 = tail call double @llvm.fma.f64(double %151, double %152, double 0x3FC7474DD7F4DF2E)
  %154 = tail call double @llvm.fma.f64(double %151, double %153, double 0x3FCC71C016291751)
  %155 = tail call double @llvm.fma.f64(double %151, double %154, double 0x3FD249249B27ACF1)
  %156 = tail call double @llvm.fma.f64(double %151, double %155, double 0x3FD99999998EF7B6)
  %157 = tail call double @llvm.fma.f64(double %151, double %156, double 0x3FE5555555555780)
  %158 = tail call double @llvm.amdgcn.ldexp.f64(double %148, i32 1)
  %159 = tail call double @llvm.amdgcn.ldexp.f64(double %150, i32 1)
  %160 = fmul double %148, %151
  %161 = fmul double %160, %157
  %162 = fadd double %158, %161
  %163 = fsub double %162, %158
  %164 = fsub double %161, %163
  %165 = fadd double %159, %164
  %166 = fadd double %162, %165
  %167 = fsub double %166, %162
  %168 = fsub double %165, %167
  %169 = sitofp i32 %123 to double
  %170 = fmul double %169, 0x3FE62E42FEFA39EF
  %171 = fneg double %170
  %172 = tail call double @llvm.fma.f64(double %169, double 0x3FE62E42FEFA39EF, double %171)
  %173 = tail call double @llvm.fma.f64(double %169, double 0x3C7ABC9E3B39803F, double %172)
  %174 = fadd double %170, %173
  %175 = fsub double %174, %170
  %176 = fsub double %173, %175
  %177 = fadd double %174, %166
  %178 = fsub double %177, %174
  %179 = fsub double %177, %178
  %180 = fsub double %174, %179
  %181 = fsub double %166, %178
  %182 = fadd double %181, %180
  %183 = fadd double %176, %168
  %184 = fsub double %183, %176
  %185 = fsub double %183, %184
  %186 = fsub double %176, %185
  %187 = fsub double %168, %184
  %188 = fadd double %187, %186
  %189 = fadd double %183, %182
  %190 = fadd double %177, %189
  %191 = fsub double %190, %177
  %192 = fsub double %189, %191
  %193 = fadd double %188, %192
  %194 = fadd double %190, %193
  %195 = fcmp oeq double %110, 0x7FF0000000000000
  %196 = select i1 %195, double %110, double %194
  %197 = fcmp oeq double %110, 0.000000e+00
  %198 = fmul contract double %196, -2.000000e+00
  %199 = select i1 %197, double 0x7FF0000000000000, double %198
  %200 = fcmp olt double %199, 0x1000000000000000
  %201 = select i1 %200, double 0x4FF0000000000000, double 1.000000e+00
  %202 = fmul double %199, %201
  %203 = tail call double @llvm.amdgcn.rsq.f64(double %202)
  %204 = fmul double %202, %203
  %205 = fmul double %203, 5.000000e-01
  %206 = fneg double %205
  %207 = tail call double @llvm.fma.f64(double %206, double %204, double 5.000000e-01)
  %208 = tail call double @llvm.fma.f64(double %205, double %207, double %205)
  %209 = tail call double @llvm.fma.f64(double %204, double %207, double %204)
  %210 = fneg double %209
  %211 = tail call double @llvm.fma.f64(double %210, double %209, double %202)
  %212 = tail call double @llvm.fma.f64(double %211, double %208, double %209)
  %213 = fneg double %212
  %214 = tail call double @llvm.fma.f64(double %213, double %212, double %202)
  %215 = tail call double @llvm.fma.f64(double %214, double %208, double %212)
  %216 = select i1 %200, double 0x37F0000000000000, double 1.000000e+00
  %217 = fmul double %216, %215
  %218 = fcmp oeq double %202, 0.000000e+00
  %219 = fcmp oeq double %202, 0x7FF0000000000000
  %220 = or i1 %218, %219
  %221 = select i1 %220, double %202, double %217
  %222 = fmul double %117, 5.000000e-01
  %223 = tail call double @llvm.amdgcn.fract.f64(double %222)
  %224 = tail call i1 @llvm.amdgcn.class.f64(double %222, i32 516)
  %225 = fmul double %223, 2.000000e+00
  %226 = select i1 %224, double 0.000000e+00, double %225
  %227 = fcmp ogt double %117, 1.000000e+00
  %228 = select i1 %227, double %226, double %117
  %229 = fmul double %228, 2.000000e+00
  %230 = tail call double @llvm.rint.f64(double %229)
  %231 = tail call double @llvm.fma.f64(double %230, double -5.000000e-01, double %228)
  %232 = fptosi double %230 to i32
  %233 = fmul double %231, %231
  %234 = tail call double @llvm.fma.f64(double %233, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %235 = tail call double @llvm.fma.f64(double %233, double %234, double 0x3FB50782D5F14825)
  %236 = tail call double @llvm.fma.f64(double %233, double %235, double 0xBFE32D2CCDFE9424)
  %237 = tail call double @llvm.fma.f64(double %233, double %236, double 0x400466BC67754FFF)
  %238 = tail call double @llvm.fma.f64(double %233, double %237, double 0xC014ABBCE625BE09)
  %239 = fmul double %231, %233
  %240 = fmul double %239, %238
  %241 = tail call double @llvm.fma.f64(double %231, double 0x400921FB54442D18, double %240)
  %242 = tail call double @llvm.fma.f64(double %233, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %243 = tail call double @llvm.fma.f64(double %233, double %242, double 0xBF9A6D1E7294BFF9)
  %244 = tail call double @llvm.fma.f64(double %233, double %243, double 0x3FCE1F5067B90B37)
  %245 = tail call double @llvm.fma.f64(double %233, double %244, double 0xBFF55D3C7E3C325B)
  %246 = tail call double @llvm.fma.f64(double %233, double %245, double 0x40103C1F081B5A67)
  %247 = tail call double @llvm.fma.f64(double %233, double %246, double 0xC013BD3CC9BE45DE)
  %248 = tail call double @llvm.fma.f64(double %233, double %247, double 1.000000e+00)
  %249 = shl i32 %232, 30
  %250 = and i32 %249, -2147483648
  %251 = and i32 %232, 1
  %252 = icmp eq i32 %251, 0
  %253 = select i1 %252, double %241, double %248
  %254 = bitcast double %253 to <2 x i32>
  %255 = bitcast double %117 to <2 x i32>
  %256 = extractelement <2 x i32> %255, i64 1
  %257 = and i32 %256, -2147483648
  %258 = extractelement <2 x i32> %254, i64 1
  %259 = xor i32 %257, %258
  %260 = xor i32 %259, %250
  %261 = insertelement <2 x i32> %254, i32 %260, i64 1
  %262 = fneg double %241
  %263 = select i1 %252, double %248, double %262
  %264 = bitcast double %263 to <2 x i32>
  %265 = extractelement <2 x i32> %264, i64 1
  %266 = xor i32 %265, %250
  %267 = insertelement <2 x i32> %264, i32 %266, i64 1
  %268 = tail call i1 @llvm.amdgcn.class.f64(double %117, i32 516)
  %269 = select i1 %268, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %267
  %270 = select i1 %268, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %261
  %271 = bitcast <2 x i32> %270 to double
  %272 = bitcast <2 x i32> %269 to double
  %273 = fmul contract double %221, %271
  %274 = fmul contract double %221, %272
  %275 = sext i32 %54 to i64
  %276 = getelementptr inbounds double, double addrspace(1)* %0, i64 %275
  %277 = load double, double addrspace(1)* %276, align 8, !tbaa !11
  br label %278

278:                                              ; preds = %64, %67
  %279 = phi double [ %277, %67 ], [ %52, %64 ]
  %280 = phi i32 [ %83, %67 ], [ %62, %64 ]
  %281 = phi i32 [ %74, %67 ], [ %61, %64 ]
  %282 = phi i32 [ %56, %67 ], [ %60, %64 ]
  %283 = phi double [ %274, %67 ], [ %59, %64 ]
  %284 = phi i32 [ %92, %67 ], [ %58, %64 ]
  %285 = phi i32 [ 1, %67 ], [ 0, %64 ]
  %286 = phi i32 [ %101, %67 ], [ %56, %64 ]
  %287 = phi i32 [ %102, %67 ], [ %55, %64 ]
  %288 = phi double [ %273, %67 ], [ %66, %64 ]
  %289 = fmul contract double %50, %288
  %290 = fadd contract double %279, %289
  %291 = sext i32 %53 to i64
  %292 = getelementptr inbounds double, double addrspace(1)* %0, i64 %291
  store double %290, double addrspace(1)* %292, align 8, !tbaa !11
  %293 = add nsw i32 %53, 1
  %294 = icmp slt i32 %293, %22
  br i1 %294, label %51, label %295, !llvm.loop !13

295:                                              ; preds = %278, %16, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
