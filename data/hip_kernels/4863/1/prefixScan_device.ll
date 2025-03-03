; ModuleID = '../data/hip_kernels/4863/1/main.cu'
source_filename = "../data/hip_kernels/4863/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sharedpartitions = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10prefixScanPiS_ix(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = shl nuw nsw i32 %5, 1
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %7
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedpartitions, i32 0, i32 %6
  store i32 %9, i32 addrspace(3)* %10, align 4, !tbaa !5
  %11 = add nuw nsw i32 %6, 1
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedpartitions, i32 0, i32 %11
  store i32 %14, i32 addrspace(3)* %15, align 4, !tbaa !5
  %16 = icmp sgt i32 %2, 1
  br i1 %16, label %17, label %19

17:                                               ; preds = %4
  %18 = add nuw nsw i32 %6, 2
  br label %22

19:                                               ; preds = %37, %4
  %20 = phi i32 [ 1, %4 ], [ %38, %37 ]
  %21 = icmp eq i32 %5, 0
  br i1 %21, label %40, label %43

22:                                               ; preds = %17, %37
  %23 = phi i32 [ %2, %17 ], [ %25, %37 ]
  %24 = phi i32 [ 1, %17 ], [ %38, %37 ]
  %25 = ashr i32 %23, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = icmp slt i32 %5, %25
  br i1 %26, label %27, label %37

27:                                               ; preds = %22
  %28 = mul nsw i32 %24, %11
  %29 = add nsw i32 %28, -1
  %30 = mul nsw i32 %24, %18
  %31 = add nsw i32 %30, -1
  %32 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedpartitions, i32 0, i32 %29
  %33 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %34 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedpartitions, i32 0, i32 %31
  %35 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !5
  %36 = add nsw i32 %35, %33
  store i32 %36, i32 addrspace(3)* %34, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %27, %22
  %38 = shl nsw i32 %24, 1
  %39 = icmp sgt i32 %23, 3
  br i1 %39, label %22, label %19, !llvm.loop !10

40:                                               ; preds = %19
  %41 = add nsw i32 %2, -1
  %42 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedpartitions, i32 0, i32 %41
  store i32 0, i32 addrspace(3)* %42, align 4, !tbaa !5
  br label %43

43:                                               ; preds = %40, %19
  br i1 %16, label %44, label %46

44:                                               ; preds = %43
  %45 = add nuw nsw i32 %6, 2
  br label %51

46:                                               ; preds = %67, %43
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %7
  store i32 %47, i32 addrspace(1)* %48, align 4, !tbaa !5
  %49 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !5
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  store i32 %49, i32 addrspace(1)* %50, align 4, !tbaa !5
  ret void

51:                                               ; preds = %44, %67
  %52 = phi i32 [ %20, %44 ], [ %54, %67 ]
  %53 = phi i32 [ 1, %44 ], [ %68, %67 ]
  %54 = lshr i32 %52, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = icmp slt i32 %5, %53
  br i1 %55, label %56, label %67

56:                                               ; preds = %51
  %57 = mul nsw i32 %54, %11
  %58 = add nsw i32 %57, -1
  %59 = mul nsw i32 %54, %45
  %60 = add nsw i32 %59, -1
  %61 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedpartitions, i32 0, i32 %58
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %63 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedpartitions, i32 0, i32 %60
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !5
  store i32 %64, i32 addrspace(3)* %61, align 4, !tbaa !5
  %65 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !5
  %66 = add nsw i32 %65, %62
  store i32 %66, i32 addrspace(3)* %63, align 4, !tbaa !5
  br label %67

67:                                               ; preds = %51, %56
  %68 = shl nsw i32 %53, 1
  %69 = icmp slt i32 %68, %2
  br i1 %69, label %51, label %46, !llvm.loop !12
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
