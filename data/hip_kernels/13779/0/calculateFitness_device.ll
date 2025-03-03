; ModuleID = '../data/hip_kernels/13779/0/main.cu'
source_filename = "../data/hip_kernels/13779/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16calculateFitnessPiS_S_S_S_S_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readnone %6, i32 addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = zext i32 %9 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = sext i32 %10 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  %17 = icmp eq i32 %13, %16
  br i1 %17, label %18, label %37

18:                                               ; preds = %8
  %19 = sext i32 %13 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %19
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = icmp slt i32 %21, %26
  br i1 %27, label %28, label %37

28:                                               ; preds = %18
  %29 = mul nsw i32 %9, %10
  %30 = add nsw i32 %29, %9
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = add nsw i32 %33, 1
  store i32 %34, i32 addrspace(1)* %32, align 4, !tbaa !5
  %35 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %36 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %28, %18, %8
  %38 = phi i32 [ %36, %28 ], [ %13, %18 ], [ %13, %8 ]
  %39 = phi i32 [ %35, %28 ], [ %13, %18 ], [ %16, %8 ]
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %43 = sext i32 %38 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !5
  %46 = icmp eq i32 %42, %45
  br i1 %46, label %47, label %66

47:                                               ; preds = %37
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %43
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !5
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %40
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !5
  %52 = icmp ne i32 %49, %51
  %53 = icmp eq i32 %38, %39
  %54 = select i1 %52, i1 true, i1 %53
  br i1 %54, label %66, label %55

55:                                               ; preds = %47
  %56 = mul nsw i32 %9, %10
  %57 = add nsw i32 %56, %9
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !5
  %61 = add nsw i32 %60, 1
  store i32 %61, i32 addrspace(1)* %59, align 4, !tbaa !5
  %62 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %63 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5
  %64 = sext i32 %63 to i64
  %65 = sext i32 %62 to i64
  br label %66

66:                                               ; preds = %55, %47, %37
  %67 = phi i64 [ %65, %55 ], [ %40, %47 ], [ %40, %37 ]
  %68 = phi i64 [ %64, %55 ], [ %43, %47 ], [ %43, %37 ]
  %69 = phi i32 [ %63, %55 ], [ %38, %47 ], [ %38, %37 ]
  %70 = phi i32 [ %62, %55 ], [ %39, %47 ], [ %39, %37 ]
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %68
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !5
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %67
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !5
  %75 = icmp ne i32 %72, %74
  %76 = icmp eq i32 %69, %70
  %77 = select i1 %75, i1 true, i1 %76
  br i1 %77, label %85, label %78

78:                                               ; preds = %66
  %79 = mul nsw i32 %9, %10
  %80 = add nsw i32 %79, %9
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !5
  %84 = add nsw i32 %83, 1
  store i32 %84, i32 addrspace(1)* %82, align 4, !tbaa !5
  br label %85

85:                                               ; preds = %78, %66
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
