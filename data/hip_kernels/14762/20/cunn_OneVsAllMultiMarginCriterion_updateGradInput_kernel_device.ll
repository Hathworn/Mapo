; ModuleID = '../data/hip_kernels/14762/20/main.cu'
source_filename = "../data/hip_kernels/14762/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z56cunn_OneVsAllMultiMarginCriterion_updateGradInput_kernelPfS_S_iiiS_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul nsw i32 %8, %4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %1, i64 %10
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %10
  %13 = sext i32 %8 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !4, !amdgpu.noclobber !8
  %16 = fptosi float %15 to i32
  %17 = add nsw i32 %16, -1
  %18 = icmp eq i32 %5, 0
  br i1 %18, label %22, label %19

19:                                               ; preds = %7
  %20 = sitofp i32 %4 to float
  %21 = fdiv contract float 1.000000e+00, %20
  br label %22

22:                                               ; preds = %7, %19
  %23 = phi float [ %21, %19 ], [ 1.000000e+00, %7 ]
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !10, !invariant.load !8
  %29 = zext i16 %28 to i32
  %30 = icmp slt i32 %24, %4
  br i1 %30, label %32, label %31

31:                                               ; preds = %51, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

32:                                               ; preds = %22, %51
  %33 = phi i32 [ %54, %51 ], [ %24, %22 ]
  %34 = icmp eq i32 %33, %17
  %35 = select i1 %34, float 1.000000e+00, float -1.000000e+00
  %36 = zext i32 %33 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %11, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !4
  %39 = fmul contract float %35, %38
  %40 = fsub contract float 1.000000e+00, %39
  %41 = fcmp contract ogt float %40, 0.000000e+00
  br i1 %41, label %42, label %51

42:                                               ; preds = %32
  br i1 %34, label %43, label %46

43:                                               ; preds = %42
  %44 = getelementptr inbounds float, float addrspace(1)* %6, i64 %36
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !4
  br label %46

46:                                               ; preds = %42, %43
  %47 = phi float [ %45, %43 ], [ 1.000000e+00, %42 ]
  %48 = fneg contract float %35
  %49 = fmul contract float %23, %48
  %50 = fmul contract float %49, %47
  br label %51

51:                                               ; preds = %32, %46
  %52 = phi float [ %50, %46 ], [ 0.000000e+00, %32 ]
  %53 = getelementptr inbounds float, float addrspace(1)* %12, i64 %36
  store float %52, float addrspace(1)* %53, align 4, !tbaa !4
  %54 = add nuw nsw i32 %33, %29
  %55 = icmp slt i32 %54, %4
  br i1 %55, label %32, label %31, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
