; ModuleID = '../data/hip_kernels/17697/7/main.cu'
source_filename = "../data/hip_kernels/17697/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21cross_entropy_forwardjjPKfS0_Pf(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %0
  br i1 %15, label %16, label %421

16:                                               ; preds = %5
  %17 = mul i32 %14, %1
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = icmp ugt i32 %1, 1
  br i1 %21, label %22, label %46

22:                                               ; preds = %16
  %23 = add i32 %1, -1
  %24 = add i32 %1, -2
  %25 = and i32 %23, 7
  %26 = icmp ult i32 %24, 7
  br i1 %26, label %29, label %27

27:                                               ; preds = %22
  %28 = and i32 %23, -8
  br label %54

29:                                               ; preds = %54, %22
  %30 = phi float [ undef, %22 ], [ %104, %54 ]
  %31 = phi float [ %20, %22 ], [ %104, %54 ]
  %32 = phi i32 [ 1, %22 ], [ %105, %54 ]
  %33 = icmp eq i32 %25, 0
  br i1 %33, label %46, label %34

34:                                               ; preds = %29, %34
  %35 = phi float [ %42, %34 ], [ %31, %29 ]
  %36 = phi i32 [ %43, %34 ], [ %32, %29 ]
  %37 = phi i32 [ %44, %34 ], [ 0, %29 ]
  %38 = add i32 %36, %17
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = tail call float @llvm.maxnum.f32(float %41, float %35)
  %43 = add nuw nsw i32 %36, 1
  %44 = add i32 %37, 1
  %45 = icmp eq i32 %44, %25
  br i1 %45, label %46, label %34, !llvm.loop !11

46:                                               ; preds = %29, %34, %16
  %47 = phi float [ %20, %16 ], [ %30, %29 ], [ %42, %34 ]
  %48 = icmp eq i32 %1, 0
  br i1 %48, label %221, label %49

49:                                               ; preds = %46
  %50 = and i32 %1, 7
  %51 = icmp ult i32 %1, 8
  br i1 %51, label %108, label %52

52:                                               ; preds = %49
  %53 = and i32 %1, -8
  br label %129

54:                                               ; preds = %54, %27
  %55 = phi float [ %20, %27 ], [ %104, %54 ]
  %56 = phi i32 [ 1, %27 ], [ %105, %54 ]
  %57 = phi i32 [ 0, %27 ], [ %106, %54 ]
  %58 = add i32 %56, %17
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = tail call float @llvm.maxnum.f32(float %61, float %55)
  %63 = add nuw nsw i32 %56, 1
  %64 = add i32 %63, %17
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = tail call float @llvm.maxnum.f32(float %67, float %62)
  %69 = add nuw nsw i32 %56, 2
  %70 = add i32 %69, %17
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = tail call float @llvm.maxnum.f32(float %73, float %68)
  %75 = add nuw nsw i32 %56, 3
  %76 = add i32 %75, %17
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = tail call float @llvm.maxnum.f32(float %79, float %74)
  %81 = add nuw nsw i32 %56, 4
  %82 = add i32 %81, %17
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = tail call float @llvm.maxnum.f32(float %85, float %80)
  %87 = add nuw nsw i32 %56, 5
  %88 = add i32 %87, %17
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = tail call float @llvm.maxnum.f32(float %91, float %86)
  %93 = add nuw nsw i32 %56, 6
  %94 = add i32 %93, %17
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = tail call float @llvm.maxnum.f32(float %97, float %92)
  %99 = add nuw nsw i32 %56, 7
  %100 = add i32 %99, %17
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = tail call float @llvm.maxnum.f32(float %103, float %98)
  %105 = add nuw nsw i32 %56, 8
  %106 = add i32 %57, 8
  %107 = icmp eq i32 %106, %28
  br i1 %107, label %29, label %54, !llvm.loop !13

108:                                              ; preds = %129, %49
  %109 = phi i32 [ 0, %49 ], [ %187, %129 ]
  %110 = icmp eq i32 %50, 0
  br i1 %110, label %123, label %111

111:                                              ; preds = %108, %111
  %112 = phi i32 [ %120, %111 ], [ %109, %108 ]
  %113 = phi i32 [ %121, %111 ], [ 0, %108 ]
  %114 = add i32 %112, %17
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %2, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fsub contract float %117, %47
  %119 = getelementptr inbounds float, float addrspace(1)* %4, i64 %115
  store float %118, float addrspace(1)* %119, align 4, !tbaa !7
  %120 = add nuw nsw i32 %112, 1
  %121 = add i32 %113, 1
  %122 = icmp eq i32 %121, %50
  br i1 %122, label %123, label %111, !llvm.loop !15

123:                                              ; preds = %111, %108
  br i1 %48, label %221, label %124

124:                                              ; preds = %123
  %125 = and i32 %1, 3
  %126 = icmp ult i32 %1, 4
  br i1 %126, label %190, label %127

127:                                              ; preds = %124
  %128 = and i32 %1, -4
  br label %241

129:                                              ; preds = %129, %52
  %130 = phi i32 [ 0, %52 ], [ %187, %129 ]
  %131 = phi i32 [ 0, %52 ], [ %188, %129 ]
  %132 = add i32 %130, %17
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %2, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = fsub contract float %135, %47
  %137 = getelementptr inbounds float, float addrspace(1)* %4, i64 %133
  store float %136, float addrspace(1)* %137, align 4, !tbaa !7
  %138 = or i32 %130, 1
  %139 = add i32 %138, %17
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %2, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7
  %143 = fsub contract float %142, %47
  %144 = getelementptr inbounds float, float addrspace(1)* %4, i64 %140
  store float %143, float addrspace(1)* %144, align 4, !tbaa !7
  %145 = or i32 %130, 2
  %146 = add i32 %145, %17
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %2, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = fsub contract float %149, %47
  %151 = getelementptr inbounds float, float addrspace(1)* %4, i64 %147
  store float %150, float addrspace(1)* %151, align 4, !tbaa !7
  %152 = or i32 %130, 3
  %153 = add i32 %152, %17
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %2, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = fsub contract float %156, %47
  %158 = getelementptr inbounds float, float addrspace(1)* %4, i64 %154
  store float %157, float addrspace(1)* %158, align 4, !tbaa !7
  %159 = or i32 %130, 4
  %160 = add i32 %159, %17
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %2, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %164 = fsub contract float %163, %47
  %165 = getelementptr inbounds float, float addrspace(1)* %4, i64 %161
  store float %164, float addrspace(1)* %165, align 4, !tbaa !7
  %166 = or i32 %130, 5
  %167 = add i32 %166, %17
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %2, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = fsub contract float %170, %47
  %172 = getelementptr inbounds float, float addrspace(1)* %4, i64 %168
  store float %171, float addrspace(1)* %172, align 4, !tbaa !7
  %173 = or i32 %130, 6
  %174 = add i32 %173, %17
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %2, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !7
  %178 = fsub contract float %177, %47
  %179 = getelementptr inbounds float, float addrspace(1)* %4, i64 %175
  store float %178, float addrspace(1)* %179, align 4, !tbaa !7
  %180 = or i32 %130, 7
  %181 = add i32 %180, %17
  %182 = zext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %2, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7
  %185 = fsub contract float %184, %47
  %186 = getelementptr inbounds float, float addrspace(1)* %4, i64 %182
  store float %185, float addrspace(1)* %186, align 4, !tbaa !7
  %187 = add nuw nsw i32 %130, 8
  %188 = add i32 %131, 8
  %189 = icmp eq i32 %188, %53
  br i1 %189, label %108, label %129, !llvm.loop !16

190:                                              ; preds = %241, %124
  %191 = phi float [ undef, %124 ], [ %323, %241 ]
  %192 = phi i32 [ 0, %124 ], [ %324, %241 ]
  %193 = phi float [ 0.000000e+00, %124 ], [ %323, %241 ]
  %194 = icmp eq i32 %125, 0
  br i1 %194, label %221, label %195

195:                                              ; preds = %190, %195
  %196 = phi i32 [ %218, %195 ], [ %192, %190 ]
  %197 = phi float [ %217, %195 ], [ %193, %190 ]
  %198 = phi i32 [ %219, %195 ], [ 0, %190 ]
  %199 = add i32 %196, %17
  %200 = zext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %4, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !7
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = tail call float @llvm.rint.f32(float %203)
  %205 = fcmp ogt float %202, 0x40562E4300000000
  %206 = fcmp olt float %202, 0xC059D1DA00000000
  %207 = fneg float %203
  %208 = tail call float @llvm.fma.f32(float %202, float 0x3FF7154760000000, float %207)
  %209 = tail call float @llvm.fma.f32(float %202, float 0x3E54AE0BE0000000, float %208)
  %210 = fsub float %203, %204
  %211 = fadd float %209, %210
  %212 = tail call float @llvm.exp2.f32(float %211)
  %213 = fptosi float %204 to i32
  %214 = tail call float @llvm.amdgcn.ldexp.f32(float %212, i32 %213)
  %215 = select i1 %206, float 0.000000e+00, float %214
  %216 = select i1 %205, float 0x7FF0000000000000, float %215
  %217 = fadd contract float %197, %216
  %218 = add nuw nsw i32 %196, 1
  %219 = add i32 %198, 1
  %220 = icmp eq i32 %219, %125
  br i1 %220, label %221, label %195, !llvm.loop !17

221:                                              ; preds = %190, %195, %46, %123
  %222 = phi float [ 0.000000e+00, %123 ], [ 0.000000e+00, %46 ], [ %191, %190 ], [ %217, %195 ]
  %223 = tail call i1 @llvm.amdgcn.class.f32(float %222, i32 144)
  %224 = select i1 %223, float 0x41F0000000000000, float 1.000000e+00
  %225 = fmul float %222, %224
  %226 = tail call float @llvm.log2.f32(float %225)
  %227 = fmul float %226, 0x3FE62E42E0000000
  %228 = tail call i1 @llvm.amdgcn.class.f32(float %226, i32 519)
  %229 = fneg float %227
  %230 = tail call float @llvm.fma.f32(float %226, float 0x3FE62E42E0000000, float %229)
  %231 = tail call float @llvm.fma.f32(float %226, float 0x3E6EFA39E0000000, float %230)
  %232 = fadd float %227, %231
  %233 = select i1 %228, float %226, float %232
  %234 = select i1 %223, float 0x40362E4300000000, float 0.000000e+00
  %235 = fsub float %233, %234
  br i1 %48, label %421, label %236

236:                                              ; preds = %221
  %237 = and i32 %1, 7
  %238 = icmp ult i32 %1, 8
  br i1 %238, label %404, label %239

239:                                              ; preds = %236
  %240 = and i32 %1, -8
  br label %327

241:                                              ; preds = %241, %127
  %242 = phi i32 [ 0, %127 ], [ %324, %241 ]
  %243 = phi float [ 0.000000e+00, %127 ], [ %323, %241 ]
  %244 = phi i32 [ 0, %127 ], [ %325, %241 ]
  %245 = add i32 %242, %17
  %246 = zext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %4, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !7
  %249 = fmul float %248, 0x3FF7154760000000
  %250 = tail call float @llvm.rint.f32(float %249)
  %251 = fcmp ogt float %248, 0x40562E4300000000
  %252 = fcmp olt float %248, 0xC059D1DA00000000
  %253 = fneg float %249
  %254 = tail call float @llvm.fma.f32(float %248, float 0x3FF7154760000000, float %253)
  %255 = tail call float @llvm.fma.f32(float %248, float 0x3E54AE0BE0000000, float %254)
  %256 = fsub float %249, %250
  %257 = fadd float %255, %256
  %258 = tail call float @llvm.exp2.f32(float %257)
  %259 = fptosi float %250 to i32
  %260 = tail call float @llvm.amdgcn.ldexp.f32(float %258, i32 %259)
  %261 = select i1 %252, float 0.000000e+00, float %260
  %262 = select i1 %251, float 0x7FF0000000000000, float %261
  %263 = fadd contract float %243, %262
  %264 = or i32 %242, 1
  %265 = add i32 %264, %17
  %266 = zext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %4, i64 %266
  %268 = load float, float addrspace(1)* %267, align 4, !tbaa !7
  %269 = fmul float %268, 0x3FF7154760000000
  %270 = tail call float @llvm.rint.f32(float %269)
  %271 = fcmp ogt float %268, 0x40562E4300000000
  %272 = fcmp olt float %268, 0xC059D1DA00000000
  %273 = fneg float %269
  %274 = tail call float @llvm.fma.f32(float %268, float 0x3FF7154760000000, float %273)
  %275 = tail call float @llvm.fma.f32(float %268, float 0x3E54AE0BE0000000, float %274)
  %276 = fsub float %269, %270
  %277 = fadd float %275, %276
  %278 = tail call float @llvm.exp2.f32(float %277)
  %279 = fptosi float %270 to i32
  %280 = tail call float @llvm.amdgcn.ldexp.f32(float %278, i32 %279)
  %281 = select i1 %272, float 0.000000e+00, float %280
  %282 = select i1 %271, float 0x7FF0000000000000, float %281
  %283 = fadd contract float %263, %282
  %284 = or i32 %242, 2
  %285 = add i32 %284, %17
  %286 = zext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %4, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !7
  %289 = fmul float %288, 0x3FF7154760000000
  %290 = tail call float @llvm.rint.f32(float %289)
  %291 = fcmp ogt float %288, 0x40562E4300000000
  %292 = fcmp olt float %288, 0xC059D1DA00000000
  %293 = fneg float %289
  %294 = tail call float @llvm.fma.f32(float %288, float 0x3FF7154760000000, float %293)
  %295 = tail call float @llvm.fma.f32(float %288, float 0x3E54AE0BE0000000, float %294)
  %296 = fsub float %289, %290
  %297 = fadd float %295, %296
  %298 = tail call float @llvm.exp2.f32(float %297)
  %299 = fptosi float %290 to i32
  %300 = tail call float @llvm.amdgcn.ldexp.f32(float %298, i32 %299)
  %301 = select i1 %292, float 0.000000e+00, float %300
  %302 = select i1 %291, float 0x7FF0000000000000, float %301
  %303 = fadd contract float %283, %302
  %304 = or i32 %242, 3
  %305 = add i32 %304, %17
  %306 = zext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %4, i64 %306
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !7
  %309 = fmul float %308, 0x3FF7154760000000
  %310 = tail call float @llvm.rint.f32(float %309)
  %311 = fcmp ogt float %308, 0x40562E4300000000
  %312 = fcmp olt float %308, 0xC059D1DA00000000
  %313 = fneg float %309
  %314 = tail call float @llvm.fma.f32(float %308, float 0x3FF7154760000000, float %313)
  %315 = tail call float @llvm.fma.f32(float %308, float 0x3E54AE0BE0000000, float %314)
  %316 = fsub float %309, %310
  %317 = fadd float %315, %316
  %318 = tail call float @llvm.exp2.f32(float %317)
  %319 = fptosi float %310 to i32
  %320 = tail call float @llvm.amdgcn.ldexp.f32(float %318, i32 %319)
  %321 = select i1 %312, float 0.000000e+00, float %320
  %322 = select i1 %311, float 0x7FF0000000000000, float %321
  %323 = fadd contract float %303, %322
  %324 = add nuw nsw i32 %242, 4
  %325 = add i32 %244, 4
  %326 = icmp eq i32 %325, %128
  br i1 %326, label %190, label %241, !llvm.loop !18

327:                                              ; preds = %327, %239
  %328 = phi i32 [ 0, %239 ], [ %401, %327 ]
  %329 = phi i32 [ 0, %239 ], [ %402, %327 ]
  %330 = add i32 %328, %17
  %331 = zext i32 %330 to i64
  %332 = getelementptr inbounds float, float addrspace(1)* %4, i64 %331
  %333 = load float, float addrspace(1)* %332, align 4, !tbaa !7
  %334 = fsub contract float %235, %333
  %335 = getelementptr inbounds float, float addrspace(1)* %3, i64 %331
  %336 = load float, float addrspace(1)* %335, align 4, !tbaa !7
  %337 = fmul contract float %334, %336
  store float %337, float addrspace(1)* %332, align 4, !tbaa !7
  %338 = or i32 %328, 1
  %339 = add i32 %338, %17
  %340 = zext i32 %339 to i64
  %341 = getelementptr inbounds float, float addrspace(1)* %4, i64 %340
  %342 = load float, float addrspace(1)* %341, align 4, !tbaa !7
  %343 = fsub contract float %235, %342
  %344 = getelementptr inbounds float, float addrspace(1)* %3, i64 %340
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !7
  %346 = fmul contract float %343, %345
  store float %346, float addrspace(1)* %341, align 4, !tbaa !7
  %347 = or i32 %328, 2
  %348 = add i32 %347, %17
  %349 = zext i32 %348 to i64
  %350 = getelementptr inbounds float, float addrspace(1)* %4, i64 %349
  %351 = load float, float addrspace(1)* %350, align 4, !tbaa !7
  %352 = fsub contract float %235, %351
  %353 = getelementptr inbounds float, float addrspace(1)* %3, i64 %349
  %354 = load float, float addrspace(1)* %353, align 4, !tbaa !7
  %355 = fmul contract float %352, %354
  store float %355, float addrspace(1)* %350, align 4, !tbaa !7
  %356 = or i32 %328, 3
  %357 = add i32 %356, %17
  %358 = zext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %4, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !7
  %361 = fsub contract float %235, %360
  %362 = getelementptr inbounds float, float addrspace(1)* %3, i64 %358
  %363 = load float, float addrspace(1)* %362, align 4, !tbaa !7
  %364 = fmul contract float %361, %363
  store float %364, float addrspace(1)* %359, align 4, !tbaa !7
  %365 = or i32 %328, 4
  %366 = add i32 %365, %17
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds float, float addrspace(1)* %4, i64 %367
  %369 = load float, float addrspace(1)* %368, align 4, !tbaa !7
  %370 = fsub contract float %235, %369
  %371 = getelementptr inbounds float, float addrspace(1)* %3, i64 %367
  %372 = load float, float addrspace(1)* %371, align 4, !tbaa !7
  %373 = fmul contract float %370, %372
  store float %373, float addrspace(1)* %368, align 4, !tbaa !7
  %374 = or i32 %328, 5
  %375 = add i32 %374, %17
  %376 = zext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %4, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !7
  %379 = fsub contract float %235, %378
  %380 = getelementptr inbounds float, float addrspace(1)* %3, i64 %376
  %381 = load float, float addrspace(1)* %380, align 4, !tbaa !7
  %382 = fmul contract float %379, %381
  store float %382, float addrspace(1)* %377, align 4, !tbaa !7
  %383 = or i32 %328, 6
  %384 = add i32 %383, %17
  %385 = zext i32 %384 to i64
  %386 = getelementptr inbounds float, float addrspace(1)* %4, i64 %385
  %387 = load float, float addrspace(1)* %386, align 4, !tbaa !7
  %388 = fsub contract float %235, %387
  %389 = getelementptr inbounds float, float addrspace(1)* %3, i64 %385
  %390 = load float, float addrspace(1)* %389, align 4, !tbaa !7
  %391 = fmul contract float %388, %390
  store float %391, float addrspace(1)* %386, align 4, !tbaa !7
  %392 = or i32 %328, 7
  %393 = add i32 %392, %17
  %394 = zext i32 %393 to i64
  %395 = getelementptr inbounds float, float addrspace(1)* %4, i64 %394
  %396 = load float, float addrspace(1)* %395, align 4, !tbaa !7
  %397 = fsub contract float %235, %396
  %398 = getelementptr inbounds float, float addrspace(1)* %3, i64 %394
  %399 = load float, float addrspace(1)* %398, align 4, !tbaa !7
  %400 = fmul contract float %397, %399
  store float %400, float addrspace(1)* %395, align 4, !tbaa !7
  %401 = add nuw nsw i32 %328, 8
  %402 = add i32 %329, 8
  %403 = icmp eq i32 %402, %240
  br i1 %403, label %404, label %327, !llvm.loop !19

404:                                              ; preds = %327, %236
  %405 = phi i32 [ 0, %236 ], [ %401, %327 ]
  %406 = icmp eq i32 %237, 0
  br i1 %406, label %421, label %407

407:                                              ; preds = %404, %407
  %408 = phi i32 [ %418, %407 ], [ %405, %404 ]
  %409 = phi i32 [ %419, %407 ], [ 0, %404 ]
  %410 = add i32 %408, %17
  %411 = zext i32 %410 to i64
  %412 = getelementptr inbounds float, float addrspace(1)* %4, i64 %411
  %413 = load float, float addrspace(1)* %412, align 4, !tbaa !7
  %414 = fsub contract float %235, %413
  %415 = getelementptr inbounds float, float addrspace(1)* %3, i64 %411
  %416 = load float, float addrspace(1)* %415, align 4, !tbaa !7
  %417 = fmul contract float %414, %416
  store float %417, float addrspace(1)* %412, align 4, !tbaa !7
  %418 = add nuw nsw i32 %408, 1
  %419 = add i32 %409, 1
  %420 = icmp eq i32 %419, %237
  br i1 %420, label %421, label %407, !llvm.loop !20

421:                                              ; preds = %404, %407, %221, %5
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
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !12}
