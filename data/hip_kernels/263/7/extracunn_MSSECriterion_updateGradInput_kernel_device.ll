; ModuleID = '../data/hip_kernels/263/7/main.cu'
source_filename = "../data/hip_kernels/263/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul nsw i32 %7, %5
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  %11 = getelementptr inbounds float, float addrspace(1)* %1, i64 %9
  %12 = getelementptr inbounds float, float addrspace(1)* %2, i64 %9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %13
  store float 0.000000e+00, float addrspace(3)* %19, align 4, !tbaa !7
  %20 = icmp slt i32 %13, %5
  br i1 %20, label %29, label %22

21:                                               ; preds = %29
  store float %38, float addrspace(3)* %19, align 4, !tbaa !7
  br label %22

22:                                               ; preds = %21, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = icmp eq i32 %13, 0
  br i1 %23, label %24, label %94

24:                                               ; preds = %22
  %25 = and i32 %18, 7
  %26 = icmp ult i16 %17, 8
  br i1 %26, label %79, label %27

27:                                               ; preds = %24
  %28 = and i32 %18, 2040
  br label %41

29:                                               ; preds = %6, %29
  %30 = phi float [ %38, %29 ], [ 0.000000e+00, %6 ]
  %31 = phi i32 [ %39, %29 ], [ %13, %6 ]
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %11, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = getelementptr inbounds float, float addrspace(1)* %12, i64 %32
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = fsub contract float %34, %36
  %38 = fadd contract float %30, %37
  %39 = add nuw nsw i32 %31, %18
  %40 = icmp slt i32 %39, %5
  br i1 %40, label %29, label %21, !llvm.loop !11

41:                                               ; preds = %41, %27
  %42 = phi i32 [ 0, %27 ], [ %76, %41 ]
  %43 = phi float [ 0.000000e+00, %27 ], [ %75, %41 ]
  %44 = phi i32 [ 0, %27 ], [ %77, %41 ]
  %45 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %42
  %46 = load float, float addrspace(3)* %45, align 16, !tbaa !7
  %47 = fadd contract float %43, %46
  %48 = or i32 %42, 1
  %49 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %48
  %50 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %51 = fadd contract float %47, %50
  %52 = or i32 %42, 2
  %53 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %52
  %54 = load float, float addrspace(3)* %53, align 8, !tbaa !7
  %55 = fadd contract float %51, %54
  %56 = or i32 %42, 3
  %57 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %56
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %59 = fadd contract float %55, %58
  %60 = or i32 %42, 4
  %61 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %60
  %62 = load float, float addrspace(3)* %61, align 16, !tbaa !7
  %63 = fadd contract float %59, %62
  %64 = or i32 %42, 5
  %65 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %64
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %67 = fadd contract float %63, %66
  %68 = or i32 %42, 6
  %69 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 8, !tbaa !7
  %71 = fadd contract float %67, %70
  %72 = or i32 %42, 7
  %73 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %75 = fadd contract float %71, %74
  %76 = add nuw nsw i32 %42, 8
  %77 = add i32 %44, 8
  %78 = icmp eq i32 %77, %28
  br i1 %78, label %79, label %41, !llvm.loop !13

79:                                               ; preds = %41, %24
  %80 = phi float [ undef, %24 ], [ %75, %41 ]
  %81 = phi i32 [ 0, %24 ], [ %76, %41 ]
  %82 = phi float [ 0.000000e+00, %24 ], [ %75, %41 ]
  %83 = icmp eq i32 %25, 0
  br i1 %83, label %94, label %84

84:                                               ; preds = %79, %84
  %85 = phi i32 [ %91, %84 ], [ %81, %79 ]
  %86 = phi float [ %90, %84 ], [ %82, %79 ]
  %87 = phi i32 [ %92, %84 ], [ 0, %79 ]
  %88 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ46extracunn_MSSECriterion_updateGradInput_kernelPfS_S_fiiE6buffer, i32 0, i32 %85
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !7
  %90 = fadd contract float %86, %89
  %91 = add nuw nsw i32 %85, 1
  %92 = add i32 %87, 1
  %93 = icmp eq i32 %92, %25
  br i1 %93, label %94, label %84, !llvm.loop !14

94:                                               ; preds = %79, %84, %22
  %95 = phi float [ 0.000000e+00, %22 ], [ %80, %79 ], [ %90, %84 ]
  br i1 %20, label %96, label %98

96:                                               ; preds = %94
  %97 = fmul contract float %95, %3
  br label %99

98:                                               ; preds = %99, %94
  ret void

99:                                               ; preds = %96, %99
  %100 = phi i32 [ %13, %96 ], [ %103, %99 ]
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %10, i64 %101
  store float %97, float addrspace(1)* %102, align 4, !tbaa !7
  %103 = add nuw nsw i32 %100, %18
  %104 = icmp slt i32 %103, %5
  br i1 %104, label %99, label %98, !llvm.loop !16
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !12}
