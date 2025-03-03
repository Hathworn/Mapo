; ModuleID = '../data/hip_kernels/15412/84/main.cu'
source_filename = "../data/hip_kernels/15412/84/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21input_shortcut_kernelPfiiiiiiiiiiS_iiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, float addrspace(1)* nocapture readonly %11, i32 %12, i32 %13, i32 %14, float addrspace(1)* nocapture writeonly %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !4
  %23 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !13, !invariant.load !14
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %22, %26
  %28 = mul i32 %27, %26
  %29 = icmp ugt i32 %22, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %18
  %33 = add i32 %32, %17
  %34 = mul i32 %33, %26
  %35 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %36 = add i32 %34, %35
  %37 = icmp slt i32 %36, %1
  br i1 %37, label %38, label %77

38:                                               ; preds = %16
  %39 = freeze i32 %36
  %40 = freeze i32 %2
  %41 = sdiv i32 %39, %40
  %42 = mul i32 %41, %40
  %43 = sub i32 %39, %42
  %44 = freeze i32 %3
  %45 = sdiv i32 %41, %44
  %46 = mul i32 %45, %44
  %47 = sub i32 %41, %46
  %48 = freeze i32 %4
  %49 = sdiv i32 %45, %48
  %50 = mul i32 %49, %48
  %51 = sub i32 %45, %50
  %52 = srem i32 %49, %7
  %53 = mul nsw i32 %43, %6
  %54 = mul nsw i32 %47, %6
  %55 = mul nsw i32 %52, %14
  %56 = add nsw i32 %55, %51
  %57 = mul nsw i32 %56, %13
  %58 = add nsw i32 %57, %54
  %59 = mul nsw i32 %58, %12
  %60 = add nsw i32 %59, %53
  %61 = mul nsw i32 %43, %5
  %62 = mul nsw i32 %47, %5
  %63 = mul nsw i32 %52, %10
  %64 = add nsw i32 %63, %51
  %65 = mul nsw i32 %64, %9
  %66 = add nsw i32 %65, %62
  %67 = mul nsw i32 %66, %8
  %68 = add nsw i32 %67, %61
  %69 = sext i32 %60 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16, !amdgpu.noclobber !14
  %72 = sext i32 %68 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %11, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16, !amdgpu.noclobber !14
  %75 = fadd contract float %71, %74
  %76 = getelementptr inbounds float, float addrspace(1)* %15, i64 %69
  store float %75, float addrspace(1)* %76, align 4, !tbaa !16
  br label %77

77:                                               ; preds = %16, %38
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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
