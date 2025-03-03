; ModuleID = '../data/hip_kernels/15412/159/main.cu'
source_filename = "../data/hip_kernels/15412/159/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z48gradient_array_normalize_channels_softmax_kernelPfiiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
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
  br i1 %20, label %21, label %122

21:                                               ; preds = %6
  %22 = sub nsw i32 %16, %17
  %23 = mul nsw i32 %22, %3
  %24 = add i32 %23, %17
  %25 = and i32 %3, 3
  %26 = icmp ult i32 %3, 4
  br i1 %26, label %98, label %27

27:                                               ; preds = %21
  %28 = and i32 %3, -4
  br label %29

29:                                               ; preds = %29, %27
  %30 = phi i32 [ 0, %27 ], [ %95, %29 ]
  %31 = phi i32 [ 0, %27 ], [ %96, %29 ]
  %32 = mul nsw i32 %30, %4
  %33 = add i32 %24, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = fsub contract float 1.000000e+00, %38
  %40 = fmul contract float %38, %39
  %41 = fmul contract float %36, %40
  %42 = fcmp uno float %41, 0.000000e+00
  %43 = tail call float @llvm.fabs.f32(float %41) #3
  %44 = fcmp oeq float %43, 0x7FF0000000000000
  %45 = select i1 %42, i1 true, i1 %44
  %46 = select i1 %45, float 0.000000e+00, float %41
  store float %46, float addrspace(1)* %35, align 4, !tbaa !7
  %47 = or i32 %30, 1
  %48 = mul nsw i32 %47, %4
  %49 = add i32 %24, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %5, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = fsub contract float 1.000000e+00, %54
  %56 = fmul contract float %54, %55
  %57 = fmul contract float %52, %56
  %58 = fcmp uno float %57, 0.000000e+00
  %59 = tail call float @llvm.fabs.f32(float %57) #3
  %60 = fcmp oeq float %59, 0x7FF0000000000000
  %61 = select i1 %58, i1 true, i1 %60
  %62 = select i1 %61, float 0.000000e+00, float %57
  store float %62, float addrspace(1)* %51, align 4, !tbaa !7
  %63 = or i32 %30, 2
  %64 = mul nsw i32 %63, %4
  %65 = add i32 %24, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %5, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fsub contract float 1.000000e+00, %70
  %72 = fmul contract float %70, %71
  %73 = fmul contract float %68, %72
  %74 = fcmp uno float %73, 0.000000e+00
  %75 = tail call float @llvm.fabs.f32(float %73) #3
  %76 = fcmp oeq float %75, 0x7FF0000000000000
  %77 = select i1 %74, i1 true, i1 %76
  %78 = select i1 %77, float 0.000000e+00, float %73
  store float %78, float addrspace(1)* %67, align 4, !tbaa !7
  %79 = or i32 %30, 3
  %80 = mul nsw i32 %79, %4
  %81 = add i32 %24, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %5, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fsub contract float 1.000000e+00, %86
  %88 = fmul contract float %86, %87
  %89 = fmul contract float %84, %88
  %90 = fcmp uno float %89, 0.000000e+00
  %91 = tail call float @llvm.fabs.f32(float %89) #3
  %92 = fcmp oeq float %91, 0x7FF0000000000000
  %93 = select i1 %90, i1 true, i1 %92
  %94 = select i1 %93, float 0.000000e+00, float %89
  store float %94, float addrspace(1)* %83, align 4, !tbaa !7
  %95 = add nuw nsw i32 %30, 4
  %96 = add i32 %31, 4
  %97 = icmp eq i32 %96, %28
  br i1 %97, label %98, label %29, !llvm.loop !11

98:                                               ; preds = %29, %21
  %99 = phi i32 [ 0, %21 ], [ %95, %29 ]
  %100 = icmp eq i32 %25, 0
  br i1 %100, label %122, label %101

101:                                              ; preds = %98, %101
  %102 = phi i32 [ %119, %101 ], [ %99, %98 ]
  %103 = phi i32 [ %120, %101 ], [ 0, %98 ]
  %104 = mul nsw i32 %102, %4
  %105 = add i32 %24, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %5, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = fsub contract float 1.000000e+00, %110
  %112 = fmul contract float %110, %111
  %113 = fmul contract float %108, %112
  %114 = fcmp uno float %113, 0.000000e+00
  %115 = tail call float @llvm.fabs.f32(float %113) #3
  %116 = fcmp oeq float %115, 0x7FF0000000000000
  %117 = select i1 %114, i1 true, i1 %116
  %118 = select i1 %117, float 0.000000e+00, float %113
  store float %118, float addrspace(1)* %107, align 4, !tbaa !7
  %119 = add nuw nsw i32 %102, 1
  %120 = add i32 %103, 1
  %121 = icmp eq i32 %120, %25
  br i1 %121, label %122, label %101, !llvm.loop !13

122:                                              ; preds = %98, %101, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
