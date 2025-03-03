; ModuleID = '../data/hip_kernels/11919/1/main.cu'
source_filename = "../data/hip_kernels/11919/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15MatrixMulKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = icmp sgt i32 %3, 0
  %8 = mul nsw i32 %6, %3
  br i1 %7, label %9, label %37

9:                                                ; preds = %4
  %10 = and i32 %3, 7
  %11 = icmp ult i32 %3, 8
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  %13 = and i32 %3, -8
  br label %42

14:                                               ; preds = %42, %9
  %15 = phi float [ undef, %9 ], [ %140, %42 ]
  %16 = phi float [ 0.000000e+00, %9 ], [ %140, %42 ]
  %17 = phi i32 [ 0, %9 ], [ %141, %42 ]
  %18 = icmp eq i32 %10, 0
  br i1 %18, label %37, label %19

19:                                               ; preds = %14, %19
  %20 = phi float [ %33, %19 ], [ %16, %14 ]
  %21 = phi i32 [ %34, %19 ], [ %17, %14 ]
  %22 = phi i32 [ %35, %19 ], [ 0, %14 ]
  %23 = add nsw i32 %21, %8
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = mul nsw i32 %21, %3
  %28 = add nsw i32 %27, %5
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = fmul contract float %26, %31
  %33 = fadd contract float %20, %32
  %34 = add nuw nsw i32 %21, 1
  %35 = add i32 %22, 1
  %36 = icmp eq i32 %35, %10
  br i1 %36, label %37, label %19, !llvm.loop !10

37:                                               ; preds = %14, %19, %4
  %38 = phi float [ 0.000000e+00, %4 ], [ %15, %14 ], [ %33, %19 ]
  %39 = add nsw i32 %8, %5
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  store float %38, float addrspace(1)* %41, align 4, !tbaa !5
  ret void

42:                                               ; preds = %42, %12
  %43 = phi float [ 0.000000e+00, %12 ], [ %140, %42 ]
  %44 = phi i32 [ 0, %12 ], [ %141, %42 ]
  %45 = phi i32 [ 0, %12 ], [ %142, %42 ]
  %46 = add nsw i32 %44, %8
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = mul nsw i32 %44, %3
  %51 = add nsw i32 %50, %5
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = fmul contract float %49, %54
  %56 = fadd contract float %43, %55
  %57 = or i32 %44, 1
  %58 = add nsw i32 %57, %8
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = mul nsw i32 %57, %3
  %63 = add nsw i32 %62, %5
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5, !amdgpu.noclobber !9
  %67 = fmul contract float %61, %66
  %68 = fadd contract float %56, %67
  %69 = or i32 %44, 2
  %70 = add nsw i32 %69, %8
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = mul nsw i32 %69, %3
  %75 = add nsw i32 %74, %5
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  %79 = fmul contract float %73, %78
  %80 = fadd contract float %68, %79
  %81 = or i32 %44, 3
  %82 = add nsw i32 %81, %8
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5, !amdgpu.noclobber !9
  %86 = mul nsw i32 %81, %3
  %87 = add nsw i32 %86, %5
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5, !amdgpu.noclobber !9
  %91 = fmul contract float %85, %90
  %92 = fadd contract float %80, %91
  %93 = or i32 %44, 4
  %94 = add nsw i32 %93, %8
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5, !amdgpu.noclobber !9
  %98 = mul nsw i32 %93, %3
  %99 = add nsw i32 %98, %5
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = fmul contract float %97, %102
  %104 = fadd contract float %92, %103
  %105 = or i32 %44, 5
  %106 = add nsw i32 %105, %8
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5, !amdgpu.noclobber !9
  %110 = mul nsw i32 %105, %3
  %111 = add nsw i32 %110, %5
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5, !amdgpu.noclobber !9
  %115 = fmul contract float %109, %114
  %116 = fadd contract float %104, %115
  %117 = or i32 %44, 6
  %118 = add nsw i32 %117, %8
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = mul nsw i32 %117, %3
  %123 = add nsw i32 %122, %5
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5, !amdgpu.noclobber !9
  %127 = fmul contract float %121, %126
  %128 = fadd contract float %116, %127
  %129 = or i32 %44, 7
  %130 = add nsw i32 %129, %8
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5, !amdgpu.noclobber !9
  %134 = mul nsw i32 %129, %3
  %135 = add nsw i32 %134, %5
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5, !amdgpu.noclobber !9
  %139 = fmul contract float %133, %138
  %140 = fadd contract float %128, %139
  %141 = add nuw nsw i32 %44, 8
  %142 = add i32 %45, 8
  %143 = icmp eq i32 %142, %13
  br i1 %143, label %14, label %42, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
