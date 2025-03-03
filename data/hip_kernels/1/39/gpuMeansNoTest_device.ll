; ModuleID = '../data/hip_kernels/1/39/main.cu'
source_filename = "../data/hip_kernels/1/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsA = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16
@_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsB = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16
@_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E5count = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14gpuMeansNoTestPKfmS0_mmPfS1_(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = zext i32 %8 to i64
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = zext i32 %10 to i64
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = zext i32 %12 to i64
  %14 = icmp ult i64 %9, %1
  %15 = icmp ult i64 %11, %3
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %121

17:                                               ; preds = %7
  %18 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %18, align 4, !tbaa !5
  %19 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %19, align 4, !tbaa !5
  %20 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E5count, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %20, align 4, !tbaa !5
  %21 = icmp ult i64 %13, %4
  br i1 %21, label %22, label %42

22:                                               ; preds = %17
  %23 = mul i64 %9, %4
  %24 = mul i64 %11, %4
  br label %25

25:                                               ; preds = %22, %25
  %26 = phi float [ 0.000000e+00, %22 ], [ %38, %25 ]
  %27 = phi float [ 0.000000e+00, %22 ], [ %37, %25 ]
  %28 = phi float [ 0.000000e+00, %22 ], [ %36, %25 ]
  %29 = phi i64 [ %13, %22 ], [ %39, %25 ]
  %30 = add i64 %29, %23
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = add i64 %29, %24
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fadd contract float %32, %28
  %37 = fadd contract float %35, %27
  %38 = fadd contract float %26, 1.000000e+00
  %39 = add i64 %29, 16
  %40 = icmp ult i64 %39, %4
  br i1 %40, label %25, label %41, !llvm.loop !10

41:                                               ; preds = %25
  store float %36, float addrspace(3)* %18, align 4, !tbaa !5
  store float %37, float addrspace(3)* %19, align 4, !tbaa !5
  store float %38, float addrspace(3)* %20, align 4, !tbaa !5
  br label %42

42:                                               ; preds = %41, %17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp ult i32 %12, 8
  br i1 %43, label %44, label %58

44:                                               ; preds = %42
  %45 = add nuw nsw i32 %12, 8
  %46 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %48 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %49 = fadd contract float %47, %48
  store float %49, float addrspace(3)* %18, align 4, !tbaa !5
  %50 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %45
  %51 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %52 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %53 = fadd contract float %51, %52
  store float %53, float addrspace(3)* %19, align 4, !tbaa !5
  %54 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E5count, i32 0, i32 %45
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %56 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %57 = fadd contract float %55, %56
  store float %57, float addrspace(3)* %20, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %44, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = icmp ult i32 %12, 4
  br i1 %59, label %60, label %74

60:                                               ; preds = %58
  %61 = add nuw nsw i32 %12, 4
  %62 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %64 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %65 = fadd contract float %63, %64
  store float %65, float addrspace(3)* %18, align 4, !tbaa !5
  %66 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %61
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %68 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %69 = fadd contract float %67, %68
  store float %69, float addrspace(3)* %19, align 4, !tbaa !5
  %70 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E5count, i32 0, i32 %61
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %72 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %73 = fadd contract float %71, %72
  store float %73, float addrspace(3)* %20, align 4, !tbaa !5
  br label %74

74:                                               ; preds = %60, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = icmp ult i32 %12, 2
  br i1 %75, label %76, label %90

76:                                               ; preds = %74
  %77 = add nuw nsw i32 %12, 2
  %78 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %77
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %80 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %81 = fadd contract float %79, %80
  store float %81, float addrspace(3)* %18, align 4, !tbaa !5
  %82 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %77
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %84 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %85 = fadd contract float %83, %84
  store float %85, float addrspace(3)* %19, align 4, !tbaa !5
  %86 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E5count, i32 0, i32 %77
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %88 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %89 = fadd contract float %87, %88
  store float %89, float addrspace(3)* %20, align 4, !tbaa !5
  br label %90

90:                                               ; preds = %76, %74
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = icmp eq i32 %12, 0
  br i1 %91, label %92, label %106

92:                                               ; preds = %90
  %93 = add nuw nsw i32 %12, 1
  %94 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 %93
  %95 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %96 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %97 = fadd contract float %95, %96
  store float %97, float addrspace(3)* %18, align 4, !tbaa !5
  %98 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 %93
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !5
  %100 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %101 = fadd contract float %99, %100
  store float %101, float addrspace(3)* %19, align 4, !tbaa !5
  %102 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E5count, i32 0, i32 %93
  %103 = load float, float addrspace(3)* %102, align 4, !tbaa !5
  %104 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %105 = fadd contract float %103, %104
  store float %105, float addrspace(3)* %20, align 4, !tbaa !5
  br label %106

106:                                              ; preds = %92, %90
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %107 = icmp eq i32 %12, 0
  br i1 %107, label %108, label %121

108:                                              ; preds = %106
  %109 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsA, i32 0, i32 0), align 16, !tbaa !5
  %110 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E5count, i32 0, i32 0), align 16, !tbaa !5
  %111 = fdiv contract float %109, %110
  %112 = mul i64 %9, %3
  %113 = add i64 %112, %11
  %114 = shl i64 %113, 1
  %115 = getelementptr inbounds float, float addrspace(1)* %5, i64 %114
  store float %111, float addrspace(1)* %115, align 4, !tbaa !5
  %116 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ14gpuMeansNoTestPKfmS0_mmPfS1_E11threadSumsB, i32 0, i32 0), align 16, !tbaa !5
  %117 = fdiv contract float %116, %110
  %118 = add nuw nsw i64 %114, 1
  %119 = getelementptr inbounds float, float addrspace(1)* %5, i64 %118
  store float %117, float addrspace(1)* %119, align 4, !tbaa !5
  %120 = getelementptr inbounds float, float addrspace(1)* %6, i64 %113
  store float %110, float addrspace(1)* %120, align 4, !tbaa !5
  br label %121

121:                                              ; preds = %106, %108, %7
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
