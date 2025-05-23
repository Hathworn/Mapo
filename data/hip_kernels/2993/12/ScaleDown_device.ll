; ModuleID = '../data/hip_kernels/2993/12/main.cu'
source_filename = "../data/hip_kernels/2993/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_ScaleDownKernel = protected addrspace(4) externally_initialized global [5 x float] zeroinitializer, align 16
@_ZZ9ScaleDownPfS_iiiiE5inrow = internal unnamed_addr addrspace(3) global [64 x float] undef, align 16
@_ZZ9ScaleDownPfS_iiiiE4brow = internal unnamed_addr addrspace(3) global [150 x float] undef, align 16
@_ZZ9ScaleDownPfS_iiiiE5yRead = internal unnamed_addr addrspace(3) global [12 x i32] undef, align 16
@_ZZ9ScaleDownPfS_iiiiE6yWrite = internal unnamed_addr addrspace(3) global [12 x i32] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([5 x float] addrspace(4)* @d_ScaleDownKernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9ScaleDownPfS_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add nuw nsw i32 %7, 30
  %9 = add nuw nsw i32 %7, 60
  %10 = add nuw nsw i32 %7, 90
  %11 = add nuw nsw i32 %7, 120
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, 60
  %14 = ashr exact i32 %13, 1
  %15 = add nsw i32 %14, %7
  %16 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @d_ScaleDownKernel, i64 0, i64 0), align 16, !tbaa !5
  %17 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @d_ScaleDownKernel, i64 0, i64 1), align 4, !tbaa !5
  %18 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @d_ScaleDownKernel, i64 0, i64 2), align 8, !tbaa !5
  %19 = icmp ult i32 %7, 12
  br i1 %19, label %20, label %35

20:                                               ; preds = %6
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = shl i32 %21, 3
  %23 = add nsw i32 %22, %7
  %24 = tail call i32 @llvm.smax.i32(i32 %23, i32 2)
  %25 = add nsw i32 %24, -2
  %26 = icmp slt i32 %25, %4
  %27 = add nsw i32 %4, -1
  %28 = select i1 %26, i32 %25, i32 %27
  %29 = mul nsw i32 %28, %3
  %30 = getelementptr inbounds [12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 %7
  store i32 %29, i32 addrspace(3)* %30, align 4, !tbaa !9
  %31 = add nsw i32 %23, -4
  %32 = sdiv i32 %31, 2
  %33 = mul nsw i32 %32, %5
  %34 = getelementptr inbounds [12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE6yWrite, i32 0, i32 %7
  store i32 %33, i32 addrspace(3)* %34, align 4, !tbaa !9
  br label %35

35:                                               ; preds = %20, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = add nsw i32 %13, %7
  %37 = tail call i32 @llvm.smax.i32(i32 %36, i32 2)
  %38 = add nsw i32 %37, -2
  %39 = icmp slt i32 %38, %2
  %40 = add nsw i32 %2, -1
  %41 = select i1 %39, i32 %38, i32 %40
  %42 = sdiv i32 %2, 2
  %43 = sub nsw i32 %42, %14
  %44 = tail call i32 @llvm.smin.i32(i32 %43, i32 30)
  %45 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5inrow, i32 0, i32 %7
  %46 = icmp slt i32 %7, %44
  %47 = shl nuw nsw i32 %7, 1
  %48 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5inrow, i32 0, i32 %47
  %49 = add nuw nsw i32 %47, 4
  %50 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5inrow, i32 0, i32 %49
  %51 = add nuw nsw i32 %47, 1
  %52 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5inrow, i32 0, i32 %51
  %53 = add nuw nsw i32 %47, 3
  %54 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5inrow, i32 0, i32 %53
  %55 = add nuw nsw i32 %47, 2
  %56 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5inrow, i32 0, i32 %55
  %57 = getelementptr inbounds [150 x float], [150 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE4brow, i32 0, i32 %11
  %58 = getelementptr inbounds [150 x float], [150 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE4brow, i32 0, i32 %9
  %59 = getelementptr inbounds [150 x float], [150 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE4brow, i32 0, i32 %7
  %60 = getelementptr inbounds [150 x float], [150 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE4brow, i32 0, i32 %8
  %61 = getelementptr inbounds [150 x float], [150 x float] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE4brow, i32 0, i32 %10
  %62 = icmp ult i32 %7, 30
  %63 = icmp slt i32 %15, %42
  %64 = select i1 %62, i1 %63, i1 false
  %65 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 0), align 16, !tbaa !9
  %66 = add nsw i32 %65, %41
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5
  store float %69, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %70, label %83

70:                                               ; preds = %35
  %71 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %72 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %73 = fadd contract float %71, %72
  %74 = fmul contract float %16, %73
  %75 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %76 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %77 = fadd contract float %75, %76
  %78 = fmul contract float %17, %77
  %79 = fadd contract float %74, %78
  %80 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %81 = fmul contract float %18, %80
  %82 = fadd contract float %81, %79
  store float %82, float addrspace(3)* %57, align 4, !tbaa !5
  br label %83

83:                                               ; preds = %70, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 1), align 4, !tbaa !9
  %85 = add nsw i32 %84, %41
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  store float %88, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %89, label %102

89:                                               ; preds = %83
  %90 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %91 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %92 = fadd contract float %90, %91
  %93 = fmul contract float %16, %92
  %94 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %95 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %96 = fadd contract float %94, %95
  %97 = fmul contract float %17, %96
  %98 = fadd contract float %93, %97
  %99 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %100 = fmul contract float %18, %99
  %101 = fadd contract float %100, %98
  store float %101, float addrspace(3)* %59, align 4, !tbaa !5
  br label %102

102:                                              ; preds = %89, %83
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 2), align 8, !tbaa !9
  %104 = add nsw i32 %103, %41
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5
  store float %107, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %108, label %121

108:                                              ; preds = %102
  %109 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %110 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %111 = fadd contract float %109, %110
  %112 = fmul contract float %16, %111
  %113 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %114 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %115 = fadd contract float %113, %114
  %116 = fmul contract float %17, %115
  %117 = fadd contract float %112, %116
  %118 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %119 = fmul contract float %18, %118
  %120 = fadd contract float %119, %117
  store float %120, float addrspace(3)* %60, align 4, !tbaa !5
  br label %121

121:                                              ; preds = %108, %102
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %122 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 3), align 4, !tbaa !9
  %123 = add nsw i32 %122, %41
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5
  store float %126, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %127, label %140

127:                                              ; preds = %121
  %128 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %129 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %130 = fadd contract float %128, %129
  %131 = fmul contract float %16, %130
  %132 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %133 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %134 = fadd contract float %132, %133
  %135 = fmul contract float %17, %134
  %136 = fadd contract float %131, %135
  %137 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %138 = fmul contract float %18, %137
  %139 = fadd contract float %138, %136
  store float %139, float addrspace(3)* %58, align 4, !tbaa !5
  br label %140

140:                                              ; preds = %127, %121
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %141 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 4), align 16, !tbaa !9
  %142 = add nsw i32 %141, %41
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !5
  store float %145, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %64, label %146, label %174

146:                                              ; preds = %140
  %147 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %148 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %149 = fadd contract float %147, %148
  %150 = fmul contract float %16, %149
  %151 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %152 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %153 = fadd contract float %151, %152
  %154 = fmul contract float %17, %153
  %155 = fadd contract float %150, %154
  %156 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %157 = fmul contract float %18, %156
  %158 = fadd contract float %157, %155
  store float %158, float addrspace(3)* %61, align 4, !tbaa !5
  %159 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %160 = fmul contract float %18, %159
  %161 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %162 = fadd contract float %158, %161
  %163 = fmul contract float %16, %162
  %164 = fadd contract float %160, %163
  %165 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %166 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %167 = fadd contract float %165, %166
  %168 = fmul contract float %17, %167
  %169 = fadd contract float %164, %168
  %170 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE6yWrite, i32 0, i32 4), align 16, !tbaa !9
  %171 = add nsw i32 %170, %15
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  store float %169, float addrspace(1)* %173, align 4, !tbaa !5
  br label %174

174:                                              ; preds = %146, %140
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %175 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 5), align 4, !tbaa !9
  %176 = add nsw i32 %175, %41
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !5
  store float %179, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %180, label %193

180:                                              ; preds = %174
  %181 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %182 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %183 = fadd contract float %181, %182
  %184 = fmul contract float %16, %183
  %185 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %186 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %187 = fadd contract float %185, %186
  %188 = fmul contract float %17, %187
  %189 = fadd contract float %184, %188
  %190 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %191 = fmul contract float %18, %190
  %192 = fadd contract float %191, %189
  store float %192, float addrspace(3)* %57, align 4, !tbaa !5
  br label %193

193:                                              ; preds = %180, %174
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %194 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 6), align 8, !tbaa !9
  %195 = add nsw i32 %194, %41
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %1, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !5
  store float %198, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %199, label %227

199:                                              ; preds = %193
  %200 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %201 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %202 = fadd contract float %200, %201
  %203 = fmul contract float %16, %202
  %204 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %205 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %206 = fadd contract float %204, %205
  %207 = fmul contract float %17, %206
  %208 = fadd contract float %203, %207
  %209 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %210 = fmul contract float %18, %209
  %211 = fadd contract float %210, %208
  store float %211, float addrspace(3)* %59, align 4, !tbaa !5
  %212 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %213 = fmul contract float %18, %212
  %214 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %215 = fadd contract float %211, %214
  %216 = fmul contract float %16, %215
  %217 = fadd contract float %213, %216
  %218 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %219 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %220 = fadd contract float %218, %219
  %221 = fmul contract float %17, %220
  %222 = fadd contract float %217, %221
  %223 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE6yWrite, i32 0, i32 6), align 8, !tbaa !9
  %224 = add nsw i32 %223, %15
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %0, i64 %225
  store float %222, float addrspace(1)* %226, align 4, !tbaa !5
  br label %227

227:                                              ; preds = %199, %193
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %228 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 7), align 4, !tbaa !9
  %229 = add nsw i32 %228, %41
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %1, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !5
  store float %232, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %233, label %246

233:                                              ; preds = %227
  %234 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %235 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %236 = fadd contract float %234, %235
  %237 = fmul contract float %16, %236
  %238 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %239 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %240 = fadd contract float %238, %239
  %241 = fmul contract float %17, %240
  %242 = fadd contract float %237, %241
  %243 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %244 = fmul contract float %18, %243
  %245 = fadd contract float %244, %242
  store float %245, float addrspace(3)* %60, align 4, !tbaa !5
  br label %246

246:                                              ; preds = %233, %227
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %247 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 8), align 16, !tbaa !9
  %248 = add nsw i32 %247, %41
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %1, i64 %249
  %251 = load float, float addrspace(1)* %250, align 4, !tbaa !5
  store float %251, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %252, label %280

252:                                              ; preds = %246
  %253 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %254 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %255 = fadd contract float %253, %254
  %256 = fmul contract float %16, %255
  %257 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %258 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %259 = fadd contract float %257, %258
  %260 = fmul contract float %17, %259
  %261 = fadd contract float %256, %260
  %262 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %263 = fmul contract float %18, %262
  %264 = fadd contract float %263, %261
  store float %264, float addrspace(3)* %58, align 4, !tbaa !5
  %265 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %266 = fmul contract float %18, %265
  %267 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %268 = fadd contract float %264, %267
  %269 = fmul contract float %16, %268
  %270 = fadd contract float %266, %269
  %271 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %272 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %273 = fadd contract float %271, %272
  %274 = fmul contract float %17, %273
  %275 = fadd contract float %270, %274
  %276 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE6yWrite, i32 0, i32 8), align 16, !tbaa !9
  %277 = add nsw i32 %276, %15
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %0, i64 %278
  store float %275, float addrspace(1)* %279, align 4, !tbaa !5
  br label %280

280:                                              ; preds = %252, %246
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %281 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 9), align 4, !tbaa !9
  %282 = add nsw i32 %281, %41
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %1, i64 %283
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !5
  store float %285, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %64, label %286, label %299

286:                                              ; preds = %280
  %287 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %288 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %289 = fadd contract float %287, %288
  %290 = fmul contract float %16, %289
  %291 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %292 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %293 = fadd contract float %291, %292
  %294 = fmul contract float %17, %293
  %295 = fadd contract float %290, %294
  %296 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %297 = fmul contract float %18, %296
  %298 = fadd contract float %297, %295
  store float %298, float addrspace(3)* %61, align 4, !tbaa !5
  br label %299

299:                                              ; preds = %286, %280
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %300 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 10), align 8, !tbaa !9
  %301 = add nsw i32 %300, %41
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %1, i64 %302
  %304 = load float, float addrspace(1)* %303, align 4, !tbaa !5
  store float %304, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %305, label %333

305:                                              ; preds = %299
  %306 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %307 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %308 = fadd contract float %306, %307
  %309 = fmul contract float %16, %308
  %310 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %311 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %312 = fadd contract float %310, %311
  %313 = fmul contract float %17, %312
  %314 = fadd contract float %309, %313
  %315 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %316 = fmul contract float %18, %315
  %317 = fadd contract float %316, %314
  store float %317, float addrspace(3)* %57, align 4, !tbaa !5
  %318 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %319 = fmul contract float %18, %318
  %320 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %321 = fadd contract float %317, %320
  %322 = fmul contract float %16, %321
  %323 = fadd contract float %319, %322
  %324 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %325 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %326 = fadd contract float %324, %325
  %327 = fmul contract float %17, %326
  %328 = fadd contract float %323, %327
  %329 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE6yWrite, i32 0, i32 10), align 8, !tbaa !9
  %330 = add nsw i32 %329, %15
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds float, float addrspace(1)* %0, i64 %331
  store float %328, float addrspace(1)* %332, align 4, !tbaa !5
  br label %333

333:                                              ; preds = %305, %299
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %334 = load i32, i32 addrspace(3)* getelementptr inbounds ([12 x i32], [12 x i32] addrspace(3)* @_ZZ9ScaleDownPfS_iiiiE5yRead, i32 0, i32 11), align 4, !tbaa !9
  %335 = add nsw i32 %334, %41
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %1, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !5
  store float %338, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %339, label %352

339:                                              ; preds = %333
  %340 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %341 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %342 = fadd contract float %340, %341
  %343 = fmul contract float %16, %342
  %344 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %345 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %346 = fadd contract float %344, %345
  %347 = fmul contract float %17, %346
  %348 = fadd contract float %343, %347
  %349 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %350 = fmul contract float %18, %349
  %351 = fadd contract float %350, %348
  store float %351, float addrspace(3)* %59, align 4, !tbaa !5
  br label %352

352:                                              ; preds = %339, %333
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
