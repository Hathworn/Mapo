; ModuleID = '../data/hip_kernels/497/2/main.cu'
source_filename = "../data/hip_kernels/497/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9reductionPfiE10partialSum = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9reductionPfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds float, float addrspace(1)* %0, i64 %4
  %6 = load float, float addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9reductionPfiE10partialSum, i32 0, i32 %3
  store float %6, float addrspace(3)* %7, align 4, !tbaa !5
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !10, !invariant.load !9
  %12 = icmp ult i16 %11, 2
  br i1 %12, label %15, label %13

13:                                               ; preds = %2
  %14 = zext i16 %11 to i32
  br label %17

15:                                               ; preds = %27, %2
  %16 = icmp eq i32 %3, 0
  br i1 %16, label %29, label %31

17:                                               ; preds = %13, %27
  %18 = phi i32 [ %19, %27 ], [ %14, %13 ]
  %19 = lshr i32 %18, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp ult i32 %3, %19
  br i1 %20, label %21, label %27

21:                                               ; preds = %17
  %22 = add nuw nsw i32 %19, %3
  %23 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ9reductionPfiE10partialSum, i32 0, i32 %22
  %24 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %25 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %26 = fadd contract float %24, %25
  store float %26, float addrspace(3)* %7, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %17, %21
  %28 = icmp ult i32 %18, 4
  br i1 %28, label %15, label %17, !llvm.loop !11

29:                                               ; preds = %15
  %30 = load float, float addrspace(3)* getelementptr inbounds ([512 x float], [512 x float] addrspace(3)* @_ZZ9reductionPfiE10partialSum, i32 0, i32 0), align 16, !tbaa !5
  store float %30, float addrspace(1)* %0, align 4, !tbaa !5
  br label %31

31:                                               ; preds = %29, %15
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
