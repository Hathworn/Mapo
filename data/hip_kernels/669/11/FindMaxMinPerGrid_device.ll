; ModuleID = '../data/hip_kernels/669/11/main.cu'
source_filename = "../data/hip_kernels/669/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce = internal unnamed_addr addrspace(3) global [384 x float] undef, align 16
@_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce = internal unnamed_addr addrspace(3) global [384 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17FindMaxMinPerGridiiPfS_S_S_i(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = add nsw i32 %0, 15
  %9 = sdiv i32 %8, 16
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = icmp ult i32 %10, %0
  %12 = icmp sgt i32 %1, 1
  %13 = select i1 %11, i1 %12, i1 false
  br i1 %13, label %14, label %142

14:                                               ; preds = %7
  %15 = add i32 %1, -2
  %16 = add i32 %1, -1
  %17 = and i32 %16, 7
  %18 = icmp ult i32 %15, 7
  br i1 %18, label %122, label %19

19:                                               ; preds = %14
  %20 = and i32 %16, -8
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %119, %21 ]
  %23 = phi i32 [ 0, %19 ], [ %120, %21 ]
  %24 = mul nsw i32 %22, %0
  %25 = add i32 %24, %10
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = shl nsw i32 %22, 4
  %30 = add nuw i32 %29, %10
  %31 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %30
  store float %28, float addrspace(3)* %31, align 4, !tbaa !5
  %32 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %30
  store float %33, float addrspace(3)* %34, align 4, !tbaa !5
  %35 = or i32 %22, 1
  %36 = mul nsw i32 %35, %0
  %37 = add i32 %36, %10
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5, !amdgpu.noclobber !9
  %41 = shl nsw i32 %35, 4
  %42 = add nuw i32 %41, %10
  %43 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %42
  store float %40, float addrspace(3)* %43, align 4, !tbaa !5
  %44 = getelementptr inbounds float, float addrspace(1)* %3, i64 %38
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %42
  store float %45, float addrspace(3)* %46, align 4, !tbaa !5
  %47 = or i32 %22, 2
  %48 = mul nsw i32 %47, %0
  %49 = add i32 %48, %10
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = shl nsw i32 %47, 4
  %54 = add nuw i32 %53, %10
  %55 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %54
  store float %52, float addrspace(3)* %55, align 4, !tbaa !5
  %56 = getelementptr inbounds float, float addrspace(1)* %3, i64 %50
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %54
  store float %57, float addrspace(3)* %58, align 4, !tbaa !5
  %59 = or i32 %22, 3
  %60 = mul nsw i32 %59, %0
  %61 = add i32 %60, %10
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  %65 = shl nsw i32 %59, 4
  %66 = add nuw i32 %65, %10
  %67 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %66
  store float %64, float addrspace(3)* %67, align 4, !tbaa !5
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %62
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %66
  store float %69, float addrspace(3)* %70, align 4, !tbaa !5
  %71 = or i32 %22, 4
  %72 = mul nsw i32 %71, %0
  %73 = add i32 %72, %10
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = shl nsw i32 %71, 4
  %78 = add nuw i32 %77, %10
  %79 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %78
  store float %76, float addrspace(3)* %79, align 4, !tbaa !5
  %80 = getelementptr inbounds float, float addrspace(1)* %3, i64 %74
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %78
  store float %81, float addrspace(3)* %82, align 4, !tbaa !5
  %83 = or i32 %22, 5
  %84 = mul nsw i32 %83, %0
  %85 = add i32 %84, %10
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = shl nsw i32 %83, 4
  %90 = add nuw i32 %89, %10
  %91 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %90
  store float %88, float addrspace(3)* %91, align 4, !tbaa !5
  %92 = getelementptr inbounds float, float addrspace(1)* %3, i64 %86
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %90
  store float %93, float addrspace(3)* %94, align 4, !tbaa !5
  %95 = or i32 %22, 6
  %96 = mul nsw i32 %95, %0
  %97 = add i32 %96, %10
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5, !amdgpu.noclobber !9
  %101 = shl nsw i32 %95, 4
  %102 = add nuw i32 %101, %10
  %103 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %102
  store float %100, float addrspace(3)* %103, align 4, !tbaa !5
  %104 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  %106 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %102
  store float %105, float addrspace(3)* %106, align 4, !tbaa !5
  %107 = or i32 %22, 7
  %108 = mul nsw i32 %107, %0
  %109 = add i32 %108, %10
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5, !amdgpu.noclobber !9
  %113 = shl nsw i32 %107, 4
  %114 = add nuw i32 %113, %10
  %115 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %114
  store float %112, float addrspace(3)* %115, align 4, !tbaa !5
  %116 = getelementptr inbounds float, float addrspace(1)* %3, i64 %110
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %114
  store float %117, float addrspace(3)* %118, align 4, !tbaa !5
  %119 = add nuw nsw i32 %22, 8
  %120 = add i32 %23, 8
  %121 = icmp eq i32 %120, %20
  br i1 %121, label %122, label %21, !llvm.loop !10

122:                                              ; preds = %21, %14
  %123 = phi i32 [ 0, %14 ], [ %119, %21 ]
  %124 = icmp eq i32 %17, 0
  br i1 %124, label %142, label %125

125:                                              ; preds = %122, %125
  %126 = phi i32 [ %139, %125 ], [ %123, %122 ]
  %127 = phi i32 [ %140, %125 ], [ 0, %122 ]
  %128 = mul nsw i32 %126, %0
  %129 = add i32 %128, %10
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %2, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5, !amdgpu.noclobber !9
  %133 = shl nsw i32 %126, 4
  %134 = add nuw i32 %133, %10
  %135 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %134
  store float %132, float addrspace(3)* %135, align 4, !tbaa !5
  %136 = getelementptr inbounds float, float addrspace(1)* %3, i64 %130
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5, !amdgpu.noclobber !9
  %138 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %134
  store float %137, float addrspace(3)* %138, align 4, !tbaa !5
  %139 = add nuw nsw i32 %126, 1
  %140 = add i32 %127, 1
  %141 = icmp eq i32 %140, %17
  br i1 %141, label %142, label %125, !llvm.loop !12

142:                                              ; preds = %122, %125, %7
  %143 = icmp sgt i32 %0, 16
  br i1 %143, label %144, label %152

144:                                              ; preds = %142
  %145 = icmp slt i32 %1, 2
  %146 = tail call i32 @llvm.smax.i32(i32 %9, i32 2)
  %147 = add i32 %1, -1
  %148 = and i32 %147, 1
  %149 = icmp eq i32 %1, 2
  %150 = and i32 %147, -2
  %151 = icmp eq i32 %148, 0
  br label %161

152:                                              ; preds = %234, %142
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %153 = icmp sgt i32 %6, 0
  br i1 %153, label %154, label %237

154:                                              ; preds = %152
  %155 = icmp slt i32 %1, 2
  %156 = add i32 %1, -1
  %157 = and i32 %156, 1
  %158 = icmp eq i32 %1, 2
  %159 = and i32 %156, -2
  %160 = icmp eq i32 %157, 0
  br label %248

161:                                              ; preds = %144, %234
  %162 = phi i32 [ 1, %144 ], [ %235, %234 ]
  %163 = shl nsw i32 %162, 4
  %164 = add nuw i32 %163, %10
  %165 = icmp sge i32 %164, %0
  %166 = select i1 %165, i1 true, i1 %145
  br i1 %166, label %234, label %167

167:                                              ; preds = %161
  br i1 %149, label %213, label %168

168:                                              ; preds = %167, %209
  %169 = phi i32 [ %210, %209 ], [ 0, %167 ]
  %170 = phi i32 [ %211, %209 ], [ 0, %167 ]
  %171 = shl nsw i32 %169, 4
  %172 = add nuw i32 %171, %10
  %173 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %172
  %174 = load float, float addrspace(3)* %173, align 4, !tbaa !5
  %175 = mul nsw i32 %169, %0
  %176 = add nsw i32 %175, %164
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %2, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !5, !amdgpu.noclobber !9
  %180 = fcmp contract olt float %174, %179
  br i1 %180, label %181, label %182

181:                                              ; preds = %168
  store float %179, float addrspace(3)* %173, align 4, !tbaa !5
  br label %182

182:                                              ; preds = %181, %168
  %183 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %172
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !5
  %185 = getelementptr inbounds float, float addrspace(1)* %3, i64 %177
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !5, !amdgpu.noclobber !9
  %187 = fcmp contract ogt float %184, %186
  br i1 %187, label %188, label %189

188:                                              ; preds = %182
  store float %186, float addrspace(3)* %183, align 4, !tbaa !5
  br label %189

189:                                              ; preds = %182, %188
  %190 = or i32 %169, 1
  %191 = shl nsw i32 %190, 4
  %192 = add nuw i32 %191, %10
  %193 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %192
  %194 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %195 = mul nsw i32 %190, %0
  %196 = add nsw i32 %195, %164
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %2, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !5, !amdgpu.noclobber !9
  %200 = fcmp contract olt float %194, %199
  br i1 %200, label %201, label %202

201:                                              ; preds = %189
  store float %199, float addrspace(3)* %193, align 4, !tbaa !5
  br label %202

202:                                              ; preds = %201, %189
  %203 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %192
  %204 = load float, float addrspace(3)* %203, align 4, !tbaa !5
  %205 = getelementptr inbounds float, float addrspace(1)* %3, i64 %197
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !5, !amdgpu.noclobber !9
  %207 = fcmp contract ogt float %204, %206
  br i1 %207, label %208, label %209

208:                                              ; preds = %202
  store float %206, float addrspace(3)* %203, align 4, !tbaa !5
  br label %209

209:                                              ; preds = %208, %202
  %210 = add nuw nsw i32 %169, 2
  %211 = add i32 %170, 2
  %212 = icmp eq i32 %211, %150
  br i1 %212, label %213, label %168, !llvm.loop !14

213:                                              ; preds = %209, %167
  %214 = phi i32 [ 0, %167 ], [ %210, %209 ]
  br i1 %151, label %234, label %215

215:                                              ; preds = %213
  %216 = shl nsw i32 %214, 4
  %217 = add nuw i32 %216, %10
  %218 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %217
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !5
  %220 = mul nsw i32 %214, %0
  %221 = add nsw i32 %220, %164
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %2, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !5, !amdgpu.noclobber !9
  %225 = fcmp contract olt float %219, %224
  br i1 %225, label %226, label %227

226:                                              ; preds = %215
  store float %224, float addrspace(3)* %218, align 4, !tbaa !5
  br label %227

227:                                              ; preds = %226, %215
  %228 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %217
  %229 = load float, float addrspace(3)* %228, align 4, !tbaa !5
  %230 = getelementptr inbounds float, float addrspace(1)* %3, i64 %222
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !5, !amdgpu.noclobber !9
  %232 = fcmp contract ogt float %229, %231
  br i1 %232, label %233, label %234

233:                                              ; preds = %227
  store float %231, float addrspace(3)* %228, align 4, !tbaa !5
  br label %234

234:                                              ; preds = %213, %233, %227, %161
  %235 = add nuw nsw i32 %162, 1
  %236 = icmp eq i32 %235, %146
  br i1 %236, label %152, label %161, !llvm.loop !15

237:                                              ; preds = %319, %152
  %238 = icmp eq i32 %10, 0
  %239 = icmp sgt i32 %1, 1
  %240 = select i1 %238, i1 %239, i1 false
  br i1 %240, label %241, label %418

241:                                              ; preds = %237
  %242 = add i32 %1, -2
  %243 = add i32 %1, -1
  %244 = and i32 %243, 7
  %245 = icmp ult i32 %242, 7
  br i1 %245, label %401, label %246

246:                                              ; preds = %241
  %247 = and i32 %243, -8
  br label %324

248:                                              ; preds = %154, %319
  %249 = phi i32 [ 0, %154 ], [ %322, %319 ]
  %250 = phi i32 [ 1, %154 ], [ %321, %319 ]
  %251 = and i32 %250, %10
  %252 = icmp eq i32 %251, 0
  br i1 %252, label %253, label %319

253:                                              ; preds = %248
  %254 = shl nuw i32 1, %249
  %255 = add nuw i32 %254, %10
  %256 = icmp sge i32 %255, %0
  %257 = select i1 %256, i1 true, i1 %155
  br i1 %257, label %319, label %258

258:                                              ; preds = %253
  br i1 %158, label %300, label %259

259:                                              ; preds = %258, %296
  %260 = phi i32 [ %297, %296 ], [ 0, %258 ]
  %261 = phi i32 [ %298, %296 ], [ 0, %258 ]
  %262 = shl nsw i32 %260, 4
  %263 = add nuw nsw i32 %262, %10
  %264 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %263
  %265 = load float, float addrspace(3)* %264, align 4, !tbaa !5
  %266 = add nsw i32 %262, %255
  %267 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %266
  %268 = load float, float addrspace(3)* %267, align 4, !tbaa !5
  %269 = fcmp contract olt float %265, %268
  br i1 %269, label %270, label %271

270:                                              ; preds = %259
  store float %268, float addrspace(3)* %264, align 4, !tbaa !5
  br label %271

271:                                              ; preds = %270, %259
  %272 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %263
  %273 = load float, float addrspace(3)* %272, align 4, !tbaa !5
  %274 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %266
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %276 = fcmp contract ogt float %273, %275
  br i1 %276, label %277, label %278

277:                                              ; preds = %271
  store float %275, float addrspace(3)* %272, align 4, !tbaa !5
  br label %278

278:                                              ; preds = %271, %277
  %279 = shl i32 %260, 4
  %280 = or i32 %279, 16
  %281 = add nuw nsw i32 %280, %10
  %282 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %281
  %283 = load float, float addrspace(3)* %282, align 4, !tbaa !5
  %284 = add nsw i32 %280, %255
  %285 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %284
  %286 = load float, float addrspace(3)* %285, align 4, !tbaa !5
  %287 = fcmp contract olt float %283, %286
  br i1 %287, label %288, label %289

288:                                              ; preds = %278
  store float %286, float addrspace(3)* %282, align 4, !tbaa !5
  br label %289

289:                                              ; preds = %288, %278
  %290 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %281
  %291 = load float, float addrspace(3)* %290, align 4, !tbaa !5
  %292 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %284
  %293 = load float, float addrspace(3)* %292, align 4, !tbaa !5
  %294 = fcmp contract ogt float %291, %293
  br i1 %294, label %295, label %296

295:                                              ; preds = %289
  store float %293, float addrspace(3)* %290, align 4, !tbaa !5
  br label %296

296:                                              ; preds = %295, %289
  %297 = add nuw nsw i32 %260, 2
  %298 = add i32 %261, 2
  %299 = icmp eq i32 %298, %159
  br i1 %299, label %300, label %259, !llvm.loop !16

300:                                              ; preds = %296, %258
  %301 = phi i32 [ 0, %258 ], [ %297, %296 ]
  br i1 %160, label %319, label %302

302:                                              ; preds = %300
  %303 = shl nsw i32 %301, 4
  %304 = add nuw nsw i32 %303, %10
  %305 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %304
  %306 = load float, float addrspace(3)* %305, align 4, !tbaa !5
  %307 = add nsw i32 %303, %255
  %308 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %307
  %309 = load float, float addrspace(3)* %308, align 4, !tbaa !5
  %310 = fcmp contract olt float %306, %309
  br i1 %310, label %311, label %312

311:                                              ; preds = %302
  store float %309, float addrspace(3)* %305, align 4, !tbaa !5
  br label %312

312:                                              ; preds = %311, %302
  %313 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %304
  %314 = load float, float addrspace(3)* %313, align 4, !tbaa !5
  %315 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %307
  %316 = load float, float addrspace(3)* %315, align 4, !tbaa !5
  %317 = fcmp contract ogt float %314, %316
  br i1 %317, label %318, label %319

318:                                              ; preds = %312
  store float %316, float addrspace(3)* %313, align 4, !tbaa !5
  br label %319

319:                                              ; preds = %300, %318, %312, %253, %248
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %320 = shl i32 %250, 1
  %321 = add nuw nsw i32 %320, 1
  %322 = add nuw nsw i32 %249, 1
  %323 = icmp eq i32 %322, %6
  br i1 %323, label %237, label %248, !llvm.loop !17

324:                                              ; preds = %324, %246
  %325 = phi i32 [ 0, %246 ], [ %398, %324 ]
  %326 = phi i32 [ 0, %246 ], [ %399, %324 ]
  %327 = shl nsw i32 %325, 4
  %328 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %327
  %329 = load float, float addrspace(3)* %328, align 16, !tbaa !5
  %330 = zext i32 %325 to i64
  %331 = getelementptr inbounds float, float addrspace(1)* %4, i64 %330
  store float %329, float addrspace(1)* %331, align 4, !tbaa !5
  %332 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %327
  %333 = load float, float addrspace(3)* %332, align 16, !tbaa !5
  %334 = getelementptr inbounds float, float addrspace(1)* %5, i64 %330
  store float %333, float addrspace(1)* %334, align 4, !tbaa !5
  %335 = or i32 %325, 1
  %336 = shl nsw i32 %335, 4
  %337 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %336
  %338 = load float, float addrspace(3)* %337, align 16, !tbaa !5
  %339 = zext i32 %335 to i64
  %340 = getelementptr inbounds float, float addrspace(1)* %4, i64 %339
  store float %338, float addrspace(1)* %340, align 4, !tbaa !5
  %341 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %336
  %342 = load float, float addrspace(3)* %341, align 16, !tbaa !5
  %343 = getelementptr inbounds float, float addrspace(1)* %5, i64 %339
  store float %342, float addrspace(1)* %343, align 4, !tbaa !5
  %344 = or i32 %325, 2
  %345 = shl nsw i32 %344, 4
  %346 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %345
  %347 = load float, float addrspace(3)* %346, align 16, !tbaa !5
  %348 = zext i32 %344 to i64
  %349 = getelementptr inbounds float, float addrspace(1)* %4, i64 %348
  store float %347, float addrspace(1)* %349, align 4, !tbaa !5
  %350 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %345
  %351 = load float, float addrspace(3)* %350, align 16, !tbaa !5
  %352 = getelementptr inbounds float, float addrspace(1)* %5, i64 %348
  store float %351, float addrspace(1)* %352, align 4, !tbaa !5
  %353 = or i32 %325, 3
  %354 = shl nsw i32 %353, 4
  %355 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %354
  %356 = load float, float addrspace(3)* %355, align 16, !tbaa !5
  %357 = zext i32 %353 to i64
  %358 = getelementptr inbounds float, float addrspace(1)* %4, i64 %357
  store float %356, float addrspace(1)* %358, align 4, !tbaa !5
  %359 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %354
  %360 = load float, float addrspace(3)* %359, align 16, !tbaa !5
  %361 = getelementptr inbounds float, float addrspace(1)* %5, i64 %357
  store float %360, float addrspace(1)* %361, align 4, !tbaa !5
  %362 = or i32 %325, 4
  %363 = shl nsw i32 %362, 4
  %364 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %363
  %365 = load float, float addrspace(3)* %364, align 16, !tbaa !5
  %366 = zext i32 %362 to i64
  %367 = getelementptr inbounds float, float addrspace(1)* %4, i64 %366
  store float %365, float addrspace(1)* %367, align 4, !tbaa !5
  %368 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %363
  %369 = load float, float addrspace(3)* %368, align 16, !tbaa !5
  %370 = getelementptr inbounds float, float addrspace(1)* %5, i64 %366
  store float %369, float addrspace(1)* %370, align 4, !tbaa !5
  %371 = or i32 %325, 5
  %372 = shl nsw i32 %371, 4
  %373 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %372
  %374 = load float, float addrspace(3)* %373, align 16, !tbaa !5
  %375 = zext i32 %371 to i64
  %376 = getelementptr inbounds float, float addrspace(1)* %4, i64 %375
  store float %374, float addrspace(1)* %376, align 4, !tbaa !5
  %377 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %372
  %378 = load float, float addrspace(3)* %377, align 16, !tbaa !5
  %379 = getelementptr inbounds float, float addrspace(1)* %5, i64 %375
  store float %378, float addrspace(1)* %379, align 4, !tbaa !5
  %380 = or i32 %325, 6
  %381 = shl nsw i32 %380, 4
  %382 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %381
  %383 = load float, float addrspace(3)* %382, align 16, !tbaa !5
  %384 = zext i32 %380 to i64
  %385 = getelementptr inbounds float, float addrspace(1)* %4, i64 %384
  store float %383, float addrspace(1)* %385, align 4, !tbaa !5
  %386 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %381
  %387 = load float, float addrspace(3)* %386, align 16, !tbaa !5
  %388 = getelementptr inbounds float, float addrspace(1)* %5, i64 %384
  store float %387, float addrspace(1)* %388, align 4, !tbaa !5
  %389 = or i32 %325, 7
  %390 = shl nsw i32 %389, 4
  %391 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %390
  %392 = load float, float addrspace(3)* %391, align 16, !tbaa !5
  %393 = zext i32 %389 to i64
  %394 = getelementptr inbounds float, float addrspace(1)* %4, i64 %393
  store float %392, float addrspace(1)* %394, align 4, !tbaa !5
  %395 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %390
  %396 = load float, float addrspace(3)* %395, align 16, !tbaa !5
  %397 = getelementptr inbounds float, float addrspace(1)* %5, i64 %393
  store float %396, float addrspace(1)* %397, align 4, !tbaa !5
  %398 = add nuw nsw i32 %325, 8
  %399 = add i32 %326, 8
  %400 = icmp eq i32 %399, %247
  br i1 %400, label %401, label %324, !llvm.loop !18

401:                                              ; preds = %324, %241
  %402 = phi i32 [ 0, %241 ], [ %398, %324 ]
  %403 = icmp eq i32 %244, 0
  br i1 %403, label %418, label %404

404:                                              ; preds = %401, %404
  %405 = phi i32 [ %415, %404 ], [ %402, %401 ]
  %406 = phi i32 [ %416, %404 ], [ 0, %401 ]
  %407 = shl nsw i32 %405, 4
  %408 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MaxReduce, i32 0, i32 %407
  %409 = load float, float addrspace(3)* %408, align 16, !tbaa !5
  %410 = zext i32 %405 to i64
  %411 = getelementptr inbounds float, float addrspace(1)* %4, i64 %410
  store float %409, float addrspace(1)* %411, align 4, !tbaa !5
  %412 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ17FindMaxMinPerGridiiPfS_S_S_iE9MinReduce, i32 0, i32 %407
  %413 = load float, float addrspace(3)* %412, align 16, !tbaa !5
  %414 = getelementptr inbounds float, float addrspace(1)* %5, i64 %410
  store float %413, float addrspace(1)* %414, align 4, !tbaa !5
  %415 = add nuw nsw i32 %405, 1
  %416 = add i32 %406, 1
  %417 = icmp eq i32 %416, %244
  br i1 %417, label %418, label %404, !llvm.loop !19

418:                                              ; preds = %401, %404, %237
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !13}
