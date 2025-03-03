; ModuleID = '../data/hip_kernels/5248/0/main.cu'
source_filename = "../data/hip_kernels/5248/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14matrixMulCUDA1PfS_S_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp sgt i32 %3, 0
  %8 = mul nsw i32 %5, %3
  br i1 %7, label %9, label %139

9:                                                ; preds = %4
  %10 = and i32 %3, 7
  %11 = icmp ult i32 %3, 8
  br i1 %11, label %116, label %12

12:                                               ; preds = %9
  %13 = and i32 %3, -8
  br label %14

14:                                               ; preds = %14, %12
  %15 = phi float [ 0.000000e+00, %12 ], [ %112, %14 ]
  %16 = phi i32 [ 0, %12 ], [ %113, %14 ]
  %17 = phi i32 [ 0, %12 ], [ %114, %14 ]
  %18 = add nsw i32 %16, %8
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = mul nsw i32 %16, %3
  %23 = add nsw i32 %22, %6
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = fmul contract float %21, %26
  %28 = fadd contract float %15, %27
  %29 = or i32 %16, 1
  %30 = add nsw i32 %29, %8
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = mul nsw i32 %29, %3
  %35 = add nsw i32 %34, %6
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = fmul contract float %33, %38
  %40 = fadd contract float %28, %39
  %41 = or i32 %16, 2
  %42 = add nsw i32 %41, %8
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = mul nsw i32 %41, %3
  %47 = add nsw i32 %46, %6
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = fmul contract float %45, %50
  %52 = fadd contract float %40, %51
  %53 = or i32 %16, 3
  %54 = add nsw i32 %53, %8
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = mul nsw i32 %53, %3
  %59 = add nsw i32 %58, %6
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = fmul contract float %57, %62
  %64 = fadd contract float %52, %63
  %65 = or i32 %16, 4
  %66 = add nsw i32 %65, %8
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = mul nsw i32 %65, %3
  %71 = add nsw i32 %70, %6
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  %75 = fmul contract float %69, %74
  %76 = fadd contract float %64, %75
  %77 = or i32 %16, 5
  %78 = add nsw i32 %77, %8
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = mul nsw i32 %77, %3
  %83 = add nsw i32 %82, %6
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  %87 = fmul contract float %81, %86
  %88 = fadd contract float %76, %87
  %89 = or i32 %16, 6
  %90 = add nsw i32 %89, %8
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = mul nsw i32 %89, %3
  %95 = add nsw i32 %94, %6
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !5, !amdgpu.noclobber !9
  %99 = fmul contract float %93, %98
  %100 = fadd contract float %88, %99
  %101 = or i32 %16, 7
  %102 = add nsw i32 %101, %8
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  %106 = mul nsw i32 %101, %3
  %107 = add nsw i32 %106, %6
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %2, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = fmul contract float %105, %110
  %112 = fadd contract float %100, %111
  %113 = add nuw nsw i32 %16, 8
  %114 = add i32 %17, 8
  %115 = icmp eq i32 %114, %13
  br i1 %115, label %116, label %14, !llvm.loop !10

116:                                              ; preds = %14, %9
  %117 = phi float [ undef, %9 ], [ %112, %14 ]
  %118 = phi float [ 0.000000e+00, %9 ], [ %112, %14 ]
  %119 = phi i32 [ 0, %9 ], [ %113, %14 ]
  %120 = icmp eq i32 %10, 0
  br i1 %120, label %139, label %121

121:                                              ; preds = %116, %121
  %122 = phi float [ %135, %121 ], [ %118, %116 ]
  %123 = phi i32 [ %136, %121 ], [ %119, %116 ]
  %124 = phi i32 [ %137, %121 ], [ 0, %116 ]
  %125 = add nsw i32 %123, %8
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !5, !amdgpu.noclobber !9
  %129 = mul nsw i32 %123, %3
  %130 = add nsw i32 %129, %6
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %2, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5, !amdgpu.noclobber !9
  %134 = fmul contract float %128, %133
  %135 = fadd contract float %122, %134
  %136 = add nuw nsw i32 %123, 1
  %137 = add i32 %124, 1
  %138 = icmp eq i32 %137, %10
  br i1 %138, label %139, label %121, !llvm.loop !12

139:                                              ; preds = %116, %121, %4
  %140 = phi float [ 0.000000e+00, %4 ], [ %117, %116 ], [ %135, %121 ]
  %141 = add nsw i32 %8, %6
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  store float %140, float addrspace(1)* %143, align 4, !tbaa !5
  ret void
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
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
