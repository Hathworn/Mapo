; ModuleID = '../data/hip_kernels/7964/0/main.cu'
source_filename = "../data/hip_kernels/7964/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7upscalePfS_liiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = mul i32 %13, %17
  %22 = add i32 %21, %11
  %23 = zext i32 %22 to i64
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = udiv i32 %20, %17
  %31 = mul i32 %30, %17
  %32 = icmp ugt i32 %20, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %25, %17
  %36 = mul i32 %35, %29
  %37 = mul i32 %36, %34
  %38 = add i32 %37, %24
  %39 = zext i32 %38 to i64
  %40 = add nuw nsw i64 %39, %23
  %41 = icmp slt i64 %40, %2
  br i1 %41, label %42, label %74

42:                                               ; preds = %10
  %43 = trunc i64 %40 to i32
  %44 = freeze i32 %43
  %45 = freeze i32 %9
  %46 = sdiv i32 %44, %45
  %47 = mul i32 %46, %45
  %48 = sub i32 %44, %47
  %49 = freeze i32 %8
  %50 = sdiv i32 %46, %49
  %51 = mul i32 %50, %49
  %52 = sub i32 %46, %51
  %53 = freeze i32 %7
  %54 = sdiv i32 %50, %53
  %55 = mul i32 %54, %53
  %56 = sub i32 %50, %55
  %57 = freeze i32 %54
  %58 = sdiv i32 %48, %5
  %59 = sdiv i32 %52, %4
  %60 = sdiv i32 %56, %3
  %61 = sdiv i32 %7, %3
  %62 = sdiv i32 %8, %4
  %63 = sdiv i32 %9, %5
  %64 = mul nsw i32 %61, %57
  %65 = add nsw i32 %64, %60
  %66 = mul nsw i32 %65, %62
  %67 = add nsw i32 %66, %59
  %68 = mul nsw i32 %67, %63
  %69 = add nsw i32 %68, %58
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !6
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  store float %72, float addrspace(1)* %73, align 4, !tbaa !16
  br label %74

74:                                               ; preds = %10, %42
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
