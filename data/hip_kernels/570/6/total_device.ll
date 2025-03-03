; ModuleID = '../data/hip_kernels/570/6/main.cu'
source_filename = "../data/hip_kernels/570/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5totalPfS_iE7partSum = internal unnamed_addr addrspace(3) global [2048 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5totalPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 11
  %7 = or i32 %6, %4
  %8 = icmp ult i32 %7, %2
  br i1 %8, label %9, label %21

9:                                                ; preds = %3
  %10 = zext i32 %7 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %0, i64 %10
  %12 = load float, float addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %4
  store float %12, float addrspace(3)* %13, align 4, !tbaa !5
  %14 = add nuw nsw i32 %6, 1024
  %15 = or i32 %14, %4
  %16 = icmp ult i32 %15, %2
  br i1 %16, label %17, label %23

17:                                               ; preds = %9
  %18 = zext i32 %15 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %23

21:                                               ; preds = %3
  %22 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %4
  store float 0.000000e+00, float addrspace(3)* %22, align 4, !tbaa !5
  br label %23

23:                                               ; preds = %9, %17, %21
  %24 = phi float [ %20, %17 ], [ 0.000000e+00, %21 ], [ 0.000000e+00, %9 ]
  %25 = or i32 %4, 1024
  %26 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %25
  store float %24, float addrspace(3)* %26, align 4, !tbaa !5
  %27 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = or i32 %4, 1024
  %29 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %28
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %31 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %32 = fadd contract float %30, %31
  store float %32, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp ult i32 %4, 512
  br i1 %33, label %34, label %40

34:                                               ; preds = %23
  %35 = add nuw nsw i32 %4, 512
  %36 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %35
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %38 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %39 = fadd contract float %37, %38
  store float %39, float addrspace(3)* %27, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %34, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ult i32 %4, 256
  br i1 %41, label %42, label %48

42:                                               ; preds = %40
  %43 = add nuw nsw i32 %4, 256
  %44 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %46 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(3)* %27, align 4, !tbaa !5
  br label %48

48:                                               ; preds = %42, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ult i32 %4, 128
  br i1 %49, label %50, label %56

50:                                               ; preds = %48
  %51 = add nuw nsw i32 %4, 128
  %52 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %54 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %55 = fadd contract float %53, %54
  store float %55, float addrspace(3)* %27, align 4, !tbaa !5
  br label %56

56:                                               ; preds = %50, %48
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = icmp ult i32 %4, 64
  br i1 %57, label %58, label %64

58:                                               ; preds = %56
  %59 = add nuw nsw i32 %4, 64
  %60 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %59
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %62 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %63 = fadd contract float %61, %62
  store float %63, float addrspace(3)* %27, align 4, !tbaa !5
  br label %64

64:                                               ; preds = %58, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = icmp ult i32 %4, 32
  br i1 %65, label %66, label %72

66:                                               ; preds = %64
  %67 = add nuw nsw i32 %4, 32
  %68 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %67
  %69 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %70 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %71 = fadd contract float %69, %70
  store float %71, float addrspace(3)* %27, align 4, !tbaa !5
  br label %72

72:                                               ; preds = %66, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %73 = icmp ult i32 %4, 16
  br i1 %73, label %74, label %80

74:                                               ; preds = %72
  %75 = add nuw nsw i32 %4, 16
  %76 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %75
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %78 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %79 = fadd contract float %77, %78
  store float %79, float addrspace(3)* %27, align 4, !tbaa !5
  br label %80

80:                                               ; preds = %74, %72
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp ult i32 %4, 8
  br i1 %81, label %82, label %88

82:                                               ; preds = %80
  %83 = add nuw nsw i32 %4, 8
  %84 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %83
  %85 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %86 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %87 = fadd contract float %85, %86
  store float %87, float addrspace(3)* %27, align 4, !tbaa !5
  br label %88

88:                                               ; preds = %82, %80
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = icmp ult i32 %4, 4
  br i1 %89, label %90, label %96

90:                                               ; preds = %88
  %91 = add nuw nsw i32 %4, 4
  %92 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %91
  %93 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %94 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %95 = fadd contract float %93, %94
  store float %95, float addrspace(3)* %27, align 4, !tbaa !5
  br label %96

96:                                               ; preds = %90, %88
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %97 = icmp ult i32 %4, 2
  br i1 %97, label %98, label %104

98:                                               ; preds = %96
  %99 = add nuw nsw i32 %4, 2
  %100 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %99
  %101 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %102 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %103 = fadd contract float %101, %102
  store float %103, float addrspace(3)* %27, align 4, !tbaa !5
  br label %104

104:                                              ; preds = %98, %96
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %105 = icmp eq i32 %4, 0
  br i1 %105, label %106, label %115

106:                                              ; preds = %104
  %107 = add nuw nsw i32 %4, 1
  %108 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 %107
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !5
  %110 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %111 = fadd contract float %109, %110
  store float %111, float addrspace(3)* %27, align 4, !tbaa !5
  %112 = load float, float addrspace(3)* getelementptr inbounds ([2048 x float], [2048 x float] addrspace(3)* @_ZZ5totalPfS_iE7partSum, i32 0, i32 0), align 16, !tbaa !5
  %113 = zext i32 %5 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  store float %112, float addrspace(1)* %114, align 4, !tbaa !5
  br label %115

115:                                              ; preds = %104, %106
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
