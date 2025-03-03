; ModuleID = '../data/hip_kernels/570/8/main.cu'
source_filename = "../data/hip_kernels/570/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17newForceReductionPfS_iiE7partSum = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z17newForceReductionPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = icmp ult i32 %5, 343
  br i1 %7, label %8, label %14

8:                                                ; preds = %4
  %9 = mul i32 %6, 343
  %10 = add i32 %9, %5
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %14

14:                                               ; preds = %4, %8
  %15 = phi float [ %13, %8 ], [ 0.000000e+00, %4 ]
  %16 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %5
  store float %15, float addrspace(3)* %16, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp ult i32 %5, 512
  br i1 %17, label %18, label %24

18:                                               ; preds = %14
  %19 = add nuw nsw i32 %5, 512
  %20 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %19
  %21 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %22 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %23 = fadd contract float %21, %22
  store float %23, float addrspace(3)* %16, align 4, !tbaa !5
  br label %24

24:                                               ; preds = %18, %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = icmp ult i32 %5, 256
  br i1 %25, label %26, label %32

26:                                               ; preds = %24
  %27 = add nuw nsw i32 %5, 256
  %28 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %27
  %29 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %30 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %31 = fadd contract float %29, %30
  store float %31, float addrspace(3)* %16, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %26, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp ult i32 %5, 128
  br i1 %33, label %34, label %40

34:                                               ; preds = %32
  %35 = add nuw nsw i32 %5, 128
  %36 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %35
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %38 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %39 = fadd contract float %37, %38
  store float %39, float addrspace(3)* %16, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %34, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ult i32 %5, 64
  br i1 %41, label %42, label %48

42:                                               ; preds = %40
  %43 = add nuw nsw i32 %5, 64
  %44 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %46 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(3)* %16, align 4, !tbaa !5
  br label %48

48:                                               ; preds = %42, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ult i32 %5, 32
  br i1 %49, label %50, label %76

50:                                               ; preds = %48
  %51 = add nuw nsw i32 %5, 32
  %52 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %54 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %55 = fadd contract float %53, %54
  %56 = add nuw nsw i32 %5, 16
  %57 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %56
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %59 = fadd contract float %55, %58
  %60 = add nuw nsw i32 %5, 8
  %61 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %60
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %63 = fadd contract float %59, %62
  %64 = add nuw nsw i32 %5, 4
  %65 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %64
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %67 = fadd contract float %63, %66
  %68 = add nuw nsw i32 %5, 2
  %69 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %71 = fadd contract float %67, %70
  %72 = add nuw nsw i32 %5, 1
  %73 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %75 = fadd contract float %71, %74
  store float %75, float addrspace(3)* %16, align 4, !tbaa !5
  br label %76

76:                                               ; preds = %50, %48
  %77 = icmp eq i32 %5, 0
  br i1 %77, label %78, label %83

78:                                               ; preds = %76
  %79 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ17newForceReductionPfS_iiE7partSum, i32 0, i32 0), align 16, !tbaa !5
  %80 = fneg contract float %79
  %81 = zext i32 %6 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  store float %80, float addrspace(1)* %82, align 4, !tbaa !5
  br label %83

83:                                               ; preds = %78, %76
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
