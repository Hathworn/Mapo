; ModuleID = '../data/hip_kernels/15733/2/main.cu'
source_filename = "../data/hip_kernels/15733/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@mask = protected addrspace(4) externally_initialized global [64 x i32] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([64 x i32] addrspace(4)* @mask to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7conv_2dPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 2, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = add nsw i32 %12, -4
  %22 = add nsw i32 %20, -4
  %23 = icmp sgt i32 %12, 3
  %24 = icmp slt i32 %21, %2
  %25 = select i1 %23, i1 %24, i1 false
  %26 = mul nsw i32 %21, %2
  br i1 %25, label %27, label %38

27:                                               ; preds = %3
  %28 = icmp sgt i32 %20, 3
  %29 = icmp slt i32 %22, %2
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %38

31:                                               ; preds = %27
  %32 = add nsw i32 %22, %26
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 0), align 16, !tbaa !7
  %37 = mul nsw i32 %36, %35
  br label %38

38:                                               ; preds = %3, %31, %27
  %39 = phi i32 [ %37, %31 ], [ 0, %27 ], [ 0, %3 ]
  br i1 %25, label %40, label %53

40:                                               ; preds = %38
  %41 = add nsw i32 %20, -3
  %42 = icmp sgt i32 %20, 2
  %43 = icmp slt i32 %41, %2
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %45, label %53

45:                                               ; preds = %40
  %46 = add nsw i32 %41, %26
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 1), align 4, !tbaa !7
  %51 = mul nsw i32 %50, %49
  %52 = add nsw i32 %51, %39
  br label %53

53:                                               ; preds = %45, %40, %38
  %54 = phi i32 [ %52, %45 ], [ %39, %40 ], [ %39, %38 ]
  br i1 %25, label %55, label %68

55:                                               ; preds = %53
  %56 = add nsw i32 %20, -2
  %57 = icmp sgt i32 %20, 1
  %58 = icmp slt i32 %56, %2
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %60, label %68

60:                                               ; preds = %55
  %61 = add nsw i32 %56, %26
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 2), align 8, !tbaa !7
  %66 = mul nsw i32 %65, %64
  %67 = add nsw i32 %66, %54
  br label %68

68:                                               ; preds = %60, %55, %53
  %69 = phi i32 [ %67, %60 ], [ %54, %55 ], [ %54, %53 ]
  br i1 %25, label %70, label %83

70:                                               ; preds = %68
  %71 = icmp sgt i32 %20, 0
  %72 = icmp sle i32 %20, %2
  %73 = select i1 %71, i1 %72, i1 false
  br i1 %73, label %74, label %83

74:                                               ; preds = %70
  %75 = add nsw i32 %20, -1
  %76 = add nsw i32 %75, %26
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 3), align 4, !tbaa !7
  %81 = mul nsw i32 %80, %79
  %82 = add nsw i32 %81, %69
  br label %83

83:                                               ; preds = %74, %70, %68
  %84 = phi i32 [ %82, %74 ], [ %69, %70 ], [ %69, %68 ]
  br i1 %25, label %85, label %97

85:                                               ; preds = %83
  %86 = icmp sgt i32 %20, -1
  %87 = icmp slt i32 %20, %2
  %88 = select i1 %86, i1 %87, i1 false
  br i1 %88, label %89, label %97

89:                                               ; preds = %85
  %90 = add nsw i32 %20, %26
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 4), align 16, !tbaa !7
  %95 = mul nsw i32 %94, %93
  %96 = add nsw i32 %95, %84
  br label %97

97:                                               ; preds = %89, %85, %83
  %98 = phi i32 [ %96, %89 ], [ %84, %85 ], [ %84, %83 ]
  br i1 %25, label %99, label %112

99:                                               ; preds = %97
  %100 = add nsw i32 %20, 1
  %101 = icmp sgt i32 %20, -2
  %102 = icmp slt i32 %100, %2
  %103 = select i1 %101, i1 %102, i1 false
  br i1 %103, label %104, label %112

104:                                              ; preds = %99
  %105 = add nsw i32 %100, %26
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 5), align 4, !tbaa !7
  %110 = mul nsw i32 %109, %108
  %111 = add nsw i32 %110, %98
  br label %112

112:                                              ; preds = %104, %99, %97
  %113 = phi i32 [ %111, %104 ], [ %98, %99 ], [ %98, %97 ]
  br i1 %25, label %114, label %127

114:                                              ; preds = %112
  %115 = add nsw i32 %20, 2
  %116 = icmp sgt i32 %20, -3
  %117 = icmp slt i32 %115, %2
  %118 = select i1 %116, i1 %117, i1 false
  br i1 %118, label %119, label %127

119:                                              ; preds = %114
  %120 = add nsw i32 %115, %26
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 6), align 8, !tbaa !7
  %125 = mul nsw i32 %124, %123
  %126 = add nsw i32 %125, %113
  br label %127

127:                                              ; preds = %119, %114, %112
  %128 = phi i32 [ %126, %119 ], [ %113, %114 ], [ %113, %112 ]
  br i1 %25, label %129, label %142

129:                                              ; preds = %127
  %130 = add nsw i32 %20, 3
  %131 = icmp sgt i32 %20, -4
  %132 = icmp slt i32 %130, %2
  %133 = select i1 %131, i1 %132, i1 false
  br i1 %133, label %134, label %142

134:                                              ; preds = %129
  %135 = add nsw i32 %130, %26
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 7), align 4, !tbaa !7
  %140 = mul nsw i32 %139, %138
  %141 = add nsw i32 %140, %128
  br label %142

142:                                              ; preds = %134, %129, %127
  %143 = phi i32 [ %141, %134 ], [ %128, %129 ], [ %128, %127 ]
  %144 = add nsw i32 %12, -3
  %145 = icmp sgt i32 %12, 2
  %146 = icmp slt i32 %144, %2
  %147 = select i1 %145, i1 %146, i1 false
  %148 = mul nsw i32 %144, %2
  br i1 %147, label %149, label %161

149:                                              ; preds = %142
  %150 = icmp sgt i32 %20, 3
  %151 = icmp slt i32 %22, %2
  %152 = select i1 %150, i1 %151, i1 false
  br i1 %152, label %153, label %161

153:                                              ; preds = %149
  %154 = add nsw i32 %22, %148
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %155
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 8), align 16, !tbaa !7
  %159 = mul nsw i32 %158, %157
  %160 = add nsw i32 %159, %143
  br label %161

161:                                              ; preds = %153, %149, %142
  %162 = phi i32 [ %160, %153 ], [ %143, %149 ], [ %143, %142 ]
  br i1 %147, label %163, label %176

163:                                              ; preds = %161
  %164 = add nsw i32 %20, -3
  %165 = icmp sgt i32 %20, 2
  %166 = icmp slt i32 %164, %2
  %167 = select i1 %165, i1 %166, i1 false
  br i1 %167, label %168, label %176

168:                                              ; preds = %163
  %169 = add nsw i32 %164, %148
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %170
  %172 = load i32, i32 addrspace(1)* %171, align 4, !tbaa !7, !amdgpu.noclobber !5
  %173 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 9), align 4, !tbaa !7
  %174 = mul nsw i32 %173, %172
  %175 = add nsw i32 %174, %162
  br label %176

176:                                              ; preds = %168, %163, %161
  %177 = phi i32 [ %175, %168 ], [ %162, %163 ], [ %162, %161 ]
  br i1 %147, label %178, label %191

178:                                              ; preds = %176
  %179 = add nsw i32 %20, -2
  %180 = icmp sgt i32 %20, 1
  %181 = icmp slt i32 %179, %2
  %182 = select i1 %180, i1 %181, i1 false
  br i1 %182, label %183, label %191

183:                                              ; preds = %178
  %184 = add nsw i32 %179, %148
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %185
  %187 = load i32, i32 addrspace(1)* %186, align 4, !tbaa !7, !amdgpu.noclobber !5
  %188 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 10), align 8, !tbaa !7
  %189 = mul nsw i32 %188, %187
  %190 = add nsw i32 %189, %177
  br label %191

191:                                              ; preds = %183, %178, %176
  %192 = phi i32 [ %190, %183 ], [ %177, %178 ], [ %177, %176 ]
  br i1 %147, label %193, label %206

193:                                              ; preds = %191
  %194 = icmp sgt i32 %20, 0
  %195 = icmp sle i32 %20, %2
  %196 = select i1 %194, i1 %195, i1 false
  br i1 %196, label %197, label %206

197:                                              ; preds = %193
  %198 = add nsw i32 %20, -1
  %199 = add nsw i32 %198, %148
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %200
  %202 = load i32, i32 addrspace(1)* %201, align 4, !tbaa !7, !amdgpu.noclobber !5
  %203 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 11), align 4, !tbaa !7
  %204 = mul nsw i32 %203, %202
  %205 = add nsw i32 %204, %192
  br label %206

206:                                              ; preds = %197, %193, %191
  %207 = phi i32 [ %205, %197 ], [ %192, %193 ], [ %192, %191 ]
  br i1 %147, label %208, label %220

208:                                              ; preds = %206
  %209 = icmp sgt i32 %20, -1
  %210 = icmp slt i32 %20, %2
  %211 = select i1 %209, i1 %210, i1 false
  br i1 %211, label %212, label %220

212:                                              ; preds = %208
  %213 = add nsw i32 %20, %148
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %214
  %216 = load i32, i32 addrspace(1)* %215, align 4, !tbaa !7, !amdgpu.noclobber !5
  %217 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 12), align 16, !tbaa !7
  %218 = mul nsw i32 %217, %216
  %219 = add nsw i32 %218, %207
  br label %220

220:                                              ; preds = %212, %208, %206
  %221 = phi i32 [ %219, %212 ], [ %207, %208 ], [ %207, %206 ]
  br i1 %147, label %222, label %235

222:                                              ; preds = %220
  %223 = add nsw i32 %20, 1
  %224 = icmp sgt i32 %20, -2
  %225 = icmp slt i32 %223, %2
  %226 = select i1 %224, i1 %225, i1 false
  br i1 %226, label %227, label %235

227:                                              ; preds = %222
  %228 = add nsw i32 %223, %148
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %229
  %231 = load i32, i32 addrspace(1)* %230, align 4, !tbaa !7, !amdgpu.noclobber !5
  %232 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 13), align 4, !tbaa !7
  %233 = mul nsw i32 %232, %231
  %234 = add nsw i32 %233, %221
  br label %235

235:                                              ; preds = %227, %222, %220
  %236 = phi i32 [ %234, %227 ], [ %221, %222 ], [ %221, %220 ]
  br i1 %147, label %237, label %250

237:                                              ; preds = %235
  %238 = add nsw i32 %20, 2
  %239 = icmp sgt i32 %20, -3
  %240 = icmp slt i32 %238, %2
  %241 = select i1 %239, i1 %240, i1 false
  br i1 %241, label %242, label %250

242:                                              ; preds = %237
  %243 = add nsw i32 %238, %148
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %244
  %246 = load i32, i32 addrspace(1)* %245, align 4, !tbaa !7, !amdgpu.noclobber !5
  %247 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 14), align 8, !tbaa !7
  %248 = mul nsw i32 %247, %246
  %249 = add nsw i32 %248, %236
  br label %250

250:                                              ; preds = %242, %237, %235
  %251 = phi i32 [ %249, %242 ], [ %236, %237 ], [ %236, %235 ]
  br i1 %147, label %252, label %265

252:                                              ; preds = %250
  %253 = add nsw i32 %20, 3
  %254 = icmp sgt i32 %20, -4
  %255 = icmp slt i32 %253, %2
  %256 = select i1 %254, i1 %255, i1 false
  br i1 %256, label %257, label %265

257:                                              ; preds = %252
  %258 = add nsw i32 %253, %148
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %259
  %261 = load i32, i32 addrspace(1)* %260, align 4, !tbaa !7, !amdgpu.noclobber !5
  %262 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 15), align 4, !tbaa !7
  %263 = mul nsw i32 %262, %261
  %264 = add nsw i32 %263, %251
  br label %265

265:                                              ; preds = %257, %252, %250
  %266 = phi i32 [ %264, %257 ], [ %251, %252 ], [ %251, %250 ]
  %267 = add nsw i32 %12, -2
  %268 = icmp sgt i32 %12, 1
  %269 = icmp slt i32 %267, %2
  %270 = select i1 %268, i1 %269, i1 false
  %271 = mul nsw i32 %267, %2
  br i1 %270, label %272, label %284

272:                                              ; preds = %265
  %273 = icmp sgt i32 %20, 3
  %274 = icmp slt i32 %22, %2
  %275 = select i1 %273, i1 %274, i1 false
  br i1 %275, label %276, label %284

276:                                              ; preds = %272
  %277 = add nsw i32 %22, %271
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %278
  %280 = load i32, i32 addrspace(1)* %279, align 4, !tbaa !7, !amdgpu.noclobber !5
  %281 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 16), align 16, !tbaa !7
  %282 = mul nsw i32 %281, %280
  %283 = add nsw i32 %282, %266
  br label %284

284:                                              ; preds = %276, %272, %265
  %285 = phi i32 [ %283, %276 ], [ %266, %272 ], [ %266, %265 ]
  br i1 %270, label %286, label %299

286:                                              ; preds = %284
  %287 = add nsw i32 %20, -3
  %288 = icmp sgt i32 %20, 2
  %289 = icmp slt i32 %287, %2
  %290 = select i1 %288, i1 %289, i1 false
  br i1 %290, label %291, label %299

291:                                              ; preds = %286
  %292 = add nsw i32 %287, %271
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %293
  %295 = load i32, i32 addrspace(1)* %294, align 4, !tbaa !7, !amdgpu.noclobber !5
  %296 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 17), align 4, !tbaa !7
  %297 = mul nsw i32 %296, %295
  %298 = add nsw i32 %297, %285
  br label %299

299:                                              ; preds = %291, %286, %284
  %300 = phi i32 [ %298, %291 ], [ %285, %286 ], [ %285, %284 ]
  br i1 %270, label %301, label %314

301:                                              ; preds = %299
  %302 = add nsw i32 %20, -2
  %303 = icmp sgt i32 %20, 1
  %304 = icmp slt i32 %302, %2
  %305 = select i1 %303, i1 %304, i1 false
  br i1 %305, label %306, label %314

306:                                              ; preds = %301
  %307 = add nsw i32 %302, %271
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %308
  %310 = load i32, i32 addrspace(1)* %309, align 4, !tbaa !7, !amdgpu.noclobber !5
  %311 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 18), align 8, !tbaa !7
  %312 = mul nsw i32 %311, %310
  %313 = add nsw i32 %312, %300
  br label %314

314:                                              ; preds = %306, %301, %299
  %315 = phi i32 [ %313, %306 ], [ %300, %301 ], [ %300, %299 ]
  br i1 %270, label %316, label %329

316:                                              ; preds = %314
  %317 = icmp sgt i32 %20, 0
  %318 = icmp sle i32 %20, %2
  %319 = select i1 %317, i1 %318, i1 false
  br i1 %319, label %320, label %329

320:                                              ; preds = %316
  %321 = add nsw i32 %20, -1
  %322 = add nsw i32 %321, %271
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %323
  %325 = load i32, i32 addrspace(1)* %324, align 4, !tbaa !7, !amdgpu.noclobber !5
  %326 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 19), align 4, !tbaa !7
  %327 = mul nsw i32 %326, %325
  %328 = add nsw i32 %327, %315
  br label %329

329:                                              ; preds = %320, %316, %314
  %330 = phi i32 [ %328, %320 ], [ %315, %316 ], [ %315, %314 ]
  br i1 %270, label %331, label %343

331:                                              ; preds = %329
  %332 = icmp sgt i32 %20, -1
  %333 = icmp slt i32 %20, %2
  %334 = select i1 %332, i1 %333, i1 false
  br i1 %334, label %335, label %343

335:                                              ; preds = %331
  %336 = add nsw i32 %20, %271
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %337
  %339 = load i32, i32 addrspace(1)* %338, align 4, !tbaa !7, !amdgpu.noclobber !5
  %340 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 20), align 16, !tbaa !7
  %341 = mul nsw i32 %340, %339
  %342 = add nsw i32 %341, %330
  br label %343

343:                                              ; preds = %335, %331, %329
  %344 = phi i32 [ %342, %335 ], [ %330, %331 ], [ %330, %329 ]
  br i1 %270, label %345, label %358

345:                                              ; preds = %343
  %346 = add nsw i32 %20, 1
  %347 = icmp sgt i32 %20, -2
  %348 = icmp slt i32 %346, %2
  %349 = select i1 %347, i1 %348, i1 false
  br i1 %349, label %350, label %358

350:                                              ; preds = %345
  %351 = add nsw i32 %346, %271
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %352
  %354 = load i32, i32 addrspace(1)* %353, align 4, !tbaa !7, !amdgpu.noclobber !5
  %355 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 21), align 4, !tbaa !7
  %356 = mul nsw i32 %355, %354
  %357 = add nsw i32 %356, %344
  br label %358

358:                                              ; preds = %350, %345, %343
  %359 = phi i32 [ %357, %350 ], [ %344, %345 ], [ %344, %343 ]
  br i1 %270, label %360, label %373

360:                                              ; preds = %358
  %361 = add nsw i32 %20, 2
  %362 = icmp sgt i32 %20, -3
  %363 = icmp slt i32 %361, %2
  %364 = select i1 %362, i1 %363, i1 false
  br i1 %364, label %365, label %373

365:                                              ; preds = %360
  %366 = add nsw i32 %361, %271
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %367
  %369 = load i32, i32 addrspace(1)* %368, align 4, !tbaa !7, !amdgpu.noclobber !5
  %370 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 22), align 8, !tbaa !7
  %371 = mul nsw i32 %370, %369
  %372 = add nsw i32 %371, %359
  br label %373

373:                                              ; preds = %365, %360, %358
  %374 = phi i32 [ %372, %365 ], [ %359, %360 ], [ %359, %358 ]
  br i1 %270, label %375, label %388

375:                                              ; preds = %373
  %376 = add nsw i32 %20, 3
  %377 = icmp sgt i32 %20, -4
  %378 = icmp slt i32 %376, %2
  %379 = select i1 %377, i1 %378, i1 false
  br i1 %379, label %380, label %388

380:                                              ; preds = %375
  %381 = add nsw i32 %376, %271
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %382
  %384 = load i32, i32 addrspace(1)* %383, align 4, !tbaa !7, !amdgpu.noclobber !5
  %385 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 23), align 4, !tbaa !7
  %386 = mul nsw i32 %385, %384
  %387 = add nsw i32 %386, %374
  br label %388

388:                                              ; preds = %380, %375, %373
  %389 = phi i32 [ %387, %380 ], [ %374, %375 ], [ %374, %373 ]
  %390 = add nsw i32 %12, -1
  %391 = icmp sgt i32 %12, 0
  %392 = icmp sle i32 %12, %2
  %393 = select i1 %391, i1 %392, i1 false
  %394 = mul nsw i32 %390, %2
  br i1 %393, label %395, label %407

395:                                              ; preds = %388
  %396 = icmp sgt i32 %20, 3
  %397 = icmp slt i32 %22, %2
  %398 = select i1 %396, i1 %397, i1 false
  br i1 %398, label %399, label %407

399:                                              ; preds = %395
  %400 = add nsw i32 %22, %394
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %401
  %403 = load i32, i32 addrspace(1)* %402, align 4, !tbaa !7, !amdgpu.noclobber !5
  %404 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 24), align 16, !tbaa !7
  %405 = mul nsw i32 %404, %403
  %406 = add nsw i32 %405, %389
  br label %407

407:                                              ; preds = %399, %395, %388
  %408 = phi i32 [ %406, %399 ], [ %389, %395 ], [ %389, %388 ]
  br i1 %393, label %409, label %422

409:                                              ; preds = %407
  %410 = add nsw i32 %20, -3
  %411 = icmp sgt i32 %20, 2
  %412 = icmp slt i32 %410, %2
  %413 = select i1 %411, i1 %412, i1 false
  br i1 %413, label %414, label %422

414:                                              ; preds = %409
  %415 = add nsw i32 %410, %394
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %416
  %418 = load i32, i32 addrspace(1)* %417, align 4, !tbaa !7, !amdgpu.noclobber !5
  %419 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 25), align 4, !tbaa !7
  %420 = mul nsw i32 %419, %418
  %421 = add nsw i32 %420, %408
  br label %422

422:                                              ; preds = %414, %409, %407
  %423 = phi i32 [ %421, %414 ], [ %408, %409 ], [ %408, %407 ]
  br i1 %393, label %424, label %437

424:                                              ; preds = %422
  %425 = add nsw i32 %20, -2
  %426 = icmp sgt i32 %20, 1
  %427 = icmp slt i32 %425, %2
  %428 = select i1 %426, i1 %427, i1 false
  br i1 %428, label %429, label %437

429:                                              ; preds = %424
  %430 = add nsw i32 %425, %394
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %431
  %433 = load i32, i32 addrspace(1)* %432, align 4, !tbaa !7, !amdgpu.noclobber !5
  %434 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 26), align 8, !tbaa !7
  %435 = mul nsw i32 %434, %433
  %436 = add nsw i32 %435, %423
  br label %437

437:                                              ; preds = %429, %424, %422
  %438 = phi i32 [ %436, %429 ], [ %423, %424 ], [ %423, %422 ]
  br i1 %393, label %439, label %452

439:                                              ; preds = %437
  %440 = icmp sgt i32 %20, 0
  %441 = icmp sle i32 %20, %2
  %442 = select i1 %440, i1 %441, i1 false
  br i1 %442, label %443, label %452

443:                                              ; preds = %439
  %444 = add nsw i32 %20, -1
  %445 = add nsw i32 %444, %394
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %446
  %448 = load i32, i32 addrspace(1)* %447, align 4, !tbaa !7, !amdgpu.noclobber !5
  %449 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 27), align 4, !tbaa !7
  %450 = mul nsw i32 %449, %448
  %451 = add nsw i32 %450, %438
  br label %452

452:                                              ; preds = %443, %439, %437
  %453 = phi i32 [ %451, %443 ], [ %438, %439 ], [ %438, %437 ]
  br i1 %393, label %454, label %466

454:                                              ; preds = %452
  %455 = icmp sgt i32 %20, -1
  %456 = icmp slt i32 %20, %2
  %457 = select i1 %455, i1 %456, i1 false
  br i1 %457, label %458, label %466

458:                                              ; preds = %454
  %459 = add nsw i32 %20, %394
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %460
  %462 = load i32, i32 addrspace(1)* %461, align 4, !tbaa !7, !amdgpu.noclobber !5
  %463 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 28), align 16, !tbaa !7
  %464 = mul nsw i32 %463, %462
  %465 = add nsw i32 %464, %453
  br label %466

466:                                              ; preds = %458, %454, %452
  %467 = phi i32 [ %465, %458 ], [ %453, %454 ], [ %453, %452 ]
  br i1 %393, label %468, label %481

468:                                              ; preds = %466
  %469 = add nsw i32 %20, 1
  %470 = icmp sgt i32 %20, -2
  %471 = icmp slt i32 %469, %2
  %472 = select i1 %470, i1 %471, i1 false
  br i1 %472, label %473, label %481

473:                                              ; preds = %468
  %474 = add nsw i32 %469, %394
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %475
  %477 = load i32, i32 addrspace(1)* %476, align 4, !tbaa !7, !amdgpu.noclobber !5
  %478 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 29), align 4, !tbaa !7
  %479 = mul nsw i32 %478, %477
  %480 = add nsw i32 %479, %467
  br label %481

481:                                              ; preds = %473, %468, %466
  %482 = phi i32 [ %480, %473 ], [ %467, %468 ], [ %467, %466 ]
  br i1 %393, label %483, label %496

483:                                              ; preds = %481
  %484 = add nsw i32 %20, 2
  %485 = icmp sgt i32 %20, -3
  %486 = icmp slt i32 %484, %2
  %487 = select i1 %485, i1 %486, i1 false
  br i1 %487, label %488, label %496

488:                                              ; preds = %483
  %489 = add nsw i32 %484, %394
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %490
  %492 = load i32, i32 addrspace(1)* %491, align 4, !tbaa !7, !amdgpu.noclobber !5
  %493 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 30), align 8, !tbaa !7
  %494 = mul nsw i32 %493, %492
  %495 = add nsw i32 %494, %482
  br label %496

496:                                              ; preds = %488, %483, %481
  %497 = phi i32 [ %495, %488 ], [ %482, %483 ], [ %482, %481 ]
  br i1 %393, label %498, label %511

498:                                              ; preds = %496
  %499 = add nsw i32 %20, 3
  %500 = icmp sgt i32 %20, -4
  %501 = icmp slt i32 %499, %2
  %502 = select i1 %500, i1 %501, i1 false
  br i1 %502, label %503, label %511

503:                                              ; preds = %498
  %504 = add nsw i32 %499, %394
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %505
  %507 = load i32, i32 addrspace(1)* %506, align 4, !tbaa !7, !amdgpu.noclobber !5
  %508 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 31), align 4, !tbaa !7
  %509 = mul nsw i32 %508, %507
  %510 = add nsw i32 %509, %497
  br label %511

511:                                              ; preds = %503, %498, %496
  %512 = phi i32 [ %510, %503 ], [ %497, %498 ], [ %497, %496 ]
  %513 = icmp sgt i32 %12, -1
  %514 = icmp slt i32 %12, %2
  %515 = select i1 %513, i1 %514, i1 false
  %516 = mul nsw i32 %12, %2
  br i1 %515, label %517, label %529

517:                                              ; preds = %511
  %518 = icmp sgt i32 %20, 3
  %519 = icmp slt i32 %22, %2
  %520 = select i1 %518, i1 %519, i1 false
  br i1 %520, label %521, label %529

521:                                              ; preds = %517
  %522 = add nsw i32 %22, %516
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %523
  %525 = load i32, i32 addrspace(1)* %524, align 4, !tbaa !7, !amdgpu.noclobber !5
  %526 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 32), align 16, !tbaa !7
  %527 = mul nsw i32 %526, %525
  %528 = add nsw i32 %527, %512
  br label %529

529:                                              ; preds = %521, %517, %511
  %530 = phi i32 [ %528, %521 ], [ %512, %517 ], [ %512, %511 ]
  br i1 %515, label %531, label %544

531:                                              ; preds = %529
  %532 = add nsw i32 %20, -3
  %533 = icmp sgt i32 %20, 2
  %534 = icmp slt i32 %532, %2
  %535 = select i1 %533, i1 %534, i1 false
  br i1 %535, label %536, label %544

536:                                              ; preds = %531
  %537 = add nsw i32 %532, %516
  %538 = sext i32 %537 to i64
  %539 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %538
  %540 = load i32, i32 addrspace(1)* %539, align 4, !tbaa !7, !amdgpu.noclobber !5
  %541 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 33), align 4, !tbaa !7
  %542 = mul nsw i32 %541, %540
  %543 = add nsw i32 %542, %530
  br label %544

544:                                              ; preds = %536, %531, %529
  %545 = phi i32 [ %543, %536 ], [ %530, %531 ], [ %530, %529 ]
  br i1 %515, label %546, label %559

546:                                              ; preds = %544
  %547 = add nsw i32 %20, -2
  %548 = icmp sgt i32 %20, 1
  %549 = icmp slt i32 %547, %2
  %550 = select i1 %548, i1 %549, i1 false
  br i1 %550, label %551, label %559

551:                                              ; preds = %546
  %552 = add nsw i32 %547, %516
  %553 = sext i32 %552 to i64
  %554 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %553
  %555 = load i32, i32 addrspace(1)* %554, align 4, !tbaa !7, !amdgpu.noclobber !5
  %556 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 34), align 8, !tbaa !7
  %557 = mul nsw i32 %556, %555
  %558 = add nsw i32 %557, %545
  br label %559

559:                                              ; preds = %551, %546, %544
  %560 = phi i32 [ %558, %551 ], [ %545, %546 ], [ %545, %544 ]
  br i1 %515, label %561, label %574

561:                                              ; preds = %559
  %562 = icmp sgt i32 %20, 0
  %563 = icmp sle i32 %20, %2
  %564 = select i1 %562, i1 %563, i1 false
  br i1 %564, label %565, label %574

565:                                              ; preds = %561
  %566 = add nsw i32 %20, -1
  %567 = add nsw i32 %566, %516
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %568
  %570 = load i32, i32 addrspace(1)* %569, align 4, !tbaa !7, !amdgpu.noclobber !5
  %571 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 35), align 4, !tbaa !7
  %572 = mul nsw i32 %571, %570
  %573 = add nsw i32 %572, %560
  br label %574

574:                                              ; preds = %565, %561, %559
  %575 = phi i32 [ %573, %565 ], [ %560, %561 ], [ %560, %559 ]
  br i1 %515, label %576, label %588

576:                                              ; preds = %574
  %577 = icmp sgt i32 %20, -1
  %578 = icmp slt i32 %20, %2
  %579 = select i1 %577, i1 %578, i1 false
  br i1 %579, label %580, label %588

580:                                              ; preds = %576
  %581 = add nsw i32 %20, %516
  %582 = sext i32 %581 to i64
  %583 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %582
  %584 = load i32, i32 addrspace(1)* %583, align 4, !tbaa !7, !amdgpu.noclobber !5
  %585 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 36), align 16, !tbaa !7
  %586 = mul nsw i32 %585, %584
  %587 = add nsw i32 %586, %575
  br label %588

588:                                              ; preds = %580, %576, %574
  %589 = phi i32 [ %587, %580 ], [ %575, %576 ], [ %575, %574 ]
  br i1 %515, label %590, label %603

590:                                              ; preds = %588
  %591 = add nsw i32 %20, 1
  %592 = icmp sgt i32 %20, -2
  %593 = icmp slt i32 %591, %2
  %594 = select i1 %592, i1 %593, i1 false
  br i1 %594, label %595, label %603

595:                                              ; preds = %590
  %596 = add nsw i32 %591, %516
  %597 = sext i32 %596 to i64
  %598 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %597
  %599 = load i32, i32 addrspace(1)* %598, align 4, !tbaa !7, !amdgpu.noclobber !5
  %600 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 37), align 4, !tbaa !7
  %601 = mul nsw i32 %600, %599
  %602 = add nsw i32 %601, %589
  br label %603

603:                                              ; preds = %595, %590, %588
  %604 = phi i32 [ %602, %595 ], [ %589, %590 ], [ %589, %588 ]
  br i1 %515, label %605, label %618

605:                                              ; preds = %603
  %606 = add nsw i32 %20, 2
  %607 = icmp sgt i32 %20, -3
  %608 = icmp slt i32 %606, %2
  %609 = select i1 %607, i1 %608, i1 false
  br i1 %609, label %610, label %618

610:                                              ; preds = %605
  %611 = add nsw i32 %606, %516
  %612 = sext i32 %611 to i64
  %613 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %612
  %614 = load i32, i32 addrspace(1)* %613, align 4, !tbaa !7, !amdgpu.noclobber !5
  %615 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 38), align 8, !tbaa !7
  %616 = mul nsw i32 %615, %614
  %617 = add nsw i32 %616, %604
  br label %618

618:                                              ; preds = %610, %605, %603
  %619 = phi i32 [ %617, %610 ], [ %604, %605 ], [ %604, %603 ]
  br i1 %515, label %620, label %633

620:                                              ; preds = %618
  %621 = add nsw i32 %20, 3
  %622 = icmp sgt i32 %20, -4
  %623 = icmp slt i32 %621, %2
  %624 = select i1 %622, i1 %623, i1 false
  br i1 %624, label %625, label %633

625:                                              ; preds = %620
  %626 = add nsw i32 %621, %516
  %627 = sext i32 %626 to i64
  %628 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %627
  %629 = load i32, i32 addrspace(1)* %628, align 4, !tbaa !7, !amdgpu.noclobber !5
  %630 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 39), align 4, !tbaa !7
  %631 = mul nsw i32 %630, %629
  %632 = add nsw i32 %631, %619
  br label %633

633:                                              ; preds = %625, %620, %618
  %634 = phi i32 [ %632, %625 ], [ %619, %620 ], [ %619, %618 ]
  %635 = add nsw i32 %12, 1
  %636 = icmp sgt i32 %12, -2
  %637 = icmp slt i32 %635, %2
  %638 = select i1 %636, i1 %637, i1 false
  %639 = mul nsw i32 %635, %2
  br i1 %638, label %640, label %652

640:                                              ; preds = %633
  %641 = icmp sgt i32 %20, 3
  %642 = icmp slt i32 %22, %2
  %643 = select i1 %641, i1 %642, i1 false
  br i1 %643, label %644, label %652

644:                                              ; preds = %640
  %645 = add nsw i32 %22, %639
  %646 = sext i32 %645 to i64
  %647 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %646
  %648 = load i32, i32 addrspace(1)* %647, align 4, !tbaa !7, !amdgpu.noclobber !5
  %649 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 40), align 16, !tbaa !7
  %650 = mul nsw i32 %649, %648
  %651 = add nsw i32 %650, %634
  br label %652

652:                                              ; preds = %644, %640, %633
  %653 = phi i32 [ %651, %644 ], [ %634, %640 ], [ %634, %633 ]
  br i1 %638, label %654, label %667

654:                                              ; preds = %652
  %655 = add nsw i32 %20, -3
  %656 = icmp sgt i32 %20, 2
  %657 = icmp slt i32 %655, %2
  %658 = select i1 %656, i1 %657, i1 false
  br i1 %658, label %659, label %667

659:                                              ; preds = %654
  %660 = add nsw i32 %655, %639
  %661 = sext i32 %660 to i64
  %662 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %661
  %663 = load i32, i32 addrspace(1)* %662, align 4, !tbaa !7, !amdgpu.noclobber !5
  %664 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 41), align 4, !tbaa !7
  %665 = mul nsw i32 %664, %663
  %666 = add nsw i32 %665, %653
  br label %667

667:                                              ; preds = %659, %654, %652
  %668 = phi i32 [ %666, %659 ], [ %653, %654 ], [ %653, %652 ]
  br i1 %638, label %669, label %682

669:                                              ; preds = %667
  %670 = add nsw i32 %20, -2
  %671 = icmp sgt i32 %20, 1
  %672 = icmp slt i32 %670, %2
  %673 = select i1 %671, i1 %672, i1 false
  br i1 %673, label %674, label %682

674:                                              ; preds = %669
  %675 = add nsw i32 %670, %639
  %676 = sext i32 %675 to i64
  %677 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %676
  %678 = load i32, i32 addrspace(1)* %677, align 4, !tbaa !7, !amdgpu.noclobber !5
  %679 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 42), align 8, !tbaa !7
  %680 = mul nsw i32 %679, %678
  %681 = add nsw i32 %680, %668
  br label %682

682:                                              ; preds = %674, %669, %667
  %683 = phi i32 [ %681, %674 ], [ %668, %669 ], [ %668, %667 ]
  br i1 %638, label %684, label %697

684:                                              ; preds = %682
  %685 = icmp sgt i32 %20, 0
  %686 = icmp sle i32 %20, %2
  %687 = select i1 %685, i1 %686, i1 false
  br i1 %687, label %688, label %697

688:                                              ; preds = %684
  %689 = add nsw i32 %20, -1
  %690 = add nsw i32 %689, %639
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %691
  %693 = load i32, i32 addrspace(1)* %692, align 4, !tbaa !7, !amdgpu.noclobber !5
  %694 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 43), align 4, !tbaa !7
  %695 = mul nsw i32 %694, %693
  %696 = add nsw i32 %695, %683
  br label %697

697:                                              ; preds = %688, %684, %682
  %698 = phi i32 [ %696, %688 ], [ %683, %684 ], [ %683, %682 ]
  br i1 %638, label %699, label %711

699:                                              ; preds = %697
  %700 = icmp sgt i32 %20, -1
  %701 = icmp slt i32 %20, %2
  %702 = select i1 %700, i1 %701, i1 false
  br i1 %702, label %703, label %711

703:                                              ; preds = %699
  %704 = add nsw i32 %20, %639
  %705 = sext i32 %704 to i64
  %706 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %705
  %707 = load i32, i32 addrspace(1)* %706, align 4, !tbaa !7, !amdgpu.noclobber !5
  %708 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 44), align 16, !tbaa !7
  %709 = mul nsw i32 %708, %707
  %710 = add nsw i32 %709, %698
  br label %711

711:                                              ; preds = %703, %699, %697
  %712 = phi i32 [ %710, %703 ], [ %698, %699 ], [ %698, %697 ]
  br i1 %638, label %713, label %726

713:                                              ; preds = %711
  %714 = add nsw i32 %20, 1
  %715 = icmp sgt i32 %20, -2
  %716 = icmp slt i32 %714, %2
  %717 = select i1 %715, i1 %716, i1 false
  br i1 %717, label %718, label %726

718:                                              ; preds = %713
  %719 = add nsw i32 %714, %639
  %720 = sext i32 %719 to i64
  %721 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %720
  %722 = load i32, i32 addrspace(1)* %721, align 4, !tbaa !7, !amdgpu.noclobber !5
  %723 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 45), align 4, !tbaa !7
  %724 = mul nsw i32 %723, %722
  %725 = add nsw i32 %724, %712
  br label %726

726:                                              ; preds = %718, %713, %711
  %727 = phi i32 [ %725, %718 ], [ %712, %713 ], [ %712, %711 ]
  br i1 %638, label %728, label %741

728:                                              ; preds = %726
  %729 = add nsw i32 %20, 2
  %730 = icmp sgt i32 %20, -3
  %731 = icmp slt i32 %729, %2
  %732 = select i1 %730, i1 %731, i1 false
  br i1 %732, label %733, label %741

733:                                              ; preds = %728
  %734 = add nsw i32 %729, %639
  %735 = sext i32 %734 to i64
  %736 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %735
  %737 = load i32, i32 addrspace(1)* %736, align 4, !tbaa !7, !amdgpu.noclobber !5
  %738 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 46), align 8, !tbaa !7
  %739 = mul nsw i32 %738, %737
  %740 = add nsw i32 %739, %727
  br label %741

741:                                              ; preds = %733, %728, %726
  %742 = phi i32 [ %740, %733 ], [ %727, %728 ], [ %727, %726 ]
  br i1 %638, label %743, label %756

743:                                              ; preds = %741
  %744 = add nsw i32 %20, 3
  %745 = icmp sgt i32 %20, -4
  %746 = icmp slt i32 %744, %2
  %747 = select i1 %745, i1 %746, i1 false
  br i1 %747, label %748, label %756

748:                                              ; preds = %743
  %749 = add nsw i32 %744, %639
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %750
  %752 = load i32, i32 addrspace(1)* %751, align 4, !tbaa !7, !amdgpu.noclobber !5
  %753 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 47), align 4, !tbaa !7
  %754 = mul nsw i32 %753, %752
  %755 = add nsw i32 %754, %742
  br label %756

756:                                              ; preds = %748, %743, %741
  %757 = phi i32 [ %755, %748 ], [ %742, %743 ], [ %742, %741 ]
  %758 = add nsw i32 %12, 2
  %759 = icmp sgt i32 %12, -3
  %760 = icmp slt i32 %758, %2
  %761 = select i1 %759, i1 %760, i1 false
  %762 = mul nsw i32 %758, %2
  br i1 %761, label %763, label %775

763:                                              ; preds = %756
  %764 = icmp sgt i32 %20, 3
  %765 = icmp slt i32 %22, %2
  %766 = select i1 %764, i1 %765, i1 false
  br i1 %766, label %767, label %775

767:                                              ; preds = %763
  %768 = add nsw i32 %22, %762
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %769
  %771 = load i32, i32 addrspace(1)* %770, align 4, !tbaa !7, !amdgpu.noclobber !5
  %772 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 48), align 16, !tbaa !7
  %773 = mul nsw i32 %772, %771
  %774 = add nsw i32 %773, %757
  br label %775

775:                                              ; preds = %767, %763, %756
  %776 = phi i32 [ %774, %767 ], [ %757, %763 ], [ %757, %756 ]
  br i1 %761, label %777, label %790

777:                                              ; preds = %775
  %778 = add nsw i32 %20, -3
  %779 = icmp sgt i32 %20, 2
  %780 = icmp slt i32 %778, %2
  %781 = select i1 %779, i1 %780, i1 false
  br i1 %781, label %782, label %790

782:                                              ; preds = %777
  %783 = add nsw i32 %778, %762
  %784 = sext i32 %783 to i64
  %785 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %784
  %786 = load i32, i32 addrspace(1)* %785, align 4, !tbaa !7, !amdgpu.noclobber !5
  %787 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 49), align 4, !tbaa !7
  %788 = mul nsw i32 %787, %786
  %789 = add nsw i32 %788, %776
  br label %790

790:                                              ; preds = %782, %777, %775
  %791 = phi i32 [ %789, %782 ], [ %776, %777 ], [ %776, %775 ]
  br i1 %761, label %792, label %805

792:                                              ; preds = %790
  %793 = add nsw i32 %20, -2
  %794 = icmp sgt i32 %20, 1
  %795 = icmp slt i32 %793, %2
  %796 = select i1 %794, i1 %795, i1 false
  br i1 %796, label %797, label %805

797:                                              ; preds = %792
  %798 = add nsw i32 %793, %762
  %799 = sext i32 %798 to i64
  %800 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %799
  %801 = load i32, i32 addrspace(1)* %800, align 4, !tbaa !7, !amdgpu.noclobber !5
  %802 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 50), align 8, !tbaa !7
  %803 = mul nsw i32 %802, %801
  %804 = add nsw i32 %803, %791
  br label %805

805:                                              ; preds = %797, %792, %790
  %806 = phi i32 [ %804, %797 ], [ %791, %792 ], [ %791, %790 ]
  br i1 %761, label %807, label %820

807:                                              ; preds = %805
  %808 = icmp sgt i32 %20, 0
  %809 = icmp sle i32 %20, %2
  %810 = select i1 %808, i1 %809, i1 false
  br i1 %810, label %811, label %820

811:                                              ; preds = %807
  %812 = add nsw i32 %20, -1
  %813 = add nsw i32 %812, %762
  %814 = sext i32 %813 to i64
  %815 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %814
  %816 = load i32, i32 addrspace(1)* %815, align 4, !tbaa !7, !amdgpu.noclobber !5
  %817 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 51), align 4, !tbaa !7
  %818 = mul nsw i32 %817, %816
  %819 = add nsw i32 %818, %806
  br label %820

820:                                              ; preds = %811, %807, %805
  %821 = phi i32 [ %819, %811 ], [ %806, %807 ], [ %806, %805 ]
  br i1 %761, label %822, label %834

822:                                              ; preds = %820
  %823 = icmp sgt i32 %20, -1
  %824 = icmp slt i32 %20, %2
  %825 = select i1 %823, i1 %824, i1 false
  br i1 %825, label %826, label %834

826:                                              ; preds = %822
  %827 = add nsw i32 %20, %762
  %828 = sext i32 %827 to i64
  %829 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %828
  %830 = load i32, i32 addrspace(1)* %829, align 4, !tbaa !7, !amdgpu.noclobber !5
  %831 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 52), align 16, !tbaa !7
  %832 = mul nsw i32 %831, %830
  %833 = add nsw i32 %832, %821
  br label %834

834:                                              ; preds = %826, %822, %820
  %835 = phi i32 [ %833, %826 ], [ %821, %822 ], [ %821, %820 ]
  br i1 %761, label %836, label %849

836:                                              ; preds = %834
  %837 = add nsw i32 %20, 1
  %838 = icmp sgt i32 %20, -2
  %839 = icmp slt i32 %837, %2
  %840 = select i1 %838, i1 %839, i1 false
  br i1 %840, label %841, label %849

841:                                              ; preds = %836
  %842 = add nsw i32 %837, %762
  %843 = sext i32 %842 to i64
  %844 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %843
  %845 = load i32, i32 addrspace(1)* %844, align 4, !tbaa !7, !amdgpu.noclobber !5
  %846 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 53), align 4, !tbaa !7
  %847 = mul nsw i32 %846, %845
  %848 = add nsw i32 %847, %835
  br label %849

849:                                              ; preds = %841, %836, %834
  %850 = phi i32 [ %848, %841 ], [ %835, %836 ], [ %835, %834 ]
  br i1 %761, label %851, label %864

851:                                              ; preds = %849
  %852 = add nsw i32 %20, 2
  %853 = icmp sgt i32 %20, -3
  %854 = icmp slt i32 %852, %2
  %855 = select i1 %853, i1 %854, i1 false
  br i1 %855, label %856, label %864

856:                                              ; preds = %851
  %857 = add nsw i32 %852, %762
  %858 = sext i32 %857 to i64
  %859 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %858
  %860 = load i32, i32 addrspace(1)* %859, align 4, !tbaa !7, !amdgpu.noclobber !5
  %861 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 54), align 8, !tbaa !7
  %862 = mul nsw i32 %861, %860
  %863 = add nsw i32 %862, %850
  br label %864

864:                                              ; preds = %856, %851, %849
  %865 = phi i32 [ %863, %856 ], [ %850, %851 ], [ %850, %849 ]
  br i1 %761, label %866, label %879

866:                                              ; preds = %864
  %867 = add nsw i32 %20, 3
  %868 = icmp sgt i32 %20, -4
  %869 = icmp slt i32 %867, %2
  %870 = select i1 %868, i1 %869, i1 false
  br i1 %870, label %871, label %879

871:                                              ; preds = %866
  %872 = add nsw i32 %867, %762
  %873 = sext i32 %872 to i64
  %874 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %873
  %875 = load i32, i32 addrspace(1)* %874, align 4, !tbaa !7, !amdgpu.noclobber !5
  %876 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 55), align 4, !tbaa !7
  %877 = mul nsw i32 %876, %875
  %878 = add nsw i32 %877, %865
  br label %879

879:                                              ; preds = %871, %866, %864
  %880 = phi i32 [ %878, %871 ], [ %865, %866 ], [ %865, %864 ]
  %881 = add nsw i32 %12, 3
  %882 = icmp sgt i32 %12, -4
  %883 = icmp slt i32 %881, %2
  %884 = select i1 %882, i1 %883, i1 false
  %885 = mul nsw i32 %881, %2
  br i1 %884, label %886, label %898

886:                                              ; preds = %879
  %887 = icmp sgt i32 %20, 3
  %888 = icmp slt i32 %22, %2
  %889 = select i1 %887, i1 %888, i1 false
  br i1 %889, label %890, label %898

890:                                              ; preds = %886
  %891 = add nsw i32 %22, %885
  %892 = sext i32 %891 to i64
  %893 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %892
  %894 = load i32, i32 addrspace(1)* %893, align 4, !tbaa !7, !amdgpu.noclobber !5
  %895 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 56), align 16, !tbaa !7
  %896 = mul nsw i32 %895, %894
  %897 = add nsw i32 %896, %880
  br label %898

898:                                              ; preds = %890, %886, %879
  %899 = phi i32 [ %897, %890 ], [ %880, %886 ], [ %880, %879 ]
  br i1 %884, label %900, label %913

900:                                              ; preds = %898
  %901 = add nsw i32 %20, -3
  %902 = icmp sgt i32 %20, 2
  %903 = icmp slt i32 %901, %2
  %904 = select i1 %902, i1 %903, i1 false
  br i1 %904, label %905, label %913

905:                                              ; preds = %900
  %906 = add nsw i32 %901, %885
  %907 = sext i32 %906 to i64
  %908 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %907
  %909 = load i32, i32 addrspace(1)* %908, align 4, !tbaa !7, !amdgpu.noclobber !5
  %910 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 57), align 4, !tbaa !7
  %911 = mul nsw i32 %910, %909
  %912 = add nsw i32 %911, %899
  br label %913

913:                                              ; preds = %905, %900, %898
  %914 = phi i32 [ %912, %905 ], [ %899, %900 ], [ %899, %898 ]
  br i1 %884, label %915, label %928

915:                                              ; preds = %913
  %916 = add nsw i32 %20, -2
  %917 = icmp sgt i32 %20, 1
  %918 = icmp slt i32 %916, %2
  %919 = select i1 %917, i1 %918, i1 false
  br i1 %919, label %920, label %928

920:                                              ; preds = %915
  %921 = add nsw i32 %916, %885
  %922 = sext i32 %921 to i64
  %923 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %922
  %924 = load i32, i32 addrspace(1)* %923, align 4, !tbaa !7, !amdgpu.noclobber !5
  %925 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 58), align 8, !tbaa !7
  %926 = mul nsw i32 %925, %924
  %927 = add nsw i32 %926, %914
  br label %928

928:                                              ; preds = %920, %915, %913
  %929 = phi i32 [ %927, %920 ], [ %914, %915 ], [ %914, %913 ]
  br i1 %884, label %930, label %943

930:                                              ; preds = %928
  %931 = icmp sgt i32 %20, 0
  %932 = icmp sle i32 %20, %2
  %933 = select i1 %931, i1 %932, i1 false
  br i1 %933, label %934, label %943

934:                                              ; preds = %930
  %935 = add nsw i32 %20, -1
  %936 = add nsw i32 %935, %885
  %937 = sext i32 %936 to i64
  %938 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %937
  %939 = load i32, i32 addrspace(1)* %938, align 4, !tbaa !7, !amdgpu.noclobber !5
  %940 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 59), align 4, !tbaa !7
  %941 = mul nsw i32 %940, %939
  %942 = add nsw i32 %941, %929
  br label %943

943:                                              ; preds = %934, %930, %928
  %944 = phi i32 [ %942, %934 ], [ %929, %930 ], [ %929, %928 ]
  br i1 %884, label %945, label %957

945:                                              ; preds = %943
  %946 = icmp sgt i32 %20, -1
  %947 = icmp slt i32 %20, %2
  %948 = select i1 %946, i1 %947, i1 false
  br i1 %948, label %949, label %957

949:                                              ; preds = %945
  %950 = add nsw i32 %20, %885
  %951 = sext i32 %950 to i64
  %952 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %951
  %953 = load i32, i32 addrspace(1)* %952, align 4, !tbaa !7, !amdgpu.noclobber !5
  %954 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 60), align 16, !tbaa !7
  %955 = mul nsw i32 %954, %953
  %956 = add nsw i32 %955, %944
  br label %957

957:                                              ; preds = %949, %945, %943
  %958 = phi i32 [ %956, %949 ], [ %944, %945 ], [ %944, %943 ]
  br i1 %884, label %959, label %972

959:                                              ; preds = %957
  %960 = add nsw i32 %20, 1
  %961 = icmp sgt i32 %20, -2
  %962 = icmp slt i32 %960, %2
  %963 = select i1 %961, i1 %962, i1 false
  br i1 %963, label %964, label %972

964:                                              ; preds = %959
  %965 = add nsw i32 %960, %885
  %966 = sext i32 %965 to i64
  %967 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %966
  %968 = load i32, i32 addrspace(1)* %967, align 4, !tbaa !7, !amdgpu.noclobber !5
  %969 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 61), align 4, !tbaa !7
  %970 = mul nsw i32 %969, %968
  %971 = add nsw i32 %970, %958
  br label %972

972:                                              ; preds = %964, %959, %957
  %973 = phi i32 [ %971, %964 ], [ %958, %959 ], [ %958, %957 ]
  br i1 %884, label %974, label %987

974:                                              ; preds = %972
  %975 = add nsw i32 %20, 2
  %976 = icmp sgt i32 %20, -3
  %977 = icmp slt i32 %975, %2
  %978 = select i1 %976, i1 %977, i1 false
  br i1 %978, label %979, label %987

979:                                              ; preds = %974
  %980 = add nsw i32 %975, %885
  %981 = sext i32 %980 to i64
  %982 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %981
  %983 = load i32, i32 addrspace(1)* %982, align 4, !tbaa !7, !amdgpu.noclobber !5
  %984 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 62), align 8, !tbaa !7
  %985 = mul nsw i32 %984, %983
  %986 = add nsw i32 %985, %973
  br label %987

987:                                              ; preds = %979, %974, %972
  %988 = phi i32 [ %986, %979 ], [ %973, %974 ], [ %973, %972 ]
  br i1 %884, label %989, label %1002

989:                                              ; preds = %987
  %990 = add nsw i32 %20, 3
  %991 = icmp sgt i32 %20, -4
  %992 = icmp slt i32 %990, %2
  %993 = select i1 %991, i1 %992, i1 false
  br i1 %993, label %994, label %1002

994:                                              ; preds = %989
  %995 = add nsw i32 %990, %885
  %996 = sext i32 %995 to i64
  %997 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %996
  %998 = load i32, i32 addrspace(1)* %997, align 4, !tbaa !7, !amdgpu.noclobber !5
  %999 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 63), align 4, !tbaa !7
  %1000 = mul nsw i32 %999, %998
  %1001 = add nsw i32 %1000, %988
  br label %1002

1002:                                             ; preds = %994, %989, %987
  %1003 = phi i32 [ %1001, %994 ], [ %988, %989 ], [ %988, %987 ]
  %1004 = add nsw i32 %516, %20
  %1005 = sext i32 %1004 to i64
  %1006 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %1005
  store i32 %1003, i32 addrspace(1)* %1006, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
