; ModuleID = '../data/hip_kernels/3761/39/main.cu'
source_filename = "../data/hip_kernels/3761/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25prescan_large_unoptimizedPiS_iS_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = mul nsw i32 %5, %2
  %8 = shl nuw nsw i32 %6, 1
  %9 = add nsw i32 %7, %8
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %10
  %12 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %8
  store i32 %12, i32 addrspace(3)* %13, align 4, !tbaa !5
  %14 = add nsw i32 %9, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = add nuw nsw i32 %8, 1
  %19 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %18
  store i32 %17, i32 addrspace(3)* %19, align 4, !tbaa !5
  %20 = icmp sgt i32 %2, 1
  br i1 %20, label %21, label %23

21:                                               ; preds = %4
  %22 = add nuw nsw i32 %8, 2
  br label %26

23:                                               ; preds = %41, %4
  %24 = phi i32 [ 1, %4 ], [ %42, %41 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = icmp eq i32 %6, 0
  br i1 %25, label %44, label %50

26:                                               ; preds = %21, %41
  %27 = phi i32 [ %2, %21 ], [ %29, %41 ]
  %28 = phi i32 [ 1, %21 ], [ %42, %41 ]
  %29 = ashr i32 %27, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp slt i32 %6, %29
  br i1 %30, label %31, label %41

31:                                               ; preds = %26
  %32 = mul nsw i32 %28, %18
  %33 = add nsw i32 %32, -1
  %34 = mul nsw i32 %28, %22
  %35 = add nsw i32 %34, -1
  %36 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %33
  %37 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !5
  %38 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %35
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %40 = add nsw i32 %39, %37
  store i32 %40, i32 addrspace(3)* %38, align 4, !tbaa !5
  br label %41

41:                                               ; preds = %31, %26
  %42 = shl nsw i32 %28, 1
  %43 = icmp sgt i32 %27, 3
  br i1 %43, label %26, label %23, !llvm.loop !10

44:                                               ; preds = %23
  %45 = add nsw i32 %2, -1
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %48 = sext i32 %5 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %48
  store i32 %47, i32 addrspace(1)* %49, align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* %46, align 4, !tbaa !5
  br label %50

50:                                               ; preds = %44, %23
  br i1 %20, label %51, label %53

51:                                               ; preds = %50
  %52 = add nuw nsw i32 %8, 2
  br label %58

53:                                               ; preds = %74, %50
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = load i32, i32 addrspace(3)* %13, align 4, !tbaa !5
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %10
  store i32 %54, i32 addrspace(1)* %55, align 4, !tbaa !5
  %56 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !5
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  store i32 %56, i32 addrspace(1)* %57, align 4, !tbaa !5
  ret void

58:                                               ; preds = %51, %74
  %59 = phi i32 [ %24, %51 ], [ %61, %74 ]
  %60 = phi i32 [ 1, %51 ], [ %75, %74 ]
  %61 = lshr i32 %59, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = icmp slt i32 %6, %60
  br i1 %62, label %63, label %74

63:                                               ; preds = %58
  %64 = mul nsw i32 %61, %18
  %65 = add nsw i32 %64, -1
  %66 = mul nsw i32 %61, %52
  %67 = add nsw i32 %66, -1
  %68 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %65
  %69 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !5
  %70 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %67
  %71 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !5
  store i32 %71, i32 addrspace(3)* %68, align 4, !tbaa !5
  %72 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !5
  %73 = add nsw i32 %72, %69
  store i32 %73, i32 addrspace(3)* %70, align 4, !tbaa !5
  br label %74

74:                                               ; preds = %58, %63
  %75 = shl nsw i32 %60, 1
  %76 = icmp slt i32 %75, %2
  br i1 %76, label %58, label %53, !llvm.loop !12
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
