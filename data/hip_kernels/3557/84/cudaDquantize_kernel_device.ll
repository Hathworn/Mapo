; ModuleID = '../data/hip_kernels/3557/84/main.cu'
source_filename = "../data/hip_kernels/3557/84/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20cudaDquantize_kernelPdS_jddjb(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, double %3, double %4, i32 %5, i1 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = udiv i32 %16, %13
  %21 = mul i32 %20, %13
  %22 = icmp ugt i32 %16, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %13
  %26 = icmp ugt i32 %5, 1
  br i1 %26, label %29, label %27

27:                                               ; preds = %7
  %28 = icmp ult i32 %19, %2
  br i1 %28, label %55, label %65

29:                                               ; preds = %7
  %30 = fsub contract double %4, %3
  %31 = add i32 %5, -1
  %32 = uitofp i32 %31 to double
  %33 = fdiv contract double %30, %32
  %34 = icmp ult i32 %19, %2
  br i1 %34, label %35, label %65

35:                                               ; preds = %29, %35
  %36 = phi i32 [ %53, %35 ], [ %19, %29 ]
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %0, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !16
  %40 = fcmp contract olt double %39, %3
  %41 = fcmp contract ogt double %39, %4
  %42 = select contract i1 %41, double %4, double %39
  %43 = select contract i1 %40, double %3, double %42
  %44 = fsub contract double %43, %3
  %45 = fdiv contract double %44, %33
  %46 = tail call double @llvm.round.f64(double %45)
  %47 = select i1 %6, double %45, double %46
  %48 = fptosi double %47 to i32
  %49 = sitofp i32 %48 to double
  %50 = fmul contract double %33, %49
  %51 = fadd contract double %50, %3
  %52 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  store double %51, double addrspace(1)* %52, align 8
  %53 = add i32 %36, %25
  %54 = icmp ult i32 %53, %2
  br i1 %54, label %35, label %65, !llvm.loop !20

55:                                               ; preds = %27, %55
  %56 = phi i32 [ %63, %55 ], [ %19, %27 ]
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !16
  %60 = fcmp contract oge double %59, 0.000000e+00
  %61 = select contract i1 %60, double 1.000000e+00, double -1.000000e+00
  %62 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  store double %61, double addrspace(1)* %62, align 8, !tbaa !16
  %63 = add i32 %56, %25
  %64 = icmp ult i32 %63, %2
  br i1 %64, label %55, label %65, !llvm.loop !22

65:                                               ; preds = %55, %35, %27, %29
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.round.f64(double) #1

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
