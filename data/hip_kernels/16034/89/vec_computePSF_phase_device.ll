; ModuleID = '../data/hip_kernels/16034/89/main.cu'
source_filename = "../data/hip_kernels/16034/89/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_computePSF_phase(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double %8, double %9, double %10) local_unnamed_addr #0 {
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
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = add i32 %28, %22
  %30 = udiv i32 %21, %18
  %31 = mul i32 %30, %18
  %32 = icmp ugt i32 %21, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %29
  %36 = add i32 %35, %13
  %37 = mul i32 %36, %18
  %38 = add i32 %37, %12
  %39 = icmp slt i32 %38, %0
  br i1 %39, label %40, label %256

40:                                               ; preds = %11
  %41 = sext i32 %38 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %3, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !16, !amdgpu.noclobber !6
  %44 = fmul contract double %43, %8
  %45 = getelementptr inbounds double, double addrspace(1)* %4, i64 %41
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !16, !amdgpu.noclobber !6
  %47 = fmul contract double %46, %9
  %48 = fadd contract double %44, %47
  %49 = getelementptr inbounds double, double addrspace(1)* %5, i64 %41
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !16, !amdgpu.noclobber !6
  %51 = fmul contract double %50, %10
  %52 = fadd contract double %48, %51
  %53 = getelementptr inbounds double, double addrspace(1)* %7, i64 %41
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !16, !amdgpu.noclobber !6
  %55 = fadd contract double %54, %52
  %56 = getelementptr inbounds double, double addrspace(1)* %6, i64 %41
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !16, !amdgpu.noclobber !6
  %58 = tail call double @llvm.fabs.f64(double %55)
  %59 = fcmp olt double %58, 0x41D0000000000000
  br i1 %59, label %60, label %117

60:                                               ; preds = %40
  %61 = fmul double %58, 0x3FE45F306DC9C883
  %62 = tail call double @llvm.rint.f64(double %61)
  %63 = tail call double @llvm.fma.f64(double %62, double 0xBFF921FB54442D18, double %58)
  %64 = tail call double @llvm.fma.f64(double %62, double 0xBC91A62633145C00, double %63)
  %65 = fmul double %62, 0x3C91A62633145C00
  %66 = fneg double %65
  %67 = tail call double @llvm.fma.f64(double %62, double 0x3C91A62633145C00, double %66)
  %68 = fsub double %63, %65
  %69 = fsub double %63, %68
  %70 = fsub double %69, %65
  %71 = fsub double %68, %64
  %72 = fadd double %71, %70
  %73 = fsub double %72, %67
  %74 = tail call double @llvm.fma.f64(double %62, double 0xB97B839A252049C0, double %73)
  %75 = fadd double %64, %74
  %76 = fsub double %75, %64
  %77 = fsub double %74, %76
  %78 = fptosi double %62 to i32
  %79 = fmul double %75, %75
  %80 = fmul double %79, 5.000000e-01
  %81 = fsub double 1.000000e+00, %80
  %82 = fsub double 1.000000e+00, %81
  %83 = fsub double %82, %80
  %84 = fmul double %79, %79
  %85 = tail call double @llvm.fma.f64(double %79, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %86 = tail call double @llvm.fma.f64(double %79, double %85, double 0xBE927E4FA17F65F6)
  %87 = tail call double @llvm.fma.f64(double %79, double %86, double 0x3EFA01A019F4EC90)
  %88 = tail call double @llvm.fma.f64(double %79, double %87, double 0xBF56C16C16C16967)
  %89 = tail call double @llvm.fma.f64(double %79, double %88, double 0x3FA5555555555555)
  %90 = fneg double %77
  %91 = tail call double @llvm.fma.f64(double %75, double %90, double %83)
  %92 = tail call double @llvm.fma.f64(double %84, double %89, double %91)
  %93 = fadd double %81, %92
  %94 = tail call double @llvm.fma.f64(double %79, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %95 = tail call double @llvm.fma.f64(double %79, double %94, double 0x3EC71DE3796CDE01)
  %96 = tail call double @llvm.fma.f64(double %79, double %95, double 0xBF2A01A019E83E5C)
  %97 = tail call double @llvm.fma.f64(double %79, double %96, double 0x3F81111111110BB3)
  %98 = fneg double %79
  %99 = fmul double %75, %98
  %100 = fmul double %77, 5.000000e-01
  %101 = tail call double @llvm.fma.f64(double %99, double %97, double %100)
  %102 = tail call double @llvm.fma.f64(double %79, double %101, double %90)
  %103 = tail call double @llvm.fma.f64(double %99, double 0xBFC5555555555555, double %102)
  %104 = fsub double %75, %103
  %105 = fneg double %104
  %106 = and i32 %78, 1
  %107 = icmp eq i32 %106, 0
  %108 = select i1 %107, double %93, double %105
  %109 = bitcast double %108 to <2 x i32>
  %110 = shl i32 %78, 30
  %111 = and i32 %110, -2147483648
  %112 = extractelement <2 x i32> %109, i64 1
  %113 = xor i32 %112, %111
  %114 = insertelement <2 x i32> %109, i32 %113, i64 1
  %115 = tail call i1 @llvm.amdgcn.class.f64(double %58, i32 504)
  %116 = select i1 %115, <2 x i32> %114, <2 x i32> <i32 0, i32 2146959360>
  br label %231

117:                                              ; preds = %40
  %118 = tail call double @llvm.amdgcn.trig.preop.f64(double %58, i32 0)
  %119 = tail call double @llvm.amdgcn.trig.preop.f64(double %58, i32 1)
  %120 = tail call double @llvm.amdgcn.trig.preop.f64(double %58, i32 2)
  %121 = fcmp oge double %58, 0x7B00000000000000
  %122 = tail call double @llvm.amdgcn.ldexp.f64(double %58, i32 -128)
  %123 = select i1 %121, double %122, double %58
  %124 = fmul double %120, %123
  %125 = fneg double %124
  %126 = tail call double @llvm.fma.f64(double %120, double %123, double %125)
  %127 = fmul double %119, %123
  %128 = fneg double %127
  %129 = tail call double @llvm.fma.f64(double %119, double %123, double %128)
  %130 = fmul double %118, %123
  %131 = fneg double %130
  %132 = tail call double @llvm.fma.f64(double %118, double %123, double %131)
  %133 = fadd double %127, %132
  %134 = fsub double %133, %127
  %135 = fsub double %133, %134
  %136 = fsub double %132, %134
  %137 = fsub double %127, %135
  %138 = fadd double %136, %137
  %139 = fadd double %124, %129
  %140 = fsub double %139, %124
  %141 = fsub double %139, %140
  %142 = fsub double %129, %140
  %143 = fsub double %124, %141
  %144 = fadd double %142, %143
  %145 = fadd double %139, %138
  %146 = fsub double %145, %139
  %147 = fsub double %145, %146
  %148 = fsub double %138, %146
  %149 = fsub double %139, %147
  %150 = fadd double %148, %149
  %151 = fadd double %144, %150
  %152 = fadd double %126, %151
  %153 = fadd double %130, %133
  %154 = fsub double %153, %130
  %155 = fsub double %133, %154
  %156 = fadd double %155, %145
  %157 = fsub double %156, %155
  %158 = fsub double %145, %157
  %159 = fadd double %158, %152
  %160 = tail call double @llvm.amdgcn.ldexp.f64(double %153, i32 -2)
  %161 = tail call double @llvm.amdgcn.fract.f64(double %160)
  %162 = tail call i1 @llvm.amdgcn.class.f64(double %160, i32 516)
  %163 = select i1 %162, double 0.000000e+00, double %161
  %164 = tail call double @llvm.amdgcn.ldexp.f64(double %163, i32 2)
  %165 = fadd double %164, %156
  %166 = fcmp olt double %165, 0.000000e+00
  %167 = select i1 %166, double 4.000000e+00, double 0.000000e+00
  %168 = fadd double %164, %167
  %169 = fadd double %156, %168
  %170 = fptosi double %169 to i32
  %171 = sitofp i32 %170 to double
  %172 = fsub double %168, %171
  %173 = fadd double %156, %172
  %174 = fsub double %173, %172
  %175 = fsub double %156, %174
  %176 = fadd double %159, %175
  %177 = fcmp oge double %173, 5.000000e-01
  %178 = zext i1 %177 to i32
  %179 = add nsw i32 %178, %170
  %180 = select i1 %177, double 1.000000e+00, double 0.000000e+00
  %181 = fsub double %173, %180
  %182 = fadd double %181, %176
  %183 = fsub double %182, %181
  %184 = fsub double %176, %183
  %185 = fmul double %182, 0x3FF921FB54442D18
  %186 = fneg double %185
  %187 = tail call double @llvm.fma.f64(double %182, double 0x3FF921FB54442D18, double %186)
  %188 = tail call double @llvm.fma.f64(double %182, double 0x3C91A62633145C07, double %187)
  %189 = tail call double @llvm.fma.f64(double %184, double 0x3FF921FB54442D18, double %188)
  %190 = fadd double %185, %189
  %191 = fsub double %190, %185
  %192 = fsub double %189, %191
  %193 = fmul double %190, %190
  %194 = fmul double %193, 5.000000e-01
  %195 = fsub double 1.000000e+00, %194
  %196 = fsub double 1.000000e+00, %195
  %197 = fsub double %196, %194
  %198 = fmul double %193, %193
  %199 = tail call double @llvm.fma.f64(double %193, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %200 = tail call double @llvm.fma.f64(double %193, double %199, double 0xBE927E4FA17F65F6)
  %201 = tail call double @llvm.fma.f64(double %193, double %200, double 0x3EFA01A019F4EC90)
  %202 = tail call double @llvm.fma.f64(double %193, double %201, double 0xBF56C16C16C16967)
  %203 = tail call double @llvm.fma.f64(double %193, double %202, double 0x3FA5555555555555)
  %204 = fneg double %192
  %205 = tail call double @llvm.fma.f64(double %190, double %204, double %197)
  %206 = tail call double @llvm.fma.f64(double %198, double %203, double %205)
  %207 = fadd double %195, %206
  %208 = tail call double @llvm.fma.f64(double %193, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %209 = tail call double @llvm.fma.f64(double %193, double %208, double 0x3EC71DE3796CDE01)
  %210 = tail call double @llvm.fma.f64(double %193, double %209, double 0xBF2A01A019E83E5C)
  %211 = tail call double @llvm.fma.f64(double %193, double %210, double 0x3F81111111110BB3)
  %212 = fneg double %193
  %213 = fmul double %190, %212
  %214 = fmul double %192, 5.000000e-01
  %215 = tail call double @llvm.fma.f64(double %213, double %211, double %214)
  %216 = tail call double @llvm.fma.f64(double %193, double %215, double %204)
  %217 = tail call double @llvm.fma.f64(double %213, double 0xBFC5555555555555, double %216)
  %218 = fsub double %190, %217
  %219 = fneg double %218
  %220 = and i32 %179, 1
  %221 = icmp eq i32 %220, 0
  %222 = select i1 %221, double %207, double %219
  %223 = bitcast double %222 to <2 x i32>
  %224 = shl i32 %179, 30
  %225 = and i32 %224, -2147483648
  %226 = extractelement <2 x i32> %223, i64 1
  %227 = xor i32 %226, %225
  %228 = insertelement <2 x i32> %223, i32 %227, i64 1
  %229 = tail call i1 @llvm.amdgcn.class.f64(double %58, i32 504)
  %230 = select i1 %229, <2 x i32> %228, <2 x i32> <i32 0, i32 2146959360>
  br label %231

231:                                              ; preds = %60, %117
  %232 = phi i32 [ %110, %60 ], [ %224, %117 ]
  %233 = phi i32 [ %106, %60 ], [ %220, %117 ]
  %234 = phi double [ %104, %60 ], [ %218, %117 ]
  %235 = phi double [ %93, %60 ], [ %207, %117 ]
  %236 = phi <2 x i32> [ %116, %60 ], [ %230, %117 ]
  %237 = phi i1 [ %115, %60 ], [ %229, %117 ]
  %238 = bitcast <2 x i32> %236 to double
  %239 = fmul contract double %57, %238
  %240 = getelementptr inbounds double, double addrspace(1)* %1, i64 %41
  store double %239, double addrspace(1)* %240, align 8
  %241 = load double, double addrspace(1)* %56, align 8, !tbaa !16
  %242 = icmp eq i32 %233, 0
  %243 = select i1 %242, double %234, double %235
  %244 = bitcast double %243 to <2 x i32>
  %245 = bitcast double %55 to <2 x i32>
  %246 = extractelement <2 x i32> %245, i64 1
  %247 = xor i32 %232, %246
  %248 = and i32 %247, -2147483648
  %249 = extractelement <2 x i32> %244, i64 1
  %250 = xor i32 %249, %248
  %251 = insertelement <2 x i32> %244, i32 %250, i64 1
  %252 = select i1 %237, <2 x i32> %251, <2 x i32> <i32 0, i32 2146959360>
  %253 = bitcast <2 x i32> %252 to double
  %254 = fmul contract double %241, %253
  %255 = getelementptr inbounds double, double addrspace(1)* %2, i64 %41
  store double %254, double addrspace(1)* %255, align 8, !tbaa !16
  br label %256

256:                                              ; preds = %231, %11
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
