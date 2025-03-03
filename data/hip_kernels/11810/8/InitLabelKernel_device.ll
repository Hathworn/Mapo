; ModuleID = '../data/hip_kernels/11810/8/main.cu'
source_filename = "../data/hip_kernels/11810/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15InitLabelKernelPddddS_ii(double addrspace(1)* nocapture writeonly %0, double %1, double %2, double %3, double addrspace(1)* nocapture readonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = add i32 %15, %8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = icmp slt i32 %24, %5
  %26 = icmp slt i32 %16, %6
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %265

28:                                               ; preds = %7
  %29 = sitofp i32 %16 to double
  %30 = sitofp i32 %6 to double
  %31 = fdiv contract double %29, %30
  %32 = fmul contract double %31, 2.000000e+00
  %33 = fmul contract double %32, 0x400921FB54442D18
  %34 = sext i32 %24 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %4, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !6
  %37 = tail call double @llvm.fabs.f64(double %33)
  %38 = fcmp olt double %37, 0x41D0000000000000
  br i1 %38, label %39, label %96

39:                                               ; preds = %28
  %40 = fmul double %37, 0x3FE45F306DC9C883
  %41 = tail call double @llvm.rint.f64(double %40)
  %42 = tail call double @llvm.fma.f64(double %41, double 0xBFF921FB54442D18, double %37)
  %43 = tail call double @llvm.fma.f64(double %41, double 0xBC91A62633145C00, double %42)
  %44 = fmul double %41, 0x3C91A62633145C00
  %45 = fneg double %44
  %46 = tail call double @llvm.fma.f64(double %41, double 0x3C91A62633145C00, double %45)
  %47 = fsub double %42, %44
  %48 = fsub double %42, %47
  %49 = fsub double %48, %44
  %50 = fsub double %47, %43
  %51 = fadd double %50, %49
  %52 = fsub double %51, %46
  %53 = tail call double @llvm.fma.f64(double %41, double 0xB97B839A252049C0, double %52)
  %54 = fadd double %43, %53
  %55 = fsub double %54, %43
  %56 = fsub double %53, %55
  %57 = fptosi double %41 to i32
  %58 = fmul double %54, %54
  %59 = fmul double %58, 5.000000e-01
  %60 = fsub double 1.000000e+00, %59
  %61 = fsub double 1.000000e+00, %60
  %62 = fsub double %61, %59
  %63 = fmul double %58, %58
  %64 = tail call double @llvm.fma.f64(double %58, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %65 = tail call double @llvm.fma.f64(double %58, double %64, double 0xBE927E4FA17F65F6)
  %66 = tail call double @llvm.fma.f64(double %58, double %65, double 0x3EFA01A019F4EC90)
  %67 = tail call double @llvm.fma.f64(double %58, double %66, double 0xBF56C16C16C16967)
  %68 = tail call double @llvm.fma.f64(double %58, double %67, double 0x3FA5555555555555)
  %69 = fneg double %56
  %70 = tail call double @llvm.fma.f64(double %54, double %69, double %62)
  %71 = tail call double @llvm.fma.f64(double %63, double %68, double %70)
  %72 = fadd double %60, %71
  %73 = tail call double @llvm.fma.f64(double %58, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %74 = tail call double @llvm.fma.f64(double %58, double %73, double 0x3EC71DE3796CDE01)
  %75 = tail call double @llvm.fma.f64(double %58, double %74, double 0xBF2A01A019E83E5C)
  %76 = tail call double @llvm.fma.f64(double %58, double %75, double 0x3F81111111110BB3)
  %77 = fneg double %58
  %78 = fmul double %54, %77
  %79 = fmul double %56, 5.000000e-01
  %80 = tail call double @llvm.fma.f64(double %78, double %76, double %79)
  %81 = tail call double @llvm.fma.f64(double %58, double %80, double %69)
  %82 = tail call double @llvm.fma.f64(double %78, double 0xBFC5555555555555, double %81)
  %83 = fsub double %54, %82
  %84 = fneg double %83
  %85 = and i32 %57, 1
  %86 = icmp eq i32 %85, 0
  %87 = select i1 %86, double %72, double %84
  %88 = bitcast double %87 to <2 x i32>
  %89 = shl i32 %57, 30
  %90 = and i32 %89, -2147483648
  %91 = extractelement <2 x i32> %88, i64 1
  %92 = xor i32 %91, %90
  %93 = insertelement <2 x i32> %88, i32 %92, i64 1
  %94 = tail call i1 @llvm.amdgcn.class.f64(double %37, i32 504)
  %95 = select i1 %94, <2 x i32> %93, <2 x i32> <i32 0, i32 2146959360>
  br label %210

96:                                               ; preds = %28
  %97 = tail call double @llvm.amdgcn.trig.preop.f64(double %37, i32 0)
  %98 = tail call double @llvm.amdgcn.trig.preop.f64(double %37, i32 1)
  %99 = tail call double @llvm.amdgcn.trig.preop.f64(double %37, i32 2)
  %100 = fcmp oge double %37, 0x7B00000000000000
  %101 = tail call double @llvm.amdgcn.ldexp.f64(double %37, i32 -128)
  %102 = select i1 %100, double %101, double %37
  %103 = fmul double %99, %102
  %104 = fneg double %103
  %105 = tail call double @llvm.fma.f64(double %99, double %102, double %104)
  %106 = fmul double %98, %102
  %107 = fneg double %106
  %108 = tail call double @llvm.fma.f64(double %98, double %102, double %107)
  %109 = fmul double %97, %102
  %110 = fneg double %109
  %111 = tail call double @llvm.fma.f64(double %97, double %102, double %110)
  %112 = fadd double %106, %111
  %113 = fsub double %112, %106
  %114 = fsub double %112, %113
  %115 = fsub double %111, %113
  %116 = fsub double %106, %114
  %117 = fadd double %115, %116
  %118 = fadd double %103, %108
  %119 = fsub double %118, %103
  %120 = fsub double %118, %119
  %121 = fsub double %108, %119
  %122 = fsub double %103, %120
  %123 = fadd double %121, %122
  %124 = fadd double %118, %117
  %125 = fsub double %124, %118
  %126 = fsub double %124, %125
  %127 = fsub double %117, %125
  %128 = fsub double %118, %126
  %129 = fadd double %127, %128
  %130 = fadd double %123, %129
  %131 = fadd double %105, %130
  %132 = fadd double %109, %112
  %133 = fsub double %132, %109
  %134 = fsub double %112, %133
  %135 = fadd double %134, %124
  %136 = fsub double %135, %134
  %137 = fsub double %124, %136
  %138 = fadd double %137, %131
  %139 = tail call double @llvm.amdgcn.ldexp.f64(double %132, i32 -2)
  %140 = tail call double @llvm.amdgcn.fract.f64(double %139)
  %141 = tail call i1 @llvm.amdgcn.class.f64(double %139, i32 516)
  %142 = select i1 %141, double 0.000000e+00, double %140
  %143 = tail call double @llvm.amdgcn.ldexp.f64(double %142, i32 2)
  %144 = fadd double %143, %135
  %145 = fcmp olt double %144, 0.000000e+00
  %146 = select i1 %145, double 4.000000e+00, double 0.000000e+00
  %147 = fadd double %143, %146
  %148 = fadd double %135, %147
  %149 = fptosi double %148 to i32
  %150 = sitofp i32 %149 to double
  %151 = fsub double %147, %150
  %152 = fadd double %135, %151
  %153 = fsub double %152, %151
  %154 = fsub double %135, %153
  %155 = fadd double %138, %154
  %156 = fcmp oge double %152, 5.000000e-01
  %157 = zext i1 %156 to i32
  %158 = add nsw i32 %157, %149
  %159 = select i1 %156, double 1.000000e+00, double 0.000000e+00
  %160 = fsub double %152, %159
  %161 = fadd double %160, %155
  %162 = fsub double %161, %160
  %163 = fsub double %155, %162
  %164 = fmul double %161, 0x3FF921FB54442D18
  %165 = fneg double %164
  %166 = tail call double @llvm.fma.f64(double %161, double 0x3FF921FB54442D18, double %165)
  %167 = tail call double @llvm.fma.f64(double %161, double 0x3C91A62633145C07, double %166)
  %168 = tail call double @llvm.fma.f64(double %163, double 0x3FF921FB54442D18, double %167)
  %169 = fadd double %164, %168
  %170 = fsub double %169, %164
  %171 = fsub double %168, %170
  %172 = fmul double %169, %169
  %173 = fmul double %172, 5.000000e-01
  %174 = fsub double 1.000000e+00, %173
  %175 = fsub double 1.000000e+00, %174
  %176 = fsub double %175, %173
  %177 = fmul double %172, %172
  %178 = tail call double @llvm.fma.f64(double %172, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %179 = tail call double @llvm.fma.f64(double %172, double %178, double 0xBE927E4FA17F65F6)
  %180 = tail call double @llvm.fma.f64(double %172, double %179, double 0x3EFA01A019F4EC90)
  %181 = tail call double @llvm.fma.f64(double %172, double %180, double 0xBF56C16C16C16967)
  %182 = tail call double @llvm.fma.f64(double %172, double %181, double 0x3FA5555555555555)
  %183 = fneg double %171
  %184 = tail call double @llvm.fma.f64(double %169, double %183, double %176)
  %185 = tail call double @llvm.fma.f64(double %177, double %182, double %184)
  %186 = fadd double %174, %185
  %187 = tail call double @llvm.fma.f64(double %172, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %188 = tail call double @llvm.fma.f64(double %172, double %187, double 0x3EC71DE3796CDE01)
  %189 = tail call double @llvm.fma.f64(double %172, double %188, double 0xBF2A01A019E83E5C)
  %190 = tail call double @llvm.fma.f64(double %172, double %189, double 0x3F81111111110BB3)
  %191 = fneg double %172
  %192 = fmul double %169, %191
  %193 = fmul double %171, 5.000000e-01
  %194 = tail call double @llvm.fma.f64(double %192, double %190, double %193)
  %195 = tail call double @llvm.fma.f64(double %172, double %194, double %183)
  %196 = tail call double @llvm.fma.f64(double %192, double 0xBFC5555555555555, double %195)
  %197 = fsub double %169, %196
  %198 = fneg double %197
  %199 = and i32 %158, 1
  %200 = icmp eq i32 %199, 0
  %201 = select i1 %200, double %186, double %198
  %202 = bitcast double %201 to <2 x i32>
  %203 = shl i32 %158, 30
  %204 = and i32 %203, -2147483648
  %205 = extractelement <2 x i32> %202, i64 1
  %206 = xor i32 %205, %204
  %207 = insertelement <2 x i32> %202, i32 %206, i64 1
  %208 = tail call i1 @llvm.amdgcn.class.f64(double %37, i32 504)
  %209 = select i1 %208, <2 x i32> %207, <2 x i32> <i32 0, i32 2146959360>
  br label %210

210:                                              ; preds = %39, %96
  %211 = phi i32 [ %89, %39 ], [ %203, %96 ]
  %212 = phi i32 [ %85, %39 ], [ %199, %96 ]
  %213 = phi double [ %83, %39 ], [ %197, %96 ]
  %214 = phi double [ %72, %39 ], [ %186, %96 ]
  %215 = phi <2 x i32> [ %95, %39 ], [ %209, %96 ]
  %216 = phi i1 [ %94, %39 ], [ %208, %96 ]
  %217 = bitcast <2 x i32> %215 to double
  %218 = fmul contract double %36, %217
  %219 = icmp eq i32 %212, 0
  %220 = select i1 %219, double %213, double %214
  %221 = bitcast double %220 to <2 x i32>
  %222 = bitcast double %33 to <2 x i32>
  %223 = extractelement <2 x i32> %222, i64 1
  %224 = xor i32 %211, %223
  %225 = and i32 %224, -2147483648
  %226 = extractelement <2 x i32> %221, i64 1
  %227 = xor i32 %226, %225
  %228 = insertelement <2 x i32> %221, i32 %227, i64 1
  %229 = select i1 %216, <2 x i32> %228, <2 x i32> <i32 0, i32 2146959360>
  %230 = bitcast <2 x i32> %229 to double
  %231 = fmul contract double %36, %230
  %232 = fsub contract double %218, %1
  %233 = fmul contract double %232, %232
  %234 = fsub contract double %231, %2
  %235 = fmul contract double %234, %234
  %236 = fadd contract double %233, %235
  %237 = fcmp olt double %236, 0x1000000000000000
  %238 = select i1 %237, double 0x4FF0000000000000, double 1.000000e+00
  %239 = fmul double %236, %238
  %240 = tail call double @llvm.amdgcn.rsq.f64(double %239)
  %241 = fmul double %239, %240
  %242 = fmul double %240, 5.000000e-01
  %243 = fneg double %242
  %244 = tail call double @llvm.fma.f64(double %243, double %241, double 5.000000e-01)
  %245 = tail call double @llvm.fma.f64(double %242, double %244, double %242)
  %246 = tail call double @llvm.fma.f64(double %241, double %244, double %241)
  %247 = fneg double %246
  %248 = tail call double @llvm.fma.f64(double %247, double %246, double %239)
  %249 = tail call double @llvm.fma.f64(double %248, double %245, double %246)
  %250 = fneg double %249
  %251 = tail call double @llvm.fma.f64(double %250, double %249, double %239)
  %252 = tail call double @llvm.fma.f64(double %251, double %245, double %249)
  %253 = select i1 %237, double 0x37F0000000000000, double 1.000000e+00
  %254 = fmul double %253, %252
  %255 = fcmp oeq double %239, 0.000000e+00
  %256 = fcmp oeq double %239, 0x7FF0000000000000
  %257 = or i1 %255, %256
  %258 = select i1 %257, double %239, double %254
  %259 = fcmp contract olt double %258, %3
  %260 = mul nsw i32 %24, %6
  %261 = add nsw i32 %260, %16
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds double, double addrspace(1)* %0, i64 %262
  %264 = select i1 %259, double 1.000000e+00, double 0.000000e+00
  store double %264, double addrspace(1)* %263, align 8, !tbaa !7
  br label %265

265:                                              ; preds = %210, %7
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
