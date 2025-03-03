; ModuleID = '../data/hip_kernels/16057/0/main.cu'
source_filename = "../data/hip_kernels/16057/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [12 x i8] c"ASM : %.1f\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [17 x i8] c"Contrast : %.1f\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [15 x i8] c"Energy : %.1f\0A\00", align 1
@.str.3 = private unnamed_addr addrspace(4) constant [16 x i8] c"Entropy : %.1f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z16glcm_calculationPiS_Pfiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #1 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = mul nsw i32 %23, %3
  %25 = add nsw i32 %24, %15
  %26 = mul nsw i32 %4, %3
  %27 = icmp uge i32 %25, %26
  %28 = icmp slt i32 %5, 0
  %29 = select i1 %27, i1 true, i1 %28
  br i1 %29, label %30, label %32

30:                                               ; preds = %6
  %31 = add nsw i32 %5, 1
  br label %126

32:                                               ; preds = %6
  %33 = zext i32 %25 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = add nuw i32 %25, 1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = add i32 %5, 1
  %39 = and i32 %38, 3
  %40 = icmp ult i32 %5, 3
  %41 = and i32 %38, -4
  %42 = icmp eq i32 %39, 0
  br label %43

43:                                               ; preds = %32, %123
  %44 = phi i32 [ 0, %32 ], [ %124, %123 ]
  %45 = mul nsw i32 %44, %38
  br i1 %40, label %103, label %46

46:                                               ; preds = %43, %99
  %47 = phi i32 [ %100, %99 ], [ 0, %43 ]
  %48 = phi i32 [ %101, %99 ], [ 0, %43 ]
  %49 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %50 = icmp eq i32 %49, %44
  br i1 %50, label %51, label %60

51:                                               ; preds = %46
  %52 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %53 = icmp eq i32 %52, %47
  br i1 %53, label %54, label %60

54:                                               ; preds = %51
  %55 = add nsw i32 %47, %45
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  %59 = add nsw i32 %58, 1
  store i32 %59, i32 addrspace(1)* %57, align 4, !tbaa !7
  br label %60

60:                                               ; preds = %46, %51, %54
  %61 = or i32 %47, 1
  %62 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %63 = icmp eq i32 %62, %44
  br i1 %63, label %64, label %73

64:                                               ; preds = %60
  %65 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %66 = icmp eq i32 %65, %61
  br i1 %66, label %67, label %73

67:                                               ; preds = %64
  %68 = add nsw i32 %61, %45
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7
  %72 = add nsw i32 %71, 1
  store i32 %72, i32 addrspace(1)* %70, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %67, %64, %60
  %74 = or i32 %47, 2
  %75 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %76 = icmp eq i32 %75, %44
  br i1 %76, label %77, label %86

77:                                               ; preds = %73
  %78 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %79 = icmp eq i32 %78, %74
  br i1 %79, label %80, label %86

80:                                               ; preds = %77
  %81 = add nsw i32 %74, %45
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !7
  %85 = add nsw i32 %84, 1
  store i32 %85, i32 addrspace(1)* %83, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %80, %77, %73
  %87 = or i32 %47, 3
  %88 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %89 = icmp eq i32 %88, %44
  br i1 %89, label %90, label %99

90:                                               ; preds = %86
  %91 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %92 = icmp eq i32 %91, %87
  br i1 %92, label %93, label %99

93:                                               ; preds = %90
  %94 = add nsw i32 %87, %45
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %98 = add nsw i32 %97, 1
  store i32 %98, i32 addrspace(1)* %96, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %93, %90, %86
  %100 = add nuw i32 %47, 4
  %101 = add i32 %48, 4
  %102 = icmp eq i32 %101, %41
  br i1 %102, label %103, label %46, !llvm.loop !11

103:                                              ; preds = %99, %43
  %104 = phi i32 [ 0, %43 ], [ %100, %99 ]
  br i1 %42, label %123, label %105

105:                                              ; preds = %103, %119
  %106 = phi i32 [ %120, %119 ], [ %104, %103 ]
  %107 = phi i32 [ %121, %119 ], [ 0, %103 ]
  %108 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %109 = icmp eq i32 %108, %44
  br i1 %109, label %110, label %119

110:                                              ; preds = %105
  %111 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %112 = icmp eq i32 %111, %106
  br i1 %112, label %113, label %119

113:                                              ; preds = %110
  %114 = add nsw i32 %106, %45
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !7
  %118 = add nsw i32 %117, 1
  store i32 %118, i32 addrspace(1)* %116, align 4, !tbaa !7
  br label %119

119:                                              ; preds = %113, %110, %105
  %120 = add nuw i32 %106, 1
  %121 = add i32 %107, 1
  %122 = icmp eq i32 %121, %39
  br i1 %122, label %123, label %105, !llvm.loop !13

123:                                              ; preds = %119, %103
  %124 = add nuw i32 %44, 1
  %125 = icmp eq i32 %44, %5
  br i1 %125, label %126, label %43, !llvm.loop !15

126:                                              ; preds = %123, %30
  %127 = phi i32 [ %31, %30 ], [ %38, %123 ]
  %128 = mul nsw i32 %127, %127
  %129 = icmp ult i32 %25, %128
  %130 = icmp ne i32 %127, 0
  %131 = and i1 %129, %130
  br i1 %131, label %132, label %199

132:                                              ; preds = %126
  %133 = and i32 %128, 7
  %134 = icmp ult i32 %128, 8
  br i1 %134, label %183, label %135

135:                                              ; preds = %132
  %136 = and i32 %128, 2147483640
  br label %137

137:                                              ; preds = %137, %135
  %138 = phi i32 [ 0, %135 ], [ %180, %137 ]
  %139 = phi i32 [ 0, %135 ], [ %179, %137 ]
  %140 = phi i32 [ 0, %135 ], [ %181, %137 ]
  %141 = zext i32 %138 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !7
  %144 = add nsw i32 %143, %139
  %145 = or i32 %138, 1
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7
  %149 = add nsw i32 %148, %144
  %150 = or i32 %138, 2
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %151
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !7
  %154 = add nsw i32 %153, %149
  %155 = or i32 %138, 3
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %156
  %158 = load i32, i32 addrspace(1)* %157, align 4, !tbaa !7
  %159 = add nsw i32 %158, %154
  %160 = or i32 %138, 4
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %161
  %163 = load i32, i32 addrspace(1)* %162, align 4, !tbaa !7
  %164 = add nsw i32 %163, %159
  %165 = or i32 %138, 5
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %166
  %168 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !7
  %169 = add nsw i32 %168, %164
  %170 = or i32 %138, 6
  %171 = zext i32 %170 to i64
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %171
  %173 = load i32, i32 addrspace(1)* %172, align 4, !tbaa !7
  %174 = add nsw i32 %173, %169
  %175 = or i32 %138, 7
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %176
  %178 = load i32, i32 addrspace(1)* %177, align 4, !tbaa !7
  %179 = add nsw i32 %178, %174
  %180 = add nuw nsw i32 %138, 8
  %181 = add i32 %140, 8
  %182 = icmp eq i32 %181, %136
  br i1 %182, label %183, label %137, !llvm.loop !16

183:                                              ; preds = %137, %132
  %184 = phi i32 [ undef, %132 ], [ %179, %137 ]
  %185 = phi i32 [ 0, %132 ], [ %180, %137 ]
  %186 = phi i32 [ 0, %132 ], [ %179, %137 ]
  %187 = icmp eq i32 %133, 0
  br i1 %187, label %199, label %188

188:                                              ; preds = %183, %188
  %189 = phi i32 [ %196, %188 ], [ %185, %183 ]
  %190 = phi i32 [ %195, %188 ], [ %186, %183 ]
  %191 = phi i32 [ %197, %188 ], [ 0, %183 ]
  %192 = zext i32 %189 to i64
  %193 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %192
  %194 = load i32, i32 addrspace(1)* %193, align 4, !tbaa !7
  %195 = add nsw i32 %194, %190
  %196 = add nuw nsw i32 %189, 1
  %197 = add i32 %191, 1
  %198 = icmp eq i32 %197, %133
  br i1 %198, label %199, label %188, !llvm.loop !17

199:                                              ; preds = %183, %188, %126
  %200 = phi i32 [ 0, %126 ], [ %184, %183 ], [ %195, %188 ]
  br i1 %129, label %201, label %209

201:                                              ; preds = %199
  %202 = zext i32 %25 to i64
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %202
  %204 = load i32, i32 addrspace(1)* %203, align 4, !tbaa !7
  %205 = sitofp i32 %204 to float
  %206 = sitofp i32 %200 to float
  %207 = fdiv contract float %205, %206
  %208 = getelementptr inbounds float, float addrspace(1)* %2, i64 %202
  store float %207, float addrspace(1)* %208, align 4, !tbaa !18
  br label %209

209:                                              ; preds = %201, %199
  %210 = icmp slt i32 %15, 1
  %211 = select i1 %210, i1 %130, i1 false
  br i1 %211, label %212, label %280

212:                                              ; preds = %209
  %213 = tail call i32 @llvm.umax.i32(i32 %128, i32 1)
  %214 = add nsw i32 %213, -1
  %215 = and i32 %213, 7
  %216 = icmp ult i32 %214, 7
  br i1 %216, label %265, label %217

217:                                              ; preds = %212
  %218 = and i32 %213, 2147483640
  br label %219

219:                                              ; preds = %219, %217
  %220 = phi i32 [ 0, %217 ], [ %262, %219 ]
  %221 = phi float [ undef, %217 ], [ %261, %219 ]
  %222 = phi i32 [ 0, %217 ], [ %263, %219 ]
  %223 = zext i32 %220 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %2, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !18
  %226 = fadd contract float %221, %225
  %227 = or i32 %220, 1
  %228 = zext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %2, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !18
  %231 = fadd contract float %226, %230
  %232 = or i32 %220, 2
  %233 = zext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %2, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !18
  %236 = fadd contract float %231, %235
  %237 = or i32 %220, 3
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %2, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !18
  %241 = fadd contract float %236, %240
  %242 = or i32 %220, 4
  %243 = zext i32 %242 to i64
  %244 = getelementptr inbounds float, float addrspace(1)* %2, i64 %243
  %245 = load float, float addrspace(1)* %244, align 4, !tbaa !18
  %246 = fadd contract float %241, %245
  %247 = or i32 %220, 5
  %248 = zext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %2, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !18
  %251 = fadd contract float %246, %250
  %252 = or i32 %220, 6
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds float, float addrspace(1)* %2, i64 %253
  %255 = load float, float addrspace(1)* %254, align 4, !tbaa !18
  %256 = fadd contract float %251, %255
  %257 = or i32 %220, 7
  %258 = zext i32 %257 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %2, i64 %258
  %260 = load float, float addrspace(1)* %259, align 4, !tbaa !18
  %261 = fadd contract float %256, %260
  %262 = add nuw nsw i32 %220, 8
  %263 = add i32 %222, 8
  %264 = icmp eq i32 %263, %218
  br i1 %264, label %265, label %219, !llvm.loop !20

265:                                              ; preds = %219, %212
  %266 = phi i32 [ 0, %212 ], [ %262, %219 ]
  %267 = phi float [ undef, %212 ], [ %261, %219 ]
  %268 = icmp eq i32 %215, 0
  br i1 %268, label %280, label %269

269:                                              ; preds = %265, %269
  %270 = phi i32 [ %277, %269 ], [ %266, %265 ]
  %271 = phi float [ %276, %269 ], [ %267, %265 ]
  %272 = phi i32 [ %278, %269 ], [ 0, %265 ]
  %273 = zext i32 %270 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %2, i64 %273
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !18
  %276 = fadd contract float %271, %275
  %277 = add nuw nsw i32 %270, 1
  %278 = add i32 %272, 1
  %279 = icmp eq i32 %278, %215
  br i1 %279, label %280, label %269, !llvm.loop !21

280:                                              ; preds = %265, %269, %209
  %281 = phi float [ undef, %209 ], [ %267, %265 ], [ %276, %269 ]
  br i1 %211, label %282, label %351

282:                                              ; preds = %280
  %283 = tail call i32 @llvm.umax.i32(i32 %128, i32 1)
  %284 = add nsw i32 %283, -1
  %285 = and i32 %283, 7
  %286 = icmp ult i32 %284, 7
  br i1 %286, label %335, label %287

287:                                              ; preds = %282
  %288 = and i32 %283, 2147483640
  br label %289

289:                                              ; preds = %289, %287
  %290 = phi i32 [ 0, %287 ], [ %332, %289 ]
  %291 = phi float [ 0.000000e+00, %287 ], [ %331, %289 ]
  %292 = phi i32 [ 0, %287 ], [ %333, %289 ]
  %293 = zext i32 %290 to i64
  %294 = getelementptr inbounds float, float addrspace(1)* %2, i64 %293
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !18
  %296 = fadd contract float %291, %295
  %297 = or i32 %290, 1
  %298 = zext i32 %297 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %2, i64 %298
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !18
  %301 = fadd contract float %296, %300
  %302 = or i32 %290, 2
  %303 = zext i32 %302 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %2, i64 %303
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !18
  %306 = fadd contract float %301, %305
  %307 = or i32 %290, 3
  %308 = zext i32 %307 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %2, i64 %308
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !18
  %311 = fadd contract float %306, %310
  %312 = or i32 %290, 4
  %313 = zext i32 %312 to i64
  %314 = getelementptr inbounds float, float addrspace(1)* %2, i64 %313
  %315 = load float, float addrspace(1)* %314, align 4, !tbaa !18
  %316 = fadd contract float %311, %315
  %317 = or i32 %290, 5
  %318 = zext i32 %317 to i64
  %319 = getelementptr inbounds float, float addrspace(1)* %2, i64 %318
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !18
  %321 = fadd contract float %316, %320
  %322 = or i32 %290, 6
  %323 = zext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %2, i64 %323
  %325 = load float, float addrspace(1)* %324, align 4, !tbaa !18
  %326 = fadd contract float %321, %325
  %327 = or i32 %290, 7
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, float addrspace(1)* %2, i64 %328
  %330 = load float, float addrspace(1)* %329, align 4, !tbaa !18
  %331 = fadd contract float %326, %330
  %332 = add nuw nsw i32 %290, 8
  %333 = add i32 %292, 8
  %334 = icmp eq i32 %333, %288
  br i1 %334, label %335, label %289, !llvm.loop !22

335:                                              ; preds = %289, %282
  %336 = phi float [ undef, %282 ], [ %331, %289 ]
  %337 = phi i32 [ 0, %282 ], [ %332, %289 ]
  %338 = phi float [ 0.000000e+00, %282 ], [ %331, %289 ]
  %339 = icmp eq i32 %285, 0
  br i1 %339, label %351, label %340

340:                                              ; preds = %335, %340
  %341 = phi i32 [ %348, %340 ], [ %337, %335 ]
  %342 = phi float [ %347, %340 ], [ %338, %335 ]
  %343 = phi i32 [ %349, %340 ], [ 0, %335 ]
  %344 = zext i32 %341 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %2, i64 %344
  %346 = load float, float addrspace(1)* %345, align 4, !tbaa !18
  %347 = fadd contract float %342, %346
  %348 = add nuw nsw i32 %341, 1
  %349 = add i32 %343, 1
  %350 = icmp eq i32 %349, %285
  br i1 %350, label %351, label %340, !llvm.loop !23

351:                                              ; preds = %335, %340, %280
  %352 = phi float [ 0.000000e+00, %280 ], [ %336, %335 ], [ %347, %340 ]
  br i1 %211, label %353, label %426

353:                                              ; preds = %351
  %354 = tail call i32 @llvm.umax.i32(i32 %128, i32 1)
  %355 = add nsw i32 %354, -1
  %356 = and i32 %354, 7
  %357 = icmp ult i32 %355, 7
  br i1 %357, label %406, label %358

358:                                              ; preds = %353
  %359 = and i32 %354, 2147483640
  br label %360

360:                                              ; preds = %360, %358
  %361 = phi i32 [ 0, %358 ], [ %403, %360 ]
  %362 = phi float [ 0.000000e+00, %358 ], [ %402, %360 ]
  %363 = phi i32 [ 0, %358 ], [ %404, %360 ]
  %364 = mul nsw i32 %361, %361
  %365 = sitofp i32 %364 to float
  %366 = fmul contract float %281, %365
  %367 = fadd contract float %362, %366
  %368 = or i32 %361, 1
  %369 = mul nsw i32 %368, %368
  %370 = sitofp i32 %369 to float
  %371 = fmul contract float %281, %370
  %372 = fadd contract float %367, %371
  %373 = or i32 %361, 2
  %374 = mul nsw i32 %373, %373
  %375 = sitofp i32 %374 to float
  %376 = fmul contract float %281, %375
  %377 = fadd contract float %372, %376
  %378 = or i32 %361, 3
  %379 = mul nsw i32 %378, %378
  %380 = sitofp i32 %379 to float
  %381 = fmul contract float %281, %380
  %382 = fadd contract float %377, %381
  %383 = or i32 %361, 4
  %384 = mul nsw i32 %383, %383
  %385 = sitofp i32 %384 to float
  %386 = fmul contract float %281, %385
  %387 = fadd contract float %382, %386
  %388 = or i32 %361, 5
  %389 = mul nsw i32 %388, %388
  %390 = sitofp i32 %389 to float
  %391 = fmul contract float %281, %390
  %392 = fadd contract float %387, %391
  %393 = or i32 %361, 6
  %394 = mul nsw i32 %393, %393
  %395 = sitofp i32 %394 to float
  %396 = fmul contract float %281, %395
  %397 = fadd contract float %392, %396
  %398 = or i32 %361, 7
  %399 = mul nsw i32 %398, %398
  %400 = sitofp i32 %399 to float
  %401 = fmul contract float %281, %400
  %402 = fadd contract float %397, %401
  %403 = add nuw nsw i32 %361, 8
  %404 = add i32 %363, 8
  %405 = icmp eq i32 %404, %359
  br i1 %405, label %406, label %360, !llvm.loop !24

406:                                              ; preds = %360, %353
  %407 = phi float [ undef, %353 ], [ %402, %360 ]
  %408 = phi i32 [ 0, %353 ], [ %403, %360 ]
  %409 = phi float [ 0.000000e+00, %353 ], [ %402, %360 ]
  %410 = icmp eq i32 %356, 0
  br i1 %410, label %422, label %411

411:                                              ; preds = %406, %411
  %412 = phi i32 [ %419, %411 ], [ %408, %406 ]
  %413 = phi float [ %418, %411 ], [ %409, %406 ]
  %414 = phi i32 [ %420, %411 ], [ 0, %406 ]
  %415 = mul nsw i32 %412, %412
  %416 = sitofp i32 %415 to float
  %417 = fmul contract float %281, %416
  %418 = fadd contract float %413, %417
  %419 = add nuw nsw i32 %412, 1
  %420 = add i32 %414, 1
  %421 = icmp eq i32 %420, %356
  br i1 %421, label %422, label %411, !llvm.loop !25

422:                                              ; preds = %411, %406
  %423 = phi float [ %407, %406 ], [ %418, %411 ]
  %424 = fpext float %423 to double
  %425 = bitcast double %424 to i64
  br label %426

426:                                              ; preds = %422, %351
  %427 = phi i64 [ 0, %351 ], [ %425, %422 ]
  %428 = fcmp olt float %352, 0x39F0000000000000
  %429 = select i1 %428, float 0x41F0000000000000, float 1.000000e+00
  %430 = fmul float %352, %429
  %431 = tail call float @llvm.sqrt.f32(float %430)
  %432 = bitcast float %431 to i32
  %433 = add nsw i32 %432, -1
  %434 = bitcast i32 %433 to float
  %435 = add nsw i32 %432, 1
  %436 = bitcast i32 %435 to float
  %437 = tail call i1 @llvm.amdgcn.class.f32(float %430, i32 608)
  %438 = select i1 %428, float 0x3EF0000000000000, float 1.000000e+00
  %439 = fneg float %436
  %440 = tail call float @llvm.fma.f32(float %439, float %431, float %430)
  %441 = fcmp ogt float %440, 0.000000e+00
  %442 = fneg float %434
  %443 = tail call float @llvm.fma.f32(float %442, float %431, float %430)
  %444 = fcmp ole float %443, 0.000000e+00
  %445 = select i1 %444, float %434, float %431
  %446 = select i1 %441, float %436, float %445
  %447 = fmul float %438, %446
  %448 = select i1 %437, float %430, float %447
  br i1 %211, label %449, label %571

449:                                              ; preds = %426
  %450 = tail call i32 @llvm.umax.i32(i32 %128, i32 1)
  %451 = add nsw i32 %450, -1
  %452 = and i32 %450, 3
  %453 = icmp ult i32 %451, 3
  br i1 %453, label %538, label %454

454:                                              ; preds = %449
  %455 = and i32 %450, 2147483644
  br label %456

456:                                              ; preds = %456, %454
  %457 = phi float [ undef, %454 ], [ %534, %456 ]
  %458 = phi i32 [ 0, %454 ], [ %535, %456 ]
  %459 = phi i32 [ 0, %454 ], [ %536, %456 ]
  %460 = zext i32 %458 to i64
  %461 = getelementptr inbounds float, float addrspace(1)* %2, i64 %460
  %462 = load float, float addrspace(1)* %461, align 4, !tbaa !18
  %463 = tail call i1 @llvm.amdgcn.class.f32(float %462, i32 144)
  %464 = select i1 %463, float 0x41F0000000000000, float 1.000000e+00
  %465 = fmul float %462, %464
  %466 = tail call float @llvm.log2.f32(float %465)
  %467 = fmul float %466, 0x3FD3441340000000
  %468 = tail call i1 @llvm.amdgcn.class.f32(float %466, i32 519)
  %469 = fneg float %467
  %470 = tail call float @llvm.fma.f32(float %466, float 0x3FD3441340000000, float %469)
  %471 = tail call float @llvm.fma.f32(float %466, float 0x3E509F79E0000000, float %470)
  %472 = fadd float %467, %471
  %473 = select i1 %468, float %466, float %472
  %474 = select i1 %463, float 0x4023441360000000, float 0.000000e+00
  %475 = fsub float %473, %474
  %476 = fmul contract float %462, %475
  %477 = fadd contract float %457, %476
  %478 = or i32 %458, 1
  %479 = zext i32 %478 to i64
  %480 = getelementptr inbounds float, float addrspace(1)* %2, i64 %479
  %481 = load float, float addrspace(1)* %480, align 4, !tbaa !18
  %482 = tail call i1 @llvm.amdgcn.class.f32(float %481, i32 144)
  %483 = select i1 %482, float 0x41F0000000000000, float 1.000000e+00
  %484 = fmul float %481, %483
  %485 = tail call float @llvm.log2.f32(float %484)
  %486 = fmul float %485, 0x3FD3441340000000
  %487 = tail call i1 @llvm.amdgcn.class.f32(float %485, i32 519)
  %488 = fneg float %486
  %489 = tail call float @llvm.fma.f32(float %485, float 0x3FD3441340000000, float %488)
  %490 = tail call float @llvm.fma.f32(float %485, float 0x3E509F79E0000000, float %489)
  %491 = fadd float %486, %490
  %492 = select i1 %487, float %485, float %491
  %493 = select i1 %482, float 0x4023441360000000, float 0.000000e+00
  %494 = fsub float %492, %493
  %495 = fmul contract float %481, %494
  %496 = fadd contract float %477, %495
  %497 = or i32 %458, 2
  %498 = zext i32 %497 to i64
  %499 = getelementptr inbounds float, float addrspace(1)* %2, i64 %498
  %500 = load float, float addrspace(1)* %499, align 4, !tbaa !18
  %501 = tail call i1 @llvm.amdgcn.class.f32(float %500, i32 144)
  %502 = select i1 %501, float 0x41F0000000000000, float 1.000000e+00
  %503 = fmul float %500, %502
  %504 = tail call float @llvm.log2.f32(float %503)
  %505 = fmul float %504, 0x3FD3441340000000
  %506 = tail call i1 @llvm.amdgcn.class.f32(float %504, i32 519)
  %507 = fneg float %505
  %508 = tail call float @llvm.fma.f32(float %504, float 0x3FD3441340000000, float %507)
  %509 = tail call float @llvm.fma.f32(float %504, float 0x3E509F79E0000000, float %508)
  %510 = fadd float %505, %509
  %511 = select i1 %506, float %504, float %510
  %512 = select i1 %501, float 0x4023441360000000, float 0.000000e+00
  %513 = fsub float %511, %512
  %514 = fmul contract float %500, %513
  %515 = fadd contract float %496, %514
  %516 = or i32 %458, 3
  %517 = zext i32 %516 to i64
  %518 = getelementptr inbounds float, float addrspace(1)* %2, i64 %517
  %519 = load float, float addrspace(1)* %518, align 4, !tbaa !18
  %520 = tail call i1 @llvm.amdgcn.class.f32(float %519, i32 144)
  %521 = select i1 %520, float 0x41F0000000000000, float 1.000000e+00
  %522 = fmul float %519, %521
  %523 = tail call float @llvm.log2.f32(float %522)
  %524 = fmul float %523, 0x3FD3441340000000
  %525 = tail call i1 @llvm.amdgcn.class.f32(float %523, i32 519)
  %526 = fneg float %524
  %527 = tail call float @llvm.fma.f32(float %523, float 0x3FD3441340000000, float %526)
  %528 = tail call float @llvm.fma.f32(float %523, float 0x3E509F79E0000000, float %527)
  %529 = fadd float %524, %528
  %530 = select i1 %525, float %523, float %529
  %531 = select i1 %520, float 0x4023441360000000, float 0.000000e+00
  %532 = fsub float %530, %531
  %533 = fmul contract float %519, %532
  %534 = fadd contract float %515, %533
  %535 = add nuw nsw i32 %458, 4
  %536 = add i32 %459, 4
  %537 = icmp eq i32 %536, %455
  br i1 %537, label %538, label %456, !llvm.loop !26

538:                                              ; preds = %456, %449
  %539 = phi float [ undef, %449 ], [ %534, %456 ]
  %540 = phi i32 [ 0, %449 ], [ %535, %456 ]
  %541 = icmp eq i32 %452, 0
  br i1 %541, label %567, label %542

542:                                              ; preds = %538, %542
  %543 = phi float [ %563, %542 ], [ %539, %538 ]
  %544 = phi i32 [ %564, %542 ], [ %540, %538 ]
  %545 = phi i32 [ %565, %542 ], [ 0, %538 ]
  %546 = zext i32 %544 to i64
  %547 = getelementptr inbounds float, float addrspace(1)* %2, i64 %546
  %548 = load float, float addrspace(1)* %547, align 4, !tbaa !18
  %549 = tail call i1 @llvm.amdgcn.class.f32(float %548, i32 144)
  %550 = select i1 %549, float 0x41F0000000000000, float 1.000000e+00
  %551 = fmul float %548, %550
  %552 = tail call float @llvm.log2.f32(float %551)
  %553 = fmul float %552, 0x3FD3441340000000
  %554 = tail call i1 @llvm.amdgcn.class.f32(float %552, i32 519)
  %555 = fneg float %553
  %556 = tail call float @llvm.fma.f32(float %552, float 0x3FD3441340000000, float %555)
  %557 = tail call float @llvm.fma.f32(float %552, float 0x3E509F79E0000000, float %556)
  %558 = fadd float %553, %557
  %559 = select i1 %554, float %552, float %558
  %560 = select i1 %549, float 0x4023441360000000, float 0.000000e+00
  %561 = fsub float %559, %560
  %562 = fmul contract float %548, %561
  %563 = fadd contract float %543, %562
  %564 = add nuw nsw i32 %544, 1
  %565 = add i32 %545, 1
  %566 = icmp eq i32 %565, %452
  br i1 %566, label %567, label %542, !llvm.loop !27

567:                                              ; preds = %542, %538
  %568 = phi float [ %539, %538 ], [ %563, %542 ]
  %569 = fpext float %568 to double
  %570 = bitcast double %569 to i64
  br label %571

571:                                              ; preds = %567, %426
  %572 = phi i64 [ undef, %426 ], [ %570, %567 ]
  br i1 %210, label %573, label %2396

573:                                              ; preds = %571
  %574 = fpext float %352 to double
  %575 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %575, i64 24
  %577 = bitcast i8 addrspace(4)* %576 to i64 addrspace(4)*
  %578 = load i64, i64 addrspace(4)* %577, align 8, !tbaa !28
  %579 = inttoptr i64 %578 to i8 addrspace(1)*
  %580 = addrspacecast i8 addrspace(1)* %579 to i8*
  %581 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %582 = extractelement <2 x i64> %581, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %583, label %587

583:                                              ; preds = %573
  %584 = and i64 %582, -225
  %585 = or i64 %584, 32
  %586 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %585, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1028

587:                                              ; preds = %573
  %588 = and i64 %582, 2
  %589 = and i64 %582, -3
  %590 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %589, i64 0
  br label %591

591:                                              ; preds = %1017, %587
  %592 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str, i64 0, i64 11) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([12 x i8]* addrspacecast ([12 x i8] addrspace(4)* @.str to [12 x i8]*) to i64)), i64 1))), %587 ], [ %1025, %1017 ]
  %593 = phi i8 addrspace(4)* [ getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str, i64 0, i64 0), %587 ], [ %1026, %1017 ]
  %594 = phi <2 x i64> [ %590, %587 ], [ %1024, %1017 ]
  %595 = icmp ugt i64 %592, 56
  %596 = extractelement <2 x i64> %594, i64 0
  %597 = or i64 %596, %588
  %598 = insertelement <2 x i64> poison, i64 %597, i64 0
  %599 = select i1 %595, <2 x i64> %594, <2 x i64> %598
  %600 = tail call i64 @llvm.umin.i64(i64 %592, i64 56)
  %601 = trunc i64 %600 to i32
  %602 = extractelement <2 x i64> %599, i64 0
  %603 = icmp ugt i32 %601, 7
  br i1 %603, label %606, label %604

604:                                              ; preds = %591
  %605 = icmp eq i32 %601, 0
  br i1 %605, label %659, label %646

606:                                              ; preds = %591
  %607 = load i8, i8 addrspace(4)* %593, align 1, !tbaa !32
  %608 = zext i8 %607 to i64
  %609 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 1
  %610 = load i8, i8 addrspace(4)* %609, align 1, !tbaa !32
  %611 = zext i8 %610 to i64
  %612 = shl nuw nsw i64 %611, 8
  %613 = or i64 %612, %608
  %614 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 2
  %615 = load i8, i8 addrspace(4)* %614, align 1, !tbaa !32
  %616 = zext i8 %615 to i64
  %617 = shl nuw nsw i64 %616, 16
  %618 = or i64 %613, %617
  %619 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 3
  %620 = load i8, i8 addrspace(4)* %619, align 1, !tbaa !32
  %621 = zext i8 %620 to i64
  %622 = shl nuw nsw i64 %621, 24
  %623 = or i64 %618, %622
  %624 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 4
  %625 = load i8, i8 addrspace(4)* %624, align 1, !tbaa !32
  %626 = zext i8 %625 to i64
  %627 = shl nuw nsw i64 %626, 32
  %628 = or i64 %623, %627
  %629 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 5
  %630 = load i8, i8 addrspace(4)* %629, align 1, !tbaa !32
  %631 = zext i8 %630 to i64
  %632 = shl nuw nsw i64 %631, 40
  %633 = or i64 %628, %632
  %634 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 6
  %635 = load i8, i8 addrspace(4)* %634, align 1, !tbaa !32
  %636 = zext i8 %635 to i64
  %637 = shl nuw nsw i64 %636, 48
  %638 = or i64 %633, %637
  %639 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 7
  %640 = load i8, i8 addrspace(4)* %639, align 1, !tbaa !32
  %641 = zext i8 %640 to i64
  %642 = shl nuw i64 %641, 56
  %643 = or i64 %638, %642
  %644 = add nsw i32 %601, -8
  %645 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 8
  br label %659

646:                                              ; preds = %604, %646
  %647 = phi i32 [ %657, %646 ], [ 0, %604 ]
  %648 = phi i64 [ %656, %646 ], [ 0, %604 ]
  %649 = zext i32 %647 to i64
  %650 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 %649
  %651 = load i8, i8 addrspace(4)* %650, align 1, !tbaa !32
  %652 = zext i8 %651 to i64
  %653 = shl i32 %647, 3
  %654 = zext i32 %653 to i64
  %655 = shl nuw i64 %652, %654
  %656 = or i64 %655, %648
  %657 = add nuw nsw i32 %647, 1
  %658 = icmp eq i32 %657, %601
  br i1 %658, label %659, label %646, !llvm.loop !33

659:                                              ; preds = %646, %606, %604
  %660 = phi i8 addrspace(4)* [ %645, %606 ], [ %593, %604 ], [ %593, %646 ]
  %661 = phi i32 [ %644, %606 ], [ 0, %604 ], [ 0, %646 ]
  %662 = phi i64 [ %643, %606 ], [ 0, %604 ], [ %656, %646 ]
  %663 = icmp ugt i32 %661, 7
  br i1 %663, label %666, label %664

664:                                              ; preds = %659
  %665 = icmp eq i32 %661, 0
  br i1 %665, label %719, label %706

666:                                              ; preds = %659
  %667 = load i8, i8 addrspace(4)* %660, align 1, !tbaa !32
  %668 = zext i8 %667 to i64
  %669 = getelementptr inbounds i8, i8 addrspace(4)* %660, i64 1
  %670 = load i8, i8 addrspace(4)* %669, align 1, !tbaa !32
  %671 = zext i8 %670 to i64
  %672 = shl nuw nsw i64 %671, 8
  %673 = or i64 %672, %668
  %674 = getelementptr inbounds i8, i8 addrspace(4)* %660, i64 2
  %675 = load i8, i8 addrspace(4)* %674, align 1, !tbaa !32
  %676 = zext i8 %675 to i64
  %677 = shl nuw nsw i64 %676, 16
  %678 = or i64 %673, %677
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %660, i64 3
  %680 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !32
  %681 = zext i8 %680 to i64
  %682 = shl nuw nsw i64 %681, 24
  %683 = or i64 %678, %682
  %684 = getelementptr inbounds i8, i8 addrspace(4)* %660, i64 4
  %685 = load i8, i8 addrspace(4)* %684, align 1, !tbaa !32
  %686 = zext i8 %685 to i64
  %687 = shl nuw nsw i64 %686, 32
  %688 = or i64 %683, %687
  %689 = getelementptr inbounds i8, i8 addrspace(4)* %660, i64 5
  %690 = load i8, i8 addrspace(4)* %689, align 1, !tbaa !32
  %691 = zext i8 %690 to i64
  %692 = shl nuw nsw i64 %691, 40
  %693 = or i64 %688, %692
  %694 = getelementptr inbounds i8, i8 addrspace(4)* %660, i64 6
  %695 = load i8, i8 addrspace(4)* %694, align 1, !tbaa !32
  %696 = zext i8 %695 to i64
  %697 = shl nuw nsw i64 %696, 48
  %698 = or i64 %693, %697
  %699 = getelementptr inbounds i8, i8 addrspace(4)* %660, i64 7
  %700 = load i8, i8 addrspace(4)* %699, align 1, !tbaa !32
  %701 = zext i8 %700 to i64
  %702 = shl nuw i64 %701, 56
  %703 = or i64 %698, %702
  %704 = add nsw i32 %661, -8
  %705 = getelementptr inbounds i8, i8 addrspace(4)* %660, i64 8
  br label %719

706:                                              ; preds = %664, %706
  %707 = phi i32 [ %717, %706 ], [ 0, %664 ]
  %708 = phi i64 [ %716, %706 ], [ 0, %664 ]
  %709 = zext i32 %707 to i64
  %710 = getelementptr inbounds i8, i8 addrspace(4)* %660, i64 %709
  %711 = load i8, i8 addrspace(4)* %710, align 1, !tbaa !32
  %712 = zext i8 %711 to i64
  %713 = shl i32 %707, 3
  %714 = zext i32 %713 to i64
  %715 = shl nuw i64 %712, %714
  %716 = or i64 %715, %708
  %717 = add nuw nsw i32 %707, 1
  %718 = icmp eq i32 %717, %661
  br i1 %718, label %719, label %706

719:                                              ; preds = %706, %666, %664
  %720 = phi i8 addrspace(4)* [ %705, %666 ], [ %660, %664 ], [ %660, %706 ]
  %721 = phi i32 [ %704, %666 ], [ 0, %664 ], [ 0, %706 ]
  %722 = phi i64 [ %703, %666 ], [ 0, %664 ], [ %716, %706 ]
  %723 = icmp ugt i32 %721, 7
  br i1 %723, label %726, label %724

724:                                              ; preds = %719
  %725 = icmp eq i32 %721, 0
  br i1 %725, label %779, label %766

726:                                              ; preds = %719
  %727 = load i8, i8 addrspace(4)* %720, align 1, !tbaa !32
  %728 = zext i8 %727 to i64
  %729 = getelementptr inbounds i8, i8 addrspace(4)* %720, i64 1
  %730 = load i8, i8 addrspace(4)* %729, align 1, !tbaa !32
  %731 = zext i8 %730 to i64
  %732 = shl nuw nsw i64 %731, 8
  %733 = or i64 %732, %728
  %734 = getelementptr inbounds i8, i8 addrspace(4)* %720, i64 2
  %735 = load i8, i8 addrspace(4)* %734, align 1, !tbaa !32
  %736 = zext i8 %735 to i64
  %737 = shl nuw nsw i64 %736, 16
  %738 = or i64 %733, %737
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %720, i64 3
  %740 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !32
  %741 = zext i8 %740 to i64
  %742 = shl nuw nsw i64 %741, 24
  %743 = or i64 %738, %742
  %744 = getelementptr inbounds i8, i8 addrspace(4)* %720, i64 4
  %745 = load i8, i8 addrspace(4)* %744, align 1, !tbaa !32
  %746 = zext i8 %745 to i64
  %747 = shl nuw nsw i64 %746, 32
  %748 = or i64 %743, %747
  %749 = getelementptr inbounds i8, i8 addrspace(4)* %720, i64 5
  %750 = load i8, i8 addrspace(4)* %749, align 1, !tbaa !32
  %751 = zext i8 %750 to i64
  %752 = shl nuw nsw i64 %751, 40
  %753 = or i64 %748, %752
  %754 = getelementptr inbounds i8, i8 addrspace(4)* %720, i64 6
  %755 = load i8, i8 addrspace(4)* %754, align 1, !tbaa !32
  %756 = zext i8 %755 to i64
  %757 = shl nuw nsw i64 %756, 48
  %758 = or i64 %753, %757
  %759 = getelementptr inbounds i8, i8 addrspace(4)* %720, i64 7
  %760 = load i8, i8 addrspace(4)* %759, align 1, !tbaa !32
  %761 = zext i8 %760 to i64
  %762 = shl nuw i64 %761, 56
  %763 = or i64 %758, %762
  %764 = add nsw i32 %721, -8
  %765 = getelementptr inbounds i8, i8 addrspace(4)* %720, i64 8
  br label %779

766:                                              ; preds = %724, %766
  %767 = phi i32 [ %777, %766 ], [ 0, %724 ]
  %768 = phi i64 [ %776, %766 ], [ 0, %724 ]
  %769 = zext i32 %767 to i64
  %770 = getelementptr inbounds i8, i8 addrspace(4)* %720, i64 %769
  %771 = load i8, i8 addrspace(4)* %770, align 1, !tbaa !32
  %772 = zext i8 %771 to i64
  %773 = shl i32 %767, 3
  %774 = zext i32 %773 to i64
  %775 = shl nuw i64 %772, %774
  %776 = or i64 %775, %768
  %777 = add nuw nsw i32 %767, 1
  %778 = icmp eq i32 %777, %721
  br i1 %778, label %779, label %766

779:                                              ; preds = %766, %726, %724
  %780 = phi i8 addrspace(4)* [ %765, %726 ], [ %720, %724 ], [ %720, %766 ]
  %781 = phi i32 [ %764, %726 ], [ 0, %724 ], [ 0, %766 ]
  %782 = phi i64 [ %763, %726 ], [ 0, %724 ], [ %776, %766 ]
  %783 = icmp ugt i32 %781, 7
  br i1 %783, label %786, label %784

784:                                              ; preds = %779
  %785 = icmp eq i32 %781, 0
  br i1 %785, label %839, label %826

786:                                              ; preds = %779
  %787 = load i8, i8 addrspace(4)* %780, align 1, !tbaa !32
  %788 = zext i8 %787 to i64
  %789 = getelementptr inbounds i8, i8 addrspace(4)* %780, i64 1
  %790 = load i8, i8 addrspace(4)* %789, align 1, !tbaa !32
  %791 = zext i8 %790 to i64
  %792 = shl nuw nsw i64 %791, 8
  %793 = or i64 %792, %788
  %794 = getelementptr inbounds i8, i8 addrspace(4)* %780, i64 2
  %795 = load i8, i8 addrspace(4)* %794, align 1, !tbaa !32
  %796 = zext i8 %795 to i64
  %797 = shl nuw nsw i64 %796, 16
  %798 = or i64 %793, %797
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %780, i64 3
  %800 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !32
  %801 = zext i8 %800 to i64
  %802 = shl nuw nsw i64 %801, 24
  %803 = or i64 %798, %802
  %804 = getelementptr inbounds i8, i8 addrspace(4)* %780, i64 4
  %805 = load i8, i8 addrspace(4)* %804, align 1, !tbaa !32
  %806 = zext i8 %805 to i64
  %807 = shl nuw nsw i64 %806, 32
  %808 = or i64 %803, %807
  %809 = getelementptr inbounds i8, i8 addrspace(4)* %780, i64 5
  %810 = load i8, i8 addrspace(4)* %809, align 1, !tbaa !32
  %811 = zext i8 %810 to i64
  %812 = shl nuw nsw i64 %811, 40
  %813 = or i64 %808, %812
  %814 = getelementptr inbounds i8, i8 addrspace(4)* %780, i64 6
  %815 = load i8, i8 addrspace(4)* %814, align 1, !tbaa !32
  %816 = zext i8 %815 to i64
  %817 = shl nuw nsw i64 %816, 48
  %818 = or i64 %813, %817
  %819 = getelementptr inbounds i8, i8 addrspace(4)* %780, i64 7
  %820 = load i8, i8 addrspace(4)* %819, align 1, !tbaa !32
  %821 = zext i8 %820 to i64
  %822 = shl nuw i64 %821, 56
  %823 = or i64 %818, %822
  %824 = add nsw i32 %781, -8
  %825 = getelementptr inbounds i8, i8 addrspace(4)* %780, i64 8
  br label %839

826:                                              ; preds = %784, %826
  %827 = phi i32 [ %837, %826 ], [ 0, %784 ]
  %828 = phi i64 [ %836, %826 ], [ 0, %784 ]
  %829 = zext i32 %827 to i64
  %830 = getelementptr inbounds i8, i8 addrspace(4)* %780, i64 %829
  %831 = load i8, i8 addrspace(4)* %830, align 1, !tbaa !32
  %832 = zext i8 %831 to i64
  %833 = shl i32 %827, 3
  %834 = zext i32 %833 to i64
  %835 = shl nuw i64 %832, %834
  %836 = or i64 %835, %828
  %837 = add nuw nsw i32 %827, 1
  %838 = icmp eq i32 %837, %781
  br i1 %838, label %839, label %826

839:                                              ; preds = %826, %786, %784
  %840 = phi i8 addrspace(4)* [ %825, %786 ], [ %780, %784 ], [ %780, %826 ]
  %841 = phi i32 [ %824, %786 ], [ 0, %784 ], [ 0, %826 ]
  %842 = phi i64 [ %823, %786 ], [ 0, %784 ], [ %836, %826 ]
  %843 = icmp ugt i32 %841, 7
  br i1 %843, label %846, label %844

844:                                              ; preds = %839
  %845 = icmp eq i32 %841, 0
  br i1 %845, label %899, label %886

846:                                              ; preds = %839
  %847 = load i8, i8 addrspace(4)* %840, align 1, !tbaa !32
  %848 = zext i8 %847 to i64
  %849 = getelementptr inbounds i8, i8 addrspace(4)* %840, i64 1
  %850 = load i8, i8 addrspace(4)* %849, align 1, !tbaa !32
  %851 = zext i8 %850 to i64
  %852 = shl nuw nsw i64 %851, 8
  %853 = or i64 %852, %848
  %854 = getelementptr inbounds i8, i8 addrspace(4)* %840, i64 2
  %855 = load i8, i8 addrspace(4)* %854, align 1, !tbaa !32
  %856 = zext i8 %855 to i64
  %857 = shl nuw nsw i64 %856, 16
  %858 = or i64 %853, %857
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %840, i64 3
  %860 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !32
  %861 = zext i8 %860 to i64
  %862 = shl nuw nsw i64 %861, 24
  %863 = or i64 %858, %862
  %864 = getelementptr inbounds i8, i8 addrspace(4)* %840, i64 4
  %865 = load i8, i8 addrspace(4)* %864, align 1, !tbaa !32
  %866 = zext i8 %865 to i64
  %867 = shl nuw nsw i64 %866, 32
  %868 = or i64 %863, %867
  %869 = getelementptr inbounds i8, i8 addrspace(4)* %840, i64 5
  %870 = load i8, i8 addrspace(4)* %869, align 1, !tbaa !32
  %871 = zext i8 %870 to i64
  %872 = shl nuw nsw i64 %871, 40
  %873 = or i64 %868, %872
  %874 = getelementptr inbounds i8, i8 addrspace(4)* %840, i64 6
  %875 = load i8, i8 addrspace(4)* %874, align 1, !tbaa !32
  %876 = zext i8 %875 to i64
  %877 = shl nuw nsw i64 %876, 48
  %878 = or i64 %873, %877
  %879 = getelementptr inbounds i8, i8 addrspace(4)* %840, i64 7
  %880 = load i8, i8 addrspace(4)* %879, align 1, !tbaa !32
  %881 = zext i8 %880 to i64
  %882 = shl nuw i64 %881, 56
  %883 = or i64 %878, %882
  %884 = add nsw i32 %841, -8
  %885 = getelementptr inbounds i8, i8 addrspace(4)* %840, i64 8
  br label %899

886:                                              ; preds = %844, %886
  %887 = phi i32 [ %897, %886 ], [ 0, %844 ]
  %888 = phi i64 [ %896, %886 ], [ 0, %844 ]
  %889 = zext i32 %887 to i64
  %890 = getelementptr inbounds i8, i8 addrspace(4)* %840, i64 %889
  %891 = load i8, i8 addrspace(4)* %890, align 1, !tbaa !32
  %892 = zext i8 %891 to i64
  %893 = shl i32 %887, 3
  %894 = zext i32 %893 to i64
  %895 = shl nuw i64 %892, %894
  %896 = or i64 %895, %888
  %897 = add nuw nsw i32 %887, 1
  %898 = icmp eq i32 %897, %841
  br i1 %898, label %899, label %886

899:                                              ; preds = %886, %846, %844
  %900 = phi i8 addrspace(4)* [ %885, %846 ], [ %840, %844 ], [ %840, %886 ]
  %901 = phi i32 [ %884, %846 ], [ 0, %844 ], [ 0, %886 ]
  %902 = phi i64 [ %883, %846 ], [ 0, %844 ], [ %896, %886 ]
  %903 = icmp ugt i32 %901, 7
  br i1 %903, label %906, label %904

904:                                              ; preds = %899
  %905 = icmp eq i32 %901, 0
  br i1 %905, label %959, label %946

906:                                              ; preds = %899
  %907 = load i8, i8 addrspace(4)* %900, align 1, !tbaa !32
  %908 = zext i8 %907 to i64
  %909 = getelementptr inbounds i8, i8 addrspace(4)* %900, i64 1
  %910 = load i8, i8 addrspace(4)* %909, align 1, !tbaa !32
  %911 = zext i8 %910 to i64
  %912 = shl nuw nsw i64 %911, 8
  %913 = or i64 %912, %908
  %914 = getelementptr inbounds i8, i8 addrspace(4)* %900, i64 2
  %915 = load i8, i8 addrspace(4)* %914, align 1, !tbaa !32
  %916 = zext i8 %915 to i64
  %917 = shl nuw nsw i64 %916, 16
  %918 = or i64 %913, %917
  %919 = getelementptr inbounds i8, i8 addrspace(4)* %900, i64 3
  %920 = load i8, i8 addrspace(4)* %919, align 1, !tbaa !32
  %921 = zext i8 %920 to i64
  %922 = shl nuw nsw i64 %921, 24
  %923 = or i64 %918, %922
  %924 = getelementptr inbounds i8, i8 addrspace(4)* %900, i64 4
  %925 = load i8, i8 addrspace(4)* %924, align 1, !tbaa !32
  %926 = zext i8 %925 to i64
  %927 = shl nuw nsw i64 %926, 32
  %928 = or i64 %923, %927
  %929 = getelementptr inbounds i8, i8 addrspace(4)* %900, i64 5
  %930 = load i8, i8 addrspace(4)* %929, align 1, !tbaa !32
  %931 = zext i8 %930 to i64
  %932 = shl nuw nsw i64 %931, 40
  %933 = or i64 %928, %932
  %934 = getelementptr inbounds i8, i8 addrspace(4)* %900, i64 6
  %935 = load i8, i8 addrspace(4)* %934, align 1, !tbaa !32
  %936 = zext i8 %935 to i64
  %937 = shl nuw nsw i64 %936, 48
  %938 = or i64 %933, %937
  %939 = getelementptr inbounds i8, i8 addrspace(4)* %900, i64 7
  %940 = load i8, i8 addrspace(4)* %939, align 1, !tbaa !32
  %941 = zext i8 %940 to i64
  %942 = shl nuw i64 %941, 56
  %943 = or i64 %938, %942
  %944 = add nsw i32 %901, -8
  %945 = getelementptr inbounds i8, i8 addrspace(4)* %900, i64 8
  br label %959

946:                                              ; preds = %904, %946
  %947 = phi i32 [ %957, %946 ], [ 0, %904 ]
  %948 = phi i64 [ %956, %946 ], [ 0, %904 ]
  %949 = zext i32 %947 to i64
  %950 = getelementptr inbounds i8, i8 addrspace(4)* %900, i64 %949
  %951 = load i8, i8 addrspace(4)* %950, align 1, !tbaa !32
  %952 = zext i8 %951 to i64
  %953 = shl i32 %947, 3
  %954 = zext i32 %953 to i64
  %955 = shl nuw i64 %952, %954
  %956 = or i64 %955, %948
  %957 = add nuw nsw i32 %947, 1
  %958 = icmp eq i32 %957, %901
  br i1 %958, label %959, label %946

959:                                              ; preds = %946, %906, %904
  %960 = phi i8 addrspace(4)* [ %945, %906 ], [ %900, %904 ], [ %900, %946 ]
  %961 = phi i32 [ %944, %906 ], [ 0, %904 ], [ 0, %946 ]
  %962 = phi i64 [ %943, %906 ], [ 0, %904 ], [ %956, %946 ]
  %963 = icmp ugt i32 %961, 7
  br i1 %963, label %966, label %964

964:                                              ; preds = %959
  %965 = icmp eq i32 %961, 0
  br i1 %965, label %1017, label %1004

966:                                              ; preds = %959
  %967 = load i8, i8 addrspace(4)* %960, align 1, !tbaa !32
  %968 = zext i8 %967 to i64
  %969 = getelementptr inbounds i8, i8 addrspace(4)* %960, i64 1
  %970 = load i8, i8 addrspace(4)* %969, align 1, !tbaa !32
  %971 = zext i8 %970 to i64
  %972 = shl nuw nsw i64 %971, 8
  %973 = or i64 %972, %968
  %974 = getelementptr inbounds i8, i8 addrspace(4)* %960, i64 2
  %975 = load i8, i8 addrspace(4)* %974, align 1, !tbaa !32
  %976 = zext i8 %975 to i64
  %977 = shl nuw nsw i64 %976, 16
  %978 = or i64 %973, %977
  %979 = getelementptr inbounds i8, i8 addrspace(4)* %960, i64 3
  %980 = load i8, i8 addrspace(4)* %979, align 1, !tbaa !32
  %981 = zext i8 %980 to i64
  %982 = shl nuw nsw i64 %981, 24
  %983 = or i64 %978, %982
  %984 = getelementptr inbounds i8, i8 addrspace(4)* %960, i64 4
  %985 = load i8, i8 addrspace(4)* %984, align 1, !tbaa !32
  %986 = zext i8 %985 to i64
  %987 = shl nuw nsw i64 %986, 32
  %988 = or i64 %983, %987
  %989 = getelementptr inbounds i8, i8 addrspace(4)* %960, i64 5
  %990 = load i8, i8 addrspace(4)* %989, align 1, !tbaa !32
  %991 = zext i8 %990 to i64
  %992 = shl nuw nsw i64 %991, 40
  %993 = or i64 %988, %992
  %994 = getelementptr inbounds i8, i8 addrspace(4)* %960, i64 6
  %995 = load i8, i8 addrspace(4)* %994, align 1, !tbaa !32
  %996 = zext i8 %995 to i64
  %997 = shl nuw nsw i64 %996, 48
  %998 = or i64 %993, %997
  %999 = getelementptr inbounds i8, i8 addrspace(4)* %960, i64 7
  %1000 = load i8, i8 addrspace(4)* %999, align 1, !tbaa !32
  %1001 = zext i8 %1000 to i64
  %1002 = shl nuw i64 %1001, 56
  %1003 = or i64 %998, %1002
  br label %1017

1004:                                             ; preds = %964, %1004
  %1005 = phi i32 [ %1015, %1004 ], [ 0, %964 ]
  %1006 = phi i64 [ %1014, %1004 ], [ 0, %964 ]
  %1007 = zext i32 %1005 to i64
  %1008 = getelementptr inbounds i8, i8 addrspace(4)* %960, i64 %1007
  %1009 = load i8, i8 addrspace(4)* %1008, align 1, !tbaa !32
  %1010 = zext i8 %1009 to i64
  %1011 = shl i32 %1005, 3
  %1012 = zext i32 %1011 to i64
  %1013 = shl nuw i64 %1010, %1012
  %1014 = or i64 %1013, %1006
  %1015 = add nuw nsw i32 %1005, 1
  %1016 = icmp eq i32 %1015, %961
  br i1 %1016, label %1017, label %1004

1017:                                             ; preds = %1004, %966, %964
  %1018 = phi i64 [ %1003, %966 ], [ 0, %964 ], [ %1014, %1004 ]
  %1019 = shl nuw nsw i64 %600, 2
  %1020 = add nuw nsw i64 %1019, 28
  %1021 = and i64 %1020, 480
  %1022 = and i64 %602, -225
  %1023 = or i64 %1022, %1021
  %1024 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %1023, i64 noundef %662, i64 noundef %722, i64 noundef %782, i64 noundef %842, i64 noundef %902, i64 noundef %962, i64 noundef %1018) #11
  %1025 = sub i64 %592, %600
  %1026 = getelementptr inbounds i8, i8 addrspace(4)* %593, i64 %600
  %1027 = icmp eq i64 %1025, 0
  br i1 %1027, label %1028, label %591

1028:                                             ; preds = %1017, %583
  %1029 = phi <2 x i64> [ %586, %583 ], [ %1024, %1017 ]
  %1030 = extractelement <2 x i64> %1029, i64 0
  %1031 = bitcast double %574 to i64
  %1032 = and i64 %1030, -227
  %1033 = or i64 %1032, 34
  %1034 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %1033, i64 noundef %1031, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1035 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1036 = extractelement <2 x i64> %1035, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %1037, label %1041

1037:                                             ; preds = %1028
  %1038 = and i64 %1036, -225
  %1039 = or i64 %1038, 32
  %1040 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %1039, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1482

1041:                                             ; preds = %1028
  %1042 = and i64 %1036, 2
  %1043 = and i64 %1036, -3
  %1044 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1043, i64 0
  br label %1045

1045:                                             ; preds = %1471, %1041
  %1046 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 16) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([17 x i8]* addrspacecast ([17 x i8] addrspace(4)* @.str.1 to [17 x i8]*) to i64)), i64 1))), %1041 ], [ %1479, %1471 ]
  %1047 = phi i8 addrspace(4)* [ getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %1041 ], [ %1480, %1471 ]
  %1048 = phi <2 x i64> [ %1044, %1041 ], [ %1478, %1471 ]
  %1049 = icmp ugt i64 %1046, 56
  %1050 = extractelement <2 x i64> %1048, i64 0
  %1051 = or i64 %1050, %1042
  %1052 = insertelement <2 x i64> poison, i64 %1051, i64 0
  %1053 = select i1 %1049, <2 x i64> %1048, <2 x i64> %1052
  %1054 = tail call i64 @llvm.umin.i64(i64 %1046, i64 56)
  %1055 = trunc i64 %1054 to i32
  %1056 = extractelement <2 x i64> %1053, i64 0
  %1057 = icmp ugt i32 %1055, 7
  br i1 %1057, label %1060, label %1058

1058:                                             ; preds = %1045
  %1059 = icmp eq i32 %1055, 0
  br i1 %1059, label %1113, label %1100

1060:                                             ; preds = %1045
  %1061 = load i8, i8 addrspace(4)* %1047, align 1, !tbaa !32
  %1062 = zext i8 %1061 to i64
  %1063 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 1
  %1064 = load i8, i8 addrspace(4)* %1063, align 1, !tbaa !32
  %1065 = zext i8 %1064 to i64
  %1066 = shl nuw nsw i64 %1065, 8
  %1067 = or i64 %1066, %1062
  %1068 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 2
  %1069 = load i8, i8 addrspace(4)* %1068, align 1, !tbaa !32
  %1070 = zext i8 %1069 to i64
  %1071 = shl nuw nsw i64 %1070, 16
  %1072 = or i64 %1067, %1071
  %1073 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 3
  %1074 = load i8, i8 addrspace(4)* %1073, align 1, !tbaa !32
  %1075 = zext i8 %1074 to i64
  %1076 = shl nuw nsw i64 %1075, 24
  %1077 = or i64 %1072, %1076
  %1078 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 4
  %1079 = load i8, i8 addrspace(4)* %1078, align 1, !tbaa !32
  %1080 = zext i8 %1079 to i64
  %1081 = shl nuw nsw i64 %1080, 32
  %1082 = or i64 %1077, %1081
  %1083 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 5
  %1084 = load i8, i8 addrspace(4)* %1083, align 1, !tbaa !32
  %1085 = zext i8 %1084 to i64
  %1086 = shl nuw nsw i64 %1085, 40
  %1087 = or i64 %1082, %1086
  %1088 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 6
  %1089 = load i8, i8 addrspace(4)* %1088, align 1, !tbaa !32
  %1090 = zext i8 %1089 to i64
  %1091 = shl nuw nsw i64 %1090, 48
  %1092 = or i64 %1087, %1091
  %1093 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 7
  %1094 = load i8, i8 addrspace(4)* %1093, align 1, !tbaa !32
  %1095 = zext i8 %1094 to i64
  %1096 = shl nuw i64 %1095, 56
  %1097 = or i64 %1092, %1096
  %1098 = add nsw i32 %1055, -8
  %1099 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 8
  br label %1113

1100:                                             ; preds = %1058, %1100
  %1101 = phi i32 [ %1111, %1100 ], [ 0, %1058 ]
  %1102 = phi i64 [ %1110, %1100 ], [ 0, %1058 ]
  %1103 = zext i32 %1101 to i64
  %1104 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 %1103
  %1105 = load i8, i8 addrspace(4)* %1104, align 1, !tbaa !32
  %1106 = zext i8 %1105 to i64
  %1107 = shl i32 %1101, 3
  %1108 = zext i32 %1107 to i64
  %1109 = shl nuw i64 %1106, %1108
  %1110 = or i64 %1109, %1102
  %1111 = add nuw nsw i32 %1101, 1
  %1112 = icmp eq i32 %1111, %1055
  br i1 %1112, label %1113, label %1100, !llvm.loop !33

1113:                                             ; preds = %1100, %1060, %1058
  %1114 = phi i8 addrspace(4)* [ %1099, %1060 ], [ %1047, %1058 ], [ %1047, %1100 ]
  %1115 = phi i32 [ %1098, %1060 ], [ 0, %1058 ], [ 0, %1100 ]
  %1116 = phi i64 [ %1097, %1060 ], [ 0, %1058 ], [ %1110, %1100 ]
  %1117 = icmp ugt i32 %1115, 7
  br i1 %1117, label %1120, label %1118

1118:                                             ; preds = %1113
  %1119 = icmp eq i32 %1115, 0
  br i1 %1119, label %1173, label %1160

1120:                                             ; preds = %1113
  %1121 = load i8, i8 addrspace(4)* %1114, align 1, !tbaa !32
  %1122 = zext i8 %1121 to i64
  %1123 = getelementptr inbounds i8, i8 addrspace(4)* %1114, i64 1
  %1124 = load i8, i8 addrspace(4)* %1123, align 1, !tbaa !32
  %1125 = zext i8 %1124 to i64
  %1126 = shl nuw nsw i64 %1125, 8
  %1127 = or i64 %1126, %1122
  %1128 = getelementptr inbounds i8, i8 addrspace(4)* %1114, i64 2
  %1129 = load i8, i8 addrspace(4)* %1128, align 1, !tbaa !32
  %1130 = zext i8 %1129 to i64
  %1131 = shl nuw nsw i64 %1130, 16
  %1132 = or i64 %1127, %1131
  %1133 = getelementptr inbounds i8, i8 addrspace(4)* %1114, i64 3
  %1134 = load i8, i8 addrspace(4)* %1133, align 1, !tbaa !32
  %1135 = zext i8 %1134 to i64
  %1136 = shl nuw nsw i64 %1135, 24
  %1137 = or i64 %1132, %1136
  %1138 = getelementptr inbounds i8, i8 addrspace(4)* %1114, i64 4
  %1139 = load i8, i8 addrspace(4)* %1138, align 1, !tbaa !32
  %1140 = zext i8 %1139 to i64
  %1141 = shl nuw nsw i64 %1140, 32
  %1142 = or i64 %1137, %1141
  %1143 = getelementptr inbounds i8, i8 addrspace(4)* %1114, i64 5
  %1144 = load i8, i8 addrspace(4)* %1143, align 1, !tbaa !32
  %1145 = zext i8 %1144 to i64
  %1146 = shl nuw nsw i64 %1145, 40
  %1147 = or i64 %1142, %1146
  %1148 = getelementptr inbounds i8, i8 addrspace(4)* %1114, i64 6
  %1149 = load i8, i8 addrspace(4)* %1148, align 1, !tbaa !32
  %1150 = zext i8 %1149 to i64
  %1151 = shl nuw nsw i64 %1150, 48
  %1152 = or i64 %1147, %1151
  %1153 = getelementptr inbounds i8, i8 addrspace(4)* %1114, i64 7
  %1154 = load i8, i8 addrspace(4)* %1153, align 1, !tbaa !32
  %1155 = zext i8 %1154 to i64
  %1156 = shl nuw i64 %1155, 56
  %1157 = or i64 %1152, %1156
  %1158 = add nsw i32 %1115, -8
  %1159 = getelementptr inbounds i8, i8 addrspace(4)* %1114, i64 8
  br label %1173

1160:                                             ; preds = %1118, %1160
  %1161 = phi i32 [ %1171, %1160 ], [ 0, %1118 ]
  %1162 = phi i64 [ %1170, %1160 ], [ 0, %1118 ]
  %1163 = zext i32 %1161 to i64
  %1164 = getelementptr inbounds i8, i8 addrspace(4)* %1114, i64 %1163
  %1165 = load i8, i8 addrspace(4)* %1164, align 1, !tbaa !32
  %1166 = zext i8 %1165 to i64
  %1167 = shl i32 %1161, 3
  %1168 = zext i32 %1167 to i64
  %1169 = shl nuw i64 %1166, %1168
  %1170 = or i64 %1169, %1162
  %1171 = add nuw nsw i32 %1161, 1
  %1172 = icmp eq i32 %1171, %1115
  br i1 %1172, label %1173, label %1160

1173:                                             ; preds = %1160, %1120, %1118
  %1174 = phi i8 addrspace(4)* [ %1159, %1120 ], [ %1114, %1118 ], [ %1114, %1160 ]
  %1175 = phi i32 [ %1158, %1120 ], [ 0, %1118 ], [ 0, %1160 ]
  %1176 = phi i64 [ %1157, %1120 ], [ 0, %1118 ], [ %1170, %1160 ]
  %1177 = icmp ugt i32 %1175, 7
  br i1 %1177, label %1180, label %1178

1178:                                             ; preds = %1173
  %1179 = icmp eq i32 %1175, 0
  br i1 %1179, label %1233, label %1220

1180:                                             ; preds = %1173
  %1181 = load i8, i8 addrspace(4)* %1174, align 1, !tbaa !32
  %1182 = zext i8 %1181 to i64
  %1183 = getelementptr inbounds i8, i8 addrspace(4)* %1174, i64 1
  %1184 = load i8, i8 addrspace(4)* %1183, align 1, !tbaa !32
  %1185 = zext i8 %1184 to i64
  %1186 = shl nuw nsw i64 %1185, 8
  %1187 = or i64 %1186, %1182
  %1188 = getelementptr inbounds i8, i8 addrspace(4)* %1174, i64 2
  %1189 = load i8, i8 addrspace(4)* %1188, align 1, !tbaa !32
  %1190 = zext i8 %1189 to i64
  %1191 = shl nuw nsw i64 %1190, 16
  %1192 = or i64 %1187, %1191
  %1193 = getelementptr inbounds i8, i8 addrspace(4)* %1174, i64 3
  %1194 = load i8, i8 addrspace(4)* %1193, align 1, !tbaa !32
  %1195 = zext i8 %1194 to i64
  %1196 = shl nuw nsw i64 %1195, 24
  %1197 = or i64 %1192, %1196
  %1198 = getelementptr inbounds i8, i8 addrspace(4)* %1174, i64 4
  %1199 = load i8, i8 addrspace(4)* %1198, align 1, !tbaa !32
  %1200 = zext i8 %1199 to i64
  %1201 = shl nuw nsw i64 %1200, 32
  %1202 = or i64 %1197, %1201
  %1203 = getelementptr inbounds i8, i8 addrspace(4)* %1174, i64 5
  %1204 = load i8, i8 addrspace(4)* %1203, align 1, !tbaa !32
  %1205 = zext i8 %1204 to i64
  %1206 = shl nuw nsw i64 %1205, 40
  %1207 = or i64 %1202, %1206
  %1208 = getelementptr inbounds i8, i8 addrspace(4)* %1174, i64 6
  %1209 = load i8, i8 addrspace(4)* %1208, align 1, !tbaa !32
  %1210 = zext i8 %1209 to i64
  %1211 = shl nuw nsw i64 %1210, 48
  %1212 = or i64 %1207, %1211
  %1213 = getelementptr inbounds i8, i8 addrspace(4)* %1174, i64 7
  %1214 = load i8, i8 addrspace(4)* %1213, align 1, !tbaa !32
  %1215 = zext i8 %1214 to i64
  %1216 = shl nuw i64 %1215, 56
  %1217 = or i64 %1212, %1216
  %1218 = add nsw i32 %1175, -8
  %1219 = getelementptr inbounds i8, i8 addrspace(4)* %1174, i64 8
  br label %1233

1220:                                             ; preds = %1178, %1220
  %1221 = phi i32 [ %1231, %1220 ], [ 0, %1178 ]
  %1222 = phi i64 [ %1230, %1220 ], [ 0, %1178 ]
  %1223 = zext i32 %1221 to i64
  %1224 = getelementptr inbounds i8, i8 addrspace(4)* %1174, i64 %1223
  %1225 = load i8, i8 addrspace(4)* %1224, align 1, !tbaa !32
  %1226 = zext i8 %1225 to i64
  %1227 = shl i32 %1221, 3
  %1228 = zext i32 %1227 to i64
  %1229 = shl nuw i64 %1226, %1228
  %1230 = or i64 %1229, %1222
  %1231 = add nuw nsw i32 %1221, 1
  %1232 = icmp eq i32 %1231, %1175
  br i1 %1232, label %1233, label %1220

1233:                                             ; preds = %1220, %1180, %1178
  %1234 = phi i8 addrspace(4)* [ %1219, %1180 ], [ %1174, %1178 ], [ %1174, %1220 ]
  %1235 = phi i32 [ %1218, %1180 ], [ 0, %1178 ], [ 0, %1220 ]
  %1236 = phi i64 [ %1217, %1180 ], [ 0, %1178 ], [ %1230, %1220 ]
  %1237 = icmp ugt i32 %1235, 7
  br i1 %1237, label %1240, label %1238

1238:                                             ; preds = %1233
  %1239 = icmp eq i32 %1235, 0
  br i1 %1239, label %1293, label %1280

1240:                                             ; preds = %1233
  %1241 = load i8, i8 addrspace(4)* %1234, align 1, !tbaa !32
  %1242 = zext i8 %1241 to i64
  %1243 = getelementptr inbounds i8, i8 addrspace(4)* %1234, i64 1
  %1244 = load i8, i8 addrspace(4)* %1243, align 1, !tbaa !32
  %1245 = zext i8 %1244 to i64
  %1246 = shl nuw nsw i64 %1245, 8
  %1247 = or i64 %1246, %1242
  %1248 = getelementptr inbounds i8, i8 addrspace(4)* %1234, i64 2
  %1249 = load i8, i8 addrspace(4)* %1248, align 1, !tbaa !32
  %1250 = zext i8 %1249 to i64
  %1251 = shl nuw nsw i64 %1250, 16
  %1252 = or i64 %1247, %1251
  %1253 = getelementptr inbounds i8, i8 addrspace(4)* %1234, i64 3
  %1254 = load i8, i8 addrspace(4)* %1253, align 1, !tbaa !32
  %1255 = zext i8 %1254 to i64
  %1256 = shl nuw nsw i64 %1255, 24
  %1257 = or i64 %1252, %1256
  %1258 = getelementptr inbounds i8, i8 addrspace(4)* %1234, i64 4
  %1259 = load i8, i8 addrspace(4)* %1258, align 1, !tbaa !32
  %1260 = zext i8 %1259 to i64
  %1261 = shl nuw nsw i64 %1260, 32
  %1262 = or i64 %1257, %1261
  %1263 = getelementptr inbounds i8, i8 addrspace(4)* %1234, i64 5
  %1264 = load i8, i8 addrspace(4)* %1263, align 1, !tbaa !32
  %1265 = zext i8 %1264 to i64
  %1266 = shl nuw nsw i64 %1265, 40
  %1267 = or i64 %1262, %1266
  %1268 = getelementptr inbounds i8, i8 addrspace(4)* %1234, i64 6
  %1269 = load i8, i8 addrspace(4)* %1268, align 1, !tbaa !32
  %1270 = zext i8 %1269 to i64
  %1271 = shl nuw nsw i64 %1270, 48
  %1272 = or i64 %1267, %1271
  %1273 = getelementptr inbounds i8, i8 addrspace(4)* %1234, i64 7
  %1274 = load i8, i8 addrspace(4)* %1273, align 1, !tbaa !32
  %1275 = zext i8 %1274 to i64
  %1276 = shl nuw i64 %1275, 56
  %1277 = or i64 %1272, %1276
  %1278 = add nsw i32 %1235, -8
  %1279 = getelementptr inbounds i8, i8 addrspace(4)* %1234, i64 8
  br label %1293

1280:                                             ; preds = %1238, %1280
  %1281 = phi i32 [ %1291, %1280 ], [ 0, %1238 ]
  %1282 = phi i64 [ %1290, %1280 ], [ 0, %1238 ]
  %1283 = zext i32 %1281 to i64
  %1284 = getelementptr inbounds i8, i8 addrspace(4)* %1234, i64 %1283
  %1285 = load i8, i8 addrspace(4)* %1284, align 1, !tbaa !32
  %1286 = zext i8 %1285 to i64
  %1287 = shl i32 %1281, 3
  %1288 = zext i32 %1287 to i64
  %1289 = shl nuw i64 %1286, %1288
  %1290 = or i64 %1289, %1282
  %1291 = add nuw nsw i32 %1281, 1
  %1292 = icmp eq i32 %1291, %1235
  br i1 %1292, label %1293, label %1280

1293:                                             ; preds = %1280, %1240, %1238
  %1294 = phi i8 addrspace(4)* [ %1279, %1240 ], [ %1234, %1238 ], [ %1234, %1280 ]
  %1295 = phi i32 [ %1278, %1240 ], [ 0, %1238 ], [ 0, %1280 ]
  %1296 = phi i64 [ %1277, %1240 ], [ 0, %1238 ], [ %1290, %1280 ]
  %1297 = icmp ugt i32 %1295, 7
  br i1 %1297, label %1300, label %1298

1298:                                             ; preds = %1293
  %1299 = icmp eq i32 %1295, 0
  br i1 %1299, label %1353, label %1340

1300:                                             ; preds = %1293
  %1301 = load i8, i8 addrspace(4)* %1294, align 1, !tbaa !32
  %1302 = zext i8 %1301 to i64
  %1303 = getelementptr inbounds i8, i8 addrspace(4)* %1294, i64 1
  %1304 = load i8, i8 addrspace(4)* %1303, align 1, !tbaa !32
  %1305 = zext i8 %1304 to i64
  %1306 = shl nuw nsw i64 %1305, 8
  %1307 = or i64 %1306, %1302
  %1308 = getelementptr inbounds i8, i8 addrspace(4)* %1294, i64 2
  %1309 = load i8, i8 addrspace(4)* %1308, align 1, !tbaa !32
  %1310 = zext i8 %1309 to i64
  %1311 = shl nuw nsw i64 %1310, 16
  %1312 = or i64 %1307, %1311
  %1313 = getelementptr inbounds i8, i8 addrspace(4)* %1294, i64 3
  %1314 = load i8, i8 addrspace(4)* %1313, align 1, !tbaa !32
  %1315 = zext i8 %1314 to i64
  %1316 = shl nuw nsw i64 %1315, 24
  %1317 = or i64 %1312, %1316
  %1318 = getelementptr inbounds i8, i8 addrspace(4)* %1294, i64 4
  %1319 = load i8, i8 addrspace(4)* %1318, align 1, !tbaa !32
  %1320 = zext i8 %1319 to i64
  %1321 = shl nuw nsw i64 %1320, 32
  %1322 = or i64 %1317, %1321
  %1323 = getelementptr inbounds i8, i8 addrspace(4)* %1294, i64 5
  %1324 = load i8, i8 addrspace(4)* %1323, align 1, !tbaa !32
  %1325 = zext i8 %1324 to i64
  %1326 = shl nuw nsw i64 %1325, 40
  %1327 = or i64 %1322, %1326
  %1328 = getelementptr inbounds i8, i8 addrspace(4)* %1294, i64 6
  %1329 = load i8, i8 addrspace(4)* %1328, align 1, !tbaa !32
  %1330 = zext i8 %1329 to i64
  %1331 = shl nuw nsw i64 %1330, 48
  %1332 = or i64 %1327, %1331
  %1333 = getelementptr inbounds i8, i8 addrspace(4)* %1294, i64 7
  %1334 = load i8, i8 addrspace(4)* %1333, align 1, !tbaa !32
  %1335 = zext i8 %1334 to i64
  %1336 = shl nuw i64 %1335, 56
  %1337 = or i64 %1332, %1336
  %1338 = add nsw i32 %1295, -8
  %1339 = getelementptr inbounds i8, i8 addrspace(4)* %1294, i64 8
  br label %1353

1340:                                             ; preds = %1298, %1340
  %1341 = phi i32 [ %1351, %1340 ], [ 0, %1298 ]
  %1342 = phi i64 [ %1350, %1340 ], [ 0, %1298 ]
  %1343 = zext i32 %1341 to i64
  %1344 = getelementptr inbounds i8, i8 addrspace(4)* %1294, i64 %1343
  %1345 = load i8, i8 addrspace(4)* %1344, align 1, !tbaa !32
  %1346 = zext i8 %1345 to i64
  %1347 = shl i32 %1341, 3
  %1348 = zext i32 %1347 to i64
  %1349 = shl nuw i64 %1346, %1348
  %1350 = or i64 %1349, %1342
  %1351 = add nuw nsw i32 %1341, 1
  %1352 = icmp eq i32 %1351, %1295
  br i1 %1352, label %1353, label %1340

1353:                                             ; preds = %1340, %1300, %1298
  %1354 = phi i8 addrspace(4)* [ %1339, %1300 ], [ %1294, %1298 ], [ %1294, %1340 ]
  %1355 = phi i32 [ %1338, %1300 ], [ 0, %1298 ], [ 0, %1340 ]
  %1356 = phi i64 [ %1337, %1300 ], [ 0, %1298 ], [ %1350, %1340 ]
  %1357 = icmp ugt i32 %1355, 7
  br i1 %1357, label %1360, label %1358

1358:                                             ; preds = %1353
  %1359 = icmp eq i32 %1355, 0
  br i1 %1359, label %1413, label %1400

1360:                                             ; preds = %1353
  %1361 = load i8, i8 addrspace(4)* %1354, align 1, !tbaa !32
  %1362 = zext i8 %1361 to i64
  %1363 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 1
  %1364 = load i8, i8 addrspace(4)* %1363, align 1, !tbaa !32
  %1365 = zext i8 %1364 to i64
  %1366 = shl nuw nsw i64 %1365, 8
  %1367 = or i64 %1366, %1362
  %1368 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 2
  %1369 = load i8, i8 addrspace(4)* %1368, align 1, !tbaa !32
  %1370 = zext i8 %1369 to i64
  %1371 = shl nuw nsw i64 %1370, 16
  %1372 = or i64 %1367, %1371
  %1373 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 3
  %1374 = load i8, i8 addrspace(4)* %1373, align 1, !tbaa !32
  %1375 = zext i8 %1374 to i64
  %1376 = shl nuw nsw i64 %1375, 24
  %1377 = or i64 %1372, %1376
  %1378 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 4
  %1379 = load i8, i8 addrspace(4)* %1378, align 1, !tbaa !32
  %1380 = zext i8 %1379 to i64
  %1381 = shl nuw nsw i64 %1380, 32
  %1382 = or i64 %1377, %1381
  %1383 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 5
  %1384 = load i8, i8 addrspace(4)* %1383, align 1, !tbaa !32
  %1385 = zext i8 %1384 to i64
  %1386 = shl nuw nsw i64 %1385, 40
  %1387 = or i64 %1382, %1386
  %1388 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 6
  %1389 = load i8, i8 addrspace(4)* %1388, align 1, !tbaa !32
  %1390 = zext i8 %1389 to i64
  %1391 = shl nuw nsw i64 %1390, 48
  %1392 = or i64 %1387, %1391
  %1393 = getelementptr inbounds i8, i8 addrspace(4)* %1354, i64 7
  %1394 = load i8, i8 addrspace(4)* %1393, align 1, !tbaa !32
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
  %1405 = load i8, i8 addrspace(4)* %1404, align 1, !tbaa !32
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
  br i1 %1419, label %1471, label %1458

1420:                                             ; preds = %1413
  %1421 = load i8, i8 addrspace(4)* %1414, align 1, !tbaa !32
  %1422 = zext i8 %1421 to i64
  %1423 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 1
  %1424 = load i8, i8 addrspace(4)* %1423, align 1, !tbaa !32
  %1425 = zext i8 %1424 to i64
  %1426 = shl nuw nsw i64 %1425, 8
  %1427 = or i64 %1426, %1422
  %1428 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 2
  %1429 = load i8, i8 addrspace(4)* %1428, align 1, !tbaa !32
  %1430 = zext i8 %1429 to i64
  %1431 = shl nuw nsw i64 %1430, 16
  %1432 = or i64 %1427, %1431
  %1433 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 3
  %1434 = load i8, i8 addrspace(4)* %1433, align 1, !tbaa !32
  %1435 = zext i8 %1434 to i64
  %1436 = shl nuw nsw i64 %1435, 24
  %1437 = or i64 %1432, %1436
  %1438 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 4
  %1439 = load i8, i8 addrspace(4)* %1438, align 1, !tbaa !32
  %1440 = zext i8 %1439 to i64
  %1441 = shl nuw nsw i64 %1440, 32
  %1442 = or i64 %1437, %1441
  %1443 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 5
  %1444 = load i8, i8 addrspace(4)* %1443, align 1, !tbaa !32
  %1445 = zext i8 %1444 to i64
  %1446 = shl nuw nsw i64 %1445, 40
  %1447 = or i64 %1442, %1446
  %1448 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 6
  %1449 = load i8, i8 addrspace(4)* %1448, align 1, !tbaa !32
  %1450 = zext i8 %1449 to i64
  %1451 = shl nuw nsw i64 %1450, 48
  %1452 = or i64 %1447, %1451
  %1453 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 7
  %1454 = load i8, i8 addrspace(4)* %1453, align 1, !tbaa !32
  %1455 = zext i8 %1454 to i64
  %1456 = shl nuw i64 %1455, 56
  %1457 = or i64 %1452, %1456
  br label %1471

1458:                                             ; preds = %1418, %1458
  %1459 = phi i32 [ %1469, %1458 ], [ 0, %1418 ]
  %1460 = phi i64 [ %1468, %1458 ], [ 0, %1418 ]
  %1461 = zext i32 %1459 to i64
  %1462 = getelementptr inbounds i8, i8 addrspace(4)* %1414, i64 %1461
  %1463 = load i8, i8 addrspace(4)* %1462, align 1, !tbaa !32
  %1464 = zext i8 %1463 to i64
  %1465 = shl i32 %1459, 3
  %1466 = zext i32 %1465 to i64
  %1467 = shl nuw i64 %1464, %1466
  %1468 = or i64 %1467, %1460
  %1469 = add nuw nsw i32 %1459, 1
  %1470 = icmp eq i32 %1469, %1415
  br i1 %1470, label %1471, label %1458

1471:                                             ; preds = %1458, %1420, %1418
  %1472 = phi i64 [ %1457, %1420 ], [ 0, %1418 ], [ %1468, %1458 ]
  %1473 = shl nuw nsw i64 %1054, 2
  %1474 = add nuw nsw i64 %1473, 28
  %1475 = and i64 %1474, 480
  %1476 = and i64 %1056, -225
  %1477 = or i64 %1476, %1475
  %1478 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %1477, i64 noundef %1116, i64 noundef %1176, i64 noundef %1236, i64 noundef %1296, i64 noundef %1356, i64 noundef %1416, i64 noundef %1472) #11
  %1479 = sub i64 %1046, %1054
  %1480 = getelementptr inbounds i8, i8 addrspace(4)* %1047, i64 %1054
  %1481 = icmp eq i64 %1479, 0
  br i1 %1481, label %1482, label %1045

1482:                                             ; preds = %1471, %1037
  %1483 = phi <2 x i64> [ %1040, %1037 ], [ %1478, %1471 ]
  %1484 = extractelement <2 x i64> %1483, i64 0
  %1485 = and i64 %1484, -227
  %1486 = or i64 %1485, 34
  %1487 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %1486, i64 noundef %427, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1488 = fpext float %448 to double
  %1489 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1490 = extractelement <2 x i64> %1489, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %1491, label %1495

1491:                                             ; preds = %1482
  %1492 = and i64 %1490, -225
  %1493 = or i64 %1492, 32
  %1494 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %1493, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1936

1495:                                             ; preds = %1482
  %1496 = and i64 %1490, 2
  %1497 = and i64 %1490, -3
  %1498 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1497, i64 0
  br label %1499

1499:                                             ; preds = %1925, %1495
  %1500 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.2, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str.2 to [15 x i8]*) to i64)), i64 1))), %1495 ], [ %1933, %1925 ]
  %1501 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %1495 ], [ %1934, %1925 ]
  %1502 = phi <2 x i64> [ %1498, %1495 ], [ %1932, %1925 ]
  %1503 = icmp ugt i64 %1500, 56
  %1504 = extractelement <2 x i64> %1502, i64 0
  %1505 = or i64 %1504, %1496
  %1506 = insertelement <2 x i64> poison, i64 %1505, i64 0
  %1507 = select i1 %1503, <2 x i64> %1502, <2 x i64> %1506
  %1508 = tail call i64 @llvm.umin.i64(i64 %1500, i64 56)
  %1509 = trunc i64 %1508 to i32
  %1510 = extractelement <2 x i64> %1507, i64 0
  %1511 = icmp ugt i32 %1509, 7
  br i1 %1511, label %1514, label %1512

1512:                                             ; preds = %1499
  %1513 = icmp eq i32 %1509, 0
  br i1 %1513, label %1567, label %1554

1514:                                             ; preds = %1499
  %1515 = load i8, i8 addrspace(4)* %1501, align 1, !tbaa !32
  %1516 = zext i8 %1515 to i64
  %1517 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 1
  %1518 = load i8, i8 addrspace(4)* %1517, align 1, !tbaa !32
  %1519 = zext i8 %1518 to i64
  %1520 = shl nuw nsw i64 %1519, 8
  %1521 = or i64 %1520, %1516
  %1522 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 2
  %1523 = load i8, i8 addrspace(4)* %1522, align 1, !tbaa !32
  %1524 = zext i8 %1523 to i64
  %1525 = shl nuw nsw i64 %1524, 16
  %1526 = or i64 %1521, %1525
  %1527 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 3
  %1528 = load i8, i8 addrspace(4)* %1527, align 1, !tbaa !32
  %1529 = zext i8 %1528 to i64
  %1530 = shl nuw nsw i64 %1529, 24
  %1531 = or i64 %1526, %1530
  %1532 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 4
  %1533 = load i8, i8 addrspace(4)* %1532, align 1, !tbaa !32
  %1534 = zext i8 %1533 to i64
  %1535 = shl nuw nsw i64 %1534, 32
  %1536 = or i64 %1531, %1535
  %1537 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 5
  %1538 = load i8, i8 addrspace(4)* %1537, align 1, !tbaa !32
  %1539 = zext i8 %1538 to i64
  %1540 = shl nuw nsw i64 %1539, 40
  %1541 = or i64 %1536, %1540
  %1542 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 6
  %1543 = load i8, i8 addrspace(4)* %1542, align 1, !tbaa !32
  %1544 = zext i8 %1543 to i64
  %1545 = shl nuw nsw i64 %1544, 48
  %1546 = or i64 %1541, %1545
  %1547 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 7
  %1548 = load i8, i8 addrspace(4)* %1547, align 1, !tbaa !32
  %1549 = zext i8 %1548 to i64
  %1550 = shl nuw i64 %1549, 56
  %1551 = or i64 %1546, %1550
  %1552 = add nsw i32 %1509, -8
  %1553 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 8
  br label %1567

1554:                                             ; preds = %1512, %1554
  %1555 = phi i32 [ %1565, %1554 ], [ 0, %1512 ]
  %1556 = phi i64 [ %1564, %1554 ], [ 0, %1512 ]
  %1557 = zext i32 %1555 to i64
  %1558 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 %1557
  %1559 = load i8, i8 addrspace(4)* %1558, align 1, !tbaa !32
  %1560 = zext i8 %1559 to i64
  %1561 = shl i32 %1555, 3
  %1562 = zext i32 %1561 to i64
  %1563 = shl nuw i64 %1560, %1562
  %1564 = or i64 %1563, %1556
  %1565 = add nuw nsw i32 %1555, 1
  %1566 = icmp eq i32 %1565, %1509
  br i1 %1566, label %1567, label %1554, !llvm.loop !33

1567:                                             ; preds = %1554, %1514, %1512
  %1568 = phi i8 addrspace(4)* [ %1553, %1514 ], [ %1501, %1512 ], [ %1501, %1554 ]
  %1569 = phi i32 [ %1552, %1514 ], [ 0, %1512 ], [ 0, %1554 ]
  %1570 = phi i64 [ %1551, %1514 ], [ 0, %1512 ], [ %1564, %1554 ]
  %1571 = icmp ugt i32 %1569, 7
  br i1 %1571, label %1574, label %1572

1572:                                             ; preds = %1567
  %1573 = icmp eq i32 %1569, 0
  br i1 %1573, label %1627, label %1614

1574:                                             ; preds = %1567
  %1575 = load i8, i8 addrspace(4)* %1568, align 1, !tbaa !32
  %1576 = zext i8 %1575 to i64
  %1577 = getelementptr inbounds i8, i8 addrspace(4)* %1568, i64 1
  %1578 = load i8, i8 addrspace(4)* %1577, align 1, !tbaa !32
  %1579 = zext i8 %1578 to i64
  %1580 = shl nuw nsw i64 %1579, 8
  %1581 = or i64 %1580, %1576
  %1582 = getelementptr inbounds i8, i8 addrspace(4)* %1568, i64 2
  %1583 = load i8, i8 addrspace(4)* %1582, align 1, !tbaa !32
  %1584 = zext i8 %1583 to i64
  %1585 = shl nuw nsw i64 %1584, 16
  %1586 = or i64 %1581, %1585
  %1587 = getelementptr inbounds i8, i8 addrspace(4)* %1568, i64 3
  %1588 = load i8, i8 addrspace(4)* %1587, align 1, !tbaa !32
  %1589 = zext i8 %1588 to i64
  %1590 = shl nuw nsw i64 %1589, 24
  %1591 = or i64 %1586, %1590
  %1592 = getelementptr inbounds i8, i8 addrspace(4)* %1568, i64 4
  %1593 = load i8, i8 addrspace(4)* %1592, align 1, !tbaa !32
  %1594 = zext i8 %1593 to i64
  %1595 = shl nuw nsw i64 %1594, 32
  %1596 = or i64 %1591, %1595
  %1597 = getelementptr inbounds i8, i8 addrspace(4)* %1568, i64 5
  %1598 = load i8, i8 addrspace(4)* %1597, align 1, !tbaa !32
  %1599 = zext i8 %1598 to i64
  %1600 = shl nuw nsw i64 %1599, 40
  %1601 = or i64 %1596, %1600
  %1602 = getelementptr inbounds i8, i8 addrspace(4)* %1568, i64 6
  %1603 = load i8, i8 addrspace(4)* %1602, align 1, !tbaa !32
  %1604 = zext i8 %1603 to i64
  %1605 = shl nuw nsw i64 %1604, 48
  %1606 = or i64 %1601, %1605
  %1607 = getelementptr inbounds i8, i8 addrspace(4)* %1568, i64 7
  %1608 = load i8, i8 addrspace(4)* %1607, align 1, !tbaa !32
  %1609 = zext i8 %1608 to i64
  %1610 = shl nuw i64 %1609, 56
  %1611 = or i64 %1606, %1610
  %1612 = add nsw i32 %1569, -8
  %1613 = getelementptr inbounds i8, i8 addrspace(4)* %1568, i64 8
  br label %1627

1614:                                             ; preds = %1572, %1614
  %1615 = phi i32 [ %1625, %1614 ], [ 0, %1572 ]
  %1616 = phi i64 [ %1624, %1614 ], [ 0, %1572 ]
  %1617 = zext i32 %1615 to i64
  %1618 = getelementptr inbounds i8, i8 addrspace(4)* %1568, i64 %1617
  %1619 = load i8, i8 addrspace(4)* %1618, align 1, !tbaa !32
  %1620 = zext i8 %1619 to i64
  %1621 = shl i32 %1615, 3
  %1622 = zext i32 %1621 to i64
  %1623 = shl nuw i64 %1620, %1622
  %1624 = or i64 %1623, %1616
  %1625 = add nuw nsw i32 %1615, 1
  %1626 = icmp eq i32 %1625, %1569
  br i1 %1626, label %1627, label %1614

1627:                                             ; preds = %1614, %1574, %1572
  %1628 = phi i8 addrspace(4)* [ %1613, %1574 ], [ %1568, %1572 ], [ %1568, %1614 ]
  %1629 = phi i32 [ %1612, %1574 ], [ 0, %1572 ], [ 0, %1614 ]
  %1630 = phi i64 [ %1611, %1574 ], [ 0, %1572 ], [ %1624, %1614 ]
  %1631 = icmp ugt i32 %1629, 7
  br i1 %1631, label %1634, label %1632

1632:                                             ; preds = %1627
  %1633 = icmp eq i32 %1629, 0
  br i1 %1633, label %1687, label %1674

1634:                                             ; preds = %1627
  %1635 = load i8, i8 addrspace(4)* %1628, align 1, !tbaa !32
  %1636 = zext i8 %1635 to i64
  %1637 = getelementptr inbounds i8, i8 addrspace(4)* %1628, i64 1
  %1638 = load i8, i8 addrspace(4)* %1637, align 1, !tbaa !32
  %1639 = zext i8 %1638 to i64
  %1640 = shl nuw nsw i64 %1639, 8
  %1641 = or i64 %1640, %1636
  %1642 = getelementptr inbounds i8, i8 addrspace(4)* %1628, i64 2
  %1643 = load i8, i8 addrspace(4)* %1642, align 1, !tbaa !32
  %1644 = zext i8 %1643 to i64
  %1645 = shl nuw nsw i64 %1644, 16
  %1646 = or i64 %1641, %1645
  %1647 = getelementptr inbounds i8, i8 addrspace(4)* %1628, i64 3
  %1648 = load i8, i8 addrspace(4)* %1647, align 1, !tbaa !32
  %1649 = zext i8 %1648 to i64
  %1650 = shl nuw nsw i64 %1649, 24
  %1651 = or i64 %1646, %1650
  %1652 = getelementptr inbounds i8, i8 addrspace(4)* %1628, i64 4
  %1653 = load i8, i8 addrspace(4)* %1652, align 1, !tbaa !32
  %1654 = zext i8 %1653 to i64
  %1655 = shl nuw nsw i64 %1654, 32
  %1656 = or i64 %1651, %1655
  %1657 = getelementptr inbounds i8, i8 addrspace(4)* %1628, i64 5
  %1658 = load i8, i8 addrspace(4)* %1657, align 1, !tbaa !32
  %1659 = zext i8 %1658 to i64
  %1660 = shl nuw nsw i64 %1659, 40
  %1661 = or i64 %1656, %1660
  %1662 = getelementptr inbounds i8, i8 addrspace(4)* %1628, i64 6
  %1663 = load i8, i8 addrspace(4)* %1662, align 1, !tbaa !32
  %1664 = zext i8 %1663 to i64
  %1665 = shl nuw nsw i64 %1664, 48
  %1666 = or i64 %1661, %1665
  %1667 = getelementptr inbounds i8, i8 addrspace(4)* %1628, i64 7
  %1668 = load i8, i8 addrspace(4)* %1667, align 1, !tbaa !32
  %1669 = zext i8 %1668 to i64
  %1670 = shl nuw i64 %1669, 56
  %1671 = or i64 %1666, %1670
  %1672 = add nsw i32 %1629, -8
  %1673 = getelementptr inbounds i8, i8 addrspace(4)* %1628, i64 8
  br label %1687

1674:                                             ; preds = %1632, %1674
  %1675 = phi i32 [ %1685, %1674 ], [ 0, %1632 ]
  %1676 = phi i64 [ %1684, %1674 ], [ 0, %1632 ]
  %1677 = zext i32 %1675 to i64
  %1678 = getelementptr inbounds i8, i8 addrspace(4)* %1628, i64 %1677
  %1679 = load i8, i8 addrspace(4)* %1678, align 1, !tbaa !32
  %1680 = zext i8 %1679 to i64
  %1681 = shl i32 %1675, 3
  %1682 = zext i32 %1681 to i64
  %1683 = shl nuw i64 %1680, %1682
  %1684 = or i64 %1683, %1676
  %1685 = add nuw nsw i32 %1675, 1
  %1686 = icmp eq i32 %1685, %1629
  br i1 %1686, label %1687, label %1674

1687:                                             ; preds = %1674, %1634, %1632
  %1688 = phi i8 addrspace(4)* [ %1673, %1634 ], [ %1628, %1632 ], [ %1628, %1674 ]
  %1689 = phi i32 [ %1672, %1634 ], [ 0, %1632 ], [ 0, %1674 ]
  %1690 = phi i64 [ %1671, %1634 ], [ 0, %1632 ], [ %1684, %1674 ]
  %1691 = icmp ugt i32 %1689, 7
  br i1 %1691, label %1694, label %1692

1692:                                             ; preds = %1687
  %1693 = icmp eq i32 %1689, 0
  br i1 %1693, label %1747, label %1734

1694:                                             ; preds = %1687
  %1695 = load i8, i8 addrspace(4)* %1688, align 1, !tbaa !32
  %1696 = zext i8 %1695 to i64
  %1697 = getelementptr inbounds i8, i8 addrspace(4)* %1688, i64 1
  %1698 = load i8, i8 addrspace(4)* %1697, align 1, !tbaa !32
  %1699 = zext i8 %1698 to i64
  %1700 = shl nuw nsw i64 %1699, 8
  %1701 = or i64 %1700, %1696
  %1702 = getelementptr inbounds i8, i8 addrspace(4)* %1688, i64 2
  %1703 = load i8, i8 addrspace(4)* %1702, align 1, !tbaa !32
  %1704 = zext i8 %1703 to i64
  %1705 = shl nuw nsw i64 %1704, 16
  %1706 = or i64 %1701, %1705
  %1707 = getelementptr inbounds i8, i8 addrspace(4)* %1688, i64 3
  %1708 = load i8, i8 addrspace(4)* %1707, align 1, !tbaa !32
  %1709 = zext i8 %1708 to i64
  %1710 = shl nuw nsw i64 %1709, 24
  %1711 = or i64 %1706, %1710
  %1712 = getelementptr inbounds i8, i8 addrspace(4)* %1688, i64 4
  %1713 = load i8, i8 addrspace(4)* %1712, align 1, !tbaa !32
  %1714 = zext i8 %1713 to i64
  %1715 = shl nuw nsw i64 %1714, 32
  %1716 = or i64 %1711, %1715
  %1717 = getelementptr inbounds i8, i8 addrspace(4)* %1688, i64 5
  %1718 = load i8, i8 addrspace(4)* %1717, align 1, !tbaa !32
  %1719 = zext i8 %1718 to i64
  %1720 = shl nuw nsw i64 %1719, 40
  %1721 = or i64 %1716, %1720
  %1722 = getelementptr inbounds i8, i8 addrspace(4)* %1688, i64 6
  %1723 = load i8, i8 addrspace(4)* %1722, align 1, !tbaa !32
  %1724 = zext i8 %1723 to i64
  %1725 = shl nuw nsw i64 %1724, 48
  %1726 = or i64 %1721, %1725
  %1727 = getelementptr inbounds i8, i8 addrspace(4)* %1688, i64 7
  %1728 = load i8, i8 addrspace(4)* %1727, align 1, !tbaa !32
  %1729 = zext i8 %1728 to i64
  %1730 = shl nuw i64 %1729, 56
  %1731 = or i64 %1726, %1730
  %1732 = add nsw i32 %1689, -8
  %1733 = getelementptr inbounds i8, i8 addrspace(4)* %1688, i64 8
  br label %1747

1734:                                             ; preds = %1692, %1734
  %1735 = phi i32 [ %1745, %1734 ], [ 0, %1692 ]
  %1736 = phi i64 [ %1744, %1734 ], [ 0, %1692 ]
  %1737 = zext i32 %1735 to i64
  %1738 = getelementptr inbounds i8, i8 addrspace(4)* %1688, i64 %1737
  %1739 = load i8, i8 addrspace(4)* %1738, align 1, !tbaa !32
  %1740 = zext i8 %1739 to i64
  %1741 = shl i32 %1735, 3
  %1742 = zext i32 %1741 to i64
  %1743 = shl nuw i64 %1740, %1742
  %1744 = or i64 %1743, %1736
  %1745 = add nuw nsw i32 %1735, 1
  %1746 = icmp eq i32 %1745, %1689
  br i1 %1746, label %1747, label %1734

1747:                                             ; preds = %1734, %1694, %1692
  %1748 = phi i8 addrspace(4)* [ %1733, %1694 ], [ %1688, %1692 ], [ %1688, %1734 ]
  %1749 = phi i32 [ %1732, %1694 ], [ 0, %1692 ], [ 0, %1734 ]
  %1750 = phi i64 [ %1731, %1694 ], [ 0, %1692 ], [ %1744, %1734 ]
  %1751 = icmp ugt i32 %1749, 7
  br i1 %1751, label %1754, label %1752

1752:                                             ; preds = %1747
  %1753 = icmp eq i32 %1749, 0
  br i1 %1753, label %1807, label %1794

1754:                                             ; preds = %1747
  %1755 = load i8, i8 addrspace(4)* %1748, align 1, !tbaa !32
  %1756 = zext i8 %1755 to i64
  %1757 = getelementptr inbounds i8, i8 addrspace(4)* %1748, i64 1
  %1758 = load i8, i8 addrspace(4)* %1757, align 1, !tbaa !32
  %1759 = zext i8 %1758 to i64
  %1760 = shl nuw nsw i64 %1759, 8
  %1761 = or i64 %1760, %1756
  %1762 = getelementptr inbounds i8, i8 addrspace(4)* %1748, i64 2
  %1763 = load i8, i8 addrspace(4)* %1762, align 1, !tbaa !32
  %1764 = zext i8 %1763 to i64
  %1765 = shl nuw nsw i64 %1764, 16
  %1766 = or i64 %1761, %1765
  %1767 = getelementptr inbounds i8, i8 addrspace(4)* %1748, i64 3
  %1768 = load i8, i8 addrspace(4)* %1767, align 1, !tbaa !32
  %1769 = zext i8 %1768 to i64
  %1770 = shl nuw nsw i64 %1769, 24
  %1771 = or i64 %1766, %1770
  %1772 = getelementptr inbounds i8, i8 addrspace(4)* %1748, i64 4
  %1773 = load i8, i8 addrspace(4)* %1772, align 1, !tbaa !32
  %1774 = zext i8 %1773 to i64
  %1775 = shl nuw nsw i64 %1774, 32
  %1776 = or i64 %1771, %1775
  %1777 = getelementptr inbounds i8, i8 addrspace(4)* %1748, i64 5
  %1778 = load i8, i8 addrspace(4)* %1777, align 1, !tbaa !32
  %1779 = zext i8 %1778 to i64
  %1780 = shl nuw nsw i64 %1779, 40
  %1781 = or i64 %1776, %1780
  %1782 = getelementptr inbounds i8, i8 addrspace(4)* %1748, i64 6
  %1783 = load i8, i8 addrspace(4)* %1782, align 1, !tbaa !32
  %1784 = zext i8 %1783 to i64
  %1785 = shl nuw nsw i64 %1784, 48
  %1786 = or i64 %1781, %1785
  %1787 = getelementptr inbounds i8, i8 addrspace(4)* %1748, i64 7
  %1788 = load i8, i8 addrspace(4)* %1787, align 1, !tbaa !32
  %1789 = zext i8 %1788 to i64
  %1790 = shl nuw i64 %1789, 56
  %1791 = or i64 %1786, %1790
  %1792 = add nsw i32 %1749, -8
  %1793 = getelementptr inbounds i8, i8 addrspace(4)* %1748, i64 8
  br label %1807

1794:                                             ; preds = %1752, %1794
  %1795 = phi i32 [ %1805, %1794 ], [ 0, %1752 ]
  %1796 = phi i64 [ %1804, %1794 ], [ 0, %1752 ]
  %1797 = zext i32 %1795 to i64
  %1798 = getelementptr inbounds i8, i8 addrspace(4)* %1748, i64 %1797
  %1799 = load i8, i8 addrspace(4)* %1798, align 1, !tbaa !32
  %1800 = zext i8 %1799 to i64
  %1801 = shl i32 %1795, 3
  %1802 = zext i32 %1801 to i64
  %1803 = shl nuw i64 %1800, %1802
  %1804 = or i64 %1803, %1796
  %1805 = add nuw nsw i32 %1795, 1
  %1806 = icmp eq i32 %1805, %1749
  br i1 %1806, label %1807, label %1794

1807:                                             ; preds = %1794, %1754, %1752
  %1808 = phi i8 addrspace(4)* [ %1793, %1754 ], [ %1748, %1752 ], [ %1748, %1794 ]
  %1809 = phi i32 [ %1792, %1754 ], [ 0, %1752 ], [ 0, %1794 ]
  %1810 = phi i64 [ %1791, %1754 ], [ 0, %1752 ], [ %1804, %1794 ]
  %1811 = icmp ugt i32 %1809, 7
  br i1 %1811, label %1814, label %1812

1812:                                             ; preds = %1807
  %1813 = icmp eq i32 %1809, 0
  br i1 %1813, label %1867, label %1854

1814:                                             ; preds = %1807
  %1815 = load i8, i8 addrspace(4)* %1808, align 1, !tbaa !32
  %1816 = zext i8 %1815 to i64
  %1817 = getelementptr inbounds i8, i8 addrspace(4)* %1808, i64 1
  %1818 = load i8, i8 addrspace(4)* %1817, align 1, !tbaa !32
  %1819 = zext i8 %1818 to i64
  %1820 = shl nuw nsw i64 %1819, 8
  %1821 = or i64 %1820, %1816
  %1822 = getelementptr inbounds i8, i8 addrspace(4)* %1808, i64 2
  %1823 = load i8, i8 addrspace(4)* %1822, align 1, !tbaa !32
  %1824 = zext i8 %1823 to i64
  %1825 = shl nuw nsw i64 %1824, 16
  %1826 = or i64 %1821, %1825
  %1827 = getelementptr inbounds i8, i8 addrspace(4)* %1808, i64 3
  %1828 = load i8, i8 addrspace(4)* %1827, align 1, !tbaa !32
  %1829 = zext i8 %1828 to i64
  %1830 = shl nuw nsw i64 %1829, 24
  %1831 = or i64 %1826, %1830
  %1832 = getelementptr inbounds i8, i8 addrspace(4)* %1808, i64 4
  %1833 = load i8, i8 addrspace(4)* %1832, align 1, !tbaa !32
  %1834 = zext i8 %1833 to i64
  %1835 = shl nuw nsw i64 %1834, 32
  %1836 = or i64 %1831, %1835
  %1837 = getelementptr inbounds i8, i8 addrspace(4)* %1808, i64 5
  %1838 = load i8, i8 addrspace(4)* %1837, align 1, !tbaa !32
  %1839 = zext i8 %1838 to i64
  %1840 = shl nuw nsw i64 %1839, 40
  %1841 = or i64 %1836, %1840
  %1842 = getelementptr inbounds i8, i8 addrspace(4)* %1808, i64 6
  %1843 = load i8, i8 addrspace(4)* %1842, align 1, !tbaa !32
  %1844 = zext i8 %1843 to i64
  %1845 = shl nuw nsw i64 %1844, 48
  %1846 = or i64 %1841, %1845
  %1847 = getelementptr inbounds i8, i8 addrspace(4)* %1808, i64 7
  %1848 = load i8, i8 addrspace(4)* %1847, align 1, !tbaa !32
  %1849 = zext i8 %1848 to i64
  %1850 = shl nuw i64 %1849, 56
  %1851 = or i64 %1846, %1850
  %1852 = add nsw i32 %1809, -8
  %1853 = getelementptr inbounds i8, i8 addrspace(4)* %1808, i64 8
  br label %1867

1854:                                             ; preds = %1812, %1854
  %1855 = phi i32 [ %1865, %1854 ], [ 0, %1812 ]
  %1856 = phi i64 [ %1864, %1854 ], [ 0, %1812 ]
  %1857 = zext i32 %1855 to i64
  %1858 = getelementptr inbounds i8, i8 addrspace(4)* %1808, i64 %1857
  %1859 = load i8, i8 addrspace(4)* %1858, align 1, !tbaa !32
  %1860 = zext i8 %1859 to i64
  %1861 = shl i32 %1855, 3
  %1862 = zext i32 %1861 to i64
  %1863 = shl nuw i64 %1860, %1862
  %1864 = or i64 %1863, %1856
  %1865 = add nuw nsw i32 %1855, 1
  %1866 = icmp eq i32 %1865, %1809
  br i1 %1866, label %1867, label %1854

1867:                                             ; preds = %1854, %1814, %1812
  %1868 = phi i8 addrspace(4)* [ %1853, %1814 ], [ %1808, %1812 ], [ %1808, %1854 ]
  %1869 = phi i32 [ %1852, %1814 ], [ 0, %1812 ], [ 0, %1854 ]
  %1870 = phi i64 [ %1851, %1814 ], [ 0, %1812 ], [ %1864, %1854 ]
  %1871 = icmp ugt i32 %1869, 7
  br i1 %1871, label %1874, label %1872

1872:                                             ; preds = %1867
  %1873 = icmp eq i32 %1869, 0
  br i1 %1873, label %1925, label %1912

1874:                                             ; preds = %1867
  %1875 = load i8, i8 addrspace(4)* %1868, align 1, !tbaa !32
  %1876 = zext i8 %1875 to i64
  %1877 = getelementptr inbounds i8, i8 addrspace(4)* %1868, i64 1
  %1878 = load i8, i8 addrspace(4)* %1877, align 1, !tbaa !32
  %1879 = zext i8 %1878 to i64
  %1880 = shl nuw nsw i64 %1879, 8
  %1881 = or i64 %1880, %1876
  %1882 = getelementptr inbounds i8, i8 addrspace(4)* %1868, i64 2
  %1883 = load i8, i8 addrspace(4)* %1882, align 1, !tbaa !32
  %1884 = zext i8 %1883 to i64
  %1885 = shl nuw nsw i64 %1884, 16
  %1886 = or i64 %1881, %1885
  %1887 = getelementptr inbounds i8, i8 addrspace(4)* %1868, i64 3
  %1888 = load i8, i8 addrspace(4)* %1887, align 1, !tbaa !32
  %1889 = zext i8 %1888 to i64
  %1890 = shl nuw nsw i64 %1889, 24
  %1891 = or i64 %1886, %1890
  %1892 = getelementptr inbounds i8, i8 addrspace(4)* %1868, i64 4
  %1893 = load i8, i8 addrspace(4)* %1892, align 1, !tbaa !32
  %1894 = zext i8 %1893 to i64
  %1895 = shl nuw nsw i64 %1894, 32
  %1896 = or i64 %1891, %1895
  %1897 = getelementptr inbounds i8, i8 addrspace(4)* %1868, i64 5
  %1898 = load i8, i8 addrspace(4)* %1897, align 1, !tbaa !32
  %1899 = zext i8 %1898 to i64
  %1900 = shl nuw nsw i64 %1899, 40
  %1901 = or i64 %1896, %1900
  %1902 = getelementptr inbounds i8, i8 addrspace(4)* %1868, i64 6
  %1903 = load i8, i8 addrspace(4)* %1902, align 1, !tbaa !32
  %1904 = zext i8 %1903 to i64
  %1905 = shl nuw nsw i64 %1904, 48
  %1906 = or i64 %1901, %1905
  %1907 = getelementptr inbounds i8, i8 addrspace(4)* %1868, i64 7
  %1908 = load i8, i8 addrspace(4)* %1907, align 1, !tbaa !32
  %1909 = zext i8 %1908 to i64
  %1910 = shl nuw i64 %1909, 56
  %1911 = or i64 %1906, %1910
  br label %1925

1912:                                             ; preds = %1872, %1912
  %1913 = phi i32 [ %1923, %1912 ], [ 0, %1872 ]
  %1914 = phi i64 [ %1922, %1912 ], [ 0, %1872 ]
  %1915 = zext i32 %1913 to i64
  %1916 = getelementptr inbounds i8, i8 addrspace(4)* %1868, i64 %1915
  %1917 = load i8, i8 addrspace(4)* %1916, align 1, !tbaa !32
  %1918 = zext i8 %1917 to i64
  %1919 = shl i32 %1913, 3
  %1920 = zext i32 %1919 to i64
  %1921 = shl nuw i64 %1918, %1920
  %1922 = or i64 %1921, %1914
  %1923 = add nuw nsw i32 %1913, 1
  %1924 = icmp eq i32 %1923, %1869
  br i1 %1924, label %1925, label %1912

1925:                                             ; preds = %1912, %1874, %1872
  %1926 = phi i64 [ %1911, %1874 ], [ 0, %1872 ], [ %1922, %1912 ]
  %1927 = shl nuw nsw i64 %1508, 2
  %1928 = add nuw nsw i64 %1927, 28
  %1929 = and i64 %1928, 480
  %1930 = and i64 %1510, -225
  %1931 = or i64 %1930, %1929
  %1932 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %1931, i64 noundef %1570, i64 noundef %1630, i64 noundef %1690, i64 noundef %1750, i64 noundef %1810, i64 noundef %1870, i64 noundef %1926) #11
  %1933 = sub i64 %1500, %1508
  %1934 = getelementptr inbounds i8, i8 addrspace(4)* %1501, i64 %1508
  %1935 = icmp eq i64 %1933, 0
  br i1 %1935, label %1936, label %1499

1936:                                             ; preds = %1925, %1491
  %1937 = phi <2 x i64> [ %1494, %1491 ], [ %1932, %1925 ]
  %1938 = extractelement <2 x i64> %1937, i64 0
  %1939 = bitcast double %1488 to i64
  %1940 = and i64 %1938, -227
  %1941 = or i64 %1940, 34
  %1942 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %1941, i64 noundef %1939, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1943 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1944 = extractelement <2 x i64> %1943, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %1945, label %1949

1945:                                             ; preds = %1936
  %1946 = and i64 %1944, -225
  %1947 = or i64 %1946, 32
  %1948 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %1947, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %2390

1949:                                             ; preds = %1936
  %1950 = and i64 %1944, 2
  %1951 = and i64 %1944, -3
  %1952 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1951, i64 0
  br label %1953

1953:                                             ; preds = %2379, %1949
  %1954 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.3, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str.3 to [16 x i8]*) to i64)), i64 1))), %1949 ], [ %2387, %2379 ]
  %1955 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %1949 ], [ %2388, %2379 ]
  %1956 = phi <2 x i64> [ %1952, %1949 ], [ %2386, %2379 ]
  %1957 = icmp ugt i64 %1954, 56
  %1958 = extractelement <2 x i64> %1956, i64 0
  %1959 = or i64 %1958, %1950
  %1960 = insertelement <2 x i64> poison, i64 %1959, i64 0
  %1961 = select i1 %1957, <2 x i64> %1956, <2 x i64> %1960
  %1962 = tail call i64 @llvm.umin.i64(i64 %1954, i64 56)
  %1963 = trunc i64 %1962 to i32
  %1964 = extractelement <2 x i64> %1961, i64 0
  %1965 = icmp ugt i32 %1963, 7
  br i1 %1965, label %1968, label %1966

1966:                                             ; preds = %1953
  %1967 = icmp eq i32 %1963, 0
  br i1 %1967, label %2021, label %2008

1968:                                             ; preds = %1953
  %1969 = load i8, i8 addrspace(4)* %1955, align 1, !tbaa !32
  %1970 = zext i8 %1969 to i64
  %1971 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 1
  %1972 = load i8, i8 addrspace(4)* %1971, align 1, !tbaa !32
  %1973 = zext i8 %1972 to i64
  %1974 = shl nuw nsw i64 %1973, 8
  %1975 = or i64 %1974, %1970
  %1976 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 2
  %1977 = load i8, i8 addrspace(4)* %1976, align 1, !tbaa !32
  %1978 = zext i8 %1977 to i64
  %1979 = shl nuw nsw i64 %1978, 16
  %1980 = or i64 %1975, %1979
  %1981 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 3
  %1982 = load i8, i8 addrspace(4)* %1981, align 1, !tbaa !32
  %1983 = zext i8 %1982 to i64
  %1984 = shl nuw nsw i64 %1983, 24
  %1985 = or i64 %1980, %1984
  %1986 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 4
  %1987 = load i8, i8 addrspace(4)* %1986, align 1, !tbaa !32
  %1988 = zext i8 %1987 to i64
  %1989 = shl nuw nsw i64 %1988, 32
  %1990 = or i64 %1985, %1989
  %1991 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 5
  %1992 = load i8, i8 addrspace(4)* %1991, align 1, !tbaa !32
  %1993 = zext i8 %1992 to i64
  %1994 = shl nuw nsw i64 %1993, 40
  %1995 = or i64 %1990, %1994
  %1996 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 6
  %1997 = load i8, i8 addrspace(4)* %1996, align 1, !tbaa !32
  %1998 = zext i8 %1997 to i64
  %1999 = shl nuw nsw i64 %1998, 48
  %2000 = or i64 %1995, %1999
  %2001 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 7
  %2002 = load i8, i8 addrspace(4)* %2001, align 1, !tbaa !32
  %2003 = zext i8 %2002 to i64
  %2004 = shl nuw i64 %2003, 56
  %2005 = or i64 %2000, %2004
  %2006 = add nsw i32 %1963, -8
  %2007 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 8
  br label %2021

2008:                                             ; preds = %1966, %2008
  %2009 = phi i32 [ %2019, %2008 ], [ 0, %1966 ]
  %2010 = phi i64 [ %2018, %2008 ], [ 0, %1966 ]
  %2011 = zext i32 %2009 to i64
  %2012 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 %2011
  %2013 = load i8, i8 addrspace(4)* %2012, align 1, !tbaa !32
  %2014 = zext i8 %2013 to i64
  %2015 = shl i32 %2009, 3
  %2016 = zext i32 %2015 to i64
  %2017 = shl nuw i64 %2014, %2016
  %2018 = or i64 %2017, %2010
  %2019 = add nuw nsw i32 %2009, 1
  %2020 = icmp eq i32 %2019, %1963
  br i1 %2020, label %2021, label %2008, !llvm.loop !33

2021:                                             ; preds = %2008, %1968, %1966
  %2022 = phi i8 addrspace(4)* [ %2007, %1968 ], [ %1955, %1966 ], [ %1955, %2008 ]
  %2023 = phi i32 [ %2006, %1968 ], [ 0, %1966 ], [ 0, %2008 ]
  %2024 = phi i64 [ %2005, %1968 ], [ 0, %1966 ], [ %2018, %2008 ]
  %2025 = icmp ugt i32 %2023, 7
  br i1 %2025, label %2028, label %2026

2026:                                             ; preds = %2021
  %2027 = icmp eq i32 %2023, 0
  br i1 %2027, label %2081, label %2068

2028:                                             ; preds = %2021
  %2029 = load i8, i8 addrspace(4)* %2022, align 1, !tbaa !32
  %2030 = zext i8 %2029 to i64
  %2031 = getelementptr inbounds i8, i8 addrspace(4)* %2022, i64 1
  %2032 = load i8, i8 addrspace(4)* %2031, align 1, !tbaa !32
  %2033 = zext i8 %2032 to i64
  %2034 = shl nuw nsw i64 %2033, 8
  %2035 = or i64 %2034, %2030
  %2036 = getelementptr inbounds i8, i8 addrspace(4)* %2022, i64 2
  %2037 = load i8, i8 addrspace(4)* %2036, align 1, !tbaa !32
  %2038 = zext i8 %2037 to i64
  %2039 = shl nuw nsw i64 %2038, 16
  %2040 = or i64 %2035, %2039
  %2041 = getelementptr inbounds i8, i8 addrspace(4)* %2022, i64 3
  %2042 = load i8, i8 addrspace(4)* %2041, align 1, !tbaa !32
  %2043 = zext i8 %2042 to i64
  %2044 = shl nuw nsw i64 %2043, 24
  %2045 = or i64 %2040, %2044
  %2046 = getelementptr inbounds i8, i8 addrspace(4)* %2022, i64 4
  %2047 = load i8, i8 addrspace(4)* %2046, align 1, !tbaa !32
  %2048 = zext i8 %2047 to i64
  %2049 = shl nuw nsw i64 %2048, 32
  %2050 = or i64 %2045, %2049
  %2051 = getelementptr inbounds i8, i8 addrspace(4)* %2022, i64 5
  %2052 = load i8, i8 addrspace(4)* %2051, align 1, !tbaa !32
  %2053 = zext i8 %2052 to i64
  %2054 = shl nuw nsw i64 %2053, 40
  %2055 = or i64 %2050, %2054
  %2056 = getelementptr inbounds i8, i8 addrspace(4)* %2022, i64 6
  %2057 = load i8, i8 addrspace(4)* %2056, align 1, !tbaa !32
  %2058 = zext i8 %2057 to i64
  %2059 = shl nuw nsw i64 %2058, 48
  %2060 = or i64 %2055, %2059
  %2061 = getelementptr inbounds i8, i8 addrspace(4)* %2022, i64 7
  %2062 = load i8, i8 addrspace(4)* %2061, align 1, !tbaa !32
  %2063 = zext i8 %2062 to i64
  %2064 = shl nuw i64 %2063, 56
  %2065 = or i64 %2060, %2064
  %2066 = add nsw i32 %2023, -8
  %2067 = getelementptr inbounds i8, i8 addrspace(4)* %2022, i64 8
  br label %2081

2068:                                             ; preds = %2026, %2068
  %2069 = phi i32 [ %2079, %2068 ], [ 0, %2026 ]
  %2070 = phi i64 [ %2078, %2068 ], [ 0, %2026 ]
  %2071 = zext i32 %2069 to i64
  %2072 = getelementptr inbounds i8, i8 addrspace(4)* %2022, i64 %2071
  %2073 = load i8, i8 addrspace(4)* %2072, align 1, !tbaa !32
  %2074 = zext i8 %2073 to i64
  %2075 = shl i32 %2069, 3
  %2076 = zext i32 %2075 to i64
  %2077 = shl nuw i64 %2074, %2076
  %2078 = or i64 %2077, %2070
  %2079 = add nuw nsw i32 %2069, 1
  %2080 = icmp eq i32 %2079, %2023
  br i1 %2080, label %2081, label %2068

2081:                                             ; preds = %2068, %2028, %2026
  %2082 = phi i8 addrspace(4)* [ %2067, %2028 ], [ %2022, %2026 ], [ %2022, %2068 ]
  %2083 = phi i32 [ %2066, %2028 ], [ 0, %2026 ], [ 0, %2068 ]
  %2084 = phi i64 [ %2065, %2028 ], [ 0, %2026 ], [ %2078, %2068 ]
  %2085 = icmp ugt i32 %2083, 7
  br i1 %2085, label %2088, label %2086

2086:                                             ; preds = %2081
  %2087 = icmp eq i32 %2083, 0
  br i1 %2087, label %2141, label %2128

2088:                                             ; preds = %2081
  %2089 = load i8, i8 addrspace(4)* %2082, align 1, !tbaa !32
  %2090 = zext i8 %2089 to i64
  %2091 = getelementptr inbounds i8, i8 addrspace(4)* %2082, i64 1
  %2092 = load i8, i8 addrspace(4)* %2091, align 1, !tbaa !32
  %2093 = zext i8 %2092 to i64
  %2094 = shl nuw nsw i64 %2093, 8
  %2095 = or i64 %2094, %2090
  %2096 = getelementptr inbounds i8, i8 addrspace(4)* %2082, i64 2
  %2097 = load i8, i8 addrspace(4)* %2096, align 1, !tbaa !32
  %2098 = zext i8 %2097 to i64
  %2099 = shl nuw nsw i64 %2098, 16
  %2100 = or i64 %2095, %2099
  %2101 = getelementptr inbounds i8, i8 addrspace(4)* %2082, i64 3
  %2102 = load i8, i8 addrspace(4)* %2101, align 1, !tbaa !32
  %2103 = zext i8 %2102 to i64
  %2104 = shl nuw nsw i64 %2103, 24
  %2105 = or i64 %2100, %2104
  %2106 = getelementptr inbounds i8, i8 addrspace(4)* %2082, i64 4
  %2107 = load i8, i8 addrspace(4)* %2106, align 1, !tbaa !32
  %2108 = zext i8 %2107 to i64
  %2109 = shl nuw nsw i64 %2108, 32
  %2110 = or i64 %2105, %2109
  %2111 = getelementptr inbounds i8, i8 addrspace(4)* %2082, i64 5
  %2112 = load i8, i8 addrspace(4)* %2111, align 1, !tbaa !32
  %2113 = zext i8 %2112 to i64
  %2114 = shl nuw nsw i64 %2113, 40
  %2115 = or i64 %2110, %2114
  %2116 = getelementptr inbounds i8, i8 addrspace(4)* %2082, i64 6
  %2117 = load i8, i8 addrspace(4)* %2116, align 1, !tbaa !32
  %2118 = zext i8 %2117 to i64
  %2119 = shl nuw nsw i64 %2118, 48
  %2120 = or i64 %2115, %2119
  %2121 = getelementptr inbounds i8, i8 addrspace(4)* %2082, i64 7
  %2122 = load i8, i8 addrspace(4)* %2121, align 1, !tbaa !32
  %2123 = zext i8 %2122 to i64
  %2124 = shl nuw i64 %2123, 56
  %2125 = or i64 %2120, %2124
  %2126 = add nsw i32 %2083, -8
  %2127 = getelementptr inbounds i8, i8 addrspace(4)* %2082, i64 8
  br label %2141

2128:                                             ; preds = %2086, %2128
  %2129 = phi i32 [ %2139, %2128 ], [ 0, %2086 ]
  %2130 = phi i64 [ %2138, %2128 ], [ 0, %2086 ]
  %2131 = zext i32 %2129 to i64
  %2132 = getelementptr inbounds i8, i8 addrspace(4)* %2082, i64 %2131
  %2133 = load i8, i8 addrspace(4)* %2132, align 1, !tbaa !32
  %2134 = zext i8 %2133 to i64
  %2135 = shl i32 %2129, 3
  %2136 = zext i32 %2135 to i64
  %2137 = shl nuw i64 %2134, %2136
  %2138 = or i64 %2137, %2130
  %2139 = add nuw nsw i32 %2129, 1
  %2140 = icmp eq i32 %2139, %2083
  br i1 %2140, label %2141, label %2128

2141:                                             ; preds = %2128, %2088, %2086
  %2142 = phi i8 addrspace(4)* [ %2127, %2088 ], [ %2082, %2086 ], [ %2082, %2128 ]
  %2143 = phi i32 [ %2126, %2088 ], [ 0, %2086 ], [ 0, %2128 ]
  %2144 = phi i64 [ %2125, %2088 ], [ 0, %2086 ], [ %2138, %2128 ]
  %2145 = icmp ugt i32 %2143, 7
  br i1 %2145, label %2148, label %2146

2146:                                             ; preds = %2141
  %2147 = icmp eq i32 %2143, 0
  br i1 %2147, label %2201, label %2188

2148:                                             ; preds = %2141
  %2149 = load i8, i8 addrspace(4)* %2142, align 1, !tbaa !32
  %2150 = zext i8 %2149 to i64
  %2151 = getelementptr inbounds i8, i8 addrspace(4)* %2142, i64 1
  %2152 = load i8, i8 addrspace(4)* %2151, align 1, !tbaa !32
  %2153 = zext i8 %2152 to i64
  %2154 = shl nuw nsw i64 %2153, 8
  %2155 = or i64 %2154, %2150
  %2156 = getelementptr inbounds i8, i8 addrspace(4)* %2142, i64 2
  %2157 = load i8, i8 addrspace(4)* %2156, align 1, !tbaa !32
  %2158 = zext i8 %2157 to i64
  %2159 = shl nuw nsw i64 %2158, 16
  %2160 = or i64 %2155, %2159
  %2161 = getelementptr inbounds i8, i8 addrspace(4)* %2142, i64 3
  %2162 = load i8, i8 addrspace(4)* %2161, align 1, !tbaa !32
  %2163 = zext i8 %2162 to i64
  %2164 = shl nuw nsw i64 %2163, 24
  %2165 = or i64 %2160, %2164
  %2166 = getelementptr inbounds i8, i8 addrspace(4)* %2142, i64 4
  %2167 = load i8, i8 addrspace(4)* %2166, align 1, !tbaa !32
  %2168 = zext i8 %2167 to i64
  %2169 = shl nuw nsw i64 %2168, 32
  %2170 = or i64 %2165, %2169
  %2171 = getelementptr inbounds i8, i8 addrspace(4)* %2142, i64 5
  %2172 = load i8, i8 addrspace(4)* %2171, align 1, !tbaa !32
  %2173 = zext i8 %2172 to i64
  %2174 = shl nuw nsw i64 %2173, 40
  %2175 = or i64 %2170, %2174
  %2176 = getelementptr inbounds i8, i8 addrspace(4)* %2142, i64 6
  %2177 = load i8, i8 addrspace(4)* %2176, align 1, !tbaa !32
  %2178 = zext i8 %2177 to i64
  %2179 = shl nuw nsw i64 %2178, 48
  %2180 = or i64 %2175, %2179
  %2181 = getelementptr inbounds i8, i8 addrspace(4)* %2142, i64 7
  %2182 = load i8, i8 addrspace(4)* %2181, align 1, !tbaa !32
  %2183 = zext i8 %2182 to i64
  %2184 = shl nuw i64 %2183, 56
  %2185 = or i64 %2180, %2184
  %2186 = add nsw i32 %2143, -8
  %2187 = getelementptr inbounds i8, i8 addrspace(4)* %2142, i64 8
  br label %2201

2188:                                             ; preds = %2146, %2188
  %2189 = phi i32 [ %2199, %2188 ], [ 0, %2146 ]
  %2190 = phi i64 [ %2198, %2188 ], [ 0, %2146 ]
  %2191 = zext i32 %2189 to i64
  %2192 = getelementptr inbounds i8, i8 addrspace(4)* %2142, i64 %2191
  %2193 = load i8, i8 addrspace(4)* %2192, align 1, !tbaa !32
  %2194 = zext i8 %2193 to i64
  %2195 = shl i32 %2189, 3
  %2196 = zext i32 %2195 to i64
  %2197 = shl nuw i64 %2194, %2196
  %2198 = or i64 %2197, %2190
  %2199 = add nuw nsw i32 %2189, 1
  %2200 = icmp eq i32 %2199, %2143
  br i1 %2200, label %2201, label %2188

2201:                                             ; preds = %2188, %2148, %2146
  %2202 = phi i8 addrspace(4)* [ %2187, %2148 ], [ %2142, %2146 ], [ %2142, %2188 ]
  %2203 = phi i32 [ %2186, %2148 ], [ 0, %2146 ], [ 0, %2188 ]
  %2204 = phi i64 [ %2185, %2148 ], [ 0, %2146 ], [ %2198, %2188 ]
  %2205 = icmp ugt i32 %2203, 7
  br i1 %2205, label %2208, label %2206

2206:                                             ; preds = %2201
  %2207 = icmp eq i32 %2203, 0
  br i1 %2207, label %2261, label %2248

2208:                                             ; preds = %2201
  %2209 = load i8, i8 addrspace(4)* %2202, align 1, !tbaa !32
  %2210 = zext i8 %2209 to i64
  %2211 = getelementptr inbounds i8, i8 addrspace(4)* %2202, i64 1
  %2212 = load i8, i8 addrspace(4)* %2211, align 1, !tbaa !32
  %2213 = zext i8 %2212 to i64
  %2214 = shl nuw nsw i64 %2213, 8
  %2215 = or i64 %2214, %2210
  %2216 = getelementptr inbounds i8, i8 addrspace(4)* %2202, i64 2
  %2217 = load i8, i8 addrspace(4)* %2216, align 1, !tbaa !32
  %2218 = zext i8 %2217 to i64
  %2219 = shl nuw nsw i64 %2218, 16
  %2220 = or i64 %2215, %2219
  %2221 = getelementptr inbounds i8, i8 addrspace(4)* %2202, i64 3
  %2222 = load i8, i8 addrspace(4)* %2221, align 1, !tbaa !32
  %2223 = zext i8 %2222 to i64
  %2224 = shl nuw nsw i64 %2223, 24
  %2225 = or i64 %2220, %2224
  %2226 = getelementptr inbounds i8, i8 addrspace(4)* %2202, i64 4
  %2227 = load i8, i8 addrspace(4)* %2226, align 1, !tbaa !32
  %2228 = zext i8 %2227 to i64
  %2229 = shl nuw nsw i64 %2228, 32
  %2230 = or i64 %2225, %2229
  %2231 = getelementptr inbounds i8, i8 addrspace(4)* %2202, i64 5
  %2232 = load i8, i8 addrspace(4)* %2231, align 1, !tbaa !32
  %2233 = zext i8 %2232 to i64
  %2234 = shl nuw nsw i64 %2233, 40
  %2235 = or i64 %2230, %2234
  %2236 = getelementptr inbounds i8, i8 addrspace(4)* %2202, i64 6
  %2237 = load i8, i8 addrspace(4)* %2236, align 1, !tbaa !32
  %2238 = zext i8 %2237 to i64
  %2239 = shl nuw nsw i64 %2238, 48
  %2240 = or i64 %2235, %2239
  %2241 = getelementptr inbounds i8, i8 addrspace(4)* %2202, i64 7
  %2242 = load i8, i8 addrspace(4)* %2241, align 1, !tbaa !32
  %2243 = zext i8 %2242 to i64
  %2244 = shl nuw i64 %2243, 56
  %2245 = or i64 %2240, %2244
  %2246 = add nsw i32 %2203, -8
  %2247 = getelementptr inbounds i8, i8 addrspace(4)* %2202, i64 8
  br label %2261

2248:                                             ; preds = %2206, %2248
  %2249 = phi i32 [ %2259, %2248 ], [ 0, %2206 ]
  %2250 = phi i64 [ %2258, %2248 ], [ 0, %2206 ]
  %2251 = zext i32 %2249 to i64
  %2252 = getelementptr inbounds i8, i8 addrspace(4)* %2202, i64 %2251
  %2253 = load i8, i8 addrspace(4)* %2252, align 1, !tbaa !32
  %2254 = zext i8 %2253 to i64
  %2255 = shl i32 %2249, 3
  %2256 = zext i32 %2255 to i64
  %2257 = shl nuw i64 %2254, %2256
  %2258 = or i64 %2257, %2250
  %2259 = add nuw nsw i32 %2249, 1
  %2260 = icmp eq i32 %2259, %2203
  br i1 %2260, label %2261, label %2248

2261:                                             ; preds = %2248, %2208, %2206
  %2262 = phi i8 addrspace(4)* [ %2247, %2208 ], [ %2202, %2206 ], [ %2202, %2248 ]
  %2263 = phi i32 [ %2246, %2208 ], [ 0, %2206 ], [ 0, %2248 ]
  %2264 = phi i64 [ %2245, %2208 ], [ 0, %2206 ], [ %2258, %2248 ]
  %2265 = icmp ugt i32 %2263, 7
  br i1 %2265, label %2268, label %2266

2266:                                             ; preds = %2261
  %2267 = icmp eq i32 %2263, 0
  br i1 %2267, label %2321, label %2308

2268:                                             ; preds = %2261
  %2269 = load i8, i8 addrspace(4)* %2262, align 1, !tbaa !32
  %2270 = zext i8 %2269 to i64
  %2271 = getelementptr inbounds i8, i8 addrspace(4)* %2262, i64 1
  %2272 = load i8, i8 addrspace(4)* %2271, align 1, !tbaa !32
  %2273 = zext i8 %2272 to i64
  %2274 = shl nuw nsw i64 %2273, 8
  %2275 = or i64 %2274, %2270
  %2276 = getelementptr inbounds i8, i8 addrspace(4)* %2262, i64 2
  %2277 = load i8, i8 addrspace(4)* %2276, align 1, !tbaa !32
  %2278 = zext i8 %2277 to i64
  %2279 = shl nuw nsw i64 %2278, 16
  %2280 = or i64 %2275, %2279
  %2281 = getelementptr inbounds i8, i8 addrspace(4)* %2262, i64 3
  %2282 = load i8, i8 addrspace(4)* %2281, align 1, !tbaa !32
  %2283 = zext i8 %2282 to i64
  %2284 = shl nuw nsw i64 %2283, 24
  %2285 = or i64 %2280, %2284
  %2286 = getelementptr inbounds i8, i8 addrspace(4)* %2262, i64 4
  %2287 = load i8, i8 addrspace(4)* %2286, align 1, !tbaa !32
  %2288 = zext i8 %2287 to i64
  %2289 = shl nuw nsw i64 %2288, 32
  %2290 = or i64 %2285, %2289
  %2291 = getelementptr inbounds i8, i8 addrspace(4)* %2262, i64 5
  %2292 = load i8, i8 addrspace(4)* %2291, align 1, !tbaa !32
  %2293 = zext i8 %2292 to i64
  %2294 = shl nuw nsw i64 %2293, 40
  %2295 = or i64 %2290, %2294
  %2296 = getelementptr inbounds i8, i8 addrspace(4)* %2262, i64 6
  %2297 = load i8, i8 addrspace(4)* %2296, align 1, !tbaa !32
  %2298 = zext i8 %2297 to i64
  %2299 = shl nuw nsw i64 %2298, 48
  %2300 = or i64 %2295, %2299
  %2301 = getelementptr inbounds i8, i8 addrspace(4)* %2262, i64 7
  %2302 = load i8, i8 addrspace(4)* %2301, align 1, !tbaa !32
  %2303 = zext i8 %2302 to i64
  %2304 = shl nuw i64 %2303, 56
  %2305 = or i64 %2300, %2304
  %2306 = add nsw i32 %2263, -8
  %2307 = getelementptr inbounds i8, i8 addrspace(4)* %2262, i64 8
  br label %2321

2308:                                             ; preds = %2266, %2308
  %2309 = phi i32 [ %2319, %2308 ], [ 0, %2266 ]
  %2310 = phi i64 [ %2318, %2308 ], [ 0, %2266 ]
  %2311 = zext i32 %2309 to i64
  %2312 = getelementptr inbounds i8, i8 addrspace(4)* %2262, i64 %2311
  %2313 = load i8, i8 addrspace(4)* %2312, align 1, !tbaa !32
  %2314 = zext i8 %2313 to i64
  %2315 = shl i32 %2309, 3
  %2316 = zext i32 %2315 to i64
  %2317 = shl nuw i64 %2314, %2316
  %2318 = or i64 %2317, %2310
  %2319 = add nuw nsw i32 %2309, 1
  %2320 = icmp eq i32 %2319, %2263
  br i1 %2320, label %2321, label %2308

2321:                                             ; preds = %2308, %2268, %2266
  %2322 = phi i8 addrspace(4)* [ %2307, %2268 ], [ %2262, %2266 ], [ %2262, %2308 ]
  %2323 = phi i32 [ %2306, %2268 ], [ 0, %2266 ], [ 0, %2308 ]
  %2324 = phi i64 [ %2305, %2268 ], [ 0, %2266 ], [ %2318, %2308 ]
  %2325 = icmp ugt i32 %2323, 7
  br i1 %2325, label %2328, label %2326

2326:                                             ; preds = %2321
  %2327 = icmp eq i32 %2323, 0
  br i1 %2327, label %2379, label %2366

2328:                                             ; preds = %2321
  %2329 = load i8, i8 addrspace(4)* %2322, align 1, !tbaa !32
  %2330 = zext i8 %2329 to i64
  %2331 = getelementptr inbounds i8, i8 addrspace(4)* %2322, i64 1
  %2332 = load i8, i8 addrspace(4)* %2331, align 1, !tbaa !32
  %2333 = zext i8 %2332 to i64
  %2334 = shl nuw nsw i64 %2333, 8
  %2335 = or i64 %2334, %2330
  %2336 = getelementptr inbounds i8, i8 addrspace(4)* %2322, i64 2
  %2337 = load i8, i8 addrspace(4)* %2336, align 1, !tbaa !32
  %2338 = zext i8 %2337 to i64
  %2339 = shl nuw nsw i64 %2338, 16
  %2340 = or i64 %2335, %2339
  %2341 = getelementptr inbounds i8, i8 addrspace(4)* %2322, i64 3
  %2342 = load i8, i8 addrspace(4)* %2341, align 1, !tbaa !32
  %2343 = zext i8 %2342 to i64
  %2344 = shl nuw nsw i64 %2343, 24
  %2345 = or i64 %2340, %2344
  %2346 = getelementptr inbounds i8, i8 addrspace(4)* %2322, i64 4
  %2347 = load i8, i8 addrspace(4)* %2346, align 1, !tbaa !32
  %2348 = zext i8 %2347 to i64
  %2349 = shl nuw nsw i64 %2348, 32
  %2350 = or i64 %2345, %2349
  %2351 = getelementptr inbounds i8, i8 addrspace(4)* %2322, i64 5
  %2352 = load i8, i8 addrspace(4)* %2351, align 1, !tbaa !32
  %2353 = zext i8 %2352 to i64
  %2354 = shl nuw nsw i64 %2353, 40
  %2355 = or i64 %2350, %2354
  %2356 = getelementptr inbounds i8, i8 addrspace(4)* %2322, i64 6
  %2357 = load i8, i8 addrspace(4)* %2356, align 1, !tbaa !32
  %2358 = zext i8 %2357 to i64
  %2359 = shl nuw nsw i64 %2358, 48
  %2360 = or i64 %2355, %2359
  %2361 = getelementptr inbounds i8, i8 addrspace(4)* %2322, i64 7
  %2362 = load i8, i8 addrspace(4)* %2361, align 1, !tbaa !32
  %2363 = zext i8 %2362 to i64
  %2364 = shl nuw i64 %2363, 56
  %2365 = or i64 %2360, %2364
  br label %2379

2366:                                             ; preds = %2326, %2366
  %2367 = phi i32 [ %2377, %2366 ], [ 0, %2326 ]
  %2368 = phi i64 [ %2376, %2366 ], [ 0, %2326 ]
  %2369 = zext i32 %2367 to i64
  %2370 = getelementptr inbounds i8, i8 addrspace(4)* %2322, i64 %2369
  %2371 = load i8, i8 addrspace(4)* %2370, align 1, !tbaa !32
  %2372 = zext i8 %2371 to i64
  %2373 = shl i32 %2367, 3
  %2374 = zext i32 %2373 to i64
  %2375 = shl nuw i64 %2372, %2374
  %2376 = or i64 %2375, %2368
  %2377 = add nuw nsw i32 %2367, 1
  %2378 = icmp eq i32 %2377, %2323
  br i1 %2378, label %2379, label %2366

2379:                                             ; preds = %2366, %2328, %2326
  %2380 = phi i64 [ %2365, %2328 ], [ 0, %2326 ], [ %2376, %2366 ]
  %2381 = shl nuw nsw i64 %1962, 2
  %2382 = add nuw nsw i64 %2381, 28
  %2383 = and i64 %2382, 480
  %2384 = and i64 %1964, -225
  %2385 = or i64 %2384, %2383
  %2386 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %2385, i64 noundef %2024, i64 noundef %2084, i64 noundef %2144, i64 noundef %2204, i64 noundef %2264, i64 noundef %2324, i64 noundef %2380) #11
  %2387 = sub i64 %1954, %1962
  %2388 = getelementptr inbounds i8, i8 addrspace(4)* %1955, i64 %1962
  %2389 = icmp eq i64 %2387, 0
  br i1 %2389, label %2390, label %1953

2390:                                             ; preds = %2379, %1945
  %2391 = phi <2 x i64> [ %1948, %1945 ], [ %2386, %2379 ]
  %2392 = extractelement <2 x i64> %2391, i64 0
  %2393 = and i64 %2392, -227
  %2394 = or i64 %2393, 34
  %2395 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %580, i64 noundef %2394, i64 noundef %572, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %2396

2396:                                             ; preds = %2390, %571
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !34
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !36
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !28
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !28
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !28
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !28
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !28
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !28
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !28
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !28
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !36
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !36
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !38
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !36
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !36
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !36
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !34
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !34
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !34
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !36
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !36
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !39
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !42
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !39
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !42
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !28
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !34
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !28
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !39
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !42
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !34
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !34
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !28
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !43
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !42
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !34
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !34
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !34
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !36
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !28
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !28
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !28
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !28
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !28
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !28
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !28
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !28
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !36
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !36
  %110 = call i64 @llvm.read_register.i64(metadata !44) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !45
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !47
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !48
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !28
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !28
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !28
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !28
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !28
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !28
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !28
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !28
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !34
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !28
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !36
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !36
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !39
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !42
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !49
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !49
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !50
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !52
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !34
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !34
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !36
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !36
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !28
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !28
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !32
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !34
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !28
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !36
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !36
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !42
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !39
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !49
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !49
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !32
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
declare i64 @llvm.umin.i64(i64, i64) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #10

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !14}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !9, i64 0}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !12}
!27 = distinct !{!27, !14}
!28 = !{!29, !29, i64 0}
!29 = !{!"long", !30, i64 0}
!30 = !{!"omnipotent char", !31, i64 0}
!31 = !{!"Simple C/C++ TBAA"}
!32 = !{!30, !30, i64 0}
!33 = distinct !{!33, !14}
!34 = !{!35, !35, i64 0}
!35 = !{!"any pointer", !30, i64 0}
!36 = !{!37, !37, i64 0}
!37 = !{!"int", !30, i64 0}
!38 = !{i64 2662}
!39 = !{!40, !35, i64 0}
!40 = !{!"", !35, i64 0, !35, i64 8, !41, i64 16, !29, i64 24, !29, i64 32, !29, i64 40}
!41 = !{!"hsa_signal_s", !29, i64 0}
!42 = !{!40, !29, i64 40}
!43 = !{!40, !35, i64 8}
!44 = !{!"exec"}
!45 = !{!46, !37, i64 16}
!46 = !{!"", !29, i64 0, !29, i64 8, !37, i64 16, !37, i64 20}
!47 = !{!46, !29, i64 8}
!48 = !{!46, !37, i64 20}
!49 = !{!46, !29, i64 0}
!50 = !{!51, !29, i64 16}
!51 = !{!"amd_signal_s", !29, i64 0, !30, i64 8, !29, i64 16, !37, i64 24, !37, i64 28, !29, i64 32, !29, i64 40, !30, i64 48, !30, i64 56}
!52 = !{!51, !37, i64 24}
