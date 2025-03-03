; ModuleID = '../data/hip_kernels/1212/84/main.cu'
source_filename = "../data/hip_kernels/1212/84/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15sgemm_kernel_v2PKfS0_Pfiiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = icmp sgt i32 %5, 0
  %25 = add nsw i32 %21, %23
  br i1 %24, label %28, label %26

26:                                               ; preds = %8
  %27 = add nsw i32 %15, %22
  br label %66

28:                                               ; preds = %8
  %29 = mul nsw i32 %25, %5
  %30 = add nsw i32 %29, %22
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 %22
  %32 = add i32 %15, %22
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 %23, i32 %22
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 0
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 0, i32 %22
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 1
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 1, i32 %22
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 2
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 2, i32 %22
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 3
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 3, i32 %22
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 4
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 4, i32 %22
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 5
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 5, i32 %22
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 6
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 6, i32 %22
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 7
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 7, i32 %22
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 8
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 8, i32 %22
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 9
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 9, i32 %22
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 10
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 10, i32 %22
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 11
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 11, i32 %22
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 12
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 12, i32 %22
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 13
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 13, i32 %22
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 14
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 14, i32 %22
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_A, i32 0, i32 %23, i32 15
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15sgemm_kernel_v2PKfS0_PfiiiffE8s_tile_B, i32 0, i32 15, i32 %22
  br label %77

66:                                               ; preds = %77, %26
  %67 = phi i32 [ %27, %26 ], [ %32, %77 ]
  %68 = phi float [ 0.000000e+00, %26 ], [ %154, %77 ]
  %69 = fmul contract float %68, %6
  %70 = mul nsw i32 %25, %4
  %71 = add nsw i32 %67, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fmul contract float %74, %7
  %76 = fadd contract float %69, %75
  store float %76, float addrspace(1)* %73, align 4, !tbaa !7
  ret void

77:                                               ; preds = %28, %77
  %78 = phi i32 [ 0, %28 ], [ %155, %77 ]
  %79 = phi float [ 0.000000e+00, %28 ], [ %154, %77 ]
  %80 = add nsw i32 %30, %78
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %83, float addrspace(3)* %31, align 4, !tbaa !7
  %84 = shl nsw i32 %78, 4
  %85 = add nuw nsw i32 %84, %23
  %86 = mul nsw i32 %85, %4
  %87 = add i32 %32, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %90, float addrspace(3)* %33, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = load float, float addrspace(3)* %34, align 16, !tbaa !7
  %92 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %93 = fmul contract float %91, %92
  %94 = fadd contract float %79, %93
  %95 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %96 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %97 = fmul contract float %95, %96
  %98 = fadd contract float %94, %97
  %99 = load float, float addrspace(3)* %38, align 8, !tbaa !7
  %100 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %98, %101
  %103 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %104 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %102, %105
  %107 = load float, float addrspace(3)* %42, align 16, !tbaa !7
  %108 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %109 = fmul contract float %107, %108
  %110 = fadd contract float %106, %109
  %111 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %112 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %110, %113
  %115 = load float, float addrspace(3)* %46, align 8, !tbaa !7
  %116 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %114, %117
  %119 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %120 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = load float, float addrspace(3)* %50, align 16, !tbaa !7
  %124 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %122, %125
  %127 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %128 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %129 = fmul contract float %127, %128
  %130 = fadd contract float %126, %129
  %131 = load float, float addrspace(3)* %54, align 8, !tbaa !7
  %132 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %130, %133
  %135 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %136 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = load float, float addrspace(3)* %58, align 16, !tbaa !7
  %140 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %144 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %142, %145
  %147 = load float, float addrspace(3)* %62, align 8, !tbaa !7
  %148 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %146, %149
  %151 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %152 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %153 = fmul contract float %151, %152
  %154 = fadd contract float %150, %153
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %155 = add nuw nsw i32 %78, 16
  %156 = icmp slt i32 %155, %5
  br i1 %156, label %77, label %66, !llvm.loop !11
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
