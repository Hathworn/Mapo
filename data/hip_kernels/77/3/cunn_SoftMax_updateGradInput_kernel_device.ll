; ModuleID = '../data/hip_kernels/77/3/main.cu'
source_filename = "../data/hip_kernels/77/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z35cunn_SoftMax_updateGradInput_kernelPfS_S_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul nsw i32 %6, %4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %0, i64 %8
  %10 = getelementptr inbounds float, float addrspace(1)* %1, i64 %8
  %11 = getelementptr inbounds float, float addrspace(1)* %2, i64 %8
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %18, align 4, !tbaa !7
  %19 = icmp slt i32 %12, %4
  br i1 %19, label %28, label %21

20:                                               ; preds = %28
  store float %37, float addrspace(3)* %18, align 4, !tbaa !7
  br label %21

21:                                               ; preds = %20, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = icmp eq i32 %12, 0
  br i1 %22, label %23, label %95

23:                                               ; preds = %21
  %24 = and i32 %17, 7
  %25 = icmp ult i16 %16, 8
  br i1 %25, label %40, label %26

26:                                               ; preds = %23
  %27 = and i32 %17, 2040
  br label %57

28:                                               ; preds = %5, %28
  %29 = phi float [ %37, %28 ], [ 0.000000e+00, %5 ]
  %30 = phi i32 [ %38, %28 ], [ %12, %5 ]
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %11, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = getelementptr inbounds float, float addrspace(1)* %10, i64 %31
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = fmul contract float %33, %35
  %37 = fadd contract float %29, %36
  %38 = add nuw nsw i32 %30, %17
  %39 = icmp slt i32 %38, %4
  br i1 %39, label %28, label %20, !llvm.loop !11

40:                                               ; preds = %57, %23
  %41 = phi float [ undef, %23 ], [ %91, %57 ]
  %42 = phi i32 [ 0, %23 ], [ %92, %57 ]
  %43 = phi float [ 0.000000e+00, %23 ], [ %91, %57 ]
  %44 = icmp eq i32 %24, 0
  br i1 %44, label %55, label %45

45:                                               ; preds = %40, %45
  %46 = phi i32 [ %52, %45 ], [ %42, %40 ]
  %47 = phi float [ %51, %45 ], [ %43, %40 ]
  %48 = phi i32 [ %53, %45 ], [ 0, %40 ]
  %49 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %46
  %50 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %51 = fadd contract float %47, %50
  %52 = add nuw nsw i32 %46, 1
  %53 = add i32 %48, 1
  %54 = icmp eq i32 %53, %24
  br i1 %54, label %55, label %45, !llvm.loop !13

55:                                               ; preds = %45, %40
  %56 = phi float [ %41, %40 ], [ %51, %45 ]
  store float %56, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 0), align 16, !tbaa !7
  br label %95

57:                                               ; preds = %57, %26
  %58 = phi i32 [ 0, %26 ], [ %92, %57 ]
  %59 = phi float [ 0.000000e+00, %26 ], [ %91, %57 ]
  %60 = phi i32 [ 0, %26 ], [ %93, %57 ]
  %61 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %58
  %62 = load float, float addrspace(3)* %61, align 16, !tbaa !7
  %63 = fadd contract float %59, %62
  %64 = or i32 %58, 1
  %65 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %64
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %67 = fadd contract float %63, %66
  %68 = or i32 %58, 2
  %69 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 8, !tbaa !7
  %71 = fadd contract float %67, %70
  %72 = or i32 %58, 3
  %73 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %75 = fadd contract float %71, %74
  %76 = or i32 %58, 4
  %77 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %76
  %78 = load float, float addrspace(3)* %77, align 16, !tbaa !7
  %79 = fadd contract float %75, %78
  %80 = or i32 %58, 5
  %81 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !7
  %83 = fadd contract float %79, %82
  %84 = or i32 %58, 6
  %85 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 8, !tbaa !7
  %87 = fadd contract float %83, %86
  %88 = or i32 %58, 7
  %89 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 %88
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !7
  %91 = fadd contract float %87, %90
  %92 = add nuw nsw i32 %58, 8
  %93 = add i32 %60, 8
  %94 = icmp eq i32 %93, %27
  br i1 %94, label %40, label %57, !llvm.loop !15

95:                                               ; preds = %55, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiE6buffer, i32 0, i32 0), align 16, !tbaa !7
  br i1 %19, label %98, label %97

97:                                               ; preds = %98, %95
  ret void

98:                                               ; preds = %95, %98
  %99 = phi i32 [ %108, %98 ], [ %12, %95 ]
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %10, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = getelementptr inbounds float, float addrspace(1)* %11, i64 %100
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = fsub contract float %104, %96
  %106 = fmul contract float %102, %105
  %107 = getelementptr inbounds float, float addrspace(1)* %9, i64 %100
  store float %106, float addrspace(1)* %107, align 4, !tbaa !7
  %108 = add nuw nsw i32 %99, %17
  %109 = icmp slt i32 %108, %4
  br i1 %109, label %98, label %97, !llvm.loop !16
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
!16 = distinct !{!16, !12}
