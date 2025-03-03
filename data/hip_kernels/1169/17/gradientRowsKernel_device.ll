; ModuleID = '../data/hip_kernels/1169/17/main.cu'
source_filename = "../data/hip_kernels/1169/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18gradientRowsKernelPfS_iiiE6s_Data = internal unnamed_addr addrspace(3) global [4 x [4 x [160 x float]]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18gradientRowsKernelPfS_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 7
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add nsw i32 %8, -16
  %10 = add i32 %9, %7
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = shl i32 %11, 2
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %16 = shl i32 %15, 2
  %17 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %18 = add i32 %16, %17
  %19 = mul nsw i32 %18, %3
  %20 = add nsw i32 %14, %19
  %21 = mul nsw i32 %20, %2
  %22 = add nsw i32 %21, %10
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = getelementptr inbounds float, float addrspace(1)* %24, i64 16
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = add nuw nsw i32 %8, 16
  %28 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %27
  store float %26, float addrspace(3)* %28, align 4, !tbaa !5
  %29 = getelementptr inbounds float, float addrspace(1)* %24, i64 32
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = add nuw nsw i32 %8, 32
  %32 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %31
  store float %30, float addrspace(3)* %32, align 4, !tbaa !5
  %33 = getelementptr inbounds float, float addrspace(1)* %24, i64 48
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = add nuw nsw i32 %8, 48
  %36 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %35
  store float %34, float addrspace(3)* %36, align 4, !tbaa !5
  %37 = getelementptr inbounds float, float addrspace(1)* %24, i64 64
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = add nuw nsw i32 %8, 64
  %40 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %39
  store float %38, float addrspace(3)* %40, align 4, !tbaa !5
  %41 = getelementptr inbounds float, float addrspace(1)* %24, i64 80
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = add nuw nsw i32 %8, 80
  %44 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %43
  store float %42, float addrspace(3)* %44, align 4, !tbaa !5
  %45 = getelementptr inbounds float, float addrspace(1)* %24, i64 96
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = add nuw nsw i32 %8, 96
  %48 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %47
  store float %46, float addrspace(3)* %48, align 4, !tbaa !5
  %49 = getelementptr inbounds float, float addrspace(1)* %24, i64 112
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = add nuw nsw i32 %8, 112
  %52 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %51
  store float %50, float addrspace(3)* %52, align 4, !tbaa !5
  %53 = getelementptr inbounds float, float addrspace(1)* %24, i64 128
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = add nuw nsw i32 %8, 128
  %56 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %55
  store float %54, float addrspace(3)* %56, align 4, !tbaa !5
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %58 = icmp sgt i32 %10, -1
  br i1 %58, label %59, label %61

59:                                               ; preds = %5
  %60 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %61

61:                                               ; preds = %5, %59
  %62 = phi contract float [ %60, %59 ], [ 0.000000e+00, %5 ]
  %63 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %8
  store float %62, float addrspace(3)* %63, align 4, !tbaa !5
  %64 = add nsw i32 %10, 144
  %65 = icmp slt i32 %64, %2
  br i1 %65, label %66, label %69

66:                                               ; preds = %61
  %67 = getelementptr inbounds float, float addrspace(1)* %24, i64 144
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %69

69:                                               ; preds = %61, %66
  %70 = phi contract float [ %68, %66 ], [ 0.000000e+00, %61 ]
  %71 = add nuw nsw i32 %8, 144
  %72 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %71
  store float %70, float addrspace(3)* %72, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %73 = add nuw nsw i32 %8, 17
  %74 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %76 = fadd contract float %75, 0.000000e+00
  %77 = add nuw nsw i32 %8, 15
  %78 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %77
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %80 = fsub contract float %76, %79
  %81 = fmul contract float %80, 5.000000e-01
  %82 = getelementptr inbounds float, float addrspace(1)* %57, i64 16
  store float %81, float addrspace(1)* %82, align 4, !tbaa !5
  %83 = add nuw nsw i32 %8, 33
  %84 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %83
  %85 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %86 = fadd contract float %85, 0.000000e+00
  %87 = add nuw nsw i32 %8, 31
  %88 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %87
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %90 = fsub contract float %86, %89
  %91 = fmul contract float %90, 5.000000e-01
  %92 = getelementptr inbounds float, float addrspace(1)* %57, i64 32
  store float %91, float addrspace(1)* %92, align 4, !tbaa !5
  %93 = add nuw nsw i32 %8, 49
  %94 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %93
  %95 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %96 = fadd contract float %95, 0.000000e+00
  %97 = add nuw nsw i32 %8, 47
  %98 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !5
  %100 = fsub contract float %96, %99
  %101 = fmul contract float %100, 5.000000e-01
  %102 = getelementptr inbounds float, float addrspace(1)* %57, i64 48
  store float %101, float addrspace(1)* %102, align 4, !tbaa !5
  %103 = add nuw nsw i32 %8, 65
  %104 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %103
  %105 = load float, float addrspace(3)* %104, align 4, !tbaa !5
  %106 = fadd contract float %105, 0.000000e+00
  %107 = add nuw nsw i32 %8, 63
  %108 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %107
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !5
  %110 = fsub contract float %106, %109
  %111 = fmul contract float %110, 5.000000e-01
  %112 = getelementptr inbounds float, float addrspace(1)* %57, i64 64
  store float %111, float addrspace(1)* %112, align 4, !tbaa !5
  %113 = add nuw nsw i32 %8, 81
  %114 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %113
  %115 = load float, float addrspace(3)* %114, align 4, !tbaa !5
  %116 = fadd contract float %115, 0.000000e+00
  %117 = add nuw nsw i32 %8, 79
  %118 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %117
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %120 = fsub contract float %116, %119
  %121 = fmul contract float %120, 5.000000e-01
  %122 = getelementptr inbounds float, float addrspace(1)* %57, i64 80
  store float %121, float addrspace(1)* %122, align 4, !tbaa !5
  %123 = add nuw nsw i32 %8, 97
  %124 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %123
  %125 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %126 = fadd contract float %125, 0.000000e+00
  %127 = add nuw nsw i32 %8, 95
  %128 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %127
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !5
  %130 = fsub contract float %126, %129
  %131 = fmul contract float %130, 5.000000e-01
  %132 = getelementptr inbounds float, float addrspace(1)* %57, i64 96
  store float %131, float addrspace(1)* %132, align 4, !tbaa !5
  %133 = add nuw nsw i32 %8, 113
  %134 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !5
  %136 = fadd contract float %135, 0.000000e+00
  %137 = add nuw nsw i32 %8, 111
  %138 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %137
  %139 = load float, float addrspace(3)* %138, align 4, !tbaa !5
  %140 = fsub contract float %136, %139
  %141 = fmul contract float %140, 5.000000e-01
  %142 = getelementptr inbounds float, float addrspace(1)* %57, i64 112
  store float %141, float addrspace(1)* %142, align 4, !tbaa !5
  %143 = add nuw nsw i32 %8, 129
  %144 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %143
  %145 = load float, float addrspace(3)* %144, align 4, !tbaa !5
  %146 = fadd contract float %145, 0.000000e+00
  %147 = add nuw nsw i32 %8, 127
  %148 = getelementptr inbounds [4 x [4 x [160 x float]]], [4 x [4 x [160 x float]]] addrspace(3)* @_ZZ18gradientRowsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %13, i32 %147
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %150 = fsub contract float %146, %149
  %151 = fmul contract float %150, 5.000000e-01
  %152 = getelementptr inbounds float, float addrspace(1)* %57, i64 128
  store float %151, float addrspace(1)* %152, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
