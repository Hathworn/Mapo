; ModuleID = '../data/hip_kernels/8008/9/main.cu'
source_filename = "../data/hip_kernels/8008/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19ComputeOrientationsPfS_iiiE4data = internal unnamed_addr addrspace(3) global [240 x float] undef, align 16
@_ZZ19ComputeOrientationsPfS_iiiE4hist = internal unnamed_addr addrspace(3) global [416 x float] undef, align 16
@_ZZ19ComputeOrientationsPfS_iiiE5gauss = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19ComputeOrientationsPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %6
  store float 0.000000e+00, float addrspace(3)* %7, align 4, !tbaa !5
  %8 = add nuw nsw i32 %6, 32
  %9 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %8
  store float 0.000000e+00, float addrspace(3)* %9, align 4, !tbaa !5
  %10 = add nuw nsw i32 %6, 64
  %11 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %10
  store float 0.000000e+00, float addrspace(3)* %11, align 4, !tbaa !5
  %12 = add nuw nsw i32 %6, 96
  %13 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %13, align 4, !tbaa !5
  %14 = add nuw nsw i32 %6, 128
  %15 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %14
  store float 0.000000e+00, float addrspace(3)* %15, align 4, !tbaa !5
  %16 = add nuw nsw i32 %6, 160
  %17 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %16
  store float 0.000000e+00, float addrspace(3)* %17, align 4, !tbaa !5
  %18 = add nuw nsw i32 %6, 192
  %19 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %18
  store float 0.000000e+00, float addrspace(3)* %19, align 4, !tbaa !5
  %20 = add nuw nsw i32 %6, 224
  %21 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %20
  store float 0.000000e+00, float addrspace(3)* %21, align 4, !tbaa !5
  %22 = add nuw nsw i32 %6, 256
  %23 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %22
  store float 0.000000e+00, float addrspace(3)* %23, align 4, !tbaa !5
  %24 = add nuw nsw i32 %6, 288
  %25 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %24
  store float 0.000000e+00, float addrspace(3)* %25, align 4, !tbaa !5
  %26 = add nuw nsw i32 %6, 320
  %27 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %26
  store float 0.000000e+00, float addrspace(3)* %27, align 4, !tbaa !5
  %28 = add nuw nsw i32 %6, 352
  %29 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %28
  store float 0.000000e+00, float addrspace(3)* %29, align 4, !tbaa !5
  %30 = add nuw nsw i32 %6, 384
  %31 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %30
  store float 0.000000e+00, float addrspace(3)* %31, align 4, !tbaa !5
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp ult i32 %6, 15
  br i1 %33, label %34, label %54

34:                                               ; preds = %5
  %35 = add nsw i32 %6, -7
  %36 = sitofp i32 %35 to float
  %37 = fmul contract float %36, 0xBFAC71C720000000
  %38 = fmul contract float %37, %36
  %39 = fmul float %38, 0x3FF7154760000000
  %40 = tail call float @llvm.rint.f32(float %39)
  %41 = fcmp ogt float %38, 0x40562E4300000000
  %42 = fcmp olt float %38, 0xC059D1DA00000000
  %43 = fneg float %39
  %44 = tail call float @llvm.fma.f32(float %38, float 0x3FF7154760000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %38, float 0x3E54AE0BE0000000, float %44)
  %46 = fsub float %39, %40
  %47 = fadd float %45, %46
  %48 = tail call float @llvm.exp2.f32(float %47)
  %49 = fptosi float %40 to i32
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %48, i32 %49)
  %51 = select i1 %42, float 0.000000e+00, float %50
  %52 = select i1 %41, float 0x7FF0000000000000, float %51
  %53 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE5gauss, i32 0, i32 %6
  store float %52, float addrspace(3)* %53, align 4, !tbaa !5
  br label %54

54:                                               ; preds = %34, %5
  %55 = sext i32 %32 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = fadd contract float %57, -6.500000e+00
  %59 = fptosi float %58 to i32
  %60 = add nsw i32 %32, %2
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fadd contract float %63, -6.500000e+00
  %65 = fptosi float %64 to i32
  %66 = and i32 %59, 15
  %67 = sub nsw i32 %6, %66
  %68 = add nsw i32 %67, %59
  %69 = tail call i32 @llvm.smax.i32(i32 %68, i32 0)
  %70 = icmp ult i32 %67, 15
  %71 = add nsw i32 %4, -1
  %72 = icmp slt i32 %69, %3
  %73 = add nsw i32 %3, -1
  %74 = select i1 %72, i32 %69, i32 %73
  %75 = tail call i32 @llvm.smax.i32(i32 %65, i32 0)
  br i1 %70, label %76, label %239

76:                                               ; preds = %54
  %77 = icmp slt i32 %75, %4
  %78 = select i1 %77, i32 %75, i32 %71
  %79 = mul nsw i32 %78, %3
  %80 = add nsw i32 %79, %74
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %67
  store float %83, float addrspace(3)* %84, align 4, !tbaa !5
  %85 = tail call i32 @llvm.smax.i32(i32 %65, i32 -1)
  %86 = add nsw i32 %85, 1
  %87 = icmp slt i32 %86, %4
  %88 = select i1 %87, i32 %86, i32 %71
  %89 = add nuw nsw i32 %67, 16
  %90 = mul nsw i32 %88, %3
  %91 = add nsw i32 %90, %74
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  %95 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %89
  store float %94, float addrspace(3)* %95, align 4, !tbaa !5
  %96 = tail call i32 @llvm.smax.i32(i32 %65, i32 -2)
  %97 = add nsw i32 %96, 2
  %98 = icmp slt i32 %97, %4
  %99 = select i1 %98, i32 %97, i32 %71
  %100 = add nuw nsw i32 %67, 32
  %101 = mul nsw i32 %99, %3
  %102 = add nsw i32 %101, %74
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  %106 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %100
  store float %105, float addrspace(3)* %106, align 4, !tbaa !5
  %107 = tail call i32 @llvm.smax.i32(i32 %65, i32 -3)
  %108 = add nsw i32 %107, 3
  %109 = icmp slt i32 %108, %4
  %110 = select i1 %109, i32 %108, i32 %71
  %111 = add nuw nsw i32 %67, 48
  %112 = mul nsw i32 %110, %3
  %113 = add nsw i32 %112, %74
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !9
  %117 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %111
  store float %116, float addrspace(3)* %117, align 4, !tbaa !5
  %118 = tail call i32 @llvm.smax.i32(i32 %65, i32 -4)
  %119 = add nsw i32 %118, 4
  %120 = icmp slt i32 %119, %4
  %121 = select i1 %120, i32 %119, i32 %71
  %122 = add nuw nsw i32 %67, 64
  %123 = mul nsw i32 %121, %3
  %124 = add nsw i32 %123, %74
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %122
  store float %127, float addrspace(3)* %128, align 4, !tbaa !5
  %129 = tail call i32 @llvm.smax.i32(i32 %65, i32 -5)
  %130 = add nsw i32 %129, 5
  %131 = icmp slt i32 %130, %4
  %132 = select i1 %131, i32 %130, i32 %71
  %133 = add nuw nsw i32 %67, 80
  %134 = mul nsw i32 %132, %3
  %135 = add nsw i32 %134, %74
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5, !amdgpu.noclobber !9
  %139 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %133
  store float %138, float addrspace(3)* %139, align 4, !tbaa !5
  %140 = tail call i32 @llvm.smax.i32(i32 %65, i32 -6)
  %141 = add nsw i32 %140, 6
  %142 = icmp slt i32 %141, %4
  %143 = select i1 %142, i32 %141, i32 %71
  %144 = add nuw nsw i32 %67, 96
  %145 = mul nsw i32 %143, %3
  %146 = add nsw i32 %145, %74
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !5, !amdgpu.noclobber !9
  %150 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %144
  store float %149, float addrspace(3)* %150, align 4, !tbaa !5
  %151 = tail call i32 @llvm.smax.i32(i32 %65, i32 -7)
  %152 = add nsw i32 %151, 7
  %153 = icmp slt i32 %152, %4
  %154 = select i1 %153, i32 %152, i32 %71
  %155 = add nuw nsw i32 %67, 112
  %156 = mul nsw i32 %154, %3
  %157 = add nsw i32 %156, %74
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !5, !amdgpu.noclobber !9
  %161 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %155
  store float %160, float addrspace(3)* %161, align 4, !tbaa !5
  %162 = tail call i32 @llvm.smax.i32(i32 %65, i32 -8)
  %163 = add nsw i32 %162, 8
  %164 = icmp slt i32 %163, %4
  %165 = select i1 %164, i32 %163, i32 %71
  %166 = add nuw nsw i32 %67, 128
  %167 = mul nsw i32 %165, %3
  %168 = add nsw i32 %167, %74
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !5, !amdgpu.noclobber !9
  %172 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %166
  store float %171, float addrspace(3)* %172, align 4, !tbaa !5
  %173 = tail call i32 @llvm.smax.i32(i32 %65, i32 -9)
  %174 = add nsw i32 %173, 9
  %175 = icmp slt i32 %174, %4
  %176 = select i1 %175, i32 %174, i32 %71
  %177 = add nuw nsw i32 %67, 144
  %178 = mul nsw i32 %176, %3
  %179 = add nsw i32 %178, %74
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !5, !amdgpu.noclobber !9
  %183 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %177
  store float %182, float addrspace(3)* %183, align 4, !tbaa !5
  %184 = tail call i32 @llvm.smax.i32(i32 %65, i32 -10)
  %185 = add nsw i32 %184, 10
  %186 = icmp slt i32 %185, %4
  %187 = select i1 %186, i32 %185, i32 %71
  %188 = add nuw nsw i32 %67, 160
  %189 = mul nsw i32 %187, %3
  %190 = add nsw i32 %189, %74
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %0, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !5, !amdgpu.noclobber !9
  %194 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %188
  store float %193, float addrspace(3)* %194, align 4, !tbaa !5
  %195 = tail call i32 @llvm.smax.i32(i32 %65, i32 -11)
  %196 = add nsw i32 %195, 11
  %197 = icmp slt i32 %196, %4
  %198 = select i1 %197, i32 %196, i32 %71
  %199 = add nuw nsw i32 %67, 176
  %200 = mul nsw i32 %198, %3
  %201 = add nsw i32 %200, %74
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %0, i64 %202
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !5, !amdgpu.noclobber !9
  %205 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %199
  store float %204, float addrspace(3)* %205, align 4, !tbaa !5
  %206 = tail call i32 @llvm.smax.i32(i32 %65, i32 -12)
  %207 = add nsw i32 %206, 12
  %208 = icmp slt i32 %207, %4
  %209 = select i1 %208, i32 %207, i32 %71
  %210 = add nuw nsw i32 %67, 192
  %211 = mul nsw i32 %209, %3
  %212 = add nsw i32 %211, %74
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds float, float addrspace(1)* %0, i64 %213
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !5, !amdgpu.noclobber !9
  %216 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %210
  store float %215, float addrspace(3)* %216, align 4, !tbaa !5
  %217 = tail call i32 @llvm.smax.i32(i32 %65, i32 -13)
  %218 = add nsw i32 %217, 13
  %219 = icmp slt i32 %218, %4
  %220 = select i1 %219, i32 %218, i32 %71
  %221 = add nuw nsw i32 %67, 208
  %222 = mul nsw i32 %220, %3
  %223 = add nsw i32 %222, %74
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %0, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !5, !amdgpu.noclobber !9
  %227 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %221
  store float %226, float addrspace(3)* %227, align 4, !tbaa !5
  %228 = tail call i32 @llvm.smax.i32(i32 %65, i32 -14)
  %229 = add nsw i32 %228, 14
  %230 = icmp slt i32 %229, %4
  %231 = select i1 %230, i32 %229, i32 %71
  %232 = add nuw nsw i32 %67, 224
  %233 = mul nsw i32 %231, %3
  %234 = add nsw i32 %233, %74
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %0, i64 %235
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !5, !amdgpu.noclobber !9
  %238 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %232
  store float %237, float addrspace(3)* %238, align 4, !tbaa !5
  br label %239

239:                                              ; preds = %54, %76
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %240 = add nsw i32 %67, -1
  %241 = icmp ult i32 %240, 13
  %242 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE5gauss, i32 0, i32 %67
  %243 = shl nuw nsw i32 %67, 5
  %244 = add nsw i32 %243, -32
  br label %299

245:                                              ; preds = %391
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %246 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %247 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %248 = fadd contract float %246, %247
  store float %248, float addrspace(3)* %7, align 4, !tbaa !5
  %249 = add nuw nsw i32 %6, 288
  %250 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %249
  %251 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %252 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %253 = fadd contract float %251, %252
  store float %253, float addrspace(3)* %9, align 4, !tbaa !5
  %254 = add nuw nsw i32 %6, 320
  %255 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %254
  %256 = load float, float addrspace(3)* %255, align 4, !tbaa !5
  %257 = load float, float addrspace(3)* %11, align 4, !tbaa !5
  %258 = fadd contract float %256, %257
  store float %258, float addrspace(3)* %11, align 4, !tbaa !5
  %259 = add nuw nsw i32 %6, 352
  %260 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %259
  %261 = load float, float addrspace(3)* %260, align 4, !tbaa !5
  %262 = load float, float addrspace(3)* %13, align 4, !tbaa !5
  %263 = fadd contract float %261, %262
  store float %263, float addrspace(3)* %13, align 4, !tbaa !5
  %264 = add nuw nsw i32 %6, 384
  %265 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %264
  %266 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %267 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %268 = fadd contract float %266, %267
  store float %268, float addrspace(3)* %15, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %269 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %270 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %271 = fadd contract float %269, %270
  store float %271, float addrspace(3)* %7, align 4, !tbaa !5
  %272 = add nuw nsw i32 %6, 160
  %273 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %272
  %274 = load float, float addrspace(3)* %273, align 4, !tbaa !5
  %275 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %276 = fadd contract float %274, %275
  store float %276, float addrspace(3)* %9, align 4, !tbaa !5
  %277 = add nuw nsw i32 %6, 192
  %278 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %277
  %279 = load float, float addrspace(3)* %278, align 4, !tbaa !5
  %280 = load float, float addrspace(3)* %11, align 4, !tbaa !5
  %281 = fadd contract float %279, %280
  store float %281, float addrspace(3)* %11, align 4, !tbaa !5
  %282 = add nuw nsw i32 %6, 224
  %283 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %282
  %284 = load float, float addrspace(3)* %283, align 4, !tbaa !5
  %285 = load float, float addrspace(3)* %13, align 4, !tbaa !5
  %286 = fadd contract float %284, %285
  store float %286, float addrspace(3)* %13, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %287 = load float, float addrspace(3)* %11, align 4, !tbaa !5
  %288 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %289 = fadd contract float %287, %288
  store float %289, float addrspace(3)* %7, align 4, !tbaa !5
  %290 = add nuw nsw i32 %6, 96
  %291 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %290
  %292 = load float, float addrspace(3)* %291, align 4, !tbaa !5
  %293 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %294 = fadd contract float %292, %293
  store float %294, float addrspace(3)* %9, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %295 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %296 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %297 = fadd contract float %295, %296
  store float %297, float addrspace(3)* %7, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %298 = icmp eq i32 %6, 0
  br i1 %298, label %394, label %406

299:                                              ; preds = %239, %391
  %300 = phi i32 [ 1, %239 ], [ %392, %391 ]
  %301 = shl nuw nsw i32 %300, 4
  %302 = add nsw i32 %301, %67
  br i1 %241, label %303, label %391

303:                                              ; preds = %299
  %304 = add nsw i32 %302, 16
  %305 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %304
  %306 = load float, float addrspace(3)* %305, align 4, !tbaa !5
  %307 = add nsw i32 %302, -16
  %308 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %307
  %309 = load float, float addrspace(3)* %308, align 4, !tbaa !5
  %310 = fsub contract float %306, %309
  %311 = add nsw i32 %302, 1
  %312 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %311
  %313 = load float, float addrspace(3)* %312, align 4, !tbaa !5
  %314 = add nsw i32 %302, -1
  %315 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4data, i32 0, i32 %314
  %316 = load float, float addrspace(3)* %315, align 4, !tbaa !5
  %317 = fsub contract float %313, %316
  %318 = tail call float @llvm.fabs.f32(float %317)
  %319 = tail call float @llvm.fabs.f32(float %310)
  %320 = tail call float @llvm.minnum.f32(float %318, float %319)
  %321 = tail call float @llvm.maxnum.f32(float %318, float %319)
  %322 = fdiv float %320, %321, !fpmath !10
  %323 = fmul float %322, %322
  %324 = tail call float @llvm.fmuladd.f32(float %323, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %325 = tail call float @llvm.fmuladd.f32(float %323, float %324, float 0x3FA53F67E0000000)
  %326 = tail call float @llvm.fmuladd.f32(float %323, float %325, float 0xBFB2FA9AE0000000)
  %327 = tail call float @llvm.fmuladd.f32(float %323, float %326, float 0x3FBB263640000000)
  %328 = tail call float @llvm.fmuladd.f32(float %323, float %327, float 0xBFC22C1CC0000000)
  %329 = tail call float @llvm.fmuladd.f32(float %323, float %328, float 0x3FC99717E0000000)
  %330 = tail call float @llvm.fmuladd.f32(float %323, float %329, float 0xBFD5554C40000000)
  %331 = fmul float %323, %330
  %332 = tail call float @llvm.fmuladd.f32(float %322, float %331, float %322)
  %333 = fsub float 0x3FF921FB60000000, %332
  %334 = fcmp ogt float %319, %318
  %335 = select i1 %334, float %333, float %332
  %336 = fsub float 0x400921FB60000000, %335
  %337 = fcmp olt float %317, 0.000000e+00
  %338 = select i1 %337, float %336, float %335
  %339 = bitcast float %317 to i32
  %340 = icmp slt i32 %339, 0
  %341 = select i1 %340, float 0x400921FB60000000, float 0.000000e+00
  %342 = fcmp oeq float %310, 0.000000e+00
  %343 = select i1 %342, float %341, float %338
  %344 = select i1 %337, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %345 = fcmp oeq float %318, 0x7FF0000000000000
  %346 = fcmp oeq float %319, 0x7FF0000000000000
  %347 = and i1 %346, %345
  %348 = select i1 %347, float %344, float %343
  %349 = fcmp uno float %317, %310
  %350 = select i1 %349, float 0x7FF8000000000000, float %348
  %351 = tail call float @llvm.copysign.f32(float %350, float %310)
  %352 = fmul contract float %351, 1.600000e+01
  %353 = fdiv contract float %352, 0x400921FF20000000
  %354 = fadd contract float %353, 1.650000e+01
  %355 = fptosi float %354 to i32
  %356 = icmp eq i32 %355, 32
  %357 = select i1 %356, i32 0, i32 %355
  %358 = fmul contract float %317, %317
  %359 = fmul contract float %310, %310
  %360 = fadd contract float %359, %358
  %361 = fcmp olt float %360, 0x39F0000000000000
  %362 = select i1 %361, float 0x41F0000000000000, float 1.000000e+00
  %363 = fmul float %360, %362
  %364 = tail call float @llvm.sqrt.f32(float %363)
  %365 = bitcast float %364 to i32
  %366 = add nsw i32 %365, -1
  %367 = bitcast i32 %366 to float
  %368 = add nsw i32 %365, 1
  %369 = bitcast i32 %368 to float
  %370 = tail call i1 @llvm.amdgcn.class.f32(float %363, i32 608)
  %371 = select i1 %361, float 0x3EF0000000000000, float 1.000000e+00
  %372 = fneg float %369
  %373 = tail call float @llvm.fma.f32(float %372, float %364, float %363)
  %374 = fcmp ogt float %373, 0.000000e+00
  %375 = fneg float %367
  %376 = tail call float @llvm.fma.f32(float %375, float %364, float %363)
  %377 = fcmp ole float %376, 0.000000e+00
  %378 = select i1 %377, float %367, float %364
  %379 = select i1 %374, float %369, float %378
  %380 = fmul float %371, %379
  %381 = select i1 %370, float %363, float %380
  %382 = load float, float addrspace(3)* %242, align 4, !tbaa !5
  %383 = fmul contract float %382, %381
  %384 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE5gauss, i32 0, i32 %300
  %385 = load float, float addrspace(3)* %384, align 4, !tbaa !5
  %386 = fmul contract float %385, %383
  %387 = add nsw i32 %244, %357
  %388 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %387
  %389 = load float, float addrspace(3)* %388, align 4, !tbaa !5
  %390 = fadd contract float %389, %386
  store float %390, float addrspace(3)* %388, align 4, !tbaa !5
  br label %391

391:                                              ; preds = %303, %299
  %392 = add nuw nsw i32 %300, 1
  %393 = icmp eq i32 %392, 14
  br i1 %393, label %245, label %299, !llvm.loop !11

394:                                              ; preds = %245
  %395 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %396 = fmul contract float %395, 6.000000e+00
  %397 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 1), align 4, !tbaa !5
  %398 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %399 = fadd contract float %397, %398
  %400 = fmul contract float %399, 4.000000e+00
  %401 = fadd contract float %396, %400
  %402 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 2), align 8, !tbaa !5
  %403 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 30), align 8, !tbaa !5
  %404 = fadd contract float %402, %403
  %405 = fadd contract float %401, %404
  store float %405, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 32), align 16, !tbaa !5
  br label %406

406:                                              ; preds = %394, %245
  %407 = icmp eq i32 %6, 1
  br i1 %407, label %408, label %420

408:                                              ; preds = %406
  %409 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 1), align 4, !tbaa !5
  %410 = fmul contract float %409, 6.000000e+00
  %411 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 2), align 8, !tbaa !5
  %412 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %413 = fadd contract float %411, %412
  %414 = fmul contract float %413, 4.000000e+00
  %415 = fadd contract float %410, %414
  %416 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 3), align 4, !tbaa !5
  %417 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %418 = fadd contract float %416, %417
  %419 = fadd contract float %415, %418
  store float %419, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 33), align 4, !tbaa !5
  br label %420

420:                                              ; preds = %408, %406
  %421 = add nsw i32 %6, -2
  %422 = icmp ult i32 %421, 28
  br i1 %422, label %423, label %442

423:                                              ; preds = %420
  %424 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %425 = fmul contract float %424, 6.000000e+00
  %426 = add nuw nsw i32 %6, 1
  %427 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %426
  %428 = load float, float addrspace(3)* %427, align 4, !tbaa !5
  %429 = add nsw i32 %6, -1
  %430 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %429
  %431 = load float, float addrspace(3)* %430, align 4, !tbaa !5
  %432 = fadd contract float %428, %431
  %433 = fmul contract float %432, 4.000000e+00
  %434 = fadd contract float %425, %433
  %435 = add nuw nsw i32 %6, 2
  %436 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %435
  %437 = load float, float addrspace(3)* %436, align 4, !tbaa !5
  %438 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %421
  %439 = load float, float addrspace(3)* %438, align 4, !tbaa !5
  %440 = fadd contract float %437, %439
  %441 = fadd contract float %434, %440
  store float %441, float addrspace(3)* %9, align 4, !tbaa !5
  br label %442

442:                                              ; preds = %423, %420
  switch i32 %6, label %467 [
    i32 30, label %443
    i32 31, label %455
  ]

443:                                              ; preds = %442
  %444 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 30), align 8, !tbaa !5
  %445 = fmul contract float %444, 6.000000e+00
  %446 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %447 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 29), align 4, !tbaa !5
  %448 = fadd contract float %446, %447
  %449 = fmul contract float %448, 4.000000e+00
  %450 = fadd contract float %445, %449
  %451 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %452 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 28), align 16, !tbaa !5
  %453 = fadd contract float %451, %452
  %454 = fadd contract float %450, %453
  store float %454, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 62), align 8, !tbaa !5
  br label %467

455:                                              ; preds = %442
  %456 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %457 = fmul contract float %456, 6.000000e+00
  %458 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %459 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 30), align 8, !tbaa !5
  %460 = fadd contract float %458, %459
  %461 = fmul contract float %460, 4.000000e+00
  %462 = fadd contract float %457, %461
  %463 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 1), align 4, !tbaa !5
  %464 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 29), align 4, !tbaa !5
  %465 = fadd contract float %463, %464
  %466 = fadd contract float %462, %465
  store float %466, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 63), align 4, !tbaa !5
  br label %467

467:                                              ; preds = %443, %442, %455
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %468 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %469 = add nuw nsw i32 %6, 1
  %470 = and i32 %469, 31
  %471 = or i32 %470, 32
  %472 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %471
  %473 = load float, float addrspace(3)* %472, align 4, !tbaa !5
  %474 = fcmp contract ogt float %468, %473
  br i1 %474, label %475, label %483

475:                                              ; preds = %467
  %476 = add nuw nsw i32 %6, 31
  %477 = and i32 %476, 31
  %478 = or i32 %477, 32
  %479 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %478
  %480 = load float, float addrspace(3)* %479, align 4, !tbaa !5
  %481 = fcmp contract ult float %468, %480
  %482 = select i1 %481, float 0.000000e+00, float %468
  br label %483

483:                                              ; preds = %475, %467
  %484 = phi contract float [ 0.000000e+00, %467 ], [ %482, %475 ]
  store float %484, float addrspace(3)* %7, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %298, label %485, label %892

485:                                              ; preds = %483
  %486 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %487 = fcmp contract ule float %486, 0.000000e+00
  %488 = select i1 %487, float 0.000000e+00, float %486
  %489 = sext i1 %487 to i32
  %490 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 1), align 4, !tbaa !5
  %491 = fcmp contract ogt float %490, %488
  br i1 %491, label %496, label %492

492:                                              ; preds = %485
  %493 = fcmp contract ogt float %490, 0.000000e+00
  %494 = select i1 %493, float %490, float 0.000000e+00
  %495 = select i1 %493, i32 1, i32 -1
  br label %496

496:                                              ; preds = %492, %485
  %497 = phi float [ %490, %485 ], [ %488, %492 ]
  %498 = phi float [ %488, %485 ], [ %494, %492 ]
  %499 = phi i32 [ 1, %485 ], [ %489, %492 ]
  %500 = phi i32 [ %489, %485 ], [ %495, %492 ]
  %501 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 2), align 8, !tbaa !5
  %502 = fcmp contract ogt float %501, %497
  br i1 %502, label %507, label %503

503:                                              ; preds = %496
  %504 = fcmp contract ogt float %501, %498
  %505 = select i1 %504, float %501, float %498
  %506 = select i1 %504, i32 2, i32 %500
  br label %507

507:                                              ; preds = %503, %496
  %508 = phi float [ %501, %496 ], [ %497, %503 ]
  %509 = phi float [ %497, %496 ], [ %505, %503 ]
  %510 = phi i32 [ 2, %496 ], [ %499, %503 ]
  %511 = phi i32 [ %499, %496 ], [ %506, %503 ]
  %512 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 3), align 4, !tbaa !5
  %513 = fcmp contract ogt float %512, %508
  br i1 %513, label %518, label %514

514:                                              ; preds = %507
  %515 = fcmp contract ogt float %512, %509
  %516 = select i1 %515, float %512, float %509
  %517 = select i1 %515, i32 3, i32 %511
  br label %518

518:                                              ; preds = %514, %507
  %519 = phi float [ %512, %507 ], [ %508, %514 ]
  %520 = phi float [ %508, %507 ], [ %516, %514 ]
  %521 = phi i32 [ 3, %507 ], [ %510, %514 ]
  %522 = phi i32 [ %510, %507 ], [ %517, %514 ]
  %523 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 4), align 16, !tbaa !5
  %524 = fcmp contract ogt float %523, %519
  br i1 %524, label %529, label %525

525:                                              ; preds = %518
  %526 = fcmp contract ogt float %523, %520
  %527 = select i1 %526, float %523, float %520
  %528 = select i1 %526, i32 4, i32 %522
  br label %529

529:                                              ; preds = %525, %518
  %530 = phi float [ %523, %518 ], [ %519, %525 ]
  %531 = phi float [ %519, %518 ], [ %527, %525 ]
  %532 = phi i32 [ 4, %518 ], [ %521, %525 ]
  %533 = phi i32 [ %521, %518 ], [ %528, %525 ]
  %534 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 5), align 4, !tbaa !5
  %535 = fcmp contract ogt float %534, %530
  br i1 %535, label %540, label %536

536:                                              ; preds = %529
  %537 = fcmp contract ogt float %534, %531
  %538 = select i1 %537, float %534, float %531
  %539 = select i1 %537, i32 5, i32 %533
  br label %540

540:                                              ; preds = %536, %529
  %541 = phi float [ %534, %529 ], [ %530, %536 ]
  %542 = phi float [ %530, %529 ], [ %538, %536 ]
  %543 = phi i32 [ 5, %529 ], [ %532, %536 ]
  %544 = phi i32 [ %532, %529 ], [ %539, %536 ]
  %545 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 6), align 8, !tbaa !5
  %546 = fcmp contract ogt float %545, %541
  br i1 %546, label %551, label %547

547:                                              ; preds = %540
  %548 = fcmp contract ogt float %545, %542
  %549 = select i1 %548, float %545, float %542
  %550 = select i1 %548, i32 6, i32 %544
  br label %551

551:                                              ; preds = %547, %540
  %552 = phi float [ %545, %540 ], [ %541, %547 ]
  %553 = phi float [ %541, %540 ], [ %549, %547 ]
  %554 = phi i32 [ 6, %540 ], [ %543, %547 ]
  %555 = phi i32 [ %543, %540 ], [ %550, %547 ]
  %556 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 7), align 4, !tbaa !5
  %557 = fcmp contract ogt float %556, %552
  br i1 %557, label %562, label %558

558:                                              ; preds = %551
  %559 = fcmp contract ogt float %556, %553
  %560 = select i1 %559, float %556, float %553
  %561 = select i1 %559, i32 7, i32 %555
  br label %562

562:                                              ; preds = %558, %551
  %563 = phi float [ %556, %551 ], [ %552, %558 ]
  %564 = phi float [ %552, %551 ], [ %560, %558 ]
  %565 = phi i32 [ 7, %551 ], [ %554, %558 ]
  %566 = phi i32 [ %554, %551 ], [ %561, %558 ]
  %567 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 8), align 16, !tbaa !5
  %568 = fcmp contract ogt float %567, %563
  br i1 %568, label %573, label %569

569:                                              ; preds = %562
  %570 = fcmp contract ogt float %567, %564
  %571 = select i1 %570, float %567, float %564
  %572 = select i1 %570, i32 8, i32 %566
  br label %573

573:                                              ; preds = %569, %562
  %574 = phi float [ %567, %562 ], [ %563, %569 ]
  %575 = phi float [ %563, %562 ], [ %571, %569 ]
  %576 = phi i32 [ 8, %562 ], [ %565, %569 ]
  %577 = phi i32 [ %565, %562 ], [ %572, %569 ]
  %578 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 9), align 4, !tbaa !5
  %579 = fcmp contract ogt float %578, %574
  br i1 %579, label %584, label %580

580:                                              ; preds = %573
  %581 = fcmp contract ogt float %578, %575
  %582 = select i1 %581, float %578, float %575
  %583 = select i1 %581, i32 9, i32 %577
  br label %584

584:                                              ; preds = %580, %573
  %585 = phi float [ %578, %573 ], [ %574, %580 ]
  %586 = phi float [ %574, %573 ], [ %582, %580 ]
  %587 = phi i32 [ 9, %573 ], [ %576, %580 ]
  %588 = phi i32 [ %576, %573 ], [ %583, %580 ]
  %589 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 10), align 8, !tbaa !5
  %590 = fcmp contract ogt float %589, %585
  br i1 %590, label %595, label %591

591:                                              ; preds = %584
  %592 = fcmp contract ogt float %589, %586
  %593 = select i1 %592, float %589, float %586
  %594 = select i1 %592, i32 10, i32 %588
  br label %595

595:                                              ; preds = %591, %584
  %596 = phi float [ %589, %584 ], [ %585, %591 ]
  %597 = phi float [ %585, %584 ], [ %593, %591 ]
  %598 = phi i32 [ 10, %584 ], [ %587, %591 ]
  %599 = phi i32 [ %587, %584 ], [ %594, %591 ]
  %600 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 11), align 4, !tbaa !5
  %601 = fcmp contract ogt float %600, %596
  br i1 %601, label %606, label %602

602:                                              ; preds = %595
  %603 = fcmp contract ogt float %600, %597
  %604 = select i1 %603, float %600, float %597
  %605 = select i1 %603, i32 11, i32 %599
  br label %606

606:                                              ; preds = %602, %595
  %607 = phi float [ %600, %595 ], [ %596, %602 ]
  %608 = phi float [ %596, %595 ], [ %604, %602 ]
  %609 = phi i32 [ 11, %595 ], [ %598, %602 ]
  %610 = phi i32 [ %598, %595 ], [ %605, %602 ]
  %611 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 12), align 16, !tbaa !5
  %612 = fcmp contract ogt float %611, %607
  br i1 %612, label %617, label %613

613:                                              ; preds = %606
  %614 = fcmp contract ogt float %611, %608
  %615 = select i1 %614, float %611, float %608
  %616 = select i1 %614, i32 12, i32 %610
  br label %617

617:                                              ; preds = %613, %606
  %618 = phi float [ %611, %606 ], [ %607, %613 ]
  %619 = phi float [ %607, %606 ], [ %615, %613 ]
  %620 = phi i32 [ 12, %606 ], [ %609, %613 ]
  %621 = phi i32 [ %609, %606 ], [ %616, %613 ]
  %622 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 13), align 4, !tbaa !5
  %623 = fcmp contract ogt float %622, %618
  br i1 %623, label %628, label %624

624:                                              ; preds = %617
  %625 = fcmp contract ogt float %622, %619
  %626 = select i1 %625, float %622, float %619
  %627 = select i1 %625, i32 13, i32 %621
  br label %628

628:                                              ; preds = %624, %617
  %629 = phi float [ %622, %617 ], [ %618, %624 ]
  %630 = phi float [ %618, %617 ], [ %626, %624 ]
  %631 = phi i32 [ 13, %617 ], [ %620, %624 ]
  %632 = phi i32 [ %620, %617 ], [ %627, %624 ]
  %633 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 14), align 8, !tbaa !5
  %634 = fcmp contract ogt float %633, %629
  br i1 %634, label %639, label %635

635:                                              ; preds = %628
  %636 = fcmp contract ogt float %633, %630
  %637 = select i1 %636, float %633, float %630
  %638 = select i1 %636, i32 14, i32 %632
  br label %639

639:                                              ; preds = %635, %628
  %640 = phi float [ %633, %628 ], [ %629, %635 ]
  %641 = phi float [ %629, %628 ], [ %637, %635 ]
  %642 = phi i32 [ 14, %628 ], [ %631, %635 ]
  %643 = phi i32 [ %631, %628 ], [ %638, %635 ]
  %644 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 15), align 4, !tbaa !5
  %645 = fcmp contract ogt float %644, %640
  br i1 %645, label %650, label %646

646:                                              ; preds = %639
  %647 = fcmp contract ogt float %644, %641
  %648 = select i1 %647, float %644, float %641
  %649 = select i1 %647, i32 15, i32 %643
  br label %650

650:                                              ; preds = %646, %639
  %651 = phi float [ %644, %639 ], [ %640, %646 ]
  %652 = phi float [ %640, %639 ], [ %648, %646 ]
  %653 = phi i32 [ 15, %639 ], [ %642, %646 ]
  %654 = phi i32 [ %642, %639 ], [ %649, %646 ]
  %655 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 16), align 16, !tbaa !5
  %656 = fcmp contract ogt float %655, %651
  br i1 %656, label %661, label %657

657:                                              ; preds = %650
  %658 = fcmp contract ogt float %655, %652
  %659 = select i1 %658, float %655, float %652
  %660 = select i1 %658, i32 16, i32 %654
  br label %661

661:                                              ; preds = %657, %650
  %662 = phi float [ %655, %650 ], [ %651, %657 ]
  %663 = phi float [ %651, %650 ], [ %659, %657 ]
  %664 = phi i32 [ 16, %650 ], [ %653, %657 ]
  %665 = phi i32 [ %653, %650 ], [ %660, %657 ]
  %666 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 17), align 4, !tbaa !5
  %667 = fcmp contract ogt float %666, %662
  br i1 %667, label %672, label %668

668:                                              ; preds = %661
  %669 = fcmp contract ogt float %666, %663
  %670 = select i1 %669, float %666, float %663
  %671 = select i1 %669, i32 17, i32 %665
  br label %672

672:                                              ; preds = %668, %661
  %673 = phi float [ %666, %661 ], [ %662, %668 ]
  %674 = phi float [ %662, %661 ], [ %670, %668 ]
  %675 = phi i32 [ 17, %661 ], [ %664, %668 ]
  %676 = phi i32 [ %664, %661 ], [ %671, %668 ]
  %677 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 18), align 8, !tbaa !5
  %678 = fcmp contract ogt float %677, %673
  br i1 %678, label %683, label %679

679:                                              ; preds = %672
  %680 = fcmp contract ogt float %677, %674
  %681 = select i1 %680, float %677, float %674
  %682 = select i1 %680, i32 18, i32 %676
  br label %683

683:                                              ; preds = %679, %672
  %684 = phi float [ %677, %672 ], [ %673, %679 ]
  %685 = phi float [ %673, %672 ], [ %681, %679 ]
  %686 = phi i32 [ 18, %672 ], [ %675, %679 ]
  %687 = phi i32 [ %675, %672 ], [ %682, %679 ]
  %688 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 19), align 4, !tbaa !5
  %689 = fcmp contract ogt float %688, %684
  br i1 %689, label %694, label %690

690:                                              ; preds = %683
  %691 = fcmp contract ogt float %688, %685
  %692 = select i1 %691, float %688, float %685
  %693 = select i1 %691, i32 19, i32 %687
  br label %694

694:                                              ; preds = %690, %683
  %695 = phi float [ %688, %683 ], [ %684, %690 ]
  %696 = phi float [ %684, %683 ], [ %692, %690 ]
  %697 = phi i32 [ 19, %683 ], [ %686, %690 ]
  %698 = phi i32 [ %686, %683 ], [ %693, %690 ]
  %699 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 20), align 16, !tbaa !5
  %700 = fcmp contract ogt float %699, %695
  br i1 %700, label %705, label %701

701:                                              ; preds = %694
  %702 = fcmp contract ogt float %699, %696
  %703 = select i1 %702, float %699, float %696
  %704 = select i1 %702, i32 20, i32 %698
  br label %705

705:                                              ; preds = %701, %694
  %706 = phi float [ %699, %694 ], [ %695, %701 ]
  %707 = phi float [ %695, %694 ], [ %703, %701 ]
  %708 = phi i32 [ 20, %694 ], [ %697, %701 ]
  %709 = phi i32 [ %697, %694 ], [ %704, %701 ]
  %710 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 21), align 4, !tbaa !5
  %711 = fcmp contract ogt float %710, %706
  br i1 %711, label %716, label %712

712:                                              ; preds = %705
  %713 = fcmp contract ogt float %710, %707
  %714 = select i1 %713, float %710, float %707
  %715 = select i1 %713, i32 21, i32 %709
  br label %716

716:                                              ; preds = %712, %705
  %717 = phi float [ %710, %705 ], [ %706, %712 ]
  %718 = phi float [ %706, %705 ], [ %714, %712 ]
  %719 = phi i32 [ 21, %705 ], [ %708, %712 ]
  %720 = phi i32 [ %708, %705 ], [ %715, %712 ]
  %721 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 22), align 8, !tbaa !5
  %722 = fcmp contract ogt float %721, %717
  br i1 %722, label %727, label %723

723:                                              ; preds = %716
  %724 = fcmp contract ogt float %721, %718
  %725 = select i1 %724, float %721, float %718
  %726 = select i1 %724, i32 22, i32 %720
  br label %727

727:                                              ; preds = %723, %716
  %728 = phi float [ %721, %716 ], [ %717, %723 ]
  %729 = phi float [ %717, %716 ], [ %725, %723 ]
  %730 = phi i32 [ 22, %716 ], [ %719, %723 ]
  %731 = phi i32 [ %719, %716 ], [ %726, %723 ]
  %732 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 23), align 4, !tbaa !5
  %733 = fcmp contract ogt float %732, %728
  br i1 %733, label %738, label %734

734:                                              ; preds = %727
  %735 = fcmp contract ogt float %732, %729
  %736 = select i1 %735, float %732, float %729
  %737 = select i1 %735, i32 23, i32 %731
  br label %738

738:                                              ; preds = %734, %727
  %739 = phi float [ %732, %727 ], [ %728, %734 ]
  %740 = phi float [ %728, %727 ], [ %736, %734 ]
  %741 = phi i32 [ 23, %727 ], [ %730, %734 ]
  %742 = phi i32 [ %730, %727 ], [ %737, %734 ]
  %743 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 24), align 16, !tbaa !5
  %744 = fcmp contract ogt float %743, %739
  br i1 %744, label %749, label %745

745:                                              ; preds = %738
  %746 = fcmp contract ogt float %743, %740
  %747 = select i1 %746, float %743, float %740
  %748 = select i1 %746, i32 24, i32 %742
  br label %749

749:                                              ; preds = %745, %738
  %750 = phi float [ %743, %738 ], [ %739, %745 ]
  %751 = phi float [ %739, %738 ], [ %747, %745 ]
  %752 = phi i32 [ 24, %738 ], [ %741, %745 ]
  %753 = phi i32 [ %741, %738 ], [ %748, %745 ]
  %754 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 25), align 4, !tbaa !5
  %755 = fcmp contract ogt float %754, %750
  br i1 %755, label %760, label %756

756:                                              ; preds = %749
  %757 = fcmp contract ogt float %754, %751
  %758 = select i1 %757, float %754, float %751
  %759 = select i1 %757, i32 25, i32 %753
  br label %760

760:                                              ; preds = %756, %749
  %761 = phi float [ %754, %749 ], [ %750, %756 ]
  %762 = phi float [ %750, %749 ], [ %758, %756 ]
  %763 = phi i32 [ 25, %749 ], [ %752, %756 ]
  %764 = phi i32 [ %752, %749 ], [ %759, %756 ]
  %765 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 26), align 8, !tbaa !5
  %766 = fcmp contract ogt float %765, %761
  br i1 %766, label %771, label %767

767:                                              ; preds = %760
  %768 = fcmp contract ogt float %765, %762
  %769 = select i1 %768, float %765, float %762
  %770 = select i1 %768, i32 26, i32 %764
  br label %771

771:                                              ; preds = %767, %760
  %772 = phi float [ %765, %760 ], [ %761, %767 ]
  %773 = phi float [ %761, %760 ], [ %769, %767 ]
  %774 = phi i32 [ 26, %760 ], [ %763, %767 ]
  %775 = phi i32 [ %763, %760 ], [ %770, %767 ]
  %776 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 27), align 4, !tbaa !5
  %777 = fcmp contract ogt float %776, %772
  br i1 %777, label %782, label %778

778:                                              ; preds = %771
  %779 = fcmp contract ogt float %776, %773
  %780 = select i1 %779, float %776, float %773
  %781 = select i1 %779, i32 27, i32 %775
  br label %782

782:                                              ; preds = %778, %771
  %783 = phi float [ %776, %771 ], [ %772, %778 ]
  %784 = phi float [ %772, %771 ], [ %780, %778 ]
  %785 = phi i32 [ 27, %771 ], [ %774, %778 ]
  %786 = phi i32 [ %774, %771 ], [ %781, %778 ]
  %787 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 28), align 16, !tbaa !5
  %788 = fcmp contract ogt float %787, %783
  br i1 %788, label %793, label %789

789:                                              ; preds = %782
  %790 = fcmp contract ogt float %787, %784
  %791 = select i1 %790, float %787, float %784
  %792 = select i1 %790, i32 28, i32 %786
  br label %793

793:                                              ; preds = %789, %782
  %794 = phi float [ %787, %782 ], [ %783, %789 ]
  %795 = phi float [ %783, %782 ], [ %791, %789 ]
  %796 = phi i32 [ 28, %782 ], [ %785, %789 ]
  %797 = phi i32 [ %785, %782 ], [ %792, %789 ]
  %798 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 29), align 4, !tbaa !5
  %799 = fcmp contract ogt float %798, %794
  br i1 %799, label %804, label %800

800:                                              ; preds = %793
  %801 = fcmp contract ogt float %798, %795
  %802 = select i1 %801, float %798, float %795
  %803 = select i1 %801, i32 29, i32 %797
  br label %804

804:                                              ; preds = %800, %793
  %805 = phi float [ %798, %793 ], [ %794, %800 ]
  %806 = phi float [ %794, %793 ], [ %802, %800 ]
  %807 = phi i32 [ 29, %793 ], [ %796, %800 ]
  %808 = phi i32 [ %796, %793 ], [ %803, %800 ]
  %809 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 30), align 8, !tbaa !5
  %810 = fcmp contract ogt float %809, %805
  br i1 %810, label %815, label %811

811:                                              ; preds = %804
  %812 = fcmp contract ogt float %809, %806
  %813 = select i1 %812, float %809, float %806
  %814 = select i1 %812, i32 30, i32 %808
  br label %815

815:                                              ; preds = %811, %804
  %816 = phi float [ %809, %804 ], [ %805, %811 ]
  %817 = phi float [ %805, %804 ], [ %813, %811 ]
  %818 = phi i32 [ 30, %804 ], [ %807, %811 ]
  %819 = phi i32 [ %807, %804 ], [ %814, %811 ]
  %820 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %821 = fcmp contract ogt float %820, %816
  br i1 %821, label %826, label %822

822:                                              ; preds = %815
  %823 = fcmp contract ogt float %820, %817
  %824 = select i1 %823, float %820, float %817
  %825 = select i1 %823, i32 31, i32 %819
  br label %826

826:                                              ; preds = %822, %815
  %827 = phi float [ %820, %815 ], [ %816, %822 ]
  %828 = phi float [ %816, %815 ], [ %824, %822 ]
  %829 = phi i32 [ 31, %815 ], [ %818, %822 ]
  %830 = phi i32 [ %818, %815 ], [ %825, %822 ]
  %831 = add nsw i32 %829, 1
  %832 = and i32 %831, 31
  %833 = or i32 %832, 32
  %834 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %833
  %835 = load float, float addrspace(3)* %834, align 4, !tbaa !5
  %836 = add nsw i32 %829, 31
  %837 = and i32 %836, 31
  %838 = or i32 %837, 32
  %839 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %838
  %840 = load float, float addrspace(3)* %839, align 4, !tbaa !5
  %841 = sitofp i32 %829 to float
  %842 = fsub contract float %835, %840
  %843 = fmul contract float %842, 5.000000e-01
  %844 = fmul contract float %827, 2.000000e+00
  %845 = fsub contract float %844, %835
  %846 = fsub contract float %845, %840
  %847 = fdiv contract float %843, %846
  %848 = fadd contract float %847, %841
  %849 = fcmp contract olt float %848, 0.000000e+00
  %850 = fadd contract float %848, 3.200000e+01
  %851 = select contract i1 %849, float %850, float %848
  %852 = fmul contract float %851, 1.125000e+01
  %853 = mul nsw i32 %2, 5
  %854 = add nsw i32 %853, %32
  %855 = sext i32 %854 to i64
  %856 = getelementptr inbounds float, float addrspace(1)* %1, i64 %855
  store float %852, float addrspace(1)* %856, align 4, !tbaa !5
  %857 = fmul contract float %827, 0x3FE99999A0000000
  %858 = fcmp contract olt float %828, %857
  %859 = select i1 %858, i32 -1, i32 %830
  %860 = icmp sgt i32 %859, -1
  br i1 %860, label %861, label %884

861:                                              ; preds = %826
  %862 = add nuw nsw i32 %859, 1
  %863 = and i32 %862, 31
  %864 = or i32 %863, 32
  %865 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %864
  %866 = load float, float addrspace(3)* %865, align 4, !tbaa !5
  %867 = add nuw nsw i32 %859, 31
  %868 = and i32 %867, 31
  %869 = or i32 %868, 32
  %870 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfS_iiiE4hist, i32 0, i32 %869
  %871 = load float, float addrspace(3)* %870, align 4, !tbaa !5
  %872 = sitofp i32 %859 to float
  %873 = fsub contract float %866, %871
  %874 = fmul contract float %873, 5.000000e-01
  %875 = fmul contract float %828, 2.000000e+00
  %876 = fsub contract float %875, %866
  %877 = fsub contract float %876, %871
  %878 = fdiv contract float %874, %877
  %879 = fadd contract float %878, %872
  %880 = fcmp contract olt float %879, 0.000000e+00
  %881 = fadd contract float %879, 3.200000e+01
  %882 = select contract i1 %880, float %881, float %879
  %883 = fmul contract float %882, 1.125000e+01
  br label %886

884:                                              ; preds = %826
  %885 = sitofp i32 %859 to float
  br label %886

886:                                              ; preds = %884, %861
  %887 = phi float [ %883, %861 ], [ %885, %884 ]
  %888 = mul nsw i32 %2, 6
  %889 = add nsw i32 %888, %32
  %890 = sext i32 %889 to i64
  %891 = getelementptr inbounds float, float addrspace(1)* %1, i64 %890
  store float %887, float addrspace(1)* %891, align 4, !tbaa !5
  br label %892

892:                                              ; preds = %886, %483
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!10 = !{float 2.500000e+00}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
