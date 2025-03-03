; ModuleID = '../data/hip_kernels/13211/14/main.cu'
source_filename = "../data/hip_kernels/13211/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9serialsumiPKdPd(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = load double, double addrspace(1)* %1, align 8, !tbaa !4, !amdgpu.noclobber !8
  store double %4, double addrspace(1)* %2, align 8, !tbaa !4
  %5 = icmp sgt i32 %0, 1
  br i1 %5, label %6, label %28

6:                                                ; preds = %3
  %7 = add i32 %0, -1
  %8 = add i32 %0, -2
  %9 = and i32 %7, 7
  %10 = icmp ult i32 %8, 7
  br i1 %10, label %13, label %11

11:                                               ; preds = %6
  %12 = and i32 %7, -8
  br label %29

13:                                               ; preds = %29, %6
  %14 = phi double [ %4, %6 ], [ %71, %29 ]
  %15 = phi i32 [ 1, %6 ], [ %72, %29 ]
  %16 = icmp eq i32 %9, 0
  br i1 %16, label %28, label %17

17:                                               ; preds = %13, %17
  %18 = phi double [ %24, %17 ], [ %14, %13 ]
  %19 = phi i32 [ %25, %17 ], [ %15, %13 ]
  %20 = phi i32 [ %26, %17 ], [ 0, %13 ]
  %21 = zext i32 %19 to i64
  %22 = getelementptr inbounds double, double addrspace(1)* %1, i64 %21
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !4
  %24 = fadd contract double %23, %18
  store double %24, double addrspace(1)* %2, align 8, !tbaa !4
  %25 = add nuw nsw i32 %19, 1
  %26 = add i32 %20, 1
  %27 = icmp eq i32 %26, %9
  br i1 %27, label %28, label %17, !llvm.loop !9

28:                                               ; preds = %13, %17, %3
  ret void

29:                                               ; preds = %29, %11
  %30 = phi double [ %4, %11 ], [ %71, %29 ]
  %31 = phi i32 [ 1, %11 ], [ %72, %29 ]
  %32 = phi i32 [ 0, %11 ], [ %73, %29 ]
  %33 = zext i32 %31 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !4
  %36 = fadd contract double %35, %30
  store double %36, double addrspace(1)* %2, align 8, !tbaa !4
  %37 = add nuw nsw i32 %31, 1
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %1, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !4
  %41 = fadd contract double %40, %36
  store double %41, double addrspace(1)* %2, align 8, !tbaa !4
  %42 = add nuw nsw i32 %31, 2
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %1, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !4
  %46 = fadd contract double %45, %41
  store double %46, double addrspace(1)* %2, align 8, !tbaa !4
  %47 = add nuw nsw i32 %31, 3
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !4
  %51 = fadd contract double %50, %46
  store double %51, double addrspace(1)* %2, align 8, !tbaa !4
  %52 = add nuw nsw i32 %31, 4
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !4
  %56 = fadd contract double %55, %51
  store double %56, double addrspace(1)* %2, align 8, !tbaa !4
  %57 = add nuw nsw i32 %31, 5
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !4
  %61 = fadd contract double %60, %56
  store double %61, double addrspace(1)* %2, align 8, !tbaa !4
  %62 = add nuw nsw i32 %31, 6
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %1, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !4
  %66 = fadd contract double %65, %61
  store double %66, double addrspace(1)* %2, align 8, !tbaa !4
  %67 = add nuw nsw i32 %31, 7
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !4
  %71 = fadd contract double %70, %66
  store double %71, double addrspace(1)* %2, align 8, !tbaa !4
  %72 = add nuw nsw i32 %31, 8
  %73 = add i32 %32, 8
  %74 = icmp eq i32 %73, %12
  br i1 %74, label %13, label %29, !llvm.loop !11
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
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
