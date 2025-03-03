; ModuleID = '../data/hip_kernels/3633/0/main.cu'
source_filename = "../data/hip_kernels/3633/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13gpu_transposePfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %2
  %15 = icmp sgt i32 %3, 0
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %117

17:                                               ; preds = %4
  %18 = mul nsw i32 %13, %3
  %19 = and i32 %3, 7
  %20 = icmp ult i32 %3, 8
  br i1 %20, label %100, label %21

21:                                               ; preds = %17
  %22 = and i32 %3, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi i32 [ 0, %21 ], [ %97, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %98, %23 ]
  %26 = add nsw i32 %24, %18
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %30 = mul nsw i32 %24, %2
  %31 = add nsw i32 %30, %13
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  store float %29, float addrspace(1)* %33, align 4, !tbaa !7
  %34 = or i32 %24, 1
  %35 = add nsw i32 %34, %18
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = mul nsw i32 %34, %2
  %40 = add nsw i32 %39, %13
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %38, float addrspace(1)* %42, align 4, !tbaa !7
  %43 = or i32 %24, 2
  %44 = add nsw i32 %43, %18
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = mul nsw i32 %43, %2
  %49 = add nsw i32 %48, %13
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  store float %47, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = or i32 %24, 3
  %53 = add nsw i32 %52, %18
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = mul nsw i32 %52, %2
  %58 = add nsw i32 %57, %13
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  store float %56, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = or i32 %24, 4
  %62 = add nsw i32 %61, %18
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = mul nsw i32 %61, %2
  %67 = add nsw i32 %66, %13
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  store float %65, float addrspace(1)* %69, align 4, !tbaa !7
  %70 = or i32 %24, 5
  %71 = add nsw i32 %70, %18
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = mul nsw i32 %70, %2
  %76 = add nsw i32 %75, %13
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  store float %74, float addrspace(1)* %78, align 4, !tbaa !7
  %79 = or i32 %24, 6
  %80 = add nsw i32 %79, %18
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = mul nsw i32 %79, %2
  %85 = add nsw i32 %84, %13
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  store float %83, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = or i32 %24, 7
  %89 = add nsw i32 %88, %18
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = mul nsw i32 %88, %2
  %94 = add nsw i32 %93, %13
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  store float %92, float addrspace(1)* %96, align 4, !tbaa !7
  %97 = add nuw nsw i32 %24, 8
  %98 = add i32 %25, 8
  %99 = icmp eq i32 %98, %22
  br i1 %99, label %100, label %23, !llvm.loop !11

100:                                              ; preds = %23, %17
  %101 = phi i32 [ 0, %17 ], [ %97, %23 ]
  %102 = icmp eq i32 %19, 0
  br i1 %102, label %117, label %103

103:                                              ; preds = %100, %103
  %104 = phi i32 [ %114, %103 ], [ %101, %100 ]
  %105 = phi i32 [ %115, %103 ], [ 0, %100 ]
  %106 = add nsw i32 %104, %18
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = mul nsw i32 %104, %2
  %111 = add nsw i32 %110, %13
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  store float %109, float addrspace(1)* %113, align 4, !tbaa !7
  %114 = add nuw nsw i32 %104, 1
  %115 = add i32 %105, 1
  %116 = icmp eq i32 %115, %19
  br i1 %116, label %117, label %103, !llvm.loop !13

117:                                              ; preds = %100, %103, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
