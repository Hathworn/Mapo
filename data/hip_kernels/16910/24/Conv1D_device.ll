; ModuleID = '../data/hip_kernels/16910/24/main.cu'
source_filename = "../data/hip_kernels/16910/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ6Conv1DPKdPKfS2_PfE2sW = internal addrspace(3) global [243 x float] undef, align 16
@_ZZ6Conv1DPKdPKfS2_PfE5sdata = internal addrspace(3) global [1105 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6Conv1DPKdPKfS2_Pf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %8 = fptosi double %7 to i32
  %9 = getelementptr inbounds double, double addrspace(1)* %0, i64 3
  %10 = load double, double addrspace(1)* %9, align 8, !tbaa !5, !amdgpu.noclobber !9
  %11 = fptosi double %10 to i32
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !5, !amdgpu.noclobber !9
  %14 = fptosi double %13 to i32
  %15 = mul nsw i32 %14, %11
  %16 = icmp slt i32 %5, %15
  br i1 %16, label %17, label %23

17:                                               ; preds = %4
  %18 = zext i32 %5 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !10, !amdgpu.noclobber !9
  %21 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %5
  %22 = addrspacecast float addrspace(3)* %21 to float*
  store volatile float %20, float* %22, align 4, !tbaa !10
  br label %23

23:                                               ; preds = %17, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = add nsw i32 %8, -1024
  %25 = sub i32 %24, %11
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %165, label %27

27:                                               ; preds = %23
  %28 = icmp slt i32 %5, %11
  %29 = mul nsw i32 %6, %8
  %30 = add i32 %29, %5
  %31 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %5
  %32 = addrspacecast float addrspace(3)* %31 to float*
  %33 = add nsw i32 %5, %11
  %34 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %33
  %35 = addrspacecast float addrspace(3)* %34 to float*
  %36 = icmp sgt i32 %14, 0
  %37 = icmp sgt i32 %11, 0
  %38 = and i32 %11, 3
  %39 = icmp ult i32 %11, 4
  %40 = and i32 %11, -4
  %41 = icmp eq i32 %38, 0
  br label %42

42:                                               ; preds = %27, %138
  %43 = phi i32 [ 0, %27 ], [ %163, %138 ]
  br i1 %28, label %44, label %49

44:                                               ; preds = %42
  %45 = add i32 %30, %43
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !10
  store volatile float %48, float* %32, align 4, !tbaa !10
  br label %49

49:                                               ; preds = %44, %42
  %50 = or i32 %43, %5
  %51 = add i32 %50, %29
  %52 = add i32 %51, %11
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !10
  store volatile float %55, float* %35, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %36, label %56, label %138

56:                                               ; preds = %49, %132
  %57 = phi float [ %135, %132 ], [ 0.000000e+00, %49 ]
  %58 = phi i32 [ %136, %132 ], [ 0, %49 ]
  br i1 %37, label %59, label %132

59:                                               ; preds = %56
  %60 = mul nsw i32 %58, %11
  br i1 %39, label %111, label %61

61:                                               ; preds = %59, %61
  %62 = phi float [ %107, %61 ], [ 0.000000e+00, %59 ]
  %63 = phi i32 [ %108, %61 ], [ 0, %59 ]
  %64 = phi i32 [ %109, %61 ], [ 0, %59 ]
  %65 = add nsw i32 %63, %60
  %66 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %65
  %67 = addrspacecast float addrspace(3)* %66 to float*
  %68 = load volatile float, float* %67, align 4, !tbaa !10
  %69 = add nuw nsw i32 %63, %5
  %70 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %69
  %71 = addrspacecast float addrspace(3)* %70 to float*
  %72 = load volatile float, float* %71, align 4, !tbaa !10
  %73 = fmul contract float %68, %72
  %74 = fadd contract float %62, %73
  %75 = or i32 %63, 1
  %76 = add nsw i32 %75, %60
  %77 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %76
  %78 = addrspacecast float addrspace(3)* %77 to float*
  %79 = load volatile float, float* %78, align 4, !tbaa !10
  %80 = add nuw nsw i32 %75, %5
  %81 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %80
  %82 = addrspacecast float addrspace(3)* %81 to float*
  %83 = load volatile float, float* %82, align 4, !tbaa !10
  %84 = fmul contract float %79, %83
  %85 = fadd contract float %74, %84
  %86 = or i32 %63, 2
  %87 = add nsw i32 %86, %60
  %88 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %87
  %89 = addrspacecast float addrspace(3)* %88 to float*
  %90 = load volatile float, float* %89, align 4, !tbaa !10
  %91 = add nuw nsw i32 %86, %5
  %92 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %91
  %93 = addrspacecast float addrspace(3)* %92 to float*
  %94 = load volatile float, float* %93, align 4, !tbaa !10
  %95 = fmul contract float %90, %94
  %96 = fadd contract float %85, %95
  %97 = or i32 %63, 3
  %98 = add nsw i32 %97, %60
  %99 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %98
  %100 = addrspacecast float addrspace(3)* %99 to float*
  %101 = load volatile float, float* %100, align 4, !tbaa !10
  %102 = add nuw nsw i32 %97, %5
  %103 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %102
  %104 = addrspacecast float addrspace(3)* %103 to float*
  %105 = load volatile float, float* %104, align 4, !tbaa !10
  %106 = fmul contract float %101, %105
  %107 = fadd contract float %96, %106
  %108 = add nuw nsw i32 %63, 4
  %109 = add i32 %64, 4
  %110 = icmp eq i32 %109, %40
  br i1 %110, label %111, label %61, !llvm.loop !12

111:                                              ; preds = %61, %59
  %112 = phi float [ undef, %59 ], [ %107, %61 ]
  %113 = phi float [ 0.000000e+00, %59 ], [ %107, %61 ]
  %114 = phi i32 [ 0, %59 ], [ %108, %61 ]
  br i1 %41, label %132, label %115

115:                                              ; preds = %111, %115
  %116 = phi float [ %128, %115 ], [ %113, %111 ]
  %117 = phi i32 [ %129, %115 ], [ %114, %111 ]
  %118 = phi i32 [ %130, %115 ], [ 0, %111 ]
  %119 = add nsw i32 %117, %60
  %120 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %119
  %121 = addrspacecast float addrspace(3)* %120 to float*
  %122 = load volatile float, float* %121, align 4, !tbaa !10
  %123 = add nuw nsw i32 %117, %5
  %124 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %123
  %125 = addrspacecast float addrspace(3)* %124 to float*
  %126 = load volatile float, float* %125, align 4, !tbaa !10
  %127 = fmul contract float %122, %126
  %128 = fadd contract float %116, %127
  %129 = add nuw nsw i32 %117, 1
  %130 = add nuw nsw i32 %118, 1
  %131 = icmp eq i32 %130, %38
  br i1 %131, label %132, label %115, !llvm.loop !15

132:                                              ; preds = %115, %111, %56
  %133 = phi float [ 0.000000e+00, %56 ], [ %112, %111 ], [ %128, %115 ]
  %134 = fmul contract float %133, %133
  %135 = fadd contract float %57, %134
  %136 = add nuw nsw i32 %58, 1
  %137 = icmp eq i32 %136, %14
  br i1 %137, label %138, label %56, !llvm.loop !16

138:                                              ; preds = %132, %49
  %139 = phi float [ 0.000000e+00, %49 ], [ %135, %132 ]
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
  %161 = sext i32 %51 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %3, i64 %161
  store float %160, float addrspace(1)* %162, align 4, !tbaa !10
  %163 = add nuw nsw i32 %43, 1024
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %164 = icmp sgt i32 %163, %25
  br i1 %164, label %165, label %42, !llvm.loop !17

165:                                              ; preds = %138, %23
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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !13}
