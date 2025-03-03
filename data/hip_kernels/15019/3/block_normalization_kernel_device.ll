; ModuleID = '../data/hip_kernels/15019/3/main.cu'
source_filename = "../data/hip_kernels/15019/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks = internal unnamed_addr addrspace(3) global [288 x float] undef, align 16
@_ZZ26block_normalization_kernelPfS_iiiiiiiiiE7L1_norm = internal unnamed_addr addrspace(3) global [8 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26block_normalization_kernelPfS_iiiiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = shl i32 %12, 3
  %14 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %3
  br i1 %16, label %17, label %133

17:                                               ; preds = %11
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = icmp slt i32 %18, %4
  br i1 %19, label %20, label %133

20:                                               ; preds = %17
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %18, %25
  %27 = add i32 %26, %15
  %28 = mul nsw i32 %15, %9
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %30 = and i32 %29, 1
  %31 = add i32 %28, %30
  %32 = mul nsw i32 %18, %10
  %33 = lshr i32 %29, 1
  %34 = add i32 %32, %33
  %35 = mul nsw i32 %34, %2
  %36 = mul nsw i32 %31, %7
  %37 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %38 = add i32 %36, %37
  %39 = add i32 %38, %35
  %40 = mul nuw nsw i32 %29, 9
  %41 = add nuw nsw i32 %40, %37
  %42 = sext i32 %39 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  %45 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %41
  store float %44, float addrspace(3)* %45, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = mul nuw nsw i32 %14, 36
  %47 = add nuw nsw i32 %41, %46
  %48 = mul nsw i32 %6, %5
  %49 = mul i32 %48, %7
  %50 = icmp ult i32 %47, 8
  br i1 %50, label %51, label %124

51:                                               ; preds = %20
  %52 = getelementptr inbounds [8 x float], [8 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE7L1_norm, i32 0, i32 %47
  store float 0.000000e+00, float addrspace(3)* %52, align 4, !tbaa !7
  %53 = icmp sgt i32 %49, 0
  br i1 %53, label %54, label %124

54:                                               ; preds = %51
  %55 = mul nsw i32 %49, %47
  %56 = and i32 %49, 7
  %57 = icmp ult i32 %49, 8
  br i1 %57, label %106, label %58

58:                                               ; preds = %54
  %59 = and i32 %49, -8
  br label %60

60:                                               ; preds = %60, %58
  %61 = phi float [ 0.000000e+00, %58 ], [ %102, %60 ]
  %62 = phi i32 [ 0, %58 ], [ %103, %60 ]
  %63 = phi i32 [ 0, %58 ], [ %104, %60 ]
  %64 = add nsw i32 %62, %55
  %65 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %64
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %67 = fadd contract float %66, %61
  %68 = or i32 %62, 1
  %69 = add nsw i32 %68, %55
  %70 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %72 = fadd contract float %71, %67
  %73 = or i32 %62, 2
  %74 = add nsw i32 %73, %55
  %75 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %77 = fadd contract float %76, %72
  %78 = or i32 %62, 3
  %79 = add nsw i32 %78, %55
  %80 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %79
  %81 = load float, float addrspace(3)* %80, align 4, !tbaa !7
  %82 = fadd contract float %81, %77
  %83 = or i32 %62, 4
  %84 = add nsw i32 %83, %55
  %85 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !7
  %87 = fadd contract float %86, %82
  %88 = or i32 %62, 5
  %89 = add nsw i32 %88, %55
  %90 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %89
  %91 = load float, float addrspace(3)* %90, align 4, !tbaa !7
  %92 = fadd contract float %91, %87
  %93 = or i32 %62, 6
  %94 = add nsw i32 %93, %55
  %95 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %94
  %96 = load float, float addrspace(3)* %95, align 4, !tbaa !7
  %97 = fadd contract float %96, %92
  %98 = or i32 %62, 7
  %99 = add nsw i32 %98, %55
  %100 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %99
  %101 = load float, float addrspace(3)* %100, align 4, !tbaa !7
  %102 = fadd contract float %101, %97
  %103 = add nuw nsw i32 %62, 8
  %104 = add i32 %63, 8
  %105 = icmp eq i32 %104, %59
  br i1 %105, label %106, label %60, !llvm.loop !11

106:                                              ; preds = %60, %54
  %107 = phi float [ undef, %54 ], [ %102, %60 ]
  %108 = phi float [ 0.000000e+00, %54 ], [ %102, %60 ]
  %109 = phi i32 [ 0, %54 ], [ %103, %60 ]
  %110 = icmp eq i32 %56, 0
  br i1 %110, label %122, label %111

111:                                              ; preds = %106, %111
  %112 = phi float [ %118, %111 ], [ %108, %106 ]
  %113 = phi i32 [ %119, %111 ], [ %109, %106 ]
  %114 = phi i32 [ %120, %111 ], [ 0, %106 ]
  %115 = add nsw i32 %113, %55
  %116 = getelementptr inbounds [288 x float], [288 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE8s_blocks, i32 0, i32 %115
  %117 = load float, float addrspace(3)* %116, align 4, !tbaa !7
  %118 = fadd contract float %117, %112
  %119 = add nuw nsw i32 %113, 1
  %120 = add i32 %114, 1
  %121 = icmp eq i32 %120, %56
  br i1 %121, label %122, label %111, !llvm.loop !13

122:                                              ; preds = %111, %106
  %123 = phi float [ %107, %106 ], [ %118, %111 ]
  store float %123, float addrspace(3)* %52, align 4, !tbaa !7
  br label %124

124:                                              ; preds = %51, %122, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %125 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %126 = getelementptr inbounds [8 x float], [8 x float] addrspace(3)* @_ZZ26block_normalization_kernelPfS_iiiiiiiiiE7L1_norm, i32 0, i32 %14
  %127 = load float, float addrspace(3)* %126, align 4, !tbaa !7
  %128 = fdiv contract float %125, %127
  %129 = mul nsw i32 %27, %49
  %130 = add nsw i32 %129, %41
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  store float %128, float addrspace(1)* %132, align 4, !tbaa !7
  br label %133

133:                                              ; preds = %124, %17, %11
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
