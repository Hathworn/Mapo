; ModuleID = '../data/hip_kernels/16057/17/main.cu'
source_filename = "../data/hip_kernels/16057/17/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [8 x i8] c"IMC %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z13calculate_IMCPfS_S_S_S_S_S_S_ifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture %7, i32 %8, float %9, i32 %10) local_unnamed_addr #1 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %21
  %29 = mul nsw i32 %28, %8
  %30 = add nsw i32 %20, %29
  %31 = icmp sgt i32 %8, 0
  br i1 %31, label %32, label %126

32:                                               ; preds = %11
  %33 = zext i32 %30 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %36 = and i32 %8, 1
  %37 = icmp eq i32 %8, 1
  br i1 %37, label %97, label %38

38:                                               ; preds = %32
  %39 = and i32 %8, -2
  br label %40

40:                                               ; preds = %94, %38
  %41 = phi i32 [ 0, %38 ], [ %71, %94 ]
  %42 = phi i32 [ 0, %38 ], [ %95, %94 ]
  %43 = mul nsw i32 %41, %8
  %44 = icmp uge i32 %30, %43
  %45 = or i32 %41, 1
  %46 = mul nsw i32 %45, %8
  %47 = icmp ult i32 %30, %46
  %48 = select i1 %44, i1 %47, i1 false
  br i1 %48, label %49, label %68

49:                                               ; preds = %40
  %50 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %51 = fcmp contract ogt float %50, 0.000000e+00
  br i1 %51, label %52, label %68

52:                                               ; preds = %49
  %53 = tail call i1 @llvm.amdgcn.class.f32(float %50, i32 144)
  %54 = select i1 %53, float 0x41F0000000000000, float 1.000000e+00
  %55 = fmul float %50, %54
  %56 = tail call float @llvm.log2.f32(float %55)
  %57 = fmul float %56, 0x3FD3441340000000
  %58 = tail call i1 @llvm.amdgcn.class.f32(float %56, i32 519)
  %59 = fneg float %57
  %60 = tail call float @llvm.fma.f32(float %56, float 0x3FD3441340000000, float %59)
  %61 = tail call float @llvm.fma.f32(float %56, float 0x3E509F79E0000000, float %60)
  %62 = fadd float %57, %61
  %63 = select i1 %58, float %56, float %62
  %64 = select i1 %53, float 0x4023441360000000, float 0.000000e+00
  %65 = fsub float %63, %64
  %66 = fneg contract float %50
  %67 = fmul contract float %65, %66
  store float %67, float addrspace(1)* %35, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %40, %49, %52
  %69 = mul nsw i32 %45, %8
  %70 = icmp uge i32 %30, %69
  %71 = add nuw nsw i32 %41, 2
  %72 = mul nsw i32 %71, %8
  %73 = icmp ult i32 %30, %72
  %74 = select i1 %70, i1 %73, i1 false
  br i1 %74, label %75, label %94

75:                                               ; preds = %68
  %76 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %77 = fcmp contract ogt float %76, 0.000000e+00
  br i1 %77, label %78, label %94

78:                                               ; preds = %75
  %79 = tail call i1 @llvm.amdgcn.class.f32(float %76, i32 144)
  %80 = select i1 %79, float 0x41F0000000000000, float 1.000000e+00
  %81 = fmul float %76, %80
  %82 = tail call float @llvm.log2.f32(float %81)
  %83 = fmul float %82, 0x3FD3441340000000
  %84 = tail call i1 @llvm.amdgcn.class.f32(float %82, i32 519)
  %85 = fneg float %83
  %86 = tail call float @llvm.fma.f32(float %82, float 0x3FD3441340000000, float %85)
  %87 = tail call float @llvm.fma.f32(float %82, float 0x3E509F79E0000000, float %86)
  %88 = fadd float %83, %87
  %89 = select i1 %84, float %82, float %88
  %90 = select i1 %79, float 0x4023441360000000, float 0.000000e+00
  %91 = fsub float %89, %90
  %92 = fneg contract float %76
  %93 = fmul contract float %91, %92
  store float %93, float addrspace(1)* %35, align 4, !tbaa !7
  br label %94

94:                                               ; preds = %78, %75, %68
  %95 = add i32 %42, 2
  %96 = icmp eq i32 %95, %39
  br i1 %96, label %97, label %40, !llvm.loop !11

97:                                               ; preds = %94, %32
  %98 = phi i32 [ 0, %32 ], [ %71, %94 ]
  %99 = icmp eq i32 %36, 0
  br i1 %99, label %126, label %100

100:                                              ; preds = %97
  %101 = mul nsw i32 %98, %8
  %102 = icmp uge i32 %30, %101
  %103 = add nuw nsw i32 %98, 1
  %104 = mul nsw i32 %103, %8
  %105 = icmp ult i32 %30, %104
  %106 = select i1 %102, i1 %105, i1 false
  br i1 %106, label %107, label %126

107:                                              ; preds = %100
  %108 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %109 = fcmp contract ogt float %108, 0.000000e+00
  br i1 %109, label %110, label %126

110:                                              ; preds = %107
  %111 = tail call i1 @llvm.amdgcn.class.f32(float %108, i32 144)
  %112 = select i1 %111, float 0x41F0000000000000, float 1.000000e+00
  %113 = fmul float %108, %112
  %114 = tail call float @llvm.log2.f32(float %113)
  %115 = fmul float %114, 0x3FD3441340000000
  %116 = tail call i1 @llvm.amdgcn.class.f32(float %114, i32 519)
  %117 = fneg float %115
  %118 = tail call float @llvm.fma.f32(float %114, float 0x3FD3441340000000, float %117)
  %119 = tail call float @llvm.fma.f32(float %114, float 0x3E509F79E0000000, float %118)
  %120 = fadd float %115, %119
  %121 = select i1 %116, float %114, float %120
  %122 = select i1 %111, float 0x4023441360000000, float 0.000000e+00
  %123 = fsub float %121, %122
  %124 = fneg contract float %108
  %125 = fmul contract float %123, %124
  store float %125, float addrspace(1)* %35, align 4, !tbaa !7
  br label %126

126:                                              ; preds = %97, %110, %107, %100, %11
  %127 = icmp ult i32 %30, %10
  br i1 %127, label %128, label %154

128:                                              ; preds = %126
  %129 = zext i32 %30 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fcmp contract une float %131, 0.000000e+00
  br i1 %132, label %133, label %151

133:                                              ; preds = %128
  %134 = tail call i1 @llvm.amdgcn.class.f32(float %131, i32 144)
  %135 = select i1 %134, float 0x41F0000000000000, float 1.000000e+00
  %136 = fmul float %131, %135
  %137 = tail call float @llvm.log2.f32(float %136)
  %138 = fmul float %137, 0x3FD3441340000000
  %139 = tail call i1 @llvm.amdgcn.class.f32(float %137, i32 519)
  %140 = fneg float %138
  %141 = tail call float @llvm.fma.f32(float %137, float 0x3FD3441340000000, float %140)
  %142 = tail call float @llvm.fma.f32(float %137, float 0x3E509F79E0000000, float %141)
  %143 = fadd float %138, %142
  %144 = select i1 %139, float %137, float %143
  %145 = select i1 %134, float 0x4023441360000000, float 0.000000e+00
  %146 = fsub float %144, %145
  %147 = fneg contract float %131
  %148 = fmul contract float %146, %147
  %149 = getelementptr inbounds float, float addrspace(1)* %4, i64 %129
  store float %148, float addrspace(1)* %149, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %150 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  br label %151

151:                                              ; preds = %128, %133
  %152 = phi float [ %131, %128 ], [ %150, %133 ]
  %153 = getelementptr inbounds float, float addrspace(1)* %5, i64 %129
  store float %152, float addrspace(1)* %153, align 4, !tbaa !7
  br label %154

154:                                              ; preds = %126, %151
  br i1 %31, label %155, label %294

155:                                              ; preds = %154
  %156 = icmp ult i32 %30, %8
  %157 = mul i32 %30, %8
  %158 = and i32 %8, 3
  %159 = icmp ult i32 %8, 4
  br i1 %159, label %162, label %160

160:                                              ; preds = %155
  %161 = and i32 %8, -4
  br label %195

162:                                              ; preds = %256, %155
  %163 = phi i32 [ 0, %155 ], [ %257, %256 ]
  %164 = phi i32 [ 0, %155 ], [ %258, %256 ]
  %165 = icmp eq i32 %158, 0
  br i1 %165, label %187, label %166

166:                                              ; preds = %162, %182
  %167 = phi i32 [ %183, %182 ], [ %163, %162 ]
  %168 = phi i32 [ %184, %182 ], [ %164, %162 ]
  %169 = phi i32 [ %185, %182 ], [ 0, %162 ]
  %170 = icmp eq i32 %167, %168
  %171 = select i1 %170, i1 %156, i1 false
  br i1 %171, label %172, label %182

172:                                              ; preds = %166
  %173 = add i32 %167, %157
  %174 = zext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !7
  %177 = mul nsw i32 %167, %8
  %178 = add i32 %177, %30
  %179 = zext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %6, i64 %179
  store float %176, float addrspace(1)* %180, align 4, !tbaa !7
  %181 = add nsw i32 %167, 1
  br label %182

182:                                              ; preds = %172, %166
  %183 = phi i32 [ %181, %172 ], [ %167, %166 ]
  %184 = add nuw nsw i32 %168, 1
  %185 = add i32 %169, 1
  %186 = icmp eq i32 %185, %158
  br i1 %186, label %187, label %166, !llvm.loop !13

187:                                              ; preds = %182, %162
  br i1 %31, label %188, label %294

188:                                              ; preds = %187
  %189 = icmp ult i32 %30, %8
  %190 = mul i32 %30, %8
  %191 = and i32 %8, 1
  %192 = icmp eq i32 %8, 1
  br i1 %192, label %261, label %193

193:                                              ; preds = %188
  %194 = and i32 %8, -2
  br label %303

195:                                              ; preds = %256, %160
  %196 = phi i32 [ 0, %160 ], [ %257, %256 ]
  %197 = phi i32 [ 0, %160 ], [ %258, %256 ]
  %198 = phi i32 [ 0, %160 ], [ %259, %256 ]
  %199 = icmp eq i32 %196, %197
  %200 = select i1 %199, i1 %156, i1 false
  br i1 %200, label %201, label %211

201:                                              ; preds = %195
  %202 = add i32 %196, %157
  %203 = zext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %0, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !7
  %206 = mul nsw i32 %196, %8
  %207 = add i32 %206, %30
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %6, i64 %208
  store float %205, float addrspace(1)* %209, align 4, !tbaa !7
  %210 = add nsw i32 %196, 1
  br label %211

211:                                              ; preds = %195, %201
  %212 = phi i32 [ %210, %201 ], [ %196, %195 ]
  %213 = or i32 %197, 1
  %214 = icmp eq i32 %212, %213
  %215 = select i1 %214, i1 %156, i1 false
  br i1 %215, label %216, label %226

216:                                              ; preds = %211
  %217 = add i32 %212, %157
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %0, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7
  %221 = mul nsw i32 %212, %8
  %222 = add i32 %221, %30
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %6, i64 %223
  store float %220, float addrspace(1)* %224, align 4, !tbaa !7
  %225 = add nsw i32 %212, 1
  br label %226

226:                                              ; preds = %216, %211
  %227 = phi i32 [ %225, %216 ], [ %212, %211 ]
  %228 = or i32 %197, 2
  %229 = icmp eq i32 %227, %228
  %230 = select i1 %229, i1 %156, i1 false
  br i1 %230, label %231, label %241

231:                                              ; preds = %226
  %232 = add i32 %227, %157
  %233 = zext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !7
  %236 = mul nsw i32 %227, %8
  %237 = add i32 %236, %30
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %6, i64 %238
  store float %235, float addrspace(1)* %239, align 4, !tbaa !7
  %240 = add nsw i32 %227, 1
  br label %241

241:                                              ; preds = %231, %226
  %242 = phi i32 [ %240, %231 ], [ %227, %226 ]
  %243 = or i32 %197, 3
  %244 = icmp eq i32 %242, %243
  %245 = select i1 %244, i1 %156, i1 false
  br i1 %245, label %246, label %256

246:                                              ; preds = %241
  %247 = add i32 %242, %157
  %248 = zext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %0, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7
  %251 = mul nsw i32 %242, %8
  %252 = add i32 %251, %30
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds float, float addrspace(1)* %6, i64 %253
  store float %250, float addrspace(1)* %254, align 4, !tbaa !7
  %255 = add nsw i32 %242, 1
  br label %256

256:                                              ; preds = %246, %241
  %257 = phi i32 [ %255, %246 ], [ %242, %241 ]
  %258 = add nuw nsw i32 %197, 4
  %259 = add i32 %198, 4
  %260 = icmp eq i32 %259, %161
  br i1 %260, label %162, label %195, !llvm.loop !15

261:                                              ; preds = %368, %188
  %262 = phi i32 [ 0, %188 ], [ %369, %368 ]
  %263 = phi i32 [ 0, %188 ], [ %370, %368 ]
  %264 = icmp ne i32 %191, 0
  %265 = icmp eq i32 %262, %263
  %266 = select i1 %265, i1 %189, i1 false
  %267 = select i1 %264, i1 %266, i1 false
  br i1 %267, label %268, label %294

268:                                              ; preds = %261
  %269 = add i32 %262, %190
  %270 = zext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %0, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %273 = fcmp contract ogt float %272, 0.000000e+00
  br i1 %273, label %274, label %294

274:                                              ; preds = %268
  %275 = tail call i1 @llvm.amdgcn.class.f32(float %272, i32 144)
  %276 = select i1 %275, float 0x41F0000000000000, float 1.000000e+00
  %277 = fmul float %272, %276
  %278 = tail call float @llvm.log2.f32(float %277)
  %279 = fmul float %278, 0x3FD3441340000000
  %280 = tail call i1 @llvm.amdgcn.class.f32(float %278, i32 519)
  %281 = fneg float %279
  %282 = tail call float @llvm.fma.f32(float %278, float 0x3FD3441340000000, float %281)
  %283 = tail call float @llvm.fma.f32(float %278, float 0x3E509F79E0000000, float %282)
  %284 = fadd float %279, %283
  %285 = select i1 %280, float %278, float %284
  %286 = select i1 %275, float 0x4023441360000000, float 0.000000e+00
  %287 = fsub float %285, %286
  %288 = fneg contract float %272
  %289 = fmul contract float %287, %288
  %290 = mul nsw i32 %262, %8
  %291 = add i32 %290, %30
  %292 = zext i32 %291 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %3, i64 %292
  store float %289, float addrspace(1)* %293, align 4, !tbaa !7
  br label %294

294:                                              ; preds = %261, %274, %268, %154, %187
  %295 = icmp sgt i32 %10, 1
  br i1 %295, label %296, label %373

296:                                              ; preds = %294
  %297 = zext i32 %30 to i64
  %298 = getelementptr inbounds float, float addrspace(1)* %2, i64 %297
  %299 = getelementptr inbounds float, float addrspace(1)* %3, i64 %297
  %300 = getelementptr inbounds float, float addrspace(1)* %5, i64 %297
  %301 = getelementptr inbounds float, float addrspace(1)* %6, i64 %297
  %302 = getelementptr inbounds float, float addrspace(1)* %4, i64 %297
  br label %375

303:                                              ; preds = %368, %193
  %304 = phi i32 [ 0, %193 ], [ %369, %368 ]
  %305 = phi i32 [ 0, %193 ], [ %370, %368 ]
  %306 = phi i32 [ 0, %193 ], [ %371, %368 ]
  %307 = icmp eq i32 %304, %305
  %308 = select i1 %307, i1 %189, i1 false
  br i1 %308, label %309, label %336

309:                                              ; preds = %303
  %310 = add i32 %304, %190
  %311 = zext i32 %310 to i64
  %312 = getelementptr inbounds float, float addrspace(1)* %0, i64 %311
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !7
  %314 = fcmp contract ogt float %313, 0.000000e+00
  br i1 %314, label %315, label %336

315:                                              ; preds = %309
  %316 = tail call i1 @llvm.amdgcn.class.f32(float %313, i32 144)
  %317 = select i1 %316, float 0x41F0000000000000, float 1.000000e+00
  %318 = fmul float %313, %317
  %319 = tail call float @llvm.log2.f32(float %318)
  %320 = fmul float %319, 0x3FD3441340000000
  %321 = tail call i1 @llvm.amdgcn.class.f32(float %319, i32 519)
  %322 = fneg float %320
  %323 = tail call float @llvm.fma.f32(float %319, float 0x3FD3441340000000, float %322)
  %324 = tail call float @llvm.fma.f32(float %319, float 0x3E509F79E0000000, float %323)
  %325 = fadd float %320, %324
  %326 = select i1 %321, float %319, float %325
  %327 = select i1 %316, float 0x4023441360000000, float 0.000000e+00
  %328 = fsub float %326, %327
  %329 = fneg contract float %313
  %330 = fmul contract float %328, %329
  %331 = mul nsw i32 %304, %8
  %332 = add i32 %331, %30
  %333 = zext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %3, i64 %333
  store float %330, float addrspace(1)* %334, align 4, !tbaa !7
  %335 = add nsw i32 %304, 1
  br label %336

336:                                              ; preds = %303, %309, %315
  %337 = phi i32 [ %335, %315 ], [ %304, %309 ], [ %304, %303 ]
  %338 = or i32 %305, 1
  %339 = icmp eq i32 %337, %338
  %340 = select i1 %339, i1 %189, i1 false
  br i1 %340, label %341, label %368

341:                                              ; preds = %336
  %342 = add i32 %337, %190
  %343 = zext i32 %342 to i64
  %344 = getelementptr inbounds float, float addrspace(1)* %0, i64 %343
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !7
  %346 = fcmp contract ogt float %345, 0.000000e+00
  br i1 %346, label %347, label %368

347:                                              ; preds = %341
  %348 = tail call i1 @llvm.amdgcn.class.f32(float %345, i32 144)
  %349 = select i1 %348, float 0x41F0000000000000, float 1.000000e+00
  %350 = fmul float %345, %349
  %351 = tail call float @llvm.log2.f32(float %350)
  %352 = fmul float %351, 0x3FD3441340000000
  %353 = tail call i1 @llvm.amdgcn.class.f32(float %351, i32 519)
  %354 = fneg float %352
  %355 = tail call float @llvm.fma.f32(float %351, float 0x3FD3441340000000, float %354)
  %356 = tail call float @llvm.fma.f32(float %351, float 0x3E509F79E0000000, float %355)
  %357 = fadd float %352, %356
  %358 = select i1 %353, float %351, float %357
  %359 = select i1 %348, float 0x4023441360000000, float 0.000000e+00
  %360 = fsub float %358, %359
  %361 = fneg contract float %345
  %362 = fmul contract float %360, %361
  %363 = mul nsw i32 %337, %8
  %364 = add i32 %363, %30
  %365 = zext i32 %364 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %3, i64 %365
  store float %362, float addrspace(1)* %366, align 4, !tbaa !7
  %367 = add nsw i32 %337, 1
  br label %368

368:                                              ; preds = %347, %341, %336
  %369 = phi i32 [ %367, %347 ], [ %337, %341 ], [ %337, %336 ]
  %370 = add nuw nsw i32 %305, 2
  %371 = add i32 %306, 2
  %372 = icmp eq i32 %371, %194
  br i1 %372, label %261, label %303, !llvm.loop !16

373:                                              ; preds = %404, %294
  %374 = icmp ugt i32 %30, 9000
  br i1 %374, label %406, label %429

375:                                              ; preds = %296, %404
  %376 = phi i32 [ 1, %296 ], [ %377, %404 ]
  %377 = shl nsw i32 %376, 1
  %378 = add i32 %377, 1023
  %379 = and i32 %378, %12
  %380 = icmp eq i32 %379, 0
  br i1 %380, label %381, label %404

381:                                              ; preds = %375
  %382 = add i32 %376, %30
  %383 = zext i32 %382 to i64
  %384 = getelementptr inbounds float, float addrspace(1)* %2, i64 %383
  %385 = load float, float addrspace(1)* %384, align 4, !tbaa !7
  %386 = load float, float addrspace(1)* %298, align 4, !tbaa !7
  %387 = fadd contract float %385, %386
  store float %387, float addrspace(1)* %298, align 4, !tbaa !7
  %388 = getelementptr inbounds float, float addrspace(1)* %3, i64 %383
  %389 = load float, float addrspace(1)* %388, align 4, !tbaa !7
  %390 = load float, float addrspace(1)* %299, align 4, !tbaa !7
  %391 = fadd contract float %389, %390
  store float %391, float addrspace(1)* %299, align 4, !tbaa !7
  %392 = getelementptr inbounds float, float addrspace(1)* %5, i64 %383
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !7
  %394 = load float, float addrspace(1)* %300, align 4, !tbaa !7
  %395 = fadd contract float %393, %394
  store float %395, float addrspace(1)* %300, align 4, !tbaa !7
  %396 = getelementptr inbounds float, float addrspace(1)* %6, i64 %383
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !7
  %398 = load float, float addrspace(1)* %301, align 4, !tbaa !7
  %399 = fadd contract float %397, %398
  store float %399, float addrspace(1)* %301, align 4, !tbaa !7
  %400 = getelementptr inbounds float, float addrspace(1)* %4, i64 %383
  %401 = load float, float addrspace(1)* %400, align 4, !tbaa !7
  %402 = load float, float addrspace(1)* %302, align 4, !tbaa !7
  %403 = fadd contract float %401, %402
  store float %403, float addrspace(1)* %302, align 4, !tbaa !7
  br label %404

404:                                              ; preds = %381, %375
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %405 = icmp slt i32 %377, %10
  br i1 %405, label %375, label %373, !llvm.loop !17

406:                                              ; preds = %373
  %407 = zext i32 %30 to i64
  %408 = getelementptr inbounds float, float addrspace(1)* %0, i64 %407
  %409 = load float, float addrspace(1)* %408, align 4, !tbaa !7
  %410 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %411 = load float, float addrspace(1)* %6, align 4, !tbaa !7
  %412 = fmul contract float %410, %411
  %413 = tail call i1 @llvm.amdgcn.class.f32(float %412, i32 144)
  %414 = select i1 %413, float 0x41F0000000000000, float 1.000000e+00
  %415 = fmul float %412, %414
  %416 = tail call float @llvm.log2.f32(float %415)
  %417 = fmul float %416, 0x3FD3441340000000
  %418 = tail call i1 @llvm.amdgcn.class.f32(float %416, i32 519)
  %419 = fneg float %417
  %420 = tail call float @llvm.fma.f32(float %416, float 0x3FD3441340000000, float %419)
  %421 = tail call float @llvm.fma.f32(float %416, float 0x3E509F79E0000000, float %420)
  %422 = fadd float %417, %421
  %423 = select i1 %418, float %416, float %422
  %424 = select i1 %413, float 0x4023441360000000, float 0.000000e+00
  %425 = fsub float %423, %424
  %426 = fmul contract float %409, %425
  %427 = tail call float @llvm.fabs.f32(float %426)
  %428 = getelementptr inbounds float, float addrspace(1)* %7, i64 %407
  store float %427, float addrspace(1)* %428, align 4, !tbaa !7
  br label %429

429:                                              ; preds = %406, %373
  br i1 %295, label %430, label %433

430:                                              ; preds = %429
  %431 = zext i32 %30 to i64
  %432 = getelementptr inbounds float, float addrspace(1)* %7, i64 %431
  br label %435

433:                                              ; preds = %448, %429
  %434 = icmp eq i32 %30, 0
  br i1 %434, label %450, label %926

435:                                              ; preds = %430, %448
  %436 = phi i32 [ 1, %430 ], [ %437, %448 ]
  %437 = shl nsw i32 %436, 1
  %438 = add i32 %437, 1023
  %439 = and i32 %438, %12
  %440 = icmp eq i32 %439, 0
  br i1 %440, label %441, label %448

441:                                              ; preds = %435
  %442 = add i32 %436, %30
  %443 = zext i32 %442 to i64
  %444 = getelementptr inbounds float, float addrspace(1)* %7, i64 %443
  %445 = load float, float addrspace(1)* %444, align 4, !tbaa !7
  %446 = load float, float addrspace(1)* %432, align 4, !tbaa !7
  %447 = fadd contract float %445, %446
  store float %447, float addrspace(1)* %432, align 4, !tbaa !7
  br label %448

448:                                              ; preds = %441, %435
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %449 = icmp slt i32 %437, %10
  br i1 %449, label %435, label %433, !llvm.loop !18

450:                                              ; preds = %433
  %451 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %452 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %453 = fcmp contract ogt float %451, %452
  %454 = load float, float addrspace(1)* %4, align 4, !tbaa !7
  %455 = load float, float addrspace(1)* %7, align 4, !tbaa !7
  br i1 %453, label %456, label %459

456:                                              ; preds = %450
  %457 = fsub contract float %454, %455
  %458 = fdiv contract float %457, %451
  br label %462

459:                                              ; preds = %450
  %460 = fdiv contract float %455, %452
  %461 = fsub contract float %454, %460
  br label %462

462:                                              ; preds = %459, %456
  %463 = phi float [ %461, %459 ], [ %458, %456 ]
  store float %463, float addrspace(1)* %1, align 4, !tbaa !7
  %464 = tail call float @llvm.fabs.f32(float %463)
  %465 = fpext float %464 to double
  %466 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %467 = getelementptr inbounds i8, i8 addrspace(4)* %466, i64 24
  %468 = bitcast i8 addrspace(4)* %467 to i64 addrspace(4)*
  %469 = load i64, i64 addrspace(4)* %468, align 8, !tbaa !19
  %470 = inttoptr i64 %469 to i8 addrspace(1)*
  %471 = addrspacecast i8 addrspace(1)* %470 to i8*
  %472 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %471, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %473 = extractelement <2 x i64> %472, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %474, label %478

474:                                              ; preds = %462
  %475 = and i64 %473, -225
  %476 = or i64 %475, 32
  %477 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %471, i64 noundef %476, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %919

478:                                              ; preds = %462
  %479 = and i64 %473, 2
  %480 = and i64 %473, -3
  %481 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %480, i64 0
  br label %482

482:                                              ; preds = %908, %478
  %483 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 7) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([8 x i8]* addrspacecast ([8 x i8] addrspace(4)* @.str to [8 x i8]*) to i64)), i64 1))), %478 ], [ %916, %908 ]
  %484 = phi i8 addrspace(4)* [ getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 0), %478 ], [ %917, %908 ]
  %485 = phi <2 x i64> [ %481, %478 ], [ %915, %908 ]
  %486 = icmp ugt i64 %483, 56
  %487 = extractelement <2 x i64> %485, i64 0
  %488 = or i64 %487, %479
  %489 = insertelement <2 x i64> poison, i64 %488, i64 0
  %490 = select i1 %486, <2 x i64> %485, <2 x i64> %489
  %491 = tail call i64 @llvm.umin.i64(i64 %483, i64 56)
  %492 = trunc i64 %491 to i32
  %493 = extractelement <2 x i64> %490, i64 0
  %494 = icmp ugt i32 %492, 7
  br i1 %494, label %497, label %495

495:                                              ; preds = %482
  %496 = icmp eq i32 %492, 0
  br i1 %496, label %550, label %537

497:                                              ; preds = %482
  %498 = load i8, i8 addrspace(4)* %484, align 1, !tbaa !23
  %499 = zext i8 %498 to i64
  %500 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 1
  %501 = load i8, i8 addrspace(4)* %500, align 1, !tbaa !23
  %502 = zext i8 %501 to i64
  %503 = shl nuw nsw i64 %502, 8
  %504 = or i64 %503, %499
  %505 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 2
  %506 = load i8, i8 addrspace(4)* %505, align 1, !tbaa !23
  %507 = zext i8 %506 to i64
  %508 = shl nuw nsw i64 %507, 16
  %509 = or i64 %504, %508
  %510 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 3
  %511 = load i8, i8 addrspace(4)* %510, align 1, !tbaa !23
  %512 = zext i8 %511 to i64
  %513 = shl nuw nsw i64 %512, 24
  %514 = or i64 %509, %513
  %515 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 4
  %516 = load i8, i8 addrspace(4)* %515, align 1, !tbaa !23
  %517 = zext i8 %516 to i64
  %518 = shl nuw nsw i64 %517, 32
  %519 = or i64 %514, %518
  %520 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 5
  %521 = load i8, i8 addrspace(4)* %520, align 1, !tbaa !23
  %522 = zext i8 %521 to i64
  %523 = shl nuw nsw i64 %522, 40
  %524 = or i64 %519, %523
  %525 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 6
  %526 = load i8, i8 addrspace(4)* %525, align 1, !tbaa !23
  %527 = zext i8 %526 to i64
  %528 = shl nuw nsw i64 %527, 48
  %529 = or i64 %524, %528
  %530 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 7
  %531 = load i8, i8 addrspace(4)* %530, align 1, !tbaa !23
  %532 = zext i8 %531 to i64
  %533 = shl nuw i64 %532, 56
  %534 = or i64 %529, %533
  %535 = add nsw i32 %492, -8
  %536 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 8
  br label %550

537:                                              ; preds = %495, %537
  %538 = phi i32 [ %548, %537 ], [ 0, %495 ]
  %539 = phi i64 [ %547, %537 ], [ 0, %495 ]
  %540 = zext i32 %538 to i64
  %541 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 %540
  %542 = load i8, i8 addrspace(4)* %541, align 1, !tbaa !23
  %543 = zext i8 %542 to i64
  %544 = shl i32 %538, 3
  %545 = zext i32 %544 to i64
  %546 = shl nuw i64 %543, %545
  %547 = or i64 %546, %539
  %548 = add nuw nsw i32 %538, 1
  %549 = icmp eq i32 %548, %492
  br i1 %549, label %550, label %537, !llvm.loop !24

550:                                              ; preds = %537, %497, %495
  %551 = phi i8 addrspace(4)* [ %536, %497 ], [ %484, %495 ], [ %484, %537 ]
  %552 = phi i32 [ %535, %497 ], [ 0, %495 ], [ 0, %537 ]
  %553 = phi i64 [ %534, %497 ], [ 0, %495 ], [ %547, %537 ]
  %554 = icmp ugt i32 %552, 7
  br i1 %554, label %557, label %555

555:                                              ; preds = %550
  %556 = icmp eq i32 %552, 0
  br i1 %556, label %610, label %597

557:                                              ; preds = %550
  %558 = load i8, i8 addrspace(4)* %551, align 1, !tbaa !23
  %559 = zext i8 %558 to i64
  %560 = getelementptr inbounds i8, i8 addrspace(4)* %551, i64 1
  %561 = load i8, i8 addrspace(4)* %560, align 1, !tbaa !23
  %562 = zext i8 %561 to i64
  %563 = shl nuw nsw i64 %562, 8
  %564 = or i64 %563, %559
  %565 = getelementptr inbounds i8, i8 addrspace(4)* %551, i64 2
  %566 = load i8, i8 addrspace(4)* %565, align 1, !tbaa !23
  %567 = zext i8 %566 to i64
  %568 = shl nuw nsw i64 %567, 16
  %569 = or i64 %564, %568
  %570 = getelementptr inbounds i8, i8 addrspace(4)* %551, i64 3
  %571 = load i8, i8 addrspace(4)* %570, align 1, !tbaa !23
  %572 = zext i8 %571 to i64
  %573 = shl nuw nsw i64 %572, 24
  %574 = or i64 %569, %573
  %575 = getelementptr inbounds i8, i8 addrspace(4)* %551, i64 4
  %576 = load i8, i8 addrspace(4)* %575, align 1, !tbaa !23
  %577 = zext i8 %576 to i64
  %578 = shl nuw nsw i64 %577, 32
  %579 = or i64 %574, %578
  %580 = getelementptr inbounds i8, i8 addrspace(4)* %551, i64 5
  %581 = load i8, i8 addrspace(4)* %580, align 1, !tbaa !23
  %582 = zext i8 %581 to i64
  %583 = shl nuw nsw i64 %582, 40
  %584 = or i64 %579, %583
  %585 = getelementptr inbounds i8, i8 addrspace(4)* %551, i64 6
  %586 = load i8, i8 addrspace(4)* %585, align 1, !tbaa !23
  %587 = zext i8 %586 to i64
  %588 = shl nuw nsw i64 %587, 48
  %589 = or i64 %584, %588
  %590 = getelementptr inbounds i8, i8 addrspace(4)* %551, i64 7
  %591 = load i8, i8 addrspace(4)* %590, align 1, !tbaa !23
  %592 = zext i8 %591 to i64
  %593 = shl nuw i64 %592, 56
  %594 = or i64 %589, %593
  %595 = add nsw i32 %552, -8
  %596 = getelementptr inbounds i8, i8 addrspace(4)* %551, i64 8
  br label %610

597:                                              ; preds = %555, %597
  %598 = phi i32 [ %608, %597 ], [ 0, %555 ]
  %599 = phi i64 [ %607, %597 ], [ 0, %555 ]
  %600 = zext i32 %598 to i64
  %601 = getelementptr inbounds i8, i8 addrspace(4)* %551, i64 %600
  %602 = load i8, i8 addrspace(4)* %601, align 1, !tbaa !23
  %603 = zext i8 %602 to i64
  %604 = shl i32 %598, 3
  %605 = zext i32 %604 to i64
  %606 = shl nuw i64 %603, %605
  %607 = or i64 %606, %599
  %608 = add nuw nsw i32 %598, 1
  %609 = icmp eq i32 %608, %552
  br i1 %609, label %610, label %597

610:                                              ; preds = %597, %557, %555
  %611 = phi i8 addrspace(4)* [ %596, %557 ], [ %551, %555 ], [ %551, %597 ]
  %612 = phi i32 [ %595, %557 ], [ 0, %555 ], [ 0, %597 ]
  %613 = phi i64 [ %594, %557 ], [ 0, %555 ], [ %607, %597 ]
  %614 = icmp ugt i32 %612, 7
  br i1 %614, label %617, label %615

615:                                              ; preds = %610
  %616 = icmp eq i32 %612, 0
  br i1 %616, label %670, label %657

617:                                              ; preds = %610
  %618 = load i8, i8 addrspace(4)* %611, align 1, !tbaa !23
  %619 = zext i8 %618 to i64
  %620 = getelementptr inbounds i8, i8 addrspace(4)* %611, i64 1
  %621 = load i8, i8 addrspace(4)* %620, align 1, !tbaa !23
  %622 = zext i8 %621 to i64
  %623 = shl nuw nsw i64 %622, 8
  %624 = or i64 %623, %619
  %625 = getelementptr inbounds i8, i8 addrspace(4)* %611, i64 2
  %626 = load i8, i8 addrspace(4)* %625, align 1, !tbaa !23
  %627 = zext i8 %626 to i64
  %628 = shl nuw nsw i64 %627, 16
  %629 = or i64 %624, %628
  %630 = getelementptr inbounds i8, i8 addrspace(4)* %611, i64 3
  %631 = load i8, i8 addrspace(4)* %630, align 1, !tbaa !23
  %632 = zext i8 %631 to i64
  %633 = shl nuw nsw i64 %632, 24
  %634 = or i64 %629, %633
  %635 = getelementptr inbounds i8, i8 addrspace(4)* %611, i64 4
  %636 = load i8, i8 addrspace(4)* %635, align 1, !tbaa !23
  %637 = zext i8 %636 to i64
  %638 = shl nuw nsw i64 %637, 32
  %639 = or i64 %634, %638
  %640 = getelementptr inbounds i8, i8 addrspace(4)* %611, i64 5
  %641 = load i8, i8 addrspace(4)* %640, align 1, !tbaa !23
  %642 = zext i8 %641 to i64
  %643 = shl nuw nsw i64 %642, 40
  %644 = or i64 %639, %643
  %645 = getelementptr inbounds i8, i8 addrspace(4)* %611, i64 6
  %646 = load i8, i8 addrspace(4)* %645, align 1, !tbaa !23
  %647 = zext i8 %646 to i64
  %648 = shl nuw nsw i64 %647, 48
  %649 = or i64 %644, %648
  %650 = getelementptr inbounds i8, i8 addrspace(4)* %611, i64 7
  %651 = load i8, i8 addrspace(4)* %650, align 1, !tbaa !23
  %652 = zext i8 %651 to i64
  %653 = shl nuw i64 %652, 56
  %654 = or i64 %649, %653
  %655 = add nsw i32 %612, -8
  %656 = getelementptr inbounds i8, i8 addrspace(4)* %611, i64 8
  br label %670

657:                                              ; preds = %615, %657
  %658 = phi i32 [ %668, %657 ], [ 0, %615 ]
  %659 = phi i64 [ %667, %657 ], [ 0, %615 ]
  %660 = zext i32 %658 to i64
  %661 = getelementptr inbounds i8, i8 addrspace(4)* %611, i64 %660
  %662 = load i8, i8 addrspace(4)* %661, align 1, !tbaa !23
  %663 = zext i8 %662 to i64
  %664 = shl i32 %658, 3
  %665 = zext i32 %664 to i64
  %666 = shl nuw i64 %663, %665
  %667 = or i64 %666, %659
  %668 = add nuw nsw i32 %658, 1
  %669 = icmp eq i32 %668, %612
  br i1 %669, label %670, label %657

670:                                              ; preds = %657, %617, %615
  %671 = phi i8 addrspace(4)* [ %656, %617 ], [ %611, %615 ], [ %611, %657 ]
  %672 = phi i32 [ %655, %617 ], [ 0, %615 ], [ 0, %657 ]
  %673 = phi i64 [ %654, %617 ], [ 0, %615 ], [ %667, %657 ]
  %674 = icmp ugt i32 %672, 7
  br i1 %674, label %677, label %675

675:                                              ; preds = %670
  %676 = icmp eq i32 %672, 0
  br i1 %676, label %730, label %717

677:                                              ; preds = %670
  %678 = load i8, i8 addrspace(4)* %671, align 1, !tbaa !23
  %679 = zext i8 %678 to i64
  %680 = getelementptr inbounds i8, i8 addrspace(4)* %671, i64 1
  %681 = load i8, i8 addrspace(4)* %680, align 1, !tbaa !23
  %682 = zext i8 %681 to i64
  %683 = shl nuw nsw i64 %682, 8
  %684 = or i64 %683, %679
  %685 = getelementptr inbounds i8, i8 addrspace(4)* %671, i64 2
  %686 = load i8, i8 addrspace(4)* %685, align 1, !tbaa !23
  %687 = zext i8 %686 to i64
  %688 = shl nuw nsw i64 %687, 16
  %689 = or i64 %684, %688
  %690 = getelementptr inbounds i8, i8 addrspace(4)* %671, i64 3
  %691 = load i8, i8 addrspace(4)* %690, align 1, !tbaa !23
  %692 = zext i8 %691 to i64
  %693 = shl nuw nsw i64 %692, 24
  %694 = or i64 %689, %693
  %695 = getelementptr inbounds i8, i8 addrspace(4)* %671, i64 4
  %696 = load i8, i8 addrspace(4)* %695, align 1, !tbaa !23
  %697 = zext i8 %696 to i64
  %698 = shl nuw nsw i64 %697, 32
  %699 = or i64 %694, %698
  %700 = getelementptr inbounds i8, i8 addrspace(4)* %671, i64 5
  %701 = load i8, i8 addrspace(4)* %700, align 1, !tbaa !23
  %702 = zext i8 %701 to i64
  %703 = shl nuw nsw i64 %702, 40
  %704 = or i64 %699, %703
  %705 = getelementptr inbounds i8, i8 addrspace(4)* %671, i64 6
  %706 = load i8, i8 addrspace(4)* %705, align 1, !tbaa !23
  %707 = zext i8 %706 to i64
  %708 = shl nuw nsw i64 %707, 48
  %709 = or i64 %704, %708
  %710 = getelementptr inbounds i8, i8 addrspace(4)* %671, i64 7
  %711 = load i8, i8 addrspace(4)* %710, align 1, !tbaa !23
  %712 = zext i8 %711 to i64
  %713 = shl nuw i64 %712, 56
  %714 = or i64 %709, %713
  %715 = add nsw i32 %672, -8
  %716 = getelementptr inbounds i8, i8 addrspace(4)* %671, i64 8
  br label %730

717:                                              ; preds = %675, %717
  %718 = phi i32 [ %728, %717 ], [ 0, %675 ]
  %719 = phi i64 [ %727, %717 ], [ 0, %675 ]
  %720 = zext i32 %718 to i64
  %721 = getelementptr inbounds i8, i8 addrspace(4)* %671, i64 %720
  %722 = load i8, i8 addrspace(4)* %721, align 1, !tbaa !23
  %723 = zext i8 %722 to i64
  %724 = shl i32 %718, 3
  %725 = zext i32 %724 to i64
  %726 = shl nuw i64 %723, %725
  %727 = or i64 %726, %719
  %728 = add nuw nsw i32 %718, 1
  %729 = icmp eq i32 %728, %672
  br i1 %729, label %730, label %717

730:                                              ; preds = %717, %677, %675
  %731 = phi i8 addrspace(4)* [ %716, %677 ], [ %671, %675 ], [ %671, %717 ]
  %732 = phi i32 [ %715, %677 ], [ 0, %675 ], [ 0, %717 ]
  %733 = phi i64 [ %714, %677 ], [ 0, %675 ], [ %727, %717 ]
  %734 = icmp ugt i32 %732, 7
  br i1 %734, label %737, label %735

735:                                              ; preds = %730
  %736 = icmp eq i32 %732, 0
  br i1 %736, label %790, label %777

737:                                              ; preds = %730
  %738 = load i8, i8 addrspace(4)* %731, align 1, !tbaa !23
  %739 = zext i8 %738 to i64
  %740 = getelementptr inbounds i8, i8 addrspace(4)* %731, i64 1
  %741 = load i8, i8 addrspace(4)* %740, align 1, !tbaa !23
  %742 = zext i8 %741 to i64
  %743 = shl nuw nsw i64 %742, 8
  %744 = or i64 %743, %739
  %745 = getelementptr inbounds i8, i8 addrspace(4)* %731, i64 2
  %746 = load i8, i8 addrspace(4)* %745, align 1, !tbaa !23
  %747 = zext i8 %746 to i64
  %748 = shl nuw nsw i64 %747, 16
  %749 = or i64 %744, %748
  %750 = getelementptr inbounds i8, i8 addrspace(4)* %731, i64 3
  %751 = load i8, i8 addrspace(4)* %750, align 1, !tbaa !23
  %752 = zext i8 %751 to i64
  %753 = shl nuw nsw i64 %752, 24
  %754 = or i64 %749, %753
  %755 = getelementptr inbounds i8, i8 addrspace(4)* %731, i64 4
  %756 = load i8, i8 addrspace(4)* %755, align 1, !tbaa !23
  %757 = zext i8 %756 to i64
  %758 = shl nuw nsw i64 %757, 32
  %759 = or i64 %754, %758
  %760 = getelementptr inbounds i8, i8 addrspace(4)* %731, i64 5
  %761 = load i8, i8 addrspace(4)* %760, align 1, !tbaa !23
  %762 = zext i8 %761 to i64
  %763 = shl nuw nsw i64 %762, 40
  %764 = or i64 %759, %763
  %765 = getelementptr inbounds i8, i8 addrspace(4)* %731, i64 6
  %766 = load i8, i8 addrspace(4)* %765, align 1, !tbaa !23
  %767 = zext i8 %766 to i64
  %768 = shl nuw nsw i64 %767, 48
  %769 = or i64 %764, %768
  %770 = getelementptr inbounds i8, i8 addrspace(4)* %731, i64 7
  %771 = load i8, i8 addrspace(4)* %770, align 1, !tbaa !23
  %772 = zext i8 %771 to i64
  %773 = shl nuw i64 %772, 56
  %774 = or i64 %769, %773
  %775 = add nsw i32 %732, -8
  %776 = getelementptr inbounds i8, i8 addrspace(4)* %731, i64 8
  br label %790

777:                                              ; preds = %735, %777
  %778 = phi i32 [ %788, %777 ], [ 0, %735 ]
  %779 = phi i64 [ %787, %777 ], [ 0, %735 ]
  %780 = zext i32 %778 to i64
  %781 = getelementptr inbounds i8, i8 addrspace(4)* %731, i64 %780
  %782 = load i8, i8 addrspace(4)* %781, align 1, !tbaa !23
  %783 = zext i8 %782 to i64
  %784 = shl i32 %778, 3
  %785 = zext i32 %784 to i64
  %786 = shl nuw i64 %783, %785
  %787 = or i64 %786, %779
  %788 = add nuw nsw i32 %778, 1
  %789 = icmp eq i32 %788, %732
  br i1 %789, label %790, label %777

790:                                              ; preds = %777, %737, %735
  %791 = phi i8 addrspace(4)* [ %776, %737 ], [ %731, %735 ], [ %731, %777 ]
  %792 = phi i32 [ %775, %737 ], [ 0, %735 ], [ 0, %777 ]
  %793 = phi i64 [ %774, %737 ], [ 0, %735 ], [ %787, %777 ]
  %794 = icmp ugt i32 %792, 7
  br i1 %794, label %797, label %795

795:                                              ; preds = %790
  %796 = icmp eq i32 %792, 0
  br i1 %796, label %850, label %837

797:                                              ; preds = %790
  %798 = load i8, i8 addrspace(4)* %791, align 1, !tbaa !23
  %799 = zext i8 %798 to i64
  %800 = getelementptr inbounds i8, i8 addrspace(4)* %791, i64 1
  %801 = load i8, i8 addrspace(4)* %800, align 1, !tbaa !23
  %802 = zext i8 %801 to i64
  %803 = shl nuw nsw i64 %802, 8
  %804 = or i64 %803, %799
  %805 = getelementptr inbounds i8, i8 addrspace(4)* %791, i64 2
  %806 = load i8, i8 addrspace(4)* %805, align 1, !tbaa !23
  %807 = zext i8 %806 to i64
  %808 = shl nuw nsw i64 %807, 16
  %809 = or i64 %804, %808
  %810 = getelementptr inbounds i8, i8 addrspace(4)* %791, i64 3
  %811 = load i8, i8 addrspace(4)* %810, align 1, !tbaa !23
  %812 = zext i8 %811 to i64
  %813 = shl nuw nsw i64 %812, 24
  %814 = or i64 %809, %813
  %815 = getelementptr inbounds i8, i8 addrspace(4)* %791, i64 4
  %816 = load i8, i8 addrspace(4)* %815, align 1, !tbaa !23
  %817 = zext i8 %816 to i64
  %818 = shl nuw nsw i64 %817, 32
  %819 = or i64 %814, %818
  %820 = getelementptr inbounds i8, i8 addrspace(4)* %791, i64 5
  %821 = load i8, i8 addrspace(4)* %820, align 1, !tbaa !23
  %822 = zext i8 %821 to i64
  %823 = shl nuw nsw i64 %822, 40
  %824 = or i64 %819, %823
  %825 = getelementptr inbounds i8, i8 addrspace(4)* %791, i64 6
  %826 = load i8, i8 addrspace(4)* %825, align 1, !tbaa !23
  %827 = zext i8 %826 to i64
  %828 = shl nuw nsw i64 %827, 48
  %829 = or i64 %824, %828
  %830 = getelementptr inbounds i8, i8 addrspace(4)* %791, i64 7
  %831 = load i8, i8 addrspace(4)* %830, align 1, !tbaa !23
  %832 = zext i8 %831 to i64
  %833 = shl nuw i64 %832, 56
  %834 = or i64 %829, %833
  %835 = add nsw i32 %792, -8
  %836 = getelementptr inbounds i8, i8 addrspace(4)* %791, i64 8
  br label %850

837:                                              ; preds = %795, %837
  %838 = phi i32 [ %848, %837 ], [ 0, %795 ]
  %839 = phi i64 [ %847, %837 ], [ 0, %795 ]
  %840 = zext i32 %838 to i64
  %841 = getelementptr inbounds i8, i8 addrspace(4)* %791, i64 %840
  %842 = load i8, i8 addrspace(4)* %841, align 1, !tbaa !23
  %843 = zext i8 %842 to i64
  %844 = shl i32 %838, 3
  %845 = zext i32 %844 to i64
  %846 = shl nuw i64 %843, %845
  %847 = or i64 %846, %839
  %848 = add nuw nsw i32 %838, 1
  %849 = icmp eq i32 %848, %792
  br i1 %849, label %850, label %837

850:                                              ; preds = %837, %797, %795
  %851 = phi i8 addrspace(4)* [ %836, %797 ], [ %791, %795 ], [ %791, %837 ]
  %852 = phi i32 [ %835, %797 ], [ 0, %795 ], [ 0, %837 ]
  %853 = phi i64 [ %834, %797 ], [ 0, %795 ], [ %847, %837 ]
  %854 = icmp ugt i32 %852, 7
  br i1 %854, label %857, label %855

855:                                              ; preds = %850
  %856 = icmp eq i32 %852, 0
  br i1 %856, label %908, label %895

857:                                              ; preds = %850
  %858 = load i8, i8 addrspace(4)* %851, align 1, !tbaa !23
  %859 = zext i8 %858 to i64
  %860 = getelementptr inbounds i8, i8 addrspace(4)* %851, i64 1
  %861 = load i8, i8 addrspace(4)* %860, align 1, !tbaa !23
  %862 = zext i8 %861 to i64
  %863 = shl nuw nsw i64 %862, 8
  %864 = or i64 %863, %859
  %865 = getelementptr inbounds i8, i8 addrspace(4)* %851, i64 2
  %866 = load i8, i8 addrspace(4)* %865, align 1, !tbaa !23
  %867 = zext i8 %866 to i64
  %868 = shl nuw nsw i64 %867, 16
  %869 = or i64 %864, %868
  %870 = getelementptr inbounds i8, i8 addrspace(4)* %851, i64 3
  %871 = load i8, i8 addrspace(4)* %870, align 1, !tbaa !23
  %872 = zext i8 %871 to i64
  %873 = shl nuw nsw i64 %872, 24
  %874 = or i64 %869, %873
  %875 = getelementptr inbounds i8, i8 addrspace(4)* %851, i64 4
  %876 = load i8, i8 addrspace(4)* %875, align 1, !tbaa !23
  %877 = zext i8 %876 to i64
  %878 = shl nuw nsw i64 %877, 32
  %879 = or i64 %874, %878
  %880 = getelementptr inbounds i8, i8 addrspace(4)* %851, i64 5
  %881 = load i8, i8 addrspace(4)* %880, align 1, !tbaa !23
  %882 = zext i8 %881 to i64
  %883 = shl nuw nsw i64 %882, 40
  %884 = or i64 %879, %883
  %885 = getelementptr inbounds i8, i8 addrspace(4)* %851, i64 6
  %886 = load i8, i8 addrspace(4)* %885, align 1, !tbaa !23
  %887 = zext i8 %886 to i64
  %888 = shl nuw nsw i64 %887, 48
  %889 = or i64 %884, %888
  %890 = getelementptr inbounds i8, i8 addrspace(4)* %851, i64 7
  %891 = load i8, i8 addrspace(4)* %890, align 1, !tbaa !23
  %892 = zext i8 %891 to i64
  %893 = shl nuw i64 %892, 56
  %894 = or i64 %889, %893
  br label %908

895:                                              ; preds = %855, %895
  %896 = phi i32 [ %906, %895 ], [ 0, %855 ]
  %897 = phi i64 [ %905, %895 ], [ 0, %855 ]
  %898 = zext i32 %896 to i64
  %899 = getelementptr inbounds i8, i8 addrspace(4)* %851, i64 %898
  %900 = load i8, i8 addrspace(4)* %899, align 1, !tbaa !23
  %901 = zext i8 %900 to i64
  %902 = shl i32 %896, 3
  %903 = zext i32 %902 to i64
  %904 = shl nuw i64 %901, %903
  %905 = or i64 %904, %897
  %906 = add nuw nsw i32 %896, 1
  %907 = icmp eq i32 %906, %852
  br i1 %907, label %908, label %895

908:                                              ; preds = %895, %857, %855
  %909 = phi i64 [ %894, %857 ], [ 0, %855 ], [ %905, %895 ]
  %910 = shl nuw nsw i64 %491, 2
  %911 = add nuw nsw i64 %910, 28
  %912 = and i64 %911, 480
  %913 = and i64 %493, -225
  %914 = or i64 %913, %912
  %915 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %471, i64 noundef %914, i64 noundef %553, i64 noundef %613, i64 noundef %673, i64 noundef %733, i64 noundef %793, i64 noundef %853, i64 noundef %909) #11
  %916 = sub i64 %483, %491
  %917 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 %491
  %918 = icmp eq i64 %916, 0
  br i1 %918, label %919, label %482

919:                                              ; preds = %908, %474
  %920 = phi <2 x i64> [ %477, %474 ], [ %915, %908 ]
  %921 = extractelement <2 x i64> %920, i64 0
  %922 = bitcast double %465 to i64
  %923 = and i64 %921, -227
  %924 = or i64 %923, 34
  %925 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %471, i64 noundef %924, i64 noundef %922, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %926

926:                                              ; preds = %919, %433
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #4

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #5 {
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !25
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !27
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !19
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !19
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !19
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !19
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !19
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !19
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !19
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !19
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #8
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !27
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !29
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !27
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #8
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !27
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #8
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !25
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #8
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !30
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !33
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !30
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !33
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !19
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #8
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !19
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !30
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !33
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !25
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #8
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !19
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !34
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !33
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !25
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !25
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !25
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !27
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !19
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !19
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !19
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !19
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !19
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !19
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !19
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !19
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %110 = call i64 @llvm.read_register.i64(metadata !35) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !36
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !38
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !39
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !19
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !19
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !19
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !19
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !19
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !19
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !19
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !19
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !19
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !30
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !33
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !40
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !40
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !41
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !43
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #8
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !25
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !25
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !19
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !19
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !23
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !19
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !33
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !30
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !40
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !40
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !23
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #8
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #8
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #8
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #8
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #8
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #8
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #8
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #6

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #7

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #8

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #10

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #4

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #6 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #7 = { mustprogress nounwind willreturn }
attributes #8 = { nounwind }
attributes #9 = { nofree nounwind readonly }
attributes #10 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #11 = { convergent nounwind }
attributes #12 = { convergent }

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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = !{!20, !20, i64 0}
!20 = !{!"long", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C/C++ TBAA"}
!23 = !{!21, !21, i64 0}
!24 = distinct !{!24, !14}
!25 = !{!26, !26, i64 0}
!26 = !{!"any pointer", !21, i64 0}
!27 = !{!28, !28, i64 0}
!28 = !{!"int", !21, i64 0}
!29 = !{i64 2662}
!30 = !{!31, !26, i64 0}
!31 = !{!"", !26, i64 0, !26, i64 8, !32, i64 16, !20, i64 24, !20, i64 32, !20, i64 40}
!32 = !{!"hsa_signal_s", !20, i64 0}
!33 = !{!31, !20, i64 40}
!34 = !{!31, !26, i64 8}
!35 = !{!"exec"}
!36 = !{!37, !28, i64 16}
!37 = !{!"", !20, i64 0, !20, i64 8, !28, i64 16, !28, i64 20}
!38 = !{!37, !20, i64 8}
!39 = !{!37, !28, i64 20}
!40 = !{!37, !20, i64 0}
!41 = !{!42, !20, i64 16}
!42 = !{!"amd_signal_s", !20, i64 0, !21, i64 8, !20, i64 16, !28, i64 24, !28, i64 28, !20, i64 32, !20, i64 40, !21, i64 48, !21, i64 56}
!43 = !{!42, !28, i64 24}
