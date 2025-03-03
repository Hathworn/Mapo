; ModuleID = '../data/hip_kernels/848/3/main.cu'
source_filename = "../data/hip_kernels/848/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17matrix_mul_sharedPfS_S_iE3ads = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ17matrix_mul_sharedPfS_S_iE3bds = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17matrix_mul_sharedPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %12
  %21 = add i32 %11, %13
  %22 = sdiv i32 %3, %10
  %23 = icmp sgt i32 %22, 0
  %24 = mul nsw i32 %20, %3
  br i1 %23, label %25, label %33

25:                                               ; preds = %4
  %26 = add i32 %24, %13
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %13
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %12, i32 %13
  %29 = and i32 %10, 7
  %30 = icmp ult i16 %9, 8
  %31 = and i32 %10, 2040
  %32 = icmp eq i32 %29, 0
  br label %38

33:                                               ; preds = %69, %4
  %34 = phi float [ 0.000000e+00, %4 ], [ %70, %69 ]
  %35 = add nsw i32 %24, %21
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  store float %34, float addrspace(1)* %37, align 4, !tbaa !7
  ret void

38:                                               ; preds = %25, %69
  %39 = phi i32 [ 0, %25 ], [ %71, %69 ]
  %40 = phi float [ 0.000000e+00, %25 ], [ %70, %69 ]
  %41 = mul nuw nsw i32 %39, %10
  %42 = add i32 %26, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %45, float addrspace(3)* %27, align 4, !tbaa !7
  %46 = add nuw nsw i32 %41, %12
  %47 = mul nsw i32 %46, %3
  %48 = add nsw i32 %47, %21
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %51, float addrspace(3)* %28, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %30, label %52, label %73

52:                                               ; preds = %73, %38
  %53 = phi float [ undef, %38 ], [ %131, %73 ]
  %54 = phi i32 [ 0, %38 ], [ %132, %73 ]
  %55 = phi float [ %40, %38 ], [ %131, %73 ]
  br i1 %32, label %69, label %56

56:                                               ; preds = %52, %56
  %57 = phi i32 [ %66, %56 ], [ %54, %52 ]
  %58 = phi float [ %65, %56 ], [ %55, %52 ]
  %59 = phi i32 [ %67, %56 ], [ 0, %52 ]
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %57
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %57, i32 %13
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %64 = fmul contract float %61, %63
  %65 = fadd contract float %58, %64
  %66 = add nuw nsw i32 %57, 1
  %67 = add i32 %59, 1
  %68 = icmp eq i32 %67, %29
  br i1 %68, label %69, label %56, !llvm.loop !11

69:                                               ; preds = %56, %52
  %70 = phi float [ %53, %52 ], [ %65, %56 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = add nuw nsw i32 %39, 1
  %72 = icmp eq i32 %71, %22
  br i1 %72, label %33, label %38, !llvm.loop !13

73:                                               ; preds = %38, %73
  %74 = phi i32 [ %132, %73 ], [ 0, %38 ]
  %75 = phi float [ %131, %73 ], [ %40, %38 ]
  %76 = phi i32 [ %133, %73 ], [ 0, %38 ]
  %77 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %74
  %78 = load float, float addrspace(3)* %77, align 16, !tbaa !7
  %79 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %74, i32 %13
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !7
  %81 = fmul contract float %78, %80
  %82 = fadd contract float %75, %81
  %83 = or i32 %74, 1
  %84 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %83
  %85 = load float, float addrspace(3)* %84, align 4, !tbaa !7
  %86 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %83, i32 %13
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %88 = fmul contract float %85, %87
  %89 = fadd contract float %82, %88
  %90 = or i32 %74, 2
  %91 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %90
  %92 = load float, float addrspace(3)* %91, align 8, !tbaa !7
  %93 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %90, i32 %13
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %95 = fmul contract float %92, %94
  %96 = fadd contract float %89, %95
  %97 = or i32 %74, 3
  %98 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !7
  %100 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %97, i32 %13
  %101 = load float, float addrspace(3)* %100, align 4, !tbaa !7
  %102 = fmul contract float %99, %101
  %103 = fadd contract float %96, %102
  %104 = or i32 %74, 4
  %105 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %104
  %106 = load float, float addrspace(3)* %105, align 16, !tbaa !7
  %107 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %104, i32 %13
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !7
  %109 = fmul contract float %106, %108
  %110 = fadd contract float %103, %109
  %111 = or i32 %74, 5
  %112 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %111
  %113 = load float, float addrspace(3)* %112, align 4, !tbaa !7
  %114 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %111, i32 %13
  %115 = load float, float addrspace(3)* %114, align 4, !tbaa !7
  %116 = fmul contract float %113, %115
  %117 = fadd contract float %110, %116
  %118 = or i32 %74, 6
  %119 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %118
  %120 = load float, float addrspace(3)* %119, align 8, !tbaa !7
  %121 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %118, i32 %13
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !7
  %123 = fmul contract float %120, %122
  %124 = fadd contract float %117, %123
  %125 = or i32 %74, 7
  %126 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3ads, i32 0, i32 %12, i32 %125
  %127 = load float, float addrspace(3)* %126, align 4, !tbaa !7
  %128 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ17matrix_mul_sharedPfS_S_iE3bds, i32 0, i32 %125, i32 %13
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !7
  %130 = fmul contract float %127, %129
  %131 = fadd contract float %124, %130
  %132 = add nuw nsw i32 %74, 8
  %133 = add i32 %76, 8
  %134 = icmp eq i32 %133, %31
  br i1 %134, label %52, label %73, !llvm.loop !15
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
