; ModuleID = '../data/hip_kernels/18395/4/main.cu'
source_filename = "../data/hip_kernels/18395/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16
@_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22matrixMul_sharedMemoryPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %8, 3
  %12 = add nsw i32 %11, %10
  %13 = shl nsw i32 %7, 3
  %14 = add nsw i32 %13, %9
  %15 = sitofp i32 %4 to float
  %16 = fmul contract float %15, 1.250000e-01
  %17 = tail call float @llvm.ceil.f32(float %16)
  %18 = fcmp contract ogt float %17, 0.000000e+00
  br i1 %18, label %19, label %41

19:                                               ; preds = %6
  %20 = icmp slt i32 %12, %3
  %21 = mul nsw i32 %12, %4
  %22 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds, i32 0, i32 %10, i32 %9
  %23 = icmp slt i32 %14, %5
  %24 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds, i32 0, i32 %10, i32 %9
  %25 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds, i32 0, i32 %10, i32 0
  %26 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds, i32 0, i32 0, i32 %9
  %27 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds, i32 0, i32 %10, i32 1
  %28 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds, i32 0, i32 1, i32 %9
  %29 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds, i32 0, i32 %10, i32 2
  %30 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds, i32 0, i32 2, i32 %9
  %31 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds, i32 0, i32 %10, i32 3
  %32 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds, i32 0, i32 3, i32 %9
  %33 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds, i32 0, i32 %10, i32 4
  %34 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds, i32 0, i32 4, i32 %9
  %35 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds, i32 0, i32 %10, i32 5
  %36 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds, i32 0, i32 5, i32 %9
  %37 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds, i32 0, i32 %10, i32 6
  %38 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds, i32 0, i32 6, i32 %9
  %39 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Mds, i32 0, i32 %10, i32 7
  %40 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ22matrixMul_sharedMemoryPfS_S_iiiE3Nds, i32 0, i32 7, i32 %9
  br label %46

41:                                               ; preds = %139, %6
  %42 = phi float [ 0.000000e+00, %6 ], [ %140, %139 ]
  %43 = icmp slt i32 %12, %3
  %44 = icmp slt i32 %14, %5
  %45 = select i1 %43, i1 %44, i1 false
  br i1 %45, label %144, label %149

46:                                               ; preds = %19, %139
  %47 = phi i32 [ 0, %19 ], [ %141, %139 ]
  %48 = phi float [ 0.000000e+00, %19 ], [ %140, %139 ]
  br i1 %20, label %49, label %58

49:                                               ; preds = %46
  %50 = shl nsw i32 %47, 3
  %51 = add nuw i32 %50, %9
  %52 = icmp slt i32 %51, %4
  br i1 %52, label %53, label %58

53:                                               ; preds = %49
  %54 = add i32 %51, %21
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %57, float addrspace(3)* %22, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %53, %49, %46
  %59 = shl nsw i32 %47, 3
  br i1 %23, label %60, label %69

60:                                               ; preds = %58
  %61 = add nuw nsw i32 %59, %10
  %62 = icmp slt i32 %61, %4
  br i1 %62, label %63, label %69

63:                                               ; preds = %60
  %64 = mul nsw i32 %61, %5
  %65 = add nsw i32 %64, %14
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %68, float addrspace(3)* %24, align 4, !tbaa !5
  br label %69

69:                                               ; preds = %58, %63, %60
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = icmp slt i32 %59, %4
  br i1 %70, label %71, label %76

71:                                               ; preds = %69
  %72 = load float, float addrspace(3)* %25, align 16, !tbaa !5
  %73 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %74 = fmul contract float %72, %73
  %75 = fadd contract float %48, %74
  br label %76

76:                                               ; preds = %69, %71
  %77 = phi float [ %75, %71 ], [ %48, %69 ]
  %78 = or i32 %59, 1
  %79 = icmp slt i32 %78, %4
  br i1 %79, label %80, label %85

80:                                               ; preds = %76
  %81 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %82 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %83 = fmul contract float %81, %82
  %84 = fadd contract float %77, %83
  br label %85

85:                                               ; preds = %80, %76
  %86 = phi float [ %84, %80 ], [ %77, %76 ]
  %87 = or i32 %59, 2
  %88 = icmp slt i32 %87, %4
  br i1 %88, label %89, label %94

89:                                               ; preds = %85
  %90 = load float, float addrspace(3)* %29, align 8, !tbaa !5
  %91 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %92 = fmul contract float %90, %91
  %93 = fadd contract float %86, %92
  br label %94

94:                                               ; preds = %89, %85
  %95 = phi float [ %93, %89 ], [ %86, %85 ]
  %96 = or i32 %59, 3
  %97 = icmp slt i32 %96, %4
  br i1 %97, label %98, label %103

98:                                               ; preds = %94
  %99 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %100 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %95, %101
  br label %103

103:                                              ; preds = %98, %94
  %104 = phi float [ %102, %98 ], [ %95, %94 ]
  %105 = or i32 %59, 4
  %106 = icmp slt i32 %105, %4
  br i1 %106, label %107, label %112

107:                                              ; preds = %103
  %108 = load float, float addrspace(3)* %33, align 16, !tbaa !5
  %109 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %110 = fmul contract float %108, %109
  %111 = fadd contract float %104, %110
  br label %112

112:                                              ; preds = %107, %103
  %113 = phi float [ %111, %107 ], [ %104, %103 ]
  %114 = or i32 %59, 5
  %115 = icmp slt i32 %114, %4
  br i1 %115, label %116, label %121

116:                                              ; preds = %112
  %117 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %118 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %113, %119
  br label %121

121:                                              ; preds = %116, %112
  %122 = phi float [ %120, %116 ], [ %113, %112 ]
  %123 = or i32 %59, 6
  %124 = icmp slt i32 %123, %4
  br i1 %124, label %125, label %130

125:                                              ; preds = %121
  %126 = load float, float addrspace(3)* %37, align 8, !tbaa !5
  %127 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %122, %128
  br label %130

130:                                              ; preds = %125, %121
  %131 = phi float [ %129, %125 ], [ %122, %121 ]
  %132 = or i32 %59, 7
  %133 = icmp slt i32 %132, %4
  br i1 %133, label %134, label %139

134:                                              ; preds = %130
  %135 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %136 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %131, %137
  br label %139

139:                                              ; preds = %134, %130
  %140 = phi float [ %138, %134 ], [ %131, %130 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %141 = add nuw nsw i32 %47, 1
  %142 = sitofp i32 %141 to float
  %143 = fcmp contract ogt float %17, %142
  br i1 %143, label %46, label %41, !llvm.loop !10

144:                                              ; preds = %41
  %145 = mul nsw i32 %12, %5
  %146 = add nsw i32 %145, %14
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %2, i64 %147
  store float %42, float addrspace(1)* %148, align 4, !tbaa !5
  br label %149

149:                                              ; preds = %144, %41
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

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
