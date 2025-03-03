; ModuleID = '../data/hip_kernels/7438/6/main.cu'
source_filename = "../data/hip_kernels/7438/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ30prefSumBinTreeCudaMultiCollectPfiiE3shm = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z30prefSumBinTreeCudaMultiCollectPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = add nuw nsw i32 %4, 1
  %6 = and i32 %5, 1
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %18

8:                                                ; preds = %3
  %9 = zext i32 %4 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %12 = add nsw i32 %4, -1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = fadd contract float %11, %15
  %17 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ30prefSumBinTreeCudaMultiCollectPfiiE3shm, i32 0, i32 %4
  store float %16, float addrspace(3)* %17, align 4, !tbaa !5
  br label %18

18:                                               ; preds = %8, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = icmp slt i32 %1, 4
  br i1 %19, label %22, label %20

20:                                               ; preds = %18
  %21 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ30prefSumBinTreeCudaMultiCollectPfiiE3shm, i32 0, i32 %4
  br label %25

22:                                               ; preds = %37, %18
  %23 = phi i32 [ 4, %18 ], [ %38, %37 ]
  %24 = icmp ugt i32 %23, 5
  br i1 %24, label %40, label %60

25:                                               ; preds = %20, %37
  %26 = phi i32 [ 4, %20 ], [ %38, %37 ]
  %27 = add nsw i32 %26, -1
  %28 = and i32 %27, %5
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %37

30:                                               ; preds = %25
  %31 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %32 = ashr exact i32 %26, 1
  %33 = sub nsw i32 %4, %32
  %34 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ30prefSumBinTreeCudaMultiCollectPfiiE3shm, i32 0, i32 %33
  %35 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %36 = fadd contract float %31, %35
  store float %36, float addrspace(3)* %21, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %30, %25
  %38 = shl nsw i32 %26, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp sgt i32 %38, %1
  br i1 %39, label %22, label %25, !llvm.loop !10

40:                                               ; preds = %22, %58
  %41 = phi i32 [ %42, %58 ], [ %23, %22 ]
  %42 = lshr i32 %41, 1
  %43 = add nsw i32 %42, -1
  %44 = and i32 %43, %5
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %58

46:                                               ; preds = %40
  %47 = udiv i32 %5, %42
  %48 = icmp eq i32 %47, 1
  br i1 %48, label %58, label %49

49:                                               ; preds = %46
  %50 = lshr i32 %41, 2
  %51 = sub nsw i32 %4, %50
  %52 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ30prefSumBinTreeCudaMultiCollectPfiiE3shm, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %54 = sub nsw i32 %4, %42
  %55 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ30prefSumBinTreeCudaMultiCollectPfiiE3shm, i32 0, i32 %54
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %57 = fadd contract float %53, %56
  store float %57, float addrspace(3)* %52, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %46, %49, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = icmp ugt i32 %41, 11
  br i1 %59, label %40, label %60, !llvm.loop !12

60:                                               ; preds = %58, %22
  br i1 %7, label %61, label %66

61:                                               ; preds = %60
  %62 = zext i32 %4 to i64
  %63 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ30prefSumBinTreeCudaMultiCollectPfiiE3shm, i32 0, i32 %4
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  store float %64, float addrspace(1)* %65, align 4, !tbaa !5
  br label %76

66:                                               ; preds = %60
  %67 = icmp eq i32 %4, 0
  br i1 %67, label %76, label %68

68:                                               ; preds = %66
  %69 = zext i32 %4 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  %72 = add nsw i32 %4, -1
  %73 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ30prefSumBinTreeCudaMultiCollectPfiiE3shm, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %75 = fadd contract float %71, %74
  store float %75, float addrspace(1)* %70, align 4, !tbaa !5
  br label %76

76:                                               ; preds = %66, %68, %61
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
