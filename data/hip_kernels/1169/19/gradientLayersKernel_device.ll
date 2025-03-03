; ModuleID = '../data/hip_kernels/1169/19/main.cu'
source_filename = "../data/hip_kernels/1169/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20gradientLayersKernelPfS_iiiE6s_Data = internal unnamed_addr addrspace(3) global [8 x [8 x [25 x float]]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20gradientLayersKernelPfS_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 3
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 3
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %15 = shl i32 %14, 3
  %16 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %17 = add nsw i32 %16, -8
  %18 = add i32 %17, %15
  %19 = mul nsw i32 %18, %3
  %20 = add nsw i32 %13, %19
  %21 = mul nsw i32 %20, %2
  %22 = add nsw i32 %9, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = mul nsw i32 %3, %2
  %26 = shl nsw i32 %25, 3
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %24, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = add nuw nsw i32 %16, 8
  %31 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %30
  store float %29, float addrspace(3)* %31, align 4, !tbaa !5
  %32 = mul nsw i32 %25, 12
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %24, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = add nuw nsw i32 %16, 12
  %37 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %36
  store float %35, float addrspace(3)* %37, align 4, !tbaa !5
  %38 = icmp sgt i32 %18, -1
  br i1 %38, label %39, label %41

39:                                               ; preds = %5
  %40 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %41

41:                                               ; preds = %5, %39
  %42 = phi contract float [ %40, %39 ], [ 0.000000e+00, %5 ]
  %43 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %16
  store float %42, float addrspace(3)* %43, align 4, !tbaa !5
  %44 = icmp sgt i32 %18, -5
  br i1 %44, label %45, label %50

45:                                               ; preds = %41
  %46 = shl nsw i32 %25, 2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %24, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %50

50:                                               ; preds = %45, %41
  %51 = phi contract float [ %49, %45 ], [ 0.000000e+00, %41 ]
  %52 = add nuw nsw i32 %16, 4
  %53 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %52
  store float %51, float addrspace(3)* %53, align 4, !tbaa !5
  %54 = add nsw i32 %18, 16
  %55 = icmp slt i32 %54, %4
  br i1 %55, label %56, label %61

56:                                               ; preds = %50
  %57 = shl nsw i32 %25, 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %24, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %61

61:                                               ; preds = %50, %56
  %62 = phi contract float [ %60, %56 ], [ 0.000000e+00, %50 ]
  %63 = add nuw nsw i32 %16, 16
  %64 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %63
  store float %62, float addrspace(3)* %64, align 4, !tbaa !5
  %65 = add nsw i32 %18, 20
  %66 = icmp slt i32 %65, %4
  br i1 %66, label %67, label %72

67:                                               ; preds = %61
  %68 = mul nsw i32 %25, 20
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %24, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %72

72:                                               ; preds = %67, %61
  %73 = phi contract float [ %71, %67 ], [ 0.000000e+00, %61 ]
  %74 = add nuw nsw i32 %16, 20
  %75 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %74
  store float %73, float addrspace(3)* %75, align 4, !tbaa !5
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = add nuw nsw i32 %16, 9
  %78 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %77
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %80 = fadd contract float %79, 0.000000e+00
  %81 = add nuw nsw i32 %16, 7
  %82 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %81
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %84 = fsub contract float %80, %83
  %85 = fmul contract float %84, 5.000000e-01
  %86 = getelementptr inbounds float, float addrspace(1)* %76, i64 %27
  store float %85, float addrspace(1)* %86, align 4, !tbaa !5
  %87 = add nuw nsw i32 %16, 13
  %88 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %87
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %90 = fadd contract float %89, 0.000000e+00
  %91 = add nuw nsw i32 %16, 11
  %92 = getelementptr inbounds [8 x [8 x [25 x float]]], [8 x [8 x [25 x float]]] addrspace(3)* @_ZZ20gradientLayersKernelPfS_iiiE6s_Data, i32 0, i32 %8, i32 %12, i32 %91
  %93 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %94 = fsub contract float %90, %93
  %95 = fmul contract float %94, 5.000000e-01
  %96 = getelementptr inbounds float, float addrspace(1)* %76, i64 %33
  store float %95, float addrspace(1)* %96, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
