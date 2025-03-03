; ModuleID = '../data/hip_kernels/5586/7/main.cu'
source_filename = "../data/hip_kernels/5586/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18matrixAdd_C_KernelPfS_S_mi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i64 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = lshr i64 %3, 2
  %16 = trunc i64 %15 to i32
  %17 = icmp slt i32 %14, %4
  %18 = icmp sgt i32 %4, 0
  %19 = and i1 %17, %18
  br i1 %19, label %20, label %128

20:                                               ; preds = %5
  %21 = and i32 %4, 7
  %22 = icmp ult i32 %4, 8
  br i1 %22, label %110, label %23

23:                                               ; preds = %20
  %24 = and i32 %4, -8
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi i32 [ 0, %23 ], [ %107, %25 ]
  %27 = phi i32 [ 0, %23 ], [ %108, %25 ]
  %28 = mul nsw i32 %26, %16
  %29 = add nsw i32 %28, %14
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = fadd contract float %32, %34
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  store float %35, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = or i32 %26, 1
  %38 = mul nsw i32 %37, %16
  %39 = add nsw i32 %38, %14
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = fadd contract float %42, %44
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  store float %45, float addrspace(1)* %46, align 4, !tbaa !7
  %47 = or i32 %26, 2
  %48 = mul nsw i32 %47, %16
  %49 = add nsw i32 %48, %14
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = fadd contract float %52, %54
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  store float %55, float addrspace(1)* %56, align 4, !tbaa !7
  %57 = or i32 %26, 3
  %58 = mul nsw i32 %57, %16
  %59 = add nsw i32 %58, %14
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fadd contract float %62, %64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  store float %65, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = or i32 %26, 4
  %68 = mul nsw i32 %67, %16
  %69 = add nsw i32 %68, %14
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fadd contract float %72, %74
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  store float %75, float addrspace(1)* %76, align 4, !tbaa !7
  %77 = or i32 %26, 5
  %78 = mul nsw i32 %77, %16
  %79 = add nsw i32 %78, %14
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = fadd contract float %82, %84
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  store float %85, float addrspace(1)* %86, align 4, !tbaa !7
  %87 = or i32 %26, 6
  %88 = mul nsw i32 %87, %16
  %89 = add nsw i32 %88, %14
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = fadd contract float %92, %94
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  store float %95, float addrspace(1)* %96, align 4, !tbaa !7
  %97 = or i32 %26, 7
  %98 = mul nsw i32 %97, %16
  %99 = add nsw i32 %98, %14
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = fadd contract float %102, %104
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  store float %105, float addrspace(1)* %106, align 4, !tbaa !7
  %107 = add nuw nsw i32 %26, 8
  %108 = add i32 %27, 8
  %109 = icmp eq i32 %108, %24
  br i1 %109, label %110, label %25, !llvm.loop !11

110:                                              ; preds = %25, %20
  %111 = phi i32 [ 0, %20 ], [ %107, %25 ]
  %112 = icmp eq i32 %21, 0
  br i1 %112, label %128, label %113

113:                                              ; preds = %110, %113
  %114 = phi i32 [ %125, %113 ], [ %111, %110 ]
  %115 = phi i32 [ %126, %113 ], [ 0, %110 ]
  %116 = mul nsw i32 %114, %16
  %117 = add nsw i32 %116, %14
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fadd contract float %120, %122
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  store float %123, float addrspace(1)* %124, align 4, !tbaa !7
  %125 = add nuw nsw i32 %114, 1
  %126 = add i32 %115, 1
  %127 = icmp eq i32 %126, %21
  br i1 %127, label %128, label %113, !llvm.loop !13

128:                                              ; preds = %110, %113, %5
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
