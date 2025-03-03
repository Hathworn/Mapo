; ModuleID = '../data/hip_kernels/5587/75/main.cu'
source_filename = "../data/hip_kernels/5587/75/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15computeCovDxdPiPiS_S_iPdiddS0_S0_i(i32 addrspace(1)* nocapture readnone %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, double addrspace(1)* nocapture readonly %4, i32 %5, double %6, double %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture writeonly %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = udiv i32 %19, %16
  %21 = mul i32 %20, %16
  %22 = icmp ugt i32 %19, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %16
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %28 = icmp slt i32 %26, 3
  %29 = icmp slt i32 %27, 6
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %95

31:                                               ; preds = %11
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %33 = mul i32 %32, %16
  %34 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %35 = add i32 %33, %34
  %36 = mul nsw i32 %26, 3
  %37 = mul nsw i32 %36, %5
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %4, i64 %38
  %40 = sext i32 %5 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %39, i64 %40
  %42 = getelementptr inbounds double, double addrspace(1)* %41, i64 %40
  %43 = mul nsw i32 %26, 6
  %44 = add nsw i32 %43, %27
  %45 = mul nsw i32 %44, %10
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %9, i64 %46
  %48 = mul nsw i32 %27, %3
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %8, i64 %49
  %51 = mul nsw i32 %3, 6
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %50, i64 %52
  %54 = getelementptr inbounds double, double addrspace(1)* %53, i64 %52
  %55 = icmp slt i32 %35, %3
  br i1 %55, label %56, label %95

56:                                               ; preds = %31, %72
  %57 = phi i32 [ %73, %72 ], [ %35, %31 ]
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %50, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !16
  %61 = getelementptr inbounds double, double addrspace(1)* %53, i64 %58
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !16
  %63 = getelementptr inbounds double, double addrspace(1)* %54, i64 %58
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !16
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !20, !amdgpu.noclobber !5
  %67 = add nsw i32 %57, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !20, !amdgpu.noclobber !5
  %71 = icmp slt i32 %66, %70
  br i1 %71, label %75, label %72

72:                                               ; preds = %75, %56
  %73 = add nsw i32 %57, %25
  %74 = icmp slt i32 %73, %3
  br i1 %74, label %56, label %95, !llvm.loop !22

75:                                               ; preds = %56, %75
  %76 = phi i32 [ %93, %75 ], [ %66, %56 ]
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !20, !amdgpu.noclobber !5
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %39, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !16
  %83 = fmul contract double %60, %82
  %84 = getelementptr inbounds double, double addrspace(1)* %41, i64 %80
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !16
  %86 = fmul contract double %62, %85
  %87 = fadd contract double %83, %86
  %88 = getelementptr inbounds double, double addrspace(1)* %42, i64 %80
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !16
  %90 = fmul contract double %64, %89
  %91 = fadd contract double %87, %90
  %92 = getelementptr inbounds double, double addrspace(1)* %47, i64 %77
  store double %91, double addrspace(1)* %92, align 8, !tbaa !16
  %93 = add nsw i32 %76, 1
  %94 = icmp slt i32 %93, %70
  br i1 %94, label %75, label %72, !llvm.loop !24

95:                                               ; preds = %72, %31, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
