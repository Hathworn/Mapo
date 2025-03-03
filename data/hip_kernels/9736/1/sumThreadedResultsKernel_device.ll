; ModuleID = '../data/hip_kernels/9736/1/main.cu'
source_filename = "../data/hip_kernels/9736/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24sumThreadedResultsKernelPlPiii(i64 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp sgt i32 %3, 0
  br i1 %6, label %7, label %36

7:                                                ; preds = %4
  %8 = zext i32 %5 to i64
  %9 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %8
  %10 = load i64, i64 addrspace(1)* %9, align 8, !tbaa !5
  %11 = and i32 %3, 7
  %12 = icmp ult i32 %3, 8
  br i1 %12, label %15, label %13

13:                                               ; preds = %7
  %14 = and i32 %3, -8
  br label %37

15:                                               ; preds = %37, %7
  %16 = phi i64 [ undef, %7 ], [ %103, %37 ]
  %17 = phi i64 [ %10, %7 ], [ %103, %37 ]
  %18 = phi i32 [ 0, %7 ], [ %104, %37 ]
  %19 = icmp eq i32 %11, 0
  br i1 %19, label %34, label %20

20:                                               ; preds = %15, %20
  %21 = phi i64 [ %30, %20 ], [ %17, %15 ]
  %22 = phi i32 [ %31, %20 ], [ %18, %15 ]
  %23 = phi i32 [ %32, %20 ], [ 0, %15 ]
  %24 = mul nsw i32 %22, %2
  %25 = add nsw i32 %24, %5
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !9, !amdgpu.noclobber !11
  %29 = sext i32 %28 to i64
  %30 = add nsw i64 %21, %29
  %31 = add nuw nsw i32 %22, 1
  %32 = add i32 %23, 1
  %33 = icmp eq i32 %32, %11
  br i1 %33, label %34, label %20, !llvm.loop !12

34:                                               ; preds = %20, %15
  %35 = phi i64 [ %16, %15 ], [ %30, %20 ]
  store i64 %35, i64 addrspace(1)* %9, align 8, !tbaa !5
  br label %36

36:                                               ; preds = %34, %4
  ret void

37:                                               ; preds = %37, %13
  %38 = phi i64 [ %10, %13 ], [ %103, %37 ]
  %39 = phi i32 [ 0, %13 ], [ %104, %37 ]
  %40 = phi i32 [ 0, %13 ], [ %105, %37 ]
  %41 = mul nsw i32 %39, %2
  %42 = add nsw i32 %41, %5
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !9, !amdgpu.noclobber !11
  %46 = sext i32 %45 to i64
  %47 = add nsw i64 %38, %46
  %48 = or i32 %39, 1
  %49 = mul nsw i32 %48, %2
  %50 = add nsw i32 %49, %5
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !9, !amdgpu.noclobber !11
  %54 = sext i32 %53 to i64
  %55 = add nsw i64 %47, %54
  %56 = or i32 %39, 2
  %57 = mul nsw i32 %56, %2
  %58 = add nsw i32 %57, %5
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !9, !amdgpu.noclobber !11
  %62 = sext i32 %61 to i64
  %63 = add nsw i64 %55, %62
  %64 = or i32 %39, 3
  %65 = mul nsw i32 %64, %2
  %66 = add nsw i32 %65, %5
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !9, !amdgpu.noclobber !11
  %70 = sext i32 %69 to i64
  %71 = add nsw i64 %63, %70
  %72 = or i32 %39, 4
  %73 = mul nsw i32 %72, %2
  %74 = add nsw i32 %73, %5
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !9, !amdgpu.noclobber !11
  %78 = sext i32 %77 to i64
  %79 = add nsw i64 %71, %78
  %80 = or i32 %39, 5
  %81 = mul nsw i32 %80, %2
  %82 = add nsw i32 %81, %5
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !9, !amdgpu.noclobber !11
  %86 = sext i32 %85 to i64
  %87 = add nsw i64 %79, %86
  %88 = or i32 %39, 6
  %89 = mul nsw i32 %88, %2
  %90 = add nsw i32 %89, %5
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !9, !amdgpu.noclobber !11
  %94 = sext i32 %93 to i64
  %95 = add nsw i64 %87, %94
  %96 = or i32 %39, 7
  %97 = mul nsw i32 %96, %2
  %98 = add nsw i32 %97, %5
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !9, !amdgpu.noclobber !11
  %102 = sext i32 %101 to i64
  %103 = add nsw i64 %95, %102
  %104 = add nuw nsw i32 %39, 8
  %105 = add i32 %40, 8
  %106 = icmp eq i32 %105, %14
  br i1 %106, label %15, label %37, !llvm.loop !14
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
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
