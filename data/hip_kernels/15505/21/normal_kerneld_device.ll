; ModuleID = '../data/hip_kernels/15505/21/main.cu'
source_filename = "../data/hip_kernels/15505/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z14normal_kerneldiPdidd(i32 %0, double addrspace(1)* nocapture writeonly %1, i32 %2, double %3, double %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %260

8:                                                ; preds = %5
  %9 = xor i32 %0, 746559103
  %10 = icmp sgt i32 %0, -1
  %11 = mul i32 %9, 1228688033
  %12 = select i1 %10, i32 -1973591729, i32 -100066652
  %13 = icmp eq i32 %2, 0
  br i1 %13, label %260, label %14

14:                                               ; preds = %8
  %15 = add i32 %11, 6615241
  %16 = add i32 %15, %12
  %17 = add i32 %11, 5783321
  %18 = xor i32 %12, 88675123
  %19 = add nsw i32 %12, 521288629
  %20 = xor i32 %11, 362436069
  %21 = add i32 %11, 123456789
  %22 = sext i32 %2 to i64
  br label %23

23:                                               ; preds = %14, %245
  %24 = phi i64 [ %258, %245 ], [ 0, %14 ]
  %25 = phi i32 [ %253, %245 ], [ %16, %14 ]
  %26 = phi i32 [ %252, %245 ], [ %17, %14 ]
  %27 = phi i32 [ %251, %245 ], [ 0, %14 ]
  %28 = phi i32 [ %250, %245 ], [ %18, %14 ]
  %29 = phi double [ %249, %245 ], [ undef, %14 ]
  %30 = phi i32 [ %248, %245 ], [ %21, %14 ]
  %31 = phi i32 [ %247, %245 ], [ %20, %14 ]
  %32 = phi i32 [ %246, %245 ], [ %19, %14 ]
  %33 = icmp eq i32 %27, 0
  br i1 %33, label %37, label %34

34:                                               ; preds = %23
  %35 = fptrunc double %29 to float
  %36 = fpext float %35 to double
  br label %245

37:                                               ; preds = %23
  %38 = lshr i32 %30, 2
  %39 = xor i32 %38, %30
  %40 = shl i32 %26, 4
  %41 = shl i32 %39, 1
  %42 = xor i32 %41, %40
  %43 = xor i32 %42, %39
  %44 = xor i32 %43, %26
  %45 = add i32 %25, 362437
  %46 = add i32 %45, %44
  %47 = lshr i32 %31, 2
  %48 = xor i32 %47, %31
  %49 = shl i32 %44, 4
  %50 = shl i32 %48, 1
  %51 = xor i32 %50, %49
  %52 = xor i32 %51, %48
  %53 = xor i32 %52, %44
  %54 = add i32 %25, 724874
  %55 = add i32 %54, %53
  %56 = lshr i32 %32, 2
  %57 = xor i32 %56, %32
  %58 = shl i32 %53, 4
  %59 = shl i32 %57, 1
  %60 = xor i32 %59, %58
  %61 = xor i32 %60, %57
  %62 = xor i32 %61, %53
  %63 = add i32 %25, 1087311
  %64 = add i32 %63, %62
  %65 = lshr i32 %28, 2
  %66 = xor i32 %65, %28
  %67 = shl i32 %62, 4
  %68 = shl i32 %66, 1
  %69 = xor i32 %68, %67
  %70 = xor i32 %69, %66
  %71 = xor i32 %70, %62
  %72 = add i32 %25, 1449748
  %73 = add i32 %71, %72
  %74 = zext i32 %46 to i64
  %75 = zext i32 %55 to i64
  %76 = shl nuw nsw i64 %75, 21
  %77 = xor i64 %76, %74
  %78 = uitofp i64 %77 to double
  %79 = fmul contract double %78, 0x3CA0000000000000
  %80 = fadd contract double %79, 0x3CA0000000000000
  %81 = zext i32 %64 to i64
  %82 = zext i32 %73 to i64
  %83 = shl nuw nsw i64 %82, 21
  %84 = xor i64 %83, %81
  %85 = uitofp i64 %84 to double
  %86 = fmul contract double %85, 0x3CB0000000000000
  %87 = fadd contract double %86, 0x3CB0000000000000
  %88 = tail call double @llvm.amdgcn.frexp.mant.f64(double %80)
  %89 = fcmp olt double %88, 0x3FE5555555555555
  %90 = zext i1 %89 to i32
  %91 = tail call double @llvm.amdgcn.ldexp.f64(double %88, i32 %90)
  %92 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %80)
  %93 = sub nsw i32 %92, %90
  %94 = fadd double %91, -1.000000e+00
  %95 = fadd double %91, 1.000000e+00
  %96 = fadd double %95, -1.000000e+00
  %97 = fsub double %91, %96
  %98 = tail call double @llvm.amdgcn.rcp.f64(double %95)
  %99 = fneg double %95
  %100 = tail call double @llvm.fma.f64(double %99, double %98, double 1.000000e+00)
  %101 = tail call double @llvm.fma.f64(double %100, double %98, double %98)
  %102 = tail call double @llvm.fma.f64(double %99, double %101, double 1.000000e+00)
  %103 = tail call double @llvm.fma.f64(double %102, double %101, double %101)
  %104 = fmul double %94, %103
  %105 = fmul double %95, %104
  %106 = fneg double %105
  %107 = tail call double @llvm.fma.f64(double %104, double %95, double %106)
  %108 = tail call double @llvm.fma.f64(double %104, double %97, double %107)
  %109 = fadd double %105, %108
  %110 = fsub double %109, %105
  %111 = fsub double %108, %110
  %112 = fsub double %94, %109
  %113 = fsub double %94, %112
  %114 = fsub double %113, %109
  %115 = fsub double %114, %111
  %116 = fadd double %112, %115
  %117 = fmul double %103, %116
  %118 = fadd double %104, %117
  %119 = fsub double %118, %104
  %120 = fsub double %117, %119
  %121 = fmul double %118, %118
  %122 = tail call double @llvm.fma.f64(double %121, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %123 = tail call double @llvm.fma.f64(double %121, double %122, double 0x3FC7474DD7F4DF2E)
  %124 = tail call double @llvm.fma.f64(double %121, double %123, double 0x3FCC71C016291751)
  %125 = tail call double @llvm.fma.f64(double %121, double %124, double 0x3FD249249B27ACF1)
  %126 = tail call double @llvm.fma.f64(double %121, double %125, double 0x3FD99999998EF7B6)
  %127 = tail call double @llvm.fma.f64(double %121, double %126, double 0x3FE5555555555780)
  %128 = tail call double @llvm.amdgcn.ldexp.f64(double %118, i32 1)
  %129 = tail call double @llvm.amdgcn.ldexp.f64(double %120, i32 1)
  %130 = fmul double %118, %121
  %131 = fmul double %130, %127
  %132 = fadd double %128, %131
  %133 = fsub double %132, %128
  %134 = fsub double %131, %133
  %135 = fadd double %129, %134
  %136 = fadd double %132, %135
  %137 = fsub double %136, %132
  %138 = fsub double %135, %137
  %139 = sitofp i32 %93 to double
  %140 = fmul double %139, 0x3FE62E42FEFA39EF
  %141 = fneg double %140
  %142 = tail call double @llvm.fma.f64(double %139, double 0x3FE62E42FEFA39EF, double %141)
  %143 = tail call double @llvm.fma.f64(double %139, double 0x3C7ABC9E3B39803F, double %142)
  %144 = fadd double %140, %143
  %145 = fsub double %144, %140
  %146 = fsub double %143, %145
  %147 = fadd double %144, %136
  %148 = fsub double %147, %144
  %149 = fsub double %147, %148
  %150 = fsub double %144, %149
  %151 = fsub double %136, %148
  %152 = fadd double %151, %150
  %153 = fadd double %146, %138
  %154 = fsub double %153, %146
  %155 = fsub double %153, %154
  %156 = fsub double %146, %155
  %157 = fsub double %138, %154
  %158 = fadd double %157, %156
  %159 = fadd double %153, %152
  %160 = fadd double %147, %159
  %161 = fsub double %160, %147
  %162 = fsub double %159, %161
  %163 = fadd double %158, %162
  %164 = fadd double %160, %163
  %165 = fcmp oeq double %80, 0x7FF0000000000000
  %166 = select i1 %165, double %80, double %164
  %167 = fcmp oeq double %80, 0.000000e+00
  %168 = fmul contract double %166, -2.000000e+00
  %169 = select i1 %167, double 0x7FF0000000000000, double %168
  %170 = fcmp olt double %169, 0x1000000000000000
  %171 = select i1 %170, double 0x4FF0000000000000, double 1.000000e+00
  %172 = fmul double %169, %171
  %173 = tail call double @llvm.amdgcn.rsq.f64(double %172)
  %174 = fmul double %172, %173
  %175 = fmul double %173, 5.000000e-01
  %176 = fneg double %175
  %177 = tail call double @llvm.fma.f64(double %176, double %174, double 5.000000e-01)
  %178 = tail call double @llvm.fma.f64(double %175, double %177, double %175)
  %179 = tail call double @llvm.fma.f64(double %174, double %177, double %174)
  %180 = fneg double %179
  %181 = tail call double @llvm.fma.f64(double %180, double %179, double %172)
  %182 = tail call double @llvm.fma.f64(double %181, double %178, double %179)
  %183 = fneg double %182
  %184 = tail call double @llvm.fma.f64(double %183, double %182, double %172)
  %185 = tail call double @llvm.fma.f64(double %184, double %178, double %182)
  %186 = select i1 %170, double 0x37F0000000000000, double 1.000000e+00
  %187 = fmul double %186, %185
  %188 = fcmp oeq double %172, 0.000000e+00
  %189 = fcmp oeq double %172, 0x7FF0000000000000
  %190 = or i1 %188, %189
  %191 = select i1 %190, double %172, double %187
  %192 = fmul double %87, 5.000000e-01
  %193 = tail call double @llvm.amdgcn.fract.f64(double %192)
  %194 = tail call i1 @llvm.amdgcn.class.f64(double %192, i32 516)
  %195 = fmul double %193, 2.000000e+00
  %196 = select i1 %194, double 0.000000e+00, double %195
  %197 = fcmp ogt double %87, 1.000000e+00
  %198 = select i1 %197, double %196, double %87
  %199 = fmul double %198, 2.000000e+00
  %200 = tail call double @llvm.rint.f64(double %199)
  %201 = tail call double @llvm.fma.f64(double %200, double -5.000000e-01, double %198)
  %202 = fptosi double %200 to i32
  %203 = fmul double %201, %201
  %204 = tail call double @llvm.fma.f64(double %203, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %205 = tail call double @llvm.fma.f64(double %203, double %204, double 0x3FB50782D5F14825)
  %206 = tail call double @llvm.fma.f64(double %203, double %205, double 0xBFE32D2CCDFE9424)
  %207 = tail call double @llvm.fma.f64(double %203, double %206, double 0x400466BC67754FFF)
  %208 = tail call double @llvm.fma.f64(double %203, double %207, double 0xC014ABBCE625BE09)
  %209 = fmul double %201, %203
  %210 = fmul double %209, %208
  %211 = tail call double @llvm.fma.f64(double %201, double 0x400921FB54442D18, double %210)
  %212 = tail call double @llvm.fma.f64(double %203, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %213 = tail call double @llvm.fma.f64(double %203, double %212, double 0xBF9A6D1E7294BFF9)
  %214 = tail call double @llvm.fma.f64(double %203, double %213, double 0x3FCE1F5067B90B37)
  %215 = tail call double @llvm.fma.f64(double %203, double %214, double 0xBFF55D3C7E3C325B)
  %216 = tail call double @llvm.fma.f64(double %203, double %215, double 0x40103C1F081B5A67)
  %217 = tail call double @llvm.fma.f64(double %203, double %216, double 0xC013BD3CC9BE45DE)
  %218 = tail call double @llvm.fma.f64(double %203, double %217, double 1.000000e+00)
  %219 = shl i32 %202, 30
  %220 = and i32 %219, -2147483648
  %221 = and i32 %202, 1
  %222 = icmp eq i32 %221, 0
  %223 = select i1 %222, double %211, double %218
  %224 = bitcast double %223 to <2 x i32>
  %225 = bitcast double %87 to <2 x i32>
  %226 = extractelement <2 x i32> %225, i64 1
  %227 = and i32 %226, -2147483648
  %228 = extractelement <2 x i32> %224, i64 1
  %229 = xor i32 %227, %228
  %230 = xor i32 %229, %220
  %231 = insertelement <2 x i32> %224, i32 %230, i64 1
  %232 = fneg double %211
  %233 = select i1 %222, double %218, double %232
  %234 = bitcast double %233 to <2 x i32>
  %235 = extractelement <2 x i32> %234, i64 1
  %236 = xor i32 %235, %220
  %237 = insertelement <2 x i32> %234, i32 %236, i64 1
  %238 = tail call i1 @llvm.amdgcn.class.f64(double %87, i32 516)
  %239 = select i1 %238, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %237
  %240 = select i1 %238, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %231
  %241 = bitcast <2 x i32> %240 to double
  %242 = bitcast <2 x i32> %239 to double
  %243 = fmul contract double %191, %241
  %244 = fmul contract double %191, %242
  br label %245

245:                                              ; preds = %34, %37
  %246 = phi i32 [ %53, %37 ], [ %32, %34 ]
  %247 = phi i32 [ %44, %37 ], [ %31, %34 ]
  %248 = phi i32 [ %26, %37 ], [ %30, %34 ]
  %249 = phi double [ %244, %37 ], [ %29, %34 ]
  %250 = phi i32 [ %62, %37 ], [ %28, %34 ]
  %251 = phi i32 [ 1, %37 ], [ 0, %34 ]
  %252 = phi i32 [ %71, %37 ], [ %26, %34 ]
  %253 = phi i32 [ %72, %37 ], [ %25, %34 ]
  %254 = phi double [ %243, %37 ], [ %36, %34 ]
  %255 = fmul contract double %254, %4
  %256 = fadd contract double %255, %3
  %257 = getelementptr inbounds double, double addrspace(1)* %1, i64 %24
  store double %256, double addrspace(1)* %257, align 8, !tbaa !5
  %258 = add nuw i64 %24, 1
  %259 = icmp eq i64 %258, %22
  br i1 %259, label %260, label %23, !llvm.loop !9

260:                                              ; preds = %245, %8, %5
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
