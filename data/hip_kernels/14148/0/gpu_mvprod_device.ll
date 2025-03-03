; ModuleID = '../data/hip_kernels/14148/0/main.cu'
source_filename = "../data/hip_kernels/14148/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10gpu_mvprodPdS_diiiS_S_PjiS_S0_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, double %2, i32 %3, i32 %4, i32 %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 %9, double addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture readonly %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !7
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = mul i32 %24, %20
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = mul i32 %26, %20
  %28 = udiv i32 %23, %20
  %29 = mul i32 %28, %20
  %30 = icmp ugt i32 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %27, %32
  %34 = add i32 %33, %25
  %35 = add i32 %34, %15
  %36 = icmp slt i32 %35, %5
  br i1 %36, label %37, label %446

37:                                               ; preds = %14
  %38 = sext i32 %35 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %6, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !16, !amdgpu.noclobber !6
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !16, !amdgpu.noclobber !6
  %43 = fmul contract double %40, %42
  %44 = freeze i32 %35
  %45 = freeze i32 %4
  %46 = sdiv i32 %44, %45
  %47 = mul i32 %46, %45
  %48 = sub i32 %44, %47
  %49 = mul nsw i32 %13, %12
  %50 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %49
  %51 = bitcast double addrspace(3)* %50 to i32 addrspace(3)*
  %52 = udiv i32 %34, %4
  %53 = icmp ult i32 %15, %13
  br i1 %53, label %54, label %137

54:                                               ; preds = %37
  %55 = add i32 %52, %15
  %56 = icmp ult i32 %55, %3
  %57 = icmp sgt i32 %12, 0
  %58 = select i1 %56, i1 %57, i1 false
  br i1 %58, label %59, label %137

59:                                               ; preds = %54
  %60 = and i32 %12, 3
  %61 = icmp ult i32 %12, 4
  br i1 %61, label %117, label %62

62:                                               ; preds = %59
  %63 = and i32 %12, -4
  br label %64

64:                                               ; preds = %64, %62
  %65 = phi i32 [ 0, %62 ], [ %114, %64 ]
  %66 = phi i32 [ 0, %62 ], [ %115, %64 ]
  %67 = mul nsw i32 %65, %3
  %68 = add i32 %67, %55
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %10, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !16, !amdgpu.noclobber !6
  %72 = mul nsw i32 %65, %13
  %73 = add i32 %72, %15
  %74 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %73
  store double %71, double addrspace(3)* %74, align 8, !tbaa !16
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %69
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !20, !amdgpu.noclobber !6
  %77 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %73
  store i32 %76, i32 addrspace(3)* %77, align 4, !tbaa !20
  %78 = or i32 %65, 1
  %79 = mul nsw i32 %78, %3
  %80 = add i32 %79, %55
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %10, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !16, !amdgpu.noclobber !6
  %84 = mul nsw i32 %78, %13
  %85 = add i32 %84, %15
  %86 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %85
  store double %83, double addrspace(3)* %86, align 8, !tbaa !16
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %81
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !20, !amdgpu.noclobber !6
  %89 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %85
  store i32 %88, i32 addrspace(3)* %89, align 4, !tbaa !20
  %90 = or i32 %65, 2
  %91 = mul nsw i32 %90, %3
  %92 = add i32 %91, %55
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %10, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !16, !amdgpu.noclobber !6
  %96 = mul nsw i32 %90, %13
  %97 = add i32 %96, %15
  %98 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %97
  store double %95, double addrspace(3)* %98, align 8, !tbaa !16
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %93
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !20, !amdgpu.noclobber !6
  %101 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %97
  store i32 %100, i32 addrspace(3)* %101, align 4, !tbaa !20
  %102 = or i32 %65, 3
  %103 = mul nsw i32 %102, %3
  %104 = add i32 %103, %55
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %10, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !16, !amdgpu.noclobber !6
  %108 = mul nsw i32 %102, %13
  %109 = add i32 %108, %15
  %110 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %109
  store double %107, double addrspace(3)* %110, align 8, !tbaa !16
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %105
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !20, !amdgpu.noclobber !6
  %113 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %109
  store i32 %112, i32 addrspace(3)* %113, align 4, !tbaa !20
  %114 = add nuw nsw i32 %65, 4
  %115 = add i32 %66, 4
  %116 = icmp eq i32 %115, %63
  br i1 %116, label %117, label %64, !llvm.loop !22

117:                                              ; preds = %64, %59
  %118 = phi i32 [ 0, %59 ], [ %114, %64 ]
  %119 = icmp eq i32 %60, 0
  br i1 %119, label %137, label %120

120:                                              ; preds = %117, %120
  %121 = phi i32 [ %134, %120 ], [ %118, %117 ]
  %122 = phi i32 [ %135, %120 ], [ 0, %117 ]
  %123 = mul nsw i32 %121, %3
  %124 = add i32 %123, %55
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds double, double addrspace(1)* %10, i64 %125
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !16, !amdgpu.noclobber !6
  %128 = mul nsw i32 %121, %13
  %129 = add i32 %128, %15
  %130 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %129
  store double %127, double addrspace(3)* %130, align 8, !tbaa !16
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %125
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !20, !amdgpu.noclobber !6
  %133 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %129
  store i32 %132, i32 addrspace(3)* %133, align 4, !tbaa !20
  %134 = add nuw nsw i32 %121, 1
  %135 = add i32 %122, 1
  %136 = icmp eq i32 %135, %60
  br i1 %136, label %137, label %120, !llvm.loop !24

137:                                              ; preds = %117, %120, %54, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %138 = icmp sgt i32 %12, 0
  br i1 %138, label %139, label %170

139:                                              ; preds = %137
  %140 = sub nsw i32 %46, %52
  %141 = and i32 %12, 7
  %142 = icmp ult i32 %12, 8
  br i1 %142, label %145, label %143

143:                                              ; preds = %139
  %144 = and i32 %12, -8
  br label %179

145:                                              ; preds = %179, %139
  %146 = phi double [ undef, %139 ], [ %293, %179 ]
  %147 = phi i32 [ 0, %139 ], [ %294, %179 ]
  %148 = phi double [ %43, %139 ], [ %293, %179 ]
  %149 = icmp eq i32 %141, 0
  br i1 %149, label %170, label %150

150:                                              ; preds = %145, %150
  %151 = phi i32 [ %167, %150 ], [ %147, %145 ]
  %152 = phi double [ %166, %150 ], [ %148, %145 ]
  %153 = phi i32 [ %168, %150 ], [ 0, %145 ]
  %154 = mul nsw i32 %151, %13
  %155 = add nsw i32 %154, %140
  %156 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %155
  %157 = load double, double addrspace(3)* %156, align 8, !tbaa !16
  %158 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %155
  %159 = load i32, i32 addrspace(3)* %158, align 4, !tbaa !20
  %160 = mul i32 %159, %4
  %161 = add i32 %160, %48
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds double, double addrspace(1)* %0, i64 %162
  %164 = load double, double addrspace(1)* %163, align 8, !tbaa !16, !amdgpu.noclobber !6
  %165 = fmul contract double %157, %164
  %166 = fadd contract double %152, %165
  %167 = add nuw nsw i32 %151, 1
  %168 = add i32 %153, 1
  %169 = icmp eq i32 %168, %141
  br i1 %169, label %170, label %150, !llvm.loop !26

170:                                              ; preds = %145, %150, %137
  %171 = phi double [ %43, %137 ], [ %146, %145 ], [ %166, %150 ]
  %172 = icmp sgt i32 %9, 0
  br i1 %172, label %173, label %322

173:                                              ; preds = %170
  %174 = mul nsw i32 %46, %4
  %175 = and i32 %9, 7
  %176 = icmp ult i32 %9, 8
  br i1 %176, label %297, label %177

177:                                              ; preds = %173
  %178 = and i32 %9, -8
  br label %328

179:                                              ; preds = %179, %143
  %180 = phi i32 [ 0, %143 ], [ %294, %179 ]
  %181 = phi double [ %43, %143 ], [ %293, %179 ]
  %182 = phi i32 [ 0, %143 ], [ %295, %179 ]
  %183 = mul nsw i32 %180, %13
  %184 = add nsw i32 %183, %140
  %185 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %184
  %186 = load double, double addrspace(3)* %185, align 8, !tbaa !16
  %187 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %184
  %188 = load i32, i32 addrspace(3)* %187, align 4, !tbaa !20
  %189 = mul i32 %188, %4
  %190 = add i32 %189, %48
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds double, double addrspace(1)* %0, i64 %191
  %193 = load double, double addrspace(1)* %192, align 8, !tbaa !16, !amdgpu.noclobber !6
  %194 = fmul contract double %186, %193
  %195 = fadd contract double %181, %194
  %196 = or i32 %180, 1
  %197 = mul nsw i32 %196, %13
  %198 = add nsw i32 %197, %140
  %199 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %198
  %200 = load double, double addrspace(3)* %199, align 8, !tbaa !16
  %201 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %198
  %202 = load i32, i32 addrspace(3)* %201, align 4, !tbaa !20
  %203 = mul i32 %202, %4
  %204 = add i32 %203, %48
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds double, double addrspace(1)* %0, i64 %205
  %207 = load double, double addrspace(1)* %206, align 8, !tbaa !16, !amdgpu.noclobber !6
  %208 = fmul contract double %200, %207
  %209 = fadd contract double %195, %208
  %210 = or i32 %180, 2
  %211 = mul nsw i32 %210, %13
  %212 = add nsw i32 %211, %140
  %213 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %212
  %214 = load double, double addrspace(3)* %213, align 8, !tbaa !16
  %215 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %212
  %216 = load i32, i32 addrspace(3)* %215, align 4, !tbaa !20
  %217 = mul i32 %216, %4
  %218 = add i32 %217, %48
  %219 = zext i32 %218 to i64
  %220 = getelementptr inbounds double, double addrspace(1)* %0, i64 %219
  %221 = load double, double addrspace(1)* %220, align 8, !tbaa !16, !amdgpu.noclobber !6
  %222 = fmul contract double %214, %221
  %223 = fadd contract double %209, %222
  %224 = or i32 %180, 3
  %225 = mul nsw i32 %224, %13
  %226 = add nsw i32 %225, %140
  %227 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %226
  %228 = load double, double addrspace(3)* %227, align 8, !tbaa !16
  %229 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %226
  %230 = load i32, i32 addrspace(3)* %229, align 4, !tbaa !20
  %231 = mul i32 %230, %4
  %232 = add i32 %231, %48
  %233 = zext i32 %232 to i64
  %234 = getelementptr inbounds double, double addrspace(1)* %0, i64 %233
  %235 = load double, double addrspace(1)* %234, align 8, !tbaa !16, !amdgpu.noclobber !6
  %236 = fmul contract double %228, %235
  %237 = fadd contract double %223, %236
  %238 = or i32 %180, 4
  %239 = mul nsw i32 %238, %13
  %240 = add nsw i32 %239, %140
  %241 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %240
  %242 = load double, double addrspace(3)* %241, align 8, !tbaa !16
  %243 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %240
  %244 = load i32, i32 addrspace(3)* %243, align 4, !tbaa !20
  %245 = mul i32 %244, %4
  %246 = add i32 %245, %48
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds double, double addrspace(1)* %0, i64 %247
  %249 = load double, double addrspace(1)* %248, align 8, !tbaa !16, !amdgpu.noclobber !6
  %250 = fmul contract double %242, %249
  %251 = fadd contract double %237, %250
  %252 = or i32 %180, 5
  %253 = mul nsw i32 %252, %13
  %254 = add nsw i32 %253, %140
  %255 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %254
  %256 = load double, double addrspace(3)* %255, align 8, !tbaa !16
  %257 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %254
  %258 = load i32, i32 addrspace(3)* %257, align 4, !tbaa !20
  %259 = mul i32 %258, %4
  %260 = add i32 %259, %48
  %261 = zext i32 %260 to i64
  %262 = getelementptr inbounds double, double addrspace(1)* %0, i64 %261
  %263 = load double, double addrspace(1)* %262, align 8, !tbaa !16, !amdgpu.noclobber !6
  %264 = fmul contract double %256, %263
  %265 = fadd contract double %251, %264
  %266 = or i32 %180, 6
  %267 = mul nsw i32 %266, %13
  %268 = add nsw i32 %267, %140
  %269 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %268
  %270 = load double, double addrspace(3)* %269, align 8, !tbaa !16
  %271 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %268
  %272 = load i32, i32 addrspace(3)* %271, align 4, !tbaa !20
  %273 = mul i32 %272, %4
  %274 = add i32 %273, %48
  %275 = zext i32 %274 to i64
  %276 = getelementptr inbounds double, double addrspace(1)* %0, i64 %275
  %277 = load double, double addrspace(1)* %276, align 8, !tbaa !16, !amdgpu.noclobber !6
  %278 = fmul contract double %270, %277
  %279 = fadd contract double %265, %278
  %280 = or i32 %180, 7
  %281 = mul nsw i32 %280, %13
  %282 = add nsw i32 %281, %140
  %283 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared, i32 0, i32 %282
  %284 = load double, double addrspace(3)* %283, align 8, !tbaa !16
  %285 = getelementptr inbounds i32, i32 addrspace(3)* %51, i32 %282
  %286 = load i32, i32 addrspace(3)* %285, align 4, !tbaa !20
  %287 = mul i32 %286, %4
  %288 = add i32 %287, %48
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds double, double addrspace(1)* %0, i64 %289
  %291 = load double, double addrspace(1)* %290, align 8, !tbaa !16, !amdgpu.noclobber !6
  %292 = fmul contract double %284, %291
  %293 = fadd contract double %279, %292
  %294 = add nuw nsw i32 %180, 8
  %295 = add i32 %182, 8
  %296 = icmp eq i32 %295, %144
  br i1 %296, label %145, label %179, !llvm.loop !27

297:                                              ; preds = %328, %173
  %298 = phi double [ undef, %173 ], [ %442, %328 ]
  %299 = phi i32 [ 0, %173 ], [ %443, %328 ]
  %300 = phi double [ %171, %173 ], [ %442, %328 ]
  %301 = icmp eq i32 %175, 0
  br i1 %301, label %322, label %302

302:                                              ; preds = %297, %302
  %303 = phi i32 [ %319, %302 ], [ %299, %297 ]
  %304 = phi double [ %318, %302 ], [ %300, %297 ]
  %305 = phi i32 [ %320, %302 ], [ 0, %297 ]
  %306 = mul nsw i32 %303, %4
  %307 = add nsw i32 %306, %48
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds double, double addrspace(1)* %7, i64 %308
  %310 = load double, double addrspace(1)* %309, align 8, !tbaa !16, !amdgpu.noclobber !6
  %311 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %308
  %312 = load i32, i32 addrspace(1)* %311, align 4, !tbaa !20, !amdgpu.noclobber !6
  %313 = add i32 %312, %174
  %314 = zext i32 %313 to i64
  %315 = getelementptr inbounds double, double addrspace(1)* %0, i64 %314
  %316 = load double, double addrspace(1)* %315, align 8, !tbaa !16, !amdgpu.noclobber !6
  %317 = fmul contract double %310, %316
  %318 = fadd contract double %304, %317
  %319 = add nuw nsw i32 %303, 1
  %320 = add i32 %305, 1
  %321 = icmp eq i32 %320, %175
  br i1 %321, label %322, label %302, !llvm.loop !28

322:                                              ; preds = %297, %302, %170
  %323 = phi double [ %171, %170 ], [ %298, %297 ], [ %318, %302 ]
  %324 = getelementptr inbounds double, double addrspace(1)* %1, i64 %38
  %325 = load double, double addrspace(1)* %324, align 8, !tbaa !16, !amdgpu.noclobber !6
  %326 = fmul contract double %325, %2
  %327 = fadd contract double %323, %326
  store double %327, double addrspace(1)* %324, align 8, !tbaa !16
  br label %446

328:                                              ; preds = %328, %177
  %329 = phi i32 [ 0, %177 ], [ %443, %328 ]
  %330 = phi double [ %171, %177 ], [ %442, %328 ]
  %331 = phi i32 [ 0, %177 ], [ %444, %328 ]
  %332 = mul nsw i32 %329, %4
  %333 = add nsw i32 %332, %48
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds double, double addrspace(1)* %7, i64 %334
  %336 = load double, double addrspace(1)* %335, align 8, !tbaa !16, !amdgpu.noclobber !6
  %337 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %334
  %338 = load i32, i32 addrspace(1)* %337, align 4, !tbaa !20, !amdgpu.noclobber !6
  %339 = add i32 %338, %174
  %340 = zext i32 %339 to i64
  %341 = getelementptr inbounds double, double addrspace(1)* %0, i64 %340
  %342 = load double, double addrspace(1)* %341, align 8, !tbaa !16, !amdgpu.noclobber !6
  %343 = fmul contract double %336, %342
  %344 = fadd contract double %330, %343
  %345 = or i32 %329, 1
  %346 = mul nsw i32 %345, %4
  %347 = add nsw i32 %346, %48
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds double, double addrspace(1)* %7, i64 %348
  %350 = load double, double addrspace(1)* %349, align 8, !tbaa !16, !amdgpu.noclobber !6
  %351 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %348
  %352 = load i32, i32 addrspace(1)* %351, align 4, !tbaa !20, !amdgpu.noclobber !6
  %353 = add i32 %352, %174
  %354 = zext i32 %353 to i64
  %355 = getelementptr inbounds double, double addrspace(1)* %0, i64 %354
  %356 = load double, double addrspace(1)* %355, align 8, !tbaa !16, !amdgpu.noclobber !6
  %357 = fmul contract double %350, %356
  %358 = fadd contract double %344, %357
  %359 = or i32 %329, 2
  %360 = mul nsw i32 %359, %4
  %361 = add nsw i32 %360, %48
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds double, double addrspace(1)* %7, i64 %362
  %364 = load double, double addrspace(1)* %363, align 8, !tbaa !16, !amdgpu.noclobber !6
  %365 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %362
  %366 = load i32, i32 addrspace(1)* %365, align 4, !tbaa !20, !amdgpu.noclobber !6
  %367 = add i32 %366, %174
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds double, double addrspace(1)* %0, i64 %368
  %370 = load double, double addrspace(1)* %369, align 8, !tbaa !16, !amdgpu.noclobber !6
  %371 = fmul contract double %364, %370
  %372 = fadd contract double %358, %371
  %373 = or i32 %329, 3
  %374 = mul nsw i32 %373, %4
  %375 = add nsw i32 %374, %48
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds double, double addrspace(1)* %7, i64 %376
  %378 = load double, double addrspace(1)* %377, align 8, !tbaa !16, !amdgpu.noclobber !6
  %379 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %376
  %380 = load i32, i32 addrspace(1)* %379, align 4, !tbaa !20, !amdgpu.noclobber !6
  %381 = add i32 %380, %174
  %382 = zext i32 %381 to i64
  %383 = getelementptr inbounds double, double addrspace(1)* %0, i64 %382
  %384 = load double, double addrspace(1)* %383, align 8, !tbaa !16, !amdgpu.noclobber !6
  %385 = fmul contract double %378, %384
  %386 = fadd contract double %372, %385
  %387 = or i32 %329, 4
  %388 = mul nsw i32 %387, %4
  %389 = add nsw i32 %388, %48
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds double, double addrspace(1)* %7, i64 %390
  %392 = load double, double addrspace(1)* %391, align 8, !tbaa !16, !amdgpu.noclobber !6
  %393 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %390
  %394 = load i32, i32 addrspace(1)* %393, align 4, !tbaa !20, !amdgpu.noclobber !6
  %395 = add i32 %394, %174
  %396 = zext i32 %395 to i64
  %397 = getelementptr inbounds double, double addrspace(1)* %0, i64 %396
  %398 = load double, double addrspace(1)* %397, align 8, !tbaa !16, !amdgpu.noclobber !6
  %399 = fmul contract double %392, %398
  %400 = fadd contract double %386, %399
  %401 = or i32 %329, 5
  %402 = mul nsw i32 %401, %4
  %403 = add nsw i32 %402, %48
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds double, double addrspace(1)* %7, i64 %404
  %406 = load double, double addrspace(1)* %405, align 8, !tbaa !16, !amdgpu.noclobber !6
  %407 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %404
  %408 = load i32, i32 addrspace(1)* %407, align 4, !tbaa !20, !amdgpu.noclobber !6
  %409 = add i32 %408, %174
  %410 = zext i32 %409 to i64
  %411 = getelementptr inbounds double, double addrspace(1)* %0, i64 %410
  %412 = load double, double addrspace(1)* %411, align 8, !tbaa !16, !amdgpu.noclobber !6
  %413 = fmul contract double %406, %412
  %414 = fadd contract double %400, %413
  %415 = or i32 %329, 6
  %416 = mul nsw i32 %415, %4
  %417 = add nsw i32 %416, %48
  %418 = sext i32 %417 to i64
  %419 = getelementptr inbounds double, double addrspace(1)* %7, i64 %418
  %420 = load double, double addrspace(1)* %419, align 8, !tbaa !16, !amdgpu.noclobber !6
  %421 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %418
  %422 = load i32, i32 addrspace(1)* %421, align 4, !tbaa !20, !amdgpu.noclobber !6
  %423 = add i32 %422, %174
  %424 = zext i32 %423 to i64
  %425 = getelementptr inbounds double, double addrspace(1)* %0, i64 %424
  %426 = load double, double addrspace(1)* %425, align 8, !tbaa !16, !amdgpu.noclobber !6
  %427 = fmul contract double %420, %426
  %428 = fadd contract double %414, %427
  %429 = or i32 %329, 7
  %430 = mul nsw i32 %429, %4
  %431 = add nsw i32 %430, %48
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds double, double addrspace(1)* %7, i64 %432
  %434 = load double, double addrspace(1)* %433, align 8, !tbaa !16, !amdgpu.noclobber !6
  %435 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %432
  %436 = load i32, i32 addrspace(1)* %435, align 4, !tbaa !20, !amdgpu.noclobber !6
  %437 = add i32 %436, %174
  %438 = zext i32 %437 to i64
  %439 = getelementptr inbounds double, double addrspace(1)* %0, i64 %438
  %440 = load double, double addrspace(1)* %439, align 8, !tbaa !16, !amdgpu.noclobber !6
  %441 = fmul contract double %434, %440
  %442 = fadd contract double %428, %441
  %443 = add nuw nsw i32 %329, 8
  %444 = add i32 %331, 8
  %445 = icmp eq i32 %444, %178
  br i1 %445, label %297, label %328, !llvm.loop !29

446:                                              ; preds = %322, %14
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
!26 = distinct !{!26, !25}
!27 = distinct !{!27, !23}
!28 = distinct !{!28, !25}
!29 = distinct !{!29, !23}
