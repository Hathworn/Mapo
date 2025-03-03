; ModuleID = '../data/hip_kernels/15241/1/main.cu'
source_filename = "../data/hip_kernels/15241/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights = internal unnamed_addr addrspace(3) global [25 x double] undef, align 16
@_ZZ10cudaKerneliPdPiS0_S0_E7sharedG = internal unnamed_addr addrspace(3) global [1296 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10cudaKerneliPdPiS0_S0_(i32 %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 8, !tbaa !16
  %26 = mul i32 %18, %22
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %28 = add i32 %26, %27
  %29 = add nuw nsw i32 %16, 2
  %30 = icmp ult i32 %16, 5
  %31 = icmp ult i32 %27, 5
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %40

33:                                               ; preds = %5
  %34 = mul nuw nsw i32 %16, 5
  %35 = add nuw nsw i32 %34, %27
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !17, !amdgpu.noclobber !5
  %39 = getelementptr inbounds [25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 %35
  store double %38, double addrspace(3)* %39, align 8, !tbaa !17
  br label %40

40:                                               ; preds = %33, %5
  %41 = add nsw i32 %0, 2
  %42 = icmp slt i32 %28, %41
  br i1 %42, label %43, label %146

43:                                               ; preds = %40
  %44 = icmp slt i32 %17, %41
  %45 = mul nuw nsw i32 %27, 36
  %46 = add nuw nsw i32 %45, 72
  %47 = add nuw nsw i32 %46, %29
  %48 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %47
  %49 = icmp ult i32 %16, 2
  %50 = add nsw i32 %0, -2
  %51 = add nuw nsw i32 %46, %16
  %52 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %51
  %53 = add nuw nsw i32 %47, 32
  %54 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %53
  %55 = icmp ult i32 %27, 2
  %56 = add nuw nsw i32 %45, %29
  %57 = add nuw nsw i32 %45, %16
  %58 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %57
  %59 = add nuw nsw i32 %45, 1224
  %60 = add nuw nsw i32 %59, %16
  %61 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %60
  %62 = add nuw nsw i32 %56, 32
  %63 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %62
  %64 = add nuw nsw i32 %16, 34
  %65 = add nuw nsw i32 %64, %59
  %66 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %65
  %67 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %56
  %68 = add nuw nsw i32 %56, 1224
  %69 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %68
  %70 = udiv i32 %25, %22
  %71 = mul i32 %70, %22
  %72 = icmp ugt i32 %25, %71
  %73 = zext i1 %72 to i32
  %74 = add i32 %70, %73
  %75 = mul i32 %74, %22
  %76 = add nuw nsw i32 %57, 1
  %77 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %76
  %78 = add nuw nsw i32 %57, 2
  %79 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %78
  %80 = add nuw nsw i32 %57, 3
  %81 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %80
  %82 = add nuw nsw i32 %57, 4
  %83 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %82
  %84 = mul nuw nsw i32 %27, 36
  %85 = add nuw nsw i32 %84, 36
  %86 = add nuw nsw i32 %85, %16
  %87 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %86
  %88 = add nuw nsw i32 %86, 1
  %89 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %88
  %90 = add nuw nsw i32 %86, 2
  %91 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %90
  %92 = add nuw nsw i32 %86, 3
  %93 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %92
  %94 = add nuw nsw i32 %86, 4
  %95 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %94
  %96 = mul nuw nsw i32 %27, 36
  %97 = add nuw nsw i32 %96, 72
  %98 = add nuw nsw i32 %97, %16
  %99 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %98
  %100 = add nuw nsw i32 %98, 1
  %101 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %100
  %102 = add nuw nsw i32 %98, 3
  %103 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %102
  %104 = add nuw nsw i32 %98, 4
  %105 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %104
  %106 = mul nuw nsw i32 %27, 36
  %107 = add nuw nsw i32 %106, 108
  %108 = add nuw nsw i32 %107, %16
  %109 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %108
  %110 = add nuw nsw i32 %108, 1
  %111 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %110
  %112 = add nuw nsw i32 %108, 2
  %113 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %112
  %114 = add nuw nsw i32 %108, 3
  %115 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %114
  %116 = add nuw nsw i32 %108, 4
  %117 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %116
  %118 = mul nuw nsw i32 %27, 36
  %119 = add nuw nsw i32 %118, 144
  %120 = add nuw nsw i32 %119, %16
  %121 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %120
  %122 = add nuw nsw i32 %120, 1
  %123 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %122
  %124 = add nuw nsw i32 %120, 2
  %125 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %124
  %126 = add nuw nsw i32 %120, 3
  %127 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %126
  %128 = add nuw nsw i32 %120, 4
  %129 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E7sharedG, i32 0, i32 %128
  br label %130

130:                                              ; preds = %43, %147
  %131 = phi i32 [ %28, %43 ], [ %148, %147 ]
  br i1 %44, label %132, label %147

132:                                              ; preds = %130
  %133 = add nsw i32 %131, %0
  %134 = srem i32 %133, %0
  %135 = mul nsw i32 %134, %0
  %136 = add i32 %50, %131
  %137 = add nsw i32 %133, 32
  %138 = icmp slt i32 %131, %0
  %139 = mul nsw i32 %131, %0
  %140 = udiv i32 %14, %11
  %141 = mul i32 %140, %11
  %142 = icmp ugt i32 %14, %141
  %143 = zext i1 %142 to i32
  %144 = add i32 %140, %143
  %145 = mul i32 %144, %11
  br label %150

146:                                              ; preds = %147, %40
  ret void

147:                                              ; preds = %349, %130
  %148 = add i32 %75, %131
  %149 = icmp slt i32 %148, %41
  br i1 %149, label %130, label %146, !llvm.loop !21

150:                                              ; preds = %132, %349
  %151 = phi i32 [ %17, %132 ], [ %350, %349 ]
  %152 = add i32 %151, %0
  %153 = srem i32 %152, %0
  %154 = add nsw i32 %135, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %155
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !23
  store i32 %157, i32 addrspace(3)* %48, align 4, !tbaa !23
  br i1 %49, label %158, label %192

158:                                              ; preds = %150
  %159 = add i32 %50, %151
  %160 = srem i32 %159, %0
  %161 = add nsw i32 %160, %135
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %162
  %164 = load i32, i32 addrspace(1)* %163, align 4, !tbaa !23
  store i32 %164, i32 addrspace(3)* %52, align 4, !tbaa !23
  %165 = add i32 %152, 32
  %166 = srem i32 %165, %0
  %167 = add nsw i32 %166, %135
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %168
  %170 = load i32, i32 addrspace(1)* %169, align 4, !tbaa !23
  store i32 %170, i32 addrspace(3)* %54, align 4, !tbaa !23
  br i1 %55, label %171, label %206

171:                                              ; preds = %158
  %172 = srem i32 %136, %0
  %173 = mul nsw i32 %172, %0
  %174 = add nsw i32 %173, %160
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %175
  %177 = load i32, i32 addrspace(1)* %176, align 4, !tbaa !23
  store i32 %177, i32 addrspace(3)* %58, align 4, !tbaa !23
  %178 = srem i32 %137, %0
  %179 = mul nsw i32 %178, %0
  %180 = add nsw i32 %179, %160
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %181
  %183 = load i32, i32 addrspace(1)* %182, align 4, !tbaa !23
  store i32 %183, i32 addrspace(3)* %61, align 4, !tbaa !23
  %184 = add nsw i32 %166, %173
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %185
  %187 = load i32, i32 addrspace(1)* %186, align 4, !tbaa !23
  store i32 %187, i32 addrspace(3)* %63, align 4, !tbaa !23
  %188 = add nsw i32 %166, %179
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %189
  %191 = load i32, i32 addrspace(1)* %190, align 4, !tbaa !23
  store i32 %191, i32 addrspace(3)* %66, align 4, !tbaa !23
  br label %192

192:                                              ; preds = %171, %150
  br i1 %55, label %193, label %206

193:                                              ; preds = %192
  %194 = srem i32 %136, %0
  %195 = mul nsw i32 %194, %0
  %196 = add nsw i32 %195, %153
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %197
  %199 = load i32, i32 addrspace(1)* %198, align 4, !tbaa !23
  store i32 %199, i32 addrspace(3)* %67, align 4, !tbaa !23
  %200 = srem i32 %137, %0
  %201 = mul nsw i32 %200, %0
  %202 = add nsw i32 %201, %153
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %203
  %205 = load i32, i32 addrspace(1)* %204, align 4, !tbaa !23
  store i32 %205, i32 addrspace(3)* %69, align 4, !tbaa !23
  br label %206

206:                                              ; preds = %158, %193, %192
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %207 = icmp slt i32 %151, %0
  %208 = select i1 %138, i1 %207, i1 false
  br i1 %208, label %209, label %349

209:                                              ; preds = %206
  %210 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !23
  %211 = sitofp i32 %210 to double
  %212 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 0), align 16, !tbaa !17
  %213 = fmul contract double %212, %211
  %214 = fadd contract double %213, 0.000000e+00
  %215 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !23
  %216 = sitofp i32 %215 to double
  %217 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 1), align 8, !tbaa !17
  %218 = fmul contract double %217, %216
  %219 = fadd contract double %214, %218
  %220 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !23
  %221 = sitofp i32 %220 to double
  %222 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 2), align 16, !tbaa !17
  %223 = fmul contract double %222, %221
  %224 = fadd contract double %219, %223
  %225 = load i32, i32 addrspace(3)* %81, align 4, !tbaa !23
  %226 = sitofp i32 %225 to double
  %227 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 3), align 8, !tbaa !17
  %228 = fmul contract double %227, %226
  %229 = fadd contract double %224, %228
  %230 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !23
  %231 = sitofp i32 %230 to double
  %232 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 4), align 16, !tbaa !17
  %233 = fmul contract double %232, %231
  %234 = fadd contract double %229, %233
  %235 = load i32, i32 addrspace(3)* %87, align 4, !tbaa !23
  %236 = sitofp i32 %235 to double
  %237 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 5), align 8, !tbaa !17
  %238 = fmul contract double %237, %236
  %239 = fadd contract double %234, %238
  %240 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !23
  %241 = sitofp i32 %240 to double
  %242 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 6), align 16, !tbaa !17
  %243 = fmul contract double %242, %241
  %244 = fadd contract double %239, %243
  %245 = load i32, i32 addrspace(3)* %91, align 4, !tbaa !23
  %246 = sitofp i32 %245 to double
  %247 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 7), align 8, !tbaa !17
  %248 = fmul contract double %247, %246
  %249 = fadd contract double %244, %248
  %250 = load i32, i32 addrspace(3)* %93, align 4, !tbaa !23
  %251 = sitofp i32 %250 to double
  %252 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 8), align 16, !tbaa !17
  %253 = fmul contract double %252, %251
  %254 = fadd contract double %249, %253
  %255 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !23
  %256 = sitofp i32 %255 to double
  %257 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 9), align 8, !tbaa !17
  %258 = fmul contract double %257, %256
  %259 = fadd contract double %254, %258
  %260 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !23
  %261 = sitofp i32 %260 to double
  %262 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 10), align 16, !tbaa !17
  %263 = fmul contract double %262, %261
  %264 = fadd contract double %259, %263
  %265 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !23
  %266 = sitofp i32 %265 to double
  %267 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 11), align 8, !tbaa !17
  %268 = fmul contract double %267, %266
  %269 = fadd contract double %264, %268
  %270 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !23
  %271 = sitofp i32 %270 to double
  %272 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 13), align 8, !tbaa !17
  %273 = fmul contract double %272, %271
  %274 = fadd contract double %269, %273
  %275 = load i32, i32 addrspace(3)* %105, align 4, !tbaa !23
  %276 = sitofp i32 %275 to double
  %277 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 14), align 16, !tbaa !17
  %278 = fmul contract double %277, %276
  %279 = fadd contract double %274, %278
  %280 = load i32, i32 addrspace(3)* %109, align 4, !tbaa !23
  %281 = sitofp i32 %280 to double
  %282 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 15), align 8, !tbaa !17
  %283 = fmul contract double %282, %281
  %284 = fadd contract double %279, %283
  %285 = load i32, i32 addrspace(3)* %111, align 4, !tbaa !23
  %286 = sitofp i32 %285 to double
  %287 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 16), align 16, !tbaa !17
  %288 = fmul contract double %287, %286
  %289 = fadd contract double %284, %288
  %290 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !23
  %291 = sitofp i32 %290 to double
  %292 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 17), align 8, !tbaa !17
  %293 = fmul contract double %292, %291
  %294 = fadd contract double %289, %293
  %295 = load i32, i32 addrspace(3)* %115, align 4, !tbaa !23
  %296 = sitofp i32 %295 to double
  %297 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 18), align 16, !tbaa !17
  %298 = fmul contract double %297, %296
  %299 = fadd contract double %294, %298
  %300 = load i32, i32 addrspace(3)* %117, align 4, !tbaa !23
  %301 = sitofp i32 %300 to double
  %302 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 19), align 8, !tbaa !17
  %303 = fmul contract double %302, %301
  %304 = fadd contract double %299, %303
  %305 = load i32, i32 addrspace(3)* %121, align 4, !tbaa !23
  %306 = sitofp i32 %305 to double
  %307 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 20), align 16, !tbaa !17
  %308 = fmul contract double %307, %306
  %309 = fadd contract double %304, %308
  %310 = load i32, i32 addrspace(3)* %123, align 4, !tbaa !23
  %311 = sitofp i32 %310 to double
  %312 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 21), align 8, !tbaa !17
  %313 = fmul contract double %312, %311
  %314 = fadd contract double %309, %313
  %315 = load i32, i32 addrspace(3)* %125, align 4, !tbaa !23
  %316 = sitofp i32 %315 to double
  %317 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 22), align 16, !tbaa !17
  %318 = fmul contract double %317, %316
  %319 = fadd contract double %314, %318
  %320 = load i32, i32 addrspace(3)* %127, align 4, !tbaa !23
  %321 = sitofp i32 %320 to double
  %322 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 23), align 8, !tbaa !17
  %323 = fmul contract double %322, %321
  %324 = fadd contract double %319, %323
  %325 = load i32, i32 addrspace(3)* %129, align 4, !tbaa !23
  %326 = sitofp i32 %325 to double
  %327 = load double, double addrspace(3)* getelementptr inbounds ([25 x double], [25 x double] addrspace(3)* @_ZZ10cudaKerneliPdPiS0_S0_E13sharedWeights, i32 0, i32 24), align 16, !tbaa !17
  %328 = fmul contract double %327, %326
  %329 = fadd contract double %324, %328
  %330 = fcmp contract olt double %329, 1.000000e-04
  %331 = fcmp contract ogt double %329, -1.000000e-04
  %332 = and i1 %330, %331
  %333 = add nsw i32 %151, %139
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %334
  br i1 %332, label %336, label %338

336:                                              ; preds = %209
  %337 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !23
  store i32 %337, i32 addrspace(1)* %335, align 4, !tbaa !23
  br label %349

338:                                              ; preds = %209
  %339 = fcmp contract ogt double %329, 1.000000e-05
  %340 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %334
  br i1 %339, label %341, label %345

341:                                              ; preds = %338
  store i32 1, i32 addrspace(1)* %335, align 4, !tbaa !23
  %342 = load i32, i32 addrspace(1)* %340, align 4, !tbaa !23
  %343 = icmp eq i32 %342, -1
  br i1 %343, label %344, label %349

344:                                              ; preds = %341
  store i32 1, i32 addrspace(1)* %4, align 4, !tbaa !23
  br label %349

345:                                              ; preds = %338
  store i32 -1, i32 addrspace(1)* %335, align 4, !tbaa !23
  %346 = load i32, i32 addrspace(1)* %340, align 4, !tbaa !23
  %347 = icmp eq i32 %346, -1
  br i1 %347, label %348, label %349

348:                                              ; preds = %345
  store i32 1, i32 addrspace(1)* %4, align 4, !tbaa !23
  br label %349

349:                                              ; preds = %336, %345, %348, %341, %344, %206
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %350 = add i32 %145, %151
  %351 = icmp slt i32 %350, %41
  br i1 %351, label %150, label %147, !llvm.loop !25
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !19, i64 0}
!25 = distinct !{!25, !22}
