; ModuleID = '../data/hip_kernels/1044/0/main.cu'
source_filename = "../data/hip_kernels/1044/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }

@cm = protected addrspace(4) externally_initialized global [9 x float] zeroinitializer, align 16
@.str = private unnamed_addr addrspace(4) constant [30 x i8] c"cID : %d, tID : %d, gID : %d\0A\00", align 1
@_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm = internal unnamed_addr addrspace(3) global [340 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([9 x float] addrspace(4)* @cm to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z11conv_kernelPKfPfiiiiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #1 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !7
  %22 = udiv i32 %21, %18
  %23 = mul i32 %22, %18
  %24 = icmp ugt i32 %21, %23
  %25 = zext i1 %24 to i32
  %26 = sdiv i32 %5, %18
  %27 = sub i32 %22, %26
  %28 = add i32 %27, %25
  %29 = icmp slt i32 %13, %28
  %30 = add nsw i32 %13, 1
  %31 = srem i32 %30, %26
  %32 = icmp ne i32 %31, 0
  %33 = freeze i32 %13
  %34 = freeze i32 %26
  %35 = sdiv i32 %33, %34
  %36 = mul i32 %35, %34
  %37 = sub i32 %33, %36
  %38 = mul nsw i32 %35, %2
  %39 = mul nsw i32 %38, %5
  %40 = mul nsw i32 %37, %18
  %41 = add i32 %40, %12
  %42 = add i32 %41, %39
  %43 = icmp sgt i32 %10, 0
  br i1 %43, label %44, label %57

44:                                               ; preds = %11
  %45 = add nsw i32 %18, -1
  %46 = icmp ne i32 %12, %45
  %47 = xor i1 %32, true
  %48 = select i1 %47, i1 true, i1 %46
  %49 = icmp eq i32 %10, 1
  %50 = select i1 %48, i1 true, i1 %49
  %51 = add i32 %10, -1
  %52 = add i32 %10, -2
  %53 = and i32 %51, 7
  %54 = icmp ult i32 %52, 7
  %55 = and i32 %51, -8
  %56 = icmp eq i32 %53, 0
  br label %59

57:                                               ; preds = %145, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = select i1 %29, i1 %32, i1 false
  br i1 %58, label %148, label %970

59:                                               ; preds = %44, %145
  %60 = phi i32 [ 0, %44 ], [ %146, %145 ]
  %61 = mul nsw i32 %60, %9
  %62 = add nsw i32 %61, %12
  %63 = mul nsw i32 %60, %5
  %64 = add nsw i32 %63, %42
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16, !amdgpu.noclobber !6
  %68 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %62
  store float %67, float addrspace(3)* %68, align 4, !tbaa !16
  br i1 %50, label %145, label %69

69:                                               ; preds = %59
  br i1 %54, label %131, label %70

70:                                               ; preds = %69, %70
  %71 = phi i32 [ %128, %70 ], [ 1, %69 ]
  %72 = phi i32 [ %129, %70 ], [ 0, %69 ]
  %73 = add nsw i32 %71, %62
  %74 = add nsw i32 %71, %64
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16, !amdgpu.noclobber !6
  %78 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %73
  store float %77, float addrspace(3)* %78, align 4, !tbaa !16
  %79 = add nuw nsw i32 %71, 1
  %80 = add nsw i32 %79, %62
  %81 = add nsw i32 %79, %64
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16, !amdgpu.noclobber !6
  %85 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %80
  store float %84, float addrspace(3)* %85, align 4, !tbaa !16
  %86 = add nuw nsw i32 %71, 2
  %87 = add nsw i32 %86, %62
  %88 = add nsw i32 %86, %64
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16, !amdgpu.noclobber !6
  %92 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %87
  store float %91, float addrspace(3)* %92, align 4, !tbaa !16
  %93 = add nuw nsw i32 %71, 3
  %94 = add nsw i32 %93, %62
  %95 = add nsw i32 %93, %64
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16, !amdgpu.noclobber !6
  %99 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %94
  store float %98, float addrspace(3)* %99, align 4, !tbaa !16
  %100 = add nuw nsw i32 %71, 4
  %101 = add nsw i32 %100, %62
  %102 = add nsw i32 %100, %64
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16, !amdgpu.noclobber !6
  %106 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %101
  store float %105, float addrspace(3)* %106, align 4, !tbaa !16
  %107 = add nuw nsw i32 %71, 5
  %108 = add nsw i32 %107, %62
  %109 = add nsw i32 %107, %64
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16, !amdgpu.noclobber !6
  %113 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %108
  store float %112, float addrspace(3)* %113, align 4, !tbaa !16
  %114 = add nuw nsw i32 %71, 6
  %115 = add nsw i32 %114, %62
  %116 = add nsw i32 %114, %64
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16, !amdgpu.noclobber !6
  %120 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %115
  store float %119, float addrspace(3)* %120, align 4, !tbaa !16
  %121 = add nuw nsw i32 %71, 7
  %122 = add nsw i32 %121, %62
  %123 = add nsw i32 %121, %64
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16, !amdgpu.noclobber !6
  %127 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %122
  store float %126, float addrspace(3)* %127, align 4, !tbaa !16
  %128 = add nuw nsw i32 %71, 8
  %129 = add i32 %72, 8
  %130 = icmp eq i32 %129, %55
  br i1 %130, label %131, label %70, !llvm.loop !20

131:                                              ; preds = %70, %69
  %132 = phi i32 [ 1, %69 ], [ %128, %70 ]
  br i1 %56, label %145, label %133

133:                                              ; preds = %131, %133
  %134 = phi i32 [ %142, %133 ], [ %132, %131 ]
  %135 = phi i32 [ %143, %133 ], [ 0, %131 ]
  %136 = add nsw i32 %134, %62
  %137 = add nsw i32 %134, %64
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !16, !amdgpu.noclobber !6
  %141 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %136
  store float %140, float addrspace(3)* %141, align 4, !tbaa !16
  %142 = add nuw nsw i32 %134, 1
  %143 = add i32 %135, 1
  %144 = icmp eq i32 %143, %53
  br i1 %144, label %145, label %133, !llvm.loop !22

145:                                              ; preds = %131, %133, %59
  %146 = add nuw nsw i32 %60, 1
  %147 = icmp eq i32 %146, %10
  br i1 %147, label %57, label %59, !llvm.loop !24

148:                                              ; preds = %57
  %149 = add nsw i32 %10, %2
  %150 = add nsw i32 %149, -1
  %151 = icmp sgt i32 %2, 0
  br i1 %151, label %152, label %3442

152:                                              ; preds = %148
  %153 = add nsw i32 %18, -1
  %154 = icmp ne i32 %12, %153
  %155 = icmp slt i32 %10, 2
  %156 = mul i32 %10, %10
  %157 = icmp eq i32 %10, 0
  %158 = mul nsw i32 %7, %6
  %159 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %160 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 24
  %161 = bitcast i8 addrspace(4)* %160 to i64 addrspace(4)*
  %162 = zext i32 %12 to i64
  %163 = zext i32 %42 to i64
  %164 = tail call i32 @llvm.umax.i32(i32 %156, i32 1)
  %165 = select i1 %154, i1 true, i1 %155
  %166 = add i32 %10, -1
  %167 = add i32 %10, -2
  %168 = add i32 %164, -1
  %169 = and i32 %166, 7
  %170 = icmp ult i32 %167, 7
  %171 = and i32 %166, -8
  %172 = icmp eq i32 %169, 0
  %173 = and i32 %10, 7
  %174 = icmp ult i32 %166, 7
  %175 = and i32 %10, -8
  %176 = icmp eq i32 %173, 0
  %177 = and i32 %164, 7
  %178 = icmp ult i32 %168, 7
  %179 = and i32 %164, -8
  %180 = icmp eq i32 %177, 0
  %181 = and i32 %166, 7
  %182 = icmp ult i32 %167, 7
  %183 = and i32 %166, -8
  %184 = icmp eq i32 %181, 0
  br label %185

185:                                              ; preds = %967, %152
  %186 = phi <9 x float> [ undef, %152 ], [ %275, %967 ]
  %187 = phi i32 [ %10, %152 ], [ %968, %967 ]
  %188 = phi float [ undef, %152 ], [ %270, %967 ]
  %189 = phi <3 x float> [ undef, %152 ], [ %269, %967 ]
  %190 = icmp slt i32 %187, %149
  br i1 %190, label %191, label %268

191:                                              ; preds = %185
  %192 = mul nsw i32 %187, %5
  %193 = add nsw i32 %192, %42
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %0, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !16
  br i1 %165, label %268, label %197

197:                                              ; preds = %191
  br i1 %170, label %252, label %198

198:                                              ; preds = %197, %198
  %199 = phi i32 [ %249, %198 ], [ 1, %197 ]
  %200 = phi <3 x float> [ %248, %198 ], [ %189, %197 ]
  %201 = phi i32 [ %250, %198 ], [ 0, %197 ]
  %202 = add nsw i32 %199, %193
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %0, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !16
  %206 = insertelement <3 x float> %200, float %205, i32 %199
  %207 = add nuw nsw i32 %199, 1
  %208 = add nsw i32 %207, %193
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %0, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !16
  %212 = insertelement <3 x float> %206, float %211, i32 %207
  %213 = add nuw nsw i32 %199, 2
  %214 = add nsw i32 %213, %193
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !16
  %218 = insertelement <3 x float> %212, float %217, i32 %213
  %219 = add nuw nsw i32 %199, 3
  %220 = add nsw i32 %219, %193
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %0, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !16
  %224 = insertelement <3 x float> %218, float %223, i32 %219
  %225 = add nuw nsw i32 %199, 4
  %226 = add nsw i32 %225, %193
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds float, float addrspace(1)* %0, i64 %227
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !16
  %230 = insertelement <3 x float> %224, float %229, i32 %225
  %231 = add nuw nsw i32 %199, 5
  %232 = add nsw i32 %231, %193
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !16
  %236 = insertelement <3 x float> %230, float %235, i32 %231
  %237 = add nuw nsw i32 %199, 6
  %238 = add nsw i32 %237, %193
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %0, i64 %239
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !16
  %242 = insertelement <3 x float> %236, float %241, i32 %237
  %243 = add nuw nsw i32 %199, 7
  %244 = add nsw i32 %243, %193
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %0, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !16
  %248 = insertelement <3 x float> %242, float %247, i32 %243
  %249 = add nuw nsw i32 %199, 8
  %250 = add i32 %201, 8
  %251 = icmp eq i32 %250, %171
  br i1 %251, label %252, label %198, !llvm.loop !25

252:                                              ; preds = %198, %197
  %253 = phi <3 x float> [ undef, %197 ], [ %248, %198 ]
  %254 = phi i32 [ 1, %197 ], [ %249, %198 ]
  %255 = phi <3 x float> [ %189, %197 ], [ %248, %198 ]
  br i1 %172, label %268, label %256

256:                                              ; preds = %252, %256
  %257 = phi i32 [ %265, %256 ], [ %254, %252 ]
  %258 = phi <3 x float> [ %264, %256 ], [ %255, %252 ]
  %259 = phi i32 [ %266, %256 ], [ 0, %252 ]
  %260 = add nsw i32 %257, %193
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %0, i64 %261
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !16
  %264 = insertelement <3 x float> %258, float %263, i32 %257
  %265 = add nuw nsw i32 %257, 1
  %266 = add i32 %259, 1
  %267 = icmp eq i32 %266, %169
  br i1 %267, label %268, label %256, !llvm.loop !26

268:                                              ; preds = %252, %256, %191, %185
  %269 = phi <3 x float> [ %189, %185 ], [ %189, %191 ], [ %253, %252 ], [ %264, %256 ]
  %270 = phi float [ %188, %185 ], [ %196, %191 ], [ %196, %256 ], [ %196, %252 ]
  %271 = sub nsw i32 %187, %10
  br i1 %43, label %272, label %274

272:                                              ; preds = %268
  %273 = sub i32 %10, %187
  br label %277

274:                                              ; preds = %300, %268
  %275 = phi <9 x float> [ %186, %268 ], [ %301, %300 ]
  br i1 %157, label %375, label %276

276:                                              ; preds = %274
  br i1 %178, label %358, label %383

277:                                              ; preds = %300, %272
  %278 = phi <9 x float> [ %186, %272 ], [ %301, %300 ]
  %279 = phi i32 [ %271, %272 ], [ %302, %300 ]
  %280 = mul nsw i32 %279, %9
  %281 = add nsw i32 %280, %12
  %282 = add i32 %273, %279
  %283 = mul nsw i32 %282, %10
  br i1 %174, label %284, label %304

284:                                              ; preds = %304, %277
  %285 = phi <9 x float> [ undef, %277 ], [ %354, %304 ]
  %286 = phi <9 x float> [ %278, %277 ], [ %354, %304 ]
  %287 = phi i32 [ 0, %277 ], [ %355, %304 ]
  br i1 %176, label %300, label %288

288:                                              ; preds = %284, %288
  %289 = phi <9 x float> [ %296, %288 ], [ %286, %284 ]
  %290 = phi i32 [ %297, %288 ], [ %287, %284 ]
  %291 = phi i32 [ %298, %288 ], [ 0, %284 ]
  %292 = add nsw i32 %281, %290
  %293 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %292
  %294 = load float, float addrspace(3)* %293, align 4, !tbaa !16
  %295 = add nsw i32 %290, %283
  %296 = insertelement <9 x float> %289, float %294, i32 %295
  %297 = add nuw nsw i32 %290, 1
  %298 = add i32 %291, 1
  %299 = icmp eq i32 %298, %173
  br i1 %299, label %300, label %288, !llvm.loop !27

300:                                              ; preds = %288, %284
  %301 = phi <9 x float> [ %285, %284 ], [ %296, %288 ]
  %302 = add nsw i32 %279, 1
  %303 = icmp slt i32 %302, %187
  br i1 %303, label %277, label %274, !llvm.loop !28

304:                                              ; preds = %277, %304
  %305 = phi <9 x float> [ %354, %304 ], [ %278, %277 ]
  %306 = phi i32 [ %355, %304 ], [ 0, %277 ]
  %307 = phi i32 [ %356, %304 ], [ 0, %277 ]
  %308 = add nsw i32 %281, %306
  %309 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %308
  %310 = load float, float addrspace(3)* %309, align 4, !tbaa !16
  %311 = add nsw i32 %306, %283
  %312 = insertelement <9 x float> %305, float %310, i32 %311
  %313 = or i32 %306, 1
  %314 = add nsw i32 %281, %313
  %315 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %314
  %316 = load float, float addrspace(3)* %315, align 4, !tbaa !16
  %317 = add nsw i32 %313, %283
  %318 = insertelement <9 x float> %312, float %316, i32 %317
  %319 = or i32 %306, 2
  %320 = add nsw i32 %281, %319
  %321 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %320
  %322 = load float, float addrspace(3)* %321, align 4, !tbaa !16
  %323 = add nsw i32 %319, %283
  %324 = insertelement <9 x float> %318, float %322, i32 %323
  %325 = or i32 %306, 3
  %326 = add nsw i32 %281, %325
  %327 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %326
  %328 = load float, float addrspace(3)* %327, align 4, !tbaa !16
  %329 = add nsw i32 %325, %283
  %330 = insertelement <9 x float> %324, float %328, i32 %329
  %331 = or i32 %306, 4
  %332 = add nsw i32 %281, %331
  %333 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %332
  %334 = load float, float addrspace(3)* %333, align 4, !tbaa !16
  %335 = add nsw i32 %331, %283
  %336 = insertelement <9 x float> %330, float %334, i32 %335
  %337 = or i32 %306, 5
  %338 = add nsw i32 %281, %337
  %339 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %338
  %340 = load float, float addrspace(3)* %339, align 4, !tbaa !16
  %341 = add nsw i32 %337, %283
  %342 = insertelement <9 x float> %336, float %340, i32 %341
  %343 = or i32 %306, 6
  %344 = add nsw i32 %281, %343
  %345 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %344
  %346 = load float, float addrspace(3)* %345, align 4, !tbaa !16
  %347 = add nsw i32 %343, %283
  %348 = insertelement <9 x float> %342, float %346, i32 %347
  %349 = or i32 %306, 7
  %350 = add nsw i32 %281, %349
  %351 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %350
  %352 = load float, float addrspace(3)* %351, align 4, !tbaa !16
  %353 = add nsw i32 %349, %283
  %354 = insertelement <9 x float> %348, float %352, i32 %353
  %355 = add nuw nsw i32 %306, 8
  %356 = add i32 %307, 8
  %357 = icmp eq i32 %356, %175
  br i1 %357, label %284, label %304, !llvm.loop !29

358:                                              ; preds = %383, %276
  %359 = phi float [ undef, %276 ], [ %441, %383 ]
  %360 = phi i32 [ 0, %276 ], [ %442, %383 ]
  %361 = phi float [ 0.000000e+00, %276 ], [ %441, %383 ]
  br i1 %180, label %375, label %362

362:                                              ; preds = %358, %362
  %363 = phi i32 [ %372, %362 ], [ %360, %358 ]
  %364 = phi float [ %371, %362 ], [ %361, %358 ]
  %365 = phi i32 [ %373, %362 ], [ 0, %358 ]
  %366 = zext i32 %363 to i64
  %367 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %366
  %368 = load float, float addrspace(4)* %367, align 4, !tbaa !16
  %369 = extractelement <9 x float> %275, i32 %363
  %370 = fmul contract float %369, %368
  %371 = fadd contract float %364, %370
  %372 = add nuw nsw i32 %363, 1
  %373 = add i32 %365, 1
  %374 = icmp eq i32 %373, %177
  br i1 %374, label %375, label %362, !llvm.loop !30

375:                                              ; preds = %358, %362, %274
  %376 = phi float [ 0.000000e+00, %274 ], [ %359, %358 ], [ %371, %362 ]
  %377 = add nsw i32 %271, %38
  %378 = mul nsw i32 %377, %7
  %379 = add i32 %41, %378
  %380 = icmp sgt i32 %379, -1
  %381 = icmp slt i32 %379, %158
  %382 = select i1 %380, i1 %381, i1 false
  br i1 %382, label %911, label %445

383:                                              ; preds = %276, %383
  %384 = phi i32 [ %442, %383 ], [ 0, %276 ]
  %385 = phi float [ %441, %383 ], [ 0.000000e+00, %276 ]
  %386 = phi i32 [ %443, %383 ], [ 0, %276 ]
  %387 = zext i32 %384 to i64
  %388 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %387
  %389 = load float, float addrspace(4)* %388, align 16, !tbaa !16
  %390 = extractelement <9 x float> %275, i32 %384
  %391 = fmul contract float %390, %389
  %392 = fadd contract float %385, %391
  %393 = or i32 %384, 1
  %394 = zext i32 %393 to i64
  %395 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %394
  %396 = load float, float addrspace(4)* %395, align 4, !tbaa !16
  %397 = extractelement <9 x float> %275, i32 %393
  %398 = fmul contract float %397, %396
  %399 = fadd contract float %392, %398
  %400 = or i32 %384, 2
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %401
  %403 = load float, float addrspace(4)* %402, align 8, !tbaa !16
  %404 = extractelement <9 x float> %275, i32 %400
  %405 = fmul contract float %404, %403
  %406 = fadd contract float %399, %405
  %407 = or i32 %384, 3
  %408 = zext i32 %407 to i64
  %409 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %408
  %410 = load float, float addrspace(4)* %409, align 4, !tbaa !16
  %411 = extractelement <9 x float> %275, i32 %407
  %412 = fmul contract float %411, %410
  %413 = fadd contract float %406, %412
  %414 = or i32 %384, 4
  %415 = zext i32 %414 to i64
  %416 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %415
  %417 = load float, float addrspace(4)* %416, align 16, !tbaa !16
  %418 = extractelement <9 x float> %275, i32 %414
  %419 = fmul contract float %418, %417
  %420 = fadd contract float %413, %419
  %421 = or i32 %384, 5
  %422 = zext i32 %421 to i64
  %423 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %422
  %424 = load float, float addrspace(4)* %423, align 4, !tbaa !16
  %425 = extractelement <9 x float> %275, i32 %421
  %426 = fmul contract float %425, %424
  %427 = fadd contract float %420, %426
  %428 = or i32 %384, 6
  %429 = zext i32 %428 to i64
  %430 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %429
  %431 = load float, float addrspace(4)* %430, align 8, !tbaa !16
  %432 = extractelement <9 x float> %275, i32 %428
  %433 = fmul contract float %432, %431
  %434 = fadd contract float %427, %433
  %435 = or i32 %384, 7
  %436 = zext i32 %435 to i64
  %437 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %436
  %438 = load float, float addrspace(4)* %437, align 4, !tbaa !16
  %439 = extractelement <9 x float> %275, i32 %435
  %440 = fmul contract float %439, %438
  %441 = fadd contract float %434, %440
  %442 = add nuw nsw i32 %384, 8
  %443 = add i32 %386, 8
  %444 = icmp eq i32 %443, %179
  br i1 %444, label %358, label %383, !llvm.loop !31

445:                                              ; preds = %375
  %446 = load i64, i64 addrspace(4)* %161, align 8, !tbaa !32
  %447 = inttoptr i64 %446 to i8 addrspace(1)*
  %448 = addrspacecast i8 addrspace(1)* %447 to i8*
  %449 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %448, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %450 = extractelement <2 x i64> %449, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %451, label %455

451:                                              ; preds = %445
  %452 = and i64 %450, -225
  %453 = or i64 %452, 32
  %454 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %448, i64 noundef %453, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %896

455:                                              ; preds = %445
  %456 = and i64 %450, 2
  %457 = and i64 %450, -3
  %458 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %457, i64 0
  br label %459

459:                                              ; preds = %885, %455
  %460 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 29) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([30 x i8]* addrspacecast ([30 x i8] addrspace(4)* @.str to [30 x i8]*) to i64)), i64 1))), %455 ], [ %893, %885 ]
  %461 = phi i8 addrspace(4)* [ getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0), %455 ], [ %894, %885 ]
  %462 = phi <2 x i64> [ %458, %455 ], [ %892, %885 ]
  %463 = icmp ugt i64 %460, 56
  %464 = extractelement <2 x i64> %462, i64 0
  %465 = or i64 %464, %456
  %466 = insertelement <2 x i64> poison, i64 %465, i64 0
  %467 = select i1 %463, <2 x i64> %462, <2 x i64> %466
  %468 = tail call i64 @llvm.umin.i64(i64 %460, i64 56)
  %469 = trunc i64 %468 to i32
  %470 = extractelement <2 x i64> %467, i64 0
  %471 = icmp ugt i32 %469, 7
  br i1 %471, label %474, label %472

472:                                              ; preds = %459
  %473 = icmp eq i32 %469, 0
  br i1 %473, label %527, label %514

474:                                              ; preds = %459
  %475 = load i8, i8 addrspace(4)* %461, align 1, !tbaa !33
  %476 = zext i8 %475 to i64
  %477 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 1
  %478 = load i8, i8 addrspace(4)* %477, align 1, !tbaa !33
  %479 = zext i8 %478 to i64
  %480 = shl nuw nsw i64 %479, 8
  %481 = or i64 %480, %476
  %482 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 2
  %483 = load i8, i8 addrspace(4)* %482, align 1, !tbaa !33
  %484 = zext i8 %483 to i64
  %485 = shl nuw nsw i64 %484, 16
  %486 = or i64 %481, %485
  %487 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 3
  %488 = load i8, i8 addrspace(4)* %487, align 1, !tbaa !33
  %489 = zext i8 %488 to i64
  %490 = shl nuw nsw i64 %489, 24
  %491 = or i64 %486, %490
  %492 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 4
  %493 = load i8, i8 addrspace(4)* %492, align 1, !tbaa !33
  %494 = zext i8 %493 to i64
  %495 = shl nuw nsw i64 %494, 32
  %496 = or i64 %491, %495
  %497 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 5
  %498 = load i8, i8 addrspace(4)* %497, align 1, !tbaa !33
  %499 = zext i8 %498 to i64
  %500 = shl nuw nsw i64 %499, 40
  %501 = or i64 %496, %500
  %502 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 6
  %503 = load i8, i8 addrspace(4)* %502, align 1, !tbaa !33
  %504 = zext i8 %503 to i64
  %505 = shl nuw nsw i64 %504, 48
  %506 = or i64 %501, %505
  %507 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 7
  %508 = load i8, i8 addrspace(4)* %507, align 1, !tbaa !33
  %509 = zext i8 %508 to i64
  %510 = shl nuw i64 %509, 56
  %511 = or i64 %506, %510
  %512 = add nsw i32 %469, -8
  %513 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 8
  br label %527

514:                                              ; preds = %472, %514
  %515 = phi i32 [ %525, %514 ], [ 0, %472 ]
  %516 = phi i64 [ %524, %514 ], [ 0, %472 ]
  %517 = zext i32 %515 to i64
  %518 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 %517
  %519 = load i8, i8 addrspace(4)* %518, align 1, !tbaa !33
  %520 = zext i8 %519 to i64
  %521 = shl i32 %515, 3
  %522 = zext i32 %521 to i64
  %523 = shl nuw i64 %520, %522
  %524 = or i64 %523, %516
  %525 = add nuw nsw i32 %515, 1
  %526 = icmp eq i32 %525, %469
  br i1 %526, label %527, label %514, !llvm.loop !34

527:                                              ; preds = %514, %474, %472
  %528 = phi i8 addrspace(4)* [ %513, %474 ], [ %461, %472 ], [ %461, %514 ]
  %529 = phi i32 [ %512, %474 ], [ 0, %472 ], [ 0, %514 ]
  %530 = phi i64 [ %511, %474 ], [ 0, %472 ], [ %524, %514 ]
  %531 = icmp ugt i32 %529, 7
  br i1 %531, label %534, label %532

532:                                              ; preds = %527
  %533 = icmp eq i32 %529, 0
  br i1 %533, label %587, label %574

534:                                              ; preds = %527
  %535 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !33
  %536 = zext i8 %535 to i64
  %537 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 1
  %538 = load i8, i8 addrspace(4)* %537, align 1, !tbaa !33
  %539 = zext i8 %538 to i64
  %540 = shl nuw nsw i64 %539, 8
  %541 = or i64 %540, %536
  %542 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 2
  %543 = load i8, i8 addrspace(4)* %542, align 1, !tbaa !33
  %544 = zext i8 %543 to i64
  %545 = shl nuw nsw i64 %544, 16
  %546 = or i64 %541, %545
  %547 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 3
  %548 = load i8, i8 addrspace(4)* %547, align 1, !tbaa !33
  %549 = zext i8 %548 to i64
  %550 = shl nuw nsw i64 %549, 24
  %551 = or i64 %546, %550
  %552 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 4
  %553 = load i8, i8 addrspace(4)* %552, align 1, !tbaa !33
  %554 = zext i8 %553 to i64
  %555 = shl nuw nsw i64 %554, 32
  %556 = or i64 %551, %555
  %557 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 5
  %558 = load i8, i8 addrspace(4)* %557, align 1, !tbaa !33
  %559 = zext i8 %558 to i64
  %560 = shl nuw nsw i64 %559, 40
  %561 = or i64 %556, %560
  %562 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 6
  %563 = load i8, i8 addrspace(4)* %562, align 1, !tbaa !33
  %564 = zext i8 %563 to i64
  %565 = shl nuw nsw i64 %564, 48
  %566 = or i64 %561, %565
  %567 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 7
  %568 = load i8, i8 addrspace(4)* %567, align 1, !tbaa !33
  %569 = zext i8 %568 to i64
  %570 = shl nuw i64 %569, 56
  %571 = or i64 %566, %570
  %572 = add nsw i32 %529, -8
  %573 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 8
  br label %587

574:                                              ; preds = %532, %574
  %575 = phi i32 [ %585, %574 ], [ 0, %532 ]
  %576 = phi i64 [ %584, %574 ], [ 0, %532 ]
  %577 = zext i32 %575 to i64
  %578 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 %577
  %579 = load i8, i8 addrspace(4)* %578, align 1, !tbaa !33
  %580 = zext i8 %579 to i64
  %581 = shl i32 %575, 3
  %582 = zext i32 %581 to i64
  %583 = shl nuw i64 %580, %582
  %584 = or i64 %583, %576
  %585 = add nuw nsw i32 %575, 1
  %586 = icmp eq i32 %585, %529
  br i1 %586, label %587, label %574

587:                                              ; preds = %574, %534, %532
  %588 = phi i8 addrspace(4)* [ %573, %534 ], [ %528, %532 ], [ %528, %574 ]
  %589 = phi i32 [ %572, %534 ], [ 0, %532 ], [ 0, %574 ]
  %590 = phi i64 [ %571, %534 ], [ 0, %532 ], [ %584, %574 ]
  %591 = icmp ugt i32 %589, 7
  br i1 %591, label %594, label %592

592:                                              ; preds = %587
  %593 = icmp eq i32 %589, 0
  br i1 %593, label %647, label %634

594:                                              ; preds = %587
  %595 = load i8, i8 addrspace(4)* %588, align 1, !tbaa !33
  %596 = zext i8 %595 to i64
  %597 = getelementptr inbounds i8, i8 addrspace(4)* %588, i64 1
  %598 = load i8, i8 addrspace(4)* %597, align 1, !tbaa !33
  %599 = zext i8 %598 to i64
  %600 = shl nuw nsw i64 %599, 8
  %601 = or i64 %600, %596
  %602 = getelementptr inbounds i8, i8 addrspace(4)* %588, i64 2
  %603 = load i8, i8 addrspace(4)* %602, align 1, !tbaa !33
  %604 = zext i8 %603 to i64
  %605 = shl nuw nsw i64 %604, 16
  %606 = or i64 %601, %605
  %607 = getelementptr inbounds i8, i8 addrspace(4)* %588, i64 3
  %608 = load i8, i8 addrspace(4)* %607, align 1, !tbaa !33
  %609 = zext i8 %608 to i64
  %610 = shl nuw nsw i64 %609, 24
  %611 = or i64 %606, %610
  %612 = getelementptr inbounds i8, i8 addrspace(4)* %588, i64 4
  %613 = load i8, i8 addrspace(4)* %612, align 1, !tbaa !33
  %614 = zext i8 %613 to i64
  %615 = shl nuw nsw i64 %614, 32
  %616 = or i64 %611, %615
  %617 = getelementptr inbounds i8, i8 addrspace(4)* %588, i64 5
  %618 = load i8, i8 addrspace(4)* %617, align 1, !tbaa !33
  %619 = zext i8 %618 to i64
  %620 = shl nuw nsw i64 %619, 40
  %621 = or i64 %616, %620
  %622 = getelementptr inbounds i8, i8 addrspace(4)* %588, i64 6
  %623 = load i8, i8 addrspace(4)* %622, align 1, !tbaa !33
  %624 = zext i8 %623 to i64
  %625 = shl nuw nsw i64 %624, 48
  %626 = or i64 %621, %625
  %627 = getelementptr inbounds i8, i8 addrspace(4)* %588, i64 7
  %628 = load i8, i8 addrspace(4)* %627, align 1, !tbaa !33
  %629 = zext i8 %628 to i64
  %630 = shl nuw i64 %629, 56
  %631 = or i64 %626, %630
  %632 = add nsw i32 %589, -8
  %633 = getelementptr inbounds i8, i8 addrspace(4)* %588, i64 8
  br label %647

634:                                              ; preds = %592, %634
  %635 = phi i32 [ %645, %634 ], [ 0, %592 ]
  %636 = phi i64 [ %644, %634 ], [ 0, %592 ]
  %637 = zext i32 %635 to i64
  %638 = getelementptr inbounds i8, i8 addrspace(4)* %588, i64 %637
  %639 = load i8, i8 addrspace(4)* %638, align 1, !tbaa !33
  %640 = zext i8 %639 to i64
  %641 = shl i32 %635, 3
  %642 = zext i32 %641 to i64
  %643 = shl nuw i64 %640, %642
  %644 = or i64 %643, %636
  %645 = add nuw nsw i32 %635, 1
  %646 = icmp eq i32 %645, %589
  br i1 %646, label %647, label %634

647:                                              ; preds = %634, %594, %592
  %648 = phi i8 addrspace(4)* [ %633, %594 ], [ %588, %592 ], [ %588, %634 ]
  %649 = phi i32 [ %632, %594 ], [ 0, %592 ], [ 0, %634 ]
  %650 = phi i64 [ %631, %594 ], [ 0, %592 ], [ %644, %634 ]
  %651 = icmp ugt i32 %649, 7
  br i1 %651, label %654, label %652

652:                                              ; preds = %647
  %653 = icmp eq i32 %649, 0
  br i1 %653, label %707, label %694

654:                                              ; preds = %647
  %655 = load i8, i8 addrspace(4)* %648, align 1, !tbaa !33
  %656 = zext i8 %655 to i64
  %657 = getelementptr inbounds i8, i8 addrspace(4)* %648, i64 1
  %658 = load i8, i8 addrspace(4)* %657, align 1, !tbaa !33
  %659 = zext i8 %658 to i64
  %660 = shl nuw nsw i64 %659, 8
  %661 = or i64 %660, %656
  %662 = getelementptr inbounds i8, i8 addrspace(4)* %648, i64 2
  %663 = load i8, i8 addrspace(4)* %662, align 1, !tbaa !33
  %664 = zext i8 %663 to i64
  %665 = shl nuw nsw i64 %664, 16
  %666 = or i64 %661, %665
  %667 = getelementptr inbounds i8, i8 addrspace(4)* %648, i64 3
  %668 = load i8, i8 addrspace(4)* %667, align 1, !tbaa !33
  %669 = zext i8 %668 to i64
  %670 = shl nuw nsw i64 %669, 24
  %671 = or i64 %666, %670
  %672 = getelementptr inbounds i8, i8 addrspace(4)* %648, i64 4
  %673 = load i8, i8 addrspace(4)* %672, align 1, !tbaa !33
  %674 = zext i8 %673 to i64
  %675 = shl nuw nsw i64 %674, 32
  %676 = or i64 %671, %675
  %677 = getelementptr inbounds i8, i8 addrspace(4)* %648, i64 5
  %678 = load i8, i8 addrspace(4)* %677, align 1, !tbaa !33
  %679 = zext i8 %678 to i64
  %680 = shl nuw nsw i64 %679, 40
  %681 = or i64 %676, %680
  %682 = getelementptr inbounds i8, i8 addrspace(4)* %648, i64 6
  %683 = load i8, i8 addrspace(4)* %682, align 1, !tbaa !33
  %684 = zext i8 %683 to i64
  %685 = shl nuw nsw i64 %684, 48
  %686 = or i64 %681, %685
  %687 = getelementptr inbounds i8, i8 addrspace(4)* %648, i64 7
  %688 = load i8, i8 addrspace(4)* %687, align 1, !tbaa !33
  %689 = zext i8 %688 to i64
  %690 = shl nuw i64 %689, 56
  %691 = or i64 %686, %690
  %692 = add nsw i32 %649, -8
  %693 = getelementptr inbounds i8, i8 addrspace(4)* %648, i64 8
  br label %707

694:                                              ; preds = %652, %694
  %695 = phi i32 [ %705, %694 ], [ 0, %652 ]
  %696 = phi i64 [ %704, %694 ], [ 0, %652 ]
  %697 = zext i32 %695 to i64
  %698 = getelementptr inbounds i8, i8 addrspace(4)* %648, i64 %697
  %699 = load i8, i8 addrspace(4)* %698, align 1, !tbaa !33
  %700 = zext i8 %699 to i64
  %701 = shl i32 %695, 3
  %702 = zext i32 %701 to i64
  %703 = shl nuw i64 %700, %702
  %704 = or i64 %703, %696
  %705 = add nuw nsw i32 %695, 1
  %706 = icmp eq i32 %705, %649
  br i1 %706, label %707, label %694

707:                                              ; preds = %694, %654, %652
  %708 = phi i8 addrspace(4)* [ %693, %654 ], [ %648, %652 ], [ %648, %694 ]
  %709 = phi i32 [ %692, %654 ], [ 0, %652 ], [ 0, %694 ]
  %710 = phi i64 [ %691, %654 ], [ 0, %652 ], [ %704, %694 ]
  %711 = icmp ugt i32 %709, 7
  br i1 %711, label %714, label %712

712:                                              ; preds = %707
  %713 = icmp eq i32 %709, 0
  br i1 %713, label %767, label %754

714:                                              ; preds = %707
  %715 = load i8, i8 addrspace(4)* %708, align 1, !tbaa !33
  %716 = zext i8 %715 to i64
  %717 = getelementptr inbounds i8, i8 addrspace(4)* %708, i64 1
  %718 = load i8, i8 addrspace(4)* %717, align 1, !tbaa !33
  %719 = zext i8 %718 to i64
  %720 = shl nuw nsw i64 %719, 8
  %721 = or i64 %720, %716
  %722 = getelementptr inbounds i8, i8 addrspace(4)* %708, i64 2
  %723 = load i8, i8 addrspace(4)* %722, align 1, !tbaa !33
  %724 = zext i8 %723 to i64
  %725 = shl nuw nsw i64 %724, 16
  %726 = or i64 %721, %725
  %727 = getelementptr inbounds i8, i8 addrspace(4)* %708, i64 3
  %728 = load i8, i8 addrspace(4)* %727, align 1, !tbaa !33
  %729 = zext i8 %728 to i64
  %730 = shl nuw nsw i64 %729, 24
  %731 = or i64 %726, %730
  %732 = getelementptr inbounds i8, i8 addrspace(4)* %708, i64 4
  %733 = load i8, i8 addrspace(4)* %732, align 1, !tbaa !33
  %734 = zext i8 %733 to i64
  %735 = shl nuw nsw i64 %734, 32
  %736 = or i64 %731, %735
  %737 = getelementptr inbounds i8, i8 addrspace(4)* %708, i64 5
  %738 = load i8, i8 addrspace(4)* %737, align 1, !tbaa !33
  %739 = zext i8 %738 to i64
  %740 = shl nuw nsw i64 %739, 40
  %741 = or i64 %736, %740
  %742 = getelementptr inbounds i8, i8 addrspace(4)* %708, i64 6
  %743 = load i8, i8 addrspace(4)* %742, align 1, !tbaa !33
  %744 = zext i8 %743 to i64
  %745 = shl nuw nsw i64 %744, 48
  %746 = or i64 %741, %745
  %747 = getelementptr inbounds i8, i8 addrspace(4)* %708, i64 7
  %748 = load i8, i8 addrspace(4)* %747, align 1, !tbaa !33
  %749 = zext i8 %748 to i64
  %750 = shl nuw i64 %749, 56
  %751 = or i64 %746, %750
  %752 = add nsw i32 %709, -8
  %753 = getelementptr inbounds i8, i8 addrspace(4)* %708, i64 8
  br label %767

754:                                              ; preds = %712, %754
  %755 = phi i32 [ %765, %754 ], [ 0, %712 ]
  %756 = phi i64 [ %764, %754 ], [ 0, %712 ]
  %757 = zext i32 %755 to i64
  %758 = getelementptr inbounds i8, i8 addrspace(4)* %708, i64 %757
  %759 = load i8, i8 addrspace(4)* %758, align 1, !tbaa !33
  %760 = zext i8 %759 to i64
  %761 = shl i32 %755, 3
  %762 = zext i32 %761 to i64
  %763 = shl nuw i64 %760, %762
  %764 = or i64 %763, %756
  %765 = add nuw nsw i32 %755, 1
  %766 = icmp eq i32 %765, %709
  br i1 %766, label %767, label %754

767:                                              ; preds = %754, %714, %712
  %768 = phi i8 addrspace(4)* [ %753, %714 ], [ %708, %712 ], [ %708, %754 ]
  %769 = phi i32 [ %752, %714 ], [ 0, %712 ], [ 0, %754 ]
  %770 = phi i64 [ %751, %714 ], [ 0, %712 ], [ %764, %754 ]
  %771 = icmp ugt i32 %769, 7
  br i1 %771, label %774, label %772

772:                                              ; preds = %767
  %773 = icmp eq i32 %769, 0
  br i1 %773, label %827, label %814

774:                                              ; preds = %767
  %775 = load i8, i8 addrspace(4)* %768, align 1, !tbaa !33
  %776 = zext i8 %775 to i64
  %777 = getelementptr inbounds i8, i8 addrspace(4)* %768, i64 1
  %778 = load i8, i8 addrspace(4)* %777, align 1, !tbaa !33
  %779 = zext i8 %778 to i64
  %780 = shl nuw nsw i64 %779, 8
  %781 = or i64 %780, %776
  %782 = getelementptr inbounds i8, i8 addrspace(4)* %768, i64 2
  %783 = load i8, i8 addrspace(4)* %782, align 1, !tbaa !33
  %784 = zext i8 %783 to i64
  %785 = shl nuw nsw i64 %784, 16
  %786 = or i64 %781, %785
  %787 = getelementptr inbounds i8, i8 addrspace(4)* %768, i64 3
  %788 = load i8, i8 addrspace(4)* %787, align 1, !tbaa !33
  %789 = zext i8 %788 to i64
  %790 = shl nuw nsw i64 %789, 24
  %791 = or i64 %786, %790
  %792 = getelementptr inbounds i8, i8 addrspace(4)* %768, i64 4
  %793 = load i8, i8 addrspace(4)* %792, align 1, !tbaa !33
  %794 = zext i8 %793 to i64
  %795 = shl nuw nsw i64 %794, 32
  %796 = or i64 %791, %795
  %797 = getelementptr inbounds i8, i8 addrspace(4)* %768, i64 5
  %798 = load i8, i8 addrspace(4)* %797, align 1, !tbaa !33
  %799 = zext i8 %798 to i64
  %800 = shl nuw nsw i64 %799, 40
  %801 = or i64 %796, %800
  %802 = getelementptr inbounds i8, i8 addrspace(4)* %768, i64 6
  %803 = load i8, i8 addrspace(4)* %802, align 1, !tbaa !33
  %804 = zext i8 %803 to i64
  %805 = shl nuw nsw i64 %804, 48
  %806 = or i64 %801, %805
  %807 = getelementptr inbounds i8, i8 addrspace(4)* %768, i64 7
  %808 = load i8, i8 addrspace(4)* %807, align 1, !tbaa !33
  %809 = zext i8 %808 to i64
  %810 = shl nuw i64 %809, 56
  %811 = or i64 %806, %810
  %812 = add nsw i32 %769, -8
  %813 = getelementptr inbounds i8, i8 addrspace(4)* %768, i64 8
  br label %827

814:                                              ; preds = %772, %814
  %815 = phi i32 [ %825, %814 ], [ 0, %772 ]
  %816 = phi i64 [ %824, %814 ], [ 0, %772 ]
  %817 = zext i32 %815 to i64
  %818 = getelementptr inbounds i8, i8 addrspace(4)* %768, i64 %817
  %819 = load i8, i8 addrspace(4)* %818, align 1, !tbaa !33
  %820 = zext i8 %819 to i64
  %821 = shl i32 %815, 3
  %822 = zext i32 %821 to i64
  %823 = shl nuw i64 %820, %822
  %824 = or i64 %823, %816
  %825 = add nuw nsw i32 %815, 1
  %826 = icmp eq i32 %825, %769
  br i1 %826, label %827, label %814

827:                                              ; preds = %814, %774, %772
  %828 = phi i8 addrspace(4)* [ %813, %774 ], [ %768, %772 ], [ %768, %814 ]
  %829 = phi i32 [ %812, %774 ], [ 0, %772 ], [ 0, %814 ]
  %830 = phi i64 [ %811, %774 ], [ 0, %772 ], [ %824, %814 ]
  %831 = icmp ugt i32 %829, 7
  br i1 %831, label %834, label %832

832:                                              ; preds = %827
  %833 = icmp eq i32 %829, 0
  br i1 %833, label %885, label %872

834:                                              ; preds = %827
  %835 = load i8, i8 addrspace(4)* %828, align 1, !tbaa !33
  %836 = zext i8 %835 to i64
  %837 = getelementptr inbounds i8, i8 addrspace(4)* %828, i64 1
  %838 = load i8, i8 addrspace(4)* %837, align 1, !tbaa !33
  %839 = zext i8 %838 to i64
  %840 = shl nuw nsw i64 %839, 8
  %841 = or i64 %840, %836
  %842 = getelementptr inbounds i8, i8 addrspace(4)* %828, i64 2
  %843 = load i8, i8 addrspace(4)* %842, align 1, !tbaa !33
  %844 = zext i8 %843 to i64
  %845 = shl nuw nsw i64 %844, 16
  %846 = or i64 %841, %845
  %847 = getelementptr inbounds i8, i8 addrspace(4)* %828, i64 3
  %848 = load i8, i8 addrspace(4)* %847, align 1, !tbaa !33
  %849 = zext i8 %848 to i64
  %850 = shl nuw nsw i64 %849, 24
  %851 = or i64 %846, %850
  %852 = getelementptr inbounds i8, i8 addrspace(4)* %828, i64 4
  %853 = load i8, i8 addrspace(4)* %852, align 1, !tbaa !33
  %854 = zext i8 %853 to i64
  %855 = shl nuw nsw i64 %854, 32
  %856 = or i64 %851, %855
  %857 = getelementptr inbounds i8, i8 addrspace(4)* %828, i64 5
  %858 = load i8, i8 addrspace(4)* %857, align 1, !tbaa !33
  %859 = zext i8 %858 to i64
  %860 = shl nuw nsw i64 %859, 40
  %861 = or i64 %856, %860
  %862 = getelementptr inbounds i8, i8 addrspace(4)* %828, i64 6
  %863 = load i8, i8 addrspace(4)* %862, align 1, !tbaa !33
  %864 = zext i8 %863 to i64
  %865 = shl nuw nsw i64 %864, 48
  %866 = or i64 %861, %865
  %867 = getelementptr inbounds i8, i8 addrspace(4)* %828, i64 7
  %868 = load i8, i8 addrspace(4)* %867, align 1, !tbaa !33
  %869 = zext i8 %868 to i64
  %870 = shl nuw i64 %869, 56
  %871 = or i64 %866, %870
  br label %885

872:                                              ; preds = %832, %872
  %873 = phi i32 [ %883, %872 ], [ 0, %832 ]
  %874 = phi i64 [ %882, %872 ], [ 0, %832 ]
  %875 = zext i32 %873 to i64
  %876 = getelementptr inbounds i8, i8 addrspace(4)* %828, i64 %875
  %877 = load i8, i8 addrspace(4)* %876, align 1, !tbaa !33
  %878 = zext i8 %877 to i64
  %879 = shl i32 %873, 3
  %880 = zext i32 %879 to i64
  %881 = shl nuw i64 %878, %880
  %882 = or i64 %881, %874
  %883 = add nuw nsw i32 %873, 1
  %884 = icmp eq i32 %883, %829
  br i1 %884, label %885, label %872

885:                                              ; preds = %872, %834, %832
  %886 = phi i64 [ %871, %834 ], [ 0, %832 ], [ %882, %872 ]
  %887 = shl nuw nsw i64 %468, 2
  %888 = add nuw nsw i64 %887, 28
  %889 = and i64 %888, 480
  %890 = and i64 %470, -225
  %891 = or i64 %890, %889
  %892 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %448, i64 noundef %891, i64 noundef %530, i64 noundef %590, i64 noundef %650, i64 noundef %710, i64 noundef %770, i64 noundef %830, i64 noundef %886) #12
  %893 = sub i64 %460, %468
  %894 = getelementptr inbounds i8, i8 addrspace(4)* %461, i64 %468
  %895 = icmp eq i64 %893, 0
  br i1 %895, label %896, label %459

896:                                              ; preds = %885, %451
  %897 = phi <2 x i64> [ %454, %451 ], [ %892, %885 ]
  %898 = extractelement <2 x i64> %897, i64 0
  %899 = zext i32 %379 to i64
  %900 = and i64 %898, -225
  %901 = or i64 %900, 32
  %902 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %448, i64 noundef %901, i64 noundef %899, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %903 = extractelement <2 x i64> %902, i64 0
  %904 = and i64 %903, -225
  %905 = or i64 %904, 32
  %906 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %448, i64 noundef %905, i64 noundef %162, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %907 = extractelement <2 x i64> %906, i64 0
  %908 = and i64 %907, -227
  %909 = or i64 %908, 34
  %910 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %448, i64 noundef %909, i64 noundef %163, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %911

911:                                              ; preds = %896, %375
  %912 = sext i32 %379 to i64
  %913 = getelementptr inbounds float, float addrspace(1)* %1, i64 %912
  store float %376, float addrspace(1)* %913, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %190, label %914, label %967

914:                                              ; preds = %911
  %915 = mul nsw i32 %187, %9
  %916 = add nsw i32 %915, %12
  %917 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %916
  store float %270, float addrspace(3)* %917, align 4, !tbaa !16
  br i1 %165, label %967, label %918

918:                                              ; preds = %914
  br i1 %182, label %956, label %919

919:                                              ; preds = %918, %919
  %920 = phi i32 [ %953, %919 ], [ 1, %918 ]
  %921 = phi i32 [ %954, %919 ], [ 0, %918 ]
  %922 = add nsw i32 %920, %916
  %923 = extractelement <3 x float> %269, i32 %920
  %924 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %922
  store float %923, float addrspace(3)* %924, align 4, !tbaa !16
  %925 = add nuw nsw i32 %920, 1
  %926 = add nsw i32 %925, %916
  %927 = extractelement <3 x float> %269, i32 %925
  %928 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %926
  store float %927, float addrspace(3)* %928, align 4, !tbaa !16
  %929 = add nuw nsw i32 %920, 2
  %930 = add nsw i32 %929, %916
  %931 = extractelement <3 x float> %269, i32 %929
  %932 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %930
  store float %931, float addrspace(3)* %932, align 4, !tbaa !16
  %933 = add nuw nsw i32 %920, 3
  %934 = add nsw i32 %933, %916
  %935 = extractelement <3 x float> %269, i32 %933
  %936 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %934
  store float %935, float addrspace(3)* %936, align 4, !tbaa !16
  %937 = add nuw nsw i32 %920, 4
  %938 = add nsw i32 %937, %916
  %939 = extractelement <3 x float> %269, i32 %937
  %940 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %938
  store float %939, float addrspace(3)* %940, align 4, !tbaa !16
  %941 = add nuw nsw i32 %920, 5
  %942 = add nsw i32 %941, %916
  %943 = extractelement <3 x float> %269, i32 %941
  %944 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %942
  store float %943, float addrspace(3)* %944, align 4, !tbaa !16
  %945 = add nuw nsw i32 %920, 6
  %946 = add nsw i32 %945, %916
  %947 = extractelement <3 x float> %269, i32 %945
  %948 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %946
  store float %947, float addrspace(3)* %948, align 4, !tbaa !16
  %949 = add nuw nsw i32 %920, 7
  %950 = add nsw i32 %949, %916
  %951 = extractelement <3 x float> %269, i32 %949
  %952 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %950
  store float %951, float addrspace(3)* %952, align 4, !tbaa !16
  %953 = add nuw nsw i32 %920, 8
  %954 = add i32 %921, 8
  %955 = icmp eq i32 %954, %183
  br i1 %955, label %956, label %919, !llvm.loop !35

956:                                              ; preds = %919, %918
  %957 = phi i32 [ 1, %918 ], [ %953, %919 ]
  br i1 %184, label %967, label %958

958:                                              ; preds = %956, %958
  %959 = phi i32 [ %964, %958 ], [ %957, %956 ]
  %960 = phi i32 [ %965, %958 ], [ 0, %956 ]
  %961 = add nsw i32 %959, %916
  %962 = extractelement <3 x float> %269, i32 %959
  %963 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %961
  store float %962, float addrspace(3)* %963, align 4, !tbaa !16
  %964 = add nuw nsw i32 %959, 1
  %965 = add i32 %960, 1
  %966 = icmp eq i32 %965, %181
  br i1 %966, label %967, label %958, !llvm.loop !36

967:                                              ; preds = %956, %958, %914, %911
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %968 = add nsw i32 %187, 1
  %969 = icmp slt i32 %187, %150
  br i1 %969, label %185, label %3442, !llvm.loop !37

970:                                              ; preds = %57
  %971 = select i1 %29, i1 true, i1 %32
  br i1 %971, label %1795, label %972

972:                                              ; preds = %970
  %973 = sub i32 1, %10
  %974 = add i32 %973, %18
  %975 = icmp sge i32 %12, %974
  %976 = icmp sgt i32 %10, %2
  %977 = select i1 %975, i1 true, i1 %976
  br i1 %977, label %3442, label %978

978:                                              ; preds = %972
  %979 = sub nsw i32 %18, %10
  %980 = icmp ne i32 %12, %979
  %981 = icmp slt i32 %10, 2
  %982 = mul i32 %10, %10
  %983 = icmp eq i32 %10, 0
  %984 = mul nsw i32 %7, %6
  %985 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %986 = getelementptr inbounds i8, i8 addrspace(4)* %985, i64 24
  %987 = bitcast i8 addrspace(4)* %986 to i64 addrspace(4)*
  %988 = zext i32 %12 to i64
  %989 = zext i32 %42 to i64
  %990 = tail call i32 @llvm.umax.i32(i32 %982, i32 1)
  %991 = or i1 %981, %980
  %992 = add i32 %10, -1
  %993 = add i32 %10, -2
  %994 = add i32 %990, -1
  %995 = and i32 %992, 7
  %996 = icmp ult i32 %993, 7
  %997 = and i32 %992, -8
  %998 = icmp eq i32 %995, 0
  %999 = and i32 %10, 7
  %1000 = icmp ult i32 %992, 7
  %1001 = and i32 %10, -8
  %1002 = icmp eq i32 %999, 0
  %1003 = and i32 %990, 7
  %1004 = icmp ult i32 %994, 7
  %1005 = and i32 %990, -8
  %1006 = icmp eq i32 %1003, 0
  %1007 = and i32 %992, 7
  %1008 = icmp ult i32 %993, 7
  %1009 = and i32 %992, -8
  %1010 = icmp eq i32 %1007, 0
  br label %1011

1011:                                             ; preds = %1793, %978
  %1012 = phi <9 x float> [ undef, %978 ], [ %1101, %1793 ]
  %1013 = phi i32 [ %10, %978 ], [ %1794, %1793 ]
  %1014 = phi float [ undef, %978 ], [ %1096, %1793 ]
  %1015 = phi <3 x float> [ undef, %978 ], [ %1095, %1793 ]
  %1016 = icmp slt i32 %1013, %2
  br i1 %1016, label %1017, label %1094

1017:                                             ; preds = %1011
  %1018 = mul nsw i32 %1013, %5
  %1019 = add nsw i32 %1018, %42
  %1020 = sext i32 %1019 to i64
  %1021 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1020
  %1022 = load float, float addrspace(1)* %1021, align 4, !tbaa !16
  br i1 %991, label %1094, label %1023

1023:                                             ; preds = %1017
  br i1 %996, label %1078, label %1024

1024:                                             ; preds = %1023, %1024
  %1025 = phi i32 [ %1075, %1024 ], [ 1, %1023 ]
  %1026 = phi <3 x float> [ %1074, %1024 ], [ %1015, %1023 ]
  %1027 = phi i32 [ %1076, %1024 ], [ 0, %1023 ]
  %1028 = add nsw i32 %1025, %1019
  %1029 = sext i32 %1028 to i64
  %1030 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1029
  %1031 = load float, float addrspace(1)* %1030, align 4, !tbaa !16
  %1032 = insertelement <3 x float> %1026, float %1031, i32 %1025
  %1033 = add nuw nsw i32 %1025, 1
  %1034 = add nsw i32 %1033, %1019
  %1035 = sext i32 %1034 to i64
  %1036 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1035
  %1037 = load float, float addrspace(1)* %1036, align 4, !tbaa !16
  %1038 = insertelement <3 x float> %1032, float %1037, i32 %1033
  %1039 = add nuw nsw i32 %1025, 2
  %1040 = add nsw i32 %1039, %1019
  %1041 = sext i32 %1040 to i64
  %1042 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1041
  %1043 = load float, float addrspace(1)* %1042, align 4, !tbaa !16
  %1044 = insertelement <3 x float> %1038, float %1043, i32 %1039
  %1045 = add nuw nsw i32 %1025, 3
  %1046 = add nsw i32 %1045, %1019
  %1047 = sext i32 %1046 to i64
  %1048 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1047
  %1049 = load float, float addrspace(1)* %1048, align 4, !tbaa !16
  %1050 = insertelement <3 x float> %1044, float %1049, i32 %1045
  %1051 = add nuw nsw i32 %1025, 4
  %1052 = add nsw i32 %1051, %1019
  %1053 = sext i32 %1052 to i64
  %1054 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1053
  %1055 = load float, float addrspace(1)* %1054, align 4, !tbaa !16
  %1056 = insertelement <3 x float> %1050, float %1055, i32 %1051
  %1057 = add nuw nsw i32 %1025, 5
  %1058 = add nsw i32 %1057, %1019
  %1059 = sext i32 %1058 to i64
  %1060 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1059
  %1061 = load float, float addrspace(1)* %1060, align 4, !tbaa !16
  %1062 = insertelement <3 x float> %1056, float %1061, i32 %1057
  %1063 = add nuw nsw i32 %1025, 6
  %1064 = add nsw i32 %1063, %1019
  %1065 = sext i32 %1064 to i64
  %1066 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1065
  %1067 = load float, float addrspace(1)* %1066, align 4, !tbaa !16
  %1068 = insertelement <3 x float> %1062, float %1067, i32 %1063
  %1069 = add nuw nsw i32 %1025, 7
  %1070 = add nsw i32 %1069, %1019
  %1071 = sext i32 %1070 to i64
  %1072 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1071
  %1073 = load float, float addrspace(1)* %1072, align 4, !tbaa !16
  %1074 = insertelement <3 x float> %1068, float %1073, i32 %1069
  %1075 = add nuw nsw i32 %1025, 8
  %1076 = add i32 %1027, 8
  %1077 = icmp eq i32 %1076, %997
  br i1 %1077, label %1078, label %1024, !llvm.loop !25

1078:                                             ; preds = %1024, %1023
  %1079 = phi <3 x float> [ undef, %1023 ], [ %1074, %1024 ]
  %1080 = phi i32 [ 1, %1023 ], [ %1075, %1024 ]
  %1081 = phi <3 x float> [ %1015, %1023 ], [ %1074, %1024 ]
  br i1 %998, label %1094, label %1082

1082:                                             ; preds = %1078, %1082
  %1083 = phi i32 [ %1091, %1082 ], [ %1080, %1078 ]
  %1084 = phi <3 x float> [ %1090, %1082 ], [ %1081, %1078 ]
  %1085 = phi i32 [ %1092, %1082 ], [ 0, %1078 ]
  %1086 = add nsw i32 %1083, %1019
  %1087 = sext i32 %1086 to i64
  %1088 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1087
  %1089 = load float, float addrspace(1)* %1088, align 4, !tbaa !16
  %1090 = insertelement <3 x float> %1084, float %1089, i32 %1083
  %1091 = add nuw nsw i32 %1083, 1
  %1092 = add i32 %1085, 1
  %1093 = icmp eq i32 %1092, %995
  br i1 %1093, label %1094, label %1082, !llvm.loop !38

1094:                                             ; preds = %1078, %1082, %1017, %1011
  %1095 = phi <3 x float> [ %1015, %1011 ], [ %1015, %1017 ], [ %1079, %1078 ], [ %1090, %1082 ]
  %1096 = phi float [ %1014, %1011 ], [ %1022, %1017 ], [ %1022, %1082 ], [ %1022, %1078 ]
  %1097 = sub nsw i32 %1013, %10
  br i1 %43, label %1098, label %1100

1098:                                             ; preds = %1094
  %1099 = sub i32 %10, %1013
  br label %1103

1100:                                             ; preds = %1126, %1094
  %1101 = phi <9 x float> [ %1012, %1094 ], [ %1127, %1126 ]
  br i1 %983, label %1201, label %1102

1102:                                             ; preds = %1100
  br i1 %1004, label %1184, label %1209

1103:                                             ; preds = %1126, %1098
  %1104 = phi <9 x float> [ %1012, %1098 ], [ %1127, %1126 ]
  %1105 = phi i32 [ %1097, %1098 ], [ %1128, %1126 ]
  %1106 = mul nsw i32 %1105, %9
  %1107 = add nsw i32 %1106, %12
  %1108 = add i32 %1099, %1105
  %1109 = mul nsw i32 %1108, %10
  br i1 %1000, label %1110, label %1130

1110:                                             ; preds = %1130, %1103
  %1111 = phi <9 x float> [ undef, %1103 ], [ %1180, %1130 ]
  %1112 = phi <9 x float> [ %1104, %1103 ], [ %1180, %1130 ]
  %1113 = phi i32 [ 0, %1103 ], [ %1181, %1130 ]
  br i1 %1002, label %1126, label %1114

1114:                                             ; preds = %1110, %1114
  %1115 = phi <9 x float> [ %1122, %1114 ], [ %1112, %1110 ]
  %1116 = phi i32 [ %1123, %1114 ], [ %1113, %1110 ]
  %1117 = phi i32 [ %1124, %1114 ], [ 0, %1110 ]
  %1118 = add nsw i32 %1107, %1116
  %1119 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1118
  %1120 = load float, float addrspace(3)* %1119, align 4, !tbaa !16
  %1121 = add nsw i32 %1116, %1109
  %1122 = insertelement <9 x float> %1115, float %1120, i32 %1121
  %1123 = add nuw nsw i32 %1116, 1
  %1124 = add i32 %1117, 1
  %1125 = icmp eq i32 %1124, %999
  br i1 %1125, label %1126, label %1114, !llvm.loop !39

1126:                                             ; preds = %1114, %1110
  %1127 = phi <9 x float> [ %1111, %1110 ], [ %1122, %1114 ]
  %1128 = add nsw i32 %1105, 1
  %1129 = icmp slt i32 %1128, %1013
  br i1 %1129, label %1103, label %1100, !llvm.loop !28

1130:                                             ; preds = %1103, %1130
  %1131 = phi <9 x float> [ %1180, %1130 ], [ %1104, %1103 ]
  %1132 = phi i32 [ %1181, %1130 ], [ 0, %1103 ]
  %1133 = phi i32 [ %1182, %1130 ], [ 0, %1103 ]
  %1134 = add nsw i32 %1107, %1132
  %1135 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1134
  %1136 = load float, float addrspace(3)* %1135, align 4, !tbaa !16
  %1137 = add nsw i32 %1132, %1109
  %1138 = insertelement <9 x float> %1131, float %1136, i32 %1137
  %1139 = or i32 %1132, 1
  %1140 = add nsw i32 %1107, %1139
  %1141 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1140
  %1142 = load float, float addrspace(3)* %1141, align 4, !tbaa !16
  %1143 = add nsw i32 %1139, %1109
  %1144 = insertelement <9 x float> %1138, float %1142, i32 %1143
  %1145 = or i32 %1132, 2
  %1146 = add nsw i32 %1107, %1145
  %1147 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1146
  %1148 = load float, float addrspace(3)* %1147, align 4, !tbaa !16
  %1149 = add nsw i32 %1145, %1109
  %1150 = insertelement <9 x float> %1144, float %1148, i32 %1149
  %1151 = or i32 %1132, 3
  %1152 = add nsw i32 %1107, %1151
  %1153 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1152
  %1154 = load float, float addrspace(3)* %1153, align 4, !tbaa !16
  %1155 = add nsw i32 %1151, %1109
  %1156 = insertelement <9 x float> %1150, float %1154, i32 %1155
  %1157 = or i32 %1132, 4
  %1158 = add nsw i32 %1107, %1157
  %1159 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1158
  %1160 = load float, float addrspace(3)* %1159, align 4, !tbaa !16
  %1161 = add nsw i32 %1157, %1109
  %1162 = insertelement <9 x float> %1156, float %1160, i32 %1161
  %1163 = or i32 %1132, 5
  %1164 = add nsw i32 %1107, %1163
  %1165 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1164
  %1166 = load float, float addrspace(3)* %1165, align 4, !tbaa !16
  %1167 = add nsw i32 %1163, %1109
  %1168 = insertelement <9 x float> %1162, float %1166, i32 %1167
  %1169 = or i32 %1132, 6
  %1170 = add nsw i32 %1107, %1169
  %1171 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1170
  %1172 = load float, float addrspace(3)* %1171, align 4, !tbaa !16
  %1173 = add nsw i32 %1169, %1109
  %1174 = insertelement <9 x float> %1168, float %1172, i32 %1173
  %1175 = or i32 %1132, 7
  %1176 = add nsw i32 %1107, %1175
  %1177 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1176
  %1178 = load float, float addrspace(3)* %1177, align 4, !tbaa !16
  %1179 = add nsw i32 %1175, %1109
  %1180 = insertelement <9 x float> %1174, float %1178, i32 %1179
  %1181 = add nuw nsw i32 %1132, 8
  %1182 = add i32 %1133, 8
  %1183 = icmp eq i32 %1182, %1001
  br i1 %1183, label %1110, label %1130, !llvm.loop !29

1184:                                             ; preds = %1209, %1102
  %1185 = phi float [ undef, %1102 ], [ %1267, %1209 ]
  %1186 = phi i32 [ 0, %1102 ], [ %1268, %1209 ]
  %1187 = phi float [ 0.000000e+00, %1102 ], [ %1267, %1209 ]
  br i1 %1006, label %1201, label %1188

1188:                                             ; preds = %1184, %1188
  %1189 = phi i32 [ %1198, %1188 ], [ %1186, %1184 ]
  %1190 = phi float [ %1197, %1188 ], [ %1187, %1184 ]
  %1191 = phi i32 [ %1199, %1188 ], [ 0, %1184 ]
  %1192 = zext i32 %1189 to i64
  %1193 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %1192
  %1194 = load float, float addrspace(4)* %1193, align 4, !tbaa !16
  %1195 = extractelement <9 x float> %1101, i32 %1189
  %1196 = fmul contract float %1195, %1194
  %1197 = fadd contract float %1190, %1196
  %1198 = add nuw nsw i32 %1189, 1
  %1199 = add i32 %1191, 1
  %1200 = icmp eq i32 %1199, %1003
  br i1 %1200, label %1201, label %1188, !llvm.loop !40

1201:                                             ; preds = %1184, %1188, %1100
  %1202 = phi float [ 0.000000e+00, %1100 ], [ %1185, %1184 ], [ %1197, %1188 ]
  %1203 = add nsw i32 %1097, %38
  %1204 = mul nsw i32 %1203, %7
  %1205 = add i32 %41, %1204
  %1206 = icmp sgt i32 %1205, -1
  %1207 = icmp slt i32 %1205, %984
  %1208 = select i1 %1206, i1 %1207, i1 false
  br i1 %1208, label %1737, label %1271

1209:                                             ; preds = %1102, %1209
  %1210 = phi i32 [ %1268, %1209 ], [ 0, %1102 ]
  %1211 = phi float [ %1267, %1209 ], [ 0.000000e+00, %1102 ]
  %1212 = phi i32 [ %1269, %1209 ], [ 0, %1102 ]
  %1213 = zext i32 %1210 to i64
  %1214 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %1213
  %1215 = load float, float addrspace(4)* %1214, align 16, !tbaa !16
  %1216 = extractelement <9 x float> %1101, i32 %1210
  %1217 = fmul contract float %1216, %1215
  %1218 = fadd contract float %1211, %1217
  %1219 = or i32 %1210, 1
  %1220 = zext i32 %1219 to i64
  %1221 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %1220
  %1222 = load float, float addrspace(4)* %1221, align 4, !tbaa !16
  %1223 = extractelement <9 x float> %1101, i32 %1219
  %1224 = fmul contract float %1223, %1222
  %1225 = fadd contract float %1218, %1224
  %1226 = or i32 %1210, 2
  %1227 = zext i32 %1226 to i64
  %1228 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %1227
  %1229 = load float, float addrspace(4)* %1228, align 8, !tbaa !16
  %1230 = extractelement <9 x float> %1101, i32 %1226
  %1231 = fmul contract float %1230, %1229
  %1232 = fadd contract float %1225, %1231
  %1233 = or i32 %1210, 3
  %1234 = zext i32 %1233 to i64
  %1235 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %1234
  %1236 = load float, float addrspace(4)* %1235, align 4, !tbaa !16
  %1237 = extractelement <9 x float> %1101, i32 %1233
  %1238 = fmul contract float %1237, %1236
  %1239 = fadd contract float %1232, %1238
  %1240 = or i32 %1210, 4
  %1241 = zext i32 %1240 to i64
  %1242 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %1241
  %1243 = load float, float addrspace(4)* %1242, align 16, !tbaa !16
  %1244 = extractelement <9 x float> %1101, i32 %1240
  %1245 = fmul contract float %1244, %1243
  %1246 = fadd contract float %1239, %1245
  %1247 = or i32 %1210, 5
  %1248 = zext i32 %1247 to i64
  %1249 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %1248
  %1250 = load float, float addrspace(4)* %1249, align 4, !tbaa !16
  %1251 = extractelement <9 x float> %1101, i32 %1247
  %1252 = fmul contract float %1251, %1250
  %1253 = fadd contract float %1246, %1252
  %1254 = or i32 %1210, 6
  %1255 = zext i32 %1254 to i64
  %1256 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %1255
  %1257 = load float, float addrspace(4)* %1256, align 8, !tbaa !16
  %1258 = extractelement <9 x float> %1101, i32 %1254
  %1259 = fmul contract float %1258, %1257
  %1260 = fadd contract float %1253, %1259
  %1261 = or i32 %1210, 7
  %1262 = zext i32 %1261 to i64
  %1263 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %1262
  %1264 = load float, float addrspace(4)* %1263, align 4, !tbaa !16
  %1265 = extractelement <9 x float> %1101, i32 %1261
  %1266 = fmul contract float %1265, %1264
  %1267 = fadd contract float %1260, %1266
  %1268 = add nuw nsw i32 %1210, 8
  %1269 = add i32 %1212, 8
  %1270 = icmp eq i32 %1269, %1005
  br i1 %1270, label %1184, label %1209, !llvm.loop !31

1271:                                             ; preds = %1201
  %1272 = load i64, i64 addrspace(4)* %987, align 8, !tbaa !32
  %1273 = inttoptr i64 %1272 to i8 addrspace(1)*
  %1274 = addrspacecast i8 addrspace(1)* %1273 to i8*
  %1275 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1274, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1276 = extractelement <2 x i64> %1275, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %1277, label %1281

1277:                                             ; preds = %1271
  %1278 = and i64 %1276, -225
  %1279 = or i64 %1278, 32
  %1280 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1274, i64 noundef %1279, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %1722

1281:                                             ; preds = %1271
  %1282 = and i64 %1276, 2
  %1283 = and i64 %1276, -3
  %1284 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1283, i64 0
  br label %1285

1285:                                             ; preds = %1711, %1281
  %1286 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 29) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([30 x i8]* addrspacecast ([30 x i8] addrspace(4)* @.str to [30 x i8]*) to i64)), i64 1))), %1281 ], [ %1719, %1711 ]
  %1287 = phi i8 addrspace(4)* [ getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0), %1281 ], [ %1720, %1711 ]
  %1288 = phi <2 x i64> [ %1284, %1281 ], [ %1718, %1711 ]
  %1289 = icmp ugt i64 %1286, 56
  %1290 = extractelement <2 x i64> %1288, i64 0
  %1291 = or i64 %1290, %1282
  %1292 = insertelement <2 x i64> poison, i64 %1291, i64 0
  %1293 = select i1 %1289, <2 x i64> %1288, <2 x i64> %1292
  %1294 = tail call i64 @llvm.umin.i64(i64 %1286, i64 56)
  %1295 = trunc i64 %1294 to i32
  %1296 = extractelement <2 x i64> %1293, i64 0
  %1297 = icmp ugt i32 %1295, 7
  br i1 %1297, label %1300, label %1298

1298:                                             ; preds = %1285
  %1299 = icmp eq i32 %1295, 0
  br i1 %1299, label %1353, label %1340

1300:                                             ; preds = %1285
  %1301 = load i8, i8 addrspace(4)* %1287, align 1, !tbaa !33
  %1302 = zext i8 %1301 to i64
  %1303 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 1
  %1304 = load i8, i8 addrspace(4)* %1303, align 1, !tbaa !33
  %1305 = zext i8 %1304 to i64
  %1306 = shl nuw nsw i64 %1305, 8
  %1307 = or i64 %1306, %1302
  %1308 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 2
  %1309 = load i8, i8 addrspace(4)* %1308, align 1, !tbaa !33
  %1310 = zext i8 %1309 to i64
  %1311 = shl nuw nsw i64 %1310, 16
  %1312 = or i64 %1307, %1311
  %1313 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 3
  %1314 = load i8, i8 addrspace(4)* %1313, align 1, !tbaa !33
  %1315 = zext i8 %1314 to i64
  %1316 = shl nuw nsw i64 %1315, 24
  %1317 = or i64 %1312, %1316
  %1318 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 4
  %1319 = load i8, i8 addrspace(4)* %1318, align 1, !tbaa !33
  %1320 = zext i8 %1319 to i64
  %1321 = shl nuw nsw i64 %1320, 32
  %1322 = or i64 %1317, %1321
  %1323 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 5
  %1324 = load i8, i8 addrspace(4)* %1323, align 1, !tbaa !33
  %1325 = zext i8 %1324 to i64
  %1326 = shl nuw nsw i64 %1325, 40
  %1327 = or i64 %1322, %1326
  %1328 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 6
  %1329 = load i8, i8 addrspace(4)* %1328, align 1, !tbaa !33
  %1330 = zext i8 %1329 to i64
  %1331 = shl nuw nsw i64 %1330, 48
  %1332 = or i64 %1327, %1331
  %1333 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 7
  %1334 = load i8, i8 addrspace(4)* %1333, align 1, !tbaa !33
  %1335 = zext i8 %1334 to i64
  %1336 = shl nuw i64 %1335, 56
  %1337 = or i64 %1332, %1336
  %1338 = add nsw i32 %1295, -8
  %1339 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 8
  br label %1353

1340:                                             ; preds = %1298, %1340
  %1341 = phi i32 [ %1351, %1340 ], [ 0, %1298 ]
  %1342 = phi i64 [ %1350, %1340 ], [ 0, %1298 ]
  %1343 = zext i32 %1341 to i64
  %1344 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 %1343
  %1345 = load i8, i8 addrspace(4)* %1344, align 1, !tbaa !33
  %1346 = zext i8 %1345 to i64
  %1347 = shl i32 %1341, 3
  %1348 = zext i32 %1347 to i64
  %1349 = shl nuw i64 %1346, %1348
  %1350 = or i64 %1349, %1342
  %1351 = add nuw nsw i32 %1341, 1
  %1352 = icmp eq i32 %1351, %1295
  br i1 %1352, label %1353, label %1340, !llvm.loop !34

1353:                                             ; preds = %1340, %1300, %1298
  %1354 = phi i8 addrspace(4)* [ %1339, %1300 ], [ %1287, %1298 ], [ %1287, %1340 ]
  %1355 = phi i32 [ %1338, %1300 ], [ 0, %1298 ], [ 0, %1340 ]
  %1356 = phi i64 [ %1337, %1300 ], [ 0, %1298 ], [ %1350, %1340 ]
  %1357 = icmp ugt i32 %1355, 7
  br i1 %1357, label %1360, label %1358

1358:                                             ; preds = %1353
  %1359 = icmp eq i32 %1355, 0
  br i1 %1359, label %1413, label %1400

1360:                                             ; preds = %1353
  %1361 = load i8, i8 addrspace(4)* %1354, align 1, !tbaa !33
  %1362 = zext i8 %1361 to i64
  %1363 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 1
  %1364 = load i8, i8 addrspace(4)* %1363, align 1, !tbaa !33
  %1365 = zext i8 %1364 to i64
  %1366 = shl nuw nsw i64 %1365, 8
  %1367 = or i64 %1366, %1362
  %1368 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 2
  %1369 = load i8, i8 addrspace(4)* %1368, align 1, !tbaa !33
  %1370 = zext i8 %1369 to i64
  %1371 = shl nuw nsw i64 %1370, 16
  %1372 = or i64 %1367, %1371
  %1373 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 3
  %1374 = load i8, i8 addrspace(4)* %1373, align 1, !tbaa !33
  %1375 = zext i8 %1374 to i64
  %1376 = shl nuw nsw i64 %1375, 24
  %1377 = or i64 %1372, %1376
  %1378 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 4
  %1379 = load i8, i8 addrspace(4)* %1378, align 1, !tbaa !33
  %1380 = zext i8 %1379 to i64
  %1381 = shl nuw nsw i64 %1380, 32
  %1382 = or i64 %1377, %1381
  %1383 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 5
  %1384 = load i8, i8 addrspace(4)* %1383, align 1, !tbaa !33
  %1385 = zext i8 %1384 to i64
  %1386 = shl nuw nsw i64 %1385, 40
  %1387 = or i64 %1382, %1386
  %1388 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 6
  %1389 = load i8, i8 addrspace(4)* %1388, align 1, !tbaa !33
  %1390 = zext i8 %1389 to i64
  %1391 = shl nuw nsw i64 %1390, 48
  %1392 = or i64 %1387, %1391
  %1393 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 7
  %1394 = load i8, i8 addrspace(4)* %1393, align 1, !tbaa !33
  %1395 = zext i8 %1394 to i64
  %1396 = shl nuw i64 %1395, 56
  %1397 = or i64 %1392, %1396
  %1398 = add nsw i32 %1355, -8
  %1399 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 8
  br label %1413

1400:                                             ; preds = %1358, %1400
  %1401 = phi i32 [ %1411, %1400 ], [ 0, %1358 ]
  %1402 = phi i64 [ %1410, %1400 ], [ 0, %1358 ]
  %1403 = zext i32 %1401 to i64
  %1404 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 %1403
  %1405 = load i8, i8 addrspace(4)* %1404, align 1, !tbaa !33
  %1406 = zext i8 %1405 to i64
  %1407 = shl i32 %1401, 3
  %1408 = zext i32 %1407 to i64
  %1409 = shl nuw i64 %1406, %1408
  %1410 = or i64 %1409, %1402
  %1411 = add nuw nsw i32 %1401, 1
  %1412 = icmp eq i32 %1411, %1355
  br i1 %1412, label %1413, label %1400

1413:                                             ; preds = %1400, %1360, %1358
  %1414 = phi i8 addrspace(4)* [ %1399, %1360 ], [ %1354, %1358 ], [ %1354, %1400 ]
  %1415 = phi i32 [ %1398, %1360 ], [ 0, %1358 ], [ 0, %1400 ]
  %1416 = phi i64 [ %1397, %1360 ], [ 0, %1358 ], [ %1410, %1400 ]
  %1417 = icmp ugt i32 %1415, 7
  br i1 %1417, label %1420, label %1418

1418:                                             ; preds = %1413
  %1419 = icmp eq i32 %1415, 0
  br i1 %1419, label %1473, label %1460

1420:                                             ; preds = %1413
  %1421 = load i8, i8 addrspace(4)* %1414, align 1, !tbaa !33
  %1422 = zext i8 %1421 to i64
  %1423 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 1
  %1424 = load i8, i8 addrspace(4)* %1423, align 1, !tbaa !33
  %1425 = zext i8 %1424 to i64
  %1426 = shl nuw nsw i64 %1425, 8
  %1427 = or i64 %1426, %1422
  %1428 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 2
  %1429 = load i8, i8 addrspace(4)* %1428, align 1, !tbaa !33
  %1430 = zext i8 %1429 to i64
  %1431 = shl nuw nsw i64 %1430, 16
  %1432 = or i64 %1427, %1431
  %1433 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 3
  %1434 = load i8, i8 addrspace(4)* %1433, align 1, !tbaa !33
  %1435 = zext i8 %1434 to i64
  %1436 = shl nuw nsw i64 %1435, 24
  %1437 = or i64 %1432, %1436
  %1438 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 4
  %1439 = load i8, i8 addrspace(4)* %1438, align 1, !tbaa !33
  %1440 = zext i8 %1439 to i64
  %1441 = shl nuw nsw i64 %1440, 32
  %1442 = or i64 %1437, %1441
  %1443 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 5
  %1444 = load i8, i8 addrspace(4)* %1443, align 1, !tbaa !33
  %1445 = zext i8 %1444 to i64
  %1446 = shl nuw nsw i64 %1445, 40
  %1447 = or i64 %1442, %1446
  %1448 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 6
  %1449 = load i8, i8 addrspace(4)* %1448, align 1, !tbaa !33
  %1450 = zext i8 %1449 to i64
  %1451 = shl nuw nsw i64 %1450, 48
  %1452 = or i64 %1447, %1451
  %1453 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 7
  %1454 = load i8, i8 addrspace(4)* %1453, align 1, !tbaa !33
  %1455 = zext i8 %1454 to i64
  %1456 = shl nuw i64 %1455, 56
  %1457 = or i64 %1452, %1456
  %1458 = add nsw i32 %1415, -8
  %1459 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 8
  br label %1473

1460:                                             ; preds = %1418, %1460
  %1461 = phi i32 [ %1471, %1460 ], [ 0, %1418 ]
  %1462 = phi i64 [ %1470, %1460 ], [ 0, %1418 ]
  %1463 = zext i32 %1461 to i64
  %1464 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 %1463
  %1465 = load i8, i8 addrspace(4)* %1464, align 1, !tbaa !33
  %1466 = zext i8 %1465 to i64
  %1467 = shl i32 %1461, 3
  %1468 = zext i32 %1467 to i64
  %1469 = shl nuw i64 %1466, %1468
  %1470 = or i64 %1469, %1462
  %1471 = add nuw nsw i32 %1461, 1
  %1472 = icmp eq i32 %1471, %1415
  br i1 %1472, label %1473, label %1460

1473:                                             ; preds = %1460, %1420, %1418
  %1474 = phi i8 addrspace(4)* [ %1459, %1420 ], [ %1414, %1418 ], [ %1414, %1460 ]
  %1475 = phi i32 [ %1458, %1420 ], [ 0, %1418 ], [ 0, %1460 ]
  %1476 = phi i64 [ %1457, %1420 ], [ 0, %1418 ], [ %1470, %1460 ]
  %1477 = icmp ugt i32 %1475, 7
  br i1 %1477, label %1480, label %1478

1478:                                             ; preds = %1473
  %1479 = icmp eq i32 %1475, 0
  br i1 %1479, label %1533, label %1520

1480:                                             ; preds = %1473
  %1481 = load i8, i8 addrspace(4)* %1474, align 1, !tbaa !33
  %1482 = zext i8 %1481 to i64
  %1483 = getelementptr inbounds i8, i8 addrspace(4)* %1474, i64 1
  %1484 = load i8, i8 addrspace(4)* %1483, align 1, !tbaa !33
  %1485 = zext i8 %1484 to i64
  %1486 = shl nuw nsw i64 %1485, 8
  %1487 = or i64 %1486, %1482
  %1488 = getelementptr inbounds i8, i8 addrspace(4)* %1474, i64 2
  %1489 = load i8, i8 addrspace(4)* %1488, align 1, !tbaa !33
  %1490 = zext i8 %1489 to i64
  %1491 = shl nuw nsw i64 %1490, 16
  %1492 = or i64 %1487, %1491
  %1493 = getelementptr inbounds i8, i8 addrspace(4)* %1474, i64 3
  %1494 = load i8, i8 addrspace(4)* %1493, align 1, !tbaa !33
  %1495 = zext i8 %1494 to i64
  %1496 = shl nuw nsw i64 %1495, 24
  %1497 = or i64 %1492, %1496
  %1498 = getelementptr inbounds i8, i8 addrspace(4)* %1474, i64 4
  %1499 = load i8, i8 addrspace(4)* %1498, align 1, !tbaa !33
  %1500 = zext i8 %1499 to i64
  %1501 = shl nuw nsw i64 %1500, 32
  %1502 = or i64 %1497, %1501
  %1503 = getelementptr inbounds i8, i8 addrspace(4)* %1474, i64 5
  %1504 = load i8, i8 addrspace(4)* %1503, align 1, !tbaa !33
  %1505 = zext i8 %1504 to i64
  %1506 = shl nuw nsw i64 %1505, 40
  %1507 = or i64 %1502, %1506
  %1508 = getelementptr inbounds i8, i8 addrspace(4)* %1474, i64 6
  %1509 = load i8, i8 addrspace(4)* %1508, align 1, !tbaa !33
  %1510 = zext i8 %1509 to i64
  %1511 = shl nuw nsw i64 %1510, 48
  %1512 = or i64 %1507, %1511
  %1513 = getelementptr inbounds i8, i8 addrspace(4)* %1474, i64 7
  %1514 = load i8, i8 addrspace(4)* %1513, align 1, !tbaa !33
  %1515 = zext i8 %1514 to i64
  %1516 = shl nuw i64 %1515, 56
  %1517 = or i64 %1512, %1516
  %1518 = add nsw i32 %1475, -8
  %1519 = getelementptr inbounds i8, i8 addrspace(4)* %1474, i64 8
  br label %1533

1520:                                             ; preds = %1478, %1520
  %1521 = phi i32 [ %1531, %1520 ], [ 0, %1478 ]
  %1522 = phi i64 [ %1530, %1520 ], [ 0, %1478 ]
  %1523 = zext i32 %1521 to i64
  %1524 = getelementptr inbounds i8, i8 addrspace(4)* %1474, i64 %1523
  %1525 = load i8, i8 addrspace(4)* %1524, align 1, !tbaa !33
  %1526 = zext i8 %1525 to i64
  %1527 = shl i32 %1521, 3
  %1528 = zext i32 %1527 to i64
  %1529 = shl nuw i64 %1526, %1528
  %1530 = or i64 %1529, %1522
  %1531 = add nuw nsw i32 %1521, 1
  %1532 = icmp eq i32 %1531, %1475
  br i1 %1532, label %1533, label %1520

1533:                                             ; preds = %1520, %1480, %1478
  %1534 = phi i8 addrspace(4)* [ %1519, %1480 ], [ %1474, %1478 ], [ %1474, %1520 ]
  %1535 = phi i32 [ %1518, %1480 ], [ 0, %1478 ], [ 0, %1520 ]
  %1536 = phi i64 [ %1517, %1480 ], [ 0, %1478 ], [ %1530, %1520 ]
  %1537 = icmp ugt i32 %1535, 7
  br i1 %1537, label %1540, label %1538

1538:                                             ; preds = %1533
  %1539 = icmp eq i32 %1535, 0
  br i1 %1539, label %1593, label %1580

1540:                                             ; preds = %1533
  %1541 = load i8, i8 addrspace(4)* %1534, align 1, !tbaa !33
  %1542 = zext i8 %1541 to i64
  %1543 = getelementptr inbounds i8, i8 addrspace(4)* %1534, i64 1
  %1544 = load i8, i8 addrspace(4)* %1543, align 1, !tbaa !33
  %1545 = zext i8 %1544 to i64
  %1546 = shl nuw nsw i64 %1545, 8
  %1547 = or i64 %1546, %1542
  %1548 = getelementptr inbounds i8, i8 addrspace(4)* %1534, i64 2
  %1549 = load i8, i8 addrspace(4)* %1548, align 1, !tbaa !33
  %1550 = zext i8 %1549 to i64
  %1551 = shl nuw nsw i64 %1550, 16
  %1552 = or i64 %1547, %1551
  %1553 = getelementptr inbounds i8, i8 addrspace(4)* %1534, i64 3
  %1554 = load i8, i8 addrspace(4)* %1553, align 1, !tbaa !33
  %1555 = zext i8 %1554 to i64
  %1556 = shl nuw nsw i64 %1555, 24
  %1557 = or i64 %1552, %1556
  %1558 = getelementptr inbounds i8, i8 addrspace(4)* %1534, i64 4
  %1559 = load i8, i8 addrspace(4)* %1558, align 1, !tbaa !33
  %1560 = zext i8 %1559 to i64
  %1561 = shl nuw nsw i64 %1560, 32
  %1562 = or i64 %1557, %1561
  %1563 = getelementptr inbounds i8, i8 addrspace(4)* %1534, i64 5
  %1564 = load i8, i8 addrspace(4)* %1563, align 1, !tbaa !33
  %1565 = zext i8 %1564 to i64
  %1566 = shl nuw nsw i64 %1565, 40
  %1567 = or i64 %1562, %1566
  %1568 = getelementptr inbounds i8, i8 addrspace(4)* %1534, i64 6
  %1569 = load i8, i8 addrspace(4)* %1568, align 1, !tbaa !33
  %1570 = zext i8 %1569 to i64
  %1571 = shl nuw nsw i64 %1570, 48
  %1572 = or i64 %1567, %1571
  %1573 = getelementptr inbounds i8, i8 addrspace(4)* %1534, i64 7
  %1574 = load i8, i8 addrspace(4)* %1573, align 1, !tbaa !33
  %1575 = zext i8 %1574 to i64
  %1576 = shl nuw i64 %1575, 56
  %1577 = or i64 %1572, %1576
  %1578 = add nsw i32 %1535, -8
  %1579 = getelementptr inbounds i8, i8 addrspace(4)* %1534, i64 8
  br label %1593

1580:                                             ; preds = %1538, %1580
  %1581 = phi i32 [ %1591, %1580 ], [ 0, %1538 ]
  %1582 = phi i64 [ %1590, %1580 ], [ 0, %1538 ]
  %1583 = zext i32 %1581 to i64
  %1584 = getelementptr inbounds i8, i8 addrspace(4)* %1534, i64 %1583
  %1585 = load i8, i8 addrspace(4)* %1584, align 1, !tbaa !33
  %1586 = zext i8 %1585 to i64
  %1587 = shl i32 %1581, 3
  %1588 = zext i32 %1587 to i64
  %1589 = shl nuw i64 %1586, %1588
  %1590 = or i64 %1589, %1582
  %1591 = add nuw nsw i32 %1581, 1
  %1592 = icmp eq i32 %1591, %1535
  br i1 %1592, label %1593, label %1580

1593:                                             ; preds = %1580, %1540, %1538
  %1594 = phi i8 addrspace(4)* [ %1579, %1540 ], [ %1534, %1538 ], [ %1534, %1580 ]
  %1595 = phi i32 [ %1578, %1540 ], [ 0, %1538 ], [ 0, %1580 ]
  %1596 = phi i64 [ %1577, %1540 ], [ 0, %1538 ], [ %1590, %1580 ]
  %1597 = icmp ugt i32 %1595, 7
  br i1 %1597, label %1600, label %1598

1598:                                             ; preds = %1593
  %1599 = icmp eq i32 %1595, 0
  br i1 %1599, label %1653, label %1640

1600:                                             ; preds = %1593
  %1601 = load i8, i8 addrspace(4)* %1594, align 1, !tbaa !33
  %1602 = zext i8 %1601 to i64
  %1603 = getelementptr inbounds i8, i8 addrspace(4)* %1594, i64 1
  %1604 = load i8, i8 addrspace(4)* %1603, align 1, !tbaa !33
  %1605 = zext i8 %1604 to i64
  %1606 = shl nuw nsw i64 %1605, 8
  %1607 = or i64 %1606, %1602
  %1608 = getelementptr inbounds i8, i8 addrspace(4)* %1594, i64 2
  %1609 = load i8, i8 addrspace(4)* %1608, align 1, !tbaa !33
  %1610 = zext i8 %1609 to i64
  %1611 = shl nuw nsw i64 %1610, 16
  %1612 = or i64 %1607, %1611
  %1613 = getelementptr inbounds i8, i8 addrspace(4)* %1594, i64 3
  %1614 = load i8, i8 addrspace(4)* %1613, align 1, !tbaa !33
  %1615 = zext i8 %1614 to i64
  %1616 = shl nuw nsw i64 %1615, 24
  %1617 = or i64 %1612, %1616
  %1618 = getelementptr inbounds i8, i8 addrspace(4)* %1594, i64 4
  %1619 = load i8, i8 addrspace(4)* %1618, align 1, !tbaa !33
  %1620 = zext i8 %1619 to i64
  %1621 = shl nuw nsw i64 %1620, 32
  %1622 = or i64 %1617, %1621
  %1623 = getelementptr inbounds i8, i8 addrspace(4)* %1594, i64 5
  %1624 = load i8, i8 addrspace(4)* %1623, align 1, !tbaa !33
  %1625 = zext i8 %1624 to i64
  %1626 = shl nuw nsw i64 %1625, 40
  %1627 = or i64 %1622, %1626
  %1628 = getelementptr inbounds i8, i8 addrspace(4)* %1594, i64 6
  %1629 = load i8, i8 addrspace(4)* %1628, align 1, !tbaa !33
  %1630 = zext i8 %1629 to i64
  %1631 = shl nuw nsw i64 %1630, 48
  %1632 = or i64 %1627, %1631
  %1633 = getelementptr inbounds i8, i8 addrspace(4)* %1594, i64 7
  %1634 = load i8, i8 addrspace(4)* %1633, align 1, !tbaa !33
  %1635 = zext i8 %1634 to i64
  %1636 = shl nuw i64 %1635, 56
  %1637 = or i64 %1632, %1636
  %1638 = add nsw i32 %1595, -8
  %1639 = getelementptr inbounds i8, i8 addrspace(4)* %1594, i64 8
  br label %1653

1640:                                             ; preds = %1598, %1640
  %1641 = phi i32 [ %1651, %1640 ], [ 0, %1598 ]
  %1642 = phi i64 [ %1650, %1640 ], [ 0, %1598 ]
  %1643 = zext i32 %1641 to i64
  %1644 = getelementptr inbounds i8, i8 addrspace(4)* %1594, i64 %1643
  %1645 = load i8, i8 addrspace(4)* %1644, align 1, !tbaa !33
  %1646 = zext i8 %1645 to i64
  %1647 = shl i32 %1641, 3
  %1648 = zext i32 %1647 to i64
  %1649 = shl nuw i64 %1646, %1648
  %1650 = or i64 %1649, %1642
  %1651 = add nuw nsw i32 %1641, 1
  %1652 = icmp eq i32 %1651, %1595
  br i1 %1652, label %1653, label %1640

1653:                                             ; preds = %1640, %1600, %1598
  %1654 = phi i8 addrspace(4)* [ %1639, %1600 ], [ %1594, %1598 ], [ %1594, %1640 ]
  %1655 = phi i32 [ %1638, %1600 ], [ 0, %1598 ], [ 0, %1640 ]
  %1656 = phi i64 [ %1637, %1600 ], [ 0, %1598 ], [ %1650, %1640 ]
  %1657 = icmp ugt i32 %1655, 7
  br i1 %1657, label %1660, label %1658

1658:                                             ; preds = %1653
  %1659 = icmp eq i32 %1655, 0
  br i1 %1659, label %1711, label %1698

1660:                                             ; preds = %1653
  %1661 = load i8, i8 addrspace(4)* %1654, align 1, !tbaa !33
  %1662 = zext i8 %1661 to i64
  %1663 = getelementptr inbounds i8, i8 addrspace(4)* %1654, i64 1
  %1664 = load i8, i8 addrspace(4)* %1663, align 1, !tbaa !33
  %1665 = zext i8 %1664 to i64
  %1666 = shl nuw nsw i64 %1665, 8
  %1667 = or i64 %1666, %1662
  %1668 = getelementptr inbounds i8, i8 addrspace(4)* %1654, i64 2
  %1669 = load i8, i8 addrspace(4)* %1668, align 1, !tbaa !33
  %1670 = zext i8 %1669 to i64
  %1671 = shl nuw nsw i64 %1670, 16
  %1672 = or i64 %1667, %1671
  %1673 = getelementptr inbounds i8, i8 addrspace(4)* %1654, i64 3
  %1674 = load i8, i8 addrspace(4)* %1673, align 1, !tbaa !33
  %1675 = zext i8 %1674 to i64
  %1676 = shl nuw nsw i64 %1675, 24
  %1677 = or i64 %1672, %1676
  %1678 = getelementptr inbounds i8, i8 addrspace(4)* %1654, i64 4
  %1679 = load i8, i8 addrspace(4)* %1678, align 1, !tbaa !33
  %1680 = zext i8 %1679 to i64
  %1681 = shl nuw nsw i64 %1680, 32
  %1682 = or i64 %1677, %1681
  %1683 = getelementptr inbounds i8, i8 addrspace(4)* %1654, i64 5
  %1684 = load i8, i8 addrspace(4)* %1683, align 1, !tbaa !33
  %1685 = zext i8 %1684 to i64
  %1686 = shl nuw nsw i64 %1685, 40
  %1687 = or i64 %1682, %1686
  %1688 = getelementptr inbounds i8, i8 addrspace(4)* %1654, i64 6
  %1689 = load i8, i8 addrspace(4)* %1688, align 1, !tbaa !33
  %1690 = zext i8 %1689 to i64
  %1691 = shl nuw nsw i64 %1690, 48
  %1692 = or i64 %1687, %1691
  %1693 = getelementptr inbounds i8, i8 addrspace(4)* %1654, i64 7
  %1694 = load i8, i8 addrspace(4)* %1693, align 1, !tbaa !33
  %1695 = zext i8 %1694 to i64
  %1696 = shl nuw i64 %1695, 56
  %1697 = or i64 %1692, %1696
  br label %1711

1698:                                             ; preds = %1658, %1698
  %1699 = phi i32 [ %1709, %1698 ], [ 0, %1658 ]
  %1700 = phi i64 [ %1708, %1698 ], [ 0, %1658 ]
  %1701 = zext i32 %1699 to i64
  %1702 = getelementptr inbounds i8, i8 addrspace(4)* %1654, i64 %1701
  %1703 = load i8, i8 addrspace(4)* %1702, align 1, !tbaa !33
  %1704 = zext i8 %1703 to i64
  %1705 = shl i32 %1699, 3
  %1706 = zext i32 %1705 to i64
  %1707 = shl nuw i64 %1704, %1706
  %1708 = or i64 %1707, %1700
  %1709 = add nuw nsw i32 %1699, 1
  %1710 = icmp eq i32 %1709, %1655
  br i1 %1710, label %1711, label %1698

1711:                                             ; preds = %1698, %1660, %1658
  %1712 = phi i64 [ %1697, %1660 ], [ 0, %1658 ], [ %1708, %1698 ]
  %1713 = shl nuw nsw i64 %1294, 2
  %1714 = add nuw nsw i64 %1713, 28
  %1715 = and i64 %1714, 480
  %1716 = and i64 %1296, -225
  %1717 = or i64 %1716, %1715
  %1718 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1274, i64 noundef %1717, i64 noundef %1356, i64 noundef %1416, i64 noundef %1476, i64 noundef %1536, i64 noundef %1596, i64 noundef %1656, i64 noundef %1712) #12
  %1719 = sub i64 %1286, %1294
  %1720 = getelementptr inbounds i8, i8 addrspace(4)* %1287, i64 %1294
  %1721 = icmp eq i64 %1719, 0
  br i1 %1721, label %1722, label %1285

1722:                                             ; preds = %1711, %1277
  %1723 = phi <2 x i64> [ %1280, %1277 ], [ %1718, %1711 ]
  %1724 = extractelement <2 x i64> %1723, i64 0
  %1725 = zext i32 %1205 to i64
  %1726 = and i64 %1724, -225
  %1727 = or i64 %1726, 32
  %1728 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1274, i64 noundef %1727, i64 noundef %1725, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1729 = extractelement <2 x i64> %1728, i64 0
  %1730 = and i64 %1729, -225
  %1731 = or i64 %1730, 32
  %1732 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1274, i64 noundef %1731, i64 noundef %988, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1733 = extractelement <2 x i64> %1732, i64 0
  %1734 = and i64 %1733, -227
  %1735 = or i64 %1734, 34
  %1736 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1274, i64 noundef %1735, i64 noundef %989, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %1737

1737:                                             ; preds = %1722, %1201
  %1738 = sext i32 %1205 to i64
  %1739 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1738
  store float %1202, float addrspace(1)* %1739, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %1016, label %1740, label %1793

1740:                                             ; preds = %1737
  %1741 = mul nsw i32 %1013, %9
  %1742 = add nsw i32 %1741, %12
  %1743 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1742
  store float %1096, float addrspace(3)* %1743, align 4, !tbaa !16
  br i1 %991, label %1793, label %1744

1744:                                             ; preds = %1740
  br i1 %1008, label %1782, label %1745

1745:                                             ; preds = %1744, %1745
  %1746 = phi i32 [ %1779, %1745 ], [ 1, %1744 ]
  %1747 = phi i32 [ %1780, %1745 ], [ 0, %1744 ]
  %1748 = add nsw i32 %1746, %1742
  %1749 = extractelement <3 x float> %1095, i32 %1746
  %1750 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1748
  store float %1749, float addrspace(3)* %1750, align 4, !tbaa !16
  %1751 = add nuw nsw i32 %1746, 1
  %1752 = add nsw i32 %1751, %1742
  %1753 = extractelement <3 x float> %1095, i32 %1751
  %1754 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1752
  store float %1753, float addrspace(3)* %1754, align 4, !tbaa !16
  %1755 = add nuw nsw i32 %1746, 2
  %1756 = add nsw i32 %1755, %1742
  %1757 = extractelement <3 x float> %1095, i32 %1755
  %1758 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1756
  store float %1757, float addrspace(3)* %1758, align 4, !tbaa !16
  %1759 = add nuw nsw i32 %1746, 3
  %1760 = add nsw i32 %1759, %1742
  %1761 = extractelement <3 x float> %1095, i32 %1759
  %1762 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1760
  store float %1761, float addrspace(3)* %1762, align 4, !tbaa !16
  %1763 = add nuw nsw i32 %1746, 4
  %1764 = add nsw i32 %1763, %1742
  %1765 = extractelement <3 x float> %1095, i32 %1763
  %1766 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1764
  store float %1765, float addrspace(3)* %1766, align 4, !tbaa !16
  %1767 = add nuw nsw i32 %1746, 5
  %1768 = add nsw i32 %1767, %1742
  %1769 = extractelement <3 x float> %1095, i32 %1767
  %1770 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1768
  store float %1769, float addrspace(3)* %1770, align 4, !tbaa !16
  %1771 = add nuw nsw i32 %1746, 6
  %1772 = add nsw i32 %1771, %1742
  %1773 = extractelement <3 x float> %1095, i32 %1771
  %1774 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1772
  store float %1773, float addrspace(3)* %1774, align 4, !tbaa !16
  %1775 = add nuw nsw i32 %1746, 7
  %1776 = add nsw i32 %1775, %1742
  %1777 = extractelement <3 x float> %1095, i32 %1775
  %1778 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1776
  store float %1777, float addrspace(3)* %1778, align 4, !tbaa !16
  %1779 = add nuw nsw i32 %1746, 8
  %1780 = add i32 %1747, 8
  %1781 = icmp eq i32 %1780, %1009
  br i1 %1781, label %1782, label %1745, !llvm.loop !35

1782:                                             ; preds = %1745, %1744
  %1783 = phi i32 [ 1, %1744 ], [ %1779, %1745 ]
  br i1 %1010, label %1793, label %1784

1784:                                             ; preds = %1782, %1784
  %1785 = phi i32 [ %1790, %1784 ], [ %1783, %1782 ]
  %1786 = phi i32 [ %1791, %1784 ], [ 0, %1782 ]
  %1787 = add nsw i32 %1785, %1742
  %1788 = extractelement <3 x float> %1095, i32 %1785
  %1789 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1787
  store float %1788, float addrspace(3)* %1789, align 4, !tbaa !16
  %1790 = add nuw nsw i32 %1785, 1
  %1791 = add i32 %1786, 1
  %1792 = icmp eq i32 %1791, %1007
  br i1 %1792, label %1793, label %1784, !llvm.loop !41

1793:                                             ; preds = %1782, %1784, %1740, %1737
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1794 = add nsw i32 %1013, 1
  br i1 %1016, label %1011, label %3442, !llvm.loop !37

1795:                                             ; preds = %970
  br i1 %29, label %2615, label %1796

1796:                                             ; preds = %1795
  %1797 = icmp sgt i32 %10, %2
  br i1 %1797, label %3442, label %1798

1798:                                             ; preds = %1796
  %1799 = add nsw i32 %18, -1
  %1800 = icmp ne i32 %12, %1799
  %1801 = icmp slt i32 %10, 2
  %1802 = mul i32 %10, %10
  %1803 = icmp eq i32 %10, 0
  %1804 = mul nsw i32 %7, %6
  %1805 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %1806 = getelementptr inbounds i8, i8 addrspace(4)* %1805, i64 24
  %1807 = bitcast i8 addrspace(4)* %1806 to i64 addrspace(4)*
  %1808 = zext i32 %12 to i64
  %1809 = zext i32 %42 to i64
  %1810 = tail call i32 @llvm.umax.i32(i32 %1802, i32 1)
  %1811 = select i1 %1800, i1 true, i1 %1801
  %1812 = add i32 %10, -1
  %1813 = add i32 %10, -2
  %1814 = add i32 %1810, -1
  %1815 = and i32 %1812, 7
  %1816 = icmp ult i32 %1813, 7
  %1817 = and i32 %1812, -8
  %1818 = icmp eq i32 %1815, 0
  %1819 = and i32 %10, 7
  %1820 = icmp ult i32 %1812, 7
  %1821 = and i32 %10, -8
  %1822 = icmp eq i32 %1819, 0
  %1823 = and i32 %1810, 7
  %1824 = icmp ult i32 %1814, 7
  %1825 = and i32 %1810, -8
  %1826 = icmp eq i32 %1823, 0
  %1827 = and i32 %1812, 7
  %1828 = icmp ult i32 %1813, 7
  %1829 = and i32 %1812, -8
  %1830 = icmp eq i32 %1827, 0
  br label %1831

1831:                                             ; preds = %2613, %1798
  %1832 = phi <9 x float> [ undef, %1798 ], [ %1921, %2613 ]
  %1833 = phi i32 [ %10, %1798 ], [ %2614, %2613 ]
  %1834 = phi float [ undef, %1798 ], [ %1916, %2613 ]
  %1835 = phi <3 x float> [ undef, %1798 ], [ %1915, %2613 ]
  %1836 = icmp slt i32 %1833, %2
  br i1 %1836, label %1837, label %1914

1837:                                             ; preds = %1831
  %1838 = mul nsw i32 %1833, %5
  %1839 = add nsw i32 %1838, %42
  %1840 = sext i32 %1839 to i64
  %1841 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1840
  %1842 = load float, float addrspace(1)* %1841, align 4, !tbaa !16
  br i1 %1811, label %1914, label %1843

1843:                                             ; preds = %1837
  br i1 %1816, label %1898, label %1844

1844:                                             ; preds = %1843, %1844
  %1845 = phi i32 [ %1895, %1844 ], [ 1, %1843 ]
  %1846 = phi <3 x float> [ %1894, %1844 ], [ %1835, %1843 ]
  %1847 = phi i32 [ %1896, %1844 ], [ 0, %1843 ]
  %1848 = add nsw i32 %1845, %1839
  %1849 = sext i32 %1848 to i64
  %1850 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1849
  %1851 = load float, float addrspace(1)* %1850, align 4, !tbaa !16
  %1852 = insertelement <3 x float> %1846, float %1851, i32 %1845
  %1853 = add nuw nsw i32 %1845, 1
  %1854 = add nsw i32 %1853, %1839
  %1855 = sext i32 %1854 to i64
  %1856 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1855
  %1857 = load float, float addrspace(1)* %1856, align 4, !tbaa !16
  %1858 = insertelement <3 x float> %1852, float %1857, i32 %1853
  %1859 = add nuw nsw i32 %1845, 2
  %1860 = add nsw i32 %1859, %1839
  %1861 = sext i32 %1860 to i64
  %1862 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1861
  %1863 = load float, float addrspace(1)* %1862, align 4, !tbaa !16
  %1864 = insertelement <3 x float> %1858, float %1863, i32 %1859
  %1865 = add nuw nsw i32 %1845, 3
  %1866 = add nsw i32 %1865, %1839
  %1867 = sext i32 %1866 to i64
  %1868 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1867
  %1869 = load float, float addrspace(1)* %1868, align 4, !tbaa !16
  %1870 = insertelement <3 x float> %1864, float %1869, i32 %1865
  %1871 = add nuw nsw i32 %1845, 4
  %1872 = add nsw i32 %1871, %1839
  %1873 = sext i32 %1872 to i64
  %1874 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1873
  %1875 = load float, float addrspace(1)* %1874, align 4, !tbaa !16
  %1876 = insertelement <3 x float> %1870, float %1875, i32 %1871
  %1877 = add nuw nsw i32 %1845, 5
  %1878 = add nsw i32 %1877, %1839
  %1879 = sext i32 %1878 to i64
  %1880 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1879
  %1881 = load float, float addrspace(1)* %1880, align 4, !tbaa !16
  %1882 = insertelement <3 x float> %1876, float %1881, i32 %1877
  %1883 = add nuw nsw i32 %1845, 6
  %1884 = add nsw i32 %1883, %1839
  %1885 = sext i32 %1884 to i64
  %1886 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1885
  %1887 = load float, float addrspace(1)* %1886, align 4, !tbaa !16
  %1888 = insertelement <3 x float> %1882, float %1887, i32 %1883
  %1889 = add nuw nsw i32 %1845, 7
  %1890 = add nsw i32 %1889, %1839
  %1891 = sext i32 %1890 to i64
  %1892 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1891
  %1893 = load float, float addrspace(1)* %1892, align 4, !tbaa !16
  %1894 = insertelement <3 x float> %1888, float %1893, i32 %1889
  %1895 = add nuw nsw i32 %1845, 8
  %1896 = add i32 %1847, 8
  %1897 = icmp eq i32 %1896, %1817
  br i1 %1897, label %1898, label %1844, !llvm.loop !25

1898:                                             ; preds = %1844, %1843
  %1899 = phi <3 x float> [ undef, %1843 ], [ %1894, %1844 ]
  %1900 = phi i32 [ 1, %1843 ], [ %1895, %1844 ]
  %1901 = phi <3 x float> [ %1835, %1843 ], [ %1894, %1844 ]
  br i1 %1818, label %1914, label %1902

1902:                                             ; preds = %1898, %1902
  %1903 = phi i32 [ %1911, %1902 ], [ %1900, %1898 ]
  %1904 = phi <3 x float> [ %1910, %1902 ], [ %1901, %1898 ]
  %1905 = phi i32 [ %1912, %1902 ], [ 0, %1898 ]
  %1906 = add nsw i32 %1903, %1839
  %1907 = sext i32 %1906 to i64
  %1908 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1907
  %1909 = load float, float addrspace(1)* %1908, align 4, !tbaa !16
  %1910 = insertelement <3 x float> %1904, float %1909, i32 %1903
  %1911 = add nuw nsw i32 %1903, 1
  %1912 = add i32 %1905, 1
  %1913 = icmp eq i32 %1912, %1815
  br i1 %1913, label %1914, label %1902, !llvm.loop !42

1914:                                             ; preds = %1898, %1902, %1837, %1831
  %1915 = phi <3 x float> [ %1835, %1831 ], [ %1835, %1837 ], [ %1899, %1898 ], [ %1910, %1902 ]
  %1916 = phi float [ %1834, %1831 ], [ %1842, %1837 ], [ %1842, %1902 ], [ %1842, %1898 ]
  %1917 = sub nsw i32 %1833, %10
  br i1 %43, label %1918, label %1920

1918:                                             ; preds = %1914
  %1919 = sub i32 %10, %1833
  br label %1923

1920:                                             ; preds = %1946, %1914
  %1921 = phi <9 x float> [ %1832, %1914 ], [ %1947, %1946 ]
  br i1 %1803, label %2021, label %1922

1922:                                             ; preds = %1920
  br i1 %1824, label %2004, label %2029

1923:                                             ; preds = %1946, %1918
  %1924 = phi <9 x float> [ %1832, %1918 ], [ %1947, %1946 ]
  %1925 = phi i32 [ %1917, %1918 ], [ %1948, %1946 ]
  %1926 = mul nsw i32 %1925, %9
  %1927 = add nsw i32 %1926, %12
  %1928 = add i32 %1919, %1925
  %1929 = mul nsw i32 %1928, %10
  br i1 %1820, label %1930, label %1950

1930:                                             ; preds = %1950, %1923
  %1931 = phi <9 x float> [ undef, %1923 ], [ %2000, %1950 ]
  %1932 = phi <9 x float> [ %1924, %1923 ], [ %2000, %1950 ]
  %1933 = phi i32 [ 0, %1923 ], [ %2001, %1950 ]
  br i1 %1822, label %1946, label %1934

1934:                                             ; preds = %1930, %1934
  %1935 = phi <9 x float> [ %1942, %1934 ], [ %1932, %1930 ]
  %1936 = phi i32 [ %1943, %1934 ], [ %1933, %1930 ]
  %1937 = phi i32 [ %1944, %1934 ], [ 0, %1930 ]
  %1938 = add nsw i32 %1927, %1936
  %1939 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1938
  %1940 = load float, float addrspace(3)* %1939, align 4, !tbaa !16
  %1941 = add nsw i32 %1936, %1929
  %1942 = insertelement <9 x float> %1935, float %1940, i32 %1941
  %1943 = add nuw nsw i32 %1936, 1
  %1944 = add i32 %1937, 1
  %1945 = icmp eq i32 %1944, %1819
  br i1 %1945, label %1946, label %1934, !llvm.loop !43

1946:                                             ; preds = %1934, %1930
  %1947 = phi <9 x float> [ %1931, %1930 ], [ %1942, %1934 ]
  %1948 = add nsw i32 %1925, 1
  %1949 = icmp slt i32 %1948, %1833
  br i1 %1949, label %1923, label %1920, !llvm.loop !28

1950:                                             ; preds = %1923, %1950
  %1951 = phi <9 x float> [ %2000, %1950 ], [ %1924, %1923 ]
  %1952 = phi i32 [ %2001, %1950 ], [ 0, %1923 ]
  %1953 = phi i32 [ %2002, %1950 ], [ 0, %1923 ]
  %1954 = add nsw i32 %1927, %1952
  %1955 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1954
  %1956 = load float, float addrspace(3)* %1955, align 4, !tbaa !16
  %1957 = add nsw i32 %1952, %1929
  %1958 = insertelement <9 x float> %1951, float %1956, i32 %1957
  %1959 = or i32 %1952, 1
  %1960 = add nsw i32 %1927, %1959
  %1961 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1960
  %1962 = load float, float addrspace(3)* %1961, align 4, !tbaa !16
  %1963 = add nsw i32 %1959, %1929
  %1964 = insertelement <9 x float> %1958, float %1962, i32 %1963
  %1965 = or i32 %1952, 2
  %1966 = add nsw i32 %1927, %1965
  %1967 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1966
  %1968 = load float, float addrspace(3)* %1967, align 4, !tbaa !16
  %1969 = add nsw i32 %1965, %1929
  %1970 = insertelement <9 x float> %1964, float %1968, i32 %1969
  %1971 = or i32 %1952, 3
  %1972 = add nsw i32 %1927, %1971
  %1973 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1972
  %1974 = load float, float addrspace(3)* %1973, align 4, !tbaa !16
  %1975 = add nsw i32 %1971, %1929
  %1976 = insertelement <9 x float> %1970, float %1974, i32 %1975
  %1977 = or i32 %1952, 4
  %1978 = add nsw i32 %1927, %1977
  %1979 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1978
  %1980 = load float, float addrspace(3)* %1979, align 4, !tbaa !16
  %1981 = add nsw i32 %1977, %1929
  %1982 = insertelement <9 x float> %1976, float %1980, i32 %1981
  %1983 = or i32 %1952, 5
  %1984 = add nsw i32 %1927, %1983
  %1985 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1984
  %1986 = load float, float addrspace(3)* %1985, align 4, !tbaa !16
  %1987 = add nsw i32 %1983, %1929
  %1988 = insertelement <9 x float> %1982, float %1986, i32 %1987
  %1989 = or i32 %1952, 6
  %1990 = add nsw i32 %1927, %1989
  %1991 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1990
  %1992 = load float, float addrspace(3)* %1991, align 4, !tbaa !16
  %1993 = add nsw i32 %1989, %1929
  %1994 = insertelement <9 x float> %1988, float %1992, i32 %1993
  %1995 = or i32 %1952, 7
  %1996 = add nsw i32 %1927, %1995
  %1997 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %1996
  %1998 = load float, float addrspace(3)* %1997, align 4, !tbaa !16
  %1999 = add nsw i32 %1995, %1929
  %2000 = insertelement <9 x float> %1994, float %1998, i32 %1999
  %2001 = add nuw nsw i32 %1952, 8
  %2002 = add i32 %1953, 8
  %2003 = icmp eq i32 %2002, %1821
  br i1 %2003, label %1930, label %1950, !llvm.loop !29

2004:                                             ; preds = %2029, %1922
  %2005 = phi float [ undef, %1922 ], [ %2087, %2029 ]
  %2006 = phi i32 [ 0, %1922 ], [ %2088, %2029 ]
  %2007 = phi float [ 0.000000e+00, %1922 ], [ %2087, %2029 ]
  br i1 %1826, label %2021, label %2008

2008:                                             ; preds = %2004, %2008
  %2009 = phi i32 [ %2018, %2008 ], [ %2006, %2004 ]
  %2010 = phi float [ %2017, %2008 ], [ %2007, %2004 ]
  %2011 = phi i32 [ %2019, %2008 ], [ 0, %2004 ]
  %2012 = zext i32 %2009 to i64
  %2013 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2012
  %2014 = load float, float addrspace(4)* %2013, align 4, !tbaa !16
  %2015 = extractelement <9 x float> %1921, i32 %2009
  %2016 = fmul contract float %2015, %2014
  %2017 = fadd contract float %2010, %2016
  %2018 = add nuw nsw i32 %2009, 1
  %2019 = add i32 %2011, 1
  %2020 = icmp eq i32 %2019, %1823
  br i1 %2020, label %2021, label %2008, !llvm.loop !44

2021:                                             ; preds = %2004, %2008, %1920
  %2022 = phi float [ 0.000000e+00, %1920 ], [ %2005, %2004 ], [ %2017, %2008 ]
  %2023 = add nsw i32 %1917, %38
  %2024 = mul nsw i32 %2023, %7
  %2025 = add i32 %41, %2024
  %2026 = icmp sgt i32 %2025, -1
  %2027 = icmp slt i32 %2025, %1804
  %2028 = select i1 %2026, i1 %2027, i1 false
  br i1 %2028, label %2557, label %2091

2029:                                             ; preds = %1922, %2029
  %2030 = phi i32 [ %2088, %2029 ], [ 0, %1922 ]
  %2031 = phi float [ %2087, %2029 ], [ 0.000000e+00, %1922 ]
  %2032 = phi i32 [ %2089, %2029 ], [ 0, %1922 ]
  %2033 = zext i32 %2030 to i64
  %2034 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2033
  %2035 = load float, float addrspace(4)* %2034, align 16, !tbaa !16
  %2036 = extractelement <9 x float> %1921, i32 %2030
  %2037 = fmul contract float %2036, %2035
  %2038 = fadd contract float %2031, %2037
  %2039 = or i32 %2030, 1
  %2040 = zext i32 %2039 to i64
  %2041 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2040
  %2042 = load float, float addrspace(4)* %2041, align 4, !tbaa !16
  %2043 = extractelement <9 x float> %1921, i32 %2039
  %2044 = fmul contract float %2043, %2042
  %2045 = fadd contract float %2038, %2044
  %2046 = or i32 %2030, 2
  %2047 = zext i32 %2046 to i64
  %2048 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2047
  %2049 = load float, float addrspace(4)* %2048, align 8, !tbaa !16
  %2050 = extractelement <9 x float> %1921, i32 %2046
  %2051 = fmul contract float %2050, %2049
  %2052 = fadd contract float %2045, %2051
  %2053 = or i32 %2030, 3
  %2054 = zext i32 %2053 to i64
  %2055 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2054
  %2056 = load float, float addrspace(4)* %2055, align 4, !tbaa !16
  %2057 = extractelement <9 x float> %1921, i32 %2053
  %2058 = fmul contract float %2057, %2056
  %2059 = fadd contract float %2052, %2058
  %2060 = or i32 %2030, 4
  %2061 = zext i32 %2060 to i64
  %2062 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2061
  %2063 = load float, float addrspace(4)* %2062, align 16, !tbaa !16
  %2064 = extractelement <9 x float> %1921, i32 %2060
  %2065 = fmul contract float %2064, %2063
  %2066 = fadd contract float %2059, %2065
  %2067 = or i32 %2030, 5
  %2068 = zext i32 %2067 to i64
  %2069 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2068
  %2070 = load float, float addrspace(4)* %2069, align 4, !tbaa !16
  %2071 = extractelement <9 x float> %1921, i32 %2067
  %2072 = fmul contract float %2071, %2070
  %2073 = fadd contract float %2066, %2072
  %2074 = or i32 %2030, 6
  %2075 = zext i32 %2074 to i64
  %2076 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2075
  %2077 = load float, float addrspace(4)* %2076, align 8, !tbaa !16
  %2078 = extractelement <9 x float> %1921, i32 %2074
  %2079 = fmul contract float %2078, %2077
  %2080 = fadd contract float %2073, %2079
  %2081 = or i32 %2030, 7
  %2082 = zext i32 %2081 to i64
  %2083 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2082
  %2084 = load float, float addrspace(4)* %2083, align 4, !tbaa !16
  %2085 = extractelement <9 x float> %1921, i32 %2081
  %2086 = fmul contract float %2085, %2084
  %2087 = fadd contract float %2080, %2086
  %2088 = add nuw nsw i32 %2030, 8
  %2089 = add i32 %2032, 8
  %2090 = icmp eq i32 %2089, %1825
  br i1 %2090, label %2004, label %2029, !llvm.loop !31

2091:                                             ; preds = %2021
  %2092 = load i64, i64 addrspace(4)* %1807, align 8, !tbaa !32
  %2093 = inttoptr i64 %2092 to i8 addrspace(1)*
  %2094 = addrspacecast i8 addrspace(1)* %2093 to i8*
  %2095 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2094, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %2096 = extractelement <2 x i64> %2095, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %2097, label %2101

2097:                                             ; preds = %2091
  %2098 = and i64 %2096, -225
  %2099 = or i64 %2098, 32
  %2100 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2094, i64 noundef %2099, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %2542

2101:                                             ; preds = %2091
  %2102 = and i64 %2096, 2
  %2103 = and i64 %2096, -3
  %2104 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2103, i64 0
  br label %2105

2105:                                             ; preds = %2531, %2101
  %2106 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 29) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([30 x i8]* addrspacecast ([30 x i8] addrspace(4)* @.str to [30 x i8]*) to i64)), i64 1))), %2101 ], [ %2539, %2531 ]
  %2107 = phi i8 addrspace(4)* [ getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0), %2101 ], [ %2540, %2531 ]
  %2108 = phi <2 x i64> [ %2104, %2101 ], [ %2538, %2531 ]
  %2109 = icmp ugt i64 %2106, 56
  %2110 = extractelement <2 x i64> %2108, i64 0
  %2111 = or i64 %2110, %2102
  %2112 = insertelement <2 x i64> poison, i64 %2111, i64 0
  %2113 = select i1 %2109, <2 x i64> %2108, <2 x i64> %2112
  %2114 = tail call i64 @llvm.umin.i64(i64 %2106, i64 56)
  %2115 = trunc i64 %2114 to i32
  %2116 = extractelement <2 x i64> %2113, i64 0
  %2117 = icmp ugt i32 %2115, 7
  br i1 %2117, label %2120, label %2118

2118:                                             ; preds = %2105
  %2119 = icmp eq i32 %2115, 0
  br i1 %2119, label %2173, label %2160

2120:                                             ; preds = %2105
  %2121 = load i8, i8 addrspace(4)* %2107, align 1, !tbaa !33
  %2122 = zext i8 %2121 to i64
  %2123 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 1
  %2124 = load i8, i8 addrspace(4)* %2123, align 1, !tbaa !33
  %2125 = zext i8 %2124 to i64
  %2126 = shl nuw nsw i64 %2125, 8
  %2127 = or i64 %2126, %2122
  %2128 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 2
  %2129 = load i8, i8 addrspace(4)* %2128, align 1, !tbaa !33
  %2130 = zext i8 %2129 to i64
  %2131 = shl nuw nsw i64 %2130, 16
  %2132 = or i64 %2127, %2131
  %2133 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 3
  %2134 = load i8, i8 addrspace(4)* %2133, align 1, !tbaa !33
  %2135 = zext i8 %2134 to i64
  %2136 = shl nuw nsw i64 %2135, 24
  %2137 = or i64 %2132, %2136
  %2138 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 4
  %2139 = load i8, i8 addrspace(4)* %2138, align 1, !tbaa !33
  %2140 = zext i8 %2139 to i64
  %2141 = shl nuw nsw i64 %2140, 32
  %2142 = or i64 %2137, %2141
  %2143 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 5
  %2144 = load i8, i8 addrspace(4)* %2143, align 1, !tbaa !33
  %2145 = zext i8 %2144 to i64
  %2146 = shl nuw nsw i64 %2145, 40
  %2147 = or i64 %2142, %2146
  %2148 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 6
  %2149 = load i8, i8 addrspace(4)* %2148, align 1, !tbaa !33
  %2150 = zext i8 %2149 to i64
  %2151 = shl nuw nsw i64 %2150, 48
  %2152 = or i64 %2147, %2151
  %2153 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 7
  %2154 = load i8, i8 addrspace(4)* %2153, align 1, !tbaa !33
  %2155 = zext i8 %2154 to i64
  %2156 = shl nuw i64 %2155, 56
  %2157 = or i64 %2152, %2156
  %2158 = add nsw i32 %2115, -8
  %2159 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 8
  br label %2173

2160:                                             ; preds = %2118, %2160
  %2161 = phi i32 [ %2171, %2160 ], [ 0, %2118 ]
  %2162 = phi i64 [ %2170, %2160 ], [ 0, %2118 ]
  %2163 = zext i32 %2161 to i64
  %2164 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 %2163
  %2165 = load i8, i8 addrspace(4)* %2164, align 1, !tbaa !33
  %2166 = zext i8 %2165 to i64
  %2167 = shl i32 %2161, 3
  %2168 = zext i32 %2167 to i64
  %2169 = shl nuw i64 %2166, %2168
  %2170 = or i64 %2169, %2162
  %2171 = add nuw nsw i32 %2161, 1
  %2172 = icmp eq i32 %2171, %2115
  br i1 %2172, label %2173, label %2160, !llvm.loop !34

2173:                                             ; preds = %2160, %2120, %2118
  %2174 = phi i8 addrspace(4)* [ %2159, %2120 ], [ %2107, %2118 ], [ %2107, %2160 ]
  %2175 = phi i32 [ %2158, %2120 ], [ 0, %2118 ], [ 0, %2160 ]
  %2176 = phi i64 [ %2157, %2120 ], [ 0, %2118 ], [ %2170, %2160 ]
  %2177 = icmp ugt i32 %2175, 7
  br i1 %2177, label %2180, label %2178

2178:                                             ; preds = %2173
  %2179 = icmp eq i32 %2175, 0
  br i1 %2179, label %2233, label %2220

2180:                                             ; preds = %2173
  %2181 = load i8, i8 addrspace(4)* %2174, align 1, !tbaa !33
  %2182 = zext i8 %2181 to i64
  %2183 = getelementptr inbounds i8, i8 addrspace(4)* %2174, i64 1
  %2184 = load i8, i8 addrspace(4)* %2183, align 1, !tbaa !33
  %2185 = zext i8 %2184 to i64
  %2186 = shl nuw nsw i64 %2185, 8
  %2187 = or i64 %2186, %2182
  %2188 = getelementptr inbounds i8, i8 addrspace(4)* %2174, i64 2
  %2189 = load i8, i8 addrspace(4)* %2188, align 1, !tbaa !33
  %2190 = zext i8 %2189 to i64
  %2191 = shl nuw nsw i64 %2190, 16
  %2192 = or i64 %2187, %2191
  %2193 = getelementptr inbounds i8, i8 addrspace(4)* %2174, i64 3
  %2194 = load i8, i8 addrspace(4)* %2193, align 1, !tbaa !33
  %2195 = zext i8 %2194 to i64
  %2196 = shl nuw nsw i64 %2195, 24
  %2197 = or i64 %2192, %2196
  %2198 = getelementptr inbounds i8, i8 addrspace(4)* %2174, i64 4
  %2199 = load i8, i8 addrspace(4)* %2198, align 1, !tbaa !33
  %2200 = zext i8 %2199 to i64
  %2201 = shl nuw nsw i64 %2200, 32
  %2202 = or i64 %2197, %2201
  %2203 = getelementptr inbounds i8, i8 addrspace(4)* %2174, i64 5
  %2204 = load i8, i8 addrspace(4)* %2203, align 1, !tbaa !33
  %2205 = zext i8 %2204 to i64
  %2206 = shl nuw nsw i64 %2205, 40
  %2207 = or i64 %2202, %2206
  %2208 = getelementptr inbounds i8, i8 addrspace(4)* %2174, i64 6
  %2209 = load i8, i8 addrspace(4)* %2208, align 1, !tbaa !33
  %2210 = zext i8 %2209 to i64
  %2211 = shl nuw nsw i64 %2210, 48
  %2212 = or i64 %2207, %2211
  %2213 = getelementptr inbounds i8, i8 addrspace(4)* %2174, i64 7
  %2214 = load i8, i8 addrspace(4)* %2213, align 1, !tbaa !33
  %2215 = zext i8 %2214 to i64
  %2216 = shl nuw i64 %2215, 56
  %2217 = or i64 %2212, %2216
  %2218 = add nsw i32 %2175, -8
  %2219 = getelementptr inbounds i8, i8 addrspace(4)* %2174, i64 8
  br label %2233

2220:                                             ; preds = %2178, %2220
  %2221 = phi i32 [ %2231, %2220 ], [ 0, %2178 ]
  %2222 = phi i64 [ %2230, %2220 ], [ 0, %2178 ]
  %2223 = zext i32 %2221 to i64
  %2224 = getelementptr inbounds i8, i8 addrspace(4)* %2174, i64 %2223
  %2225 = load i8, i8 addrspace(4)* %2224, align 1, !tbaa !33
  %2226 = zext i8 %2225 to i64
  %2227 = shl i32 %2221, 3
  %2228 = zext i32 %2227 to i64
  %2229 = shl nuw i64 %2226, %2228
  %2230 = or i64 %2229, %2222
  %2231 = add nuw nsw i32 %2221, 1
  %2232 = icmp eq i32 %2231, %2175
  br i1 %2232, label %2233, label %2220

2233:                                             ; preds = %2220, %2180, %2178
  %2234 = phi i8 addrspace(4)* [ %2219, %2180 ], [ %2174, %2178 ], [ %2174, %2220 ]
  %2235 = phi i32 [ %2218, %2180 ], [ 0, %2178 ], [ 0, %2220 ]
  %2236 = phi i64 [ %2217, %2180 ], [ 0, %2178 ], [ %2230, %2220 ]
  %2237 = icmp ugt i32 %2235, 7
  br i1 %2237, label %2240, label %2238

2238:                                             ; preds = %2233
  %2239 = icmp eq i32 %2235, 0
  br i1 %2239, label %2293, label %2280

2240:                                             ; preds = %2233
  %2241 = load i8, i8 addrspace(4)* %2234, align 1, !tbaa !33
  %2242 = zext i8 %2241 to i64
  %2243 = getelementptr inbounds i8, i8 addrspace(4)* %2234, i64 1
  %2244 = load i8, i8 addrspace(4)* %2243, align 1, !tbaa !33
  %2245 = zext i8 %2244 to i64
  %2246 = shl nuw nsw i64 %2245, 8
  %2247 = or i64 %2246, %2242
  %2248 = getelementptr inbounds i8, i8 addrspace(4)* %2234, i64 2
  %2249 = load i8, i8 addrspace(4)* %2248, align 1, !tbaa !33
  %2250 = zext i8 %2249 to i64
  %2251 = shl nuw nsw i64 %2250, 16
  %2252 = or i64 %2247, %2251
  %2253 = getelementptr inbounds i8, i8 addrspace(4)* %2234, i64 3
  %2254 = load i8, i8 addrspace(4)* %2253, align 1, !tbaa !33
  %2255 = zext i8 %2254 to i64
  %2256 = shl nuw nsw i64 %2255, 24
  %2257 = or i64 %2252, %2256
  %2258 = getelementptr inbounds i8, i8 addrspace(4)* %2234, i64 4
  %2259 = load i8, i8 addrspace(4)* %2258, align 1, !tbaa !33
  %2260 = zext i8 %2259 to i64
  %2261 = shl nuw nsw i64 %2260, 32
  %2262 = or i64 %2257, %2261
  %2263 = getelementptr inbounds i8, i8 addrspace(4)* %2234, i64 5
  %2264 = load i8, i8 addrspace(4)* %2263, align 1, !tbaa !33
  %2265 = zext i8 %2264 to i64
  %2266 = shl nuw nsw i64 %2265, 40
  %2267 = or i64 %2262, %2266
  %2268 = getelementptr inbounds i8, i8 addrspace(4)* %2234, i64 6
  %2269 = load i8, i8 addrspace(4)* %2268, align 1, !tbaa !33
  %2270 = zext i8 %2269 to i64
  %2271 = shl nuw nsw i64 %2270, 48
  %2272 = or i64 %2267, %2271
  %2273 = getelementptr inbounds i8, i8 addrspace(4)* %2234, i64 7
  %2274 = load i8, i8 addrspace(4)* %2273, align 1, !tbaa !33
  %2275 = zext i8 %2274 to i64
  %2276 = shl nuw i64 %2275, 56
  %2277 = or i64 %2272, %2276
  %2278 = add nsw i32 %2235, -8
  %2279 = getelementptr inbounds i8, i8 addrspace(4)* %2234, i64 8
  br label %2293

2280:                                             ; preds = %2238, %2280
  %2281 = phi i32 [ %2291, %2280 ], [ 0, %2238 ]
  %2282 = phi i64 [ %2290, %2280 ], [ 0, %2238 ]
  %2283 = zext i32 %2281 to i64
  %2284 = getelementptr inbounds i8, i8 addrspace(4)* %2234, i64 %2283
  %2285 = load i8, i8 addrspace(4)* %2284, align 1, !tbaa !33
  %2286 = zext i8 %2285 to i64
  %2287 = shl i32 %2281, 3
  %2288 = zext i32 %2287 to i64
  %2289 = shl nuw i64 %2286, %2288
  %2290 = or i64 %2289, %2282
  %2291 = add nuw nsw i32 %2281, 1
  %2292 = icmp eq i32 %2291, %2235
  br i1 %2292, label %2293, label %2280

2293:                                             ; preds = %2280, %2240, %2238
  %2294 = phi i8 addrspace(4)* [ %2279, %2240 ], [ %2234, %2238 ], [ %2234, %2280 ]
  %2295 = phi i32 [ %2278, %2240 ], [ 0, %2238 ], [ 0, %2280 ]
  %2296 = phi i64 [ %2277, %2240 ], [ 0, %2238 ], [ %2290, %2280 ]
  %2297 = icmp ugt i32 %2295, 7
  br i1 %2297, label %2300, label %2298

2298:                                             ; preds = %2293
  %2299 = icmp eq i32 %2295, 0
  br i1 %2299, label %2353, label %2340

2300:                                             ; preds = %2293
  %2301 = load i8, i8 addrspace(4)* %2294, align 1, !tbaa !33
  %2302 = zext i8 %2301 to i64
  %2303 = getelementptr inbounds i8, i8 addrspace(4)* %2294, i64 1
  %2304 = load i8, i8 addrspace(4)* %2303, align 1, !tbaa !33
  %2305 = zext i8 %2304 to i64
  %2306 = shl nuw nsw i64 %2305, 8
  %2307 = or i64 %2306, %2302
  %2308 = getelementptr inbounds i8, i8 addrspace(4)* %2294, i64 2
  %2309 = load i8, i8 addrspace(4)* %2308, align 1, !tbaa !33
  %2310 = zext i8 %2309 to i64
  %2311 = shl nuw nsw i64 %2310, 16
  %2312 = or i64 %2307, %2311
  %2313 = getelementptr inbounds i8, i8 addrspace(4)* %2294, i64 3
  %2314 = load i8, i8 addrspace(4)* %2313, align 1, !tbaa !33
  %2315 = zext i8 %2314 to i64
  %2316 = shl nuw nsw i64 %2315, 24
  %2317 = or i64 %2312, %2316
  %2318 = getelementptr inbounds i8, i8 addrspace(4)* %2294, i64 4
  %2319 = load i8, i8 addrspace(4)* %2318, align 1, !tbaa !33
  %2320 = zext i8 %2319 to i64
  %2321 = shl nuw nsw i64 %2320, 32
  %2322 = or i64 %2317, %2321
  %2323 = getelementptr inbounds i8, i8 addrspace(4)* %2294, i64 5
  %2324 = load i8, i8 addrspace(4)* %2323, align 1, !tbaa !33
  %2325 = zext i8 %2324 to i64
  %2326 = shl nuw nsw i64 %2325, 40
  %2327 = or i64 %2322, %2326
  %2328 = getelementptr inbounds i8, i8 addrspace(4)* %2294, i64 6
  %2329 = load i8, i8 addrspace(4)* %2328, align 1, !tbaa !33
  %2330 = zext i8 %2329 to i64
  %2331 = shl nuw nsw i64 %2330, 48
  %2332 = or i64 %2327, %2331
  %2333 = getelementptr inbounds i8, i8 addrspace(4)* %2294, i64 7
  %2334 = load i8, i8 addrspace(4)* %2333, align 1, !tbaa !33
  %2335 = zext i8 %2334 to i64
  %2336 = shl nuw i64 %2335, 56
  %2337 = or i64 %2332, %2336
  %2338 = add nsw i32 %2295, -8
  %2339 = getelementptr inbounds i8, i8 addrspace(4)* %2294, i64 8
  br label %2353

2340:                                             ; preds = %2298, %2340
  %2341 = phi i32 [ %2351, %2340 ], [ 0, %2298 ]
  %2342 = phi i64 [ %2350, %2340 ], [ 0, %2298 ]
  %2343 = zext i32 %2341 to i64
  %2344 = getelementptr inbounds i8, i8 addrspace(4)* %2294, i64 %2343
  %2345 = load i8, i8 addrspace(4)* %2344, align 1, !tbaa !33
  %2346 = zext i8 %2345 to i64
  %2347 = shl i32 %2341, 3
  %2348 = zext i32 %2347 to i64
  %2349 = shl nuw i64 %2346, %2348
  %2350 = or i64 %2349, %2342
  %2351 = add nuw nsw i32 %2341, 1
  %2352 = icmp eq i32 %2351, %2295
  br i1 %2352, label %2353, label %2340

2353:                                             ; preds = %2340, %2300, %2298
  %2354 = phi i8 addrspace(4)* [ %2339, %2300 ], [ %2294, %2298 ], [ %2294, %2340 ]
  %2355 = phi i32 [ %2338, %2300 ], [ 0, %2298 ], [ 0, %2340 ]
  %2356 = phi i64 [ %2337, %2300 ], [ 0, %2298 ], [ %2350, %2340 ]
  %2357 = icmp ugt i32 %2355, 7
  br i1 %2357, label %2360, label %2358

2358:                                             ; preds = %2353
  %2359 = icmp eq i32 %2355, 0
  br i1 %2359, label %2413, label %2400

2360:                                             ; preds = %2353
  %2361 = load i8, i8 addrspace(4)* %2354, align 1, !tbaa !33
  %2362 = zext i8 %2361 to i64
  %2363 = getelementptr inbounds i8, i8 addrspace(4)* %2354, i64 1
  %2364 = load i8, i8 addrspace(4)* %2363, align 1, !tbaa !33
  %2365 = zext i8 %2364 to i64
  %2366 = shl nuw nsw i64 %2365, 8
  %2367 = or i64 %2366, %2362
  %2368 = getelementptr inbounds i8, i8 addrspace(4)* %2354, i64 2
  %2369 = load i8, i8 addrspace(4)* %2368, align 1, !tbaa !33
  %2370 = zext i8 %2369 to i64
  %2371 = shl nuw nsw i64 %2370, 16
  %2372 = or i64 %2367, %2371
  %2373 = getelementptr inbounds i8, i8 addrspace(4)* %2354, i64 3
  %2374 = load i8, i8 addrspace(4)* %2373, align 1, !tbaa !33
  %2375 = zext i8 %2374 to i64
  %2376 = shl nuw nsw i64 %2375, 24
  %2377 = or i64 %2372, %2376
  %2378 = getelementptr inbounds i8, i8 addrspace(4)* %2354, i64 4
  %2379 = load i8, i8 addrspace(4)* %2378, align 1, !tbaa !33
  %2380 = zext i8 %2379 to i64
  %2381 = shl nuw nsw i64 %2380, 32
  %2382 = or i64 %2377, %2381
  %2383 = getelementptr inbounds i8, i8 addrspace(4)* %2354, i64 5
  %2384 = load i8, i8 addrspace(4)* %2383, align 1, !tbaa !33
  %2385 = zext i8 %2384 to i64
  %2386 = shl nuw nsw i64 %2385, 40
  %2387 = or i64 %2382, %2386
  %2388 = getelementptr inbounds i8, i8 addrspace(4)* %2354, i64 6
  %2389 = load i8, i8 addrspace(4)* %2388, align 1, !tbaa !33
  %2390 = zext i8 %2389 to i64
  %2391 = shl nuw nsw i64 %2390, 48
  %2392 = or i64 %2387, %2391
  %2393 = getelementptr inbounds i8, i8 addrspace(4)* %2354, i64 7
  %2394 = load i8, i8 addrspace(4)* %2393, align 1, !tbaa !33
  %2395 = zext i8 %2394 to i64
  %2396 = shl nuw i64 %2395, 56
  %2397 = or i64 %2392, %2396
  %2398 = add nsw i32 %2355, -8
  %2399 = getelementptr inbounds i8, i8 addrspace(4)* %2354, i64 8
  br label %2413

2400:                                             ; preds = %2358, %2400
  %2401 = phi i32 [ %2411, %2400 ], [ 0, %2358 ]
  %2402 = phi i64 [ %2410, %2400 ], [ 0, %2358 ]
  %2403 = zext i32 %2401 to i64
  %2404 = getelementptr inbounds i8, i8 addrspace(4)* %2354, i64 %2403
  %2405 = load i8, i8 addrspace(4)* %2404, align 1, !tbaa !33
  %2406 = zext i8 %2405 to i64
  %2407 = shl i32 %2401, 3
  %2408 = zext i32 %2407 to i64
  %2409 = shl nuw i64 %2406, %2408
  %2410 = or i64 %2409, %2402
  %2411 = add nuw nsw i32 %2401, 1
  %2412 = icmp eq i32 %2411, %2355
  br i1 %2412, label %2413, label %2400

2413:                                             ; preds = %2400, %2360, %2358
  %2414 = phi i8 addrspace(4)* [ %2399, %2360 ], [ %2354, %2358 ], [ %2354, %2400 ]
  %2415 = phi i32 [ %2398, %2360 ], [ 0, %2358 ], [ 0, %2400 ]
  %2416 = phi i64 [ %2397, %2360 ], [ 0, %2358 ], [ %2410, %2400 ]
  %2417 = icmp ugt i32 %2415, 7
  br i1 %2417, label %2420, label %2418

2418:                                             ; preds = %2413
  %2419 = icmp eq i32 %2415, 0
  br i1 %2419, label %2473, label %2460

2420:                                             ; preds = %2413
  %2421 = load i8, i8 addrspace(4)* %2414, align 1, !tbaa !33
  %2422 = zext i8 %2421 to i64
  %2423 = getelementptr inbounds i8, i8 addrspace(4)* %2414, i64 1
  %2424 = load i8, i8 addrspace(4)* %2423, align 1, !tbaa !33
  %2425 = zext i8 %2424 to i64
  %2426 = shl nuw nsw i64 %2425, 8
  %2427 = or i64 %2426, %2422
  %2428 = getelementptr inbounds i8, i8 addrspace(4)* %2414, i64 2
  %2429 = load i8, i8 addrspace(4)* %2428, align 1, !tbaa !33
  %2430 = zext i8 %2429 to i64
  %2431 = shl nuw nsw i64 %2430, 16
  %2432 = or i64 %2427, %2431
  %2433 = getelementptr inbounds i8, i8 addrspace(4)* %2414, i64 3
  %2434 = load i8, i8 addrspace(4)* %2433, align 1, !tbaa !33
  %2435 = zext i8 %2434 to i64
  %2436 = shl nuw nsw i64 %2435, 24
  %2437 = or i64 %2432, %2436
  %2438 = getelementptr inbounds i8, i8 addrspace(4)* %2414, i64 4
  %2439 = load i8, i8 addrspace(4)* %2438, align 1, !tbaa !33
  %2440 = zext i8 %2439 to i64
  %2441 = shl nuw nsw i64 %2440, 32
  %2442 = or i64 %2437, %2441
  %2443 = getelementptr inbounds i8, i8 addrspace(4)* %2414, i64 5
  %2444 = load i8, i8 addrspace(4)* %2443, align 1, !tbaa !33
  %2445 = zext i8 %2444 to i64
  %2446 = shl nuw nsw i64 %2445, 40
  %2447 = or i64 %2442, %2446
  %2448 = getelementptr inbounds i8, i8 addrspace(4)* %2414, i64 6
  %2449 = load i8, i8 addrspace(4)* %2448, align 1, !tbaa !33
  %2450 = zext i8 %2449 to i64
  %2451 = shl nuw nsw i64 %2450, 48
  %2452 = or i64 %2447, %2451
  %2453 = getelementptr inbounds i8, i8 addrspace(4)* %2414, i64 7
  %2454 = load i8, i8 addrspace(4)* %2453, align 1, !tbaa !33
  %2455 = zext i8 %2454 to i64
  %2456 = shl nuw i64 %2455, 56
  %2457 = or i64 %2452, %2456
  %2458 = add nsw i32 %2415, -8
  %2459 = getelementptr inbounds i8, i8 addrspace(4)* %2414, i64 8
  br label %2473

2460:                                             ; preds = %2418, %2460
  %2461 = phi i32 [ %2471, %2460 ], [ 0, %2418 ]
  %2462 = phi i64 [ %2470, %2460 ], [ 0, %2418 ]
  %2463 = zext i32 %2461 to i64
  %2464 = getelementptr inbounds i8, i8 addrspace(4)* %2414, i64 %2463
  %2465 = load i8, i8 addrspace(4)* %2464, align 1, !tbaa !33
  %2466 = zext i8 %2465 to i64
  %2467 = shl i32 %2461, 3
  %2468 = zext i32 %2467 to i64
  %2469 = shl nuw i64 %2466, %2468
  %2470 = or i64 %2469, %2462
  %2471 = add nuw nsw i32 %2461, 1
  %2472 = icmp eq i32 %2471, %2415
  br i1 %2472, label %2473, label %2460

2473:                                             ; preds = %2460, %2420, %2418
  %2474 = phi i8 addrspace(4)* [ %2459, %2420 ], [ %2414, %2418 ], [ %2414, %2460 ]
  %2475 = phi i32 [ %2458, %2420 ], [ 0, %2418 ], [ 0, %2460 ]
  %2476 = phi i64 [ %2457, %2420 ], [ 0, %2418 ], [ %2470, %2460 ]
  %2477 = icmp ugt i32 %2475, 7
  br i1 %2477, label %2480, label %2478

2478:                                             ; preds = %2473
  %2479 = icmp eq i32 %2475, 0
  br i1 %2479, label %2531, label %2518

2480:                                             ; preds = %2473
  %2481 = load i8, i8 addrspace(4)* %2474, align 1, !tbaa !33
  %2482 = zext i8 %2481 to i64
  %2483 = getelementptr inbounds i8, i8 addrspace(4)* %2474, i64 1
  %2484 = load i8, i8 addrspace(4)* %2483, align 1, !tbaa !33
  %2485 = zext i8 %2484 to i64
  %2486 = shl nuw nsw i64 %2485, 8
  %2487 = or i64 %2486, %2482
  %2488 = getelementptr inbounds i8, i8 addrspace(4)* %2474, i64 2
  %2489 = load i8, i8 addrspace(4)* %2488, align 1, !tbaa !33
  %2490 = zext i8 %2489 to i64
  %2491 = shl nuw nsw i64 %2490, 16
  %2492 = or i64 %2487, %2491
  %2493 = getelementptr inbounds i8, i8 addrspace(4)* %2474, i64 3
  %2494 = load i8, i8 addrspace(4)* %2493, align 1, !tbaa !33
  %2495 = zext i8 %2494 to i64
  %2496 = shl nuw nsw i64 %2495, 24
  %2497 = or i64 %2492, %2496
  %2498 = getelementptr inbounds i8, i8 addrspace(4)* %2474, i64 4
  %2499 = load i8, i8 addrspace(4)* %2498, align 1, !tbaa !33
  %2500 = zext i8 %2499 to i64
  %2501 = shl nuw nsw i64 %2500, 32
  %2502 = or i64 %2497, %2501
  %2503 = getelementptr inbounds i8, i8 addrspace(4)* %2474, i64 5
  %2504 = load i8, i8 addrspace(4)* %2503, align 1, !tbaa !33
  %2505 = zext i8 %2504 to i64
  %2506 = shl nuw nsw i64 %2505, 40
  %2507 = or i64 %2502, %2506
  %2508 = getelementptr inbounds i8, i8 addrspace(4)* %2474, i64 6
  %2509 = load i8, i8 addrspace(4)* %2508, align 1, !tbaa !33
  %2510 = zext i8 %2509 to i64
  %2511 = shl nuw nsw i64 %2510, 48
  %2512 = or i64 %2507, %2511
  %2513 = getelementptr inbounds i8, i8 addrspace(4)* %2474, i64 7
  %2514 = load i8, i8 addrspace(4)* %2513, align 1, !tbaa !33
  %2515 = zext i8 %2514 to i64
  %2516 = shl nuw i64 %2515, 56
  %2517 = or i64 %2512, %2516
  br label %2531

2518:                                             ; preds = %2478, %2518
  %2519 = phi i32 [ %2529, %2518 ], [ 0, %2478 ]
  %2520 = phi i64 [ %2528, %2518 ], [ 0, %2478 ]
  %2521 = zext i32 %2519 to i64
  %2522 = getelementptr inbounds i8, i8 addrspace(4)* %2474, i64 %2521
  %2523 = load i8, i8 addrspace(4)* %2522, align 1, !tbaa !33
  %2524 = zext i8 %2523 to i64
  %2525 = shl i32 %2519, 3
  %2526 = zext i32 %2525 to i64
  %2527 = shl nuw i64 %2524, %2526
  %2528 = or i64 %2527, %2520
  %2529 = add nuw nsw i32 %2519, 1
  %2530 = icmp eq i32 %2529, %2475
  br i1 %2530, label %2531, label %2518

2531:                                             ; preds = %2518, %2480, %2478
  %2532 = phi i64 [ %2517, %2480 ], [ 0, %2478 ], [ %2528, %2518 ]
  %2533 = shl nuw nsw i64 %2114, 2
  %2534 = add nuw nsw i64 %2533, 28
  %2535 = and i64 %2534, 480
  %2536 = and i64 %2116, -225
  %2537 = or i64 %2536, %2535
  %2538 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2094, i64 noundef %2537, i64 noundef %2176, i64 noundef %2236, i64 noundef %2296, i64 noundef %2356, i64 noundef %2416, i64 noundef %2476, i64 noundef %2532) #12
  %2539 = sub i64 %2106, %2114
  %2540 = getelementptr inbounds i8, i8 addrspace(4)* %2107, i64 %2114
  %2541 = icmp eq i64 %2539, 0
  br i1 %2541, label %2542, label %2105

2542:                                             ; preds = %2531, %2097
  %2543 = phi <2 x i64> [ %2100, %2097 ], [ %2538, %2531 ]
  %2544 = extractelement <2 x i64> %2543, i64 0
  %2545 = zext i32 %2025 to i64
  %2546 = and i64 %2544, -225
  %2547 = or i64 %2546, 32
  %2548 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2094, i64 noundef %2547, i64 noundef %2545, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %2549 = extractelement <2 x i64> %2548, i64 0
  %2550 = and i64 %2549, -225
  %2551 = or i64 %2550, 32
  %2552 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2094, i64 noundef %2551, i64 noundef %1808, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %2553 = extractelement <2 x i64> %2552, i64 0
  %2554 = and i64 %2553, -227
  %2555 = or i64 %2554, 34
  %2556 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2094, i64 noundef %2555, i64 noundef %1809, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %2557

2557:                                             ; preds = %2542, %2021
  %2558 = sext i32 %2025 to i64
  %2559 = getelementptr inbounds float, float addrspace(1)* %1, i64 %2558
  store float %2022, float addrspace(1)* %2559, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %1836, label %2560, label %2613

2560:                                             ; preds = %2557
  %2561 = mul nsw i32 %1833, %9
  %2562 = add nsw i32 %2561, %12
  %2563 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2562
  store float %1916, float addrspace(3)* %2563, align 4, !tbaa !16
  br i1 %1811, label %2613, label %2564

2564:                                             ; preds = %2560
  br i1 %1828, label %2602, label %2565

2565:                                             ; preds = %2564, %2565
  %2566 = phi i32 [ %2599, %2565 ], [ 1, %2564 ]
  %2567 = phi i32 [ %2600, %2565 ], [ 0, %2564 ]
  %2568 = add nsw i32 %2566, %2562
  %2569 = extractelement <3 x float> %1915, i32 %2566
  %2570 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2568
  store float %2569, float addrspace(3)* %2570, align 4, !tbaa !16
  %2571 = add nuw nsw i32 %2566, 1
  %2572 = add nsw i32 %2571, %2562
  %2573 = extractelement <3 x float> %1915, i32 %2571
  %2574 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2572
  store float %2573, float addrspace(3)* %2574, align 4, !tbaa !16
  %2575 = add nuw nsw i32 %2566, 2
  %2576 = add nsw i32 %2575, %2562
  %2577 = extractelement <3 x float> %1915, i32 %2575
  %2578 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2576
  store float %2577, float addrspace(3)* %2578, align 4, !tbaa !16
  %2579 = add nuw nsw i32 %2566, 3
  %2580 = add nsw i32 %2579, %2562
  %2581 = extractelement <3 x float> %1915, i32 %2579
  %2582 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2580
  store float %2581, float addrspace(3)* %2582, align 4, !tbaa !16
  %2583 = add nuw nsw i32 %2566, 4
  %2584 = add nsw i32 %2583, %2562
  %2585 = extractelement <3 x float> %1915, i32 %2583
  %2586 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2584
  store float %2585, float addrspace(3)* %2586, align 4, !tbaa !16
  %2587 = add nuw nsw i32 %2566, 5
  %2588 = add nsw i32 %2587, %2562
  %2589 = extractelement <3 x float> %1915, i32 %2587
  %2590 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2588
  store float %2589, float addrspace(3)* %2590, align 4, !tbaa !16
  %2591 = add nuw nsw i32 %2566, 6
  %2592 = add nsw i32 %2591, %2562
  %2593 = extractelement <3 x float> %1915, i32 %2591
  %2594 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2592
  store float %2593, float addrspace(3)* %2594, align 4, !tbaa !16
  %2595 = add nuw nsw i32 %2566, 7
  %2596 = add nsw i32 %2595, %2562
  %2597 = extractelement <3 x float> %1915, i32 %2595
  %2598 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2596
  store float %2597, float addrspace(3)* %2598, align 4, !tbaa !16
  %2599 = add nuw nsw i32 %2566, 8
  %2600 = add i32 %2567, 8
  %2601 = icmp eq i32 %2600, %1829
  br i1 %2601, label %2602, label %2565, !llvm.loop !35

2602:                                             ; preds = %2565, %2564
  %2603 = phi i32 [ 1, %2564 ], [ %2599, %2565 ]
  br i1 %1830, label %2613, label %2604

2604:                                             ; preds = %2602, %2604
  %2605 = phi i32 [ %2610, %2604 ], [ %2603, %2602 ]
  %2606 = phi i32 [ %2611, %2604 ], [ 0, %2602 ]
  %2607 = add nsw i32 %2605, %2562
  %2608 = extractelement <3 x float> %1915, i32 %2605
  %2609 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2607
  store float %2608, float addrspace(3)* %2609, align 4, !tbaa !16
  %2610 = add nuw nsw i32 %2605, 1
  %2611 = add i32 %2606, 1
  %2612 = icmp eq i32 %2611, %1827
  br i1 %2612, label %2613, label %2604, !llvm.loop !45

2613:                                             ; preds = %2602, %2604, %2560, %2557
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2614 = add nsw i32 %1833, 1
  br i1 %1836, label %1831, label %3442, !llvm.loop !37

2615:                                             ; preds = %1795
  br i1 %32, label %3442, label %2616

2616:                                             ; preds = %2615
  %2617 = sub i32 1, %10
  %2618 = add i32 %2617, %18
  %2619 = icmp slt i32 %12, %2618
  br i1 %2619, label %2620, label %3442

2620:                                             ; preds = %2616
  %2621 = add nsw i32 %10, %2
  %2622 = add nsw i32 %2621, -1
  %2623 = icmp sgt i32 %2, 0
  br i1 %2623, label %2624, label %3442

2624:                                             ; preds = %2620
  %2625 = sub nsw i32 %18, %10
  %2626 = icmp ne i32 %12, %2625
  %2627 = icmp slt i32 %10, 2
  %2628 = mul i32 %10, %10
  %2629 = icmp eq i32 %10, 0
  %2630 = mul nsw i32 %7, %6
  %2631 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %2632 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 24
  %2633 = bitcast i8 addrspace(4)* %2632 to i64 addrspace(4)*
  %2634 = zext i32 %12 to i64
  %2635 = zext i32 %42 to i64
  %2636 = tail call i32 @llvm.umax.i32(i32 %2628, i32 1)
  %2637 = or i1 %2627, %2626
  %2638 = add i32 %10, -1
  %2639 = add i32 %10, -2
  %2640 = add i32 %2636, -1
  %2641 = and i32 %2638, 7
  %2642 = icmp ult i32 %2639, 7
  %2643 = and i32 %2638, -8
  %2644 = icmp eq i32 %2641, 0
  %2645 = and i32 %10, 7
  %2646 = icmp ult i32 %2638, 7
  %2647 = and i32 %10, -8
  %2648 = icmp eq i32 %2645, 0
  %2649 = and i32 %2636, 7
  %2650 = icmp ult i32 %2640, 7
  %2651 = and i32 %2636, -8
  %2652 = icmp eq i32 %2649, 0
  %2653 = and i32 %2638, 7
  %2654 = icmp ult i32 %2639, 7
  %2655 = and i32 %2638, -8
  %2656 = icmp eq i32 %2653, 0
  br label %2657

2657:                                             ; preds = %3439, %2624
  %2658 = phi <9 x float> [ undef, %2624 ], [ %2747, %3439 ]
  %2659 = phi i32 [ %10, %2624 ], [ %3440, %3439 ]
  %2660 = phi float [ undef, %2624 ], [ %2742, %3439 ]
  %2661 = phi <3 x float> [ undef, %2624 ], [ %2741, %3439 ]
  %2662 = icmp slt i32 %2659, %2621
  br i1 %2662, label %2663, label %2740

2663:                                             ; preds = %2657
  %2664 = mul nsw i32 %2659, %5
  %2665 = add nsw i32 %2664, %42
  %2666 = sext i32 %2665 to i64
  %2667 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2666
  %2668 = load float, float addrspace(1)* %2667, align 4, !tbaa !16
  br i1 %2637, label %2740, label %2669

2669:                                             ; preds = %2663
  br i1 %2642, label %2724, label %2670

2670:                                             ; preds = %2669, %2670
  %2671 = phi i32 [ %2721, %2670 ], [ 1, %2669 ]
  %2672 = phi <3 x float> [ %2720, %2670 ], [ %2661, %2669 ]
  %2673 = phi i32 [ %2722, %2670 ], [ 0, %2669 ]
  %2674 = add nsw i32 %2671, %2665
  %2675 = sext i32 %2674 to i64
  %2676 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2675
  %2677 = load float, float addrspace(1)* %2676, align 4, !tbaa !16
  %2678 = insertelement <3 x float> %2672, float %2677, i32 %2671
  %2679 = add nuw nsw i32 %2671, 1
  %2680 = add nsw i32 %2679, %2665
  %2681 = sext i32 %2680 to i64
  %2682 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2681
  %2683 = load float, float addrspace(1)* %2682, align 4, !tbaa !16
  %2684 = insertelement <3 x float> %2678, float %2683, i32 %2679
  %2685 = add nuw nsw i32 %2671, 2
  %2686 = add nsw i32 %2685, %2665
  %2687 = sext i32 %2686 to i64
  %2688 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2687
  %2689 = load float, float addrspace(1)* %2688, align 4, !tbaa !16
  %2690 = insertelement <3 x float> %2684, float %2689, i32 %2685
  %2691 = add nuw nsw i32 %2671, 3
  %2692 = add nsw i32 %2691, %2665
  %2693 = sext i32 %2692 to i64
  %2694 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2693
  %2695 = load float, float addrspace(1)* %2694, align 4, !tbaa !16
  %2696 = insertelement <3 x float> %2690, float %2695, i32 %2691
  %2697 = add nuw nsw i32 %2671, 4
  %2698 = add nsw i32 %2697, %2665
  %2699 = sext i32 %2698 to i64
  %2700 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2699
  %2701 = load float, float addrspace(1)* %2700, align 4, !tbaa !16
  %2702 = insertelement <3 x float> %2696, float %2701, i32 %2697
  %2703 = add nuw nsw i32 %2671, 5
  %2704 = add nsw i32 %2703, %2665
  %2705 = sext i32 %2704 to i64
  %2706 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2705
  %2707 = load float, float addrspace(1)* %2706, align 4, !tbaa !16
  %2708 = insertelement <3 x float> %2702, float %2707, i32 %2703
  %2709 = add nuw nsw i32 %2671, 6
  %2710 = add nsw i32 %2709, %2665
  %2711 = sext i32 %2710 to i64
  %2712 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2711
  %2713 = load float, float addrspace(1)* %2712, align 4, !tbaa !16
  %2714 = insertelement <3 x float> %2708, float %2713, i32 %2709
  %2715 = add nuw nsw i32 %2671, 7
  %2716 = add nsw i32 %2715, %2665
  %2717 = sext i32 %2716 to i64
  %2718 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2717
  %2719 = load float, float addrspace(1)* %2718, align 4, !tbaa !16
  %2720 = insertelement <3 x float> %2714, float %2719, i32 %2715
  %2721 = add nuw nsw i32 %2671, 8
  %2722 = add i32 %2673, 8
  %2723 = icmp eq i32 %2722, %2643
  br i1 %2723, label %2724, label %2670, !llvm.loop !25

2724:                                             ; preds = %2670, %2669
  %2725 = phi <3 x float> [ undef, %2669 ], [ %2720, %2670 ]
  %2726 = phi i32 [ 1, %2669 ], [ %2721, %2670 ]
  %2727 = phi <3 x float> [ %2661, %2669 ], [ %2720, %2670 ]
  br i1 %2644, label %2740, label %2728

2728:                                             ; preds = %2724, %2728
  %2729 = phi i32 [ %2737, %2728 ], [ %2726, %2724 ]
  %2730 = phi <3 x float> [ %2736, %2728 ], [ %2727, %2724 ]
  %2731 = phi i32 [ %2738, %2728 ], [ 0, %2724 ]
  %2732 = add nsw i32 %2729, %2665
  %2733 = sext i32 %2732 to i64
  %2734 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2733
  %2735 = load float, float addrspace(1)* %2734, align 4, !tbaa !16
  %2736 = insertelement <3 x float> %2730, float %2735, i32 %2729
  %2737 = add nuw nsw i32 %2729, 1
  %2738 = add i32 %2731, 1
  %2739 = icmp eq i32 %2738, %2641
  br i1 %2739, label %2740, label %2728, !llvm.loop !46

2740:                                             ; preds = %2724, %2728, %2663, %2657
  %2741 = phi <3 x float> [ %2661, %2657 ], [ %2661, %2663 ], [ %2725, %2724 ], [ %2736, %2728 ]
  %2742 = phi float [ %2660, %2657 ], [ %2668, %2663 ], [ %2668, %2728 ], [ %2668, %2724 ]
  %2743 = sub nsw i32 %2659, %10
  br i1 %43, label %2744, label %2746

2744:                                             ; preds = %2740
  %2745 = sub i32 %10, %2659
  br label %2749

2746:                                             ; preds = %2772, %2740
  %2747 = phi <9 x float> [ %2658, %2740 ], [ %2773, %2772 ]
  br i1 %2629, label %2847, label %2748

2748:                                             ; preds = %2746
  br i1 %2650, label %2830, label %2855

2749:                                             ; preds = %2772, %2744
  %2750 = phi <9 x float> [ %2658, %2744 ], [ %2773, %2772 ]
  %2751 = phi i32 [ %2743, %2744 ], [ %2774, %2772 ]
  %2752 = mul nsw i32 %2751, %9
  %2753 = add nsw i32 %2752, %12
  %2754 = add i32 %2745, %2751
  %2755 = mul nsw i32 %2754, %10
  br i1 %2646, label %2756, label %2776

2756:                                             ; preds = %2776, %2749
  %2757 = phi <9 x float> [ undef, %2749 ], [ %2826, %2776 ]
  %2758 = phi <9 x float> [ %2750, %2749 ], [ %2826, %2776 ]
  %2759 = phi i32 [ 0, %2749 ], [ %2827, %2776 ]
  br i1 %2648, label %2772, label %2760

2760:                                             ; preds = %2756, %2760
  %2761 = phi <9 x float> [ %2768, %2760 ], [ %2758, %2756 ]
  %2762 = phi i32 [ %2769, %2760 ], [ %2759, %2756 ]
  %2763 = phi i32 [ %2770, %2760 ], [ 0, %2756 ]
  %2764 = add nsw i32 %2753, %2762
  %2765 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2764
  %2766 = load float, float addrspace(3)* %2765, align 4, !tbaa !16
  %2767 = add nsw i32 %2762, %2755
  %2768 = insertelement <9 x float> %2761, float %2766, i32 %2767
  %2769 = add nuw nsw i32 %2762, 1
  %2770 = add i32 %2763, 1
  %2771 = icmp eq i32 %2770, %2645
  br i1 %2771, label %2772, label %2760, !llvm.loop !47

2772:                                             ; preds = %2760, %2756
  %2773 = phi <9 x float> [ %2757, %2756 ], [ %2768, %2760 ]
  %2774 = add nsw i32 %2751, 1
  %2775 = icmp slt i32 %2774, %2659
  br i1 %2775, label %2749, label %2746, !llvm.loop !28

2776:                                             ; preds = %2749, %2776
  %2777 = phi <9 x float> [ %2826, %2776 ], [ %2750, %2749 ]
  %2778 = phi i32 [ %2827, %2776 ], [ 0, %2749 ]
  %2779 = phi i32 [ %2828, %2776 ], [ 0, %2749 ]
  %2780 = add nsw i32 %2753, %2778
  %2781 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2780
  %2782 = load float, float addrspace(3)* %2781, align 4, !tbaa !16
  %2783 = add nsw i32 %2778, %2755
  %2784 = insertelement <9 x float> %2777, float %2782, i32 %2783
  %2785 = or i32 %2778, 1
  %2786 = add nsw i32 %2753, %2785
  %2787 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2786
  %2788 = load float, float addrspace(3)* %2787, align 4, !tbaa !16
  %2789 = add nsw i32 %2785, %2755
  %2790 = insertelement <9 x float> %2784, float %2788, i32 %2789
  %2791 = or i32 %2778, 2
  %2792 = add nsw i32 %2753, %2791
  %2793 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2792
  %2794 = load float, float addrspace(3)* %2793, align 4, !tbaa !16
  %2795 = add nsw i32 %2791, %2755
  %2796 = insertelement <9 x float> %2790, float %2794, i32 %2795
  %2797 = or i32 %2778, 3
  %2798 = add nsw i32 %2753, %2797
  %2799 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2798
  %2800 = load float, float addrspace(3)* %2799, align 4, !tbaa !16
  %2801 = add nsw i32 %2797, %2755
  %2802 = insertelement <9 x float> %2796, float %2800, i32 %2801
  %2803 = or i32 %2778, 4
  %2804 = add nsw i32 %2753, %2803
  %2805 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2804
  %2806 = load float, float addrspace(3)* %2805, align 4, !tbaa !16
  %2807 = add nsw i32 %2803, %2755
  %2808 = insertelement <9 x float> %2802, float %2806, i32 %2807
  %2809 = or i32 %2778, 5
  %2810 = add nsw i32 %2753, %2809
  %2811 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2810
  %2812 = load float, float addrspace(3)* %2811, align 4, !tbaa !16
  %2813 = add nsw i32 %2809, %2755
  %2814 = insertelement <9 x float> %2808, float %2812, i32 %2813
  %2815 = or i32 %2778, 6
  %2816 = add nsw i32 %2753, %2815
  %2817 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2816
  %2818 = load float, float addrspace(3)* %2817, align 4, !tbaa !16
  %2819 = add nsw i32 %2815, %2755
  %2820 = insertelement <9 x float> %2814, float %2818, i32 %2819
  %2821 = or i32 %2778, 7
  %2822 = add nsw i32 %2753, %2821
  %2823 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %2822
  %2824 = load float, float addrspace(3)* %2823, align 4, !tbaa !16
  %2825 = add nsw i32 %2821, %2755
  %2826 = insertelement <9 x float> %2820, float %2824, i32 %2825
  %2827 = add nuw nsw i32 %2778, 8
  %2828 = add i32 %2779, 8
  %2829 = icmp eq i32 %2828, %2647
  br i1 %2829, label %2756, label %2776, !llvm.loop !29

2830:                                             ; preds = %2855, %2748
  %2831 = phi float [ undef, %2748 ], [ %2913, %2855 ]
  %2832 = phi i32 [ 0, %2748 ], [ %2914, %2855 ]
  %2833 = phi float [ 0.000000e+00, %2748 ], [ %2913, %2855 ]
  br i1 %2652, label %2847, label %2834

2834:                                             ; preds = %2830, %2834
  %2835 = phi i32 [ %2844, %2834 ], [ %2832, %2830 ]
  %2836 = phi float [ %2843, %2834 ], [ %2833, %2830 ]
  %2837 = phi i32 [ %2845, %2834 ], [ 0, %2830 ]
  %2838 = zext i32 %2835 to i64
  %2839 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2838
  %2840 = load float, float addrspace(4)* %2839, align 4, !tbaa !16
  %2841 = extractelement <9 x float> %2747, i32 %2835
  %2842 = fmul contract float %2841, %2840
  %2843 = fadd contract float %2836, %2842
  %2844 = add nuw nsw i32 %2835, 1
  %2845 = add i32 %2837, 1
  %2846 = icmp eq i32 %2845, %2649
  br i1 %2846, label %2847, label %2834, !llvm.loop !48

2847:                                             ; preds = %2830, %2834, %2746
  %2848 = phi float [ 0.000000e+00, %2746 ], [ %2831, %2830 ], [ %2843, %2834 ]
  %2849 = add nsw i32 %2743, %38
  %2850 = mul nsw i32 %2849, %7
  %2851 = add i32 %41, %2850
  %2852 = icmp sgt i32 %2851, -1
  %2853 = icmp slt i32 %2851, %2630
  %2854 = select i1 %2852, i1 %2853, i1 false
  br i1 %2854, label %3383, label %2917

2855:                                             ; preds = %2748, %2855
  %2856 = phi i32 [ %2914, %2855 ], [ 0, %2748 ]
  %2857 = phi float [ %2913, %2855 ], [ 0.000000e+00, %2748 ]
  %2858 = phi i32 [ %2915, %2855 ], [ 0, %2748 ]
  %2859 = zext i32 %2856 to i64
  %2860 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2859
  %2861 = load float, float addrspace(4)* %2860, align 16, !tbaa !16
  %2862 = extractelement <9 x float> %2747, i32 %2856
  %2863 = fmul contract float %2862, %2861
  %2864 = fadd contract float %2857, %2863
  %2865 = or i32 %2856, 1
  %2866 = zext i32 %2865 to i64
  %2867 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2866
  %2868 = load float, float addrspace(4)* %2867, align 4, !tbaa !16
  %2869 = extractelement <9 x float> %2747, i32 %2865
  %2870 = fmul contract float %2869, %2868
  %2871 = fadd contract float %2864, %2870
  %2872 = or i32 %2856, 2
  %2873 = zext i32 %2872 to i64
  %2874 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2873
  %2875 = load float, float addrspace(4)* %2874, align 8, !tbaa !16
  %2876 = extractelement <9 x float> %2747, i32 %2872
  %2877 = fmul contract float %2876, %2875
  %2878 = fadd contract float %2871, %2877
  %2879 = or i32 %2856, 3
  %2880 = zext i32 %2879 to i64
  %2881 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2880
  %2882 = load float, float addrspace(4)* %2881, align 4, !tbaa !16
  %2883 = extractelement <9 x float> %2747, i32 %2879
  %2884 = fmul contract float %2883, %2882
  %2885 = fadd contract float %2878, %2884
  %2886 = or i32 %2856, 4
  %2887 = zext i32 %2886 to i64
  %2888 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2887
  %2889 = load float, float addrspace(4)* %2888, align 16, !tbaa !16
  %2890 = extractelement <9 x float> %2747, i32 %2886
  %2891 = fmul contract float %2890, %2889
  %2892 = fadd contract float %2885, %2891
  %2893 = or i32 %2856, 5
  %2894 = zext i32 %2893 to i64
  %2895 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2894
  %2896 = load float, float addrspace(4)* %2895, align 4, !tbaa !16
  %2897 = extractelement <9 x float> %2747, i32 %2893
  %2898 = fmul contract float %2897, %2896
  %2899 = fadd contract float %2892, %2898
  %2900 = or i32 %2856, 6
  %2901 = zext i32 %2900 to i64
  %2902 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2901
  %2903 = load float, float addrspace(4)* %2902, align 8, !tbaa !16
  %2904 = extractelement <9 x float> %2747, i32 %2900
  %2905 = fmul contract float %2904, %2903
  %2906 = fadd contract float %2899, %2905
  %2907 = or i32 %2856, 7
  %2908 = zext i32 %2907 to i64
  %2909 = getelementptr inbounds [9 x float], [9 x float] addrspace(4)* @cm, i64 0, i64 %2908
  %2910 = load float, float addrspace(4)* %2909, align 4, !tbaa !16
  %2911 = extractelement <9 x float> %2747, i32 %2907
  %2912 = fmul contract float %2911, %2910
  %2913 = fadd contract float %2906, %2912
  %2914 = add nuw nsw i32 %2856, 8
  %2915 = add i32 %2858, 8
  %2916 = icmp eq i32 %2915, %2651
  br i1 %2916, label %2830, label %2855, !llvm.loop !31

2917:                                             ; preds = %2847
  %2918 = load i64, i64 addrspace(4)* %2633, align 8, !tbaa !32
  %2919 = inttoptr i64 %2918 to i8 addrspace(1)*
  %2920 = addrspacecast i8 addrspace(1)* %2919 to i8*
  %2921 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2920, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %2922 = extractelement <2 x i64> %2921, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %2923, label %2927

2923:                                             ; preds = %2917
  %2924 = and i64 %2922, -225
  %2925 = or i64 %2924, 32
  %2926 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2920, i64 noundef %2925, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %3368

2927:                                             ; preds = %2917
  %2928 = and i64 %2922, 2
  %2929 = and i64 %2922, -3
  %2930 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2929, i64 0
  br label %2931

2931:                                             ; preds = %3357, %2927
  %2932 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 29) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([30 x i8]* addrspacecast ([30 x i8] addrspace(4)* @.str to [30 x i8]*) to i64)), i64 1))), %2927 ], [ %3365, %3357 ]
  %2933 = phi i8 addrspace(4)* [ getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0), %2927 ], [ %3366, %3357 ]
  %2934 = phi <2 x i64> [ %2930, %2927 ], [ %3364, %3357 ]
  %2935 = icmp ugt i64 %2932, 56
  %2936 = extractelement <2 x i64> %2934, i64 0
  %2937 = or i64 %2936, %2928
  %2938 = insertelement <2 x i64> poison, i64 %2937, i64 0
  %2939 = select i1 %2935, <2 x i64> %2934, <2 x i64> %2938
  %2940 = tail call i64 @llvm.umin.i64(i64 %2932, i64 56)
  %2941 = trunc i64 %2940 to i32
  %2942 = extractelement <2 x i64> %2939, i64 0
  %2943 = icmp ugt i32 %2941, 7
  br i1 %2943, label %2946, label %2944

2944:                                             ; preds = %2931
  %2945 = icmp eq i32 %2941, 0
  br i1 %2945, label %2999, label %2986

2946:                                             ; preds = %2931
  %2947 = load i8, i8 addrspace(4)* %2933, align 1, !tbaa !33
  %2948 = zext i8 %2947 to i64
  %2949 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 1
  %2950 = load i8, i8 addrspace(4)* %2949, align 1, !tbaa !33
  %2951 = zext i8 %2950 to i64
  %2952 = shl nuw nsw i64 %2951, 8
  %2953 = or i64 %2952, %2948
  %2954 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 2
  %2955 = load i8, i8 addrspace(4)* %2954, align 1, !tbaa !33
  %2956 = zext i8 %2955 to i64
  %2957 = shl nuw nsw i64 %2956, 16
  %2958 = or i64 %2953, %2957
  %2959 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 3
  %2960 = load i8, i8 addrspace(4)* %2959, align 1, !tbaa !33
  %2961 = zext i8 %2960 to i64
  %2962 = shl nuw nsw i64 %2961, 24
  %2963 = or i64 %2958, %2962
  %2964 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 4
  %2965 = load i8, i8 addrspace(4)* %2964, align 1, !tbaa !33
  %2966 = zext i8 %2965 to i64
  %2967 = shl nuw nsw i64 %2966, 32
  %2968 = or i64 %2963, %2967
  %2969 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 5
  %2970 = load i8, i8 addrspace(4)* %2969, align 1, !tbaa !33
  %2971 = zext i8 %2970 to i64
  %2972 = shl nuw nsw i64 %2971, 40
  %2973 = or i64 %2968, %2972
  %2974 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 6
  %2975 = load i8, i8 addrspace(4)* %2974, align 1, !tbaa !33
  %2976 = zext i8 %2975 to i64
  %2977 = shl nuw nsw i64 %2976, 48
  %2978 = or i64 %2973, %2977
  %2979 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 7
  %2980 = load i8, i8 addrspace(4)* %2979, align 1, !tbaa !33
  %2981 = zext i8 %2980 to i64
  %2982 = shl nuw i64 %2981, 56
  %2983 = or i64 %2978, %2982
  %2984 = add nsw i32 %2941, -8
  %2985 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 8
  br label %2999

2986:                                             ; preds = %2944, %2986
  %2987 = phi i32 [ %2997, %2986 ], [ 0, %2944 ]
  %2988 = phi i64 [ %2996, %2986 ], [ 0, %2944 ]
  %2989 = zext i32 %2987 to i64
  %2990 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 %2989
  %2991 = load i8, i8 addrspace(4)* %2990, align 1, !tbaa !33
  %2992 = zext i8 %2991 to i64
  %2993 = shl i32 %2987, 3
  %2994 = zext i32 %2993 to i64
  %2995 = shl nuw i64 %2992, %2994
  %2996 = or i64 %2995, %2988
  %2997 = add nuw nsw i32 %2987, 1
  %2998 = icmp eq i32 %2997, %2941
  br i1 %2998, label %2999, label %2986, !llvm.loop !34

2999:                                             ; preds = %2986, %2946, %2944
  %3000 = phi i8 addrspace(4)* [ %2985, %2946 ], [ %2933, %2944 ], [ %2933, %2986 ]
  %3001 = phi i32 [ %2984, %2946 ], [ 0, %2944 ], [ 0, %2986 ]
  %3002 = phi i64 [ %2983, %2946 ], [ 0, %2944 ], [ %2996, %2986 ]
  %3003 = icmp ugt i32 %3001, 7
  br i1 %3003, label %3006, label %3004

3004:                                             ; preds = %2999
  %3005 = icmp eq i32 %3001, 0
  br i1 %3005, label %3059, label %3046

3006:                                             ; preds = %2999
  %3007 = load i8, i8 addrspace(4)* %3000, align 1, !tbaa !33
  %3008 = zext i8 %3007 to i64
  %3009 = getelementptr inbounds i8, i8 addrspace(4)* %3000, i64 1
  %3010 = load i8, i8 addrspace(4)* %3009, align 1, !tbaa !33
  %3011 = zext i8 %3010 to i64
  %3012 = shl nuw nsw i64 %3011, 8
  %3013 = or i64 %3012, %3008
  %3014 = getelementptr inbounds i8, i8 addrspace(4)* %3000, i64 2
  %3015 = load i8, i8 addrspace(4)* %3014, align 1, !tbaa !33
  %3016 = zext i8 %3015 to i64
  %3017 = shl nuw nsw i64 %3016, 16
  %3018 = or i64 %3013, %3017
  %3019 = getelementptr inbounds i8, i8 addrspace(4)* %3000, i64 3
  %3020 = load i8, i8 addrspace(4)* %3019, align 1, !tbaa !33
  %3021 = zext i8 %3020 to i64
  %3022 = shl nuw nsw i64 %3021, 24
  %3023 = or i64 %3018, %3022
  %3024 = getelementptr inbounds i8, i8 addrspace(4)* %3000, i64 4
  %3025 = load i8, i8 addrspace(4)* %3024, align 1, !tbaa !33
  %3026 = zext i8 %3025 to i64
  %3027 = shl nuw nsw i64 %3026, 32
  %3028 = or i64 %3023, %3027
  %3029 = getelementptr inbounds i8, i8 addrspace(4)* %3000, i64 5
  %3030 = load i8, i8 addrspace(4)* %3029, align 1, !tbaa !33
  %3031 = zext i8 %3030 to i64
  %3032 = shl nuw nsw i64 %3031, 40
  %3033 = or i64 %3028, %3032
  %3034 = getelementptr inbounds i8, i8 addrspace(4)* %3000, i64 6
  %3035 = load i8, i8 addrspace(4)* %3034, align 1, !tbaa !33
  %3036 = zext i8 %3035 to i64
  %3037 = shl nuw nsw i64 %3036, 48
  %3038 = or i64 %3033, %3037
  %3039 = getelementptr inbounds i8, i8 addrspace(4)* %3000, i64 7
  %3040 = load i8, i8 addrspace(4)* %3039, align 1, !tbaa !33
  %3041 = zext i8 %3040 to i64
  %3042 = shl nuw i64 %3041, 56
  %3043 = or i64 %3038, %3042
  %3044 = add nsw i32 %3001, -8
  %3045 = getelementptr inbounds i8, i8 addrspace(4)* %3000, i64 8
  br label %3059

3046:                                             ; preds = %3004, %3046
  %3047 = phi i32 [ %3057, %3046 ], [ 0, %3004 ]
  %3048 = phi i64 [ %3056, %3046 ], [ 0, %3004 ]
  %3049 = zext i32 %3047 to i64
  %3050 = getelementptr inbounds i8, i8 addrspace(4)* %3000, i64 %3049
  %3051 = load i8, i8 addrspace(4)* %3050, align 1, !tbaa !33
  %3052 = zext i8 %3051 to i64
  %3053 = shl i32 %3047, 3
  %3054 = zext i32 %3053 to i64
  %3055 = shl nuw i64 %3052, %3054
  %3056 = or i64 %3055, %3048
  %3057 = add nuw nsw i32 %3047, 1
  %3058 = icmp eq i32 %3057, %3001
  br i1 %3058, label %3059, label %3046

3059:                                             ; preds = %3046, %3006, %3004
  %3060 = phi i8 addrspace(4)* [ %3045, %3006 ], [ %3000, %3004 ], [ %3000, %3046 ]
  %3061 = phi i32 [ %3044, %3006 ], [ 0, %3004 ], [ 0, %3046 ]
  %3062 = phi i64 [ %3043, %3006 ], [ 0, %3004 ], [ %3056, %3046 ]
  %3063 = icmp ugt i32 %3061, 7
  br i1 %3063, label %3066, label %3064

3064:                                             ; preds = %3059
  %3065 = icmp eq i32 %3061, 0
  br i1 %3065, label %3119, label %3106

3066:                                             ; preds = %3059
  %3067 = load i8, i8 addrspace(4)* %3060, align 1, !tbaa !33
  %3068 = zext i8 %3067 to i64
  %3069 = getelementptr inbounds i8, i8 addrspace(4)* %3060, i64 1
  %3070 = load i8, i8 addrspace(4)* %3069, align 1, !tbaa !33
  %3071 = zext i8 %3070 to i64
  %3072 = shl nuw nsw i64 %3071, 8
  %3073 = or i64 %3072, %3068
  %3074 = getelementptr inbounds i8, i8 addrspace(4)* %3060, i64 2
  %3075 = load i8, i8 addrspace(4)* %3074, align 1, !tbaa !33
  %3076 = zext i8 %3075 to i64
  %3077 = shl nuw nsw i64 %3076, 16
  %3078 = or i64 %3073, %3077
  %3079 = getelementptr inbounds i8, i8 addrspace(4)* %3060, i64 3
  %3080 = load i8, i8 addrspace(4)* %3079, align 1, !tbaa !33
  %3081 = zext i8 %3080 to i64
  %3082 = shl nuw nsw i64 %3081, 24
  %3083 = or i64 %3078, %3082
  %3084 = getelementptr inbounds i8, i8 addrspace(4)* %3060, i64 4
  %3085 = load i8, i8 addrspace(4)* %3084, align 1, !tbaa !33
  %3086 = zext i8 %3085 to i64
  %3087 = shl nuw nsw i64 %3086, 32
  %3088 = or i64 %3083, %3087
  %3089 = getelementptr inbounds i8, i8 addrspace(4)* %3060, i64 5
  %3090 = load i8, i8 addrspace(4)* %3089, align 1, !tbaa !33
  %3091 = zext i8 %3090 to i64
  %3092 = shl nuw nsw i64 %3091, 40
  %3093 = or i64 %3088, %3092
  %3094 = getelementptr inbounds i8, i8 addrspace(4)* %3060, i64 6
  %3095 = load i8, i8 addrspace(4)* %3094, align 1, !tbaa !33
  %3096 = zext i8 %3095 to i64
  %3097 = shl nuw nsw i64 %3096, 48
  %3098 = or i64 %3093, %3097
  %3099 = getelementptr inbounds i8, i8 addrspace(4)* %3060, i64 7
  %3100 = load i8, i8 addrspace(4)* %3099, align 1, !tbaa !33
  %3101 = zext i8 %3100 to i64
  %3102 = shl nuw i64 %3101, 56
  %3103 = or i64 %3098, %3102
  %3104 = add nsw i32 %3061, -8
  %3105 = getelementptr inbounds i8, i8 addrspace(4)* %3060, i64 8
  br label %3119

3106:                                             ; preds = %3064, %3106
  %3107 = phi i32 [ %3117, %3106 ], [ 0, %3064 ]
  %3108 = phi i64 [ %3116, %3106 ], [ 0, %3064 ]
  %3109 = zext i32 %3107 to i64
  %3110 = getelementptr inbounds i8, i8 addrspace(4)* %3060, i64 %3109
  %3111 = load i8, i8 addrspace(4)* %3110, align 1, !tbaa !33
  %3112 = zext i8 %3111 to i64
  %3113 = shl i32 %3107, 3
  %3114 = zext i32 %3113 to i64
  %3115 = shl nuw i64 %3112, %3114
  %3116 = or i64 %3115, %3108
  %3117 = add nuw nsw i32 %3107, 1
  %3118 = icmp eq i32 %3117, %3061
  br i1 %3118, label %3119, label %3106

3119:                                             ; preds = %3106, %3066, %3064
  %3120 = phi i8 addrspace(4)* [ %3105, %3066 ], [ %3060, %3064 ], [ %3060, %3106 ]
  %3121 = phi i32 [ %3104, %3066 ], [ 0, %3064 ], [ 0, %3106 ]
  %3122 = phi i64 [ %3103, %3066 ], [ 0, %3064 ], [ %3116, %3106 ]
  %3123 = icmp ugt i32 %3121, 7
  br i1 %3123, label %3126, label %3124

3124:                                             ; preds = %3119
  %3125 = icmp eq i32 %3121, 0
  br i1 %3125, label %3179, label %3166

3126:                                             ; preds = %3119
  %3127 = load i8, i8 addrspace(4)* %3120, align 1, !tbaa !33
  %3128 = zext i8 %3127 to i64
  %3129 = getelementptr inbounds i8, i8 addrspace(4)* %3120, i64 1
  %3130 = load i8, i8 addrspace(4)* %3129, align 1, !tbaa !33
  %3131 = zext i8 %3130 to i64
  %3132 = shl nuw nsw i64 %3131, 8
  %3133 = or i64 %3132, %3128
  %3134 = getelementptr inbounds i8, i8 addrspace(4)* %3120, i64 2
  %3135 = load i8, i8 addrspace(4)* %3134, align 1, !tbaa !33
  %3136 = zext i8 %3135 to i64
  %3137 = shl nuw nsw i64 %3136, 16
  %3138 = or i64 %3133, %3137
  %3139 = getelementptr inbounds i8, i8 addrspace(4)* %3120, i64 3
  %3140 = load i8, i8 addrspace(4)* %3139, align 1, !tbaa !33
  %3141 = zext i8 %3140 to i64
  %3142 = shl nuw nsw i64 %3141, 24
  %3143 = or i64 %3138, %3142
  %3144 = getelementptr inbounds i8, i8 addrspace(4)* %3120, i64 4
  %3145 = load i8, i8 addrspace(4)* %3144, align 1, !tbaa !33
  %3146 = zext i8 %3145 to i64
  %3147 = shl nuw nsw i64 %3146, 32
  %3148 = or i64 %3143, %3147
  %3149 = getelementptr inbounds i8, i8 addrspace(4)* %3120, i64 5
  %3150 = load i8, i8 addrspace(4)* %3149, align 1, !tbaa !33
  %3151 = zext i8 %3150 to i64
  %3152 = shl nuw nsw i64 %3151, 40
  %3153 = or i64 %3148, %3152
  %3154 = getelementptr inbounds i8, i8 addrspace(4)* %3120, i64 6
  %3155 = load i8, i8 addrspace(4)* %3154, align 1, !tbaa !33
  %3156 = zext i8 %3155 to i64
  %3157 = shl nuw nsw i64 %3156, 48
  %3158 = or i64 %3153, %3157
  %3159 = getelementptr inbounds i8, i8 addrspace(4)* %3120, i64 7
  %3160 = load i8, i8 addrspace(4)* %3159, align 1, !tbaa !33
  %3161 = zext i8 %3160 to i64
  %3162 = shl nuw i64 %3161, 56
  %3163 = or i64 %3158, %3162
  %3164 = add nsw i32 %3121, -8
  %3165 = getelementptr inbounds i8, i8 addrspace(4)* %3120, i64 8
  br label %3179

3166:                                             ; preds = %3124, %3166
  %3167 = phi i32 [ %3177, %3166 ], [ 0, %3124 ]
  %3168 = phi i64 [ %3176, %3166 ], [ 0, %3124 ]
  %3169 = zext i32 %3167 to i64
  %3170 = getelementptr inbounds i8, i8 addrspace(4)* %3120, i64 %3169
  %3171 = load i8, i8 addrspace(4)* %3170, align 1, !tbaa !33
  %3172 = zext i8 %3171 to i64
  %3173 = shl i32 %3167, 3
  %3174 = zext i32 %3173 to i64
  %3175 = shl nuw i64 %3172, %3174
  %3176 = or i64 %3175, %3168
  %3177 = add nuw nsw i32 %3167, 1
  %3178 = icmp eq i32 %3177, %3121
  br i1 %3178, label %3179, label %3166

3179:                                             ; preds = %3166, %3126, %3124
  %3180 = phi i8 addrspace(4)* [ %3165, %3126 ], [ %3120, %3124 ], [ %3120, %3166 ]
  %3181 = phi i32 [ %3164, %3126 ], [ 0, %3124 ], [ 0, %3166 ]
  %3182 = phi i64 [ %3163, %3126 ], [ 0, %3124 ], [ %3176, %3166 ]
  %3183 = icmp ugt i32 %3181, 7
  br i1 %3183, label %3186, label %3184

3184:                                             ; preds = %3179
  %3185 = icmp eq i32 %3181, 0
  br i1 %3185, label %3239, label %3226

3186:                                             ; preds = %3179
  %3187 = load i8, i8 addrspace(4)* %3180, align 1, !tbaa !33
  %3188 = zext i8 %3187 to i64
  %3189 = getelementptr inbounds i8, i8 addrspace(4)* %3180, i64 1
  %3190 = load i8, i8 addrspace(4)* %3189, align 1, !tbaa !33
  %3191 = zext i8 %3190 to i64
  %3192 = shl nuw nsw i64 %3191, 8
  %3193 = or i64 %3192, %3188
  %3194 = getelementptr inbounds i8, i8 addrspace(4)* %3180, i64 2
  %3195 = load i8, i8 addrspace(4)* %3194, align 1, !tbaa !33
  %3196 = zext i8 %3195 to i64
  %3197 = shl nuw nsw i64 %3196, 16
  %3198 = or i64 %3193, %3197
  %3199 = getelementptr inbounds i8, i8 addrspace(4)* %3180, i64 3
  %3200 = load i8, i8 addrspace(4)* %3199, align 1, !tbaa !33
  %3201 = zext i8 %3200 to i64
  %3202 = shl nuw nsw i64 %3201, 24
  %3203 = or i64 %3198, %3202
  %3204 = getelementptr inbounds i8, i8 addrspace(4)* %3180, i64 4
  %3205 = load i8, i8 addrspace(4)* %3204, align 1, !tbaa !33
  %3206 = zext i8 %3205 to i64
  %3207 = shl nuw nsw i64 %3206, 32
  %3208 = or i64 %3203, %3207
  %3209 = getelementptr inbounds i8, i8 addrspace(4)* %3180, i64 5
  %3210 = load i8, i8 addrspace(4)* %3209, align 1, !tbaa !33
  %3211 = zext i8 %3210 to i64
  %3212 = shl nuw nsw i64 %3211, 40
  %3213 = or i64 %3208, %3212
  %3214 = getelementptr inbounds i8, i8 addrspace(4)* %3180, i64 6
  %3215 = load i8, i8 addrspace(4)* %3214, align 1, !tbaa !33
  %3216 = zext i8 %3215 to i64
  %3217 = shl nuw nsw i64 %3216, 48
  %3218 = or i64 %3213, %3217
  %3219 = getelementptr inbounds i8, i8 addrspace(4)* %3180, i64 7
  %3220 = load i8, i8 addrspace(4)* %3219, align 1, !tbaa !33
  %3221 = zext i8 %3220 to i64
  %3222 = shl nuw i64 %3221, 56
  %3223 = or i64 %3218, %3222
  %3224 = add nsw i32 %3181, -8
  %3225 = getelementptr inbounds i8, i8 addrspace(4)* %3180, i64 8
  br label %3239

3226:                                             ; preds = %3184, %3226
  %3227 = phi i32 [ %3237, %3226 ], [ 0, %3184 ]
  %3228 = phi i64 [ %3236, %3226 ], [ 0, %3184 ]
  %3229 = zext i32 %3227 to i64
  %3230 = getelementptr inbounds i8, i8 addrspace(4)* %3180, i64 %3229
  %3231 = load i8, i8 addrspace(4)* %3230, align 1, !tbaa !33
  %3232 = zext i8 %3231 to i64
  %3233 = shl i32 %3227, 3
  %3234 = zext i32 %3233 to i64
  %3235 = shl nuw i64 %3232, %3234
  %3236 = or i64 %3235, %3228
  %3237 = add nuw nsw i32 %3227, 1
  %3238 = icmp eq i32 %3237, %3181
  br i1 %3238, label %3239, label %3226

3239:                                             ; preds = %3226, %3186, %3184
  %3240 = phi i8 addrspace(4)* [ %3225, %3186 ], [ %3180, %3184 ], [ %3180, %3226 ]
  %3241 = phi i32 [ %3224, %3186 ], [ 0, %3184 ], [ 0, %3226 ]
  %3242 = phi i64 [ %3223, %3186 ], [ 0, %3184 ], [ %3236, %3226 ]
  %3243 = icmp ugt i32 %3241, 7
  br i1 %3243, label %3246, label %3244

3244:                                             ; preds = %3239
  %3245 = icmp eq i32 %3241, 0
  br i1 %3245, label %3299, label %3286

3246:                                             ; preds = %3239
  %3247 = load i8, i8 addrspace(4)* %3240, align 1, !tbaa !33
  %3248 = zext i8 %3247 to i64
  %3249 = getelementptr inbounds i8, i8 addrspace(4)* %3240, i64 1
  %3250 = load i8, i8 addrspace(4)* %3249, align 1, !tbaa !33
  %3251 = zext i8 %3250 to i64
  %3252 = shl nuw nsw i64 %3251, 8
  %3253 = or i64 %3252, %3248
  %3254 = getelementptr inbounds i8, i8 addrspace(4)* %3240, i64 2
  %3255 = load i8, i8 addrspace(4)* %3254, align 1, !tbaa !33
  %3256 = zext i8 %3255 to i64
  %3257 = shl nuw nsw i64 %3256, 16
  %3258 = or i64 %3253, %3257
  %3259 = getelementptr inbounds i8, i8 addrspace(4)* %3240, i64 3
  %3260 = load i8, i8 addrspace(4)* %3259, align 1, !tbaa !33
  %3261 = zext i8 %3260 to i64
  %3262 = shl nuw nsw i64 %3261, 24
  %3263 = or i64 %3258, %3262
  %3264 = getelementptr inbounds i8, i8 addrspace(4)* %3240, i64 4
  %3265 = load i8, i8 addrspace(4)* %3264, align 1, !tbaa !33
  %3266 = zext i8 %3265 to i64
  %3267 = shl nuw nsw i64 %3266, 32
  %3268 = or i64 %3263, %3267
  %3269 = getelementptr inbounds i8, i8 addrspace(4)* %3240, i64 5
  %3270 = load i8, i8 addrspace(4)* %3269, align 1, !tbaa !33
  %3271 = zext i8 %3270 to i64
  %3272 = shl nuw nsw i64 %3271, 40
  %3273 = or i64 %3268, %3272
  %3274 = getelementptr inbounds i8, i8 addrspace(4)* %3240, i64 6
  %3275 = load i8, i8 addrspace(4)* %3274, align 1, !tbaa !33
  %3276 = zext i8 %3275 to i64
  %3277 = shl nuw nsw i64 %3276, 48
  %3278 = or i64 %3273, %3277
  %3279 = getelementptr inbounds i8, i8 addrspace(4)* %3240, i64 7
  %3280 = load i8, i8 addrspace(4)* %3279, align 1, !tbaa !33
  %3281 = zext i8 %3280 to i64
  %3282 = shl nuw i64 %3281, 56
  %3283 = or i64 %3278, %3282
  %3284 = add nsw i32 %3241, -8
  %3285 = getelementptr inbounds i8, i8 addrspace(4)* %3240, i64 8
  br label %3299

3286:                                             ; preds = %3244, %3286
  %3287 = phi i32 [ %3297, %3286 ], [ 0, %3244 ]
  %3288 = phi i64 [ %3296, %3286 ], [ 0, %3244 ]
  %3289 = zext i32 %3287 to i64
  %3290 = getelementptr inbounds i8, i8 addrspace(4)* %3240, i64 %3289
  %3291 = load i8, i8 addrspace(4)* %3290, align 1, !tbaa !33
  %3292 = zext i8 %3291 to i64
  %3293 = shl i32 %3287, 3
  %3294 = zext i32 %3293 to i64
  %3295 = shl nuw i64 %3292, %3294
  %3296 = or i64 %3295, %3288
  %3297 = add nuw nsw i32 %3287, 1
  %3298 = icmp eq i32 %3297, %3241
  br i1 %3298, label %3299, label %3286

3299:                                             ; preds = %3286, %3246, %3244
  %3300 = phi i8 addrspace(4)* [ %3285, %3246 ], [ %3240, %3244 ], [ %3240, %3286 ]
  %3301 = phi i32 [ %3284, %3246 ], [ 0, %3244 ], [ 0, %3286 ]
  %3302 = phi i64 [ %3283, %3246 ], [ 0, %3244 ], [ %3296, %3286 ]
  %3303 = icmp ugt i32 %3301, 7
  br i1 %3303, label %3306, label %3304

3304:                                             ; preds = %3299
  %3305 = icmp eq i32 %3301, 0
  br i1 %3305, label %3357, label %3344

3306:                                             ; preds = %3299
  %3307 = load i8, i8 addrspace(4)* %3300, align 1, !tbaa !33
  %3308 = zext i8 %3307 to i64
  %3309 = getelementptr inbounds i8, i8 addrspace(4)* %3300, i64 1
  %3310 = load i8, i8 addrspace(4)* %3309, align 1, !tbaa !33
  %3311 = zext i8 %3310 to i64
  %3312 = shl nuw nsw i64 %3311, 8
  %3313 = or i64 %3312, %3308
  %3314 = getelementptr inbounds i8, i8 addrspace(4)* %3300, i64 2
  %3315 = load i8, i8 addrspace(4)* %3314, align 1, !tbaa !33
  %3316 = zext i8 %3315 to i64
  %3317 = shl nuw nsw i64 %3316, 16
  %3318 = or i64 %3313, %3317
  %3319 = getelementptr inbounds i8, i8 addrspace(4)* %3300, i64 3
  %3320 = load i8, i8 addrspace(4)* %3319, align 1, !tbaa !33
  %3321 = zext i8 %3320 to i64
  %3322 = shl nuw nsw i64 %3321, 24
  %3323 = or i64 %3318, %3322
  %3324 = getelementptr inbounds i8, i8 addrspace(4)* %3300, i64 4
  %3325 = load i8, i8 addrspace(4)* %3324, align 1, !tbaa !33
  %3326 = zext i8 %3325 to i64
  %3327 = shl nuw nsw i64 %3326, 32
  %3328 = or i64 %3323, %3327
  %3329 = getelementptr inbounds i8, i8 addrspace(4)* %3300, i64 5
  %3330 = load i8, i8 addrspace(4)* %3329, align 1, !tbaa !33
  %3331 = zext i8 %3330 to i64
  %3332 = shl nuw nsw i64 %3331, 40
  %3333 = or i64 %3328, %3332
  %3334 = getelementptr inbounds i8, i8 addrspace(4)* %3300, i64 6
  %3335 = load i8, i8 addrspace(4)* %3334, align 1, !tbaa !33
  %3336 = zext i8 %3335 to i64
  %3337 = shl nuw nsw i64 %3336, 48
  %3338 = or i64 %3333, %3337
  %3339 = getelementptr inbounds i8, i8 addrspace(4)* %3300, i64 7
  %3340 = load i8, i8 addrspace(4)* %3339, align 1, !tbaa !33
  %3341 = zext i8 %3340 to i64
  %3342 = shl nuw i64 %3341, 56
  %3343 = or i64 %3338, %3342
  br label %3357

3344:                                             ; preds = %3304, %3344
  %3345 = phi i32 [ %3355, %3344 ], [ 0, %3304 ]
  %3346 = phi i64 [ %3354, %3344 ], [ 0, %3304 ]
  %3347 = zext i32 %3345 to i64
  %3348 = getelementptr inbounds i8, i8 addrspace(4)* %3300, i64 %3347
  %3349 = load i8, i8 addrspace(4)* %3348, align 1, !tbaa !33
  %3350 = zext i8 %3349 to i64
  %3351 = shl i32 %3345, 3
  %3352 = zext i32 %3351 to i64
  %3353 = shl nuw i64 %3350, %3352
  %3354 = or i64 %3353, %3346
  %3355 = add nuw nsw i32 %3345, 1
  %3356 = icmp eq i32 %3355, %3301
  br i1 %3356, label %3357, label %3344

3357:                                             ; preds = %3344, %3306, %3304
  %3358 = phi i64 [ %3343, %3306 ], [ 0, %3304 ], [ %3354, %3344 ]
  %3359 = shl nuw nsw i64 %2940, 2
  %3360 = add nuw nsw i64 %3359, 28
  %3361 = and i64 %3360, 480
  %3362 = and i64 %2942, -225
  %3363 = or i64 %3362, %3361
  %3364 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2920, i64 noundef %3363, i64 noundef %3002, i64 noundef %3062, i64 noundef %3122, i64 noundef %3182, i64 noundef %3242, i64 noundef %3302, i64 noundef %3358) #12
  %3365 = sub i64 %2932, %2940
  %3366 = getelementptr inbounds i8, i8 addrspace(4)* %2933, i64 %2940
  %3367 = icmp eq i64 %3365, 0
  br i1 %3367, label %3368, label %2931

3368:                                             ; preds = %3357, %2923
  %3369 = phi <2 x i64> [ %2926, %2923 ], [ %3364, %3357 ]
  %3370 = extractelement <2 x i64> %3369, i64 0
  %3371 = zext i32 %2851 to i64
  %3372 = and i64 %3370, -225
  %3373 = or i64 %3372, 32
  %3374 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2920, i64 noundef %3373, i64 noundef %3371, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %3375 = extractelement <2 x i64> %3374, i64 0
  %3376 = and i64 %3375, -225
  %3377 = or i64 %3376, 32
  %3378 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2920, i64 noundef %3377, i64 noundef %2634, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %3379 = extractelement <2 x i64> %3378, i64 0
  %3380 = and i64 %3379, -227
  %3381 = or i64 %3380, 34
  %3382 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2920, i64 noundef %3381, i64 noundef %2635, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %3383

3383:                                             ; preds = %3368, %2847
  %3384 = sext i32 %2851 to i64
  %3385 = getelementptr inbounds float, float addrspace(1)* %1, i64 %3384
  store float %2848, float addrspace(1)* %3385, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %2662, label %3386, label %3439

3386:                                             ; preds = %3383
  %3387 = mul nsw i32 %2659, %9
  %3388 = add nsw i32 %3387, %12
  %3389 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3388
  store float %2742, float addrspace(3)* %3389, align 4, !tbaa !16
  br i1 %2637, label %3439, label %3390

3390:                                             ; preds = %3386
  br i1 %2654, label %3428, label %3391

3391:                                             ; preds = %3390, %3391
  %3392 = phi i32 [ %3425, %3391 ], [ 1, %3390 ]
  %3393 = phi i32 [ %3426, %3391 ], [ 0, %3390 ]
  %3394 = add nsw i32 %3392, %3388
  %3395 = extractelement <3 x float> %2741, i32 %3392
  %3396 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3394
  store float %3395, float addrspace(3)* %3396, align 4, !tbaa !16
  %3397 = add nuw nsw i32 %3392, 1
  %3398 = add nsw i32 %3397, %3388
  %3399 = extractelement <3 x float> %2741, i32 %3397
  %3400 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3398
  store float %3399, float addrspace(3)* %3400, align 4, !tbaa !16
  %3401 = add nuw nsw i32 %3392, 2
  %3402 = add nsw i32 %3401, %3388
  %3403 = extractelement <3 x float> %2741, i32 %3401
  %3404 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3402
  store float %3403, float addrspace(3)* %3404, align 4, !tbaa !16
  %3405 = add nuw nsw i32 %3392, 3
  %3406 = add nsw i32 %3405, %3388
  %3407 = extractelement <3 x float> %2741, i32 %3405
  %3408 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3406
  store float %3407, float addrspace(3)* %3408, align 4, !tbaa !16
  %3409 = add nuw nsw i32 %3392, 4
  %3410 = add nsw i32 %3409, %3388
  %3411 = extractelement <3 x float> %2741, i32 %3409
  %3412 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3410
  store float %3411, float addrspace(3)* %3412, align 4, !tbaa !16
  %3413 = add nuw nsw i32 %3392, 5
  %3414 = add nsw i32 %3413, %3388
  %3415 = extractelement <3 x float> %2741, i32 %3413
  %3416 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3414
  store float %3415, float addrspace(3)* %3416, align 4, !tbaa !16
  %3417 = add nuw nsw i32 %3392, 6
  %3418 = add nsw i32 %3417, %3388
  %3419 = extractelement <3 x float> %2741, i32 %3417
  %3420 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3418
  store float %3419, float addrspace(3)* %3420, align 4, !tbaa !16
  %3421 = add nuw nsw i32 %3392, 7
  %3422 = add nsw i32 %3421, %3388
  %3423 = extractelement <3 x float> %2741, i32 %3421
  %3424 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3422
  store float %3423, float addrspace(3)* %3424, align 4, !tbaa !16
  %3425 = add nuw nsw i32 %3392, 8
  %3426 = add i32 %3393, 8
  %3427 = icmp eq i32 %3426, %2655
  br i1 %3427, label %3428, label %3391, !llvm.loop !35

3428:                                             ; preds = %3391, %3390
  %3429 = phi i32 [ 1, %3390 ], [ %3425, %3391 ]
  br i1 %2656, label %3439, label %3430

3430:                                             ; preds = %3428, %3430
  %3431 = phi i32 [ %3436, %3430 ], [ %3429, %3428 ]
  %3432 = phi i32 [ %3437, %3430 ], [ 0, %3428 ]
  %3433 = add nsw i32 %3431, %3388
  %3434 = extractelement <3 x float> %2741, i32 %3431
  %3435 = getelementptr inbounds [340 x float], [340 x float] addrspace(3)* @_ZZ11conv_kernelPKfPfiiiiiiiiiE2sm, i32 0, i32 %3433
  store float %3434, float addrspace(3)* %3435, align 4, !tbaa !16
  %3436 = add nuw nsw i32 %3431, 1
  %3437 = add i32 %3432, 1
  %3438 = icmp eq i32 %3437, %2653
  br i1 %3438, label %3439, label %3430, !llvm.loop !49

3439:                                             ; preds = %3428, %3430, %3386, %3383
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %3440 = add nsw i32 %2659, 1
  %3441 = icmp slt i32 %2659, %2622
  br i1 %3441, label %2657, label %3442, !llvm.loop !37

3442:                                             ; preds = %1793, %2613, %3439, %967, %2620, %1796, %148, %972, %2615, %2616
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #4 {
  %10 = alloca i8*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %25 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !50
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !51
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !32
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !32
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !32
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !32
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !32
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !32
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !32
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !32
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !51
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !51
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #12, !srcloc !52
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !51
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !51
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !51
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !50
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !50
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !50
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !51
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !51
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !53
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !55
  %50 = and i64 %49, %45
  %51 = getelementptr inbounds %1, %1 addrspace(1)* %48, i64 %50, i32 0
  %52 = load atomic i64, i64 addrspace(1)* %51 syncscope("one-as") monotonic, align 8
  %53 = cmpxchg i64 addrspace(1)* %44, i64 %45, i64 %52 syncscope("one-as") acquire monotonic, align 8
  %54 = extractvalue { i64, i1 } %53, 1
  br i1 %54, label %65, label %55

55:                                               ; preds = %55, %43
  %56 = phi { i64, i1 } [ %63, %55 ], [ %53, %43 ]
  %57 = extractvalue { i64, i1 } %56, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !53
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !55
  %60 = and i64 %59, %57
  %61 = getelementptr inbounds %1, %1 addrspace(1)* %58, i64 %60, i32 0
  %62 = load atomic i64, i64 addrspace(1)* %61 syncscope("one-as") monotonic, align 8
  %63 = cmpxchg i64 addrspace(1)* %44, i64 %57, i64 %62 syncscope("one-as") acquire monotonic, align 8
  %64 = extractvalue { i64, i1 } %63, 1
  br i1 %64, label %65, label %55

65:                                               ; preds = %55, %43
  %66 = phi { i64, i1 } [ %53, %43 ], [ %63, %55 ]
  %67 = extractvalue { i64, i1 } %66, 0
  br label %68

68:                                               ; preds = %9, %65
  %69 = phi i64 [ %67, %65 ], [ 0, %9 ]
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = call i32 @llvm.amdgcn.readfirstlane(i32 %70)
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %72)
  %75 = zext i32 %74 to i64
  %76 = shl nuw i64 %75, 32
  %77 = zext i32 %73 to i64
  %78 = or i64 %76, %77
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !32
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !50
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !32
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !53
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !55
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !50
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !50
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !32
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !56
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !55
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !50
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !50
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !50
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !51
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !32
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !32
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !32
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !32
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !32
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !32
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !32
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !32
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !51
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !51
  %110 = call i64 @llvm.read_register.i64(metadata !57) #13
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !58
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !60
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !61
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !32
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !32
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !32
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !32
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !32
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !32
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !32
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !32
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !50
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !32
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !51
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !51
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !53
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !55
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !62
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !62
  %145 = cmpxchg i64 addrspace(1)* %132, i64 %144, i64 %127 syncscope("one-as") release monotonic, align 8
  %146 = extractvalue { i64, i1 } %145, 1
  br i1 %146, label %147, label %142

147:                                              ; preds = %142, %131
  %148 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 2, i32 0
  %149 = load i64, i64 addrspace(1)* %148, align 8
  %150 = inttoptr i64 %149 to %4 addrspace(1)*
  %151 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 1, i32 0
  %152 = atomicrmw add i64 addrspace(1)* %151, i64 1 syncscope("one-as") release, align 8
  %153 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 2
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !63
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !65
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !50
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !50
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !51
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !51
  %169 = icmp eq i32 %167, %168
  %170 = getelementptr inbounds %1, %1 addrspace(1)* %165, i64 0, i32 3
  br label %171

171:                                              ; preds = %179, %163
  br i1 %169, label %172, label %175

172:                                              ; preds = %171
  %173 = load atomic i32, i32 addrspace(1)* %170 syncscope("one-as") acquire, align 4
  %174 = and i32 %173, 1
  br label %175

175:                                              ; preds = %172, %171
  %176 = phi i32 [ %174, %172 ], [ 1, %171 ]
  %177 = call i32 @llvm.amdgcn.readfirstlane(i32 %176)
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %180, label %179

179:                                              ; preds = %175
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %171

180:                                              ; preds = %175
  %181 = zext i32 %167 to i64
  %182 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 0
  %183 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 1
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !32
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !32
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !33
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !50
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !32
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !51
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !51
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !55
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !53
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !62
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !62
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !33
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #7
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #7
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #7
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #7
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #7
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #7
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #7
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #6

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #7

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #11

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #12 = { convergent nounwind }
attributes #13 = { convergent }

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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !23}
!27 = distinct !{!27, !23}
!28 = distinct !{!28, !21}
!29 = distinct !{!29, !21}
!30 = distinct !{!30, !23}
!31 = distinct !{!31, !21}
!32 = !{!13, !13, i64 0}
!33 = !{!10, !10, i64 0}
!34 = distinct !{!34, !23}
!35 = distinct !{!35, !21}
!36 = distinct !{!36, !23}
!37 = distinct !{!37, !21}
!38 = distinct !{!38, !23}
!39 = distinct !{!39, !23}
!40 = distinct !{!40, !23}
!41 = distinct !{!41, !23}
!42 = distinct !{!42, !23}
!43 = distinct !{!43, !23}
!44 = distinct !{!44, !23}
!45 = distinct !{!45, !23}
!46 = distinct !{!46, !23}
!47 = distinct !{!47, !23}
!48 = distinct !{!48, !23}
!49 = distinct !{!49, !23}
!50 = !{!14, !14, i64 0}
!51 = !{!12, !12, i64 0}
!52 = !{i64 2662}
!53 = !{!54, !14, i64 0}
!54 = !{!"", !14, i64 0, !14, i64 8, !15, i64 16, !13, i64 24, !13, i64 32, !13, i64 40}
!55 = !{!54, !13, i64 40}
!56 = !{!54, !14, i64 8}
!57 = !{!"exec"}
!58 = !{!59, !12, i64 16}
!59 = !{!"", !13, i64 0, !13, i64 8, !12, i64 16, !12, i64 20}
!60 = !{!59, !13, i64 8}
!61 = !{!59, !12, i64 20}
!62 = !{!59, !13, i64 0}
!63 = !{!64, !13, i64 16}
!64 = !{!"amd_signal_s", !13, i64 0, !10, i64 8, !13, i64 16, !12, i64 24, !12, i64 28, !13, i64 32, !13, i64 40, !10, i64 48, !10, i64 56}
!65 = !{!64, !12, i64 24}
