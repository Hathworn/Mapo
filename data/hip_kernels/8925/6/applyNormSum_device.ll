; ModuleID = '../data/hip_kernels/8925/6/main.cu'
source_filename = "../data/hip_kernels/8925/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12applyNormSumPdS_S_S_S_S_S_i(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, i32 %7) local_unnamed_addr #0 {
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
  %21 = load double, double addrspace(1)* %2, align 8, !tbaa !16, !amdgpu.noclobber !6
  %22 = load double, double addrspace(1)* %3, align 8, !tbaa !16, !amdgpu.noclobber !6
  %23 = fsub contract double %21, %22
  %24 = fmul contract double %23, %23
  %25 = load double, double addrspace(1)* %5, align 8, !tbaa !16, !amdgpu.noclobber !6
  %26 = load double, double addrspace(1)* %6, align 8, !tbaa !16, !amdgpu.noclobber !6
  %27 = fsub contract double %25, %26
  %28 = fmul contract double %27, %27
  %29 = icmp slt i32 %20, %7
  br i1 %29, label %30, label %52

30:                                               ; preds = %8
  %31 = udiv i32 %18, %15
  %32 = mul i32 %31, %15
  %33 = icmp ugt i32 %18, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %15
  br label %37

37:                                               ; preds = %30, %37
  %38 = phi i32 [ %20, %30 ], [ %50, %37 ]
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16
  %42 = fmul contract double %24, %41
  %43 = getelementptr inbounds double, double addrspace(1)* %4, i64 %39
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !16
  %45 = fmul contract double %28, %44
  %46 = fadd contract double %42, %45
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !16
  %49 = fadd contract double %48, %46
  store double %49, double addrspace(1)* %47, align 8, !tbaa !16
  %50 = add i32 %36, %38
  %51 = icmp slt i32 %50, %7
  br i1 %51, label %37, label %52, !llvm.loop !20

52:                                               ; preds = %37, %8
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
