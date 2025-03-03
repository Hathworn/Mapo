; ModuleID = '../data/hip_kernels/1026/0/main.cu'
source_filename = "../data/hip_kernels/1026/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_coordarray = protected addrspace(4) externally_initialized global [20 x i32] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([20 x i32] addrspace(4)* @d_coordarray to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z11kernelHoughiPi(i32 %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = shl i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @d_coordarray, i64 0, i64 %13
  %15 = load i32, i32 addrspace(4)* %14, align 8, !tbaa !7
  %16 = sitofp i32 %15 to float
  %17 = add nuw nsw i32 %12, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @d_coordarray, i64 0, i64 %18
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = sitofp i32 %20 to float
  %22 = fmul contract float %16, -5.000000e+00
  %23 = fsub contract float %21, %22
  %24 = fmul contract float %16, -4.000000e+00
  %25 = fsub contract float %21, %24
  %26 = fcmp contract ugt float %23, 5.000000e+00
  %27 = fcmp contract ult float %23, 4.000000e+00
  %28 = or i1 %26, %27
  br i1 %28, label %29, label %33

29:                                               ; preds = %2
  %30 = fcmp contract ugt float %25, 5.000000e+00
  %31 = fcmp contract ult float %25, 4.000000e+00
  %32 = or i1 %30, %31
  br i1 %32, label %35, label %33

33:                                               ; preds = %29, %2
  %34 = atomicrmw add i32 addrspace(1)* %1, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %35

35:                                               ; preds = %33, %29
  %36 = fcmp contract ugt float %23, 4.000000e+00
  %37 = fcmp contract ult float %23, 3.000000e+00
  %38 = or i1 %36, %37
  br i1 %38, label %39, label %43

39:                                               ; preds = %35
  %40 = fcmp contract ugt float %25, 4.000000e+00
  %41 = fcmp contract ult float %25, 3.000000e+00
  %42 = or i1 %40, %41
  br i1 %42, label %46, label %43

43:                                               ; preds = %39, %35
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 1
  %45 = atomicrmw add i32 addrspace(1)* %44, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %46

46:                                               ; preds = %43, %39
  %47 = fcmp contract ugt float %23, 3.000000e+00
  %48 = fcmp contract ult float %23, 2.000000e+00
  %49 = or i1 %47, %48
  br i1 %49, label %50, label %54

50:                                               ; preds = %46
  %51 = fcmp contract ugt float %25, 3.000000e+00
  %52 = fcmp contract ult float %25, 2.000000e+00
  %53 = or i1 %51, %52
  br i1 %53, label %57, label %54

54:                                               ; preds = %50, %46
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 2
  %56 = atomicrmw add i32 addrspace(1)* %55, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %57

57:                                               ; preds = %54, %50
  %58 = fcmp contract ugt float %23, 2.000000e+00
  %59 = fcmp contract ult float %23, 1.000000e+00
  %60 = or i1 %58, %59
  br i1 %60, label %61, label %65

61:                                               ; preds = %57
  %62 = fcmp contract ugt float %25, 2.000000e+00
  %63 = fcmp contract ult float %25, 1.000000e+00
  %64 = or i1 %62, %63
  br i1 %64, label %68, label %65

65:                                               ; preds = %61, %57
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 3
  %67 = atomicrmw add i32 addrspace(1)* %66, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %68

68:                                               ; preds = %65, %61
  %69 = fcmp contract ugt float %23, 1.000000e+00
  %70 = fcmp contract ult float %23, 0.000000e+00
  %71 = or i1 %69, %70
  br i1 %71, label %72, label %76

72:                                               ; preds = %68
  %73 = fcmp contract ugt float %25, 1.000000e+00
  %74 = fcmp contract ult float %25, 0.000000e+00
  %75 = or i1 %73, %74
  br i1 %75, label %79, label %76

76:                                               ; preds = %72, %68
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 4
  %78 = atomicrmw add i32 addrspace(1)* %77, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %79

79:                                               ; preds = %76, %72
  %80 = fcmp contract ugt float %23, 0.000000e+00
  %81 = fcmp contract ult float %23, -1.000000e+00
  %82 = or i1 %80, %81
  br i1 %82, label %83, label %87

83:                                               ; preds = %79
  %84 = fcmp contract ugt float %25, 0.000000e+00
  %85 = fcmp contract ult float %25, -1.000000e+00
  %86 = or i1 %84, %85
  br i1 %86, label %90, label %87

87:                                               ; preds = %83, %79
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 5
  %89 = atomicrmw add i32 addrspace(1)* %88, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %90

90:                                               ; preds = %87, %83
  %91 = fcmp contract ugt float %23, -1.000000e+00
  %92 = fcmp contract ult float %23, -2.000000e+00
  %93 = or i1 %91, %92
  br i1 %93, label %94, label %98

94:                                               ; preds = %90
  %95 = fcmp contract ugt float %25, -1.000000e+00
  %96 = fcmp contract ult float %25, -2.000000e+00
  %97 = or i1 %95, %96
  br i1 %97, label %101, label %98

98:                                               ; preds = %94, %90
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 6
  %100 = atomicrmw add i32 addrspace(1)* %99, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %101

101:                                              ; preds = %98, %94
  %102 = fcmp contract ugt float %23, -2.000000e+00
  %103 = fcmp contract ult float %23, -3.000000e+00
  %104 = or i1 %102, %103
  br i1 %104, label %105, label %109

105:                                              ; preds = %101
  %106 = fcmp contract ugt float %25, -2.000000e+00
  %107 = fcmp contract ult float %25, -3.000000e+00
  %108 = or i1 %106, %107
  br i1 %108, label %112, label %109

109:                                              ; preds = %105, %101
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 7
  %111 = atomicrmw add i32 addrspace(1)* %110, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %112

112:                                              ; preds = %109, %105
  %113 = fcmp contract ugt float %23, -3.000000e+00
  %114 = fcmp contract ult float %23, -4.000000e+00
  %115 = or i1 %113, %114
  br i1 %115, label %116, label %120

116:                                              ; preds = %112
  %117 = fcmp contract ugt float %25, -3.000000e+00
  %118 = fcmp contract ult float %25, -4.000000e+00
  %119 = or i1 %117, %118
  br i1 %119, label %123, label %120

120:                                              ; preds = %116, %112
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 8
  %122 = atomicrmw add i32 addrspace(1)* %121, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %123

123:                                              ; preds = %120, %116
  %124 = fcmp contract ugt float %23, -4.000000e+00
  %125 = fcmp contract ult float %23, -5.000000e+00
  %126 = or i1 %124, %125
  br i1 %126, label %127, label %131

127:                                              ; preds = %123
  %128 = fcmp contract ugt float %25, -4.000000e+00
  %129 = fcmp contract ult float %25, -5.000000e+00
  %130 = or i1 %128, %129
  br i1 %130, label %134, label %131

131:                                              ; preds = %127, %123
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 9
  %133 = atomicrmw add i32 addrspace(1)* %132, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %134

134:                                              ; preds = %131, %127
  %135 = fmul contract float %16, -3.000000e+00
  %136 = fsub contract float %21, %135
  %137 = fcmp contract ugt float %25, 5.000000e+00
  %138 = fcmp contract ult float %25, 4.000000e+00
  %139 = or i1 %137, %138
  br i1 %139, label %140, label %144

140:                                              ; preds = %134
  %141 = fcmp contract ugt float %136, 5.000000e+00
  %142 = fcmp contract ult float %136, 4.000000e+00
  %143 = or i1 %141, %142
  br i1 %143, label %147, label %144

144:                                              ; preds = %140, %134
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 10
  %146 = atomicrmw add i32 addrspace(1)* %145, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %147

147:                                              ; preds = %144, %140
  %148 = fcmp contract ugt float %25, 4.000000e+00
  %149 = fcmp contract ult float %25, 3.000000e+00
  %150 = or i1 %148, %149
  br i1 %150, label %151, label %155

151:                                              ; preds = %147
  %152 = fcmp contract ugt float %136, 4.000000e+00
  %153 = fcmp contract ult float %136, 3.000000e+00
  %154 = or i1 %152, %153
  br i1 %154, label %158, label %155

155:                                              ; preds = %151, %147
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 11
  %157 = atomicrmw add i32 addrspace(1)* %156, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %158

158:                                              ; preds = %155, %151
  %159 = fcmp contract ugt float %25, 3.000000e+00
  %160 = fcmp contract ult float %25, 2.000000e+00
  %161 = or i1 %159, %160
  br i1 %161, label %162, label %166

162:                                              ; preds = %158
  %163 = fcmp contract ugt float %136, 3.000000e+00
  %164 = fcmp contract ult float %136, 2.000000e+00
  %165 = or i1 %163, %164
  br i1 %165, label %169, label %166

166:                                              ; preds = %162, %158
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 12
  %168 = atomicrmw add i32 addrspace(1)* %167, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %169

169:                                              ; preds = %166, %162
  %170 = fcmp contract ugt float %25, 2.000000e+00
  %171 = fcmp contract ult float %25, 1.000000e+00
  %172 = or i1 %170, %171
  br i1 %172, label %173, label %177

173:                                              ; preds = %169
  %174 = fcmp contract ugt float %136, 2.000000e+00
  %175 = fcmp contract ult float %136, 1.000000e+00
  %176 = or i1 %174, %175
  br i1 %176, label %180, label %177

177:                                              ; preds = %173, %169
  %178 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 13
  %179 = atomicrmw add i32 addrspace(1)* %178, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %180

180:                                              ; preds = %177, %173
  %181 = fcmp contract ugt float %25, 1.000000e+00
  %182 = fcmp contract ult float %25, 0.000000e+00
  %183 = or i1 %181, %182
  br i1 %183, label %184, label %188

184:                                              ; preds = %180
  %185 = fcmp contract ugt float %136, 1.000000e+00
  %186 = fcmp contract ult float %136, 0.000000e+00
  %187 = or i1 %185, %186
  br i1 %187, label %191, label %188

188:                                              ; preds = %184, %180
  %189 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 14
  %190 = atomicrmw add i32 addrspace(1)* %189, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %191

191:                                              ; preds = %188, %184
  %192 = fcmp contract ugt float %25, 0.000000e+00
  %193 = fcmp contract ult float %25, -1.000000e+00
  %194 = or i1 %192, %193
  br i1 %194, label %195, label %199

195:                                              ; preds = %191
  %196 = fcmp contract ugt float %136, 0.000000e+00
  %197 = fcmp contract ult float %136, -1.000000e+00
  %198 = or i1 %196, %197
  br i1 %198, label %202, label %199

199:                                              ; preds = %195, %191
  %200 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 15
  %201 = atomicrmw add i32 addrspace(1)* %200, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %202

202:                                              ; preds = %199, %195
  %203 = fcmp contract ugt float %25, -1.000000e+00
  %204 = fcmp contract ult float %25, -2.000000e+00
  %205 = or i1 %203, %204
  br i1 %205, label %206, label %210

206:                                              ; preds = %202
  %207 = fcmp contract ugt float %136, -1.000000e+00
  %208 = fcmp contract ult float %136, -2.000000e+00
  %209 = or i1 %207, %208
  br i1 %209, label %213, label %210

210:                                              ; preds = %206, %202
  %211 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 16
  %212 = atomicrmw add i32 addrspace(1)* %211, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %213

213:                                              ; preds = %210, %206
  %214 = fcmp contract ugt float %25, -2.000000e+00
  %215 = fcmp contract ult float %25, -3.000000e+00
  %216 = or i1 %214, %215
  br i1 %216, label %217, label %221

217:                                              ; preds = %213
  %218 = fcmp contract ugt float %136, -2.000000e+00
  %219 = fcmp contract ult float %136, -3.000000e+00
  %220 = or i1 %218, %219
  br i1 %220, label %224, label %221

221:                                              ; preds = %217, %213
  %222 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 17
  %223 = atomicrmw add i32 addrspace(1)* %222, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %224

224:                                              ; preds = %221, %217
  %225 = fcmp contract ugt float %25, -3.000000e+00
  %226 = fcmp contract ult float %25, -4.000000e+00
  %227 = or i1 %225, %226
  br i1 %227, label %228, label %232

228:                                              ; preds = %224
  %229 = fcmp contract ugt float %136, -3.000000e+00
  %230 = fcmp contract ult float %136, -4.000000e+00
  %231 = or i1 %229, %230
  br i1 %231, label %235, label %232

232:                                              ; preds = %228, %224
  %233 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 18
  %234 = atomicrmw add i32 addrspace(1)* %233, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %235

235:                                              ; preds = %232, %228
  %236 = fcmp contract ugt float %25, -4.000000e+00
  %237 = fcmp contract ult float %25, -5.000000e+00
  %238 = or i1 %236, %237
  br i1 %238, label %239, label %243

239:                                              ; preds = %235
  %240 = fcmp contract ugt float %136, -4.000000e+00
  %241 = fcmp contract ult float %136, -5.000000e+00
  %242 = or i1 %240, %241
  br i1 %242, label %246, label %243

243:                                              ; preds = %239, %235
  %244 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 19
  %245 = atomicrmw add i32 addrspace(1)* %244, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %246

246:                                              ; preds = %243, %239
  %247 = fmul contract float %16, -2.000000e+00
  %248 = fsub contract float %21, %247
  %249 = fcmp contract ugt float %136, 5.000000e+00
  %250 = fcmp contract ult float %136, 4.000000e+00
  %251 = or i1 %249, %250
  br i1 %251, label %252, label %256

252:                                              ; preds = %246
  %253 = fcmp contract ugt float %248, 5.000000e+00
  %254 = fcmp contract ult float %248, 4.000000e+00
  %255 = or i1 %253, %254
  br i1 %255, label %259, label %256

256:                                              ; preds = %252, %246
  %257 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 20
  %258 = atomicrmw add i32 addrspace(1)* %257, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %259

259:                                              ; preds = %256, %252
  %260 = fcmp contract ugt float %136, 4.000000e+00
  %261 = fcmp contract ult float %136, 3.000000e+00
  %262 = or i1 %260, %261
  br i1 %262, label %263, label %267

263:                                              ; preds = %259
  %264 = fcmp contract ugt float %248, 4.000000e+00
  %265 = fcmp contract ult float %248, 3.000000e+00
  %266 = or i1 %264, %265
  br i1 %266, label %270, label %267

267:                                              ; preds = %263, %259
  %268 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 21
  %269 = atomicrmw add i32 addrspace(1)* %268, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %270

270:                                              ; preds = %267, %263
  %271 = fcmp contract ugt float %136, 3.000000e+00
  %272 = fcmp contract ult float %136, 2.000000e+00
  %273 = or i1 %271, %272
  br i1 %273, label %274, label %278

274:                                              ; preds = %270
  %275 = fcmp contract ugt float %248, 3.000000e+00
  %276 = fcmp contract ult float %248, 2.000000e+00
  %277 = or i1 %275, %276
  br i1 %277, label %281, label %278

278:                                              ; preds = %274, %270
  %279 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 22
  %280 = atomicrmw add i32 addrspace(1)* %279, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %281

281:                                              ; preds = %278, %274
  %282 = fcmp contract ugt float %136, 2.000000e+00
  %283 = fcmp contract ult float %136, 1.000000e+00
  %284 = or i1 %282, %283
  br i1 %284, label %285, label %289

285:                                              ; preds = %281
  %286 = fcmp contract ugt float %248, 2.000000e+00
  %287 = fcmp contract ult float %248, 1.000000e+00
  %288 = or i1 %286, %287
  br i1 %288, label %292, label %289

289:                                              ; preds = %285, %281
  %290 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 23
  %291 = atomicrmw add i32 addrspace(1)* %290, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %292

292:                                              ; preds = %289, %285
  %293 = fcmp contract ugt float %136, 1.000000e+00
  %294 = fcmp contract ult float %136, 0.000000e+00
  %295 = or i1 %293, %294
  br i1 %295, label %296, label %300

296:                                              ; preds = %292
  %297 = fcmp contract ugt float %248, 1.000000e+00
  %298 = fcmp contract ult float %248, 0.000000e+00
  %299 = or i1 %297, %298
  br i1 %299, label %303, label %300

300:                                              ; preds = %296, %292
  %301 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 24
  %302 = atomicrmw add i32 addrspace(1)* %301, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %303

303:                                              ; preds = %300, %296
  %304 = fcmp contract ugt float %136, 0.000000e+00
  %305 = fcmp contract ult float %136, -1.000000e+00
  %306 = or i1 %304, %305
  br i1 %306, label %307, label %311

307:                                              ; preds = %303
  %308 = fcmp contract ugt float %248, 0.000000e+00
  %309 = fcmp contract ult float %248, -1.000000e+00
  %310 = or i1 %308, %309
  br i1 %310, label %314, label %311

311:                                              ; preds = %307, %303
  %312 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 25
  %313 = atomicrmw add i32 addrspace(1)* %312, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %314

314:                                              ; preds = %311, %307
  %315 = fcmp contract ugt float %136, -1.000000e+00
  %316 = fcmp contract ult float %136, -2.000000e+00
  %317 = or i1 %315, %316
  br i1 %317, label %318, label %322

318:                                              ; preds = %314
  %319 = fcmp contract ugt float %248, -1.000000e+00
  %320 = fcmp contract ult float %248, -2.000000e+00
  %321 = or i1 %319, %320
  br i1 %321, label %325, label %322

322:                                              ; preds = %318, %314
  %323 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 26
  %324 = atomicrmw add i32 addrspace(1)* %323, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %325

325:                                              ; preds = %322, %318
  %326 = fcmp contract ugt float %136, -2.000000e+00
  %327 = fcmp contract ult float %136, -3.000000e+00
  %328 = or i1 %326, %327
  br i1 %328, label %329, label %333

329:                                              ; preds = %325
  %330 = fcmp contract ugt float %248, -2.000000e+00
  %331 = fcmp contract ult float %248, -3.000000e+00
  %332 = or i1 %330, %331
  br i1 %332, label %336, label %333

333:                                              ; preds = %329, %325
  %334 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 27
  %335 = atomicrmw add i32 addrspace(1)* %334, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %336

336:                                              ; preds = %333, %329
  %337 = fcmp contract ugt float %136, -3.000000e+00
  %338 = fcmp contract ult float %136, -4.000000e+00
  %339 = or i1 %337, %338
  br i1 %339, label %340, label %344

340:                                              ; preds = %336
  %341 = fcmp contract ugt float %248, -3.000000e+00
  %342 = fcmp contract ult float %248, -4.000000e+00
  %343 = or i1 %341, %342
  br i1 %343, label %347, label %344

344:                                              ; preds = %340, %336
  %345 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 28
  %346 = atomicrmw add i32 addrspace(1)* %345, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %347

347:                                              ; preds = %344, %340
  %348 = fcmp contract ugt float %136, -4.000000e+00
  %349 = fcmp contract ult float %136, -5.000000e+00
  %350 = or i1 %348, %349
  br i1 %350, label %351, label %355

351:                                              ; preds = %347
  %352 = fcmp contract ugt float %248, -4.000000e+00
  %353 = fcmp contract ult float %248, -5.000000e+00
  %354 = or i1 %352, %353
  br i1 %354, label %358, label %355

355:                                              ; preds = %351, %347
  %356 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 29
  %357 = atomicrmw add i32 addrspace(1)* %356, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %358

358:                                              ; preds = %355, %351
  %359 = fadd contract float %21, %16
  %360 = fcmp contract ugt float %248, 5.000000e+00
  %361 = fcmp contract ult float %248, 4.000000e+00
  %362 = or i1 %360, %361
  br i1 %362, label %363, label %367

363:                                              ; preds = %358
  %364 = fcmp contract ugt float %359, 5.000000e+00
  %365 = fcmp contract ult float %359, 4.000000e+00
  %366 = or i1 %364, %365
  br i1 %366, label %370, label %367

367:                                              ; preds = %363, %358
  %368 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 30
  %369 = atomicrmw add i32 addrspace(1)* %368, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %370

370:                                              ; preds = %367, %363
  %371 = fcmp contract ugt float %248, 4.000000e+00
  %372 = fcmp contract ult float %248, 3.000000e+00
  %373 = or i1 %371, %372
  br i1 %373, label %374, label %378

374:                                              ; preds = %370
  %375 = fcmp contract ugt float %359, 4.000000e+00
  %376 = fcmp contract ult float %359, 3.000000e+00
  %377 = or i1 %375, %376
  br i1 %377, label %381, label %378

378:                                              ; preds = %374, %370
  %379 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 31
  %380 = atomicrmw add i32 addrspace(1)* %379, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %381

381:                                              ; preds = %378, %374
  %382 = fcmp contract ugt float %248, 3.000000e+00
  %383 = fcmp contract ult float %248, 2.000000e+00
  %384 = or i1 %382, %383
  br i1 %384, label %385, label %389

385:                                              ; preds = %381
  %386 = fcmp contract ugt float %359, 3.000000e+00
  %387 = fcmp contract ult float %359, 2.000000e+00
  %388 = or i1 %386, %387
  br i1 %388, label %392, label %389

389:                                              ; preds = %385, %381
  %390 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 32
  %391 = atomicrmw add i32 addrspace(1)* %390, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %392

392:                                              ; preds = %389, %385
  %393 = fcmp contract ugt float %248, 2.000000e+00
  %394 = fcmp contract ult float %248, 1.000000e+00
  %395 = or i1 %393, %394
  br i1 %395, label %396, label %400

396:                                              ; preds = %392
  %397 = fcmp contract ugt float %359, 2.000000e+00
  %398 = fcmp contract ult float %359, 1.000000e+00
  %399 = or i1 %397, %398
  br i1 %399, label %403, label %400

400:                                              ; preds = %396, %392
  %401 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 33
  %402 = atomicrmw add i32 addrspace(1)* %401, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %403

403:                                              ; preds = %400, %396
  %404 = fcmp contract ugt float %248, 1.000000e+00
  %405 = fcmp contract ult float %248, 0.000000e+00
  %406 = or i1 %404, %405
  br i1 %406, label %407, label %411

407:                                              ; preds = %403
  %408 = fcmp contract ugt float %359, 1.000000e+00
  %409 = fcmp contract ult float %359, 0.000000e+00
  %410 = or i1 %408, %409
  br i1 %410, label %414, label %411

411:                                              ; preds = %407, %403
  %412 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 34
  %413 = atomicrmw add i32 addrspace(1)* %412, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %414

414:                                              ; preds = %411, %407
  %415 = fcmp contract ugt float %248, 0.000000e+00
  %416 = fcmp contract ult float %248, -1.000000e+00
  %417 = or i1 %415, %416
  br i1 %417, label %418, label %422

418:                                              ; preds = %414
  %419 = fcmp contract ugt float %359, 0.000000e+00
  %420 = fcmp contract ult float %359, -1.000000e+00
  %421 = or i1 %419, %420
  br i1 %421, label %425, label %422

422:                                              ; preds = %418, %414
  %423 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 35
  %424 = atomicrmw add i32 addrspace(1)* %423, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %425

425:                                              ; preds = %422, %418
  %426 = fcmp contract ugt float %248, -1.000000e+00
  %427 = fcmp contract ult float %248, -2.000000e+00
  %428 = or i1 %426, %427
  br i1 %428, label %429, label %433

429:                                              ; preds = %425
  %430 = fcmp contract ugt float %359, -1.000000e+00
  %431 = fcmp contract ult float %359, -2.000000e+00
  %432 = or i1 %430, %431
  br i1 %432, label %436, label %433

433:                                              ; preds = %429, %425
  %434 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 36
  %435 = atomicrmw add i32 addrspace(1)* %434, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %436

436:                                              ; preds = %433, %429
  %437 = fcmp contract ugt float %248, -2.000000e+00
  %438 = fcmp contract ult float %248, -3.000000e+00
  %439 = or i1 %437, %438
  br i1 %439, label %440, label %444

440:                                              ; preds = %436
  %441 = fcmp contract ugt float %359, -2.000000e+00
  %442 = fcmp contract ult float %359, -3.000000e+00
  %443 = or i1 %441, %442
  br i1 %443, label %447, label %444

444:                                              ; preds = %440, %436
  %445 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 37
  %446 = atomicrmw add i32 addrspace(1)* %445, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %447

447:                                              ; preds = %444, %440
  %448 = fcmp contract ugt float %248, -3.000000e+00
  %449 = fcmp contract ult float %248, -4.000000e+00
  %450 = or i1 %448, %449
  br i1 %450, label %451, label %455

451:                                              ; preds = %447
  %452 = fcmp contract ugt float %359, -3.000000e+00
  %453 = fcmp contract ult float %359, -4.000000e+00
  %454 = or i1 %452, %453
  br i1 %454, label %458, label %455

455:                                              ; preds = %451, %447
  %456 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 38
  %457 = atomicrmw add i32 addrspace(1)* %456, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %458

458:                                              ; preds = %455, %451
  %459 = fcmp contract ugt float %248, -4.000000e+00
  %460 = fcmp contract ult float %248, -5.000000e+00
  %461 = or i1 %459, %460
  br i1 %461, label %462, label %466

462:                                              ; preds = %458
  %463 = fcmp contract ugt float %359, -4.000000e+00
  %464 = fcmp contract ult float %359, -5.000000e+00
  %465 = or i1 %463, %464
  br i1 %465, label %469, label %466

466:                                              ; preds = %462, %458
  %467 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 39
  %468 = atomicrmw add i32 addrspace(1)* %467, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %469

469:                                              ; preds = %466, %462
  %470 = fmul contract float %16, 0.000000e+00
  %471 = fsub contract float %21, %470
  %472 = fcmp contract ugt float %359, 5.000000e+00
  %473 = fcmp contract ult float %359, 4.000000e+00
  %474 = or i1 %472, %473
  br i1 %474, label %475, label %479

475:                                              ; preds = %469
  %476 = fcmp contract ugt float %471, 5.000000e+00
  %477 = fcmp contract ult float %471, 4.000000e+00
  %478 = or i1 %476, %477
  br i1 %478, label %482, label %479

479:                                              ; preds = %475, %469
  %480 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 40
  %481 = atomicrmw add i32 addrspace(1)* %480, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %482

482:                                              ; preds = %479, %475
  %483 = fcmp contract ugt float %359, 4.000000e+00
  %484 = fcmp contract ult float %359, 3.000000e+00
  %485 = or i1 %483, %484
  br i1 %485, label %486, label %490

486:                                              ; preds = %482
  %487 = fcmp contract ugt float %471, 4.000000e+00
  %488 = fcmp contract ult float %471, 3.000000e+00
  %489 = or i1 %487, %488
  br i1 %489, label %493, label %490

490:                                              ; preds = %486, %482
  %491 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 41
  %492 = atomicrmw add i32 addrspace(1)* %491, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %493

493:                                              ; preds = %490, %486
  %494 = fcmp contract ugt float %359, 3.000000e+00
  %495 = fcmp contract ult float %359, 2.000000e+00
  %496 = or i1 %494, %495
  br i1 %496, label %497, label %501

497:                                              ; preds = %493
  %498 = fcmp contract ugt float %471, 3.000000e+00
  %499 = fcmp contract ult float %471, 2.000000e+00
  %500 = or i1 %498, %499
  br i1 %500, label %504, label %501

501:                                              ; preds = %497, %493
  %502 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 42
  %503 = atomicrmw add i32 addrspace(1)* %502, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %504

504:                                              ; preds = %501, %497
  %505 = fcmp contract ugt float %359, 2.000000e+00
  %506 = fcmp contract ult float %359, 1.000000e+00
  %507 = or i1 %505, %506
  br i1 %507, label %508, label %512

508:                                              ; preds = %504
  %509 = fcmp contract ugt float %471, 2.000000e+00
  %510 = fcmp contract ult float %471, 1.000000e+00
  %511 = or i1 %509, %510
  br i1 %511, label %515, label %512

512:                                              ; preds = %508, %504
  %513 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 43
  %514 = atomicrmw add i32 addrspace(1)* %513, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %515

515:                                              ; preds = %512, %508
  %516 = fcmp contract ugt float %359, 1.000000e+00
  %517 = fcmp contract ult float %359, 0.000000e+00
  %518 = or i1 %516, %517
  br i1 %518, label %519, label %523

519:                                              ; preds = %515
  %520 = fcmp contract ugt float %471, 1.000000e+00
  %521 = fcmp contract ult float %471, 0.000000e+00
  %522 = or i1 %520, %521
  br i1 %522, label %526, label %523

523:                                              ; preds = %519, %515
  %524 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 44
  %525 = atomicrmw add i32 addrspace(1)* %524, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %526

526:                                              ; preds = %523, %519
  %527 = fcmp contract ugt float %359, 0.000000e+00
  %528 = fcmp contract ult float %359, -1.000000e+00
  %529 = or i1 %527, %528
  br i1 %529, label %530, label %534

530:                                              ; preds = %526
  %531 = fcmp contract ugt float %471, 0.000000e+00
  %532 = fcmp contract ult float %471, -1.000000e+00
  %533 = or i1 %531, %532
  br i1 %533, label %537, label %534

534:                                              ; preds = %530, %526
  %535 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 45
  %536 = atomicrmw add i32 addrspace(1)* %535, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %537

537:                                              ; preds = %534, %530
  %538 = fcmp contract ugt float %359, -1.000000e+00
  %539 = fcmp contract ult float %359, -2.000000e+00
  %540 = or i1 %538, %539
  br i1 %540, label %541, label %545

541:                                              ; preds = %537
  %542 = fcmp contract ugt float %471, -1.000000e+00
  %543 = fcmp contract ult float %471, -2.000000e+00
  %544 = or i1 %542, %543
  br i1 %544, label %548, label %545

545:                                              ; preds = %541, %537
  %546 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 46
  %547 = atomicrmw add i32 addrspace(1)* %546, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %548

548:                                              ; preds = %545, %541
  %549 = fcmp contract ugt float %359, -2.000000e+00
  %550 = fcmp contract ult float %359, -3.000000e+00
  %551 = or i1 %549, %550
  br i1 %551, label %552, label %556

552:                                              ; preds = %548
  %553 = fcmp contract ugt float %471, -2.000000e+00
  %554 = fcmp contract ult float %471, -3.000000e+00
  %555 = or i1 %553, %554
  br i1 %555, label %559, label %556

556:                                              ; preds = %552, %548
  %557 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 47
  %558 = atomicrmw add i32 addrspace(1)* %557, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %559

559:                                              ; preds = %556, %552
  %560 = fcmp contract ugt float %359, -3.000000e+00
  %561 = fcmp contract ult float %359, -4.000000e+00
  %562 = or i1 %560, %561
  br i1 %562, label %563, label %567

563:                                              ; preds = %559
  %564 = fcmp contract ugt float %471, -3.000000e+00
  %565 = fcmp contract ult float %471, -4.000000e+00
  %566 = or i1 %564, %565
  br i1 %566, label %570, label %567

567:                                              ; preds = %563, %559
  %568 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 48
  %569 = atomicrmw add i32 addrspace(1)* %568, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %570

570:                                              ; preds = %567, %563
  %571 = fcmp contract ugt float %359, -4.000000e+00
  %572 = fcmp contract ult float %359, -5.000000e+00
  %573 = or i1 %571, %572
  br i1 %573, label %574, label %578

574:                                              ; preds = %570
  %575 = fcmp contract ugt float %471, -4.000000e+00
  %576 = fcmp contract ult float %471, -5.000000e+00
  %577 = or i1 %575, %576
  br i1 %577, label %581, label %578

578:                                              ; preds = %574, %570
  %579 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 49
  %580 = atomicrmw add i32 addrspace(1)* %579, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %581

581:                                              ; preds = %578, %574
  %582 = fsub contract float %21, %16
  %583 = fcmp contract ugt float %471, 5.000000e+00
  %584 = fcmp contract ult float %471, 4.000000e+00
  %585 = or i1 %583, %584
  br i1 %585, label %586, label %590

586:                                              ; preds = %581
  %587 = fcmp contract ugt float %582, 5.000000e+00
  %588 = fcmp contract ult float %582, 4.000000e+00
  %589 = or i1 %587, %588
  br i1 %589, label %593, label %590

590:                                              ; preds = %586, %581
  %591 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 50
  %592 = atomicrmw add i32 addrspace(1)* %591, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %593

593:                                              ; preds = %590, %586
  %594 = fcmp contract ugt float %471, 4.000000e+00
  %595 = fcmp contract ult float %471, 3.000000e+00
  %596 = or i1 %594, %595
  br i1 %596, label %597, label %601

597:                                              ; preds = %593
  %598 = fcmp contract ugt float %582, 4.000000e+00
  %599 = fcmp contract ult float %582, 3.000000e+00
  %600 = or i1 %598, %599
  br i1 %600, label %604, label %601

601:                                              ; preds = %597, %593
  %602 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 51
  %603 = atomicrmw add i32 addrspace(1)* %602, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %604

604:                                              ; preds = %601, %597
  %605 = fcmp contract ugt float %471, 3.000000e+00
  %606 = fcmp contract ult float %471, 2.000000e+00
  %607 = or i1 %605, %606
  br i1 %607, label %608, label %612

608:                                              ; preds = %604
  %609 = fcmp contract ugt float %582, 3.000000e+00
  %610 = fcmp contract ult float %582, 2.000000e+00
  %611 = or i1 %609, %610
  br i1 %611, label %615, label %612

612:                                              ; preds = %608, %604
  %613 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 52
  %614 = atomicrmw add i32 addrspace(1)* %613, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %615

615:                                              ; preds = %612, %608
  %616 = fcmp contract ugt float %471, 2.000000e+00
  %617 = fcmp contract ult float %471, 1.000000e+00
  %618 = or i1 %616, %617
  br i1 %618, label %619, label %623

619:                                              ; preds = %615
  %620 = fcmp contract ugt float %582, 2.000000e+00
  %621 = fcmp contract ult float %582, 1.000000e+00
  %622 = or i1 %620, %621
  br i1 %622, label %626, label %623

623:                                              ; preds = %619, %615
  %624 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 53
  %625 = atomicrmw add i32 addrspace(1)* %624, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %626

626:                                              ; preds = %623, %619
  %627 = fcmp contract ugt float %471, 1.000000e+00
  %628 = fcmp contract ult float %471, 0.000000e+00
  %629 = or i1 %627, %628
  br i1 %629, label %630, label %634

630:                                              ; preds = %626
  %631 = fcmp contract ugt float %582, 1.000000e+00
  %632 = fcmp contract ult float %582, 0.000000e+00
  %633 = or i1 %631, %632
  br i1 %633, label %637, label %634

634:                                              ; preds = %630, %626
  %635 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 54
  %636 = atomicrmw add i32 addrspace(1)* %635, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %637

637:                                              ; preds = %634, %630
  %638 = fcmp contract ugt float %471, 0.000000e+00
  %639 = fcmp contract ult float %471, -1.000000e+00
  %640 = or i1 %638, %639
  br i1 %640, label %641, label %645

641:                                              ; preds = %637
  %642 = fcmp contract ugt float %582, 0.000000e+00
  %643 = fcmp contract ult float %582, -1.000000e+00
  %644 = or i1 %642, %643
  br i1 %644, label %648, label %645

645:                                              ; preds = %641, %637
  %646 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 55
  %647 = atomicrmw add i32 addrspace(1)* %646, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %648

648:                                              ; preds = %645, %641
  %649 = fcmp contract ugt float %471, -1.000000e+00
  %650 = fcmp contract ult float %471, -2.000000e+00
  %651 = or i1 %649, %650
  br i1 %651, label %652, label %656

652:                                              ; preds = %648
  %653 = fcmp contract ugt float %582, -1.000000e+00
  %654 = fcmp contract ult float %582, -2.000000e+00
  %655 = or i1 %653, %654
  br i1 %655, label %659, label %656

656:                                              ; preds = %652, %648
  %657 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 56
  %658 = atomicrmw add i32 addrspace(1)* %657, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %659

659:                                              ; preds = %656, %652
  %660 = fcmp contract ugt float %471, -2.000000e+00
  %661 = fcmp contract ult float %471, -3.000000e+00
  %662 = or i1 %660, %661
  br i1 %662, label %663, label %667

663:                                              ; preds = %659
  %664 = fcmp contract ugt float %582, -2.000000e+00
  %665 = fcmp contract ult float %582, -3.000000e+00
  %666 = or i1 %664, %665
  br i1 %666, label %670, label %667

667:                                              ; preds = %663, %659
  %668 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 57
  %669 = atomicrmw add i32 addrspace(1)* %668, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %670

670:                                              ; preds = %667, %663
  %671 = fcmp contract ugt float %471, -3.000000e+00
  %672 = fcmp contract ult float %471, -4.000000e+00
  %673 = or i1 %671, %672
  br i1 %673, label %674, label %678

674:                                              ; preds = %670
  %675 = fcmp contract ugt float %582, -3.000000e+00
  %676 = fcmp contract ult float %582, -4.000000e+00
  %677 = or i1 %675, %676
  br i1 %677, label %681, label %678

678:                                              ; preds = %674, %670
  %679 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 58
  %680 = atomicrmw add i32 addrspace(1)* %679, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %681

681:                                              ; preds = %678, %674
  %682 = fcmp contract ugt float %471, -4.000000e+00
  %683 = fcmp contract ult float %471, -5.000000e+00
  %684 = or i1 %682, %683
  br i1 %684, label %685, label %689

685:                                              ; preds = %681
  %686 = fcmp contract ugt float %582, -4.000000e+00
  %687 = fcmp contract ult float %582, -5.000000e+00
  %688 = or i1 %686, %687
  br i1 %688, label %692, label %689

689:                                              ; preds = %685, %681
  %690 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 59
  %691 = atomicrmw add i32 addrspace(1)* %690, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %692

692:                                              ; preds = %689, %685
  %693 = fmul contract float %16, 2.000000e+00
  %694 = fsub contract float %21, %693
  %695 = fcmp contract ugt float %582, 5.000000e+00
  %696 = fcmp contract ult float %582, 4.000000e+00
  %697 = or i1 %695, %696
  br i1 %697, label %698, label %702

698:                                              ; preds = %692
  %699 = fcmp contract ugt float %694, 5.000000e+00
  %700 = fcmp contract ult float %694, 4.000000e+00
  %701 = or i1 %699, %700
  br i1 %701, label %705, label %702

702:                                              ; preds = %698, %692
  %703 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 60
  %704 = atomicrmw add i32 addrspace(1)* %703, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %705

705:                                              ; preds = %702, %698
  %706 = fcmp contract ugt float %582, 4.000000e+00
  %707 = fcmp contract ult float %582, 3.000000e+00
  %708 = or i1 %706, %707
  br i1 %708, label %709, label %713

709:                                              ; preds = %705
  %710 = fcmp contract ugt float %694, 4.000000e+00
  %711 = fcmp contract ult float %694, 3.000000e+00
  %712 = or i1 %710, %711
  br i1 %712, label %716, label %713

713:                                              ; preds = %709, %705
  %714 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 61
  %715 = atomicrmw add i32 addrspace(1)* %714, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %716

716:                                              ; preds = %713, %709
  %717 = fcmp contract ugt float %582, 3.000000e+00
  %718 = fcmp contract ult float %582, 2.000000e+00
  %719 = or i1 %717, %718
  br i1 %719, label %720, label %724

720:                                              ; preds = %716
  %721 = fcmp contract ugt float %694, 3.000000e+00
  %722 = fcmp contract ult float %694, 2.000000e+00
  %723 = or i1 %721, %722
  br i1 %723, label %727, label %724

724:                                              ; preds = %720, %716
  %725 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 62
  %726 = atomicrmw add i32 addrspace(1)* %725, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %727

727:                                              ; preds = %724, %720
  %728 = fcmp contract ugt float %582, 2.000000e+00
  %729 = fcmp contract ult float %582, 1.000000e+00
  %730 = or i1 %728, %729
  br i1 %730, label %731, label %735

731:                                              ; preds = %727
  %732 = fcmp contract ugt float %694, 2.000000e+00
  %733 = fcmp contract ult float %694, 1.000000e+00
  %734 = or i1 %732, %733
  br i1 %734, label %738, label %735

735:                                              ; preds = %731, %727
  %736 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 63
  %737 = atomicrmw add i32 addrspace(1)* %736, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %738

738:                                              ; preds = %735, %731
  %739 = fcmp contract ugt float %582, 1.000000e+00
  %740 = fcmp contract ult float %582, 0.000000e+00
  %741 = or i1 %739, %740
  br i1 %741, label %742, label %746

742:                                              ; preds = %738
  %743 = fcmp contract ugt float %694, 1.000000e+00
  %744 = fcmp contract ult float %694, 0.000000e+00
  %745 = or i1 %743, %744
  br i1 %745, label %749, label %746

746:                                              ; preds = %742, %738
  %747 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 64
  %748 = atomicrmw add i32 addrspace(1)* %747, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %749

749:                                              ; preds = %746, %742
  %750 = fcmp contract ugt float %582, 0.000000e+00
  %751 = fcmp contract ult float %582, -1.000000e+00
  %752 = or i1 %750, %751
  br i1 %752, label %753, label %757

753:                                              ; preds = %749
  %754 = fcmp contract ugt float %694, 0.000000e+00
  %755 = fcmp contract ult float %694, -1.000000e+00
  %756 = or i1 %754, %755
  br i1 %756, label %760, label %757

757:                                              ; preds = %753, %749
  %758 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 65
  %759 = atomicrmw add i32 addrspace(1)* %758, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %760

760:                                              ; preds = %757, %753
  %761 = fcmp contract ugt float %582, -1.000000e+00
  %762 = fcmp contract ult float %582, -2.000000e+00
  %763 = or i1 %761, %762
  br i1 %763, label %764, label %768

764:                                              ; preds = %760
  %765 = fcmp contract ugt float %694, -1.000000e+00
  %766 = fcmp contract ult float %694, -2.000000e+00
  %767 = or i1 %765, %766
  br i1 %767, label %771, label %768

768:                                              ; preds = %764, %760
  %769 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 66
  %770 = atomicrmw add i32 addrspace(1)* %769, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %771

771:                                              ; preds = %768, %764
  %772 = fcmp contract ugt float %582, -2.000000e+00
  %773 = fcmp contract ult float %582, -3.000000e+00
  %774 = or i1 %772, %773
  br i1 %774, label %775, label %779

775:                                              ; preds = %771
  %776 = fcmp contract ugt float %694, -2.000000e+00
  %777 = fcmp contract ult float %694, -3.000000e+00
  %778 = or i1 %776, %777
  br i1 %778, label %782, label %779

779:                                              ; preds = %775, %771
  %780 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 67
  %781 = atomicrmw add i32 addrspace(1)* %780, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %782

782:                                              ; preds = %779, %775
  %783 = fcmp contract ugt float %582, -3.000000e+00
  %784 = fcmp contract ult float %582, -4.000000e+00
  %785 = or i1 %783, %784
  br i1 %785, label %786, label %790

786:                                              ; preds = %782
  %787 = fcmp contract ugt float %694, -3.000000e+00
  %788 = fcmp contract ult float %694, -4.000000e+00
  %789 = or i1 %787, %788
  br i1 %789, label %793, label %790

790:                                              ; preds = %786, %782
  %791 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 68
  %792 = atomicrmw add i32 addrspace(1)* %791, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %793

793:                                              ; preds = %790, %786
  %794 = fcmp contract ugt float %582, -4.000000e+00
  %795 = fcmp contract ult float %582, -5.000000e+00
  %796 = or i1 %794, %795
  br i1 %796, label %797, label %801

797:                                              ; preds = %793
  %798 = fcmp contract ugt float %694, -4.000000e+00
  %799 = fcmp contract ult float %694, -5.000000e+00
  %800 = or i1 %798, %799
  br i1 %800, label %804, label %801

801:                                              ; preds = %797, %793
  %802 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 69
  %803 = atomicrmw add i32 addrspace(1)* %802, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %804

804:                                              ; preds = %801, %797
  %805 = fmul contract float %16, 3.000000e+00
  %806 = fsub contract float %21, %805
  %807 = fcmp contract ugt float %694, 5.000000e+00
  %808 = fcmp contract ult float %694, 4.000000e+00
  %809 = or i1 %807, %808
  br i1 %809, label %810, label %814

810:                                              ; preds = %804
  %811 = fcmp contract ugt float %806, 5.000000e+00
  %812 = fcmp contract ult float %806, 4.000000e+00
  %813 = or i1 %811, %812
  br i1 %813, label %817, label %814

814:                                              ; preds = %810, %804
  %815 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 70
  %816 = atomicrmw add i32 addrspace(1)* %815, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %817

817:                                              ; preds = %814, %810
  %818 = fcmp contract ugt float %694, 4.000000e+00
  %819 = fcmp contract ult float %694, 3.000000e+00
  %820 = or i1 %818, %819
  br i1 %820, label %821, label %825

821:                                              ; preds = %817
  %822 = fcmp contract ugt float %806, 4.000000e+00
  %823 = fcmp contract ult float %806, 3.000000e+00
  %824 = or i1 %822, %823
  br i1 %824, label %828, label %825

825:                                              ; preds = %821, %817
  %826 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 71
  %827 = atomicrmw add i32 addrspace(1)* %826, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %828

828:                                              ; preds = %825, %821
  %829 = fcmp contract ugt float %694, 3.000000e+00
  %830 = fcmp contract ult float %694, 2.000000e+00
  %831 = or i1 %829, %830
  br i1 %831, label %832, label %836

832:                                              ; preds = %828
  %833 = fcmp contract ugt float %806, 3.000000e+00
  %834 = fcmp contract ult float %806, 2.000000e+00
  %835 = or i1 %833, %834
  br i1 %835, label %839, label %836

836:                                              ; preds = %832, %828
  %837 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 72
  %838 = atomicrmw add i32 addrspace(1)* %837, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %839

839:                                              ; preds = %836, %832
  %840 = fcmp contract ugt float %694, 2.000000e+00
  %841 = fcmp contract ult float %694, 1.000000e+00
  %842 = or i1 %840, %841
  br i1 %842, label %843, label %847

843:                                              ; preds = %839
  %844 = fcmp contract ugt float %806, 2.000000e+00
  %845 = fcmp contract ult float %806, 1.000000e+00
  %846 = or i1 %844, %845
  br i1 %846, label %850, label %847

847:                                              ; preds = %843, %839
  %848 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 73
  %849 = atomicrmw add i32 addrspace(1)* %848, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %850

850:                                              ; preds = %847, %843
  %851 = fcmp contract ugt float %694, 1.000000e+00
  %852 = fcmp contract ult float %694, 0.000000e+00
  %853 = or i1 %851, %852
  br i1 %853, label %854, label %858

854:                                              ; preds = %850
  %855 = fcmp contract ugt float %806, 1.000000e+00
  %856 = fcmp contract ult float %806, 0.000000e+00
  %857 = or i1 %855, %856
  br i1 %857, label %861, label %858

858:                                              ; preds = %854, %850
  %859 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 74
  %860 = atomicrmw add i32 addrspace(1)* %859, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %861

861:                                              ; preds = %858, %854
  %862 = fcmp contract ugt float %694, 0.000000e+00
  %863 = fcmp contract ult float %694, -1.000000e+00
  %864 = or i1 %862, %863
  br i1 %864, label %865, label %869

865:                                              ; preds = %861
  %866 = fcmp contract ugt float %806, 0.000000e+00
  %867 = fcmp contract ult float %806, -1.000000e+00
  %868 = or i1 %866, %867
  br i1 %868, label %872, label %869

869:                                              ; preds = %865, %861
  %870 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 75
  %871 = atomicrmw add i32 addrspace(1)* %870, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %872

872:                                              ; preds = %869, %865
  %873 = fcmp contract ugt float %694, -1.000000e+00
  %874 = fcmp contract ult float %694, -2.000000e+00
  %875 = or i1 %873, %874
  br i1 %875, label %876, label %880

876:                                              ; preds = %872
  %877 = fcmp contract ugt float %806, -1.000000e+00
  %878 = fcmp contract ult float %806, -2.000000e+00
  %879 = or i1 %877, %878
  br i1 %879, label %883, label %880

880:                                              ; preds = %876, %872
  %881 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 76
  %882 = atomicrmw add i32 addrspace(1)* %881, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %883

883:                                              ; preds = %880, %876
  %884 = fcmp contract ugt float %694, -2.000000e+00
  %885 = fcmp contract ult float %694, -3.000000e+00
  %886 = or i1 %884, %885
  br i1 %886, label %887, label %891

887:                                              ; preds = %883
  %888 = fcmp contract ugt float %806, -2.000000e+00
  %889 = fcmp contract ult float %806, -3.000000e+00
  %890 = or i1 %888, %889
  br i1 %890, label %894, label %891

891:                                              ; preds = %887, %883
  %892 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 77
  %893 = atomicrmw add i32 addrspace(1)* %892, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %894

894:                                              ; preds = %891, %887
  %895 = fcmp contract ugt float %694, -3.000000e+00
  %896 = fcmp contract ult float %694, -4.000000e+00
  %897 = or i1 %895, %896
  br i1 %897, label %898, label %902

898:                                              ; preds = %894
  %899 = fcmp contract ugt float %806, -3.000000e+00
  %900 = fcmp contract ult float %806, -4.000000e+00
  %901 = or i1 %899, %900
  br i1 %901, label %905, label %902

902:                                              ; preds = %898, %894
  %903 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 78
  %904 = atomicrmw add i32 addrspace(1)* %903, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %905

905:                                              ; preds = %902, %898
  %906 = fcmp contract ugt float %694, -4.000000e+00
  %907 = fcmp contract ult float %694, -5.000000e+00
  %908 = or i1 %906, %907
  br i1 %908, label %909, label %913

909:                                              ; preds = %905
  %910 = fcmp contract ugt float %806, -4.000000e+00
  %911 = fcmp contract ult float %806, -5.000000e+00
  %912 = or i1 %910, %911
  br i1 %912, label %916, label %913

913:                                              ; preds = %909, %905
  %914 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 79
  %915 = atomicrmw add i32 addrspace(1)* %914, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %916

916:                                              ; preds = %913, %909
  %917 = fmul contract float %16, 4.000000e+00
  %918 = fsub contract float %21, %917
  %919 = fcmp contract ugt float %806, 5.000000e+00
  %920 = fcmp contract ult float %806, 4.000000e+00
  %921 = or i1 %919, %920
  br i1 %921, label %922, label %926

922:                                              ; preds = %916
  %923 = fcmp contract ugt float %918, 5.000000e+00
  %924 = fcmp contract ult float %918, 4.000000e+00
  %925 = or i1 %923, %924
  br i1 %925, label %929, label %926

926:                                              ; preds = %922, %916
  %927 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 80
  %928 = atomicrmw add i32 addrspace(1)* %927, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %929

929:                                              ; preds = %926, %922
  %930 = fcmp contract ugt float %806, 4.000000e+00
  %931 = fcmp contract ult float %806, 3.000000e+00
  %932 = or i1 %930, %931
  br i1 %932, label %933, label %937

933:                                              ; preds = %929
  %934 = fcmp contract ugt float %918, 4.000000e+00
  %935 = fcmp contract ult float %918, 3.000000e+00
  %936 = or i1 %934, %935
  br i1 %936, label %940, label %937

937:                                              ; preds = %933, %929
  %938 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 81
  %939 = atomicrmw add i32 addrspace(1)* %938, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %940

940:                                              ; preds = %937, %933
  %941 = fcmp contract ugt float %806, 3.000000e+00
  %942 = fcmp contract ult float %806, 2.000000e+00
  %943 = or i1 %941, %942
  br i1 %943, label %944, label %948

944:                                              ; preds = %940
  %945 = fcmp contract ugt float %918, 3.000000e+00
  %946 = fcmp contract ult float %918, 2.000000e+00
  %947 = or i1 %945, %946
  br i1 %947, label %951, label %948

948:                                              ; preds = %944, %940
  %949 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 82
  %950 = atomicrmw add i32 addrspace(1)* %949, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %951

951:                                              ; preds = %948, %944
  %952 = fcmp contract ugt float %806, 2.000000e+00
  %953 = fcmp contract ult float %806, 1.000000e+00
  %954 = or i1 %952, %953
  br i1 %954, label %955, label %959

955:                                              ; preds = %951
  %956 = fcmp contract ugt float %918, 2.000000e+00
  %957 = fcmp contract ult float %918, 1.000000e+00
  %958 = or i1 %956, %957
  br i1 %958, label %962, label %959

959:                                              ; preds = %955, %951
  %960 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 83
  %961 = atomicrmw add i32 addrspace(1)* %960, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %962

962:                                              ; preds = %959, %955
  %963 = fcmp contract ugt float %806, 1.000000e+00
  %964 = fcmp contract ult float %806, 0.000000e+00
  %965 = or i1 %963, %964
  br i1 %965, label %966, label %970

966:                                              ; preds = %962
  %967 = fcmp contract ugt float %918, 1.000000e+00
  %968 = fcmp contract ult float %918, 0.000000e+00
  %969 = or i1 %967, %968
  br i1 %969, label %973, label %970

970:                                              ; preds = %966, %962
  %971 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 84
  %972 = atomicrmw add i32 addrspace(1)* %971, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %973

973:                                              ; preds = %970, %966
  %974 = fcmp contract ugt float %806, 0.000000e+00
  %975 = fcmp contract ult float %806, -1.000000e+00
  %976 = or i1 %974, %975
  br i1 %976, label %977, label %981

977:                                              ; preds = %973
  %978 = fcmp contract ugt float %918, 0.000000e+00
  %979 = fcmp contract ult float %918, -1.000000e+00
  %980 = or i1 %978, %979
  br i1 %980, label %984, label %981

981:                                              ; preds = %977, %973
  %982 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 85
  %983 = atomicrmw add i32 addrspace(1)* %982, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %984

984:                                              ; preds = %981, %977
  %985 = fcmp contract ugt float %806, -1.000000e+00
  %986 = fcmp contract ult float %806, -2.000000e+00
  %987 = or i1 %985, %986
  br i1 %987, label %988, label %992

988:                                              ; preds = %984
  %989 = fcmp contract ugt float %918, -1.000000e+00
  %990 = fcmp contract ult float %918, -2.000000e+00
  %991 = or i1 %989, %990
  br i1 %991, label %995, label %992

992:                                              ; preds = %988, %984
  %993 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 86
  %994 = atomicrmw add i32 addrspace(1)* %993, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %995

995:                                              ; preds = %992, %988
  %996 = fcmp contract ugt float %806, -2.000000e+00
  %997 = fcmp contract ult float %806, -3.000000e+00
  %998 = or i1 %996, %997
  br i1 %998, label %999, label %1003

999:                                              ; preds = %995
  %1000 = fcmp contract ugt float %918, -2.000000e+00
  %1001 = fcmp contract ult float %918, -3.000000e+00
  %1002 = or i1 %1000, %1001
  br i1 %1002, label %1006, label %1003

1003:                                             ; preds = %999, %995
  %1004 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 87
  %1005 = atomicrmw add i32 addrspace(1)* %1004, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1006

1006:                                             ; preds = %1003, %999
  %1007 = fcmp contract ugt float %806, -3.000000e+00
  %1008 = fcmp contract ult float %806, -4.000000e+00
  %1009 = or i1 %1007, %1008
  br i1 %1009, label %1010, label %1014

1010:                                             ; preds = %1006
  %1011 = fcmp contract ugt float %918, -3.000000e+00
  %1012 = fcmp contract ult float %918, -4.000000e+00
  %1013 = or i1 %1011, %1012
  br i1 %1013, label %1017, label %1014

1014:                                             ; preds = %1010, %1006
  %1015 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 88
  %1016 = atomicrmw add i32 addrspace(1)* %1015, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1017

1017:                                             ; preds = %1014, %1010
  %1018 = fcmp contract ugt float %806, -4.000000e+00
  %1019 = fcmp contract ult float %806, -5.000000e+00
  %1020 = or i1 %1018, %1019
  br i1 %1020, label %1021, label %1025

1021:                                             ; preds = %1017
  %1022 = fcmp contract ugt float %918, -4.000000e+00
  %1023 = fcmp contract ult float %918, -5.000000e+00
  %1024 = or i1 %1022, %1023
  br i1 %1024, label %1028, label %1025

1025:                                             ; preds = %1021, %1017
  %1026 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 89
  %1027 = atomicrmw add i32 addrspace(1)* %1026, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1028

1028:                                             ; preds = %1025, %1021
  %1029 = fmul contract float %16, 5.000000e+00
  %1030 = fsub contract float %21, %1029
  %1031 = fcmp contract ugt float %918, 5.000000e+00
  %1032 = fcmp contract ult float %918, 4.000000e+00
  %1033 = or i1 %1031, %1032
  br i1 %1033, label %1034, label %1038

1034:                                             ; preds = %1028
  %1035 = fcmp contract ugt float %1030, 5.000000e+00
  %1036 = fcmp contract ult float %1030, 4.000000e+00
  %1037 = or i1 %1035, %1036
  br i1 %1037, label %1041, label %1038

1038:                                             ; preds = %1034, %1028
  %1039 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 90
  %1040 = atomicrmw add i32 addrspace(1)* %1039, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1041

1041:                                             ; preds = %1038, %1034
  %1042 = fcmp contract ugt float %918, 4.000000e+00
  %1043 = fcmp contract ult float %918, 3.000000e+00
  %1044 = or i1 %1042, %1043
  br i1 %1044, label %1045, label %1049

1045:                                             ; preds = %1041
  %1046 = fcmp contract ugt float %1030, 4.000000e+00
  %1047 = fcmp contract ult float %1030, 3.000000e+00
  %1048 = or i1 %1046, %1047
  br i1 %1048, label %1052, label %1049

1049:                                             ; preds = %1045, %1041
  %1050 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 91
  %1051 = atomicrmw add i32 addrspace(1)* %1050, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1052

1052:                                             ; preds = %1049, %1045
  %1053 = fcmp contract ugt float %918, 3.000000e+00
  %1054 = fcmp contract ult float %918, 2.000000e+00
  %1055 = or i1 %1053, %1054
  br i1 %1055, label %1056, label %1060

1056:                                             ; preds = %1052
  %1057 = fcmp contract ugt float %1030, 3.000000e+00
  %1058 = fcmp contract ult float %1030, 2.000000e+00
  %1059 = or i1 %1057, %1058
  br i1 %1059, label %1063, label %1060

1060:                                             ; preds = %1056, %1052
  %1061 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 92
  %1062 = atomicrmw add i32 addrspace(1)* %1061, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1063

1063:                                             ; preds = %1060, %1056
  %1064 = fcmp contract ugt float %918, 2.000000e+00
  %1065 = fcmp contract ult float %918, 1.000000e+00
  %1066 = or i1 %1064, %1065
  br i1 %1066, label %1067, label %1071

1067:                                             ; preds = %1063
  %1068 = fcmp contract ugt float %1030, 2.000000e+00
  %1069 = fcmp contract ult float %1030, 1.000000e+00
  %1070 = or i1 %1068, %1069
  br i1 %1070, label %1074, label %1071

1071:                                             ; preds = %1067, %1063
  %1072 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 93
  %1073 = atomicrmw add i32 addrspace(1)* %1072, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1074

1074:                                             ; preds = %1071, %1067
  %1075 = fcmp contract ugt float %918, 1.000000e+00
  %1076 = fcmp contract ult float %918, 0.000000e+00
  %1077 = or i1 %1075, %1076
  br i1 %1077, label %1078, label %1082

1078:                                             ; preds = %1074
  %1079 = fcmp contract ugt float %1030, 1.000000e+00
  %1080 = fcmp contract ult float %1030, 0.000000e+00
  %1081 = or i1 %1079, %1080
  br i1 %1081, label %1085, label %1082

1082:                                             ; preds = %1078, %1074
  %1083 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 94
  %1084 = atomicrmw add i32 addrspace(1)* %1083, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1085

1085:                                             ; preds = %1082, %1078
  %1086 = fcmp contract ugt float %918, 0.000000e+00
  %1087 = fcmp contract ult float %918, -1.000000e+00
  %1088 = or i1 %1086, %1087
  br i1 %1088, label %1089, label %1093

1089:                                             ; preds = %1085
  %1090 = fcmp contract ugt float %1030, 0.000000e+00
  %1091 = fcmp contract ult float %1030, -1.000000e+00
  %1092 = or i1 %1090, %1091
  br i1 %1092, label %1096, label %1093

1093:                                             ; preds = %1089, %1085
  %1094 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 95
  %1095 = atomicrmw add i32 addrspace(1)* %1094, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1096

1096:                                             ; preds = %1093, %1089
  %1097 = fcmp contract ugt float %918, -1.000000e+00
  %1098 = fcmp contract ult float %918, -2.000000e+00
  %1099 = or i1 %1097, %1098
  br i1 %1099, label %1100, label %1104

1100:                                             ; preds = %1096
  %1101 = fcmp contract ugt float %1030, -1.000000e+00
  %1102 = fcmp contract ult float %1030, -2.000000e+00
  %1103 = or i1 %1101, %1102
  br i1 %1103, label %1107, label %1104

1104:                                             ; preds = %1100, %1096
  %1105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 96
  %1106 = atomicrmw add i32 addrspace(1)* %1105, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1107

1107:                                             ; preds = %1104, %1100
  %1108 = fcmp contract ugt float %918, -2.000000e+00
  %1109 = fcmp contract ult float %918, -3.000000e+00
  %1110 = or i1 %1108, %1109
  br i1 %1110, label %1111, label %1115

1111:                                             ; preds = %1107
  %1112 = fcmp contract ugt float %1030, -2.000000e+00
  %1113 = fcmp contract ult float %1030, -3.000000e+00
  %1114 = or i1 %1112, %1113
  br i1 %1114, label %1118, label %1115

1115:                                             ; preds = %1111, %1107
  %1116 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 97
  %1117 = atomicrmw add i32 addrspace(1)* %1116, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1118

1118:                                             ; preds = %1115, %1111
  %1119 = fcmp contract ugt float %918, -3.000000e+00
  %1120 = fcmp contract ult float %918, -4.000000e+00
  %1121 = or i1 %1119, %1120
  br i1 %1121, label %1122, label %1126

1122:                                             ; preds = %1118
  %1123 = fcmp contract ugt float %1030, -3.000000e+00
  %1124 = fcmp contract ult float %1030, -4.000000e+00
  %1125 = or i1 %1123, %1124
  br i1 %1125, label %1129, label %1126

1126:                                             ; preds = %1122, %1118
  %1127 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 98
  %1128 = atomicrmw add i32 addrspace(1)* %1127, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1129

1129:                                             ; preds = %1126, %1122
  %1130 = fcmp contract ugt float %918, -4.000000e+00
  %1131 = fcmp contract ult float %918, -5.000000e+00
  %1132 = or i1 %1130, %1131
  br i1 %1132, label %1133, label %1137

1133:                                             ; preds = %1129
  %1134 = fcmp contract ugt float %1030, -4.000000e+00
  %1135 = fcmp contract ult float %1030, -5.000000e+00
  %1136 = or i1 %1134, %1135
  br i1 %1136, label %1140, label %1137

1137:                                             ; preds = %1133, %1129
  %1138 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 99
  %1139 = atomicrmw add i32 addrspace(1)* %1138, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %1140

1140:                                             ; preds = %1137, %1133
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
