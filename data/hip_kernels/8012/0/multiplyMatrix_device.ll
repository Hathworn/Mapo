; ModuleID = '../data/hip_kernels/8012/0/main.cu'
source_filename = "../data/hip_kernels/8012/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14multiplyMatrixPfS_S_E5cache = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14multiplyMatrixPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = mul i32 %5, %10
  %15 = add i32 %14, %4
  %16 = icmp slt i32 %15, 1024
  br i1 %16, label %17, label %35

17:                                               ; preds = %3
  %18 = udiv i32 %13, %10
  %19 = mul i32 %18, %10
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %10
  br label %24

24:                                               ; preds = %17, %24
  %25 = phi i32 [ %15, %17 ], [ %26, %24 ]
  %26 = add i32 %23, %25
  %27 = icmp slt i32 %26, 1024
  br i1 %27, label %24, label %28, !llvm.loop !16

28:                                               ; preds = %24
  %29 = sext i32 %25 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !18, !amdgpu.noclobber !6
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !18, !amdgpu.noclobber !6
  %34 = fmul contract float %31, %33
  br label %35

35:                                               ; preds = %28, %3
  %36 = phi float [ %34, %28 ], [ 0.000000e+00, %3 ]
  %37 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ14multiplyMatrixPfS_S_E5cache, i32 0, i32 %4
  store float %36, float addrspace(3)* %37, align 4, !tbaa !18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp ult i16 %9, 2
  br i1 %38, label %54, label %39

39:                                               ; preds = %35
  %40 = lshr i32 %10, 1
  br label %41

41:                                               ; preds = %39, %50
  %42 = phi i32 [ %51, %50 ], [ %40, %39 ]
  %43 = icmp slt i32 %4, %42
  br i1 %43, label %44, label %50

44:                                               ; preds = %41
  %45 = add nsw i32 %42, %4
  %46 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ14multiplyMatrixPfS_S_E5cache, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !18
  %48 = load float, float addrspace(3)* %37, align 4, !tbaa !18
  %49 = fadd contract float %47, %48
  store float %49, float addrspace(3)* %37, align 4, !tbaa !18
  br label %50

50:                                               ; preds = %44, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = sdiv i32 %42, 2
  %52 = add nsw i32 %42, 1
  %53 = icmp ult i32 %52, 3
  br i1 %53, label %54, label %41, !llvm.loop !22

54:                                               ; preds = %50, %35
  %55 = icmp eq i32 %4, 0
  br i1 %55, label %56, label %60

56:                                               ; preds = %54
  %57 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ14multiplyMatrixPfS_S_E5cache, i32 0, i32 0), align 16, !tbaa !18
  %58 = zext i32 %5 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  store float %57, float addrspace(1)* %59, align 4, !tbaa !18
  br label %60

60:                                               ; preds = %56, %54
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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
