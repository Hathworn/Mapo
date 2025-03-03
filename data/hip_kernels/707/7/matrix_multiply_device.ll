; ModuleID = '../data/hip_kernels/707/7/main.cu'
source_filename = "../data/hip_kernels/707/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15matrix_multiplyPfS_S_imE3s_a = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ15matrix_multiplyPfS_S_imE3s_b = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15matrix_multiplyPfS_S_im(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %7
  %17 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %8, %20
  %22 = add i32 %21, %6
  %23 = add i64 %4, -1
  %24 = lshr i64 %23, 4
  %25 = sext i32 %16 to i64
  %26 = icmp ult i64 %25, %4
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 %6
  %28 = mul i64 %25, %4
  %29 = zext i32 %6 to i64
  %30 = add i64 %28, %29
  %31 = sext i32 %22 to i64
  %32 = icmp ult i64 %31, %4
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 %7, i32 %6
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 0
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 0, i32 %6
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 1
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 1, i32 %6
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 2
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 2, i32 %6
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 3
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 3, i32 %6
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 4
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 4, i32 %6
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 5
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 5, i32 %6
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 6
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 6, i32 %6
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 7
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 7, i32 %6
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 8
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 8, i32 %6
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 9
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 9, i32 %6
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 10
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 10, i32 %6
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 11
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 11, i32 %6
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 12
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 12, i32 %6
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 13
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 13, i32 %6
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 14
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 14, i32 %6
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_a, i32 0, i32 %7, i32 15
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15matrix_multiplyPfS_S_imE3s_b, i32 0, i32 15, i32 %6
  br label %68

66:                                               ; preds = %93
  %67 = select i1 %26, i1 %32, i1 false
  br i1 %67, label %162, label %167

68:                                               ; preds = %5, %93
  %69 = phi i32 [ 0, %5 ], [ %159, %93 ]
  %70 = phi float [ 0.000000e+00, %5 ], [ %158, %93 ]
  br i1 %26, label %71, label %81

71:                                               ; preds = %68
  %72 = shl nsw i32 %69, 4
  %73 = add nuw nsw i32 %72, %6
  %74 = zext i32 %73 to i64
  %75 = icmp ult i64 %74, %4
  br i1 %75, label %76, label %81

76:                                               ; preds = %71
  %77 = zext i32 %72 to i64
  %78 = add i64 %30, %77
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %81

81:                                               ; preds = %68, %71, %76
  %82 = phi float [ %80, %76 ], [ 0.000000e+00, %71 ], [ 0.000000e+00, %68 ]
  store float %82, float addrspace(3)* %27, align 4, !tbaa !7
  br i1 %32, label %83, label %93

83:                                               ; preds = %81
  %84 = shl nsw i32 %69, 4
  %85 = add nuw nsw i32 %84, %7
  %86 = zext i32 %85 to i64
  %87 = icmp ult i64 %86, %4
  br i1 %87, label %88, label %93

88:                                               ; preds = %83
  %89 = mul i64 %86, %4
  %90 = add i64 %89, %31
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %93

93:                                               ; preds = %81, %83, %88
  %94 = phi float [ %92, %88 ], [ 0.000000e+00, %83 ], [ 0.000000e+00, %81 ]
  store float %94, float addrspace(3)* %33, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = load float, float addrspace(3)* %34, align 16, !tbaa !7
  %96 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %97 = fmul contract float %95, %96
  %98 = fadd contract float %70, %97
  %99 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %100 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %98, %101
  %103 = load float, float addrspace(3)* %38, align 8, !tbaa !7
  %104 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %102, %105
  %107 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %108 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %109 = fmul contract float %107, %108
  %110 = fadd contract float %106, %109
  %111 = load float, float addrspace(3)* %42, align 16, !tbaa !7
  %112 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %110, %113
  %115 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %116 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %114, %117
  %119 = load float, float addrspace(3)* %46, align 8, !tbaa !7
  %120 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %124 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %122, %125
  %127 = load float, float addrspace(3)* %50, align 16, !tbaa !7
  %128 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %129 = fmul contract float %127, %128
  %130 = fadd contract float %126, %129
  %131 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %132 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %130, %133
  %135 = load float, float addrspace(3)* %54, align 8, !tbaa !7
  %136 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %140 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = load float, float addrspace(3)* %58, align 16, !tbaa !7
  %144 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %142, %145
  %147 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %148 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %146, %149
  %151 = load float, float addrspace(3)* %62, align 8, !tbaa !7
  %152 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %153 = fmul contract float %151, %152
  %154 = fadd contract float %150, %153
  %155 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %156 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %157 = fmul contract float %155, %156
  %158 = fadd contract float %154, %157
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %159 = add nuw nsw i32 %69, 1
  %160 = zext i32 %159 to i64
  %161 = icmp ult i64 %24, %160
  br i1 %161, label %66, label %68, !llvm.loop !11

162:                                              ; preds = %66
  %163 = mul nsw i32 %16, %3
  %164 = add nsw i32 %163, %22
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  store float %158, float addrspace(1)* %166, align 4, !tbaa !7
  br label %167

167:                                              ; preds = %162, %66
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
