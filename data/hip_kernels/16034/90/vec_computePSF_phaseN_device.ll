; ModuleID = '../data/hip_kernels/16034/90/main.cu'
source_filename = "../data/hip_kernels/16034/90/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_computePSF_phaseN(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double %6, double %7, double %8, i32 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture writeonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !7
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = add i32 %29, %23
  %31 = udiv i32 %22, %19
  %32 = mul i32 %31, %19
  %33 = icmp ugt i32 %22, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %30
  %37 = add i32 %36, %14
  %38 = mul i32 %37, %19
  %39 = add i32 %38, %13
  %40 = icmp slt i32 %39, %0
  br i1 %40, label %41, label %263

41:                                               ; preds = %12
  %42 = sext i32 %39 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %1, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !16, !amdgpu.noclobber !6
  %45 = fmul contract double %44, %6
  %46 = getelementptr inbounds double, double addrspace(1)* %2, i64 %42
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !16, !amdgpu.noclobber !6
  %48 = fmul contract double %47, %7
  %49 = fadd contract double %45, %48
  %50 = getelementptr inbounds double, double addrspace(1)* %3, i64 %42
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !16, !amdgpu.noclobber !6
  %52 = fmul contract double %51, %8
  %53 = fadd contract double %49, %52
  %54 = getelementptr inbounds double, double addrspace(1)* %5, i64 %42
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !16, !amdgpu.noclobber !6
  %56 = fadd contract double %55, %53
  %57 = getelementptr inbounds double, double addrspace(1)* %4, i64 %42
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !16, !amdgpu.noclobber !6
  %59 = tail call double @llvm.fabs.f64(double %56)
  %60 = fcmp olt double %59, 0x41D0000000000000
  br i1 %60, label %61, label %118

61:                                               ; preds = %41
  %62 = fmul double %59, 0x3FE45F306DC9C883
  %63 = tail call double @llvm.rint.f64(double %62)
  %64 = tail call double @llvm.fma.f64(double %63, double 0xBFF921FB54442D18, double %59)
  %65 = tail call double @llvm.fma.f64(double %63, double 0xBC91A62633145C00, double %64)
  %66 = fmul double %63, 0x3C91A62633145C00
  %67 = fneg double %66
  %68 = tail call double @llvm.fma.f64(double %63, double 0x3C91A62633145C00, double %67)
  %69 = fsub double %64, %66
  %70 = fsub double %64, %69
  %71 = fsub double %70, %66
  %72 = fsub double %69, %65
  %73 = fadd double %72, %71
  %74 = fsub double %73, %68
  %75 = tail call double @llvm.fma.f64(double %63, double 0xB97B839A252049C0, double %74)
  %76 = fadd double %65, %75
  %77 = fsub double %76, %65
  %78 = fsub double %75, %77
  %79 = fptosi double %63 to i32
  %80 = fmul double %76, %76
  %81 = fmul double %80, 5.000000e-01
  %82 = fsub double 1.000000e+00, %81
  %83 = fsub double 1.000000e+00, %82
  %84 = fsub double %83, %81
  %85 = fmul double %80, %80
  %86 = tail call double @llvm.fma.f64(double %80, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %87 = tail call double @llvm.fma.f64(double %80, double %86, double 0xBE927E4FA17F65F6)
  %88 = tail call double @llvm.fma.f64(double %80, double %87, double 0x3EFA01A019F4EC90)
  %89 = tail call double @llvm.fma.f64(double %80, double %88, double 0xBF56C16C16C16967)
  %90 = tail call double @llvm.fma.f64(double %80, double %89, double 0x3FA5555555555555)
  %91 = fneg double %78
  %92 = tail call double @llvm.fma.f64(double %76, double %91, double %84)
  %93 = tail call double @llvm.fma.f64(double %85, double %90, double %92)
  %94 = fadd double %82, %93
  %95 = tail call double @llvm.fma.f64(double %80, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %96 = tail call double @llvm.fma.f64(double %80, double %95, double 0x3EC71DE3796CDE01)
  %97 = tail call double @llvm.fma.f64(double %80, double %96, double 0xBF2A01A019E83E5C)
  %98 = tail call double @llvm.fma.f64(double %80, double %97, double 0x3F81111111110BB3)
  %99 = fneg double %80
  %100 = fmul double %76, %99
  %101 = fmul double %78, 5.000000e-01
  %102 = tail call double @llvm.fma.f64(double %100, double %98, double %101)
  %103 = tail call double @llvm.fma.f64(double %80, double %102, double %91)
  %104 = tail call double @llvm.fma.f64(double %100, double 0xBFC5555555555555, double %103)
  %105 = fsub double %76, %104
  %106 = fneg double %105
  %107 = and i32 %79, 1
  %108 = icmp eq i32 %107, 0
  %109 = select i1 %108, double %94, double %106
  %110 = bitcast double %109 to <2 x i32>
  %111 = shl i32 %79, 30
  %112 = and i32 %111, -2147483648
  %113 = extractelement <2 x i32> %110, i64 1
  %114 = xor i32 %113, %112
  %115 = insertelement <2 x i32> %110, i32 %114, i64 1
  %116 = tail call i1 @llvm.amdgcn.class.f64(double %59, i32 504)
  %117 = select i1 %116, <2 x i32> %115, <2 x i32> <i32 0, i32 2146959360>
  br label %232

118:                                              ; preds = %41
  %119 = tail call double @llvm.amdgcn.trig.preop.f64(double %59, i32 0)
  %120 = tail call double @llvm.amdgcn.trig.preop.f64(double %59, i32 1)
  %121 = tail call double @llvm.amdgcn.trig.preop.f64(double %59, i32 2)
  %122 = fcmp oge double %59, 0x7B00000000000000
  %123 = tail call double @llvm.amdgcn.ldexp.f64(double %59, i32 -128)
  %124 = select i1 %122, double %123, double %59
  %125 = fmul double %121, %124
  %126 = fneg double %125
  %127 = tail call double @llvm.fma.f64(double %121, double %124, double %126)
  %128 = fmul double %120, %124
  %129 = fneg double %128
  %130 = tail call double @llvm.fma.f64(double %120, double %124, double %129)
  %131 = fmul double %119, %124
  %132 = fneg double %131
  %133 = tail call double @llvm.fma.f64(double %119, double %124, double %132)
  %134 = fadd double %128, %133
  %135 = fsub double %134, %128
  %136 = fsub double %134, %135
  %137 = fsub double %133, %135
  %138 = fsub double %128, %136
  %139 = fadd double %137, %138
  %140 = fadd double %125, %130
  %141 = fsub double %140, %125
  %142 = fsub double %140, %141
  %143 = fsub double %130, %141
  %144 = fsub double %125, %142
  %145 = fadd double %143, %144
  %146 = fadd double %140, %139
  %147 = fsub double %146, %140
  %148 = fsub double %146, %147
  %149 = fsub double %139, %147
  %150 = fsub double %140, %148
  %151 = fadd double %149, %150
  %152 = fadd double %145, %151
  %153 = fadd double %127, %152
  %154 = fadd double %131, %134
  %155 = fsub double %154, %131
  %156 = fsub double %134, %155
  %157 = fadd double %156, %146
  %158 = fsub double %157, %156
  %159 = fsub double %146, %158
  %160 = fadd double %159, %153
  %161 = tail call double @llvm.amdgcn.ldexp.f64(double %154, i32 -2)
  %162 = tail call double @llvm.amdgcn.fract.f64(double %161)
  %163 = tail call i1 @llvm.amdgcn.class.f64(double %161, i32 516)
  %164 = select i1 %163, double 0.000000e+00, double %162
  %165 = tail call double @llvm.amdgcn.ldexp.f64(double %164, i32 2)
  %166 = fadd double %165, %157
  %167 = fcmp olt double %166, 0.000000e+00
  %168 = select i1 %167, double 4.000000e+00, double 0.000000e+00
  %169 = fadd double %165, %168
  %170 = fadd double %157, %169
  %171 = fptosi double %170 to i32
  %172 = sitofp i32 %171 to double
  %173 = fsub double %169, %172
  %174 = fadd double %157, %173
  %175 = fsub double %174, %173
  %176 = fsub double %157, %175
  %177 = fadd double %160, %176
  %178 = fcmp oge double %174, 5.000000e-01
  %179 = zext i1 %178 to i32
  %180 = add nsw i32 %179, %171
  %181 = select i1 %178, double 1.000000e+00, double 0.000000e+00
  %182 = fsub double %174, %181
  %183 = fadd double %182, %177
  %184 = fsub double %183, %182
  %185 = fsub double %177, %184
  %186 = fmul double %183, 0x3FF921FB54442D18
  %187 = fneg double %186
  %188 = tail call double @llvm.fma.f64(double %183, double 0x3FF921FB54442D18, double %187)
  %189 = tail call double @llvm.fma.f64(double %183, double 0x3C91A62633145C07, double %188)
  %190 = tail call double @llvm.fma.f64(double %185, double 0x3FF921FB54442D18, double %189)
  %191 = fadd double %186, %190
  %192 = fsub double %191, %186
  %193 = fsub double %190, %192
  %194 = fmul double %191, %191
  %195 = fmul double %194, 5.000000e-01
  %196 = fsub double 1.000000e+00, %195
  %197 = fsub double 1.000000e+00, %196
  %198 = fsub double %197, %195
  %199 = fmul double %194, %194
  %200 = tail call double @llvm.fma.f64(double %194, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %201 = tail call double @llvm.fma.f64(double %194, double %200, double 0xBE927E4FA17F65F6)
  %202 = tail call double @llvm.fma.f64(double %194, double %201, double 0x3EFA01A019F4EC90)
  %203 = tail call double @llvm.fma.f64(double %194, double %202, double 0xBF56C16C16C16967)
  %204 = tail call double @llvm.fma.f64(double %194, double %203, double 0x3FA5555555555555)
  %205 = fneg double %193
  %206 = tail call double @llvm.fma.f64(double %191, double %205, double %198)
  %207 = tail call double @llvm.fma.f64(double %199, double %204, double %206)
  %208 = fadd double %196, %207
  %209 = tail call double @llvm.fma.f64(double %194, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %210 = tail call double @llvm.fma.f64(double %194, double %209, double 0x3EC71DE3796CDE01)
  %211 = tail call double @llvm.fma.f64(double %194, double %210, double 0xBF2A01A019E83E5C)
  %212 = tail call double @llvm.fma.f64(double %194, double %211, double 0x3F81111111110BB3)
  %213 = fneg double %194
  %214 = fmul double %191, %213
  %215 = fmul double %193, 5.000000e-01
  %216 = tail call double @llvm.fma.f64(double %214, double %212, double %215)
  %217 = tail call double @llvm.fma.f64(double %194, double %216, double %205)
  %218 = tail call double @llvm.fma.f64(double %214, double 0xBFC5555555555555, double %217)
  %219 = fsub double %191, %218
  %220 = fneg double %219
  %221 = and i32 %180, 1
  %222 = icmp eq i32 %221, 0
  %223 = select i1 %222, double %208, double %220
  %224 = bitcast double %223 to <2 x i32>
  %225 = shl i32 %180, 30
  %226 = and i32 %225, -2147483648
  %227 = extractelement <2 x i32> %224, i64 1
  %228 = xor i32 %227, %226
  %229 = insertelement <2 x i32> %224, i32 %228, i64 1
  %230 = tail call i1 @llvm.amdgcn.class.f64(double %59, i32 504)
  %231 = select i1 %230, <2 x i32> %229, <2 x i32> <i32 0, i32 2146959360>
  br label %232

232:                                              ; preds = %61, %118
  %233 = phi <2 x i32> [ %117, %61 ], [ %231, %118 ]
  %234 = phi i32 [ %111, %61 ], [ %225, %118 ]
  %235 = phi i32 [ %107, %61 ], [ %221, %118 ]
  %236 = phi double [ %105, %61 ], [ %219, %118 ]
  %237 = phi double [ %94, %61 ], [ %208, %118 ]
  %238 = phi i1 [ %116, %61 ], [ %230, %118 ]
  %239 = bitcast <2 x i32> %233 to double
  %240 = fmul contract double %58, %239
  %241 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %42
  %242 = load i32, i32 addrspace(1)* %241, align 4, !tbaa !20
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds double, double addrspace(1)* %11, i64 %243
  store double %240, double addrspace(1)* %244, align 8, !tbaa !16
  %245 = load double, double addrspace(1)* %57, align 8, !tbaa !16
  %246 = icmp eq i32 %235, 0
  %247 = select i1 %246, double %236, double %237
  %248 = bitcast double %247 to <2 x i32>
  %249 = bitcast double %56 to <2 x i32>
  %250 = extractelement <2 x i32> %249, i64 1
  %251 = xor i32 %234, %250
  %252 = and i32 %251, -2147483648
  %253 = extractelement <2 x i32> %248, i64 1
  %254 = xor i32 %253, %252
  %255 = insertelement <2 x i32> %248, i32 %254, i64 1
  %256 = select i1 %238, <2 x i32> %255, <2 x i32> <i32 0, i32 2146959360>
  %257 = bitcast <2 x i32> %256 to double
  %258 = fmul contract double %245, %257
  %259 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %42
  %260 = load i32, i32 addrspace(1)* %259, align 4, !tbaa !20, !amdgpu.noclobber !6
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds double, double addrspace(1)* %11, i64 %261
  store double %258, double addrspace(1)* %262, align 8, !tbaa !16
  br label %263

263:                                              ; preds = %232, %12
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
