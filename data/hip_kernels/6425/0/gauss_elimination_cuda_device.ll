; ModuleID = '../data/hip_kernels/6425/0/main.cu'
source_filename = "../data/hip_kernels/6425/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22gauss_elimination_cudaPfS_iE4temp = internal unnamed_addr addrspace(3) global [40 x [40 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22gauss_elimination_cudaPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = add nsw i32 %2, 1
  %7 = mul nsw i32 %6, %5
  %8 = add nsw i32 %7, %4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %12 = getelementptr inbounds [40 x [40 x float]], [40 x [40 x float]] addrspace(3)* @_ZZ22gauss_elimination_cudaPfS_iE4temp, i32 0, i32 %5, i32 %4
  store float %11, float addrspace(3)* %12, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = icmp sgt i32 %2, 1
  br i1 %13, label %14, label %16

14:                                               ; preds = %3
  %15 = add i32 %2, -2
  br label %19

16:                                               ; preds = %35, %3
  %17 = load float, float addrspace(3)* %12, align 4, !tbaa !5
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %9
  store float %17, float addrspace(1)* %18, align 4, !tbaa !5
  ret void

19:                                               ; preds = %14, %35
  %20 = phi i32 [ %36, %35 ], [ 0, %14 ]
  %21 = icmp ule i32 %5, %20
  %22 = icmp ult i32 %4, %20
  %23 = select i1 %21, i1 true, i1 %22
  br i1 %23, label %35, label %24

24:                                               ; preds = %19
  %25 = getelementptr inbounds [40 x [40 x float]], [40 x [40 x float]] addrspace(3)* @_ZZ22gauss_elimination_cudaPfS_iE4temp, i32 0, i32 %20, i32 %4
  %26 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %27 = getelementptr inbounds [40 x [40 x float]], [40 x [40 x float]] addrspace(3)* @_ZZ22gauss_elimination_cudaPfS_iE4temp, i32 0, i32 %20, i32 %20
  %28 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %29 = getelementptr inbounds [40 x [40 x float]], [40 x [40 x float]] addrspace(3)* @_ZZ22gauss_elimination_cudaPfS_iE4temp, i32 0, i32 %5, i32 %20
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %31 = fdiv contract float %28, %30
  %32 = load float, float addrspace(3)* %12, align 4, !tbaa !5
  %33 = fmul contract float %31, %32
  %34 = fsub contract float %26, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store float %34, float addrspace(3)* %12, align 4, !tbaa !5
  br label %35

35:                                               ; preds = %24, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = add nuw nsw i32 %20, 1
  %37 = icmp eq i32 %20, %15
  br i1 %37, label %16, label %19, !llvm.loop !10
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
