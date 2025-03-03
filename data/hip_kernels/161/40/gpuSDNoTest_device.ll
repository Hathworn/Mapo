; ModuleID = '../data/hip_kernels/161/40/main.cu'
source_filename = "../data/hip_kernels/161/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE5meanA = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE5meanB = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE1n = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsA = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16
@_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsB = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11gpuSDNoTestPKfmS0_mmS0_S0_Pf(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = zext i32 %9 to i64
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = icmp ult i64 %12, %1
  %16 = icmp ult i64 %14, %3
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %163

18:                                               ; preds = %8
  %19 = icmp eq i32 %9, 0
  br i1 %19, label %20, label %31

20:                                               ; preds = %18
  %21 = mul i64 %12, %3
  %22 = add i64 %21, %14
  %23 = shl i64 %22, 1
  %24 = getelementptr inbounds float, float addrspace(1)* %5, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %25, float addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE5meanA, align 4, !tbaa !5
  %26 = add nuw nsw i64 %23, 1
  %27 = getelementptr inbounds float, float addrspace(1)* %5, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %28, float addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE5meanB, align 4, !tbaa !5
  %29 = getelementptr inbounds float, float addrspace(1)* %6, i64 %22
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %30, float addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE1n, align 4, !tbaa !5
  br label %31

31:                                               ; preds = %20, %18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %9
  store float 0.000000e+00, float addrspace(3)* %32, align 4, !tbaa !5
  %33 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %9
  store float 0.000000e+00, float addrspace(3)* %33, align 4, !tbaa !5
  %34 = icmp ult i64 %10, %4
  br i1 %34, label %35, label %59

35:                                               ; preds = %31
  %36 = mul i64 %12, %4
  %37 = mul i64 %14, %4
  %38 = load float, float addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE5meanA, align 4, !tbaa !5
  %39 = load float, float addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE5meanB, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %35, %40
  %41 = phi float [ 0.000000e+00, %35 ], [ %55, %40 ]
  %42 = phi float [ 0.000000e+00, %35 ], [ %53, %40 ]
  %43 = phi i64 [ %10, %35 ], [ %56, %40 ]
  %44 = add i64 %43, %36
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = add i64 %43, %37
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = fsub contract float %46, %38
  %51 = fsub contract float %49, %39
  %52 = fmul contract float %50, %50
  %53 = fadd contract float %42, %52
  %54 = fmul contract float %51, %51
  %55 = fadd contract float %54, %41
  %56 = add i64 %43, 16
  %57 = icmp ult i64 %56, %4
  br i1 %57, label %40, label %58, !llvm.loop !10

58:                                               ; preds = %40
  store float %53, float addrspace(3)* %32, align 4, !tbaa !5
  store float %55, float addrspace(3)* %33, align 4, !tbaa !5
  br label %59

59:                                               ; preds = %58, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %60 = icmp ult i32 %9, 8
  br i1 %60, label %61, label %71

61:                                               ; preds = %59
  %62 = add nuw nsw i32 %9, 8
  %63 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %65 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %66 = fadd contract float %64, %65
  store float %66, float addrspace(3)* %32, align 4, !tbaa !5
  %67 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %62
  %68 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %69 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %70 = fadd contract float %68, %69
  store float %70, float addrspace(3)* %33, align 4, !tbaa !5
  br label %71

71:                                               ; preds = %61, %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = icmp ult i32 %9, 4
  br i1 %72, label %73, label %83

73:                                               ; preds = %71
  %74 = add nuw nsw i32 %9, 4
  %75 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %77 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %78 = fadd contract float %76, %77
  store float %78, float addrspace(3)* %32, align 4, !tbaa !5
  %79 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %74
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %81 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %82 = fadd contract float %80, %81
  store float %82, float addrspace(3)* %33, align 4, !tbaa !5
  br label %83

83:                                               ; preds = %73, %71
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = icmp ult i32 %9, 2
  br i1 %84, label %85, label %95

85:                                               ; preds = %83
  %86 = add nuw nsw i32 %9, 2
  %87 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %86
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %89 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %90 = fadd contract float %88, %89
  store float %90, float addrspace(3)* %32, align 4, !tbaa !5
  %91 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %86
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %93 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %94 = fadd contract float %92, %93
  store float %94, float addrspace(3)* %33, align 4, !tbaa !5
  br label %95

95:                                               ; preds = %85, %83
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = icmp eq i32 %9, 0
  br i1 %96, label %97, label %107

97:                                               ; preds = %95
  %98 = add nuw nsw i32 %9, 1
  %99 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %98
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !5
  %101 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %102 = fadd contract float %100, %101
  store float %102, float addrspace(3)* %32, align 4, !tbaa !5
  %103 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %98
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %105 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %106 = fadd contract float %104, %105
  store float %106, float addrspace(3)* %33, align 4, !tbaa !5
  br label %107

107:                                              ; preds = %97, %95
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %108, label %163

108:                                              ; preds = %107
  %109 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 0), align 16, !tbaa !5
  %110 = load float, float addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE1n, align 4, !tbaa !5
  %111 = fadd contract float %110, -1.000000e+00
  %112 = fdiv contract float %109, %111
  %113 = fcmp olt float %112, 0x39F0000000000000
  %114 = select i1 %113, float 0x41F0000000000000, float 1.000000e+00
  %115 = fmul float %112, %114
  %116 = tail call float @llvm.sqrt.f32(float %115)
  %117 = bitcast float %116 to i32
  %118 = add nsw i32 %117, -1
  %119 = bitcast i32 %118 to float
  %120 = add nsw i32 %117, 1
  %121 = bitcast i32 %120 to float
  %122 = tail call i1 @llvm.amdgcn.class.f32(float %115, i32 608)
  %123 = select i1 %113, float 0x3EF0000000000000, float 1.000000e+00
  %124 = fneg float %121
  %125 = tail call float @llvm.fma.f32(float %124, float %116, float %115)
  %126 = fcmp ogt float %125, 0.000000e+00
  %127 = fneg float %119
  %128 = tail call float @llvm.fma.f32(float %127, float %116, float %115)
  %129 = fcmp ole float %128, 0.000000e+00
  %130 = select i1 %129, float %119, float %116
  %131 = select i1 %126, float %121, float %130
  %132 = fmul float %123, %131
  %133 = select i1 %122, float %115, float %132
  %134 = mul i64 %12, %3
  %135 = add i64 %134, %14
  %136 = shl i64 %135, 1
  %137 = getelementptr inbounds float, float addrspace(1)* %7, i64 %136
  store float %133, float addrspace(1)* %137, align 4, !tbaa !5
  %138 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ11gpuSDNoTestPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 0), align 16, !tbaa !5
  %139 = fdiv contract float %138, %111
  %140 = fcmp olt float %139, 0x39F0000000000000
  %141 = select i1 %140, float 0x41F0000000000000, float 1.000000e+00
  %142 = fmul float %139, %141
  %143 = tail call float @llvm.sqrt.f32(float %142)
  %144 = bitcast float %143 to i32
  %145 = add nsw i32 %144, -1
  %146 = bitcast i32 %145 to float
  %147 = add nsw i32 %144, 1
  %148 = bitcast i32 %147 to float
  %149 = tail call i1 @llvm.amdgcn.class.f32(float %142, i32 608)
  %150 = select i1 %140, float 0x3EF0000000000000, float 1.000000e+00
  %151 = fneg float %148
  %152 = tail call float @llvm.fma.f32(float %151, float %143, float %142)
  %153 = fcmp ogt float %152, 0.000000e+00
  %154 = fneg float %146
  %155 = tail call float @llvm.fma.f32(float %154, float %143, float %142)
  %156 = fcmp ole float %155, 0.000000e+00
  %157 = select i1 %156, float %146, float %143
  %158 = select i1 %153, float %148, float %157
  %159 = fmul float %150, %158
  %160 = select i1 %149, float %142, float %159
  %161 = add nuw nsw i64 %136, 1
  %162 = getelementptr inbounds float, float addrspace(1)* %7, i64 %161
  store float %160, float addrspace(1)* %162, align 4, !tbaa !5
  br label %163

163:                                              ; preds = %107, %108, %8
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
