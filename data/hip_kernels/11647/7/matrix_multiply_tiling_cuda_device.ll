; ModuleID = '../data/hip_kernels/11647/7/main.cu'
source_filename = "../data/hip_kernels/11647/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As = internal unnamed_addr addrspace(3) global [32 x [32 x i32]] undef, align 16
@_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs = internal unnamed_addr addrspace(3) global [32 x [32 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27matrix_multiply_tiling_cudaPiS_S_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = mul i32 %7, %4
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to <2 x i16> addrspace(4)*
  %14 = load <2 x i16>, <2 x i16> addrspace(4)* %13, align 4, !invariant.load !5
  %15 = zext <2 x i16> %14 to <2 x i32>
  %16 = insertelement <2 x i32> poison, i32 %6, i64 0
  %17 = insertelement <2 x i32> %16, i32 %11, i64 1
  %18 = mul <2 x i32> %17, %15
  %19 = extractelement <2 x i32> %18, i64 1
  %20 = add nsw i32 %19, %4
  %21 = extractelement <2 x i32> %15, i64 1
  %22 = mul i32 %21, %3
  %23 = icmp sgt i32 %4, 0
  br i1 %23, label %27, label %24

24:                                               ; preds = %5
  %25 = mul nsw i32 %9, %3
  %26 = add i32 %25, %8
  br label %42

27:                                               ; preds = %5
  %28 = mul nsw i32 %9, %4
  %29 = add i32 %28, %8
  %30 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %8
  %31 = mul nsw i32 %9, %3
  %32 = add i32 %31, %8
  %33 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %9, i32 %8
  %34 = extractelement <2 x i32> %15, i64 0
  %35 = and i32 %34, 7
  %36 = extractelement <2 x i16> %14, i64 0
  %37 = icmp ult i16 %36, 8
  %38 = and i32 %34, 2040
  %39 = icmp eq i32 %35, 0
  %40 = insertelement <2 x i32> poison, i32 %22, i64 0
  %41 = shufflevector <2 x i32> %40, <2 x i32> %15, <2 x i32> <i32 0, i32 2>
  br label %51

42:                                               ; preds = %81, %24
  %43 = phi i32 [ %26, %24 ], [ %32, %81 ]
  %44 = phi i32 [ 0, %24 ], [ %82, %81 ]
  %45 = mul i32 %22, %7
  %46 = extractelement <2 x i32> %18, i64 0
  %47 = add i32 %43, %46
  %48 = add i32 %47, %45
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %49
  store i32 %44, i32 addrspace(1)* %50, align 4, !tbaa !6
  ret void

51:                                               ; preds = %27, %81
  %52 = phi i32 [ 0, %27 ], [ %82, %81 ]
  %53 = phi <2 x i32> [ %18, %27 ], [ %83, %81 ]
  %54 = extractelement <2 x i32> %53, i64 1
  %55 = add i32 %29, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !6, !amdgpu.noclobber !5
  store i32 %58, i32 addrspace(3)* %30, align 4, !tbaa !6
  %59 = extractelement <2 x i32> %53, i64 0
  %60 = add i32 %32, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !6, !amdgpu.noclobber !5
  store i32 %63, i32 addrspace(3)* %33, align 4, !tbaa !6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %37, label %64, label %86

64:                                               ; preds = %86, %51
  %65 = phi i32 [ undef, %51 ], [ %144, %86 ]
  %66 = phi i32 [ %52, %51 ], [ %144, %86 ]
  %67 = phi i32 [ 0, %51 ], [ %145, %86 ]
  br i1 %39, label %81, label %68

68:                                               ; preds = %64, %68
  %69 = phi i32 [ %77, %68 ], [ %66, %64 ]
  %70 = phi i32 [ %78, %68 ], [ %67, %64 ]
  %71 = phi i32 [ %79, %68 ], [ 0, %64 ]
  %72 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %70
  %73 = load i32, i32 addrspace(3)* %72, align 4, !tbaa !6
  %74 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %70, i32 %8
  %75 = load i32, i32 addrspace(3)* %74, align 4, !tbaa !6
  %76 = mul nsw i32 %75, %73
  %77 = add nsw i32 %76, %69
  %78 = add nuw nsw i32 %70, 1
  %79 = add nuw nsw i32 %71, 1
  %80 = icmp eq i32 %79, %35
  br i1 %80, label %81, label %68, !llvm.loop !10

81:                                               ; preds = %68, %64
  %82 = phi i32 [ %65, %64 ], [ %77, %68 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = add nsw <2 x i32> %53, %41
  %84 = extractelement <2 x i32> %83, i64 1
  %85 = icmp slt i32 %84, %20
  br i1 %85, label %51, label %42, !llvm.loop !12

86:                                               ; preds = %51, %86
  %87 = phi i32 [ %144, %86 ], [ %52, %51 ]
  %88 = phi i32 [ %145, %86 ], [ 0, %51 ]
  %89 = phi i32 [ %146, %86 ], [ 0, %51 ]
  %90 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %88
  %91 = load i32, i32 addrspace(3)* %90, align 16, !tbaa !6
  %92 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %88, i32 %8
  %93 = load i32, i32 addrspace(3)* %92, align 4, !tbaa !6
  %94 = mul nsw i32 %93, %91
  %95 = add nsw i32 %94, %87
  %96 = or i32 %88, 1
  %97 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %96
  %98 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !6
  %99 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %96, i32 %8
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !6
  %101 = mul nsw i32 %100, %98
  %102 = add nsw i32 %101, %95
  %103 = or i32 %88, 2
  %104 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %103
  %105 = load i32, i32 addrspace(3)* %104, align 8, !tbaa !6
  %106 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %103, i32 %8
  %107 = load i32, i32 addrspace(3)* %106, align 4, !tbaa !6
  %108 = mul nsw i32 %107, %105
  %109 = add nsw i32 %108, %102
  %110 = or i32 %88, 3
  %111 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %110
  %112 = load i32, i32 addrspace(3)* %111, align 4, !tbaa !6
  %113 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %110, i32 %8
  %114 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !6
  %115 = mul nsw i32 %114, %112
  %116 = add nsw i32 %115, %109
  %117 = or i32 %88, 4
  %118 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %117
  %119 = load i32, i32 addrspace(3)* %118, align 16, !tbaa !6
  %120 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %117, i32 %8
  %121 = load i32, i32 addrspace(3)* %120, align 4, !tbaa !6
  %122 = mul nsw i32 %121, %119
  %123 = add nsw i32 %122, %116
  %124 = or i32 %88, 5
  %125 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %124
  %126 = load i32, i32 addrspace(3)* %125, align 4, !tbaa !6
  %127 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %124, i32 %8
  %128 = load i32, i32 addrspace(3)* %127, align 4, !tbaa !6
  %129 = mul nsw i32 %128, %126
  %130 = add nsw i32 %129, %123
  %131 = or i32 %88, 6
  %132 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %131
  %133 = load i32, i32 addrspace(3)* %132, align 8, !tbaa !6
  %134 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %131, i32 %8
  %135 = load i32, i32 addrspace(3)* %134, align 4, !tbaa !6
  %136 = mul nsw i32 %135, %133
  %137 = add nsw i32 %136, %130
  %138 = or i32 %88, 7
  %139 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2As, i32 0, i32 %9, i32 %138
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !6
  %141 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ27matrix_multiply_tiling_cudaPiS_S_iiE2Bs, i32 0, i32 %138, i32 %8
  %142 = load i32, i32 addrspace(3)* %141, align 4, !tbaa !6
  %143 = mul nsw i32 %142, %140
  %144 = add nsw i32 %143, %137
  %145 = add nuw nsw i32 %88, 8
  %146 = add i32 %89, 8
  %147 = icmp eq i32 %146, %38
  br i1 %147, label %64, label %86, !llvm.loop !14
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
!4 = !{i32 0, i32 1024}
!5 = !{}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13, !11}
