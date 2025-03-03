; ModuleID = '../data/hip_kernels/12202/0/main.cu'
source_filename = "../data/hip_kernels/12202/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15MatrixMulKerneliiiiiiPjS_S_E2As = internal unnamed_addr addrspace(3) global [2 x [2 x i32]] undef, align 16
@_ZZ15MatrixMulKerneliiiiiiPjS_S_E2Bs = internal unnamed_addr addrspace(3) global [2 x [2 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15MatrixMulKerneliiiiiiPjS_S_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 1
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = shl i32 %14, 1
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = add i32 %15, %16
  %18 = icmp sgt i32 %1, 0
  br i1 %18, label %19, label %31

19:                                               ; preds = %9
  %20 = add nuw nsw i32 %1, 1
  %21 = lshr i32 %20, 1
  %22 = icmp slt i32 %13, %0
  %23 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(3)* @_ZZ15MatrixMulKerneliiiiiiPjS_S_E2As, i32 0, i32 %12, i32 %16
  %24 = mul nsw i32 %13, %1
  %25 = icmp slt i32 %17, %3
  %26 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(3)* @_ZZ15MatrixMulKerneliiiiiiPjS_S_E2Bs, i32 0, i32 %12, i32 %16
  %27 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(3)* @_ZZ15MatrixMulKerneliiiiiiPjS_S_E2As, i32 0, i32 %12, i32 0
  %28 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(3)* @_ZZ15MatrixMulKerneliiiiiiPjS_S_E2Bs, i32 0, i32 0, i32 %16
  %29 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(3)* @_ZZ15MatrixMulKerneliiiiiiPjS_S_E2As, i32 0, i32 %12, i32 1
  %30 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(3)* @_ZZ15MatrixMulKerneliiiiiiPjS_S_E2Bs, i32 0, i32 1, i32 %16
  br label %36

31:                                               ; preds = %59, %9
  %32 = phi i32 [ 0, %9 ], [ %68, %59 ]
  %33 = icmp slt i32 %13, %4
  %34 = icmp slt i32 %17, %5
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %71, label %89

36:                                               ; preds = %19, %59
  %37 = phi i32 [ 0, %19 ], [ %69, %59 ]
  %38 = phi i32 [ 0, %19 ], [ %68, %59 ]
  %39 = shl nuw nsw i32 %37, 1
  %40 = add nuw i32 %39, %16
  %41 = icmp ult i32 %40, %1
  %42 = select i1 %41, i1 %22, i1 false
  br i1 %42, label %43, label %48

43:                                               ; preds = %36
  %44 = add i32 %40, %24
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %48

48:                                               ; preds = %36, %43
  %49 = phi i32 [ %47, %43 ], [ 0, %36 ]
  store i32 %49, i32 addrspace(3)* %23, align 4, !tbaa !5
  %50 = add nuw i32 %39, %12
  %51 = icmp ult i32 %50, %2
  %52 = select i1 %51, i1 %25, i1 false
  br i1 %52, label %53, label %59

53:                                               ; preds = %48
  %54 = mul i32 %50, %3
  %55 = add i32 %54, %17
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %59

59:                                               ; preds = %48, %53
  %60 = phi i32 [ %58, %53 ], [ 0, %48 ]
  store i32 %60, i32 addrspace(3)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = load i32, i32 addrspace(3)* %27, align 8, !tbaa !5
  %62 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %63 = mul nsw i32 %62, %61
  %64 = add nsw i32 %63, %38
  %65 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %66 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !5
  %67 = mul nsw i32 %66, %65
  %68 = add nsw i32 %67, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = add nuw nsw i32 %37, 1
  %70 = icmp eq i32 %69, %21
  br i1 %70, label %31, label %36, !llvm.loop !10

71:                                               ; preds = %31
  %72 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %73 = getelementptr i8, i8 addrspace(4)* %72, i64 6
  %74 = bitcast i8 addrspace(4)* %73 to i16 addrspace(4)*
  %75 = load i16, i16 addrspace(4)* %74, align 2, !range !12, !invariant.load !9
  %76 = zext i16 %75 to i32
  %77 = mul i32 %10, %76
  %78 = add i32 %77, %12
  %79 = mul i32 %78, %5
  %80 = getelementptr i8, i8 addrspace(4)* %72, i64 4
  %81 = bitcast i8 addrspace(4)* %80 to i16 addrspace(4)*
  %82 = load i16, i16 addrspace(4)* %81, align 4, !range !12, !invariant.load !9
  %83 = zext i16 %82 to i32
  %84 = mul i32 %14, %83
  %85 = add i32 %84, %16
  %86 = add i32 %85, %79
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %87
  store i32 %32, i32 addrspace(1)* %88, align 4, !tbaa !5
  br label %89

89:                                               ; preds = %71, %31
  ret void
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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{i16 1, i16 1025}
