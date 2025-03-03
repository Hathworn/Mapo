; ModuleID = '../data/hip_kernels/2172/40/main.cu'
source_filename = "../data/hip_kernels/2172/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15shortcut_kerneliiiiiiiiiiPfiiiffS_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float addrspace(1)* nocapture readonly %10, i32 %11, i32 %12, i32 %13, float %14, float %15, float addrspace(1)* nocapture %16) local_unnamed_addr #0 {
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !4
  %24 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !13, !invariant.load !14
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %23, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %19
  %34 = add i32 %33, %18
  %35 = mul i32 %34, %27
  %36 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %37 = add i32 %35, %36
  %38 = icmp slt i32 %37, %0
  br i1 %38, label %39, label %79

39:                                               ; preds = %17
  %40 = freeze i32 %37
  %41 = freeze i32 %1
  %42 = sdiv i32 %40, %41
  %43 = mul i32 %42, %41
  %44 = sub i32 %40, %43
  %45 = freeze i32 %2
  %46 = sdiv i32 %42, %45
  %47 = mul i32 %46, %45
  %48 = sub i32 %42, %47
  %49 = freeze i32 %3
  %50 = sdiv i32 %46, %49
  %51 = mul i32 %50, %49
  %52 = sub i32 %46, %51
  %53 = srem i32 %50, %6
  %54 = mul nsw i32 %44, %5
  %55 = mul nsw i32 %48, %5
  %56 = mul nsw i32 %53, %13
  %57 = add nsw i32 %56, %52
  %58 = mul nsw i32 %57, %12
  %59 = add nsw i32 %58, %55
  %60 = mul nsw i32 %59, %11
  %61 = add nsw i32 %60, %54
  %62 = mul nsw i32 %44, %4
  %63 = mul nsw i32 %48, %4
  %64 = mul nsw i32 %53, %9
  %65 = add nsw i32 %64, %52
  %66 = mul nsw i32 %65, %8
  %67 = add nsw i32 %66, %63
  %68 = mul nsw i32 %67, %7
  %69 = add nsw i32 %68, %62
  %70 = sext i32 %61 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %16, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !14
  %73 = fmul contract float %72, %14
  %74 = sext i32 %69 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %10, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !14
  %77 = fmul contract float %76, %15
  %78 = fadd contract float %73, %77
  store float %78, float addrspace(1)* %71, align 4, !tbaa !16
  br label %79

79:                                               ; preds = %17, %39
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
