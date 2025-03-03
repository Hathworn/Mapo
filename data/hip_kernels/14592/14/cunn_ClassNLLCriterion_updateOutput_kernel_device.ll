; ModuleID = '../data/hip_kernels/14592/14/main.cu'
source_filename = "../data/hip_kernels/14592/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 %8
  store float 0.000000e+00, float addrspace(3)* %9, align 4, !tbaa !5
  %10 = icmp slt i32 %8, %3
  br i1 %10, label %11, label %119

11:                                               ; preds = %7
  %12 = icmp sgt i32 %6, 0
  %13 = and i32 %6, 3
  %14 = icmp ult i32 %6, 4
  %15 = and i32 %6, -4
  %16 = icmp eq i32 %13, 0
  br label %17

17:                                               ; preds = %11, %115
  %18 = phi float [ 0.000000e+00, %11 ], [ %116, %115 ]
  %19 = phi i32 [ %8, %11 ], [ %117, %115 ]
  br i1 %12, label %20, label %115

20:                                               ; preds = %17
  %21 = mul nsw i32 %19, %6
  %22 = mul nsw i32 %19, %4
  %23 = add nsw i32 %22, -1
  br i1 %14, label %90, label %24

24:                                               ; preds = %20, %85
  %25 = phi float [ %86, %85 ], [ %18, %20 ]
  %26 = phi i32 [ %87, %85 ], [ 0, %20 ]
  %27 = phi i32 [ %88, %85 ], [ 0, %20 ]
  %28 = add nsw i32 %26, %21
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = fptosi float %31 to i32
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %40

34:                                               ; preds = %24
  %35 = add i32 %23, %32
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = fadd contract float %38, %25
  store float %39, float addrspace(3)* %9, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %24, %34
  %41 = phi float [ %25, %24 ], [ %39, %34 ]
  %42 = or i32 %26, 1
  %43 = add nsw i32 %42, %21
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = fptosi float %46 to i32
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %49, label %55

49:                                               ; preds = %40
  %50 = add i32 %23, %47
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = fadd contract float %53, %41
  store float %54, float addrspace(3)* %9, align 4, !tbaa !5
  br label %55

55:                                               ; preds = %49, %40
  %56 = phi float [ %41, %40 ], [ %54, %49 ]
  %57 = or i32 %26, 2
  %58 = add nsw i32 %57, %21
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = fptosi float %61 to i32
  %63 = icmp sgt i32 %62, 0
  br i1 %63, label %64, label %70

64:                                               ; preds = %55
  %65 = add i32 %23, %62
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  %69 = fadd contract float %68, %56
  store float %69, float addrspace(3)* %9, align 4, !tbaa !5
  br label %70

70:                                               ; preds = %64, %55
  %71 = phi float [ %56, %55 ], [ %69, %64 ]
  %72 = or i32 %26, 3
  %73 = add nsw i32 %72, %21
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = fptosi float %76 to i32
  %78 = icmp sgt i32 %77, 0
  br i1 %78, label %79, label %85

79:                                               ; preds = %70
  %80 = add i32 %23, %77
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = fadd contract float %83, %71
  store float %84, float addrspace(3)* %9, align 4, !tbaa !5
  br label %85

85:                                               ; preds = %79, %70
  %86 = phi float [ %71, %70 ], [ %84, %79 ]
  %87 = add nuw nsw i32 %26, 4
  %88 = add i32 %27, 4
  %89 = icmp eq i32 %88, %15
  br i1 %89, label %90, label %24, !llvm.loop !10

90:                                               ; preds = %85, %20
  %91 = phi float [ undef, %20 ], [ %86, %85 ]
  %92 = phi float [ %18, %20 ], [ %86, %85 ]
  %93 = phi i32 [ 0, %20 ], [ %87, %85 ]
  br i1 %16, label %115, label %94

94:                                               ; preds = %90, %110
  %95 = phi float [ %111, %110 ], [ %92, %90 ]
  %96 = phi i32 [ %112, %110 ], [ %93, %90 ]
  %97 = phi i32 [ %113, %110 ], [ 0, %90 ]
  %98 = add nsw i32 %96, %21
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  %102 = fptosi float %101 to i32
  %103 = icmp sgt i32 %102, 0
  br i1 %103, label %104, label %110

104:                                              ; preds = %94
  %105 = add i32 %23, %102
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  %109 = fadd contract float %108, %95
  store float %109, float addrspace(3)* %9, align 4, !tbaa !5
  br label %110

110:                                              ; preds = %104, %94
  %111 = phi float [ %95, %94 ], [ %109, %104 ]
  %112 = add nuw nsw i32 %96, 1
  %113 = add i32 %97, 1
  %114 = icmp eq i32 %113, %13
  br i1 %114, label %115, label %94, !llvm.loop !12

115:                                              ; preds = %90, %110, %17
  %116 = phi float [ %18, %17 ], [ %91, %90 ], [ %111, %110 ]
  %117 = add nuw nsw i32 %19, 32
  %118 = icmp slt i32 %117, %3
  br i1 %118, label %17, label %119, !llvm.loop !14

119:                                              ; preds = %115, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %120 = icmp eq i32 %8, 0
  br i1 %120, label %121, label %193

121:                                              ; preds = %119
  %122 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 0), align 16, !tbaa !5
  %123 = fadd contract float %122, 0.000000e+00
  %124 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 1), align 4, !tbaa !5
  %125 = fadd contract float %124, %123
  %126 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 2), align 8, !tbaa !5
  %127 = fadd contract float %126, %125
  %128 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 3), align 4, !tbaa !5
  %129 = fadd contract float %128, %127
  %130 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 4), align 16, !tbaa !5
  %131 = fadd contract float %130, %129
  %132 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 5), align 4, !tbaa !5
  %133 = fadd contract float %132, %131
  %134 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 6), align 8, !tbaa !5
  %135 = fadd contract float %134, %133
  %136 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 7), align 4, !tbaa !5
  %137 = fadd contract float %136, %135
  %138 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 8), align 16, !tbaa !5
  %139 = fadd contract float %138, %137
  %140 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 9), align 4, !tbaa !5
  %141 = fadd contract float %140, %139
  %142 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 10), align 8, !tbaa !5
  %143 = fadd contract float %142, %141
  %144 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 11), align 4, !tbaa !5
  %145 = fadd contract float %144, %143
  %146 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 12), align 16, !tbaa !5
  %147 = fadd contract float %146, %145
  %148 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 13), align 4, !tbaa !5
  %149 = fadd contract float %148, %147
  %150 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 14), align 8, !tbaa !5
  %151 = fadd contract float %150, %149
  %152 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 15), align 4, !tbaa !5
  %153 = fadd contract float %152, %151
  %154 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 16), align 16, !tbaa !5
  %155 = fadd contract float %154, %153
  %156 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 17), align 4, !tbaa !5
  %157 = fadd contract float %156, %155
  %158 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 18), align 8, !tbaa !5
  %159 = fadd contract float %158, %157
  %160 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 19), align 4, !tbaa !5
  %161 = fadd contract float %160, %159
  %162 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 20), align 16, !tbaa !5
  %163 = fadd contract float %162, %161
  %164 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 21), align 4, !tbaa !5
  %165 = fadd contract float %164, %163
  %166 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 22), align 8, !tbaa !5
  %167 = fadd contract float %166, %165
  %168 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 23), align 4, !tbaa !5
  %169 = fadd contract float %168, %167
  %170 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 24), align 16, !tbaa !5
  %171 = fadd contract float %170, %169
  %172 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 25), align 4, !tbaa !5
  %173 = fadd contract float %172, %171
  %174 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 26), align 8, !tbaa !5
  %175 = fadd contract float %174, %173
  %176 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 27), align 4, !tbaa !5
  %177 = fadd contract float %176, %175
  %178 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 28), align 16, !tbaa !5
  %179 = fadd contract float %178, %177
  %180 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 29), align 4, !tbaa !5
  %181 = fadd contract float %180, %179
  %182 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 30), align 8, !tbaa !5
  %183 = fadd contract float %182, %181
  %184 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ42cunn_ClassNLLCriterion_updateOutput_kernelPfS_S_iiiiE8shInputs, i32 0, i32 31), align 4, !tbaa !5
  %185 = fadd contract float %184, %183
  %186 = icmp eq i32 %5, 0
  br i1 %186, label %190, label %187

187:                                              ; preds = %121
  %188 = sitofp i32 %3 to float
  %189 = fdiv contract float %185, %188
  br label %190

190:                                              ; preds = %187, %121
  %191 = phi float [ %189, %187 ], [ %185, %121 ]
  %192 = fneg contract float %191
  store float %192, float addrspace(1)* %0, align 4, !tbaa !5
  br label %193

193:                                              ; preds = %190, %119
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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
