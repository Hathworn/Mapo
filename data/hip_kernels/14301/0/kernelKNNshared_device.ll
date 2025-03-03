; ModuleID = '../data/hip_kernels/14301/0/main.cu'
source_filename = "../data/hip_kernels/14301/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@array = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 1

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15kernelKNNsharedPKfS0_PiPfiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = mul i32 %14, %7
  %18 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to i32 addrspace(3)*), i32 %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %16, %19
  %21 = freeze i32 %20
  %22 = icmp ult i32 %21, %6
  br i1 %22, label %23, label %383

23:                                               ; preds = %9
  %24 = icmp sgt i32 %7, 0
  br i1 %24, label %25, label %42

25:                                               ; preds = %23
  %26 = mul i32 %19, %7
  %27 = and i32 %7, 7
  %28 = icmp ult i32 %7, 8
  br i1 %28, label %31, label %29

29:                                               ; preds = %25
  %30 = and i32 %7, -8
  br label %62

31:                                               ; preds = %62, %25
  %32 = phi i32 [ 0, %25 ], [ %88, %62 ]
  %33 = icmp eq i32 %27, 0
  br i1 %33, label %42, label %34

34:                                               ; preds = %31, %34
  %35 = phi i32 [ %39, %34 ], [ %32, %31 ]
  %36 = phi i32 [ %40, %34 ], [ 0, %31 ]
  %37 = add i32 %35, %26
  %38 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %37
  store float 0x7FF0000000000000, float addrspace(3)* %38, align 4, !tbaa !7
  %39 = add nuw nsw i32 %35, 1
  %40 = add i32 %36, 1
  %41 = icmp eq i32 %40, %27
  br i1 %41, label %42, label %34, !llvm.loop !11

42:                                               ; preds = %31, %34, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = urem i32 %21, %5
  %44 = sub nuw i32 %21, %43
  %45 = icmp sgt i32 %5, 0
  br i1 %45, label %46, label %91

46:                                               ; preds = %42
  %47 = sub i32 %43, %8
  %48 = add i32 %43, %8
  %49 = sext i32 %21 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = icmp sgt i32 %4, 0
  %52 = mul i32 %19, %7
  %53 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %52
  %54 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %52
  %55 = add nsw i32 %7, -1
  %56 = getelementptr inbounds float, float addrspace(3)* %53, i32 %7
  %57 = getelementptr inbounds float, float addrspace(3)* %56, i32 -1
  %58 = and i32 %4, 7
  %59 = icmp ult i32 %4, 8
  %60 = and i32 %4, -8
  %61 = icmp eq i32 %58, 0
  br label %98

62:                                               ; preds = %62, %29
  %63 = phi i32 [ 0, %29 ], [ %88, %62 ]
  %64 = phi i32 [ 0, %29 ], [ %89, %62 ]
  %65 = add i32 %63, %26
  %66 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %65
  store float 0x7FF0000000000000, float addrspace(3)* %66, align 4, !tbaa !7
  %67 = or i32 %63, 1
  %68 = add i32 %67, %26
  %69 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %68
  store float 0x7FF0000000000000, float addrspace(3)* %69, align 4, !tbaa !7
  %70 = or i32 %63, 2
  %71 = add i32 %70, %26
  %72 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %71
  store float 0x7FF0000000000000, float addrspace(3)* %72, align 4, !tbaa !7
  %73 = or i32 %63, 3
  %74 = add i32 %73, %26
  %75 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %74
  store float 0x7FF0000000000000, float addrspace(3)* %75, align 4, !tbaa !7
  %76 = or i32 %63, 4
  %77 = add i32 %76, %26
  %78 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %77
  store float 0x7FF0000000000000, float addrspace(3)* %78, align 4, !tbaa !7
  %79 = or i32 %63, 5
  %80 = add i32 %79, %26
  %81 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %80
  store float 0x7FF0000000000000, float addrspace(3)* %81, align 4, !tbaa !7
  %82 = or i32 %63, 6
  %83 = add i32 %82, %26
  %84 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %83
  store float 0x7FF0000000000000, float addrspace(3)* %84, align 4, !tbaa !7
  %85 = or i32 %63, 7
  %86 = add i32 %85, %26
  %87 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %86
  store float 0x7FF0000000000000, float addrspace(3)* %87, align 4, !tbaa !7
  %88 = add nuw nsw i32 %63, 8
  %89 = add i32 %64, 8
  %90 = icmp eq i32 %89, %30
  br i1 %90, label %31, label %62, !llvm.loop !13

91:                                               ; preds = %267, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %24, label %92, label %383

92:                                               ; preds = %91
  %93 = mul i32 %19, %7
  %94 = and i32 %7, 7
  %95 = icmp ult i32 %7, 8
  br i1 %95, label %364, label %96

96:                                               ; preds = %92
  %97 = and i32 %7, -8
  br label %271

98:                                               ; preds = %46, %267
  %99 = phi float [ 0x7FF0000000000000, %46 ], [ %268, %267 ]
  %100 = phi i32 [ 0, %46 ], [ %269, %267 ]
  %101 = icmp slt i32 %100, %47
  %102 = icmp sgt i32 %100, %48
  %103 = or i1 %101, %102
  br i1 %103, label %104, label %267

104:                                              ; preds = %98
  %105 = add i32 %44, %100
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  br i1 %51, label %108, label %242

108:                                              ; preds = %104
  br i1 %59, label %219, label %109

109:                                              ; preds = %108, %109
  %110 = phi i32 [ %216, %109 ], [ 0, %108 ]
  %111 = phi float [ %215, %109 ], [ 0.000000e+00, %108 ]
  %112 = phi i32 [ %217, %109 ], [ 0, %108 ]
  %113 = mul nsw i32 %110, %6
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %50, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = getelementptr inbounds float, float addrspace(1)* %107, i64 %114
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = fsub contract float %118, %116
  %120 = fcmp contract olt float %119, 0.000000e+00
  %121 = fneg contract float %119
  %122 = select contract i1 %120, float %121, float %119
  %123 = fcmp contract olt float %111, %122
  %124 = select contract i1 %123, float %122, float %111
  %125 = or i32 %110, 1
  %126 = mul nsw i32 %125, %6
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %50, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = getelementptr inbounds float, float addrspace(1)* %107, i64 %127
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = fsub contract float %131, %129
  %133 = fcmp contract olt float %132, 0.000000e+00
  %134 = fneg contract float %132
  %135 = select contract i1 %133, float %134, float %132
  %136 = fcmp contract olt float %124, %135
  %137 = select contract i1 %136, float %135, float %124
  %138 = or i32 %110, 2
  %139 = mul nsw i32 %138, %6
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %50, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = getelementptr inbounds float, float addrspace(1)* %107, i64 %140
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = fsub contract float %144, %142
  %146 = fcmp contract olt float %145, 0.000000e+00
  %147 = fneg contract float %145
  %148 = select contract i1 %146, float %147, float %145
  %149 = fcmp contract olt float %137, %148
  %150 = select contract i1 %149, float %148, float %137
  %151 = or i32 %110, 3
  %152 = mul nsw i32 %151, %6
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %50, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = getelementptr inbounds float, float addrspace(1)* %107, i64 %153
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = fsub contract float %157, %155
  %159 = fcmp contract olt float %158, 0.000000e+00
  %160 = fneg contract float %158
  %161 = select contract i1 %159, float %160, float %158
  %162 = fcmp contract olt float %150, %161
  %163 = select contract i1 %162, float %161, float %150
  %164 = or i32 %110, 4
  %165 = mul nsw i32 %164, %6
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %50, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7, !amdgpu.noclobber !5
  %169 = getelementptr inbounds float, float addrspace(1)* %107, i64 %166
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7, !amdgpu.noclobber !5
  %171 = fsub contract float %170, %168
  %172 = fcmp contract olt float %171, 0.000000e+00
  %173 = fneg contract float %171
  %174 = select contract i1 %172, float %173, float %171
  %175 = fcmp contract olt float %163, %174
  %176 = select contract i1 %175, float %174, float %163
  %177 = or i32 %110, 5
  %178 = mul nsw i32 %177, %6
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %50, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7, !amdgpu.noclobber !5
  %182 = getelementptr inbounds float, float addrspace(1)* %107, i64 %179
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !7, !amdgpu.noclobber !5
  %184 = fsub contract float %183, %181
  %185 = fcmp contract olt float %184, 0.000000e+00
  %186 = fneg contract float %184
  %187 = select contract i1 %185, float %186, float %184
  %188 = fcmp contract olt float %176, %187
  %189 = select contract i1 %188, float %187, float %176
  %190 = or i32 %110, 6
  %191 = mul nsw i32 %190, %6
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %50, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7, !amdgpu.noclobber !5
  %195 = getelementptr inbounds float, float addrspace(1)* %107, i64 %192
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7, !amdgpu.noclobber !5
  %197 = fsub contract float %196, %194
  %198 = fcmp contract olt float %197, 0.000000e+00
  %199 = fneg contract float %197
  %200 = select contract i1 %198, float %199, float %197
  %201 = fcmp contract olt float %189, %200
  %202 = select contract i1 %201, float %200, float %189
  %203 = or i32 %110, 7
  %204 = mul nsw i32 %203, %6
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %50, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !7, !amdgpu.noclobber !5
  %208 = getelementptr inbounds float, float addrspace(1)* %107, i64 %205
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !7, !amdgpu.noclobber !5
  %210 = fsub contract float %209, %207
  %211 = fcmp contract olt float %210, 0.000000e+00
  %212 = fneg contract float %210
  %213 = select contract i1 %211, float %212, float %210
  %214 = fcmp contract olt float %202, %213
  %215 = select contract i1 %214, float %213, float %202
  %216 = add nuw nsw i32 %110, 8
  %217 = add i32 %112, 8
  %218 = icmp eq i32 %217, %60
  br i1 %218, label %219, label %109, !llvm.loop !15

219:                                              ; preds = %109, %108
  %220 = phi float [ undef, %108 ], [ %215, %109 ]
  %221 = phi i32 [ 0, %108 ], [ %216, %109 ]
  %222 = phi float [ 0.000000e+00, %108 ], [ %215, %109 ]
  br i1 %61, label %242, label %223

223:                                              ; preds = %219, %223
  %224 = phi i32 [ %239, %223 ], [ %221, %219 ]
  %225 = phi float [ %238, %223 ], [ %222, %219 ]
  %226 = phi i32 [ %240, %223 ], [ 0, %219 ]
  %227 = mul nsw i32 %224, %6
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %50, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !7, !amdgpu.noclobber !5
  %231 = getelementptr inbounds float, float addrspace(1)* %107, i64 %228
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7, !amdgpu.noclobber !5
  %233 = fsub contract float %232, %230
  %234 = fcmp contract olt float %233, 0.000000e+00
  %235 = fneg contract float %233
  %236 = select contract i1 %234, float %235, float %233
  %237 = fcmp contract olt float %225, %236
  %238 = select contract i1 %237, float %236, float %225
  %239 = add nuw nsw i32 %224, 1
  %240 = add i32 %226, 1
  %241 = icmp eq i32 %240, %58
  br i1 %241, label %242, label %223, !llvm.loop !16

242:                                              ; preds = %219, %223, %104
  %243 = phi float [ 0.000000e+00, %104 ], [ %220, %219 ], [ %238, %223 ]
  %244 = fcmp contract ugt float %243, %99
  br i1 %244, label %267, label %245

245:                                              ; preds = %242, %245
  %246 = phi i32 [ %252, %245 ], [ 0, %242 ]
  %247 = getelementptr inbounds float, float addrspace(3)* %53, i32 %246
  %248 = load float, float addrspace(3)* %247, align 4, !tbaa !7
  %249 = fcmp contract olt float %248, %243
  %250 = icmp slt i32 %246, %55
  %251 = select i1 %249, i1 %250, i1 false
  %252 = add nuw nsw i32 %246, 1
  br i1 %251, label %245, label %253, !llvm.loop !17

253:                                              ; preds = %245
  br i1 %250, label %254, label %264

254:                                              ; preds = %253, %254
  %255 = phi i32 [ %262, %254 ], [ %55, %253 ]
  %256 = getelementptr inbounds float, float addrspace(3)* %53, i32 %255
  %257 = getelementptr inbounds float, float addrspace(3)* %256, i32 -1
  %258 = load float, float addrspace(3)* %257, align 4, !tbaa !7
  store float %258, float addrspace(3)* %256, align 4, !tbaa !7
  %259 = getelementptr inbounds i32, i32 addrspace(3)* %54, i32 %255
  %260 = getelementptr inbounds i32, i32 addrspace(3)* %259, i32 -1
  %261 = load i32, i32 addrspace(3)* %260, align 4, !tbaa !18
  store i32 %261, i32 addrspace(3)* %259, align 4, !tbaa !18
  %262 = add nsw i32 %255, -1
  %263 = icmp sgt i32 %262, %246
  br i1 %263, label %254, label %264, !llvm.loop !20

264:                                              ; preds = %254, %253
  store float %243, float addrspace(3)* %247, align 4, !tbaa !7
  %265 = getelementptr inbounds i32, i32 addrspace(3)* %54, i32 %246
  store i32 %100, i32 addrspace(3)* %265, align 4, !tbaa !18
  %266 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  br label %267

267:                                              ; preds = %242, %264, %98
  %268 = phi float [ %99, %98 ], [ %266, %264 ], [ %99, %242 ]
  %269 = add nuw nsw i32 %100, 1
  %270 = icmp eq i32 %269, %5
  br i1 %270, label %91, label %98, !llvm.loop !21

271:                                              ; preds = %271, %96
  %272 = phi i32 [ 0, %96 ], [ %361, %271 ]
  %273 = phi i32 [ 0, %96 ], [ %362, %271 ]
  %274 = add i32 %272, %93
  %275 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %274
  %276 = load i32, i32 addrspace(3)* %275, align 4, !tbaa !18
  %277 = mul nsw i32 %272, %6
  %278 = add i32 %277, %21
  %279 = zext i32 %278 to i64
  %280 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %279
  store i32 %276, i32 addrspace(1)* %280, align 4, !tbaa !18
  %281 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %274
  %282 = load float, float addrspace(3)* %281, align 4, !tbaa !7
  %283 = getelementptr inbounds float, float addrspace(1)* %3, i64 %279
  store float %282, float addrspace(1)* %283, align 4, !tbaa !7
  %284 = or i32 %272, 1
  %285 = add i32 %284, %93
  %286 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %285
  %287 = load i32, i32 addrspace(3)* %286, align 4, !tbaa !18
  %288 = mul nsw i32 %284, %6
  %289 = add i32 %288, %21
  %290 = zext i32 %289 to i64
  %291 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %290
  store i32 %287, i32 addrspace(1)* %291, align 4, !tbaa !18
  %292 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %285
  %293 = load float, float addrspace(3)* %292, align 4, !tbaa !7
  %294 = getelementptr inbounds float, float addrspace(1)* %3, i64 %290
  store float %293, float addrspace(1)* %294, align 4, !tbaa !7
  %295 = or i32 %272, 2
  %296 = add i32 %295, %93
  %297 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %296
  %298 = load i32, i32 addrspace(3)* %297, align 4, !tbaa !18
  %299 = mul nsw i32 %295, %6
  %300 = add i32 %299, %21
  %301 = zext i32 %300 to i64
  %302 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %301
  store i32 %298, i32 addrspace(1)* %302, align 4, !tbaa !18
  %303 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %296
  %304 = load float, float addrspace(3)* %303, align 4, !tbaa !7
  %305 = getelementptr inbounds float, float addrspace(1)* %3, i64 %301
  store float %304, float addrspace(1)* %305, align 4, !tbaa !7
  %306 = or i32 %272, 3
  %307 = add i32 %306, %93
  %308 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %307
  %309 = load i32, i32 addrspace(3)* %308, align 4, !tbaa !18
  %310 = mul nsw i32 %306, %6
  %311 = add i32 %310, %21
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %312
  store i32 %309, i32 addrspace(1)* %313, align 4, !tbaa !18
  %314 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %307
  %315 = load float, float addrspace(3)* %314, align 4, !tbaa !7
  %316 = getelementptr inbounds float, float addrspace(1)* %3, i64 %312
  store float %315, float addrspace(1)* %316, align 4, !tbaa !7
  %317 = or i32 %272, 4
  %318 = add i32 %317, %93
  %319 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %318
  %320 = load i32, i32 addrspace(3)* %319, align 4, !tbaa !18
  %321 = mul nsw i32 %317, %6
  %322 = add i32 %321, %21
  %323 = zext i32 %322 to i64
  %324 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %323
  store i32 %320, i32 addrspace(1)* %324, align 4, !tbaa !18
  %325 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %318
  %326 = load float, float addrspace(3)* %325, align 4, !tbaa !7
  %327 = getelementptr inbounds float, float addrspace(1)* %3, i64 %323
  store float %326, float addrspace(1)* %327, align 4, !tbaa !7
  %328 = or i32 %272, 5
  %329 = add i32 %328, %93
  %330 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %329
  %331 = load i32, i32 addrspace(3)* %330, align 4, !tbaa !18
  %332 = mul nsw i32 %328, %6
  %333 = add i32 %332, %21
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %334
  store i32 %331, i32 addrspace(1)* %335, align 4, !tbaa !18
  %336 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %329
  %337 = load float, float addrspace(3)* %336, align 4, !tbaa !7
  %338 = getelementptr inbounds float, float addrspace(1)* %3, i64 %334
  store float %337, float addrspace(1)* %338, align 4, !tbaa !7
  %339 = or i32 %272, 6
  %340 = add i32 %339, %93
  %341 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %340
  %342 = load i32, i32 addrspace(3)* %341, align 4, !tbaa !18
  %343 = mul nsw i32 %339, %6
  %344 = add i32 %343, %21
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %345
  store i32 %342, i32 addrspace(1)* %346, align 4, !tbaa !18
  %347 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %340
  %348 = load float, float addrspace(3)* %347, align 4, !tbaa !7
  %349 = getelementptr inbounds float, float addrspace(1)* %3, i64 %345
  store float %348, float addrspace(1)* %349, align 4, !tbaa !7
  %350 = or i32 %272, 7
  %351 = add i32 %350, %93
  %352 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %351
  %353 = load i32, i32 addrspace(3)* %352, align 4, !tbaa !18
  %354 = mul nsw i32 %350, %6
  %355 = add i32 %354, %21
  %356 = zext i32 %355 to i64
  %357 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %356
  store i32 %353, i32 addrspace(1)* %357, align 4, !tbaa !18
  %358 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %351
  %359 = load float, float addrspace(3)* %358, align 4, !tbaa !7
  %360 = getelementptr inbounds float, float addrspace(1)* %3, i64 %356
  store float %359, float addrspace(1)* %360, align 4, !tbaa !7
  %361 = add nuw nsw i32 %272, 8
  %362 = add i32 %273, 8
  %363 = icmp eq i32 %362, %97
  br i1 %363, label %364, label %271, !llvm.loop !22

364:                                              ; preds = %271, %92
  %365 = phi i32 [ 0, %92 ], [ %361, %271 ]
  %366 = icmp eq i32 %94, 0
  br i1 %366, label %383, label %367

367:                                              ; preds = %364, %367
  %368 = phi i32 [ %380, %367 ], [ %365, %364 ]
  %369 = phi i32 [ %381, %367 ], [ 0, %364 ]
  %370 = add i32 %368, %93
  %371 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %370
  %372 = load i32, i32 addrspace(3)* %371, align 4, !tbaa !18
  %373 = mul nsw i32 %368, %6
  %374 = add i32 %373, %21
  %375 = zext i32 %374 to i64
  %376 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %375
  store i32 %372, i32 addrspace(1)* %376, align 4, !tbaa !18
  %377 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to float addrspace(3)*), i32 %370
  %378 = load float, float addrspace(3)* %377, align 4, !tbaa !7
  %379 = getelementptr inbounds float, float addrspace(1)* %3, i64 %375
  store float %378, float addrspace(1)* %379, align 4, !tbaa !7
  %380 = add nuw nsw i32 %368, 1
  %381 = add i32 %369, 1
  %382 = icmp eq i32 %381, %94
  br i1 %382, label %383, label %367, !llvm.loop !23

383:                                              ; preds = %364, %367, %91, %9
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !14}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !9, i64 0}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !12}
