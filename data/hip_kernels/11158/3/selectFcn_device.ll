; ModuleID = '../data/hip_kernels/11158/3/main.cu'
source_filename = "../data/hip_kernels/11158/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

@c_LB = protected local_unnamed_addr addrspace(1) externally_initialized global [10 x float] zeroinitializer, align 16
@c_UB = protected local_unnamed_addr addrspace(1) externally_initialized global [10 x float] zeroinitializer, align 16
@c_a = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aa = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aaa = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aRow = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@c_aaaRow = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@c_Dysum = protected local_unnamed_addr addrspace(1) externally_initialized global [9 x float] zeroinitializer, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9selectFcnPfS_S_S_S_fS_P12hiprandState(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float %5, float addrspace(1)* nocapture %6, %struct.hiprandState addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %3, i64 %10
  %12 = load float, float addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = fdiv contract float %12, %5
  %14 = getelementptr inbounds float, float addrspace(1)* %6, i64 %10
  store float %13, float addrspace(1)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %15 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %7, i64 %10, i32 0, i32 0, i32 0
  %16 = load i32, i32 addrspace(1)* %15, align 8
  %17 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %7, i64 %10, i32 0, i32 0, i32 5, i64 0
  %18 = load i32, i32 addrspace(1)* %17, align 8
  %19 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %7, i64 %10, i32 0, i32 0, i32 5, i64 4
  %20 = load i32, i32 addrspace(1)* %19, align 8
  %21 = lshr i32 %18, 2
  %22 = xor i32 %21, %18
  %23 = shl i32 %20, 4
  %24 = shl i32 %22, 1
  %25 = xor i32 %24, %23
  %26 = xor i32 %25, %22
  %27 = xor i32 %26, %20
  %28 = add i32 %16, 362437
  %29 = add i32 %27, %28
  %30 = uitofp i32 %29 to float
  %31 = fmul contract float %30, 0x3DF0000000000000
  %32 = fadd contract float %31, 0x3DF0000000000000
  %33 = fpext float %32 to double
  %34 = fcmp contract olt double %33, 1.000000e-04
  br i1 %34, label %35, label %42

35:                                               ; preds = %8
  %36 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %7, i64 %10, i32 0, i32 0, i32 5, i64 3
  %37 = load i32, i32 addrspace(1)* %36, align 4
  %38 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %7, i64 %10, i32 0, i32 0, i32 5, i64 2
  %39 = load i32, i32 addrspace(1)* %38, align 8
  %40 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %7, i64 %10, i32 0, i32 0, i32 5, i64 1
  %41 = load i32, i32 addrspace(1)* %40, align 4
  br label %47

42:                                               ; preds = %47, %8
  %43 = phi float [ %32, %8 ], [ %65, %47 ]
  %44 = load float, float addrspace(1)* %6, align 4, !tbaa !5
  %45 = fsub contract float %43, %44
  %46 = fcmp contract ugt float %45, 0.000000e+00
  br i1 %46, label %68, label %704

47:                                               ; preds = %35, %47
  %48 = phi i32 [ %61, %47 ], [ %28, %35 ]
  %49 = phi i32 [ %60, %47 ], [ %27, %35 ]
  %50 = phi i32 [ %49, %47 ], [ %20, %35 ]
  %51 = phi i32 [ %52, %47 ], [ %41, %35 ]
  %52 = phi i32 [ %53, %47 ], [ %39, %35 ]
  %53 = phi i32 [ %50, %47 ], [ %37, %35 ]
  %54 = lshr i32 %51, 2
  %55 = xor i32 %54, %51
  %56 = shl i32 %49, 4
  %57 = shl i32 %55, 1
  %58 = xor i32 %49, %55
  %59 = xor i32 %58, %56
  %60 = xor i32 %59, %57
  %61 = add i32 %48, 362437
  %62 = add i32 %60, %61
  %63 = uitofp i32 %62 to float
  %64 = fmul contract float %63, 0x3DF0000000000000
  %65 = fadd contract float %64, 0x3DF0000000000000
  %66 = fpext float %65 to double
  %67 = fcmp contract olt double %66, 1.000000e-04
  br i1 %67, label %47, label %42, !llvm.loop !10

68:                                               ; preds = %42
  %69 = getelementptr inbounds float, float addrspace(1)* %6, i64 1
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5
  %71 = fsub contract float %45, %70
  %72 = fcmp contract ugt float %71, 0.000000e+00
  br i1 %72, label %73, label %704

73:                                               ; preds = %68
  %74 = getelementptr inbounds float, float addrspace(1)* %6, i64 2
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5
  %76 = fsub contract float %71, %75
  %77 = fcmp contract ugt float %76, 0.000000e+00
  br i1 %77, label %78, label %704

78:                                               ; preds = %73
  %79 = getelementptr inbounds float, float addrspace(1)* %6, i64 3
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5
  %81 = fsub contract float %76, %80
  %82 = fcmp contract ugt float %81, 0.000000e+00
  br i1 %82, label %83, label %704

83:                                               ; preds = %78
  %84 = getelementptr inbounds float, float addrspace(1)* %6, i64 4
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5
  %86 = fsub contract float %81, %85
  %87 = fcmp contract ugt float %86, 0.000000e+00
  br i1 %87, label %88, label %704

88:                                               ; preds = %83
  %89 = getelementptr inbounds float, float addrspace(1)* %6, i64 5
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5
  %91 = fsub contract float %86, %90
  %92 = fcmp contract ugt float %91, 0.000000e+00
  br i1 %92, label %93, label %704

93:                                               ; preds = %88
  %94 = getelementptr inbounds float, float addrspace(1)* %6, i64 6
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5
  %96 = fsub contract float %91, %95
  %97 = fcmp contract ugt float %96, 0.000000e+00
  br i1 %97, label %98, label %704

98:                                               ; preds = %93
  %99 = getelementptr inbounds float, float addrspace(1)* %6, i64 7
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5
  %101 = fsub contract float %96, %100
  %102 = fcmp contract ugt float %101, 0.000000e+00
  br i1 %102, label %103, label %704

103:                                              ; preds = %98
  %104 = getelementptr inbounds float, float addrspace(1)* %6, i64 8
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5
  %106 = fsub contract float %101, %105
  %107 = fcmp contract ugt float %106, 0.000000e+00
  br i1 %107, label %108, label %704

108:                                              ; preds = %103
  %109 = getelementptr inbounds float, float addrspace(1)* %6, i64 9
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5
  %111 = fsub contract float %106, %110
  %112 = fcmp contract ugt float %111, 0.000000e+00
  br i1 %112, label %113, label %704

113:                                              ; preds = %108
  %114 = getelementptr inbounds float, float addrspace(1)* %6, i64 10
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5
  %116 = fsub contract float %111, %115
  %117 = fcmp contract ugt float %116, 0.000000e+00
  br i1 %117, label %118, label %704

118:                                              ; preds = %113
  %119 = getelementptr inbounds float, float addrspace(1)* %6, i64 11
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5
  %121 = fsub contract float %116, %120
  %122 = fcmp contract ugt float %121, 0.000000e+00
  br i1 %122, label %123, label %704

123:                                              ; preds = %118
  %124 = getelementptr inbounds float, float addrspace(1)* %6, i64 12
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !5
  %126 = fsub contract float %121, %125
  %127 = fcmp contract ugt float %126, 0.000000e+00
  br i1 %127, label %128, label %704

128:                                              ; preds = %123
  %129 = getelementptr inbounds float, float addrspace(1)* %6, i64 13
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !5
  %131 = fsub contract float %126, %130
  %132 = fcmp contract ugt float %131, 0.000000e+00
  br i1 %132, label %133, label %704

133:                                              ; preds = %128
  %134 = getelementptr inbounds float, float addrspace(1)* %6, i64 14
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5
  %136 = fsub contract float %131, %135
  %137 = fcmp contract ugt float %136, 0.000000e+00
  br i1 %137, label %138, label %704

138:                                              ; preds = %133
  %139 = getelementptr inbounds float, float addrspace(1)* %6, i64 15
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !5
  %141 = fsub contract float %136, %140
  %142 = fcmp contract ugt float %141, 0.000000e+00
  br i1 %142, label %143, label %704

143:                                              ; preds = %138
  %144 = getelementptr inbounds float, float addrspace(1)* %6, i64 16
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !5
  %146 = fsub contract float %141, %145
  %147 = fcmp contract ugt float %146, 0.000000e+00
  br i1 %147, label %148, label %704

148:                                              ; preds = %143
  %149 = getelementptr inbounds float, float addrspace(1)* %6, i64 17
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !5
  %151 = fsub contract float %146, %150
  %152 = fcmp contract ugt float %151, 0.000000e+00
  br i1 %152, label %153, label %704

153:                                              ; preds = %148
  %154 = getelementptr inbounds float, float addrspace(1)* %6, i64 18
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !5
  %156 = fsub contract float %151, %155
  %157 = fcmp contract ugt float %156, 0.000000e+00
  br i1 %157, label %158, label %704

158:                                              ; preds = %153
  %159 = getelementptr inbounds float, float addrspace(1)* %6, i64 19
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !5
  %161 = fsub contract float %156, %160
  %162 = fcmp contract ugt float %161, 0.000000e+00
  br i1 %162, label %163, label %704

163:                                              ; preds = %158
  %164 = getelementptr inbounds float, float addrspace(1)* %6, i64 20
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !5
  %166 = fsub contract float %161, %165
  %167 = fcmp contract ugt float %166, 0.000000e+00
  br i1 %167, label %168, label %704

168:                                              ; preds = %163
  %169 = getelementptr inbounds float, float addrspace(1)* %6, i64 21
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !5
  %171 = fsub contract float %166, %170
  %172 = fcmp contract ugt float %171, 0.000000e+00
  br i1 %172, label %173, label %704

173:                                              ; preds = %168
  %174 = getelementptr inbounds float, float addrspace(1)* %6, i64 22
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !5
  %176 = fsub contract float %171, %175
  %177 = fcmp contract ugt float %176, 0.000000e+00
  br i1 %177, label %178, label %704

178:                                              ; preds = %173
  %179 = getelementptr inbounds float, float addrspace(1)* %6, i64 23
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !5
  %181 = fsub contract float %176, %180
  %182 = fcmp contract ugt float %181, 0.000000e+00
  br i1 %182, label %183, label %704

183:                                              ; preds = %178
  %184 = getelementptr inbounds float, float addrspace(1)* %6, i64 24
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !5
  %186 = fsub contract float %181, %185
  %187 = fcmp contract ugt float %186, 0.000000e+00
  br i1 %187, label %188, label %704

188:                                              ; preds = %183
  %189 = getelementptr inbounds float, float addrspace(1)* %6, i64 25
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !5
  %191 = fsub contract float %186, %190
  %192 = fcmp contract ugt float %191, 0.000000e+00
  br i1 %192, label %193, label %704

193:                                              ; preds = %188
  %194 = getelementptr inbounds float, float addrspace(1)* %6, i64 26
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !5
  %196 = fsub contract float %191, %195
  %197 = fcmp contract ugt float %196, 0.000000e+00
  br i1 %197, label %198, label %704

198:                                              ; preds = %193
  %199 = getelementptr inbounds float, float addrspace(1)* %6, i64 27
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !5
  %201 = fsub contract float %196, %200
  %202 = fcmp contract ugt float %201, 0.000000e+00
  br i1 %202, label %203, label %704

203:                                              ; preds = %198
  %204 = getelementptr inbounds float, float addrspace(1)* %6, i64 28
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !5
  %206 = fsub contract float %201, %205
  %207 = fcmp contract ugt float %206, 0.000000e+00
  br i1 %207, label %208, label %704

208:                                              ; preds = %203
  %209 = getelementptr inbounds float, float addrspace(1)* %6, i64 29
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !5
  %211 = fsub contract float %206, %210
  %212 = fcmp contract ugt float %211, 0.000000e+00
  br i1 %212, label %213, label %704

213:                                              ; preds = %208
  %214 = getelementptr inbounds float, float addrspace(1)* %6, i64 30
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !5
  %216 = fsub contract float %211, %215
  %217 = fcmp contract ugt float %216, 0.000000e+00
  br i1 %217, label %218, label %704

218:                                              ; preds = %213
  %219 = getelementptr inbounds float, float addrspace(1)* %6, i64 31
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !5
  %221 = fsub contract float %216, %220
  %222 = fcmp contract ugt float %221, 0.000000e+00
  br i1 %222, label %223, label %704

223:                                              ; preds = %218
  %224 = getelementptr inbounds float, float addrspace(1)* %6, i64 32
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !5
  %226 = fsub contract float %221, %225
  %227 = fcmp contract ugt float %226, 0.000000e+00
  br i1 %227, label %228, label %704

228:                                              ; preds = %223
  %229 = getelementptr inbounds float, float addrspace(1)* %6, i64 33
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !5
  %231 = fsub contract float %226, %230
  %232 = fcmp contract ugt float %231, 0.000000e+00
  br i1 %232, label %233, label %704

233:                                              ; preds = %228
  %234 = getelementptr inbounds float, float addrspace(1)* %6, i64 34
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !5
  %236 = fsub contract float %231, %235
  %237 = fcmp contract ugt float %236, 0.000000e+00
  br i1 %237, label %238, label %704

238:                                              ; preds = %233
  %239 = getelementptr inbounds float, float addrspace(1)* %6, i64 35
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !5
  %241 = fsub contract float %236, %240
  %242 = fcmp contract ugt float %241, 0.000000e+00
  br i1 %242, label %243, label %704

243:                                              ; preds = %238
  %244 = getelementptr inbounds float, float addrspace(1)* %6, i64 36
  %245 = load float, float addrspace(1)* %244, align 4, !tbaa !5
  %246 = fsub contract float %241, %245
  %247 = fcmp contract ugt float %246, 0.000000e+00
  br i1 %247, label %248, label %704

248:                                              ; preds = %243
  %249 = getelementptr inbounds float, float addrspace(1)* %6, i64 37
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !5
  %251 = fsub contract float %246, %250
  %252 = fcmp contract ugt float %251, 0.000000e+00
  br i1 %252, label %253, label %704

253:                                              ; preds = %248
  %254 = getelementptr inbounds float, float addrspace(1)* %6, i64 38
  %255 = load float, float addrspace(1)* %254, align 4, !tbaa !5
  %256 = fsub contract float %251, %255
  %257 = fcmp contract ugt float %256, 0.000000e+00
  br i1 %257, label %258, label %704

258:                                              ; preds = %253
  %259 = getelementptr inbounds float, float addrspace(1)* %6, i64 39
  %260 = load float, float addrspace(1)* %259, align 4, !tbaa !5
  %261 = fsub contract float %256, %260
  %262 = fcmp contract ugt float %261, 0.000000e+00
  br i1 %262, label %263, label %704

263:                                              ; preds = %258
  %264 = getelementptr inbounds float, float addrspace(1)* %6, i64 40
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !5
  %266 = fsub contract float %261, %265
  %267 = fcmp contract ugt float %266, 0.000000e+00
  br i1 %267, label %268, label %704

268:                                              ; preds = %263
  %269 = getelementptr inbounds float, float addrspace(1)* %6, i64 41
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !5
  %271 = fsub contract float %266, %270
  %272 = fcmp contract ugt float %271, 0.000000e+00
  br i1 %272, label %273, label %704

273:                                              ; preds = %268
  %274 = getelementptr inbounds float, float addrspace(1)* %6, i64 42
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !5
  %276 = fsub contract float %271, %275
  %277 = fcmp contract ugt float %276, 0.000000e+00
  br i1 %277, label %278, label %704

278:                                              ; preds = %273
  %279 = getelementptr inbounds float, float addrspace(1)* %6, i64 43
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !5
  %281 = fsub contract float %276, %280
  %282 = fcmp contract ugt float %281, 0.000000e+00
  br i1 %282, label %283, label %704

283:                                              ; preds = %278
  %284 = getelementptr inbounds float, float addrspace(1)* %6, i64 44
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !5
  %286 = fsub contract float %281, %285
  %287 = fcmp contract ugt float %286, 0.000000e+00
  br i1 %287, label %288, label %704

288:                                              ; preds = %283
  %289 = getelementptr inbounds float, float addrspace(1)* %6, i64 45
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !5
  %291 = fsub contract float %286, %290
  %292 = fcmp contract ugt float %291, 0.000000e+00
  br i1 %292, label %293, label %704

293:                                              ; preds = %288
  %294 = getelementptr inbounds float, float addrspace(1)* %6, i64 46
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !5
  %296 = fsub contract float %291, %295
  %297 = fcmp contract ugt float %296, 0.000000e+00
  br i1 %297, label %298, label %704

298:                                              ; preds = %293
  %299 = getelementptr inbounds float, float addrspace(1)* %6, i64 47
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !5
  %301 = fsub contract float %296, %300
  %302 = fcmp contract ugt float %301, 0.000000e+00
  br i1 %302, label %303, label %704

303:                                              ; preds = %298
  %304 = getelementptr inbounds float, float addrspace(1)* %6, i64 48
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !5
  %306 = fsub contract float %301, %305
  %307 = fcmp contract ugt float %306, 0.000000e+00
  br i1 %307, label %308, label %704

308:                                              ; preds = %303
  %309 = getelementptr inbounds float, float addrspace(1)* %6, i64 49
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !5
  %311 = fsub contract float %306, %310
  %312 = fcmp contract ugt float %311, 0.000000e+00
  br i1 %312, label %313, label %704

313:                                              ; preds = %308
  %314 = getelementptr inbounds float, float addrspace(1)* %6, i64 50
  %315 = load float, float addrspace(1)* %314, align 4, !tbaa !5
  %316 = fsub contract float %311, %315
  %317 = fcmp contract ugt float %316, 0.000000e+00
  br i1 %317, label %318, label %704

318:                                              ; preds = %313
  %319 = getelementptr inbounds float, float addrspace(1)* %6, i64 51
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !5
  %321 = fsub contract float %316, %320
  %322 = fcmp contract ugt float %321, 0.000000e+00
  br i1 %322, label %323, label %704

323:                                              ; preds = %318
  %324 = getelementptr inbounds float, float addrspace(1)* %6, i64 52
  %325 = load float, float addrspace(1)* %324, align 4, !tbaa !5
  %326 = fsub contract float %321, %325
  %327 = fcmp contract ugt float %326, 0.000000e+00
  br i1 %327, label %328, label %704

328:                                              ; preds = %323
  %329 = getelementptr inbounds float, float addrspace(1)* %6, i64 53
  %330 = load float, float addrspace(1)* %329, align 4, !tbaa !5
  %331 = fsub contract float %326, %330
  %332 = fcmp contract ugt float %331, 0.000000e+00
  br i1 %332, label %333, label %704

333:                                              ; preds = %328
  %334 = getelementptr inbounds float, float addrspace(1)* %6, i64 54
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !5
  %336 = fsub contract float %331, %335
  %337 = fcmp contract ugt float %336, 0.000000e+00
  br i1 %337, label %338, label %704

338:                                              ; preds = %333
  %339 = getelementptr inbounds float, float addrspace(1)* %6, i64 55
  %340 = load float, float addrspace(1)* %339, align 4, !tbaa !5
  %341 = fsub contract float %336, %340
  %342 = fcmp contract ugt float %341, 0.000000e+00
  br i1 %342, label %343, label %704

343:                                              ; preds = %338
  %344 = getelementptr inbounds float, float addrspace(1)* %6, i64 56
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !5
  %346 = fsub contract float %341, %345
  %347 = fcmp contract ugt float %346, 0.000000e+00
  br i1 %347, label %348, label %704

348:                                              ; preds = %343
  %349 = getelementptr inbounds float, float addrspace(1)* %6, i64 57
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !5
  %351 = fsub contract float %346, %350
  %352 = fcmp contract ugt float %351, 0.000000e+00
  br i1 %352, label %353, label %704

353:                                              ; preds = %348
  %354 = getelementptr inbounds float, float addrspace(1)* %6, i64 58
  %355 = load float, float addrspace(1)* %354, align 4, !tbaa !5
  %356 = fsub contract float %351, %355
  %357 = fcmp contract ugt float %356, 0.000000e+00
  br i1 %357, label %358, label %704

358:                                              ; preds = %353
  %359 = getelementptr inbounds float, float addrspace(1)* %6, i64 59
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !5
  %361 = fsub contract float %356, %360
  %362 = fcmp contract ugt float %361, 0.000000e+00
  br i1 %362, label %363, label %704

363:                                              ; preds = %358
  %364 = getelementptr inbounds float, float addrspace(1)* %6, i64 60
  %365 = load float, float addrspace(1)* %364, align 4, !tbaa !5
  %366 = fsub contract float %361, %365
  %367 = fcmp contract ugt float %366, 0.000000e+00
  br i1 %367, label %368, label %704

368:                                              ; preds = %363
  %369 = getelementptr inbounds float, float addrspace(1)* %6, i64 61
  %370 = load float, float addrspace(1)* %369, align 4, !tbaa !5
  %371 = fsub contract float %366, %370
  %372 = fcmp contract ugt float %371, 0.000000e+00
  br i1 %372, label %373, label %704

373:                                              ; preds = %368
  %374 = getelementptr inbounds float, float addrspace(1)* %6, i64 62
  %375 = load float, float addrspace(1)* %374, align 4, !tbaa !5
  %376 = fsub contract float %371, %375
  %377 = fcmp contract ugt float %376, 0.000000e+00
  br i1 %377, label %378, label %704

378:                                              ; preds = %373
  %379 = getelementptr inbounds float, float addrspace(1)* %6, i64 63
  %380 = load float, float addrspace(1)* %379, align 4, !tbaa !5
  %381 = fsub contract float %376, %380
  %382 = fcmp contract ugt float %381, 0.000000e+00
  br i1 %382, label %383, label %704

383:                                              ; preds = %378
  %384 = getelementptr inbounds float, float addrspace(1)* %6, i64 64
  %385 = load float, float addrspace(1)* %384, align 4, !tbaa !5
  %386 = fsub contract float %381, %385
  %387 = fcmp contract ugt float %386, 0.000000e+00
  br i1 %387, label %388, label %704

388:                                              ; preds = %383
  %389 = getelementptr inbounds float, float addrspace(1)* %6, i64 65
  %390 = load float, float addrspace(1)* %389, align 4, !tbaa !5
  %391 = fsub contract float %386, %390
  %392 = fcmp contract ugt float %391, 0.000000e+00
  br i1 %392, label %393, label %704

393:                                              ; preds = %388
  %394 = getelementptr inbounds float, float addrspace(1)* %6, i64 66
  %395 = load float, float addrspace(1)* %394, align 4, !tbaa !5
  %396 = fsub contract float %391, %395
  %397 = fcmp contract ugt float %396, 0.000000e+00
  br i1 %397, label %398, label %704

398:                                              ; preds = %393
  %399 = getelementptr inbounds float, float addrspace(1)* %6, i64 67
  %400 = load float, float addrspace(1)* %399, align 4, !tbaa !5
  %401 = fsub contract float %396, %400
  %402 = fcmp contract ugt float %401, 0.000000e+00
  br i1 %402, label %403, label %704

403:                                              ; preds = %398
  %404 = getelementptr inbounds float, float addrspace(1)* %6, i64 68
  %405 = load float, float addrspace(1)* %404, align 4, !tbaa !5
  %406 = fsub contract float %401, %405
  %407 = fcmp contract ugt float %406, 0.000000e+00
  br i1 %407, label %408, label %704

408:                                              ; preds = %403
  %409 = getelementptr inbounds float, float addrspace(1)* %6, i64 69
  %410 = load float, float addrspace(1)* %409, align 4, !tbaa !5
  %411 = fsub contract float %406, %410
  %412 = fcmp contract ugt float %411, 0.000000e+00
  br i1 %412, label %413, label %704

413:                                              ; preds = %408
  %414 = getelementptr inbounds float, float addrspace(1)* %6, i64 70
  %415 = load float, float addrspace(1)* %414, align 4, !tbaa !5
  %416 = fsub contract float %411, %415
  %417 = fcmp contract ugt float %416, 0.000000e+00
  br i1 %417, label %418, label %704

418:                                              ; preds = %413
  %419 = getelementptr inbounds float, float addrspace(1)* %6, i64 71
  %420 = load float, float addrspace(1)* %419, align 4, !tbaa !5
  %421 = fsub contract float %416, %420
  %422 = fcmp contract ugt float %421, 0.000000e+00
  br i1 %422, label %423, label %704

423:                                              ; preds = %418
  %424 = getelementptr inbounds float, float addrspace(1)* %6, i64 72
  %425 = load float, float addrspace(1)* %424, align 4, !tbaa !5
  %426 = fsub contract float %421, %425
  %427 = fcmp contract ugt float %426, 0.000000e+00
  br i1 %427, label %428, label %704

428:                                              ; preds = %423
  %429 = getelementptr inbounds float, float addrspace(1)* %6, i64 73
  %430 = load float, float addrspace(1)* %429, align 4, !tbaa !5
  %431 = fsub contract float %426, %430
  %432 = fcmp contract ugt float %431, 0.000000e+00
  br i1 %432, label %433, label %704

433:                                              ; preds = %428
  %434 = getelementptr inbounds float, float addrspace(1)* %6, i64 74
  %435 = load float, float addrspace(1)* %434, align 4, !tbaa !5
  %436 = fsub contract float %431, %435
  %437 = fcmp contract ugt float %436, 0.000000e+00
  br i1 %437, label %438, label %704

438:                                              ; preds = %433
  %439 = getelementptr inbounds float, float addrspace(1)* %6, i64 75
  %440 = load float, float addrspace(1)* %439, align 4, !tbaa !5
  %441 = fsub contract float %436, %440
  %442 = fcmp contract ugt float %441, 0.000000e+00
  br i1 %442, label %443, label %704

443:                                              ; preds = %438
  %444 = getelementptr inbounds float, float addrspace(1)* %6, i64 76
  %445 = load float, float addrspace(1)* %444, align 4, !tbaa !5
  %446 = fsub contract float %441, %445
  %447 = fcmp contract ugt float %446, 0.000000e+00
  br i1 %447, label %448, label %704

448:                                              ; preds = %443
  %449 = getelementptr inbounds float, float addrspace(1)* %6, i64 77
  %450 = load float, float addrspace(1)* %449, align 4, !tbaa !5
  %451 = fsub contract float %446, %450
  %452 = fcmp contract ugt float %451, 0.000000e+00
  br i1 %452, label %453, label %704

453:                                              ; preds = %448
  %454 = getelementptr inbounds float, float addrspace(1)* %6, i64 78
  %455 = load float, float addrspace(1)* %454, align 4, !tbaa !5
  %456 = fsub contract float %451, %455
  %457 = fcmp contract ugt float %456, 0.000000e+00
  br i1 %457, label %458, label %704

458:                                              ; preds = %453
  %459 = getelementptr inbounds float, float addrspace(1)* %6, i64 79
  %460 = load float, float addrspace(1)* %459, align 4, !tbaa !5
  %461 = fsub contract float %456, %460
  %462 = fcmp contract ugt float %461, 0.000000e+00
  br i1 %462, label %463, label %704

463:                                              ; preds = %458
  %464 = getelementptr inbounds float, float addrspace(1)* %6, i64 80
  %465 = load float, float addrspace(1)* %464, align 4, !tbaa !5
  %466 = fsub contract float %461, %465
  %467 = fcmp contract ugt float %466, 0.000000e+00
  br i1 %467, label %468, label %704

468:                                              ; preds = %463
  %469 = getelementptr inbounds float, float addrspace(1)* %6, i64 81
  %470 = load float, float addrspace(1)* %469, align 4, !tbaa !5
  %471 = fsub contract float %466, %470
  %472 = fcmp contract ugt float %471, 0.000000e+00
  br i1 %472, label %473, label %704

473:                                              ; preds = %468
  %474 = getelementptr inbounds float, float addrspace(1)* %6, i64 82
  %475 = load float, float addrspace(1)* %474, align 4, !tbaa !5
  %476 = fsub contract float %471, %475
  %477 = fcmp contract ugt float %476, 0.000000e+00
  br i1 %477, label %478, label %704

478:                                              ; preds = %473
  %479 = getelementptr inbounds float, float addrspace(1)* %6, i64 83
  %480 = load float, float addrspace(1)* %479, align 4, !tbaa !5
  %481 = fsub contract float %476, %480
  %482 = fcmp contract ugt float %481, 0.000000e+00
  br i1 %482, label %483, label %704

483:                                              ; preds = %478
  %484 = getelementptr inbounds float, float addrspace(1)* %6, i64 84
  %485 = load float, float addrspace(1)* %484, align 4, !tbaa !5
  %486 = fsub contract float %481, %485
  %487 = fcmp contract ugt float %486, 0.000000e+00
  br i1 %487, label %488, label %704

488:                                              ; preds = %483
  %489 = getelementptr inbounds float, float addrspace(1)* %6, i64 85
  %490 = load float, float addrspace(1)* %489, align 4, !tbaa !5
  %491 = fsub contract float %486, %490
  %492 = fcmp contract ugt float %491, 0.000000e+00
  br i1 %492, label %493, label %704

493:                                              ; preds = %488
  %494 = getelementptr inbounds float, float addrspace(1)* %6, i64 86
  %495 = load float, float addrspace(1)* %494, align 4, !tbaa !5
  %496 = fsub contract float %491, %495
  %497 = fcmp contract ugt float %496, 0.000000e+00
  br i1 %497, label %498, label %704

498:                                              ; preds = %493
  %499 = getelementptr inbounds float, float addrspace(1)* %6, i64 87
  %500 = load float, float addrspace(1)* %499, align 4, !tbaa !5
  %501 = fsub contract float %496, %500
  %502 = fcmp contract ugt float %501, 0.000000e+00
  br i1 %502, label %503, label %704

503:                                              ; preds = %498
  %504 = getelementptr inbounds float, float addrspace(1)* %6, i64 88
  %505 = load float, float addrspace(1)* %504, align 4, !tbaa !5
  %506 = fsub contract float %501, %505
  %507 = fcmp contract ugt float %506, 0.000000e+00
  br i1 %507, label %508, label %704

508:                                              ; preds = %503
  %509 = getelementptr inbounds float, float addrspace(1)* %6, i64 89
  %510 = load float, float addrspace(1)* %509, align 4, !tbaa !5
  %511 = fsub contract float %506, %510
  %512 = fcmp contract ugt float %511, 0.000000e+00
  br i1 %512, label %513, label %704

513:                                              ; preds = %508
  %514 = getelementptr inbounds float, float addrspace(1)* %6, i64 90
  %515 = load float, float addrspace(1)* %514, align 4, !tbaa !5
  %516 = fsub contract float %511, %515
  %517 = fcmp contract ugt float %516, 0.000000e+00
  br i1 %517, label %518, label %704

518:                                              ; preds = %513
  %519 = getelementptr inbounds float, float addrspace(1)* %6, i64 91
  %520 = load float, float addrspace(1)* %519, align 4, !tbaa !5
  %521 = fsub contract float %516, %520
  %522 = fcmp contract ugt float %521, 0.000000e+00
  br i1 %522, label %523, label %704

523:                                              ; preds = %518
  %524 = getelementptr inbounds float, float addrspace(1)* %6, i64 92
  %525 = load float, float addrspace(1)* %524, align 4, !tbaa !5
  %526 = fsub contract float %521, %525
  %527 = fcmp contract ugt float %526, 0.000000e+00
  br i1 %527, label %528, label %704

528:                                              ; preds = %523
  %529 = getelementptr inbounds float, float addrspace(1)* %6, i64 93
  %530 = load float, float addrspace(1)* %529, align 4, !tbaa !5
  %531 = fsub contract float %526, %530
  %532 = fcmp contract ugt float %531, 0.000000e+00
  br i1 %532, label %533, label %704

533:                                              ; preds = %528
  %534 = getelementptr inbounds float, float addrspace(1)* %6, i64 94
  %535 = load float, float addrspace(1)* %534, align 4, !tbaa !5
  %536 = fsub contract float %531, %535
  %537 = fcmp contract ugt float %536, 0.000000e+00
  br i1 %537, label %538, label %704

538:                                              ; preds = %533
  %539 = getelementptr inbounds float, float addrspace(1)* %6, i64 95
  %540 = load float, float addrspace(1)* %539, align 4, !tbaa !5
  %541 = fsub contract float %536, %540
  %542 = fcmp contract ugt float %541, 0.000000e+00
  br i1 %542, label %543, label %704

543:                                              ; preds = %538
  %544 = getelementptr inbounds float, float addrspace(1)* %6, i64 96
  %545 = load float, float addrspace(1)* %544, align 4, !tbaa !5
  %546 = fsub contract float %541, %545
  %547 = fcmp contract ugt float %546, 0.000000e+00
  br i1 %547, label %548, label %704

548:                                              ; preds = %543
  %549 = getelementptr inbounds float, float addrspace(1)* %6, i64 97
  %550 = load float, float addrspace(1)* %549, align 4, !tbaa !5
  %551 = fsub contract float %546, %550
  %552 = fcmp contract ugt float %551, 0.000000e+00
  br i1 %552, label %553, label %704

553:                                              ; preds = %548
  %554 = getelementptr inbounds float, float addrspace(1)* %6, i64 98
  %555 = load float, float addrspace(1)* %554, align 4, !tbaa !5
  %556 = fsub contract float %551, %555
  %557 = fcmp contract ugt float %556, 0.000000e+00
  br i1 %557, label %558, label %704

558:                                              ; preds = %553
  %559 = getelementptr inbounds float, float addrspace(1)* %6, i64 99
  %560 = load float, float addrspace(1)* %559, align 4, !tbaa !5
  %561 = fsub contract float %556, %560
  %562 = fcmp contract ugt float %561, 0.000000e+00
  br i1 %562, label %563, label %704

563:                                              ; preds = %558
  %564 = getelementptr inbounds float, float addrspace(1)* %6, i64 100
  %565 = load float, float addrspace(1)* %564, align 4, !tbaa !5
  %566 = fsub contract float %561, %565
  %567 = fcmp contract ugt float %566, 0.000000e+00
  br i1 %567, label %568, label %704

568:                                              ; preds = %563
  %569 = getelementptr inbounds float, float addrspace(1)* %6, i64 101
  %570 = load float, float addrspace(1)* %569, align 4, !tbaa !5
  %571 = fsub contract float %566, %570
  %572 = fcmp contract ugt float %571, 0.000000e+00
  br i1 %572, label %573, label %704

573:                                              ; preds = %568
  %574 = getelementptr inbounds float, float addrspace(1)* %6, i64 102
  %575 = load float, float addrspace(1)* %574, align 4, !tbaa !5
  %576 = fsub contract float %571, %575
  %577 = fcmp contract ugt float %576, 0.000000e+00
  br i1 %577, label %578, label %704

578:                                              ; preds = %573
  %579 = getelementptr inbounds float, float addrspace(1)* %6, i64 103
  %580 = load float, float addrspace(1)* %579, align 4, !tbaa !5
  %581 = fsub contract float %576, %580
  %582 = fcmp contract ugt float %581, 0.000000e+00
  br i1 %582, label %583, label %704

583:                                              ; preds = %578
  %584 = getelementptr inbounds float, float addrspace(1)* %6, i64 104
  %585 = load float, float addrspace(1)* %584, align 4, !tbaa !5
  %586 = fsub contract float %581, %585
  %587 = fcmp contract ugt float %586, 0.000000e+00
  br i1 %587, label %588, label %704

588:                                              ; preds = %583
  %589 = getelementptr inbounds float, float addrspace(1)* %6, i64 105
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !5
  %591 = fsub contract float %586, %590
  %592 = fcmp contract ugt float %591, 0.000000e+00
  br i1 %592, label %593, label %704

593:                                              ; preds = %588
  %594 = getelementptr inbounds float, float addrspace(1)* %6, i64 106
  %595 = load float, float addrspace(1)* %594, align 4, !tbaa !5
  %596 = fsub contract float %591, %595
  %597 = fcmp contract ugt float %596, 0.000000e+00
  br i1 %597, label %598, label %704

598:                                              ; preds = %593
  %599 = getelementptr inbounds float, float addrspace(1)* %6, i64 107
  %600 = load float, float addrspace(1)* %599, align 4, !tbaa !5
  %601 = fsub contract float %596, %600
  %602 = fcmp contract ugt float %601, 0.000000e+00
  br i1 %602, label %603, label %704

603:                                              ; preds = %598
  %604 = getelementptr inbounds float, float addrspace(1)* %6, i64 108
  %605 = load float, float addrspace(1)* %604, align 4, !tbaa !5
  %606 = fsub contract float %601, %605
  %607 = fcmp contract ugt float %606, 0.000000e+00
  br i1 %607, label %608, label %704

608:                                              ; preds = %603
  %609 = getelementptr inbounds float, float addrspace(1)* %6, i64 109
  %610 = load float, float addrspace(1)* %609, align 4, !tbaa !5
  %611 = fsub contract float %606, %610
  %612 = fcmp contract ugt float %611, 0.000000e+00
  br i1 %612, label %613, label %704

613:                                              ; preds = %608
  %614 = getelementptr inbounds float, float addrspace(1)* %6, i64 110
  %615 = load float, float addrspace(1)* %614, align 4, !tbaa !5
  %616 = fsub contract float %611, %615
  %617 = fcmp contract ugt float %616, 0.000000e+00
  br i1 %617, label %618, label %704

618:                                              ; preds = %613
  %619 = getelementptr inbounds float, float addrspace(1)* %6, i64 111
  %620 = load float, float addrspace(1)* %619, align 4, !tbaa !5
  %621 = fsub contract float %616, %620
  %622 = fcmp contract ugt float %621, 0.000000e+00
  br i1 %622, label %623, label %704

623:                                              ; preds = %618
  %624 = getelementptr inbounds float, float addrspace(1)* %6, i64 112
  %625 = load float, float addrspace(1)* %624, align 4, !tbaa !5
  %626 = fsub contract float %621, %625
  %627 = fcmp contract ugt float %626, 0.000000e+00
  br i1 %627, label %628, label %704

628:                                              ; preds = %623
  %629 = getelementptr inbounds float, float addrspace(1)* %6, i64 113
  %630 = load float, float addrspace(1)* %629, align 4, !tbaa !5
  %631 = fsub contract float %626, %630
  %632 = fcmp contract ugt float %631, 0.000000e+00
  br i1 %632, label %633, label %704

633:                                              ; preds = %628
  %634 = getelementptr inbounds float, float addrspace(1)* %6, i64 114
  %635 = load float, float addrspace(1)* %634, align 4, !tbaa !5
  %636 = fsub contract float %631, %635
  %637 = fcmp contract ugt float %636, 0.000000e+00
  br i1 %637, label %638, label %704

638:                                              ; preds = %633
  %639 = getelementptr inbounds float, float addrspace(1)* %6, i64 115
  %640 = load float, float addrspace(1)* %639, align 4, !tbaa !5
  %641 = fsub contract float %636, %640
  %642 = fcmp contract ugt float %641, 0.000000e+00
  br i1 %642, label %643, label %704

643:                                              ; preds = %638
  %644 = getelementptr inbounds float, float addrspace(1)* %6, i64 116
  %645 = load float, float addrspace(1)* %644, align 4, !tbaa !5
  %646 = fsub contract float %641, %645
  %647 = fcmp contract ugt float %646, 0.000000e+00
  br i1 %647, label %648, label %704

648:                                              ; preds = %643
  %649 = getelementptr inbounds float, float addrspace(1)* %6, i64 117
  %650 = load float, float addrspace(1)* %649, align 4, !tbaa !5
  %651 = fsub contract float %646, %650
  %652 = fcmp contract ugt float %651, 0.000000e+00
  br i1 %652, label %653, label %704

653:                                              ; preds = %648
  %654 = getelementptr inbounds float, float addrspace(1)* %6, i64 118
  %655 = load float, float addrspace(1)* %654, align 4, !tbaa !5
  %656 = fsub contract float %651, %655
  %657 = fcmp contract ugt float %656, 0.000000e+00
  br i1 %657, label %658, label %704

658:                                              ; preds = %653
  %659 = getelementptr inbounds float, float addrspace(1)* %6, i64 119
  %660 = load float, float addrspace(1)* %659, align 4, !tbaa !5
  %661 = fsub contract float %656, %660
  %662 = fcmp contract ugt float %661, 0.000000e+00
  br i1 %662, label %663, label %704

663:                                              ; preds = %658
  %664 = getelementptr inbounds float, float addrspace(1)* %6, i64 120
  %665 = load float, float addrspace(1)* %664, align 4, !tbaa !5
  %666 = fsub contract float %661, %665
  %667 = fcmp contract ugt float %666, 0.000000e+00
  br i1 %667, label %668, label %704

668:                                              ; preds = %663
  %669 = getelementptr inbounds float, float addrspace(1)* %6, i64 121
  %670 = load float, float addrspace(1)* %669, align 4, !tbaa !5
  %671 = fsub contract float %666, %670
  %672 = fcmp contract ugt float %671, 0.000000e+00
  br i1 %672, label %673, label %704

673:                                              ; preds = %668
  %674 = getelementptr inbounds float, float addrspace(1)* %6, i64 122
  %675 = load float, float addrspace(1)* %674, align 4, !tbaa !5
  %676 = fsub contract float %671, %675
  %677 = fcmp contract ugt float %676, 0.000000e+00
  br i1 %677, label %678, label %704

678:                                              ; preds = %673
  %679 = getelementptr inbounds float, float addrspace(1)* %6, i64 123
  %680 = load float, float addrspace(1)* %679, align 4, !tbaa !5
  %681 = fsub contract float %676, %680
  %682 = fcmp contract ugt float %681, 0.000000e+00
  br i1 %682, label %683, label %704

683:                                              ; preds = %678
  %684 = getelementptr inbounds float, float addrspace(1)* %6, i64 124
  %685 = load float, float addrspace(1)* %684, align 4, !tbaa !5
  %686 = fsub contract float %681, %685
  %687 = fcmp contract ugt float %686, 0.000000e+00
  br i1 %687, label %688, label %704

688:                                              ; preds = %683
  %689 = getelementptr inbounds float, float addrspace(1)* %6, i64 125
  %690 = load float, float addrspace(1)* %689, align 4, !tbaa !5
  %691 = fsub contract float %686, %690
  %692 = fcmp contract ugt float %691, 0.000000e+00
  br i1 %692, label %693, label %704

693:                                              ; preds = %688
  %694 = getelementptr inbounds float, float addrspace(1)* %6, i64 126
  %695 = load float, float addrspace(1)* %694, align 4, !tbaa !5
  %696 = fsub contract float %691, %695
  %697 = fcmp contract ugt float %696, 0.000000e+00
  br i1 %697, label %698, label %704

698:                                              ; preds = %693
  %699 = getelementptr inbounds float, float addrspace(1)* %6, i64 127
  %700 = load float, float addrspace(1)* %699, align 4, !tbaa !5
  %701 = fsub contract float %696, %700
  %702 = fcmp contract ugt float %701, 0.000000e+00
  br i1 %702, label %703, label %704

703:                                              ; preds = %698
  br label %704

704:                                              ; preds = %703, %698, %693, %688, %683, %678, %673, %668, %663, %658, %653, %648, %643, %638, %633, %628, %623, %618, %613, %608, %603, %598, %593, %588, %583, %578, %573, %568, %563, %558, %553, %548, %543, %538, %533, %528, %523, %518, %513, %508, %503, %498, %493, %488, %483, %478, %473, %468, %463, %458, %453, %448, %443, %438, %433, %428, %423, %418, %413, %408, %403, %398, %393, %388, %383, %378, %373, %368, %363, %358, %353, %348, %343, %338, %333, %328, %323, %318, %313, %308, %303, %298, %293, %288, %283, %278, %273, %268, %263, %258, %253, %248, %243, %238, %233, %228, %223, %218, %213, %208, %203, %198, %193, %188, %183, %178, %173, %168, %163, %158, %153, %148, %143, %138, %133, %128, %123, %118, %113, %108, %103, %98, %93, %88, %83, %78, %73, %68, %42
  %705 = phi i32 [ 0, %42 ], [ 1, %68 ], [ 2, %73 ], [ 3, %78 ], [ 4, %83 ], [ 5, %88 ], [ 6, %93 ], [ 7, %98 ], [ 8, %103 ], [ 9, %108 ], [ 10, %113 ], [ 11, %118 ], [ 12, %123 ], [ 13, %128 ], [ 14, %133 ], [ 15, %138 ], [ 16, %143 ], [ 17, %148 ], [ 18, %153 ], [ 19, %158 ], [ 20, %163 ], [ 21, %168 ], [ 22, %173 ], [ 23, %178 ], [ 24, %183 ], [ 25, %188 ], [ 26, %193 ], [ 27, %198 ], [ 28, %203 ], [ 29, %208 ], [ 30, %213 ], [ 31, %218 ], [ 32, %223 ], [ 33, %228 ], [ 34, %233 ], [ 35, %238 ], [ 36, %243 ], [ 37, %248 ], [ 38, %253 ], [ 39, %258 ], [ 40, %263 ], [ 41, %268 ], [ 42, %273 ], [ 43, %278 ], [ 44, %283 ], [ 45, %288 ], [ 46, %293 ], [ 47, %298 ], [ 48, %303 ], [ 49, %308 ], [ 50, %313 ], [ 51, %318 ], [ 52, %323 ], [ 53, %328 ], [ 54, %333 ], [ 55, %338 ], [ 56, %343 ], [ 57, %348 ], [ 58, %353 ], [ 59, %358 ], [ 60, %363 ], [ 61, %368 ], [ 62, %373 ], [ 63, %378 ], [ 64, %383 ], [ 65, %388 ], [ 66, %393 ], [ 67, %398 ], [ 68, %403 ], [ 69, %408 ], [ 70, %413 ], [ 71, %418 ], [ 72, %423 ], [ 73, %428 ], [ 74, %433 ], [ 75, %438 ], [ 76, %443 ], [ 77, %448 ], [ 78, %453 ], [ 79, %458 ], [ 80, %463 ], [ 81, %468 ], [ 82, %473 ], [ 83, %478 ], [ 84, %483 ], [ 85, %488 ], [ 86, %493 ], [ 87, %498 ], [ 88, %503 ], [ 89, %508 ], [ 90, %513 ], [ 91, %518 ], [ 92, %523 ], [ 93, %528 ], [ 94, %533 ], [ 95, %538 ], [ 96, %543 ], [ 97, %548 ], [ 98, %553 ], [ 99, %558 ], [ 100, %563 ], [ 101, %568 ], [ 102, %573 ], [ 103, %578 ], [ 104, %583 ], [ 105, %588 ], [ 106, %593 ], [ 107, %598 ], [ 108, %603 ], [ 109, %608 ], [ 110, %613 ], [ 111, %618 ], [ 112, %623 ], [ 113, %628 ], [ 114, %633 ], [ 115, %638 ], [ 116, %643 ], [ 117, %648 ], [ 118, %653 ], [ 119, %658 ], [ 120, %663 ], [ 121, %668 ], [ 122, %673 ], [ 123, %678 ], [ 124, %683 ], [ 125, %688 ], [ 126, %693 ], [ 127, %698 ], [ 128, %703 ]
  %706 = mul nuw nsw i32 %705, 10
  %707 = mul nuw nsw i32 %9, 10
  %708 = zext i32 %706 to i64
  %709 = getelementptr inbounds float, float addrspace(1)* %1, i64 %708
  %710 = load float, float addrspace(1)* %709, align 4, !tbaa !5
  %711 = zext i32 %707 to i64
  %712 = getelementptr inbounds float, float addrspace(1)* %0, i64 %711
  store float %710, float addrspace(1)* %712, align 4, !tbaa !5
  %713 = or i32 %706, 1
  %714 = zext i32 %713 to i64
  %715 = getelementptr inbounds float, float addrspace(1)* %1, i64 %714
  %716 = load float, float addrspace(1)* %715, align 4, !tbaa !5
  %717 = or i32 %707, 1
  %718 = zext i32 %717 to i64
  %719 = getelementptr inbounds float, float addrspace(1)* %0, i64 %718
  store float %716, float addrspace(1)* %719, align 4, !tbaa !5
  %720 = add nuw nsw i32 %706, 2
  %721 = zext i32 %720 to i64
  %722 = getelementptr inbounds float, float addrspace(1)* %1, i64 %721
  %723 = load float, float addrspace(1)* %722, align 4, !tbaa !5
  %724 = add nuw nsw i32 %707, 2
  %725 = zext i32 %724 to i64
  %726 = getelementptr inbounds float, float addrspace(1)* %0, i64 %725
  store float %723, float addrspace(1)* %726, align 4, !tbaa !5
  %727 = add nuw nsw i32 %706, 3
  %728 = zext i32 %727 to i64
  %729 = getelementptr inbounds float, float addrspace(1)* %1, i64 %728
  %730 = load float, float addrspace(1)* %729, align 4, !tbaa !5
  %731 = add nuw nsw i32 %707, 3
  %732 = zext i32 %731 to i64
  %733 = getelementptr inbounds float, float addrspace(1)* %0, i64 %732
  store float %730, float addrspace(1)* %733, align 4, !tbaa !5
  %734 = add nuw nsw i32 %706, 4
  %735 = zext i32 %734 to i64
  %736 = getelementptr inbounds float, float addrspace(1)* %1, i64 %735
  %737 = load float, float addrspace(1)* %736, align 4, !tbaa !5
  %738 = add nuw nsw i32 %707, 4
  %739 = zext i32 %738 to i64
  %740 = getelementptr inbounds float, float addrspace(1)* %0, i64 %739
  store float %737, float addrspace(1)* %740, align 4, !tbaa !5
  %741 = add nuw nsw i32 %706, 5
  %742 = zext i32 %741 to i64
  %743 = getelementptr inbounds float, float addrspace(1)* %1, i64 %742
  %744 = load float, float addrspace(1)* %743, align 4, !tbaa !5
  %745 = add nuw nsw i32 %707, 5
  %746 = zext i32 %745 to i64
  %747 = getelementptr inbounds float, float addrspace(1)* %0, i64 %746
  store float %744, float addrspace(1)* %747, align 4, !tbaa !5
  %748 = add nuw nsw i32 %706, 6
  %749 = zext i32 %748 to i64
  %750 = getelementptr inbounds float, float addrspace(1)* %1, i64 %749
  %751 = load float, float addrspace(1)* %750, align 4, !tbaa !5
  %752 = add nuw nsw i32 %707, 6
  %753 = zext i32 %752 to i64
  %754 = getelementptr inbounds float, float addrspace(1)* %0, i64 %753
  store float %751, float addrspace(1)* %754, align 4, !tbaa !5
  %755 = add nuw nsw i32 %706, 7
  %756 = zext i32 %755 to i64
  %757 = getelementptr inbounds float, float addrspace(1)* %1, i64 %756
  %758 = load float, float addrspace(1)* %757, align 4, !tbaa !5
  %759 = add nuw nsw i32 %707, 7
  %760 = zext i32 %759 to i64
  %761 = getelementptr inbounds float, float addrspace(1)* %0, i64 %760
  store float %758, float addrspace(1)* %761, align 4, !tbaa !5
  %762 = add nuw nsw i32 %706, 8
  %763 = zext i32 %762 to i64
  %764 = getelementptr inbounds float, float addrspace(1)* %1, i64 %763
  %765 = load float, float addrspace(1)* %764, align 4, !tbaa !5
  %766 = add nuw nsw i32 %707, 8
  %767 = zext i32 %766 to i64
  %768 = getelementptr inbounds float, float addrspace(1)* %0, i64 %767
  store float %765, float addrspace(1)* %768, align 4, !tbaa !5
  %769 = add nuw nsw i32 %706, 9
  %770 = zext i32 %769 to i64
  %771 = getelementptr inbounds float, float addrspace(1)* %1, i64 %770
  %772 = load float, float addrspace(1)* %771, align 4, !tbaa !5
  %773 = add nuw nsw i32 %707, 9
  %774 = zext i32 %773 to i64
  %775 = getelementptr inbounds float, float addrspace(1)* %0, i64 %774
  store float %772, float addrspace(1)* %775, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %776 = zext i32 %705 to i64
  %777 = getelementptr inbounds float, float addrspace(1)* %4, i64 %776
  %778 = load float, float addrspace(1)* %777, align 4, !tbaa !5
  %779 = getelementptr inbounds float, float addrspace(1)* %2, i64 %10
  store float %778, float addrspace(1)* %779, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
