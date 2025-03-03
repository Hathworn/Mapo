; ModuleID = '../data/hip_kernels/16034/63/main.cu'
source_filename = "../data/hip_kernels/16034/63/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_normcdfinv(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %709

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = fadd double %35, %35
  %37 = fcmp ogt double %36, 6.250000e-01
  br i1 %37, label %38, label %383

38:                                               ; preds = %32
  %39 = fsub double 1.000000e+00, %36
  %40 = tail call double @llvm.fabs.f64(double %39)
  %41 = fcmp olt double %40, 3.750000e-01
  br i1 %41, label %42, label %60

42:                                               ; preds = %38
  %43 = fmul double %39, %39
  %44 = tail call double @llvm.fma.f64(double %43, double 0x3FDC5EC06CD8002B, double 0xBFEBB7DD47AEF0D6)
  %45 = tail call double @llvm.fma.f64(double %43, double %44, double 0x3FED189992ECCDB6)
  %46 = tail call double @llvm.fma.f64(double %43, double %45, double 0xBFE10EC180CDE957)
  %47 = tail call double @llvm.fma.f64(double %43, double %46, double 0x3FD05CCE379DD66F)
  %48 = tail call double @llvm.fma.f64(double %43, double %47, double 0xBFA6B9067E3DAE74)
  %49 = tail call double @llvm.fma.f64(double %43, double %48, double 0x3FA5F7F0487C11A3)
  %50 = tail call double @llvm.fma.f64(double %43, double %49, double 0x3F9E0FBF22B2350C)
  %51 = tail call double @llvm.fma.f64(double %43, double %50, double 0x3FA2CE26322B7F90)
  %52 = tail call double @llvm.fma.f64(double %43, double %51, double 0x3FA5EBEEEE81DD31)
  %53 = tail call double @llvm.fma.f64(double %43, double %52, double 0x3FAA7CACB897F0D4)
  %54 = tail call double @llvm.fma.f64(double %43, double %53, double 0x3FB0A130D62CBA32)
  %55 = tail call double @llvm.fma.f64(double %43, double %54, double 0x3FB62847C8653359)
  %56 = tail call double @llvm.fma.f64(double %43, double %55, double 0x3FC053C2C0A5E083)
  %57 = tail call double @llvm.fma.f64(double %43, double %56, double 0x3FCDB29FB2FEEC72)
  %58 = tail call double @llvm.fma.f64(double %43, double %57, double 0x3FEC5BF891B4EF6A)
  %59 = fmul double %40, %58
  br label %376

60:                                               ; preds = %38
  %61 = fcmp olt double %40, 0x3FEFFFE000000000
  br i1 %61, label %62, label %240

62:                                               ; preds = %60
  %63 = fneg double %40
  %64 = tail call double @llvm.fma.f64(double %63, double %40, double 1.000000e+00)
  %65 = tail call double @llvm.amdgcn.frexp.mant.f64(double %64)
  %66 = fcmp olt double %65, 0x3FE5555555555555
  %67 = zext i1 %66 to i32
  %68 = tail call double @llvm.amdgcn.ldexp.f64(double %65, i32 %67)
  %69 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %64)
  %70 = sub nsw i32 %69, %67
  %71 = fadd double %68, -1.000000e+00
  %72 = fadd double %68, 1.000000e+00
  %73 = fadd double %72, -1.000000e+00
  %74 = fsub double %68, %73
  %75 = tail call double @llvm.amdgcn.rcp.f64(double %72)
  %76 = fneg double %72
  %77 = tail call double @llvm.fma.f64(double %76, double %75, double 1.000000e+00)
  %78 = tail call double @llvm.fma.f64(double %77, double %75, double %75)
  %79 = tail call double @llvm.fma.f64(double %76, double %78, double 1.000000e+00)
  %80 = tail call double @llvm.fma.f64(double %79, double %78, double %78)
  %81 = fmul double %71, %80
  %82 = fmul double %72, %81
  %83 = fneg double %82
  %84 = tail call double @llvm.fma.f64(double %81, double %72, double %83)
  %85 = tail call double @llvm.fma.f64(double %81, double %74, double %84)
  %86 = fadd double %82, %85
  %87 = fsub double %86, %82
  %88 = fsub double %85, %87
  %89 = fsub double %71, %86
  %90 = fsub double %71, %89
  %91 = fsub double %90, %86
  %92 = fsub double %91, %88
  %93 = fadd double %89, %92
  %94 = fmul double %80, %93
  %95 = fadd double %81, %94
  %96 = fsub double %95, %81
  %97 = fsub double %94, %96
  %98 = fmul double %95, %95
  %99 = tail call double @llvm.fma.f64(double %98, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %100 = tail call double @llvm.fma.f64(double %98, double %99, double 0x3FC7474DD7F4DF2E)
  %101 = tail call double @llvm.fma.f64(double %98, double %100, double 0x3FCC71C016291751)
  %102 = tail call double @llvm.fma.f64(double %98, double %101, double 0x3FD249249B27ACF1)
  %103 = tail call double @llvm.fma.f64(double %98, double %102, double 0x3FD99999998EF7B6)
  %104 = tail call double @llvm.fma.f64(double %98, double %103, double 0x3FE5555555555780)
  %105 = tail call double @llvm.amdgcn.ldexp.f64(double %95, i32 1)
  %106 = tail call double @llvm.amdgcn.ldexp.f64(double %97, i32 1)
  %107 = fmul double %95, %98
  %108 = fmul double %107, %104
  %109 = fadd double %105, %108
  %110 = fsub double %109, %105
  %111 = fsub double %108, %110
  %112 = fadd double %106, %111
  %113 = fadd double %109, %112
  %114 = fsub double %113, %109
  %115 = fsub double %112, %114
  %116 = sitofp i32 %70 to double
  %117 = fmul double %116, 0x3FE62E42FEFA39EF
  %118 = fneg double %117
  %119 = tail call double @llvm.fma.f64(double %116, double 0x3FE62E42FEFA39EF, double %118)
  %120 = tail call double @llvm.fma.f64(double %116, double 0x3C7ABC9E3B39803F, double %119)
  %121 = fadd double %117, %120
  %122 = fsub double %121, %117
  %123 = fsub double %120, %122
  %124 = fadd double %121, %113
  %125 = fsub double %124, %121
  %126 = fsub double %124, %125
  %127 = fsub double %121, %126
  %128 = fsub double %113, %125
  %129 = fadd double %128, %127
  %130 = fadd double %123, %115
  %131 = fsub double %130, %123
  %132 = fsub double %130, %131
  %133 = fsub double %123, %132
  %134 = fsub double %115, %131
  %135 = fadd double %134, %133
  %136 = fadd double %130, %129
  %137 = fadd double %124, %136
  %138 = fsub double %137, %124
  %139 = fsub double %136, %138
  %140 = fadd double %135, %139
  %141 = fadd double %137, %140
  %142 = tail call double @llvm.fabs.f64(double %64) #3
  %143 = fcmp oeq double %142, 0x7FF0000000000000
  %144 = select i1 %143, double %64, double %141
  %145 = fcmp olt double %64, 0.000000e+00
  %146 = select i1 %145, double 0x7FF8000000000000, double %144
  %147 = fcmp oeq double %64, 0.000000e+00
  %148 = select i1 %147, double 0xFFF0000000000000, double %146
  %149 = fcmp ogt double %148, -6.250000e+00
  br i1 %149, label %150, label %174

150:                                              ; preds = %62
  %151 = fsub double -3.125000e+00, %148
  %152 = tail call double @llvm.fma.f64(double %151, double 0xBBB135D2E746E627, double 0xBC08DDF93324D327)
  %153 = tail call double @llvm.fma.f64(double %151, double %152, double 0x3C37B83EEF0B7C9F)
  %154 = tail call double @llvm.fma.f64(double %151, double %153, double 0x3C69BA72CD589B91)
  %155 = tail call double @llvm.fma.f64(double %151, double %154, double 0xBCA33689090A6B96)
  %156 = tail call double @llvm.fma.f64(double %151, double %155, double 0x3C782E11898132E0)
  %157 = tail call double @llvm.fma.f64(double %151, double %156, double 0x3CFDE4ACFD9E26BA)
  %158 = tail call double @llvm.fma.f64(double %151, double %157, double 0xBD26D33EED66C487)
  %159 = tail call double @llvm.fma.f64(double %151, double %158, double 0xBD36F2167040D8E2)
  %160 = tail call double @llvm.fma.f64(double %151, double %159, double 0x3D872A22C2D77E20)
  %161 = tail call double @llvm.fma.f64(double %151, double %160, double 0xBDAC8859C4E5C0AF)
  %162 = tail call double @llvm.fma.f64(double %151, double %161, double 0xBDCDC583D118A561)
  %163 = tail call double @llvm.fma.f64(double %151, double %162, double 0x3E120F47CCF46B3C)
  %164 = tail call double @llvm.fma.f64(double %151, double %163, double 0xBE31A9E38DC84D60)
  %165 = tail call double @llvm.fma.f64(double %151, double %164, double 0xBE5F36CD6D3D46A9)
  %166 = tail call double @llvm.fma.f64(double %151, double %165, double 0x3E9C6B4F5D03B787)
  %167 = tail call double @llvm.fma.f64(double %151, double %166, double 0xBEB6E8A5434AE8A2)
  %168 = tail call double @llvm.fma.f64(double %151, double %167, double 0xBEED1D1F7B8736F6)
  %169 = tail call double @llvm.fma.f64(double %151, double %168, double 0x3F2879C2A212F024)
  %170 = tail call double @llvm.fma.f64(double %151, double %169, double 0xBF4845769484FCA8)
  %171 = tail call double @llvm.fma.f64(double %151, double %170, double 0xBF78B6C33114F909)
  %172 = tail call double @llvm.fma.f64(double %151, double %171, double 0x3FCEBD80D9B13E28)
  %173 = tail call double @llvm.fma.f64(double %151, double %172, double 0x3FFA755E7C99AE86)
  br label %237

174:                                              ; preds = %62
  %175 = fneg double %148
  %176 = fcmp ogt double %148, -1.600000e+01
  %177 = fcmp ogt double %148, 0x9000000000000000
  %178 = select i1 %177, double 0x4FF0000000000000, double 1.000000e+00
  %179 = fmul double %178, %175
  %180 = tail call double @llvm.amdgcn.rsq.f64(double %179)
  %181 = fmul double %179, %180
  %182 = fmul double %180, 5.000000e-01
  %183 = fneg double %182
  %184 = tail call double @llvm.fma.f64(double %183, double %181, double 5.000000e-01)
  %185 = tail call double @llvm.fma.f64(double %182, double %184, double %182)
  %186 = tail call double @llvm.fma.f64(double %181, double %184, double %181)
  %187 = fneg double %186
  %188 = tail call double @llvm.fma.f64(double %187, double %186, double %179)
  %189 = tail call double @llvm.fma.f64(double %188, double %185, double %186)
  %190 = fneg double %189
  %191 = tail call double @llvm.fma.f64(double %190, double %189, double %179)
  %192 = tail call double @llvm.fma.f64(double %191, double %185, double %189)
  %193 = select i1 %177, double 0x37F0000000000000, double 1.000000e+00
  %194 = fmul double %193, %192
  %195 = fcmp oeq double %179, 0.000000e+00
  %196 = fcmp oeq double %179, 0x7FF0000000000000
  %197 = or i1 %195, %196
  %198 = select i1 %197, double %179, double %194
  br i1 %176, label %199, label %219

199:                                              ; preds = %174
  %200 = fadd double %198, -3.250000e+00
  %201 = tail call double @llvm.fma.f64(double %200, double 0x3E23040F87DBD932, double 0x3E785CBE52878635)
  %202 = tail call double @llvm.fma.f64(double %200, double %201, double 0xBE92777453DD3955)
  %203 = tail call double @llvm.fma.f64(double %200, double %202, double 0x3E5395ABCD554C6C)
  %204 = tail call double @llvm.fma.f64(double %200, double %203, double 0x3EB936388A3790AD)
  %205 = tail call double @llvm.fma.f64(double %200, double %204, double 0xBED0D5DB812B5083)
  %206 = tail call double @llvm.fma.f64(double %200, double %205, double 0x3EC8860CD5D652F6)
  %207 = tail call double @llvm.fma.f64(double %200, double %206, double 0x3EEA29A0CACDFB23)
  %208 = tail call double @llvm.fma.f64(double %200, double %207, double 0xBF08CEF1F80281F2)
  %209 = tail call double @llvm.fma.f64(double %200, double %208, double 0x3F11E684D0B9188A)
  %210 = tail call double @llvm.fma.f64(double %200, double %209, double 0x3EF932CD54C8A222)
  %211 = tail call double @llvm.fma.f64(double %200, double %210, double 0xBF37448A89EF8AA3)
  %212 = tail call double @llvm.fma.f64(double %200, double %211, double 0x3F4F3CC55AD40C25)
  %213 = tail call double @llvm.fma.f64(double %200, double %212, double 0xBF5BA924132F38B1)
  %214 = tail call double @llvm.fma.f64(double %200, double %213, double 0x3F6468EECA533CF8)
  %215 = tail call double @llvm.fma.f64(double %200, double %214, double 0xBF6EBADABB891BBD)
  %216 = tail call double @llvm.fma.f64(double %200, double %215, double 0x3F75FFCFE5B76AFC)
  %217 = tail call double @llvm.fma.f64(double %200, double %216, double 0x3FF0158A6D641D39)
  %218 = tail call double @llvm.fma.f64(double %200, double %217, double 0x4008ABCC380D5A48)
  br label %237

219:                                              ; preds = %174
  %220 = fadd double %198, -5.000000e+00
  %221 = tail call double @llvm.fma.f64(double %220, double 0xBDBDCEC3A7785389, double 0xBDF18FEEC0E38727)
  %222 = tail call double @llvm.fma.f64(double %220, double %221, double 0x3E19E6BF2DDA45E3)
  %223 = tail call double @llvm.fma.f64(double %220, double %222, double 0xBE30468FB24E2F5F)
  %224 = tail call double @llvm.fma.f64(double %220, double %223, double 0x3E405AC6A8FBA182)
  %225 = tail call double @llvm.fma.f64(double %220, double %224, double 0xBE50102E495FB9C0)
  %226 = tail call double @llvm.fma.f64(double %220, double %225, double 0x3E5F4C20E1334AF8)
  %227 = tail call double @llvm.fma.f64(double %220, double %226, double 0xBE722D220FDF9C3E)
  %228 = tail call double @llvm.fma.f64(double %220, double %227, double 0x3E8EBC8BB824CB54)
  %229 = tail call double @llvm.fma.f64(double %220, double %228, double 0xBEB0A8D40EA372CC)
  %230 = tail call double @llvm.fma.f64(double %220, double %229, double 0x3ED2FBD29D093D2B)
  %231 = tail call double @llvm.fma.f64(double %220, double %230, double 0xBEF4A3497E1E0FAC)
  %232 = tail call double @llvm.fma.f64(double %220, double %231, double 0x3F13EBF4EB00938F)
  %233 = tail call double @llvm.fma.f64(double %220, double %232, double 0xBF2C2F36A8FC5D53)
  %234 = tail call double @llvm.fma.f64(double %220, double %233, double 0xBF222EA5DF04047C)
  %235 = tail call double @llvm.fma.f64(double %220, double %234, double 0x3FF02A30D1FBA0DC)
  %236 = tail call double @llvm.fma.f64(double %220, double %235, double 0x4013664DDD1AD7FB)
  br label %237

237:                                              ; preds = %219, %199, %150
  %238 = phi double [ %173, %150 ], [ %218, %199 ], [ %236, %219 ]
  %239 = fmul double %40, %238
  br label %376

240:                                              ; preds = %60
  %241 = fsub double 1.000000e+00, %40
  %242 = tail call double @llvm.amdgcn.frexp.mant.f64(double %241)
  %243 = fcmp olt double %242, 0x3FE5555555555555
  %244 = zext i1 %243 to i32
  %245 = tail call double @llvm.amdgcn.ldexp.f64(double %242, i32 %244)
  %246 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %241)
  %247 = sub nsw i32 %246, %244
  %248 = fadd double %245, -1.000000e+00
  %249 = fadd double %245, 1.000000e+00
  %250 = fadd double %249, -1.000000e+00
  %251 = fsub double %245, %250
  %252 = tail call double @llvm.amdgcn.rcp.f64(double %249)
  %253 = fneg double %249
  %254 = tail call double @llvm.fma.f64(double %253, double %252, double 1.000000e+00)
  %255 = tail call double @llvm.fma.f64(double %254, double %252, double %252)
  %256 = tail call double @llvm.fma.f64(double %253, double %255, double 1.000000e+00)
  %257 = tail call double @llvm.fma.f64(double %256, double %255, double %255)
  %258 = fmul double %248, %257
  %259 = fmul double %249, %258
  %260 = fneg double %259
  %261 = tail call double @llvm.fma.f64(double %258, double %249, double %260)
  %262 = tail call double @llvm.fma.f64(double %258, double %251, double %261)
  %263 = fadd double %259, %262
  %264 = fsub double %263, %259
  %265 = fsub double %262, %264
  %266 = fsub double %248, %263
  %267 = fsub double %248, %266
  %268 = fsub double %267, %263
  %269 = fsub double %268, %265
  %270 = fadd double %266, %269
  %271 = fmul double %257, %270
  %272 = fadd double %258, %271
  %273 = fsub double %272, %258
  %274 = fsub double %271, %273
  %275 = fmul double %272, %272
  %276 = tail call double @llvm.fma.f64(double %275, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %277 = tail call double @llvm.fma.f64(double %275, double %276, double 0x3FC7474DD7F4DF2E)
  %278 = tail call double @llvm.fma.f64(double %275, double %277, double 0x3FCC71C016291751)
  %279 = tail call double @llvm.fma.f64(double %275, double %278, double 0x3FD249249B27ACF1)
  %280 = tail call double @llvm.fma.f64(double %275, double %279, double 0x3FD99999998EF7B6)
  %281 = tail call double @llvm.fma.f64(double %275, double %280, double 0x3FE5555555555780)
  %282 = tail call double @llvm.amdgcn.ldexp.f64(double %272, i32 1)
  %283 = tail call double @llvm.amdgcn.ldexp.f64(double %274, i32 1)
  %284 = fmul double %272, %275
  %285 = fmul double %284, %281
  %286 = fadd double %282, %285
  %287 = fsub double %286, %282
  %288 = fsub double %285, %287
  %289 = fadd double %283, %288
  %290 = fadd double %286, %289
  %291 = fsub double %290, %286
  %292 = fsub double %289, %291
  %293 = sitofp i32 %247 to double
  %294 = fmul double %293, 0x3FE62E42FEFA39EF
  %295 = fneg double %294
  %296 = tail call double @llvm.fma.f64(double %293, double 0x3FE62E42FEFA39EF, double %295)
  %297 = tail call double @llvm.fma.f64(double %293, double 0x3C7ABC9E3B39803F, double %296)
  %298 = fadd double %294, %297
  %299 = fsub double %298, %294
  %300 = fsub double %297, %299
  %301 = fadd double %298, %290
  %302 = fsub double %301, %298
  %303 = fsub double %301, %302
  %304 = fsub double %298, %303
  %305 = fsub double %290, %302
  %306 = fadd double %305, %304
  %307 = fadd double %300, %292
  %308 = fsub double %307, %300
  %309 = fsub double %307, %308
  %310 = fsub double %300, %309
  %311 = fsub double %292, %308
  %312 = fadd double %311, %310
  %313 = fadd double %307, %306
  %314 = fadd double %301, %313
  %315 = fsub double %314, %301
  %316 = fsub double %313, %315
  %317 = fadd double %312, %316
  %318 = fadd double %314, %317
  %319 = tail call double @llvm.fabs.f64(double %241) #3
  %320 = fcmp oeq double %319, 0x7FF0000000000000
  %321 = select i1 %320, double %241, double %318
  %322 = fcmp olt double %241, 0.000000e+00
  %323 = select i1 %322, double 0x7FF8000000000000, double %321
  %324 = fcmp oeq double %241, 0.000000e+00
  %325 = select i1 %324, double 0xFFF0000000000000, double %323
  %326 = fneg double %325
  %327 = fcmp ogt double %325, 0x9000000000000000
  %328 = select i1 %327, double 0x4FF0000000000000, double 1.000000e+00
  %329 = fmul double %328, %326
  %330 = tail call double @llvm.amdgcn.rsq.f64(double %329)
  %331 = fmul double %329, %330
  %332 = fmul double %330, 5.000000e-01
  %333 = fneg double %332
  %334 = tail call double @llvm.fma.f64(double %333, double %331, double 5.000000e-01)
  %335 = tail call double @llvm.fma.f64(double %332, double %334, double %332)
  %336 = tail call double @llvm.fma.f64(double %331, double %334, double %331)
  %337 = fneg double %336
  %338 = tail call double @llvm.fma.f64(double %337, double %336, double %329)
  %339 = tail call double @llvm.fma.f64(double %338, double %335, double %336)
  %340 = fneg double %339
  %341 = tail call double @llvm.fma.f64(double %340, double %339, double %329)
  %342 = tail call double @llvm.fma.f64(double %341, double %335, double %339)
  %343 = select i1 %327, double 0x37F0000000000000, double 1.000000e+00
  %344 = fmul double %343, %342
  %345 = fcmp oeq double %329, 0.000000e+00
  %346 = fcmp oeq double %329, 0x7FF0000000000000
  %347 = or i1 %345, %346
  %348 = select i1 %347, double %329, double %344
  %349 = fdiv double 1.000000e+00, %348
  %350 = fcmp olt double %40, 0x3FEFFFFFFFE00000
  br i1 %350, label %351, label %363

351:                                              ; preds = %240
  %352 = tail call double @llvm.fma.f64(double %349, double 0x406C4BD831A51669, double 0xC0866AF45B757C26)
  %353 = tail call double @llvm.fma.f64(double %349, double %352, double 0x409061B293EE1671)
  %354 = tail call double @llvm.fma.f64(double %349, double %353, double 0xC08D4AA0FD7248E9)
  %355 = tail call double @llvm.fma.f64(double %349, double %354, double 0x4081EEBB0088748D)
  %356 = tail call double @llvm.fma.f64(double %349, double %355, double 0xC06FF4CB6C165EFE)
  %357 = tail call double @llvm.fma.f64(double %349, double %356, double 0x40559C379A609255)
  %358 = tail call double @llvm.fma.f64(double %349, double %357, double 0xC03762B2677680C6)
  %359 = tail call double @llvm.fma.f64(double %349, double %358, double 0x4017626132CF7C5A)
  %360 = tail call double @llvm.fma.f64(double %349, double %359, double 0xBFFA298CC231A949)
  %361 = tail call double @llvm.fma.f64(double %349, double %360, double 0xBF99FA2D429B22CA)
  %362 = tail call double @llvm.fma.f64(double %349, double %361, double 0x3FF00131C4B15D15)
  br label %373

363:                                              ; preds = %240
  %364 = tail call double @llvm.fma.f64(double %349, double 0x406E1F462CC8E58A, double 0xC07DD260D25BEE8D)
  %365 = tail call double @llvm.fma.f64(double %349, double %364, double 0x407AF7DAB6C206E6)
  %366 = tail call double @llvm.fma.f64(double %349, double %365, double 0xC06D97C75A0F5809)
  %367 = tail call double @llvm.fma.f64(double %349, double %366, double 0x405632C20BF45D30)
  %368 = tail call double @llvm.fma.f64(double %349, double %367, double 0xC038E4908179A727)
  %369 = tail call double @llvm.fma.f64(double %349, double %368, double 0x40189538A73A2C3C)
  %370 = tail call double @llvm.fma.f64(double %349, double %369, double 0xBFFAAD8569B3607D)
  %371 = tail call double @llvm.fma.f64(double %349, double %370, double 0xBF980D1BEC4B54CB)
  %372 = tail call double @llvm.fma.f64(double %349, double %371, double 0x3FF001006F90EA2C)
  br label %373

373:                                              ; preds = %363, %351
  %374 = phi double [ %362, %351 ], [ %372, %363 ]
  %375 = fmul double %348, %374
  br label %376

376:                                              ; preds = %373, %237, %42
  %377 = phi double [ %59, %42 ], [ %239, %237 ], [ %375, %373 ]
  %378 = fcmp ogt double %40, 1.000000e+00
  %379 = select i1 %378, double 0x7FF8000000000000, double %377
  %380 = fcmp oeq double %40, 1.000000e+00
  %381 = select i1 %380, double 0x7FF0000000000000, double %379
  %382 = tail call double @llvm.copysign.f64(double %381, double %39)
  br label %697

383:                                              ; preds = %32
  %384 = fcmp ogt double %36, 0x3F50000000000000
  br i1 %384, label %385, label %497

385:                                              ; preds = %383
  %386 = fsub double 2.000000e+00, %36
  %387 = fmul double %36, %386
  %388 = tail call double @llvm.amdgcn.frexp.mant.f64(double %387)
  %389 = fcmp olt double %388, 0x3FE5555555555555
  %390 = zext i1 %389 to i32
  %391 = tail call double @llvm.amdgcn.ldexp.f64(double %388, i32 %390)
  %392 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %387)
  %393 = sub nsw i32 %392, %390
  %394 = fadd double %391, -1.000000e+00
  %395 = fadd double %391, 1.000000e+00
  %396 = fadd double %395, -1.000000e+00
  %397 = fsub double %391, %396
  %398 = tail call double @llvm.amdgcn.rcp.f64(double %395)
  %399 = fneg double %395
  %400 = tail call double @llvm.fma.f64(double %399, double %398, double 1.000000e+00)
  %401 = tail call double @llvm.fma.f64(double %400, double %398, double %398)
  %402 = tail call double @llvm.fma.f64(double %399, double %401, double 1.000000e+00)
  %403 = tail call double @llvm.fma.f64(double %402, double %401, double %401)
  %404 = fmul double %394, %403
  %405 = fmul double %395, %404
  %406 = fneg double %405
  %407 = tail call double @llvm.fma.f64(double %404, double %395, double %406)
  %408 = tail call double @llvm.fma.f64(double %404, double %397, double %407)
  %409 = fadd double %405, %408
  %410 = fsub double %409, %405
  %411 = fsub double %408, %410
  %412 = fsub double %394, %409
  %413 = fsub double %394, %412
  %414 = fsub double %413, %409
  %415 = fsub double %414, %411
  %416 = fadd double %412, %415
  %417 = fmul double %403, %416
  %418 = fadd double %404, %417
  %419 = fsub double %418, %404
  %420 = fsub double %417, %419
  %421 = fmul double %418, %418
  %422 = tail call double @llvm.fma.f64(double %421, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %423 = tail call double @llvm.fma.f64(double %421, double %422, double 0x3FC7474DD7F4DF2E)
  %424 = tail call double @llvm.fma.f64(double %421, double %423, double 0x3FCC71C016291751)
  %425 = tail call double @llvm.fma.f64(double %421, double %424, double 0x3FD249249B27ACF1)
  %426 = tail call double @llvm.fma.f64(double %421, double %425, double 0x3FD99999998EF7B6)
  %427 = tail call double @llvm.fma.f64(double %421, double %426, double 0x3FE5555555555780)
  %428 = tail call double @llvm.amdgcn.ldexp.f64(double %418, i32 1)
  %429 = tail call double @llvm.amdgcn.ldexp.f64(double %420, i32 1)
  %430 = fmul double %418, %421
  %431 = fmul double %430, %427
  %432 = fadd double %428, %431
  %433 = fsub double %432, %428
  %434 = fsub double %431, %433
  %435 = fadd double %429, %434
  %436 = fadd double %432, %435
  %437 = fsub double %436, %432
  %438 = fsub double %435, %437
  %439 = sitofp i32 %393 to double
  %440 = fmul double %439, 0x3FE62E42FEFA39EF
  %441 = fneg double %440
  %442 = tail call double @llvm.fma.f64(double %439, double 0x3FE62E42FEFA39EF, double %441)
  %443 = tail call double @llvm.fma.f64(double %439, double 0x3C7ABC9E3B39803F, double %442)
  %444 = fadd double %440, %443
  %445 = fsub double %444, %440
  %446 = fsub double %443, %445
  %447 = fadd double %444, %436
  %448 = fsub double %447, %444
  %449 = fsub double %447, %448
  %450 = fsub double %444, %449
  %451 = fsub double %436, %448
  %452 = fadd double %451, %450
  %453 = fadd double %446, %438
  %454 = fsub double %453, %446
  %455 = fsub double %453, %454
  %456 = fsub double %446, %455
  %457 = fsub double %438, %454
  %458 = fadd double %457, %456
  %459 = fadd double %453, %452
  %460 = fadd double %447, %459
  %461 = fsub double %460, %447
  %462 = fsub double %459, %461
  %463 = fadd double %458, %462
  %464 = fadd double %460, %463
  %465 = tail call double @llvm.fabs.f64(double %387) #3
  %466 = fcmp oeq double %465, 0x7FF0000000000000
  %467 = select i1 %466, double %387, double %464
  %468 = fcmp olt double %387, 0.000000e+00
  %469 = fcmp oeq double %387, 0.000000e+00
  %470 = fsub double -3.125000e+00, %467
  %471 = select i1 %468, double 0x7FF8000000000000, double %470
  %472 = select i1 %469, double 0x7FF0000000000000, double %471
  %473 = tail call double @llvm.fma.f64(double %472, double 0x3BA1267A785A1166, double 0xBC0A6581051DD484)
  %474 = tail call double @llvm.fma.f64(double %472, double %473, double 0x3C32B2956FC047A4)
  %475 = tail call double @llvm.fma.f64(double %472, double %474, double 0x3C6AD835AED5CC07)
  %476 = tail call double @llvm.fma.f64(double %472, double %475, double 0xBCA25E0612EAE68F)
  %477 = tail call double @llvm.fma.f64(double %472, double %476, double 0x3C6A0CAB63F02A91)
  %478 = tail call double @llvm.fma.f64(double %472, double %477, double 0x3CFD9227AF501ADB)
  %479 = tail call double @llvm.fma.f64(double %472, double %478, double 0xBD26C3AD559A9B4E)
  %480 = tail call double @llvm.fma.f64(double %472, double %479, double 0xBD36CAFA36036318)
  %481 = tail call double @llvm.fma.f64(double %472, double %480, double 0x3D872879641E158F)
  %482 = tail call double @llvm.fma.f64(double %472, double %481, double 0xBDAC89D755F7FFF8)
  %483 = tail call double @llvm.fma.f64(double %472, double %482, double 0xBDCDC51171DDAE3A)
  %484 = tail call double @llvm.fma.f64(double %472, double %483, double 0x3E120F512744AE65)
  %485 = tail call double @llvm.fma.f64(double %472, double %484, double 0xBE31A9E5F4BCFCD8)
  %486 = tail call double @llvm.fma.f64(double %472, double %485, double 0xBE5F36CE926B83E8)
  %487 = tail call double @llvm.fma.f64(double %472, double %486, double 0x3E9C6B4F6C7CFA1E)
  %488 = tail call double @llvm.fma.f64(double %472, double %487, double 0xBEB6E8A53E0C2026)
  %489 = tail call double @llvm.fma.f64(double %472, double %488, double 0xBEED1D1F7BF4570B)
  %490 = tail call double @llvm.fma.f64(double %472, double %489, double 0x3F2879C2A20CC3E2)
  %491 = tail call double @llvm.fma.f64(double %472, double %490, double 0xBF48457694844D14)
  %492 = tail call double @llvm.fma.f64(double %472, double %491, double 0xBF78B6C33114EDAD)
  %493 = tail call double @llvm.fma.f64(double %472, double %492, double 0x3FCEBD80D9B13E14)
  %494 = tail call double @llvm.fma.f64(double %472, double %493, double 0x3FFA755E7C99AE86)
  %495 = fneg double %36
  %496 = tail call double @llvm.fma.f64(double %495, double %494, double %494)
  br label %697

497:                                              ; preds = %383
  %498 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %499 = fcmp olt double %498, 0x3FE5555555555555
  %500 = zext i1 %499 to i32
  %501 = tail call double @llvm.amdgcn.ldexp.f64(double %498, i32 %500)
  %502 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %503 = sub nsw i32 %502, %500
  %504 = fadd double %501, -1.000000e+00
  %505 = fadd double %501, 1.000000e+00
  %506 = fadd double %505, -1.000000e+00
  %507 = fsub double %501, %506
  %508 = tail call double @llvm.amdgcn.rcp.f64(double %505)
  %509 = fneg double %505
  %510 = tail call double @llvm.fma.f64(double %509, double %508, double 1.000000e+00)
  %511 = tail call double @llvm.fma.f64(double %510, double %508, double %508)
  %512 = tail call double @llvm.fma.f64(double %509, double %511, double 1.000000e+00)
  %513 = tail call double @llvm.fma.f64(double %512, double %511, double %511)
  %514 = fmul double %504, %513
  %515 = fmul double %505, %514
  %516 = fneg double %515
  %517 = tail call double @llvm.fma.f64(double %514, double %505, double %516)
  %518 = tail call double @llvm.fma.f64(double %514, double %507, double %517)
  %519 = fadd double %515, %518
  %520 = fsub double %519, %515
  %521 = fsub double %518, %520
  %522 = fsub double %504, %519
  %523 = fsub double %504, %522
  %524 = fsub double %523, %519
  %525 = fsub double %524, %521
  %526 = fadd double %522, %525
  %527 = fmul double %513, %526
  %528 = fadd double %514, %527
  %529 = fsub double %528, %514
  %530 = fsub double %527, %529
  %531 = fmul double %528, %528
  %532 = tail call double @llvm.fma.f64(double %531, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %533 = tail call double @llvm.fma.f64(double %531, double %532, double 0x3FC7474DD7F4DF2E)
  %534 = tail call double @llvm.fma.f64(double %531, double %533, double 0x3FCC71C016291751)
  %535 = tail call double @llvm.fma.f64(double %531, double %534, double 0x3FD249249B27ACF1)
  %536 = tail call double @llvm.fma.f64(double %531, double %535, double 0x3FD99999998EF7B6)
  %537 = tail call double @llvm.fma.f64(double %531, double %536, double 0x3FE5555555555780)
  %538 = tail call double @llvm.amdgcn.ldexp.f64(double %528, i32 1)
  %539 = tail call double @llvm.amdgcn.ldexp.f64(double %530, i32 1)
  %540 = fmul double %528, %531
  %541 = fmul double %540, %537
  %542 = fadd double %538, %541
  %543 = fsub double %542, %538
  %544 = fsub double %541, %543
  %545 = fadd double %539, %544
  %546 = fadd double %542, %545
  %547 = fsub double %546, %542
  %548 = fsub double %545, %547
  %549 = sitofp i32 %503 to double
  %550 = fmul double %549, 0x3FE62E42FEFA39EF
  %551 = fneg double %550
  %552 = tail call double @llvm.fma.f64(double %549, double 0x3FE62E42FEFA39EF, double %551)
  %553 = tail call double @llvm.fma.f64(double %549, double 0x3C7ABC9E3B39803F, double %552)
  %554 = fadd double %550, %553
  %555 = fsub double %554, %550
  %556 = fsub double %553, %555
  %557 = fadd double %554, %546
  %558 = fsub double %557, %554
  %559 = fsub double %557, %558
  %560 = fsub double %554, %559
  %561 = fsub double %546, %558
  %562 = fadd double %561, %560
  %563 = fadd double %556, %548
  %564 = fsub double %563, %556
  %565 = fsub double %563, %564
  %566 = fsub double %556, %565
  %567 = fsub double %548, %564
  %568 = fadd double %567, %566
  %569 = fadd double %563, %562
  %570 = fadd double %557, %569
  %571 = fsub double %570, %557
  %572 = fsub double %569, %571
  %573 = fadd double %568, %572
  %574 = fadd double %570, %573
  %575 = tail call double @llvm.fabs.f64(double %36) #3
  %576 = fcmp oeq double %575, 0x7FF0000000000000
  %577 = select i1 %576, double %36, double %574
  %578 = fcmp olt double %36, 0.000000e+00
  %579 = select i1 %578, double 0x7FF8000000000000, double %577
  %580 = fcmp oeq double %36, 0.000000e+00
  %581 = select i1 %580, double 0xFFF0000000000000, double %579
  %582 = fneg double %581
  %583 = fcmp ogt double %581, 0x9000000000000000
  %584 = select i1 %583, double 0x4FF0000000000000, double 1.000000e+00
  %585 = fmul double %584, %582
  %586 = tail call double @llvm.amdgcn.rsq.f64(double %585)
  %587 = fmul double %585, %586
  %588 = fmul double %586, 5.000000e-01
  %589 = fneg double %588
  %590 = tail call double @llvm.fma.f64(double %589, double %587, double 5.000000e-01)
  %591 = tail call double @llvm.fma.f64(double %588, double %590, double %588)
  %592 = tail call double @llvm.fma.f64(double %587, double %590, double %587)
  %593 = fneg double %592
  %594 = tail call double @llvm.fma.f64(double %593, double %592, double %585)
  %595 = tail call double @llvm.fma.f64(double %594, double %591, double %592)
  %596 = fneg double %595
  %597 = tail call double @llvm.fma.f64(double %596, double %595, double %585)
  %598 = tail call double @llvm.fma.f64(double %597, double %591, double %595)
  %599 = select i1 %583, double 0x37F0000000000000, double 1.000000e+00
  %600 = fmul double %599, %598
  %601 = fcmp oeq double %585, 0.000000e+00
  %602 = fcmp oeq double %585, 0x7FF0000000000000
  %603 = or i1 %601, %602
  %604 = select i1 %603, double %585, double %600
  %605 = fdiv double 1.000000e+00, %604
  %606 = fcmp ogt double %36, 0x3EC0000000000000
  br i1 %606, label %607, label %619

607:                                              ; preds = %497
  %608 = tail call double @llvm.fma.f64(double %605, double 0x4038B3CFC98A5212, double 0xC05907BCDAB54A4E)
  %609 = tail call double @llvm.fma.f64(double %605, double %608, double 0x4067659CF8216D7D)
  %610 = tail call double @llvm.fma.f64(double %605, double %609, double 0xC06AC222777F664D)
  %611 = tail call double @llvm.fma.f64(double %605, double %610, double 0x4064F2F8E33151AC)
  %612 = tail call double @llvm.fma.f64(double %605, double %611, double 0xC057D7D1EB301C4C)
  %613 = tail call double @llvm.fma.f64(double %605, double %612, double 0x40448E630C1C77E7)
  %614 = tail call double @llvm.fma.f64(double %605, double %613, double 0xC02C63E7D0E327F6)
  %615 = tail call double @llvm.fma.f64(double %605, double %614, double 0x401225B286AEB0DF)
  %616 = tail call double @llvm.fma.f64(double %605, double %615, double 0xBFF82A4ACC22B05D)
  %617 = tail call double @llvm.fma.f64(double %605, double %616, double 0xBFA0A88271680E57)
  %618 = tail call double @llvm.fma.f64(double %605, double %617, double 0x3FF001F6ACEBB122)
  br label %694

619:                                              ; preds = %497
  %620 = fcmp ogt double %36, 0x3D70000000000000
  br i1 %620, label %621, label %633

621:                                              ; preds = %619
  %622 = tail call double @llvm.fma.f64(double %605, double 0x4080FDCB40BF066D, double 0xC09870DDEAA832DB)
  %623 = tail call double @llvm.fma.f64(double %605, double %622, double 0x40A035C39E0428C4)
  %624 = tail call double @llvm.fma.f64(double %605, double %623, double 0xC09A4D3C54A3EC14)
  %625 = tail call double @llvm.fma.f64(double %605, double %624, double 0x408D382AEE6EFAE8)
  %626 = tail call double @llvm.fma.f64(double %605, double %625, double 0xC0779F9E26565BC1)
  %627 = tail call double @llvm.fma.f64(double %605, double %626, double 0x405D00E058CE9ABA)
  %628 = tail call double @llvm.fma.f64(double %605, double %627, double 0xC03C7D1E01821EB3)
  %629 = tail call double @llvm.fma.f64(double %605, double %628, double 0x4019D930BA7A3111)
  %630 = tail call double @llvm.fma.f64(double %605, double %629, double 0xBFFAF47941DD2BAA)
  %631 = tail call double @llvm.fma.f64(double %605, double %630, double 0xBF9787ECC823998B)
  %632 = tail call double @llvm.fma.f64(double %605, double %631, double 0x3FF000FAE5FB73E3)
  br label %694

633:                                              ; preds = %619
  %634 = fcmp ogt double %36, 0x3AD0000000000000
  br i1 %634, label %635, label %647

635:                                              ; preds = %633
  %636 = tail call double @llvm.fma.f64(double %605, double 0x40CC9E5B8E31C18E, double 0xC0DC866153B1BCE6)
  %637 = tail call double @llvm.fma.f64(double %605, double %636, double 0x40DA386B3B4FB25C)
  %638 = tail call double @llvm.fma.f64(double %605, double %637, double 0xC0CD7BF378E7B5FB)
  %639 = tail call double @llvm.fma.f64(double %605, double %638, double 0x40B6B416DE0A7A75)
  %640 = tail call double @llvm.fma.f64(double %605, double %639, double 0xC099757C1CF44E90)
  %641 = tail call double @llvm.fma.f64(double %605, double %640, double 0x4075B56EDEDBAA8C)
  %642 = tail call double @llvm.fma.f64(double %605, double %641, double 0xC04DA79924B4D155)
  %643 = tail call double @llvm.fma.f64(double %605, double %642, double 0x4022BA25315D612B)
  %644 = tail call double @llvm.fma.f64(double %605, double %643, double 0xBFFDE5808FBD786D)
  %645 = tail call double @llvm.fma.f64(double %605, double %644, double 0xBF904E014B9FC507)
  %646 = tail call double @llvm.fma.f64(double %605, double %645, double 0x3FF000788DF1C89F)
  br label %694

647:                                              ; preds = %633
  %648 = fcmp ogt double %36, 0x3370000000000000
  br i1 %648, label %649, label %661

649:                                              ; preds = %647
  %650 = tail call double @llvm.fma.f64(double %605, double 0x411FF518AAE00301, double 0xC125781EF98C6AA9)
  %651 = tail call double @llvm.fma.f64(double %605, double %650, double 0x411A9511B21C7715)
  %652 = tail call double @llvm.fma.f64(double %605, double %651, double 0xC1041D8F1455B21E)
  %653 = tail call double @llvm.fma.f64(double %605, double %652, double 0x40E4D4A3D4025A4C)
  %654 = tail call double @llvm.fma.f64(double %605, double %653, double 0xC0BF640FE7077996)
  %655 = tail call double @llvm.fma.f64(double %605, double %654, double 0x4091FAF674F42181)
  %656 = tail call double @llvm.fma.f64(double %605, double %655, double 0xC06080C5CD81D791)
  %657 = tail call double @llvm.fma.f64(double %605, double %656, double 0x402C0AE370098EF4)
  %658 = tail call double @llvm.fma.f64(double %605, double %657, double 0xC0008EBD67DC005A)
  %659 = tail call double @llvm.fma.f64(double %605, double %658, double 0xBF85CF3329E72289)
  %660 = tail call double @llvm.fma.f64(double %605, double %659, double 0x3FF00035E75F27E2)
  br label %694

661:                                              ; preds = %647
  %662 = fcmp ogt double %36, 0x26F0000000000000
  br i1 %662, label %663, label %674

663:                                              ; preds = %661
  %664 = tail call double @llvm.fma.f64(double %605, double 0xC13D554F00BF9D81, double 0x4138456711FF3627)
  %665 = tail call double @llvm.fma.f64(double %605, double %664, double 0xC1226C90ACC5DAAF)
  %666 = tail call double @llvm.fma.f64(double %605, double %665, double 0x410106501CDEF815)
  %667 = tail call double @llvm.fma.f64(double %605, double %666, double 0xC0D57A4C95601C04)
  %668 = tail call double @llvm.fma.f64(double %605, double %667, double 0x40A3CA627CBAEDE6)
  %669 = tail call double @llvm.fma.f64(double %605, double %668, double 0xC06C716E091922FB)
  %670 = tail call double @llvm.fma.f64(double %605, double %669, double 0x403292F8F6E8BC75)
  %671 = tail call double @llvm.fma.f64(double %605, double %670, double 0xC001B469C212BD5F)
  %672 = tail call double @llvm.fma.f64(double %605, double %671, double 0xBF804977FB6D0462)
  %673 = tail call double @llvm.fma.f64(double %605, double %672, double 0x3FF0001DC9F52F8A)
  br label %694

674:                                              ; preds = %661
  %675 = fcmp ogt double %36, 0x7B0000000000000
  br i1 %675, label %676, label %687

676:                                              ; preds = %674
  %677 = tail call double @llvm.fma.f64(double %605, double 0xC1821913925F3A73, double 0x4174AA2FBA282B9B)
  %678 = tail call double @llvm.fma.f64(double %605, double %677, double 0xC155A2A3F9742896)
  %679 = tail call double @llvm.fma.f64(double %605, double %678, double 0x412B8EE3895772E8)
  %680 = tail call double @llvm.fma.f64(double %605, double %679, double 0xC0F7F2CE0B036BE4)
  %681 = tail call double @llvm.fma.f64(double %605, double %680, double 0x40BE62AB1BCBB738)
  %682 = tail call double @llvm.fma.f64(double %605, double %681, double 0xC07E0ED2965D2A06)
  %683 = tail call double @llvm.fma.f64(double %605, double %682, double 0x403B0C16705263E5)
  %684 = tail call double @llvm.fma.f64(double %605, double %683, double 0xC00334F9A732ECC7)
  %685 = tail call double @llvm.fma.f64(double %605, double %684, double 0xBF765F60412F9578)
  %686 = tail call double @llvm.fma.f64(double %605, double %685, double 0x3FF0000E0BDA43B5)
  br label %694

687:                                              ; preds = %674
  %688 = tail call double @llvm.fma.f64(double %605, double 0xC0AE3D70F1FDC7BE, double 0x40928D9ACD5B9596)
  %689 = tail call double @llvm.fma.f64(double %605, double %688, double 0xC06554C1CE591414)
  %690 = tail call double @llvm.fma.f64(double %605, double %689, double 0x40315B1E5A1FE7F5)
  %691 = tail call double @llvm.fma.f64(double %605, double %690, double 0xC001AA8E6F616C69)
  %692 = tail call double @llvm.fma.f64(double %605, double %691, double 0xBF7F6803B3B4D6CC)
  %693 = tail call double @llvm.fma.f64(double %605, double %692, double 0x3FF00019AC5BED2A)
  br label %694

694:                                              ; preds = %687, %676, %663, %649, %635, %621, %607
  %695 = phi double [ %618, %607 ], [ %632, %621 ], [ %646, %635 ], [ %660, %649 ], [ %673, %663 ], [ %686, %676 ], [ %693, %687 ]
  %696 = fmul double %604, %695
  br label %697

697:                                              ; preds = %376, %385, %694
  %698 = phi double [ %382, %376 ], [ %496, %385 ], [ %696, %694 ]
  %699 = fcmp oeq double %36, 2.000000e+00
  %700 = fcmp oeq double %36, 0.000000e+00
  %701 = fcmp olt double %36, 0.000000e+00
  %702 = fcmp ogt double %36, 2.000000e+00
  %703 = or i1 %701, %702
  %704 = fmul double %698, 0xBFF6A09E667F3BCD
  %705 = select i1 %703, double 0x7FF8000000000000, double %704
  %706 = select i1 %700, double 0xFFF0000000000000, double %705
  %707 = select i1 %699, double 0x7FF0000000000000, double %706
  %708 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %707, double addrspace(1)* %708, align 8, !tbaa !16
  br label %709

709:                                              ; preds = %697, %3
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
