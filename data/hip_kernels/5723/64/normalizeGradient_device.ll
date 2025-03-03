; ModuleID = '../data/hip_kernels/5723/64/main.cu'
source_filename = "../data/hip_kernels/5723/64/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17normalizeGradientPfPiii(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %83

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = mul nsw i32 %3, 6
  %20 = add nsw i32 %18, %19
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !11, !amdgpu.noclobber !6
  %24 = fcmp contract ogt float %23, 0.000000e+00
  br i1 %24, label %25, label %48

25:                                               ; preds = %15
  %26 = fcmp olt float %23, 0x39F0000000000000
  %27 = select i1 %26, float 0x41F0000000000000, float 1.000000e+00
  %28 = fmul float %23, %27
  %29 = tail call float @llvm.sqrt.f32(float %28)
  %30 = bitcast float %29 to i32
  %31 = add nsw i32 %30, -1
  %32 = bitcast i32 %31 to float
  %33 = add nsw i32 %30, 1
  %34 = bitcast i32 %33 to float
  %35 = tail call i1 @llvm.amdgcn.class.f32(float %28, i32 608)
  %36 = select i1 %26, float 0x3EF0000000000000, float 1.000000e+00
  %37 = fneg float %34
  %38 = tail call float @llvm.fma.f32(float %37, float %29, float %28)
  %39 = fcmp ogt float %38, 0.000000e+00
  %40 = fneg float %32
  %41 = tail call float @llvm.fma.f32(float %40, float %29, float %28)
  %42 = fcmp ole float %41, 0.000000e+00
  %43 = select i1 %42, float %32, float %29
  %44 = select i1 %39, float %34, float %43
  %45 = fmul float %36, %44
  %46 = select i1 %35, float %28, float %45
  %47 = fdiv contract float 1.000000e+00, %46
  br label %48

48:                                               ; preds = %25, %15
  %49 = phi float [ %47, %25 ], [ %23, %15 ]
  %50 = sext i32 %18 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !11
  %53 = fmul contract float %49, %52
  store float %53, float addrspace(1)* %51, align 4, !tbaa !11
  %54 = add nsw i32 %18, %3
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !11
  %58 = fmul contract float %49, %57
  store float %58, float addrspace(1)* %56, align 4, !tbaa !11
  %59 = shl nsw i32 %3, 1
  %60 = add nsw i32 %59, %18
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !11
  %64 = fmul contract float %49, %63
  store float %64, float addrspace(1)* %62, align 4, !tbaa !11
  %65 = mul nsw i32 %3, 3
  %66 = add nsw i32 %65, %18
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !11
  %70 = fmul contract float %49, %69
  store float %70, float addrspace(1)* %68, align 4, !tbaa !11
  %71 = shl nsw i32 %3, 2
  %72 = add nsw i32 %71, %18
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !11
  %76 = fmul contract float %49, %75
  store float %76, float addrspace(1)* %74, align 4, !tbaa !11
  %77 = mul nsw i32 %3, 5
  %78 = add nsw i32 %77, %18
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11
  %82 = fmul contract float %49, %81
  store float %82, float addrspace(1)* %80, align 4, !tbaa !11
  br label %83

83:                                               ; preds = %48, %4
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
