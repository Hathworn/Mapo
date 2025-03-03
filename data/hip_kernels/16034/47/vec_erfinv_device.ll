; ModuleID = '../data/hip_kernels/16034/47/main.cu'
source_filename = "../data/hip_kernels/16034/47/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erfinv(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %380

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp olt double %36, 3.750000e-01
  br i1 %37, label %38, label %56

38:                                               ; preds = %32
  %39 = fmul double %35, %35
  %40 = tail call double @llvm.fma.f64(double %39, double 0x3FDC5EC06CD8002B, double 0xBFEBB7DD47AEF0D6)
  %41 = tail call double @llvm.fma.f64(double %39, double %40, double 0x3FED189992ECCDB6)
  %42 = tail call double @llvm.fma.f64(double %39, double %41, double 0xBFE10EC180CDE957)
  %43 = tail call double @llvm.fma.f64(double %39, double %42, double 0x3FD05CCE379DD66F)
  %44 = tail call double @llvm.fma.f64(double %39, double %43, double 0xBFA6B9067E3DAE74)
  %45 = tail call double @llvm.fma.f64(double %39, double %44, double 0x3FA5F7F0487C11A3)
  %46 = tail call double @llvm.fma.f64(double %39, double %45, double 0x3F9E0FBF22B2350C)
  %47 = tail call double @llvm.fma.f64(double %39, double %46, double 0x3FA2CE26322B7F90)
  %48 = tail call double @llvm.fma.f64(double %39, double %47, double 0x3FA5EBEEEE81DD31)
  %49 = tail call double @llvm.fma.f64(double %39, double %48, double 0x3FAA7CACB897F0D4)
  %50 = tail call double @llvm.fma.f64(double %39, double %49, double 0x3FB0A130D62CBA32)
  %51 = tail call double @llvm.fma.f64(double %39, double %50, double 0x3FB62847C8653359)
  %52 = tail call double @llvm.fma.f64(double %39, double %51, double 0x3FC053C2C0A5E083)
  %53 = tail call double @llvm.fma.f64(double %39, double %52, double 0x3FCDB29FB2FEEC72)
  %54 = tail call double @llvm.fma.f64(double %39, double %53, double 0x3FEC5BF891B4EF6A)
  %55 = fmul double %36, %54
  br label %372

56:                                               ; preds = %32
  %57 = fcmp olt double %36, 0x3FEFFFE000000000
  br i1 %57, label %58, label %236

58:                                               ; preds = %56
  %59 = fneg double %36
  %60 = tail call double @llvm.fma.f64(double %59, double %36, double 1.000000e+00)
  %61 = tail call double @llvm.amdgcn.frexp.mant.f64(double %60)
  %62 = fcmp olt double %61, 0x3FE5555555555555
  %63 = zext i1 %62 to i32
  %64 = tail call double @llvm.amdgcn.ldexp.f64(double %61, i32 %63)
  %65 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %60)
  %66 = sub nsw i32 %65, %63
  %67 = fadd double %64, -1.000000e+00
  %68 = fadd double %64, 1.000000e+00
  %69 = fadd double %68, -1.000000e+00
  %70 = fsub double %64, %69
  %71 = tail call double @llvm.amdgcn.rcp.f64(double %68)
  %72 = fneg double %68
  %73 = tail call double @llvm.fma.f64(double %72, double %71, double 1.000000e+00)
  %74 = tail call double @llvm.fma.f64(double %73, double %71, double %71)
  %75 = tail call double @llvm.fma.f64(double %72, double %74, double 1.000000e+00)
  %76 = tail call double @llvm.fma.f64(double %75, double %74, double %74)
  %77 = fmul double %67, %76
  %78 = fmul double %68, %77
  %79 = fneg double %78
  %80 = tail call double @llvm.fma.f64(double %77, double %68, double %79)
  %81 = tail call double @llvm.fma.f64(double %77, double %70, double %80)
  %82 = fadd double %78, %81
  %83 = fsub double %82, %78
  %84 = fsub double %81, %83
  %85 = fsub double %67, %82
  %86 = fsub double %67, %85
  %87 = fsub double %86, %82
  %88 = fsub double %87, %84
  %89 = fadd double %85, %88
  %90 = fmul double %76, %89
  %91 = fadd double %77, %90
  %92 = fsub double %91, %77
  %93 = fsub double %90, %92
  %94 = fmul double %91, %91
  %95 = tail call double @llvm.fma.f64(double %94, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %96 = tail call double @llvm.fma.f64(double %94, double %95, double 0x3FC7474DD7F4DF2E)
  %97 = tail call double @llvm.fma.f64(double %94, double %96, double 0x3FCC71C016291751)
  %98 = tail call double @llvm.fma.f64(double %94, double %97, double 0x3FD249249B27ACF1)
  %99 = tail call double @llvm.fma.f64(double %94, double %98, double 0x3FD99999998EF7B6)
  %100 = tail call double @llvm.fma.f64(double %94, double %99, double 0x3FE5555555555780)
  %101 = tail call double @llvm.amdgcn.ldexp.f64(double %91, i32 1)
  %102 = tail call double @llvm.amdgcn.ldexp.f64(double %93, i32 1)
  %103 = fmul double %91, %94
  %104 = fmul double %103, %100
  %105 = fadd double %101, %104
  %106 = fsub double %105, %101
  %107 = fsub double %104, %106
  %108 = fadd double %102, %107
  %109 = fadd double %105, %108
  %110 = fsub double %109, %105
  %111 = fsub double %108, %110
  %112 = sitofp i32 %66 to double
  %113 = fmul double %112, 0x3FE62E42FEFA39EF
  %114 = fneg double %113
  %115 = tail call double @llvm.fma.f64(double %112, double 0x3FE62E42FEFA39EF, double %114)
  %116 = tail call double @llvm.fma.f64(double %112, double 0x3C7ABC9E3B39803F, double %115)
  %117 = fadd double %113, %116
  %118 = fsub double %117, %113
  %119 = fsub double %116, %118
  %120 = fadd double %117, %109
  %121 = fsub double %120, %117
  %122 = fsub double %120, %121
  %123 = fsub double %117, %122
  %124 = fsub double %109, %121
  %125 = fadd double %124, %123
  %126 = fadd double %119, %111
  %127 = fsub double %126, %119
  %128 = fsub double %126, %127
  %129 = fsub double %119, %128
  %130 = fsub double %111, %127
  %131 = fadd double %130, %129
  %132 = fadd double %126, %125
  %133 = fadd double %120, %132
  %134 = fsub double %133, %120
  %135 = fsub double %132, %134
  %136 = fadd double %131, %135
  %137 = fadd double %133, %136
  %138 = tail call double @llvm.fabs.f64(double %60) #3
  %139 = fcmp oeq double %138, 0x7FF0000000000000
  %140 = select i1 %139, double %60, double %137
  %141 = fcmp olt double %60, 0.000000e+00
  %142 = select i1 %141, double 0x7FF8000000000000, double %140
  %143 = fcmp oeq double %60, 0.000000e+00
  %144 = select i1 %143, double 0xFFF0000000000000, double %142
  %145 = fcmp ogt double %144, -6.250000e+00
  br i1 %145, label %146, label %170

146:                                              ; preds = %58
  %147 = fsub double -3.125000e+00, %144
  %148 = tail call double @llvm.fma.f64(double %147, double 0xBBB135D2E746E627, double 0xBC08DDF93324D327)
  %149 = tail call double @llvm.fma.f64(double %147, double %148, double 0x3C37B83EEF0B7C9F)
  %150 = tail call double @llvm.fma.f64(double %147, double %149, double 0x3C69BA72CD589B91)
  %151 = tail call double @llvm.fma.f64(double %147, double %150, double 0xBCA33689090A6B96)
  %152 = tail call double @llvm.fma.f64(double %147, double %151, double 0x3C782E11898132E0)
  %153 = tail call double @llvm.fma.f64(double %147, double %152, double 0x3CFDE4ACFD9E26BA)
  %154 = tail call double @llvm.fma.f64(double %147, double %153, double 0xBD26D33EED66C487)
  %155 = tail call double @llvm.fma.f64(double %147, double %154, double 0xBD36F2167040D8E2)
  %156 = tail call double @llvm.fma.f64(double %147, double %155, double 0x3D872A22C2D77E20)
  %157 = tail call double @llvm.fma.f64(double %147, double %156, double 0xBDAC8859C4E5C0AF)
  %158 = tail call double @llvm.fma.f64(double %147, double %157, double 0xBDCDC583D118A561)
  %159 = tail call double @llvm.fma.f64(double %147, double %158, double 0x3E120F47CCF46B3C)
  %160 = tail call double @llvm.fma.f64(double %147, double %159, double 0xBE31A9E38DC84D60)
  %161 = tail call double @llvm.fma.f64(double %147, double %160, double 0xBE5F36CD6D3D46A9)
  %162 = tail call double @llvm.fma.f64(double %147, double %161, double 0x3E9C6B4F5D03B787)
  %163 = tail call double @llvm.fma.f64(double %147, double %162, double 0xBEB6E8A5434AE8A2)
  %164 = tail call double @llvm.fma.f64(double %147, double %163, double 0xBEED1D1F7B8736F6)
  %165 = tail call double @llvm.fma.f64(double %147, double %164, double 0x3F2879C2A212F024)
  %166 = tail call double @llvm.fma.f64(double %147, double %165, double 0xBF4845769484FCA8)
  %167 = tail call double @llvm.fma.f64(double %147, double %166, double 0xBF78B6C33114F909)
  %168 = tail call double @llvm.fma.f64(double %147, double %167, double 0x3FCEBD80D9B13E28)
  %169 = tail call double @llvm.fma.f64(double %147, double %168, double 0x3FFA755E7C99AE86)
  br label %233

170:                                              ; preds = %58
  %171 = fneg double %144
  %172 = fcmp ogt double %144, -1.600000e+01
  %173 = fcmp ogt double %144, 0x9000000000000000
  %174 = select i1 %173, double 0x4FF0000000000000, double 1.000000e+00
  %175 = fmul double %174, %171
  %176 = tail call double @llvm.amdgcn.rsq.f64(double %175)
  %177 = fmul double %175, %176
  %178 = fmul double %176, 5.000000e-01
  %179 = fneg double %178
  %180 = tail call double @llvm.fma.f64(double %179, double %177, double 5.000000e-01)
  %181 = tail call double @llvm.fma.f64(double %178, double %180, double %178)
  %182 = tail call double @llvm.fma.f64(double %177, double %180, double %177)
  %183 = fneg double %182
  %184 = tail call double @llvm.fma.f64(double %183, double %182, double %175)
  %185 = tail call double @llvm.fma.f64(double %184, double %181, double %182)
  %186 = fneg double %185
  %187 = tail call double @llvm.fma.f64(double %186, double %185, double %175)
  %188 = tail call double @llvm.fma.f64(double %187, double %181, double %185)
  %189 = select i1 %173, double 0x37F0000000000000, double 1.000000e+00
  %190 = fmul double %189, %188
  %191 = fcmp oeq double %175, 0.000000e+00
  %192 = fcmp oeq double %175, 0x7FF0000000000000
  %193 = or i1 %191, %192
  %194 = select i1 %193, double %175, double %190
  br i1 %172, label %195, label %215

195:                                              ; preds = %170
  %196 = fadd double %194, -3.250000e+00
  %197 = tail call double @llvm.fma.f64(double %196, double 0x3E23040F87DBD932, double 0x3E785CBE52878635)
  %198 = tail call double @llvm.fma.f64(double %196, double %197, double 0xBE92777453DD3955)
  %199 = tail call double @llvm.fma.f64(double %196, double %198, double 0x3E5395ABCD554C6C)
  %200 = tail call double @llvm.fma.f64(double %196, double %199, double 0x3EB936388A3790AD)
  %201 = tail call double @llvm.fma.f64(double %196, double %200, double 0xBED0D5DB812B5083)
  %202 = tail call double @llvm.fma.f64(double %196, double %201, double 0x3EC8860CD5D652F6)
  %203 = tail call double @llvm.fma.f64(double %196, double %202, double 0x3EEA29A0CACDFB23)
  %204 = tail call double @llvm.fma.f64(double %196, double %203, double 0xBF08CEF1F80281F2)
  %205 = tail call double @llvm.fma.f64(double %196, double %204, double 0x3F11E684D0B9188A)
  %206 = tail call double @llvm.fma.f64(double %196, double %205, double 0x3EF932CD54C8A222)
  %207 = tail call double @llvm.fma.f64(double %196, double %206, double 0xBF37448A89EF8AA3)
  %208 = tail call double @llvm.fma.f64(double %196, double %207, double 0x3F4F3CC55AD40C25)
  %209 = tail call double @llvm.fma.f64(double %196, double %208, double 0xBF5BA924132F38B1)
  %210 = tail call double @llvm.fma.f64(double %196, double %209, double 0x3F6468EECA533CF8)
  %211 = tail call double @llvm.fma.f64(double %196, double %210, double 0xBF6EBADABB891BBD)
  %212 = tail call double @llvm.fma.f64(double %196, double %211, double 0x3F75FFCFE5B76AFC)
  %213 = tail call double @llvm.fma.f64(double %196, double %212, double 0x3FF0158A6D641D39)
  %214 = tail call double @llvm.fma.f64(double %196, double %213, double 0x4008ABCC380D5A48)
  br label %233

215:                                              ; preds = %170
  %216 = fadd double %194, -5.000000e+00
  %217 = tail call double @llvm.fma.f64(double %216, double 0xBDBDCEC3A7785389, double 0xBDF18FEEC0E38727)
  %218 = tail call double @llvm.fma.f64(double %216, double %217, double 0x3E19E6BF2DDA45E3)
  %219 = tail call double @llvm.fma.f64(double %216, double %218, double 0xBE30468FB24E2F5F)
  %220 = tail call double @llvm.fma.f64(double %216, double %219, double 0x3E405AC6A8FBA182)
  %221 = tail call double @llvm.fma.f64(double %216, double %220, double 0xBE50102E495FB9C0)
  %222 = tail call double @llvm.fma.f64(double %216, double %221, double 0x3E5F4C20E1334AF8)
  %223 = tail call double @llvm.fma.f64(double %216, double %222, double 0xBE722D220FDF9C3E)
  %224 = tail call double @llvm.fma.f64(double %216, double %223, double 0x3E8EBC8BB824CB54)
  %225 = tail call double @llvm.fma.f64(double %216, double %224, double 0xBEB0A8D40EA372CC)
  %226 = tail call double @llvm.fma.f64(double %216, double %225, double 0x3ED2FBD29D093D2B)
  %227 = tail call double @llvm.fma.f64(double %216, double %226, double 0xBEF4A3497E1E0FAC)
  %228 = tail call double @llvm.fma.f64(double %216, double %227, double 0x3F13EBF4EB00938F)
  %229 = tail call double @llvm.fma.f64(double %216, double %228, double 0xBF2C2F36A8FC5D53)
  %230 = tail call double @llvm.fma.f64(double %216, double %229, double 0xBF222EA5DF04047C)
  %231 = tail call double @llvm.fma.f64(double %216, double %230, double 0x3FF02A30D1FBA0DC)
  %232 = tail call double @llvm.fma.f64(double %216, double %231, double 0x4013664DDD1AD7FB)
  br label %233

233:                                              ; preds = %215, %195, %146
  %234 = phi double [ %169, %146 ], [ %214, %195 ], [ %232, %215 ]
  %235 = fmul double %36, %234
  br label %372

236:                                              ; preds = %56
  %237 = fsub double 1.000000e+00, %36
  %238 = tail call double @llvm.amdgcn.frexp.mant.f64(double %237)
  %239 = fcmp olt double %238, 0x3FE5555555555555
  %240 = zext i1 %239 to i32
  %241 = tail call double @llvm.amdgcn.ldexp.f64(double %238, i32 %240)
  %242 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %237)
  %243 = sub nsw i32 %242, %240
  %244 = fadd double %241, -1.000000e+00
  %245 = fadd double %241, 1.000000e+00
  %246 = fadd double %245, -1.000000e+00
  %247 = fsub double %241, %246
  %248 = tail call double @llvm.amdgcn.rcp.f64(double %245)
  %249 = fneg double %245
  %250 = tail call double @llvm.fma.f64(double %249, double %248, double 1.000000e+00)
  %251 = tail call double @llvm.fma.f64(double %250, double %248, double %248)
  %252 = tail call double @llvm.fma.f64(double %249, double %251, double 1.000000e+00)
  %253 = tail call double @llvm.fma.f64(double %252, double %251, double %251)
  %254 = fmul double %244, %253
  %255 = fmul double %245, %254
  %256 = fneg double %255
  %257 = tail call double @llvm.fma.f64(double %254, double %245, double %256)
  %258 = tail call double @llvm.fma.f64(double %254, double %247, double %257)
  %259 = fadd double %255, %258
  %260 = fsub double %259, %255
  %261 = fsub double %258, %260
  %262 = fsub double %244, %259
  %263 = fsub double %244, %262
  %264 = fsub double %263, %259
  %265 = fsub double %264, %261
  %266 = fadd double %262, %265
  %267 = fmul double %253, %266
  %268 = fadd double %254, %267
  %269 = fsub double %268, %254
  %270 = fsub double %267, %269
  %271 = fmul double %268, %268
  %272 = tail call double @llvm.fma.f64(double %271, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %273 = tail call double @llvm.fma.f64(double %271, double %272, double 0x3FC7474DD7F4DF2E)
  %274 = tail call double @llvm.fma.f64(double %271, double %273, double 0x3FCC71C016291751)
  %275 = tail call double @llvm.fma.f64(double %271, double %274, double 0x3FD249249B27ACF1)
  %276 = tail call double @llvm.fma.f64(double %271, double %275, double 0x3FD99999998EF7B6)
  %277 = tail call double @llvm.fma.f64(double %271, double %276, double 0x3FE5555555555780)
  %278 = tail call double @llvm.amdgcn.ldexp.f64(double %268, i32 1)
  %279 = tail call double @llvm.amdgcn.ldexp.f64(double %270, i32 1)
  %280 = fmul double %268, %271
  %281 = fmul double %280, %277
  %282 = fadd double %278, %281
  %283 = fsub double %282, %278
  %284 = fsub double %281, %283
  %285 = fadd double %279, %284
  %286 = fadd double %282, %285
  %287 = fsub double %286, %282
  %288 = fsub double %285, %287
  %289 = sitofp i32 %243 to double
  %290 = fmul double %289, 0x3FE62E42FEFA39EF
  %291 = fneg double %290
  %292 = tail call double @llvm.fma.f64(double %289, double 0x3FE62E42FEFA39EF, double %291)
  %293 = tail call double @llvm.fma.f64(double %289, double 0x3C7ABC9E3B39803F, double %292)
  %294 = fadd double %290, %293
  %295 = fsub double %294, %290
  %296 = fsub double %293, %295
  %297 = fadd double %294, %286
  %298 = fsub double %297, %294
  %299 = fsub double %297, %298
  %300 = fsub double %294, %299
  %301 = fsub double %286, %298
  %302 = fadd double %301, %300
  %303 = fadd double %296, %288
  %304 = fsub double %303, %296
  %305 = fsub double %303, %304
  %306 = fsub double %296, %305
  %307 = fsub double %288, %304
  %308 = fadd double %307, %306
  %309 = fadd double %303, %302
  %310 = fadd double %297, %309
  %311 = fsub double %310, %297
  %312 = fsub double %309, %311
  %313 = fadd double %308, %312
  %314 = fadd double %310, %313
  %315 = tail call double @llvm.fabs.f64(double %237) #3
  %316 = fcmp oeq double %315, 0x7FF0000000000000
  %317 = select i1 %316, double %237, double %314
  %318 = fcmp olt double %237, 0.000000e+00
  %319 = select i1 %318, double 0x7FF8000000000000, double %317
  %320 = fcmp oeq double %237, 0.000000e+00
  %321 = select i1 %320, double 0xFFF0000000000000, double %319
  %322 = fneg double %321
  %323 = fcmp ogt double %321, 0x9000000000000000
  %324 = select i1 %323, double 0x4FF0000000000000, double 1.000000e+00
  %325 = fmul double %324, %322
  %326 = tail call double @llvm.amdgcn.rsq.f64(double %325)
  %327 = fmul double %325, %326
  %328 = fmul double %326, 5.000000e-01
  %329 = fneg double %328
  %330 = tail call double @llvm.fma.f64(double %329, double %327, double 5.000000e-01)
  %331 = tail call double @llvm.fma.f64(double %328, double %330, double %328)
  %332 = tail call double @llvm.fma.f64(double %327, double %330, double %327)
  %333 = fneg double %332
  %334 = tail call double @llvm.fma.f64(double %333, double %332, double %325)
  %335 = tail call double @llvm.fma.f64(double %334, double %331, double %332)
  %336 = fneg double %335
  %337 = tail call double @llvm.fma.f64(double %336, double %335, double %325)
  %338 = tail call double @llvm.fma.f64(double %337, double %331, double %335)
  %339 = select i1 %323, double 0x37F0000000000000, double 1.000000e+00
  %340 = fmul double %339, %338
  %341 = fcmp oeq double %325, 0.000000e+00
  %342 = fcmp oeq double %325, 0x7FF0000000000000
  %343 = or i1 %341, %342
  %344 = select i1 %343, double %325, double %340
  %345 = fdiv double 1.000000e+00, %344
  %346 = fcmp olt double %36, 0x3FEFFFFFFFE00000
  br i1 %346, label %347, label %359

347:                                              ; preds = %236
  %348 = tail call double @llvm.fma.f64(double %345, double 0x406C4BD831A51669, double 0xC0866AF45B757C26)
  %349 = tail call double @llvm.fma.f64(double %345, double %348, double 0x409061B293EE1671)
  %350 = tail call double @llvm.fma.f64(double %345, double %349, double 0xC08D4AA0FD7248E9)
  %351 = tail call double @llvm.fma.f64(double %345, double %350, double 0x4081EEBB0088748D)
  %352 = tail call double @llvm.fma.f64(double %345, double %351, double 0xC06FF4CB6C165EFE)
  %353 = tail call double @llvm.fma.f64(double %345, double %352, double 0x40559C379A609255)
  %354 = tail call double @llvm.fma.f64(double %345, double %353, double 0xC03762B2677680C6)
  %355 = tail call double @llvm.fma.f64(double %345, double %354, double 0x4017626132CF7C5A)
  %356 = tail call double @llvm.fma.f64(double %345, double %355, double 0xBFFA298CC231A949)
  %357 = tail call double @llvm.fma.f64(double %345, double %356, double 0xBF99FA2D429B22CA)
  %358 = tail call double @llvm.fma.f64(double %345, double %357, double 0x3FF00131C4B15D15)
  br label %369

359:                                              ; preds = %236
  %360 = tail call double @llvm.fma.f64(double %345, double 0x406E1F462CC8E58A, double 0xC07DD260D25BEE8D)
  %361 = tail call double @llvm.fma.f64(double %345, double %360, double 0x407AF7DAB6C206E6)
  %362 = tail call double @llvm.fma.f64(double %345, double %361, double 0xC06D97C75A0F5809)
  %363 = tail call double @llvm.fma.f64(double %345, double %362, double 0x405632C20BF45D30)
  %364 = tail call double @llvm.fma.f64(double %345, double %363, double 0xC038E4908179A727)
  %365 = tail call double @llvm.fma.f64(double %345, double %364, double 0x40189538A73A2C3C)
  %366 = tail call double @llvm.fma.f64(double %345, double %365, double 0xBFFAAD8569B3607D)
  %367 = tail call double @llvm.fma.f64(double %345, double %366, double 0xBF980D1BEC4B54CB)
  %368 = tail call double @llvm.fma.f64(double %345, double %367, double 0x3FF001006F90EA2C)
  br label %369

369:                                              ; preds = %359, %347
  %370 = phi double [ %358, %347 ], [ %368, %359 ]
  %371 = fmul double %344, %370
  br label %372

372:                                              ; preds = %38, %233, %369
  %373 = phi double [ %55, %38 ], [ %235, %233 ], [ %371, %369 ]
  %374 = fcmp ogt double %36, 1.000000e+00
  %375 = select i1 %374, double 0x7FF8000000000000, double %373
  %376 = fcmp oeq double %36, 1.000000e+00
  %377 = select i1 %376, double 0x7FF0000000000000, double %375
  %378 = tail call double @llvm.copysign.f64(double %377, double %35)
  %379 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %378, double addrspace(1)* %379, align 8, !tbaa !16
  br label %380

380:                                              ; preds = %372, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

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
