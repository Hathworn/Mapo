; ModuleID = '../data/hip_kernels/15412/160/main.cu'
source_filename = "../data/hip_kernels/15412/160/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z40gradient_array_normalize_channels_kernelPfiiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = freeze i32 %15
  %17 = srem i32 %16, %4
  %18 = icmp slt i32 %16, %1
  %19 = icmp sgt i32 %3, 0
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %102

21:                                               ; preds = %6
  %22 = sub nsw i32 %16, %17
  %23 = mul nsw i32 %22, %3
  %24 = add i32 %23, %17
  %25 = and i32 %3, 3
  %26 = icmp ult i32 %3, 4
  br i1 %26, label %82, label %27

27:                                               ; preds = %21
  %28 = and i32 %3, -4
  br label %29

29:                                               ; preds = %78, %27
  %30 = phi i32 [ 0, %27 ], [ %79, %78 ]
  %31 = phi i32 [ 0, %27 ], [ %80, %78 ]
  %32 = mul nsw i32 %30, %4
  %33 = add i32 %24, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = fcmp contract ogt float %36, 0.000000e+00
  br i1 %37, label %38, label %42

38:                                               ; preds = %29
  %39 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = fmul contract float %36, %40
  store float %41, float addrspace(1)* %39, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %38, %29
  %43 = or i32 %30, 1
  %44 = mul nsw i32 %43, %4
  %45 = add i32 %24, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = fcmp contract ogt float %48, 0.000000e+00
  br i1 %49, label %50, label %54

50:                                               ; preds = %42
  %51 = getelementptr inbounds float, float addrspace(1)* %5, i64 %46
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fmul contract float %48, %52
  store float %53, float addrspace(1)* %51, align 4, !tbaa !7
  br label %54

54:                                               ; preds = %50, %42
  %55 = or i32 %30, 2
  %56 = mul nsw i32 %55, %4
  %57 = add i32 %24, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fcmp contract ogt float %60, 0.000000e+00
  br i1 %61, label %62, label %66

62:                                               ; preds = %54
  %63 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fmul contract float %60, %64
  store float %65, float addrspace(1)* %63, align 4, !tbaa !7
  br label %66

66:                                               ; preds = %62, %54
  %67 = or i32 %30, 3
  %68 = mul nsw i32 %67, %4
  %69 = add i32 %24, %68
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fcmp contract ogt float %72, 0.000000e+00
  br i1 %73, label %74, label %78

74:                                               ; preds = %66
  %75 = getelementptr inbounds float, float addrspace(1)* %5, i64 %70
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fmul contract float %72, %76
  store float %77, float addrspace(1)* %75, align 4, !tbaa !7
  br label %78

78:                                               ; preds = %74, %66
  %79 = add nuw nsw i32 %30, 4
  %80 = add i32 %31, 4
  %81 = icmp eq i32 %80, %28
  br i1 %81, label %82, label %29, !llvm.loop !11

82:                                               ; preds = %78, %21
  %83 = phi i32 [ 0, %21 ], [ %79, %78 ]
  %84 = icmp eq i32 %25, 0
  br i1 %84, label %102, label %85

85:                                               ; preds = %82, %98
  %86 = phi i32 [ %99, %98 ], [ %83, %82 ]
  %87 = phi i32 [ %100, %98 ], [ 0, %82 ]
  %88 = mul nsw i32 %86, %4
  %89 = add i32 %24, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fcmp contract ogt float %92, 0.000000e+00
  br i1 %93, label %94, label %98

94:                                               ; preds = %85
  %95 = getelementptr inbounds float, float addrspace(1)* %5, i64 %90
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fmul contract float %92, %96
  store float %97, float addrspace(1)* %95, align 4, !tbaa !7
  br label %98

98:                                               ; preds = %94, %85
  %99 = add nuw nsw i32 %86, 1
  %100 = add i32 %87, 1
  %101 = icmp eq i32 %100, %25
  br i1 %101, label %102, label %85, !llvm.loop !13

102:                                              ; preds = %82, %98, %6
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
