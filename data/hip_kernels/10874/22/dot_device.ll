; ModuleID = '../data/hip_kernels/10874/22/main.cu'
source_filename = "../data/hip_kernels/10874/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ3dotPfS_S_E5cache = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3dotPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
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
  %16 = icmp slt i32 %15, 1048576
  br i1 %16, label %17, label %36

17:                                               ; preds = %3
  %18 = udiv i32 %13, %10
  %19 = mul i32 %18, %10
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %10
  br label %24

24:                                               ; preds = %17, %24
  %25 = phi float [ 0.000000e+00, %17 ], [ %33, %24 ]
  %26 = phi i32 [ %15, %17 ], [ %34, %24 ]
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !6
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16, !amdgpu.noclobber !6
  %32 = fmul contract float %29, %31
  %33 = fadd contract float %25, %32
  %34 = add i32 %23, %26
  %35 = icmp slt i32 %34, 1048576
  br i1 %35, label %24, label %36, !llvm.loop !20

36:                                               ; preds = %24, %3
  %37 = phi float [ 0.000000e+00, %3 ], [ %33, %24 ]
  %38 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ3dotPfS_S_E5cache, i32 0, i32 %4
  store float %37, float addrspace(3)* %38, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ult i16 %9, 2
  br i1 %39, label %55, label %40

40:                                               ; preds = %36
  %41 = lshr i32 %10, 1
  br label %42

42:                                               ; preds = %40, %51
  %43 = phi i32 [ %52, %51 ], [ %41, %40 ]
  %44 = icmp slt i32 %4, %43
  br i1 %44, label %45, label %51

45:                                               ; preds = %42
  %46 = add nsw i32 %43, %4
  %47 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ3dotPfS_S_E5cache, i32 0, i32 %46
  %48 = load float, float addrspace(3)* %47, align 4, !tbaa !16
  %49 = load float, float addrspace(3)* %38, align 4, !tbaa !16
  %50 = fadd contract float %48, %49
  store float %50, float addrspace(3)* %38, align 4, !tbaa !16
  br label %51

51:                                               ; preds = %45, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = sdiv i32 %43, 2
  %53 = add nsw i32 %43, 1
  %54 = icmp ult i32 %53, 3
  br i1 %54, label %55, label %42, !llvm.loop !22

55:                                               ; preds = %51, %36
  %56 = icmp eq i32 %4, 0
  br i1 %56, label %57, label %61

57:                                               ; preds = %55
  %58 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ3dotPfS_S_E5cache, i32 0, i32 0), align 16, !tbaa !16
  %59 = zext i32 %5 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  store float %58, float addrspace(1)* %60, align 4, !tbaa !16
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
