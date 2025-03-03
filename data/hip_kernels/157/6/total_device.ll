; ModuleID = '../data/hip_kernels/157/6/main.cu'
source_filename = "../data/hip_kernels/157/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5totalPfS_iE10partialSum = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5totalPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 8
  %7 = add i32 %6, %4
  %8 = icmp ult i32 %7, %2
  br i1 %8, label %9, label %13

9:                                                ; preds = %3
  %10 = zext i32 %7 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %0, i64 %10
  %12 = load float, float addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %13

13:                                               ; preds = %3, %9
  %14 = phi float [ %12, %9 ], [ 0.000000e+00, %3 ]
  %15 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %4
  store float %14, float addrspace(3)* %15, align 4
  %16 = add nuw nsw i32 %4, 128
  %17 = add i32 %16, %6
  %18 = icmp ult i32 %17, %2
  br i1 %18, label %19, label %23

19:                                               ; preds = %13
  %20 = zext i32 %17 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %23

23:                                               ; preds = %13, %19
  %24 = phi float [ %22, %19 ], [ 0.000000e+00, %13 ]
  %25 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %16
  store float %24, float addrspace(3)* %25, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = icmp ult i32 %4, 128
  br i1 %26, label %27, label %32

27:                                               ; preds = %23
  %28 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %16
  %29 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %30 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %31 = fadd contract float %29, %30
  store float %31, float addrspace(3)* %15, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %23, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp ult i32 %4, 64
  br i1 %33, label %34, label %40

34:                                               ; preds = %32
  %35 = add nuw nsw i32 %4, 64
  %36 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %35
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %38 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %39 = fadd contract float %37, %38
  store float %39, float addrspace(3)* %15, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %34, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ult i32 %4, 32
  br i1 %41, label %42, label %48

42:                                               ; preds = %40
  %43 = add nuw nsw i32 %4, 32
  %44 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %46 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(3)* %15, align 4, !tbaa !5
  br label %48

48:                                               ; preds = %42, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ult i32 %4, 16
  br i1 %49, label %50, label %56

50:                                               ; preds = %48
  %51 = add nuw nsw i32 %4, 16
  %52 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %54 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %55 = fadd contract float %53, %54
  store float %55, float addrspace(3)* %15, align 4, !tbaa !5
  br label %56

56:                                               ; preds = %50, %48
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = icmp ult i32 %4, 8
  br i1 %57, label %58, label %64

58:                                               ; preds = %56
  %59 = add nuw nsw i32 %4, 8
  %60 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %59
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %62 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %63 = fadd contract float %61, %62
  store float %63, float addrspace(3)* %15, align 4, !tbaa !5
  br label %64

64:                                               ; preds = %58, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = icmp ult i32 %4, 4
  br i1 %65, label %66, label %72

66:                                               ; preds = %64
  %67 = add nuw nsw i32 %4, 4
  %68 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %67
  %69 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %70 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %71 = fadd contract float %69, %70
  store float %71, float addrspace(3)* %15, align 4, !tbaa !5
  br label %72

72:                                               ; preds = %66, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %73 = icmp ult i32 %4, 2
  br i1 %73, label %74, label %80

74:                                               ; preds = %72
  %75 = add nuw nsw i32 %4, 2
  %76 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %75
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %78 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %79 = fadd contract float %77, %78
  store float %79, float addrspace(3)* %15, align 4, !tbaa !5
  br label %80

80:                                               ; preds = %74, %72
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp eq i32 %4, 0
  br i1 %81, label %82, label %91

82:                                               ; preds = %80
  %83 = add nuw nsw i32 %4, 1
  %84 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 %83
  %85 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %86 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %87 = fadd contract float %85, %86
  store float %87, float addrspace(3)* %15, align 4, !tbaa !5
  %88 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ5totalPfS_iE10partialSum, i32 0, i32 0), align 16, !tbaa !5
  %89 = zext i32 %5 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  store float %88, float addrspace(1)* %90, align 4, !tbaa !5
  br label %91

91:                                               ; preds = %80, %82
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
