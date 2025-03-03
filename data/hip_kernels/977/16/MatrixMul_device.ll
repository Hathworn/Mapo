; ModuleID = '../data/hip_kernels/977/16/main.cu'
source_filename = "../data/hip_kernels/977/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9MatrixMulPiS_S_iE2As = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16
@_ZZ9MatrixMulPiS_S_iE2Bs = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9MatrixMulPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nsw i32 %3, 4
  %10 = mul nsw i32 %9, %6
  %11 = add nsw i32 %10, %3
  %12 = shl nsw i32 %5, 4
  %13 = icmp sgt i32 %3, 0
  %14 = mul nsw i32 %8, %3
  br i1 %13, label %15, label %132

15:                                               ; preds = %4
  %16 = add i32 %14, %7
  %17 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 %7
  %18 = mul nsw i32 %7, %3
  %19 = add i32 %18, %8
  %20 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 %7, i32 %8
  %21 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 0
  %22 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 0, i32 %7
  %23 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 1
  %24 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 1, i32 %7
  %25 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 2
  %26 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 2, i32 %7
  %27 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 3
  %28 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 3, i32 %7
  %29 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 4
  %30 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 4, i32 %7
  %31 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 5
  %32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 5, i32 %7
  %33 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 6
  %34 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 6, i32 %7
  %35 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 7
  %36 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 7, i32 %7
  %37 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 8
  %38 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 8, i32 %7
  %39 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 9
  %40 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 9, i32 %7
  %41 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 10
  %42 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 10, i32 %7
  %43 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 11
  %44 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 11, i32 %7
  %45 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 12
  %46 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 12, i32 %7
  %47 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 13
  %48 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 13, i32 %7
  %49 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 14
  %50 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 14, i32 %7
  %51 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 15
  %52 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 15, i32 %7
  br label %53

53:                                               ; preds = %15, %53
  %54 = phi i32 [ 0, %15 ], [ %128, %53 ]
  %55 = phi i32 [ %12, %15 ], [ %130, %53 ]
  %56 = phi i32 [ %10, %15 ], [ %129, %53 ]
  %57 = add i32 %16, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %60, i32 addrspace(3)* %17, align 4, !tbaa !5
  %61 = add i32 %19, %55
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %64, i32 addrspace(3)* %20, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = load i32, i32 addrspace(3)* %21, align 16, !tbaa !5
  %66 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !5
  %67 = mul nsw i32 %66, %65
  %68 = add nsw i32 %67, %54
  %69 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %70 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %71 = mul nsw i32 %70, %69
  %72 = add nsw i32 %71, %68
  %73 = load i32, i32 addrspace(3)* %25, align 8, !tbaa !5
  %74 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !5
  %75 = mul nsw i32 %74, %73
  %76 = add nsw i32 %75, %72
  %77 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %78 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %79 = mul nsw i32 %78, %77
  %80 = add nsw i32 %79, %76
  %81 = load i32, i32 addrspace(3)* %29, align 16, !tbaa !5
  %82 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !5
  %83 = mul nsw i32 %82, %81
  %84 = add nsw i32 %83, %80
  %85 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !5
  %86 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %87 = mul nsw i32 %86, %85
  %88 = add nsw i32 %87, %84
  %89 = load i32, i32 addrspace(3)* %33, align 8, !tbaa !5
  %90 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !5
  %91 = mul nsw i32 %90, %89
  %92 = add nsw i32 %91, %88
  %93 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !5
  %94 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !5
  %95 = mul nsw i32 %94, %93
  %96 = add nsw i32 %95, %92
  %97 = load i32, i32 addrspace(3)* %37, align 16, !tbaa !5
  %98 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %99 = mul nsw i32 %98, %97
  %100 = add nsw i32 %99, %96
  %101 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %102 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %103 = mul nsw i32 %102, %101
  %104 = add nsw i32 %103, %100
  %105 = load i32, i32 addrspace(3)* %41, align 8, !tbaa !5
  %106 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %107 = mul nsw i32 %106, %105
  %108 = add nsw i32 %107, %104
  %109 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %110 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !5
  %111 = mul nsw i32 %110, %109
  %112 = add nsw i32 %111, %108
  %113 = load i32, i32 addrspace(3)* %45, align 16, !tbaa !5
  %114 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %115 = mul nsw i32 %114, %113
  %116 = add nsw i32 %115, %112
  %117 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !5
  %118 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !5
  %119 = mul nsw i32 %118, %117
  %120 = add nsw i32 %119, %116
  %121 = load i32, i32 addrspace(3)* %49, align 8, !tbaa !5
  %122 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !5
  %123 = mul nsw i32 %122, %121
  %124 = add nsw i32 %123, %120
  %125 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !5
  %126 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %127 = mul nsw i32 %126, %125
  %128 = add nsw i32 %127, %124
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = add nsw i32 %56, 16
  %130 = add nsw i32 %55, %9
  %131 = icmp slt i32 %129, %11
  br i1 %131, label %53, label %132, !llvm.loop !10

132:                                              ; preds = %53, %4
  %133 = phi i32 [ 0, %4 ], [ %128, %53 ]
  %134 = add i32 %12, %7
  %135 = add i32 %134, %14
  %136 = add i32 %135, %10
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %137
  store i32 %133, i32 addrspace(1)* %138, align 4, !tbaa !5
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
