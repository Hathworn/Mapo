; ModuleID = '../data/hip_kernels/13792/85/main.cu'
source_filename = "../data/hip_kernels/13792/85/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ6kernelPfmE1s = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6kernelPfm(float addrspace(1)* nocapture %0, i64 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = add i64 %1, 15
  %5 = lshr i64 %4, 4
  %6 = trunc i64 %5 to i32
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %40

8:                                                ; preds = %2
  %9 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ6kernelPfmE1s, i32 0, i32 %3
  %10 = add nuw nsw i32 %3, 16
  %11 = zext i32 %10 to i64
  %12 = icmp ult i64 %11, %1
  %13 = icmp ult i32 %3, 16
  %14 = select i1 %12, i1 %13, i1 false
  %15 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ6kernelPfmE1s, i32 0, i32 %10
  %16 = add nuw nsw i32 %3, 8
  %17 = zext i32 %16 to i64
  %18 = icmp ult i64 %17, %1
  %19 = icmp ult i32 %3, 8
  %20 = select i1 %18, i1 %19, i1 false
  %21 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ6kernelPfmE1s, i32 0, i32 %16
  %22 = add nuw nsw i32 %3, 4
  %23 = zext i32 %22 to i64
  %24 = icmp ult i64 %23, %1
  %25 = icmp ult i32 %3, 4
  %26 = select i1 %24, i1 %25, i1 false
  %27 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ6kernelPfmE1s, i32 0, i32 %22
  %28 = add nuw nsw i32 %3, 2
  %29 = zext i32 %28 to i64
  %30 = icmp ult i64 %29, %1
  %31 = icmp ult i32 %3, 2
  %32 = select i1 %30, i1 %31, i1 false
  %33 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ6kernelPfmE1s, i32 0, i32 %28
  %34 = add nuw nsw i32 %3, 1
  %35 = zext i32 %34 to i64
  %36 = icmp ult i64 %35, %1
  %37 = icmp eq i32 %3, 0
  %38 = select i1 %36, i1 %37, i1 false
  %39 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ6kernelPfmE1s, i32 0, i32 %34
  br label %42

40:                                               ; preds = %73, %2
  %41 = phi float [ 0.000000e+00, %2 ], [ %75, %73 ]
  store float %41, float addrspace(1)* %0, align 4, !tbaa !5
  ret void

42:                                               ; preds = %8, %73
  %43 = phi float [ 0.000000e+00, %8 ], [ %75, %73 ]
  %44 = phi i32 [ 0, %8 ], [ %76, %73 ]
  %45 = shl nsw i32 %44, 4
  %46 = add nuw nsw i32 %45, %3
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %49, float addrspace(3)* %9, align 4, !tbaa !5
  br i1 %14, label %50, label %53

50:                                               ; preds = %42
  %51 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %52 = fadd contract float %51, %49
  store float %52, float addrspace(3)* %9, align 4, !tbaa !5
  br label %53

53:                                               ; preds = %42, %50
  %54 = phi float [ %49, %42 ], [ %52, %50 ]
  br i1 %20, label %55, label %58

55:                                               ; preds = %53
  %56 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %57 = fadd contract float %56, %54
  store float %57, float addrspace(3)* %9, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %55, %53
  %59 = phi float [ %57, %55 ], [ %54, %53 ]
  br i1 %26, label %60, label %63

60:                                               ; preds = %58
  %61 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %62 = fadd contract float %61, %59
  store float %62, float addrspace(3)* %9, align 4, !tbaa !5
  br label %63

63:                                               ; preds = %60, %58
  %64 = phi float [ %62, %60 ], [ %59, %58 ]
  br i1 %32, label %65, label %68

65:                                               ; preds = %63
  %66 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %67 = fadd contract float %66, %64
  store float %67, float addrspace(3)* %9, align 4, !tbaa !5
  br label %68

68:                                               ; preds = %65, %63
  %69 = phi float [ %67, %65 ], [ %64, %63 ]
  br i1 %38, label %70, label %73

70:                                               ; preds = %68
  %71 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %72 = fadd contract float %71, %69
  store float %72, float addrspace(3)* %9, align 4, !tbaa !5
  br label %73

73:                                               ; preds = %70, %68
  %74 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ6kernelPfmE1s, i32 0, i32 0), align 16, !tbaa !5
  %75 = fadd contract float %43, %74
  %76 = add nuw nsw i32 %44, 1
  %77 = icmp eq i32 %76, %6
  br i1 %77, label %40, label %42, !llvm.loop !10
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
