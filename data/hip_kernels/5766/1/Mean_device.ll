; ModuleID = '../data/hip_kernels/5766/1/main.cu'
source_filename = "../data/hip_kernels/5766/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sDataSumGroupCount = external hidden addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4MeanPfjjPiS_jS0_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, i32 %5, i32 addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = shl i32 %2, 10
  %9 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %8
  %10 = add i32 %5, 1024
  %11 = mul i32 %10, %2
  %12 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %11
  %13 = getelementptr inbounds float, float addrspace(3)* %12, i32 1024
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %15, %20
  %22 = add i32 %21, %14
  %23 = icmp ult i32 %22, %1
  br i1 %23, label %24, label %402

24:                                               ; preds = %7
  %25 = icmp ult i32 %14, %5
  br i1 %25, label %26, label %106

26:                                               ; preds = %24
  %27 = icmp eq i32 %2, 0
  br i1 %27, label %48, label %28

28:                                               ; preds = %26
  %29 = mul i32 %14, %2
  %30 = and i32 %2, 7
  %31 = icmp ult i32 %2, 8
  br i1 %31, label %34, label %32

32:                                               ; preds = %28
  %33 = and i32 %2, -8
  br label %53

34:                                               ; preds = %53, %28
  %35 = phi i32 [ 0, %28 ], [ %103, %53 ]
  %36 = icmp eq i32 %30, 0
  br i1 %36, label %48, label %37

37:                                               ; preds = %34, %37
  %38 = phi i32 [ %45, %37 ], [ %35, %34 ]
  %39 = phi i32 [ %46, %37 ], [ 0, %34 ]
  %40 = add i32 %38, %29
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %4, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = getelementptr inbounds float, float addrspace(3)* %9, i32 %40
  store float %43, float addrspace(3)* %44, align 4, !tbaa !7
  %45 = add nuw nsw i32 %38, 1
  %46 = add i32 %39, 1
  %47 = icmp eq i32 %46, %30
  br i1 %47, label %48, label %37, !llvm.loop !11

48:                                               ; preds = %34, %37, %26
  %49 = zext i32 %14 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %49
  store i32 0, i32 addrspace(1)* %50, align 4, !tbaa !13
  %51 = getelementptr inbounds float, float addrspace(3)* %13, i32 %14
  %52 = bitcast float addrspace(3)* %51 to i32 addrspace(3)*
  store i32 0, i32 addrspace(3)* %52, align 4, !tbaa !13
  br label %106

53:                                               ; preds = %53, %32
  %54 = phi i32 [ 0, %32 ], [ %103, %53 ]
  %55 = phi i32 [ 0, %32 ], [ %104, %53 ]
  %56 = add i32 %54, %29
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = getelementptr inbounds float, float addrspace(3)* %9, i32 %56
  store float %59, float addrspace(3)* %60, align 4, !tbaa !7
  %61 = or i32 %54, 1
  %62 = add i32 %61, %29
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = getelementptr inbounds float, float addrspace(3)* %9, i32 %62
  store float %65, float addrspace(3)* %66, align 4, !tbaa !7
  %67 = or i32 %54, 2
  %68 = add i32 %67, %29
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %4, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  %72 = getelementptr inbounds float, float addrspace(3)* %9, i32 %68
  store float %71, float addrspace(3)* %72, align 4, !tbaa !7
  %73 = or i32 %54, 3
  %74 = add i32 %73, %29
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %4, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !6
  %78 = getelementptr inbounds float, float addrspace(3)* %9, i32 %74
  store float %77, float addrspace(3)* %78, align 4, !tbaa !7
  %79 = or i32 %54, 4
  %80 = add i32 %79, %29
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %4, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !6
  %84 = getelementptr inbounds float, float addrspace(3)* %9, i32 %80
  store float %83, float addrspace(3)* %84, align 4, !tbaa !7
  %85 = or i32 %54, 5
  %86 = add i32 %85, %29
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %4, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !6
  %90 = getelementptr inbounds float, float addrspace(3)* %9, i32 %86
  store float %89, float addrspace(3)* %90, align 4, !tbaa !7
  %91 = or i32 %54, 6
  %92 = add i32 %91, %29
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %4, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !6
  %96 = getelementptr inbounds float, float addrspace(3)* %9, i32 %92
  store float %95, float addrspace(3)* %96, align 4, !tbaa !7
  %97 = or i32 %54, 7
  %98 = add i32 %97, %29
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %4, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !6
  %102 = getelementptr inbounds float, float addrspace(3)* %9, i32 %98
  store float %101, float addrspace(3)* %102, align 4, !tbaa !7
  %103 = add nuw nsw i32 %54, 8
  %104 = add i32 %55, 8
  %105 = icmp eq i32 %104, %33
  br i1 %105, label %34, label %53, !llvm.loop !15

106:                                              ; preds = %48, %24
  %107 = mul i32 %14, %2
  %108 = icmp eq i32 %2, 0
  br i1 %108, label %136, label %109

109:                                              ; preds = %106
  %110 = zext i32 %2 to i64
  %111 = shl nuw nsw i64 %110, 2
  %112 = mul i32 %22, %2
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = bitcast float addrspace(1)* %114 to i8 addrspace(1)*
  %116 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %107
  %117 = bitcast float addrspace(3)* %116 to i8 addrspace(3)*
  br label %118

118:                                              ; preds = %109, %118
  %119 = phi i8 addrspace(1)* [ %133, %118 ], [ %115, %109 ]
  %120 = phi i8 addrspace(3)* [ %134, %118 ], [ %117, %109 ]
  %121 = phi i64 [ %132, %118 ], [ %111, %109 ]
  %122 = load i8, i8 addrspace(1)* %119, align 1, !tbaa !17
  store i8 %122, i8 addrspace(3)* %120, align 1, !tbaa !17
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %119, i64 1
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa !17
  %125 = getelementptr inbounds i8, i8 addrspace(3)* %120, i32 1
  store i8 %124, i8 addrspace(3)* %125, align 1, !tbaa !17
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %119, i64 2
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !17
  %128 = getelementptr inbounds i8, i8 addrspace(3)* %120, i32 2
  store i8 %127, i8 addrspace(3)* %128, align 1, !tbaa !17
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %119, i64 3
  %130 = load i8, i8 addrspace(1)* %129, align 1, !tbaa !17
  %131 = getelementptr inbounds i8, i8 addrspace(3)* %120, i32 3
  store i8 %130, i8 addrspace(3)* %131, align 1, !tbaa !17
  %132 = add nsw i64 %121, -4
  %133 = getelementptr inbounds i8, i8 addrspace(1)* %119, i64 4
  %134 = getelementptr inbounds i8, i8 addrspace(3)* %120, i32 4
  %135 = icmp eq i64 %132, 0
  br i1 %135, label %136, label %118, !llvm.loop !18

136:                                              ; preds = %118, %106
  %137 = sext i32 %22 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !13
  %140 = getelementptr inbounds float, float addrspace(3)* %12, i32 %14
  %141 = bitcast float addrspace(3)* %140 to i32 addrspace(3)*
  store i32 %139, i32 addrspace(3)* %141, align 4, !tbaa !13
  %142 = mul i32 %5, %2
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %157, label %144

144:                                              ; preds = %136
  %145 = zext i32 %142 to i64
  %146 = shl nuw nsw i64 %145, 2
  %147 = bitcast float addrspace(1)* %4 to i8 addrspace(1)*
  br label %148

148:                                              ; preds = %144, %148
  %149 = phi i8 addrspace(1)* [ %155, %148 ], [ %147, %144 ]
  %150 = phi i64 [ %154, %148 ], [ %146, %144 ]
  store i8 0, i8 addrspace(1)* %149, align 1, !tbaa !17
  %151 = getelementptr inbounds i8, i8 addrspace(1)* %149, i64 1
  store i8 0, i8 addrspace(1)* %151, align 1, !tbaa !17
  %152 = getelementptr inbounds i8, i8 addrspace(1)* %149, i64 2
  store i8 0, i8 addrspace(1)* %152, align 1, !tbaa !17
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %149, i64 3
  store i8 0, i8 addrspace(1)* %153, align 1, !tbaa !17
  %154 = add i64 %150, -4
  %155 = getelementptr inbounds i8, i8 addrspace(1)* %149, i64 4
  %156 = icmp eq i64 %154, 0
  br i1 %156, label %157, label %148, !llvm.loop !19

157:                                              ; preds = %148, %136
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %158 = load i32, i32 addrspace(3)* %141, align 4, !tbaa !13
  br i1 %108, label %180, label %159

159:                                              ; preds = %157
  %160 = mul i32 %158, %2
  %161 = and i32 %2, 7
  %162 = icmp ult i32 %2, 8
  br i1 %162, label %165, label %163

163:                                              ; preds = %159
  %164 = and i32 %2, -8
  br label %191

165:                                              ; preds = %191, %159
  %166 = phi i32 [ 0, %159 ], [ %249, %191 ]
  %167 = icmp eq i32 %161, 0
  br i1 %167, label %180, label %168

168:                                              ; preds = %165, %168
  %169 = phi i32 [ %177, %168 ], [ %166, %165 ]
  %170 = phi i32 [ %178, %168 ], [ 0, %165 ]
  %171 = add i32 %169, %160
  %172 = getelementptr inbounds float, float addrspace(3)* %9, i32 %171
  %173 = add i32 %169, %107
  %174 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %173
  %175 = load float, float addrspace(3)* %174, align 4, !tbaa !7
  %176 = atomicrmw fadd float addrspace(3)* %172, float %175 syncscope("agent-one-as") monotonic, align 4
  %177 = add nuw nsw i32 %169, 1
  %178 = add i32 %170, 1
  %179 = icmp eq i32 %178, %161
  br i1 %179, label %180, label %168, !llvm.loop !20

180:                                              ; preds = %165, %168, %157
  %181 = getelementptr inbounds float, float addrspace(3)* %13, i32 %158
  %182 = bitcast float addrspace(3)* %181 to i32 addrspace(3)*
  %183 = atomicrmw add i32 addrspace(3)* %182, i32 1 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %184 = icmp eq i32 %14, 0
  br i1 %184, label %185, label %402

185:                                              ; preds = %180
  br i1 %143, label %266, label %186

186:                                              ; preds = %185
  %187 = and i32 %142, 7
  %188 = icmp ult i32 %142, 8
  br i1 %188, label %252, label %189

189:                                              ; preds = %186
  %190 = and i32 %142, -8
  br label %273

191:                                              ; preds = %191, %163
  %192 = phi i32 [ 0, %163 ], [ %249, %191 ]
  %193 = phi i32 [ 0, %163 ], [ %250, %191 ]
  %194 = add i32 %192, %160
  %195 = getelementptr inbounds float, float addrspace(3)* %9, i32 %194
  %196 = add i32 %192, %107
  %197 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %196
  %198 = load float, float addrspace(3)* %197, align 4, !tbaa !7
  %199 = atomicrmw fadd float addrspace(3)* %195, float %198 syncscope("agent-one-as") monotonic, align 4
  %200 = or i32 %192, 1
  %201 = add i32 %200, %160
  %202 = getelementptr inbounds float, float addrspace(3)* %9, i32 %201
  %203 = add i32 %200, %107
  %204 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %203
  %205 = load float, float addrspace(3)* %204, align 4, !tbaa !7
  %206 = atomicrmw fadd float addrspace(3)* %202, float %205 syncscope("agent-one-as") monotonic, align 4
  %207 = or i32 %192, 2
  %208 = add i32 %207, %160
  %209 = getelementptr inbounds float, float addrspace(3)* %9, i32 %208
  %210 = add i32 %207, %107
  %211 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %210
  %212 = load float, float addrspace(3)* %211, align 4, !tbaa !7
  %213 = atomicrmw fadd float addrspace(3)* %209, float %212 syncscope("agent-one-as") monotonic, align 4
  %214 = or i32 %192, 3
  %215 = add i32 %214, %160
  %216 = getelementptr inbounds float, float addrspace(3)* %9, i32 %215
  %217 = add i32 %214, %107
  %218 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %217
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !7
  %220 = atomicrmw fadd float addrspace(3)* %216, float %219 syncscope("agent-one-as") monotonic, align 4
  %221 = or i32 %192, 4
  %222 = add i32 %221, %160
  %223 = getelementptr inbounds float, float addrspace(3)* %9, i32 %222
  %224 = add i32 %221, %107
  %225 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %224
  %226 = load float, float addrspace(3)* %225, align 4, !tbaa !7
  %227 = atomicrmw fadd float addrspace(3)* %223, float %226 syncscope("agent-one-as") monotonic, align 4
  %228 = or i32 %192, 5
  %229 = add i32 %228, %160
  %230 = getelementptr inbounds float, float addrspace(3)* %9, i32 %229
  %231 = add i32 %228, %107
  %232 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %231
  %233 = load float, float addrspace(3)* %232, align 4, !tbaa !7
  %234 = atomicrmw fadd float addrspace(3)* %230, float %233 syncscope("agent-one-as") monotonic, align 4
  %235 = or i32 %192, 6
  %236 = add i32 %235, %160
  %237 = getelementptr inbounds float, float addrspace(3)* %9, i32 %236
  %238 = add i32 %235, %107
  %239 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %238
  %240 = load float, float addrspace(3)* %239, align 4, !tbaa !7
  %241 = atomicrmw fadd float addrspace(3)* %237, float %240 syncscope("agent-one-as") monotonic, align 4
  %242 = or i32 %192, 7
  %243 = add i32 %242, %160
  %244 = getelementptr inbounds float, float addrspace(3)* %9, i32 %243
  %245 = add i32 %242, %107
  %246 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sDataSumGroupCount, i32 0, i32 %245
  %247 = load float, float addrspace(3)* %246, align 4, !tbaa !7
  %248 = atomicrmw fadd float addrspace(3)* %244, float %247 syncscope("agent-one-as") monotonic, align 4
  %249 = add nuw nsw i32 %192, 8
  %250 = add i32 %193, 8
  %251 = icmp eq i32 %250, %164
  br i1 %251, label %165, label %191, !llvm.loop !21

252:                                              ; preds = %273, %186
  %253 = phi i32 [ 0, %186 ], [ %323, %273 ]
  %254 = icmp eq i32 %187, 0
  br i1 %254, label %266, label %255

255:                                              ; preds = %252, %255
  %256 = phi i32 [ %263, %255 ], [ %253, %252 ]
  %257 = phi i32 [ %264, %255 ], [ 0, %252 ]
  %258 = zext i32 %256 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %4, i64 %258
  %260 = getelementptr inbounds float, float addrspace(3)* %9, i32 %256
  %261 = load float, float addrspace(3)* %260, align 4, !tbaa !7
  %262 = atomicrmw fadd float addrspace(1)* %259, float %261 syncscope("agent-one-as") monotonic, align 4
  %263 = add nuw nsw i32 %256, 1
  %264 = add i32 %257, 1
  %265 = icmp eq i32 %264, %187
  br i1 %265, label %266, label %255, !llvm.loop !22

266:                                              ; preds = %252, %255, %185
  %267 = icmp eq i32 %5, 0
  br i1 %267, label %402, label %268

268:                                              ; preds = %266
  %269 = and i32 %5, 7
  %270 = icmp ult i32 %5, 8
  br i1 %270, label %387, label %271

271:                                              ; preds = %268
  %272 = and i32 %5, -8
  br label %326

273:                                              ; preds = %273, %189
  %274 = phi i32 [ 0, %189 ], [ %323, %273 ]
  %275 = phi i32 [ 0, %189 ], [ %324, %273 ]
  %276 = zext i32 %274 to i64
  %277 = getelementptr inbounds float, float addrspace(1)* %4, i64 %276
  %278 = getelementptr inbounds float, float addrspace(3)* %9, i32 %274
  %279 = load float, float addrspace(3)* %278, align 4, !tbaa !7
  %280 = atomicrmw fadd float addrspace(1)* %277, float %279 syncscope("agent-one-as") monotonic, align 4
  %281 = or i32 %274, 1
  %282 = zext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %4, i64 %282
  %284 = getelementptr inbounds float, float addrspace(3)* %9, i32 %281
  %285 = load float, float addrspace(3)* %284, align 4, !tbaa !7
  %286 = atomicrmw fadd float addrspace(1)* %283, float %285 syncscope("agent-one-as") monotonic, align 4
  %287 = or i32 %274, 2
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds float, float addrspace(1)* %4, i64 %288
  %290 = getelementptr inbounds float, float addrspace(3)* %9, i32 %287
  %291 = load float, float addrspace(3)* %290, align 4, !tbaa !7
  %292 = atomicrmw fadd float addrspace(1)* %289, float %291 syncscope("agent-one-as") monotonic, align 4
  %293 = or i32 %274, 3
  %294 = zext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %4, i64 %294
  %296 = getelementptr inbounds float, float addrspace(3)* %9, i32 %293
  %297 = load float, float addrspace(3)* %296, align 4, !tbaa !7
  %298 = atomicrmw fadd float addrspace(1)* %295, float %297 syncscope("agent-one-as") monotonic, align 4
  %299 = or i32 %274, 4
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds float, float addrspace(1)* %4, i64 %300
  %302 = getelementptr inbounds float, float addrspace(3)* %9, i32 %299
  %303 = load float, float addrspace(3)* %302, align 4, !tbaa !7
  %304 = atomicrmw fadd float addrspace(1)* %301, float %303 syncscope("agent-one-as") monotonic, align 4
  %305 = or i32 %274, 5
  %306 = zext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %4, i64 %306
  %308 = getelementptr inbounds float, float addrspace(3)* %9, i32 %305
  %309 = load float, float addrspace(3)* %308, align 4, !tbaa !7
  %310 = atomicrmw fadd float addrspace(1)* %307, float %309 syncscope("agent-one-as") monotonic, align 4
  %311 = or i32 %274, 6
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds float, float addrspace(1)* %4, i64 %312
  %314 = getelementptr inbounds float, float addrspace(3)* %9, i32 %311
  %315 = load float, float addrspace(3)* %314, align 4, !tbaa !7
  %316 = atomicrmw fadd float addrspace(1)* %313, float %315 syncscope("agent-one-as") monotonic, align 4
  %317 = or i32 %274, 7
  %318 = zext i32 %317 to i64
  %319 = getelementptr inbounds float, float addrspace(1)* %4, i64 %318
  %320 = getelementptr inbounds float, float addrspace(3)* %9, i32 %317
  %321 = load float, float addrspace(3)* %320, align 4, !tbaa !7
  %322 = atomicrmw fadd float addrspace(1)* %319, float %321 syncscope("agent-one-as") monotonic, align 4
  %323 = add nuw nsw i32 %274, 8
  %324 = add i32 %275, 8
  %325 = icmp eq i32 %324, %190
  br i1 %325, label %252, label %273, !llvm.loop !23

326:                                              ; preds = %326, %271
  %327 = phi i32 [ 0, %271 ], [ %384, %326 ]
  %328 = phi i32 [ 0, %271 ], [ %385, %326 ]
  %329 = zext i32 %327 to i64
  %330 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %329
  %331 = getelementptr inbounds float, float addrspace(3)* %13, i32 %327
  %332 = bitcast float addrspace(3)* %331 to i32 addrspace(3)*
  %333 = load i32, i32 addrspace(3)* %332, align 4, !tbaa !13
  %334 = atomicrmw add i32 addrspace(1)* %330, i32 %333 syncscope("agent-one-as") monotonic, align 4
  %335 = or i32 %327, 1
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %336
  %338 = getelementptr inbounds float, float addrspace(3)* %13, i32 %335
  %339 = bitcast float addrspace(3)* %338 to i32 addrspace(3)*
  %340 = load i32, i32 addrspace(3)* %339, align 4, !tbaa !13
  %341 = atomicrmw add i32 addrspace(1)* %337, i32 %340 syncscope("agent-one-as") monotonic, align 4
  %342 = or i32 %327, 2
  %343 = zext i32 %342 to i64
  %344 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %343
  %345 = getelementptr inbounds float, float addrspace(3)* %13, i32 %342
  %346 = bitcast float addrspace(3)* %345 to i32 addrspace(3)*
  %347 = load i32, i32 addrspace(3)* %346, align 4, !tbaa !13
  %348 = atomicrmw add i32 addrspace(1)* %344, i32 %347 syncscope("agent-one-as") monotonic, align 4
  %349 = or i32 %327, 3
  %350 = zext i32 %349 to i64
  %351 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %350
  %352 = getelementptr inbounds float, float addrspace(3)* %13, i32 %349
  %353 = bitcast float addrspace(3)* %352 to i32 addrspace(3)*
  %354 = load i32, i32 addrspace(3)* %353, align 4, !tbaa !13
  %355 = atomicrmw add i32 addrspace(1)* %351, i32 %354 syncscope("agent-one-as") monotonic, align 4
  %356 = or i32 %327, 4
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %357
  %359 = getelementptr inbounds float, float addrspace(3)* %13, i32 %356
  %360 = bitcast float addrspace(3)* %359 to i32 addrspace(3)*
  %361 = load i32, i32 addrspace(3)* %360, align 4, !tbaa !13
  %362 = atomicrmw add i32 addrspace(1)* %358, i32 %361 syncscope("agent-one-as") monotonic, align 4
  %363 = or i32 %327, 5
  %364 = zext i32 %363 to i64
  %365 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %364
  %366 = getelementptr inbounds float, float addrspace(3)* %13, i32 %363
  %367 = bitcast float addrspace(3)* %366 to i32 addrspace(3)*
  %368 = load i32, i32 addrspace(3)* %367, align 4, !tbaa !13
  %369 = atomicrmw add i32 addrspace(1)* %365, i32 %368 syncscope("agent-one-as") monotonic, align 4
  %370 = or i32 %327, 6
  %371 = zext i32 %370 to i64
  %372 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %371
  %373 = getelementptr inbounds float, float addrspace(3)* %13, i32 %370
  %374 = bitcast float addrspace(3)* %373 to i32 addrspace(3)*
  %375 = load i32, i32 addrspace(3)* %374, align 4, !tbaa !13
  %376 = atomicrmw add i32 addrspace(1)* %372, i32 %375 syncscope("agent-one-as") monotonic, align 4
  %377 = or i32 %327, 7
  %378 = zext i32 %377 to i64
  %379 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %378
  %380 = getelementptr inbounds float, float addrspace(3)* %13, i32 %377
  %381 = bitcast float addrspace(3)* %380 to i32 addrspace(3)*
  %382 = load i32, i32 addrspace(3)* %381, align 4, !tbaa !13
  %383 = atomicrmw add i32 addrspace(1)* %379, i32 %382 syncscope("agent-one-as") monotonic, align 4
  %384 = add nuw nsw i32 %327, 8
  %385 = add i32 %328, 8
  %386 = icmp eq i32 %385, %272
  br i1 %386, label %387, label %326, !llvm.loop !24

387:                                              ; preds = %326, %268
  %388 = phi i32 [ 0, %268 ], [ %384, %326 ]
  %389 = icmp eq i32 %269, 0
  br i1 %389, label %402, label %390

390:                                              ; preds = %387, %390
  %391 = phi i32 [ %399, %390 ], [ %388, %387 ]
  %392 = phi i32 [ %400, %390 ], [ 0, %387 ]
  %393 = zext i32 %391 to i64
  %394 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %393
  %395 = getelementptr inbounds float, float addrspace(3)* %13, i32 %391
  %396 = bitcast float addrspace(3)* %395 to i32 addrspace(3)*
  %397 = load i32, i32 addrspace(3)* %396, align 4, !tbaa !13
  %398 = atomicrmw add i32 addrspace(1)* %394, i32 %397 syncscope("agent-one-as") monotonic, align 4
  %399 = add nuw nsw i32 %391, 1
  %400 = add i32 %392, 1
  %401 = icmp eq i32 %400, %269
  br i1 %401, label %402, label %390, !llvm.loop !25

402:                                              ; preds = %387, %390, %266, %180, %7
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !9, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!9, !9, i64 0}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !16}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !16}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !16}
!24 = distinct !{!24, !16}
!25 = distinct !{!25, !12}
