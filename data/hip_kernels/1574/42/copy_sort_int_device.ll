; ModuleID = '../data/hip_kernels/1574/42/main.cu'
source_filename = "../data/hip_kernels/1574/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13copy_sort_intPKfPKjjPf(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = icmp eq i32 %2, 0
  br i1 %5, label %27, label %6

6:                                                ; preds = %4
  %7 = and i32 %2, 7
  %8 = icmp ult i32 %2, 8
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  %10 = and i32 %2, -8
  br label %28

11:                                               ; preds = %28, %6
  %12 = phi i32 [ 0, %6 ], [ %94, %28 ]
  %13 = icmp eq i32 %7, 0
  br i1 %13, label %27, label %14

14:                                               ; preds = %11, %14
  %15 = phi i32 [ %24, %14 ], [ %12, %11 ]
  %16 = phi i32 [ %25, %14 ], [ 0, %11 ]
  %17 = zext i32 %15 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !4
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !8, !amdgpu.noclobber !10
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %3, i64 %22
  store float %19, float addrspace(1)* %23, align 4, !tbaa !4
  %24 = add nuw nsw i32 %15, 1
  %25 = add i32 %16, 1
  %26 = icmp eq i32 %25, %7
  br i1 %26, label %27, label %14, !llvm.loop !11

27:                                               ; preds = %11, %14, %4
  ret void

28:                                               ; preds = %28, %9
  %29 = phi i32 [ 0, %9 ], [ %94, %28 ]
  %30 = phi i32 [ 0, %9 ], [ %95, %28 ]
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !4
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !8, !amdgpu.noclobber !10
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  store float %33, float addrspace(1)* %37, align 4, !tbaa !4
  %38 = or i32 %29, 1
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !4
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %39
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !8, !amdgpu.noclobber !10
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  store float %41, float addrspace(1)* %45, align 4, !tbaa !4
  %46 = or i32 %29, 2
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !4
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !8, !amdgpu.noclobber !10
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  store float %49, float addrspace(1)* %53, align 4, !tbaa !4
  %54 = or i32 %29, 3
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !4
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !8, !amdgpu.noclobber !10
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %60
  store float %57, float addrspace(1)* %61, align 4, !tbaa !4
  %62 = or i32 %29, 4
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !4
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %63
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !8, !amdgpu.noclobber !10
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %3, i64 %68
  store float %65, float addrspace(1)* %69, align 4, !tbaa !4
  %70 = or i32 %29, 5
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !4
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !8, !amdgpu.noclobber !10
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %3, i64 %76
  store float %73, float addrspace(1)* %77, align 4, !tbaa !4
  %78 = or i32 %29, 6
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !4
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !8, !amdgpu.noclobber !10
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %84
  store float %81, float addrspace(1)* %85, align 4, !tbaa !4
  %86 = or i32 %29, 7
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !4
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %87
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !8, !amdgpu.noclobber !10
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %3, i64 %92
  store float %89, float addrspace(1)* %93, align 4, !tbaa !4
  %94 = add nuw nsw i32 %29, 8
  %95 = add i32 %30, 8
  %96 = icmp eq i32 %95, %10
  br i1 %96, label %11, label %28, !llvm.loop !13
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
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
