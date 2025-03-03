; ModuleID = '../data/hip_kernels/16910/1/main.cu'
source_filename = "../data/hip_kernels/16910/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ6Conv1DPKdPKfS2_PfE2sW = internal addrspace(3) global [486 x float] undef, align 16
@_ZZ6Conv1DPKdPKfS2_PfE5sdata = internal addrspace(3) global [1105 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6Conv1DPKdPKfS2_Pf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %8 = fptosi double %7 to i32
  %9 = getelementptr inbounds double, double addrspace(1)* %0, i64 14
  %10 = load double, double addrspace(1)* %9, align 8, !tbaa !5, !amdgpu.noclobber !9
  %11 = fptosi double %10 to i32
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !5, !amdgpu.noclobber !9
  %14 = fptosi double %13 to i32
  %15 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !5, !amdgpu.noclobber !9
  %17 = fptosi double %16 to i32
  %18 = mul nsw i32 %14, %11
  %19 = icmp slt i32 %5, %18
  br i1 %19, label %20, label %26

20:                                               ; preds = %4
  %21 = zext i32 %5 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %2, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !10, !amdgpu.noclobber !9
  %24 = getelementptr inbounds [486 x float], [486 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %5
  %25 = addrspacecast float addrspace(3)* %24 to float*
  store volatile float %23, float* %25, align 4, !tbaa !10
  br label %26

26:                                               ; preds = %20, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = add nsw i32 %8, -1024
  %28 = sub i32 %27, %14
  %29 = icmp slt i32 %28, 0
  br i1 %29, label %147, label %30

30:                                               ; preds = %26
  %31 = icmp slt i32 %5, %14
  %32 = mul nsw i32 %6, %8
  %33 = add i32 %32, %5
  %34 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %5
  %35 = addrspacecast float addrspace(3)* %34 to float*
  %36 = add i32 %5, %14
  %37 = add i32 %36, %32
  %38 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %36
  %39 = addrspacecast float addrspace(3)* %38 to float*
  %40 = icmp sgt i32 %11, 0
  %41 = icmp sgt i32 %14, 0
  %42 = mul i32 %17, %8
  %43 = and i32 %14, 3
  %44 = icmp ult i32 %14, 4
  %45 = and i32 %14, -4
  %46 = icmp eq i32 %43, 0
  br label %47

47:                                               ; preds = %30, %144
  %48 = phi i32 [ 0, %30 ], [ %145, %144 ]
  br i1 %31, label %49, label %54

49:                                               ; preds = %47
  %50 = add i32 %33, %48
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !10
  store volatile float %53, float* %35, align 4, !tbaa !10
  br label %54

54:                                               ; preds = %49, %47
  %55 = add i32 %37, %48
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !10
  store volatile float %58, float* %39, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %40, label %59, label %144

59:                                               ; preds = %54
  %60 = add i32 %33, %48
  br label %61

61:                                               ; preds = %59, %136
  %62 = phi i32 [ 0, %59 ], [ %142, %136 ]
  br i1 %41, label %63, label %136

63:                                               ; preds = %61
  %64 = mul nsw i32 %62, %14
  br i1 %44, label %115, label %65

65:                                               ; preds = %63, %65
  %66 = phi float [ %111, %65 ], [ 0.000000e+00, %63 ]
  %67 = phi i32 [ %112, %65 ], [ 0, %63 ]
  %68 = phi i32 [ %113, %65 ], [ 0, %63 ]
  %69 = add nsw i32 %67, %64
  %70 = getelementptr inbounds [486 x float], [486 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %69
  %71 = addrspacecast float addrspace(3)* %70 to float*
  %72 = load volatile float, float* %71, align 4, !tbaa !10
  %73 = add nuw nsw i32 %67, %5
  %74 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %73
  %75 = addrspacecast float addrspace(3)* %74 to float*
  %76 = load volatile float, float* %75, align 4, !tbaa !10
  %77 = fmul contract float %72, %76
  %78 = fadd contract float %66, %77
  %79 = or i32 %67, 1
  %80 = add nsw i32 %79, %64
  %81 = getelementptr inbounds [486 x float], [486 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %80
  %82 = addrspacecast float addrspace(3)* %81 to float*
  %83 = load volatile float, float* %82, align 4, !tbaa !10
  %84 = add nuw nsw i32 %79, %5
  %85 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %84
  %86 = addrspacecast float addrspace(3)* %85 to float*
  %87 = load volatile float, float* %86, align 4, !tbaa !10
  %88 = fmul contract float %83, %87
  %89 = fadd contract float %78, %88
  %90 = or i32 %67, 2
  %91 = add nsw i32 %90, %64
  %92 = getelementptr inbounds [486 x float], [486 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %91
  %93 = addrspacecast float addrspace(3)* %92 to float*
  %94 = load volatile float, float* %93, align 4, !tbaa !10
  %95 = add nuw nsw i32 %90, %5
  %96 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %95
  %97 = addrspacecast float addrspace(3)* %96 to float*
  %98 = load volatile float, float* %97, align 4, !tbaa !10
  %99 = fmul contract float %94, %98
  %100 = fadd contract float %89, %99
  %101 = or i32 %67, 3
  %102 = add nsw i32 %101, %64
  %103 = getelementptr inbounds [486 x float], [486 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %102
  %104 = addrspacecast float addrspace(3)* %103 to float*
  %105 = load volatile float, float* %104, align 4, !tbaa !10
  %106 = add nuw nsw i32 %101, %5
  %107 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %106
  %108 = addrspacecast float addrspace(3)* %107 to float*
  %109 = load volatile float, float* %108, align 4, !tbaa !10
  %110 = fmul contract float %105, %109
  %111 = fadd contract float %100, %110
  %112 = add nuw nsw i32 %67, 4
  %113 = add i32 %68, 4
  %114 = icmp eq i32 %113, %45
  br i1 %114, label %115, label %65, !llvm.loop !12

115:                                              ; preds = %65, %63
  %116 = phi float [ undef, %63 ], [ %111, %65 ]
  %117 = phi float [ 0.000000e+00, %63 ], [ %111, %65 ]
  %118 = phi i32 [ 0, %63 ], [ %112, %65 ]
  br i1 %46, label %136, label %119

119:                                              ; preds = %115, %119
  %120 = phi float [ %132, %119 ], [ %117, %115 ]
  %121 = phi i32 [ %133, %119 ], [ %118, %115 ]
  %122 = phi i32 [ %134, %119 ], [ 0, %115 ]
  %123 = add nsw i32 %121, %64
  %124 = getelementptr inbounds [486 x float], [486 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE2sW, i32 0, i32 %123
  %125 = addrspacecast float addrspace(3)* %124 to float*
  %126 = load volatile float, float* %125, align 4, !tbaa !10
  %127 = add nuw nsw i32 %121, %5
  %128 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ6Conv1DPKdPKfS2_PfE5sdata, i32 0, i32 %127
  %129 = addrspacecast float addrspace(3)* %128 to float*
  %130 = load volatile float, float* %129, align 4, !tbaa !10
  %131 = fmul contract float %126, %130
  %132 = fadd contract float %120, %131
  %133 = add nuw nsw i32 %121, 1
  %134 = add nuw nsw i32 %122, 1
  %135 = icmp eq i32 %134, %43
  br i1 %135, label %136, label %119, !llvm.loop !15

136:                                              ; preds = %119, %115, %61
  %137 = phi float [ 0.000000e+00, %61 ], [ %116, %115 ], [ %132, %119 ]
  %138 = mul i32 %42, %62
  %139 = add i32 %60, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %3, i64 %140
  store float %137, float addrspace(1)* %141, align 4, !tbaa !10
  %142 = add nuw nsw i32 %62, 1
  %143 = icmp eq i32 %142, %11
  br i1 %143, label %144, label %61, !llvm.loop !16

144:                                              ; preds = %136, %54
  %145 = add nuw nsw i32 %48, 1024
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %146 = icmp sgt i32 %145, %28
  br i1 %146, label %147, label %47, !llvm.loop !17

147:                                              ; preds = %144, %26
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
