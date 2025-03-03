; ModuleID = '../data/hip_kernels/14762/19/main.cu'
source_filename = "../data/hip_kernels/14762/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul nsw i32 %8, %4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %1, i64 %10
  %12 = sext i32 %8 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = getelementptr inbounds float, float addrspace(1)* %2, i64 %12
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !4, !amdgpu.noclobber !8
  %16 = fptosi float %15 to i32
  %17 = add nsw i32 %16, -1
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !10, !invariant.load !8
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %18
  store float 0.000000e+00, float addrspace(3)* %24, align 4, !tbaa !4
  %25 = icmp slt i32 %18, %4
  br i1 %25, label %33, label %26

26:                                               ; preds = %52, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = icmp eq i32 %18, 0
  br i1 %27, label %28, label %117

28:                                               ; preds = %26
  %29 = and i32 %23, 7
  %30 = icmp ult i16 %22, 8
  br i1 %30, label %56, label %31

31:                                               ; preds = %28
  %32 = and i32 %23, 2040
  br label %74

33:                                               ; preds = %7, %52
  %34 = phi float [ %53, %52 ], [ 0.000000e+00, %7 ]
  %35 = phi i32 [ %54, %52 ], [ %18, %7 ]
  %36 = icmp eq i32 %35, %17
  %37 = zext i32 %35 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %11, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !4, !amdgpu.noclobber !8
  %40 = fneg contract float %39
  %41 = select contract i1 %36, float %39, float %40
  %42 = fsub contract float 1.000000e+00, %41
  %43 = fcmp contract ogt float %42, 0.000000e+00
  br i1 %43, label %44, label %52

44:                                               ; preds = %33
  br i1 %36, label %45, label %48

45:                                               ; preds = %44
  %46 = getelementptr inbounds float, float addrspace(1)* %6, i64 %37
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !4, !amdgpu.noclobber !8
  br label %48

48:                                               ; preds = %44, %45
  %49 = phi float [ %47, %45 ], [ 1.000000e+00, %44 ]
  %50 = fmul contract float %42, %49
  %51 = fadd contract float %34, %50
  store float %51, float addrspace(3)* %24, align 4, !tbaa !4
  br label %52

52:                                               ; preds = %48, %33
  %53 = phi float [ %51, %48 ], [ %34, %33 ]
  %54 = add nuw nsw i32 %35, %23
  %55 = icmp slt i32 %54, %4
  br i1 %55, label %33, label %26, !llvm.loop !11

56:                                               ; preds = %74, %28
  %57 = phi float [ undef, %28 ], [ %108, %74 ]
  %58 = phi i32 [ 0, %28 ], [ %109, %74 ]
  %59 = phi float [ 0.000000e+00, %28 ], [ %108, %74 ]
  %60 = icmp eq i32 %29, 0
  br i1 %60, label %71, label %61

61:                                               ; preds = %56, %61
  %62 = phi i32 [ %68, %61 ], [ %58, %56 ]
  %63 = phi float [ %67, %61 ], [ %59, %56 ]
  %64 = phi i32 [ %69, %61 ], [ 0, %56 ]
  %65 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %62
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !4
  %67 = fadd contract float %63, %66
  %68 = add nuw nsw i32 %62, 1
  %69 = add i32 %64, 1
  %70 = icmp eq i32 %69, %29
  br i1 %70, label %71, label %61, !llvm.loop !13

71:                                               ; preds = %61, %56
  %72 = phi float [ %57, %56 ], [ %67, %61 ]
  %73 = icmp eq i32 %5, 0
  br i1 %73, label %115, label %112

74:                                               ; preds = %74, %31
  %75 = phi i32 [ 0, %31 ], [ %109, %74 ]
  %76 = phi float [ 0.000000e+00, %31 ], [ %108, %74 ]
  %77 = phi i32 [ 0, %31 ], [ %110, %74 ]
  %78 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %75
  %79 = load float, float addrspace(3)* %78, align 16, !tbaa !4
  %80 = fadd contract float %76, %79
  %81 = or i32 %75, 1
  %82 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %81
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !4
  %84 = fadd contract float %80, %83
  %85 = or i32 %75, 2
  %86 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 8, !tbaa !4
  %88 = fadd contract float %84, %87
  %89 = or i32 %75, 3
  %90 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %89
  %91 = load float, float addrspace(3)* %90, align 4, !tbaa !4
  %92 = fadd contract float %88, %91
  %93 = or i32 %75, 4
  %94 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %93
  %95 = load float, float addrspace(3)* %94, align 16, !tbaa !4
  %96 = fadd contract float %92, %95
  %97 = or i32 %75, 5
  %98 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !4
  %100 = fadd contract float %96, %99
  %101 = or i32 %75, 6
  %102 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %101
  %103 = load float, float addrspace(3)* %102, align 8, !tbaa !4
  %104 = fadd contract float %100, %103
  %105 = or i32 %75, 7
  %106 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ53cunn_OneVsAllMultiMarginCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %105
  %107 = load float, float addrspace(3)* %106, align 4, !tbaa !4
  %108 = fadd contract float %104, %107
  %109 = add nuw nsw i32 %75, 8
  %110 = add i32 %77, 8
  %111 = icmp eq i32 %110, %32
  br i1 %111, label %56, label %74, !llvm.loop !15

112:                                              ; preds = %71
  %113 = sitofp i32 %4 to float
  %114 = fdiv contract float %72, %113
  br label %115

115:                                              ; preds = %71, %112
  %116 = phi float [ %114, %112 ], [ %72, %71 ]
  store float %116, float addrspace(1)* %13, align 4, !tbaa !4
  br label %117

117:                                              ; preds = %115, %26
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
