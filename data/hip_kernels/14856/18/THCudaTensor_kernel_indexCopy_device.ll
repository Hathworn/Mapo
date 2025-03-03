; ModuleID = '../data/hip_kernels/14856/18/main.cu'
source_filename = "../data/hip_kernels/14856/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29THCudaTensor_kernel_indexCopyPfS_PlS_lilll(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i64 %4, i32 %5, i64 %6, i64 %7, i64 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %10, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %20, %21
  %24 = mul i32 %23, %15
  %25 = add i32 %24, %22
  %26 = freeze i32 %25
  %27 = sdiv i64 %7, %6
  %28 = sext i32 %26 to i64
  %29 = icmp sgt i64 %27, %28
  %30 = icmp sgt i64 %6, 0
  %31 = and i1 %29, %30
  br i1 %31, label %32, label %99

32:                                               ; preds = %9
  %33 = icmp sgt i64 %4, 0
  %34 = sext i32 %5 to i64
  %35 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %34
  %36 = load i64, i64 addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  br label %37

37:                                               ; preds = %32, %39
  %38 = phi i64 [ 0, %32 ], [ %56, %39 ]
  br i1 %33, label %58, label %39

39:                                               ; preds = %91, %37
  %40 = phi i32 [ 0, %37 ], [ %93, %91 ]
  %41 = phi i32 [ 0, %37 ], [ %94, %91 ]
  %42 = sext i32 %40 to i64
  %43 = mul nsw i64 %36, %38
  %44 = add nsw i64 %43, %42
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !11
  %47 = sext i32 %41 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %38
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !11
  %50 = fptosi float %49 to i64
  %51 = add nsw i64 %50, -1
  %52 = mul nsw i64 %51, %36
  %53 = add nsw i64 %52, %47
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  store float %46, float addrspace(1)* %54, align 4, !tbaa !11
  %55 = add nuw nsw i64 %38, 1
  %56 = and i64 %55, 4294967295
  %57 = icmp slt i64 %56, %6
  br i1 %57, label %37, label %99, !llvm.loop !13

58:                                               ; preds = %37, %91
  %59 = phi i64 [ %97, %91 ], [ 0, %37 ]
  %60 = phi i32 [ %96, %91 ], [ %26, %37 ]
  %61 = phi i32 [ %94, %91 ], [ 0, %37 ]
  %62 = phi i32 [ %93, %91 ], [ 0, %37 ]
  %63 = trunc i64 %59 to i32
  %64 = icmp slt i32 %63, %5
  br i1 %64, label %65, label %80

65:                                               ; preds = %58
  %66 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %59
  %67 = load i64, i64 addrspace(1)* %66, align 8, !tbaa !7, !amdgpu.noclobber !5
  %68 = sdiv i64 %67, %8
  %69 = sext i32 %60 to i64
  %70 = sdiv i64 %69, %68
  %71 = mul nsw i64 %70, %68
  %72 = trunc i64 %71 to i32
  %73 = sub i32 %60, %72
  %74 = mul nsw i64 %71, %6
  %75 = trunc i64 %74 to i32
  %76 = add i32 %62, %75
  %77 = mul nsw i64 %70, %67
  %78 = trunc i64 %77 to i32
  %79 = add i32 %61, %78
  br label %91

80:                                               ; preds = %58
  %81 = icmp sgt i32 %63, %5
  br i1 %81, label %82, label %91

82:                                               ; preds = %80
  %83 = sext i32 %60 to i64
  %84 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %59
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !7, !amdgpu.noclobber !5
  %86 = srem i64 %83, %85
  %87 = trunc i64 %86 to i32
  %88 = sub i32 %60, %87
  %89 = add i32 %88, %62
  %90 = add i32 %88, %61
  br label %91

91:                                               ; preds = %65, %82, %80
  %92 = phi i32 [ %73, %65 ], [ %87, %82 ], [ %60, %80 ]
  %93 = phi i32 [ %76, %65 ], [ %89, %82 ], [ %62, %80 ]
  %94 = phi i32 [ %79, %65 ], [ %90, %82 ], [ %61, %80 ]
  %95 = add nuw nsw i64 %59, 1
  %96 = freeze i32 %92
  %97 = and i64 %95, 4294967295
  %98 = icmp slt i64 %97, %4
  br i1 %98, label %58, label %39, !llvm.loop !15

99:                                               ; preds = %39, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
