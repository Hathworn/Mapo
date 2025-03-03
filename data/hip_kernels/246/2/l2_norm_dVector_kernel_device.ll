; ModuleID = '../data/hip_kernels/246/2/main.cu'
source_filename = "../data/hip_kernels/246/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22l2_norm_dVector_kernelPdS_iE12partial_sums = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22l2_norm_dVector_kernelPdS_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %17, label %34

17:                                               ; preds = %3
  %18 = udiv i32 %12, %9
  %19 = mul i32 %18, %9
  %20 = icmp ugt i32 %12, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %9
  br label %24

24:                                               ; preds = %17, %24
  %25 = phi double [ 0.000000e+00, %17 ], [ %31, %24 ]
  %26 = phi i32 [ %15, %17 ], [ %32, %24 ]
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %0, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !16, !amdgpu.noclobber !5
  %30 = fmul contract double %29, %29
  %31 = fadd contract double %25, %30
  %32 = add i32 %23, %26
  %33 = icmp slt i32 %32, %2
  br i1 %33, label %24, label %34, !llvm.loop !20

34:                                               ; preds = %24, %3
  %35 = phi double [ 0.000000e+00, %3 ], [ %31, %24 ]
  %36 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ22l2_norm_dVector_kernelPdS_iE12partial_sums, i32 0, i32 %14
  store double %35, double addrspace(3)* %36, align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp ult i16 %8, 2
  br i1 %37, label %50, label %38

38:                                               ; preds = %34, %48
  %39 = phi i32 [ %40, %48 ], [ %9, %34 ]
  %40 = lshr i32 %39, 1
  %41 = icmp ult i32 %14, %40
  br i1 %41, label %42, label %48

42:                                               ; preds = %38
  %43 = add nuw nsw i32 %40, %14
  %44 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ22l2_norm_dVector_kernelPdS_iE12partial_sums, i32 0, i32 %43
  %45 = load double, double addrspace(3)* %44, align 8, !tbaa !16
  %46 = load double, double addrspace(3)* %36, align 8, !tbaa !16
  %47 = fadd contract double %45, %46
  store double %47, double addrspace(3)* %36, align 8, !tbaa !16
  br label %48

48:                                               ; preds = %42, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ult i32 %39, 4
  br i1 %49, label %50, label %38, !llvm.loop !22

50:                                               ; preds = %48, %34
  %51 = icmp eq i32 %14, 0
  br i1 %51, label %52, label %56

52:                                               ; preds = %50
  %53 = load double, double addrspace(3)* getelementptr inbounds ([1024 x double], [1024 x double] addrspace(3)* @_ZZ22l2_norm_dVector_kernelPdS_iE12partial_sums, i32 0, i32 0), align 16, !tbaa !16
  %54 = zext i32 %4 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %1, i64 %54
  store double %53, double addrspace(1)* %55, align 8, !tbaa !16
  br label %56

56:                                               ; preds = %52, %50
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
