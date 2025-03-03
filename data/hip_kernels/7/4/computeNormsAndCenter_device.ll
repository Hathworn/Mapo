; ModuleID = '../data/hip_kernels/7/4/main.cu'
source_filename = "../data/hip_kernels/7/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21computeNormsAndCenterPfS_S_P15HIP_vector_typeIfLj4EEPiS3_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, %struct.HIP_vector_type addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %16
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = add nsw i32 %20, %18
  %22 = icmp sgt i32 %20, 0
  %23 = mul nsw i32 %15, 3
  %24 = sext i32 %23 to i64
  br i1 %22, label %30, label %25

25:                                               ; preds = %6
  %26 = add nsw i32 %23, 1
  %27 = sext i32 %26 to i64
  %28 = add nsw i32 %23, 2
  %29 = sext i32 %28 to i64
  br label %38

30:                                               ; preds = %6
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %32 = add nsw i32 %23, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = add nsw i32 %23, 2
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  br label %73

38:                                               ; preds = %73, %25
  %39 = phi i64 [ %29, %25 ], [ %36, %73 ]
  %40 = phi i64 [ %27, %25 ], [ %33, %73 ]
  %41 = phi float [ 0.000000e+00, %25 ], [ %89, %73 ]
  %42 = fcmp olt float %41, 0x39F0000000000000
  %43 = select i1 %42, float 0x41F0000000000000, float 1.000000e+00
  %44 = fmul float %41, %43
  %45 = tail call float @llvm.sqrt.f32(float %44)
  %46 = bitcast float %45 to i32
  %47 = add nsw i32 %46, -1
  %48 = bitcast i32 %47 to float
  %49 = add nsw i32 %46, 1
  %50 = bitcast i32 %49 to float
  %51 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 608)
  %52 = select i1 %42, float 0x3EF0000000000000, float 1.000000e+00
  %53 = fneg float %50
  %54 = tail call float @llvm.fma.f32(float %53, float %45, float %44)
  %55 = fcmp ogt float %54, 0.000000e+00
  %56 = fneg float %48
  %57 = tail call float @llvm.fma.f32(float %56, float %45, float %44)
  %58 = fcmp ole float %57, 0.000000e+00
  %59 = select i1 %58, float %48, float %45
  %60 = select i1 %55, float %50, float %59
  %61 = fmul float %52, %60
  %62 = select i1 %51, float %44, float %61
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  store float %62, float addrspace(1)* %63, align 4, !tbaa !11
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !11
  %66 = fdiv contract float %65, %41
  store float %66, float addrspace(1)* %64, align 4, !tbaa !11
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !11
  %69 = fdiv contract float %68, %41
  store float %69, float addrspace(1)* %67, align 4, !tbaa !11
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !11
  %72 = fdiv contract float %71, %41
  store float %72, float addrspace(1)* %70, align 4, !tbaa !11
  ret void

73:                                               ; preds = %30, %73
  %74 = phi float [ 0.000000e+00, %30 ], [ %89, %73 ]
  %75 = phi i32 [ %18, %30 ], [ %90, %73 ]
  %76 = sdiv i32 %75, 3
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !11
  %80 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %77, i32 0, i32 0, i32 0, i64 0
  %81 = load float, float addrspace(1)* %80, align 16, !tbaa !13
  %82 = fmul contract float %79, %81
  store float %82, float addrspace(1)* %31, align 4, !tbaa !11
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %77, i32 0, i32 0, i32 0, i64 1
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !13
  %85 = fmul contract float %79, %84
  store float %85, float addrspace(1)* %34, align 4, !tbaa !11
  %86 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %77, i32 0, i32 0, i32 0, i64 2
  %87 = load float, float addrspace(1)* %86, align 8, !tbaa !13
  %88 = fmul contract float %79, %87
  store float %88, float addrspace(1)* %37, align 4, !tbaa !11
  %89 = fadd contract float %74, %79
  %90 = add nsw i32 %75, 3
  %91 = icmp slt i32 %90, %21
  br i1 %91, label %73, label %38, !llvm.loop !14
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = !{!9, !9, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
