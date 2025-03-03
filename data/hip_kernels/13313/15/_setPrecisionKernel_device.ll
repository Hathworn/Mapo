; ModuleID = '../data/hip_kernels/13313/15/main.cu'
source_filename = "../data/hip_kernels/13313/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19_setPrecisionKernelPfmPi(float addrspace(1)* nocapture %0, i64 %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = zext i32 %12 to i64
  %14 = icmp ult i64 %13, %1
  br i1 %14, label %15, label %51

15:                                               ; preds = %3
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %13
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %43, label %19

19:                                               ; preds = %15
  %20 = and i32 %17, 7
  %21 = icmp ult i32 %17, 8
  br i1 %21, label %30, label %22

22:                                               ; preds = %19
  %23 = and i32 %17, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 1, %22 ], [ %27, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %28, %24 ]
  %27 = mul i32 %25, 100000000
  %28 = add i32 %26, 8
  %29 = icmp eq i32 %28, %23
  br i1 %29, label %30, label %24, !llvm.loop !11

30:                                               ; preds = %24, %19
  %31 = phi i32 [ undef, %19 ], [ %27, %24 ]
  %32 = phi i32 [ 1, %19 ], [ %27, %24 ]
  %33 = icmp eq i32 %20, 0
  br i1 %33, label %40, label %34

34:                                               ; preds = %30, %34
  %35 = phi i32 [ %37, %34 ], [ %32, %30 ]
  %36 = phi i32 [ %38, %34 ], [ 0, %30 ]
  %37 = mul nsw i32 %35, 10
  %38 = add i32 %36, 1
  %39 = icmp eq i32 %38, %20
  br i1 %39, label %40, label %34, !llvm.loop !13

40:                                               ; preds = %34, %30
  %41 = phi i32 [ %31, %30 ], [ %37, %34 ]
  %42 = sitofp i32 %41 to float
  br label %43

43:                                               ; preds = %40, %15
  %44 = phi float [ 1.000000e+00, %15 ], [ %42, %40 ]
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !15, !amdgpu.noclobber !5
  %47 = fmul contract float %46, %44
  %48 = fptosi float %47 to i32
  %49 = sitofp i32 %48 to float
  %50 = fdiv contract float %49, %44
  store float %50, float addrspace(1)* %45, align 4, !tbaa !15
  br label %51

51:                                               ; preds = %3, %43
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !9, i64 0}
