; ModuleID = '../data/hip_kernels/3265/77/main.cu'
source_filename = "../data/hip_kernels/3265/77/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11naiveKerneliPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %5, label %26

5:                                                ; preds = %3
  %6 = and i32 %0, 7
  %7 = icmp ult i32 %0, 8
  br i1 %7, label %10, label %8

8:                                                ; preds = %5
  %9 = and i32 %0, -8
  br label %30

10:                                               ; preds = %30, %5
  %11 = phi float [ undef, %5 ], [ %72, %30 ]
  %12 = phi i32 [ 0, %5 ], [ %73, %30 ]
  %13 = phi float [ 0.000000e+00, %5 ], [ %72, %30 ]
  %14 = icmp eq i32 %6, 0
  br i1 %14, label %26, label %15

15:                                               ; preds = %10, %15
  %16 = phi i32 [ %23, %15 ], [ %12, %10 ]
  %17 = phi float [ %22, %15 ], [ %13, %10 ]
  %18 = phi i32 [ %24, %15 ], [ 0, %10 ]
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !4, !amdgpu.noclobber !8
  %22 = fadd contract float %17, %21
  %23 = add nuw nsw i32 %16, 1
  %24 = add i32 %18, 1
  %25 = icmp eq i32 %24, %6
  br i1 %25, label %26, label %15, !llvm.loop !9

26:                                               ; preds = %10, %15, %3
  %27 = phi float [ 0.000000e+00, %3 ], [ %11, %10 ], [ %22, %15 ]
  %28 = sitofp i32 %0 to float
  %29 = fdiv contract float %27, %28
  store float %29, float addrspace(1)* %2, align 4, !tbaa !4
  ret void

30:                                               ; preds = %30, %8
  %31 = phi i32 [ 0, %8 ], [ %73, %30 ]
  %32 = phi float [ 0.000000e+00, %8 ], [ %72, %30 ]
  %33 = phi i32 [ 0, %8 ], [ %74, %30 ]
  %34 = zext i32 %31 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !4, !amdgpu.noclobber !8
  %37 = fadd contract float %32, %36
  %38 = or i32 %31, 1
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !4, !amdgpu.noclobber !8
  %42 = fadd contract float %37, %41
  %43 = or i32 %31, 2
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !4, !amdgpu.noclobber !8
  %47 = fadd contract float %42, %46
  %48 = or i32 %31, 3
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !4, !amdgpu.noclobber !8
  %52 = fadd contract float %47, %51
  %53 = or i32 %31, 4
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !4, !amdgpu.noclobber !8
  %57 = fadd contract float %52, %56
  %58 = or i32 %31, 5
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !4, !amdgpu.noclobber !8
  %62 = fadd contract float %57, %61
  %63 = or i32 %31, 6
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !4, !amdgpu.noclobber !8
  %67 = fadd contract float %62, %66
  %68 = or i32 %31, 7
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !4, !amdgpu.noclobber !8
  %72 = fadd contract float %67, %71
  %73 = add nuw nsw i32 %31, 8
  %74 = add i32 %33, 8
  %75 = icmp eq i32 %74, %9
  br i1 %75, label %10, label %30, !llvm.loop !11
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
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
