; ModuleID = '../data/hip_kernels/13464/5/main.cu'
source_filename = "../data/hip_kernels/13464/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9addKernelPiPKiS1_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %5
  %7 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !5, !amdgpu.noclobber !9
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %5
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = add nsw i32 %9, %7
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %5
  store i32 %10, i32 addrspace(1)* %11, align 4, !tbaa !5
  br label %13

12:                                               ; preds = %13
  ret void

13:                                               ; preds = %13, %3
  %14 = phi i64 [ 0, %3 ], [ %104, %13 ]
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %17 = mul nsw i32 %16, 10
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %14
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5
  %20 = mul nsw i32 %19, 5
  %21 = add nsw i32 %20, %17
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  store i32 %21, i32 addrspace(1)* %22, align 4, !tbaa !5
  %23 = or i64 %14, 1
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !5
  %26 = mul nsw i32 %25, 10
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %23
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !5
  %29 = mul nsw i32 %28, 5
  %30 = add nsw i32 %29, %26
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  store i32 %30, i32 addrspace(1)* %31, align 4, !tbaa !5
  %32 = add nuw nsw i64 %14, 2
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5
  %35 = mul nsw i32 %34, 10
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5
  %38 = mul nsw i32 %37, 5
  %39 = add nsw i32 %38, %35
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  store i32 %39, i32 addrspace(1)* %40, align 4, !tbaa !5
  %41 = add nuw nsw i64 %14, 3
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !5
  %44 = mul nsw i32 %43, 10
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %41
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !5
  %47 = mul nsw i32 %46, 5
  %48 = add nsw i32 %47, %44
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  store i32 %48, i32 addrspace(1)* %49, align 4, !tbaa !5
  %50 = add nuw nsw i64 %14, 4
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !5
  %53 = mul nsw i32 %52, 10
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %50
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5
  %56 = mul nsw i32 %55, 5
  %57 = add nsw i32 %56, %53
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  store i32 %57, i32 addrspace(1)* %58, align 4, !tbaa !5
  %59 = add nuw nsw i64 %14, 5
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !5
  %62 = mul nsw i32 %61, 10
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %59
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !5
  %65 = mul nsw i32 %64, 5
  %66 = add nsw i32 %65, %62
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  store i32 %66, i32 addrspace(1)* %67, align 4, !tbaa !5
  %68 = add nuw nsw i64 %14, 6
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !5
  %71 = mul nsw i32 %70, 10
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %68
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !5
  %74 = mul nsw i32 %73, 5
  %75 = add nsw i32 %74, %71
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  store i32 %75, i32 addrspace(1)* %76, align 4, !tbaa !5
  %77 = add nuw nsw i64 %14, 7
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !5
  %80 = mul nsw i32 %79, 10
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %77
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !5
  %83 = mul nsw i32 %82, 5
  %84 = add nsw i32 %83, %80
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  store i32 %84, i32 addrspace(1)* %85, align 4, !tbaa !5
  %86 = add nuw nsw i64 %14, 8
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !5
  %89 = mul nsw i32 %88, 10
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %86
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !5
  %92 = mul nsw i32 %91, 5
  %93 = add nsw i32 %92, %89
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  store i32 %93, i32 addrspace(1)* %94, align 4, !tbaa !5
  %95 = add nuw nsw i64 %14, 9
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !5
  %98 = mul nsw i32 %97, 10
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %95
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !5
  %101 = mul nsw i32 %100, 5
  %102 = add nsw i32 %101, %98
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  store i32 %102, i32 addrspace(1)* %103, align 4, !tbaa !5
  %104 = add nuw nsw i64 %14, 10
  %105 = icmp eq i64 %104, 512000
  br i1 %105, label %12, label %13, !llvm.loop !10
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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
