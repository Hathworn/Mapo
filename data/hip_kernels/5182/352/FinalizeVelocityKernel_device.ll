; ModuleID = '../data/hip_kernels/5182/352/main.cu'
source_filename = "../data/hip_kernels/5182/352/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22FinalizeVelocityKernelPfS_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = udiv i32 %12, %9
  %16 = mul i32 %15, %9
  %17 = icmp ugt i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %14
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %13
  %23 = mul i32 %22, %9
  %24 = add i32 %23, %21
  %25 = mul nsw i32 %3, %2
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %98

27:                                               ; preds = %4
  %28 = load float, float addrspace(1)* %1, align 4, !tbaa !16, !amdgpu.noclobber !5
  %29 = fmul contract float %28, %28
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16, !amdgpu.noclobber !5
  %32 = fmul contract float %31, %31
  %33 = fadd contract float %29, %32
  %34 = fcmp olt float %33, 0x39F0000000000000
  %35 = select i1 %34, float 0x41F0000000000000, float 1.000000e+00
  %36 = fmul float %33, %35
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
  %55 = sext i32 %24 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16, !amdgpu.noclobber !5
  %58 = fmul contract float %57, %57
  %59 = add nsw i32 %24, %25
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !5
  %63 = fmul contract float %62, %62
  %64 = fadd contract float %58, %63
  %65 = fcmp olt float %64, 0x39F0000000000000
  %66 = select i1 %65, float 0x41F0000000000000, float 1.000000e+00
  %67 = fmul float %64, %66
  %68 = tail call float @llvm.sqrt.f32(float %67)
  %69 = bitcast float %68 to i32
  %70 = add nsw i32 %69, -1
  %71 = bitcast i32 %70 to float
  %72 = add nsw i32 %69, 1
  %73 = bitcast i32 %72 to float
  %74 = tail call i1 @llvm.amdgcn.class.f32(float %67, i32 608)
  %75 = select i1 %65, float 0x3EF0000000000000, float 1.000000e+00
  %76 = fneg float %73
  %77 = tail call float @llvm.fma.f32(float %76, float %68, float %67)
  %78 = fcmp ogt float %77, 0.000000e+00
  %79 = fneg float %71
  %80 = tail call float @llvm.fma.f32(float %79, float %68, float %67)
  %81 = fcmp ole float %80, 0.000000e+00
  %82 = select i1 %81, float %71, float %68
  %83 = select i1 %78, float %73, float %82
  %84 = fmul float %75, %83
  %85 = select i1 %74, float %67, float %84
  %86 = fcmp contract ogt float %54, 0.000000e+00
  %87 = fcmp contract ogt float %85, 0.000000e+00
  %88 = select i1 %86, i1 %87, i1 false
  br i1 %88, label %89, label %98

89:                                               ; preds = %27
  %90 = fmul contract float %28, %57
  %91 = fmul contract float %31, %62
  %92 = fadd contract float %90, %91
  %93 = fmul contract float %54, %85
  %94 = fdiv contract float %92, %93
  %95 = fpext float %94 to double
  %96 = fcmp contract ogt double %95, 0x3FE6666666666666
  br i1 %96, label %97, label %98

97:                                               ; preds = %89
  store float 0.000000e+00, float addrspace(1)* %56, align 4, !tbaa !16
  store float 0.000000e+00, float addrspace(1)* %61, align 4, !tbaa !16
  br label %98

98:                                               ; preds = %27, %97, %89, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
