; ModuleID = '../data/hip_kernels/3007/71/main.cu'
source_filename = "../data/hip_kernels/3007/71/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13vector_lgammaiPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %326

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fcmp olt float %24, 1.562500e-02
  br i1 %25, label %26, label %45

26:                                               ; preds = %18
  %27 = tail call float @llvm.fmuladd.f32(float %24, float 0x3FD1513220000000, float 0xBFD9A4D560000000)
  %28 = tail call float @llvm.fmuladd.f32(float %24, float %27, float 0x3FEA51A660000000)
  %29 = tail call float @llvm.fmuladd.f32(float %24, float %28, float 0xBFE2788D00000000)
  %30 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 144)
  %31 = select i1 %30, float 0x41F0000000000000, float 1.000000e+00
  %32 = fmul float %24, %31
  %33 = tail call float @llvm.log2.f32(float %32)
  %34 = fmul float %33, 0x3FE62E42E0000000
  %35 = tail call i1 @llvm.amdgcn.class.f32(float %33, i32 519)
  %36 = fneg float %34
  %37 = tail call float @llvm.fma.f32(float %33, float 0x3FE62E42E0000000, float %36)
  %38 = tail call float @llvm.fma.f32(float %33, float 0x3E6EFA39E0000000, float %37)
  %39 = fadd float %34, %38
  %40 = select i1 %35, float %33, float %39
  %41 = select i1 %30, float 0x40362E4300000000, float 0.000000e+00
  %42 = fsub float %40, %41
  %43 = fneg float %42
  %44 = tail call float @llvm.fmuladd.f32(float %24, float %29, float %43)
  br label %239

45:                                               ; preds = %18
  %46 = fcmp olt float %24, 2.000000e+00
  br i1 %46, label %47, label %141

47:                                               ; preds = %45
  %48 = fcmp ugt float %24, 0x3FECCCCCC0000000
  br i1 %48, label %72, label %49

49:                                               ; preds = %47
  %50 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 144)
  %51 = select i1 %50, float 0x41F0000000000000, float 1.000000e+00
  %52 = fmul float %24, %51
  %53 = tail call float @llvm.log2.f32(float %52)
  %54 = fmul float %53, 0x3FE62E42E0000000
  %55 = tail call i1 @llvm.amdgcn.class.f32(float %53, i32 519)
  %56 = fneg float %54
  %57 = tail call float @llvm.fma.f32(float %53, float 0x3FE62E42E0000000, float %56)
  %58 = tail call float @llvm.fma.f32(float %53, float 0x3E6EFA39E0000000, float %57)
  %59 = fadd float %54, %58
  %60 = select i1 %55, float %53, float %59
  %61 = select i1 %50, float 0x40362E4300000000, float 0.000000e+00
  %62 = fsub float %60, %61
  %63 = fneg float %62
  %64 = fsub float 1.000000e+00, %24
  %65 = fcmp olt float %24, 0x3FE7694460000000
  %66 = fadd float %24, 0xBFDD8B6180000000
  %67 = select i1 %65, float %66, float %64
  %68 = zext i1 %65 to i32
  %69 = fcmp olt float %24, 0x3FCDA66120000000
  %70 = select i1 %69, float %24, float %67
  %71 = select i1 %69, i32 2, i32 %68
  br label %83

72:                                               ; preds = %47
  %73 = fsub float 2.000000e+00, %24
  %74 = fcmp olt float %24, 0x3FFBB4A240000000
  %75 = fadd float %24, 0xBFF762D860000000
  %76 = select i1 %74, float %75, float %73
  %77 = select i1 %74, float 1.000000e+00, float %73
  %78 = fptosi float %77 to i32
  %79 = fcmp olt float %24, 0x3FF3AE1480000000
  %80 = fadd float %24, -1.000000e+00
  %81 = select i1 %79, float %80, float %76
  %82 = select i1 %79, i32 2, i32 %78
  br label %83

83:                                               ; preds = %72, %49
  %84 = phi float [ %70, %49 ], [ %81, %72 ]
  %85 = phi i32 [ %71, %49 ], [ %82, %72 ]
  %86 = phi float [ %63, %49 ], [ 0.000000e+00, %72 ]
  switch i32 %85, label %239 [
    i32 0, label %87
    i32 1, label %103
    i32 2, label %125
  ]

87:                                               ; preds = %83
  %88 = fmul float %84, %84
  %89 = tail call float @llvm.fmuladd.f32(float %88, float 0x3EFA707440000000, float 0x3F2CF2ECE0000000)
  %90 = tail call float @llvm.fmuladd.f32(float %88, float %89, float 0x3F538A9420000000)
  %91 = tail call float @llvm.fmuladd.f32(float %88, float %90, float 0x3F7E404FC0000000)
  %92 = tail call float @llvm.fmuladd.f32(float %88, float %91, float 0x3FB13E0020000000)
  %93 = tail call float @llvm.fmuladd.f32(float %88, float %92, float 0x3FB3C467E0000000)
  %94 = tail call float @llvm.fmuladd.f32(float %88, float 0x3F07858EA0000000, float 0x3F1C5088A0000000)
  %95 = tail call float @llvm.fmuladd.f32(float %88, float %94, float 0x3F40B6C680000000)
  %96 = tail call float @llvm.fmuladd.f32(float %88, float %95, float 0x3F67ADD8C0000000)
  %97 = tail call float @llvm.fmuladd.f32(float %88, float %96, float 0x3F951322A0000000)
  %98 = tail call float @llvm.fmuladd.f32(float %88, float %97, float 0x3FD4A34CC0000000)
  %99 = fmul float %88, %98
  %100 = tail call float @llvm.fmuladd.f32(float %84, float %93, float %99)
  %101 = tail call float @llvm.fmuladd.f32(float %84, float -5.000000e-01, float %100)
  %102 = fadd float %86, %101
  br label %239

103:                                              ; preds = %83
  %104 = fmul float %84, %84
  %105 = fmul float %84, %104
  %106 = tail call float @llvm.fmuladd.f32(float %105, float 0x3F34AF6D60000000, float 0xBF56FE8EC0000000)
  %107 = tail call float @llvm.fmuladd.f32(float %105, float %106, float 0x3F78FCE0E0000000)
  %108 = tail call float @llvm.fmuladd.f32(float %105, float %107, float 0xBFA0C9A8E0000000)
  %109 = tail call float @llvm.fmuladd.f32(float %105, float %108, float 0x3FDEF72BC0000000)
  %110 = tail call float @llvm.fmuladd.f32(float %105, float 0xBF347F24E0000000, float 0x3F4CDF0CE0000000)
  %111 = tail call float @llvm.fmuladd.f32(float %105, float %110, float 0xBF6E2EFFC0000000)
  %112 = tail call float @llvm.fmuladd.f32(float %105, float %111, float 0x3F9266E7A0000000)
  %113 = tail call float @llvm.fmuladd.f32(float %105, float %112, float 0xBFC2E42780000000)
  %114 = tail call float @llvm.fmuladd.f32(float %105, float 0x3F35FD3EE0000000, float 0xBF41A610A0000000)
  %115 = tail call float @llvm.fmuladd.f32(float %105, float %114, float 0x3F6282D320000000)
  %116 = tail call float @llvm.fmuladd.f32(float %105, float %115, float 0xBF851F9FC0000000)
  %117 = tail call float @llvm.fmuladd.f32(float %105, float %116, float 0x3FB08B42A0000000)
  %118 = tail call float @llvm.fmuladd.f32(float %84, float %117, float %113)
  %119 = fneg float %118
  %120 = tail call float @llvm.fmuladd.f32(float %105, float %119, float 0xBC50C7CAA0000000)
  %121 = fneg float %120
  %122 = tail call float @llvm.fmuladd.f32(float %104, float %109, float %121)
  %123 = fadd float %122, 0xBFBF19B9C0000000
  %124 = fadd float %86, %123
  br label %239

125:                                              ; preds = %83
  %126 = tail call float @llvm.fmuladd.f32(float %84, float 0x3F8B678BC0000000, float 0x3FCD4EAF00000000)
  %127 = tail call float @llvm.fmuladd.f32(float %84, float %126, float 0x3FEF497640000000)
  %128 = tail call float @llvm.fmuladd.f32(float %84, float %127, float 0x3FF7475CE0000000)
  %129 = tail call float @llvm.fmuladd.f32(float %84, float %128, float 0x3FE4401E80000000)
  %130 = tail call float @llvm.fmuladd.f32(float %84, float %129, float 0xBFB3C467E0000000)
  %131 = fmul float %84, %130
  %132 = tail call float @llvm.fmuladd.f32(float %84, float 0x3F6A5ABB60000000, float 0x3FBAAE55E0000000)
  %133 = tail call float @llvm.fmuladd.f32(float %84, float %132, float 0x3FE89DFBE0000000)
  %134 = tail call float @llvm.fmuladd.f32(float %84, float %133, float 0x40010725A0000000)
  %135 = tail call float @llvm.fmuladd.f32(float %84, float %134, float 0x4003A5D7C0000000)
  %136 = tail call float @llvm.fmuladd.f32(float %84, float %135, float 1.000000e+00)
  %137 = tail call float @llvm.amdgcn.rcp.f32(float %136)
  %138 = fmul float %131, %137
  %139 = tail call float @llvm.fmuladd.f32(float %84, float -5.000000e-01, float %138)
  %140 = fadd float %86, %139
  br label %239

141:                                              ; preds = %45
  %142 = fcmp olt float %24, 8.000000e+00
  br i1 %142, label %143, label %196

143:                                              ; preds = %141
  %144 = fptosi float %24 to i32
  %145 = sitofp i32 %144 to float
  %146 = fsub float %24, %145
  %147 = tail call float @llvm.fmuladd.f32(float %146, float 0x3F00BFECE0000000, float 0x3F5E26B680000000)
  %148 = tail call float @llvm.fmuladd.f32(float %146, float %147, float 0x3F9B481C80000000)
  %149 = tail call float @llvm.fmuladd.f32(float %146, float %148, float 0x3FC2BB9CC0000000)
  %150 = tail call float @llvm.fmuladd.f32(float %146, float %149, float 0x3FD4D98F40000000)
  %151 = tail call float @llvm.fmuladd.f32(float %146, float %150, float 0x3FCB848B40000000)
  %152 = tail call float @llvm.fmuladd.f32(float %146, float %151, float 0xBFB3C467E0000000)
  %153 = fmul float %146, %152
  %154 = tail call float @llvm.fmuladd.f32(float %146, float 0x3EDEBAF7A0000000, float 0x3F497DDAC0000000)
  %155 = tail call float @llvm.fmuladd.f32(float %146, float %154, float 0x3F9317EA80000000)
  %156 = tail call float @llvm.fmuladd.f32(float %146, float %155, float 0x3FC601EDC0000000)
  %157 = tail call float @llvm.fmuladd.f32(float %146, float %156, float 0x3FE71A18A0000000)
  %158 = tail call float @llvm.fmuladd.f32(float %146, float %157, float 0x3FF645A760000000)
  %159 = tail call float @llvm.fmuladd.f32(float %146, float %158, float 1.000000e+00)
  %160 = tail call float @llvm.amdgcn.rcp.f32(float %159)
  %161 = fmul float %153, %160
  %162 = tail call float @llvm.fmuladd.f32(float %146, float 5.000000e-01, float %161)
  %163 = fadd float %146, 2.000000e+00
  %164 = fadd float %146, 3.000000e+00
  %165 = fadd float %146, 4.000000e+00
  %166 = fadd float %146, 5.000000e+00
  %167 = fadd float %146, 6.000000e+00
  %168 = icmp sgt i32 %144, 2
  %169 = select i1 %168, float %163, float 1.000000e+00
  %170 = icmp sgt i32 %144, 3
  %171 = select i1 %170, float %164, float 1.000000e+00
  %172 = fmul float %169, %171
  %173 = icmp sgt i32 %144, 4
  %174 = select i1 %173, float %165, float 1.000000e+00
  %175 = fmul float %174, %172
  %176 = icmp sgt i32 %144, 5
  %177 = select i1 %176, float %166, float 1.000000e+00
  %178 = fmul float %177, %175
  %179 = icmp sgt i32 %144, 6
  %180 = select i1 %179, float %167, float 1.000000e+00
  %181 = fmul float %180, %178
  %182 = tail call i1 @llvm.amdgcn.class.f32(float %181, i32 144)
  %183 = select i1 %182, float 0x41F0000000000000, float 1.000000e+00
  %184 = fmul float %181, %183
  %185 = tail call float @llvm.log2.f32(float %184)
  %186 = fmul float %185, 0x3FE62E42E0000000
  %187 = tail call i1 @llvm.amdgcn.class.f32(float %185, i32 519)
  %188 = fneg float %186
  %189 = tail call float @llvm.fma.f32(float %185, float 0x3FE62E42E0000000, float %188)
  %190 = tail call float @llvm.fma.f32(float %185, float 0x3E6EFA39E0000000, float %189)
  %191 = fadd float %186, %190
  %192 = select i1 %187, float %185, float %191
  %193 = select i1 %182, float 0x40362E4300000000, float 0.000000e+00
  %194 = fsub float %192, %193
  %195 = fadd float %162, %194
  br label %239

196:                                              ; preds = %141
  %197 = fcmp olt float %24, 0x4390000000000000
  br i1 %197, label %198, label %223

198:                                              ; preds = %196
  %199 = tail call float @llvm.amdgcn.rcp.f32(float %24)
  %200 = fmul float %199, %199
  %201 = tail call float @llvm.fmuladd.f32(float %200, float 0xBF5AB89D00000000, float 0x3F4B67BA40000000)
  %202 = tail call float @llvm.fmuladd.f32(float %200, float %201, float 0xBF4380CB80000000)
  %203 = tail call float @llvm.fmuladd.f32(float %200, float %202, float 0x3F4A019FA0000000)
  %204 = tail call float @llvm.fmuladd.f32(float %200, float %203, float 0xBF66C16C20000000)
  %205 = tail call float @llvm.fmuladd.f32(float %200, float %204, float 0x3FB5555560000000)
  %206 = tail call float @llvm.fmuladd.f32(float %199, float %205, float 0x3FDACFE3A0000000)
  %207 = fadd float %24, -5.000000e-01
  %208 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 144)
  %209 = select i1 %208, float 0x41F0000000000000, float 1.000000e+00
  %210 = fmul float %24, %209
  %211 = tail call float @llvm.log2.f32(float %210)
  %212 = fmul float %211, 0x3FE62E42E0000000
  %213 = tail call i1 @llvm.amdgcn.class.f32(float %211, i32 519)
  %214 = fneg float %212
  %215 = tail call float @llvm.fma.f32(float %211, float 0x3FE62E42E0000000, float %214)
  %216 = tail call float @llvm.fma.f32(float %211, float 0x3E6EFA39E0000000, float %215)
  %217 = fadd float %212, %216
  %218 = select i1 %213, float %211, float %217
  %219 = select i1 %208, float 0x40362E4300000000, float 0.000000e+00
  %220 = fsub float %218, %219
  %221 = fadd float %220, -1.000000e+00
  %222 = tail call float @llvm.fmuladd.f32(float %207, float %221, float %206)
  br label %239

223:                                              ; preds = %196
  %224 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 144)
  %225 = select i1 %224, float 0x41F0000000000000, float 1.000000e+00
  %226 = fmul float %24, %225
  %227 = tail call float @llvm.log2.f32(float %226)
  %228 = fmul float %227, 0x3FE62E42E0000000
  %229 = tail call i1 @llvm.amdgcn.class.f32(float %227, i32 519)
  %230 = fneg float %228
  %231 = tail call float @llvm.fma.f32(float %227, float 0x3FE62E42E0000000, float %230)
  %232 = tail call float @llvm.fma.f32(float %227, float 0x3E6EFA39E0000000, float %231)
  %233 = fadd float %228, %232
  %234 = select i1 %229, float %227, float %233
  %235 = select i1 %224, float 0x40362E4300000000, float 0.000000e+00
  %236 = fsub float %234, %235
  %237 = fneg float %24
  %238 = tail call float @llvm.fmuladd.f32(float %24, float %236, float %237)
  br label %239

239:                                              ; preds = %223, %198, %143, %125, %103, %87, %83, %26
  %240 = phi float [ %44, %26 ], [ %195, %143 ], [ %222, %198 ], [ %238, %223 ], [ %86, %83 ], [ %140, %125 ], [ %124, %103 ], [ %102, %87 ]
  %241 = fcmp oge float %23, 0.000000e+00
  br i1 %241, label %242, label %247

242:                                              ; preds = %239
  %243 = fcmp oeq float %23, 1.000000e+00
  %244 = fcmp oeq float %23, 2.000000e+00
  %245 = or i1 %243, %244
  %246 = select i1 %245, float 0.000000e+00, float %240
  br label %311

247:                                              ; preds = %239
  %248 = fcmp olt float %24, 0x4160000000000000
  %249 = fcmp ogt float %24, 0x3EA0000000000000
  %250 = and i1 %248, %249
  br i1 %250, label %251, label %311

251:                                              ; preds = %247
  %252 = fmul float %24, 5.000000e-01
  %253 = tail call float @llvm.amdgcn.fract.f32(float %252)
  %254 = tail call i1 @llvm.amdgcn.class.f32(float %252, i32 516)
  %255 = fmul float %253, 2.000000e+00
  %256 = select i1 %254, float 0.000000e+00, float %255
  %257 = fcmp ogt float %24, 1.000000e+00
  %258 = select i1 %257, float %256, float %24
  %259 = fmul float %258, 2.000000e+00
  %260 = tail call float @llvm.rint.f32(float %259)
  %261 = tail call float @llvm.fmuladd.f32(float %260, float -5.000000e-01, float %258)
  %262 = fptosi float %260 to i32
  %263 = fmul float %261, %261
  %264 = tail call float @llvm.fmuladd.f32(float %263, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %265 = tail call float @llvm.fmuladd.f32(float %263, float %264, float 0x400468E6C0000000)
  %266 = tail call float @llvm.fmuladd.f32(float %263, float %265, float 0xC014ABC1C0000000)
  %267 = fmul float %261, %263
  %268 = fmul float %267, %266
  %269 = tail call float @llvm.fmuladd.f32(float %261, float 0x400921FB60000000, float %268)
  %270 = tail call float @llvm.fmuladd.f32(float %263, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %271 = tail call float @llvm.fmuladd.f32(float %263, float %270, float 0xBFF55A3B40000000)
  %272 = tail call float @llvm.fmuladd.f32(float %263, float %271, float 0x40103C1A60000000)
  %273 = tail call float @llvm.fmuladd.f32(float %263, float %272, float 0xC013BD3CC0000000)
  %274 = tail call float @llvm.fmuladd.f32(float %263, float %273, float 1.000000e+00)
  %275 = and i32 %262, 1
  %276 = icmp eq i32 %275, 0
  %277 = select i1 %276, float %269, float %274
  %278 = bitcast float %277 to i32
  %279 = shl i32 %262, 30
  %280 = and i32 %279, -2147483648
  %281 = bitcast float %23 to i32
  %282 = bitcast float %24 to i32
  %283 = xor i32 %282, %281
  %284 = xor i32 %283, %280
  %285 = xor i32 %284, %278
  %286 = bitcast i32 %285 to float
  %287 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 504)
  %288 = select i1 %287, float %286, float 0x7FF8000000000000
  %289 = fmul float %23, %288
  %290 = tail call float @llvm.fabs.f32(float %289)
  %291 = fdiv float 0x400921FB60000000, %290, !fpmath !11
  %292 = tail call i1 @llvm.amdgcn.class.f32(float %291, i32 144)
  %293 = select i1 %292, float 0x41F0000000000000, float 1.000000e+00
  %294 = fmul float %291, %293
  %295 = tail call float @llvm.log2.f32(float %294)
  %296 = fmul float %295, 0x3FE62E42E0000000
  %297 = tail call i1 @llvm.amdgcn.class.f32(float %295, i32 519)
  %298 = fneg float %296
  %299 = tail call float @llvm.fma.f32(float %295, float 0x3FE62E42E0000000, float %298)
  %300 = tail call float @llvm.fma.f32(float %295, float 0x3E6EFA39E0000000, float %299)
  %301 = fadd float %296, %300
  %302 = select i1 %297, float %295, float %301
  %303 = select i1 %292, float 0x40362E4300000000, float 0.000000e+00
  %304 = fsub float %302, %303
  %305 = fsub float %304, %240
  %306 = tail call float @llvm.amdgcn.fract.f32(float %23)
  %307 = tail call i1 @llvm.amdgcn.class.f32(float %23, i32 516)
  %308 = select i1 %307, float 0.000000e+00, float %306
  %309 = fcmp oeq float %308, 0.000000e+00
  %310 = select i1 %309, float 0x7FF0000000000000, float %305
  br label %311

311:                                              ; preds = %242, %247, %251
  %312 = phi float [ %246, %242 ], [ %310, %251 ], [ %240, %247 ]
  %313 = fcmp uno float %23, 0.000000e+00
  %314 = fcmp oeq float %23, 0.000000e+00
  %315 = fcmp oeq float %24, 0x7FF0000000000000
  %316 = select i1 %314, i1 true, i1 %315
  %317 = fcmp olt float %24, 0x4160000000000000
  %318 = select i1 %241, i1 true, i1 %317
  %319 = select i1 %318, float %312, float 0x7FF0000000000000
  %320 = select i1 %316, float 0x7FF0000000000000, float %319
  %321 = select i1 %313, float %23, float %320
  %322 = mul nsw i32 %16, %6
  %323 = add nsw i32 %322, %5
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds float, float addrspace(1)* %4, i64 %324
  store float %321, float addrspace(1)* %325, align 4, !tbaa !7
  br label %326

326:                                              ; preds = %311, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{float 2.500000e+00}
