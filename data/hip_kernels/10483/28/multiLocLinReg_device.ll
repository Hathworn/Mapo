; ModuleID = '../data/hip_kernels/10483/28/main.cu'
source_filename = "../data/hip_kernels/10483/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { [16 x %1], [16 x %1], [16 x %1], [16 x %2], [16 x %2], [16 x [256 x %3]], i64, i64, [14 x i64], i64 }
%1 = type { i32, [15 x i64] }
%2 = type { i64, [15 x i64] }
%3 = type { i64, i64, i32 }
%4 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%5 = type { i32, i32, i32, i32, [524284 x i32] }
%6 = type { %7 addrspace(1)*, %8 addrspace(1)*, %9, i64, i64, i64 }
%7 = type { i64, i64, i32, i32 }
%8 = type { [64 x [8 x i64]] }
%9 = type { i64 }
%10 = type { i64, %9, i64, i32, i32, i64, i64, %11, [2 x i32] }
%11 = type { %12 addrspace(1)* }
%12 = type { %13, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %9, [14 x i32] }
%13 = type { i32, i32, i8 addrspace(1)*, %9, i32, i32, i64 }

@0 = internal addrspace(1) global %0 zeroinitializer, align 8
@1 = internal unnamed_addr addrspace(4) constant [16 x %4] [%4 { i32 130054, i32 129546, i32 110114, i32 16288, i32 6, i32 256, i32 0, i32 4195 }, %4 { i32 86927, i32 86758, i32 73744, i32 10904, i32 399, i32 512, i32 0, i32 2804 }, %4 { i32 65280, i32 64770, i32 55054, i32 8192, i32 0, i32 128, i32 0, i32 2107 }, %4 { i32 43576, i32 43406, i32 36895, i32 5504, i32 56, i32 256, i32 0, i32 1405 }, %4 { i32 32703, i32 32193, i32 27364, i32 4160, i32 63, i32 64, i32 0, i32 1054 }, %4 { i32 21816, i32 21646, i32 18399, i32 2816, i32 56, i32 128, i32 0, i32 703 }, %4 { i32 16367, i32 15856, i32 13477, i32 2176, i32 15, i32 32, i32 32768, i32 527 }, %4 { i32 10915, i32 10745, i32 9133, i32 1472, i32 35, i32 64, i32 0, i32 352 }, %4 { i32 8187, i32 7676, i32 6524, i32 1280, i32 11, i32 16, i32 134219776, i32 265 }, %4 { i32 5459, i32 5289, i32 4495, i32 896, i32 19, i32 32, i32 524288, i32 176 }, %4 { i32 4094, i32 3583, i32 3045, i32 1024, i32 6, i32 8, i32 1077952576, i32 133 }, %4 { i32 2730, i32 2560, i32 2176, i32 512, i32 10, i32 16, i32 67109888, i32 89 }, %4 { i32 2047, i32 1536, i32 1305, i32 1024, i32 3, i32 4, i32 -2004318072, i32 66 }, %4 { i32 1365, i32 1195, i32 1015, i32 512, i32 5, i32 8, i32 538976288, i32 44 }, %4 { i32 1023, i32 512, i32 435, i32 2048, i32 1, i32 2, i32 -1431655766, i32 34 }, %4 { i32 682, i32 512, i32 435, i32 2048, i32 2, i32 4, i32 1145324612, i32 35 }], align 4

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14multiLocLinRegiiiiiiiiPiPfS0_S0_S0_S0_S0_S_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture writeonly %11, float addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, i32 addrspace(1)* nocapture readonly %15) local_unnamed_addr #1 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %17, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %0
  br i1 %26, label %27, label %1454

27:                                               ; preds = %16
  %28 = sext i32 %6 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = icmp slt i32 %30, 3
  br i1 %31, label %32, label %250

32:                                               ; preds = %27
  %33 = mul nsw i32 %5, %4
  %34 = mul nsw i32 %2, %1
  %35 = sitofp i32 %2 to double
  %36 = sitofp i32 %1 to double
  %37 = tail call double @llvm.fabs.f64(double %35)
  %38 = tail call double @llvm.amdgcn.frexp.mant.f64(double %37)
  %39 = fcmp olt double %38, 0x3FE5555555555555
  %40 = zext i1 %39 to i32
  %41 = tail call double @llvm.amdgcn.ldexp.f64(double %38, i32 %40)
  %42 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %37)
  %43 = sub nsw i32 %42, %40
  %44 = fadd double %41, -1.000000e+00
  %45 = fadd double %41, 1.000000e+00
  %46 = fadd double %45, -1.000000e+00
  %47 = fsub double %41, %46
  %48 = tail call double @llvm.amdgcn.rcp.f64(double %45)
  %49 = fneg double %45
  %50 = tail call double @llvm.fma.f64(double %49, double %48, double 1.000000e+00)
  %51 = tail call double @llvm.fma.f64(double %50, double %48, double %48)
  %52 = tail call double @llvm.fma.f64(double %49, double %51, double 1.000000e+00)
  %53 = tail call double @llvm.fma.f64(double %52, double %51, double %51)
  %54 = fmul double %44, %53
  %55 = fmul double %45, %54
  %56 = fneg double %55
  %57 = tail call double @llvm.fma.f64(double %54, double %45, double %56)
  %58 = tail call double @llvm.fma.f64(double %54, double %47, double %57)
  %59 = fadd double %55, %58
  %60 = fsub double %59, %55
  %61 = fsub double %58, %60
  %62 = fsub double %44, %59
  %63 = fsub double %44, %62
  %64 = fsub double %63, %59
  %65 = fsub double %64, %61
  %66 = fadd double %62, %65
  %67 = fmul double %53, %66
  %68 = fadd double %54, %67
  %69 = fsub double %68, %54
  %70 = fsub double %67, %69
  %71 = fmul double %68, %68
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %68, double %68, double %72)
  %74 = fmul double %70, 2.000000e+00
  %75 = tail call double @llvm.fma.f64(double %68, double %74, double %73)
  %76 = fadd double %71, %75
  %77 = fsub double %76, %71
  %78 = fsub double %75, %77
  %79 = tail call double @llvm.fma.f64(double %76, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %80 = tail call double @llvm.fma.f64(double %76, double %79, double 0x3FBE25E43ABE935A)
  %81 = tail call double @llvm.fma.f64(double %76, double %80, double 0x3FC110EF47E6C9C2)
  %82 = tail call double @llvm.fma.f64(double %76, double %81, double 0x3FC3B13BCFA74449)
  %83 = tail call double @llvm.fma.f64(double %76, double %82, double 0x3FC745D171BF3C30)
  %84 = tail call double @llvm.fma.f64(double %76, double %83, double 0x3FCC71C71C7792CE)
  %85 = tail call double @llvm.fma.f64(double %76, double %84, double 0x3FD24924924920DA)
  %86 = tail call double @llvm.fma.f64(double %76, double %85, double 0x3FD999999999999C)
  %87 = sitofp i32 %43 to double
  %88 = fmul double %87, 0x3FE62E42FEFA39EF
  %89 = fneg double %88
  %90 = tail call double @llvm.fma.f64(double %87, double 0x3FE62E42FEFA39EF, double %89)
  %91 = tail call double @llvm.fma.f64(double %87, double 0x3C7ABC9E3B39803F, double %90)
  %92 = fadd double %88, %91
  %93 = fsub double %92, %88
  %94 = fsub double %91, %93
  %95 = tail call double @llvm.amdgcn.ldexp.f64(double %68, i32 1)
  %96 = tail call double @llvm.amdgcn.ldexp.f64(double %70, i32 1)
  %97 = fmul double %68, %76
  %98 = fneg double %97
  %99 = tail call double @llvm.fma.f64(double %76, double %68, double %98)
  %100 = tail call double @llvm.fma.f64(double %76, double %70, double %99)
  %101 = tail call double @llvm.fma.f64(double %78, double %68, double %100)
  %102 = fadd double %97, %101
  %103 = fsub double %102, %97
  %104 = fsub double %101, %103
  %105 = fmul double %76, %86
  %106 = fneg double %105
  %107 = tail call double @llvm.fma.f64(double %76, double %86, double %106)
  %108 = tail call double @llvm.fma.f64(double %78, double %86, double %107)
  %109 = fadd double %105, %108
  %110 = fsub double %109, %105
  %111 = fsub double %108, %110
  %112 = fadd double %109, 0x3FE5555555555555
  %113 = fadd double %112, 0xBFE5555555555555
  %114 = fsub double %109, %113
  %115 = fadd double %111, 0x3C8543B0D5DF274D
  %116 = fadd double %115, %114
  %117 = fadd double %112, %116
  %118 = fsub double %117, %112
  %119 = fsub double %116, %118
  %120 = fmul double %102, %117
  %121 = fneg double %120
  %122 = tail call double @llvm.fma.f64(double %102, double %117, double %121)
  %123 = tail call double @llvm.fma.f64(double %102, double %119, double %122)
  %124 = tail call double @llvm.fma.f64(double %104, double %117, double %123)
  %125 = fadd double %120, %124
  %126 = fsub double %125, %120
  %127 = fsub double %124, %126
  %128 = fadd double %95, %125
  %129 = fsub double %128, %95
  %130 = fsub double %125, %129
  %131 = fadd double %96, %127
  %132 = fadd double %131, %130
  %133 = fadd double %128, %132
  %134 = fsub double %133, %128
  %135 = fsub double %132, %134
  %136 = fadd double %92, %133
  %137 = fsub double %136, %92
  %138 = fsub double %136, %137
  %139 = fsub double %92, %138
  %140 = fsub double %133, %137
  %141 = fadd double %140, %139
  %142 = fadd double %94, %135
  %143 = fsub double %142, %94
  %144 = fsub double %142, %143
  %145 = fsub double %94, %144
  %146 = fsub double %135, %143
  %147 = fadd double %146, %145
  %148 = fadd double %142, %141
  %149 = fadd double %136, %148
  %150 = fsub double %149, %136
  %151 = fsub double %148, %150
  %152 = fadd double %147, %151
  %153 = fadd double %149, %152
  %154 = fsub double %153, %149
  %155 = fsub double %152, %154
  %156 = fmul double %153, %36
  %157 = fneg double %156
  %158 = tail call double @llvm.fma.f64(double %36, double %153, double %157)
  %159 = tail call double @llvm.fma.f64(double %36, double %155, double %158)
  %160 = fadd double %156, %159
  %161 = fsub double %160, %156
  %162 = fsub double %159, %161
  %163 = tail call double @llvm.fabs.f64(double %156) #12
  %164 = fcmp oeq double %163, 0x7FF0000000000000
  %165 = select i1 %164, double %156, double %160
  %166 = tail call double @llvm.fabs.f64(double %165) #12
  %167 = fcmp oeq double %166, 0x7FF0000000000000
  %168 = select i1 %167, double 0.000000e+00, double %162
  %169 = fmul double %165, 0x3FF71547652B82FE
  %170 = tail call double @llvm.rint.f64(double %169)
  %171 = fneg double %170
  %172 = tail call double @llvm.fma.f64(double %171, double 0x3FE62E42FEFA39EF, double %165)
  %173 = tail call double @llvm.fma.f64(double %171, double 0x3C7ABC9E3B39803F, double %172)
  %174 = tail call double @llvm.fma.f64(double %173, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %175 = tail call double @llvm.fma.f64(double %173, double %174, double 0x3EC71DEE623FDE64)
  %176 = tail call double @llvm.fma.f64(double %173, double %175, double 0x3EFA01997C89E6B0)
  %177 = tail call double @llvm.fma.f64(double %173, double %176, double 0x3F2A01A014761F6E)
  %178 = tail call double @llvm.fma.f64(double %173, double %177, double 0x3F56C16C1852B7B0)
  %179 = tail call double @llvm.fma.f64(double %173, double %178, double 0x3F81111111122322)
  %180 = tail call double @llvm.fma.f64(double %173, double %179, double 0x3FA55555555502A1)
  %181 = tail call double @llvm.fma.f64(double %173, double %180, double 0x3FC5555555555511)
  %182 = tail call double @llvm.fma.f64(double %173, double %181, double 0x3FE000000000000B)
  %183 = tail call double @llvm.fma.f64(double %173, double %182, double 1.000000e+00)
  %184 = tail call double @llvm.fma.f64(double %173, double %183, double 1.000000e+00)
  %185 = fptosi double %170 to i32
  %186 = tail call double @llvm.amdgcn.ldexp.f64(double %184, i32 %185)
  %187 = fcmp ogt double %165, 1.024000e+03
  %188 = select i1 %187, double 0x7FF0000000000000, double %186
  %189 = fcmp olt double %165, -1.075000e+03
  %190 = select i1 %189, double 0.000000e+00, double %188
  %191 = tail call double @llvm.fma.f64(double %190, double %168, double %190)
  %192 = tail call double @llvm.fabs.f64(double %190) #12
  %193 = fcmp oeq double %192, 0x7FF0000000000000
  %194 = select i1 %193, double %190, double %191
  %195 = tail call double @llvm.fabs.f64(double %36)
  %196 = tail call double @llvm.trunc.f64(double %195)
  %197 = fcmp oeq double %195, %196
  %198 = zext i1 %197 to i32
  %199 = fmul double %196, 5.000000e-01
  %200 = tail call double @llvm.amdgcn.fract.f64(double %199)
  %201 = tail call i1 @llvm.amdgcn.class.f64(double %199, i32 516)
  %202 = select i1 %201, double 0.000000e+00, double %200
  %203 = fcmp oeq double %202, 0.000000e+00
  %204 = and i1 %197, %203
  %205 = zext i1 %204 to i32
  %206 = add nuw nsw i32 %205, %198
  %207 = icmp eq i32 %206, 1
  %208 = icmp slt i32 %2, 0
  %209 = and i1 %208, %207
  %210 = select i1 %209, double -0.000000e+00, double 0.000000e+00
  %211 = tail call double @llvm.copysign.f64(double %194, double %210)
  %212 = icmp sgt i32 %2, -1
  %213 = icmp ne i32 %206, 0
  %214 = select i1 %212, i1 true, i1 %213
  %215 = select i1 %214, double %211, double 0x7FF8000000000000
  %216 = fcmp oeq double %195, 0x7FF0000000000000
  %217 = fcmp oeq double %37, 1.000000e+00
  %218 = fadd double %37, -1.000000e+00
  %219 = bitcast double %36 to <2 x i32>
  %220 = extractelement <2 x i32> %219, i64 1
  %221 = bitcast double %218 to <2 x i32>
  %222 = extractelement <2 x i32> %221, i64 1
  %223 = xor i32 %222, %220
  %224 = icmp sgt i32 %223, -1
  %225 = select i1 %224, double 0x7FF0000000000000, double 0.000000e+00
  %226 = select i1 %217, double %37, double %225
  %227 = select i1 %216, double %226, double %215
  %228 = fcmp oeq double %37, 0x7FF0000000000000
  %229 = icmp eq i32 %2, 0
  %230 = or i1 %229, %228
  %231 = icmp slt i32 %1, 0
  %232 = xor i1 %231, %229
  %233 = select i1 %232, double 0.000000e+00, double 0x7FF0000000000000
  %234 = select i1 %207, double %35, double 0.000000e+00
  %235 = tail call double @llvm.copysign.f64(double %233, double %234)
  %236 = select i1 %230, double %235, double %227
  %237 = icmp eq i32 %2, 1
  %238 = icmp eq i32 %1, 0
  %239 = or i1 %238, %237
  %240 = fptosi double %236 to i32
  %241 = shl nsw i32 %240, 1
  %242 = select i1 %239, i32 2, i32 %241
  %243 = add nsw i32 %242, %34
  %244 = add i32 %33, %6
  %245 = mul i32 %243, %244
  %246 = add nsw i32 %245, %34
  %247 = add nsw i32 %246, %25
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %11, i64 %248
  store float 0.000000e+00, float addrspace(1)* %249, align 4, !tbaa !11
  br label %1454

250:                                              ; preds = %27
  %251 = sext i32 %1 to i64
  %252 = shl nsw i64 %251, 2
  %253 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %252) #13
  %254 = ptrtoint i8 addrspace(1)* %253 to i64
  %255 = bitcast i8 addrspace(1)* %253 to i32 addrspace(1)*
  %256 = icmp sgt i32 %1, 0
  br i1 %256, label %257, label %388

257:                                              ; preds = %250
  %258 = sitofp i32 %2 to double
  %259 = tail call double @llvm.fabs.f64(double %258)
  %260 = tail call double @llvm.amdgcn.frexp.mant.f64(double %259)
  %261 = fcmp olt double %260, 0x3FE5555555555555
  %262 = zext i1 %261 to i32
  %263 = tail call double @llvm.amdgcn.ldexp.f64(double %260, i32 %262)
  %264 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %259)
  %265 = sub nsw i32 %264, %262
  %266 = fadd double %263, -1.000000e+00
  %267 = fadd double %263, 1.000000e+00
  %268 = fadd double %267, -1.000000e+00
  %269 = fsub double %263, %268
  %270 = tail call double @llvm.amdgcn.rcp.f64(double %267)
  %271 = fneg double %267
  %272 = tail call double @llvm.fma.f64(double %271, double %270, double 1.000000e+00)
  %273 = tail call double @llvm.fma.f64(double %272, double %270, double %270)
  %274 = tail call double @llvm.fma.f64(double %271, double %273, double 1.000000e+00)
  %275 = tail call double @llvm.fma.f64(double %274, double %273, double %273)
  %276 = fmul double %266, %275
  %277 = fmul double %267, %276
  %278 = fneg double %277
  %279 = tail call double @llvm.fma.f64(double %276, double %267, double %278)
  %280 = tail call double @llvm.fma.f64(double %276, double %269, double %279)
  %281 = fadd double %277, %280
  %282 = fsub double %281, %277
  %283 = fsub double %280, %282
  %284 = fsub double %266, %281
  %285 = fsub double %266, %284
  %286 = fsub double %285, %281
  %287 = fsub double %286, %283
  %288 = fadd double %284, %287
  %289 = fmul double %275, %288
  %290 = fadd double %276, %289
  %291 = fsub double %290, %276
  %292 = fsub double %289, %291
  %293 = fmul double %290, %290
  %294 = fneg double %293
  %295 = tail call double @llvm.fma.f64(double %290, double %290, double %294)
  %296 = fmul double %292, 2.000000e+00
  %297 = tail call double @llvm.fma.f64(double %290, double %296, double %295)
  %298 = fadd double %293, %297
  %299 = fsub double %298, %293
  %300 = fsub double %297, %299
  %301 = tail call double @llvm.fma.f64(double %298, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %302 = tail call double @llvm.fma.f64(double %298, double %301, double 0x3FBE25E43ABE935A)
  %303 = tail call double @llvm.fma.f64(double %298, double %302, double 0x3FC110EF47E6C9C2)
  %304 = tail call double @llvm.fma.f64(double %298, double %303, double 0x3FC3B13BCFA74449)
  %305 = tail call double @llvm.fma.f64(double %298, double %304, double 0x3FC745D171BF3C30)
  %306 = tail call double @llvm.fma.f64(double %298, double %305, double 0x3FCC71C71C7792CE)
  %307 = tail call double @llvm.fma.f64(double %298, double %306, double 0x3FD24924924920DA)
  %308 = tail call double @llvm.fma.f64(double %298, double %307, double 0x3FD999999999999C)
  %309 = sitofp i32 %265 to double
  %310 = fmul double %309, 0x3FE62E42FEFA39EF
  %311 = fneg double %310
  %312 = tail call double @llvm.fma.f64(double %309, double 0x3FE62E42FEFA39EF, double %311)
  %313 = tail call double @llvm.fma.f64(double %309, double 0x3C7ABC9E3B39803F, double %312)
  %314 = fadd double %310, %313
  %315 = fsub double %314, %310
  %316 = fsub double %313, %315
  %317 = tail call double @llvm.amdgcn.ldexp.f64(double %290, i32 1)
  %318 = tail call double @llvm.amdgcn.ldexp.f64(double %292, i32 1)
  %319 = fmul double %290, %298
  %320 = fneg double %319
  %321 = tail call double @llvm.fma.f64(double %298, double %290, double %320)
  %322 = tail call double @llvm.fma.f64(double %298, double %292, double %321)
  %323 = tail call double @llvm.fma.f64(double %300, double %290, double %322)
  %324 = fadd double %319, %323
  %325 = fsub double %324, %319
  %326 = fsub double %323, %325
  %327 = fmul double %298, %308
  %328 = fneg double %327
  %329 = tail call double @llvm.fma.f64(double %298, double %308, double %328)
  %330 = tail call double @llvm.fma.f64(double %300, double %308, double %329)
  %331 = fadd double %327, %330
  %332 = fsub double %331, %327
  %333 = fsub double %330, %332
  %334 = fadd double %331, 0x3FE5555555555555
  %335 = fadd double %334, 0xBFE5555555555555
  %336 = fsub double %331, %335
  %337 = fadd double %333, 0x3C8543B0D5DF274D
  %338 = fadd double %337, %336
  %339 = fadd double %334, %338
  %340 = fsub double %339, %334
  %341 = fsub double %338, %340
  %342 = fmul double %324, %339
  %343 = fneg double %342
  %344 = tail call double @llvm.fma.f64(double %324, double %339, double %343)
  %345 = tail call double @llvm.fma.f64(double %324, double %341, double %344)
  %346 = tail call double @llvm.fma.f64(double %326, double %339, double %345)
  %347 = fadd double %342, %346
  %348 = fsub double %347, %342
  %349 = fsub double %346, %348
  %350 = fadd double %317, %347
  %351 = fsub double %350, %317
  %352 = fsub double %347, %351
  %353 = fadd double %318, %349
  %354 = fadd double %353, %352
  %355 = fadd double %350, %354
  %356 = fsub double %355, %350
  %357 = fsub double %354, %356
  %358 = fadd double %314, %355
  %359 = fsub double %358, %314
  %360 = fsub double %358, %359
  %361 = fsub double %314, %360
  %362 = fsub double %355, %359
  %363 = fadd double %362, %361
  %364 = fadd double %316, %357
  %365 = fsub double %364, %316
  %366 = fsub double %364, %365
  %367 = fsub double %316, %366
  %368 = fsub double %357, %365
  %369 = fadd double %368, %367
  %370 = fadd double %364, %363
  %371 = fadd double %358, %370
  %372 = fsub double %371, %358
  %373 = fsub double %370, %372
  %374 = fadd double %369, %373
  %375 = fadd double %371, %374
  %376 = fsub double %375, %371
  %377 = fsub double %374, %376
  %378 = icmp slt i32 %2, 0
  %379 = icmp sgt i32 %2, -1
  %380 = fcmp oeq double %259, 1.000000e+00
  %381 = fadd double %259, -1.000000e+00
  %382 = bitcast double %381 to <2 x i32>
  %383 = extractelement <2 x i32> %382, i64 1
  %384 = fcmp oeq double %259, 0x7FF0000000000000
  %385 = icmp eq i32 %2, 0
  %386 = or i1 %385, %384
  %387 = icmp eq i32 %2, 1
  br label %399

388:                                              ; preds = %399, %250
  %389 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %252) #13
  %390 = ptrtoint i8 addrspace(1)* %389 to i64
  %391 = bitcast i8 addrspace(1)* %389 to float addrspace(1)*
  br i1 %256, label %392, label %509

392:                                              ; preds = %388
  %393 = add nsw i32 %2, -1
  %394 = sitofp i32 %393 to float
  %395 = and i32 %1, 1
  %396 = icmp eq i32 %1, 1
  br i1 %396, label %493, label %397

397:                                              ; preds = %392
  %398 = and i32 %1, -2
  br label %712

399:                                              ; preds = %257, %399
  %400 = phi i32 [ %25, %257 ], [ %488, %399 ]
  %401 = phi i32 [ 0, %257 ], [ %489, %399 ]
  %402 = sitofp i32 %400 to double
  %403 = sub nsw i32 %1, %401
  %404 = add nsw i32 %403, -1
  %405 = sitofp i32 %404 to double
  %406 = fmul double %375, %405
  %407 = fneg double %406
  %408 = tail call double @llvm.fma.f64(double %405, double %375, double %407)
  %409 = tail call double @llvm.fma.f64(double %405, double %377, double %408)
  %410 = fadd double %406, %409
  %411 = fsub double %410, %406
  %412 = fsub double %409, %411
  %413 = tail call double @llvm.fabs.f64(double %406) #12
  %414 = fcmp oeq double %413, 0x7FF0000000000000
  %415 = select i1 %414, double %406, double %410
  %416 = tail call double @llvm.fabs.f64(double %415) #12
  %417 = fcmp oeq double %416, 0x7FF0000000000000
  %418 = select i1 %417, double 0.000000e+00, double %412
  %419 = fmul double %415, 0x3FF71547652B82FE
  %420 = tail call double @llvm.rint.f64(double %419)
  %421 = fneg double %420
  %422 = tail call double @llvm.fma.f64(double %421, double 0x3FE62E42FEFA39EF, double %415)
  %423 = tail call double @llvm.fma.f64(double %421, double 0x3C7ABC9E3B39803F, double %422)
  %424 = tail call double @llvm.fma.f64(double %423, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %425 = tail call double @llvm.fma.f64(double %423, double %424, double 0x3EC71DEE623FDE64)
  %426 = tail call double @llvm.fma.f64(double %423, double %425, double 0x3EFA01997C89E6B0)
  %427 = tail call double @llvm.fma.f64(double %423, double %426, double 0x3F2A01A014761F6E)
  %428 = tail call double @llvm.fma.f64(double %423, double %427, double 0x3F56C16C1852B7B0)
  %429 = tail call double @llvm.fma.f64(double %423, double %428, double 0x3F81111111122322)
  %430 = tail call double @llvm.fma.f64(double %423, double %429, double 0x3FA55555555502A1)
  %431 = tail call double @llvm.fma.f64(double %423, double %430, double 0x3FC5555555555511)
  %432 = tail call double @llvm.fma.f64(double %423, double %431, double 0x3FE000000000000B)
  %433 = tail call double @llvm.fma.f64(double %423, double %432, double 1.000000e+00)
  %434 = tail call double @llvm.fma.f64(double %423, double %433, double 1.000000e+00)
  %435 = fptosi double %420 to i32
  %436 = tail call double @llvm.amdgcn.ldexp.f64(double %434, i32 %435)
  %437 = fcmp ogt double %415, 1.024000e+03
  %438 = select i1 %437, double 0x7FF0000000000000, double %436
  %439 = fcmp olt double %415, -1.075000e+03
  %440 = select i1 %439, double 0.000000e+00, double %438
  %441 = tail call double @llvm.fma.f64(double %440, double %418, double %440)
  %442 = tail call double @llvm.fabs.f64(double %440) #12
  %443 = fcmp oeq double %442, 0x7FF0000000000000
  %444 = select i1 %443, double %440, double %441
  %445 = tail call double @llvm.fabs.f64(double %405)
  %446 = tail call double @llvm.trunc.f64(double %445)
  %447 = fcmp oeq double %445, %446
  %448 = zext i1 %447 to i32
  %449 = fmul double %446, 5.000000e-01
  %450 = tail call double @llvm.amdgcn.fract.f64(double %449)
  %451 = tail call i1 @llvm.amdgcn.class.f64(double %449, i32 516)
  %452 = select i1 %451, double 0.000000e+00, double %450
  %453 = fcmp oeq double %452, 0.000000e+00
  %454 = and i1 %447, %453
  %455 = zext i1 %454 to i32
  %456 = add nuw nsw i32 %455, %448
  %457 = icmp eq i32 %456, 1
  %458 = and i1 %378, %457
  %459 = select i1 %458, double -0.000000e+00, double 0.000000e+00
  %460 = tail call double @llvm.copysign.f64(double %444, double %459)
  %461 = icmp ne i32 %456, 0
  %462 = select i1 %379, i1 true, i1 %461
  %463 = select i1 %462, double %460, double 0x7FF8000000000000
  %464 = fcmp oeq double %445, 0x7FF0000000000000
  %465 = bitcast double %405 to <2 x i32>
  %466 = extractelement <2 x i32> %465, i64 1
  %467 = xor i32 %466, %383
  %468 = icmp sgt i32 %467, -1
  %469 = select i1 %468, double 0x7FF0000000000000, double 0.000000e+00
  %470 = select i1 %380, double %259, double %469
  %471 = select i1 %464, double %470, double %463
  %472 = icmp slt i32 %403, 1
  %473 = xor i1 %385, %472
  %474 = select i1 %473, double 0.000000e+00, double 0x7FF0000000000000
  %475 = select i1 %457, double %258, double 0.000000e+00
  %476 = tail call double @llvm.copysign.f64(double %474, double %475)
  %477 = select i1 %386, double %476, double %471
  %478 = icmp eq i32 %404, 0
  %479 = or i1 %387, %478
  %480 = select i1 %479, double 1.000000e+00, double %477
  %481 = fdiv contract double %402, %480
  %482 = fptosi double %481 to i32
  %483 = zext i32 %401 to i64
  %484 = getelementptr inbounds i32, i32 addrspace(1)* %255, i64 %483
  store i32 %482, i32 addrspace(1)* %484, align 4, !tbaa !7
  %485 = sitofp i32 %482 to double
  %486 = fmul contract double %480, %485
  %487 = fsub contract double %402, %486
  %488 = fptosi double %487 to i32
  %489 = add nuw nsw i32 %401, 1
  %490 = icmp eq i32 %489, %1
  br i1 %490, label %388, label %399, !llvm.loop !13

491:                                              ; preds = %712
  %492 = zext i32 %742 to i64
  br label %493

493:                                              ; preds = %491, %392
  %494 = phi i64 [ 0, %392 ], [ %492, %491 ]
  %495 = icmp eq i32 %395, 0
  br i1 %495, label %509, label %496

496:                                              ; preds = %493
  %497 = getelementptr inbounds i32, i32 addrspace(1)* %255, i64 %494
  %498 = load i32, i32 addrspace(1)* %497, align 4, !tbaa !7
  %499 = sitofp i32 %498 to float
  %500 = getelementptr inbounds float, float addrspace(1)* %13, i64 %494
  %501 = load float, float addrspace(1)* %500, align 4, !tbaa !11
  %502 = getelementptr inbounds float, float addrspace(1)* %12, i64 %494
  %503 = load float, float addrspace(1)* %502, align 4, !tbaa !11
  %504 = fsub contract float %501, %503
  %505 = fmul contract float %504, %499
  %506 = fdiv contract float %505, %394
  %507 = fadd contract float %503, %506
  %508 = getelementptr inbounds float, float addrspace(1)* %391, i64 %494
  store float %507, float addrspace(1)* %508, align 4, !tbaa !11
  br label %509

509:                                              ; preds = %496, %493, %388
  %510 = add i32 %1, 1
  %511 = sitofp i32 %510 to double
  %512 = tail call double @llvm.fabs.f64(double %511)
  %513 = tail call double @llvm.amdgcn.frexp.mant.f64(double %512)
  %514 = fcmp olt double %513, 0x3FE5555555555555
  %515 = zext i1 %514 to i32
  %516 = tail call double @llvm.amdgcn.ldexp.f64(double %513, i32 %515)
  %517 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %512)
  %518 = sub nsw i32 %517, %515
  %519 = fadd double %516, -1.000000e+00
  %520 = fadd double %516, 1.000000e+00
  %521 = fadd double %520, -1.000000e+00
  %522 = fsub double %516, %521
  %523 = tail call double @llvm.amdgcn.rcp.f64(double %520)
  %524 = fneg double %520
  %525 = tail call double @llvm.fma.f64(double %524, double %523, double 1.000000e+00)
  %526 = tail call double @llvm.fma.f64(double %525, double %523, double %523)
  %527 = tail call double @llvm.fma.f64(double %524, double %526, double 1.000000e+00)
  %528 = tail call double @llvm.fma.f64(double %527, double %526, double %526)
  %529 = fmul double %519, %528
  %530 = fmul double %520, %529
  %531 = fneg double %530
  %532 = tail call double @llvm.fma.f64(double %529, double %520, double %531)
  %533 = tail call double @llvm.fma.f64(double %529, double %522, double %532)
  %534 = fadd double %530, %533
  %535 = fsub double %534, %530
  %536 = fsub double %533, %535
  %537 = fsub double %519, %534
  %538 = fsub double %519, %537
  %539 = fsub double %538, %534
  %540 = fsub double %539, %536
  %541 = fadd double %537, %540
  %542 = fmul double %528, %541
  %543 = fadd double %529, %542
  %544 = fsub double %543, %529
  %545 = fsub double %542, %544
  %546 = fmul double %543, %543
  %547 = fneg double %546
  %548 = tail call double @llvm.fma.f64(double %543, double %543, double %547)
  %549 = fmul double %545, 2.000000e+00
  %550 = tail call double @llvm.fma.f64(double %543, double %549, double %548)
  %551 = fadd double %546, %550
  %552 = fsub double %551, %546
  %553 = fsub double %550, %552
  %554 = tail call double @llvm.fma.f64(double %551, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %555 = tail call double @llvm.fma.f64(double %551, double %554, double 0x3FBE25E43ABE935A)
  %556 = tail call double @llvm.fma.f64(double %551, double %555, double 0x3FC110EF47E6C9C2)
  %557 = tail call double @llvm.fma.f64(double %551, double %556, double 0x3FC3B13BCFA74449)
  %558 = tail call double @llvm.fma.f64(double %551, double %557, double 0x3FC745D171BF3C30)
  %559 = tail call double @llvm.fma.f64(double %551, double %558, double 0x3FCC71C71C7792CE)
  %560 = tail call double @llvm.fma.f64(double %551, double %559, double 0x3FD24924924920DA)
  %561 = tail call double @llvm.fma.f64(double %551, double %560, double 0x3FD999999999999C)
  %562 = sitofp i32 %518 to double
  %563 = fmul double %562, 0x3FE62E42FEFA39EF
  %564 = fneg double %563
  %565 = tail call double @llvm.fma.f64(double %562, double 0x3FE62E42FEFA39EF, double %564)
  %566 = tail call double @llvm.fma.f64(double %562, double 0x3C7ABC9E3B39803F, double %565)
  %567 = fadd double %563, %566
  %568 = fsub double %567, %563
  %569 = fsub double %566, %568
  %570 = tail call double @llvm.amdgcn.ldexp.f64(double %543, i32 1)
  %571 = tail call double @llvm.amdgcn.ldexp.f64(double %545, i32 1)
  %572 = fmul double %543, %551
  %573 = fneg double %572
  %574 = tail call double @llvm.fma.f64(double %551, double %543, double %573)
  %575 = tail call double @llvm.fma.f64(double %551, double %545, double %574)
  %576 = tail call double @llvm.fma.f64(double %553, double %543, double %575)
  %577 = fadd double %572, %576
  %578 = fsub double %577, %572
  %579 = fsub double %576, %578
  %580 = fmul double %551, %561
  %581 = fneg double %580
  %582 = tail call double @llvm.fma.f64(double %551, double %561, double %581)
  %583 = tail call double @llvm.fma.f64(double %553, double %561, double %582)
  %584 = fadd double %580, %583
  %585 = fsub double %584, %580
  %586 = fsub double %583, %585
  %587 = fadd double %584, 0x3FE5555555555555
  %588 = fadd double %587, 0xBFE5555555555555
  %589 = fsub double %584, %588
  %590 = fadd double %586, 0x3C8543B0D5DF274D
  %591 = fadd double %590, %589
  %592 = fadd double %587, %591
  %593 = fsub double %592, %587
  %594 = fsub double %591, %593
  %595 = fmul double %577, %592
  %596 = fneg double %595
  %597 = tail call double @llvm.fma.f64(double %577, double %592, double %596)
  %598 = tail call double @llvm.fma.f64(double %577, double %594, double %597)
  %599 = tail call double @llvm.fma.f64(double %579, double %592, double %598)
  %600 = fadd double %595, %599
  %601 = fsub double %600, %595
  %602 = fsub double %599, %601
  %603 = fadd double %570, %600
  %604 = fsub double %603, %570
  %605 = fsub double %600, %604
  %606 = fadd double %571, %602
  %607 = fadd double %606, %605
  %608 = fadd double %603, %607
  %609 = fsub double %608, %603
  %610 = fsub double %607, %609
  %611 = fadd double %567, %608
  %612 = fsub double %611, %567
  %613 = fsub double %611, %612
  %614 = fsub double %567, %613
  %615 = fsub double %608, %612
  %616 = fadd double %615, %614
  %617 = fadd double %569, %610
  %618 = fsub double %617, %569
  %619 = fsub double %617, %618
  %620 = fsub double %569, %619
  %621 = fsub double %610, %618
  %622 = fadd double %621, %620
  %623 = fadd double %617, %616
  %624 = fadd double %611, %623
  %625 = fsub double %624, %611
  %626 = fsub double %623, %625
  %627 = fadd double %622, %626
  %628 = fadd double %624, %627
  %629 = fsub double %628, %624
  %630 = fsub double %627, %629
  %631 = fmul double %628, 2.000000e+00
  %632 = fneg double %631
  %633 = tail call double @llvm.fma.f64(double %628, double 2.000000e+00, double %632)
  %634 = tail call double @llvm.fma.f64(double %630, double 2.000000e+00, double %633)
  %635 = fadd double %631, %634
  %636 = fsub double %635, %631
  %637 = fsub double %634, %636
  %638 = tail call double @llvm.fabs.f64(double %631) #12
  %639 = fcmp oeq double %638, 0x7FF0000000000000
  %640 = select i1 %639, double %631, double %635
  %641 = tail call double @llvm.fabs.f64(double %640) #12
  %642 = fcmp oeq double %641, 0x7FF0000000000000
  %643 = select i1 %642, double 0.000000e+00, double %637
  %644 = fmul double %640, 0x3FF71547652B82FE
  %645 = tail call double @llvm.rint.f64(double %644)
  %646 = fneg double %645
  %647 = tail call double @llvm.fma.f64(double %646, double 0x3FE62E42FEFA39EF, double %640)
  %648 = tail call double @llvm.fma.f64(double %646, double 0x3C7ABC9E3B39803F, double %647)
  %649 = tail call double @llvm.fma.f64(double %648, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %650 = tail call double @llvm.fma.f64(double %648, double %649, double 0x3EC71DEE623FDE64)
  %651 = tail call double @llvm.fma.f64(double %648, double %650, double 0x3EFA01997C89E6B0)
  %652 = tail call double @llvm.fma.f64(double %648, double %651, double 0x3F2A01A014761F6E)
  %653 = tail call double @llvm.fma.f64(double %648, double %652, double 0x3F56C16C1852B7B0)
  %654 = tail call double @llvm.fma.f64(double %648, double %653, double 0x3F81111111122322)
  %655 = tail call double @llvm.fma.f64(double %648, double %654, double 0x3FA55555555502A1)
  %656 = tail call double @llvm.fma.f64(double %648, double %655, double 0x3FC5555555555511)
  %657 = tail call double @llvm.fma.f64(double %648, double %656, double 0x3FE000000000000B)
  %658 = tail call double @llvm.fma.f64(double %648, double %657, double 1.000000e+00)
  %659 = tail call double @llvm.fma.f64(double %648, double %658, double 1.000000e+00)
  %660 = fptosi double %645 to i32
  %661 = tail call double @llvm.amdgcn.ldexp.f64(double %659, i32 %660)
  %662 = fcmp ogt double %640, 1.024000e+03
  %663 = select i1 %662, double 0x7FF0000000000000, double %661
  %664 = fcmp olt double %640, -1.075000e+03
  %665 = select i1 %664, double 0.000000e+00, double %663
  %666 = tail call double @llvm.fma.f64(double %665, double %643, double %665)
  %667 = tail call double @llvm.fabs.f64(double %665) #12
  %668 = fcmp oeq double %667, 0x7FF0000000000000
  %669 = select i1 %668, double %665, double %666
  %670 = tail call double @llvm.fabs.f64(double %669)
  %671 = fcmp oeq double %512, 0x7FF0000000000000
  %672 = icmp eq i32 %510, 0
  %673 = icmp eq i32 %1, 0
  %674 = fmul contract double %670, 4.000000e+00
  %675 = select i1 %671, double 0x7FF0000000000000, double %674
  %676 = fptoui double %675 to i64
  %677 = select i1 %672, i64 0, i64 %676
  %678 = select i1 %673, i64 4, i64 %677
  %679 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %678) #13
  %680 = ptrtoint i8 addrspace(1)* %679 to i64
  %681 = bitcast i8 addrspace(1)* %679 to float addrspace(1)*
  %682 = sext i32 %510 to i64
  %683 = shl nsw i64 %682, 2
  %684 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %683) #13
  %685 = ptrtoint i8 addrspace(1)* %684 to i64
  %686 = bitcast i8 addrspace(1)* %684 to float addrspace(1)*
  %687 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %683) #13
  %688 = ptrtoint i8 addrspace(1)* %687 to i64
  %689 = bitcast i8 addrspace(1)* %687 to float addrspace(1)*
  %690 = add nsw i32 %7, -1
  %691 = mul nsw i32 %690, %0
  %692 = add nsw i32 %25, %691
  %693 = sext i32 %692 to i64
  %694 = getelementptr inbounds float, float addrspace(1)* %14, i64 %693
  %695 = load float, float addrspace(1)* %694, align 4, !tbaa !11
  %696 = icmp slt i32 %1, 0
  br i1 %696, label %745, label %697

697:                                              ; preds = %509
  %698 = icmp sgt i32 %7, 0
  %699 = tail call double @llvm.amdgcn.rsq.f64(double 0x401921FB54442D18)
  %700 = fmul double %699, 0x401921FB54442D18
  %701 = fmul double %699, 5.000000e-01
  %702 = fneg double %701
  %703 = tail call double @llvm.fma.f64(double %702, double %700, double 5.000000e-01)
  %704 = tail call double @llvm.fma.f64(double %701, double %703, double %701)
  %705 = tail call double @llvm.fma.f64(double %700, double %703, double %700)
  %706 = fneg double %705
  %707 = tail call double @llvm.fma.f64(double %706, double %705, double 0x401921FB54442D18)
  %708 = tail call double @llvm.fma.f64(double %707, double %704, double %705)
  %709 = fneg double %708
  %710 = tail call double @llvm.fma.f64(double %709, double %708, double 0x401921FB54442D18)
  %711 = tail call double @llvm.fma.f64(double %710, double %704, double %708)
  br label %1265

712:                                              ; preds = %712, %397
  %713 = phi i32 [ 0, %397 ], [ %742, %712 ]
  %714 = phi i32 [ 0, %397 ], [ %743, %712 ]
  %715 = zext i32 %713 to i64
  %716 = getelementptr inbounds i32, i32 addrspace(1)* %255, i64 %715
  %717 = load i32, i32 addrspace(1)* %716, align 4, !tbaa !7
  %718 = sitofp i32 %717 to float
  %719 = getelementptr inbounds float, float addrspace(1)* %13, i64 %715
  %720 = load float, float addrspace(1)* %719, align 4, !tbaa !11
  %721 = getelementptr inbounds float, float addrspace(1)* %12, i64 %715
  %722 = load float, float addrspace(1)* %721, align 4, !tbaa !11
  %723 = fsub contract float %720, %722
  %724 = fmul contract float %723, %718
  %725 = fdiv contract float %724, %394
  %726 = fadd contract float %722, %725
  %727 = getelementptr inbounds float, float addrspace(1)* %391, i64 %715
  store float %726, float addrspace(1)* %727, align 4, !tbaa !11
  %728 = or i32 %713, 1
  %729 = zext i32 %728 to i64
  %730 = getelementptr inbounds i32, i32 addrspace(1)* %255, i64 %729
  %731 = load i32, i32 addrspace(1)* %730, align 4, !tbaa !7
  %732 = sitofp i32 %731 to float
  %733 = getelementptr inbounds float, float addrspace(1)* %13, i64 %729
  %734 = load float, float addrspace(1)* %733, align 4, !tbaa !11
  %735 = getelementptr inbounds float, float addrspace(1)* %12, i64 %729
  %736 = load float, float addrspace(1)* %735, align 4, !tbaa !11
  %737 = fsub contract float %734, %736
  %738 = fmul contract float %737, %732
  %739 = fdiv contract float %738, %394
  %740 = fadd contract float %736, %739
  %741 = getelementptr inbounds float, float addrspace(1)* %391, i64 %729
  store float %740, float addrspace(1)* %741, align 4, !tbaa !11
  %742 = add nuw nsw i32 %713, 2
  %743 = add i32 %714, 2
  %744 = icmp eq i32 %743, %398
  br i1 %744, label %491, label %712, !llvm.loop !15

745:                                              ; preds = %1365, %509
  %746 = add nsw i32 %1, 2
  %747 = sext i32 %746 to i64
  %748 = shl nsw i64 %747, 2
  %749 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %748) #13
  %750 = ptrtoint i8 addrspace(1)* %749 to i64
  %751 = bitcast i8 addrspace(1)* %749 to float addrspace(1)*
  %752 = icmp sgt i32 %1, -1
  br i1 %752, label %753, label %821

753:                                              ; preds = %745
  %754 = and i32 %510, 7
  %755 = icmp ult i32 %1, 7
  br i1 %755, label %758, label %756

756:                                              ; preds = %753
  %757 = and i32 %510, -8
  br label %774

758:                                              ; preds = %774, %753
  %759 = phi i32 [ 0, %753 ], [ %816, %774 ]
  %760 = icmp eq i32 %754, 0
  br i1 %760, label %771, label %761

761:                                              ; preds = %758, %761
  %762 = phi i32 [ %768, %761 ], [ %759, %758 ]
  %763 = phi i32 [ %769, %761 ], [ 0, %758 ]
  %764 = zext i32 %762 to i64
  %765 = getelementptr inbounds float, float addrspace(1)* %686, i64 %764
  %766 = load float, float addrspace(1)* %765, align 4, !tbaa !11
  %767 = getelementptr inbounds float, float addrspace(1)* %689, i64 %764
  store float %766, float addrspace(1)* %767, align 4, !tbaa !11
  %768 = add nuw nsw i32 %762, 1
  %769 = add i32 %763, 1
  %770 = icmp eq i32 %769, %754
  br i1 %770, label %771, label %761, !llvm.loop !16

771:                                              ; preds = %761, %758
  %772 = zext i32 %510 to i64
  %773 = getelementptr inbounds float, float addrspace(1)* %751, i64 %772
  br label %822

774:                                              ; preds = %774, %756
  %775 = phi i32 [ 0, %756 ], [ %816, %774 ]
  %776 = phi i32 [ 0, %756 ], [ %817, %774 ]
  %777 = zext i32 %775 to i64
  %778 = getelementptr inbounds float, float addrspace(1)* %686, i64 %777
  %779 = load float, float addrspace(1)* %778, align 4, !tbaa !11
  %780 = getelementptr inbounds float, float addrspace(1)* %689, i64 %777
  store float %779, float addrspace(1)* %780, align 4, !tbaa !11
  %781 = or i32 %775, 1
  %782 = zext i32 %781 to i64
  %783 = getelementptr inbounds float, float addrspace(1)* %686, i64 %782
  %784 = load float, float addrspace(1)* %783, align 4, !tbaa !11
  %785 = getelementptr inbounds float, float addrspace(1)* %689, i64 %782
  store float %784, float addrspace(1)* %785, align 4, !tbaa !11
  %786 = or i32 %775, 2
  %787 = zext i32 %786 to i64
  %788 = getelementptr inbounds float, float addrspace(1)* %686, i64 %787
  %789 = load float, float addrspace(1)* %788, align 4, !tbaa !11
  %790 = getelementptr inbounds float, float addrspace(1)* %689, i64 %787
  store float %789, float addrspace(1)* %790, align 4, !tbaa !11
  %791 = or i32 %775, 3
  %792 = zext i32 %791 to i64
  %793 = getelementptr inbounds float, float addrspace(1)* %686, i64 %792
  %794 = load float, float addrspace(1)* %793, align 4, !tbaa !11
  %795 = getelementptr inbounds float, float addrspace(1)* %689, i64 %792
  store float %794, float addrspace(1)* %795, align 4, !tbaa !11
  %796 = or i32 %775, 4
  %797 = zext i32 %796 to i64
  %798 = getelementptr inbounds float, float addrspace(1)* %686, i64 %797
  %799 = load float, float addrspace(1)* %798, align 4, !tbaa !11
  %800 = getelementptr inbounds float, float addrspace(1)* %689, i64 %797
  store float %799, float addrspace(1)* %800, align 4, !tbaa !11
  %801 = or i32 %775, 5
  %802 = zext i32 %801 to i64
  %803 = getelementptr inbounds float, float addrspace(1)* %686, i64 %802
  %804 = load float, float addrspace(1)* %803, align 4, !tbaa !11
  %805 = getelementptr inbounds float, float addrspace(1)* %689, i64 %802
  store float %804, float addrspace(1)* %805, align 4, !tbaa !11
  %806 = or i32 %775, 6
  %807 = zext i32 %806 to i64
  %808 = getelementptr inbounds float, float addrspace(1)* %686, i64 %807
  %809 = load float, float addrspace(1)* %808, align 4, !tbaa !11
  %810 = getelementptr inbounds float, float addrspace(1)* %689, i64 %807
  store float %809, float addrspace(1)* %810, align 4, !tbaa !11
  %811 = or i32 %775, 7
  %812 = zext i32 %811 to i64
  %813 = getelementptr inbounds float, float addrspace(1)* %686, i64 %812
  %814 = load float, float addrspace(1)* %813, align 4, !tbaa !11
  %815 = getelementptr inbounds float, float addrspace(1)* %689, i64 %812
  store float %814, float addrspace(1)* %815, align 4, !tbaa !11
  %816 = add nuw nsw i32 %775, 8
  %817 = add i32 %776, 8
  %818 = icmp eq i32 %817, %757
  br i1 %818, label %758, label %774, !llvm.loop !18

819:                                              ; preds = %887, %874
  %820 = icmp eq i32 %823, %1
  br i1 %820, label %821, label %822, !llvm.loop !19

821:                                              ; preds = %819, %745
  tail call fastcc void @__ockl_dm_dealloc(i64 %750) #13
  br i1 %752, label %917, label %1048

822:                                              ; preds = %819, %771
  %823 = phi i32 [ 0, %771 ], [ %828, %819 ]
  %824 = mul nsw i32 %823, %510
  %825 = add nsw i32 %824, %823
  %826 = sext i32 %825 to i64
  %827 = getelementptr inbounds float, float addrspace(1)* %681, i64 %826
  %828 = add nuw nsw i32 %823, 1
  %829 = icmp slt i32 %823, %1
  br i1 %829, label %830, label %833

830:                                              ; preds = %822
  %831 = load float, float addrspace(1)* %827, align 4, !tbaa !11
  %832 = tail call float @llvm.fabs.f32(float %831)
  br label %836

833:                                              ; preds = %836, %822
  %834 = phi i32 [ %823, %822 ], [ %847, %836 ]
  %835 = icmp eq i32 %834, %823
  br i1 %835, label %874, label %858

836:                                              ; preds = %836, %830
  %837 = phi i32 [ %848, %836 ], [ %828, %830 ]
  %838 = phi i32 [ %847, %836 ], [ %823, %830 ]
  %839 = phi float [ %846, %836 ], [ %832, %830 ]
  %840 = add nsw i32 %837, %824
  %841 = sext i32 %840 to i64
  %842 = getelementptr inbounds float, float addrspace(1)* %681, i64 %841
  %843 = load float, float addrspace(1)* %842, align 4, !tbaa !11
  %844 = fcmp contract ogt float %843, %839
  %845 = tail call float @llvm.fabs.f32(float %843)
  %846 = select i1 %844, float %845, float %839
  %847 = select i1 %844, i32 %837, i32 %838
  %848 = add nuw nsw i32 %837, 1
  %849 = icmp slt i32 %837, %1
  br i1 %849, label %836, label %833, !llvm.loop !20

850:                                              ; preds = %858
  %851 = zext i32 %823 to i64
  %852 = getelementptr inbounds float, float addrspace(1)* %689, i64 %851
  %853 = load float, float addrspace(1)* %852, align 4, !tbaa !11
  store float %853, float addrspace(1)* %773, align 4, !tbaa !11
  %854 = sext i32 %834 to i64
  %855 = getelementptr inbounds float, float addrspace(1)* %689, i64 %854
  %856 = load float, float addrspace(1)* %855, align 4, !tbaa !11
  store float %856, float addrspace(1)* %852, align 4, !tbaa !11
  %857 = load float, float addrspace(1)* %773, align 4, !tbaa !11
  store float %857, float addrspace(1)* %855, align 4, !tbaa !11
  br label %874

858:                                              ; preds = %833, %858
  %859 = phi i32 [ %872, %858 ], [ %823, %833 ]
  %860 = mul nsw i32 %859, %510
  %861 = add nsw i32 %860, %823
  %862 = sext i32 %861 to i64
  %863 = getelementptr inbounds float, float addrspace(1)* %681, i64 %862
  %864 = load float, float addrspace(1)* %863, align 4, !tbaa !11
  %865 = zext i32 %859 to i64
  %866 = getelementptr inbounds float, float addrspace(1)* %751, i64 %865
  store float %864, float addrspace(1)* %866, align 4, !tbaa !11
  %867 = add nsw i32 %860, %834
  %868 = sext i32 %867 to i64
  %869 = getelementptr inbounds float, float addrspace(1)* %681, i64 %868
  %870 = load float, float addrspace(1)* %869, align 4, !tbaa !11
  store float %870, float addrspace(1)* %863, align 4, !tbaa !11
  %871 = load float, float addrspace(1)* %866, align 4, !tbaa !11
  store float %871, float addrspace(1)* %869, align 4, !tbaa !11
  %872 = add nuw nsw i32 %859, 1
  %873 = icmp slt i32 %859, %1
  br i1 %873, label %858, label %850, !llvm.loop !21

874:                                              ; preds = %850, %833
  br i1 %829, label %875, label %819

875:                                              ; preds = %874
  %876 = zext i32 %823 to i64
  %877 = getelementptr inbounds float, float addrspace(1)* %689, i64 %876
  br label %878

878:                                              ; preds = %887, %875
  %879 = phi i32 [ %828, %875 ], [ %894, %887 ]
  %880 = add nsw i32 %879, %824
  %881 = sext i32 %880 to i64
  %882 = getelementptr inbounds float, float addrspace(1)* %681, i64 %881
  %883 = load float, float addrspace(1)* %882, align 4, !tbaa !11
  %884 = fneg contract float %883
  %885 = load float, float addrspace(1)* %827, align 4, !tbaa !11
  %886 = fdiv contract float %884, %885
  store float 0.000000e+00, float addrspace(1)* %882, align 4, !tbaa !11
  br label %896

887:                                              ; preds = %912
  %888 = load float, float addrspace(1)* %877, align 4, !tbaa !11
  %889 = fmul contract float %886, %888
  %890 = zext i32 %879 to i64
  %891 = getelementptr inbounds float, float addrspace(1)* %689, i64 %890
  %892 = load float, float addrspace(1)* %891, align 4, !tbaa !11
  %893 = fadd contract float %892, %889
  store float %893, float addrspace(1)* %891, align 4, !tbaa !11
  %894 = add nuw nsw i32 %879, 1
  %895 = icmp slt i32 %879, %1
  br i1 %895, label %878, label %819, !llvm.loop !22

896:                                              ; preds = %912, %878
  %897 = phi i32 [ %913, %912 ], [ %828, %878 ]
  %898 = icmp eq i32 %897, %823
  br i1 %898, label %899, label %900

899:                                              ; preds = %896
  store float 0.000000e+00, float addrspace(1)* %882, align 4, !tbaa !11
  br label %912

900:                                              ; preds = %896
  %901 = mul nsw i32 %897, %510
  %902 = add nsw i32 %901, %823
  %903 = sext i32 %902 to i64
  %904 = getelementptr inbounds float, float addrspace(1)* %681, i64 %903
  %905 = load float, float addrspace(1)* %904, align 4, !tbaa !11
  %906 = fmul contract float %886, %905
  %907 = add nsw i32 %901, %879
  %908 = sext i32 %907 to i64
  %909 = getelementptr inbounds float, float addrspace(1)* %681, i64 %908
  %910 = load float, float addrspace(1)* %909, align 4, !tbaa !11
  %911 = fadd contract float %910, %906
  store float %911, float addrspace(1)* %909, align 4, !tbaa !11
  br label %912

912:                                              ; preds = %900, %899
  %913 = add nuw nsw i32 %897, 1
  %914 = icmp slt i32 %897, %1
  br i1 %914, label %896, label %887, !llvm.loop !23

915:                                              ; preds = %957, %954
  %916 = add i32 %918, 1
  br label %917, !llvm.loop !25

917:                                              ; preds = %821, %915
  %918 = phi i32 [ %916, %915 ], [ 0, %821 ]
  %919 = phi i32 [ %922, %915 ], [ %510, %821 ]
  %920 = xor i32 %918, -1
  %921 = add i32 %920, %1
  %922 = add nsw i32 %919, -1
  %923 = zext i32 %922 to i64
  %924 = getelementptr inbounds float, float addrspace(1)* %689, i64 %923
  %925 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %926 = mul nsw i32 %922, %510
  %927 = add nsw i32 %926, %922
  %928 = sext i32 %927 to i64
  %929 = getelementptr inbounds float, float addrspace(1)* %681, i64 %928
  %930 = load float, float addrspace(1)* %929, align 4, !tbaa !11
  %931 = fdiv contract float %925, %930
  store float %931, float addrspace(1)* %924, align 4, !tbaa !11
  %932 = icmp ugt i32 %919, 1
  br i1 %932, label %933, label %1048

933:                                              ; preds = %917
  %934 = sub i32 %1, %918
  %935 = add nsw i32 %919, -2
  %936 = and i32 %934, 7
  %937 = icmp eq i32 %936, 0
  br i1 %937, label %954, label %938

938:                                              ; preds = %933, %938
  %939 = phi i32 [ %951, %938 ], [ %935, %933 ]
  %940 = phi i32 [ %952, %938 ], [ 0, %933 ]
  %941 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %942 = add nsw i32 %939, %926
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds float, float addrspace(1)* %681, i64 %943
  %945 = load float, float addrspace(1)* %944, align 4, !tbaa !11
  %946 = fmul contract float %941, %945
  %947 = zext i32 %939 to i64
  %948 = getelementptr inbounds float, float addrspace(1)* %689, i64 %947
  %949 = load float, float addrspace(1)* %948, align 4, !tbaa !11
  %950 = fsub contract float %949, %946
  store float %950, float addrspace(1)* %948, align 4, !tbaa !11
  %951 = add nsw i32 %939, -1
  %952 = add i32 %940, 1
  %953 = icmp eq i32 %952, %936
  br i1 %953, label %954, label %938, !llvm.loop !26

954:                                              ; preds = %938, %933
  %955 = phi i32 [ %935, %933 ], [ %951, %938 ]
  %956 = icmp ult i32 %921, 7
  br i1 %956, label %915, label %957

957:                                              ; preds = %954, %957
  %958 = phi i32 [ %1046, %957 ], [ %955, %954 ]
  %959 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %960 = add nsw i32 %958, %926
  %961 = sext i32 %960 to i64
  %962 = getelementptr inbounds float, float addrspace(1)* %681, i64 %961
  %963 = load float, float addrspace(1)* %962, align 4, !tbaa !11
  %964 = fmul contract float %959, %963
  %965 = zext i32 %958 to i64
  %966 = getelementptr inbounds float, float addrspace(1)* %689, i64 %965
  %967 = load float, float addrspace(1)* %966, align 4, !tbaa !11
  %968 = fsub contract float %967, %964
  store float %968, float addrspace(1)* %966, align 4, !tbaa !11
  %969 = add nsw i32 %958, -1
  %970 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %971 = add nsw i32 %969, %926
  %972 = sext i32 %971 to i64
  %973 = getelementptr inbounds float, float addrspace(1)* %681, i64 %972
  %974 = load float, float addrspace(1)* %973, align 4, !tbaa !11
  %975 = fmul contract float %970, %974
  %976 = zext i32 %969 to i64
  %977 = getelementptr inbounds float, float addrspace(1)* %689, i64 %976
  %978 = load float, float addrspace(1)* %977, align 4, !tbaa !11
  %979 = fsub contract float %978, %975
  store float %979, float addrspace(1)* %977, align 4, !tbaa !11
  %980 = add nsw i32 %958, -2
  %981 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %982 = add nsw i32 %980, %926
  %983 = sext i32 %982 to i64
  %984 = getelementptr inbounds float, float addrspace(1)* %681, i64 %983
  %985 = load float, float addrspace(1)* %984, align 4, !tbaa !11
  %986 = fmul contract float %981, %985
  %987 = zext i32 %980 to i64
  %988 = getelementptr inbounds float, float addrspace(1)* %689, i64 %987
  %989 = load float, float addrspace(1)* %988, align 4, !tbaa !11
  %990 = fsub contract float %989, %986
  store float %990, float addrspace(1)* %988, align 4, !tbaa !11
  %991 = add nsw i32 %958, -3
  %992 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %993 = add nsw i32 %991, %926
  %994 = sext i32 %993 to i64
  %995 = getelementptr inbounds float, float addrspace(1)* %681, i64 %994
  %996 = load float, float addrspace(1)* %995, align 4, !tbaa !11
  %997 = fmul contract float %992, %996
  %998 = zext i32 %991 to i64
  %999 = getelementptr inbounds float, float addrspace(1)* %689, i64 %998
  %1000 = load float, float addrspace(1)* %999, align 4, !tbaa !11
  %1001 = fsub contract float %1000, %997
  store float %1001, float addrspace(1)* %999, align 4, !tbaa !11
  %1002 = add nsw i32 %958, -4
  %1003 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %1004 = add nsw i32 %1002, %926
  %1005 = sext i32 %1004 to i64
  %1006 = getelementptr inbounds float, float addrspace(1)* %681, i64 %1005
  %1007 = load float, float addrspace(1)* %1006, align 4, !tbaa !11
  %1008 = fmul contract float %1003, %1007
  %1009 = zext i32 %1002 to i64
  %1010 = getelementptr inbounds float, float addrspace(1)* %689, i64 %1009
  %1011 = load float, float addrspace(1)* %1010, align 4, !tbaa !11
  %1012 = fsub contract float %1011, %1008
  store float %1012, float addrspace(1)* %1010, align 4, !tbaa !11
  %1013 = add nsw i32 %958, -5
  %1014 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %1015 = add nsw i32 %1013, %926
  %1016 = sext i32 %1015 to i64
  %1017 = getelementptr inbounds float, float addrspace(1)* %681, i64 %1016
  %1018 = load float, float addrspace(1)* %1017, align 4, !tbaa !11
  %1019 = fmul contract float %1014, %1018
  %1020 = zext i32 %1013 to i64
  %1021 = getelementptr inbounds float, float addrspace(1)* %689, i64 %1020
  %1022 = load float, float addrspace(1)* %1021, align 4, !tbaa !11
  %1023 = fsub contract float %1022, %1019
  store float %1023, float addrspace(1)* %1021, align 4, !tbaa !11
  %1024 = add nsw i32 %958, -6
  %1025 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %1026 = add nsw i32 %1024, %926
  %1027 = sext i32 %1026 to i64
  %1028 = getelementptr inbounds float, float addrspace(1)* %681, i64 %1027
  %1029 = load float, float addrspace(1)* %1028, align 4, !tbaa !11
  %1030 = fmul contract float %1025, %1029
  %1031 = zext i32 %1024 to i64
  %1032 = getelementptr inbounds float, float addrspace(1)* %689, i64 %1031
  %1033 = load float, float addrspace(1)* %1032, align 4, !tbaa !11
  %1034 = fsub contract float %1033, %1030
  store float %1034, float addrspace(1)* %1032, align 4, !tbaa !11
  %1035 = add nsw i32 %958, -7
  %1036 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %1037 = add nsw i32 %1035, %926
  %1038 = sext i32 %1037 to i64
  %1039 = getelementptr inbounds float, float addrspace(1)* %681, i64 %1038
  %1040 = load float, float addrspace(1)* %1039, align 4, !tbaa !11
  %1041 = fmul contract float %1036, %1040
  %1042 = zext i32 %1035 to i64
  %1043 = getelementptr inbounds float, float addrspace(1)* %689, i64 %1042
  %1044 = load float, float addrspace(1)* %1043, align 4, !tbaa !11
  %1045 = fsub contract float %1044, %1041
  store float %1045, float addrspace(1)* %1043, align 4, !tbaa !11
  %1046 = add nsw i32 %958, -8
  %1047 = icmp eq i32 %1035, 0
  br i1 %1047, label %915, label %957, !llvm.loop !27

1048:                                             ; preds = %917, %821
  %1049 = load float, float addrspace(1)* %689, align 4, !tbaa !11
  %1050 = mul nsw i32 %5, %4
  %1051 = mul nsw i32 %2, %1
  %1052 = sitofp i32 %2 to double
  %1053 = sitofp i32 %1 to double
  %1054 = tail call double @llvm.fabs.f64(double %1052)
  %1055 = tail call double @llvm.amdgcn.frexp.mant.f64(double %1054)
  %1056 = fcmp olt double %1055, 0x3FE5555555555555
  %1057 = zext i1 %1056 to i32
  %1058 = tail call double @llvm.amdgcn.ldexp.f64(double %1055, i32 %1057)
  %1059 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %1054)
  %1060 = sub nsw i32 %1059, %1057
  %1061 = fadd double %1058, -1.000000e+00
  %1062 = fadd double %1058, 1.000000e+00
  %1063 = fadd double %1062, -1.000000e+00
  %1064 = fsub double %1058, %1063
  %1065 = tail call double @llvm.amdgcn.rcp.f64(double %1062)
  %1066 = fneg double %1062
  %1067 = tail call double @llvm.fma.f64(double %1066, double %1065, double 1.000000e+00)
  %1068 = tail call double @llvm.fma.f64(double %1067, double %1065, double %1065)
  %1069 = tail call double @llvm.fma.f64(double %1066, double %1068, double 1.000000e+00)
  %1070 = tail call double @llvm.fma.f64(double %1069, double %1068, double %1068)
  %1071 = fmul double %1061, %1070
  %1072 = fmul double %1062, %1071
  %1073 = fneg double %1072
  %1074 = tail call double @llvm.fma.f64(double %1071, double %1062, double %1073)
  %1075 = tail call double @llvm.fma.f64(double %1071, double %1064, double %1074)
  %1076 = fadd double %1072, %1075
  %1077 = fsub double %1076, %1072
  %1078 = fsub double %1075, %1077
  %1079 = fsub double %1061, %1076
  %1080 = fsub double %1061, %1079
  %1081 = fsub double %1080, %1076
  %1082 = fsub double %1081, %1078
  %1083 = fadd double %1079, %1082
  %1084 = fmul double %1070, %1083
  %1085 = fadd double %1071, %1084
  %1086 = fsub double %1085, %1071
  %1087 = fsub double %1084, %1086
  %1088 = fmul double %1085, %1085
  %1089 = fneg double %1088
  %1090 = tail call double @llvm.fma.f64(double %1085, double %1085, double %1089)
  %1091 = fmul double %1087, 2.000000e+00
  %1092 = tail call double @llvm.fma.f64(double %1085, double %1091, double %1090)
  %1093 = fadd double %1088, %1092
  %1094 = fsub double %1093, %1088
  %1095 = fsub double %1092, %1094
  %1096 = tail call double @llvm.fma.f64(double %1093, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %1097 = tail call double @llvm.fma.f64(double %1093, double %1096, double 0x3FBE25E43ABE935A)
  %1098 = tail call double @llvm.fma.f64(double %1093, double %1097, double 0x3FC110EF47E6C9C2)
  %1099 = tail call double @llvm.fma.f64(double %1093, double %1098, double 0x3FC3B13BCFA74449)
  %1100 = tail call double @llvm.fma.f64(double %1093, double %1099, double 0x3FC745D171BF3C30)
  %1101 = tail call double @llvm.fma.f64(double %1093, double %1100, double 0x3FCC71C71C7792CE)
  %1102 = tail call double @llvm.fma.f64(double %1093, double %1101, double 0x3FD24924924920DA)
  %1103 = tail call double @llvm.fma.f64(double %1093, double %1102, double 0x3FD999999999999C)
  %1104 = sitofp i32 %1060 to double
  %1105 = fmul double %1104, 0x3FE62E42FEFA39EF
  %1106 = fneg double %1105
  %1107 = tail call double @llvm.fma.f64(double %1104, double 0x3FE62E42FEFA39EF, double %1106)
  %1108 = tail call double @llvm.fma.f64(double %1104, double 0x3C7ABC9E3B39803F, double %1107)
  %1109 = fadd double %1105, %1108
  %1110 = fsub double %1109, %1105
  %1111 = fsub double %1108, %1110
  %1112 = tail call double @llvm.amdgcn.ldexp.f64(double %1085, i32 1)
  %1113 = tail call double @llvm.amdgcn.ldexp.f64(double %1087, i32 1)
  %1114 = fmul double %1085, %1093
  %1115 = fneg double %1114
  %1116 = tail call double @llvm.fma.f64(double %1093, double %1085, double %1115)
  %1117 = tail call double @llvm.fma.f64(double %1093, double %1087, double %1116)
  %1118 = tail call double @llvm.fma.f64(double %1095, double %1085, double %1117)
  %1119 = fadd double %1114, %1118
  %1120 = fsub double %1119, %1114
  %1121 = fsub double %1118, %1120
  %1122 = fmul double %1093, %1103
  %1123 = fneg double %1122
  %1124 = tail call double @llvm.fma.f64(double %1093, double %1103, double %1123)
  %1125 = tail call double @llvm.fma.f64(double %1095, double %1103, double %1124)
  %1126 = fadd double %1122, %1125
  %1127 = fsub double %1126, %1122
  %1128 = fsub double %1125, %1127
  %1129 = fadd double %1126, 0x3FE5555555555555
  %1130 = fadd double %1129, 0xBFE5555555555555
  %1131 = fsub double %1126, %1130
  %1132 = fadd double %1128, 0x3C8543B0D5DF274D
  %1133 = fadd double %1132, %1131
  %1134 = fadd double %1129, %1133
  %1135 = fsub double %1134, %1129
  %1136 = fsub double %1133, %1135
  %1137 = fmul double %1119, %1134
  %1138 = fneg double %1137
  %1139 = tail call double @llvm.fma.f64(double %1119, double %1134, double %1138)
  %1140 = tail call double @llvm.fma.f64(double %1119, double %1136, double %1139)
  %1141 = tail call double @llvm.fma.f64(double %1121, double %1134, double %1140)
  %1142 = fadd double %1137, %1141
  %1143 = fsub double %1142, %1137
  %1144 = fsub double %1141, %1143
  %1145 = fadd double %1112, %1142
  %1146 = fsub double %1145, %1112
  %1147 = fsub double %1142, %1146
  %1148 = fadd double %1113, %1144
  %1149 = fadd double %1148, %1147
  %1150 = fadd double %1145, %1149
  %1151 = fsub double %1150, %1145
  %1152 = fsub double %1149, %1151
  %1153 = fadd double %1109, %1150
  %1154 = fsub double %1153, %1109
  %1155 = fsub double %1153, %1154
  %1156 = fsub double %1109, %1155
  %1157 = fsub double %1150, %1154
  %1158 = fadd double %1157, %1156
  %1159 = fadd double %1111, %1152
  %1160 = fsub double %1159, %1111
  %1161 = fsub double %1159, %1160
  %1162 = fsub double %1111, %1161
  %1163 = fsub double %1152, %1160
  %1164 = fadd double %1163, %1162
  %1165 = fadd double %1159, %1158
  %1166 = fadd double %1153, %1165
  %1167 = fsub double %1166, %1153
  %1168 = fsub double %1165, %1167
  %1169 = fadd double %1164, %1168
  %1170 = fadd double %1166, %1169
  %1171 = fsub double %1170, %1166
  %1172 = fsub double %1169, %1171
  %1173 = fmul double %1170, %1053
  %1174 = fneg double %1173
  %1175 = tail call double @llvm.fma.f64(double %1053, double %1170, double %1174)
  %1176 = tail call double @llvm.fma.f64(double %1053, double %1172, double %1175)
  %1177 = fadd double %1173, %1176
  %1178 = fsub double %1177, %1173
  %1179 = fsub double %1176, %1178
  %1180 = tail call double @llvm.fabs.f64(double %1173) #12
  %1181 = fcmp oeq double %1180, 0x7FF0000000000000
  %1182 = select i1 %1181, double %1173, double %1177
  %1183 = tail call double @llvm.fabs.f64(double %1182) #12
  %1184 = fcmp oeq double %1183, 0x7FF0000000000000
  %1185 = select i1 %1184, double 0.000000e+00, double %1179
  %1186 = fmul double %1182, 0x3FF71547652B82FE
  %1187 = tail call double @llvm.rint.f64(double %1186)
  %1188 = fneg double %1187
  %1189 = tail call double @llvm.fma.f64(double %1188, double 0x3FE62E42FEFA39EF, double %1182)
  %1190 = tail call double @llvm.fma.f64(double %1188, double 0x3C7ABC9E3B39803F, double %1189)
  %1191 = tail call double @llvm.fma.f64(double %1190, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %1192 = tail call double @llvm.fma.f64(double %1190, double %1191, double 0x3EC71DEE623FDE64)
  %1193 = tail call double @llvm.fma.f64(double %1190, double %1192, double 0x3EFA01997C89E6B0)
  %1194 = tail call double @llvm.fma.f64(double %1190, double %1193, double 0x3F2A01A014761F6E)
  %1195 = tail call double @llvm.fma.f64(double %1190, double %1194, double 0x3F56C16C1852B7B0)
  %1196 = tail call double @llvm.fma.f64(double %1190, double %1195, double 0x3F81111111122322)
  %1197 = tail call double @llvm.fma.f64(double %1190, double %1196, double 0x3FA55555555502A1)
  %1198 = tail call double @llvm.fma.f64(double %1190, double %1197, double 0x3FC5555555555511)
  %1199 = tail call double @llvm.fma.f64(double %1190, double %1198, double 0x3FE000000000000B)
  %1200 = tail call double @llvm.fma.f64(double %1190, double %1199, double 1.000000e+00)
  %1201 = tail call double @llvm.fma.f64(double %1190, double %1200, double 1.000000e+00)
  %1202 = fptosi double %1187 to i32
  %1203 = tail call double @llvm.amdgcn.ldexp.f64(double %1201, i32 %1202)
  %1204 = fcmp ogt double %1182, 1.024000e+03
  %1205 = select i1 %1204, double 0x7FF0000000000000, double %1203
  %1206 = fcmp olt double %1182, -1.075000e+03
  %1207 = select i1 %1206, double 0.000000e+00, double %1205
  %1208 = tail call double @llvm.fma.f64(double %1207, double %1185, double %1207)
  %1209 = tail call double @llvm.fabs.f64(double %1207) #12
  %1210 = fcmp oeq double %1209, 0x7FF0000000000000
  %1211 = select i1 %1210, double %1207, double %1208
  %1212 = tail call double @llvm.fabs.f64(double %1053)
  %1213 = tail call double @llvm.trunc.f64(double %1212)
  %1214 = fcmp oeq double %1212, %1213
  %1215 = zext i1 %1214 to i32
  %1216 = fmul double %1213, 5.000000e-01
  %1217 = tail call double @llvm.amdgcn.fract.f64(double %1216)
  %1218 = tail call i1 @llvm.amdgcn.class.f64(double %1216, i32 516)
  %1219 = select i1 %1218, double 0.000000e+00, double %1217
  %1220 = fcmp oeq double %1219, 0.000000e+00
  %1221 = and i1 %1214, %1220
  %1222 = zext i1 %1221 to i32
  %1223 = add nuw nsw i32 %1222, %1215
  %1224 = icmp eq i32 %1223, 1
  %1225 = icmp slt i32 %2, 0
  %1226 = and i1 %1225, %1224
  %1227 = select i1 %1226, double -0.000000e+00, double 0.000000e+00
  %1228 = tail call double @llvm.copysign.f64(double %1211, double %1227)
  %1229 = icmp sgt i32 %2, -1
  %1230 = icmp ne i32 %1223, 0
  %1231 = select i1 %1229, i1 true, i1 %1230
  %1232 = select i1 %1231, double %1228, double 0x7FF8000000000000
  %1233 = fcmp oeq double %1212, 0x7FF0000000000000
  %1234 = fcmp oeq double %1054, 1.000000e+00
  %1235 = fadd double %1054, -1.000000e+00
  %1236 = bitcast double %1053 to <2 x i32>
  %1237 = extractelement <2 x i32> %1236, i64 1
  %1238 = bitcast double %1235 to <2 x i32>
  %1239 = extractelement <2 x i32> %1238, i64 1
  %1240 = xor i32 %1239, %1237
  %1241 = icmp sgt i32 %1240, -1
  %1242 = select i1 %1241, double 0x7FF0000000000000, double 0.000000e+00
  %1243 = select i1 %1234, double %1054, double %1242
  %1244 = select i1 %1233, double %1243, double %1232
  %1245 = fcmp oeq double %1054, 0x7FF0000000000000
  %1246 = icmp eq i32 %2, 0
  %1247 = or i1 %1246, %1245
  %1248 = xor i1 %696, %1246
  %1249 = select i1 %1248, double 0.000000e+00, double 0x7FF0000000000000
  %1250 = select i1 %1224, double %1052, double 0.000000e+00
  %1251 = tail call double @llvm.copysign.f64(double %1249, double %1250)
  %1252 = select i1 %1247, double %1251, double %1244
  %1253 = icmp eq i32 %2, 1
  %1254 = or i1 %673, %1253
  %1255 = fptosi double %1252 to i32
  %1256 = shl nsw i32 %1255, 1
  %1257 = select i1 %1254, i32 2, i32 %1256
  %1258 = add nsw i32 %1257, %1051
  %1259 = add i32 %1050, %6
  %1260 = mul i32 %1258, %1259
  %1261 = add nsw i32 %1260, %1051
  %1262 = add nsw i32 %1261, %25
  %1263 = sext i32 %1262 to i64
  %1264 = getelementptr inbounds float, float addrspace(1)* %11, i64 %1263
  store float %1049, float addrspace(1)* %1264, align 4, !tbaa !11
  tail call fastcc void @__ockl_dm_dealloc(i64 %680) #13
  tail call fastcc void @__ockl_dm_dealloc(i64 %685) #13
  tail call fastcc void @__ockl_dm_dealloc(i64 %688) #13
  tail call fastcc void @__ockl_dm_dealloc(i64 %390) #13
  tail call fastcc void @__ockl_dm_dealloc(i64 %254) #13
  br label %1454

1265:                                             ; preds = %697, %1365
  %1266 = phi i32 [ 0, %697 ], [ %1366, %1365 ]
  %1267 = zext i32 %1266 to i64
  %1268 = getelementptr inbounds float, float addrspace(1)* %686, i64 %1267
  store float 0.000000e+00, float addrspace(1)* %1268, align 4, !tbaa !11
  br i1 %698, label %1269, label %1274

1269:                                             ; preds = %1265
  %1270 = icmp eq i32 %1266, 0
  %1271 = add nsw i32 %1266, -1
  %1272 = sext i32 %1271 to i64
  %1273 = getelementptr inbounds float, float addrspace(1)* %391, i64 %1272
  br i1 %1270, label %1279, label %1318

1274:                                             ; preds = %1279, %1318, %1265
  %1275 = icmp eq i32 %1266, 0
  %1276 = add nsw i32 %1266, -1
  %1277 = sext i32 %1276 to i64
  %1278 = getelementptr inbounds float, float addrspace(1)* %391, i64 %1277
  br label %1368

1279:                                             ; preds = %1269, %1279
  %1280 = phi float [ %1315, %1279 ], [ 0.000000e+00, %1269 ]
  %1281 = phi i32 [ %1316, %1279 ], [ 0, %1269 ]
  %1282 = mul nsw i32 %1281, %0
  %1283 = add nsw i32 %1282, %25
  %1284 = sext i32 %1283 to i64
  %1285 = getelementptr inbounds float, float addrspace(1)* %14, i64 %1284
  %1286 = load float, float addrspace(1)* %1285, align 4, !tbaa !11
  %1287 = fdiv contract float %1286, %695
  %1288 = fneg contract float %1287
  %1289 = fmul contract float %1287, %1288
  %1290 = fmul contract float %1289, 5.000000e-01
  %1291 = fmul float %1290, 0x3FF7154760000000
  %1292 = tail call float @llvm.rint.f32(float %1291)
  %1293 = fcmp ogt float %1290, 0x40562E4300000000
  %1294 = fcmp olt float %1290, 0xC059D1DA00000000
  %1295 = fneg float %1291
  %1296 = tail call float @llvm.fma.f32(float %1290, float 0x3FF7154760000000, float %1295)
  %1297 = tail call float @llvm.fma.f32(float %1290, float 0x3E54AE0BE0000000, float %1296)
  %1298 = fsub float %1291, %1292
  %1299 = fadd float %1297, %1298
  %1300 = tail call float @llvm.exp2.f32(float %1299)
  %1301 = fptosi float %1292 to i32
  %1302 = tail call float @llvm.amdgcn.ldexp.f32(float %1300, i32 %1301)
  %1303 = select i1 %1294, float 0.000000e+00, float %1302
  %1304 = select i1 %1293, float 0x7FF0000000000000, float %1303
  %1305 = fpext float %1304 to double
  %1306 = fdiv contract double %1305, %711
  %1307 = fptrunc double %1306 to float
  %1308 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %1284
  %1309 = load i32, i32 addrspace(1)* %1308, align 4, !tbaa !7
  %1310 = add nsw i32 %1309, -1
  %1311 = sext i32 %1310 to i64
  %1312 = getelementptr inbounds float, float addrspace(1)* %10, i64 %1311
  %1313 = load float, float addrspace(1)* %1312, align 4, !tbaa !11
  %1314 = fmul contract float %1313, %1307
  %1315 = fadd contract float %1280, %1314
  store float %1315, float addrspace(1)* %1268, align 4, !tbaa !11
  %1316 = add nuw nsw i32 %1281, 1
  %1317 = icmp eq i32 %1316, %7
  br i1 %1317, label %1274, label %1279, !llvm.loop !28

1318:                                             ; preds = %1269, %1318
  %1319 = phi float [ %1362, %1318 ], [ 0.000000e+00, %1269 ]
  %1320 = phi i32 [ %1363, %1318 ], [ 0, %1269 ]
  %1321 = mul nsw i32 %1320, %0
  %1322 = add nsw i32 %1321, %25
  %1323 = sext i32 %1322 to i64
  %1324 = getelementptr inbounds float, float addrspace(1)* %14, i64 %1323
  %1325 = load float, float addrspace(1)* %1324, align 4, !tbaa !11
  %1326 = fdiv contract float %1325, %695
  %1327 = fneg contract float %1326
  %1328 = fmul contract float %1326, %1327
  %1329 = fmul contract float %1328, 5.000000e-01
  %1330 = fmul float %1329, 0x3FF7154760000000
  %1331 = tail call float @llvm.rint.f32(float %1330)
  %1332 = fcmp ogt float %1329, 0x40562E4300000000
  %1333 = fcmp olt float %1329, 0xC059D1DA00000000
  %1334 = fneg float %1330
  %1335 = tail call float @llvm.fma.f32(float %1329, float 0x3FF7154760000000, float %1334)
  %1336 = tail call float @llvm.fma.f32(float %1329, float 0x3E54AE0BE0000000, float %1335)
  %1337 = fsub float %1330, %1331
  %1338 = fadd float %1336, %1337
  %1339 = tail call float @llvm.exp2.f32(float %1338)
  %1340 = fptosi float %1331 to i32
  %1341 = tail call float @llvm.amdgcn.ldexp.f32(float %1339, i32 %1340)
  %1342 = select i1 %1333, float 0.000000e+00, float %1341
  %1343 = select i1 %1332, float 0x7FF0000000000000, float %1342
  %1344 = fpext float %1343 to double
  %1345 = fdiv contract double %1344, %711
  %1346 = fptrunc double %1345 to float
  %1347 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %1323
  %1348 = load i32, i32 addrspace(1)* %1347, align 4, !tbaa !7
  %1349 = add nsw i32 %1348, -1
  %1350 = sext i32 %1349 to i64
  %1351 = getelementptr inbounds float, float addrspace(1)* %10, i64 %1350
  %1352 = load float, float addrspace(1)* %1351, align 4, !tbaa !11
  %1353 = mul nsw i32 %1349, %1
  %1354 = add i32 %1271, %1353
  %1355 = sext i32 %1354 to i64
  %1356 = getelementptr inbounds float, float addrspace(1)* %9, i64 %1355
  %1357 = load float, float addrspace(1)* %1356, align 4, !tbaa !11
  %1358 = load float, float addrspace(1)* %1273, align 4, !tbaa !11
  %1359 = fsub contract float %1357, %1358
  %1360 = fmul contract float %1352, %1359
  %1361 = fmul contract float %1360, %1346
  %1362 = fadd contract float %1319, %1361
  store float %1362, float addrspace(1)* %1268, align 4, !tbaa !11
  %1363 = add nuw nsw i32 %1320, 1
  %1364 = icmp eq i32 %1363, %7
  br i1 %1364, label %1274, label %1318, !llvm.loop !28

1365:                                             ; preds = %1380
  %1366 = add nuw i32 %1266, 1
  %1367 = icmp eq i32 %1266, %1
  br i1 %1367, label %745, label %1265, !llvm.loop !29

1368:                                             ; preds = %1274, %1380
  %1369 = phi i32 [ 0, %1274 ], [ %1381, %1380 ]
  %1370 = mul nsw i32 %1369, %510
  %1371 = add nsw i32 %1370, %1266
  %1372 = sext i32 %1371 to i64
  %1373 = getelementptr inbounds float, float addrspace(1)* %681, i64 %1372
  store float 0.000000e+00, float addrspace(1)* %1373, align 4, !tbaa !11
  br i1 %698, label %1374, label %1380

1374:                                             ; preds = %1368
  %1375 = icmp eq i32 %1369, 0
  %1376 = select i1 %1275, i1 %1375, i1 false
  %1377 = add nsw i32 %1369, -1
  %1378 = sext i32 %1377 to i64
  %1379 = getelementptr inbounds float, float addrspace(1)* %391, i64 %1378
  br label %1383

1380:                                             ; preds = %1449, %1368
  %1381 = add nuw i32 %1369, 1
  %1382 = icmp eq i32 %1369, %1
  br i1 %1382, label %1365, label %1368, !llvm.loop !30

1383:                                             ; preds = %1374, %1449
  %1384 = phi float [ 0.000000e+00, %1374 ], [ %1451, %1449 ]
  %1385 = phi i32 [ 0, %1374 ], [ %1452, %1449 ]
  %1386 = mul nsw i32 %1385, %0
  %1387 = add nsw i32 %1386, %25
  %1388 = sext i32 %1387 to i64
  %1389 = getelementptr inbounds float, float addrspace(1)* %14, i64 %1388
  %1390 = load float, float addrspace(1)* %1389, align 4, !tbaa !11
  %1391 = fdiv contract float %1390, %695
  %1392 = fneg contract float %1391
  %1393 = fmul contract float %1391, %1392
  %1394 = fmul contract float %1393, 5.000000e-01
  %1395 = fmul float %1394, 0x3FF7154760000000
  %1396 = tail call float @llvm.rint.f32(float %1395)
  %1397 = fcmp ogt float %1394, 0x40562E4300000000
  %1398 = fcmp olt float %1394, 0xC059D1DA00000000
  %1399 = fneg float %1395
  %1400 = tail call float @llvm.fma.f32(float %1394, float 0x3FF7154760000000, float %1399)
  %1401 = tail call float @llvm.fma.f32(float %1394, float 0x3E54AE0BE0000000, float %1400)
  %1402 = fsub float %1395, %1396
  %1403 = fadd float %1401, %1402
  %1404 = tail call float @llvm.exp2.f32(float %1403)
  %1405 = fptosi float %1396 to i32
  %1406 = tail call float @llvm.amdgcn.ldexp.f32(float %1404, i32 %1405)
  %1407 = select i1 %1398, float 0.000000e+00, float %1406
  %1408 = select i1 %1397, float 0x7FF0000000000000, float %1407
  %1409 = fpext float %1408 to double
  %1410 = fdiv contract double %1409, %711
  %1411 = fptrunc double %1410 to float
  br i1 %1376, label %1449, label %1412

1412:                                             ; preds = %1383
  %1413 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %1388
  %1414 = load i32, i32 addrspace(1)* %1413, align 4, !tbaa !7
  %1415 = add nsw i32 %1414, -1
  %1416 = mul nsw i32 %1415, %1
  br i1 %1275, label %1417, label %1425

1417:                                             ; preds = %1412
  %1418 = add i32 %1377, %1416
  %1419 = sext i32 %1418 to i64
  %1420 = getelementptr inbounds float, float addrspace(1)* %9, i64 %1419
  %1421 = load float, float addrspace(1)* %1420, align 4, !tbaa !11
  %1422 = load float, float addrspace(1)* %1379, align 4, !tbaa !11
  %1423 = fsub contract float %1421, %1422
  %1424 = fmul contract float %1423, %1411
  br label %1449

1425:                                             ; preds = %1412
  br i1 %1375, label %1426, label %1434

1426:                                             ; preds = %1425
  %1427 = add i32 %1276, %1416
  %1428 = sext i32 %1427 to i64
  %1429 = getelementptr inbounds float, float addrspace(1)* %9, i64 %1428
  %1430 = load float, float addrspace(1)* %1429, align 4, !tbaa !11
  %1431 = load float, float addrspace(1)* %1278, align 4, !tbaa !11
  %1432 = fsub contract float %1430, %1431
  %1433 = fmul contract float %1432, %1411
  br label %1449

1434:                                             ; preds = %1425
  %1435 = add i32 %1377, %1416
  %1436 = sext i32 %1435 to i64
  %1437 = getelementptr inbounds float, float addrspace(1)* %9, i64 %1436
  %1438 = load float, float addrspace(1)* %1437, align 4, !tbaa !11
  %1439 = load float, float addrspace(1)* %1379, align 4, !tbaa !11
  %1440 = fsub contract float %1438, %1439
  %1441 = add i32 %1276, %1416
  %1442 = sext i32 %1441 to i64
  %1443 = getelementptr inbounds float, float addrspace(1)* %9, i64 %1442
  %1444 = load float, float addrspace(1)* %1443, align 4, !tbaa !11
  %1445 = load float, float addrspace(1)* %1278, align 4, !tbaa !11
  %1446 = fsub contract float %1444, %1445
  %1447 = fmul contract float %1440, %1446
  %1448 = fmul contract float %1447, %1411
  br label %1449

1449:                                             ; preds = %1383, %1417, %1434, %1426
  %1450 = phi float [ %1424, %1417 ], [ %1448, %1434 ], [ %1433, %1426 ], [ %1411, %1383 ]
  %1451 = fadd contract float %1384, %1450
  store float %1451, float addrspace(1)* %1373, align 4, !tbaa !11
  %1452 = add nuw nsw i32 %1385, 1
  %1453 = icmp eq i32 %1452, %7
  br i1 %1453, label %1380, label %1383, !llvm.loop !31

1454:                                             ; preds = %32, %1048, %16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.trunc.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #3

; Function Attrs: convergent noinline norecurse nounwind
define internal fastcc void @__ockl_dm_dealloc(i64 noundef %0) unnamed_addr #4 {
  %2 = and i64 %0, 4095
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %21

4:                                                ; preds = %1
  %5 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 24
  %7 = bitcast i8 addrspace(4)* %6 to i64 addrspace(4)*
  %8 = load i64, i64 addrspace(4)* %7, align 8, !tbaa !32
  %9 = inttoptr i64 %8 to i8 addrspace(1)*
  %10 = addrspacecast i8 addrspace(1)* %9 to i8*
  %11 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %0, i64 noundef 0) #13
  %12 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %13 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %14 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %13, i32 0)
  %15 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %12, i32 %14)
  %16 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %17 = icmp eq i32 %15, 0
  br i1 %17, label %18, label %106

18:                                               ; preds = %4
  %19 = tail call i64 @llvm.ctpop.i64(i64 %16), !range !39
  %20 = atomicrmw sub i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %19 syncscope("agent-one-as") monotonic, align 8
  br label %106

21:                                               ; preds = %1
  %22 = and i64 %0, -2097152
  %23 = inttoptr i64 %22 to %5 addrspace(1)*
  %24 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 0
  %25 = load i32, i32 addrspace(1)* %24, align 2097152, !tbaa !40
  %26 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 1
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !43
  %28 = zext i32 %25 to i64
  %29 = icmp ult i32 %27, 256
  %30 = zext i32 %27 to i64
  %31 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %28, i64 %30
  %32 = add i32 %27, -256
  %33 = lshr i32 %32, 8
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %28, i64 %34, i32 0
  %36 = and i32 %27, 255
  %37 = zext i32 %36 to i64
  %38 = trunc i64 %0 to i32
  %39 = and i32 %38, 2097151
  %40 = lshr i32 %25, 1
  %41 = add nuw i32 %40, 4
  %42 = and i32 %41, 31
  %43 = shl nuw i32 1, %42
  %44 = and i32 %25, 1
  %45 = icmp eq i32 %44, 0
  %46 = lshr i32 %43, 1
  %47 = select i1 %45, i32 0, i32 %46
  %48 = add nuw i32 %47, %43
  %49 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %28, i32 3
  br label %50

50:                                               ; preds = %101, %21
  %51 = phi i32 [ 1, %21 ], [ %102, %101 ]
  %52 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %51) #13, !srcloc !44
  %53 = icmp eq i32 %51, 0
  br i1 %53, label %101, label %54

54:                                               ; preds = %50
  %55 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %25)
  %56 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %27)
  %57 = icmp eq i32 %25, %55
  %58 = icmp eq i32 %27, %56
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %60, label %101

60:                                               ; preds = %54
  %61 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %62 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %63 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %62, i32 0)
  %64 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %61, i32 %63)
  %65 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %66 = tail call i64 @llvm.ctpop.i64(i64 %65), !range !39
  %67 = trunc i64 %66 to i32
  %68 = icmp ne i32 %64, 0
  %69 = select i1 %68, i1 true, i1 %29
  %70 = select i1 %68, %3 addrspace(1)* null, %3 addrspace(1)* %31
  br i1 %69, label %75, label %71

71:                                               ; preds = %60
  %72 = load atomic i64, i64 addrspace(1)* %35 syncscope("agent-one-as") monotonic, align 8
  %73 = inttoptr i64 %72 to %3 addrspace(1)*
  %74 = getelementptr inbounds %3, %3 addrspace(1)* %73, i64 %37
  br label %75

75:                                               ; preds = %71, %60
  %76 = phi %3 addrspace(1)* [ %74, %71 ], [ %70, %60 ]
  %77 = ptrtoint %3 addrspace(1)* %76 to i64
  %78 = trunc i64 %77 to i32
  %79 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %78)
  %80 = lshr i64 %77, 32
  %81 = trunc i64 %80 to i32
  %82 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %81)
  %83 = load i32, i32 addrspace(4)* %49, align 4, !tbaa !45
  %84 = sub i32 %39, %83
  %85 = udiv i32 %84, %48
  %86 = and i32 %85, 31
  %87 = shl nuw i32 1, %86
  %88 = xor i32 %87, -1
  %89 = lshr i32 %85, 5
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 4, i64 %90
  %92 = atomicrmw and i32 addrspace(1)* %91, i32 %88 syncscope("agent-one-as") monotonic, align 4
  br i1 %68, label %101, label %93

93:                                               ; preds = %75
  %94 = insertelement <2 x i32> undef, i32 %79, i64 0
  %95 = insertelement <2 x i32> %94, i32 %82, i64 1
  %96 = bitcast <2 x i32> %95 to i64
  %97 = inttoptr i64 %96 to i8 addrspace(1)*
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %97, i64 16
  %99 = bitcast i8 addrspace(1)* %98 to i32 addrspace(1)*
  %100 = atomicrmw sub i32 addrspace(1)* %99, i32 %67 syncscope("agent-one-as") monotonic, align 4
  br label %101

101:                                              ; preds = %93, %75, %54, %50
  %102 = phi i32 [ 0, %50 ], [ 1, %54 ], [ 0, %93 ], [ 0, %75 ]
  %103 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %102) #13, !srcloc !47
  %104 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %103, i32 noundef 0, i32 noundef 33) #15
  %105 = icmp eq i64 %104, 0
  br i1 %105, label %106, label %50

106:                                              ; preds = %101, %18, %4
  ret void
}

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #2

; Function Attrs: nofree nounwind readonly
declare i32 @llvm.read_register.i32(metadata) #5

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #6

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i32(i32, i32, i32 immarg) #6

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #7

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #7

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2) unnamed_addr #8 {
  %4 = alloca i8*, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = alloca i64, align 8, addrspace(5)
  %9 = alloca i64, align 8, addrspace(5)
  %10 = alloca i64, align 8, addrspace(5)
  %11 = alloca i64, align 8, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i32, align 4, addrspace(5)
  %15 = alloca i32, align 4, addrspace(5)
  %16 = alloca %6 addrspace(1)*, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca %7 addrspace(1)*, align 8, addrspace(5)
  %19 = alloca %8 addrspace(1)*, align 8, addrspace(5)
  %20 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %4, align 8, !tbaa !48
  store i32 3, i32 addrspace(5)* %5, align 4, !tbaa !50
  store i64 %1, i64 addrspace(5)* %6, align 8, !tbaa !32
  store i64 %2, i64 addrspace(5)* %7, align 8, !tbaa !32
  store i64 0, i64 addrspace(5)* %8, align 8, !tbaa !32
  store i64 0, i64 addrspace(5)* %9, align 8, !tbaa !32
  store i64 0, i64 addrspace(5)* %10, align 8, !tbaa !32
  store i64 0, i64 addrspace(5)* %11, align 8, !tbaa !32
  store i64 0, i64 addrspace(5)* %12, align 8, !tbaa !32
  store i64 0, i64 addrspace(5)* %13, align 8, !tbaa !32
  %21 = bitcast i32 addrspace(5)* %14 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %21) #10
  %22 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %23 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %22)
  store i32 %23, i32 addrspace(5)* %14, align 4, !tbaa !50
  %24 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !50
  %25 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %24) #13, !srcloc !51
  store i32 %25, i32 addrspace(5)* %14, align 4, !tbaa !50
  %26 = bitcast i32 addrspace(5)* %15 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %26) #10
  %27 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !50
  %28 = call i32 @llvm.amdgcn.readfirstlane(i32 %27)
  store i32 %28, i32 addrspace(5)* %15, align 4, !tbaa !50
  %29 = bitcast %6 addrspace(1)* addrspace(5)* %16 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %29) #10
  %30 = load i8*, i8* addrspace(5)* %4, align 8, !tbaa !48
  %31 = addrspacecast i8* %30 to %6 addrspace(1)*
  store %6 addrspace(1)* %31, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !48
  %32 = bitcast i64 addrspace(5)* %17 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %32) #10
  %33 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !48
  %34 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !50
  %35 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !50
  %36 = icmp eq i32 %34, %35
  br i1 %36, label %37, label %62

37:                                               ; preds = %3
  %38 = getelementptr inbounds %6, %6 addrspace(1)* %33, i64 0, i32 3
  %39 = load atomic i64, i64 addrspace(1)* %38 syncscope("one-as") acquire, align 8
  %40 = getelementptr %6, %6 addrspace(1)* %33, i64 0, i32 0
  %41 = getelementptr %6, %6 addrspace(1)* %33, i64 0, i32 5
  %42 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %40, align 8, !tbaa !52
  %43 = load i64, i64 addrspace(1)* %41, align 8, !tbaa !55
  %44 = and i64 %43, %39
  %45 = getelementptr inbounds %7, %7 addrspace(1)* %42, i64 %44, i32 0
  %46 = load atomic i64, i64 addrspace(1)* %45 syncscope("one-as") monotonic, align 8
  %47 = cmpxchg i64 addrspace(1)* %38, i64 %39, i64 %46 syncscope("one-as") acquire monotonic, align 8
  %48 = extractvalue { i64, i1 } %47, 1
  br i1 %48, label %59, label %49

49:                                               ; preds = %49, %37
  %50 = phi { i64, i1 } [ %57, %49 ], [ %47, %37 ]
  %51 = extractvalue { i64, i1 } %50, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %52 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %40, align 8, !tbaa !52
  %53 = load i64, i64 addrspace(1)* %41, align 8, !tbaa !55
  %54 = and i64 %53, %51
  %55 = getelementptr inbounds %7, %7 addrspace(1)* %52, i64 %54, i32 0
  %56 = load atomic i64, i64 addrspace(1)* %55 syncscope("one-as") monotonic, align 8
  %57 = cmpxchg i64 addrspace(1)* %38, i64 %51, i64 %56 syncscope("one-as") acquire monotonic, align 8
  %58 = extractvalue { i64, i1 } %57, 1
  br i1 %58, label %59, label %49

59:                                               ; preds = %49, %37
  %60 = phi { i64, i1 } [ %47, %37 ], [ %57, %49 ]
  %61 = extractvalue { i64, i1 } %60, 0
  br label %62

62:                                               ; preds = %3, %59
  %63 = phi i64 [ %61, %59 ], [ 0, %3 ]
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %63, 32
  %66 = trunc i64 %65 to i32
  %67 = call i32 @llvm.amdgcn.readfirstlane(i32 %64)
  %68 = call i32 @llvm.amdgcn.readfirstlane(i32 %66)
  %69 = zext i32 %68 to i64
  %70 = shl nuw i64 %69, 32
  %71 = zext i32 %67 to i64
  %72 = or i64 %70, %71
  store i64 %72, i64 addrspace(5)* %17, align 8, !tbaa !32
  %73 = bitcast %7 addrspace(1)* addrspace(5)* %18 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %73) #10
  %74 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !48
  %75 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !32
  %76 = getelementptr %6, %6 addrspace(1)* %74, i64 0, i32 0
  %77 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %76, align 8, !tbaa !52
  %78 = getelementptr %6, %6 addrspace(1)* %74, i64 0, i32 5
  %79 = load i64, i64 addrspace(1)* %78, align 8, !tbaa !55
  %80 = and i64 %75, %79
  %81 = getelementptr inbounds %7, %7 addrspace(1)* %77, i64 %80
  store %7 addrspace(1)* %81, %7 addrspace(1)* addrspace(5)* %18, align 8, !tbaa !48
  %82 = bitcast %8 addrspace(1)* addrspace(5)* %19 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %82) #10
  %83 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !48
  %84 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !32
  %85 = getelementptr %6, %6 addrspace(1)* %83, i64 0, i32 1
  %86 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(1)* %85, align 8, !tbaa !56
  %87 = getelementptr %6, %6 addrspace(1)* %83, i64 0, i32 5
  %88 = load i64, i64 addrspace(1)* %87, align 8, !tbaa !55
  %89 = and i64 %84, %88
  %90 = getelementptr inbounds %8, %8 addrspace(1)* %86, i64 %89
  store %8 addrspace(1)* %90, %8 addrspace(1)* addrspace(5)* %19, align 8, !tbaa !48
  %91 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %18, align 8, !tbaa !48
  %92 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %19, align 8, !tbaa !48
  %93 = load i32, i32 addrspace(5)* %5, align 4, !tbaa !50
  %94 = load i64, i64 addrspace(5)* %6, align 8, !tbaa !32
  %95 = load i64, i64 addrspace(5)* %7, align 8, !tbaa !32
  %96 = load i64, i64 addrspace(5)* %8, align 8, !tbaa !32
  %97 = load i64, i64 addrspace(5)* %9, align 8, !tbaa !32
  %98 = load i64, i64 addrspace(5)* %10, align 8, !tbaa !32
  %99 = load i64, i64 addrspace(5)* %11, align 8, !tbaa !32
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !32
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !32
  %102 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !50
  %103 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !50
  %104 = call i64 @llvm.read_register.i64(metadata !38) #14
  %105 = icmp eq i32 %102, %103
  br i1 %105, label %106, label %110

106:                                              ; preds = %62
  %107 = getelementptr inbounds %7, %7 addrspace(1)* %91, i64 0, i32 2
  store i32 %93, i32 addrspace(1)* %107, align 8, !tbaa !57
  %108 = getelementptr inbounds %7, %7 addrspace(1)* %91, i64 0, i32 1
  store i64 %104, i64 addrspace(1)* %108, align 8, !tbaa !59
  %109 = getelementptr inbounds %7, %7 addrspace(1)* %91, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %109, align 4, !tbaa !60
  br label %110

110:                                              ; preds = %62, %106
  %111 = zext i32 %102 to i64
  %112 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 0
  store i64 %94, i64 addrspace(1)* %112, align 8, !tbaa !32
  %113 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 1
  store i64 %95, i64 addrspace(1)* %113, align 8, !tbaa !32
  %114 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 2
  store i64 %96, i64 addrspace(1)* %114, align 8, !tbaa !32
  %115 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 3
  store i64 %97, i64 addrspace(1)* %115, align 8, !tbaa !32
  %116 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 4
  store i64 %98, i64 addrspace(1)* %116, align 8, !tbaa !32
  %117 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 5
  store i64 %99, i64 addrspace(1)* %117, align 8, !tbaa !32
  %118 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 6
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !32
  %119 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 7
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !32
  %120 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !48
  %121 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !32
  %122 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !50
  %123 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !50
  %124 = icmp eq i32 %122, %123
  br i1 %124, label %125, label %157

125:                                              ; preds = %110
  %126 = getelementptr inbounds %6, %6 addrspace(1)* %120, i64 0, i32 4
  %127 = load atomic i64, i64 addrspace(1)* %126 syncscope("one-as") monotonic, align 8
  %128 = getelementptr %6, %6 addrspace(1)* %120, i64 0, i32 0
  %129 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %128, align 8, !tbaa !52
  %130 = getelementptr %6, %6 addrspace(1)* %120, i64 0, i32 5
  %131 = load i64, i64 addrspace(1)* %130, align 8, !tbaa !55
  %132 = and i64 %131, %121
  %133 = getelementptr inbounds %7, %7 addrspace(1)* %129, i64 %132, i32 0
  store i64 %127, i64 addrspace(1)* %133, align 8, !tbaa !61
  %134 = cmpxchg i64 addrspace(1)* %126, i64 %127, i64 %121 syncscope("one-as") release monotonic, align 8
  %135 = extractvalue { i64, i1 } %134, 1
  br i1 %135, label %141, label %136

136:                                              ; preds = %136, %125
  %137 = phi { i64, i1 } [ %139, %136 ], [ %134, %125 ]
  %138 = extractvalue { i64, i1 } %137, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %138, i64 addrspace(1)* %133, align 8, !tbaa !61
  %139 = cmpxchg i64 addrspace(1)* %126, i64 %138, i64 %121 syncscope("one-as") release monotonic, align 8
  %140 = extractvalue { i64, i1 } %139, 1
  br i1 %140, label %141, label %136

141:                                              ; preds = %136, %125
  %142 = getelementptr inbounds %6, %6 addrspace(1)* %120, i64 0, i32 2, i32 0
  %143 = load i64, i64 addrspace(1)* %142, align 8
  %144 = inttoptr i64 %143 to %10 addrspace(1)*
  %145 = getelementptr inbounds %10, %10 addrspace(1)* %144, i64 0, i32 1, i32 0
  %146 = atomicrmw add i64 addrspace(1)* %145, i64 1 syncscope("one-as") release, align 8
  %147 = getelementptr inbounds %10, %10 addrspace(1)* %144, i64 0, i32 2
  %148 = load i64, i64 addrspace(1)* %147, align 16, !tbaa !62
  %149 = icmp eq i64 %148, 0
  br i1 %149, label %157, label %150

150:                                              ; preds = %141
  %151 = inttoptr i64 %148 to i64 addrspace(1)*
  %152 = getelementptr inbounds %10, %10 addrspace(1)* %144, i64 0, i32 3
  %153 = load i32, i32 addrspace(1)* %152, align 8, !tbaa !64
  %154 = zext i32 %153 to i64
  store atomic i64 %154, i64 addrspace(1)* %151 syncscope("one-as") release, align 8
  %155 = call i32 @llvm.amdgcn.readfirstlane(i32 %153)
  %156 = and i32 %155, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %156)
  br label %157

157:                                              ; preds = %110, %141, %150
  %158 = bitcast <2 x i64> addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %158) #10
  %159 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %18, align 8, !tbaa !48
  %160 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %19, align 8, !tbaa !48
  %161 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !50
  %162 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !50
  %163 = icmp eq i32 %161, %162
  %164 = getelementptr inbounds %7, %7 addrspace(1)* %159, i64 0, i32 3
  br label %165

165:                                              ; preds = %173, %157
  br i1 %163, label %166, label %169

166:                                              ; preds = %165
  %167 = load atomic i32, i32 addrspace(1)* %164 syncscope("one-as") acquire, align 4
  %168 = and i32 %167, 1
  br label %169

169:                                              ; preds = %166, %165
  %170 = phi i32 [ %168, %166 ], [ 1, %165 ]
  %171 = call i32 @llvm.amdgcn.readfirstlane(i32 %170)
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %174, label %173

173:                                              ; preds = %169
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %165

174:                                              ; preds = %169
  %175 = zext i32 %161 to i64
  %176 = getelementptr inbounds %8, %8 addrspace(1)* %160, i64 0, i32 0, i64 %175, i64 0
  %177 = getelementptr inbounds %8, %8 addrspace(1)* %160, i64 0, i32 0, i64 %175, i64 1
  %178 = load i64, i64 addrspace(1)* %176, align 8, !tbaa !32
  %179 = load i64, i64 addrspace(1)* %177, align 8, !tbaa !32
  %180 = insertelement <2 x i64> undef, i64 %178, i64 0
  %181 = insertelement <2 x i64> %180, i64 %179, i64 1
  store <2 x i64> %181, <2 x i64> addrspace(5)* %20, align 16, !tbaa !65
  %182 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !48
  %183 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !32
  %184 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !50
  %185 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !50
  %186 = icmp eq i32 %184, %185
  br i1 %186, label %187, label %207

187:                                              ; preds = %174
  %188 = getelementptr inbounds %6, %6 addrspace(1)* %182, i64 0, i32 5
  %189 = load i64, i64 addrspace(1)* %188, align 8, !tbaa !55
  %190 = add i64 %189, 1
  %191 = add i64 %190, %183
  %192 = icmp eq i64 %191, 0
  %193 = select i1 %192, i64 %190, i64 %191
  %194 = getelementptr inbounds %6, %6 addrspace(1)* %182, i64 0, i32 3
  %195 = load atomic i64, i64 addrspace(1)* %194 syncscope("one-as") monotonic, align 8
  %196 = getelementptr %6, %6 addrspace(1)* %182, i64 0, i32 0
  %197 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %196, align 8, !tbaa !52
  %198 = and i64 %193, %189
  %199 = getelementptr inbounds %7, %7 addrspace(1)* %197, i64 %198, i32 0
  store i64 %195, i64 addrspace(1)* %199, align 8, !tbaa !61
  %200 = cmpxchg i64 addrspace(1)* %194, i64 %195, i64 %193 syncscope("one-as") release monotonic, align 8
  %201 = extractvalue { i64, i1 } %200, 1
  br i1 %201, label %207, label %202

202:                                              ; preds = %202, %187
  %203 = phi { i64, i1 } [ %205, %202 ], [ %200, %187 ]
  %204 = extractvalue { i64, i1 } %203, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %204, i64 addrspace(1)* %199, align 8, !tbaa !61
  %205 = cmpxchg i64 addrspace(1)* %194, i64 %204, i64 %193 syncscope("one-as") release monotonic, align 8
  %206 = extractvalue { i64, i1 } %205, 1
  br i1 %206, label %207, label %202

207:                                              ; preds = %174, %187, %202
  %208 = load <2 x i64>, <2 x i64> addrspace(5)* %20, align 16, !tbaa !65
  %209 = bitcast <2 x i64> addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %209) #10
  %210 = bitcast %8 addrspace(1)* addrspace(5)* %19 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %210) #10
  %211 = bitcast %7 addrspace(1)* addrspace(5)* %18 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %211) #10
  %212 = bitcast i64 addrspace(5)* %17 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %212) #10
  %213 = bitcast %6 addrspace(1)* addrspace(5)* %16 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %213) #10
  %214 = bitcast i32 addrspace(5)* %15 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %214) #10
  %215 = bitcast i32 addrspace(5)* %14 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %215) #10
  ret <2 x i64> %208
}

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #9

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #10

; Function Attrs: convergent noinline norecurse nounwind
define internal fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 noundef %0) unnamed_addr #11 {
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %1423, label %3

3:                                                ; preds = %1
  %4 = icmp ugt i64 %0, 3072
  br i1 %4, label %5, label %27

5:                                                ; preds = %3
  %6 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 24
  %8 = bitcast i8 addrspace(4)* %7 to i64 addrspace(4)*
  %9 = load i64, i64 addrspace(4)* %8, align 8, !tbaa !32
  %10 = inttoptr i64 %9 to i8 addrspace(1)*
  %11 = addrspacecast i8 addrspace(1)* %10 to i8*
  %12 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %11, i64 noundef 0, i64 noundef %0) #13
  %13 = extractelement <2 x i64> %12, i64 0
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %25, label %15

15:                                               ; preds = %5
  %16 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %17 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %18 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %17, i32 0)
  %19 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %16, i32 %18)
  %20 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %21 = icmp eq i32 %19, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %15
  %23 = tail call i64 @llvm.ctpop.i64(i64 %20), !range !39
  %24 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %23 syncscope("agent-one-as") monotonic, align 8
  br label %25

25:                                               ; preds = %22, %15, %5
  %26 = inttoptr i64 %13 to i8 addrspace(1)*
  br label %1423

27:                                               ; preds = %3
  %28 = trunc i64 %0 to i32
  %29 = tail call i32 @llvm.umax.i32(i32 %28, i32 16)
  %30 = tail call i32 @llvm.ctlz.i32(i32 %29, i1 false), !range !66
  %31 = sub nsw i32 31, %30
  %32 = and i32 %31, 31
  %33 = shl nuw i32 1, %32
  %34 = shl nuw nsw i32 %30, 1
  %35 = sub nsw i32 54, %34
  %36 = icmp ugt i32 %29, %33
  %37 = zext i1 %36 to i32
  %38 = or i32 %35, %37
  %39 = lshr i32 %33, 1
  %40 = or i32 %39, %33
  %41 = icmp ugt i32 %29, %40
  %42 = zext i1 %41 to i32
  %43 = add nsw i32 %38, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 1, i64 %44, i32 0
  %46 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %44, i32 0
  %47 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 2
  %48 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 2, i64 %44, i32 0
  %49 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 4, i64 %44, i32 0
  %50 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 3, i64 %44, i32 0
  %51 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 5
  %52 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 0
  %53 = lshr i64 191, %44
  %54 = and i64 %53, 1
  %55 = icmp eq i64 %54, 0
  %56 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 4
  %57 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 6
  %58 = icmp eq i32 %43, 2
  %59 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %43, i64 0
  %60 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 24
  %62 = bitcast i8 addrspace(4)* %61 to i64 addrspace(4)*
  br label %63

63:                                               ; preds = %1417, %27
  %64 = phi i32 [ 1, %27 ], [ %1418, %1417 ]
  %65 = phi i8 addrspace(1)* [ null, %27 ], [ %1419, %1417 ]
  %66 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %64) #13, !srcloc !44
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %1417, label %68

68:                                               ; preds = %63
  %69 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %43)
  %70 = icmp eq i32 %69, %43
  br i1 %70, label %71, label %1417

71:                                               ; preds = %68, %1410
  %72 = phi i32 [ %1411, %1410 ], [ %66, %68 ]
  %73 = phi i32 [ %1412, %1410 ], [ 1, %68 ]
  %74 = phi i8 addrspace(1)* [ %1413, %1410 ], [ %65, %68 ]
  %75 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %73) #13, !srcloc !44
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %1410, label %77

77:                                               ; preds = %71
  %78 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %79 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %80 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %79, i32 0)
  %81 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %78, i32 %80)
  %82 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %81) #13, !srcloc !67
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %86

84:                                               ; preds = %77
  %85 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %86

86:                                               ; preds = %84, %77
  %87 = phi i32 [ %85, %84 ], [ 0, %77 ]
  %88 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %87)
  %89 = icmp ult i32 %88, 65792
  br i1 %89, label %90, label %634

90:                                               ; preds = %86
  %91 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %92 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %93 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %92, i32 0)
  %94 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %91, i32 %93)
  %95 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %96 = tail call i64 @llvm.ctpop.i64(i64 %95), !range !39
  %97 = trunc i64 %96 to i32
  br label %98

98:                                               ; preds = %631, %90
  %99 = phi i32 [ %94, %90 ], [ %102, %631 ]
  %100 = phi i32 [ %88, %90 ], [ %632, %631 ]
  %101 = phi %3 addrspace(1)* [ undef, %90 ], [ %633, %631 ]
  %102 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %99) #13, !srcloc !67
  %103 = icmp eq i32 %100, 0
  br i1 %103, label %174, label %104

104:                                              ; preds = %98
  %105 = icmp eq i32 %102, 0
  br i1 %105, label %106, label %108

106:                                              ; preds = %104
  %107 = load atomic i32, i32 addrspace(1)* %46 syncscope("agent-one-as") monotonic, align 8
  br label %108

108:                                              ; preds = %106, %104
  %109 = phi i32 [ %107, %106 ], [ 0, %104 ]
  %110 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %109)
  %111 = add i32 %110, %102
  %112 = urem i32 %111, %100
  %113 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !68
  br label %114

114:                                              ; preds = %172, %108
  %115 = phi i32 [ %112, %108 ], [ %169, %172 ]
  %116 = phi i32 [ %100, %108 ], [ %170, %172 ]
  %117 = phi %3 addrspace(1)* [ %101, %108 ], [ %171, %172 ]
  %118 = icmp ugt i32 %115, 255
  br i1 %118, label %119, label %129

119:                                              ; preds = %114
  %120 = add i32 %115, -256
  %121 = lshr i32 %120, 8
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %122, i32 0
  %124 = load atomic i64, i64 addrspace(1)* %123 syncscope("agent-one-as") monotonic, align 8
  %125 = inttoptr i64 %124 to %3 addrspace(1)*
  %126 = and i32 %115, 255
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds %3, %3 addrspace(1)* %125, i64 %127
  br label %132

129:                                              ; preds = %114
  %130 = zext i32 %115 to i64
  %131 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %130
  br label %132

132:                                              ; preds = %129, %119
  %133 = phi %3 addrspace(1)* [ %128, %119 ], [ %131, %129 ]
  %134 = getelementptr inbounds %3, %3 addrspace(1)* %133, i64 0, i32 2
  %135 = load atomic i32, i32 addrspace(1)* %134 syncscope("agent-one-as") monotonic, align 8
  %136 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 %135, i32 %113, i32 36)
  %137 = icmp eq i64 %136, 0
  br i1 %137, label %143, label %138

138:                                              ; preds = %132
  %139 = tail call i64 @llvm.cttz.i64(i64 %136, i1 true), !range !39
  %140 = trunc i64 %139 to i32
  %141 = shl nuw nsw i32 %140, 2
  %142 = tail call i32 @llvm.amdgcn.ds.bpermute(i32 %141, i32 %115)
  br label %143

143:                                              ; preds = %138, %132
  %144 = phi i32 [ %142, %138 ], [ -1, %132 ]
  %145 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %144)
  %146 = icmp eq i32 %145, -1
  br i1 %146, label %162, label %147

147:                                              ; preds = %143
  %148 = icmp ugt i32 %145, 255
  br i1 %148, label %149, label %159

149:                                              ; preds = %147
  %150 = add i32 %145, -256
  %151 = lshr i32 %150, 8
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %152, i32 0
  %154 = load atomic i64, i64 addrspace(1)* %153 syncscope("agent-one-as") monotonic, align 8
  %155 = inttoptr i64 %154 to %3 addrspace(1)*
  %156 = and i32 %145, 255
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds %3, %3 addrspace(1)* %155, i64 %157
  br label %168

159:                                              ; preds = %147
  %160 = zext i32 %145 to i64
  %161 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %160
  br label %168

162:                                              ; preds = %143
  %163 = add i32 %115, %97
  %164 = urem i32 %163, %100
  br i1 %105, label %165, label %166

165:                                              ; preds = %162
  store atomic i32 %164, i32 addrspace(1)* %46 syncscope("agent-one-as") monotonic, align 8
  br label %166

166:                                              ; preds = %165, %162
  %167 = sub i32 %116, %97
  br label %168

168:                                              ; preds = %166, %159, %149
  %169 = phi i32 [ %164, %166 ], [ %115, %149 ], [ %115, %159 ]
  %170 = phi i32 [ %167, %166 ], [ %116, %149 ], [ %116, %159 ]
  %171 = phi %3 addrspace(1)* [ %117, %166 ], [ %158, %149 ], [ %161, %159 ]
  br i1 %146, label %172, label %1299

172:                                              ; preds = %168
  %173 = icmp sgt i32 %170, 0
  br i1 %173, label %114, label %174

174:                                              ; preds = %172, %98
  %175 = phi %3 addrspace(1)* [ %101, %98 ], [ %171, %172 ]
  %176 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %177 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %178 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %177, i32 0)
  %179 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %176, i32 %178)
  br label %180

180:                                              ; preds = %548, %174
  %181 = phi i32 [ %179, %174 ], [ %550, %548 ]
  %182 = phi %3 addrspace(1)* [ undef, %174 ], [ %551, %548 ]
  %183 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %181) #13, !srcloc !67
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %187

185:                                              ; preds = %180
  %186 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %187

187:                                              ; preds = %185, %180
  %188 = phi i32 [ %186, %185 ], [ 0, %180 ]
  %189 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %188)
  %190 = icmp eq i32 %189, 65792
  br i1 %190, label %548, label %191

191:                                              ; preds = %187
  br i1 %184, label %192, label %197

192:                                              ; preds = %191
  %193 = cmpxchg i32 addrspace(1)* %48, i32 0, i32 256 syncscope("agent-one-as") monotonic monotonic, align 4
  %194 = extractvalue { i32, i1 } %193, 1
  %195 = extractvalue { i32, i1 } %193, 0
  %196 = select i1 %194, i32 256, i32 %195
  br label %197

197:                                              ; preds = %192, %191
  %198 = phi i32 [ %196, %192 ], [ 0, %191 ]
  %199 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %198)
  %200 = icmp eq i32 %189, %199
  br i1 %200, label %201, label %374

201:                                              ; preds = %197
  %202 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %203 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %204 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %203, i32 0)
  %205 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %202, i32 %204)
  %206 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %205) #13, !srcloc !67
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %208, label %210

208:                                              ; preds = %201
  %209 = load atomic i32, i32 addrspace(1)* %48 syncscope("agent-one-as") monotonic, align 8
  br label %210

210:                                              ; preds = %208, %201
  %211 = phi i32 [ %209, %208 ], [ 0, %201 ]
  %212 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %211)
  %213 = icmp eq i32 %212, 65792
  br i1 %213, label %296, label %214

214:                                              ; preds = %210
  br i1 %207, label %215, label %224

215:                                              ; preds = %214
  %216 = load atomic i64, i64 addrspace(1)* %49 syncscope("agent-one-as") monotonic, align 8
  %217 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %218 = sub i64 %217, %216
  %219 = icmp ugt i64 %218, 29999
  br i1 %219, label %220, label %224

220:                                              ; preds = %215
  %221 = cmpxchg i64 addrspace(1)* %49, i64 %216, i64 %217 syncscope("agent-one-as") monotonic monotonic, align 8
  %222 = extractvalue { i64, i1 } %221, 1
  %223 = select i1 %222, i32 2, i32 1
  br label %224

224:                                              ; preds = %220, %215, %214
  %225 = phi i32 [ 1, %214 ], [ 1, %215 ], [ %223, %220 ]
  %226 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %225)
  %227 = icmp eq i32 %226, 1
  br i1 %227, label %296, label %228

228:                                              ; preds = %224
  br i1 %207, label %229, label %235

229:                                              ; preds = %228
  %230 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !32
  %231 = inttoptr i64 %230 to i8 addrspace(1)*
  %232 = addrspacecast i8 addrspace(1)* %231 to i8*
  %233 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %232, i64 noundef 0, i64 noundef 6144) #13
  %234 = extractelement <2 x i64> %233, i64 0
  br label %235

235:                                              ; preds = %229, %228
  %236 = phi i64 [ %234, %229 ], [ 0, %228 ]
  %237 = trunc i64 %236 to i32
  %238 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %237)
  %239 = insertelement <2 x i32> undef, i32 %238, i64 0
  %240 = lshr i64 %236, 32
  %241 = trunc i64 %240 to i32
  %242 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %241)
  %243 = insertelement <2 x i32> %239, i32 %242, i64 1
  %244 = bitcast <2 x i32> %243 to i64
  %245 = icmp eq i64 %244, 0
  br i1 %245, label %296, label %246

246:                                              ; preds = %235
  %247 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %248 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %249 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %248, i32 0)
  %250 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %247, i32 %249)
  %251 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %252 = tail call i64 @llvm.ctpop.i64(i64 %251), !range !39
  %253 = trunc i64 %252 to i32
  %254 = inttoptr i64 %244 to i64 addrspace(1)*
  %255 = icmp ult i32 %250, 768
  br i1 %255, label %256, label %262

256:                                              ; preds = %246, %256
  %257 = phi i32 [ %260, %256 ], [ %250, %246 ]
  %258 = zext i32 %257 to i64
  %259 = getelementptr inbounds i64, i64 addrspace(1)* %254, i64 %258
  store i64 0, i64 addrspace(1)* %259, align 8, !tbaa !32
  %260 = add i32 %257, %253
  %261 = icmp ult i32 %260, 768
  br i1 %261, label %256, label %262

262:                                              ; preds = %256, %246
  br label %263

263:                                              ; preds = %262, %295
  %264 = phi i32 [ %293, %295 ], [ %226, %262 ]
  %265 = phi i32 [ %273, %295 ], [ %212, %262 ]
  %266 = phi i32 [ %267, %295 ], [ %206, %262 ]
  %267 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %266) #13, !srcloc !67
  %268 = icmp eq i32 %267, 0
  br i1 %268, label %269, label %271

269:                                              ; preds = %263
  %270 = load atomic i32, i32 addrspace(1)* %48 syncscope("agent-one-as") monotonic, align 8
  br label %271

271:                                              ; preds = %269, %263
  %272 = phi i32 [ %270, %269 ], [ %265, %263 ]
  %273 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %272)
  %274 = icmp eq i32 %273, 65792
  br i1 %274, label %275, label %281

275:                                              ; preds = %271
  br i1 %268, label %276, label %296

276:                                              ; preds = %275
  %277 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !32
  %278 = inttoptr i64 %277 to i8 addrspace(1)*
  %279 = addrspacecast i8 addrspace(1)* %278 to i8*
  %280 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %279, i64 noundef %244, i64 noundef 0) #13
  br label %296

281:                                              ; preds = %271
  br i1 %268, label %282, label %291

282:                                              ; preds = %281
  %283 = add i32 %273, -256
  %284 = lshr i32 %283, 8
  %285 = zext i32 %284 to i64
  %286 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %285, i32 0
  %287 = cmpxchg i64 addrspace(1)* %286, i64 0, i64 %244 syncscope("agent-one-as") monotonic monotonic, align 8
  %288 = extractvalue { i64, i1 } %287, 1
  br i1 %288, label %289, label %291

289:                                              ; preds = %282
  %290 = atomicrmw add i32 addrspace(1)* %48, i32 256 syncscope("agent-one-as") release, align 4
  br label %291

291:                                              ; preds = %289, %282, %281
  %292 = phi i32 [ %264, %281 ], [ 0, %289 ], [ %264, %282 ]
  %293 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %292)
  %294 = icmp eq i32 %293, 0
  br i1 %294, label %296, label %295

295:                                              ; preds = %291
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %263

296:                                              ; preds = %291, %276, %275, %235, %224, %210
  %297 = phi i32 [ 2, %210 ], [ 1, %224 ], [ %226, %235 ], [ %264, %276 ], [ %264, %275 ], [ 0, %291 ]
  %298 = icmp eq i32 %297, 0
  br i1 %298, label %372, label %299

299:                                              ; preds = %296
  %300 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %301 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %302 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %301, i32 0)
  %303 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %300, i32 %302)
  %304 = icmp eq i32 %303, 0
  br i1 %304, label %305, label %369

305:                                              ; preds = %299
  %306 = load atomic i64, i64 addrspace(1)* %49 syncscope("agent-one-as") monotonic, align 8
  %307 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %308 = sub i64 %307, %306
  %309 = icmp ult i64 %308, 30000
  br i1 %309, label %310, label %369

310:                                              ; preds = %305
  %311 = trunc i64 %308 to i32
  %312 = sub nuw nsw i32 30000, %311
  %313 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %314 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %312)
  %315 = sext i32 %314 to i64
  %316 = add i64 %313, %315
  %317 = add i64 %313, 1625
  %318 = icmp ugt i64 %316, %317
  br i1 %318, label %323, label %319

319:                                              ; preds = %323, %310
  %320 = phi i64 [ %313, %310 ], [ %324, %323 ]
  %321 = add i64 %320, 806
  %322 = icmp ugt i64 %316, %321
  br i1 %322, label %331, label %327

323:                                              ; preds = %310, %323
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %324 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %325 = add i64 %324, 1625
  %326 = icmp ugt i64 %316, %325
  br i1 %326, label %323, label %319

327:                                              ; preds = %331, %319
  %328 = phi i64 [ %320, %319 ], [ %332, %331 ]
  %329 = add i64 %328, 396
  %330 = icmp ugt i64 %316, %329
  br i1 %330, label %335, label %339

331:                                              ; preds = %319, %331
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %332 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %333 = add i64 %332, 806
  %334 = icmp ugt i64 %316, %333
  br i1 %334, label %331, label %327

335:                                              ; preds = %327, %335
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %336 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %337 = add i64 %336, 396
  %338 = icmp ugt i64 %316, %337
  br i1 %338, label %335, label %339

339:                                              ; preds = %335, %327
  %340 = phi i64 [ %328, %327 ], [ %336, %335 ]
  %341 = add i64 %340, 192
  %342 = icmp ugt i64 %316, %341
  br i1 %342, label %347, label %343

343:                                              ; preds = %347, %339
  %344 = phi i64 [ %340, %339 ], [ %348, %347 ]
  %345 = add i64 %344, 89
  %346 = icmp ugt i64 %316, %345
  br i1 %346, label %355, label %351

347:                                              ; preds = %339, %347
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %348 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %349 = add i64 %348, 192
  %350 = icmp ugt i64 %316, %349
  br i1 %350, label %347, label %343

351:                                              ; preds = %355, %343
  %352 = phi i64 [ %344, %343 ], [ %356, %355 ]
  %353 = add i64 %352, 38
  %354 = icmp ugt i64 %316, %353
  br i1 %354, label %362, label %359

355:                                              ; preds = %343, %355
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %356 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %357 = add i64 %356, 89
  %358 = icmp ugt i64 %316, %357
  br i1 %358, label %355, label %351

359:                                              ; preds = %362, %351
  %360 = phi i64 [ %352, %351 ], [ %363, %362 ]
  %361 = icmp ugt i64 %316, %360
  br i1 %361, label %366, label %369

362:                                              ; preds = %351, %362
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %363 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %364 = add i64 %363, 38
  %365 = icmp ugt i64 %316, %364
  br i1 %365, label %362, label %359

366:                                              ; preds = %359, %366
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %367 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %368 = icmp ugt i64 %316, %367
  br i1 %368, label %366, label %369

369:                                              ; preds = %366, %359, %305, %299
  %370 = icmp eq i32 %297, 2
  %371 = select i1 %370, %3 addrspace(1)* null, %3 addrspace(1)* inttoptr (i64 1 to %3 addrspace(1)*)
  br label %372

372:                                              ; preds = %369, %296
  %373 = phi %3 addrspace(1)* [ %371, %369 ], [ %182, %296 ]
  br i1 %298, label %374, label %548

374:                                              ; preds = %372, %197
  %375 = phi %3 addrspace(1)* [ %373, %372 ], [ %182, %197 ]
  br i1 %184, label %376, label %385

376:                                              ; preds = %374
  %377 = load atomic i64, i64 addrspace(1)* %50 syncscope("agent-one-as") monotonic, align 8
  %378 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %379 = sub i64 %378, %377
  %380 = icmp ugt i64 %379, 19999
  br i1 %380, label %381, label %385

381:                                              ; preds = %376
  %382 = cmpxchg i64 addrspace(1)* %50, i64 %377, i64 %378 syncscope("agent-one-as") monotonic monotonic, align 8
  %383 = extractvalue { i64, i1 } %382, 1
  %384 = select i1 %383, i8 addrspace(1)* null, i8 addrspace(1)* inttoptr (i64 1 to i8 addrspace(1)*)
  br label %385

385:                                              ; preds = %381, %376, %374
  %386 = phi i8 addrspace(1)* [ inttoptr (i64 1 to i8 addrspace(1)*), %374 ], [ inttoptr (i64 1 to i8 addrspace(1)*), %376 ], [ %384, %381 ]
  %387 = ptrtoint i8 addrspace(1)* %386 to i64
  %388 = trunc i64 %387 to i32
  %389 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %388)
  %390 = insertelement <2 x i32> undef, i32 %389, i64 0
  %391 = lshr i64 %387, 32
  %392 = trunc i64 %391 to i32
  %393 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %392)
  %394 = insertelement <2 x i32> %390, i32 %393, i64 1
  %395 = bitcast <2 x i32> %394 to i64
  %396 = icmp eq i64 %395, 0
  br i1 %396, label %399, label %397

397:                                              ; preds = %385
  %398 = inttoptr i64 %395 to %3 addrspace(1)*
  br label %548

399:                                              ; preds = %385
  br i1 %184, label %400, label %413

400:                                              ; preds = %399
  %401 = load atomic i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6) syncscope("agent-one-as") monotonic, align 8
  %402 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !69
  %403 = icmp ult i64 %401, %402
  br i1 %403, label %404, label %407

404:                                              ; preds = %400
  %405 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %406 = icmp ult i64 %405, %402
  br i1 %406, label %413, label %407

407:                                              ; preds = %404, %400
  %408 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !32
  %409 = inttoptr i64 %408 to i8 addrspace(1)*
  %410 = addrspacecast i8 addrspace(1)* %409 to i8*
  %411 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %410, i64 noundef 0, i64 noundef 2097152) #13
  %412 = extractelement <2 x i64> %411, i64 0
  br label %413

413:                                              ; preds = %407, %404, %399
  %414 = phi i64 [ 0, %399 ], [ %412, %407 ], [ %405, %404 ]
  %415 = trunc i64 %414 to i32
  %416 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %415)
  %417 = insertelement <2 x i32> undef, i32 %416, i64 0
  %418 = lshr i64 %414, 32
  %419 = trunc i64 %418 to i32
  %420 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %419)
  %421 = insertelement <2 x i32> %417, i32 %420, i64 1
  %422 = bitcast <2 x i32> %421 to i64
  %423 = icmp eq i64 %422, 0
  br i1 %423, label %548, label %424

424:                                              ; preds = %413
  %425 = inttoptr i64 %422 to %5 addrspace(1)*
  %426 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %427 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %428 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %427, i32 0)
  %429 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %426, i32 %428)
  %430 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %429) #13, !srcloc !67
  %431 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %432 = tail call i64 @llvm.ctpop.i64(i64 %431), !range !39
  %433 = trunc i64 %432 to i32
  %434 = load i32, i32 addrspace(4)* %51, align 4, !tbaa !71
  %435 = load i32, i32 addrspace(4)* %52, align 4, !tbaa !72
  %436 = add i32 %435, 31
  %437 = lshr i32 %436, 5
  br i1 %55, label %461, label %438

438:                                              ; preds = %424
  %439 = icmp ult i32 %430, %437
  br i1 %439, label %446, label %440

440:                                              ; preds = %446, %438
  %441 = mul i32 %434, %433
  %442 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !73
  %443 = mul i32 %434, %430
  %444 = add i32 %442, %443
  %445 = icmp ult i32 %444, %435
  br i1 %445, label %452, label %470

446:                                              ; preds = %438, %446
  %447 = phi i32 [ %450, %446 ], [ %430, %438 ]
  %448 = zext i32 %447 to i64
  %449 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %448
  store i32 0, i32 addrspace(1)* %449, align 4, !tbaa !50
  %450 = add i32 %447, %433
  %451 = icmp ult i32 %450, %437
  br i1 %451, label %446, label %440

452:                                              ; preds = %440, %452
  %453 = phi i32 [ %459, %452 ], [ %444, %440 ]
  %454 = and i32 %453, 31
  %455 = shl nuw i32 1, %454
  %456 = lshr i32 %453, 5
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %457
  store i32 %455, i32 addrspace(1)* %458, align 4, !tbaa !50
  %459 = add i32 %453, %441
  %460 = icmp ult i32 %459, %435
  br i1 %460, label %452, label %470

461:                                              ; preds = %424
  %462 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !74
  %463 = icmp ult i32 %430, %437
  br i1 %463, label %464, label %470

464:                                              ; preds = %461, %464
  %465 = phi i32 [ %468, %464 ], [ %430, %461 ]
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %466
  store i32 %462, i32 addrspace(1)* %467, align 4, !tbaa !50
  %468 = add i32 %465, %433
  %469 = icmp ult i32 %468, %437
  br i1 %469, label %464, label %470

470:                                              ; preds = %452, %464, %461, %440
  %471 = icmp eq i32 %430, 0
  br i1 %471, label %472, label %483

472:                                              ; preds = %470
  br i1 %58, label %481, label %473

473:                                              ; preds = %472
  %474 = and i32 %435, 31
  %475 = shl nsw i32 -1, %474
  %476 = add nsw i32 %437, -1
  %477 = zext i32 %476 to i64
  %478 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %477
  %479 = load i32, i32 addrspace(1)* %478, align 4, !tbaa !50
  %480 = or i32 %479, %475
  store i32 %480, i32 addrspace(1)* %478, align 4, !tbaa !50
  br label %481

481:                                              ; preds = %473, %472
  %482 = inttoptr i64 %422 to <4 x i32> addrspace(1)*
  store <4 x i32> %59, <4 x i32> addrspace(1)* %482, align 16, !tbaa !65
  br label %483

483:                                              ; preds = %481, %470
  %484 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 1
  br label %485

485:                                              ; preds = %547, %483
  %486 = phi i32 [ %199, %483 ], [ %502, %547 ]
  %487 = phi i32 [ %189, %483 ], [ %495, %547 ]
  %488 = phi i32 [ %183, %483 ], [ %489, %547 ]
  %489 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %488) #13, !srcloc !67
  %490 = icmp eq i32 %489, 0
  br i1 %490, label %491, label %493

491:                                              ; preds = %485
  %492 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %493

493:                                              ; preds = %491, %485
  %494 = phi i32 [ %492, %491 ], [ %487, %485 ]
  %495 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %494)
  %496 = icmp eq i32 %495, 65792
  br i1 %496, label %548, label %497

497:                                              ; preds = %493
  br i1 %490, label %498, label %500

498:                                              ; preds = %497
  %499 = load atomic i32, i32 addrspace(1)* %48 syncscope("agent-one-as") monotonic, align 8
  br label %500

500:                                              ; preds = %498, %497
  %501 = phi i32 [ %499, %498 ], [ %486, %497 ]
  %502 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %501)
  %503 = icmp eq i32 %495, %502
  br i1 %503, label %504, label %510

504:                                              ; preds = %500
  br i1 %490, label %505, label %548

505:                                              ; preds = %504
  %506 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !32
  %507 = inttoptr i64 %506 to i8 addrspace(1)*
  %508 = addrspacecast i8 addrspace(1)* %507 to i8*
  %509 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %508, i64 noundef %422, i64 noundef 0) #13
  br label %548

510:                                              ; preds = %500
  br i1 %490, label %511, label %533

511:                                              ; preds = %510
  %512 = icmp ugt i32 %495, 255
  br i1 %512, label %513, label %523

513:                                              ; preds = %511
  %514 = add i32 %495, -256
  %515 = lshr i32 %514, 8
  %516 = zext i32 %515 to i64
  %517 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %516, i32 0
  %518 = load atomic i64, i64 addrspace(1)* %517 syncscope("agent-one-as") monotonic, align 8
  %519 = inttoptr i64 %518 to %3 addrspace(1)*
  %520 = and i32 %495, 255
  %521 = zext i32 %520 to i64
  %522 = getelementptr inbounds %3, %3 addrspace(1)* %519, i64 %521
  br label %526

523:                                              ; preds = %511
  %524 = zext i32 %495 to i64
  %525 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %524
  br label %526

526:                                              ; preds = %523, %513
  %527 = phi %3 addrspace(1)* [ %522, %513 ], [ %525, %523 ]
  store i32 %495, i32 addrspace(1)* %484, align 4, !tbaa !43
  %528 = getelementptr inbounds %3, %3 addrspace(1)* %527, i64 0, i32 1
  %529 = cmpxchg i64 addrspace(1)* %528, i64 0, i64 %422 syncscope("agent-one-as") monotonic monotonic, align 8
  %530 = extractvalue { i64, i1 } %529, 1
  br i1 %530, label %531, label %533

531:                                              ; preds = %526
  %532 = atomicrmw add i32 addrspace(1)* %45, i32 1 syncscope("agent-one-as") release, align 4
  br label %533

533:                                              ; preds = %531, %526, %510
  %534 = phi %3 addrspace(1)* [ null, %510 ], [ %527, %531 ], [ null, %526 ]
  %535 = ptrtoint %3 addrspace(1)* %534 to i64
  %536 = trunc i64 %535 to i32
  %537 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %536)
  %538 = insertelement <2 x i32> undef, i32 %537, i64 0
  %539 = lshr i64 %535, 32
  %540 = trunc i64 %539 to i32
  %541 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %540)
  %542 = insertelement <2 x i32> %538, i32 %541, i64 1
  %543 = bitcast <2 x i32> %542 to i64
  %544 = icmp eq i64 %543, 0
  br i1 %544, label %547, label %545

545:                                              ; preds = %533
  %546 = inttoptr i64 %543 to %3 addrspace(1)*
  br label %548

547:                                              ; preds = %533
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %485

548:                                              ; preds = %493, %545, %505, %504, %413, %397, %372, %187
  %549 = phi i1 [ false, %397 ], [ true, %505 ], [ true, %504 ], [ false, %413 ], [ false, %545 ], [ false, %187 ], [ false, %372 ], [ false, %493 ]
  %550 = phi i32 [ %183, %397 ], [ 0, %505 ], [ %489, %504 ], [ %183, %413 ], [ %489, %545 ], [ %183, %187 ], [ %183, %372 ], [ %489, %493 ]
  %551 = phi %3 addrspace(1)* [ %398, %397 ], [ %375, %505 ], [ %375, %504 ], [ null, %413 ], [ %546, %545 ], [ null, %187 ], [ %373, %372 ], [ null, %493 ]
  br i1 %549, label %180, label %552

552:                                              ; preds = %548
  %553 = icmp eq %3 addrspace(1)* %551, inttoptr (i64 1 to %3 addrspace(1)*)
  br i1 %553, label %554, label %631

554:                                              ; preds = %552
  %555 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %556 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %557 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %556, i32 0)
  %558 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %555, i32 %557)
  %559 = icmp eq i32 %558, 0
  br i1 %559, label %560, label %624

560:                                              ; preds = %554
  %561 = load atomic i64, i64 addrspace(1)* %50 syncscope("agent-one-as") monotonic, align 8
  %562 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %563 = sub i64 %562, %561
  %564 = icmp ult i64 %563, 20000
  br i1 %564, label %565, label %624

565:                                              ; preds = %560
  %566 = trunc i64 %563 to i32
  %567 = sub nuw nsw i32 20000, %566
  %568 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %569 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %567)
  %570 = sext i32 %569 to i64
  %571 = add i64 %568, %570
  %572 = add i64 %568, 1625
  %573 = icmp ugt i64 %571, %572
  br i1 %573, label %578, label %574

574:                                              ; preds = %578, %565
  %575 = phi i64 [ %568, %565 ], [ %579, %578 ]
  %576 = add i64 %575, 806
  %577 = icmp ugt i64 %571, %576
  br i1 %577, label %586, label %582

578:                                              ; preds = %565, %578
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %579 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %580 = add i64 %579, 1625
  %581 = icmp ugt i64 %571, %580
  br i1 %581, label %578, label %574

582:                                              ; preds = %586, %574
  %583 = phi i64 [ %575, %574 ], [ %587, %586 ]
  %584 = add i64 %583, 396
  %585 = icmp ugt i64 %571, %584
  br i1 %585, label %590, label %594

586:                                              ; preds = %574, %586
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %587 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %588 = add i64 %587, 806
  %589 = icmp ugt i64 %571, %588
  br i1 %589, label %586, label %582

590:                                              ; preds = %582, %590
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %591 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %592 = add i64 %591, 396
  %593 = icmp ugt i64 %571, %592
  br i1 %593, label %590, label %594

594:                                              ; preds = %590, %582
  %595 = phi i64 [ %583, %582 ], [ %591, %590 ]
  %596 = add i64 %595, 192
  %597 = icmp ugt i64 %571, %596
  br i1 %597, label %602, label %598

598:                                              ; preds = %602, %594
  %599 = phi i64 [ %595, %594 ], [ %603, %602 ]
  %600 = add i64 %599, 89
  %601 = icmp ugt i64 %571, %600
  br i1 %601, label %610, label %606

602:                                              ; preds = %594, %602
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %603 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %604 = add i64 %603, 192
  %605 = icmp ugt i64 %571, %604
  br i1 %605, label %602, label %598

606:                                              ; preds = %610, %598
  %607 = phi i64 [ %599, %598 ], [ %611, %610 ]
  %608 = add i64 %607, 38
  %609 = icmp ugt i64 %571, %608
  br i1 %609, label %617, label %614

610:                                              ; preds = %598, %610
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %611 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %612 = add i64 %611, 89
  %613 = icmp ugt i64 %571, %612
  br i1 %613, label %610, label %606

614:                                              ; preds = %617, %606
  %615 = phi i64 [ %607, %606 ], [ %618, %617 ]
  %616 = icmp ugt i64 %571, %615
  br i1 %616, label %621, label %624

617:                                              ; preds = %606, %617
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %618 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %619 = add i64 %618, 38
  %620 = icmp ugt i64 %571, %619
  br i1 %620, label %617, label %614

621:                                              ; preds = %614, %621
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %622 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %623 = icmp ugt i64 %571, %622
  br i1 %623, label %621, label %624

624:                                              ; preds = %621, %614, %560, %554
  %625 = icmp eq i32 %102, 0
  br i1 %625, label %626, label %628

626:                                              ; preds = %624
  %627 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %628

628:                                              ; preds = %626, %624
  %629 = phi i32 [ %627, %626 ], [ %100, %624 ]
  %630 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %629)
  br label %631

631:                                              ; preds = %628, %552
  %632 = phi i32 [ %630, %628 ], [ %100, %552 ]
  %633 = phi %3 addrspace(1)* [ %175, %628 ], [ %551, %552 ]
  br i1 %553, label %98, label %1299

634:                                              ; preds = %86
  %635 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %636 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %637 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %636, i32 0)
  %638 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %635, i32 %637)
  %639 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %640 = tail call i64 @llvm.ctpop.i64(i64 %639), !range !39
  %641 = trunc i64 %640 to i32
  br label %642

642:                                              ; preds = %1295, %634
  %643 = phi i32 [ %43, %634 ], [ %1297, %1295 ]
  %644 = phi i32 [ %638, %634 ], [ %646, %1295 ]
  %645 = phi %3 addrspace(1)* [ undef, %634 ], [ %1298, %1295 ]
  %646 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %644) #13, !srcloc !67
  %647 = zext i32 %643 to i64
  %648 = icmp eq i32 %646, 0
  br i1 %648, label %649, label %652

649:                                              ; preds = %642
  %650 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %647, i32 0
  %651 = load atomic i32, i32 addrspace(1)* %650 syncscope("agent-one-as") monotonic, align 8
  br label %652

652:                                              ; preds = %649, %642
  %653 = phi i32 [ %651, %649 ], [ 0, %642 ]
  %654 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %653)
  %655 = add i32 %654, %646
  %656 = urem i32 %655, 65792
  %657 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %647, i32 1
  %658 = load i32, i32 addrspace(4)* %657, align 4, !tbaa !75
  %659 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %647, i32 0
  br label %660

660:                                              ; preds = %718, %652
  %661 = phi i32 [ %656, %652 ], [ %715, %718 ]
  %662 = phi i32 [ 65792, %652 ], [ %716, %718 ]
  %663 = phi %3 addrspace(1)* [ %645, %652 ], [ %717, %718 ]
  %664 = icmp ugt i32 %661, 255
  br i1 %664, label %665, label %675

665:                                              ; preds = %660
  %666 = add i32 %661, -256
  %667 = lshr i32 %666, 8
  %668 = zext i32 %667 to i64
  %669 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %668, i32 0
  %670 = load atomic i64, i64 addrspace(1)* %669 syncscope("agent-one-as") monotonic, align 8
  %671 = inttoptr i64 %670 to %3 addrspace(1)*
  %672 = and i32 %661, 255
  %673 = zext i32 %672 to i64
  %674 = getelementptr inbounds %3, %3 addrspace(1)* %671, i64 %673
  br label %678

675:                                              ; preds = %660
  %676 = zext i32 %661 to i64
  %677 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %676
  br label %678

678:                                              ; preds = %675, %665
  %679 = phi %3 addrspace(1)* [ %674, %665 ], [ %677, %675 ]
  %680 = getelementptr inbounds %3, %3 addrspace(1)* %679, i64 0, i32 2
  %681 = load atomic i32, i32 addrspace(1)* %680 syncscope("agent-one-as") monotonic, align 8
  %682 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 %681, i32 %658, i32 36)
  %683 = icmp eq i64 %682, 0
  br i1 %683, label %689, label %684

684:                                              ; preds = %678
  %685 = tail call i64 @llvm.cttz.i64(i64 %682, i1 true), !range !39
  %686 = trunc i64 %685 to i32
  %687 = shl nuw nsw i32 %686, 2
  %688 = tail call i32 @llvm.amdgcn.ds.bpermute(i32 %687, i32 %661)
  br label %689

689:                                              ; preds = %684, %678
  %690 = phi i32 [ %688, %684 ], [ -1, %678 ]
  %691 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %690)
  %692 = icmp eq i32 %691, -1
  br i1 %692, label %708, label %693

693:                                              ; preds = %689
  %694 = icmp ugt i32 %691, 255
  br i1 %694, label %695, label %705

695:                                              ; preds = %693
  %696 = add i32 %691, -256
  %697 = lshr i32 %696, 8
  %698 = zext i32 %697 to i64
  %699 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %698, i32 0
  %700 = load atomic i64, i64 addrspace(1)* %699 syncscope("agent-one-as") monotonic, align 8
  %701 = inttoptr i64 %700 to %3 addrspace(1)*
  %702 = and i32 %691, 255
  %703 = zext i32 %702 to i64
  %704 = getelementptr inbounds %3, %3 addrspace(1)* %701, i64 %703
  br label %714

705:                                              ; preds = %693
  %706 = zext i32 %691 to i64
  %707 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %706
  br label %714

708:                                              ; preds = %689
  %709 = add i32 %661, %641
  %710 = urem i32 %709, 65792
  br i1 %648, label %711, label %712

711:                                              ; preds = %708
  store atomic i32 %710, i32 addrspace(1)* %659 syncscope("agent-one-as") monotonic, align 8
  br label %712

712:                                              ; preds = %711, %708
  %713 = sub i32 %662, %641
  br label %714

714:                                              ; preds = %712, %705, %695
  %715 = phi i32 [ %710, %712 ], [ %661, %695 ], [ %661, %705 ]
  %716 = phi i32 [ %713, %712 ], [ %662, %695 ], [ %662, %705 ]
  %717 = phi %3 addrspace(1)* [ %663, %712 ], [ %704, %695 ], [ %707, %705 ]
  br i1 %692, label %718, label %1295

718:                                              ; preds = %714
  %719 = icmp sgt i32 %716, 0
  br i1 %719, label %660, label %720

720:                                              ; preds = %718
  %721 = and i32 %643, -2
  %722 = add i32 %721, 2
  %723 = icmp ne i32 %643, %43
  %724 = icmp ugt i32 %722, 15
  %725 = select i1 %723, i1 true, i1 %724
  br i1 %725, label %1295, label %726

726:                                              ; preds = %720
  br i1 %648, label %727, label %731

727:                                              ; preds = %726
  %728 = zext i32 %722 to i64
  %729 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 1, i64 %728, i32 0
  %730 = load atomic i32, i32 addrspace(1)* %729 syncscope("agent-one-as") monotonic, align 8
  br label %731

731:                                              ; preds = %727, %726
  %732 = phi i32 [ %730, %727 ], [ 0, %726 ]
  %733 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %732)
  %734 = icmp ult i32 %733, 65792
  br i1 %734, label %735, label %1295

735:                                              ; preds = %731
  %736 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %737 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %738 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %737, i32 0)
  %739 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %736, i32 %738)
  %740 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %741 = tail call i64 @llvm.ctpop.i64(i64 %740), !range !39
  %742 = trunc i64 %741 to i32
  %743 = zext i32 %722 to i64
  %744 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %743, i32 0
  %745 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 2
  %746 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 1, i64 %743, i32 0
  %747 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 2, i64 %743, i32 0
  %748 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 4, i64 %743, i32 0
  %749 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 3, i64 %743, i32 0
  %750 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 5
  %751 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 0
  %752 = lshr i64 191, %743
  %753 = and i64 %752, 1
  %754 = icmp eq i64 %753, 0
  %755 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 4
  %756 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 6
  %757 = icmp eq i32 %721, 0
  %758 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %722, i64 0
  br label %759

759:                                              ; preds = %1292, %735
  %760 = phi i32 [ %739, %735 ], [ %763, %1292 ]
  %761 = phi i32 [ %733, %735 ], [ %1293, %1292 ]
  %762 = phi %3 addrspace(1)* [ undef, %735 ], [ %1294, %1292 ]
  %763 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %760) #13, !srcloc !67
  %764 = icmp eq i32 %761, 0
  br i1 %764, label %835, label %765

765:                                              ; preds = %759
  %766 = icmp eq i32 %763, 0
  br i1 %766, label %767, label %769

767:                                              ; preds = %765
  %768 = load atomic i32, i32 addrspace(1)* %744 syncscope("agent-one-as") monotonic, align 8
  br label %769

769:                                              ; preds = %767, %765
  %770 = phi i32 [ %768, %767 ], [ 0, %765 ]
  %771 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %770)
  %772 = add i32 %771, %763
  %773 = urem i32 %772, %761
  %774 = load i32, i32 addrspace(4)* %745, align 4, !tbaa !68
  br label %775

775:                                              ; preds = %833, %769
  %776 = phi i32 [ %773, %769 ], [ %830, %833 ]
  %777 = phi i32 [ %761, %769 ], [ %831, %833 ]
  %778 = phi %3 addrspace(1)* [ %762, %769 ], [ %832, %833 ]
  %779 = icmp ugt i32 %776, 255
  br i1 %779, label %780, label %790

780:                                              ; preds = %775
  %781 = add i32 %776, -256
  %782 = lshr i32 %781, 8
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %783, i32 0
  %785 = load atomic i64, i64 addrspace(1)* %784 syncscope("agent-one-as") monotonic, align 8
  %786 = inttoptr i64 %785 to %3 addrspace(1)*
  %787 = and i32 %776, 255
  %788 = zext i32 %787 to i64
  %789 = getelementptr inbounds %3, %3 addrspace(1)* %786, i64 %788
  br label %793

790:                                              ; preds = %775
  %791 = zext i32 %776 to i64
  %792 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %791
  br label %793

793:                                              ; preds = %790, %780
  %794 = phi %3 addrspace(1)* [ %789, %780 ], [ %792, %790 ]
  %795 = getelementptr inbounds %3, %3 addrspace(1)* %794, i64 0, i32 2
  %796 = load atomic i32, i32 addrspace(1)* %795 syncscope("agent-one-as") monotonic, align 8
  %797 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 %796, i32 %774, i32 36)
  %798 = icmp eq i64 %797, 0
  br i1 %798, label %804, label %799

799:                                              ; preds = %793
  %800 = tail call i64 @llvm.cttz.i64(i64 %797, i1 true), !range !39
  %801 = trunc i64 %800 to i32
  %802 = shl nuw nsw i32 %801, 2
  %803 = tail call i32 @llvm.amdgcn.ds.bpermute(i32 %802, i32 %776)
  br label %804

804:                                              ; preds = %799, %793
  %805 = phi i32 [ %803, %799 ], [ -1, %793 ]
  %806 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %805)
  %807 = icmp eq i32 %806, -1
  br i1 %807, label %823, label %808

808:                                              ; preds = %804
  %809 = icmp ugt i32 %806, 255
  br i1 %809, label %810, label %820

810:                                              ; preds = %808
  %811 = add i32 %806, -256
  %812 = lshr i32 %811, 8
  %813 = zext i32 %812 to i64
  %814 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %813, i32 0
  %815 = load atomic i64, i64 addrspace(1)* %814 syncscope("agent-one-as") monotonic, align 8
  %816 = inttoptr i64 %815 to %3 addrspace(1)*
  %817 = and i32 %806, 255
  %818 = zext i32 %817 to i64
  %819 = getelementptr inbounds %3, %3 addrspace(1)* %816, i64 %818
  br label %829

820:                                              ; preds = %808
  %821 = zext i32 %806 to i64
  %822 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %821
  br label %829

823:                                              ; preds = %804
  %824 = add i32 %776, %742
  %825 = urem i32 %824, %761
  br i1 %766, label %826, label %827

826:                                              ; preds = %823
  store atomic i32 %825, i32 addrspace(1)* %744 syncscope("agent-one-as") monotonic, align 8
  br label %827

827:                                              ; preds = %826, %823
  %828 = sub i32 %777, %742
  br label %829

829:                                              ; preds = %827, %820, %810
  %830 = phi i32 [ %825, %827 ], [ %776, %810 ], [ %776, %820 ]
  %831 = phi i32 [ %828, %827 ], [ %777, %810 ], [ %777, %820 ]
  %832 = phi %3 addrspace(1)* [ %778, %827 ], [ %819, %810 ], [ %822, %820 ]
  br i1 %807, label %833, label %1295

833:                                              ; preds = %829
  %834 = icmp sgt i32 %831, 0
  br i1 %834, label %775, label %835

835:                                              ; preds = %833, %759
  %836 = phi %3 addrspace(1)* [ %762, %759 ], [ %832, %833 ]
  %837 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %838 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %839 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %838, i32 0)
  %840 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %837, i32 %839)
  br label %841

841:                                              ; preds = %1209, %835
  %842 = phi i32 [ %840, %835 ], [ %1211, %1209 ]
  %843 = phi %3 addrspace(1)* [ undef, %835 ], [ %1212, %1209 ]
  %844 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %842) #13, !srcloc !67
  %845 = icmp eq i32 %844, 0
  br i1 %845, label %846, label %848

846:                                              ; preds = %841
  %847 = load atomic i32, i32 addrspace(1)* %746 syncscope("agent-one-as") monotonic, align 8
  br label %848

848:                                              ; preds = %846, %841
  %849 = phi i32 [ %847, %846 ], [ 0, %841 ]
  %850 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %849)
  %851 = icmp eq i32 %850, 65792
  br i1 %851, label %1209, label %852

852:                                              ; preds = %848
  br i1 %845, label %853, label %858

853:                                              ; preds = %852
  %854 = cmpxchg i32 addrspace(1)* %747, i32 0, i32 256 syncscope("agent-one-as") monotonic monotonic, align 4
  %855 = extractvalue { i32, i1 } %854, 1
  %856 = extractvalue { i32, i1 } %854, 0
  %857 = select i1 %855, i32 256, i32 %856
  br label %858

858:                                              ; preds = %853, %852
  %859 = phi i32 [ %857, %853 ], [ 0, %852 ]
  %860 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %859)
  %861 = icmp eq i32 %850, %860
  br i1 %861, label %862, label %1035

862:                                              ; preds = %858
  %863 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %864 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %865 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %864, i32 0)
  %866 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %863, i32 %865)
  %867 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %866) #13, !srcloc !67
  %868 = icmp eq i32 %867, 0
  br i1 %868, label %869, label %871

869:                                              ; preds = %862
  %870 = load atomic i32, i32 addrspace(1)* %747 syncscope("agent-one-as") monotonic, align 8
  br label %871

871:                                              ; preds = %869, %862
  %872 = phi i32 [ %870, %869 ], [ 0, %862 ]
  %873 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %872)
  %874 = icmp eq i32 %873, 65792
  br i1 %874, label %957, label %875

875:                                              ; preds = %871
  br i1 %868, label %876, label %885

876:                                              ; preds = %875
  %877 = load atomic i64, i64 addrspace(1)* %748 syncscope("agent-one-as") monotonic, align 8
  %878 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %879 = sub i64 %878, %877
  %880 = icmp ugt i64 %879, 29999
  br i1 %880, label %881, label %885

881:                                              ; preds = %876
  %882 = cmpxchg i64 addrspace(1)* %748, i64 %877, i64 %878 syncscope("agent-one-as") monotonic monotonic, align 8
  %883 = extractvalue { i64, i1 } %882, 1
  %884 = select i1 %883, i32 2, i32 1
  br label %885

885:                                              ; preds = %881, %876, %875
  %886 = phi i32 [ 1, %875 ], [ 1, %876 ], [ %884, %881 ]
  %887 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %886)
  %888 = icmp eq i32 %887, 1
  br i1 %888, label %957, label %889

889:                                              ; preds = %885
  br i1 %868, label %890, label %896

890:                                              ; preds = %889
  %891 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !32
  %892 = inttoptr i64 %891 to i8 addrspace(1)*
  %893 = addrspacecast i8 addrspace(1)* %892 to i8*
  %894 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %893, i64 noundef 0, i64 noundef 6144) #13
  %895 = extractelement <2 x i64> %894, i64 0
  br label %896

896:                                              ; preds = %890, %889
  %897 = phi i64 [ %895, %890 ], [ 0, %889 ]
  %898 = trunc i64 %897 to i32
  %899 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %898)
  %900 = insertelement <2 x i32> undef, i32 %899, i64 0
  %901 = lshr i64 %897, 32
  %902 = trunc i64 %901 to i32
  %903 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %902)
  %904 = insertelement <2 x i32> %900, i32 %903, i64 1
  %905 = bitcast <2 x i32> %904 to i64
  %906 = icmp eq i64 %905, 0
  br i1 %906, label %957, label %907

907:                                              ; preds = %896
  %908 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %909 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %910 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %909, i32 0)
  %911 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %908, i32 %910)
  %912 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %913 = tail call i64 @llvm.ctpop.i64(i64 %912), !range !39
  %914 = trunc i64 %913 to i32
  %915 = inttoptr i64 %905 to i64 addrspace(1)*
  %916 = icmp ult i32 %911, 768
  br i1 %916, label %917, label %923

917:                                              ; preds = %907, %917
  %918 = phi i32 [ %921, %917 ], [ %911, %907 ]
  %919 = zext i32 %918 to i64
  %920 = getelementptr inbounds i64, i64 addrspace(1)* %915, i64 %919
  store i64 0, i64 addrspace(1)* %920, align 8, !tbaa !32
  %921 = add i32 %918, %914
  %922 = icmp ult i32 %921, 768
  br i1 %922, label %917, label %923

923:                                              ; preds = %917, %907
  br label %924

924:                                              ; preds = %923, %956
  %925 = phi i32 [ %954, %956 ], [ %887, %923 ]
  %926 = phi i32 [ %934, %956 ], [ %873, %923 ]
  %927 = phi i32 [ %928, %956 ], [ %867, %923 ]
  %928 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %927) #13, !srcloc !67
  %929 = icmp eq i32 %928, 0
  br i1 %929, label %930, label %932

930:                                              ; preds = %924
  %931 = load atomic i32, i32 addrspace(1)* %747 syncscope("agent-one-as") monotonic, align 8
  br label %932

932:                                              ; preds = %930, %924
  %933 = phi i32 [ %931, %930 ], [ %926, %924 ]
  %934 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %933)
  %935 = icmp eq i32 %934, 65792
  br i1 %935, label %936, label %942

936:                                              ; preds = %932
  br i1 %929, label %937, label %957

937:                                              ; preds = %936
  %938 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !32
  %939 = inttoptr i64 %938 to i8 addrspace(1)*
  %940 = addrspacecast i8 addrspace(1)* %939 to i8*
  %941 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %940, i64 noundef %905, i64 noundef 0) #13
  br label %957

942:                                              ; preds = %932
  br i1 %929, label %943, label %952

943:                                              ; preds = %942
  %944 = add i32 %934, -256
  %945 = lshr i32 %944, 8
  %946 = zext i32 %945 to i64
  %947 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %946, i32 0
  %948 = cmpxchg i64 addrspace(1)* %947, i64 0, i64 %905 syncscope("agent-one-as") monotonic monotonic, align 8
  %949 = extractvalue { i64, i1 } %948, 1
  br i1 %949, label %950, label %952

950:                                              ; preds = %943
  %951 = atomicrmw add i32 addrspace(1)* %747, i32 256 syncscope("agent-one-as") release, align 4
  br label %952

952:                                              ; preds = %950, %943, %942
  %953 = phi i32 [ %925, %942 ], [ 0, %950 ], [ %925, %943 ]
  %954 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %953)
  %955 = icmp eq i32 %954, 0
  br i1 %955, label %957, label %956

956:                                              ; preds = %952
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %924

957:                                              ; preds = %952, %937, %936, %896, %885, %871
  %958 = phi i32 [ 2, %871 ], [ 1, %885 ], [ %887, %896 ], [ %925, %937 ], [ %925, %936 ], [ 0, %952 ]
  %959 = icmp eq i32 %958, 0
  br i1 %959, label %1033, label %960

960:                                              ; preds = %957
  %961 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %962 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %963 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %962, i32 0)
  %964 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %961, i32 %963)
  %965 = icmp eq i32 %964, 0
  br i1 %965, label %966, label %1030

966:                                              ; preds = %960
  %967 = load atomic i64, i64 addrspace(1)* %748 syncscope("agent-one-as") monotonic, align 8
  %968 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %969 = sub i64 %968, %967
  %970 = icmp ult i64 %969, 30000
  br i1 %970, label %971, label %1030

971:                                              ; preds = %966
  %972 = trunc i64 %969 to i32
  %973 = sub nuw nsw i32 30000, %972
  %974 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %975 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %973)
  %976 = sext i32 %975 to i64
  %977 = add i64 %974, %976
  %978 = add i64 %974, 1625
  %979 = icmp ugt i64 %977, %978
  br i1 %979, label %984, label %980

980:                                              ; preds = %984, %971
  %981 = phi i64 [ %974, %971 ], [ %985, %984 ]
  %982 = add i64 %981, 806
  %983 = icmp ugt i64 %977, %982
  br i1 %983, label %992, label %988

984:                                              ; preds = %971, %984
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %985 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %986 = add i64 %985, 1625
  %987 = icmp ugt i64 %977, %986
  br i1 %987, label %984, label %980

988:                                              ; preds = %992, %980
  %989 = phi i64 [ %981, %980 ], [ %993, %992 ]
  %990 = add i64 %989, 396
  %991 = icmp ugt i64 %977, %990
  br i1 %991, label %996, label %1000

992:                                              ; preds = %980, %992
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %993 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %994 = add i64 %993, 806
  %995 = icmp ugt i64 %977, %994
  br i1 %995, label %992, label %988

996:                                              ; preds = %988, %996
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %997 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %998 = add i64 %997, 396
  %999 = icmp ugt i64 %977, %998
  br i1 %999, label %996, label %1000

1000:                                             ; preds = %996, %988
  %1001 = phi i64 [ %989, %988 ], [ %997, %996 ]
  %1002 = add i64 %1001, 192
  %1003 = icmp ugt i64 %977, %1002
  br i1 %1003, label %1008, label %1004

1004:                                             ; preds = %1008, %1000
  %1005 = phi i64 [ %1001, %1000 ], [ %1009, %1008 ]
  %1006 = add i64 %1005, 89
  %1007 = icmp ugt i64 %977, %1006
  br i1 %1007, label %1016, label %1012

1008:                                             ; preds = %1000, %1008
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %1009 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1010 = add i64 %1009, 192
  %1011 = icmp ugt i64 %977, %1010
  br i1 %1011, label %1008, label %1004

1012:                                             ; preds = %1016, %1004
  %1013 = phi i64 [ %1005, %1004 ], [ %1017, %1016 ]
  %1014 = add i64 %1013, 38
  %1015 = icmp ugt i64 %977, %1014
  br i1 %1015, label %1023, label %1020

1016:                                             ; preds = %1004, %1016
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %1017 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1018 = add i64 %1017, 89
  %1019 = icmp ugt i64 %977, %1018
  br i1 %1019, label %1016, label %1012

1020:                                             ; preds = %1023, %1012
  %1021 = phi i64 [ %1013, %1012 ], [ %1024, %1023 ]
  %1022 = icmp ugt i64 %977, %1021
  br i1 %1022, label %1027, label %1030

1023:                                             ; preds = %1012, %1023
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %1024 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1025 = add i64 %1024, 38
  %1026 = icmp ugt i64 %977, %1025
  br i1 %1026, label %1023, label %1020

1027:                                             ; preds = %1020, %1027
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %1028 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1029 = icmp ugt i64 %977, %1028
  br i1 %1029, label %1027, label %1030

1030:                                             ; preds = %1027, %1020, %966, %960
  %1031 = icmp eq i32 %958, 2
  %1032 = select i1 %1031, %3 addrspace(1)* null, %3 addrspace(1)* inttoptr (i64 1 to %3 addrspace(1)*)
  br label %1033

1033:                                             ; preds = %1030, %957
  %1034 = phi %3 addrspace(1)* [ %1032, %1030 ], [ %843, %957 ]
  br i1 %959, label %1035, label %1209

1035:                                             ; preds = %1033, %858
  %1036 = phi %3 addrspace(1)* [ %1034, %1033 ], [ %843, %858 ]
  br i1 %845, label %1037, label %1046

1037:                                             ; preds = %1035
  %1038 = load atomic i64, i64 addrspace(1)* %749 syncscope("agent-one-as") monotonic, align 8
  %1039 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1040 = sub i64 %1039, %1038
  %1041 = icmp ugt i64 %1040, 19999
  br i1 %1041, label %1042, label %1046

1042:                                             ; preds = %1037
  %1043 = cmpxchg i64 addrspace(1)* %749, i64 %1038, i64 %1039 syncscope("agent-one-as") monotonic monotonic, align 8
  %1044 = extractvalue { i64, i1 } %1043, 1
  %1045 = select i1 %1044, i8 addrspace(1)* null, i8 addrspace(1)* inttoptr (i64 1 to i8 addrspace(1)*)
  br label %1046

1046:                                             ; preds = %1042, %1037, %1035
  %1047 = phi i8 addrspace(1)* [ inttoptr (i64 1 to i8 addrspace(1)*), %1035 ], [ inttoptr (i64 1 to i8 addrspace(1)*), %1037 ], [ %1045, %1042 ]
  %1048 = ptrtoint i8 addrspace(1)* %1047 to i64
  %1049 = trunc i64 %1048 to i32
  %1050 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1049)
  %1051 = insertelement <2 x i32> undef, i32 %1050, i64 0
  %1052 = lshr i64 %1048, 32
  %1053 = trunc i64 %1052 to i32
  %1054 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1053)
  %1055 = insertelement <2 x i32> %1051, i32 %1054, i64 1
  %1056 = bitcast <2 x i32> %1055 to i64
  %1057 = icmp eq i64 %1056, 0
  br i1 %1057, label %1060, label %1058

1058:                                             ; preds = %1046
  %1059 = inttoptr i64 %1056 to %3 addrspace(1)*
  br label %1209

1060:                                             ; preds = %1046
  br i1 %845, label %1061, label %1074

1061:                                             ; preds = %1060
  %1062 = load atomic i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6) syncscope("agent-one-as") monotonic, align 8
  %1063 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !69
  %1064 = icmp ult i64 %1062, %1063
  br i1 %1064, label %1065, label %1068

1065:                                             ; preds = %1061
  %1066 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %1067 = icmp ult i64 %1066, %1063
  br i1 %1067, label %1074, label %1068

1068:                                             ; preds = %1065, %1061
  %1069 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !32
  %1070 = inttoptr i64 %1069 to i8 addrspace(1)*
  %1071 = addrspacecast i8 addrspace(1)* %1070 to i8*
  %1072 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1071, i64 noundef 0, i64 noundef 2097152) #13
  %1073 = extractelement <2 x i64> %1072, i64 0
  br label %1074

1074:                                             ; preds = %1068, %1065, %1060
  %1075 = phi i64 [ 0, %1060 ], [ %1073, %1068 ], [ %1066, %1065 ]
  %1076 = trunc i64 %1075 to i32
  %1077 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1076)
  %1078 = insertelement <2 x i32> undef, i32 %1077, i64 0
  %1079 = lshr i64 %1075, 32
  %1080 = trunc i64 %1079 to i32
  %1081 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1080)
  %1082 = insertelement <2 x i32> %1078, i32 %1081, i64 1
  %1083 = bitcast <2 x i32> %1082 to i64
  %1084 = icmp eq i64 %1083, 0
  br i1 %1084, label %1209, label %1085

1085:                                             ; preds = %1074
  %1086 = inttoptr i64 %1083 to %5 addrspace(1)*
  %1087 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %1088 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %1089 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1088, i32 0)
  %1090 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1087, i32 %1089)
  %1091 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1090) #13, !srcloc !67
  %1092 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %1093 = tail call i64 @llvm.ctpop.i64(i64 %1092), !range !39
  %1094 = trunc i64 %1093 to i32
  %1095 = load i32, i32 addrspace(4)* %750, align 4, !tbaa !71
  %1096 = load i32, i32 addrspace(4)* %751, align 4, !tbaa !72
  %1097 = add i32 %1096, 31
  %1098 = lshr i32 %1097, 5
  br i1 %754, label %1122, label %1099

1099:                                             ; preds = %1085
  %1100 = icmp ult i32 %1091, %1098
  br i1 %1100, label %1107, label %1101

1101:                                             ; preds = %1107, %1099
  %1102 = mul i32 %1095, %1094
  %1103 = load i32, i32 addrspace(4)* %755, align 4, !tbaa !73
  %1104 = mul i32 %1095, %1091
  %1105 = add i32 %1103, %1104
  %1106 = icmp ult i32 %1105, %1096
  br i1 %1106, label %1113, label %1131

1107:                                             ; preds = %1099, %1107
  %1108 = phi i32 [ %1111, %1107 ], [ %1091, %1099 ]
  %1109 = zext i32 %1108 to i64
  %1110 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1109
  store i32 0, i32 addrspace(1)* %1110, align 4, !tbaa !50
  %1111 = add i32 %1108, %1094
  %1112 = icmp ult i32 %1111, %1098
  br i1 %1112, label %1107, label %1101

1113:                                             ; preds = %1101, %1113
  %1114 = phi i32 [ %1120, %1113 ], [ %1105, %1101 ]
  %1115 = and i32 %1114, 31
  %1116 = shl nuw i32 1, %1115
  %1117 = lshr i32 %1114, 5
  %1118 = zext i32 %1117 to i64
  %1119 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1118
  store i32 %1116, i32 addrspace(1)* %1119, align 4, !tbaa !50
  %1120 = add i32 %1114, %1102
  %1121 = icmp ult i32 %1120, %1096
  br i1 %1121, label %1113, label %1131

1122:                                             ; preds = %1085
  %1123 = load i32, i32 addrspace(4)* %756, align 4, !tbaa !74
  %1124 = icmp ult i32 %1091, %1098
  br i1 %1124, label %1125, label %1131

1125:                                             ; preds = %1122, %1125
  %1126 = phi i32 [ %1129, %1125 ], [ %1091, %1122 ]
  %1127 = zext i32 %1126 to i64
  %1128 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1127
  store i32 %1123, i32 addrspace(1)* %1128, align 4, !tbaa !50
  %1129 = add i32 %1126, %1094
  %1130 = icmp ult i32 %1129, %1098
  br i1 %1130, label %1125, label %1131

1131:                                             ; preds = %1113, %1125, %1122, %1101
  %1132 = icmp eq i32 %1091, 0
  br i1 %1132, label %1133, label %1144

1133:                                             ; preds = %1131
  br i1 %757, label %1142, label %1134

1134:                                             ; preds = %1133
  %1135 = and i32 %1096, 31
  %1136 = shl nsw i32 -1, %1135
  %1137 = add nsw i32 %1098, -1
  %1138 = zext i32 %1137 to i64
  %1139 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1138
  %1140 = load i32, i32 addrspace(1)* %1139, align 4, !tbaa !50
  %1141 = or i32 %1140, %1136
  store i32 %1141, i32 addrspace(1)* %1139, align 4, !tbaa !50
  br label %1142

1142:                                             ; preds = %1134, %1133
  %1143 = inttoptr i64 %1083 to <4 x i32> addrspace(1)*
  store <4 x i32> %758, <4 x i32> addrspace(1)* %1143, align 16, !tbaa !65
  br label %1144

1144:                                             ; preds = %1142, %1131
  %1145 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 1
  br label %1146

1146:                                             ; preds = %1208, %1144
  %1147 = phi i32 [ %860, %1144 ], [ %1163, %1208 ]
  %1148 = phi i32 [ %850, %1144 ], [ %1156, %1208 ]
  %1149 = phi i32 [ %844, %1144 ], [ %1150, %1208 ]
  %1150 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1149) #13, !srcloc !67
  %1151 = icmp eq i32 %1150, 0
  br i1 %1151, label %1152, label %1154

1152:                                             ; preds = %1146
  %1153 = load atomic i32, i32 addrspace(1)* %746 syncscope("agent-one-as") monotonic, align 8
  br label %1154

1154:                                             ; preds = %1152, %1146
  %1155 = phi i32 [ %1153, %1152 ], [ %1148, %1146 ]
  %1156 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1155)
  %1157 = icmp eq i32 %1156, 65792
  br i1 %1157, label %1209, label %1158

1158:                                             ; preds = %1154
  br i1 %1151, label %1159, label %1161

1159:                                             ; preds = %1158
  %1160 = load atomic i32, i32 addrspace(1)* %747 syncscope("agent-one-as") monotonic, align 8
  br label %1161

1161:                                             ; preds = %1159, %1158
  %1162 = phi i32 [ %1160, %1159 ], [ %1147, %1158 ]
  %1163 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1162)
  %1164 = icmp eq i32 %1156, %1163
  br i1 %1164, label %1165, label %1171

1165:                                             ; preds = %1161
  br i1 %1151, label %1166, label %1209

1166:                                             ; preds = %1165
  %1167 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !32
  %1168 = inttoptr i64 %1167 to i8 addrspace(1)*
  %1169 = addrspacecast i8 addrspace(1)* %1168 to i8*
  %1170 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1169, i64 noundef %1083, i64 noundef 0) #13
  br label %1209

1171:                                             ; preds = %1161
  br i1 %1151, label %1172, label %1194

1172:                                             ; preds = %1171
  %1173 = icmp ugt i32 %1156, 255
  br i1 %1173, label %1174, label %1184

1174:                                             ; preds = %1172
  %1175 = add i32 %1156, -256
  %1176 = lshr i32 %1175, 8
  %1177 = zext i32 %1176 to i64
  %1178 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %1177, i32 0
  %1179 = load atomic i64, i64 addrspace(1)* %1178 syncscope("agent-one-as") monotonic, align 8
  %1180 = inttoptr i64 %1179 to %3 addrspace(1)*
  %1181 = and i32 %1156, 255
  %1182 = zext i32 %1181 to i64
  %1183 = getelementptr inbounds %3, %3 addrspace(1)* %1180, i64 %1182
  br label %1187

1184:                                             ; preds = %1172
  %1185 = zext i32 %1156 to i64
  %1186 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %1185
  br label %1187

1187:                                             ; preds = %1184, %1174
  %1188 = phi %3 addrspace(1)* [ %1183, %1174 ], [ %1186, %1184 ]
  store i32 %1156, i32 addrspace(1)* %1145, align 4, !tbaa !43
  %1189 = getelementptr inbounds %3, %3 addrspace(1)* %1188, i64 0, i32 1
  %1190 = cmpxchg i64 addrspace(1)* %1189, i64 0, i64 %1083 syncscope("agent-one-as") monotonic monotonic, align 8
  %1191 = extractvalue { i64, i1 } %1190, 1
  br i1 %1191, label %1192, label %1194

1192:                                             ; preds = %1187
  %1193 = atomicrmw add i32 addrspace(1)* %746, i32 1 syncscope("agent-one-as") release, align 4
  br label %1194

1194:                                             ; preds = %1192, %1187, %1171
  %1195 = phi %3 addrspace(1)* [ null, %1171 ], [ %1188, %1192 ], [ null, %1187 ]
  %1196 = ptrtoint %3 addrspace(1)* %1195 to i64
  %1197 = trunc i64 %1196 to i32
  %1198 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1197)
  %1199 = insertelement <2 x i32> undef, i32 %1198, i64 0
  %1200 = lshr i64 %1196, 32
  %1201 = trunc i64 %1200 to i32
  %1202 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1201)
  %1203 = insertelement <2 x i32> %1199, i32 %1202, i64 1
  %1204 = bitcast <2 x i32> %1203 to i64
  %1205 = icmp eq i64 %1204, 0
  br i1 %1205, label %1208, label %1206

1206:                                             ; preds = %1194
  %1207 = inttoptr i64 %1204 to %3 addrspace(1)*
  br label %1209

1208:                                             ; preds = %1194
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %1146

1209:                                             ; preds = %1154, %1206, %1166, %1165, %1074, %1058, %1033, %848
  %1210 = phi i1 [ false, %1058 ], [ true, %1166 ], [ true, %1165 ], [ false, %1074 ], [ false, %1206 ], [ false, %848 ], [ false, %1033 ], [ false, %1154 ]
  %1211 = phi i32 [ %844, %1058 ], [ 0, %1166 ], [ %1150, %1165 ], [ %844, %1074 ], [ %1150, %1206 ], [ %844, %848 ], [ %844, %1033 ], [ %1150, %1154 ]
  %1212 = phi %3 addrspace(1)* [ %1059, %1058 ], [ %1036, %1166 ], [ %1036, %1165 ], [ null, %1074 ], [ %1207, %1206 ], [ null, %848 ], [ %1034, %1033 ], [ null, %1154 ]
  br i1 %1210, label %841, label %1213

1213:                                             ; preds = %1209
  %1214 = icmp eq %3 addrspace(1)* %1212, inttoptr (i64 1 to %3 addrspace(1)*)
  br i1 %1214, label %1215, label %1292

1215:                                             ; preds = %1213
  %1216 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %1217 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %1218 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1217, i32 0)
  %1219 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1216, i32 %1218)
  %1220 = icmp eq i32 %1219, 0
  br i1 %1220, label %1221, label %1285

1221:                                             ; preds = %1215
  %1222 = load atomic i64, i64 addrspace(1)* %749 syncscope("agent-one-as") monotonic, align 8
  %1223 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1224 = sub i64 %1223, %1222
  %1225 = icmp ult i64 %1224, 20000
  br i1 %1225, label %1226, label %1285

1226:                                             ; preds = %1221
  %1227 = trunc i64 %1224 to i32
  %1228 = sub nuw nsw i32 20000, %1227
  %1229 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1230 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1228)
  %1231 = sext i32 %1230 to i64
  %1232 = add i64 %1229, %1231
  %1233 = add i64 %1229, 1625
  %1234 = icmp ugt i64 %1232, %1233
  br i1 %1234, label %1239, label %1235

1235:                                             ; preds = %1239, %1226
  %1236 = phi i64 [ %1229, %1226 ], [ %1240, %1239 ]
  %1237 = add i64 %1236, 806
  %1238 = icmp ugt i64 %1232, %1237
  br i1 %1238, label %1247, label %1243

1239:                                             ; preds = %1226, %1239
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %1240 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1241 = add i64 %1240, 1625
  %1242 = icmp ugt i64 %1232, %1241
  br i1 %1242, label %1239, label %1235

1243:                                             ; preds = %1247, %1235
  %1244 = phi i64 [ %1236, %1235 ], [ %1248, %1247 ]
  %1245 = add i64 %1244, 396
  %1246 = icmp ugt i64 %1232, %1245
  br i1 %1246, label %1251, label %1255

1247:                                             ; preds = %1235, %1247
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %1248 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1249 = add i64 %1248, 806
  %1250 = icmp ugt i64 %1232, %1249
  br i1 %1250, label %1247, label %1243

1251:                                             ; preds = %1243, %1251
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %1252 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1253 = add i64 %1252, 396
  %1254 = icmp ugt i64 %1232, %1253
  br i1 %1254, label %1251, label %1255

1255:                                             ; preds = %1251, %1243
  %1256 = phi i64 [ %1244, %1243 ], [ %1252, %1251 ]
  %1257 = add i64 %1256, 192
  %1258 = icmp ugt i64 %1232, %1257
  br i1 %1258, label %1263, label %1259

1259:                                             ; preds = %1263, %1255
  %1260 = phi i64 [ %1256, %1255 ], [ %1264, %1263 ]
  %1261 = add i64 %1260, 89
  %1262 = icmp ugt i64 %1232, %1261
  br i1 %1262, label %1271, label %1267

1263:                                             ; preds = %1255, %1263
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %1264 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1265 = add i64 %1264, 192
  %1266 = icmp ugt i64 %1232, %1265
  br i1 %1266, label %1263, label %1259

1267:                                             ; preds = %1271, %1259
  %1268 = phi i64 [ %1260, %1259 ], [ %1272, %1271 ]
  %1269 = add i64 %1268, 38
  %1270 = icmp ugt i64 %1232, %1269
  br i1 %1270, label %1278, label %1275

1271:                                             ; preds = %1259, %1271
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %1272 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1273 = add i64 %1272, 89
  %1274 = icmp ugt i64 %1232, %1273
  br i1 %1274, label %1271, label %1267

1275:                                             ; preds = %1278, %1267
  %1276 = phi i64 [ %1268, %1267 ], [ %1279, %1278 ]
  %1277 = icmp ugt i64 %1232, %1276
  br i1 %1277, label %1282, label %1285

1278:                                             ; preds = %1267, %1278
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %1279 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1280 = add i64 %1279, 38
  %1281 = icmp ugt i64 %1232, %1280
  br i1 %1281, label %1278, label %1275

1282:                                             ; preds = %1275, %1282
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %1283 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1284 = icmp ugt i64 %1232, %1283
  br i1 %1284, label %1282, label %1285

1285:                                             ; preds = %1282, %1275, %1221, %1215
  %1286 = icmp eq i32 %763, 0
  br i1 %1286, label %1287, label %1289

1287:                                             ; preds = %1285
  %1288 = load atomic i32, i32 addrspace(1)* %746 syncscope("agent-one-as") monotonic, align 8
  br label %1289

1289:                                             ; preds = %1287, %1285
  %1290 = phi i32 [ %1288, %1287 ], [ %761, %1285 ]
  %1291 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1290)
  br label %1292

1292:                                             ; preds = %1289, %1213
  %1293 = phi i32 [ %1291, %1289 ], [ %761, %1213 ]
  %1294 = phi %3 addrspace(1)* [ %836, %1289 ], [ %1212, %1213 ]
  br i1 %1214, label %759, label %1295

1295:                                             ; preds = %714, %1292, %829, %731, %720
  %1296 = phi i1 [ false, %720 ], [ true, %731 ], [ false, %829 ], [ false, %1292 ], [ false, %714 ]
  %1297 = phi i32 [ %643, %720 ], [ %722, %731 ], [ %43, %829 ], [ %43, %1292 ], [ %643, %714 ]
  %1298 = phi %3 addrspace(1)* [ null, %720 ], [ %717, %731 ], [ %832, %829 ], [ %1294, %1292 ], [ %717, %714 ]
  br i1 %1296, label %642, label %1299

1299:                                             ; preds = %1295, %631, %168
  %1300 = phi %3 addrspace(1)* [ %171, %168 ], [ %633, %631 ], [ %1298, %1295 ]
  %1301 = ptrtoint %3 addrspace(1)* %1300 to i64
  %1302 = trunc i64 %1301 to i32
  %1303 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1302)
  %1304 = insertelement <2 x i32> undef, i32 %1303, i64 0
  %1305 = lshr i64 %1301, 32
  %1306 = trunc i64 %1305 to i32
  %1307 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1306)
  %1308 = insertelement <2 x i32> %1304, i32 %1307, i64 1
  %1309 = bitcast <2 x i32> %1308 to i64
  %1310 = icmp eq i64 %1309, 0
  br i1 %1310, label %1410, label %1311

1311:                                             ; preds = %1299
  %1312 = inttoptr i64 %1309 to %3 addrspace(1)*
  %1313 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %1314 = tail call i32 @llvm.read_register.i32(metadata !37) #14
  %1315 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1314, i32 0)
  %1316 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1313, i32 %1315)
  %1317 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1316) #13, !srcloc !67
  %1318 = tail call i64 @llvm.read_register.i64(metadata !38) #14
  %1319 = getelementptr inbounds %3, %3 addrspace(1)* %1312, i64 0, i32 1
  %1320 = load atomic i64, i64 addrspace(1)* %1319 seq_cst, align 8, !tbaa !76
  %1321 = inttoptr i64 %1320 to %5 addrspace(1)*
  %1322 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 0
  %1323 = load i32, i32 addrspace(1)* %1322, align 4, !tbaa !40
  %1324 = icmp eq i32 %1317, 0
  br i1 %1324, label %1325, label %1330

1325:                                             ; preds = %1311
  %1326 = tail call i64 @llvm.ctpop.i64(i64 %1318), !range !39
  %1327 = trunc i64 %1326 to i32
  %1328 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 2
  %1329 = atomicrmw add i32 addrspace(1)* %1328, i32 %1327 syncscope("agent-one-as") monotonic, align 4
  br label %1330

1330:                                             ; preds = %1325, %1311
  %1331 = phi i32 [ %1329, %1325 ], [ 0, %1311 ]
  %1332 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1331)
  %1333 = zext i32 %1323 to i64
  %1334 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 0
  %1335 = load i32, i32 addrspace(4)* %1334, align 4, !tbaa !72
  %1336 = add i32 %1335, 31
  %1337 = lshr i32 %1336, 5
  %1338 = icmp ult i32 %1336, 32
  br i1 %1338, label %1397, label %1339

1339:                                             ; preds = %1330
  %1340 = add i32 %1332, %1317
  %1341 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 7
  %1342 = load i32, i32 addrspace(4)* %1341, align 4, !tbaa !78
  %1343 = mul i32 %1342, %1340
  %1344 = urem i32 %1343, %1335
  %1345 = lshr i32 %1344, 5
  %1346 = inttoptr i64 %1320 to i8 addrspace(1)*
  %1347 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 3
  %1348 = lshr i32 %1323, 1
  %1349 = add nuw i32 %1348, 4
  %1350 = and i32 %1349, 31
  %1351 = shl nuw i32 1, %1350
  %1352 = and i32 %1323, 1
  %1353 = icmp eq i32 %1352, 0
  %1354 = lshr i32 %1351, 1
  %1355 = select i1 %1353, i32 0, i32 %1354
  %1356 = add nuw i32 %1355, %1351
  br label %1357

1357:                                             ; preds = %1389, %1339
  %1358 = phi i32 [ %1345, %1339 ], [ %1392, %1389 ]
  %1359 = phi i8 addrspace(1)* [ null, %1339 ], [ %1391, %1389 ]
  %1360 = phi i32 [ 0, %1339 ], [ %1394, %1389 ]
  %1361 = zext i32 %1358 to i64
  %1362 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 4, i64 %1361
  %1363 = load atomic i32, i32 addrspace(1)* %1362 syncscope("agent-one-as") monotonic, align 4
  %1364 = icmp eq i32 %1363, -1
  br i1 %1364, label %1385, label %1365

1365:                                             ; preds = %1357
  %1366 = xor i32 %1363, -1
  %1367 = tail call i32 @llvm.cttz.i32(i32 %1366, i1 false), !range !66
  %1368 = and i32 %1367, 31
  %1369 = shl nuw i32 1, %1368
  %1370 = atomicrmw or i32 addrspace(1)* %1362, i32 %1369 syncscope("agent-one-as") monotonic, align 4
  %1371 = and i32 %1370, %1369
  %1372 = icmp eq i32 %1371, 0
  br i1 %1372, label %1373, label %1382

1373:                                             ; preds = %1365
  %1374 = shl i32 %1358, 5
  %1375 = add i32 %1367, %1374
  %1376 = load i32, i32 addrspace(4)* %1347, align 4, !tbaa !45
  %1377 = zext i32 %1376 to i64
  %1378 = getelementptr inbounds i8, i8 addrspace(1)* %1346, i64 %1377
  %1379 = mul i32 %1375, %1356
  %1380 = zext i32 %1379 to i64
  %1381 = getelementptr inbounds i8, i8 addrspace(1)* %1378, i64 %1380
  br label %1382

1382:                                             ; preds = %1373, %1365
  %1383 = phi i32 [ 2, %1373 ], [ 0, %1365 ]
  %1384 = phi i8 addrspace(1)* [ %1381, %1373 ], [ %1359, %1365 ]
  br i1 %1372, label %1389, label %1385

1385:                                             ; preds = %1382, %1357
  %1386 = phi i8 addrspace(1)* [ %1384, %1382 ], [ %1359, %1357 ]
  %1387 = add i32 %1358, 1
  %1388 = urem i32 %1387, %1337
  br label %1389

1389:                                             ; preds = %1385, %1382
  %1390 = phi i32 [ 0, %1385 ], [ %1383, %1382 ]
  %1391 = phi i8 addrspace(1)* [ %1386, %1385 ], [ %1384, %1382 ]
  %1392 = phi i32 [ %1388, %1385 ], [ %1358, %1382 ]
  %1393 = icmp eq i32 %1390, 0
  %1394 = add nuw nsw i32 %1360, 1
  %1395 = icmp ult i32 %1394, %1337
  %1396 = select i1 %1393, i1 %1395, i1 false
  br i1 %1396, label %1357, label %1397

1397:                                             ; preds = %1389, %1330
  %1398 = phi i8 addrspace(1)* [ null, %1330 ], [ %1391, %1389 ]
  %1399 = ptrtoint i8 addrspace(1)* %1398 to i64
  %1400 = tail call i64 @llvm.amdgcn.icmp.i64.i64(i64 noundef %1399, i64 noundef 0, i32 noundef 33) #15
  br i1 %1324, label %1401, label %1406

1401:                                             ; preds = %1397
  %1402 = tail call i64 @llvm.ctpop.i64(i64 %1400), !range !39
  %1403 = trunc i64 %1402 to i32
  %1404 = getelementptr inbounds %3, %3 addrspace(1)* %1312, i64 0, i32 2
  %1405 = atomicrmw add i32 addrspace(1)* %1404, i32 %1403 syncscope("agent-one-as") monotonic, align 4
  br label %1406

1406:                                             ; preds = %1401, %1397
  %1407 = icmp eq i8 addrspace(1)* %1398, null
  %1408 = select i1 %1407, i32 %72, i32 0
  %1409 = select i1 %1407, i32 %75, i32 0
  br label %1410

1410:                                             ; preds = %1406, %1299, %71
  %1411 = phi i32 [ %72, %71 ], [ %1408, %1406 ], [ 0, %1299 ]
  %1412 = phi i32 [ 0, %71 ], [ %1409, %1406 ], [ 0, %1299 ]
  %1413 = phi i8 addrspace(1)* [ %74, %71 ], [ %1398, %1406 ], [ %74, %1299 ]
  %1414 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1412) #13, !srcloc !47
  %1415 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1414, i32 noundef 0, i32 noundef 33) #15
  %1416 = icmp eq i64 %1415, 0
  br i1 %1416, label %1417, label %71

1417:                                             ; preds = %1410, %68, %63
  %1418 = phi i32 [ 0, %63 ], [ %66, %68 ], [ %1411, %1410 ]
  %1419 = phi i8 addrspace(1)* [ %65, %63 ], [ %65, %68 ], [ %1413, %1410 ]
  %1420 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1418) #13, !srcloc !47
  %1421 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1420, i32 noundef 0, i32 noundef 33) #15
  %1422 = icmp eq i64 %1421, 0
  br i1 %1422, label %1423, label %63

1423:                                             ; preds = %1417, %25, %1
  %1424 = phi i8 addrspace(1)* [ %26, %25 ], [ null, %1 ], [ %1419, %1417 ]
  ret i8 addrspace(1)* %1424
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #2

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.ds.bpermute(i32, i32) #6

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i64(i64, i64, i32 immarg) #6

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memrealtime() #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.cttz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.cttz.i64(i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { nofree nounwind readonly }
attributes #6 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #7 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #8 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #9 = { mustprogress nounwind willreturn }
attributes #10 = { nounwind }
attributes #11 = { convergent noinline norecurse nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #12 = { readnone }
attributes #13 = { convergent nounwind }
attributes #14 = { convergent }
attributes #15 = { convergent nounwind readnone willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !14, !24}
!24 = !{!"llvm.loop.peeled.count", i32 1}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !17}
!27 = distinct !{!27, !14}
!28 = distinct !{!28, !14}
!29 = distinct !{!29, !14}
!30 = distinct !{!30, !14}
!31 = distinct !{!31, !14}
!32 = !{!33, !33, i64 0}
!33 = !{!"long", !34, i64 0}
!34 = !{!"omnipotent char", !35, i64 0}
!35 = !{!"Simple C/C++ TBAA"}
!36 = !{!"exec_hi"}
!37 = !{!"exec_lo"}
!38 = !{!"exec"}
!39 = !{i64 0, i64 65}
!40 = !{!41, !42, i64 0}
!41 = !{!"slab_s", !42, i64 0, !42, i64 4, !34, i64 8, !42, i64 12, !34, i64 16}
!42 = !{!"int", !34, i64 0}
!43 = !{!41, !42, i64 4}
!44 = !{i64 7014}
!45 = !{!46, !42, i64 12}
!46 = !{!"kind_info_s", !42, i64 0, !42, i64 4, !42, i64 8, !42, i64 12, !42, i64 16, !42, i64 20, !42, i64 24, !42, i64 28}
!47 = !{i64 751}
!48 = !{!49, !49, i64 0}
!49 = !{!"any pointer", !34, i64 0}
!50 = !{!42, !42, i64 0}
!51 = !{i64 2662}
!52 = !{!53, !49, i64 0}
!53 = !{!"", !49, i64 0, !49, i64 8, !54, i64 16, !33, i64 24, !33, i64 32, !33, i64 40}
!54 = !{!"hsa_signal_s", !33, i64 0}
!55 = !{!53, !33, i64 40}
!56 = !{!53, !49, i64 8}
!57 = !{!58, !42, i64 16}
!58 = !{!"", !33, i64 0, !33, i64 8, !42, i64 16, !42, i64 20}
!59 = !{!58, !33, i64 8}
!60 = !{!58, !42, i64 20}
!61 = !{!58, !33, i64 0}
!62 = !{!63, !33, i64 16}
!63 = !{!"amd_signal_s", !33, i64 0, !34, i64 8, !33, i64 16, !42, i64 24, !42, i64 28, !33, i64 32, !33, i64 40, !34, i64 48, !34, i64 56}
!64 = !{!63, !42, i64 24}
!65 = !{!34, !34, i64 0}
!66 = !{i32 0, i32 33}
!67 = !{i64 7137}
!68 = !{!46, !42, i64 8}
!69 = !{!70, !33, i64 108552}
!70 = !{!"heap_s", !34, i64 0, !34, i64 2048, !34, i64 4096, !34, i64 6144, !34, i64 8192, !34, i64 10240, !34, i64 108544, !33, i64 108552, !34, i64 108560, !34, i64 108672}
!71 = !{!46, !42, i64 20}
!72 = !{!46, !42, i64 0}
!73 = !{!46, !42, i64 16}
!74 = !{!46, !42, i64 24}
!75 = !{!46, !42, i64 4}
!76 = !{!77, !34, i64 8}
!77 = !{!"sdata_s", !34, i64 0, !34, i64 8, !34, i64 16}
!78 = !{!46, !42, i64 28}
