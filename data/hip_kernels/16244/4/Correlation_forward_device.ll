; ModuleID = '../data/hip_kernels/16244/4/main.cu'
source_filename = "../data/hip_kernels/16244/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum = internal unnamed_addr addrspace(3) global [64 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19Correlation_forwardPfiiiS_iiiS_iiiii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = shl nsw i32 %9, 1
  %16 = add nsw i32 %15, %7
  %17 = add nsw i32 %10, -1
  %18 = sdiv i32 %17, 2
  %19 = sdiv i32 %11, %13
  %20 = shl nsw i32 %19, 1
  %21 = add nuw nsw i32 %20, 1
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = mul i32 %23, %12
  %25 = add i32 %18, %11
  %26 = add i32 %25, %24
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %28 = mul i32 %27, %12
  %29 = add i32 %25, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %31 = mul i32 %16, %5
  %32 = mul i32 %10, %5
  %33 = mul i32 %32, %10
  %34 = sitofp i32 %33 to float
  %35 = sub i32 0, %19
  %36 = icmp slt i32 %19, 0
  br i1 %36, label %55, label %37

37:                                               ; preds = %14
  %38 = add nsw i32 %15, %6
  %39 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 %30
  %40 = sub nsw i32 0, %18
  %41 = icmp slt i32 %10, 0
  %42 = icmp slt i32 %30, %5
  %43 = mul i32 %31, %22
  %44 = mul i32 %43, %38
  %45 = icmp eq i32 %30, 0
  %46 = mul i32 %22, %1
  %47 = add i32 %19, %46
  %48 = tail call i32 @llvm.abs.i32(i32 %18, i1 true)
  br label %49

49:                                               ; preds = %37, %56
  %50 = phi i32 [ %35, %37 ], [ %57, %56 ]
  %51 = mul nsw i32 %50, %13
  %52 = add nsw i32 %50, %19
  %53 = mul nsw i32 %52, %21
  %54 = add i32 %47, %53
  br label %59

55:                                               ; preds = %56, %14
  ret void

56:                                               ; preds = %241
  %57 = add i32 %50, 1
  %58 = icmp eq i32 %50, %19
  br i1 %58, label %55, label %49, !llvm.loop !5

59:                                               ; preds = %49, %241
  %60 = phi i32 [ %35, %49 ], [ %242, %241 ]
  store float 0.000000e+00, float addrspace(3)* %39, align 4, !tbaa !7
  %61 = mul nsw i32 %60, %13
  br i1 %41, label %69, label %62

62:                                               ; preds = %59, %215
  %63 = phi float [ %220, %215 ], [ 0.000000e+00, %59 ]
  %64 = phi i32 [ %216, %215 ], [ %40, %59 ]
  %65 = add i32 %64, %26
  %66 = mul nsw i32 %65, %31
  %67 = add i32 %65, %51
  %68 = mul nsw i32 %67, %31
  br label %207

69:                                               ; preds = %215, %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %45, label %70, label %241

70:                                               ; preds = %69
  %71 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 0), align 16, !tbaa !7
  %72 = fadd contract float %71, 0.000000e+00
  %73 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 1), align 4, !tbaa !7
  %74 = fadd contract float %72, %73
  %75 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 2), align 8, !tbaa !7
  %76 = fadd contract float %74, %75
  %77 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 3), align 4, !tbaa !7
  %78 = fadd contract float %76, %77
  %79 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 4), align 16, !tbaa !7
  %80 = fadd contract float %78, %79
  %81 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 5), align 4, !tbaa !7
  %82 = fadd contract float %80, %81
  %83 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 6), align 8, !tbaa !7
  %84 = fadd contract float %82, %83
  %85 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 7), align 4, !tbaa !7
  %86 = fadd contract float %84, %85
  %87 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 8), align 16, !tbaa !7
  %88 = fadd contract float %86, %87
  %89 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 9), align 4, !tbaa !7
  %90 = fadd contract float %88, %89
  %91 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 10), align 8, !tbaa !7
  %92 = fadd contract float %90, %91
  %93 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 11), align 4, !tbaa !7
  %94 = fadd contract float %92, %93
  %95 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 12), align 16, !tbaa !7
  %96 = fadd contract float %94, %95
  %97 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 13), align 4, !tbaa !7
  %98 = fadd contract float %96, %97
  %99 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 14), align 8, !tbaa !7
  %100 = fadd contract float %98, %99
  %101 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 15), align 4, !tbaa !7
  %102 = fadd contract float %100, %101
  %103 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 16), align 16, !tbaa !7
  %104 = fadd contract float %102, %103
  %105 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 17), align 4, !tbaa !7
  %106 = fadd contract float %104, %105
  %107 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 18), align 8, !tbaa !7
  %108 = fadd contract float %106, %107
  %109 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 19), align 4, !tbaa !7
  %110 = fadd contract float %108, %109
  %111 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 20), align 16, !tbaa !7
  %112 = fadd contract float %110, %111
  %113 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 21), align 4, !tbaa !7
  %114 = fadd contract float %112, %113
  %115 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 22), align 8, !tbaa !7
  %116 = fadd contract float %114, %115
  %117 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 23), align 4, !tbaa !7
  %118 = fadd contract float %116, %117
  %119 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 24), align 16, !tbaa !7
  %120 = fadd contract float %118, %119
  %121 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 25), align 4, !tbaa !7
  %122 = fadd contract float %120, %121
  %123 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 26), align 8, !tbaa !7
  %124 = fadd contract float %122, %123
  %125 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 27), align 4, !tbaa !7
  %126 = fadd contract float %124, %125
  %127 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 28), align 16, !tbaa !7
  %128 = fadd contract float %126, %127
  %129 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 29), align 4, !tbaa !7
  %130 = fadd contract float %128, %129
  %131 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 30), align 8, !tbaa !7
  %132 = fadd contract float %130, %131
  %133 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 31), align 4, !tbaa !7
  %134 = fadd contract float %132, %133
  %135 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 32), align 16, !tbaa !7
  %136 = fadd contract float %134, %135
  %137 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 33), align 4, !tbaa !7
  %138 = fadd contract float %136, %137
  %139 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 34), align 8, !tbaa !7
  %140 = fadd contract float %138, %139
  %141 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 35), align 4, !tbaa !7
  %142 = fadd contract float %140, %141
  %143 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 36), align 16, !tbaa !7
  %144 = fadd contract float %142, %143
  %145 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 37), align 4, !tbaa !7
  %146 = fadd contract float %144, %145
  %147 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 38), align 8, !tbaa !7
  %148 = fadd contract float %146, %147
  %149 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 39), align 4, !tbaa !7
  %150 = fadd contract float %148, %149
  %151 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 40), align 16, !tbaa !7
  %152 = fadd contract float %150, %151
  %153 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 41), align 4, !tbaa !7
  %154 = fadd contract float %152, %153
  %155 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 42), align 8, !tbaa !7
  %156 = fadd contract float %154, %155
  %157 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 43), align 4, !tbaa !7
  %158 = fadd contract float %156, %157
  %159 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 44), align 16, !tbaa !7
  %160 = fadd contract float %158, %159
  %161 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 45), align 4, !tbaa !7
  %162 = fadd contract float %160, %161
  %163 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 46), align 8, !tbaa !7
  %164 = fadd contract float %162, %163
  %165 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 47), align 4, !tbaa !7
  %166 = fadd contract float %164, %165
  %167 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 48), align 16, !tbaa !7
  %168 = fadd contract float %166, %167
  %169 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 49), align 4, !tbaa !7
  %170 = fadd contract float %168, %169
  %171 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 50), align 8, !tbaa !7
  %172 = fadd contract float %170, %171
  %173 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 51), align 4, !tbaa !7
  %174 = fadd contract float %172, %173
  %175 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 52), align 16, !tbaa !7
  %176 = fadd contract float %174, %175
  %177 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 53), align 4, !tbaa !7
  %178 = fadd contract float %176, %177
  %179 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 54), align 8, !tbaa !7
  %180 = fadd contract float %178, %179
  %181 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 55), align 4, !tbaa !7
  %182 = fadd contract float %180, %181
  %183 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 56), align 16, !tbaa !7
  %184 = fadd contract float %182, %183
  %185 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 57), align 4, !tbaa !7
  %186 = fadd contract float %184, %185
  %187 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 58), align 8, !tbaa !7
  %188 = fadd contract float %186, %187
  %189 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 59), align 4, !tbaa !7
  %190 = fadd contract float %188, %189
  %191 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 60), align 16, !tbaa !7
  %192 = fadd contract float %190, %191
  %193 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 61), align 4, !tbaa !7
  %194 = fadd contract float %192, %193
  %195 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 62), align 8, !tbaa !7
  %196 = fadd contract float %194, %195
  %197 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ19Correlation_forwardPfiiiS_iiiS_iiiiiE8prod_sum, i32 0, i32 63), align 4, !tbaa !7
  %198 = fadd contract float %196, %197
  %199 = add i32 %54, %60
  %200 = mul i32 %199, %2
  %201 = add i32 %200, %23
  %202 = mul i32 %201, %3
  %203 = add i32 %202, %27
  %204 = fdiv contract float %198, %34
  %205 = sext i32 %203 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %0, i64 %205
  store float %204, float addrspace(1)* %206, align 4, !tbaa !7
  br label %241

207:                                              ; preds = %62, %219
  %208 = phi float [ %63, %62 ], [ %220, %219 ]
  %209 = phi i32 [ %40, %62 ], [ %221, %219 ]
  br i1 %42, label %210, label %219

210:                                              ; preds = %207
  %211 = add i32 %209, %29
  %212 = mul nsw i32 %211, %5
  %213 = add i32 %211, %61
  %214 = mul nsw i32 %213, %5
  br label %223

215:                                              ; preds = %219
  %216 = add i32 %64, 1
  %217 = icmp eq i32 %64, %48
  br i1 %217, label %69, label %62, !llvm.loop !11

218:                                              ; preds = %223
  store float %238, float addrspace(3)* %39, align 4, !tbaa !7
  br label %219

219:                                              ; preds = %218, %207
  %220 = phi float [ %238, %218 ], [ %208, %207 ]
  %221 = add i32 %209, 1
  %222 = icmp eq i32 %209, %48
  br i1 %222, label %215, label %207, !llvm.loop !12

223:                                              ; preds = %210, %223
  %224 = phi float [ %208, %210 ], [ %238, %223 ]
  %225 = phi i32 [ %30, %210 ], [ %239, %223 ]
  %226 = add i32 %225, %44
  %227 = add i32 %226, %66
  %228 = add i32 %227, %212
  %229 = add i32 %226, %68
  %230 = add i32 %229, %214
  %231 = sext i32 %228 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %4, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !7
  %234 = sext i32 %230 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %8, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !7
  %237 = fmul contract float %233, %236
  %238 = fadd contract float %224, %237
  %239 = add nuw nsw i32 %225, 64
  %240 = icmp slt i32 %239, %5
  br i1 %240, label %223, label %218, !llvm.loop !13

241:                                              ; preds = %70, %69
  %242 = add i32 %60, 1
  %243 = icmp eq i32 %60, %19
  br i1 %243, label %56, label %59, !llvm.loop !14
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
