; ModuleID = '../data/hip_kernels/12192/25/main.cu'
source_filename = "../data/hip_kernels/12192/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10FindMinMaxPfS_iiE7minvals = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZ10FindMinMaxPfS_iiE7maxvals = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10FindMinMaxPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 8
  %8 = ashr exact i32 %7, 1
  %9 = add nsw i32 %8, %5
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 8
  %12 = ashr exact i32 %11, 8
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = shl i32 %10, 12
  %22 = ashr exact i32 %21, 8
  %23 = shl i32 %2, 8
  %24 = ashr exact i32 %23, 8
  %25 = mul nsw i32 %24, %22
  %26 = add nsw i32 %25, %9
  %27 = icmp slt i32 %9, %2
  %28 = select i1 %27, i32 %26, i32 %25
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16
  %32 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiE7minvals, i32 0, i32 %5
  store float %31, float addrspace(3)* %32, align 4
  %33 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiE7maxvals, i32 0, i32 %5
  store float %31, float addrspace(3)* %33, align 4
  %34 = icmp slt i32 %5, %2
  %35 = add nsw i32 %26, %2
  br i1 %34, label %36, label %46

36:                                               ; preds = %4
  %37 = sext i32 %35 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !6
  %40 = fcmp contract olt float %39, %31
  br i1 %40, label %41, label %42

41:                                               ; preds = %36
  store float %39, float addrspace(3)* %32, align 4, !tbaa !16
  br label %42

42:                                               ; preds = %41, %36
  %43 = phi float [ %39, %41 ], [ %31, %36 ]
  %44 = fcmp contract ogt float %39, %31
  br i1 %44, label %45, label %46

45:                                               ; preds = %42
  store float %39, float addrspace(3)* %33, align 4, !tbaa !16
  br label %46

46:                                               ; preds = %42, %45, %4
  %47 = phi float [ %31, %42 ], [ %39, %45 ], [ %31, %4 ]
  %48 = phi float [ %43, %42 ], [ %43, %45 ], [ %31, %4 ]
  %49 = add nsw i32 %35, %2
  br i1 %34, label %50, label %60

50:                                               ; preds = %46
  %51 = sext i32 %49 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !6
  %54 = fcmp contract olt float %53, %48
  br i1 %54, label %55, label %56

55:                                               ; preds = %50
  store float %53, float addrspace(3)* %32, align 4, !tbaa !16
  br label %56

56:                                               ; preds = %55, %50
  %57 = phi float [ %53, %55 ], [ %48, %50 ]
  %58 = fcmp contract ogt float %53, %47
  br i1 %58, label %59, label %60

59:                                               ; preds = %56
  store float %53, float addrspace(3)* %33, align 4, !tbaa !16
  br label %60

60:                                               ; preds = %59, %56, %46
  %61 = phi float [ %53, %59 ], [ %47, %56 ], [ %47, %46 ]
  %62 = phi float [ %57, %59 ], [ %57, %56 ], [ %48, %46 ]
  %63 = add nsw i32 %49, %2
  br i1 %34, label %64, label %74

64:                                               ; preds = %60
  %65 = sext i32 %63 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16, !amdgpu.noclobber !6
  %68 = fcmp contract olt float %67, %62
  br i1 %68, label %69, label %70

69:                                               ; preds = %64
  store float %67, float addrspace(3)* %32, align 4, !tbaa !16
  br label %70

70:                                               ; preds = %69, %64
  %71 = phi float [ %67, %69 ], [ %62, %64 ]
  %72 = fcmp contract ogt float %67, %61
  br i1 %72, label %73, label %74

73:                                               ; preds = %70
  store float %67, float addrspace(3)* %33, align 4, !tbaa !16
  br label %74

74:                                               ; preds = %73, %70, %60
  %75 = phi float [ %67, %73 ], [ %61, %70 ], [ %61, %60 ]
  %76 = phi float [ %71, %73 ], [ %71, %70 ], [ %62, %60 ]
  %77 = add nsw i32 %63, %2
  br i1 %34, label %78, label %88

78:                                               ; preds = %74
  %79 = sext i32 %77 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16, !amdgpu.noclobber !6
  %82 = fcmp contract olt float %81, %76
  br i1 %82, label %83, label %84

83:                                               ; preds = %78
  store float %81, float addrspace(3)* %32, align 4, !tbaa !16
  br label %84

84:                                               ; preds = %83, %78
  %85 = phi float [ %81, %83 ], [ %76, %78 ]
  %86 = fcmp contract ogt float %81, %75
  br i1 %86, label %87, label %88

87:                                               ; preds = %84
  store float %81, float addrspace(3)* %33, align 4, !tbaa !16
  br label %88

88:                                               ; preds = %87, %84, %74
  %89 = phi float [ %81, %87 ], [ %75, %84 ], [ %75, %74 ]
  %90 = phi float [ %85, %87 ], [ %85, %84 ], [ %76, %74 ]
  %91 = add nsw i32 %77, %2
  br i1 %34, label %92, label %102

92:                                               ; preds = %88
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16, !amdgpu.noclobber !6
  %96 = fcmp contract olt float %95, %90
  br i1 %96, label %97, label %98

97:                                               ; preds = %92
  store float %95, float addrspace(3)* %32, align 4, !tbaa !16
  br label %98

98:                                               ; preds = %97, %92
  %99 = phi float [ %95, %97 ], [ %90, %92 ]
  %100 = fcmp contract ogt float %95, %89
  br i1 %100, label %101, label %102

101:                                              ; preds = %98
  store float %95, float addrspace(3)* %33, align 4, !tbaa !16
  br label %102

102:                                              ; preds = %101, %98, %88
  %103 = phi float [ %95, %101 ], [ %89, %98 ], [ %89, %88 ]
  %104 = phi float [ %99, %101 ], [ %99, %98 ], [ %90, %88 ]
  %105 = add nsw i32 %91, %2
  br i1 %34, label %106, label %116

106:                                              ; preds = %102
  %107 = sext i32 %105 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16, !amdgpu.noclobber !6
  %110 = fcmp contract olt float %109, %104
  br i1 %110, label %111, label %112

111:                                              ; preds = %106
  store float %109, float addrspace(3)* %32, align 4, !tbaa !16
  br label %112

112:                                              ; preds = %111, %106
  %113 = phi float [ %109, %111 ], [ %104, %106 ]
  %114 = fcmp contract ogt float %109, %103
  br i1 %114, label %115, label %116

115:                                              ; preds = %112
  store float %109, float addrspace(3)* %33, align 4, !tbaa !16
  br label %116

116:                                              ; preds = %115, %112, %102
  %117 = phi float [ %109, %115 ], [ %103, %112 ], [ %103, %102 ]
  %118 = phi float [ %113, %115 ], [ %113, %112 ], [ %104, %102 ]
  %119 = add nsw i32 %105, %2
  br i1 %34, label %120, label %130

120:                                              ; preds = %116
  %121 = sext i32 %119 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16, !amdgpu.noclobber !6
  %124 = fcmp contract olt float %123, %118
  br i1 %124, label %125, label %126

125:                                              ; preds = %120
  store float %123, float addrspace(3)* %32, align 4, !tbaa !16
  br label %126

126:                                              ; preds = %125, %120
  %127 = phi float [ %123, %125 ], [ %118, %120 ]
  %128 = fcmp contract ogt float %123, %117
  br i1 %128, label %129, label %130

129:                                              ; preds = %126
  store float %123, float addrspace(3)* %33, align 4, !tbaa !16
  br label %130

130:                                              ; preds = %129, %126, %116
  %131 = phi float [ %123, %129 ], [ %117, %126 ], [ %117, %116 ]
  %132 = phi float [ %127, %129 ], [ %127, %126 ], [ %118, %116 ]
  %133 = add nsw i32 %119, %2
  br i1 %34, label %134, label %144

134:                                              ; preds = %130
  %135 = sext i32 %133 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !16, !amdgpu.noclobber !6
  %138 = fcmp contract olt float %137, %132
  br i1 %138, label %139, label %140

139:                                              ; preds = %134
  store float %137, float addrspace(3)* %32, align 4, !tbaa !16
  br label %140

140:                                              ; preds = %139, %134
  %141 = phi float [ %137, %139 ], [ %132, %134 ]
  %142 = fcmp contract ogt float %137, %131
  br i1 %142, label %143, label %144

143:                                              ; preds = %140
  store float %137, float addrspace(3)* %33, align 4, !tbaa !16
  br label %144

144:                                              ; preds = %143, %140, %130
  %145 = phi float [ %137, %143 ], [ %131, %140 ], [ %131, %130 ]
  %146 = phi float [ %141, %143 ], [ %141, %140 ], [ %132, %130 ]
  %147 = add nsw i32 %133, %2
  br i1 %34, label %148, label %158

148:                                              ; preds = %144
  %149 = sext i32 %147 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !16, !amdgpu.noclobber !6
  %152 = fcmp contract olt float %151, %146
  br i1 %152, label %153, label %154

153:                                              ; preds = %148
  store float %151, float addrspace(3)* %32, align 4, !tbaa !16
  br label %154

154:                                              ; preds = %153, %148
  %155 = phi float [ %151, %153 ], [ %146, %148 ]
  %156 = fcmp contract ogt float %151, %145
  br i1 %156, label %157, label %158

157:                                              ; preds = %154
  store float %151, float addrspace(3)* %33, align 4, !tbaa !16
  br label %158

158:                                              ; preds = %157, %154, %144
  %159 = phi float [ %151, %157 ], [ %145, %154 ], [ %145, %144 ]
  %160 = phi float [ %155, %157 ], [ %155, %154 ], [ %146, %144 ]
  %161 = add nsw i32 %147, %2
  br i1 %34, label %162, label %172

162:                                              ; preds = %158
  %163 = sext i32 %161 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %1, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !16, !amdgpu.noclobber !6
  %166 = fcmp contract olt float %165, %160
  br i1 %166, label %167, label %168

167:                                              ; preds = %162
  store float %165, float addrspace(3)* %32, align 4, !tbaa !16
  br label %168

168:                                              ; preds = %167, %162
  %169 = phi float [ %165, %167 ], [ %160, %162 ]
  %170 = fcmp contract ogt float %165, %159
  br i1 %170, label %171, label %172

171:                                              ; preds = %168
  store float %165, float addrspace(3)* %33, align 4, !tbaa !16
  br label %172

172:                                              ; preds = %171, %168, %158
  %173 = phi float [ %165, %171 ], [ %159, %168 ], [ %159, %158 ]
  %174 = phi float [ %169, %171 ], [ %169, %168 ], [ %160, %158 ]
  %175 = add nsw i32 %161, %2
  br i1 %34, label %176, label %186

176:                                              ; preds = %172
  %177 = sext i32 %175 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !16, !amdgpu.noclobber !6
  %180 = fcmp contract olt float %179, %174
  br i1 %180, label %181, label %182

181:                                              ; preds = %176
  store float %179, float addrspace(3)* %32, align 4, !tbaa !16
  br label %182

182:                                              ; preds = %181, %176
  %183 = phi float [ %179, %181 ], [ %174, %176 ]
  %184 = fcmp contract ogt float %179, %173
  br i1 %184, label %185, label %186

185:                                              ; preds = %182
  store float %179, float addrspace(3)* %33, align 4, !tbaa !16
  br label %186

186:                                              ; preds = %185, %182, %172
  %187 = phi float [ %179, %185 ], [ %173, %182 ], [ %173, %172 ]
  %188 = phi float [ %183, %185 ], [ %183, %182 ], [ %174, %172 ]
  %189 = add nsw i32 %175, %2
  br i1 %34, label %190, label %200

190:                                              ; preds = %186
  %191 = sext i32 %189 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %1, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !16, !amdgpu.noclobber !6
  %194 = fcmp contract olt float %193, %188
  br i1 %194, label %195, label %196

195:                                              ; preds = %190
  store float %193, float addrspace(3)* %32, align 4, !tbaa !16
  br label %196

196:                                              ; preds = %195, %190
  %197 = phi float [ %193, %195 ], [ %188, %190 ]
  %198 = fcmp contract ogt float %193, %187
  br i1 %198, label %199, label %200

199:                                              ; preds = %196
  store float %193, float addrspace(3)* %33, align 4, !tbaa !16
  br label %200

200:                                              ; preds = %199, %196, %186
  %201 = phi float [ %193, %199 ], [ %187, %196 ], [ %187, %186 ]
  %202 = phi float [ %197, %199 ], [ %197, %196 ], [ %188, %186 ]
  %203 = add nsw i32 %189, %2
  br i1 %34, label %204, label %214

204:                                              ; preds = %200
  %205 = sext i32 %203 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %1, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !16, !amdgpu.noclobber !6
  %208 = fcmp contract olt float %207, %202
  br i1 %208, label %209, label %210

209:                                              ; preds = %204
  store float %207, float addrspace(3)* %32, align 4, !tbaa !16
  br label %210

210:                                              ; preds = %209, %204
  %211 = phi float [ %207, %209 ], [ %202, %204 ]
  %212 = fcmp contract ogt float %207, %201
  br i1 %212, label %213, label %214

213:                                              ; preds = %210
  store float %207, float addrspace(3)* %33, align 4, !tbaa !16
  br label %214

214:                                              ; preds = %213, %210, %200
  %215 = phi float [ %207, %213 ], [ %201, %210 ], [ %201, %200 ]
  %216 = phi float [ %211, %213 ], [ %211, %210 ], [ %202, %200 ]
  %217 = add nsw i32 %203, %2
  br i1 %34, label %218, label %228

218:                                              ; preds = %214
  %219 = sext i32 %217 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !16, !amdgpu.noclobber !6
  %222 = fcmp contract olt float %221, %216
  br i1 %222, label %223, label %224

223:                                              ; preds = %218
  store float %221, float addrspace(3)* %32, align 4, !tbaa !16
  br label %224

224:                                              ; preds = %223, %218
  %225 = phi float [ %221, %223 ], [ %216, %218 ]
  %226 = fcmp contract ogt float %221, %215
  br i1 %226, label %227, label %228

227:                                              ; preds = %224
  store float %221, float addrspace(3)* %33, align 4, !tbaa !16
  br label %228

228:                                              ; preds = %227, %224, %214
  %229 = phi float [ %221, %227 ], [ %215, %224 ], [ %215, %214 ]
  %230 = phi float [ %225, %227 ], [ %225, %224 ], [ %216, %214 ]
  br i1 %34, label %231, label %241

231:                                              ; preds = %228
  %232 = add nsw i32 %217, %2
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %1, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !16, !amdgpu.noclobber !6
  %236 = fcmp contract olt float %235, %230
  br i1 %236, label %237, label %238

237:                                              ; preds = %231
  store float %235, float addrspace(3)* %32, align 4, !tbaa !16
  br label %238

238:                                              ; preds = %237, %231
  %239 = fcmp contract ogt float %235, %229
  br i1 %239, label %240, label %241

240:                                              ; preds = %238
  store float %235, float addrspace(3)* %33, align 4, !tbaa !16
  br label %241

241:                                              ; preds = %240, %238, %228
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %242 = icmp ugt i16 %16, 1
  br i1 %242, label %245, label %243

243:                                              ; preds = %263, %241
  %244 = icmp eq i32 %5, 0
  br i1 %244, label %268, label %286

245:                                              ; preds = %241, %263
  %246 = phi i32 [ %266, %263 ], [ 1, %241 ]
  %247 = phi i32 [ %265, %263 ], [ 1, %241 ]
  %248 = and i32 %247, %5
  %249 = icmp eq i32 %248, 0
  br i1 %249, label %250, label %263

250:                                              ; preds = %245
  %251 = add nsw i32 %246, %5
  %252 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiE7minvals, i32 0, i32 %251
  %253 = load float, float addrspace(3)* %252, align 4, !tbaa !16
  %254 = load float, float addrspace(3)* %32, align 4, !tbaa !16
  %255 = fcmp contract olt float %253, %254
  br i1 %255, label %256, label %257

256:                                              ; preds = %250
  store float %253, float addrspace(3)* %32, align 4, !tbaa !16
  br label %257

257:                                              ; preds = %256, %250
  %258 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiE7maxvals, i32 0, i32 %251
  %259 = load float, float addrspace(3)* %258, align 4, !tbaa !16
  %260 = load float, float addrspace(3)* %33, align 4, !tbaa !16
  %261 = fcmp contract ogt float %259, %260
  br i1 %261, label %262, label %263

262:                                              ; preds = %257
  store float %259, float addrspace(3)* %33, align 4, !tbaa !16
  br label %263

263:                                              ; preds = %257, %262, %245
  %264 = shl nsw i32 %247, 1
  %265 = add nuw nsw i32 %264, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %266 = shl i32 %246, 1
  %267 = icmp slt i32 %266, %17
  br i1 %267, label %245, label %243, !llvm.loop !20

268:                                              ; preds = %243
  %269 = udiv i32 %20, %17
  %270 = mul i32 %269, %17
  %271 = icmp ugt i32 %20, %270
  %272 = zext i1 %271 to i32
  %273 = add i32 %269, %272
  %274 = shl i32 %273, 8
  %275 = ashr exact i32 %274, 8
  %276 = mul nsw i32 %275, %12
  %277 = add i32 %276, %6
  %278 = shl i32 %277, 1
  %279 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiE7minvals, i32 0, i32 0), align 16, !tbaa !16
  %280 = sext i32 %278 to i64
  %281 = getelementptr inbounds float, float addrspace(1)* %0, i64 %280
  store float %279, float addrspace(1)* %281, align 4, !tbaa !16
  %282 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ10FindMinMaxPfS_iiE7maxvals, i32 0, i32 0), align 16, !tbaa !16
  %283 = add nuw nsw i32 %278, 1
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds float, float addrspace(1)* %0, i64 %284
  store float %282, float addrspace(1)* %285, align 4, !tbaa !16
  br label %286

286:                                              ; preds = %268, %243
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
