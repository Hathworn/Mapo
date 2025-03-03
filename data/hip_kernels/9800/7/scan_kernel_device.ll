; ModuleID = '../data/hip_kernels/9800/7/main.cu'
source_filename = "../data/hip_kernels/9800/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11scan_kernelPjjE13shared_output = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11scan_kernelPjj(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = icmp uge i32 %3, %1
  %5 = icmp eq i32 %3, 0
  %6 = or i1 %5, %4
  br i1 %6, label %12, label %7

7:                                                ; preds = %2
  %8 = add nsw i32 %3, -1
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %9
  %11 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %12

12:                                               ; preds = %2, %7
  %13 = phi i32 [ %11, %7 ], [ 0, %2 ]
  %14 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11scan_kernelPjjE13shared_output, i32 0, i32 %3
  store i32 %13, i32 addrspace(3)* %14, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %15 = icmp ugt i32 %1, 1
  br i1 %15, label %17, label %16

16:                                               ; preds = %24, %12
  br i1 %4, label %34, label %30

17:                                               ; preds = %12, %24
  %18 = phi i32 [ %28, %24 ], [ 1, %12 ]
  %19 = icmp ult i32 %3, %18
  br i1 %19, label %24, label %20

20:                                               ; preds = %17
  %21 = sub i32 %3, %18
  %22 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11scan_kernelPjjE13shared_output, i32 0, i32 %21
  %23 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !5
  br label %24

24:                                               ; preds = %20, %17
  %25 = phi i32 [ %23, %20 ], [ 0, %17 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = load i32, i32 addrspace(3)* %14, align 4, !tbaa !5
  %27 = add i32 %26, %25
  store i32 %27, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = shl i32 %18, 1
  %29 = icmp ult i32 %28, %1
  br i1 %29, label %17, label %16, !llvm.loop !10

30:                                               ; preds = %16
  %31 = load i32, i32 addrspace(3)* %14, align 4, !tbaa !5
  %32 = zext i32 %3 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  store i32 %31, i32 addrspace(1)* %33, align 4, !tbaa !5
  br label %34

34:                                               ; preds = %30, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
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
