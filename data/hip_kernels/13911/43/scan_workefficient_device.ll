; ModuleID = '../data/hip_kernels/13911/43/main.cu'
source_filename = "../data/hip_kernels/13911/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18scan_workefficientPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = shl nuw nsw i32 %4, 1
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds float, float addrspace(1)* %1, i64 %6
  %8 = load float, float addrspace(1)* %7, align 4, !tbaa !5, !amdgpu.noclobber !9
  %9 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %5
  store float %8, float addrspace(3)* %9, align 4, !tbaa !5
  %10 = add nuw nsw i32 %5, 1
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %1, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %10
  store float %13, float addrspace(3)* %14, align 4, !tbaa !5
  %15 = icmp sgt i32 %2, 1
  br i1 %15, label %16, label %18

16:                                               ; preds = %3
  %17 = add nuw nsw i32 %5, 2
  br label %21

18:                                               ; preds = %36, %3
  %19 = phi i32 [ 1, %3 ], [ %37, %36 ]
  %20 = icmp eq i32 %4, 0
  br i1 %20, label %39, label %42

21:                                               ; preds = %16, %36
  %22 = phi i32 [ %2, %16 ], [ %24, %36 ]
  %23 = phi i32 [ 1, %16 ], [ %37, %36 ]
  %24 = ashr i32 %22, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = icmp slt i32 %4, %24
  br i1 %25, label %26, label %36

26:                                               ; preds = %21
  %27 = mul nsw i32 %23, %10
  %28 = add nsw i32 %27, -1
  %29 = mul nsw i32 %23, %17
  %30 = add nsw i32 %29, -1
  %31 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %28
  %32 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %33 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %30
  %34 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %35 = fadd contract float %32, %34
  store float %35, float addrspace(3)* %33, align 4, !tbaa !5
  br label %36

36:                                               ; preds = %26, %21
  %37 = shl nsw i32 %23, 1
  %38 = icmp sgt i32 %22, 3
  br i1 %38, label %21, label %18, !llvm.loop !10

39:                                               ; preds = %18
  %40 = add nsw i32 %2, -1
  %41 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %40
  store float 0.000000e+00, float addrspace(3)* %41, align 4, !tbaa !5
  br label %42

42:                                               ; preds = %39, %18
  br i1 %15, label %43, label %45

43:                                               ; preds = %42
  %44 = add nuw nsw i32 %5, 2
  br label %50

45:                                               ; preds = %66, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %6
  store float %46, float addrspace(1)* %47, align 4, !tbaa !5
  %48 = load float, float addrspace(3)* %14, align 4, !tbaa !5
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  store float %48, float addrspace(1)* %49, align 4, !tbaa !5
  ret void

50:                                               ; preds = %43, %66
  %51 = phi i32 [ %19, %43 ], [ %53, %66 ]
  %52 = phi i32 [ 1, %43 ], [ %67, %66 ]
  %53 = lshr i32 %51, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp slt i32 %4, %52
  br i1 %54, label %55, label %66

55:                                               ; preds = %50
  %56 = mul nsw i32 %53, %10
  %57 = add nsw i32 %56, -1
  %58 = mul nsw i32 %53, %44
  %59 = add nsw i32 %58, -1
  %60 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %57
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %62 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp, i32 0, i32 %59
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  store float %63, float addrspace(3)* %60, align 4, !tbaa !5
  %64 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %65 = fadd contract float %61, %64
  store float %65, float addrspace(3)* %62, align 4, !tbaa !5
  br label %66

66:                                               ; preds = %50, %55
  %67 = shl nsw i32 %52, 1
  %68 = icmp slt i32 %67, %2
  br i1 %68, label %50, label %45, !llvm.loop !12
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
!12 = distinct !{!12, !11}
