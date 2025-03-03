; ModuleID = '../data/hip_kernels/3563/1/main.cu'
source_filename = "../data/hip_kernels/3563/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22spmv_csr_vector_kerneljPKjS0_PKfS2_PfjE4vals = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22spmv_csr_vector_kerneljPKjS0_PKfS2_Pfj(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = sdiv i32 %16, 32
  %18 = and i32 %16, 31
  %19 = udiv i32 %17, %0
  %20 = icmp ult i32 %19, %6
  br i1 %20, label %21, label %90

21:                                               ; preds = %7
  %22 = sext i32 %19 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = add nuw nsw i32 %19, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ22spmv_csr_vector_kerneljPKjS0_PKfS2_PfjE4vals, i32 0, i32 %15
  store float 1.000000e+00, float addrspace(3)* %29, align 4, !tbaa !11
  %30 = add nsw i32 %24, %18
  %31 = icmp slt i32 %30, %28
  br i1 %31, label %36, label %33

32:                                               ; preds = %36
  store float %49, float addrspace(3)* %29, align 4, !tbaa !11
  br label %33

33:                                               ; preds = %32, %21
  %34 = phi float [ %49, %32 ], [ 1.000000e+00, %21 ]
  %35 = icmp ult i32 %18, 16
  br i1 %35, label %52, label %57

36:                                               ; preds = %21, %36
  %37 = phi float [ %49, %36 ], [ 1.000000e+00, %21 ]
  %38 = phi i32 [ %50, %36 ], [ %30, %21 ]
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %3, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !11, !amdgpu.noclobber !5
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %4, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !11, !amdgpu.noclobber !5
  %47 = fmul contract float %41, %46
  %48 = fsub contract float 1.000000e+00, %47
  %49 = fmul contract float %37, %48
  %50 = add nsw i32 %38, 32
  %51 = icmp slt i32 %50, %28
  br i1 %51, label %36, label %32, !llvm.loop !13

52:                                               ; preds = %33
  %53 = add nuw nsw i32 %15, 16
  %54 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ22spmv_csr_vector_kerneljPKjS0_PKfS2_PfjE4vals, i32 0, i32 %53
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !11
  %56 = fmul contract float %55, %34
  store float %56, float addrspace(3)* %29, align 4, !tbaa !11
  br label %57

57:                                               ; preds = %52, %33
  %58 = phi float [ %56, %52 ], [ %34, %33 ]
  %59 = icmp ult i32 %18, 8
  br i1 %59, label %60, label %65

60:                                               ; preds = %57
  %61 = add nuw nsw i32 %15, 8
  %62 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ22spmv_csr_vector_kerneljPKjS0_PKfS2_PfjE4vals, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !11
  %64 = fmul contract float %63, %58
  store float %64, float addrspace(3)* %29, align 4, !tbaa !11
  br label %65

65:                                               ; preds = %60, %57
  %66 = phi float [ %64, %60 ], [ %58, %57 ]
  %67 = icmp ult i32 %18, 4
  br i1 %67, label %68, label %73

68:                                               ; preds = %65
  %69 = add nuw nsw i32 %15, 4
  %70 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ22spmv_csr_vector_kerneljPKjS0_PKfS2_PfjE4vals, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !11
  %72 = fmul contract float %71, %66
  store float %72, float addrspace(3)* %29, align 4, !tbaa !11
  br label %73

73:                                               ; preds = %68, %65
  %74 = phi float [ %72, %68 ], [ %66, %65 ]
  %75 = icmp ult i32 %18, 2
  br i1 %75, label %76, label %81

76:                                               ; preds = %73
  %77 = add nuw nsw i32 %15, 2
  %78 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ22spmv_csr_vector_kerneljPKjS0_PKfS2_PfjE4vals, i32 0, i32 %77
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !11
  %80 = fmul contract float %79, %74
  store float %80, float addrspace(3)* %29, align 4, !tbaa !11
  br label %81

81:                                               ; preds = %76, %73
  %82 = phi float [ %80, %76 ], [ %74, %73 ]
  %83 = icmp eq i32 %18, 0
  br i1 %83, label %84, label %90

84:                                               ; preds = %81
  %85 = add nuw nsw i32 %15, 1
  %86 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ22spmv_csr_vector_kerneljPKjS0_PKfS2_PfjE4vals, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !11
  %88 = fmul contract float %87, %82
  store float %88, float addrspace(3)* %29, align 4, !tbaa !11
  %89 = getelementptr inbounds float, float addrspace(1)* %5, i64 %22
  store float %88, float addrspace(1)* %89, align 4, !tbaa !11
  br label %90

90:                                               ; preds = %81, %84, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
