; ModuleID = '../data/hip_kernels/716/2/main.cu'
source_filename = "../data/hip_kernels/716/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.dim3 = type { i32, i32, i32 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13gpu_mergesortPlS_lllP4dim3S1_(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture writeonly %1, i64 %2, i64 %3, i64 %4, %struct.dim3 addrspace(1)* nocapture readonly %5, %struct.dim3 addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %5, i64 0, i32 0
  %11 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %13 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %5, i64 0, i32 1
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !11, !amdgpu.noclobber !10
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %5, i64 0, i32 2
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !12, !amdgpu.noclobber !10
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %6, i64 0, i32 2
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !12, !amdgpu.noclobber !10
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %22 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %6, i64 0, i32 1
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !11, !amdgpu.noclobber !10
  %24 = mul i32 %23, %21
  %25 = add i32 %24, %18
  %26 = mul i32 %25, %20
  %27 = add i32 %26, %15
  %28 = mul i32 %27, %17
  %29 = add i32 %28, %12
  %30 = mul i32 %29, %14
  %31 = add i32 %30, %9
  %32 = mul i32 %31, %11
  %33 = add i32 %32, %8
  %34 = zext i32 %33 to i64
  %35 = mul i64 %4, %3
  %36 = mul i64 %35, %34
  %37 = icmp sgt i64 %4, 0
  %38 = icmp slt i64 %36, %2
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %40, label %83

40:                                               ; preds = %7
  %41 = ashr i64 %3, 1
  br label %42

42:                                               ; preds = %40, %78
  %43 = phi i64 [ 0, %40 ], [ %79, %78 ]
  %44 = phi i64 [ %36, %40 ], [ %47, %78 ]
  %45 = add nsw i64 %44, %41
  %46 = tail call i64 @llvm.smin.i64(i64 %45, i64 %2)
  %47 = add nsw i64 %44, %3
  %48 = tail call i64 @llvm.smin.i64(i64 %47, i64 %2)
  %49 = icmp slt i64 %44, %48
  br i1 %49, label %50, label %78

50:                                               ; preds = %42, %73
  %51 = phi i64 [ %76, %73 ], [ %44, %42 ]
  %52 = phi i64 [ %75, %73 ], [ %46, %42 ]
  %53 = phi i64 [ %74, %73 ], [ %44, %42 ]
  %54 = icmp slt i64 %53, %46
  br i1 %54, label %58, label %55

55:                                               ; preds = %50
  %56 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %52
  %57 = load i64, i64 addrspace(1)* %56, align 8, !tbaa !13
  br label %69

58:                                               ; preds = %50
  %59 = icmp slt i64 %52, %48
  %60 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %53
  %61 = load i64, i64 addrspace(1)* %60, align 8, !tbaa !13
  br i1 %59, label %62, label %66

62:                                               ; preds = %58
  %63 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %52
  %64 = load i64, i64 addrspace(1)* %63, align 8, !tbaa !13
  %65 = icmp slt i64 %61, %64
  br i1 %65, label %66, label %69

66:                                               ; preds = %62, %58
  %67 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %51
  store i64 %61, i64 addrspace(1)* %67, align 8, !tbaa !13
  %68 = add nsw i64 %53, 1
  br label %73

69:                                               ; preds = %62, %55
  %70 = phi i64 [ %57, %55 ], [ %64, %62 ]
  %71 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %51
  store i64 %70, i64 addrspace(1)* %71, align 8, !tbaa !13
  %72 = add nsw i64 %52, 1
  br label %73

73:                                               ; preds = %69, %66
  %74 = phi i64 [ %68, %66 ], [ %53, %69 ]
  %75 = phi i64 [ %52, %66 ], [ %72, %69 ]
  %76 = add nsw i64 %51, 1
  %77 = icmp slt i64 %76, %48
  br i1 %77, label %50, label %78, !llvm.loop !15

78:                                               ; preds = %73, %42
  %79 = add nuw nsw i64 %43, 1
  %80 = icmp slt i64 %79, %4
  %81 = icmp slt i64 %47, %2
  %82 = select i1 %80, i1 %81, i1 false
  br i1 %82, label %42, label %83, !llvm.loop !17

83:                                               ; preds = %78, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smin.i64(i64, i64) #2

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
!5 = !{!6, !7, i64 0}
!6 = !{!"_ZTS4dim3", !7, i64 0, !7, i64 4, !7, i64 8}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{}
!11 = !{!6, !7, i64 4}
!12 = !{!6, !7, i64 8}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !8, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
