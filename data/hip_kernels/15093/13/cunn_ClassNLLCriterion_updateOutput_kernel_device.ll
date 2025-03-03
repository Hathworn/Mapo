; ModuleID = '../data/hip_kernels/15093/13/main.cu'
source_filename = "../data/hip_kernels/15093/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_b(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7, i1 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 %10
  store float 0.000000e+00, float addrspace(3)* %11, align 4, !tbaa !5
  %12 = icmp slt i32 %10, %3
  br i1 %12, label %13, label %112

13:                                               ; preds = %9
  %14 = icmp sgt i32 %6, 0
  %15 = and i32 %6, 1
  %16 = icmp eq i32 %6, 1
  %17 = and i32 %6, -2
  %18 = icmp eq i32 %15, 0
  br label %19

19:                                               ; preds = %13, %108
  %20 = phi float [ 0.000000e+00, %13 ], [ %109, %108 ]
  %21 = phi i32 [ %10, %13 ], [ %110, %108 ]
  br i1 %14, label %22, label %108

22:                                               ; preds = %19
  %23 = mul nsw i32 %21, %6
  %24 = mul nsw i32 %21, %4
  br i1 %16, label %81, label %25

25:                                               ; preds = %22, %76
  %26 = phi float [ %77, %76 ], [ %20, %22 ]
  %27 = phi i32 [ %78, %76 ], [ 0, %22 ]
  %28 = phi i32 [ %79, %76 ], [ 0, %22 ]
  %29 = add nsw i32 %27, %23
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = fptosi float %32 to i32
  %34 = add nsw i32 %33, -1
  %35 = icmp sgt i32 %33, 0
  br i1 %35, label %36, label %51

36:                                               ; preds = %25
  %37 = add nsw i32 %34, %24
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  br i1 %8, label %41, label %47

41:                                               ; preds = %36
  %42 = zext i32 %34 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %7, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5, !amdgpu.noclobber !9
  %45 = fmul contract float %40, %44
  %46 = fadd contract float %26, %45
  br label %49

47:                                               ; preds = %36
  %48 = fadd contract float %40, %26
  br label %49

49:                                               ; preds = %41, %47
  %50 = phi float [ %48, %47 ], [ %46, %41 ]
  store float %50, float addrspace(3)* %11, align 4, !tbaa !5
  br label %51

51:                                               ; preds = %49, %25
  %52 = phi float [ %26, %25 ], [ %50, %49 ]
  %53 = or i32 %27, 1
  %54 = add nsw i32 %53, %23
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = fptosi float %57 to i32
  %59 = add nsw i32 %58, -1
  %60 = icmp sgt i32 %58, 0
  br i1 %60, label %61, label %76

61:                                               ; preds = %51
  %62 = add nsw i32 %59, %24
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5
  br i1 %8, label %68, label %66

66:                                               ; preds = %61
  %67 = fadd contract float %65, %52
  br label %74

68:                                               ; preds = %61
  %69 = zext i32 %59 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %7, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  %72 = fmul contract float %65, %71
  %73 = fadd contract float %52, %72
  br label %74

74:                                               ; preds = %68, %66
  %75 = phi float [ %67, %66 ], [ %73, %68 ]
  store float %75, float addrspace(3)* %11, align 4, !tbaa !5
  br label %76

76:                                               ; preds = %74, %51
  %77 = phi float [ %52, %51 ], [ %75, %74 ]
  %78 = add nuw nsw i32 %27, 2
  %79 = add i32 %28, 2
  %80 = icmp eq i32 %79, %17
  br i1 %80, label %81, label %25, !llvm.loop !10

81:                                               ; preds = %76, %22
  %82 = phi float [ undef, %22 ], [ %77, %76 ]
  %83 = phi float [ %20, %22 ], [ %77, %76 ]
  %84 = phi i32 [ 0, %22 ], [ %78, %76 ]
  br i1 %18, label %108, label %85

85:                                               ; preds = %81
  %86 = add nsw i32 %84, %23
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = fptosi float %89 to i32
  %91 = add nsw i32 %90, -1
  %92 = icmp sgt i32 %90, 0
  br i1 %92, label %93, label %108

93:                                               ; preds = %85
  %94 = add nsw i32 %91, %24
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  br i1 %8, label %100, label %98

98:                                               ; preds = %93
  %99 = fadd contract float %97, %83
  br label %106

100:                                              ; preds = %93
  %101 = zext i32 %91 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %7, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = fmul contract float %97, %103
  %105 = fadd contract float %83, %104
  br label %106

106:                                              ; preds = %100, %98
  %107 = phi float [ %99, %98 ], [ %105, %100 ]
  store float %107, float addrspace(3)* %11, align 4, !tbaa !5
  br label %108

108:                                              ; preds = %81, %106, %85, %19
  %109 = phi float [ %20, %19 ], [ %82, %81 ], [ %83, %85 ], [ %107, %106 ]
  %110 = add nuw nsw i32 %21, 32
  %111 = icmp slt i32 %110, %3
  br i1 %111, label %19, label %112, !llvm.loop !12

112:                                              ; preds = %108, %9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %113 = icmp eq i32 %10, 0
  br i1 %113, label %114, label %186

114:                                              ; preds = %112
  %115 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 0), align 16, !tbaa !5
  %116 = fadd contract float %115, 0.000000e+00
  %117 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 1), align 4, !tbaa !5
  %118 = fadd contract float %117, %116
  %119 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 2), align 8, !tbaa !5
  %120 = fadd contract float %119, %118
  %121 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 3), align 4, !tbaa !5
  %122 = fadd contract float %121, %120
  %123 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 4), align 16, !tbaa !5
  %124 = fadd contract float %123, %122
  %125 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 5), align 4, !tbaa !5
  %126 = fadd contract float %125, %124
  %127 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 6), align 8, !tbaa !5
  %128 = fadd contract float %127, %126
  %129 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 7), align 4, !tbaa !5
  %130 = fadd contract float %129, %128
  %131 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 8), align 16, !tbaa !5
  %132 = fadd contract float %131, %130
  %133 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 9), align 4, !tbaa !5
  %134 = fadd contract float %133, %132
  %135 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 10), align 8, !tbaa !5
  %136 = fadd contract float %135, %134
  %137 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 11), align 4, !tbaa !5
  %138 = fadd contract float %137, %136
  %139 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 12), align 16, !tbaa !5
  %140 = fadd contract float %139, %138
  %141 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 13), align 4, !tbaa !5
  %142 = fadd contract float %141, %140
  %143 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 14), align 8, !tbaa !5
  %144 = fadd contract float %143, %142
  %145 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 15), align 4, !tbaa !5
  %146 = fadd contract float %145, %144
  %147 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 16), align 16, !tbaa !5
  %148 = fadd contract float %147, %146
  %149 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 17), align 4, !tbaa !5
  %150 = fadd contract float %149, %148
  %151 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 18), align 8, !tbaa !5
  %152 = fadd contract float %151, %150
  %153 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 19), align 4, !tbaa !5
  %154 = fadd contract float %153, %152
  %155 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 20), align 16, !tbaa !5
  %156 = fadd contract float %155, %154
  %157 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 21), align 4, !tbaa !5
  %158 = fadd contract float %157, %156
  %159 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 22), align 8, !tbaa !5
  %160 = fadd contract float %159, %158
  %161 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 23), align 4, !tbaa !5
  %162 = fadd contract float %161, %160
  %163 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 24), align 16, !tbaa !5
  %164 = fadd contract float %163, %162
  %165 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 25), align 4, !tbaa !5
  %166 = fadd contract float %165, %164
  %167 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 26), align 8, !tbaa !5
  %168 = fadd contract float %167, %166
  %169 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 27), align 4, !tbaa !5
  %170 = fadd contract float %169, %168
  %171 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 28), align 16, !tbaa !5
  %172 = fadd contract float %171, %170
  %173 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 29), align 4, !tbaa !5
  %174 = fadd contract float %173, %172
  %175 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 30), align 8, !tbaa !5
  %176 = fadd contract float %175, %174
  %177 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiS_bE8shInputs, i32 0, i32 31), align 4, !tbaa !5
  %178 = fadd contract float %177, %176
  %179 = icmp eq i32 %5, 0
  br i1 %179, label %183, label %180

180:                                              ; preds = %114
  %181 = sitofp i32 %3 to float
  %182 = fdiv contract float %178, %181
  br label %183

183:                                              ; preds = %180, %114
  %184 = phi float [ %182, %180 ], [ %178, %114 ]
  %185 = fneg contract float %184
  store float %185, float addrspace(1)* %0, align 4, !tbaa !5
  br label %186

186:                                              ; preds = %183, %112
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
!12 = distinct !{!12, !11}
