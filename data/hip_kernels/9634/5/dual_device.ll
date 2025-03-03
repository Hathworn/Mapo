; ModuleID = '../data/hip_kernels/9634/5/main.cu'
source_filename = "../data/hip_kernels/9634/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z4dualPfS_PKfddii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, double %3, double %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = mul nsw i32 %24, %5
  %26 = add nsw i32 %25, %16
  %27 = add nsw i32 %5, -1
  %28 = icmp slt i32 %16, %27
  br i1 %28, label %29, label %39

29:                                               ; preds = %7
  %30 = add nsw i32 %26, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = sext i32 %26 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = fsub contract float %33, %36
  %38 = fpext float %37 to double
  br label %39

39:                                               ; preds = %29, %7
  %40 = phi double [ %38, %29 ], [ 0.000000e+00, %7 ]
  %41 = add nsw i32 %6, -1
  %42 = icmp slt i32 %24, %41
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = sext i32 %26 to i64
  br label %55

45:                                               ; preds = %39
  %46 = add nsw i32 %26, %5
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = sext i32 %26 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fsub contract float %49, %52
  %54 = fpext float %53 to double
  br label %55

55:                                               ; preds = %43, %45
  %56 = phi i64 [ %44, %43 ], [ %50, %45 ]
  %57 = phi double [ 0.000000e+00, %43 ], [ %54, %45 ]
  %58 = fmul contract double %40, %4
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fpext float %60 to double
  %62 = fadd contract double %58, %61
  %63 = fptrunc double %62 to float
  store float %63, float addrspace(1)* %59, align 4, !tbaa !7
  %64 = fmul contract double %57, %4
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fpext float %66 to double
  %68 = fadd contract double %64, %67
  %69 = fptrunc double %68 to float
  store float %69, float addrspace(1)* %65, align 4, !tbaa !7
  %70 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %71 = fmul contract float %70, %70
  %72 = fmul contract float %69, %69
  %73 = fadd contract float %71, %72
  %74 = fcmp olt float %73, 0x39F0000000000000
  %75 = select i1 %74, float 0x41F0000000000000, float 1.000000e+00
  %76 = fmul float %73, %75
  %77 = tail call float @llvm.sqrt.f32(float %76)
  %78 = bitcast float %77 to i32
  %79 = add nsw i32 %78, -1
  %80 = bitcast i32 %79 to float
  %81 = add nsw i32 %78, 1
  %82 = bitcast i32 %81 to float
  %83 = tail call i1 @llvm.amdgcn.class.f32(float %76, i32 608)
  %84 = select i1 %74, float 0x3EF0000000000000, float 1.000000e+00
  %85 = fneg float %82
  %86 = tail call float @llvm.fma.f32(float %85, float %77, float %76)
  %87 = fcmp ogt float %86, 0.000000e+00
  %88 = fneg float %80
  %89 = tail call float @llvm.fma.f32(float %88, float %77, float %76)
  %90 = fcmp ole float %89, 0.000000e+00
  %91 = select i1 %90, float %80, float %77
  %92 = select i1 %87, float %82, float %91
  %93 = fmul float %84, %92
  %94 = select i1 %83, float %76, float %93
  %95 = fpext float %94 to double
  %96 = fdiv contract double %95, %3
  %97 = fptrunc double %96 to float
  %98 = tail call float @llvm.maxnum.f32(float %97, float 1.000000e+00)
  %99 = fdiv contract float %70, %98
  store float %99, float addrspace(1)* %59, align 4, !tbaa !7
  %100 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %101 = fdiv contract float %100, %98
  store float %101, float addrspace(1)* %65, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
