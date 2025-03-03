; ModuleID = '../data/hip_kernels/142/6/main.cu'
source_filename = "../data/hip_kernels/142/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19scanKernelInclusivePiPKimm(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = sub i64 %6, %3
  %8 = icmp uge i64 %7, %2
  %9 = icmp ult i64 %6, %3
  %10 = or i1 %9, %8
  br i1 %10, label %39, label %11

11:                                               ; preds = %4
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %6
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %6
  store i32 %13, i32 addrspace(1)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %15

15:                                               ; preds = %22, %11
  %16 = phi i32 [ 1, %11 ], [ %30, %22 ]
  %17 = phi i64 [ %2, %11 ], [ %29, %22 ]
  %18 = icmp eq i64 %17, 0
  %19 = zext i32 %16 to i64
  %20 = icmp ult i64 %7, %19
  %21 = select i1 %18, i1 true, i1 %20
  br i1 %21, label %31, label %22

22:                                               ; preds = %15
  %23 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !5
  %24 = sub i32 %5, %16
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = add nsw i32 %27, %23
  store i32 %28, i32 addrspace(1)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = lshr i64 %17, 1
  %30 = shl i32 %16, 1
  br label %15

31:                                               ; preds = %15
  %32 = icmp eq i64 %3, 0
  br i1 %32, label %39, label %33

33:                                               ; preds = %31
  %34 = add i64 %3, -1
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !5
  %37 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !5
  %38 = add nsw i32 %37, %36
  store i32 %38, i32 addrspace(1)* %14, align 4, !tbaa !5
  br label %39

39:                                               ; preds = %31, %33, %4
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
