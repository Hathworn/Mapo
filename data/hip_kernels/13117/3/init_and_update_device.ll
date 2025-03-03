; ModuleID = '../data/hip_kernels/13117/3/main.cu'
source_filename = "../data/hip_kernels/13117/3/main.cu"
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
  br i1 %10, label %11, label %225

11:                                               ; preds = %3
  %12 = add nsw i32 %1, -1
  %13 = sitofp i32 %12 to float
  %14 = add nsw i32 %7, -1
  %15 = sitofp i32 %14 to float
  %16 = fdiv contract float %15, %13
  %17 = fpext float %16 to double
  %18 = fmul contract double %17, 0x401921FB54411744
  %19 = tail call double @llvm.fabs.f64(double %18)
  %20 = fcmp olt double %19, 0x41D0000000000000
  br i1 %20, label %21, label %40

21:                                               ; preds = %11
  %22 = fmul double %19, 0x3FE45F306DC9C883
  %23 = tail call double @llvm.rint.f64(double %22)
  %24 = tail call double @llvm.fma.f64(double %23, double 0xBFF921FB54442D18, double %19)
  %25 = tail call double @llvm.fma.f64(double %23, double 0xBC91A62633145C00, double %24)
  %26 = fmul double %23, 0x3C91A62633145C00
  %27 = fneg double %26
  %28 = tail call double @llvm.fma.f64(double %23, double 0x3C91A62633145C00, double %27)
  %29 = fsub double %24, %26
  %30 = fsub double %24, %29
  %31 = fsub double %30, %26
  %32 = fsub double %29, %25
  %33 = fadd double %32, %31
  %34 = fsub double %33, %28
  %35 = tail call double @llvm.fma.f64(double %23, double 0xB97B839A252049C0, double %34)
  %36 = fadd double %25, %35
  %37 = fsub double %36, %25
  %38 = fsub double %35, %37
  %39 = fptosi double %23 to i32
  br label %116

40:                                               ; preds = %11
  %41 = tail call double @llvm.amdgcn.trig.preop.f64(double %19, i32 0)
  %42 = tail call double @llvm.amdgcn.trig.preop.f64(double %19, i32 1)
  %43 = tail call double @llvm.amdgcn.trig.preop.f64(double %19, i32 2)
  %44 = fcmp oge double %19, 0x7B00000000000000
  %45 = tail call double @llvm.amdgcn.ldexp.f64(double %19, i32 -128)
  %46 = select i1 %44, double %45, double %19
  %47 = fmul double %43, %46
  %48 = fneg double %47
  %49 = tail call double @llvm.fma.f64(double %43, double %46, double %48)
  %50 = fmul double %42, %46
  %51 = fneg double %50
  %52 = tail call double @llvm.fma.f64(double %42, double %46, double %51)
  %53 = fmul double %41, %46
  %54 = fneg double %53
  %55 = tail call double @llvm.fma.f64(double %41, double %46, double %54)
  %56 = fadd double %50, %55
  %57 = fsub double %56, %50
  %58 = fsub double %56, %57
  %59 = fsub double %55, %57
  %60 = fsub double %50, %58
  %61 = fadd double %59, %60
  %62 = fadd double %47, %52
  %63 = fsub double %62, %47
  %64 = fsub double %62, %63
  %65 = fsub double %52, %63
  %66 = fsub double %47, %64
  %67 = fadd double %65, %66
  %68 = fadd double %62, %61
  %69 = fsub double %68, %62
  %70 = fsub double %68, %69
  %71 = fsub double %61, %69
  %72 = fsub double %62, %70
  %73 = fadd double %71, %72
  %74 = fadd double %67, %73
  %75 = fadd double %49, %74
  %76 = fadd double %53, %56
  %77 = fsub double %76, %53
  %78 = fsub double %56, %77
  %79 = fadd double %78, %68
  %80 = fsub double %79, %78
  %81 = fsub double %68, %80
  %82 = fadd double %81, %75
  %83 = tail call double @llvm.amdgcn.ldexp.f64(double %76, i32 -2)
  %84 = tail call double @llvm.amdgcn.fract.f64(double %83)
  %85 = tail call i1 @llvm.amdgcn.class.f64(double %83, i32 516)
  %86 = select i1 %85, double 0.000000e+00, double %84
  %87 = tail call double @llvm.amdgcn.ldexp.f64(double %86, i32 2)
  %88 = fadd double %87, %79
  %89 = fcmp olt double %88, 0.000000e+00
  %90 = select i1 %89, double 4.000000e+00, double 0.000000e+00
  %91 = fadd double %87, %90
  %92 = fadd double %79, %91
  %93 = fptosi double %92 to i32
  %94 = sitofp i32 %93 to double
  %95 = fsub double %91, %94
  %96 = fadd double %79, %95
  %97 = fsub double %96, %95
  %98 = fsub double %79, %97
  %99 = fadd double %82, %98
  %100 = fcmp oge double %96, 5.000000e-01
  %101 = zext i1 %100 to i32
  %102 = add nsw i32 %101, %93
  %103 = select i1 %100, double 1.000000e+00, double 0.000000e+00
  %104 = fsub double %96, %103
  %105 = fadd double %104, %99
  %106 = fsub double %105, %104
  %107 = fsub double %99, %106
  %108 = fmul double %105, 0x3FF921FB54442D18
  %109 = fneg double %108
  %110 = tail call double @llvm.fma.f64(double %105, double 0x3FF921FB54442D18, double %109)
  %111 = tail call double @llvm.fma.f64(double %105, double 0x3C91A62633145C07, double %110)
  %112 = tail call double @llvm.fma.f64(double %107, double 0x3FF921FB54442D18, double %111)
  %113 = fadd double %108, %112
  %114 = fsub double %113, %108
  %115 = fsub double %112, %114
  br label %116

116:                                              ; preds = %21, %40
  %117 = phi double [ %38, %21 ], [ %115, %40 ]
  %118 = phi double [ %36, %21 ], [ %113, %40 ]
  %119 = phi i32 [ %39, %21 ], [ %102, %40 ]
  %120 = fmul double %118, %118
  %121 = fmul double %120, 5.000000e-01
  %122 = fsub double 1.000000e+00, %121
  %123 = fsub double 1.000000e+00, %122
  %124 = fsub double %123, %121
  %125 = fmul double %120, %120
  %126 = tail call double @llvm.fma.f64(double %120, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %127 = tail call double @llvm.fma.f64(double %120, double %126, double 0xBE927E4FA17F65F6)
  %128 = tail call double @llvm.fma.f64(double %120, double %127, double 0x3EFA01A019F4EC90)
  %129 = tail call double @llvm.fma.f64(double %120, double %128, double 0xBF56C16C16C16967)
  %130 = tail call double @llvm.fma.f64(double %120, double %129, double 0x3FA5555555555555)
  %131 = fneg double %117
  %132 = tail call double @llvm.fma.f64(double %118, double %131, double %124)
  %133 = tail call double @llvm.fma.f64(double %125, double %130, double %132)
  %134 = fadd double %122, %133
  %135 = tail call double @llvm.fma.f64(double %120, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %136 = tail call double @llvm.fma.f64(double %120, double %135, double 0x3EC71DE3796CDE01)
  %137 = tail call double @llvm.fma.f64(double %120, double %136, double 0xBF2A01A019E83E5C)
  %138 = tail call double @llvm.fma.f64(double %120, double %137, double 0x3F81111111110BB3)
  %139 = fneg double %120
  %140 = fmul double %118, %139
  %141 = fmul double %117, 5.000000e-01
  %142 = tail call double @llvm.fma.f64(double %140, double %138, double %141)
  %143 = tail call double @llvm.fma.f64(double %120, double %142, double %131)
  %144 = tail call double @llvm.fma.f64(double %140, double 0xBFC5555555555555, double %143)
  %145 = fsub double %118, %144
  %146 = and i32 %119, 1
  %147 = icmp eq i32 %146, 0
  %148 = select i1 %147, double %145, double %134
  %149 = bitcast double %148 to <2 x i32>
  %150 = shl i32 %119, 30
  %151 = bitcast double %18 to <2 x i32>
  %152 = extractelement <2 x i32> %151, i64 1
  %153 = xor i32 %150, %152
  %154 = and i32 %153, -2147483648
  %155 = extractelement <2 x i32> %149, i64 1
  %156 = xor i32 %155, %154
  %157 = insertelement <2 x i32> %149, i32 %156, i64 1
  %158 = tail call i1 @llvm.amdgcn.class.f64(double %19, i32 504)
  %159 = select i1 %158, <2 x i32> %157, <2 x i32> <i32 0, i32 2146959360>
  %160 = bitcast <2 x i32> %159 to double
  %161 = fptrunc double %160 to float
  %162 = icmp slt i32 %2, 1
  br i1 %162, label %183, label %163

163:                                              ; preds = %116
  %164 = and i32 %2, 7
  %165 = icmp ult i32 %2, 8
  br i1 %165, label %168, label %166

166:                                              ; preds = %163
  %167 = and i32 %2, -8
  br label %187

168:                                              ; preds = %187, %163
  %169 = phi float [ undef, %163 ], [ %222, %187 ]
  %170 = phi float [ %161, %163 ], [ %218, %187 ]
  %171 = phi float [ %161, %163 ], [ %222, %187 ]
  %172 = icmp eq i32 %164, 0
  br i1 %172, label %183, label %173

173:                                              ; preds = %168, %173
  %174 = phi float [ %175, %173 ], [ %170, %168 ]
  %175 = phi float [ %180, %173 ], [ %171, %168 ]
  %176 = phi i32 [ %181, %173 ], [ 0, %168 ]
  %177 = fmul contract float %175, 2.000000e+00
  %178 = fsub contract float %177, %174
  %179 = fmul contract float %177, 0x3FB70A3D80000000
  %180 = fsub contract float %178, %179
  %181 = add i32 %176, 1
  %182 = icmp eq i32 %181, %164
  br i1 %182, label %183, label %173, !llvm.loop !5

183:                                              ; preds = %168, %173, %116
  %184 = phi float [ %161, %116 ], [ %169, %168 ], [ %180, %173 ]
  %185 = zext i32 %7 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %0, i64 %185
  store float %184, float addrspace(1)* %186, align 4, !tbaa !7
  br label %225

187:                                              ; preds = %187, %166
  %188 = phi float [ %161, %166 ], [ %218, %187 ]
  %189 = phi float [ %161, %166 ], [ %222, %187 ]
  %190 = phi i32 [ 0, %166 ], [ %223, %187 ]
  %191 = fmul contract float %189, 2.000000e+00
  %192 = fsub contract float %191, %188
  %193 = fmul contract float %191, 0x3FB70A3D80000000
  %194 = fsub contract float %192, %193
  %195 = fmul contract float %194, 2.000000e+00
  %196 = fsub contract float %195, %189
  %197 = fmul contract float %195, 0x3FB70A3D80000000
  %198 = fsub contract float %196, %197
  %199 = fmul contract float %198, 2.000000e+00
  %200 = fsub contract float %199, %194
  %201 = fmul contract float %199, 0x3FB70A3D80000000
  %202 = fsub contract float %200, %201
  %203 = fmul contract float %202, 2.000000e+00
  %204 = fsub contract float %203, %198
  %205 = fmul contract float %203, 0x3FB70A3D80000000
  %206 = fsub contract float %204, %205
  %207 = fmul contract float %206, 2.000000e+00
  %208 = fsub contract float %207, %202
  %209 = fmul contract float %207, 0x3FB70A3D80000000
  %210 = fsub contract float %208, %209
  %211 = fmul contract float %210, 2.000000e+00
  %212 = fsub contract float %211, %206
  %213 = fmul contract float %211, 0x3FB70A3D80000000
  %214 = fsub contract float %212, %213
  %215 = fmul contract float %214, 2.000000e+00
  %216 = fsub contract float %215, %210
  %217 = fmul contract float %215, 0x3FB70A3D80000000
  %218 = fsub contract float %216, %217
  %219 = fmul contract float %218, 2.000000e+00
  %220 = fsub contract float %219, %214
  %221 = fmul contract float %219, 0x3FB70A3D80000000
  %222 = fsub contract float %220, %221
  %223 = add i32 %190, 8
  %224 = icmp eq i32 %223, %167
  br i1 %224, label %168, label %187, !llvm.loop !11

225:                                              ; preds = %3, %183
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
