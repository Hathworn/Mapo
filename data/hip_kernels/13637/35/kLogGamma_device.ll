; ModuleID = '../data/hip_kernels/13637/35/main.cu'
source_filename = "../data/hip_kernels/13637/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9kLogGammaPfS_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp ult i32 %15, %2
  br i1 %22, label %24, label %23

23:                                               ; preds = %316, %3
  ret void

24:                                               ; preds = %3, %316
  %25 = phi i32 [ %328, %316 ], [ %15, %3 ]
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16
  %29 = tail call float @llvm.fabs.f32(float %28)
  %30 = fcmp olt float %29, 1.562500e-02
  br i1 %30, label %31, label %50

31:                                               ; preds = %24
  %32 = tail call float @llvm.fmuladd.f32(float %29, float 0x3FD1513220000000, float 0xBFD9A4D560000000)
  %33 = tail call float @llvm.fmuladd.f32(float %29, float %32, float 0x3FEA51A660000000)
  %34 = tail call float @llvm.fmuladd.f32(float %29, float %33, float 0xBFE2788D00000000)
  %35 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 144)
  %36 = select i1 %35, float 0x41F0000000000000, float 1.000000e+00
  %37 = fmul float %29, %36
  %38 = tail call float @llvm.log2.f32(float %37)
  %39 = fmul float %38, 0x3FE62E42E0000000
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 519)
  %41 = fneg float %39
  %42 = tail call float @llvm.fma.f32(float %38, float 0x3FE62E42E0000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %38, float 0x3E6EFA39E0000000, float %42)
  %44 = fadd float %39, %43
  %45 = select i1 %40, float %38, float %44
  %46 = select i1 %35, float 0x40362E4300000000, float 0.000000e+00
  %47 = fsub float %45, %46
  %48 = fneg float %47
  %49 = tail call float @llvm.fmuladd.f32(float %29, float %34, float %48)
  br label %244

50:                                               ; preds = %24
  %51 = fcmp olt float %29, 2.000000e+00
  br i1 %51, label %52, label %146

52:                                               ; preds = %50
  %53 = fcmp ugt float %29, 0x3FECCCCCC0000000
  br i1 %53, label %77, label %54

54:                                               ; preds = %52
  %55 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 144)
  %56 = select i1 %55, float 0x41F0000000000000, float 1.000000e+00
  %57 = fmul float %29, %56
  %58 = tail call float @llvm.log2.f32(float %57)
  %59 = fmul float %58, 0x3FE62E42E0000000
  %60 = tail call i1 @llvm.amdgcn.class.f32(float %58, i32 519)
  %61 = fneg float %59
  %62 = tail call float @llvm.fma.f32(float %58, float 0x3FE62E42E0000000, float %61)
  %63 = tail call float @llvm.fma.f32(float %58, float 0x3E6EFA39E0000000, float %62)
  %64 = fadd float %59, %63
  %65 = select i1 %60, float %58, float %64
  %66 = select i1 %55, float 0x40362E4300000000, float 0.000000e+00
  %67 = fsub float %65, %66
  %68 = fneg float %67
  %69 = fsub float 1.000000e+00, %29
  %70 = fcmp olt float %29, 0x3FE7694460000000
  %71 = fadd float %29, 0xBFDD8B6180000000
  %72 = select i1 %70, float %71, float %69
  %73 = zext i1 %70 to i32
  %74 = fcmp olt float %29, 0x3FCDA66120000000
  %75 = select i1 %74, float %29, float %72
  %76 = select i1 %74, i32 2, i32 %73
  br label %88

77:                                               ; preds = %52
  %78 = fsub float 2.000000e+00, %29
  %79 = fcmp olt float %29, 0x3FFBB4A240000000
  %80 = fadd float %29, 0xBFF762D860000000
  %81 = select i1 %79, float %80, float %78
  %82 = select i1 %79, float 1.000000e+00, float %78
  %83 = fptosi float %82 to i32
  %84 = fcmp olt float %29, 0x3FF3AE1480000000
  %85 = fadd float %29, -1.000000e+00
  %86 = select i1 %84, float %85, float %81
  %87 = select i1 %84, i32 2, i32 %83
  br label %88

88:                                               ; preds = %77, %54
  %89 = phi float [ %75, %54 ], [ %86, %77 ]
  %90 = phi i32 [ %76, %54 ], [ %87, %77 ]
  %91 = phi float [ %68, %54 ], [ 0.000000e+00, %77 ]
  switch i32 %90, label %244 [
    i32 0, label %92
    i32 1, label %108
    i32 2, label %130
  ]

92:                                               ; preds = %88
  %93 = fmul float %89, %89
  %94 = tail call float @llvm.fmuladd.f32(float %93, float 0x3EFA707440000000, float 0x3F2CF2ECE0000000)
  %95 = tail call float @llvm.fmuladd.f32(float %93, float %94, float 0x3F538A9420000000)
  %96 = tail call float @llvm.fmuladd.f32(float %93, float %95, float 0x3F7E404FC0000000)
  %97 = tail call float @llvm.fmuladd.f32(float %93, float %96, float 0x3FB13E0020000000)
  %98 = tail call float @llvm.fmuladd.f32(float %93, float %97, float 0x3FB3C467E0000000)
  %99 = tail call float @llvm.fmuladd.f32(float %93, float 0x3F07858EA0000000, float 0x3F1C5088A0000000)
  %100 = tail call float @llvm.fmuladd.f32(float %93, float %99, float 0x3F40B6C680000000)
  %101 = tail call float @llvm.fmuladd.f32(float %93, float %100, float 0x3F67ADD8C0000000)
  %102 = tail call float @llvm.fmuladd.f32(float %93, float %101, float 0x3F951322A0000000)
  %103 = tail call float @llvm.fmuladd.f32(float %93, float %102, float 0x3FD4A34CC0000000)
  %104 = fmul float %93, %103
  %105 = tail call float @llvm.fmuladd.f32(float %89, float %98, float %104)
  %106 = tail call float @llvm.fmuladd.f32(float %89, float -5.000000e-01, float %105)
  %107 = fadd float %91, %106
  br label %244

108:                                              ; preds = %88
  %109 = fmul float %89, %89
  %110 = fmul float %89, %109
  %111 = tail call float @llvm.fmuladd.f32(float %110, float 0x3F34AF6D60000000, float 0xBF56FE8EC0000000)
  %112 = tail call float @llvm.fmuladd.f32(float %110, float %111, float 0x3F78FCE0E0000000)
  %113 = tail call float @llvm.fmuladd.f32(float %110, float %112, float 0xBFA0C9A8E0000000)
  %114 = tail call float @llvm.fmuladd.f32(float %110, float %113, float 0x3FDEF72BC0000000)
  %115 = tail call float @llvm.fmuladd.f32(float %110, float 0xBF347F24E0000000, float 0x3F4CDF0CE0000000)
  %116 = tail call float @llvm.fmuladd.f32(float %110, float %115, float 0xBF6E2EFFC0000000)
  %117 = tail call float @llvm.fmuladd.f32(float %110, float %116, float 0x3F9266E7A0000000)
  %118 = tail call float @llvm.fmuladd.f32(float %110, float %117, float 0xBFC2E42780000000)
  %119 = tail call float @llvm.fmuladd.f32(float %110, float 0x3F35FD3EE0000000, float 0xBF41A610A0000000)
  %120 = tail call float @llvm.fmuladd.f32(float %110, float %119, float 0x3F6282D320000000)
  %121 = tail call float @llvm.fmuladd.f32(float %110, float %120, float 0xBF851F9FC0000000)
  %122 = tail call float @llvm.fmuladd.f32(float %110, float %121, float 0x3FB08B42A0000000)
  %123 = tail call float @llvm.fmuladd.f32(float %89, float %122, float %118)
  %124 = fneg float %123
  %125 = tail call float @llvm.fmuladd.f32(float %110, float %124, float 0xBC50C7CAA0000000)
  %126 = fneg float %125
  %127 = tail call float @llvm.fmuladd.f32(float %109, float %114, float %126)
  %128 = fadd float %127, 0xBFBF19B9C0000000
  %129 = fadd float %91, %128
  br label %244

130:                                              ; preds = %88
  %131 = tail call float @llvm.fmuladd.f32(float %89, float 0x3F8B678BC0000000, float 0x3FCD4EAF00000000)
  %132 = tail call float @llvm.fmuladd.f32(float %89, float %131, float 0x3FEF497640000000)
  %133 = tail call float @llvm.fmuladd.f32(float %89, float %132, float 0x3FF7475CE0000000)
  %134 = tail call float @llvm.fmuladd.f32(float %89, float %133, float 0x3FE4401E80000000)
  %135 = tail call float @llvm.fmuladd.f32(float %89, float %134, float 0xBFB3C467E0000000)
  %136 = fmul float %89, %135
  %137 = tail call float @llvm.fmuladd.f32(float %89, float 0x3F6A5ABB60000000, float 0x3FBAAE55E0000000)
  %138 = tail call float @llvm.fmuladd.f32(float %89, float %137, float 0x3FE89DFBE0000000)
  %139 = tail call float @llvm.fmuladd.f32(float %89, float %138, float 0x40010725A0000000)
  %140 = tail call float @llvm.fmuladd.f32(float %89, float %139, float 0x4003A5D7C0000000)
  %141 = tail call float @llvm.fmuladd.f32(float %89, float %140, float 1.000000e+00)
  %142 = tail call float @llvm.amdgcn.rcp.f32(float %141)
  %143 = fmul float %136, %142
  %144 = tail call float @llvm.fmuladd.f32(float %89, float -5.000000e-01, float %143)
  %145 = fadd float %91, %144
  br label %244

146:                                              ; preds = %50
  %147 = fcmp olt float %29, 8.000000e+00
  br i1 %147, label %148, label %201

148:                                              ; preds = %146
  %149 = fptosi float %29 to i32
  %150 = sitofp i32 %149 to float
  %151 = fsub float %29, %150
  %152 = tail call float @llvm.fmuladd.f32(float %151, float 0x3F00BFECE0000000, float 0x3F5E26B680000000)
  %153 = tail call float @llvm.fmuladd.f32(float %151, float %152, float 0x3F9B481C80000000)
  %154 = tail call float @llvm.fmuladd.f32(float %151, float %153, float 0x3FC2BB9CC0000000)
  %155 = tail call float @llvm.fmuladd.f32(float %151, float %154, float 0x3FD4D98F40000000)
  %156 = tail call float @llvm.fmuladd.f32(float %151, float %155, float 0x3FCB848B40000000)
  %157 = tail call float @llvm.fmuladd.f32(float %151, float %156, float 0xBFB3C467E0000000)
  %158 = fmul float %151, %157
  %159 = tail call float @llvm.fmuladd.f32(float %151, float 0x3EDEBAF7A0000000, float 0x3F497DDAC0000000)
  %160 = tail call float @llvm.fmuladd.f32(float %151, float %159, float 0x3F9317EA80000000)
  %161 = tail call float @llvm.fmuladd.f32(float %151, float %160, float 0x3FC601EDC0000000)
  %162 = tail call float @llvm.fmuladd.f32(float %151, float %161, float 0x3FE71A18A0000000)
  %163 = tail call float @llvm.fmuladd.f32(float %151, float %162, float 0x3FF645A760000000)
  %164 = tail call float @llvm.fmuladd.f32(float %151, float %163, float 1.000000e+00)
  %165 = tail call float @llvm.amdgcn.rcp.f32(float %164)
  %166 = fmul float %158, %165
  %167 = tail call float @llvm.fmuladd.f32(float %151, float 5.000000e-01, float %166)
  %168 = fadd float %151, 2.000000e+00
  %169 = fadd float %151, 3.000000e+00
  %170 = fadd float %151, 4.000000e+00
  %171 = fadd float %151, 5.000000e+00
  %172 = fadd float %151, 6.000000e+00
  %173 = icmp sgt i32 %149, 2
  %174 = select i1 %173, float %168, float 1.000000e+00
  %175 = icmp sgt i32 %149, 3
  %176 = select i1 %175, float %169, float 1.000000e+00
  %177 = fmul float %174, %176
  %178 = icmp sgt i32 %149, 4
  %179 = select i1 %178, float %170, float 1.000000e+00
  %180 = fmul float %179, %177
  %181 = icmp sgt i32 %149, 5
  %182 = select i1 %181, float %171, float 1.000000e+00
  %183 = fmul float %182, %180
  %184 = icmp sgt i32 %149, 6
  %185 = select i1 %184, float %172, float 1.000000e+00
  %186 = fmul float %185, %183
  %187 = tail call i1 @llvm.amdgcn.class.f32(float %186, i32 144)
  %188 = select i1 %187, float 0x41F0000000000000, float 1.000000e+00
  %189 = fmul float %186, %188
  %190 = tail call float @llvm.log2.f32(float %189)
  %191 = fmul float %190, 0x3FE62E42E0000000
  %192 = tail call i1 @llvm.amdgcn.class.f32(float %190, i32 519)
  %193 = fneg float %191
  %194 = tail call float @llvm.fma.f32(float %190, float 0x3FE62E42E0000000, float %193)
  %195 = tail call float @llvm.fma.f32(float %190, float 0x3E6EFA39E0000000, float %194)
  %196 = fadd float %191, %195
  %197 = select i1 %192, float %190, float %196
  %198 = select i1 %187, float 0x40362E4300000000, float 0.000000e+00
  %199 = fsub float %197, %198
  %200 = fadd float %167, %199
  br label %244

201:                                              ; preds = %146
  %202 = fcmp olt float %29, 0x4390000000000000
  br i1 %202, label %203, label %228

203:                                              ; preds = %201
  %204 = tail call float @llvm.amdgcn.rcp.f32(float %29)
  %205 = fmul float %204, %204
  %206 = tail call float @llvm.fmuladd.f32(float %205, float 0xBF5AB89D00000000, float 0x3F4B67BA40000000)
  %207 = tail call float @llvm.fmuladd.f32(float %205, float %206, float 0xBF4380CB80000000)
  %208 = tail call float @llvm.fmuladd.f32(float %205, float %207, float 0x3F4A019FA0000000)
  %209 = tail call float @llvm.fmuladd.f32(float %205, float %208, float 0xBF66C16C20000000)
  %210 = tail call float @llvm.fmuladd.f32(float %205, float %209, float 0x3FB5555560000000)
  %211 = tail call float @llvm.fmuladd.f32(float %204, float %210, float 0x3FDACFE3A0000000)
  %212 = fadd float %29, -5.000000e-01
  %213 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 144)
  %214 = select i1 %213, float 0x41F0000000000000, float 1.000000e+00
  %215 = fmul float %29, %214
  %216 = tail call float @llvm.log2.f32(float %215)
  %217 = fmul float %216, 0x3FE62E42E0000000
  %218 = tail call i1 @llvm.amdgcn.class.f32(float %216, i32 519)
  %219 = fneg float %217
  %220 = tail call float @llvm.fma.f32(float %216, float 0x3FE62E42E0000000, float %219)
  %221 = tail call float @llvm.fma.f32(float %216, float 0x3E6EFA39E0000000, float %220)
  %222 = fadd float %217, %221
  %223 = select i1 %218, float %216, float %222
  %224 = select i1 %213, float 0x40362E4300000000, float 0.000000e+00
  %225 = fsub float %223, %224
  %226 = fadd float %225, -1.000000e+00
  %227 = tail call float @llvm.fmuladd.f32(float %212, float %226, float %211)
  br label %244

228:                                              ; preds = %201
  %229 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 144)
  %230 = select i1 %229, float 0x41F0000000000000, float 1.000000e+00
  %231 = fmul float %29, %230
  %232 = tail call float @llvm.log2.f32(float %231)
  %233 = fmul float %232, 0x3FE62E42E0000000
  %234 = tail call i1 @llvm.amdgcn.class.f32(float %232, i32 519)
  %235 = fneg float %233
  %236 = tail call float @llvm.fma.f32(float %232, float 0x3FE62E42E0000000, float %235)
  %237 = tail call float @llvm.fma.f32(float %232, float 0x3E6EFA39E0000000, float %236)
  %238 = fadd float %233, %237
  %239 = select i1 %234, float %232, float %238
  %240 = select i1 %229, float 0x40362E4300000000, float 0.000000e+00
  %241 = fsub float %239, %240
  %242 = fneg float %29
  %243 = tail call float @llvm.fmuladd.f32(float %29, float %241, float %242)
  br label %244

244:                                              ; preds = %228, %203, %148, %130, %108, %92, %88, %31
  %245 = phi float [ %49, %31 ], [ %200, %148 ], [ %227, %203 ], [ %243, %228 ], [ %91, %88 ], [ %145, %130 ], [ %129, %108 ], [ %107, %92 ]
  %246 = fcmp oge float %28, 0.000000e+00
  br i1 %246, label %247, label %252

247:                                              ; preds = %244
  %248 = fcmp oeq float %28, 1.000000e+00
  %249 = fcmp oeq float %28, 2.000000e+00
  %250 = or i1 %248, %249
  %251 = select i1 %250, float 0.000000e+00, float %245
  br label %316

252:                                              ; preds = %244
  %253 = fcmp olt float %29, 0x4160000000000000
  %254 = fcmp ogt float %29, 0x3EA0000000000000
  %255 = and i1 %253, %254
  br i1 %255, label %256, label %316

256:                                              ; preds = %252
  %257 = fmul float %29, 5.000000e-01
  %258 = tail call float @llvm.amdgcn.fract.f32(float %257)
  %259 = tail call i1 @llvm.amdgcn.class.f32(float %257, i32 516)
  %260 = fmul float %258, 2.000000e+00
  %261 = select i1 %259, float 0.000000e+00, float %260
  %262 = fcmp ogt float %29, 1.000000e+00
  %263 = select i1 %262, float %261, float %29
  %264 = fmul float %263, 2.000000e+00
  %265 = tail call float @llvm.rint.f32(float %264)
  %266 = tail call float @llvm.fmuladd.f32(float %265, float -5.000000e-01, float %263)
  %267 = fptosi float %265 to i32
  %268 = fmul float %266, %266
  %269 = tail call float @llvm.fmuladd.f32(float %268, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %270 = tail call float @llvm.fmuladd.f32(float %268, float %269, float 0x400468E6C0000000)
  %271 = tail call float @llvm.fmuladd.f32(float %268, float %270, float 0xC014ABC1C0000000)
  %272 = fmul float %266, %268
  %273 = fmul float %272, %271
  %274 = tail call float @llvm.fmuladd.f32(float %266, float 0x400921FB60000000, float %273)
  %275 = tail call float @llvm.fmuladd.f32(float %268, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %276 = tail call float @llvm.fmuladd.f32(float %268, float %275, float 0xBFF55A3B40000000)
  %277 = tail call float @llvm.fmuladd.f32(float %268, float %276, float 0x40103C1A60000000)
  %278 = tail call float @llvm.fmuladd.f32(float %268, float %277, float 0xC013BD3CC0000000)
  %279 = tail call float @llvm.fmuladd.f32(float %268, float %278, float 1.000000e+00)
  %280 = and i32 %267, 1
  %281 = icmp eq i32 %280, 0
  %282 = select i1 %281, float %274, float %279
  %283 = bitcast float %282 to i32
  %284 = shl i32 %267, 30
  %285 = and i32 %284, -2147483648
  %286 = bitcast float %28 to i32
  %287 = bitcast float %29 to i32
  %288 = xor i32 %287, %286
  %289 = xor i32 %288, %285
  %290 = xor i32 %289, %283
  %291 = bitcast i32 %290 to float
  %292 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 504)
  %293 = select i1 %292, float %291, float 0x7FF8000000000000
  %294 = fmul float %28, %293
  %295 = tail call float @llvm.fabs.f32(float %294)
  %296 = fdiv float 0x400921FB60000000, %295, !fpmath !20
  %297 = tail call i1 @llvm.amdgcn.class.f32(float %296, i32 144)
  %298 = select i1 %297, float 0x41F0000000000000, float 1.000000e+00
  %299 = fmul float %296, %298
  %300 = tail call float @llvm.log2.f32(float %299)
  %301 = fmul float %300, 0x3FE62E42E0000000
  %302 = tail call i1 @llvm.amdgcn.class.f32(float %300, i32 519)
  %303 = fneg float %301
  %304 = tail call float @llvm.fma.f32(float %300, float 0x3FE62E42E0000000, float %303)
  %305 = tail call float @llvm.fma.f32(float %300, float 0x3E6EFA39E0000000, float %304)
  %306 = fadd float %301, %305
  %307 = select i1 %302, float %300, float %306
  %308 = select i1 %297, float 0x40362E4300000000, float 0.000000e+00
  %309 = fsub float %307, %308
  %310 = fsub float %309, %245
  %311 = tail call float @llvm.amdgcn.fract.f32(float %28)
  %312 = tail call i1 @llvm.amdgcn.class.f32(float %28, i32 516)
  %313 = select i1 %312, float 0.000000e+00, float %311
  %314 = fcmp oeq float %313, 0.000000e+00
  %315 = select i1 %314, float 0x7FF0000000000000, float %310
  br label %316

316:                                              ; preds = %247, %252, %256
  %317 = phi float [ %251, %247 ], [ %315, %256 ], [ %245, %252 ]
  %318 = fcmp uno float %28, 0.000000e+00
  %319 = fcmp oeq float %28, 0.000000e+00
  %320 = fcmp oeq float %29, 0x7FF0000000000000
  %321 = select i1 %319, i1 true, i1 %320
  %322 = fcmp olt float %29, 0x4160000000000000
  %323 = select i1 %246, i1 true, i1 %322
  %324 = select i1 %323, float %317, float 0x7FF0000000000000
  %325 = select i1 %321, float 0x7FF0000000000000, float %324
  %326 = select i1 %318, float %28, float %325
  %327 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %326, float addrspace(1)* %327, align 4, !tbaa !16
  %328 = add i32 %25, %21
  %329 = icmp ult i32 %328, %2
  br i1 %329, label %24, label %23, !llvm.loop !21
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{float 2.500000e+00}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
