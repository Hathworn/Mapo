; ModuleID = '../data/hip_kernels/4156/11/main.cu'
source_filename = "../data/hip_kernels/4156/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8copy_memPhS_(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !5
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !14, !invariant.load !15
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %8, %21
  %23 = add i32 %22, %3
  %24 = shl i32 %23, 5
  %25 = add i32 %24, %4
  %26 = mul nsw i32 %25, 3
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %27
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %27
  store i8 %29, i8 addrspace(1)* %30, align 1, !tbaa !16
  %31 = add nsw i32 %26, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !16
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %32
  store i8 %34, i8 addrspace(1)* %35, align 1, !tbaa !16
  %36 = add nsw i32 %26, 2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !16
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %37
  store i8 %39, i8 addrspace(1)* %40, align 1, !tbaa !16
  %41 = add nsw i32 %8, 8
  %42 = mul i32 %41, %21
  %43 = add i32 %42, %3
  %44 = shl i32 %43, 5
  %45 = add i32 %44, %4
  %46 = mul nsw i32 %45, 3
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !16
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %47
  store i8 %49, i8 addrspace(1)* %50, align 1, !tbaa !16
  %51 = add nsw i32 %46, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %52
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !16
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %52
  store i8 %54, i8 addrspace(1)* %55, align 1, !tbaa !16
  %56 = add nsw i32 %46, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !16
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %57
  store i8 %59, i8 addrspace(1)* %60, align 1, !tbaa !16
  %61 = add nsw i32 %8, 16
  %62 = mul i32 %61, %21
  %63 = add i32 %62, %3
  %64 = shl i32 %63, 5
  %65 = add i32 %64, %4
  %66 = mul nsw i32 %65, 3
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %67
  %69 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !16
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %67
  store i8 %69, i8 addrspace(1)* %70, align 1, !tbaa !16
  %71 = add nsw i32 %66, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %72
  %74 = load i8, i8 addrspace(1)* %73, align 1, !tbaa !16
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %72
  store i8 %74, i8 addrspace(1)* %75, align 1, !tbaa !16
  %76 = add nsw i32 %66, 2
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %77
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !16
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %77
  store i8 %79, i8 addrspace(1)* %80, align 1, !tbaa !16
  %81 = add nsw i32 %8, 24
  %82 = mul i32 %81, %21
  %83 = add i32 %82, %3
  %84 = shl i32 %83, 5
  %85 = add i32 %84, %4
  %86 = mul nsw i32 %85, 3
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %87
  %89 = load i8, i8 addrspace(1)* %88, align 1, !tbaa !16
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %87
  store i8 %89, i8 addrspace(1)* %90, align 1, !tbaa !16
  %91 = add nsw i32 %86, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %92
  %94 = load i8, i8 addrspace(1)* %93, align 1, !tbaa !16
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %92
  store i8 %94, i8 addrspace(1)* %95, align 1, !tbaa !16
  %96 = add nsw i32 %86, 2
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %97
  %99 = load i8, i8 addrspace(1)* %98, align 1, !tbaa !16
  %100 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %97
  store i8 %99, i8 addrspace(1)* %100, align 1, !tbaa !16
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
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
