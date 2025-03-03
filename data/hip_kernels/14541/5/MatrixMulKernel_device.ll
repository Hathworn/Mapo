; ModuleID = '../data/hip_kernels/14541/5/main.cu'
source_filename = "../data/hip_kernels/14541/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15MatrixMulKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = shl i32 %5, 12
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = or i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 12
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = or i32 %10, %11
  %13 = icmp sgt i32 %3, 0
  %14 = mul nsw i32 %8, %3
  br i1 %13, label %15, label %43

15:                                               ; preds = %4
  %16 = and i32 %3, 7
  %17 = icmp ult i32 %3, 8
  br i1 %17, label %20, label %18

18:                                               ; preds = %15
  %19 = and i32 %3, -8
  br label %48

20:                                               ; preds = %48, %15
  %21 = phi float [ undef, %15 ], [ %146, %48 ]
  %22 = phi i32 [ 0, %15 ], [ %147, %48 ]
  %23 = phi float [ 0.000000e+00, %15 ], [ %146, %48 ]
  %24 = icmp eq i32 %16, 0
  br i1 %24, label %43, label %25

25:                                               ; preds = %20, %25
  %26 = phi i32 [ %40, %25 ], [ %22, %20 ]
  %27 = phi float [ %39, %25 ], [ %23, %20 ]
  %28 = phi i32 [ %41, %25 ], [ 0, %20 ]
  %29 = add nsw i32 %26, %14
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = mul nsw i32 %26, %3
  %34 = add nsw i32 %33, %12
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = fmul contract float %32, %37
  %39 = fadd contract float %27, %38
  %40 = add nuw nsw i32 %26, 1
  %41 = add i32 %28, 1
  %42 = icmp eq i32 %41, %16
  br i1 %42, label %43, label %25, !llvm.loop !10

43:                                               ; preds = %20, %25, %4
  %44 = phi float [ 0.000000e+00, %4 ], [ %21, %20 ], [ %39, %25 ]
  %45 = add nsw i32 %14, %12
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  store float %44, float addrspace(1)* %47, align 4, !tbaa !5
  ret void

48:                                               ; preds = %48, %18
  %49 = phi i32 [ 0, %18 ], [ %147, %48 ]
  %50 = phi float [ 0.000000e+00, %18 ], [ %146, %48 ]
  %51 = phi i32 [ 0, %18 ], [ %148, %48 ]
  %52 = add nsw i32 %49, %14
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = mul nsw i32 %49, %3
  %57 = add nsw i32 %56, %12
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = fmul contract float %55, %60
  %62 = fadd contract float %50, %61
  %63 = or i32 %49, 1
  %64 = add nsw i32 %63, %14
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = mul nsw i32 %63, %3
  %69 = add nsw i32 %68, %12
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = fmul contract float %67, %72
  %74 = fadd contract float %62, %73
  %75 = or i32 %49, 2
  %76 = add nsw i32 %75, %14
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = mul nsw i32 %75, %3
  %81 = add nsw i32 %80, %12
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5, !amdgpu.noclobber !9
  %85 = fmul contract float %79, %84
  %86 = fadd contract float %74, %85
  %87 = or i32 %49, 3
  %88 = add nsw i32 %87, %14
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = mul nsw i32 %87, %3
  %93 = add nsw i32 %92, %12
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = fmul contract float %91, %96
  %98 = fadd contract float %86, %97
  %99 = or i32 %49, 4
  %100 = add nsw i32 %99, %14
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = mul nsw i32 %99, %3
  %105 = add nsw i32 %104, %12
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  %109 = fmul contract float %103, %108
  %110 = fadd contract float %98, %109
  %111 = or i32 %49, 5
  %112 = add nsw i32 %111, %14
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5, !amdgpu.noclobber !9
  %116 = mul nsw i32 %111, %3
  %117 = add nsw i32 %116, %12
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5, !amdgpu.noclobber !9
  %121 = fmul contract float %115, %120
  %122 = fadd contract float %110, %121
  %123 = or i32 %49, 6
  %124 = add nsw i32 %123, %14
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = mul nsw i32 %123, %3
  %129 = add nsw i32 %128, %12
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5, !amdgpu.noclobber !9
  %133 = fmul contract float %127, %132
  %134 = fadd contract float %122, %133
  %135 = or i32 %49, 7
  %136 = add nsw i32 %135, %14
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !5, !amdgpu.noclobber !9
  %140 = mul nsw i32 %135, %3
  %141 = add nsw i32 %140, %12
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %1, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !5, !amdgpu.noclobber !9
  %145 = fmul contract float %139, %144
  %146 = fadd contract float %134, %145
  %147 = add nuw nsw i32 %49, 8
  %148 = add i32 %51, 8
  %149 = icmp eq i32 %148, %19
  br i1 %149, label %20, label %48, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
