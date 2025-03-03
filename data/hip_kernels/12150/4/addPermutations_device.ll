; ModuleID = '../data/hip_kernels/12150/4/main.cu'
source_filename = "../data/hip_kernels/12150/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15addPermutationsPdS_Pi(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !4, !amdgpu.noclobber !8
  %5 = mul nsw i32 %4, %4
  store double 0.000000e+00, double addrspace(1)* %0, align 8, !tbaa !9
  %6 = icmp ugt i32 %5, 1
  br i1 %6, label %7, label %30

7:                                                ; preds = %3
  %8 = tail call i32 @llvm.smax.i32(i32 %5, i32 2)
  %9 = add nsw i32 %8, -2
  %10 = add nsw i32 %8, -1
  %11 = and i32 %10, 7
  %12 = icmp ult i32 %9, 7
  br i1 %12, label %15, label %13

13:                                               ; preds = %7
  %14 = and i32 %10, -8
  br label %31

15:                                               ; preds = %31, %7
  %16 = phi double [ 0.000000e+00, %7 ], [ %73, %31 ]
  %17 = phi i32 [ 0, %7 ], [ %74, %31 ]
  %18 = icmp eq i32 %11, 0
  br i1 %18, label %30, label %19

19:                                               ; preds = %15, %19
  %20 = phi double [ %26, %19 ], [ %16, %15 ]
  %21 = phi i32 [ %27, %19 ], [ %17, %15 ]
  %22 = phi i32 [ %28, %19 ], [ 0, %15 ]
  %23 = zext i32 %21 to i64
  %24 = getelementptr inbounds double, double addrspace(1)* %1, i64 %23
  %25 = load double, double addrspace(1)* %24, align 8, !tbaa !9
  %26 = fadd contract double %25, %20
  store double %26, double addrspace(1)* %0, align 8, !tbaa !9
  %27 = add nuw nsw i32 %21, 1
  %28 = add i32 %22, 1
  %29 = icmp eq i32 %28, %11
  br i1 %29, label %30, label %19, !llvm.loop !11

30:                                               ; preds = %15, %19, %3
  ret void

31:                                               ; preds = %31, %13
  %32 = phi double [ 0.000000e+00, %13 ], [ %73, %31 ]
  %33 = phi i32 [ 0, %13 ], [ %74, %31 ]
  %34 = phi i32 [ 0, %13 ], [ %75, %31 ]
  %35 = zext i32 %33 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !9
  %38 = fadd contract double %37, %32
  store double %38, double addrspace(1)* %0, align 8, !tbaa !9
  %39 = or i32 %33, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !9
  %43 = fadd contract double %42, %38
  store double %43, double addrspace(1)* %0, align 8, !tbaa !9
  %44 = or i32 %33, 2
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %1, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !9
  %48 = fadd contract double %47, %43
  store double %48, double addrspace(1)* %0, align 8, !tbaa !9
  %49 = or i32 %33, 3
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %1, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !9
  %53 = fadd contract double %52, %48
  store double %53, double addrspace(1)* %0, align 8, !tbaa !9
  %54 = or i32 %33, 4
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !9
  %58 = fadd contract double %57, %53
  store double %58, double addrspace(1)* %0, align 8, !tbaa !9
  %59 = or i32 %33, 5
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %1, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !9
  %63 = fadd contract double %62, %58
  store double %63, double addrspace(1)* %0, align 8, !tbaa !9
  %64 = or i32 %33, 6
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds double, double addrspace(1)* %1, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !9
  %68 = fadd contract double %67, %63
  store double %68, double addrspace(1)* %0, align 8, !tbaa !9
  %69 = or i32 %33, 7
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %1, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !9
  %73 = fadd contract double %72, %68
  store double %73, double addrspace(1)* %0, align 8, !tbaa !9
  %74 = add nuw nsw i32 %33, 8
  %75 = add i32 %34, 8
  %76 = icmp eq i32 %75, %14
  br i1 %76, label %15, label %31, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
