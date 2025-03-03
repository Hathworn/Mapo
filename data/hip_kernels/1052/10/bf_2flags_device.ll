; ModuleID = '../data/hip_kernels/1052/10/main.cu'
source_filename = "../data/hip_kernels/1052/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9bf_2flagsPiS_S_S_S_S_S_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %7
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %17, label %91

17:                                               ; preds = %8
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %13
  store i32 65000, i32 addrspace(1)* %18, align 4, !tbaa !5
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %13
  store i32 0, i32 addrspace(1)* %19, align 4, !tbaa !5
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %13
  store i32 0, i32 addrspace(1)* %20, align 4, !tbaa !5
  %21 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !5
  %22 = icmp eq i32 %12, %21
  br i1 %22, label %23, label %24

23:                                               ; preds = %17
  store i32 0, i32 addrspace(1)* %18, align 4, !tbaa !5
  store i32 1, i32 addrspace(1)* %19, align 4, !tbaa !5
  br label %24

24:                                               ; preds = %23, %17
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %13
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %13
  br label %27

27:                                               ; preds = %87, %24
  %28 = phi i32 [ 0, %24 ], [ %89, %87 ]
  %29 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !5
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %47

34:                                               ; preds = %27
  %35 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !5
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !5
  %41 = add nsw i32 %40, 1
  %42 = icmp sgt i32 %38, %41
  br i1 %42, label %43, label %47

43:                                               ; preds = %34
  store i32 %41, i32 addrspace(1)* %37, align 4, !tbaa !5
  %44 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %45
  store i32 1, i32 addrspace(1)* %46, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %34, %43, %27
  %48 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5
  store i32 %48, i32 addrspace(1)* %19, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %20, align 4, !tbaa !5
  %49 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !5
  %53 = icmp eq i32 %52, 1
  br i1 %53, label %54, label %67

54:                                               ; preds = %47
  %55 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !5
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !5
  %61 = add nsw i32 %60, 1
  %62 = icmp sgt i32 %58, %61
  br i1 %62, label %63, label %67

63:                                               ; preds = %54
  store i32 %61, i32 addrspace(1)* %57, align 4, !tbaa !5
  %64 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %65
  store i32 1, i32 addrspace(1)* %66, align 4, !tbaa !5
  br label %67

67:                                               ; preds = %63, %54, %47
  %68 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5
  store i32 %68, i32 addrspace(1)* %19, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %20, align 4, !tbaa !5
  %69 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !5
  %73 = icmp eq i32 %72, 1
  br i1 %73, label %74, label %87

74:                                               ; preds = %67
  %75 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !5
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %70
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !5
  %81 = add nsw i32 %80, 1
  %82 = icmp sgt i32 %78, %81
  br i1 %82, label %83, label %87

83:                                               ; preds = %74
  store i32 %81, i32 addrspace(1)* %77, align 4, !tbaa !5
  %84 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %85
  store i32 1, i32 addrspace(1)* %86, align 4, !tbaa !5
  br label %87

87:                                               ; preds = %83, %74, %67
  %88 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5
  store i32 %88, i32 addrspace(1)* %19, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %20, align 4, !tbaa !5
  %89 = add nuw nsw i32 %28, 3
  %90 = icmp eq i32 %89, 103689
  br i1 %90, label %91, label %27, !llvm.loop !10

91:                                               ; preds = %87, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
