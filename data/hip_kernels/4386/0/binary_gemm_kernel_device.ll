; ModuleID = '../data/hip_kernels/4386/0/main.cu'
source_filename = "../data/hip_kernels/4386/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16
@_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18binary_gemm_kernelPjS_PfiiiiiiS0_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float addrspace(1)* nocapture readonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = add nsw i32 %4, -1
  %16 = sdiv i32 %15, 32
  %17 = add nsw i32 %16, 1
  %18 = shl nsw i32 %5, 4
  %19 = mul nsw i32 %18, %11
  %20 = shl nsw i32 %12, 4
  %21 = add nsw i32 %19, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = icmp slt i32 %4, -510
  br i1 %25, label %94, label %26

26:                                               ; preds = %10
  %27 = sdiv i32 %15, 512
  %28 = getelementptr i8, i8 addrspace(4)* %24, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2, !range !5, !invariant.load !6
  %31 = zext i16 %30 to i32
  %32 = mul i32 %11, %31
  %33 = add i32 %32, %13
  %34 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %35 = bitcast i8 addrspace(4)* %34 to i16 addrspace(4)*
  %36 = load i16, i16 addrspace(4)* %35, align 4, !range !5, !invariant.load !6
  %37 = zext i16 %36 to i32
  %38 = mul i32 %12, %37
  %39 = add i32 %38, %14
  %40 = shl nsw i32 %11, 4
  %41 = mul nsw i32 %40, %17
  %42 = icmp eq i32 %6, 0
  %43 = mul nsw i32 %17, %20
  %44 = icmp slt i32 %33, %3
  %45 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 %14
  %46 = mul nsw i32 %17, %13
  %47 = add nsw i32 %46, %14
  %48 = sext i32 %47 to i64
  %49 = icmp slt i32 %39, %5
  %50 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 %13, i32 %14
  %51 = mul nsw i32 %17, %14
  %52 = add nsw i32 %51, %13
  %53 = mul nsw i32 %13, %5
  %54 = add nsw i32 %53, %14
  %55 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 0
  %56 = getelementptr i32, i32 addrspace(1)* %0, i64 %48
  %57 = select i1 %42, i32 %54, i32 %52
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 0, i32 %14
  %60 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 1
  %61 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 1, i32 %14
  %62 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 2
  %63 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 2, i32 %14
  %64 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 3
  %65 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 3, i32 %14
  %66 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 4
  %67 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 4, i32 %14
  %68 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 5
  %69 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 5, i32 %14
  %70 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 6
  %71 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 6, i32 %14
  %72 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 7
  %73 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 7, i32 %14
  %74 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 8
  %75 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 8, i32 %14
  %76 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 9
  %77 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 9, i32 %14
  %78 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 10
  %79 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 10, i32 %14
  %80 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 11
  %81 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 11, i32 %14
  %82 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 12
  %83 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 12, i32 %14
  %84 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 13
  %85 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 13, i32 %14
  %86 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 14
  %87 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 14, i32 %14
  %88 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2As, i32 0, i32 %13, i32 15
  %89 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ18binary_gemm_kernelPjS_PfiiiiiiS0_E2Bs, i32 0, i32 15, i32 %14
  %90 = getelementptr i32, i32 addrspace(1)* %1, i64 %58
  br label %98

91:                                               ; preds = %126
  %92 = shl i32 %207, 1
  %93 = sitofp i32 %92 to double
  br label %94

94:                                               ; preds = %91, %10
  %95 = phi double [ 0.000000e+00, %10 ], [ %93, %91 ]
  %96 = add nsw i32 %20, %14
  %97 = icmp slt i32 %96, %5
  br i1 %97, label %210, label %241

98:                                               ; preds = %26, %126
  %99 = phi i32 [ 0, %26 ], [ %207, %126 ]
  %100 = phi i32 [ 0, %26 ], [ %208, %126 ]
  %101 = shl nsw i32 %100, 4
  %102 = add nsw i32 %101, %41
  %103 = sext i32 %102 to i64
  br i1 %42, label %106, label %104

104:                                              ; preds = %98
  %105 = add nsw i32 %101, %43
  br label %109

106:                                              ; preds = %98
  %107 = mul nsw i32 %100, %18
  %108 = add nsw i32 %107, %20
  br label %109

109:                                              ; preds = %106, %104
  %110 = phi i32 [ %105, %104 ], [ %108, %106 ]
  %111 = sext i32 %110 to i64
  %112 = add nuw nsw i32 %101, %14
  %113 = icmp sle i32 %112, %16
  %114 = select i1 %113, i1 %44, i1 false
  br i1 %114, label %115, label %118

115:                                              ; preds = %109
  %116 = getelementptr i32, i32 addrspace(1)* %56, i64 %103
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %118

118:                                              ; preds = %109, %115
  %119 = phi i32 [ %117, %115 ], [ 0, %109 ]
  store i32 %119, i32 addrspace(3)* %45, align 4, !tbaa !7
  %120 = add nuw nsw i32 %101, %13
  %121 = icmp sle i32 %120, %16
  %122 = select i1 %121, i1 %49, i1 false
  br i1 %122, label %123, label %126

123:                                              ; preds = %118
  %124 = getelementptr i32, i32 addrspace(1)* %90, i64 %111
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %126

126:                                              ; preds = %118, %123
  %127 = phi i32 [ %125, %123 ], [ 0, %118 ]
  store i32 %127, i32 addrspace(3)* %50, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %128 = load i32, i32 addrspace(3)* %55, align 16, !tbaa !7
  %129 = load i32, i32 addrspace(3)* %59, align 4, !tbaa !7
  %130 = xor i32 %129, %128
  %131 = tail call i32 @llvm.ctpop.i32(i32 %130), !range !11
  %132 = add i32 %131, %99
  %133 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !7
  %134 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !7
  %135 = xor i32 %134, %133
  %136 = tail call i32 @llvm.ctpop.i32(i32 %135), !range !11
  %137 = add i32 %136, %132
  %138 = load i32, i32 addrspace(3)* %62, align 8, !tbaa !7
  %139 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !7
  %140 = xor i32 %139, %138
  %141 = tail call i32 @llvm.ctpop.i32(i32 %140), !range !11
  %142 = add i32 %141, %137
  %143 = load i32, i32 addrspace(3)* %64, align 4, !tbaa !7
  %144 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !7
  %145 = xor i32 %144, %143
  %146 = tail call i32 @llvm.ctpop.i32(i32 %145), !range !11
  %147 = add i32 %146, %142
  %148 = load i32, i32 addrspace(3)* %66, align 16, !tbaa !7
  %149 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !7
  %150 = xor i32 %149, %148
  %151 = tail call i32 @llvm.ctpop.i32(i32 %150), !range !11
  %152 = add i32 %151, %147
  %153 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !7
  %154 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !7
  %155 = xor i32 %154, %153
  %156 = tail call i32 @llvm.ctpop.i32(i32 %155), !range !11
  %157 = add i32 %156, %152
  %158 = load i32, i32 addrspace(3)* %70, align 8, !tbaa !7
  %159 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !7
  %160 = xor i32 %159, %158
  %161 = tail call i32 @llvm.ctpop.i32(i32 %160), !range !11
  %162 = add i32 %161, %157
  %163 = load i32, i32 addrspace(3)* %72, align 4, !tbaa !7
  %164 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !7
  %165 = xor i32 %164, %163
  %166 = tail call i32 @llvm.ctpop.i32(i32 %165), !range !11
  %167 = add i32 %166, %162
  %168 = load i32, i32 addrspace(3)* %74, align 16, !tbaa !7
  %169 = load i32, i32 addrspace(3)* %75, align 4, !tbaa !7
  %170 = xor i32 %169, %168
  %171 = tail call i32 @llvm.ctpop.i32(i32 %170), !range !11
  %172 = add i32 %171, %167
  %173 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %174 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !7
  %175 = xor i32 %174, %173
  %176 = tail call i32 @llvm.ctpop.i32(i32 %175), !range !11
  %177 = add i32 %176, %172
  %178 = load i32, i32 addrspace(3)* %78, align 8, !tbaa !7
  %179 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !7
  %180 = xor i32 %179, %178
  %181 = tail call i32 @llvm.ctpop.i32(i32 %180), !range !11
  %182 = add i32 %181, %177
  %183 = load i32, i32 addrspace(3)* %80, align 4, !tbaa !7
  %184 = load i32, i32 addrspace(3)* %81, align 4, !tbaa !7
  %185 = xor i32 %184, %183
  %186 = tail call i32 @llvm.ctpop.i32(i32 %185), !range !11
  %187 = add i32 %186, %182
  %188 = load i32, i32 addrspace(3)* %82, align 16, !tbaa !7
  %189 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !7
  %190 = xor i32 %189, %188
  %191 = tail call i32 @llvm.ctpop.i32(i32 %190), !range !11
  %192 = add i32 %191, %187
  %193 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !7
  %194 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !7
  %195 = xor i32 %194, %193
  %196 = tail call i32 @llvm.ctpop.i32(i32 %195), !range !11
  %197 = add i32 %196, %192
  %198 = load i32, i32 addrspace(3)* %86, align 8, !tbaa !7
  %199 = load i32, i32 addrspace(3)* %87, align 4, !tbaa !7
  %200 = xor i32 %199, %198
  %201 = tail call i32 @llvm.ctpop.i32(i32 %200), !range !11
  %202 = add i32 %201, %197
  %203 = load i32, i32 addrspace(3)* %88, align 4, !tbaa !7
  %204 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !7
  %205 = xor i32 %204, %203
  %206 = tail call i32 @llvm.ctpop.i32(i32 %205), !range !11
  %207 = add i32 %206, %202
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %208 = add nuw nsw i32 %100, 1
  %209 = icmp eq i32 %100, %27
  br i1 %209, label %91, label %98, !llvm.loop !12

210:                                              ; preds = %94
  %211 = shl nsw i32 %11, 4
  %212 = add nsw i32 %211, %13
  %213 = icmp slt i32 %212, %3
  br i1 %213, label %214, label %241

214:                                              ; preds = %210
  %215 = icmp eq i32 %8, 0
  %216 = mul nsw i32 %13, %5
  %217 = add i32 %216, %14
  %218 = sext i32 %217 to i64
  br i1 %215, label %222, label %219

219:                                              ; preds = %214
  %220 = getelementptr inbounds float, float addrspace(1)* %23, i64 %218
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !14, !amdgpu.noclobber !6
  br label %222

222:                                              ; preds = %214, %219
  %223 = phi contract float [ %221, %219 ], [ 0.000000e+00, %214 ]
  %224 = getelementptr inbounds float, float addrspace(1)* %23, i64 %218
  store float %223, float addrspace(1)* %224, align 4, !tbaa !14
  %225 = icmp eq i32 %7, 0
  %226 = sitofp i32 %4 to double
  %227 = fsub contract double %226, %95
  br i1 %225, label %236, label %228

228:                                              ; preds = %222
  %229 = add i32 %217, %21
  %230 = sdiv i32 %229, %5
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %9, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !14
  %234 = fpext float %233 to double
  %235 = fmul contract double %227, %234
  br label %236

236:                                              ; preds = %222, %228
  %237 = phi contract double [ %235, %228 ], [ %227, %222 ]
  %238 = fpext float %223 to double
  %239 = fadd contract double %237, %238
  %240 = fptrunc double %239 to float
  store float %240, float addrspace(1)* %224, align 4, !tbaa !14
  br label %241

241:                                              ; preds = %236, %210, %94
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i32 0, i32 33}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !9, i64 0}
