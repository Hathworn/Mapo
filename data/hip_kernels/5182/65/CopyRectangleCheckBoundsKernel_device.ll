; ModuleID = '../data/hip_kernels/5182/65/main.cu'
source_filename = "../data/hip_kernels/5182/65/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z30CopyRectangleCheckBoundsKernelPfiiiiiiiS_iiiif(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10, i32 %11, i32 %12, float %13) local_unnamed_addr #0 {
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !6
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = udiv i32 %22, %19
  %26 = mul i32 %25, %19
  %27 = icmp ugt i32 %22, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %24
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %32 = add i32 %30, %23
  %33 = mul i32 %32, %19
  %34 = add i32 %33, %31
  %35 = mul nsw i32 %7, %6
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %70

37:                                               ; preds = %14
  %38 = freeze i32 %34
  %39 = freeze i32 %6
  %40 = sdiv i32 %38, %39
  %41 = mul i32 %40, %39
  %42 = sub i32 %38, %41
  %43 = add nsw i32 %42, %4
  %44 = add nsw i32 %40, %5
  %45 = add nsw i32 %42, %11
  %46 = add nsw i32 %40, %12
  %47 = icmp sgt i32 %43, -1
  br i1 %47, label %48, label %62

48:                                               ; preds = %37
  %49 = icmp slt i32 %43, %2
  %50 = icmp sgt i32 %44, -1
  %51 = select i1 %49, i1 %50, i1 false
  %52 = icmp slt i32 %44, %3
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %62

54:                                               ; preds = %48
  %55 = sext i32 %1 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = mul nsw i32 %44, %2
  %58 = add nsw i32 %57, %43
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %56, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16, !amdgpu.noclobber !5
  br label %62

62:                                               ; preds = %37, %48, %54
  %63 = phi float [ %61, %54 ], [ %13, %48 ], [ %13, %37 ]
  %64 = sext i32 %9 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %8, i64 %64
  %66 = mul nsw i32 %46, %10
  %67 = add nsw i32 %66, %45
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %65, i64 %68
  store float %63, float addrspace(1)* %69, align 4, !tbaa !16
  br label %70

70:                                               ; preds = %62, %14
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
