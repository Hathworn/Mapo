; ModuleID = '../data/hip_kernels/5386/59/main.cu'
source_filename = "../data/hip_kernels/5386/59/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17g_updatePrimalVarPfS_S_PKfS1_S1_ffmmmPKb(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float %6, float %7, i64 %8, i64 %9, i64 %10, i8 addrspace(1)* nocapture readonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = sext i32 %21 to i64
  %23 = icmp ult i64 %22, %8
  br i1 %23, label %24, label %107

24:                                               ; preds = %12
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !4, !invariant.load !5
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = add i32 %31, %25
  %33 = sext i32 %32 to i64
  %34 = icmp ult i64 %33, %9
  br i1 %34, label %35, label %107

35:                                               ; preds = %24
  %36 = mul i64 %33, %8
  %37 = add i64 %36, %22
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %11, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %40 = icmp ne i8 %39, 0
  %41 = icmp ne i64 %10, 0
  %42 = select i1 %40, i1 %41, i1 false
  br i1 %42, label %43, label %107

43:                                               ; preds = %35
  %44 = mul i64 %9, %8
  %45 = mul i64 %44, %10
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %45
  %47 = icmp sgt i32 %21, 0
  %48 = add i64 %37, -1
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %11, i64 %48
  %50 = icmp sgt i32 %32, 0
  %51 = sub i64 %37, %8
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %11, i64 %51
  %53 = fmul contract float %6, 2.000000e+00
  br label %54

54:                                               ; preds = %43, %83
  %55 = phi i64 [ 0, %43 ], [ %105, %83 ]
  %56 = mul i64 %44, %55
  %57 = add i64 %56, %37
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !12
  br i1 %47, label %60, label %71

60:                                               ; preds = %54
  %61 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %62 = icmp eq i8 %61, 0
  br i1 %62, label %71, label %63

63:                                               ; preds = %60
  %64 = add i64 %57, -1
  %65 = getelementptr inbounds float, float addrspace(1)* %3, i64 %64
  %66 = bitcast float addrspace(1)* %65 to <2 x float> addrspace(1)*
  %67 = load <2 x float>, <2 x float> addrspace(1)* %66, align 4, !tbaa !12
  %68 = extractelement <2 x float> %67, i64 0
  %69 = extractelement <2 x float> %67, i64 1
  %70 = fsub contract float %69, %68
  br label %71

71:                                               ; preds = %63, %60, %54
  %72 = phi float [ %70, %63 ], [ 0.000000e+00, %60 ], [ 0.000000e+00, %54 ]
  br i1 %50, label %73, label %83

73:                                               ; preds = %71
  %74 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %83, label %76

76:                                               ; preds = %73
  %77 = getelementptr inbounds float, float addrspace(1)* %46, i64 %57
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !12
  %79 = sub i64 %57, %8
  %80 = getelementptr inbounds float, float addrspace(1)* %46, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !12
  %82 = fsub contract float %78, %81
  br label %83

83:                                               ; preds = %71, %73, %76
  %84 = phi float [ %82, %76 ], [ 0.000000e+00, %73 ], [ 0.000000e+00, %71 ]
  %85 = fadd contract float %72, %84
  %86 = fmul contract float %85, %6
  %87 = fadd contract float %59, %86
  %88 = getelementptr inbounds float, float addrspace(1)* %5, i64 %57
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !12
  %90 = getelementptr inbounds float, float addrspace(1)* %4, i64 %57
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !12
  %92 = fmul contract float %53, %89
  %93 = fmul contract float %92, %91
  %94 = fadd contract float %93, %87
  %95 = fmul contract float %89, %92
  %96 = fadd contract float %95, 1.000000e+00
  %97 = fdiv contract float %94, %96
  %98 = fsub contract float %97, %59
  %99 = fmul contract float %98, %7
  %100 = fadd contract float %97, %99
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  store float %100, float addrspace(1)* %101, align 4, !tbaa !12
  store float %97, float addrspace(1)* %58, align 4, !tbaa !12
  %102 = tail call float @llvm.fabs.f32(float %98)
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  store float %102, float addrspace(1)* %103, align 4, !tbaa !12
  %104 = add nuw nsw i64 %55, 1
  %105 = and i64 %104, 4294967295
  %106 = icmp ult i64 %105, %10
  br i1 %106, label %54, label %107, !llvm.loop !14

107:                                              ; preds = %83, %35, %12, %24
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !9, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
