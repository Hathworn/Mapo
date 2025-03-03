; ModuleID = '../data/hip_kernels/7024/5/main.cu'
source_filename = "../data/hip_kernels/7024/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z37cudaComputeAndNormalizeGradientLengthPhPiS0_i(i8 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %13, %3
  %15 = add nsw i32 %13, 1
  %16 = mul nsw i32 %15, %3
  %17 = icmp slt i32 %14, %16
  br i1 %17, label %18, label %60

18:                                               ; preds = %4
  %19 = and i32 %3, 1
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %57, label %21

21:                                               ; preds = %18
  %22 = sext i32 %14 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7
  %25 = mul nsw i32 %24, %24
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %22
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7
  %28 = mul nsw i32 %27, %27
  %29 = add nuw nsw i32 %28, %25
  %30 = sitofp i32 %29 to float
  %31 = icmp eq i32 %29, 0
  %32 = select i1 %31, float 0x41F0000000000000, float 1.000000e+00
  %33 = fmul float %32, %30
  %34 = tail call float @llvm.sqrt.f32(float %33)
  %35 = bitcast float %34 to i32
  %36 = add nsw i32 %35, -1
  %37 = bitcast i32 %36 to float
  %38 = add nsw i32 %35, 1
  %39 = bitcast i32 %38 to float
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %33, i32 608)
  %41 = select i1 %31, float 0x3EF0000000000000, float 1.000000e+00
  %42 = fneg float %39
  %43 = tail call float @llvm.fma.f32(float %42, float %34, float %33)
  %44 = fcmp ogt float %43, 0.000000e+00
  %45 = fneg float %37
  %46 = tail call float @llvm.fma.f32(float %45, float %34, float %33)
  %47 = fcmp ole float %46, 0.000000e+00
  %48 = select i1 %47, float %37, float %34
  %49 = select i1 %44, float %39, float %48
  %50 = fmul float %41, %49
  %51 = select i1 %40, float %33, float %50
  %52 = fptosi float %51 to i32
  %53 = tail call i32 @llvm.smin.i32(i32 %52, i32 255)
  %54 = trunc i32 %53 to i8
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %22
  store i8 %54, i8 addrspace(1)* %55, align 1, !tbaa !11
  %56 = add nsw i32 %14, 1
  br label %57

57:                                               ; preds = %21, %18
  %58 = phi i32 [ %14, %18 ], [ %56, %21 ]
  %59 = icmp eq i32 %3, 1
  br i1 %59, label %60, label %61

60:                                               ; preds = %57, %61, %4
  ret void

61:                                               ; preds = %57, %61
  %62 = phi i32 [ %132, %61 ], [ %58, %57 ]
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7
  %66 = mul nsw i32 %65, %65
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %63
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7
  %69 = mul nsw i32 %68, %68
  %70 = add nuw nsw i32 %69, %66
  %71 = sitofp i32 %70 to float
  %72 = icmp eq i32 %70, 0
  %73 = select i1 %72, float 0x41F0000000000000, float 1.000000e+00
  %74 = fmul float %73, %71
  %75 = tail call float @llvm.sqrt.f32(float %74)
  %76 = bitcast float %75 to i32
  %77 = add nsw i32 %76, -1
  %78 = bitcast i32 %77 to float
  %79 = add nsw i32 %76, 1
  %80 = bitcast i32 %79 to float
  %81 = tail call i1 @llvm.amdgcn.class.f32(float %74, i32 608)
  %82 = select i1 %72, float 0x3EF0000000000000, float 1.000000e+00
  %83 = fneg float %80
  %84 = tail call float @llvm.fma.f32(float %83, float %75, float %74)
  %85 = fcmp ogt float %84, 0.000000e+00
  %86 = fneg float %78
  %87 = tail call float @llvm.fma.f32(float %86, float %75, float %74)
  %88 = fcmp ole float %87, 0.000000e+00
  %89 = select i1 %88, float %78, float %75
  %90 = select i1 %85, float %80, float %89
  %91 = fmul float %82, %90
  %92 = select i1 %81, float %74, float %91
  %93 = fptosi float %92 to i32
  %94 = tail call i32 @llvm.smin.i32(i32 %93, i32 255)
  %95 = trunc i32 %94 to i8
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  store i8 %95, i8 addrspace(1)* %96, align 1, !tbaa !11
  %97 = add nsw i32 %62, 1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7
  %101 = mul nsw i32 %100, %100
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %98
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7
  %104 = mul nsw i32 %103, %103
  %105 = add nuw nsw i32 %104, %101
  %106 = sitofp i32 %105 to float
  %107 = icmp eq i32 %105, 0
  %108 = select i1 %107, float 0x41F0000000000000, float 1.000000e+00
  %109 = fmul float %108, %106
  %110 = tail call float @llvm.sqrt.f32(float %109)
  %111 = bitcast float %110 to i32
  %112 = add nsw i32 %111, -1
  %113 = bitcast i32 %112 to float
  %114 = add nsw i32 %111, 1
  %115 = bitcast i32 %114 to float
  %116 = tail call i1 @llvm.amdgcn.class.f32(float %109, i32 608)
  %117 = select i1 %107, float 0x3EF0000000000000, float 1.000000e+00
  %118 = fneg float %115
  %119 = tail call float @llvm.fma.f32(float %118, float %110, float %109)
  %120 = fcmp ogt float %119, 0.000000e+00
  %121 = fneg float %113
  %122 = tail call float @llvm.fma.f32(float %121, float %110, float %109)
  %123 = fcmp ole float %122, 0.000000e+00
  %124 = select i1 %123, float %113, float %110
  %125 = select i1 %120, float %115, float %124
  %126 = fmul float %117, %125
  %127 = select i1 %116, float %109, float %126
  %128 = fptosi float %127 to i32
  %129 = tail call i32 @llvm.smin.i32(i32 %128, i32 255)
  %130 = trunc i32 %129 to i8
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %98
  store i8 %130, i8 addrspace(1)* %131, align 1, !tbaa !11
  %132 = add nsw i32 %62, 2
  %133 = icmp eq i32 %132, %16
  br i1 %133, label %60, label %61, !llvm.loop !12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
