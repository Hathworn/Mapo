; ModuleID = '../data/hip_kernels/10552/90/main.cu'
source_filename = "../data/hip_kernels/10552/90/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9_logpforwiiPf(i32 %0, i32 %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = mul i32 %5, %10
  %15 = add i32 %14, %4
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %91

17:                                               ; preds = %3
  %18 = udiv i32 %13, %10
  %19 = mul i32 %18, %10
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %10
  %24 = icmp sgt i32 %0, 0
  br label %25

25:                                               ; preds = %17, %80
  %26 = phi i32 [ %15, %17 ], [ %81, %80 ]
  %27 = mul nsw i32 %26, %0
  %28 = add nsw i32 %27, %0
  br i1 %24, label %31, label %29

29:                                               ; preds = %31, %25
  %30 = phi float [ 0xFFF0000000000000, %25 ], [ %38, %31 ]
  br i1 %24, label %56, label %41

31:                                               ; preds = %25, %31
  %32 = phi i32 [ %39, %31 ], [ %27, %25 ]
  %33 = phi float [ %38, %31 ], [ 0xFFF0000000000000, %25 ]
  %34 = sext i32 %32 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = fcmp contract ogt float %36, %33
  %38 = select i1 %37, float %36, float %33
  %39 = add nsw i32 %32, 1
  %40 = icmp slt i32 %39, %28
  br i1 %40, label %31, label %29, !llvm.loop !20

41:                                               ; preds = %56, %29
  %42 = phi float [ 0.000000e+00, %29 ], [ %77, %56 ]
  %43 = tail call i1 @llvm.amdgcn.class.f32(float %42, i32 144)
  %44 = select i1 %43, float 0x41F0000000000000, float 1.000000e+00
  %45 = fmul float %42, %44
  %46 = tail call float @llvm.log2.f32(float %45)
  %47 = fmul float %46, 0x3FE62E42E0000000
  %48 = tail call i1 @llvm.amdgcn.class.f32(float %46, i32 519)
  %49 = fneg float %47
  %50 = tail call float @llvm.fma.f32(float %46, float 0x3FE62E42E0000000, float %49)
  %51 = tail call float @llvm.fma.f32(float %46, float 0x3E6EFA39E0000000, float %50)
  %52 = fadd float %47, %51
  %53 = select i1 %48, float %46, float %52
  %54 = select i1 %43, float 0x40362E4300000000, float 0.000000e+00
  %55 = fsub float %53, %54
  br i1 %24, label %83, label %80

56:                                               ; preds = %29, %56
  %57 = phi i32 [ %78, %56 ], [ %27, %29 ]
  %58 = phi float [ %77, %56 ], [ 0.000000e+00, %29 ]
  %59 = sext i32 %57 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16
  %62 = fsub contract float %61, %30
  store float %62, float addrspace(1)* %60, align 4, !tbaa !16
  %63 = fmul float %62, 0x3FF7154760000000
  %64 = tail call float @llvm.rint.f32(float %63)
  %65 = fcmp ogt float %62, 0x40562E4300000000
  %66 = fcmp olt float %62, 0xC059D1DA00000000
  %67 = fneg float %63
  %68 = tail call float @llvm.fma.f32(float %62, float 0x3FF7154760000000, float %67)
  %69 = tail call float @llvm.fma.f32(float %62, float 0x3E54AE0BE0000000, float %68)
  %70 = fsub float %63, %64
  %71 = fadd float %69, %70
  %72 = tail call float @llvm.exp2.f32(float %71)
  %73 = fptosi float %64 to i32
  %74 = tail call float @llvm.amdgcn.ldexp.f32(float %72, i32 %73)
  %75 = select i1 %66, float 0.000000e+00, float %74
  %76 = select i1 %65, float 0x7FF0000000000000, float %75
  %77 = fadd contract float %58, %76
  %78 = add nsw i32 %57, 1
  %79 = icmp slt i32 %78, %28
  br i1 %79, label %56, label %41, !llvm.loop !22

80:                                               ; preds = %83, %41
  %81 = add i32 %23, %26
  %82 = icmp slt i32 %81, %1
  br i1 %82, label %25, label %91, !llvm.loop !23

83:                                               ; preds = %41, %83
  %84 = phi i32 [ %89, %83 ], [ %27, %41 ]
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16
  %88 = fsub contract float %87, %55
  store float %88, float addrspace(1)* %86, align 4, !tbaa !16
  %89 = add nsw i32 %84, 1
  %90 = icmp slt i32 %89, %28
  br i1 %90, label %83, label %80, !llvm.loop !24

91:                                               ; preds = %80, %3
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

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
