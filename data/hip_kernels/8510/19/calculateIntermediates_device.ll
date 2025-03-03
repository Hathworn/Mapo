; ModuleID = '../data/hip_kernels/8510/19/main.cu'
source_filename = "../data/hip_kernels/8510/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22calculateIntermediatesiPdPiS0_S_S_ii(i32 %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture writeonly %4, double addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = sdiv i32 %0, 450
  %10 = add nsw i32 %9, 1
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %10, %11
  %13 = add nsw i32 %12, %10
  %14 = tail call i32 @llvm.smin.i32(i32 %13, i32 %0)
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = icmp slt i32 %15, %6
  br i1 %16, label %17, label %90

17:                                               ; preds = %8
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %19 = icmp slt i32 %18, %7
  %20 = icmp slt i32 %12, %14
  %21 = mul i32 %11, %6
  %22 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = getelementptr i8, i8 addrspace(4)* %22, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  br label %29

29:                                               ; preds = %17, %38
  %30 = phi i32 [ %15, %17 ], [ %39, %38 ]
  br i1 %19, label %31, label %38

31:                                               ; preds = %29
  %32 = add i32 %30, %21
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %33
  %35 = mul i32 %32, %7
  %36 = load i16, i16 addrspace(4)* %24, align 4, !range !5, !invariant.load !6
  %37 = zext i16 %36 to i32
  br label %41

38:                                               ; preds = %59, %29
  %39 = add i32 %30, %28
  %40 = icmp slt i32 %39, %6
  br i1 %40, label %29, label %90, !llvm.loop !7

41:                                               ; preds = %31, %59
  %42 = phi i32 [ %18, %31 ], [ %66, %59 ]
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %58

44:                                               ; preds = %41
  br i1 %20, label %47, label %45

45:                                               ; preds = %47, %44
  %46 = phi i32 [ 0, %44 ], [ %55, %47 ]
  store i32 %46, i32 addrspace(1)* %34, align 4, !tbaa !9
  br label %58

47:                                               ; preds = %44, %47
  %48 = phi i32 [ %56, %47 ], [ %12, %44 ]
  %49 = phi i32 [ %55, %47 ], [ 0, %44 ]
  %50 = sext i32 %48 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !9
  %53 = icmp eq i32 %52, %30
  %54 = zext i1 %53 to i32
  %55 = add nuw nsw i32 %49, %54
  %56 = add nsw i32 %48, 1
  %57 = icmp slt i32 %56, %14
  br i1 %57, label %47, label %45, !llvm.loop !13

58:                                               ; preds = %45, %41
  br i1 %20, label %68, label %59

59:                                               ; preds = %85, %58
  %60 = phi double [ 0.000000e+00, %58 ], [ %86, %85 ]
  %61 = phi double [ 0.000000e+00, %58 ], [ %87, %85 ]
  %62 = add i32 %42, %35
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %4, i64 %63
  store double %60, double addrspace(1)* %64, align 8, !tbaa !14
  %65 = getelementptr inbounds double, double addrspace(1)* %5, i64 %63
  store double %61, double addrspace(1)* %65, align 8, !tbaa !14
  %66 = add i32 %42, %37
  %67 = icmp slt i32 %66, %7
  br i1 %67, label %41, label %38, !llvm.loop !16

68:                                               ; preds = %58, %85
  %69 = phi i32 [ %88, %85 ], [ %12, %58 ]
  %70 = phi double [ %87, %85 ], [ 0.000000e+00, %58 ]
  %71 = phi double [ %86, %85 ], [ 0.000000e+00, %58 ]
  %72 = sext i32 %69 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !9
  %75 = icmp eq i32 %74, %30
  br i1 %75, label %76, label %85

76:                                               ; preds = %68
  %77 = mul nsw i32 %69, %7
  %78 = add nsw i32 %77, %42
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %1, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !14
  %82 = fadd contract double %71, %81
  %83 = fmul contract double %81, %81
  %84 = fadd contract double %70, %83
  br label %85

85:                                               ; preds = %68, %76
  %86 = phi double [ %82, %76 ], [ %71, %68 ]
  %87 = phi double [ %84, %76 ], [ %70, %68 ]
  %88 = add nsw i32 %69, 1
  %89 = icmp slt i32 %88, %14
  br i1 %89, label %68, label %59, !llvm.loop !17

90:                                               ; preds = %38, %8
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
