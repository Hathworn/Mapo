; ModuleID = '../data/hip_kernels/727/16/main.cu'
source_filename = "../data/hip_kernels/727/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z59conductance_calculate_postsynaptic_current_injection_kernelPfS_iPiS_S_S_fm(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture readnone %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture readonly %6, float %7, i64 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !7
  %20 = mul i32 %11, %16
  %21 = add i32 %20, %10
  %22 = sext i32 %21 to i64
  %23 = icmp ult i64 %22, %8
  br i1 %23, label %24, label %104

24:                                               ; preds = %9
  %25 = icmp sgt i32 %2, 0
  %26 = fneg contract float %7
  %27 = udiv i32 %19, %16
  %28 = mul i32 %27, %16
  %29 = icmp ugt i32 %19, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %16
  %33 = icmp eq i32 %2, 1
  br label %34

34:                                               ; preds = %24, %66
  %35 = phi float [ undef, %24 ], [ %67, %66 ]
  %36 = phi i64 [ %22, %24 ], [ %69, %66 ]
  %37 = trunc i64 %36 to i32
  %38 = getelementptr inbounds float, float addrspace(1)* %6, i64 %36
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  br i1 %25, label %40, label %66

40:                                               ; preds = %34
  %41 = getelementptr inbounds float, float addrspace(1)* %5, i64 %36
  store float 0.000000e+00, float addrspace(1)* %41, align 4, !tbaa !16
  %42 = getelementptr inbounds float, float addrspace(1)* %4, i64 %36
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16
  %44 = load float, float addrspace(1)* %0, align 4, !tbaa !16
  %45 = fdiv contract float %26, %44
  %46 = fmul float %45, 0x3FF7154760000000
  %47 = tail call float @llvm.rint.f32(float %46)
  %48 = fcmp ogt float %45, 0x40562E4300000000
  %49 = fcmp olt float %45, 0xC059D1DA00000000
  %50 = fneg float %46
  %51 = tail call float @llvm.fma.f32(float %45, float 0x3FF7154760000000, float %50)
  %52 = tail call float @llvm.fma.f32(float %45, float 0x3E54AE0BE0000000, float %51)
  %53 = fsub float %46, %47
  %54 = fadd float %52, %53
  %55 = tail call float @llvm.exp2.f32(float %54)
  %56 = fptosi float %47 to i32
  %57 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 %56)
  %58 = select i1 %49, float 0.000000e+00, float %57
  %59 = select i1 %48, float 0x7FF0000000000000, float %58
  %60 = fmul contract float %43, %59
  store float %60, float addrspace(1)* %42, align 4, !tbaa !16
  %61 = load float, float addrspace(1)* %1, align 4, !tbaa !16
  %62 = fsub contract float %61, %39
  %63 = fmul contract float %62, %60
  %64 = load float, float addrspace(1)* %41, align 4, !tbaa !16
  %65 = fadd contract float %64, %63
  store float %65, float addrspace(1)* %41, align 4, !tbaa !16
  br i1 %33, label %66, label %71

66:                                               ; preds = %71, %40, %34
  %67 = phi float [ %35, %34 ], [ %35, %40 ], [ %75, %71 ]
  %68 = add i32 %32, %37
  %69 = sext i32 %68 to i64
  %70 = icmp ult i64 %69, %8
  br i1 %70, label %34, label %104, !llvm.loop !20

71:                                               ; preds = %40, %71
  %72 = phi i32 [ %102, %71 ], [ 1, %40 ]
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %76 = mul i64 %73, %8
  %77 = add i64 %76, %36
  %78 = getelementptr inbounds float, float addrspace(1)* %4, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fdiv contract float %26, %75
  %81 = fmul float %80, 0x3FF7154760000000
  %82 = tail call float @llvm.rint.f32(float %81)
  %83 = fcmp ogt float %80, 0x40562E4300000000
  %84 = fcmp olt float %80, 0xC059D1DA00000000
  %85 = fneg float %81
  %86 = tail call float @llvm.fma.f32(float %80, float 0x3FF7154760000000, float %85)
  %87 = tail call float @llvm.fma.f32(float %80, float 0x3E54AE0BE0000000, float %86)
  %88 = fsub float %81, %82
  %89 = fadd float %87, %88
  %90 = tail call float @llvm.exp2.f32(float %89)
  %91 = fptosi float %82 to i32
  %92 = tail call float @llvm.amdgcn.ldexp.f32(float %90, i32 %91)
  %93 = select i1 %84, float 0.000000e+00, float %92
  %94 = select i1 %83, float 0x7FF0000000000000, float %93
  %95 = fmul contract float %79, %94
  store float %95, float addrspace(1)* %78, align 4, !tbaa !16
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = fsub contract float %97, %39
  %99 = fmul contract float %98, %95
  %100 = load float, float addrspace(1)* %41, align 4, !tbaa !16
  %101 = fadd contract float %100, %99
  store float %101, float addrspace(1)* %41, align 4, !tbaa !16
  %102 = add nuw nsw i32 %72, 1
  %103 = icmp eq i32 %102, %2
  br i1 %103, label %66, label %71, !llvm.loop !22

104:                                              ; preds = %66, %9
  ret void
}

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21, !23}
!23 = !{!"llvm.loop.peeled.count", i32 1}
