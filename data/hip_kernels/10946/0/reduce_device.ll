; ModuleID = '../data/hip_kernels/10946/0/main.cu'
source_filename = "../data/hip_kernels/10946/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL6reducePiii = comdat any

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL6reducePiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 comdat {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp ult i32 %4, %1
  br i1 %5, label %6, label %10

6:                                                ; preds = %3
  %7 = zext i32 %4 to i64
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %7
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %10

10:                                               ; preds = %3, %6
  %11 = phi i32 [ %9, %6 ], [ 0, %3 ]
  %12 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %4
  store i32 %11, i32 addrspace(3)* %12, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = add i32 %2, 1
  %14 = icmp ult i32 %13, 3
  br i1 %14, label %17, label %15

15:                                               ; preds = %10
  %16 = sdiv i32 %2, 2
  br label %19

17:                                               ; preds = %28, %10
  %18 = icmp eq i32 %4, 0
  br i1 %18, label %31, label %33

19:                                               ; preds = %15, %28
  %20 = phi i32 [ %16, %15 ], [ %29, %28 ]
  %21 = icmp ult i32 %4, %20
  br i1 %21, label %22, label %28

22:                                               ; preds = %19
  %23 = add i32 %20, %4
  %24 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %23
  %25 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %26 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !5
  %27 = add i32 %26, %25
  store i32 %27, i32 addrspace(3)* %12, align 4, !tbaa !5
  br label %28

28:                                               ; preds = %22, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = lshr i32 %20, 1
  %30 = icmp ult i32 %20, 2
  br i1 %30, label %17, label %19, !llvm.loop !10

31:                                               ; preds = %17
  %32 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !5
  store i32 %32, i32 addrspace(1)* %0, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %31, %17
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
