; ModuleID = '../data/hip_kernels/16974/2/main.cu'
source_filename = "../data/hip_kernels/16974/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5cruzajjPiS_S_S_S_(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = udiv i32 %16, %13
  %21 = mul i32 %20, %13
  %22 = icmp ugt i32 %16, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %13
  %26 = icmp ult i32 %19, %0
  br i1 %26, label %27, label %38

27:                                               ; preds = %7
  %28 = icmp eq i32 %1, 0
  %29 = add i32 %1, -1
  %30 = and i32 %1, 7
  %31 = icmp ult i32 %29, 7
  %32 = and i32 %1, -8
  %33 = icmp eq i32 %30, 0
  %34 = and i32 %1, 7
  %35 = icmp ult i32 %1, 8
  %36 = and i32 %1, -8
  %37 = icmp eq i32 %34, 0
  br label %39

38:                                               ; preds = %293, %7
  ret void

39:                                               ; preds = %27, %293
  %40 = phi i32 [ %19, %27 ], [ %294, %293 ]
  %41 = shl nsw i32 %40, 2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !16
  %45 = add nuw nsw i32 %40, 1
  %46 = shl nsw i32 %45, 2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !16
  %50 = urem i32 %49, %1
  %51 = add i32 %41, 8
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !16
  %55 = add i32 %41, 12
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !16
  %59 = urem i32 %58, %1
  %60 = sext i32 %40 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !16
  %63 = sext i32 %45 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !16
  %66 = icmp sgt i32 %44, 1
  %67 = select i1 %66, i1 true, i1 %28
  br i1 %67, label %155, label %68

68:                                               ; preds = %39
  %69 = mul i32 %62, %1
  %70 = mul i32 %40, %1
  br i1 %31, label %140, label %71

71:                                               ; preds = %68, %71
  %72 = phi i32 [ %137, %71 ], [ 0, %68 ]
  %73 = phi i32 [ %138, %71 ], [ 0, %68 ]
  %74 = add i32 %72, %69
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !16
  %78 = add i32 %72, %70
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %79
  store i32 %77, i32 addrspace(1)* %80, align 4, !tbaa !16
  %81 = or i32 %72, 1
  %82 = add i32 %81, %69
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !16
  %86 = add i32 %81, %70
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %87
  store i32 %85, i32 addrspace(1)* %88, align 4, !tbaa !16
  %89 = or i32 %72, 2
  %90 = add i32 %89, %69
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !16
  %94 = add i32 %89, %70
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %95
  store i32 %93, i32 addrspace(1)* %96, align 4, !tbaa !16
  %97 = or i32 %72, 3
  %98 = add i32 %97, %69
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !16
  %102 = add i32 %97, %70
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %103
  store i32 %101, i32 addrspace(1)* %104, align 4, !tbaa !16
  %105 = or i32 %72, 4
  %106 = add i32 %105, %69
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !16
  %110 = add i32 %105, %70
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %111
  store i32 %109, i32 addrspace(1)* %112, align 4, !tbaa !16
  %113 = or i32 %72, 5
  %114 = add i32 %113, %69
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !16
  %118 = add i32 %113, %70
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %119
  store i32 %117, i32 addrspace(1)* %120, align 4, !tbaa !16
  %121 = or i32 %72, 6
  %122 = add i32 %121, %69
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !16
  %126 = add i32 %121, %70
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %127
  store i32 %125, i32 addrspace(1)* %128, align 4, !tbaa !16
  %129 = or i32 %72, 7
  %130 = add i32 %129, %69
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %131
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !16
  %134 = add i32 %129, %70
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %135
  store i32 %133, i32 addrspace(1)* %136, align 4, !tbaa !16
  %137 = add nuw nsw i32 %72, 8
  %138 = add i32 %73, 8
  %139 = icmp eq i32 %138, %32
  br i1 %139, label %140, label %71, !llvm.loop !20

140:                                              ; preds = %71, %68
  %141 = phi i32 [ 0, %68 ], [ %137, %71 ]
  br i1 %33, label %155, label %142

142:                                              ; preds = %140, %142
  %143 = phi i32 [ %152, %142 ], [ %141, %140 ]
  %144 = phi i32 [ %153, %142 ], [ 0, %140 ]
  %145 = add i32 %143, %69
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !16
  %149 = add i32 %143, %70
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %150
  store i32 %148, i32 addrspace(1)* %151, align 4, !tbaa !16
  %152 = add nuw nsw i32 %143, 1
  %153 = add i32 %144, 1
  %154 = icmp eq i32 %153, %30
  br i1 %154, label %155, label %142, !llvm.loop !22

155:                                              ; preds = %140, %142, %39
  br i1 %28, label %174, label %156

156:                                              ; preds = %155
  %157 = mul i32 %62, %1
  %158 = mul i32 %40, %1
  br i1 %35, label %159, label %183

159:                                              ; preds = %183, %156
  %160 = phi i32 [ 0, %156 ], [ %249, %183 ]
  br i1 %37, label %174, label %161

161:                                              ; preds = %159, %161
  %162 = phi i32 [ %171, %161 ], [ %160, %159 ]
  %163 = phi i32 [ %172, %161 ], [ 0, %159 ]
  %164 = add i32 %162, %157
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %165
  %167 = load i32, i32 addrspace(1)* %166, align 4, !tbaa !16
  %168 = add i32 %162, %158
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %169
  store i32 %167, i32 addrspace(1)* %170, align 4, !tbaa !16
  %171 = add nuw nsw i32 %162, 1
  %172 = add i32 %163, 1
  %173 = icmp eq i32 %172, %34
  br i1 %173, label %174, label %161, !llvm.loop !24

174:                                              ; preds = %159, %161, %155
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %60
  %176 = load i32, i32 addrspace(1)* %175, align 4, !tbaa !16
  %177 = add nsw i32 %176, %50
  %178 = tail call i32 @llvm.smin.i32(i32 %177, i32 19)
  %179 = icmp slt i32 %50, %178
  br i1 %179, label %180, label %258

180:                                              ; preds = %174
  %181 = mul i32 %40, %1
  %182 = mul i32 %65, %1
  br label %252

183:                                              ; preds = %156, %183
  %184 = phi i32 [ %249, %183 ], [ 0, %156 ]
  %185 = phi i32 [ %250, %183 ], [ 0, %156 ]
  %186 = add i32 %184, %157
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %187
  %189 = load i32, i32 addrspace(1)* %188, align 4, !tbaa !16
  %190 = add i32 %184, %158
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %191
  store i32 %189, i32 addrspace(1)* %192, align 4, !tbaa !16
  %193 = or i32 %184, 1
  %194 = add i32 %193, %157
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %195
  %197 = load i32, i32 addrspace(1)* %196, align 4, !tbaa !16
  %198 = add i32 %193, %158
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %199
  store i32 %197, i32 addrspace(1)* %200, align 4, !tbaa !16
  %201 = or i32 %184, 2
  %202 = add i32 %201, %157
  %203 = zext i32 %202 to i64
  %204 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %203
  %205 = load i32, i32 addrspace(1)* %204, align 4, !tbaa !16
  %206 = add i32 %201, %158
  %207 = zext i32 %206 to i64
  %208 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %207
  store i32 %205, i32 addrspace(1)* %208, align 4, !tbaa !16
  %209 = or i32 %184, 3
  %210 = add i32 %209, %157
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %211
  %213 = load i32, i32 addrspace(1)* %212, align 4, !tbaa !16
  %214 = add i32 %209, %158
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %215
  store i32 %213, i32 addrspace(1)* %216, align 4, !tbaa !16
  %217 = or i32 %184, 4
  %218 = add i32 %217, %157
  %219 = zext i32 %218 to i64
  %220 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %219
  %221 = load i32, i32 addrspace(1)* %220, align 4, !tbaa !16
  %222 = add i32 %217, %158
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %223
  store i32 %221, i32 addrspace(1)* %224, align 4, !tbaa !16
  %225 = or i32 %184, 5
  %226 = add i32 %225, %157
  %227 = zext i32 %226 to i64
  %228 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %227
  %229 = load i32, i32 addrspace(1)* %228, align 4, !tbaa !16
  %230 = add i32 %225, %158
  %231 = zext i32 %230 to i64
  %232 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %231
  store i32 %229, i32 addrspace(1)* %232, align 4, !tbaa !16
  %233 = or i32 %184, 6
  %234 = add i32 %233, %157
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %235
  %237 = load i32, i32 addrspace(1)* %236, align 4, !tbaa !16
  %238 = add i32 %233, %158
  %239 = zext i32 %238 to i64
  %240 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %239
  store i32 %237, i32 addrspace(1)* %240, align 4, !tbaa !16
  %241 = or i32 %184, 7
  %242 = add i32 %241, %157
  %243 = zext i32 %242 to i64
  %244 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %243
  %245 = load i32, i32 addrspace(1)* %244, align 4, !tbaa !16
  %246 = add i32 %241, %158
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %247
  store i32 %245, i32 addrspace(1)* %248, align 4, !tbaa !16
  %249 = add nuw nsw i32 %184, 8
  %250 = add i32 %185, 8
  %251 = icmp eq i32 %250, %36
  br i1 %251, label %159, label %183, !llvm.loop !25

252:                                              ; preds = %180, %268
  %253 = phi i32 [ %50, %180 ], [ %273, %268 ]
  %254 = add i32 %253, %182
  %255 = zext i32 %254 to i64
  %256 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %255
  %257 = load i32, i32 addrspace(1)* %256, align 4, !tbaa !16
  br label %260

258:                                              ; preds = %268, %174
  %259 = icmp slt i32 %54, 10
  br i1 %259, label %275, label %293

260:                                              ; preds = %260, %252
  %261 = phi i32 [ %267, %260 ], [ 0, %252 ]
  %262 = add i32 %261, %181
  %263 = zext i32 %262 to i64
  %264 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %263
  %265 = load i32, i32 addrspace(1)* %264, align 4, !tbaa !16
  %266 = icmp eq i32 %265, %257
  %267 = add nuw nsw i32 %261, 1
  br i1 %266, label %268, label %260, !llvm.loop !26

268:                                              ; preds = %260
  %269 = add i32 %253, %181
  %270 = zext i32 %269 to i64
  %271 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %270
  %272 = load i32, i32 addrspace(1)* %271, align 4, !tbaa !16
  store i32 %257, i32 addrspace(1)* %271, align 4, !tbaa !16
  store i32 %272, i32 addrspace(1)* %264, align 4, !tbaa !16
  %273 = add nsw i32 %253, 1
  %274 = icmp slt i32 %273, %178
  br i1 %274, label %252, label %258, !llvm.loop !27

275:                                              ; preds = %258
  %276 = load i32, i32 addrspace(1)* %175, align 4, !tbaa !16
  %277 = tail call i32 @llvm.smax.i32(i32 %276, i32 0)
  %278 = tail call i32 @llvm.smin.i32(i32 %277, i32 19)
  %279 = mul i32 %40, %1
  br label %280

280:                                              ; preds = %280, %275
  %281 = phi i32 [ 0, %275 ], [ %287, %280 ]
  %282 = add i32 %281, %279
  %283 = zext i32 %282 to i64
  %284 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %283
  %285 = load i32, i32 addrspace(1)* %284, align 4, !tbaa !16
  %286 = icmp eq i32 %285, %278
  %287 = add nuw nsw i32 %281, 1
  br i1 %286, label %288, label %280, !llvm.loop !28

288:                                              ; preds = %280
  %289 = add i32 %59, %279
  %290 = zext i32 %289 to i64
  %291 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %290
  %292 = load i32, i32 addrspace(1)* %291, align 4, !tbaa !16
  store i32 %278, i32 addrspace(1)* %291, align 4, !tbaa !16
  store i32 %292, i32 addrspace(1)* %284, align 4, !tbaa !16
  br label %293

293:                                              ; preds = %288, %258
  %294 = add nsw i32 %40, %25
  %295 = icmp ult i32 %294, %0
  br i1 %295, label %39, label %38, !llvm.loop !29
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !21}
!27 = distinct !{!27, !21}
!28 = distinct !{!28, !21}
!29 = distinct !{!29, !21}
