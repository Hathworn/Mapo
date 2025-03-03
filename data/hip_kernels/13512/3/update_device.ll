; ModuleID = '../data/hip_kernels/13512/3/main.cu'
source_filename = "../data/hip_kernels/13512/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ6updatePfS_iiiE2RK = internal unnamed_addr addrspace(3) global [1 x float] undef, align 4
@_ZZ6updatePfS_iiiE2QK = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6updatePfS_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = add i32 %8, %7
  %10 = add i32 %9, %4
  %11 = add i32 %10, 1
  %12 = icmp sle i32 %11, %4
  %13 = icmp sgt i32 %11, %3
  %14 = select i1 %12, i1 true, i1 %13
  br i1 %14, label %54, label %15

15:                                               ; preds = %5
  %16 = icmp eq i32 %6, 0
  br i1 %16, label %17, label %25

17:                                               ; preds = %15
  %18 = mul nsw i32 %10, %3
  %19 = add nsw i32 %4, -1
  %20 = add nsw i32 %19, %18
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = getelementptr inbounds [1 x float], [1 x float] addrspace(3)* @_ZZ6updatePfS_iiiE2RK, i32 0, i32 %7
  store float %23, float addrspace(3)* %24, align 4, !tbaa !5
  br label %25

25:                                               ; preds = %17, %15
  %26 = icmp slt i32 %6, %2
  br i1 %26, label %27, label %54

27:                                               ; preds = %25
  %28 = add nuw nsw i32 %6, 1
  %29 = icmp eq i32 %7, 0
  %30 = add nsw i32 %4, -1
  %31 = mul nsw i32 %30, %2
  %32 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ6updatePfS_iiiE2QK, i32 0, i32 %6
  %33 = getelementptr inbounds [1 x float], [1 x float] addrspace(3)* @_ZZ6updatePfS_iiiE2RK, i32 0, i32 %7
  %34 = mul nsw i32 %10, %2
  br label %35

35:                                               ; preds = %27, %43
  %36 = phi i32 [ %28, %27 ], [ %52, %43 ]
  %37 = add nsw i32 %36, -1
  br i1 %29, label %38, label %43

38:                                               ; preds = %35
  %39 = add nsw i32 %37, %31
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5
  store float %42, float addrspace(3)* %32, align 4, !tbaa !5
  br label %43

43:                                               ; preds = %35, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %45 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %46 = fmul contract float %44, %45
  %47 = add nsw i32 %37, %34
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5
  %51 = fsub contract float %50, %46
  store float %51, float addrspace(1)* %49, align 4, !tbaa !5
  %52 = add nuw nsw i32 %36, 512
  %53 = icmp sgt i32 %52, %2
  br i1 %53, label %54, label %35, !llvm.loop !10

54:                                               ; preds = %43, %25, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
