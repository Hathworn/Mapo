; ModuleID = '../data/hip_kernels/3573/76/main.cu'
source_filename = "../data/hip_kernels/3573/76/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA = internal unnamed_addr addrspace(3) global [243 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25median_reduce_shuffle_gpuPKfPfS1_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %6, 243
  %8 = add i32 %7, %5
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %2, i64 %9
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %12 = sitofp i32 %3 to float
  %13 = fmul contract float %11, %12
  %14 = tail call float @llvm.floor.f32(float %13)
  %15 = fptosi float %14 to i32
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %5
  store float %18, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = mul nuw nsw i32 %5, 3
  %21 = icmp ult i32 %5, 81
  br i1 %21, label %22, label %35

22:                                               ; preds = %4
  %23 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %20
  %24 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %25 = add nuw nsw i32 %20, 1
  %26 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %25
  %27 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %28 = add nuw nsw i32 %20, 2
  %29 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %28
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %31 = tail call float @llvm.minnum.f32(float %24, float %27)
  %32 = tail call float @llvm.maxnum.f32(float %24, float %27)
  %33 = tail call float @llvm.maxnum.f32(float %31, float %30)
  %34 = tail call float @llvm.minnum.f32(float %32, float %33)
  store float %34, float addrspace(3)* %23, align 4, !tbaa !5
  br label %35

35:                                               ; preds = %22, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = mul nuw nsw i32 %5, 9
  %37 = icmp ult i32 %5, 27
  br i1 %37, label %38, label %51

38:                                               ; preds = %35
  %39 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %36
  %40 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %41 = add nuw nsw i32 %36, 3
  %42 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %41
  %43 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %44 = add nuw nsw i32 %36, 6
  %45 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %44
  %46 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %47 = tail call float @llvm.minnum.f32(float %40, float %43)
  %48 = tail call float @llvm.maxnum.f32(float %40, float %43)
  %49 = tail call float @llvm.maxnum.f32(float %47, float %46)
  %50 = tail call float @llvm.minnum.f32(float %48, float %49)
  store float %50, float addrspace(3)* %39, align 4, !tbaa !5
  br label %51

51:                                               ; preds = %38, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = mul nuw nsw i32 %5, 27
  %53 = icmp ult i32 %5, 9
  br i1 %53, label %54, label %67

54:                                               ; preds = %51
  %55 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %52
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %57 = add nuw nsw i32 %52, 9
  %58 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %57
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %60 = add nuw nsw i32 %52, 18
  %61 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %60
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %63 = tail call float @llvm.minnum.f32(float %56, float %59)
  %64 = tail call float @llvm.maxnum.f32(float %56, float %59)
  %65 = tail call float @llvm.maxnum.f32(float %63, float %62)
  %66 = tail call float @llvm.minnum.f32(float %64, float %65)
  store float %66, float addrspace(3)* %55, align 4, !tbaa !5
  br label %67

67:                                               ; preds = %54, %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = mul nuw nsw i32 %5, 81
  %69 = icmp ult i32 %5, 3
  br i1 %69, label %70, label %83

70:                                               ; preds = %67
  %71 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %68
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %73 = add nuw nsw i32 %68, 27
  %74 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %76 = add nuw nsw i32 %68, 54
  %77 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %76
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %79 = tail call float @llvm.minnum.f32(float %72, float %75)
  %80 = tail call float @llvm.maxnum.f32(float %72, float %75)
  %81 = tail call float @llvm.maxnum.f32(float %79, float %78)
  %82 = tail call float @llvm.minnum.f32(float %80, float %81)
  store float %82, float addrspace(3)* %71, align 4, !tbaa !5
  br label %83

83:                                               ; preds = %70, %67
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = mul nuw nsw i32 %5, 243
  %85 = icmp eq i32 %5, 0
  br i1 %85, label %86, label %99

86:                                               ; preds = %83
  %87 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %84
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %89 = add nuw nsw i32 %84, 81
  %90 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %89
  %91 = load float, float addrspace(3)* %90, align 4, !tbaa !5
  %92 = add nuw nsw i32 %84, 162
  %93 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 %92
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %95 = tail call float @llvm.minnum.f32(float %88, float %91)
  %96 = tail call float @llvm.maxnum.f32(float %88, float %91)
  %97 = tail call float @llvm.maxnum.f32(float %95, float %94)
  %98 = tail call float @llvm.minnum.f32(float %96, float %97)
  store float %98, float addrspace(3)* %87, align 4, !tbaa !5
  br label %99

99:                                               ; preds = %86, %83
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %100 = icmp eq i32 %5, 0
  br i1 %100, label %101, label %105

101:                                              ; preds = %99
  %102 = load float, float addrspace(3)* getelementptr inbounds ([243 x float], [243 x float] addrspace(3)* @_ZZ25median_reduce_shuffle_gpuPKfPfS1_iE4DATA, i32 0, i32 0), align 16, !tbaa !5
  %103 = zext i32 %6 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  store float %102, float addrspace(1)* %104, align 4, !tbaa !5
  br label %105

105:                                              ; preds = %101, %99
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
