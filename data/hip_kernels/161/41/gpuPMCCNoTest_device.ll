; ModuleID = '../data/hip_kernels/161/41/main.cu'
source_filename = "../data/hip_kernels/161/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE5meanA = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE5meanB = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE3sdA = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE3sdB = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE10threadSums = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_Pf(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = zext i32 %10 to i64
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = zext i32 %12 to i64
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = zext i32 %14 to i64
  %16 = icmp ult i64 %11, %1
  %17 = icmp ult i64 %13, %3
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %105

19:                                               ; preds = %9
  %20 = icmp eq i32 %14, 0
  br i1 %20, label %21, label %37

21:                                               ; preds = %19
  %22 = mul i64 %11, %3
  %23 = add i64 %22, %13
  %24 = shl i64 %23, 1
  %25 = getelementptr inbounds float, float addrspace(1)* %6, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %26, float addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE5meanA, align 4, !tbaa !5
  %27 = add nuw nsw i64 %24, 1
  %28 = getelementptr inbounds float, float addrspace(1)* %6, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %29, float addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE5meanB, align 4, !tbaa !5
  %30 = getelementptr inbounds float, float addrspace(1)* %7, i64 %24
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %31, float addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE3sdA, align 4, !tbaa !5
  %32 = getelementptr inbounds float, float addrspace(1)* %7, i64 %27
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %33, float addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE3sdB, align 4, !tbaa !5
  %34 = getelementptr inbounds float, float addrspace(1)* %5, i64 %23
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fadd contract float %35, -1.000000e+00
  br label %37

37:                                               ; preds = %21, %19
  %38 = phi float [ %36, %21 ], [ 0x7FF8000000000000, %19 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %14
  store float 0.000000e+00, float addrspace(3)* %39, align 4, !tbaa !5
  %40 = icmp ult i64 %15, %4
  br i1 %40, label %41, label %66

41:                                               ; preds = %37
  %42 = mul i64 %11, %4
  %43 = mul i64 %13, %4
  %44 = load float, float addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE5meanA, align 4, !tbaa !5
  %45 = load float, float addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE3sdA, align 4, !tbaa !5
  %46 = load float, float addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE5meanB, align 4, !tbaa !5
  %47 = load float, float addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE3sdB, align 4, !tbaa !5
  br label %48

48:                                               ; preds = %41, %48
  %49 = phi float [ 0.000000e+00, %41 ], [ %62, %48 ]
  %50 = phi i64 [ %15, %41 ], [ %63, %48 ]
  %51 = add i64 %50, %42
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = add i64 %50, %43
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = fsub contract float %53, %44
  %58 = fdiv contract float %57, %45
  %59 = fsub contract float %56, %46
  %60 = fdiv contract float %59, %47
  %61 = fmul contract float %58, %60
  %62 = fadd contract float %49, %61
  %63 = add i64 %50, 16
  %64 = icmp ult i64 %63, %4
  br i1 %64, label %48, label %65, !llvm.loop !10

65:                                               ; preds = %48
  store float %62, float addrspace(3)* %39, align 4, !tbaa !5
  br label %66

66:                                               ; preds = %65, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = icmp ult i32 %14, 8
  br i1 %67, label %68, label %74

68:                                               ; preds = %66
  %69 = add nuw nsw i32 %14, 8
  %70 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %72 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %73 = fadd contract float %71, %72
  store float %73, float addrspace(3)* %39, align 4, !tbaa !5
  br label %74

74:                                               ; preds = %68, %66
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = icmp ult i32 %14, 4
  br i1 %75, label %76, label %82

76:                                               ; preds = %74
  %77 = add nuw nsw i32 %14, 4
  %78 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %77
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %80 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %81 = fadd contract float %79, %80
  store float %81, float addrspace(3)* %39, align 4, !tbaa !5
  br label %82

82:                                               ; preds = %76, %74
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = icmp ult i32 %14, 2
  br i1 %83, label %84, label %90

84:                                               ; preds = %82
  %85 = add nuw nsw i32 %14, 2
  %86 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %88 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %89 = fadd contract float %87, %88
  store float %89, float addrspace(3)* %39, align 4, !tbaa !5
  br label %90

90:                                               ; preds = %84, %82
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = icmp eq i32 %14, 0
  br i1 %91, label %92, label %98

92:                                               ; preds = %90
  %93 = add nuw nsw i32 %14, 1
  %94 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %93
  %95 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %96 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %97 = fadd contract float %95, %96
  store float %97, float addrspace(3)* %39, align 4, !tbaa !5
  br label %98

98:                                               ; preds = %92, %90
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %99, label %105

99:                                               ; preds = %98
  %100 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ13gpuPMCCNoTestPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 0), align 16, !tbaa !5
  %101 = fdiv contract float %100, %38
  %102 = mul i64 %11, %3
  %103 = add i64 %102, %13
  %104 = getelementptr inbounds float, float addrspace(1)* %8, i64 %103
  store float %101, float addrspace(1)* %104, align 4, !tbaa !5
  br label %105

105:                                              ; preds = %98, %99, %9
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
