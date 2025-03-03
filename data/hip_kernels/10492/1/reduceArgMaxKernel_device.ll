; ModuleID = '../data/hip_kernels/10492/1/main.cu'
source_filename = "../data/hip_kernels/10492/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18reduceArgMaxKernelPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %6, %4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = mul nsw i32 %9, %3
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = icmp sgt i32 %3, 1
  br i1 %14, label %15, label %48

15:                                               ; preds = %5
  %16 = add i32 %3, -1
  %17 = add i32 %3, -2
  %18 = and i32 %16, 7
  %19 = icmp ult i32 %17, 7
  br i1 %19, label %22, label %20

20:                                               ; preds = %15
  %21 = and i32 %16, -8
  br label %54

22:                                               ; preds = %54, %15
  %23 = phi float [ undef, %15 ], [ %120, %54 ]
  %24 = phi i32 [ undef, %15 ], [ %121, %54 ]
  %25 = phi i32 [ 1, %15 ], [ %122, %54 ]
  %26 = phi i32 [ 0, %15 ], [ %121, %54 ]
  %27 = phi float [ %13, %15 ], [ %120, %54 ]
  %28 = icmp eq i32 %18, 0
  br i1 %28, label %44, label %29

29:                                               ; preds = %22, %29
  %30 = phi i32 [ %41, %29 ], [ %25, %22 ]
  %31 = phi i32 [ %40, %29 ], [ %26, %22 ]
  %32 = phi float [ %39, %29 ], [ %27, %22 ]
  %33 = phi i32 [ %42, %29 ], [ 0, %22 ]
  %34 = add nsw i32 %30, %10
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = fcmp contract ogt float %37, %32
  %39 = select i1 %38, float %37, float %32
  %40 = select i1 %38, i32 %30, i32 %31
  %41 = add nuw nsw i32 %30, 1
  %42 = add i32 %33, 1
  %43 = icmp eq i32 %42, %18
  br i1 %43, label %44, label %29, !llvm.loop !10

44:                                               ; preds = %29, %22
  %45 = phi float [ %23, %22 ], [ %39, %29 ]
  %46 = phi i32 [ %24, %22 ], [ %40, %29 ]
  %47 = sitofp i32 %46 to float
  br label %48

48:                                               ; preds = %44, %5
  %49 = phi float [ %13, %5 ], [ %45, %44 ]
  %50 = phi float [ 0.000000e+00, %5 ], [ %47, %44 ]
  %51 = sext i32 %9 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  store float %49, float addrspace(1)* %52, align 4, !tbaa !5
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  store float %50, float addrspace(1)* %53, align 4, !tbaa !5
  ret void

54:                                               ; preds = %54, %20
  %55 = phi i32 [ 1, %20 ], [ %122, %54 ]
  %56 = phi i32 [ 0, %20 ], [ %121, %54 ]
  %57 = phi float [ %13, %20 ], [ %120, %54 ]
  %58 = phi i32 [ 0, %20 ], [ %123, %54 ]
  %59 = add nsw i32 %55, %10
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = fcmp contract ogt float %62, %57
  %64 = select i1 %63, float %62, float %57
  %65 = select i1 %63, i32 %55, i32 %56
  %66 = add nuw nsw i32 %55, 1
  %67 = add nsw i32 %66, %10
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  %71 = fcmp contract ogt float %70, %64
  %72 = select i1 %71, float %70, float %64
  %73 = select i1 %71, i32 %66, i32 %65
  %74 = add nuw nsw i32 %55, 2
  %75 = add nsw i32 %74, %10
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  %79 = fcmp contract ogt float %78, %72
  %80 = select i1 %79, float %78, float %72
  %81 = select i1 %79, i32 %74, i32 %73
  %82 = add nuw nsw i32 %55, 3
  %83 = add nsw i32 %82, %10
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  %87 = fcmp contract ogt float %86, %80
  %88 = select i1 %87, float %86, float %80
  %89 = select i1 %87, i32 %82, i32 %81
  %90 = add nuw nsw i32 %55, 4
  %91 = add nsw i32 %90, %10
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  %95 = fcmp contract ogt float %94, %88
  %96 = select i1 %95, float %94, float %88
  %97 = select i1 %95, i32 %90, i32 %89
  %98 = add nuw nsw i32 %55, 5
  %99 = add nsw i32 %98, %10
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = fcmp contract ogt float %102, %96
  %104 = select i1 %103, float %102, float %96
  %105 = select i1 %103, i32 %98, i32 %97
  %106 = add nuw nsw i32 %55, 6
  %107 = add nsw i32 %106, %10
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = fcmp contract ogt float %110, %104
  %112 = select i1 %111, float %110, float %104
  %113 = select i1 %111, i32 %106, i32 %105
  %114 = add nuw nsw i32 %55, 7
  %115 = add nsw i32 %114, %10
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5, !amdgpu.noclobber !9
  %119 = fcmp contract ogt float %118, %112
  %120 = select i1 %119, float %118, float %112
  %121 = select i1 %119, i32 %114, i32 %113
  %122 = add nuw nsw i32 %55, 8
  %123 = add i32 %58, 8
  %124 = icmp eq i32 %123, %21
  br i1 %124, label %22, label %54, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
