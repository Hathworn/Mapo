; ModuleID = '../data/hip_kernels/16034/44/main.cu'
source_filename = "../data/hip_kernels/16034/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erfcinv(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %707

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = fcmp ogt double %35, 6.250000e-01
  br i1 %36, label %37, label %382

37:                                               ; preds = %32
  %38 = fsub double 1.000000e+00, %35
  %39 = tail call double @llvm.fabs.f64(double %38)
  %40 = fcmp olt double %39, 3.750000e-01
  br i1 %40, label %41, label %59

41:                                               ; preds = %37
  %42 = fmul double %38, %38
  %43 = tail call double @llvm.fma.f64(double %42, double 0x3FDC5EC06CD8002B, double 0xBFEBB7DD47AEF0D6)
  %44 = tail call double @llvm.fma.f64(double %42, double %43, double 0x3FED189992ECCDB6)
  %45 = tail call double @llvm.fma.f64(double %42, double %44, double 0xBFE10EC180CDE957)
  %46 = tail call double @llvm.fma.f64(double %42, double %45, double 0x3FD05CCE379DD66F)
  %47 = tail call double @llvm.fma.f64(double %42, double %46, double 0xBFA6B9067E3DAE74)
  %48 = tail call double @llvm.fma.f64(double %42, double %47, double 0x3FA5F7F0487C11A3)
  %49 = tail call double @llvm.fma.f64(double %42, double %48, double 0x3F9E0FBF22B2350C)
  %50 = tail call double @llvm.fma.f64(double %42, double %49, double 0x3FA2CE26322B7F90)
  %51 = tail call double @llvm.fma.f64(double %42, double %50, double 0x3FA5EBEEEE81DD31)
  %52 = tail call double @llvm.fma.f64(double %42, double %51, double 0x3FAA7CACB897F0D4)
  %53 = tail call double @llvm.fma.f64(double %42, double %52, double 0x3FB0A130D62CBA32)
  %54 = tail call double @llvm.fma.f64(double %42, double %53, double 0x3FB62847C8653359)
  %55 = tail call double @llvm.fma.f64(double %42, double %54, double 0x3FC053C2C0A5E083)
  %56 = tail call double @llvm.fma.f64(double %42, double %55, double 0x3FCDB29FB2FEEC72)
  %57 = tail call double @llvm.fma.f64(double %42, double %56, double 0x3FEC5BF891B4EF6A)
  %58 = fmul double %39, %57
  br label %375

59:                                               ; preds = %37
  %60 = fcmp olt double %39, 0x3FEFFFE000000000
  br i1 %60, label %61, label %239

61:                                               ; preds = %59
  %62 = fneg double %39
  %63 = tail call double @llvm.fma.f64(double %62, double %39, double 1.000000e+00)
  %64 = tail call double @llvm.amdgcn.frexp.mant.f64(double %63)
  %65 = fcmp olt double %64, 0x3FE5555555555555
  %66 = zext i1 %65 to i32
  %67 = tail call double @llvm.amdgcn.ldexp.f64(double %64, i32 %66)
  %68 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %63)
  %69 = sub nsw i32 %68, %66
  %70 = fadd double %67, -1.000000e+00
  %71 = fadd double %67, 1.000000e+00
  %72 = fadd double %71, -1.000000e+00
  %73 = fsub double %67, %72
  %74 = tail call double @llvm.amdgcn.rcp.f64(double %71)
  %75 = fneg double %71
  %76 = tail call double @llvm.fma.f64(double %75, double %74, double 1.000000e+00)
  %77 = tail call double @llvm.fma.f64(double %76, double %74, double %74)
  %78 = tail call double @llvm.fma.f64(double %75, double %77, double 1.000000e+00)
  %79 = tail call double @llvm.fma.f64(double %78, double %77, double %77)
  %80 = fmul double %70, %79
  %81 = fmul double %71, %80
  %82 = fneg double %81
  %83 = tail call double @llvm.fma.f64(double %80, double %71, double %82)
  %84 = tail call double @llvm.fma.f64(double %80, double %73, double %83)
  %85 = fadd double %81, %84
  %86 = fsub double %85, %81
  %87 = fsub double %84, %86
  %88 = fsub double %70, %85
  %89 = fsub double %70, %88
  %90 = fsub double %89, %85
  %91 = fsub double %90, %87
  %92 = fadd double %88, %91
  %93 = fmul double %79, %92
  %94 = fadd double %80, %93
  %95 = fsub double %94, %80
  %96 = fsub double %93, %95
  %97 = fmul double %94, %94
  %98 = tail call double @llvm.fma.f64(double %97, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %99 = tail call double @llvm.fma.f64(double %97, double %98, double 0x3FC7474DD7F4DF2E)
  %100 = tail call double @llvm.fma.f64(double %97, double %99, double 0x3FCC71C016291751)
  %101 = tail call double @llvm.fma.f64(double %97, double %100, double 0x3FD249249B27ACF1)
  %102 = tail call double @llvm.fma.f64(double %97, double %101, double 0x3FD99999998EF7B6)
  %103 = tail call double @llvm.fma.f64(double %97, double %102, double 0x3FE5555555555780)
  %104 = tail call double @llvm.amdgcn.ldexp.f64(double %94, i32 1)
  %105 = tail call double @llvm.amdgcn.ldexp.f64(double %96, i32 1)
  %106 = fmul double %94, %97
  %107 = fmul double %106, %103
  %108 = fadd double %104, %107
  %109 = fsub double %108, %104
  %110 = fsub double %107, %109
  %111 = fadd double %105, %110
  %112 = fadd double %108, %111
  %113 = fsub double %112, %108
  %114 = fsub double %111, %113
  %115 = sitofp i32 %69 to double
  %116 = fmul double %115, 0x3FE62E42FEFA39EF
  %117 = fneg double %116
  %118 = tail call double @llvm.fma.f64(double %115, double 0x3FE62E42FEFA39EF, double %117)
  %119 = tail call double @llvm.fma.f64(double %115, double 0x3C7ABC9E3B39803F, double %118)
  %120 = fadd double %116, %119
  %121 = fsub double %120, %116
  %122 = fsub double %119, %121
  %123 = fadd double %120, %112
  %124 = fsub double %123, %120
  %125 = fsub double %123, %124
  %126 = fsub double %120, %125
  %127 = fsub double %112, %124
  %128 = fadd double %127, %126
  %129 = fadd double %122, %114
  %130 = fsub double %129, %122
  %131 = fsub double %129, %130
  %132 = fsub double %122, %131
  %133 = fsub double %114, %130
  %134 = fadd double %133, %132
  %135 = fadd double %129, %128
  %136 = fadd double %123, %135
  %137 = fsub double %136, %123
  %138 = fsub double %135, %137
  %139 = fadd double %134, %138
  %140 = fadd double %136, %139
  %141 = tail call double @llvm.fabs.f64(double %63) #3
  %142 = fcmp oeq double %141, 0x7FF0000000000000
  %143 = select i1 %142, double %63, double %140
  %144 = fcmp olt double %63, 0.000000e+00
  %145 = select i1 %144, double 0x7FF8000000000000, double %143
  %146 = fcmp oeq double %63, 0.000000e+00
  %147 = select i1 %146, double 0xFFF0000000000000, double %145
  %148 = fcmp ogt double %147, -6.250000e+00
  br i1 %148, label %149, label %173

149:                                              ; preds = %61
  %150 = fsub double -3.125000e+00, %147
  %151 = tail call double @llvm.fma.f64(double %150, double 0xBBB135D2E746E627, double 0xBC08DDF93324D327)
  %152 = tail call double @llvm.fma.f64(double %150, double %151, double 0x3C37B83EEF0B7C9F)
  %153 = tail call double @llvm.fma.f64(double %150, double %152, double 0x3C69BA72CD589B91)
  %154 = tail call double @llvm.fma.f64(double %150, double %153, double 0xBCA33689090A6B96)
  %155 = tail call double @llvm.fma.f64(double %150, double %154, double 0x3C782E11898132E0)
  %156 = tail call double @llvm.fma.f64(double %150, double %155, double 0x3CFDE4ACFD9E26BA)
  %157 = tail call double @llvm.fma.f64(double %150, double %156, double 0xBD26D33EED66C487)
  %158 = tail call double @llvm.fma.f64(double %150, double %157, double 0xBD36F2167040D8E2)
  %159 = tail call double @llvm.fma.f64(double %150, double %158, double 0x3D872A22C2D77E20)
  %160 = tail call double @llvm.fma.f64(double %150, double %159, double 0xBDAC8859C4E5C0AF)
  %161 = tail call double @llvm.fma.f64(double %150, double %160, double 0xBDCDC583D118A561)
  %162 = tail call double @llvm.fma.f64(double %150, double %161, double 0x3E120F47CCF46B3C)
  %163 = tail call double @llvm.fma.f64(double %150, double %162, double 0xBE31A9E38DC84D60)
  %164 = tail call double @llvm.fma.f64(double %150, double %163, double 0xBE5F36CD6D3D46A9)
  %165 = tail call double @llvm.fma.f64(double %150, double %164, double 0x3E9C6B4F5D03B787)
  %166 = tail call double @llvm.fma.f64(double %150, double %165, double 0xBEB6E8A5434AE8A2)
  %167 = tail call double @llvm.fma.f64(double %150, double %166, double 0xBEED1D1F7B8736F6)
  %168 = tail call double @llvm.fma.f64(double %150, double %167, double 0x3F2879C2A212F024)
  %169 = tail call double @llvm.fma.f64(double %150, double %168, double 0xBF4845769484FCA8)
  %170 = tail call double @llvm.fma.f64(double %150, double %169, double 0xBF78B6C33114F909)
  %171 = tail call double @llvm.fma.f64(double %150, double %170, double 0x3FCEBD80D9B13E28)
  %172 = tail call double @llvm.fma.f64(double %150, double %171, double 0x3FFA755E7C99AE86)
  br label %236

173:                                              ; preds = %61
  %174 = fneg double %147
  %175 = fcmp ogt double %147, -1.600000e+01
  %176 = fcmp ogt double %147, 0x9000000000000000
  %177 = select i1 %176, double 0x4FF0000000000000, double 1.000000e+00
  %178 = fmul double %177, %174
  %179 = tail call double @llvm.amdgcn.rsq.f64(double %178)
  %180 = fmul double %178, %179
  %181 = fmul double %179, 5.000000e-01
  %182 = fneg double %181
  %183 = tail call double @llvm.fma.f64(double %182, double %180, double 5.000000e-01)
  %184 = tail call double @llvm.fma.f64(double %181, double %183, double %181)
  %185 = tail call double @llvm.fma.f64(double %180, double %183, double %180)
  %186 = fneg double %185
  %187 = tail call double @llvm.fma.f64(double %186, double %185, double %178)
  %188 = tail call double @llvm.fma.f64(double %187, double %184, double %185)
  %189 = fneg double %188
  %190 = tail call double @llvm.fma.f64(double %189, double %188, double %178)
  %191 = tail call double @llvm.fma.f64(double %190, double %184, double %188)
  %192 = select i1 %176, double 0x37F0000000000000, double 1.000000e+00
  %193 = fmul double %192, %191
  %194 = fcmp oeq double %178, 0.000000e+00
  %195 = fcmp oeq double %178, 0x7FF0000000000000
  %196 = or i1 %194, %195
  %197 = select i1 %196, double %178, double %193
  br i1 %175, label %198, label %218

198:                                              ; preds = %173
  %199 = fadd double %197, -3.250000e+00
  %200 = tail call double @llvm.fma.f64(double %199, double 0x3E23040F87DBD932, double 0x3E785CBE52878635)
  %201 = tail call double @llvm.fma.f64(double %199, double %200, double 0xBE92777453DD3955)
  %202 = tail call double @llvm.fma.f64(double %199, double %201, double 0x3E5395ABCD554C6C)
  %203 = tail call double @llvm.fma.f64(double %199, double %202, double 0x3EB936388A3790AD)
  %204 = tail call double @llvm.fma.f64(double %199, double %203, double 0xBED0D5DB812B5083)
  %205 = tail call double @llvm.fma.f64(double %199, double %204, double 0x3EC8860CD5D652F6)
  %206 = tail call double @llvm.fma.f64(double %199, double %205, double 0x3EEA29A0CACDFB23)
  %207 = tail call double @llvm.fma.f64(double %199, double %206, double 0xBF08CEF1F80281F2)
  %208 = tail call double @llvm.fma.f64(double %199, double %207, double 0x3F11E684D0B9188A)
  %209 = tail call double @llvm.fma.f64(double %199, double %208, double 0x3EF932CD54C8A222)
  %210 = tail call double @llvm.fma.f64(double %199, double %209, double 0xBF37448A89EF8AA3)
  %211 = tail call double @llvm.fma.f64(double %199, double %210, double 0x3F4F3CC55AD40C25)
  %212 = tail call double @llvm.fma.f64(double %199, double %211, double 0xBF5BA924132F38B1)
  %213 = tail call double @llvm.fma.f64(double %199, double %212, double 0x3F6468EECA533CF8)
  %214 = tail call double @llvm.fma.f64(double %199, double %213, double 0xBF6EBADABB891BBD)
  %215 = tail call double @llvm.fma.f64(double %199, double %214, double 0x3F75FFCFE5B76AFC)
  %216 = tail call double @llvm.fma.f64(double %199, double %215, double 0x3FF0158A6D641D39)
  %217 = tail call double @llvm.fma.f64(double %199, double %216, double 0x4008ABCC380D5A48)
  br label %236

218:                                              ; preds = %173
  %219 = fadd double %197, -5.000000e+00
  %220 = tail call double @llvm.fma.f64(double %219, double 0xBDBDCEC3A7785389, double 0xBDF18FEEC0E38727)
  %221 = tail call double @llvm.fma.f64(double %219, double %220, double 0x3E19E6BF2DDA45E3)
  %222 = tail call double @llvm.fma.f64(double %219, double %221, double 0xBE30468FB24E2F5F)
  %223 = tail call double @llvm.fma.f64(double %219, double %222, double 0x3E405AC6A8FBA182)
  %224 = tail call double @llvm.fma.f64(double %219, double %223, double 0xBE50102E495FB9C0)
  %225 = tail call double @llvm.fma.f64(double %219, double %224, double 0x3E5F4C20E1334AF8)
  %226 = tail call double @llvm.fma.f64(double %219, double %225, double 0xBE722D220FDF9C3E)
  %227 = tail call double @llvm.fma.f64(double %219, double %226, double 0x3E8EBC8BB824CB54)
  %228 = tail call double @llvm.fma.f64(double %219, double %227, double 0xBEB0A8D40EA372CC)
  %229 = tail call double @llvm.fma.f64(double %219, double %228, double 0x3ED2FBD29D093D2B)
  %230 = tail call double @llvm.fma.f64(double %219, double %229, double 0xBEF4A3497E1E0FAC)
  %231 = tail call double @llvm.fma.f64(double %219, double %230, double 0x3F13EBF4EB00938F)
  %232 = tail call double @llvm.fma.f64(double %219, double %231, double 0xBF2C2F36A8FC5D53)
  %233 = tail call double @llvm.fma.f64(double %219, double %232, double 0xBF222EA5DF04047C)
  %234 = tail call double @llvm.fma.f64(double %219, double %233, double 0x3FF02A30D1FBA0DC)
  %235 = tail call double @llvm.fma.f64(double %219, double %234, double 0x4013664DDD1AD7FB)
  br label %236

236:                                              ; preds = %218, %198, %149
  %237 = phi double [ %172, %149 ], [ %217, %198 ], [ %235, %218 ]
  %238 = fmul double %39, %237
  br label %375

239:                                              ; preds = %59
  %240 = fsub double 1.000000e+00, %39
  %241 = tail call double @llvm.amdgcn.frexp.mant.f64(double %240)
  %242 = fcmp olt double %241, 0x3FE5555555555555
  %243 = zext i1 %242 to i32
  %244 = tail call double @llvm.amdgcn.ldexp.f64(double %241, i32 %243)
  %245 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %240)
  %246 = sub nsw i32 %245, %243
  %247 = fadd double %244, -1.000000e+00
  %248 = fadd double %244, 1.000000e+00
  %249 = fadd double %248, -1.000000e+00
  %250 = fsub double %244, %249
  %251 = tail call double @llvm.amdgcn.rcp.f64(double %248)
  %252 = fneg double %248
  %253 = tail call double @llvm.fma.f64(double %252, double %251, double 1.000000e+00)
  %254 = tail call double @llvm.fma.f64(double %253, double %251, double %251)
  %255 = tail call double @llvm.fma.f64(double %252, double %254, double 1.000000e+00)
  %256 = tail call double @llvm.fma.f64(double %255, double %254, double %254)
  %257 = fmul double %247, %256
  %258 = fmul double %248, %257
  %259 = fneg double %258
  %260 = tail call double @llvm.fma.f64(double %257, double %248, double %259)
  %261 = tail call double @llvm.fma.f64(double %257, double %250, double %260)
  %262 = fadd double %258, %261
  %263 = fsub double %262, %258
  %264 = fsub double %261, %263
  %265 = fsub double %247, %262
  %266 = fsub double %247, %265
  %267 = fsub double %266, %262
  %268 = fsub double %267, %264
  %269 = fadd double %265, %268
  %270 = fmul double %256, %269
  %271 = fadd double %257, %270
  %272 = fsub double %271, %257
  %273 = fsub double %270, %272
  %274 = fmul double %271, %271
  %275 = tail call double @llvm.fma.f64(double %274, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %276 = tail call double @llvm.fma.f64(double %274, double %275, double 0x3FC7474DD7F4DF2E)
  %277 = tail call double @llvm.fma.f64(double %274, double %276, double 0x3FCC71C016291751)
  %278 = tail call double @llvm.fma.f64(double %274, double %277, double 0x3FD249249B27ACF1)
  %279 = tail call double @llvm.fma.f64(double %274, double %278, double 0x3FD99999998EF7B6)
  %280 = tail call double @llvm.fma.f64(double %274, double %279, double 0x3FE5555555555780)
  %281 = tail call double @llvm.amdgcn.ldexp.f64(double %271, i32 1)
  %282 = tail call double @llvm.amdgcn.ldexp.f64(double %273, i32 1)
  %283 = fmul double %271, %274
  %284 = fmul double %283, %280
  %285 = fadd double %281, %284
  %286 = fsub double %285, %281
  %287 = fsub double %284, %286
  %288 = fadd double %282, %287
  %289 = fadd double %285, %288
  %290 = fsub double %289, %285
  %291 = fsub double %288, %290
  %292 = sitofp i32 %246 to double
  %293 = fmul double %292, 0x3FE62E42FEFA39EF
  %294 = fneg double %293
  %295 = tail call double @llvm.fma.f64(double %292, double 0x3FE62E42FEFA39EF, double %294)
  %296 = tail call double @llvm.fma.f64(double %292, double 0x3C7ABC9E3B39803F, double %295)
  %297 = fadd double %293, %296
  %298 = fsub double %297, %293
  %299 = fsub double %296, %298
  %300 = fadd double %297, %289
  %301 = fsub double %300, %297
  %302 = fsub double %300, %301
  %303 = fsub double %297, %302
  %304 = fsub double %289, %301
  %305 = fadd double %304, %303
  %306 = fadd double %299, %291
  %307 = fsub double %306, %299
  %308 = fsub double %306, %307
  %309 = fsub double %299, %308
  %310 = fsub double %291, %307
  %311 = fadd double %310, %309
  %312 = fadd double %306, %305
  %313 = fadd double %300, %312
  %314 = fsub double %313, %300
  %315 = fsub double %312, %314
  %316 = fadd double %311, %315
  %317 = fadd double %313, %316
  %318 = tail call double @llvm.fabs.f64(double %240) #3
  %319 = fcmp oeq double %318, 0x7FF0000000000000
  %320 = select i1 %319, double %240, double %317
  %321 = fcmp olt double %240, 0.000000e+00
  %322 = select i1 %321, double 0x7FF8000000000000, double %320
  %323 = fcmp oeq double %240, 0.000000e+00
  %324 = select i1 %323, double 0xFFF0000000000000, double %322
  %325 = fneg double %324
  %326 = fcmp ogt double %324, 0x9000000000000000
  %327 = select i1 %326, double 0x4FF0000000000000, double 1.000000e+00
  %328 = fmul double %327, %325
  %329 = tail call double @llvm.amdgcn.rsq.f64(double %328)
  %330 = fmul double %328, %329
  %331 = fmul double %329, 5.000000e-01
  %332 = fneg double %331
  %333 = tail call double @llvm.fma.f64(double %332, double %330, double 5.000000e-01)
  %334 = tail call double @llvm.fma.f64(double %331, double %333, double %331)
  %335 = tail call double @llvm.fma.f64(double %330, double %333, double %330)
  %336 = fneg double %335
  %337 = tail call double @llvm.fma.f64(double %336, double %335, double %328)
  %338 = tail call double @llvm.fma.f64(double %337, double %334, double %335)
  %339 = fneg double %338
  %340 = tail call double @llvm.fma.f64(double %339, double %338, double %328)
  %341 = tail call double @llvm.fma.f64(double %340, double %334, double %338)
  %342 = select i1 %326, double 0x37F0000000000000, double 1.000000e+00
  %343 = fmul double %342, %341
  %344 = fcmp oeq double %328, 0.000000e+00
  %345 = fcmp oeq double %328, 0x7FF0000000000000
  %346 = or i1 %344, %345
  %347 = select i1 %346, double %328, double %343
  %348 = fdiv double 1.000000e+00, %347
  %349 = fcmp olt double %39, 0x3FEFFFFFFFE00000
  br i1 %349, label %350, label %362

350:                                              ; preds = %239
  %351 = tail call double @llvm.fma.f64(double %348, double 0x406C4BD831A51669, double 0xC0866AF45B757C26)
  %352 = tail call double @llvm.fma.f64(double %348, double %351, double 0x409061B293EE1671)
  %353 = tail call double @llvm.fma.f64(double %348, double %352, double 0xC08D4AA0FD7248E9)
  %354 = tail call double @llvm.fma.f64(double %348, double %353, double 0x4081EEBB0088748D)
  %355 = tail call double @llvm.fma.f64(double %348, double %354, double 0xC06FF4CB6C165EFE)
  %356 = tail call double @llvm.fma.f64(double %348, double %355, double 0x40559C379A609255)
  %357 = tail call double @llvm.fma.f64(double %348, double %356, double 0xC03762B2677680C6)
  %358 = tail call double @llvm.fma.f64(double %348, double %357, double 0x4017626132CF7C5A)
  %359 = tail call double @llvm.fma.f64(double %348, double %358, double 0xBFFA298CC231A949)
  %360 = tail call double @llvm.fma.f64(double %348, double %359, double 0xBF99FA2D429B22CA)
  %361 = tail call double @llvm.fma.f64(double %348, double %360, double 0x3FF00131C4B15D15)
  br label %372

362:                                              ; preds = %239
  %363 = tail call double @llvm.fma.f64(double %348, double 0x406E1F462CC8E58A, double 0xC07DD260D25BEE8D)
  %364 = tail call double @llvm.fma.f64(double %348, double %363, double 0x407AF7DAB6C206E6)
  %365 = tail call double @llvm.fma.f64(double %348, double %364, double 0xC06D97C75A0F5809)
  %366 = tail call double @llvm.fma.f64(double %348, double %365, double 0x405632C20BF45D30)
  %367 = tail call double @llvm.fma.f64(double %348, double %366, double 0xC038E4908179A727)
  %368 = tail call double @llvm.fma.f64(double %348, double %367, double 0x40189538A73A2C3C)
  %369 = tail call double @llvm.fma.f64(double %348, double %368, double 0xBFFAAD8569B3607D)
  %370 = tail call double @llvm.fma.f64(double %348, double %369, double 0xBF980D1BEC4B54CB)
  %371 = tail call double @llvm.fma.f64(double %348, double %370, double 0x3FF001006F90EA2C)
  br label %372

372:                                              ; preds = %362, %350
  %373 = phi double [ %361, %350 ], [ %371, %362 ]
  %374 = fmul double %347, %373
  br label %375

375:                                              ; preds = %372, %236, %41
  %376 = phi double [ %58, %41 ], [ %238, %236 ], [ %374, %372 ]
  %377 = fcmp ogt double %39, 1.000000e+00
  %378 = select i1 %377, double 0x7FF8000000000000, double %376
  %379 = fcmp oeq double %39, 1.000000e+00
  %380 = select i1 %379, double 0x7FF0000000000000, double %378
  %381 = tail call double @llvm.copysign.f64(double %380, double %38)
  br label %696

382:                                              ; preds = %32
  %383 = fcmp ogt double %35, 0x3F50000000000000
  br i1 %383, label %384, label %496

384:                                              ; preds = %382
  %385 = fsub double 2.000000e+00, %35
  %386 = fmul double %35, %385
  %387 = tail call double @llvm.amdgcn.frexp.mant.f64(double %386)
  %388 = fcmp olt double %387, 0x3FE5555555555555
  %389 = zext i1 %388 to i32
  %390 = tail call double @llvm.amdgcn.ldexp.f64(double %387, i32 %389)
  %391 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %386)
  %392 = sub nsw i32 %391, %389
  %393 = fadd double %390, -1.000000e+00
  %394 = fadd double %390, 1.000000e+00
  %395 = fadd double %394, -1.000000e+00
  %396 = fsub double %390, %395
  %397 = tail call double @llvm.amdgcn.rcp.f64(double %394)
  %398 = fneg double %394
  %399 = tail call double @llvm.fma.f64(double %398, double %397, double 1.000000e+00)
  %400 = tail call double @llvm.fma.f64(double %399, double %397, double %397)
  %401 = tail call double @llvm.fma.f64(double %398, double %400, double 1.000000e+00)
  %402 = tail call double @llvm.fma.f64(double %401, double %400, double %400)
  %403 = fmul double %393, %402
  %404 = fmul double %394, %403
  %405 = fneg double %404
  %406 = tail call double @llvm.fma.f64(double %403, double %394, double %405)
  %407 = tail call double @llvm.fma.f64(double %403, double %396, double %406)
  %408 = fadd double %404, %407
  %409 = fsub double %408, %404
  %410 = fsub double %407, %409
  %411 = fsub double %393, %408
  %412 = fsub double %393, %411
  %413 = fsub double %412, %408
  %414 = fsub double %413, %410
  %415 = fadd double %411, %414
  %416 = fmul double %402, %415
  %417 = fadd double %403, %416
  %418 = fsub double %417, %403
  %419 = fsub double %416, %418
  %420 = fmul double %417, %417
  %421 = tail call double @llvm.fma.f64(double %420, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %422 = tail call double @llvm.fma.f64(double %420, double %421, double 0x3FC7474DD7F4DF2E)
  %423 = tail call double @llvm.fma.f64(double %420, double %422, double 0x3FCC71C016291751)
  %424 = tail call double @llvm.fma.f64(double %420, double %423, double 0x3FD249249B27ACF1)
  %425 = tail call double @llvm.fma.f64(double %420, double %424, double 0x3FD99999998EF7B6)
  %426 = tail call double @llvm.fma.f64(double %420, double %425, double 0x3FE5555555555780)
  %427 = tail call double @llvm.amdgcn.ldexp.f64(double %417, i32 1)
  %428 = tail call double @llvm.amdgcn.ldexp.f64(double %419, i32 1)
  %429 = fmul double %417, %420
  %430 = fmul double %429, %426
  %431 = fadd double %427, %430
  %432 = fsub double %431, %427
  %433 = fsub double %430, %432
  %434 = fadd double %428, %433
  %435 = fadd double %431, %434
  %436 = fsub double %435, %431
  %437 = fsub double %434, %436
  %438 = sitofp i32 %392 to double
  %439 = fmul double %438, 0x3FE62E42FEFA39EF
  %440 = fneg double %439
  %441 = tail call double @llvm.fma.f64(double %438, double 0x3FE62E42FEFA39EF, double %440)
  %442 = tail call double @llvm.fma.f64(double %438, double 0x3C7ABC9E3B39803F, double %441)
  %443 = fadd double %439, %442
  %444 = fsub double %443, %439
  %445 = fsub double %442, %444
  %446 = fadd double %443, %435
  %447 = fsub double %446, %443
  %448 = fsub double %446, %447
  %449 = fsub double %443, %448
  %450 = fsub double %435, %447
  %451 = fadd double %450, %449
  %452 = fadd double %445, %437
  %453 = fsub double %452, %445
  %454 = fsub double %452, %453
  %455 = fsub double %445, %454
  %456 = fsub double %437, %453
  %457 = fadd double %456, %455
  %458 = fadd double %452, %451
  %459 = fadd double %446, %458
  %460 = fsub double %459, %446
  %461 = fsub double %458, %460
  %462 = fadd double %457, %461
  %463 = fadd double %459, %462
  %464 = tail call double @llvm.fabs.f64(double %386) #3
  %465 = fcmp oeq double %464, 0x7FF0000000000000
  %466 = select i1 %465, double %386, double %463
  %467 = fcmp olt double %386, 0.000000e+00
  %468 = fcmp oeq double %386, 0.000000e+00
  %469 = fsub double -3.125000e+00, %466
  %470 = select i1 %467, double 0x7FF8000000000000, double %469
  %471 = select i1 %468, double 0x7FF0000000000000, double %470
  %472 = tail call double @llvm.fma.f64(double %471, double 0x3BA1267A785A1166, double 0xBC0A6581051DD484)
  %473 = tail call double @llvm.fma.f64(double %471, double %472, double 0x3C32B2956FC047A4)
  %474 = tail call double @llvm.fma.f64(double %471, double %473, double 0x3C6AD835AED5CC07)
  %475 = tail call double @llvm.fma.f64(double %471, double %474, double 0xBCA25E0612EAE68F)
  %476 = tail call double @llvm.fma.f64(double %471, double %475, double 0x3C6A0CAB63F02A91)
  %477 = tail call double @llvm.fma.f64(double %471, double %476, double 0x3CFD9227AF501ADB)
  %478 = tail call double @llvm.fma.f64(double %471, double %477, double 0xBD26C3AD559A9B4E)
  %479 = tail call double @llvm.fma.f64(double %471, double %478, double 0xBD36CAFA36036318)
  %480 = tail call double @llvm.fma.f64(double %471, double %479, double 0x3D872879641E158F)
  %481 = tail call double @llvm.fma.f64(double %471, double %480, double 0xBDAC89D755F7FFF8)
  %482 = tail call double @llvm.fma.f64(double %471, double %481, double 0xBDCDC51171DDAE3A)
  %483 = tail call double @llvm.fma.f64(double %471, double %482, double 0x3E120F512744AE65)
  %484 = tail call double @llvm.fma.f64(double %471, double %483, double 0xBE31A9E5F4BCFCD8)
  %485 = tail call double @llvm.fma.f64(double %471, double %484, double 0xBE5F36CE926B83E8)
  %486 = tail call double @llvm.fma.f64(double %471, double %485, double 0x3E9C6B4F6C7CFA1E)
  %487 = tail call double @llvm.fma.f64(double %471, double %486, double 0xBEB6E8A53E0C2026)
  %488 = tail call double @llvm.fma.f64(double %471, double %487, double 0xBEED1D1F7BF4570B)
  %489 = tail call double @llvm.fma.f64(double %471, double %488, double 0x3F2879C2A20CC3E2)
  %490 = tail call double @llvm.fma.f64(double %471, double %489, double 0xBF48457694844D14)
  %491 = tail call double @llvm.fma.f64(double %471, double %490, double 0xBF78B6C33114EDAD)
  %492 = tail call double @llvm.fma.f64(double %471, double %491, double 0x3FCEBD80D9B13E14)
  %493 = tail call double @llvm.fma.f64(double %471, double %492, double 0x3FFA755E7C99AE86)
  %494 = fneg double %35
  %495 = tail call double @llvm.fma.f64(double %494, double %493, double %493)
  br label %696

496:                                              ; preds = %382
  %497 = tail call double @llvm.amdgcn.frexp.mant.f64(double %35)
  %498 = fcmp olt double %497, 0x3FE5555555555555
  %499 = zext i1 %498 to i32
  %500 = tail call double @llvm.amdgcn.ldexp.f64(double %497, i32 %499)
  %501 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %35)
  %502 = sub nsw i32 %501, %499
  %503 = fadd double %500, -1.000000e+00
  %504 = fadd double %500, 1.000000e+00
  %505 = fadd double %504, -1.000000e+00
  %506 = fsub double %500, %505
  %507 = tail call double @llvm.amdgcn.rcp.f64(double %504)
  %508 = fneg double %504
  %509 = tail call double @llvm.fma.f64(double %508, double %507, double 1.000000e+00)
  %510 = tail call double @llvm.fma.f64(double %509, double %507, double %507)
  %511 = tail call double @llvm.fma.f64(double %508, double %510, double 1.000000e+00)
  %512 = tail call double @llvm.fma.f64(double %511, double %510, double %510)
  %513 = fmul double %503, %512
  %514 = fmul double %504, %513
  %515 = fneg double %514
  %516 = tail call double @llvm.fma.f64(double %513, double %504, double %515)
  %517 = tail call double @llvm.fma.f64(double %513, double %506, double %516)
  %518 = fadd double %514, %517
  %519 = fsub double %518, %514
  %520 = fsub double %517, %519
  %521 = fsub double %503, %518
  %522 = fsub double %503, %521
  %523 = fsub double %522, %518
  %524 = fsub double %523, %520
  %525 = fadd double %521, %524
  %526 = fmul double %512, %525
  %527 = fadd double %513, %526
  %528 = fsub double %527, %513
  %529 = fsub double %526, %528
  %530 = fmul double %527, %527
  %531 = tail call double @llvm.fma.f64(double %530, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %532 = tail call double @llvm.fma.f64(double %530, double %531, double 0x3FC7474DD7F4DF2E)
  %533 = tail call double @llvm.fma.f64(double %530, double %532, double 0x3FCC71C016291751)
  %534 = tail call double @llvm.fma.f64(double %530, double %533, double 0x3FD249249B27ACF1)
  %535 = tail call double @llvm.fma.f64(double %530, double %534, double 0x3FD99999998EF7B6)
  %536 = tail call double @llvm.fma.f64(double %530, double %535, double 0x3FE5555555555780)
  %537 = tail call double @llvm.amdgcn.ldexp.f64(double %527, i32 1)
  %538 = tail call double @llvm.amdgcn.ldexp.f64(double %529, i32 1)
  %539 = fmul double %527, %530
  %540 = fmul double %539, %536
  %541 = fadd double %537, %540
  %542 = fsub double %541, %537
  %543 = fsub double %540, %542
  %544 = fadd double %538, %543
  %545 = fadd double %541, %544
  %546 = fsub double %545, %541
  %547 = fsub double %544, %546
  %548 = sitofp i32 %502 to double
  %549 = fmul double %548, 0x3FE62E42FEFA39EF
  %550 = fneg double %549
  %551 = tail call double @llvm.fma.f64(double %548, double 0x3FE62E42FEFA39EF, double %550)
  %552 = tail call double @llvm.fma.f64(double %548, double 0x3C7ABC9E3B39803F, double %551)
  %553 = fadd double %549, %552
  %554 = fsub double %553, %549
  %555 = fsub double %552, %554
  %556 = fadd double %553, %545
  %557 = fsub double %556, %553
  %558 = fsub double %556, %557
  %559 = fsub double %553, %558
  %560 = fsub double %545, %557
  %561 = fadd double %560, %559
  %562 = fadd double %555, %547
  %563 = fsub double %562, %555
  %564 = fsub double %562, %563
  %565 = fsub double %555, %564
  %566 = fsub double %547, %563
  %567 = fadd double %566, %565
  %568 = fadd double %562, %561
  %569 = fadd double %556, %568
  %570 = fsub double %569, %556
  %571 = fsub double %568, %570
  %572 = fadd double %567, %571
  %573 = fadd double %569, %572
  %574 = tail call double @llvm.fabs.f64(double %35) #3
  %575 = fcmp oeq double %574, 0x7FF0000000000000
  %576 = select i1 %575, double %35, double %573
  %577 = fcmp olt double %35, 0.000000e+00
  %578 = select i1 %577, double 0x7FF8000000000000, double %576
  %579 = fcmp oeq double %35, 0.000000e+00
  %580 = select i1 %579, double 0xFFF0000000000000, double %578
  %581 = fneg double %580
  %582 = fcmp ogt double %580, 0x9000000000000000
  %583 = select i1 %582, double 0x4FF0000000000000, double 1.000000e+00
  %584 = fmul double %583, %581
  %585 = tail call double @llvm.amdgcn.rsq.f64(double %584)
  %586 = fmul double %584, %585
  %587 = fmul double %585, 5.000000e-01
  %588 = fneg double %587
  %589 = tail call double @llvm.fma.f64(double %588, double %586, double 5.000000e-01)
  %590 = tail call double @llvm.fma.f64(double %587, double %589, double %587)
  %591 = tail call double @llvm.fma.f64(double %586, double %589, double %586)
  %592 = fneg double %591
  %593 = tail call double @llvm.fma.f64(double %592, double %591, double %584)
  %594 = tail call double @llvm.fma.f64(double %593, double %590, double %591)
  %595 = fneg double %594
  %596 = tail call double @llvm.fma.f64(double %595, double %594, double %584)
  %597 = tail call double @llvm.fma.f64(double %596, double %590, double %594)
  %598 = select i1 %582, double 0x37F0000000000000, double 1.000000e+00
  %599 = fmul double %598, %597
  %600 = fcmp oeq double %584, 0.000000e+00
  %601 = fcmp oeq double %584, 0x7FF0000000000000
  %602 = or i1 %600, %601
  %603 = select i1 %602, double %584, double %599
  %604 = fdiv double 1.000000e+00, %603
  %605 = fcmp ogt double %35, 0x3EC0000000000000
  br i1 %605, label %606, label %618

606:                                              ; preds = %496
  %607 = tail call double @llvm.fma.f64(double %604, double 0x4038B3CFC98A5212, double 0xC05907BCDAB54A4E)
  %608 = tail call double @llvm.fma.f64(double %604, double %607, double 0x4067659CF8216D7D)
  %609 = tail call double @llvm.fma.f64(double %604, double %608, double 0xC06AC222777F664D)
  %610 = tail call double @llvm.fma.f64(double %604, double %609, double 0x4064F2F8E33151AC)
  %611 = tail call double @llvm.fma.f64(double %604, double %610, double 0xC057D7D1EB301C4C)
  %612 = tail call double @llvm.fma.f64(double %604, double %611, double 0x40448E630C1C77E7)
  %613 = tail call double @llvm.fma.f64(double %604, double %612, double 0xC02C63E7D0E327F6)
  %614 = tail call double @llvm.fma.f64(double %604, double %613, double 0x401225B286AEB0DF)
  %615 = tail call double @llvm.fma.f64(double %604, double %614, double 0xBFF82A4ACC22B05D)
  %616 = tail call double @llvm.fma.f64(double %604, double %615, double 0xBFA0A88271680E57)
  %617 = tail call double @llvm.fma.f64(double %604, double %616, double 0x3FF001F6ACEBB122)
  br label %693

618:                                              ; preds = %496
  %619 = fcmp ogt double %35, 0x3D70000000000000
  br i1 %619, label %620, label %632

620:                                              ; preds = %618
  %621 = tail call double @llvm.fma.f64(double %604, double 0x4080FDCB40BF066D, double 0xC09870DDEAA832DB)
  %622 = tail call double @llvm.fma.f64(double %604, double %621, double 0x40A035C39E0428C4)
  %623 = tail call double @llvm.fma.f64(double %604, double %622, double 0xC09A4D3C54A3EC14)
  %624 = tail call double @llvm.fma.f64(double %604, double %623, double 0x408D382AEE6EFAE8)
  %625 = tail call double @llvm.fma.f64(double %604, double %624, double 0xC0779F9E26565BC1)
  %626 = tail call double @llvm.fma.f64(double %604, double %625, double 0x405D00E058CE9ABA)
  %627 = tail call double @llvm.fma.f64(double %604, double %626, double 0xC03C7D1E01821EB3)
  %628 = tail call double @llvm.fma.f64(double %604, double %627, double 0x4019D930BA7A3111)
  %629 = tail call double @llvm.fma.f64(double %604, double %628, double 0xBFFAF47941DD2BAA)
  %630 = tail call double @llvm.fma.f64(double %604, double %629, double 0xBF9787ECC823998B)
  %631 = tail call double @llvm.fma.f64(double %604, double %630, double 0x3FF000FAE5FB73E3)
  br label %693

632:                                              ; preds = %618
  %633 = fcmp ogt double %35, 0x3AD0000000000000
  br i1 %633, label %634, label %646

634:                                              ; preds = %632
  %635 = tail call double @llvm.fma.f64(double %604, double 0x40CC9E5B8E31C18E, double 0xC0DC866153B1BCE6)
  %636 = tail call double @llvm.fma.f64(double %604, double %635, double 0x40DA386B3B4FB25C)
  %637 = tail call double @llvm.fma.f64(double %604, double %636, double 0xC0CD7BF378E7B5FB)
  %638 = tail call double @llvm.fma.f64(double %604, double %637, double 0x40B6B416DE0A7A75)
  %639 = tail call double @llvm.fma.f64(double %604, double %638, double 0xC099757C1CF44E90)
  %640 = tail call double @llvm.fma.f64(double %604, double %639, double 0x4075B56EDEDBAA8C)
  %641 = tail call double @llvm.fma.f64(double %604, double %640, double 0xC04DA79924B4D155)
  %642 = tail call double @llvm.fma.f64(double %604, double %641, double 0x4022BA25315D612B)
  %643 = tail call double @llvm.fma.f64(double %604, double %642, double 0xBFFDE5808FBD786D)
  %644 = tail call double @llvm.fma.f64(double %604, double %643, double 0xBF904E014B9FC507)
  %645 = tail call double @llvm.fma.f64(double %604, double %644, double 0x3FF000788DF1C89F)
  br label %693

646:                                              ; preds = %632
  %647 = fcmp ogt double %35, 0x3370000000000000
  br i1 %647, label %648, label %660

648:                                              ; preds = %646
  %649 = tail call double @llvm.fma.f64(double %604, double 0x411FF518AAE00301, double 0xC125781EF98C6AA9)
  %650 = tail call double @llvm.fma.f64(double %604, double %649, double 0x411A9511B21C7715)
  %651 = tail call double @llvm.fma.f64(double %604, double %650, double 0xC1041D8F1455B21E)
  %652 = tail call double @llvm.fma.f64(double %604, double %651, double 0x40E4D4A3D4025A4C)
  %653 = tail call double @llvm.fma.f64(double %604, double %652, double 0xC0BF640FE7077996)
  %654 = tail call double @llvm.fma.f64(double %604, double %653, double 0x4091FAF674F42181)
  %655 = tail call double @llvm.fma.f64(double %604, double %654, double 0xC06080C5CD81D791)
  %656 = tail call double @llvm.fma.f64(double %604, double %655, double 0x402C0AE370098EF4)
  %657 = tail call double @llvm.fma.f64(double %604, double %656, double 0xC0008EBD67DC005A)
  %658 = tail call double @llvm.fma.f64(double %604, double %657, double 0xBF85CF3329E72289)
  %659 = tail call double @llvm.fma.f64(double %604, double %658, double 0x3FF00035E75F27E2)
  br label %693

660:                                              ; preds = %646
  %661 = fcmp ogt double %35, 0x26F0000000000000
  br i1 %661, label %662, label %673

662:                                              ; preds = %660
  %663 = tail call double @llvm.fma.f64(double %604, double 0xC13D554F00BF9D81, double 0x4138456711FF3627)
  %664 = tail call double @llvm.fma.f64(double %604, double %663, double 0xC1226C90ACC5DAAF)
  %665 = tail call double @llvm.fma.f64(double %604, double %664, double 0x410106501CDEF815)
  %666 = tail call double @llvm.fma.f64(double %604, double %665, double 0xC0D57A4C95601C04)
  %667 = tail call double @llvm.fma.f64(double %604, double %666, double 0x40A3CA627CBAEDE6)
  %668 = tail call double @llvm.fma.f64(double %604, double %667, double 0xC06C716E091922FB)
  %669 = tail call double @llvm.fma.f64(double %604, double %668, double 0x403292F8F6E8BC75)
  %670 = tail call double @llvm.fma.f64(double %604, double %669, double 0xC001B469C212BD5F)
  %671 = tail call double @llvm.fma.f64(double %604, double %670, double 0xBF804977FB6D0462)
  %672 = tail call double @llvm.fma.f64(double %604, double %671, double 0x3FF0001DC9F52F8A)
  br label %693

673:                                              ; preds = %660
  %674 = fcmp ogt double %35, 0x7B0000000000000
  br i1 %674, label %675, label %686

675:                                              ; preds = %673
  %676 = tail call double @llvm.fma.f64(double %604, double 0xC1821913925F3A73, double 0x4174AA2FBA282B9B)
  %677 = tail call double @llvm.fma.f64(double %604, double %676, double 0xC155A2A3F9742896)
  %678 = tail call double @llvm.fma.f64(double %604, double %677, double 0x412B8EE3895772E8)
  %679 = tail call double @llvm.fma.f64(double %604, double %678, double 0xC0F7F2CE0B036BE4)
  %680 = tail call double @llvm.fma.f64(double %604, double %679, double 0x40BE62AB1BCBB738)
  %681 = tail call double @llvm.fma.f64(double %604, double %680, double 0xC07E0ED2965D2A06)
  %682 = tail call double @llvm.fma.f64(double %604, double %681, double 0x403B0C16705263E5)
  %683 = tail call double @llvm.fma.f64(double %604, double %682, double 0xC00334F9A732ECC7)
  %684 = tail call double @llvm.fma.f64(double %604, double %683, double 0xBF765F60412F9578)
  %685 = tail call double @llvm.fma.f64(double %604, double %684, double 0x3FF0000E0BDA43B5)
  br label %693

686:                                              ; preds = %673
  %687 = tail call double @llvm.fma.f64(double %604, double 0xC0AE3D70F1FDC7BE, double 0x40928D9ACD5B9596)
  %688 = tail call double @llvm.fma.f64(double %604, double %687, double 0xC06554C1CE591414)
  %689 = tail call double @llvm.fma.f64(double %604, double %688, double 0x40315B1E5A1FE7F5)
  %690 = tail call double @llvm.fma.f64(double %604, double %689, double 0xC001AA8E6F616C69)
  %691 = tail call double @llvm.fma.f64(double %604, double %690, double 0xBF7F6803B3B4D6CC)
  %692 = tail call double @llvm.fma.f64(double %604, double %691, double 0x3FF00019AC5BED2A)
  br label %693

693:                                              ; preds = %686, %675, %662, %648, %634, %620, %606
  %694 = phi double [ %617, %606 ], [ %631, %620 ], [ %645, %634 ], [ %659, %648 ], [ %672, %662 ], [ %685, %675 ], [ %692, %686 ]
  %695 = fmul double %603, %694
  br label %696

696:                                              ; preds = %375, %384, %693
  %697 = phi double [ %381, %375 ], [ %495, %384 ], [ %695, %693 ]
  %698 = fcmp oeq double %35, 2.000000e+00
  %699 = fcmp oeq double %35, 0.000000e+00
  %700 = fcmp olt double %35, 0.000000e+00
  %701 = fcmp ogt double %35, 2.000000e+00
  %702 = or i1 %700, %701
  %703 = select i1 %702, double 0x7FF8000000000000, double %697
  %704 = select i1 %699, double 0x7FF0000000000000, double %703
  %705 = select i1 %698, double 0xFFF0000000000000, double %704
  %706 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %705, double addrspace(1)* %706, align 8, !tbaa !16
  br label %707

707:                                              ; preds = %696, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

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
