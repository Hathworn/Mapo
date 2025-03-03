; ModuleID = '../data/hip_kernels/11047/6/main.cu'
source_filename = "../data/hip_kernels/11047/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12kernUpdatePimmPdS_E1A = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12kernUpdatePimmPdS_(i64 %0, i64 %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %5
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = add i32 %19, %20
  %22 = mul i32 %21, %13
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = sext i32 %24 to i64
  %26 = icmp ugt i64 %25, %1
  br i1 %26, label %306, label %27

27:                                               ; preds = %4
  %28 = getelementptr inbounds double, double addrspace(1)* %2, i64 %25
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !16, !amdgpu.noclobber !14
  %30 = mul i64 %25, %0
  %31 = getelementptr inbounds double, double addrspace(1)* %3, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !16, !amdgpu.noclobber !14
  %33 = tail call double @llvm.amdgcn.frexp.mant.f64(double %32)
  %34 = fcmp olt double %33, 0x3FE5555555555555
  %35 = zext i1 %34 to i32
  %36 = tail call double @llvm.amdgcn.ldexp.f64(double %33, i32 %35)
  %37 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %32)
  %38 = sub nsw i32 %37, %35
  %39 = fadd double %36, -1.000000e+00
  %40 = fadd double %36, 1.000000e+00
  %41 = fadd double %40, -1.000000e+00
  %42 = fsub double %36, %41
  %43 = tail call double @llvm.amdgcn.rcp.f64(double %40)
  %44 = fneg double %40
  %45 = tail call double @llvm.fma.f64(double %44, double %43, double 1.000000e+00)
  %46 = tail call double @llvm.fma.f64(double %45, double %43, double %43)
  %47 = tail call double @llvm.fma.f64(double %44, double %46, double 1.000000e+00)
  %48 = tail call double @llvm.fma.f64(double %47, double %46, double %46)
  %49 = fmul double %39, %48
  %50 = fmul double %40, %49
  %51 = fneg double %50
  %52 = tail call double @llvm.fma.f64(double %49, double %40, double %51)
  %53 = tail call double @llvm.fma.f64(double %49, double %42, double %52)
  %54 = fadd double %50, %53
  %55 = fsub double %54, %50
  %56 = fsub double %53, %55
  %57 = fsub double %39, %54
  %58 = fsub double %39, %57
  %59 = fsub double %58, %54
  %60 = fsub double %59, %56
  %61 = fadd double %57, %60
  %62 = fmul double %48, %61
  %63 = fadd double %49, %62
  %64 = fsub double %63, %49
  %65 = fsub double %62, %64
  %66 = fmul double %63, %63
  %67 = tail call double @llvm.fma.f64(double %66, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %68 = tail call double @llvm.fma.f64(double %66, double %67, double 0x3FC7474DD7F4DF2E)
  %69 = tail call double @llvm.fma.f64(double %66, double %68, double 0x3FCC71C016291751)
  %70 = tail call double @llvm.fma.f64(double %66, double %69, double 0x3FD249249B27ACF1)
  %71 = tail call double @llvm.fma.f64(double %66, double %70, double 0x3FD99999998EF7B6)
  %72 = tail call double @llvm.fma.f64(double %66, double %71, double 0x3FE5555555555780)
  %73 = tail call double @llvm.amdgcn.ldexp.f64(double %63, i32 1)
  %74 = tail call double @llvm.amdgcn.ldexp.f64(double %65, i32 1)
  %75 = fmul double %63, %66
  %76 = fmul double %75, %72
  %77 = fadd double %73, %76
  %78 = fsub double %77, %73
  %79 = fsub double %76, %78
  %80 = fadd double %74, %79
  %81 = fadd double %77, %80
  %82 = fsub double %81, %77
  %83 = fsub double %80, %82
  %84 = sitofp i32 %38 to double
  %85 = fmul double %84, 0x3FE62E42FEFA39EF
  %86 = fneg double %85
  %87 = tail call double @llvm.fma.f64(double %84, double 0x3FE62E42FEFA39EF, double %86)
  %88 = tail call double @llvm.fma.f64(double %84, double 0x3C7ABC9E3B39803F, double %87)
  %89 = fadd double %85, %88
  %90 = fsub double %89, %85
  %91 = fsub double %88, %90
  %92 = fadd double %89, %81
  %93 = fsub double %92, %89
  %94 = fsub double %92, %93
  %95 = fsub double %89, %94
  %96 = fsub double %81, %93
  %97 = fadd double %96, %95
  %98 = fadd double %91, %83
  %99 = fsub double %98, %91
  %100 = fsub double %98, %99
  %101 = fsub double %91, %100
  %102 = fsub double %83, %99
  %103 = fadd double %102, %101
  %104 = fadd double %98, %97
  %105 = fadd double %92, %104
  %106 = fsub double %105, %92
  %107 = fsub double %104, %106
  %108 = fadd double %103, %107
  %109 = fadd double %105, %108
  %110 = tail call double @llvm.fabs.f64(double %32) #4
  %111 = fcmp oeq double %110, 0x7FF0000000000000
  %112 = select i1 %111, double %32, double %109
  %113 = fcmp olt double %32, 0.000000e+00
  %114 = select i1 %113, double 0x7FF8000000000000, double %112
  %115 = fcmp oeq double %32, 0.000000e+00
  %116 = select i1 %115, double 0xFFF0000000000000, double %114
  %117 = fadd contract double %29, %116
  %118 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ12kernUpdatePimmPdS_E1A, i32 0, i32 %24
  store double %117, double addrspace(3)* %118, align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %119 = icmp eq i64 %1, 0
  br i1 %119, label %158, label %120

120:                                              ; preds = %27
  %121 = and i64 %1, 1
  %122 = icmp eq i64 %1, 1
  br i1 %122, label %127, label %123

123:                                              ; preds = %120
  %124 = and i64 %1, -2
  br label %246

125:                                              ; preds = %246
  %126 = trunc i64 %303 to i32
  br label %127

127:                                              ; preds = %125, %120
  %128 = phi double [ undef, %120 ], [ %302, %125 ]
  %129 = phi i32 [ 0, %120 ], [ %126, %125 ]
  %130 = phi double [ 0.000000e+00, %120 ], [ %302, %125 ]
  %131 = icmp eq i64 %121, 0
  br i1 %131, label %158, label %132

132:                                              ; preds = %127
  %133 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ12kernUpdatePimmPdS_E1A, i32 0, i32 %129
  %134 = load double, double addrspace(3)* %133, align 8, !tbaa !16
  %135 = fmul double %134, 0x3FF71547652B82FE
  %136 = tail call double @llvm.rint.f64(double %135)
  %137 = fneg double %136
  %138 = tail call double @llvm.fma.f64(double %137, double 0x3FE62E42FEFA39EF, double %134)
  %139 = tail call double @llvm.fma.f64(double %137, double 0x3C7ABC9E3B39803F, double %138)
  %140 = tail call double @llvm.fma.f64(double %139, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %141 = tail call double @llvm.fma.f64(double %139, double %140, double 0x3EC71DEE623FDE64)
  %142 = tail call double @llvm.fma.f64(double %139, double %141, double 0x3EFA01997C89E6B0)
  %143 = tail call double @llvm.fma.f64(double %139, double %142, double 0x3F2A01A014761F6E)
  %144 = tail call double @llvm.fma.f64(double %139, double %143, double 0x3F56C16C1852B7B0)
  %145 = tail call double @llvm.fma.f64(double %139, double %144, double 0x3F81111111122322)
  %146 = tail call double @llvm.fma.f64(double %139, double %145, double 0x3FA55555555502A1)
  %147 = tail call double @llvm.fma.f64(double %139, double %146, double 0x3FC5555555555511)
  %148 = tail call double @llvm.fma.f64(double %139, double %147, double 0x3FE000000000000B)
  %149 = tail call double @llvm.fma.f64(double %139, double %148, double 1.000000e+00)
  %150 = tail call double @llvm.fma.f64(double %139, double %149, double 1.000000e+00)
  %151 = fptosi double %136 to i32
  %152 = tail call double @llvm.amdgcn.ldexp.f64(double %150, i32 %151)
  %153 = fcmp ogt double %134, 1.024000e+03
  %154 = select i1 %153, double 0x7FF0000000000000, double %152
  %155 = fcmp olt double %134, -1.075000e+03
  %156 = select i1 %155, double 0.000000e+00, double %154
  %157 = fadd contract double %130, %156
  br label %158

158:                                              ; preds = %132, %127, %27
  %159 = phi double [ 0.000000e+00, %27 ], [ %128, %127 ], [ %157, %132 ]
  %160 = load double, double addrspace(3)* %118, align 8, !tbaa !16
  %161 = tail call double @llvm.amdgcn.frexp.mant.f64(double %159)
  %162 = fcmp olt double %161, 0x3FE5555555555555
  %163 = zext i1 %162 to i32
  %164 = tail call double @llvm.amdgcn.ldexp.f64(double %161, i32 %163)
  %165 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %159)
  %166 = sub nsw i32 %165, %163
  %167 = fadd double %164, -1.000000e+00
  %168 = fadd double %164, 1.000000e+00
  %169 = fadd double %168, -1.000000e+00
  %170 = fsub double %164, %169
  %171 = tail call double @llvm.amdgcn.rcp.f64(double %168)
  %172 = fneg double %168
  %173 = tail call double @llvm.fma.f64(double %172, double %171, double 1.000000e+00)
  %174 = tail call double @llvm.fma.f64(double %173, double %171, double %171)
  %175 = tail call double @llvm.fma.f64(double %172, double %174, double 1.000000e+00)
  %176 = tail call double @llvm.fma.f64(double %175, double %174, double %174)
  %177 = fmul double %167, %176
  %178 = fmul double %168, %177
  %179 = fneg double %178
  %180 = tail call double @llvm.fma.f64(double %177, double %168, double %179)
  %181 = tail call double @llvm.fma.f64(double %177, double %170, double %180)
  %182 = fadd double %178, %181
  %183 = fsub double %182, %178
  %184 = fsub double %181, %183
  %185 = fsub double %167, %182
  %186 = fsub double %167, %185
  %187 = fsub double %186, %182
  %188 = fsub double %187, %184
  %189 = fadd double %185, %188
  %190 = fmul double %176, %189
  %191 = fadd double %177, %190
  %192 = fsub double %191, %177
  %193 = fsub double %190, %192
  %194 = fmul double %191, %191
  %195 = tail call double @llvm.fma.f64(double %194, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %196 = tail call double @llvm.fma.f64(double %194, double %195, double 0x3FC7474DD7F4DF2E)
  %197 = tail call double @llvm.fma.f64(double %194, double %196, double 0x3FCC71C016291751)
  %198 = tail call double @llvm.fma.f64(double %194, double %197, double 0x3FD249249B27ACF1)
  %199 = tail call double @llvm.fma.f64(double %194, double %198, double 0x3FD99999998EF7B6)
  %200 = tail call double @llvm.fma.f64(double %194, double %199, double 0x3FE5555555555780)
  %201 = tail call double @llvm.amdgcn.ldexp.f64(double %191, i32 1)
  %202 = tail call double @llvm.amdgcn.ldexp.f64(double %193, i32 1)
  %203 = fmul double %191, %194
  %204 = fmul double %203, %200
  %205 = fadd double %201, %204
  %206 = fsub double %205, %201
  %207 = fsub double %204, %206
  %208 = fadd double %202, %207
  %209 = fadd double %205, %208
  %210 = fsub double %209, %205
  %211 = fsub double %208, %210
  %212 = sitofp i32 %166 to double
  %213 = fmul double %212, 0x3FE62E42FEFA39EF
  %214 = fneg double %213
  %215 = tail call double @llvm.fma.f64(double %212, double 0x3FE62E42FEFA39EF, double %214)
  %216 = tail call double @llvm.fma.f64(double %212, double 0x3C7ABC9E3B39803F, double %215)
  %217 = fadd double %213, %216
  %218 = fsub double %217, %213
  %219 = fsub double %216, %218
  %220 = fadd double %217, %209
  %221 = fsub double %220, %217
  %222 = fsub double %220, %221
  %223 = fsub double %217, %222
  %224 = fsub double %209, %221
  %225 = fadd double %224, %223
  %226 = fadd double %219, %211
  %227 = fsub double %226, %219
  %228 = fsub double %226, %227
  %229 = fsub double %219, %228
  %230 = fsub double %211, %227
  %231 = fadd double %230, %229
  %232 = fadd double %226, %225
  %233 = fadd double %220, %232
  %234 = fsub double %233, %220
  %235 = fsub double %232, %234
  %236 = fadd double %231, %235
  %237 = fadd double %233, %236
  %238 = tail call double @llvm.fabs.f64(double %159) #4
  %239 = fcmp oeq double %238, 0x7FF0000000000000
  %240 = select i1 %239, double %159, double %237
  %241 = fcmp olt double %159, 0.000000e+00
  %242 = select i1 %241, double 0x7FF8000000000000, double %240
  %243 = fcmp oeq double %159, 0.000000e+00
  %244 = select i1 %243, double 0xFFF0000000000000, double %242
  %245 = fsub contract double %160, %244
  store double %245, double addrspace(1)* %28, align 8, !tbaa !16
  br label %306

246:                                              ; preds = %246, %123
  %247 = phi i64 [ 0, %123 ], [ %303, %246 ]
  %248 = phi double [ 0.000000e+00, %123 ], [ %302, %246 ]
  %249 = phi i64 [ 0, %123 ], [ %304, %246 ]
  %250 = trunc i64 %247 to i32
  %251 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ12kernUpdatePimmPdS_E1A, i32 0, i32 %250
  %252 = load double, double addrspace(3)* %251, align 16, !tbaa !16
  %253 = fmul double %252, 0x3FF71547652B82FE
  %254 = tail call double @llvm.rint.f64(double %253)
  %255 = fneg double %254
  %256 = tail call double @llvm.fma.f64(double %255, double 0x3FE62E42FEFA39EF, double %252)
  %257 = tail call double @llvm.fma.f64(double %255, double 0x3C7ABC9E3B39803F, double %256)
  %258 = tail call double @llvm.fma.f64(double %257, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %259 = tail call double @llvm.fma.f64(double %257, double %258, double 0x3EC71DEE623FDE64)
  %260 = tail call double @llvm.fma.f64(double %257, double %259, double 0x3EFA01997C89E6B0)
  %261 = tail call double @llvm.fma.f64(double %257, double %260, double 0x3F2A01A014761F6E)
  %262 = tail call double @llvm.fma.f64(double %257, double %261, double 0x3F56C16C1852B7B0)
  %263 = tail call double @llvm.fma.f64(double %257, double %262, double 0x3F81111111122322)
  %264 = tail call double @llvm.fma.f64(double %257, double %263, double 0x3FA55555555502A1)
  %265 = tail call double @llvm.fma.f64(double %257, double %264, double 0x3FC5555555555511)
  %266 = tail call double @llvm.fma.f64(double %257, double %265, double 0x3FE000000000000B)
  %267 = tail call double @llvm.fma.f64(double %257, double %266, double 1.000000e+00)
  %268 = tail call double @llvm.fma.f64(double %257, double %267, double 1.000000e+00)
  %269 = fptosi double %254 to i32
  %270 = tail call double @llvm.amdgcn.ldexp.f64(double %268, i32 %269)
  %271 = fcmp ogt double %252, 1.024000e+03
  %272 = select i1 %271, double 0x7FF0000000000000, double %270
  %273 = fcmp olt double %252, -1.075000e+03
  %274 = select i1 %273, double 0.000000e+00, double %272
  %275 = fadd contract double %248, %274
  %276 = trunc i64 %247 to i32
  %277 = or i32 %276, 1
  %278 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ12kernUpdatePimmPdS_E1A, i32 0, i32 %277
  %279 = load double, double addrspace(3)* %278, align 8, !tbaa !16
  %280 = fmul double %279, 0x3FF71547652B82FE
  %281 = tail call double @llvm.rint.f64(double %280)
  %282 = fneg double %281
  %283 = tail call double @llvm.fma.f64(double %282, double 0x3FE62E42FEFA39EF, double %279)
  %284 = tail call double @llvm.fma.f64(double %282, double 0x3C7ABC9E3B39803F, double %283)
  %285 = tail call double @llvm.fma.f64(double %284, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %286 = tail call double @llvm.fma.f64(double %284, double %285, double 0x3EC71DEE623FDE64)
  %287 = tail call double @llvm.fma.f64(double %284, double %286, double 0x3EFA01997C89E6B0)
  %288 = tail call double @llvm.fma.f64(double %284, double %287, double 0x3F2A01A014761F6E)
  %289 = tail call double @llvm.fma.f64(double %284, double %288, double 0x3F56C16C1852B7B0)
  %290 = tail call double @llvm.fma.f64(double %284, double %289, double 0x3F81111111122322)
  %291 = tail call double @llvm.fma.f64(double %284, double %290, double 0x3FA55555555502A1)
  %292 = tail call double @llvm.fma.f64(double %284, double %291, double 0x3FC5555555555511)
  %293 = tail call double @llvm.fma.f64(double %284, double %292, double 0x3FE000000000000B)
  %294 = tail call double @llvm.fma.f64(double %284, double %293, double 1.000000e+00)
  %295 = tail call double @llvm.fma.f64(double %284, double %294, double 1.000000e+00)
  %296 = fptosi double %281 to i32
  %297 = tail call double @llvm.amdgcn.ldexp.f64(double %295, i32 %296)
  %298 = fcmp ogt double %279, 1.024000e+03
  %299 = select i1 %298, double 0x7FF0000000000000, double %297
  %300 = fcmp olt double %279, -1.075000e+03
  %301 = select i1 %300, double 0.000000e+00, double %299
  %302 = fadd contract double %275, %301
  %303 = add nuw i64 %247, 2
  %304 = add i64 %249, 2
  %305 = icmp eq i64 %304, %124
  br i1 %305, label %125, label %246, !llvm.loop !20

306:                                              ; preds = %4, %158
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

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
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
