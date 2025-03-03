; ModuleID = '../data/hip_kernels/16034/56/main.cu'
source_filename = "../data/hip_kernels/16034/56/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_lgamma(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %749

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = bitcast double %36 to <2 x i32>
  %38 = extractelement <2 x i32> %37, i64 1
  %39 = icmp ult i32 %38, 1064304640
  br i1 %39, label %40, label %128

40:                                               ; preds = %32
  %41 = tail call double @llvm.fma.f64(double %36, double 0xBFCA8B9C17AA6149, double 0x3FD151322AC7D848)
  %42 = tail call double @llvm.fma.f64(double %36, double %41, double 0xBFD9A4D55BEAB2D7)
  %43 = tail call double @llvm.fma.f64(double %36, double %42, double 0x3FEA51A6625307D3)
  %44 = tail call double @llvm.fma.f64(double %36, double %43, double 0xBFE2788CFC6FB619)
  %45 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %46 = fcmp olt double %45, 0x3FE5555555555555
  %47 = zext i1 %46 to i32
  %48 = tail call double @llvm.amdgcn.ldexp.f64(double %45, i32 %47)
  %49 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %50 = sub nsw i32 %49, %47
  %51 = fadd double %48, -1.000000e+00
  %52 = fadd double %48, 1.000000e+00
  %53 = fadd double %52, -1.000000e+00
  %54 = fsub double %48, %53
  %55 = tail call double @llvm.amdgcn.rcp.f64(double %52)
  %56 = fneg double %52
  %57 = tail call double @llvm.fma.f64(double %56, double %55, double 1.000000e+00)
  %58 = tail call double @llvm.fma.f64(double %57, double %55, double %55)
  %59 = tail call double @llvm.fma.f64(double %56, double %58, double 1.000000e+00)
  %60 = tail call double @llvm.fma.f64(double %59, double %58, double %58)
  %61 = fmul double %51, %60
  %62 = fmul double %52, %61
  %63 = fneg double %62
  %64 = tail call double @llvm.fma.f64(double %61, double %52, double %63)
  %65 = tail call double @llvm.fma.f64(double %61, double %54, double %64)
  %66 = fadd double %62, %65
  %67 = fsub double %66, %62
  %68 = fsub double %65, %67
  %69 = fsub double %51, %66
  %70 = fsub double %51, %69
  %71 = fsub double %70, %66
  %72 = fsub double %71, %68
  %73 = fadd double %69, %72
  %74 = fmul double %60, %73
  %75 = fadd double %61, %74
  %76 = fsub double %75, %61
  %77 = fsub double %74, %76
  %78 = fmul double %75, %75
  %79 = tail call double @llvm.fma.f64(double %78, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %80 = tail call double @llvm.fma.f64(double %78, double %79, double 0x3FC7474DD7F4DF2E)
  %81 = tail call double @llvm.fma.f64(double %78, double %80, double 0x3FCC71C016291751)
  %82 = tail call double @llvm.fma.f64(double %78, double %81, double 0x3FD249249B27ACF1)
  %83 = tail call double @llvm.fma.f64(double %78, double %82, double 0x3FD99999998EF7B6)
  %84 = tail call double @llvm.fma.f64(double %78, double %83, double 0x3FE5555555555780)
  %85 = tail call double @llvm.amdgcn.ldexp.f64(double %75, i32 1)
  %86 = tail call double @llvm.amdgcn.ldexp.f64(double %77, i32 1)
  %87 = fmul double %75, %78
  %88 = fmul double %87, %84
  %89 = fadd double %85, %88
  %90 = fsub double %89, %85
  %91 = fsub double %88, %90
  %92 = fadd double %86, %91
  %93 = fadd double %89, %92
  %94 = fsub double %93, %89
  %95 = fsub double %92, %94
  %96 = sitofp i32 %50 to double
  %97 = fmul double %96, 0x3FE62E42FEFA39EF
  %98 = fneg double %97
  %99 = tail call double @llvm.fma.f64(double %96, double 0x3FE62E42FEFA39EF, double %98)
  %100 = tail call double @llvm.fma.f64(double %96, double 0x3C7ABC9E3B39803F, double %99)
  %101 = fadd double %97, %100
  %102 = fsub double %101, %97
  %103 = fsub double %100, %102
  %104 = fadd double %101, %93
  %105 = fsub double %104, %101
  %106 = fsub double %104, %105
  %107 = fsub double %101, %106
  %108 = fsub double %93, %105
  %109 = fadd double %108, %107
  %110 = fadd double %103, %95
  %111 = fsub double %110, %103
  %112 = fsub double %110, %111
  %113 = fsub double %103, %112
  %114 = fsub double %95, %111
  %115 = fadd double %114, %113
  %116 = fadd double %110, %109
  %117 = fadd double %104, %116
  %118 = fsub double %117, %104
  %119 = fsub double %116, %118
  %120 = fadd double %115, %119
  %121 = fadd double %117, %120
  %122 = fcmp oeq double %36, 0x7FF0000000000000
  %123 = select i1 %122, double %36, double %121
  %124 = fcmp oeq double %35, 0.000000e+00
  %125 = select i1 %124, double 0xFFF0000000000000, double %123
  %126 = fneg double %125
  %127 = tail call double @llvm.fma.f64(double %36, double %44, double %126)
  br label %594

128:                                              ; preds = %32
  %129 = icmp ult i32 %38, 1073741824
  br i1 %129, label %130, label %290

130:                                              ; preds = %128
  %131 = icmp ult i32 %38, 1072483533
  br i1 %131, label %132, label %223

132:                                              ; preds = %130
  %133 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %134 = fcmp olt double %133, 0x3FE5555555555555
  %135 = zext i1 %134 to i32
  %136 = tail call double @llvm.amdgcn.ldexp.f64(double %133, i32 %135)
  %137 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %138 = sub nsw i32 %137, %135
  %139 = fadd double %136, -1.000000e+00
  %140 = fadd double %136, 1.000000e+00
  %141 = fadd double %140, -1.000000e+00
  %142 = fsub double %136, %141
  %143 = tail call double @llvm.amdgcn.rcp.f64(double %140)
  %144 = fneg double %140
  %145 = tail call double @llvm.fma.f64(double %144, double %143, double 1.000000e+00)
  %146 = tail call double @llvm.fma.f64(double %145, double %143, double %143)
  %147 = tail call double @llvm.fma.f64(double %144, double %146, double 1.000000e+00)
  %148 = tail call double @llvm.fma.f64(double %147, double %146, double %146)
  %149 = fmul double %139, %148
  %150 = fmul double %140, %149
  %151 = fneg double %150
  %152 = tail call double @llvm.fma.f64(double %149, double %140, double %151)
  %153 = tail call double @llvm.fma.f64(double %149, double %142, double %152)
  %154 = fadd double %150, %153
  %155 = fsub double %154, %150
  %156 = fsub double %153, %155
  %157 = fsub double %139, %154
  %158 = fsub double %139, %157
  %159 = fsub double %158, %154
  %160 = fsub double %159, %156
  %161 = fadd double %157, %160
  %162 = fmul double %148, %161
  %163 = fadd double %149, %162
  %164 = fsub double %163, %149
  %165 = fsub double %162, %164
  %166 = fmul double %163, %163
  %167 = tail call double @llvm.fma.f64(double %166, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %168 = tail call double @llvm.fma.f64(double %166, double %167, double 0x3FC7474DD7F4DF2E)
  %169 = tail call double @llvm.fma.f64(double %166, double %168, double 0x3FCC71C016291751)
  %170 = tail call double @llvm.fma.f64(double %166, double %169, double 0x3FD249249B27ACF1)
  %171 = tail call double @llvm.fma.f64(double %166, double %170, double 0x3FD99999998EF7B6)
  %172 = tail call double @llvm.fma.f64(double %166, double %171, double 0x3FE5555555555780)
  %173 = tail call double @llvm.amdgcn.ldexp.f64(double %163, i32 1)
  %174 = tail call double @llvm.amdgcn.ldexp.f64(double %165, i32 1)
  %175 = fmul double %163, %166
  %176 = fmul double %175, %172
  %177 = fadd double %173, %176
  %178 = fsub double %177, %173
  %179 = fsub double %176, %178
  %180 = fadd double %174, %179
  %181 = fadd double %177, %180
  %182 = fsub double %181, %177
  %183 = fsub double %180, %182
  %184 = sitofp i32 %138 to double
  %185 = fmul double %184, 0x3FE62E42FEFA39EF
  %186 = fneg double %185
  %187 = tail call double @llvm.fma.f64(double %184, double 0x3FE62E42FEFA39EF, double %186)
  %188 = tail call double @llvm.fma.f64(double %184, double 0x3C7ABC9E3B39803F, double %187)
  %189 = fadd double %185, %188
  %190 = fsub double %189, %185
  %191 = fsub double %188, %190
  %192 = fadd double %189, %181
  %193 = fsub double %192, %189
  %194 = fsub double %192, %193
  %195 = fsub double %189, %194
  %196 = fsub double %181, %193
  %197 = fadd double %196, %195
  %198 = fadd double %191, %183
  %199 = fsub double %198, %191
  %200 = fsub double %198, %199
  %201 = fsub double %191, %200
  %202 = fsub double %183, %199
  %203 = fadd double %202, %201
  %204 = fadd double %198, %197
  %205 = fadd double %192, %204
  %206 = fsub double %205, %192
  %207 = fsub double %204, %206
  %208 = fadd double %203, %207
  %209 = fadd double %205, %208
  %210 = fcmp oeq double %36, 0x7FF0000000000000
  %211 = select i1 %210, double %36, double %209
  %212 = fcmp oeq double %35, 0.000000e+00
  %213 = select i1 %212, double 0xFFF0000000000000, double %211
  %214 = fneg double %213
  %215 = fsub double 1.000000e+00, %36
  %216 = icmp ult i32 %38, 1072130372
  %217 = fadd double %36, 0xBFDD8B618D5AF8FC
  %218 = select i1 %216, double %217, double %215
  %219 = zext i1 %216 to i32
  %220 = icmp ult i32 %38, 1070442081
  %221 = select i1 %220, double %36, double %218
  %222 = select i1 %220, i32 2, i32 %219
  br label %233

223:                                              ; preds = %130
  %224 = fsub double 2.000000e+00, %36
  %225 = icmp ult i32 %38, 1073460419
  %226 = fadd double %36, 0xBFF762D86356BE3F
  %227 = select i1 %225, double %226, double %224
  %228 = zext i1 %225 to i32
  %229 = icmp ult i32 %38, 1072936132
  %230 = fadd double %36, -1.000000e+00
  %231 = select i1 %229, double %230, double %227
  %232 = select i1 %229, i32 2, i32 %228
  br label %233

233:                                              ; preds = %223, %132
  %234 = phi double [ %221, %132 ], [ %231, %223 ]
  %235 = phi i32 [ %222, %132 ], [ %232, %223 ]
  %236 = phi double [ %214, %132 ], [ 0.000000e+00, %223 ]
  switch i32 %235, label %594 [
    i32 0, label %237
    i32 1, label %253
    i32 2, label %275
  ]

237:                                              ; preds = %233
  %238 = fmul double %234, %234
  %239 = tail call double @llvm.fma.f64(double %238, double 0x3EFA7074428CFA52, double 0x3F2CF2ECED10E54D)
  %240 = tail call double @llvm.fma.f64(double %238, double %239, double 0x3F538A94116F3F5D)
  %241 = tail call double @llvm.fma.f64(double %238, double %240, double 0x3F7E404FB68FEFE8)
  %242 = tail call double @llvm.fma.f64(double %238, double %241, double 0x3FB13E001A5562A7)
  %243 = tail call double @llvm.fma.f64(double %238, double %242, double 0x3FB3C467E37DB0C8)
  %244 = tail call double @llvm.fma.f64(double %238, double 0x3F07858E90A45837, double 0x3F1C5088987DFB07)
  %245 = tail call double @llvm.fma.f64(double %238, double %244, double 0x3F40B6C689B99C00)
  %246 = tail call double @llvm.fma.f64(double %238, double %245, double 0x3F67ADD8CCB7926B)
  %247 = tail call double @llvm.fma.f64(double %238, double %246, double 0x3F951322AC92547B)
  %248 = tail call double @llvm.fma.f64(double %238, double %247, double 0x3FD4A34CC4A60FAD)
  %249 = fmul double %238, %248
  %250 = tail call double @llvm.fma.f64(double %234, double %243, double %249)
  %251 = tail call double @llvm.fma.f64(double %234, double -5.000000e-01, double %250)
  %252 = fadd double %236, %251
  br label %594

253:                                              ; preds = %233
  %254 = fmul double %234, %234
  %255 = fmul double %234, %254
  %256 = tail call double @llvm.fma.f64(double %255, double 0x3F34AF6D6C0EBBF7, double 0xBF56FE8EBF2D1AF1)
  %257 = tail call double @llvm.fma.f64(double %255, double %256, double 0x3F78FCE0E370E344)
  %258 = tail call double @llvm.fma.f64(double %255, double %257, double 0xBFA0C9A8DF35B713)
  %259 = tail call double @llvm.fma.f64(double %255, double %258, double 0x3FDEF72BC8EE38A2)
  %260 = tail call double @llvm.fma.f64(double %255, double 0xBF347F24ECC38C38, double 0x3F4CDF0CEF61A8E9)
  %261 = tail call double @llvm.fma.f64(double %255, double %260, double 0xBF6E2EFFB3E914D7)
  %262 = tail call double @llvm.fma.f64(double %255, double %261, double 0x3F9266E7970AF9EC)
  %263 = tail call double @llvm.fma.f64(double %255, double %262, double 0xBFC2E4278DC6C509)
  %264 = tail call double @llvm.fma.f64(double %255, double 0x3F35FD3EE8C2D3F4, double 0xBF41A6109C73E0EC)
  %265 = tail call double @llvm.fma.f64(double %255, double %264, double 0x3F6282D32E15C915)
  %266 = tail call double @llvm.fma.f64(double %255, double %265, double 0xBF851F9FBA91EC6A)
  %267 = tail call double @llvm.fma.f64(double %255, double %266, double 0x3FB08B4294D5419B)
  %268 = tail call double @llvm.fma.f64(double %234, double %267, double %263)
  %269 = fneg double %268
  %270 = tail call double @llvm.fma.f64(double %255, double %269, double 0xBC50C7CAA48A971F)
  %271 = fneg double %270
  %272 = tail call double @llvm.fma.f64(double %254, double %259, double %271)
  %273 = fadd double %272, 0xBFBF19B9BCC38A42
  %274 = fadd double %236, %273
  br label %594

275:                                              ; preds = %233
  %276 = tail call double @llvm.fma.f64(double %234, double 0x3F8B678BBF2BAB09, double 0x3FCD4EAEF6010924)
  %277 = tail call double @llvm.fma.f64(double %234, double %276, double 0x3FEF497644EA8450)
  %278 = tail call double @llvm.fma.f64(double %234, double %277, double 0x3FF7475CD119BD6F)
  %279 = tail call double @llvm.fma.f64(double %234, double %278, double 0x3FE4401E8B005DFF)
  %280 = tail call double @llvm.fma.f64(double %234, double %279, double 0xBFB3C467E37DB0C8)
  %281 = fmul double %234, %280
  %282 = tail call double @llvm.fma.f64(double %234, double 0x3F6A5ABB57D0CF61, double 0x3FBAAE55D6537C88)
  %283 = tail call double @llvm.fma.f64(double %234, double %282, double 0x3FE89DFBE45050AF)
  %284 = tail call double @llvm.fma.f64(double %234, double %283, double 0x40010725A42B18F5)
  %285 = tail call double @llvm.fma.f64(double %234, double %284, double 0x4003A5D7C2BD619C)
  %286 = tail call double @llvm.fma.f64(double %234, double %285, double 1.000000e+00)
  %287 = fdiv double %281, %286
  %288 = tail call double @llvm.fma.f64(double %234, double -5.000000e-01, double %287)
  %289 = fadd double %236, %288
  br label %594

290:                                              ; preds = %128
  %291 = icmp ult i32 %38, 1075838976
  br i1 %291, label %292, label %415

292:                                              ; preds = %290
  %293 = fptosi double %36 to i32
  %294 = sitofp i32 %293 to double
  %295 = fsub double %36, %294
  %296 = tail call double @llvm.fma.f64(double %295, double 0x3F00BFECDD17E945, double 0x3F5E26B67368F239)
  %297 = tail call double @llvm.fma.f64(double %295, double %296, double 0x3F9B481C7E939961)
  %298 = tail call double @llvm.fma.f64(double %295, double %297, double 0x3FC2BB9CBEE5F2F7)
  %299 = tail call double @llvm.fma.f64(double %295, double %298, double 0x3FD4D98F4F139F59)
  %300 = tail call double @llvm.fma.f64(double %295, double %299, double 0x3FCB848B36E20878)
  %301 = tail call double @llvm.fma.f64(double %295, double %300, double 0xBFB3C467E37DB0C8)
  %302 = fmul double %295, %301
  %303 = tail call double @llvm.fma.f64(double %295, double 0x3EDEBAF7A5B38140, double 0x3F497DDACA41A95B)
  %304 = tail call double @llvm.fma.f64(double %295, double %303, double 0x3F9317EA742ED475)
  %305 = tail call double @llvm.fma.f64(double %295, double %304, double 0x3FC601EDCCFBDF27)
  %306 = tail call double @llvm.fma.f64(double %295, double %305, double 0x3FE71A1893D3DCDC)
  %307 = tail call double @llvm.fma.f64(double %295, double %306, double 0x3FF645A762C4AB74)
  %308 = tail call double @llvm.fma.f64(double %295, double %307, double 1.000000e+00)
  %309 = fdiv double %302, %308
  %310 = tail call double @llvm.fma.f64(double %295, double 5.000000e-01, double %309)
  %311 = fadd double %295, 2.000000e+00
  %312 = fadd double %295, 3.000000e+00
  %313 = fadd double %295, 4.000000e+00
  %314 = fadd double %295, 5.000000e+00
  %315 = fadd double %295, 6.000000e+00
  %316 = icmp sgt i32 %293, 2
  %317 = select i1 %316, double %311, double 1.000000e+00
  %318 = icmp sgt i32 %293, 3
  %319 = select i1 %318, double %312, double 1.000000e+00
  %320 = fmul double %317, %319
  %321 = icmp sgt i32 %293, 4
  %322 = select i1 %321, double %313, double 1.000000e+00
  %323 = fmul double %322, %320
  %324 = icmp sgt i32 %293, 5
  %325 = select i1 %324, double %314, double 1.000000e+00
  %326 = fmul double %325, %323
  %327 = icmp sgt i32 %293, 6
  %328 = select i1 %327, double %315, double 1.000000e+00
  %329 = fmul double %328, %326
  %330 = tail call double @llvm.amdgcn.frexp.mant.f64(double %329)
  %331 = fcmp olt double %330, 0x3FE5555555555555
  %332 = zext i1 %331 to i32
  %333 = tail call double @llvm.amdgcn.ldexp.f64(double %330, i32 %332)
  %334 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %329)
  %335 = sub nsw i32 %334, %332
  %336 = fadd double %333, -1.000000e+00
  %337 = fadd double %333, 1.000000e+00
  %338 = fadd double %337, -1.000000e+00
  %339 = fsub double %333, %338
  %340 = tail call double @llvm.amdgcn.rcp.f64(double %337)
  %341 = fneg double %337
  %342 = tail call double @llvm.fma.f64(double %341, double %340, double 1.000000e+00)
  %343 = tail call double @llvm.fma.f64(double %342, double %340, double %340)
  %344 = tail call double @llvm.fma.f64(double %341, double %343, double 1.000000e+00)
  %345 = tail call double @llvm.fma.f64(double %344, double %343, double %343)
  %346 = fmul double %336, %345
  %347 = fmul double %337, %346
  %348 = fneg double %347
  %349 = tail call double @llvm.fma.f64(double %346, double %337, double %348)
  %350 = tail call double @llvm.fma.f64(double %346, double %339, double %349)
  %351 = fadd double %347, %350
  %352 = fsub double %351, %347
  %353 = fsub double %350, %352
  %354 = fsub double %336, %351
  %355 = fsub double %336, %354
  %356 = fsub double %355, %351
  %357 = fsub double %356, %353
  %358 = fadd double %354, %357
  %359 = fmul double %345, %358
  %360 = fadd double %346, %359
  %361 = fsub double %360, %346
  %362 = fsub double %359, %361
  %363 = fmul double %360, %360
  %364 = tail call double @llvm.fma.f64(double %363, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %365 = tail call double @llvm.fma.f64(double %363, double %364, double 0x3FC7474DD7F4DF2E)
  %366 = tail call double @llvm.fma.f64(double %363, double %365, double 0x3FCC71C016291751)
  %367 = tail call double @llvm.fma.f64(double %363, double %366, double 0x3FD249249B27ACF1)
  %368 = tail call double @llvm.fma.f64(double %363, double %367, double 0x3FD99999998EF7B6)
  %369 = tail call double @llvm.fma.f64(double %363, double %368, double 0x3FE5555555555780)
  %370 = tail call double @llvm.amdgcn.ldexp.f64(double %360, i32 1)
  %371 = tail call double @llvm.amdgcn.ldexp.f64(double %362, i32 1)
  %372 = fmul double %360, %363
  %373 = fmul double %372, %369
  %374 = fadd double %370, %373
  %375 = fsub double %374, %370
  %376 = fsub double %373, %375
  %377 = fadd double %371, %376
  %378 = fadd double %374, %377
  %379 = fsub double %378, %374
  %380 = fsub double %377, %379
  %381 = sitofp i32 %335 to double
  %382 = fmul double %381, 0x3FE62E42FEFA39EF
  %383 = fneg double %382
  %384 = tail call double @llvm.fma.f64(double %381, double 0x3FE62E42FEFA39EF, double %383)
  %385 = tail call double @llvm.fma.f64(double %381, double 0x3C7ABC9E3B39803F, double %384)
  %386 = fadd double %382, %385
  %387 = fsub double %386, %382
  %388 = fsub double %385, %387
  %389 = fadd double %386, %378
  %390 = fsub double %389, %386
  %391 = fsub double %389, %390
  %392 = fsub double %386, %391
  %393 = fsub double %378, %390
  %394 = fadd double %393, %392
  %395 = fadd double %388, %380
  %396 = fsub double %395, %388
  %397 = fsub double %395, %396
  %398 = fsub double %388, %397
  %399 = fsub double %380, %396
  %400 = fadd double %399, %398
  %401 = fadd double %395, %394
  %402 = fadd double %389, %401
  %403 = fsub double %402, %389
  %404 = fsub double %401, %403
  %405 = fadd double %400, %404
  %406 = fadd double %402, %405
  %407 = tail call double @llvm.fabs.f64(double %329) #3
  %408 = fcmp oeq double %407, 0x7FF0000000000000
  %409 = select i1 %408, double %329, double %406
  %410 = fcmp olt double %329, 0.000000e+00
  %411 = select i1 %410, double 0x7FF8000000000000, double %409
  %412 = fcmp oeq double %329, 0.000000e+00
  %413 = select i1 %412, double 0xFFF0000000000000, double %411
  %414 = fadd double %310, %413
  br label %594

415:                                              ; preds = %290
  %416 = icmp ult i32 %38, 1133510656
  br i1 %416, label %417, label %510

417:                                              ; preds = %415
  %418 = fdiv double 1.000000e+00, %36
  %419 = fmul double %418, %418
  %420 = tail call double @llvm.fma.f64(double %419, double 0xBF5AB89D0B9E43E4, double 0x3F4B67BA4CDAD5D1)
  %421 = tail call double @llvm.fma.f64(double %419, double %420, double 0xBF4380CB8C0FE741)
  %422 = tail call double @llvm.fma.f64(double %419, double %421, double 0x3F4A019F98CF38B6)
  %423 = tail call double @llvm.fma.f64(double %419, double %422, double 0xBF66C16C16B02E5C)
  %424 = tail call double @llvm.fma.f64(double %419, double %423, double 0x3FB555555555553B)
  %425 = tail call double @llvm.fma.f64(double %418, double %424, double 0x3FDACFE390C97D69)
  %426 = fadd double %36, -5.000000e-01
  %427 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %428 = fcmp olt double %427, 0x3FE5555555555555
  %429 = zext i1 %428 to i32
  %430 = tail call double @llvm.amdgcn.ldexp.f64(double %427, i32 %429)
  %431 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %432 = sub nsw i32 %431, %429
  %433 = fadd double %430, -1.000000e+00
  %434 = fadd double %430, 1.000000e+00
  %435 = fadd double %434, -1.000000e+00
  %436 = fsub double %430, %435
  %437 = tail call double @llvm.amdgcn.rcp.f64(double %434)
  %438 = fneg double %434
  %439 = tail call double @llvm.fma.f64(double %438, double %437, double 1.000000e+00)
  %440 = tail call double @llvm.fma.f64(double %439, double %437, double %437)
  %441 = tail call double @llvm.fma.f64(double %438, double %440, double 1.000000e+00)
  %442 = tail call double @llvm.fma.f64(double %441, double %440, double %440)
  %443 = fmul double %433, %442
  %444 = fmul double %434, %443
  %445 = fneg double %444
  %446 = tail call double @llvm.fma.f64(double %443, double %434, double %445)
  %447 = tail call double @llvm.fma.f64(double %443, double %436, double %446)
  %448 = fadd double %444, %447
  %449 = fsub double %448, %444
  %450 = fsub double %447, %449
  %451 = fsub double %433, %448
  %452 = fsub double %433, %451
  %453 = fsub double %452, %448
  %454 = fsub double %453, %450
  %455 = fadd double %451, %454
  %456 = fmul double %442, %455
  %457 = fadd double %443, %456
  %458 = fsub double %457, %443
  %459 = fsub double %456, %458
  %460 = fmul double %457, %457
  %461 = tail call double @llvm.fma.f64(double %460, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %462 = tail call double @llvm.fma.f64(double %460, double %461, double 0x3FC7474DD7F4DF2E)
  %463 = tail call double @llvm.fma.f64(double %460, double %462, double 0x3FCC71C016291751)
  %464 = tail call double @llvm.fma.f64(double %460, double %463, double 0x3FD249249B27ACF1)
  %465 = tail call double @llvm.fma.f64(double %460, double %464, double 0x3FD99999998EF7B6)
  %466 = tail call double @llvm.fma.f64(double %460, double %465, double 0x3FE5555555555780)
  %467 = tail call double @llvm.amdgcn.ldexp.f64(double %457, i32 1)
  %468 = tail call double @llvm.amdgcn.ldexp.f64(double %459, i32 1)
  %469 = fmul double %457, %460
  %470 = fmul double %469, %466
  %471 = fadd double %467, %470
  %472 = fsub double %471, %467
  %473 = fsub double %470, %472
  %474 = fadd double %468, %473
  %475 = fadd double %471, %474
  %476 = fsub double %475, %471
  %477 = fsub double %474, %476
  %478 = sitofp i32 %432 to double
  %479 = fmul double %478, 0x3FE62E42FEFA39EF
  %480 = fneg double %479
  %481 = tail call double @llvm.fma.f64(double %478, double 0x3FE62E42FEFA39EF, double %480)
  %482 = tail call double @llvm.fma.f64(double %478, double 0x3C7ABC9E3B39803F, double %481)
  %483 = fadd double %479, %482
  %484 = fsub double %483, %479
  %485 = fsub double %482, %484
  %486 = fadd double %483, %475
  %487 = fsub double %486, %483
  %488 = fsub double %486, %487
  %489 = fsub double %483, %488
  %490 = fsub double %475, %487
  %491 = fadd double %490, %489
  %492 = fadd double %485, %477
  %493 = fsub double %492, %485
  %494 = fsub double %492, %493
  %495 = fsub double %485, %494
  %496 = fsub double %477, %493
  %497 = fadd double %496, %495
  %498 = fadd double %492, %491
  %499 = fadd double %486, %498
  %500 = fsub double %499, %486
  %501 = fsub double %498, %500
  %502 = fadd double %497, %501
  %503 = fadd double %499, %502
  %504 = fcmp oeq double %36, 0x7FF0000000000000
  %505 = select i1 %504, double %36, double %503
  %506 = fcmp oeq double %35, 0.000000e+00
  %507 = fadd double %505, -1.000000e+00
  %508 = select i1 %506, double 0xFFF0000000000000, double %507
  %509 = tail call double @llvm.fma.f64(double %426, double %508, double %425)
  br label %594

510:                                              ; preds = %415
  %511 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %512 = fcmp olt double %511, 0x3FE5555555555555
  %513 = zext i1 %512 to i32
  %514 = tail call double @llvm.amdgcn.ldexp.f64(double %511, i32 %513)
  %515 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %516 = sub nsw i32 %515, %513
  %517 = fadd double %514, -1.000000e+00
  %518 = fadd double %514, 1.000000e+00
  %519 = fadd double %518, -1.000000e+00
  %520 = fsub double %514, %519
  %521 = tail call double @llvm.amdgcn.rcp.f64(double %518)
  %522 = fneg double %518
  %523 = tail call double @llvm.fma.f64(double %522, double %521, double 1.000000e+00)
  %524 = tail call double @llvm.fma.f64(double %523, double %521, double %521)
  %525 = tail call double @llvm.fma.f64(double %522, double %524, double 1.000000e+00)
  %526 = tail call double @llvm.fma.f64(double %525, double %524, double %524)
  %527 = fmul double %517, %526
  %528 = fmul double %518, %527
  %529 = fneg double %528
  %530 = tail call double @llvm.fma.f64(double %527, double %518, double %529)
  %531 = tail call double @llvm.fma.f64(double %527, double %520, double %530)
  %532 = fadd double %528, %531
  %533 = fsub double %532, %528
  %534 = fsub double %531, %533
  %535 = fsub double %517, %532
  %536 = fsub double %517, %535
  %537 = fsub double %536, %532
  %538 = fsub double %537, %534
  %539 = fadd double %535, %538
  %540 = fmul double %526, %539
  %541 = fadd double %527, %540
  %542 = fsub double %541, %527
  %543 = fsub double %540, %542
  %544 = fmul double %541, %541
  %545 = tail call double @llvm.fma.f64(double %544, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %546 = tail call double @llvm.fma.f64(double %544, double %545, double 0x3FC7474DD7F4DF2E)
  %547 = tail call double @llvm.fma.f64(double %544, double %546, double 0x3FCC71C016291751)
  %548 = tail call double @llvm.fma.f64(double %544, double %547, double 0x3FD249249B27ACF1)
  %549 = tail call double @llvm.fma.f64(double %544, double %548, double 0x3FD99999998EF7B6)
  %550 = tail call double @llvm.fma.f64(double %544, double %549, double 0x3FE5555555555780)
  %551 = tail call double @llvm.amdgcn.ldexp.f64(double %541, i32 1)
  %552 = tail call double @llvm.amdgcn.ldexp.f64(double %543, i32 1)
  %553 = fmul double %541, %544
  %554 = fmul double %553, %550
  %555 = fadd double %551, %554
  %556 = fsub double %555, %551
  %557 = fsub double %554, %556
  %558 = fadd double %552, %557
  %559 = fadd double %555, %558
  %560 = fsub double %559, %555
  %561 = fsub double %558, %560
  %562 = sitofp i32 %516 to double
  %563 = fmul double %562, 0x3FE62E42FEFA39EF
  %564 = fneg double %563
  %565 = tail call double @llvm.fma.f64(double %562, double 0x3FE62E42FEFA39EF, double %564)
  %566 = tail call double @llvm.fma.f64(double %562, double 0x3C7ABC9E3B39803F, double %565)
  %567 = fadd double %563, %566
  %568 = fsub double %567, %563
  %569 = fsub double %566, %568
  %570 = fadd double %567, %559
  %571 = fsub double %570, %567
  %572 = fsub double %570, %571
  %573 = fsub double %567, %572
  %574 = fsub double %559, %571
  %575 = fadd double %574, %573
  %576 = fadd double %569, %561
  %577 = fsub double %576, %569
  %578 = fsub double %576, %577
  %579 = fsub double %569, %578
  %580 = fsub double %561, %577
  %581 = fadd double %580, %579
  %582 = fadd double %576, %575
  %583 = fadd double %570, %582
  %584 = fsub double %583, %570
  %585 = fsub double %582, %584
  %586 = fadd double %581, %585
  %587 = fadd double %583, %586
  %588 = fcmp oeq double %36, 0x7FF0000000000000
  %589 = select i1 %588, double %36, double %587
  %590 = fcmp oeq double %35, 0.000000e+00
  %591 = select i1 %590, double 0xFFF0000000000000, double %589
  %592 = fneg double %36
  %593 = tail call double @llvm.fma.f64(double %36, double %591, double %592)
  br label %594

594:                                              ; preds = %510, %417, %292, %275, %253, %237, %233, %40
  %595 = phi double [ %127, %40 ], [ %414, %292 ], [ %509, %417 ], [ %593, %510 ], [ %236, %233 ], [ %289, %275 ], [ %274, %253 ], [ %252, %237 ]
  %596 = fcmp ult double %35, 0.000000e+00
  br i1 %596, label %602, label %597

597:                                              ; preds = %594
  %598 = fcmp oeq double %35, 1.000000e+00
  %599 = fcmp oeq double %35, 2.000000e+00
  %600 = or i1 %598, %599
  %601 = select i1 %600, double 0.000000e+00, double %595
  br label %738

602:                                              ; preds = %594
  %603 = add i32 %38, -1020264449
  %604 = icmp ult i32 %603, 106954751
  br i1 %604, label %605, label %738

605:                                              ; preds = %602
  %606 = fmul double %36, 5.000000e-01
  %607 = tail call double @llvm.amdgcn.fract.f64(double %606)
  %608 = tail call i1 @llvm.amdgcn.class.f64(double %606, i32 516)
  %609 = fmul double %607, 2.000000e+00
  %610 = select i1 %608, double 0.000000e+00, double %609
  %611 = fcmp ogt double %36, 1.000000e+00
  %612 = select i1 %611, double %610, double %36
  %613 = fmul double %612, 2.000000e+00
  %614 = tail call double @llvm.rint.f64(double %613)
  %615 = tail call double @llvm.fma.f64(double %614, double -5.000000e-01, double %612)
  %616 = fptosi double %614 to i32
  %617 = fmul double %615, %615
  %618 = tail call double @llvm.fma.f64(double %617, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %619 = tail call double @llvm.fma.f64(double %617, double %618, double 0x3FB50782D5F14825)
  %620 = tail call double @llvm.fma.f64(double %617, double %619, double 0xBFE32D2CCDFE9424)
  %621 = tail call double @llvm.fma.f64(double %617, double %620, double 0x400466BC67754FFF)
  %622 = tail call double @llvm.fma.f64(double %617, double %621, double 0xC014ABBCE625BE09)
  %623 = fmul double %615, %617
  %624 = fmul double %623, %622
  %625 = tail call double @llvm.fma.f64(double %615, double 0x400921FB54442D18, double %624)
  %626 = tail call double @llvm.fma.f64(double %617, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %627 = tail call double @llvm.fma.f64(double %617, double %626, double 0xBF9A6D1E7294BFF9)
  %628 = tail call double @llvm.fma.f64(double %617, double %627, double 0x3FCE1F5067B90B37)
  %629 = tail call double @llvm.fma.f64(double %617, double %628, double 0xBFF55D3C7E3C325B)
  %630 = tail call double @llvm.fma.f64(double %617, double %629, double 0x40103C1F081B5A67)
  %631 = tail call double @llvm.fma.f64(double %617, double %630, double 0xC013BD3CC9BE45DE)
  %632 = tail call double @llvm.fma.f64(double %617, double %631, double 1.000000e+00)
  %633 = and i32 %616, 1
  %634 = icmp eq i32 %633, 0
  %635 = select i1 %634, double %625, double %632
  %636 = bitcast double %635 to <2 x i32>
  %637 = shl i32 %616, 30
  %638 = bitcast double %35 to <2 x i32>
  %639 = extractelement <2 x i32> %638, i64 1
  %640 = xor i32 %637, %639
  %641 = and i32 %640, -2147483648
  %642 = extractelement <2 x i32> %636, i64 1
  %643 = xor i32 %642, %641
  %644 = insertelement <2 x i32> %636, i32 %643, i64 1
  %645 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 519)
  %646 = select i1 %645, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %644
  %647 = bitcast <2 x i32> %646 to double
  %648 = fmul double %35, %647
  %649 = tail call double @llvm.fabs.f64(double %648)
  %650 = fdiv double 0x400921FB54442D18, %649
  %651 = tail call double @llvm.amdgcn.frexp.mant.f64(double %650)
  %652 = fcmp olt double %651, 0x3FE5555555555555
  %653 = zext i1 %652 to i32
  %654 = tail call double @llvm.amdgcn.ldexp.f64(double %651, i32 %653)
  %655 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %650)
  %656 = sub nsw i32 %655, %653
  %657 = fadd double %654, -1.000000e+00
  %658 = fadd double %654, 1.000000e+00
  %659 = fadd double %658, -1.000000e+00
  %660 = fsub double %654, %659
  %661 = tail call double @llvm.amdgcn.rcp.f64(double %658)
  %662 = fneg double %658
  %663 = tail call double @llvm.fma.f64(double %662, double %661, double 1.000000e+00)
  %664 = tail call double @llvm.fma.f64(double %663, double %661, double %661)
  %665 = tail call double @llvm.fma.f64(double %662, double %664, double 1.000000e+00)
  %666 = tail call double @llvm.fma.f64(double %665, double %664, double %664)
  %667 = fmul double %657, %666
  %668 = fmul double %658, %667
  %669 = fneg double %668
  %670 = tail call double @llvm.fma.f64(double %667, double %658, double %669)
  %671 = tail call double @llvm.fma.f64(double %667, double %660, double %670)
  %672 = fadd double %668, %671
  %673 = fsub double %672, %668
  %674 = fsub double %671, %673
  %675 = fsub double %657, %672
  %676 = fsub double %657, %675
  %677 = fsub double %676, %672
  %678 = fsub double %677, %674
  %679 = fadd double %675, %678
  %680 = fmul double %666, %679
  %681 = fadd double %667, %680
  %682 = fsub double %681, %667
  %683 = fsub double %680, %682
  %684 = fmul double %681, %681
  %685 = tail call double @llvm.fma.f64(double %684, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %686 = tail call double @llvm.fma.f64(double %684, double %685, double 0x3FC7474DD7F4DF2E)
  %687 = tail call double @llvm.fma.f64(double %684, double %686, double 0x3FCC71C016291751)
  %688 = tail call double @llvm.fma.f64(double %684, double %687, double 0x3FD249249B27ACF1)
  %689 = tail call double @llvm.fma.f64(double %684, double %688, double 0x3FD99999998EF7B6)
  %690 = tail call double @llvm.fma.f64(double %684, double %689, double 0x3FE5555555555780)
  %691 = tail call double @llvm.amdgcn.ldexp.f64(double %681, i32 1)
  %692 = tail call double @llvm.amdgcn.ldexp.f64(double %683, i32 1)
  %693 = fmul double %681, %684
  %694 = fmul double %693, %690
  %695 = fadd double %691, %694
  %696 = fsub double %695, %691
  %697 = fsub double %694, %696
  %698 = fadd double %692, %697
  %699 = fadd double %695, %698
  %700 = fsub double %699, %695
  %701 = fsub double %698, %700
  %702 = sitofp i32 %656 to double
  %703 = fmul double %702, 0x3FE62E42FEFA39EF
  %704 = fneg double %703
  %705 = tail call double @llvm.fma.f64(double %702, double 0x3FE62E42FEFA39EF, double %704)
  %706 = tail call double @llvm.fma.f64(double %702, double 0x3C7ABC9E3B39803F, double %705)
  %707 = fadd double %703, %706
  %708 = fsub double %707, %703
  %709 = fsub double %706, %708
  %710 = fadd double %707, %699
  %711 = fsub double %710, %707
  %712 = fsub double %710, %711
  %713 = fsub double %707, %712
  %714 = fsub double %699, %711
  %715 = fadd double %714, %713
  %716 = fadd double %709, %701
  %717 = fsub double %716, %709
  %718 = fsub double %716, %717
  %719 = fsub double %709, %718
  %720 = fsub double %701, %717
  %721 = fadd double %720, %719
  %722 = fadd double %716, %715
  %723 = fadd double %710, %722
  %724 = fsub double %723, %710
  %725 = fsub double %722, %724
  %726 = fadd double %721, %725
  %727 = fadd double %723, %726
  %728 = fcmp oeq double %650, 0x7FF0000000000000
  %729 = select i1 %728, double %650, double %727
  %730 = fcmp oeq double %650, 0.000000e+00
  %731 = select i1 %730, double 0xFFF0000000000000, double %729
  %732 = fsub double %731, %595
  %733 = tail call double @llvm.amdgcn.fract.f64(double %35)
  %734 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 516)
  %735 = select i1 %734, double 0.000000e+00, double %733
  %736 = fcmp oeq double %735, 0.000000e+00
  %737 = select i1 %736, double 0x7FF0000000000000, double %732
  br label %738

738:                                              ; preds = %597, %602, %605
  %739 = phi double [ %601, %597 ], [ %737, %605 ], [ %595, %602 ]
  %740 = fcmp uno double %35, 0.000000e+00
  %741 = tail call i1 @llvm.amdgcn.class.f64(double %36, i32 608)
  %742 = fcmp olt double %35, 0.000000e+00
  %743 = icmp ugt i32 %38, 1127219199
  %744 = and i1 %742, %743
  %745 = or i1 %741, %744
  %746 = select i1 %745, double 0x7FF0000000000000, double %739
  %747 = select i1 %740, double %35, double %746
  %748 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %747, double addrspace(1)* %748, align 8, !tbaa !16
  br label %749

749:                                              ; preds = %738, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
