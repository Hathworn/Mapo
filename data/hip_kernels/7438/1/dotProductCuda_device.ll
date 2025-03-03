; ModuleID = '../data/hip_kernels/7438/1/main.cu'
source_filename = "../data/hip_kernels/7438/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14dotProductCudaPfS_S_E2se = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14dotProductCudaPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 10
  %7 = or i32 %6, %4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %0, i64 %8
  %10 = load float, float addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = getelementptr inbounds float, float addrspace(1)* %1, i64 %8
  %12 = load float, float addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = fmul contract float %10, %12
  %14 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %4
  store float %13, float addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %15 = icmp ult i32 %4, 512
  br i1 %15, label %16, label %22

16:                                               ; preds = %3
  %17 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %18 = add nuw nsw i32 %4, 512
  %19 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %18
  %20 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %21 = fadd contract float %17, %20
  store float %21, float addrspace(3)* %14, align 4, !tbaa !5
  br label %22

22:                                               ; preds = %16, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = icmp ult i32 %4, 256
  br i1 %23, label %24, label %30

24:                                               ; preds = %22
  %25 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %26 = add nuw nsw i32 %4, 256
  %27 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %26
  %28 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %29 = fadd contract float %25, %28
  store float %29, float addrspace(3)* %14, align 4, !tbaa !5
  br label %30

30:                                               ; preds = %24, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp ult i32 %4, 128
  br i1 %31, label %32, label %38

32:                                               ; preds = %30
  %33 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %34 = add nuw nsw i32 %4, 128
  %35 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %34
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %37 = fadd contract float %33, %36
  store float %37, float addrspace(3)* %14, align 4, !tbaa !5
  br label %38

38:                                               ; preds = %32, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ult i32 %4, 64
  br i1 %39, label %40, label %46

40:                                               ; preds = %38
  %41 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %42 = add nuw nsw i32 %4, 64
  %43 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %42
  %44 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %45 = fadd contract float %41, %44
  store float %45, float addrspace(3)* %14, align 4, !tbaa !5
  br label %46

46:                                               ; preds = %40, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = icmp ult i32 %4, 32
  br i1 %47, label %48, label %54

48:                                               ; preds = %46
  %49 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %50 = add nuw nsw i32 %4, 32
  %51 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %50
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %53 = fadd contract float %49, %52
  store float %53, float addrspace(3)* %14, align 4, !tbaa !5
  br label %54

54:                                               ; preds = %48, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = icmp ult i32 %4, 16
  br i1 %55, label %56, label %62

56:                                               ; preds = %54
  %57 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %58 = add nuw nsw i32 %4, 16
  %59 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %58
  %60 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %61 = fadd contract float %57, %60
  store float %61, float addrspace(3)* %14, align 4, !tbaa !5
  br label %62

62:                                               ; preds = %56, %54
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ult i32 %4, 8
  br i1 %63, label %64, label %70

64:                                               ; preds = %62
  %65 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %66 = add nuw nsw i32 %4, 8
  %67 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %66
  %68 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %69 = fadd contract float %65, %68
  store float %69, float addrspace(3)* %14, align 4, !tbaa !5
  br label %70

70:                                               ; preds = %64, %62
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = icmp ult i32 %4, 4
  br i1 %71, label %72, label %78

72:                                               ; preds = %70
  %73 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %74 = add nuw nsw i32 %4, 4
  %75 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %77 = fadd contract float %73, %76
  store float %77, float addrspace(3)* %14, align 4, !tbaa !5
  br label %78

78:                                               ; preds = %72, %70
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = icmp ult i32 %4, 2
  br i1 %79, label %80, label %86

80:                                               ; preds = %78
  %81 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %82 = add nuw nsw i32 %4, 2
  %83 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %82
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %85 = fadd contract float %81, %84
  store float %85, float addrspace(3)* %14, align 4, !tbaa !5
  br label %86

86:                                               ; preds = %80, %78
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = icmp eq i32 %4, 0
  br i1 %87, label %88, label %94

88:                                               ; preds = %86
  %89 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %90 = add nuw nsw i32 %4, 1
  %91 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %93 = fadd contract float %89, %92
  store float %93, float addrspace(3)* %14, align 4, !tbaa !5
  br label %94

94:                                               ; preds = %88, %86
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = icmp eq i32 %4, 0
  br i1 %95, label %96, label %100

96:                                               ; preds = %94
  %97 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ14dotProductCudaPfS_S_E2se, i32 0, i32 0), align 16, !tbaa !5
  %98 = zext i32 %5 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  store float %97, float addrspace(1)* %99, align 4, !tbaa !5
  br label %100

100:                                              ; preds = %96, %94
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
