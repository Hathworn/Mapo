; ModuleID = '../data/hip_kernels/10355/1/main.cu'
source_filename = "../data/hip_kernels/10355/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21calculoAlgoritmoTrocaPfiiii(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp sgt i32 %14, %4
  %16 = icmp eq i32 %14, %1
  %17 = select i1 %15, i1 true, i1 %16
  br i1 %17, label %50, label %18

18:                                               ; preds = %5
  %19 = mul nsw i32 %14, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = icmp sgt i32 %3, 0
  br i1 %24, label %25, label %50

25:                                               ; preds = %18
  %26 = mul nsw i32 %4, %3
  %27 = mul nsw i32 %3, %1
  br label %28

28:                                               ; preds = %25, %47
  %29 = phi i32 [ 0, %25 ], [ %48, %47 ]
  %30 = add nsw i32 %29, %19
  %31 = icmp sgt i32 %30, %26
  br i1 %31, label %50, label %32

32:                                               ; preds = %28
  %33 = icmp eq i32 %29, %2
  br i1 %33, label %34, label %37

34:                                               ; preds = %32
  %35 = sext i32 %30 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  store float 0.000000e+00, float addrspace(1)* %36, align 4, !tbaa !7
  br label %47

37:                                               ; preds = %32
  %38 = add nsw i32 %29, %27
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = sext i32 %30 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = fmul contract float %23, %41
  %46 = fsub contract float %44, %45
  store float %46, float addrspace(1)* %43, align 4, !tbaa !7
  br label %47

47:                                               ; preds = %34, %37
  %48 = add nuw nsw i32 %29, 1
  %49 = icmp eq i32 %48, %3
  br i1 %49, label %50, label %28, !llvm.loop !11

50:                                               ; preds = %28, %47, %18, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
