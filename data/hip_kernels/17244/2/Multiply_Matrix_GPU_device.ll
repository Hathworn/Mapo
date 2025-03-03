; ModuleID = '../data/hip_kernels/17244/2/main.cu'
source_filename = "../data/hip_kernels/17244/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19Multiply_Matrix_GPUPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = mul i32 %7, %3
  %11 = mul i32 %10, %4
  %12 = mul nsw i32 %9, %4
  %13 = add nsw i32 %11, %12
  %14 = mul nsw i32 %6, %3
  %15 = add i32 %14, %8
  %16 = icmp sgt i32 %4, 0
  br i1 %16, label %17, label %45

17:                                               ; preds = %5
  %18 = and i32 %4, 7
  %19 = icmp ult i32 %4, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = and i32 %4, -8
  br label %51

22:                                               ; preds = %51, %17
  %23 = phi float [ undef, %17 ], [ %149, %51 ]
  %24 = phi float [ 0.000000e+00, %17 ], [ %149, %51 ]
  %25 = phi i32 [ 0, %17 ], [ %150, %51 ]
  %26 = icmp eq i32 %18, 0
  br i1 %26, label %45, label %27

27:                                               ; preds = %22, %27
  %28 = phi float [ %41, %27 ], [ %24, %22 ]
  %29 = phi i32 [ %42, %27 ], [ %25, %22 ]
  %30 = phi i32 [ %43, %27 ], [ 0, %22 ]
  %31 = add nsw i32 %13, %29
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = mul nsw i32 %29, %4
  %36 = add nsw i32 %15, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = fmul contract float %34, %39
  %41 = fadd contract float %28, %40
  %42 = add nuw nsw i32 %29, 1
  %43 = add i32 %30, 1
  %44 = icmp eq i32 %43, %18
  br i1 %44, label %45, label %27, !llvm.loop !10

45:                                               ; preds = %22, %27, %5
  %46 = phi float [ 0.000000e+00, %5 ], [ %23, %22 ], [ %41, %27 ]
  %47 = add i32 %15, %12
  %48 = add i32 %47, %11
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  store float %46, float addrspace(1)* %50, align 4, !tbaa !5
  ret void

51:                                               ; preds = %51, %20
  %52 = phi float [ 0.000000e+00, %20 ], [ %149, %51 ]
  %53 = phi i32 [ 0, %20 ], [ %150, %51 ]
  %54 = phi i32 [ 0, %20 ], [ %151, %51 ]
  %55 = add nsw i32 %13, %53
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = mul nsw i32 %53, %4
  %60 = add nsw i32 %15, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fmul contract float %58, %63
  %65 = fadd contract float %52, %64
  %66 = or i32 %53, 1
  %67 = add nsw i32 %13, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  %71 = mul nsw i32 %66, %4
  %72 = add nsw i32 %15, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = fmul contract float %70, %75
  %77 = fadd contract float %65, %76
  %78 = or i32 %53, 2
  %79 = add nsw i32 %13, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = mul nsw i32 %78, %4
  %84 = add nsw i32 %15, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  %88 = fmul contract float %82, %87
  %89 = fadd contract float %77, %88
  %90 = or i32 %53, 3
  %91 = add nsw i32 %13, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  %95 = mul nsw i32 %90, %4
  %96 = add nsw i32 %15, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5, !amdgpu.noclobber !9
  %100 = fmul contract float %94, %99
  %101 = fadd contract float %89, %100
  %102 = or i32 %53, 4
  %103 = add nsw i32 %13, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  %107 = mul nsw i32 %102, %4
  %108 = add nsw i32 %15, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !5, !amdgpu.noclobber !9
  %112 = fmul contract float %106, %111
  %113 = fadd contract float %101, %112
  %114 = or i32 %53, 5
  %115 = add nsw i32 %13, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5, !amdgpu.noclobber !9
  %119 = mul nsw i32 %114, %4
  %120 = add nsw i32 %15, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  %124 = fmul contract float %118, %123
  %125 = fadd contract float %113, %124
  %126 = or i32 %53, 6
  %127 = add nsw i32 %13, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !5, !amdgpu.noclobber !9
  %131 = mul nsw i32 %126, %4
  %132 = add nsw i32 %15, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5, !amdgpu.noclobber !9
  %136 = fmul contract float %130, %135
  %137 = fadd contract float %125, %136
  %138 = or i32 %53, 7
  %139 = add nsw i32 %13, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !5, !amdgpu.noclobber !9
  %143 = mul nsw i32 %138, %4
  %144 = add nsw i32 %15, %143
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !5, !amdgpu.noclobber !9
  %148 = fmul contract float %142, %147
  %149 = fadd contract float %137, %148
  %150 = add nuw nsw i32 %53, 8
  %151 = add i32 %54, 8
  %152 = icmp eq i32 %151, %21
  br i1 %152, label %22, label %51, !llvm.loop !12
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
