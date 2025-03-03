; ModuleID = '../data/hip_kernels/5586/16/main.cu'
source_filename = "../data/hip_kernels/5586/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@partialSum = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15reductionKernelPfiPd(float addrspace(1)* nocapture %0, i32 %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %8
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %21

17:                                               ; preds = %3
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !16, !amdgpu.noclobber !5
  br label %21

21:                                               ; preds = %3, %17
  %22 = phi contract float [ %20, %17 ], [ 0.000000e+00, %3 ]
  %23 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @partialSum, i32 0, i32 %14
  store float %22, float addrspace(3)* %23, align 4, !tbaa !16
  %24 = icmp ult i16 %7, 2
  br i1 %24, label %25, label %27

25:                                               ; preds = %37, %21
  %26 = icmp eq i32 %14, 0
  br i1 %26, label %39, label %64

27:                                               ; preds = %21, %37
  %28 = phi i32 [ %29, %37 ], [ %8, %21 ]
  %29 = lshr i32 %28, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp ult i32 %14, %29
  br i1 %30, label %31, label %37

31:                                               ; preds = %27
  %32 = load float, float addrspace(3)* %23, align 4, !tbaa !16
  %33 = add nuw nsw i32 %29, %14
  %34 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @partialSum, i32 0, i32 %33
  %35 = load float, float addrspace(3)* %34, align 4, !tbaa !16
  %36 = fadd contract float %32, %35
  store float %36, float addrspace(3)* %23, align 4, !tbaa !16
  br label %37

37:                                               ; preds = %27, %31
  %38 = icmp ult i32 %28, 4
  br i1 %38, label %25, label %27, !llvm.loop !20

39:                                               ; preds = %25
  %40 = load float, float addrspace(3)* %23, align 4, !tbaa !16
  %41 = sext i32 %15 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %40, float addrspace(1)* %42, align 4, !tbaa !16
  %43 = udiv i32 %11, %8
  %44 = mul i32 %43, %8
  %45 = icmp ugt i32 %11, %44
  %46 = zext i1 %45 to i32
  %47 = add i32 %43, %46
  %48 = mul i32 %47, %8
  %49 = lshr i32 %48, 1
  %50 = icmp ult i32 %49, %8
  br i1 %50, label %64, label %51

51:                                               ; preds = %39, %61
  %52 = phi i32 [ %62, %61 ], [ %49, %39 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = icmp slt i32 %15, %52
  br i1 %53, label %54, label %61

54:                                               ; preds = %51
  %55 = load float, float addrspace(1)* %42, align 4, !tbaa !16
  %56 = add nsw i32 %52, %15
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = fadd contract float %55, %59
  store float %60, float addrspace(1)* %42, align 4, !tbaa !16
  br label %61

61:                                               ; preds = %51, %54
  %62 = sdiv i32 %52, 2
  %63 = icmp ult i32 %62, %8
  br i1 %63, label %64, label %51, !llvm.loop !22

64:                                               ; preds = %61, %39, %25
  %65 = icmp eq i32 %15, 0
  br i1 %65, label %66, label %69

66:                                               ; preds = %64
  %67 = load float, float addrspace(1)* %0, align 4, !tbaa !16
  %68 = fpext float %67 to double
  store double %68, double addrspace(1)* %2, align 8, !tbaa !23
  br label %69

69:                                               ; preds = %66, %64
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = !{!24, !24, i64 0}
!24 = !{!"double", !18, i64 0}
