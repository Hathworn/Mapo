; ModuleID = '../data/hip_kernels/1874/4/main.cu'
source_filename = "../data/hip_kernels/1874/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7RoeStepiPdS_S_PKdS_S_S_S1_S1_S1_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_PiS2_S2_S_S_S_S_S_S_S_S_S_(i32 %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture %11, double addrspace(1)* nocapture %12, double addrspace(1)* nocapture %13, double addrspace(1)* nocapture %14, double addrspace(1)* nocapture %15, double addrspace(1)* nocapture %16, double addrspace(1)* nocapture %17, double addrspace(1)* nocapture %18, double addrspace(1)* nocapture %19, double addrspace(1)* nocapture %20, double addrspace(1)* nocapture %21, double addrspace(1)* nocapture %22, double addrspace(1)* nocapture %23, double addrspace(1)* nocapture %24, double addrspace(1)* nocapture %25, double addrspace(1)* nocapture %26, double addrspace(1)* nocapture %27, double addrspace(1)* nocapture %28, double addrspace(1)* nocapture %29, double addrspace(1)* nocapture %30, double addrspace(1)* nocapture %31, double addrspace(1)* nocapture %32, double addrspace(1)* nocapture %33, double addrspace(1)* nocapture %34, double addrspace(1)* nocapture %35, double addrspace(1)* nocapture %36, double addrspace(1)* nocapture %37, double addrspace(1)* nocapture %38, double addrspace(1)* nocapture %39, i32 addrspace(1)* nocapture %40, i32 addrspace(1)* nocapture %41, i32 addrspace(1)* nocapture %42, double addrspace(1)* nocapture %43, double addrspace(1)* nocapture %44, double addrspace(1)* nocapture %45, double addrspace(1)* nocapture %46, double addrspace(1)* nocapture %47, double addrspace(1)* nocapture %48, double addrspace(1)* nocapture %49, double addrspace(1)* nocapture %50, double addrspace(1)* nocapture %51) local_unnamed_addr #0 {
  %53 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %54 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %55 = getelementptr i8, i8 addrspace(4)* %54, i64 4
  %56 = bitcast i8 addrspace(4)* %55 to i16 addrspace(4)*
  %57 = load i16, i16 addrspace(4)* %56, align 4, !range !4, !invariant.load !5
  %58 = zext i16 %57 to i32
  %59 = mul i32 %53, %58
  %60 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %61 = add i32 %59, %60
  %62 = icmp slt i32 %61, %0
  br i1 %62, label %63, label %89

63:                                               ; preds = %52
  %64 = getelementptr inbounds double, double addrspace(1)* %46, i64 1
  %65 = getelementptr inbounds double, double addrspace(1)* %49, i64 1
  %66 = add nsw i32 %0, -1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %46, i64 %67
  %69 = getelementptr inbounds double, double addrspace(1)* %49, i64 %67
  %70 = getelementptr inbounds double, double addrspace(1)* %47, i64 1
  %71 = getelementptr inbounds double, double addrspace(1)* %50, i64 1
  %72 = getelementptr inbounds double, double addrspace(1)* %47, i64 %67
  %73 = getelementptr inbounds double, double addrspace(1)* %50, i64 %67
  %74 = getelementptr inbounds double, double addrspace(1)* %48, i64 1
  %75 = getelementptr inbounds double, double addrspace(1)* %51, i64 1
  %76 = getelementptr inbounds double, double addrspace(1)* %48, i64 %67
  %77 = getelementptr inbounds double, double addrspace(1)* %51, i64 %67
  %78 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  %79 = getelementptr inbounds double, double addrspace(1)* %2, i64 1
  %80 = getelementptr inbounds double, double addrspace(1)* %3, i64 1
  %81 = add nsw i32 %0, -2
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %1, i64 %82
  %84 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %85 = getelementptr inbounds double, double addrspace(1)* %2, i64 %82
  %86 = getelementptr inbounds double, double addrspace(1)* %2, i64 %67
  %87 = getelementptr inbounds double, double addrspace(1)* %3, i64 %82
  %88 = getelementptr inbounds double, double addrspace(1)* %3, i64 %67
  br label %90

89:                                               ; preds = %604, %52
  ret void

90:                                               ; preds = %63, %604
  %91 = phi i32 [ %61, %63 ], [ %613, %604 ]
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %4, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7
  %95 = getelementptr inbounds double, double addrspace(1)* %1, i64 %92
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !7
  %97 = fmul contract double %94, %96
  %98 = fcmp olt double %97, 0x1000000000000000
  %99 = select i1 %98, double 0x4FF0000000000000, double 1.000000e+00
  %100 = fmul double %97, %99
  %101 = tail call double @llvm.amdgcn.rsq.f64(double %100)
  %102 = fmul double %100, %101
  %103 = fmul double %101, 5.000000e-01
  %104 = fneg double %103
  %105 = tail call double @llvm.fma.f64(double %104, double %102, double 5.000000e-01)
  %106 = tail call double @llvm.fma.f64(double %103, double %105, double %103)
  %107 = tail call double @llvm.fma.f64(double %102, double %105, double %102)
  %108 = fneg double %107
  %109 = tail call double @llvm.fma.f64(double %108, double %107, double %100)
  %110 = tail call double @llvm.fma.f64(double %109, double %106, double %107)
  %111 = fneg double %110
  %112 = tail call double @llvm.fma.f64(double %111, double %110, double %100)
  %113 = tail call double @llvm.fma.f64(double %112, double %106, double %110)
  %114 = select i1 %98, double 0x37F0000000000000, double 1.000000e+00
  %115 = fmul double %114, %113
  %116 = fcmp oeq double %100, 0.000000e+00
  %117 = fcmp oeq double %100, 0x7FF0000000000000
  %118 = or i1 %116, %117
  %119 = select i1 %118, double %100, double %115
  %120 = getelementptr inbounds double, double addrspace(1)* %11, i64 %92
  store double %119, double addrspace(1)* %120, align 8, !tbaa !7
  %121 = getelementptr inbounds double, double addrspace(1)* %2, i64 %92
  %122 = load double, double addrspace(1)* %121, align 8, !tbaa !7
  %123 = fmul contract double %122, %119
  %124 = load double, double addrspace(1)* %95, align 8, !tbaa !7
  %125 = fdiv contract double %123, %124
  %126 = getelementptr inbounds double, double addrspace(1)* %12, i64 %92
  store double %125, double addrspace(1)* %126, align 8, !tbaa !7
  %127 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %128 = fadd contract double %127, -1.000000e+00
  %129 = getelementptr inbounds double, double addrspace(1)* %3, i64 %92
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !7
  %131 = load double, double addrspace(1)* %121, align 8, !tbaa !7
  %132 = fmul contract double %131, 5.000000e-01
  %133 = fmul contract double %131, %132
  %134 = load double, double addrspace(1)* %95, align 8, !tbaa !7
  %135 = fdiv contract double %133, %134
  %136 = fsub contract double %130, %135
  %137 = fmul contract double %128, %136
  %138 = getelementptr inbounds double, double addrspace(1)* %14, i64 %92
  store double %137, double addrspace(1)* %138, align 8, !tbaa !7
  %139 = load double, double addrspace(1)* %120, align 8, !tbaa !7
  %140 = load double, double addrspace(1)* %129, align 8, !tbaa !7
  %141 = fadd contract double %140, %137
  %142 = fmul contract double %139, %141
  %143 = load double, double addrspace(1)* %95, align 8, !tbaa !7
  %144 = fdiv contract double %142, %143
  %145 = getelementptr inbounds double, double addrspace(1)* %13, i64 %92
  store double %144, double addrspace(1)* %145, align 8, !tbaa !7
  %146 = load double, double addrspace(1)* %120, align 8, !tbaa !7
  %147 = load double, double addrspace(1)* %126, align 8, !tbaa !7
  %148 = fmul contract double %146, %147
  %149 = getelementptr inbounds double, double addrspace(1)* %15, i64 %92
  store double %148, double addrspace(1)* %149, align 8, !tbaa !7
  %150 = load double, double addrspace(1)* %126, align 8, !tbaa !7
  %151 = fmul contract double %150, %150
  %152 = load double, double addrspace(1)* %93, align 8, !tbaa !7
  %153 = load double, double addrspace(1)* %138, align 8, !tbaa !7
  %154 = fmul contract double %152, %153
  %155 = fadd contract double %151, %154
  %156 = getelementptr inbounds double, double addrspace(1)* %16, i64 %92
  store double %155, double addrspace(1)* %156, align 8, !tbaa !7
  %157 = load double, double addrspace(1)* %126, align 8, !tbaa !7
  %158 = load double, double addrspace(1)* %145, align 8, !tbaa !7
  %159 = fmul contract double %157, %158
  %160 = getelementptr inbounds double, double addrspace(1)* %17, i64 %92
  store double %159, double addrspace(1)* %160, align 8, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %161 = icmp sgt i32 %91, 0
  br i1 %161, label %162, label %192

162:                                              ; preds = %90
  %163 = add nsw i32 %91, -1
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds double, double addrspace(1)* %15, i64 %164
  %166 = load double, double addrspace(1)* %165, align 8, !tbaa !7
  %167 = getelementptr inbounds double, double addrspace(1)* %21, i64 %92
  store double %166, double addrspace(1)* %167, align 8, !tbaa !7
  %168 = load double, double addrspace(1)* %149, align 8, !tbaa !7
  %169 = getelementptr inbounds double, double addrspace(1)* %18, i64 %92
  store double %168, double addrspace(1)* %169, align 8, !tbaa !7
  %170 = getelementptr inbounds double, double addrspace(1)* %16, i64 %164
  %171 = load double, double addrspace(1)* %170, align 8, !tbaa !7
  %172 = getelementptr inbounds double, double addrspace(1)* %22, i64 %92
  store double %171, double addrspace(1)* %172, align 8, !tbaa !7
  %173 = load double, double addrspace(1)* %156, align 8, !tbaa !7
  %174 = getelementptr inbounds double, double addrspace(1)* %19, i64 %92
  store double %173, double addrspace(1)* %174, align 8, !tbaa !7
  %175 = getelementptr inbounds double, double addrspace(1)* %17, i64 %164
  %176 = load double, double addrspace(1)* %175, align 8, !tbaa !7
  %177 = getelementptr inbounds double, double addrspace(1)* %23, i64 %92
  store double %176, double addrspace(1)* %177, align 8, !tbaa !7
  %178 = load double, double addrspace(1)* %160, align 8, !tbaa !7
  %179 = getelementptr inbounds double, double addrspace(1)* %20, i64 %92
  store double %178, double addrspace(1)* %179, align 8, !tbaa !7
  %180 = load double, double addrspace(1)* %169, align 8, !tbaa !7
  %181 = load double, double addrspace(1)* %167, align 8, !tbaa !7
  %182 = fsub contract double %180, %181
  %183 = getelementptr inbounds double, double addrspace(1)* %24, i64 %92
  store double %182, double addrspace(1)* %183, align 8, !tbaa !7
  %184 = load double, double addrspace(1)* %174, align 8, !tbaa !7
  %185 = load double, double addrspace(1)* %172, align 8, !tbaa !7
  %186 = fsub contract double %184, %185
  %187 = getelementptr inbounds double, double addrspace(1)* %25, i64 %92
  store double %186, double addrspace(1)* %187, align 8, !tbaa !7
  %188 = load double, double addrspace(1)* %179, align 8, !tbaa !7
  %189 = load double, double addrspace(1)* %177, align 8, !tbaa !7
  %190 = fsub contract double %188, %189
  %191 = getelementptr inbounds double, double addrspace(1)* %26, i64 %92
  store double %190, double addrspace(1)* %191, align 8, !tbaa !7
  br label %192

192:                                              ; preds = %90, %162
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %161, label %193, label %392

193:                                              ; preds = %192
  %194 = add nsw i32 %91, -1
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds double, double addrspace(1)* %11, i64 %195
  %197 = load double, double addrspace(1)* %196, align 8, !tbaa !7
  %198 = load double, double addrspace(1)* %120, align 8, !tbaa !7
  %199 = fadd contract double %197, %198
  %200 = fdiv contract double 1.000000e+00, %199
  %201 = getelementptr inbounds double, double addrspace(1)* %27, i64 %92
  store double %200, double addrspace(1)* %201, align 8, !tbaa !7
  %202 = getelementptr inbounds double, double addrspace(1)* %12, i64 %195
  %203 = load double, double addrspace(1)* %202, align 8, !tbaa !7
  %204 = load double, double addrspace(1)* %126, align 8, !tbaa !7
  %205 = fadd contract double %203, %204
  %206 = fmul contract double %200, %205
  %207 = getelementptr inbounds double, double addrspace(1)* %28, i64 %92
  store double %206, double addrspace(1)* %207, align 8, !tbaa !7
  %208 = getelementptr inbounds double, double addrspace(1)* %13, i64 %195
  %209 = load double, double addrspace(1)* %208, align 8, !tbaa !7
  %210 = load double, double addrspace(1)* %145, align 8, !tbaa !7
  %211 = fadd contract double %209, %210
  %212 = load double, double addrspace(1)* %201, align 8, !tbaa !7
  %213 = fmul contract double %211, %212
  %214 = getelementptr inbounds double, double addrspace(1)* %29, i64 %92
  store double %213, double addrspace(1)* %214, align 8, !tbaa !7
  %215 = load double, double addrspace(1)* %207, align 8, !tbaa !7
  %216 = fmul contract double %215, 5.000000e-01
  %217 = fmul contract double %215, %216
  %218 = getelementptr inbounds double, double addrspace(1)* %31, i64 %92
  store double %217, double addrspace(1)* %218, align 8, !tbaa !7
  %219 = load double, double addrspace(1)* %207, align 8, !tbaa !7
  %220 = getelementptr inbounds double, double addrspace(1)* %25, i64 %92
  %221 = load double, double addrspace(1)* %220, align 8, !tbaa !7
  %222 = fmul contract double %219, %221
  %223 = getelementptr inbounds double, double addrspace(1)* %30, i64 %92
  store double %222, double addrspace(1)* %223, align 8, !tbaa !7
  %224 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %225 = fadd contract double %224, -1.000000e+00
  %226 = load double, double addrspace(1)* %214, align 8, !tbaa !7
  %227 = load double, double addrspace(1)* %218, align 8, !tbaa !7
  %228 = fsub contract double %226, %227
  %229 = fmul contract double %225, %228
  %230 = getelementptr inbounds double, double addrspace(1)* %32, i64 %92
  store double %229, double addrspace(1)* %230, align 8, !tbaa !7
  %231 = fcmp contract ogt double %229, 0.000000e+00
  br i1 %231, label %232, label %249

232:                                              ; preds = %193
  %233 = fcmp olt double %229, 0x1000000000000000
  %234 = select i1 %233, double 0x4FF0000000000000, double 1.000000e+00
  %235 = fmul double %229, %234
  %236 = tail call double @llvm.amdgcn.rsq.f64(double %235)
  %237 = fmul double %235, %236
  %238 = fmul double %236, 5.000000e-01
  %239 = fneg double %238
  %240 = tail call double @llvm.fma.f64(double %239, double %237, double 5.000000e-01)
  %241 = tail call double @llvm.fma.f64(double %238, double %240, double %238)
  %242 = tail call double @llvm.fma.f64(double %237, double %240, double %237)
  %243 = fneg double %242
  %244 = tail call double @llvm.fma.f64(double %243, double %242, double %235)
  %245 = tail call double @llvm.fma.f64(double %244, double %241, double %242)
  %246 = fneg double %245
  %247 = tail call double @llvm.fma.f64(double %246, double %245, double %235)
  %248 = tail call double @llvm.fma.f64(double %247, double %241, double %245)
  br label %267

249:                                              ; preds = %193
  %250 = tail call double @llvm.fabs.f64(double %229)
  %251 = fcmp olt double %250, 0x1000000000000000
  %252 = select i1 %251, double 0x4FF0000000000000, double 1.000000e+00
  %253 = fmul double %250, %252
  %254 = tail call double @llvm.amdgcn.rsq.f64(double %253)
  %255 = fmul double %253, %254
  %256 = fmul double %254, 5.000000e-01
  %257 = fneg double %256
  %258 = tail call double @llvm.fma.f64(double %257, double %255, double 5.000000e-01)
  %259 = tail call double @llvm.fma.f64(double %256, double %258, double %256)
  %260 = tail call double @llvm.fma.f64(double %255, double %258, double %255)
  %261 = fneg double %260
  %262 = tail call double @llvm.fma.f64(double %261, double %260, double %253)
  %263 = tail call double @llvm.fma.f64(double %262, double %259, double %260)
  %264 = fneg double %263
  %265 = tail call double @llvm.fma.f64(double %264, double %263, double %253)
  %266 = tail call double @llvm.fma.f64(double %265, double %259, double %263)
  br label %267

267:                                              ; preds = %249, %232
  %268 = phi i1 [ %251, %249 ], [ %233, %232 ]
  %269 = phi double [ %266, %249 ], [ %248, %232 ]
  %270 = phi double [ %253, %249 ], [ %235, %232 ]
  %271 = select i1 %268, double 0x37F0000000000000, double 1.000000e+00
  %272 = fmul double %271, %269
  %273 = fcmp oeq double %270, 0.000000e+00
  %274 = fcmp oeq double %270, 0x7FF0000000000000
  %275 = or i1 %273, %274
  %276 = select i1 %275, double %270, double %272
  %277 = getelementptr inbounds double, double addrspace(1)* %33, i64 %92
  store double %276, double addrspace(1)* %277, align 8
  %278 = load double, double addrspace(1)* %207, align 8, !tbaa !7
  %279 = fsub contract double %278, %276
  %280 = getelementptr inbounds double, double addrspace(1)* %34, i64 %92
  store double %279, double addrspace(1)* %280, align 8, !tbaa !7
  %281 = load double, double addrspace(1)* %207, align 8, !tbaa !7
  %282 = getelementptr inbounds double, double addrspace(1)* %35, i64 %92
  store double %281, double addrspace(1)* %282, align 8, !tbaa !7
  %283 = load double, double addrspace(1)* %207, align 8, !tbaa !7
  %284 = load double, double addrspace(1)* %277, align 8, !tbaa !7
  %285 = fadd contract double %283, %284
  %286 = getelementptr inbounds double, double addrspace(1)* %36, i64 %92
  store double %285, double addrspace(1)* %286, align 8, !tbaa !7
  %287 = load double, double addrspace(1)* %280, align 8, !tbaa !7
  %288 = fcmp contract olt double %287, 0.000000e+00
  %289 = select i1 %288, double -1.000000e+00, double 1.000000e+00
  %290 = getelementptr inbounds double, double addrspace(1)* %37, i64 %92
  store double %289, double addrspace(1)* %290, align 8, !tbaa !7
  %291 = load double, double addrspace(1)* %282, align 8, !tbaa !7
  %292 = fcmp contract olt double %291, 0.000000e+00
  %293 = select i1 %292, double -1.000000e+00, double 1.000000e+00
  %294 = getelementptr inbounds double, double addrspace(1)* %38, i64 %92
  store double %293, double addrspace(1)* %294, align 8, !tbaa !7
  %295 = load double, double addrspace(1)* %286, align 8, !tbaa !7
  %296 = fcmp contract olt double %295, 0.000000e+00
  %297 = select i1 %296, double -1.000000e+00, double 1.000000e+00
  %298 = getelementptr inbounds double, double addrspace(1)* %39, i64 %92
  store double %297, double addrspace(1)* %298, align 8, !tbaa !7
  %299 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %300 = fadd contract double %299, -1.000000e+00
  %301 = load double, double addrspace(1)* %218, align 8, !tbaa !7
  %302 = getelementptr inbounds double, double addrspace(1)* %24, i64 %92
  %303 = load double, double addrspace(1)* %302, align 8, !tbaa !7
  %304 = fmul contract double %301, %303
  %305 = getelementptr inbounds double, double addrspace(1)* %26, i64 %92
  %306 = load double, double addrspace(1)* %305, align 8, !tbaa !7
  %307 = fadd contract double %304, %306
  %308 = load double, double addrspace(1)* %223, align 8, !tbaa !7
  %309 = fsub contract double %307, %308
  %310 = fmul contract double %300, %309
  %311 = load double, double addrspace(1)* %277, align 8, !tbaa !7
  %312 = load double, double addrspace(1)* %220, align 8, !tbaa !7
  %313 = load double, double addrspace(1)* %207, align 8, !tbaa !7
  %314 = fmul contract double %303, %313
  %315 = fsub contract double %312, %314
  %316 = fmul contract double %311, %315
  %317 = fsub contract double %310, %316
  %318 = fmul contract double %317, 5.000000e-01
  %319 = load double, double addrspace(1)* %230, align 8, !tbaa !7
  %320 = fdiv contract double %318, %319
  %321 = getelementptr inbounds double, double addrspace(1)* %43, i64 %92
  store double %320, double addrspace(1)* %321, align 8, !tbaa !7
  %322 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %323 = fadd contract double %322, -1.000000e+00
  %324 = load double, double addrspace(1)* %214, align 8, !tbaa !7
  %325 = load double, double addrspace(1)* %218, align 8, !tbaa !7
  %326 = fmul contract double %325, 2.000000e+00
  %327 = fsub contract double %324, %326
  %328 = load double, double addrspace(1)* %302, align 8, !tbaa !7
  %329 = fmul contract double %328, %327
  %330 = load double, double addrspace(1)* %223, align 8, !tbaa !7
  %331 = fadd contract double %330, %329
  %332 = load double, double addrspace(1)* %305, align 8, !tbaa !7
  %333 = fsub contract double %331, %332
  %334 = fmul contract double %323, %333
  %335 = load double, double addrspace(1)* %230, align 8, !tbaa !7
  %336 = fdiv contract double %334, %335
  %337 = getelementptr inbounds double, double addrspace(1)* %44, i64 %92
  store double %336, double addrspace(1)* %337, align 8, !tbaa !7
  %338 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %339 = fadd contract double %338, -1.000000e+00
  %340 = load double, double addrspace(1)* %218, align 8, !tbaa !7
  %341 = load double, double addrspace(1)* %302, align 8, !tbaa !7
  %342 = fmul contract double %340, %341
  %343 = load double, double addrspace(1)* %305, align 8, !tbaa !7
  %344 = fadd contract double %342, %343
  %345 = load double, double addrspace(1)* %223, align 8, !tbaa !7
  %346 = fsub contract double %344, %345
  %347 = fmul contract double %339, %346
  %348 = load double, double addrspace(1)* %277, align 8, !tbaa !7
  %349 = load double, double addrspace(1)* %220, align 8, !tbaa !7
  %350 = load double, double addrspace(1)* %207, align 8, !tbaa !7
  %351 = fmul contract double %341, %350
  %352 = fsub contract double %349, %351
  %353 = fmul contract double %348, %352
  %354 = fadd contract double %347, %353
  %355 = fmul contract double %354, 5.000000e-01
  %356 = load double, double addrspace(1)* %230, align 8, !tbaa !7
  %357 = fdiv contract double %355, %356
  %358 = getelementptr inbounds double, double addrspace(1)* %45, i64 %92
  store double %357, double addrspace(1)* %358, align 8, !tbaa !7
  %359 = load double, double addrspace(1)* %280, align 8, !tbaa !7
  %360 = fadd contract double %359, 1.000000e-30
  %361 = load double, double addrspace(1)* %321, align 8, !tbaa !7
  %362 = fdiv contract double %361, %360
  store double %362, double addrspace(1)* %321, align 8, !tbaa !7
  %363 = load double, double addrspace(1)* %282, align 8, !tbaa !7
  %364 = fadd contract double %363, 1.000000e-30
  %365 = load double, double addrspace(1)* %337, align 8, !tbaa !7
  %366 = fdiv contract double %365, %364
  store double %366, double addrspace(1)* %337, align 8, !tbaa !7
  %367 = load double, double addrspace(1)* %286, align 8, !tbaa !7
  %368 = fadd contract double %367, 1.000000e-30
  %369 = load double, double addrspace(1)* %358, align 8, !tbaa !7
  %370 = fdiv contract double %369, %368
  store double %370, double addrspace(1)* %358, align 8, !tbaa !7
  %371 = load double, double addrspace(1)* %290, align 8, !tbaa !7
  %372 = fneg contract double %371
  %373 = load double, double addrspace(1)* %321, align 8, !tbaa !7
  %374 = fmul contract double %373, %372
  %375 = load double, double addrspace(1)* %280, align 8, !tbaa !7
  %376 = fmul contract double %374, %375
  %377 = getelementptr inbounds double, double addrspace(1)* %46, i64 %92
  store double %376, double addrspace(1)* %377, align 8, !tbaa !7
  %378 = load double, double addrspace(1)* %294, align 8, !tbaa !7
  %379 = fneg contract double %378
  %380 = load double, double addrspace(1)* %337, align 8, !tbaa !7
  %381 = fmul contract double %380, %379
  %382 = load double, double addrspace(1)* %282, align 8, !tbaa !7
  %383 = fmul contract double %381, %382
  %384 = getelementptr inbounds double, double addrspace(1)* %47, i64 %92
  store double %383, double addrspace(1)* %384, align 8, !tbaa !7
  %385 = load double, double addrspace(1)* %298, align 8, !tbaa !7
  %386 = fneg contract double %385
  %387 = load double, double addrspace(1)* %358, align 8, !tbaa !7
  %388 = fmul contract double %387, %386
  %389 = load double, double addrspace(1)* %286, align 8, !tbaa !7
  %390 = fmul contract double %388, %389
  %391 = getelementptr inbounds double, double addrspace(1)* %48, i64 %92
  store double %390, double addrspace(1)* %391, align 8, !tbaa !7
  br label %392

392:                                              ; preds = %192, %267
  %393 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  store double %393, double addrspace(1)* %65, align 8, !tbaa !7
  %394 = load double, double addrspace(1)* %68, align 8, !tbaa !7
  store double %394, double addrspace(1)* %69, align 8, !tbaa !7
  %395 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  store double %395, double addrspace(1)* %71, align 8, !tbaa !7
  %396 = load double, double addrspace(1)* %72, align 8, !tbaa !7
  store double %396, double addrspace(1)* %73, align 8, !tbaa !7
  %397 = load double, double addrspace(1)* %74, align 8, !tbaa !7
  store double %397, double addrspace(1)* %75, align 8, !tbaa !7
  %398 = load double, double addrspace(1)* %76, align 8, !tbaa !7
  store double %398, double addrspace(1)* %77, align 8, !tbaa !7
  %399 = load double, double addrspace(1)* %8, align 8, !tbaa !7
  %400 = load double, double addrspace(1)* %9, align 8, !tbaa !7
  %401 = fdiv contract double %399, %400
  %402 = icmp sgt i32 %91, 1
  %403 = icmp slt i32 %91, %66
  %404 = select i1 %402, i1 %403, i1 false
  br i1 %404, label %405, label %499

405:                                              ; preds = %392
  %406 = getelementptr inbounds double, double addrspace(1)* %37, i64 %92
  %407 = load double, double addrspace(1)* %406, align 8, !tbaa !7
  %408 = fptosi double %407 to i32
  %409 = sub nsw i32 %91, %408
  %410 = getelementptr inbounds i32, i32 addrspace(1)* %40, i64 %92
  store i32 %409, i32 addrspace(1)* %410, align 4, !tbaa !11
  %411 = getelementptr inbounds double, double addrspace(1)* %46, i64 %92
  %412 = load double, double addrspace(1)* %411, align 8, !tbaa !7
  %413 = getelementptr inbounds double, double addrspace(1)* %34, i64 %92
  %414 = load double, double addrspace(1)* %413, align 8, !tbaa !7
  %415 = sext i32 %409 to i64
  %416 = getelementptr inbounds double, double addrspace(1)* %43, i64 %415
  %417 = load double, double addrspace(1)* %416, align 8, !tbaa !7
  %418 = fmul contract double %417, 2.000000e+00
  %419 = getelementptr inbounds double, double addrspace(1)* %43, i64 %92
  %420 = load double, double addrspace(1)* %419, align 8, !tbaa !7
  %421 = fmul contract double %420, 2.000000e+00
  %422 = tail call double @llvm.minnum.f64(double %417, double %421)
  %423 = tail call double @llvm.maxnum.f64(double %420, double %422)
  %424 = tail call double @llvm.minnum.f64(double %418, double %423)
  %425 = tail call double @llvm.maxnum.f64(double %424, double 0.000000e+00)
  %426 = tail call double @llvm.maxnum.f64(double %417, double %421)
  %427 = tail call double @llvm.minnum.f64(double %420, double %426)
  %428 = tail call double @llvm.maxnum.f64(double %418, double %427)
  %429 = tail call double @llvm.minnum.f64(double %428, double 0.000000e+00)
  %430 = fadd contract double %425, %429
  %431 = fmul contract double %401, %414
  %432 = fsub contract double %407, %431
  %433 = fmul contract double %432, %430
  %434 = fmul contract double %414, %433
  %435 = fadd contract double %412, %434
  %436 = getelementptr inbounds double, double addrspace(1)* %49, i64 %92
  store double %435, double addrspace(1)* %436, align 8, !tbaa !7
  %437 = getelementptr inbounds double, double addrspace(1)* %38, i64 %92
  %438 = load double, double addrspace(1)* %437, align 8, !tbaa !7
  %439 = fptosi double %438 to i32
  %440 = sub nsw i32 %91, %439
  %441 = getelementptr inbounds i32, i32 addrspace(1)* %41, i64 %92
  store i32 %440, i32 addrspace(1)* %441, align 4, !tbaa !11
  %442 = getelementptr inbounds double, double addrspace(1)* %47, i64 %92
  %443 = load double, double addrspace(1)* %442, align 8, !tbaa !7
  %444 = getelementptr inbounds double, double addrspace(1)* %35, i64 %92
  %445 = load double, double addrspace(1)* %444, align 8, !tbaa !7
  %446 = sext i32 %440 to i64
  %447 = getelementptr inbounds double, double addrspace(1)* %44, i64 %446
  %448 = load double, double addrspace(1)* %447, align 8, !tbaa !7
  %449 = fmul contract double %448, 2.000000e+00
  %450 = getelementptr inbounds double, double addrspace(1)* %44, i64 %92
  %451 = load double, double addrspace(1)* %450, align 8, !tbaa !7
  %452 = fmul contract double %451, 2.000000e+00
  %453 = tail call double @llvm.minnum.f64(double %448, double %452)
  %454 = tail call double @llvm.maxnum.f64(double %451, double %453)
  %455 = tail call double @llvm.minnum.f64(double %449, double %454)
  %456 = tail call double @llvm.maxnum.f64(double %455, double 0.000000e+00)
  %457 = tail call double @llvm.maxnum.f64(double %448, double %452)
  %458 = tail call double @llvm.minnum.f64(double %451, double %457)
  %459 = tail call double @llvm.maxnum.f64(double %449, double %458)
  %460 = tail call double @llvm.minnum.f64(double %459, double 0.000000e+00)
  %461 = fadd contract double %456, %460
  %462 = fmul contract double %401, %445
  %463 = fsub contract double %438, %462
  %464 = fmul contract double %463, %461
  %465 = fmul contract double %445, %464
  %466 = fadd contract double %443, %465
  %467 = getelementptr inbounds double, double addrspace(1)* %50, i64 %92
  store double %466, double addrspace(1)* %467, align 8, !tbaa !7
  %468 = getelementptr inbounds double, double addrspace(1)* %39, i64 %92
  %469 = load double, double addrspace(1)* %468, align 8, !tbaa !7
  %470 = fptosi double %469 to i32
  %471 = sub nsw i32 %91, %470
  %472 = getelementptr inbounds i32, i32 addrspace(1)* %42, i64 %92
  store i32 %471, i32 addrspace(1)* %472, align 4, !tbaa !11
  %473 = getelementptr inbounds double, double addrspace(1)* %48, i64 %92
  %474 = load double, double addrspace(1)* %473, align 8, !tbaa !7
  %475 = getelementptr inbounds double, double addrspace(1)* %36, i64 %92
  %476 = load double, double addrspace(1)* %475, align 8, !tbaa !7
  %477 = sext i32 %471 to i64
  %478 = getelementptr inbounds double, double addrspace(1)* %45, i64 %477
  %479 = load double, double addrspace(1)* %478, align 8, !tbaa !7
  %480 = fmul contract double %479, 2.000000e+00
  %481 = getelementptr inbounds double, double addrspace(1)* %45, i64 %92
  %482 = load double, double addrspace(1)* %481, align 8, !tbaa !7
  %483 = fmul contract double %482, 2.000000e+00
  %484 = tail call double @llvm.minnum.f64(double %479, double %483)
  %485 = tail call double @llvm.maxnum.f64(double %482, double %484)
  %486 = tail call double @llvm.minnum.f64(double %480, double %485)
  %487 = tail call double @llvm.maxnum.f64(double %486, double 0.000000e+00)
  %488 = tail call double @llvm.maxnum.f64(double %479, double %483)
  %489 = tail call double @llvm.minnum.f64(double %482, double %488)
  %490 = tail call double @llvm.maxnum.f64(double %480, double %489)
  %491 = tail call double @llvm.minnum.f64(double %490, double 0.000000e+00)
  %492 = fadd contract double %487, %491
  %493 = fmul contract double %401, %476
  %494 = fsub contract double %469, %493
  %495 = fmul contract double %494, %492
  %496 = fmul contract double %476, %495
  %497 = fadd contract double %474, %496
  %498 = getelementptr inbounds double, double addrspace(1)* %51, i64 %92
  store double %497, double addrspace(1)* %498, align 8, !tbaa !7
  br label %499

499:                                              ; preds = %405, %392
  br i1 %161, label %500, label %566

500:                                              ; preds = %499
  %501 = getelementptr inbounds double, double addrspace(1)* %21, i64 %92
  %502 = load double, double addrspace(1)* %501, align 8, !tbaa !7
  %503 = getelementptr inbounds double, double addrspace(1)* %18, i64 %92
  %504 = load double, double addrspace(1)* %503, align 8, !tbaa !7
  %505 = fadd contract double %502, %504
  %506 = getelementptr inbounds double, double addrspace(1)* %49, i64 %92
  %507 = load double, double addrspace(1)* %506, align 8, !tbaa !7
  %508 = fadd contract double %505, %507
  %509 = getelementptr inbounds double, double addrspace(1)* %50, i64 %92
  %510 = load double, double addrspace(1)* %509, align 8, !tbaa !7
  %511 = fadd contract double %508, %510
  %512 = getelementptr inbounds double, double addrspace(1)* %51, i64 %92
  %513 = load double, double addrspace(1)* %512, align 8, !tbaa !7
  %514 = fadd contract double %511, %513
  %515 = fmul contract double %514, 5.000000e-01
  %516 = getelementptr inbounds double, double addrspace(1)* %5, i64 %92
  store double %515, double addrspace(1)* %516, align 8, !tbaa !7
  %517 = getelementptr inbounds double, double addrspace(1)* %22, i64 %92
  %518 = load double, double addrspace(1)* %517, align 8, !tbaa !7
  %519 = getelementptr inbounds double, double addrspace(1)* %19, i64 %92
  %520 = load double, double addrspace(1)* %519, align 8, !tbaa !7
  %521 = fadd contract double %518, %520
  %522 = getelementptr inbounds double, double addrspace(1)* %34, i64 %92
  %523 = load double, double addrspace(1)* %522, align 8, !tbaa !7
  %524 = load double, double addrspace(1)* %506, align 8, !tbaa !7
  %525 = fmul contract double %523, %524
  %526 = fadd contract double %521, %525
  %527 = getelementptr inbounds double, double addrspace(1)* %35, i64 %92
  %528 = load double, double addrspace(1)* %527, align 8, !tbaa !7
  %529 = load double, double addrspace(1)* %509, align 8, !tbaa !7
  %530 = fmul contract double %528, %529
  %531 = fadd contract double %526, %530
  %532 = getelementptr inbounds double, double addrspace(1)* %36, i64 %92
  %533 = load double, double addrspace(1)* %532, align 8, !tbaa !7
  %534 = load double, double addrspace(1)* %512, align 8, !tbaa !7
  %535 = fmul contract double %533, %534
  %536 = fadd contract double %531, %535
  %537 = fmul contract double %536, 5.000000e-01
  %538 = getelementptr inbounds double, double addrspace(1)* %6, i64 %92
  store double %537, double addrspace(1)* %538, align 8, !tbaa !7
  %539 = getelementptr inbounds double, double addrspace(1)* %23, i64 %92
  %540 = load double, double addrspace(1)* %539, align 8, !tbaa !7
  %541 = getelementptr inbounds double, double addrspace(1)* %20, i64 %92
  %542 = load double, double addrspace(1)* %541, align 8, !tbaa !7
  %543 = fadd contract double %540, %542
  %544 = getelementptr inbounds double, double addrspace(1)* %29, i64 %92
  %545 = load double, double addrspace(1)* %544, align 8, !tbaa !7
  %546 = getelementptr inbounds double, double addrspace(1)* %28, i64 %92
  %547 = load double, double addrspace(1)* %546, align 8, !tbaa !7
  %548 = getelementptr inbounds double, double addrspace(1)* %33, i64 %92
  %549 = load double, double addrspace(1)* %548, align 8, !tbaa !7
  %550 = fmul contract double %547, %549
  %551 = fsub contract double %545, %550
  %552 = load double, double addrspace(1)* %506, align 8, !tbaa !7
  %553 = fmul contract double %552, %551
  %554 = fadd contract double %543, %553
  %555 = getelementptr inbounds double, double addrspace(1)* %31, i64 %92
  %556 = load double, double addrspace(1)* %555, align 8, !tbaa !7
  %557 = load double, double addrspace(1)* %509, align 8, !tbaa !7
  %558 = fmul contract double %556, %557
  %559 = fadd contract double %554, %558
  %560 = fadd contract double %545, %550
  %561 = load double, double addrspace(1)* %512, align 8, !tbaa !7
  %562 = fmul contract double %560, %561
  %563 = fadd contract double %559, %562
  %564 = fmul contract double %563, 5.000000e-01
  %565 = getelementptr inbounds double, double addrspace(1)* %7, i64 %92
  store double %564, double addrspace(1)* %565, align 8, !tbaa !7
  br label %566

566:                                              ; preds = %500, %499
  %567 = phi i1 [ %403, %500 ], [ false, %499 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %567, label %568, label %604

568:                                              ; preds = %566
  %569 = load double, double addrspace(1)* %8, align 8, !tbaa !7
  %570 = load double, double addrspace(1)* %9, align 8, !tbaa !7
  %571 = fdiv contract double %569, %570
  %572 = add nuw nsw i32 %91, 1
  %573 = zext i32 %572 to i64
  %574 = getelementptr inbounds double, double addrspace(1)* %5, i64 %573
  %575 = load double, double addrspace(1)* %574, align 8, !tbaa !7
  %576 = getelementptr inbounds double, double addrspace(1)* %5, i64 %92
  %577 = load double, double addrspace(1)* %576, align 8, !tbaa !7
  %578 = fsub contract double %575, %577
  %579 = fmul contract double %571, %578
  %580 = load double, double addrspace(1)* %95, align 8, !tbaa !7
  %581 = fsub contract double %580, %579
  store double %581, double addrspace(1)* %95, align 8, !tbaa !7
  %582 = load double, double addrspace(1)* %8, align 8, !tbaa !7
  %583 = load double, double addrspace(1)* %9, align 8, !tbaa !7
  %584 = fdiv contract double %582, %583
  %585 = getelementptr inbounds double, double addrspace(1)* %6, i64 %573
  %586 = load double, double addrspace(1)* %585, align 8, !tbaa !7
  %587 = getelementptr inbounds double, double addrspace(1)* %6, i64 %92
  %588 = load double, double addrspace(1)* %587, align 8, !tbaa !7
  %589 = fsub contract double %586, %588
  %590 = fmul contract double %584, %589
  %591 = load double, double addrspace(1)* %121, align 8, !tbaa !7
  %592 = fsub contract double %591, %590
  store double %592, double addrspace(1)* %121, align 8, !tbaa !7
  %593 = load double, double addrspace(1)* %8, align 8, !tbaa !7
  %594 = load double, double addrspace(1)* %9, align 8, !tbaa !7
  %595 = fdiv contract double %593, %594
  %596 = getelementptr inbounds double, double addrspace(1)* %7, i64 %573
  %597 = load double, double addrspace(1)* %596, align 8, !tbaa !7
  %598 = getelementptr inbounds double, double addrspace(1)* %7, i64 %92
  %599 = load double, double addrspace(1)* %598, align 8, !tbaa !7
  %600 = fsub contract double %597, %599
  %601 = fmul contract double %595, %600
  %602 = load double, double addrspace(1)* %129, align 8, !tbaa !7
  %603 = fsub contract double %602, %601
  store double %603, double addrspace(1)* %129, align 8, !tbaa !7
  br label %604

604:                                              ; preds = %568, %566
  %605 = load double, double addrspace(1)* %78, align 8, !tbaa !7
  store double %605, double addrspace(1)* %1, align 8, !tbaa !7
  %606 = load double, double addrspace(1)* %79, align 8, !tbaa !7
  %607 = fneg contract double %606
  store double %607, double addrspace(1)* %2, align 8, !tbaa !7
  %608 = load double, double addrspace(1)* %80, align 8, !tbaa !7
  store double %608, double addrspace(1)* %3, align 8, !tbaa !7
  %609 = load double, double addrspace(1)* %83, align 8, !tbaa !7
  store double %609, double addrspace(1)* %84, align 8, !tbaa !7
  %610 = load double, double addrspace(1)* %85, align 8, !tbaa !7
  %611 = fneg contract double %610
  store double %611, double addrspace(1)* %86, align 8, !tbaa !7
  %612 = load double, double addrspace(1)* %87, align 8, !tbaa !7
  store double %612, double addrspace(1)* %88, align 8, !tbaa !7
  %613 = add nsw i32 %91, %58
  %614 = icmp slt i32 %613, %0
  br i1 %614, label %90, label %89, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
