; ModuleID = '../data/hip_kernels/1/8/main.cu'
source_filename = "../data/hip_kernels/1/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13binary_kernelPKfmmS0_mmmPfmfE4temp = internal unnamed_addr addrspace(3) global [64 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13binary_kernelPKfmmS0_mmmPfmf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readonly %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = icmp ult i64 %12, %2
  %16 = icmp ult i64 %14, %5
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %97

18:                                               ; preds = %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ13binary_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %19
  store float 0.000000e+00, float addrspace(3)* %20, align 4, !tbaa !5
  %21 = add nuw nsw i32 %19, 32
  %22 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ13binary_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %21
  store float 0.000000e+00, float addrspace(3)* %22, align 4, !tbaa !5
  %23 = zext i32 %19 to i64
  %24 = icmp ult i64 %23, %6
  br i1 %24, label %27, label %25

25:                                               ; preds = %18
  %26 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %35

27:                                               ; preds = %18
  %28 = mul i64 %12, %1
  %29 = mul i64 %14, %4
  %30 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %31 = getelementptr i8, i8 addrspace(4)* %30, i64 4
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  %33 = load i16, i16 addrspace(4)* %32, align 4, !range !9, !invariant.load !10
  %34 = zext i16 %33 to i64
  br label %44

35:                                               ; preds = %64, %25
  %36 = phi i8 addrspace(4)* [ %26, %25 ], [ %30, %64 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = getelementptr i8, i8 addrspace(4)* %36, i64 4
  %38 = bitcast i8 addrspace(4)* %37 to i16 addrspace(4)*
  %39 = load i16, i16 addrspace(4)* %38, align 4, !range !9, !invariant.load !10
  %40 = icmp ult i16 %39, 2
  br i1 %40, label %68, label %41

41:                                               ; preds = %35
  %42 = lshr i16 %39, 1
  %43 = zext i16 %42 to i64
  br label %70

44:                                               ; preds = %27, %64
  %45 = phi float [ 0.000000e+00, %27 ], [ %65, %64 ]
  %46 = phi float [ 0.000000e+00, %27 ], [ %60, %64 ]
  %47 = phi i64 [ %23, %27 ], [ %66, %64 ]
  %48 = add i64 %47, %28
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !10
  %51 = fcmp contract une float %50, 0.000000e+00
  %52 = add i64 %47, %29
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !10
  %55 = fcmp contract une float %54, 0.000000e+00
  %56 = xor i1 %51, %55
  br i1 %56, label %57, label %59

57:                                               ; preds = %44
  %58 = fadd contract float %46, 1.000000e+00
  store float %58, float addrspace(3)* %20, align 4, !tbaa !5
  br label %59

59:                                               ; preds = %57, %44
  %60 = phi float [ %58, %57 ], [ %46, %44 ]
  %61 = select i1 %51, i1 true, i1 %55
  br i1 %61, label %62, label %64

62:                                               ; preds = %59
  %63 = fadd contract float %45, 1.000000e+00
  store float %63, float addrspace(3)* %22, align 4, !tbaa !5
  br label %64

64:                                               ; preds = %59, %62
  %65 = phi float [ %45, %59 ], [ %63, %62 ]
  %66 = add i64 %47, %34
  %67 = icmp ult i64 %66, %6
  br i1 %67, label %44, label %35, !llvm.loop !11

68:                                               ; preds = %85, %35
  %69 = icmp eq i32 %19, 0
  br i1 %69, label %88, label %97

70:                                               ; preds = %41, %85
  %71 = phi i64 [ %86, %85 ], [ %43, %41 ]
  %72 = icmp ugt i64 %71, %23
  br i1 %72, label %73, label %85

73:                                               ; preds = %70
  %74 = trunc i64 %71 to i32
  %75 = add nuw nsw i32 %19, %74
  %76 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ13binary_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %75
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %78 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %79 = fadd contract float %77, %78
  store float %79, float addrspace(3)* %20, align 4, !tbaa !5
  %80 = add nuw nsw i32 %75, 32
  %81 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ13binary_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %83 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %84 = fadd contract float %82, %83
  store float %84, float addrspace(3)* %22, align 4, !tbaa !5
  br label %85

85:                                               ; preds = %73, %70
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %86 = lshr i64 %71, 1
  %87 = icmp ult i64 %71, 2
  br i1 %87, label %68, label %70, !llvm.loop !13

88:                                               ; preds = %68
  %89 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ13binary_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 0), align 16, !tbaa !5
  %90 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ13binary_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 32), align 16, !tbaa !5
  %91 = fcmp contract une float %90, 0.000000e+00
  %92 = select i1 %91, float %90, float 1.000000e+00
  %93 = fdiv contract float %89, %92
  %94 = mul i64 %14, %8
  %95 = add i64 %94, %12
  %96 = getelementptr inbounds float, float addrspace(1)* %7, i64 %95
  store float %93, float addrspace(1)* %96, align 4, !tbaa !5
  br label %97

97:                                               ; preds = %68, %88, %10
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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
