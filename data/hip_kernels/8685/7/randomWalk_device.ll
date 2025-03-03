; ModuleID = '../data/hip_kernels/8685/7/main.cu'
source_filename = "../data/hip_kernels/8685/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10randomWalkPdii(double addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  store double 0.000000e+00, double addrspace(1)* %0, align 8, !tbaa !4
  %4 = icmp sgt i32 %2, 1
  br i1 %4, label %5, label %31

5:                                                ; preds = %3
  %6 = sitofp i32 %1 to double
  %7 = sitofp i32 %2 to double
  %8 = fdiv contract double %6, %7
  %9 = fcmp olt double %8, 0x1000000000000000
  %10 = select i1 %9, double 0x4FF0000000000000, double 1.000000e+00
  %11 = fmul double %8, %10
  %12 = tail call double @llvm.amdgcn.rsq.f64(double %11)
  %13 = fmul double %11, %12
  %14 = fmul double %12, 5.000000e-01
  %15 = fneg double %14
  %16 = tail call double @llvm.fma.f64(double %15, double %13, double 5.000000e-01)
  %17 = tail call double @llvm.fma.f64(double %14, double %16, double %14)
  %18 = tail call double @llvm.fma.f64(double %13, double %16, double %13)
  %19 = fneg double %18
  %20 = tail call double @llvm.fma.f64(double %19, double %18, double %11)
  %21 = tail call double @llvm.fma.f64(double %20, double %17, double %18)
  %22 = fneg double %21
  %23 = tail call double @llvm.fma.f64(double %22, double %21, double %11)
  %24 = tail call double @llvm.fma.f64(double %23, double %17, double %21)
  %25 = select i1 %9, double 0x37F0000000000000, double 1.000000e+00
  %26 = fmul double %25, %24
  %27 = fcmp oeq double %11, 0.000000e+00
  %28 = fcmp oeq double %11, 0x7FF0000000000000
  %29 = or i1 %27, %28
  %30 = select i1 %29, double %11, double %26
  br label %32

31:                                               ; preds = %254, %3
  ret void

32:                                               ; preds = %5, %254
  %33 = phi i32 [ 1, %5 ], [ %272, %254 ]
  %34 = phi i32 [ 485462757, %5 ], [ %262, %254 ]
  %35 = phi i32 [ -1836744730, %5 ], [ %261, %254 ]
  %36 = phi i32 [ 0, %5 ], [ %260, %254 ]
  %37 = phi i32 [ -1894485380, %5 ], [ %259, %254 ]
  %38 = phi double [ undef, %5 ], [ %258, %254 ]
  %39 = phi i32 [ -1719071262, %5 ], [ %257, %254 ]
  %40 = phi i32 [ -2018044632, %5 ], [ %256, %254 ]
  %41 = phi i32 [ -1452303100, %5 ], [ %255, %254 ]
  %42 = icmp eq i32 %36, 0
  br i1 %42, label %46, label %43

43:                                               ; preds = %32
  %44 = fptrunc double %38 to float
  %45 = fpext float %44 to double
  br label %254

46:                                               ; preds = %32
  %47 = lshr i32 %39, 2
  %48 = xor i32 %47, %39
  %49 = shl i32 %35, 4
  %50 = shl i32 %48, 1
  %51 = xor i32 %50, %49
  %52 = xor i32 %51, %48
  %53 = xor i32 %52, %35
  %54 = add i32 %34, 362437
  %55 = add i32 %54, %53
  %56 = lshr i32 %40, 2
  %57 = xor i32 %56, %40
  %58 = shl i32 %53, 4
  %59 = shl i32 %57, 1
  %60 = xor i32 %59, %58
  %61 = xor i32 %60, %57
  %62 = xor i32 %61, %53
  %63 = add i32 %34, 724874
  %64 = add i32 %63, %62
  %65 = lshr i32 %41, 2
  %66 = xor i32 %65, %41
  %67 = shl i32 %62, 4
  %68 = shl i32 %66, 1
  %69 = xor i32 %68, %67
  %70 = xor i32 %69, %66
  %71 = xor i32 %70, %62
  %72 = add i32 %34, 1087311
  %73 = add i32 %72, %71
  %74 = lshr i32 %37, 2
  %75 = xor i32 %74, %37
  %76 = shl i32 %71, 4
  %77 = shl i32 %75, 1
  %78 = xor i32 %77, %76
  %79 = xor i32 %78, %75
  %80 = xor i32 %79, %71
  %81 = add i32 %34, 1449748
  %82 = add i32 %80, %81
  %83 = zext i32 %55 to i64
  %84 = zext i32 %64 to i64
  %85 = shl nuw nsw i64 %84, 21
  %86 = xor i64 %85, %83
  %87 = uitofp i64 %86 to double
  %88 = fmul contract double %87, 0x3CA0000000000000
  %89 = fadd contract double %88, 0x3CA0000000000000
  %90 = zext i32 %73 to i64
  %91 = zext i32 %82 to i64
  %92 = shl nuw nsw i64 %91, 21
  %93 = xor i64 %92, %90
  %94 = uitofp i64 %93 to double
  %95 = fmul contract double %94, 0x3CB0000000000000
  %96 = fadd contract double %95, 0x3CB0000000000000
  %97 = tail call double @llvm.amdgcn.frexp.mant.f64(double %89)
  %98 = fcmp olt double %97, 0x3FE5555555555555
  %99 = zext i1 %98 to i32
  %100 = tail call double @llvm.amdgcn.ldexp.f64(double %97, i32 %99)
  %101 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %89)
  %102 = sub nsw i32 %101, %99
  %103 = fadd double %100, -1.000000e+00
  %104 = fadd double %100, 1.000000e+00
  %105 = fadd double %104, -1.000000e+00
  %106 = fsub double %100, %105
  %107 = tail call double @llvm.amdgcn.rcp.f64(double %104)
  %108 = fneg double %104
  %109 = tail call double @llvm.fma.f64(double %108, double %107, double 1.000000e+00)
  %110 = tail call double @llvm.fma.f64(double %109, double %107, double %107)
  %111 = tail call double @llvm.fma.f64(double %108, double %110, double 1.000000e+00)
  %112 = tail call double @llvm.fma.f64(double %111, double %110, double %110)
  %113 = fmul double %103, %112
  %114 = fmul double %104, %113
  %115 = fneg double %114
  %116 = tail call double @llvm.fma.f64(double %113, double %104, double %115)
  %117 = tail call double @llvm.fma.f64(double %113, double %106, double %116)
  %118 = fadd double %114, %117
  %119 = fsub double %118, %114
  %120 = fsub double %117, %119
  %121 = fsub double %103, %118
  %122 = fsub double %103, %121
  %123 = fsub double %122, %118
  %124 = fsub double %123, %120
  %125 = fadd double %121, %124
  %126 = fmul double %112, %125
  %127 = fadd double %113, %126
  %128 = fsub double %127, %113
  %129 = fsub double %126, %128
  %130 = fmul double %127, %127
  %131 = tail call double @llvm.fma.f64(double %130, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %132 = tail call double @llvm.fma.f64(double %130, double %131, double 0x3FC7474DD7F4DF2E)
  %133 = tail call double @llvm.fma.f64(double %130, double %132, double 0x3FCC71C016291751)
  %134 = tail call double @llvm.fma.f64(double %130, double %133, double 0x3FD249249B27ACF1)
  %135 = tail call double @llvm.fma.f64(double %130, double %134, double 0x3FD99999998EF7B6)
  %136 = tail call double @llvm.fma.f64(double %130, double %135, double 0x3FE5555555555780)
  %137 = tail call double @llvm.amdgcn.ldexp.f64(double %127, i32 1)
  %138 = tail call double @llvm.amdgcn.ldexp.f64(double %129, i32 1)
  %139 = fmul double %127, %130
  %140 = fmul double %139, %136
  %141 = fadd double %137, %140
  %142 = fsub double %141, %137
  %143 = fsub double %140, %142
  %144 = fadd double %138, %143
  %145 = fadd double %141, %144
  %146 = fsub double %145, %141
  %147 = fsub double %144, %146
  %148 = sitofp i32 %102 to double
  %149 = fmul double %148, 0x3FE62E42FEFA39EF
  %150 = fneg double %149
  %151 = tail call double @llvm.fma.f64(double %148, double 0x3FE62E42FEFA39EF, double %150)
  %152 = tail call double @llvm.fma.f64(double %148, double 0x3C7ABC9E3B39803F, double %151)
  %153 = fadd double %149, %152
  %154 = fsub double %153, %149
  %155 = fsub double %152, %154
  %156 = fadd double %153, %145
  %157 = fsub double %156, %153
  %158 = fsub double %156, %157
  %159 = fsub double %153, %158
  %160 = fsub double %145, %157
  %161 = fadd double %160, %159
  %162 = fadd double %155, %147
  %163 = fsub double %162, %155
  %164 = fsub double %162, %163
  %165 = fsub double %155, %164
  %166 = fsub double %147, %163
  %167 = fadd double %166, %165
  %168 = fadd double %162, %161
  %169 = fadd double %156, %168
  %170 = fsub double %169, %156
  %171 = fsub double %168, %170
  %172 = fadd double %167, %171
  %173 = fadd double %169, %172
  %174 = fcmp oeq double %89, 0x7FF0000000000000
  %175 = select i1 %174, double %89, double %173
  %176 = fcmp oeq double %89, 0.000000e+00
  %177 = fmul contract double %175, -2.000000e+00
  %178 = select i1 %176, double 0x7FF0000000000000, double %177
  %179 = fcmp olt double %178, 0x1000000000000000
  %180 = select i1 %179, double 0x4FF0000000000000, double 1.000000e+00
  %181 = fmul double %178, %180
  %182 = tail call double @llvm.amdgcn.rsq.f64(double %181)
  %183 = fmul double %181, %182
  %184 = fmul double %182, 5.000000e-01
  %185 = fneg double %184
  %186 = tail call double @llvm.fma.f64(double %185, double %183, double 5.000000e-01)
  %187 = tail call double @llvm.fma.f64(double %184, double %186, double %184)
  %188 = tail call double @llvm.fma.f64(double %183, double %186, double %183)
  %189 = fneg double %188
  %190 = tail call double @llvm.fma.f64(double %189, double %188, double %181)
  %191 = tail call double @llvm.fma.f64(double %190, double %187, double %188)
  %192 = fneg double %191
  %193 = tail call double @llvm.fma.f64(double %192, double %191, double %181)
  %194 = tail call double @llvm.fma.f64(double %193, double %187, double %191)
  %195 = select i1 %179, double 0x37F0000000000000, double 1.000000e+00
  %196 = fmul double %195, %194
  %197 = fcmp oeq double %181, 0.000000e+00
  %198 = fcmp oeq double %181, 0x7FF0000000000000
  %199 = or i1 %197, %198
  %200 = select i1 %199, double %181, double %196
  %201 = fmul double %96, 5.000000e-01
  %202 = tail call double @llvm.amdgcn.fract.f64(double %201)
  %203 = tail call i1 @llvm.amdgcn.class.f64(double %201, i32 516)
  %204 = fmul double %202, 2.000000e+00
  %205 = select i1 %203, double 0.000000e+00, double %204
  %206 = fcmp ogt double %96, 1.000000e+00
  %207 = select i1 %206, double %205, double %96
  %208 = fmul double %207, 2.000000e+00
  %209 = tail call double @llvm.rint.f64(double %208)
  %210 = tail call double @llvm.fma.f64(double %209, double -5.000000e-01, double %207)
  %211 = fptosi double %209 to i32
  %212 = fmul double %210, %210
  %213 = tail call double @llvm.fma.f64(double %212, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %214 = tail call double @llvm.fma.f64(double %212, double %213, double 0x3FB50782D5F14825)
  %215 = tail call double @llvm.fma.f64(double %212, double %214, double 0xBFE32D2CCDFE9424)
  %216 = tail call double @llvm.fma.f64(double %212, double %215, double 0x400466BC67754FFF)
  %217 = tail call double @llvm.fma.f64(double %212, double %216, double 0xC014ABBCE625BE09)
  %218 = fmul double %210, %212
  %219 = fmul double %218, %217
  %220 = tail call double @llvm.fma.f64(double %210, double 0x400921FB54442D18, double %219)
  %221 = tail call double @llvm.fma.f64(double %212, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %222 = tail call double @llvm.fma.f64(double %212, double %221, double 0xBF9A6D1E7294BFF9)
  %223 = tail call double @llvm.fma.f64(double %212, double %222, double 0x3FCE1F5067B90B37)
  %224 = tail call double @llvm.fma.f64(double %212, double %223, double 0xBFF55D3C7E3C325B)
  %225 = tail call double @llvm.fma.f64(double %212, double %224, double 0x40103C1F081B5A67)
  %226 = tail call double @llvm.fma.f64(double %212, double %225, double 0xC013BD3CC9BE45DE)
  %227 = tail call double @llvm.fma.f64(double %212, double %226, double 1.000000e+00)
  %228 = shl i32 %211, 30
  %229 = and i32 %228, -2147483648
  %230 = and i32 %211, 1
  %231 = icmp eq i32 %230, 0
  %232 = select i1 %231, double %220, double %227
  %233 = bitcast double %232 to <2 x i32>
  %234 = bitcast double %96 to <2 x i32>
  %235 = extractelement <2 x i32> %234, i64 1
  %236 = and i32 %235, -2147483648
  %237 = extractelement <2 x i32> %233, i64 1
  %238 = xor i32 %236, %237
  %239 = xor i32 %238, %229
  %240 = insertelement <2 x i32> %233, i32 %239, i64 1
  %241 = fneg double %220
  %242 = select i1 %231, double %227, double %241
  %243 = bitcast double %242 to <2 x i32>
  %244 = extractelement <2 x i32> %243, i64 1
  %245 = xor i32 %244, %229
  %246 = insertelement <2 x i32> %243, i32 %245, i64 1
  %247 = tail call i1 @llvm.amdgcn.class.f64(double %96, i32 516)
  %248 = select i1 %247, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %246
  %249 = select i1 %247, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %240
  %250 = bitcast <2 x i32> %249 to double
  %251 = bitcast <2 x i32> %248 to double
  %252 = fmul contract double %200, %250
  %253 = fmul contract double %200, %251
  br label %254

254:                                              ; preds = %43, %46
  %255 = phi i32 [ %62, %46 ], [ %41, %43 ]
  %256 = phi i32 [ %53, %46 ], [ %40, %43 ]
  %257 = phi i32 [ %35, %46 ], [ %39, %43 ]
  %258 = phi double [ %253, %46 ], [ %38, %43 ]
  %259 = phi i32 [ %71, %46 ], [ %37, %43 ]
  %260 = phi i32 [ 1, %46 ], [ 0, %43 ]
  %261 = phi i32 [ %80, %46 ], [ %35, %43 ]
  %262 = phi i32 [ %81, %46 ], [ %34, %43 ]
  %263 = phi double [ %252, %46 ], [ %45, %43 ]
  %264 = add nsw i32 %33, -1
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds double, double addrspace(1)* %0, i64 %265
  %267 = load double, double addrspace(1)* %266, align 8, !tbaa !4
  %268 = fmul contract double %30, %263
  %269 = fadd contract double %267, %268
  %270 = zext i32 %33 to i64
  %271 = getelementptr inbounds double, double addrspace(1)* %0, i64 %270
  store double %269, double addrspace(1)* %271, align 8, !tbaa !4
  %272 = add nuw nsw i32 %33, 1
  %273 = icmp eq i32 %272, %2
  br i1 %273, label %31, label %32, !llvm.loop !8
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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
