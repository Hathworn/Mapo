; ModuleID = '../data/hip_kernels/8192/303/main.cu'
source_filename = "../data/hip_kernels/8192/303/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19OFConvert2AngleSizePfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %3, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !6
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = udiv i32 %10, %7
  %14 = mul i32 %13, %7
  %15 = icmp ugt i32 %10, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = mul i32 %17, %12
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %20 = add i32 %18, %11
  %21 = mul i32 %20, %7
  %22 = add i32 %21, %19
  %23 = icmp slt i32 %22, %1
  br i1 %23, label %24, label %89

24:                                               ; preds = %2
  %25 = sext i32 %22 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !16, !amdgpu.noclobber !5
  %28 = add nsw i32 %22, %1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16, !amdgpu.noclobber !5
  %32 = fadd contract float %27, %31
  %33 = fmul contract float %32, %32
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
  %55 = tail call float @llvm.fabs.f32(float %31)
  %56 = tail call float @llvm.fabs.f32(float %27)
  %57 = tail call float @llvm.minnum.f32(float %55, float %56)
  %58 = tail call float @llvm.maxnum.f32(float %55, float %56)
  %59 = fdiv float %57, %58, !fpmath !20
  %60 = fmul float %59, %59
  %61 = tail call float @llvm.fmuladd.f32(float %60, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %62 = tail call float @llvm.fmuladd.f32(float %60, float %61, float 0x3FA53F67E0000000)
  %63 = tail call float @llvm.fmuladd.f32(float %60, float %62, float 0xBFB2FA9AE0000000)
  %64 = tail call float @llvm.fmuladd.f32(float %60, float %63, float 0x3FBB263640000000)
  %65 = tail call float @llvm.fmuladd.f32(float %60, float %64, float 0xBFC22C1CC0000000)
  %66 = tail call float @llvm.fmuladd.f32(float %60, float %65, float 0x3FC99717E0000000)
  %67 = tail call float @llvm.fmuladd.f32(float %60, float %66, float 0xBFD5554C40000000)
  %68 = fmul float %60, %67
  %69 = tail call float @llvm.fmuladd.f32(float %59, float %68, float %59)
  %70 = fsub float 0x3FF921FB60000000, %69
  %71 = fcmp ogt float %56, %55
  %72 = select i1 %71, float %70, float %69
  %73 = fsub float 0x400921FB60000000, %72
  %74 = fcmp olt float %31, 0.000000e+00
  %75 = select i1 %74, float %73, float %72
  %76 = bitcast float %31 to i32
  %77 = icmp slt i32 %76, 0
  %78 = select i1 %77, float 0x400921FB60000000, float 0.000000e+00
  %79 = fcmp oeq float %27, 0.000000e+00
  %80 = select i1 %79, float %78, float %75
  %81 = select i1 %74, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %82 = fcmp oeq float %55, 0x7FF0000000000000
  %83 = fcmp oeq float %56, 0x7FF0000000000000
  %84 = and i1 %83, %82
  %85 = select i1 %84, float %81, float %80
  %86 = fcmp uno float %31, %27
  %87 = select i1 %86, float 0x7FF8000000000000, float %85
  %88 = tail call float @llvm.copysign.f32(float %87, float %27)
  store float %88, float addrspace(1)* %26, align 4, !tbaa !16
  store float %54, float addrspace(1)* %30, align 4, !tbaa !16
  br label %89

89:                                               ; preds = %24, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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
!20 = !{float 2.500000e+00}
