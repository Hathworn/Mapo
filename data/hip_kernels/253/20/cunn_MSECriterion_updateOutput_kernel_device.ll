; ModuleID = '../data/hip_kernels/253/20/main.cu'
source_filename = "../data/hip_kernels/253/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z37cunn_MSECriterion_updateOutput_kernelPfS_S_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul nsw i32 %7, %4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %1, i64 %9
  %11 = getelementptr inbounds float, float addrspace(1)* %2, i64 %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %18, align 4, !tbaa !7
  %19 = icmp slt i32 %12, %4
  br i1 %19, label %28, label %21

20:                                               ; preds = %28
  store float %38, float addrspace(3)* %18, align 4, !tbaa !7
  br label %21

21:                                               ; preds = %20, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = icmp eq i32 %12, 0
  br i1 %22, label %23, label %100

23:                                               ; preds = %21
  %24 = and i32 %17, 7
  %25 = icmp ult i16 %16, 8
  br i1 %25, label %41, label %26

26:                                               ; preds = %23
  %27 = and i32 %17, 2040
  br label %59

28:                                               ; preds = %6, %28
  %29 = phi float [ %38, %28 ], [ 0.000000e+00, %6 ]
  %30 = phi i32 [ %39, %28 ], [ %12, %6 ]
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %10, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = getelementptr inbounds float, float addrspace(1)* %11, i64 %31
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = fsub contract float %33, %35
  %37 = fmul contract float %36, %36
  %38 = fadd contract float %29, %37
  %39 = add nuw nsw i32 %30, %17
  %40 = icmp slt i32 %39, %4
  br i1 %40, label %28, label %20, !llvm.loop !11

41:                                               ; preds = %59, %23
  %42 = phi float [ undef, %23 ], [ %93, %59 ]
  %43 = phi i32 [ 0, %23 ], [ %94, %59 ]
  %44 = phi float [ 0.000000e+00, %23 ], [ %93, %59 ]
  %45 = icmp eq i32 %24, 0
  br i1 %45, label %56, label %46

46:                                               ; preds = %41, %46
  %47 = phi i32 [ %53, %46 ], [ %43, %41 ]
  %48 = phi float [ %52, %46 ], [ %44, %41 ]
  %49 = phi i32 [ %54, %46 ], [ 0, %41 ]
  %50 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %47
  %51 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %52 = fadd contract float %51, %48
  %53 = add nuw nsw i32 %47, 1
  %54 = add i32 %49, 1
  %55 = icmp eq i32 %54, %24
  br i1 %55, label %56, label %46, !llvm.loop !13

56:                                               ; preds = %46, %41
  %57 = phi float [ %42, %41 ], [ %52, %46 ]
  store float %57, float addrspace(1)* %0, align 4, !tbaa !7
  %58 = icmp eq i32 %5, 0
  br i1 %58, label %100, label %97

59:                                               ; preds = %59, %26
  %60 = phi i32 [ 0, %26 ], [ %94, %59 ]
  %61 = phi float [ 0.000000e+00, %26 ], [ %93, %59 ]
  %62 = phi i32 [ 0, %26 ], [ %95, %59 ]
  %63 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %60
  %64 = load float, float addrspace(3)* %63, align 16, !tbaa !7
  %65 = fadd contract float %64, %61
  %66 = or i32 %60, 1
  %67 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %66
  %68 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %69 = fadd contract float %68, %65
  %70 = or i32 %60, 2
  %71 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %70
  %72 = load float, float addrspace(3)* %71, align 8, !tbaa !7
  %73 = fadd contract float %72, %69
  %74 = or i32 %60, 3
  %75 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %77 = fadd contract float %76, %73
  %78 = or i32 %60, 4
  %79 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %78
  %80 = load float, float addrspace(3)* %79, align 16, !tbaa !7
  %81 = fadd contract float %80, %77
  %82 = or i32 %60, 5
  %83 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %82
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %85 = fadd contract float %84, %81
  %86 = or i32 %60, 6
  %87 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %86
  %88 = load float, float addrspace(3)* %87, align 8, !tbaa !7
  %89 = fadd contract float %88, %85
  %90 = or i32 %60, 7
  %91 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ37cunn_MSECriterion_updateOutput_kernelPfS_S_iiiE6buffer, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !7
  %93 = fadd contract float %92, %89
  %94 = add nuw nsw i32 %60, 8
  %95 = add i32 %62, 8
  %96 = icmp eq i32 %95, %27
  br i1 %96, label %41, label %59, !llvm.loop !15

97:                                               ; preds = %56
  %98 = sitofp i32 %4 to float
  %99 = fdiv contract float %57, %98
  store float %99, float addrspace(1)* %0, align 4, !tbaa !7
  br label %100

100:                                              ; preds = %56, %97, %21
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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
