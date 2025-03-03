; ModuleID = '../data/hip_kernels/977/9/main.cu'
source_filename = "../data/hip_kernels/977/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL14timedReductionPKfPfPl = comdat any

@shared = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL14timedReductionPKfPfPl(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 comdat {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = icmp eq i32 %4, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %3
  %8 = tail call i64 @llvm.amdgcn.s.memtime()
  %9 = sext i32 %5 to i64
  %10 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %9
  store i64 %8, i64 addrspace(1)* %10, align 8, !tbaa !5
  br label %11

11:                                               ; preds = %7, %3
  %12 = zext i32 %4 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !9
  %15 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 %4
  store float %14, float addrspace(3)* %15, align 4, !tbaa !9
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !11, !invariant.load !12
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !13
  %24 = add nuw nsw i32 %4, %20
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !9
  %28 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 %24
  store float %27, float addrspace(3)* %28, align 4, !tbaa !9
  br label %30

29:                                               ; preds = %40
  br i1 %6, label %43, label %47

30:                                               ; preds = %11, %40
  %31 = phi i32 [ %20, %11 ], [ %41, %40 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = icmp ult i32 %4, %31
  br i1 %32, label %33, label %40

33:                                               ; preds = %30
  %34 = load float, float addrspace(3)* %15, align 4, !tbaa !9
  %35 = add nuw nsw i32 %31, %4
  %36 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 %35
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !9
  %38 = fcmp contract olt float %37, %34
  br i1 %38, label %39, label %40

39:                                               ; preds = %33
  store float %37, float addrspace(3)* %15, align 4, !tbaa !9
  br label %40

40:                                               ; preds = %33, %39, %30
  %41 = lshr i32 %31, 1
  %42 = icmp ult i32 %31, 2
  br i1 %42, label %29, label %30, !llvm.loop !22

43:                                               ; preds = %29
  %44 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 0), align 4, !tbaa !9
  %45 = sext i32 %5 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  store float %44, float addrspace(1)* %46, align 4, !tbaa !9
  br label %47

47:                                               ; preds = %43, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %6, label %48, label %58

48:                                               ; preds = %47
  %49 = tail call i64 @llvm.amdgcn.s.memtime()
  %50 = udiv i32 %23, %20
  %51 = mul i32 %50, %20
  %52 = icmp ugt i32 %23, %51
  %53 = zext i1 %52 to i32
  %54 = add i32 %50, %5
  %55 = add i32 %54, %53
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %56
  store i64 %49, i64 addrspace(1)* %57, align 8, !tbaa !5
  br label %58

58:                                               ; preds = %48, %47
  ret void
}

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memtime() #1

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nounwind willreturn }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = !{i16 1, i16 1025}
!12 = !{}
!13 = !{!14, !18, i64 12}
!14 = !{!"hsa_kernel_dispatch_packet_s", !15, i64 0, !15, i64 2, !15, i64 4, !15, i64 6, !15, i64 8, !15, i64 10, !18, i64 12, !18, i64 16, !18, i64 20, !18, i64 24, !18, i64 28, !19, i64 32, !20, i64 40, !19, i64 48, !21, i64 56}
!15 = !{!"short", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !{!"int", !16, i64 0}
!19 = !{!"long", !16, i64 0}
!20 = !{!"any pointer", !16, i64 0}
!21 = !{!"hsa_signal_s", !19, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
