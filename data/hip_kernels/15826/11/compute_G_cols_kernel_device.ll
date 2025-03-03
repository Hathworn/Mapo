; ModuleID = '../data/hip_kernels/15826/11/main.cu'
source_filename = "../data/hip_kernels/15826/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21compute_G_cols_kerneliiiPiPdS0_iS0_iS0_i(i32 %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, i32 %6, double addrspace(1)* nocapture readonly %7, i32 %8, double addrspace(1)* nocapture %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = shl i32 %13, 5
  %15 = add i32 %14, %12
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = shl i32 %16, 3
  %18 = add i32 %17, 8
  %19 = tail call i32 @llvm.smax.i32(i32 %17, i32 0)
  %20 = tail call i32 @llvm.smin.i32(i32 %18, i32 %0)
  %21 = icmp slt i32 %15, %1
  br i1 %21, label %22, label %79

22:                                               ; preds = %11
  %23 = icmp slt i32 %19, %20
  br i1 %23, label %25, label %79

24:                                               ; preds = %49
  br i1 %23, label %57, label %79

25:                                               ; preds = %22, %49
  %26 = phi i32 [ %55, %49 ], [ %19, %22 ]
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = icmp slt i32 %29, %2
  br i1 %30, label %38, label %31

31:                                               ; preds = %25
  %32 = sub nsw i32 %29, %2
  %33 = mul nsw i32 %32, %8
  %34 = add nsw i32 %33, %15
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %7, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !10
  br label %49

38:                                               ; preds = %25
  %39 = getelementptr inbounds double, double addrspace(1)* %4, i64 %27
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !10
  %41 = fadd contract double %40, -1.000000e+00
  %42 = fdiv contract double %40, %41
  %43 = mul nsw i32 %29, %6
  %44 = add nsw i32 %43, %15
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %5, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !10
  %48 = fmul contract double %47, %42
  br label %49

49:                                               ; preds = %31, %38
  %50 = phi double [ %37, %31 ], [ %48, %38 ]
  %51 = mul nsw i32 %26, %10
  %52 = add nsw i32 %51, %15
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %9, i64 %53
  store double %50, double addrspace(1)* %54, align 8, !tbaa !10
  %55 = add nuw nsw i32 %26, 1
  %56 = icmp slt i32 %55, %20
  br i1 %56, label %25, label %24, !llvm.loop !12

57:                                               ; preds = %24, %76
  %58 = phi i32 [ %77, %76 ], [ %19, %24 ]
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = icmp slt i32 %61, %2
  %63 = icmp eq i32 %15, %61
  %64 = select i1 %62, i1 %63, i1 false
  br i1 %64, label %65, label %76

65:                                               ; preds = %57
  %66 = getelementptr inbounds double, double addrspace(1)* %4, i64 %59
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !10
  %68 = fadd contract double %67, -1.000000e+00
  %69 = fdiv contract double 1.000000e+00, %68
  %70 = mul nsw i32 %58, %10
  %71 = add nsw i32 %70, %15
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %9, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !10
  %75 = fsub contract double %74, %69
  store double %75, double addrspace(1)* %73, align 8, !tbaa !10
  br label %76

76:                                               ; preds = %57, %65
  %77 = add nuw nsw i32 %58, 1
  %78 = icmp slt i32 %77, %20
  br i1 %78, label %57, label %79, !llvm.loop !14

79:                                               ; preds = %76, %22, %24, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"double", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
