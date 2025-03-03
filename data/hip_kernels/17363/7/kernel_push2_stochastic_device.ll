; ModuleID = '../data/hip_kernels/17363/7/main.cu'
source_filename = "../data/hip_kernels/17363/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn = internal unnamed_addr addrspace(3) global [356 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture %6, i32 addrspace(1)* nocapture %7, i32 addrspace(1)* nocapture %8, i32 addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture %10, i32 addrspace(1)* nocapture readonly %11, i32 addrspace(1)* nocapture readnone %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, i32 addrspace(1)* nocapture readnone %19, i32 addrspace(1)* nocapture readonly %20, i32 addrspace(1)* nocapture readnone %21, i8 addrspace(1)* nocapture readnone %22, i32 addrspace(1)* nocapture readonly %23) local_unnamed_addr #0 {
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !4, !amdgpu.noclobber !8
  %27 = mul i32 %26, %25
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %29 = add i32 %27, %28
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !4, !amdgpu.noclobber !8
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %473

34:                                               ; preds = %24
  %35 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %36 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %37 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %38 = getelementptr i8, i8 addrspace(4)* %37, i64 4
  %39 = bitcast i8 addrspace(4)* %38 to i16 addrspace(4)*
  %40 = load i16, i16 addrspace(4)* %39, align 4, !range !10, !invariant.load !8
  %41 = zext i16 %40 to i32
  %42 = and i32 %28, 16777215
  %43 = mul i32 %42, %41
  %44 = add i32 %43, %35
  %45 = getelementptr i8, i8 addrspace(4)* %37, i64 6
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 2, !range !10, !invariant.load !8
  %48 = zext i16 %47 to i32
  %49 = and i32 %25, 16777215
  %50 = mul i32 %49, %48
  %51 = add i32 %50, %36
  %52 = and i32 %51, 16777215
  %53 = and i32 %17, 16777215
  %54 = mul i32 %52, %53
  %55 = add nsw i32 %54, %44
  %56 = mul nuw nsw i32 %36, 34
  %57 = add nuw nsw i32 %35, 34
  %58 = add nuw nsw i32 %57, %56
  %59 = add nuw nsw i32 %58, 1
  %60 = sext i32 %55 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !4, !amdgpu.noclobber !8
  %63 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %59
  store i32 %62, i32 addrspace(3)* %63, align 4, !tbaa !4
  %64 = icmp eq i32 %35, 31
  %65 = add nsw i32 %17, -1
  %66 = icmp slt i32 %44, %65
  %67 = select i1 %64, i1 %66, i1 false
  br i1 %67, label %68, label %75

68:                                               ; preds = %34
  %69 = add nsw i32 %55, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !4, !amdgpu.noclobber !8
  %73 = add nuw nsw i32 %58, 2
  %74 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %73
  store i32 %72, i32 addrspace(3)* %74, align 4, !tbaa !4
  br label %75

75:                                               ; preds = %34, %68
  %76 = icmp eq i32 %35, 0
  %77 = icmp sgt i32 %44, 0
  %78 = select i1 %76, i1 %77, i1 false
  br i1 %78, label %79, label %85

79:                                               ; preds = %75
  %80 = add nsw i32 %55, -1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !4, !amdgpu.noclobber !8
  %84 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %58
  store i32 %83, i32 addrspace(3)* %84, align 4, !tbaa !4
  br label %85

85:                                               ; preds = %75, %79
  %86 = icmp eq i32 %36, 7
  %87 = add nsw i32 %18, -1
  %88 = icmp slt i32 %51, %87
  %89 = select i1 %86, i1 %88, i1 false
  br i1 %89, label %90, label %97

90:                                               ; preds = %85
  %91 = add nsw i32 %55, %17
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !4, !amdgpu.noclobber !8
  %95 = add nuw nsw i32 %58, 35
  %96 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %95
  store i32 %94, i32 addrspace(3)* %96, align 4, !tbaa !4
  br label %97

97:                                               ; preds = %85, %90
  %98 = icmp eq i32 %36, 0
  %99 = icmp sgt i32 %51, 0
  %100 = select i1 %98, i1 %99, i1 false
  br i1 %100, label %101, label %108

101:                                              ; preds = %97
  %102 = sub nsw i32 %55, %17
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !4, !amdgpu.noclobber !8
  %106 = add nsw i32 %58, -33
  %107 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %106
  store i32 %105, i32 addrspace(3)* %107, align 4, !tbaa !4
  br label %108

108:                                              ; preds = %97, %101
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %60
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4, !amdgpu.noclobber !8
  %111 = icmp slt i32 %55, %16
  br i1 %111, label %112, label %258

112:                                              ; preds = %108
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %60
  %114 = load i32, i32 addrspace(1)* %113, align 4, !tbaa !4, !amdgpu.noclobber !8
  %115 = icmp eq i32 %114, 1
  br i1 %115, label %116, label %258

116:                                              ; preds = %112
  %117 = add nsw i32 %14, -1
  %118 = icmp slt i32 %44, %117
  %119 = and i1 %118, %77
  br i1 %119, label %120, label %258

120:                                              ; preds = %116
  %121 = add nsw i32 %15, -1
  %122 = icmp slt i32 %51, %121
  %123 = and i1 %122, %99
  br i1 %123, label %124, label %258

124:                                              ; preds = %120
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !4, !amdgpu.noclobber !8
  %127 = icmp sgt i32 %126, 0
  %128 = icmp sgt i32 %110, 0
  %129 = select i1 %127, i1 %128, i1 false
  br i1 %129, label %130, label %139

130:                                              ; preds = %124
  %131 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %132 = icmp eq i32 %131, 1
  br i1 %132, label %133, label %139

133:                                              ; preds = %130
  %134 = tail call i32 @llvm.umin.i32(i32 %126, i32 %110)
  %135 = sub nsw i32 %126, %134
  store i32 %135, i32 addrspace(1)* %125, align 4, !tbaa !4
  %136 = sub nsw i32 0, %134
  %137 = atomicrmw add i32 addrspace(1)* %109, i32 %136 syncscope("agent-one-as") monotonic, align 4
  %138 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4
  br label %139

139:                                              ; preds = %133, %130, %124
  %140 = phi i32 [ %138, %133 ], [ %110, %130 ], [ %110, %124 ]
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !4
  %143 = icmp sgt i32 %142, 0
  %144 = icmp sgt i32 %140, 0
  %145 = select i1 %143, i1 %144, i1 false
  br i1 %145, label %146, label %163

146:                                              ; preds = %139
  %147 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %148 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %58
  %149 = load i32, i32 addrspace(3)* %148, align 4, !tbaa !4
  %150 = add nsw i32 %149, 1
  %151 = icmp eq i32 %147, %150
  br i1 %151, label %152, label %163

152:                                              ; preds = %146
  %153 = tail call i32 @llvm.umin.i32(i32 %142, i32 %140)
  %154 = sub nsw i32 0, %153
  %155 = atomicrmw add i32 addrspace(1)* %141, i32 %154 syncscope("agent-one-as") monotonic, align 4
  %156 = add nsw i32 %55, -1
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %157
  %159 = atomicrmw add i32 addrspace(1)* %158, i32 %153 syncscope("agent-one-as") monotonic, align 4
  %160 = atomicrmw add i32 addrspace(1)* %109, i32 %154 syncscope("agent-one-as") monotonic, align 4
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %157
  %162 = atomicrmw add i32 addrspace(1)* %161, i32 %153 syncscope("agent-one-as") monotonic, align 4
  br label %168

163:                                              ; preds = %146, %139
  %164 = add nsw i32 %55, -1
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %165
  %167 = atomicrmw add i32 addrspace(1)* %166, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %168

168:                                              ; preds = %163, %152
  %169 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4
  %170 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %60
  %171 = load i32, i32 addrspace(1)* %170, align 4, !tbaa !4
  %172 = icmp sgt i32 %171, 0
  %173 = icmp sgt i32 %169, 0
  %174 = select i1 %172, i1 %173, i1 false
  br i1 %174, label %175, label %193

175:                                              ; preds = %168
  %176 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %177 = add nsw i32 %58, -33
  %178 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %177
  %179 = load i32, i32 addrspace(3)* %178, align 4, !tbaa !4
  %180 = add nsw i32 %179, 1
  %181 = icmp eq i32 %176, %180
  br i1 %181, label %182, label %193

182:                                              ; preds = %175
  %183 = tail call i32 @llvm.umin.i32(i32 %171, i32 %169)
  %184 = sub nsw i32 0, %183
  %185 = atomicrmw add i32 addrspace(1)* %170, i32 %184 syncscope("agent-one-as") monotonic, align 4
  %186 = sub nsw i32 %55, %17
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %187
  %189 = atomicrmw add i32 addrspace(1)* %188, i32 %183 syncscope("agent-one-as") monotonic, align 4
  %190 = atomicrmw add i32 addrspace(1)* %109, i32 %184 syncscope("agent-one-as") monotonic, align 4
  %191 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %187
  %192 = atomicrmw add i32 addrspace(1)* %191, i32 %183 syncscope("agent-one-as") monotonic, align 4
  br label %198

193:                                              ; preds = %175, %168
  %194 = sub nsw i32 %55, %17
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %195
  %197 = atomicrmw add i32 addrspace(1)* %196, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %198

198:                                              ; preds = %193, %182
  %199 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4
  %200 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %201 = load i32, i32 addrspace(1)* %200, align 4, !tbaa !4
  %202 = icmp sgt i32 %201, 0
  %203 = icmp sgt i32 %199, 0
  %204 = select i1 %202, i1 %203, i1 false
  br i1 %204, label %205, label %223

205:                                              ; preds = %198
  %206 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %207 = add nuw nsw i32 %58, 2
  %208 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %207
  %209 = load i32, i32 addrspace(3)* %208, align 4, !tbaa !4
  %210 = add nsw i32 %209, 1
  %211 = icmp eq i32 %206, %210
  br i1 %211, label %212, label %223

212:                                              ; preds = %205
  %213 = tail call i32 @llvm.umin.i32(i32 %201, i32 %199)
  %214 = sub nsw i32 0, %213
  %215 = atomicrmw add i32 addrspace(1)* %200, i32 %214 syncscope("agent-one-as") monotonic, align 4
  %216 = add nsw i32 %55, 1
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %217
  %219 = atomicrmw add i32 addrspace(1)* %218, i32 %213 syncscope("agent-one-as") monotonic, align 4
  %220 = atomicrmw add i32 addrspace(1)* %109, i32 %214 syncscope("agent-one-as") monotonic, align 4
  %221 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %217
  %222 = atomicrmw add i32 addrspace(1)* %221, i32 %213 syncscope("agent-one-as") monotonic, align 4
  br label %228

223:                                              ; preds = %205, %198
  %224 = add nsw i32 %55, 1
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %225
  %227 = atomicrmw add i32 addrspace(1)* %226, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %228

228:                                              ; preds = %223, %212
  %229 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4
  %230 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %231 = load i32, i32 addrspace(1)* %230, align 4, !tbaa !4
  %232 = icmp sgt i32 %231, 0
  %233 = icmp sgt i32 %229, 0
  %234 = select i1 %232, i1 %233, i1 false
  br i1 %234, label %235, label %253

235:                                              ; preds = %228
  %236 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %237 = add nuw nsw i32 %58, 35
  %238 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %237
  %239 = load i32, i32 addrspace(3)* %238, align 4, !tbaa !4
  %240 = add nsw i32 %239, 1
  %241 = icmp eq i32 %236, %240
  br i1 %241, label %242, label %253

242:                                              ; preds = %235
  %243 = tail call i32 @llvm.umin.i32(i32 %231, i32 %229)
  %244 = sub nsw i32 0, %243
  %245 = atomicrmw add i32 addrspace(1)* %230, i32 %244 syncscope("agent-one-as") monotonic, align 4
  %246 = add nsw i32 %55, %17
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %247
  %249 = atomicrmw add i32 addrspace(1)* %248, i32 %243 syncscope("agent-one-as") monotonic, align 4
  %250 = atomicrmw add i32 addrspace(1)* %109, i32 %244 syncscope("agent-one-as") monotonic, align 4
  %251 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %247
  %252 = atomicrmw add i32 addrspace(1)* %251, i32 %243 syncscope("agent-one-as") monotonic, align 4
  br label %258

253:                                              ; preds = %235, %228
  %254 = add nsw i32 %55, %17
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %255
  %257 = atomicrmw add i32 addrspace(1)* %256, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %258

258:                                              ; preds = %242, %253, %120, %116, %112, %108
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %259 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %260 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4
  %261 = icmp slt i32 %260, 1
  br i1 %261, label %326, label %262

262:                                              ; preds = %258
  %263 = load i32, i32 addrspace(1)* %259, align 4, !tbaa !4
  %264 = icmp eq i32 %263, 0
  br i1 %264, label %265, label %281

265:                                              ; preds = %262
  %266 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %267 = load i32, i32 addrspace(1)* %266, align 4, !tbaa !4
  %268 = icmp eq i32 %267, 0
  br i1 %268, label %269, label %281

269:                                              ; preds = %265
  %270 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %271 = load i32, i32 addrspace(1)* %270, align 4, !tbaa !4
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %273, label %281

273:                                              ; preds = %269
  %274 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %60
  %275 = load i32, i32 addrspace(1)* %274, align 4, !tbaa !4
  %276 = icmp eq i32 %275, 0
  br i1 %276, label %277, label %281

277:                                              ; preds = %273
  %278 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  %279 = load i32, i32 addrspace(1)* %278, align 4, !tbaa !4
  %280 = icmp eq i32 %279, 0
  br i1 %280, label %326, label %281

281:                                              ; preds = %262, %265, %269, %273, %277
  %282 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %283 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %58
  %284 = load i32, i32 addrspace(3)* %283, align 4, !tbaa !4
  %285 = add nsw i32 %284, 1
  %286 = icmp eq i32 %282, %285
  %287 = icmp sgt i32 %263, 0
  %288 = select i1 %286, i1 %287, i1 false
  br i1 %288, label %326, label %289

289:                                              ; preds = %281
  %290 = add nuw nsw i32 %58, 2
  %291 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %290
  %292 = load i32, i32 addrspace(3)* %291, align 4, !tbaa !4
  %293 = add nsw i32 %292, 1
  %294 = icmp eq i32 %282, %293
  br i1 %294, label %295, label %299

295:                                              ; preds = %289
  %296 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %297 = load i32, i32 addrspace(1)* %296, align 4, !tbaa !4
  %298 = icmp sgt i32 %297, 0
  br i1 %298, label %326, label %299

299:                                              ; preds = %295, %289
  %300 = add nuw nsw i32 %58, 35
  %301 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %300
  %302 = load i32, i32 addrspace(3)* %301, align 4, !tbaa !4
  %303 = add nsw i32 %302, 1
  %304 = icmp eq i32 %282, %303
  br i1 %304, label %305, label %309

305:                                              ; preds = %299
  %306 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %307 = load i32, i32 addrspace(1)* %306, align 4, !tbaa !4
  %308 = icmp sgt i32 %307, 0
  br i1 %308, label %326, label %309

309:                                              ; preds = %305, %299
  %310 = add nsw i32 %58, -33
  %311 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %310
  %312 = load i32, i32 addrspace(3)* %311, align 4, !tbaa !4
  %313 = add nsw i32 %312, 1
  %314 = icmp eq i32 %282, %313
  br i1 %314, label %315, label %319

315:                                              ; preds = %309
  %316 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %60
  %317 = load i32, i32 addrspace(1)* %316, align 4, !tbaa !4
  %318 = icmp sgt i32 %317, 0
  br i1 %318, label %326, label %319

319:                                              ; preds = %315, %309
  %320 = icmp eq i32 %282, 1
  br i1 %320, label %321, label %325

321:                                              ; preds = %319
  %322 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  %323 = load i32, i32 addrspace(1)* %322, align 4, !tbaa !4
  %324 = icmp sgt i32 %323, 0
  br i1 %324, label %326, label %325

325:                                              ; preds = %321, %319
  br label %326

326:                                              ; preds = %295, %305, %315, %321, %281, %258, %277, %325
  %327 = phi i32 [ 0, %325 ], [ 2, %277 ], [ 2, %258 ], [ 1, %281 ], [ 1, %321 ], [ 1, %315 ], [ 1, %305 ], [ 1, %295 ]
  %328 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %60
  store i32 %327, i32 addrspace(1)* %328, align 4, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %111, label %329, label %473

329:                                              ; preds = %326
  %330 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %60
  %331 = load i32, i32 addrspace(1)* %330, align 4, !tbaa !4
  %332 = icmp eq i32 %331, 1
  br i1 %332, label %333, label %473

333:                                              ; preds = %329
  %334 = add nsw i32 %14, -1
  %335 = icmp slt i32 %44, %334
  %336 = and i1 %335, %77
  br i1 %336, label %337, label %473

337:                                              ; preds = %333
  %338 = add nsw i32 %15, -1
  %339 = icmp slt i32 %51, %338
  %340 = and i1 %339, %99
  br i1 %340, label %341, label %473

341:                                              ; preds = %337
  %342 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  %343 = load i32, i32 addrspace(1)* %342, align 4, !tbaa !4
  %344 = icmp sgt i32 %343, 0
  %345 = icmp sgt i32 %260, 0
  %346 = select i1 %344, i1 %345, i1 false
  br i1 %346, label %347, label %355

347:                                              ; preds = %341
  %348 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %349 = icmp eq i32 %348, 1
  br i1 %349, label %350, label %355

350:                                              ; preds = %347
  %351 = tail call i32 @llvm.umin.i32(i32 %343, i32 %260)
  %352 = sub nsw i32 %343, %351
  store i32 %352, i32 addrspace(1)* %342, align 4, !tbaa !4
  %353 = sub nsw i32 0, %351
  %354 = atomicrmw add i32 addrspace(1)* %109, i32 %353 syncscope("agent-one-as") monotonic, align 4
  br label %355

355:                                              ; preds = %350, %347, %341
  %356 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4
  %357 = load i32, i32 addrspace(1)* %259, align 4, !tbaa !4
  %358 = icmp sgt i32 %357, 0
  %359 = icmp sgt i32 %356, 0
  %360 = select i1 %358, i1 %359, i1 false
  br i1 %360, label %361, label %378

361:                                              ; preds = %355
  %362 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %363 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %58
  %364 = load i32, i32 addrspace(3)* %363, align 4, !tbaa !4
  %365 = add nsw i32 %364, 1
  %366 = icmp eq i32 %362, %365
  br i1 %366, label %367, label %378

367:                                              ; preds = %361
  %368 = tail call i32 @llvm.umin.i32(i32 %357, i32 %356)
  %369 = sub nsw i32 0, %368
  %370 = atomicrmw add i32 addrspace(1)* %259, i32 %369 syncscope("agent-one-as") monotonic, align 4
  %371 = add nsw i32 %55, -1
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %372
  %374 = atomicrmw add i32 addrspace(1)* %373, i32 %368 syncscope("agent-one-as") monotonic, align 4
  %375 = atomicrmw add i32 addrspace(1)* %109, i32 %369 syncscope("agent-one-as") monotonic, align 4
  %376 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %372
  %377 = atomicrmw add i32 addrspace(1)* %376, i32 %368 syncscope("agent-one-as") monotonic, align 4
  br label %383

378:                                              ; preds = %361, %355
  %379 = add nsw i32 %55, -1
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %380
  %382 = atomicrmw add i32 addrspace(1)* %381, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %383

383:                                              ; preds = %378, %367
  %384 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4
  %385 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %60
  %386 = load i32, i32 addrspace(1)* %385, align 4, !tbaa !4
  %387 = icmp sgt i32 %386, 0
  %388 = icmp sgt i32 %384, 0
  %389 = select i1 %387, i1 %388, i1 false
  br i1 %389, label %390, label %408

390:                                              ; preds = %383
  %391 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %392 = add nsw i32 %58, -33
  %393 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %392
  %394 = load i32, i32 addrspace(3)* %393, align 4, !tbaa !4
  %395 = add nsw i32 %394, 1
  %396 = icmp eq i32 %391, %395
  br i1 %396, label %397, label %408

397:                                              ; preds = %390
  %398 = tail call i32 @llvm.umin.i32(i32 %386, i32 %384)
  %399 = sub nsw i32 0, %398
  %400 = atomicrmw add i32 addrspace(1)* %385, i32 %399 syncscope("agent-one-as") monotonic, align 4
  %401 = sub nsw i32 %55, %17
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %402
  %404 = atomicrmw add i32 addrspace(1)* %403, i32 %398 syncscope("agent-one-as") monotonic, align 4
  %405 = atomicrmw add i32 addrspace(1)* %109, i32 %399 syncscope("agent-one-as") monotonic, align 4
  %406 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %402
  %407 = atomicrmw add i32 addrspace(1)* %406, i32 %398 syncscope("agent-one-as") monotonic, align 4
  br label %413

408:                                              ; preds = %390, %383
  %409 = sub nsw i32 %55, %17
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %410
  %412 = atomicrmw add i32 addrspace(1)* %411, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %413

413:                                              ; preds = %408, %397
  %414 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4
  %415 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %416 = load i32, i32 addrspace(1)* %415, align 4, !tbaa !4
  %417 = icmp sgt i32 %416, 0
  %418 = icmp sgt i32 %414, 0
  %419 = select i1 %417, i1 %418, i1 false
  br i1 %419, label %420, label %438

420:                                              ; preds = %413
  %421 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %422 = add nuw nsw i32 %58, 2
  %423 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %422
  %424 = load i32, i32 addrspace(3)* %423, align 4, !tbaa !4
  %425 = add nsw i32 %424, 1
  %426 = icmp eq i32 %421, %425
  br i1 %426, label %427, label %438

427:                                              ; preds = %420
  %428 = tail call i32 @llvm.umin.i32(i32 %416, i32 %414)
  %429 = sub nsw i32 0, %428
  %430 = atomicrmw add i32 addrspace(1)* %415, i32 %429 syncscope("agent-one-as") monotonic, align 4
  %431 = add nsw i32 %55, 1
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %432
  %434 = atomicrmw add i32 addrspace(1)* %433, i32 %428 syncscope("agent-one-as") monotonic, align 4
  %435 = atomicrmw add i32 addrspace(1)* %109, i32 %429 syncscope("agent-one-as") monotonic, align 4
  %436 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %432
  %437 = atomicrmw add i32 addrspace(1)* %436, i32 %428 syncscope("agent-one-as") monotonic, align 4
  br label %443

438:                                              ; preds = %420, %413
  %439 = add nsw i32 %55, 1
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %440
  %442 = atomicrmw add i32 addrspace(1)* %441, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %443

443:                                              ; preds = %438, %427
  %444 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !4
  %445 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %446 = load i32, i32 addrspace(1)* %445, align 4, !tbaa !4
  %447 = icmp sgt i32 %446, 0
  %448 = icmp sgt i32 %444, 0
  %449 = select i1 %447, i1 %448, i1 false
  br i1 %449, label %450, label %468

450:                                              ; preds = %443
  %451 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !4
  %452 = add nuw nsw i32 %58, 35
  %453 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ23kernel_push2_stochasticPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiS_S_S_PbS_E9height_fn, i32 0, i32 %452
  %454 = load i32, i32 addrspace(3)* %453, align 4, !tbaa !4
  %455 = add nsw i32 %454, 1
  %456 = icmp eq i32 %451, %455
  br i1 %456, label %457, label %468

457:                                              ; preds = %450
  %458 = tail call i32 @llvm.umin.i32(i32 %446, i32 %444)
  %459 = sub nsw i32 0, %458
  %460 = atomicrmw add i32 addrspace(1)* %445, i32 %459 syncscope("agent-one-as") monotonic, align 4
  %461 = add nsw i32 %55, %17
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %462
  %464 = atomicrmw add i32 addrspace(1)* %463, i32 %458 syncscope("agent-one-as") monotonic, align 4
  %465 = atomicrmw add i32 addrspace(1)* %109, i32 %459 syncscope("agent-one-as") monotonic, align 4
  %466 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %462
  %467 = atomicrmw add i32 addrspace(1)* %466, i32 %458 syncscope("agent-one-as") monotonic, align 4
  br label %473

468:                                              ; preds = %450, %443
  %469 = add nsw i32 %55, %17
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %470
  %472 = atomicrmw add i32 addrspace(1)* %471, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %473

473:                                              ; preds = %326, %329, %333, %337, %468, %457, %24
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
