; ModuleID = '../data/hip_kernels/8459/15/main.cu'
source_filename = "../data/hip_kernels/8459/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10FindMinMaxPfS_iiiE7minvals = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZ10FindMinMaxPfS_iiiE7maxvals = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10FindMinMaxPfS_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 7
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !7
  %20 = mul nsw i32 %11, %3
  %21 = add nsw i32 %20, %9
  %22 = icmp slt i32 %9, %2
  %23 = select i1 %22, i32 %21, i32 %20
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !16
  %27 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiiE7minvals, i32 0, i32 %6
  store float %26, float addrspace(3)* %27, align 4
  %28 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiiE7maxvals, i32 0, i32 %6
  store float %26, float addrspace(3)* %28, align 4
  %29 = icmp slt i32 %6, %2
  %30 = add nsw i32 %21, %3
  br i1 %29, label %31, label %41

31:                                               ; preds = %5
  %32 = sext i32 %30 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !6
  %35 = fcmp contract olt float %34, %26
  br i1 %35, label %36, label %37

36:                                               ; preds = %31
  store float %34, float addrspace(3)* %27, align 4, !tbaa !16
  br label %37

37:                                               ; preds = %36, %31
  %38 = phi float [ %34, %36 ], [ %26, %31 ]
  %39 = fcmp contract ogt float %34, %26
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  store float %34, float addrspace(3)* %28, align 4, !tbaa !16
  br label %41

41:                                               ; preds = %37, %40, %5
  %42 = phi float [ %26, %37 ], [ %34, %40 ], [ %26, %5 ]
  %43 = phi float [ %38, %37 ], [ %38, %40 ], [ %26, %5 ]
  %44 = add nsw i32 %30, %3
  br i1 %29, label %45, label %55

45:                                               ; preds = %41
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !6
  %49 = fcmp contract olt float %48, %43
  br i1 %49, label %50, label %51

50:                                               ; preds = %45
  store float %48, float addrspace(3)* %27, align 4, !tbaa !16
  br label %51

51:                                               ; preds = %50, %45
  %52 = phi float [ %48, %50 ], [ %43, %45 ]
  %53 = fcmp contract ogt float %48, %42
  br i1 %53, label %54, label %55

54:                                               ; preds = %51
  store float %48, float addrspace(3)* %28, align 4, !tbaa !16
  br label %55

55:                                               ; preds = %54, %51, %41
  %56 = phi float [ %48, %54 ], [ %42, %51 ], [ %42, %41 ]
  %57 = phi float [ %52, %54 ], [ %52, %51 ], [ %43, %41 ]
  %58 = add nsw i32 %44, %3
  br i1 %29, label %59, label %69

59:                                               ; preds = %55
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !6
  %63 = fcmp contract olt float %62, %57
  br i1 %63, label %64, label %65

64:                                               ; preds = %59
  store float %62, float addrspace(3)* %27, align 4, !tbaa !16
  br label %65

65:                                               ; preds = %64, %59
  %66 = phi float [ %62, %64 ], [ %57, %59 ]
  %67 = fcmp contract ogt float %62, %56
  br i1 %67, label %68, label %69

68:                                               ; preds = %65
  store float %62, float addrspace(3)* %28, align 4, !tbaa !16
  br label %69

69:                                               ; preds = %68, %65, %55
  %70 = phi float [ %62, %68 ], [ %56, %65 ], [ %56, %55 ]
  %71 = phi float [ %66, %68 ], [ %66, %65 ], [ %57, %55 ]
  %72 = add nsw i32 %58, %3
  br i1 %29, label %73, label %83

73:                                               ; preds = %69
  %74 = sext i32 %72 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !6
  %77 = fcmp contract olt float %76, %71
  br i1 %77, label %78, label %79

78:                                               ; preds = %73
  store float %76, float addrspace(3)* %27, align 4, !tbaa !16
  br label %79

79:                                               ; preds = %78, %73
  %80 = phi float [ %76, %78 ], [ %71, %73 ]
  %81 = fcmp contract ogt float %76, %70
  br i1 %81, label %82, label %83

82:                                               ; preds = %79
  store float %76, float addrspace(3)* %28, align 4, !tbaa !16
  br label %83

83:                                               ; preds = %82, %79, %69
  %84 = phi float [ %76, %82 ], [ %70, %79 ], [ %70, %69 ]
  %85 = phi float [ %80, %82 ], [ %80, %79 ], [ %71, %69 ]
  %86 = add nsw i32 %72, %3
  br i1 %29, label %87, label %97

87:                                               ; preds = %83
  %88 = sext i32 %86 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !6
  %91 = fcmp contract olt float %90, %85
  br i1 %91, label %92, label %93

92:                                               ; preds = %87
  store float %90, float addrspace(3)* %27, align 4, !tbaa !16
  br label %93

93:                                               ; preds = %92, %87
  %94 = phi float [ %90, %92 ], [ %85, %87 ]
  %95 = fcmp contract ogt float %90, %84
  br i1 %95, label %96, label %97

96:                                               ; preds = %93
  store float %90, float addrspace(3)* %28, align 4, !tbaa !16
  br label %97

97:                                               ; preds = %96, %93, %83
  %98 = phi float [ %90, %96 ], [ %84, %93 ], [ %84, %83 ]
  %99 = phi float [ %94, %96 ], [ %94, %93 ], [ %85, %83 ]
  %100 = add nsw i32 %86, %3
  br i1 %29, label %101, label %111

101:                                              ; preds = %97
  %102 = sext i32 %100 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16, !amdgpu.noclobber !6
  %105 = fcmp contract olt float %104, %99
  br i1 %105, label %106, label %107

106:                                              ; preds = %101
  store float %104, float addrspace(3)* %27, align 4, !tbaa !16
  br label %107

107:                                              ; preds = %106, %101
  %108 = phi float [ %104, %106 ], [ %99, %101 ]
  %109 = fcmp contract ogt float %104, %98
  br i1 %109, label %110, label %111

110:                                              ; preds = %107
  store float %104, float addrspace(3)* %28, align 4, !tbaa !16
  br label %111

111:                                              ; preds = %110, %107, %97
  %112 = phi float [ %104, %110 ], [ %98, %107 ], [ %98, %97 ]
  %113 = phi float [ %108, %110 ], [ %108, %107 ], [ %99, %97 ]
  %114 = add nsw i32 %100, %3
  br i1 %29, label %115, label %125

115:                                              ; preds = %111
  %116 = sext i32 %114 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !16, !amdgpu.noclobber !6
  %119 = fcmp contract olt float %118, %113
  br i1 %119, label %120, label %121

120:                                              ; preds = %115
  store float %118, float addrspace(3)* %27, align 4, !tbaa !16
  br label %121

121:                                              ; preds = %120, %115
  %122 = phi float [ %118, %120 ], [ %113, %115 ]
  %123 = fcmp contract ogt float %118, %112
  br i1 %123, label %124, label %125

124:                                              ; preds = %121
  store float %118, float addrspace(3)* %28, align 4, !tbaa !16
  br label %125

125:                                              ; preds = %124, %121, %111
  %126 = phi float [ %118, %124 ], [ %112, %121 ], [ %112, %111 ]
  %127 = phi float [ %122, %124 ], [ %122, %121 ], [ %113, %111 ]
  %128 = add nsw i32 %114, %3
  br i1 %29, label %129, label %139

129:                                              ; preds = %125
  %130 = sext i32 %128 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16, !amdgpu.noclobber !6
  %133 = fcmp contract olt float %132, %127
  br i1 %133, label %134, label %135

134:                                              ; preds = %129
  store float %132, float addrspace(3)* %27, align 4, !tbaa !16
  br label %135

135:                                              ; preds = %134, %129
  %136 = phi float [ %132, %134 ], [ %127, %129 ]
  %137 = fcmp contract ogt float %132, %126
  br i1 %137, label %138, label %139

138:                                              ; preds = %135
  store float %132, float addrspace(3)* %28, align 4, !tbaa !16
  br label %139

139:                                              ; preds = %138, %135, %125
  %140 = phi float [ %132, %138 ], [ %126, %135 ], [ %126, %125 ]
  %141 = phi float [ %136, %138 ], [ %136, %135 ], [ %127, %125 ]
  %142 = add nsw i32 %128, %3
  br i1 %29, label %143, label %153

143:                                              ; preds = %139
  %144 = sext i32 %142 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16, !amdgpu.noclobber !6
  %147 = fcmp contract olt float %146, %141
  br i1 %147, label %148, label %149

148:                                              ; preds = %143
  store float %146, float addrspace(3)* %27, align 4, !tbaa !16
  br label %149

149:                                              ; preds = %148, %143
  %150 = phi float [ %146, %148 ], [ %141, %143 ]
  %151 = fcmp contract ogt float %146, %140
  br i1 %151, label %152, label %153

152:                                              ; preds = %149
  store float %146, float addrspace(3)* %28, align 4, !tbaa !16
  br label %153

153:                                              ; preds = %152, %149, %139
  %154 = phi float [ %146, %152 ], [ %140, %149 ], [ %140, %139 ]
  %155 = phi float [ %150, %152 ], [ %150, %149 ], [ %141, %139 ]
  %156 = add nsw i32 %142, %3
  br i1 %29, label %157, label %167

157:                                              ; preds = %153
  %158 = sext i32 %156 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !16, !amdgpu.noclobber !6
  %161 = fcmp contract olt float %160, %155
  br i1 %161, label %162, label %163

162:                                              ; preds = %157
  store float %160, float addrspace(3)* %27, align 4, !tbaa !16
  br label %163

163:                                              ; preds = %162, %157
  %164 = phi float [ %160, %162 ], [ %155, %157 ]
  %165 = fcmp contract ogt float %160, %154
  br i1 %165, label %166, label %167

166:                                              ; preds = %163
  store float %160, float addrspace(3)* %28, align 4, !tbaa !16
  br label %167

167:                                              ; preds = %166, %163, %153
  %168 = phi float [ %160, %166 ], [ %154, %163 ], [ %154, %153 ]
  %169 = phi float [ %164, %166 ], [ %164, %163 ], [ %155, %153 ]
  %170 = add nsw i32 %156, %3
  br i1 %29, label %171, label %181

171:                                              ; preds = %167
  %172 = sext i32 %170 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16, !amdgpu.noclobber !6
  %175 = fcmp contract olt float %174, %169
  br i1 %175, label %176, label %177

176:                                              ; preds = %171
  store float %174, float addrspace(3)* %27, align 4, !tbaa !16
  br label %177

177:                                              ; preds = %176, %171
  %178 = phi float [ %174, %176 ], [ %169, %171 ]
  %179 = fcmp contract ogt float %174, %168
  br i1 %179, label %180, label %181

180:                                              ; preds = %177
  store float %174, float addrspace(3)* %28, align 4, !tbaa !16
  br label %181

181:                                              ; preds = %180, %177, %167
  %182 = phi float [ %174, %180 ], [ %168, %177 ], [ %168, %167 ]
  %183 = phi float [ %178, %180 ], [ %178, %177 ], [ %169, %167 ]
  %184 = add nsw i32 %170, %3
  br i1 %29, label %185, label %195

185:                                              ; preds = %181
  %186 = sext i32 %184 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %1, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !16, !amdgpu.noclobber !6
  %189 = fcmp contract olt float %188, %183
  br i1 %189, label %190, label %191

190:                                              ; preds = %185
  store float %188, float addrspace(3)* %27, align 4, !tbaa !16
  br label %191

191:                                              ; preds = %190, %185
  %192 = phi float [ %188, %190 ], [ %183, %185 ]
  %193 = fcmp contract ogt float %188, %182
  br i1 %193, label %194, label %195

194:                                              ; preds = %191
  store float %188, float addrspace(3)* %28, align 4, !tbaa !16
  br label %195

195:                                              ; preds = %194, %191, %181
  %196 = phi float [ %188, %194 ], [ %182, %191 ], [ %182, %181 ]
  %197 = phi float [ %192, %194 ], [ %192, %191 ], [ %183, %181 ]
  %198 = add nsw i32 %184, %3
  br i1 %29, label %199, label %209

199:                                              ; preds = %195
  %200 = sext i32 %198 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %1, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !16, !amdgpu.noclobber !6
  %203 = fcmp contract olt float %202, %197
  br i1 %203, label %204, label %205

204:                                              ; preds = %199
  store float %202, float addrspace(3)* %27, align 4, !tbaa !16
  br label %205

205:                                              ; preds = %204, %199
  %206 = phi float [ %202, %204 ], [ %197, %199 ]
  %207 = fcmp contract ogt float %202, %196
  br i1 %207, label %208, label %209

208:                                              ; preds = %205
  store float %202, float addrspace(3)* %28, align 4, !tbaa !16
  br label %209

209:                                              ; preds = %208, %205, %195
  %210 = phi float [ %202, %208 ], [ %196, %205 ], [ %196, %195 ]
  %211 = phi float [ %206, %208 ], [ %206, %205 ], [ %197, %195 ]
  %212 = add nsw i32 %198, %3
  br i1 %29, label %213, label %223

213:                                              ; preds = %209
  %214 = sext i32 %212 to i64
  %215 = getelementptr inbounds float, float addrspace(1)* %1, i64 %214
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !16, !amdgpu.noclobber !6
  %217 = fcmp contract olt float %216, %211
  br i1 %217, label %218, label %219

218:                                              ; preds = %213
  store float %216, float addrspace(3)* %27, align 4, !tbaa !16
  br label %219

219:                                              ; preds = %218, %213
  %220 = phi float [ %216, %218 ], [ %211, %213 ]
  %221 = fcmp contract ogt float %216, %210
  br i1 %221, label %222, label %223

222:                                              ; preds = %219
  store float %216, float addrspace(3)* %28, align 4, !tbaa !16
  br label %223

223:                                              ; preds = %222, %219, %209
  %224 = phi float [ %216, %222 ], [ %210, %219 ], [ %210, %209 ]
  %225 = phi float [ %220, %222 ], [ %220, %219 ], [ %211, %209 ]
  br i1 %29, label %226, label %236

226:                                              ; preds = %223
  %227 = add nsw i32 %212, %3
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %1, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !16, !amdgpu.noclobber !6
  %231 = fcmp contract olt float %230, %225
  br i1 %231, label %232, label %233

232:                                              ; preds = %226
  store float %230, float addrspace(3)* %27, align 4, !tbaa !16
  br label %233

233:                                              ; preds = %232, %226
  %234 = fcmp contract ogt float %230, %224
  br i1 %234, label %235, label %236

235:                                              ; preds = %233
  store float %230, float addrspace(3)* %28, align 4, !tbaa !16
  br label %236

236:                                              ; preds = %235, %233, %223
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %237 = icmp ugt i16 %15, 1
  br i1 %237, label %240, label %238

238:                                              ; preds = %258, %236
  %239 = icmp eq i32 %6, 0
  br i1 %239, label %263, label %279

240:                                              ; preds = %236, %258
  %241 = phi i32 [ %261, %258 ], [ 1, %236 ]
  %242 = phi i32 [ %260, %258 ], [ 1, %236 ]
  %243 = and i32 %242, %6
  %244 = icmp eq i32 %243, 0
  br i1 %244, label %245, label %258

245:                                              ; preds = %240
  %246 = add nsw i32 %241, %6
  %247 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiiE7minvals, i32 0, i32 %246
  %248 = load float, float addrspace(3)* %247, align 4, !tbaa !16
  %249 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %250 = fcmp contract olt float %248, %249
  br i1 %250, label %251, label %252

251:                                              ; preds = %245
  store float %248, float addrspace(3)* %27, align 4, !tbaa !16
  br label %252

252:                                              ; preds = %251, %245
  %253 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiiE7maxvals, i32 0, i32 %246
  %254 = load float, float addrspace(3)* %253, align 4, !tbaa !16
  %255 = load float, float addrspace(3)* %28, align 4, !tbaa !16
  %256 = fcmp contract ogt float %254, %255
  br i1 %256, label %257, label %258

257:                                              ; preds = %252
  store float %254, float addrspace(3)* %28, align 4, !tbaa !16
  br label %258

258:                                              ; preds = %252, %257, %240
  %259 = shl nsw i32 %242, 1
  %260 = add nuw nsw i32 %259, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %261 = shl i32 %241, 1
  %262 = icmp slt i32 %261, %16
  br i1 %262, label %240, label %238, !llvm.loop !20

263:                                              ; preds = %238
  %264 = udiv i32 %19, %16
  %265 = mul i32 %264, %16
  %266 = icmp ugt i32 %19, %265
  %267 = zext i1 %266 to i32
  %268 = add i32 %264, %267
  %269 = mul i32 %268, %10
  %270 = add i32 %269, %7
  %271 = shl i32 %270, 1
  %272 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiiE7minvals, i32 0, i32 0), align 16, !tbaa !16
  %273 = sext i32 %271 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %0, i64 %273
  store float %272, float addrspace(1)* %274, align 4, !tbaa !16
  %275 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiiE7maxvals, i32 0, i32 0), align 16, !tbaa !16
  %276 = add nuw nsw i32 %271, 1
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %0, i64 %277
  store float %275, float addrspace(1)* %278, align 4, !tbaa !16
  br label %279

279:                                              ; preds = %263, %238
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
