; ModuleID = '../data/hip_kernels/13132/1/main.cu'
source_filename = "../data/hip_kernels/13132/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z35cunn_SoftMax_updateGradInput_kernelPfS_S_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul i32 %7, %4
  %9 = mul i32 %8, %5
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %0, i64 %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %11, i64 %13
  %15 = getelementptr inbounds float, float addrspace(1)* %1, i64 %10
  %16 = getelementptr inbounds float, float addrspace(1)* %15, i64 %13
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 %10
  %18 = getelementptr inbounds float, float addrspace(1)* %17, i64 %13
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %19
  store float 0.000000e+00, float addrspace(3)* %25, align 4, !tbaa !7
  %26 = icmp slt i32 %19, %4
  br i1 %26, label %35, label %28

27:                                               ; preds = %35
  store float %45, float addrspace(3)* %25, align 4, !tbaa !7
  br label %28

28:                                               ; preds = %27, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = icmp eq i32 %19, 0
  br i1 %29, label %30, label %103

30:                                               ; preds = %28
  %31 = and i32 %24, 7
  %32 = icmp ult i16 %23, 8
  br i1 %32, label %48, label %33

33:                                               ; preds = %30
  %34 = and i32 %24, 2040
  br label %65

35:                                               ; preds = %6, %35
  %36 = phi float [ %45, %35 ], [ 0.000000e+00, %6 ]
  %37 = phi i32 [ %46, %35 ], [ %19, %6 ]
  %38 = mul nsw i32 %37, %5
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %18, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %42 = getelementptr inbounds float, float addrspace(1)* %16, i64 %39
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = fmul contract float %41, %43
  %45 = fadd contract float %36, %44
  %46 = add nuw nsw i32 %37, %24
  %47 = icmp slt i32 %46, %4
  br i1 %47, label %35, label %27, !llvm.loop !11

48:                                               ; preds = %65, %30
  %49 = phi float [ undef, %30 ], [ %99, %65 ]
  %50 = phi i32 [ 0, %30 ], [ %100, %65 ]
  %51 = phi float [ 0.000000e+00, %30 ], [ %99, %65 ]
  %52 = icmp eq i32 %31, 0
  br i1 %52, label %63, label %53

53:                                               ; preds = %48, %53
  %54 = phi i32 [ %60, %53 ], [ %50, %48 ]
  %55 = phi float [ %59, %53 ], [ %51, %48 ]
  %56 = phi i32 [ %61, %53 ], [ 0, %48 ]
  %57 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %54
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %59 = fadd contract float %55, %58
  %60 = add nuw nsw i32 %54, 1
  %61 = add i32 %56, 1
  %62 = icmp eq i32 %61, %31
  br i1 %62, label %63, label %53, !llvm.loop !13

63:                                               ; preds = %53, %48
  %64 = phi float [ %49, %48 ], [ %59, %53 ]
  store float %64, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 0), align 16, !tbaa !7
  br label %103

65:                                               ; preds = %65, %33
  %66 = phi i32 [ 0, %33 ], [ %100, %65 ]
  %67 = phi float [ 0.000000e+00, %33 ], [ %99, %65 ]
  %68 = phi i32 [ 0, %33 ], [ %101, %65 ]
  %69 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %66
  %70 = load float, float addrspace(3)* %69, align 16, !tbaa !7
  %71 = fadd contract float %67, %70
  %72 = or i32 %66, 1
  %73 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %75 = fadd contract float %71, %74
  %76 = or i32 %66, 2
  %77 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %76
  %78 = load float, float addrspace(3)* %77, align 8, !tbaa !7
  %79 = fadd contract float %75, %78
  %80 = or i32 %66, 3
  %81 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !7
  %83 = fadd contract float %79, %82
  %84 = or i32 %66, 4
  %85 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 16, !tbaa !7
  %87 = fadd contract float %83, %86
  %88 = or i32 %66, 5
  %89 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %88
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !7
  %91 = fadd contract float %87, %90
  %92 = or i32 %66, 6
  %93 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %92
  %94 = load float, float addrspace(3)* %93, align 8, !tbaa !7
  %95 = fadd contract float %91, %94
  %96 = or i32 %66, 7
  %97 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 %96
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !7
  %99 = fadd contract float %95, %98
  %100 = add nuw nsw i32 %66, 8
  %101 = add i32 %68, 8
  %102 = icmp eq i32 %101, %34
  br i1 %102, label %48, label %65, !llvm.loop !15

103:                                              ; preds = %63, %28
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %104 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ35cunn_SoftMax_updateGradInput_kernelPfS_S_iiiE6buffer, i32 0, i32 0), align 16, !tbaa !7
  br i1 %26, label %106, label %105

105:                                              ; preds = %106, %103
  ret void

106:                                              ; preds = %103, %106
  %107 = phi i32 [ %117, %106 ], [ %19, %103 ]
  %108 = mul nsw i32 %107, %5
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %16, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = getelementptr inbounds float, float addrspace(1)* %18, i64 %109
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = fsub contract float %113, %104
  %115 = fmul contract float %111, %114
  %116 = getelementptr inbounds float, float addrspace(1)* %14, i64 %109
  store float %115, float addrspace(1)* %116, align 4, !tbaa !7
  %117 = add nuw nsw i32 %107, %24
  %118 = icmp slt i32 %117, %4
  br i1 %118, label %106, label %105, !llvm.loop !16
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
