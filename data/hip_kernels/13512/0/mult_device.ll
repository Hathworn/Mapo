; ModuleID = '../data/hip_kernels/13512/0/main.cu'
source_filename = "../data/hip_kernels/13512/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4multPfS_iiiE2RS = internal unnamed_addr addrspace(3) global [8 x [64 x float]] undef, align 16
@_ZZ4multPfS_iiiE2QK = internal unnamed_addr addrspace(3) global [8 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4multPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 3
  %10 = add i32 %9, %7
  %11 = add i32 %10, %4
  %12 = icmp slt i32 %11, %4
  %13 = icmp sgt i32 %11, %3
  %14 = select i1 %12, i1 true, i1 %13
  br i1 %14, label %102, label %15

15:                                               ; preds = %5
  %16 = icmp slt i32 %6, %2
  br i1 %16, label %17, label %25

17:                                               ; preds = %15
  %18 = add nuw nsw i32 %6, 1
  %19 = icmp eq i32 %6, 0
  %20 = add nsw i32 %4, -1
  %21 = mul nsw i32 %20, %2
  %22 = getelementptr inbounds [8 x float], [8 x float] addrspace(3)* @_ZZ4multPfS_iiiE2QK, i32 0, i32 %7
  %23 = add nsw i32 %11, -1
  %24 = mul nsw i32 %23, %2
  br label %29

25:                                               ; preds = %38, %15
  %26 = phi float [ 0.000000e+00, %15 ], [ %45, %38 ]
  %27 = getelementptr inbounds [8 x [64 x float]], [8 x [64 x float]] addrspace(3)* @_ZZ4multPfS_iiiE2RS, i32 0, i32 %7, i32 %6
  store float %26, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp ult i32 %6, 32
  br i1 %28, label %48, label %54

29:                                               ; preds = %17, %38
  %30 = phi i32 [ %18, %17 ], [ %46, %38 ]
  %31 = phi float [ 0.000000e+00, %17 ], [ %45, %38 ]
  %32 = add nsw i32 %30, -1
  br i1 %19, label %33, label %38

33:                                               ; preds = %29
  %34 = add nsw i32 %32, %21
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %37, float addrspace(3)* %22, align 4, !tbaa !5
  br label %38

38:                                               ; preds = %29, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %40 = add nsw i32 %32, %24
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !5, !amdgpu.noclobber !9
  %44 = fmul contract float %39, %43
  %45 = fadd contract float %31, %44
  %46 = add nuw nsw i32 %30, 64
  %47 = icmp sgt i32 %46, %2
  br i1 %47, label %25, label %29, !llvm.loop !10

48:                                               ; preds = %25
  %49 = add nuw nsw i32 %6, 32
  %50 = getelementptr inbounds [8 x [64 x float]], [8 x [64 x float]] addrspace(3)* @_ZZ4multPfS_iiiE2RS, i32 0, i32 %7, i32 %49
  %51 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %52 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %53 = fadd contract float %51, %52
  store float %53, float addrspace(3)* %27, align 4, !tbaa !5
  br label %54

54:                                               ; preds = %48, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = icmp ult i32 %6, 16
  br i1 %55, label %56, label %62

56:                                               ; preds = %54
  %57 = add nuw nsw i32 %6, 16
  %58 = getelementptr inbounds [8 x [64 x float]], [8 x [64 x float]] addrspace(3)* @_ZZ4multPfS_iiiE2RS, i32 0, i32 %7, i32 %57
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %60 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %61 = fadd contract float %59, %60
  store float %61, float addrspace(3)* %27, align 4, !tbaa !5
  br label %62

62:                                               ; preds = %56, %54
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ult i32 %6, 8
  br i1 %63, label %64, label %70

64:                                               ; preds = %62
  %65 = add nuw nsw i32 %6, 8
  %66 = getelementptr inbounds [8 x [64 x float]], [8 x [64 x float]] addrspace(3)* @_ZZ4multPfS_iiiE2RS, i32 0, i32 %7, i32 %65
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %68 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %69 = fadd contract float %67, %68
  store float %69, float addrspace(3)* %27, align 4, !tbaa !5
  br label %70

70:                                               ; preds = %64, %62
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = icmp ult i32 %6, 4
  br i1 %71, label %72, label %78

72:                                               ; preds = %70
  %73 = add nuw nsw i32 %6, 4
  %74 = getelementptr inbounds [8 x [64 x float]], [8 x [64 x float]] addrspace(3)* @_ZZ4multPfS_iiiE2RS, i32 0, i32 %7, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %76 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %77 = fadd contract float %75, %76
  store float %77, float addrspace(3)* %27, align 4, !tbaa !5
  br label %78

78:                                               ; preds = %72, %70
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = icmp ult i32 %6, 2
  br i1 %79, label %80, label %86

80:                                               ; preds = %78
  %81 = add nuw nsw i32 %6, 2
  %82 = getelementptr inbounds [8 x [64 x float]], [8 x [64 x float]] addrspace(3)* @_ZZ4multPfS_iiiE2RS, i32 0, i32 %7, i32 %81
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %84 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %85 = fadd contract float %83, %84
  store float %85, float addrspace(3)* %27, align 4, !tbaa !5
  br label %86

86:                                               ; preds = %80, %78
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = icmp eq i32 %6, 0
  br i1 %87, label %88, label %102

88:                                               ; preds = %86
  %89 = add nuw nsw i32 %6, 1
  %90 = getelementptr inbounds [8 x [64 x float]], [8 x [64 x float]] addrspace(3)* @_ZZ4multPfS_iiiE2RS, i32 0, i32 %7, i32 %89
  %91 = load float, float addrspace(3)* %90, align 4, !tbaa !5
  %92 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %93 = fadd contract float %91, %92
  store float %93, float addrspace(3)* %27, align 4, !tbaa !5
  %94 = getelementptr inbounds [8 x [64 x float]], [8 x [64 x float]] addrspace(3)* @_ZZ4multPfS_iiiE2RS, i32 0, i32 %7, i32 0
  %95 = load float, float addrspace(3)* %94, align 16, !tbaa !5
  %96 = add nsw i32 %11, -1
  %97 = mul nsw i32 %96, %3
  %98 = add nsw i32 %4, -1
  %99 = add nsw i32 %98, %97
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  store float %95, float addrspace(1)* %101, align 4, !tbaa !5
  br label %102

102:                                              ; preds = %86, %88, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
