; ModuleID = '../data/hip_kernels/3265/73/main.cu'
source_filename = "../data/hip_kernels/3265/73/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10smemKerneliPfS_E4buff = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10smemKerneliPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add nsw i32 %10, %11
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %16, label %14

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  br label %22

16:                                               ; preds = %3
  %17 = add nuw nsw i32 %0, 15
  %18 = lshr i32 %17, 4
  %19 = icmp slt i32 %12, %0
  %20 = sext i32 %12 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 %20
  br label %28

22:                                               ; preds = %59, %14
  %23 = phi i64 [ %15, %14 ], [ %20, %59 ]
  %24 = sitofp i32 %0 to float
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %23
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %27 = fdiv contract float %26, %24
  store float %27, float addrspace(1)* %25, align 4, !tbaa !7
  ret void

28:                                               ; preds = %16, %59
  %29 = phi i32 [ 0, %16 ], [ %60, %59 ]
  %30 = shl nsw i32 %29, 4
  %31 = add nuw nsw i32 %30, 16
  %32 = tail call i32 @llvm.smin.i32(i32 %31, i32 %0)
  %33 = add nuw nsw i32 %30, %11
  %34 = icmp slt i32 %33, %32
  br i1 %34, label %40, label %35

35:                                               ; preds = %40, %28
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp slt i32 %30, %32
  %37 = select i1 %19, i1 %36, i1 false
  br i1 %37, label %38, label %59

38:                                               ; preds = %35
  %39 = load float, float addrspace(1)* %21, align 4, !tbaa !7
  br label %49

40:                                               ; preds = %28, %40
  %41 = phi i32 [ %47, %40 ], [ %33, %28 ]
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = sub nuw nsw i32 %41, %30
  %46 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ10smemKerneliPfS_E4buff, i32 0, i32 %45
  store float %44, float addrspace(3)* %46, align 4, !tbaa !7
  %47 = add nuw nsw i32 %41, %8
  %48 = icmp slt i32 %47, %32
  br i1 %48, label %40, label %35, !llvm.loop !11

49:                                               ; preds = %38, %49
  %50 = phi float [ %39, %38 ], [ %55, %49 ]
  %51 = phi i32 [ %30, %38 ], [ %56, %49 ]
  %52 = sub nuw nsw i32 %51, %30
  %53 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ10smemKerneliPfS_E4buff, i32 0, i32 %52
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %55 = fadd contract float %54, %50
  %56 = add nuw nsw i32 %51, 1
  %57 = icmp slt i32 %56, %32
  br i1 %57, label %49, label %58, !llvm.loop !13

58:                                               ; preds = %49
  store float %55, float addrspace(1)* %21, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %58, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %60 = add nuw nsw i32 %29, 1
  %61 = icmp eq i32 %60, %18
  br i1 %61, label %22, label %28, !llvm.loop !14
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
