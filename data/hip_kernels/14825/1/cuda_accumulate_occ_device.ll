; ModuleID = '../data/hip_kernels/14825/1/main.cu'
source_filename = "../data/hip_kernels/14825/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_objects = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19cuda_accumulate_occPfiiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %1
  %17 = icmp sgt i32 %4, 0
  br i1 %16, label %25, label %18

18:                                               ; preds = %6
  br i1 %17, label %19, label %150

19:                                               ; preds = %18
  %20 = mul i32 %14, %4
  %21 = and i32 %4, 7
  %22 = icmp ult i32 %4, 8
  br i1 %22, label %139, label %23

23:                                               ; preds = %19
  %24 = and i32 %4, -8
  br label %95

25:                                               ; preds = %6
  br i1 %17, label %26, label %150

26:                                               ; preds = %25
  %27 = mul nsw i32 %15, %2
  %28 = add i32 %27, %3
  %29 = mul i32 %14, %4
  %30 = and i32 %4, 7
  %31 = icmp ult i32 %4, 8
  br i1 %31, label %124, label %32

32:                                               ; preds = %26
  %33 = and i32 %4, -8
  br label %34

34:                                               ; preds = %34, %32
  %35 = phi i32 [ 0, %32 ], [ %92, %34 ]
  %36 = phi i32 [ 0, %32 ], [ %93, %34 ]
  %37 = add i32 %28, %35
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = add i32 %35, %29
  %42 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %41
  store float %40, float addrspace(3)* %42, align 4, !tbaa !7
  %43 = or i32 %35, 1
  %44 = add i32 %28, %43
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = add i32 %43, %29
  %49 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %48
  store float %47, float addrspace(3)* %49, align 4, !tbaa !7
  %50 = or i32 %35, 2
  %51 = add i32 %28, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = add i32 %50, %29
  %56 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %55
  store float %54, float addrspace(3)* %56, align 4, !tbaa !7
  %57 = or i32 %35, 3
  %58 = add i32 %28, %57
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = add i32 %57, %29
  %63 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %62
  store float %61, float addrspace(3)* %63, align 4, !tbaa !7
  %64 = or i32 %35, 4
  %65 = add i32 %28, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = add i32 %64, %29
  %70 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %69
  store float %68, float addrspace(3)* %70, align 4, !tbaa !7
  %71 = or i32 %35, 5
  %72 = add i32 %28, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = add i32 %71, %29
  %77 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %76
  store float %75, float addrspace(3)* %77, align 4, !tbaa !7
  %78 = or i32 %35, 6
  %79 = add i32 %28, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = add i32 %78, %29
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %83
  store float %82, float addrspace(3)* %84, align 4, !tbaa !7
  %85 = or i32 %35, 7
  %86 = add i32 %28, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = add i32 %85, %29
  %91 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %90
  store float %89, float addrspace(3)* %91, align 4, !tbaa !7
  %92 = add nuw nsw i32 %35, 8
  %93 = add i32 %36, 8
  %94 = icmp eq i32 %93, %33
  br i1 %94, label %124, label %34, !llvm.loop !11

95:                                               ; preds = %95, %23
  %96 = phi i32 [ 0, %23 ], [ %121, %95 ]
  %97 = phi i32 [ 0, %23 ], [ %122, %95 ]
  %98 = add i32 %96, %20
  %99 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %98
  store float 0.000000e+00, float addrspace(3)* %99, align 4, !tbaa !7
  %100 = or i32 %96, 1
  %101 = add i32 %100, %20
  %102 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %101
  store float 0.000000e+00, float addrspace(3)* %102, align 4, !tbaa !7
  %103 = or i32 %96, 2
  %104 = add i32 %103, %20
  %105 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %104
  store float 0.000000e+00, float addrspace(3)* %105, align 4, !tbaa !7
  %106 = or i32 %96, 3
  %107 = add i32 %106, %20
  %108 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %107
  store float 0.000000e+00, float addrspace(3)* %108, align 4, !tbaa !7
  %109 = or i32 %96, 4
  %110 = add i32 %109, %20
  %111 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %110
  store float 0.000000e+00, float addrspace(3)* %111, align 4, !tbaa !7
  %112 = or i32 %96, 5
  %113 = add i32 %112, %20
  %114 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %113
  store float 0.000000e+00, float addrspace(3)* %114, align 4, !tbaa !7
  %115 = or i32 %96, 6
  %116 = add i32 %115, %20
  %117 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %116
  store float 0.000000e+00, float addrspace(3)* %117, align 4, !tbaa !7
  %118 = or i32 %96, 7
  %119 = add i32 %118, %20
  %120 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %119
  store float 0.000000e+00, float addrspace(3)* %120, align 4, !tbaa !7
  %121 = add nuw nsw i32 %96, 8
  %122 = add i32 %97, 8
  %123 = icmp eq i32 %122, %24
  br i1 %123, label %139, label %95, !llvm.loop !13

124:                                              ; preds = %34, %26
  %125 = phi i32 [ 0, %26 ], [ %92, %34 ]
  %126 = icmp eq i32 %30, 0
  br i1 %126, label %150, label %127

127:                                              ; preds = %124, %127
  %128 = phi i32 [ %136, %127 ], [ %125, %124 ]
  %129 = phi i32 [ %137, %127 ], [ 0, %124 ]
  %130 = add i32 %28, %128
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = add i32 %128, %29
  %135 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %134
  store float %133, float addrspace(3)* %135, align 4, !tbaa !7
  %136 = add nuw nsw i32 %128, 1
  %137 = add i32 %129, 1
  %138 = icmp eq i32 %137, %30
  br i1 %138, label %150, label %127, !llvm.loop !14

139:                                              ; preds = %95, %19
  %140 = phi i32 [ 0, %19 ], [ %121, %95 ]
  %141 = icmp eq i32 %21, 0
  br i1 %141, label %150, label %142

142:                                              ; preds = %139, %142
  %143 = phi i32 [ %147, %142 ], [ %140, %139 ]
  %144 = phi i32 [ %148, %142 ], [ 0, %139 ]
  %145 = add i32 %143, %20
  %146 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %145
  store float 0.000000e+00, float addrspace(3)* %146, align 4, !tbaa !7
  %147 = add nuw nsw i32 %143, 1
  %148 = add i32 %144, 1
  %149 = icmp eq i32 %148, %21
  br i1 %149, label %150, label %142, !llvm.loop !16

150:                                              ; preds = %139, %142, %124, %127, %18, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %151 = icmp ult i16 %10, 2
  br i1 %151, label %160, label %152

152:                                              ; preds = %150
  %153 = icmp slt i32 %4, 1
  %154 = mul i32 %14, %4
  %155 = add i32 %4, -1
  %156 = and i32 %4, 7
  %157 = icmp ult i32 %155, 7
  %158 = and i32 %4, -8
  %159 = icmp eq i32 %156, 0
  br label %171

160:                                              ; preds = %263, %150
  %161 = icmp eq i32 %14, 0
  %162 = icmp sgt i32 %4, 0
  %163 = select i1 %161, i1 %162, i1 false
  br i1 %163, label %164, label %332

164:                                              ; preds = %160
  %165 = mul i32 %12, %2
  %166 = add i32 %165, %3
  %167 = and i32 %4, 7
  %168 = icmp ult i32 %4, 8
  br i1 %168, label %318, label %169

169:                                              ; preds = %164
  %170 = and i32 %4, -8
  br label %265

171:                                              ; preds = %152, %263
  %172 = phi i32 [ %11, %152 ], [ %173, %263 ]
  %173 = lshr i32 %172, 1
  %174 = icmp uge i32 %14, %173
  %175 = select i1 %174, i1 true, i1 %153
  br i1 %175, label %263, label %176

176:                                              ; preds = %171
  %177 = add nuw nsw i32 %173, %14
  %178 = mul i32 %177, %4
  br i1 %157, label %248, label %179

179:                                              ; preds = %176, %179
  %180 = phi i32 [ %245, %179 ], [ 0, %176 ]
  %181 = phi i32 [ %246, %179 ], [ 0, %176 ]
  %182 = add i32 %180, %178
  %183 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %182
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !7
  %185 = add i32 %180, %154
  %186 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %185
  %187 = load float, float addrspace(3)* %186, align 4, !tbaa !7
  %188 = fadd contract float %184, %187
  store float %188, float addrspace(3)* %186, align 4, !tbaa !7
  %189 = or i32 %180, 1
  %190 = add i32 %189, %178
  %191 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %190
  %192 = load float, float addrspace(3)* %191, align 4, !tbaa !7
  %193 = add i32 %189, %154
  %194 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %193
  %195 = load float, float addrspace(3)* %194, align 4, !tbaa !7
  %196 = fadd contract float %192, %195
  store float %196, float addrspace(3)* %194, align 4, !tbaa !7
  %197 = or i32 %180, 2
  %198 = add i32 %197, %178
  %199 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !7
  %201 = add i32 %197, %154
  %202 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %201
  %203 = load float, float addrspace(3)* %202, align 4, !tbaa !7
  %204 = fadd contract float %200, %203
  store float %204, float addrspace(3)* %202, align 4, !tbaa !7
  %205 = or i32 %180, 3
  %206 = add i32 %205, %178
  %207 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %206
  %208 = load float, float addrspace(3)* %207, align 4, !tbaa !7
  %209 = add i32 %205, %154
  %210 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %209
  %211 = load float, float addrspace(3)* %210, align 4, !tbaa !7
  %212 = fadd contract float %208, %211
  store float %212, float addrspace(3)* %210, align 4, !tbaa !7
  %213 = or i32 %180, 4
  %214 = add i32 %213, %178
  %215 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %214
  %216 = load float, float addrspace(3)* %215, align 4, !tbaa !7
  %217 = add i32 %213, %154
  %218 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %217
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !7
  %220 = fadd contract float %216, %219
  store float %220, float addrspace(3)* %218, align 4, !tbaa !7
  %221 = or i32 %180, 5
  %222 = add i32 %221, %178
  %223 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %222
  %224 = load float, float addrspace(3)* %223, align 4, !tbaa !7
  %225 = add i32 %221, %154
  %226 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %225
  %227 = load float, float addrspace(3)* %226, align 4, !tbaa !7
  %228 = fadd contract float %224, %227
  store float %228, float addrspace(3)* %226, align 4, !tbaa !7
  %229 = or i32 %180, 6
  %230 = add i32 %229, %178
  %231 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %230
  %232 = load float, float addrspace(3)* %231, align 4, !tbaa !7
  %233 = add i32 %229, %154
  %234 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %233
  %235 = load float, float addrspace(3)* %234, align 4, !tbaa !7
  %236 = fadd contract float %232, %235
  store float %236, float addrspace(3)* %234, align 4, !tbaa !7
  %237 = or i32 %180, 7
  %238 = add i32 %237, %178
  %239 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %238
  %240 = load float, float addrspace(3)* %239, align 4, !tbaa !7
  %241 = add i32 %237, %154
  %242 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %241
  %243 = load float, float addrspace(3)* %242, align 4, !tbaa !7
  %244 = fadd contract float %240, %243
  store float %244, float addrspace(3)* %242, align 4, !tbaa !7
  %245 = add nuw nsw i32 %180, 8
  %246 = add i32 %181, 8
  %247 = icmp eq i32 %246, %158
  br i1 %247, label %248, label %179, !llvm.loop !17

248:                                              ; preds = %179, %176
  %249 = phi i32 [ 0, %176 ], [ %245, %179 ]
  br i1 %159, label %263, label %250

250:                                              ; preds = %248, %250
  %251 = phi i32 [ %260, %250 ], [ %249, %248 ]
  %252 = phi i32 [ %261, %250 ], [ 0, %248 ]
  %253 = add i32 %251, %178
  %254 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %253
  %255 = load float, float addrspace(3)* %254, align 4, !tbaa !7
  %256 = add i32 %251, %154
  %257 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %256
  %258 = load float, float addrspace(3)* %257, align 4, !tbaa !7
  %259 = fadd contract float %255, %258
  store float %259, float addrspace(3)* %257, align 4, !tbaa !7
  %260 = add nuw nsw i32 %251, 1
  %261 = add i32 %252, 1
  %262 = icmp eq i32 %261, %156
  br i1 %262, label %263, label %250, !llvm.loop !18

263:                                              ; preds = %248, %250, %171
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %264 = icmp ult i32 %172, 4
  br i1 %264, label %160, label %171, !llvm.loop !19

265:                                              ; preds = %265, %169
  %266 = phi i32 [ 0, %169 ], [ %315, %265 ]
  %267 = phi i32 [ 0, %169 ], [ %316, %265 ]
  %268 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %266
  %269 = load float, float addrspace(3)* %268, align 4, !tbaa !7
  %270 = add i32 %166, %266
  %271 = zext i32 %270 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %5, i64 %271
  store float %269, float addrspace(1)* %272, align 4, !tbaa !7
  %273 = or i32 %266, 1
  %274 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %273
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !7
  %276 = add i32 %166, %273
  %277 = zext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %5, i64 %277
  store float %275, float addrspace(1)* %278, align 4, !tbaa !7
  %279 = or i32 %266, 2
  %280 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %279
  %281 = load float, float addrspace(3)* %280, align 4, !tbaa !7
  %282 = add i32 %166, %279
  %283 = zext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %5, i64 %283
  store float %281, float addrspace(1)* %284, align 4, !tbaa !7
  %285 = or i32 %266, 3
  %286 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %285
  %287 = load float, float addrspace(3)* %286, align 4, !tbaa !7
  %288 = add i32 %166, %285
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %5, i64 %289
  store float %287, float addrspace(1)* %290, align 4, !tbaa !7
  %291 = or i32 %266, 4
  %292 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %291
  %293 = load float, float addrspace(3)* %292, align 4, !tbaa !7
  %294 = add i32 %166, %291
  %295 = zext i32 %294 to i64
  %296 = getelementptr inbounds float, float addrspace(1)* %5, i64 %295
  store float %293, float addrspace(1)* %296, align 4, !tbaa !7
  %297 = or i32 %266, 5
  %298 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %297
  %299 = load float, float addrspace(3)* %298, align 4, !tbaa !7
  %300 = add i32 %166, %297
  %301 = zext i32 %300 to i64
  %302 = getelementptr inbounds float, float addrspace(1)* %5, i64 %301
  store float %299, float addrspace(1)* %302, align 4, !tbaa !7
  %303 = or i32 %266, 6
  %304 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %303
  %305 = load float, float addrspace(3)* %304, align 4, !tbaa !7
  %306 = add i32 %166, %303
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds float, float addrspace(1)* %5, i64 %307
  store float %305, float addrspace(1)* %308, align 4, !tbaa !7
  %309 = or i32 %266, 7
  %310 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %309
  %311 = load float, float addrspace(3)* %310, align 4, !tbaa !7
  %312 = add i32 %166, %309
  %313 = zext i32 %312 to i64
  %314 = getelementptr inbounds float, float addrspace(1)* %5, i64 %313
  store float %311, float addrspace(1)* %314, align 4, !tbaa !7
  %315 = add nuw nsw i32 %266, 8
  %316 = add i32 %267, 8
  %317 = icmp eq i32 %316, %170
  br i1 %317, label %318, label %265, !llvm.loop !20

318:                                              ; preds = %265, %164
  %319 = phi i32 [ 0, %164 ], [ %315, %265 ]
  %320 = icmp eq i32 %167, 0
  br i1 %320, label %332, label %321

321:                                              ; preds = %318, %321
  %322 = phi i32 [ %329, %321 ], [ %319, %318 ]
  %323 = phi i32 [ %330, %321 ], [ 0, %318 ]
  %324 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_objects, i32 0, i32 %322
  %325 = load float, float addrspace(3)* %324, align 4, !tbaa !7
  %326 = add i32 %166, %322
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %5, i64 %327
  store float %325, float addrspace(1)* %328, align 4, !tbaa !7
  %329 = add nuw nsw i32 %322, 1
  %330 = add i32 %323, 1
  %331 = icmp eq i32 %330, %167
  br i1 %331, label %332, label %321, !llvm.loop !21

332:                                              ; preds = %318, %321, %160
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !15}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !15}
