; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/1191/7/instance_iou_cuda_kernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/1191/7/instance_iou_cuda_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24instance_iou_cuda_kernellPKliS0_S0_S0_S0_S0_S0_Pf(i64 %0, i64 addrspace(1)* noalias nocapture readonly %1, i32 %2, i64 addrspace(1)* noalias nocapture readonly %3, i64 addrspace(1)* noalias nocapture readonly %4, i64 addrspace(1)* noalias nocapture readonly %5, i64 addrspace(1)* noalias nocapture readonly %6, i64 addrspace(1)* noalias nocapture readonly %7, i64 addrspace(1)* noalias nocapture readonly %8, float addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp slt i32 %11, %2
  br i1 %12, label %13, label %27

13:                                               ; preds = %10
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !5
  %21 = load i16, i16 addrspace(4)* %17, align 4, !range !14, !invariant.load !15
  %22 = zext i16 %21 to i32
  %23 = udiv i32 %20, %22
  %24 = mul i32 %23, %22
  %25 = icmp ugt i32 %20, %24
  %26 = zext i1 %25 to i32
  br label %28

27:                                               ; preds = %57, %10
  ret void

28:                                               ; preds = %13, %57
  %29 = phi i32 [ %11, %13 ], [ %59, %57 ]
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %30
  %32 = load i64, i64 addrspace(1)* %31, align 8, !tbaa !16, !amdgpu.noclobber !15
  %33 = trunc i64 %32 to i32
  %34 = add nsw i32 %29, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %35
  %37 = load i64, i64 addrspace(1)* %36, align 8, !tbaa !16, !amdgpu.noclobber !15
  %38 = trunc i64 %37 to i32
  %39 = shl i64 %32, 32
  %40 = ashr exact i64 %39, 32
  %41 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %40
  %42 = load i64, i64 addrspace(1)* %41, align 8, !tbaa !16, !amdgpu.noclobber !15
  %43 = getelementptr inbounds i64, i64 addrspace(1)* %7, i64 %42
  %44 = load i64, i64 addrspace(1)* %43, align 8, !tbaa !16, !amdgpu.noclobber !15
  %45 = shl i64 %44, 32
  %46 = ashr exact i64 %45, 32
  %47 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %46
  %48 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !16, !amdgpu.noclobber !15
  %49 = trunc i64 %48 to i32
  %50 = getelementptr inbounds i64, i64 addrspace(1)* %6, i64 %46
  %51 = load i64, i64 addrspace(1)* %50, align 8, !tbaa !16, !amdgpu.noclobber !15
  %52 = trunc i64 %51 to i32
  %53 = icmp slt i32 %14, %49
  br i1 %53, label %54, label %57

54:                                               ; preds = %28
  %55 = icmp slt i32 %33, %38
  %56 = mul nsw i64 %30, %0
  br label %61

57:                                               ; preds = %70, %28
  %58 = add i32 %23, %29
  %59 = add i32 %58, %26
  %60 = icmp slt i32 %59, %2
  br i1 %60, label %28, label %27, !llvm.loop !20

61:                                               ; preds = %54, %70
  %62 = phi i32 [ %14, %54 ], [ %84, %70 ]
  %63 = add nsw i32 %62, %52
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %64
  %66 = load i64, i64 addrspace(1)* %65, align 8, !tbaa !16, !amdgpu.noclobber !15
  %67 = trunc i64 %66 to i32
  br i1 %55, label %68, label %70

68:                                               ; preds = %61
  %69 = add nsw i32 %62, 1
  br label %86

70:                                               ; preds = %86, %61
  %71 = phi i32 [ 0, %61 ], [ %99, %86 ]
  %72 = sitofp i32 %71 to float
  %73 = fpext float %72 to double
  %74 = add i32 %38, %67
  %75 = add i32 %71, %33
  %76 = sub i32 %74, %75
  %77 = sitofp i32 %76 to float
  %78 = fpext float %77 to double
  %79 = fadd contract double %78, 1.000000e-05
  %80 = fdiv contract double %73, %79
  %81 = fptrunc double %80 to float
  %82 = add nsw i64 %56, %64
  %83 = getelementptr inbounds float, float addrspace(1)* %9, i64 %82
  store float %81, float addrspace(1)* %83, align 4, !tbaa !22
  %84 = add i32 %62, %22
  %85 = icmp slt i32 %84, %49
  br i1 %85, label %61, label %57, !llvm.loop !24

86:                                               ; preds = %68, %86
  %87 = phi i32 [ %33, %68 ], [ %100, %86 ]
  %88 = phi i32 [ 0, %68 ], [ %99, %86 ]
  %89 = sext i32 %87 to i64
  %90 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %89
  %91 = load i64, i64 addrspace(1)* %90, align 8, !tbaa !16, !amdgpu.noclobber !15
  %92 = shl i64 %91, 32
  %93 = ashr exact i64 %92, 32
  %94 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %93
  %95 = load i64, i64 addrspace(1)* %94, align 8, !tbaa !16, !amdgpu.noclobber !15
  %96 = trunc i64 %95 to i32
  %97 = icmp eq i32 %69, %96
  %98 = zext i1 %97 to i32
  %99 = add nuw nsw i32 %88, %98
  %100 = add nsw i32 %87, 1
  %101 = icmp slt i32 %100, %38
  br i1 %101, label %86, label %70, !llvm.loop !25
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"long", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !18, i64 0}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
