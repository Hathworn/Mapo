; ModuleID = '../data/hip_kernels/3119/13/main.cu'
source_filename = "../data/hip_kernels/3119/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow = internal addrspace(3) global [10 x i32] undef, align 16
@_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol = internal addrspace(3) global [10 x i32] undef, align 16
@_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata = internal addrspace(3) global [256 x float] undef, align 16
@_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23reduce_max_filter_mainfPfS_PijjiS0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %5
  %12 = add i32 %11, %9
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !5
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !14, !invariant.load !15
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %5
  %27 = icmp ult i32 %9, %7
  br i1 %27, label %28, label %39

28:                                               ; preds = %8
  %29 = zext i32 %9 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !16, !amdgpu.noclobber !15
  %32 = freeze i32 %31
  %33 = freeze i32 %3
  %34 = udiv i32 %32, %33
  %35 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %9
  store i32 %34, i32 addrspace(3)* %35, align 4, !tbaa !16
  %36 = mul i32 %34, %33
  %37 = sub i32 %32, %36
  %38 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %9
  store i32 %37, i32 addrspace(3)* %38, align 4, !tbaa !16
  br label %39

39:                                               ; preds = %28, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = mul i32 %4, %3
  %41 = icmp ult i32 %12, %40
  br i1 %41, label %42, label %115

42:                                               ; preds = %39
  %43 = icmp slt i32 %7, 1
  br label %44

44:                                               ; preds = %42, %110
  %45 = phi i32 [ %12, %42 ], [ %113, %110 ]
  %46 = phi float [ 0xFFF0000000000000, %42 ], [ %112, %110 ]
  %47 = phi i32 [ undef, %42 ], [ %111, %110 ]
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !20, !amdgpu.noclobber !15
  %51 = fcmp contract olt float %46, %50
  br i1 %51, label %52, label %76

52:                                               ; preds = %44
  %53 = freeze i32 %45
  %54 = freeze i32 %3
  %55 = sdiv i32 %53, %54
  %56 = mul i32 %55, %54
  %57 = sub i32 %53, %56
  br i1 %43, label %72, label %58

58:                                               ; preds = %52, %68
  %59 = phi i1 [ %70, %68 ], [ false, %52 ]
  %60 = phi i32 [ %69, %68 ], [ 0, %52 ]
  %61 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %60
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !16
  %63 = icmp eq i32 %62, %55
  br i1 %63, label %64, label %68

64:                                               ; preds = %58
  %65 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %60
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !16
  %67 = icmp eq i32 %66, %57
  br i1 %67, label %72, label %68

68:                                               ; preds = %64, %58
  %69 = add nuw nsw i32 %60, 1
  %70 = icmp sge i32 %69, %7
  %71 = icmp eq i32 %69, %7
  br i1 %71, label %72, label %58, !llvm.loop !22

72:                                               ; preds = %64, %68, %52
  %73 = phi i1 [ true, %52 ], [ %59, %64 ], [ %70, %68 ]
  %74 = select i1 %73, i32 %45, i32 %47
  %75 = select i1 %73, float %50, float %46
  br label %76

76:                                               ; preds = %72, %44
  %77 = phi i32 [ %47, %44 ], [ %74, %72 ]
  %78 = phi float [ %46, %44 ], [ %75, %72 ]
  %79 = add i32 %45, %5
  %80 = icmp ult i32 %79, %40
  br i1 %80, label %81, label %110

81:                                               ; preds = %76
  %82 = zext i32 %79 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !20, !amdgpu.noclobber !15
  %85 = fcmp contract olt float %78, %84
  br i1 %85, label %86, label %110

86:                                               ; preds = %81
  %87 = freeze i32 %79
  %88 = freeze i32 %3
  %89 = sdiv i32 %87, %88
  %90 = mul i32 %89, %88
  %91 = sub i32 %87, %90
  br i1 %43, label %106, label %92

92:                                               ; preds = %86, %102
  %93 = phi i1 [ %104, %102 ], [ false, %86 ]
  %94 = phi i32 [ %103, %102 ], [ 0, %86 ]
  %95 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %94
  %96 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !16
  %97 = icmp eq i32 %96, %89
  br i1 %97, label %98, label %102

98:                                               ; preds = %92
  %99 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %94
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !16
  %101 = icmp eq i32 %100, %91
  br i1 %101, label %106, label %102

102:                                              ; preds = %98, %92
  %103 = add nuw nsw i32 %94, 1
  %104 = icmp sge i32 %103, %7
  %105 = icmp eq i32 %103, %7
  br i1 %105, label %106, label %92, !llvm.loop !22

106:                                              ; preds = %98, %102, %86
  %107 = phi i1 [ true, %86 ], [ %93, %98 ], [ %104, %102 ]
  %108 = select i1 %107, i32 %79, i32 %77
  %109 = select i1 %107, float %84, float %78
  br label %110

110:                                              ; preds = %106, %81, %76
  %111 = phi i32 [ %77, %81 ], [ %77, %76 ], [ %108, %106 ]
  %112 = phi float [ %78, %81 ], [ %78, %76 ], [ %109, %106 ]
  %113 = add i32 %45, %26
  %114 = icmp ult i32 %113, %40
  br i1 %114, label %44, label %115, !llvm.loop !24

115:                                              ; preds = %110, %39
  %116 = phi i32 [ undef, %39 ], [ %111, %110 ]
  %117 = phi float [ 0xFFF0000000000000, %39 ], [ %112, %110 ]
  %118 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %9
  store float %117, float addrspace(3)* %118, align 4, !tbaa !20
  %119 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %9
  store i32 %116, i32 addrspace(3)* %119, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %120 = icmp sgt i32 %5, 511
  br i1 %120, label %121, label %156

121:                                              ; preds = %115
  %122 = icmp ult i32 %9, 256
  br i1 %122, label %123, label %154

123:                                              ; preds = %121
  %124 = add nuw nsw i32 %9, 256
  %125 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %124
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !20
  %127 = fcmp contract olt float %117, %126
  br i1 %127, label %128, label %154

128:                                              ; preds = %123
  %129 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %124
  %130 = load i32, i32 addrspace(3)* %129, align 4, !tbaa !16
  %131 = freeze i32 %130
  %132 = freeze i32 %3
  %133 = sdiv i32 %131, %132
  %134 = mul i32 %133, %132
  %135 = sub i32 %131, %134
  %136 = icmp slt i32 %7, 1
  br i1 %136, label %153, label %137

137:                                              ; preds = %128, %147
  %138 = phi i1 [ %149, %147 ], [ false, %128 ]
  %139 = phi i32 [ %148, %147 ], [ 0, %128 ]
  %140 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %139
  %141 = load i32, i32 addrspace(3)* %140, align 4, !tbaa !16
  %142 = icmp eq i32 %141, %133
  br i1 %142, label %143, label %147

143:                                              ; preds = %137
  %144 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %139
  %145 = load i32, i32 addrspace(3)* %144, align 4, !tbaa !16
  %146 = icmp eq i32 %145, %135
  br i1 %146, label %151, label %147

147:                                              ; preds = %143, %137
  %148 = add nuw nsw i32 %139, 1
  %149 = icmp sge i32 %148, %7
  %150 = icmp eq i32 %148, %7
  br i1 %150, label %151, label %137, !llvm.loop !22

151:                                              ; preds = %143, %147
  %152 = phi i1 [ %138, %143 ], [ %149, %147 ]
  br i1 %152, label %153, label %154

153:                                              ; preds = %128, %151
  store float %126, float addrspace(3)* %118, align 4, !tbaa !20
  store i32 %130, i32 addrspace(3)* %119, align 4, !tbaa !16
  br label %154

154:                                              ; preds = %123, %153, %151, %121
  %155 = phi float [ %126, %153 ], [ %117, %151 ], [ %117, %123 ], [ %117, %121 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %156

156:                                              ; preds = %154, %115
  %157 = phi float [ %155, %154 ], [ %117, %115 ]
  %158 = icmp sgt i32 %5, 255
  br i1 %158, label %159, label %194

159:                                              ; preds = %156
  %160 = icmp ult i32 %9, 128
  br i1 %160, label %161, label %192

161:                                              ; preds = %159
  %162 = add nuw nsw i32 %9, 128
  %163 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %162
  %164 = load float, float addrspace(3)* %163, align 4, !tbaa !20
  %165 = fcmp contract olt float %157, %164
  br i1 %165, label %166, label %192

166:                                              ; preds = %161
  %167 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %162
  %168 = load i32, i32 addrspace(3)* %167, align 4, !tbaa !16
  %169 = freeze i32 %168
  %170 = freeze i32 %3
  %171 = sdiv i32 %169, %170
  %172 = mul i32 %171, %170
  %173 = sub i32 %169, %172
  %174 = icmp slt i32 %7, 1
  br i1 %174, label %191, label %175

175:                                              ; preds = %166, %185
  %176 = phi i1 [ %187, %185 ], [ false, %166 ]
  %177 = phi i32 [ %186, %185 ], [ 0, %166 ]
  %178 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %177
  %179 = load i32, i32 addrspace(3)* %178, align 4, !tbaa !16
  %180 = icmp eq i32 %179, %171
  br i1 %180, label %181, label %185

181:                                              ; preds = %175
  %182 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %177
  %183 = load i32, i32 addrspace(3)* %182, align 4, !tbaa !16
  %184 = icmp eq i32 %183, %173
  br i1 %184, label %189, label %185

185:                                              ; preds = %181, %175
  %186 = add nuw nsw i32 %177, 1
  %187 = icmp sge i32 %186, %7
  %188 = icmp eq i32 %186, %7
  br i1 %188, label %189, label %175, !llvm.loop !22

189:                                              ; preds = %181, %185
  %190 = phi i1 [ %176, %181 ], [ %187, %185 ]
  br i1 %190, label %191, label %192

191:                                              ; preds = %166, %189
  store float %164, float addrspace(3)* %118, align 4, !tbaa !20
  store i32 %168, i32 addrspace(3)* %119, align 4, !tbaa !16
  br label %192

192:                                              ; preds = %161, %191, %189, %159
  %193 = phi float [ %164, %191 ], [ %157, %189 ], [ %157, %161 ], [ %157, %159 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %194

194:                                              ; preds = %192, %156
  %195 = phi float [ %193, %192 ], [ %157, %156 ]
  %196 = icmp sgt i32 %5, 127
  br i1 %196, label %197, label %232

197:                                              ; preds = %194
  %198 = icmp ult i32 %9, 64
  br i1 %198, label %199, label %230

199:                                              ; preds = %197
  %200 = add nuw nsw i32 %9, 64
  %201 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %200
  %202 = load float, float addrspace(3)* %201, align 4, !tbaa !20
  %203 = fcmp contract olt float %195, %202
  br i1 %203, label %204, label %230

204:                                              ; preds = %199
  %205 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %200
  %206 = load i32, i32 addrspace(3)* %205, align 4, !tbaa !16
  %207 = freeze i32 %206
  %208 = freeze i32 %3
  %209 = sdiv i32 %207, %208
  %210 = mul i32 %209, %208
  %211 = sub i32 %207, %210
  %212 = icmp slt i32 %7, 1
  br i1 %212, label %229, label %213

213:                                              ; preds = %204, %223
  %214 = phi i1 [ %225, %223 ], [ false, %204 ]
  %215 = phi i32 [ %224, %223 ], [ 0, %204 ]
  %216 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %215
  %217 = load i32, i32 addrspace(3)* %216, align 4, !tbaa !16
  %218 = icmp eq i32 %217, %209
  br i1 %218, label %219, label %223

219:                                              ; preds = %213
  %220 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %215
  %221 = load i32, i32 addrspace(3)* %220, align 4, !tbaa !16
  %222 = icmp eq i32 %221, %211
  br i1 %222, label %227, label %223

223:                                              ; preds = %219, %213
  %224 = add nuw nsw i32 %215, 1
  %225 = icmp sge i32 %224, %7
  %226 = icmp eq i32 %224, %7
  br i1 %226, label %227, label %213, !llvm.loop !22

227:                                              ; preds = %219, %223
  %228 = phi i1 [ %214, %219 ], [ %225, %223 ]
  br i1 %228, label %229, label %230

229:                                              ; preds = %204, %227
  store float %202, float addrspace(3)* %118, align 4, !tbaa !20
  store i32 %206, i32 addrspace(3)* %119, align 4, !tbaa !16
  br label %230

230:                                              ; preds = %199, %229, %227, %197
  %231 = phi float [ %202, %229 ], [ %195, %227 ], [ %195, %199 ], [ %195, %197 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %232

232:                                              ; preds = %230, %194
  %233 = phi float [ %231, %230 ], [ %195, %194 ]
  %234 = icmp ult i32 %9, 32
  br i1 %234, label %235, label %487

235:                                              ; preds = %232
  %236 = icmp sgt i32 %5, 63
  br i1 %236, label %237, label %276

237:                                              ; preds = %235
  %238 = add nuw nsw i32 %9, 32
  %239 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %238
  %240 = addrspacecast float addrspace(3)* %239 to float*
  %241 = load volatile float, float* %240, align 4, !tbaa !20
  %242 = fcmp contract olt float %233, %241
  br i1 %242, label %243, label %276

243:                                              ; preds = %237
  %244 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %238
  %245 = addrspacecast i32 addrspace(3)* %244 to i32*
  %246 = load volatile i32, i32* %245, align 4, !tbaa !16
  %247 = freeze i32 %246
  %248 = freeze i32 %3
  %249 = sdiv i32 %247, %248
  %250 = mul i32 %249, %248
  %251 = sub i32 %247, %250
  %252 = icmp slt i32 %7, 1
  br i1 %252, label %271, label %253

253:                                              ; preds = %243, %265
  %254 = phi i1 [ %267, %265 ], [ false, %243 ]
  %255 = phi i32 [ %266, %265 ], [ 0, %243 ]
  %256 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %255
  %257 = addrspacecast i32 addrspace(3)* %256 to i32*
  %258 = load volatile i32, i32* %257, align 4, !tbaa !16
  %259 = icmp eq i32 %258, %249
  br i1 %259, label %260, label %265

260:                                              ; preds = %253
  %261 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %255
  %262 = addrspacecast i32 addrspace(3)* %261 to i32*
  %263 = load volatile i32, i32* %262, align 4, !tbaa !16
  %264 = icmp eq i32 %263, %251
  br i1 %264, label %269, label %265

265:                                              ; preds = %260, %253
  %266 = add nuw nsw i32 %255, 1
  %267 = icmp sge i32 %266, %7
  %268 = icmp eq i32 %266, %7
  br i1 %268, label %269, label %253, !llvm.loop !25

269:                                              ; preds = %260, %265
  %270 = phi i1 [ %254, %260 ], [ %267, %265 ]
  br i1 %270, label %271, label %276

271:                                              ; preds = %243, %269
  %272 = load volatile float, float* %240, align 4, !tbaa !20
  %273 = addrspacecast float addrspace(3)* %118 to float*
  store volatile float %272, float* %273, align 4, !tbaa !20
  %274 = load volatile i32, i32* %245, align 4, !tbaa !16
  %275 = addrspacecast i32 addrspace(3)* %119 to i32*
  store volatile i32 %274, i32* %275, align 4, !tbaa !16
  br label %276

276:                                              ; preds = %237, %271, %269, %235
  %277 = phi float [ %272, %271 ], [ %233, %269 ], [ %233, %237 ], [ %233, %235 ]
  %278 = icmp sgt i32 %5, 31
  br i1 %278, label %279, label %318

279:                                              ; preds = %276
  %280 = add nuw nsw i32 %9, 16
  %281 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %280
  %282 = addrspacecast float addrspace(3)* %281 to float*
  %283 = load volatile float, float* %282, align 4, !tbaa !20
  %284 = fcmp contract olt float %277, %283
  br i1 %284, label %285, label %318

285:                                              ; preds = %279
  %286 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %280
  %287 = addrspacecast i32 addrspace(3)* %286 to i32*
  %288 = load volatile i32, i32* %287, align 4, !tbaa !16
  %289 = freeze i32 %288
  %290 = freeze i32 %3
  %291 = sdiv i32 %289, %290
  %292 = mul i32 %291, %290
  %293 = sub i32 %289, %292
  %294 = icmp slt i32 %7, 1
  br i1 %294, label %313, label %295

295:                                              ; preds = %285, %307
  %296 = phi i1 [ %309, %307 ], [ false, %285 ]
  %297 = phi i32 [ %308, %307 ], [ 0, %285 ]
  %298 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %297
  %299 = addrspacecast i32 addrspace(3)* %298 to i32*
  %300 = load volatile i32, i32* %299, align 4, !tbaa !16
  %301 = icmp eq i32 %300, %291
  br i1 %301, label %302, label %307

302:                                              ; preds = %295
  %303 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %297
  %304 = addrspacecast i32 addrspace(3)* %303 to i32*
  %305 = load volatile i32, i32* %304, align 4, !tbaa !16
  %306 = icmp eq i32 %305, %293
  br i1 %306, label %311, label %307

307:                                              ; preds = %302, %295
  %308 = add nuw nsw i32 %297, 1
  %309 = icmp sge i32 %308, %7
  %310 = icmp eq i32 %308, %7
  br i1 %310, label %311, label %295, !llvm.loop !25

311:                                              ; preds = %302, %307
  %312 = phi i1 [ %296, %302 ], [ %309, %307 ]
  br i1 %312, label %313, label %318

313:                                              ; preds = %285, %311
  %314 = load volatile float, float* %282, align 4, !tbaa !20
  %315 = addrspacecast float addrspace(3)* %118 to float*
  store volatile float %314, float* %315, align 4, !tbaa !20
  %316 = load volatile i32, i32* %287, align 4, !tbaa !16
  %317 = addrspacecast i32 addrspace(3)* %119 to i32*
  store volatile i32 %316, i32* %317, align 4, !tbaa !16
  br label %318

318:                                              ; preds = %279, %313, %311, %276
  %319 = phi float [ %314, %313 ], [ %277, %311 ], [ %277, %279 ], [ %277, %276 ]
  %320 = icmp sgt i32 %5, 15
  br i1 %320, label %321, label %360

321:                                              ; preds = %318
  %322 = add nuw nsw i32 %9, 8
  %323 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %322
  %324 = addrspacecast float addrspace(3)* %323 to float*
  %325 = load volatile float, float* %324, align 4, !tbaa !20
  %326 = fcmp contract olt float %319, %325
  br i1 %326, label %327, label %360

327:                                              ; preds = %321
  %328 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %322
  %329 = addrspacecast i32 addrspace(3)* %328 to i32*
  %330 = load volatile i32, i32* %329, align 4, !tbaa !16
  %331 = freeze i32 %330
  %332 = freeze i32 %3
  %333 = sdiv i32 %331, %332
  %334 = mul i32 %333, %332
  %335 = sub i32 %331, %334
  %336 = icmp slt i32 %7, 1
  br i1 %336, label %355, label %337

337:                                              ; preds = %327, %349
  %338 = phi i1 [ %351, %349 ], [ false, %327 ]
  %339 = phi i32 [ %350, %349 ], [ 0, %327 ]
  %340 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %339
  %341 = addrspacecast i32 addrspace(3)* %340 to i32*
  %342 = load volatile i32, i32* %341, align 4, !tbaa !16
  %343 = icmp eq i32 %342, %333
  br i1 %343, label %344, label %349

344:                                              ; preds = %337
  %345 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %339
  %346 = addrspacecast i32 addrspace(3)* %345 to i32*
  %347 = load volatile i32, i32* %346, align 4, !tbaa !16
  %348 = icmp eq i32 %347, %335
  br i1 %348, label %353, label %349

349:                                              ; preds = %344, %337
  %350 = add nuw nsw i32 %339, 1
  %351 = icmp sge i32 %350, %7
  %352 = icmp eq i32 %350, %7
  br i1 %352, label %353, label %337, !llvm.loop !25

353:                                              ; preds = %344, %349
  %354 = phi i1 [ %338, %344 ], [ %351, %349 ]
  br i1 %354, label %355, label %360

355:                                              ; preds = %327, %353
  %356 = load volatile float, float* %324, align 4, !tbaa !20
  %357 = addrspacecast float addrspace(3)* %118 to float*
  store volatile float %356, float* %357, align 4, !tbaa !20
  %358 = load volatile i32, i32* %329, align 4, !tbaa !16
  %359 = addrspacecast i32 addrspace(3)* %119 to i32*
  store volatile i32 %358, i32* %359, align 4, !tbaa !16
  br label %360

360:                                              ; preds = %321, %355, %353, %318
  %361 = phi float [ %356, %355 ], [ %319, %353 ], [ %319, %321 ], [ %319, %318 ]
  %362 = icmp sgt i32 %5, 7
  br i1 %362, label %363, label %402

363:                                              ; preds = %360
  %364 = add nuw nsw i32 %9, 4
  %365 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %364
  %366 = addrspacecast float addrspace(3)* %365 to float*
  %367 = load volatile float, float* %366, align 4, !tbaa !20
  %368 = fcmp contract olt float %361, %367
  br i1 %368, label %369, label %402

369:                                              ; preds = %363
  %370 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %364
  %371 = addrspacecast i32 addrspace(3)* %370 to i32*
  %372 = load volatile i32, i32* %371, align 4, !tbaa !16
  %373 = freeze i32 %372
  %374 = freeze i32 %3
  %375 = sdiv i32 %373, %374
  %376 = mul i32 %375, %374
  %377 = sub i32 %373, %376
  %378 = icmp slt i32 %7, 1
  br i1 %378, label %397, label %379

379:                                              ; preds = %369, %391
  %380 = phi i1 [ %393, %391 ], [ false, %369 ]
  %381 = phi i32 [ %392, %391 ], [ 0, %369 ]
  %382 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %381
  %383 = addrspacecast i32 addrspace(3)* %382 to i32*
  %384 = load volatile i32, i32* %383, align 4, !tbaa !16
  %385 = icmp eq i32 %384, %375
  br i1 %385, label %386, label %391

386:                                              ; preds = %379
  %387 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %381
  %388 = addrspacecast i32 addrspace(3)* %387 to i32*
  %389 = load volatile i32, i32* %388, align 4, !tbaa !16
  %390 = icmp eq i32 %389, %377
  br i1 %390, label %395, label %391

391:                                              ; preds = %386, %379
  %392 = add nuw nsw i32 %381, 1
  %393 = icmp sge i32 %392, %7
  %394 = icmp eq i32 %392, %7
  br i1 %394, label %395, label %379, !llvm.loop !25

395:                                              ; preds = %386, %391
  %396 = phi i1 [ %380, %386 ], [ %393, %391 ]
  br i1 %396, label %397, label %402

397:                                              ; preds = %369, %395
  %398 = load volatile float, float* %366, align 4, !tbaa !20
  %399 = addrspacecast float addrspace(3)* %118 to float*
  store volatile float %398, float* %399, align 4, !tbaa !20
  %400 = load volatile i32, i32* %371, align 4, !tbaa !16
  %401 = addrspacecast i32 addrspace(3)* %119 to i32*
  store volatile i32 %400, i32* %401, align 4, !tbaa !16
  br label %402

402:                                              ; preds = %363, %397, %395, %360
  %403 = phi float [ %398, %397 ], [ %361, %395 ], [ %361, %363 ], [ %361, %360 ]
  %404 = icmp sgt i32 %5, 3
  br i1 %404, label %405, label %444

405:                                              ; preds = %402
  %406 = add nuw nsw i32 %9, 2
  %407 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %406
  %408 = addrspacecast float addrspace(3)* %407 to float*
  %409 = load volatile float, float* %408, align 4, !tbaa !20
  %410 = fcmp contract olt float %403, %409
  br i1 %410, label %411, label %444

411:                                              ; preds = %405
  %412 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %406
  %413 = addrspacecast i32 addrspace(3)* %412 to i32*
  %414 = load volatile i32, i32* %413, align 4, !tbaa !16
  %415 = freeze i32 %414
  %416 = freeze i32 %3
  %417 = sdiv i32 %415, %416
  %418 = mul i32 %417, %416
  %419 = sub i32 %415, %418
  %420 = icmp slt i32 %7, 1
  br i1 %420, label %439, label %421

421:                                              ; preds = %411, %433
  %422 = phi i1 [ %435, %433 ], [ false, %411 ]
  %423 = phi i32 [ %434, %433 ], [ 0, %411 ]
  %424 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %423
  %425 = addrspacecast i32 addrspace(3)* %424 to i32*
  %426 = load volatile i32, i32* %425, align 4, !tbaa !16
  %427 = icmp eq i32 %426, %417
  br i1 %427, label %428, label %433

428:                                              ; preds = %421
  %429 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %423
  %430 = addrspacecast i32 addrspace(3)* %429 to i32*
  %431 = load volatile i32, i32* %430, align 4, !tbaa !16
  %432 = icmp eq i32 %431, %419
  br i1 %432, label %437, label %433

433:                                              ; preds = %428, %421
  %434 = add nuw nsw i32 %423, 1
  %435 = icmp sge i32 %434, %7
  %436 = icmp eq i32 %434, %7
  br i1 %436, label %437, label %421, !llvm.loop !25

437:                                              ; preds = %428, %433
  %438 = phi i1 [ %422, %428 ], [ %435, %433 ]
  br i1 %438, label %439, label %444

439:                                              ; preds = %411, %437
  %440 = load volatile float, float* %408, align 4, !tbaa !20
  %441 = addrspacecast float addrspace(3)* %118 to float*
  store volatile float %440, float* %441, align 4, !tbaa !20
  %442 = load volatile i32, i32* %413, align 4, !tbaa !16
  %443 = addrspacecast i32 addrspace(3)* %119 to i32*
  store volatile i32 %442, i32* %443, align 4, !tbaa !16
  br label %444

444:                                              ; preds = %405, %439, %437, %402
  %445 = phi float [ %440, %439 ], [ %403, %437 ], [ %403, %405 ], [ %403, %402 ]
  %446 = icmp sgt i32 %5, 1
  br i1 %446, label %447, label %486

447:                                              ; preds = %444
  %448 = add nuw nsw i32 %9, 1
  %449 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 %448
  %450 = addrspacecast float addrspace(3)* %449 to float*
  %451 = load volatile float, float* %450, align 4, !tbaa !20
  %452 = fcmp contract olt float %445, %451
  br i1 %452, label %453, label %486

453:                                              ; preds = %447
  %454 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 %448
  %455 = addrspacecast i32 addrspace(3)* %454 to i32*
  %456 = load volatile i32, i32* %455, align 4, !tbaa !16
  %457 = freeze i32 %456
  %458 = freeze i32 %3
  %459 = sdiv i32 %457, %458
  %460 = mul i32 %459, %458
  %461 = sub i32 %457, %460
  %462 = icmp slt i32 %7, 1
  br i1 %462, label %481, label %463

463:                                              ; preds = %453, %475
  %464 = phi i1 [ %477, %475 ], [ false, %453 ]
  %465 = phi i32 [ %476, %475 ], [ 0, %453 ]
  %466 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesRow, i32 0, i32 %465
  %467 = addrspacecast i32 addrspace(3)* %466 to i32*
  %468 = load volatile i32, i32* %467, align 4, !tbaa !16
  %469 = icmp eq i32 %468, %459
  br i1 %469, label %470, label %475

470:                                              ; preds = %463
  %471 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE9smaxesCol, i32 0, i32 %465
  %472 = addrspacecast i32 addrspace(3)* %471 to i32*
  %473 = load volatile i32, i32* %472, align 4, !tbaa !16
  %474 = icmp eq i32 %473, %461
  br i1 %474, label %479, label %475

475:                                              ; preds = %470, %463
  %476 = add nuw nsw i32 %465, 1
  %477 = icmp sge i32 %476, %7
  %478 = icmp eq i32 %476, %7
  br i1 %478, label %479, label %463, !llvm.loop !25

479:                                              ; preds = %470, %475
  %480 = phi i1 [ %464, %470 ], [ %477, %475 ]
  br i1 %480, label %481, label %486

481:                                              ; preds = %453, %479
  %482 = load volatile float, float* %450, align 4, !tbaa !20
  %483 = addrspacecast float addrspace(3)* %118 to float*
  store volatile float %482, float* %483, align 4, !tbaa !20
  %484 = load volatile i32, i32* %455, align 4, !tbaa !16
  %485 = addrspacecast i32 addrspace(3)* %119 to i32*
  store volatile i32 %484, i32* %485, align 4, !tbaa !16
  br label %486

486:                                              ; preds = %447, %481, %479, %444
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %487

487:                                              ; preds = %486, %232
  %488 = icmp eq i32 %9, 0
  br i1 %488, label %489, label %499

489:                                              ; preds = %487
  %490 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE5sdata, i32 0, i32 0), align 16, !tbaa !20
  %491 = zext i32 %10 to i64
  %492 = getelementptr inbounds float, float addrspace(1)* %1, i64 %491
  store float %490, float addrspace(1)* %492, align 4, !tbaa !20
  %493 = load i32, i32 addrspace(3)* getelementptr inbounds ([256 x i32], [256 x i32] addrspace(3)* @_ZZ23reduce_max_filter_mainfPfS_PijjiS0_iE7idxData, i32 0, i32 0), align 16, !tbaa !16
  %494 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %491
  store i32 %493, i32 addrspace(1)* %494, align 4, !tbaa !16
  %495 = icmp eq i32 %25, 1
  br i1 %495, label %496, label %499

496:                                              ; preds = %489
  %497 = sext i32 %7 to i64
  %498 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %497
  store i32 %493, i32 addrspace(1)* %498, align 4, !tbaa !16
  br label %499

499:                                              ; preds = %489, %496, %487
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
