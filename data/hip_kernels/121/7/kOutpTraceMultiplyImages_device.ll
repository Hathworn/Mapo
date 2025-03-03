; ModuleID = '../data/hip_kernels/121/7/main.cu'
source_filename = "../data/hip_kernels/121/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24kOutpTraceMultiplyImagesPfS_iiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul nsw i32 %4, %2
  %10 = mul i32 %9, %7
  %11 = mul i32 %10, %5
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = mul nsw i32 %8, %2
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %13, i64 %15
  %17 = sext i32 %10 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %19 = getelementptr inbounds float, float addrspace(1)* %18, i64 %15
  %20 = icmp sgt i32 %5, 0
  br i1 %20, label %21, label %27

21:                                               ; preds = %6
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %23 = icmp slt i32 %22, %2
  %24 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  br label %28

27:                                               ; preds = %34, %6
  ret void

28:                                               ; preds = %21, %34
  %29 = phi i32 [ 0, %21 ], [ %35, %34 ]
  br i1 %23, label %30, label %34

30:                                               ; preds = %28
  %31 = mul nsw i32 %29, %9
  %32 = load i16, i16 addrspace(4)* %26, align 4, !range !5, !invariant.load !6
  %33 = zext i16 %32 to i32
  br label %37

34:                                               ; preds = %37, %28
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = add nuw nsw i32 %29, 1
  %36 = icmp eq i32 %35, %5
  br i1 %36, label %27, label %28, !llvm.loop !7

37:                                               ; preds = %30, %37
  %38 = phi i32 [ %22, %30 ], [ %47, %37 ]
  %39 = add nsw i32 %38, %31
  %40 = sext i32 %38 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %19, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !9
  %43 = sext i32 %39 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %16, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !9
  %46 = fmul contract float %42, %45
  store float %46, float addrspace(1)* %44, align 4, !tbaa !9
  %47 = add i32 %38, %33
  %48 = icmp slt i32 %47, %2
  br i1 %48, label %37, label %34, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
