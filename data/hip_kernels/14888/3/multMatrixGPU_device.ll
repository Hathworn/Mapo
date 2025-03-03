; ModuleID = '../data/hip_kernels/14888/3/main.cu'
source_filename = "../data/hip_kernels/14888/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13multMatrixGPUPKfmmS0_mmPf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readonly %3, i64 %4, i64 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %8
  %25 = add i64 %2, -1
  %26 = lshr i64 %25, 4
  %27 = sext i32 %17 to i64
  %28 = icmp uge i64 %27, %1
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 %8
  %30 = mul i64 %27, %2
  %31 = zext i32 %8 to i64
  %32 = add i64 %30, %31
  %33 = sext i32 %24 to i64
  %34 = icmp uge i64 %33, %5
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 %9, i32 %8
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 0
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 0, i32 %8
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 1
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 1, i32 %8
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 2
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 2, i32 %8
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 3
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 3, i32 %8
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 4
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 4, i32 %8
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 5
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 5, i32 %8
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 6
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 6, i32 %8
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 7
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 7, i32 %8
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 8
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 8, i32 %8
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 9
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 9, i32 %8
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 10
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 10, i32 %8
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 11
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 11, i32 %8
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 12
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 12, i32 %8
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 13
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 13, i32 %8
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 14
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 14, i32 %8
  %66 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_A, i32 0, i32 %9, i32 15
  %67 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13multMatrixGPUPKfmmS0_mmPfE4ds_B, i32 0, i32 15, i32 %8
  br label %72

68:                                               ; preds = %96
  %69 = icmp ult i64 %27, %1
  %70 = icmp ult i64 %33, %5
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %165, label %169

72:                                               ; preds = %7, %96
  %73 = phi i32 [ 0, %7 ], [ %162, %96 ]
  %74 = phi float [ 0.000000e+00, %7 ], [ %161, %96 ]
  %75 = shl nsw i32 %73, 4
  %76 = add nuw nsw i32 %75, %8
  %77 = zext i32 %76 to i64
  %78 = icmp uge i64 %77, %2
  %79 = select i1 %78, i1 true, i1 %28
  br i1 %79, label %85, label %80

80:                                               ; preds = %72
  %81 = zext i32 %75 to i64
  %82 = add i64 %32, %81
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %85

85:                                               ; preds = %72, %80
  %86 = phi float [ %84, %80 ], [ 0.000000e+00, %72 ]
  store float %86, float addrspace(3)* %29, align 4, !tbaa !7
  %87 = add nuw nsw i32 %75, %9
  %88 = zext i32 %87 to i64
  %89 = icmp uge i64 %88, %4
  %90 = select i1 %89, i1 true, i1 %34
  br i1 %90, label %96, label %91

91:                                               ; preds = %85
  %92 = mul i64 %88, %5
  %93 = add i64 %92, %33
  %94 = getelementptr inbounds float, float addrspace(1)* %3, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %96

96:                                               ; preds = %85, %91
  %97 = phi float [ %95, %91 ], [ 0.000000e+00, %85 ]
  store float %97, float addrspace(3)* %35, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = load float, float addrspace(3)* %36, align 16, !tbaa !7
  %99 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %100 = fmul contract float %98, %99
  %101 = fadd contract float %74, %100
  %102 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %103 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %104 = fmul contract float %102, %103
  %105 = fadd contract float %101, %104
  %106 = load float, float addrspace(3)* %40, align 8, !tbaa !7
  %107 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %108 = fmul contract float %106, %107
  %109 = fadd contract float %105, %108
  %110 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %111 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %109, %112
  %114 = load float, float addrspace(3)* %44, align 16, !tbaa !7
  %115 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %113, %116
  %118 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %119 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %117, %120
  %122 = load float, float addrspace(3)* %48, align 8, !tbaa !7
  %123 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %121, %124
  %126 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %127 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %52, align 16, !tbaa !7
  %131 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %135 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  %138 = load float, float addrspace(3)* %56, align 8, !tbaa !7
  %139 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %137, %140
  %142 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %143 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %144 = fmul contract float %142, %143
  %145 = fadd contract float %141, %144
  %146 = load float, float addrspace(3)* %60, align 16, !tbaa !7
  %147 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %148 = fmul contract float %146, %147
  %149 = fadd contract float %145, %148
  %150 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %151 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %152 = fmul contract float %150, %151
  %153 = fadd contract float %149, %152
  %154 = load float, float addrspace(3)* %64, align 8, !tbaa !7
  %155 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %156 = fmul contract float %154, %155
  %157 = fadd contract float %153, %156
  %158 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %159 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %160 = fmul contract float %158, %159
  %161 = fadd contract float %157, %160
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %162 = add nuw nsw i32 %73, 1
  %163 = zext i32 %162 to i64
  %164 = icmp ult i64 %26, %163
  br i1 %164, label %68, label %72, !llvm.loop !11

165:                                              ; preds = %68
  %166 = mul i64 %27, %5
  %167 = add i64 %166, %33
  %168 = getelementptr inbounds float, float addrspace(1)* %6, i64 %167
  store float %161, float addrspace(1)* %168, align 4, !tbaa !7
  br label %169

169:                                              ; preds = %165, %68
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
