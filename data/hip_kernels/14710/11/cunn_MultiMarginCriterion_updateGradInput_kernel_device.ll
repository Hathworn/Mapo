; ModuleID = '../data/hip_kernels/14710/11/main.cu'
source_filename = "../data/hip_kernels/14710/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul nsw i32 %7, %4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %1, i64 %9
  %11 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  %12 = sext i32 %7 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %2, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi float %14 to i32
  %16 = add nsw i32 %15, -1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %10, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !4, !amdgpu.noclobber !8
  %20 = icmp eq i32 %5, 0
  br i1 %20, label %24, label %21

21:                                               ; preds = %6
  %22 = sitofp i32 %4 to float
  %23 = fdiv contract float 1.000000e+00, %22
  br label %24

24:                                               ; preds = %6, %21
  %25 = phi float [ %23, %21 ], [ 1.000000e+00, %6 ]
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %27 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %28 = getelementptr i8, i8 addrspace(4)* %27, i64 4
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 4, !range !10, !invariant.load !8
  %31 = zext i16 %30 to i32
  %32 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %26
  store float 0.000000e+00, float addrspace(3)* %32, align 4, !tbaa !4
  %33 = icmp slt i32 %26, %4
  br i1 %33, label %34, label %36

34:                                               ; preds = %24
  %35 = fsub contract float 1.000000e+00, %19
  br label %43

36:                                               ; preds = %59, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp eq i32 %26, 0
  br i1 %37, label %38, label %119

38:                                               ; preds = %36
  %39 = and i32 %31, 7
  %40 = icmp ult i16 %30, 8
  br i1 %40, label %63, label %41

41:                                               ; preds = %38
  %42 = and i32 %31, 2040
  br label %81

43:                                               ; preds = %34, %59
  %44 = phi float [ 0.000000e+00, %34 ], [ %60, %59 ]
  %45 = phi i32 [ %26, %34 ], [ %61, %59 ]
  %46 = zext i32 %45 to i64
  %47 = icmp eq i32 %45, %16
  br i1 %47, label %59, label %48

48:                                               ; preds = %43
  %49 = getelementptr inbounds float, float addrspace(1)* %10, i64 %46
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !4
  %51 = fadd contract float %35, %50
  %52 = fcmp contract ogt float %51, 0.000000e+00
  br i1 %52, label %53, label %55

53:                                               ; preds = %48
  %54 = fsub contract float %44, %25
  store float %54, float addrspace(3)* %32, align 4, !tbaa !4
  br label %55

55:                                               ; preds = %48, %53
  %56 = phi float [ %25, %53 ], [ 0.000000e+00, %48 ]
  %57 = phi float [ %54, %53 ], [ %44, %48 ]
  %58 = getelementptr inbounds float, float addrspace(1)* %11, i64 %46
  store float %56, float addrspace(1)* %58, align 4, !tbaa !4
  br label %59

59:                                               ; preds = %55, %43
  %60 = phi float [ %44, %43 ], [ %57, %55 ]
  %61 = add nuw nsw i32 %45, %31
  %62 = icmp slt i32 %61, %4
  br i1 %62, label %43, label %36, !llvm.loop !11

63:                                               ; preds = %81, %38
  %64 = phi float [ undef, %38 ], [ %115, %81 ]
  %65 = phi i32 [ 0, %38 ], [ %116, %81 ]
  %66 = phi float [ 0.000000e+00, %38 ], [ %115, %81 ]
  %67 = icmp eq i32 %39, 0
  br i1 %67, label %78, label %68

68:                                               ; preds = %63, %68
  %69 = phi i32 [ %75, %68 ], [ %65, %63 ]
  %70 = phi float [ %74, %68 ], [ %66, %63 ]
  %71 = phi i32 [ %76, %68 ], [ 0, %63 ]
  %72 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %69
  %73 = load float, float addrspace(3)* %72, align 4, !tbaa !4
  %74 = fadd contract float %70, %73
  %75 = add nuw nsw i32 %69, 1
  %76 = add i32 %71, 1
  %77 = icmp eq i32 %76, %39
  br i1 %77, label %78, label %68, !llvm.loop !13

78:                                               ; preds = %68, %63
  %79 = phi float [ %64, %63 ], [ %74, %68 ]
  %80 = getelementptr inbounds float, float addrspace(1)* %11, i64 %17
  store float %79, float addrspace(1)* %80, align 4, !tbaa !4
  br label %119

81:                                               ; preds = %81, %41
  %82 = phi i32 [ 0, %41 ], [ %116, %81 ]
  %83 = phi float [ 0.000000e+00, %41 ], [ %115, %81 ]
  %84 = phi i32 [ 0, %41 ], [ %117, %81 ]
  %85 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %82
  %86 = load float, float addrspace(3)* %85, align 16, !tbaa !4
  %87 = fadd contract float %83, %86
  %88 = or i32 %82, 1
  %89 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %88
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !4
  %91 = fadd contract float %87, %90
  %92 = or i32 %82, 2
  %93 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %92
  %94 = load float, float addrspace(3)* %93, align 8, !tbaa !4
  %95 = fadd contract float %91, %94
  %96 = or i32 %82, 3
  %97 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %96
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !4
  %99 = fadd contract float %95, %98
  %100 = or i32 %82, 4
  %101 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %100
  %102 = load float, float addrspace(3)* %101, align 16, !tbaa !4
  %103 = fadd contract float %99, %102
  %104 = or i32 %82, 5
  %105 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %104
  %106 = load float, float addrspace(3)* %105, align 4, !tbaa !4
  %107 = fadd contract float %103, %106
  %108 = or i32 %82, 6
  %109 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %108
  %110 = load float, float addrspace(3)* %109, align 8, !tbaa !4
  %111 = fadd contract float %107, %110
  %112 = or i32 %82, 7
  %113 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ48cunn_MultiMarginCriterion_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %112
  %114 = load float, float addrspace(3)* %113, align 4, !tbaa !4
  %115 = fadd contract float %111, %114
  %116 = add nuw nsw i32 %82, 8
  %117 = add i32 %84, 8
  %118 = icmp eq i32 %117, %42
  br i1 %118, label %63, label %81, !llvm.loop !15

119:                                              ; preds = %78, %36
  ret void
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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
