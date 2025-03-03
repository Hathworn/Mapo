; ModuleID = '../data/hip_kernels/3175/0/main.cu'
source_filename = "../data/hip_kernels/3175/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22cuda_multiplicarmatrizPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = shl nsw i32 %3, 4
  %11 = mul nsw i32 %10, %7
  %12 = add nsw i32 %11, %3
  %13 = shl nsw i32 %6, 4
  %14 = shl nsw i32 %4, 4
  %15 = icmp sgt i32 %3, 0
  br i1 %15, label %18, label %16

16:                                               ; preds = %5
  %17 = mul nsw i32 %9, %4
  br label %57

18:                                               ; preds = %5
  %19 = mul nsw i32 %9, %3
  %20 = add i32 %19, %8
  %21 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 %8
  %22 = mul nsw i32 %9, %4
  %23 = add i32 %22, %8
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 %9, i32 %8
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 0
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 0, i32 %8
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 1
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 1, i32 %8
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 2
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 2, i32 %8
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 3
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 3, i32 %8
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 4
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 4, i32 %8
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 5
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 5, i32 %8
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 6
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 6, i32 %8
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 7
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 7, i32 %8
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 8
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 8, i32 %8
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 9
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 9, i32 %8
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 10
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 10, i32 %8
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 11
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 11, i32 %8
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 12
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 12, i32 %8
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 13
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 13, i32 %8
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 14
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 14, i32 %8
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Msub, i32 0, i32 %9, i32 15
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ22cuda_multiplicarmatrizPfS_S_iiE4Nsub, i32 0, i32 15, i32 %8
  br label %66

57:                                               ; preds = %66, %16
  %58 = phi i32 [ %17, %16 ], [ %22, %66 ]
  %59 = phi float [ 0.000000e+00, %16 ], [ %141, %66 ]
  %60 = mul nsw i32 %14, %7
  %61 = add i32 %13, %8
  %62 = add i32 %61, %58
  %63 = add i32 %62, %60
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  store float %59, float addrspace(1)* %65, align 4, !tbaa !5
  ret void

66:                                               ; preds = %18, %66
  %67 = phi float [ 0.000000e+00, %18 ], [ %141, %66 ]
  %68 = phi i32 [ %13, %18 ], [ %143, %66 ]
  %69 = phi i32 [ %11, %18 ], [ %142, %66 ]
  %70 = add i32 %20, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %73, float addrspace(3)* %21, align 4, !tbaa !5
  %74 = add i32 %23, %68
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %77, float addrspace(3)* %24, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = load float, float addrspace(3)* %25, align 16, !tbaa !5
  %79 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %80 = fmul contract float %78, %79
  %81 = fadd contract float %67, %80
  %82 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %83 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %84 = fmul contract float %82, %83
  %85 = fadd contract float %81, %84
  %86 = load float, float addrspace(3)* %29, align 8, !tbaa !5
  %87 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %88 = fmul contract float %86, %87
  %89 = fadd contract float %85, %88
  %90 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %91 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %92 = fmul contract float %90, %91
  %93 = fadd contract float %89, %92
  %94 = load float, float addrspace(3)* %33, align 16, !tbaa !5
  %95 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %96 = fmul contract float %94, %95
  %97 = fadd contract float %93, %96
  %98 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %99 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %100 = fmul contract float %98, %99
  %101 = fadd contract float %97, %100
  %102 = load float, float addrspace(3)* %37, align 8, !tbaa !5
  %103 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %104 = fmul contract float %102, %103
  %105 = fadd contract float %101, %104
  %106 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %107 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %108 = fmul contract float %106, %107
  %109 = fadd contract float %105, %108
  %110 = load float, float addrspace(3)* %41, align 16, !tbaa !5
  %111 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %109, %112
  %114 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %115 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %113, %116
  %118 = load float, float addrspace(3)* %45, align 8, !tbaa !5
  %119 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %117, %120
  %122 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %123 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %121, %124
  %126 = load float, float addrspace(3)* %49, align 16, !tbaa !5
  %127 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %131 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %53, align 8, !tbaa !5
  %135 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  %138 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %139 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %137, %140
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %142 = add nsw i32 %69, 16
  %143 = add nsw i32 %68, %14
  %144 = icmp slt i32 %142, %12
  br i1 %144, label %66, label %57, !llvm.loop !10
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
