; ModuleID = '../data/hip_kernels/17363/3/main.cu'
source_filename = "../data/hip_kernels/17363/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn = internal unnamed_addr addrspace(3) global [356 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture %6, i32 addrspace(1)* nocapture %7, i32 addrspace(1)* nocapture %8, i32 addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture %10, i32 addrspace(1)* nocapture readonly %11, i32 addrspace(1)* nocapture readnone %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18) local_unnamed_addr #0 {
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = and i32 %22, 16777215
  %29 = mul i32 %28, %27
  %30 = add i32 %29, %20
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = getelementptr i8, i8 addrspace(4)* %23, i64 6
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 2, !range !5, !invariant.load !6
  %35 = zext i16 %34 to i32
  %36 = and i32 %31, 16777215
  %37 = mul i32 %36, %35
  %38 = add i32 %37, %21
  %39 = and i32 %38, 16777215
  %40 = and i32 %17, 16777215
  %41 = mul i32 %39, %40
  %42 = add nsw i32 %41, %30
  %43 = mul nuw nsw i32 %21, 34
  %44 = add nuw nsw i32 %20, 34
  %45 = add nuw nsw i32 %44, %43
  %46 = add nuw nsw i32 %45, 1
  %47 = sext i32 %42 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %46
  store i32 %49, i32 addrspace(3)* %50, align 4, !tbaa !7
  %51 = icmp eq i32 %20, 31
  %52 = add nsw i32 %17, -1
  %53 = icmp slt i32 %30, %52
  %54 = select i1 %51, i1 %53, i1 false
  br i1 %54, label %55, label %62

55:                                               ; preds = %19
  %56 = add nsw i32 %42, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = add nuw nsw i32 %45, 2
  %61 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %60
  store i32 %59, i32 addrspace(3)* %61, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %19, %55
  %63 = icmp eq i32 %20, 0
  %64 = icmp sgt i32 %30, 0
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %66, label %72

66:                                               ; preds = %62
  %67 = add nsw i32 %42, -1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %45
  store i32 %70, i32 addrspace(3)* %71, align 4, !tbaa !7
  br label %72

72:                                               ; preds = %62, %66
  %73 = icmp eq i32 %21, 7
  %74 = add nsw i32 %18, -1
  %75 = icmp slt i32 %38, %74
  %76 = select i1 %73, i1 %75, i1 false
  br i1 %76, label %77, label %84

77:                                               ; preds = %72
  %78 = add nsw i32 %42, %17
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = add nuw nsw i32 %45, 35
  %83 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %82
  store i32 %81, i32 addrspace(3)* %83, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %72, %77
  %85 = icmp eq i32 %21, 0
  %86 = icmp sgt i32 %38, 0
  %87 = select i1 %85, i1 %86, i1 false
  br i1 %87, label %88, label %95

88:                                               ; preds = %84
  %89 = sub nsw i32 %42, %17
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  %93 = add nsw i32 %45, -33
  %94 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %93
  store i32 %92, i32 addrspace(3)* %94, align 4, !tbaa !7
  br label %95

95:                                               ; preds = %84, %88
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %47
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = icmp slt i32 %42, %16
  br i1 %98, label %99, label %245

99:                                               ; preds = %95
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %47
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !6
  %102 = icmp eq i32 %101, 1
  br i1 %102, label %103, label %245

103:                                              ; preds = %99
  %104 = add nsw i32 %14, -1
  %105 = icmp slt i32 %30, %104
  %106 = and i1 %105, %64
  br i1 %106, label %107, label %245

107:                                              ; preds = %103
  %108 = add nsw i32 %15, -1
  %109 = icmp slt i32 %38, %108
  %110 = and i1 %109, %86
  br i1 %110, label %111, label %245

111:                                              ; preds = %107
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !6
  %114 = icmp sgt i32 %113, 0
  %115 = icmp sgt i32 %97, 0
  %116 = select i1 %114, i1 %115, i1 false
  br i1 %116, label %117, label %126

117:                                              ; preds = %111
  %118 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %119 = icmp eq i32 %118, 1
  br i1 %119, label %120, label %126

120:                                              ; preds = %117
  %121 = tail call i32 @llvm.umin.i32(i32 %113, i32 %97)
  %122 = sub nsw i32 %113, %121
  store i32 %122, i32 addrspace(1)* %112, align 4, !tbaa !7
  %123 = sub nsw i32 0, %121
  %124 = atomicrmw add i32 addrspace(1)* %96, i32 %123 syncscope("agent-one-as") monotonic, align 4
  %125 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  br label %126

126:                                              ; preds = %120, %117, %111
  %127 = phi i32 [ %125, %120 ], [ %97, %117 ], [ %97, %111 ]
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !7
  %130 = icmp sgt i32 %129, 0
  %131 = icmp sgt i32 %127, 0
  %132 = select i1 %130, i1 %131, i1 false
  br i1 %132, label %133, label %150

133:                                              ; preds = %126
  %134 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %135 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %45
  %136 = load i32, i32 addrspace(3)* %135, align 4, !tbaa !7
  %137 = add nsw i32 %136, 1
  %138 = icmp eq i32 %134, %137
  br i1 %138, label %139, label %150

139:                                              ; preds = %133
  %140 = tail call i32 @llvm.umin.i32(i32 %129, i32 %127)
  %141 = sub nsw i32 0, %140
  %142 = atomicrmw add i32 addrspace(1)* %128, i32 %141 syncscope("agent-one-as") monotonic, align 4
  %143 = add nsw i32 %42, -1
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %144
  %146 = atomicrmw add i32 addrspace(1)* %145, i32 %140 syncscope("agent-one-as") monotonic, align 4
  %147 = atomicrmw add i32 addrspace(1)* %96, i32 %141 syncscope("agent-one-as") monotonic, align 4
  %148 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %144
  %149 = atomicrmw add i32 addrspace(1)* %148, i32 %140 syncscope("agent-one-as") monotonic, align 4
  br label %155

150:                                              ; preds = %133, %126
  %151 = add nsw i32 %42, -1
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %152
  %154 = atomicrmw add i32 addrspace(1)* %153, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %155

155:                                              ; preds = %150, %139
  %156 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %158 = load i32, i32 addrspace(1)* %157, align 4, !tbaa !7
  %159 = icmp sgt i32 %158, 0
  %160 = icmp sgt i32 %156, 0
  %161 = select i1 %159, i1 %160, i1 false
  br i1 %161, label %162, label %180

162:                                              ; preds = %155
  %163 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %164 = add nsw i32 %45, -33
  %165 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %164
  %166 = load i32, i32 addrspace(3)* %165, align 4, !tbaa !7
  %167 = add nsw i32 %166, 1
  %168 = icmp eq i32 %163, %167
  br i1 %168, label %169, label %180

169:                                              ; preds = %162
  %170 = tail call i32 @llvm.umin.i32(i32 %158, i32 %156)
  %171 = sub nsw i32 0, %170
  %172 = atomicrmw add i32 addrspace(1)* %157, i32 %171 syncscope("agent-one-as") monotonic, align 4
  %173 = sub nsw i32 %42, %17
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %174
  %176 = atomicrmw add i32 addrspace(1)* %175, i32 %170 syncscope("agent-one-as") monotonic, align 4
  %177 = atomicrmw add i32 addrspace(1)* %96, i32 %171 syncscope("agent-one-as") monotonic, align 4
  %178 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %174
  %179 = atomicrmw add i32 addrspace(1)* %178, i32 %170 syncscope("agent-one-as") monotonic, align 4
  br label %185

180:                                              ; preds = %162, %155
  %181 = sub nsw i32 %42, %17
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %182
  %184 = atomicrmw add i32 addrspace(1)* %183, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %185

185:                                              ; preds = %180, %169
  %186 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %187 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %188 = load i32, i32 addrspace(1)* %187, align 4, !tbaa !7
  %189 = icmp sgt i32 %188, 0
  %190 = icmp sgt i32 %186, 0
  %191 = select i1 %189, i1 %190, i1 false
  br i1 %191, label %192, label %210

192:                                              ; preds = %185
  %193 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %194 = add nuw nsw i32 %45, 2
  %195 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %194
  %196 = load i32, i32 addrspace(3)* %195, align 4, !tbaa !7
  %197 = add nsw i32 %196, 1
  %198 = icmp eq i32 %193, %197
  br i1 %198, label %199, label %210

199:                                              ; preds = %192
  %200 = tail call i32 @llvm.umin.i32(i32 %188, i32 %186)
  %201 = sub nsw i32 0, %200
  %202 = atomicrmw add i32 addrspace(1)* %187, i32 %201 syncscope("agent-one-as") monotonic, align 4
  %203 = add nsw i32 %42, 1
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %204
  %206 = atomicrmw add i32 addrspace(1)* %205, i32 %200 syncscope("agent-one-as") monotonic, align 4
  %207 = atomicrmw add i32 addrspace(1)* %96, i32 %201 syncscope("agent-one-as") monotonic, align 4
  %208 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %204
  %209 = atomicrmw add i32 addrspace(1)* %208, i32 %200 syncscope("agent-one-as") monotonic, align 4
  br label %215

210:                                              ; preds = %192, %185
  %211 = add nsw i32 %42, 1
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %212
  %214 = atomicrmw add i32 addrspace(1)* %213, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %215

215:                                              ; preds = %210, %199
  %216 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %217 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %218 = load i32, i32 addrspace(1)* %217, align 4, !tbaa !7
  %219 = icmp sgt i32 %218, 0
  %220 = icmp sgt i32 %216, 0
  %221 = select i1 %219, i1 %220, i1 false
  br i1 %221, label %222, label %240

222:                                              ; preds = %215
  %223 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %224 = add nuw nsw i32 %45, 35
  %225 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %224
  %226 = load i32, i32 addrspace(3)* %225, align 4, !tbaa !7
  %227 = add nsw i32 %226, 1
  %228 = icmp eq i32 %223, %227
  br i1 %228, label %229, label %240

229:                                              ; preds = %222
  %230 = tail call i32 @llvm.umin.i32(i32 %218, i32 %216)
  %231 = sub nsw i32 0, %230
  %232 = atomicrmw add i32 addrspace(1)* %217, i32 %231 syncscope("agent-one-as") monotonic, align 4
  %233 = add nsw i32 %42, %17
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %234
  %236 = atomicrmw add i32 addrspace(1)* %235, i32 %230 syncscope("agent-one-as") monotonic, align 4
  %237 = atomicrmw add i32 addrspace(1)* %96, i32 %231 syncscope("agent-one-as") monotonic, align 4
  %238 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %234
  %239 = atomicrmw add i32 addrspace(1)* %238, i32 %230 syncscope("agent-one-as") monotonic, align 4
  br label %245

240:                                              ; preds = %222, %215
  %241 = add nsw i32 %42, %17
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %242
  %244 = atomicrmw add i32 addrspace(1)* %243, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %245

245:                                              ; preds = %229, %240, %107, %103, %99, %95
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %246 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %247 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %248 = icmp slt i32 %247, 1
  br i1 %248, label %313, label %249

249:                                              ; preds = %245
  %250 = load i32, i32 addrspace(1)* %246, align 4, !tbaa !7
  %251 = icmp eq i32 %250, 0
  br i1 %251, label %252, label %268

252:                                              ; preds = %249
  %253 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %254 = load i32, i32 addrspace(1)* %253, align 4, !tbaa !7
  %255 = icmp eq i32 %254, 0
  br i1 %255, label %256, label %268

256:                                              ; preds = %252
  %257 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %258 = load i32, i32 addrspace(1)* %257, align 4, !tbaa !7
  %259 = icmp eq i32 %258, 0
  br i1 %259, label %260, label %268

260:                                              ; preds = %256
  %261 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %262 = load i32, i32 addrspace(1)* %261, align 4, !tbaa !7
  %263 = icmp eq i32 %262, 0
  br i1 %263, label %264, label %268

264:                                              ; preds = %260
  %265 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %266 = load i32, i32 addrspace(1)* %265, align 4, !tbaa !7
  %267 = icmp eq i32 %266, 0
  br i1 %267, label %313, label %268

268:                                              ; preds = %249, %252, %256, %260, %264
  %269 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %270 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %45
  %271 = load i32, i32 addrspace(3)* %270, align 4, !tbaa !7
  %272 = add nsw i32 %271, 1
  %273 = icmp eq i32 %269, %272
  %274 = icmp sgt i32 %250, 0
  %275 = select i1 %273, i1 %274, i1 false
  br i1 %275, label %313, label %276

276:                                              ; preds = %268
  %277 = add nuw nsw i32 %45, 2
  %278 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %277
  %279 = load i32, i32 addrspace(3)* %278, align 4, !tbaa !7
  %280 = add nsw i32 %279, 1
  %281 = icmp eq i32 %269, %280
  br i1 %281, label %282, label %286

282:                                              ; preds = %276
  %283 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %284 = load i32, i32 addrspace(1)* %283, align 4, !tbaa !7
  %285 = icmp sgt i32 %284, 0
  br i1 %285, label %313, label %286

286:                                              ; preds = %282, %276
  %287 = add nuw nsw i32 %45, 35
  %288 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %287
  %289 = load i32, i32 addrspace(3)* %288, align 4, !tbaa !7
  %290 = add nsw i32 %289, 1
  %291 = icmp eq i32 %269, %290
  br i1 %291, label %292, label %296

292:                                              ; preds = %286
  %293 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %294 = load i32, i32 addrspace(1)* %293, align 4, !tbaa !7
  %295 = icmp sgt i32 %294, 0
  br i1 %295, label %313, label %296

296:                                              ; preds = %292, %286
  %297 = add nsw i32 %45, -33
  %298 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %297
  %299 = load i32, i32 addrspace(3)* %298, align 4, !tbaa !7
  %300 = add nsw i32 %299, 1
  %301 = icmp eq i32 %269, %300
  br i1 %301, label %302, label %306

302:                                              ; preds = %296
  %303 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %304 = load i32, i32 addrspace(1)* %303, align 4, !tbaa !7
  %305 = icmp sgt i32 %304, 0
  br i1 %305, label %313, label %306

306:                                              ; preds = %302, %296
  %307 = icmp eq i32 %269, 1
  br i1 %307, label %308, label %312

308:                                              ; preds = %306
  %309 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %310 = load i32, i32 addrspace(1)* %309, align 4, !tbaa !7
  %311 = icmp sgt i32 %310, 0
  br i1 %311, label %313, label %312

312:                                              ; preds = %308, %306
  br label %313

313:                                              ; preds = %282, %292, %302, %308, %268, %245, %264, %312
  %314 = phi i32 [ 0, %312 ], [ 2, %264 ], [ 2, %245 ], [ 1, %268 ], [ 1, %308 ], [ 1, %302 ], [ 1, %292 ], [ 1, %282 ]
  %315 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %47
  store i32 %314, i32 addrspace(1)* %315, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %98, label %316, label %460

316:                                              ; preds = %313
  %317 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %47
  %318 = load i32, i32 addrspace(1)* %317, align 4, !tbaa !7
  %319 = icmp eq i32 %318, 1
  br i1 %319, label %320, label %460

320:                                              ; preds = %316
  %321 = add nsw i32 %14, -1
  %322 = icmp slt i32 %30, %321
  %323 = and i1 %322, %64
  br i1 %323, label %324, label %460

324:                                              ; preds = %320
  %325 = add nsw i32 %15, -1
  %326 = icmp slt i32 %38, %325
  %327 = and i1 %326, %86
  br i1 %327, label %328, label %460

328:                                              ; preds = %324
  %329 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %330 = load i32, i32 addrspace(1)* %329, align 4, !tbaa !7
  %331 = icmp sgt i32 %330, 0
  %332 = icmp sgt i32 %247, 0
  %333 = select i1 %331, i1 %332, i1 false
  br i1 %333, label %334, label %342

334:                                              ; preds = %328
  %335 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %336 = icmp eq i32 %335, 1
  br i1 %336, label %337, label %342

337:                                              ; preds = %334
  %338 = tail call i32 @llvm.umin.i32(i32 %330, i32 %247)
  %339 = sub nsw i32 %330, %338
  store i32 %339, i32 addrspace(1)* %329, align 4, !tbaa !7
  %340 = sub nsw i32 0, %338
  %341 = atomicrmw add i32 addrspace(1)* %96, i32 %340 syncscope("agent-one-as") monotonic, align 4
  br label %342

342:                                              ; preds = %337, %334, %328
  %343 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %344 = load i32, i32 addrspace(1)* %246, align 4, !tbaa !7
  %345 = icmp sgt i32 %344, 0
  %346 = icmp sgt i32 %343, 0
  %347 = select i1 %345, i1 %346, i1 false
  br i1 %347, label %348, label %365

348:                                              ; preds = %342
  %349 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %350 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %45
  %351 = load i32, i32 addrspace(3)* %350, align 4, !tbaa !7
  %352 = add nsw i32 %351, 1
  %353 = icmp eq i32 %349, %352
  br i1 %353, label %354, label %365

354:                                              ; preds = %348
  %355 = tail call i32 @llvm.umin.i32(i32 %344, i32 %343)
  %356 = sub nsw i32 0, %355
  %357 = atomicrmw add i32 addrspace(1)* %246, i32 %356 syncscope("agent-one-as") monotonic, align 4
  %358 = add nsw i32 %42, -1
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %359
  %361 = atomicrmw add i32 addrspace(1)* %360, i32 %355 syncscope("agent-one-as") monotonic, align 4
  %362 = atomicrmw add i32 addrspace(1)* %96, i32 %356 syncscope("agent-one-as") monotonic, align 4
  %363 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %359
  %364 = atomicrmw add i32 addrspace(1)* %363, i32 %355 syncscope("agent-one-as") monotonic, align 4
  br label %370

365:                                              ; preds = %348, %342
  %366 = add nsw i32 %42, -1
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %367
  %369 = atomicrmw add i32 addrspace(1)* %368, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %370

370:                                              ; preds = %365, %354
  %371 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %372 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %373 = load i32, i32 addrspace(1)* %372, align 4, !tbaa !7
  %374 = icmp sgt i32 %373, 0
  %375 = icmp sgt i32 %371, 0
  %376 = select i1 %374, i1 %375, i1 false
  br i1 %376, label %377, label %395

377:                                              ; preds = %370
  %378 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %379 = add nsw i32 %45, -33
  %380 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %379
  %381 = load i32, i32 addrspace(3)* %380, align 4, !tbaa !7
  %382 = add nsw i32 %381, 1
  %383 = icmp eq i32 %378, %382
  br i1 %383, label %384, label %395

384:                                              ; preds = %377
  %385 = tail call i32 @llvm.umin.i32(i32 %373, i32 %371)
  %386 = sub nsw i32 0, %385
  %387 = atomicrmw add i32 addrspace(1)* %372, i32 %386 syncscope("agent-one-as") monotonic, align 4
  %388 = sub nsw i32 %42, %17
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %389
  %391 = atomicrmw add i32 addrspace(1)* %390, i32 %385 syncscope("agent-one-as") monotonic, align 4
  %392 = atomicrmw add i32 addrspace(1)* %96, i32 %386 syncscope("agent-one-as") monotonic, align 4
  %393 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %389
  %394 = atomicrmw add i32 addrspace(1)* %393, i32 %385 syncscope("agent-one-as") monotonic, align 4
  br label %400

395:                                              ; preds = %377, %370
  %396 = sub nsw i32 %42, %17
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %397
  %399 = atomicrmw add i32 addrspace(1)* %398, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %400

400:                                              ; preds = %395, %384
  %401 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %402 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %403 = load i32, i32 addrspace(1)* %402, align 4, !tbaa !7
  %404 = icmp sgt i32 %403, 0
  %405 = icmp sgt i32 %401, 0
  %406 = select i1 %404, i1 %405, i1 false
  br i1 %406, label %407, label %425

407:                                              ; preds = %400
  %408 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %409 = add nuw nsw i32 %45, 2
  %410 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %409
  %411 = load i32, i32 addrspace(3)* %410, align 4, !tbaa !7
  %412 = add nsw i32 %411, 1
  %413 = icmp eq i32 %408, %412
  br i1 %413, label %414, label %425

414:                                              ; preds = %407
  %415 = tail call i32 @llvm.umin.i32(i32 %403, i32 %401)
  %416 = sub nsw i32 0, %415
  %417 = atomicrmw add i32 addrspace(1)* %402, i32 %416 syncscope("agent-one-as") monotonic, align 4
  %418 = add nsw i32 %42, 1
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %419
  %421 = atomicrmw add i32 addrspace(1)* %420, i32 %415 syncscope("agent-one-as") monotonic, align 4
  %422 = atomicrmw add i32 addrspace(1)* %96, i32 %416 syncscope("agent-one-as") monotonic, align 4
  %423 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %419
  %424 = atomicrmw add i32 addrspace(1)* %423, i32 %415 syncscope("agent-one-as") monotonic, align 4
  br label %430

425:                                              ; preds = %407, %400
  %426 = add nsw i32 %42, 1
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %427
  %429 = atomicrmw add i32 addrspace(1)* %428, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %430

430:                                              ; preds = %425, %414
  %431 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %432 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %433 = load i32, i32 addrspace(1)* %432, align 4, !tbaa !7
  %434 = icmp sgt i32 %433, 0
  %435 = icmp sgt i32 %431, 0
  %436 = select i1 %434, i1 %435, i1 false
  br i1 %436, label %437, label %455

437:                                              ; preds = %430
  %438 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %439 = add nuw nsw i32 %45, 35
  %440 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ19kernel_push2_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %439
  %441 = load i32, i32 addrspace(3)* %440, align 4, !tbaa !7
  %442 = add nsw i32 %441, 1
  %443 = icmp eq i32 %438, %442
  br i1 %443, label %444, label %455

444:                                              ; preds = %437
  %445 = tail call i32 @llvm.umin.i32(i32 %433, i32 %431)
  %446 = sub nsw i32 0, %445
  %447 = atomicrmw add i32 addrspace(1)* %432, i32 %446 syncscope("agent-one-as") monotonic, align 4
  %448 = add nsw i32 %42, %17
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %449
  %451 = atomicrmw add i32 addrspace(1)* %450, i32 %445 syncscope("agent-one-as") monotonic, align 4
  %452 = atomicrmw add i32 addrspace(1)* %96, i32 %446 syncscope("agent-one-as") monotonic, align 4
  %453 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %449
  %454 = atomicrmw add i32 addrspace(1)* %453, i32 %445 syncscope("agent-one-as") monotonic, align 4
  br label %460

455:                                              ; preds = %437, %430
  %456 = add nsw i32 %42, %17
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %457
  %459 = atomicrmw add i32 addrspace(1)* %458, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %460

460:                                              ; preds = %444, %455, %324, %320, %316, %313
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
