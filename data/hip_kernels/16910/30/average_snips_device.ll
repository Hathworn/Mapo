; ModuleID = '../data/hip_kernels/16910/30/main.cu'
source_filename = "../data/hip_kernels/16910/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13average_snipsPKdPKiS2_S2_PKfS4_Pf(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readnone %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = icmp sgt i32 %9, 0
  br i1 %19, label %20, label %120

20:                                               ; preds = %7
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !4, !amdgpu.noclobber !8
  %23 = fptosi double %22 to i32
  %24 = mul i32 %18, %23
  %25 = and i32 %9, 1
  %26 = icmp eq i32 %9, 1
  br i1 %26, label %90, label %27

27:                                               ; preds = %20
  %28 = and i32 %9, -2
  br label %29

29:                                               ; preds = %86, %27
  %30 = phi i32 [ 0, %27 ], [ %87, %86 ]
  %31 = phi i32 [ 0, %27 ], [ %88, %86 ]
  %32 = zext i32 %30 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !10, !amdgpu.noclobber !8
  %35 = icmp eq i32 %34, %18
  br i1 %35, label %36, label %58

36:                                               ; preds = %29
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !10, !amdgpu.noclobber !8
  %39 = mul nsw i32 %38, %15
  %40 = add nsw i32 %39, %17
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !10, !amdgpu.noclobber !8
  %44 = mul i32 %30, %15
  %45 = add i32 %44, %17
  %46 = mul i32 %45, %12
  %47 = add i32 %46, %16
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !12
  %51 = add i32 %43, %24
  %52 = mul i32 %51, %12
  %53 = add i32 %52, %16
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %6, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !12
  %57 = fadd contract float %50, %56
  store float %57, float addrspace(1)* %55, align 4, !tbaa !12
  br label %58

58:                                               ; preds = %29, %36
  %59 = or i32 %30, 1
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !10, !amdgpu.noclobber !8
  %63 = icmp eq i32 %62, %18
  br i1 %63, label %64, label %86

64:                                               ; preds = %58
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !10, !amdgpu.noclobber !8
  %67 = mul nsw i32 %66, %15
  %68 = add nsw i32 %67, %17
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !10, !amdgpu.noclobber !8
  %72 = mul i32 %59, %15
  %73 = add i32 %72, %17
  %74 = mul i32 %73, %12
  %75 = add i32 %74, %16
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %4, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !12
  %79 = add i32 %71, %24
  %80 = mul i32 %79, %12
  %81 = add i32 %80, %16
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %6, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !12
  %85 = fadd contract float %78, %84
  store float %85, float addrspace(1)* %83, align 4, !tbaa !12
  br label %86

86:                                               ; preds = %64, %58
  %87 = add nuw nsw i32 %30, 2
  %88 = add i32 %31, 2
  %89 = icmp eq i32 %88, %28
  br i1 %89, label %90, label %29, !llvm.loop !14

90:                                               ; preds = %86, %20
  %91 = phi i32 [ 0, %20 ], [ %87, %86 ]
  %92 = icmp eq i32 %25, 0
  br i1 %92, label %120, label %93

93:                                               ; preds = %90
  %94 = zext i32 %91 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !10, !amdgpu.noclobber !8
  %97 = icmp eq i32 %96, %18
  br i1 %97, label %98, label %120

98:                                               ; preds = %93
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %94
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !10, !amdgpu.noclobber !8
  %101 = mul nsw i32 %100, %15
  %102 = add nsw i32 %101, %17
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !10, !amdgpu.noclobber !8
  %106 = mul i32 %91, %15
  %107 = add i32 %106, %17
  %108 = mul i32 %107, %12
  %109 = add i32 %108, %16
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %4, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !12
  %113 = add i32 %105, %24
  %114 = mul i32 %113, %12
  %115 = add i32 %114, %16
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %6, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !12
  %119 = fadd contract float %112, %118
  store float %119, float addrspace(1)* %117, align 4, !tbaa !12
  br label %120

120:                                              ; preds = %90, %98, %93, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !6, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
