; ModuleID = '../data/hip_kernels/15405/0/main.cu'
source_filename = "../data/hip_kernels/15405/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13kernelCompactPfS_PjS0_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %4
  br i1 %16, label %17, label %118

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %118

22:                                               ; preds = %17
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %18
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = mul nsw i32 %15, %5
  %26 = mul i32 %24, %5
  %27 = icmp sgt i32 %5, 0
  br i1 %27, label %28, label %118

28:                                               ; preds = %22
  %29 = and i32 %5, 7
  %30 = icmp ult i32 %5, 8
  br i1 %30, label %102, label %31

31:                                               ; preds = %28
  %32 = and i32 %5, -8
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi i32 [ 0, %31 ], [ %99, %33 ]
  %35 = phi i32 [ 0, %31 ], [ %100, %33 ]
  %36 = add nsw i32 %34, %25
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !11
  %40 = add i32 %34, %26
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  store float %39, float addrspace(1)* %42, align 4, !tbaa !11
  %43 = or i32 %34, 1
  %44 = add nsw i32 %43, %25
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !11
  %48 = add i32 %43, %26
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  store float %47, float addrspace(1)* %50, align 4, !tbaa !11
  %51 = or i32 %34, 2
  %52 = add nsw i32 %51, %25
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !11
  %56 = add i32 %51, %26
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  store float %55, float addrspace(1)* %58, align 4, !tbaa !11
  %59 = or i32 %34, 3
  %60 = add nsw i32 %59, %25
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !11
  %64 = add i32 %59, %26
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  store float %63, float addrspace(1)* %66, align 4, !tbaa !11
  %67 = or i32 %34, 4
  %68 = add nsw i32 %67, %25
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !11
  %72 = add i32 %67, %26
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  store float %71, float addrspace(1)* %74, align 4, !tbaa !11
  %75 = or i32 %34, 5
  %76 = add nsw i32 %75, %25
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !11
  %80 = add i32 %75, %26
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  store float %79, float addrspace(1)* %82, align 4, !tbaa !11
  %83 = or i32 %34, 6
  %84 = add nsw i32 %83, %25
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !11
  %88 = add i32 %83, %26
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !11
  %91 = or i32 %34, 7
  %92 = add nsw i32 %91, %25
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !11
  %96 = add i32 %91, %26
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  store float %95, float addrspace(1)* %98, align 4, !tbaa !11
  %99 = add nuw nsw i32 %34, 8
  %100 = add i32 %35, 8
  %101 = icmp eq i32 %100, %32
  br i1 %101, label %102, label %33, !llvm.loop !13

102:                                              ; preds = %33, %28
  %103 = phi i32 [ 0, %28 ], [ %99, %33 ]
  %104 = icmp eq i32 %29, 0
  br i1 %104, label %118, label %105

105:                                              ; preds = %102, %105
  %106 = phi i32 [ %115, %105 ], [ %103, %102 ]
  %107 = phi i32 [ %116, %105 ], [ 0, %102 ]
  %108 = add nsw i32 %106, %25
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !11
  %112 = add i32 %106, %26
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  store float %111, float addrspace(1)* %114, align 4, !tbaa !11
  %115 = add nuw nsw i32 %106, 1
  %116 = add i32 %107, 1
  %117 = icmp eq i32 %116, %29
  br i1 %117, label %118, label %105, !llvm.loop !15

118:                                              ; preds = %102, %105, %22, %17, %6
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
