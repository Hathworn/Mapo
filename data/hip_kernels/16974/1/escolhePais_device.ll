; ModuleID = '../data/hip_kernels/16974/1/main.cu'
source_filename = "../data/hip_kernels/16974/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11escolhePaisjjPiPdS_(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = udiv i32 %14, %11
  %19 = mul i32 %18, %11
  %20 = icmp ugt i32 %14, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %11
  %24 = icmp ult i32 %17, %0
  br i1 %24, label %25, label %70

25:                                               ; preds = %5, %25
  %26 = phi i32 [ %68, %25 ], [ %17, %5 ]
  %27 = shl nsw i32 %26, 2
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !16
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %3, i64 %31
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !20, !amdgpu.noclobber !5
  %34 = fcmp contract olt double %33, 1.000000e+04
  %35 = select i1 %34, double %33, double 1.000000e+04
  %36 = select i1 %34, i32 %30, i32 -1
  %37 = add nuw nsw i32 %27, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !16
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %3, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !20, !amdgpu.noclobber !5
  %44 = fcmp contract olt double %43, %35
  %45 = select i1 %44, double %43, double %35
  %46 = select i1 %44, i32 %40, i32 %36
  %47 = add nuw nsw i32 %27, 2
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !16
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %3, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !20, !amdgpu.noclobber !5
  %54 = fcmp contract olt double %53, %45
  %55 = select i1 %54, double %53, double %45
  %56 = select i1 %54, i32 %50, i32 %46
  %57 = add nuw nsw i32 %27, 3
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !16
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %3, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !20, !amdgpu.noclobber !5
  %64 = fcmp contract olt double %63, %55
  %65 = select i1 %64, i32 %60, i32 %56
  %66 = sext i32 %26 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %66
  store i32 %65, i32 addrspace(1)* %67, align 4, !tbaa !16
  %68 = add nsw i32 %26, %23
  %69 = icmp ult i32 %68, %0
  br i1 %69, label %25, label %70, !llvm.loop !22

70:                                               ; preds = %25, %5
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"double", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
