; ModuleID = '../data/hip_kernels/2007/1/main.cu'
source_filename = "../data/hip_kernels/2007/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11global_scanPfS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds float, float addrspace(1)* %1, i64 %4
  %6 = load float, float addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = getelementptr inbounds float, float addrspace(1)* %0, i64 %4
  store float %6, float addrspace(1)* %7, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %8 = icmp eq i32 %3, 0
  br i1 %8, label %16, label %9

9:                                                ; preds = %2
  %10 = add nsw i32 %3, -1
  %11 = load float, float addrspace(1)* %7, align 4, !tbaa !5
  %12 = zext i32 %10 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !5
  %15 = fadd contract float %11, %14
  br label %16

16:                                               ; preds = %9, %2
  %17 = phi float [ %15, %9 ], [ 0.000000e+00, %2 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %8, label %19, label %18

18:                                               ; preds = %16
  store float %17, float addrspace(1)* %7, align 4, !tbaa !5
  br label %19

19:                                               ; preds = %16, %18
  %20 = phi float [ 0.000000e+00, %18 ], [ %17, %16 ]
  %21 = icmp ugt i32 %3, 1
  br i1 %21, label %22, label %29

22:                                               ; preds = %19
  %23 = add nsw i32 %3, -2
  %24 = load float, float addrspace(1)* %7, align 4, !tbaa !5
  %25 = zext i32 %23 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5
  %28 = fadd contract float %24, %27
  br label %29

29:                                               ; preds = %22, %19
  %30 = phi float [ %28, %22 ], [ %20, %19 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %21, label %31, label %32

31:                                               ; preds = %29
  store float %30, float addrspace(1)* %7, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %31, %29
  %33 = phi float [ 0.000000e+00, %31 ], [ %30, %29 ]
  %34 = icmp ugt i32 %3, 3
  br i1 %34, label %35, label %42

35:                                               ; preds = %32
  %36 = add nsw i32 %3, -4
  %37 = load float, float addrspace(1)* %7, align 4, !tbaa !5
  %38 = zext i32 %36 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  %41 = fadd contract float %37, %40
  br label %42

42:                                               ; preds = %35, %32
  %43 = phi float [ %41, %35 ], [ %33, %32 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %44, label %45

44:                                               ; preds = %42
  store float %43, float addrspace(1)* %7, align 4, !tbaa !5
  br label %45

45:                                               ; preds = %44, %42
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
