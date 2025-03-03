; ModuleID = '../data/hip_kernels/4037/52/main.cu'
source_filename = "../data/hip_kernels/4037/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3addiPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %5, label %25

5:                                                ; preds = %3
  %6 = and i32 %0, 7
  %7 = icmp ult i32 %0, 8
  br i1 %7, label %10, label %8

8:                                                ; preds = %5
  %9 = and i32 %0, -8
  br label %26

10:                                               ; preds = %26, %5
  %11 = phi i32 [ 0, %5 ], [ %84, %26 ]
  %12 = icmp eq i32 %6, 0
  br i1 %12, label %25, label %13

13:                                               ; preds = %10, %13
  %14 = phi i32 [ %22, %13 ], [ %11, %10 ]
  %15 = phi i32 [ %23, %13 ], [ 0, %10 ]
  %16 = zext i32 %14 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !4
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !4
  %21 = fadd contract float %18, %20
  store float %21, float addrspace(1)* %19, align 4, !tbaa !4
  %22 = add nuw nsw i32 %14, 1
  %23 = add i32 %15, 1
  %24 = icmp eq i32 %23, %6
  br i1 %24, label %25, label %13, !llvm.loop !8

25:                                               ; preds = %10, %13, %3
  ret void

26:                                               ; preds = %26, %8
  %27 = phi i32 [ 0, %8 ], [ %84, %26 ]
  %28 = phi i32 [ 0, %8 ], [ %85, %26 ]
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !4
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !4
  %34 = fadd contract float %31, %33
  store float %34, float addrspace(1)* %32, align 4, !tbaa !4
  %35 = or i32 %27, 1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !4
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !4
  %41 = fadd contract float %38, %40
  store float %41, float addrspace(1)* %39, align 4, !tbaa !4
  %42 = or i32 %27, 2
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !4
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !4
  %48 = fadd contract float %45, %47
  store float %48, float addrspace(1)* %46, align 4, !tbaa !4
  %49 = or i32 %27, 3
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !4
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !4
  %55 = fadd contract float %52, %54
  store float %55, float addrspace(1)* %53, align 4, !tbaa !4
  %56 = or i32 %27, 4
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !4
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !4
  %62 = fadd contract float %59, %61
  store float %62, float addrspace(1)* %60, align 4, !tbaa !4
  %63 = or i32 %27, 5
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !4
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !4
  %69 = fadd contract float %66, %68
  store float %69, float addrspace(1)* %67, align 4, !tbaa !4
  %70 = or i32 %27, 6
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !4
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !4
  %76 = fadd contract float %73, %75
  store float %76, float addrspace(1)* %74, align 4, !tbaa !4
  %77 = or i32 %27, 7
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !4
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !4
  %83 = fadd contract float %80, %82
  store float %83, float addrspace(1)* %81, align 4, !tbaa !4
  %84 = add nuw nsw i32 %27, 8
  %85 = add i32 %28, 8
  %86 = icmp eq i32 %85, %9
  br i1 %86, label %10, label %26, !llvm.loop !10
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
