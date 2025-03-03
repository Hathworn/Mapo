; ModuleID = '../data/hip_kernels/11297/0/main.cu'
source_filename = "../data/hip_kernels/11297/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.PPMPixel = type { i8, i8, i8 }

@_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private = internal addrspace(3) global [512 x i32] undef, align 16
@_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private = internal unnamed_addr addrspace(3) global [32 x [32 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12mod_CENTRISTP8PPMPixelS0_iiPii(%struct.PPMPixel addrspace(1)* nocapture writeonly %0, %struct.PPMPixel addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = add i32 %8, %9
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = shl i32 %11, 5
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = add i32 %12, %13
  %15 = shl nuw nsw i32 %13, 5
  %16 = add nuw nsw i32 %15, %9
  %17 = icmp slt i32 %16, %5
  br i1 %17, label %18, label %20

18:                                               ; preds = %6
  %19 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %16
  store i32 0, i32 addrspace(3)* %19, align 4, !tbaa !5
  br label %20

20:                                               ; preds = %18, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp slt i32 %10, %2
  %22 = icmp slt i32 %14, %3
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %644

24:                                               ; preds = %20
  %25 = mul nsw i32 %14, %2
  %26 = add nsw i32 %25, %10
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %27, i32 0
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !9, !amdgpu.noclobber !11
  %30 = zext i8 %29 to i32
  %31 = mul nuw nsw i32 %30, 299
  %32 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %27, i32 1
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !12, !amdgpu.noclobber !11
  %34 = zext i8 %33 to i32
  %35 = mul nuw nsw i32 %34, 587
  %36 = add nuw nsw i32 %35, %31
  %37 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %27, i32 2
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !13, !amdgpu.noclobber !11
  %39 = zext i8 %38 to i32
  %40 = mul nuw nsw i32 %39, 114
  %41 = add nuw nsw i32 %36, %40
  %42 = udiv i32 %41, 1000
  %43 = trunc i32 %42 to i8
  %44 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %13, i32 %9
  store i8 %43, i8 addrspace(3)* %44, align 1, !tbaa !14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = add nsw i32 %2, -2
  %46 = icmp slt i32 %10, %45
  %47 = add nsw i32 %3, -2
  %48 = icmp slt i32 %14, %47
  %49 = select i1 %46, i1 %48, i1 false
  br i1 %49, label %50, label %568

50:                                               ; preds = %24
  %51 = icmp ult i32 %13, 32
  %52 = icmp ult i32 %9, 32
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %57

54:                                               ; preds = %50
  %55 = load i8, i8 addrspace(3)* %44, align 1, !tbaa !14
  %56 = zext i8 %55 to i32
  br label %70

57:                                               ; preds = %50
  %58 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !9, !amdgpu.noclobber !11
  %59 = zext i8 %58 to i32
  %60 = mul nuw nsw i32 %59, 299
  %61 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !12, !amdgpu.noclobber !11
  %62 = zext i8 %61 to i32
  %63 = mul nuw nsw i32 %62, 587
  %64 = add nuw nsw i32 %63, %60
  %65 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !13, !amdgpu.noclobber !11
  %66 = zext i8 %65 to i32
  %67 = mul nuw nsw i32 %66, 114
  %68 = add nuw nsw i32 %64, %67
  %69 = udiv i32 %68, 1000
  br label %70

70:                                               ; preds = %54, %57
  %71 = phi i32 [ %56, %54 ], [ %69, %57 ]
  %72 = sitofp i32 %71 to float
  %73 = add nuw nsw i32 %9, 1
  %74 = add nsw i32 %10, 1
  %75 = icmp ult i32 %9, 31
  %76 = select i1 %51, i1 %75, i1 false
  br i1 %76, label %95, label %77

77:                                               ; preds = %70
  %78 = add nsw i32 %74, %25
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %79, i32 0
  %81 = load i8, i8 addrspace(1)* %80, align 1, !tbaa !9, !amdgpu.noclobber !11
  %82 = zext i8 %81 to i32
  %83 = mul nuw nsw i32 %82, 299
  %84 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %79, i32 1
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !12, !amdgpu.noclobber !11
  %86 = zext i8 %85 to i32
  %87 = mul nuw nsw i32 %86, 587
  %88 = add nuw nsw i32 %87, %83
  %89 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %79, i32 2
  %90 = load i8, i8 addrspace(1)* %89, align 1, !tbaa !13, !amdgpu.noclobber !11
  %91 = zext i8 %90 to i32
  %92 = mul nuw nsw i32 %91, 114
  %93 = add nuw nsw i32 %88, %92
  %94 = udiv i32 %93, 1000
  br label %99

95:                                               ; preds = %70
  %96 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %13, i32 %73
  %97 = load i8, i8 addrspace(3)* %96, align 1, !tbaa !14
  %98 = zext i8 %97 to i32
  br label %99

99:                                               ; preds = %95, %77
  %100 = phi i32 [ %98, %95 ], [ %94, %77 ]
  %101 = sitofp i32 %100 to float
  %102 = fadd contract float %72, %101
  %103 = add nuw nsw i32 %9, 2
  %104 = add nsw i32 %10, 2
  %105 = icmp ult i32 %9, 30
  %106 = select i1 %51, i1 %105, i1 false
  br i1 %106, label %125, label %107

107:                                              ; preds = %99
  %108 = add nsw i32 %104, %25
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %109, i32 0
  %111 = load i8, i8 addrspace(1)* %110, align 1, !tbaa !9, !amdgpu.noclobber !11
  %112 = zext i8 %111 to i32
  %113 = mul nuw nsw i32 %112, 299
  %114 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %109, i32 1
  %115 = load i8, i8 addrspace(1)* %114, align 1, !tbaa !12, !amdgpu.noclobber !11
  %116 = zext i8 %115 to i32
  %117 = mul nuw nsw i32 %116, 587
  %118 = add nuw nsw i32 %117, %113
  %119 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %109, i32 2
  %120 = load i8, i8 addrspace(1)* %119, align 1, !tbaa !13, !amdgpu.noclobber !11
  %121 = zext i8 %120 to i32
  %122 = mul nuw nsw i32 %121, 114
  %123 = add nuw nsw i32 %118, %122
  %124 = udiv i32 %123, 1000
  br label %129

125:                                              ; preds = %99
  %126 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %13, i32 %103
  %127 = load i8, i8 addrspace(3)* %126, align 1, !tbaa !14
  %128 = zext i8 %127 to i32
  br label %129

129:                                              ; preds = %125, %107
  %130 = phi i32 [ %128, %125 ], [ %124, %107 ]
  %131 = sitofp i32 %130 to float
  %132 = fadd contract float %102, %131
  %133 = add nuw nsw i32 %13, 1
  %134 = add nsw i32 %14, 1
  %135 = icmp ult i32 %13, 31
  %136 = mul nsw i32 %134, %2
  %137 = select i1 %135, i1 %52, i1 false
  br i1 %137, label %156, label %138

138:                                              ; preds = %129
  %139 = add nsw i32 %10, %136
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %140, i32 0
  %142 = load i8, i8 addrspace(1)* %141, align 1, !tbaa !9, !amdgpu.noclobber !11
  %143 = zext i8 %142 to i32
  %144 = mul nuw nsw i32 %143, 299
  %145 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %140, i32 1
  %146 = load i8, i8 addrspace(1)* %145, align 1, !tbaa !12, !amdgpu.noclobber !11
  %147 = zext i8 %146 to i32
  %148 = mul nuw nsw i32 %147, 587
  %149 = add nuw nsw i32 %148, %144
  %150 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %140, i32 2
  %151 = load i8, i8 addrspace(1)* %150, align 1, !tbaa !13, !amdgpu.noclobber !11
  %152 = zext i8 %151 to i32
  %153 = mul nuw nsw i32 %152, 114
  %154 = add nuw nsw i32 %149, %153
  %155 = udiv i32 %154, 1000
  br label %160

156:                                              ; preds = %129
  %157 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %133, i32 %9
  %158 = load i8, i8 addrspace(3)* %157, align 1, !tbaa !14
  %159 = zext i8 %158 to i32
  br label %160

160:                                              ; preds = %156, %138
  %161 = phi i32 [ %159, %156 ], [ %155, %138 ]
  %162 = sitofp i32 %161 to float
  %163 = fadd contract float %132, %162
  %164 = select i1 %135, i1 %75, i1 false
  br i1 %164, label %183, label %165

165:                                              ; preds = %160
  %166 = add nsw i32 %74, %136
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %167, i32 0
  %169 = load i8, i8 addrspace(1)* %168, align 1, !tbaa !9, !amdgpu.noclobber !11
  %170 = zext i8 %169 to i32
  %171 = mul nuw nsw i32 %170, 299
  %172 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %167, i32 1
  %173 = load i8, i8 addrspace(1)* %172, align 1, !tbaa !12, !amdgpu.noclobber !11
  %174 = zext i8 %173 to i32
  %175 = mul nuw nsw i32 %174, 587
  %176 = add nuw nsw i32 %175, %171
  %177 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %167, i32 2
  %178 = load i8, i8 addrspace(1)* %177, align 1, !tbaa !13, !amdgpu.noclobber !11
  %179 = zext i8 %178 to i32
  %180 = mul nuw nsw i32 %179, 114
  %181 = add nuw nsw i32 %176, %180
  %182 = udiv i32 %181, 1000
  br label %187

183:                                              ; preds = %160
  %184 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %133, i32 %73
  %185 = load i8, i8 addrspace(3)* %184, align 1, !tbaa !14
  %186 = zext i8 %185 to i32
  br label %187

187:                                              ; preds = %183, %165
  %188 = phi i32 [ %186, %183 ], [ %182, %165 ]
  %189 = sitofp i32 %188 to float
  %190 = fadd contract float %163, %189
  %191 = select i1 %135, i1 %105, i1 false
  br i1 %191, label %210, label %192

192:                                              ; preds = %187
  %193 = add nsw i32 %104, %136
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %194, i32 0
  %196 = load i8, i8 addrspace(1)* %195, align 1, !tbaa !9, !amdgpu.noclobber !11
  %197 = zext i8 %196 to i32
  %198 = mul nuw nsw i32 %197, 299
  %199 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %194, i32 1
  %200 = load i8, i8 addrspace(1)* %199, align 1, !tbaa !12, !amdgpu.noclobber !11
  %201 = zext i8 %200 to i32
  %202 = mul nuw nsw i32 %201, 587
  %203 = add nuw nsw i32 %202, %198
  %204 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %194, i32 2
  %205 = load i8, i8 addrspace(1)* %204, align 1, !tbaa !13, !amdgpu.noclobber !11
  %206 = zext i8 %205 to i32
  %207 = mul nuw nsw i32 %206, 114
  %208 = add nuw nsw i32 %203, %207
  %209 = udiv i32 %208, 1000
  br label %214

210:                                              ; preds = %187
  %211 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %133, i32 %103
  %212 = load i8, i8 addrspace(3)* %211, align 1, !tbaa !14
  %213 = zext i8 %212 to i32
  br label %214

214:                                              ; preds = %210, %192
  %215 = phi i32 [ %213, %210 ], [ %209, %192 ]
  %216 = sitofp i32 %215 to float
  %217 = fadd contract float %190, %216
  %218 = add nuw nsw i32 %13, 2
  %219 = add nsw i32 %14, 2
  %220 = icmp ult i32 %13, 30
  %221 = mul nsw i32 %219, %2
  %222 = select i1 %220, i1 %52, i1 false
  br i1 %222, label %241, label %223

223:                                              ; preds = %214
  %224 = add nsw i32 %10, %221
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %225, i32 0
  %227 = load i8, i8 addrspace(1)* %226, align 1, !tbaa !9, !amdgpu.noclobber !11
  %228 = zext i8 %227 to i32
  %229 = mul nuw nsw i32 %228, 299
  %230 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %225, i32 1
  %231 = load i8, i8 addrspace(1)* %230, align 1, !tbaa !12, !amdgpu.noclobber !11
  %232 = zext i8 %231 to i32
  %233 = mul nuw nsw i32 %232, 587
  %234 = add nuw nsw i32 %233, %229
  %235 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %225, i32 2
  %236 = load i8, i8 addrspace(1)* %235, align 1, !tbaa !13, !amdgpu.noclobber !11
  %237 = zext i8 %236 to i32
  %238 = mul nuw nsw i32 %237, 114
  %239 = add nuw nsw i32 %234, %238
  %240 = udiv i32 %239, 1000
  br label %245

241:                                              ; preds = %214
  %242 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %218, i32 %9
  %243 = load i8, i8 addrspace(3)* %242, align 1, !tbaa !14
  %244 = zext i8 %243 to i32
  br label %245

245:                                              ; preds = %241, %223
  %246 = phi i32 [ %244, %241 ], [ %240, %223 ]
  %247 = sitofp i32 %246 to float
  %248 = fadd contract float %217, %247
  %249 = select i1 %220, i1 %75, i1 false
  br i1 %249, label %268, label %250

250:                                              ; preds = %245
  %251 = add nsw i32 %74, %221
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %252, i32 0
  %254 = load i8, i8 addrspace(1)* %253, align 1, !tbaa !9, !amdgpu.noclobber !11
  %255 = zext i8 %254 to i32
  %256 = mul nuw nsw i32 %255, 299
  %257 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %252, i32 1
  %258 = load i8, i8 addrspace(1)* %257, align 1, !tbaa !12, !amdgpu.noclobber !11
  %259 = zext i8 %258 to i32
  %260 = mul nuw nsw i32 %259, 587
  %261 = add nuw nsw i32 %260, %256
  %262 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %252, i32 2
  %263 = load i8, i8 addrspace(1)* %262, align 1, !tbaa !13, !amdgpu.noclobber !11
  %264 = zext i8 %263 to i32
  %265 = mul nuw nsw i32 %264, 114
  %266 = add nuw nsw i32 %261, %265
  %267 = udiv i32 %266, 1000
  br label %272

268:                                              ; preds = %245
  %269 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %218, i32 %73
  %270 = load i8, i8 addrspace(3)* %269, align 1, !tbaa !14
  %271 = zext i8 %270 to i32
  br label %272

272:                                              ; preds = %268, %250
  %273 = phi i32 [ %271, %268 ], [ %267, %250 ]
  %274 = sitofp i32 %273 to float
  %275 = fadd contract float %248, %274
  %276 = select i1 %220, i1 %105, i1 false
  br i1 %276, label %295, label %277

277:                                              ; preds = %272
  %278 = add nsw i32 %104, %221
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %279, i32 0
  %281 = load i8, i8 addrspace(1)* %280, align 1, !tbaa !9, !amdgpu.noclobber !11
  %282 = zext i8 %281 to i32
  %283 = mul nuw nsw i32 %282, 299
  %284 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %279, i32 1
  %285 = load i8, i8 addrspace(1)* %284, align 1, !tbaa !12, !amdgpu.noclobber !11
  %286 = zext i8 %285 to i32
  %287 = mul nuw nsw i32 %286, 587
  %288 = add nuw nsw i32 %287, %283
  %289 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %279, i32 2
  %290 = load i8, i8 addrspace(1)* %289, align 1, !tbaa !13, !amdgpu.noclobber !11
  %291 = zext i8 %290 to i32
  %292 = mul nuw nsw i32 %291, 114
  %293 = add nuw nsw i32 %288, %292
  %294 = udiv i32 %293, 1000
  br label %299

295:                                              ; preds = %272
  %296 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %218, i32 %103
  %297 = load i8, i8 addrspace(3)* %296, align 1, !tbaa !14
  %298 = zext i8 %297 to i32
  br label %299

299:                                              ; preds = %295, %277
  %300 = phi i32 [ %298, %295 ], [ %294, %277 ]
  %301 = sitofp i32 %300 to float
  %302 = fadd contract float %275, %301
  %303 = fdiv contract float %302, 9.000000e+00
  %304 = fpext float %303 to double
  br i1 %53, label %305, label %309

305:                                              ; preds = %299
  %306 = load i8, i8 addrspace(3)* %44, align 1, !tbaa !14
  %307 = uitofp i8 %306 to double
  %308 = fcmp contract ult double %307, %304
  br label %324

309:                                              ; preds = %299
  %310 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !9, !amdgpu.noclobber !11
  %311 = zext i8 %310 to i32
  %312 = mul nuw nsw i32 %311, 299
  %313 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !12, !amdgpu.noclobber !11
  %314 = zext i8 %313 to i32
  %315 = mul nuw nsw i32 %314, 587
  %316 = add nuw nsw i32 %315, %312
  %317 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !13, !amdgpu.noclobber !11
  %318 = zext i8 %317 to i32
  %319 = mul nuw nsw i32 %318, 114
  %320 = add nuw nsw i32 %316, %319
  %321 = udiv i32 %320, 1000
  %322 = sitofp i32 %321 to float
  %323 = fcmp contract ugt float %303, %322
  br label %324

324:                                              ; preds = %305, %309
  %325 = phi i1 [ %308, %305 ], [ %323, %309 ]
  %326 = select i1 %325, i32 0, i32 256
  br i1 %76, label %347, label %327

327:                                              ; preds = %324
  %328 = add nsw i32 %74, %25
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %329, i32 0
  %331 = load i8, i8 addrspace(1)* %330, align 1, !tbaa !9, !amdgpu.noclobber !11
  %332 = zext i8 %331 to i32
  %333 = mul nuw nsw i32 %332, 299
  %334 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %329, i32 1
  %335 = load i8, i8 addrspace(1)* %334, align 1, !tbaa !12, !amdgpu.noclobber !11
  %336 = zext i8 %335 to i32
  %337 = mul nuw nsw i32 %336, 587
  %338 = add nuw nsw i32 %337, %333
  %339 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %329, i32 2
  %340 = load i8, i8 addrspace(1)* %339, align 1, !tbaa !13, !amdgpu.noclobber !11
  %341 = zext i8 %340 to i32
  %342 = mul nuw nsw i32 %341, 114
  %343 = add nuw nsw i32 %338, %342
  %344 = udiv i32 %343, 1000
  %345 = sitofp i32 %344 to float
  %346 = fcmp contract ugt float %303, %345
  br label %352

347:                                              ; preds = %324
  %348 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %13, i32 %73
  %349 = load i8, i8 addrspace(3)* %348, align 1, !tbaa !14
  %350 = uitofp i8 %349 to double
  %351 = fcmp contract ult double %350, %304
  br label %352

352:                                              ; preds = %347, %327
  %353 = phi i1 [ %351, %347 ], [ %346, %327 ]
  %354 = select i1 %353, i32 0, i32 128
  %355 = or i32 %354, %326
  br i1 %106, label %376, label %356

356:                                              ; preds = %352
  %357 = add nsw i32 %104, %25
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %358, i32 0
  %360 = load i8, i8 addrspace(1)* %359, align 1, !tbaa !9, !amdgpu.noclobber !11
  %361 = zext i8 %360 to i32
  %362 = mul nuw nsw i32 %361, 299
  %363 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %358, i32 1
  %364 = load i8, i8 addrspace(1)* %363, align 1, !tbaa !12, !amdgpu.noclobber !11
  %365 = zext i8 %364 to i32
  %366 = mul nuw nsw i32 %365, 587
  %367 = add nuw nsw i32 %366, %362
  %368 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %358, i32 2
  %369 = load i8, i8 addrspace(1)* %368, align 1, !tbaa !13, !amdgpu.noclobber !11
  %370 = zext i8 %369 to i32
  %371 = mul nuw nsw i32 %370, 114
  %372 = add nuw nsw i32 %367, %371
  %373 = udiv i32 %372, 1000
  %374 = sitofp i32 %373 to float
  %375 = fcmp contract ugt float %303, %374
  br label %381

376:                                              ; preds = %352
  %377 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %13, i32 %103
  %378 = load i8, i8 addrspace(3)* %377, align 1, !tbaa !14
  %379 = uitofp i8 %378 to double
  %380 = fcmp contract ult double %379, %304
  br label %381

381:                                              ; preds = %376, %356
  %382 = phi i1 [ %380, %376 ], [ %375, %356 ]
  %383 = select i1 %382, i32 0, i32 64
  %384 = or i32 %383, %355
  br i1 %137, label %405, label %385

385:                                              ; preds = %381
  %386 = add nsw i32 %10, %136
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %387, i32 0
  %389 = load i8, i8 addrspace(1)* %388, align 1, !tbaa !9, !amdgpu.noclobber !11
  %390 = zext i8 %389 to i32
  %391 = mul nuw nsw i32 %390, 299
  %392 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %387, i32 1
  %393 = load i8, i8 addrspace(1)* %392, align 1, !tbaa !12, !amdgpu.noclobber !11
  %394 = zext i8 %393 to i32
  %395 = mul nuw nsw i32 %394, 587
  %396 = add nuw nsw i32 %395, %391
  %397 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %387, i32 2
  %398 = load i8, i8 addrspace(1)* %397, align 1, !tbaa !13, !amdgpu.noclobber !11
  %399 = zext i8 %398 to i32
  %400 = mul nuw nsw i32 %399, 114
  %401 = add nuw nsw i32 %396, %400
  %402 = udiv i32 %401, 1000
  %403 = sitofp i32 %402 to float
  %404 = fcmp contract ugt float %303, %403
  br label %410

405:                                              ; preds = %381
  %406 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %133, i32 %9
  %407 = load i8, i8 addrspace(3)* %406, align 1, !tbaa !14
  %408 = uitofp i8 %407 to double
  %409 = fcmp contract ult double %408, %304
  br label %410

410:                                              ; preds = %405, %385
  %411 = phi i1 [ %409, %405 ], [ %404, %385 ]
  %412 = select i1 %411, i32 0, i32 32
  %413 = or i32 %412, %384
  br i1 %164, label %434, label %414

414:                                              ; preds = %410
  %415 = add nsw i32 %74, %136
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %416, i32 0
  %418 = load i8, i8 addrspace(1)* %417, align 1, !tbaa !9, !amdgpu.noclobber !11
  %419 = zext i8 %418 to i32
  %420 = mul nuw nsw i32 %419, 299
  %421 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %416, i32 1
  %422 = load i8, i8 addrspace(1)* %421, align 1, !tbaa !12, !amdgpu.noclobber !11
  %423 = zext i8 %422 to i32
  %424 = mul nuw nsw i32 %423, 587
  %425 = add nuw nsw i32 %424, %420
  %426 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %416, i32 2
  %427 = load i8, i8 addrspace(1)* %426, align 1, !tbaa !13, !amdgpu.noclobber !11
  %428 = zext i8 %427 to i32
  %429 = mul nuw nsw i32 %428, 114
  %430 = add nuw nsw i32 %425, %429
  %431 = udiv i32 %430, 1000
  %432 = sitofp i32 %431 to float
  %433 = fcmp contract ugt float %303, %432
  br label %439

434:                                              ; preds = %410
  %435 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %133, i32 %73
  %436 = load i8, i8 addrspace(3)* %435, align 1, !tbaa !14
  %437 = uitofp i8 %436 to double
  %438 = fcmp contract ult double %437, %304
  br label %439

439:                                              ; preds = %434, %414
  %440 = phi i1 [ %438, %434 ], [ %433, %414 ]
  %441 = select i1 %440, i32 0, i32 16
  %442 = or i32 %441, %413
  br i1 %191, label %463, label %443

443:                                              ; preds = %439
  %444 = add nsw i32 %104, %136
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %445, i32 0
  %447 = load i8, i8 addrspace(1)* %446, align 1, !tbaa !9, !amdgpu.noclobber !11
  %448 = zext i8 %447 to i32
  %449 = mul nuw nsw i32 %448, 299
  %450 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %445, i32 1
  %451 = load i8, i8 addrspace(1)* %450, align 1, !tbaa !12, !amdgpu.noclobber !11
  %452 = zext i8 %451 to i32
  %453 = mul nuw nsw i32 %452, 587
  %454 = add nuw nsw i32 %453, %449
  %455 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %445, i32 2
  %456 = load i8, i8 addrspace(1)* %455, align 1, !tbaa !13, !amdgpu.noclobber !11
  %457 = zext i8 %456 to i32
  %458 = mul nuw nsw i32 %457, 114
  %459 = add nuw nsw i32 %454, %458
  %460 = udiv i32 %459, 1000
  %461 = sitofp i32 %460 to float
  %462 = fcmp contract ugt float %303, %461
  br label %468

463:                                              ; preds = %439
  %464 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %133, i32 %103
  %465 = load i8, i8 addrspace(3)* %464, align 1, !tbaa !14
  %466 = uitofp i8 %465 to double
  %467 = fcmp contract ult double %466, %304
  br label %468

468:                                              ; preds = %463, %443
  %469 = phi i1 [ %467, %463 ], [ %462, %443 ]
  %470 = select i1 %469, i32 0, i32 8
  %471 = or i32 %470, %442
  br i1 %222, label %492, label %472

472:                                              ; preds = %468
  %473 = add nsw i32 %10, %221
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %474, i32 0
  %476 = load i8, i8 addrspace(1)* %475, align 1, !tbaa !9, !amdgpu.noclobber !11
  %477 = zext i8 %476 to i32
  %478 = mul nuw nsw i32 %477, 299
  %479 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %474, i32 1
  %480 = load i8, i8 addrspace(1)* %479, align 1, !tbaa !12, !amdgpu.noclobber !11
  %481 = zext i8 %480 to i32
  %482 = mul nuw nsw i32 %481, 587
  %483 = add nuw nsw i32 %482, %478
  %484 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %474, i32 2
  %485 = load i8, i8 addrspace(1)* %484, align 1, !tbaa !13, !amdgpu.noclobber !11
  %486 = zext i8 %485 to i32
  %487 = mul nuw nsw i32 %486, 114
  %488 = add nuw nsw i32 %483, %487
  %489 = udiv i32 %488, 1000
  %490 = sitofp i32 %489 to float
  %491 = fcmp contract ugt float %303, %490
  br label %497

492:                                              ; preds = %468
  %493 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %218, i32 %9
  %494 = load i8, i8 addrspace(3)* %493, align 1, !tbaa !14
  %495 = uitofp i8 %494 to double
  %496 = fcmp contract ult double %495, %304
  br label %497

497:                                              ; preds = %492, %472
  %498 = phi i1 [ %496, %492 ], [ %491, %472 ]
  %499 = select i1 %498, i32 0, i32 4
  %500 = or i32 %499, %471
  br i1 %249, label %521, label %501

501:                                              ; preds = %497
  %502 = add nsw i32 %74, %221
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %503, i32 0
  %505 = load i8, i8 addrspace(1)* %504, align 1, !tbaa !9, !amdgpu.noclobber !11
  %506 = zext i8 %505 to i32
  %507 = mul nuw nsw i32 %506, 299
  %508 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %503, i32 1
  %509 = load i8, i8 addrspace(1)* %508, align 1, !tbaa !12, !amdgpu.noclobber !11
  %510 = zext i8 %509 to i32
  %511 = mul nuw nsw i32 %510, 587
  %512 = add nuw nsw i32 %511, %507
  %513 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %503, i32 2
  %514 = load i8, i8 addrspace(1)* %513, align 1, !tbaa !13, !amdgpu.noclobber !11
  %515 = zext i8 %514 to i32
  %516 = mul nuw nsw i32 %515, 114
  %517 = add nuw nsw i32 %512, %516
  %518 = udiv i32 %517, 1000
  %519 = sitofp i32 %518 to float
  %520 = fcmp contract ugt float %303, %519
  br label %526

521:                                              ; preds = %497
  %522 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %218, i32 %73
  %523 = load i8, i8 addrspace(3)* %522, align 1, !tbaa !14
  %524 = uitofp i8 %523 to double
  %525 = fcmp contract ult double %524, %304
  br label %526

526:                                              ; preds = %521, %501
  %527 = phi i1 [ %525, %521 ], [ %520, %501 ]
  %528 = select i1 %527, i32 0, i32 2
  %529 = or i32 %528, %500
  br i1 %276, label %550, label %530

530:                                              ; preds = %526
  %531 = add nsw i32 %104, %221
  %532 = sext i32 %531 to i64
  %533 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %532, i32 0
  %534 = load i8, i8 addrspace(1)* %533, align 1, !tbaa !9, !amdgpu.noclobber !11
  %535 = zext i8 %534 to i32
  %536 = mul nuw nsw i32 %535, 299
  %537 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %532, i32 1
  %538 = load i8, i8 addrspace(1)* %537, align 1, !tbaa !12, !amdgpu.noclobber !11
  %539 = zext i8 %538 to i32
  %540 = mul nuw nsw i32 %539, 587
  %541 = add nuw nsw i32 %540, %536
  %542 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %1, i64 %532, i32 2
  %543 = load i8, i8 addrspace(1)* %542, align 1, !tbaa !13, !amdgpu.noclobber !11
  %544 = zext i8 %543 to i32
  %545 = mul nuw nsw i32 %544, 114
  %546 = add nuw nsw i32 %541, %545
  %547 = udiv i32 %546, 1000
  %548 = sitofp i32 %547 to float
  %549 = fcmp contract ole float %303, %548
  br label %555

550:                                              ; preds = %526
  %551 = getelementptr inbounds [32 x [32 x i8]], [32 x [32 x i8]] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE16image_cp_private, i32 0, i32 %218, i32 %103
  %552 = load i8, i8 addrspace(3)* %551, align 1, !tbaa !14
  %553 = uitofp i8 %552 to double
  %554 = fcmp contract oge double %553, %304
  br label %555

555:                                              ; preds = %550, %530
  %556 = phi i1 [ %549, %530 ], [ %554, %550 ]
  %557 = zext i1 %556 to i32
  %558 = or i32 %529, %557
  %559 = mul nsw i32 %45, %14
  %560 = add nsw i32 %559, %10
  %561 = trunc i32 %558 to i8
  %562 = sext i32 %560 to i64
  %563 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %0, i64 %562, i32 1
  store i8 %561, i8 addrspace(1)* %563, align 1, !tbaa !12
  %564 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %0, i64 %562, i32 2
  store i8 %561, i8 addrspace(1)* %564, align 1, !tbaa !13
  %565 = getelementptr inbounds %struct.PPMPixel, %struct.PPMPixel addrspace(1)* %0, i64 %562, i32 0
  store i8 %561, i8 addrspace(1)* %565, align 1, !tbaa !9
  %566 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %558
  %567 = atomicrmw add i32 addrspace(3)* %566, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %568

568:                                              ; preds = %555, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %569 = icmp eq i32 %16, 0
  %570 = icmp sgt i32 %5, 0
  %571 = select i1 %569, i1 %570, i1 false
  br i1 %571, label %572, label %644

572:                                              ; preds = %568
  %573 = and i32 %5, 7
  %574 = icmp ult i32 %5, 8
  br i1 %574, label %630, label %575

575:                                              ; preds = %572
  %576 = and i32 %5, -8
  br label %577

577:                                              ; preds = %577, %575
  %578 = phi i32 [ 0, %575 ], [ %627, %577 ]
  %579 = phi i32 [ 0, %575 ], [ %628, %577 ]
  %580 = zext i32 %578 to i64
  %581 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %580
  %582 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %578
  %583 = load i32, i32 addrspace(3)* %582, align 16, !tbaa !5
  %584 = atomicrmw add i32 addrspace(1)* %581, i32 %583 syncscope("agent-one-as") monotonic, align 4
  %585 = or i32 %578, 1
  %586 = zext i32 %585 to i64
  %587 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %586
  %588 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %585
  %589 = load i32, i32 addrspace(3)* %588, align 4, !tbaa !5
  %590 = atomicrmw add i32 addrspace(1)* %587, i32 %589 syncscope("agent-one-as") monotonic, align 4
  %591 = or i32 %578, 2
  %592 = zext i32 %591 to i64
  %593 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %592
  %594 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %591
  %595 = load i32, i32 addrspace(3)* %594, align 8, !tbaa !5
  %596 = atomicrmw add i32 addrspace(1)* %593, i32 %595 syncscope("agent-one-as") monotonic, align 4
  %597 = or i32 %578, 3
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %598
  %600 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %597
  %601 = load i32, i32 addrspace(3)* %600, align 4, !tbaa !5
  %602 = atomicrmw add i32 addrspace(1)* %599, i32 %601 syncscope("agent-one-as") monotonic, align 4
  %603 = or i32 %578, 4
  %604 = zext i32 %603 to i64
  %605 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %604
  %606 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %603
  %607 = load i32, i32 addrspace(3)* %606, align 16, !tbaa !5
  %608 = atomicrmw add i32 addrspace(1)* %605, i32 %607 syncscope("agent-one-as") monotonic, align 4
  %609 = or i32 %578, 5
  %610 = zext i32 %609 to i64
  %611 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %610
  %612 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %609
  %613 = load i32, i32 addrspace(3)* %612, align 4, !tbaa !5
  %614 = atomicrmw add i32 addrspace(1)* %611, i32 %613 syncscope("agent-one-as") monotonic, align 4
  %615 = or i32 %578, 6
  %616 = zext i32 %615 to i64
  %617 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %616
  %618 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %615
  %619 = load i32, i32 addrspace(3)* %618, align 8, !tbaa !5
  %620 = atomicrmw add i32 addrspace(1)* %617, i32 %619 syncscope("agent-one-as") monotonic, align 4
  %621 = or i32 %578, 7
  %622 = zext i32 %621 to i64
  %623 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %622
  %624 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %621
  %625 = load i32, i32 addrspace(3)* %624, align 4, !tbaa !5
  %626 = atomicrmw add i32 addrspace(1)* %623, i32 %625 syncscope("agent-one-as") monotonic, align 4
  %627 = add nuw nsw i32 %578, 8
  %628 = add i32 %579, 8
  %629 = icmp eq i32 %628, %576
  br i1 %629, label %630, label %577, !llvm.loop !15

630:                                              ; preds = %577, %572
  %631 = phi i32 [ 0, %572 ], [ %627, %577 ]
  %632 = icmp eq i32 %573, 0
  br i1 %632, label %644, label %633

633:                                              ; preds = %630, %633
  %634 = phi i32 [ %641, %633 ], [ %631, %630 ]
  %635 = phi i32 [ %642, %633 ], [ 0, %630 ]
  %636 = zext i32 %634 to i64
  %637 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %636
  %638 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ12mod_CENTRISTP8PPMPixelS0_iiPiiE12hist_private, i32 0, i32 %634
  %639 = load i32, i32 addrspace(3)* %638, align 4, !tbaa !5
  %640 = atomicrmw add i32 addrspace(1)* %637, i32 %639 syncscope("agent-one-as") monotonic, align 4
  %641 = add nuw nsw i32 %634, 1
  %642 = add i32 %635, 1
  %643 = icmp eq i32 %642, %573
  br i1 %643, label %644, label %633, !llvm.loop !17

644:                                              ; preds = %630, %633, %568, %20
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !7, i64 0}
!10 = !{!"_ZTS8PPMPixel", !7, i64 0, !7, i64 1, !7, i64 2}
!11 = !{}
!12 = !{!10, !7, i64 1}
!13 = !{!10, !7, i64 2}
!14 = !{!7, !7, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
