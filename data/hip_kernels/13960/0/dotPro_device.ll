; ModuleID = '../data/hip_kernels/13960/0/main.cu'
source_filename = "../data/hip_kernels/13960/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ6dotProlPdS_S_E5cache = internal unnamed_addr addrspace(3) global [256 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6dotProlPdS_S_(i64 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = zext i32 %16 to i64
  %18 = icmp slt i64 %17, %0
  br i1 %18, label %19, label %39

19:                                               ; preds = %4
  %20 = udiv i32 %13, %10
  %21 = mul i32 %20, %10
  %22 = icmp ugt i32 %13, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %10
  br label %26

26:                                               ; preds = %19, %26
  %27 = phi i64 [ %17, %19 ], [ %37, %26 ]
  %28 = phi double [ 0.000000e+00, %19 ], [ %35, %26 ]
  %29 = trunc i64 %27 to i32
  %30 = getelementptr inbounds double, double addrspace(1)* %1, i64 %27
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !16, !amdgpu.noclobber !5
  %32 = getelementptr inbounds double, double addrspace(1)* %2, i64 %27
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !16, !amdgpu.noclobber !5
  %34 = fmul contract double %31, %33
  %35 = fadd contract double %28, %34
  %36 = add i32 %25, %29
  %37 = zext i32 %36 to i64
  %38 = icmp slt i64 %37, %0
  br i1 %38, label %26, label %39, !llvm.loop !20

39:                                               ; preds = %26, %4
  %40 = phi double [ 0.000000e+00, %4 ], [ %35, %26 ]
  %41 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ6dotProlPdS_S_E5cache, i32 0, i32 %15
  store double %40, double addrspace(3)* %41, align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = icmp ult i16 %9, 2
  br i1 %42, label %55, label %43

43:                                               ; preds = %39, %53
  %44 = phi i32 [ %45, %53 ], [ %10, %39 ]
  %45 = lshr i32 %44, 1
  %46 = icmp ult i32 %15, %45
  br i1 %46, label %47, label %53

47:                                               ; preds = %43
  %48 = add nuw nsw i32 %45, %15
  %49 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ6dotProlPdS_S_E5cache, i32 0, i32 %48
  %50 = load double, double addrspace(3)* %49, align 8, !tbaa !16
  %51 = load double, double addrspace(3)* %41, align 8, !tbaa !16
  %52 = fadd contract double %50, %51
  store double %52, double addrspace(3)* %41, align 8, !tbaa !16
  br label %53

53:                                               ; preds = %47, %43
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp ult i32 %44, 4
  br i1 %54, label %55, label %43, !llvm.loop !22

55:                                               ; preds = %53, %39
  %56 = icmp eq i32 %15, 0
  br i1 %56, label %57, label %61

57:                                               ; preds = %55
  %58 = load double, double addrspace(3)* getelementptr inbounds ([256 x double], [256 x double] addrspace(3)* @_ZZ6dotProlPdS_S_E5cache, i32 0, i32 0), align 16, !tbaa !16
  %59 = zext i32 %5 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %3, i64 %59
  store double %58, double addrspace(1)* %60, align 8, !tbaa !16
  br label %61

61:                                               ; preds = %57, %55
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
