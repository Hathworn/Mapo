; ModuleID = '../data/hip_kernels/15019/2/main.cu'
source_filename = "../data/hip_kernels/15019/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_lbin_pos = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 16
@_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_lbin = internal unnamed_addr addrspace(3) global [64 x float] undef, align 16
@_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_rbin_pos = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 16
@_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_rbin = internal unnamed_addr addrspace(3) global [64 x float] undef, align 16
@_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist = internal unnamed_addr addrspace(3) global [72 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16histogram_kernelPfS_S_iiiiiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %3
  br i1 %23, label %24, label %214

24:                                               ; preds = %13
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !4, !invariant.load !5
  %29 = zext i16 %28 to i32
  %30 = mul i32 %25, %29
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %32 = add i32 %30, %31
  %33 = icmp slt i32 %32, %4
  br i1 %33, label %34, label %214

34:                                               ; preds = %24
  %35 = mul nsw i32 %32, %7
  %36 = add nsw i32 %35, %22
  %37 = mul nsw i32 %32, %8
  %38 = add nsw i32 %37, %22
  %39 = sitofp i32 %12 to float
  %40 = fdiv contract float 1.000000e+00, %39
  %41 = sext i32 %38 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fdiv contract float %43, %40
  %45 = fadd contract float %44, -5.000000e-01
  %46 = tail call float @llvm.floor.f32(float %45)
  %47 = fptosi float %46 to i32
  %48 = add nsw i32 %47, %12
  %49 = srem i32 %48, %12
  %50 = add nsw i32 %49, 1
  %51 = sitofp i32 %50 to float
  %52 = fsub contract float %44, %51
  %53 = fcmp contract olt float %52, -5.000000e-01
  %54 = select i1 %53, float %39, float -0.000000e+00
  %55 = fadd contract float %52, %54
  %56 = srem i32 %50, %12
  %57 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_lbin_pos, i32 0, i32 %21
  store i32 %49, i32 addrspace(3)* %57, align 4, !tbaa !11
  %58 = fpext float %55 to double
  %59 = fsub contract double 5.000000e-01, %58
  %60 = sext i32 %36 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = fpext float %62 to double
  %64 = fmul contract double %59, %63
  %65 = fptrunc double %64 to float
  %66 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_lbin, i32 0, i32 %21
  store float %65, float addrspace(3)* %66, align 4, !tbaa !7
  %67 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_rbin_pos, i32 0, i32 %21
  store i32 %56, i32 addrspace(3)* %67, align 4, !tbaa !11
  %68 = fadd contract double %58, 5.000000e-01
  %69 = fmul contract double %68, %63
  %70 = fptrunc double %69 to float
  %71 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_rbin, i32 0, i32 %21
  store float %70, float addrspace(3)* %71, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %21
  store float 0.000000e+00, float addrspace(3)* %72, align 4, !tbaa !7
  %73 = icmp ult i32 %21, 8
  br i1 %73, label %74, label %198

74:                                               ; preds = %34
  %75 = add nuw nsw i32 %21, 64
  %76 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %75
  store float 0.000000e+00, float addrspace(3)* %76, align 4, !tbaa !7
  %77 = mul nuw nsw i32 %21, 9
  %78 = shl nuw nsw i32 %21, 3
  %79 = add nuw nsw i32 %78, 1
  %80 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_lbin, i32 0, i32 %79
  %81 = load float, float addrspace(3)* %80, align 4, !tbaa !7
  %82 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_lbin_pos, i32 0, i32 %79
  %83 = load i32, i32 addrspace(3)* %82, align 4, !tbaa !11
  %84 = add nsw i32 %83, %77
  %85 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !7
  %87 = fadd contract float %81, %86
  store float %87, float addrspace(3)* %85, align 4, !tbaa !7
  %88 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_rbin, i32 0, i32 %79
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !7
  %90 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_rbin_pos, i32 0, i32 %79
  %91 = load i32, i32 addrspace(3)* %90, align 4, !tbaa !11
  %92 = add nsw i32 %91, %77
  %93 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %92
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %95 = fadd contract float %89, %94
  store float %95, float addrspace(3)* %93, align 4, !tbaa !7
  %96 = add nuw nsw i32 %78, 2
  %97 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_lbin, i32 0, i32 %96
  %98 = load float, float addrspace(3)* %97, align 8, !tbaa !7
  %99 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_lbin_pos, i32 0, i32 %96
  %100 = load i32, i32 addrspace(3)* %99, align 8, !tbaa !11
  %101 = add nsw i32 %100, %77
  %102 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %101
  %103 = load float, float addrspace(3)* %102, align 4, !tbaa !7
  %104 = fadd contract float %98, %103
  store float %104, float addrspace(3)* %102, align 4, !tbaa !7
  %105 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_rbin, i32 0, i32 %96
  %106 = load float, float addrspace(3)* %105, align 8, !tbaa !7
  %107 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_rbin_pos, i32 0, i32 %96
  %108 = load i32, i32 addrspace(3)* %107, align 8, !tbaa !11
  %109 = add nsw i32 %108, %77
  %110 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %109
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  %112 = fadd contract float %106, %111
  store float %112, float addrspace(3)* %110, align 4, !tbaa !7
  %113 = add nuw nsw i32 %78, 3
  %114 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_lbin, i32 0, i32 %113
  %115 = load float, float addrspace(3)* %114, align 4, !tbaa !7
  %116 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_lbin_pos, i32 0, i32 %113
  %117 = load i32, i32 addrspace(3)* %116, align 4, !tbaa !11
  %118 = add nsw i32 %117, %77
  %119 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %118
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !7
  %121 = fadd contract float %115, %120
  store float %121, float addrspace(3)* %119, align 4, !tbaa !7
  %122 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_rbin, i32 0, i32 %113
  %123 = load float, float addrspace(3)* %122, align 4, !tbaa !7
  %124 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_rbin_pos, i32 0, i32 %113
  %125 = load i32, i32 addrspace(3)* %124, align 4, !tbaa !11
  %126 = add nsw i32 %125, %77
  %127 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %126
  %128 = load float, float addrspace(3)* %127, align 4, !tbaa !7
  %129 = fadd contract float %123, %128
  store float %129, float addrspace(3)* %127, align 4, !tbaa !7
  %130 = add nuw nsw i32 %78, 4
  %131 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_lbin, i32 0, i32 %130
  %132 = load float, float addrspace(3)* %131, align 16, !tbaa !7
  %133 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_lbin_pos, i32 0, i32 %130
  %134 = load i32, i32 addrspace(3)* %133, align 16, !tbaa !11
  %135 = add nsw i32 %134, %77
  %136 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %135
  %137 = load float, float addrspace(3)* %136, align 4, !tbaa !7
  %138 = fadd contract float %132, %137
  store float %138, float addrspace(3)* %136, align 4, !tbaa !7
  %139 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_rbin, i32 0, i32 %130
  %140 = load float, float addrspace(3)* %139, align 16, !tbaa !7
  %141 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_rbin_pos, i32 0, i32 %130
  %142 = load i32, i32 addrspace(3)* %141, align 16, !tbaa !11
  %143 = add nsw i32 %142, %77
  %144 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %143
  %145 = load float, float addrspace(3)* %144, align 4, !tbaa !7
  %146 = fadd contract float %140, %145
  store float %146, float addrspace(3)* %144, align 4, !tbaa !7
  %147 = add nuw nsw i32 %78, 5
  %148 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_lbin, i32 0, i32 %147
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !7
  %150 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_lbin_pos, i32 0, i32 %147
  %151 = load i32, i32 addrspace(3)* %150, align 4, !tbaa !11
  %152 = add nsw i32 %151, %77
  %153 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %152
  %154 = load float, float addrspace(3)* %153, align 4, !tbaa !7
  %155 = fadd contract float %149, %154
  store float %155, float addrspace(3)* %153, align 4, !tbaa !7
  %156 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_rbin, i32 0, i32 %147
  %157 = load float, float addrspace(3)* %156, align 4, !tbaa !7
  %158 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_rbin_pos, i32 0, i32 %147
  %159 = load i32, i32 addrspace(3)* %158, align 4, !tbaa !11
  %160 = add nsw i32 %159, %77
  %161 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %160
  %162 = load float, float addrspace(3)* %161, align 4, !tbaa !7
  %163 = fadd contract float %157, %162
  store float %163, float addrspace(3)* %161, align 4, !tbaa !7
  %164 = add nuw nsw i32 %78, 6
  %165 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_lbin, i32 0, i32 %164
  %166 = load float, float addrspace(3)* %165, align 8, !tbaa !7
  %167 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_lbin_pos, i32 0, i32 %164
  %168 = load i32, i32 addrspace(3)* %167, align 8, !tbaa !11
  %169 = add nsw i32 %168, %77
  %170 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %169
  %171 = load float, float addrspace(3)* %170, align 4, !tbaa !7
  %172 = fadd contract float %166, %171
  store float %172, float addrspace(3)* %170, align 4, !tbaa !7
  %173 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_rbin, i32 0, i32 %164
  %174 = load float, float addrspace(3)* %173, align 8, !tbaa !7
  %175 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_rbin_pos, i32 0, i32 %164
  %176 = load i32, i32 addrspace(3)* %175, align 8, !tbaa !11
  %177 = add nsw i32 %176, %77
  %178 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %177
  %179 = load float, float addrspace(3)* %178, align 4, !tbaa !7
  %180 = fadd contract float %174, %179
  store float %180, float addrspace(3)* %178, align 4, !tbaa !7
  %181 = add nuw nsw i32 %78, 7
  %182 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_lbin, i32 0, i32 %181
  %183 = load float, float addrspace(3)* %182, align 4, !tbaa !7
  %184 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_lbin_pos, i32 0, i32 %181
  %185 = load i32, i32 addrspace(3)* %184, align 4, !tbaa !11
  %186 = add nsw i32 %185, %77
  %187 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %186
  %188 = load float, float addrspace(3)* %187, align 4, !tbaa !7
  %189 = fadd contract float %183, %188
  store float %189, float addrspace(3)* %187, align 4, !tbaa !7
  %190 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_rbin, i32 0, i32 %181
  %191 = load float, float addrspace(3)* %190, align 4, !tbaa !7
  %192 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE10s_rbin_pos, i32 0, i32 %181
  %193 = load i32, i32 addrspace(3)* %192, align 4, !tbaa !11
  %194 = add nsw i32 %193, %77
  %195 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %194
  %196 = load float, float addrspace(3)* %195, align 4, !tbaa !7
  %197 = fadd contract float %191, %196
  store float %197, float addrspace(3)* %195, align 4, !tbaa !7
  br label %198

198:                                              ; preds = %34, %74
  %199 = sdiv i32 %32, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %200 = mul nsw i32 %199, %9
  %201 = add i32 %200, %21
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %2, i64 %202
  %204 = load float, float addrspace(3)* %72, align 4, !tbaa !7
  %205 = atomicrmw fadd float addrspace(1)* %203, float %204 syncscope("agent-one-as") monotonic, align 4
  br i1 %73, label %206, label %214

206:                                              ; preds = %198
  %207 = add nsw i32 %201, 64
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %2, i64 %208
  %210 = add nuw nsw i32 %21, 64
  %211 = getelementptr inbounds [72 x float], [72 x float] addrspace(3)* @_ZZ16histogram_kernelPfS_S_iiiiiiiiiiE6s_hist, i32 0, i32 %210
  %212 = load float, float addrspace(3)* %211, align 4, !tbaa !7
  %213 = atomicrmw fadd float addrspace(1)* %209, float %212 syncscope("agent-one-as") monotonic, align 4
  br label %214

214:                                              ; preds = %24, %206, %198, %13
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
