; ModuleID = '../data/hip_kernels/14295/2/main.cu'
source_filename = "../data/hip_kernels/14295/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11partialScanPjS_S_mE4temp = internal unnamed_addr addrspace(3) global [4 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11partialScanPjS_S_m(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl nsw i32 %6, 2
  %8 = add nsw i32 %7, %5
  %9 = sext i32 %8 to i64
  %10 = icmp ult i64 %9, %3
  br i1 %10, label %11, label %14

11:                                               ; preds = %4
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %9
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %14

14:                                               ; preds = %4, %11
  %15 = phi i32 [ %13, %11 ], [ 0, %4 ]
  %16 = getelementptr inbounds [4 x i32], [4 x i32] addrspace(3)* @_ZZ11partialScanPjS_S_mE4temp, i32 0, i32 %5
  store i32 %15, i32 addrspace(3)* %16, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp ult i32 %5, 3
  br i1 %17, label %18, label %24

18:                                               ; preds = %14
  %19 = add nuw nsw i32 %5, 1
  %20 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !5
  %21 = getelementptr inbounds [4 x i32], [4 x i32] addrspace(3)* @_ZZ11partialScanPjS_S_mE4temp, i32 0, i32 %19
  %22 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !5
  %23 = add i32 %22, %20
  store i32 %23, i32 addrspace(3)* %21, align 4, !tbaa !5
  br label %24

24:                                               ; preds = %18, %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = icmp ult i32 %5, 2
  br i1 %25, label %26, label %32

26:                                               ; preds = %24
  %27 = add nuw nsw i32 %5, 2
  %28 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !5
  %29 = getelementptr inbounds [4 x i32], [4 x i32] addrspace(3)* @_ZZ11partialScanPjS_S_mE4temp, i32 0, i32 %27
  %30 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %31 = add i32 %30, %28
  store i32 %31, i32 addrspace(3)* %29, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %26, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp ult i32 %5, 3
  br i1 %33, label %34, label %41

34:                                               ; preds = %32
  %35 = add nsw i32 %8, 1
  %36 = sext i32 %35 to i64
  %37 = icmp ult i64 %36, %3
  br i1 %37, label %38, label %41

38:                                               ; preds = %34
  %39 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !5
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  store i32 %39, i32 addrspace(1)* %40, align 4, !tbaa !5
  br label %41

41:                                               ; preds = %38, %34, %32
  store i32 0, i32 addrspace(1)* %1, align 4, !tbaa !5
  %42 = load i32, i32 addrspace(3)* getelementptr inbounds ([4 x i32], [4 x i32] addrspace(3)* @_ZZ11partialScanPjS_S_mE4temp, i32 0, i32 3), align 4, !tbaa !5
  %43 = sext i32 %6 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  store i32 %42, i32 addrspace(1)* %44, align 4, !tbaa !5
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
