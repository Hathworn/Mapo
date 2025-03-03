; ModuleID = '../data/hip_kernels/123/11/main.cu'
source_filename = "../data/hip_kernels/123/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22resampleFeaturesKernelPdS_S_S_S_S_S_S_iS_S_S_S_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, i32 %8, double addrspace(1)* nocapture writeonly %9, double addrspace(1)* nocapture writeonly %10, double addrspace(1)* nocapture writeonly %11, double addrspace(1)* nocapture writeonly %12, double addrspace(1)* nocapture writeonly %13, double addrspace(1)* nocapture writeonly %14) local_unnamed_addr #0 {
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !6
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = icmp slt i32 %24, %8
  br i1 %25, label %26, label %36

26:                                               ; preds = %15
  %27 = uitofp i16 %19 to double
  %28 = fdiv contract double 1.000000e+00, %27
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %30 = uitofp i32 %29 to double
  %31 = fmul contract double %28, %30
  %32 = udiv i32 %23, %20
  %33 = mul i32 %32, %20
  %34 = icmp ugt i32 %23, %33
  %35 = zext i1 %34 to i32
  br label %37

36:                                               ; preds = %59, %15
  ret void

37:                                               ; preds = %26, %59
  %38 = phi i32 [ %24, %26 ], [ %82, %59 ]
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %7, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16
  %42 = fadd contract double %31, %41
  %43 = mul i32 %38, %20
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %6, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !16
  %47 = add nsw i32 %43, %20
  br label %48

48:                                               ; preds = %52, %37
  %49 = phi double [ %46, %37 ], [ %57, %52 ]
  %50 = phi i32 [ %43, %37 ], [ %53, %52 ]
  %51 = fcmp contract ogt double %42, %49
  br i1 %51, label %52, label %59

52:                                               ; preds = %48
  %53 = add nsw i32 %50, 1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %6, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !16
  %57 = fadd contract double %49, %56
  %58 = icmp eq i32 %53, %47
  br i1 %58, label %59, label %48, !llvm.loop !20

59:                                               ; preds = %52, %48
  %60 = add i32 %43, %29
  %61 = sext i32 %50 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %0, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !16
  %64 = sext i32 %60 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %9, i64 %64
  store double %63, double addrspace(1)* %65, align 8, !tbaa !16
  %66 = getelementptr inbounds double, double addrspace(1)* %1, i64 %61
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !16
  %68 = getelementptr inbounds double, double addrspace(1)* %10, i64 %64
  store double %67, double addrspace(1)* %68, align 8, !tbaa !16
  %69 = getelementptr inbounds double, double addrspace(1)* %2, i64 %61
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !16
  %71 = getelementptr inbounds double, double addrspace(1)* %11, i64 %64
  store double %70, double addrspace(1)* %71, align 8, !tbaa !16
  %72 = getelementptr inbounds double, double addrspace(1)* %3, i64 %61
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !16
  %74 = getelementptr inbounds double, double addrspace(1)* %12, i64 %64
  store double %73, double addrspace(1)* %74, align 8, !tbaa !16
  %75 = getelementptr inbounds double, double addrspace(1)* %4, i64 %61
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !16
  %77 = getelementptr inbounds double, double addrspace(1)* %13, i64 %64
  store double %76, double addrspace(1)* %77, align 8, !tbaa !16
  %78 = getelementptr inbounds double, double addrspace(1)* %5, i64 %61
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !16
  %80 = getelementptr inbounds double, double addrspace(1)* %14, i64 %64
  store double %79, double addrspace(1)* %80, align 8, !tbaa !16
  %81 = add i32 %32, %38
  %82 = add i32 %81, %35
  %83 = icmp slt i32 %82, %8
  br i1 %83, label %37, label %36, !llvm.loop !22
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
!22 = distinct !{!22, !21}
