; ModuleID = '../data/hip_kernels/977/10/main.cu'
source_filename = "../data/hip_kernels/977/10/main.cu"
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
  br i1 %13, label %15, label %70

15:                                               ; preds = %4
  %16 = add i32 %14, %7
  %17 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 %7
  %18 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 %7, i32 %8
  %19 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 0
  %20 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 %7, i32 0
  %21 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 4
  %22 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 %7, i32 4
  %23 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 8
  %24 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 %7, i32 8
  %25 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2As, i32 0, i32 %8, i32 12
  %26 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9MatrixMulPiS_S_iE2Bs, i32 0, i32 %7, i32 12
  %27 = bitcast i32 addrspace(3)* %19 to <4 x i32> addrspace(3)*
  %28 = bitcast i32 addrspace(3)* %20 to <4 x i32> addrspace(3)*
  %29 = bitcast i32 addrspace(3)* %21 to <4 x i32> addrspace(3)*
  %30 = bitcast i32 addrspace(3)* %22 to <4 x i32> addrspace(3)*
  %31 = bitcast i32 addrspace(3)* %23 to <4 x i32> addrspace(3)*
  %32 = bitcast i32 addrspace(3)* %24 to <4 x i32> addrspace(3)*
  %33 = bitcast i32 addrspace(3)* %25 to <4 x i32> addrspace(3)*
  %34 = bitcast i32 addrspace(3)* %26 to <4 x i32> addrspace(3)*
  br label %35

35:                                               ; preds = %15, %35
  %36 = phi i32 [ 0, %15 ], [ %66, %35 ]
  %37 = phi i32 [ %12, %15 ], [ %68, %35 ]
  %38 = phi i32 [ %10, %15 ], [ %67, %35 ]
  %39 = add i32 %16, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %42, i32 addrspace(3)* %17, align 4, !tbaa !5
  %43 = add i32 %16, %37
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %46, i32 addrspace(3)* %18, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = load <4 x i32>, <4 x i32> addrspace(3)* %27, align 16, !tbaa !5
  %48 = load <4 x i32>, <4 x i32> addrspace(3)* %28, align 16, !tbaa !5
  %49 = mul nsw <4 x i32> %48, %47
  %50 = load <4 x i32>, <4 x i32> addrspace(3)* %29, align 16, !tbaa !5
  %51 = load <4 x i32>, <4 x i32> addrspace(3)* %30, align 16, !tbaa !5
  %52 = mul nsw <4 x i32> %51, %50
  %53 = load <4 x i32>, <4 x i32> addrspace(3)* %31, align 16, !tbaa !5
  %54 = load <4 x i32>, <4 x i32> addrspace(3)* %32, align 16, !tbaa !5
  %55 = mul nsw <4 x i32> %54, %53
  %56 = load <4 x i32>, <4 x i32> addrspace(3)* %33, align 16, !tbaa !5
  %57 = load <4 x i32>, <4 x i32> addrspace(3)* %34, align 16, !tbaa !5
  %58 = mul nsw <4 x i32> %57, %56
  %59 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %49)
  %60 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %52)
  %61 = add i32 %59, %60
  %62 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %55)
  %63 = add i32 %61, %62
  %64 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %58)
  %65 = add i32 %63, %64
  %66 = add i32 %65, %36
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = add nsw i32 %38, 16
  %68 = add nsw i32 %37, %9
  %69 = icmp slt i32 %67, %11
  br i1 %69, label %35, label %70, !llvm.loop !10

70:                                               ; preds = %35, %4
  %71 = phi i32 [ 0, %4 ], [ %66, %35 ]
  %72 = add i32 %12, %7
  %73 = add i32 %72, %14
  %74 = add i32 %73, %10
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %75
  store i32 %71, i32 addrspace(1)* %76, align 4, !tbaa !5
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

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone willreturn }

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
