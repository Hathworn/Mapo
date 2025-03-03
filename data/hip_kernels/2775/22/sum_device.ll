; ModuleID = '../data/hip_kernels/2775/22/main.cu'
source_filename = "../data/hip_kernels/2775/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3sumPKfPfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %5, label %26

5:                                                ; preds = %3
  %6 = and i32 %2, 7
  %7 = icmp ult i32 %2, 8
  br i1 %7, label %10, label %8

8:                                                ; preds = %5
  %9 = and i32 %2, -8
  br label %28

10:                                               ; preds = %28, %5
  %11 = phi float [ undef, %5 ], [ %70, %28 ]
  %12 = phi i32 [ 0, %5 ], [ %71, %28 ]
  %13 = phi float [ 0.000000e+00, %5 ], [ %70, %28 ]
  %14 = icmp eq i32 %6, 0
  br i1 %14, label %26, label %15

15:                                               ; preds = %10, %15
  %16 = phi i32 [ %23, %15 ], [ %12, %10 ]
  %17 = phi float [ %22, %15 ], [ %13, %10 ]
  %18 = phi i32 [ %24, %15 ], [ 0, %10 ]
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !4, !amdgpu.noclobber !8
  %22 = fadd contract float %17, %21
  %23 = add nuw nsw i32 %16, 1
  %24 = add i32 %18, 1
  %25 = icmp eq i32 %24, %6
  br i1 %25, label %26, label %15, !llvm.loop !9

26:                                               ; preds = %10, %15, %3
  %27 = phi float [ 0.000000e+00, %3 ], [ %11, %10 ], [ %22, %15 ]
  store float %27, float addrspace(1)* %1, align 4, !tbaa !4
  ret void

28:                                               ; preds = %28, %8
  %29 = phi i32 [ 0, %8 ], [ %71, %28 ]
  %30 = phi float [ 0.000000e+00, %8 ], [ %70, %28 ]
  %31 = phi i32 [ 0, %8 ], [ %72, %28 ]
  %32 = zext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !4, !amdgpu.noclobber !8
  %35 = fadd contract float %30, %34
  %36 = or i32 %29, 1
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !4, !amdgpu.noclobber !8
  %40 = fadd contract float %35, %39
  %41 = or i32 %29, 2
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !4, !amdgpu.noclobber !8
  %45 = fadd contract float %40, %44
  %46 = or i32 %29, 3
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !4, !amdgpu.noclobber !8
  %50 = fadd contract float %45, %49
  %51 = or i32 %29, 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !4, !amdgpu.noclobber !8
  %55 = fadd contract float %50, %54
  %56 = or i32 %29, 5
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !4, !amdgpu.noclobber !8
  %60 = fadd contract float %55, %59
  %61 = or i32 %29, 6
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !4, !amdgpu.noclobber !8
  %65 = fadd contract float %60, %64
  %66 = or i32 %29, 7
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !4, !amdgpu.noclobber !8
  %70 = fadd contract float %65, %69
  %71 = add nuw nsw i32 %29, 8
  %72 = add i32 %31, 8
  %73 = icmp eq i32 %72, %9
  br i1 %73, label %10, label %28, !llvm.loop !11
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
