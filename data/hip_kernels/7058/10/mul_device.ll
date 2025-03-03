; ModuleID = '../data/hip_kernels/7058/10/main.cu'
source_filename = "../data/hip_kernels/7058/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3mulPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = shl nsw i32 %4, 23
  %7 = or i32 %6, %5
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %8
  store i32 0, i32 addrspace(1)* %9, align 4, !tbaa !5
  br label %11

10:                                               ; preds = %11
  ret void

11:                                               ; preds = %11, %3
  %12 = phi i32 [ 0, %3 ], [ %108, %11 ]
  %13 = phi i32 [ 0, %3 ], [ %109, %11 ]
  %14 = add nuw nsw i32 %13, %6
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5
  %18 = shl nsw i32 %13, 23
  %19 = or i32 %18, %5
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !5
  %23 = mul nsw i32 %22, %17
  %24 = add nsw i32 %12, %23
  store i32 %24, i32 addrspace(1)* %9, align 4, !tbaa !5
  %25 = or i32 %13, 1
  %26 = add nuw nsw i32 %25, %6
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !5
  %30 = shl nsw i32 %25, 23
  %31 = or i32 %30, %5
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5
  %35 = mul nsw i32 %34, %29
  %36 = add nsw i32 %24, %35
  store i32 %36, i32 addrspace(1)* %9, align 4, !tbaa !5
  %37 = or i32 %13, 2
  %38 = add nuw nsw i32 %37, %6
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !5
  %42 = shl nsw i32 %37, 23
  %43 = or i32 %42, %5
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !5
  %47 = mul nsw i32 %46, %41
  %48 = add nsw i32 %36, %47
  store i32 %48, i32 addrspace(1)* %9, align 4, !tbaa !5
  %49 = or i32 %13, 3
  %50 = add nuw nsw i32 %49, %6
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !5
  %54 = shl nsw i32 %49, 23
  %55 = or i32 %54, %5
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !5
  %59 = mul nsw i32 %58, %53
  %60 = add nsw i32 %48, %59
  store i32 %60, i32 addrspace(1)* %9, align 4, !tbaa !5
  %61 = or i32 %13, 4
  %62 = add nuw nsw i32 %61, %6
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !5
  %66 = shl nsw i32 %61, 23
  %67 = or i32 %66, %5
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !5
  %71 = mul nsw i32 %70, %65
  %72 = add nsw i32 %60, %71
  store i32 %72, i32 addrspace(1)* %9, align 4, !tbaa !5
  %73 = or i32 %13, 5
  %74 = add nuw nsw i32 %73, %6
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !5
  %78 = shl nsw i32 %73, 23
  %79 = or i32 %78, %5
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !5
  %83 = mul nsw i32 %82, %77
  %84 = add nsw i32 %72, %83
  store i32 %84, i32 addrspace(1)* %9, align 4, !tbaa !5
  %85 = or i32 %13, 6
  %86 = add nuw nsw i32 %85, %6
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !5
  %90 = shl nsw i32 %85, 23
  %91 = or i32 %90, %5
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !5
  %95 = mul nsw i32 %94, %89
  %96 = add nsw i32 %84, %95
  store i32 %96, i32 addrspace(1)* %9, align 4, !tbaa !5
  %97 = or i32 %13, 7
  %98 = add nuw nsw i32 %97, %6
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !5
  %102 = shl nsw i32 %97, 23
  %103 = or i32 %102, %5
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !5
  %107 = mul nsw i32 %106, %101
  %108 = add nsw i32 %96, %107
  store i32 %108, i32 addrspace(1)* %9, align 4, !tbaa !5
  %109 = add nuw nsw i32 %13, 8
  %110 = icmp eq i32 %109, 8388608
  br i1 %110, label %10, label %11, !llvm.loop !9
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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
