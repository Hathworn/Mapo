; ModuleID = '../data/hip_kernels/274/7/main.cu'
source_filename = "../data/hip_kernels/274/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25batcherBitonicMergesort64PfPKf(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds float, float addrspace(1)* %1, i64 %4
  %6 = load float, float addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %3
  store float %6, float addrspace(3)* %7, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %8 = add nsw i32 %3, -1
  %9 = icmp eq i32 %3, 0
  br i1 %9, label %390, label %374

10:                                               ; preds = %390
  %11 = lshr i32 %392, 2
  %12 = and i32 %11, 16383
  %13 = icmp eq i32 %12, %391
  br i1 %13, label %14, label %25

14:                                               ; preds = %10
  %15 = and i32 %3, 4
  %16 = icmp eq i32 %15, 0
  %17 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %18 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %392
  %19 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  br i1 %16, label %20, label %22

20:                                               ; preds = %14
  %21 = fcmp contract olt float %17, %19
  br i1 %21, label %24, label %25

22:                                               ; preds = %14
  %23 = fcmp contract ogt float %17, %19
  br i1 %23, label %24, label %25

24:                                               ; preds = %22, %20
  store float %19, float addrspace(3)* %7, align 4, !tbaa !5
  store float %17, float addrspace(3)* %18, align 4, !tbaa !5
  br label %25

25:                                               ; preds = %24, %22, %20, %10, %390
  %26 = add nsw i32 %3, -1
  %27 = icmp eq i32 %3, 0
  br i1 %27, label %43, label %28

28:                                               ; preds = %25
  %29 = lshr i32 %26, 2
  %30 = and i32 %29, 16383
  %31 = icmp eq i32 %30, %391
  br i1 %31, label %32, label %43

32:                                               ; preds = %28
  %33 = and i32 %3, 4
  %34 = icmp eq i32 %33, 0
  %35 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %36 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %26
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  br i1 %34, label %38, label %40

38:                                               ; preds = %32
  %39 = fcmp contract olt float %35, %37
  br i1 %39, label %42, label %43

40:                                               ; preds = %32
  %41 = fcmp contract ogt float %35, %37
  br i1 %41, label %42, label %43

42:                                               ; preds = %40, %38
  store float %37, float addrspace(3)* %7, align 4, !tbaa !5
  store float %35, float addrspace(3)* %36, align 4, !tbaa !5
  br label %43

43:                                               ; preds = %42, %40, %38, %28, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = lshr i32 %3, 3
  %45 = add nsw i32 %3, -4
  %46 = icmp ult i32 %3, 4
  br i1 %46, label %62, label %47

47:                                               ; preds = %43
  %48 = lshr i32 %45, 3
  %49 = and i32 %48, 8191
  %50 = icmp eq i32 %49, %44
  br i1 %50, label %51, label %62

51:                                               ; preds = %47
  %52 = and i32 %3, 8
  %53 = icmp eq i32 %52, 0
  %54 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %55 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %45
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  br i1 %53, label %57, label %59

57:                                               ; preds = %51
  %58 = fcmp contract olt float %54, %56
  br i1 %58, label %61, label %62

59:                                               ; preds = %51
  %60 = fcmp contract ogt float %54, %56
  br i1 %60, label %61, label %62

61:                                               ; preds = %59, %57
  store float %56, float addrspace(3)* %7, align 4, !tbaa !5
  store float %54, float addrspace(3)* %55, align 4, !tbaa !5
  br label %62

62:                                               ; preds = %61, %59, %57, %47, %43
  %63 = add nsw i32 %3, -2
  %64 = icmp ult i32 %3, 2
  br i1 %64, label %80, label %65

65:                                               ; preds = %62
  %66 = lshr i32 %63, 3
  %67 = and i32 %66, 8191
  %68 = icmp eq i32 %67, %44
  br i1 %68, label %69, label %80

69:                                               ; preds = %65
  %70 = and i32 %3, 8
  %71 = icmp eq i32 %70, 0
  %72 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %73 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %63
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  br i1 %71, label %75, label %77

75:                                               ; preds = %69
  %76 = fcmp contract olt float %72, %74
  br i1 %76, label %79, label %80

77:                                               ; preds = %69
  %78 = fcmp contract ogt float %72, %74
  br i1 %78, label %79, label %80

79:                                               ; preds = %77, %75
  store float %74, float addrspace(3)* %7, align 4, !tbaa !5
  store float %72, float addrspace(3)* %73, align 4, !tbaa !5
  br label %80

80:                                               ; preds = %79, %77, %75, %65, %62
  %81 = add nsw i32 %3, -1
  %82 = icmp eq i32 %3, 0
  br i1 %82, label %98, label %83

83:                                               ; preds = %80
  %84 = lshr i32 %81, 3
  %85 = and i32 %84, 8191
  %86 = icmp eq i32 %85, %44
  br i1 %86, label %87, label %98

87:                                               ; preds = %83
  %88 = and i32 %3, 8
  %89 = icmp eq i32 %88, 0
  %90 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %91 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %81
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  br i1 %89, label %93, label %95

93:                                               ; preds = %87
  %94 = fcmp contract olt float %90, %92
  br i1 %94, label %97, label %98

95:                                               ; preds = %87
  %96 = fcmp contract ogt float %90, %92
  br i1 %96, label %97, label %98

97:                                               ; preds = %95, %93
  store float %92, float addrspace(3)* %7, align 4, !tbaa !5
  store float %90, float addrspace(3)* %91, align 4, !tbaa !5
  br label %98

98:                                               ; preds = %97, %95, %93, %83, %80
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %99 = lshr i32 %3, 4
  %100 = add nsw i32 %3, -8
  %101 = icmp ult i32 %3, 8
  br i1 %101, label %117, label %102

102:                                              ; preds = %98
  %103 = lshr i32 %100, 4
  %104 = and i32 %103, 4095
  %105 = icmp eq i32 %104, %99
  br i1 %105, label %106, label %117

106:                                              ; preds = %102
  %107 = and i32 %3, 16
  %108 = icmp eq i32 %107, 0
  %109 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %110 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %100
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !5
  br i1 %108, label %112, label %114

112:                                              ; preds = %106
  %113 = fcmp contract olt float %109, %111
  br i1 %113, label %116, label %117

114:                                              ; preds = %106
  %115 = fcmp contract ogt float %109, %111
  br i1 %115, label %116, label %117

116:                                              ; preds = %114, %112
  store float %111, float addrspace(3)* %7, align 4, !tbaa !5
  store float %109, float addrspace(3)* %110, align 4, !tbaa !5
  br label %117

117:                                              ; preds = %116, %114, %112, %102, %98
  %118 = add nsw i32 %3, -4
  %119 = icmp ult i32 %3, 4
  br i1 %119, label %135, label %120

120:                                              ; preds = %117
  %121 = lshr i32 %118, 4
  %122 = and i32 %121, 4095
  %123 = icmp eq i32 %122, %99
  br i1 %123, label %124, label %135

124:                                              ; preds = %120
  %125 = and i32 %3, 16
  %126 = icmp eq i32 %125, 0
  %127 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %128 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %118
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !5
  br i1 %126, label %130, label %132

130:                                              ; preds = %124
  %131 = fcmp contract olt float %127, %129
  br i1 %131, label %134, label %135

132:                                              ; preds = %124
  %133 = fcmp contract ogt float %127, %129
  br i1 %133, label %134, label %135

134:                                              ; preds = %132, %130
  store float %129, float addrspace(3)* %7, align 4, !tbaa !5
  store float %127, float addrspace(3)* %128, align 4, !tbaa !5
  br label %135

135:                                              ; preds = %134, %132, %130, %120, %117
  %136 = add nsw i32 %3, -2
  %137 = icmp ult i32 %3, 2
  br i1 %137, label %153, label %138

138:                                              ; preds = %135
  %139 = lshr i32 %136, 4
  %140 = and i32 %139, 4095
  %141 = icmp eq i32 %140, %99
  br i1 %141, label %142, label %153

142:                                              ; preds = %138
  %143 = and i32 %3, 16
  %144 = icmp eq i32 %143, 0
  %145 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %146 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %136
  %147 = load float, float addrspace(3)* %146, align 4, !tbaa !5
  br i1 %144, label %148, label %150

148:                                              ; preds = %142
  %149 = fcmp contract olt float %145, %147
  br i1 %149, label %152, label %153

150:                                              ; preds = %142
  %151 = fcmp contract ogt float %145, %147
  br i1 %151, label %152, label %153

152:                                              ; preds = %150, %148
  store float %147, float addrspace(3)* %7, align 4, !tbaa !5
  store float %145, float addrspace(3)* %146, align 4, !tbaa !5
  br label %153

153:                                              ; preds = %152, %150, %148, %138, %135
  %154 = add nsw i32 %3, -1
  %155 = icmp eq i32 %3, 0
  br i1 %155, label %171, label %156

156:                                              ; preds = %153
  %157 = lshr i32 %154, 4
  %158 = and i32 %157, 4095
  %159 = icmp eq i32 %158, %99
  br i1 %159, label %160, label %171

160:                                              ; preds = %156
  %161 = and i32 %3, 16
  %162 = icmp eq i32 %161, 0
  %163 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %164 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %154
  %165 = load float, float addrspace(3)* %164, align 4, !tbaa !5
  br i1 %162, label %166, label %168

166:                                              ; preds = %160
  %167 = fcmp contract olt float %163, %165
  br i1 %167, label %170, label %171

168:                                              ; preds = %160
  %169 = fcmp contract ogt float %163, %165
  br i1 %169, label %170, label %171

170:                                              ; preds = %168, %166
  store float %165, float addrspace(3)* %7, align 4, !tbaa !5
  store float %163, float addrspace(3)* %164, align 4, !tbaa !5
  br label %171

171:                                              ; preds = %170, %168, %166, %156, %153
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %172 = lshr i32 %3, 5
  %173 = add nsw i32 %3, -16
  %174 = icmp ult i32 %3, 16
  br i1 %174, label %190, label %175

175:                                              ; preds = %171
  %176 = lshr i32 %173, 5
  %177 = and i32 %176, 2047
  %178 = icmp eq i32 %177, %172
  br i1 %178, label %179, label %190

179:                                              ; preds = %175
  %180 = and i32 %3, 32
  %181 = icmp eq i32 %180, 0
  %182 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %183 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %173
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !5
  br i1 %181, label %185, label %187

185:                                              ; preds = %179
  %186 = fcmp contract olt float %182, %184
  br i1 %186, label %189, label %190

187:                                              ; preds = %179
  %188 = fcmp contract ogt float %182, %184
  br i1 %188, label %189, label %190

189:                                              ; preds = %187, %185
  store float %184, float addrspace(3)* %7, align 4, !tbaa !5
  store float %182, float addrspace(3)* %183, align 4, !tbaa !5
  br label %190

190:                                              ; preds = %189, %187, %185, %175, %171
  %191 = add nsw i32 %3, -8
  %192 = icmp ult i32 %3, 8
  br i1 %192, label %208, label %193

193:                                              ; preds = %190
  %194 = lshr i32 %191, 5
  %195 = and i32 %194, 2047
  %196 = icmp eq i32 %195, %172
  br i1 %196, label %197, label %208

197:                                              ; preds = %193
  %198 = and i32 %3, 32
  %199 = icmp eq i32 %198, 0
  %200 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %201 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %191
  %202 = load float, float addrspace(3)* %201, align 4, !tbaa !5
  br i1 %199, label %203, label %205

203:                                              ; preds = %197
  %204 = fcmp contract olt float %200, %202
  br i1 %204, label %207, label %208

205:                                              ; preds = %197
  %206 = fcmp contract ogt float %200, %202
  br i1 %206, label %207, label %208

207:                                              ; preds = %205, %203
  store float %202, float addrspace(3)* %7, align 4, !tbaa !5
  store float %200, float addrspace(3)* %201, align 4, !tbaa !5
  br label %208

208:                                              ; preds = %207, %205, %203, %193, %190
  %209 = add nsw i32 %3, -4
  %210 = icmp ult i32 %3, 4
  br i1 %210, label %226, label %211

211:                                              ; preds = %208
  %212 = lshr i32 %209, 5
  %213 = and i32 %212, 2047
  %214 = icmp eq i32 %213, %172
  br i1 %214, label %215, label %226

215:                                              ; preds = %211
  %216 = and i32 %3, 32
  %217 = icmp eq i32 %216, 0
  %218 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %219 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %209
  %220 = load float, float addrspace(3)* %219, align 4, !tbaa !5
  br i1 %217, label %221, label %223

221:                                              ; preds = %215
  %222 = fcmp contract olt float %218, %220
  br i1 %222, label %225, label %226

223:                                              ; preds = %215
  %224 = fcmp contract ogt float %218, %220
  br i1 %224, label %225, label %226

225:                                              ; preds = %223, %221
  store float %220, float addrspace(3)* %7, align 4, !tbaa !5
  store float %218, float addrspace(3)* %219, align 4, !tbaa !5
  br label %226

226:                                              ; preds = %225, %223, %221, %211, %208
  %227 = add nsw i32 %3, -2
  %228 = icmp ult i32 %3, 2
  br i1 %228, label %244, label %229

229:                                              ; preds = %226
  %230 = lshr i32 %227, 5
  %231 = and i32 %230, 2047
  %232 = icmp eq i32 %231, %172
  br i1 %232, label %233, label %244

233:                                              ; preds = %229
  %234 = and i32 %3, 32
  %235 = icmp eq i32 %234, 0
  %236 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %237 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %227
  %238 = load float, float addrspace(3)* %237, align 4, !tbaa !5
  br i1 %235, label %239, label %241

239:                                              ; preds = %233
  %240 = fcmp contract olt float %236, %238
  br i1 %240, label %243, label %244

241:                                              ; preds = %233
  %242 = fcmp contract ogt float %236, %238
  br i1 %242, label %243, label %244

243:                                              ; preds = %241, %239
  store float %238, float addrspace(3)* %7, align 4, !tbaa !5
  store float %236, float addrspace(3)* %237, align 4, !tbaa !5
  br label %244

244:                                              ; preds = %243, %241, %239, %229, %226
  %245 = add nsw i32 %3, -1
  %246 = icmp eq i32 %3, 0
  br i1 %246, label %262, label %247

247:                                              ; preds = %244
  %248 = lshr i32 %245, 5
  %249 = and i32 %248, 2047
  %250 = icmp eq i32 %249, %172
  br i1 %250, label %251, label %262

251:                                              ; preds = %247
  %252 = and i32 %3, 32
  %253 = icmp eq i32 %252, 0
  %254 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %255 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %245
  %256 = load float, float addrspace(3)* %255, align 4, !tbaa !5
  br i1 %253, label %257, label %259

257:                                              ; preds = %251
  %258 = fcmp contract olt float %254, %256
  br i1 %258, label %261, label %262

259:                                              ; preds = %251
  %260 = fcmp contract ogt float %254, %256
  br i1 %260, label %261, label %262

261:                                              ; preds = %259, %257
  store float %256, float addrspace(3)* %7, align 4, !tbaa !5
  store float %254, float addrspace(3)* %255, align 4, !tbaa !5
  br label %262

262:                                              ; preds = %261, %259, %257, %247, %244
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %263 = lshr i32 %3, 6
  %264 = add nsw i32 %3, -32
  %265 = icmp ult i32 %3, 32
  br i1 %265, label %281, label %266

266:                                              ; preds = %262
  %267 = lshr i32 %264, 6
  %268 = and i32 %267, 1023
  %269 = icmp eq i32 %268, %263
  br i1 %269, label %270, label %281

270:                                              ; preds = %266
  %271 = and i32 %3, 64
  %272 = icmp eq i32 %271, 0
  %273 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %274 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %264
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  br i1 %272, label %276, label %278

276:                                              ; preds = %270
  %277 = fcmp contract olt float %273, %275
  br i1 %277, label %280, label %281

278:                                              ; preds = %270
  %279 = fcmp contract ogt float %273, %275
  br i1 %279, label %280, label %281

280:                                              ; preds = %278, %276
  store float %275, float addrspace(3)* %7, align 4, !tbaa !5
  store float %273, float addrspace(3)* %274, align 4, !tbaa !5
  br label %281

281:                                              ; preds = %280, %278, %276, %266, %262
  %282 = add nsw i32 %3, -16
  %283 = icmp ult i32 %3, 16
  br i1 %283, label %299, label %284

284:                                              ; preds = %281
  %285 = lshr i32 %282, 6
  %286 = and i32 %285, 1023
  %287 = icmp eq i32 %286, %263
  br i1 %287, label %288, label %299

288:                                              ; preds = %284
  %289 = and i32 %3, 64
  %290 = icmp eq i32 %289, 0
  %291 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %292 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %282
  %293 = load float, float addrspace(3)* %292, align 4, !tbaa !5
  br i1 %290, label %294, label %296

294:                                              ; preds = %288
  %295 = fcmp contract olt float %291, %293
  br i1 %295, label %298, label %299

296:                                              ; preds = %288
  %297 = fcmp contract ogt float %291, %293
  br i1 %297, label %298, label %299

298:                                              ; preds = %296, %294
  store float %293, float addrspace(3)* %7, align 4, !tbaa !5
  store float %291, float addrspace(3)* %292, align 4, !tbaa !5
  br label %299

299:                                              ; preds = %298, %296, %294, %284, %281
  %300 = add nsw i32 %3, -8
  %301 = icmp ult i32 %3, 8
  br i1 %301, label %317, label %302

302:                                              ; preds = %299
  %303 = lshr i32 %300, 6
  %304 = and i32 %303, 1023
  %305 = icmp eq i32 %304, %263
  br i1 %305, label %306, label %317

306:                                              ; preds = %302
  %307 = and i32 %3, 64
  %308 = icmp eq i32 %307, 0
  %309 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %310 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %300
  %311 = load float, float addrspace(3)* %310, align 4, !tbaa !5
  br i1 %308, label %312, label %314

312:                                              ; preds = %306
  %313 = fcmp contract olt float %309, %311
  br i1 %313, label %316, label %317

314:                                              ; preds = %306
  %315 = fcmp contract ogt float %309, %311
  br i1 %315, label %316, label %317

316:                                              ; preds = %314, %312
  store float %311, float addrspace(3)* %7, align 4, !tbaa !5
  store float %309, float addrspace(3)* %310, align 4, !tbaa !5
  br label %317

317:                                              ; preds = %316, %314, %312, %302, %299
  %318 = add nsw i32 %3, -4
  %319 = icmp ult i32 %3, 4
  br i1 %319, label %335, label %320

320:                                              ; preds = %317
  %321 = lshr i32 %318, 6
  %322 = and i32 %321, 1023
  %323 = icmp eq i32 %322, %263
  br i1 %323, label %324, label %335

324:                                              ; preds = %320
  %325 = and i32 %3, 64
  %326 = icmp eq i32 %325, 0
  %327 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %328 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %318
  %329 = load float, float addrspace(3)* %328, align 4, !tbaa !5
  br i1 %326, label %330, label %332

330:                                              ; preds = %324
  %331 = fcmp contract olt float %327, %329
  br i1 %331, label %334, label %335

332:                                              ; preds = %324
  %333 = fcmp contract ogt float %327, %329
  br i1 %333, label %334, label %335

334:                                              ; preds = %332, %330
  store float %329, float addrspace(3)* %7, align 4, !tbaa !5
  store float %327, float addrspace(3)* %328, align 4, !tbaa !5
  br label %335

335:                                              ; preds = %334, %332, %330, %320, %317
  %336 = add nsw i32 %3, -2
  %337 = icmp ult i32 %3, 2
  br i1 %337, label %353, label %338

338:                                              ; preds = %335
  %339 = lshr i32 %336, 6
  %340 = and i32 %339, 1023
  %341 = icmp eq i32 %340, %263
  br i1 %341, label %342, label %353

342:                                              ; preds = %338
  %343 = and i32 %3, 64
  %344 = icmp eq i32 %343, 0
  %345 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %346 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %336
  %347 = load float, float addrspace(3)* %346, align 4, !tbaa !5
  br i1 %344, label %348, label %350

348:                                              ; preds = %342
  %349 = fcmp contract olt float %345, %347
  br i1 %349, label %352, label %353

350:                                              ; preds = %342
  %351 = fcmp contract ogt float %345, %347
  br i1 %351, label %352, label %353

352:                                              ; preds = %350, %348
  store float %347, float addrspace(3)* %7, align 4, !tbaa !5
  store float %345, float addrspace(3)* %346, align 4, !tbaa !5
  br label %353

353:                                              ; preds = %352, %350, %348, %338, %335
  %354 = add nsw i32 %3, -1
  %355 = icmp eq i32 %3, 0
  br i1 %355, label %371, label %356

356:                                              ; preds = %353
  %357 = lshr i32 %354, 6
  %358 = and i32 %357, 1023
  %359 = icmp eq i32 %358, %263
  br i1 %359, label %360, label %371

360:                                              ; preds = %356
  %361 = and i32 %3, 64
  %362 = icmp eq i32 %361, 0
  %363 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %364 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %354
  %365 = load float, float addrspace(3)* %364, align 4, !tbaa !5
  br i1 %362, label %366, label %368

366:                                              ; preds = %360
  %367 = fcmp contract olt float %363, %365
  br i1 %367, label %370, label %371

368:                                              ; preds = %360
  %369 = fcmp contract ogt float %363, %365
  br i1 %369, label %370, label %371

370:                                              ; preds = %368, %366
  store float %365, float addrspace(3)* %7, align 4, !tbaa !5
  store float %363, float addrspace(3)* %364, align 4, !tbaa !5
  br label %371

371:                                              ; preds = %370, %368, %366, %356, %353
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %372 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %373 = getelementptr inbounds float, float addrspace(1)* %0, i64 %4
  store float %372, float addrspace(1)* %373, align 4, !tbaa !5
  ret void

374:                                              ; preds = %2
  %375 = lshr i32 %3, 1
  %376 = lshr i32 %8, 1
  %377 = and i32 %376, 32767
  %378 = icmp eq i32 %377, %375
  br i1 %378, label %379, label %390

379:                                              ; preds = %374
  %380 = and i32 %3, 2
  %381 = icmp eq i32 %380, 0
  %382 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %383 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %8
  %384 = load float, float addrspace(3)* %383, align 4, !tbaa !5
  br i1 %381, label %387, label %385

385:                                              ; preds = %379
  %386 = fcmp contract ogt float %382, %384
  br i1 %386, label %389, label %390

387:                                              ; preds = %379
  %388 = fcmp contract olt float %382, %384
  br i1 %388, label %389, label %390

389:                                              ; preds = %387, %385
  store float %384, float addrspace(3)* %7, align 4, !tbaa !5
  store float %382, float addrspace(3)* %383, align 4, !tbaa !5
  br label %390

390:                                              ; preds = %389, %385, %387, %2, %374
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %391 = lshr i32 %3, 2
  %392 = add nsw i32 %3, -2
  %393 = icmp ult i32 %3, 2
  br i1 %393, label %25, label %10
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
