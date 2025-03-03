; ModuleID = '../data/hip_kernels/14762/33/main.cu'
source_filename = "../data/hip_kernels/14762/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z45cunn_TemporalMaxPooling_updateGradInputKernelPfS_S_iiiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %4
  %11 = mul i32 %10, %3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = shl i32 %15, 10
  %17 = or i32 %16, %14
  %18 = mul i32 %17, %4
  %19 = mul i32 %18, %7
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %13, i64 %20
  %22 = mul i32 %10, %5
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = zext i32 %18 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %24, i64 %25
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %23
  %28 = getelementptr inbounds float, float addrspace(1)* %27, i64 %25
  %29 = icmp ult i32 %17, %5
  %30 = icmp sgt i32 %4, 0
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %115

32:                                               ; preds = %8
  %33 = and i32 %4, 3
  %34 = icmp ult i32 %4, 4
  br i1 %34, label %94, label %35

35:                                               ; preds = %32
  %36 = and i32 %4, -4
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i32 [ 0, %35 ], [ %91, %37 ]
  %39 = phi i32 [ 0, %35 ], [ %92, %37 ]
  %40 = zext i32 %38 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %26, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5
  %43 = getelementptr inbounds float, float addrspace(1)* %28, i64 %40
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5
  %45 = fptosi float %44 to i32
  %46 = mul nsw i32 %45, %4
  %47 = add nsw i32 %46, %38
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %21, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5
  %51 = fadd contract float %42, %50
  store float %51, float addrspace(1)* %49, align 4, !tbaa !5
  %52 = or i32 %38, 1
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %26, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5
  %56 = getelementptr inbounds float, float addrspace(1)* %28, i64 %53
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5
  %58 = fptosi float %57 to i32
  %59 = mul nsw i32 %58, %4
  %60 = add nsw i32 %59, %52
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %21, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5
  %64 = fadd contract float %55, %63
  store float %64, float addrspace(1)* %62, align 4, !tbaa !5
  %65 = or i32 %38, 2
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %26, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5
  %69 = getelementptr inbounds float, float addrspace(1)* %28, i64 %66
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5
  %71 = fptosi float %70 to i32
  %72 = mul nsw i32 %71, %4
  %73 = add nsw i32 %72, %65
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %21, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5
  %77 = fadd contract float %68, %76
  store float %77, float addrspace(1)* %75, align 4, !tbaa !5
  %78 = or i32 %38, 3
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %26, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = getelementptr inbounds float, float addrspace(1)* %28, i64 %79
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5
  %84 = fptosi float %83 to i32
  %85 = mul nsw i32 %84, %4
  %86 = add nsw i32 %85, %78
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %21, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5
  %90 = fadd contract float %81, %89
  store float %90, float addrspace(1)* %88, align 4, !tbaa !5
  %91 = add nuw nsw i32 %38, 4
  %92 = add i32 %39, 4
  %93 = icmp eq i32 %92, %36
  br i1 %93, label %94, label %37, !llvm.loop !9

94:                                               ; preds = %37, %32
  %95 = phi i32 [ 0, %32 ], [ %91, %37 ]
  %96 = icmp eq i32 %33, 0
  br i1 %96, label %115, label %97

97:                                               ; preds = %94, %97
  %98 = phi i32 [ %112, %97 ], [ %95, %94 ]
  %99 = phi i32 [ %113, %97 ], [ 0, %94 ]
  %100 = zext i32 %98 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %26, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  %103 = getelementptr inbounds float, float addrspace(1)* %28, i64 %100
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5
  %105 = fptosi float %104 to i32
  %106 = mul nsw i32 %105, %4
  %107 = add nsw i32 %106, %98
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %21, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5
  %111 = fadd contract float %102, %110
  store float %111, float addrspace(1)* %109, align 4, !tbaa !5
  %112 = add nuw nsw i32 %98, 1
  %113 = add i32 %99, 1
  %114 = icmp eq i32 %113, %33
  br i1 %114, label %115, label %97, !llvm.loop !11

115:                                              ; preds = %94, %97, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
