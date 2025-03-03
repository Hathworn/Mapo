; ModuleID = '../data/hip_kernels/591/30/main.cu'
source_filename = "../data/hip_kernels/591/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE10s_data_snr = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE9s_data_dm = internal unnamed_addr addrspace(3) global [128 x i32] undef, align 16
@_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE9s_data_ts = internal unnamed_addr addrspace(3) global [128 x i32] undef, align 16
@_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPi(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 addrspace(1)* nocapture %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = icmp ult i32 %14, 10
  %16 = zext i1 %15 to i32
  %17 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 %14
  store i32 %16, i32 addrspace(3)* %17, align 4
  %18 = icmp sgt i32 %10, 0
  br i1 %18, label %22, label %19

19:                                               ; preds = %13
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %20, 10
  br label %92

22:                                               ; preds = %13
  %23 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE9s_data_dm, i32 0, i32 %14
  %24 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE9s_data_ts, i32 0, i32 %14
  %25 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE10s_data_snr, i32 0, i32 %14
  %26 = add nuw nsw i32 %14, 64
  %27 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE9s_data_dm, i32 0, i32 %26
  %28 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE9s_data_ts, i32 0, i32 %26
  %29 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE10s_data_snr, i32 0, i32 %26
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %31 = mul i32 %30, 10
  %32 = uitofp i32 %9 to float
  %33 = icmp uge i32 %31, %8
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %34
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %34
  %37 = getelementptr inbounds float, float addrspace(1)* %7, i64 %34
  %38 = or i32 %31, 1
  %39 = icmp uge i32 %38, %8
  %40 = sext i32 %38 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %40
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %40
  %43 = getelementptr inbounds float, float addrspace(1)* %7, i64 %40
  %44 = add nsw i32 %31, 2
  %45 = icmp uge i32 %44, %8
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %46
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %46
  %49 = getelementptr inbounds float, float addrspace(1)* %7, i64 %46
  %50 = add nsw i32 %31, 3
  %51 = icmp uge i32 %50, %8
  %52 = sext i32 %50 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %52
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %52
  %55 = getelementptr inbounds float, float addrspace(1)* %7, i64 %52
  %56 = add nsw i32 %31, 4
  %57 = icmp uge i32 %56, %8
  %58 = sext i32 %56 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %58
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %58
  %61 = getelementptr inbounds float, float addrspace(1)* %7, i64 %58
  %62 = add nsw i32 %31, 5
  %63 = icmp uge i32 %62, %8
  %64 = sext i32 %62 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %64
  %67 = getelementptr inbounds float, float addrspace(1)* %7, i64 %64
  %68 = add nsw i32 %31, 6
  %69 = icmp uge i32 %68, %8
  %70 = sext i32 %68 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %70
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %70
  %73 = getelementptr inbounds float, float addrspace(1)* %7, i64 %70
  %74 = add nsw i32 %31, 7
  %75 = icmp uge i32 %74, %8
  %76 = sext i32 %74 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %76
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %76
  %79 = getelementptr inbounds float, float addrspace(1)* %7, i64 %76
  %80 = add nsw i32 %31, 8
  %81 = icmp uge i32 %80, %8
  %82 = sext i32 %80 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %82
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %82
  %85 = getelementptr inbounds float, float addrspace(1)* %7, i64 %82
  %86 = add nsw i32 %31, 9
  %87 = icmp uge i32 %86, %8
  %88 = sext i32 %86 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %88
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %88
  %91 = getelementptr inbounds float, float addrspace(1)* %7, i64 %88
  br label %94

92:                                               ; preds = %572, %19
  %93 = phi i32 [ %21, %19 ], [ %31, %572 ]
  br i1 %15, label %575, label %599

94:                                               ; preds = %22, %572
  %95 = phi i32 [ 0, %22 ], [ %573, %572 ]
  %96 = shl nsw i32 %95, 7
  %97 = add nuw i32 %96, %14
  %98 = icmp ult i32 %97, %8
  br i1 %98, label %99, label %107

99:                                               ; preds = %94
  %100 = sext i32 %97 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !5
  store i32 %102, i32 addrspace(3)* %23, align 4, !tbaa !5
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %100
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !5
  store i32 %104, i32 addrspace(3)* %24, align 4, !tbaa !5
  %105 = getelementptr inbounds float, float addrspace(1)* %7, i64 %100
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !9
  br label %108

107:                                              ; preds = %94
  store i32 0, i32 addrspace(3)* %23, align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* %24, align 4, !tbaa !5
  br label %108

108:                                              ; preds = %107, %99
  %109 = phi float [ -1.000000e+03, %107 ], [ %106, %99 ]
  store float %109, float addrspace(3)* %25, align 4, !tbaa !9
  %110 = add i32 %97, 64
  %111 = icmp ult i32 %110, %8
  br i1 %111, label %112, label %120

112:                                              ; preds = %108
  %113 = sext i32 %110 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !5
  store i32 %115, i32 addrspace(3)* %27, align 4, !tbaa !5
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %113
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !5
  store i32 %117, i32 addrspace(3)* %28, align 4, !tbaa !5
  %118 = getelementptr inbounds float, float addrspace(1)* %7, i64 %113
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !9
  br label %121

120:                                              ; preds = %108
  store i32 0, i32 addrspace(3)* %27, align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %121

121:                                              ; preds = %120, %112
  %122 = phi float [ -1.000000e+03, %120 ], [ %119, %112 ]
  store float %122, float addrspace(3)* %29, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %123 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 0), align 16, !tbaa !5
  %124 = icmp eq i32 %123, 0
  %125 = select i1 %124, i1 true, i1 %33
  br i1 %125, label %167, label %126

126:                                              ; preds = %121
  %127 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !5
  %128 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5
  %129 = load float, float addrspace(1)* %37, align 4, !tbaa !9
  %130 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %131 = fcmp contract ult float %130, %129
  br i1 %131, label %148, label %132

132:                                              ; preds = %126
  %133 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %134 = sitofp i32 %133 to float
  %135 = sitofp i32 %127 to float
  %136 = fsub contract float %134, %135
  %137 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %138 = sitofp i32 %137 to float
  %139 = sitofp i32 %128 to float
  %140 = fsub contract float %138, %139
  %141 = fmul contract float %140, %140
  %142 = fmul contract float %136, %136
  %143 = fadd contract float %142, %141
  %144 = fcmp contract olt float %143, %32
  %145 = fcmp contract une float %143, 0.000000e+00
  %146 = and i1 %144, %145
  br i1 %146, label %147, label %148

147:                                              ; preds = %132
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 0), align 16, !tbaa !5
  br label %148

148:                                              ; preds = %132, %147, %126
  %149 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %150 = fcmp contract ult float %149, %129
  br i1 %150, label %167, label %151

151:                                              ; preds = %148
  %152 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %153 = sitofp i32 %152 to float
  %154 = sitofp i32 %127 to float
  %155 = fsub contract float %153, %154
  %156 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %157 = sitofp i32 %156 to float
  %158 = sitofp i32 %128 to float
  %159 = fsub contract float %157, %158
  %160 = fmul contract float %159, %159
  %161 = fmul contract float %155, %155
  %162 = fadd contract float %161, %160
  %163 = fcmp contract olt float %162, %32
  %164 = fcmp contract une float %162, 0.000000e+00
  %165 = and i1 %163, %164
  br i1 %165, label %166, label %167

166:                                              ; preds = %151
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 0), align 16, !tbaa !5
  br label %167

167:                                              ; preds = %121, %151, %166, %148
  %168 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 1), align 4, !tbaa !5
  %169 = icmp eq i32 %168, 0
  %170 = select i1 %169, i1 true, i1 %39
  br i1 %170, label %212, label %171

171:                                              ; preds = %167
  %172 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %173 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !5
  %174 = load float, float addrspace(1)* %43, align 4, !tbaa !9
  %175 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %176 = fcmp contract ult float %175, %174
  br i1 %176, label %193, label %177

177:                                              ; preds = %171
  %178 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %179 = sitofp i32 %178 to float
  %180 = sitofp i32 %172 to float
  %181 = fsub contract float %179, %180
  %182 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %183 = sitofp i32 %182 to float
  %184 = sitofp i32 %173 to float
  %185 = fsub contract float %183, %184
  %186 = fmul contract float %185, %185
  %187 = fmul contract float %181, %181
  %188 = fadd contract float %187, %186
  %189 = fcmp contract olt float %188, %32
  %190 = fcmp contract une float %188, 0.000000e+00
  %191 = and i1 %189, %190
  br i1 %191, label %192, label %193

192:                                              ; preds = %177
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 1), align 4, !tbaa !5
  br label %193

193:                                              ; preds = %192, %177, %171
  %194 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %195 = fcmp contract ult float %194, %174
  br i1 %195, label %212, label %196

196:                                              ; preds = %193
  %197 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %198 = sitofp i32 %197 to float
  %199 = sitofp i32 %172 to float
  %200 = fsub contract float %198, %199
  %201 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %202 = sitofp i32 %201 to float
  %203 = sitofp i32 %173 to float
  %204 = fsub contract float %202, %203
  %205 = fmul contract float %204, %204
  %206 = fmul contract float %200, %200
  %207 = fadd contract float %206, %205
  %208 = fcmp contract olt float %207, %32
  %209 = fcmp contract une float %207, 0.000000e+00
  %210 = and i1 %208, %209
  br i1 %210, label %211, label %212

211:                                              ; preds = %196
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 1), align 4, !tbaa !5
  br label %212

212:                                              ; preds = %167, %211, %196, %193
  %213 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 2), align 8, !tbaa !5
  %214 = icmp eq i32 %213, 0
  %215 = select i1 %214, i1 true, i1 %45
  br i1 %215, label %257, label %216

216:                                              ; preds = %212
  %217 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !5
  %218 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !5
  %219 = load float, float addrspace(1)* %49, align 4, !tbaa !9
  %220 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %221 = fcmp contract ult float %220, %219
  br i1 %221, label %238, label %222

222:                                              ; preds = %216
  %223 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %224 = sitofp i32 %223 to float
  %225 = sitofp i32 %217 to float
  %226 = fsub contract float %224, %225
  %227 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %228 = sitofp i32 %227 to float
  %229 = sitofp i32 %218 to float
  %230 = fsub contract float %228, %229
  %231 = fmul contract float %230, %230
  %232 = fmul contract float %226, %226
  %233 = fadd contract float %232, %231
  %234 = fcmp contract olt float %233, %32
  %235 = fcmp contract une float %233, 0.000000e+00
  %236 = and i1 %234, %235
  br i1 %236, label %237, label %238

237:                                              ; preds = %222
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 2), align 8, !tbaa !5
  br label %238

238:                                              ; preds = %237, %222, %216
  %239 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %240 = fcmp contract ult float %239, %219
  br i1 %240, label %257, label %241

241:                                              ; preds = %238
  %242 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %243 = sitofp i32 %242 to float
  %244 = sitofp i32 %217 to float
  %245 = fsub contract float %243, %244
  %246 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %247 = sitofp i32 %246 to float
  %248 = sitofp i32 %218 to float
  %249 = fsub contract float %247, %248
  %250 = fmul contract float %249, %249
  %251 = fmul contract float %245, %245
  %252 = fadd contract float %251, %250
  %253 = fcmp contract olt float %252, %32
  %254 = fcmp contract une float %252, 0.000000e+00
  %255 = and i1 %253, %254
  br i1 %255, label %256, label %257

256:                                              ; preds = %241
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 2), align 8, !tbaa !5
  br label %257

257:                                              ; preds = %212, %256, %241, %238
  %258 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 3), align 4, !tbaa !5
  %259 = icmp eq i32 %258, 0
  %260 = select i1 %259, i1 true, i1 %51
  br i1 %260, label %302, label %261

261:                                              ; preds = %257
  %262 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !5
  %263 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5
  %264 = load float, float addrspace(1)* %55, align 4, !tbaa !9
  %265 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %266 = fcmp contract ult float %265, %264
  br i1 %266, label %283, label %267

267:                                              ; preds = %261
  %268 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %269 = sitofp i32 %268 to float
  %270 = sitofp i32 %262 to float
  %271 = fsub contract float %269, %270
  %272 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %273 = sitofp i32 %272 to float
  %274 = sitofp i32 %263 to float
  %275 = fsub contract float %273, %274
  %276 = fmul contract float %275, %275
  %277 = fmul contract float %271, %271
  %278 = fadd contract float %277, %276
  %279 = fcmp contract olt float %278, %32
  %280 = fcmp contract une float %278, 0.000000e+00
  %281 = and i1 %279, %280
  br i1 %281, label %282, label %283

282:                                              ; preds = %267
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 3), align 4, !tbaa !5
  br label %283

283:                                              ; preds = %282, %267, %261
  %284 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %285 = fcmp contract ult float %284, %264
  br i1 %285, label %302, label %286

286:                                              ; preds = %283
  %287 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %288 = sitofp i32 %287 to float
  %289 = sitofp i32 %262 to float
  %290 = fsub contract float %288, %289
  %291 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %292 = sitofp i32 %291 to float
  %293 = sitofp i32 %263 to float
  %294 = fsub contract float %292, %293
  %295 = fmul contract float %294, %294
  %296 = fmul contract float %290, %290
  %297 = fadd contract float %296, %295
  %298 = fcmp contract olt float %297, %32
  %299 = fcmp contract une float %297, 0.000000e+00
  %300 = and i1 %298, %299
  br i1 %300, label %301, label %302

301:                                              ; preds = %286
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 3), align 4, !tbaa !5
  br label %302

302:                                              ; preds = %257, %301, %286, %283
  %303 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 4), align 16, !tbaa !5
  %304 = icmp eq i32 %303, 0
  %305 = select i1 %304, i1 true, i1 %57
  br i1 %305, label %347, label %306

306:                                              ; preds = %302
  %307 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !5
  %308 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !5
  %309 = load float, float addrspace(1)* %61, align 4, !tbaa !9
  %310 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %311 = fcmp contract ult float %310, %309
  br i1 %311, label %328, label %312

312:                                              ; preds = %306
  %313 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %314 = sitofp i32 %313 to float
  %315 = sitofp i32 %307 to float
  %316 = fsub contract float %314, %315
  %317 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %318 = sitofp i32 %317 to float
  %319 = sitofp i32 %308 to float
  %320 = fsub contract float %318, %319
  %321 = fmul contract float %320, %320
  %322 = fmul contract float %316, %316
  %323 = fadd contract float %322, %321
  %324 = fcmp contract olt float %323, %32
  %325 = fcmp contract une float %323, 0.000000e+00
  %326 = and i1 %324, %325
  br i1 %326, label %327, label %328

327:                                              ; preds = %312
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 4), align 16, !tbaa !5
  br label %328

328:                                              ; preds = %327, %312, %306
  %329 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %330 = fcmp contract ult float %329, %309
  br i1 %330, label %347, label %331

331:                                              ; preds = %328
  %332 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %333 = sitofp i32 %332 to float
  %334 = sitofp i32 %307 to float
  %335 = fsub contract float %333, %334
  %336 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %337 = sitofp i32 %336 to float
  %338 = sitofp i32 %308 to float
  %339 = fsub contract float %337, %338
  %340 = fmul contract float %339, %339
  %341 = fmul contract float %335, %335
  %342 = fadd contract float %341, %340
  %343 = fcmp contract olt float %342, %32
  %344 = fcmp contract une float %342, 0.000000e+00
  %345 = and i1 %343, %344
  br i1 %345, label %346, label %347

346:                                              ; preds = %331
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 4), align 16, !tbaa !5
  br label %347

347:                                              ; preds = %302, %346, %331, %328
  %348 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 5), align 4, !tbaa !5
  %349 = icmp eq i32 %348, 0
  %350 = select i1 %349, i1 true, i1 %63
  br i1 %350, label %392, label %351

351:                                              ; preds = %347
  %352 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !5
  %353 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !5
  %354 = load float, float addrspace(1)* %67, align 4, !tbaa !9
  %355 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %356 = fcmp contract ult float %355, %354
  br i1 %356, label %373, label %357

357:                                              ; preds = %351
  %358 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %359 = sitofp i32 %358 to float
  %360 = sitofp i32 %352 to float
  %361 = fsub contract float %359, %360
  %362 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %363 = sitofp i32 %362 to float
  %364 = sitofp i32 %353 to float
  %365 = fsub contract float %363, %364
  %366 = fmul contract float %365, %365
  %367 = fmul contract float %361, %361
  %368 = fadd contract float %367, %366
  %369 = fcmp contract olt float %368, %32
  %370 = fcmp contract une float %368, 0.000000e+00
  %371 = and i1 %369, %370
  br i1 %371, label %372, label %373

372:                                              ; preds = %357
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 5), align 4, !tbaa !5
  br label %373

373:                                              ; preds = %372, %357, %351
  %374 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %375 = fcmp contract ult float %374, %354
  br i1 %375, label %392, label %376

376:                                              ; preds = %373
  %377 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %378 = sitofp i32 %377 to float
  %379 = sitofp i32 %352 to float
  %380 = fsub contract float %378, %379
  %381 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %382 = sitofp i32 %381 to float
  %383 = sitofp i32 %353 to float
  %384 = fsub contract float %382, %383
  %385 = fmul contract float %384, %384
  %386 = fmul contract float %380, %380
  %387 = fadd contract float %386, %385
  %388 = fcmp contract olt float %387, %32
  %389 = fcmp contract une float %387, 0.000000e+00
  %390 = and i1 %388, %389
  br i1 %390, label %391, label %392

391:                                              ; preds = %376
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 5), align 4, !tbaa !5
  br label %392

392:                                              ; preds = %347, %391, %376, %373
  %393 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 6), align 8, !tbaa !5
  %394 = icmp eq i32 %393, 0
  %395 = select i1 %394, i1 true, i1 %69
  br i1 %395, label %437, label %396

396:                                              ; preds = %392
  %397 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !5
  %398 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !5
  %399 = load float, float addrspace(1)* %73, align 4, !tbaa !9
  %400 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %401 = fcmp contract ult float %400, %399
  br i1 %401, label %418, label %402

402:                                              ; preds = %396
  %403 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %404 = sitofp i32 %403 to float
  %405 = sitofp i32 %397 to float
  %406 = fsub contract float %404, %405
  %407 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %408 = sitofp i32 %407 to float
  %409 = sitofp i32 %398 to float
  %410 = fsub contract float %408, %409
  %411 = fmul contract float %410, %410
  %412 = fmul contract float %406, %406
  %413 = fadd contract float %412, %411
  %414 = fcmp contract olt float %413, %32
  %415 = fcmp contract une float %413, 0.000000e+00
  %416 = and i1 %414, %415
  br i1 %416, label %417, label %418

417:                                              ; preds = %402
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 6), align 8, !tbaa !5
  br label %418

418:                                              ; preds = %417, %402, %396
  %419 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %420 = fcmp contract ult float %419, %399
  br i1 %420, label %437, label %421

421:                                              ; preds = %418
  %422 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %423 = sitofp i32 %422 to float
  %424 = sitofp i32 %397 to float
  %425 = fsub contract float %423, %424
  %426 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %427 = sitofp i32 %426 to float
  %428 = sitofp i32 %398 to float
  %429 = fsub contract float %427, %428
  %430 = fmul contract float %429, %429
  %431 = fmul contract float %425, %425
  %432 = fadd contract float %431, %430
  %433 = fcmp contract olt float %432, %32
  %434 = fcmp contract une float %432, 0.000000e+00
  %435 = and i1 %433, %434
  br i1 %435, label %436, label %437

436:                                              ; preds = %421
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 6), align 8, !tbaa !5
  br label %437

437:                                              ; preds = %392, %436, %421, %418
  %438 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 7), align 4, !tbaa !5
  %439 = icmp eq i32 %438, 0
  %440 = select i1 %439, i1 true, i1 %75
  br i1 %440, label %482, label %441

441:                                              ; preds = %437
  %442 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !5
  %443 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !5
  %444 = load float, float addrspace(1)* %79, align 4, !tbaa !9
  %445 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %446 = fcmp contract ult float %445, %444
  br i1 %446, label %463, label %447

447:                                              ; preds = %441
  %448 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %449 = sitofp i32 %448 to float
  %450 = sitofp i32 %442 to float
  %451 = fsub contract float %449, %450
  %452 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %453 = sitofp i32 %452 to float
  %454 = sitofp i32 %443 to float
  %455 = fsub contract float %453, %454
  %456 = fmul contract float %455, %455
  %457 = fmul contract float %451, %451
  %458 = fadd contract float %457, %456
  %459 = fcmp contract olt float %458, %32
  %460 = fcmp contract une float %458, 0.000000e+00
  %461 = and i1 %459, %460
  br i1 %461, label %462, label %463

462:                                              ; preds = %447
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 7), align 4, !tbaa !5
  br label %463

463:                                              ; preds = %462, %447, %441
  %464 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %465 = fcmp contract ult float %464, %444
  br i1 %465, label %482, label %466

466:                                              ; preds = %463
  %467 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %468 = sitofp i32 %467 to float
  %469 = sitofp i32 %442 to float
  %470 = fsub contract float %468, %469
  %471 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %472 = sitofp i32 %471 to float
  %473 = sitofp i32 %443 to float
  %474 = fsub contract float %472, %473
  %475 = fmul contract float %474, %474
  %476 = fmul contract float %470, %470
  %477 = fadd contract float %476, %475
  %478 = fcmp contract olt float %477, %32
  %479 = fcmp contract une float %477, 0.000000e+00
  %480 = and i1 %478, %479
  br i1 %480, label %481, label %482

481:                                              ; preds = %466
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 7), align 4, !tbaa !5
  br label %482

482:                                              ; preds = %437, %481, %466, %463
  %483 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 8), align 16, !tbaa !5
  %484 = icmp eq i32 %483, 0
  %485 = select i1 %484, i1 true, i1 %81
  br i1 %485, label %527, label %486

486:                                              ; preds = %482
  %487 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !5
  %488 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5
  %489 = load float, float addrspace(1)* %85, align 4, !tbaa !9
  %490 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %491 = fcmp contract ult float %490, %489
  br i1 %491, label %508, label %492

492:                                              ; preds = %486
  %493 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %494 = sitofp i32 %493 to float
  %495 = sitofp i32 %487 to float
  %496 = fsub contract float %494, %495
  %497 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %498 = sitofp i32 %497 to float
  %499 = sitofp i32 %488 to float
  %500 = fsub contract float %498, %499
  %501 = fmul contract float %500, %500
  %502 = fmul contract float %496, %496
  %503 = fadd contract float %502, %501
  %504 = fcmp contract olt float %503, %32
  %505 = fcmp contract une float %503, 0.000000e+00
  %506 = and i1 %504, %505
  br i1 %506, label %507, label %508

507:                                              ; preds = %492
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 8), align 16, !tbaa !5
  br label %508

508:                                              ; preds = %507, %492, %486
  %509 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %510 = fcmp contract ult float %509, %489
  br i1 %510, label %527, label %511

511:                                              ; preds = %508
  %512 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %513 = sitofp i32 %512 to float
  %514 = sitofp i32 %487 to float
  %515 = fsub contract float %513, %514
  %516 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %517 = sitofp i32 %516 to float
  %518 = sitofp i32 %488 to float
  %519 = fsub contract float %517, %518
  %520 = fmul contract float %519, %519
  %521 = fmul contract float %515, %515
  %522 = fadd contract float %521, %520
  %523 = fcmp contract olt float %522, %32
  %524 = fcmp contract une float %522, 0.000000e+00
  %525 = and i1 %523, %524
  br i1 %525, label %526, label %527

526:                                              ; preds = %511
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 8), align 16, !tbaa !5
  br label %527

527:                                              ; preds = %482, %526, %511, %508
  %528 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 9), align 4, !tbaa !5
  %529 = icmp eq i32 %528, 0
  %530 = select i1 %529, i1 true, i1 %87
  br i1 %530, label %572, label %531

531:                                              ; preds = %527
  %532 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !5
  %533 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !5
  %534 = load float, float addrspace(1)* %91, align 4, !tbaa !9
  %535 = load float, float addrspace(3)* %25, align 4, !tbaa !9
  %536 = fcmp contract ult float %535, %534
  br i1 %536, label %553, label %537

537:                                              ; preds = %531
  %538 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %539 = sitofp i32 %538 to float
  %540 = sitofp i32 %532 to float
  %541 = fsub contract float %539, %540
  %542 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %543 = sitofp i32 %542 to float
  %544 = sitofp i32 %533 to float
  %545 = fsub contract float %543, %544
  %546 = fmul contract float %545, %545
  %547 = fmul contract float %541, %541
  %548 = fadd contract float %547, %546
  %549 = fcmp contract olt float %548, %32
  %550 = fcmp contract une float %548, 0.000000e+00
  %551 = and i1 %549, %550
  br i1 %551, label %552, label %553

552:                                              ; preds = %537
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 9), align 4, !tbaa !5
  br label %553

553:                                              ; preds = %552, %537, %531
  %554 = load float, float addrspace(3)* %29, align 4, !tbaa !9
  %555 = fcmp contract ult float %554, %534
  br i1 %555, label %572, label %556

556:                                              ; preds = %553
  %557 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %558 = sitofp i32 %557 to float
  %559 = sitofp i32 %532 to float
  %560 = fsub contract float %558, %559
  %561 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %562 = sitofp i32 %561 to float
  %563 = sitofp i32 %533 to float
  %564 = fsub contract float %562, %563
  %565 = fmul contract float %564, %564
  %566 = fmul contract float %560, %560
  %567 = fadd contract float %566, %565
  %568 = fcmp contract olt float %567, %32
  %569 = fcmp contract une float %567, 0.000000e+00
  %570 = and i1 %568, %569
  br i1 %570, label %571, label %572

571:                                              ; preds = %556
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ23gpu_Filter_peaks_kernelPjS_S_PfS_S_S_S0_jjiiPiE6s_flag, i32 0, i32 9), align 4, !tbaa !5
  br label %572

572:                                              ; preds = %527, %571, %556, %553
  %573 = add nuw nsw i32 %95, 1
  %574 = icmp eq i32 %573, %10
  br i1 %574, label %92, label %94, !llvm.loop !11

575:                                              ; preds = %92
  %576 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %577 = icmp eq i32 %576, 1
  br i1 %577, label %578, label %599

578:                                              ; preds = %575
  %579 = add i32 %93, %14
  %580 = icmp ult i32 %579, %8
  br i1 %580, label %581, label %599

581:                                              ; preds = %578
  %582 = atomicrmw add i32 addrspace(1)* %12, i32 1 syncscope("agent-one-as") monotonic, align 4
  %583 = icmp slt i32 %582, %11
  br i1 %583, label %584, label %599

584:                                              ; preds = %581
  %585 = zext i32 %579 to i64
  %586 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %585
  %587 = load i32, i32 addrspace(1)* %586, align 4, !tbaa !5
  %588 = sext i32 %582 to i64
  %589 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %588
  store i32 %587, i32 addrspace(1)* %589, align 4, !tbaa !5
  %590 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %585
  %591 = load i32, i32 addrspace(1)* %590, align 4, !tbaa !5
  %592 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %588
  store i32 %591, i32 addrspace(1)* %592, align 4, !tbaa !5
  %593 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %585
  %594 = load i32, i32 addrspace(1)* %593, align 4, !tbaa !5
  %595 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %588
  store i32 %594, i32 addrspace(1)* %595, align 4, !tbaa !5
  %596 = getelementptr inbounds float, float addrspace(1)* %7, i64 %585
  %597 = load float, float addrspace(1)* %596, align 4, !tbaa !9
  %598 = getelementptr inbounds float, float addrspace(1)* %3, i64 %588
  store float %597, float addrspace(1)* %598, align 4, !tbaa !9
  br label %599

599:                                              ; preds = %581, %584, %575, %578, %92
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
