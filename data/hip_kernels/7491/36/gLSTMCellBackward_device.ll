; ModuleID = '../data/hip_kernels/7491/36/main.cu'
source_filename = "../data/hip_kernels/7491/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z17gLSTMCellBackwardPfS_S_S_PKfS1_S1_S1_S1_S1_mm(float addrspace(1)* %0, float addrspace(1)* %1, float addrspace(1)* %2, float addrspace(1)* %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* readonly %8, float addrspace(1)* nocapture readonly %9, i64 %10, i64 %11) local_unnamed_addr #0 {
  %13 = icmp eq i64 %10, 0
  br i1 %13, label %37, label %14

14:                                               ; preds = %12
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = icmp eq float addrspace(1)* %8, addrspacecast (float* null to float addrspace(1)*)
  %17 = icmp eq i64 %11, 0
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %19 = trunc i64 %11 to i32
  %20 = shl i32 %19, 1
  %21 = icmp eq float addrspace(1)* %0, addrspacecast (float* null to float addrspace(1)*)
  %22 = icmp eq float addrspace(1)* %1, addrspacecast (float* null to float addrspace(1)*)
  %23 = icmp eq float addrspace(1)* %2, addrspacecast (float* null to float addrspace(1)*)
  %24 = icmp eq float addrspace(1)* %3, addrspacecast (float* null to float addrspace(1)*)
  %25 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 12
  %29 = bitcast i8 addrspace(4)* %28 to i32 addrspace(4)*
  %30 = load i32, i32 addrspace(4)* %29, align 4, !tbaa !4
  %31 = load i16, i16 addrspace(4)* %27, align 4, !range !13, !invariant.load !14
  %32 = zext i16 %31 to i32
  %33 = udiv i32 %30, %32
  %34 = mul i32 %33, %32
  %35 = icmp ugt i32 %30, %34
  %36 = zext i1 %35 to i32
  br label %38

37:                                               ; preds = %277, %12
  ret void

38:                                               ; preds = %14, %277
  %39 = phi i32 [ 0, %14 ], [ %279, %277 ]
  %40 = add i32 %39, %15
  %41 = sext i32 %40 to i64
  %42 = icmp ult i64 %41, %10
  br i1 %42, label %43, label %277

43:                                               ; preds = %38
  br i1 %16, label %48, label %44

44:                                               ; preds = %43
  %45 = getelementptr inbounds float, float addrspace(1)* %8, i64 %41
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !15
  %47 = fcmp contract une float %46, 0.000000e+00
  br label %48

48:                                               ; preds = %44, %43
  %49 = phi i1 [ true, %43 ], [ %47, %44 ]
  %50 = uitofp i1 %49 to float
  %51 = mul i64 %41, %11
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = shl i64 %51, 2
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %56 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %57 = getelementptr inbounds float, float addrspace(1)* %5, i64 %53
  %58 = getelementptr inbounds float, float addrspace(1)* %6, i64 %53
  %59 = getelementptr inbounds float, float addrspace(1)* %9, i64 %51
  br i1 %17, label %277, label %60

60:                                               ; preds = %48, %273
  %61 = phi i32 [ %274, %273 ], [ 0, %48 ]
  %62 = add i32 %61, %18
  %63 = sext i32 %62 to i64
  %64 = icmp ult i64 %63, %11
  br i1 %64, label %65, label %273

65:                                               ; preds = %60
  %66 = getelementptr inbounds float, float addrspace(1)* %57, i64 %63
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !15
  %68 = getelementptr inbounds float, float addrspace(1)* %58, i64 %63
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !15
  %70 = fadd contract float %67, %69
  %71 = getelementptr inbounds float, float addrspace(1)* %7, i64 %63
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !15
  %73 = fadd contract float %70, %72
  %74 = fcmp contract ult float %73, 0.000000e+00
  br i1 %74, label %92, label %75

75:                                               ; preds = %65
  %76 = fneg contract float %73
  %77 = fmul float %73, 0xBFF7154760000000
  %78 = tail call float @llvm.rint.f32(float %77)
  %79 = fcmp olt float %73, 0xC0562E4300000000
  %80 = fcmp ogt float %73, 0x4059D1DA00000000
  %81 = fneg float %77
  %82 = tail call float @llvm.fma.f32(float %76, float 0x3FF7154760000000, float %81)
  %83 = tail call float @llvm.fma.f32(float %76, float 0x3E54AE0BE0000000, float %82)
  %84 = fsub float %77, %78
  %85 = fadd float %83, %84
  %86 = tail call float @llvm.exp2.f32(float %85)
  %87 = fptosi float %78 to i32
  %88 = tail call float @llvm.amdgcn.ldexp.f32(float %86, i32 %87)
  %89 = select i1 %80, float 0.000000e+00, float %88
  %90 = select i1 %79, float 0x7FF0000000000000, float %89
  %91 = fpext float %90 to double
  br label %108

92:                                               ; preds = %65
  %93 = fmul float %73, 0x3FF7154760000000
  %94 = tail call float @llvm.rint.f32(float %93)
  %95 = fcmp ogt float %73, 0x40562E4300000000
  %96 = fcmp olt float %73, 0xC059D1DA00000000
  %97 = fneg float %93
  %98 = tail call float @llvm.fma.f32(float %73, float 0x3FF7154760000000, float %97)
  %99 = tail call float @llvm.fma.f32(float %73, float 0x3E54AE0BE0000000, float %98)
  %100 = fsub float %93, %94
  %101 = fadd float %99, %100
  %102 = tail call float @llvm.exp2.f32(float %101)
  %103 = fptosi float %94 to i32
  %104 = tail call float @llvm.amdgcn.ldexp.f32(float %102, i32 %103)
  %105 = select i1 %96, float 0.000000e+00, float %104
  %106 = select i1 %95, float 0x7FF0000000000000, float %105
  %107 = fpext float %106 to double
  br label %108

108:                                              ; preds = %75, %92
  %109 = phi double [ %107, %92 ], [ %91, %75 ]
  %110 = phi double [ %107, %92 ], [ 1.000000e+00, %75 ]
  %111 = fadd contract double %109, 1.000000e+00
  %112 = fdiv contract double %110, %111
  %113 = fptrunc double %112 to float
  %114 = add i32 %62, %19
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %57, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !15
  %118 = getelementptr inbounds float, float addrspace(1)* %58, i64 %115
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !15
  %120 = fadd contract float %117, %119
  %121 = getelementptr inbounds float, float addrspace(1)* %7, i64 %115
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !15
  %123 = fadd contract float %120, %122
  %124 = fcmp contract ult float %123, 0.000000e+00
  br i1 %124, label %142, label %125

125:                                              ; preds = %108
  %126 = fneg contract float %123
  %127 = fmul float %123, 0xBFF7154760000000
  %128 = tail call float @llvm.rint.f32(float %127)
  %129 = fcmp olt float %123, 0xC0562E4300000000
  %130 = fcmp ogt float %123, 0x4059D1DA00000000
  %131 = fneg float %127
  %132 = tail call float @llvm.fma.f32(float %126, float 0x3FF7154760000000, float %131)
  %133 = tail call float @llvm.fma.f32(float %126, float 0x3E54AE0BE0000000, float %132)
  %134 = fsub float %127, %128
  %135 = fadd float %133, %134
  %136 = tail call float @llvm.exp2.f32(float %135)
  %137 = fptosi float %128 to i32
  %138 = tail call float @llvm.amdgcn.ldexp.f32(float %136, i32 %137)
  %139 = select i1 %130, float 0.000000e+00, float %138
  %140 = select i1 %129, float 0x7FF0000000000000, float %139
  %141 = fpext float %140 to double
  br label %158

142:                                              ; preds = %108
  %143 = fmul float %123, 0x3FF7154760000000
  %144 = tail call float @llvm.rint.f32(float %143)
  %145 = fcmp ogt float %123, 0x40562E4300000000
  %146 = fcmp olt float %123, 0xC059D1DA00000000
  %147 = fneg float %143
  %148 = tail call float @llvm.fma.f32(float %123, float 0x3FF7154760000000, float %147)
  %149 = tail call float @llvm.fma.f32(float %123, float 0x3E54AE0BE0000000, float %148)
  %150 = fsub float %143, %144
  %151 = fadd float %149, %150
  %152 = tail call float @llvm.exp2.f32(float %151)
  %153 = fptosi float %144 to i32
  %154 = tail call float @llvm.amdgcn.ldexp.f32(float %152, i32 %153)
  %155 = select i1 %146, float 0.000000e+00, float %154
  %156 = select i1 %145, float 0x7FF0000000000000, float %155
  %157 = fpext float %156 to double
  br label %158

158:                                              ; preds = %125, %142
  %159 = phi double [ %157, %142 ], [ %141, %125 ]
  %160 = phi double [ %157, %142 ], [ 1.000000e+00, %125 ]
  %161 = fadd contract double %159, 1.000000e+00
  %162 = fdiv contract double %160, %161
  %163 = fptrunc double %162 to float
  %164 = add i32 %62, %20
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %57, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !15
  %168 = getelementptr inbounds float, float addrspace(1)* %58, i64 %165
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !15
  %170 = fadd contract float %167, %169
  %171 = getelementptr inbounds float, float addrspace(1)* %7, i64 %165
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !15
  %173 = fadd contract float %170, %172
  %174 = tail call float @llvm.fabs.f32(float %173)
  %175 = fcmp olt float %174, 6.250000e-01
  br i1 %175, label %176, label %184

176:                                              ; preds = %158
  %177 = fmul float %173, %173
  %178 = tail call float @llvm.fmuladd.f32(float %177, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %179 = tail call float @llvm.fmuladd.f32(float %177, float %178, float 0xBFAB8389C0000000)
  %180 = tail call float @llvm.fmuladd.f32(float %177, float %179, float 0x3FC1107040000000)
  %181 = tail call float @llvm.fmuladd.f32(float %177, float %180, float 0xBFD5555320000000)
  %182 = fmul float %174, %181
  %183 = tail call float @llvm.fmuladd.f32(float %177, float %182, float %174)
  br label %201

184:                                              ; preds = %158
  %185 = fmul float %174, 2.000000e+00
  %186 = fmul float %185, 0x3FF7154760000000
  %187 = tail call float @llvm.rint.f32(float %186)
  %188 = fcmp ogt float %185, 0x40562E4300000000
  %189 = fneg float %186
  %190 = tail call float @llvm.fma.f32(float %185, float 0x3FF7154760000000, float %189)
  %191 = tail call float @llvm.fma.f32(float %185, float 0x3E54AE0BE0000000, float %190)
  %192 = fsub float %186, %187
  %193 = fadd float %191, %192
  %194 = tail call float @llvm.exp2.f32(float %193)
  %195 = fptosi float %187 to i32
  %196 = tail call float @llvm.amdgcn.ldexp.f32(float %194, i32 %195)
  %197 = fadd float %196, 1.000000e+00
  %198 = select i1 %188, float 0x7FF0000000000000, float %197
  %199 = tail call float @llvm.amdgcn.rcp.f32(float %198)
  %200 = tail call float @llvm.fmuladd.f32(float %199, float -2.000000e+00, float 1.000000e+00)
  br label %201

201:                                              ; preds = %176, %184
  %202 = phi float [ %183, %176 ], [ %200, %184 ]
  %203 = tail call float @llvm.copysign.f32(float %202, float %173)
  %204 = getelementptr inbounds float, float addrspace(1)* %59, i64 %63
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !15
  br i1 %21, label %214, label %206

206:                                              ; preds = %201
  %207 = fmul contract float %50, %113
  %208 = fsub contract float %207, %50
  %209 = fadd contract float %208, 1.000000e+00
  %210 = fmul contract float %209, %205
  %211 = getelementptr inbounds float, float addrspace(1)* %52, i64 %63
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !15
  %213 = fadd contract float %210, %212
  store float %213, float addrspace(1)* %211, align 4, !tbaa !15
  br label %214

214:                                              ; preds = %206, %201
  %215 = getelementptr inbounds float, float addrspace(1)* %56, i64 %63
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !15
  %217 = fmul contract float %216, %50
  %218 = fmul contract float %217, %113
  %219 = fsub contract float 1.000000e+00, %113
  %220 = fmul contract float %219, %218
  %221 = fmul contract float %205, %220
  br i1 %22, label %226, label %222

222:                                              ; preds = %214
  %223 = getelementptr inbounds float, float addrspace(1)* %54, i64 %63
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !15
  %225 = fadd contract float %221, %224
  store float %225, float addrspace(1)* %223, align 4, !tbaa !15
  br label %226

226:                                              ; preds = %222, %214
  br i1 %23, label %231, label %227

227:                                              ; preds = %226
  %228 = getelementptr inbounds float, float addrspace(1)* %55, i64 %63
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !15
  %230 = fadd contract float %221, %229
  store float %230, float addrspace(1)* %228, align 4, !tbaa !15
  br label %231

231:                                              ; preds = %227, %226
  br i1 %24, label %235, label %232

232:                                              ; preds = %231
  %233 = getelementptr inbounds float, float addrspace(1)* %3, i64 %63
  %234 = atomicrmw fadd float addrspace(1)* %233, float %221 syncscope("agent-one-as") monotonic, align 4
  br label %235

235:                                              ; preds = %232, %231
  %236 = fmul contract float %203, %50
  %237 = fmul contract float %236, %163
  %238 = fsub contract float 1.000000e+00, %163
  %239 = fmul contract float %238, %237
  %240 = fmul contract float %205, %239
  br i1 %22, label %245, label %241

241:                                              ; preds = %235
  %242 = getelementptr inbounds float, float addrspace(1)* %54, i64 %115
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !15
  %244 = fadd contract float %240, %243
  store float %244, float addrspace(1)* %242, align 4, !tbaa !15
  br label %245

245:                                              ; preds = %241, %235
  br i1 %23, label %250, label %246

246:                                              ; preds = %245
  %247 = getelementptr inbounds float, float addrspace(1)* %55, i64 %115
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !15
  %249 = fadd contract float %240, %248
  store float %249, float addrspace(1)* %247, align 4, !tbaa !15
  br label %250

250:                                              ; preds = %246, %245
  br i1 %24, label %254, label %251

251:                                              ; preds = %250
  %252 = getelementptr inbounds float, float addrspace(1)* %3, i64 %115
  %253 = atomicrmw fadd float addrspace(1)* %252, float %240 syncscope("agent-one-as") monotonic, align 4
  br label %254

254:                                              ; preds = %251, %250
  %255 = fmul contract float %50, %163
  %256 = fmul contract float %203, %203
  %257 = fsub contract float 1.000000e+00, %256
  %258 = fmul contract float %255, %257
  %259 = fmul contract float %205, %258
  br i1 %22, label %264, label %260

260:                                              ; preds = %254
  %261 = getelementptr inbounds float, float addrspace(1)* %54, i64 %165
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !15
  %263 = fadd contract float %259, %262
  store float %263, float addrspace(1)* %261, align 4, !tbaa !15
  br label %264

264:                                              ; preds = %260, %254
  br i1 %23, label %269, label %265

265:                                              ; preds = %264
  %266 = getelementptr inbounds float, float addrspace(1)* %55, i64 %165
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !15
  %268 = fadd contract float %259, %267
  store float %268, float addrspace(1)* %266, align 4, !tbaa !15
  br label %269

269:                                              ; preds = %265, %264
  br i1 %24, label %273, label %270

270:                                              ; preds = %269
  %271 = getelementptr inbounds float, float addrspace(1)* %3, i64 %165
  %272 = atomicrmw fadd float addrspace(1)* %271, float %259 syncscope("agent-one-as") monotonic, align 4
  br label %273

273:                                              ; preds = %269, %270, %60
  %274 = add i32 %61, %32
  %275 = sext i32 %274 to i64
  %276 = icmp ult i64 %275, %11
  br i1 %276, label %60, label %277, !llvm.loop !19

277:                                              ; preds = %273, %48, %38
  %278 = add i32 %33, %39
  %279 = add i32 %278, %36
  %280 = sext i32 %279 to i64
  %281 = icmp ult i64 %280, %10
  br i1 %281, label %38, label %37, !llvm.loop !21
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
