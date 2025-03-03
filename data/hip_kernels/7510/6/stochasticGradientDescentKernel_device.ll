; ModuleID = '../data/hip_kernels/7510/6/main.cu'
source_filename = "../data/hip_kernels/7510/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31stochasticGradientDescentKerneliPiS_iPfS0_f(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %9
  %11 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !4, !amdgpu.noclobber !8
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %9
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !4, !amdgpu.noclobber !8
  %14 = icmp ne i32 %11, -1
  %15 = icmp sgt i32 %13, 0
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %54

17:                                               ; preds = %7
  %18 = sitofp i32 %13 to float
  %19 = fdiv contract float 1.000000e+00, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !9, !invariant.load !8
  %25 = zext i16 %24 to i32
  %26 = mul i32 %20, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %28 = add i32 %26, %27
  %29 = mul i32 %28, %0
  %30 = mul nsw i32 %11, %3
  %31 = add nsw i32 %29, %30
  %32 = add nsw i32 %31, %0
  %33 = add nsw i32 %30, %3
  %34 = tail call i32 @llvm.smin.i32(i32 %32, i32 %33)
  %35 = icmp slt i32 %31, %34
  br i1 %35, label %36, label %54

36:                                               ; preds = %17
  %37 = mul nsw i32 %8, %3
  %38 = add nsw i32 %29, %37
  br label %39

39:                                               ; preds = %36, %39
  %40 = phi i32 [ %51, %39 ], [ %31, %36 ]
  %41 = phi i32 [ %52, %39 ], [ %38, %36 ]
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !11
  %45 = fmul contract float %19, %44
  %46 = fmul contract float %45, %6
  %47 = sext i32 %40 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %4, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !11
  %50 = fsub contract float %49, %46
  store float %50, float addrspace(1)* %48, align 4, !tbaa !11
  %51 = add nsw i32 %40, 1
  %52 = add nsw i32 %41, 1
  %53 = icmp slt i32 %51, %34
  br i1 %53, label %39, label %54, !llvm.loop !13

54:                                               ; preds = %39, %17, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
