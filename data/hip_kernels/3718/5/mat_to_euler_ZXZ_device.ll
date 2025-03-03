; ModuleID = '../data/hip_kernels/3718/5/main.cu'
source_filename = "../data/hip_kernels/3718/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }

@tcExpData = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture undef, align 8
@tfG = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.0 undef, align 8

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16mat_to_euler_ZXZPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %292

14:                                               ; preds = %3
  %15 = mul nsw i32 %12, 9
  %16 = add nsw i32 %15, 8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = fcmp contract ogt float %19, 0x3FEFFFFFC0000000
  br i1 %20, label %21, label %72

21:                                               ; preds = %14
  %22 = mul nsw i32 %12, 3
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  store float 0.000000e+00, float addrspace(1)* %24, align 4, !tbaa !7
  %25 = add nsw i32 %22, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float 0.000000e+00, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = add nsw i32 %15, 3
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %32 = sext i32 %15 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = tail call float @llvm.fabs.f32(float %34)
  %36 = tail call float @llvm.fabs.f32(float %31)
  %37 = tail call float @llvm.minnum.f32(float %35, float %36)
  %38 = tail call float @llvm.maxnum.f32(float %35, float %36)
  %39 = fdiv float %37, %38, !fpmath !11
  %40 = fmul float %39, %39
  %41 = tail call float @llvm.fmuladd.f32(float %40, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %42 = tail call float @llvm.fmuladd.f32(float %40, float %41, float 0x3FA53F67E0000000)
  %43 = tail call float @llvm.fmuladd.f32(float %40, float %42, float 0xBFB2FA9AE0000000)
  %44 = tail call float @llvm.fmuladd.f32(float %40, float %43, float 0x3FBB263640000000)
  %45 = tail call float @llvm.fmuladd.f32(float %40, float %44, float 0xBFC22C1CC0000000)
  %46 = tail call float @llvm.fmuladd.f32(float %40, float %45, float 0x3FC99717E0000000)
  %47 = tail call float @llvm.fmuladd.f32(float %40, float %46, float 0xBFD5554C40000000)
  %48 = fmul float %40, %47
  %49 = tail call float @llvm.fmuladd.f32(float %39, float %48, float %39)
  %50 = fsub float 0x3FF921FB60000000, %49
  %51 = fcmp ogt float %36, %35
  %52 = select i1 %51, float %50, float %49
  %53 = fsub float 0x400921FB60000000, %52
  %54 = fcmp olt float %34, 0.000000e+00
  %55 = select i1 %54, float %53, float %52
  %56 = bitcast float %34 to i32
  %57 = icmp slt i32 %56, 0
  %58 = select i1 %57, float 0x400921FB60000000, float 0.000000e+00
  %59 = fcmp oeq float %31, 0.000000e+00
  %60 = select i1 %59, float %58, float %55
  %61 = select i1 %54, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %62 = fcmp oeq float %35, 0x7FF0000000000000
  %63 = fcmp oeq float %36, 0x7FF0000000000000
  %64 = and i1 %63, %62
  %65 = select i1 %64, float %61, float %60
  %66 = fcmp uno float %34, %31
  %67 = select i1 %66, float 0x7FF8000000000000, float %65
  %68 = tail call float @llvm.copysign.f32(float %67, float %31)
  %69 = add nsw i32 %22, 2
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  store float %68, float addrspace(1)* %71, align 4, !tbaa !7
  br label %292

72:                                               ; preds = %14
  %73 = fcmp contract olt float %19, 0xBFEFFFFFC0000000
  br i1 %73, label %74, label %125

74:                                               ; preds = %72
  %75 = mul nsw i32 %12, 3
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  store float 0.000000e+00, float addrspace(1)* %77, align 4, !tbaa !7
  %78 = add nsw i32 %75, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  store float 0x400921FB60000000, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = add nsw i32 %15, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = sext i32 %15 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = tail call float @llvm.fabs.f32(float %87)
  %89 = tail call float @llvm.fabs.f32(float %84)
  %90 = tail call float @llvm.minnum.f32(float %88, float %89)
  %91 = tail call float @llvm.maxnum.f32(float %88, float %89)
  %92 = fdiv float %90, %91, !fpmath !11
  %93 = fmul float %92, %92
  %94 = tail call float @llvm.fmuladd.f32(float %93, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %95 = tail call float @llvm.fmuladd.f32(float %93, float %94, float 0x3FA53F67E0000000)
  %96 = tail call float @llvm.fmuladd.f32(float %93, float %95, float 0xBFB2FA9AE0000000)
  %97 = tail call float @llvm.fmuladd.f32(float %93, float %96, float 0x3FBB263640000000)
  %98 = tail call float @llvm.fmuladd.f32(float %93, float %97, float 0xBFC22C1CC0000000)
  %99 = tail call float @llvm.fmuladd.f32(float %93, float %98, float 0x3FC99717E0000000)
  %100 = tail call float @llvm.fmuladd.f32(float %93, float %99, float 0xBFD5554C40000000)
  %101 = fmul float %93, %100
  %102 = tail call float @llvm.fmuladd.f32(float %92, float %101, float %92)
  %103 = fsub float 0x3FF921FB60000000, %102
  %104 = fcmp ogt float %89, %88
  %105 = select i1 %104, float %103, float %102
  %106 = fsub float 0x400921FB60000000, %105
  %107 = fcmp olt float %87, 0.000000e+00
  %108 = select i1 %107, float %106, float %105
  %109 = bitcast float %87 to i32
  %110 = icmp slt i32 %109, 0
  %111 = select i1 %110, float 0x400921FB60000000, float 0.000000e+00
  %112 = fcmp oeq float %84, 0.000000e+00
  %113 = select i1 %112, float %111, float %108
  %114 = select i1 %107, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %115 = fcmp oeq float %88, 0x7FF0000000000000
  %116 = fcmp oeq float %89, 0x7FF0000000000000
  %117 = and i1 %116, %115
  %118 = select i1 %117, float %114, float %113
  %119 = fcmp uno float %87, %84
  %120 = select i1 %119, float 0x7FF8000000000000, float %118
  %121 = tail call float @llvm.copysign.f32(float %120, float %84)
  %122 = add nsw i32 %75, 2
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  store float %121, float addrspace(1)* %124, align 4, !tbaa !7
  br label %292

125:                                              ; preds = %72
  %126 = add nsw i32 %15, 2
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = add nsw i32 %15, 5
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = fneg contract float %133
  %135 = tail call float @llvm.fabs.f32(float %134)
  %136 = tail call float @llvm.fabs.f32(float %129)
  %137 = tail call float @llvm.minnum.f32(float %135, float %136)
  %138 = tail call float @llvm.maxnum.f32(float %135, float %136)
  %139 = fdiv float %137, %138, !fpmath !11
  %140 = fmul float %139, %139
  %141 = tail call float @llvm.fmuladd.f32(float %140, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %142 = tail call float @llvm.fmuladd.f32(float %140, float %141, float 0x3FA53F67E0000000)
  %143 = tail call float @llvm.fmuladd.f32(float %140, float %142, float 0xBFB2FA9AE0000000)
  %144 = tail call float @llvm.fmuladd.f32(float %140, float %143, float 0x3FBB263640000000)
  %145 = tail call float @llvm.fmuladd.f32(float %140, float %144, float 0xBFC22C1CC0000000)
  %146 = tail call float @llvm.fmuladd.f32(float %140, float %145, float 0x3FC99717E0000000)
  %147 = tail call float @llvm.fmuladd.f32(float %140, float %146, float 0xBFD5554C40000000)
  %148 = fmul float %140, %147
  %149 = tail call float @llvm.fmuladd.f32(float %139, float %148, float %139)
  %150 = fsub float 0x3FF921FB60000000, %149
  %151 = fcmp ogt float %136, %135
  %152 = select i1 %151, float %150, float %149
  %153 = fsub float 0x400921FB60000000, %152
  %154 = fcmp ogt float %133, 0.000000e+00
  %155 = select i1 %154, float %153, float %152
  %156 = bitcast float %134 to i32
  %157 = icmp slt i32 %156, 0
  %158 = select i1 %157, float 0x400921FB60000000, float 0.000000e+00
  %159 = fcmp oeq float %129, 0.000000e+00
  %160 = select i1 %159, float %158, float %155
  %161 = select i1 %154, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %162 = fcmp oeq float %135, 0x7FF0000000000000
  %163 = fcmp oeq float %136, 0x7FF0000000000000
  %164 = and i1 %163, %162
  %165 = select i1 %164, float %161, float %160
  %166 = fcmp uno float %129, %134
  %167 = select i1 %166, float 0x7FF8000000000000, float %165
  %168 = tail call float @llvm.copysign.f32(float %167, float %129)
  %169 = mul nsw i32 %12, 3
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  store float %168, float addrspace(1)* %171, align 4, !tbaa !7
  %172 = add nsw i32 %15, 6
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %0, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7
  %176 = fmul contract float %175, %175
  %177 = add nsw i32 %15, 7
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !7
  %181 = fmul contract float %180, %180
  %182 = fadd contract float %176, %181
  %183 = fcmp olt float %182, 0x39F0000000000000
  %184 = select i1 %183, float 0x41F0000000000000, float 1.000000e+00
  %185 = fmul float %182, %184
  %186 = tail call float @llvm.sqrt.f32(float %185)
  %187 = bitcast float %186 to i32
  %188 = add nsw i32 %187, -1
  %189 = bitcast i32 %188 to float
  %190 = add nsw i32 %187, 1
  %191 = bitcast i32 %190 to float
  %192 = tail call i1 @llvm.amdgcn.class.f32(float %185, i32 608)
  %193 = select i1 %183, float 0x3EF0000000000000, float 1.000000e+00
  %194 = fneg float %191
  %195 = tail call float @llvm.fma.f32(float %194, float %186, float %185)
  %196 = fcmp ogt float %195, 0.000000e+00
  %197 = fneg float %189
  %198 = tail call float @llvm.fma.f32(float %197, float %186, float %185)
  %199 = fcmp ole float %198, 0.000000e+00
  %200 = select i1 %199, float %189, float %186
  %201 = select i1 %196, float %191, float %200
  %202 = fmul float %193, %201
  %203 = select i1 %192, float %185, float %202
  %204 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %205 = tail call float @llvm.fabs.f32(float %204)
  %206 = tail call float @llvm.fabs.f32(float %203)
  %207 = tail call float @llvm.minnum.f32(float %205, float %206)
  %208 = tail call float @llvm.maxnum.f32(float %205, float %206)
  %209 = fdiv float %207, %208, !fpmath !11
  %210 = fmul float %209, %209
  %211 = tail call float @llvm.fmuladd.f32(float %210, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %212 = tail call float @llvm.fmuladd.f32(float %210, float %211, float 0x3FA53F67E0000000)
  %213 = tail call float @llvm.fmuladd.f32(float %210, float %212, float 0xBFB2FA9AE0000000)
  %214 = tail call float @llvm.fmuladd.f32(float %210, float %213, float 0x3FBB263640000000)
  %215 = tail call float @llvm.fmuladd.f32(float %210, float %214, float 0xBFC22C1CC0000000)
  %216 = tail call float @llvm.fmuladd.f32(float %210, float %215, float 0x3FC99717E0000000)
  %217 = tail call float @llvm.fmuladd.f32(float %210, float %216, float 0xBFD5554C40000000)
  %218 = fmul float %210, %217
  %219 = tail call float @llvm.fmuladd.f32(float %209, float %218, float %209)
  %220 = fsub float 0x3FF921FB60000000, %219
  %221 = fcmp ogt float %206, %205
  %222 = select i1 %221, float %220, float %219
  %223 = fsub float 0x400921FB60000000, %222
  %224 = fcmp olt float %204, 0.000000e+00
  %225 = select i1 %224, float %223, float %222
  %226 = bitcast float %204 to i32
  %227 = icmp slt i32 %226, 0
  %228 = select i1 %227, float 0x400921FB60000000, float 0.000000e+00
  %229 = fcmp oeq float %203, 0.000000e+00
  %230 = select i1 %229, float %228, float %225
  %231 = select i1 %224, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %232 = fcmp oeq float %205, 0x7FF0000000000000
  %233 = fcmp oeq float %206, 0x7FF0000000000000
  %234 = and i1 %232, %233
  %235 = select i1 %234, float %231, float %230
  %236 = fcmp uno float %204, %203
  %237 = select i1 %236, float 0x7FF8000000000000, float %235
  %238 = tail call float @llvm.copysign.f32(float %237, float %203)
  %239 = add nsw i32 %169, 1
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %1, i64 %240
  store float %238, float addrspace(1)* %241, align 4, !tbaa !7
  %242 = load float, float addrspace(1)* %174, align 4, !tbaa !7
  %243 = load float, float addrspace(1)* %179, align 4, !tbaa !7
  %244 = tail call float @llvm.fabs.f32(float %243)
  %245 = tail call float @llvm.fabs.f32(float %242)
  %246 = tail call float @llvm.minnum.f32(float %244, float %245)
  %247 = tail call float @llvm.maxnum.f32(float %244, float %245)
  %248 = fdiv float %246, %247, !fpmath !11
  %249 = fmul float %248, %248
  %250 = tail call float @llvm.fmuladd.f32(float %249, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %251 = tail call float @llvm.fmuladd.f32(float %249, float %250, float 0x3FA53F67E0000000)
  %252 = tail call float @llvm.fmuladd.f32(float %249, float %251, float 0xBFB2FA9AE0000000)
  %253 = tail call float @llvm.fmuladd.f32(float %249, float %252, float 0x3FBB263640000000)
  %254 = tail call float @llvm.fmuladd.f32(float %249, float %253, float 0xBFC22C1CC0000000)
  %255 = tail call float @llvm.fmuladd.f32(float %249, float %254, float 0x3FC99717E0000000)
  %256 = tail call float @llvm.fmuladd.f32(float %249, float %255, float 0xBFD5554C40000000)
  %257 = fmul float %249, %256
  %258 = tail call float @llvm.fmuladd.f32(float %248, float %257, float %248)
  %259 = fsub float 0x3FF921FB60000000, %258
  %260 = fcmp ogt float %245, %244
  %261 = select i1 %260, float %259, float %258
  %262 = fsub float 0x400921FB60000000, %261
  %263 = fcmp olt float %243, 0.000000e+00
  %264 = select i1 %263, float %262, float %261
  %265 = bitcast float %243 to i32
  %266 = icmp slt i32 %265, 0
  %267 = select i1 %266, float 0x400921FB60000000, float 0.000000e+00
  %268 = fcmp oeq float %242, 0.000000e+00
  %269 = select i1 %268, float %267, float %264
  %270 = select i1 %263, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %271 = fcmp oeq float %244, 0x7FF0000000000000
  %272 = fcmp oeq float %245, 0x7FF0000000000000
  %273 = and i1 %272, %271
  %274 = select i1 %273, float %270, float %269
  %275 = fcmp uno float %243, %242
  %276 = select i1 %275, float 0x7FF8000000000000, float %274
  %277 = tail call float @llvm.copysign.f32(float %276, float %242)
  %278 = add nsw i32 %169, 2
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds float, float addrspace(1)* %1, i64 %279
  store float %277, float addrspace(1)* %280, align 4, !tbaa !7
  %281 = fcmp contract olt float %168, 0.000000e+00
  br i1 %281, label %282, label %284

282:                                              ; preds = %125
  %283 = fadd contract float %168, 0x401921FB60000000
  store float %283, float addrspace(1)* %171, align 4, !tbaa !7
  br label %284

284:                                              ; preds = %282, %125
  %285 = fcmp contract olt float %238, 0.000000e+00
  br i1 %285, label %286, label %288

286:                                              ; preds = %284
  %287 = fadd contract float %238, 0x401921FB60000000
  store float %287, float addrspace(1)* %241, align 4, !tbaa !7
  br label %288

288:                                              ; preds = %286, %284
  %289 = fcmp contract olt float %277, 0.000000e+00
  br i1 %289, label %290, label %292

290:                                              ; preds = %288
  %291 = fadd contract float %277, 0x401921FB60000000
  store float %291, float addrspace(1)* %280, align 4, !tbaa !7
  br label %292

292:                                              ; preds = %21, %288, %290, %74, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{float 2.500000e+00}
