; ModuleID = '../data/hip_kernels/8192/43/main.cu'
source_filename = "../data/hip_kernels/8192/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19LSTMDeltaKernelBPTTPfS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readnone %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture writeonly %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, float addrspace(1)* nocapture readonly %15, float addrspace(1)* nocapture readonly %16, float addrspace(1)* nocapture readonly %17, float addrspace(1)* nocapture readonly %18, float addrspace(1)* nocapture readonly %19, float addrspace(1)* nocapture readonly %20, float addrspace(1)* nocapture readnone %21, float addrspace(1)* nocapture readonly %22, float addrspace(1)* nocapture readonly %23, float addrspace(1)* nocapture readonly %24, i32 %25, i32 %26, i32 %27) local_unnamed_addr #0 {
  %29 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %30 = getelementptr i8, i8 addrspace(4)* %29, i64 4
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 4, !range !4, !invariant.load !5
  %33 = zext i16 %32 to i32
  %34 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 12
  %35 = bitcast i8 addrspace(4)* %34 to i32 addrspace(4)*
  %36 = load i32, i32 addrspace(4)* %35, align 4, !tbaa !6
  %37 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %38 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %39 = udiv i32 %36, %33
  %40 = mul i32 %39, %33
  %41 = icmp ugt i32 %36, %40
  %42 = zext i1 %41 to i32
  %43 = add i32 %39, %42
  %44 = mul i32 %43, %38
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %46 = add i32 %44, %37
  %47 = mul i32 %46, %33
  %48 = add i32 %47, %45
  %49 = sdiv i32 %26, %27
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %454

51:                                               ; preds = %28
  %52 = sext i32 %48 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %5, i64 %52
  store float 0.000000e+00, float addrspace(1)* %53, align 4, !tbaa !16
  %54 = mul nsw i32 %48, %27
  %55 = add nsw i32 %48, 1
  %56 = mul nsw i32 %55, %27
  %57 = icmp slt i32 %54, %56
  br i1 %57, label %58, label %209

58:                                               ; preds = %51
  %59 = add i32 %27, -1
  %60 = and i32 %27, 7
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %76, label %62

62:                                               ; preds = %58, %62
  %63 = phi float [ %72, %62 ], [ 0.000000e+00, %58 ]
  %64 = phi i32 [ %73, %62 ], [ %54, %58 ]
  %65 = phi i32 [ %74, %62 ], [ 0, %58 ]
  %66 = sext i32 %64 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %12, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16
  %71 = fmul contract float %68, %70
  %72 = fadd contract float %63, %71
  store float %72, float addrspace(1)* %53, align 4, !tbaa !16
  %73 = add nsw i32 %64, 1
  %74 = add i32 %65, 1
  %75 = icmp eq i32 %74, %60
  br i1 %75, label %76, label %62, !llvm.loop !20

76:                                               ; preds = %62, %58
  %77 = phi float [ undef, %58 ], [ %72, %62 ]
  %78 = phi float [ 0.000000e+00, %58 ], [ %72, %62 ]
  %79 = phi i32 [ %54, %58 ], [ %73, %62 ]
  %80 = icmp ult i32 %59, 7
  br i1 %80, label %81, label %141

81:                                               ; preds = %141, %76
  %82 = phi float [ %77, %76 ], [ %206, %141 ]
  %83 = getelementptr inbounds float, float addrspace(1)* %18, i64 %52
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16
  %85 = fmul contract float %84, %82
  store float %85, float addrspace(1)* %53, align 4, !tbaa !16
  br i1 %57, label %86, label %213

86:                                               ; preds = %81
  %87 = add i32 %26, %25
  %88 = add i32 %87, 1
  %89 = add i32 %88, %27
  %90 = mul nsw i32 %48, %89
  %91 = add i32 %87, %90
  %92 = sub i32 %91, %54
  %93 = getelementptr inbounds float, float addrspace(1)* %13, i64 %52
  %94 = getelementptr inbounds float, float addrspace(1)* %14, i64 %52
  %95 = getelementptr inbounds float, float addrspace(1)* %9, i64 %52
  %96 = getelementptr inbounds float, float addrspace(1)* %7, i64 %52
  %97 = getelementptr inbounds float, float addrspace(1)* %15, i64 %52
  %98 = and i32 %27, 1
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %138, label %100

100:                                              ; preds = %86
  %101 = sext i32 %54 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %104 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %105 = fmul contract float %103, %104
  %106 = getelementptr inbounds float, float addrspace(1)* %17, i64 %101
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = fmul contract float %105, %107
  %109 = getelementptr inbounds float, float addrspace(1)* %4, i64 %101
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %108, %112
  %114 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %115 = sext i32 %91 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %24, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16
  %118 = fmul contract float %114, %117
  %119 = fadd contract float %113, %118
  %120 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %121 = getelementptr inbounds float, float addrspace(1)* %23, i64 %115
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = fmul contract float %120, %122
  %124 = fadd contract float %119, %123
  %125 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %126 = getelementptr inbounds float, float addrspace(1)* %22, i64 %115
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16
  %128 = fmul contract float %125, %127
  %129 = fadd contract float %124, %128
  %130 = getelementptr inbounds float, float addrspace(1)* %3, i64 %101
  store float %129, float addrspace(1)* %130, align 4, !tbaa !16
  %131 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %132 = getelementptr inbounds float, float addrspace(1)* %16, i64 %101
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16
  %134 = fmul contract float %131, %133
  %135 = fmul contract float %129, %134
  %136 = getelementptr inbounds float, float addrspace(1)* %10, i64 %101
  store float %135, float addrspace(1)* %136, align 4, !tbaa !16
  %137 = add nsw i32 %54, 1
  br label %138

138:                                              ; preds = %100, %86
  %139 = phi i32 [ %54, %86 ], [ %137, %100 ]
  %140 = icmp eq i32 %59, 0
  br i1 %140, label %213, label %243

141:                                              ; preds = %76, %141
  %142 = phi float [ %206, %141 ], [ %78, %76 ]
  %143 = phi i32 [ %207, %141 ], [ %79, %76 ]
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %12, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16
  %149 = fmul contract float %146, %148
  %150 = fadd contract float %142, %149
  store float %150, float addrspace(1)* %53, align 4, !tbaa !16
  %151 = add nsw i32 %143, 1
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %12, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !16
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !16
  %157 = fmul contract float %154, %156
  %158 = fadd contract float %150, %157
  store float %158, float addrspace(1)* %53, align 4, !tbaa !16
  %159 = add nsw i32 %143, 2
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %12, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !16
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %160
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !16
  %165 = fmul contract float %162, %164
  %166 = fadd contract float %158, %165
  store float %166, float addrspace(1)* %53, align 4, !tbaa !16
  %167 = add nsw i32 %143, 3
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %12, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !16
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !16
  %173 = fmul contract float %170, %172
  %174 = fadd contract float %166, %173
  store float %174, float addrspace(1)* %53, align 4, !tbaa !16
  %175 = add nsw i32 %143, 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %12, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !16
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %176
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !16
  %181 = fmul contract float %178, %180
  %182 = fadd contract float %174, %181
  store float %182, float addrspace(1)* %53, align 4, !tbaa !16
  %183 = add nsw i32 %143, 5
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %12, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !16
  %187 = getelementptr inbounds float, float addrspace(1)* %0, i64 %184
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !16
  %189 = fmul contract float %186, %188
  %190 = fadd contract float %182, %189
  store float %190, float addrspace(1)* %53, align 4, !tbaa !16
  %191 = add nsw i32 %143, 6
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %12, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !16
  %195 = getelementptr inbounds float, float addrspace(1)* %0, i64 %192
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !16
  %197 = fmul contract float %194, %196
  %198 = fadd contract float %190, %197
  store float %198, float addrspace(1)* %53, align 4, !tbaa !16
  %199 = add nsw i32 %143, 7
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %12, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !16
  %203 = getelementptr inbounds float, float addrspace(1)* %0, i64 %200
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !16
  %205 = fmul contract float %202, %204
  %206 = fadd contract float %198, %205
  store float %206, float addrspace(1)* %53, align 4, !tbaa !16
  %207 = add nsw i32 %143, 8
  %208 = icmp eq i32 %207, %56
  br i1 %208, label %81, label %141, !llvm.loop !22

209:                                              ; preds = %51
  %210 = getelementptr inbounds float, float addrspace(1)* %18, i64 %52
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !16
  %212 = fmul contract float %211, 0.000000e+00
  store float %212, float addrspace(1)* %53, align 4, !tbaa !16
  br label %213

213:                                              ; preds = %138, %243, %209, %81
  %214 = getelementptr inbounds float, float addrspace(1)* %8, i64 %52
  store float 0.000000e+00, float addrspace(1)* %214, align 4, !tbaa !16
  %215 = getelementptr inbounds float, float addrspace(1)* %6, i64 %52
  store float 0.000000e+00, float addrspace(1)* %215, align 4, !tbaa !16
  br i1 %57, label %216, label %322

216:                                              ; preds = %213
  %217 = add i32 %27, -1
  %218 = and i32 %27, 7
  %219 = icmp eq i32 %218, 0
  br i1 %219, label %240, label %220

220:                                              ; preds = %216, %220
  %221 = phi i32 [ %237, %220 ], [ %54, %216 ]
  %222 = phi i32 [ %238, %220 ], [ 0, %216 ]
  %223 = sext i32 %221 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %3, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !16
  %226 = getelementptr inbounds float, float addrspace(1)* %11, i64 %223
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !16
  %228 = fmul contract float %225, %227
  %229 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %230 = fadd contract float %229, %228
  store float %230, float addrspace(1)* %214, align 4, !tbaa !16
  %231 = load float, float addrspace(1)* %224, align 4, !tbaa !16
  %232 = getelementptr inbounds float, float addrspace(1)* %2, i64 %223
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !16
  %234 = fmul contract float %231, %233
  %235 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %236 = fadd contract float %235, %234
  store float %236, float addrspace(1)* %215, align 4, !tbaa !16
  %237 = add nsw i32 %221, 1
  %238 = add i32 %222, 1
  %239 = icmp eq i32 %238, %218
  br i1 %239, label %240, label %220, !llvm.loop !24

240:                                              ; preds = %220, %216
  %241 = phi i32 [ %54, %216 ], [ %237, %220 ]
  %242 = icmp ult i32 %217, 7
  br i1 %242, label %322, label %331

243:                                              ; preds = %138, %243
  %244 = phi i32 [ %320, %243 ], [ %139, %138 ]
  %245 = add i32 %92, %244
  %246 = sext i32 %244 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %0, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !16
  %249 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %250 = fmul contract float %248, %249
  %251 = getelementptr inbounds float, float addrspace(1)* %17, i64 %246
  %252 = load float, float addrspace(1)* %251, align 4, !tbaa !16
  %253 = fmul contract float %250, %252
  %254 = getelementptr inbounds float, float addrspace(1)* %4, i64 %246
  %255 = load float, float addrspace(1)* %254, align 4, !tbaa !16
  %256 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %257 = fmul contract float %255, %256
  %258 = fadd contract float %253, %257
  %259 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %260 = sext i32 %245 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %24, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !16
  %263 = fmul contract float %259, %262
  %264 = fadd contract float %258, %263
  %265 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %266 = getelementptr inbounds float, float addrspace(1)* %23, i64 %260
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !16
  %268 = fmul contract float %265, %267
  %269 = fadd contract float %264, %268
  %270 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %271 = getelementptr inbounds float, float addrspace(1)* %22, i64 %260
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !16
  %273 = fmul contract float %270, %272
  %274 = fadd contract float %269, %273
  %275 = getelementptr inbounds float, float addrspace(1)* %3, i64 %246
  store float %274, float addrspace(1)* %275, align 4, !tbaa !16
  %276 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %277 = getelementptr inbounds float, float addrspace(1)* %16, i64 %246
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !16
  %279 = fmul contract float %276, %278
  %280 = fmul contract float %274, %279
  %281 = getelementptr inbounds float, float addrspace(1)* %10, i64 %246
  store float %280, float addrspace(1)* %281, align 4, !tbaa !16
  %282 = add nsw i32 %244, 1
  %283 = add i32 %92, %282
  %284 = sext i32 %282 to i64
  %285 = getelementptr inbounds float, float addrspace(1)* %0, i64 %284
  %286 = load float, float addrspace(1)* %285, align 4, !tbaa !16
  %287 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %288 = fmul contract float %286, %287
  %289 = getelementptr inbounds float, float addrspace(1)* %17, i64 %284
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !16
  %291 = fmul contract float %288, %290
  %292 = getelementptr inbounds float, float addrspace(1)* %4, i64 %284
  %293 = load float, float addrspace(1)* %292, align 4, !tbaa !16
  %294 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %295 = fmul contract float %293, %294
  %296 = fadd contract float %291, %295
  %297 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %298 = sext i32 %283 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %24, i64 %298
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !16
  %301 = fmul contract float %297, %300
  %302 = fadd contract float %296, %301
  %303 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %304 = getelementptr inbounds float, float addrspace(1)* %23, i64 %298
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !16
  %306 = fmul contract float %303, %305
  %307 = fadd contract float %302, %306
  %308 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %309 = getelementptr inbounds float, float addrspace(1)* %22, i64 %298
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !16
  %311 = fmul contract float %308, %310
  %312 = fadd contract float %307, %311
  %313 = getelementptr inbounds float, float addrspace(1)* %3, i64 %284
  store float %312, float addrspace(1)* %313, align 4, !tbaa !16
  %314 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %315 = getelementptr inbounds float, float addrspace(1)* %16, i64 %284
  %316 = load float, float addrspace(1)* %315, align 4, !tbaa !16
  %317 = fmul contract float %314, %316
  %318 = fmul contract float %312, %317
  %319 = getelementptr inbounds float, float addrspace(1)* %10, i64 %284
  store float %318, float addrspace(1)* %319, align 4, !tbaa !16
  %320 = add nsw i32 %244, 2
  %321 = icmp eq i32 %320, %56
  br i1 %321, label %213, label %243, !llvm.loop !25

322:                                              ; preds = %240, %331, %213
  %323 = getelementptr inbounds float, float addrspace(1)* %20, i64 %52
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !16
  %325 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %326 = fmul contract float %324, %325
  store float %326, float addrspace(1)* %214, align 4, !tbaa !16
  %327 = getelementptr inbounds float, float addrspace(1)* %19, i64 %52
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !16
  %329 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %330 = fmul contract float %328, %329
  store float %330, float addrspace(1)* %215, align 4, !tbaa !16
  br label %454

331:                                              ; preds = %240, %331
  %332 = phi i32 [ %452, %331 ], [ %241, %240 ]
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %3, i64 %333
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !16
  %336 = getelementptr inbounds float, float addrspace(1)* %11, i64 %333
  %337 = load float, float addrspace(1)* %336, align 4, !tbaa !16
  %338 = fmul contract float %335, %337
  %339 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %340 = fadd contract float %339, %338
  store float %340, float addrspace(1)* %214, align 4, !tbaa !16
  %341 = load float, float addrspace(1)* %334, align 4, !tbaa !16
  %342 = getelementptr inbounds float, float addrspace(1)* %2, i64 %333
  %343 = load float, float addrspace(1)* %342, align 4, !tbaa !16
  %344 = fmul contract float %341, %343
  %345 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %346 = fadd contract float %345, %344
  store float %346, float addrspace(1)* %215, align 4, !tbaa !16
  %347 = add nsw i32 %332, 1
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds float, float addrspace(1)* %3, i64 %348
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !16
  %351 = getelementptr inbounds float, float addrspace(1)* %11, i64 %348
  %352 = load float, float addrspace(1)* %351, align 4, !tbaa !16
  %353 = fmul contract float %350, %352
  %354 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %355 = fadd contract float %354, %353
  store float %355, float addrspace(1)* %214, align 4, !tbaa !16
  %356 = load float, float addrspace(1)* %349, align 4, !tbaa !16
  %357 = getelementptr inbounds float, float addrspace(1)* %2, i64 %348
  %358 = load float, float addrspace(1)* %357, align 4, !tbaa !16
  %359 = fmul contract float %356, %358
  %360 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %361 = fadd contract float %360, %359
  store float %361, float addrspace(1)* %215, align 4, !tbaa !16
  %362 = add nsw i32 %332, 2
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds float, float addrspace(1)* %3, i64 %363
  %365 = load float, float addrspace(1)* %364, align 4, !tbaa !16
  %366 = getelementptr inbounds float, float addrspace(1)* %11, i64 %363
  %367 = load float, float addrspace(1)* %366, align 4, !tbaa !16
  %368 = fmul contract float %365, %367
  %369 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %370 = fadd contract float %369, %368
  store float %370, float addrspace(1)* %214, align 4, !tbaa !16
  %371 = load float, float addrspace(1)* %364, align 4, !tbaa !16
  %372 = getelementptr inbounds float, float addrspace(1)* %2, i64 %363
  %373 = load float, float addrspace(1)* %372, align 4, !tbaa !16
  %374 = fmul contract float %371, %373
  %375 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %376 = fadd contract float %375, %374
  store float %376, float addrspace(1)* %215, align 4, !tbaa !16
  %377 = add nsw i32 %332, 3
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds float, float addrspace(1)* %3, i64 %378
  %380 = load float, float addrspace(1)* %379, align 4, !tbaa !16
  %381 = getelementptr inbounds float, float addrspace(1)* %11, i64 %378
  %382 = load float, float addrspace(1)* %381, align 4, !tbaa !16
  %383 = fmul contract float %380, %382
  %384 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %385 = fadd contract float %384, %383
  store float %385, float addrspace(1)* %214, align 4, !tbaa !16
  %386 = load float, float addrspace(1)* %379, align 4, !tbaa !16
  %387 = getelementptr inbounds float, float addrspace(1)* %2, i64 %378
  %388 = load float, float addrspace(1)* %387, align 4, !tbaa !16
  %389 = fmul contract float %386, %388
  %390 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %391 = fadd contract float %390, %389
  store float %391, float addrspace(1)* %215, align 4, !tbaa !16
  %392 = add nsw i32 %332, 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds float, float addrspace(1)* %3, i64 %393
  %395 = load float, float addrspace(1)* %394, align 4, !tbaa !16
  %396 = getelementptr inbounds float, float addrspace(1)* %11, i64 %393
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !16
  %398 = fmul contract float %395, %397
  %399 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %400 = fadd contract float %399, %398
  store float %400, float addrspace(1)* %214, align 4, !tbaa !16
  %401 = load float, float addrspace(1)* %394, align 4, !tbaa !16
  %402 = getelementptr inbounds float, float addrspace(1)* %2, i64 %393
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !16
  %404 = fmul contract float %401, %403
  %405 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %406 = fadd contract float %405, %404
  store float %406, float addrspace(1)* %215, align 4, !tbaa !16
  %407 = add nsw i32 %332, 5
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds float, float addrspace(1)* %3, i64 %408
  %410 = load float, float addrspace(1)* %409, align 4, !tbaa !16
  %411 = getelementptr inbounds float, float addrspace(1)* %11, i64 %408
  %412 = load float, float addrspace(1)* %411, align 4, !tbaa !16
  %413 = fmul contract float %410, %412
  %414 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %415 = fadd contract float %414, %413
  store float %415, float addrspace(1)* %214, align 4, !tbaa !16
  %416 = load float, float addrspace(1)* %409, align 4, !tbaa !16
  %417 = getelementptr inbounds float, float addrspace(1)* %2, i64 %408
  %418 = load float, float addrspace(1)* %417, align 4, !tbaa !16
  %419 = fmul contract float %416, %418
  %420 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %421 = fadd contract float %420, %419
  store float %421, float addrspace(1)* %215, align 4, !tbaa !16
  %422 = add nsw i32 %332, 6
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds float, float addrspace(1)* %3, i64 %423
  %425 = load float, float addrspace(1)* %424, align 4, !tbaa !16
  %426 = getelementptr inbounds float, float addrspace(1)* %11, i64 %423
  %427 = load float, float addrspace(1)* %426, align 4, !tbaa !16
  %428 = fmul contract float %425, %427
  %429 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %430 = fadd contract float %429, %428
  store float %430, float addrspace(1)* %214, align 4, !tbaa !16
  %431 = load float, float addrspace(1)* %424, align 4, !tbaa !16
  %432 = getelementptr inbounds float, float addrspace(1)* %2, i64 %423
  %433 = load float, float addrspace(1)* %432, align 4, !tbaa !16
  %434 = fmul contract float %431, %433
  %435 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %436 = fadd contract float %435, %434
  store float %436, float addrspace(1)* %215, align 4, !tbaa !16
  %437 = add nsw i32 %332, 7
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds float, float addrspace(1)* %3, i64 %438
  %440 = load float, float addrspace(1)* %439, align 4, !tbaa !16
  %441 = getelementptr inbounds float, float addrspace(1)* %11, i64 %438
  %442 = load float, float addrspace(1)* %441, align 4, !tbaa !16
  %443 = fmul contract float %440, %442
  %444 = load float, float addrspace(1)* %214, align 4, !tbaa !16
  %445 = fadd contract float %444, %443
  store float %445, float addrspace(1)* %214, align 4, !tbaa !16
  %446 = load float, float addrspace(1)* %439, align 4, !tbaa !16
  %447 = getelementptr inbounds float, float addrspace(1)* %2, i64 %438
  %448 = load float, float addrspace(1)* %447, align 4, !tbaa !16
  %449 = fmul contract float %446, %448
  %450 = load float, float addrspace(1)* %215, align 4, !tbaa !16
  %451 = fadd contract float %450, %449
  store float %451, float addrspace(1)* %215, align 4, !tbaa !16
  %452 = add nsw i32 %332, 8
  %453 = icmp eq i32 %452, %56
  br i1 %453, label %322, label %331, !llvm.loop !26

454:                                              ; preds = %322, %28
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !23}
