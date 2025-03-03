; ModuleID = '../data/hip_kernels/11047/9/main.cu'
source_filename = "../data/hip_kernels/11047/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16kernBlockWiseSummmPdE8blockSum = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16kernBlockWiseSummmPd(i64 %0, i64 %1, double addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = mul i32 %17, %4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = add i32 %18, %19
  %21 = mul i32 %20, %12
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = zext i32 %22 to i64
  %25 = icmp ult i64 %24, %0
  br i1 %25, label %26, label %31

26:                                               ; preds = %3
  %27 = sext i32 %23 to i64
  %28 = mul i64 %27, %1
  %29 = getelementptr inbounds double, double addrspace(1)* %2, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !16, !amdgpu.noclobber !14
  br label %31

31:                                               ; preds = %3, %26
  %32 = phi double [ %30, %26 ], [ 0.000000e+00, %3 ]
  %33 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16kernBlockWiseSummmPdE8blockSum, i32 0, i32 %22
  store double %32, double addrspace(3)* %33, align 8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = lshr i32 %12, 1
  %35 = icmp ult i32 %22, %34
  br i1 %35, label %38, label %36

36:                                               ; preds = %38, %31
  %37 = icmp eq i32 %22, 0
  br i1 %37, label %47, label %52

38:                                               ; preds = %31, %38
  %39 = phi i32 [ %45, %38 ], [ %34, %31 ]
  %40 = add nsw i32 %39, %22
  %41 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16kernBlockWiseSummmPdE8blockSum, i32 0, i32 %40
  %42 = load double, double addrspace(3)* %41, align 8, !tbaa !16
  %43 = load double, double addrspace(3)* %33, align 8, !tbaa !16
  %44 = fadd contract double %42, %43
  store double %44, double addrspace(3)* %33, align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = sdiv i32 %39, 2
  %46 = icmp ult i32 %22, %45
  br i1 %46, label %38, label %36, !llvm.loop !20

47:                                               ; preds = %36
  %48 = load double, double addrspace(3)* getelementptr inbounds ([1024 x double], [1024 x double] addrspace(3)* @_ZZ16kernBlockWiseSummmPdE8blockSum, i32 0, i32 0), align 16, !tbaa !16
  %49 = sext i32 %23 to i64
  %50 = mul i64 %49, %1
  %51 = getelementptr inbounds double, double addrspace(1)* %2, i64 %50
  store double %48, double addrspace(1)* %51, align 8, !tbaa !16
  br label %52

52:                                               ; preds = %47, %36
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
