; ModuleID = '../data/hip_kernels/10706/61/main.cu'
source_filename = "../data/hip_kernels/10706/61/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10longKernelPfif(float addrspace(1)* nocapture %0, i32 %1, float %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %23

5:                                                ; preds = %3
  %6 = and i32 %1, 7
  %7 = icmp ult i32 %1, 8
  br i1 %7, label %10, label %8

8:                                                ; preds = %5
  %9 = and i32 %1, -8
  br label %24

10:                                               ; preds = %24, %5
  %11 = phi i32 [ 0, %5 ], [ %66, %24 ]
  %12 = icmp eq i32 %6, 0
  br i1 %12, label %23, label %13

13:                                               ; preds = %10, %13
  %14 = phi i32 [ %20, %13 ], [ %11, %10 ]
  %15 = phi i32 [ %21, %13 ], [ 0, %10 ]
  %16 = zext i32 %14 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !4
  %19 = fadd contract float %18, %2
  store float %19, float addrspace(1)* %17, align 4, !tbaa !4
  %20 = add nuw nsw i32 %14, 1
  %21 = add i32 %15, 1
  %22 = icmp eq i32 %21, %6
  br i1 %22, label %23, label %13, !llvm.loop !8

23:                                               ; preds = %10, %13, %3
  ret void

24:                                               ; preds = %24, %8
  %25 = phi i32 [ 0, %8 ], [ %66, %24 ]
  %26 = phi i32 [ 0, %8 ], [ %67, %24 ]
  %27 = zext i32 %25 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !4
  %30 = fadd contract float %29, %2
  store float %30, float addrspace(1)* %28, align 4, !tbaa !4
  %31 = or i32 %25, 1
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !4
  %35 = fadd contract float %34, %2
  store float %35, float addrspace(1)* %33, align 4, !tbaa !4
  %36 = or i32 %25, 2
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !4
  %40 = fadd contract float %39, %2
  store float %40, float addrspace(1)* %38, align 4, !tbaa !4
  %41 = or i32 %25, 3
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !4
  %45 = fadd contract float %44, %2
  store float %45, float addrspace(1)* %43, align 4, !tbaa !4
  %46 = or i32 %25, 4
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !4
  %50 = fadd contract float %49, %2
  store float %50, float addrspace(1)* %48, align 4, !tbaa !4
  %51 = or i32 %25, 5
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !4
  %55 = fadd contract float %54, %2
  store float %55, float addrspace(1)* %53, align 4, !tbaa !4
  %56 = or i32 %25, 6
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !4
  %60 = fadd contract float %59, %2
  store float %60, float addrspace(1)* %58, align 4, !tbaa !4
  %61 = or i32 %25, 7
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !4
  %65 = fadd contract float %64, %2
  store float %65, float addrspace(1)* %63, align 4, !tbaa !4
  %66 = add nuw nsw i32 %25, 8
  %67 = add i32 %26, 8
  %68 = icmp eq i32 %67, %9
  br i1 %68, label %10, label %24, !llvm.loop !10
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
