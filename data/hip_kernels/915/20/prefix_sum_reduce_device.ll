; ModuleID = '../data/hip_kernels/915/20/main.cu'
source_filename = "../data/hip_kernels/915/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17prefix_sum_reducePjS_jE10data_block = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17prefix_sum_reducePjS_j(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = lshr i32 %2, 9
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = icmp ult i32 %5, %4
  br i1 %6, label %7, label %1349

7:                                                ; preds = %3
  %8 = shl i32 %5, 9
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = add i32 %8, %9
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %9
  store i32 %13, i32 addrspace(3)* %14, align 4, !tbaa !5
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !10, !invariant.load !9
  %19 = zext i16 %18 to i32
  %20 = add i32 %10, %19
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = add nuw nsw i32 %9, %19
  %25 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %24
  store i32 %23, i32 addrspace(3)* %25, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = add nuw nsw i32 %19, 511
  %27 = lshr i32 %26, 1
  %28 = add nsw i32 %27, -1
  %29 = and i32 %27, 3
  %30 = icmp ult i32 %28, 3
  br i1 %30, label %33, label %31

31:                                               ; preds = %7
  %32 = and i32 %27, 2044
  br label %631

33:                                               ; preds = %684, %7
  %34 = phi i32 [ 0, %7 ], [ %685, %684 ]
  %35 = icmp eq i32 %29, 0
  br i1 %35, label %54, label %36

36:                                               ; preds = %33, %50
  %37 = phi i32 [ %51, %50 ], [ %34, %33 ]
  %38 = phi i32 [ %52, %50 ], [ 0, %33 ]
  %39 = mul nuw nsw i32 %37, %19
  %40 = add nuw nsw i32 %39, %9
  %41 = shl nuw i32 %40, 1
  %42 = icmp ult i32 %40, 256
  br i1 %42, label %43, label %50

43:                                               ; preds = %36
  %44 = add nuw nsw i32 %41, 1
  %45 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %41
  %46 = load i32, i32 addrspace(3)* %45, align 8, !tbaa !5
  %47 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %44
  %48 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !5
  %49 = add i32 %48, %46
  store i32 %49, i32 addrspace(3)* %47, align 4, !tbaa !5
  br label %50

50:                                               ; preds = %43, %36
  %51 = add nuw nsw i32 %37, 1
  %52 = add i32 %38, 1
  %53 = icmp eq i32 %52, %29
  br i1 %53, label %54, label %36, !llvm.loop !11

54:                                               ; preds = %50, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = lshr i32 %26, 2
  %56 = add nsw i32 %55, -1
  %57 = and i32 %55, 3
  %58 = icmp ult i32 %56, 3
  br i1 %58, label %122, label %59

59:                                               ; preds = %54
  %60 = and i32 %55, 1020
  br label %61

61:                                               ; preds = %118, %59
  %62 = phi i32 [ 0, %59 ], [ %119, %118 ]
  %63 = phi i32 [ 0, %59 ], [ %120, %118 ]
  %64 = mul nuw nsw i32 %62, %19
  %65 = add nuw nsw i32 %64, %9
  %66 = shl i32 %65, 2
  %67 = icmp ult i32 %66, 509
  br i1 %67, label %68, label %76

68:                                               ; preds = %61
  %69 = add nuw nsw i32 %66, 3
  %70 = add nuw nsw i32 %66, 1
  %71 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %70
  %72 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !5
  %73 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %69
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !5
  %75 = add i32 %74, %72
  store i32 %75, i32 addrspace(3)* %73, align 4, !tbaa !5
  br label %76

76:                                               ; preds = %68, %61
  %77 = or i32 %62, 1
  %78 = mul nuw nsw i32 %77, %19
  %79 = add nuw nsw i32 %78, %9
  %80 = shl i32 %79, 2
  %81 = icmp ult i32 %80, 509
  br i1 %81, label %82, label %90

82:                                               ; preds = %76
  %83 = add nuw nsw i32 %80, 3
  %84 = add nuw nsw i32 %80, 1
  %85 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %84
  %86 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !5
  %87 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %83
  %88 = load i32, i32 addrspace(3)* %87, align 4, !tbaa !5
  %89 = add i32 %88, %86
  store i32 %89, i32 addrspace(3)* %87, align 4, !tbaa !5
  br label %90

90:                                               ; preds = %82, %76
  %91 = or i32 %62, 2
  %92 = mul nuw nsw i32 %91, %19
  %93 = add nuw nsw i32 %92, %9
  %94 = shl i32 %93, 2
  %95 = icmp ult i32 %94, 509
  br i1 %95, label %96, label %104

96:                                               ; preds = %90
  %97 = add nuw nsw i32 %94, 3
  %98 = add nuw nsw i32 %94, 1
  %99 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %98
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !5
  %101 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %97
  %102 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !5
  %103 = add i32 %102, %100
  store i32 %103, i32 addrspace(3)* %101, align 4, !tbaa !5
  br label %104

104:                                              ; preds = %96, %90
  %105 = or i32 %62, 3
  %106 = mul nuw nsw i32 %105, %19
  %107 = add nuw nsw i32 %106, %9
  %108 = shl i32 %107, 2
  %109 = icmp ult i32 %108, 509
  br i1 %109, label %110, label %118

110:                                              ; preds = %104
  %111 = add nuw nsw i32 %108, 3
  %112 = add nuw nsw i32 %108, 1
  %113 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %112
  %114 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !5
  %115 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %111
  %116 = load i32, i32 addrspace(3)* %115, align 4, !tbaa !5
  %117 = add i32 %116, %114
  store i32 %117, i32 addrspace(3)* %115, align 4, !tbaa !5
  br label %118

118:                                              ; preds = %110, %104
  %119 = add nuw nsw i32 %62, 4
  %120 = add nuw nsw i32 %63, 4
  %121 = icmp eq i32 %120, %60
  br i1 %121, label %122, label %61, !llvm.loop !13

122:                                              ; preds = %118, %54
  %123 = phi i32 [ 0, %54 ], [ %119, %118 ]
  %124 = icmp eq i32 %57, 0
  br i1 %124, label %144, label %125

125:                                              ; preds = %122, %140
  %126 = phi i32 [ %141, %140 ], [ %123, %122 ]
  %127 = phi i32 [ %142, %140 ], [ 0, %122 ]
  %128 = mul nuw nsw i32 %126, %19
  %129 = add nuw nsw i32 %128, %9
  %130 = shl i32 %129, 2
  %131 = icmp ult i32 %130, 509
  br i1 %131, label %132, label %140

132:                                              ; preds = %125
  %133 = add nuw nsw i32 %130, 3
  %134 = add nuw nsw i32 %130, 1
  %135 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %134
  %136 = load i32, i32 addrspace(3)* %135, align 4, !tbaa !5
  %137 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %133
  %138 = load i32, i32 addrspace(3)* %137, align 4, !tbaa !5
  %139 = add i32 %138, %136
  store i32 %139, i32 addrspace(3)* %137, align 4, !tbaa !5
  br label %140

140:                                              ; preds = %132, %125
  %141 = add nuw nsw i32 %126, 1
  %142 = add i32 %127, 1
  %143 = icmp eq i32 %142, %57
  br i1 %143, label %144, label %125, !llvm.loop !15

144:                                              ; preds = %140, %122
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %145 = lshr i32 %26, 3
  %146 = add nsw i32 %145, -1
  %147 = and i32 %145, 3
  %148 = icmp ult i32 %146, 3
  br i1 %148, label %212, label %149

149:                                              ; preds = %144
  %150 = and i32 %145, 508
  br label %151

151:                                              ; preds = %208, %149
  %152 = phi i32 [ 0, %149 ], [ %209, %208 ]
  %153 = phi i32 [ 0, %149 ], [ %210, %208 ]
  %154 = mul nuw nsw i32 %152, %19
  %155 = add nuw nsw i32 %154, %9
  %156 = shl i32 %155, 3
  %157 = icmp ult i32 %156, 505
  br i1 %157, label %158, label %166

158:                                              ; preds = %151
  %159 = add nuw nsw i32 %156, 7
  %160 = add nuw nsw i32 %156, 3
  %161 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %160
  %162 = load i32, i32 addrspace(3)* %161, align 4, !tbaa !5
  %163 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %159
  %164 = load i32, i32 addrspace(3)* %163, align 4, !tbaa !5
  %165 = add i32 %164, %162
  store i32 %165, i32 addrspace(3)* %163, align 4, !tbaa !5
  br label %166

166:                                              ; preds = %158, %151
  %167 = or i32 %152, 1
  %168 = mul nuw nsw i32 %167, %19
  %169 = add nuw nsw i32 %168, %9
  %170 = shl i32 %169, 3
  %171 = icmp ult i32 %170, 505
  br i1 %171, label %172, label %180

172:                                              ; preds = %166
  %173 = add nuw nsw i32 %170, 7
  %174 = add nuw nsw i32 %170, 3
  %175 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %174
  %176 = load i32, i32 addrspace(3)* %175, align 4, !tbaa !5
  %177 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %173
  %178 = load i32, i32 addrspace(3)* %177, align 4, !tbaa !5
  %179 = add i32 %178, %176
  store i32 %179, i32 addrspace(3)* %177, align 4, !tbaa !5
  br label %180

180:                                              ; preds = %172, %166
  %181 = or i32 %152, 2
  %182 = mul nuw nsw i32 %181, %19
  %183 = add nuw nsw i32 %182, %9
  %184 = shl i32 %183, 3
  %185 = icmp ult i32 %184, 505
  br i1 %185, label %186, label %194

186:                                              ; preds = %180
  %187 = add nuw nsw i32 %184, 7
  %188 = add nuw nsw i32 %184, 3
  %189 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %188
  %190 = load i32, i32 addrspace(3)* %189, align 4, !tbaa !5
  %191 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %187
  %192 = load i32, i32 addrspace(3)* %191, align 4, !tbaa !5
  %193 = add i32 %192, %190
  store i32 %193, i32 addrspace(3)* %191, align 4, !tbaa !5
  br label %194

194:                                              ; preds = %186, %180
  %195 = or i32 %152, 3
  %196 = mul nuw nsw i32 %195, %19
  %197 = add nuw nsw i32 %196, %9
  %198 = shl i32 %197, 3
  %199 = icmp ult i32 %198, 505
  br i1 %199, label %200, label %208

200:                                              ; preds = %194
  %201 = add nuw nsw i32 %198, 7
  %202 = add nuw nsw i32 %198, 3
  %203 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %202
  %204 = load i32, i32 addrspace(3)* %203, align 4, !tbaa !5
  %205 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %201
  %206 = load i32, i32 addrspace(3)* %205, align 4, !tbaa !5
  %207 = add i32 %206, %204
  store i32 %207, i32 addrspace(3)* %205, align 4, !tbaa !5
  br label %208

208:                                              ; preds = %200, %194
  %209 = add nuw nsw i32 %152, 4
  %210 = add nuw nsw i32 %153, 4
  %211 = icmp eq i32 %210, %150
  br i1 %211, label %212, label %151, !llvm.loop !13

212:                                              ; preds = %208, %144
  %213 = phi i32 [ 0, %144 ], [ %209, %208 ]
  %214 = icmp eq i32 %147, 0
  br i1 %214, label %234, label %215

215:                                              ; preds = %212, %230
  %216 = phi i32 [ %231, %230 ], [ %213, %212 ]
  %217 = phi i32 [ %232, %230 ], [ 0, %212 ]
  %218 = mul nuw nsw i32 %216, %19
  %219 = add nuw nsw i32 %218, %9
  %220 = shl i32 %219, 3
  %221 = icmp ult i32 %220, 505
  br i1 %221, label %222, label %230

222:                                              ; preds = %215
  %223 = add nuw nsw i32 %220, 7
  %224 = add nuw nsw i32 %220, 3
  %225 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %224
  %226 = load i32, i32 addrspace(3)* %225, align 4, !tbaa !5
  %227 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %223
  %228 = load i32, i32 addrspace(3)* %227, align 4, !tbaa !5
  %229 = add i32 %228, %226
  store i32 %229, i32 addrspace(3)* %227, align 4, !tbaa !5
  br label %230

230:                                              ; preds = %222, %215
  %231 = add nuw nsw i32 %216, 1
  %232 = add i32 %217, 1
  %233 = icmp eq i32 %232, %147
  br i1 %233, label %234, label %215, !llvm.loop !16

234:                                              ; preds = %230, %212
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %235 = lshr i32 %26, 4
  %236 = add nsw i32 %235, -1
  %237 = and i32 %235, 3
  %238 = icmp ult i32 %236, 3
  br i1 %238, label %302, label %239

239:                                              ; preds = %234
  %240 = and i32 %235, 252
  br label %241

241:                                              ; preds = %298, %239
  %242 = phi i32 [ 0, %239 ], [ %299, %298 ]
  %243 = phi i32 [ 0, %239 ], [ %300, %298 ]
  %244 = mul nuw nsw i32 %242, %19
  %245 = add nuw nsw i32 %244, %9
  %246 = shl i32 %245, 4
  %247 = icmp ult i32 %246, 497
  br i1 %247, label %248, label %256

248:                                              ; preds = %241
  %249 = add nuw nsw i32 %246, 15
  %250 = add nuw nsw i32 %246, 7
  %251 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %250
  %252 = load i32, i32 addrspace(3)* %251, align 4, !tbaa !5
  %253 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %249
  %254 = load i32, i32 addrspace(3)* %253, align 4, !tbaa !5
  %255 = add i32 %254, %252
  store i32 %255, i32 addrspace(3)* %253, align 4, !tbaa !5
  br label %256

256:                                              ; preds = %248, %241
  %257 = or i32 %242, 1
  %258 = mul nuw nsw i32 %257, %19
  %259 = add nuw nsw i32 %258, %9
  %260 = shl i32 %259, 4
  %261 = icmp ult i32 %260, 497
  br i1 %261, label %262, label %270

262:                                              ; preds = %256
  %263 = add nuw nsw i32 %260, 15
  %264 = add nuw nsw i32 %260, 7
  %265 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %264
  %266 = load i32, i32 addrspace(3)* %265, align 4, !tbaa !5
  %267 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %263
  %268 = load i32, i32 addrspace(3)* %267, align 4, !tbaa !5
  %269 = add i32 %268, %266
  store i32 %269, i32 addrspace(3)* %267, align 4, !tbaa !5
  br label %270

270:                                              ; preds = %262, %256
  %271 = or i32 %242, 2
  %272 = mul nuw nsw i32 %271, %19
  %273 = add nuw nsw i32 %272, %9
  %274 = shl i32 %273, 4
  %275 = icmp ult i32 %274, 497
  br i1 %275, label %276, label %284

276:                                              ; preds = %270
  %277 = add nuw nsw i32 %274, 15
  %278 = add nuw nsw i32 %274, 7
  %279 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %278
  %280 = load i32, i32 addrspace(3)* %279, align 4, !tbaa !5
  %281 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %277
  %282 = load i32, i32 addrspace(3)* %281, align 4, !tbaa !5
  %283 = add i32 %282, %280
  store i32 %283, i32 addrspace(3)* %281, align 4, !tbaa !5
  br label %284

284:                                              ; preds = %276, %270
  %285 = or i32 %242, 3
  %286 = mul nuw nsw i32 %285, %19
  %287 = add nuw nsw i32 %286, %9
  %288 = shl i32 %287, 4
  %289 = icmp ult i32 %288, 497
  br i1 %289, label %290, label %298

290:                                              ; preds = %284
  %291 = add nuw nsw i32 %288, 15
  %292 = add nuw nsw i32 %288, 7
  %293 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %292
  %294 = load i32, i32 addrspace(3)* %293, align 4, !tbaa !5
  %295 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %291
  %296 = load i32, i32 addrspace(3)* %295, align 4, !tbaa !5
  %297 = add i32 %296, %294
  store i32 %297, i32 addrspace(3)* %295, align 4, !tbaa !5
  br label %298

298:                                              ; preds = %290, %284
  %299 = add nuw nsw i32 %242, 4
  %300 = add nuw nsw i32 %243, 4
  %301 = icmp eq i32 %300, %240
  br i1 %301, label %302, label %241, !llvm.loop !13

302:                                              ; preds = %298, %234
  %303 = phi i32 [ 0, %234 ], [ %299, %298 ]
  %304 = icmp eq i32 %237, 0
  br i1 %304, label %324, label %305

305:                                              ; preds = %302, %320
  %306 = phi i32 [ %321, %320 ], [ %303, %302 ]
  %307 = phi i32 [ %322, %320 ], [ 0, %302 ]
  %308 = mul nuw nsw i32 %306, %19
  %309 = add nuw nsw i32 %308, %9
  %310 = shl i32 %309, 4
  %311 = icmp ult i32 %310, 497
  br i1 %311, label %312, label %320

312:                                              ; preds = %305
  %313 = add nuw nsw i32 %310, 15
  %314 = add nuw nsw i32 %310, 7
  %315 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %314
  %316 = load i32, i32 addrspace(3)* %315, align 4, !tbaa !5
  %317 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %313
  %318 = load i32, i32 addrspace(3)* %317, align 4, !tbaa !5
  %319 = add i32 %318, %316
  store i32 %319, i32 addrspace(3)* %317, align 4, !tbaa !5
  br label %320

320:                                              ; preds = %312, %305
  %321 = add nuw nsw i32 %306, 1
  %322 = add i32 %307, 1
  %323 = icmp eq i32 %322, %237
  br i1 %323, label %324, label %305, !llvm.loop !17

324:                                              ; preds = %320, %302
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %325 = lshr i32 %26, 5
  %326 = add nsw i32 %325, -1
  %327 = and i32 %325, 3
  %328 = icmp ult i32 %326, 3
  br i1 %328, label %392, label %329

329:                                              ; preds = %324
  %330 = and i32 %325, 124
  br label %331

331:                                              ; preds = %388, %329
  %332 = phi i32 [ 0, %329 ], [ %389, %388 ]
  %333 = phi i32 [ 0, %329 ], [ %390, %388 ]
  %334 = mul nuw nsw i32 %332, %19
  %335 = add nuw nsw i32 %334, %9
  %336 = shl i32 %335, 5
  %337 = icmp ult i32 %336, 481
  br i1 %337, label %338, label %346

338:                                              ; preds = %331
  %339 = add nuw nsw i32 %336, 31
  %340 = add nuw nsw i32 %336, 15
  %341 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %340
  %342 = load i32, i32 addrspace(3)* %341, align 4, !tbaa !5
  %343 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %339
  %344 = load i32, i32 addrspace(3)* %343, align 4, !tbaa !5
  %345 = add i32 %344, %342
  store i32 %345, i32 addrspace(3)* %343, align 4, !tbaa !5
  br label %346

346:                                              ; preds = %338, %331
  %347 = or i32 %332, 1
  %348 = mul nuw nsw i32 %347, %19
  %349 = add nuw nsw i32 %348, %9
  %350 = shl i32 %349, 5
  %351 = icmp ult i32 %350, 481
  br i1 %351, label %352, label %360

352:                                              ; preds = %346
  %353 = add nuw nsw i32 %350, 31
  %354 = add nuw nsw i32 %350, 15
  %355 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %354
  %356 = load i32, i32 addrspace(3)* %355, align 4, !tbaa !5
  %357 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %353
  %358 = load i32, i32 addrspace(3)* %357, align 4, !tbaa !5
  %359 = add i32 %358, %356
  store i32 %359, i32 addrspace(3)* %357, align 4, !tbaa !5
  br label %360

360:                                              ; preds = %352, %346
  %361 = or i32 %332, 2
  %362 = mul nuw nsw i32 %361, %19
  %363 = add nuw nsw i32 %362, %9
  %364 = shl i32 %363, 5
  %365 = icmp ult i32 %364, 481
  br i1 %365, label %366, label %374

366:                                              ; preds = %360
  %367 = add nuw nsw i32 %364, 31
  %368 = add nuw nsw i32 %364, 15
  %369 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %368
  %370 = load i32, i32 addrspace(3)* %369, align 4, !tbaa !5
  %371 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %367
  %372 = load i32, i32 addrspace(3)* %371, align 4, !tbaa !5
  %373 = add i32 %372, %370
  store i32 %373, i32 addrspace(3)* %371, align 4, !tbaa !5
  br label %374

374:                                              ; preds = %366, %360
  %375 = or i32 %332, 3
  %376 = mul nuw nsw i32 %375, %19
  %377 = add nuw nsw i32 %376, %9
  %378 = shl i32 %377, 5
  %379 = icmp ult i32 %378, 481
  br i1 %379, label %380, label %388

380:                                              ; preds = %374
  %381 = add nuw nsw i32 %378, 31
  %382 = add nuw nsw i32 %378, 15
  %383 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %382
  %384 = load i32, i32 addrspace(3)* %383, align 4, !tbaa !5
  %385 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %381
  %386 = load i32, i32 addrspace(3)* %385, align 4, !tbaa !5
  %387 = add i32 %386, %384
  store i32 %387, i32 addrspace(3)* %385, align 4, !tbaa !5
  br label %388

388:                                              ; preds = %380, %374
  %389 = add nuw nsw i32 %332, 4
  %390 = add nuw nsw i32 %333, 4
  %391 = icmp eq i32 %390, %330
  br i1 %391, label %392, label %331, !llvm.loop !13

392:                                              ; preds = %388, %324
  %393 = phi i32 [ 0, %324 ], [ %389, %388 ]
  %394 = icmp eq i32 %327, 0
  br i1 %394, label %414, label %395

395:                                              ; preds = %392, %410
  %396 = phi i32 [ %411, %410 ], [ %393, %392 ]
  %397 = phi i32 [ %412, %410 ], [ 0, %392 ]
  %398 = mul nuw nsw i32 %396, %19
  %399 = add nuw nsw i32 %398, %9
  %400 = shl i32 %399, 5
  %401 = icmp ult i32 %400, 481
  br i1 %401, label %402, label %410

402:                                              ; preds = %395
  %403 = add nuw nsw i32 %400, 31
  %404 = add nuw nsw i32 %400, 15
  %405 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %404
  %406 = load i32, i32 addrspace(3)* %405, align 4, !tbaa !5
  %407 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %403
  %408 = load i32, i32 addrspace(3)* %407, align 4, !tbaa !5
  %409 = add i32 %408, %406
  store i32 %409, i32 addrspace(3)* %407, align 4, !tbaa !5
  br label %410

410:                                              ; preds = %402, %395
  %411 = add nuw nsw i32 %396, 1
  %412 = add i32 %397, 1
  %413 = icmp eq i32 %412, %327
  br i1 %413, label %414, label %395, !llvm.loop !18

414:                                              ; preds = %410, %392
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %415 = lshr i32 %26, 6
  %416 = add nsw i32 %415, -1
  %417 = and i32 %415, 3
  %418 = icmp ult i32 %416, 3
  br i1 %418, label %482, label %419

419:                                              ; preds = %414
  %420 = and i32 %415, 60
  br label %421

421:                                              ; preds = %478, %419
  %422 = phi i32 [ 0, %419 ], [ %479, %478 ]
  %423 = phi i32 [ 0, %419 ], [ %480, %478 ]
  %424 = mul nuw nsw i32 %422, %19
  %425 = add nuw nsw i32 %424, %9
  %426 = shl i32 %425, 6
  %427 = icmp ult i32 %426, 449
  br i1 %427, label %428, label %436

428:                                              ; preds = %421
  %429 = add nuw nsw i32 %426, 63
  %430 = add nuw nsw i32 %426, 31
  %431 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %430
  %432 = load i32, i32 addrspace(3)* %431, align 4, !tbaa !5
  %433 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %429
  %434 = load i32, i32 addrspace(3)* %433, align 4, !tbaa !5
  %435 = add i32 %434, %432
  store i32 %435, i32 addrspace(3)* %433, align 4, !tbaa !5
  br label %436

436:                                              ; preds = %428, %421
  %437 = or i32 %422, 1
  %438 = mul nuw nsw i32 %437, %19
  %439 = add nuw nsw i32 %438, %9
  %440 = shl i32 %439, 6
  %441 = icmp ult i32 %440, 449
  br i1 %441, label %442, label %450

442:                                              ; preds = %436
  %443 = add nuw nsw i32 %440, 63
  %444 = add nuw nsw i32 %440, 31
  %445 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %444
  %446 = load i32, i32 addrspace(3)* %445, align 4, !tbaa !5
  %447 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %443
  %448 = load i32, i32 addrspace(3)* %447, align 4, !tbaa !5
  %449 = add i32 %448, %446
  store i32 %449, i32 addrspace(3)* %447, align 4, !tbaa !5
  br label %450

450:                                              ; preds = %442, %436
  %451 = or i32 %422, 2
  %452 = mul nuw nsw i32 %451, %19
  %453 = add nuw nsw i32 %452, %9
  %454 = shl i32 %453, 6
  %455 = icmp ult i32 %454, 449
  br i1 %455, label %456, label %464

456:                                              ; preds = %450
  %457 = add nuw nsw i32 %454, 63
  %458 = add nuw nsw i32 %454, 31
  %459 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %458
  %460 = load i32, i32 addrspace(3)* %459, align 4, !tbaa !5
  %461 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %457
  %462 = load i32, i32 addrspace(3)* %461, align 4, !tbaa !5
  %463 = add i32 %462, %460
  store i32 %463, i32 addrspace(3)* %461, align 4, !tbaa !5
  br label %464

464:                                              ; preds = %456, %450
  %465 = or i32 %422, 3
  %466 = mul nuw nsw i32 %465, %19
  %467 = add nuw nsw i32 %466, %9
  %468 = shl i32 %467, 6
  %469 = icmp ult i32 %468, 449
  br i1 %469, label %470, label %478

470:                                              ; preds = %464
  %471 = add nuw nsw i32 %468, 63
  %472 = add nuw nsw i32 %468, 31
  %473 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %472
  %474 = load i32, i32 addrspace(3)* %473, align 4, !tbaa !5
  %475 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %471
  %476 = load i32, i32 addrspace(3)* %475, align 4, !tbaa !5
  %477 = add i32 %476, %474
  store i32 %477, i32 addrspace(3)* %475, align 4, !tbaa !5
  br label %478

478:                                              ; preds = %470, %464
  %479 = add nuw nsw i32 %422, 4
  %480 = add nuw nsw i32 %423, 4
  %481 = icmp eq i32 %480, %420
  br i1 %481, label %482, label %421, !llvm.loop !13

482:                                              ; preds = %478, %414
  %483 = phi i32 [ 0, %414 ], [ %479, %478 ]
  %484 = icmp eq i32 %417, 0
  br i1 %484, label %504, label %485

485:                                              ; preds = %482, %500
  %486 = phi i32 [ %501, %500 ], [ %483, %482 ]
  %487 = phi i32 [ %502, %500 ], [ 0, %482 ]
  %488 = mul nuw nsw i32 %486, %19
  %489 = add nuw nsw i32 %488, %9
  %490 = shl i32 %489, 6
  %491 = icmp ult i32 %490, 449
  br i1 %491, label %492, label %500

492:                                              ; preds = %485
  %493 = add nuw nsw i32 %490, 63
  %494 = add nuw nsw i32 %490, 31
  %495 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %494
  %496 = load i32, i32 addrspace(3)* %495, align 4, !tbaa !5
  %497 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %493
  %498 = load i32, i32 addrspace(3)* %497, align 4, !tbaa !5
  %499 = add i32 %498, %496
  store i32 %499, i32 addrspace(3)* %497, align 4, !tbaa !5
  br label %500

500:                                              ; preds = %492, %485
  %501 = add nuw nsw i32 %486, 1
  %502 = add i32 %487, 1
  %503 = icmp eq i32 %502, %417
  br i1 %503, label %504, label %485, !llvm.loop !19

504:                                              ; preds = %500, %482
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %505 = lshr i32 %26, 7
  %506 = add nsw i32 %505, -1
  %507 = and i32 %505, 3
  %508 = icmp ult i32 %506, 3
  br i1 %508, label %572, label %509

509:                                              ; preds = %504
  %510 = and i32 %505, 28
  br label %511

511:                                              ; preds = %568, %509
  %512 = phi i32 [ 0, %509 ], [ %569, %568 ]
  %513 = phi i32 [ 0, %509 ], [ %570, %568 ]
  %514 = mul nuw nsw i32 %512, %19
  %515 = add nuw nsw i32 %514, %9
  %516 = shl i32 %515, 7
  %517 = icmp ult i32 %516, 385
  br i1 %517, label %518, label %526

518:                                              ; preds = %511
  %519 = add nuw nsw i32 %516, 127
  %520 = add nuw nsw i32 %516, 63
  %521 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %520
  %522 = load i32, i32 addrspace(3)* %521, align 4, !tbaa !5
  %523 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %519
  %524 = load i32, i32 addrspace(3)* %523, align 4, !tbaa !5
  %525 = add i32 %524, %522
  store i32 %525, i32 addrspace(3)* %523, align 4, !tbaa !5
  br label %526

526:                                              ; preds = %518, %511
  %527 = or i32 %512, 1
  %528 = mul nuw nsw i32 %527, %19
  %529 = add nuw nsw i32 %528, %9
  %530 = shl i32 %529, 7
  %531 = icmp ult i32 %530, 385
  br i1 %531, label %532, label %540

532:                                              ; preds = %526
  %533 = add nuw nsw i32 %530, 127
  %534 = add nuw nsw i32 %530, 63
  %535 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %534
  %536 = load i32, i32 addrspace(3)* %535, align 4, !tbaa !5
  %537 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %533
  %538 = load i32, i32 addrspace(3)* %537, align 4, !tbaa !5
  %539 = add i32 %538, %536
  store i32 %539, i32 addrspace(3)* %537, align 4, !tbaa !5
  br label %540

540:                                              ; preds = %532, %526
  %541 = or i32 %512, 2
  %542 = mul nuw nsw i32 %541, %19
  %543 = add nuw nsw i32 %542, %9
  %544 = shl i32 %543, 7
  %545 = icmp ult i32 %544, 385
  br i1 %545, label %546, label %554

546:                                              ; preds = %540
  %547 = add nuw nsw i32 %544, 127
  %548 = add nuw nsw i32 %544, 63
  %549 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %548
  %550 = load i32, i32 addrspace(3)* %549, align 4, !tbaa !5
  %551 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %547
  %552 = load i32, i32 addrspace(3)* %551, align 4, !tbaa !5
  %553 = add i32 %552, %550
  store i32 %553, i32 addrspace(3)* %551, align 4, !tbaa !5
  br label %554

554:                                              ; preds = %546, %540
  %555 = or i32 %512, 3
  %556 = mul nuw nsw i32 %555, %19
  %557 = add nuw nsw i32 %556, %9
  %558 = shl i32 %557, 7
  %559 = icmp ult i32 %558, 385
  br i1 %559, label %560, label %568

560:                                              ; preds = %554
  %561 = add nuw nsw i32 %558, 127
  %562 = add nuw nsw i32 %558, 63
  %563 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %562
  %564 = load i32, i32 addrspace(3)* %563, align 4, !tbaa !5
  %565 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %561
  %566 = load i32, i32 addrspace(3)* %565, align 4, !tbaa !5
  %567 = add i32 %566, %564
  store i32 %567, i32 addrspace(3)* %565, align 4, !tbaa !5
  br label %568

568:                                              ; preds = %560, %554
  %569 = add nuw nsw i32 %512, 4
  %570 = add nuw nsw i32 %513, 4
  %571 = icmp eq i32 %570, %510
  br i1 %571, label %572, label %511, !llvm.loop !13

572:                                              ; preds = %568, %504
  %573 = phi i32 [ 0, %504 ], [ %569, %568 ]
  %574 = icmp eq i32 %507, 0
  br i1 %574, label %594, label %575

575:                                              ; preds = %572, %590
  %576 = phi i32 [ %591, %590 ], [ %573, %572 ]
  %577 = phi i32 [ %592, %590 ], [ 0, %572 ]
  %578 = mul nuw nsw i32 %576, %19
  %579 = add nuw nsw i32 %578, %9
  %580 = shl i32 %579, 7
  %581 = icmp ult i32 %580, 385
  br i1 %581, label %582, label %590

582:                                              ; preds = %575
  %583 = add nuw nsw i32 %580, 127
  %584 = add nuw nsw i32 %580, 63
  %585 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %584
  %586 = load i32, i32 addrspace(3)* %585, align 4, !tbaa !5
  %587 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %583
  %588 = load i32, i32 addrspace(3)* %587, align 4, !tbaa !5
  %589 = add i32 %588, %586
  store i32 %589, i32 addrspace(3)* %587, align 4, !tbaa !5
  br label %590

590:                                              ; preds = %582, %575
  %591 = add nuw nsw i32 %576, 1
  %592 = add i32 %577, 1
  %593 = icmp eq i32 %592, %507
  br i1 %593, label %594, label %575, !llvm.loop !20

594:                                              ; preds = %590, %572
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %595 = lshr i32 %26, 8
  br label %596

596:                                              ; preds = %610, %594
  %597 = phi i32 [ 0, %594 ], [ %611, %610 ]
  %598 = mul nuw nsw i32 %597, %19
  %599 = add nuw nsw i32 %598, %9
  %600 = shl i32 %599, 8
  %601 = icmp ult i32 %600, 257
  br i1 %601, label %602, label %610

602:                                              ; preds = %596
  %603 = add nuw nsw i32 %600, 255
  %604 = add nuw nsw i32 %600, 127
  %605 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %604
  %606 = load i32, i32 addrspace(3)* %605, align 4, !tbaa !5
  %607 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %603
  %608 = load i32, i32 addrspace(3)* %607, align 4, !tbaa !5
  %609 = add i32 %608, %606
  store i32 %609, i32 addrspace(3)* %607, align 4, !tbaa !5
  br label %610

610:                                              ; preds = %602, %596
  %611 = add nuw nsw i32 %597, 1
  %612 = icmp eq i32 %611, %595
  br i1 %612, label %613, label %596, !llvm.loop !13

613:                                              ; preds = %610
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %614 = lshr i32 %26, 9
  %615 = tail call i32 @llvm.umax.i32(i32 %614, i32 1)
  %616 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 255), align 4
  %617 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %618

618:                                              ; preds = %627, %613
  %619 = phi i32 [ %617, %613 ], [ %628, %627 ]
  %620 = phi i32 [ 0, %613 ], [ %629, %627 ]
  %621 = mul nuw nsw i32 %620, %19
  %622 = add nuw nsw i32 %621, %9
  %623 = and i32 %622, 8388607
  %624 = icmp eq i32 %623, 0
  br i1 %624, label %625, label %627

625:                                              ; preds = %618
  %626 = add i32 %619, %616
  store i32 %626, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %627

627:                                              ; preds = %625, %618
  %628 = phi i32 [ %626, %625 ], [ %619, %618 ]
  %629 = add nuw nsw i32 %620, 1
  %630 = icmp eq i32 %629, %615
  br i1 %630, label %688, label %618, !llvm.loop !13

631:                                              ; preds = %684, %31
  %632 = phi i32 [ 0, %31 ], [ %685, %684 ]
  %633 = phi i32 [ 0, %31 ], [ %686, %684 ]
  %634 = mul nuw nsw i32 %632, %19
  %635 = add nuw nsw i32 %634, %9
  %636 = shl nuw i32 %635, 1
  %637 = icmp ult i32 %635, 256
  br i1 %637, label %638, label %645

638:                                              ; preds = %631
  %639 = add nuw nsw i32 %636, 1
  %640 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %636
  %641 = load i32, i32 addrspace(3)* %640, align 8, !tbaa !5
  %642 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %639
  %643 = load i32, i32 addrspace(3)* %642, align 4, !tbaa !5
  %644 = add i32 %643, %641
  store i32 %644, i32 addrspace(3)* %642, align 4, !tbaa !5
  br label %645

645:                                              ; preds = %638, %631
  %646 = or i32 %632, 1
  %647 = mul nuw nsw i32 %646, %19
  %648 = add nuw nsw i32 %647, %9
  %649 = shl nuw i32 %648, 1
  %650 = icmp ult i32 %648, 256
  br i1 %650, label %651, label %658

651:                                              ; preds = %645
  %652 = add nuw nsw i32 %649, 1
  %653 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %649
  %654 = load i32, i32 addrspace(3)* %653, align 8, !tbaa !5
  %655 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %652
  %656 = load i32, i32 addrspace(3)* %655, align 4, !tbaa !5
  %657 = add i32 %656, %654
  store i32 %657, i32 addrspace(3)* %655, align 4, !tbaa !5
  br label %658

658:                                              ; preds = %651, %645
  %659 = or i32 %632, 2
  %660 = mul nuw nsw i32 %659, %19
  %661 = add nuw nsw i32 %660, %9
  %662 = shl nuw i32 %661, 1
  %663 = icmp ult i32 %661, 256
  br i1 %663, label %664, label %671

664:                                              ; preds = %658
  %665 = add nuw nsw i32 %662, 1
  %666 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %662
  %667 = load i32, i32 addrspace(3)* %666, align 8, !tbaa !5
  %668 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %665
  %669 = load i32, i32 addrspace(3)* %668, align 4, !tbaa !5
  %670 = add i32 %669, %667
  store i32 %670, i32 addrspace(3)* %668, align 4, !tbaa !5
  br label %671

671:                                              ; preds = %664, %658
  %672 = or i32 %632, 3
  %673 = mul nuw nsw i32 %672, %19
  %674 = add nuw nsw i32 %673, %9
  %675 = shl nuw i32 %674, 1
  %676 = icmp ult i32 %674, 256
  br i1 %676, label %677, label %684

677:                                              ; preds = %671
  %678 = add nuw nsw i32 %675, 1
  %679 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %675
  %680 = load i32, i32 addrspace(3)* %679, align 8, !tbaa !5
  %681 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %678
  %682 = load i32, i32 addrspace(3)* %681, align 4, !tbaa !5
  %683 = add i32 %682, %680
  store i32 %683, i32 addrspace(3)* %681, align 4, !tbaa !5
  br label %684

684:                                              ; preds = %677, %671
  %685 = add nuw nsw i32 %632, 4
  %686 = add nuw nsw i32 %633, 4
  %687 = icmp eq i32 %686, %32
  br i1 %687, label %33, label %631, !llvm.loop !13

688:                                              ; preds = %627
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %689 = icmp eq i32 %9, 0
  br i1 %689, label %690, label %694

690:                                              ; preds = %688
  %691 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  %692 = zext i32 %5 to i64
  %693 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %692
  store i32 %691, i32 addrspace(1)* %693, align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %694

694:                                              ; preds = %690, %688
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %695 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 255), align 4, !tbaa !5
  %696 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %1309

697:                                              ; preds = %1319
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %698

698:                                              ; preds = %712, %697
  %699 = phi i32 [ 0, %697 ], [ %713, %712 ]
  %700 = mul nuw nsw i32 %699, %19
  %701 = add nuw nsw i32 %700, %9
  %702 = shl i32 %701, 8
  %703 = sub i32 511, %702
  %704 = icmp ult i32 %703, 512
  br i1 %704, label %705, label %712

705:                                              ; preds = %698
  %706 = sub i32 383, %702
  %707 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %706
  %708 = load i32, i32 addrspace(3)* %707, align 4, !tbaa !5
  %709 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %703
  %710 = load i32, i32 addrspace(3)* %709, align 4, !tbaa !5
  store i32 %710, i32 addrspace(3)* %707, align 4, !tbaa !5
  %711 = add i32 %710, %708
  store i32 %711, i32 addrspace(3)* %709, align 4, !tbaa !5
  br label %712

712:                                              ; preds = %705, %698
  %713 = add nuw nsw i32 %699, 1
  %714 = icmp eq i32 %713, %595
  br i1 %714, label %715, label %698, !llvm.loop !21

715:                                              ; preds = %712
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %716 = and i32 %505, 3
  %717 = icmp ult i32 %506, 3
  br i1 %717, label %781, label %718

718:                                              ; preds = %715
  %719 = and i32 %505, 28
  br label %720

720:                                              ; preds = %777, %718
  %721 = phi i32 [ 0, %718 ], [ %778, %777 ]
  %722 = phi i32 [ 0, %718 ], [ %779, %777 ]
  %723 = mul nuw nsw i32 %721, %19
  %724 = add nuw nsw i32 %723, %9
  %725 = shl i32 %724, 7
  %726 = sub i32 511, %725
  %727 = icmp ult i32 %726, 512
  br i1 %727, label %728, label %735

728:                                              ; preds = %720
  %729 = sub i32 447, %725
  %730 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %729
  %731 = load i32, i32 addrspace(3)* %730, align 4, !tbaa !5
  %732 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %726
  %733 = load i32, i32 addrspace(3)* %732, align 4, !tbaa !5
  store i32 %733, i32 addrspace(3)* %730, align 4, !tbaa !5
  %734 = add i32 %733, %731
  store i32 %734, i32 addrspace(3)* %732, align 4, !tbaa !5
  br label %735

735:                                              ; preds = %728, %720
  %736 = or i32 %721, 1
  %737 = mul nuw nsw i32 %736, %19
  %738 = add nuw nsw i32 %737, %9
  %739 = shl i32 %738, 7
  %740 = sub i32 511, %739
  %741 = icmp ult i32 %740, 512
  br i1 %741, label %742, label %749

742:                                              ; preds = %735
  %743 = sub i32 447, %739
  %744 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %743
  %745 = load i32, i32 addrspace(3)* %744, align 4, !tbaa !5
  %746 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %740
  %747 = load i32, i32 addrspace(3)* %746, align 4, !tbaa !5
  store i32 %747, i32 addrspace(3)* %744, align 4, !tbaa !5
  %748 = add i32 %747, %745
  store i32 %748, i32 addrspace(3)* %746, align 4, !tbaa !5
  br label %749

749:                                              ; preds = %742, %735
  %750 = or i32 %721, 2
  %751 = mul nuw nsw i32 %750, %19
  %752 = add nuw nsw i32 %751, %9
  %753 = shl i32 %752, 7
  %754 = sub i32 511, %753
  %755 = icmp ult i32 %754, 512
  br i1 %755, label %756, label %763

756:                                              ; preds = %749
  %757 = sub i32 447, %753
  %758 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %757
  %759 = load i32, i32 addrspace(3)* %758, align 4, !tbaa !5
  %760 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %754
  %761 = load i32, i32 addrspace(3)* %760, align 4, !tbaa !5
  store i32 %761, i32 addrspace(3)* %758, align 4, !tbaa !5
  %762 = add i32 %761, %759
  store i32 %762, i32 addrspace(3)* %760, align 4, !tbaa !5
  br label %763

763:                                              ; preds = %756, %749
  %764 = or i32 %721, 3
  %765 = mul nuw nsw i32 %764, %19
  %766 = add nuw nsw i32 %765, %9
  %767 = shl i32 %766, 7
  %768 = sub i32 511, %767
  %769 = icmp ult i32 %768, 512
  br i1 %769, label %770, label %777

770:                                              ; preds = %763
  %771 = sub i32 447, %767
  %772 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %771
  %773 = load i32, i32 addrspace(3)* %772, align 4, !tbaa !5
  %774 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %768
  %775 = load i32, i32 addrspace(3)* %774, align 4, !tbaa !5
  store i32 %775, i32 addrspace(3)* %772, align 4, !tbaa !5
  %776 = add i32 %775, %773
  store i32 %776, i32 addrspace(3)* %774, align 4, !tbaa !5
  br label %777

777:                                              ; preds = %770, %763
  %778 = add nuw nsw i32 %721, 4
  %779 = add nuw nsw i32 %722, 4
  %780 = icmp eq i32 %779, %719
  br i1 %780, label %781, label %720, !llvm.loop !21

781:                                              ; preds = %777, %715
  %782 = phi i32 [ 0, %715 ], [ %778, %777 ]
  %783 = icmp eq i32 %716, 0
  br i1 %783, label %803, label %784

784:                                              ; preds = %781, %799
  %785 = phi i32 [ %800, %799 ], [ %782, %781 ]
  %786 = phi i32 [ %801, %799 ], [ 0, %781 ]
  %787 = mul nuw nsw i32 %785, %19
  %788 = add nuw nsw i32 %787, %9
  %789 = shl i32 %788, 7
  %790 = sub i32 511, %789
  %791 = icmp ult i32 %790, 512
  br i1 %791, label %792, label %799

792:                                              ; preds = %784
  %793 = sub i32 447, %789
  %794 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %793
  %795 = load i32, i32 addrspace(3)* %794, align 4, !tbaa !5
  %796 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %790
  %797 = load i32, i32 addrspace(3)* %796, align 4, !tbaa !5
  store i32 %797, i32 addrspace(3)* %794, align 4, !tbaa !5
  %798 = add i32 %797, %795
  store i32 %798, i32 addrspace(3)* %796, align 4, !tbaa !5
  br label %799

799:                                              ; preds = %792, %784
  %800 = add nuw nsw i32 %785, 1
  %801 = add i32 %786, 1
  %802 = icmp eq i32 %801, %716
  br i1 %802, label %803, label %784, !llvm.loop !22

803:                                              ; preds = %799, %781
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %804 = and i32 %415, 3
  %805 = icmp ult i32 %416, 3
  br i1 %805, label %869, label %806

806:                                              ; preds = %803
  %807 = and i32 %415, 60
  br label %808

808:                                              ; preds = %865, %806
  %809 = phi i32 [ 0, %806 ], [ %866, %865 ]
  %810 = phi i32 [ 0, %806 ], [ %867, %865 ]
  %811 = mul nuw nsw i32 %809, %19
  %812 = add nuw nsw i32 %811, %9
  %813 = shl i32 %812, 6
  %814 = sub i32 511, %813
  %815 = icmp ult i32 %814, 512
  br i1 %815, label %816, label %823

816:                                              ; preds = %808
  %817 = sub i32 479, %813
  %818 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %817
  %819 = load i32, i32 addrspace(3)* %818, align 4, !tbaa !5
  %820 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %814
  %821 = load i32, i32 addrspace(3)* %820, align 4, !tbaa !5
  store i32 %821, i32 addrspace(3)* %818, align 4, !tbaa !5
  %822 = add i32 %821, %819
  store i32 %822, i32 addrspace(3)* %820, align 4, !tbaa !5
  br label %823

823:                                              ; preds = %816, %808
  %824 = or i32 %809, 1
  %825 = mul nuw nsw i32 %824, %19
  %826 = add nuw nsw i32 %825, %9
  %827 = shl i32 %826, 6
  %828 = sub i32 511, %827
  %829 = icmp ult i32 %828, 512
  br i1 %829, label %830, label %837

830:                                              ; preds = %823
  %831 = sub i32 479, %827
  %832 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %831
  %833 = load i32, i32 addrspace(3)* %832, align 4, !tbaa !5
  %834 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %828
  %835 = load i32, i32 addrspace(3)* %834, align 4, !tbaa !5
  store i32 %835, i32 addrspace(3)* %832, align 4, !tbaa !5
  %836 = add i32 %835, %833
  store i32 %836, i32 addrspace(3)* %834, align 4, !tbaa !5
  br label %837

837:                                              ; preds = %830, %823
  %838 = or i32 %809, 2
  %839 = mul nuw nsw i32 %838, %19
  %840 = add nuw nsw i32 %839, %9
  %841 = shl i32 %840, 6
  %842 = sub i32 511, %841
  %843 = icmp ult i32 %842, 512
  br i1 %843, label %844, label %851

844:                                              ; preds = %837
  %845 = sub i32 479, %841
  %846 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %845
  %847 = load i32, i32 addrspace(3)* %846, align 4, !tbaa !5
  %848 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %842
  %849 = load i32, i32 addrspace(3)* %848, align 4, !tbaa !5
  store i32 %849, i32 addrspace(3)* %846, align 4, !tbaa !5
  %850 = add i32 %849, %847
  store i32 %850, i32 addrspace(3)* %848, align 4, !tbaa !5
  br label %851

851:                                              ; preds = %844, %837
  %852 = or i32 %809, 3
  %853 = mul nuw nsw i32 %852, %19
  %854 = add nuw nsw i32 %853, %9
  %855 = shl i32 %854, 6
  %856 = sub i32 511, %855
  %857 = icmp ult i32 %856, 512
  br i1 %857, label %858, label %865

858:                                              ; preds = %851
  %859 = sub i32 479, %855
  %860 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %859
  %861 = load i32, i32 addrspace(3)* %860, align 4, !tbaa !5
  %862 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %856
  %863 = load i32, i32 addrspace(3)* %862, align 4, !tbaa !5
  store i32 %863, i32 addrspace(3)* %860, align 4, !tbaa !5
  %864 = add i32 %863, %861
  store i32 %864, i32 addrspace(3)* %862, align 4, !tbaa !5
  br label %865

865:                                              ; preds = %858, %851
  %866 = add nuw nsw i32 %809, 4
  %867 = add nuw nsw i32 %810, 4
  %868 = icmp eq i32 %867, %807
  br i1 %868, label %869, label %808, !llvm.loop !21

869:                                              ; preds = %865, %803
  %870 = phi i32 [ 0, %803 ], [ %866, %865 ]
  %871 = icmp eq i32 %804, 0
  br i1 %871, label %891, label %872

872:                                              ; preds = %869, %887
  %873 = phi i32 [ %888, %887 ], [ %870, %869 ]
  %874 = phi i32 [ %889, %887 ], [ 0, %869 ]
  %875 = mul nuw nsw i32 %873, %19
  %876 = add nuw nsw i32 %875, %9
  %877 = shl i32 %876, 6
  %878 = sub i32 511, %877
  %879 = icmp ult i32 %878, 512
  br i1 %879, label %880, label %887

880:                                              ; preds = %872
  %881 = sub i32 479, %877
  %882 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %881
  %883 = load i32, i32 addrspace(3)* %882, align 4, !tbaa !5
  %884 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %878
  %885 = load i32, i32 addrspace(3)* %884, align 4, !tbaa !5
  store i32 %885, i32 addrspace(3)* %882, align 4, !tbaa !5
  %886 = add i32 %885, %883
  store i32 %886, i32 addrspace(3)* %884, align 4, !tbaa !5
  br label %887

887:                                              ; preds = %880, %872
  %888 = add nuw nsw i32 %873, 1
  %889 = add i32 %874, 1
  %890 = icmp eq i32 %889, %804
  br i1 %890, label %891, label %872, !llvm.loop !23

891:                                              ; preds = %887, %869
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %892 = and i32 %325, 3
  %893 = icmp ult i32 %326, 3
  br i1 %893, label %957, label %894

894:                                              ; preds = %891
  %895 = and i32 %325, 124
  br label %896

896:                                              ; preds = %953, %894
  %897 = phi i32 [ 0, %894 ], [ %954, %953 ]
  %898 = phi i32 [ 0, %894 ], [ %955, %953 ]
  %899 = mul nuw nsw i32 %897, %19
  %900 = add nuw nsw i32 %899, %9
  %901 = shl i32 %900, 5
  %902 = sub i32 511, %901
  %903 = icmp ult i32 %902, 512
  br i1 %903, label %904, label %911

904:                                              ; preds = %896
  %905 = sub i32 495, %901
  %906 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %905
  %907 = load i32, i32 addrspace(3)* %906, align 4, !tbaa !5
  %908 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %902
  %909 = load i32, i32 addrspace(3)* %908, align 4, !tbaa !5
  store i32 %909, i32 addrspace(3)* %906, align 4, !tbaa !5
  %910 = add i32 %909, %907
  store i32 %910, i32 addrspace(3)* %908, align 4, !tbaa !5
  br label %911

911:                                              ; preds = %904, %896
  %912 = or i32 %897, 1
  %913 = mul nuw nsw i32 %912, %19
  %914 = add nuw nsw i32 %913, %9
  %915 = shl i32 %914, 5
  %916 = sub i32 511, %915
  %917 = icmp ult i32 %916, 512
  br i1 %917, label %918, label %925

918:                                              ; preds = %911
  %919 = sub i32 495, %915
  %920 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %919
  %921 = load i32, i32 addrspace(3)* %920, align 4, !tbaa !5
  %922 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %916
  %923 = load i32, i32 addrspace(3)* %922, align 4, !tbaa !5
  store i32 %923, i32 addrspace(3)* %920, align 4, !tbaa !5
  %924 = add i32 %923, %921
  store i32 %924, i32 addrspace(3)* %922, align 4, !tbaa !5
  br label %925

925:                                              ; preds = %918, %911
  %926 = or i32 %897, 2
  %927 = mul nuw nsw i32 %926, %19
  %928 = add nuw nsw i32 %927, %9
  %929 = shl i32 %928, 5
  %930 = sub i32 511, %929
  %931 = icmp ult i32 %930, 512
  br i1 %931, label %932, label %939

932:                                              ; preds = %925
  %933 = sub i32 495, %929
  %934 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %933
  %935 = load i32, i32 addrspace(3)* %934, align 4, !tbaa !5
  %936 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %930
  %937 = load i32, i32 addrspace(3)* %936, align 4, !tbaa !5
  store i32 %937, i32 addrspace(3)* %934, align 4, !tbaa !5
  %938 = add i32 %937, %935
  store i32 %938, i32 addrspace(3)* %936, align 4, !tbaa !5
  br label %939

939:                                              ; preds = %932, %925
  %940 = or i32 %897, 3
  %941 = mul nuw nsw i32 %940, %19
  %942 = add nuw nsw i32 %941, %9
  %943 = shl i32 %942, 5
  %944 = sub i32 511, %943
  %945 = icmp ult i32 %944, 512
  br i1 %945, label %946, label %953

946:                                              ; preds = %939
  %947 = sub i32 495, %943
  %948 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %947
  %949 = load i32, i32 addrspace(3)* %948, align 4, !tbaa !5
  %950 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %944
  %951 = load i32, i32 addrspace(3)* %950, align 4, !tbaa !5
  store i32 %951, i32 addrspace(3)* %948, align 4, !tbaa !5
  %952 = add i32 %951, %949
  store i32 %952, i32 addrspace(3)* %950, align 4, !tbaa !5
  br label %953

953:                                              ; preds = %946, %939
  %954 = add nuw nsw i32 %897, 4
  %955 = add nuw nsw i32 %898, 4
  %956 = icmp eq i32 %955, %895
  br i1 %956, label %957, label %896, !llvm.loop !21

957:                                              ; preds = %953, %891
  %958 = phi i32 [ 0, %891 ], [ %954, %953 ]
  %959 = icmp eq i32 %892, 0
  br i1 %959, label %979, label %960

960:                                              ; preds = %957, %975
  %961 = phi i32 [ %976, %975 ], [ %958, %957 ]
  %962 = phi i32 [ %977, %975 ], [ 0, %957 ]
  %963 = mul nuw nsw i32 %961, %19
  %964 = add nuw nsw i32 %963, %9
  %965 = shl i32 %964, 5
  %966 = sub i32 511, %965
  %967 = icmp ult i32 %966, 512
  br i1 %967, label %968, label %975

968:                                              ; preds = %960
  %969 = sub i32 495, %965
  %970 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %969
  %971 = load i32, i32 addrspace(3)* %970, align 4, !tbaa !5
  %972 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %966
  %973 = load i32, i32 addrspace(3)* %972, align 4, !tbaa !5
  store i32 %973, i32 addrspace(3)* %970, align 4, !tbaa !5
  %974 = add i32 %973, %971
  store i32 %974, i32 addrspace(3)* %972, align 4, !tbaa !5
  br label %975

975:                                              ; preds = %968, %960
  %976 = add nuw nsw i32 %961, 1
  %977 = add i32 %962, 1
  %978 = icmp eq i32 %977, %892
  br i1 %978, label %979, label %960, !llvm.loop !24

979:                                              ; preds = %975, %957
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %980 = and i32 %235, 3
  %981 = icmp ult i32 %236, 3
  br i1 %981, label %1045, label %982

982:                                              ; preds = %979
  %983 = and i32 %235, 252
  br label %984

984:                                              ; preds = %1041, %982
  %985 = phi i32 [ 0, %982 ], [ %1042, %1041 ]
  %986 = phi i32 [ 0, %982 ], [ %1043, %1041 ]
  %987 = mul nuw nsw i32 %985, %19
  %988 = add nuw nsw i32 %987, %9
  %989 = shl i32 %988, 4
  %990 = sub i32 511, %989
  %991 = icmp ult i32 %990, 512
  br i1 %991, label %992, label %999

992:                                              ; preds = %984
  %993 = sub i32 503, %989
  %994 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %993
  %995 = load i32, i32 addrspace(3)* %994, align 4, !tbaa !5
  %996 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %990
  %997 = load i32, i32 addrspace(3)* %996, align 4, !tbaa !5
  store i32 %997, i32 addrspace(3)* %994, align 4, !tbaa !5
  %998 = add i32 %997, %995
  store i32 %998, i32 addrspace(3)* %996, align 4, !tbaa !5
  br label %999

999:                                              ; preds = %992, %984
  %1000 = or i32 %985, 1
  %1001 = mul nuw nsw i32 %1000, %19
  %1002 = add nuw nsw i32 %1001, %9
  %1003 = shl i32 %1002, 4
  %1004 = sub i32 511, %1003
  %1005 = icmp ult i32 %1004, 512
  br i1 %1005, label %1006, label %1013

1006:                                             ; preds = %999
  %1007 = sub i32 503, %1003
  %1008 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1007
  %1009 = load i32, i32 addrspace(3)* %1008, align 4, !tbaa !5
  %1010 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1004
  %1011 = load i32, i32 addrspace(3)* %1010, align 4, !tbaa !5
  store i32 %1011, i32 addrspace(3)* %1008, align 4, !tbaa !5
  %1012 = add i32 %1011, %1009
  store i32 %1012, i32 addrspace(3)* %1010, align 4, !tbaa !5
  br label %1013

1013:                                             ; preds = %1006, %999
  %1014 = or i32 %985, 2
  %1015 = mul nuw nsw i32 %1014, %19
  %1016 = add nuw nsw i32 %1015, %9
  %1017 = shl i32 %1016, 4
  %1018 = sub i32 511, %1017
  %1019 = icmp ult i32 %1018, 512
  br i1 %1019, label %1020, label %1027

1020:                                             ; preds = %1013
  %1021 = sub i32 503, %1017
  %1022 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1021
  %1023 = load i32, i32 addrspace(3)* %1022, align 4, !tbaa !5
  %1024 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1018
  %1025 = load i32, i32 addrspace(3)* %1024, align 4, !tbaa !5
  store i32 %1025, i32 addrspace(3)* %1022, align 4, !tbaa !5
  %1026 = add i32 %1025, %1023
  store i32 %1026, i32 addrspace(3)* %1024, align 4, !tbaa !5
  br label %1027

1027:                                             ; preds = %1020, %1013
  %1028 = or i32 %985, 3
  %1029 = mul nuw nsw i32 %1028, %19
  %1030 = add nuw nsw i32 %1029, %9
  %1031 = shl i32 %1030, 4
  %1032 = sub i32 511, %1031
  %1033 = icmp ult i32 %1032, 512
  br i1 %1033, label %1034, label %1041

1034:                                             ; preds = %1027
  %1035 = sub i32 503, %1031
  %1036 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1035
  %1037 = load i32, i32 addrspace(3)* %1036, align 4, !tbaa !5
  %1038 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1032
  %1039 = load i32, i32 addrspace(3)* %1038, align 4, !tbaa !5
  store i32 %1039, i32 addrspace(3)* %1036, align 4, !tbaa !5
  %1040 = add i32 %1039, %1037
  store i32 %1040, i32 addrspace(3)* %1038, align 4, !tbaa !5
  br label %1041

1041:                                             ; preds = %1034, %1027
  %1042 = add nuw nsw i32 %985, 4
  %1043 = add nuw nsw i32 %986, 4
  %1044 = icmp eq i32 %1043, %983
  br i1 %1044, label %1045, label %984, !llvm.loop !21

1045:                                             ; preds = %1041, %979
  %1046 = phi i32 [ 0, %979 ], [ %1042, %1041 ]
  %1047 = icmp eq i32 %980, 0
  br i1 %1047, label %1067, label %1048

1048:                                             ; preds = %1045, %1063
  %1049 = phi i32 [ %1064, %1063 ], [ %1046, %1045 ]
  %1050 = phi i32 [ %1065, %1063 ], [ 0, %1045 ]
  %1051 = mul nuw nsw i32 %1049, %19
  %1052 = add nuw nsw i32 %1051, %9
  %1053 = shl i32 %1052, 4
  %1054 = sub i32 511, %1053
  %1055 = icmp ult i32 %1054, 512
  br i1 %1055, label %1056, label %1063

1056:                                             ; preds = %1048
  %1057 = sub i32 503, %1053
  %1058 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1057
  %1059 = load i32, i32 addrspace(3)* %1058, align 4, !tbaa !5
  %1060 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1054
  %1061 = load i32, i32 addrspace(3)* %1060, align 4, !tbaa !5
  store i32 %1061, i32 addrspace(3)* %1058, align 4, !tbaa !5
  %1062 = add i32 %1061, %1059
  store i32 %1062, i32 addrspace(3)* %1060, align 4, !tbaa !5
  br label %1063

1063:                                             ; preds = %1056, %1048
  %1064 = add nuw nsw i32 %1049, 1
  %1065 = add i32 %1050, 1
  %1066 = icmp eq i32 %1065, %980
  br i1 %1066, label %1067, label %1048, !llvm.loop !25

1067:                                             ; preds = %1063, %1045
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1068 = and i32 %145, 3
  %1069 = icmp ult i32 %146, 3
  br i1 %1069, label %1133, label %1070

1070:                                             ; preds = %1067
  %1071 = and i32 %145, 508
  br label %1072

1072:                                             ; preds = %1129, %1070
  %1073 = phi i32 [ 0, %1070 ], [ %1130, %1129 ]
  %1074 = phi i32 [ 0, %1070 ], [ %1131, %1129 ]
  %1075 = mul nuw nsw i32 %1073, %19
  %1076 = add nuw nsw i32 %1075, %9
  %1077 = shl i32 %1076, 3
  %1078 = sub i32 511, %1077
  %1079 = icmp ult i32 %1078, 512
  br i1 %1079, label %1080, label %1087

1080:                                             ; preds = %1072
  %1081 = sub i32 507, %1077
  %1082 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1081
  %1083 = load i32, i32 addrspace(3)* %1082, align 4, !tbaa !5
  %1084 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1078
  %1085 = load i32, i32 addrspace(3)* %1084, align 4, !tbaa !5
  store i32 %1085, i32 addrspace(3)* %1082, align 4, !tbaa !5
  %1086 = add i32 %1085, %1083
  store i32 %1086, i32 addrspace(3)* %1084, align 4, !tbaa !5
  br label %1087

1087:                                             ; preds = %1080, %1072
  %1088 = or i32 %1073, 1
  %1089 = mul nuw nsw i32 %1088, %19
  %1090 = add nuw nsw i32 %1089, %9
  %1091 = shl i32 %1090, 3
  %1092 = sub i32 511, %1091
  %1093 = icmp ult i32 %1092, 512
  br i1 %1093, label %1094, label %1101

1094:                                             ; preds = %1087
  %1095 = sub i32 507, %1091
  %1096 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1095
  %1097 = load i32, i32 addrspace(3)* %1096, align 4, !tbaa !5
  %1098 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1092
  %1099 = load i32, i32 addrspace(3)* %1098, align 4, !tbaa !5
  store i32 %1099, i32 addrspace(3)* %1096, align 4, !tbaa !5
  %1100 = add i32 %1099, %1097
  store i32 %1100, i32 addrspace(3)* %1098, align 4, !tbaa !5
  br label %1101

1101:                                             ; preds = %1094, %1087
  %1102 = or i32 %1073, 2
  %1103 = mul nuw nsw i32 %1102, %19
  %1104 = add nuw nsw i32 %1103, %9
  %1105 = shl i32 %1104, 3
  %1106 = sub i32 511, %1105
  %1107 = icmp ult i32 %1106, 512
  br i1 %1107, label %1108, label %1115

1108:                                             ; preds = %1101
  %1109 = sub i32 507, %1105
  %1110 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1109
  %1111 = load i32, i32 addrspace(3)* %1110, align 4, !tbaa !5
  %1112 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1106
  %1113 = load i32, i32 addrspace(3)* %1112, align 4, !tbaa !5
  store i32 %1113, i32 addrspace(3)* %1110, align 4, !tbaa !5
  %1114 = add i32 %1113, %1111
  store i32 %1114, i32 addrspace(3)* %1112, align 4, !tbaa !5
  br label %1115

1115:                                             ; preds = %1108, %1101
  %1116 = or i32 %1073, 3
  %1117 = mul nuw nsw i32 %1116, %19
  %1118 = add nuw nsw i32 %1117, %9
  %1119 = shl i32 %1118, 3
  %1120 = sub i32 511, %1119
  %1121 = icmp ult i32 %1120, 512
  br i1 %1121, label %1122, label %1129

1122:                                             ; preds = %1115
  %1123 = sub i32 507, %1119
  %1124 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1123
  %1125 = load i32, i32 addrspace(3)* %1124, align 4, !tbaa !5
  %1126 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1120
  %1127 = load i32, i32 addrspace(3)* %1126, align 4, !tbaa !5
  store i32 %1127, i32 addrspace(3)* %1124, align 4, !tbaa !5
  %1128 = add i32 %1127, %1125
  store i32 %1128, i32 addrspace(3)* %1126, align 4, !tbaa !5
  br label %1129

1129:                                             ; preds = %1122, %1115
  %1130 = add nuw nsw i32 %1073, 4
  %1131 = add nuw nsw i32 %1074, 4
  %1132 = icmp eq i32 %1131, %1071
  br i1 %1132, label %1133, label %1072, !llvm.loop !21

1133:                                             ; preds = %1129, %1067
  %1134 = phi i32 [ 0, %1067 ], [ %1130, %1129 ]
  %1135 = icmp eq i32 %1068, 0
  br i1 %1135, label %1155, label %1136

1136:                                             ; preds = %1133, %1151
  %1137 = phi i32 [ %1152, %1151 ], [ %1134, %1133 ]
  %1138 = phi i32 [ %1153, %1151 ], [ 0, %1133 ]
  %1139 = mul nuw nsw i32 %1137, %19
  %1140 = add nuw nsw i32 %1139, %9
  %1141 = shl i32 %1140, 3
  %1142 = sub i32 511, %1141
  %1143 = icmp ult i32 %1142, 512
  br i1 %1143, label %1144, label %1151

1144:                                             ; preds = %1136
  %1145 = sub i32 507, %1141
  %1146 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1145
  %1147 = load i32, i32 addrspace(3)* %1146, align 4, !tbaa !5
  %1148 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1142
  %1149 = load i32, i32 addrspace(3)* %1148, align 4, !tbaa !5
  store i32 %1149, i32 addrspace(3)* %1146, align 4, !tbaa !5
  %1150 = add i32 %1149, %1147
  store i32 %1150, i32 addrspace(3)* %1148, align 4, !tbaa !5
  br label %1151

1151:                                             ; preds = %1144, %1136
  %1152 = add nuw nsw i32 %1137, 1
  %1153 = add i32 %1138, 1
  %1154 = icmp eq i32 %1153, %1068
  br i1 %1154, label %1155, label %1136, !llvm.loop !26

1155:                                             ; preds = %1151, %1133
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1156 = and i32 %55, 3
  %1157 = icmp ult i32 %56, 3
  br i1 %1157, label %1221, label %1158

1158:                                             ; preds = %1155
  %1159 = and i32 %55, 1020
  br label %1160

1160:                                             ; preds = %1217, %1158
  %1161 = phi i32 [ 0, %1158 ], [ %1218, %1217 ]
  %1162 = phi i32 [ 0, %1158 ], [ %1219, %1217 ]
  %1163 = mul nuw nsw i32 %1161, %19
  %1164 = add nuw nsw i32 %1163, %9
  %1165 = shl i32 %1164, 2
  %1166 = sub i32 511, %1165
  %1167 = icmp ult i32 %1166, 512
  br i1 %1167, label %1168, label %1175

1168:                                             ; preds = %1160
  %1169 = sub i32 509, %1165
  %1170 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1169
  %1171 = load i32, i32 addrspace(3)* %1170, align 4, !tbaa !5
  %1172 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1166
  %1173 = load i32, i32 addrspace(3)* %1172, align 4, !tbaa !5
  store i32 %1173, i32 addrspace(3)* %1170, align 4, !tbaa !5
  %1174 = add i32 %1173, %1171
  store i32 %1174, i32 addrspace(3)* %1172, align 4, !tbaa !5
  br label %1175

1175:                                             ; preds = %1168, %1160
  %1176 = or i32 %1161, 1
  %1177 = mul nuw nsw i32 %1176, %19
  %1178 = add nuw nsw i32 %1177, %9
  %1179 = shl i32 %1178, 2
  %1180 = sub i32 511, %1179
  %1181 = icmp ult i32 %1180, 512
  br i1 %1181, label %1182, label %1189

1182:                                             ; preds = %1175
  %1183 = sub i32 509, %1179
  %1184 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1183
  %1185 = load i32, i32 addrspace(3)* %1184, align 4, !tbaa !5
  %1186 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1180
  %1187 = load i32, i32 addrspace(3)* %1186, align 4, !tbaa !5
  store i32 %1187, i32 addrspace(3)* %1184, align 4, !tbaa !5
  %1188 = add i32 %1187, %1185
  store i32 %1188, i32 addrspace(3)* %1186, align 4, !tbaa !5
  br label %1189

1189:                                             ; preds = %1182, %1175
  %1190 = or i32 %1161, 2
  %1191 = mul nuw nsw i32 %1190, %19
  %1192 = add nuw nsw i32 %1191, %9
  %1193 = shl i32 %1192, 2
  %1194 = sub i32 511, %1193
  %1195 = icmp ult i32 %1194, 512
  br i1 %1195, label %1196, label %1203

1196:                                             ; preds = %1189
  %1197 = sub i32 509, %1193
  %1198 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1197
  %1199 = load i32, i32 addrspace(3)* %1198, align 4, !tbaa !5
  %1200 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1194
  %1201 = load i32, i32 addrspace(3)* %1200, align 4, !tbaa !5
  store i32 %1201, i32 addrspace(3)* %1198, align 4, !tbaa !5
  %1202 = add i32 %1201, %1199
  store i32 %1202, i32 addrspace(3)* %1200, align 4, !tbaa !5
  br label %1203

1203:                                             ; preds = %1196, %1189
  %1204 = or i32 %1161, 3
  %1205 = mul nuw nsw i32 %1204, %19
  %1206 = add nuw nsw i32 %1205, %9
  %1207 = shl i32 %1206, 2
  %1208 = sub i32 511, %1207
  %1209 = icmp ult i32 %1208, 512
  br i1 %1209, label %1210, label %1217

1210:                                             ; preds = %1203
  %1211 = sub i32 509, %1207
  %1212 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1211
  %1213 = load i32, i32 addrspace(3)* %1212, align 4, !tbaa !5
  %1214 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1208
  %1215 = load i32, i32 addrspace(3)* %1214, align 4, !tbaa !5
  store i32 %1215, i32 addrspace(3)* %1212, align 4, !tbaa !5
  %1216 = add i32 %1215, %1213
  store i32 %1216, i32 addrspace(3)* %1214, align 4, !tbaa !5
  br label %1217

1217:                                             ; preds = %1210, %1203
  %1218 = add nuw nsw i32 %1161, 4
  %1219 = add nuw nsw i32 %1162, 4
  %1220 = icmp eq i32 %1219, %1159
  br i1 %1220, label %1221, label %1160, !llvm.loop !21

1221:                                             ; preds = %1217, %1155
  %1222 = phi i32 [ 0, %1155 ], [ %1218, %1217 ]
  %1223 = icmp eq i32 %1156, 0
  br i1 %1223, label %1243, label %1224

1224:                                             ; preds = %1221, %1239
  %1225 = phi i32 [ %1240, %1239 ], [ %1222, %1221 ]
  %1226 = phi i32 [ %1241, %1239 ], [ 0, %1221 ]
  %1227 = mul nuw nsw i32 %1225, %19
  %1228 = add nuw nsw i32 %1227, %9
  %1229 = shl i32 %1228, 2
  %1230 = sub i32 511, %1229
  %1231 = icmp ult i32 %1230, 512
  br i1 %1231, label %1232, label %1239

1232:                                             ; preds = %1224
  %1233 = sub i32 509, %1229
  %1234 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1233
  %1235 = load i32, i32 addrspace(3)* %1234, align 4, !tbaa !5
  %1236 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1230
  %1237 = load i32, i32 addrspace(3)* %1236, align 4, !tbaa !5
  store i32 %1237, i32 addrspace(3)* %1234, align 4, !tbaa !5
  %1238 = add i32 %1237, %1235
  store i32 %1238, i32 addrspace(3)* %1236, align 4, !tbaa !5
  br label %1239

1239:                                             ; preds = %1232, %1224
  %1240 = add nuw nsw i32 %1225, 1
  %1241 = add i32 %1226, 1
  %1242 = icmp eq i32 %1241, %1156
  br i1 %1242, label %1243, label %1224, !llvm.loop !27

1243:                                             ; preds = %1239, %1221
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1244 = and i32 %27, 3
  %1245 = icmp ult i32 %28, 3
  br i1 %1245, label %1324, label %1246

1246:                                             ; preds = %1243
  %1247 = and i32 %27, 2044
  br label %1248

1248:                                             ; preds = %1305, %1246
  %1249 = phi i32 [ 0, %1246 ], [ %1306, %1305 ]
  %1250 = phi i32 [ 0, %1246 ], [ %1307, %1305 ]
  %1251 = mul nuw nsw i32 %1249, %19
  %1252 = add nuw nsw i32 %1251, %9
  %1253 = shl nuw i32 %1252, 1
  %1254 = sub i32 511, %1253
  %1255 = icmp ult i32 %1254, 512
  br i1 %1255, label %1256, label %1263

1256:                                             ; preds = %1248
  %1257 = sub i32 510, %1253
  %1258 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1257
  %1259 = load i32, i32 addrspace(3)* %1258, align 8, !tbaa !5
  %1260 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1254
  %1261 = load i32, i32 addrspace(3)* %1260, align 4, !tbaa !5
  store i32 %1261, i32 addrspace(3)* %1258, align 8, !tbaa !5
  %1262 = add i32 %1261, %1259
  store i32 %1262, i32 addrspace(3)* %1260, align 4, !tbaa !5
  br label %1263

1263:                                             ; preds = %1256, %1248
  %1264 = or i32 %1249, 1
  %1265 = mul nuw nsw i32 %1264, %19
  %1266 = add nuw nsw i32 %1265, %9
  %1267 = shl nuw i32 %1266, 1
  %1268 = sub i32 511, %1267
  %1269 = icmp ult i32 %1268, 512
  br i1 %1269, label %1270, label %1277

1270:                                             ; preds = %1263
  %1271 = sub i32 510, %1267
  %1272 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1271
  %1273 = load i32, i32 addrspace(3)* %1272, align 8, !tbaa !5
  %1274 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1268
  %1275 = load i32, i32 addrspace(3)* %1274, align 4, !tbaa !5
  store i32 %1275, i32 addrspace(3)* %1272, align 8, !tbaa !5
  %1276 = add i32 %1275, %1273
  store i32 %1276, i32 addrspace(3)* %1274, align 4, !tbaa !5
  br label %1277

1277:                                             ; preds = %1270, %1263
  %1278 = or i32 %1249, 2
  %1279 = mul nuw nsw i32 %1278, %19
  %1280 = add nuw nsw i32 %1279, %9
  %1281 = shl nuw i32 %1280, 1
  %1282 = sub i32 511, %1281
  %1283 = icmp ult i32 %1282, 512
  br i1 %1283, label %1284, label %1291

1284:                                             ; preds = %1277
  %1285 = sub i32 510, %1281
  %1286 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1285
  %1287 = load i32, i32 addrspace(3)* %1286, align 8, !tbaa !5
  %1288 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1282
  %1289 = load i32, i32 addrspace(3)* %1288, align 4, !tbaa !5
  store i32 %1289, i32 addrspace(3)* %1286, align 8, !tbaa !5
  %1290 = add i32 %1289, %1287
  store i32 %1290, i32 addrspace(3)* %1288, align 4, !tbaa !5
  br label %1291

1291:                                             ; preds = %1284, %1277
  %1292 = or i32 %1249, 3
  %1293 = mul nuw nsw i32 %1292, %19
  %1294 = add nuw nsw i32 %1293, %9
  %1295 = shl nuw i32 %1294, 1
  %1296 = sub i32 511, %1295
  %1297 = icmp ult i32 %1296, 512
  br i1 %1297, label %1298, label %1305

1298:                                             ; preds = %1291
  %1299 = sub i32 510, %1295
  %1300 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1299
  %1301 = load i32, i32 addrspace(3)* %1300, align 8, !tbaa !5
  %1302 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1296
  %1303 = load i32, i32 addrspace(3)* %1302, align 4, !tbaa !5
  store i32 %1303, i32 addrspace(3)* %1300, align 8, !tbaa !5
  %1304 = add i32 %1303, %1301
  store i32 %1304, i32 addrspace(3)* %1302, align 4, !tbaa !5
  br label %1305

1305:                                             ; preds = %1298, %1291
  %1306 = add nuw nsw i32 %1249, 4
  %1307 = add nuw nsw i32 %1250, 4
  %1308 = icmp eq i32 %1307, %1247
  br i1 %1308, label %1324, label %1248, !llvm.loop !21

1309:                                             ; preds = %1319, %694
  %1310 = phi i32 [ %696, %694 ], [ %1320, %1319 ]
  %1311 = phi i32 [ %695, %694 ], [ %1321, %1319 ]
  %1312 = phi i32 [ 0, %694 ], [ %1322, %1319 ]
  %1313 = mul nuw nsw i32 %1312, %19
  %1314 = add nuw nsw i32 %1313, %9
  %1315 = and i32 %1314, 8388607
  %1316 = icmp eq i32 %1315, 0
  br i1 %1316, label %1317, label %1319

1317:                                             ; preds = %1309
  store i32 %1310, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 255), align 4, !tbaa !5
  %1318 = add i32 %1310, %1311
  store i32 %1318, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %1319

1319:                                             ; preds = %1317, %1309
  %1320 = phi i32 [ %1318, %1317 ], [ %1310, %1309 ]
  %1321 = phi i32 [ %1310, %1317 ], [ %1311, %1309 ]
  %1322 = add nuw nsw i32 %1312, 1
  %1323 = icmp eq i32 %1322, %614
  br i1 %1323, label %697, label %1309, !llvm.loop !21

1324:                                             ; preds = %1305, %1243
  %1325 = phi i32 [ 0, %1243 ], [ %1306, %1305 ]
  %1326 = icmp eq i32 %1244, 0
  br i1 %1326, label %1346, label %1327

1327:                                             ; preds = %1324, %1342
  %1328 = phi i32 [ %1343, %1342 ], [ %1325, %1324 ]
  %1329 = phi i32 [ %1344, %1342 ], [ 0, %1324 ]
  %1330 = mul nuw nsw i32 %1328, %19
  %1331 = add nuw nsw i32 %1330, %9
  %1332 = shl nuw i32 %1331, 1
  %1333 = sub i32 511, %1332
  %1334 = icmp ult i32 %1333, 512
  br i1 %1334, label %1335, label %1342

1335:                                             ; preds = %1327
  %1336 = sub i32 510, %1332
  %1337 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1336
  %1338 = load i32, i32 addrspace(3)* %1337, align 8, !tbaa !5
  %1339 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1333
  %1340 = load i32, i32 addrspace(3)* %1339, align 4, !tbaa !5
  store i32 %1340, i32 addrspace(3)* %1337, align 8, !tbaa !5
  %1341 = add i32 %1340, %1338
  store i32 %1341, i32 addrspace(3)* %1339, align 4, !tbaa !5
  br label %1342

1342:                                             ; preds = %1335, %1327
  %1343 = add nuw nsw i32 %1328, 1
  %1344 = add i32 %1329, 1
  %1345 = icmp eq i32 %1344, %1244
  br i1 %1345, label %1346, label %1327, !llvm.loop !28

1346:                                             ; preds = %1342, %1324
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1347 = load i32, i32 addrspace(3)* %14, align 4, !tbaa !5
  store i32 %1347, i32 addrspace(1)* %12, align 4, !tbaa !5
  %1348 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !5
  store i32 %1348, i32 addrspace(1)* %22, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %2707

1349:                                             ; preds = %3
  %1350 = and i32 %2, 511
  %1351 = icmp eq i32 %1350, 0
  br i1 %1351, label %2707, label %1352

1352:                                             ; preds = %1349
  %1353 = and i32 %2, -512
  %1354 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %1355 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1354
  store i32 0, i32 addrspace(3)* %1355, align 4, !tbaa !5
  %1356 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %1357 = getelementptr i8, i8 addrspace(4)* %1356, i64 4
  %1358 = bitcast i8 addrspace(4)* %1357 to i16 addrspace(4)*
  %1359 = load i16, i16 addrspace(4)* %1358, align 4, !range !10, !invariant.load !9
  %1360 = zext i16 %1359 to i32
  %1361 = add nuw nsw i32 %1354, %1360
  %1362 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1361
  store i32 0, i32 addrspace(3)* %1362, align 4, !tbaa !5
  %1363 = add i32 %1353, %1354
  %1364 = icmp ult i32 %1363, %2
  br i1 %1364, label %1365, label %1369

1365:                                             ; preds = %1352
  %1366 = zext i32 %1363 to i64
  %1367 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1366
  %1368 = load i32, i32 addrspace(1)* %1367, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %1368, i32 addrspace(3)* %1355, align 4, !tbaa !5
  br label %1369

1369:                                             ; preds = %1365, %1352
  %1370 = add i32 %1363, %1360
  %1371 = icmp ult i32 %1370, %2
  br i1 %1371, label %1372, label %1376

1372:                                             ; preds = %1369
  %1373 = zext i32 %1370 to i64
  %1374 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1373
  %1375 = load i32, i32 addrspace(1)* %1374, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %1375, i32 addrspace(3)* %1362, align 4, !tbaa !5
  br label %1376

1376:                                             ; preds = %1372, %1369
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1377 = add nuw nsw i32 %1360, 511
  %1378 = lshr i32 %1377, 1
  %1379 = add nsw i32 %1378, -1
  %1380 = and i32 %1378, 3
  %1381 = icmp ult i32 %1379, 3
  br i1 %1381, label %1384, label %1382

1382:                                             ; preds = %1376
  %1383 = and i32 %1378, 2044
  br label %1982

1384:                                             ; preds = %2035, %1376
  %1385 = phi i32 [ 0, %1376 ], [ %2036, %2035 ]
  %1386 = icmp eq i32 %1380, 0
  br i1 %1386, label %1405, label %1387

1387:                                             ; preds = %1384, %1401
  %1388 = phi i32 [ %1402, %1401 ], [ %1385, %1384 ]
  %1389 = phi i32 [ %1403, %1401 ], [ 0, %1384 ]
  %1390 = mul nuw nsw i32 %1388, %1360
  %1391 = add nuw nsw i32 %1390, %1354
  %1392 = shl nuw i32 %1391, 1
  %1393 = icmp ult i32 %1391, 256
  br i1 %1393, label %1394, label %1401

1394:                                             ; preds = %1387
  %1395 = add nuw nsw i32 %1392, 1
  %1396 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1392
  %1397 = load i32, i32 addrspace(3)* %1396, align 8, !tbaa !5
  %1398 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1395
  %1399 = load i32, i32 addrspace(3)* %1398, align 4, !tbaa !5
  %1400 = add i32 %1399, %1397
  store i32 %1400, i32 addrspace(3)* %1398, align 4, !tbaa !5
  br label %1401

1401:                                             ; preds = %1394, %1387
  %1402 = add nuw nsw i32 %1388, 1
  %1403 = add i32 %1389, 1
  %1404 = icmp eq i32 %1403, %1380
  br i1 %1404, label %1405, label %1387, !llvm.loop !29

1405:                                             ; preds = %1401, %1384
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1406 = lshr i32 %1377, 2
  %1407 = add nsw i32 %1406, -1
  %1408 = and i32 %1406, 3
  %1409 = icmp ult i32 %1407, 3
  br i1 %1409, label %1473, label %1410

1410:                                             ; preds = %1405
  %1411 = and i32 %1406, 1020
  br label %1412

1412:                                             ; preds = %1469, %1410
  %1413 = phi i32 [ 0, %1410 ], [ %1470, %1469 ]
  %1414 = phi i32 [ 0, %1410 ], [ %1471, %1469 ]
  %1415 = mul nuw nsw i32 %1413, %1360
  %1416 = add nuw nsw i32 %1415, %1354
  %1417 = shl i32 %1416, 2
  %1418 = icmp ult i32 %1417, 509
  br i1 %1418, label %1419, label %1427

1419:                                             ; preds = %1412
  %1420 = add nuw nsw i32 %1417, 3
  %1421 = add nuw nsw i32 %1417, 1
  %1422 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1421
  %1423 = load i32, i32 addrspace(3)* %1422, align 4, !tbaa !5
  %1424 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1420
  %1425 = load i32, i32 addrspace(3)* %1424, align 4, !tbaa !5
  %1426 = add i32 %1425, %1423
  store i32 %1426, i32 addrspace(3)* %1424, align 4, !tbaa !5
  br label %1427

1427:                                             ; preds = %1419, %1412
  %1428 = or i32 %1413, 1
  %1429 = mul nuw nsw i32 %1428, %1360
  %1430 = add nuw nsw i32 %1429, %1354
  %1431 = shl i32 %1430, 2
  %1432 = icmp ult i32 %1431, 509
  br i1 %1432, label %1433, label %1441

1433:                                             ; preds = %1427
  %1434 = add nuw nsw i32 %1431, 3
  %1435 = add nuw nsw i32 %1431, 1
  %1436 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1435
  %1437 = load i32, i32 addrspace(3)* %1436, align 4, !tbaa !5
  %1438 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1434
  %1439 = load i32, i32 addrspace(3)* %1438, align 4, !tbaa !5
  %1440 = add i32 %1439, %1437
  store i32 %1440, i32 addrspace(3)* %1438, align 4, !tbaa !5
  br label %1441

1441:                                             ; preds = %1433, %1427
  %1442 = or i32 %1413, 2
  %1443 = mul nuw nsw i32 %1442, %1360
  %1444 = add nuw nsw i32 %1443, %1354
  %1445 = shl i32 %1444, 2
  %1446 = icmp ult i32 %1445, 509
  br i1 %1446, label %1447, label %1455

1447:                                             ; preds = %1441
  %1448 = add nuw nsw i32 %1445, 3
  %1449 = add nuw nsw i32 %1445, 1
  %1450 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1449
  %1451 = load i32, i32 addrspace(3)* %1450, align 4, !tbaa !5
  %1452 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1448
  %1453 = load i32, i32 addrspace(3)* %1452, align 4, !tbaa !5
  %1454 = add i32 %1453, %1451
  store i32 %1454, i32 addrspace(3)* %1452, align 4, !tbaa !5
  br label %1455

1455:                                             ; preds = %1447, %1441
  %1456 = or i32 %1413, 3
  %1457 = mul nuw nsw i32 %1456, %1360
  %1458 = add nuw nsw i32 %1457, %1354
  %1459 = shl i32 %1458, 2
  %1460 = icmp ult i32 %1459, 509
  br i1 %1460, label %1461, label %1469

1461:                                             ; preds = %1455
  %1462 = add nuw nsw i32 %1459, 3
  %1463 = add nuw nsw i32 %1459, 1
  %1464 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1463
  %1465 = load i32, i32 addrspace(3)* %1464, align 4, !tbaa !5
  %1466 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1462
  %1467 = load i32, i32 addrspace(3)* %1466, align 4, !tbaa !5
  %1468 = add i32 %1467, %1465
  store i32 %1468, i32 addrspace(3)* %1466, align 4, !tbaa !5
  br label %1469

1469:                                             ; preds = %1461, %1455
  %1470 = add nuw nsw i32 %1413, 4
  %1471 = add nuw nsw i32 %1414, 4
  %1472 = icmp eq i32 %1471, %1411
  br i1 %1472, label %1473, label %1412, !llvm.loop !13

1473:                                             ; preds = %1469, %1405
  %1474 = phi i32 [ 0, %1405 ], [ %1470, %1469 ]
  %1475 = icmp eq i32 %1408, 0
  br i1 %1475, label %1495, label %1476

1476:                                             ; preds = %1473, %1491
  %1477 = phi i32 [ %1492, %1491 ], [ %1474, %1473 ]
  %1478 = phi i32 [ %1493, %1491 ], [ 0, %1473 ]
  %1479 = mul nuw nsw i32 %1477, %1360
  %1480 = add nuw nsw i32 %1479, %1354
  %1481 = shl i32 %1480, 2
  %1482 = icmp ult i32 %1481, 509
  br i1 %1482, label %1483, label %1491

1483:                                             ; preds = %1476
  %1484 = add nuw nsw i32 %1481, 3
  %1485 = add nuw nsw i32 %1481, 1
  %1486 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1485
  %1487 = load i32, i32 addrspace(3)* %1486, align 4, !tbaa !5
  %1488 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1484
  %1489 = load i32, i32 addrspace(3)* %1488, align 4, !tbaa !5
  %1490 = add i32 %1489, %1487
  store i32 %1490, i32 addrspace(3)* %1488, align 4, !tbaa !5
  br label %1491

1491:                                             ; preds = %1483, %1476
  %1492 = add nuw nsw i32 %1477, 1
  %1493 = add i32 %1478, 1
  %1494 = icmp eq i32 %1493, %1408
  br i1 %1494, label %1495, label %1476, !llvm.loop !30

1495:                                             ; preds = %1491, %1473
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1496 = lshr i32 %1377, 3
  %1497 = add nsw i32 %1496, -1
  %1498 = and i32 %1496, 3
  %1499 = icmp ult i32 %1497, 3
  br i1 %1499, label %1563, label %1500

1500:                                             ; preds = %1495
  %1501 = and i32 %1496, 508
  br label %1502

1502:                                             ; preds = %1559, %1500
  %1503 = phi i32 [ 0, %1500 ], [ %1560, %1559 ]
  %1504 = phi i32 [ 0, %1500 ], [ %1561, %1559 ]
  %1505 = mul nuw nsw i32 %1503, %1360
  %1506 = add nuw nsw i32 %1505, %1354
  %1507 = shl i32 %1506, 3
  %1508 = icmp ult i32 %1507, 505
  br i1 %1508, label %1509, label %1517

1509:                                             ; preds = %1502
  %1510 = add nuw nsw i32 %1507, 7
  %1511 = add nuw nsw i32 %1507, 3
  %1512 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1511
  %1513 = load i32, i32 addrspace(3)* %1512, align 4, !tbaa !5
  %1514 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1510
  %1515 = load i32, i32 addrspace(3)* %1514, align 4, !tbaa !5
  %1516 = add i32 %1515, %1513
  store i32 %1516, i32 addrspace(3)* %1514, align 4, !tbaa !5
  br label %1517

1517:                                             ; preds = %1509, %1502
  %1518 = or i32 %1503, 1
  %1519 = mul nuw nsw i32 %1518, %1360
  %1520 = add nuw nsw i32 %1519, %1354
  %1521 = shl i32 %1520, 3
  %1522 = icmp ult i32 %1521, 505
  br i1 %1522, label %1523, label %1531

1523:                                             ; preds = %1517
  %1524 = add nuw nsw i32 %1521, 7
  %1525 = add nuw nsw i32 %1521, 3
  %1526 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1525
  %1527 = load i32, i32 addrspace(3)* %1526, align 4, !tbaa !5
  %1528 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1524
  %1529 = load i32, i32 addrspace(3)* %1528, align 4, !tbaa !5
  %1530 = add i32 %1529, %1527
  store i32 %1530, i32 addrspace(3)* %1528, align 4, !tbaa !5
  br label %1531

1531:                                             ; preds = %1523, %1517
  %1532 = or i32 %1503, 2
  %1533 = mul nuw nsw i32 %1532, %1360
  %1534 = add nuw nsw i32 %1533, %1354
  %1535 = shl i32 %1534, 3
  %1536 = icmp ult i32 %1535, 505
  br i1 %1536, label %1537, label %1545

1537:                                             ; preds = %1531
  %1538 = add nuw nsw i32 %1535, 7
  %1539 = add nuw nsw i32 %1535, 3
  %1540 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1539
  %1541 = load i32, i32 addrspace(3)* %1540, align 4, !tbaa !5
  %1542 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1538
  %1543 = load i32, i32 addrspace(3)* %1542, align 4, !tbaa !5
  %1544 = add i32 %1543, %1541
  store i32 %1544, i32 addrspace(3)* %1542, align 4, !tbaa !5
  br label %1545

1545:                                             ; preds = %1537, %1531
  %1546 = or i32 %1503, 3
  %1547 = mul nuw nsw i32 %1546, %1360
  %1548 = add nuw nsw i32 %1547, %1354
  %1549 = shl i32 %1548, 3
  %1550 = icmp ult i32 %1549, 505
  br i1 %1550, label %1551, label %1559

1551:                                             ; preds = %1545
  %1552 = add nuw nsw i32 %1549, 7
  %1553 = add nuw nsw i32 %1549, 3
  %1554 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1553
  %1555 = load i32, i32 addrspace(3)* %1554, align 4, !tbaa !5
  %1556 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1552
  %1557 = load i32, i32 addrspace(3)* %1556, align 4, !tbaa !5
  %1558 = add i32 %1557, %1555
  store i32 %1558, i32 addrspace(3)* %1556, align 4, !tbaa !5
  br label %1559

1559:                                             ; preds = %1551, %1545
  %1560 = add nuw nsw i32 %1503, 4
  %1561 = add nuw nsw i32 %1504, 4
  %1562 = icmp eq i32 %1561, %1501
  br i1 %1562, label %1563, label %1502, !llvm.loop !13

1563:                                             ; preds = %1559, %1495
  %1564 = phi i32 [ 0, %1495 ], [ %1560, %1559 ]
  %1565 = icmp eq i32 %1498, 0
  br i1 %1565, label %1585, label %1566

1566:                                             ; preds = %1563, %1581
  %1567 = phi i32 [ %1582, %1581 ], [ %1564, %1563 ]
  %1568 = phi i32 [ %1583, %1581 ], [ 0, %1563 ]
  %1569 = mul nuw nsw i32 %1567, %1360
  %1570 = add nuw nsw i32 %1569, %1354
  %1571 = shl i32 %1570, 3
  %1572 = icmp ult i32 %1571, 505
  br i1 %1572, label %1573, label %1581

1573:                                             ; preds = %1566
  %1574 = add nuw nsw i32 %1571, 7
  %1575 = add nuw nsw i32 %1571, 3
  %1576 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1575
  %1577 = load i32, i32 addrspace(3)* %1576, align 4, !tbaa !5
  %1578 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1574
  %1579 = load i32, i32 addrspace(3)* %1578, align 4, !tbaa !5
  %1580 = add i32 %1579, %1577
  store i32 %1580, i32 addrspace(3)* %1578, align 4, !tbaa !5
  br label %1581

1581:                                             ; preds = %1573, %1566
  %1582 = add nuw nsw i32 %1567, 1
  %1583 = add i32 %1568, 1
  %1584 = icmp eq i32 %1583, %1498
  br i1 %1584, label %1585, label %1566, !llvm.loop !31

1585:                                             ; preds = %1581, %1563
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1586 = lshr i32 %1377, 4
  %1587 = add nsw i32 %1586, -1
  %1588 = and i32 %1586, 3
  %1589 = icmp ult i32 %1587, 3
  br i1 %1589, label %1653, label %1590

1590:                                             ; preds = %1585
  %1591 = and i32 %1586, 252
  br label %1592

1592:                                             ; preds = %1649, %1590
  %1593 = phi i32 [ 0, %1590 ], [ %1650, %1649 ]
  %1594 = phi i32 [ 0, %1590 ], [ %1651, %1649 ]
  %1595 = mul nuw nsw i32 %1593, %1360
  %1596 = add nuw nsw i32 %1595, %1354
  %1597 = shl i32 %1596, 4
  %1598 = icmp ult i32 %1597, 497
  br i1 %1598, label %1599, label %1607

1599:                                             ; preds = %1592
  %1600 = add nuw nsw i32 %1597, 15
  %1601 = add nuw nsw i32 %1597, 7
  %1602 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1601
  %1603 = load i32, i32 addrspace(3)* %1602, align 4, !tbaa !5
  %1604 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1600
  %1605 = load i32, i32 addrspace(3)* %1604, align 4, !tbaa !5
  %1606 = add i32 %1605, %1603
  store i32 %1606, i32 addrspace(3)* %1604, align 4, !tbaa !5
  br label %1607

1607:                                             ; preds = %1599, %1592
  %1608 = or i32 %1593, 1
  %1609 = mul nuw nsw i32 %1608, %1360
  %1610 = add nuw nsw i32 %1609, %1354
  %1611 = shl i32 %1610, 4
  %1612 = icmp ult i32 %1611, 497
  br i1 %1612, label %1613, label %1621

1613:                                             ; preds = %1607
  %1614 = add nuw nsw i32 %1611, 15
  %1615 = add nuw nsw i32 %1611, 7
  %1616 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1615
  %1617 = load i32, i32 addrspace(3)* %1616, align 4, !tbaa !5
  %1618 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1614
  %1619 = load i32, i32 addrspace(3)* %1618, align 4, !tbaa !5
  %1620 = add i32 %1619, %1617
  store i32 %1620, i32 addrspace(3)* %1618, align 4, !tbaa !5
  br label %1621

1621:                                             ; preds = %1613, %1607
  %1622 = or i32 %1593, 2
  %1623 = mul nuw nsw i32 %1622, %1360
  %1624 = add nuw nsw i32 %1623, %1354
  %1625 = shl i32 %1624, 4
  %1626 = icmp ult i32 %1625, 497
  br i1 %1626, label %1627, label %1635

1627:                                             ; preds = %1621
  %1628 = add nuw nsw i32 %1625, 15
  %1629 = add nuw nsw i32 %1625, 7
  %1630 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1629
  %1631 = load i32, i32 addrspace(3)* %1630, align 4, !tbaa !5
  %1632 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1628
  %1633 = load i32, i32 addrspace(3)* %1632, align 4, !tbaa !5
  %1634 = add i32 %1633, %1631
  store i32 %1634, i32 addrspace(3)* %1632, align 4, !tbaa !5
  br label %1635

1635:                                             ; preds = %1627, %1621
  %1636 = or i32 %1593, 3
  %1637 = mul nuw nsw i32 %1636, %1360
  %1638 = add nuw nsw i32 %1637, %1354
  %1639 = shl i32 %1638, 4
  %1640 = icmp ult i32 %1639, 497
  br i1 %1640, label %1641, label %1649

1641:                                             ; preds = %1635
  %1642 = add nuw nsw i32 %1639, 15
  %1643 = add nuw nsw i32 %1639, 7
  %1644 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1643
  %1645 = load i32, i32 addrspace(3)* %1644, align 4, !tbaa !5
  %1646 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1642
  %1647 = load i32, i32 addrspace(3)* %1646, align 4, !tbaa !5
  %1648 = add i32 %1647, %1645
  store i32 %1648, i32 addrspace(3)* %1646, align 4, !tbaa !5
  br label %1649

1649:                                             ; preds = %1641, %1635
  %1650 = add nuw nsw i32 %1593, 4
  %1651 = add nuw nsw i32 %1594, 4
  %1652 = icmp eq i32 %1651, %1591
  br i1 %1652, label %1653, label %1592, !llvm.loop !13

1653:                                             ; preds = %1649, %1585
  %1654 = phi i32 [ 0, %1585 ], [ %1650, %1649 ]
  %1655 = icmp eq i32 %1588, 0
  br i1 %1655, label %1675, label %1656

1656:                                             ; preds = %1653, %1671
  %1657 = phi i32 [ %1672, %1671 ], [ %1654, %1653 ]
  %1658 = phi i32 [ %1673, %1671 ], [ 0, %1653 ]
  %1659 = mul nuw nsw i32 %1657, %1360
  %1660 = add nuw nsw i32 %1659, %1354
  %1661 = shl i32 %1660, 4
  %1662 = icmp ult i32 %1661, 497
  br i1 %1662, label %1663, label %1671

1663:                                             ; preds = %1656
  %1664 = add nuw nsw i32 %1661, 15
  %1665 = add nuw nsw i32 %1661, 7
  %1666 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1665
  %1667 = load i32, i32 addrspace(3)* %1666, align 4, !tbaa !5
  %1668 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1664
  %1669 = load i32, i32 addrspace(3)* %1668, align 4, !tbaa !5
  %1670 = add i32 %1669, %1667
  store i32 %1670, i32 addrspace(3)* %1668, align 4, !tbaa !5
  br label %1671

1671:                                             ; preds = %1663, %1656
  %1672 = add nuw nsw i32 %1657, 1
  %1673 = add i32 %1658, 1
  %1674 = icmp eq i32 %1673, %1588
  br i1 %1674, label %1675, label %1656, !llvm.loop !32

1675:                                             ; preds = %1671, %1653
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1676 = lshr i32 %1377, 5
  %1677 = add nsw i32 %1676, -1
  %1678 = and i32 %1676, 3
  %1679 = icmp ult i32 %1677, 3
  br i1 %1679, label %1743, label %1680

1680:                                             ; preds = %1675
  %1681 = and i32 %1676, 124
  br label %1682

1682:                                             ; preds = %1739, %1680
  %1683 = phi i32 [ 0, %1680 ], [ %1740, %1739 ]
  %1684 = phi i32 [ 0, %1680 ], [ %1741, %1739 ]
  %1685 = mul nuw nsw i32 %1683, %1360
  %1686 = add nuw nsw i32 %1685, %1354
  %1687 = shl i32 %1686, 5
  %1688 = icmp ult i32 %1687, 481
  br i1 %1688, label %1689, label %1697

1689:                                             ; preds = %1682
  %1690 = add nuw nsw i32 %1687, 31
  %1691 = add nuw nsw i32 %1687, 15
  %1692 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1691
  %1693 = load i32, i32 addrspace(3)* %1692, align 4, !tbaa !5
  %1694 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1690
  %1695 = load i32, i32 addrspace(3)* %1694, align 4, !tbaa !5
  %1696 = add i32 %1695, %1693
  store i32 %1696, i32 addrspace(3)* %1694, align 4, !tbaa !5
  br label %1697

1697:                                             ; preds = %1689, %1682
  %1698 = or i32 %1683, 1
  %1699 = mul nuw nsw i32 %1698, %1360
  %1700 = add nuw nsw i32 %1699, %1354
  %1701 = shl i32 %1700, 5
  %1702 = icmp ult i32 %1701, 481
  br i1 %1702, label %1703, label %1711

1703:                                             ; preds = %1697
  %1704 = add nuw nsw i32 %1701, 31
  %1705 = add nuw nsw i32 %1701, 15
  %1706 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1705
  %1707 = load i32, i32 addrspace(3)* %1706, align 4, !tbaa !5
  %1708 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1704
  %1709 = load i32, i32 addrspace(3)* %1708, align 4, !tbaa !5
  %1710 = add i32 %1709, %1707
  store i32 %1710, i32 addrspace(3)* %1708, align 4, !tbaa !5
  br label %1711

1711:                                             ; preds = %1703, %1697
  %1712 = or i32 %1683, 2
  %1713 = mul nuw nsw i32 %1712, %1360
  %1714 = add nuw nsw i32 %1713, %1354
  %1715 = shl i32 %1714, 5
  %1716 = icmp ult i32 %1715, 481
  br i1 %1716, label %1717, label %1725

1717:                                             ; preds = %1711
  %1718 = add nuw nsw i32 %1715, 31
  %1719 = add nuw nsw i32 %1715, 15
  %1720 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1719
  %1721 = load i32, i32 addrspace(3)* %1720, align 4, !tbaa !5
  %1722 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1718
  %1723 = load i32, i32 addrspace(3)* %1722, align 4, !tbaa !5
  %1724 = add i32 %1723, %1721
  store i32 %1724, i32 addrspace(3)* %1722, align 4, !tbaa !5
  br label %1725

1725:                                             ; preds = %1717, %1711
  %1726 = or i32 %1683, 3
  %1727 = mul nuw nsw i32 %1726, %1360
  %1728 = add nuw nsw i32 %1727, %1354
  %1729 = shl i32 %1728, 5
  %1730 = icmp ult i32 %1729, 481
  br i1 %1730, label %1731, label %1739

1731:                                             ; preds = %1725
  %1732 = add nuw nsw i32 %1729, 31
  %1733 = add nuw nsw i32 %1729, 15
  %1734 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1733
  %1735 = load i32, i32 addrspace(3)* %1734, align 4, !tbaa !5
  %1736 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1732
  %1737 = load i32, i32 addrspace(3)* %1736, align 4, !tbaa !5
  %1738 = add i32 %1737, %1735
  store i32 %1738, i32 addrspace(3)* %1736, align 4, !tbaa !5
  br label %1739

1739:                                             ; preds = %1731, %1725
  %1740 = add nuw nsw i32 %1683, 4
  %1741 = add nuw nsw i32 %1684, 4
  %1742 = icmp eq i32 %1741, %1681
  br i1 %1742, label %1743, label %1682, !llvm.loop !13

1743:                                             ; preds = %1739, %1675
  %1744 = phi i32 [ 0, %1675 ], [ %1740, %1739 ]
  %1745 = icmp eq i32 %1678, 0
  br i1 %1745, label %1765, label %1746

1746:                                             ; preds = %1743, %1761
  %1747 = phi i32 [ %1762, %1761 ], [ %1744, %1743 ]
  %1748 = phi i32 [ %1763, %1761 ], [ 0, %1743 ]
  %1749 = mul nuw nsw i32 %1747, %1360
  %1750 = add nuw nsw i32 %1749, %1354
  %1751 = shl i32 %1750, 5
  %1752 = icmp ult i32 %1751, 481
  br i1 %1752, label %1753, label %1761

1753:                                             ; preds = %1746
  %1754 = add nuw nsw i32 %1751, 31
  %1755 = add nuw nsw i32 %1751, 15
  %1756 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1755
  %1757 = load i32, i32 addrspace(3)* %1756, align 4, !tbaa !5
  %1758 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1754
  %1759 = load i32, i32 addrspace(3)* %1758, align 4, !tbaa !5
  %1760 = add i32 %1759, %1757
  store i32 %1760, i32 addrspace(3)* %1758, align 4, !tbaa !5
  br label %1761

1761:                                             ; preds = %1753, %1746
  %1762 = add nuw nsw i32 %1747, 1
  %1763 = add i32 %1748, 1
  %1764 = icmp eq i32 %1763, %1678
  br i1 %1764, label %1765, label %1746, !llvm.loop !33

1765:                                             ; preds = %1761, %1743
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1766 = lshr i32 %1377, 6
  %1767 = add nsw i32 %1766, -1
  %1768 = and i32 %1766, 3
  %1769 = icmp ult i32 %1767, 3
  br i1 %1769, label %1833, label %1770

1770:                                             ; preds = %1765
  %1771 = and i32 %1766, 60
  br label %1772

1772:                                             ; preds = %1829, %1770
  %1773 = phi i32 [ 0, %1770 ], [ %1830, %1829 ]
  %1774 = phi i32 [ 0, %1770 ], [ %1831, %1829 ]
  %1775 = mul nuw nsw i32 %1773, %1360
  %1776 = add nuw nsw i32 %1775, %1354
  %1777 = shl i32 %1776, 6
  %1778 = icmp ult i32 %1777, 449
  br i1 %1778, label %1779, label %1787

1779:                                             ; preds = %1772
  %1780 = add nuw nsw i32 %1777, 63
  %1781 = add nuw nsw i32 %1777, 31
  %1782 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1781
  %1783 = load i32, i32 addrspace(3)* %1782, align 4, !tbaa !5
  %1784 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1780
  %1785 = load i32, i32 addrspace(3)* %1784, align 4, !tbaa !5
  %1786 = add i32 %1785, %1783
  store i32 %1786, i32 addrspace(3)* %1784, align 4, !tbaa !5
  br label %1787

1787:                                             ; preds = %1779, %1772
  %1788 = or i32 %1773, 1
  %1789 = mul nuw nsw i32 %1788, %1360
  %1790 = add nuw nsw i32 %1789, %1354
  %1791 = shl i32 %1790, 6
  %1792 = icmp ult i32 %1791, 449
  br i1 %1792, label %1793, label %1801

1793:                                             ; preds = %1787
  %1794 = add nuw nsw i32 %1791, 63
  %1795 = add nuw nsw i32 %1791, 31
  %1796 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1795
  %1797 = load i32, i32 addrspace(3)* %1796, align 4, !tbaa !5
  %1798 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1794
  %1799 = load i32, i32 addrspace(3)* %1798, align 4, !tbaa !5
  %1800 = add i32 %1799, %1797
  store i32 %1800, i32 addrspace(3)* %1798, align 4, !tbaa !5
  br label %1801

1801:                                             ; preds = %1793, %1787
  %1802 = or i32 %1773, 2
  %1803 = mul nuw nsw i32 %1802, %1360
  %1804 = add nuw nsw i32 %1803, %1354
  %1805 = shl i32 %1804, 6
  %1806 = icmp ult i32 %1805, 449
  br i1 %1806, label %1807, label %1815

1807:                                             ; preds = %1801
  %1808 = add nuw nsw i32 %1805, 63
  %1809 = add nuw nsw i32 %1805, 31
  %1810 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1809
  %1811 = load i32, i32 addrspace(3)* %1810, align 4, !tbaa !5
  %1812 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1808
  %1813 = load i32, i32 addrspace(3)* %1812, align 4, !tbaa !5
  %1814 = add i32 %1813, %1811
  store i32 %1814, i32 addrspace(3)* %1812, align 4, !tbaa !5
  br label %1815

1815:                                             ; preds = %1807, %1801
  %1816 = or i32 %1773, 3
  %1817 = mul nuw nsw i32 %1816, %1360
  %1818 = add nuw nsw i32 %1817, %1354
  %1819 = shl i32 %1818, 6
  %1820 = icmp ult i32 %1819, 449
  br i1 %1820, label %1821, label %1829

1821:                                             ; preds = %1815
  %1822 = add nuw nsw i32 %1819, 63
  %1823 = add nuw nsw i32 %1819, 31
  %1824 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1823
  %1825 = load i32, i32 addrspace(3)* %1824, align 4, !tbaa !5
  %1826 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1822
  %1827 = load i32, i32 addrspace(3)* %1826, align 4, !tbaa !5
  %1828 = add i32 %1827, %1825
  store i32 %1828, i32 addrspace(3)* %1826, align 4, !tbaa !5
  br label %1829

1829:                                             ; preds = %1821, %1815
  %1830 = add nuw nsw i32 %1773, 4
  %1831 = add nuw nsw i32 %1774, 4
  %1832 = icmp eq i32 %1831, %1771
  br i1 %1832, label %1833, label %1772, !llvm.loop !13

1833:                                             ; preds = %1829, %1765
  %1834 = phi i32 [ 0, %1765 ], [ %1830, %1829 ]
  %1835 = icmp eq i32 %1768, 0
  br i1 %1835, label %1855, label %1836

1836:                                             ; preds = %1833, %1851
  %1837 = phi i32 [ %1852, %1851 ], [ %1834, %1833 ]
  %1838 = phi i32 [ %1853, %1851 ], [ 0, %1833 ]
  %1839 = mul nuw nsw i32 %1837, %1360
  %1840 = add nuw nsw i32 %1839, %1354
  %1841 = shl i32 %1840, 6
  %1842 = icmp ult i32 %1841, 449
  br i1 %1842, label %1843, label %1851

1843:                                             ; preds = %1836
  %1844 = add nuw nsw i32 %1841, 63
  %1845 = add nuw nsw i32 %1841, 31
  %1846 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1845
  %1847 = load i32, i32 addrspace(3)* %1846, align 4, !tbaa !5
  %1848 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1844
  %1849 = load i32, i32 addrspace(3)* %1848, align 4, !tbaa !5
  %1850 = add i32 %1849, %1847
  store i32 %1850, i32 addrspace(3)* %1848, align 4, !tbaa !5
  br label %1851

1851:                                             ; preds = %1843, %1836
  %1852 = add nuw nsw i32 %1837, 1
  %1853 = add i32 %1838, 1
  %1854 = icmp eq i32 %1853, %1768
  br i1 %1854, label %1855, label %1836, !llvm.loop !34

1855:                                             ; preds = %1851, %1833
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1856 = lshr i32 %1377, 7
  %1857 = add nsw i32 %1856, -1
  %1858 = and i32 %1856, 3
  %1859 = icmp ult i32 %1857, 3
  br i1 %1859, label %1923, label %1860

1860:                                             ; preds = %1855
  %1861 = and i32 %1856, 28
  br label %1862

1862:                                             ; preds = %1919, %1860
  %1863 = phi i32 [ 0, %1860 ], [ %1920, %1919 ]
  %1864 = phi i32 [ 0, %1860 ], [ %1921, %1919 ]
  %1865 = mul nuw nsw i32 %1863, %1360
  %1866 = add nuw nsw i32 %1865, %1354
  %1867 = shl i32 %1866, 7
  %1868 = icmp ult i32 %1867, 385
  br i1 %1868, label %1869, label %1877

1869:                                             ; preds = %1862
  %1870 = add nuw nsw i32 %1867, 127
  %1871 = add nuw nsw i32 %1867, 63
  %1872 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1871
  %1873 = load i32, i32 addrspace(3)* %1872, align 4, !tbaa !5
  %1874 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1870
  %1875 = load i32, i32 addrspace(3)* %1874, align 4, !tbaa !5
  %1876 = add i32 %1875, %1873
  store i32 %1876, i32 addrspace(3)* %1874, align 4, !tbaa !5
  br label %1877

1877:                                             ; preds = %1869, %1862
  %1878 = or i32 %1863, 1
  %1879 = mul nuw nsw i32 %1878, %1360
  %1880 = add nuw nsw i32 %1879, %1354
  %1881 = shl i32 %1880, 7
  %1882 = icmp ult i32 %1881, 385
  br i1 %1882, label %1883, label %1891

1883:                                             ; preds = %1877
  %1884 = add nuw nsw i32 %1881, 127
  %1885 = add nuw nsw i32 %1881, 63
  %1886 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1885
  %1887 = load i32, i32 addrspace(3)* %1886, align 4, !tbaa !5
  %1888 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1884
  %1889 = load i32, i32 addrspace(3)* %1888, align 4, !tbaa !5
  %1890 = add i32 %1889, %1887
  store i32 %1890, i32 addrspace(3)* %1888, align 4, !tbaa !5
  br label %1891

1891:                                             ; preds = %1883, %1877
  %1892 = or i32 %1863, 2
  %1893 = mul nuw nsw i32 %1892, %1360
  %1894 = add nuw nsw i32 %1893, %1354
  %1895 = shl i32 %1894, 7
  %1896 = icmp ult i32 %1895, 385
  br i1 %1896, label %1897, label %1905

1897:                                             ; preds = %1891
  %1898 = add nuw nsw i32 %1895, 127
  %1899 = add nuw nsw i32 %1895, 63
  %1900 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1899
  %1901 = load i32, i32 addrspace(3)* %1900, align 4, !tbaa !5
  %1902 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1898
  %1903 = load i32, i32 addrspace(3)* %1902, align 4, !tbaa !5
  %1904 = add i32 %1903, %1901
  store i32 %1904, i32 addrspace(3)* %1902, align 4, !tbaa !5
  br label %1905

1905:                                             ; preds = %1897, %1891
  %1906 = or i32 %1863, 3
  %1907 = mul nuw nsw i32 %1906, %1360
  %1908 = add nuw nsw i32 %1907, %1354
  %1909 = shl i32 %1908, 7
  %1910 = icmp ult i32 %1909, 385
  br i1 %1910, label %1911, label %1919

1911:                                             ; preds = %1905
  %1912 = add nuw nsw i32 %1909, 127
  %1913 = add nuw nsw i32 %1909, 63
  %1914 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1913
  %1915 = load i32, i32 addrspace(3)* %1914, align 4, !tbaa !5
  %1916 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1912
  %1917 = load i32, i32 addrspace(3)* %1916, align 4, !tbaa !5
  %1918 = add i32 %1917, %1915
  store i32 %1918, i32 addrspace(3)* %1916, align 4, !tbaa !5
  br label %1919

1919:                                             ; preds = %1911, %1905
  %1920 = add nuw nsw i32 %1863, 4
  %1921 = add nuw nsw i32 %1864, 4
  %1922 = icmp eq i32 %1921, %1861
  br i1 %1922, label %1923, label %1862, !llvm.loop !13

1923:                                             ; preds = %1919, %1855
  %1924 = phi i32 [ 0, %1855 ], [ %1920, %1919 ]
  %1925 = icmp eq i32 %1858, 0
  br i1 %1925, label %1945, label %1926

1926:                                             ; preds = %1923, %1941
  %1927 = phi i32 [ %1942, %1941 ], [ %1924, %1923 ]
  %1928 = phi i32 [ %1943, %1941 ], [ 0, %1923 ]
  %1929 = mul nuw nsw i32 %1927, %1360
  %1930 = add nuw nsw i32 %1929, %1354
  %1931 = shl i32 %1930, 7
  %1932 = icmp ult i32 %1931, 385
  br i1 %1932, label %1933, label %1941

1933:                                             ; preds = %1926
  %1934 = add nuw nsw i32 %1931, 127
  %1935 = add nuw nsw i32 %1931, 63
  %1936 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1935
  %1937 = load i32, i32 addrspace(3)* %1936, align 4, !tbaa !5
  %1938 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1934
  %1939 = load i32, i32 addrspace(3)* %1938, align 4, !tbaa !5
  %1940 = add i32 %1939, %1937
  store i32 %1940, i32 addrspace(3)* %1938, align 4, !tbaa !5
  br label %1941

1941:                                             ; preds = %1933, %1926
  %1942 = add nuw nsw i32 %1927, 1
  %1943 = add i32 %1928, 1
  %1944 = icmp eq i32 %1943, %1858
  br i1 %1944, label %1945, label %1926, !llvm.loop !35

1945:                                             ; preds = %1941, %1923
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1946 = lshr i32 %1377, 8
  br label %1947

1947:                                             ; preds = %1961, %1945
  %1948 = phi i32 [ 0, %1945 ], [ %1962, %1961 ]
  %1949 = mul nuw nsw i32 %1948, %1360
  %1950 = add nuw nsw i32 %1949, %1354
  %1951 = shl i32 %1950, 8
  %1952 = icmp ult i32 %1951, 257
  br i1 %1952, label %1953, label %1961

1953:                                             ; preds = %1947
  %1954 = add nuw nsw i32 %1951, 255
  %1955 = add nuw nsw i32 %1951, 127
  %1956 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1955
  %1957 = load i32, i32 addrspace(3)* %1956, align 4, !tbaa !5
  %1958 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1954
  %1959 = load i32, i32 addrspace(3)* %1958, align 4, !tbaa !5
  %1960 = add i32 %1959, %1957
  store i32 %1960, i32 addrspace(3)* %1958, align 4, !tbaa !5
  br label %1961

1961:                                             ; preds = %1953, %1947
  %1962 = add nuw nsw i32 %1948, 1
  %1963 = icmp eq i32 %1962, %1946
  br i1 %1963, label %1964, label %1947, !llvm.loop !13

1964:                                             ; preds = %1961
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1965 = lshr i32 %1377, 9
  %1966 = tail call i32 @llvm.umax.i32(i32 %1965, i32 1)
  %1967 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 255), align 4
  %1968 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %1969

1969:                                             ; preds = %1978, %1964
  %1970 = phi i32 [ %1968, %1964 ], [ %1979, %1978 ]
  %1971 = phi i32 [ 0, %1964 ], [ %1980, %1978 ]
  %1972 = mul nuw nsw i32 %1971, %1360
  %1973 = add nuw nsw i32 %1972, %1354
  %1974 = and i32 %1973, 8388607
  %1975 = icmp eq i32 %1974, 0
  br i1 %1975, label %1976, label %1978

1976:                                             ; preds = %1969
  %1977 = add i32 %1970, %1967
  store i32 %1977, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %1978

1978:                                             ; preds = %1976, %1969
  %1979 = phi i32 [ %1977, %1976 ], [ %1970, %1969 ]
  %1980 = add nuw nsw i32 %1971, 1
  %1981 = icmp eq i32 %1980, %1966
  br i1 %1981, label %2039, label %1969, !llvm.loop !13

1982:                                             ; preds = %2035, %1382
  %1983 = phi i32 [ 0, %1382 ], [ %2036, %2035 ]
  %1984 = phi i32 [ 0, %1382 ], [ %2037, %2035 ]
  %1985 = mul nuw nsw i32 %1983, %1360
  %1986 = add nuw nsw i32 %1985, %1354
  %1987 = shl nuw i32 %1986, 1
  %1988 = icmp ult i32 %1986, 256
  br i1 %1988, label %1989, label %1996

1989:                                             ; preds = %1982
  %1990 = add nuw nsw i32 %1987, 1
  %1991 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1987
  %1992 = load i32, i32 addrspace(3)* %1991, align 8, !tbaa !5
  %1993 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %1990
  %1994 = load i32, i32 addrspace(3)* %1993, align 4, !tbaa !5
  %1995 = add i32 %1994, %1992
  store i32 %1995, i32 addrspace(3)* %1993, align 4, !tbaa !5
  br label %1996

1996:                                             ; preds = %1989, %1982
  %1997 = or i32 %1983, 1
  %1998 = mul nuw nsw i32 %1997, %1360
  %1999 = add nuw nsw i32 %1998, %1354
  %2000 = shl nuw i32 %1999, 1
  %2001 = icmp ult i32 %1999, 256
  br i1 %2001, label %2002, label %2009

2002:                                             ; preds = %1996
  %2003 = add nuw nsw i32 %2000, 1
  %2004 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2000
  %2005 = load i32, i32 addrspace(3)* %2004, align 8, !tbaa !5
  %2006 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2003
  %2007 = load i32, i32 addrspace(3)* %2006, align 4, !tbaa !5
  %2008 = add i32 %2007, %2005
  store i32 %2008, i32 addrspace(3)* %2006, align 4, !tbaa !5
  br label %2009

2009:                                             ; preds = %2002, %1996
  %2010 = or i32 %1983, 2
  %2011 = mul nuw nsw i32 %2010, %1360
  %2012 = add nuw nsw i32 %2011, %1354
  %2013 = shl nuw i32 %2012, 1
  %2014 = icmp ult i32 %2012, 256
  br i1 %2014, label %2015, label %2022

2015:                                             ; preds = %2009
  %2016 = add nuw nsw i32 %2013, 1
  %2017 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2013
  %2018 = load i32, i32 addrspace(3)* %2017, align 8, !tbaa !5
  %2019 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2016
  %2020 = load i32, i32 addrspace(3)* %2019, align 4, !tbaa !5
  %2021 = add i32 %2020, %2018
  store i32 %2021, i32 addrspace(3)* %2019, align 4, !tbaa !5
  br label %2022

2022:                                             ; preds = %2015, %2009
  %2023 = or i32 %1983, 3
  %2024 = mul nuw nsw i32 %2023, %1360
  %2025 = add nuw nsw i32 %2024, %1354
  %2026 = shl nuw i32 %2025, 1
  %2027 = icmp ult i32 %2025, 256
  br i1 %2027, label %2028, label %2035

2028:                                             ; preds = %2022
  %2029 = add nuw nsw i32 %2026, 1
  %2030 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2026
  %2031 = load i32, i32 addrspace(3)* %2030, align 8, !tbaa !5
  %2032 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2029
  %2033 = load i32, i32 addrspace(3)* %2032, align 4, !tbaa !5
  %2034 = add i32 %2033, %2031
  store i32 %2034, i32 addrspace(3)* %2032, align 4, !tbaa !5
  br label %2035

2035:                                             ; preds = %2028, %2022
  %2036 = add nuw nsw i32 %1983, 4
  %2037 = add nuw nsw i32 %1984, 4
  %2038 = icmp eq i32 %2037, %1383
  br i1 %2038, label %1384, label %1982, !llvm.loop !13

2039:                                             ; preds = %1978
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2040 = icmp eq i32 %1354, 0
  br i1 %2040, label %2041, label %2045

2041:                                             ; preds = %2039
  %2042 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  %2043 = zext i32 %5 to i64
  %2044 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %2043
  store i32 %2042, i32 addrspace(1)* %2044, align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %2045

2045:                                             ; preds = %2041, %2039
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2046 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 255), align 4, !tbaa !5
  %2047 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %2660

2048:                                             ; preds = %2670
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %2049

2049:                                             ; preds = %2063, %2048
  %2050 = phi i32 [ 0, %2048 ], [ %2064, %2063 ]
  %2051 = mul nuw nsw i32 %2050, %1360
  %2052 = add nuw nsw i32 %2051, %1354
  %2053 = shl i32 %2052, 8
  %2054 = sub i32 511, %2053
  %2055 = icmp ult i32 %2054, 512
  br i1 %2055, label %2056, label %2063

2056:                                             ; preds = %2049
  %2057 = sub i32 383, %2053
  %2058 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2057
  %2059 = load i32, i32 addrspace(3)* %2058, align 4, !tbaa !5
  %2060 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2054
  %2061 = load i32, i32 addrspace(3)* %2060, align 4, !tbaa !5
  store i32 %2061, i32 addrspace(3)* %2058, align 4, !tbaa !5
  %2062 = add i32 %2061, %2059
  store i32 %2062, i32 addrspace(3)* %2060, align 4, !tbaa !5
  br label %2063

2063:                                             ; preds = %2056, %2049
  %2064 = add nuw nsw i32 %2050, 1
  %2065 = icmp eq i32 %2064, %1946
  br i1 %2065, label %2066, label %2049, !llvm.loop !21

2066:                                             ; preds = %2063
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2067 = and i32 %1856, 3
  %2068 = icmp ult i32 %1857, 3
  br i1 %2068, label %2132, label %2069

2069:                                             ; preds = %2066
  %2070 = and i32 %1856, 28
  br label %2071

2071:                                             ; preds = %2128, %2069
  %2072 = phi i32 [ 0, %2069 ], [ %2129, %2128 ]
  %2073 = phi i32 [ 0, %2069 ], [ %2130, %2128 ]
  %2074 = mul nuw nsw i32 %2072, %1360
  %2075 = add nuw nsw i32 %2074, %1354
  %2076 = shl i32 %2075, 7
  %2077 = sub i32 511, %2076
  %2078 = icmp ult i32 %2077, 512
  br i1 %2078, label %2079, label %2086

2079:                                             ; preds = %2071
  %2080 = sub i32 447, %2076
  %2081 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2080
  %2082 = load i32, i32 addrspace(3)* %2081, align 4, !tbaa !5
  %2083 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2077
  %2084 = load i32, i32 addrspace(3)* %2083, align 4, !tbaa !5
  store i32 %2084, i32 addrspace(3)* %2081, align 4, !tbaa !5
  %2085 = add i32 %2084, %2082
  store i32 %2085, i32 addrspace(3)* %2083, align 4, !tbaa !5
  br label %2086

2086:                                             ; preds = %2079, %2071
  %2087 = or i32 %2072, 1
  %2088 = mul nuw nsw i32 %2087, %1360
  %2089 = add nuw nsw i32 %2088, %1354
  %2090 = shl i32 %2089, 7
  %2091 = sub i32 511, %2090
  %2092 = icmp ult i32 %2091, 512
  br i1 %2092, label %2093, label %2100

2093:                                             ; preds = %2086
  %2094 = sub i32 447, %2090
  %2095 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2094
  %2096 = load i32, i32 addrspace(3)* %2095, align 4, !tbaa !5
  %2097 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2091
  %2098 = load i32, i32 addrspace(3)* %2097, align 4, !tbaa !5
  store i32 %2098, i32 addrspace(3)* %2095, align 4, !tbaa !5
  %2099 = add i32 %2098, %2096
  store i32 %2099, i32 addrspace(3)* %2097, align 4, !tbaa !5
  br label %2100

2100:                                             ; preds = %2093, %2086
  %2101 = or i32 %2072, 2
  %2102 = mul nuw nsw i32 %2101, %1360
  %2103 = add nuw nsw i32 %2102, %1354
  %2104 = shl i32 %2103, 7
  %2105 = sub i32 511, %2104
  %2106 = icmp ult i32 %2105, 512
  br i1 %2106, label %2107, label %2114

2107:                                             ; preds = %2100
  %2108 = sub i32 447, %2104
  %2109 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2108
  %2110 = load i32, i32 addrspace(3)* %2109, align 4, !tbaa !5
  %2111 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2105
  %2112 = load i32, i32 addrspace(3)* %2111, align 4, !tbaa !5
  store i32 %2112, i32 addrspace(3)* %2109, align 4, !tbaa !5
  %2113 = add i32 %2112, %2110
  store i32 %2113, i32 addrspace(3)* %2111, align 4, !tbaa !5
  br label %2114

2114:                                             ; preds = %2107, %2100
  %2115 = or i32 %2072, 3
  %2116 = mul nuw nsw i32 %2115, %1360
  %2117 = add nuw nsw i32 %2116, %1354
  %2118 = shl i32 %2117, 7
  %2119 = sub i32 511, %2118
  %2120 = icmp ult i32 %2119, 512
  br i1 %2120, label %2121, label %2128

2121:                                             ; preds = %2114
  %2122 = sub i32 447, %2118
  %2123 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2122
  %2124 = load i32, i32 addrspace(3)* %2123, align 4, !tbaa !5
  %2125 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2119
  %2126 = load i32, i32 addrspace(3)* %2125, align 4, !tbaa !5
  store i32 %2126, i32 addrspace(3)* %2123, align 4, !tbaa !5
  %2127 = add i32 %2126, %2124
  store i32 %2127, i32 addrspace(3)* %2125, align 4, !tbaa !5
  br label %2128

2128:                                             ; preds = %2121, %2114
  %2129 = add nuw nsw i32 %2072, 4
  %2130 = add nuw nsw i32 %2073, 4
  %2131 = icmp eq i32 %2130, %2070
  br i1 %2131, label %2132, label %2071, !llvm.loop !21

2132:                                             ; preds = %2128, %2066
  %2133 = phi i32 [ 0, %2066 ], [ %2129, %2128 ]
  %2134 = icmp eq i32 %2067, 0
  br i1 %2134, label %2154, label %2135

2135:                                             ; preds = %2132, %2150
  %2136 = phi i32 [ %2151, %2150 ], [ %2133, %2132 ]
  %2137 = phi i32 [ %2152, %2150 ], [ 0, %2132 ]
  %2138 = mul nuw nsw i32 %2136, %1360
  %2139 = add nuw nsw i32 %2138, %1354
  %2140 = shl i32 %2139, 7
  %2141 = sub i32 511, %2140
  %2142 = icmp ult i32 %2141, 512
  br i1 %2142, label %2143, label %2150

2143:                                             ; preds = %2135
  %2144 = sub i32 447, %2140
  %2145 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2144
  %2146 = load i32, i32 addrspace(3)* %2145, align 4, !tbaa !5
  %2147 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2141
  %2148 = load i32, i32 addrspace(3)* %2147, align 4, !tbaa !5
  store i32 %2148, i32 addrspace(3)* %2145, align 4, !tbaa !5
  %2149 = add i32 %2148, %2146
  store i32 %2149, i32 addrspace(3)* %2147, align 4, !tbaa !5
  br label %2150

2150:                                             ; preds = %2143, %2135
  %2151 = add nuw nsw i32 %2136, 1
  %2152 = add i32 %2137, 1
  %2153 = icmp eq i32 %2152, %2067
  br i1 %2153, label %2154, label %2135, !llvm.loop !36

2154:                                             ; preds = %2150, %2132
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2155 = and i32 %1766, 3
  %2156 = icmp ult i32 %1767, 3
  br i1 %2156, label %2220, label %2157

2157:                                             ; preds = %2154
  %2158 = and i32 %1766, 60
  br label %2159

2159:                                             ; preds = %2216, %2157
  %2160 = phi i32 [ 0, %2157 ], [ %2217, %2216 ]
  %2161 = phi i32 [ 0, %2157 ], [ %2218, %2216 ]
  %2162 = mul nuw nsw i32 %2160, %1360
  %2163 = add nuw nsw i32 %2162, %1354
  %2164 = shl i32 %2163, 6
  %2165 = sub i32 511, %2164
  %2166 = icmp ult i32 %2165, 512
  br i1 %2166, label %2167, label %2174

2167:                                             ; preds = %2159
  %2168 = sub i32 479, %2164
  %2169 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2168
  %2170 = load i32, i32 addrspace(3)* %2169, align 4, !tbaa !5
  %2171 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2165
  %2172 = load i32, i32 addrspace(3)* %2171, align 4, !tbaa !5
  store i32 %2172, i32 addrspace(3)* %2169, align 4, !tbaa !5
  %2173 = add i32 %2172, %2170
  store i32 %2173, i32 addrspace(3)* %2171, align 4, !tbaa !5
  br label %2174

2174:                                             ; preds = %2167, %2159
  %2175 = or i32 %2160, 1
  %2176 = mul nuw nsw i32 %2175, %1360
  %2177 = add nuw nsw i32 %2176, %1354
  %2178 = shl i32 %2177, 6
  %2179 = sub i32 511, %2178
  %2180 = icmp ult i32 %2179, 512
  br i1 %2180, label %2181, label %2188

2181:                                             ; preds = %2174
  %2182 = sub i32 479, %2178
  %2183 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2182
  %2184 = load i32, i32 addrspace(3)* %2183, align 4, !tbaa !5
  %2185 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2179
  %2186 = load i32, i32 addrspace(3)* %2185, align 4, !tbaa !5
  store i32 %2186, i32 addrspace(3)* %2183, align 4, !tbaa !5
  %2187 = add i32 %2186, %2184
  store i32 %2187, i32 addrspace(3)* %2185, align 4, !tbaa !5
  br label %2188

2188:                                             ; preds = %2181, %2174
  %2189 = or i32 %2160, 2
  %2190 = mul nuw nsw i32 %2189, %1360
  %2191 = add nuw nsw i32 %2190, %1354
  %2192 = shl i32 %2191, 6
  %2193 = sub i32 511, %2192
  %2194 = icmp ult i32 %2193, 512
  br i1 %2194, label %2195, label %2202

2195:                                             ; preds = %2188
  %2196 = sub i32 479, %2192
  %2197 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2196
  %2198 = load i32, i32 addrspace(3)* %2197, align 4, !tbaa !5
  %2199 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2193
  %2200 = load i32, i32 addrspace(3)* %2199, align 4, !tbaa !5
  store i32 %2200, i32 addrspace(3)* %2197, align 4, !tbaa !5
  %2201 = add i32 %2200, %2198
  store i32 %2201, i32 addrspace(3)* %2199, align 4, !tbaa !5
  br label %2202

2202:                                             ; preds = %2195, %2188
  %2203 = or i32 %2160, 3
  %2204 = mul nuw nsw i32 %2203, %1360
  %2205 = add nuw nsw i32 %2204, %1354
  %2206 = shl i32 %2205, 6
  %2207 = sub i32 511, %2206
  %2208 = icmp ult i32 %2207, 512
  br i1 %2208, label %2209, label %2216

2209:                                             ; preds = %2202
  %2210 = sub i32 479, %2206
  %2211 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2210
  %2212 = load i32, i32 addrspace(3)* %2211, align 4, !tbaa !5
  %2213 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2207
  %2214 = load i32, i32 addrspace(3)* %2213, align 4, !tbaa !5
  store i32 %2214, i32 addrspace(3)* %2211, align 4, !tbaa !5
  %2215 = add i32 %2214, %2212
  store i32 %2215, i32 addrspace(3)* %2213, align 4, !tbaa !5
  br label %2216

2216:                                             ; preds = %2209, %2202
  %2217 = add nuw nsw i32 %2160, 4
  %2218 = add nuw nsw i32 %2161, 4
  %2219 = icmp eq i32 %2218, %2158
  br i1 %2219, label %2220, label %2159, !llvm.loop !21

2220:                                             ; preds = %2216, %2154
  %2221 = phi i32 [ 0, %2154 ], [ %2217, %2216 ]
  %2222 = icmp eq i32 %2155, 0
  br i1 %2222, label %2242, label %2223

2223:                                             ; preds = %2220, %2238
  %2224 = phi i32 [ %2239, %2238 ], [ %2221, %2220 ]
  %2225 = phi i32 [ %2240, %2238 ], [ 0, %2220 ]
  %2226 = mul nuw nsw i32 %2224, %1360
  %2227 = add nuw nsw i32 %2226, %1354
  %2228 = shl i32 %2227, 6
  %2229 = sub i32 511, %2228
  %2230 = icmp ult i32 %2229, 512
  br i1 %2230, label %2231, label %2238

2231:                                             ; preds = %2223
  %2232 = sub i32 479, %2228
  %2233 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2232
  %2234 = load i32, i32 addrspace(3)* %2233, align 4, !tbaa !5
  %2235 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2229
  %2236 = load i32, i32 addrspace(3)* %2235, align 4, !tbaa !5
  store i32 %2236, i32 addrspace(3)* %2233, align 4, !tbaa !5
  %2237 = add i32 %2236, %2234
  store i32 %2237, i32 addrspace(3)* %2235, align 4, !tbaa !5
  br label %2238

2238:                                             ; preds = %2231, %2223
  %2239 = add nuw nsw i32 %2224, 1
  %2240 = add i32 %2225, 1
  %2241 = icmp eq i32 %2240, %2155
  br i1 %2241, label %2242, label %2223, !llvm.loop !37

2242:                                             ; preds = %2238, %2220
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2243 = and i32 %1676, 3
  %2244 = icmp ult i32 %1677, 3
  br i1 %2244, label %2308, label %2245

2245:                                             ; preds = %2242
  %2246 = and i32 %1676, 124
  br label %2247

2247:                                             ; preds = %2304, %2245
  %2248 = phi i32 [ 0, %2245 ], [ %2305, %2304 ]
  %2249 = phi i32 [ 0, %2245 ], [ %2306, %2304 ]
  %2250 = mul nuw nsw i32 %2248, %1360
  %2251 = add nuw nsw i32 %2250, %1354
  %2252 = shl i32 %2251, 5
  %2253 = sub i32 511, %2252
  %2254 = icmp ult i32 %2253, 512
  br i1 %2254, label %2255, label %2262

2255:                                             ; preds = %2247
  %2256 = sub i32 495, %2252
  %2257 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2256
  %2258 = load i32, i32 addrspace(3)* %2257, align 4, !tbaa !5
  %2259 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2253
  %2260 = load i32, i32 addrspace(3)* %2259, align 4, !tbaa !5
  store i32 %2260, i32 addrspace(3)* %2257, align 4, !tbaa !5
  %2261 = add i32 %2260, %2258
  store i32 %2261, i32 addrspace(3)* %2259, align 4, !tbaa !5
  br label %2262

2262:                                             ; preds = %2255, %2247
  %2263 = or i32 %2248, 1
  %2264 = mul nuw nsw i32 %2263, %1360
  %2265 = add nuw nsw i32 %2264, %1354
  %2266 = shl i32 %2265, 5
  %2267 = sub i32 511, %2266
  %2268 = icmp ult i32 %2267, 512
  br i1 %2268, label %2269, label %2276

2269:                                             ; preds = %2262
  %2270 = sub i32 495, %2266
  %2271 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2270
  %2272 = load i32, i32 addrspace(3)* %2271, align 4, !tbaa !5
  %2273 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2267
  %2274 = load i32, i32 addrspace(3)* %2273, align 4, !tbaa !5
  store i32 %2274, i32 addrspace(3)* %2271, align 4, !tbaa !5
  %2275 = add i32 %2274, %2272
  store i32 %2275, i32 addrspace(3)* %2273, align 4, !tbaa !5
  br label %2276

2276:                                             ; preds = %2269, %2262
  %2277 = or i32 %2248, 2
  %2278 = mul nuw nsw i32 %2277, %1360
  %2279 = add nuw nsw i32 %2278, %1354
  %2280 = shl i32 %2279, 5
  %2281 = sub i32 511, %2280
  %2282 = icmp ult i32 %2281, 512
  br i1 %2282, label %2283, label %2290

2283:                                             ; preds = %2276
  %2284 = sub i32 495, %2280
  %2285 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2284
  %2286 = load i32, i32 addrspace(3)* %2285, align 4, !tbaa !5
  %2287 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2281
  %2288 = load i32, i32 addrspace(3)* %2287, align 4, !tbaa !5
  store i32 %2288, i32 addrspace(3)* %2285, align 4, !tbaa !5
  %2289 = add i32 %2288, %2286
  store i32 %2289, i32 addrspace(3)* %2287, align 4, !tbaa !5
  br label %2290

2290:                                             ; preds = %2283, %2276
  %2291 = or i32 %2248, 3
  %2292 = mul nuw nsw i32 %2291, %1360
  %2293 = add nuw nsw i32 %2292, %1354
  %2294 = shl i32 %2293, 5
  %2295 = sub i32 511, %2294
  %2296 = icmp ult i32 %2295, 512
  br i1 %2296, label %2297, label %2304

2297:                                             ; preds = %2290
  %2298 = sub i32 495, %2294
  %2299 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2298
  %2300 = load i32, i32 addrspace(3)* %2299, align 4, !tbaa !5
  %2301 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2295
  %2302 = load i32, i32 addrspace(3)* %2301, align 4, !tbaa !5
  store i32 %2302, i32 addrspace(3)* %2299, align 4, !tbaa !5
  %2303 = add i32 %2302, %2300
  store i32 %2303, i32 addrspace(3)* %2301, align 4, !tbaa !5
  br label %2304

2304:                                             ; preds = %2297, %2290
  %2305 = add nuw nsw i32 %2248, 4
  %2306 = add nuw nsw i32 %2249, 4
  %2307 = icmp eq i32 %2306, %2246
  br i1 %2307, label %2308, label %2247, !llvm.loop !21

2308:                                             ; preds = %2304, %2242
  %2309 = phi i32 [ 0, %2242 ], [ %2305, %2304 ]
  %2310 = icmp eq i32 %2243, 0
  br i1 %2310, label %2330, label %2311

2311:                                             ; preds = %2308, %2326
  %2312 = phi i32 [ %2327, %2326 ], [ %2309, %2308 ]
  %2313 = phi i32 [ %2328, %2326 ], [ 0, %2308 ]
  %2314 = mul nuw nsw i32 %2312, %1360
  %2315 = add nuw nsw i32 %2314, %1354
  %2316 = shl i32 %2315, 5
  %2317 = sub i32 511, %2316
  %2318 = icmp ult i32 %2317, 512
  br i1 %2318, label %2319, label %2326

2319:                                             ; preds = %2311
  %2320 = sub i32 495, %2316
  %2321 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2320
  %2322 = load i32, i32 addrspace(3)* %2321, align 4, !tbaa !5
  %2323 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2317
  %2324 = load i32, i32 addrspace(3)* %2323, align 4, !tbaa !5
  store i32 %2324, i32 addrspace(3)* %2321, align 4, !tbaa !5
  %2325 = add i32 %2324, %2322
  store i32 %2325, i32 addrspace(3)* %2323, align 4, !tbaa !5
  br label %2326

2326:                                             ; preds = %2319, %2311
  %2327 = add nuw nsw i32 %2312, 1
  %2328 = add i32 %2313, 1
  %2329 = icmp eq i32 %2328, %2243
  br i1 %2329, label %2330, label %2311, !llvm.loop !38

2330:                                             ; preds = %2326, %2308
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2331 = and i32 %1586, 3
  %2332 = icmp ult i32 %1587, 3
  br i1 %2332, label %2396, label %2333

2333:                                             ; preds = %2330
  %2334 = and i32 %1586, 252
  br label %2335

2335:                                             ; preds = %2392, %2333
  %2336 = phi i32 [ 0, %2333 ], [ %2393, %2392 ]
  %2337 = phi i32 [ 0, %2333 ], [ %2394, %2392 ]
  %2338 = mul nuw nsw i32 %2336, %1360
  %2339 = add nuw nsw i32 %2338, %1354
  %2340 = shl i32 %2339, 4
  %2341 = sub i32 511, %2340
  %2342 = icmp ult i32 %2341, 512
  br i1 %2342, label %2343, label %2350

2343:                                             ; preds = %2335
  %2344 = sub i32 503, %2340
  %2345 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2344
  %2346 = load i32, i32 addrspace(3)* %2345, align 4, !tbaa !5
  %2347 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2341
  %2348 = load i32, i32 addrspace(3)* %2347, align 4, !tbaa !5
  store i32 %2348, i32 addrspace(3)* %2345, align 4, !tbaa !5
  %2349 = add i32 %2348, %2346
  store i32 %2349, i32 addrspace(3)* %2347, align 4, !tbaa !5
  br label %2350

2350:                                             ; preds = %2343, %2335
  %2351 = or i32 %2336, 1
  %2352 = mul nuw nsw i32 %2351, %1360
  %2353 = add nuw nsw i32 %2352, %1354
  %2354 = shl i32 %2353, 4
  %2355 = sub i32 511, %2354
  %2356 = icmp ult i32 %2355, 512
  br i1 %2356, label %2357, label %2364

2357:                                             ; preds = %2350
  %2358 = sub i32 503, %2354
  %2359 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2358
  %2360 = load i32, i32 addrspace(3)* %2359, align 4, !tbaa !5
  %2361 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2355
  %2362 = load i32, i32 addrspace(3)* %2361, align 4, !tbaa !5
  store i32 %2362, i32 addrspace(3)* %2359, align 4, !tbaa !5
  %2363 = add i32 %2362, %2360
  store i32 %2363, i32 addrspace(3)* %2361, align 4, !tbaa !5
  br label %2364

2364:                                             ; preds = %2357, %2350
  %2365 = or i32 %2336, 2
  %2366 = mul nuw nsw i32 %2365, %1360
  %2367 = add nuw nsw i32 %2366, %1354
  %2368 = shl i32 %2367, 4
  %2369 = sub i32 511, %2368
  %2370 = icmp ult i32 %2369, 512
  br i1 %2370, label %2371, label %2378

2371:                                             ; preds = %2364
  %2372 = sub i32 503, %2368
  %2373 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2372
  %2374 = load i32, i32 addrspace(3)* %2373, align 4, !tbaa !5
  %2375 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2369
  %2376 = load i32, i32 addrspace(3)* %2375, align 4, !tbaa !5
  store i32 %2376, i32 addrspace(3)* %2373, align 4, !tbaa !5
  %2377 = add i32 %2376, %2374
  store i32 %2377, i32 addrspace(3)* %2375, align 4, !tbaa !5
  br label %2378

2378:                                             ; preds = %2371, %2364
  %2379 = or i32 %2336, 3
  %2380 = mul nuw nsw i32 %2379, %1360
  %2381 = add nuw nsw i32 %2380, %1354
  %2382 = shl i32 %2381, 4
  %2383 = sub i32 511, %2382
  %2384 = icmp ult i32 %2383, 512
  br i1 %2384, label %2385, label %2392

2385:                                             ; preds = %2378
  %2386 = sub i32 503, %2382
  %2387 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2386
  %2388 = load i32, i32 addrspace(3)* %2387, align 4, !tbaa !5
  %2389 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2383
  %2390 = load i32, i32 addrspace(3)* %2389, align 4, !tbaa !5
  store i32 %2390, i32 addrspace(3)* %2387, align 4, !tbaa !5
  %2391 = add i32 %2390, %2388
  store i32 %2391, i32 addrspace(3)* %2389, align 4, !tbaa !5
  br label %2392

2392:                                             ; preds = %2385, %2378
  %2393 = add nuw nsw i32 %2336, 4
  %2394 = add nuw nsw i32 %2337, 4
  %2395 = icmp eq i32 %2394, %2334
  br i1 %2395, label %2396, label %2335, !llvm.loop !21

2396:                                             ; preds = %2392, %2330
  %2397 = phi i32 [ 0, %2330 ], [ %2393, %2392 ]
  %2398 = icmp eq i32 %2331, 0
  br i1 %2398, label %2418, label %2399

2399:                                             ; preds = %2396, %2414
  %2400 = phi i32 [ %2415, %2414 ], [ %2397, %2396 ]
  %2401 = phi i32 [ %2416, %2414 ], [ 0, %2396 ]
  %2402 = mul nuw nsw i32 %2400, %1360
  %2403 = add nuw nsw i32 %2402, %1354
  %2404 = shl i32 %2403, 4
  %2405 = sub i32 511, %2404
  %2406 = icmp ult i32 %2405, 512
  br i1 %2406, label %2407, label %2414

2407:                                             ; preds = %2399
  %2408 = sub i32 503, %2404
  %2409 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2408
  %2410 = load i32, i32 addrspace(3)* %2409, align 4, !tbaa !5
  %2411 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2405
  %2412 = load i32, i32 addrspace(3)* %2411, align 4, !tbaa !5
  store i32 %2412, i32 addrspace(3)* %2409, align 4, !tbaa !5
  %2413 = add i32 %2412, %2410
  store i32 %2413, i32 addrspace(3)* %2411, align 4, !tbaa !5
  br label %2414

2414:                                             ; preds = %2407, %2399
  %2415 = add nuw nsw i32 %2400, 1
  %2416 = add i32 %2401, 1
  %2417 = icmp eq i32 %2416, %2331
  br i1 %2417, label %2418, label %2399, !llvm.loop !39

2418:                                             ; preds = %2414, %2396
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2419 = and i32 %1496, 3
  %2420 = icmp ult i32 %1497, 3
  br i1 %2420, label %2484, label %2421

2421:                                             ; preds = %2418
  %2422 = and i32 %1496, 508
  br label %2423

2423:                                             ; preds = %2480, %2421
  %2424 = phi i32 [ 0, %2421 ], [ %2481, %2480 ]
  %2425 = phi i32 [ 0, %2421 ], [ %2482, %2480 ]
  %2426 = mul nuw nsw i32 %2424, %1360
  %2427 = add nuw nsw i32 %2426, %1354
  %2428 = shl i32 %2427, 3
  %2429 = sub i32 511, %2428
  %2430 = icmp ult i32 %2429, 512
  br i1 %2430, label %2431, label %2438

2431:                                             ; preds = %2423
  %2432 = sub i32 507, %2428
  %2433 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2432
  %2434 = load i32, i32 addrspace(3)* %2433, align 4, !tbaa !5
  %2435 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2429
  %2436 = load i32, i32 addrspace(3)* %2435, align 4, !tbaa !5
  store i32 %2436, i32 addrspace(3)* %2433, align 4, !tbaa !5
  %2437 = add i32 %2436, %2434
  store i32 %2437, i32 addrspace(3)* %2435, align 4, !tbaa !5
  br label %2438

2438:                                             ; preds = %2431, %2423
  %2439 = or i32 %2424, 1
  %2440 = mul nuw nsw i32 %2439, %1360
  %2441 = add nuw nsw i32 %2440, %1354
  %2442 = shl i32 %2441, 3
  %2443 = sub i32 511, %2442
  %2444 = icmp ult i32 %2443, 512
  br i1 %2444, label %2445, label %2452

2445:                                             ; preds = %2438
  %2446 = sub i32 507, %2442
  %2447 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2446
  %2448 = load i32, i32 addrspace(3)* %2447, align 4, !tbaa !5
  %2449 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2443
  %2450 = load i32, i32 addrspace(3)* %2449, align 4, !tbaa !5
  store i32 %2450, i32 addrspace(3)* %2447, align 4, !tbaa !5
  %2451 = add i32 %2450, %2448
  store i32 %2451, i32 addrspace(3)* %2449, align 4, !tbaa !5
  br label %2452

2452:                                             ; preds = %2445, %2438
  %2453 = or i32 %2424, 2
  %2454 = mul nuw nsw i32 %2453, %1360
  %2455 = add nuw nsw i32 %2454, %1354
  %2456 = shl i32 %2455, 3
  %2457 = sub i32 511, %2456
  %2458 = icmp ult i32 %2457, 512
  br i1 %2458, label %2459, label %2466

2459:                                             ; preds = %2452
  %2460 = sub i32 507, %2456
  %2461 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2460
  %2462 = load i32, i32 addrspace(3)* %2461, align 4, !tbaa !5
  %2463 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2457
  %2464 = load i32, i32 addrspace(3)* %2463, align 4, !tbaa !5
  store i32 %2464, i32 addrspace(3)* %2461, align 4, !tbaa !5
  %2465 = add i32 %2464, %2462
  store i32 %2465, i32 addrspace(3)* %2463, align 4, !tbaa !5
  br label %2466

2466:                                             ; preds = %2459, %2452
  %2467 = or i32 %2424, 3
  %2468 = mul nuw nsw i32 %2467, %1360
  %2469 = add nuw nsw i32 %2468, %1354
  %2470 = shl i32 %2469, 3
  %2471 = sub i32 511, %2470
  %2472 = icmp ult i32 %2471, 512
  br i1 %2472, label %2473, label %2480

2473:                                             ; preds = %2466
  %2474 = sub i32 507, %2470
  %2475 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2474
  %2476 = load i32, i32 addrspace(3)* %2475, align 4, !tbaa !5
  %2477 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2471
  %2478 = load i32, i32 addrspace(3)* %2477, align 4, !tbaa !5
  store i32 %2478, i32 addrspace(3)* %2475, align 4, !tbaa !5
  %2479 = add i32 %2478, %2476
  store i32 %2479, i32 addrspace(3)* %2477, align 4, !tbaa !5
  br label %2480

2480:                                             ; preds = %2473, %2466
  %2481 = add nuw nsw i32 %2424, 4
  %2482 = add nuw nsw i32 %2425, 4
  %2483 = icmp eq i32 %2482, %2422
  br i1 %2483, label %2484, label %2423, !llvm.loop !21

2484:                                             ; preds = %2480, %2418
  %2485 = phi i32 [ 0, %2418 ], [ %2481, %2480 ]
  %2486 = icmp eq i32 %2419, 0
  br i1 %2486, label %2506, label %2487

2487:                                             ; preds = %2484, %2502
  %2488 = phi i32 [ %2503, %2502 ], [ %2485, %2484 ]
  %2489 = phi i32 [ %2504, %2502 ], [ 0, %2484 ]
  %2490 = mul nuw nsw i32 %2488, %1360
  %2491 = add nuw nsw i32 %2490, %1354
  %2492 = shl i32 %2491, 3
  %2493 = sub i32 511, %2492
  %2494 = icmp ult i32 %2493, 512
  br i1 %2494, label %2495, label %2502

2495:                                             ; preds = %2487
  %2496 = sub i32 507, %2492
  %2497 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2496
  %2498 = load i32, i32 addrspace(3)* %2497, align 4, !tbaa !5
  %2499 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2493
  %2500 = load i32, i32 addrspace(3)* %2499, align 4, !tbaa !5
  store i32 %2500, i32 addrspace(3)* %2497, align 4, !tbaa !5
  %2501 = add i32 %2500, %2498
  store i32 %2501, i32 addrspace(3)* %2499, align 4, !tbaa !5
  br label %2502

2502:                                             ; preds = %2495, %2487
  %2503 = add nuw nsw i32 %2488, 1
  %2504 = add i32 %2489, 1
  %2505 = icmp eq i32 %2504, %2419
  br i1 %2505, label %2506, label %2487, !llvm.loop !40

2506:                                             ; preds = %2502, %2484
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2507 = and i32 %1406, 3
  %2508 = icmp ult i32 %1407, 3
  br i1 %2508, label %2572, label %2509

2509:                                             ; preds = %2506
  %2510 = and i32 %1406, 1020
  br label %2511

2511:                                             ; preds = %2568, %2509
  %2512 = phi i32 [ 0, %2509 ], [ %2569, %2568 ]
  %2513 = phi i32 [ 0, %2509 ], [ %2570, %2568 ]
  %2514 = mul nuw nsw i32 %2512, %1360
  %2515 = add nuw nsw i32 %2514, %1354
  %2516 = shl i32 %2515, 2
  %2517 = sub i32 511, %2516
  %2518 = icmp ult i32 %2517, 512
  br i1 %2518, label %2519, label %2526

2519:                                             ; preds = %2511
  %2520 = sub i32 509, %2516
  %2521 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2520
  %2522 = load i32, i32 addrspace(3)* %2521, align 4, !tbaa !5
  %2523 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2517
  %2524 = load i32, i32 addrspace(3)* %2523, align 4, !tbaa !5
  store i32 %2524, i32 addrspace(3)* %2521, align 4, !tbaa !5
  %2525 = add i32 %2524, %2522
  store i32 %2525, i32 addrspace(3)* %2523, align 4, !tbaa !5
  br label %2526

2526:                                             ; preds = %2519, %2511
  %2527 = or i32 %2512, 1
  %2528 = mul nuw nsw i32 %2527, %1360
  %2529 = add nuw nsw i32 %2528, %1354
  %2530 = shl i32 %2529, 2
  %2531 = sub i32 511, %2530
  %2532 = icmp ult i32 %2531, 512
  br i1 %2532, label %2533, label %2540

2533:                                             ; preds = %2526
  %2534 = sub i32 509, %2530
  %2535 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2534
  %2536 = load i32, i32 addrspace(3)* %2535, align 4, !tbaa !5
  %2537 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2531
  %2538 = load i32, i32 addrspace(3)* %2537, align 4, !tbaa !5
  store i32 %2538, i32 addrspace(3)* %2535, align 4, !tbaa !5
  %2539 = add i32 %2538, %2536
  store i32 %2539, i32 addrspace(3)* %2537, align 4, !tbaa !5
  br label %2540

2540:                                             ; preds = %2533, %2526
  %2541 = or i32 %2512, 2
  %2542 = mul nuw nsw i32 %2541, %1360
  %2543 = add nuw nsw i32 %2542, %1354
  %2544 = shl i32 %2543, 2
  %2545 = sub i32 511, %2544
  %2546 = icmp ult i32 %2545, 512
  br i1 %2546, label %2547, label %2554

2547:                                             ; preds = %2540
  %2548 = sub i32 509, %2544
  %2549 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2548
  %2550 = load i32, i32 addrspace(3)* %2549, align 4, !tbaa !5
  %2551 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2545
  %2552 = load i32, i32 addrspace(3)* %2551, align 4, !tbaa !5
  store i32 %2552, i32 addrspace(3)* %2549, align 4, !tbaa !5
  %2553 = add i32 %2552, %2550
  store i32 %2553, i32 addrspace(3)* %2551, align 4, !tbaa !5
  br label %2554

2554:                                             ; preds = %2547, %2540
  %2555 = or i32 %2512, 3
  %2556 = mul nuw nsw i32 %2555, %1360
  %2557 = add nuw nsw i32 %2556, %1354
  %2558 = shl i32 %2557, 2
  %2559 = sub i32 511, %2558
  %2560 = icmp ult i32 %2559, 512
  br i1 %2560, label %2561, label %2568

2561:                                             ; preds = %2554
  %2562 = sub i32 509, %2558
  %2563 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2562
  %2564 = load i32, i32 addrspace(3)* %2563, align 4, !tbaa !5
  %2565 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2559
  %2566 = load i32, i32 addrspace(3)* %2565, align 4, !tbaa !5
  store i32 %2566, i32 addrspace(3)* %2563, align 4, !tbaa !5
  %2567 = add i32 %2566, %2564
  store i32 %2567, i32 addrspace(3)* %2565, align 4, !tbaa !5
  br label %2568

2568:                                             ; preds = %2561, %2554
  %2569 = add nuw nsw i32 %2512, 4
  %2570 = add nuw nsw i32 %2513, 4
  %2571 = icmp eq i32 %2570, %2510
  br i1 %2571, label %2572, label %2511, !llvm.loop !21

2572:                                             ; preds = %2568, %2506
  %2573 = phi i32 [ 0, %2506 ], [ %2569, %2568 ]
  %2574 = icmp eq i32 %2507, 0
  br i1 %2574, label %2594, label %2575

2575:                                             ; preds = %2572, %2590
  %2576 = phi i32 [ %2591, %2590 ], [ %2573, %2572 ]
  %2577 = phi i32 [ %2592, %2590 ], [ 0, %2572 ]
  %2578 = mul nuw nsw i32 %2576, %1360
  %2579 = add nuw nsw i32 %2578, %1354
  %2580 = shl i32 %2579, 2
  %2581 = sub i32 511, %2580
  %2582 = icmp ult i32 %2581, 512
  br i1 %2582, label %2583, label %2590

2583:                                             ; preds = %2575
  %2584 = sub i32 509, %2580
  %2585 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2584
  %2586 = load i32, i32 addrspace(3)* %2585, align 4, !tbaa !5
  %2587 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2581
  %2588 = load i32, i32 addrspace(3)* %2587, align 4, !tbaa !5
  store i32 %2588, i32 addrspace(3)* %2585, align 4, !tbaa !5
  %2589 = add i32 %2588, %2586
  store i32 %2589, i32 addrspace(3)* %2587, align 4, !tbaa !5
  br label %2590

2590:                                             ; preds = %2583, %2575
  %2591 = add nuw nsw i32 %2576, 1
  %2592 = add i32 %2577, 1
  %2593 = icmp eq i32 %2592, %2507
  br i1 %2593, label %2594, label %2575, !llvm.loop !41

2594:                                             ; preds = %2590, %2572
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2595 = and i32 %1378, 3
  %2596 = icmp ult i32 %1379, 3
  br i1 %2596, label %2675, label %2597

2597:                                             ; preds = %2594
  %2598 = and i32 %1378, 2044
  br label %2599

2599:                                             ; preds = %2656, %2597
  %2600 = phi i32 [ 0, %2597 ], [ %2657, %2656 ]
  %2601 = phi i32 [ 0, %2597 ], [ %2658, %2656 ]
  %2602 = mul nuw nsw i32 %2600, %1360
  %2603 = add nuw nsw i32 %2602, %1354
  %2604 = shl nuw i32 %2603, 1
  %2605 = sub i32 511, %2604
  %2606 = icmp ult i32 %2605, 512
  br i1 %2606, label %2607, label %2614

2607:                                             ; preds = %2599
  %2608 = sub i32 510, %2604
  %2609 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2608
  %2610 = load i32, i32 addrspace(3)* %2609, align 8, !tbaa !5
  %2611 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2605
  %2612 = load i32, i32 addrspace(3)* %2611, align 4, !tbaa !5
  store i32 %2612, i32 addrspace(3)* %2609, align 8, !tbaa !5
  %2613 = add i32 %2612, %2610
  store i32 %2613, i32 addrspace(3)* %2611, align 4, !tbaa !5
  br label %2614

2614:                                             ; preds = %2607, %2599
  %2615 = or i32 %2600, 1
  %2616 = mul nuw nsw i32 %2615, %1360
  %2617 = add nuw nsw i32 %2616, %1354
  %2618 = shl nuw i32 %2617, 1
  %2619 = sub i32 511, %2618
  %2620 = icmp ult i32 %2619, 512
  br i1 %2620, label %2621, label %2628

2621:                                             ; preds = %2614
  %2622 = sub i32 510, %2618
  %2623 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2622
  %2624 = load i32, i32 addrspace(3)* %2623, align 8, !tbaa !5
  %2625 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2619
  %2626 = load i32, i32 addrspace(3)* %2625, align 4, !tbaa !5
  store i32 %2626, i32 addrspace(3)* %2623, align 8, !tbaa !5
  %2627 = add i32 %2626, %2624
  store i32 %2627, i32 addrspace(3)* %2625, align 4, !tbaa !5
  br label %2628

2628:                                             ; preds = %2621, %2614
  %2629 = or i32 %2600, 2
  %2630 = mul nuw nsw i32 %2629, %1360
  %2631 = add nuw nsw i32 %2630, %1354
  %2632 = shl nuw i32 %2631, 1
  %2633 = sub i32 511, %2632
  %2634 = icmp ult i32 %2633, 512
  br i1 %2634, label %2635, label %2642

2635:                                             ; preds = %2628
  %2636 = sub i32 510, %2632
  %2637 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2636
  %2638 = load i32, i32 addrspace(3)* %2637, align 8, !tbaa !5
  %2639 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2633
  %2640 = load i32, i32 addrspace(3)* %2639, align 4, !tbaa !5
  store i32 %2640, i32 addrspace(3)* %2637, align 8, !tbaa !5
  %2641 = add i32 %2640, %2638
  store i32 %2641, i32 addrspace(3)* %2639, align 4, !tbaa !5
  br label %2642

2642:                                             ; preds = %2635, %2628
  %2643 = or i32 %2600, 3
  %2644 = mul nuw nsw i32 %2643, %1360
  %2645 = add nuw nsw i32 %2644, %1354
  %2646 = shl nuw i32 %2645, 1
  %2647 = sub i32 511, %2646
  %2648 = icmp ult i32 %2647, 512
  br i1 %2648, label %2649, label %2656

2649:                                             ; preds = %2642
  %2650 = sub i32 510, %2646
  %2651 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2650
  %2652 = load i32, i32 addrspace(3)* %2651, align 8, !tbaa !5
  %2653 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2647
  %2654 = load i32, i32 addrspace(3)* %2653, align 4, !tbaa !5
  store i32 %2654, i32 addrspace(3)* %2651, align 8, !tbaa !5
  %2655 = add i32 %2654, %2652
  store i32 %2655, i32 addrspace(3)* %2653, align 4, !tbaa !5
  br label %2656

2656:                                             ; preds = %2649, %2642
  %2657 = add nuw nsw i32 %2600, 4
  %2658 = add nuw nsw i32 %2601, 4
  %2659 = icmp eq i32 %2658, %2598
  br i1 %2659, label %2675, label %2599, !llvm.loop !21

2660:                                             ; preds = %2670, %2045
  %2661 = phi i32 [ %2047, %2045 ], [ %2671, %2670 ]
  %2662 = phi i32 [ %2046, %2045 ], [ %2672, %2670 ]
  %2663 = phi i32 [ 0, %2045 ], [ %2673, %2670 ]
  %2664 = mul nuw nsw i32 %2663, %1360
  %2665 = add nuw nsw i32 %2664, %1354
  %2666 = and i32 %2665, 8388607
  %2667 = icmp eq i32 %2666, 0
  br i1 %2667, label %2668, label %2670

2668:                                             ; preds = %2660
  store i32 %2661, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 255), align 4, !tbaa !5
  %2669 = add i32 %2661, %2662
  store i32 %2669, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 511), align 4, !tbaa !5
  br label %2670

2670:                                             ; preds = %2668, %2660
  %2671 = phi i32 [ %2669, %2668 ], [ %2661, %2660 ]
  %2672 = phi i32 [ %2661, %2668 ], [ %2662, %2660 ]
  %2673 = add nuw nsw i32 %2663, 1
  %2674 = icmp eq i32 %2673, %1965
  br i1 %2674, label %2048, label %2660, !llvm.loop !21

2675:                                             ; preds = %2656, %2594
  %2676 = phi i32 [ 0, %2594 ], [ %2657, %2656 ]
  %2677 = icmp eq i32 %2595, 0
  br i1 %2677, label %2697, label %2678

2678:                                             ; preds = %2675, %2693
  %2679 = phi i32 [ %2694, %2693 ], [ %2676, %2675 ]
  %2680 = phi i32 [ %2695, %2693 ], [ 0, %2675 ]
  %2681 = mul nuw nsw i32 %2679, %1360
  %2682 = add nuw nsw i32 %2681, %1354
  %2683 = shl nuw i32 %2682, 1
  %2684 = sub i32 511, %2683
  %2685 = icmp ult i32 %2684, 512
  br i1 %2685, label %2686, label %2693

2686:                                             ; preds = %2678
  %2687 = sub i32 510, %2683
  %2688 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2687
  %2689 = load i32, i32 addrspace(3)* %2688, align 8, !tbaa !5
  %2690 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ17prefix_sum_reducePjS_jE10data_block, i32 0, i32 %2684
  %2691 = load i32, i32 addrspace(3)* %2690, align 4, !tbaa !5
  store i32 %2691, i32 addrspace(3)* %2688, align 8, !tbaa !5
  %2692 = add i32 %2691, %2689
  store i32 %2692, i32 addrspace(3)* %2690, align 4, !tbaa !5
  br label %2693

2693:                                             ; preds = %2686, %2678
  %2694 = add nuw nsw i32 %2679, 1
  %2695 = add i32 %2680, 1
  %2696 = icmp eq i32 %2695, %2595
  br i1 %2696, label %2697, label %2678, !llvm.loop !42

2697:                                             ; preds = %2693, %2675
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %1364, label %2698, label %2702

2698:                                             ; preds = %2697
  %2699 = load i32, i32 addrspace(3)* %1355, align 4, !tbaa !5
  %2700 = zext i32 %1363 to i64
  %2701 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %2700
  store i32 %2699, i32 addrspace(1)* %2701, align 4, !tbaa !5
  br label %2702

2702:                                             ; preds = %2698, %2697
  br i1 %1371, label %2703, label %2707

2703:                                             ; preds = %2702
  %2704 = load i32, i32 addrspace(3)* %1362, align 4, !tbaa !5
  %2705 = zext i32 %1370 to i64
  %2706 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %2705
  store i32 %2704, i32 addrspace(1)* %2706, align 4, !tbaa !5
  br label %2707

2707:                                             ; preds = %1349, %2703, %2702, %1346
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #3

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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !12}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !12}
!26 = distinct !{!26, !12}
!27 = distinct !{!27, !12}
!28 = distinct !{!28, !12}
!29 = distinct !{!29, !12}
!30 = distinct !{!30, !12}
!31 = distinct !{!31, !12}
!32 = distinct !{!32, !12}
!33 = distinct !{!33, !12}
!34 = distinct !{!34, !12}
!35 = distinct !{!35, !12}
!36 = distinct !{!36, !12}
!37 = distinct !{!37, !12}
!38 = distinct !{!38, !12}
!39 = distinct !{!39, !12}
!40 = distinct !{!40, !12}
!41 = distinct !{!41, !12}
!42 = distinct !{!42, !12}
