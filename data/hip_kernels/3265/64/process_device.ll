; ModuleID = '../data/hip_kernels/3265/64/main.cu'
source_filename = "../data/hip_kernels/3265/64/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7processiiPfS_E3ans = internal addrspace(3) global float undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7processiiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp slt i32 %5, %1
  br i1 %7, label %8, label %41

8:                                                ; preds = %4
  %9 = icmp eq i32 %6, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %8
  store float 0.000000e+00, float addrspace(3)* @_ZZ7processiiPfS_E3ans, align 4, !tbaa !5
  br label %11

11:                                               ; preds = %8, %10
  %12 = mul nsw i32 %5, 12288
  %13 = or i32 %12, %6
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %2, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp sgt i32 %0, 0
  br i1 %17, label %22, label %18

18:                                               ; preds = %38, %11
  %19 = load float, float addrspace(3)* @_ZZ7processiiPfS_E3ans, align 4, !tbaa !5
  %20 = sext i32 %5 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %3, i64 %20
  store float %19, float addrspace(1)* %21, align 4, !tbaa !5
  br label %41

22:                                               ; preds = %11, %38
  %23 = phi i32 [ %39, %38 ], [ 0, %11 ]
  %24 = urem i32 %23, 12288
  %25 = icmp uge i32 %6, %24
  %26 = add nuw nsw i32 %24, 12
  %27 = icmp ult i32 %6, %26
  %28 = select i1 %25, i1 %27, i1 false
  br i1 %28, label %29, label %31

29:                                               ; preds = %22
  %30 = atomicrmw fadd float addrspace(3)* @_ZZ7processiiPfS_E3ans, float %16 syncscope("agent-one-as") monotonic, align 4
  br label %31

31:                                               ; preds = %29, %22
  %32 = icmp ugt i32 %24, 12276
  %33 = add nsw i32 %24, -12276
  %34 = icmp slt i32 %6, %33
  %35 = select i1 %32, i1 %34, i1 false
  br i1 %35, label %36, label %38

36:                                               ; preds = %31
  %37 = atomicrmw fadd float addrspace(3)* @_ZZ7processiiPfS_E3ans, float %16 syncscope("agent-one-as") monotonic, align 4
  br label %38

38:                                               ; preds = %36, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = add nuw nsw i32 %23, 1
  %40 = icmp eq i32 %39, %0
  br i1 %40, label %18, label %22, !llvm.loop !10

41:                                               ; preds = %4, %18
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
