; ModuleID = '../data/hip_kernels/16034/92/main.cu'
source_filename = "../data/hip_kernels/16034/92/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_computePSF_phaseNMany(i32 %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture writeonly %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !7
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %16, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = mul i32 %25, %29
  %31 = add i32 %30, %24
  %32 = udiv i32 %23, %20
  %33 = mul i32 %32, %20
  %34 = icmp ugt i32 %23, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = mul i32 %36, %31
  %38 = add i32 %37, %15
  %39 = mul i32 %38, %20
  %40 = add i32 %39, %14
  %41 = icmp slt i32 %40, %0
  br i1 %41, label %42, label %290

42:                                               ; preds = %13
  %43 = freeze i32 %40
  %44 = freeze i32 %1
  %45 = sdiv i32 %43, %44
  %46 = mul i32 %45, %44
  %47 = sub i32 %43, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %3, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !16, !amdgpu.noclobber !6
  %51 = sext i32 %45 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %8, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !16, !amdgpu.noclobber !6
  %54 = fmul contract double %50, %53
  %55 = getelementptr inbounds double, double addrspace(1)* %4, i64 %48
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !16, !amdgpu.noclobber !6
  %57 = add nsw i32 %45, %12
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %8, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !16, !amdgpu.noclobber !6
  %61 = fmul contract double %56, %60
  %62 = fadd contract double %54, %61
  %63 = getelementptr inbounds double, double addrspace(1)* %5, i64 %48
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !16, !amdgpu.noclobber !6
  %65 = shl nsw i32 %12, 1
  %66 = add nsw i32 %45, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %8, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !16, !amdgpu.noclobber !6
  %70 = fmul contract double %64, %69
  %71 = fadd contract double %62, %70
  %72 = getelementptr inbounds double, double addrspace(1)* %7, i64 %48
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !16, !amdgpu.noclobber !6
  %74 = fadd contract double %73, %71
  %75 = getelementptr inbounds double, double addrspace(1)* %6, i64 %48
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !16, !amdgpu.noclobber !6
  %77 = tail call double @llvm.fabs.f64(double %74)
  %78 = fcmp olt double %77, 0x41D0000000000000
  br i1 %78, label %79, label %140

79:                                               ; preds = %42
  %80 = fmul double %77, 0x3FE45F306DC9C883
  %81 = tail call double @llvm.rint.f64(double %80)
  %82 = tail call double @llvm.fma.f64(double %81, double 0xBFF921FB54442D18, double %77)
  %83 = tail call double @llvm.fma.f64(double %81, double 0xBC91A62633145C00, double %82)
  %84 = fmul double %81, 0x3C91A62633145C00
  %85 = fneg double %84
  %86 = tail call double @llvm.fma.f64(double %81, double 0x3C91A62633145C00, double %85)
  %87 = fsub double %82, %84
  %88 = fsub double %82, %87
  %89 = fsub double %88, %84
  %90 = fsub double %87, %83
  %91 = fadd double %90, %89
  %92 = fsub double %91, %86
  %93 = tail call double @llvm.fma.f64(double %81, double 0xB97B839A252049C0, double %92)
  %94 = fadd double %83, %93
  %95 = fsub double %94, %83
  %96 = fsub double %93, %95
  %97 = fptosi double %81 to i32
  %98 = fmul double %94, %94
  %99 = fmul double %98, 5.000000e-01
  %100 = fsub double 1.000000e+00, %99
  %101 = fsub double 1.000000e+00, %100
  %102 = fsub double %101, %99
  %103 = fmul double %98, %98
  %104 = tail call double @llvm.fma.f64(double %98, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %105 = tail call double @llvm.fma.f64(double %98, double %104, double 0xBE927E4FA17F65F6)
  %106 = tail call double @llvm.fma.f64(double %98, double %105, double 0x3EFA01A019F4EC90)
  %107 = tail call double @llvm.fma.f64(double %98, double %106, double 0xBF56C16C16C16967)
  %108 = tail call double @llvm.fma.f64(double %98, double %107, double 0x3FA5555555555555)
  %109 = fneg double %96
  %110 = tail call double @llvm.fma.f64(double %94, double %109, double %102)
  %111 = tail call double @llvm.fma.f64(double %103, double %108, double %110)
  %112 = fadd double %100, %111
  %113 = tail call double @llvm.fma.f64(double %98, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %114 = tail call double @llvm.fma.f64(double %98, double %113, double 0x3EC71DE3796CDE01)
  %115 = tail call double @llvm.fma.f64(double %98, double %114, double 0xBF2A01A019E83E5C)
  %116 = tail call double @llvm.fma.f64(double %98, double %115, double 0x3F81111111110BB3)
  %117 = fneg double %98
  %118 = fmul double %94, %117
  %119 = fmul double %96, 5.000000e-01
  %120 = tail call double @llvm.fma.f64(double %118, double %116, double %119)
  %121 = tail call double @llvm.fma.f64(double %98, double %120, double %109)
  %122 = tail call double @llvm.fma.f64(double %118, double 0xBFC5555555555555, double %121)
  %123 = fsub double %94, %122
  %124 = fneg double %123
  %125 = and i32 %97, 1
  %126 = icmp eq i32 %125, 0
  %127 = select i1 %126, double %112, double %124
  %128 = bitcast double %127 to <2 x i32>
  %129 = shl i32 %97, 30
  %130 = and i32 %129, -2147483648
  %131 = extractelement <2 x i32> %128, i64 1
  %132 = xor i32 %131, %130
  %133 = insertelement <2 x i32> %128, i32 %132, i64 1
  %134 = tail call i1 @llvm.amdgcn.class.f64(double %77, i32 504)
  %135 = select i1 %134, <2 x i32> %133, <2 x i32> <i32 0, i32 2146959360>
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %48
  %137 = load i32, i32 addrspace(1)* %136, align 4, !tbaa !20, !amdgpu.noclobber !6
  %138 = mul nsw i32 %45, %2
  %139 = add nsw i32 %137, %138
  br label %258

140:                                              ; preds = %42
  %141 = tail call double @llvm.amdgcn.trig.preop.f64(double %77, i32 0)
  %142 = tail call double @llvm.amdgcn.trig.preop.f64(double %77, i32 1)
  %143 = tail call double @llvm.amdgcn.trig.preop.f64(double %77, i32 2)
  %144 = fcmp oge double %77, 0x7B00000000000000
  %145 = tail call double @llvm.amdgcn.ldexp.f64(double %77, i32 -128)
  %146 = select i1 %144, double %145, double %77
  %147 = fmul double %143, %146
  %148 = fneg double %147
  %149 = tail call double @llvm.fma.f64(double %143, double %146, double %148)
  %150 = fmul double %142, %146
  %151 = fneg double %150
  %152 = tail call double @llvm.fma.f64(double %142, double %146, double %151)
  %153 = fmul double %141, %146
  %154 = fneg double %153
  %155 = tail call double @llvm.fma.f64(double %141, double %146, double %154)
  %156 = fadd double %150, %155
  %157 = fsub double %156, %150
  %158 = fsub double %156, %157
  %159 = fsub double %155, %157
  %160 = fsub double %150, %158
  %161 = fadd double %159, %160
  %162 = fadd double %147, %152
  %163 = fsub double %162, %147
  %164 = fsub double %162, %163
  %165 = fsub double %152, %163
  %166 = fsub double %147, %164
  %167 = fadd double %165, %166
  %168 = fadd double %162, %161
  %169 = fsub double %168, %162
  %170 = fsub double %168, %169
  %171 = fsub double %161, %169
  %172 = fsub double %162, %170
  %173 = fadd double %171, %172
  %174 = fadd double %167, %173
  %175 = fadd double %149, %174
  %176 = fadd double %153, %156
  %177 = fsub double %176, %153
  %178 = fsub double %156, %177
  %179 = fadd double %178, %168
  %180 = fsub double %179, %178
  %181 = fsub double %168, %180
  %182 = fadd double %181, %175
  %183 = tail call double @llvm.amdgcn.ldexp.f64(double %176, i32 -2)
  %184 = tail call double @llvm.amdgcn.fract.f64(double %183)
  %185 = tail call i1 @llvm.amdgcn.class.f64(double %183, i32 516)
  %186 = select i1 %185, double 0.000000e+00, double %184
  %187 = tail call double @llvm.amdgcn.ldexp.f64(double %186, i32 2)
  %188 = fadd double %187, %179
  %189 = fcmp olt double %188, 0.000000e+00
  %190 = select i1 %189, double 4.000000e+00, double 0.000000e+00
  %191 = fadd double %187, %190
  %192 = fadd double %179, %191
  %193 = fptosi double %192 to i32
  %194 = sitofp i32 %193 to double
  %195 = fsub double %191, %194
  %196 = fadd double %179, %195
  %197 = fsub double %196, %195
  %198 = fsub double %179, %197
  %199 = fadd double %182, %198
  %200 = fcmp oge double %196, 5.000000e-01
  %201 = zext i1 %200 to i32
  %202 = add nsw i32 %201, %193
  %203 = select i1 %200, double 1.000000e+00, double 0.000000e+00
  %204 = fsub double %196, %203
  %205 = fadd double %204, %199
  %206 = fsub double %205, %204
  %207 = fsub double %199, %206
  %208 = fmul double %205, 0x3FF921FB54442D18
  %209 = fneg double %208
  %210 = tail call double @llvm.fma.f64(double %205, double 0x3FF921FB54442D18, double %209)
  %211 = tail call double @llvm.fma.f64(double %205, double 0x3C91A62633145C07, double %210)
  %212 = tail call double @llvm.fma.f64(double %207, double 0x3FF921FB54442D18, double %211)
  %213 = fadd double %208, %212
  %214 = fsub double %213, %208
  %215 = fsub double %212, %214
  %216 = fmul double %213, %213
  %217 = fmul double %216, 5.000000e-01
  %218 = fsub double 1.000000e+00, %217
  %219 = fsub double 1.000000e+00, %218
  %220 = fsub double %219, %217
  %221 = fmul double %216, %216
  %222 = tail call double @llvm.fma.f64(double %216, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %223 = tail call double @llvm.fma.f64(double %216, double %222, double 0xBE927E4FA17F65F6)
  %224 = tail call double @llvm.fma.f64(double %216, double %223, double 0x3EFA01A019F4EC90)
  %225 = tail call double @llvm.fma.f64(double %216, double %224, double 0xBF56C16C16C16967)
  %226 = tail call double @llvm.fma.f64(double %216, double %225, double 0x3FA5555555555555)
  %227 = fneg double %215
  %228 = tail call double @llvm.fma.f64(double %213, double %227, double %220)
  %229 = tail call double @llvm.fma.f64(double %221, double %226, double %228)
  %230 = fadd double %218, %229
  %231 = tail call double @llvm.fma.f64(double %216, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %232 = tail call double @llvm.fma.f64(double %216, double %231, double 0x3EC71DE3796CDE01)
  %233 = tail call double @llvm.fma.f64(double %216, double %232, double 0xBF2A01A019E83E5C)
  %234 = tail call double @llvm.fma.f64(double %216, double %233, double 0x3F81111111110BB3)
  %235 = fneg double %216
  %236 = fmul double %213, %235
  %237 = fmul double %215, 5.000000e-01
  %238 = tail call double @llvm.fma.f64(double %236, double %234, double %237)
  %239 = tail call double @llvm.fma.f64(double %216, double %238, double %227)
  %240 = tail call double @llvm.fma.f64(double %236, double 0xBFC5555555555555, double %239)
  %241 = fsub double %213, %240
  %242 = fneg double %241
  %243 = and i32 %202, 1
  %244 = icmp eq i32 %243, 0
  %245 = select i1 %244, double %230, double %242
  %246 = bitcast double %245 to <2 x i32>
  %247 = shl i32 %202, 30
  %248 = and i32 %247, -2147483648
  %249 = extractelement <2 x i32> %246, i64 1
  %250 = xor i32 %249, %248
  %251 = insertelement <2 x i32> %246, i32 %250, i64 1
  %252 = tail call i1 @llvm.amdgcn.class.f64(double %77, i32 504)
  %253 = select i1 %252, <2 x i32> %251, <2 x i32> <i32 0, i32 2146959360>
  %254 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %48
  %255 = load i32, i32 addrspace(1)* %254, align 4, !tbaa !20, !amdgpu.noclobber !6
  %256 = mul nsw i32 %45, %2
  %257 = add nsw i32 %255, %256
  br label %258

258:                                              ; preds = %79, %140
  %259 = phi i32 [ %139, %79 ], [ %257, %140 ]
  %260 = phi <2 x i32> [ %135, %79 ], [ %253, %140 ]
  %261 = phi i32 [ %129, %79 ], [ %247, %140 ]
  %262 = phi i32 [ %125, %79 ], [ %243, %140 ]
  %263 = phi double [ %123, %79 ], [ %241, %140 ]
  %264 = phi double [ %112, %79 ], [ %230, %140 ]
  %265 = phi i32 [ %138, %79 ], [ %256, %140 ]
  %266 = phi i1 [ %134, %79 ], [ %252, %140 ]
  %267 = bitcast <2 x i32> %260 to double
  %268 = fmul contract double %76, %267
  %269 = sext i32 %259 to i64
  %270 = getelementptr inbounds double, double addrspace(1)* %11, i64 %269
  store double %268, double addrspace(1)* %270, align 8, !tbaa !16
  %271 = load double, double addrspace(1)* %75, align 8, !tbaa !16
  %272 = icmp eq i32 %262, 0
  %273 = select i1 %272, double %263, double %264
  %274 = bitcast double %273 to <2 x i32>
  %275 = bitcast double %74 to <2 x i32>
  %276 = extractelement <2 x i32> %275, i64 1
  %277 = xor i32 %261, %276
  %278 = and i32 %277, -2147483648
  %279 = extractelement <2 x i32> %274, i64 1
  %280 = xor i32 %279, %278
  %281 = insertelement <2 x i32> %274, i32 %280, i64 1
  %282 = select i1 %266, <2 x i32> %281, <2 x i32> <i32 0, i32 2146959360>
  %283 = bitcast <2 x i32> %282 to double
  %284 = fmul contract double %271, %283
  %285 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %48
  %286 = load i32, i32 addrspace(1)* %285, align 4, !tbaa !20, !amdgpu.noclobber !6
  %287 = add nsw i32 %286, %265
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds double, double addrspace(1)* %11, i64 %288
  store double %284, double addrspace(1)* %289, align 8, !tbaa !16
  br label %290

290:                                              ; preds = %258, %13
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
