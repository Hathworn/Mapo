; ModuleID = '../data/hip_kernels/1/36/main.cu'
source_filename = "../data/hip_kernels/1/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsA = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16
@_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsB = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16
@_ZZ8gpuMeansPKfmS0_mmPfS1_E5count = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8gpuMeansPKfmS0_mmPfS1_(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = zext i32 %8 to i64
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = zext i32 %10 to i64
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = zext i32 %12 to i64
  %14 = icmp ult i64 %9, %1
  %15 = icmp ult i64 %11, %3
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %128

17:                                               ; preds = %7
  %18 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %18, align 4, !tbaa !5
  %19 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %19, align 4, !tbaa !5
  %20 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E5count, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %20, align 4, !tbaa !5
  %21 = icmp ult i64 %13, %4
  br i1 %21, label %22, label %49

22:                                               ; preds = %17
  %23 = mul i64 %9, %4
  %24 = mul i64 %11, %4
  br label %25

25:                                               ; preds = %22, %43
  %26 = phi float [ 0.000000e+00, %22 ], [ %44, %43 ]
  %27 = phi float [ 0.000000e+00, %22 ], [ %45, %43 ]
  %28 = phi float [ 0.000000e+00, %22 ], [ %46, %43 ]
  %29 = phi i64 [ %13, %22 ], [ %47, %43 ]
  %30 = add i64 %29, %23
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = add i64 %29, %24
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fcmp uno float %32, 0.000000e+00
  %37 = fcmp uno float %35, 0.000000e+00
  %38 = select i1 %36, i1 true, i1 %37
  br i1 %38, label %43, label %39

39:                                               ; preds = %25
  %40 = fadd contract float %32, %28
  store float %40, float addrspace(3)* %18, align 4, !tbaa !5
  %41 = fadd contract float %35, %27
  store float %41, float addrspace(3)* %19, align 4, !tbaa !5
  %42 = fadd contract float %26, 1.000000e+00
  store float %42, float addrspace(3)* %20, align 4, !tbaa !5
  br label %43

43:                                               ; preds = %25, %39
  %44 = phi float [ %26, %25 ], [ %42, %39 ]
  %45 = phi float [ %27, %25 ], [ %41, %39 ]
  %46 = phi float [ %28, %25 ], [ %40, %39 ]
  %47 = add i64 %29, 16
  %48 = icmp ult i64 %47, %4
  br i1 %48, label %25, label %49, !llvm.loop !10

49:                                               ; preds = %43, %17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %50 = icmp ult i32 %12, 8
  br i1 %50, label %51, label %65

51:                                               ; preds = %49
  %52 = add nuw nsw i32 %12, 8
  %53 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %52
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %55 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %56 = fadd contract float %54, %55
  store float %56, float addrspace(3)* %18, align 4, !tbaa !5
  %57 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %52
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %59 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %60 = fadd contract float %58, %59
  store float %60, float addrspace(3)* %19, align 4, !tbaa !5
  %61 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E5count, i32 0, i32 %52
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %63 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %64 = fadd contract float %62, %63
  store float %64, float addrspace(3)* %20, align 4, !tbaa !5
  br label %65

65:                                               ; preds = %51, %49
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %66 = icmp ult i32 %12, 4
  br i1 %66, label %67, label %81

67:                                               ; preds = %65
  %68 = add nuw nsw i32 %12, 4
  %69 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %71 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %72 = fadd contract float %70, %71
  store float %72, float addrspace(3)* %18, align 4, !tbaa !5
  %73 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %68
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %75 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %76 = fadd contract float %74, %75
  store float %76, float addrspace(3)* %19, align 4, !tbaa !5
  %77 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E5count, i32 0, i32 %68
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %79 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %80 = fadd contract float %78, %79
  store float %80, float addrspace(3)* %20, align 4, !tbaa !5
  br label %81

81:                                               ; preds = %67, %65
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = icmp ult i32 %12, 2
  br i1 %82, label %83, label %97

83:                                               ; preds = %81
  %84 = add nuw nsw i32 %12, 2
  %85 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %87 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %88 = fadd contract float %86, %87
  store float %88, float addrspace(3)* %18, align 4, !tbaa !5
  %89 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %84
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %91 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %92 = fadd contract float %90, %91
  store float %92, float addrspace(3)* %19, align 4, !tbaa !5
  %93 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E5count, i32 0, i32 %84
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %95 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %96 = fadd contract float %94, %95
  store float %96, float addrspace(3)* %20, align 4, !tbaa !5
  br label %97

97:                                               ; preds = %83, %81
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = icmp eq i32 %12, 0
  br i1 %98, label %99, label %113

99:                                               ; preds = %97
  %100 = add nuw nsw i32 %12, 1
  %101 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %100
  %102 = load float, float addrspace(3)* %101, align 4, !tbaa !5
  %103 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %104 = fadd contract float %102, %103
  store float %104, float addrspace(3)* %18, align 4, !tbaa !5
  %105 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %100
  %106 = load float, float addrspace(3)* %105, align 4, !tbaa !5
  %107 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %108 = fadd contract float %106, %107
  store float %108, float addrspace(3)* %19, align 4, !tbaa !5
  %109 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E5count, i32 0, i32 %100
  %110 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %111 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %112 = fadd contract float %110, %111
  store float %112, float addrspace(3)* %20, align 4, !tbaa !5
  br label %113

113:                                              ; preds = %99, %97
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = icmp eq i32 %12, 0
  br i1 %114, label %115, label %128

115:                                              ; preds = %113
  %116 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 0), align 16, !tbaa !5
  %117 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E5count, i32 0, i32 0), align 16, !tbaa !5
  %118 = fdiv contract float %116, %117
  %119 = mul i64 %9, %3
  %120 = add i64 %119, %11
  %121 = shl i64 %120, 1
  %122 = getelementptr inbounds float, float addrspace(1)* %5, i64 %121
  store float %118, float addrspace(1)* %122, align 4, !tbaa !5
  %123 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ8gpuMeansPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 0), align 16, !tbaa !5
  %124 = fdiv contract float %123, %117
  %125 = add nuw nsw i64 %121, 1
  %126 = getelementptr inbounds float, float addrspace(1)* %5, i64 %125
  store float %124, float addrspace(1)* %126, align 4, !tbaa !5
  %127 = getelementptr inbounds float, float addrspace(1)* %6, i64 %120
  store float %117, float addrspace(1)* %127, align 4, !tbaa !5
  br label %128

128:                                              ; preds = %113, %115, %7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
