; ModuleID = '../data/hip_kernels/16020/55/main.cu'
source_filename = "../data/hip_kernels/16020/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21power_spectrum_kerneliPKfiPfib(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i1 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul nsw i32 %8, %2
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %1, i64 %10
  %12 = mul nsw i32 %8, %4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %3, i64 %13
  %15 = sdiv i32 %0, 2
  %16 = icmp slt i32 %7, %15
  br i1 %16, label %17, label %19

17:                                               ; preds = %6
  %18 = bitcast float addrspace(1)* %11 to %struct.HIP_vector_type addrspace(1)*
  br label %21

19:                                               ; preds = %58, %6
  %20 = icmp eq i32 %7, 0
  br i1 %20, label %61, label %76

21:                                               ; preds = %17, %58
  %22 = phi i32 [ %7, %17 ], [ %59, %58 ]
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %58, label %24

24:                                               ; preds = %21
  %25 = zext i32 %22 to i64
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %18, i64 %25, i32 0, i32 0, i32 0, i64 0
  %27 = load float, float addrspace(1)* %26, align 8
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %18, i64 %25, i32 0, i32 0, i32 0, i64 1
  %29 = load float, float addrspace(1)* %28, align 4
  %30 = fmul contract float %27, %27
  %31 = fmul contract float %29, %29
  %32 = fadd contract float %30, %31
  br i1 %5, label %55, label %33

33:                                               ; preds = %24
  %34 = fcmp olt float %32, 0x39F0000000000000
  %35 = select i1 %34, float 0x41F0000000000000, float 1.000000e+00
  %36 = fmul float %32, %35
  %37 = tail call float @llvm.sqrt.f32(float %36)
  %38 = bitcast float %37 to i32
  %39 = add nsw i32 %38, -1
  %40 = bitcast i32 %39 to float
  %41 = add nsw i32 %38, 1
  %42 = bitcast i32 %41 to float
  %43 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 608)
  %44 = select i1 %34, float 0x3EF0000000000000, float 1.000000e+00
  %45 = fneg float %42
  %46 = tail call float @llvm.fma.f32(float %45, float %37, float %36)
  %47 = fcmp ogt float %46, 0.000000e+00
  %48 = fneg float %40
  %49 = tail call float @llvm.fma.f32(float %48, float %37, float %36)
  %50 = fcmp ole float %49, 0.000000e+00
  %51 = select i1 %50, float %40, float %37
  %52 = select i1 %47, float %42, float %51
  %53 = fmul float %44, %52
  %54 = select i1 %43, float %36, float %53
  br label %55

55:                                               ; preds = %24, %33
  %56 = phi float [ %54, %33 ], [ %32, %24 ]
  %57 = getelementptr inbounds float, float addrspace(1)* %14, i64 %25
  store float %56, float addrspace(1)* %57, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %55, %21
  %59 = add nuw nsw i32 %22, 256
  %60 = icmp slt i32 %59, %15
  br i1 %60, label %21, label %19, !llvm.loop !9

61:                                               ; preds = %19
  %62 = load float, float addrspace(1)* %11, align 4, !tbaa !5
  %63 = sext i32 %0 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %11, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5
  %66 = sext i32 %15 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %14, i64 %66
  br i1 %5, label %68, label %71

68:                                               ; preds = %61
  %69 = fmul contract float %62, %62
  store float %69, float addrspace(1)* %14, align 4, !tbaa !5
  %70 = fmul contract float %65, %65
  br label %74

71:                                               ; preds = %61
  %72 = tail call float @llvm.fabs.f32(float %62)
  store float %72, float addrspace(1)* %14, align 4, !tbaa !5
  %73 = tail call float @llvm.fabs.f32(float %65)
  br label %74

74:                                               ; preds = %71, %68
  %75 = phi float [ %70, %68 ], [ %73, %71 ]
  store float %75, float addrspace(1)* %67, align 4, !tbaa !5
  br label %76

76:                                               ; preds = %74, %19
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
