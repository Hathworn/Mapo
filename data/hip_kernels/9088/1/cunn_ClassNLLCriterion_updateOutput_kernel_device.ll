; ModuleID = '../data/hip_kernels/9088/1/main.cu'
source_filename = "../data/hip_kernels/9088/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16
@_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* readonly %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 %10
  store float 0.000000e+00, float addrspace(3)* %11, align 4, !tbaa !5
  %12 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 %10
  store float 0.000000e+00, float addrspace(3)* %12, align 4, !tbaa !5
  %13 = icmp slt i32 %10, %6
  br i1 %13, label %14, label %48

14:                                               ; preds = %9
  %15 = icmp eq float addrspace(1)* %4, addrspacecast (float* null to float addrspace(1)*)
  br label %16

16:                                               ; preds = %14, %43
  %17 = phi float [ 0.000000e+00, %14 ], [ %44, %43 ]
  %18 = phi float [ 0.000000e+00, %14 ], [ %45, %43 ]
  %19 = phi i32 [ %10, %14 ], [ %46, %43 ]
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %3, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = fadd contract float %22, -1.000000e+00
  %24 = fptosi float %23 to i32
  %25 = icmp sgt i32 %24, -1
  %26 = icmp slt i32 %24, %8
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %43

28:                                               ; preds = %16
  br i1 %15, label %33, label %29

29:                                               ; preds = %28
  %30 = zext i32 %24 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %4, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %33

33:                                               ; preds = %28, %29
  %34 = phi contract float [ %32, %29 ], [ 1.000000e+00, %28 ]
  %35 = mul nsw i32 %19, %7
  %36 = add nsw i32 %35, %24
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = fmul contract float %34, %39
  %41 = fsub contract float %18, %40
  store float %41, float addrspace(3)* %11, align 4, !tbaa !5
  %42 = fadd contract float %34, %17
  store float %42, float addrspace(3)* %12, align 4, !tbaa !5
  br label %43

43:                                               ; preds = %16, %33
  %44 = phi float [ %17, %16 ], [ %42, %33 ]
  %45 = phi float [ %18, %16 ], [ %41, %33 ]
  %46 = add nuw nsw i32 %19, 32
  %47 = icmp slt i32 %46, %6
  br i1 %47, label %16, label %48, !llvm.loop !10

48:                                               ; preds = %43, %9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp eq i32 %10, 0
  br i1 %49, label %50, label %248

50:                                               ; preds = %48
  store float 0.000000e+00, float addrspace(1)* %1, align 4, !tbaa !5
  %51 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 0), align 16, !tbaa !5
  %52 = fadd contract float %51, 0.000000e+00
  store float %52, float addrspace(1)* %0, align 4, !tbaa !5
  %53 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 0), align 16, !tbaa !5
  %54 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %55 = fadd contract float %53, %54
  store float %55, float addrspace(1)* %1, align 4, !tbaa !5
  %56 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 1), align 4, !tbaa !5
  %57 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %58 = fadd contract float %56, %57
  store float %58, float addrspace(1)* %0, align 4, !tbaa !5
  %59 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 1), align 4, !tbaa !5
  %60 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %61 = fadd contract float %59, %60
  store float %61, float addrspace(1)* %1, align 4, !tbaa !5
  %62 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 2), align 8, !tbaa !5
  %63 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %64 = fadd contract float %62, %63
  store float %64, float addrspace(1)* %0, align 4, !tbaa !5
  %65 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 2), align 8, !tbaa !5
  %66 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %67 = fadd contract float %65, %66
  store float %67, float addrspace(1)* %1, align 4, !tbaa !5
  %68 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 3), align 4, !tbaa !5
  %69 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %70 = fadd contract float %68, %69
  store float %70, float addrspace(1)* %0, align 4, !tbaa !5
  %71 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 3), align 4, !tbaa !5
  %72 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %73 = fadd contract float %71, %72
  store float %73, float addrspace(1)* %1, align 4, !tbaa !5
  %74 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 4), align 16, !tbaa !5
  %75 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %76 = fadd contract float %74, %75
  store float %76, float addrspace(1)* %0, align 4, !tbaa !5
  %77 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 4), align 16, !tbaa !5
  %78 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %79 = fadd contract float %77, %78
  store float %79, float addrspace(1)* %1, align 4, !tbaa !5
  %80 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 5), align 4, !tbaa !5
  %81 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %82 = fadd contract float %80, %81
  store float %82, float addrspace(1)* %0, align 4, !tbaa !5
  %83 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 5), align 4, !tbaa !5
  %84 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %85 = fadd contract float %83, %84
  store float %85, float addrspace(1)* %1, align 4, !tbaa !5
  %86 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 6), align 8, !tbaa !5
  %87 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %88 = fadd contract float %86, %87
  store float %88, float addrspace(1)* %0, align 4, !tbaa !5
  %89 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 6), align 8, !tbaa !5
  %90 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %91 = fadd contract float %89, %90
  store float %91, float addrspace(1)* %1, align 4, !tbaa !5
  %92 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 7), align 4, !tbaa !5
  %93 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %94 = fadd contract float %92, %93
  store float %94, float addrspace(1)* %0, align 4, !tbaa !5
  %95 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 7), align 4, !tbaa !5
  %96 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %97 = fadd contract float %95, %96
  store float %97, float addrspace(1)* %1, align 4, !tbaa !5
  %98 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 8), align 16, !tbaa !5
  %99 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %100 = fadd contract float %98, %99
  store float %100, float addrspace(1)* %0, align 4, !tbaa !5
  %101 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 8), align 16, !tbaa !5
  %102 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %103 = fadd contract float %101, %102
  store float %103, float addrspace(1)* %1, align 4, !tbaa !5
  %104 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 9), align 4, !tbaa !5
  %105 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %106 = fadd contract float %104, %105
  store float %106, float addrspace(1)* %0, align 4, !tbaa !5
  %107 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 9), align 4, !tbaa !5
  %108 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %109 = fadd contract float %107, %108
  store float %109, float addrspace(1)* %1, align 4, !tbaa !5
  %110 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 10), align 8, !tbaa !5
  %111 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %112 = fadd contract float %110, %111
  store float %112, float addrspace(1)* %0, align 4, !tbaa !5
  %113 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 10), align 8, !tbaa !5
  %114 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %115 = fadd contract float %113, %114
  store float %115, float addrspace(1)* %1, align 4, !tbaa !5
  %116 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 11), align 4, !tbaa !5
  %117 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %118 = fadd contract float %116, %117
  store float %118, float addrspace(1)* %0, align 4, !tbaa !5
  %119 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 11), align 4, !tbaa !5
  %120 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %121 = fadd contract float %119, %120
  store float %121, float addrspace(1)* %1, align 4, !tbaa !5
  %122 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 12), align 16, !tbaa !5
  %123 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %124 = fadd contract float %122, %123
  store float %124, float addrspace(1)* %0, align 4, !tbaa !5
  %125 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 12), align 16, !tbaa !5
  %126 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %127 = fadd contract float %125, %126
  store float %127, float addrspace(1)* %1, align 4, !tbaa !5
  %128 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 13), align 4, !tbaa !5
  %129 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %130 = fadd contract float %128, %129
  store float %130, float addrspace(1)* %0, align 4, !tbaa !5
  %131 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 13), align 4, !tbaa !5
  %132 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %133 = fadd contract float %131, %132
  store float %133, float addrspace(1)* %1, align 4, !tbaa !5
  %134 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 14), align 8, !tbaa !5
  %135 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %136 = fadd contract float %134, %135
  store float %136, float addrspace(1)* %0, align 4, !tbaa !5
  %137 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 14), align 8, !tbaa !5
  %138 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %139 = fadd contract float %137, %138
  store float %139, float addrspace(1)* %1, align 4, !tbaa !5
  %140 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 15), align 4, !tbaa !5
  %141 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %142 = fadd contract float %140, %141
  store float %142, float addrspace(1)* %0, align 4, !tbaa !5
  %143 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 15), align 4, !tbaa !5
  %144 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %145 = fadd contract float %143, %144
  store float %145, float addrspace(1)* %1, align 4, !tbaa !5
  %146 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 16), align 16, !tbaa !5
  %147 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %148 = fadd contract float %146, %147
  store float %148, float addrspace(1)* %0, align 4, !tbaa !5
  %149 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 16), align 16, !tbaa !5
  %150 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %151 = fadd contract float %149, %150
  store float %151, float addrspace(1)* %1, align 4, !tbaa !5
  %152 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 17), align 4, !tbaa !5
  %153 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %154 = fadd contract float %152, %153
  store float %154, float addrspace(1)* %0, align 4, !tbaa !5
  %155 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 17), align 4, !tbaa !5
  %156 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %157 = fadd contract float %155, %156
  store float %157, float addrspace(1)* %1, align 4, !tbaa !5
  %158 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 18), align 8, !tbaa !5
  %159 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %160 = fadd contract float %158, %159
  store float %160, float addrspace(1)* %0, align 4, !tbaa !5
  %161 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 18), align 8, !tbaa !5
  %162 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %163 = fadd contract float %161, %162
  store float %163, float addrspace(1)* %1, align 4, !tbaa !5
  %164 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 19), align 4, !tbaa !5
  %165 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %166 = fadd contract float %164, %165
  store float %166, float addrspace(1)* %0, align 4, !tbaa !5
  %167 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 19), align 4, !tbaa !5
  %168 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %169 = fadd contract float %167, %168
  store float %169, float addrspace(1)* %1, align 4, !tbaa !5
  %170 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 20), align 16, !tbaa !5
  %171 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %172 = fadd contract float %170, %171
  store float %172, float addrspace(1)* %0, align 4, !tbaa !5
  %173 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 20), align 16, !tbaa !5
  %174 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %175 = fadd contract float %173, %174
  store float %175, float addrspace(1)* %1, align 4, !tbaa !5
  %176 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 21), align 4, !tbaa !5
  %177 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %178 = fadd contract float %176, %177
  store float %178, float addrspace(1)* %0, align 4, !tbaa !5
  %179 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 21), align 4, !tbaa !5
  %180 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %181 = fadd contract float %179, %180
  store float %181, float addrspace(1)* %1, align 4, !tbaa !5
  %182 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 22), align 8, !tbaa !5
  %183 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %184 = fadd contract float %182, %183
  store float %184, float addrspace(1)* %0, align 4, !tbaa !5
  %185 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 22), align 8, !tbaa !5
  %186 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %187 = fadd contract float %185, %186
  store float %187, float addrspace(1)* %1, align 4, !tbaa !5
  %188 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 23), align 4, !tbaa !5
  %189 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %190 = fadd contract float %188, %189
  store float %190, float addrspace(1)* %0, align 4, !tbaa !5
  %191 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 23), align 4, !tbaa !5
  %192 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %193 = fadd contract float %191, %192
  store float %193, float addrspace(1)* %1, align 4, !tbaa !5
  %194 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 24), align 16, !tbaa !5
  %195 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %196 = fadd contract float %194, %195
  store float %196, float addrspace(1)* %0, align 4, !tbaa !5
  %197 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 24), align 16, !tbaa !5
  %198 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %199 = fadd contract float %197, %198
  store float %199, float addrspace(1)* %1, align 4, !tbaa !5
  %200 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 25), align 4, !tbaa !5
  %201 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %202 = fadd contract float %200, %201
  store float %202, float addrspace(1)* %0, align 4, !tbaa !5
  %203 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 25), align 4, !tbaa !5
  %204 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %205 = fadd contract float %203, %204
  store float %205, float addrspace(1)* %1, align 4, !tbaa !5
  %206 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 26), align 8, !tbaa !5
  %207 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %208 = fadd contract float %206, %207
  store float %208, float addrspace(1)* %0, align 4, !tbaa !5
  %209 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 26), align 8, !tbaa !5
  %210 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %211 = fadd contract float %209, %210
  store float %211, float addrspace(1)* %1, align 4, !tbaa !5
  %212 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 27), align 4, !tbaa !5
  %213 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %214 = fadd contract float %212, %213
  store float %214, float addrspace(1)* %0, align 4, !tbaa !5
  %215 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 27), align 4, !tbaa !5
  %216 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %217 = fadd contract float %215, %216
  store float %217, float addrspace(1)* %1, align 4, !tbaa !5
  %218 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 28), align 16, !tbaa !5
  %219 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %220 = fadd contract float %218, %219
  store float %220, float addrspace(1)* %0, align 4, !tbaa !5
  %221 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 28), align 16, !tbaa !5
  %222 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %223 = fadd contract float %221, %222
  store float %223, float addrspace(1)* %1, align 4, !tbaa !5
  %224 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 29), align 4, !tbaa !5
  %225 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %226 = fadd contract float %224, %225
  store float %226, float addrspace(1)* %0, align 4, !tbaa !5
  %227 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 29), align 4, !tbaa !5
  %228 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %229 = fadd contract float %227, %228
  store float %229, float addrspace(1)* %1, align 4, !tbaa !5
  %230 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 30), align 8, !tbaa !5
  %231 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %232 = fadd contract float %230, %231
  store float %232, float addrspace(1)* %0, align 4, !tbaa !5
  %233 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 30), align 8, !tbaa !5
  %234 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %235 = fadd contract float %233, %234
  store float %235, float addrspace(1)* %1, align 4, !tbaa !5
  %236 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE8shInputs, i32 0, i32 31), align 4, !tbaa !5
  %237 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %238 = fadd contract float %236, %237
  store float %238, float addrspace(1)* %0, align 4, !tbaa !5
  %239 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_S_S_iiiiE10acc_weight, i32 0, i32 31), align 4, !tbaa !5
  %240 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %241 = fadd contract float %239, %240
  store float %241, float addrspace(1)* %1, align 4, !tbaa !5
  %242 = icmp ne i32 %5, 0
  %243 = fcmp contract ogt float %241, 0.000000e+00
  %244 = select i1 %242, i1 %243, i1 false
  br i1 %244, label %245, label %248

245:                                              ; preds = %50
  %246 = load float, float addrspace(1)* %0, align 4, !tbaa !5
  %247 = fdiv contract float %246, %241
  store float %247, float addrspace(1)* %0, align 4, !tbaa !5
  br label %248

248:                                              ; preds = %50, %245, %48
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
