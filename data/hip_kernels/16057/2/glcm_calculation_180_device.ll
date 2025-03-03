; ModuleID = '../data/hip_kernels/16057/2/main.cu'
source_filename = "../data/hip_kernels/16057/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z20glcm_calculation_180PiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %6, %2
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = icmp sgt i32 %2, 0
  br i1 %10, label %11, label %77

11:                                               ; preds = %5
  %12 = add nuw i32 %9, 1
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %13
  %15 = zext i32 %9 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = and i32 %2, 1
  %18 = icmp eq i32 %2, 1
  br i1 %18, label %58, label %19

19:                                               ; preds = %11
  %20 = and i32 %2, -2
  br label %21

21:                                               ; preds = %55, %19
  %22 = phi i32 [ 0, %19 ], [ %42, %55 ]
  %23 = phi i32 [ 0, %19 ], [ %56, %55 ]
  %24 = mul nsw i32 %22, %2
  %25 = icmp ult i32 %9, %24
  %26 = or i32 %22, 1
  br i1 %25, label %39, label %27

27:                                               ; preds = %21
  %28 = mul nsw i32 %26, %2
  %29 = add nsw i32 %28, -1
  %30 = icmp ult i32 %9, %29
  br i1 %30, label %31, label %39

31:                                               ; preds = %27
  %32 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !5
  %33 = mul nsw i32 %32, %4
  %34 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  %38 = atomicrmw add i32 addrspace(1)* %37, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %39

39:                                               ; preds = %21, %27, %31
  %40 = mul nsw i32 %26, %2
  %41 = icmp ult i32 %9, %40
  %42 = add nuw nsw i32 %22, 2
  br i1 %41, label %55, label %43

43:                                               ; preds = %39
  %44 = mul nsw i32 %42, %2
  %45 = add nsw i32 %44, -1
  %46 = icmp ult i32 %9, %45
  br i1 %46, label %47, label %55

47:                                               ; preds = %43
  %48 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !5
  %49 = mul nsw i32 %48, %4
  %50 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5
  %51 = add nsw i32 %49, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %52
  %54 = atomicrmw add i32 addrspace(1)* %53, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %55

55:                                               ; preds = %47, %43, %39
  %56 = add i32 %23, 2
  %57 = icmp eq i32 %56, %20
  br i1 %57, label %58, label %21, !llvm.loop !9

58:                                               ; preds = %55, %11
  %59 = phi i32 [ 0, %11 ], [ %42, %55 ]
  %60 = icmp eq i32 %17, 0
  %61 = mul nsw i32 %59, %2
  %62 = icmp ult i32 %9, %61
  %63 = select i1 %60, i1 true, i1 %62
  br i1 %63, label %77, label %64

64:                                               ; preds = %58
  %65 = add nuw nsw i32 %59, 1
  %66 = mul nsw i32 %65, %2
  %67 = add nsw i32 %66, -1
  %68 = icmp ult i32 %9, %67
  br i1 %68, label %69, label %77

69:                                               ; preds = %64
  %70 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !5
  %71 = mul nsw i32 %70, %4
  %72 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5
  %73 = add nsw i32 %71, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %74
  %76 = atomicrmw add i32 addrspace(1)* %75, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %77

77:                                               ; preds = %58, %69, %64, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
