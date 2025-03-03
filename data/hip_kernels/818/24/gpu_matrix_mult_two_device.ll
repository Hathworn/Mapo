; ModuleID = '../data/hip_kernels/818/24/main.cu'
source_filename = "../data/hip_kernels/818/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16
@_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19gpu_matrix_mult_twoPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %8, 4
  %12 = add nsw i32 %11, %10
  %13 = shl nsw i32 %7, 4
  %14 = add nsw i32 %13, %9
  %15 = sdiv i32 %4, 16
  %16 = icmp sgt i32 %4, 15
  br i1 %16, label %17, label %55

17:                                               ; preds = %6
  %18 = icmp slt i32 %12, %5
  %19 = mul nsw i32 %12, %5
  %20 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 %9
  %21 = icmp slt i32 %14, %3
  %22 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 %10, i32 %9
  %23 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 0
  %24 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 0, i32 %9
  %25 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 1
  %26 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 1, i32 %9
  %27 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 2
  %28 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 2, i32 %9
  %29 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 3
  %30 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 3, i32 %9
  %31 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 4
  %32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 4, i32 %9
  %33 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 5
  %34 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 5, i32 %9
  %35 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 6
  %36 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 6, i32 %9
  %37 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 7
  %38 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 7, i32 %9
  %39 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 8
  %40 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 8, i32 %9
  %41 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 9
  %42 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 9, i32 %9
  %43 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 10
  %44 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 10, i32 %9
  %45 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 11
  %46 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 11, i32 %9
  %47 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 12
  %48 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 12, i32 %9
  %49 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 13
  %50 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 13, i32 %9
  %51 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 14
  %52 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 14, i32 %9
  %53 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Mds, i32 0, i32 %10, i32 15
  %54 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ19gpu_matrix_mult_twoPiS_S_iiiE3Nds, i32 0, i32 15, i32 %9
  br label %60

55:                                               ; preds = %82, %6
  %56 = phi i32 [ 0, %6 ], [ %146, %82 ]
  %57 = icmp slt i32 %12, %5
  %58 = icmp slt i32 %14, %3
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %149, label %154

60:                                               ; preds = %17, %82
  %61 = phi i32 [ 0, %17 ], [ %147, %82 ]
  %62 = phi i32 [ 0, %17 ], [ %146, %82 ]
  %63 = shl nsw i32 %61, 4
  br i1 %18, label %64, label %72

64:                                               ; preds = %60
  %65 = add nuw i32 %63, %9
  %66 = icmp slt i32 %65, %3
  br i1 %66, label %67, label %72

67:                                               ; preds = %64
  %68 = add i32 %65, %19
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %71, i32 addrspace(3)* %20, align 4, !tbaa !5
  br label %72

72:                                               ; preds = %60, %67, %64
  %73 = add nuw nsw i32 %63, %10
  %74 = icmp slt i32 %73, %5
  %75 = select i1 %74, i1 %21, i1 false
  br i1 %75, label %76, label %82

76:                                               ; preds = %72
  %77 = mul nsw i32 %73, %5
  %78 = add nsw i32 %77, %14
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %81, i32 addrspace(3)* %22, align 4, !tbaa !5
  br label %82

82:                                               ; preds = %76, %72
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = load i32, i32 addrspace(3)* %23, align 16, !tbaa !5
  %84 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %85 = mul nsw i32 %84, %83
  %86 = add nsw i32 %85, %62
  %87 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !5
  %88 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !5
  %89 = mul nsw i32 %88, %87
  %90 = add nsw i32 %89, %86
  %91 = load i32, i32 addrspace(3)* %27, align 8, !tbaa !5
  %92 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %93 = mul nsw i32 %92, %91
  %94 = add nsw i32 %93, %90
  %95 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %96 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !5
  %97 = mul nsw i32 %96, %95
  %98 = add nsw i32 %97, %94
  %99 = load i32, i32 addrspace(3)* %31, align 16, !tbaa !5
  %100 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %101 = mul nsw i32 %100, %99
  %102 = add nsw i32 %101, %98
  %103 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !5
  %104 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !5
  %105 = mul nsw i32 %104, %103
  %106 = add nsw i32 %105, %102
  %107 = load i32, i32 addrspace(3)* %35, align 8, !tbaa !5
  %108 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !5
  %109 = mul nsw i32 %108, %107
  %110 = add nsw i32 %109, %106
  %111 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %112 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %113 = mul nsw i32 %112, %111
  %114 = add nsw i32 %113, %110
  %115 = load i32, i32 addrspace(3)* %39, align 16, !tbaa !5
  %116 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %117 = mul nsw i32 %116, %115
  %118 = add nsw i32 %117, %114
  %119 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %120 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %121 = mul nsw i32 %120, %119
  %122 = add nsw i32 %121, %118
  %123 = load i32, i32 addrspace(3)* %43, align 8, !tbaa !5
  %124 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !5
  %125 = mul nsw i32 %124, %123
  %126 = add nsw i32 %125, %122
  %127 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !5
  %128 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %129 = mul nsw i32 %128, %127
  %130 = add nsw i32 %129, %126
  %131 = load i32, i32 addrspace(3)* %47, align 16, !tbaa !5
  %132 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !5
  %133 = mul nsw i32 %132, %131
  %134 = add nsw i32 %133, %130
  %135 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %136 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !5
  %137 = mul nsw i32 %136, %135
  %138 = add nsw i32 %137, %134
  %139 = load i32, i32 addrspace(3)* %51, align 8, !tbaa !5
  %140 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %141 = mul nsw i32 %140, %139
  %142 = add nsw i32 %141, %138
  %143 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !5
  %144 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !5
  %145 = mul nsw i32 %144, %143
  %146 = add nsw i32 %145, %142
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %147 = add nuw nsw i32 %61, 1
  %148 = icmp eq i32 %147, %15
  br i1 %148, label %55, label %60, !llvm.loop !10

149:                                              ; preds = %55
  %150 = mul nsw i32 %12, %5
  %151 = add nsw i32 %150, %14
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %152
  store i32 %56, i32 addrspace(1)* %153, align 4, !tbaa !5
  br label %154

154:                                              ; preds = %149, %55
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
