; ModuleID = '../data/hip_kernels/16553/0/main.cu'
source_filename = "../data/hip_kernels/16553/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23kernelSum_Column_MatrixPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = udiv i32 %2, %9
  %11 = mul nsw i32 %4, %2
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = mul i32 %10, %12
  %14 = add i32 %13, %11
  %15 = icmp sgt i32 %10, 0
  br i1 %15, label %16, label %38

16:                                               ; preds = %3
  %17 = and i32 %10, 7
  %18 = icmp ult i32 %10, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %16
  %20 = and i32 %10, -8
  br label %52

21:                                               ; preds = %52, %16
  %22 = phi float [ undef, %16 ], [ %102, %52 ]
  %23 = phi i32 [ 0, %16 ], [ %103, %52 ]
  %24 = phi float [ 0.000000e+00, %16 ], [ %102, %52 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %38, label %26

26:                                               ; preds = %21, %26
  %27 = phi i32 [ %35, %26 ], [ %23, %21 ]
  %28 = phi float [ %34, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %36, %26 ], [ 0, %21 ]
  %30 = add nsw i32 %14, %27
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fadd contract float %28, %33
  %35 = add nuw nsw i32 %27, 1
  %36 = add i32 %29, 1
  %37 = icmp eq i32 %36, %17
  br i1 %37, label %38, label %26, !llvm.loop !11

38:                                               ; preds = %21, %26, %3
  %39 = phi float [ 0.000000e+00, %3 ], [ %22, %21 ], [ %34, %26 ]
  %40 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %12
  store float %39, float addrspace(3)* %40, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp eq i32 %12, 0
  br i1 %41, label %42, label %165

42:                                               ; preds = %38
  %43 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 0), align 16, !tbaa !7
  %44 = icmp ugt i16 %8, 1
  br i1 %44, label %45, label %123

45:                                               ; preds = %42
  %46 = add nsw i32 %9, -1
  %47 = add nsw i32 %9, -2
  %48 = and i32 %46, 7
  %49 = icmp ult i32 %47, 7
  br i1 %49, label %106, label %50

50:                                               ; preds = %45
  %51 = and i32 %46, -8
  br label %127

52:                                               ; preds = %52, %19
  %53 = phi i32 [ 0, %19 ], [ %103, %52 ]
  %54 = phi float [ 0.000000e+00, %19 ], [ %102, %52 ]
  %55 = phi i32 [ 0, %19 ], [ %104, %52 ]
  %56 = add nsw i32 %14, %53
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fadd contract float %54, %59
  %61 = or i32 %53, 1
  %62 = add nsw i32 %14, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fadd contract float %60, %65
  %67 = or i32 %53, 2
  %68 = add nsw i32 %14, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fadd contract float %66, %71
  %73 = or i32 %53, 3
  %74 = add nsw i32 %14, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fadd contract float %72, %77
  %79 = or i32 %53, 4
  %80 = add nsw i32 %14, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = fadd contract float %78, %83
  %85 = or i32 %53, 5
  %86 = add nsw i32 %14, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fadd contract float %84, %89
  %91 = or i32 %53, 6
  %92 = add nsw i32 %14, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = fadd contract float %90, %95
  %97 = or i32 %53, 7
  %98 = add nsw i32 %14, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = fadd contract float %96, %101
  %103 = add nuw nsw i32 %53, 8
  %104 = add i32 %55, 8
  %105 = icmp eq i32 %104, %20
  br i1 %105, label %21, label %52, !llvm.loop !13

106:                                              ; preds = %127, %45
  %107 = phi float [ undef, %45 ], [ %161, %127 ]
  %108 = phi i32 [ 1, %45 ], [ %162, %127 ]
  %109 = phi float [ %43, %45 ], [ %161, %127 ]
  %110 = icmp eq i32 %48, 0
  br i1 %110, label %121, label %111

111:                                              ; preds = %106, %111
  %112 = phi i32 [ %118, %111 ], [ %108, %106 ]
  %113 = phi float [ %117, %111 ], [ %109, %106 ]
  %114 = phi i32 [ %119, %111 ], [ 0, %106 ]
  %115 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %112
  %116 = load float, float addrspace(3)* %115, align 4, !tbaa !7
  %117 = fadd contract float %113, %116
  %118 = add nuw nsw i32 %112, 1
  %119 = add i32 %114, 1
  %120 = icmp eq i32 %119, %48
  br i1 %120, label %121, label %111, !llvm.loop !15

121:                                              ; preds = %111, %106
  %122 = phi float [ %107, %106 ], [ %117, %111 ]
  store float %122, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 0), align 16, !tbaa !7
  br label %123

123:                                              ; preds = %121, %42
  %124 = phi float [ %122, %121 ], [ %43, %42 ]
  %125 = zext i32 %4 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  store float %124, float addrspace(1)* %126, align 4, !tbaa !7
  br label %165

127:                                              ; preds = %127, %50
  %128 = phi i32 [ 1, %50 ], [ %162, %127 ]
  %129 = phi float [ %43, %50 ], [ %161, %127 ]
  %130 = phi i32 [ 0, %50 ], [ %163, %127 ]
  %131 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %128
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !7
  %133 = fadd contract float %129, %132
  %134 = add nuw nsw i32 %128, 1
  %135 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %134
  %136 = load float, float addrspace(3)* %135, align 4, !tbaa !7
  %137 = fadd contract float %133, %136
  %138 = add nuw nsw i32 %128, 2
  %139 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %138
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !7
  %141 = fadd contract float %137, %140
  %142 = add nuw nsw i32 %128, 3
  %143 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %142
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !7
  %145 = fadd contract float %141, %144
  %146 = add nuw nsw i32 %128, 4
  %147 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %146
  %148 = load float, float addrspace(3)* %147, align 4, !tbaa !7
  %149 = fadd contract float %145, %148
  %150 = add nuw nsw i32 %128, 5
  %151 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %150
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !7
  %153 = fadd contract float %149, %152
  %154 = add nuw nsw i32 %128, 6
  %155 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %154
  %156 = load float, float addrspace(3)* %155, align 4, !tbaa !7
  %157 = fadd contract float %153, %156
  %158 = add nuw nsw i32 %128, 7
  %159 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ23kernelSum_Column_MatrixPfS_iE11shareMatrix, i32 0, i32 %158
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !7
  %161 = fadd contract float %157, %160
  %162 = add nuw nsw i32 %128, 8
  %163 = add i32 %130, 8
  %164 = icmp eq i32 %163, %51
  br i1 %164, label %106, label %127, !llvm.loop !16

165:                                              ; preds = %123, %38
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
