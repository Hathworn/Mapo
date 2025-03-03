; ModuleID = '../data/hip_kernels/501/38/main.cu'
source_filename = "../data/hip_kernels/501/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE5meanA = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE5meanB = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE3sdA = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE3sdB = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE10threadSums = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7gpuPMCCPKfmS0_mmS0_S0_S0_Pf(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = zext i32 %10 to i64
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = zext i32 %12 to i64
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = zext i32 %14 to i64
  %16 = icmp ult i64 %11, %1
  %17 = icmp ult i64 %13, %3
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %110

19:                                               ; preds = %9
  %20 = icmp eq i32 %14, 0
  br i1 %20, label %21, label %37

21:                                               ; preds = %19
  %22 = mul i64 %11, %3
  %23 = add i64 %22, %13
  %24 = shl i64 %23, 1
  %25 = getelementptr inbounds float, float addrspace(1)* %6, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %26, float addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE5meanA, align 4, !tbaa !5
  %27 = add nuw nsw i64 %24, 1
  %28 = getelementptr inbounds float, float addrspace(1)* %6, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %29, float addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE5meanB, align 4, !tbaa !5
  %30 = getelementptr inbounds float, float addrspace(1)* %7, i64 %24
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %31, float addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE3sdA, align 4, !tbaa !5
  %32 = getelementptr inbounds float, float addrspace(1)* %7, i64 %27
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %33, float addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE3sdB, align 4, !tbaa !5
  %34 = getelementptr inbounds float, float addrspace(1)* %5, i64 %23
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fadd contract float %35, -1.000000e+00
  br label %37

37:                                               ; preds = %21, %19
  %38 = phi float [ %36, %21 ], [ 0x7FF8000000000000, %19 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %14
  store float 0.000000e+00, float addrspace(3)* %39, align 4, !tbaa !5
  %40 = icmp ult i64 %15, %4
  br i1 %40, label %41, label %71

41:                                               ; preds = %37
  %42 = mul i64 %11, %4
  %43 = mul i64 %13, %4
  %44 = load float, float addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE5meanA, align 4
  %45 = load float, float addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE3sdA, align 4
  %46 = load float, float addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE5meanB, align 4
  %47 = load float, float addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE3sdB, align 4
  br label %48

48:                                               ; preds = %41, %67
  %49 = phi float [ 0.000000e+00, %41 ], [ %68, %67 ]
  %50 = phi i64 [ %15, %41 ], [ %69, %67 ]
  %51 = add i64 %50, %42
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = add i64 %50, %43
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = fcmp uno float %53, 0.000000e+00
  %58 = fcmp uno float %56, 0.000000e+00
  %59 = select i1 %57, i1 true, i1 %58
  br i1 %59, label %67, label %60

60:                                               ; preds = %48
  %61 = fsub contract float %53, %44
  %62 = fdiv contract float %61, %45
  %63 = fsub contract float %56, %46
  %64 = fdiv contract float %63, %47
  %65 = fmul contract float %62, %64
  %66 = fadd contract float %49, %65
  store float %66, float addrspace(3)* %39, align 4, !tbaa !5
  br label %67

67:                                               ; preds = %48, %60
  %68 = phi float [ %49, %48 ], [ %66, %60 ]
  %69 = add i64 %50, 16
  %70 = icmp ult i64 %69, %4
  br i1 %70, label %48, label %71, !llvm.loop !10

71:                                               ; preds = %67, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = icmp ult i32 %14, 8
  br i1 %72, label %73, label %79

73:                                               ; preds = %71
  %74 = add nuw nsw i32 %14, 8
  %75 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %77 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %78 = fadd contract float %76, %77
  store float %78, float addrspace(3)* %39, align 4, !tbaa !5
  br label %79

79:                                               ; preds = %73, %71
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = icmp ult i32 %14, 4
  br i1 %80, label %81, label %87

81:                                               ; preds = %79
  %82 = add nuw nsw i32 %14, 4
  %83 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %82
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %85 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %86 = fadd contract float %84, %85
  store float %86, float addrspace(3)* %39, align 4, !tbaa !5
  br label %87

87:                                               ; preds = %81, %79
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %88 = icmp ult i32 %14, 2
  br i1 %88, label %89, label %95

89:                                               ; preds = %87
  %90 = add nuw nsw i32 %14, 2
  %91 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %93 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %94 = fadd contract float %92, %93
  store float %94, float addrspace(3)* %39, align 4, !tbaa !5
  br label %95

95:                                               ; preds = %89, %87
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = icmp eq i32 %14, 0
  br i1 %96, label %97, label %103

97:                                               ; preds = %95
  %98 = add nuw nsw i32 %14, 1
  %99 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 %98
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !5
  %101 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %102 = fadd contract float %100, %101
  store float %102, float addrspace(3)* %39, align 4, !tbaa !5
  br label %103

103:                                              ; preds = %97, %95
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %104, label %110

104:                                              ; preds = %103
  %105 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ7gpuPMCCPKfmS0_mmS0_S0_S0_PfE10threadSums, i32 0, i32 0), align 16, !tbaa !5
  %106 = fdiv contract float %105, %38
  %107 = mul i64 %11, %3
  %108 = add i64 %107, %13
  %109 = getelementptr inbounds float, float addrspace(1)* %8, i64 %108
  store float %106, float addrspace(1)* %109, align 4, !tbaa !5
  br label %110

110:                                              ; preds = %103, %104, %9
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
