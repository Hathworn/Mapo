; ModuleID = '../data/hip_kernels/3190/3/main.cu'
source_filename = "../data/hip_kernels/3190/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z14windowBlackmanPfi(float addrspace(1)* nocapture writeonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = icmp slt i32 %11, %1
  br i1 %12, label %13, label %309

13:                                               ; preds = %2
  %14 = sitofp i32 %11 to float
  %15 = fmul contract float %14, 0x401921FA00000000
  %16 = add nsw i32 %1, -1
  %17 = sitofp i32 %16 to float
  %18 = fdiv contract float %15, %17
  %19 = tail call float @llvm.fabs.f32(float %18)
  %20 = fcmp olt float %19, 1.310720e+05
  br i1 %20, label %21, label %28

21:                                               ; preds = %13
  %22 = fmul float %19, 0x3FE45F3060000000
  %23 = tail call float @llvm.rint.f32(float %22)
  %24 = tail call float @llvm.fma.f32(float %23, float 0xBFF921FB40000000, float %19)
  %25 = tail call float @llvm.fma.f32(float %23, float 0xBE74442D00000000, float %24)
  %26 = tail call float @llvm.fma.f32(float %23, float 0xBCF8469880000000, float %25)
  %27 = fptosi float %23 to i32
  br label %134

28:                                               ; preds = %13
  %29 = bitcast float %19 to i32
  %30 = lshr i32 %29, 23
  %31 = and i32 %29, 8388607
  %32 = or i32 %31, 8388608
  %33 = zext i32 %32 to i64
  %34 = mul nuw nsw i64 %33, 4266746795
  %35 = trunc i64 %34 to i32
  %36 = lshr i64 %34, 32
  %37 = mul nuw nsw i64 %33, 1011060801
  %38 = add nuw nsw i64 %36, %37
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %38, 32
  %41 = mul nuw nsw i64 %33, 3680671129
  %42 = add nuw nsw i64 %40, %41
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = mul nuw nsw i64 %33, 4113882560
  %46 = add nuw nsw i64 %44, %45
  %47 = trunc i64 %46 to i32
  %48 = lshr i64 %46, 32
  %49 = mul nuw nsw i64 %33, 4230436817
  %50 = add nuw nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  %52 = lshr i64 %50, 32
  %53 = mul nuw nsw i64 %33, 1313084713
  %54 = add nuw nsw i64 %52, %53
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %54, 32
  %57 = mul nuw nsw i64 %33, 2734261102
  %58 = add nuw nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = trunc i64 %60 to i32
  %62 = add nsw i32 %30, -120
  %63 = icmp ugt i32 %62, 63
  %64 = select i1 %63, i32 %55, i32 %61
  %65 = select i1 %63, i32 %51, i32 %59
  %66 = select i1 %63, i32 %47, i32 %55
  %67 = select i1 %63, i32 %43, i32 %51
  %68 = select i1 %63, i32 %39, i32 %47
  %69 = select i1 %63, i32 %35, i32 %43
  %70 = select i1 %63, i32 -64, i32 0
  %71 = add nsw i32 %70, %62
  %72 = icmp ugt i32 %71, 31
  %73 = select i1 %72, i32 %65, i32 %64
  %74 = select i1 %72, i32 %66, i32 %65
  %75 = select i1 %72, i32 %67, i32 %66
  %76 = select i1 %72, i32 %68, i32 %67
  %77 = select i1 %72, i32 %69, i32 %68
  %78 = select i1 %72, i32 -32, i32 0
  %79 = add nsw i32 %78, %71
  %80 = icmp ugt i32 %79, 31
  %81 = select i1 %80, i32 %74, i32 %73
  %82 = select i1 %80, i32 %75, i32 %74
  %83 = select i1 %80, i32 %76, i32 %75
  %84 = select i1 %80, i32 %77, i32 %76
  %85 = select i1 %80, i32 -32, i32 0
  %86 = add nsw i32 %85, %79
  %87 = icmp eq i32 %86, 0
  %88 = sub nsw i32 32, %86
  %89 = tail call i32 @llvm.fshr.i32(i32 %81, i32 %82, i32 %88)
  %90 = tail call i32 @llvm.fshr.i32(i32 %82, i32 %83, i32 %88)
  %91 = tail call i32 @llvm.fshr.i32(i32 %83, i32 %84, i32 %88)
  %92 = select i1 %87, i32 %81, i32 %89
  %93 = select i1 %87, i32 %82, i32 %90
  %94 = select i1 %87, i32 %83, i32 %91
  %95 = lshr i32 %92, 29
  %96 = tail call i32 @llvm.fshl.i32(i32 %92, i32 %93, i32 2)
  %97 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %94, i32 2)
  %98 = tail call i32 @llvm.fshl.i32(i32 %94, i32 %84, i32 2)
  %99 = and i32 %95, 1
  %100 = sub nsw i32 0, %99
  %101 = shl i32 %95, 31
  %102 = xor i32 %96, %100
  %103 = xor i32 %97, %100
  %104 = xor i32 %98, %100
  %105 = tail call i32 @llvm.ctlz.i32(i32 %102, i1 false), !range !7
  %106 = sub nsw i32 31, %105
  %107 = tail call i32 @llvm.fshr.i32(i32 %102, i32 %103, i32 %106)
  %108 = tail call i32 @llvm.fshr.i32(i32 %103, i32 %104, i32 %106)
  %109 = shl nuw nsw i32 %105, 23
  %110 = sub nuw nsw i32 1056964608, %109
  %111 = lshr i32 %107, 9
  %112 = or i32 %111, %110
  %113 = or i32 %112, %101
  %114 = bitcast i32 %113 to float
  %115 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %108, i32 23)
  %116 = tail call i32 @llvm.ctlz.i32(i32 %115, i1 false), !range !7
  %117 = fmul float %114, 0x3FF921FB40000000
  %118 = add nuw nsw i32 %116, %105
  %119 = shl nuw nsw i32 %118, 23
  %120 = sub nuw nsw i32 855638016, %119
  %121 = sub nsw i32 31, %116
  %122 = tail call i32 @llvm.fshr.i32(i32 %115, i32 %108, i32 %121)
  %123 = lshr i32 %122, 9
  %124 = or i32 %120, %123
  %125 = or i32 %124, %101
  %126 = bitcast i32 %125 to float
  %127 = fneg float %117
  %128 = tail call float @llvm.fma.f32(float %114, float 0x3FF921FB40000000, float %127)
  %129 = tail call float @llvm.fma.f32(float %114, float 0x3E74442D00000000, float %128)
  %130 = tail call float @llvm.fma.f32(float %126, float 0x3FF921FB40000000, float %129)
  %131 = fadd float %117, %130
  %132 = lshr i32 %92, 30
  %133 = add nuw nsw i32 %99, %132
  br label %134

134:                                              ; preds = %21, %28
  %135 = phi float [ %26, %21 ], [ %131, %28 ]
  %136 = phi i32 [ %27, %21 ], [ %133, %28 ]
  %137 = fmul float %135, %135
  %138 = tail call float @llvm.fmuladd.f32(float %137, float 0xBF29833040000000, float 0x3F81103880000000)
  %139 = tail call float @llvm.fmuladd.f32(float %137, float %138, float 0xBFC55553A0000000)
  %140 = fmul float %137, %139
  %141 = tail call float @llvm.fmuladd.f32(float %135, float %140, float %135)
  %142 = tail call float @llvm.fmuladd.f32(float %137, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %143 = tail call float @llvm.fmuladd.f32(float %137, float %142, float 0x3FA5557EE0000000)
  %144 = tail call float @llvm.fmuladd.f32(float %137, float %143, float 0xBFE0000080000000)
  %145 = tail call float @llvm.fmuladd.f32(float %137, float %144, float 1.000000e+00)
  %146 = fneg float %141
  %147 = and i32 %136, 1
  %148 = icmp eq i32 %147, 0
  %149 = select i1 %148, float %145, float %146
  %150 = bitcast float %149 to i32
  %151 = shl i32 %136, 30
  %152 = and i32 %151, -2147483648
  %153 = xor i32 %152, %150
  %154 = bitcast i32 %153 to float
  %155 = tail call i1 @llvm.amdgcn.class.f32(float %19, i32 504)
  %156 = fpext float %154 to double
  %157 = fmul contract double %156, -1.850000e-01
  %158 = select i1 %155, double %157, double 0x7FF8000000000000
  %159 = fmul contract float %14, 0x402921FA00000000
  %160 = fdiv contract float %159, %17
  %161 = tail call float @llvm.fabs.f32(float %160)
  %162 = fcmp olt float %161, 1.310720e+05
  br i1 %162, label %163, label %171

163:                                              ; preds = %134
  %164 = fmul float %161, 0x3FE45F3060000000
  %165 = tail call float @llvm.rint.f32(float %164)
  %166 = tail call float @llvm.fma.f32(float %165, float 0xBFF921FB40000000, float %161)
  %167 = tail call float @llvm.fma.f32(float %165, float 0xBE74442D00000000, float %166)
  %168 = tail call float @llvm.fma.f32(float %165, float 0xBCF8469880000000, float %167)
  %169 = fptosi float %165 to i32
  %170 = bitcast float %161 to i32
  br label %277

171:                                              ; preds = %134
  %172 = bitcast float %161 to i32
  %173 = lshr i32 %172, 23
  %174 = and i32 %172, 8388607
  %175 = or i32 %174, 8388608
  %176 = zext i32 %175 to i64
  %177 = mul nuw nsw i64 %176, 4266746795
  %178 = trunc i64 %177 to i32
  %179 = lshr i64 %177, 32
  %180 = mul nuw nsw i64 %176, 1011060801
  %181 = add nuw nsw i64 %179, %180
  %182 = trunc i64 %181 to i32
  %183 = lshr i64 %181, 32
  %184 = mul nuw nsw i64 %176, 3680671129
  %185 = add nuw nsw i64 %183, %184
  %186 = trunc i64 %185 to i32
  %187 = lshr i64 %185, 32
  %188 = mul nuw nsw i64 %176, 4113882560
  %189 = add nuw nsw i64 %187, %188
  %190 = trunc i64 %189 to i32
  %191 = lshr i64 %189, 32
  %192 = mul nuw nsw i64 %176, 4230436817
  %193 = add nuw nsw i64 %191, %192
  %194 = trunc i64 %193 to i32
  %195 = lshr i64 %193, 32
  %196 = mul nuw nsw i64 %176, 1313084713
  %197 = add nuw nsw i64 %195, %196
  %198 = trunc i64 %197 to i32
  %199 = lshr i64 %197, 32
  %200 = mul nuw nsw i64 %176, 2734261102
  %201 = add nuw nsw i64 %199, %200
  %202 = trunc i64 %201 to i32
  %203 = lshr i64 %201, 32
  %204 = trunc i64 %203 to i32
  %205 = add nsw i32 %173, -120
  %206 = icmp ugt i32 %205, 63
  %207 = select i1 %206, i32 %198, i32 %204
  %208 = select i1 %206, i32 %194, i32 %202
  %209 = select i1 %206, i32 %190, i32 %198
  %210 = select i1 %206, i32 %186, i32 %194
  %211 = select i1 %206, i32 %182, i32 %190
  %212 = select i1 %206, i32 %178, i32 %186
  %213 = select i1 %206, i32 -64, i32 0
  %214 = add nsw i32 %213, %205
  %215 = icmp ugt i32 %214, 31
  %216 = select i1 %215, i32 %208, i32 %207
  %217 = select i1 %215, i32 %209, i32 %208
  %218 = select i1 %215, i32 %210, i32 %209
  %219 = select i1 %215, i32 %211, i32 %210
  %220 = select i1 %215, i32 %212, i32 %211
  %221 = select i1 %215, i32 -32, i32 0
  %222 = add nsw i32 %221, %214
  %223 = icmp ugt i32 %222, 31
  %224 = select i1 %223, i32 %217, i32 %216
  %225 = select i1 %223, i32 %218, i32 %217
  %226 = select i1 %223, i32 %219, i32 %218
  %227 = select i1 %223, i32 %220, i32 %219
  %228 = select i1 %223, i32 -32, i32 0
  %229 = add nsw i32 %228, %222
  %230 = icmp eq i32 %229, 0
  %231 = sub nsw i32 32, %229
  %232 = tail call i32 @llvm.fshr.i32(i32 %224, i32 %225, i32 %231)
  %233 = tail call i32 @llvm.fshr.i32(i32 %225, i32 %226, i32 %231)
  %234 = tail call i32 @llvm.fshr.i32(i32 %226, i32 %227, i32 %231)
  %235 = select i1 %230, i32 %224, i32 %232
  %236 = select i1 %230, i32 %225, i32 %233
  %237 = select i1 %230, i32 %226, i32 %234
  %238 = lshr i32 %235, 29
  %239 = tail call i32 @llvm.fshl.i32(i32 %235, i32 %236, i32 2)
  %240 = tail call i32 @llvm.fshl.i32(i32 %236, i32 %237, i32 2)
  %241 = tail call i32 @llvm.fshl.i32(i32 %237, i32 %227, i32 2)
  %242 = and i32 %238, 1
  %243 = sub nsw i32 0, %242
  %244 = shl i32 %238, 31
  %245 = xor i32 %239, %243
  %246 = xor i32 %240, %243
  %247 = xor i32 %241, %243
  %248 = tail call i32 @llvm.ctlz.i32(i32 %245, i1 false), !range !7
  %249 = sub nsw i32 31, %248
  %250 = tail call i32 @llvm.fshr.i32(i32 %245, i32 %246, i32 %249)
  %251 = tail call i32 @llvm.fshr.i32(i32 %246, i32 %247, i32 %249)
  %252 = shl nuw nsw i32 %248, 23
  %253 = sub nuw nsw i32 1056964608, %252
  %254 = lshr i32 %250, 9
  %255 = or i32 %254, %253
  %256 = or i32 %255, %244
  %257 = bitcast i32 %256 to float
  %258 = tail call i32 @llvm.fshl.i32(i32 %250, i32 %251, i32 23)
  %259 = tail call i32 @llvm.ctlz.i32(i32 %258, i1 false), !range !7
  %260 = fmul float %257, 0x3FF921FB40000000
  %261 = add nuw nsw i32 %259, %248
  %262 = shl nuw nsw i32 %261, 23
  %263 = sub nuw nsw i32 855638016, %262
  %264 = sub nsw i32 31, %259
  %265 = tail call i32 @llvm.fshr.i32(i32 %258, i32 %251, i32 %264)
  %266 = lshr i32 %265, 9
  %267 = or i32 %263, %266
  %268 = or i32 %267, %244
  %269 = bitcast i32 %268 to float
  %270 = fneg float %260
  %271 = tail call float @llvm.fma.f32(float %257, float 0x3FF921FB40000000, float %270)
  %272 = tail call float @llvm.fma.f32(float %257, float 0x3E74442D00000000, float %271)
  %273 = tail call float @llvm.fma.f32(float %269, float 0x3FF921FB40000000, float %272)
  %274 = fadd float %260, %273
  %275 = lshr i32 %235, 30
  %276 = add nuw nsw i32 %242, %275
  br label %277

277:                                              ; preds = %163, %171
  %278 = phi i32 [ %170, %163 ], [ %172, %171 ]
  %279 = phi float [ %168, %163 ], [ %274, %171 ]
  %280 = phi i32 [ %169, %163 ], [ %276, %171 ]
  %281 = fmul float %279, %279
  %282 = tail call float @llvm.fmuladd.f32(float %281, float 0xBF29833040000000, float 0x3F81103880000000)
  %283 = tail call float @llvm.fmuladd.f32(float %281, float %282, float 0xBFC55553A0000000)
  %284 = fmul float %281, %283
  %285 = tail call float @llvm.fmuladd.f32(float %279, float %284, float %279)
  %286 = tail call float @llvm.fmuladd.f32(float %281, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %287 = tail call float @llvm.fmuladd.f32(float %281, float %286, float 0x3FA5557EE0000000)
  %288 = tail call float @llvm.fmuladd.f32(float %281, float %287, float 0xBFE0000080000000)
  %289 = tail call float @llvm.fmuladd.f32(float %281, float %288, float 1.000000e+00)
  %290 = and i32 %280, 1
  %291 = icmp eq i32 %290, 0
  %292 = select i1 %291, float %285, float %289
  %293 = bitcast float %292 to i32
  %294 = shl i32 %280, 30
  %295 = and i32 %294, -2147483648
  %296 = bitcast float %160 to i32
  %297 = xor i32 %278, %296
  %298 = xor i32 %297, %295
  %299 = xor i32 %298, %293
  %300 = bitcast i32 %299 to float
  %301 = tail call i1 @llvm.amdgcn.class.f32(float %161, i32 504)
  %302 = fpext float %300 to double
  %303 = fmul contract double %302, 8.000000e-02
  %304 = select i1 %301, double %303, double 0x7FF8000000000000
  %305 = fadd contract double %158, %304
  %306 = fptrunc double %305 to float
  %307 = sext i32 %11 to i64
  %308 = getelementptr inbounds float, float addrspace(1)* %0, i64 %307
  store float %306, float addrspace(1)* %308, align 4, !tbaa !8
  br label %309

309:                                              ; preds = %277, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
