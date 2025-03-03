; ModuleID = '../data/hip_kernels/240/11/main.cu'
source_filename = "../data/hip_kernels/240/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer = internal unnamed_addr addrspace(3) global [129 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, i32 %10, float %11, float %12, float %13, float %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = mul i32 %17, %10
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %7, i64 %19
  %21 = getelementptr inbounds float, float addrspace(1)* %6, i64 %19
  %22 = mul i32 %17, %8
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %4, i64 %23
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %26 = zext i32 %17 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %16
  store float 0.000000e+00, float addrspace(3)* %29, align 4, !tbaa !5
  %30 = icmp ult i32 %16, %10
  br i1 %30, label %31, label %38

31:                                               ; preds = %15
  %32 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %33 = getelementptr i8, i8 addrspace(4)* %32, i64 4
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4, !range !10, !invariant.load !9
  %36 = zext i16 %35 to i32
  br label %40

37:                                               ; preds = %40
  store float %53, float addrspace(3)* %29, align 4, !tbaa !5
  br label %38

38:                                               ; preds = %37, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ult i32 %16, 64
  br i1 %39, label %56, label %62

40:                                               ; preds = %31, %40
  %41 = phi float [ 0.000000e+00, %31 ], [ %53, %40 ]
  %42 = phi i32 [ %16, %31 ], [ %54, %40 ]
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %20, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = getelementptr inbounds float, float addrspace(1)* %21, i64 %43
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = fmul contract float %45, %47
  %49 = add nuw i32 %42, 1
  %50 = uitofp i32 %49 to float
  %51 = fsub contract float %50, %28
  %52 = fmul contract float %51, %48
  %53 = fadd contract float %41, %52
  %54 = add i32 %42, %36
  %55 = icmp ult i32 %54, %10
  br i1 %55, label %40, label %37, !llvm.loop !11

56:                                               ; preds = %38
  %57 = add nuw nsw i32 %16, 64
  %58 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %57
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %60 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %61 = fadd contract float %59, %60
  store float %61, float addrspace(3)* %29, align 4, !tbaa !5
  br label %62

62:                                               ; preds = %38, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ult i32 %16, 32
  br i1 %63, label %64, label %70

64:                                               ; preds = %62
  %65 = add nuw nsw i32 %16, 32
  %66 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %65
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %68 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %69 = fadd contract float %67, %68
  store float %69, float addrspace(3)* %29, align 4, !tbaa !5
  br label %70

70:                                               ; preds = %64, %62
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = icmp ult i32 %16, 16
  br i1 %71, label %72, label %78

72:                                               ; preds = %70
  %73 = add nuw nsw i32 %16, 16
  %74 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %76 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %77 = fadd contract float %75, %76
  store float %77, float addrspace(3)* %29, align 4, !tbaa !5
  br label %78

78:                                               ; preds = %72, %70
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = icmp ult i32 %16, 8
  br i1 %79, label %80, label %86

80:                                               ; preds = %78
  %81 = add nuw nsw i32 %16, 8
  %82 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %81
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %84 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %85 = fadd contract float %83, %84
  store float %85, float addrspace(3)* %29, align 4, !tbaa !5
  br label %86

86:                                               ; preds = %80, %78
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = icmp ult i32 %16, 4
  br i1 %87, label %88, label %94

88:                                               ; preds = %86
  %89 = add nuw nsw i32 %16, 4
  %90 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %89
  %91 = load float, float addrspace(3)* %90, align 4, !tbaa !5
  %92 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %93 = fadd contract float %91, %92
  store float %93, float addrspace(3)* %29, align 4, !tbaa !5
  br label %94

94:                                               ; preds = %88, %86
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = icmp ult i32 %16, 2
  br i1 %95, label %96, label %102

96:                                               ; preds = %94
  %97 = add nuw nsw i32 %16, 2
  %98 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !5
  %100 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %101 = fadd contract float %99, %100
  store float %101, float addrspace(3)* %29, align 4, !tbaa !5
  br label %102

102:                                              ; preds = %96, %94
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = icmp eq i32 %16, 0
  br i1 %103, label %104, label %110

104:                                              ; preds = %102
  %105 = add nuw nsw i32 %16, 1
  %106 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %105
  %107 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %108 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %109 = fadd contract float %107, %108
  store float %109, float addrspace(3)* %29, align 4, !tbaa !5
  br label %110

110:                                              ; preds = %104, %102
  %111 = icmp eq i32 %16, 0
  br i1 %111, label %112, label %128

112:                                              ; preds = %110
  %113 = getelementptr inbounds float, float addrspace(1)* %5, i64 %26
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5
  %115 = fptosi float %114 to i32
  %116 = load float, float addrspace(3)* getelementptr inbounds ([129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 0), align 16, !tbaa !5
  %117 = fmul contract float %116, %11
  %118 = fmul contract float %117, %14
  %119 = fsub contract float %28, %118
  %120 = add nsw i32 %115, -1
  %121 = sitofp i32 %120 to float
  %122 = fadd contract float %119, %121
  %123 = sitofp i32 %9 to float
  %124 = fdiv contract float %122, %123
  %125 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  store float %124, float addrspace(1)* %125, align 4, !tbaa !5
  %126 = sitofp i32 %8 to float
  %127 = fmul contract float %124, %126
  store float %127, float addrspace(3)* getelementptr inbounds ([129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 128), align 16, !tbaa !5
  br label %128

128:                                              ; preds = %112, %110
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = load float, float addrspace(3)* getelementptr inbounds ([129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 128), align 16, !tbaa !5
  store float 0.000000e+00, float addrspace(3)* %29, align 4, !tbaa !5
  %130 = icmp slt i32 %16, %8
  br i1 %130, label %131, label %138

131:                                              ; preds = %128
  %132 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %133 = getelementptr i8, i8 addrspace(4)* %132, i64 4
  %134 = bitcast i8 addrspace(4)* %133 to i16 addrspace(4)*
  %135 = load i16, i16 addrspace(4)* %134, align 4, !range !10, !invariant.load !9
  %136 = zext i16 %135 to i32
  br label %139

137:                                              ; preds = %139
  store float %182, float addrspace(3)* %29, align 4, !tbaa !5
  br label %138

138:                                              ; preds = %137, %128
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %39, label %190, label %196

139:                                              ; preds = %131, %139
  %140 = phi float [ 0.000000e+00, %131 ], [ %182, %139 ]
  %141 = phi i32 [ %16, %131 ], [ %188, %139 ]
  %142 = add nsw i32 %141, 1
  %143 = sitofp i32 %142 to float
  %144 = fsub contract float %143, %129
  %145 = fmul contract float %144, %144
  %146 = fmul contract float %145, %13
  %147 = fmul float %146, 0x3FF7154760000000
  %148 = tail call float @llvm.rint.f32(float %147)
  %149 = fcmp ogt float %146, 0x40562E4300000000
  %150 = fcmp olt float %146, 0xC059D1DA00000000
  %151 = fneg float %147
  %152 = tail call float @llvm.fma.f32(float %146, float 0x3FF7154760000000, float %151)
  %153 = tail call float @llvm.fma.f32(float %146, float 0x3E54AE0BE0000000, float %152)
  %154 = fsub float %147, %148
  %155 = fadd float %153, %154
  %156 = tail call float @llvm.exp2.f32(float %155)
  %157 = fptosi float %148 to i32
  %158 = tail call float @llvm.amdgcn.ldexp.f32(float %156, i32 %157)
  %159 = select i1 %150, float 0.000000e+00, float %158
  %160 = select i1 %149, float 0x7FF0000000000000, float %159
  %161 = fmul contract float %160, %12
  %162 = sext i32 %141 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %24, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !5
  %165 = fpext float %164 to double
  %166 = fadd contract double %165, 0x3E7AD7F29ABCAF48
  %167 = fptrunc double %166 to float
  %168 = tail call i1 @llvm.amdgcn.class.f32(float %167, i32 144)
  %169 = select i1 %168, float 0x41F0000000000000, float 1.000000e+00
  %170 = fmul float %169, %167
  %171 = tail call float @llvm.log2.f32(float %170)
  %172 = fmul float %171, 0x3FE62E42E0000000
  %173 = tail call i1 @llvm.amdgcn.class.f32(float %171, i32 519)
  %174 = fneg float %172
  %175 = tail call float @llvm.fma.f32(float %171, float 0x3FE62E42E0000000, float %174)
  %176 = tail call float @llvm.fma.f32(float %171, float 0x3E6EFA39E0000000, float %175)
  %177 = fadd float %172, %176
  %178 = select i1 %173, float %171, float %177
  %179 = select i1 %168, float 0x40362E4300000000, float 0.000000e+00
  %180 = fsub float %178, %179
  %181 = fmul contract float %161, %180
  %182 = fsub contract float %140, %181
  %183 = fneg contract float %161
  %184 = fpext float %183 to double
  %185 = fdiv contract double %184, %166
  %186 = fptrunc double %185 to float
  %187 = getelementptr inbounds float, float addrspace(1)* %25, i64 %162
  store float %186, float addrspace(1)* %187, align 4, !tbaa !5
  %188 = add i32 %141, %136
  %189 = icmp slt i32 %188, %8
  br i1 %189, label %139, label %137, !llvm.loop !13

190:                                              ; preds = %138
  %191 = add nuw nsw i32 %16, 64
  %192 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %191
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !5
  %194 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %195 = fadd contract float %193, %194
  store float %195, float addrspace(3)* %29, align 4, !tbaa !5
  br label %196

196:                                              ; preds = %138, %190
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %63, label %197, label %203

197:                                              ; preds = %196
  %198 = add nuw nsw i32 %16, 32
  %199 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %201 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %202 = fadd contract float %200, %201
  store float %202, float addrspace(3)* %29, align 4, !tbaa !5
  br label %203

203:                                              ; preds = %197, %196
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %71, label %204, label %210

204:                                              ; preds = %203
  %205 = add nuw nsw i32 %16, 16
  %206 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %205
  %207 = load float, float addrspace(3)* %206, align 4, !tbaa !5
  %208 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %209 = fadd contract float %207, %208
  store float %209, float addrspace(3)* %29, align 4, !tbaa !5
  br label %210

210:                                              ; preds = %204, %203
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %79, label %211, label %217

211:                                              ; preds = %210
  %212 = add nuw nsw i32 %16, 8
  %213 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %212
  %214 = load float, float addrspace(3)* %213, align 4, !tbaa !5
  %215 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %216 = fadd contract float %214, %215
  store float %216, float addrspace(3)* %29, align 4, !tbaa !5
  br label %217

217:                                              ; preds = %211, %210
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %87, label %218, label %224

218:                                              ; preds = %217
  %219 = add nuw nsw i32 %16, 4
  %220 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %219
  %221 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %222 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %223 = fadd contract float %221, %222
  store float %223, float addrspace(3)* %29, align 4, !tbaa !5
  br label %224

224:                                              ; preds = %218, %217
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %95, label %225, label %231

225:                                              ; preds = %224
  %226 = add nuw nsw i32 %16, 2
  %227 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %226
  %228 = load float, float addrspace(3)* %227, align 4, !tbaa !5
  %229 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %230 = fadd contract float %228, %229
  store float %230, float addrspace(3)* %29, align 4, !tbaa !5
  br label %231

231:                                              ; preds = %225, %224
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %103, label %232, label %238

232:                                              ; preds = %231
  %233 = add nuw nsw i32 %16, 1
  %234 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ39cunnx_WindowGate_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_iiiffffE6buffer, i32 0, i32 %233
  %235 = load float, float addrspace(3)* %234, align 4, !tbaa !5
  %236 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %237 = fadd contract float %235, %236
  store float %237, float addrspace(3)* %29, align 4, !tbaa !5
  br label %238

238:                                              ; preds = %232, %231
  br i1 %111, label %239, label %242

239:                                              ; preds = %238
  %240 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %241 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %240, float addrspace(1)* %241, align 4, !tbaa !5
  br label %242

242:                                              ; preds = %239, %238
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
