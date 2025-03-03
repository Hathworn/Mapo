; ModuleID = '../data/hip_kernels/14036/0/main.cu'
source_filename = "../data/hip_kernels/14036/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @updateCenters(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #1 {
  %5 = alloca [784 x float], align 16, addrspace(5)
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = bitcast [784 x float] addrspace(5)* %5 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 3136, i8 addrspace(5)* %15) #3
  %16 = mul nsw i32 %14, 784
  br label %17

17:                                               ; preds = %17, %4
  %18 = phi i32 [ 0, %4 ], [ %114, %17 ]
  %19 = add nsw i32 %18, %16
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %18
  store float %22, float addrspace(5)* %23, align 16, !tbaa !7
  %24 = or i32 %18, 1
  %25 = add nsw i32 %24, %16
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %24
  store float %28, float addrspace(5)* %29, align 4, !tbaa !7
  %30 = or i32 %18, 2
  %31 = add nsw i32 %30, %16
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %30
  store float %34, float addrspace(5)* %35, align 8, !tbaa !7
  %36 = or i32 %18, 3
  %37 = add nsw i32 %36, %16
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %36
  store float %40, float addrspace(5)* %41, align 4, !tbaa !7
  %42 = or i32 %18, 4
  %43 = add nsw i32 %42, %16
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %42
  store float %46, float addrspace(5)* %47, align 16, !tbaa !7
  %48 = or i32 %18, 5
  %49 = add nsw i32 %48, %16
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %48
  store float %52, float addrspace(5)* %53, align 4, !tbaa !7
  %54 = or i32 %18, 6
  %55 = add nsw i32 %54, %16
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %54
  store float %58, float addrspace(5)* %59, align 8, !tbaa !7
  %60 = or i32 %18, 7
  %61 = add nsw i32 %60, %16
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %60
  store float %64, float addrspace(5)* %65, align 4, !tbaa !7
  %66 = or i32 %18, 8
  %67 = add nsw i32 %66, %16
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %66
  store float %70, float addrspace(5)* %71, align 16, !tbaa !7
  %72 = or i32 %18, 9
  %73 = add nsw i32 %72, %16
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %72
  store float %76, float addrspace(5)* %77, align 4, !tbaa !7
  %78 = or i32 %18, 10
  %79 = add nsw i32 %78, %16
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %78
  store float %82, float addrspace(5)* %83, align 8, !tbaa !7
  %84 = or i32 %18, 11
  %85 = add nsw i32 %84, %16
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %84
  store float %88, float addrspace(5)* %89, align 4, !tbaa !7
  %90 = or i32 %18, 12
  %91 = add nsw i32 %90, %16
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %90
  store float %94, float addrspace(5)* %95, align 16, !tbaa !7
  %96 = or i32 %18, 13
  %97 = add nsw i32 %96, %16
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %96
  store float %100, float addrspace(5)* %101, align 4, !tbaa !7
  %102 = or i32 %18, 14
  %103 = add nsw i32 %102, %16
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %102
  store float %106, float addrspace(5)* %107, align 8, !tbaa !7
  %108 = or i32 %18, 15
  %109 = add nsw i32 %108, %16
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %108
  store float %112, float addrspace(5)* %113, align 4, !tbaa !7
  %114 = add nuw nsw i32 %18, 16
  %115 = icmp eq i32 %114, 784
  br i1 %115, label %116, label %17, !llvm.loop !11

116:                                              ; preds = %17, %285
  %117 = phi i32 [ %289, %285 ], [ 0, %17 ]
  %118 = phi i32 [ %288, %285 ], [ -1, %17 ]
  %119 = phi float [ %287, %285 ], [ 1.000000e+08, %17 ]
  %120 = mul nuw nsw i32 %117, 784
  br label %121

121:                                              ; preds = %121, %116
  %122 = phi float [ 0.000000e+00, %116 ], [ %282, %121 ]
  %123 = phi i32 [ 0, %116 ], [ %283, %121 ]
  %124 = add nuw nsw i32 %123, %120
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %123
  %129 = load float, float addrspace(5)* %128, align 16, !tbaa !7
  %130 = fsub contract float %127, %129
  %131 = fmul contract float %130, %130
  %132 = fadd contract float %122, %131
  %133 = or i32 %123, 1
  %134 = add nuw nsw i32 %133, %120
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %133
  %139 = load float, float addrspace(5)* %138, align 4, !tbaa !7
  %140 = fsub contract float %137, %139
  %141 = fmul contract float %140, %140
  %142 = fadd contract float %132, %141
  %143 = or i32 %123, 2
  %144 = add nuw nsw i32 %143, %120
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !5
  %148 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %143
  %149 = load float, float addrspace(5)* %148, align 8, !tbaa !7
  %150 = fsub contract float %147, %149
  %151 = fmul contract float %150, %150
  %152 = fadd contract float %142, %151
  %153 = or i32 %123, 3
  %154 = add nuw nsw i32 %153, %120
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %153
  %159 = load float, float addrspace(5)* %158, align 4, !tbaa !7
  %160 = fsub contract float %157, %159
  %161 = fmul contract float %160, %160
  %162 = fadd contract float %152, %161
  %163 = or i32 %123, 4
  %164 = add nuw nsw i32 %163, %120
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %163
  %169 = load float, float addrspace(5)* %168, align 16, !tbaa !7
  %170 = fsub contract float %167, %169
  %171 = fmul contract float %170, %170
  %172 = fadd contract float %162, %171
  %173 = or i32 %123, 5
  %174 = add nuw nsw i32 %173, %120
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %0, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !7, !amdgpu.noclobber !5
  %178 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %173
  %179 = load float, float addrspace(5)* %178, align 4, !tbaa !7
  %180 = fsub contract float %177, %179
  %181 = fmul contract float %180, %180
  %182 = fadd contract float %172, %181
  %183 = or i32 %123, 6
  %184 = add nuw nsw i32 %183, %120
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %0, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !7, !amdgpu.noclobber !5
  %188 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %183
  %189 = load float, float addrspace(5)* %188, align 8, !tbaa !7
  %190 = fsub contract float %187, %189
  %191 = fmul contract float %190, %190
  %192 = fadd contract float %182, %191
  %193 = or i32 %123, 7
  %194 = add nuw nsw i32 %193, %120
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %0, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !7, !amdgpu.noclobber !5
  %198 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %193
  %199 = load float, float addrspace(5)* %198, align 4, !tbaa !7
  %200 = fsub contract float %197, %199
  %201 = fmul contract float %200, %200
  %202 = fadd contract float %192, %201
  %203 = or i32 %123, 8
  %204 = add nuw nsw i32 %203, %120
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %0, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !7, !amdgpu.noclobber !5
  %208 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %203
  %209 = load float, float addrspace(5)* %208, align 16, !tbaa !7
  %210 = fsub contract float %207, %209
  %211 = fmul contract float %210, %210
  %212 = fadd contract float %202, %211
  %213 = or i32 %123, 9
  %214 = add nuw nsw i32 %213, %120
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !7, !amdgpu.noclobber !5
  %218 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %213
  %219 = load float, float addrspace(5)* %218, align 4, !tbaa !7
  %220 = fsub contract float %217, %219
  %221 = fmul contract float %220, %220
  %222 = fadd contract float %212, %221
  %223 = or i32 %123, 10
  %224 = add nuw nsw i32 %223, %120
  %225 = zext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %0, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !7, !amdgpu.noclobber !5
  %228 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %223
  %229 = load float, float addrspace(5)* %228, align 8, !tbaa !7
  %230 = fsub contract float %227, %229
  %231 = fmul contract float %230, %230
  %232 = fadd contract float %222, %231
  %233 = or i32 %123, 11
  %234 = add nuw nsw i32 %233, %120
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %0, i64 %235
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !7, !amdgpu.noclobber !5
  %238 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %233
  %239 = load float, float addrspace(5)* %238, align 4, !tbaa !7
  %240 = fsub contract float %237, %239
  %241 = fmul contract float %240, %240
  %242 = fadd contract float %232, %241
  %243 = or i32 %123, 12
  %244 = add nuw nsw i32 %243, %120
  %245 = zext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %0, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7, !amdgpu.noclobber !5
  %248 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %243
  %249 = load float, float addrspace(5)* %248, align 16, !tbaa !7
  %250 = fsub contract float %247, %249
  %251 = fmul contract float %250, %250
  %252 = fadd contract float %242, %251
  %253 = or i32 %123, 13
  %254 = add nuw nsw i32 %253, %120
  %255 = zext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %0, i64 %255
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !7, !amdgpu.noclobber !5
  %258 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %253
  %259 = load float, float addrspace(5)* %258, align 4, !tbaa !7
  %260 = fsub contract float %257, %259
  %261 = fmul contract float %260, %260
  %262 = fadd contract float %252, %261
  %263 = or i32 %123, 14
  %264 = add nuw nsw i32 %263, %120
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds float, float addrspace(1)* %0, i64 %265
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !7, !amdgpu.noclobber !5
  %268 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %263
  %269 = load float, float addrspace(5)* %268, align 8, !tbaa !7
  %270 = fsub contract float %267, %269
  %271 = fmul contract float %270, %270
  %272 = fadd contract float %262, %271
  %273 = or i32 %123, 15
  %274 = add nuw nsw i32 %273, %120
  %275 = zext i32 %274 to i64
  %276 = getelementptr inbounds float, float addrspace(1)* %0, i64 %275
  %277 = load float, float addrspace(1)* %276, align 4, !tbaa !7, !amdgpu.noclobber !5
  %278 = getelementptr inbounds [784 x float], [784 x float] addrspace(5)* %5, i32 0, i32 %273
  %279 = load float, float addrspace(5)* %278, align 4, !tbaa !7
  %280 = fsub contract float %277, %279
  %281 = fmul contract float %280, %280
  %282 = fadd contract float %272, %281
  %283 = add nuw nsw i32 %123, 16
  %284 = icmp eq i32 %283, 784
  br i1 %284, label %285, label %121, !llvm.loop !13

285:                                              ; preds = %121
  %286 = fcmp contract olt float %282, %119
  %287 = select i1 %286, float %282, float %119
  %288 = select i1 %286, i32 %117, i32 %118
  %289 = add nuw nsw i32 %117, 1
  %290 = icmp eq i32 %289, 100
  br i1 %290, label %291, label %116, !llvm.loop !14

291:                                              ; preds = %285
  %292 = sext i32 %14 to i64
  %293 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %292
  store i32 %288, i32 addrspace(1)* %293, align 4, !tbaa !15
  call void @llvm.lifetime.end.p5i8(i64 3136, i8 addrspace(5)* %15) #3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !9, i64 0}
