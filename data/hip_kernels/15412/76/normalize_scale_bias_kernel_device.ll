; ModuleID = '../data/hip_kernels/15412/76/main.cu'
source_filename = "../data/hip_kernels/15412/76/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27normalize_scale_bias_kerneliPfS_S_S_S_iiiif(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9, float %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %0
  br i1 %21, label %22, label %76

22:                                               ; preds = %11
  %23 = sdiv i32 %20, %8
  %24 = srem i32 %23, %7
  %25 = icmp eq i32 %9, 0
  %26 = sext i32 %20 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %29 = sext i32 %24 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %32 = fsub contract float %28, %31
  %33 = getelementptr inbounds float, float addrspace(1)* %3, i64 %29
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  br i1 %25, label %37, label %35

35:                                               ; preds = %22
  %36 = fmul contract float %32, %34
  br label %61

37:                                               ; preds = %22
  %38 = fadd contract float %34, %10
  %39 = fcmp olt float %38, 0x39F0000000000000
  %40 = select i1 %39, float 0x41F0000000000000, float 1.000000e+00
  %41 = fmul float %38, %40
  %42 = tail call float @llvm.sqrt.f32(float %41)
  %43 = bitcast float %42 to i32
  %44 = add nsw i32 %43, -1
  %45 = bitcast i32 %44 to float
  %46 = add nsw i32 %43, 1
  %47 = bitcast i32 %46 to float
  %48 = tail call i1 @llvm.amdgcn.class.f32(float %41, i32 608)
  %49 = select i1 %39, float 0x3EF0000000000000, float 1.000000e+00
  %50 = fneg float %47
  %51 = tail call float @llvm.fma.f32(float %50, float %42, float %41)
  %52 = fcmp ogt float %51, 0.000000e+00
  %53 = fneg float %45
  %54 = tail call float @llvm.fma.f32(float %53, float %42, float %41)
  %55 = fcmp ole float %54, 0.000000e+00
  %56 = select i1 %55, float %45, float %42
  %57 = select i1 %52, float %47, float %56
  %58 = fmul float %49, %57
  %59 = select i1 %48, float %41, float %58
  %60 = fdiv contract float %32, %59
  br label %61

61:                                               ; preds = %37, %35
  %62 = phi float [ %60, %37 ], [ %36, %35 ]
  %63 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = fmul contract float %62, %64
  %66 = getelementptr inbounds float, float addrspace(1)* %5, i64 %29
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fadd contract float %65, %67
  %69 = fcmp uno float %68, 0.000000e+00
  %70 = tail call float @llvm.fabs.f32(float %68) #3
  %71 = fcmp oeq float %70, 0x7FF0000000000000
  %72 = select i1 %69, i1 true, i1 %71
  br i1 %72, label %76, label %73

73:                                               ; preds = %61
  %74 = sext i32 %20 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  store float %68, float addrspace(1)* %75, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %61, %73, %11
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
