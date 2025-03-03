; ModuleID = '../data/hip_kernels/14762/40/main.cu'
source_filename = "../data/hip_kernels/14762/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
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
  %24 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %18
  store float 0.000000e+00, float addrspace(3)* %24, align 4, !tbaa !4
  %25 = icmp slt i32 %18, %4
  br i1 %25, label %26, label %31

26:                                               ; preds = %7
  %27 = zext i32 %17 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %6, i64 %27
  %29 = getelementptr inbounds float, float addrspace(1)* %11, i64 %27
  br label %38

30:                                               ; preds = %79
  store float %81, float addrspace(3)* %24, align 4, !tbaa !4
  br label %31

31:                                               ; preds = %30, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = icmp eq i32 %18, 0
  br i1 %32, label %33, label %145

33:                                               ; preds = %31
  %34 = and i32 %23, 7
  %35 = icmp ult i16 %22, 8
  br i1 %35, label %84, label %36

36:                                               ; preds = %33
  %37 = and i32 %23, 2040
  br label %102

38:                                               ; preds = %26, %79
  %39 = phi float [ 0.000000e+00, %26 ], [ %81, %79 ]
  %40 = phi i32 [ %18, %26 ], [ %82, %79 ]
  %41 = icmp eq i32 %40, %17
  br i1 %41, label %42, label %60

42:                                               ; preds = %38
  %43 = load float, float addrspace(1)* %28, align 4, !tbaa !4, !amdgpu.noclobber !8
  %44 = fneg contract float %43
  %45 = load float, float addrspace(1)* %29, align 4, !tbaa !4, !amdgpu.noclobber !8
  %46 = tail call i1 @llvm.amdgcn.class.f32(float %45, i32 144)
  %47 = select i1 %46, float 0x41F0000000000000, float 1.000000e+00
  %48 = fmul float %45, %47
  %49 = tail call float @llvm.log2.f32(float %48)
  %50 = fmul float %49, 0x3FE62E42E0000000
  %51 = tail call i1 @llvm.amdgcn.class.f32(float %49, i32 519)
  %52 = fneg float %50
  %53 = tail call float @llvm.fma.f32(float %49, float 0x3FE62E42E0000000, float %52)
  %54 = tail call float @llvm.fma.f32(float %49, float 0x3E6EFA39E0000000, float %53)
  %55 = fadd float %50, %54
  %56 = select i1 %51, float %49, float %55
  %57 = select i1 %46, float 0x40362E4300000000, float 0.000000e+00
  %58 = fsub float %56, %57
  %59 = fmul contract float %58, %44
  br label %79

60:                                               ; preds = %38
  %61 = zext i32 %40 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %11, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !4, !amdgpu.noclobber !8
  %64 = fsub contract float 1.000000e+00, %63
  %65 = tail call i1 @llvm.amdgcn.class.f32(float %64, i32 144)
  %66 = select i1 %65, float 0x41F0000000000000, float 1.000000e+00
  %67 = fmul float %64, %66
  %68 = tail call float @llvm.log2.f32(float %67)
  %69 = fmul float %68, 0x3FE62E42E0000000
  %70 = tail call i1 @llvm.amdgcn.class.f32(float %68, i32 519)
  %71 = fneg float %69
  %72 = tail call float @llvm.fma.f32(float %68, float 0x3FE62E42E0000000, float %71)
  %73 = tail call float @llvm.fma.f32(float %68, float 0x3E6EFA39E0000000, float %72)
  %74 = fadd float %69, %73
  %75 = select i1 %70, float %68, float %74
  %76 = select i1 %65, float 0x40362E4300000000, float 0.000000e+00
  %77 = fsub float %75, %76
  %78 = fneg contract float %77
  br label %79

79:                                               ; preds = %60, %42
  %80 = phi contract float [ %59, %42 ], [ %78, %60 ]
  %81 = fadd contract float %80, %39
  %82 = add nuw nsw i32 %40, %23
  %83 = icmp slt i32 %82, %4
  br i1 %83, label %38, label %30, !llvm.loop !11

84:                                               ; preds = %102, %33
  %85 = phi float [ undef, %33 ], [ %136, %102 ]
  %86 = phi i32 [ 0, %33 ], [ %137, %102 ]
  %87 = phi float [ 0.000000e+00, %33 ], [ %136, %102 ]
  %88 = icmp eq i32 %34, 0
  br i1 %88, label %99, label %89

89:                                               ; preds = %84, %89
  %90 = phi i32 [ %96, %89 ], [ %86, %84 ]
  %91 = phi float [ %95, %89 ], [ %87, %84 ]
  %92 = phi i32 [ %97, %89 ], [ 0, %84 ]
  %93 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %90
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !4
  %95 = fadd contract float %91, %94
  %96 = add nuw nsw i32 %90, 1
  %97 = add i32 %92, 1
  %98 = icmp eq i32 %97, %34
  br i1 %98, label %99, label %89, !llvm.loop !13

99:                                               ; preds = %89, %84
  %100 = phi float [ %85, %84 ], [ %95, %89 ]
  %101 = icmp eq i32 %5, 0
  br i1 %101, label %143, label %140

102:                                              ; preds = %102, %36
  %103 = phi i32 [ 0, %36 ], [ %137, %102 ]
  %104 = phi float [ 0.000000e+00, %36 ], [ %136, %102 ]
  %105 = phi i32 [ 0, %36 ], [ %138, %102 ]
  %106 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %103
  %107 = load float, float addrspace(3)* %106, align 16, !tbaa !4
  %108 = fadd contract float %104, %107
  %109 = or i32 %103, 1
  %110 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %109
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !4
  %112 = fadd contract float %108, %111
  %113 = or i32 %103, 2
  %114 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %113
  %115 = load float, float addrspace(3)* %114, align 8, !tbaa !4
  %116 = fadd contract float %112, %115
  %117 = or i32 %103, 3
  %118 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %117
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !4
  %120 = fadd contract float %116, %119
  %121 = or i32 %103, 4
  %122 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %121
  %123 = load float, float addrspace(3)* %122, align 16, !tbaa !4
  %124 = fadd contract float %120, %123
  %125 = or i32 %103, 5
  %126 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %125
  %127 = load float, float addrspace(3)* %126, align 4, !tbaa !4
  %128 = fadd contract float %124, %127
  %129 = or i32 %103, 6
  %130 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %129
  %131 = load float, float addrspace(3)* %130, align 8, !tbaa !4
  %132 = fadd contract float %128, %131
  %133 = or i32 %103, 7
  %134 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ45cunn_OneVsAllNLLCriterion_updateOutput_kernelPfS_S_iiiS_E6buffer, i32 0, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !4
  %136 = fadd contract float %132, %135
  %137 = add nuw nsw i32 %103, 8
  %138 = add i32 %105, 8
  %139 = icmp eq i32 %138, %37
  br i1 %139, label %84, label %102, !llvm.loop !15

140:                                              ; preds = %99
  %141 = sitofp i32 %3 to float
  %142 = fdiv contract float %100, %141
  br label %143

143:                                              ; preds = %99, %140
  %144 = phi float [ %142, %140 ], [ %100, %99 ]
  store float %144, float addrspace(1)* %13, align 4, !tbaa !4
  br label %145

145:                                              ; preds = %143, %31
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

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
