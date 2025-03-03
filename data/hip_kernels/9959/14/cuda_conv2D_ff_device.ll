; ModuleID = '../data/hip_kernels/9959/14/main.cu'
source_filename = "../data/hip_kernels/9959/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14cuda_conv2D_ffPdS_PKdS1_S1_mmmmmmmmmm(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %16, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = sext i32 %24 to i64
  %26 = freeze i64 %25
  %27 = freeze i64 %9
  %28 = udiv i64 %26, %27
  %29 = mul i64 %28, %27
  %30 = sub i64 %26, %29
  %31 = shl i64 %28, 32
  %32 = ashr exact i64 %31, 32
  %33 = freeze i64 %32
  %34 = freeze i64 %8
  %35 = udiv i64 %33, %34
  %36 = mul i64 %35, %34
  %37 = sub i64 %33, %36
  %38 = shl i64 %35, 32
  %39 = ashr exact i64 %38, 32
  %40 = icmp ult i64 %39, %5
  br i1 %40, label %41, label %312

41:                                               ; preds = %15
  %42 = mul i64 %39, %8
  %43 = mul i64 %37, %14
  %44 = sub i64 %43, %13
  %45 = mul i64 %39, %12
  %46 = add i64 %42, %37
  %47 = mul i64 %46, %9
  %48 = add i64 %47, %30
  %49 = mul i64 %30, %14
  %50 = sub i64 %49, %13
  %51 = getelementptr inbounds double, double addrspace(1)* %4, i64 %39
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7, !amdgpu.noclobber !5
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  store double %52, double addrspace(1)* %53, align 8, !tbaa !7
  %54 = icmp eq i64 %12, 0
  br i1 %54, label %63, label %55

55:                                               ; preds = %41
  %56 = icmp eq i64 %6, 0
  %57 = icmp eq i64 %7, 0
  %58 = trunc i64 %10 to i32
  %59 = and i64 %7, 1
  %60 = icmp eq i64 %7, 1
  %61 = and i64 %7, -2
  %62 = icmp eq i64 %59, 0
  br label %216

63:                                               ; preds = %223, %41
  %64 = phi double [ %52, %41 ], [ %224, %223 ]
  %65 = tail call double @llvm.fabs.f64(double %64)
  %66 = fmul double %65, 0x3FF71547652B82FE
  %67 = tail call double @llvm.rint.f64(double %66)
  %68 = tail call double @llvm.fma.f64(double %67, double 0xBFE62E42FEFA3000, double %65)
  %69 = fadd double %68, 0.000000e+00
  %70 = fsub double %68, %69
  %71 = fadd double %70, 0.000000e+00
  %72 = fmul double %67, 0x3D53DE6AF278E000
  %73 = fsub double %69, %72
  %74 = fsub double %69, %73
  %75 = fsub double %74, %72
  %76 = fadd double %71, %75
  %77 = fadd double %73, %76
  %78 = fsub double %77, %73
  %79 = fsub double %76, %78
  %80 = fmul double %67, 0x3AC9CC01F97B57A0
  %81 = fsub double %77, %80
  %82 = fsub double %77, %81
  %83 = fsub double %82, %80
  %84 = fadd double %79, %83
  %85 = fadd double %81, %84
  %86 = fsub double %85, %81
  %87 = fsub double %84, %86
  %88 = tail call double @llvm.fma.f64(double %85, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %89 = tail call double @llvm.fma.f64(double %85, double %88, double 0x3EC71DEE623FDE64)
  %90 = tail call double @llvm.fma.f64(double %85, double %89, double 0x3EFA01997C89E6B0)
  %91 = tail call double @llvm.fma.f64(double %85, double %90, double 0x3F2A01A014761F6E)
  %92 = tail call double @llvm.fma.f64(double %85, double %91, double 0x3F56C16C1852B7B0)
  %93 = tail call double @llvm.fma.f64(double %85, double %92, double 0x3F81111111122322)
  %94 = tail call double @llvm.fma.f64(double %85, double %93, double 0x3FA55555555502A1)
  %95 = tail call double @llvm.fma.f64(double %85, double %94, double 0x3FC5555555555511)
  %96 = tail call double @llvm.fma.f64(double %85, double %95, double 0x3FE000000000000B)
  %97 = fmul double %85, %85
  %98 = fneg double %97
  %99 = tail call double @llvm.fma.f64(double %85, double %85, double %98)
  %100 = fmul double %87, 2.000000e+00
  %101 = tail call double @llvm.fma.f64(double %85, double %100, double %99)
  %102 = fadd double %97, %101
  %103 = fsub double %102, %97
  %104 = fsub double %101, %103
  %105 = fmul double %102, %96
  %106 = fneg double %105
  %107 = tail call double @llvm.fma.f64(double %102, double %96, double %106)
  %108 = tail call double @llvm.fma.f64(double %104, double %96, double %107)
  %109 = fadd double %105, %108
  %110 = fsub double %109, %105
  %111 = fsub double %108, %110
  %112 = fadd double %85, %109
  %113 = fsub double %112, %85
  %114 = fsub double %109, %113
  %115 = fadd double %87, %111
  %116 = fadd double %115, %114
  %117 = fadd double %112, %116
  %118 = fsub double %117, %112
  %119 = fsub double %116, %118
  %120 = fadd double %117, 1.000000e+00
  %121 = fadd double %120, -1.000000e+00
  %122 = fsub double %117, %121
  %123 = fadd double %119, %122
  %124 = fadd double %120, %123
  %125 = fsub double %124, %120
  %126 = fsub double %123, %125
  %127 = fptosi double %67 to i32
  %128 = tail call double @llvm.amdgcn.ldexp.f64(double %124, i32 %127)
  %129 = tail call double @llvm.amdgcn.ldexp.f64(double %126, i32 %127)
  %130 = tail call double @llvm.amdgcn.rcp.f64(double %128)
  %131 = fneg double %128
  %132 = tail call double @llvm.fma.f64(double %131, double %130, double 1.000000e+00)
  %133 = tail call double @llvm.fma.f64(double %132, double %130, double %130)
  %134 = tail call double @llvm.fma.f64(double %131, double %133, double 1.000000e+00)
  %135 = tail call double @llvm.fma.f64(double %134, double %133, double %133)
  %136 = fmul double %128, %135
  %137 = fneg double %136
  %138 = tail call double @llvm.fma.f64(double %135, double %128, double %137)
  %139 = tail call double @llvm.fma.f64(double %135, double %129, double %138)
  %140 = fadd double %136, %139
  %141 = fsub double %140, %136
  %142 = fsub double %139, %141
  %143 = fsub double 1.000000e+00, %140
  %144 = fsub double 1.000000e+00, %143
  %145 = fsub double %144, %140
  %146 = fsub double %145, %142
  %147 = fadd double %143, %146
  %148 = fsub double %147, %143
  %149 = fsub double %146, %148
  %150 = fmul double %135, %147
  %151 = fmul double %128, %150
  %152 = fneg double %151
  %153 = tail call double @llvm.fma.f64(double %150, double %128, double %152)
  %154 = tail call double @llvm.fma.f64(double %150, double %129, double %153)
  %155 = fadd double %151, %154
  %156 = fsub double %155, %151
  %157 = fsub double %154, %156
  %158 = fsub double %147, %155
  %159 = fsub double %147, %158
  %160 = fsub double %159, %155
  %161 = fadd double %149, %160
  %162 = fsub double %161, %157
  %163 = fadd double %158, %162
  %164 = fmul double %135, %163
  %165 = fadd double %135, %150
  %166 = fsub double %165, %135
  %167 = fsub double %150, %166
  %168 = fadd double %167, %164
  %169 = fadd double %165, %168
  %170 = fsub double %169, %165
  %171 = fsub double %168, %170
  %172 = fsub double %128, %169
  %173 = fsub double %128, %172
  %174 = fsub double %173, %169
  %175 = fadd double %129, %174
  %176 = fsub double %175, %171
  %177 = fadd double %172, %176
  %178 = fsub double %177, %172
  %179 = fsub double %176, %178
  %180 = fadd double %128, %169
  %181 = fsub double %180, %128
  %182 = fsub double %169, %181
  %183 = fadd double %129, %171
  %184 = fadd double %183, %182
  %185 = fadd double %180, %184
  %186 = fsub double %185, %180
  %187 = fsub double %184, %186
  %188 = tail call double @llvm.amdgcn.rcp.f64(double %185)
  %189 = fneg double %185
  %190 = tail call double @llvm.fma.f64(double %189, double %188, double 1.000000e+00)
  %191 = tail call double @llvm.fma.f64(double %190, double %188, double %188)
  %192 = tail call double @llvm.fma.f64(double %189, double %191, double 1.000000e+00)
  %193 = tail call double @llvm.fma.f64(double %192, double %191, double %191)
  %194 = fmul double %177, %193
  %195 = fmul double %185, %194
  %196 = fneg double %195
  %197 = tail call double @llvm.fma.f64(double %194, double %185, double %196)
  %198 = tail call double @llvm.fma.f64(double %194, double %187, double %197)
  %199 = fadd double %195, %198
  %200 = fsub double %199, %195
  %201 = fsub double %198, %200
  %202 = fsub double %177, %199
  %203 = fsub double %177, %202
  %204 = fsub double %203, %199
  %205 = fsub double %204, %201
  %206 = fadd double %179, %205
  %207 = fadd double %202, %206
  %208 = fmul double %193, %207
  %209 = fadd double %194, %208
  %210 = fcmp ogt double %65, 1.906250e+01
  %211 = select i1 %210, double 1.000000e+00, double %209
  %212 = fcmp olt double %65, 0x3E40000000000000
  %213 = select i1 %212, double %65, double %211
  %214 = tail call double @llvm.copysign.f64(double %213, double %64)
  %215 = getelementptr inbounds double, double addrspace(1)* %0, i64 %48
  store double %214, double addrspace(1)* %215, align 8, !tbaa !7
  br label %312

216:                                              ; preds = %55, %223
  %217 = phi double [ %52, %55 ], [ %224, %223 ]
  %218 = phi i64 [ 0, %55 ], [ %225, %223 ]
  %219 = mul i64 %218, %10
  br i1 %56, label %223, label %220

220:                                              ; preds = %216
  %221 = add i64 %218, %45
  %222 = mul i64 %221, %6
  br label %227

223:                                              ; preds = %262, %216
  %224 = phi double [ %217, %216 ], [ %263, %262 ]
  %225 = add nuw i64 %218, 1
  %226 = icmp eq i64 %225, %12
  br i1 %226, label %63, label %216, !llvm.loop !11

227:                                              ; preds = %220, %262
  %228 = phi double [ %217, %220 ], [ %263, %262 ]
  %229 = phi i64 [ 0, %220 ], [ %264, %262 ]
  %230 = add i64 %229, %44
  %231 = trunc i64 %230 to i32
  br i1 %57, label %262, label %232

232:                                              ; preds = %227
  %233 = icmp sgt i32 %231, -1
  %234 = icmp slt i32 %231, %58
  %235 = and i64 %230, 4294967295
  %236 = add i64 %235, %219
  %237 = mul i64 %236, %11
  %238 = add i64 %229, %222
  %239 = mul i64 %238, %7
  br i1 %60, label %240, label %266

240:                                              ; preds = %307, %232
  %241 = phi double [ undef, %232 ], [ %308, %307 ]
  %242 = phi double [ %228, %232 ], [ %308, %307 ]
  %243 = phi i64 [ 0, %232 ], [ %309, %307 ]
  br i1 %62, label %262, label %244

244:                                              ; preds = %240
  %245 = add i64 %243, %50
  %246 = trunc i64 %245 to i32
  br i1 %233, label %247, label %262

247:                                              ; preds = %244
  %248 = icmp sgt i32 %246, -1
  %249 = select i1 %234, i1 %248, i1 false
  %250 = icmp slt i32 %246, %58
  %251 = select i1 %249, i1 %250, i1 false
  br i1 %251, label %252, label %262

252:                                              ; preds = %247
  %253 = and i64 %245, 4294967295
  %254 = add i64 %253, %237
  %255 = add i64 %243, %239
  %256 = getelementptr inbounds double, double addrspace(1)* %3, i64 %255
  %257 = load double, double addrspace(1)* %256, align 8, !tbaa !7
  %258 = getelementptr inbounds double, double addrspace(1)* %2, i64 %254
  %259 = load double, double addrspace(1)* %258, align 8, !tbaa !7
  %260 = fmul contract double %257, %259
  %261 = fadd contract double %242, %260
  store double %261, double addrspace(1)* %53, align 8, !tbaa !7
  br label %262

262:                                              ; preds = %240, %252, %247, %244, %227
  %263 = phi double [ %228, %227 ], [ %241, %240 ], [ %261, %252 ], [ %242, %247 ], [ %242, %244 ]
  %264 = add nuw i64 %229, 1
  %265 = icmp eq i64 %264, %6
  br i1 %265, label %223, label %227, !llvm.loop !13

266:                                              ; preds = %232, %307
  %267 = phi double [ %308, %307 ], [ %228, %232 ]
  %268 = phi i64 [ %309, %307 ], [ 0, %232 ]
  %269 = phi i64 [ %310, %307 ], [ 0, %232 ]
  %270 = add i64 %268, %50
  %271 = trunc i64 %270 to i32
  br i1 %233, label %272, label %287

272:                                              ; preds = %266
  %273 = icmp sgt i32 %271, -1
  %274 = select i1 %234, i1 %273, i1 false
  %275 = icmp slt i32 %271, %58
  %276 = select i1 %274, i1 %275, i1 false
  br i1 %276, label %277, label %287

277:                                              ; preds = %272
  %278 = and i64 %270, 4294967295
  %279 = add i64 %278, %237
  %280 = add i64 %268, %239
  %281 = getelementptr inbounds double, double addrspace(1)* %3, i64 %280
  %282 = load double, double addrspace(1)* %281, align 8, !tbaa !7
  %283 = getelementptr inbounds double, double addrspace(1)* %2, i64 %279
  %284 = load double, double addrspace(1)* %283, align 8, !tbaa !7
  %285 = fmul contract double %282, %284
  %286 = fadd contract double %267, %285
  store double %286, double addrspace(1)* %53, align 8, !tbaa !7
  br label %287

287:                                              ; preds = %277, %272, %266
  %288 = phi double [ %286, %277 ], [ %267, %272 ], [ %267, %266 ]
  %289 = or i64 %268, 1
  %290 = add i64 %289, %50
  %291 = trunc i64 %290 to i32
  br i1 %233, label %292, label %307

292:                                              ; preds = %287
  %293 = icmp sgt i32 %291, -1
  %294 = select i1 %234, i1 %293, i1 false
  %295 = icmp slt i32 %291, %58
  %296 = select i1 %294, i1 %295, i1 false
  br i1 %296, label %297, label %307

297:                                              ; preds = %292
  %298 = and i64 %290, 4294967295
  %299 = add i64 %298, %237
  %300 = add i64 %289, %239
  %301 = getelementptr inbounds double, double addrspace(1)* %3, i64 %300
  %302 = load double, double addrspace(1)* %301, align 8, !tbaa !7
  %303 = getelementptr inbounds double, double addrspace(1)* %2, i64 %299
  %304 = load double, double addrspace(1)* %303, align 8, !tbaa !7
  %305 = fmul contract double %302, %304
  %306 = fadd contract double %288, %305
  store double %306, double addrspace(1)* %53, align 8, !tbaa !7
  br label %307

307:                                              ; preds = %297, %292, %287
  %308 = phi double [ %306, %297 ], [ %288, %292 ], [ %288, %287 ]
  %309 = add nuw i64 %268, 2
  %310 = add i64 %269, 2
  %311 = icmp eq i64 %310, %61
  br i1 %311, label %240, label %266, !llvm.loop !14

312:                                              ; preds = %15, %63
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
