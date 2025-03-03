; ModuleID = '../data/hip_kernels/14036/4/main.cu'
source_filename = "../data/hip_kernels/14036/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @deltasBatch(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = add i32 %5, 1
  %17 = mul nsw i32 %16, 5
  %18 = add nsw i32 %17, 6
  %19 = mul nsw i32 %15, %18
  %20 = mul i32 %15, %4
  %21 = icmp slt i32 %5, 0
  br i1 %21, label %266, label %22

22:                                               ; preds = %6
  %23 = and i32 %16, 7
  %24 = icmp ult i32 %5, 7
  br i1 %24, label %27, label %25

25:                                               ; preds = %22
  %26 = and i32 %16, -8
  br label %286

27:                                               ; preds = %286, %22
  %28 = phi i32 [ 0, %22 ], [ %320, %286 ]
  %29 = icmp eq i32 %23, 0
  br i1 %29, label %39, label %30

30:                                               ; preds = %27, %30
  %31 = phi i32 [ %36, %30 ], [ %28, %27 ]
  %32 = phi i32 [ %37, %30 ], [ 0, %27 ]
  %33 = add nsw i32 %19, %31
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %3, i64 %34
  store float 0.000000e+00, float addrspace(1)* %35, align 4, !tbaa !7
  %36 = add nuw i32 %31, 1
  %37 = add i32 %32, 1
  %38 = icmp eq i32 %37, %23
  br i1 %38, label %39, label %30, !llvm.loop !11

39:                                               ; preds = %30, %27
  br i1 %21, label %266, label %40

40:                                               ; preds = %39
  %41 = add nsw i32 %16, %19
  %42 = and i32 %16, 7
  %43 = icmp ult i32 %5, 7
  br i1 %43, label %83, label %44

44:                                               ; preds = %40
  %45 = and i32 %16, -8
  br label %46

46:                                               ; preds = %46, %44
  %47 = phi i32 [ 0, %44 ], [ %80, %46 ]
  %48 = phi i32 [ 0, %44 ], [ %81, %46 ]
  %49 = add nsw i32 %41, %47
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %50
  store float 0.000000e+00, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = or i32 %47, 1
  %53 = add nsw i32 %41, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  store float 0.000000e+00, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = or i32 %47, 2
  %57 = add nsw i32 %41, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  store float 0.000000e+00, float addrspace(1)* %59, align 4, !tbaa !7
  %60 = or i32 %47, 3
  %61 = add nsw i32 %41, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %3, i64 %62
  store float 0.000000e+00, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = or i32 %47, 4
  %65 = add nsw i32 %41, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %3, i64 %66
  store float 0.000000e+00, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = or i32 %47, 5
  %69 = add nsw i32 %41, %68
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %3, i64 %70
  store float 0.000000e+00, float addrspace(1)* %71, align 4, !tbaa !7
  %72 = or i32 %47, 6
  %73 = add nsw i32 %41, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %3, i64 %74
  store float 0.000000e+00, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = or i32 %47, 7
  %77 = add nsw i32 %41, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %3, i64 %78
  store float 0.000000e+00, float addrspace(1)* %79, align 4, !tbaa !7
  %80 = add nuw i32 %47, 8
  %81 = add i32 %48, 8
  %82 = icmp eq i32 %81, %45
  br i1 %82, label %83, label %46, !llvm.loop !13

83:                                               ; preds = %46, %40
  %84 = phi i32 [ 0, %40 ], [ %80, %46 ]
  %85 = icmp eq i32 %42, 0
  br i1 %85, label %95, label %86

86:                                               ; preds = %83, %86
  %87 = phi i32 [ %92, %86 ], [ %84, %83 ]
  %88 = phi i32 [ %93, %86 ], [ 0, %83 ]
  %89 = add nsw i32 %41, %87
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %3, i64 %90
  store float 0.000000e+00, float addrspace(1)* %91, align 4, !tbaa !7
  %92 = add nuw i32 %87, 1
  %93 = add i32 %88, 1
  %94 = icmp eq i32 %93, %42
  br i1 %94, label %95, label %86, !llvm.loop !15

95:                                               ; preds = %86, %83
  br i1 %21, label %266, label %96

96:                                               ; preds = %95
  %97 = shl nsw i32 %16, 1
  %98 = add nsw i32 %97, %19
  %99 = and i32 %16, 7
  %100 = icmp ult i32 %5, 7
  br i1 %100, label %140, label %101

101:                                              ; preds = %96
  %102 = and i32 %16, -8
  br label %103

103:                                              ; preds = %103, %101
  %104 = phi i32 [ 0, %101 ], [ %137, %103 ]
  %105 = phi i32 [ 0, %101 ], [ %138, %103 ]
  %106 = add nsw i32 %98, %104
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %3, i64 %107
  store float 0.000000e+00, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = or i32 %104, 1
  %110 = add nsw i32 %98, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %3, i64 %111
  store float 0.000000e+00, float addrspace(1)* %112, align 4, !tbaa !7
  %113 = or i32 %104, 2
  %114 = add nsw i32 %98, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %3, i64 %115
  store float 0.000000e+00, float addrspace(1)* %116, align 4, !tbaa !7
  %117 = or i32 %104, 3
  %118 = add nsw i32 %98, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %3, i64 %119
  store float 0.000000e+00, float addrspace(1)* %120, align 4, !tbaa !7
  %121 = or i32 %104, 4
  %122 = add nsw i32 %98, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %3, i64 %123
  store float 0.000000e+00, float addrspace(1)* %124, align 4, !tbaa !7
  %125 = or i32 %104, 5
  %126 = add nsw i32 %98, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %3, i64 %127
  store float 0.000000e+00, float addrspace(1)* %128, align 4, !tbaa !7
  %129 = or i32 %104, 6
  %130 = add nsw i32 %98, %129
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %3, i64 %131
  store float 0.000000e+00, float addrspace(1)* %132, align 4, !tbaa !7
  %133 = or i32 %104, 7
  %134 = add nsw i32 %98, %133
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %3, i64 %135
  store float 0.000000e+00, float addrspace(1)* %136, align 4, !tbaa !7
  %137 = add nuw i32 %104, 8
  %138 = add i32 %105, 8
  %139 = icmp eq i32 %138, %102
  br i1 %139, label %140, label %103, !llvm.loop !13

140:                                              ; preds = %103, %96
  %141 = phi i32 [ 0, %96 ], [ %137, %103 ]
  %142 = icmp eq i32 %99, 0
  br i1 %142, label %152, label %143

143:                                              ; preds = %140, %143
  %144 = phi i32 [ %149, %143 ], [ %141, %140 ]
  %145 = phi i32 [ %150, %143 ], [ 0, %140 ]
  %146 = add nsw i32 %98, %144
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %3, i64 %147
  store float 0.000000e+00, float addrspace(1)* %148, align 4, !tbaa !7
  %149 = add nuw i32 %144, 1
  %150 = add i32 %145, 1
  %151 = icmp eq i32 %150, %99
  br i1 %151, label %152, label %143, !llvm.loop !16

152:                                              ; preds = %143, %140
  br i1 %21, label %266, label %153

153:                                              ; preds = %152
  %154 = mul nsw i32 %16, 3
  %155 = add nsw i32 %154, %19
  %156 = and i32 %16, 7
  %157 = icmp ult i32 %5, 7
  br i1 %157, label %197, label %158

158:                                              ; preds = %153
  %159 = and i32 %16, -8
  br label %160

160:                                              ; preds = %160, %158
  %161 = phi i32 [ 0, %158 ], [ %194, %160 ]
  %162 = phi i32 [ 0, %158 ], [ %195, %160 ]
  %163 = add nsw i32 %155, %161
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %3, i64 %164
  store float 0.000000e+00, float addrspace(1)* %165, align 4, !tbaa !7
  %166 = or i32 %161, 1
  %167 = add nsw i32 %155, %166
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %3, i64 %168
  store float 0.000000e+00, float addrspace(1)* %169, align 4, !tbaa !7
  %170 = or i32 %161, 2
  %171 = add nsw i32 %155, %170
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %3, i64 %172
  store float 0.000000e+00, float addrspace(1)* %173, align 4, !tbaa !7
  %174 = or i32 %161, 3
  %175 = add nsw i32 %155, %174
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %3, i64 %176
  store float 0.000000e+00, float addrspace(1)* %177, align 4, !tbaa !7
  %178 = or i32 %161, 4
  %179 = add nsw i32 %155, %178
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %3, i64 %180
  store float 0.000000e+00, float addrspace(1)* %181, align 4, !tbaa !7
  %182 = or i32 %161, 5
  %183 = add nsw i32 %155, %182
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %3, i64 %184
  store float 0.000000e+00, float addrspace(1)* %185, align 4, !tbaa !7
  %186 = or i32 %161, 6
  %187 = add nsw i32 %155, %186
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %3, i64 %188
  store float 0.000000e+00, float addrspace(1)* %189, align 4, !tbaa !7
  %190 = or i32 %161, 7
  %191 = add nsw i32 %155, %190
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %3, i64 %192
  store float 0.000000e+00, float addrspace(1)* %193, align 4, !tbaa !7
  %194 = add nuw i32 %161, 8
  %195 = add i32 %162, 8
  %196 = icmp eq i32 %195, %159
  br i1 %196, label %197, label %160, !llvm.loop !13

197:                                              ; preds = %160, %153
  %198 = phi i32 [ 0, %153 ], [ %194, %160 ]
  %199 = icmp eq i32 %156, 0
  br i1 %199, label %209, label %200

200:                                              ; preds = %197, %200
  %201 = phi i32 [ %206, %200 ], [ %198, %197 ]
  %202 = phi i32 [ %207, %200 ], [ 0, %197 ]
  %203 = add nsw i32 %155, %201
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %3, i64 %204
  store float 0.000000e+00, float addrspace(1)* %205, align 4, !tbaa !7
  %206 = add nuw i32 %201, 1
  %207 = add i32 %202, 1
  %208 = icmp eq i32 %207, %156
  br i1 %208, label %209, label %200, !llvm.loop !17

209:                                              ; preds = %200, %197
  br i1 %21, label %266, label %210

210:                                              ; preds = %209
  %211 = shl nsw i32 %16, 2
  %212 = add nsw i32 %211, %19
  %213 = and i32 %16, 7
  %214 = icmp ult i32 %5, 7
  br i1 %214, label %254, label %215

215:                                              ; preds = %210
  %216 = and i32 %16, -8
  br label %217

217:                                              ; preds = %217, %215
  %218 = phi i32 [ 0, %215 ], [ %251, %217 ]
  %219 = phi i32 [ 0, %215 ], [ %252, %217 ]
  %220 = add nsw i32 %212, %218
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %3, i64 %221
  store float 0.000000e+00, float addrspace(1)* %222, align 4, !tbaa !7
  %223 = or i32 %218, 1
  %224 = add nsw i32 %212, %223
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %3, i64 %225
  store float 0.000000e+00, float addrspace(1)* %226, align 4, !tbaa !7
  %227 = or i32 %218, 2
  %228 = add nsw i32 %212, %227
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %3, i64 %229
  store float 0.000000e+00, float addrspace(1)* %230, align 4, !tbaa !7
  %231 = or i32 %218, 3
  %232 = add nsw i32 %212, %231
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %3, i64 %233
  store float 0.000000e+00, float addrspace(1)* %234, align 4, !tbaa !7
  %235 = or i32 %218, 4
  %236 = add nsw i32 %212, %235
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %3, i64 %237
  store float 0.000000e+00, float addrspace(1)* %238, align 4, !tbaa !7
  %239 = or i32 %218, 5
  %240 = add nsw i32 %212, %239
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %3, i64 %241
  store float 0.000000e+00, float addrspace(1)* %242, align 4, !tbaa !7
  %243 = or i32 %218, 6
  %244 = add nsw i32 %212, %243
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %3, i64 %245
  store float 0.000000e+00, float addrspace(1)* %246, align 4, !tbaa !7
  %247 = or i32 %218, 7
  %248 = add nsw i32 %212, %247
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %3, i64 %249
  store float 0.000000e+00, float addrspace(1)* %250, align 4, !tbaa !7
  %251 = add nuw i32 %218, 8
  %252 = add i32 %219, 8
  %253 = icmp eq i32 %252, %216
  br i1 %253, label %254, label %217, !llvm.loop !13

254:                                              ; preds = %217, %210
  %255 = phi i32 [ 0, %210 ], [ %251, %217 ]
  %256 = icmp eq i32 %213, 0
  br i1 %256, label %266, label %257

257:                                              ; preds = %254, %257
  %258 = phi i32 [ %263, %257 ], [ %255, %254 ]
  %259 = phi i32 [ %264, %257 ], [ 0, %254 ]
  %260 = add nsw i32 %212, %258
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %3, i64 %261
  store float 0.000000e+00, float addrspace(1)* %262, align 4, !tbaa !7
  %263 = add nuw i32 %258, 1
  %264 = add i32 %259, 1
  %265 = icmp eq i32 %264, %213
  br i1 %265, label %266, label %257, !llvm.loop !18

266:                                              ; preds = %254, %257, %6, %39, %95, %152, %209
  %267 = add nsw i32 %19, %17
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds float, float addrspace(1)* %3, i64 %268
  store float 0.000000e+00, float addrspace(1)* %269, align 4, !tbaa !7
  %270 = add nsw i32 %267, 1
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %3, i64 %271
  store float 0.000000e+00, float addrspace(1)* %272, align 4, !tbaa !7
  %273 = add nsw i32 %267, 2
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds float, float addrspace(1)* %3, i64 %274
  store float 0.000000e+00, float addrspace(1)* %275, align 4, !tbaa !7
  %276 = add nsw i32 %267, 3
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %3, i64 %277
  store float 0.000000e+00, float addrspace(1)* %278, align 4, !tbaa !7
  %279 = add nsw i32 %267, 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float addrspace(1)* %3, i64 %280
  store float 0.000000e+00, float addrspace(1)* %281, align 4, !tbaa !7
  %282 = add nsw i32 %267, 5
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %3, i64 %283
  store float 0.000000e+00, float addrspace(1)* %284, align 4, !tbaa !7
  %285 = icmp sgt i32 %4, 0
  br i1 %285, label %323, label %385

286:                                              ; preds = %286, %25
  %287 = phi i32 [ 0, %25 ], [ %320, %286 ]
  %288 = phi i32 [ 0, %25 ], [ %321, %286 ]
  %289 = add nsw i32 %19, %287
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds float, float addrspace(1)* %3, i64 %290
  store float 0.000000e+00, float addrspace(1)* %291, align 4, !tbaa !7
  %292 = or i32 %287, 1
  %293 = add nsw i32 %19, %292
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %3, i64 %294
  store float 0.000000e+00, float addrspace(1)* %295, align 4, !tbaa !7
  %296 = or i32 %287, 2
  %297 = add nsw i32 %19, %296
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %3, i64 %298
  store float 0.000000e+00, float addrspace(1)* %299, align 4, !tbaa !7
  %300 = or i32 %287, 3
  %301 = add nsw i32 %19, %300
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %3, i64 %302
  store float 0.000000e+00, float addrspace(1)* %303, align 4, !tbaa !7
  %304 = or i32 %287, 4
  %305 = add nsw i32 %19, %304
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %3, i64 %306
  store float 0.000000e+00, float addrspace(1)* %307, align 4, !tbaa !7
  %308 = or i32 %287, 5
  %309 = add nsw i32 %19, %308
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds float, float addrspace(1)* %3, i64 %310
  store float 0.000000e+00, float addrspace(1)* %311, align 4, !tbaa !7
  %312 = or i32 %287, 6
  %313 = add nsw i32 %19, %312
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds float, float addrspace(1)* %3, i64 %314
  store float 0.000000e+00, float addrspace(1)* %315, align 4, !tbaa !7
  %316 = or i32 %287, 7
  %317 = add nsw i32 %19, %316
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds float, float addrspace(1)* %3, i64 %318
  store float 0.000000e+00, float addrspace(1)* %319, align 4, !tbaa !7
  %320 = add nuw i32 %287, 8
  %321 = add i32 %288, 8
  %322 = icmp eq i32 %321, %26
  br i1 %322, label %27, label %286, !llvm.loop !13

323:                                              ; preds = %266
  %324 = add nsw i32 %17, 5
  %325 = icmp sgt i32 %5, 0
  %326 = sext i32 %324 to i64
  %327 = getelementptr inbounds float, float addrspace(1)* %2, i64 %326
  %328 = add i32 %19, %5
  %329 = sext i32 %5 to i64
  %330 = getelementptr inbounds float, float addrspace(1)* %2, i64 %329
  %331 = add nsw i32 %16, %5
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %2, i64 %332
  %334 = shl nsw i32 %16, 1
  %335 = shl nsw i32 %16, 1
  %336 = mul nsw i32 %16, 3
  %337 = mul nsw i32 %16, 3
  %338 = shl nsw i32 %16, 2
  %339 = shl nsw i32 %16, 2
  %340 = sext i32 %17 to i64
  %341 = getelementptr inbounds float, float addrspace(1)* %2, i64 %340
  %342 = add nsw i32 %17, 1
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds float, float addrspace(1)* %2, i64 %343
  %345 = add nsw i32 %17, 2
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds float, float addrspace(1)* %2, i64 %346
  %348 = add nsw i32 %17, 3
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds float, float addrspace(1)* %2, i64 %349
  %351 = add nsw i32 %17, 4
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds float, float addrspace(1)* %2, i64 %352
  %354 = add i32 %5, -1
  %355 = and i32 %5, 7
  %356 = icmp ult i32 %354, 7
  %357 = and i32 %5, -8
  %358 = icmp eq i32 %355, 0
  %359 = and i32 %5, 7
  %360 = icmp ult i32 %354, 7
  %361 = and i32 %5, -8
  %362 = icmp eq i32 %359, 0
  %363 = and i32 %5, 7
  %364 = icmp ult i32 %354, 7
  %365 = and i32 %5, -8
  %366 = icmp eq i32 %363, 0
  %367 = and i32 %5, 7
  %368 = icmp ult i32 %354, 7
  %369 = and i32 %5, -8
  %370 = icmp eq i32 %367, 0
  %371 = and i32 %5, 7
  %372 = icmp ult i32 %354, 7
  %373 = and i32 %5, -8
  %374 = icmp eq i32 %371, 0
  %375 = and i32 %5, 7
  %376 = icmp ult i32 %354, 7
  %377 = and i32 %5, -8
  %378 = icmp eq i32 %375, 0
  br label %379

379:                                              ; preds = %323, %1192
  %380 = phi i32 [ 0, %323 ], [ %1193, %1192 ]
  %381 = phi <5 x float> [ undef, %323 ], [ %921, %1192 ]
  %382 = add i32 %380, %20
  %383 = mul i32 %382, %5
  br i1 %325, label %384, label %406

384:                                              ; preds = %379
  br i1 %356, label %386, label %952

385:                                              ; preds = %1192, %266
  ret void

386:                                              ; preds = %952, %384
  %387 = phi float [ undef, %384 ], [ %1034, %952 ]
  %388 = phi i32 [ 0, %384 ], [ %1035, %952 ]
  %389 = phi float [ 0.000000e+00, %384 ], [ %1034, %952 ]
  br i1 %358, label %406, label %390

390:                                              ; preds = %386, %390
  %391 = phi i32 [ %403, %390 ], [ %388, %386 ]
  %392 = phi float [ %402, %390 ], [ %389, %386 ]
  %393 = phi i32 [ %404, %390 ], [ 0, %386 ]
  %394 = add nsw i32 %383, %391
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds float, float addrspace(1)* %0, i64 %395
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !7
  %398 = zext i32 %391 to i64
  %399 = getelementptr inbounds float, float addrspace(1)* %2, i64 %398
  %400 = load float, float addrspace(1)* %399, align 4, !tbaa !7
  %401 = fmul contract float %397, %400
  %402 = fadd contract float %392, %401
  %403 = add nuw nsw i32 %391, 1
  %404 = add i32 %393, 1
  %405 = icmp eq i32 %404, %355
  br i1 %405, label %406, label %390, !llvm.loop !19

406:                                              ; preds = %386, %390, %379
  %407 = phi float [ 0.000000e+00, %379 ], [ %387, %386 ], [ %402, %390 ]
  %408 = load float, float addrspace(1)* %330, align 4, !tbaa !7
  %409 = fadd contract float %407, %408
  %410 = fcmp contract ogt float %409, 0.000000e+00
  %411 = insertelement <5 x float> %381, float 1.000000e+00, i64 0
  %412 = insertelement <5 x float> %381, float 0.000000e+00, i64 0
  %413 = select i1 %410, <5 x float> %411, <5 x float> %412
  br i1 %325, label %414, label %530

414:                                              ; preds = %406
  br i1 %360, label %509, label %415

415:                                              ; preds = %414, %415
  %416 = phi i32 [ %506, %415 ], [ 0, %414 ]
  %417 = phi float [ %505, %415 ], [ 0.000000e+00, %414 ]
  %418 = phi i32 [ %507, %415 ], [ 0, %414 ]
  %419 = add nsw i32 %383, %416
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds float, float addrspace(1)* %0, i64 %420
  %422 = load float, float addrspace(1)* %421, align 4, !tbaa !7
  %423 = add nsw i32 %416, %16
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds float, float addrspace(1)* %2, i64 %424
  %426 = load float, float addrspace(1)* %425, align 4, !tbaa !7
  %427 = fmul contract float %422, %426
  %428 = fadd contract float %417, %427
  %429 = or i32 %416, 1
  %430 = add nsw i32 %383, %429
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds float, float addrspace(1)* %0, i64 %431
  %433 = load float, float addrspace(1)* %432, align 4, !tbaa !7
  %434 = add nsw i32 %429, %16
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds float, float addrspace(1)* %2, i64 %435
  %437 = load float, float addrspace(1)* %436, align 4, !tbaa !7
  %438 = fmul contract float %433, %437
  %439 = fadd contract float %428, %438
  %440 = or i32 %416, 2
  %441 = add nsw i32 %383, %440
  %442 = sext i32 %441 to i64
  %443 = getelementptr inbounds float, float addrspace(1)* %0, i64 %442
  %444 = load float, float addrspace(1)* %443, align 4, !tbaa !7
  %445 = add nsw i32 %440, %16
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds float, float addrspace(1)* %2, i64 %446
  %448 = load float, float addrspace(1)* %447, align 4, !tbaa !7
  %449 = fmul contract float %444, %448
  %450 = fadd contract float %439, %449
  %451 = or i32 %416, 3
  %452 = add nsw i32 %383, %451
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds float, float addrspace(1)* %0, i64 %453
  %455 = load float, float addrspace(1)* %454, align 4, !tbaa !7
  %456 = add nsw i32 %451, %16
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds float, float addrspace(1)* %2, i64 %457
  %459 = load float, float addrspace(1)* %458, align 4, !tbaa !7
  %460 = fmul contract float %455, %459
  %461 = fadd contract float %450, %460
  %462 = or i32 %416, 4
  %463 = add nsw i32 %383, %462
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds float, float addrspace(1)* %0, i64 %464
  %466 = load float, float addrspace(1)* %465, align 4, !tbaa !7
  %467 = add nsw i32 %462, %16
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds float, float addrspace(1)* %2, i64 %468
  %470 = load float, float addrspace(1)* %469, align 4, !tbaa !7
  %471 = fmul contract float %466, %470
  %472 = fadd contract float %461, %471
  %473 = or i32 %416, 5
  %474 = add nsw i32 %383, %473
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds float, float addrspace(1)* %0, i64 %475
  %477 = load float, float addrspace(1)* %476, align 4, !tbaa !7
  %478 = add nsw i32 %473, %16
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds float, float addrspace(1)* %2, i64 %479
  %481 = load float, float addrspace(1)* %480, align 4, !tbaa !7
  %482 = fmul contract float %477, %481
  %483 = fadd contract float %472, %482
  %484 = or i32 %416, 6
  %485 = add nsw i32 %383, %484
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds float, float addrspace(1)* %0, i64 %486
  %488 = load float, float addrspace(1)* %487, align 4, !tbaa !7
  %489 = add nsw i32 %484, %16
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds float, float addrspace(1)* %2, i64 %490
  %492 = load float, float addrspace(1)* %491, align 4, !tbaa !7
  %493 = fmul contract float %488, %492
  %494 = fadd contract float %483, %493
  %495 = or i32 %416, 7
  %496 = add nsw i32 %383, %495
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds float, float addrspace(1)* %0, i64 %497
  %499 = load float, float addrspace(1)* %498, align 4, !tbaa !7
  %500 = add nsw i32 %495, %16
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds float, float addrspace(1)* %2, i64 %501
  %503 = load float, float addrspace(1)* %502, align 4, !tbaa !7
  %504 = fmul contract float %499, %503
  %505 = fadd contract float %494, %504
  %506 = add nuw nsw i32 %416, 8
  %507 = add i32 %418, 8
  %508 = icmp eq i32 %507, %361
  br i1 %508, label %509, label %415, !llvm.loop !20

509:                                              ; preds = %415, %414
  %510 = phi float [ undef, %414 ], [ %505, %415 ]
  %511 = phi i32 [ 0, %414 ], [ %506, %415 ]
  %512 = phi float [ 0.000000e+00, %414 ], [ %505, %415 ]
  br i1 %362, label %530, label %513

513:                                              ; preds = %509, %513
  %514 = phi i32 [ %527, %513 ], [ %511, %509 ]
  %515 = phi float [ %526, %513 ], [ %512, %509 ]
  %516 = phi i32 [ %528, %513 ], [ 0, %509 ]
  %517 = add nsw i32 %383, %514
  %518 = sext i32 %517 to i64
  %519 = getelementptr inbounds float, float addrspace(1)* %0, i64 %518
  %520 = load float, float addrspace(1)* %519, align 4, !tbaa !7
  %521 = add nsw i32 %514, %16
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds float, float addrspace(1)* %2, i64 %522
  %524 = load float, float addrspace(1)* %523, align 4, !tbaa !7
  %525 = fmul contract float %520, %524
  %526 = fadd contract float %515, %525
  %527 = add nuw nsw i32 %514, 1
  %528 = add i32 %516, 1
  %529 = icmp eq i32 %528, %359
  br i1 %529, label %530, label %513, !llvm.loop !21

530:                                              ; preds = %509, %513, %406
  %531 = phi float [ 0.000000e+00, %406 ], [ %510, %509 ], [ %526, %513 ]
  %532 = load float, float addrspace(1)* %333, align 4, !tbaa !7
  %533 = fadd contract float %531, %532
  %534 = fcmp contract ogt float %533, 0.000000e+00
  %535 = insertelement <5 x float> %413, float 1.000000e+00, i64 1
  %536 = insertelement <5 x float> %413, float 0.000000e+00, i64 1
  %537 = select i1 %534, <5 x float> %535, <5 x float> %536
  br i1 %325, label %538, label %654

538:                                              ; preds = %530
  br i1 %364, label %633, label %539

539:                                              ; preds = %538, %539
  %540 = phi i32 [ %630, %539 ], [ 0, %538 ]
  %541 = phi float [ %629, %539 ], [ 0.000000e+00, %538 ]
  %542 = phi i32 [ %631, %539 ], [ 0, %538 ]
  %543 = add nsw i32 %383, %540
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds float, float addrspace(1)* %0, i64 %544
  %546 = load float, float addrspace(1)* %545, align 4, !tbaa !7
  %547 = add nsw i32 %540, %335
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds float, float addrspace(1)* %2, i64 %548
  %550 = load float, float addrspace(1)* %549, align 4, !tbaa !7
  %551 = fmul contract float %546, %550
  %552 = fadd contract float %541, %551
  %553 = or i32 %540, 1
  %554 = add nsw i32 %383, %553
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds float, float addrspace(1)* %0, i64 %555
  %557 = load float, float addrspace(1)* %556, align 4, !tbaa !7
  %558 = add nsw i32 %553, %335
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds float, float addrspace(1)* %2, i64 %559
  %561 = load float, float addrspace(1)* %560, align 4, !tbaa !7
  %562 = fmul contract float %557, %561
  %563 = fadd contract float %552, %562
  %564 = or i32 %540, 2
  %565 = add nsw i32 %383, %564
  %566 = sext i32 %565 to i64
  %567 = getelementptr inbounds float, float addrspace(1)* %0, i64 %566
  %568 = load float, float addrspace(1)* %567, align 4, !tbaa !7
  %569 = add nsw i32 %564, %335
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds float, float addrspace(1)* %2, i64 %570
  %572 = load float, float addrspace(1)* %571, align 4, !tbaa !7
  %573 = fmul contract float %568, %572
  %574 = fadd contract float %563, %573
  %575 = or i32 %540, 3
  %576 = add nsw i32 %383, %575
  %577 = sext i32 %576 to i64
  %578 = getelementptr inbounds float, float addrspace(1)* %0, i64 %577
  %579 = load float, float addrspace(1)* %578, align 4, !tbaa !7
  %580 = add nsw i32 %575, %335
  %581 = sext i32 %580 to i64
  %582 = getelementptr inbounds float, float addrspace(1)* %2, i64 %581
  %583 = load float, float addrspace(1)* %582, align 4, !tbaa !7
  %584 = fmul contract float %579, %583
  %585 = fadd contract float %574, %584
  %586 = or i32 %540, 4
  %587 = add nsw i32 %383, %586
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds float, float addrspace(1)* %0, i64 %588
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !7
  %591 = add nsw i32 %586, %335
  %592 = sext i32 %591 to i64
  %593 = getelementptr inbounds float, float addrspace(1)* %2, i64 %592
  %594 = load float, float addrspace(1)* %593, align 4, !tbaa !7
  %595 = fmul contract float %590, %594
  %596 = fadd contract float %585, %595
  %597 = or i32 %540, 5
  %598 = add nsw i32 %383, %597
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds float, float addrspace(1)* %0, i64 %599
  %601 = load float, float addrspace(1)* %600, align 4, !tbaa !7
  %602 = add nsw i32 %597, %335
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds float, float addrspace(1)* %2, i64 %603
  %605 = load float, float addrspace(1)* %604, align 4, !tbaa !7
  %606 = fmul contract float %601, %605
  %607 = fadd contract float %596, %606
  %608 = or i32 %540, 6
  %609 = add nsw i32 %383, %608
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds float, float addrspace(1)* %0, i64 %610
  %612 = load float, float addrspace(1)* %611, align 4, !tbaa !7
  %613 = add nsw i32 %608, %335
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds float, float addrspace(1)* %2, i64 %614
  %616 = load float, float addrspace(1)* %615, align 4, !tbaa !7
  %617 = fmul contract float %612, %616
  %618 = fadd contract float %607, %617
  %619 = or i32 %540, 7
  %620 = add nsw i32 %383, %619
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds float, float addrspace(1)* %0, i64 %621
  %623 = load float, float addrspace(1)* %622, align 4, !tbaa !7
  %624 = add nsw i32 %619, %335
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds float, float addrspace(1)* %2, i64 %625
  %627 = load float, float addrspace(1)* %626, align 4, !tbaa !7
  %628 = fmul contract float %623, %627
  %629 = fadd contract float %618, %628
  %630 = add nuw nsw i32 %540, 8
  %631 = add i32 %542, 8
  %632 = icmp eq i32 %631, %365
  br i1 %632, label %633, label %539, !llvm.loop !20

633:                                              ; preds = %539, %538
  %634 = phi float [ undef, %538 ], [ %629, %539 ]
  %635 = phi i32 [ 0, %538 ], [ %630, %539 ]
  %636 = phi float [ 0.000000e+00, %538 ], [ %629, %539 ]
  br i1 %366, label %654, label %637

637:                                              ; preds = %633, %637
  %638 = phi i32 [ %651, %637 ], [ %635, %633 ]
  %639 = phi float [ %650, %637 ], [ %636, %633 ]
  %640 = phi i32 [ %652, %637 ], [ 0, %633 ]
  %641 = add nsw i32 %383, %638
  %642 = sext i32 %641 to i64
  %643 = getelementptr inbounds float, float addrspace(1)* %0, i64 %642
  %644 = load float, float addrspace(1)* %643, align 4, !tbaa !7
  %645 = add nsw i32 %638, %335
  %646 = sext i32 %645 to i64
  %647 = getelementptr inbounds float, float addrspace(1)* %2, i64 %646
  %648 = load float, float addrspace(1)* %647, align 4, !tbaa !7
  %649 = fmul contract float %644, %648
  %650 = fadd contract float %639, %649
  %651 = add nuw nsw i32 %638, 1
  %652 = add i32 %640, 1
  %653 = icmp eq i32 %652, %363
  br i1 %653, label %654, label %637, !llvm.loop !22

654:                                              ; preds = %633, %637, %530
  %655 = phi i32 [ %334, %530 ], [ %335, %637 ], [ %335, %633 ]
  %656 = phi float [ 0.000000e+00, %530 ], [ %634, %633 ], [ %650, %637 ]
  %657 = add nsw i32 %655, %5
  %658 = sext i32 %657 to i64
  %659 = getelementptr inbounds float, float addrspace(1)* %2, i64 %658
  %660 = load float, float addrspace(1)* %659, align 4, !tbaa !7
  %661 = fadd contract float %656, %660
  %662 = fcmp contract ogt float %661, 0.000000e+00
  %663 = insertelement <5 x float> %537, float 1.000000e+00, i64 2
  %664 = insertelement <5 x float> %537, float 0.000000e+00, i64 2
  %665 = select i1 %662, <5 x float> %663, <5 x float> %664
  br i1 %325, label %666, label %782

666:                                              ; preds = %654
  br i1 %368, label %761, label %667

667:                                              ; preds = %666, %667
  %668 = phi i32 [ %758, %667 ], [ 0, %666 ]
  %669 = phi float [ %757, %667 ], [ 0.000000e+00, %666 ]
  %670 = phi i32 [ %759, %667 ], [ 0, %666 ]
  %671 = add nsw i32 %383, %668
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds float, float addrspace(1)* %0, i64 %672
  %674 = load float, float addrspace(1)* %673, align 4, !tbaa !7
  %675 = add nsw i32 %668, %337
  %676 = sext i32 %675 to i64
  %677 = getelementptr inbounds float, float addrspace(1)* %2, i64 %676
  %678 = load float, float addrspace(1)* %677, align 4, !tbaa !7
  %679 = fmul contract float %674, %678
  %680 = fadd contract float %669, %679
  %681 = or i32 %668, 1
  %682 = add nsw i32 %383, %681
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds float, float addrspace(1)* %0, i64 %683
  %685 = load float, float addrspace(1)* %684, align 4, !tbaa !7
  %686 = add nsw i32 %681, %337
  %687 = sext i32 %686 to i64
  %688 = getelementptr inbounds float, float addrspace(1)* %2, i64 %687
  %689 = load float, float addrspace(1)* %688, align 4, !tbaa !7
  %690 = fmul contract float %685, %689
  %691 = fadd contract float %680, %690
  %692 = or i32 %668, 2
  %693 = add nsw i32 %383, %692
  %694 = sext i32 %693 to i64
  %695 = getelementptr inbounds float, float addrspace(1)* %0, i64 %694
  %696 = load float, float addrspace(1)* %695, align 4, !tbaa !7
  %697 = add nsw i32 %692, %337
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds float, float addrspace(1)* %2, i64 %698
  %700 = load float, float addrspace(1)* %699, align 4, !tbaa !7
  %701 = fmul contract float %696, %700
  %702 = fadd contract float %691, %701
  %703 = or i32 %668, 3
  %704 = add nsw i32 %383, %703
  %705 = sext i32 %704 to i64
  %706 = getelementptr inbounds float, float addrspace(1)* %0, i64 %705
  %707 = load float, float addrspace(1)* %706, align 4, !tbaa !7
  %708 = add nsw i32 %703, %337
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds float, float addrspace(1)* %2, i64 %709
  %711 = load float, float addrspace(1)* %710, align 4, !tbaa !7
  %712 = fmul contract float %707, %711
  %713 = fadd contract float %702, %712
  %714 = or i32 %668, 4
  %715 = add nsw i32 %383, %714
  %716 = sext i32 %715 to i64
  %717 = getelementptr inbounds float, float addrspace(1)* %0, i64 %716
  %718 = load float, float addrspace(1)* %717, align 4, !tbaa !7
  %719 = add nsw i32 %714, %337
  %720 = sext i32 %719 to i64
  %721 = getelementptr inbounds float, float addrspace(1)* %2, i64 %720
  %722 = load float, float addrspace(1)* %721, align 4, !tbaa !7
  %723 = fmul contract float %718, %722
  %724 = fadd contract float %713, %723
  %725 = or i32 %668, 5
  %726 = add nsw i32 %383, %725
  %727 = sext i32 %726 to i64
  %728 = getelementptr inbounds float, float addrspace(1)* %0, i64 %727
  %729 = load float, float addrspace(1)* %728, align 4, !tbaa !7
  %730 = add nsw i32 %725, %337
  %731 = sext i32 %730 to i64
  %732 = getelementptr inbounds float, float addrspace(1)* %2, i64 %731
  %733 = load float, float addrspace(1)* %732, align 4, !tbaa !7
  %734 = fmul contract float %729, %733
  %735 = fadd contract float %724, %734
  %736 = or i32 %668, 6
  %737 = add nsw i32 %383, %736
  %738 = sext i32 %737 to i64
  %739 = getelementptr inbounds float, float addrspace(1)* %0, i64 %738
  %740 = load float, float addrspace(1)* %739, align 4, !tbaa !7
  %741 = add nsw i32 %736, %337
  %742 = sext i32 %741 to i64
  %743 = getelementptr inbounds float, float addrspace(1)* %2, i64 %742
  %744 = load float, float addrspace(1)* %743, align 4, !tbaa !7
  %745 = fmul contract float %740, %744
  %746 = fadd contract float %735, %745
  %747 = or i32 %668, 7
  %748 = add nsw i32 %383, %747
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds float, float addrspace(1)* %0, i64 %749
  %751 = load float, float addrspace(1)* %750, align 4, !tbaa !7
  %752 = add nsw i32 %747, %337
  %753 = sext i32 %752 to i64
  %754 = getelementptr inbounds float, float addrspace(1)* %2, i64 %753
  %755 = load float, float addrspace(1)* %754, align 4, !tbaa !7
  %756 = fmul contract float %751, %755
  %757 = fadd contract float %746, %756
  %758 = add nuw nsw i32 %668, 8
  %759 = add i32 %670, 8
  %760 = icmp eq i32 %759, %369
  br i1 %760, label %761, label %667, !llvm.loop !20

761:                                              ; preds = %667, %666
  %762 = phi float [ undef, %666 ], [ %757, %667 ]
  %763 = phi i32 [ 0, %666 ], [ %758, %667 ]
  %764 = phi float [ 0.000000e+00, %666 ], [ %757, %667 ]
  br i1 %370, label %782, label %765

765:                                              ; preds = %761, %765
  %766 = phi i32 [ %779, %765 ], [ %763, %761 ]
  %767 = phi float [ %778, %765 ], [ %764, %761 ]
  %768 = phi i32 [ %780, %765 ], [ 0, %761 ]
  %769 = add nsw i32 %383, %766
  %770 = sext i32 %769 to i64
  %771 = getelementptr inbounds float, float addrspace(1)* %0, i64 %770
  %772 = load float, float addrspace(1)* %771, align 4, !tbaa !7
  %773 = add nsw i32 %766, %337
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds float, float addrspace(1)* %2, i64 %774
  %776 = load float, float addrspace(1)* %775, align 4, !tbaa !7
  %777 = fmul contract float %772, %776
  %778 = fadd contract float %767, %777
  %779 = add nuw nsw i32 %766, 1
  %780 = add i32 %768, 1
  %781 = icmp eq i32 %780, %367
  br i1 %781, label %782, label %765, !llvm.loop !23

782:                                              ; preds = %761, %765, %654
  %783 = phi i32 [ %336, %654 ], [ %337, %765 ], [ %337, %761 ]
  %784 = phi float [ 0.000000e+00, %654 ], [ %762, %761 ], [ %778, %765 ]
  %785 = add nsw i32 %783, %5
  %786 = sext i32 %785 to i64
  %787 = getelementptr inbounds float, float addrspace(1)* %2, i64 %786
  %788 = load float, float addrspace(1)* %787, align 4, !tbaa !7
  %789 = fadd contract float %784, %788
  %790 = fcmp contract ogt float %789, 0.000000e+00
  %791 = insertelement <5 x float> %665, float 1.000000e+00, i64 3
  %792 = insertelement <5 x float> %665, float 0.000000e+00, i64 3
  %793 = select i1 %790, <5 x float> %791, <5 x float> %792
  br i1 %325, label %794, label %910

794:                                              ; preds = %782
  br i1 %372, label %889, label %795

795:                                              ; preds = %794, %795
  %796 = phi i32 [ %886, %795 ], [ 0, %794 ]
  %797 = phi float [ %885, %795 ], [ 0.000000e+00, %794 ]
  %798 = phi i32 [ %887, %795 ], [ 0, %794 ]
  %799 = add nsw i32 %383, %796
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds float, float addrspace(1)* %0, i64 %800
  %802 = load float, float addrspace(1)* %801, align 4, !tbaa !7
  %803 = add nsw i32 %796, %339
  %804 = sext i32 %803 to i64
  %805 = getelementptr inbounds float, float addrspace(1)* %2, i64 %804
  %806 = load float, float addrspace(1)* %805, align 4, !tbaa !7
  %807 = fmul contract float %802, %806
  %808 = fadd contract float %797, %807
  %809 = or i32 %796, 1
  %810 = add nsw i32 %383, %809
  %811 = sext i32 %810 to i64
  %812 = getelementptr inbounds float, float addrspace(1)* %0, i64 %811
  %813 = load float, float addrspace(1)* %812, align 4, !tbaa !7
  %814 = add nsw i32 %809, %339
  %815 = sext i32 %814 to i64
  %816 = getelementptr inbounds float, float addrspace(1)* %2, i64 %815
  %817 = load float, float addrspace(1)* %816, align 4, !tbaa !7
  %818 = fmul contract float %813, %817
  %819 = fadd contract float %808, %818
  %820 = or i32 %796, 2
  %821 = add nsw i32 %383, %820
  %822 = sext i32 %821 to i64
  %823 = getelementptr inbounds float, float addrspace(1)* %0, i64 %822
  %824 = load float, float addrspace(1)* %823, align 4, !tbaa !7
  %825 = add nsw i32 %820, %339
  %826 = sext i32 %825 to i64
  %827 = getelementptr inbounds float, float addrspace(1)* %2, i64 %826
  %828 = load float, float addrspace(1)* %827, align 4, !tbaa !7
  %829 = fmul contract float %824, %828
  %830 = fadd contract float %819, %829
  %831 = or i32 %796, 3
  %832 = add nsw i32 %383, %831
  %833 = sext i32 %832 to i64
  %834 = getelementptr inbounds float, float addrspace(1)* %0, i64 %833
  %835 = load float, float addrspace(1)* %834, align 4, !tbaa !7
  %836 = add nsw i32 %831, %339
  %837 = sext i32 %836 to i64
  %838 = getelementptr inbounds float, float addrspace(1)* %2, i64 %837
  %839 = load float, float addrspace(1)* %838, align 4, !tbaa !7
  %840 = fmul contract float %835, %839
  %841 = fadd contract float %830, %840
  %842 = or i32 %796, 4
  %843 = add nsw i32 %383, %842
  %844 = sext i32 %843 to i64
  %845 = getelementptr inbounds float, float addrspace(1)* %0, i64 %844
  %846 = load float, float addrspace(1)* %845, align 4, !tbaa !7
  %847 = add nsw i32 %842, %339
  %848 = sext i32 %847 to i64
  %849 = getelementptr inbounds float, float addrspace(1)* %2, i64 %848
  %850 = load float, float addrspace(1)* %849, align 4, !tbaa !7
  %851 = fmul contract float %846, %850
  %852 = fadd contract float %841, %851
  %853 = or i32 %796, 5
  %854 = add nsw i32 %383, %853
  %855 = sext i32 %854 to i64
  %856 = getelementptr inbounds float, float addrspace(1)* %0, i64 %855
  %857 = load float, float addrspace(1)* %856, align 4, !tbaa !7
  %858 = add nsw i32 %853, %339
  %859 = sext i32 %858 to i64
  %860 = getelementptr inbounds float, float addrspace(1)* %2, i64 %859
  %861 = load float, float addrspace(1)* %860, align 4, !tbaa !7
  %862 = fmul contract float %857, %861
  %863 = fadd contract float %852, %862
  %864 = or i32 %796, 6
  %865 = add nsw i32 %383, %864
  %866 = sext i32 %865 to i64
  %867 = getelementptr inbounds float, float addrspace(1)* %0, i64 %866
  %868 = load float, float addrspace(1)* %867, align 4, !tbaa !7
  %869 = add nsw i32 %864, %339
  %870 = sext i32 %869 to i64
  %871 = getelementptr inbounds float, float addrspace(1)* %2, i64 %870
  %872 = load float, float addrspace(1)* %871, align 4, !tbaa !7
  %873 = fmul contract float %868, %872
  %874 = fadd contract float %863, %873
  %875 = or i32 %796, 7
  %876 = add nsw i32 %383, %875
  %877 = sext i32 %876 to i64
  %878 = getelementptr inbounds float, float addrspace(1)* %0, i64 %877
  %879 = load float, float addrspace(1)* %878, align 4, !tbaa !7
  %880 = add nsw i32 %875, %339
  %881 = sext i32 %880 to i64
  %882 = getelementptr inbounds float, float addrspace(1)* %2, i64 %881
  %883 = load float, float addrspace(1)* %882, align 4, !tbaa !7
  %884 = fmul contract float %879, %883
  %885 = fadd contract float %874, %884
  %886 = add nuw nsw i32 %796, 8
  %887 = add i32 %798, 8
  %888 = icmp eq i32 %887, %373
  br i1 %888, label %889, label %795, !llvm.loop !20

889:                                              ; preds = %795, %794
  %890 = phi float [ undef, %794 ], [ %885, %795 ]
  %891 = phi i32 [ 0, %794 ], [ %886, %795 ]
  %892 = phi float [ 0.000000e+00, %794 ], [ %885, %795 ]
  br i1 %374, label %910, label %893

893:                                              ; preds = %889, %893
  %894 = phi i32 [ %907, %893 ], [ %891, %889 ]
  %895 = phi float [ %906, %893 ], [ %892, %889 ]
  %896 = phi i32 [ %908, %893 ], [ 0, %889 ]
  %897 = add nsw i32 %383, %894
  %898 = sext i32 %897 to i64
  %899 = getelementptr inbounds float, float addrspace(1)* %0, i64 %898
  %900 = load float, float addrspace(1)* %899, align 4, !tbaa !7
  %901 = add nsw i32 %894, %339
  %902 = sext i32 %901 to i64
  %903 = getelementptr inbounds float, float addrspace(1)* %2, i64 %902
  %904 = load float, float addrspace(1)* %903, align 4, !tbaa !7
  %905 = fmul contract float %900, %904
  %906 = fadd contract float %895, %905
  %907 = add nuw nsw i32 %894, 1
  %908 = add i32 %896, 1
  %909 = icmp eq i32 %908, %371
  br i1 %909, label %910, label %893, !llvm.loop !24

910:                                              ; preds = %889, %893, %782
  %911 = phi i32 [ %338, %782 ], [ %339, %893 ], [ %339, %889 ]
  %912 = phi float [ 0.000000e+00, %782 ], [ %890, %889 ], [ %906, %893 ]
  %913 = add nsw i32 %911, %5
  %914 = sext i32 %913 to i64
  %915 = getelementptr inbounds float, float addrspace(1)* %2, i64 %914
  %916 = load float, float addrspace(1)* %915, align 4, !tbaa !7
  %917 = fadd contract float %912, %916
  %918 = fcmp contract ogt float %917, 0.000000e+00
  %919 = insertelement <5 x float> %793, float 1.000000e+00, i64 4
  %920 = insertelement <5 x float> %793, float 0.000000e+00, i64 4
  %921 = select i1 %918, <5 x float> %919, <5 x float> %920
  %922 = extractelement <5 x float> %921, i64 0
  %923 = load float, float addrspace(1)* %341, align 4, !tbaa !7
  %924 = fmul contract float %922, %923
  %925 = fadd contract float %924, 0.000000e+00
  %926 = extractelement <5 x float> %921, i64 1
  %927 = load float, float addrspace(1)* %344, align 4, !tbaa !7
  %928 = fmul contract float %926, %927
  %929 = fadd contract float %925, %928
  %930 = extractelement <5 x float> %921, i64 2
  %931 = load float, float addrspace(1)* %347, align 4, !tbaa !7
  %932 = fmul contract float %930, %931
  %933 = fadd contract float %929, %932
  %934 = extractelement <5 x float> %921, i64 3
  %935 = load float, float addrspace(1)* %350, align 4, !tbaa !7
  %936 = fmul contract float %934, %935
  %937 = fadd contract float %933, %936
  %938 = extractelement <5 x float> %921, i64 4
  %939 = load float, float addrspace(1)* %353, align 4, !tbaa !7
  %940 = fmul contract float %938, %939
  %941 = fadd contract float %937, %940
  %942 = load float, float addrspace(1)* %327, align 4, !tbaa !7
  %943 = fadd contract float %941, %942
  %944 = fcmp contract ogt float %943, 0.000000e+00
  %945 = select i1 %944, float 1.000000e+00, float 0.000000e+00
  %946 = add nsw i32 %380, %20
  %947 = sext i32 %946 to i64
  %948 = getelementptr inbounds float, float addrspace(1)* %1, i64 %947
  %949 = load float, float addrspace(1)* %948, align 4, !tbaa !7
  %950 = fsub contract float %949, %945
  %951 = fcmp contract une float %950, 0.000000e+00
  br i1 %951, label %1038, label %1192

952:                                              ; preds = %384, %952
  %953 = phi i32 [ %1035, %952 ], [ 0, %384 ]
  %954 = phi float [ %1034, %952 ], [ 0.000000e+00, %384 ]
  %955 = phi i32 [ %1036, %952 ], [ 0, %384 ]
  %956 = add nsw i32 %383, %953
  %957 = sext i32 %956 to i64
  %958 = getelementptr inbounds float, float addrspace(1)* %0, i64 %957
  %959 = load float, float addrspace(1)* %958, align 4, !tbaa !7
  %960 = zext i32 %953 to i64
  %961 = getelementptr inbounds float, float addrspace(1)* %2, i64 %960
  %962 = load float, float addrspace(1)* %961, align 4, !tbaa !7
  %963 = fmul contract float %959, %962
  %964 = fadd contract float %954, %963
  %965 = or i32 %953, 1
  %966 = add nsw i32 %383, %965
  %967 = sext i32 %966 to i64
  %968 = getelementptr inbounds float, float addrspace(1)* %0, i64 %967
  %969 = load float, float addrspace(1)* %968, align 4, !tbaa !7
  %970 = zext i32 %965 to i64
  %971 = getelementptr inbounds float, float addrspace(1)* %2, i64 %970
  %972 = load float, float addrspace(1)* %971, align 4, !tbaa !7
  %973 = fmul contract float %969, %972
  %974 = fadd contract float %964, %973
  %975 = or i32 %953, 2
  %976 = add nsw i32 %383, %975
  %977 = sext i32 %976 to i64
  %978 = getelementptr inbounds float, float addrspace(1)* %0, i64 %977
  %979 = load float, float addrspace(1)* %978, align 4, !tbaa !7
  %980 = zext i32 %975 to i64
  %981 = getelementptr inbounds float, float addrspace(1)* %2, i64 %980
  %982 = load float, float addrspace(1)* %981, align 4, !tbaa !7
  %983 = fmul contract float %979, %982
  %984 = fadd contract float %974, %983
  %985 = or i32 %953, 3
  %986 = add nsw i32 %383, %985
  %987 = sext i32 %986 to i64
  %988 = getelementptr inbounds float, float addrspace(1)* %0, i64 %987
  %989 = load float, float addrspace(1)* %988, align 4, !tbaa !7
  %990 = zext i32 %985 to i64
  %991 = getelementptr inbounds float, float addrspace(1)* %2, i64 %990
  %992 = load float, float addrspace(1)* %991, align 4, !tbaa !7
  %993 = fmul contract float %989, %992
  %994 = fadd contract float %984, %993
  %995 = or i32 %953, 4
  %996 = add nsw i32 %383, %995
  %997 = sext i32 %996 to i64
  %998 = getelementptr inbounds float, float addrspace(1)* %0, i64 %997
  %999 = load float, float addrspace(1)* %998, align 4, !tbaa !7
  %1000 = zext i32 %995 to i64
  %1001 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1000
  %1002 = load float, float addrspace(1)* %1001, align 4, !tbaa !7
  %1003 = fmul contract float %999, %1002
  %1004 = fadd contract float %994, %1003
  %1005 = or i32 %953, 5
  %1006 = add nsw i32 %383, %1005
  %1007 = sext i32 %1006 to i64
  %1008 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1007
  %1009 = load float, float addrspace(1)* %1008, align 4, !tbaa !7
  %1010 = zext i32 %1005 to i64
  %1011 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1010
  %1012 = load float, float addrspace(1)* %1011, align 4, !tbaa !7
  %1013 = fmul contract float %1009, %1012
  %1014 = fadd contract float %1004, %1013
  %1015 = or i32 %953, 6
  %1016 = add nsw i32 %383, %1015
  %1017 = sext i32 %1016 to i64
  %1018 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1017
  %1019 = load float, float addrspace(1)* %1018, align 4, !tbaa !7
  %1020 = zext i32 %1015 to i64
  %1021 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1020
  %1022 = load float, float addrspace(1)* %1021, align 4, !tbaa !7
  %1023 = fmul contract float %1019, %1022
  %1024 = fadd contract float %1014, %1023
  %1025 = or i32 %953, 7
  %1026 = add nsw i32 %383, %1025
  %1027 = sext i32 %1026 to i64
  %1028 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1027
  %1029 = load float, float addrspace(1)* %1028, align 4, !tbaa !7
  %1030 = zext i32 %1025 to i64
  %1031 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1030
  %1032 = load float, float addrspace(1)* %1031, align 4, !tbaa !7
  %1033 = fmul contract float %1029, %1032
  %1034 = fadd contract float %1024, %1033
  %1035 = add nuw nsw i32 %953, 8
  %1036 = add i32 %955, 8
  %1037 = icmp eq i32 %1036, %357
  br i1 %1037, label %386, label %952, !llvm.loop !20

1038:                                             ; preds = %910
  %1039 = fmul contract float %950, %922
  %1040 = load float, float addrspace(1)* %269, align 4, !tbaa !7
  %1041 = fadd contract float %1039, %1040
  store float %1041, float addrspace(1)* %269, align 4, !tbaa !7
  %1042 = fmul contract float %950, %926
  %1043 = load float, float addrspace(1)* %272, align 4, !tbaa !7
  %1044 = fadd contract float %1042, %1043
  store float %1044, float addrspace(1)* %272, align 4, !tbaa !7
  %1045 = fmul contract float %950, %930
  %1046 = load float, float addrspace(1)* %275, align 4, !tbaa !7
  %1047 = fadd contract float %1045, %1046
  store float %1047, float addrspace(1)* %275, align 4, !tbaa !7
  %1048 = fmul contract float %950, %934
  %1049 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %1050 = fadd contract float %1048, %1049
  store float %1050, float addrspace(1)* %278, align 4, !tbaa !7
  %1051 = fmul contract float %950, %938
  %1052 = load float, float addrspace(1)* %281, align 4, !tbaa !7
  %1053 = fadd contract float %1051, %1052
  store float %1053, float addrspace(1)* %281, align 4, !tbaa !7
  %1054 = load float, float addrspace(1)* %284, align 4, !tbaa !7
  %1055 = fadd contract float %950, %1054
  store float %1055, float addrspace(1)* %284, align 4, !tbaa !7
  br label %1056

1056:                                             ; preds = %1038, %1189
  %1057 = phi i32 [ 0, %1038 ], [ %1190, %1189 ]
  %1058 = add nsw i32 %1057, %17
  %1059 = sext i32 %1058 to i64
  %1060 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1059
  %1061 = load float, float addrspace(1)* %1060, align 4, !tbaa !7
  %1062 = fmul contract float %950, %1061
  %1063 = fcmp contract ogt float %1062, 0.000000e+00
  %1064 = select i1 %1063, float 1.000000e+00, float 0.000000e+00
  %1065 = extractelement <5 x float> %921, i32 %1057
  %1066 = fsub contract float %1064, %1065
  %1067 = fcmp contract une float %1066, 0.000000e+00
  br i1 %1067, label %1068, label %1189

1068:                                             ; preds = %1056
  %1069 = mul nsw i32 %1057, %16
  br i1 %325, label %1070, label %1090

1070:                                             ; preds = %1068
  %1071 = add nsw i32 %1069, %19
  br i1 %376, label %1072, label %1096

1072:                                             ; preds = %1096, %1070
  %1073 = phi i32 [ 0, %1070 ], [ %1186, %1096 ]
  br i1 %378, label %1090, label %1074

1074:                                             ; preds = %1072, %1074
  %1075 = phi i32 [ %1087, %1074 ], [ %1073, %1072 ]
  %1076 = phi i32 [ %1088, %1074 ], [ 0, %1072 ]
  %1077 = add nsw i32 %383, %1075
  %1078 = sext i32 %1077 to i64
  %1079 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1078
  %1080 = load float, float addrspace(1)* %1079, align 4, !tbaa !7
  %1081 = fmul contract float %1066, %1080
  %1082 = add nsw i32 %1071, %1075
  %1083 = sext i32 %1082 to i64
  %1084 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1083
  %1085 = load float, float addrspace(1)* %1084, align 4, !tbaa !7
  %1086 = fadd contract float %1085, %1081
  store float %1086, float addrspace(1)* %1084, align 4, !tbaa !7
  %1087 = add nuw nsw i32 %1075, 1
  %1088 = add i32 %1076, 1
  %1089 = icmp eq i32 %1088, %375
  br i1 %1089, label %1090, label %1074, !llvm.loop !25

1090:                                             ; preds = %1072, %1074, %1068
  %1091 = add i32 %328, %1069
  %1092 = sext i32 %1091 to i64
  %1093 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1092
  %1094 = load float, float addrspace(1)* %1093, align 4, !tbaa !7
  %1095 = fadd contract float %1066, %1094
  store float %1095, float addrspace(1)* %1093, align 4, !tbaa !7
  br label %1189

1096:                                             ; preds = %1070, %1096
  %1097 = phi i32 [ %1186, %1096 ], [ 0, %1070 ]
  %1098 = phi i32 [ %1187, %1096 ], [ 0, %1070 ]
  %1099 = add nsw i32 %383, %1097
  %1100 = sext i32 %1099 to i64
  %1101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1100
  %1102 = load float, float addrspace(1)* %1101, align 4, !tbaa !7
  %1103 = fmul contract float %1066, %1102
  %1104 = add nsw i32 %1071, %1097
  %1105 = sext i32 %1104 to i64
  %1106 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1105
  %1107 = load float, float addrspace(1)* %1106, align 4, !tbaa !7
  %1108 = fadd contract float %1107, %1103
  store float %1108, float addrspace(1)* %1106, align 4, !tbaa !7
  %1109 = or i32 %1097, 1
  %1110 = add nsw i32 %383, %1109
  %1111 = sext i32 %1110 to i64
  %1112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1111
  %1113 = load float, float addrspace(1)* %1112, align 4, !tbaa !7
  %1114 = fmul contract float %1066, %1113
  %1115 = add nsw i32 %1071, %1109
  %1116 = sext i32 %1115 to i64
  %1117 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1116
  %1118 = load float, float addrspace(1)* %1117, align 4, !tbaa !7
  %1119 = fadd contract float %1118, %1114
  store float %1119, float addrspace(1)* %1117, align 4, !tbaa !7
  %1120 = or i32 %1097, 2
  %1121 = add nsw i32 %383, %1120
  %1122 = sext i32 %1121 to i64
  %1123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1122
  %1124 = load float, float addrspace(1)* %1123, align 4, !tbaa !7
  %1125 = fmul contract float %1066, %1124
  %1126 = add nsw i32 %1071, %1120
  %1127 = sext i32 %1126 to i64
  %1128 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1127
  %1129 = load float, float addrspace(1)* %1128, align 4, !tbaa !7
  %1130 = fadd contract float %1129, %1125
  store float %1130, float addrspace(1)* %1128, align 4, !tbaa !7
  %1131 = or i32 %1097, 3
  %1132 = add nsw i32 %383, %1131
  %1133 = sext i32 %1132 to i64
  %1134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1133
  %1135 = load float, float addrspace(1)* %1134, align 4, !tbaa !7
  %1136 = fmul contract float %1066, %1135
  %1137 = add nsw i32 %1071, %1131
  %1138 = sext i32 %1137 to i64
  %1139 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1138
  %1140 = load float, float addrspace(1)* %1139, align 4, !tbaa !7
  %1141 = fadd contract float %1140, %1136
  store float %1141, float addrspace(1)* %1139, align 4, !tbaa !7
  %1142 = or i32 %1097, 4
  %1143 = add nsw i32 %383, %1142
  %1144 = sext i32 %1143 to i64
  %1145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1144
  %1146 = load float, float addrspace(1)* %1145, align 4, !tbaa !7
  %1147 = fmul contract float %1066, %1146
  %1148 = add nsw i32 %1071, %1142
  %1149 = sext i32 %1148 to i64
  %1150 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1149
  %1151 = load float, float addrspace(1)* %1150, align 4, !tbaa !7
  %1152 = fadd contract float %1151, %1147
  store float %1152, float addrspace(1)* %1150, align 4, !tbaa !7
  %1153 = or i32 %1097, 5
  %1154 = add nsw i32 %383, %1153
  %1155 = sext i32 %1154 to i64
  %1156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1155
  %1157 = load float, float addrspace(1)* %1156, align 4, !tbaa !7
  %1158 = fmul contract float %1066, %1157
  %1159 = add nsw i32 %1071, %1153
  %1160 = sext i32 %1159 to i64
  %1161 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1160
  %1162 = load float, float addrspace(1)* %1161, align 4, !tbaa !7
  %1163 = fadd contract float %1162, %1158
  store float %1163, float addrspace(1)* %1161, align 4, !tbaa !7
  %1164 = or i32 %1097, 6
  %1165 = add nsw i32 %383, %1164
  %1166 = sext i32 %1165 to i64
  %1167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1166
  %1168 = load float, float addrspace(1)* %1167, align 4, !tbaa !7
  %1169 = fmul contract float %1066, %1168
  %1170 = add nsw i32 %1071, %1164
  %1171 = sext i32 %1170 to i64
  %1172 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1171
  %1173 = load float, float addrspace(1)* %1172, align 4, !tbaa !7
  %1174 = fadd contract float %1173, %1169
  store float %1174, float addrspace(1)* %1172, align 4, !tbaa !7
  %1175 = or i32 %1097, 7
  %1176 = add nsw i32 %383, %1175
  %1177 = sext i32 %1176 to i64
  %1178 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1177
  %1179 = load float, float addrspace(1)* %1178, align 4, !tbaa !7
  %1180 = fmul contract float %1066, %1179
  %1181 = add nsw i32 %1071, %1175
  %1182 = sext i32 %1181 to i64
  %1183 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1182
  %1184 = load float, float addrspace(1)* %1183, align 4, !tbaa !7
  %1185 = fadd contract float %1184, %1180
  store float %1185, float addrspace(1)* %1183, align 4, !tbaa !7
  %1186 = add nuw nsw i32 %1097, 8
  %1187 = add i32 %1098, 8
  %1188 = icmp eq i32 %1187, %377
  br i1 %1188, label %1072, label %1096, !llvm.loop !26

1189:                                             ; preds = %1056, %1090
  %1190 = add nuw nsw i32 %1057, 1
  %1191 = icmp eq i32 %1190, 5
  br i1 %1191, label %1192, label %1056, !llvm.loop !27

1192:                                             ; preds = %1189, %910
  %1193 = add nuw nsw i32 %380, 1
  %1194 = icmp eq i32 %1193, %4
  br i1 %1194, label %385, label %379, !llvm.loop !28
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !12}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !12}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !12}
!26 = distinct !{!26, !14}
!27 = distinct !{!27, !14}
!28 = distinct !{!28, !14}
