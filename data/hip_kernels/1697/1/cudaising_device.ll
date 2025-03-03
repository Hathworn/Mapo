; ModuleID = '../data/hip_kernels/1697/1/main.cu'
source_filename = "../data/hip_kernels/1697/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9cudaisingPiPdS_iiE5tempW = internal unnamed_addr addrspace(3) global [25 x double] undef, align 16
@_ZZ9cudaisingPiPdS_iiE5tempG = internal unnamed_addr addrspace(3) global [2605 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9cudaisingPiPdS_ii(i32 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add i32 %3, 2
  %8 = icmp slt i32 %3, -4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = add i32 %9, %3
  %11 = add nsw i32 %3, 4
  %12 = tail call i32 @llvm.smax.i32(i32 %7, i32 -2)
  br i1 %8, label %458, label %13

13:                                               ; preds = %5
  %14 = add i32 %10, -2
  %15 = urem i32 %14, %3
  %16 = mul i32 %15, %3
  %17 = add i32 %12, 3
  %18 = add i32 %12, 2
  %19 = and i32 %17, 7
  %20 = icmp ult i32 %18, 7
  br i1 %20, label %23, label %21

21:                                               ; preds = %13
  %22 = and i32 %17, -8
  br label %461

23:                                               ; preds = %461, %13
  %24 = phi i32 [ -2, %13 ], [ %535, %461 ]
  %25 = icmp eq i32 %19, 0
  br i1 %25, label %40, label %26

26:                                               ; preds = %23, %26
  %27 = phi i32 [ %37, %26 ], [ %24, %23 ]
  %28 = phi i32 [ %38, %26 ], [ 0, %23 ]
  %29 = add nsw i32 %27, %3
  %30 = srem i32 %29, %3
  %31 = add i32 %16, %30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = add i32 %27, 2
  %36 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %35
  store i32 %34, i32 addrspace(3)* %36, align 4, !tbaa !5
  %37 = add i32 %27, 1
  %38 = add i32 %28, 1
  %39 = icmp eq i32 %38, %19
  br i1 %39, label %40, label %26, !llvm.loop !10

40:                                               ; preds = %26, %23
  br i1 %8, label %458, label %41

41:                                               ; preds = %40
  %42 = add i32 %10, -1
  %43 = urem i32 %42, %3
  %44 = mul i32 %43, %3
  %45 = add i32 %3, 6
  %46 = and i32 %17, 7
  %47 = icmp ult i32 %18, 7
  br i1 %47, label %127, label %48

48:                                               ; preds = %41
  %49 = and i32 %17, -8
  br label %50

50:                                               ; preds = %50, %48
  %51 = phi i32 [ -2, %48 ], [ %124, %50 ]
  %52 = phi i32 [ 0, %48 ], [ %125, %50 ]
  %53 = add nsw i32 %51, %3
  %54 = srem i32 %53, %3
  %55 = add i32 %44, %54
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = add i32 %45, %51
  %60 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %59
  store i32 %58, i32 addrspace(3)* %60, align 4, !tbaa !5
  %61 = or i32 %51, 1
  %62 = add nsw i32 %61, %3
  %63 = srem i32 %62, %3
  %64 = add i32 %44, %63
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = add i32 %45, %61
  %69 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %68
  store i32 %67, i32 addrspace(3)* %69, align 4, !tbaa !5
  %70 = add i32 %51, 2
  %71 = add nsw i32 %70, %3
  %72 = srem i32 %71, %3
  %73 = add i32 %44, %72
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = add i32 %45, %70
  %78 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %77
  store i32 %76, i32 addrspace(3)* %78, align 4, !tbaa !5
  %79 = add i32 %51, 3
  %80 = add nsw i32 %79, %3
  %81 = srem i32 %80, %3
  %82 = add i32 %44, %81
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5, !amdgpu.noclobber !9
  %86 = add i32 %45, %79
  %87 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %86
  store i32 %85, i32 addrspace(3)* %87, align 4, !tbaa !5
  %88 = add i32 %51, 4
  %89 = add nsw i32 %88, %3
  %90 = srem i32 %89, %3
  %91 = add i32 %44, %90
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  %95 = add i32 %45, %88
  %96 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %95
  store i32 %94, i32 addrspace(3)* %96, align 4, !tbaa !5
  %97 = add i32 %51, 5
  %98 = add nsw i32 %97, %3
  %99 = srem i32 %98, %3
  %100 = add i32 %44, %99
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = add i32 %45, %97
  %105 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %104
  store i32 %103, i32 addrspace(3)* %105, align 4, !tbaa !5
  %106 = add i32 %51, 6
  %107 = add nsw i32 %106, %3
  %108 = srem i32 %107, %3
  %109 = add i32 %44, %108
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !5, !amdgpu.noclobber !9
  %113 = add i32 %45, %106
  %114 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %113
  store i32 %112, i32 addrspace(3)* %114, align 4, !tbaa !5
  %115 = add i32 %51, 7
  %116 = add nsw i32 %115, %3
  %117 = srem i32 %116, %3
  %118 = add i32 %44, %117
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = add i32 %45, %115
  %123 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %122
  store i32 %121, i32 addrspace(3)* %123, align 4, !tbaa !5
  %124 = add i32 %51, 8
  %125 = add i32 %52, 8
  %126 = icmp eq i32 %125, %49
  br i1 %126, label %127, label %50, !llvm.loop !12

127:                                              ; preds = %50, %41
  %128 = phi i32 [ -2, %41 ], [ %124, %50 ]
  %129 = icmp eq i32 %46, 0
  br i1 %129, label %144, label %130

130:                                              ; preds = %127, %130
  %131 = phi i32 [ %141, %130 ], [ %128, %127 ]
  %132 = phi i32 [ %142, %130 ], [ 0, %127 ]
  %133 = add nsw i32 %131, %3
  %134 = srem i32 %133, %3
  %135 = add i32 %44, %134
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !5, !amdgpu.noclobber !9
  %139 = add i32 %45, %131
  %140 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %139
  store i32 %138, i32 addrspace(3)* %140, align 4, !tbaa !5
  %141 = add i32 %131, 1
  %142 = add i32 %132, 1
  %143 = icmp eq i32 %142, %46
  br i1 %143, label %144, label %130, !llvm.loop !14

144:                                              ; preds = %130, %127
  br i1 %8, label %458, label %145

145:                                              ; preds = %144
  %146 = urem i32 %10, %3
  %147 = mul i32 %146, %3
  %148 = shl nsw i32 %11, 1
  %149 = add i32 %148, 2
  %150 = and i32 %17, 7
  %151 = icmp ult i32 %18, 7
  br i1 %151, label %231, label %152

152:                                              ; preds = %145
  %153 = and i32 %17, -8
  br label %154

154:                                              ; preds = %154, %152
  %155 = phi i32 [ -2, %152 ], [ %228, %154 ]
  %156 = phi i32 [ 0, %152 ], [ %229, %154 ]
  %157 = add nsw i32 %155, %3
  %158 = srem i32 %157, %3
  %159 = add i32 %147, %158
  %160 = zext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %160
  %162 = load i32, i32 addrspace(1)* %161, align 4, !tbaa !5, !amdgpu.noclobber !9
  %163 = add i32 %149, %155
  %164 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %163
  store i32 %162, i32 addrspace(3)* %164, align 8, !tbaa !5
  %165 = or i32 %155, 1
  %166 = add nsw i32 %165, %3
  %167 = srem i32 %166, %3
  %168 = add i32 %147, %167
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %169
  %171 = load i32, i32 addrspace(1)* %170, align 4, !tbaa !5, !amdgpu.noclobber !9
  %172 = add i32 %149, %165
  %173 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %172
  store i32 %171, i32 addrspace(3)* %173, align 4, !tbaa !5
  %174 = add i32 %155, 2
  %175 = add nsw i32 %174, %3
  %176 = srem i32 %175, %3
  %177 = add i32 %147, %176
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %178
  %180 = load i32, i32 addrspace(1)* %179, align 4, !tbaa !5, !amdgpu.noclobber !9
  %181 = add i32 %149, %174
  %182 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %181
  store i32 %180, i32 addrspace(3)* %182, align 8, !tbaa !5
  %183 = add i32 %155, 3
  %184 = add nsw i32 %183, %3
  %185 = srem i32 %184, %3
  %186 = add i32 %147, %185
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %187
  %189 = load i32, i32 addrspace(1)* %188, align 4, !tbaa !5, !amdgpu.noclobber !9
  %190 = add i32 %149, %183
  %191 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %190
  store i32 %189, i32 addrspace(3)* %191, align 4, !tbaa !5
  %192 = add i32 %155, 4
  %193 = add nsw i32 %192, %3
  %194 = srem i32 %193, %3
  %195 = add i32 %147, %194
  %196 = zext i32 %195 to i64
  %197 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %196
  %198 = load i32, i32 addrspace(1)* %197, align 4, !tbaa !5, !amdgpu.noclobber !9
  %199 = add i32 %149, %192
  %200 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %199
  store i32 %198, i32 addrspace(3)* %200, align 8, !tbaa !5
  %201 = add i32 %155, 5
  %202 = add nsw i32 %201, %3
  %203 = srem i32 %202, %3
  %204 = add i32 %147, %203
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %205
  %207 = load i32, i32 addrspace(1)* %206, align 4, !tbaa !5, !amdgpu.noclobber !9
  %208 = add i32 %149, %201
  %209 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %208
  store i32 %207, i32 addrspace(3)* %209, align 4, !tbaa !5
  %210 = add i32 %155, 6
  %211 = add nsw i32 %210, %3
  %212 = srem i32 %211, %3
  %213 = add i32 %147, %212
  %214 = zext i32 %213 to i64
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %214
  %216 = load i32, i32 addrspace(1)* %215, align 4, !tbaa !5, !amdgpu.noclobber !9
  %217 = add i32 %149, %210
  %218 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %217
  store i32 %216, i32 addrspace(3)* %218, align 8, !tbaa !5
  %219 = add i32 %155, 7
  %220 = add nsw i32 %219, %3
  %221 = srem i32 %220, %3
  %222 = add i32 %147, %221
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %223
  %225 = load i32, i32 addrspace(1)* %224, align 4, !tbaa !5, !amdgpu.noclobber !9
  %226 = add i32 %149, %219
  %227 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %226
  store i32 %225, i32 addrspace(3)* %227, align 4, !tbaa !5
  %228 = add i32 %155, 8
  %229 = add i32 %156, 8
  %230 = icmp eq i32 %229, %153
  br i1 %230, label %231, label %154, !llvm.loop !12

231:                                              ; preds = %154, %145
  %232 = phi i32 [ -2, %145 ], [ %228, %154 ]
  %233 = icmp eq i32 %150, 0
  br i1 %233, label %248, label %234

234:                                              ; preds = %231, %234
  %235 = phi i32 [ %245, %234 ], [ %232, %231 ]
  %236 = phi i32 [ %246, %234 ], [ 0, %231 ]
  %237 = add nsw i32 %235, %3
  %238 = srem i32 %237, %3
  %239 = add i32 %147, %238
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %240
  %242 = load i32, i32 addrspace(1)* %241, align 4, !tbaa !5, !amdgpu.noclobber !9
  %243 = add i32 %149, %235
  %244 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %243
  store i32 %242, i32 addrspace(3)* %244, align 4, !tbaa !5
  %245 = add i32 %235, 1
  %246 = add i32 %236, 1
  %247 = icmp eq i32 %246, %150
  br i1 %247, label %248, label %234, !llvm.loop !15

248:                                              ; preds = %234, %231
  br i1 %8, label %458, label %249

249:                                              ; preds = %248
  %250 = add i32 %10, 1
  %251 = urem i32 %250, %3
  %252 = mul i32 %251, %3
  %253 = mul nsw i32 %11, 3
  %254 = add i32 %253, 2
  %255 = and i32 %17, 7
  %256 = icmp ult i32 %18, 7
  br i1 %256, label %336, label %257

257:                                              ; preds = %249
  %258 = and i32 %17, -8
  br label %259

259:                                              ; preds = %259, %257
  %260 = phi i32 [ -2, %257 ], [ %333, %259 ]
  %261 = phi i32 [ 0, %257 ], [ %334, %259 ]
  %262 = add nsw i32 %260, %3
  %263 = srem i32 %262, %3
  %264 = add i32 %252, %263
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %265
  %267 = load i32, i32 addrspace(1)* %266, align 4, !tbaa !5, !amdgpu.noclobber !9
  %268 = add i32 %254, %260
  %269 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %268
  store i32 %267, i32 addrspace(3)* %269, align 4, !tbaa !5
  %270 = or i32 %260, 1
  %271 = add nsw i32 %270, %3
  %272 = srem i32 %271, %3
  %273 = add i32 %252, %272
  %274 = zext i32 %273 to i64
  %275 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %274
  %276 = load i32, i32 addrspace(1)* %275, align 4, !tbaa !5, !amdgpu.noclobber !9
  %277 = add i32 %254, %270
  %278 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %277
  store i32 %276, i32 addrspace(3)* %278, align 4, !tbaa !5
  %279 = add i32 %260, 2
  %280 = add nsw i32 %279, %3
  %281 = srem i32 %280, %3
  %282 = add i32 %252, %281
  %283 = zext i32 %282 to i64
  %284 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %283
  %285 = load i32, i32 addrspace(1)* %284, align 4, !tbaa !5, !amdgpu.noclobber !9
  %286 = add i32 %254, %279
  %287 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %286
  store i32 %285, i32 addrspace(3)* %287, align 4, !tbaa !5
  %288 = add i32 %260, 3
  %289 = add nsw i32 %288, %3
  %290 = srem i32 %289, %3
  %291 = add i32 %252, %290
  %292 = zext i32 %291 to i64
  %293 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %292
  %294 = load i32, i32 addrspace(1)* %293, align 4, !tbaa !5, !amdgpu.noclobber !9
  %295 = add i32 %254, %288
  %296 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %295
  store i32 %294, i32 addrspace(3)* %296, align 4, !tbaa !5
  %297 = add i32 %260, 4
  %298 = add nsw i32 %297, %3
  %299 = srem i32 %298, %3
  %300 = add i32 %252, %299
  %301 = zext i32 %300 to i64
  %302 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %301
  %303 = load i32, i32 addrspace(1)* %302, align 4, !tbaa !5, !amdgpu.noclobber !9
  %304 = add i32 %254, %297
  %305 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %304
  store i32 %303, i32 addrspace(3)* %305, align 4, !tbaa !5
  %306 = add i32 %260, 5
  %307 = add nsw i32 %306, %3
  %308 = srem i32 %307, %3
  %309 = add i32 %252, %308
  %310 = zext i32 %309 to i64
  %311 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %310
  %312 = load i32, i32 addrspace(1)* %311, align 4, !tbaa !5, !amdgpu.noclobber !9
  %313 = add i32 %254, %306
  %314 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %313
  store i32 %312, i32 addrspace(3)* %314, align 4, !tbaa !5
  %315 = add i32 %260, 6
  %316 = add nsw i32 %315, %3
  %317 = srem i32 %316, %3
  %318 = add i32 %252, %317
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %319
  %321 = load i32, i32 addrspace(1)* %320, align 4, !tbaa !5, !amdgpu.noclobber !9
  %322 = add i32 %254, %315
  %323 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %322
  store i32 %321, i32 addrspace(3)* %323, align 4, !tbaa !5
  %324 = add i32 %260, 7
  %325 = add nsw i32 %324, %3
  %326 = srem i32 %325, %3
  %327 = add i32 %252, %326
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %328
  %330 = load i32, i32 addrspace(1)* %329, align 4, !tbaa !5, !amdgpu.noclobber !9
  %331 = add i32 %254, %324
  %332 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %331
  store i32 %330, i32 addrspace(3)* %332, align 4, !tbaa !5
  %333 = add i32 %260, 8
  %334 = add i32 %261, 8
  %335 = icmp eq i32 %334, %258
  br i1 %335, label %336, label %259, !llvm.loop !12

336:                                              ; preds = %259, %249
  %337 = phi i32 [ -2, %249 ], [ %333, %259 ]
  %338 = icmp eq i32 %255, 0
  br i1 %338, label %353, label %339

339:                                              ; preds = %336, %339
  %340 = phi i32 [ %350, %339 ], [ %337, %336 ]
  %341 = phi i32 [ %351, %339 ], [ 0, %336 ]
  %342 = add nsw i32 %340, %3
  %343 = srem i32 %342, %3
  %344 = add i32 %252, %343
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %345
  %347 = load i32, i32 addrspace(1)* %346, align 4, !tbaa !5, !amdgpu.noclobber !9
  %348 = add i32 %254, %340
  %349 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %348
  store i32 %347, i32 addrspace(3)* %349, align 4, !tbaa !5
  %350 = add i32 %340, 1
  %351 = add i32 %341, 1
  %352 = icmp eq i32 %351, %255
  br i1 %352, label %353, label %339, !llvm.loop !16

353:                                              ; preds = %339, %336
  br i1 %8, label %458, label %354

354:                                              ; preds = %353
  %355 = add i32 %10, 2
  %356 = urem i32 %355, %3
  %357 = mul i32 %356, %3
  %358 = shl nsw i32 %11, 2
  %359 = add nuw nsw i32 %358, 2
  %360 = and i32 %17, 7
  %361 = icmp ult i32 %18, 7
  br i1 %361, label %441, label %362

362:                                              ; preds = %354
  %363 = and i32 %17, -8
  br label %364

364:                                              ; preds = %364, %362
  %365 = phi i32 [ -2, %362 ], [ %438, %364 ]
  %366 = phi i32 [ 0, %362 ], [ %439, %364 ]
  %367 = add nsw i32 %365, %3
  %368 = srem i32 %367, %3
  %369 = add i32 %357, %368
  %370 = zext i32 %369 to i64
  %371 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %370
  %372 = load i32, i32 addrspace(1)* %371, align 4, !tbaa !5, !amdgpu.noclobber !9
  %373 = add i32 %359, %365
  %374 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %373
  store i32 %372, i32 addrspace(3)* %374, align 8, !tbaa !5
  %375 = or i32 %365, 1
  %376 = add nsw i32 %375, %3
  %377 = srem i32 %376, %3
  %378 = add i32 %357, %377
  %379 = zext i32 %378 to i64
  %380 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %379
  %381 = load i32, i32 addrspace(1)* %380, align 4, !tbaa !5, !amdgpu.noclobber !9
  %382 = add i32 %359, %375
  %383 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %382
  store i32 %381, i32 addrspace(3)* %383, align 4, !tbaa !5
  %384 = add i32 %365, 2
  %385 = add nsw i32 %384, %3
  %386 = srem i32 %385, %3
  %387 = add i32 %357, %386
  %388 = zext i32 %387 to i64
  %389 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %388
  %390 = load i32, i32 addrspace(1)* %389, align 4, !tbaa !5, !amdgpu.noclobber !9
  %391 = add i32 %359, %384
  %392 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %391
  store i32 %390, i32 addrspace(3)* %392, align 8, !tbaa !5
  %393 = add i32 %365, 3
  %394 = add nsw i32 %393, %3
  %395 = srem i32 %394, %3
  %396 = add i32 %357, %395
  %397 = zext i32 %396 to i64
  %398 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %397
  %399 = load i32, i32 addrspace(1)* %398, align 4, !tbaa !5, !amdgpu.noclobber !9
  %400 = add i32 %359, %393
  %401 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %400
  store i32 %399, i32 addrspace(3)* %401, align 4, !tbaa !5
  %402 = add i32 %365, 4
  %403 = add nsw i32 %402, %3
  %404 = srem i32 %403, %3
  %405 = add i32 %357, %404
  %406 = zext i32 %405 to i64
  %407 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %406
  %408 = load i32, i32 addrspace(1)* %407, align 4, !tbaa !5, !amdgpu.noclobber !9
  %409 = add i32 %359, %402
  %410 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %409
  store i32 %408, i32 addrspace(3)* %410, align 8, !tbaa !5
  %411 = add i32 %365, 5
  %412 = add nsw i32 %411, %3
  %413 = srem i32 %412, %3
  %414 = add i32 %357, %413
  %415 = zext i32 %414 to i64
  %416 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %415
  %417 = load i32, i32 addrspace(1)* %416, align 4, !tbaa !5, !amdgpu.noclobber !9
  %418 = add i32 %359, %411
  %419 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %418
  store i32 %417, i32 addrspace(3)* %419, align 4, !tbaa !5
  %420 = add i32 %365, 6
  %421 = add nsw i32 %420, %3
  %422 = srem i32 %421, %3
  %423 = add i32 %357, %422
  %424 = zext i32 %423 to i64
  %425 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %424
  %426 = load i32, i32 addrspace(1)* %425, align 4, !tbaa !5, !amdgpu.noclobber !9
  %427 = add i32 %359, %420
  %428 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %427
  store i32 %426, i32 addrspace(3)* %428, align 8, !tbaa !5
  %429 = add i32 %365, 7
  %430 = add nsw i32 %429, %3
  %431 = srem i32 %430, %3
  %432 = add i32 %357, %431
  %433 = zext i32 %432 to i64
  %434 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %433
  %435 = load i32, i32 addrspace(1)* %434, align 4, !tbaa !5, !amdgpu.noclobber !9
  %436 = add i32 %359, %429
  %437 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %436
  store i32 %435, i32 addrspace(3)* %437, align 4, !tbaa !5
  %438 = add i32 %365, 8
  %439 = add i32 %366, 8
  %440 = icmp eq i32 %439, %363
  br i1 %440, label %441, label %364, !llvm.loop !12

441:                                              ; preds = %364, %354
  %442 = phi i32 [ -2, %354 ], [ %438, %364 ]
  %443 = icmp eq i32 %360, 0
  br i1 %443, label %458, label %444

444:                                              ; preds = %441, %444
  %445 = phi i32 [ %455, %444 ], [ %442, %441 ]
  %446 = phi i32 [ %456, %444 ], [ 0, %441 ]
  %447 = add nsw i32 %445, %3
  %448 = srem i32 %447, %3
  %449 = add i32 %357, %448
  %450 = zext i32 %449 to i64
  %451 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %450
  %452 = load i32, i32 addrspace(1)* %451, align 4, !tbaa !5, !amdgpu.noclobber !9
  %453 = add i32 %359, %445
  %454 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %453
  store i32 %452, i32 addrspace(3)* %454, align 4, !tbaa !5
  %455 = add i32 %445, 1
  %456 = add i32 %446, 1
  %457 = icmp eq i32 %456, %360
  br i1 %457, label %458, label %444, !llvm.loop !17

458:                                              ; preds = %441, %444, %5, %40, %144, %248, %353
  %459 = mul i32 %6, %4
  %460 = icmp ult i32 %6, 25
  br i1 %460, label %538, label %543

461:                                              ; preds = %461, %21
  %462 = phi i32 [ -2, %21 ], [ %535, %461 ]
  %463 = phi i32 [ 0, %21 ], [ %536, %461 ]
  %464 = add nsw i32 %462, %3
  %465 = srem i32 %464, %3
  %466 = add i32 %16, %465
  %467 = zext i32 %466 to i64
  %468 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %467
  %469 = load i32, i32 addrspace(1)* %468, align 4, !tbaa !5, !amdgpu.noclobber !9
  %470 = add i32 %462, 2
  %471 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %470
  store i32 %469, i32 addrspace(3)* %471, align 8, !tbaa !5
  %472 = or i32 %462, 1
  %473 = add nsw i32 %472, %3
  %474 = srem i32 %473, %3
  %475 = add i32 %16, %474
  %476 = zext i32 %475 to i64
  %477 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %476
  %478 = load i32, i32 addrspace(1)* %477, align 4, !tbaa !5, !amdgpu.noclobber !9
  %479 = add i32 %462, 3
  %480 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %479
  store i32 %478, i32 addrspace(3)* %480, align 4, !tbaa !5
  %481 = add i32 %462, 2
  %482 = add nsw i32 %481, %3
  %483 = srem i32 %482, %3
  %484 = add i32 %16, %483
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %485
  %487 = load i32, i32 addrspace(1)* %486, align 4, !tbaa !5, !amdgpu.noclobber !9
  %488 = add i32 %462, 4
  %489 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %488
  store i32 %487, i32 addrspace(3)* %489, align 8, !tbaa !5
  %490 = add i32 %462, 3
  %491 = add nsw i32 %490, %3
  %492 = srem i32 %491, %3
  %493 = add i32 %16, %492
  %494 = zext i32 %493 to i64
  %495 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %494
  %496 = load i32, i32 addrspace(1)* %495, align 4, !tbaa !5, !amdgpu.noclobber !9
  %497 = add i32 %462, 5
  %498 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %497
  store i32 %496, i32 addrspace(3)* %498, align 4, !tbaa !5
  %499 = add i32 %462, 4
  %500 = add nsw i32 %499, %3
  %501 = srem i32 %500, %3
  %502 = add i32 %16, %501
  %503 = zext i32 %502 to i64
  %504 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %503
  %505 = load i32, i32 addrspace(1)* %504, align 4, !tbaa !5, !amdgpu.noclobber !9
  %506 = add i32 %462, 6
  %507 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %506
  store i32 %505, i32 addrspace(3)* %507, align 8, !tbaa !5
  %508 = add i32 %462, 5
  %509 = add nsw i32 %508, %3
  %510 = srem i32 %509, %3
  %511 = add i32 %16, %510
  %512 = zext i32 %511 to i64
  %513 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %512
  %514 = load i32, i32 addrspace(1)* %513, align 4, !tbaa !5, !amdgpu.noclobber !9
  %515 = add i32 %462, 7
  %516 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %515
  store i32 %514, i32 addrspace(3)* %516, align 4, !tbaa !5
  %517 = add i32 %462, 6
  %518 = add nsw i32 %517, %3
  %519 = srem i32 %518, %3
  %520 = add i32 %16, %519
  %521 = zext i32 %520 to i64
  %522 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %521
  %523 = load i32, i32 addrspace(1)* %522, align 4, !tbaa !5, !amdgpu.noclobber !9
  %524 = add i32 %462, 8
  %525 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %524
  store i32 %523, i32 addrspace(3)* %525, align 8, !tbaa !5
  %526 = add i32 %462, 7
  %527 = add nsw i32 %526, %3
  %528 = srem i32 %527, %3
  %529 = add i32 %16, %528
  %530 = zext i32 %529 to i64
  %531 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %530
  %532 = load i32, i32 addrspace(1)* %531, align 4, !tbaa !5, !amdgpu.noclobber !9
  %533 = add i32 %462, 9
  %534 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %533
  store i32 %532, i32 addrspace(3)* %534, align 4, !tbaa !5
  %535 = add i32 %462, 8
  %536 = add i32 %463, 8
  %537 = icmp eq i32 %536, %22
  br i1 %537, label %23, label %461, !llvm.loop !12

538:                                              ; preds = %458
  %539 = zext i32 %6 to i64
  %540 = getelementptr inbounds double, double addrspace(1)* %1, i64 %539
  %541 = load double, double addrspace(1)* %540, align 8, !tbaa !18, !amdgpu.noclobber !9
  %542 = getelementptr inbounds [25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 %6
  store double %541, double addrspace(3)* %542, align 8, !tbaa !18
  br label %543

543:                                              ; preds = %538, %458
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %544 = icmp sgt i32 %4, 0
  br i1 %544, label %545, label %735

545:                                              ; preds = %543
  %546 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %547 = getelementptr i8, i8 addrspace(4)* %546, i64 4
  %548 = bitcast i8 addrspace(4)* %547 to i16 addrspace(4)*
  %549 = load i16, i16 addrspace(4)* %548, align 4, !range !20, !invariant.load !9
  %550 = zext i16 %549 to i32
  %551 = mul i32 %9, %4
  %552 = mul i32 %551, %550
  %553 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 12), align 16, !tbaa !18
  %554 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 13), align 8, !tbaa !18
  %555 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 14), align 16, !tbaa !18
  %556 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 0), align 16, !tbaa !18
  %557 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 1), align 8, !tbaa !18
  %558 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 2), align 16, !tbaa !18
  %559 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 3), align 8, !tbaa !18
  %560 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 4), align 16, !tbaa !18
  %561 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 5), align 8, !tbaa !18
  %562 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 6), align 16, !tbaa !18
  %563 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 7), align 8, !tbaa !18
  %564 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 8), align 16, !tbaa !18
  %565 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 9), align 8, !tbaa !18
  %566 = shl nsw i32 %11, 1
  %567 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 10), align 16, !tbaa !18
  %568 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 11), align 8, !tbaa !18
  %569 = mul nsw i32 %11, 3
  %570 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 15), align 8, !tbaa !18
  %571 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 16), align 16, !tbaa !18
  %572 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 17), align 8, !tbaa !18
  %573 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 18), align 16, !tbaa !18
  %574 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 19), align 8, !tbaa !18
  %575 = shl nsw i32 %11, 2
  %576 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 20), align 16, !tbaa !18
  %577 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 21), align 8, !tbaa !18
  %578 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 22), align 16, !tbaa !18
  %579 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 23), align 8, !tbaa !18
  %580 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempW, i32 0, i32 24), align 16, !tbaa !18
  br label %581

581:                                              ; preds = %545, %744
  %582 = phi i32 [ 0, %545 ], [ %748, %744 ]
  %583 = add nsw i32 %582, %459
  %584 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %583
  %585 = load i32, i32 addrspace(3)* %584, align 4, !tbaa !5
  %586 = sitofp i32 %585 to double
  %587 = fmul contract double %556, %586
  %588 = fadd contract double %587, 0.000000e+00
  %589 = add i32 %583, 1
  %590 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %589
  %591 = load i32, i32 addrspace(3)* %590, align 4, !tbaa !5
  %592 = sitofp i32 %591 to double
  %593 = fmul contract double %557, %592
  %594 = fadd contract double %588, %593
  %595 = add i32 %583, 2
  %596 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %595
  %597 = load i32, i32 addrspace(3)* %596, align 4, !tbaa !5
  %598 = sitofp i32 %597 to double
  %599 = fmul contract double %558, %598
  %600 = fadd contract double %594, %599
  %601 = add i32 %583, 3
  %602 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %601
  %603 = load i32, i32 addrspace(3)* %602, align 4, !tbaa !5
  %604 = sitofp i32 %603 to double
  %605 = fmul contract double %559, %604
  %606 = fadd contract double %600, %605
  %607 = add i32 %583, 4
  %608 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %607
  %609 = load i32, i32 addrspace(3)* %608, align 4, !tbaa !5
  %610 = sitofp i32 %609 to double
  %611 = fmul contract double %560, %610
  %612 = fadd contract double %606, %611
  %613 = add i32 %583, %11
  %614 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %613
  %615 = load i32, i32 addrspace(3)* %614, align 4, !tbaa !5
  %616 = sitofp i32 %615 to double
  %617 = fmul contract double %561, %616
  %618 = fadd contract double %612, %617
  %619 = add i32 %613, 1
  %620 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %619
  %621 = load i32, i32 addrspace(3)* %620, align 4, !tbaa !5
  %622 = sitofp i32 %621 to double
  %623 = fmul contract double %562, %622
  %624 = fadd contract double %618, %623
  %625 = add i32 %613, 2
  %626 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %625
  %627 = load i32, i32 addrspace(3)* %626, align 4, !tbaa !5
  %628 = sitofp i32 %627 to double
  %629 = fmul contract double %563, %628
  %630 = fadd contract double %624, %629
  %631 = add i32 %613, 3
  %632 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %631
  %633 = load i32, i32 addrspace(3)* %632, align 4, !tbaa !5
  %634 = sitofp i32 %633 to double
  %635 = fmul contract double %564, %634
  %636 = fadd contract double %630, %635
  %637 = add i32 %613, 4
  %638 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %637
  %639 = load i32, i32 addrspace(3)* %638, align 4, !tbaa !5
  %640 = sitofp i32 %639 to double
  %641 = fmul contract double %565, %640
  %642 = fadd contract double %636, %641
  %643 = add i32 %583, %566
  %644 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %643
  %645 = load i32, i32 addrspace(3)* %644, align 4, !tbaa !5
  %646 = sitofp i32 %645 to double
  %647 = fmul contract double %567, %646
  %648 = fadd contract double %642, %647
  %649 = add i32 %643, 1
  %650 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %649
  %651 = load i32, i32 addrspace(3)* %650, align 4, !tbaa !5
  %652 = sitofp i32 %651 to double
  %653 = fmul contract double %568, %652
  %654 = fadd contract double %648, %653
  %655 = add i32 %643, 2
  %656 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %655
  %657 = load i32, i32 addrspace(3)* %656, align 4, !tbaa !5
  %658 = sitofp i32 %657 to double
  %659 = fmul contract double %553, %658
  %660 = fadd contract double %654, %659
  %661 = add i32 %643, 3
  %662 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %661
  %663 = load i32, i32 addrspace(3)* %662, align 4, !tbaa !5
  %664 = sitofp i32 %663 to double
  %665 = fmul contract double %554, %664
  %666 = fadd contract double %660, %665
  %667 = add i32 %643, 4
  %668 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %667
  %669 = load i32, i32 addrspace(3)* %668, align 4, !tbaa !5
  %670 = sitofp i32 %669 to double
  %671 = fmul contract double %555, %670
  %672 = fadd contract double %666, %671
  %673 = add i32 %583, %569
  %674 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %673
  %675 = load i32, i32 addrspace(3)* %674, align 4, !tbaa !5
  %676 = sitofp i32 %675 to double
  %677 = fmul contract double %570, %676
  %678 = fadd contract double %672, %677
  %679 = add i32 %673, 1
  %680 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %679
  %681 = load i32, i32 addrspace(3)* %680, align 4, !tbaa !5
  %682 = sitofp i32 %681 to double
  %683 = fmul contract double %571, %682
  %684 = fadd contract double %678, %683
  %685 = add i32 %673, 2
  %686 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %685
  %687 = load i32, i32 addrspace(3)* %686, align 4, !tbaa !5
  %688 = sitofp i32 %687 to double
  %689 = fmul contract double %572, %688
  %690 = fadd contract double %684, %689
  %691 = add i32 %673, 3
  %692 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %691
  %693 = load i32, i32 addrspace(3)* %692, align 4, !tbaa !5
  %694 = sitofp i32 %693 to double
  %695 = fmul contract double %573, %694
  %696 = fadd contract double %690, %695
  %697 = add i32 %673, 4
  %698 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %697
  %699 = load i32, i32 addrspace(3)* %698, align 4, !tbaa !5
  %700 = sitofp i32 %699 to double
  %701 = fmul contract double %574, %700
  %702 = fadd contract double %696, %701
  %703 = add i32 %583, %575
  %704 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %703
  %705 = load i32, i32 addrspace(3)* %704, align 4, !tbaa !5
  %706 = sitofp i32 %705 to double
  %707 = fmul contract double %576, %706
  %708 = fadd contract double %702, %707
  %709 = add i32 %703, 1
  %710 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %709
  %711 = load i32, i32 addrspace(3)* %710, align 4, !tbaa !5
  %712 = sitofp i32 %711 to double
  %713 = fmul contract double %577, %712
  %714 = fadd contract double %708, %713
  %715 = add i32 %703, 2
  %716 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %715
  %717 = load i32, i32 addrspace(3)* %716, align 4, !tbaa !5
  %718 = sitofp i32 %717 to double
  %719 = fmul contract double %578, %718
  %720 = fadd contract double %714, %719
  %721 = add i32 %703, 3
  %722 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %721
  %723 = load i32, i32 addrspace(3)* %722, align 4, !tbaa !5
  %724 = sitofp i32 %723 to double
  %725 = fmul contract double %579, %724
  %726 = fadd contract double %720, %725
  %727 = add i32 %703, 4
  %728 = getelementptr inbounds [2605 x i32], [2605 x i32] addrspace(3)* @_ZZ9cudaisingPiPdS_iiE5tempG, i32 0, i32 %727
  %729 = load i32, i32 addrspace(3)* %728, align 4, !tbaa !5
  %730 = sitofp i32 %729 to double
  %731 = fmul contract double %580, %730
  %732 = fadd contract double %726, %731
  %733 = add i32 %583, %552
  %734 = fcmp contract ogt double %732, 0x3EB0C6F7A0B5ED8D
  br i1 %734, label %736, label %738

735:                                              ; preds = %744, %543
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

736:                                              ; preds = %581
  %737 = sext i32 %733 to i64
  br label %744

738:                                              ; preds = %581
  %739 = fcmp contract olt double %732, 0xBEB0C6F7A0B5ED8D
  %740 = sext i32 %733 to i64
  br i1 %739, label %744, label %741

741:                                              ; preds = %738
  %742 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %740
  %743 = load i32, i32 addrspace(1)* %742, align 4, !tbaa !5
  br label %744

744:                                              ; preds = %738, %741, %736
  %745 = phi i64 [ %740, %741 ], [ %737, %736 ], [ %740, %738 ]
  %746 = phi i32 [ %743, %741 ], [ 1, %736 ], [ -1, %738 ]
  %747 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %745
  store i32 %746, i32 addrspace(1)* %747, align 4, !tbaa !5
  %748 = add nuw nsw i32 %582, 1
  %749 = icmp eq i32 %748, %4
  br i1 %749, label %735, label %581, !llvm.loop !21
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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11}
!18 = !{!19, !19, i64 0}
!19 = !{!"double", !7, i64 0}
!20 = !{i16 1, i16 1025}
!21 = distinct !{!21, !13}
