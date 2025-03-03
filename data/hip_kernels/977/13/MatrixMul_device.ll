; ModuleID = '../data/hip_kernels/977/13/main.cu'
source_filename = "../data/hip_kernels/977/13/main.cu"
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
  br i1 %13, label %15, label %130

15:                                               ; preds = %4
  %16 = add i32 %14, %7
  %17 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 %7
  %18 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 %8, i32 %7
  %19 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 0
  %20 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 0, i32 %7
  %21 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 1
  %22 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 1, i32 %7
  %23 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 2
  %24 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 2, i32 %7
  %25 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 3
  %26 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 3, i32 %7
  %27 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 4
  %28 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 4, i32 %7
  %29 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 5
  %30 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 5, i32 %7
  %31 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 6
  %32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 6, i32 %7
  %33 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 7
  %34 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 7, i32 %7
  %35 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 8
  %36 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 8, i32 %7
  %37 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 9
  %38 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 9, i32 %7
  %39 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 10
  %40 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 10, i32 %7
  %41 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 11
  %42 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 11, i32 %7
  %43 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 12
  %44 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 12, i32 %7
  %45 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 13
  %46 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 13, i32 %7
  %47 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 14
  %48 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 14, i32 %7
  %49 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 15
  %50 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 15, i32 %7
  br label %51

51:                                               ; preds = %15, %51
  %52 = phi i32 [ 0, %15 ], [ %126, %51 ]
  %53 = phi i32 [ %12, %15 ], [ %128, %51 ]
  %54 = phi i32 [ %10, %15 ], [ %127, %51 ]
  %55 = add i32 %16, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %58, i32 addrspace(3)* %17, align 4, !tbaa !5
  %59 = add i32 %16, %53
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %62, i32 addrspace(3)* %18, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = load i32, i32 addrspace(3)* %19, align 16, !tbaa !5
  %64 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !5
  %65 = mul nsw i32 %64, %63
  %66 = add nsw i32 %65, %52
  %67 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !5
  %68 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !5
  %69 = mul nsw i32 %68, %67
  %70 = add nsw i32 %66, %69
  %71 = load i32, i32 addrspace(3)* %23, align 8, !tbaa !5
  %72 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %73 = mul nsw i32 %72, %71
  %74 = add nsw i32 %70, %73
  %75 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !5
  %76 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !5
  %77 = mul nsw i32 %76, %75
  %78 = add nsw i32 %74, %77
  %79 = load i32, i32 addrspace(3)* %27, align 16, !tbaa !5
  %80 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %81 = mul nsw i32 %80, %79
  %82 = add nsw i32 %78, %81
  %83 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %84 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !5
  %85 = mul nsw i32 %84, %83
  %86 = add nsw i32 %82, %85
  %87 = load i32, i32 addrspace(3)* %31, align 8, !tbaa !5
  %88 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %89 = mul nsw i32 %88, %87
  %90 = add nsw i32 %86, %89
  %91 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !5
  %92 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !5
  %93 = mul nsw i32 %92, %91
  %94 = add nsw i32 %90, %93
  %95 = load i32, i32 addrspace(3)* %35, align 16, !tbaa !5
  %96 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !5
  %97 = mul nsw i32 %96, %95
  %98 = add nsw i32 %94, %97
  %99 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %100 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %101 = mul nsw i32 %100, %99
  %102 = add nsw i32 %98, %101
  %103 = load i32, i32 addrspace(3)* %39, align 8, !tbaa !5
  %104 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %105 = mul nsw i32 %104, %103
  %106 = add nsw i32 %102, %105
  %107 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %108 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %109 = mul nsw i32 %108, %107
  %110 = add nsw i32 %106, %109
  %111 = load i32, i32 addrspace(3)* %43, align 16, !tbaa !5
  %112 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !5
  %113 = mul nsw i32 %112, %111
  %114 = add nsw i32 %110, %113
  %115 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !5
  %116 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %117 = mul nsw i32 %116, %115
  %118 = add nsw i32 %114, %117
  %119 = load i32, i32 addrspace(3)* %47, align 8, !tbaa !5
  %120 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !5
  %121 = mul nsw i32 %120, %119
  %122 = add nsw i32 %118, %121
  %123 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %124 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !5
  %125 = mul nsw i32 %124, %123
  %126 = add nsw i32 %122, %125
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %127 = add nsw i32 %54, 16
  %128 = add nsw i32 %53, %9
  %129 = icmp slt i32 %127, %11
  br i1 %129, label %51, label %130, !llvm.loop !10

130:                                              ; preds = %51, %4
  %131 = phi i32 [ 0, %4 ], [ %126, %51 ]
  %132 = add i32 %12, %7
  %133 = add i32 %132, %14
  %134 = add i32 %133, %10
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %135
  store i32 %131, i32 addrspace(1)* %136, align 4, !tbaa !5
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
