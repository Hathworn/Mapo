; ModuleID = '../data/hip_kernels/10552/88/main.cu'
source_filename = "../data/hip_kernels/10552/88/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9_softbackiiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %18, label %84

18:                                               ; preds = %4
  %19 = sitofp i32 %1 to float
  %20 = udiv i32 %14, %11
  %21 = mul i32 %20, %11
  %22 = icmp ugt i32 %14, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  %26 = icmp sgt i32 %0, 0
  br label %27

27:                                               ; preds = %18, %69
  %28 = phi i32 [ %16, %18 ], [ %70, %69 ]
  %29 = mul nsw i32 %28, %0
  %30 = add nsw i32 %29, %0
  br i1 %26, label %33, label %31

31:                                               ; preds = %33, %27
  %32 = phi float [ 0xFFF0000000000000, %27 ], [ %40, %33 ]
  br i1 %26, label %45, label %43

33:                                               ; preds = %27, %33
  %34 = phi i32 [ %41, %33 ], [ %29, %27 ]
  %35 = phi float [ %40, %33 ], [ 0xFFF0000000000000, %27 ]
  %36 = sext i32 %34 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %39 = fcmp contract ogt float %38, %35
  %40 = select i1 %39, float %38, float %35
  %41 = add nsw i32 %34, 1
  %42 = icmp slt i32 %41, %30
  br i1 %42, label %33, label %31, !llvm.loop !20

43:                                               ; preds = %45, %31
  %44 = phi float [ 0.000000e+00, %31 ], [ %66, %45 ]
  br i1 %26, label %72, label %69

45:                                               ; preds = %31, %45
  %46 = phi i32 [ %67, %45 ], [ %29, %31 ]
  %47 = phi float [ %66, %45 ], [ 0.000000e+00, %31 ]
  %48 = sext i32 %46 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = fsub contract float %50, %32
  %52 = fmul float %51, 0x3FF7154760000000
  %53 = tail call float @llvm.rint.f32(float %52)
  %54 = fcmp ogt float %51, 0x40562E4300000000
  %55 = fcmp olt float %51, 0xC059D1DA00000000
  %56 = fneg float %52
  %57 = tail call float @llvm.fma.f32(float %51, float 0x3FF7154760000000, float %56)
  %58 = tail call float @llvm.fma.f32(float %51, float 0x3E54AE0BE0000000, float %57)
  %59 = fsub float %52, %53
  %60 = fadd float %58, %59
  %61 = tail call float @llvm.exp2.f32(float %60)
  %62 = fptosi float %53 to i32
  %63 = tail call float @llvm.amdgcn.ldexp.f32(float %61, i32 %62)
  %64 = select i1 %55, float 0.000000e+00, float %63
  %65 = select i1 %54, float 0x7FF0000000000000, float %64
  store float %65, float addrspace(1)* %49, align 4, !tbaa !16
  %66 = fadd contract float %47, %65
  %67 = add nsw i32 %46, 1
  %68 = icmp slt i32 %67, %30
  br i1 %68, label %45, label %43, !llvm.loop !22

69:                                               ; preds = %72, %43
  %70 = add i32 %25, %28
  %71 = icmp slt i32 %70, %1
  br i1 %71, label %27, label %84, !llvm.loop !23

72:                                               ; preds = %43, %72
  %73 = phi i32 [ %82, %72 ], [ %29, %43 ]
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %77 = fdiv contract float %76, %44
  store float %77, float addrspace(1)* %75, align 4, !tbaa !16
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %74
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fsub contract float %77, %79
  %81 = fdiv contract float %80, %19
  store float %81, float addrspace(1)* %78, align 4, !tbaa !16
  %82 = add nsw i32 %73, 1
  %83 = icmp slt i32 %82, %30
  br i1 %83, label %72, label %69, !llvm.loop !24

84:                                               ; preds = %69, %4
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
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
