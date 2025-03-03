; ModuleID = '../data/hip_kernels/7438/5/main.cu'
source_filename = "../data/hip_kernels/7438/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23prefSumBinTreeCudaMultiPfiE3shm = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23prefSumBinTreeCudaMultiPfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = add nuw nsw i32 %3, 1
  %6 = and i32 %5, 1
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %20

8:                                                ; preds = %2
  %9 = shl nsw i32 %4, 10
  %10 = or i32 %9, %3
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = add nsw i32 %10, -1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = fadd contract float %13, %17
  %19 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ23prefSumBinTreeCudaMultiPfiE3shm, i32 0, i32 %3
  store float %18, float addrspace(3)* %19, align 4, !tbaa !5
  br label %20

20:                                               ; preds = %8, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp slt i32 %1, 4
  br i1 %21, label %24, label %22

22:                                               ; preds = %20
  %23 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ23prefSumBinTreeCudaMultiPfiE3shm, i32 0, i32 %3
  br label %27

24:                                               ; preds = %39, %20
  %25 = phi i32 [ 4, %20 ], [ %40, %39 ]
  %26 = icmp ugt i32 %25, 5
  br i1 %26, label %42, label %62

27:                                               ; preds = %22, %39
  %28 = phi i32 [ 4, %22 ], [ %40, %39 ]
  %29 = add nsw i32 %28, -1
  %30 = and i32 %29, %5
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %39

32:                                               ; preds = %27
  %33 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %34 = ashr exact i32 %28, 1
  %35 = sub nsw i32 %3, %34
  %36 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ23prefSumBinTreeCudaMultiPfiE3shm, i32 0, i32 %35
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %38 = fadd contract float %33, %37
  store float %38, float addrspace(3)* %23, align 4, !tbaa !5
  br label %39

39:                                               ; preds = %32, %27
  %40 = shl nsw i32 %28, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp sgt i32 %40, %1
  br i1 %41, label %24, label %27, !llvm.loop !10

42:                                               ; preds = %24, %60
  %43 = phi i32 [ %44, %60 ], [ %25, %24 ]
  %44 = lshr i32 %43, 1
  %45 = add nsw i32 %44, -1
  %46 = and i32 %45, %5
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %60

48:                                               ; preds = %42
  %49 = udiv i32 %5, %44
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %60, label %51

51:                                               ; preds = %48
  %52 = lshr i32 %43, 2
  %53 = sub nsw i32 %3, %52
  %54 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ23prefSumBinTreeCudaMultiPfiE3shm, i32 0, i32 %53
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %56 = sub nsw i32 %3, %44
  %57 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ23prefSumBinTreeCudaMultiPfiE3shm, i32 0, i32 %56
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %59 = fadd contract float %55, %58
  store float %59, float addrspace(3)* %54, align 4, !tbaa !5
  br label %60

60:                                               ; preds = %48, %51, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = icmp ugt i32 %43, 11
  br i1 %61, label %42, label %62, !llvm.loop !12

62:                                               ; preds = %60, %24
  br i1 %7, label %63, label %70

63:                                               ; preds = %62
  %64 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ23prefSumBinTreeCudaMultiPfiE3shm, i32 0, i32 %3
  %65 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %66 = shl nsw i32 %4, 10
  %67 = or i32 %66, %3
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  store float %65, float addrspace(1)* %69, align 4, !tbaa !5
  br label %82

70:                                               ; preds = %62
  %71 = icmp eq i32 %3, 0
  br i1 %71, label %82, label %72

72:                                               ; preds = %70
  %73 = shl nsw i32 %4, 10
  %74 = or i32 %73, %3
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  %78 = add nsw i32 %3, -1
  %79 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ23prefSumBinTreeCudaMultiPfiE3shm, i32 0, i32 %78
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %81 = fadd contract float %77, %80
  store float %81, float addrspace(1)* %76, align 4, !tbaa !5
  br label %82

82:                                               ; preds = %70, %72, %63
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
!12 = distinct !{!12, !11}
