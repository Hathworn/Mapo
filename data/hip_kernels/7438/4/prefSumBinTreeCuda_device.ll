; ModuleID = '../data/hip_kernels/7438/4/main.cu'
source_filename = "../data/hip_kernels/7438/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18prefSumBinTreeCudaPfiE3shm = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18prefSumBinTreeCudaPfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = add nuw nsw i32 %3, 1
  %5 = and i32 %4, 1
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %17

7:                                                ; preds = %2
  %8 = zext i32 %3 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %0, i64 %8
  %10 = load float, float addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = add nsw i32 %3, -1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = fadd contract float %10, %14
  %16 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ18prefSumBinTreeCudaPfiE3shm, i32 0, i32 %3
  store float %15, float addrspace(3)* %16, align 4, !tbaa !5
  br label %17

17:                                               ; preds = %7, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp slt i32 %1, 4
  br i1 %18, label %21, label %19

19:                                               ; preds = %17
  %20 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ18prefSumBinTreeCudaPfiE3shm, i32 0, i32 %3
  br label %24

21:                                               ; preds = %36, %17
  %22 = phi i32 [ 4, %17 ], [ %37, %36 ]
  %23 = icmp ugt i32 %22, 5
  br i1 %23, label %39, label %59

24:                                               ; preds = %19, %36
  %25 = phi i32 [ 4, %19 ], [ %37, %36 ]
  %26 = add nsw i32 %25, -1
  %27 = and i32 %26, %4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %36

29:                                               ; preds = %24
  %30 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %31 = ashr exact i32 %25, 1
  %32 = sub nsw i32 %3, %31
  %33 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ18prefSumBinTreeCudaPfiE3shm, i32 0, i32 %32
  %34 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %35 = fadd contract float %30, %34
  store float %35, float addrspace(3)* %20, align 4, !tbaa !5
  br label %36

36:                                               ; preds = %29, %24
  %37 = shl nsw i32 %25, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp sgt i32 %37, %1
  br i1 %38, label %21, label %24, !llvm.loop !10

39:                                               ; preds = %21, %57
  %40 = phi i32 [ %41, %57 ], [ %22, %21 ]
  %41 = lshr i32 %40, 1
  %42 = add nsw i32 %41, -1
  %43 = and i32 %42, %4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %57

45:                                               ; preds = %39
  %46 = udiv i32 %4, %41
  %47 = icmp eq i32 %46, 1
  br i1 %47, label %57, label %48

48:                                               ; preds = %45
  %49 = lshr i32 %40, 2
  %50 = sub nsw i32 %3, %49
  %51 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ18prefSumBinTreeCudaPfiE3shm, i32 0, i32 %50
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %53 = sub nsw i32 %3, %41
  %54 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ18prefSumBinTreeCudaPfiE3shm, i32 0, i32 %53
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %56 = fadd contract float %52, %55
  store float %56, float addrspace(3)* %51, align 4, !tbaa !5
  br label %57

57:                                               ; preds = %45, %48, %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = icmp ugt i32 %40, 11
  br i1 %58, label %39, label %59, !llvm.loop !12

59:                                               ; preds = %57, %21
  br i1 %6, label %60, label %65

60:                                               ; preds = %59
  %61 = zext i32 %3 to i64
  %62 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ18prefSumBinTreeCudaPfiE3shm, i32 0, i32 %3
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  store float %63, float addrspace(1)* %64, align 4, !tbaa !5
  br label %75

65:                                               ; preds = %59
  %66 = icmp eq i32 %3, 0
  br i1 %66, label %75, label %67

67:                                               ; preds = %65
  %68 = zext i32 %3 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  %71 = add nsw i32 %3, -1
  %72 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ18prefSumBinTreeCudaPfiE3shm, i32 0, i32 %71
  %73 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %74 = fadd contract float %70, %73
  store float %74, float addrspace(1)* %69, align 4, !tbaa !5
  br label %75

75:                                               ; preds = %65, %67, %60
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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
