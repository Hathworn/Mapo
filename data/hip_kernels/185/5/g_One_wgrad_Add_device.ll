; ModuleID = '../data/hip_kernels/185/5/main.cu'
source_filename = "../data/hip_kernels/185/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_sum = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15g_One_wgrad_AddPfS_S_iiif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_sum, i32 0, i32 %10
  store float 0.000000e+00, float addrspace(3)* %11, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %12 = icmp sgt i32 %3, 0
  br i1 %12, label %13, label %20

13:                                               ; preds = %7
  %14 = mul nsw i32 %8, %3
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !9, !invariant.load !10
  %19 = zext i16 %18 to i32
  br label %22

20:                                               ; preds = %35, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp eq i32 %3, 1
  br i1 %21, label %52, label %38

22:                                               ; preds = %13, %35
  %23 = phi i32 [ 0, %13 ], [ %36, %35 ]
  %24 = add i32 %23, %10
  %25 = icmp slt i32 %24, %3
  br i1 %25, label %26, label %35

26:                                               ; preds = %22
  %27 = add i32 %24, %14
  %28 = mul i32 %27, %4
  %29 = add nsw i32 %28, %9
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !10
  %33 = load float, float addrspace(3)* %11, align 4, !tbaa !5
  %34 = fadd contract float %32, %33
  store float %34, float addrspace(3)* %11, align 4, !tbaa !5
  br label %35

35:                                               ; preds = %26, %22
  %36 = add i32 %23, %19
  %37 = icmp slt i32 %36, %3
  br i1 %37, label %22, label %20, !llvm.loop !11

38:                                               ; preds = %20, %50
  %39 = phi i32 [ %41, %50 ], [ %3, %20 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = add nsw i32 %39, 1
  %41 = ashr i32 %40, 1
  %42 = ashr i32 %39, 1
  %43 = icmp slt i32 %10, %42
  br i1 %43, label %44, label %50

44:                                               ; preds = %38
  %45 = add nsw i32 %41, %10
  %46 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_sum, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %48 = load float, float addrspace(3)* %11, align 4, !tbaa !5
  %49 = fadd contract float %47, %48
  store float %49, float addrspace(3)* %11, align 4, !tbaa !5
  br label %50

50:                                               ; preds = %44, %38
  %51 = icmp eq i32 %41, 1
  br i1 %51, label %52, label %38, !llvm.loop !13

52:                                               ; preds = %50, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = icmp eq i32 %10, 0
  br i1 %53, label %54, label %66

54:                                               ; preds = %52
  %55 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @_sum, i32 0, i32 0), align 4, !tbaa !5
  %56 = sitofp i32 %3 to float
  %57 = fdiv contract float %55, %56
  %58 = mul nsw i32 %8, %4
  %59 = add nsw i32 %58, %9
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5
  %63 = fmul contract float %62, %6
  %64 = fadd contract float %57, %63
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  store float %64, float addrspace(1)* %65, align 4, !tbaa !5
  br label %66

66:                                               ; preds = %54, %52
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
