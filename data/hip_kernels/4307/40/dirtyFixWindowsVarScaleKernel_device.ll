; ModuleID = '../data/hip_kernels/4307/40/main.cu'
source_filename = "../data/hip_kernels/4307/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z29dirtyFixWindowsVarScaleKernelPfS_S_S_ifff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, i32 %4, float %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = shl nsw i32 %4, 1
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %80

15:                                               ; preds = %8
  %16 = icmp slt i32 %12, %4
  br i1 %16, label %17, label %48

17:                                               ; preds = %15
  %18 = fsub contract float 1.000000e+00, %5
  %19 = fadd contract float %5, -1.000000e+00
  %20 = sext i32 %12 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = tail call float @llvm.minnum.f32(float %19, float %22)
  %24 = tail call float @llvm.maxnum.f32(float %18, float %23)
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = tail call float @llvm.minnum.f32(float %19, float %26)
  %28 = tail call float @llvm.maxnum.f32(float %18, float %27)
  %29 = fadd contract float %24, %7
  %30 = fpext float %29 to double
  %31 = fadd contract double %30, 0xBFEFAE147AE147AE
  %32 = fpext float %28 to double
  %33 = fcmp contract ogt double %31, %32
  br i1 %33, label %34, label %45

34:                                               ; preds = %17
  %35 = fadd contract float %24, %28
  %36 = fmul contract float %35, 5.000000e-01
  %37 = fpext float %36 to double
  %38 = fpext float %7 to double
  %39 = fadd contract double %38, -9.000000e-01
  %40 = fmul contract double %39, 5.000000e-01
  %41 = fsub contract double %37, %40
  %42 = fptrunc double %41 to float
  %43 = fadd contract double %40, %37
  %44 = fptrunc double %43 to float
  br label %45

45:                                               ; preds = %34, %17
  %46 = phi float [ %44, %34 ], [ %28, %17 ]
  %47 = phi float [ %42, %34 ], [ %24, %17 ]
  store float %47, float addrspace(1)* %21, align 4, !tbaa !5
  store float %46, float addrspace(1)* %25, align 4, !tbaa !5
  br label %80

48:                                               ; preds = %15
  %49 = sub nsw i32 %12, %4
  %50 = fsub contract float 1.000000e+00, %6
  %51 = fadd contract float %6, -1.000000e+00
  %52 = sext i32 %49 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = tail call float @llvm.minnum.f32(float %51, float %54)
  %56 = tail call float @llvm.maxnum.f32(float %50, float %55)
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = tail call float @llvm.minnum.f32(float %51, float %58)
  %60 = tail call float @llvm.maxnum.f32(float %50, float %59)
  %61 = fadd contract float %56, %7
  %62 = fpext float %61 to double
  %63 = fadd contract double %62, 0xBFEFAE147AE147AE
  %64 = fpext float %60 to double
  %65 = fcmp contract ogt double %63, %64
  br i1 %65, label %66, label %77

66:                                               ; preds = %48
  %67 = fadd contract float %56, %60
  %68 = fmul contract float %67, 5.000000e-01
  %69 = fpext float %68 to double
  %70 = fpext float %7 to double
  %71 = fadd contract double %70, -9.000000e-01
  %72 = fmul contract double %71, 5.000000e-01
  %73 = fsub contract double %69, %72
  %74 = fptrunc double %73 to float
  %75 = fadd contract double %72, %69
  %76 = fptrunc double %75 to float
  br label %77

77:                                               ; preds = %66, %48
  %78 = phi float [ %76, %66 ], [ %60, %48 ]
  %79 = phi float [ %74, %66 ], [ %56, %48 ]
  store float %79, float addrspace(1)* %53, align 4, !tbaa !5
  store float %78, float addrspace(1)* %57, align 4, !tbaa !5
  br label %80

80:                                               ; preds = %45, %77, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!9 = !{}
