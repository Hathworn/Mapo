; ModuleID = '../data/hip_kernels/4879/2/main.cu'
source_filename = "../data/hip_kernels/4879/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12transform_fcPfPKfii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = mul i32 %2, %2
  %7 = icmp eq i32 %2, 0
  br i1 %7, label %33, label %8

8:                                                ; preds = %4
  %9 = mul nsw i32 %6, %5
  %10 = tail call i32 @llvm.umax.i32(i32 %6, i32 1)
  %11 = add i32 %10, -1
  %12 = and i32 %10, 7
  %13 = icmp ult i32 %11, 7
  br i1 %13, label %16, label %14

14:                                               ; preds = %8
  %15 = and i32 %10, -8
  br label %35

16:                                               ; preds = %35, %8
  %17 = phi i32 [ 0, %8 ], [ %109, %35 ]
  %18 = icmp eq i32 %12, 0
  br i1 %18, label %33, label %19

19:                                               ; preds = %16, %19
  %20 = phi i32 [ %30, %19 ], [ %17, %16 ]
  %21 = phi i32 [ %31, %19 ], [ 0, %16 ]
  %22 = mul nsw i32 %20, %3
  %23 = add nsw i32 %22, %5
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5
  %27 = add nuw nsw i32 %20, %9
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  store float %26, float addrspace(1)* %29, align 4, !tbaa !5
  %30 = add nuw nsw i32 %20, 1
  %31 = add i32 %21, 1
  %32 = icmp eq i32 %31, %12
  br i1 %32, label %33, label %19, !llvm.loop !9

33:                                               ; preds = %16, %19, %4
  %34 = icmp eq i32 %5, 0
  br i1 %34, label %112, label %116

35:                                               ; preds = %35, %14
  %36 = phi i32 [ 0, %14 ], [ %109, %35 ]
  %37 = phi i32 [ 0, %14 ], [ %110, %35 ]
  %38 = mul nsw i32 %36, %3
  %39 = add nsw i32 %38, %5
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5
  %43 = add nuw nsw i32 %36, %9
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  store float %42, float addrspace(1)* %45, align 4, !tbaa !5
  %46 = or i32 %36, 1
  %47 = mul nsw i32 %46, %3
  %48 = add nsw i32 %47, %5
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5
  %52 = add nuw nsw i32 %46, %9
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  store float %51, float addrspace(1)* %54, align 4, !tbaa !5
  %55 = or i32 %36, 2
  %56 = mul nsw i32 %55, %3
  %57 = add nsw i32 %56, %5
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = add nuw nsw i32 %55, %9
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  store float %60, float addrspace(1)* %63, align 4, !tbaa !5
  %64 = or i32 %36, 3
  %65 = mul nsw i32 %64, %3
  %66 = add nsw i32 %65, %5
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5
  %70 = add nuw nsw i32 %64, %9
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  store float %69, float addrspace(1)* %72, align 4, !tbaa !5
  %73 = or i32 %36, 4
  %74 = mul nsw i32 %73, %3
  %75 = add nsw i32 %74, %5
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %79 = add nuw nsw i32 %73, %9
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  store float %78, float addrspace(1)* %81, align 4, !tbaa !5
  %82 = or i32 %36, 5
  %83 = mul nsw i32 %82, %3
  %84 = add nsw i32 %83, %5
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5
  %88 = add nuw nsw i32 %82, %9
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !5
  %91 = or i32 %36, 6
  %92 = mul nsw i32 %91, %3
  %93 = add nsw i32 %92, %5
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5
  %97 = add nuw nsw i32 %91, %9
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  store float %96, float addrspace(1)* %99, align 4, !tbaa !5
  %100 = or i32 %36, 7
  %101 = mul nsw i32 %100, %3
  %102 = add nsw i32 %101, %5
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5
  %106 = add nuw nsw i32 %100, %9
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  store float %105, float addrspace(1)* %108, align 4, !tbaa !5
  %109 = add nuw nsw i32 %36, 8
  %110 = add i32 %37, 8
  %111 = icmp eq i32 %110, %15
  br i1 %111, label %16, label %35, !llvm.loop !11

112:                                              ; preds = %33
  %113 = mul nsw i32 %6, %3
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  store float 1.000000e+00, float addrspace(1)* %115, align 4, !tbaa !5
  br label %116

116:                                              ; preds = %112, %33
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #2

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
