; ModuleID = '../data/hip_kernels/10483/20/main.cu'
source_filename = "../data/hip_kernels/10483/20/main.cu"
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
define protected amdgpu_kernel void @_Z17createQueryPointsiiiiiiPfS_S_S_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8, float addrspace(1)* nocapture writeonly %9) local_unnamed_addr #1 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %550

21:                                               ; preds = %10
  %22 = sext i32 %1 to i64
  %23 = shl nsw i64 %22, 2
  %24 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %23) #12
  %25 = ptrtoint i8 addrspace(1)* %24 to i64
  %26 = bitcast i8 addrspace(1)* %24 to i32 addrspace(1)*
  %27 = icmp sgt i32 %1, 0
  br i1 %27, label %28, label %496

28:                                               ; preds = %21
  %29 = sitofp i32 %2 to double
  %30 = tail call double @llvm.fabs.f64(double %29)
  %31 = tail call double @llvm.amdgcn.frexp.mant.f64(double %30)
  %32 = fcmp olt double %31, 0x3FE5555555555555
  %33 = zext i1 %32 to i32
  %34 = tail call double @llvm.amdgcn.ldexp.f64(double %31, i32 %33)
  %35 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %30)
  %36 = sub nsw i32 %35, %33
  %37 = fadd double %34, -1.000000e+00
  %38 = fadd double %34, 1.000000e+00
  %39 = fadd double %38, -1.000000e+00
  %40 = fsub double %34, %39
  %41 = tail call double @llvm.amdgcn.rcp.f64(double %38)
  %42 = fneg double %38
  %43 = tail call double @llvm.fma.f64(double %42, double %41, double 1.000000e+00)
  %44 = tail call double @llvm.fma.f64(double %43, double %41, double %41)
  %45 = tail call double @llvm.fma.f64(double %42, double %44, double 1.000000e+00)
  %46 = tail call double @llvm.fma.f64(double %45, double %44, double %44)
  %47 = fmul double %37, %46
  %48 = fmul double %38, %47
  %49 = fneg double %48
  %50 = tail call double @llvm.fma.f64(double %47, double %38, double %49)
  %51 = tail call double @llvm.fma.f64(double %47, double %40, double %50)
  %52 = fadd double %48, %51
  %53 = fsub double %52, %48
  %54 = fsub double %51, %53
  %55 = fsub double %37, %52
  %56 = fsub double %37, %55
  %57 = fsub double %56, %52
  %58 = fsub double %57, %54
  %59 = fadd double %55, %58
  %60 = fmul double %46, %59
  %61 = fadd double %47, %60
  %62 = fsub double %61, %47
  %63 = fsub double %60, %62
  %64 = fmul double %61, %61
  %65 = fneg double %64
  %66 = tail call double @llvm.fma.f64(double %61, double %61, double %65)
  %67 = fmul double %63, 2.000000e+00
  %68 = tail call double @llvm.fma.f64(double %61, double %67, double %66)
  %69 = fadd double %64, %68
  %70 = fsub double %69, %64
  %71 = fsub double %68, %70
  %72 = tail call double @llvm.fma.f64(double %69, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %73 = tail call double @llvm.fma.f64(double %69, double %72, double 0x3FBE25E43ABE935A)
  %74 = tail call double @llvm.fma.f64(double %69, double %73, double 0x3FC110EF47E6C9C2)
  %75 = tail call double @llvm.fma.f64(double %69, double %74, double 0x3FC3B13BCFA74449)
  %76 = tail call double @llvm.fma.f64(double %69, double %75, double 0x3FC745D171BF3C30)
  %77 = tail call double @llvm.fma.f64(double %69, double %76, double 0x3FCC71C71C7792CE)
  %78 = tail call double @llvm.fma.f64(double %69, double %77, double 0x3FD24924924920DA)
  %79 = tail call double @llvm.fma.f64(double %69, double %78, double 0x3FD999999999999C)
  %80 = sitofp i32 %36 to double
  %81 = fmul double %80, 0x3FE62E42FEFA39EF
  %82 = fneg double %81
  %83 = tail call double @llvm.fma.f64(double %80, double 0x3FE62E42FEFA39EF, double %82)
  %84 = tail call double @llvm.fma.f64(double %80, double 0x3C7ABC9E3B39803F, double %83)
  %85 = fadd double %81, %84
  %86 = fsub double %85, %81
  %87 = fsub double %84, %86
  %88 = tail call double @llvm.amdgcn.ldexp.f64(double %61, i32 1)
  %89 = tail call double @llvm.amdgcn.ldexp.f64(double %63, i32 1)
  %90 = fmul double %61, %69
  %91 = fneg double %90
  %92 = tail call double @llvm.fma.f64(double %69, double %61, double %91)
  %93 = tail call double @llvm.fma.f64(double %69, double %63, double %92)
  %94 = tail call double @llvm.fma.f64(double %71, double %61, double %93)
  %95 = fadd double %90, %94
  %96 = fsub double %95, %90
  %97 = fsub double %94, %96
  %98 = fmul double %69, %79
  %99 = fneg double %98
  %100 = tail call double @llvm.fma.f64(double %69, double %79, double %99)
  %101 = tail call double @llvm.fma.f64(double %71, double %79, double %100)
  %102 = fadd double %98, %101
  %103 = fsub double %102, %98
  %104 = fsub double %101, %103
  %105 = fadd double %102, 0x3FE5555555555555
  %106 = fadd double %105, 0xBFE5555555555555
  %107 = fsub double %102, %106
  %108 = fadd double %104, 0x3C8543B0D5DF274D
  %109 = fadd double %108, %107
  %110 = fadd double %105, %109
  %111 = fsub double %110, %105
  %112 = fsub double %109, %111
  %113 = fmul double %95, %110
  %114 = fneg double %113
  %115 = tail call double @llvm.fma.f64(double %95, double %110, double %114)
  %116 = tail call double @llvm.fma.f64(double %95, double %112, double %115)
  %117 = tail call double @llvm.fma.f64(double %97, double %110, double %116)
  %118 = fadd double %113, %117
  %119 = fsub double %118, %113
  %120 = fsub double %117, %119
  %121 = fadd double %88, %118
  %122 = fsub double %121, %88
  %123 = fsub double %118, %122
  %124 = fadd double %89, %120
  %125 = fadd double %124, %123
  %126 = fadd double %121, %125
  %127 = fsub double %126, %121
  %128 = fsub double %125, %127
  %129 = fadd double %85, %126
  %130 = fsub double %129, %85
  %131 = fsub double %129, %130
  %132 = fsub double %85, %131
  %133 = fsub double %126, %130
  %134 = fadd double %133, %132
  %135 = fadd double %87, %128
  %136 = fsub double %135, %87
  %137 = fsub double %135, %136
  %138 = fsub double %87, %137
  %139 = fsub double %128, %136
  %140 = fadd double %139, %138
  %141 = fadd double %135, %134
  %142 = fadd double %129, %141
  %143 = fsub double %142, %129
  %144 = fsub double %141, %143
  %145 = fadd double %140, %144
  %146 = fadd double %142, %145
  %147 = fsub double %146, %142
  %148 = fsub double %145, %147
  %149 = icmp slt i32 %2, 0
  %150 = icmp sgt i32 %2, -1
  %151 = fcmp oeq double %30, 1.000000e+00
  %152 = fadd double %30, -1.000000e+00
  %153 = bitcast double %152 to <2 x i32>
  %154 = extractelement <2 x i32> %153, i64 1
  %155 = fcmp oeq double %30, 0x7FF0000000000000
  %156 = icmp eq i32 %2, 0
  %157 = or i1 %156, %155
  %158 = icmp eq i32 %2, 1
  br label %377

159:                                              ; preds = %377
  br i1 %27, label %160, label %496

160:                                              ; preds = %159
  %161 = mul nsw i32 %4, %1
  %162 = add nsw i32 %2, -1
  %163 = sitofp i32 %162 to float
  %164 = mul nsw i32 %5, %4
  %165 = mul nsw i32 %2, %1
  %166 = sitofp i32 %2 to double
  %167 = sitofp i32 %1 to double
  %168 = tail call double @llvm.fabs.f64(double %166)
  %169 = tail call double @llvm.amdgcn.frexp.mant.f64(double %168)
  %170 = fcmp olt double %169, 0x3FE5555555555555
  %171 = zext i1 %170 to i32
  %172 = tail call double @llvm.amdgcn.ldexp.f64(double %169, i32 %171)
  %173 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %168)
  %174 = sub nsw i32 %173, %171
  %175 = fadd double %172, -1.000000e+00
  %176 = fadd double %172, 1.000000e+00
  %177 = fadd double %176, -1.000000e+00
  %178 = fsub double %172, %177
  %179 = tail call double @llvm.amdgcn.rcp.f64(double %176)
  %180 = fneg double %176
  %181 = tail call double @llvm.fma.f64(double %180, double %179, double 1.000000e+00)
  %182 = tail call double @llvm.fma.f64(double %181, double %179, double %179)
  %183 = tail call double @llvm.fma.f64(double %180, double %182, double 1.000000e+00)
  %184 = tail call double @llvm.fma.f64(double %183, double %182, double %182)
  %185 = fmul double %175, %184
  %186 = fmul double %176, %185
  %187 = fneg double %186
  %188 = tail call double @llvm.fma.f64(double %185, double %176, double %187)
  %189 = tail call double @llvm.fma.f64(double %185, double %178, double %188)
  %190 = fadd double %186, %189
  %191 = fsub double %190, %186
  %192 = fsub double %189, %191
  %193 = fsub double %175, %190
  %194 = fsub double %175, %193
  %195 = fsub double %194, %190
  %196 = fsub double %195, %192
  %197 = fadd double %193, %196
  %198 = fmul double %184, %197
  %199 = fadd double %185, %198
  %200 = fsub double %199, %185
  %201 = fsub double %198, %200
  %202 = fmul double %199, %199
  %203 = fneg double %202
  %204 = tail call double @llvm.fma.f64(double %199, double %199, double %203)
  %205 = fmul double %201, 2.000000e+00
  %206 = tail call double @llvm.fma.f64(double %199, double %205, double %204)
  %207 = fadd double %202, %206
  %208 = fsub double %207, %202
  %209 = fsub double %206, %208
  %210 = tail call double @llvm.fma.f64(double %207, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %211 = tail call double @llvm.fma.f64(double %207, double %210, double 0x3FBE25E43ABE935A)
  %212 = tail call double @llvm.fma.f64(double %207, double %211, double 0x3FC110EF47E6C9C2)
  %213 = tail call double @llvm.fma.f64(double %207, double %212, double 0x3FC3B13BCFA74449)
  %214 = tail call double @llvm.fma.f64(double %207, double %213, double 0x3FC745D171BF3C30)
  %215 = tail call double @llvm.fma.f64(double %207, double %214, double 0x3FCC71C71C7792CE)
  %216 = tail call double @llvm.fma.f64(double %207, double %215, double 0x3FD24924924920DA)
  %217 = tail call double @llvm.fma.f64(double %207, double %216, double 0x3FD999999999999C)
  %218 = sitofp i32 %174 to double
  %219 = fmul double %218, 0x3FE62E42FEFA39EF
  %220 = fneg double %219
  %221 = tail call double @llvm.fma.f64(double %218, double 0x3FE62E42FEFA39EF, double %220)
  %222 = tail call double @llvm.fma.f64(double %218, double 0x3C7ABC9E3B39803F, double %221)
  %223 = fadd double %219, %222
  %224 = fsub double %223, %219
  %225 = fsub double %222, %224
  %226 = tail call double @llvm.amdgcn.ldexp.f64(double %199, i32 1)
  %227 = tail call double @llvm.amdgcn.ldexp.f64(double %201, i32 1)
  %228 = fmul double %199, %207
  %229 = fneg double %228
  %230 = tail call double @llvm.fma.f64(double %207, double %199, double %229)
  %231 = tail call double @llvm.fma.f64(double %207, double %201, double %230)
  %232 = tail call double @llvm.fma.f64(double %209, double %199, double %231)
  %233 = fadd double %228, %232
  %234 = fsub double %233, %228
  %235 = fsub double %232, %234
  %236 = fmul double %207, %217
  %237 = fneg double %236
  %238 = tail call double @llvm.fma.f64(double %207, double %217, double %237)
  %239 = tail call double @llvm.fma.f64(double %209, double %217, double %238)
  %240 = fadd double %236, %239
  %241 = fsub double %240, %236
  %242 = fsub double %239, %241
  %243 = fadd double %240, 0x3FE5555555555555
  %244 = fadd double %243, 0xBFE5555555555555
  %245 = fsub double %240, %244
  %246 = fadd double %242, 0x3C8543B0D5DF274D
  %247 = fadd double %246, %245
  %248 = fadd double %243, %247
  %249 = fsub double %248, %243
  %250 = fsub double %247, %249
  %251 = fmul double %233, %248
  %252 = fneg double %251
  %253 = tail call double @llvm.fma.f64(double %233, double %248, double %252)
  %254 = tail call double @llvm.fma.f64(double %233, double %250, double %253)
  %255 = tail call double @llvm.fma.f64(double %235, double %248, double %254)
  %256 = fadd double %251, %255
  %257 = fsub double %256, %251
  %258 = fsub double %255, %257
  %259 = fadd double %226, %256
  %260 = fsub double %259, %226
  %261 = fsub double %256, %260
  %262 = fadd double %227, %258
  %263 = fadd double %262, %261
  %264 = fadd double %259, %263
  %265 = fsub double %264, %259
  %266 = fsub double %263, %265
  %267 = fadd double %223, %264
  %268 = fsub double %267, %223
  %269 = fsub double %267, %268
  %270 = fsub double %223, %269
  %271 = fsub double %264, %268
  %272 = fadd double %271, %270
  %273 = fadd double %225, %266
  %274 = fsub double %273, %225
  %275 = fsub double %273, %274
  %276 = fsub double %225, %275
  %277 = fsub double %266, %274
  %278 = fadd double %277, %276
  %279 = fadd double %273, %272
  %280 = fadd double %267, %279
  %281 = fsub double %280, %267
  %282 = fsub double %279, %281
  %283 = fadd double %278, %282
  %284 = fadd double %280, %283
  %285 = fsub double %284, %280
  %286 = fsub double %283, %285
  %287 = fmul double %284, %167
  %288 = fneg double %287
  %289 = tail call double @llvm.fma.f64(double %167, double %284, double %288)
  %290 = tail call double @llvm.fma.f64(double %167, double %286, double %289)
  %291 = fadd double %287, %290
  %292 = fsub double %291, %287
  %293 = fsub double %290, %292
  %294 = tail call double @llvm.fabs.f64(double %287) #13
  %295 = fcmp oeq double %294, 0x7FF0000000000000
  %296 = select i1 %295, double %287, double %291
  %297 = tail call double @llvm.fabs.f64(double %296) #13
  %298 = fcmp oeq double %297, 0x7FF0000000000000
  %299 = select i1 %298, double 0.000000e+00, double %293
  %300 = fmul double %296, 0x3FF71547652B82FE
  %301 = tail call double @llvm.rint.f64(double %300)
  %302 = fneg double %301
  %303 = tail call double @llvm.fma.f64(double %302, double 0x3FE62E42FEFA39EF, double %296)
  %304 = tail call double @llvm.fma.f64(double %302, double 0x3C7ABC9E3B39803F, double %303)
  %305 = tail call double @llvm.fma.f64(double %304, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %306 = tail call double @llvm.fma.f64(double %304, double %305, double 0x3EC71DEE623FDE64)
  %307 = tail call double @llvm.fma.f64(double %304, double %306, double 0x3EFA01997C89E6B0)
  %308 = tail call double @llvm.fma.f64(double %304, double %307, double 0x3F2A01A014761F6E)
  %309 = tail call double @llvm.fma.f64(double %304, double %308, double 0x3F56C16C1852B7B0)
  %310 = tail call double @llvm.fma.f64(double %304, double %309, double 0x3F81111111122322)
  %311 = tail call double @llvm.fma.f64(double %304, double %310, double 0x3FA55555555502A1)
  %312 = tail call double @llvm.fma.f64(double %304, double %311, double 0x3FC5555555555511)
  %313 = tail call double @llvm.fma.f64(double %304, double %312, double 0x3FE000000000000B)
  %314 = tail call double @llvm.fma.f64(double %304, double %313, double 1.000000e+00)
  %315 = tail call double @llvm.fma.f64(double %304, double %314, double 1.000000e+00)
  %316 = fptosi double %301 to i32
  %317 = tail call double @llvm.amdgcn.ldexp.f64(double %315, i32 %316)
  %318 = fcmp ogt double %296, 1.024000e+03
  %319 = select i1 %318, double 0x7FF0000000000000, double %317
  %320 = fcmp olt double %296, -1.075000e+03
  %321 = select i1 %320, double 0.000000e+00, double %319
  %322 = tail call double @llvm.fma.f64(double %321, double %299, double %321)
  %323 = tail call double @llvm.fabs.f64(double %321) #13
  %324 = fcmp oeq double %323, 0x7FF0000000000000
  %325 = select i1 %324, double %321, double %322
  %326 = tail call double @llvm.fabs.f64(double %167)
  %327 = tail call double @llvm.trunc.f64(double %326)
  %328 = fcmp oeq double %326, %327
  %329 = zext i1 %328 to i32
  %330 = fmul double %327, 5.000000e-01
  %331 = tail call double @llvm.amdgcn.fract.f64(double %330)
  %332 = tail call i1 @llvm.amdgcn.class.f64(double %330, i32 516)
  %333 = select i1 %332, double 0.000000e+00, double %331
  %334 = fcmp oeq double %333, 0.000000e+00
  %335 = and i1 %328, %334
  %336 = zext i1 %335 to i32
  %337 = add nuw nsw i32 %336, %329
  %338 = icmp eq i32 %337, 1
  %339 = icmp slt i32 %2, 0
  %340 = and i1 %339, %338
  %341 = select i1 %340, double -0.000000e+00, double 0.000000e+00
  %342 = tail call double @llvm.copysign.f64(double %325, double %341)
  %343 = icmp sgt i32 %2, -1
  %344 = icmp ne i32 %337, 0
  %345 = select i1 %343, i1 true, i1 %344
  %346 = select i1 %345, double %342, double 0x7FF8000000000000
  %347 = fcmp oeq double %326, 0x7FF0000000000000
  %348 = fcmp oeq double %168, 1.000000e+00
  %349 = fadd double %168, -1.000000e+00
  %350 = bitcast double %167 to <2 x i32>
  %351 = extractelement <2 x i32> %350, i64 1
  %352 = bitcast double %349 to <2 x i32>
  %353 = extractelement <2 x i32> %352, i64 1
  %354 = xor i32 %353, %351
  %355 = icmp sgt i32 %354, -1
  %356 = select i1 %355, double 0x7FF0000000000000, double 0.000000e+00
  %357 = select i1 %348, double %168, double %356
  %358 = select i1 %347, double %357, double %346
  %359 = fcmp oeq double %168, 0x7FF0000000000000
  %360 = icmp eq i32 %2, 0
  %361 = or i1 %360, %359
  %362 = select i1 %360, double 0.000000e+00, double 0x7FF0000000000000
  %363 = select i1 %338, double %166, double 0.000000e+00
  %364 = tail call double @llvm.copysign.f64(double %362, double %363)
  %365 = select i1 %361, double %364, double %358
  %366 = icmp eq i32 %2, 1
  %367 = fptosi double %365 to i32
  %368 = shl nsw i32 %367, 1
  %369 = select i1 %366, i32 2, i32 %368
  %370 = add nsw i32 %369, %165
  %371 = add i32 %164, %3
  %372 = mul i32 %370, %371
  %373 = and i32 %1, 1
  %374 = icmp eq i32 %1, 1
  br i1 %374, label %469, label %375

375:                                              ; preds = %160
  %376 = and i32 %1, -2
  br label %497

377:                                              ; preds = %28, %377
  %378 = phi i32 [ %19, %28 ], [ %466, %377 ]
  %379 = phi i32 [ 0, %28 ], [ %467, %377 ]
  %380 = sitofp i32 %378 to double
  %381 = sub nsw i32 %1, %379
  %382 = add nsw i32 %381, -1
  %383 = sitofp i32 %382 to double
  %384 = fmul double %146, %383
  %385 = fneg double %384
  %386 = tail call double @llvm.fma.f64(double %383, double %146, double %385)
  %387 = tail call double @llvm.fma.f64(double %383, double %148, double %386)
  %388 = fadd double %384, %387
  %389 = fsub double %388, %384
  %390 = fsub double %387, %389
  %391 = tail call double @llvm.fabs.f64(double %384) #13
  %392 = fcmp oeq double %391, 0x7FF0000000000000
  %393 = select i1 %392, double %384, double %388
  %394 = tail call double @llvm.fabs.f64(double %393) #13
  %395 = fcmp oeq double %394, 0x7FF0000000000000
  %396 = select i1 %395, double 0.000000e+00, double %390
  %397 = fmul double %393, 0x3FF71547652B82FE
  %398 = tail call double @llvm.rint.f64(double %397)
  %399 = fneg double %398
  %400 = tail call double @llvm.fma.f64(double %399, double 0x3FE62E42FEFA39EF, double %393)
  %401 = tail call double @llvm.fma.f64(double %399, double 0x3C7ABC9E3B39803F, double %400)
  %402 = tail call double @llvm.fma.f64(double %401, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %403 = tail call double @llvm.fma.f64(double %401, double %402, double 0x3EC71DEE623FDE64)
  %404 = tail call double @llvm.fma.f64(double %401, double %403, double 0x3EFA01997C89E6B0)
  %405 = tail call double @llvm.fma.f64(double %401, double %404, double 0x3F2A01A014761F6E)
  %406 = tail call double @llvm.fma.f64(double %401, double %405, double 0x3F56C16C1852B7B0)
  %407 = tail call double @llvm.fma.f64(double %401, double %406, double 0x3F81111111122322)
  %408 = tail call double @llvm.fma.f64(double %401, double %407, double 0x3FA55555555502A1)
  %409 = tail call double @llvm.fma.f64(double %401, double %408, double 0x3FC5555555555511)
  %410 = tail call double @llvm.fma.f64(double %401, double %409, double 0x3FE000000000000B)
  %411 = tail call double @llvm.fma.f64(double %401, double %410, double 1.000000e+00)
  %412 = tail call double @llvm.fma.f64(double %401, double %411, double 1.000000e+00)
  %413 = fptosi double %398 to i32
  %414 = tail call double @llvm.amdgcn.ldexp.f64(double %412, i32 %413)
  %415 = fcmp ogt double %393, 1.024000e+03
  %416 = select i1 %415, double 0x7FF0000000000000, double %414
  %417 = fcmp olt double %393, -1.075000e+03
  %418 = select i1 %417, double 0.000000e+00, double %416
  %419 = tail call double @llvm.fma.f64(double %418, double %396, double %418)
  %420 = tail call double @llvm.fabs.f64(double %418) #13
  %421 = fcmp oeq double %420, 0x7FF0000000000000
  %422 = select i1 %421, double %418, double %419
  %423 = tail call double @llvm.fabs.f64(double %383)
  %424 = tail call double @llvm.trunc.f64(double %423)
  %425 = fcmp oeq double %423, %424
  %426 = zext i1 %425 to i32
  %427 = fmul double %424, 5.000000e-01
  %428 = tail call double @llvm.amdgcn.fract.f64(double %427)
  %429 = tail call i1 @llvm.amdgcn.class.f64(double %427, i32 516)
  %430 = select i1 %429, double 0.000000e+00, double %428
  %431 = fcmp oeq double %430, 0.000000e+00
  %432 = and i1 %425, %431
  %433 = zext i1 %432 to i32
  %434 = add nuw nsw i32 %433, %426
  %435 = icmp eq i32 %434, 1
  %436 = and i1 %149, %435
  %437 = select i1 %436, double -0.000000e+00, double 0.000000e+00
  %438 = tail call double @llvm.copysign.f64(double %422, double %437)
  %439 = icmp ne i32 %434, 0
  %440 = select i1 %150, i1 true, i1 %439
  %441 = select i1 %440, double %438, double 0x7FF8000000000000
  %442 = fcmp oeq double %423, 0x7FF0000000000000
  %443 = bitcast double %383 to <2 x i32>
  %444 = extractelement <2 x i32> %443, i64 1
  %445 = xor i32 %444, %154
  %446 = icmp sgt i32 %445, -1
  %447 = select i1 %446, double 0x7FF0000000000000, double 0.000000e+00
  %448 = select i1 %151, double %30, double %447
  %449 = select i1 %442, double %448, double %441
  %450 = icmp slt i32 %381, 1
  %451 = xor i1 %156, %450
  %452 = select i1 %451, double 0.000000e+00, double 0x7FF0000000000000
  %453 = select i1 %435, double %29, double 0.000000e+00
  %454 = tail call double @llvm.copysign.f64(double %452, double %453)
  %455 = select i1 %157, double %454, double %449
  %456 = icmp eq i32 %382, 0
  %457 = or i1 %158, %456
  %458 = select i1 %457, double 1.000000e+00, double %455
  %459 = fdiv contract double %380, %458
  %460 = fptosi double %459 to i32
  %461 = zext i32 %379 to i64
  %462 = getelementptr inbounds i32, i32 addrspace(1)* %26, i64 %461
  store i32 %460, i32 addrspace(1)* %462, align 4, !tbaa !7
  %463 = sitofp i32 %460 to double
  %464 = fmul contract double %458, %463
  %465 = fsub contract double %380, %464
  %466 = fptosi double %465 to i32
  %467 = add nuw nsw i32 %379, 1
  %468 = icmp eq i32 %467, %1
  br i1 %468, label %159, label %377, !llvm.loop !11

469:                                              ; preds = %497, %160
  %470 = phi i32 [ 0, %160 ], [ %547, %497 ]
  %471 = icmp eq i32 %373, 0
  br i1 %471, label %496, label %472

472:                                              ; preds = %469
  %473 = zext i32 %470 to i64
  %474 = getelementptr inbounds i32, i32 addrspace(1)* %26, i64 %473
  %475 = load i32, i32 addrspace(1)* %474, align 4, !tbaa !7
  %476 = sitofp i32 %475 to float
  %477 = add nsw i32 %470, %161
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds float, float addrspace(1)* %7, i64 %478
  %480 = load float, float addrspace(1)* %479, align 4, !tbaa !13
  %481 = getelementptr inbounds float, float addrspace(1)* %6, i64 %478
  %482 = load float, float addrspace(1)* %481, align 4, !tbaa !13
  %483 = fsub contract float %480, %482
  %484 = fmul contract float %483, %476
  %485 = fdiv contract float %484, %163
  %486 = fadd contract float %482, %485
  %487 = mul nsw i32 %470, %0
  %488 = add nsw i32 %487, %19
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds float, float addrspace(1)* %9, i64 %489
  store float %486, float addrspace(1)* %490, align 4, !tbaa !13
  %491 = mul nsw i32 %470, %2
  %492 = add nsw i32 %491, %372
  %493 = add nsw i32 %492, %475
  %494 = sext i32 %493 to i64
  %495 = getelementptr inbounds float, float addrspace(1)* %8, i64 %494
  store float %486, float addrspace(1)* %495, align 4, !tbaa !13
  br label %496

496:                                              ; preds = %472, %469, %21, %159
  tail call fastcc void @__ockl_dm_dealloc(i64 %25) #12
  br label %550

497:                                              ; preds = %497, %375
  %498 = phi i32 [ 0, %375 ], [ %547, %497 ]
  %499 = phi i32 [ 0, %375 ], [ %548, %497 ]
  %500 = zext i32 %498 to i64
  %501 = getelementptr inbounds i32, i32 addrspace(1)* %26, i64 %500
  %502 = load i32, i32 addrspace(1)* %501, align 4, !tbaa !7
  %503 = sitofp i32 %502 to float
  %504 = add nsw i32 %498, %161
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds float, float addrspace(1)* %7, i64 %505
  %507 = load float, float addrspace(1)* %506, align 4, !tbaa !13
  %508 = getelementptr inbounds float, float addrspace(1)* %6, i64 %505
  %509 = load float, float addrspace(1)* %508, align 4, !tbaa !13
  %510 = fsub contract float %507, %509
  %511 = fmul contract float %510, %503
  %512 = fdiv contract float %511, %163
  %513 = fadd contract float %509, %512
  %514 = mul nsw i32 %498, %0
  %515 = add nsw i32 %514, %19
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds float, float addrspace(1)* %9, i64 %516
  store float %513, float addrspace(1)* %517, align 4, !tbaa !13
  %518 = mul nsw i32 %498, %2
  %519 = add nsw i32 %518, %372
  %520 = add nsw i32 %519, %502
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds float, float addrspace(1)* %8, i64 %521
  store float %513, float addrspace(1)* %522, align 4, !tbaa !13
  %523 = or i32 %498, 1
  %524 = zext i32 %523 to i64
  %525 = getelementptr inbounds i32, i32 addrspace(1)* %26, i64 %524
  %526 = load i32, i32 addrspace(1)* %525, align 4, !tbaa !7
  %527 = sitofp i32 %526 to float
  %528 = add nsw i32 %523, %161
  %529 = sext i32 %528 to i64
  %530 = getelementptr inbounds float, float addrspace(1)* %7, i64 %529
  %531 = load float, float addrspace(1)* %530, align 4, !tbaa !13
  %532 = getelementptr inbounds float, float addrspace(1)* %6, i64 %529
  %533 = load float, float addrspace(1)* %532, align 4, !tbaa !13
  %534 = fsub contract float %531, %533
  %535 = fmul contract float %534, %527
  %536 = fdiv contract float %535, %163
  %537 = fadd contract float %533, %536
  %538 = mul nsw i32 %523, %0
  %539 = add nsw i32 %538, %19
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds float, float addrspace(1)* %9, i64 %540
  store float %537, float addrspace(1)* %541, align 4, !tbaa !13
  %542 = mul nsw i32 %523, %2
  %543 = add nsw i32 %542, %372
  %544 = add nsw i32 %543, %526
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds float, float addrspace(1)* %8, i64 %545
  store float %537, float addrspace(1)* %546, align 4, !tbaa !13
  %547 = add nuw nsw i32 %498, 2
  %548 = add i32 %499, 2
  %549 = icmp eq i32 %548, %376
  br i1 %549, label %469, label %497, !llvm.loop !15

550:                                              ; preds = %496, %10
  ret void
}

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

; Function Attrs: convergent noinline norecurse nounwind
define internal fastcc void @__ockl_dm_dealloc(i64 noundef %0) unnamed_addr #4 {
  %2 = and i64 %0, 4095
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %21

4:                                                ; preds = %1
  %5 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 24
  %7 = bitcast i8 addrspace(4)* %6 to i64 addrspace(4)*
  %8 = load i64, i64 addrspace(4)* %7, align 8, !tbaa !16
  %9 = inttoptr i64 %8 to i8 addrspace(1)*
  %10 = addrspacecast i8 addrspace(1)* %9 to i8*
  %11 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %0, i64 noundef 0) #12
  %12 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %13 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %14 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %13, i32 0)
  %15 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %12, i32 %14)
  %16 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %17 = icmp eq i32 %15, 0
  br i1 %17, label %18, label %106

18:                                               ; preds = %4
  %19 = tail call i64 @llvm.ctpop.i64(i64 %16), !range !23
  %20 = atomicrmw sub i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %19 syncscope("agent-one-as") monotonic, align 8
  br label %106

21:                                               ; preds = %1
  %22 = and i64 %0, -2097152
  %23 = inttoptr i64 %22 to %5 addrspace(1)*
  %24 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 0
  %25 = load i32, i32 addrspace(1)* %24, align 2097152, !tbaa !24
  %26 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 1
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !27
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
  %52 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %51) #12, !srcloc !28
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
  %61 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %62 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %63 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %62, i32 0)
  %64 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %61, i32 %63)
  %65 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %66 = tail call i64 @llvm.ctpop.i64(i64 %65), !range !23
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
  %83 = load i32, i32 addrspace(4)* %49, align 4, !tbaa !29
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
  %103 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %102) #12, !srcloc !31
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
  store i8* %0, i8* addrspace(5)* %4, align 8, !tbaa !32
  store i32 3, i32 addrspace(5)* %5, align 4, !tbaa !34
  store i64 %1, i64 addrspace(5)* %6, align 8, !tbaa !16
  store i64 %2, i64 addrspace(5)* %7, align 8, !tbaa !16
  store i64 0, i64 addrspace(5)* %8, align 8, !tbaa !16
  store i64 0, i64 addrspace(5)* %9, align 8, !tbaa !16
  store i64 0, i64 addrspace(5)* %10, align 8, !tbaa !16
  store i64 0, i64 addrspace(5)* %11, align 8, !tbaa !16
  store i64 0, i64 addrspace(5)* %12, align 8, !tbaa !16
  store i64 0, i64 addrspace(5)* %13, align 8, !tbaa !16
  %21 = bitcast i32 addrspace(5)* %14 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %21) #10
  %22 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %23 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %22)
  store i32 %23, i32 addrspace(5)* %14, align 4, !tbaa !34
  %24 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !34
  %25 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %24) #12, !srcloc !35
  store i32 %25, i32 addrspace(5)* %14, align 4, !tbaa !34
  %26 = bitcast i32 addrspace(5)* %15 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %26) #10
  %27 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !34
  %28 = call i32 @llvm.amdgcn.readfirstlane(i32 %27)
  store i32 %28, i32 addrspace(5)* %15, align 4, !tbaa !34
  %29 = bitcast %6 addrspace(1)* addrspace(5)* %16 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %29) #10
  %30 = load i8*, i8* addrspace(5)* %4, align 8, !tbaa !32
  %31 = addrspacecast i8* %30 to %6 addrspace(1)*
  store %6 addrspace(1)* %31, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !32
  %32 = bitcast i64 addrspace(5)* %17 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %32) #10
  %33 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !32
  %34 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !34
  %35 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !34
  %36 = icmp eq i32 %34, %35
  br i1 %36, label %37, label %62

37:                                               ; preds = %3
  %38 = getelementptr inbounds %6, %6 addrspace(1)* %33, i64 0, i32 3
  %39 = load atomic i64, i64 addrspace(1)* %38 syncscope("one-as") acquire, align 8
  %40 = getelementptr %6, %6 addrspace(1)* %33, i64 0, i32 0
  %41 = getelementptr %6, %6 addrspace(1)* %33, i64 0, i32 5
  %42 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %40, align 8, !tbaa !36
  %43 = load i64, i64 addrspace(1)* %41, align 8, !tbaa !39
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
  %52 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %40, align 8, !tbaa !36
  %53 = load i64, i64 addrspace(1)* %41, align 8, !tbaa !39
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
  store i64 %72, i64 addrspace(5)* %17, align 8, !tbaa !16
  %73 = bitcast %7 addrspace(1)* addrspace(5)* %18 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %73) #10
  %74 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !32
  %75 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !16
  %76 = getelementptr %6, %6 addrspace(1)* %74, i64 0, i32 0
  %77 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %76, align 8, !tbaa !36
  %78 = getelementptr %6, %6 addrspace(1)* %74, i64 0, i32 5
  %79 = load i64, i64 addrspace(1)* %78, align 8, !tbaa !39
  %80 = and i64 %75, %79
  %81 = getelementptr inbounds %7, %7 addrspace(1)* %77, i64 %80
  store %7 addrspace(1)* %81, %7 addrspace(1)* addrspace(5)* %18, align 8, !tbaa !32
  %82 = bitcast %8 addrspace(1)* addrspace(5)* %19 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %82) #10
  %83 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !32
  %84 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !16
  %85 = getelementptr %6, %6 addrspace(1)* %83, i64 0, i32 1
  %86 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(1)* %85, align 8, !tbaa !40
  %87 = getelementptr %6, %6 addrspace(1)* %83, i64 0, i32 5
  %88 = load i64, i64 addrspace(1)* %87, align 8, !tbaa !39
  %89 = and i64 %84, %88
  %90 = getelementptr inbounds %8, %8 addrspace(1)* %86, i64 %89
  store %8 addrspace(1)* %90, %8 addrspace(1)* addrspace(5)* %19, align 8, !tbaa !32
  %91 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %18, align 8, !tbaa !32
  %92 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %19, align 8, !tbaa !32
  %93 = load i32, i32 addrspace(5)* %5, align 4, !tbaa !34
  %94 = load i64, i64 addrspace(5)* %6, align 8, !tbaa !16
  %95 = load i64, i64 addrspace(5)* %7, align 8, !tbaa !16
  %96 = load i64, i64 addrspace(5)* %8, align 8, !tbaa !16
  %97 = load i64, i64 addrspace(5)* %9, align 8, !tbaa !16
  %98 = load i64, i64 addrspace(5)* %10, align 8, !tbaa !16
  %99 = load i64, i64 addrspace(5)* %11, align 8, !tbaa !16
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !16
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !16
  %102 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !34
  %103 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !34
  %104 = call i64 @llvm.read_register.i64(metadata !22) #14
  %105 = icmp eq i32 %102, %103
  br i1 %105, label %106, label %110

106:                                              ; preds = %62
  %107 = getelementptr inbounds %7, %7 addrspace(1)* %91, i64 0, i32 2
  store i32 %93, i32 addrspace(1)* %107, align 8, !tbaa !41
  %108 = getelementptr inbounds %7, %7 addrspace(1)* %91, i64 0, i32 1
  store i64 %104, i64 addrspace(1)* %108, align 8, !tbaa !43
  %109 = getelementptr inbounds %7, %7 addrspace(1)* %91, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %109, align 4, !tbaa !44
  br label %110

110:                                              ; preds = %62, %106
  %111 = zext i32 %102 to i64
  %112 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 0
  store i64 %94, i64 addrspace(1)* %112, align 8, !tbaa !16
  %113 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 1
  store i64 %95, i64 addrspace(1)* %113, align 8, !tbaa !16
  %114 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 2
  store i64 %96, i64 addrspace(1)* %114, align 8, !tbaa !16
  %115 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 3
  store i64 %97, i64 addrspace(1)* %115, align 8, !tbaa !16
  %116 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 4
  store i64 %98, i64 addrspace(1)* %116, align 8, !tbaa !16
  %117 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 5
  store i64 %99, i64 addrspace(1)* %117, align 8, !tbaa !16
  %118 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 6
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !16
  %119 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 7
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !16
  %120 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !32
  %121 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !16
  %122 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !34
  %123 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !34
  %124 = icmp eq i32 %122, %123
  br i1 %124, label %125, label %157

125:                                              ; preds = %110
  %126 = getelementptr inbounds %6, %6 addrspace(1)* %120, i64 0, i32 4
  %127 = load atomic i64, i64 addrspace(1)* %126 syncscope("one-as") monotonic, align 8
  %128 = getelementptr %6, %6 addrspace(1)* %120, i64 0, i32 0
  %129 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %128, align 8, !tbaa !36
  %130 = getelementptr %6, %6 addrspace(1)* %120, i64 0, i32 5
  %131 = load i64, i64 addrspace(1)* %130, align 8, !tbaa !39
  %132 = and i64 %131, %121
  %133 = getelementptr inbounds %7, %7 addrspace(1)* %129, i64 %132, i32 0
  store i64 %127, i64 addrspace(1)* %133, align 8, !tbaa !45
  %134 = cmpxchg i64 addrspace(1)* %126, i64 %127, i64 %121 syncscope("one-as") release monotonic, align 8
  %135 = extractvalue { i64, i1 } %134, 1
  br i1 %135, label %141, label %136

136:                                              ; preds = %136, %125
  %137 = phi { i64, i1 } [ %139, %136 ], [ %134, %125 ]
  %138 = extractvalue { i64, i1 } %137, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %138, i64 addrspace(1)* %133, align 8, !tbaa !45
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
  %148 = load i64, i64 addrspace(1)* %147, align 16, !tbaa !46
  %149 = icmp eq i64 %148, 0
  br i1 %149, label %157, label %150

150:                                              ; preds = %141
  %151 = inttoptr i64 %148 to i64 addrspace(1)*
  %152 = getelementptr inbounds %10, %10 addrspace(1)* %144, i64 0, i32 3
  %153 = load i32, i32 addrspace(1)* %152, align 8, !tbaa !48
  %154 = zext i32 %153 to i64
  store atomic i64 %154, i64 addrspace(1)* %151 syncscope("one-as") release, align 8
  %155 = call i32 @llvm.amdgcn.readfirstlane(i32 %153)
  %156 = and i32 %155, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %156)
  br label %157

157:                                              ; preds = %110, %141, %150
  %158 = bitcast <2 x i64> addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %158) #10
  %159 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %18, align 8, !tbaa !32
  %160 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %19, align 8, !tbaa !32
  %161 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !34
  %162 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !34
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
  %178 = load i64, i64 addrspace(1)* %176, align 8, !tbaa !16
  %179 = load i64, i64 addrspace(1)* %177, align 8, !tbaa !16
  %180 = insertelement <2 x i64> undef, i64 %178, i64 0
  %181 = insertelement <2 x i64> %180, i64 %179, i64 1
  store <2 x i64> %181, <2 x i64> addrspace(5)* %20, align 16, !tbaa !49
  %182 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !32
  %183 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !16
  %184 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !34
  %185 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !34
  %186 = icmp eq i32 %184, %185
  br i1 %186, label %187, label %207

187:                                              ; preds = %174
  %188 = getelementptr inbounds %6, %6 addrspace(1)* %182, i64 0, i32 5
  %189 = load i64, i64 addrspace(1)* %188, align 8, !tbaa !39
  %190 = add i64 %189, 1
  %191 = add i64 %190, %183
  %192 = icmp eq i64 %191, 0
  %193 = select i1 %192, i64 %190, i64 %191
  %194 = getelementptr inbounds %6, %6 addrspace(1)* %182, i64 0, i32 3
  %195 = load atomic i64, i64 addrspace(1)* %194 syncscope("one-as") monotonic, align 8
  %196 = getelementptr %6, %6 addrspace(1)* %182, i64 0, i32 0
  %197 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %196, align 8, !tbaa !36
  %198 = and i64 %193, %189
  %199 = getelementptr inbounds %7, %7 addrspace(1)* %197, i64 %198, i32 0
  store i64 %195, i64 addrspace(1)* %199, align 8, !tbaa !45
  %200 = cmpxchg i64 addrspace(1)* %194, i64 %195, i64 %193 syncscope("one-as") release monotonic, align 8
  %201 = extractvalue { i64, i1 } %200, 1
  br i1 %201, label %207, label %202

202:                                              ; preds = %202, %187
  %203 = phi { i64, i1 } [ %205, %202 ], [ %200, %187 ]
  %204 = extractvalue { i64, i1 } %203, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %204, i64 addrspace(1)* %199, align 8, !tbaa !45
  %205 = cmpxchg i64 addrspace(1)* %194, i64 %204, i64 %193 syncscope("one-as") release monotonic, align 8
  %206 = extractvalue { i64, i1 } %205, 1
  br i1 %206, label %207, label %202

207:                                              ; preds = %174, %187, %202
  %208 = load <2 x i64>, <2 x i64> addrspace(5)* %20, align 16, !tbaa !49
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
  %9 = load i64, i64 addrspace(4)* %8, align 8, !tbaa !16
  %10 = inttoptr i64 %9 to i8 addrspace(1)*
  %11 = addrspacecast i8 addrspace(1)* %10 to i8*
  %12 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %11, i64 noundef 0, i64 noundef %0) #12
  %13 = extractelement <2 x i64> %12, i64 0
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %25, label %15

15:                                               ; preds = %5
  %16 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %17 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %18 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %17, i32 0)
  %19 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %16, i32 %18)
  %20 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %21 = icmp eq i32 %19, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %15
  %23 = tail call i64 @llvm.ctpop.i64(i64 %20), !range !23
  %24 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %23 syncscope("agent-one-as") monotonic, align 8
  br label %25

25:                                               ; preds = %22, %15, %5
  %26 = inttoptr i64 %13 to i8 addrspace(1)*
  br label %1423

27:                                               ; preds = %3
  %28 = trunc i64 %0 to i32
  %29 = tail call i32 @llvm.umax.i32(i32 %28, i32 16)
  %30 = tail call i32 @llvm.ctlz.i32(i32 %29, i1 false), !range !50
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
  %66 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %64) #12, !srcloc !28
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
  %75 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %73) #12, !srcloc !28
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %1410, label %77

77:                                               ; preds = %71
  %78 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %79 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %80 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %79, i32 0)
  %81 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %78, i32 %80)
  %82 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %81) #12, !srcloc !51
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
  %91 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %92 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %93 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %92, i32 0)
  %94 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %91, i32 %93)
  %95 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %96 = tail call i64 @llvm.ctpop.i64(i64 %95), !range !23
  %97 = trunc i64 %96 to i32
  br label %98

98:                                               ; preds = %631, %90
  %99 = phi i32 [ %94, %90 ], [ %102, %631 ]
  %100 = phi i32 [ %88, %90 ], [ %632, %631 ]
  %101 = phi %3 addrspace(1)* [ undef, %90 ], [ %633, %631 ]
  %102 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %99) #12, !srcloc !51
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
  %113 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !52
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
  %139 = tail call i64 @llvm.cttz.i64(i64 %136, i1 true), !range !23
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
  %176 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %177 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %178 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %177, i32 0)
  %179 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %176, i32 %178)
  br label %180

180:                                              ; preds = %548, %174
  %181 = phi i32 [ %179, %174 ], [ %550, %548 ]
  %182 = phi %3 addrspace(1)* [ undef, %174 ], [ %551, %548 ]
  %183 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %181) #12, !srcloc !51
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
  %202 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %203 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %204 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %203, i32 0)
  %205 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %202, i32 %204)
  %206 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %205) #12, !srcloc !51
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
  %230 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !16
  %231 = inttoptr i64 %230 to i8 addrspace(1)*
  %232 = addrspacecast i8 addrspace(1)* %231 to i8*
  %233 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %232, i64 noundef 0, i64 noundef 6144) #12
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
  %247 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %248 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %249 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %248, i32 0)
  %250 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %247, i32 %249)
  %251 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %252 = tail call i64 @llvm.ctpop.i64(i64 %251), !range !23
  %253 = trunc i64 %252 to i32
  %254 = inttoptr i64 %244 to i64 addrspace(1)*
  %255 = icmp ult i32 %250, 768
  br i1 %255, label %256, label %262

256:                                              ; preds = %246, %256
  %257 = phi i32 [ %260, %256 ], [ %250, %246 ]
  %258 = zext i32 %257 to i64
  %259 = getelementptr inbounds i64, i64 addrspace(1)* %254, i64 %258
  store i64 0, i64 addrspace(1)* %259, align 8, !tbaa !16
  %260 = add i32 %257, %253
  %261 = icmp ult i32 %260, 768
  br i1 %261, label %256, label %262

262:                                              ; preds = %256, %246
  br label %263

263:                                              ; preds = %262, %295
  %264 = phi i32 [ %293, %295 ], [ %226, %262 ]
  %265 = phi i32 [ %273, %295 ], [ %212, %262 ]
  %266 = phi i32 [ %267, %295 ], [ %206, %262 ]
  %267 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %266) #12, !srcloc !51
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
  %277 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !16
  %278 = inttoptr i64 %277 to i8 addrspace(1)*
  %279 = addrspacecast i8 addrspace(1)* %278 to i8*
  %280 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %279, i64 noundef %244, i64 noundef 0) #12
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
  %300 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %301 = tail call i32 @llvm.read_register.i32(metadata !21) #14
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
  %402 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !53
  %403 = icmp ult i64 %401, %402
  br i1 %403, label %404, label %407

404:                                              ; preds = %400
  %405 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %406 = icmp ult i64 %405, %402
  br i1 %406, label %413, label %407

407:                                              ; preds = %404, %400
  %408 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !16
  %409 = inttoptr i64 %408 to i8 addrspace(1)*
  %410 = addrspacecast i8 addrspace(1)* %409 to i8*
  %411 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %410, i64 noundef 0, i64 noundef 2097152) #12
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
  %426 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %427 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %428 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %427, i32 0)
  %429 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %426, i32 %428)
  %430 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %429) #12, !srcloc !51
  %431 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %432 = tail call i64 @llvm.ctpop.i64(i64 %431), !range !23
  %433 = trunc i64 %432 to i32
  %434 = load i32, i32 addrspace(4)* %51, align 4, !tbaa !55
  %435 = load i32, i32 addrspace(4)* %52, align 4, !tbaa !56
  %436 = add i32 %435, 31
  %437 = lshr i32 %436, 5
  br i1 %55, label %461, label %438

438:                                              ; preds = %424
  %439 = icmp ult i32 %430, %437
  br i1 %439, label %446, label %440

440:                                              ; preds = %446, %438
  %441 = mul i32 %434, %433
  %442 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !57
  %443 = mul i32 %434, %430
  %444 = add i32 %442, %443
  %445 = icmp ult i32 %444, %435
  br i1 %445, label %452, label %470

446:                                              ; preds = %438, %446
  %447 = phi i32 [ %450, %446 ], [ %430, %438 ]
  %448 = zext i32 %447 to i64
  %449 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %448
  store i32 0, i32 addrspace(1)* %449, align 4, !tbaa !34
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
  store i32 %455, i32 addrspace(1)* %458, align 4, !tbaa !34
  %459 = add i32 %453, %441
  %460 = icmp ult i32 %459, %435
  br i1 %460, label %452, label %470

461:                                              ; preds = %424
  %462 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !58
  %463 = icmp ult i32 %430, %437
  br i1 %463, label %464, label %470

464:                                              ; preds = %461, %464
  %465 = phi i32 [ %468, %464 ], [ %430, %461 ]
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %466
  store i32 %462, i32 addrspace(1)* %467, align 4, !tbaa !34
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
  %479 = load i32, i32 addrspace(1)* %478, align 4, !tbaa !34
  %480 = or i32 %479, %475
  store i32 %480, i32 addrspace(1)* %478, align 4, !tbaa !34
  br label %481

481:                                              ; preds = %473, %472
  %482 = inttoptr i64 %422 to <4 x i32> addrspace(1)*
  store <4 x i32> %59, <4 x i32> addrspace(1)* %482, align 16, !tbaa !49
  br label %483

483:                                              ; preds = %481, %470
  %484 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 1
  br label %485

485:                                              ; preds = %547, %483
  %486 = phi i32 [ %199, %483 ], [ %502, %547 ]
  %487 = phi i32 [ %189, %483 ], [ %495, %547 ]
  %488 = phi i32 [ %183, %483 ], [ %489, %547 ]
  %489 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %488) #12, !srcloc !51
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
  %506 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !16
  %507 = inttoptr i64 %506 to i8 addrspace(1)*
  %508 = addrspacecast i8 addrspace(1)* %507 to i8*
  %509 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %508, i64 noundef %422, i64 noundef 0) #12
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
  store i32 %495, i32 addrspace(1)* %484, align 4, !tbaa !27
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
  %555 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %556 = tail call i32 @llvm.read_register.i32(metadata !21) #14
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
  %635 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %636 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %637 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %636, i32 0)
  %638 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %635, i32 %637)
  %639 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %640 = tail call i64 @llvm.ctpop.i64(i64 %639), !range !23
  %641 = trunc i64 %640 to i32
  br label %642

642:                                              ; preds = %1295, %634
  %643 = phi i32 [ %43, %634 ], [ %1297, %1295 ]
  %644 = phi i32 [ %638, %634 ], [ %646, %1295 ]
  %645 = phi %3 addrspace(1)* [ undef, %634 ], [ %1298, %1295 ]
  %646 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %644) #12, !srcloc !51
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
  %658 = load i32, i32 addrspace(4)* %657, align 4, !tbaa !59
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
  %685 = tail call i64 @llvm.cttz.i64(i64 %682, i1 true), !range !23
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
  %736 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %737 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %738 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %737, i32 0)
  %739 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %736, i32 %738)
  %740 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %741 = tail call i64 @llvm.ctpop.i64(i64 %740), !range !23
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
  %763 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %760) #12, !srcloc !51
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
  %774 = load i32, i32 addrspace(4)* %745, align 4, !tbaa !52
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
  %800 = tail call i64 @llvm.cttz.i64(i64 %797, i1 true), !range !23
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
  %837 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %838 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %839 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %838, i32 0)
  %840 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %837, i32 %839)
  br label %841

841:                                              ; preds = %1209, %835
  %842 = phi i32 [ %840, %835 ], [ %1211, %1209 ]
  %843 = phi %3 addrspace(1)* [ undef, %835 ], [ %1212, %1209 ]
  %844 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %842) #12, !srcloc !51
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
  %863 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %864 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %865 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %864, i32 0)
  %866 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %863, i32 %865)
  %867 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %866) #12, !srcloc !51
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
  %891 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !16
  %892 = inttoptr i64 %891 to i8 addrspace(1)*
  %893 = addrspacecast i8 addrspace(1)* %892 to i8*
  %894 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %893, i64 noundef 0, i64 noundef 6144) #12
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
  %908 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %909 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %910 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %909, i32 0)
  %911 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %908, i32 %910)
  %912 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %913 = tail call i64 @llvm.ctpop.i64(i64 %912), !range !23
  %914 = trunc i64 %913 to i32
  %915 = inttoptr i64 %905 to i64 addrspace(1)*
  %916 = icmp ult i32 %911, 768
  br i1 %916, label %917, label %923

917:                                              ; preds = %907, %917
  %918 = phi i32 [ %921, %917 ], [ %911, %907 ]
  %919 = zext i32 %918 to i64
  %920 = getelementptr inbounds i64, i64 addrspace(1)* %915, i64 %919
  store i64 0, i64 addrspace(1)* %920, align 8, !tbaa !16
  %921 = add i32 %918, %914
  %922 = icmp ult i32 %921, 768
  br i1 %922, label %917, label %923

923:                                              ; preds = %917, %907
  br label %924

924:                                              ; preds = %923, %956
  %925 = phi i32 [ %954, %956 ], [ %887, %923 ]
  %926 = phi i32 [ %934, %956 ], [ %873, %923 ]
  %927 = phi i32 [ %928, %956 ], [ %867, %923 ]
  %928 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %927) #12, !srcloc !51
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
  %938 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !16
  %939 = inttoptr i64 %938 to i8 addrspace(1)*
  %940 = addrspacecast i8 addrspace(1)* %939 to i8*
  %941 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %940, i64 noundef %905, i64 noundef 0) #12
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
  %961 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %962 = tail call i32 @llvm.read_register.i32(metadata !21) #14
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
  %1063 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !53
  %1064 = icmp ult i64 %1062, %1063
  br i1 %1064, label %1065, label %1068

1065:                                             ; preds = %1061
  %1066 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %1067 = icmp ult i64 %1066, %1063
  br i1 %1067, label %1074, label %1068

1068:                                             ; preds = %1065, %1061
  %1069 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !16
  %1070 = inttoptr i64 %1069 to i8 addrspace(1)*
  %1071 = addrspacecast i8 addrspace(1)* %1070 to i8*
  %1072 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1071, i64 noundef 0, i64 noundef 2097152) #12
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
  %1087 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %1088 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %1089 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1088, i32 0)
  %1090 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1087, i32 %1089)
  %1091 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1090) #12, !srcloc !51
  %1092 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %1093 = tail call i64 @llvm.ctpop.i64(i64 %1092), !range !23
  %1094 = trunc i64 %1093 to i32
  %1095 = load i32, i32 addrspace(4)* %750, align 4, !tbaa !55
  %1096 = load i32, i32 addrspace(4)* %751, align 4, !tbaa !56
  %1097 = add i32 %1096, 31
  %1098 = lshr i32 %1097, 5
  br i1 %754, label %1122, label %1099

1099:                                             ; preds = %1085
  %1100 = icmp ult i32 %1091, %1098
  br i1 %1100, label %1107, label %1101

1101:                                             ; preds = %1107, %1099
  %1102 = mul i32 %1095, %1094
  %1103 = load i32, i32 addrspace(4)* %755, align 4, !tbaa !57
  %1104 = mul i32 %1095, %1091
  %1105 = add i32 %1103, %1104
  %1106 = icmp ult i32 %1105, %1096
  br i1 %1106, label %1113, label %1131

1107:                                             ; preds = %1099, %1107
  %1108 = phi i32 [ %1111, %1107 ], [ %1091, %1099 ]
  %1109 = zext i32 %1108 to i64
  %1110 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1109
  store i32 0, i32 addrspace(1)* %1110, align 4, !tbaa !34
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
  store i32 %1116, i32 addrspace(1)* %1119, align 4, !tbaa !34
  %1120 = add i32 %1114, %1102
  %1121 = icmp ult i32 %1120, %1096
  br i1 %1121, label %1113, label %1131

1122:                                             ; preds = %1085
  %1123 = load i32, i32 addrspace(4)* %756, align 4, !tbaa !58
  %1124 = icmp ult i32 %1091, %1098
  br i1 %1124, label %1125, label %1131

1125:                                             ; preds = %1122, %1125
  %1126 = phi i32 [ %1129, %1125 ], [ %1091, %1122 ]
  %1127 = zext i32 %1126 to i64
  %1128 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1127
  store i32 %1123, i32 addrspace(1)* %1128, align 4, !tbaa !34
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
  %1140 = load i32, i32 addrspace(1)* %1139, align 4, !tbaa !34
  %1141 = or i32 %1140, %1136
  store i32 %1141, i32 addrspace(1)* %1139, align 4, !tbaa !34
  br label %1142

1142:                                             ; preds = %1134, %1133
  %1143 = inttoptr i64 %1083 to <4 x i32> addrspace(1)*
  store <4 x i32> %758, <4 x i32> addrspace(1)* %1143, align 16, !tbaa !49
  br label %1144

1144:                                             ; preds = %1142, %1131
  %1145 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 1
  br label %1146

1146:                                             ; preds = %1208, %1144
  %1147 = phi i32 [ %860, %1144 ], [ %1163, %1208 ]
  %1148 = phi i32 [ %850, %1144 ], [ %1156, %1208 ]
  %1149 = phi i32 [ %844, %1144 ], [ %1150, %1208 ]
  %1150 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1149) #12, !srcloc !51
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
  %1167 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !16
  %1168 = inttoptr i64 %1167 to i8 addrspace(1)*
  %1169 = addrspacecast i8 addrspace(1)* %1168 to i8*
  %1170 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1169, i64 noundef %1083, i64 noundef 0) #12
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
  store i32 %1156, i32 addrspace(1)* %1145, align 4, !tbaa !27
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
  %1216 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %1217 = tail call i32 @llvm.read_register.i32(metadata !21) #14
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
  %1313 = tail call i32 @llvm.read_register.i32(metadata !20) #14
  %1314 = tail call i32 @llvm.read_register.i32(metadata !21) #14
  %1315 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1314, i32 0)
  %1316 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1313, i32 %1315)
  %1317 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1316) #12, !srcloc !51
  %1318 = tail call i64 @llvm.read_register.i64(metadata !22) #14
  %1319 = getelementptr inbounds %3, %3 addrspace(1)* %1312, i64 0, i32 1
  %1320 = load atomic i64, i64 addrspace(1)* %1319 seq_cst, align 8, !tbaa !60
  %1321 = inttoptr i64 %1320 to %5 addrspace(1)*
  %1322 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 0
  %1323 = load i32, i32 addrspace(1)* %1322, align 4, !tbaa !24
  %1324 = icmp eq i32 %1317, 0
  br i1 %1324, label %1325, label %1330

1325:                                             ; preds = %1311
  %1326 = tail call i64 @llvm.ctpop.i64(i64 %1318), !range !23
  %1327 = trunc i64 %1326 to i32
  %1328 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 2
  %1329 = atomicrmw add i32 addrspace(1)* %1328, i32 %1327 syncscope("agent-one-as") monotonic, align 4
  br label %1330

1330:                                             ; preds = %1325, %1311
  %1331 = phi i32 [ %1329, %1325 ], [ 0, %1311 ]
  %1332 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1331)
  %1333 = zext i32 %1323 to i64
  %1334 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 0
  %1335 = load i32, i32 addrspace(4)* %1334, align 4, !tbaa !56
  %1336 = add i32 %1335, 31
  %1337 = lshr i32 %1336, 5
  %1338 = icmp ult i32 %1336, 32
  br i1 %1338, label %1397, label %1339

1339:                                             ; preds = %1330
  %1340 = add i32 %1332, %1317
  %1341 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 7
  %1342 = load i32, i32 addrspace(4)* %1341, align 4, !tbaa !62
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
  %1367 = tail call i32 @llvm.cttz.i32(i32 %1366, i1 false), !range !50
  %1368 = and i32 %1367, 31
  %1369 = shl nuw i32 1, %1368
  %1370 = atomicrmw or i32 addrspace(1)* %1362, i32 %1369 syncscope("agent-one-as") monotonic, align 4
  %1371 = and i32 %1370, %1369
  %1372 = icmp eq i32 %1371, 0
  br i1 %1372, label %1373, label %1382

1373:                                             ; preds = %1365
  %1374 = shl i32 %1358, 5
  %1375 = add i32 %1367, %1374
  %1376 = load i32, i32 addrspace(4)* %1347, align 4, !tbaa !29
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
  %1402 = tail call i64 @llvm.ctpop.i64(i64 %1400), !range !23
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
  %1414 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1412) #12, !srcloc !31
  %1415 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1414, i32 noundef 0, i32 noundef 33) #15
  %1416 = icmp eq i64 %1415, 0
  br i1 %1416, label %1417, label %71

1417:                                             ; preds = %1410, %68, %63
  %1418 = phi i32 [ 0, %63 ], [ %66, %68 ], [ %1411, %1410 ]
  %1419 = phi i8 addrspace(1)* [ %65, %63 ], [ %65, %68 ], [ %1413, %1410 ]
  %1420 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1418) #12, !srcloc !31
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
attributes #12 = { convergent nounwind }
attributes #13 = { readnone }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !9, i64 0}
!15 = distinct !{!15, !12}
!16 = !{!17, !17, i64 0}
!17 = !{!"long", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C/C++ TBAA"}
!20 = !{!"exec_hi"}
!21 = !{!"exec_lo"}
!22 = !{!"exec"}
!23 = !{i64 0, i64 65}
!24 = !{!25, !26, i64 0}
!25 = !{!"slab_s", !26, i64 0, !26, i64 4, !18, i64 8, !26, i64 12, !18, i64 16}
!26 = !{!"int", !18, i64 0}
!27 = !{!25, !26, i64 4}
!28 = !{i64 7014}
!29 = !{!30, !26, i64 12}
!30 = !{!"kind_info_s", !26, i64 0, !26, i64 4, !26, i64 8, !26, i64 12, !26, i64 16, !26, i64 20, !26, i64 24, !26, i64 28}
!31 = !{i64 751}
!32 = !{!33, !33, i64 0}
!33 = !{!"any pointer", !18, i64 0}
!34 = !{!26, !26, i64 0}
!35 = !{i64 2662}
!36 = !{!37, !33, i64 0}
!37 = !{!"", !33, i64 0, !33, i64 8, !38, i64 16, !17, i64 24, !17, i64 32, !17, i64 40}
!38 = !{!"hsa_signal_s", !17, i64 0}
!39 = !{!37, !17, i64 40}
!40 = !{!37, !33, i64 8}
!41 = !{!42, !26, i64 16}
!42 = !{!"", !17, i64 0, !17, i64 8, !26, i64 16, !26, i64 20}
!43 = !{!42, !17, i64 8}
!44 = !{!42, !26, i64 20}
!45 = !{!42, !17, i64 0}
!46 = !{!47, !17, i64 16}
!47 = !{!"amd_signal_s", !17, i64 0, !18, i64 8, !17, i64 16, !26, i64 24, !26, i64 28, !17, i64 32, !17, i64 40, !18, i64 48, !18, i64 56}
!48 = !{!47, !26, i64 24}
!49 = !{!18, !18, i64 0}
!50 = !{i32 0, i32 33}
!51 = !{i64 7137}
!52 = !{!30, !26, i64 8}
!53 = !{!54, !17, i64 108552}
!54 = !{!"heap_s", !18, i64 0, !18, i64 2048, !18, i64 4096, !18, i64 6144, !18, i64 8192, !18, i64 10240, !18, i64 108544, !17, i64 108552, !18, i64 108560, !18, i64 108672}
!55 = !{!30, !26, i64 20}
!56 = !{!30, !26, i64 0}
!57 = !{!30, !26, i64 16}
!58 = !{!30, !26, i64 24}
!59 = !{!30, !26, i64 4}
!60 = !{!61, !18, i64 8}
!61 = !{!"sdata_s", !18, i64 0, !18, i64 8, !18, i64 16}
!62 = !{!30, !26, i64 28}
