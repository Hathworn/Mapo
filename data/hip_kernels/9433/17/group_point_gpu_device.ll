; ModuleID = '../data/hip_kernels/9433/17/main.cu'
source_filename = "../data/hip_kernels/9433/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15group_point_gpuiiiiiPKfPKiPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = mul i32 %9, %2
  %11 = mul i32 %10, %1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %5, i64 %12
  %14 = mul nsw i32 %4, %3
  %15 = mul nsw i32 %14, %9
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %16
  %18 = mul i32 %10, %14
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %7, i64 %19
  %21 = icmp sgt i32 %3, 0
  br i1 %21, label %22, label %33

22:                                               ; preds = %8
  %23 = icmp sgt i32 %4, 0
  %24 = icmp sgt i32 %2, 0
  %25 = and i32 %2, 7
  %26 = icmp ult i32 %2, 8
  %27 = and i32 %2, -8
  %28 = icmp eq i32 %25, 0
  br label %29

29:                                               ; preds = %22, %34
  %30 = phi i32 [ 0, %22 ], [ %35, %34 ]
  br i1 %23, label %31, label %34

31:                                               ; preds = %29
  %32 = mul nsw i32 %30, %4
  br label %37

33:                                               ; preds = %34, %8
  ret void

34:                                               ; preds = %61, %29
  %35 = add nuw nsw i32 %30, 1
  %36 = icmp eq i32 %35, %3
  br i1 %36, label %33, label %29, !llvm.loop !5

37:                                               ; preds = %31, %61
  %38 = phi i32 [ 0, %31 ], [ %62, %61 ]
  %39 = add nsw i32 %38, %32
  br i1 %24, label %40, label %61

40:                                               ; preds = %37
  %41 = sext i32 %39 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !11
  %44 = mul nsw i32 %43, %2
  %45 = mul i32 %39, %2
  br i1 %26, label %46, label %64

46:                                               ; preds = %64, %40
  %47 = phi i32 [ 0, %40 ], [ %130, %64 ]
  br i1 %28, label %61, label %48

48:                                               ; preds = %46, %48
  %49 = phi i32 [ %58, %48 ], [ %47, %46 ]
  %50 = phi i32 [ %59, %48 ], [ 0, %46 ]
  %51 = add nsw i32 %49, %44
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %13, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !12
  %55 = add nsw i32 %49, %45
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %20, i64 %56
  store float %54, float addrspace(1)* %57, align 4, !tbaa !12
  %58 = add nuw nsw i32 %49, 1
  %59 = add i32 %50, 1
  %60 = icmp eq i32 %59, %25
  br i1 %60, label %61, label %48, !llvm.loop !14

61:                                               ; preds = %46, %48, %37
  %62 = add nuw nsw i32 %38, 1
  %63 = icmp eq i32 %62, %4
  br i1 %63, label %34, label %37, !llvm.loop !16

64:                                               ; preds = %40, %64
  %65 = phi i32 [ %130, %64 ], [ 0, %40 ]
  %66 = phi i32 [ %131, %64 ], [ 0, %40 ]
  %67 = add nsw i32 %65, %44
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %13, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !12
  %71 = add nsw i32 %65, %45
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %20, i64 %72
  store float %70, float addrspace(1)* %73, align 4, !tbaa !12
  %74 = or i32 %65, 1
  %75 = add nsw i32 %74, %44
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %13, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !12
  %79 = add nsw i32 %74, %45
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %20, i64 %80
  store float %78, float addrspace(1)* %81, align 4, !tbaa !12
  %82 = or i32 %65, 2
  %83 = add nsw i32 %82, %44
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %13, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !12
  %87 = add nsw i32 %82, %45
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %20, i64 %88
  store float %86, float addrspace(1)* %89, align 4, !tbaa !12
  %90 = or i32 %65, 3
  %91 = add nsw i32 %90, %44
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %13, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !12
  %95 = add nsw i32 %90, %45
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %20, i64 %96
  store float %94, float addrspace(1)* %97, align 4, !tbaa !12
  %98 = or i32 %65, 4
  %99 = add nsw i32 %98, %44
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %13, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !12
  %103 = add nsw i32 %98, %45
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %20, i64 %104
  store float %102, float addrspace(1)* %105, align 4, !tbaa !12
  %106 = or i32 %65, 5
  %107 = add nsw i32 %106, %44
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %13, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !12
  %111 = add nsw i32 %106, %45
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %20, i64 %112
  store float %110, float addrspace(1)* %113, align 4, !tbaa !12
  %114 = or i32 %65, 6
  %115 = add nsw i32 %114, %44
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %13, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !12
  %119 = add nsw i32 %114, %45
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %20, i64 %120
  store float %118, float addrspace(1)* %121, align 4, !tbaa !12
  %122 = or i32 %65, 7
  %123 = add nsw i32 %122, %44
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %13, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !12
  %127 = add nsw i32 %122, %45
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %20, i64 %128
  store float %126, float addrspace(1)* %129, align 4, !tbaa !12
  %130 = add nuw nsw i32 %65, 8
  %131 = add i32 %66, 8
  %132 = icmp eq i32 %131, %27
  br i1 %132, label %46, label %64, !llvm.loop !17
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !9, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
