; ModuleID = '../data/hip_kernels/1240/4/main.cu'
source_filename = "../data/hip_kernels/1240/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13correctBoundsPdS_iS_ddS_S_iii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, double addrspace(1)* nocapture writeonly %3, double %4, double %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !6
  %21 = mul i32 %12, %17
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = udiv i32 %20, %17
  %25 = mul i32 %24, %17
  %26 = icmp ugt i32 %20, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %17
  %30 = icmp slt i32 %23, %2
  br i1 %30, label %31, label %33

31:                                               ; preds = %11
  %32 = mul nsw i32 %10, %2
  br label %34

33:                                               ; preds = %51, %11
  ret void

34:                                               ; preds = %31, %51
  %35 = phi i32 [ %23, %31 ], [ %62, %51 ]
  %36 = mul nsw i32 %35, %8
  %37 = add nsw i32 %36, %9
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %7, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !16
  %41 = sext i32 %35 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %0, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !16
  %44 = fcmp contract ogt double %40, %43
  br i1 %44, label %49, label %45

45:                                               ; preds = %34
  %46 = getelementptr inbounds double, double addrspace(1)* %1, i64 %41
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !16
  %48 = fcmp contract olt double %40, %47
  br i1 %48, label %49, label %51

49:                                               ; preds = %45, %34
  %50 = phi double [ %43, %34 ], [ %47, %45 ]
  store double %50, double addrspace(1)* %39, align 8, !tbaa !16
  br label %51

51:                                               ; preds = %49, %45
  %52 = phi double [ %40, %45 ], [ %50, %49 ]
  %53 = add nsw i32 %35, %32
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %3, i64 %54
  store double %52, double addrspace(1)* %55, align 8, !tbaa !16
  %56 = getelementptr inbounds double, double addrspace(1)* %6, i64 %54
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !16
  %58 = fmul contract double %57, %4
  %59 = load double, double addrspace(1)* %39, align 8, !tbaa !16
  %60 = fmul contract double %59, %5
  %61 = fadd contract double %58, %60
  store double %61, double addrspace(1)* %56, align 8, !tbaa !16
  %62 = add nsw i32 %35, %29
  %63 = icmp slt i32 %62, %2
  br i1 %63, label %34, label %33, !llvm.loop !20
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
