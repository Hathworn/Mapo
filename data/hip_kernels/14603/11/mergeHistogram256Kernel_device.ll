; ModuleID = '../data/hip_kernels/14603/11/main.cu'
source_filename = "../data/hip_kernels/14603/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23mergeHistogram256KernelPfS_jE4data = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23mergeHistogram256KernelPfS_j(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp ult i32 %4, %2
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br label %12

8:                                                ; preds = %12, %3
  %9 = phi i32 [ 0, %3 ], [ %22, %12 ]
  %10 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 %4
  store i32 %9, i32 addrspace(3)* %10, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %11 = icmp ult i32 %4, 128
  br i1 %11, label %25, label %31

12:                                               ; preds = %6, %12
  %13 = phi i32 [ %4, %6 ], [ %23, %12 ]
  %14 = phi i32 [ 0, %6 ], [ %22, %12 ]
  %15 = shl i32 %13, 8
  %16 = add i32 %15, %7
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !9, !amdgpu.noclobber !11
  %20 = uitofp i32 %14 to float
  %21 = fadd contract float %19, %20
  %22 = fptoui float %21 to i32
  %23 = add i32 %13, 256
  %24 = icmp ult i32 %23, %2
  br i1 %24, label %12, label %8, !llvm.loop !12

25:                                               ; preds = %8
  %26 = add nuw nsw i32 %4, 128
  %27 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 %26
  %28 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %29 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %30 = add i32 %29, %28
  store i32 %30, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %31

31:                                               ; preds = %8, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = icmp ult i32 %4, 64
  br i1 %32, label %33, label %39

33:                                               ; preds = %31
  %34 = add nuw nsw i32 %4, 64
  %35 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 %34
  %36 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !5
  %37 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %38 = add i32 %37, %36
  store i32 %38, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %39

39:                                               ; preds = %33, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ult i32 %4, 32
  br i1 %40, label %41, label %47

41:                                               ; preds = %39
  %42 = add nuw nsw i32 %4, 32
  %43 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 %42
  %44 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %45 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %46 = add i32 %45, %44
  store i32 %46, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %41, %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ult i32 %4, 16
  br i1 %48, label %49, label %55

49:                                               ; preds = %47
  %50 = add nuw nsw i32 %4, 16
  %51 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 %50
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !5
  %53 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %54 = add i32 %53, %52
  store i32 %54, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %55

55:                                               ; preds = %49, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ult i32 %4, 8
  br i1 %56, label %57, label %63

57:                                               ; preds = %55
  %58 = add nuw nsw i32 %4, 8
  %59 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 %58
  %60 = load i32, i32 addrspace(3)* %59, align 4, !tbaa !5
  %61 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %62 = add i32 %61, %60
  store i32 %62, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %63

63:                                               ; preds = %57, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = icmp ult i32 %4, 4
  br i1 %64, label %65, label %71

65:                                               ; preds = %63
  %66 = add nuw nsw i32 %4, 4
  %67 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 %66
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %69 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %70 = add i32 %69, %68
  store i32 %70, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %71

71:                                               ; preds = %65, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = icmp ult i32 %4, 2
  br i1 %72, label %73, label %79

73:                                               ; preds = %71
  %74 = add nuw nsw i32 %4, 2
  %75 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 %74
  %76 = load i32, i32 addrspace(3)* %75, align 4, !tbaa !5
  %77 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %78 = add i32 %77, %76
  store i32 %78, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %79

79:                                               ; preds = %73, %71
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = icmp eq i32 %4, 0
  br i1 %80, label %81, label %92

81:                                               ; preds = %79
  %82 = add nuw nsw i32 %4, 1
  %83 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 %82
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !5
  %85 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !5
  %86 = add i32 %85, %84
  store i32 %86, i32 addrspace(3)* %10, align 4, !tbaa !5
  %87 = load i32, i32 addrspace(3)* getelementptr inbounds ([256 x i32], [256 x i32] addrspace(3)* @_ZZ23mergeHistogram256KernelPfS_jE4data, i32 0, i32 0), align 16, !tbaa !5
  %88 = uitofp i32 %87 to float
  %89 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  store float %88, float addrspace(1)* %91, align 4, !tbaa !9
  br label %92

92:                                               ; preds = %79, %81
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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = !{}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
