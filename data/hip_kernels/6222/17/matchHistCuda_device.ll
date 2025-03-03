; ModuleID = '../data/hip_kernels/6222/17/main.cu'
source_filename = "../data/hip_kernels/6222/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13matchHistCudaPfS_mmmS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i64 %2, i64 %3, i64 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = zext i32 %24 to i64
  %26 = icmp ult i64 %16, %2
  %27 = icmp ult i64 %25, %3
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %104

29:                                               ; preds = %6
  %30 = mul i64 %16, %4
  %31 = mul i64 %25, %4
  %32 = icmp eq i64 %4, 0
  br i1 %32, label %33, label %84

33:                                               ; preds = %84, %29
  %34 = phi float [ 0.000000e+00, %29 ], [ %98, %84 ]
  %35 = phi float [ 0.000000e+00, %29 ], [ %100, %84 ]
  %36 = phi float [ 0.000000e+00, %29 ], [ %96, %84 ]
  %37 = fcmp olt float %34, 0x39F0000000000000
  %38 = select i1 %37, float 0x41F0000000000000, float 1.000000e+00
  %39 = fmul float %34, %38
  %40 = tail call float @llvm.sqrt.f32(float %39)
  %41 = bitcast float %40 to i32
  %42 = add nsw i32 %41, -1
  %43 = bitcast i32 %42 to float
  %44 = add nsw i32 %41, 1
  %45 = bitcast i32 %44 to float
  %46 = tail call i1 @llvm.amdgcn.class.f32(float %39, i32 608)
  %47 = select i1 %37, float 0x3EF0000000000000, float 1.000000e+00
  %48 = fneg float %45
  %49 = tail call float @llvm.fma.f32(float %48, float %40, float %39)
  %50 = fcmp ogt float %49, 0.000000e+00
  %51 = fneg float %43
  %52 = tail call float @llvm.fma.f32(float %51, float %40, float %39)
  %53 = fcmp ole float %52, 0.000000e+00
  %54 = select i1 %53, float %43, float %40
  %55 = select i1 %50, float %45, float %54
  %56 = fmul float %47, %55
  %57 = select i1 %46, float %39, float %56
  %58 = fcmp olt float %35, 0x39F0000000000000
  %59 = select i1 %58, float 0x41F0000000000000, float 1.000000e+00
  %60 = fmul float %35, %59
  %61 = tail call float @llvm.sqrt.f32(float %60)
  %62 = bitcast float %61 to i32
  %63 = add nsw i32 %62, -1
  %64 = bitcast i32 %63 to float
  %65 = add nsw i32 %62, 1
  %66 = bitcast i32 %65 to float
  %67 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 608)
  %68 = select i1 %58, float 0x3EF0000000000000, float 1.000000e+00
  %69 = fneg float %66
  %70 = tail call float @llvm.fma.f32(float %69, float %61, float %60)
  %71 = fcmp ogt float %70, 0.000000e+00
  %72 = fneg float %64
  %73 = tail call float @llvm.fma.f32(float %72, float %61, float %60)
  %74 = fcmp ole float %73, 0.000000e+00
  %75 = select i1 %74, float %64, float %61
  %76 = select i1 %71, float %66, float %75
  %77 = fmul float %68, %76
  %78 = select i1 %67, float %60, float %77
  %79 = fdiv contract float %57, %78
  %80 = fdiv contract float %36, %79
  %81 = mul i64 %25, %2
  %82 = add i64 %81, %16
  %83 = getelementptr inbounds float, float addrspace(1)* %5, i64 %82
  store float %80, float addrspace(1)* %83, align 4, !tbaa !7
  br label %104

84:                                               ; preds = %29, %84
  %85 = phi i64 [ %102, %84 ], [ 0, %29 ]
  %86 = phi float [ %96, %84 ], [ 0.000000e+00, %29 ]
  %87 = phi float [ %100, %84 ], [ 0.000000e+00, %29 ]
  %88 = phi float [ %98, %84 ], [ 0.000000e+00, %29 ]
  %89 = add i64 %85, %30
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = add i64 %85, %31
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = fmul contract float %91, %94
  %96 = fadd contract float %86, %95
  %97 = fmul contract float %91, %91
  %98 = fadd contract float %88, %97
  %99 = fmul contract float %94, %94
  %100 = fadd contract float %87, %99
  %101 = add nuw nsw i64 %85, 1
  %102 = and i64 %101, 4294967295
  %103 = icmp ult i64 %102, %4
  br i1 %103, label %84, label %33, !llvm.loop !11

104:                                              ; preds = %33, %6
  ret void
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
