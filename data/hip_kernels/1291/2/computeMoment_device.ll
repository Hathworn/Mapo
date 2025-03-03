; ModuleID = '../data/hip_kernels/1291/2/main.cu'
source_filename = "../data/hip_kernels/1291/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13computeMomentPiS_PdiE14readArr_shared = internal unnamed_addr addrspace(3) global [32 x [32 x i32]] undef, align 16
@_ZZ13computeMomentPiS_PdiE16weightArr_shared = internal unnamed_addr addrspace(3) global [5 x [5 x double]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13computeMomentPiS_Pdi(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp ult i32 %12, 5
  %23 = icmp ult i32 %20, 5
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %32

25:                                               ; preds = %4
  %26 = mul nuw nsw i32 %12, 5
  %27 = add nuw nsw i32 %26, %20
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %2, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !5
  %31 = getelementptr inbounds [5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 %12, i32 %20
  store double %30, double addrspace(3)* %31, align 8, !tbaa !7
  br label %32

32:                                               ; preds = %25, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = mul nsw i32 %13, %3
  %34 = add nsw i32 %33, %21
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !11, !amdgpu.noclobber !5
  %38 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %12, i32 %20
  store i32 %37, i32 addrspace(3)* %38, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp slt i32 %13, %3
  %40 = icmp slt i32 %21, %3
  %41 = select i1 %39, i1 %40, i1 false
  br i1 %41, label %42, label %584

42:                                               ; preds = %32
  %43 = icmp ugt i32 %20, 4
  %44 = add nsw i32 %12, -5
  %45 = icmp ult i32 %44, 22
  %46 = select i1 %45, i1 %43, i1 false
  %47 = icmp ult i32 %20, 27
  %48 = select i1 %46, i1 %47, i1 false
  %49 = add i32 %13, %3
  %50 = add i32 %21, %3
  %51 = add i32 %49, -2
  %52 = add nsw i32 %12, -2
  br i1 %48, label %53, label %57

53:                                               ; preds = %42
  %54 = add nsw i32 %20, -2
  %55 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %52, i32 %54
  %56 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !11
  br label %66

57:                                               ; preds = %42
  %58 = srem i32 %51, %3
  %59 = add i32 %50, -2
  %60 = srem i32 %59, %3
  %61 = mul nsw i32 %58, %3
  %62 = add nsw i32 %61, %60
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %66

66:                                               ; preds = %53, %57
  %67 = phi i32 [ %56, %53 ], [ %65, %57 ]
  %68 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 0, i32 0), align 16, !tbaa !7
  %69 = sitofp i32 %67 to double
  %70 = fmul contract double %68, %69
  %71 = fadd contract double %70, 0.000000e+00
  %72 = fptrunc double %71 to float
  br i1 %48, label %82, label %73

73:                                               ; preds = %66
  %74 = srem i32 %51, %3
  %75 = add i32 %50, -1
  %76 = srem i32 %75, %3
  %77 = mul nsw i32 %74, %3
  %78 = add nsw i32 %77, %76
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %86

82:                                               ; preds = %66
  %83 = add nsw i32 %20, -1
  %84 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %52, i32 %83
  %85 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !11
  br label %86

86:                                               ; preds = %82, %73
  %87 = phi i32 [ %85, %82 ], [ %81, %73 ]
  %88 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 0, i32 1), align 8, !tbaa !7
  %89 = sitofp i32 %87 to double
  %90 = fmul contract double %88, %89
  %91 = fpext float %72 to double
  %92 = fadd contract double %90, %91
  %93 = fptrunc double %92 to float
  br i1 %48, label %102, label %94

94:                                               ; preds = %86
  %95 = srem i32 %51, %3
  %96 = srem i32 %50, %3
  %97 = mul nsw i32 %95, %3
  %98 = add nsw i32 %97, %96
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %105

102:                                              ; preds = %86
  %103 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %52, i32 %20
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !11
  br label %105

105:                                              ; preds = %102, %94
  %106 = phi i32 [ %104, %102 ], [ %101, %94 ]
  %107 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 0, i32 2), align 16, !tbaa !7
  %108 = sitofp i32 %106 to double
  %109 = fmul contract double %107, %108
  %110 = fpext float %93 to double
  %111 = fadd contract double %109, %110
  %112 = fptrunc double %111 to float
  br i1 %48, label %122, label %113

113:                                              ; preds = %105
  %114 = srem i32 %51, %3
  %115 = add i32 %50, 1
  %116 = srem i32 %115, %3
  %117 = mul nsw i32 %114, %3
  %118 = add nsw i32 %117, %116
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %126

122:                                              ; preds = %105
  %123 = add nuw nsw i32 %20, 1
  %124 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %52, i32 %123
  %125 = load i32, i32 addrspace(3)* %124, align 4, !tbaa !11
  br label %126

126:                                              ; preds = %122, %113
  %127 = phi i32 [ %125, %122 ], [ %121, %113 ]
  %128 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 0, i32 3), align 8, !tbaa !7
  %129 = sitofp i32 %127 to double
  %130 = fmul contract double %128, %129
  %131 = fpext float %112 to double
  %132 = fadd contract double %130, %131
  %133 = fptrunc double %132 to float
  br i1 %48, label %143, label %134

134:                                              ; preds = %126
  %135 = srem i32 %51, %3
  %136 = add i32 %50, 2
  %137 = srem i32 %136, %3
  %138 = mul nsw i32 %135, %3
  %139 = add nsw i32 %138, %137
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %147

143:                                              ; preds = %126
  %144 = add nuw nsw i32 %20, 2
  %145 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %52, i32 %144
  %146 = load i32, i32 addrspace(3)* %145, align 4, !tbaa !11
  br label %147

147:                                              ; preds = %143, %134
  %148 = phi i32 [ %146, %143 ], [ %142, %134 ]
  %149 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 0, i32 4), align 16, !tbaa !7
  %150 = sitofp i32 %148 to double
  %151 = fmul contract double %149, %150
  %152 = fpext float %133 to double
  %153 = fadd contract double %151, %152
  %154 = fptrunc double %153 to float
  %155 = add i32 %49, -1
  %156 = add nsw i32 %12, -1
  br i1 %48, label %166, label %157

157:                                              ; preds = %147
  %158 = srem i32 %155, %3
  %159 = add i32 %50, -2
  %160 = srem i32 %159, %3
  %161 = mul nsw i32 %158, %3
  %162 = add nsw i32 %161, %160
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %163
  %165 = load i32, i32 addrspace(1)* %164, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %170

166:                                              ; preds = %147
  %167 = add nsw i32 %20, -2
  %168 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %156, i32 %167
  %169 = load i32, i32 addrspace(3)* %168, align 4, !tbaa !11
  br label %170

170:                                              ; preds = %166, %157
  %171 = phi i32 [ %169, %166 ], [ %165, %157 ]
  %172 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 1, i32 0), align 8, !tbaa !7
  %173 = sitofp i32 %171 to double
  %174 = fmul contract double %172, %173
  %175 = fpext float %154 to double
  %176 = fadd contract double %174, %175
  %177 = fptrunc double %176 to float
  br i1 %48, label %187, label %178

178:                                              ; preds = %170
  %179 = srem i32 %155, %3
  %180 = add i32 %50, -1
  %181 = srem i32 %180, %3
  %182 = mul nsw i32 %179, %3
  %183 = add nsw i32 %182, %181
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %184
  %186 = load i32, i32 addrspace(1)* %185, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %191

187:                                              ; preds = %170
  %188 = add nsw i32 %20, -1
  %189 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %156, i32 %188
  %190 = load i32, i32 addrspace(3)* %189, align 4, !tbaa !11
  br label %191

191:                                              ; preds = %187, %178
  %192 = phi i32 [ %190, %187 ], [ %186, %178 ]
  %193 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 1, i32 1), align 16, !tbaa !7
  %194 = sitofp i32 %192 to double
  %195 = fmul contract double %193, %194
  %196 = fpext float %177 to double
  %197 = fadd contract double %195, %196
  %198 = fptrunc double %197 to float
  br i1 %48, label %207, label %199

199:                                              ; preds = %191
  %200 = srem i32 %155, %3
  %201 = srem i32 %50, %3
  %202 = mul nsw i32 %200, %3
  %203 = add nsw i32 %202, %201
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %204
  %206 = load i32, i32 addrspace(1)* %205, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %210

207:                                              ; preds = %191
  %208 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %156, i32 %20
  %209 = load i32, i32 addrspace(3)* %208, align 4, !tbaa !11
  br label %210

210:                                              ; preds = %207, %199
  %211 = phi i32 [ %209, %207 ], [ %206, %199 ]
  %212 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 1, i32 2), align 8, !tbaa !7
  %213 = sitofp i32 %211 to double
  %214 = fmul contract double %212, %213
  %215 = fpext float %198 to double
  %216 = fadd contract double %214, %215
  %217 = fptrunc double %216 to float
  br i1 %48, label %227, label %218

218:                                              ; preds = %210
  %219 = srem i32 %155, %3
  %220 = add i32 %50, 1
  %221 = srem i32 %220, %3
  %222 = mul nsw i32 %219, %3
  %223 = add nsw i32 %222, %221
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %224
  %226 = load i32, i32 addrspace(1)* %225, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %231

227:                                              ; preds = %210
  %228 = add nuw nsw i32 %20, 1
  %229 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %156, i32 %228
  %230 = load i32, i32 addrspace(3)* %229, align 4, !tbaa !11
  br label %231

231:                                              ; preds = %227, %218
  %232 = phi i32 [ %230, %227 ], [ %226, %218 ]
  %233 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 1, i32 3), align 16, !tbaa !7
  %234 = sitofp i32 %232 to double
  %235 = fmul contract double %233, %234
  %236 = fpext float %217 to double
  %237 = fadd contract double %235, %236
  %238 = fptrunc double %237 to float
  br i1 %48, label %248, label %239

239:                                              ; preds = %231
  %240 = srem i32 %155, %3
  %241 = add i32 %50, 2
  %242 = srem i32 %241, %3
  %243 = mul nsw i32 %240, %3
  %244 = add nsw i32 %243, %242
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %245
  %247 = load i32, i32 addrspace(1)* %246, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %252

248:                                              ; preds = %231
  %249 = add nuw nsw i32 %20, 2
  %250 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %156, i32 %249
  %251 = load i32, i32 addrspace(3)* %250, align 4, !tbaa !11
  br label %252

252:                                              ; preds = %248, %239
  %253 = phi i32 [ %251, %248 ], [ %247, %239 ]
  %254 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 1, i32 4), align 8, !tbaa !7
  %255 = sitofp i32 %253 to double
  %256 = fmul contract double %254, %255
  %257 = fpext float %238 to double
  %258 = fadd contract double %256, %257
  %259 = fptrunc double %258 to float
  br i1 %48, label %269, label %260

260:                                              ; preds = %252
  %261 = srem i32 %49, %3
  %262 = add i32 %50, -2
  %263 = srem i32 %262, %3
  %264 = mul nsw i32 %261, %3
  %265 = add nsw i32 %264, %263
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %266
  %268 = load i32, i32 addrspace(1)* %267, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %273

269:                                              ; preds = %252
  %270 = add nsw i32 %20, -2
  %271 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %12, i32 %270
  %272 = load i32, i32 addrspace(3)* %271, align 4, !tbaa !11
  br label %273

273:                                              ; preds = %269, %260
  %274 = phi i32 [ %272, %269 ], [ %268, %260 ]
  %275 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 2, i32 0), align 16, !tbaa !7
  %276 = sitofp i32 %274 to double
  %277 = fmul contract double %275, %276
  %278 = fpext float %259 to double
  %279 = fadd contract double %277, %278
  %280 = fptrunc double %279 to float
  br i1 %48, label %290, label %281

281:                                              ; preds = %273
  %282 = srem i32 %49, %3
  %283 = add i32 %50, -1
  %284 = srem i32 %283, %3
  %285 = mul nsw i32 %282, %3
  %286 = add nsw i32 %285, %284
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %287
  %289 = load i32, i32 addrspace(1)* %288, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %294

290:                                              ; preds = %273
  %291 = add nsw i32 %20, -1
  %292 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %12, i32 %291
  %293 = load i32, i32 addrspace(3)* %292, align 4, !tbaa !11
  br label %294

294:                                              ; preds = %290, %281
  %295 = phi i32 [ %293, %290 ], [ %289, %281 ]
  %296 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 2, i32 1), align 8, !tbaa !7
  %297 = sitofp i32 %295 to double
  %298 = fmul contract double %296, %297
  %299 = fpext float %280 to double
  %300 = fadd contract double %298, %299
  %301 = fptrunc double %300 to float
  br i1 %48, label %310, label %302

302:                                              ; preds = %294
  %303 = srem i32 %49, %3
  %304 = srem i32 %50, %3
  %305 = mul nsw i32 %303, %3
  %306 = add nsw i32 %305, %304
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %307
  %309 = load i32, i32 addrspace(1)* %308, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %312

310:                                              ; preds = %294
  %311 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !11
  br label %312

312:                                              ; preds = %310, %302
  %313 = phi i32 [ %311, %310 ], [ %309, %302 ]
  %314 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 2, i32 2), align 16, !tbaa !7
  %315 = sitofp i32 %313 to double
  %316 = fmul contract double %314, %315
  %317 = fpext float %301 to double
  %318 = fadd contract double %316, %317
  %319 = fptrunc double %318 to float
  br i1 %48, label %329, label %320

320:                                              ; preds = %312
  %321 = srem i32 %49, %3
  %322 = add i32 %50, 1
  %323 = srem i32 %322, %3
  %324 = mul nsw i32 %321, %3
  %325 = add nsw i32 %324, %323
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %326
  %328 = load i32, i32 addrspace(1)* %327, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %333

329:                                              ; preds = %312
  %330 = add nuw nsw i32 %20, 1
  %331 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %12, i32 %330
  %332 = load i32, i32 addrspace(3)* %331, align 4, !tbaa !11
  br label %333

333:                                              ; preds = %329, %320
  %334 = phi i32 [ %332, %329 ], [ %328, %320 ]
  %335 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 2, i32 3), align 8, !tbaa !7
  %336 = sitofp i32 %334 to double
  %337 = fmul contract double %335, %336
  %338 = fpext float %319 to double
  %339 = fadd contract double %337, %338
  %340 = fptrunc double %339 to float
  br i1 %48, label %350, label %341

341:                                              ; preds = %333
  %342 = srem i32 %49, %3
  %343 = add i32 %50, 2
  %344 = srem i32 %343, %3
  %345 = mul nsw i32 %342, %3
  %346 = add nsw i32 %345, %344
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %347
  %349 = load i32, i32 addrspace(1)* %348, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %354

350:                                              ; preds = %333
  %351 = add nuw nsw i32 %20, 2
  %352 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %12, i32 %351
  %353 = load i32, i32 addrspace(3)* %352, align 4, !tbaa !11
  br label %354

354:                                              ; preds = %350, %341
  %355 = phi i32 [ %353, %350 ], [ %349, %341 ]
  %356 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 2, i32 4), align 16, !tbaa !7
  %357 = sitofp i32 %355 to double
  %358 = fmul contract double %356, %357
  %359 = fpext float %340 to double
  %360 = fadd contract double %358, %359
  %361 = fptrunc double %360 to float
  %362 = add i32 %49, 1
  %363 = add nuw nsw i32 %12, 1
  br i1 %48, label %373, label %364

364:                                              ; preds = %354
  %365 = srem i32 %362, %3
  %366 = add i32 %50, -2
  %367 = srem i32 %366, %3
  %368 = mul nsw i32 %365, %3
  %369 = add nsw i32 %368, %367
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %370
  %372 = load i32, i32 addrspace(1)* %371, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %377

373:                                              ; preds = %354
  %374 = add nsw i32 %20, -2
  %375 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %363, i32 %374
  %376 = load i32, i32 addrspace(3)* %375, align 4, !tbaa !11
  br label %377

377:                                              ; preds = %373, %364
  %378 = phi i32 [ %376, %373 ], [ %372, %364 ]
  %379 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 3, i32 0), align 8, !tbaa !7
  %380 = sitofp i32 %378 to double
  %381 = fmul contract double %379, %380
  %382 = fpext float %361 to double
  %383 = fadd contract double %381, %382
  %384 = fptrunc double %383 to float
  br i1 %48, label %394, label %385

385:                                              ; preds = %377
  %386 = srem i32 %362, %3
  %387 = add i32 %50, -1
  %388 = srem i32 %387, %3
  %389 = mul nsw i32 %386, %3
  %390 = add nsw i32 %389, %388
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %391
  %393 = load i32, i32 addrspace(1)* %392, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %398

394:                                              ; preds = %377
  %395 = add nsw i32 %20, -1
  %396 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %363, i32 %395
  %397 = load i32, i32 addrspace(3)* %396, align 4, !tbaa !11
  br label %398

398:                                              ; preds = %394, %385
  %399 = phi i32 [ %397, %394 ], [ %393, %385 ]
  %400 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 3, i32 1), align 16, !tbaa !7
  %401 = sitofp i32 %399 to double
  %402 = fmul contract double %400, %401
  %403 = fpext float %384 to double
  %404 = fadd contract double %402, %403
  %405 = fptrunc double %404 to float
  br i1 %48, label %414, label %406

406:                                              ; preds = %398
  %407 = srem i32 %362, %3
  %408 = srem i32 %50, %3
  %409 = mul nsw i32 %407, %3
  %410 = add nsw i32 %409, %408
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %411
  %413 = load i32, i32 addrspace(1)* %412, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %417

414:                                              ; preds = %398
  %415 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %363, i32 %20
  %416 = load i32, i32 addrspace(3)* %415, align 4, !tbaa !11
  br label %417

417:                                              ; preds = %414, %406
  %418 = phi i32 [ %416, %414 ], [ %413, %406 ]
  %419 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 3, i32 2), align 8, !tbaa !7
  %420 = sitofp i32 %418 to double
  %421 = fmul contract double %419, %420
  %422 = fpext float %405 to double
  %423 = fadd contract double %421, %422
  %424 = fptrunc double %423 to float
  br i1 %48, label %434, label %425

425:                                              ; preds = %417
  %426 = srem i32 %362, %3
  %427 = add i32 %50, 1
  %428 = srem i32 %427, %3
  %429 = mul nsw i32 %426, %3
  %430 = add nsw i32 %429, %428
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %431
  %433 = load i32, i32 addrspace(1)* %432, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %438

434:                                              ; preds = %417
  %435 = add nuw nsw i32 %20, 1
  %436 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %363, i32 %435
  %437 = load i32, i32 addrspace(3)* %436, align 4, !tbaa !11
  br label %438

438:                                              ; preds = %434, %425
  %439 = phi i32 [ %437, %434 ], [ %433, %425 ]
  %440 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 3, i32 3), align 16, !tbaa !7
  %441 = sitofp i32 %439 to double
  %442 = fmul contract double %440, %441
  %443 = fpext float %424 to double
  %444 = fadd contract double %442, %443
  %445 = fptrunc double %444 to float
  br i1 %48, label %455, label %446

446:                                              ; preds = %438
  %447 = srem i32 %362, %3
  %448 = add i32 %50, 2
  %449 = srem i32 %448, %3
  %450 = mul nsw i32 %447, %3
  %451 = add nsw i32 %450, %449
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %452
  %454 = load i32, i32 addrspace(1)* %453, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %459

455:                                              ; preds = %438
  %456 = add nuw nsw i32 %20, 2
  %457 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %363, i32 %456
  %458 = load i32, i32 addrspace(3)* %457, align 4, !tbaa !11
  br label %459

459:                                              ; preds = %455, %446
  %460 = phi i32 [ %458, %455 ], [ %454, %446 ]
  %461 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 3, i32 4), align 8, !tbaa !7
  %462 = sitofp i32 %460 to double
  %463 = fmul contract double %461, %462
  %464 = fpext float %445 to double
  %465 = fadd contract double %463, %464
  %466 = fptrunc double %465 to float
  %467 = add i32 %49, 2
  %468 = add nuw nsw i32 %12, 2
  br i1 %48, label %478, label %469

469:                                              ; preds = %459
  %470 = srem i32 %467, %3
  %471 = add i32 %50, -2
  %472 = srem i32 %471, %3
  %473 = mul nsw i32 %470, %3
  %474 = add nsw i32 %473, %472
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %475
  %477 = load i32, i32 addrspace(1)* %476, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %482

478:                                              ; preds = %459
  %479 = add nsw i32 %20, -2
  %480 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %468, i32 %479
  %481 = load i32, i32 addrspace(3)* %480, align 4, !tbaa !11
  br label %482

482:                                              ; preds = %478, %469
  %483 = phi i32 [ %481, %478 ], [ %477, %469 ]
  %484 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 4, i32 0), align 16, !tbaa !7
  %485 = sitofp i32 %483 to double
  %486 = fmul contract double %484, %485
  %487 = fpext float %466 to double
  %488 = fadd contract double %486, %487
  %489 = fptrunc double %488 to float
  br i1 %48, label %499, label %490

490:                                              ; preds = %482
  %491 = srem i32 %467, %3
  %492 = add i32 %50, -1
  %493 = srem i32 %492, %3
  %494 = mul nsw i32 %491, %3
  %495 = add nsw i32 %494, %493
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %496
  %498 = load i32, i32 addrspace(1)* %497, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %503

499:                                              ; preds = %482
  %500 = add nsw i32 %20, -1
  %501 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %468, i32 %500
  %502 = load i32, i32 addrspace(3)* %501, align 4, !tbaa !11
  br label %503

503:                                              ; preds = %499, %490
  %504 = phi i32 [ %502, %499 ], [ %498, %490 ]
  %505 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 4, i32 1), align 8, !tbaa !7
  %506 = sitofp i32 %504 to double
  %507 = fmul contract double %505, %506
  %508 = fpext float %489 to double
  %509 = fadd contract double %507, %508
  %510 = fptrunc double %509 to float
  br i1 %48, label %519, label %511

511:                                              ; preds = %503
  %512 = srem i32 %467, %3
  %513 = srem i32 %50, %3
  %514 = mul nsw i32 %512, %3
  %515 = add nsw i32 %514, %513
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %516
  %518 = load i32, i32 addrspace(1)* %517, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %522

519:                                              ; preds = %503
  %520 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %468, i32 %20
  %521 = load i32, i32 addrspace(3)* %520, align 4, !tbaa !11
  br label %522

522:                                              ; preds = %519, %511
  %523 = phi i32 [ %521, %519 ], [ %518, %511 ]
  %524 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 4, i32 2), align 16, !tbaa !7
  %525 = sitofp i32 %523 to double
  %526 = fmul contract double %524, %525
  %527 = fpext float %510 to double
  %528 = fadd contract double %526, %527
  %529 = fptrunc double %528 to float
  br i1 %48, label %539, label %530

530:                                              ; preds = %522
  %531 = srem i32 %467, %3
  %532 = add i32 %50, 1
  %533 = srem i32 %532, %3
  %534 = mul nsw i32 %531, %3
  %535 = add nsw i32 %534, %533
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %536
  %538 = load i32, i32 addrspace(1)* %537, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %543

539:                                              ; preds = %522
  %540 = add nuw nsw i32 %20, 1
  %541 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %468, i32 %540
  %542 = load i32, i32 addrspace(3)* %541, align 4, !tbaa !11
  br label %543

543:                                              ; preds = %539, %530
  %544 = phi i32 [ %542, %539 ], [ %538, %530 ]
  %545 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 4, i32 3), align 8, !tbaa !7
  %546 = sitofp i32 %544 to double
  %547 = fmul contract double %545, %546
  %548 = fpext float %529 to double
  %549 = fadd contract double %547, %548
  %550 = fptrunc double %549 to float
  br i1 %48, label %560, label %551

551:                                              ; preds = %543
  %552 = srem i32 %467, %3
  %553 = add i32 %50, 2
  %554 = srem i32 %553, %3
  %555 = mul nsw i32 %552, %3
  %556 = add nsw i32 %555, %554
  %557 = sext i32 %556 to i64
  %558 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %557
  %559 = load i32, i32 addrspace(1)* %558, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %564

560:                                              ; preds = %543
  %561 = add nuw nsw i32 %20, 2
  %562 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE14readArr_shared, i32 0, i32 %468, i32 %561
  %563 = load i32, i32 addrspace(3)* %562, align 4, !tbaa !11
  br label %564

564:                                              ; preds = %560, %551
  %565 = phi i32 [ %563, %560 ], [ %559, %551 ]
  %566 = load double, double addrspace(3)* getelementptr inbounds ([5 x [5 x double]], [5 x [5 x double]] addrspace(3)* @_ZZ13computeMomentPiS_PdiE16weightArr_shared, i32 0, i32 4, i32 4), align 16, !tbaa !7
  %567 = sitofp i32 %565 to double
  %568 = fmul contract double %566, %567
  %569 = fpext float %550 to double
  %570 = fadd contract double %568, %569
  %571 = fptrunc double %570 to float
  %572 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %573 = fcmp contract olt float %571, 0xBEB0C6F7A0000000
  br i1 %48, label %574, label %578

574:                                              ; preds = %564
  %575 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !11
  store i32 %575, i32 addrspace(1)* %572, align 4, !tbaa !11
  br i1 %573, label %582, label %576

576:                                              ; preds = %574
  %577 = fcmp contract ogt float %571, 0x3EB0C6F7A0000000
  br i1 %577, label %582, label %584

578:                                              ; preds = %564
  %579 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !11, !amdgpu.noclobber !5
  store i32 %579, i32 addrspace(1)* %572, align 4, !tbaa !11
  br i1 %573, label %582, label %580

580:                                              ; preds = %578
  %581 = fcmp contract ogt float %571, 0x3EB0C6F7A0000000
  br i1 %581, label %582, label %584

582:                                              ; preds = %580, %578, %576, %574
  %583 = phi i32 [ -1, %574 ], [ 1, %576 ], [ -1, %578 ], [ 1, %580 ]
  store i32 %583, i32 addrspace(1)* %572, align 4, !tbaa !11
  br label %584

584:                                              ; preds = %582, %576, %580, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
