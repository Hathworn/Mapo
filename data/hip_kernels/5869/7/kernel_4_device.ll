; ModuleID = '../data/hip_kernels/5869/7/main.cu'
source_filename = "../data/hip_kernels/5869/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8kernel_4PfS_iE6s_data = internal addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8kernel_4PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_4PfS_iE6s_data, i32 0, i32 %4
  %14 = addrspacecast float addrspace(3)* %13 to float*
  store volatile float 0.000000e+00, float* %14, align 4, !tbaa !7
  %15 = icmp slt i32 %12, %2
  br i1 %15, label %16, label %20

16:                                               ; preds = %3
  %17 = sext i32 %12 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  store volatile float %19, float* %14, align 4, !tbaa !7
  br label %20

20:                                               ; preds = %16, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp ugt i16 %9, 127
  br i1 %21, label %24, label %22

22:                                               ; preds = %35, %20
  %23 = icmp ult i32 %4, 32
  br i1 %23, label %37, label %74

24:                                               ; preds = %20, %35
  %25 = phi i32 [ %26, %35 ], [ %10, %20 ]
  %26 = lshr i32 %25, 1
  %27 = icmp ult i32 %4, %26
  br i1 %27, label %28, label %35

28:                                               ; preds = %24
  %29 = add nuw nsw i32 %26, %4
  %30 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_4PfS_iE6s_data, i32 0, i32 %29
  %31 = addrspacecast float addrspace(3)* %30 to float*
  %32 = load volatile float, float* %31, align 4, !tbaa !7
  %33 = load volatile float, float* %14, align 4, !tbaa !7
  %34 = fadd contract float %32, %33
  store volatile float %34, float* %14, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %28, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp ugt i32 %25, 255
  br i1 %36, label %24, label %22, !llvm.loop !11

37:                                               ; preds = %22
  %38 = add nuw nsw i32 %4, 32
  %39 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_4PfS_iE6s_data, i32 0, i32 %38
  %40 = addrspacecast float addrspace(3)* %39 to float*
  %41 = load volatile float, float* %40, align 4, !tbaa !7
  %42 = load volatile float, float* %14, align 4, !tbaa !7
  %43 = fadd contract float %41, %42
  store volatile float %43, float* %14, align 4, !tbaa !7
  %44 = add nuw nsw i32 %4, 16
  %45 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_4PfS_iE6s_data, i32 0, i32 %44
  %46 = addrspacecast float addrspace(3)* %45 to float*
  %47 = load volatile float, float* %46, align 4, !tbaa !7
  %48 = load volatile float, float* %14, align 4, !tbaa !7
  %49 = fadd contract float %47, %48
  store volatile float %49, float* %14, align 4, !tbaa !7
  %50 = add nuw nsw i32 %4, 8
  %51 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_4PfS_iE6s_data, i32 0, i32 %50
  %52 = addrspacecast float addrspace(3)* %51 to float*
  %53 = load volatile float, float* %52, align 4, !tbaa !7
  %54 = load volatile float, float* %14, align 4, !tbaa !7
  %55 = fadd contract float %53, %54
  store volatile float %55, float* %14, align 4, !tbaa !7
  %56 = add nuw nsw i32 %4, 4
  %57 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_4PfS_iE6s_data, i32 0, i32 %56
  %58 = addrspacecast float addrspace(3)* %57 to float*
  %59 = load volatile float, float* %58, align 4, !tbaa !7
  %60 = load volatile float, float* %14, align 4, !tbaa !7
  %61 = fadd contract float %59, %60
  store volatile float %61, float* %14, align 4, !tbaa !7
  %62 = add nuw nsw i32 %4, 2
  %63 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_4PfS_iE6s_data, i32 0, i32 %62
  %64 = addrspacecast float addrspace(3)* %63 to float*
  %65 = load volatile float, float* %64, align 4, !tbaa !7
  %66 = load volatile float, float* %14, align 4, !tbaa !7
  %67 = fadd contract float %65, %66
  store volatile float %67, float* %14, align 4, !tbaa !7
  %68 = add nuw nsw i32 %4, 1
  %69 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_4PfS_iE6s_data, i32 0, i32 %68
  %70 = addrspacecast float addrspace(3)* %69 to float*
  %71 = load volatile float, float* %70, align 4, !tbaa !7
  %72 = load volatile float, float* %14, align 4, !tbaa !7
  %73 = fadd contract float %71, %72
  store volatile float %73, float* %14, align 4, !tbaa !7
  br label %74

74:                                               ; preds = %37, %22
  %75 = icmp eq i32 %4, 0
  br i1 %75, label %76, label %80

76:                                               ; preds = %74
  %77 = load volatile float, float* %14, align 4, !tbaa !7
  %78 = zext i32 %5 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  store float %77, float addrspace(1)* %79, align 4, !tbaa !7
  br label %80

80:                                               ; preds = %76, %74
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
