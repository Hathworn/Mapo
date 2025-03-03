; ModuleID = '../data/hip_kernels/14521/14/main.cu'
source_filename = "../data/hip_kernels/14521/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8Kernel10iiiPfS_S_E2sA = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ8Kernel10iiiPfS_S_E2sB = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8Kernel10iiiPfS_S_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %8, 4
  %12 = add nsw i32 %11, %10
  %13 = shl nsw i32 %7, 4
  %14 = add nsw i32 %13, %9
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %16, label %53

16:                                               ; preds = %6
  %17 = mul nsw i32 %12, %2
  %18 = add i32 %17, %9
  %19 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 %9
  %20 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 %10, i32 %9
  %21 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 0
  %22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 0, i32 %9
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 1
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 1, i32 %9
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 2
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 2, i32 %9
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 3
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 3, i32 %9
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 4
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 4, i32 %9
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 5
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 5, i32 %9
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 6
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 6, i32 %9
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 7
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 7, i32 %9
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 8
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 8, i32 %9
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 9
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 9, i32 %9
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 10
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 10, i32 %9
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 11
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 11, i32 %9
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 12
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 12, i32 %9
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 13
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 13, i32 %9
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 14
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 14, i32 %9
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sA, i32 0, i32 %10, i32 15
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel10iiiPfS_S_E2sB, i32 0, i32 15, i32 %9
  br label %59

53:                                               ; preds = %59, %6
  %54 = phi float [ 0.000000e+00, %6 ], [ %135, %59 ]
  %55 = mul nsw i32 %12, %1
  %56 = add nsw i32 %55, %14
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %5, i64 %57
  store float %54, float addrspace(1)* %58, align 4, !tbaa !5
  ret void

59:                                               ; preds = %16, %59
  %60 = phi i32 [ 0, %16 ], [ %136, %59 ]
  %61 = phi float [ 0.000000e+00, %16 ], [ %135, %59 ]
  %62 = add i32 %18, %60
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %3, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %65, float addrspace(3)* %19, align 4, !tbaa !5
  %66 = add nuw nsw i32 %60, %10
  %67 = mul nsw i32 %66, %1
  %68 = add nsw i32 %67, %14
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %4, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %71, float addrspace(3)* %20, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = load float, float addrspace(3)* %21, align 16, !tbaa !5
  %73 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %74 = fmul contract float %72, %73
  %75 = fadd contract float %61, %74
  %76 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %77 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %78 = fmul contract float %76, %77
  %79 = fadd contract float %75, %78
  %80 = load float, float addrspace(3)* %25, align 8, !tbaa !5
  %81 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %82 = fmul contract float %80, %81
  %83 = fadd contract float %79, %82
  %84 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %85 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %86 = fmul contract float %84, %85
  %87 = fadd contract float %83, %86
  %88 = load float, float addrspace(3)* %29, align 16, !tbaa !5
  %89 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %90 = fmul contract float %88, %89
  %91 = fadd contract float %87, %90
  %92 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %93 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %94 = fmul contract float %92, %93
  %95 = fadd contract float %91, %94
  %96 = load float, float addrspace(3)* %33, align 8, !tbaa !5
  %97 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %98 = fmul contract float %96, %97
  %99 = fadd contract float %95, %98
  %100 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %101 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %102 = fmul contract float %100, %101
  %103 = fadd contract float %99, %102
  %104 = load float, float addrspace(3)* %37, align 16, !tbaa !5
  %105 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %106 = fmul contract float %104, %105
  %107 = fadd contract float %103, %106
  %108 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %109 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %110 = fmul contract float %108, %109
  %111 = fadd contract float %107, %110
  %112 = load float, float addrspace(3)* %41, align 8, !tbaa !5
  %113 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %114 = fmul contract float %112, %113
  %115 = fadd contract float %111, %114
  %116 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %117 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %115, %118
  %120 = load float, float addrspace(3)* %45, align 16, !tbaa !5
  %121 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %119, %122
  %124 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %125 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %123, %126
  %128 = load float, float addrspace(3)* %49, align 8, !tbaa !5
  %129 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  %132 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %133 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %136 = add nuw nsw i32 %60, 16
  %137 = icmp slt i32 %136, %2
  br i1 %137, label %59, label %53, !llvm.loop !10
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
