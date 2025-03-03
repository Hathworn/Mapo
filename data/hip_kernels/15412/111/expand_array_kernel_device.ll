; ModuleID = '../data/hip_kernels/15412/111/main.cu'
source_filename = "../data/hip_kernels/15412/111/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19expand_array_kernelPKfPfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  %15 = icmp sgt i32 %3, 0
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %91

17:                                               ; preds = %4
  %18 = sext i32 %13 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = and i32 %3, 7
  %21 = icmp ult i32 %3, 8
  br i1 %21, label %77, label %22

22:                                               ; preds = %17
  %23 = and i32 %3, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 0, %22 ], [ %74, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %75, %24 ]
  %27 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %28 = mul nsw i32 %25, %2
  %29 = add nsw i32 %28, %13
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  store float %27, float addrspace(1)* %31, align 4, !tbaa !7
  %32 = or i32 %25, 1
  %33 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %34 = mul nsw i32 %32, %2
  %35 = add nsw i32 %34, %13
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  store float %33, float addrspace(1)* %37, align 4, !tbaa !7
  %38 = or i32 %25, 2
  %39 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %40 = mul nsw i32 %38, %2
  %41 = add nsw i32 %40, %13
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  store float %39, float addrspace(1)* %43, align 4, !tbaa !7
  %44 = or i32 %25, 3
  %45 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %46 = mul nsw i32 %44, %2
  %47 = add nsw i32 %46, %13
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  store float %45, float addrspace(1)* %49, align 4, !tbaa !7
  %50 = or i32 %25, 4
  %51 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %52 = mul nsw i32 %50, %2
  %53 = add nsw i32 %52, %13
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  store float %51, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = or i32 %25, 5
  %57 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %58 = mul nsw i32 %56, %2
  %59 = add nsw i32 %58, %13
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  store float %57, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = or i32 %25, 6
  %63 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %64 = mul nsw i32 %62, %2
  %65 = add nsw i32 %64, %13
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  store float %63, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = or i32 %25, 7
  %69 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %70 = mul nsw i32 %68, %2
  %71 = add nsw i32 %70, %13
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  store float %69, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = add nuw nsw i32 %25, 8
  %75 = add i32 %26, 8
  %76 = icmp eq i32 %75, %23
  br i1 %76, label %77, label %24, !llvm.loop !11

77:                                               ; preds = %24, %17
  %78 = phi i32 [ 0, %17 ], [ %74, %24 ]
  %79 = icmp eq i32 %20, 0
  br i1 %79, label %91, label %80

80:                                               ; preds = %77, %80
  %81 = phi i32 [ %88, %80 ], [ %78, %77 ]
  %82 = phi i32 [ %89, %80 ], [ 0, %77 ]
  %83 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %84 = mul nsw i32 %81, %2
  %85 = add nsw i32 %84, %13
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  store float %83, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = add nuw nsw i32 %81, 1
  %89 = add i32 %82, 1
  %90 = icmp eq i32 %89, %20
  br i1 %90, label %91, label %80, !llvm.loop !13

91:                                               ; preds = %77, %80, %4
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
