; ModuleID = '../data/hip_kernels/16910/22/main.cu'
source_filename = "../data/hip_kernels/16910/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA = internal addrspace(3) global [243 x float] undef, align 16
@_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW = internal addrspace(3) global [243 x float] undef, align 16
@_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sU = internal addrspace(3) global [96 x float] undef, align 16
@_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2iU = internal addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_Pf(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readnone %8, i32 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture writeonly %12) local_unnamed_addr #0 {
  %14 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !4, !amdgpu.noclobber !8
  %18 = fptosi double %17 to i32
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !4, !amdgpu.noclobber !8
  %21 = fptosi double %20 to i32
  %22 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !4, !amdgpu.noclobber !8
  %24 = fptosi double %23 to i32
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !4, !amdgpu.noclobber !8
  %27 = fptosi double %26 to i32
  %28 = getelementptr inbounds double, double addrspace(1)* %0, i64 10
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !4, !amdgpu.noclobber !8
  %30 = fptosi double %29 to i32
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %32 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %34 = icmp eq i32 %32, 0
  br i1 %34, label %35, label %46

35:                                               ; preds = %13
  %36 = sext i32 %33 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !10, !amdgpu.noclobber !8
  %39 = mul nsw i32 %38, %30
  %40 = add nsw i32 %39, %31
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !10, !amdgpu.noclobber !8
  %44 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2iU, i32 0, i32 %31
  %45 = addrspacecast i32 addrspace(3)* %44 to i32*
  store volatile i32 %43, i32* %45, align 4, !tbaa !10
  br label %46

46:                                               ; preds = %13, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2iU, i32 0, i32 %31
  %48 = addrspacecast i32 addrspace(3)* %47 to i32*
  %49 = load volatile i32, i32* %48, align 4, !tbaa !10
  %50 = mul i32 %32, %24
  %51 = add i32 %50, %33
  %52 = mul i32 %51, %21
  %53 = add i32 %49, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %7, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !12, !amdgpu.noclobber !8
  %57 = mul nsw i32 %32, %30
  %58 = add nsw i32 %57, %31
  %59 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sU, i32 0, i32 %58
  %60 = addrspacecast float addrspace(3)* %59 to float*
  store volatile float %56, float* %60, align 4, !tbaa !12
  %61 = icmp slt i32 %31, %18
  br i1 %61, label %62, label %86

62:                                               ; preds = %46
  %63 = mul i32 %51, %18
  %64 = mul nsw i32 %32, %18
  %65 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %66 = getelementptr i8, i8 addrspace(4)* %65, i64 4
  %67 = bitcast i8 addrspace(4)* %66 to i16 addrspace(4)*
  br label %68

68:                                               ; preds = %62, %68
  %69 = phi i32 [ %31, %62 ], [ %84, %68 ]
  %70 = add i32 %69, %63
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %6, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !12, !amdgpu.noclobber !8
  %74 = add nsw i32 %69, %64
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %74
  %77 = addrspacecast float addrspace(3)* %76 to float*
  store volatile float %73, float* %77, align 4, !tbaa !12
  %78 = getelementptr inbounds float, float addrspace(1)* %11, i64 %75
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !12, !amdgpu.noclobber !8
  %80 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %74
  %81 = addrspacecast float addrspace(3)* %80 to float*
  store volatile float %79, float* %81, align 4, !tbaa !12
  %82 = load i16, i16 addrspace(4)* %67, align 4, !range !14, !invariant.load !8
  %83 = zext i16 %82 to i32
  %84 = add i32 %69, %83
  %85 = icmp slt i32 %84, %18
  br i1 %85, label %68, label %86, !llvm.loop !15

86:                                               ; preds = %68, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = icmp sgt i32 %27, 0
  br i1 %87, label %88, label %100

88:                                               ; preds = %86
  %89 = icmp sgt i32 %18, 0
  %90 = mul nsw i32 %32, %18
  %91 = and i32 %18, 7
  %92 = icmp ult i32 %18, 8
  %93 = and i32 %18, -8
  %94 = icmp eq i32 %91, 0
  br label %95

95:                                               ; preds = %88, %227
  %96 = phi float [ 0.000000e+00, %88 ], [ %235, %227 ]
  %97 = phi i32 [ 0, %88 ], [ %236, %227 ]
  br i1 %89, label %98, label %227

98:                                               ; preds = %95
  %99 = mul nsw i32 %97, %18
  br i1 %92, label %206, label %112

100:                                              ; preds = %227, %86
  %101 = phi float [ 0.000000e+00, %86 ], [ %235, %227 ]
  %102 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !10, !amdgpu.noclobber !8
  %103 = icmp sgt i32 %102, 0
  br i1 %103, label %104, label %402

104:                                              ; preds = %100
  %105 = icmp sgt i32 %18, 0
  %106 = mul nsw i32 %32, %18
  %107 = mul i32 %30, %27
  %108 = and i32 %18, 7
  %109 = icmp ult i32 %18, 8
  %110 = and i32 %18, -8
  %111 = icmp eq i32 %108, 0
  br label %238

112:                                              ; preds = %98, %112
  %113 = phi float [ %202, %112 ], [ 0.000000e+00, %98 ]
  %114 = phi i32 [ %203, %112 ], [ 0, %98 ]
  %115 = phi i32 [ %204, %112 ], [ 0, %98 ]
  %116 = add nsw i32 %114, %99
  %117 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %116
  %118 = addrspacecast float addrspace(3)* %117 to float*
  %119 = load volatile float, float* %118, align 4, !tbaa !12
  %120 = add nsw i32 %114, %90
  %121 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %120
  %122 = addrspacecast float addrspace(3)* %121 to float*
  %123 = load volatile float, float* %122, align 4, !tbaa !12
  %124 = fmul contract float %119, %123
  %125 = fadd contract float %113, %124
  %126 = or i32 %114, 1
  %127 = add nsw i32 %126, %99
  %128 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %127
  %129 = addrspacecast float addrspace(3)* %128 to float*
  %130 = load volatile float, float* %129, align 4, !tbaa !12
  %131 = add nsw i32 %126, %90
  %132 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %131
  %133 = addrspacecast float addrspace(3)* %132 to float*
  %134 = load volatile float, float* %133, align 4, !tbaa !12
  %135 = fmul contract float %130, %134
  %136 = fadd contract float %125, %135
  %137 = or i32 %114, 2
  %138 = add nsw i32 %137, %99
  %139 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %138
  %140 = addrspacecast float addrspace(3)* %139 to float*
  %141 = load volatile float, float* %140, align 4, !tbaa !12
  %142 = add nsw i32 %137, %90
  %143 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %142
  %144 = addrspacecast float addrspace(3)* %143 to float*
  %145 = load volatile float, float* %144, align 4, !tbaa !12
  %146 = fmul contract float %141, %145
  %147 = fadd contract float %136, %146
  %148 = or i32 %114, 3
  %149 = add nsw i32 %148, %99
  %150 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %149
  %151 = addrspacecast float addrspace(3)* %150 to float*
  %152 = load volatile float, float* %151, align 4, !tbaa !12
  %153 = add nsw i32 %148, %90
  %154 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %153
  %155 = addrspacecast float addrspace(3)* %154 to float*
  %156 = load volatile float, float* %155, align 4, !tbaa !12
  %157 = fmul contract float %152, %156
  %158 = fadd contract float %147, %157
  %159 = or i32 %114, 4
  %160 = add nsw i32 %159, %99
  %161 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %160
  %162 = addrspacecast float addrspace(3)* %161 to float*
  %163 = load volatile float, float* %162, align 4, !tbaa !12
  %164 = add nsw i32 %159, %90
  %165 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %164
  %166 = addrspacecast float addrspace(3)* %165 to float*
  %167 = load volatile float, float* %166, align 4, !tbaa !12
  %168 = fmul contract float %163, %167
  %169 = fadd contract float %158, %168
  %170 = or i32 %114, 5
  %171 = add nsw i32 %170, %99
  %172 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %171
  %173 = addrspacecast float addrspace(3)* %172 to float*
  %174 = load volatile float, float* %173, align 4, !tbaa !12
  %175 = add nsw i32 %170, %90
  %176 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %175
  %177 = addrspacecast float addrspace(3)* %176 to float*
  %178 = load volatile float, float* %177, align 4, !tbaa !12
  %179 = fmul contract float %174, %178
  %180 = fadd contract float %169, %179
  %181 = or i32 %114, 6
  %182 = add nsw i32 %181, %99
  %183 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %182
  %184 = addrspacecast float addrspace(3)* %183 to float*
  %185 = load volatile float, float* %184, align 4, !tbaa !12
  %186 = add nsw i32 %181, %90
  %187 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %186
  %188 = addrspacecast float addrspace(3)* %187 to float*
  %189 = load volatile float, float* %188, align 4, !tbaa !12
  %190 = fmul contract float %185, %189
  %191 = fadd contract float %180, %190
  %192 = or i32 %114, 7
  %193 = add nsw i32 %192, %99
  %194 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %193
  %195 = addrspacecast float addrspace(3)* %194 to float*
  %196 = load volatile float, float* %195, align 4, !tbaa !12
  %197 = add nsw i32 %192, %90
  %198 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %197
  %199 = addrspacecast float addrspace(3)* %198 to float*
  %200 = load volatile float, float* %199, align 4, !tbaa !12
  %201 = fmul contract float %196, %200
  %202 = fadd contract float %191, %201
  %203 = add nuw nsw i32 %114, 8
  %204 = add i32 %115, 8
  %205 = icmp eq i32 %204, %93
  br i1 %205, label %206, label %112, !llvm.loop !17

206:                                              ; preds = %112, %98
  %207 = phi float [ undef, %98 ], [ %202, %112 ]
  %208 = phi float [ 0.000000e+00, %98 ], [ %202, %112 ]
  %209 = phi i32 [ 0, %98 ], [ %203, %112 ]
  br i1 %94, label %227, label %210

210:                                              ; preds = %206, %210
  %211 = phi float [ %223, %210 ], [ %208, %206 ]
  %212 = phi i32 [ %224, %210 ], [ %209, %206 ]
  %213 = phi i32 [ %225, %210 ], [ 0, %206 ]
  %214 = add nsw i32 %212, %99
  %215 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sW, i32 0, i32 %214
  %216 = addrspacecast float addrspace(3)* %215 to float*
  %217 = load volatile float, float* %216, align 4, !tbaa !12
  %218 = add nsw i32 %212, %90
  %219 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %218
  %220 = addrspacecast float addrspace(3)* %219 to float*
  %221 = load volatile float, float* %220, align 4, !tbaa !12
  %222 = fmul contract float %217, %221
  %223 = fadd contract float %211, %222
  %224 = add nuw nsw i32 %212, 1
  %225 = add i32 %213, 1
  %226 = icmp eq i32 %225, %91
  br i1 %226, label %227, label %210, !llvm.loop !18

227:                                              ; preds = %206, %210, %95
  %228 = phi float [ 0.000000e+00, %95 ], [ %207, %206 ], [ %223, %210 ]
  %229 = mul nsw i32 %97, %30
  %230 = add nsw i32 %229, %31
  %231 = getelementptr inbounds [96 x float], [96 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE2sU, i32 0, i32 %230
  %232 = addrspacecast float addrspace(3)* %231 to float*
  %233 = load volatile float, float* %232, align 4, !tbaa !12
  %234 = fmul contract float %228, %233
  %235 = fadd contract float %96, %234
  %236 = add nuw nsw i32 %97, 1
  %237 = icmp eq i32 %236, %27
  br i1 %237, label %100, label %95, !llvm.loop !20

238:                                              ; preds = %104, %399
  %239 = phi i32 [ 0, %104 ], [ %400, %399 ]
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %240
  %242 = load i32, i32 addrspace(1)* %241, align 4, !tbaa !10, !amdgpu.noclobber !8
  %243 = icmp eq i32 %242, %33
  br i1 %243, label %244, label %399

244:                                              ; preds = %238
  %245 = getelementptr inbounds float, float addrspace(1)* %5, i64 %240
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !12
  %247 = fmul contract float %101, %246
  br i1 %105, label %248, label %393

248:                                              ; preds = %244
  %249 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %240
  %250 = load i32, i32 addrspace(1)* %249, align 4, !tbaa !10, !amdgpu.noclobber !8
  br i1 %109, label %369, label %251

251:                                              ; preds = %248, %251
  %252 = phi float [ %365, %251 ], [ %247, %248 ]
  %253 = phi i32 [ %366, %251 ], [ 0, %248 ]
  %254 = phi i32 [ %367, %251 ], [ 0, %248 ]
  %255 = add nsw i32 %250, %253
  %256 = load volatile i32, i32* %48, align 4, !tbaa !10
  %257 = mul nsw i32 %256, %15
  %258 = add nsw i32 %255, %257
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %2, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !12
  %262 = add nsw i32 %253, %106
  %263 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %262
  %264 = addrspacecast float addrspace(3)* %263 to float*
  %265 = load volatile float, float* %264, align 4, !tbaa !12
  %266 = fmul contract float %261, %265
  %267 = fadd contract float %252, %266
  %268 = or i32 %253, 1
  %269 = add nsw i32 %250, %268
  %270 = load volatile i32, i32* %48, align 4, !tbaa !10
  %271 = mul nsw i32 %270, %15
  %272 = add nsw i32 %269, %271
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %2, i64 %273
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !12
  %276 = add nsw i32 %268, %106
  %277 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %276
  %278 = addrspacecast float addrspace(3)* %277 to float*
  %279 = load volatile float, float* %278, align 4, !tbaa !12
  %280 = fmul contract float %275, %279
  %281 = fadd contract float %267, %280
  %282 = or i32 %253, 2
  %283 = add nsw i32 %250, %282
  %284 = load volatile i32, i32* %48, align 4, !tbaa !10
  %285 = mul nsw i32 %284, %15
  %286 = add nsw i32 %283, %285
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds float, float addrspace(1)* %2, i64 %287
  %289 = load float, float addrspace(1)* %288, align 4, !tbaa !12
  %290 = add nsw i32 %282, %106
  %291 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %290
  %292 = addrspacecast float addrspace(3)* %291 to float*
  %293 = load volatile float, float* %292, align 4, !tbaa !12
  %294 = fmul contract float %289, %293
  %295 = fadd contract float %281, %294
  %296 = or i32 %253, 3
  %297 = add nsw i32 %250, %296
  %298 = load volatile i32, i32* %48, align 4, !tbaa !10
  %299 = mul nsw i32 %298, %15
  %300 = add nsw i32 %297, %299
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds float, float addrspace(1)* %2, i64 %301
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !12
  %304 = add nsw i32 %296, %106
  %305 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %304
  %306 = addrspacecast float addrspace(3)* %305 to float*
  %307 = load volatile float, float* %306, align 4, !tbaa !12
  %308 = fmul contract float %303, %307
  %309 = fadd contract float %295, %308
  %310 = or i32 %253, 4
  %311 = add nsw i32 %250, %310
  %312 = load volatile i32, i32* %48, align 4, !tbaa !10
  %313 = mul nsw i32 %312, %15
  %314 = add nsw i32 %311, %313
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds float, float addrspace(1)* %2, i64 %315
  %317 = load float, float addrspace(1)* %316, align 4, !tbaa !12
  %318 = add nsw i32 %310, %106
  %319 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %318
  %320 = addrspacecast float addrspace(3)* %319 to float*
  %321 = load volatile float, float* %320, align 4, !tbaa !12
  %322 = fmul contract float %317, %321
  %323 = fadd contract float %309, %322
  %324 = or i32 %253, 5
  %325 = add nsw i32 %250, %324
  %326 = load volatile i32, i32* %48, align 4, !tbaa !10
  %327 = mul nsw i32 %326, %15
  %328 = add nsw i32 %325, %327
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds float, float addrspace(1)* %2, i64 %329
  %331 = load float, float addrspace(1)* %330, align 4, !tbaa !12
  %332 = add nsw i32 %324, %106
  %333 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %332
  %334 = addrspacecast float addrspace(3)* %333 to float*
  %335 = load volatile float, float* %334, align 4, !tbaa !12
  %336 = fmul contract float %331, %335
  %337 = fadd contract float %323, %336
  %338 = or i32 %253, 6
  %339 = add nsw i32 %250, %338
  %340 = load volatile i32, i32* %48, align 4, !tbaa !10
  %341 = mul nsw i32 %340, %15
  %342 = add nsw i32 %339, %341
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds float, float addrspace(1)* %2, i64 %343
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !12
  %346 = add nsw i32 %338, %106
  %347 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %346
  %348 = addrspacecast float addrspace(3)* %347 to float*
  %349 = load volatile float, float* %348, align 4, !tbaa !12
  %350 = fmul contract float %345, %349
  %351 = fadd contract float %337, %350
  %352 = or i32 %253, 7
  %353 = add nsw i32 %250, %352
  %354 = load volatile i32, i32* %48, align 4, !tbaa !10
  %355 = mul nsw i32 %354, %15
  %356 = add nsw i32 %353, %355
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds float, float addrspace(1)* %2, i64 %357
  %359 = load float, float addrspace(1)* %358, align 4, !tbaa !12
  %360 = add nsw i32 %352, %106
  %361 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %360
  %362 = addrspacecast float addrspace(3)* %361 to float*
  %363 = load volatile float, float* %362, align 4, !tbaa !12
  %364 = fmul contract float %359, %363
  %365 = fadd contract float %351, %364
  %366 = add nuw nsw i32 %253, 8
  %367 = add i32 %254, 8
  %368 = icmp eq i32 %367, %110
  br i1 %368, label %369, label %251, !llvm.loop !21

369:                                              ; preds = %251, %248
  %370 = phi float [ undef, %248 ], [ %365, %251 ]
  %371 = phi float [ %247, %248 ], [ %365, %251 ]
  %372 = phi i32 [ 0, %248 ], [ %366, %251 ]
  br i1 %111, label %393, label %373

373:                                              ; preds = %369, %373
  %374 = phi float [ %389, %373 ], [ %371, %369 ]
  %375 = phi i32 [ %390, %373 ], [ %372, %369 ]
  %376 = phi i32 [ %391, %373 ], [ 0, %369 ]
  %377 = add nsw i32 %250, %375
  %378 = load volatile i32, i32* %48, align 4, !tbaa !10
  %379 = mul nsw i32 %378, %15
  %380 = add nsw i32 %377, %379
  %381 = sext i32 %380 to i64
  %382 = getelementptr inbounds float, float addrspace(1)* %2, i64 %381
  %383 = load float, float addrspace(1)* %382, align 4, !tbaa !12
  %384 = add nsw i32 %375, %106
  %385 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ17computePCfeaturesPKdPKiPKfS2_S2_S4_S4_S4_S4_S2_S2_S4_PfE4sPCA, i32 0, i32 %384
  %386 = addrspacecast float addrspace(3)* %385 to float*
  %387 = load volatile float, float* %386, align 4, !tbaa !12
  %388 = fmul contract float %383, %387
  %389 = fadd contract float %374, %388
  %390 = add nuw nsw i32 %375, 1
  %391 = add i32 %376, 1
  %392 = icmp eq i32 %391, %108
  br i1 %392, label %393, label %373, !llvm.loop !22

393:                                              ; preds = %369, %373, %244
  %394 = phi float [ %247, %244 ], [ %370, %369 ], [ %389, %373 ]
  %395 = mul i32 %107, %239
  %396 = add nsw i32 %395, %58
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds float, float addrspace(1)* %12, i64 %397
  store float %394, float addrspace(1)* %398, align 4, !tbaa !12
  br label %399

399:                                              ; preds = %238, %393
  %400 = add nuw nsw i32 %239, 1
  %401 = icmp eq i32 %400, %102
  br i1 %401, label %402, label %238, !llvm.loop !23

402:                                              ; preds = %399, %100
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !6, i64 0}
!14 = !{i16 1, i16 1025}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.unroll.disable"}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !16}
!22 = distinct !{!22, !19}
!23 = distinct !{!23, !16}
