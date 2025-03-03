; ModuleID = '../data/hip_kernels/2766/31/main.cu'
source_filename = "../data/hip_kernels/2766/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26cudaSNearestNeighborKernelPKfmmPfmmmm(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture writeonly %3, i64 %4, i64 %5, i64 %6, i64 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 8
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %17 = add i32 %15, %16
  %18 = zext i32 %17 to i64
  %19 = mul i64 %18, %6
  %20 = uitofp i64 %2 to float
  %21 = uitofp i64 %5 to float
  %22 = fdiv contract float %20, %21
  %23 = uitofp i64 %1 to float
  %24 = uitofp i64 %4 to float
  %25 = fdiv contract float %23, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = zext i32 %26 to i64
  %28 = icmp ult i64 %27, %6
  br i1 %28, label %29, label %54

29:                                               ; preds = %8
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %31 = zext i32 %30 to i64
  %32 = icmp ult i64 %31, %5
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %34 = zext i32 %33 to i64
  %35 = icmp ult i64 %34, %4
  %36 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4
  %39 = zext i16 %38 to i64
  %40 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %41 = bitcast i8 addrspace(4)* %40 to i16 addrspace(4)*
  %42 = load i16, i16 addrspace(4)* %41, align 2
  %43 = zext i16 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %45 = bitcast i8 addrspace(4)* %44 to i32 addrspace(4)*
  %46 = load i32, i32 addrspace(4)* %45, align 4, !tbaa !7
  %47 = zext i16 %38 to i32
  %48 = udiv i32 %46, %47
  %49 = mul i32 %48, %47
  %50 = icmp ugt i32 %46, %49
  %51 = zext i1 %50 to i32
  %52 = add i32 %48, %51
  %53 = zext i32 %52 to i64
  br label %55

54:                                               ; preds = %61, %8
  ret void

55:                                               ; preds = %29, %61
  %56 = phi i64 [ %27, %29 ], [ %62, %61 ]
  br i1 %32, label %57, label %61

57:                                               ; preds = %55
  %58 = add i64 %56, %19
  %59 = mul i64 %58, %2
  %60 = mul i64 %58, %5
  br label %64

61:                                               ; preds = %74, %55
  %62 = add i64 %56, %53
  %63 = icmp ult i64 %62, %6
  br i1 %63, label %55, label %54, !llvm.loop !16

64:                                               ; preds = %57, %74
  %65 = phi i64 [ %31, %57 ], [ %75, %74 ]
  br i1 %35, label %66, label %74

66:                                               ; preds = %64
  %67 = uitofp i64 %65 to float
  %68 = fmul contract float %22, %67
  %69 = fptoui float %68 to i64
  %70 = add i64 %59, %69
  %71 = mul i64 %70, %1
  %72 = add i64 %60, %65
  %73 = mul i64 %72, %4
  br label %77

74:                                               ; preds = %77, %64
  %75 = add i64 %65, %43
  %76 = icmp ult i64 %75, %5
  br i1 %76, label %64, label %61, !llvm.loop !18

77:                                               ; preds = %66, %77
  %78 = phi i64 [ %34, %66 ], [ %87, %77 ]
  %79 = uitofp i64 %78 to float
  %80 = fmul contract float %25, %79
  %81 = fptoui float %80 to i64
  %82 = add i64 %71, %81
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !19
  %85 = add i64 %78, %73
  %86 = getelementptr inbounds float, float addrspace(1)* %3, i64 %85
  store float %84, float addrspace(1)* %86, align 4, !tbaa !19
  %87 = add i64 %78, %39
  %88 = icmp ult i64 %87, %4
  br i1 %88, label %77, label %74, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
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
!18 = distinct !{!18, !17}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !17}
