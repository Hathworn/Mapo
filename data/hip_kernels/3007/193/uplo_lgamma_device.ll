; ModuleID = '../data/hip_kernels/3007/193/main.cu'
source_filename = "../data/hip_kernels/3007/193/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11uplo_lgammaiiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %0
  %28 = icmp slt i32 %26, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %347

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %347

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fcmp olt float %44, 1.562500e-02
  br i1 %45, label %46, label %65

46:                                               ; preds = %37
  %47 = tail call float @llvm.fmuladd.f32(float %44, float 0x3FD1513220000000, float 0xBFD9A4D560000000)
  %48 = tail call float @llvm.fmuladd.f32(float %44, float %47, float 0x3FEA51A660000000)
  %49 = tail call float @llvm.fmuladd.f32(float %44, float %48, float 0xBFE2788D00000000)
  %50 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 144)
  %51 = select i1 %50, float 0x41F0000000000000, float 1.000000e+00
  %52 = fmul float %44, %51
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
  %64 = tail call float @llvm.fmuladd.f32(float %44, float %49, float %63)
  br label %259

65:                                               ; preds = %37
  %66 = fcmp olt float %44, 2.000000e+00
  br i1 %66, label %67, label %161

67:                                               ; preds = %65
  %68 = fcmp ugt float %44, 0x3FECCCCCC0000000
  br i1 %68, label %92, label %69

69:                                               ; preds = %67
  %70 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 144)
  %71 = select i1 %70, float 0x41F0000000000000, float 1.000000e+00
  %72 = fmul float %44, %71
  %73 = tail call float @llvm.log2.f32(float %72)
  %74 = fmul float %73, 0x3FE62E42E0000000
  %75 = tail call i1 @llvm.amdgcn.class.f32(float %73, i32 519)
  %76 = fneg float %74
  %77 = tail call float @llvm.fma.f32(float %73, float 0x3FE62E42E0000000, float %76)
  %78 = tail call float @llvm.fma.f32(float %73, float 0x3E6EFA39E0000000, float %77)
  %79 = fadd float %74, %78
  %80 = select i1 %75, float %73, float %79
  %81 = select i1 %70, float 0x40362E4300000000, float 0.000000e+00
  %82 = fsub float %80, %81
  %83 = fneg float %82
  %84 = fsub float 1.000000e+00, %44
  %85 = fcmp olt float %44, 0x3FE7694460000000
  %86 = fadd float %44, 0xBFDD8B6180000000
  %87 = select i1 %85, float %86, float %84
  %88 = zext i1 %85 to i32
  %89 = fcmp olt float %44, 0x3FCDA66120000000
  %90 = select i1 %89, float %44, float %87
  %91 = select i1 %89, i32 2, i32 %88
  br label %103

92:                                               ; preds = %67
  %93 = fsub float 2.000000e+00, %44
  %94 = fcmp olt float %44, 0x3FFBB4A240000000
  %95 = fadd float %44, 0xBFF762D860000000
  %96 = select i1 %94, float %95, float %93
  %97 = select i1 %94, float 1.000000e+00, float %93
  %98 = fptosi float %97 to i32
  %99 = fcmp olt float %44, 0x3FF3AE1480000000
  %100 = fadd float %44, -1.000000e+00
  %101 = select i1 %99, float %100, float %96
  %102 = select i1 %99, i32 2, i32 %98
  br label %103

103:                                              ; preds = %92, %69
  %104 = phi float [ %90, %69 ], [ %101, %92 ]
  %105 = phi i32 [ %91, %69 ], [ %102, %92 ]
  %106 = phi float [ %83, %69 ], [ 0.000000e+00, %92 ]
  switch i32 %105, label %259 [
    i32 0, label %107
    i32 1, label %123
    i32 2, label %145
  ]

107:                                              ; preds = %103
  %108 = fmul float %104, %104
  %109 = tail call float @llvm.fmuladd.f32(float %108, float 0x3EFA707440000000, float 0x3F2CF2ECE0000000)
  %110 = tail call float @llvm.fmuladd.f32(float %108, float %109, float 0x3F538A9420000000)
  %111 = tail call float @llvm.fmuladd.f32(float %108, float %110, float 0x3F7E404FC0000000)
  %112 = tail call float @llvm.fmuladd.f32(float %108, float %111, float 0x3FB13E0020000000)
  %113 = tail call float @llvm.fmuladd.f32(float %108, float %112, float 0x3FB3C467E0000000)
  %114 = tail call float @llvm.fmuladd.f32(float %108, float 0x3F07858EA0000000, float 0x3F1C5088A0000000)
  %115 = tail call float @llvm.fmuladd.f32(float %108, float %114, float 0x3F40B6C680000000)
  %116 = tail call float @llvm.fmuladd.f32(float %108, float %115, float 0x3F67ADD8C0000000)
  %117 = tail call float @llvm.fmuladd.f32(float %108, float %116, float 0x3F951322A0000000)
  %118 = tail call float @llvm.fmuladd.f32(float %108, float %117, float 0x3FD4A34CC0000000)
  %119 = fmul float %108, %118
  %120 = tail call float @llvm.fmuladd.f32(float %104, float %113, float %119)
  %121 = tail call float @llvm.fmuladd.f32(float %104, float -5.000000e-01, float %120)
  %122 = fadd float %106, %121
  br label %259

123:                                              ; preds = %103
  %124 = fmul float %104, %104
  %125 = fmul float %104, %124
  %126 = tail call float @llvm.fmuladd.f32(float %125, float 0x3F34AF6D60000000, float 0xBF56FE8EC0000000)
  %127 = tail call float @llvm.fmuladd.f32(float %125, float %126, float 0x3F78FCE0E0000000)
  %128 = tail call float @llvm.fmuladd.f32(float %125, float %127, float 0xBFA0C9A8E0000000)
  %129 = tail call float @llvm.fmuladd.f32(float %125, float %128, float 0x3FDEF72BC0000000)
  %130 = tail call float @llvm.fmuladd.f32(float %125, float 0xBF347F24E0000000, float 0x3F4CDF0CE0000000)
  %131 = tail call float @llvm.fmuladd.f32(float %125, float %130, float 0xBF6E2EFFC0000000)
  %132 = tail call float @llvm.fmuladd.f32(float %125, float %131, float 0x3F9266E7A0000000)
  %133 = tail call float @llvm.fmuladd.f32(float %125, float %132, float 0xBFC2E42780000000)
  %134 = tail call float @llvm.fmuladd.f32(float %125, float 0x3F35FD3EE0000000, float 0xBF41A610A0000000)
  %135 = tail call float @llvm.fmuladd.f32(float %125, float %134, float 0x3F6282D320000000)
  %136 = tail call float @llvm.fmuladd.f32(float %125, float %135, float 0xBF851F9FC0000000)
  %137 = tail call float @llvm.fmuladd.f32(float %125, float %136, float 0x3FB08B42A0000000)
  %138 = tail call float @llvm.fmuladd.f32(float %104, float %137, float %133)
  %139 = fneg float %138
  %140 = tail call float @llvm.fmuladd.f32(float %125, float %139, float 0xBC50C7CAA0000000)
  %141 = fneg float %140
  %142 = tail call float @llvm.fmuladd.f32(float %124, float %129, float %141)
  %143 = fadd float %142, 0xBFBF19B9C0000000
  %144 = fadd float %106, %143
  br label %259

145:                                              ; preds = %103
  %146 = tail call float @llvm.fmuladd.f32(float %104, float 0x3F8B678BC0000000, float 0x3FCD4EAF00000000)
  %147 = tail call float @llvm.fmuladd.f32(float %104, float %146, float 0x3FEF497640000000)
  %148 = tail call float @llvm.fmuladd.f32(float %104, float %147, float 0x3FF7475CE0000000)
  %149 = tail call float @llvm.fmuladd.f32(float %104, float %148, float 0x3FE4401E80000000)
  %150 = tail call float @llvm.fmuladd.f32(float %104, float %149, float 0xBFB3C467E0000000)
  %151 = fmul float %104, %150
  %152 = tail call float @llvm.fmuladd.f32(float %104, float 0x3F6A5ABB60000000, float 0x3FBAAE55E0000000)
  %153 = tail call float @llvm.fmuladd.f32(float %104, float %152, float 0x3FE89DFBE0000000)
  %154 = tail call float @llvm.fmuladd.f32(float %104, float %153, float 0x40010725A0000000)
  %155 = tail call float @llvm.fmuladd.f32(float %104, float %154, float 0x4003A5D7C0000000)
  %156 = tail call float @llvm.fmuladd.f32(float %104, float %155, float 1.000000e+00)
  %157 = tail call float @llvm.amdgcn.rcp.f32(float %156)
  %158 = fmul float %151, %157
  %159 = tail call float @llvm.fmuladd.f32(float %104, float -5.000000e-01, float %158)
  %160 = fadd float %106, %159
  br label %259

161:                                              ; preds = %65
  %162 = fcmp olt float %44, 8.000000e+00
  br i1 %162, label %163, label %216

163:                                              ; preds = %161
  %164 = fptosi float %44 to i32
  %165 = sitofp i32 %164 to float
  %166 = fsub float %44, %165
  %167 = tail call float @llvm.fmuladd.f32(float %166, float 0x3F00BFECE0000000, float 0x3F5E26B680000000)
  %168 = tail call float @llvm.fmuladd.f32(float %166, float %167, float 0x3F9B481C80000000)
  %169 = tail call float @llvm.fmuladd.f32(float %166, float %168, float 0x3FC2BB9CC0000000)
  %170 = tail call float @llvm.fmuladd.f32(float %166, float %169, float 0x3FD4D98F40000000)
  %171 = tail call float @llvm.fmuladd.f32(float %166, float %170, float 0x3FCB848B40000000)
  %172 = tail call float @llvm.fmuladd.f32(float %166, float %171, float 0xBFB3C467E0000000)
  %173 = fmul float %166, %172
  %174 = tail call float @llvm.fmuladd.f32(float %166, float 0x3EDEBAF7A0000000, float 0x3F497DDAC0000000)
  %175 = tail call float @llvm.fmuladd.f32(float %166, float %174, float 0x3F9317EA80000000)
  %176 = tail call float @llvm.fmuladd.f32(float %166, float %175, float 0x3FC601EDC0000000)
  %177 = tail call float @llvm.fmuladd.f32(float %166, float %176, float 0x3FE71A18A0000000)
  %178 = tail call float @llvm.fmuladd.f32(float %166, float %177, float 0x3FF645A760000000)
  %179 = tail call float @llvm.fmuladd.f32(float %166, float %178, float 1.000000e+00)
  %180 = tail call float @llvm.amdgcn.rcp.f32(float %179)
  %181 = fmul float %173, %180
  %182 = tail call float @llvm.fmuladd.f32(float %166, float 5.000000e-01, float %181)
  %183 = fadd float %166, 2.000000e+00
  %184 = fadd float %166, 3.000000e+00
  %185 = fadd float %166, 4.000000e+00
  %186 = fadd float %166, 5.000000e+00
  %187 = fadd float %166, 6.000000e+00
  %188 = icmp sgt i32 %164, 2
  %189 = select i1 %188, float %183, float 1.000000e+00
  %190 = icmp sgt i32 %164, 3
  %191 = select i1 %190, float %184, float 1.000000e+00
  %192 = fmul float %189, %191
  %193 = icmp sgt i32 %164, 4
  %194 = select i1 %193, float %185, float 1.000000e+00
  %195 = fmul float %194, %192
  %196 = icmp sgt i32 %164, 5
  %197 = select i1 %196, float %186, float 1.000000e+00
  %198 = fmul float %197, %195
  %199 = icmp sgt i32 %164, 6
  %200 = select i1 %199, float %187, float 1.000000e+00
  %201 = fmul float %200, %198
  %202 = tail call i1 @llvm.amdgcn.class.f32(float %201, i32 144)
  %203 = select i1 %202, float 0x41F0000000000000, float 1.000000e+00
  %204 = fmul float %201, %203
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
  %215 = fadd float %182, %214
  br label %259

216:                                              ; preds = %161
  %217 = fcmp olt float %44, 0x4390000000000000
  br i1 %217, label %218, label %243

218:                                              ; preds = %216
  %219 = tail call float @llvm.amdgcn.rcp.f32(float %44)
  %220 = fmul float %219, %219
  %221 = tail call float @llvm.fmuladd.f32(float %220, float 0xBF5AB89D00000000, float 0x3F4B67BA40000000)
  %222 = tail call float @llvm.fmuladd.f32(float %220, float %221, float 0xBF4380CB80000000)
  %223 = tail call float @llvm.fmuladd.f32(float %220, float %222, float 0x3F4A019FA0000000)
  %224 = tail call float @llvm.fmuladd.f32(float %220, float %223, float 0xBF66C16C20000000)
  %225 = tail call float @llvm.fmuladd.f32(float %220, float %224, float 0x3FB5555560000000)
  %226 = tail call float @llvm.fmuladd.f32(float %219, float %225, float 0x3FDACFE3A0000000)
  %227 = fadd float %44, -5.000000e-01
  %228 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 144)
  %229 = select i1 %228, float 0x41F0000000000000, float 1.000000e+00
  %230 = fmul float %44, %229
  %231 = tail call float @llvm.log2.f32(float %230)
  %232 = fmul float %231, 0x3FE62E42E0000000
  %233 = tail call i1 @llvm.amdgcn.class.f32(float %231, i32 519)
  %234 = fneg float %232
  %235 = tail call float @llvm.fma.f32(float %231, float 0x3FE62E42E0000000, float %234)
  %236 = tail call float @llvm.fma.f32(float %231, float 0x3E6EFA39E0000000, float %235)
  %237 = fadd float %232, %236
  %238 = select i1 %233, float %231, float %237
  %239 = select i1 %228, float 0x40362E4300000000, float 0.000000e+00
  %240 = fsub float %238, %239
  %241 = fadd float %240, -1.000000e+00
  %242 = tail call float @llvm.fmuladd.f32(float %227, float %241, float %226)
  br label %259

243:                                              ; preds = %216
  %244 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 144)
  %245 = select i1 %244, float 0x41F0000000000000, float 1.000000e+00
  %246 = fmul float %44, %245
  %247 = tail call float @llvm.log2.f32(float %246)
  %248 = fmul float %247, 0x3FE62E42E0000000
  %249 = tail call i1 @llvm.amdgcn.class.f32(float %247, i32 519)
  %250 = fneg float %248
  %251 = tail call float @llvm.fma.f32(float %247, float 0x3FE62E42E0000000, float %250)
  %252 = tail call float @llvm.fma.f32(float %247, float 0x3E6EFA39E0000000, float %251)
  %253 = fadd float %248, %252
  %254 = select i1 %249, float %247, float %253
  %255 = select i1 %244, float 0x40362E4300000000, float 0.000000e+00
  %256 = fsub float %254, %255
  %257 = fneg float %44
  %258 = tail call float @llvm.fmuladd.f32(float %44, float %256, float %257)
  br label %259

259:                                              ; preds = %243, %218, %163, %145, %123, %107, %103, %46
  %260 = phi float [ %64, %46 ], [ %215, %163 ], [ %242, %218 ], [ %258, %243 ], [ %106, %103 ], [ %160, %145 ], [ %144, %123 ], [ %122, %107 ]
  %261 = fcmp oge float %43, 0.000000e+00
  br i1 %261, label %262, label %267

262:                                              ; preds = %259
  %263 = fcmp oeq float %43, 1.000000e+00
  %264 = fcmp oeq float %43, 2.000000e+00
  %265 = or i1 %263, %264
  %266 = select i1 %265, float 0.000000e+00, float %260
  br label %331

267:                                              ; preds = %259
  %268 = fcmp olt float %44, 0x4160000000000000
  %269 = fcmp ogt float %44, 0x3EA0000000000000
  %270 = and i1 %268, %269
  br i1 %270, label %271, label %331

271:                                              ; preds = %267
  %272 = fmul float %44, 5.000000e-01
  %273 = tail call float @llvm.amdgcn.fract.f32(float %272)
  %274 = tail call i1 @llvm.amdgcn.class.f32(float %272, i32 516)
  %275 = fmul float %273, 2.000000e+00
  %276 = select i1 %274, float 0.000000e+00, float %275
  %277 = fcmp ogt float %44, 1.000000e+00
  %278 = select i1 %277, float %276, float %44
  %279 = fmul float %278, 2.000000e+00
  %280 = tail call float @llvm.rint.f32(float %279)
  %281 = tail call float @llvm.fmuladd.f32(float %280, float -5.000000e-01, float %278)
  %282 = fptosi float %280 to i32
  %283 = fmul float %281, %281
  %284 = tail call float @llvm.fmuladd.f32(float %283, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %285 = tail call float @llvm.fmuladd.f32(float %283, float %284, float 0x400468E6C0000000)
  %286 = tail call float @llvm.fmuladd.f32(float %283, float %285, float 0xC014ABC1C0000000)
  %287 = fmul float %281, %283
  %288 = fmul float %287, %286
  %289 = tail call float @llvm.fmuladd.f32(float %281, float 0x400921FB60000000, float %288)
  %290 = tail call float @llvm.fmuladd.f32(float %283, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %291 = tail call float @llvm.fmuladd.f32(float %283, float %290, float 0xBFF55A3B40000000)
  %292 = tail call float @llvm.fmuladd.f32(float %283, float %291, float 0x40103C1A60000000)
  %293 = tail call float @llvm.fmuladd.f32(float %283, float %292, float 0xC013BD3CC0000000)
  %294 = tail call float @llvm.fmuladd.f32(float %283, float %293, float 1.000000e+00)
  %295 = and i32 %282, 1
  %296 = icmp eq i32 %295, 0
  %297 = select i1 %296, float %289, float %294
  %298 = bitcast float %297 to i32
  %299 = shl i32 %282, 30
  %300 = and i32 %299, -2147483648
  %301 = bitcast float %43 to i32
  %302 = bitcast float %44 to i32
  %303 = xor i32 %302, %301
  %304 = xor i32 %303, %300
  %305 = xor i32 %304, %298
  %306 = bitcast i32 %305 to float
  %307 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 504)
  %308 = select i1 %307, float %306, float 0x7FF8000000000000
  %309 = fmul float %43, %308
  %310 = tail call float @llvm.fabs.f32(float %309)
  %311 = fdiv float 0x400921FB60000000, %310, !fpmath !11
  %312 = tail call i1 @llvm.amdgcn.class.f32(float %311, i32 144)
  %313 = select i1 %312, float 0x41F0000000000000, float 1.000000e+00
  %314 = fmul float %311, %313
  %315 = tail call float @llvm.log2.f32(float %314)
  %316 = fmul float %315, 0x3FE62E42E0000000
  %317 = tail call i1 @llvm.amdgcn.class.f32(float %315, i32 519)
  %318 = fneg float %316
  %319 = tail call float @llvm.fma.f32(float %315, float 0x3FE62E42E0000000, float %318)
  %320 = tail call float @llvm.fma.f32(float %315, float 0x3E6EFA39E0000000, float %319)
  %321 = fadd float %316, %320
  %322 = select i1 %317, float %315, float %321
  %323 = select i1 %312, float 0x40362E4300000000, float 0.000000e+00
  %324 = fsub float %322, %323
  %325 = fsub float %324, %260
  %326 = tail call float @llvm.amdgcn.fract.f32(float %43)
  %327 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 516)
  %328 = select i1 %327, float 0.000000e+00, float %326
  %329 = fcmp oeq float %328, 0.000000e+00
  %330 = select i1 %329, float 0x7FF0000000000000, float %325
  br label %331

331:                                              ; preds = %262, %267, %271
  %332 = phi float [ %266, %262 ], [ %330, %271 ], [ %260, %267 ]
  %333 = fcmp uno float %43, 0.000000e+00
  %334 = fcmp oeq float %43, 0.000000e+00
  %335 = fcmp oeq float %44, 0x7FF0000000000000
  %336 = select i1 %334, i1 true, i1 %335
  %337 = fcmp olt float %44, 0x4160000000000000
  %338 = select i1 %261, i1 true, i1 %337
  %339 = select i1 %338, float %332, float 0x7FF0000000000000
  %340 = select i1 %336, float 0x7FF0000000000000, float %339
  %341 = select i1 %333, float %43, float %340
  %342 = add nsw i32 %18, %7
  %343 = mul nsw i32 %26, %8
  %344 = add nsw i32 %342, %343
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds float, float addrspace(1)* %6, i64 %345
  store float %341, float addrspace(1)* %346, align 4, !tbaa !7
  br label %347

347:                                              ; preds = %9, %331, %30
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
