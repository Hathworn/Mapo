; ModuleID = '../data/hip_kernels/157/11/main.cu'
source_filename = "../data/hip_kernels/157/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20matrixMultiplySharedPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = add i32 %18, %11
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = add i32 %25, %10
  %27 = icmp slt i32 %5, -14
  br i1 %27, label %68, label %28

28:                                               ; preds = %9
  %29 = add nsw i32 %5, -1
  %30 = sdiv i32 %29, 16
  %31 = icmp slt i32 %19, %3
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 %10
  %33 = mul nsw i32 %19, %5
  %34 = icmp slt i32 %26, %6
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 %11, i32 %10
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 0
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 0, i32 %10
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 1
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 1, i32 %10
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 2
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 2, i32 %10
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 3
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 3, i32 %10
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 4
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 4, i32 %10
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 5
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 5, i32 %10
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 6
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 6, i32 %10
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 7
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 7, i32 %10
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 8
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 8, i32 %10
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 9
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 9, i32 %10
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 10
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 10, i32 %10
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 11
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 11, i32 %10
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 12
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 12, i32 %10
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 13
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 13, i32 %10
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 14
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 14, i32 %10
  %66 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 15
  %67 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE4ds_B, i32 0, i32 15, i32 %10
  br label %73

68:                                               ; preds = %97, %9
  %69 = phi float [ 0.000000e+00, %9 ], [ %162, %97 ]
  %70 = icmp slt i32 %19, %3
  %71 = icmp slt i32 %26, %6
  %72 = select i1 %70, i1 %71, i1 false
  br i1 %72, label %165, label %170

73:                                               ; preds = %28, %97
  %74 = phi i32 [ 0, %28 ], [ %163, %97 ]
  %75 = phi float [ 0.000000e+00, %28 ], [ %162, %97 ]
  br i1 %31, label %76, label %85

76:                                               ; preds = %73
  %77 = shl nsw i32 %74, 4
  %78 = add nuw i32 %77, %10
  %79 = icmp slt i32 %78, %5
  br i1 %79, label %80, label %85

80:                                               ; preds = %76
  %81 = add i32 %78, %33
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %85

85:                                               ; preds = %73, %76, %80
  %86 = phi float [ %84, %80 ], [ 0.000000e+00, %76 ], [ 0.000000e+00, %73 ]
  store float %86, float addrspace(3)* %32, align 4, !tbaa !7
  br i1 %34, label %87, label %97

87:                                               ; preds = %85
  %88 = shl nsw i32 %74, 4
  %89 = add nuw nsw i32 %88, %11
  %90 = icmp slt i32 %89, %5
  br i1 %90, label %91, label %97

91:                                               ; preds = %87
  %92 = mul nsw i32 %89, %6
  %93 = add nsw i32 %92, %26
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %97

97:                                               ; preds = %85, %87, %91
  %98 = phi float [ %96, %91 ], [ 0.000000e+00, %87 ], [ 0.000000e+00, %85 ]
  store float %98, float addrspace(3)* %35, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %99 = load float, float addrspace(3)* %36, align 16, !tbaa !7
  %100 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %75, %101
  %103 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %104 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %102, %105
  %107 = load float, float addrspace(3)* %40, align 8, !tbaa !7
  %108 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %109 = fmul contract float %107, %108
  %110 = fadd contract float %106, %109
  %111 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %112 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %110, %113
  %115 = load float, float addrspace(3)* %44, align 16, !tbaa !7
  %116 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %114, %117
  %119 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %120 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = load float, float addrspace(3)* %48, align 8, !tbaa !7
  %124 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %122, %125
  %127 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %128 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %129 = fmul contract float %127, %128
  %130 = fadd contract float %126, %129
  %131 = load float, float addrspace(3)* %52, align 16, !tbaa !7
  %132 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %130, %133
  %135 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %136 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = load float, float addrspace(3)* %56, align 8, !tbaa !7
  %140 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %144 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %142, %145
  %147 = load float, float addrspace(3)* %60, align 16, !tbaa !7
  %148 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %146, %149
  %151 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %152 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %153 = fmul contract float %151, %152
  %154 = fadd contract float %150, %153
  %155 = load float, float addrspace(3)* %64, align 8, !tbaa !7
  %156 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %157 = fmul contract float %155, %156
  %158 = fadd contract float %154, %157
  %159 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %160 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %161 = fmul contract float %159, %160
  %162 = fadd contract float %158, %161
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %163 = add nuw nsw i32 %74, 1
  %164 = icmp eq i32 %74, %30
  br i1 %164, label %68, label %73, !llvm.loop !11

165:                                              ; preds = %68
  %166 = mul nsw i32 %19, %6
  %167 = add nsw i32 %166, %26
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %2, i64 %168
  store float %69, float addrspace(1)* %169, align 4, !tbaa !7
  br label %170

170:                                              ; preds = %165, %68
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
