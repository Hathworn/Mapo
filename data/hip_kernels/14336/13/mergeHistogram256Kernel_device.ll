; ModuleID = '../data/hip_kernels/14336/13/main.cu'
source_filename = "../data/hip_kernels/14336/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23mergeHistogram256KernelPjS_jE4data = internal unnamed_addr addrspace(3) global [128 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23mergeHistogram256KernelPjS_j(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp ult i32 %4, %2
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br label %12

8:                                                ; preds = %12, %3
  %9 = phi i32 [ 0, %3 ], [ %20, %12 ]
  %10 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPjS_jE4data, i32 0, i32 %4
  store i32 %9, i32 addrspace(3)* %10, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %11 = icmp ult i32 %4, 64
  br i1 %11, label %23, label %29

12:                                               ; preds = %6, %12
  %13 = phi i32 [ %4, %6 ], [ %21, %12 ]
  %14 = phi i32 [ 0, %6 ], [ %20, %12 ]
  %15 = shl i32 %13, 8
  %16 = add i32 %15, %7
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = add i32 %19, %14
  %21 = add i32 %13, 128
  %22 = icmp ult i32 %21, %2
  br i1 %22, label %12, label %8, !llvm.loop !10

23:                                               ; preds = %8
  %24 = add nuw nsw i32 %4, 64
  %25 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPjS_jE4data, i32 0, i32 %24
  %26 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !5
  %27 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %28 = add i32 %27, %26
  store i32 %28, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %29

29:                                               ; preds = %8, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp ult i32 %4, 32
  br i1 %30, label %31, label %37

31:                                               ; preds = %29
  %32 = add nuw nsw i32 %4, 32
  %33 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPjS_jE4data, i32 0, i32 %32
  %34 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !5
  %35 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %36 = add i32 %35, %34
  store i32 %36, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %31, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp ult i32 %4, 16
  br i1 %38, label %39, label %45

39:                                               ; preds = %37
  %40 = add nuw nsw i32 %4, 16
  %41 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPjS_jE4data, i32 0, i32 %40
  %42 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %43 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %44 = add i32 %43, %42
  store i32 %44, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %45

45:                                               ; preds = %39, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp ult i32 %4, 8
  br i1 %46, label %47, label %53

47:                                               ; preds = %45
  %48 = add nuw nsw i32 %4, 8
  %49 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPjS_jE4data, i32 0, i32 %48
  %50 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %51 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %52 = add i32 %51, %50
  store i32 %52, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %53

53:                                               ; preds = %47, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp ult i32 %4, 4
  br i1 %54, label %55, label %61

55:                                               ; preds = %53
  %56 = add nuw nsw i32 %4, 4
  %57 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPjS_jE4data, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !5
  %59 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %60 = add i32 %59, %58
  store i32 %60, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %61

61:                                               ; preds = %55, %53
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = icmp ult i32 %4, 2
  br i1 %62, label %63, label %69

63:                                               ; preds = %61
  %64 = add nuw nsw i32 %4, 2
  %65 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPjS_jE4data, i32 0, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !5
  %67 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %68 = add i32 %67, %66
  store i32 %68, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %69

69:                                               ; preds = %63, %61
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = icmp eq i32 %4, 0
  br i1 %70, label %71, label %81

71:                                               ; preds = %69
  %72 = add nuw nsw i32 %4, 1
  %73 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPjS_jE4data, i32 0, i32 %72
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !5
  %75 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %76 = add i32 %75, %74
  store i32 %76, i32 addrspace(3)* %10, align 4, !tbaa !5
  %77 = load i32, i32 addrspace(3)* getelementptr inbounds ([128 x i32], [128 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPjS_jE4data, i32 0, i32 0), align 16, !tbaa !5
  %78 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  store i32 %77, i32 addrspace(1)* %80, align 4, !tbaa !5
  br label %81

81:                                               ; preds = %69, %71
  ret void
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
