; ModuleID = '../data/hip_kernels/2850/4/main.cu'
source_filename = "../data/hip_kernels/2850/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16
@_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21OptimizedMMKernel_2_8PfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %5
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %6
  %22 = udiv i32 %3, %12
  %23 = icmp sgt i32 %22, 0
  %24 = mul nsw i32 %21, %3
  br i1 %23, label %25, label %45

25:                                               ; preds = %4
  %26 = add i32 %24, %5
  %27 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA, i32 0, i32 %6, i32 %5
  %28 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB, i32 0, i32 %6, i32 %5
  %29 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA, i32 0, i32 %6, i32 0
  %30 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB, i32 0, i32 0, i32 %5
  %31 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA, i32 0, i32 %6, i32 1
  %32 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB, i32 0, i32 1, i32 %5
  %33 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA, i32 0, i32 %6, i32 2
  %34 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB, i32 0, i32 2, i32 %5
  %35 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA, i32 0, i32 %6, i32 3
  %36 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB, i32 0, i32 3, i32 %5
  %37 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA, i32 0, i32 %6, i32 4
  %38 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB, i32 0, i32 4, i32 %5
  %39 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA, i32 0, i32 %6, i32 5
  %40 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB, i32 0, i32 5, i32 %5
  %41 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA, i32 0, i32 %6, i32 6
  %42 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB, i32 0, i32 6, i32 %5
  %43 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedA, i32 0, i32 %6, i32 7
  %44 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ21OptimizedMMKernel_2_8PfS_S_iE7sharedB, i32 0, i32 7, i32 %5
  br label %50

45:                                               ; preds = %50, %4
  %46 = phi float [ 0.000000e+00, %4 ], [ %95, %50 ]
  %47 = add nsw i32 %24, %14
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  store float %46, float addrspace(1)* %49, align 4, !tbaa !7
  ret void

50:                                               ; preds = %25, %50
  %51 = phi i32 [ 0, %25 ], [ %96, %50 ]
  %52 = phi float [ 0.000000e+00, %25 ], [ %95, %50 ]
  %53 = shl nsw i32 %51, 3
  %54 = add i32 %26, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %57, float addrspace(3)* %27, align 4, !tbaa !7
  %58 = add nuw i32 %53, %6
  %59 = mul i32 %58, %3
  %60 = add nsw i32 %59, %14
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %63, float addrspace(3)* %28, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = load float, float addrspace(3)* %29, align 16, !tbaa !7
  %65 = load float, float addrspace(3)* %30, align 4, !tbaa !7
  %66 = fmul contract float %64, %65
  %67 = fadd contract float %52, %66
  %68 = load float, float addrspace(3)* %31, align 4, !tbaa !7
  %69 = load float, float addrspace(3)* %32, align 4, !tbaa !7
  %70 = fmul contract float %68, %69
  %71 = fadd contract float %67, %70
  %72 = load float, float addrspace(3)* %33, align 8, !tbaa !7
  %73 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %74 = fmul contract float %72, %73
  %75 = fadd contract float %71, %74
  %76 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %77 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %78 = fmul contract float %76, %77
  %79 = fadd contract float %75, %78
  %80 = load float, float addrspace(3)* %37, align 16, !tbaa !7
  %81 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %82 = fmul contract float %80, %81
  %83 = fadd contract float %79, %82
  %84 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %85 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %86 = fmul contract float %84, %85
  %87 = fadd contract float %83, %86
  %88 = load float, float addrspace(3)* %41, align 8, !tbaa !7
  %89 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %90 = fmul contract float %88, %89
  %91 = fadd contract float %87, %90
  %92 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %93 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %94 = fmul contract float %92, %93
  %95 = fadd contract float %91, %94
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = add nuw nsw i32 %51, 1
  %97 = icmp eq i32 %96, %22
  br i1 %97, label %45, label %50, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
