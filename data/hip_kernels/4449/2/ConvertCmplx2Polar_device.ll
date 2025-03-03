; ModuleID = '../data/hip_kernels/4449/2/main.cu'
source_filename = "../data/hip_kernels/4449/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18ConvertCmplx2PolarPfS_S_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %10
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %10
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %15, %22
  %24 = icmp slt i32 %23, %4
  br i1 %24, label %26, label %25

25:                                               ; preds = %26, %5
  ret void

26:                                               ; preds = %5, %26
  %27 = phi i32 [ %108, %26 ], [ %23, %5 ]
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %33 = tail call float @llvm.fabs.f32(float %32)
  %34 = tail call float @llvm.fabs.f32(float %30)
  %35 = tail call float @llvm.minnum.f32(float %33, float %34)
  %36 = tail call float @llvm.maxnum.f32(float %33, float %34)
  %37 = fdiv float %35, %36, !fpmath !20
  %38 = fmul float %37, %37
  %39 = tail call float @llvm.fmuladd.f32(float %38, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %40 = tail call float @llvm.fmuladd.f32(float %38, float %39, float 0x3FA53F67E0000000)
  %41 = tail call float @llvm.fmuladd.f32(float %38, float %40, float 0xBFB2FA9AE0000000)
  %42 = tail call float @llvm.fmuladd.f32(float %38, float %41, float 0x3FBB263640000000)
  %43 = tail call float @llvm.fmuladd.f32(float %38, float %42, float 0xBFC22C1CC0000000)
  %44 = tail call float @llvm.fmuladd.f32(float %38, float %43, float 0x3FC99717E0000000)
  %45 = tail call float @llvm.fmuladd.f32(float %38, float %44, float 0xBFD5554C40000000)
  %46 = fmul float %38, %45
  %47 = tail call float @llvm.fmuladd.f32(float %37, float %46, float %37)
  %48 = fsub float 0x3FF921FB60000000, %47
  %49 = fcmp ogt float %34, %33
  %50 = select i1 %49, float %48, float %47
  %51 = fsub float 0x400921FB60000000, %50
  %52 = fcmp olt float %32, 0.000000e+00
  %53 = select i1 %52, float %51, float %50
  %54 = bitcast float %32 to i32
  %55 = icmp slt i32 %54, 0
  %56 = select i1 %55, float 0x400921FB60000000, float 0.000000e+00
  %57 = fcmp oeq float %30, 0.000000e+00
  %58 = select i1 %57, float %56, float %53
  %59 = select i1 %52, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %60 = fcmp oeq float %33, 0x7FF0000000000000
  %61 = fcmp oeq float %34, 0x7FF0000000000000
  %62 = and i1 %61, %60
  %63 = select i1 %62, float %59, float %58
  %64 = fcmp uno float %32, %30
  %65 = select i1 %64, float 0x7FF8000000000000, float %63
  %66 = tail call float @llvm.copysign.f32(float %65, float %30)
  %67 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  store float %66, float addrspace(1)* %67, align 4, !tbaa !16
  %68 = load float, float addrspace(1)* %29, align 4, !tbaa !16
  %69 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %70 = tail call float @llvm.fabs.f32(float %68)
  %71 = tail call float @llvm.fabs.f32(float %69)
  %72 = fcmp contract ogt float %70, %71
  %73 = select i1 %72, float %70, float %71
  %74 = select i1 %72, float %71, float %70
  %75 = fdiv contract float %74, %73
  %76 = fmul contract float %75, %75
  %77 = fadd contract float %76, 1.000000e+00
  %78 = fcmp olt float %77, 0x39F0000000000000
  %79 = select i1 %78, float 0x41F0000000000000, float 1.000000e+00
  %80 = fmul float %77, %79
  %81 = tail call float @llvm.sqrt.f32(float %80)
  %82 = bitcast float %81 to i32
  %83 = add nsw i32 %82, -1
  %84 = bitcast i32 %83 to float
  %85 = add nsw i32 %82, 1
  %86 = bitcast i32 %85 to float
  %87 = tail call i1 @llvm.amdgcn.class.f32(float %80, i32 608)
  %88 = select i1 %78, float 0x3EF0000000000000, float 1.000000e+00
  %89 = fneg float %86
  %90 = tail call float @llvm.fma.f32(float %89, float %81, float %80)
  %91 = fcmp ogt float %90, 0.000000e+00
  %92 = fneg float %84
  %93 = tail call float @llvm.fma.f32(float %92, float %81, float %80)
  %94 = fcmp ole float %93, 0.000000e+00
  %95 = select i1 %94, float %84, float %81
  %96 = select i1 %91, float %86, float %95
  %97 = fmul float %88, %96
  %98 = select i1 %87, float %80, float %97
  %99 = fmul contract float %73, %98
  %100 = fcmp contract oeq float %73, 0.000000e+00
  %101 = fcmp contract ogt float %73, 0x47EFFFFFE0000000
  %102 = or i1 %100, %101
  %103 = fcmp contract ogt float %74, 0x47EFFFFFE0000000
  %104 = select i1 %102, i1 true, i1 %103
  %105 = fadd contract float %73, %74
  %106 = select i1 %104, float %105, float %99
  %107 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  store float %106, float addrspace(1)* %107, align 4, !tbaa !16
  %108 = add nsw i32 %27, %21
  %109 = icmp slt i32 %108, %4
  br i1 %109, label %26, label %25, !llvm.loop !21
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
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
