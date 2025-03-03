; ModuleID = '../data/hip_kernels/7801/50/main.cu'
source_filename = "../data/hip_kernels/7801/50/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_lgammaf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = icmp ult i64 %13, %0
  br i1 %14, label %15, label %317

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp olt float %18, 1.562500e-02
  br i1 %19, label %20, label %39

20:                                               ; preds = %15
  %21 = tail call float @llvm.fmuladd.f32(float %18, float 0x3FD1513220000000, float 0xBFD9A4D560000000)
  %22 = tail call float @llvm.fmuladd.f32(float %18, float %21, float 0x3FEA51A660000000)
  %23 = tail call float @llvm.fmuladd.f32(float %18, float %22, float 0xBFE2788D00000000)
  %24 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 144)
  %25 = select i1 %24, float 0x41F0000000000000, float 1.000000e+00
  %26 = fmul float %18, %25
  %27 = tail call float @llvm.log2.f32(float %26)
  %28 = fmul float %27, 0x3FE62E42E0000000
  %29 = tail call i1 @llvm.amdgcn.class.f32(float %27, i32 519)
  %30 = fneg float %28
  %31 = tail call float @llvm.fma.f32(float %27, float 0x3FE62E42E0000000, float %30)
  %32 = tail call float @llvm.fma.f32(float %27, float 0x3E6EFA39E0000000, float %31)
  %33 = fadd float %28, %32
  %34 = select i1 %29, float %27, float %33
  %35 = select i1 %24, float 0x40362E4300000000, float 0.000000e+00
  %36 = fsub float %34, %35
  %37 = fneg float %36
  %38 = tail call float @llvm.fmuladd.f32(float %18, float %23, float %37)
  br label %233

39:                                               ; preds = %15
  %40 = fcmp olt float %18, 2.000000e+00
  br i1 %40, label %41, label %135

41:                                               ; preds = %39
  %42 = fcmp ugt float %18, 0x3FECCCCCC0000000
  br i1 %42, label %66, label %43

43:                                               ; preds = %41
  %44 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 144)
  %45 = select i1 %44, float 0x41F0000000000000, float 1.000000e+00
  %46 = fmul float %18, %45
  %47 = tail call float @llvm.log2.f32(float %46)
  %48 = fmul float %47, 0x3FE62E42E0000000
  %49 = tail call i1 @llvm.amdgcn.class.f32(float %47, i32 519)
  %50 = fneg float %48
  %51 = tail call float @llvm.fma.f32(float %47, float 0x3FE62E42E0000000, float %50)
  %52 = tail call float @llvm.fma.f32(float %47, float 0x3E6EFA39E0000000, float %51)
  %53 = fadd float %48, %52
  %54 = select i1 %49, float %47, float %53
  %55 = select i1 %44, float 0x40362E4300000000, float 0.000000e+00
  %56 = fsub float %54, %55
  %57 = fneg float %56
  %58 = fsub float 1.000000e+00, %18
  %59 = fcmp olt float %18, 0x3FE7694460000000
  %60 = fadd float %18, 0xBFDD8B6180000000
  %61 = select i1 %59, float %60, float %58
  %62 = zext i1 %59 to i32
  %63 = fcmp olt float %18, 0x3FCDA66120000000
  %64 = select i1 %63, float %18, float %61
  %65 = select i1 %63, i32 2, i32 %62
  br label %77

66:                                               ; preds = %41
  %67 = fsub float 2.000000e+00, %18
  %68 = fcmp olt float %18, 0x3FFBB4A240000000
  %69 = fadd float %18, 0xBFF762D860000000
  %70 = select i1 %68, float %69, float %67
  %71 = select i1 %68, float 1.000000e+00, float %67
  %72 = fptosi float %71 to i32
  %73 = fcmp olt float %18, 0x3FF3AE1480000000
  %74 = fadd float %18, -1.000000e+00
  %75 = select i1 %73, float %74, float %70
  %76 = select i1 %73, i32 2, i32 %72
  br label %77

77:                                               ; preds = %66, %43
  %78 = phi float [ %64, %43 ], [ %75, %66 ]
  %79 = phi i32 [ %65, %43 ], [ %76, %66 ]
  %80 = phi float [ %57, %43 ], [ 0.000000e+00, %66 ]
  switch i32 %79, label %233 [
    i32 0, label %81
    i32 1, label %97
    i32 2, label %119
  ]

81:                                               ; preds = %77
  %82 = fmul float %78, %78
  %83 = tail call float @llvm.fmuladd.f32(float %82, float 0x3EFA707440000000, float 0x3F2CF2ECE0000000)
  %84 = tail call float @llvm.fmuladd.f32(float %82, float %83, float 0x3F538A9420000000)
  %85 = tail call float @llvm.fmuladd.f32(float %82, float %84, float 0x3F7E404FC0000000)
  %86 = tail call float @llvm.fmuladd.f32(float %82, float %85, float 0x3FB13E0020000000)
  %87 = tail call float @llvm.fmuladd.f32(float %82, float %86, float 0x3FB3C467E0000000)
  %88 = tail call float @llvm.fmuladd.f32(float %82, float 0x3F07858EA0000000, float 0x3F1C5088A0000000)
  %89 = tail call float @llvm.fmuladd.f32(float %82, float %88, float 0x3F40B6C680000000)
  %90 = tail call float @llvm.fmuladd.f32(float %82, float %89, float 0x3F67ADD8C0000000)
  %91 = tail call float @llvm.fmuladd.f32(float %82, float %90, float 0x3F951322A0000000)
  %92 = tail call float @llvm.fmuladd.f32(float %82, float %91, float 0x3FD4A34CC0000000)
  %93 = fmul float %82, %92
  %94 = tail call float @llvm.fmuladd.f32(float %78, float %87, float %93)
  %95 = tail call float @llvm.fmuladd.f32(float %78, float -5.000000e-01, float %94)
  %96 = fadd float %80, %95
  br label %233

97:                                               ; preds = %77
  %98 = fmul float %78, %78
  %99 = fmul float %78, %98
  %100 = tail call float @llvm.fmuladd.f32(float %99, float 0x3F34AF6D60000000, float 0xBF56FE8EC0000000)
  %101 = tail call float @llvm.fmuladd.f32(float %99, float %100, float 0x3F78FCE0E0000000)
  %102 = tail call float @llvm.fmuladd.f32(float %99, float %101, float 0xBFA0C9A8E0000000)
  %103 = tail call float @llvm.fmuladd.f32(float %99, float %102, float 0x3FDEF72BC0000000)
  %104 = tail call float @llvm.fmuladd.f32(float %99, float 0xBF347F24E0000000, float 0x3F4CDF0CE0000000)
  %105 = tail call float @llvm.fmuladd.f32(float %99, float %104, float 0xBF6E2EFFC0000000)
  %106 = tail call float @llvm.fmuladd.f32(float %99, float %105, float 0x3F9266E7A0000000)
  %107 = tail call float @llvm.fmuladd.f32(float %99, float %106, float 0xBFC2E42780000000)
  %108 = tail call float @llvm.fmuladd.f32(float %99, float 0x3F35FD3EE0000000, float 0xBF41A610A0000000)
  %109 = tail call float @llvm.fmuladd.f32(float %99, float %108, float 0x3F6282D320000000)
  %110 = tail call float @llvm.fmuladd.f32(float %99, float %109, float 0xBF851F9FC0000000)
  %111 = tail call float @llvm.fmuladd.f32(float %99, float %110, float 0x3FB08B42A0000000)
  %112 = tail call float @llvm.fmuladd.f32(float %78, float %111, float %107)
  %113 = fneg float %112
  %114 = tail call float @llvm.fmuladd.f32(float %99, float %113, float 0xBC50C7CAA0000000)
  %115 = fneg float %114
  %116 = tail call float @llvm.fmuladd.f32(float %98, float %103, float %115)
  %117 = fadd float %116, 0xBFBF19B9C0000000
  %118 = fadd float %80, %117
  br label %233

119:                                              ; preds = %77
  %120 = tail call float @llvm.fmuladd.f32(float %78, float 0x3F8B678BC0000000, float 0x3FCD4EAF00000000)
  %121 = tail call float @llvm.fmuladd.f32(float %78, float %120, float 0x3FEF497640000000)
  %122 = tail call float @llvm.fmuladd.f32(float %78, float %121, float 0x3FF7475CE0000000)
  %123 = tail call float @llvm.fmuladd.f32(float %78, float %122, float 0x3FE4401E80000000)
  %124 = tail call float @llvm.fmuladd.f32(float %78, float %123, float 0xBFB3C467E0000000)
  %125 = fmul float %78, %124
  %126 = tail call float @llvm.fmuladd.f32(float %78, float 0x3F6A5ABB60000000, float 0x3FBAAE55E0000000)
  %127 = tail call float @llvm.fmuladd.f32(float %78, float %126, float 0x3FE89DFBE0000000)
  %128 = tail call float @llvm.fmuladd.f32(float %78, float %127, float 0x40010725A0000000)
  %129 = tail call float @llvm.fmuladd.f32(float %78, float %128, float 0x4003A5D7C0000000)
  %130 = tail call float @llvm.fmuladd.f32(float %78, float %129, float 1.000000e+00)
  %131 = tail call float @llvm.amdgcn.rcp.f32(float %130)
  %132 = fmul float %125, %131
  %133 = tail call float @llvm.fmuladd.f32(float %78, float -5.000000e-01, float %132)
  %134 = fadd float %80, %133
  br label %233

135:                                              ; preds = %39
  %136 = fcmp olt float %18, 8.000000e+00
  br i1 %136, label %137, label %190

137:                                              ; preds = %135
  %138 = fptosi float %18 to i32
  %139 = sitofp i32 %138 to float
  %140 = fsub float %18, %139
  %141 = tail call float @llvm.fmuladd.f32(float %140, float 0x3F00BFECE0000000, float 0x3F5E26B680000000)
  %142 = tail call float @llvm.fmuladd.f32(float %140, float %141, float 0x3F9B481C80000000)
  %143 = tail call float @llvm.fmuladd.f32(float %140, float %142, float 0x3FC2BB9CC0000000)
  %144 = tail call float @llvm.fmuladd.f32(float %140, float %143, float 0x3FD4D98F40000000)
  %145 = tail call float @llvm.fmuladd.f32(float %140, float %144, float 0x3FCB848B40000000)
  %146 = tail call float @llvm.fmuladd.f32(float %140, float %145, float 0xBFB3C467E0000000)
  %147 = fmul float %140, %146
  %148 = tail call float @llvm.fmuladd.f32(float %140, float 0x3EDEBAF7A0000000, float 0x3F497DDAC0000000)
  %149 = tail call float @llvm.fmuladd.f32(float %140, float %148, float 0x3F9317EA80000000)
  %150 = tail call float @llvm.fmuladd.f32(float %140, float %149, float 0x3FC601EDC0000000)
  %151 = tail call float @llvm.fmuladd.f32(float %140, float %150, float 0x3FE71A18A0000000)
  %152 = tail call float @llvm.fmuladd.f32(float %140, float %151, float 0x3FF645A760000000)
  %153 = tail call float @llvm.fmuladd.f32(float %140, float %152, float 1.000000e+00)
  %154 = tail call float @llvm.amdgcn.rcp.f32(float %153)
  %155 = fmul float %147, %154
  %156 = tail call float @llvm.fmuladd.f32(float %140, float 5.000000e-01, float %155)
  %157 = fadd float %140, 2.000000e+00
  %158 = fadd float %140, 3.000000e+00
  %159 = fadd float %140, 4.000000e+00
  %160 = fadd float %140, 5.000000e+00
  %161 = fadd float %140, 6.000000e+00
  %162 = icmp sgt i32 %138, 2
  %163 = select i1 %162, float %157, float 1.000000e+00
  %164 = icmp sgt i32 %138, 3
  %165 = select i1 %164, float %158, float 1.000000e+00
  %166 = fmul float %163, %165
  %167 = icmp sgt i32 %138, 4
  %168 = select i1 %167, float %159, float 1.000000e+00
  %169 = fmul float %168, %166
  %170 = icmp sgt i32 %138, 5
  %171 = select i1 %170, float %160, float 1.000000e+00
  %172 = fmul float %171, %169
  %173 = icmp sgt i32 %138, 6
  %174 = select i1 %173, float %161, float 1.000000e+00
  %175 = fmul float %174, %172
  %176 = tail call i1 @llvm.amdgcn.class.f32(float %175, i32 144)
  %177 = select i1 %176, float 0x41F0000000000000, float 1.000000e+00
  %178 = fmul float %175, %177
  %179 = tail call float @llvm.log2.f32(float %178)
  %180 = fmul float %179, 0x3FE62E42E0000000
  %181 = tail call i1 @llvm.amdgcn.class.f32(float %179, i32 519)
  %182 = fneg float %180
  %183 = tail call float @llvm.fma.f32(float %179, float 0x3FE62E42E0000000, float %182)
  %184 = tail call float @llvm.fma.f32(float %179, float 0x3E6EFA39E0000000, float %183)
  %185 = fadd float %180, %184
  %186 = select i1 %181, float %179, float %185
  %187 = select i1 %176, float 0x40362E4300000000, float 0.000000e+00
  %188 = fsub float %186, %187
  %189 = fadd float %156, %188
  br label %233

190:                                              ; preds = %135
  %191 = fcmp olt float %18, 0x4390000000000000
  br i1 %191, label %192, label %217

192:                                              ; preds = %190
  %193 = tail call float @llvm.amdgcn.rcp.f32(float %18)
  %194 = fmul float %193, %193
  %195 = tail call float @llvm.fmuladd.f32(float %194, float 0xBF5AB89D00000000, float 0x3F4B67BA40000000)
  %196 = tail call float @llvm.fmuladd.f32(float %194, float %195, float 0xBF4380CB80000000)
  %197 = tail call float @llvm.fmuladd.f32(float %194, float %196, float 0x3F4A019FA0000000)
  %198 = tail call float @llvm.fmuladd.f32(float %194, float %197, float 0xBF66C16C20000000)
  %199 = tail call float @llvm.fmuladd.f32(float %194, float %198, float 0x3FB5555560000000)
  %200 = tail call float @llvm.fmuladd.f32(float %193, float %199, float 0x3FDACFE3A0000000)
  %201 = fadd float %18, -5.000000e-01
  %202 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 144)
  %203 = select i1 %202, float 0x41F0000000000000, float 1.000000e+00
  %204 = fmul float %18, %203
  %205 = tail call float @llvm.log2.f32(float %204)
  %206 = fmul float %205, 0x3FE62E42E0000000
  %207 = tail call i1 @llvm.amdgcn.class.f32(float %205, i32 519)
  %208 = fneg float %206
  %209 = tail call float @llvm.fma.f32(float %205, float 0x3FE62E42E0000000, float %208)
  %210 = tail call float @llvm.fma.f32(float %205, float 0x3E6EFA39E0000000, float %209)
  %211 = fadd float %206, %210
  %212 = select i1 %207, float %205, float %211
  %213 = select i1 %202, float 0x40362E4300000000, float 0.000000e+00
  %214 = fsub float %212, %213
  %215 = fadd float %214, -1.000000e+00
  %216 = tail call float @llvm.fmuladd.f32(float %201, float %215, float %200)
  br label %233

217:                                              ; preds = %190
  %218 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 144)
  %219 = select i1 %218, float 0x41F0000000000000, float 1.000000e+00
  %220 = fmul float %18, %219
  %221 = tail call float @llvm.log2.f32(float %220)
  %222 = fmul float %221, 0x3FE62E42E0000000
  %223 = tail call i1 @llvm.amdgcn.class.f32(float %221, i32 519)
  %224 = fneg float %222
  %225 = tail call float @llvm.fma.f32(float %221, float 0x3FE62E42E0000000, float %224)
  %226 = tail call float @llvm.fma.f32(float %221, float 0x3E6EFA39E0000000, float %225)
  %227 = fadd float %222, %226
  %228 = select i1 %223, float %221, float %227
  %229 = select i1 %218, float 0x40362E4300000000, float 0.000000e+00
  %230 = fsub float %228, %229
  %231 = fneg float %18
  %232 = tail call float @llvm.fmuladd.f32(float %18, float %230, float %231)
  br label %233

233:                                              ; preds = %217, %192, %137, %119, %97, %81, %77, %20
  %234 = phi float [ %38, %20 ], [ %189, %137 ], [ %216, %192 ], [ %232, %217 ], [ %80, %77 ], [ %134, %119 ], [ %118, %97 ], [ %96, %81 ]
  %235 = fcmp oge float %17, 0.000000e+00
  br i1 %235, label %236, label %241

236:                                              ; preds = %233
  %237 = fcmp oeq float %17, 1.000000e+00
  %238 = fcmp oeq float %17, 2.000000e+00
  %239 = or i1 %237, %238
  %240 = select i1 %239, float 0.000000e+00, float %234
  br label %305

241:                                              ; preds = %233
  %242 = fcmp olt float %18, 0x4160000000000000
  %243 = fcmp ogt float %18, 0x3EA0000000000000
  %244 = and i1 %242, %243
  br i1 %244, label %245, label %305

245:                                              ; preds = %241
  %246 = fmul float %18, 5.000000e-01
  %247 = tail call float @llvm.amdgcn.fract.f32(float %246)
  %248 = tail call i1 @llvm.amdgcn.class.f32(float %246, i32 516)
  %249 = fmul float %247, 2.000000e+00
  %250 = select i1 %248, float 0.000000e+00, float %249
  %251 = fcmp ogt float %18, 1.000000e+00
  %252 = select i1 %251, float %250, float %18
  %253 = fmul float %252, 2.000000e+00
  %254 = tail call float @llvm.rint.f32(float %253)
  %255 = tail call float @llvm.fmuladd.f32(float %254, float -5.000000e-01, float %252)
  %256 = fptosi float %254 to i32
  %257 = fmul float %255, %255
  %258 = tail call float @llvm.fmuladd.f32(float %257, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %259 = tail call float @llvm.fmuladd.f32(float %257, float %258, float 0x400468E6C0000000)
  %260 = tail call float @llvm.fmuladd.f32(float %257, float %259, float 0xC014ABC1C0000000)
  %261 = fmul float %255, %257
  %262 = fmul float %261, %260
  %263 = tail call float @llvm.fmuladd.f32(float %255, float 0x400921FB60000000, float %262)
  %264 = tail call float @llvm.fmuladd.f32(float %257, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %265 = tail call float @llvm.fmuladd.f32(float %257, float %264, float 0xBFF55A3B40000000)
  %266 = tail call float @llvm.fmuladd.f32(float %257, float %265, float 0x40103C1A60000000)
  %267 = tail call float @llvm.fmuladd.f32(float %257, float %266, float 0xC013BD3CC0000000)
  %268 = tail call float @llvm.fmuladd.f32(float %257, float %267, float 1.000000e+00)
  %269 = and i32 %256, 1
  %270 = icmp eq i32 %269, 0
  %271 = select i1 %270, float %263, float %268
  %272 = bitcast float %271 to i32
  %273 = shl i32 %256, 30
  %274 = and i32 %273, -2147483648
  %275 = bitcast float %17 to i32
  %276 = bitcast float %18 to i32
  %277 = xor i32 %276, %275
  %278 = xor i32 %277, %274
  %279 = xor i32 %278, %272
  %280 = bitcast i32 %279 to float
  %281 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 504)
  %282 = select i1 %281, float %280, float 0x7FF8000000000000
  %283 = fmul float %17, %282
  %284 = tail call float @llvm.fabs.f32(float %283)
  %285 = fdiv float 0x400921FB60000000, %284, !fpmath !11
  %286 = tail call i1 @llvm.amdgcn.class.f32(float %285, i32 144)
  %287 = select i1 %286, float 0x41F0000000000000, float 1.000000e+00
  %288 = fmul float %285, %287
  %289 = tail call float @llvm.log2.f32(float %288)
  %290 = fmul float %289, 0x3FE62E42E0000000
  %291 = tail call i1 @llvm.amdgcn.class.f32(float %289, i32 519)
  %292 = fneg float %290
  %293 = tail call float @llvm.fma.f32(float %289, float 0x3FE62E42E0000000, float %292)
  %294 = tail call float @llvm.fma.f32(float %289, float 0x3E6EFA39E0000000, float %293)
  %295 = fadd float %290, %294
  %296 = select i1 %291, float %289, float %295
  %297 = select i1 %286, float 0x40362E4300000000, float 0.000000e+00
  %298 = fsub float %296, %297
  %299 = fsub float %298, %234
  %300 = tail call float @llvm.amdgcn.fract.f32(float %17)
  %301 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 516)
  %302 = select i1 %301, float 0.000000e+00, float %300
  %303 = fcmp oeq float %302, 0.000000e+00
  %304 = select i1 %303, float 0x7FF0000000000000, float %299
  br label %305

305:                                              ; preds = %236, %241, %245
  %306 = phi float [ %240, %236 ], [ %304, %245 ], [ %234, %241 ]
  %307 = fcmp uno float %17, 0.000000e+00
  %308 = fcmp oeq float %17, 0.000000e+00
  %309 = fcmp oeq float %18, 0x7FF0000000000000
  %310 = select i1 %308, i1 true, i1 %309
  %311 = fcmp olt float %18, 0x4160000000000000
  %312 = select i1 %235, i1 true, i1 %311
  %313 = select i1 %312, float %306, float 0x7FF0000000000000
  %314 = select i1 %310, float 0x7FF0000000000000, float %313
  %315 = select i1 %307, float %17, float %314
  %316 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %315, float addrspace(1)* %316, align 4, !tbaa !7
  br label %317

317:                                              ; preds = %305, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{float 2.500000e+00}
