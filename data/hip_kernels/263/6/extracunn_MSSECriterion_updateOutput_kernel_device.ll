; ModuleID = '../data/hip_kernels/263/6/main.cu'
source_filename = "../data/hip_kernels/263/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z43extracunn_MSSECriterion_updateOutput_kernelPfS_S_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul nsw i32 %6, %4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %1, i64 %8
  %10 = getelementptr inbounds float, float addrspace(1)* %2, i64 %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %11
  store float 0.000000e+00, float addrspace(3)* %17, align 4, !tbaa !7
  %18 = icmp slt i32 %11, %4
  br i1 %18, label %27, label %20

19:                                               ; preds = %27
  store float %36, float addrspace(3)* %17, align 4, !tbaa !7
  br label %20

20:                                               ; preds = %19, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp eq i32 %11, 0
  br i1 %21, label %22, label %99

22:                                               ; preds = %20
  %23 = and i32 %16, 7
  %24 = icmp ult i16 %15, 8
  br i1 %24, label %39, label %25

25:                                               ; preds = %22
  %26 = and i32 %16, 2040
  br label %61

27:                                               ; preds = %5, %27
  %28 = phi float [ %36, %27 ], [ 0.000000e+00, %5 ]
  %29 = phi i32 [ %37, %27 ], [ %11, %5 ]
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %9, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = getelementptr inbounds float, float addrspace(1)* %10, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = fsub contract float %32, %34
  %36 = fadd contract float %28, %35
  %37 = add nuw nsw i32 %29, %16
  %38 = icmp slt i32 %37, %4
  br i1 %38, label %27, label %19, !llvm.loop !11

39:                                               ; preds = %61, %22
  %40 = phi float [ undef, %22 ], [ %95, %61 ]
  %41 = phi i32 [ 0, %22 ], [ %96, %61 ]
  %42 = phi float [ 0.000000e+00, %22 ], [ %95, %61 ]
  %43 = icmp eq i32 %23, 0
  br i1 %43, label %54, label %44

44:                                               ; preds = %39, %44
  %45 = phi i32 [ %51, %44 ], [ %41, %39 ]
  %46 = phi float [ %50, %44 ], [ %42, %39 ]
  %47 = phi i32 [ %52, %44 ], [ 0, %39 ]
  %48 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %45
  %49 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %50 = fadd contract float %49, %46
  %51 = add nuw nsw i32 %45, 1
  %52 = add i32 %47, 1
  %53 = icmp eq i32 %52, %23
  br i1 %53, label %54, label %44, !llvm.loop !13

54:                                               ; preds = %44, %39
  %55 = phi float [ %40, %39 ], [ %50, %44 ]
  %56 = fmul contract float %55, %55
  %57 = mul nsw i32 %4, -2
  %58 = mul nsw i32 %57, %4
  %59 = sitofp i32 %58 to float
  %60 = fdiv contract float %56, %59
  store float %60, float addrspace(1)* %0, align 4, !tbaa !7
  br label %99

61:                                               ; preds = %61, %25
  %62 = phi i32 [ 0, %25 ], [ %96, %61 ]
  %63 = phi float [ 0.000000e+00, %25 ], [ %95, %61 ]
  %64 = phi i32 [ 0, %25 ], [ %97, %61 ]
  %65 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %62
  %66 = load float, float addrspace(3)* %65, align 16, !tbaa !7
  %67 = fadd contract float %66, %63
  %68 = or i32 %62, 1
  %69 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %71 = fadd contract float %70, %67
  %72 = or i32 %62, 2
  %73 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 8, !tbaa !7
  %75 = fadd contract float %74, %71
  %76 = or i32 %62, 3
  %77 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %76
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !7
  %79 = fadd contract float %78, %75
  %80 = or i32 %62, 4
  %81 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 16, !tbaa !7
  %83 = fadd contract float %82, %79
  %84 = or i32 %62, 5
  %85 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !7
  %87 = fadd contract float %86, %83
  %88 = or i32 %62, 6
  %89 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %88
  %90 = load float, float addrspace(3)* %89, align 8, !tbaa !7
  %91 = fadd contract float %90, %87
  %92 = or i32 %62, 7
  %93 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ43extracunn_MSSECriterion_updateOutput_kernelPfS_S_iiE6buffer, i32 0, i32 %92
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %95 = fadd contract float %94, %91
  %96 = add nuw nsw i32 %62, 8
  %97 = add i32 %64, 8
  %98 = icmp eq i32 %97, %26
  br i1 %98, label %39, label %61, !llvm.loop !15

99:                                               ; preds = %54, %20
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
