; ModuleID = '../data/hip_kernels/8925/5/main.cu'
source_filename = "../data/hip_kernels/8925/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12find_maximumPdS_iPiE5cache = internal unnamed_addr addrspace(3) global [512 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12find_maximumPdS_iPi(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i32 %2, i32 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = udiv i32 %14, %11
  %18 = mul i32 %17, %11
  %19 = icmp ugt i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %11
  %23 = icmp slt i32 %16, %2
  br i1 %23, label %24, label %38

24:                                               ; preds = %4, %24
  %25 = phi i32 [ %34, %24 ], [ %16, %4 ]
  %26 = phi float [ %32, %24 ], [ -1.000000e+09, %4 ]
  %27 = phi i32 [ %33, %24 ], [ 0, %4 ]
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !16, !amdgpu.noclobber !6
  %31 = fptrunc double %30 to float
  %32 = tail call float @llvm.maxnum.f32(float %26, float %31)
  %33 = add nsw i32 %27, %22
  %34 = add nsw i32 %16, %33
  %35 = icmp slt i32 %34, %2
  br i1 %35, label %24, label %36, !llvm.loop !20

36:                                               ; preds = %24
  %37 = fpext float %32 to double
  br label %38

38:                                               ; preds = %36, %4
  %39 = phi double [ 0xC1CDCD64FF800000, %4 ], [ %37, %36 ]
  %40 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ12find_maximumPdS_iPiE5cache, i32 0, i32 %5
  store double %39, double addrspace(3)* %40, align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ult i16 %10, 2
  br i1 %41, label %54, label %42

42:                                               ; preds = %38, %52
  %43 = phi i32 [ %44, %52 ], [ %11, %38 ]
  %44 = lshr i32 %43, 1
  %45 = icmp ult i32 %5, %44
  br i1 %45, label %46, label %52

46:                                               ; preds = %42
  %47 = load double, double addrspace(3)* %40, align 8, !tbaa !16
  %48 = add nuw nsw i32 %44, %5
  %49 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ12find_maximumPdS_iPiE5cache, i32 0, i32 %48
  %50 = load double, double addrspace(3)* %49, align 8, !tbaa !16
  %51 = tail call double @llvm.maxnum.f64(double %47, double %50)
  store double %51, double addrspace(3)* %40, align 8, !tbaa !16
  br label %52

52:                                               ; preds = %46, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = icmp ult i32 %43, 4
  br i1 %53, label %54, label %42, !llvm.loop !22

54:                                               ; preds = %52, %38
  %55 = icmp eq i32 %5, 0
  br i1 %55, label %56, label %64

56:                                               ; preds = %54, %56
  %57 = cmpxchg i32 addrspace(1)* %3, i32 0, i32 1 syncscope("agent-one-as") monotonic monotonic, align 4
  %58 = extractvalue { i32, i1 } %57, 1
  br i1 %58, label %59, label %56, !llvm.loop !23

59:                                               ; preds = %56
  %60 = load double, double addrspace(1)* %1, align 8, !tbaa !16
  %61 = load double, double addrspace(3)* getelementptr inbounds ([512 x double], [512 x double] addrspace(3)* @_ZZ12find_maximumPdS_iPiE5cache, i32 0, i32 0), align 16, !tbaa !16
  %62 = tail call double @llvm.maxnum.f64(double %60, double %61)
  store double %62, double addrspace(1)* %1, align 8, !tbaa !16
  %63 = atomicrmw xchg i32 addrspace(1)* %3, i32 0 syncscope("agent-one-as") monotonic, align 4
  br label %64

64:                                               ; preds = %59, %54
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
