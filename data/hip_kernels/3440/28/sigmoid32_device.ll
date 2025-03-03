; ModuleID = '../data/hip_kernels/3440/28/main.cu'
source_filename = "../data/hip_kernels/3440/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9sigmoid32Pfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 8, !tbaa !15
  %21 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !13, !invariant.load !14
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %20, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %20, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %31 = mul i32 %29, %30
  %32 = add i32 %31, %4
  %33 = mul i32 %32, %17
  %34 = add i32 %33, %3
  %35 = getelementptr i8, i8 addrspace(4)* %5, i64 8
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 4, !range !13, !invariant.load !14
  %38 = zext i16 %37 to i32
  %39 = mul i32 %34, %38
  %40 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %41 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %43 = add i32 %39, %40
  %44 = mul i32 %43, %24
  %45 = add i32 %44, %41
  %46 = mul i32 %45, %12
  %47 = add i32 %46, %42
  %48 = icmp slt i32 %47, %1
  br i1 %48, label %49, label %102

49:                                               ; preds = %2
  %50 = sext i32 %47 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !17, !amdgpu.noclobber !14
  %53 = fneg contract float %52
  %54 = fmul float %52, 0xBFEFFFFFE0000000
  %55 = fneg float %54
  %56 = tail call float @llvm.fma.f32(float %53, float 0x3FEFFFFFE0000000, float %55)
  %57 = tail call float @llvm.fma.f32(float %53, float 0x3E5F61C600000000, float %56)
  %58 = fadd float %54, %57
  %59 = fsub float %58, %54
  %60 = fsub float %57, %59
  %61 = tail call float @llvm.fabs.f32(float %54) #3
  %62 = fcmp oeq float %61, 0x7FF0000000000000
  %63 = select i1 %62, float %54, float %58
  %64 = tail call float @llvm.fabs.f32(float %63) #3
  %65 = fcmp oeq float %64, 0x7FF0000000000000
  %66 = select i1 %65, float 0.000000e+00, float %60
  %67 = fcmp oeq float %63, 0x40562E4300000000
  %68 = select i1 %67, float 0x3EE0000000000000, float 0.000000e+00
  %69 = fsub float %63, %68
  %70 = fadd float %68, %66
  %71 = fmul float %69, 0x3FF7154760000000
  %72 = tail call float @llvm.rint.f32(float %71)
  %73 = fcmp ogt float %69, 0x40562E4300000000
  %74 = fcmp olt float %69, 0xC059D1DA00000000
  %75 = fneg float %71
  %76 = tail call float @llvm.fma.f32(float %69, float 0x3FF7154760000000, float %75)
  %77 = tail call float @llvm.fma.f32(float %69, float 0x3E54AE0BE0000000, float %76)
  %78 = fsub float %71, %72
  %79 = fadd float %77, %78
  %80 = tail call float @llvm.exp2.f32(float %79)
  %81 = fptosi float %72 to i32
  %82 = tail call float @llvm.amdgcn.ldexp.f32(float %80, i32 %81)
  %83 = select i1 %74, float 0.000000e+00, float %82
  %84 = select i1 %73, float 0x7FF0000000000000, float %83
  %85 = tail call float @llvm.fma.f32(float %84, float %70, float %84)
  %86 = tail call float @llvm.fabs.f32(float %84) #3
  %87 = fcmp oeq float %86, 0x7FF0000000000000
  %88 = select i1 %87, float %84, float %85
  %89 = tail call float @llvm.fabs.f32(float %53)
  %90 = tail call float @llvm.fabs.f32(float %88)
  %91 = fcmp oeq float %89, 0x7FF0000000000000
  %92 = bitcast float %53 to i32
  %93 = icmp sgt i32 %92, -1
  %94 = select i1 %93, float 0x7FF0000000000000, float 0.000000e+00
  %95 = select i1 %91, float %94, float %90
  %96 = fcmp uno float %52, 0.000000e+00
  %97 = fcmp oeq float %52, 0.000000e+00
  %98 = fadd contract float %95, 1.000000e+00
  %99 = fdiv contract float 1.000000e+00, %98
  %100 = select i1 %96, float 0x7FF8000000000000, float %99
  %101 = select i1 %97, float 5.000000e-01, float %100
  store float %101, float addrspace(1)* %51, align 4, !tbaa !17
  br label %102

102:                                              ; preds = %2, %49
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
