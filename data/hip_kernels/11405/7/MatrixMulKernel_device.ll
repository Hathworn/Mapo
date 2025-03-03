; ModuleID = '../data/hip_kernels/11405/7/main.cu'
source_filename = "../data/hip_kernels/11405/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15MatrixMulKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = icmp slt i32 %5, %3
  %8 = icmp slt i32 %6, %3
  %9 = select i1 %7, i1 %8, i1 false
  br i1 %9, label %10, label %147

10:                                               ; preds = %4
  %11 = mul nsw i32 %6, %3
  %12 = add i32 %3, -1
  %13 = and i32 %3, 7
  %14 = icmp ult i32 %12, 7
  br i1 %14, label %17, label %15

15:                                               ; preds = %10
  %16 = and i32 %3, -8
  br label %45

17:                                               ; preds = %45, %10
  %18 = phi float [ undef, %10 ], [ %143, %45 ]
  %19 = phi i32 [ 0, %10 ], [ %144, %45 ]
  %20 = phi float [ 0.000000e+00, %10 ], [ %143, %45 ]
  %21 = icmp eq i32 %13, 0
  br i1 %21, label %40, label %22

22:                                               ; preds = %17, %22
  %23 = phi i32 [ %37, %22 ], [ %19, %17 ]
  %24 = phi float [ %36, %22 ], [ %20, %17 ]
  %25 = phi i32 [ %38, %22 ], [ 0, %17 ]
  %26 = add nsw i32 %23, %11
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = mul nsw i32 %23, %3
  %31 = add nsw i32 %30, %5
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = fmul contract float %29, %34
  %36 = fadd contract float %24, %35
  %37 = add nuw nsw i32 %23, 1
  %38 = add i32 %25, 1
  %39 = icmp eq i32 %38, %13
  br i1 %39, label %40, label %22, !llvm.loop !10

40:                                               ; preds = %22, %17
  %41 = phi float [ %18, %17 ], [ %36, %22 ]
  %42 = add nsw i32 %11, %5
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  store float %41, float addrspace(1)* %44, align 4, !tbaa !5
  br label %147

45:                                               ; preds = %45, %15
  %46 = phi i32 [ 0, %15 ], [ %144, %45 ]
  %47 = phi float [ 0.000000e+00, %15 ], [ %143, %45 ]
  %48 = phi i32 [ 0, %15 ], [ %145, %45 ]
  %49 = add nsw i32 %46, %11
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = mul nsw i32 %46, %3
  %54 = add nsw i32 %53, %5
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = fmul contract float %52, %57
  %59 = fadd contract float %47, %58
  %60 = or i32 %46, 1
  %61 = add nsw i32 %60, %11
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  %65 = mul nsw i32 %60, %3
  %66 = add nsw i32 %65, %5
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = fmul contract float %64, %69
  %71 = fadd contract float %59, %70
  %72 = or i32 %46, 2
  %73 = add nsw i32 %72, %11
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = mul nsw i32 %72, %3
  %78 = add nsw i32 %77, %5
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = fmul contract float %76, %81
  %83 = fadd contract float %71, %82
  %84 = or i32 %46, 3
  %85 = add nsw i32 %84, %11
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = mul nsw i32 %84, %3
  %90 = add nsw i32 %89, %5
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = fmul contract float %88, %93
  %95 = fadd contract float %83, %94
  %96 = or i32 %46, 4
  %97 = add nsw i32 %96, %11
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5, !amdgpu.noclobber !9
  %101 = mul nsw i32 %96, %3
  %102 = add nsw i32 %101, %5
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  %106 = fmul contract float %100, %105
  %107 = fadd contract float %95, %106
  %108 = or i32 %46, 5
  %109 = add nsw i32 %108, %11
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5, !amdgpu.noclobber !9
  %113 = mul nsw i32 %108, %3
  %114 = add nsw i32 %113, %5
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = fmul contract float %112, %117
  %119 = fadd contract float %107, %118
  %120 = or i32 %46, 6
  %121 = add nsw i32 %120, %11
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5, !amdgpu.noclobber !9
  %125 = mul nsw i32 %120, %3
  %126 = add nsw i32 %125, %5
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !5, !amdgpu.noclobber !9
  %130 = fmul contract float %124, %129
  %131 = fadd contract float %119, %130
  %132 = or i32 %46, 7
  %133 = add nsw i32 %132, %11
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  %137 = mul nsw i32 %132, %3
  %138 = add nsw i32 %137, %5
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !5, !amdgpu.noclobber !9
  %142 = fmul contract float %136, %141
  %143 = fadd contract float %131, %142
  %144 = add nuw nsw i32 %46, 8
  %145 = add i32 %48, 8
  %146 = icmp eq i32 %145, %16
  br i1 %146, label %17, label %45, !llvm.loop !12

147:                                              ; preds = %40, %4
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
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
