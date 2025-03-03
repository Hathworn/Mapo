; ModuleID = '../data/hip_kernels/335/13/main.cu'
source_filename = "../data/hip_kernels/335/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z38update_presynaptic_activities_C_kernelPfS_Pbffmff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, float %3, float %4, i64 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !7
  %19 = mul i32 %10, %15
  %20 = add i32 %19, %9
  %21 = sext i32 %20 to i64
  %22 = icmp ult i64 %21, %5
  br i1 %22, label %23, label %56

23:                                               ; preds = %8
  %24 = fdiv contract float %3, %7
  %25 = fsub contract float 1.000000e+00, %24
  %26 = fmul contract float %3, %6
  %27 = udiv i32 %18, %15
  %28 = mul i32 %27, %15
  %29 = icmp ugt i32 %18, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %15
  br label %33

33:                                               ; preds = %23, %52
  %34 = phi i64 [ %21, %23 ], [ %54, %52 ]
  %35 = trunc i64 %34 to i32
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %34
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !16, !range !20, !amdgpu.noclobber !6
  %38 = icmp eq i8 %37, 0
  br i1 %38, label %52, label %39

39:                                               ; preds = %33
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !21
  %42 = fmul contract float %25, %41
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !21
  %45 = fcmp contract oeq float %44, %4
  %46 = fsub contract float 1.000000e+00, %41
  %47 = fmul contract float %26, %46
  %48 = select i1 %45, float %47, float -0.000000e+00
  %49 = fadd contract float %42, %48
  %50 = fcmp contract une float %41, %49
  br i1 %50, label %51, label %52

51:                                               ; preds = %39
  store float %49, float addrspace(1)* %40, align 4, !tbaa !21
  br label %52

52:                                               ; preds = %39, %51, %33
  %53 = add i32 %32, %35
  %54 = sext i32 %53 to i64
  %55 = icmp ult i64 %54, %5
  br i1 %55, label %33, label %56, !llvm.loop !23

56:                                               ; preds = %52, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!17 = !{!"bool", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{i8 0, i8 2}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !18, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
