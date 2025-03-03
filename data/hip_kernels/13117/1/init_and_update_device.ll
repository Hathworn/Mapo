; ModuleID = '../data/hip_kernels/13117/1/main.cu'
source_filename = "../data/hip_kernels/13117/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z15init_and_updatePfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 9
  %7 = add i32 %6, %4
  %8 = icmp sgt i32 %7, 1
  %9 = icmp slt i32 %7, %1
  %10 = select i1 %8, i1 %9, i1 false
  br i1 %10, label %11, label %251

11:                                               ; preds = %3
  %12 = add nsw i32 %1, -1
  %13 = sitofp i32 %12 to float
  %14 = sitofp i32 %7 to float
  %15 = fdiv contract float %14, %13
  %16 = fpext float %15 to double
  %17 = fmul contract double %16, 0x401921FB53C8D4F1
  %18 = tail call double @llvm.fabs.f64(double %17)
  %19 = fcmp olt double %18, 0x41D0000000000000
  br i1 %19, label %20, label %39

20:                                               ; preds = %11
  %21 = fmul double %18, 0x3FE45F306DC9C883
  %22 = tail call double @llvm.rint.f64(double %21)
  %23 = tail call double @llvm.fma.f64(double %22, double 0xBFF921FB54442D18, double %18)
  %24 = tail call double @llvm.fma.f64(double %22, double 0xBC91A62633145C00, double %23)
  %25 = fmul double %22, 0x3C91A62633145C00
  %26 = fneg double %25
  %27 = tail call double @llvm.fma.f64(double %22, double 0x3C91A62633145C00, double %26)
  %28 = fsub double %23, %25
  %29 = fsub double %23, %28
  %30 = fsub double %29, %25
  %31 = fsub double %28, %24
  %32 = fadd double %31, %30
  %33 = fsub double %32, %27
  %34 = tail call double @llvm.fma.f64(double %22, double 0xB97B839A252049C0, double %33)
  %35 = fadd double %24, %34
  %36 = fsub double %35, %24
  %37 = fsub double %34, %36
  %38 = fptosi double %22 to i32
  br label %115

39:                                               ; preds = %11
  %40 = tail call double @llvm.amdgcn.trig.preop.f64(double %18, i32 0)
  %41 = tail call double @llvm.amdgcn.trig.preop.f64(double %18, i32 1)
  %42 = tail call double @llvm.amdgcn.trig.preop.f64(double %18, i32 2)
  %43 = fcmp oge double %18, 0x7B00000000000000
  %44 = tail call double @llvm.amdgcn.ldexp.f64(double %18, i32 -128)
  %45 = select i1 %43, double %44, double %18
  %46 = fmul double %42, %45
  %47 = fneg double %46
  %48 = tail call double @llvm.fma.f64(double %42, double %45, double %47)
  %49 = fmul double %41, %45
  %50 = fneg double %49
  %51 = tail call double @llvm.fma.f64(double %41, double %45, double %50)
  %52 = fmul double %40, %45
  %53 = fneg double %52
  %54 = tail call double @llvm.fma.f64(double %40, double %45, double %53)
  %55 = fadd double %49, %54
  %56 = fsub double %55, %49
  %57 = fsub double %55, %56
  %58 = fsub double %54, %56
  %59 = fsub double %49, %57
  %60 = fadd double %58, %59
  %61 = fadd double %46, %51
  %62 = fsub double %61, %46
  %63 = fsub double %61, %62
  %64 = fsub double %51, %62
  %65 = fsub double %46, %63
  %66 = fadd double %64, %65
  %67 = fadd double %61, %60
  %68 = fsub double %67, %61
  %69 = fsub double %67, %68
  %70 = fsub double %60, %68
  %71 = fsub double %61, %69
  %72 = fadd double %70, %71
  %73 = fadd double %66, %72
  %74 = fadd double %48, %73
  %75 = fadd double %52, %55
  %76 = fsub double %75, %52
  %77 = fsub double %55, %76
  %78 = fadd double %77, %67
  %79 = fsub double %78, %77
  %80 = fsub double %67, %79
  %81 = fadd double %80, %74
  %82 = tail call double @llvm.amdgcn.ldexp.f64(double %75, i32 -2)
  %83 = tail call double @llvm.amdgcn.fract.f64(double %82)
  %84 = tail call i1 @llvm.amdgcn.class.f64(double %82, i32 516)
  %85 = select i1 %84, double 0.000000e+00, double %83
  %86 = tail call double @llvm.amdgcn.ldexp.f64(double %85, i32 2)
  %87 = fadd double %86, %78
  %88 = fcmp olt double %87, 0.000000e+00
  %89 = select i1 %88, double 4.000000e+00, double 0.000000e+00
  %90 = fadd double %86, %89
  %91 = fadd double %78, %90
  %92 = fptosi double %91 to i32
  %93 = sitofp i32 %92 to double
  %94 = fsub double %90, %93
  %95 = fadd double %78, %94
  %96 = fsub double %95, %94
  %97 = fsub double %78, %96
  %98 = fadd double %81, %97
  %99 = fcmp oge double %95, 5.000000e-01
  %100 = zext i1 %99 to i32
  %101 = add nsw i32 %100, %92
  %102 = select i1 %99, double 1.000000e+00, double 0.000000e+00
  %103 = fsub double %95, %102
  %104 = fadd double %103, %98
  %105 = fsub double %104, %103
  %106 = fsub double %98, %105
  %107 = fmul double %104, 0x3FF921FB54442D18
  %108 = fneg double %107
  %109 = tail call double @llvm.fma.f64(double %104, double 0x3FF921FB54442D18, double %108)
  %110 = tail call double @llvm.fma.f64(double %104, double 0x3C91A62633145C07, double %109)
  %111 = tail call double @llvm.fma.f64(double %106, double 0x3FF921FB54442D18, double %110)
  %112 = fadd double %107, %111
  %113 = fsub double %112, %107
  %114 = fsub double %111, %113
  br label %115

115:                                              ; preds = %20, %39
  %116 = phi double [ %37, %20 ], [ %114, %39 ]
  %117 = phi double [ %35, %20 ], [ %112, %39 ]
  %118 = phi i32 [ %38, %20 ], [ %101, %39 ]
  %119 = fmul double %117, %117
  %120 = fmul double %119, 5.000000e-01
  %121 = fsub double 1.000000e+00, %120
  %122 = fsub double 1.000000e+00, %121
  %123 = fsub double %122, %120
  %124 = fmul double %119, %119
  %125 = tail call double @llvm.fma.f64(double %119, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %126 = tail call double @llvm.fma.f64(double %119, double %125, double 0xBE927E4FA17F65F6)
  %127 = tail call double @llvm.fma.f64(double %119, double %126, double 0x3EFA01A019F4EC90)
  %128 = tail call double @llvm.fma.f64(double %119, double %127, double 0xBF56C16C16C16967)
  %129 = tail call double @llvm.fma.f64(double %119, double %128, double 0x3FA5555555555555)
  %130 = fneg double %116
  %131 = tail call double @llvm.fma.f64(double %117, double %130, double %123)
  %132 = tail call double @llvm.fma.f64(double %124, double %129, double %131)
  %133 = fadd double %121, %132
  %134 = tail call double @llvm.fma.f64(double %119, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %135 = tail call double @llvm.fma.f64(double %119, double %134, double 0x3EC71DE3796CDE01)
  %136 = tail call double @llvm.fma.f64(double %119, double %135, double 0xBF2A01A019E83E5C)
  %137 = tail call double @llvm.fma.f64(double %119, double %136, double 0x3F81111111110BB3)
  %138 = fneg double %119
  %139 = fmul double %117, %138
  %140 = fmul double %116, 5.000000e-01
  %141 = tail call double @llvm.fma.f64(double %139, double %137, double %140)
  %142 = tail call double @llvm.fma.f64(double %119, double %141, double %130)
  %143 = tail call double @llvm.fma.f64(double %139, double 0xBFC5555555555555, double %142)
  %144 = fsub double %117, %143
  %145 = and i32 %118, 1
  %146 = icmp eq i32 %145, 0
  %147 = select i1 %146, double %144, double %133
  %148 = bitcast double %147 to <2 x i32>
  %149 = shl i32 %118, 30
  %150 = bitcast double %17 to <2 x i32>
  %151 = extractelement <2 x i32> %150, i64 1
  %152 = xor i32 %149, %151
  %153 = and i32 %152, -2147483648
  %154 = extractelement <2 x i32> %148, i64 1
  %155 = xor i32 %154, %153
  %156 = insertelement <2 x i32> %148, i32 %155, i64 1
  %157 = tail call i1 @llvm.amdgcn.class.f64(double %18, i32 504)
  %158 = select i1 %157, <2 x i32> %156, <2 x i32> <i32 0, i32 2146959360>
  %159 = bitcast <2 x i32> %158 to double
  %160 = fptrunc double %159 to float
  %161 = icmp slt i32 %2, 1
  br i1 %161, label %185, label %162

162:                                              ; preds = %115
  %163 = and i32 %2, 7
  %164 = icmp ult i32 %2, 8
  br i1 %164, label %167, label %165

165:                                              ; preds = %162
  %166 = and i32 %2, -8
  br label %189

167:                                              ; preds = %189, %162
  %168 = phi float [ undef, %162 ], [ %248, %189 ]
  %169 = phi float [ %160, %162 ], [ %241, %189 ]
  %170 = phi float [ %160, %162 ], [ %248, %189 ]
  %171 = icmp eq i32 %163, 0
  br i1 %171, label %185, label %172

172:                                              ; preds = %167, %172
  %173 = phi float [ %174, %172 ], [ %169, %167 ]
  %174 = phi float [ %182, %172 ], [ %170, %167 ]
  %175 = phi i32 [ %183, %172 ], [ 0, %167 ]
  %176 = fpext float %174 to double
  %177 = fmul contract double %176, 2.000000e+00
  %178 = fpext float %173 to double
  %179 = fsub contract double %177, %178
  %180 = fmul contract double %177, 0x3FB70A3D70A3D70A
  %181 = fsub contract double %179, %180
  %182 = fptrunc double %181 to float
  %183 = add i32 %175, 1
  %184 = icmp eq i32 %183, %163
  br i1 %184, label %185, label %172, !llvm.loop !5

185:                                              ; preds = %167, %172, %115
  %186 = phi float [ %160, %115 ], [ %168, %167 ], [ %182, %172 ]
  %187 = zext i32 %7 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  store float %186, float addrspace(1)* %188, align 4, !tbaa !7
  br label %251

189:                                              ; preds = %189, %165
  %190 = phi float [ %160, %165 ], [ %241, %189 ]
  %191 = phi float [ %160, %165 ], [ %248, %189 ]
  %192 = phi i32 [ 0, %165 ], [ %249, %189 ]
  %193 = fpext float %191 to double
  %194 = fmul contract double %193, 2.000000e+00
  %195 = fpext float %190 to double
  %196 = fsub contract double %194, %195
  %197 = fmul contract double %194, 0x3FB70A3D70A3D70A
  %198 = fsub contract double %196, %197
  %199 = fptrunc double %198 to float
  %200 = fpext float %199 to double
  %201 = fmul contract double %200, 2.000000e+00
  %202 = fpext float %191 to double
  %203 = fsub contract double %201, %202
  %204 = fmul contract double %201, 0x3FB70A3D70A3D70A
  %205 = fsub contract double %203, %204
  %206 = fptrunc double %205 to float
  %207 = fpext float %206 to double
  %208 = fmul contract double %207, 2.000000e+00
  %209 = fpext float %199 to double
  %210 = fsub contract double %208, %209
  %211 = fmul contract double %208, 0x3FB70A3D70A3D70A
  %212 = fsub contract double %210, %211
  %213 = fptrunc double %212 to float
  %214 = fpext float %213 to double
  %215 = fmul contract double %214, 2.000000e+00
  %216 = fpext float %206 to double
  %217 = fsub contract double %215, %216
  %218 = fmul contract double %215, 0x3FB70A3D70A3D70A
  %219 = fsub contract double %217, %218
  %220 = fptrunc double %219 to float
  %221 = fpext float %220 to double
  %222 = fmul contract double %221, 2.000000e+00
  %223 = fpext float %213 to double
  %224 = fsub contract double %222, %223
  %225 = fmul contract double %222, 0x3FB70A3D70A3D70A
  %226 = fsub contract double %224, %225
  %227 = fptrunc double %226 to float
  %228 = fpext float %227 to double
  %229 = fmul contract double %228, 2.000000e+00
  %230 = fpext float %220 to double
  %231 = fsub contract double %229, %230
  %232 = fmul contract double %229, 0x3FB70A3D70A3D70A
  %233 = fsub contract double %231, %232
  %234 = fptrunc double %233 to float
  %235 = fpext float %234 to double
  %236 = fmul contract double %235, 2.000000e+00
  %237 = fpext float %227 to double
  %238 = fsub contract double %236, %237
  %239 = fmul contract double %236, 0x3FB70A3D70A3D70A
  %240 = fsub contract double %238, %239
  %241 = fptrunc double %240 to float
  %242 = fpext float %241 to double
  %243 = fmul contract double %242, 2.000000e+00
  %244 = fpext float %234 to double
  %245 = fsub contract double %243, %244
  %246 = fmul contract double %243, 0x3FB70A3D70A3D70A
  %247 = fsub contract double %245, %246
  %248 = fptrunc double %247 to float
  %249 = add i32 %192, 8
  %250 = icmp eq i32 %249, %166
  br i1 %250, label %167, label %189, !llvm.loop !11

251:                                              ; preds = %3, %185
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
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
