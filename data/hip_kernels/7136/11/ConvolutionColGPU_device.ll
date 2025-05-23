; ModuleID = '../data/hip_kernels/7136/11/main.cu'
source_filename = "../data/hip_kernels/7136/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17ConvolutionColGPUPfS_S_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = icmp slt i32 %3, 0
  br i1 %7, label %21, label %8

8:                                                ; preds = %4
  %9 = sub nsw i32 0, %3
  %10 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul nuw nsw i32 %6, %16
  %18 = add nuw nsw i32 %17, %5
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  br label %22

21:                                               ; preds = %43, %4
  ret void

22:                                               ; preds = %8, %43
  %23 = phi float [ 0.000000e+00, %8 ], [ %44, %43 ]
  %24 = phi i32 [ %9, %8 ], [ %45, %43 ]
  %25 = add nsw i32 %24, %6
  %26 = icmp sgt i32 %25, -1
  br i1 %26, label %27, label %43

27:                                               ; preds = %22
  %28 = load i16, i16 addrspace(4)* %12, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = icmp ult i32 %25, %29
  br i1 %30, label %31, label %43

31:                                               ; preds = %27
  %32 = mul i32 %25, %16
  %33 = add i32 %32, %5
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = sub nsw i32 %3, %24
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = fmul contract float %36, %40
  %42 = fadd contract float %23, %41
  br label %43

43:                                               ; preds = %31, %27, %22
  %44 = phi float [ %42, %31 ], [ %23, %27 ], [ %23, %22 ]
  store float %44, float addrspace(1)* %20, align 4, !tbaa !7
  %45 = add i32 %24, 1
  %46 = icmp eq i32 %24, %3
  br i1 %46, label %21, label %22, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
