; ModuleID = '../data/hip_kernels/6546/31/main.cu'
source_filename = "../data/hip_kernels/6546/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20square_matrix_kerneliiPKfiPfi(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 16
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 8, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %0
  br i1 %19, label %20, label %39

20:                                               ; preds = %6
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !16
  %29 = mul i32 %21, %25
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %30
  %32 = icmp slt i32 %31, %1
  %33 = udiv i32 %15, %12
  %34 = mul i32 %33, %12
  %35 = icmp ugt i32 %15, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = mul i32 %37, %12
  br label %40

39:                                               ; preds = %51, %6
  ret void

40:                                               ; preds = %20, %51
  %41 = phi i32 [ %18, %20 ], [ %52, %51 ]
  br i1 %32, label %42, label %51

42:                                               ; preds = %40
  %43 = mul nsw i32 %41, %3
  %44 = mul nsw i32 %41, %5
  %45 = udiv i32 %28, %25
  %46 = mul i32 %45, %25
  %47 = icmp ugt i32 %28, %46
  %48 = zext i1 %47 to i32
  %49 = add i32 %45, %48
  %50 = mul i32 %49, %25
  br label %54

51:                                               ; preds = %54, %40
  %52 = add i32 %38, %41
  %53 = icmp slt i32 %52, %0
  br i1 %53, label %40, label %39, !llvm.loop !17

54:                                               ; preds = %42, %54
  %55 = phi i32 [ %31, %42 ], [ %64, %54 ]
  %56 = add nsw i32 %55, %43
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !19
  %60 = fmul contract float %59, %59
  %61 = add nsw i32 %55, %44
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %4, i64 %62
  store float %60, float addrspace(1)* %63, align 4, !tbaa !19
  %64 = add i32 %50, %55
  %65 = icmp slt i32 %64, %1
  br i1 %65, label %54, label %51, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!6 = !{!7, !11, i64 16}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 12}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !18}
