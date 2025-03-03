; ModuleID = '../data/hip_kernels/15208/0/main.cu'
source_filename = "../data/hip_kernels/15208/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15gpu_update_signPiPdiiS_S_iiE4buff = internal unnamed_addr addrspace(3) global [5140 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15gpu_update_signPiPdiiS_S_ii(i32 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = icmp sgt i32 %6, 0
  br i1 %9, label %10, label %92

10:                                               ; preds = %8
  %11 = icmp sgt i32 %7, 0
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %19 = add nsw i32 %3, -1
  %20 = icmp eq i32 %18, 0
  %21 = add nuw nsw i32 %18, 2
  %22 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %21
  %23 = add nsw i32 %3, -2
  %24 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %18
  %25 = add nuw nsw i32 %18, 1
  %26 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %25
  %27 = add nuw nsw i32 %18, 3
  %28 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %27
  %29 = add nuw nsw i32 %18, 4
  %30 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %29
  %31 = icmp sgt i32 %2, 0
  %32 = add i32 %18, 10
  %33 = add i32 %18, 5
  %34 = add i32 %18, 7
  %35 = add i32 %18, 8
  %36 = and i32 %2, 7
  %37 = icmp ult i32 %2, 8
  %38 = and i32 %2, -8
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %10, %96
  %41 = phi i32 [ 0, %10 ], [ %97, %96 ]
  %42 = phi i32 [ 0, %10 ], [ %98, %96 ]
  br i1 %11, label %43, label %96

43:                                               ; preds = %40
  %44 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !4
  %45 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %46 = zext i16 %45 to i32
  %47 = udiv i32 %44, %46
  %48 = mul i32 %47, %46
  %49 = icmp ugt i32 %44, %48
  %50 = zext i1 %49 to i32
  %51 = add i32 %47, %50
  %52 = mul i32 %51, %42
  %53 = add i32 %52, %12
  %54 = add nsw i32 %46, -1
  %55 = icmp slt i32 %53, %3
  %56 = icmp ugt i32 %46, %3
  %57 = add nuw nsw i32 %46, 4
  %58 = add i32 %53, %3
  %59 = add nsw i32 %58, -2
  %60 = add nsw i32 %58, -1
  %61 = shl nuw nsw i32 %57, 1
  %62 = add i32 %58, 1
  %63 = mul nuw nsw i32 %57, 3
  %64 = add i32 %58, 2
  %65 = shl nuw nsw i32 %57, 2
  %66 = add nuw nsw i32 %57, %21
  %67 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %66
  %68 = add nuw nsw i32 %61, %21
  %69 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %68
  %70 = add nuw nsw i32 %63, %21
  %71 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %70
  %72 = add nuw nsw i32 %65, %21
  %73 = add nuw nsw i32 %57, %18
  %74 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %73
  %75 = add nuw nsw i32 %61, %18
  %76 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %75
  %77 = add nuw nsw i32 %63, %18
  %78 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %77
  %79 = add nuw nsw i32 %65, %18
  %80 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %79
  %81 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %72
  %82 = shl nuw nsw i32 %46, 1
  %83 = add i32 %32, %82
  %84 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %83
  %85 = mul nsw i32 %53, %3
  %86 = add i32 %33, %46
  %87 = add i32 %34, %46
  %88 = add i32 %35, %46
  %89 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %86
  %90 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %87
  %91 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %88
  br label %100

92:                                               ; preds = %96, %8
  %93 = phi i32 [ 0, %8 ], [ %97, %96 ]
  %94 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !15
  %95 = add nsw i32 %94, %93
  store i32 %95, i32 addrspace(1)* %5, align 4, !tbaa !15
  ret void

96:                                               ; preds = %568, %40
  %97 = phi i32 [ %41, %40 ], [ %569, %568 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = add nuw nsw i32 %42, 1
  %99 = icmp eq i32 %98, %6
  br i1 %99, label %92, label %40, !llvm.loop !19

100:                                              ; preds = %43, %568
  %101 = phi i32 [ %41, %43 ], [ %569, %568 ]
  %102 = phi i32 [ 0, %43 ], [ %570, %568 ]
  %103 = mul i32 %102, %46
  %104 = add i32 %103, %18
  %105 = icmp slt i32 %104, %3
  %106 = select i1 %55, i1 %105, i1 false
  br i1 %106, label %107, label %420

107:                                              ; preds = %100
  %108 = icmp ne i32 %104, %19
  %109 = select i1 %108, i1 true, i1 %56
  %110 = select i1 %108, i32 %54, i32 %104
  br i1 %109, label %116, label %111

111:                                              ; preds = %107
  %112 = udiv i32 %3, %46
  %113 = icmp eq i32 %112, %102
  br i1 %113, label %114, label %116

114:                                              ; preds = %111
  %115 = urem i32 %19, %46
  br label %116

116:                                              ; preds = %107, %114, %111
  %117 = phi i32 [ %115, %114 ], [ %54, %111 ], [ %110, %107 ]
  br i1 %20, label %122, label %118

118:                                              ; preds = %116
  %119 = icmp eq i32 %18, %117
  %120 = icmp ne i32 %117, 0
  %121 = and i1 %119, %120
  br i1 %121, label %124, label %238

122:                                              ; preds = %116
  %123 = icmp eq i32 %117, 0
  br i1 %123, label %238, label %124

124:                                              ; preds = %122, %118
  %125 = phi i32 [ 0, %118 ], [ -2, %122 ]
  %126 = add nsw i32 %125, %104
  %127 = sub i32 %21, %104
  %128 = srem i32 %59, %3
  %129 = mul nsw i32 %128, %3
  %130 = add nsw i32 %126, %3
  %131 = srem i32 %130, %3
  %132 = add nsw i32 %129, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !15
  %136 = add nsw i32 %125, %21
  %137 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %136
  store i32 %135, i32 addrspace(3)* %137, align 4, !tbaa !15
  %138 = add nsw i32 %126, 1
  %139 = add nsw i32 %138, %3
  %140 = srem i32 %139, %3
  %141 = add nsw i32 %140, %129
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %142
  %144 = load i32, i32 addrspace(1)* %143, align 4, !tbaa !15
  %145 = add i32 %138, %127
  %146 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %145
  store i32 %144, i32 addrspace(3)* %146, align 4, !tbaa !15
  %147 = add nsw i32 %126, 2
  %148 = add nsw i32 %147, %3
  %149 = srem i32 %148, %3
  %150 = add nsw i32 %149, %129
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %151
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !15
  %154 = add i32 %147, %127
  %155 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %154
  store i32 %153, i32 addrspace(3)* %155, align 4, !tbaa !15
  %156 = srem i32 %60, %3
  %157 = mul nsw i32 %156, %3
  %158 = add i32 %127, %57
  %159 = add nsw i32 %157, %131
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %160
  %162 = load i32, i32 addrspace(1)* %161, align 4, !tbaa !15
  %163 = add i32 %126, %158
  %164 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %163
  store i32 %162, i32 addrspace(3)* %164, align 4, !tbaa !15
  %165 = add nsw i32 %157, %140
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %166
  %168 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !15
  %169 = add i32 %138, %158
  %170 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %169
  store i32 %168, i32 addrspace(3)* %170, align 4, !tbaa !15
  %171 = add nsw i32 %157, %149
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %172
  %174 = load i32, i32 addrspace(1)* %173, align 4, !tbaa !15
  %175 = add i32 %147, %158
  %176 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %175
  store i32 %174, i32 addrspace(3)* %176, align 4, !tbaa !15
  %177 = srem i32 %58, %3
  %178 = mul nsw i32 %177, %3
  %179 = add i32 %127, %61
  %180 = add nsw i32 %178, %131
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %181
  %183 = load i32, i32 addrspace(1)* %182, align 4, !tbaa !15
  %184 = add i32 %126, %179
  %185 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %184
  store i32 %183, i32 addrspace(3)* %185, align 4, !tbaa !15
  %186 = add nsw i32 %178, %140
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %187
  %189 = load i32, i32 addrspace(1)* %188, align 4, !tbaa !15
  %190 = add i32 %138, %179
  %191 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %190
  store i32 %189, i32 addrspace(3)* %191, align 4, !tbaa !15
  %192 = add nsw i32 %178, %149
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %193
  %195 = load i32, i32 addrspace(1)* %194, align 4, !tbaa !15
  %196 = add i32 %147, %179
  %197 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %196
  store i32 %195, i32 addrspace(3)* %197, align 4, !tbaa !15
  %198 = srem i32 %62, %3
  %199 = mul nsw i32 %198, %3
  %200 = add i32 %127, %63
  %201 = add nsw i32 %199, %131
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %202
  %204 = load i32, i32 addrspace(1)* %203, align 4, !tbaa !15
  %205 = add i32 %126, %200
  %206 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %205
  store i32 %204, i32 addrspace(3)* %206, align 4, !tbaa !15
  %207 = add nsw i32 %199, %140
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %208
  %210 = load i32, i32 addrspace(1)* %209, align 4, !tbaa !15
  %211 = add i32 %138, %200
  %212 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %211
  store i32 %210, i32 addrspace(3)* %212, align 4, !tbaa !15
  %213 = add nsw i32 %199, %149
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %214
  %216 = load i32, i32 addrspace(1)* %215, align 4, !tbaa !15
  %217 = add i32 %147, %200
  %218 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %217
  store i32 %216, i32 addrspace(3)* %218, align 4, !tbaa !15
  %219 = srem i32 %64, %3
  %220 = mul nsw i32 %219, %3
  %221 = add i32 %127, %65
  %222 = add nsw i32 %220, %131
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %223
  %225 = load i32, i32 addrspace(1)* %224, align 4, !tbaa !15
  %226 = add i32 %126, %221
  %227 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %226
  store i32 %225, i32 addrspace(3)* %227, align 4, !tbaa !15
  %228 = add nsw i32 %220, %140
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %229
  %231 = load i32, i32 addrspace(1)* %230, align 4, !tbaa !15
  %232 = add i32 %138, %221
  %233 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %232
  store i32 %231, i32 addrspace(3)* %233, align 4, !tbaa !15
  %234 = add nsw i32 %220, %149
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %235
  %237 = add i32 %147, %221
  br label %415

238:                                              ; preds = %122, %118
  %239 = or i32 %117, %18
  %240 = icmp eq i32 %239, 0
  %241 = srem i32 %59, %3
  %242 = mul nsw i32 %241, %3
  br i1 %240, label %243, label %385

243:                                              ; preds = %238
  %244 = sub i32 %21, %104
  %245 = add i32 %23, %104
  %246 = srem i32 %245, %3
  %247 = add nsw i32 %246, %242
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %248
  %250 = load i32, i32 addrspace(1)* %249, align 4, !tbaa !15
  store i32 %250, i32 addrspace(3)* %24, align 4, !tbaa !15
  %251 = add nsw i32 %104, -1
  %252 = add nsw i32 %251, %3
  %253 = srem i32 %252, %3
  %254 = add nsw i32 %253, %242
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %255
  %257 = load i32, i32 addrspace(1)* %256, align 4, !tbaa !15
  store i32 %257, i32 addrspace(3)* %26, align 4, !tbaa !15
  %258 = add nsw i32 %104, %3
  %259 = srem i32 %258, %3
  %260 = add nsw i32 %259, %242
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %261
  %263 = load i32, i32 addrspace(1)* %262, align 4, !tbaa !15
  store i32 %263, i32 addrspace(3)* %22, align 4, !tbaa !15
  %264 = add nsw i32 %104, 1
  %265 = add nsw i32 %264, %3
  %266 = srem i32 %265, %3
  %267 = add nsw i32 %266, %242
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %268
  %270 = load i32, i32 addrspace(1)* %269, align 4, !tbaa !15
  store i32 %270, i32 addrspace(3)* %28, align 4, !tbaa !15
  %271 = add nsw i32 %104, 2
  %272 = add nsw i32 %271, %3
  %273 = srem i32 %272, %3
  %274 = add nsw i32 %273, %242
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %275
  %277 = load i32, i32 addrspace(1)* %276, align 4, !tbaa !15
  store i32 %277, i32 addrspace(3)* %30, align 4, !tbaa !15
  %278 = srem i32 %60, %3
  %279 = mul nsw i32 %278, %3
  %280 = add nsw i32 %279, %246
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %281
  %283 = load i32, i32 addrspace(1)* %282, align 4, !tbaa !15
  store i32 %283, i32 addrspace(3)* %74, align 4, !tbaa !15
  %284 = add nsw i32 %279, %253
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %285
  %287 = load i32, i32 addrspace(1)* %286, align 4, !tbaa !15
  store i32 %287, i32 addrspace(3)* %89, align 4, !tbaa !15
  %288 = add nsw i32 %279, %259
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %289
  %291 = load i32, i32 addrspace(1)* %290, align 4, !tbaa !15
  store i32 %291, i32 addrspace(3)* %67, align 4, !tbaa !15
  %292 = add nsw i32 %279, %266
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %293
  %295 = load i32, i32 addrspace(1)* %294, align 4, !tbaa !15
  store i32 %295, i32 addrspace(3)* %90, align 4, !tbaa !15
  %296 = add nsw i32 %279, %273
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %297
  %299 = load i32, i32 addrspace(1)* %298, align 4, !tbaa !15
  store i32 %299, i32 addrspace(3)* %91, align 4, !tbaa !15
  %300 = srem i32 %58, %3
  %301 = mul nsw i32 %300, %3
  %302 = add i32 %244, %61
  %303 = add nsw i32 %301, %246
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %304
  %306 = load i32, i32 addrspace(1)* %305, align 4, !tbaa !15
  store i32 %306, i32 addrspace(3)* %76, align 4, !tbaa !15
  %307 = add nsw i32 %301, %253
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %308
  %310 = load i32, i32 addrspace(1)* %309, align 4, !tbaa !15
  %311 = add i32 %302, %251
  %312 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %311
  store i32 %310, i32 addrspace(3)* %312, align 4, !tbaa !15
  %313 = add nsw i32 %301, %259
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %314
  %316 = load i32, i32 addrspace(1)* %315, align 4, !tbaa !15
  store i32 %316, i32 addrspace(3)* %69, align 4, !tbaa !15
  %317 = add nsw i32 %301, %266
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %318
  %320 = load i32, i32 addrspace(1)* %319, align 4, !tbaa !15
  %321 = add i32 %302, %264
  %322 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %321
  store i32 %320, i32 addrspace(3)* %322, align 4, !tbaa !15
  %323 = add nsw i32 %301, %273
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %324
  %326 = load i32, i32 addrspace(1)* %325, align 4, !tbaa !15
  %327 = add i32 %302, %271
  %328 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %327
  store i32 %326, i32 addrspace(3)* %328, align 4, !tbaa !15
  %329 = srem i32 %62, %3
  %330 = mul nsw i32 %329, %3
  %331 = add i32 %244, %63
  %332 = add nsw i32 %330, %246
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %333
  %335 = load i32, i32 addrspace(1)* %334, align 4, !tbaa !15
  store i32 %335, i32 addrspace(3)* %78, align 4, !tbaa !15
  %336 = add nsw i32 %330, %253
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %337
  %339 = load i32, i32 addrspace(1)* %338, align 4, !tbaa !15
  %340 = add i32 %331, %251
  %341 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %340
  store i32 %339, i32 addrspace(3)* %341, align 4, !tbaa !15
  %342 = add nsw i32 %330, %259
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %343
  %345 = load i32, i32 addrspace(1)* %344, align 4, !tbaa !15
  store i32 %345, i32 addrspace(3)* %71, align 4, !tbaa !15
  %346 = add nsw i32 %330, %266
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %347
  %349 = load i32, i32 addrspace(1)* %348, align 4, !tbaa !15
  %350 = add i32 %331, %264
  %351 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %350
  store i32 %349, i32 addrspace(3)* %351, align 4, !tbaa !15
  %352 = add nsw i32 %330, %273
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %353
  %355 = load i32, i32 addrspace(1)* %354, align 4, !tbaa !15
  %356 = add i32 %331, %271
  %357 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %356
  store i32 %355, i32 addrspace(3)* %357, align 4, !tbaa !15
  %358 = srem i32 %64, %3
  %359 = mul nsw i32 %358, %3
  %360 = add i32 %244, %65
  %361 = add nsw i32 %359, %246
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %362
  %364 = load i32, i32 addrspace(1)* %363, align 4, !tbaa !15
  store i32 %364, i32 addrspace(3)* %80, align 4, !tbaa !15
  %365 = add nsw i32 %359, %253
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %366
  %368 = load i32, i32 addrspace(1)* %367, align 4, !tbaa !15
  %369 = add i32 %360, %251
  %370 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %369
  store i32 %368, i32 addrspace(3)* %370, align 4, !tbaa !15
  %371 = add nsw i32 %359, %259
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %372
  %374 = load i32, i32 addrspace(1)* %373, align 4, !tbaa !15
  store i32 %374, i32 addrspace(3)* %81, align 4, !tbaa !15
  %375 = add nsw i32 %359, %266
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %376
  %378 = load i32, i32 addrspace(1)* %377, align 4, !tbaa !15
  %379 = add i32 %360, %264
  %380 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %379
  store i32 %378, i32 addrspace(3)* %380, align 4, !tbaa !15
  %381 = add nsw i32 %359, %273
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %382
  %384 = add i32 %360, %271
  br label %415

385:                                              ; preds = %238
  %386 = add nsw i32 %104, %3
  %387 = srem i32 %386, %3
  %388 = add nsw i32 %387, %242
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %389
  %391 = load i32, i32 addrspace(1)* %390, align 4, !tbaa !15
  store i32 %391, i32 addrspace(3)* %22, align 4, !tbaa !15
  %392 = srem i32 %60, %3
  %393 = mul nsw i32 %392, %3
  %394 = add nsw i32 %393, %387
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %395
  %397 = load i32, i32 addrspace(1)* %396, align 4, !tbaa !15
  store i32 %397, i32 addrspace(3)* %67, align 4, !tbaa !15
  %398 = srem i32 %58, %3
  %399 = mul nsw i32 %398, %3
  %400 = add nsw i32 %399, %387
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %401
  %403 = load i32, i32 addrspace(1)* %402, align 4, !tbaa !15
  store i32 %403, i32 addrspace(3)* %69, align 4, !tbaa !15
  %404 = srem i32 %62, %3
  %405 = mul nsw i32 %404, %3
  %406 = add nsw i32 %405, %387
  %407 = sext i32 %406 to i64
  %408 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %407
  %409 = load i32, i32 addrspace(1)* %408, align 4, !tbaa !15
  store i32 %409, i32 addrspace(3)* %71, align 4, !tbaa !15
  %410 = srem i32 %64, %3
  %411 = mul nsw i32 %410, %3
  %412 = add nsw i32 %411, %387
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %413
  br label %415

415:                                              ; preds = %385, %243, %124
  %416 = phi i32 [ %237, %124 ], [ %72, %385 ], [ %384, %243 ]
  %417 = phi i32 addrspace(1)* [ %236, %124 ], [ %414, %385 ], [ %383, %243 ]
  %418 = load i32, i32 addrspace(1)* %417, align 4, !tbaa !15
  %419 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %416
  store i32 %418, i32 addrspace(3)* %419, align 4, !tbaa !15
  br label %420

420:                                              ; preds = %100, %415
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %106, label %421, label %568

421:                                              ; preds = %420
  br i1 %31, label %422, label %428

422:                                              ; preds = %421, %452
  %423 = phi i32 [ %454, %452 ], [ 0, %421 ]
  %424 = phi double [ %453, %452 ], [ 0.000000e+00, %421 ]
  %425 = mul i32 %423, %57
  %426 = add i32 %425, %18
  %427 = mul nsw i32 %423, %2
  br i1 %37, label %431, label %456

428:                                              ; preds = %452, %421
  %429 = phi double [ 0.000000e+00, %421 ], [ %453, %452 ]
  %430 = fcmp contract ogt double %429, 0x3EB0C6F7A0B5ED8D
  br i1 %430, label %550, label %555

431:                                              ; preds = %456, %422
  %432 = phi double [ undef, %422 ], [ %546, %456 ]
  %433 = phi i32 [ 0, %422 ], [ %547, %456 ]
  %434 = phi double [ %424, %422 ], [ %546, %456 ]
  br i1 %39, label %452, label %435

435:                                              ; preds = %431, %435
  %436 = phi i32 [ %449, %435 ], [ %433, %431 ]
  %437 = phi double [ %448, %435 ], [ %434, %431 ]
  %438 = phi i32 [ %450, %435 ], [ 0, %431 ]
  %439 = add i32 %426, %436
  %440 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %439
  %441 = load i32, i32 addrspace(3)* %440, align 4, !tbaa !15
  %442 = sitofp i32 %441 to double
  %443 = add nsw i32 %436, %427
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds double, double addrspace(1)* %1, i64 %444
  %446 = load double, double addrspace(1)* %445, align 8, !tbaa !21, !amdgpu.noclobber !14
  %447 = fmul contract double %446, %442
  %448 = fadd contract double %437, %447
  %449 = add nuw nsw i32 %436, 1
  %450 = add i32 %438, 1
  %451 = icmp eq i32 %450, %36
  br i1 %451, label %452, label %435, !llvm.loop !23

452:                                              ; preds = %435, %431
  %453 = phi double [ %432, %431 ], [ %448, %435 ]
  %454 = add nuw nsw i32 %423, 1
  %455 = icmp eq i32 %454, %2
  br i1 %455, label %428, label %422, !llvm.loop !25

456:                                              ; preds = %422, %456
  %457 = phi i32 [ %547, %456 ], [ 0, %422 ]
  %458 = phi double [ %546, %456 ], [ %424, %422 ]
  %459 = phi i32 [ %548, %456 ], [ 0, %422 ]
  %460 = add i32 %426, %457
  %461 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %460
  %462 = load i32, i32 addrspace(3)* %461, align 4, !tbaa !15
  %463 = sitofp i32 %462 to double
  %464 = add nsw i32 %457, %427
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds double, double addrspace(1)* %1, i64 %465
  %467 = load double, double addrspace(1)* %466, align 8, !tbaa !21, !amdgpu.noclobber !14
  %468 = fmul contract double %467, %463
  %469 = fadd contract double %458, %468
  %470 = or i32 %457, 1
  %471 = add i32 %426, %470
  %472 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %471
  %473 = load i32, i32 addrspace(3)* %472, align 4, !tbaa !15
  %474 = sitofp i32 %473 to double
  %475 = add nsw i32 %470, %427
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds double, double addrspace(1)* %1, i64 %476
  %478 = load double, double addrspace(1)* %477, align 8, !tbaa !21, !amdgpu.noclobber !14
  %479 = fmul contract double %478, %474
  %480 = fadd contract double %469, %479
  %481 = or i32 %457, 2
  %482 = add i32 %426, %481
  %483 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %482
  %484 = load i32, i32 addrspace(3)* %483, align 4, !tbaa !15
  %485 = sitofp i32 %484 to double
  %486 = add nsw i32 %481, %427
  %487 = sext i32 %486 to i64
  %488 = getelementptr inbounds double, double addrspace(1)* %1, i64 %487
  %489 = load double, double addrspace(1)* %488, align 8, !tbaa !21, !amdgpu.noclobber !14
  %490 = fmul contract double %489, %485
  %491 = fadd contract double %480, %490
  %492 = or i32 %457, 3
  %493 = add i32 %426, %492
  %494 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %493
  %495 = load i32, i32 addrspace(3)* %494, align 4, !tbaa !15
  %496 = sitofp i32 %495 to double
  %497 = add nsw i32 %492, %427
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds double, double addrspace(1)* %1, i64 %498
  %500 = load double, double addrspace(1)* %499, align 8, !tbaa !21, !amdgpu.noclobber !14
  %501 = fmul contract double %500, %496
  %502 = fadd contract double %491, %501
  %503 = or i32 %457, 4
  %504 = add i32 %426, %503
  %505 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %504
  %506 = load i32, i32 addrspace(3)* %505, align 4, !tbaa !15
  %507 = sitofp i32 %506 to double
  %508 = add nsw i32 %503, %427
  %509 = sext i32 %508 to i64
  %510 = getelementptr inbounds double, double addrspace(1)* %1, i64 %509
  %511 = load double, double addrspace(1)* %510, align 8, !tbaa !21, !amdgpu.noclobber !14
  %512 = fmul contract double %511, %507
  %513 = fadd contract double %502, %512
  %514 = or i32 %457, 5
  %515 = add i32 %426, %514
  %516 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %515
  %517 = load i32, i32 addrspace(3)* %516, align 4, !tbaa !15
  %518 = sitofp i32 %517 to double
  %519 = add nsw i32 %514, %427
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds double, double addrspace(1)* %1, i64 %520
  %522 = load double, double addrspace(1)* %521, align 8, !tbaa !21, !amdgpu.noclobber !14
  %523 = fmul contract double %522, %518
  %524 = fadd contract double %513, %523
  %525 = or i32 %457, 6
  %526 = add i32 %426, %525
  %527 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %526
  %528 = load i32, i32 addrspace(3)* %527, align 4, !tbaa !15
  %529 = sitofp i32 %528 to double
  %530 = add nsw i32 %525, %427
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds double, double addrspace(1)* %1, i64 %531
  %533 = load double, double addrspace(1)* %532, align 8, !tbaa !21, !amdgpu.noclobber !14
  %534 = fmul contract double %533, %529
  %535 = fadd contract double %524, %534
  %536 = or i32 %457, 7
  %537 = add i32 %426, %536
  %538 = getelementptr inbounds [5140 x i32], [5140 x i32] addrspace(3)* @_ZZ15gpu_update_signPiPdiiS_S_iiE4buff, i32 0, i32 %537
  %539 = load i32, i32 addrspace(3)* %538, align 4, !tbaa !15
  %540 = sitofp i32 %539 to double
  %541 = add nsw i32 %536, %427
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds double, double addrspace(1)* %1, i64 %542
  %544 = load double, double addrspace(1)* %543, align 8, !tbaa !21, !amdgpu.noclobber !14
  %545 = fmul contract double %544, %540
  %546 = fadd contract double %535, %545
  %547 = add nuw nsw i32 %457, 8
  %548 = add i32 %459, 8
  %549 = icmp eq i32 %548, %38
  br i1 %549, label %431, label %456, !llvm.loop !26

550:                                              ; preds = %428
  %551 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !15
  %552 = icmp ne i32 %551, 1
  %553 = zext i1 %552 to i32
  %554 = add nsw i32 %101, %553
  br label %562

555:                                              ; preds = %428
  %556 = fcmp contract olt double %429, 0xBEB0C6F7A0B5ED8D
  %557 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !15
  br i1 %556, label %558, label %562

558:                                              ; preds = %555
  %559 = icmp ne i32 %557, -1
  %560 = zext i1 %559 to i32
  %561 = add nsw i32 %101, %560
  br label %562

562:                                              ; preds = %555, %558, %550
  %563 = phi i32 [ 1, %550 ], [ -1, %558 ], [ %557, %555 ]
  %564 = phi i32 [ %554, %550 ], [ %561, %558 ], [ %101, %555 ]
  %565 = add nsw i32 %85, %104
  %566 = sext i32 %565 to i64
  %567 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %566
  store i32 %563, i32 addrspace(1)* %567, align 4, !tbaa !15
  br label %568

568:                                              ; preds = %562, %420
  %569 = phi i32 [ %564, %562 ], [ %101, %420 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %570 = add nuw nsw i32 %102, 1
  %571 = icmp eq i32 %570, %7
  br i1 %571, label %96, label %100, !llvm.loop !27
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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = !{!22, !22, i64 0}
!22 = !{!"double", !17, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !20}
!26 = distinct !{!26, !20}
!27 = distinct !{!27, !20}
