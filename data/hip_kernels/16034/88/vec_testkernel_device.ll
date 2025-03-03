; ModuleID = '../data/hip_kernels/16034/88/main.cu'
source_filename = "../data/hip_kernels/16034/88/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @vec_testkernel(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = udiv i32 %14, %11
  %24 = mul i32 %23, %11
  %25 = icmp ugt i32 %14, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %22
  %29 = add i32 %28, %6
  %30 = mul i32 %29, %11
  %31 = add i32 %30, %5
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %2, i64 %32
  %34 = getelementptr inbounds double, double addrspace(1)* %3, i64 %32
  %35 = sitofp i32 %31 to double
  %36 = fmul double %35, 0x3FF250CF662ABF9A
  %37 = fneg double %36
  %38 = tail call double @llvm.fma.f64(double %35, double 0x3FF250CF662ABF9A, double %37)
  %39 = tail call double @llvm.fma.f64(double %35, double 0x3C96EBD950D8F4A6, double %38)
  %40 = fadd double %36, %39
  %41 = fsub double %40, %36
  %42 = fsub double %39, %41
  %43 = tail call double @llvm.fabs.f64(double %36) #3
  %44 = fcmp oeq double %43, 0x7FF0000000000000
  %45 = select i1 %44, double %36, double %40
  %46 = tail call double @llvm.fabs.f64(double %45) #3
  %47 = fcmp oeq double %46, 0x7FF0000000000000
  %48 = select i1 %47, double 0.000000e+00, double %42
  %49 = fmul double %45, 0x3FF71547652B82FE
  %50 = tail call double @llvm.rint.f64(double %49)
  %51 = fneg double %50
  %52 = tail call double @llvm.fma.f64(double %51, double 0x3FE62E42FEFA39EF, double %45)
  %53 = tail call double @llvm.fma.f64(double %51, double 0x3C7ABC9E3B39803F, double %52)
  %54 = tail call double @llvm.fma.f64(double %53, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %55 = tail call double @llvm.fma.f64(double %53, double %54, double 0x3EC71DEE623FDE64)
  %56 = tail call double @llvm.fma.f64(double %53, double %55, double 0x3EFA01997C89E6B0)
  %57 = tail call double @llvm.fma.f64(double %53, double %56, double 0x3F2A01A014761F6E)
  %58 = tail call double @llvm.fma.f64(double %53, double %57, double 0x3F56C16C1852B7B0)
  %59 = tail call double @llvm.fma.f64(double %53, double %58, double 0x3F81111111122322)
  %60 = tail call double @llvm.fma.f64(double %53, double %59, double 0x3FA55555555502A1)
  %61 = tail call double @llvm.fma.f64(double %53, double %60, double 0x3FC5555555555511)
  %62 = tail call double @llvm.fma.f64(double %53, double %61, double 0x3FE000000000000B)
  %63 = tail call double @llvm.fma.f64(double %53, double %62, double 1.000000e+00)
  %64 = tail call double @llvm.fma.f64(double %53, double %63, double 1.000000e+00)
  %65 = fptosi double %50 to i32
  %66 = tail call double @llvm.amdgcn.ldexp.f64(double %64, i32 %65)
  %67 = fcmp ogt double %45, 1.024000e+03
  %68 = select i1 %67, double 0x7FF0000000000000, double %66
  %69 = fcmp olt double %45, -1.075000e+03
  %70 = select i1 %69, double 0.000000e+00, double %68
  %71 = tail call double @llvm.fma.f64(double %70, double %48, double %70)
  %72 = tail call double @llvm.fabs.f64(double %70) #3
  %73 = fcmp oeq double %72, 0x7FF0000000000000
  %74 = select i1 %73, double %70, double %71
  %75 = tail call double @llvm.fabs.f64(double %74)
  %76 = icmp eq i32 %31, 0
  %77 = select i1 %76, double 1.000000e+00, double %75
  %78 = fcmp olt double %77, 0x1000000000000000
  %79 = select i1 %78, double 0x4FF0000000000000, double 1.000000e+00
  %80 = fmul double %77, %79
  %81 = tail call double @llvm.amdgcn.rsq.f64(double %80)
  %82 = fmul double %80, %81
  %83 = fmul double %81, 5.000000e-01
  %84 = fneg double %83
  %85 = tail call double @llvm.fma.f64(double %84, double %82, double 5.000000e-01)
  %86 = tail call double @llvm.fma.f64(double %83, double %85, double %83)
  %87 = tail call double @llvm.fma.f64(double %82, double %85, double %82)
  %88 = fneg double %87
  %89 = tail call double @llvm.fma.f64(double %88, double %87, double %80)
  %90 = tail call double @llvm.fma.f64(double %89, double %86, double %87)
  %91 = fneg double %90
  %92 = tail call double @llvm.fma.f64(double %91, double %90, double %80)
  %93 = tail call double @llvm.fma.f64(double %92, double %86, double %90)
  %94 = select i1 %78, double 0x37F0000000000000, double 1.000000e+00
  %95 = fmul double %94, %93
  %96 = fcmp oeq double %80, 0.000000e+00
  %97 = fcmp oeq double %80, 0x7FF0000000000000
  %98 = or i1 %96, %97
  %99 = select i1 %98, double %80, double %95
  %100 = getelementptr inbounds double, double addrspace(1)* %1, i64 %32
  %101 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %102 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %103 = fmul contract double %101, %102
  %104 = fadd contract double %99, %103
  store double %104, double addrspace(1)* %100, align 8, !tbaa !16
  %105 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %106 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %107 = fmul contract double %105, %106
  %108 = fadd contract double %99, %107
  store double %108, double addrspace(1)* %100, align 8, !tbaa !16
  %109 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %110 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %111 = fmul contract double %109, %110
  %112 = fadd contract double %99, %111
  store double %112, double addrspace(1)* %100, align 8, !tbaa !16
  %113 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %114 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %115 = fmul contract double %113, %114
  %116 = fadd contract double %99, %115
  store double %116, double addrspace(1)* %100, align 8, !tbaa !16
  %117 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %118 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %119 = fmul contract double %117, %118
  %120 = fadd contract double %99, %119
  store double %120, double addrspace(1)* %100, align 8, !tbaa !16
  %121 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %122 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %123 = fmul contract double %121, %122
  %124 = fadd contract double %99, %123
  store double %124, double addrspace(1)* %100, align 8, !tbaa !16
  %125 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %126 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %127 = fmul contract double %125, %126
  %128 = fadd contract double %99, %127
  store double %128, double addrspace(1)* %100, align 8, !tbaa !16
  %129 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %130 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %131 = fmul contract double %129, %130
  %132 = fadd contract double %99, %131
  store double %132, double addrspace(1)* %100, align 8, !tbaa !16
  %133 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %134 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %135 = fmul contract double %133, %134
  %136 = fadd contract double %99, %135
  store double %136, double addrspace(1)* %100, align 8, !tbaa !16
  %137 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %138 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %139 = fmul contract double %137, %138
  %140 = fadd contract double %99, %139
  store double %140, double addrspace(1)* %100, align 8, !tbaa !16
  %141 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %142 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %143 = fmul contract double %141, %142
  %144 = fadd contract double %99, %143
  store double %144, double addrspace(1)* %100, align 8, !tbaa !16
  %145 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %146 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %147 = fmul contract double %145, %146
  %148 = fadd contract double %99, %147
  store double %148, double addrspace(1)* %100, align 8, !tbaa !16
  %149 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %150 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %151 = fmul contract double %149, %150
  %152 = fadd contract double %99, %151
  store double %152, double addrspace(1)* %100, align 8, !tbaa !16
  %153 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %154 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %155 = fmul contract double %153, %154
  %156 = fadd contract double %99, %155
  store double %156, double addrspace(1)* %100, align 8, !tbaa !16
  %157 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %158 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %159 = fmul contract double %157, %158
  %160 = fadd contract double %99, %159
  store double %160, double addrspace(1)* %100, align 8, !tbaa !16
  %161 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %162 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %163 = fmul contract double %161, %162
  %164 = fadd contract double %99, %163
  store double %164, double addrspace(1)* %100, align 8, !tbaa !16
  %165 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %166 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %167 = fmul contract double %165, %166
  %168 = fadd contract double %99, %167
  store double %168, double addrspace(1)* %100, align 8, !tbaa !16
  %169 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %170 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %171 = fmul contract double %169, %170
  %172 = fadd contract double %99, %171
  store double %172, double addrspace(1)* %100, align 8, !tbaa !16
  %173 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %174 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %175 = fmul contract double %173, %174
  %176 = fadd contract double %99, %175
  store double %176, double addrspace(1)* %100, align 8, !tbaa !16
  %177 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %178 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %179 = fmul contract double %177, %178
  %180 = fadd contract double %99, %179
  store double %180, double addrspace(1)* %100, align 8, !tbaa !16
  %181 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %182 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %183 = fmul contract double %181, %182
  %184 = fadd contract double %99, %183
  store double %184, double addrspace(1)* %100, align 8, !tbaa !16
  %185 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %186 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %187 = fmul contract double %185, %186
  %188 = fadd contract double %99, %187
  store double %188, double addrspace(1)* %100, align 8, !tbaa !16
  %189 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %190 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %191 = fmul contract double %189, %190
  %192 = fadd contract double %99, %191
  store double %192, double addrspace(1)* %100, align 8, !tbaa !16
  %193 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %194 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %195 = fmul contract double %193, %194
  %196 = fadd contract double %99, %195
  store double %196, double addrspace(1)* %100, align 8, !tbaa !16
  %197 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %198 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %199 = fmul contract double %197, %198
  %200 = fadd contract double %99, %199
  store double %200, double addrspace(1)* %100, align 8, !tbaa !16
  %201 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %202 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %203 = fmul contract double %201, %202
  %204 = fadd contract double %99, %203
  store double %204, double addrspace(1)* %100, align 8, !tbaa !16
  %205 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %206 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %207 = fmul contract double %205, %206
  %208 = fadd contract double %99, %207
  store double %208, double addrspace(1)* %100, align 8, !tbaa !16
  %209 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %210 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %211 = fmul contract double %209, %210
  %212 = fadd contract double %99, %211
  store double %212, double addrspace(1)* %100, align 8, !tbaa !16
  %213 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %214 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %215 = fmul contract double %213, %214
  %216 = fadd contract double %99, %215
  store double %216, double addrspace(1)* %100, align 8, !tbaa !16
  %217 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %218 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %219 = fmul contract double %217, %218
  %220 = fadd contract double %99, %219
  store double %220, double addrspace(1)* %100, align 8, !tbaa !16
  %221 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %222 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %223 = fmul contract double %221, %222
  %224 = fadd contract double %99, %223
  store double %224, double addrspace(1)* %100, align 8, !tbaa !16
  %225 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %226 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %227 = fmul contract double %225, %226
  %228 = fadd contract double %99, %227
  store double %228, double addrspace(1)* %100, align 8, !tbaa !16
  %229 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %230 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %231 = fmul contract double %229, %230
  %232 = fadd contract double %99, %231
  store double %232, double addrspace(1)* %100, align 8, !tbaa !16
  %233 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %234 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %235 = fmul contract double %233, %234
  %236 = fadd contract double %99, %235
  store double %236, double addrspace(1)* %100, align 8, !tbaa !16
  %237 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %238 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %239 = fmul contract double %237, %238
  %240 = fadd contract double %99, %239
  store double %240, double addrspace(1)* %100, align 8, !tbaa !16
  %241 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %242 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %243 = fmul contract double %241, %242
  %244 = fadd contract double %99, %243
  store double %244, double addrspace(1)* %100, align 8, !tbaa !16
  %245 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %246 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %247 = fmul contract double %245, %246
  %248 = fadd contract double %99, %247
  store double %248, double addrspace(1)* %100, align 8, !tbaa !16
  %249 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %250 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %251 = fmul contract double %249, %250
  %252 = fadd contract double %99, %251
  store double %252, double addrspace(1)* %100, align 8, !tbaa !16
  %253 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %254 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %255 = fmul contract double %253, %254
  %256 = fadd contract double %99, %255
  store double %256, double addrspace(1)* %100, align 8, !tbaa !16
  %257 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %258 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %259 = fmul contract double %257, %258
  %260 = fadd contract double %99, %259
  store double %260, double addrspace(1)* %100, align 8, !tbaa !16
  %261 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %262 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %263 = fmul contract double %261, %262
  %264 = fadd contract double %99, %263
  store double %264, double addrspace(1)* %100, align 8, !tbaa !16
  %265 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %266 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %267 = fmul contract double %265, %266
  %268 = fadd contract double %99, %267
  store double %268, double addrspace(1)* %100, align 8, !tbaa !16
  %269 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %270 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %271 = fmul contract double %269, %270
  %272 = fadd contract double %99, %271
  store double %272, double addrspace(1)* %100, align 8, !tbaa !16
  %273 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %274 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %275 = fmul contract double %273, %274
  %276 = fadd contract double %99, %275
  store double %276, double addrspace(1)* %100, align 8, !tbaa !16
  %277 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %278 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %279 = fmul contract double %277, %278
  %280 = fadd contract double %99, %279
  store double %280, double addrspace(1)* %100, align 8, !tbaa !16
  %281 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %282 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %283 = fmul contract double %281, %282
  %284 = fadd contract double %99, %283
  store double %284, double addrspace(1)* %100, align 8, !tbaa !16
  %285 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %286 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %287 = fmul contract double %285, %286
  %288 = fadd contract double %99, %287
  store double %288, double addrspace(1)* %100, align 8, !tbaa !16
  %289 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %290 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %291 = fmul contract double %289, %290
  %292 = fadd contract double %99, %291
  store double %292, double addrspace(1)* %100, align 8, !tbaa !16
  %293 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %294 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %295 = fmul contract double %293, %294
  %296 = fadd contract double %99, %295
  store double %296, double addrspace(1)* %100, align 8, !tbaa !16
  %297 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %298 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %299 = fmul contract double %297, %298
  %300 = fadd contract double %99, %299
  store double %300, double addrspace(1)* %100, align 8, !tbaa !16
  %301 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %302 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %303 = fmul contract double %301, %302
  %304 = fadd contract double %99, %303
  store double %304, double addrspace(1)* %100, align 8, !tbaa !16
  %305 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %306 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %307 = fmul contract double %305, %306
  %308 = fadd contract double %99, %307
  store double %308, double addrspace(1)* %100, align 8, !tbaa !16
  %309 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %310 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %311 = fmul contract double %309, %310
  %312 = fadd contract double %99, %311
  store double %312, double addrspace(1)* %100, align 8, !tbaa !16
  %313 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %314 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %315 = fmul contract double %313, %314
  %316 = fadd contract double %99, %315
  store double %316, double addrspace(1)* %100, align 8, !tbaa !16
  %317 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %318 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %319 = fmul contract double %317, %318
  %320 = fadd contract double %99, %319
  store double %320, double addrspace(1)* %100, align 8, !tbaa !16
  %321 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %322 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %323 = fmul contract double %321, %322
  %324 = fadd contract double %99, %323
  store double %324, double addrspace(1)* %100, align 8, !tbaa !16
  %325 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %326 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %327 = fmul contract double %325, %326
  %328 = fadd contract double %99, %327
  store double %328, double addrspace(1)* %100, align 8, !tbaa !16
  %329 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %330 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %331 = fmul contract double %329, %330
  %332 = fadd contract double %99, %331
  store double %332, double addrspace(1)* %100, align 8, !tbaa !16
  %333 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %334 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %335 = fmul contract double %333, %334
  %336 = fadd contract double %99, %335
  store double %336, double addrspace(1)* %100, align 8, !tbaa !16
  %337 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %338 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %339 = fmul contract double %337, %338
  %340 = fadd contract double %99, %339
  store double %340, double addrspace(1)* %100, align 8, !tbaa !16
  %341 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %342 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %343 = fmul contract double %341, %342
  %344 = fadd contract double %99, %343
  store double %344, double addrspace(1)* %100, align 8, !tbaa !16
  %345 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %346 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %347 = fmul contract double %345, %346
  %348 = fadd contract double %99, %347
  store double %348, double addrspace(1)* %100, align 8, !tbaa !16
  %349 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %350 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %351 = fmul contract double %349, %350
  %352 = fadd contract double %99, %351
  store double %352, double addrspace(1)* %100, align 8, !tbaa !16
  %353 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %354 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %355 = fmul contract double %353, %354
  %356 = fadd contract double %99, %355
  store double %356, double addrspace(1)* %100, align 8, !tbaa !16
  %357 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %358 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %359 = fmul contract double %357, %358
  %360 = fadd contract double %99, %359
  store double %360, double addrspace(1)* %100, align 8, !tbaa !16
  %361 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %362 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %363 = fmul contract double %361, %362
  %364 = fadd contract double %99, %363
  store double %364, double addrspace(1)* %100, align 8, !tbaa !16
  %365 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %366 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %367 = fmul contract double %365, %366
  %368 = fadd contract double %99, %367
  store double %368, double addrspace(1)* %100, align 8, !tbaa !16
  %369 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %370 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %371 = fmul contract double %369, %370
  %372 = fadd contract double %99, %371
  store double %372, double addrspace(1)* %100, align 8, !tbaa !16
  %373 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %374 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %375 = fmul contract double %373, %374
  %376 = fadd contract double %99, %375
  store double %376, double addrspace(1)* %100, align 8, !tbaa !16
  %377 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %378 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %379 = fmul contract double %377, %378
  %380 = fadd contract double %99, %379
  store double %380, double addrspace(1)* %100, align 8, !tbaa !16
  %381 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %382 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %383 = fmul contract double %381, %382
  %384 = fadd contract double %99, %383
  store double %384, double addrspace(1)* %100, align 8, !tbaa !16
  %385 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %386 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %387 = fmul contract double %385, %386
  %388 = fadd contract double %99, %387
  store double %388, double addrspace(1)* %100, align 8, !tbaa !16
  %389 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %390 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %391 = fmul contract double %389, %390
  %392 = fadd contract double %99, %391
  store double %392, double addrspace(1)* %100, align 8, !tbaa !16
  %393 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %394 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %395 = fmul contract double %393, %394
  %396 = fadd contract double %99, %395
  store double %396, double addrspace(1)* %100, align 8, !tbaa !16
  %397 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %398 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %399 = fmul contract double %397, %398
  %400 = fadd contract double %99, %399
  store double %400, double addrspace(1)* %100, align 8, !tbaa !16
  %401 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %402 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %403 = fmul contract double %401, %402
  %404 = fadd contract double %99, %403
  store double %404, double addrspace(1)* %100, align 8, !tbaa !16
  %405 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %406 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %407 = fmul contract double %405, %406
  %408 = fadd contract double %99, %407
  store double %408, double addrspace(1)* %100, align 8, !tbaa !16
  %409 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %410 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %411 = fmul contract double %409, %410
  %412 = fadd contract double %99, %411
  store double %412, double addrspace(1)* %100, align 8, !tbaa !16
  %413 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %414 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %415 = fmul contract double %413, %414
  %416 = fadd contract double %99, %415
  store double %416, double addrspace(1)* %100, align 8, !tbaa !16
  %417 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %418 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %419 = fmul contract double %417, %418
  %420 = fadd contract double %99, %419
  store double %420, double addrspace(1)* %100, align 8, !tbaa !16
  %421 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %422 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %423 = fmul contract double %421, %422
  %424 = fadd contract double %99, %423
  store double %424, double addrspace(1)* %100, align 8, !tbaa !16
  %425 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %426 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %427 = fmul contract double %425, %426
  %428 = fadd contract double %99, %427
  store double %428, double addrspace(1)* %100, align 8, !tbaa !16
  %429 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %430 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %431 = fmul contract double %429, %430
  %432 = fadd contract double %99, %431
  store double %432, double addrspace(1)* %100, align 8, !tbaa !16
  %433 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %434 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %435 = fmul contract double %433, %434
  %436 = fadd contract double %99, %435
  store double %436, double addrspace(1)* %100, align 8, !tbaa !16
  %437 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %438 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %439 = fmul contract double %437, %438
  %440 = fadd contract double %99, %439
  store double %440, double addrspace(1)* %100, align 8, !tbaa !16
  %441 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %442 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %443 = fmul contract double %441, %442
  %444 = fadd contract double %99, %443
  store double %444, double addrspace(1)* %100, align 8, !tbaa !16
  %445 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %446 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %447 = fmul contract double %445, %446
  %448 = fadd contract double %99, %447
  store double %448, double addrspace(1)* %100, align 8, !tbaa !16
  %449 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %450 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %451 = fmul contract double %449, %450
  %452 = fadd contract double %99, %451
  store double %452, double addrspace(1)* %100, align 8, !tbaa !16
  %453 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %454 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %455 = fmul contract double %453, %454
  %456 = fadd contract double %99, %455
  store double %456, double addrspace(1)* %100, align 8, !tbaa !16
  %457 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %458 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %459 = fmul contract double %457, %458
  %460 = fadd contract double %99, %459
  store double %460, double addrspace(1)* %100, align 8, !tbaa !16
  %461 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %462 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %463 = fmul contract double %461, %462
  %464 = fadd contract double %99, %463
  store double %464, double addrspace(1)* %100, align 8, !tbaa !16
  %465 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %466 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %467 = fmul contract double %465, %466
  %468 = fadd contract double %99, %467
  store double %468, double addrspace(1)* %100, align 8, !tbaa !16
  %469 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %470 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %471 = fmul contract double %469, %470
  %472 = fadd contract double %99, %471
  store double %472, double addrspace(1)* %100, align 8, !tbaa !16
  %473 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %474 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %475 = fmul contract double %473, %474
  %476 = fadd contract double %99, %475
  store double %476, double addrspace(1)* %100, align 8, !tbaa !16
  %477 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %478 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %479 = fmul contract double %477, %478
  %480 = fadd contract double %99, %479
  store double %480, double addrspace(1)* %100, align 8, !tbaa !16
  %481 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %482 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %483 = fmul contract double %481, %482
  %484 = fadd contract double %99, %483
  store double %484, double addrspace(1)* %100, align 8, !tbaa !16
  %485 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %486 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %487 = fmul contract double %485, %486
  %488 = fadd contract double %99, %487
  store double %488, double addrspace(1)* %100, align 8, !tbaa !16
  %489 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %490 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %491 = fmul contract double %489, %490
  %492 = fadd contract double %99, %491
  store double %492, double addrspace(1)* %100, align 8, !tbaa !16
  %493 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %494 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %495 = fmul contract double %493, %494
  %496 = fadd contract double %99, %495
  store double %496, double addrspace(1)* %100, align 8, !tbaa !16
  %497 = load double, double addrspace(1)* %33, align 8, !tbaa !16
  %498 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %499 = fmul contract double %497, %498
  %500 = fadd contract double %99, %499
  store double %500, double addrspace(1)* %100, align 8, !tbaa !16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
