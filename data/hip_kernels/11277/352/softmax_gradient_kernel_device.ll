; ModuleID = '../data/hip_kernels/11277/352/main.cu'
source_filename = "../data/hip_kernels/11277/352/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23softmax_gradient_kerneliPKfS0_Pf(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = mul i32 %5, %0
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds float, float addrspace(1)* %1, i64 %7
  %9 = getelementptr inbounds float, float addrspace(1)* %2, i64 %7
  %10 = getelementptr inbounds float, float addrspace(1)* %3, i64 %7
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = icmp slt i32 %11, %0
  br i1 %12, label %13, label %19

13:                                               ; preds = %4
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  br label %23

19:                                               ; preds = %23, %4
  %20 = phi float [ 0.000000e+00, %4 ], [ %32, %23 ]
  %21 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %11
  store float %20, float addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = icmp eq i32 %11, 0
  br i1 %22, label %35, label %105

23:                                               ; preds = %13, %23
  %24 = phi i32 [ %11, %13 ], [ %33, %23 ]
  %25 = phi float [ 0.000000e+00, %13 ], [ %32, %23 ]
  %26 = sext i32 %24 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %9, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  %29 = getelementptr inbounds float, float addrspace(1)* %8, i64 %26
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = fmul contract float %28, %30
  %32 = fadd contract float %25, %31
  %33 = add i32 %24, %18
  %34 = icmp slt i32 %33, %0
  br i1 %34, label %23, label %19, !llvm.loop !11

35:                                               ; preds = %19
  %36 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 0), align 16, !tbaa !7
  %37 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %38 = getelementptr i8, i8 addrspace(4)* %37, i64 4
  %39 = bitcast i8 addrspace(4)* %38 to i16 addrspace(4)*
  %40 = load i16, i16 addrspace(4)* %39, align 4, !range !5, !invariant.load !6
  %41 = zext i16 %40 to i32
  %42 = icmp ugt i16 %40, 1
  br i1 %42, label %43, label %65

43:                                               ; preds = %35
  %44 = add nsw i32 %41, -1
  %45 = add nsw i32 %41, -2
  %46 = and i32 %44, 7
  %47 = icmp ult i32 %45, 7
  br i1 %47, label %50, label %48

48:                                               ; preds = %43
  %49 = and i32 %44, -8
  br label %67

50:                                               ; preds = %67, %43
  %51 = phi float [ undef, %43 ], [ %101, %67 ]
  %52 = phi i32 [ 1, %43 ], [ %102, %67 ]
  %53 = phi float [ %36, %43 ], [ %101, %67 ]
  %54 = icmp eq i32 %46, 0
  br i1 %54, label %65, label %55

55:                                               ; preds = %50, %55
  %56 = phi i32 [ %62, %55 ], [ %52, %50 ]
  %57 = phi float [ %61, %55 ], [ %53, %50 ]
  %58 = phi i32 [ %63, %55 ], [ 0, %50 ]
  %59 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %56
  %60 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %61 = fadd contract float %57, %60
  %62 = add nuw nsw i32 %56, 1
  %63 = add i32 %58, 1
  %64 = icmp eq i32 %63, %46
  br i1 %64, label %65, label %55, !llvm.loop !13

65:                                               ; preds = %50, %55, %35
  %66 = phi float [ %36, %35 ], [ %51, %50 ], [ %61, %55 ]
  store float %66, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 0), align 16, !tbaa !7
  br label %105

67:                                               ; preds = %67, %48
  %68 = phi i32 [ 1, %48 ], [ %102, %67 ]
  %69 = phi float [ %36, %48 ], [ %101, %67 ]
  %70 = phi i32 [ 0, %48 ], [ %103, %67 ]
  %71 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %68
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !7
  %73 = fadd contract float %69, %72
  %74 = add nuw nsw i32 %68, 1
  %75 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %77 = fadd contract float %73, %76
  %78 = add nuw nsw i32 %68, 2
  %79 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %78
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !7
  %81 = fadd contract float %77, %80
  %82 = add nuw nsw i32 %68, 3
  %83 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %82
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %85 = fadd contract float %81, %84
  %86 = add nuw nsw i32 %68, 4
  %87 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %86
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !7
  %89 = fadd contract float %85, %88
  %90 = add nuw nsw i32 %68, 5
  %91 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !7
  %93 = fadd contract float %89, %92
  %94 = add nuw nsw i32 %68, 6
  %95 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %94
  %96 = load float, float addrspace(3)* %95, align 4, !tbaa !7
  %97 = fadd contract float %93, %96
  %98 = add nuw nsw i32 %68, 7
  %99 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 %98
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !7
  %101 = fadd contract float %97, %100
  %102 = add nuw nsw i32 %68, 8
  %103 = add i32 %70, 8
  %104 = icmp eq i32 %103, %49
  br i1 %104, label %50, label %67, !llvm.loop !15

105:                                              ; preds = %65, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %106 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ23softmax_gradient_kerneliPKfS0_PfE16reduction_buffer, i32 0, i32 0), align 16, !tbaa !7
  br i1 %12, label %107, label %113

107:                                              ; preds = %105
  %108 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %109 = getelementptr i8, i8 addrspace(4)* %108, i64 4
  %110 = bitcast i8 addrspace(4)* %109 to i16 addrspace(4)*
  %111 = load i16, i16 addrspace(4)* %110, align 4, !range !5, !invariant.load !6
  %112 = zext i16 %111 to i32
  br label %114

113:                                              ; preds = %114, %105
  ret void

114:                                              ; preds = %107, %114
  %115 = phi i32 [ %11, %107 ], [ %124, %114 ]
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %8, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = getelementptr inbounds float, float addrspace(1)* %9, i64 %116
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = fsub contract float %120, %106
  %122 = fmul contract float %118, %121
  %123 = getelementptr inbounds float, float addrspace(1)* %10, i64 %116
  store float %122, float addrspace(1)* %123, align 4, !tbaa !7
  %124 = add i32 %115, %112
  %125 = icmp slt i32 %124, %0
  br i1 %125, label %114, label %113, !llvm.loop !16
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
