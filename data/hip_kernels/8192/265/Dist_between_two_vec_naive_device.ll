; ModuleID = '../data/hip_kernels/8192/265/main.cu'
source_filename = "../data/hip_kernels/8192/265/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26Dist_between_two_vec_naivePfS_iS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %2, 0
  br i1 %5, label %6, label %30

6:                                                ; preds = %4
  %7 = and i32 %2, 7
  %8 = icmp ult i32 %2, 8
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  %10 = and i32 %2, -8
  br label %32

11:                                               ; preds = %32, %6
  %12 = phi float [ undef, %6 ], [ %98, %32 ]
  %13 = phi i32 [ 0, %6 ], [ %99, %32 ]
  %14 = phi float [ 0.000000e+00, %6 ], [ %98, %32 ]
  %15 = icmp eq i32 %7, 0
  br i1 %15, label %30, label %16

16:                                               ; preds = %11, %16
  %17 = phi i32 [ %27, %16 ], [ %13, %11 ]
  %18 = phi float [ %26, %16 ], [ %14, %11 ]
  %19 = phi i32 [ %28, %16 ], [ 0, %11 ]
  %20 = zext i32 %17 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !4, !amdgpu.noclobber !8
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !4, !amdgpu.noclobber !8
  %25 = fsub contract float %22, %24
  %26 = fadd contract float %18, %25
  %27 = add nuw nsw i32 %17, 1
  %28 = add i32 %19, 1
  %29 = icmp eq i32 %28, %7
  br i1 %29, label %30, label %16, !llvm.loop !9

30:                                               ; preds = %11, %16, %4
  %31 = phi float [ 0.000000e+00, %4 ], [ %12, %11 ], [ %26, %16 ]
  store float %31, float addrspace(1)* %3, align 4, !tbaa !4
  ret void

32:                                               ; preds = %32, %9
  %33 = phi i32 [ 0, %9 ], [ %99, %32 ]
  %34 = phi float [ 0.000000e+00, %9 ], [ %98, %32 ]
  %35 = phi i32 [ 0, %9 ], [ %100, %32 ]
  %36 = zext i32 %33 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !4, !amdgpu.noclobber !8
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !4, !amdgpu.noclobber !8
  %41 = fsub contract float %38, %40
  %42 = fadd contract float %34, %41
  %43 = or i32 %33, 1
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !4, !amdgpu.noclobber !8
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !4, !amdgpu.noclobber !8
  %49 = fsub contract float %46, %48
  %50 = fadd contract float %42, %49
  %51 = or i32 %33, 2
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !4, !amdgpu.noclobber !8
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !4, !amdgpu.noclobber !8
  %57 = fsub contract float %54, %56
  %58 = fadd contract float %50, %57
  %59 = or i32 %33, 3
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !4, !amdgpu.noclobber !8
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !4, !amdgpu.noclobber !8
  %65 = fsub contract float %62, %64
  %66 = fadd contract float %58, %65
  %67 = or i32 %33, 4
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !4, !amdgpu.noclobber !8
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !4, !amdgpu.noclobber !8
  %73 = fsub contract float %70, %72
  %74 = fadd contract float %66, %73
  %75 = or i32 %33, 5
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !4, !amdgpu.noclobber !8
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !4, !amdgpu.noclobber !8
  %81 = fsub contract float %78, %80
  %82 = fadd contract float %74, %81
  %83 = or i32 %33, 6
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !4, !amdgpu.noclobber !8
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !4, !amdgpu.noclobber !8
  %89 = fsub contract float %86, %88
  %90 = fadd contract float %82, %89
  %91 = or i32 %33, 7
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !4, !amdgpu.noclobber !8
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !4, !amdgpu.noclobber !8
  %97 = fsub contract float %94, %96
  %98 = fadd contract float %90, %97
  %99 = add nuw nsw i32 %33, 8
  %100 = add i32 %35, 8
  %101 = icmp eq i32 %100, %10
  br i1 %101, label %11, label %32, !llvm.loop !11
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
