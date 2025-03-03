; ModuleID = '../data/hip_kernels/12150/8/main.cu'
source_filename = "../data/hip_kernels/12150/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11multiplyDetPdS_Pi(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !4, !amdgpu.noclobber !8
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %91

6:                                                ; preds = %3
  %7 = load double, double addrspace(1)* %1, align 8, !tbaa !9
  %8 = and i32 %4, 7
  %9 = icmp ult i32 %4, 8
  br i1 %9, label %74, label %10

10:                                               ; preds = %6
  %11 = and i32 %4, -8
  br label %12

12:                                               ; preds = %12, %10
  %13 = phi double [ %7, %10 ], [ %70, %12 ]
  %14 = phi i32 [ 0, %10 ], [ %71, %12 ]
  %15 = phi i32 [ 0, %10 ], [ %72, %12 ]
  %16 = mul nsw i32 %14, %4
  %17 = add nsw i32 %16, %14
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 %18
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !9
  %21 = fmul contract double %13, %20
  store double %21, double addrspace(1)* %1, align 8, !tbaa !9
  %22 = or i32 %14, 1
  %23 = mul nsw i32 %22, %4
  %24 = add nsw i32 %23, %22
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %0, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !9
  %28 = fmul contract double %21, %27
  store double %28, double addrspace(1)* %1, align 8, !tbaa !9
  %29 = or i32 %14, 2
  %30 = mul nsw i32 %29, %4
  %31 = add nsw i32 %30, %29
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %0, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !9
  %35 = fmul contract double %28, %34
  store double %35, double addrspace(1)* %1, align 8, !tbaa !9
  %36 = or i32 %14, 3
  %37 = mul nsw i32 %36, %4
  %38 = add nsw i32 %37, %36
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !9
  %42 = fmul contract double %35, %41
  store double %42, double addrspace(1)* %1, align 8, !tbaa !9
  %43 = or i32 %14, 4
  %44 = mul nsw i32 %43, %4
  %45 = add nsw i32 %44, %43
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !9
  %49 = fmul contract double %42, %48
  store double %49, double addrspace(1)* %1, align 8, !tbaa !9
  %50 = or i32 %14, 5
  %51 = mul nsw i32 %50, %4
  %52 = add nsw i32 %51, %50
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !9
  %56 = fmul contract double %49, %55
  store double %56, double addrspace(1)* %1, align 8, !tbaa !9
  %57 = or i32 %14, 6
  %58 = mul nsw i32 %57, %4
  %59 = add nsw i32 %58, %57
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !9
  %63 = fmul contract double %56, %62
  store double %63, double addrspace(1)* %1, align 8, !tbaa !9
  %64 = or i32 %14, 7
  %65 = mul nsw i32 %64, %4
  %66 = add nsw i32 %65, %64
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !9
  %70 = fmul contract double %63, %69
  store double %70, double addrspace(1)* %1, align 8, !tbaa !9
  %71 = add nuw nsw i32 %14, 8
  %72 = add i32 %15, 8
  %73 = icmp eq i32 %72, %11
  br i1 %73, label %74, label %12, !llvm.loop !11

74:                                               ; preds = %12, %6
  %75 = phi double [ %7, %6 ], [ %70, %12 ]
  %76 = phi i32 [ 0, %6 ], [ %71, %12 ]
  %77 = icmp eq i32 %8, 0
  br i1 %77, label %91, label %78

78:                                               ; preds = %74, %78
  %79 = phi double [ %87, %78 ], [ %75, %74 ]
  %80 = phi i32 [ %88, %78 ], [ %76, %74 ]
  %81 = phi i32 [ %89, %78 ], [ 0, %74 ]
  %82 = mul nsw i32 %80, %4
  %83 = add nsw i32 %82, %80
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !9
  %87 = fmul contract double %79, %86
  store double %87, double addrspace(1)* %1, align 8, !tbaa !9
  %88 = add nuw nsw i32 %80, 1
  %89 = add i32 %81, 1
  %90 = icmp eq i32 %89, %8
  br i1 %90, label %91, label %78, !llvm.loop !13

91:                                               ; preds = %74, %78, %3
  ret void
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
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
