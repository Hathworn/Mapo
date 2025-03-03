; ModuleID = '../data/hip_kernels/15845/19/main.cu'
source_filename = "../data/hip_kernels/15845/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19ComputeOrientationsPfPiS_iiiE4data = internal unnamed_addr addrspace(3) global [240 x float] undef, align 16
@_ZZ19ComputeOrientationsPfPiS_iiiE4hist = internal unnamed_addr addrspace(3) global [416 x float] undef, align 16
@_ZZ19ComputeOrientationsPfPiS_iiiE5gauss = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19ComputeOrientationsPfPiS_iii(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %7
  store float 0.000000e+00, float addrspace(3)* %8, align 4, !tbaa !5
  %9 = add nuw nsw i32 %7, 32
  %10 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %9
  store float 0.000000e+00, float addrspace(3)* %10, align 4, !tbaa !5
  %11 = add nuw nsw i32 %7, 64
  %12 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %11
  store float 0.000000e+00, float addrspace(3)* %12, align 4, !tbaa !5
  %13 = add nuw nsw i32 %7, 96
  %14 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %13
  store float 0.000000e+00, float addrspace(3)* %14, align 4, !tbaa !5
  %15 = add nuw nsw i32 %7, 128
  %16 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %15
  store float 0.000000e+00, float addrspace(3)* %16, align 4, !tbaa !5
  %17 = add nuw nsw i32 %7, 160
  %18 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %17
  store float 0.000000e+00, float addrspace(3)* %18, align 4, !tbaa !5
  %19 = add nuw nsw i32 %7, 192
  %20 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %19
  store float 0.000000e+00, float addrspace(3)* %20, align 4, !tbaa !5
  %21 = add nuw nsw i32 %7, 224
  %22 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %21
  store float 0.000000e+00, float addrspace(3)* %22, align 4, !tbaa !5
  %23 = add nuw nsw i32 %7, 256
  %24 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %23
  store float 0.000000e+00, float addrspace(3)* %24, align 4, !tbaa !5
  %25 = add nuw nsw i32 %7, 288
  %26 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %25
  store float 0.000000e+00, float addrspace(3)* %26, align 4, !tbaa !5
  %27 = add nuw nsw i32 %7, 320
  %28 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %27
  store float 0.000000e+00, float addrspace(3)* %28, align 4, !tbaa !5
  %29 = add nuw nsw i32 %7, 352
  %30 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %29
  store float 0.000000e+00, float addrspace(3)* %30, align 4, !tbaa !5
  %31 = add nuw nsw i32 %7, 384
  %32 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %31
  store float 0.000000e+00, float addrspace(3)* %32, align 4, !tbaa !5
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp ult i32 %7, 15
  br i1 %34, label %35, label %55

35:                                               ; preds = %6
  %36 = add nsw i32 %7, -7
  %37 = sitofp i32 %36 to float
  %38 = fmul contract float %37, 0xBFAC71C720000000
  %39 = fmul contract float %38, %37
  %40 = fmul float %39, 0x3FF7154760000000
  %41 = tail call float @llvm.rint.f32(float %40)
  %42 = fcmp ogt float %39, 0x40562E4300000000
  %43 = fcmp olt float %39, 0xC059D1DA00000000
  %44 = fneg float %40
  %45 = tail call float @llvm.fma.f32(float %39, float 0x3FF7154760000000, float %44)
  %46 = tail call float @llvm.fma.f32(float %39, float 0x3E54AE0BE0000000, float %45)
  %47 = fsub float %40, %41
  %48 = fadd float %46, %47
  %49 = tail call float @llvm.exp2.f32(float %48)
  %50 = fptosi float %41 to i32
  %51 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 %50)
  %52 = select i1 %43, float 0.000000e+00, float %51
  %53 = select i1 %42, float 0x7FF0000000000000, float %52
  %54 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE5gauss, i32 0, i32 %7
  store float %53, float addrspace(3)* %54, align 4, !tbaa !5
  br label %55

55:                                               ; preds = %35, %6
  %56 = sext i32 %33 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !9, !amdgpu.noclobber !11
  %59 = freeze i32 %58
  %60 = freeze i32 %4
  %61 = sdiv i32 %59, %60
  %62 = mul i32 %61, %60
  %63 = sub i32 %59, %62
  %64 = add nsw i32 %63, -7
  %65 = and i32 %64, 15
  %66 = sub nsw i32 %7, %65
  %67 = add nsw i32 %66, %64
  %68 = tail call i32 @llvm.smax.i32(i32 %67, i32 0)
  %69 = icmp ult i32 %66, 15
  %70 = add nsw i32 %5, -1
  %71 = icmp slt i32 %68, %4
  %72 = add nsw i32 %4, -1
  %73 = select i1 %71, i32 %68, i32 %72
  %74 = tail call i32 @llvm.smax.i32(i32 %61, i32 7)
  %75 = add nsw i32 %74, -7
  br i1 %69, label %76, label %238

76:                                               ; preds = %55
  %77 = icmp slt i32 %75, %5
  %78 = select i1 %77, i32 %75, i32 %70
  %79 = mul nsw i32 %78, %4
  %80 = add nsw i32 %79, %73
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !11
  %84 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %66
  store float %83, float addrspace(3)* %84, align 4, !tbaa !5
  %85 = tail call i32 @llvm.smax.i32(i32 %61, i32 6)
  %86 = add nsw i32 %85, -6
  %87 = icmp slt i32 %86, %5
  %88 = select i1 %87, i32 %86, i32 %70
  %89 = add nuw nsw i32 %66, 16
  %90 = mul nsw i32 %88, %4
  %91 = add nsw i32 %90, %73
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !11
  %95 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %89
  store float %94, float addrspace(3)* %95, align 4, !tbaa !5
  %96 = tail call i32 @llvm.smax.i32(i32 %61, i32 5)
  %97 = add nsw i32 %96, -5
  %98 = icmp slt i32 %97, %5
  %99 = select i1 %98, i32 %97, i32 %70
  %100 = add nuw nsw i32 %66, 32
  %101 = mul nsw i32 %99, %4
  %102 = add nsw i32 %101, %73
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !11
  %106 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %100
  store float %105, float addrspace(3)* %106, align 4, !tbaa !5
  %107 = tail call i32 @llvm.smax.i32(i32 %61, i32 4)
  %108 = add nsw i32 %107, -4
  %109 = icmp slt i32 %108, %5
  %110 = select i1 %109, i32 %108, i32 %70
  %111 = add nuw nsw i32 %66, 48
  %112 = mul nsw i32 %110, %4
  %113 = add nsw i32 %112, %73
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !11
  %117 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %111
  store float %116, float addrspace(3)* %117, align 4, !tbaa !5
  %118 = tail call i32 @llvm.smax.i32(i32 %61, i32 3)
  %119 = add nsw i32 %118, -3
  %120 = icmp slt i32 %119, %5
  %121 = select i1 %120, i32 %119, i32 %70
  %122 = add nuw nsw i32 %66, 64
  %123 = mul nsw i32 %121, %4
  %124 = add nsw i32 %123, %73
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !11
  %128 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %122
  store float %127, float addrspace(3)* %128, align 4, !tbaa !5
  %129 = tail call i32 @llvm.smax.i32(i32 %61, i32 2)
  %130 = add nsw i32 %129, -2
  %131 = icmp slt i32 %130, %5
  %132 = select i1 %131, i32 %130, i32 %70
  %133 = add nuw nsw i32 %66, 80
  %134 = mul nsw i32 %132, %4
  %135 = add nsw i32 %134, %73
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5, !amdgpu.noclobber !11
  %139 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %133
  store float %138, float addrspace(3)* %139, align 4, !tbaa !5
  %140 = tail call i32 @llvm.smax.i32(i32 %61, i32 1)
  %141 = add nsw i32 %140, -1
  %142 = icmp sgt i32 %140, %5
  %143 = select i1 %142, i32 %70, i32 %141
  %144 = add nuw nsw i32 %66, 96
  %145 = mul nsw i32 %143, %4
  %146 = add nsw i32 %145, %73
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !5, !amdgpu.noclobber !11
  %150 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %144
  store float %149, float addrspace(3)* %150, align 4, !tbaa !5
  %151 = tail call i32 @llvm.smax.i32(i32 %61, i32 0)
  %152 = icmp slt i32 %151, %5
  %153 = select i1 %152, i32 %151, i32 %70
  %154 = add nuw nsw i32 %66, 112
  %155 = mul nsw i32 %153, %4
  %156 = add nsw i32 %155, %73
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !5, !amdgpu.noclobber !11
  %160 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %154
  store float %159, float addrspace(3)* %160, align 4, !tbaa !5
  %161 = tail call i32 @llvm.smax.i32(i32 %61, i32 -1)
  %162 = add nsw i32 %161, 1
  %163 = icmp slt i32 %162, %5
  %164 = select i1 %163, i32 %162, i32 %70
  %165 = add nuw nsw i32 %66, 128
  %166 = mul nsw i32 %164, %4
  %167 = add nsw i32 %166, %73
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !5, !amdgpu.noclobber !11
  %171 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %165
  store float %170, float addrspace(3)* %171, align 4, !tbaa !5
  %172 = tail call i32 @llvm.smax.i32(i32 %61, i32 -2)
  %173 = add nsw i32 %172, 2
  %174 = icmp slt i32 %173, %5
  %175 = select i1 %174, i32 %173, i32 %70
  %176 = add nuw nsw i32 %66, 144
  %177 = mul nsw i32 %175, %4
  %178 = add nsw i32 %177, %73
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !5, !amdgpu.noclobber !11
  %182 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %176
  store float %181, float addrspace(3)* %182, align 4, !tbaa !5
  %183 = tail call i32 @llvm.smax.i32(i32 %61, i32 -3)
  %184 = add nsw i32 %183, 3
  %185 = icmp slt i32 %184, %5
  %186 = select i1 %185, i32 %184, i32 %70
  %187 = add nuw nsw i32 %66, 160
  %188 = mul nsw i32 %186, %4
  %189 = add nsw i32 %188, %73
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %0, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !5, !amdgpu.noclobber !11
  %193 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %187
  store float %192, float addrspace(3)* %193, align 4, !tbaa !5
  %194 = tail call i32 @llvm.smax.i32(i32 %61, i32 -4)
  %195 = add nsw i32 %194, 4
  %196 = icmp slt i32 %195, %5
  %197 = select i1 %196, i32 %195, i32 %70
  %198 = add nuw nsw i32 %66, 176
  %199 = mul nsw i32 %197, %4
  %200 = add nsw i32 %199, %73
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !5, !amdgpu.noclobber !11
  %204 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %198
  store float %203, float addrspace(3)* %204, align 4, !tbaa !5
  %205 = tail call i32 @llvm.smax.i32(i32 %61, i32 -5)
  %206 = add nsw i32 %205, 5
  %207 = icmp slt i32 %206, %5
  %208 = select i1 %207, i32 %206, i32 %70
  %209 = add nuw nsw i32 %66, 192
  %210 = mul nsw i32 %208, %4
  %211 = add nsw i32 %210, %73
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %0, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !5, !amdgpu.noclobber !11
  %215 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %209
  store float %214, float addrspace(3)* %215, align 4, !tbaa !5
  %216 = tail call i32 @llvm.smax.i32(i32 %61, i32 -6)
  %217 = add nsw i32 %216, 6
  %218 = icmp slt i32 %217, %5
  %219 = select i1 %218, i32 %217, i32 %70
  %220 = add nuw nsw i32 %66, 208
  %221 = mul nsw i32 %219, %4
  %222 = add nsw i32 %221, %73
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %0, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !5, !amdgpu.noclobber !11
  %226 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %220
  store float %225, float addrspace(3)* %226, align 4, !tbaa !5
  %227 = tail call i32 @llvm.smax.i32(i32 %61, i32 -7)
  %228 = add nsw i32 %227, 7
  %229 = icmp slt i32 %228, %5
  %230 = select i1 %229, i32 %228, i32 %70
  %231 = add nuw nsw i32 %66, 224
  %232 = mul nsw i32 %230, %4
  %233 = add nsw i32 %232, %73
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %0, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !5, !amdgpu.noclobber !11
  %237 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %231
  store float %236, float addrspace(3)* %237, align 4, !tbaa !5
  br label %238

238:                                              ; preds = %55, %76
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %239 = add nsw i32 %66, -1
  %240 = icmp ult i32 %239, 13
  %241 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE5gauss, i32 0, i32 %66
  %242 = shl nuw nsw i32 %66, 5
  %243 = add nsw i32 %242, -32
  br label %298

244:                                              ; preds = %390
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %245 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %246 = load float, float addrspace(3)* %8, align 4, !tbaa !5
  %247 = fadd contract float %245, %246
  store float %247, float addrspace(3)* %8, align 4, !tbaa !5
  %248 = add nuw nsw i32 %7, 288
  %249 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %248
  %250 = load float, float addrspace(3)* %249, align 4, !tbaa !5
  %251 = load float, float addrspace(3)* %10, align 4, !tbaa !5
  %252 = fadd contract float %250, %251
  store float %252, float addrspace(3)* %10, align 4, !tbaa !5
  %253 = add nuw nsw i32 %7, 320
  %254 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %253
  %255 = load float, float addrspace(3)* %254, align 4, !tbaa !5
  %256 = load float, float addrspace(3)* %12, align 4, !tbaa !5
  %257 = fadd contract float %255, %256
  store float %257, float addrspace(3)* %12, align 4, !tbaa !5
  %258 = add nuw nsw i32 %7, 352
  %259 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %258
  %260 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %261 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %262 = fadd contract float %260, %261
  store float %262, float addrspace(3)* %14, align 4, !tbaa !5
  %263 = add nuw nsw i32 %7, 384
  %264 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %263
  %265 = load float, float addrspace(3)* %264, align 4, !tbaa !5
  %266 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %267 = fadd contract float %265, %266
  store float %267, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %268 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %269 = load float, float addrspace(3)* %8, align 4, !tbaa !5
  %270 = fadd contract float %268, %269
  store float %270, float addrspace(3)* %8, align 4, !tbaa !5
  %271 = add nuw nsw i32 %7, 160
  %272 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %271
  %273 = load float, float addrspace(3)* %272, align 4, !tbaa !5
  %274 = load float, float addrspace(3)* %10, align 4, !tbaa !5
  %275 = fadd contract float %273, %274
  store float %275, float addrspace(3)* %10, align 4, !tbaa !5
  %276 = add nuw nsw i32 %7, 192
  %277 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %276
  %278 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %279 = load float, float addrspace(3)* %12, align 4, !tbaa !5
  %280 = fadd contract float %278, %279
  store float %280, float addrspace(3)* %12, align 4, !tbaa !5
  %281 = add nuw nsw i32 %7, 224
  %282 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %281
  %283 = load float, float addrspace(3)* %282, align 4, !tbaa !5
  %284 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %285 = fadd contract float %283, %284
  store float %285, float addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %286 = load float, float addrspace(3)* %12, align 4, !tbaa !5
  %287 = load float, float addrspace(3)* %8, align 4, !tbaa !5
  %288 = fadd contract float %286, %287
  store float %288, float addrspace(3)* %8, align 4, !tbaa !5
  %289 = add nuw nsw i32 %7, 96
  %290 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %289
  %291 = load float, float addrspace(3)* %290, align 4, !tbaa !5
  %292 = load float, float addrspace(3)* %10, align 4, !tbaa !5
  %293 = fadd contract float %291, %292
  store float %293, float addrspace(3)* %10, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %294 = load float, float addrspace(3)* %10, align 4, !tbaa !5
  %295 = load float, float addrspace(3)* %8, align 4, !tbaa !5
  %296 = fadd contract float %294, %295
  store float %296, float addrspace(3)* %8, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %297 = icmp eq i32 %7, 0
  br i1 %297, label %393, label %405

298:                                              ; preds = %238, %390
  %299 = phi i32 [ 1, %238 ], [ %391, %390 ]
  %300 = shl nuw nsw i32 %299, 4
  %301 = add nsw i32 %300, %66
  br i1 %240, label %302, label %390

302:                                              ; preds = %298
  %303 = add nsw i32 %301, 16
  %304 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %303
  %305 = load float, float addrspace(3)* %304, align 4, !tbaa !5
  %306 = add nsw i32 %301, -16
  %307 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %306
  %308 = load float, float addrspace(3)* %307, align 4, !tbaa !5
  %309 = fsub contract float %305, %308
  %310 = add nsw i32 %301, 1
  %311 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %310
  %312 = load float, float addrspace(3)* %311, align 4, !tbaa !5
  %313 = add nsw i32 %301, -1
  %314 = getelementptr inbounds [240 x float], [240 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4data, i32 0, i32 %313
  %315 = load float, float addrspace(3)* %314, align 4, !tbaa !5
  %316 = fsub contract float %312, %315
  %317 = tail call float @llvm.fabs.f32(float %316)
  %318 = tail call float @llvm.fabs.f32(float %309)
  %319 = tail call float @llvm.minnum.f32(float %317, float %318)
  %320 = tail call float @llvm.maxnum.f32(float %317, float %318)
  %321 = fdiv float %319, %320, !fpmath !12
  %322 = fmul float %321, %321
  %323 = tail call float @llvm.fmuladd.f32(float %322, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %324 = tail call float @llvm.fmuladd.f32(float %322, float %323, float 0x3FA53F67E0000000)
  %325 = tail call float @llvm.fmuladd.f32(float %322, float %324, float 0xBFB2FA9AE0000000)
  %326 = tail call float @llvm.fmuladd.f32(float %322, float %325, float 0x3FBB263640000000)
  %327 = tail call float @llvm.fmuladd.f32(float %322, float %326, float 0xBFC22C1CC0000000)
  %328 = tail call float @llvm.fmuladd.f32(float %322, float %327, float 0x3FC99717E0000000)
  %329 = tail call float @llvm.fmuladd.f32(float %322, float %328, float 0xBFD5554C40000000)
  %330 = fmul float %322, %329
  %331 = tail call float @llvm.fmuladd.f32(float %321, float %330, float %321)
  %332 = fsub float 0x3FF921FB60000000, %331
  %333 = fcmp ogt float %318, %317
  %334 = select i1 %333, float %332, float %331
  %335 = fsub float 0x400921FB60000000, %334
  %336 = fcmp olt float %316, 0.000000e+00
  %337 = select i1 %336, float %335, float %334
  %338 = bitcast float %316 to i32
  %339 = icmp slt i32 %338, 0
  %340 = select i1 %339, float 0x400921FB60000000, float 0.000000e+00
  %341 = fcmp oeq float %309, 0.000000e+00
  %342 = select i1 %341, float %340, float %337
  %343 = select i1 %336, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %344 = fcmp oeq float %317, 0x7FF0000000000000
  %345 = fcmp oeq float %318, 0x7FF0000000000000
  %346 = and i1 %345, %344
  %347 = select i1 %346, float %343, float %342
  %348 = fcmp uno float %316, %309
  %349 = select i1 %348, float 0x7FF8000000000000, float %347
  %350 = tail call float @llvm.copysign.f32(float %349, float %309)
  %351 = fmul contract float %350, 1.600000e+01
  %352 = fdiv contract float %351, 0x400921FF20000000
  %353 = fadd contract float %352, 1.650000e+01
  %354 = fptosi float %353 to i32
  %355 = icmp eq i32 %354, 32
  %356 = select i1 %355, i32 0, i32 %354
  %357 = fmul contract float %316, %316
  %358 = fmul contract float %309, %309
  %359 = fadd contract float %358, %357
  %360 = fcmp olt float %359, 0x39F0000000000000
  %361 = select i1 %360, float 0x41F0000000000000, float 1.000000e+00
  %362 = fmul float %359, %361
  %363 = tail call float @llvm.sqrt.f32(float %362)
  %364 = bitcast float %363 to i32
  %365 = add nsw i32 %364, -1
  %366 = bitcast i32 %365 to float
  %367 = add nsw i32 %364, 1
  %368 = bitcast i32 %367 to float
  %369 = tail call i1 @llvm.amdgcn.class.f32(float %362, i32 608)
  %370 = select i1 %360, float 0x3EF0000000000000, float 1.000000e+00
  %371 = fneg float %368
  %372 = tail call float @llvm.fma.f32(float %371, float %363, float %362)
  %373 = fcmp ogt float %372, 0.000000e+00
  %374 = fneg float %366
  %375 = tail call float @llvm.fma.f32(float %374, float %363, float %362)
  %376 = fcmp ole float %375, 0.000000e+00
  %377 = select i1 %376, float %366, float %363
  %378 = select i1 %373, float %368, float %377
  %379 = fmul float %370, %378
  %380 = select i1 %369, float %362, float %379
  %381 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %382 = fmul contract float %381, %380
  %383 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE5gauss, i32 0, i32 %299
  %384 = load float, float addrspace(3)* %383, align 4, !tbaa !5
  %385 = fmul contract float %384, %382
  %386 = add nsw i32 %243, %356
  %387 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %386
  %388 = load float, float addrspace(3)* %387, align 4, !tbaa !5
  %389 = fadd contract float %388, %385
  store float %389, float addrspace(3)* %387, align 4, !tbaa !5
  br label %390

390:                                              ; preds = %302, %298
  %391 = add nuw nsw i32 %299, 1
  %392 = icmp eq i32 %391, 14
  br i1 %392, label %244, label %298, !llvm.loop !13

393:                                              ; preds = %244
  %394 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %395 = fmul contract float %394, 6.000000e+00
  %396 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 1), align 4, !tbaa !5
  %397 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %398 = fadd contract float %396, %397
  %399 = fmul contract float %398, 4.000000e+00
  %400 = fadd contract float %395, %399
  %401 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 2), align 8, !tbaa !5
  %402 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 30), align 8, !tbaa !5
  %403 = fadd contract float %401, %402
  %404 = fadd contract float %400, %403
  store float %404, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 32), align 16, !tbaa !5
  br label %405

405:                                              ; preds = %393, %244
  %406 = icmp eq i32 %7, 1
  br i1 %406, label %407, label %419

407:                                              ; preds = %405
  %408 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 1), align 4, !tbaa !5
  %409 = fmul contract float %408, 6.000000e+00
  %410 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 2), align 8, !tbaa !5
  %411 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %412 = fadd contract float %410, %411
  %413 = fmul contract float %412, 4.000000e+00
  %414 = fadd contract float %409, %413
  %415 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 3), align 4, !tbaa !5
  %416 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %417 = fadd contract float %415, %416
  %418 = fadd contract float %414, %417
  store float %418, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 33), align 4, !tbaa !5
  br label %419

419:                                              ; preds = %407, %405
  %420 = add nsw i32 %7, -2
  %421 = icmp ult i32 %420, 28
  br i1 %421, label %422, label %441

422:                                              ; preds = %419
  %423 = load float, float addrspace(3)* %8, align 4, !tbaa !5
  %424 = fmul contract float %423, 6.000000e+00
  %425 = add nuw nsw i32 %7, 1
  %426 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %425
  %427 = load float, float addrspace(3)* %426, align 4, !tbaa !5
  %428 = add nsw i32 %7, -1
  %429 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %428
  %430 = load float, float addrspace(3)* %429, align 4, !tbaa !5
  %431 = fadd contract float %427, %430
  %432 = fmul contract float %431, 4.000000e+00
  %433 = fadd contract float %424, %432
  %434 = add nuw nsw i32 %7, 2
  %435 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %434
  %436 = load float, float addrspace(3)* %435, align 4, !tbaa !5
  %437 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %420
  %438 = load float, float addrspace(3)* %437, align 4, !tbaa !5
  %439 = fadd contract float %436, %438
  %440 = fadd contract float %433, %439
  store float %440, float addrspace(3)* %10, align 4, !tbaa !5
  br label %441

441:                                              ; preds = %422, %419
  switch i32 %7, label %466 [
    i32 30, label %442
    i32 31, label %454
  ]

442:                                              ; preds = %441
  %443 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 30), align 8, !tbaa !5
  %444 = fmul contract float %443, 6.000000e+00
  %445 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %446 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 29), align 4, !tbaa !5
  %447 = fadd contract float %445, %446
  %448 = fmul contract float %447, 4.000000e+00
  %449 = fadd contract float %444, %448
  %450 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %451 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 28), align 16, !tbaa !5
  %452 = fadd contract float %450, %451
  %453 = fadd contract float %449, %452
  store float %453, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 62), align 8, !tbaa !5
  br label %466

454:                                              ; preds = %441
  %455 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %456 = fmul contract float %455, 6.000000e+00
  %457 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %458 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 30), align 8, !tbaa !5
  %459 = fadd contract float %457, %458
  %460 = fmul contract float %459, 4.000000e+00
  %461 = fadd contract float %456, %460
  %462 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 1), align 4, !tbaa !5
  %463 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 29), align 4, !tbaa !5
  %464 = fadd contract float %462, %463
  %465 = fadd contract float %461, %464
  store float %465, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 63), align 4, !tbaa !5
  br label %466

466:                                              ; preds = %442, %441, %454
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %467 = load float, float addrspace(3)* %10, align 4, !tbaa !5
  %468 = add nuw nsw i32 %7, 1
  %469 = and i32 %468, 31
  %470 = or i32 %469, 32
  %471 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %470
  %472 = load float, float addrspace(3)* %471, align 4, !tbaa !5
  %473 = fcmp contract ogt float %467, %472
  br i1 %473, label %474, label %482

474:                                              ; preds = %466
  %475 = add nuw nsw i32 %7, 31
  %476 = and i32 %475, 31
  %477 = or i32 %476, 32
  %478 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %477
  %479 = load float, float addrspace(3)* %478, align 4, !tbaa !5
  %480 = fcmp contract ult float %467, %479
  %481 = select i1 %480, float 0.000000e+00, float %467
  br label %482

482:                                              ; preds = %474, %466
  %483 = phi contract float [ 0.000000e+00, %466 ], [ %481, %474 ]
  store float %483, float addrspace(3)* %8, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %297, label %484, label %887

484:                                              ; preds = %482
  %485 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 0), align 16, !tbaa !5
  %486 = fcmp contract ule float %485, 0.000000e+00
  %487 = select i1 %486, float 0.000000e+00, float %485
  %488 = sext i1 %486 to i32
  %489 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 1), align 4, !tbaa !5
  %490 = fcmp contract ogt float %489, %487
  br i1 %490, label %495, label %491

491:                                              ; preds = %484
  %492 = fcmp contract ogt float %489, 0.000000e+00
  %493 = select i1 %492, float %489, float 0.000000e+00
  %494 = select i1 %492, i32 1, i32 -1
  br label %495

495:                                              ; preds = %491, %484
  %496 = phi float [ %489, %484 ], [ %487, %491 ]
  %497 = phi float [ %487, %484 ], [ %493, %491 ]
  %498 = phi i32 [ 1, %484 ], [ %488, %491 ]
  %499 = phi i32 [ %488, %484 ], [ %494, %491 ]
  %500 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 2), align 8, !tbaa !5
  %501 = fcmp contract ogt float %500, %496
  br i1 %501, label %506, label %502

502:                                              ; preds = %495
  %503 = fcmp contract ogt float %500, %497
  %504 = select i1 %503, float %500, float %497
  %505 = select i1 %503, i32 2, i32 %499
  br label %506

506:                                              ; preds = %502, %495
  %507 = phi float [ %500, %495 ], [ %496, %502 ]
  %508 = phi float [ %496, %495 ], [ %504, %502 ]
  %509 = phi i32 [ 2, %495 ], [ %498, %502 ]
  %510 = phi i32 [ %498, %495 ], [ %505, %502 ]
  %511 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 3), align 4, !tbaa !5
  %512 = fcmp contract ogt float %511, %507
  br i1 %512, label %517, label %513

513:                                              ; preds = %506
  %514 = fcmp contract ogt float %511, %508
  %515 = select i1 %514, float %511, float %508
  %516 = select i1 %514, i32 3, i32 %510
  br label %517

517:                                              ; preds = %513, %506
  %518 = phi float [ %511, %506 ], [ %507, %513 ]
  %519 = phi float [ %507, %506 ], [ %515, %513 ]
  %520 = phi i32 [ 3, %506 ], [ %509, %513 ]
  %521 = phi i32 [ %509, %506 ], [ %516, %513 ]
  %522 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 4), align 16, !tbaa !5
  %523 = fcmp contract ogt float %522, %518
  br i1 %523, label %528, label %524

524:                                              ; preds = %517
  %525 = fcmp contract ogt float %522, %519
  %526 = select i1 %525, float %522, float %519
  %527 = select i1 %525, i32 4, i32 %521
  br label %528

528:                                              ; preds = %524, %517
  %529 = phi float [ %522, %517 ], [ %518, %524 ]
  %530 = phi float [ %518, %517 ], [ %526, %524 ]
  %531 = phi i32 [ 4, %517 ], [ %520, %524 ]
  %532 = phi i32 [ %520, %517 ], [ %527, %524 ]
  %533 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 5), align 4, !tbaa !5
  %534 = fcmp contract ogt float %533, %529
  br i1 %534, label %539, label %535

535:                                              ; preds = %528
  %536 = fcmp contract ogt float %533, %530
  %537 = select i1 %536, float %533, float %530
  %538 = select i1 %536, i32 5, i32 %532
  br label %539

539:                                              ; preds = %535, %528
  %540 = phi float [ %533, %528 ], [ %529, %535 ]
  %541 = phi float [ %529, %528 ], [ %537, %535 ]
  %542 = phi i32 [ 5, %528 ], [ %531, %535 ]
  %543 = phi i32 [ %531, %528 ], [ %538, %535 ]
  %544 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 6), align 8, !tbaa !5
  %545 = fcmp contract ogt float %544, %540
  br i1 %545, label %550, label %546

546:                                              ; preds = %539
  %547 = fcmp contract ogt float %544, %541
  %548 = select i1 %547, float %544, float %541
  %549 = select i1 %547, i32 6, i32 %543
  br label %550

550:                                              ; preds = %546, %539
  %551 = phi float [ %544, %539 ], [ %540, %546 ]
  %552 = phi float [ %540, %539 ], [ %548, %546 ]
  %553 = phi i32 [ 6, %539 ], [ %542, %546 ]
  %554 = phi i32 [ %542, %539 ], [ %549, %546 ]
  %555 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 7), align 4, !tbaa !5
  %556 = fcmp contract ogt float %555, %551
  br i1 %556, label %561, label %557

557:                                              ; preds = %550
  %558 = fcmp contract ogt float %555, %552
  %559 = select i1 %558, float %555, float %552
  %560 = select i1 %558, i32 7, i32 %554
  br label %561

561:                                              ; preds = %557, %550
  %562 = phi float [ %555, %550 ], [ %551, %557 ]
  %563 = phi float [ %551, %550 ], [ %559, %557 ]
  %564 = phi i32 [ 7, %550 ], [ %553, %557 ]
  %565 = phi i32 [ %553, %550 ], [ %560, %557 ]
  %566 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 8), align 16, !tbaa !5
  %567 = fcmp contract ogt float %566, %562
  br i1 %567, label %572, label %568

568:                                              ; preds = %561
  %569 = fcmp contract ogt float %566, %563
  %570 = select i1 %569, float %566, float %563
  %571 = select i1 %569, i32 8, i32 %565
  br label %572

572:                                              ; preds = %568, %561
  %573 = phi float [ %566, %561 ], [ %562, %568 ]
  %574 = phi float [ %562, %561 ], [ %570, %568 ]
  %575 = phi i32 [ 8, %561 ], [ %564, %568 ]
  %576 = phi i32 [ %564, %561 ], [ %571, %568 ]
  %577 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 9), align 4, !tbaa !5
  %578 = fcmp contract ogt float %577, %573
  br i1 %578, label %583, label %579

579:                                              ; preds = %572
  %580 = fcmp contract ogt float %577, %574
  %581 = select i1 %580, float %577, float %574
  %582 = select i1 %580, i32 9, i32 %576
  br label %583

583:                                              ; preds = %579, %572
  %584 = phi float [ %577, %572 ], [ %573, %579 ]
  %585 = phi float [ %573, %572 ], [ %581, %579 ]
  %586 = phi i32 [ 9, %572 ], [ %575, %579 ]
  %587 = phi i32 [ %575, %572 ], [ %582, %579 ]
  %588 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 10), align 8, !tbaa !5
  %589 = fcmp contract ogt float %588, %584
  br i1 %589, label %594, label %590

590:                                              ; preds = %583
  %591 = fcmp contract ogt float %588, %585
  %592 = select i1 %591, float %588, float %585
  %593 = select i1 %591, i32 10, i32 %587
  br label %594

594:                                              ; preds = %590, %583
  %595 = phi float [ %588, %583 ], [ %584, %590 ]
  %596 = phi float [ %584, %583 ], [ %592, %590 ]
  %597 = phi i32 [ 10, %583 ], [ %586, %590 ]
  %598 = phi i32 [ %586, %583 ], [ %593, %590 ]
  %599 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 11), align 4, !tbaa !5
  %600 = fcmp contract ogt float %599, %595
  br i1 %600, label %605, label %601

601:                                              ; preds = %594
  %602 = fcmp contract ogt float %599, %596
  %603 = select i1 %602, float %599, float %596
  %604 = select i1 %602, i32 11, i32 %598
  br label %605

605:                                              ; preds = %601, %594
  %606 = phi float [ %599, %594 ], [ %595, %601 ]
  %607 = phi float [ %595, %594 ], [ %603, %601 ]
  %608 = phi i32 [ 11, %594 ], [ %597, %601 ]
  %609 = phi i32 [ %597, %594 ], [ %604, %601 ]
  %610 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 12), align 16, !tbaa !5
  %611 = fcmp contract ogt float %610, %606
  br i1 %611, label %616, label %612

612:                                              ; preds = %605
  %613 = fcmp contract ogt float %610, %607
  %614 = select i1 %613, float %610, float %607
  %615 = select i1 %613, i32 12, i32 %609
  br label %616

616:                                              ; preds = %612, %605
  %617 = phi float [ %610, %605 ], [ %606, %612 ]
  %618 = phi float [ %606, %605 ], [ %614, %612 ]
  %619 = phi i32 [ 12, %605 ], [ %608, %612 ]
  %620 = phi i32 [ %608, %605 ], [ %615, %612 ]
  %621 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 13), align 4, !tbaa !5
  %622 = fcmp contract ogt float %621, %617
  br i1 %622, label %627, label %623

623:                                              ; preds = %616
  %624 = fcmp contract ogt float %621, %618
  %625 = select i1 %624, float %621, float %618
  %626 = select i1 %624, i32 13, i32 %620
  br label %627

627:                                              ; preds = %623, %616
  %628 = phi float [ %621, %616 ], [ %617, %623 ]
  %629 = phi float [ %617, %616 ], [ %625, %623 ]
  %630 = phi i32 [ 13, %616 ], [ %619, %623 ]
  %631 = phi i32 [ %619, %616 ], [ %626, %623 ]
  %632 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 14), align 8, !tbaa !5
  %633 = fcmp contract ogt float %632, %628
  br i1 %633, label %638, label %634

634:                                              ; preds = %627
  %635 = fcmp contract ogt float %632, %629
  %636 = select i1 %635, float %632, float %629
  %637 = select i1 %635, i32 14, i32 %631
  br label %638

638:                                              ; preds = %634, %627
  %639 = phi float [ %632, %627 ], [ %628, %634 ]
  %640 = phi float [ %628, %627 ], [ %636, %634 ]
  %641 = phi i32 [ 14, %627 ], [ %630, %634 ]
  %642 = phi i32 [ %630, %627 ], [ %637, %634 ]
  %643 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 15), align 4, !tbaa !5
  %644 = fcmp contract ogt float %643, %639
  br i1 %644, label %649, label %645

645:                                              ; preds = %638
  %646 = fcmp contract ogt float %643, %640
  %647 = select i1 %646, float %643, float %640
  %648 = select i1 %646, i32 15, i32 %642
  br label %649

649:                                              ; preds = %645, %638
  %650 = phi float [ %643, %638 ], [ %639, %645 ]
  %651 = phi float [ %639, %638 ], [ %647, %645 ]
  %652 = phi i32 [ 15, %638 ], [ %641, %645 ]
  %653 = phi i32 [ %641, %638 ], [ %648, %645 ]
  %654 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 16), align 16, !tbaa !5
  %655 = fcmp contract ogt float %654, %650
  br i1 %655, label %660, label %656

656:                                              ; preds = %649
  %657 = fcmp contract ogt float %654, %651
  %658 = select i1 %657, float %654, float %651
  %659 = select i1 %657, i32 16, i32 %653
  br label %660

660:                                              ; preds = %656, %649
  %661 = phi float [ %654, %649 ], [ %650, %656 ]
  %662 = phi float [ %650, %649 ], [ %658, %656 ]
  %663 = phi i32 [ 16, %649 ], [ %652, %656 ]
  %664 = phi i32 [ %652, %649 ], [ %659, %656 ]
  %665 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 17), align 4, !tbaa !5
  %666 = fcmp contract ogt float %665, %661
  br i1 %666, label %671, label %667

667:                                              ; preds = %660
  %668 = fcmp contract ogt float %665, %662
  %669 = select i1 %668, float %665, float %662
  %670 = select i1 %668, i32 17, i32 %664
  br label %671

671:                                              ; preds = %667, %660
  %672 = phi float [ %665, %660 ], [ %661, %667 ]
  %673 = phi float [ %661, %660 ], [ %669, %667 ]
  %674 = phi i32 [ 17, %660 ], [ %663, %667 ]
  %675 = phi i32 [ %663, %660 ], [ %670, %667 ]
  %676 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 18), align 8, !tbaa !5
  %677 = fcmp contract ogt float %676, %672
  br i1 %677, label %682, label %678

678:                                              ; preds = %671
  %679 = fcmp contract ogt float %676, %673
  %680 = select i1 %679, float %676, float %673
  %681 = select i1 %679, i32 18, i32 %675
  br label %682

682:                                              ; preds = %678, %671
  %683 = phi float [ %676, %671 ], [ %672, %678 ]
  %684 = phi float [ %672, %671 ], [ %680, %678 ]
  %685 = phi i32 [ 18, %671 ], [ %674, %678 ]
  %686 = phi i32 [ %674, %671 ], [ %681, %678 ]
  %687 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 19), align 4, !tbaa !5
  %688 = fcmp contract ogt float %687, %683
  br i1 %688, label %693, label %689

689:                                              ; preds = %682
  %690 = fcmp contract ogt float %687, %684
  %691 = select i1 %690, float %687, float %684
  %692 = select i1 %690, i32 19, i32 %686
  br label %693

693:                                              ; preds = %689, %682
  %694 = phi float [ %687, %682 ], [ %683, %689 ]
  %695 = phi float [ %683, %682 ], [ %691, %689 ]
  %696 = phi i32 [ 19, %682 ], [ %685, %689 ]
  %697 = phi i32 [ %685, %682 ], [ %692, %689 ]
  %698 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 20), align 16, !tbaa !5
  %699 = fcmp contract ogt float %698, %694
  br i1 %699, label %704, label %700

700:                                              ; preds = %693
  %701 = fcmp contract ogt float %698, %695
  %702 = select i1 %701, float %698, float %695
  %703 = select i1 %701, i32 20, i32 %697
  br label %704

704:                                              ; preds = %700, %693
  %705 = phi float [ %698, %693 ], [ %694, %700 ]
  %706 = phi float [ %694, %693 ], [ %702, %700 ]
  %707 = phi i32 [ 20, %693 ], [ %696, %700 ]
  %708 = phi i32 [ %696, %693 ], [ %703, %700 ]
  %709 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 21), align 4, !tbaa !5
  %710 = fcmp contract ogt float %709, %705
  br i1 %710, label %715, label %711

711:                                              ; preds = %704
  %712 = fcmp contract ogt float %709, %706
  %713 = select i1 %712, float %709, float %706
  %714 = select i1 %712, i32 21, i32 %708
  br label %715

715:                                              ; preds = %711, %704
  %716 = phi float [ %709, %704 ], [ %705, %711 ]
  %717 = phi float [ %705, %704 ], [ %713, %711 ]
  %718 = phi i32 [ 21, %704 ], [ %707, %711 ]
  %719 = phi i32 [ %707, %704 ], [ %714, %711 ]
  %720 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 22), align 8, !tbaa !5
  %721 = fcmp contract ogt float %720, %716
  br i1 %721, label %726, label %722

722:                                              ; preds = %715
  %723 = fcmp contract ogt float %720, %717
  %724 = select i1 %723, float %720, float %717
  %725 = select i1 %723, i32 22, i32 %719
  br label %726

726:                                              ; preds = %722, %715
  %727 = phi float [ %720, %715 ], [ %716, %722 ]
  %728 = phi float [ %716, %715 ], [ %724, %722 ]
  %729 = phi i32 [ 22, %715 ], [ %718, %722 ]
  %730 = phi i32 [ %718, %715 ], [ %725, %722 ]
  %731 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 23), align 4, !tbaa !5
  %732 = fcmp contract ogt float %731, %727
  br i1 %732, label %737, label %733

733:                                              ; preds = %726
  %734 = fcmp contract ogt float %731, %728
  %735 = select i1 %734, float %731, float %728
  %736 = select i1 %734, i32 23, i32 %730
  br label %737

737:                                              ; preds = %733, %726
  %738 = phi float [ %731, %726 ], [ %727, %733 ]
  %739 = phi float [ %727, %726 ], [ %735, %733 ]
  %740 = phi i32 [ 23, %726 ], [ %729, %733 ]
  %741 = phi i32 [ %729, %726 ], [ %736, %733 ]
  %742 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 24), align 16, !tbaa !5
  %743 = fcmp contract ogt float %742, %738
  br i1 %743, label %748, label %744

744:                                              ; preds = %737
  %745 = fcmp contract ogt float %742, %739
  %746 = select i1 %745, float %742, float %739
  %747 = select i1 %745, i32 24, i32 %741
  br label %748

748:                                              ; preds = %744, %737
  %749 = phi float [ %742, %737 ], [ %738, %744 ]
  %750 = phi float [ %738, %737 ], [ %746, %744 ]
  %751 = phi i32 [ 24, %737 ], [ %740, %744 ]
  %752 = phi i32 [ %740, %737 ], [ %747, %744 ]
  %753 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 25), align 4, !tbaa !5
  %754 = fcmp contract ogt float %753, %749
  br i1 %754, label %759, label %755

755:                                              ; preds = %748
  %756 = fcmp contract ogt float %753, %750
  %757 = select i1 %756, float %753, float %750
  %758 = select i1 %756, i32 25, i32 %752
  br label %759

759:                                              ; preds = %755, %748
  %760 = phi float [ %753, %748 ], [ %749, %755 ]
  %761 = phi float [ %749, %748 ], [ %757, %755 ]
  %762 = phi i32 [ 25, %748 ], [ %751, %755 ]
  %763 = phi i32 [ %751, %748 ], [ %758, %755 ]
  %764 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 26), align 8, !tbaa !5
  %765 = fcmp contract ogt float %764, %760
  br i1 %765, label %770, label %766

766:                                              ; preds = %759
  %767 = fcmp contract ogt float %764, %761
  %768 = select i1 %767, float %764, float %761
  %769 = select i1 %767, i32 26, i32 %763
  br label %770

770:                                              ; preds = %766, %759
  %771 = phi float [ %764, %759 ], [ %760, %766 ]
  %772 = phi float [ %760, %759 ], [ %768, %766 ]
  %773 = phi i32 [ 26, %759 ], [ %762, %766 ]
  %774 = phi i32 [ %762, %759 ], [ %769, %766 ]
  %775 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 27), align 4, !tbaa !5
  %776 = fcmp contract ogt float %775, %771
  br i1 %776, label %781, label %777

777:                                              ; preds = %770
  %778 = fcmp contract ogt float %775, %772
  %779 = select i1 %778, float %775, float %772
  %780 = select i1 %778, i32 27, i32 %774
  br label %781

781:                                              ; preds = %777, %770
  %782 = phi float [ %775, %770 ], [ %771, %777 ]
  %783 = phi float [ %771, %770 ], [ %779, %777 ]
  %784 = phi i32 [ 27, %770 ], [ %773, %777 ]
  %785 = phi i32 [ %773, %770 ], [ %780, %777 ]
  %786 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 28), align 16, !tbaa !5
  %787 = fcmp contract ogt float %786, %782
  br i1 %787, label %792, label %788

788:                                              ; preds = %781
  %789 = fcmp contract ogt float %786, %783
  %790 = select i1 %789, float %786, float %783
  %791 = select i1 %789, i32 28, i32 %785
  br label %792

792:                                              ; preds = %788, %781
  %793 = phi float [ %786, %781 ], [ %782, %788 ]
  %794 = phi float [ %782, %781 ], [ %790, %788 ]
  %795 = phi i32 [ 28, %781 ], [ %784, %788 ]
  %796 = phi i32 [ %784, %781 ], [ %791, %788 ]
  %797 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 29), align 4, !tbaa !5
  %798 = fcmp contract ogt float %797, %793
  br i1 %798, label %803, label %799

799:                                              ; preds = %792
  %800 = fcmp contract ogt float %797, %794
  %801 = select i1 %800, float %797, float %794
  %802 = select i1 %800, i32 29, i32 %796
  br label %803

803:                                              ; preds = %799, %792
  %804 = phi float [ %797, %792 ], [ %793, %799 ]
  %805 = phi float [ %793, %792 ], [ %801, %799 ]
  %806 = phi i32 [ 29, %792 ], [ %795, %799 ]
  %807 = phi i32 [ %795, %792 ], [ %802, %799 ]
  %808 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 30), align 8, !tbaa !5
  %809 = fcmp contract ogt float %808, %804
  br i1 %809, label %814, label %810

810:                                              ; preds = %803
  %811 = fcmp contract ogt float %808, %805
  %812 = select i1 %811, float %808, float %805
  %813 = select i1 %811, i32 30, i32 %807
  br label %814

814:                                              ; preds = %810, %803
  %815 = phi float [ %808, %803 ], [ %804, %810 ]
  %816 = phi float [ %804, %803 ], [ %812, %810 ]
  %817 = phi i32 [ 30, %803 ], [ %806, %810 ]
  %818 = phi i32 [ %806, %803 ], [ %813, %810 ]
  %819 = load float, float addrspace(3)* getelementptr inbounds ([416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 31), align 4, !tbaa !5
  %820 = fcmp contract ogt float %819, %815
  br i1 %820, label %825, label %821

821:                                              ; preds = %814
  %822 = fcmp contract ogt float %819, %816
  %823 = select i1 %822, float %819, float %816
  %824 = select i1 %822, i32 31, i32 %818
  br label %825

825:                                              ; preds = %821, %814
  %826 = phi float [ %819, %814 ], [ %815, %821 ]
  %827 = phi float [ %815, %814 ], [ %823, %821 ]
  %828 = phi i32 [ 31, %814 ], [ %817, %821 ]
  %829 = phi i32 [ %817, %814 ], [ %824, %821 ]
  %830 = add nsw i32 %828, 1
  %831 = and i32 %830, 31
  %832 = or i32 %831, 32
  %833 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %832
  %834 = load float, float addrspace(3)* %833, align 4, !tbaa !5
  %835 = add nsw i32 %828, 31
  %836 = and i32 %835, 31
  %837 = or i32 %836, 32
  %838 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %837
  %839 = load float, float addrspace(3)* %838, align 4, !tbaa !5
  %840 = sitofp i32 %828 to float
  %841 = fsub contract float %834, %839
  %842 = fmul contract float %841, 5.000000e-01
  %843 = fmul contract float %826, 2.000000e+00
  %844 = fsub contract float %843, %834
  %845 = fsub contract float %844, %839
  %846 = fdiv contract float %842, %845
  %847 = fadd contract float %846, %840
  %848 = fcmp contract olt float %847, 0.000000e+00
  %849 = fadd contract float %847, 3.200000e+01
  %850 = select contract i1 %848, float %849, float %847
  %851 = fmul contract float %850, 1.125000e+01
  %852 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  store float %851, float addrspace(1)* %852, align 4, !tbaa !5
  %853 = fmul contract float %826, 0x3FE99999A0000000
  %854 = fcmp contract olt float %827, %853
  %855 = select i1 %854, i32 -1, i32 %829
  %856 = icmp sgt i32 %855, -1
  br i1 %856, label %857, label %880

857:                                              ; preds = %825
  %858 = add nuw nsw i32 %855, 1
  %859 = and i32 %858, 31
  %860 = or i32 %859, 32
  %861 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %860
  %862 = load float, float addrspace(3)* %861, align 4, !tbaa !5
  %863 = add nuw nsw i32 %855, 31
  %864 = and i32 %863, 31
  %865 = or i32 %864, 32
  %866 = getelementptr inbounds [416 x float], [416 x float] addrspace(3)* @_ZZ19ComputeOrientationsPfPiS_iiiE4hist, i32 0, i32 %865
  %867 = load float, float addrspace(3)* %866, align 4, !tbaa !5
  %868 = sitofp i32 %855 to float
  %869 = fsub contract float %862, %867
  %870 = fmul contract float %869, 5.000000e-01
  %871 = fmul contract float %827, 2.000000e+00
  %872 = fsub contract float %871, %862
  %873 = fsub contract float %872, %867
  %874 = fdiv contract float %870, %873
  %875 = fadd contract float %874, %868
  %876 = fcmp contract olt float %875, 0.000000e+00
  %877 = fadd contract float %875, 3.200000e+01
  %878 = select contract i1 %876, float %877, float %875
  %879 = fmul contract float %878, 1.125000e+01
  br label %882

880:                                              ; preds = %825
  %881 = sitofp i32 %855 to float
  br label %882

882:                                              ; preds = %880, %857
  %883 = phi float [ %879, %857 ], [ %881, %880 ]
  %884 = add nsw i32 %33, %3
  %885 = sext i32 %884 to i64
  %886 = getelementptr inbounds float, float addrspace(1)* %2, i64 %885
  store float %883, float addrspace(1)* %886, align 4, !tbaa !5
  br label %887

887:                                              ; preds = %882, %482
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
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{}
!12 = !{float 2.500000e+00}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
