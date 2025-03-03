; ModuleID = '../data/hip_kernels/5587/71/main.cu'
source_filename = "../data/hip_kernels/5587/71/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16computeScoreListPiS_iPddS0_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readnone %1, i32 %2, double addrspace(1)* nocapture readonly %3, double %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
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
  %19 = udiv i32 %16, %13
  %20 = mul i32 %19, %13
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %13
  %25 = icmp slt i32 %18, %2
  br i1 %25, label %26, label %28

26:                                               ; preds = %6
  %27 = fneg contract double %4
  br label %29

28:                                               ; preds = %39, %6
  ret void

29:                                               ; preds = %26, %39
  %30 = phi i32 [ %18, %26 ], [ %42, %39 ]
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !16, !amdgpu.noclobber !6
  %34 = add nsw i32 %30, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !6
  %38 = icmp slt i32 %33, %37
  br i1 %38, label %44, label %39

39:                                               ; preds = %44, %29
  %40 = phi double [ 0.000000e+00, %29 ], [ %57, %44 ]
  %41 = getelementptr inbounds double, double addrspace(1)* %5, i64 %31
  store double %40, double addrspace(1)* %41, align 8, !tbaa !20
  %42 = add nsw i32 %30, %24
  %43 = icmp slt i32 %42, %2
  br i1 %43, label %29, label %28, !llvm.loop !22

44:                                               ; preds = %29, %44
  %45 = phi i32 [ %58, %44 ], [ %33, %29 ]
  %46 = phi double [ %57, %44 ], [ 0.000000e+00, %29 ]
  %47 = sext i32 %45 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %3, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !20
  %50 = fcmp contract ogt double %49, 1.000000e+00
  %51 = fcmp contract olt double %49, 0.000000e+00
  %52 = or i1 %50, %51
  %53 = fcmp contract uno double %49, 0.000000e+00
  %54 = or i1 %53, %52
  %55 = fmul contract double %49, %27
  %56 = select contract i1 %54, double 0.000000e+00, double %55
  %57 = fadd contract double %46, %56
  %58 = add nsw i32 %45, 1
  %59 = icmp slt i32 %58, %37
  br i1 %59, label %44, label %39, !llvm.loop !24
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
!21 = !{!"double", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
