; ModuleID = '../data/hip_kernels/11654/39/main.cu'
source_filename = "../data/hip_kernels/11654/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13rgamma_kernelP12hiprandStateiPfiff(%struct.hiprandState addrspace(1)* %0, i32 %1, float addrspace(1)* nocapture writeonly %2, i32 %3, float %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %7
  %24 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !13, !invariant.load !14
  %27 = zext i16 %26 to i32
  %28 = getelementptr i8, i8 addrspace(4)* %9, i64 8
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 4, !range !13, !invariant.load !14
  %31 = zext i16 %30 to i32
  %32 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %33 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %34 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %35 = mul i32 %23, %31
  %36 = add i32 %35, %32
  %37 = mul i32 %36, %27
  %38 = add i32 %37, %33
  %39 = mul i32 %38, %16
  %40 = add i32 %39, %34
  %41 = icmp slt i32 %40, %1
  br i1 %41, label %42, label %891

42:                                               ; preds = %6
  %43 = freeze i32 %3
  %44 = freeze i32 %1
  %45 = sdiv i32 %43, %44
  %46 = mul i32 %45, %44
  %47 = sub i32 %43, %46
  %48 = add nsw i32 %45, 1
  %49 = icmp slt i32 %40, %47
  br i1 %49, label %50, label %52

50:                                               ; preds = %42
  %51 = mul nsw i32 %48, %40
  br label %57

52:                                               ; preds = %42
  %53 = mul nsw i32 %48, %47
  %54 = sub nsw i32 %40, %47
  %55 = mul nsw i32 %45, %54
  %56 = add nsw i32 %53, %55
  br label %57

57:                                               ; preds = %52, %50
  %58 = phi i32 [ %48, %50 ], [ %45, %52 ]
  %59 = phi i32 [ %51, %50 ], [ %56, %52 ]
  %60 = icmp sgt i32 %58, 0
  br i1 %60, label %61, label %891

61:                                               ; preds = %57
  %62 = fpext float %4 to double
  %63 = fcmp contract olt float %4, 1.000000e+00
  %64 = fadd contract float %4, -5.000000e-01
  %65 = fcmp olt float %64, 0x39F0000000000000
  %66 = select i1 %65, float 0x41F0000000000000, float 1.000000e+00
  %67 = fmul float %64, %66
  %68 = tail call float @llvm.sqrt.f32(float %67)
  %69 = bitcast float %68 to i32
  %70 = add nsw i32 %69, -1
  %71 = bitcast i32 %70 to float
  %72 = add nsw i32 %69, 1
  %73 = bitcast i32 %72 to float
  %74 = tail call i1 @llvm.amdgcn.class.f32(float %67, i32 608)
  %75 = select i1 %65, float 0x3EF0000000000000, float 1.000000e+00
  %76 = fneg float %73
  %77 = tail call float @llvm.fma.f32(float %76, float %68, float %67)
  %78 = fcmp ogt float %77, 0.000000e+00
  %79 = fneg float %71
  %80 = tail call float @llvm.fma.f32(float %79, float %68, float %67)
  %81 = fcmp ole float %80, 0.000000e+00
  %82 = select i1 %81, float %71, float %68
  %83 = select i1 %78, float %73, float %82
  %84 = fmul float %75, %83
  %85 = select i1 %74, float %67, float %84
  %86 = fpext float %85 to double
  %87 = fmul contract double %86, 1.200000e+01
  %88 = fsub contract double 0x4016A09E60000000, %87
  %89 = fptrunc double %88 to float
  %90 = sext i32 %40 to i64
  %91 = getelementptr %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 1
  %92 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 3
  %93 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 5, i64 0
  %94 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 5, i64 1
  %95 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 5, i64 2
  %96 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 5, i64 3
  %97 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 5, i64 4
  %98 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 0
  %99 = fdiv contract float 1.000000e+00, %4
  %100 = fmul contract float %99, 0x3F2FC59820000000
  %101 = fadd contract float %100, 0x3F30104360000000
  %102 = fmul contract float %99, %101
  %103 = fadd contract float %102, 0xBF135E00C0000000
  %104 = fmul contract float %99, %103
  %105 = fadd contract float %104, 0x3F579CDF80000000
  %106 = fmul contract float %99, %105
  %107 = fadd contract float %106, 0x3F80688C60000000
  %108 = fmul contract float %99, %107
  %109 = fadd contract float %108, 0x3F9554D900000000
  %110 = fmul contract float %99, %109
  %111 = fadd contract float %110, 0x3FA5555620000000
  %112 = fmul contract float %99, %111
  %113 = fcmp contract ugt double %62, 3.686000e+00
  %114 = fcmp contract ugt double %62, 1.302200e+01
  %115 = fcmp contract oeq float %4, 0.000000e+00
  %116 = fmul contract float %4, 0x3FD78B5640000000
  %117 = fadd contract float %116, 1.000000e+00
  %118 = fsub contract double 1.000000e+00, %62
  br label %119

119:                                              ; preds = %61, %875
  %120 = phi i32 [ 0, %61 ], [ %889, %875 ]
  %121 = phi float [ undef, %61 ], [ %885, %875 ]
  %122 = phi float [ undef, %61 ], [ %884, %875 ]
  %123 = phi float [ undef, %61 ], [ %883, %875 ]
  %124 = phi float [ undef, %61 ], [ %882, %875 ]
  %125 = phi float [ undef, %61 ], [ %881, %875 ]
  %126 = phi float [ undef, %61 ], [ %880, %875 ]
  %127 = phi float [ undef, %61 ], [ %879, %875 ]
  %128 = phi float [ 0.000000e+00, %61 ], [ %878, %875 ]
  %129 = phi float [ 0.000000e+00, %61 ], [ %877, %875 ]
  br i1 %63, label %130, label %345

130:                                              ; preds = %119
  br i1 %115, label %875, label %131

131:                                              ; preds = %130
  %132 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !16
  br label %133

133:                                              ; preds = %339, %131
  %134 = phi i32 [ %132, %131 ], [ %209, %339 ]
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %138, label %136

136:                                              ; preds = %133
  store i32 0, i32 addrspace(1)* %91, align 4, !tbaa !16
  %137 = load float, float addrspace(1)* %92, align 4, !tbaa !24
  br label %208

138:                                              ; preds = %133
  %139 = load i32, i32 addrspace(1)* %93, align 8, !tbaa !25
  %140 = lshr i32 %139, 2
  %141 = xor i32 %140, %139
  %142 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !25
  %143 = load i32, i32 addrspace(1)* %95, align 8, !tbaa !25
  %144 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !25
  %145 = load i32, i32 addrspace(1)* %97, align 8, !tbaa !25
  %146 = shl i32 %145, 4
  %147 = shl i32 %141, 1
  %148 = xor i32 %147, %146
  %149 = xor i32 %148, %141
  %150 = xor i32 %149, %145
  %151 = load i32, i32 addrspace(1)* %98, align 8, !tbaa !26
  %152 = add i32 %151, 362437
  %153 = add i32 %152, %150
  %154 = lshr i32 %142, 2
  %155 = xor i32 %154, %142
  store i32 %143, i32 addrspace(1)* %93, align 8, !tbaa !25
  store i32 %144, i32 addrspace(1)* %94, align 4, !tbaa !25
  store i32 %145, i32 addrspace(1)* %95, align 8, !tbaa !25
  store i32 %150, i32 addrspace(1)* %96, align 4, !tbaa !25
  %156 = shl i32 %150, 4
  %157 = shl i32 %155, 1
  %158 = xor i32 %157, %156
  %159 = xor i32 %158, %155
  %160 = xor i32 %159, %150
  store i32 %160, i32 addrspace(1)* %97, align 8, !tbaa !25
  %161 = add i32 %151, 724874
  store i32 %161, i32 addrspace(1)* %98, align 8, !tbaa !26
  %162 = add i32 %160, %161
  %163 = uitofp i32 %153 to float
  %164 = fmul contract float %163, 0x3DF0000000000000
  %165 = fadd contract float %164, 0x3DF0000000000000
  %166 = uitofp i32 %162 to float
  %167 = fmul contract float %166, 0x3E1921FB60000000
  %168 = fadd contract float %167, 0x3E1921FB60000000
  %169 = tail call i1 @llvm.amdgcn.class.f32(float %165, i32 144)
  %170 = select i1 %169, float 0x41F0000000000000, float 1.000000e+00
  %171 = fmul float %165, %170
  %172 = tail call float @llvm.log2.f32(float %171)
  %173 = fmul float %172, 0x3FE62E42E0000000
  %174 = tail call i1 @llvm.amdgcn.class.f32(float %172, i32 519)
  %175 = fneg float %173
  %176 = tail call float @llvm.fma.f32(float %172, float 0x3FE62E42E0000000, float %175)
  %177 = tail call float @llvm.fma.f32(float %172, float 0x3E6EFA39E0000000, float %176)
  %178 = fadd float %173, %177
  %179 = select i1 %174, float %172, float %178
  %180 = select i1 %169, float 0x40362E4300000000, float 0.000000e+00
  %181 = fsub float %179, %180
  %182 = fmul contract float %181, -2.000000e+00
  %183 = fcmp olt float %182, 0x39F0000000000000
  %184 = select i1 %183, float 0x41F0000000000000, float 1.000000e+00
  %185 = fmul float %182, %184
  %186 = tail call float @llvm.sqrt.f32(float %185)
  %187 = bitcast float %186 to i32
  %188 = add nsw i32 %187, -1
  %189 = bitcast i32 %188 to float
  %190 = add nsw i32 %187, 1
  %191 = bitcast i32 %190 to float
  %192 = tail call i1 @llvm.amdgcn.class.f32(float %185, i32 608)
  %193 = select i1 %183, float 0x3EF0000000000000, float 1.000000e+00
  %194 = fneg float %191
  %195 = tail call float @llvm.fma.f32(float %194, float %186, float %185)
  %196 = fcmp ogt float %195, 0.000000e+00
  %197 = fneg float %189
  %198 = tail call float @llvm.fma.f32(float %197, float %186, float %185)
  %199 = fcmp ole float %198, 0.000000e+00
  %200 = select i1 %199, float %189, float %186
  %201 = select i1 %196, float %191, float %200
  %202 = fmul float %193, %201
  %203 = select i1 %192, float %185, float %202
  %204 = tail call float @llvm.sin.f32(float %168)
  %205 = tail call float @llvm.cos.f32(float %168)
  %206 = fmul contract float %204, %203
  %207 = fmul contract float %205, %203
  store i32 1, i32 addrspace(1)* %91, align 4, !tbaa !16
  store float %207, float addrspace(1)* %92, align 4, !tbaa !24
  br label %208

208:                                              ; preds = %136, %138
  %209 = phi i32 [ 0, %136 ], [ 1, %138 ]
  %210 = phi float [ %137, %136 ], [ %206, %138 ]
  %211 = fmul contract float %117, %210
  %212 = fcmp contract ult float %211, 1.000000e+00
  br i1 %212, label %278, label %213

213:                                              ; preds = %208
  %214 = fsub contract float %117, %211
  %215 = fdiv contract float %214, %4
  %216 = tail call i1 @llvm.amdgcn.class.f32(float %215, i32 144)
  %217 = select i1 %216, float 0x41F0000000000000, float 1.000000e+00
  %218 = fmul float %215, %217
  %219 = tail call float @llvm.log2.f32(float %218)
  %220 = fmul float %219, 0x3FE62E42E0000000
  %221 = tail call i1 @llvm.amdgcn.class.f32(float %219, i32 519)
  %222 = fneg float %220
  %223 = tail call float @llvm.fma.f32(float %219, float 0x3FE62E42E0000000, float %222)
  %224 = tail call float @llvm.fma.f32(float %219, float 0x3E6EFA39E0000000, float %223)
  %225 = fadd float %220, %224
  %226 = select i1 %221, float %219, float %225
  %227 = select i1 %216, float 0x40362E4300000000, float 0.000000e+00
  %228 = fsub float %226, %227
  %229 = fneg contract float %228
  %230 = load i32, i32 addrspace(1)* %93, align 8, !tbaa !25
  %231 = lshr i32 %230, 2
  %232 = xor i32 %231, %230
  %233 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !25
  store i32 %233, i32 addrspace(1)* %93, align 8, !tbaa !25
  %234 = load i32, i32 addrspace(1)* %95, align 8, !tbaa !25
  store i32 %234, i32 addrspace(1)* %94, align 4, !tbaa !25
  %235 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !25
  store i32 %235, i32 addrspace(1)* %95, align 8, !tbaa !25
  %236 = load i32, i32 addrspace(1)* %97, align 8, !tbaa !25
  store i32 %236, i32 addrspace(1)* %96, align 4, !tbaa !25
  %237 = shl i32 %236, 4
  %238 = shl i32 %232, 1
  %239 = xor i32 %238, %237
  %240 = xor i32 %239, %232
  %241 = xor i32 %240, %236
  store i32 %241, i32 addrspace(1)* %97, align 8, !tbaa !25
  %242 = load i32, i32 addrspace(1)* %98, align 8, !tbaa !26
  %243 = add i32 %242, 362437
  store i32 %243, i32 addrspace(1)* %98, align 8, !tbaa !26
  %244 = add i32 %243, %241
  %245 = uitofp i32 %244 to float
  %246 = fmul contract float %245, 0x3DF0000000000000
  %247 = fadd contract float %246, 0x3DF0000000000000
  %248 = tail call i1 @llvm.amdgcn.class.f32(float %247, i32 144)
  %249 = select i1 %248, float 0x41F0000000000000, float 1.000000e+00
  %250 = fmul float %247, %249
  %251 = tail call float @llvm.log2.f32(float %250)
  %252 = fmul float %251, 0x3FE62E42E0000000
  %253 = tail call i1 @llvm.amdgcn.class.f32(float %251, i32 519)
  %254 = fneg float %252
  %255 = tail call float @llvm.fma.f32(float %251, float 0x3FE62E42E0000000, float %254)
  %256 = tail call float @llvm.fma.f32(float %251, float 0x3E6EFA39E0000000, float %255)
  %257 = fadd float %252, %256
  %258 = select i1 %253, float %251, float %257
  %259 = select i1 %248, float 0x40362E4300000000, float 0.000000e+00
  %260 = fsub float %258, %259
  %261 = fpext float %260 to double
  %262 = tail call i1 @llvm.amdgcn.class.f32(float %229, i32 144)
  %263 = select i1 %262, float 0x41F0000000000000, float 1.000000e+00
  %264 = fmul float %263, %229
  %265 = tail call float @llvm.log2.f32(float %264)
  %266 = fmul float %265, 0x3FE62E42E0000000
  %267 = tail call i1 @llvm.amdgcn.class.f32(float %265, i32 519)
  %268 = fneg float %266
  %269 = tail call float @llvm.fma.f32(float %265, float 0x3FE62E42E0000000, float %268)
  %270 = tail call float @llvm.fma.f32(float %265, float 0x3E6EFA39E0000000, float %269)
  %271 = fadd float %266, %270
  %272 = select i1 %267, float %265, float %271
  %273 = select i1 %262, float 0x40362E4300000000, float 0.000000e+00
  %274 = fsub float %272, %273
  %275 = fpext float %274 to double
  %276 = fmul contract double %118, %275
  %277 = fcmp contract ult double %276, %261
  br i1 %277, label %339, label %340

278:                                              ; preds = %208
  %279 = tail call i1 @llvm.amdgcn.class.f32(float %211, i32 144)
  %280 = select i1 %279, float 0x41F0000000000000, float 1.000000e+00
  %281 = fmul float %211, %280
  %282 = tail call float @llvm.log2.f32(float %281)
  %283 = fmul float %282, 0x3FE62E42E0000000
  %284 = tail call i1 @llvm.amdgcn.class.f32(float %282, i32 519)
  %285 = fneg float %283
  %286 = tail call float @llvm.fma.f32(float %282, float 0x3FE62E42E0000000, float %285)
  %287 = tail call float @llvm.fma.f32(float %282, float 0x3E6EFA39E0000000, float %286)
  %288 = fadd float %283, %287
  %289 = select i1 %284, float %282, float %288
  %290 = select i1 %279, float 0x40362E4300000000, float 0.000000e+00
  %291 = fsub float %289, %290
  %292 = fdiv contract float %291, %4
  %293 = fmul float %292, 0x3FF7154760000000
  %294 = tail call float @llvm.rint.f32(float %293)
  %295 = fcmp ogt float %292, 0x40562E4300000000
  %296 = fcmp olt float %292, 0xC059D1DA00000000
  %297 = fneg float %293
  %298 = tail call float @llvm.fma.f32(float %292, float 0x3FF7154760000000, float %297)
  %299 = tail call float @llvm.fma.f32(float %292, float 0x3E54AE0BE0000000, float %298)
  %300 = fsub float %293, %294
  %301 = fadd float %299, %300
  %302 = tail call float @llvm.exp2.f32(float %301)
  %303 = fptosi float %294 to i32
  %304 = tail call float @llvm.amdgcn.ldexp.f32(float %302, i32 %303)
  %305 = select i1 %296, float 0.000000e+00, float %304
  %306 = select i1 %295, float 0x7FF0000000000000, float %305
  %307 = load i32, i32 addrspace(1)* %93, align 8, !tbaa !25
  %308 = lshr i32 %307, 2
  %309 = xor i32 %308, %307
  %310 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !25
  store i32 %310, i32 addrspace(1)* %93, align 8, !tbaa !25
  %311 = load i32, i32 addrspace(1)* %95, align 8, !tbaa !25
  store i32 %311, i32 addrspace(1)* %94, align 4, !tbaa !25
  %312 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !25
  store i32 %312, i32 addrspace(1)* %95, align 8, !tbaa !25
  %313 = load i32, i32 addrspace(1)* %97, align 8, !tbaa !25
  store i32 %313, i32 addrspace(1)* %96, align 4, !tbaa !25
  %314 = shl i32 %313, 4
  %315 = shl i32 %309, 1
  %316 = xor i32 %315, %314
  %317 = xor i32 %316, %309
  %318 = xor i32 %317, %313
  store i32 %318, i32 addrspace(1)* %97, align 8, !tbaa !25
  %319 = load i32, i32 addrspace(1)* %98, align 8, !tbaa !26
  %320 = add i32 %319, 362437
  store i32 %320, i32 addrspace(1)* %98, align 8, !tbaa !26
  %321 = add i32 %320, %318
  %322 = uitofp i32 %321 to float
  %323 = fmul contract float %322, 0x3DF0000000000000
  %324 = fadd contract float %323, 0x3DF0000000000000
  %325 = tail call i1 @llvm.amdgcn.class.f32(float %324, i32 144)
  %326 = select i1 %325, float 0x41F0000000000000, float 1.000000e+00
  %327 = fmul float %324, %326
  %328 = tail call float @llvm.log2.f32(float %327)
  %329 = fmul float %328, 0x3FE62E42E0000000
  %330 = tail call i1 @llvm.amdgcn.class.f32(float %328, i32 519)
  %331 = fneg float %329
  %332 = tail call float @llvm.fma.f32(float %328, float 0x3FE62E42E0000000, float %331)
  %333 = tail call float @llvm.fma.f32(float %328, float 0x3E6EFA39E0000000, float %332)
  %334 = fadd float %329, %333
  %335 = select i1 %330, float %328, float %334
  %336 = select i1 %325, float 0x40362E4300000000, float 0.000000e+00
  %337 = fsub float %335, %336
  %338 = fcmp contract ugt float %337, %306
  br i1 %338, label %339, label %342

339:                                              ; preds = %278, %213
  br label %133, !llvm.loop !27

340:                                              ; preds = %213
  %341 = fneg contract float %228
  br label %342

342:                                              ; preds = %278, %340
  %343 = phi float [ %341, %340 ], [ %306, %278 ]
  %344 = fmul contract float %343, %5
  br label %875

345:                                              ; preds = %119
  %346 = fcmp contract une float %129, %4
  br i1 %346, label %347, label %348

347:                                              ; preds = %345
  br label %348

348:                                              ; preds = %347, %345
  %349 = phi float [ %4, %347 ], [ %129, %345 ]
  %350 = phi float [ %85, %347 ], [ %127, %345 ]
  %351 = phi float [ %64, %347 ], [ %126, %345 ]
  %352 = phi float [ %89, %347 ], [ %125, %345 ]
  %353 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !16
  %354 = icmp eq i32 %353, 0
  br i1 %354, label %357, label %355

355:                                              ; preds = %348
  store i32 0, i32 addrspace(1)* %91, align 4, !tbaa !16
  %356 = load float, float addrspace(1)* %92, align 4, !tbaa !24
  br label %427

357:                                              ; preds = %348
  %358 = load i32, i32 addrspace(1)* %93, align 8, !tbaa !25
  %359 = lshr i32 %358, 2
  %360 = xor i32 %359, %358
  %361 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !25
  %362 = load i32, i32 addrspace(1)* %95, align 8, !tbaa !25
  %363 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !25
  %364 = load i32, i32 addrspace(1)* %97, align 8, !tbaa !25
  %365 = shl i32 %364, 4
  %366 = shl i32 %360, 1
  %367 = xor i32 %366, %365
  %368 = xor i32 %367, %360
  %369 = xor i32 %368, %364
  %370 = load i32, i32 addrspace(1)* %98, align 8, !tbaa !26
  %371 = add i32 %370, 362437
  %372 = add i32 %371, %369
  %373 = lshr i32 %361, 2
  %374 = xor i32 %373, %361
  store i32 %362, i32 addrspace(1)* %93, align 8, !tbaa !25
  store i32 %363, i32 addrspace(1)* %94, align 4, !tbaa !25
  store i32 %364, i32 addrspace(1)* %95, align 8, !tbaa !25
  store i32 %369, i32 addrspace(1)* %96, align 4, !tbaa !25
  %375 = shl i32 %369, 4
  %376 = shl i32 %374, 1
  %377 = xor i32 %376, %375
  %378 = xor i32 %377, %374
  %379 = xor i32 %378, %369
  store i32 %379, i32 addrspace(1)* %97, align 8, !tbaa !25
  %380 = add i32 %370, 724874
  store i32 %380, i32 addrspace(1)* %98, align 8, !tbaa !26
  %381 = add i32 %379, %380
  %382 = uitofp i32 %372 to float
  %383 = fmul contract float %382, 0x3DF0000000000000
  %384 = fadd contract float %383, 0x3DF0000000000000
  %385 = uitofp i32 %381 to float
  %386 = fmul contract float %385, 0x3E1921FB60000000
  %387 = fadd contract float %386, 0x3E1921FB60000000
  %388 = tail call i1 @llvm.amdgcn.class.f32(float %384, i32 144)
  %389 = select i1 %388, float 0x41F0000000000000, float 1.000000e+00
  %390 = fmul float %384, %389
  %391 = tail call float @llvm.log2.f32(float %390)
  %392 = fmul float %391, 0x3FE62E42E0000000
  %393 = tail call i1 @llvm.amdgcn.class.f32(float %391, i32 519)
  %394 = fneg float %392
  %395 = tail call float @llvm.fma.f32(float %391, float 0x3FE62E42E0000000, float %394)
  %396 = tail call float @llvm.fma.f32(float %391, float 0x3E6EFA39E0000000, float %395)
  %397 = fadd float %392, %396
  %398 = select i1 %393, float %391, float %397
  %399 = select i1 %388, float 0x40362E4300000000, float 0.000000e+00
  %400 = fsub float %398, %399
  %401 = fmul contract float %400, -2.000000e+00
  %402 = fcmp olt float %401, 0x39F0000000000000
  %403 = select i1 %402, float 0x41F0000000000000, float 1.000000e+00
  %404 = fmul float %401, %403
  %405 = tail call float @llvm.sqrt.f32(float %404)
  %406 = bitcast float %405 to i32
  %407 = add nsw i32 %406, -1
  %408 = bitcast i32 %407 to float
  %409 = add nsw i32 %406, 1
  %410 = bitcast i32 %409 to float
  %411 = tail call i1 @llvm.amdgcn.class.f32(float %404, i32 608)
  %412 = select i1 %402, float 0x3EF0000000000000, float 1.000000e+00
  %413 = fneg float %410
  %414 = tail call float @llvm.fma.f32(float %413, float %405, float %404)
  %415 = fcmp ogt float %414, 0.000000e+00
  %416 = fneg float %408
  %417 = tail call float @llvm.fma.f32(float %416, float %405, float %404)
  %418 = fcmp ole float %417, 0.000000e+00
  %419 = select i1 %418, float %408, float %405
  %420 = select i1 %415, float %410, float %419
  %421 = fmul float %412, %420
  %422 = select i1 %411, float %404, float %421
  %423 = tail call float @llvm.sin.f32(float %387)
  %424 = tail call float @llvm.cos.f32(float %387)
  %425 = fmul contract float %423, %422
  %426 = fmul contract float %424, %422
  store i32 1, i32 addrspace(1)* %91, align 4, !tbaa !16
  store float %426, float addrspace(1)* %92, align 4, !tbaa !24
  br label %427

427:                                              ; preds = %355, %357
  %428 = phi float [ %356, %355 ], [ %425, %357 ]
  %429 = fpext float %350 to double
  %430 = fpext float %428 to double
  %431 = fmul contract double %430, 5.000000e-01
  %432 = fadd contract double %431, %429
  %433 = fptrunc double %432 to float
  %434 = fmul contract float %433, %433
  %435 = fcmp contract ult float %428, 0.000000e+00
  br i1 %435, label %438, label %436

436:                                              ; preds = %427
  %437 = fmul contract float %434, %5
  br label %875

438:                                              ; preds = %427
  %439 = load i32, i32 addrspace(1)* %93, align 8, !tbaa !25
  %440 = lshr i32 %439, 2
  %441 = xor i32 %440, %439
  %442 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !25
  store i32 %442, i32 addrspace(1)* %93, align 8, !tbaa !25
  %443 = load i32, i32 addrspace(1)* %95, align 8, !tbaa !25
  store i32 %443, i32 addrspace(1)* %94, align 4, !tbaa !25
  %444 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !25
  store i32 %444, i32 addrspace(1)* %95, align 8, !tbaa !25
  %445 = load i32, i32 addrspace(1)* %97, align 8, !tbaa !25
  store i32 %445, i32 addrspace(1)* %96, align 4, !tbaa !25
  %446 = shl i32 %445, 4
  %447 = shl i32 %441, 1
  %448 = xor i32 %447, %446
  %449 = xor i32 %448, %441
  %450 = xor i32 %449, %445
  store i32 %450, i32 addrspace(1)* %97, align 8, !tbaa !25
  %451 = load i32, i32 addrspace(1)* %98, align 8, !tbaa !26
  %452 = add i32 %451, 362437
  store i32 %452, i32 addrspace(1)* %98, align 8, !tbaa !26
  %453 = add i32 %452, %450
  %454 = uitofp i32 %453 to float
  %455 = fmul contract float %454, 0x3DF0000000000000
  %456 = fadd contract float %455, 0x3DF0000000000000
  %457 = fmul contract float %352, %456
  %458 = fmul contract float %428, %428
  %459 = fmul contract float %428, %458
  %460 = fcmp contract ugt float %457, %459
  br i1 %460, label %463, label %461

461:                                              ; preds = %438
  %462 = fmul contract float %434, %5
  br label %875

463:                                              ; preds = %438
  %464 = fcmp contract une float %128, %4
  br i1 %464, label %465, label %492

465:                                              ; preds = %463
  br i1 %113, label %477, label %466

466:                                              ; preds = %465
  %467 = fadd contract double %429, 4.630000e-01
  %468 = fpext float %351 to double
  %469 = fmul contract double %468, 1.780000e-01
  %470 = fadd contract double %467, %469
  %471 = fptrunc double %470 to float
  %472 = fdiv contract double 1.950000e-01, %429
  %473 = fadd contract double %472, -7.900000e-02
  %474 = fmul contract double %429, 1.600000e-01
  %475 = fadd contract double %474, %473
  %476 = fptrunc double %475 to float
  br label %492

477:                                              ; preds = %465
  br i1 %114, label %489, label %478

478:                                              ; preds = %477
  %479 = fpext float %351 to double
  %480 = fmul contract double %479, 0x3F7F212D77318FC5
  %481 = fadd contract double %480, 1.654000e+00
  %482 = fptrunc double %481 to float
  %483 = fdiv contract double 1.680000e+00, %429
  %484 = fadd contract double %483, 2.750000e-01
  %485 = fptrunc double %484 to float
  %486 = fdiv contract double 6.200000e-02, %429
  %487 = fadd contract double %486, 2.400000e-02
  %488 = fptrunc double %487 to float
  br label %492

489:                                              ; preds = %477
  %490 = fdiv contract double 1.515000e-01, %429
  %491 = fptrunc double %490 to float
  br label %492

492:                                              ; preds = %466, %489, %478, %463
  %493 = phi float [ %4, %466 ], [ %4, %478 ], [ %4, %489 ], [ %128, %463 ]
  %494 = phi float [ %112, %466 ], [ %112, %478 ], [ %112, %489 ], [ %124, %463 ]
  %495 = phi float [ %471, %466 ], [ %482, %478 ], [ 0x3FFC51EB80000000, %489 ], [ %123, %463 ]
  %496 = phi float [ 0x3FF3C28F60000000, %466 ], [ %485, %478 ], [ 7.500000e-01, %489 ], [ %122, %463 ]
  %497 = phi float [ %476, %466 ], [ %488, %478 ], [ %491, %489 ], [ %121, %463 ]
  %498 = fcmp contract ogt float %433, 0.000000e+00
  %499 = fadd contract float %350, %350
  br i1 %498, label %500, label %641

500:                                              ; preds = %492
  %501 = fdiv contract float %428, %499
  %502 = tail call float @llvm.fabs.f32(float %501)
  %503 = fcmp contract ugt float %502, 2.500000e-01
  br i1 %503, label %524, label %504

504:                                              ; preds = %500
  %505 = fpext float %494 to double
  %506 = fmul contract double %431, %430
  %507 = fmul contract float %501, 0x3FBF95CC80000000
  %508 = fadd contract float %507, 0xBFC17FF740000000
  %509 = fmul contract float %501, %508
  %510 = fadd contract float %509, 0x3FC2390A00000000
  %511 = fmul contract float %501, %510
  %512 = fadd contract float %511, 0xBFC5490F40000000
  %513 = fmul contract float %501, %512
  %514 = fadd contract float %513, 0x3FC999CDA0000000
  %515 = fmul contract float %501, %514
  %516 = fadd contract float %515, 0xBFD0000CA0000000
  %517 = fmul contract float %501, %516
  %518 = fadd contract float %517, 0x3FD5555540000000
  %519 = fpext float %518 to double
  %520 = fmul contract double %506, %519
  %521 = fpext float %501 to double
  %522 = fmul contract double %520, %521
  %523 = fadd contract double %522, %505
  br label %621

524:                                              ; preds = %500
  %525 = fmul contract float %350, %428
  %526 = fsub contract float %494, %525
  %527 = fpext float %526 to double
  %528 = fmul contract double %430, 2.500000e-01
  %529 = fmul contract double %528, %430
  %530 = fadd contract double %529, %527
  %531 = fadd contract float %351, %351
  %532 = fpext float %531 to double
  %533 = fpext float %501 to double
  %534 = fadd contract double %533, 1.000000e+00
  %535 = tail call double @llvm.amdgcn.frexp.mant.f64(double %534)
  %536 = fcmp olt double %535, 0x3FE5555555555555
  %537 = zext i1 %536 to i32
  %538 = tail call double @llvm.amdgcn.ldexp.f64(double %535, i32 %537)
  %539 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %534)
  %540 = sub nsw i32 %539, %537
  %541 = fadd double %538, -1.000000e+00
  %542 = fadd double %538, 1.000000e+00
  %543 = fadd double %542, -1.000000e+00
  %544 = fsub double %538, %543
  %545 = tail call double @llvm.amdgcn.rcp.f64(double %542)
  %546 = fneg double %542
  %547 = tail call double @llvm.fma.f64(double %546, double %545, double 1.000000e+00)
  %548 = tail call double @llvm.fma.f64(double %547, double %545, double %545)
  %549 = tail call double @llvm.fma.f64(double %546, double %548, double 1.000000e+00)
  %550 = tail call double @llvm.fma.f64(double %549, double %548, double %548)
  %551 = fmul double %541, %550
  %552 = fmul double %542, %551
  %553 = fneg double %552
  %554 = tail call double @llvm.fma.f64(double %551, double %542, double %553)
  %555 = tail call double @llvm.fma.f64(double %551, double %544, double %554)
  %556 = fadd double %552, %555
  %557 = fsub double %556, %552
  %558 = fsub double %555, %557
  %559 = fsub double %541, %556
  %560 = fsub double %541, %559
  %561 = fsub double %560, %556
  %562 = fsub double %561, %558
  %563 = fadd double %559, %562
  %564 = fmul double %550, %563
  %565 = fadd double %551, %564
  %566 = fsub double %565, %551
  %567 = fsub double %564, %566
  %568 = fmul double %565, %565
  %569 = tail call double @llvm.fma.f64(double %568, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %570 = tail call double @llvm.fma.f64(double %568, double %569, double 0x3FC7474DD7F4DF2E)
  %571 = tail call double @llvm.fma.f64(double %568, double %570, double 0x3FCC71C016291751)
  %572 = tail call double @llvm.fma.f64(double %568, double %571, double 0x3FD249249B27ACF1)
  %573 = tail call double @llvm.fma.f64(double %568, double %572, double 0x3FD99999998EF7B6)
  %574 = tail call double @llvm.fma.f64(double %568, double %573, double 0x3FE5555555555780)
  %575 = tail call double @llvm.amdgcn.ldexp.f64(double %565, i32 1)
  %576 = tail call double @llvm.amdgcn.ldexp.f64(double %567, i32 1)
  %577 = fmul double %565, %568
  %578 = fmul double %577, %574
  %579 = fadd double %575, %578
  %580 = fsub double %579, %575
  %581 = fsub double %578, %580
  %582 = fadd double %576, %581
  %583 = fadd double %579, %582
  %584 = fsub double %583, %579
  %585 = fsub double %582, %584
  %586 = sitofp i32 %540 to double
  %587 = fmul double %586, 0x3FE62E42FEFA39EF
  %588 = fneg double %587
  %589 = tail call double @llvm.fma.f64(double %586, double 0x3FE62E42FEFA39EF, double %588)
  %590 = tail call double @llvm.fma.f64(double %586, double 0x3C7ABC9E3B39803F, double %589)
  %591 = fadd double %587, %590
  %592 = fsub double %591, %587
  %593 = fsub double %590, %592
  %594 = fadd double %591, %583
  %595 = fsub double %594, %591
  %596 = fsub double %594, %595
  %597 = fsub double %591, %596
  %598 = fsub double %583, %595
  %599 = fadd double %598, %597
  %600 = fadd double %593, %585
  %601 = fsub double %600, %593
  %602 = fsub double %600, %601
  %603 = fsub double %593, %602
  %604 = fsub double %585, %601
  %605 = fadd double %604, %603
  %606 = fadd double %600, %599
  %607 = fadd double %594, %606
  %608 = fsub double %607, %594
  %609 = fsub double %606, %608
  %610 = fadd double %605, %609
  %611 = fadd double %607, %610
  %612 = tail call double @llvm.fabs.f64(double %534) #3
  %613 = fcmp oeq double %612, 0x7FF0000000000000
  %614 = select i1 %613, double %534, double %611
  %615 = fcmp olt double %534, 0.000000e+00
  %616 = select i1 %615, double 0x7FF8000000000000, double %614
  %617 = fcmp oeq double %534, 0.000000e+00
  %618 = select i1 %617, double 0xFFF0000000000000, double %616
  %619 = fmul contract double %618, %532
  %620 = fadd contract double %619, %530
  br label %621

621:                                              ; preds = %524, %504
  %622 = phi double [ %523, %504 ], [ %620, %524 ]
  %623 = fptrunc double %622 to float
  %624 = fsub contract float 1.000000e+00, %456
  %625 = tail call i1 @llvm.amdgcn.class.f32(float %624, i32 144)
  %626 = select i1 %625, float 0x41F0000000000000, float 1.000000e+00
  %627 = fmul float %624, %626
  %628 = tail call float @llvm.log2.f32(float %627)
  %629 = fmul float %628, 0x3FE62E42E0000000
  %630 = tail call i1 @llvm.amdgcn.class.f32(float %628, i32 519)
  %631 = fneg float %629
  %632 = tail call float @llvm.fma.f32(float %628, float 0x3FE62E42E0000000, float %631)
  %633 = tail call float @llvm.fma.f32(float %628, float 0x3E6EFA39E0000000, float %632)
  %634 = fadd float %629, %633
  %635 = select i1 %630, float %628, float %634
  %636 = select i1 %625, float 0x40362E4300000000, float 0.000000e+00
  %637 = fsub float %635, %636
  %638 = fcmp contract ugt float %637, %623
  br i1 %638, label %641, label %639

639:                                              ; preds = %621
  %640 = fmul contract float %434, %5
  br label %875

641:                                              ; preds = %492, %621
  %642 = fpext float %494 to double
  %643 = fadd contract float %351, %351
  %644 = fpext float %643 to double
  br label %645

645:                                              ; preds = %821, %641
  %646 = phi i32 [ %452, %641 ], [ %685, %821 ]
  %647 = phi i32 [ %450, %641 ], [ %684, %821 ]
  %648 = phi i32 [ %445, %641 ], [ %658, %821 ]
  %649 = phi i32 [ %444, %641 ], [ %647, %821 ]
  %650 = phi i32 [ %443, %641 ], [ %648, %821 ]
  %651 = phi i32 [ %442, %641 ], [ %649, %821 ]
  %652 = lshr i32 %651, 2
  %653 = xor i32 %652, %651
  %654 = shl i32 %647, 4
  %655 = shl i32 %653, 1
  %656 = xor i32 %655, %654
  %657 = xor i32 %656, %653
  %658 = xor i32 %657, %647
  %659 = add i32 %646, 362437
  %660 = add i32 %659, %658
  %661 = uitofp i32 %660 to float
  %662 = fmul contract float %661, 0x3DF0000000000000
  %663 = fadd contract float %662, 0x3DF0000000000000
  %664 = tail call i1 @llvm.amdgcn.class.f32(float %663, i32 144)
  %665 = select i1 %664, float 0x41F0000000000000, float 1.000000e+00
  %666 = fmul float %663, %665
  %667 = tail call float @llvm.log2.f32(float %666)
  %668 = fmul float %667, 0x3FE62E42E0000000
  %669 = tail call i1 @llvm.amdgcn.class.f32(float %667, i32 519)
  %670 = fneg float %668
  %671 = tail call float @llvm.fma.f32(float %667, float 0x3FE62E42E0000000, float %670)
  %672 = tail call float @llvm.fma.f32(float %667, float 0x3E6EFA39E0000000, float %671)
  %673 = fadd float %668, %672
  %674 = select i1 %669, float %667, float %673
  %675 = select i1 %664, float 0x40362E4300000000, float 0.000000e+00
  %676 = fsub float %674, %675
  %677 = fneg contract float %676
  %678 = lshr i32 %650, 2
  %679 = xor i32 %678, %650
  %680 = shl i32 %658, 4
  %681 = shl i32 %679, 1
  %682 = xor i32 %681, %680
  %683 = xor i32 %682, %679
  %684 = xor i32 %683, %658
  %685 = add i32 %646, 724874
  %686 = add i32 %684, %685
  %687 = uitofp i32 %686 to float
  %688 = fmul contract float %687, 0x3DF0000000000000
  %689 = fadd contract float %688, 0x3DF0000000000000
  %690 = fadd contract float %689, %689
  %691 = fadd contract float %690, -1.000000e+00
  %692 = fcmp contract olt float %691, 0.000000e+00
  %693 = select i1 %692, float %677, float %676
  %694 = fmul contract float %496, %693
  %695 = fsub contract float %495, %694
  %696 = fpext float %695 to double
  %697 = fcmp contract ult double %696, 0xBFE6FFF52C8540C9
  br i1 %697, label %821, label %698

698:                                              ; preds = %645
  %699 = fdiv contract float %695, %499
  %700 = tail call float @llvm.fabs.f32(float %699)
  %701 = fcmp contract ugt float %700, 2.500000e-01
  br i1 %701, label %722, label %702

702:                                              ; preds = %698
  %703 = fmul contract double %696, 5.000000e-01
  %704 = fmul contract double %703, %696
  %705 = fmul contract float %699, 0x3FBF95CC80000000
  %706 = fadd contract float %705, 0xBFC17FF740000000
  %707 = fmul contract float %699, %706
  %708 = fadd contract float %707, 0x3FC2390A00000000
  %709 = fmul contract float %699, %708
  %710 = fadd contract float %709, 0xBFC5490F40000000
  %711 = fmul contract float %699, %710
  %712 = fadd contract float %711, 0x3FC999CDA0000000
  %713 = fmul contract float %699, %712
  %714 = fadd contract float %713, 0xBFD0000CA0000000
  %715 = fmul contract float %699, %714
  %716 = fadd contract float %715, 0x3FD5555540000000
  %717 = fpext float %716 to double
  %718 = fmul contract double %704, %717
  %719 = fpext float %699 to double
  %720 = fmul contract double %718, %719
  %721 = fadd contract double %720, %642
  br label %817

722:                                              ; preds = %698
  %723 = fmul contract float %350, %695
  %724 = fsub contract float %494, %723
  %725 = fpext float %724 to double
  %726 = fmul contract double %696, 2.500000e-01
  %727 = fmul contract double %726, %696
  %728 = fadd contract double %727, %725
  %729 = fpext float %699 to double
  %730 = fadd contract double %729, 1.000000e+00
  %731 = tail call double @llvm.amdgcn.frexp.mant.f64(double %730)
  %732 = fcmp olt double %731, 0x3FE5555555555555
  %733 = zext i1 %732 to i32
  %734 = tail call double @llvm.amdgcn.ldexp.f64(double %731, i32 %733)
  %735 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %730)
  %736 = sub nsw i32 %735, %733
  %737 = fadd double %734, -1.000000e+00
  %738 = fadd double %734, 1.000000e+00
  %739 = fadd double %738, -1.000000e+00
  %740 = fsub double %734, %739
  %741 = tail call double @llvm.amdgcn.rcp.f64(double %738)
  %742 = fneg double %738
  %743 = tail call double @llvm.fma.f64(double %742, double %741, double 1.000000e+00)
  %744 = tail call double @llvm.fma.f64(double %743, double %741, double %741)
  %745 = tail call double @llvm.fma.f64(double %742, double %744, double 1.000000e+00)
  %746 = tail call double @llvm.fma.f64(double %745, double %744, double %744)
  %747 = fmul double %737, %746
  %748 = fmul double %738, %747
  %749 = fneg double %748
  %750 = tail call double @llvm.fma.f64(double %747, double %738, double %749)
  %751 = tail call double @llvm.fma.f64(double %747, double %740, double %750)
  %752 = fadd double %748, %751
  %753 = fsub double %752, %748
  %754 = fsub double %751, %753
  %755 = fsub double %737, %752
  %756 = fsub double %737, %755
  %757 = fsub double %756, %752
  %758 = fsub double %757, %754
  %759 = fadd double %755, %758
  %760 = fmul double %746, %759
  %761 = fadd double %747, %760
  %762 = fsub double %761, %747
  %763 = fsub double %760, %762
  %764 = fmul double %761, %761
  %765 = tail call double @llvm.fma.f64(double %764, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %766 = tail call double @llvm.fma.f64(double %764, double %765, double 0x3FC7474DD7F4DF2E)
  %767 = tail call double @llvm.fma.f64(double %764, double %766, double 0x3FCC71C016291751)
  %768 = tail call double @llvm.fma.f64(double %764, double %767, double 0x3FD249249B27ACF1)
  %769 = tail call double @llvm.fma.f64(double %764, double %768, double 0x3FD99999998EF7B6)
  %770 = tail call double @llvm.fma.f64(double %764, double %769, double 0x3FE5555555555780)
  %771 = tail call double @llvm.amdgcn.ldexp.f64(double %761, i32 1)
  %772 = tail call double @llvm.amdgcn.ldexp.f64(double %763, i32 1)
  %773 = fmul double %761, %764
  %774 = fmul double %773, %770
  %775 = fadd double %771, %774
  %776 = fsub double %775, %771
  %777 = fsub double %774, %776
  %778 = fadd double %772, %777
  %779 = fadd double %775, %778
  %780 = fsub double %779, %775
  %781 = fsub double %778, %780
  %782 = sitofp i32 %736 to double
  %783 = fmul double %782, 0x3FE62E42FEFA39EF
  %784 = fneg double %783
  %785 = tail call double @llvm.fma.f64(double %782, double 0x3FE62E42FEFA39EF, double %784)
  %786 = tail call double @llvm.fma.f64(double %782, double 0x3C7ABC9E3B39803F, double %785)
  %787 = fadd double %783, %786
  %788 = fsub double %787, %783
  %789 = fsub double %786, %788
  %790 = fadd double %787, %779
  %791 = fsub double %790, %787
  %792 = fsub double %790, %791
  %793 = fsub double %787, %792
  %794 = fsub double %779, %791
  %795 = fadd double %794, %793
  %796 = fadd double %789, %781
  %797 = fsub double %796, %789
  %798 = fsub double %796, %797
  %799 = fsub double %789, %798
  %800 = fsub double %781, %797
  %801 = fadd double %800, %799
  %802 = fadd double %796, %795
  %803 = fadd double %790, %802
  %804 = fsub double %803, %790
  %805 = fsub double %802, %804
  %806 = fadd double %801, %805
  %807 = fadd double %803, %806
  %808 = tail call double @llvm.fabs.f64(double %730) #3
  %809 = fcmp oeq double %808, 0x7FF0000000000000
  %810 = select i1 %809, double %730, double %807
  %811 = fcmp olt double %730, 0.000000e+00
  %812 = select i1 %811, double 0x7FF8000000000000, double %810
  %813 = fcmp oeq double %730, 0.000000e+00
  %814 = select i1 %813, double 0xFFF0000000000000, double %812
  %815 = fmul contract double %814, %644
  %816 = fadd contract double %728, %815
  br label %817

817:                                              ; preds = %722, %702
  %818 = phi double [ %721, %702 ], [ %816, %722 ]
  %819 = fptrunc double %818 to float
  %820 = fcmp contract ogt float %819, 0.000000e+00
  br i1 %820, label %822, label %821

821:                                              ; preds = %817, %822, %645
  br label %645, !llvm.loop !29

822:                                              ; preds = %817
  %823 = fmul float %819, 0x3FF7154760000000
  %824 = tail call float @llvm.rint.f32(float %823)
  %825 = fneg float %824
  %826 = tail call float @llvm.fma.f32(float %825, float 0x3FE62E4300000000, float %819)
  %827 = tail call float @llvm.fma.f32(float %825, float 0xBE205C6100000000, float %826)
  %828 = tail call float @llvm.fmuladd.f32(float %827, float 0x3F2A267620000000, float 0x3F56D2E000000000)
  %829 = tail call float @llvm.fmuladd.f32(float %827, float %828, float 0x3F8110FF20000000)
  %830 = tail call float @llvm.fmuladd.f32(float %827, float %829, float 0x3FA5555020000000)
  %831 = tail call float @llvm.fmuladd.f32(float %827, float %830, float 0x3FC5555560000000)
  %832 = tail call float @llvm.fmuladd.f32(float %827, float %831, float 5.000000e-01)
  %833 = fmul float %827, %832
  %834 = tail call float @llvm.fma.f32(float %827, float %833, float %827)
  %835 = fcmp oeq float %824, 1.280000e+02
  %836 = fptosi float %824 to i32
  %837 = select i1 %835, i32 127, i32 %836
  %838 = tail call float @llvm.amdgcn.ldexp.f32(float 1.000000e+00, i32 %837)
  %839 = fadd float %838, -1.000000e+00
  %840 = tail call float @llvm.fma.f32(float %838, float %834, float %839)
  %841 = fmul float %840, 2.000000e+00
  %842 = select i1 %835, float %841, float %840
  %843 = fcmp ogt float %819, 0x40562E42E0000000
  %844 = select i1 %843, float 0x7FF0000000000000, float %842
  %845 = fcmp olt float %819, -1.700000e+01
  %846 = select i1 %845, float -1.000000e+00, float %844
  %847 = tail call float @llvm.fabs.f32(float %691)
  %848 = fmul contract float %497, %847
  %849 = fpext float %677 to double
  %850 = fmul contract double %696, 5.000000e-01
  %851 = fmul contract double %850, %696
  %852 = fsub contract double %849, %851
  %853 = fptrunc double %852 to float
  %854 = fmul float %853, 0x3FF7154760000000
  %855 = tail call float @llvm.rint.f32(float %854)
  %856 = fcmp ogt float %853, 0x40562E4300000000
  %857 = fcmp olt float %853, 0xC059D1DA00000000
  %858 = fneg float %854
  %859 = tail call float @llvm.fma.f32(float %853, float 0x3FF7154760000000, float %858)
  %860 = tail call float @llvm.fma.f32(float %853, float 0x3E54AE0BE0000000, float %859)
  %861 = fsub float %854, %855
  %862 = fadd float %860, %861
  %863 = tail call float @llvm.exp2.f32(float %862)
  %864 = fptosi float %855 to i32
  %865 = tail call float @llvm.amdgcn.ldexp.f32(float %863, i32 %864)
  %866 = select i1 %857, float 0.000000e+00, float %865
  %867 = select i1 %856, float 0x7FF0000000000000, float %866
  %868 = fmul contract float %867, %846
  %869 = fcmp contract ugt float %848, %868
  br i1 %869, label %821, label %870

870:                                              ; preds = %822
  store i32 %649, i32 addrspace(1)* %93, align 8, !tbaa !25
  store i32 %648, i32 addrspace(1)* %94, align 4, !tbaa !25
  store i32 %647, i32 addrspace(1)* %95, align 8, !tbaa !25
  store i32 %658, i32 addrspace(1)* %96, align 4, !tbaa !25
  store i32 %684, i32 addrspace(1)* %97, align 8, !tbaa !25
  store i32 %685, i32 addrspace(1)* %98, align 8, !tbaa !26
  %871 = fadd contract double %850, %429
  %872 = fptrunc double %871 to float
  %873 = fmul contract float %872, %5
  %874 = fmul contract float %873, %872
  br label %875

875:                                              ; preds = %130, %870, %639, %461, %436, %342
  %876 = phi float [ %874, %870 ], [ %640, %639 ], [ %462, %461 ], [ %437, %436 ], [ %344, %342 ], [ 0.000000e+00, %130 ]
  %877 = phi float [ %349, %870 ], [ %349, %639 ], [ %349, %461 ], [ %349, %436 ], [ %129, %342 ], [ %129, %130 ]
  %878 = phi float [ %493, %870 ], [ %493, %639 ], [ %128, %461 ], [ %128, %436 ], [ %128, %342 ], [ %128, %130 ]
  %879 = phi float [ %350, %870 ], [ %350, %639 ], [ %350, %461 ], [ %350, %436 ], [ %127, %342 ], [ %127, %130 ]
  %880 = phi float [ %351, %870 ], [ %351, %639 ], [ %351, %461 ], [ %351, %436 ], [ %126, %342 ], [ %126, %130 ]
  %881 = phi float [ %352, %870 ], [ %352, %639 ], [ %352, %461 ], [ %352, %436 ], [ %125, %342 ], [ %125, %130 ]
  %882 = phi float [ %494, %870 ], [ %494, %639 ], [ %124, %461 ], [ %124, %436 ], [ %124, %342 ], [ %124, %130 ]
  %883 = phi float [ %495, %870 ], [ %495, %639 ], [ %123, %461 ], [ %123, %436 ], [ %123, %342 ], [ %123, %130 ]
  %884 = phi float [ %496, %870 ], [ %496, %639 ], [ %122, %461 ], [ %122, %436 ], [ %122, %342 ], [ %122, %130 ]
  %885 = phi float [ %497, %870 ], [ %497, %639 ], [ %121, %461 ], [ %121, %436 ], [ %121, %342 ], [ %121, %130 ]
  %886 = add nsw i32 %120, %59
  %887 = sext i32 %886 to i64
  %888 = getelementptr inbounds float, float addrspace(1)* %2, i64 %887
  store float %876, float addrspace(1)* %888, align 4, !tbaa !30
  %889 = add nuw nsw i32 %120, 1
  %890 = icmp eq i32 %889, %58
  br i1 %890, label %891, label %119, !llvm.loop !31

891:                                              ; preds = %875, %57, %6
  ret void
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sin.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.cos.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!16 = !{!17, !19, i64 4}
!17 = !{!"_ZTSN14rocrand_device13xorwow_engineE", !18, i64 0}
!18 = !{!"_ZTSN14rocrand_device13xorwow_engine12xorwow_stateE", !19, i64 0, !19, i64 4, !19, i64 8, !22, i64 12, !23, i64 16, !20, i64 24}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!"float", !20, i64 0}
!23 = !{!"double", !20, i64 0}
!24 = !{!17, !22, i64 12}
!25 = !{!19, !19, i64 0}
!26 = !{!17, !19, i64 0}
!27 = distinct !{!27, !28}
!28 = !{!"llvm.loop.mustprogress"}
!29 = distinct !{!29, !28}
!30 = !{!22, !22, i64 0}
!31 = distinct !{!31, !28}
