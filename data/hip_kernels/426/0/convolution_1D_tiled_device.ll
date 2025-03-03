; ModuleID = '../data/hip_kernels/426/0/main.cu'
source_filename = "../data/hip_kernels/426/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20convolution_1D_tiledPfS_S_E8N_shared = internal unnamed_addr addrspace(3) global [5 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20convolution_1D_tiledPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = mul i32 %4, 3
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add i32 %5, %6
  %8 = add i32 %7, -1
  %9 = icmp ult i32 %8, 5
  br i1 %9, label %10, label %14

10:                                               ; preds = %3
  %11 = zext i32 %8 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %14

14:                                               ; preds = %3, %10
  %15 = phi float [ %13, %10 ], [ 0.000000e+00, %3 ]
  %16 = getelementptr inbounds [5 x float], [5 x float] addrspace(3)* @_ZZ20convolution_1D_tiledPfS_S_E8N_shared, i32 0, i32 %6
  store float %15, float addrspace(3)* %16, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp ult i32 %6, 3
  br i1 %17, label %18, label %39

18:                                               ; preds = %14
  %19 = load float, float addrspace(1)* %1, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %21 = fmul contract float %19, %20
  %22 = fadd contract float %21, 0.000000e+00
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = add nuw nsw i32 %6, 1
  %26 = getelementptr inbounds [5 x float], [5 x float] addrspace(3)* @_ZZ20convolution_1D_tiledPfS_S_E8N_shared, i32 0, i32 %25
  %27 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %28 = fmul contract float %24, %27
  %29 = fadd contract float %22, %28
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = add nuw nsw i32 %6, 2
  %33 = getelementptr inbounds [5 x float], [5 x float] addrspace(3)* @_ZZ20convolution_1D_tiledPfS_S_E8N_shared, i32 0, i32 %32
  %34 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %35 = fmul contract float %31, %34
  %36 = fadd contract float %29, %35
  %37 = sext i32 %7 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  store float %36, float addrspace(1)* %38, align 4, !tbaa !5
  br label %39

39:                                               ; preds = %18, %14
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
