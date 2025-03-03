; ModuleID = '../data/hip_kernels/3119/12/main.cu'
source_filename = "../data/hip_kernels/3119/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow = internal addrspace(3) global [10 x i32] undef, align 16
@_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol = internal addrspace(3) global [10 x i32] undef, align 16
@_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata = internal addrspace(3) global [256 x float] undef, align 16
@_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24reduce_max_filter_finalfPfS_PijjiS0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl nsw i32 %5, 1
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %9
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !5
  %18 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !14, !invariant.load !15
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %17, %21
  %23 = mul i32 %22, %21
  %24 = icmp ugt i32 %17, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %11
  %28 = icmp ult i32 %9, %7
  br i1 %28, label %29, label %40

29:                                               ; preds = %8
  %30 = zext i32 %9 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !15
  %33 = freeze i32 %32
  %34 = freeze i32 %4
  %35 = udiv i32 %33, %34
  %36 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %9
  store i32 %35, i32 addrspace(3)* %36, align 4, !tbaa !16
  %37 = mul i32 %35, %34
  %38 = sub i32 %33, %37
  %39 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %9
  store i32 %38, i32 addrspace(3)* %39, align 4, !tbaa !16
  br label %40

40:                                               ; preds = %29, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ult i32 %13, %3
  br i1 %41, label %42, label %119

42:                                               ; preds = %40
  %43 = icmp slt i32 %7, 1
  br label %44

44:                                               ; preds = %42, %114
  %45 = phi i32 [ %13, %42 ], [ %117, %114 ]
  %46 = phi float [ 0.000000e+00, %42 ], [ %116, %114 ]
  %47 = phi i32 [ undef, %42 ], [ %115, %114 ]
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !20, !amdgpu.noclobber !15
  %51 = fcmp contract olt float %46, %50
  br i1 %51, label %52, label %78

52:                                               ; preds = %44
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %48
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !16, !amdgpu.noclobber !15
  %55 = freeze i32 %54
  %56 = freeze i32 %4
  %57 = sdiv i32 %55, %56
  %58 = mul i32 %57, %56
  %59 = sub i32 %55, %58
  br i1 %43, label %74, label %60

60:                                               ; preds = %52, %70
  %61 = phi i1 [ %72, %70 ], [ false, %52 ]
  %62 = phi i32 [ %71, %70 ], [ 0, %52 ]
  %63 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %62
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !16
  %65 = icmp eq i32 %64, %57
  br i1 %65, label %66, label %70

66:                                               ; preds = %60
  %67 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %62
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !16
  %69 = icmp eq i32 %68, %59
  br i1 %69, label %74, label %70

70:                                               ; preds = %66, %60
  %71 = add nuw nsw i32 %62, 1
  %72 = icmp sge i32 %71, %7
  %73 = icmp eq i32 %71, %7
  br i1 %73, label %74, label %60, !llvm.loop !22

74:                                               ; preds = %66, %70, %52
  %75 = phi i1 [ true, %52 ], [ %61, %66 ], [ %72, %70 ]
  %76 = select i1 %75, i32 %54, i32 %47
  %77 = select i1 %75, float %50, float %46
  br label %78

78:                                               ; preds = %74, %44
  %79 = phi i32 [ %47, %44 ], [ %76, %74 ]
  %80 = phi float [ %46, %44 ], [ %77, %74 ]
  %81 = add i32 %45, %5
  %82 = icmp ult i32 %81, %3
  br i1 %82, label %83, label %114

83:                                               ; preds = %78
  %84 = zext i32 %81 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !20, !amdgpu.noclobber !15
  %87 = fcmp contract olt float %80, %86
  br i1 %87, label %88, label %114

88:                                               ; preds = %83
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %84
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !15
  %91 = freeze i32 %90
  %92 = freeze i32 %4
  %93 = sdiv i32 %91, %92
  %94 = mul i32 %93, %92
  %95 = sub i32 %91, %94
  br i1 %43, label %110, label %96

96:                                               ; preds = %88, %106
  %97 = phi i1 [ %108, %106 ], [ false, %88 ]
  %98 = phi i32 [ %107, %106 ], [ 0, %88 ]
  %99 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %98
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !16
  %101 = icmp eq i32 %100, %93
  br i1 %101, label %102, label %106

102:                                              ; preds = %96
  %103 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %98
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !16
  %105 = icmp eq i32 %104, %95
  br i1 %105, label %110, label %106

106:                                              ; preds = %102, %96
  %107 = add nuw nsw i32 %98, 1
  %108 = icmp sge i32 %107, %7
  %109 = icmp eq i32 %107, %7
  br i1 %109, label %110, label %96, !llvm.loop !22

110:                                              ; preds = %102, %106, %88
  %111 = phi i1 [ true, %88 ], [ %97, %102 ], [ %108, %106 ]
  %112 = select i1 %111, i32 %90, i32 %79
  %113 = select i1 %111, float %86, float %80
  br label %114

114:                                              ; preds = %110, %83, %78
  %115 = phi i32 [ %79, %83 ], [ %79, %78 ], [ %112, %110 ]
  %116 = phi float [ %80, %83 ], [ %80, %78 ], [ %113, %110 ]
  %117 = add i32 %45, %27
  %118 = icmp ult i32 %117, %3
  br i1 %118, label %44, label %119, !llvm.loop !24

119:                                              ; preds = %114, %40
  %120 = phi i32 [ undef, %40 ], [ %115, %114 ]
  %121 = phi float [ 0.000000e+00, %40 ], [ %116, %114 ]
  %122 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %9
  store float %121, float addrspace(3)* %122, align 4, !tbaa !20
  %123 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %9
  store i32 %120, i32 addrspace(3)* %123, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %124 = icmp sgt i32 %5, 511
  br i1 %124, label %125, label %160

125:                                              ; preds = %119
  %126 = icmp ult i32 %9, 256
  br i1 %126, label %127, label %158

127:                                              ; preds = %125
  %128 = add nuw nsw i32 %9, 256
  %129 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %128
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !20
  %131 = fcmp contract olt float %121, %130
  br i1 %131, label %132, label %158

132:                                              ; preds = %127
  %133 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %128
  %134 = load i32, i32 addrspace(3)* %133, align 4, !tbaa !16
  %135 = freeze i32 %134
  %136 = freeze i32 %4
  %137 = sdiv i32 %135, %136
  %138 = mul i32 %137, %136
  %139 = sub i32 %135, %138
  %140 = icmp slt i32 %7, 1
  br i1 %140, label %157, label %141

141:                                              ; preds = %132, %151
  %142 = phi i1 [ %153, %151 ], [ false, %132 ]
  %143 = phi i32 [ %152, %151 ], [ 0, %132 ]
  %144 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %143
  %145 = load i32, i32 addrspace(3)* %144, align 4, !tbaa !16
  %146 = icmp eq i32 %145, %137
  br i1 %146, label %147, label %151

147:                                              ; preds = %141
  %148 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %143
  %149 = load i32, i32 addrspace(3)* %148, align 4, !tbaa !16
  %150 = icmp eq i32 %149, %139
  br i1 %150, label %155, label %151

151:                                              ; preds = %147, %141
  %152 = add nuw nsw i32 %143, 1
  %153 = icmp sge i32 %152, %7
  %154 = icmp eq i32 %152, %7
  br i1 %154, label %155, label %141, !llvm.loop !22

155:                                              ; preds = %147, %151
  %156 = phi i1 [ %142, %147 ], [ %153, %151 ]
  br i1 %156, label %157, label %158

157:                                              ; preds = %132, %155
  store float %130, float addrspace(3)* %122, align 4, !tbaa !20
  store i32 %134, i32 addrspace(3)* %123, align 4, !tbaa !16
  br label %158

158:                                              ; preds = %127, %157, %155, %125
  %159 = phi float [ %130, %157 ], [ %121, %155 ], [ %121, %127 ], [ %121, %125 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %160

160:                                              ; preds = %158, %119
  %161 = phi float [ %159, %158 ], [ %121, %119 ]
  %162 = icmp sgt i32 %5, 255
  br i1 %162, label %163, label %198

163:                                              ; preds = %160
  %164 = icmp ult i32 %9, 128
  br i1 %164, label %165, label %196

165:                                              ; preds = %163
  %166 = add nuw nsw i32 %9, 128
  %167 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %166
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !20
  %169 = fcmp contract olt float %161, %168
  br i1 %169, label %170, label %196

170:                                              ; preds = %165
  %171 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %166
  %172 = load i32, i32 addrspace(3)* %171, align 4, !tbaa !16
  %173 = freeze i32 %172
  %174 = freeze i32 %4
  %175 = sdiv i32 %173, %174
  %176 = mul i32 %175, %174
  %177 = sub i32 %173, %176
  %178 = icmp slt i32 %7, 1
  br i1 %178, label %195, label %179

179:                                              ; preds = %170, %189
  %180 = phi i1 [ %191, %189 ], [ false, %170 ]
  %181 = phi i32 [ %190, %189 ], [ 0, %170 ]
  %182 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %181
  %183 = load i32, i32 addrspace(3)* %182, align 4, !tbaa !16
  %184 = icmp eq i32 %183, %175
  br i1 %184, label %185, label %189

185:                                              ; preds = %179
  %186 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %181
  %187 = load i32, i32 addrspace(3)* %186, align 4, !tbaa !16
  %188 = icmp eq i32 %187, %177
  br i1 %188, label %193, label %189

189:                                              ; preds = %185, %179
  %190 = add nuw nsw i32 %181, 1
  %191 = icmp sge i32 %190, %7
  %192 = icmp eq i32 %190, %7
  br i1 %192, label %193, label %179, !llvm.loop !22

193:                                              ; preds = %185, %189
  %194 = phi i1 [ %180, %185 ], [ %191, %189 ]
  br i1 %194, label %195, label %196

195:                                              ; preds = %170, %193
  store float %168, float addrspace(3)* %122, align 4, !tbaa !20
  store i32 %172, i32 addrspace(3)* %123, align 4, !tbaa !16
  br label %196

196:                                              ; preds = %165, %195, %193, %163
  %197 = phi float [ %168, %195 ], [ %161, %193 ], [ %161, %165 ], [ %161, %163 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %198

198:                                              ; preds = %196, %160
  %199 = phi float [ %197, %196 ], [ %161, %160 ]
  %200 = icmp sgt i32 %5, 127
  br i1 %200, label %201, label %236

201:                                              ; preds = %198
  %202 = icmp ult i32 %9, 64
  br i1 %202, label %203, label %234

203:                                              ; preds = %201
  %204 = add nuw nsw i32 %9, 64
  %205 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %204
  %206 = load float, float addrspace(3)* %205, align 4, !tbaa !20
  %207 = fcmp contract olt float %199, %206
  br i1 %207, label %208, label %234

208:                                              ; preds = %203
  %209 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %204
  %210 = load i32, i32 addrspace(3)* %209, align 4, !tbaa !16
  %211 = freeze i32 %210
  %212 = freeze i32 %4
  %213 = sdiv i32 %211, %212
  %214 = mul i32 %213, %212
  %215 = sub i32 %211, %214
  %216 = icmp slt i32 %7, 1
  br i1 %216, label %233, label %217

217:                                              ; preds = %208, %227
  %218 = phi i1 [ %229, %227 ], [ false, %208 ]
  %219 = phi i32 [ %228, %227 ], [ 0, %208 ]
  %220 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %219
  %221 = load i32, i32 addrspace(3)* %220, align 4, !tbaa !16
  %222 = icmp eq i32 %221, %213
  br i1 %222, label %223, label %227

223:                                              ; preds = %217
  %224 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %219
  %225 = load i32, i32 addrspace(3)* %224, align 4, !tbaa !16
  %226 = icmp eq i32 %225, %215
  br i1 %226, label %231, label %227

227:                                              ; preds = %223, %217
  %228 = add nuw nsw i32 %219, 1
  %229 = icmp sge i32 %228, %7
  %230 = icmp eq i32 %228, %7
  br i1 %230, label %231, label %217, !llvm.loop !22

231:                                              ; preds = %223, %227
  %232 = phi i1 [ %218, %223 ], [ %229, %227 ]
  br i1 %232, label %233, label %234

233:                                              ; preds = %208, %231
  store float %206, float addrspace(3)* %122, align 4, !tbaa !20
  store i32 %210, i32 addrspace(3)* %123, align 4, !tbaa !16
  br label %234

234:                                              ; preds = %203, %233, %231, %201
  %235 = phi float [ %206, %233 ], [ %199, %231 ], [ %199, %203 ], [ %199, %201 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %236

236:                                              ; preds = %234, %198
  %237 = phi float [ %235, %234 ], [ %199, %198 ]
  %238 = icmp ult i32 %9, 32
  br i1 %238, label %239, label %491

239:                                              ; preds = %236
  %240 = icmp sgt i32 %5, 63
  br i1 %240, label %241, label %280

241:                                              ; preds = %239
  %242 = add nuw nsw i32 %9, 32
  %243 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %242
  %244 = addrspacecast float addrspace(3)* %243 to float*
  %245 = load volatile float, float* %244, align 4, !tbaa !20
  %246 = fcmp contract olt float %237, %245
  br i1 %246, label %247, label %280

247:                                              ; preds = %241
  %248 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %242
  %249 = addrspacecast i32 addrspace(3)* %248 to i32*
  %250 = load volatile i32, i32* %249, align 4, !tbaa !16
  %251 = freeze i32 %250
  %252 = freeze i32 %4
  %253 = sdiv i32 %251, %252
  %254 = mul i32 %253, %252
  %255 = sub i32 %251, %254
  %256 = icmp slt i32 %7, 1
  br i1 %256, label %275, label %257

257:                                              ; preds = %247, %269
  %258 = phi i1 [ %271, %269 ], [ false, %247 ]
  %259 = phi i32 [ %270, %269 ], [ 0, %247 ]
  %260 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %259
  %261 = addrspacecast i32 addrspace(3)* %260 to i32*
  %262 = load volatile i32, i32* %261, align 4, !tbaa !16
  %263 = icmp eq i32 %262, %253
  br i1 %263, label %264, label %269

264:                                              ; preds = %257
  %265 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %259
  %266 = addrspacecast i32 addrspace(3)* %265 to i32*
  %267 = load volatile i32, i32* %266, align 4, !tbaa !16
  %268 = icmp eq i32 %267, %255
  br i1 %268, label %273, label %269

269:                                              ; preds = %264, %257
  %270 = add nuw nsw i32 %259, 1
  %271 = icmp sge i32 %270, %7
  %272 = icmp eq i32 %270, %7
  br i1 %272, label %273, label %257, !llvm.loop !25

273:                                              ; preds = %264, %269
  %274 = phi i1 [ %258, %264 ], [ %271, %269 ]
  br i1 %274, label %275, label %280

275:                                              ; preds = %247, %273
  %276 = load volatile float, float* %244, align 4, !tbaa !20
  %277 = addrspacecast float addrspace(3)* %122 to float*
  store volatile float %276, float* %277, align 4, !tbaa !20
  %278 = load volatile i32, i32* %249, align 4, !tbaa !16
  %279 = addrspacecast i32 addrspace(3)* %123 to i32*
  store volatile i32 %278, i32* %279, align 4, !tbaa !16
  br label %280

280:                                              ; preds = %241, %275, %273, %239
  %281 = phi float [ %276, %275 ], [ %237, %273 ], [ %237, %241 ], [ %237, %239 ]
  %282 = icmp sgt i32 %5, 31
  br i1 %282, label %283, label %322

283:                                              ; preds = %280
  %284 = add nuw nsw i32 %9, 16
  %285 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %284
  %286 = addrspacecast float addrspace(3)* %285 to float*
  %287 = load volatile float, float* %286, align 4, !tbaa !20
  %288 = fcmp contract olt float %281, %287
  br i1 %288, label %289, label %322

289:                                              ; preds = %283
  %290 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %284
  %291 = addrspacecast i32 addrspace(3)* %290 to i32*
  %292 = load volatile i32, i32* %291, align 4, !tbaa !16
  %293 = freeze i32 %292
  %294 = freeze i32 %4
  %295 = sdiv i32 %293, %294
  %296 = mul i32 %295, %294
  %297 = sub i32 %293, %296
  %298 = icmp slt i32 %7, 1
  br i1 %298, label %317, label %299

299:                                              ; preds = %289, %311
  %300 = phi i1 [ %313, %311 ], [ false, %289 ]
  %301 = phi i32 [ %312, %311 ], [ 0, %289 ]
  %302 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %301
  %303 = addrspacecast i32 addrspace(3)* %302 to i32*
  %304 = load volatile i32, i32* %303, align 4, !tbaa !16
  %305 = icmp eq i32 %304, %295
  br i1 %305, label %306, label %311

306:                                              ; preds = %299
  %307 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %301
  %308 = addrspacecast i32 addrspace(3)* %307 to i32*
  %309 = load volatile i32, i32* %308, align 4, !tbaa !16
  %310 = icmp eq i32 %309, %297
  br i1 %310, label %315, label %311

311:                                              ; preds = %306, %299
  %312 = add nuw nsw i32 %301, 1
  %313 = icmp sge i32 %312, %7
  %314 = icmp eq i32 %312, %7
  br i1 %314, label %315, label %299, !llvm.loop !25

315:                                              ; preds = %306, %311
  %316 = phi i1 [ %300, %306 ], [ %313, %311 ]
  br i1 %316, label %317, label %322

317:                                              ; preds = %289, %315
  %318 = load volatile float, float* %286, align 4, !tbaa !20
  %319 = addrspacecast float addrspace(3)* %122 to float*
  store volatile float %318, float* %319, align 4, !tbaa !20
  %320 = load volatile i32, i32* %291, align 4, !tbaa !16
  %321 = addrspacecast i32 addrspace(3)* %123 to i32*
  store volatile i32 %320, i32* %321, align 4, !tbaa !16
  br label %322

322:                                              ; preds = %283, %317, %315, %280
  %323 = phi float [ %318, %317 ], [ %281, %315 ], [ %281, %283 ], [ %281, %280 ]
  %324 = icmp sgt i32 %5, 15
  br i1 %324, label %325, label %364

325:                                              ; preds = %322
  %326 = add nuw nsw i32 %9, 8
  %327 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %326
  %328 = addrspacecast float addrspace(3)* %327 to float*
  %329 = load volatile float, float* %328, align 4, !tbaa !20
  %330 = fcmp contract olt float %323, %329
  br i1 %330, label %331, label %364

331:                                              ; preds = %325
  %332 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %326
  %333 = addrspacecast i32 addrspace(3)* %332 to i32*
  %334 = load volatile i32, i32* %333, align 4, !tbaa !16
  %335 = freeze i32 %334
  %336 = freeze i32 %4
  %337 = sdiv i32 %335, %336
  %338 = mul i32 %337, %336
  %339 = sub i32 %335, %338
  %340 = icmp slt i32 %7, 1
  br i1 %340, label %359, label %341

341:                                              ; preds = %331, %353
  %342 = phi i1 [ %355, %353 ], [ false, %331 ]
  %343 = phi i32 [ %354, %353 ], [ 0, %331 ]
  %344 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %343
  %345 = addrspacecast i32 addrspace(3)* %344 to i32*
  %346 = load volatile i32, i32* %345, align 4, !tbaa !16
  %347 = icmp eq i32 %346, %337
  br i1 %347, label %348, label %353

348:                                              ; preds = %341
  %349 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %343
  %350 = addrspacecast i32 addrspace(3)* %349 to i32*
  %351 = load volatile i32, i32* %350, align 4, !tbaa !16
  %352 = icmp eq i32 %351, %339
  br i1 %352, label %357, label %353

353:                                              ; preds = %348, %341
  %354 = add nuw nsw i32 %343, 1
  %355 = icmp sge i32 %354, %7
  %356 = icmp eq i32 %354, %7
  br i1 %356, label %357, label %341, !llvm.loop !25

357:                                              ; preds = %348, %353
  %358 = phi i1 [ %342, %348 ], [ %355, %353 ]
  br i1 %358, label %359, label %364

359:                                              ; preds = %331, %357
  %360 = load volatile float, float* %328, align 4, !tbaa !20
  %361 = addrspacecast float addrspace(3)* %122 to float*
  store volatile float %360, float* %361, align 4, !tbaa !20
  %362 = load volatile i32, i32* %333, align 4, !tbaa !16
  %363 = addrspacecast i32 addrspace(3)* %123 to i32*
  store volatile i32 %362, i32* %363, align 4, !tbaa !16
  br label %364

364:                                              ; preds = %325, %359, %357, %322
  %365 = phi float [ %360, %359 ], [ %323, %357 ], [ %323, %325 ], [ %323, %322 ]
  %366 = icmp sgt i32 %5, 7
  br i1 %366, label %367, label %406

367:                                              ; preds = %364
  %368 = add nuw nsw i32 %9, 4
  %369 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %368
  %370 = addrspacecast float addrspace(3)* %369 to float*
  %371 = load volatile float, float* %370, align 4, !tbaa !20
  %372 = fcmp contract olt float %365, %371
  br i1 %372, label %373, label %406

373:                                              ; preds = %367
  %374 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %368
  %375 = addrspacecast i32 addrspace(3)* %374 to i32*
  %376 = load volatile i32, i32* %375, align 4, !tbaa !16
  %377 = freeze i32 %376
  %378 = freeze i32 %4
  %379 = sdiv i32 %377, %378
  %380 = mul i32 %379, %378
  %381 = sub i32 %377, %380
  %382 = icmp slt i32 %7, 1
  br i1 %382, label %401, label %383

383:                                              ; preds = %373, %395
  %384 = phi i1 [ %397, %395 ], [ false, %373 ]
  %385 = phi i32 [ %396, %395 ], [ 0, %373 ]
  %386 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %385
  %387 = addrspacecast i32 addrspace(3)* %386 to i32*
  %388 = load volatile i32, i32* %387, align 4, !tbaa !16
  %389 = icmp eq i32 %388, %379
  br i1 %389, label %390, label %395

390:                                              ; preds = %383
  %391 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %385
  %392 = addrspacecast i32 addrspace(3)* %391 to i32*
  %393 = load volatile i32, i32* %392, align 4, !tbaa !16
  %394 = icmp eq i32 %393, %381
  br i1 %394, label %399, label %395

395:                                              ; preds = %390, %383
  %396 = add nuw nsw i32 %385, 1
  %397 = icmp sge i32 %396, %7
  %398 = icmp eq i32 %396, %7
  br i1 %398, label %399, label %383, !llvm.loop !25

399:                                              ; preds = %390, %395
  %400 = phi i1 [ %384, %390 ], [ %397, %395 ]
  br i1 %400, label %401, label %406

401:                                              ; preds = %373, %399
  %402 = load volatile float, float* %370, align 4, !tbaa !20
  %403 = addrspacecast float addrspace(3)* %122 to float*
  store volatile float %402, float* %403, align 4, !tbaa !20
  %404 = load volatile i32, i32* %375, align 4, !tbaa !16
  %405 = addrspacecast i32 addrspace(3)* %123 to i32*
  store volatile i32 %404, i32* %405, align 4, !tbaa !16
  br label %406

406:                                              ; preds = %367, %401, %399, %364
  %407 = phi float [ %402, %401 ], [ %365, %399 ], [ %365, %367 ], [ %365, %364 ]
  %408 = icmp sgt i32 %5, 3
  br i1 %408, label %409, label %448

409:                                              ; preds = %406
  %410 = add nuw nsw i32 %9, 2
  %411 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %410
  %412 = addrspacecast float addrspace(3)* %411 to float*
  %413 = load volatile float, float* %412, align 4, !tbaa !20
  %414 = fcmp contract olt float %407, %413
  br i1 %414, label %415, label %448

415:                                              ; preds = %409
  %416 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %410
  %417 = addrspacecast i32 addrspace(3)* %416 to i32*
  %418 = load volatile i32, i32* %417, align 4, !tbaa !16
  %419 = freeze i32 %418
  %420 = freeze i32 %4
  %421 = sdiv i32 %419, %420
  %422 = mul i32 %421, %420
  %423 = sub i32 %419, %422
  %424 = icmp slt i32 %7, 1
  br i1 %424, label %443, label %425

425:                                              ; preds = %415, %437
  %426 = phi i1 [ %439, %437 ], [ false, %415 ]
  %427 = phi i32 [ %438, %437 ], [ 0, %415 ]
  %428 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %427
  %429 = addrspacecast i32 addrspace(3)* %428 to i32*
  %430 = load volatile i32, i32* %429, align 4, !tbaa !16
  %431 = icmp eq i32 %430, %421
  br i1 %431, label %432, label %437

432:                                              ; preds = %425
  %433 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %427
  %434 = addrspacecast i32 addrspace(3)* %433 to i32*
  %435 = load volatile i32, i32* %434, align 4, !tbaa !16
  %436 = icmp eq i32 %435, %423
  br i1 %436, label %441, label %437

437:                                              ; preds = %432, %425
  %438 = add nuw nsw i32 %427, 1
  %439 = icmp sge i32 %438, %7
  %440 = icmp eq i32 %438, %7
  br i1 %440, label %441, label %425, !llvm.loop !25

441:                                              ; preds = %432, %437
  %442 = phi i1 [ %426, %432 ], [ %439, %437 ]
  br i1 %442, label %443, label %448

443:                                              ; preds = %415, %441
  %444 = load volatile float, float* %412, align 4, !tbaa !20
  %445 = addrspacecast float addrspace(3)* %122 to float*
  store volatile float %444, float* %445, align 4, !tbaa !20
  %446 = load volatile i32, i32* %417, align 4, !tbaa !16
  %447 = addrspacecast i32 addrspace(3)* %123 to i32*
  store volatile i32 %446, i32* %447, align 4, !tbaa !16
  br label %448

448:                                              ; preds = %409, %443, %441, %406
  %449 = phi float [ %444, %443 ], [ %407, %441 ], [ %407, %409 ], [ %407, %406 ]
  %450 = icmp sgt i32 %5, 1
  br i1 %450, label %451, label %490

451:                                              ; preds = %448
  %452 = add nuw nsw i32 %9, 1
  %453 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 %452
  %454 = addrspacecast float addrspace(3)* %453 to float*
  %455 = load volatile float, float* %454, align 4, !tbaa !20
  %456 = fcmp contract olt float %449, %455
  br i1 %456, label %457, label %490

457:                                              ; preds = %451
  %458 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 %452
  %459 = addrspacecast i32 addrspace(3)* %458 to i32*
  %460 = load volatile i32, i32* %459, align 4, !tbaa !16
  %461 = freeze i32 %460
  %462 = freeze i32 %4
  %463 = sdiv i32 %461, %462
  %464 = mul i32 %463, %462
  %465 = sub i32 %461, %464
  %466 = icmp slt i32 %7, 1
  br i1 %466, label %485, label %467

467:                                              ; preds = %457, %479
  %468 = phi i1 [ %481, %479 ], [ false, %457 ]
  %469 = phi i32 [ %480, %479 ], [ 0, %457 ]
  %470 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %469
  %471 = addrspacecast i32 addrspace(3)* %470 to i32*
  %472 = load volatile i32, i32* %471, align 4, !tbaa !16
  %473 = icmp eq i32 %472, %463
  br i1 %473, label %474, label %479

474:                                              ; preds = %467
  %475 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %469
  %476 = addrspacecast i32 addrspace(3)* %475 to i32*
  %477 = load volatile i32, i32* %476, align 4, !tbaa !16
  %478 = icmp eq i32 %477, %465
  br i1 %478, label %483, label %479

479:                                              ; preds = %474, %467
  %480 = add nuw nsw i32 %469, 1
  %481 = icmp sge i32 %480, %7
  %482 = icmp eq i32 %480, %7
  br i1 %482, label %483, label %467, !llvm.loop !25

483:                                              ; preds = %474, %479
  %484 = phi i1 [ %468, %474 ], [ %481, %479 ]
  br i1 %484, label %485, label %490

485:                                              ; preds = %457, %483
  %486 = load volatile float, float* %454, align 4, !tbaa !20
  %487 = addrspacecast float addrspace(3)* %122 to float*
  store volatile float %486, float* %487, align 4, !tbaa !20
  %488 = load volatile i32, i32* %459, align 4, !tbaa !16
  %489 = addrspacecast i32 addrspace(3)* %123 to i32*
  store volatile i32 %488, i32* %489, align 4, !tbaa !16
  br label %490

490:                                              ; preds = %451, %485, %483, %448
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %491

491:                                              ; preds = %490, %236
  %492 = icmp eq i32 %9, 0
  br i1 %492, label %493, label %503

493:                                              ; preds = %491
  %494 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE5sdata, i32 0, i32 0), align 16, !tbaa !20
  %495 = zext i32 %10 to i64
  %496 = getelementptr inbounds float, float addrspace(1)* %1, i64 %495
  store float %494, float addrspace(1)* %496, align 4, !tbaa !20
  %497 = load i32, i32 addrspace(3)* getelementptr inbounds ([256 x i32], [256 x i32] addrspace(3)* @_ZZ24reduce_max_filter_finalfPfS_PijjiS0_iE7idxData, i32 0, i32 0), align 16, !tbaa !16
  %498 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %495
  store i32 %497, i32 addrspace(1)* %498, align 4, !tbaa !16
  %499 = icmp eq i32 %26, 1
  br i1 %499, label %500, label %503

500:                                              ; preds = %493
  %501 = sext i32 %7 to i64
  %502 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %501
  store i32 %497, i32 addrspace(1)* %502, align 4, !tbaa !16
  br label %503

503:                                              ; preds = %493, %500, %491
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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
