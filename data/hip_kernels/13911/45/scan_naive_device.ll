; ModuleID = '../data/hip_kernels/13911/45/main.cu'
source_filename = "../data/hip_kernels/13911/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10scan_naivePfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %11, label %6

6:                                                ; preds = %3
  %7 = add nsw i32 %4, -1
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %1, i64 %8
  %10 = load float, float addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %11

11:                                               ; preds = %3, %6
  %12 = phi contract float [ %10, %6 ], [ 0.000000e+00, %3 ]
  %13 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %4
  store float %12, float addrspace(3)* %13, align 4, !tbaa !5
  %14 = icmp sgt i32 %2, 1
  br i1 %14, label %23, label %15

15:                                               ; preds = %40, %11
  %16 = phi i32 [ 0, %11 ], [ %26, %40 ]
  %17 = zext i32 %4 to i64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = mul nsw i32 %16, %2
  %19 = add nsw i32 %18, %4
  %20 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %19
  %21 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  store float %21, float addrspace(1)* %22, align 4, !tbaa !5
  ret void

23:                                               ; preds = %11, %40
  %24 = phi i32 [ %41, %40 ], [ 1, %11 ]
  %25 = phi i32 [ %26, %40 ], [ 0, %11 ]
  %26 = sub nsw i32 1, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = mul nsw i32 %25, %2
  %28 = add nsw i32 %27, %4
  %29 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %28
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %31 = mul nsw i32 %26, %2
  %32 = add nsw i32 %31, %4
  %33 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %32
  store float %30, float addrspace(3)* %33, align 4, !tbaa !5
  %34 = icmp slt i32 %4, %24
  br i1 %34, label %40, label %35

35:                                               ; preds = %23
  %36 = sub nsw i32 %28, %24
  %37 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %36
  %38 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %39 = fadd contract float %30, %38
  store float %39, float addrspace(3)* %33, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %23, %35
  %41 = shl nsw i32 %24, 1
  %42 = icmp slt i32 %41, %2
  br i1 %42, label %23, label %15, !llvm.loop !10
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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
