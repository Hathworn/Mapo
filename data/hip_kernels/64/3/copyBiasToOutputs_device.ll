; ModuleID = '../data/hip_kernels/64/3/main.cu'
source_filename = "../data/hip_kernels/64/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17copyBiasToOutputsPfS_iiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = mul nsw i32 %18, %6
  %23 = mul nsw i32 %17, %5
  %24 = add nsw i32 %22, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = icmp sgt i32 %3, 0
  br i1 %27, label %28, label %59

28:                                               ; preds = %7
  %29 = icmp slt i32 %16, %4
  br i1 %29, label %35, label %30

30:                                               ; preds = %28
  %31 = and i32 %3, 7
  %32 = icmp ult i32 %3, 8
  br i1 %32, label %53, label %33

33:                                               ; preds = %30
  %34 = and i32 %3, -8
  br label %60

35:                                               ; preds = %28
  %36 = and i32 %3, 7
  %37 = icmp ult i32 %3, 8
  br i1 %37, label %40, label %38

38:                                               ; preds = %35
  %39 = and i32 %3, -8
  br label %64

40:                                               ; preds = %64, %35
  %41 = phi i32 [ 0, %35 ], [ %106, %64 ]
  %42 = icmp eq i32 %36, 0
  br i1 %42, label %59, label %43

43:                                               ; preds = %40, %43
  %44 = phi i32 [ %50, %43 ], [ %41, %40 ]
  %45 = phi i32 [ %51, %43 ], [ 0, %40 ]
  %46 = mul nsw i32 %44, %4
  %47 = add nsw i32 %46, %16
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %26, i64 %48
  store float %21, float addrspace(1)* %49, align 4, !tbaa !7
  %50 = add nuw nsw i32 %44, 1
  %51 = add i32 %45, 1
  %52 = icmp eq i32 %51, %36
  br i1 %52, label %59, label %43, !llvm.loop !11

53:                                               ; preds = %60, %30
  %54 = icmp eq i32 %31, 0
  br i1 %54, label %59, label %55

55:                                               ; preds = %53, %55
  %56 = phi i32 [ %57, %55 ], [ 0, %53 ]
  %57 = add i32 %56, 1
  %58 = icmp eq i32 %57, %31
  br i1 %58, label %59, label %55, !llvm.loop !13

59:                                               ; preds = %43, %40, %55, %53, %7
  ret void

60:                                               ; preds = %60, %33
  %61 = phi i32 [ 0, %33 ], [ %62, %60 ]
  %62 = add i32 %61, 8
  %63 = icmp eq i32 %62, %34
  br i1 %63, label %53, label %60, !llvm.loop !14

64:                                               ; preds = %64, %38
  %65 = phi i32 [ 0, %38 ], [ %106, %64 ]
  %66 = phi i32 [ 0, %38 ], [ %107, %64 ]
  %67 = mul nsw i32 %65, %4
  %68 = add nsw i32 %67, %16
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %26, i64 %69
  store float %21, float addrspace(1)* %70, align 4, !tbaa !7
  %71 = or i32 %65, 1
  %72 = mul nsw i32 %71, %4
  %73 = add nsw i32 %72, %16
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %26, i64 %74
  store float %21, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = or i32 %65, 2
  %77 = mul nsw i32 %76, %4
  %78 = add nsw i32 %77, %16
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %26, i64 %79
  store float %21, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = or i32 %65, 3
  %82 = mul nsw i32 %81, %4
  %83 = add nsw i32 %82, %16
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %26, i64 %84
  store float %21, float addrspace(1)* %85, align 4, !tbaa !7
  %86 = or i32 %65, 4
  %87 = mul nsw i32 %86, %4
  %88 = add nsw i32 %87, %16
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %26, i64 %89
  store float %21, float addrspace(1)* %90, align 4, !tbaa !7
  %91 = or i32 %65, 5
  %92 = mul nsw i32 %91, %4
  %93 = add nsw i32 %92, %16
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %26, i64 %94
  store float %21, float addrspace(1)* %95, align 4, !tbaa !7
  %96 = or i32 %65, 6
  %97 = mul nsw i32 %96, %4
  %98 = add nsw i32 %97, %16
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %26, i64 %99
  store float %21, float addrspace(1)* %100, align 4, !tbaa !7
  %101 = or i32 %65, 7
  %102 = mul nsw i32 %101, %4
  %103 = add nsw i32 %102, %16
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %26, i64 %104
  store float %21, float addrspace(1)* %105, align 4, !tbaa !7
  %106 = add nuw nsw i32 %65, 8
  %107 = add i32 %66, 8
  %108 = icmp eq i32 %107, %39
  br i1 %108, label %40, label %64, !llvm.loop !14
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
