; ModuleID = '../data/hip_kernels/9000/20/main.cu'
source_filename = "../data/hip_kernels/9000/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13Corrector_gpudPdS_PimP15HIP_vector_typeIdLj4EES3_S3_S3_S3_S3_S3_ddddj(double %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture readonly %3, i64 %4, %struct.HIP_vector_type addrspace(1)* nocapture %5, %struct.HIP_vector_type addrspace(1)* nocapture %6, %struct.HIP_vector_type addrspace(1)* nocapture %7, %struct.HIP_vector_type addrspace(1)* nocapture %8, %struct.HIP_vector_type addrspace(1)* nocapture %9, %struct.HIP_vector_type addrspace(1)* nocapture %10, %struct.HIP_vector_type addrspace(1)* nocapture %11, double %12, double %13, double %14, double %15, i32 %16) local_unnamed_addr #0 {
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %18, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = zext i32 %26 to i64
  %28 = trunc i64 %4 to i32
  %29 = add i32 %26, %28
  %30 = icmp ult i64 %27, %4
  br i1 %30, label %31, label %737

31:                                               ; preds = %17
  %32 = sext i32 %29 to i64
  %33 = add i32 %29, %28
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %27
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %27
  %37 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %36, i64 0, i32 0, i32 0, i32 0, i64 0
  %38 = load double, double addrspace(1)* %37, align 32, !tbaa !11
  %39 = fmul contract double %38, %38
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %27, i32 0, i32 0, i32 0, i64 1
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !11, !amdgpu.noclobber !5
  %42 = fmul contract double %41, %41
  %43 = fadd contract double %39, %42
  %44 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %27, i32 0, i32 0, i32 0, i64 2
  %45 = load double, double addrspace(1)* %44, align 16, !tbaa !11, !amdgpu.noclobber !5
  %46 = fmul contract double %45, %45
  %47 = fadd contract double %43, %46
  %48 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %27, i32 0, i32 0, i32 0, i64 3
  store double %47, double addrspace(1)* %48, align 8, !tbaa !11
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %32
  %50 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %49, i64 0, i32 0, i32 0, i32 0, i64 0
  %51 = load double, double addrspace(1)* %50, align 32, !tbaa !11
  %52 = fmul contract double %51, %51
  %53 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %32, i32 0, i32 0, i32 0, i64 1
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !11, !amdgpu.noclobber !5
  %55 = fmul contract double %54, %54
  %56 = fadd contract double %52, %55
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %32, i32 0, i32 0, i32 0, i64 2
  %58 = load double, double addrspace(1)* %57, align 16, !tbaa !11, !amdgpu.noclobber !5
  %59 = fmul contract double %58, %58
  %60 = fadd contract double %56, %59
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %32, i32 0, i32 0, i32 0, i64 3
  store double %60, double addrspace(1)* %61, align 8, !tbaa !11
  %62 = sext i32 %33 to i64
  %63 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %62
  %64 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %63, i64 0, i32 0, i32 0, i32 0, i64 0
  %65 = load double, double addrspace(1)* %64, align 32, !tbaa !11
  %66 = fmul contract double %65, %65
  %67 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %62, i32 0, i32 0, i32 0, i64 1
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !11, !amdgpu.noclobber !5
  %69 = fmul contract double %68, %68
  %70 = fadd contract double %66, %69
  %71 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %62, i32 0, i32 0, i32 0, i64 2
  %72 = load double, double addrspace(1)* %71, align 16, !tbaa !11, !amdgpu.noclobber !5
  %73 = fmul contract double %72, %72
  %74 = fadd contract double %70, %73
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %62, i32 0, i32 0, i32 0, i64 3
  store double %74, double addrspace(1)* %75, align 8, !tbaa !11
  %76 = sext i32 %35 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %1, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !12
  %79 = fsub contract double %0, %78
  store double %0, double addrspace(1)* %77, align 8, !tbaa !12
  %80 = fmul contract double %79, 5.000000e-01
  %81 = fmul contract double %80, %80
  %82 = fmul contract double %80, %81
  %83 = fdiv contract double 7.500000e-01, %82
  %84 = fmul contract double %81, %81
  %85 = fdiv contract double 1.500000e+00, %84
  %86 = fmul contract double %80, %84
  %87 = fdiv contract double 7.500000e+00, %86
  %88 = load double, double addrspace(1)* %37, align 32, !tbaa !11
  %89 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %76
  %90 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %89, i64 0, i32 0, i32 0, i32 0, i64 0
  %91 = load double, double addrspace(1)* %90, align 32, !tbaa !11
  %92 = fsub contract double %88, %91
  %93 = fadd contract double %88, %91
  %94 = load double, double addrspace(1)* %50, align 32, !tbaa !11
  %95 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %76
  %96 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %95, i64 0, i32 0, i32 0, i32 0, i64 0
  %97 = load double, double addrspace(1)* %96, align 32, !tbaa !11
  %98 = fsub contract double %94, %97
  %99 = fmul contract double %80, %98
  %100 = fadd contract double %94, %97
  %101 = fmul contract double %80, %100
  %102 = load double, double addrspace(1)* %64, align 32, !tbaa !11
  %103 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %76
  %104 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %103, i64 0, i32 0, i32 0, i32 0, i64 0
  %105 = load double, double addrspace(1)* %104, align 32, !tbaa !11
  %106 = fsub contract double %102, %105
  %107 = fmul contract double %81, %106
  %108 = fadd contract double %102, %105
  %109 = fmul contract double %81, %108
  %110 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %76, i32 0, i32 0, i32 0, i64 0
  %111 = load double, double addrspace(1)* %110, align 32, !tbaa !11
  %112 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %76, i32 0, i32 0, i32 0, i64 0
  %113 = load double, double addrspace(1)* %112, align 32, !tbaa !11
  %114 = fmul contract double %80, %113
  %115 = fadd contract double %111, %114
  %116 = fmul contract double %81, 4.000000e-01
  %117 = fmul contract double %116, %92
  %118 = fsub contract double %115, %117
  %119 = fmul contract double %81, 0x3FB1111111111111
  %120 = fmul contract double %119, %101
  %121 = fadd contract double %120, %118
  store double %121, double addrspace(1)* %110, align 32, !tbaa !11
  %122 = load double, double addrspace(1)* %112, align 32, !tbaa !11
  %123 = fmul contract double %80, %93
  %124 = fadd contract double %123, %122
  %125 = fmul contract double %80, 4.000000e-01
  %126 = fmul contract double %125, %99
  %127 = fsub contract double %124, %126
  %128 = fmul contract double %80, 0x3FB1111111111111
  %129 = fmul contract double %128, %109
  %130 = fadd contract double %129, %127
  store double %130, double addrspace(1)* %112, align 32, !tbaa !11
  %131 = fmul contract double %80, %130
  %132 = load double, double addrspace(1)* %110, align 32, !tbaa !11
  %133 = fadd contract double %132, %131
  store double %133, double addrspace(1)* %110, align 32, !tbaa !11
  %134 = fmul contract double %92, 5.000000e+00
  %135 = fmul contract double %101, 5.000000e+00
  %136 = fsub contract double %135, %134
  %137 = fsub contract double %136, %107
  %138 = fmul contract double %83, %137
  %139 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %76, i32 0, i32 0, i32 0, i64 0
  %140 = fsub contract double %109, %99
  %141 = fmul contract double %85, %140
  %142 = fmul contract double %92, 3.000000e+00
  %143 = fmul contract double %101, 3.000000e+00
  %144 = fsub contract double %142, %143
  %145 = fadd contract double %144, %107
  %146 = fmul contract double %87, %145
  %147 = fmul contract double %80, %141
  %148 = fmul contract double %81, 5.000000e-01
  %149 = fmul contract double %148, %146
  %150 = fadd contract double %147, %149
  %151 = fadd contract double %138, %150
  store double %151, double addrspace(1)* %139, align 32, !tbaa !11
  %152 = fmul contract double %80, %146
  %153 = fadd contract double %141, %152
  %154 = load double, double addrspace(1)* %40, align 8, !tbaa !11
  %155 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %76, i32 0, i32 0, i32 0, i64 1
  %156 = load double, double addrspace(1)* %155, align 8, !tbaa !11
  %157 = fsub contract double %154, %156
  %158 = fadd contract double %154, %156
  %159 = load double, double addrspace(1)* %53, align 8, !tbaa !11
  %160 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %76, i32 0, i32 0, i32 0, i64 1
  %161 = load double, double addrspace(1)* %160, align 8, !tbaa !11
  %162 = fsub contract double %159, %161
  %163 = fmul contract double %80, %162
  %164 = fadd contract double %159, %161
  %165 = fmul contract double %80, %164
  %166 = load double, double addrspace(1)* %67, align 8, !tbaa !11
  %167 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %76, i32 0, i32 0, i32 0, i64 1
  %168 = load double, double addrspace(1)* %167, align 8, !tbaa !11
  %169 = fsub contract double %166, %168
  %170 = fmul contract double %81, %169
  %171 = fadd contract double %166, %168
  %172 = fmul contract double %81, %171
  %173 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %76, i32 0, i32 0, i32 0, i64 1
  %174 = load double, double addrspace(1)* %173, align 8, !tbaa !11
  %175 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %76, i32 0, i32 0, i32 0, i64 1
  %176 = load double, double addrspace(1)* %175, align 8, !tbaa !11
  %177 = fmul contract double %80, %176
  %178 = fadd contract double %174, %177
  %179 = fmul contract double %116, %157
  %180 = fsub contract double %178, %179
  %181 = fmul contract double %119, %165
  %182 = fadd contract double %181, %180
  store double %182, double addrspace(1)* %173, align 8, !tbaa !11
  %183 = load double, double addrspace(1)* %175, align 8, !tbaa !11
  %184 = fmul contract double %80, %158
  %185 = fadd contract double %184, %183
  %186 = fmul contract double %125, %163
  %187 = fsub contract double %185, %186
  %188 = fmul contract double %128, %172
  %189 = fadd contract double %188, %187
  store double %189, double addrspace(1)* %175, align 8, !tbaa !11
  %190 = fmul contract double %80, %189
  %191 = load double, double addrspace(1)* %173, align 8, !tbaa !11
  %192 = fadd contract double %191, %190
  store double %192, double addrspace(1)* %173, align 8, !tbaa !11
  %193 = fmul contract double %157, 5.000000e+00
  %194 = fmul contract double %165, 5.000000e+00
  %195 = fsub contract double %194, %193
  %196 = fsub contract double %195, %170
  %197 = fmul contract double %83, %196
  %198 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %76, i32 0, i32 0, i32 0, i64 1
  %199 = fsub contract double %172, %163
  %200 = fmul contract double %85, %199
  %201 = fmul contract double %157, 3.000000e+00
  %202 = fmul contract double %165, 3.000000e+00
  %203 = fsub contract double %201, %202
  %204 = fadd contract double %203, %170
  %205 = fmul contract double %87, %204
  %206 = fmul contract double %80, %200
  %207 = fmul contract double %148, %205
  %208 = fadd contract double %206, %207
  %209 = fadd contract double %197, %208
  store double %209, double addrspace(1)* %198, align 8, !tbaa !11
  %210 = fmul contract double %80, %205
  %211 = fadd contract double %200, %210
  %212 = load double, double addrspace(1)* %44, align 16, !tbaa !11
  %213 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %76, i32 0, i32 0, i32 0, i64 2
  %214 = load double, double addrspace(1)* %213, align 16, !tbaa !11
  %215 = fsub contract double %212, %214
  %216 = fadd contract double %212, %214
  %217 = load double, double addrspace(1)* %57, align 16, !tbaa !11
  %218 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %76, i32 0, i32 0, i32 0, i64 2
  %219 = load double, double addrspace(1)* %218, align 16, !tbaa !11
  %220 = fsub contract double %217, %219
  %221 = fmul contract double %80, %220
  %222 = fadd contract double %217, %219
  %223 = fmul contract double %80, %222
  %224 = load double, double addrspace(1)* %71, align 16, !tbaa !11
  %225 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %76, i32 0, i32 0, i32 0, i64 2
  %226 = load double, double addrspace(1)* %225, align 16, !tbaa !11
  %227 = fsub contract double %224, %226
  %228 = fmul contract double %81, %227
  %229 = fadd contract double %224, %226
  %230 = fmul contract double %81, %229
  %231 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %76, i32 0, i32 0, i32 0, i64 2
  %232 = load double, double addrspace(1)* %231, align 16, !tbaa !11
  %233 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %76, i32 0, i32 0, i32 0, i64 2
  %234 = load double, double addrspace(1)* %233, align 16, !tbaa !11
  %235 = fmul contract double %80, %234
  %236 = fadd contract double %232, %235
  %237 = fmul contract double %116, %215
  %238 = fsub contract double %236, %237
  %239 = fmul contract double %119, %223
  %240 = fadd contract double %239, %238
  store double %240, double addrspace(1)* %231, align 16, !tbaa !11
  %241 = load double, double addrspace(1)* %233, align 16, !tbaa !11
  %242 = fmul contract double %80, %216
  %243 = fadd contract double %242, %241
  %244 = fmul contract double %125, %221
  %245 = fsub contract double %243, %244
  %246 = fmul contract double %128, %230
  %247 = fadd contract double %246, %245
  store double %247, double addrspace(1)* %233, align 16, !tbaa !11
  %248 = fmul contract double %80, %247
  %249 = load double, double addrspace(1)* %231, align 16, !tbaa !11
  %250 = fadd contract double %249, %248
  store double %250, double addrspace(1)* %231, align 16, !tbaa !11
  %251 = fmul contract double %215, 5.000000e+00
  %252 = fmul contract double %223, 5.000000e+00
  %253 = fsub contract double %252, %251
  %254 = fsub contract double %253, %228
  %255 = fmul contract double %83, %254
  %256 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %76, i32 0, i32 0, i32 0, i64 2
  %257 = fsub contract double %230, %221
  %258 = fmul contract double %85, %257
  %259 = fmul contract double %215, 3.000000e+00
  %260 = fmul contract double %223, 3.000000e+00
  %261 = fsub contract double %259, %260
  %262 = fadd contract double %261, %228
  %263 = fmul contract double %87, %262
  %264 = fmul contract double %80, %258
  %265 = fmul contract double %148, %263
  %266 = fadd contract double %264, %265
  %267 = fadd contract double %255, %266
  store double %267, double addrspace(1)* %256, align 16, !tbaa !11
  %268 = fmul contract double %80, %263
  %269 = fadd contract double %258, %268
  %270 = load double, double addrspace(1)* %139, align 32, !tbaa !11
  %271 = fmul contract double %270, %270
  %272 = load double, double addrspace(1)* %198, align 8, !tbaa !11
  %273 = fmul contract double %272, %272
  %274 = fadd contract double %271, %273
  %275 = fmul contract double %267, %267
  %276 = fadd contract double %275, %274
  %277 = fcmp olt double %276, 0x1000000000000000
  %278 = select i1 %277, double 0x4FF0000000000000, double 1.000000e+00
  %279 = fmul double %276, %278
  %280 = tail call double @llvm.amdgcn.rsq.f64(double %279)
  %281 = fmul double %279, %280
  %282 = fmul double %280, 5.000000e-01
  %283 = fneg double %282
  %284 = tail call double @llvm.fma.f64(double %283, double %281, double 5.000000e-01)
  %285 = tail call double @llvm.fma.f64(double %282, double %284, double %282)
  %286 = tail call double @llvm.fma.f64(double %281, double %284, double %281)
  %287 = fneg double %286
  %288 = tail call double @llvm.fma.f64(double %287, double %286, double %279)
  %289 = tail call double @llvm.fma.f64(double %288, double %285, double %286)
  %290 = fneg double %289
  %291 = tail call double @llvm.fma.f64(double %290, double %289, double %279)
  %292 = tail call double @llvm.fma.f64(double %291, double %285, double %289)
  %293 = select i1 %277, double 0x37F0000000000000, double 1.000000e+00
  %294 = fmul double %293, %292
  %295 = fcmp oeq double %279, 0.000000e+00
  %296 = fcmp oeq double %279, 0x7FF0000000000000
  %297 = or i1 %295, %296
  %298 = select i1 %297, double %279, double %294
  %299 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %76, i32 0, i32 0, i32 0, i64 3
  store double %298, double addrspace(1)* %299, align 8, !tbaa !11
  %300 = fmul contract double %153, %153
  %301 = fmul contract double %211, %211
  %302 = fadd contract double %300, %301
  %303 = fmul contract double %269, %269
  %304 = fadd contract double %302, %303
  %305 = fcmp olt double %304, 0x1000000000000000
  %306 = select i1 %305, double 0x4FF0000000000000, double 1.000000e+00
  %307 = fmul double %304, %306
  %308 = tail call double @llvm.amdgcn.rsq.f64(double %307)
  %309 = fmul double %307, %308
  %310 = fmul double %308, 5.000000e-01
  %311 = fneg double %310
  %312 = tail call double @llvm.fma.f64(double %311, double %309, double 5.000000e-01)
  %313 = tail call double @llvm.fma.f64(double %310, double %312, double %310)
  %314 = tail call double @llvm.fma.f64(double %309, double %312, double %309)
  %315 = fneg double %314
  %316 = tail call double @llvm.fma.f64(double %315, double %314, double %307)
  %317 = tail call double @llvm.fma.f64(double %316, double %313, double %314)
  %318 = fneg double %317
  %319 = tail call double @llvm.fma.f64(double %318, double %317, double %307)
  %320 = tail call double @llvm.fma.f64(double %319, double %313, double %317)
  %321 = select i1 %305, double 0x37F0000000000000, double 1.000000e+00
  %322 = fmul double %321, %320
  %323 = fcmp oeq double %307, 0.000000e+00
  %324 = fcmp oeq double %307, 0x7FF0000000000000
  %325 = or i1 %323, %324
  %326 = select i1 %325, double %307, double %322
  %327 = fmul contract double %146, %146
  %328 = fmul contract double %205, %205
  %329 = fadd contract double %327, %328
  %330 = fmul contract double %263, %263
  %331 = fadd contract double %329, %330
  %332 = fcmp olt double %331, 0x1000000000000000
  %333 = select i1 %332, double 0x4FF0000000000000, double 1.000000e+00
  %334 = fmul double %331, %333
  %335 = tail call double @llvm.amdgcn.rsq.f64(double %334)
  %336 = fmul double %334, %335
  %337 = fmul double %335, 5.000000e-01
  %338 = fneg double %337
  %339 = tail call double @llvm.fma.f64(double %338, double %336, double 5.000000e-01)
  %340 = tail call double @llvm.fma.f64(double %337, double %339, double %337)
  %341 = tail call double @llvm.fma.f64(double %336, double %339, double %336)
  %342 = fneg double %341
  %343 = tail call double @llvm.fma.f64(double %342, double %341, double %334)
  %344 = tail call double @llvm.fma.f64(double %343, double %340, double %341)
  %345 = fneg double %344
  %346 = tail call double @llvm.fma.f64(double %345, double %344, double %334)
  %347 = tail call double @llvm.fma.f64(double %346, double %340, double %344)
  %348 = select i1 %332, double 0x37F0000000000000, double 1.000000e+00
  %349 = fmul double %348, %347
  %350 = fcmp oeq double %334, 0.000000e+00
  %351 = fcmp oeq double %334, 0x7FF0000000000000
  %352 = or i1 %350, %351
  %353 = select i1 %352, double %334, double %349
  %354 = load double, double addrspace(1)* %48, align 8, !tbaa !11
  %355 = load double, double addrspace(1)* %75, align 8, !tbaa !11
  %356 = fmul contract double %354, %355
  %357 = fcmp olt double %356, 0x1000000000000000
  %358 = select i1 %357, double 0x4FF0000000000000, double 1.000000e+00
  %359 = fmul double %356, %358
  %360 = tail call double @llvm.amdgcn.rsq.f64(double %359)
  %361 = fmul double %359, %360
  %362 = fmul double %360, 5.000000e-01
  %363 = fneg double %362
  %364 = tail call double @llvm.fma.f64(double %363, double %361, double 5.000000e-01)
  %365 = tail call double @llvm.fma.f64(double %362, double %364, double %362)
  %366 = tail call double @llvm.fma.f64(double %361, double %364, double %361)
  %367 = fneg double %366
  %368 = tail call double @llvm.fma.f64(double %367, double %366, double %359)
  %369 = tail call double @llvm.fma.f64(double %368, double %365, double %366)
  %370 = fneg double %369
  %371 = tail call double @llvm.fma.f64(double %370, double %369, double %359)
  %372 = tail call double @llvm.fma.f64(double %371, double %365, double %369)
  %373 = select i1 %357, double 0x37F0000000000000, double 1.000000e+00
  %374 = fmul double %373, %372
  %375 = fcmp oeq double %359, 0.000000e+00
  %376 = fcmp oeq double %359, 0x7FF0000000000000
  %377 = or i1 %375, %376
  %378 = select i1 %377, double %359, double %374
  %379 = load double, double addrspace(1)* %61, align 8, !tbaa !11
  %380 = fadd contract double %379, %378
  %381 = fmul contract double %353, %298
  %382 = fmul contract double %326, %326
  %383 = fadd contract double %382, %381
  %384 = fdiv contract double %380, %383
  %385 = tail call double @llvm.fabs.f64(double %384)
  %386 = tail call double @llvm.amdgcn.frexp.mant.f64(double %385)
  %387 = fcmp olt double %386, 0x3FE5555555555555
  %388 = zext i1 %387 to i32
  %389 = tail call double @llvm.amdgcn.ldexp.f64(double %386, i32 %388)
  %390 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %385)
  %391 = sub nsw i32 %390, %388
  %392 = fadd double %389, -1.000000e+00
  %393 = fadd double %389, 1.000000e+00
  %394 = fadd double %393, -1.000000e+00
  %395 = fsub double %389, %394
  %396 = tail call double @llvm.amdgcn.rcp.f64(double %393)
  %397 = fneg double %393
  %398 = tail call double @llvm.fma.f64(double %397, double %396, double 1.000000e+00)
  %399 = tail call double @llvm.fma.f64(double %398, double %396, double %396)
  %400 = tail call double @llvm.fma.f64(double %397, double %399, double 1.000000e+00)
  %401 = tail call double @llvm.fma.f64(double %400, double %399, double %399)
  %402 = fmul double %392, %401
  %403 = fmul double %393, %402
  %404 = fneg double %403
  %405 = tail call double @llvm.fma.f64(double %402, double %393, double %404)
  %406 = tail call double @llvm.fma.f64(double %402, double %395, double %405)
  %407 = fadd double %403, %406
  %408 = fsub double %407, %403
  %409 = fsub double %406, %408
  %410 = fsub double %392, %407
  %411 = fsub double %392, %410
  %412 = fsub double %411, %407
  %413 = fsub double %412, %409
  %414 = fadd double %410, %413
  %415 = fmul double %401, %414
  %416 = fadd double %402, %415
  %417 = fsub double %416, %402
  %418 = fsub double %415, %417
  %419 = fmul double %416, %416
  %420 = fneg double %419
  %421 = tail call double @llvm.fma.f64(double %416, double %416, double %420)
  %422 = fmul double %418, 2.000000e+00
  %423 = tail call double @llvm.fma.f64(double %416, double %422, double %421)
  %424 = fadd double %419, %423
  %425 = fsub double %424, %419
  %426 = fsub double %423, %425
  %427 = tail call double @llvm.fma.f64(double %424, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %428 = tail call double @llvm.fma.f64(double %424, double %427, double 0x3FBE25E43ABE935A)
  %429 = tail call double @llvm.fma.f64(double %424, double %428, double 0x3FC110EF47E6C9C2)
  %430 = tail call double @llvm.fma.f64(double %424, double %429, double 0x3FC3B13BCFA74449)
  %431 = tail call double @llvm.fma.f64(double %424, double %430, double 0x3FC745D171BF3C30)
  %432 = tail call double @llvm.fma.f64(double %424, double %431, double 0x3FCC71C71C7792CE)
  %433 = tail call double @llvm.fma.f64(double %424, double %432, double 0x3FD24924924920DA)
  %434 = tail call double @llvm.fma.f64(double %424, double %433, double 0x3FD999999999999C)
  %435 = sitofp i32 %391 to double
  %436 = fmul double %435, 0x3FE62E42FEFA39EF
  %437 = fneg double %436
  %438 = tail call double @llvm.fma.f64(double %435, double 0x3FE62E42FEFA39EF, double %437)
  %439 = tail call double @llvm.fma.f64(double %435, double 0x3C7ABC9E3B39803F, double %438)
  %440 = fadd double %436, %439
  %441 = fsub double %440, %436
  %442 = fsub double %439, %441
  %443 = tail call double @llvm.amdgcn.ldexp.f64(double %416, i32 1)
  %444 = tail call double @llvm.amdgcn.ldexp.f64(double %418, i32 1)
  %445 = fmul double %416, %424
  %446 = fneg double %445
  %447 = tail call double @llvm.fma.f64(double %424, double %416, double %446)
  %448 = tail call double @llvm.fma.f64(double %424, double %418, double %447)
  %449 = tail call double @llvm.fma.f64(double %426, double %416, double %448)
  %450 = fadd double %445, %449
  %451 = fsub double %450, %445
  %452 = fsub double %449, %451
  %453 = fmul double %424, %434
  %454 = fneg double %453
  %455 = tail call double @llvm.fma.f64(double %424, double %434, double %454)
  %456 = tail call double @llvm.fma.f64(double %426, double %434, double %455)
  %457 = fadd double %453, %456
  %458 = fsub double %457, %453
  %459 = fsub double %456, %458
  %460 = fadd double %457, 0x3FE5555555555555
  %461 = fadd double %460, 0xBFE5555555555555
  %462 = fsub double %457, %461
  %463 = fadd double %459, 0x3C8543B0D5DF274D
  %464 = fadd double %463, %462
  %465 = fadd double %460, %464
  %466 = fsub double %465, %460
  %467 = fsub double %464, %466
  %468 = fmul double %450, %465
  %469 = fneg double %468
  %470 = tail call double @llvm.fma.f64(double %450, double %465, double %469)
  %471 = tail call double @llvm.fma.f64(double %450, double %467, double %470)
  %472 = tail call double @llvm.fma.f64(double %452, double %465, double %471)
  %473 = fadd double %468, %472
  %474 = fsub double %473, %468
  %475 = fsub double %472, %474
  %476 = fadd double %443, %473
  %477 = fsub double %476, %443
  %478 = fsub double %473, %477
  %479 = fadd double %444, %475
  %480 = fadd double %479, %478
  %481 = fadd double %476, %480
  %482 = fsub double %481, %476
  %483 = fsub double %480, %482
  %484 = fadd double %440, %481
  %485 = fsub double %484, %440
  %486 = fsub double %484, %485
  %487 = fsub double %440, %486
  %488 = fsub double %481, %485
  %489 = fadd double %488, %487
  %490 = fadd double %442, %483
  %491 = fsub double %490, %442
  %492 = fsub double %490, %491
  %493 = fsub double %442, %492
  %494 = fsub double %483, %491
  %495 = fadd double %494, %493
  %496 = fadd double %490, %489
  %497 = fadd double %484, %496
  %498 = fsub double %497, %484
  %499 = fsub double %496, %498
  %500 = fadd double %495, %499
  %501 = fadd double %497, %500
  %502 = fsub double %501, %497
  %503 = fsub double %500, %502
  %504 = fmul double %501, 0x3FC5555555555555
  %505 = fneg double %504
  %506 = tail call double @llvm.fma.f64(double %501, double 0x3FC5555555555555, double %505)
  %507 = tail call double @llvm.fma.f64(double %503, double 0x3FC5555555555555, double %506)
  %508 = fadd double %504, %507
  %509 = fsub double %508, %504
  %510 = fsub double %507, %509
  %511 = tail call double @llvm.fabs.f64(double %504) #4
  %512 = fcmp oeq double %511, 0x7FF0000000000000
  %513 = select i1 %512, double %504, double %508
  %514 = tail call double @llvm.fabs.f64(double %513) #4
  %515 = fcmp oeq double %514, 0x7FF0000000000000
  %516 = select i1 %515, double 0.000000e+00, double %510
  %517 = fmul double %513, 0x3FF71547652B82FE
  %518 = tail call double @llvm.rint.f64(double %517)
  %519 = fneg double %518
  %520 = tail call double @llvm.fma.f64(double %519, double 0x3FE62E42FEFA39EF, double %513)
  %521 = tail call double @llvm.fma.f64(double %519, double 0x3C7ABC9E3B39803F, double %520)
  %522 = tail call double @llvm.fma.f64(double %521, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %523 = tail call double @llvm.fma.f64(double %521, double %522, double 0x3EC71DEE623FDE64)
  %524 = tail call double @llvm.fma.f64(double %521, double %523, double 0x3EFA01997C89E6B0)
  %525 = tail call double @llvm.fma.f64(double %521, double %524, double 0x3F2A01A014761F6E)
  %526 = tail call double @llvm.fma.f64(double %521, double %525, double 0x3F56C16C1852B7B0)
  %527 = tail call double @llvm.fma.f64(double %521, double %526, double 0x3F81111111122322)
  %528 = tail call double @llvm.fma.f64(double %521, double %527, double 0x3FA55555555502A1)
  %529 = tail call double @llvm.fma.f64(double %521, double %528, double 0x3FC5555555555511)
  %530 = tail call double @llvm.fma.f64(double %521, double %529, double 0x3FE000000000000B)
  %531 = tail call double @llvm.fma.f64(double %521, double %530, double 1.000000e+00)
  %532 = tail call double @llvm.fma.f64(double %521, double %531, double 1.000000e+00)
  %533 = fptosi double %518 to i32
  %534 = tail call double @llvm.amdgcn.ldexp.f64(double %532, i32 %533)
  %535 = fcmp ogt double %513, 1.024000e+03
  %536 = select i1 %535, double 0x7FF0000000000000, double %534
  %537 = fcmp olt double %513, -1.075000e+03
  %538 = select i1 %537, double 0.000000e+00, double %536
  %539 = tail call double @llvm.fma.f64(double %538, double %516, double %538)
  %540 = tail call double @llvm.fabs.f64(double %538) #4
  %541 = fcmp oeq double %540, 0x7FF0000000000000
  %542 = select i1 %541, double %538, double %539
  %543 = fcmp uge double %384, 0.000000e+00
  %544 = tail call double @llvm.fabs.f64(double %542)
  %545 = select i1 %543, double %544, double 0x7FF8000000000000
  %546 = fcmp oeq double %385, 0x7FF0000000000000
  %547 = fcmp oeq double %384, 0.000000e+00
  %548 = select i1 %546, double 0x7FF0000000000000, double %545
  %549 = select i1 %547, double 0.000000e+00, double %548
  %550 = fcmp uno double %384, 0.000000e+00
  %551 = select i1 %550, double 0x7FF8000000000000, double %549
  %552 = fcmp oeq double %384, 1.000000e+00
  %553 = select i1 %552, double 1.000000e+00, double %551
  %554 = fmul contract double %553, %12
  %555 = fmul contract double %79, %79
  %556 = fmul contract double %79, %555
  %557 = fdiv contract double 1.000000e+00, %556
  %558 = fdiv contract double 1.000000e+00, %555
  %559 = load double, double addrspace(1)* %90, align 32, !tbaa !11
  %560 = load double, double addrspace(1)* %37, align 32, !tbaa !11
  %561 = fsub contract double %559, %560
  %562 = fmul contract double %561, -6.000000e+00
  %563 = load double, double addrspace(1)* %50, align 32, !tbaa !11
  %564 = fmul contract double %563, 4.000000e+00
  %565 = load double, double addrspace(1)* %96, align 32, !tbaa !11
  %566 = fmul contract double %565, 2.000000e+00
  %567 = fadd contract double %564, %566
  %568 = fmul contract double %79, %567
  %569 = fsub contract double %562, %568
  %570 = fmul contract double %558, %569
  %571 = load double, double addrspace(1)* %155, align 8, !tbaa !11
  %572 = load double, double addrspace(1)* %40, align 8, !tbaa !11
  %573 = fsub contract double %571, %572
  %574 = fmul contract double %573, -6.000000e+00
  %575 = load double, double addrspace(1)* %53, align 8, !tbaa !11
  %576 = fmul contract double %575, 4.000000e+00
  %577 = load double, double addrspace(1)* %160, align 8, !tbaa !11
  %578 = fmul contract double %577, 2.000000e+00
  %579 = fadd contract double %576, %578
  %580 = fmul contract double %79, %579
  %581 = fsub contract double %574, %580
  %582 = fmul contract double %558, %581
  %583 = load double, double addrspace(1)* %213, align 16, !tbaa !11
  %584 = load double, double addrspace(1)* %44, align 16, !tbaa !11
  %585 = fsub contract double %583, %584
  %586 = fmul contract double %585, -6.000000e+00
  %587 = load double, double addrspace(1)* %57, align 16, !tbaa !11
  %588 = fmul contract double %587, 4.000000e+00
  %589 = load double, double addrspace(1)* %218, align 16, !tbaa !11
  %590 = fmul contract double %589, 2.000000e+00
  %591 = fadd contract double %588, %590
  %592 = fmul contract double %79, %591
  %593 = fsub contract double %586, %592
  %594 = fmul contract double %558, %593
  %595 = fmul contract double %561, 1.200000e+01
  %596 = fmul contract double %79, 6.000000e+00
  %597 = fadd contract double %563, %565
  %598 = fmul contract double %596, %597
  %599 = fadd contract double %595, %598
  %600 = fmul contract double %557, %599
  %601 = fmul contract double %573, 1.200000e+01
  %602 = fadd contract double %575, %577
  %603 = fmul contract double %596, %602
  %604 = fadd contract double %601, %603
  %605 = fmul contract double %557, %604
  %606 = fmul contract double %585, 1.200000e+01
  %607 = fadd contract double %587, %589
  %608 = fmul contract double %596, %607
  %609 = fadd contract double %606, %608
  %610 = fmul contract double %557, %609
  %611 = fmul contract double %79, %600
  %612 = fadd contract double %570, %611
  %613 = fmul contract double %79, %605
  %614 = fadd contract double %582, %613
  %615 = fmul contract double %79, %610
  %616 = fadd contract double %612, %615
  %617 = fmul contract double %616, %616
  %618 = fmul contract double %614, %614
  %619 = fadd contract double %618, %617
  %620 = fmul contract double %594, %594
  %621 = fadd contract double %620, %619
  store double %621, double addrspace(1)* %75, align 8, !tbaa !11
  %622 = fmul contract double %600, %600
  %623 = fmul contract double %605, %605
  %624 = fadd contract double %622, %623
  %625 = fmul contract double %610, %610
  %626 = fadd contract double %624, %625
  store double %626, double addrspace(1)* %299, align 8, !tbaa !11
  %627 = load double, double addrspace(1)* %48, align 8, !tbaa !11
  %628 = load double, double addrspace(1)* %75, align 8, !tbaa !11
  %629 = fmul contract double %627, %628
  %630 = fcmp olt double %629, 0x1000000000000000
  %631 = select i1 %630, double 0x4FF0000000000000, double 1.000000e+00
  %632 = fmul double %629, %631
  %633 = tail call double @llvm.amdgcn.rsq.f64(double %632)
  %634 = fmul double %632, %633
  %635 = fmul double %633, 5.000000e-01
  %636 = fneg double %635
  %637 = tail call double @llvm.fma.f64(double %636, double %634, double 5.000000e-01)
  %638 = tail call double @llvm.fma.f64(double %635, double %637, double %635)
  %639 = tail call double @llvm.fma.f64(double %634, double %637, double %634)
  %640 = fneg double %639
  %641 = tail call double @llvm.fma.f64(double %640, double %639, double %632)
  %642 = tail call double @llvm.fma.f64(double %641, double %638, double %639)
  %643 = fneg double %642
  %644 = tail call double @llvm.fma.f64(double %643, double %642, double %632)
  %645 = tail call double @llvm.fma.f64(double %644, double %638, double %642)
  %646 = select i1 %630, double 0x37F0000000000000, double 1.000000e+00
  %647 = fmul double %646, %645
  %648 = fcmp oeq double %632, 0.000000e+00
  %649 = fcmp oeq double %632, 0x7FF0000000000000
  %650 = or i1 %648, %649
  %651 = select i1 %650, double %632, double %647
  %652 = load double, double addrspace(1)* %61, align 8, !tbaa !11
  %653 = fadd contract double %652, %651
  %654 = fmul contract double %653, %13
  %655 = fmul contract double %652, %626
  %656 = fcmp olt double %655, 0x1000000000000000
  %657 = select i1 %656, double 0x4FF0000000000000, double 1.000000e+00
  %658 = fmul double %655, %657
  %659 = tail call double @llvm.amdgcn.rsq.f64(double %658)
  %660 = fmul double %658, %659
  %661 = fmul double %659, 5.000000e-01
  %662 = fneg double %661
  %663 = tail call double @llvm.fma.f64(double %662, double %660, double 5.000000e-01)
  %664 = tail call double @llvm.fma.f64(double %661, double %663, double %661)
  %665 = tail call double @llvm.fma.f64(double %660, double %663, double %660)
  %666 = fneg double %665
  %667 = tail call double @llvm.fma.f64(double %666, double %665, double %658)
  %668 = tail call double @llvm.fma.f64(double %667, double %664, double %665)
  %669 = fneg double %668
  %670 = tail call double @llvm.fma.f64(double %669, double %668, double %658)
  %671 = tail call double @llvm.fma.f64(double %670, double %664, double %668)
  %672 = select i1 %656, double 0x37F0000000000000, double 1.000000e+00
  %673 = fmul double %672, %671
  %674 = fcmp oeq double %658, 0.000000e+00
  %675 = fcmp oeq double %658, 0x7FF0000000000000
  %676 = or i1 %674, %675
  %677 = select i1 %676, double %658, double %673
  %678 = fadd contract double %628, %677
  %679 = fdiv contract double %654, %678
  %680 = fcmp olt double %679, 0x1000000000000000
  %681 = select i1 %680, double 0x4FF0000000000000, double 1.000000e+00
  %682 = fmul double %679, %681
  %683 = tail call double @llvm.amdgcn.rsq.f64(double %682)
  %684 = fmul double %682, %683
  %685 = fmul double %683, 5.000000e-01
  %686 = fneg double %685
  %687 = tail call double @llvm.fma.f64(double %686, double %684, double 5.000000e-01)
  %688 = tail call double @llvm.fma.f64(double %685, double %687, double %685)
  %689 = tail call double @llvm.fma.f64(double %684, double %687, double %684)
  %690 = fneg double %689
  %691 = tail call double @llvm.fma.f64(double %690, double %689, double %682)
  %692 = tail call double @llvm.fma.f64(double %691, double %688, double %689)
  %693 = fneg double %692
  %694 = tail call double @llvm.fma.f64(double %693, double %692, double %682)
  %695 = tail call double @llvm.fma.f64(double %694, double %688, double %692)
  %696 = select i1 %680, double 0x37F0000000000000, double 1.000000e+00
  %697 = fmul double %696, %695
  %698 = fcmp oeq double %682, 0.000000e+00
  %699 = fcmp oeq double %682, 0x7FF0000000000000
  %700 = or i1 %698, %699
  %701 = select i1 %700, double %682, double %697
  %702 = fmul contract double %701, 5.000000e-01
  %703 = fmul contract double %554, 5.000000e-01
  %704 = fadd contract double %702, %703
  %705 = getelementptr inbounds double, double addrspace(1)* %2, i64 %76
  %706 = load double, double addrspace(1)* %705, align 8, !tbaa !12
  %707 = fmul contract double %706, 2.000000e+00
  %708 = fdiv contract double %0, %707
  %709 = fptosi double %708 to i32
  %710 = sitofp i32 %709 to double
  %711 = fsub contract double %710, %708
  %712 = fcmp contract ule double %704, %707
  %713 = fcmp contract une double %711, 0.000000e+00
  %714 = select i1 %712, i1 true, i1 %713
  %715 = fcmp contract ugt double %707, %14
  %716 = select i1 %714, i1 true, i1 %715
  br i1 %716, label %717, label %724

717:                                              ; preds = %31
  %718 = fmul contract double %706, 5.000000e-01
  %719 = fcmp contract olt double %704, %718
  br i1 %719, label %720, label %722

720:                                              ; preds = %717
  %721 = fmul contract double %706, 2.500000e-01
  br label %724

722:                                              ; preds = %717
  %723 = fcmp contract olt double %704, %706
  br i1 %723, label %724, label %726

724:                                              ; preds = %722, %31, %720
  %725 = phi double [ %721, %720 ], [ %707, %31 ], [ %718, %722 ]
  store double %725, double addrspace(1)* %705, align 8, !tbaa !12
  br label %726

726:                                              ; preds = %724, %722
  %727 = phi double [ %706, %722 ], [ %725, %724 ]
  %728 = fcmp contract olt double %727, %15
  br i1 %728, label %729, label %730

729:                                              ; preds = %726
  store double %15, double addrspace(1)* %705, align 8, !tbaa !12
  br label %730

730:                                              ; preds = %729, %726
  %731 = bitcast %struct.HIP_vector_type addrspace(1)* %89 to i8 addrspace(1)*
  %732 = bitcast %struct.HIP_vector_type addrspace(1)* %36 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 32 dereferenceable(32) %731, i8 addrspace(1)* noundef align 32 dereferenceable(32) %732, i64 32, i1 false)
  %733 = bitcast %struct.HIP_vector_type addrspace(1)* %95 to i8 addrspace(1)*
  %734 = bitcast %struct.HIP_vector_type addrspace(1)* %49 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 32 dereferenceable(32) %733, i8 addrspace(1)* noundef align 32 dereferenceable(32) %734, i64 32, i1 false)
  %735 = bitcast %struct.HIP_vector_type addrspace(1)* %103 to i8 addrspace(1)*
  %736 = bitcast %struct.HIP_vector_type addrspace(1)* %63 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 32 dereferenceable(32) %735, i8 addrspace(1)* noundef align 32 dereferenceable(32) %736, i64 32, i1 false)
  br label %737

737:                                              ; preds = %17, %730
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
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }
attributes #4 = { readnone }

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
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"double", !9, i64 0}
