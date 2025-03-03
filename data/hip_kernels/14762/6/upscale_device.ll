; ModuleID = '../data/hip_kernels/14762/6/main.cu'
source_filename = "../data/hip_kernels/14762/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7upscalePfS_liiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = mul i32 %10, %14
  %19 = add i32 %18, %8
  %20 = zext i32 %19 to i64
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %17, %14
  %28 = mul i32 %27, %14
  %29 = icmp ugt i32 %17, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %22, %14
  %33 = mul i32 %32, %26
  %34 = mul i32 %33, %31
  %35 = add i32 %34, %21
  %36 = zext i32 %35 to i64
  %37 = add nuw nsw i64 %36, %20
  %38 = icmp slt i64 %37, %2
  br i1 %38, label %39, label %63

39:                                               ; preds = %7
  %40 = trunc i64 %37 to i32
  %41 = freeze i32 %40
  %42 = freeze i32 %6
  %43 = sdiv i32 %41, %42
  %44 = mul i32 %43, %42
  %45 = sub i32 %41, %44
  %46 = freeze i32 %5
  %47 = sdiv i32 %43, %46
  %48 = mul i32 %47, %46
  %49 = sub i32 %43, %48
  %50 = freeze i32 %47
  %51 = sdiv i32 %45, %3
  %52 = sdiv i32 %49, %3
  %53 = sdiv i32 %5, %3
  %54 = sdiv i32 %6, %3
  %55 = mul nsw i32 %53, %50
  %56 = add nsw i32 %55, %52
  %57 = mul nsw i32 %56, %54
  %58 = add nsw i32 %57, %51
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16, !amdgpu.noclobber !6
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  store float %61, float addrspace(1)* %62, align 4, !tbaa !16
  br label %63

63:                                               ; preds = %7, %39
  ret void
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
