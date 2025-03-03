; ModuleID = '../data/hip_kernels/240/8/main.cu'
source_filename = "../data/hip_kernels/240/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ41cunnx_BlockSparse_updateGradOutput_kernelPfS_PKfS1_S1_iiE6buffer = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z41cunnx_BlockSparse_updateGradOutput_kernelPfS_PKfS1_S1_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul nsw i32 %14, %5
  %16 = mul nsw i32 %15, %6
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = sext i32 %15 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %22 = getelementptr inbounds float, float addrspace(1)* %3, i64 %17
  %23 = getelementptr inbounds float, float addrspace(1)* %4, i64 %19
  %24 = icmp sgt i32 %5, 0
  br i1 %24, label %25, label %30

25:                                               ; preds = %7
  %26 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ41cunnx_BlockSparse_updateGradOutput_kernelPfS_PKfS1_S1_iiE6buffer, i32 0, i32 %8
  %27 = icmp slt i32 %8, %6
  %28 = icmp ult i16 %12, 2
  %29 = icmp eq i32 %8, 0
  br label %31

30:                                               ; preds = %78, %7
  ret void

31:                                               ; preds = %25, %78
  %32 = phi i32 [ 0, %25 ], [ %79, %78 ]
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %23, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = mul nsw i32 %32, %6
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %18, i64 %37
  %39 = getelementptr inbounds float, float addrspace(1)* %21, i64 %37
  %40 = getelementptr inbounds float, float addrspace(1)* %22, i64 %37
  store float 0.000000e+00, float addrspace(3)* %26, align 4, !tbaa !7
  br i1 %27, label %43, label %42

41:                                               ; preds = %43
  store float %52, float addrspace(3)* %26, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %41, %31
  br i1 %28, label %57, label %58

43:                                               ; preds = %31, %43
  %44 = phi float [ %52, %43 ], [ 0.000000e+00, %31 ]
  %45 = phi i32 [ %55, %43 ], [ %8, %31 ]
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %39, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = getelementptr inbounds float, float addrspace(1)* %40, i64 %46
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fmul contract float %48, %50
  %52 = fadd contract float %44, %51
  %53 = fmul contract float %35, %48
  %54 = getelementptr inbounds float, float addrspace(1)* %38, i64 %46
  store float %53, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = add nuw nsw i32 %45, %13
  %56 = icmp slt i32 %55, %6
  br i1 %56, label %43, label %41, !llvm.loop !11

57:                                               ; preds = %68, %42
  br i1 %29, label %70, label %78

58:                                               ; preds = %42, %68
  %59 = phi i32 [ %60, %68 ], [ %13, %42 ]
  %60 = lshr i32 %59, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = icmp ult i32 %8, %60
  br i1 %61, label %62, label %68

62:                                               ; preds = %58
  %63 = add nuw nsw i32 %60, %8
  %64 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ41cunnx_BlockSparse_updateGradOutput_kernelPfS_PKfS1_S1_iiE6buffer, i32 0, i32 %63
  %65 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %66 = load float, float addrspace(3)* %26, align 4, !tbaa !7
  %67 = fadd contract float %65, %66
  store float %67, float addrspace(3)* %26, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %58, %62
  %69 = icmp ult i32 %59, 4
  br i1 %69, label %57, label %58, !llvm.loop !13

70:                                               ; preds = %57
  %71 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ41cunnx_BlockSparse_updateGradOutput_kernelPfS_PKfS1_S1_iiE6buffer, i32 0, i32 0), align 16, !tbaa !7
  %72 = fpext float %71 to double
  %73 = fpext float %35 to double
  %74 = fadd contract double %73, 1.000000e-08
  %75 = fdiv contract double %72, %74
  %76 = fptrunc double %75 to float
  %77 = getelementptr inbounds float, float addrspace(1)* %20, i64 %33
  store float %76, float addrspace(1)* %77, align 4, !tbaa !7
  br label %78

78:                                               ; preds = %70, %57
  %79 = add nuw nsw i32 %32, 1
  %80 = icmp eq i32 %79, %5
  br i1 %80, label %30, label %31, !llvm.loop !14
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
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
