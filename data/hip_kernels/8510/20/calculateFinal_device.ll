; ModuleID = '../data/hip_kernels/8510/20/main.cu'
source_filename = "../data/hip_kernels/8510/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14calculateFinaliPiPdS0_S_S0_S0_ii(i32 %0, i32 addrspace(1)* nocapture readonly %1, double addrspace(1)* readonly %2, double addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %82

12:                                               ; preds = %9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = icmp slt i32 %13, %7
  br i1 %14, label %15, label %82

15:                                               ; preds = %12
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = icmp slt i32 %16, %8
  %18 = mul nsw i32 %7, 450
  %19 = mul nsw i32 %8, %7
  %20 = mul nsw i32 %19, 450
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds double, double addrspace(1)* %2, i64 %21
  %23 = sext i32 %19 to i64
  %24 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = getelementptr i8, i8 addrspace(4)* %24, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !5, !invariant.load !6
  %30 = zext i16 %29 to i32
  br label %31

31:                                               ; preds = %15, %40
  %32 = phi i32 [ %13, %15 ], [ %41, %40 ]
  br i1 %17, label %33, label %40

33:                                               ; preds = %31
  %34 = icmp sge i32 %32, %18
  %35 = sext i32 %32 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %35
  %37 = mul nsw i32 %32, %8
  %38 = load i16, i16 addrspace(4)* %26, align 4, !range !5, !invariant.load !6
  %39 = zext i16 %38 to i32
  br label %43

40:                                               ; preds = %79, %31
  %41 = add i32 %32, %30
  %42 = icmp slt i32 %41, %7
  br i1 %42, label %31, label %82, !llvm.loop !7

43:                                               ; preds = %33, %79
  %44 = phi i32 [ %16, %33 ], [ %80, %79 ]
  %45 = icmp ne i32 %44, 0
  %46 = select i1 %45, i1 true, i1 %34
  br i1 %46, label %58, label %47

47:                                               ; preds = %43
  %48 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !9
  br label %49

49:                                               ; preds = %47, %49
  %50 = phi i32 [ %55, %49 ], [ %48, %47 ]
  %51 = phi i32 [ %56, %49 ], [ %32, %47 ]
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !9
  %55 = add nsw i32 %50, %54
  store i32 %55, i32 addrspace(1)* %36, align 4, !tbaa !9
  %56 = add nsw i32 %51, %7
  %57 = icmp slt i32 %56, %18
  br i1 %57, label %49, label %58, !llvm.loop !13

58:                                               ; preds = %49, %43
  %59 = add nsw i32 %44, %37
  %60 = sext i32 %59 to i64
  %61 = icmp slt i32 %59, %20
  br i1 %61, label %62, label %79

62:                                               ; preds = %58
  %63 = getelementptr inbounds double, double addrspace(1)* %2, i64 %60
  %64 = getelementptr inbounds double, double addrspace(1)* %3, i64 %60
  %65 = getelementptr inbounds double, double addrspace(1)* %5, i64 %60
  %66 = getelementptr inbounds double, double addrspace(1)* %6, i64 %60
  br label %67

67:                                               ; preds = %62, %67
  %68 = phi double addrspace(1)* [ %64, %62 ], [ %77, %67 ]
  %69 = phi double addrspace(1)* [ %63, %62 ], [ %76, %67 ]
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !14
  %71 = load double, double addrspace(1)* %65, align 8, !tbaa !14
  %72 = fadd contract double %70, %71
  store double %72, double addrspace(1)* %65, align 8, !tbaa !14
  %73 = load double, double addrspace(1)* %68, align 8, !tbaa !14
  %74 = load double, double addrspace(1)* %66, align 8, !tbaa !14
  %75 = fadd contract double %73, %74
  store double %75, double addrspace(1)* %66, align 8, !tbaa !14
  %76 = getelementptr inbounds double, double addrspace(1)* %69, i64 %23
  %77 = getelementptr inbounds double, double addrspace(1)* %68, i64 %23
  %78 = icmp ult double addrspace(1)* %76, %22
  br i1 %78, label %67, label %79, !llvm.loop !16

79:                                               ; preds = %67, %58
  %80 = add i32 %44, %39
  %81 = icmp slt i32 %80, %8
  br i1 %81, label %43, label %40, !llvm.loop !17

82:                                               ; preds = %40, %12, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
!14 = !{!15, !15, i64 0}
!15 = !{!"double", !11, i64 0}
!16 = distinct !{!16, !8}
!17 = distinct !{!17, !8}
