; ModuleID = '../data/hip_kernels/17697/10/main.cu'
source_filename = "../data/hip_kernels/17697/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16reduce_sum_finalPKfPfj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  store float 0.000000e+00, float addrspace(1)* %1, align 4, !tbaa !4
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %25, label %5

5:                                                ; preds = %3
  %6 = and i32 %2, 7
  %7 = icmp ult i32 %2, 8
  br i1 %7, label %10, label %8

8:                                                ; preds = %5
  %9 = and i32 %2, -8
  br label %26

10:                                               ; preds = %26, %5
  %11 = phi float [ 0.000000e+00, %5 ], [ %68, %26 ]
  %12 = phi i32 [ 0, %5 ], [ %69, %26 ]
  %13 = icmp eq i32 %6, 0
  br i1 %13, label %25, label %14

14:                                               ; preds = %10, %14
  %15 = phi float [ %21, %14 ], [ %11, %10 ]
  %16 = phi i32 [ %22, %14 ], [ %12, %10 ]
  %17 = phi i32 [ %23, %14 ], [ 0, %10 ]
  %18 = zext i32 %16 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !4
  %21 = fadd contract float %20, %15
  store float %21, float addrspace(1)* %1, align 4, !tbaa !4
  %22 = add nuw nsw i32 %16, 1
  %23 = add i32 %17, 1
  %24 = icmp eq i32 %23, %6
  br i1 %24, label %25, label %14, !llvm.loop !8

25:                                               ; preds = %10, %14, %3
  ret void

26:                                               ; preds = %26, %8
  %27 = phi float [ 0.000000e+00, %8 ], [ %68, %26 ]
  %28 = phi i32 [ 0, %8 ], [ %69, %26 ]
  %29 = phi i32 [ 0, %8 ], [ %70, %26 ]
  %30 = zext i32 %28 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !4
  %33 = fadd contract float %32, %27
  store float %33, float addrspace(1)* %1, align 4, !tbaa !4
  %34 = or i32 %28, 1
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !4
  %38 = fadd contract float %37, %33
  store float %38, float addrspace(1)* %1, align 4, !tbaa !4
  %39 = or i32 %28, 2
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !4
  %43 = fadd contract float %42, %38
  store float %43, float addrspace(1)* %1, align 4, !tbaa !4
  %44 = or i32 %28, 3
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !4
  %48 = fadd contract float %47, %43
  store float %48, float addrspace(1)* %1, align 4, !tbaa !4
  %49 = or i32 %28, 4
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !4
  %53 = fadd contract float %52, %48
  store float %53, float addrspace(1)* %1, align 4, !tbaa !4
  %54 = or i32 %28, 5
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !4
  %58 = fadd contract float %57, %53
  store float %58, float addrspace(1)* %1, align 4, !tbaa !4
  %59 = or i32 %28, 6
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !4
  %63 = fadd contract float %62, %58
  store float %63, float addrspace(1)* %1, align 4, !tbaa !4
  %64 = or i32 %28, 7
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !4
  %68 = fadd contract float %67, %63
  store float %68, float addrspace(1)* %1, align 4, !tbaa !4
  %69 = add nuw nsw i32 %28, 8
  %70 = add i32 %29, 8
  %71 = icmp eq i32 %70, %9
  br i1 %71, label %10, label %26, !llvm.loop !10
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
