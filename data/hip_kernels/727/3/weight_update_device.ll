; ModuleID = '../data/hip_kernels/727/3/main.cu'
source_filename = "../data/hip_kernels/727/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13weight_updatePiPbPfS1_S_m(i32 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = mul i32 %8, %13
  %18 = add i32 %17, %7
  %19 = sext i32 %18 to i64
  %20 = icmp ult i64 %19, %5
  br i1 %20, label %21, label %52

21:                                               ; preds = %6
  %22 = udiv i32 %16, %13
  %23 = mul i32 %22, %13
  %24 = icmp ugt i32 %16, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %13
  br label %28

28:                                               ; preds = %21, %48
  %29 = phi i64 [ %19, %21 ], [ %50, %48 ]
  %30 = trunc i64 %29 to i32
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %29
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !6
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !6
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !20, !range !22, !amdgpu.noclobber !6
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %48, label %40

40:                                               ; preds = %28
  %41 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !23
  %43 = fcmp contract une float %42, 1.000000e+00
  br i1 %43, label %44, label %48

44:                                               ; preds = %40
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !23
  %47 = fdiv contract float %46, %42
  store float %47, float addrspace(1)* %45, align 4, !tbaa !23
  br label %48

48:                                               ; preds = %40, %44, %28
  %49 = add i32 %27, %30
  %50 = sext i32 %49 to i64
  %51 = icmp ult i64 %50, %5
  br i1 %51, label %28, label %52, !llvm.loop !25

52:                                               ; preds = %48, %6
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"bool", !18, i64 0}
!22 = !{i8 0, i8 2}
!23 = !{!24, !24, i64 0}
!24 = !{!"float", !18, i64 0}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.mustprogress"}
