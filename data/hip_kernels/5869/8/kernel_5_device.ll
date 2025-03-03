; ModuleID = '../data/hip_kernels/5869/8/main.cu'
source_filename = "../data/hip_kernels/5869/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8kernel_5PfS_iE6s_data = internal addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8kernel_5PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 1
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_5PfS_iE6s_data, i32 0, i32 %4
  %15 = addrspacecast float addrspace(3)* %14 to float*
  store volatile float 0.000000e+00, float* %15, align 4, !tbaa !7
  %16 = icmp slt i32 %13, %2
  br i1 %16, label %17, label %21

17:                                               ; preds = %3
  %18 = sext i32 %13 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  store volatile float %20, float* %15, align 4, !tbaa !7
  br label %21

21:                                               ; preds = %17, %3
  %22 = add i32 %13, %10
  %23 = icmp ult i32 %22, %2
  br i1 %23, label %24, label %30

24:                                               ; preds = %21
  %25 = zext i32 %22 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = load volatile float, float* %15, align 4, !tbaa !7
  %29 = fadd contract float %27, %28
  store volatile float %29, float* %15, align 4, !tbaa !7
  br label %30

30:                                               ; preds = %24, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp ugt i16 %9, 127
  br i1 %31, label %34, label %32

32:                                               ; preds = %45, %30
  %33 = icmp ult i32 %4, 32
  br i1 %33, label %47, label %84

34:                                               ; preds = %30, %45
  %35 = phi i32 [ %36, %45 ], [ %10, %30 ]
  %36 = lshr i32 %35, 1
  %37 = icmp ult i32 %4, %36
  br i1 %37, label %38, label %45

38:                                               ; preds = %34
  %39 = add nuw nsw i32 %36, %4
  %40 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_5PfS_iE6s_data, i32 0, i32 %39
  %41 = addrspacecast float addrspace(3)* %40 to float*
  %42 = load volatile float, float* %41, align 4, !tbaa !7
  %43 = load volatile float, float* %15, align 4, !tbaa !7
  %44 = fadd contract float %42, %43
  store volatile float %44, float* %15, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %38, %34
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp ugt i32 %35, 255
  br i1 %46, label %34, label %32, !llvm.loop !11

47:                                               ; preds = %32
  %48 = add nuw nsw i32 %4, 32
  %49 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_5PfS_iE6s_data, i32 0, i32 %48
  %50 = addrspacecast float addrspace(3)* %49 to float*
  %51 = load volatile float, float* %50, align 4, !tbaa !7
  %52 = load volatile float, float* %15, align 4, !tbaa !7
  %53 = fadd contract float %51, %52
  store volatile float %53, float* %15, align 4, !tbaa !7
  %54 = add nuw nsw i32 %4, 16
  %55 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_5PfS_iE6s_data, i32 0, i32 %54
  %56 = addrspacecast float addrspace(3)* %55 to float*
  %57 = load volatile float, float* %56, align 4, !tbaa !7
  %58 = load volatile float, float* %15, align 4, !tbaa !7
  %59 = fadd contract float %57, %58
  store volatile float %59, float* %15, align 4, !tbaa !7
  %60 = add nuw nsw i32 %4, 8
  %61 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_5PfS_iE6s_data, i32 0, i32 %60
  %62 = addrspacecast float addrspace(3)* %61 to float*
  %63 = load volatile float, float* %62, align 4, !tbaa !7
  %64 = load volatile float, float* %15, align 4, !tbaa !7
  %65 = fadd contract float %63, %64
  store volatile float %65, float* %15, align 4, !tbaa !7
  %66 = add nuw nsw i32 %4, 4
  %67 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_5PfS_iE6s_data, i32 0, i32 %66
  %68 = addrspacecast float addrspace(3)* %67 to float*
  %69 = load volatile float, float* %68, align 4, !tbaa !7
  %70 = load volatile float, float* %15, align 4, !tbaa !7
  %71 = fadd contract float %69, %70
  store volatile float %71, float* %15, align 4, !tbaa !7
  %72 = add nuw nsw i32 %4, 2
  %73 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_5PfS_iE6s_data, i32 0, i32 %72
  %74 = addrspacecast float addrspace(3)* %73 to float*
  %75 = load volatile float, float* %74, align 4, !tbaa !7
  %76 = load volatile float, float* %15, align 4, !tbaa !7
  %77 = fadd contract float %75, %76
  store volatile float %77, float* %15, align 4, !tbaa !7
  %78 = add nuw nsw i32 %4, 1
  %79 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ8kernel_5PfS_iE6s_data, i32 0, i32 %78
  %80 = addrspacecast float addrspace(3)* %79 to float*
  %81 = load volatile float, float* %80, align 4, !tbaa !7
  %82 = load volatile float, float* %15, align 4, !tbaa !7
  %83 = fadd contract float %81, %82
  store volatile float %83, float* %15, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %47, %32
  %85 = icmp eq i32 %4, 0
  br i1 %85, label %86, label %90

86:                                               ; preds = %84
  %87 = load volatile float, float* %15, align 4, !tbaa !7
  %88 = zext i32 %5 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  store float %87, float addrspace(1)* %89, align 4, !tbaa !7
  br label %90

90:                                               ; preds = %86, %84
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
