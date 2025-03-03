; ModuleID = '../data/hip_kernels/3007/132/main.cu'
source_filename = "../data/hip_kernels/3007/132/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9ge_lgammaiiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %0
  %27 = icmp slt i32 %25, %1
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %339

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fcmp olt float %36, 1.562500e-02
  br i1 %37, label %38, label %57

38:                                               ; preds = %29
  %39 = tail call float @llvm.fmuladd.f32(float %36, float 0x3FD1513220000000, float 0xBFD9A4D560000000)
  %40 = tail call float @llvm.fmuladd.f32(float %36, float %39, float 0x3FEA51A660000000)
  %41 = tail call float @llvm.fmuladd.f32(float %36, float %40, float 0xBFE2788D00000000)
  %42 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 144)
  %43 = select i1 %42, float 0x41F0000000000000, float 1.000000e+00
  %44 = fmul float %36, %43
  %45 = tail call float @llvm.log2.f32(float %44)
  %46 = fmul float %45, 0x3FE62E42E0000000
  %47 = tail call i1 @llvm.amdgcn.class.f32(float %45, i32 519)
  %48 = fneg float %46
  %49 = tail call float @llvm.fma.f32(float %45, float 0x3FE62E42E0000000, float %48)
  %50 = tail call float @llvm.fma.f32(float %45, float 0x3E6EFA39E0000000, float %49)
  %51 = fadd float %46, %50
  %52 = select i1 %47, float %45, float %51
  %53 = select i1 %42, float 0x40362E4300000000, float 0.000000e+00
  %54 = fsub float %52, %53
  %55 = fneg float %54
  %56 = tail call float @llvm.fmuladd.f32(float %36, float %41, float %55)
  br label %251

57:                                               ; preds = %29
  %58 = fcmp olt float %36, 2.000000e+00
  br i1 %58, label %59, label %153

59:                                               ; preds = %57
  %60 = fcmp ugt float %36, 0x3FECCCCCC0000000
  br i1 %60, label %84, label %61

61:                                               ; preds = %59
  %62 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 144)
  %63 = select i1 %62, float 0x41F0000000000000, float 1.000000e+00
  %64 = fmul float %36, %63
  %65 = tail call float @llvm.log2.f32(float %64)
  %66 = fmul float %65, 0x3FE62E42E0000000
  %67 = tail call i1 @llvm.amdgcn.class.f32(float %65, i32 519)
  %68 = fneg float %66
  %69 = tail call float @llvm.fma.f32(float %65, float 0x3FE62E42E0000000, float %68)
  %70 = tail call float @llvm.fma.f32(float %65, float 0x3E6EFA39E0000000, float %69)
  %71 = fadd float %66, %70
  %72 = select i1 %67, float %65, float %71
  %73 = select i1 %62, float 0x40362E4300000000, float 0.000000e+00
  %74 = fsub float %72, %73
  %75 = fneg float %74
  %76 = fsub float 1.000000e+00, %36
  %77 = fcmp olt float %36, 0x3FE7694460000000
  %78 = fadd float %36, 0xBFDD8B6180000000
  %79 = select i1 %77, float %78, float %76
  %80 = zext i1 %77 to i32
  %81 = fcmp olt float %36, 0x3FCDA66120000000
  %82 = select i1 %81, float %36, float %79
  %83 = select i1 %81, i32 2, i32 %80
  br label %95

84:                                               ; preds = %59
  %85 = fsub float 2.000000e+00, %36
  %86 = fcmp olt float %36, 0x3FFBB4A240000000
  %87 = fadd float %36, 0xBFF762D860000000
  %88 = select i1 %86, float %87, float %85
  %89 = select i1 %86, float 1.000000e+00, float %85
  %90 = fptosi float %89 to i32
  %91 = fcmp olt float %36, 0x3FF3AE1480000000
  %92 = fadd float %36, -1.000000e+00
  %93 = select i1 %91, float %92, float %88
  %94 = select i1 %91, i32 2, i32 %90
  br label %95

95:                                               ; preds = %84, %61
  %96 = phi float [ %82, %61 ], [ %93, %84 ]
  %97 = phi i32 [ %83, %61 ], [ %94, %84 ]
  %98 = phi float [ %75, %61 ], [ 0.000000e+00, %84 ]
  switch i32 %97, label %251 [
    i32 0, label %99
    i32 1, label %115
    i32 2, label %137
  ]

99:                                               ; preds = %95
  %100 = fmul float %96, %96
  %101 = tail call float @llvm.fmuladd.f32(float %100, float 0x3EFA707440000000, float 0x3F2CF2ECE0000000)
  %102 = tail call float @llvm.fmuladd.f32(float %100, float %101, float 0x3F538A9420000000)
  %103 = tail call float @llvm.fmuladd.f32(float %100, float %102, float 0x3F7E404FC0000000)
  %104 = tail call float @llvm.fmuladd.f32(float %100, float %103, float 0x3FB13E0020000000)
  %105 = tail call float @llvm.fmuladd.f32(float %100, float %104, float 0x3FB3C467E0000000)
  %106 = tail call float @llvm.fmuladd.f32(float %100, float 0x3F07858EA0000000, float 0x3F1C5088A0000000)
  %107 = tail call float @llvm.fmuladd.f32(float %100, float %106, float 0x3F40B6C680000000)
  %108 = tail call float @llvm.fmuladd.f32(float %100, float %107, float 0x3F67ADD8C0000000)
  %109 = tail call float @llvm.fmuladd.f32(float %100, float %108, float 0x3F951322A0000000)
  %110 = tail call float @llvm.fmuladd.f32(float %100, float %109, float 0x3FD4A34CC0000000)
  %111 = fmul float %100, %110
  %112 = tail call float @llvm.fmuladd.f32(float %96, float %105, float %111)
  %113 = tail call float @llvm.fmuladd.f32(float %96, float -5.000000e-01, float %112)
  %114 = fadd float %98, %113
  br label %251

115:                                              ; preds = %95
  %116 = fmul float %96, %96
  %117 = fmul float %96, %116
  %118 = tail call float @llvm.fmuladd.f32(float %117, float 0x3F34AF6D60000000, float 0xBF56FE8EC0000000)
  %119 = tail call float @llvm.fmuladd.f32(float %117, float %118, float 0x3F78FCE0E0000000)
  %120 = tail call float @llvm.fmuladd.f32(float %117, float %119, float 0xBFA0C9A8E0000000)
  %121 = tail call float @llvm.fmuladd.f32(float %117, float %120, float 0x3FDEF72BC0000000)
  %122 = tail call float @llvm.fmuladd.f32(float %117, float 0xBF347F24E0000000, float 0x3F4CDF0CE0000000)
  %123 = tail call float @llvm.fmuladd.f32(float %117, float %122, float 0xBF6E2EFFC0000000)
  %124 = tail call float @llvm.fmuladd.f32(float %117, float %123, float 0x3F9266E7A0000000)
  %125 = tail call float @llvm.fmuladd.f32(float %117, float %124, float 0xBFC2E42780000000)
  %126 = tail call float @llvm.fmuladd.f32(float %117, float 0x3F35FD3EE0000000, float 0xBF41A610A0000000)
  %127 = tail call float @llvm.fmuladd.f32(float %117, float %126, float 0x3F6282D320000000)
  %128 = tail call float @llvm.fmuladd.f32(float %117, float %127, float 0xBF851F9FC0000000)
  %129 = tail call float @llvm.fmuladd.f32(float %117, float %128, float 0x3FB08B42A0000000)
  %130 = tail call float @llvm.fmuladd.f32(float %96, float %129, float %125)
  %131 = fneg float %130
  %132 = tail call float @llvm.fmuladd.f32(float %117, float %131, float 0xBC50C7CAA0000000)
  %133 = fneg float %132
  %134 = tail call float @llvm.fmuladd.f32(float %116, float %121, float %133)
  %135 = fadd float %134, 0xBFBF19B9C0000000
  %136 = fadd float %98, %135
  br label %251

137:                                              ; preds = %95
  %138 = tail call float @llvm.fmuladd.f32(float %96, float 0x3F8B678BC0000000, float 0x3FCD4EAF00000000)
  %139 = tail call float @llvm.fmuladd.f32(float %96, float %138, float 0x3FEF497640000000)
  %140 = tail call float @llvm.fmuladd.f32(float %96, float %139, float 0x3FF7475CE0000000)
  %141 = tail call float @llvm.fmuladd.f32(float %96, float %140, float 0x3FE4401E80000000)
  %142 = tail call float @llvm.fmuladd.f32(float %96, float %141, float 0xBFB3C467E0000000)
  %143 = fmul float %96, %142
  %144 = tail call float @llvm.fmuladd.f32(float %96, float 0x3F6A5ABB60000000, float 0x3FBAAE55E0000000)
  %145 = tail call float @llvm.fmuladd.f32(float %96, float %144, float 0x3FE89DFBE0000000)
  %146 = tail call float @llvm.fmuladd.f32(float %96, float %145, float 0x40010725A0000000)
  %147 = tail call float @llvm.fmuladd.f32(float %96, float %146, float 0x4003A5D7C0000000)
  %148 = tail call float @llvm.fmuladd.f32(float %96, float %147, float 1.000000e+00)
  %149 = tail call float @llvm.amdgcn.rcp.f32(float %148)
  %150 = fmul float %143, %149
  %151 = tail call float @llvm.fmuladd.f32(float %96, float -5.000000e-01, float %150)
  %152 = fadd float %98, %151
  br label %251

153:                                              ; preds = %57
  %154 = fcmp olt float %36, 8.000000e+00
  br i1 %154, label %155, label %208

155:                                              ; preds = %153
  %156 = fptosi float %36 to i32
  %157 = sitofp i32 %156 to float
  %158 = fsub float %36, %157
  %159 = tail call float @llvm.fmuladd.f32(float %158, float 0x3F00BFECE0000000, float 0x3F5E26B680000000)
  %160 = tail call float @llvm.fmuladd.f32(float %158, float %159, float 0x3F9B481C80000000)
  %161 = tail call float @llvm.fmuladd.f32(float %158, float %160, float 0x3FC2BB9CC0000000)
  %162 = tail call float @llvm.fmuladd.f32(float %158, float %161, float 0x3FD4D98F40000000)
  %163 = tail call float @llvm.fmuladd.f32(float %158, float %162, float 0x3FCB848B40000000)
  %164 = tail call float @llvm.fmuladd.f32(float %158, float %163, float 0xBFB3C467E0000000)
  %165 = fmul float %158, %164
  %166 = tail call float @llvm.fmuladd.f32(float %158, float 0x3EDEBAF7A0000000, float 0x3F497DDAC0000000)
  %167 = tail call float @llvm.fmuladd.f32(float %158, float %166, float 0x3F9317EA80000000)
  %168 = tail call float @llvm.fmuladd.f32(float %158, float %167, float 0x3FC601EDC0000000)
  %169 = tail call float @llvm.fmuladd.f32(float %158, float %168, float 0x3FE71A18A0000000)
  %170 = tail call float @llvm.fmuladd.f32(float %158, float %169, float 0x3FF645A760000000)
  %171 = tail call float @llvm.fmuladd.f32(float %158, float %170, float 1.000000e+00)
  %172 = tail call float @llvm.amdgcn.rcp.f32(float %171)
  %173 = fmul float %165, %172
  %174 = tail call float @llvm.fmuladd.f32(float %158, float 5.000000e-01, float %173)
  %175 = fadd float %158, 2.000000e+00
  %176 = fadd float %158, 3.000000e+00
  %177 = fadd float %158, 4.000000e+00
  %178 = fadd float %158, 5.000000e+00
  %179 = fadd float %158, 6.000000e+00
  %180 = icmp sgt i32 %156, 2
  %181 = select i1 %180, float %175, float 1.000000e+00
  %182 = icmp sgt i32 %156, 3
  %183 = select i1 %182, float %176, float 1.000000e+00
  %184 = fmul float %181, %183
  %185 = icmp sgt i32 %156, 4
  %186 = select i1 %185, float %177, float 1.000000e+00
  %187 = fmul float %186, %184
  %188 = icmp sgt i32 %156, 5
  %189 = select i1 %188, float %178, float 1.000000e+00
  %190 = fmul float %189, %187
  %191 = icmp sgt i32 %156, 6
  %192 = select i1 %191, float %179, float 1.000000e+00
  %193 = fmul float %192, %190
  %194 = tail call i1 @llvm.amdgcn.class.f32(float %193, i32 144)
  %195 = select i1 %194, float 0x41F0000000000000, float 1.000000e+00
  %196 = fmul float %193, %195
  %197 = tail call float @llvm.log2.f32(float %196)
  %198 = fmul float %197, 0x3FE62E42E0000000
  %199 = tail call i1 @llvm.amdgcn.class.f32(float %197, i32 519)
  %200 = fneg float %198
  %201 = tail call float @llvm.fma.f32(float %197, float 0x3FE62E42E0000000, float %200)
  %202 = tail call float @llvm.fma.f32(float %197, float 0x3E6EFA39E0000000, float %201)
  %203 = fadd float %198, %202
  %204 = select i1 %199, float %197, float %203
  %205 = select i1 %194, float 0x40362E4300000000, float 0.000000e+00
  %206 = fsub float %204, %205
  %207 = fadd float %174, %206
  br label %251

208:                                              ; preds = %153
  %209 = fcmp olt float %36, 0x4390000000000000
  br i1 %209, label %210, label %235

210:                                              ; preds = %208
  %211 = tail call float @llvm.amdgcn.rcp.f32(float %36)
  %212 = fmul float %211, %211
  %213 = tail call float @llvm.fmuladd.f32(float %212, float 0xBF5AB89D00000000, float 0x3F4B67BA40000000)
  %214 = tail call float @llvm.fmuladd.f32(float %212, float %213, float 0xBF4380CB80000000)
  %215 = tail call float @llvm.fmuladd.f32(float %212, float %214, float 0x3F4A019FA0000000)
  %216 = tail call float @llvm.fmuladd.f32(float %212, float %215, float 0xBF66C16C20000000)
  %217 = tail call float @llvm.fmuladd.f32(float %212, float %216, float 0x3FB5555560000000)
  %218 = tail call float @llvm.fmuladd.f32(float %211, float %217, float 0x3FDACFE3A0000000)
  %219 = fadd float %36, -5.000000e-01
  %220 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 144)
  %221 = select i1 %220, float 0x41F0000000000000, float 1.000000e+00
  %222 = fmul float %36, %221
  %223 = tail call float @llvm.log2.f32(float %222)
  %224 = fmul float %223, 0x3FE62E42E0000000
  %225 = tail call i1 @llvm.amdgcn.class.f32(float %223, i32 519)
  %226 = fneg float %224
  %227 = tail call float @llvm.fma.f32(float %223, float 0x3FE62E42E0000000, float %226)
  %228 = tail call float @llvm.fma.f32(float %223, float 0x3E6EFA39E0000000, float %227)
  %229 = fadd float %224, %228
  %230 = select i1 %225, float %223, float %229
  %231 = select i1 %220, float 0x40362E4300000000, float 0.000000e+00
  %232 = fsub float %230, %231
  %233 = fadd float %232, -1.000000e+00
  %234 = tail call float @llvm.fmuladd.f32(float %219, float %233, float %218)
  br label %251

235:                                              ; preds = %208
  %236 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 144)
  %237 = select i1 %236, float 0x41F0000000000000, float 1.000000e+00
  %238 = fmul float %36, %237
  %239 = tail call float @llvm.log2.f32(float %238)
  %240 = fmul float %239, 0x3FE62E42E0000000
  %241 = tail call i1 @llvm.amdgcn.class.f32(float %239, i32 519)
  %242 = fneg float %240
  %243 = tail call float @llvm.fma.f32(float %239, float 0x3FE62E42E0000000, float %242)
  %244 = tail call float @llvm.fma.f32(float %239, float 0x3E6EFA39E0000000, float %243)
  %245 = fadd float %240, %244
  %246 = select i1 %241, float %239, float %245
  %247 = select i1 %236, float 0x40362E4300000000, float 0.000000e+00
  %248 = fsub float %246, %247
  %249 = fneg float %36
  %250 = tail call float @llvm.fmuladd.f32(float %36, float %248, float %249)
  br label %251

251:                                              ; preds = %235, %210, %155, %137, %115, %99, %95, %38
  %252 = phi float [ %56, %38 ], [ %207, %155 ], [ %234, %210 ], [ %250, %235 ], [ %98, %95 ], [ %152, %137 ], [ %136, %115 ], [ %114, %99 ]
  %253 = fcmp oge float %35, 0.000000e+00
  br i1 %253, label %254, label %259

254:                                              ; preds = %251
  %255 = fcmp oeq float %35, 1.000000e+00
  %256 = fcmp oeq float %35, 2.000000e+00
  %257 = or i1 %255, %256
  %258 = select i1 %257, float 0.000000e+00, float %252
  br label %323

259:                                              ; preds = %251
  %260 = fcmp olt float %36, 0x4160000000000000
  %261 = fcmp ogt float %36, 0x3EA0000000000000
  %262 = and i1 %260, %261
  br i1 %262, label %263, label %323

263:                                              ; preds = %259
  %264 = fmul float %36, 5.000000e-01
  %265 = tail call float @llvm.amdgcn.fract.f32(float %264)
  %266 = tail call i1 @llvm.amdgcn.class.f32(float %264, i32 516)
  %267 = fmul float %265, 2.000000e+00
  %268 = select i1 %266, float 0.000000e+00, float %267
  %269 = fcmp ogt float %36, 1.000000e+00
  %270 = select i1 %269, float %268, float %36
  %271 = fmul float %270, 2.000000e+00
  %272 = tail call float @llvm.rint.f32(float %271)
  %273 = tail call float @llvm.fmuladd.f32(float %272, float -5.000000e-01, float %270)
  %274 = fptosi float %272 to i32
  %275 = fmul float %273, %273
  %276 = tail call float @llvm.fmuladd.f32(float %275, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %277 = tail call float @llvm.fmuladd.f32(float %275, float %276, float 0x400468E6C0000000)
  %278 = tail call float @llvm.fmuladd.f32(float %275, float %277, float 0xC014ABC1C0000000)
  %279 = fmul float %273, %275
  %280 = fmul float %279, %278
  %281 = tail call float @llvm.fmuladd.f32(float %273, float 0x400921FB60000000, float %280)
  %282 = tail call float @llvm.fmuladd.f32(float %275, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %283 = tail call float @llvm.fmuladd.f32(float %275, float %282, float 0xBFF55A3B40000000)
  %284 = tail call float @llvm.fmuladd.f32(float %275, float %283, float 0x40103C1A60000000)
  %285 = tail call float @llvm.fmuladd.f32(float %275, float %284, float 0xC013BD3CC0000000)
  %286 = tail call float @llvm.fmuladd.f32(float %275, float %285, float 1.000000e+00)
  %287 = and i32 %274, 1
  %288 = icmp eq i32 %287, 0
  %289 = select i1 %288, float %281, float %286
  %290 = bitcast float %289 to i32
  %291 = shl i32 %274, 30
  %292 = and i32 %291, -2147483648
  %293 = bitcast float %35 to i32
  %294 = bitcast float %36 to i32
  %295 = xor i32 %294, %293
  %296 = xor i32 %295, %292
  %297 = xor i32 %296, %290
  %298 = bitcast i32 %297 to float
  %299 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 504)
  %300 = select i1 %299, float %298, float 0x7FF8000000000000
  %301 = fmul float %35, %300
  %302 = tail call float @llvm.fabs.f32(float %301)
  %303 = fdiv float 0x400921FB60000000, %302, !fpmath !11
  %304 = tail call i1 @llvm.amdgcn.class.f32(float %303, i32 144)
  %305 = select i1 %304, float 0x41F0000000000000, float 1.000000e+00
  %306 = fmul float %303, %305
  %307 = tail call float @llvm.log2.f32(float %306)
  %308 = fmul float %307, 0x3FE62E42E0000000
  %309 = tail call i1 @llvm.amdgcn.class.f32(float %307, i32 519)
  %310 = fneg float %308
  %311 = tail call float @llvm.fma.f32(float %307, float 0x3FE62E42E0000000, float %310)
  %312 = tail call float @llvm.fma.f32(float %307, float 0x3E6EFA39E0000000, float %311)
  %313 = fadd float %308, %312
  %314 = select i1 %309, float %307, float %313
  %315 = select i1 %304, float 0x40362E4300000000, float 0.000000e+00
  %316 = fsub float %314, %315
  %317 = fsub float %316, %252
  %318 = tail call float @llvm.amdgcn.fract.f32(float %35)
  %319 = tail call i1 @llvm.amdgcn.class.f32(float %35, i32 516)
  %320 = select i1 %319, float 0.000000e+00, float %318
  %321 = fcmp oeq float %320, 0.000000e+00
  %322 = select i1 %321, float 0x7FF0000000000000, float %317
  br label %323

323:                                              ; preds = %254, %259, %263
  %324 = phi float [ %258, %254 ], [ %322, %263 ], [ %252, %259 ]
  %325 = fcmp uno float %35, 0.000000e+00
  %326 = fcmp oeq float %35, 0.000000e+00
  %327 = fcmp oeq float %36, 0x7FF0000000000000
  %328 = select i1 %326, i1 true, i1 %327
  %329 = fcmp olt float %36, 0x4160000000000000
  %330 = select i1 %253, i1 true, i1 %329
  %331 = select i1 %330, float %324, float 0x7FF0000000000000
  %332 = select i1 %328, float 0x7FF0000000000000, float %331
  %333 = select i1 %325, float %35, float %332
  %334 = add nsw i32 %17, %6
  %335 = mul nsw i32 %25, %7
  %336 = add nsw i32 %334, %335
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds float, float addrspace(1)* %5, i64 %337
  store float %333, float addrspace(1)* %338, align 4, !tbaa !7
  br label %339

339:                                              ; preds = %323, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
